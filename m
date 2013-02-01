Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U1CU9-0006nQ-PW for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 10:00:41 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r118nWuQ021239; Fri, 1 Feb 2013 08:49:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dVs2Kq7SzeKs; Fri,  1 Feb 2013 08:49:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r118nR5Q021232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Feb 2013 08:49:30 GMT
Message-ID: <1359708270.14071.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 01 Feb 2013 08:44:30 +0000
In-Reply-To: <510B76CB.1080501@linux.intel.com>
References: <1359462686-13304-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<510B76CB.1080501@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Flex: use proper m4 binary on target
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
X-List-Received-Date: Fri, 01 Feb 2013 09:00:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-02-01 at 00:03 -0800, Saul Wold wrote:
> On 01/29/2013 04:31 AM, Marcin Juszkiewicz wrote:
> > flex tries to execute:
> >
> > /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/m4
> >
> > As workaround you can:
> >
> > mkdir -p /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
> > ln -s /usr/bin/m4 /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
> >
> > So this is a bug how OE builds flex.
> >
> > flex tries to execute:
> >
> > /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/m4
> >
> > As workaround you can:
> >
> > mkdir -p /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
> > ln -s /usr/bin/m4 /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
> >
> > So this is a bug how OE builds flex.
> >
> > https://bugs.launchpad.net/linaro-aarch64/+bug/1106865
> >
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > ---
> >   meta/recipes-devtools/flex/flex.inc | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> > index 472813b..517db16 100644
> > --- a/meta/recipes-devtools/flex/flex.inc
> > +++ b/meta/recipes-devtools/flex/flex.inc
> > @@ -10,6 +10,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
> >
> >   inherit autotools gettext
> >
> > -do_install_append_class-native() {
> > -	create_wrapper ${D}/${bindir}/flex M4=${STAGING_BINDIR_NATIVE}/m4
> > +M4 = "${bindir}/m4"
> > +M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
> > +
> > +do_install_append() {
> > +	create_wrapper ${D}/${bindir}/flex M4=${M4}
> >   }
> >
> 
> I think this patch is causing the following issue, I am not sure why 
> it's showing up now, and it seems to be related to creating docs for the 
> -native.
> 
> Sau!
> 
> > ERROR: Function failed: do_install (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/temp/log.do_install.3109 for further information)

I think its from the 2.5.37 upgrade which I replied to. I already
dropped that upgrade from master-next.

Cheers,

Richard



