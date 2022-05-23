Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9652C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:22:13 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.25594.1653297723289908469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 02:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QXZI3/9V;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a23so16426264ljd.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 02:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaykth/7i7PRULfU6JTU3DTCb8DEgWo0kK3qXknhws0=;
        b=QXZI3/9Vc7vVkvT3UTwJXn1U4RFkuAQpHyS6kFDHtKCdZL1fHhoUUCRZBAvjF+jyMS
         nFbJ1u+NniGYcBWijq9jdxbBbJRP2eu/SQqOQfv5SiOKi0xXkY4ZxTDHDS/SxEQabnhM
         3A1oHQiWtaAmQTEYbjHDPX6pYtkZpdEjnXwOjU64pZvgTGKXxTg8Fb4kdGYpcgf0T/n6
         AoJoArkD6Pa8J1bEbZSWi8zW5OuCpqVytKWmFeHv4uXjyT7B3yGOVOX5DcXf79j4lOCI
         tobmfadXjuIGmmsws8KdEbB4i/pNe2CO1rhAVkgK4iA6lK1H0h4tEQEsDQM3ys5cPmH7
         oAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaykth/7i7PRULfU6JTU3DTCb8DEgWo0kK3qXknhws0=;
        b=jnXKOcjlz1PWgLyXzucYqIfgzTA04EP+mKJnbXJi1Bv/HqXJ7HMQhrlI+1ZuteFUMM
         5xjoyU+q2d2DdkDBCmspYIAZOA4LWVmJt+t/RfYQ3hdmaqZUFZRvKrRfpKNhuoeWC5Uf
         5x3LYiZa+9lYFq2CAv/pkqQOHh6KoPPVe6Sr4XokAh3LMw14lHi4j9Sg52z5q+Hh29gr
         RhM+A5NoC5HcjdIr2JEh6sH0S9sRR/02zydfpd1vZ91LkZg7UzCLqQyrVB66wnWLY6W7
         AsMMqRwC9FY++01hxbmRFg2G0sqANyLEbZ12+wn5QPdeMFooZ2q6GEkbBZOKIVWWVTHc
         bg6w==
X-Gm-Message-State: AOAM532gBDmxQ+rqEmXuuBg1MvDrTswek/uJx91us8nnA+XxnkbaE82s
	LR6w537zhm6OKGw86SH8UvrpSMhPQxHLkE/YHms=
X-Google-Smtp-Source: 
 ABdhPJxDseYGc0l6DuhlP6/BJAjwkvp5CIKfbN7YCtDyrZoTV57TB80mrfasJIurDvAAiZUgAf5KvO1NU3JrnaEqcTM=
X-Received: by 2002:a2e:9810:0:b0:253:eceb:2001 with SMTP id
 a16-20020a2e9810000000b00253eceb2001mr1859151ljj.109.1653297721255; Mon, 23
 May 2022 02:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <1653288813-3748-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj_f-wQqQ=mXHFwY57qjvvo6JXE73X2gyk7v-GjQAkHuTg@mail.gmail.com>
 <OS0PR01MB6178939BA9278DC29B898EAFA0D49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB6178939BA9278DC29B898EAFA0D49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 May 2022 11:21:49 +0200
Message-ID: 
 <CANNYZj9pJJ_KydmkPbFeWd55P4pc4JeTzwD-x3QBTEW8eFbvSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gnutls: Added fips option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 09:22:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166004

Thanks; can you resend the change with the link in the patch file just
above the Upstream-Status line?

Alex

On Mon, 23 May 2022 at 10:11, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
>
> Hi, Alex
>
> > Has the issue been raised with upstream? Would be good to include a link to that
> > into the patch: any new 'inappropriate' patch is a support burden.
>
> I know, and I has submitted this issue:
> https://gitlab.com/gnutls/gnutls/-/issues/1373
>
> Best regards
> Lei
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Monday, May 23, 2022 3:10 PM
> > To: Lei, Maohui <leimaohui@fujitsu.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH v3] gnutls: Added fips option.
> >
> > Has the issue been raised with upstream? Would be good to include a link to that
> > into the patch: any new 'inappropriate' patch is a support burden.
> >
> > Alex
> >
> > On Mon, 23 May 2022 at 08:53, leimaohui <leimaohui@fujitsu.com> wrote:
> > >
> > > - Added a patch to avoid excute fipshmac command. Because *.hmac file
> > > should be created on target instead of on build environment.
> > > - Added pkg_postinst_ontarget to make sure necessary files are created
> > > on target.
> > >
> > > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > ---
> > >  ...ile-should-be-excuted-in-target-envi.patch | 28 +++++++++++++++++++
> > >  meta/recipes-support/gnutls/gnutls_3.7.5.bb   | 24 +++++++++++++++-
> > >  2 files changed, 51 insertions(+), 1 deletion(-)  create mode 100644
> > > meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-
> > > excuted-in-target-envi.patch
> > >
> > > diff --git
> > > a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-b
> > > e-excuted-in-target-envi.patch
> > > b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-b
> > > e-excuted-in-target-envi.patch
> > > new file mode 100644
> > > index 0000000000..7a0e2fd474
> > > --- /dev/null
> > > +++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-shou
> > > +++ ld-be-excuted-in-target-envi.patch
> > > @@ -0,0 +1,28 @@
> > > +From b729a356538d499fe25e82bfc78ea663bdaca0a8 Mon Sep 17 00:00:00
> > > +2001
> > > +From: Lei Maohui <leimaohui@fujitsu.com>
> > > +Date: Mon, 23 May 2022 10:44:43 +0900
> > > +Subject: [PATCH] Creating .hmac file should be excuted in target
> > > +environment,  so deleted it from build process.
> > > +
> > > +Upstream-Status: Inappropriate [Embedded]
> > > +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > +---
> > > + lib/Makefile.am | 3 +--
> > > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > > +
> > > +diff --git a/lib/Makefile.am b/lib/Makefile.am index 0b43ef9..cf263f0
> > > +100644
> > > +--- a/lib/Makefile.am
> > > ++++ b/lib/Makefile.am
> > > +@@ -206,8 +206,7 @@ hmac_files = .libs/.gnutls.hmac
> > > +
> > > + all-local: $(hmac_files)
> > > +
> > > +-.libs/.gnutls.hmac: libgnutls.la fipshmac
> > > +-      $(AM_V_GEN) $(builddir)/fipshmac > $@-t && mv $@-t $@
> > > ++.libs/.gnutls.hmac:
> > > +
> > > + CLEANFILES = $(hmac_files)
> > > + endif
> > > +--
> > > +2.25.1
> > > diff --git a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> > > b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> > > index 5feedb7fdc..b796494b8d 100644
> > > --- a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> > > +++ b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> > > @@ -21,6 +21,7 @@ SHRT_VER =
> > "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> > >
> > >  SRC_URI =
> > "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
> > >             file://arm_eabi.patch \
> > > +
> > > + file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.pat
> > > + ch \
> > >             "
> > >
> > >  SRC_URI[sha256sum] =
> > "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
> > > @@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] =
> > "--with-idn,--without-idn,libidn2"
> > >  PACKAGECONFIG[libtasn1] =
> > "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
> > >  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
> > >  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> > > +PACKAGECONFIG[fips] = "--enable-fips140-mode
> > --with-libdl-prefix=${STAGING_BASELIBDIR}"
> > >
> > >  EXTRA_OECONF = " \
> > >      --enable-doc \
> > > @@ -59,10 +61,30 @@ do_configure:prepend() {
> > >         done
> > >  }
> > >
> > > -PACKAGES =+ "${PN}-openssl ${PN}-xx"
> > > +do_install:append:class-target() {
> > > +        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)};
> > then
> > > +          install -d ${D}${bindir}/bin
> > > +          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
> > > +        fi
> > > +}
> > > +
> > > +PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
> > >
> > >  FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
> > >  FILES:${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
> > >  FILES:${PN}-xx = "${libdir}/libgnutlsxx.so.*"
> > > +FILES:${PN}-fips = "${bindir}/fipshmac"
> > >
> > >  BBCLASSEXTEND = "native nativesdk"
> > > +
> > > +pkg_postinst_ontarget:${PN}-fips () {
> > > +    if test -x ${bindir}/fipshmac
> > > +    then
> > > +        mkdir ${sysconfdir}/gnutls
> > > +        touch ${sysconfdir}/gnutls/config
> > > +        ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* >
> > ${libdir}/.libgnutls.so.30.hmac
> > > +        ${bindir}/fipshmac ${libdir}/libnettle.so.8.* >
> > ${libdir}/.libnettle.so.8.hmac
> > > +        ${bindir}/fipshmac ${libdir}/libgmp.so.10.*.* >
> > ${libdir}/.libgmp.so.10.hmac
> > > +        ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* >
> > ${libdir}/.libhogweed.so.6.hmac
> > > +    fi
> > > +}
> > > --
> > > 2.25.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#165996):
> > > https://lists.openembedded.org/g/openembedded-core/message/165996
> > > Mute This Topic: https://lists.openembedded.org/mt/91283368/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

