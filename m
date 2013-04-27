Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UW1PK-0002XZ-13 for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 11:27:05 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3R9ASjm005879; Sat, 27 Apr 2013 10:10:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qhhOZgQnsn5b; Sat, 27 Apr 2013 10:10:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3R9ALDg005869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 27 Apr 2013 10:10:23 +0100
Message-ID: <1367053734.29677.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sat, 27 Apr 2013 10:08:54 +0100
In-Reply-To: <6907890.oTRpLvAECS@helios>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
	<6907890.oTRpLvAECS@helios>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Sat, 27 Apr 2013 09:27:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-04-27 at 09:34 +0100, Paul Eggleton wrote:
> On Friday 26 April 2013 12:30:38 Phil Blundell wrote:
> > There doesn't appear to be any compelling reason for these tasks to be
> > nostamp and having them re-run on every build can be irritating (for
> > example, when the image is an initramfs which your kernel image depends
> > on).
> > 
> > Signed-off-by: Phil Blundell <philb@gnu.org>
> > ---
> >  meta/classes/image.bbclass |    2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index ffb372a..667d03d 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -168,11 +168,9 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s:
> > "locale-base-%s" % s, d.getVar('IM
> > 
> >  PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
> > 
> > -do_rootfs[nostamp] = "1"
> >  do_rootfs[dirs] = "${TOPDIR} ${WORKDIR}/intercept_scripts"
> >  do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> >  do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
> > -do_build[nostamp] = "1"
> > 
> >  # Must call real_do_rootfs() from inside here, rather than as a separate
> >  # task, so that we have a single fakeroot context for the whole process.
> 
> I have to say I'm not in favour of this. AFAIK these tasks have always been 
> nostamp, and I'm not sure making do_build is going to help for the case you 
> cite because the dependency on INITRD_IMAGE is on do_rootfs.
> 
> If you're concerned about your initramfs image rebuilding when building the 
> main image, what happens if you specify do_rootfs[nostamp] = "0" ?

I think this deserves some further thought. It is a pretty major change
however it is something I've wondered about for a while independently of
Phil, I've just never proposed a patch.

It might help to think about this in an alternative way. Before we has
the sstate checksums, it was near impossible to know when the inputs to
an image had changed and when they had not. Now with the sstate
checksums, we can know when any given input has changed and if it has
changed, the sstate checksum changes and the task re-runs.

You can therefore make the case that these "nostamp" tasks are a legacy
of the former world and that now, there is no compelling reason to have
them as nostamp. If you particularly want to force them to run, we do
have the -f option and its tainting works here just as well as it does
anywhere else.

If the rootfs nostamp is removed, there is no reason to have build as a
nostamp either, they were there as a pair.

Further thoughts?

Cheers,

Richard



