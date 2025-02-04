Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7FAC02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:42:07 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.114583.1738669318023594080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLiBTCln;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso43672336d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 03:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738669317; x=1739274117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MhKgv5XkTir2wtKNAI0krZUsHu8xYB+Eopb/dA+n87o=;
        b=iLiBTClnsXk31C3akHdT48qqw1Ew/r/jLbw123hQ/q8o1WV76OxExwin1I6mlWMdSE
         2USkXTv3Z+pVBP6prCXGLlHn6XCou+c1/N2wNOabL19jYWzEvkHAsx65Yc6Ml8bPNm9h
         UHcqRH1djbOhBsZbCAgzEO92AoF2j7QT5VLRTM7MTqUgj+KexTgCEFetOWpNkDYV2lOH
         EMmRF5Io89UdNrBZmPKOgQ7moyw44b/XiG99vFwUeSbRxRsBhdIAI1KUoUNdvUkCiamG
         uonGRBk2EJzQifEQgdv7YVXKqcM87+5wRKgSSeXasAOe/0IZW+DV2Rb6F+UZreJh0VdW
         s1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669317; x=1739274117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhKgv5XkTir2wtKNAI0krZUsHu8xYB+Eopb/dA+n87o=;
        b=iWDf2SFaWszlvWYuGLY0PXMbPZrRFCumlO6/wGrRML7TkjTFkW08Mq751i6lcU5eAf
         +3i9Mc6gG63TQu4Optknk4wDK5mNJZVHY2n8tfgDq6W/UVgz4XIGIIyrjPs+rAif78I+
         Ne7CsZ+PBfMJV1pxUJ+MBoyDLeen4E2JCCbvitgeea0L90qhN3g8Fgz3rQcyqxUwG6dz
         HtitxNtNmB9xDj65S80R0/rIdPNc54S5a82TH98PtDASei6QhnOwcGlKD0Bq7RpYvn71
         38/A/gamnpWi62oPDWaiklB5bQU6RFQSOTSWKhnyXsmZZgaR1N3nc/SSSafAmsrz1eug
         F9aQ==
X-Gm-Message-State: AOJu0Yyr9Due5HzHm8IeqAi987LrXClYKPbyuiE2/Mz8klBEQt/EC6AY
	1RKSnzTAzuJuvjtJ4SGrR4smVphS27ArFQbxLEU+RKzdMoLj3MwGa4jF7RHTHWOqtkskAl0aqMl
	jhnk3EnvIC7uMHYOpEiz9DBi4wlXO3w==
X-Gm-Gg: ASbGnctZ5FXubogGx0CVL+Wz/iYZOcmgKRXo0V+1hfYyfUzZiATOUlPY6HiNogYBh0e
	ESw3SeTWI8e64QS92u+hmqPPTElQudxeVrsoDx4BnaxsfusoKJShBh4U/LohHuxTI9tqcCKrRuz
	OlWOTGDwM7I15MdelJE94mBS/wbgdkVMM=
X-Google-Smtp-Source: AGHT+IG0pbRF7tXm3nayQesn5/ZjHz3JKkHD9+XeoYKe4vx9Z+X7/JuIQLylh2fWOAkrUzgeOffGFmZAjq0BaGmumdE=
X-Received: by 2002:a05:6214:252c:b0:6e0:86ab:4b46 with SMTP id
 6a1803df08f44-6e243c63cb9mr448933486d6.31.1738669316993; Tue, 04 Feb 2025
 03:41:56 -0800 (PST)
MIME-Version: 1.0
References: <181C134EC495FF13.2487@lists.openembedded.org> <c81b3950-dfb4-4f13-8b14-675771944f4a@windriver.com>
In-Reply-To: <c81b3950-dfb4-4f13-8b14-675771944f4a@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 12:41:45 +0100
X-Gm-Features: AWEUYZkxX-U1BeKZld3X7pL_bvILKmiDTfrzbVSgbpcgzug3ZDYJPhd8XDxiIXQ
Message-ID: <CANNYZj8hhmzBx+H-jAnYFPTyZgxO0ELDVG1C4wuBLzfuQig6xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfs-utils: add PACKAGECONFIG for gssapi
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210777

Using those custom thingy-config scripts is problematic as they're
never written with cross-compilation in mind. Can the code be adjusted
to find the needed items with pkg-config instead? Then it can be
offered upstream.


Alex

On Tue, 4 Feb 2025 at 12:30, Yi Zhao via lists.openembedded.org
<yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
>
> Ping ...
>
>
> //Yi
>
>
> On 1/19/25 19:06, Yi Zhao via lists.openembedded.org wrote:
> > Add PACKAGECONFIG[gssapi] to support build with gss and svcgss.
> >
> > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ---
> >   ...nd-krb5-config-for-cross-compilation.patch | 53 +++++++++++++++++++
> >   .../nfs-utils/nfs-utils_2.8.2.bb              |  4 +-
> >   2 files changed, 56 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
> >
> > diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
> > new file mode 100644
> > index 0000000000..019660c12f
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
> > @@ -0,0 +1,53 @@
> > +From 74d01a9e6d19eb963bbf081e3ea7c692759a8fe3 Mon Sep 17 00:00:00 2001
> > +From: Stefan Ghinea <stefan.ghinea@windriver.com>
> > +Date: Mon, 18 Dec 2023 01:20:21 +0000
> > +Subject: [PATCH] Find krb5-config for cross-compilation
> > +
> > +With $dir being used as base search for both libgssapi and krb5-config,
> > +in OE krb5-config is found in $dir/bin/crossscripts instead of $dir/bin
> > +so add this to the search posibillities relative to $dir.
> > +Remove check for needing to set -rpath in KRBLDFLAGS.
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> > +Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> > +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > +---
> > + aclocal/kerberos5.m4 | 13 ++-----------
> > + 1 file changed, 2 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
> > +index f96f0fd..61bc81e 100644
> > +--- a/aclocal/kerberos5.m4
> > ++++ b/aclocal/kerberos5.m4
> > +@@ -26,6 +26,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
> > +       K5CONFIG=$dir/bin/krb5-config
> > +     elif test -f "/usr/kerberos/bin/krb5-config"; then
> > +       K5CONFIG="/usr/kerberos/bin/krb5-config"
> > ++    elif test -f $dir/bin/crossscripts/krb5-config; then
> > ++      K5CONFIG=$dir/bin/crossscripts/krb5-config
> > +     elif test -f "/usr/lib/mit/bin/krb5-config"; then
> > +       K5CONFIG="/usr/lib/mit/bin/krb5-config"
> > +     fi
> > +@@ -71,17 +73,6 @@ AC_DEFUN([AC_KERBEROS_V5],[
> > +   fi
> > +   AC_MSG_RESULT($KRBDIR)
> > +
> > +-  dnl Check if -rpath=$(KRBDIR)/lib is needed
> > +-  echo "The current KRBDIR is $KRBDIR"
> > +-  if test "$KRBDIR/lib" = "/lib" -o "$KRBDIR/lib" = "/usr/lib" \
> > +-       -o "$KRBDIR/lib" = "//lib" -o "$KRBDIR/lib" = "/usr//lib" ; then
> > +-    KRBLDFLAGS="";
> > +-  elif /sbin/ldconfig -p | grep > /dev/null "=> $KRBDIR/lib/"; then
> > +-    KRBLDFLAGS="";
> > +-  else
> > +-    KRBLDFLAGS="-Wl,-rpath=$KRBDIR/lib"
> > +-  fi
> > +-
> > +   dnl Now check for functions within gssapi library
> > +   AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,
> > +     AC_DEFINE(HAVE_LUCID_CONTEXT_SUPPORT, 1, [Define this if the Kerberos GSS library supports gss_krb5_export_lucid_sec_context]), ,$KRBLIBS)
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> > index 18c4a249b3..4cc698f62b 100644
> > --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> > +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> > @@ -32,6 +32,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
> >              file://clang-warnings.patch \
> >              file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
> >              file://0001-Fix-typecast-warning-with-clang.patch \
> > +           file://0001-Find-krb5-config-for-cross-compilation.patch \
> >              "
> >
> >   SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
> > @@ -56,7 +57,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
> >                   --enable-mountconfig \
> >                   --enable-libmount-mount \
> >                   --enable-uuid \
> > -                --disable-gss \
> >                   --disable-nfsdcltrack \
> >                   --with-statdpath=/var/lib/nfs/statd \
> >                   --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
> > @@ -75,6 +75,8 @@ PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmap
> >   # keyutils is available in meta-oe
> >   PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
> >   PACKAGECONFIG[nfsdctl] = "--enable-nfsdctl,--disable-nfsdctl,libnl readline,"
> > +#krb5 is available in meta-oe
> > +PACKAGECONFIG[gssapi] = "--enable-gss --enable-svcgss --with-krb5=${STAGING_EXECPREFIXDIR},--disable-gss --disable-svcgss,krb5"
> >
> >   PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210773): https://lists.openembedded.org/g/openembedded-core/message/210773
> Mute This Topic: https://lists.openembedded.org/mt/110696372/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

