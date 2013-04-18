Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USsS8-0000dO-Ma for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 19:16:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IGxsI3018829; Thu, 18 Apr 2013 17:59:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N0aC6wNAt97x; Thu, 18 Apr 2013 17:59:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IGxlSZ018817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 18 Apr 2013 17:59:48 +0100
Message-ID: <1366304346.10502.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 18 Apr 2013 17:59:06 +0100
In-Reply-To: <51700CF8.5030600@windriver.com>
References: <1366295248-7766-1-git-send-email-bogdan.a.marinescu@intel.com>
	<51700760.7000204@windriver.com> <51700CF8.5030600@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm.bbclass: fix /etc/rpm/platform generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 17:17:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-18 at 10:10 -0500, Mark Hatle wrote:
> On 4/18/13 9:46 AM, Mark Hatle wrote:
> > On 4/18/13 9:27 AM, Bogdan Marinescu wrote:
> >> For some platforms (for example emenlow) the RPM installer prefers
> >> an invalid package architecture (for example i586 over core2) because
> >> /etc/rpm/platform is not properly generated (for example, i586 is
> >> listed before core2 in /etc/rpm/platform).
> >>
> >> [YOCTO #3864]
> >>
> >> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >> ---
> >>    meta/classes/package_rpm.bbclass |    1 -
> >>    1 file changed, 1 deletion(-)
> >>
> >> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> >> index 3a29976..1bee4b1 100644
> >> --- a/meta/classes/package_rpm.bbclass
> >> +++ b/meta/classes/package_rpm.bbclass
> >> @@ -276,7 +276,6 @@ package_install_internal_rpm () {
> >>    		# Setup base system configuration
> >>    		echo "Note: configuring RPM platform settings"
> >>    		mkdir -p ${target_rootfs}/etc/rpm/
> >> -		echo "$INSTALL_PLATFORM_RPM" > ${target_rootfs}/etc/rpm/platform
> >
> > I think this is wrong.  The /etc/rpm/platform file's first line is supposed to
> > be the equivalent of: [uname -m]-vendor-os.   While uname -m doesn't match our
> > tune namings, the concept is the same.  The first line simply defines the "tune"
> > of the platform, subsequent lines define alternative names that will run on this
> > system.
> >
> > The INSTALL_PLATFORM_RPM value should be the expected value for the platform as
> > a whole, as it's the default tune value.  (Default tune value is expected to be
> > the most accurate value.
> >
> > Looking at the defect:
> >
> > i586-poky-linux
> > emenlow-.*-linux
> > core2-.*-linux
> > i686-.*-linux
> > i586-.*-linux
> > i486-.*-linux
> > i386-.*-linux
> > x86-.*-linux
> > noarch-.*-linux.*
> > any-.*-linux.*
> > all-.*-linux.*
> >
> > The default tune value for that machine was set to i586 by "something".
> >
> > INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr - _)${TARGET_VENDOR}-${TARGET_OS}"
> >
> > ${TARGET_ARCH} is similar to the output of uname -m.  The error is that this
> > particular BSP should have returned 'core2' as the TARGET_ARCH from what I can tell.
> >
> > Default for TARGET_ARCH is: TARGET_ARCH = "${TUNE_ARCH}"
> >
> > So the TUNE_ARCH is being set to i586.  So the end result is..  Is 'TUNE_ARCH'
> > set to i586 appropriate?  It probably is, because the majority of the system
> > seems to have a limited set of expected values for TARGET_ARCH.
> >
> > So, perhaps the right fix is instead of using 'TARGET_ARCH' in
> > INSTALL_PLATFORM_RPM, 'TUNE_PKGARCH_${DEFAULTTUNE}' may be more appropriate.
> >
> > I'd suggest trying that.  (But the first line is the system architecture,
> > following lines are alternative packages that are considered compatible.)
> 
> Forgot one thing.  The first line must be fully expanded.  Subsequent lines are 
> regex matched by the system.

We have a problem here since the machine specific packages are meant to
be preferred over the "tune" specific ones by definition of the way OE
has long since worked, the structure of the PACKAGE_ARCHS variable and
so on. 

As I understand it, this will not happen with this file setup in this
way.

Cheers,

Richard





