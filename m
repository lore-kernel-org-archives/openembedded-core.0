Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2909.1588881433203664872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 12:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BE5040C8F;
	Thu,  7 May 2020 19:57:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKYajWonER0e; Thu,  7 May 2020 19:57:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F04AA40C89;
	Thu,  7 May 2020 19:57:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1BB851730E6; Thu,  7 May 2020 15:57:09 -0400 (EDT)
Date: Thu, 7 May 2020 15:57:09 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ovidiu Panait <ovidiu.panait@windriver.com>
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
Message-ID: <20200507195709.GD11927@denix.org>
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
 <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
 <01ab6569-2e2e-1569-d3be-930f4a6037d7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <01ab6569-2e2e-1569-d3be-930f4a6037d7@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 12:44:15PM -0700, Khem Raj wrote:
> 
> 
> On 5/3/20 3:51 PM, Steve Sakoman wrote:
> > Should I consider these two patches for dunfell LTS?
> > 
> 
> Yes I think they are fixing a problem and are safe.

I don't think it is safe though!

The code has been moved to create_sdk_files() which is a POSTPROCESS command 
for SDK creation. What if SDK already provides own /etc/ld.so.conf? The code 
just simply overwrites it.

-- 
Denys


> > Thanks!
> > 
> > Steve
> > 
> > On Tue, Apr 28, 2020 at 2:59 AM Ovidiu Panait
> > <ovidiu.panait@windriver.com> wrote:
> >>
> >> Extend the functionality provided by commit [1] to the SDK as well. This way we
> >> can make sure that nativesdk-binutils finds SDK libraries first rather than
> >> host ones.
> >>
> >> This is useful for example when trying to build the linux kernel using
> >> nativesdk-gcc. This scenario currently fails because it tries to link to host
> >> libraries rather than SDK host ones:
> >>
> >> make x86_64_defconfig
> >> make bzImage
> >> ...
> >> error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel
> >> Makefile:1101: recipe for target 'prepare-objtool' failed
> >> make: *** [prepare-objtool] Error 1
> >> ....
> >> /../../../../x86_64-wrlinuxsdk-linux/bin/ld: /lib/x86_64-linux-gnu/libpthread.so.0: undefined reference to `__libc_vfork@GLIBC_PRIVATE'
> >> ...
> >>
> >> [1] 15049c610b [buildtools-tarball: Add an ld.so.conf for nativesdk-binutils]
> >>
> >> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> >> ---
> >>  meta/classes/populate_sdk_base.bbclass       | 5 +++++
> >>  meta/recipes-core/meta/buildtools-tarball.bb | 4 ----
> >>  2 files changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> >> index ef0d8bef58..6a1ebc8c02 100644
> >> --- a/meta/classes/populate_sdk_base.bbclass
> >> +++ b/meta/classes/populate_sdk_base.bbclass
> >> @@ -185,6 +185,11 @@ fakeroot create_sdk_files() {
> >>         # Escape special characters like '+' and '.' in the SDKPATH
> >>         escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
> >>         sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
> >> +
> >> +       mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
> >> +       echo '${SDKPATHNATIVE}${libdir}
> >> +${SDKPATHNATIVE}${base_libdir}
> >> +include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
> >>  }
> >>
> >>  python check_sdk_sysroots() {
> >> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> >> index 977b6a5e1d..c49802eef8 100644
> >> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> >> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> >> @@ -76,10 +76,6 @@ create_sdk_files_append () {
> >>         echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
> >>         echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
> >>
> >> -       mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
> >> -       echo '${SDKPATHNATIVE}${libdir}
> >> -${SDKPATHNATIVE}${base_libdir}
> >> -include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
> >>         if [ "${SDKMACHINE}" = "i686" ]; then
> >>                 echo 'export NO32LIBS="0"' >>$script
> >>                 echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
> >> --
> >> 2.17.1
> >>
> >>
> >>
> >> 

> 

