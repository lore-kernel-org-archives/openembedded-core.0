Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 138606E903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 08:31:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1C8Va73032204; Wed, 12 Feb 2014 08:31:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5WX1lRCQcNms; Wed, 12 Feb 2014 08:31:36 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1C8VXaQ032189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 12 Feb 2014 08:31:34 GMT
Message-ID: <1392193887.7120.191.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Wed, 12 Feb 2014 08:31:27 +0000
In-Reply-To: <52FB2ADF.70209@linaro.org>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<52FB2ADF.70209@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Feb 2014 08:31:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-12 at 09:03 +0100, Koen Kooi wrote:
> On 01/15/2014 11:15 AM, Koen Kooi wrote:
> > I've limited it to 64bit targets, but to be honest debug splitting doesn't make sense for grub since it won't run in your rootfs and attaching gdb is pretty much impossible.
> >
> > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > ---
> >   meta/recipes-bsp/grub/grub_git.bb | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
> > index 1796e7f..bc79cfa 100644
> > --- a/meta/recipes-bsp/grub/grub_git.bb
> > +++ b/meta/recipes-bsp/grub/grub_git.bb
> > @@ -51,8 +51,13 @@ do_configure_prepend() {
> >   do_install_append () {
> >       install -d ${D}${sysconfdir}/grub.d
> >       install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
> > +
> >   }
> >
> > +# debugedit chokes on 64 bit platforms
> > +INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 = "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 = "1"
> > +
> >   RDEPENDS_${PN} = "diffutils freetype"
> >   FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
> >
> >
> 
> Since the package.bbclass change went in yesterday: ping

Should we just do this for 64 bit targets or should we be doing it
unconventionally?

Cheers,

Richard



