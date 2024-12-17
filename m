Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674E8E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 23:11:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.94267.1734477075027616519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 15:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=htY8o63y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2948867f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734477073; x=1735081873; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c9uUY8zAo3yqPaDgE8JMR0OqtJ3vIi7sZS9hM7z/6QM=;
        b=htY8o63y+hCPB78joVkND9Q8zcsHQG7UB83wVIO4EvC10m6WSBHLRFLocQXCQJr+SP
         MK+zckIWp7/kEdmuE6g8sFHNGb0VaObckjuMcQeCjb1L5rwuRq/9ZSs5rZ6YzI/rXqae
         S/RJS8dLGsatK6dYjoV80zaULeZL+++s3cc+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734477073; x=1735081873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9uUY8zAo3yqPaDgE8JMR0OqtJ3vIi7sZS9hM7z/6QM=;
        b=DEqUF4bnEKQ4DtPoYGIQHnA26CK98Uznqw5x0SFe45EU/wUOD0CRRCpPeG/rEna+3W
         Ce4tdNR6JIyas+V/Lnt/nGYG3dAu0lI6Pa8yznfKMrTRjGFqll28L2J00wV3OTYGw37z
         4pUfURuuu0kB6b4EeJMBQQCHjg1po5XjXDGOKJfqgGRoSTe4c5fPzkDO6hYCgMgCamMa
         uTnrhTCnAPZyk0NlMdqqPssYGKR2wDcIHjaLWWMPbRKKBSlibgbKO1fJ5i37S7iRX7ae
         T6FlPfnTx51l3pz+ax0i76+09+TY5hoB95UjfVghb9AJj5XdDA7CTM5OzzGu3fGcziXz
         D+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZkU3buWm90+FiAaT7gWsEazmKI2lzmJBwkdhtJf+vME0ASauWdZmpnxiYuRdzldFrxoNIylH0ixVoHnPCix9Uw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypssBXLAiQm/XIqMAz6TuWMBwm2KA31H90zV0fS4xovfgVfIa/
	247gFEMNvppzikwc0LiSi5o/HHzlhOylZD3R9BFswtqwFEFa8k4DLxLfcd23MgI=
X-Gm-Gg: ASbGncsoCJMmkmuMJ+ZB6RqXCLq6QCnw+7B7JRS/GAGk5OMx4ues+2+/PdHgBJPw+N8
	IcIeUyak1XKxr/T76f/JimybypDhqSSL5SY092FDF69QpQ1MrNK3CyvEmmSqfuSwvZnsjpFK6BL
	elhsj/oDbTY1FQ2KmcBxxMKgRnl/lLPuYeCHzYT74ocM8ew+6WiDz5zzc80rCT0XS53q21RV/nZ
	V9qh0bs7+NAHzc44ZxN/VYGX40N0E9UekpSAl+hrV3a0htXslKRDNsiKVbMOPzJ1aOnc3hPu0i1
	kK/unaKPfsBSjVnNEk6wRVMNK7aea6GAxFo8u6dP8fXmCg==
X-Google-Smtp-Source: AGHT+IFsaEqfSvJfTekk6IRGjGoMKP0wbY6JJEHNcj81CEyLTTArW7mgbL4dOdad/lNLI3TkrS8M5Q==
X-Received: by 2002:a05:6000:4a04:b0:382:450c:2607 with SMTP id ffacd0b85a97d-388e4d6aa13mr490488f8f.4.1734477073179;
        Tue, 17 Dec 2024 15:11:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac68:38dd:218a:1df1? ([2001:8b0:aba:5f3c:ac68:38dd:218a:1df1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012042sm12355496f8f.20.2024.12.17.15.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 15:11:12 -0800 (PST)
Message-ID: <183d6d19f6075d3bce1c0d1bd1705b35265e7e80.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 21/21] tcl8: upgrade 8.6.15 -> 8.6.16
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Date: Tue, 17 Dec 2024 23:11:11 +0000
In-Reply-To: <1734425887-18069-21-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
	 <1734425887-18069-21-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 23:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208863

On Tue, 2024-12-17 at 16:58 +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>=20
> alter-includedir.patch
> interp.patch
> tcl-add-soname.patch
> tcl-remove-hardcoded-install-path.patch
> refreshed for 8.6.16
>=20
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
> =C2=A0.../tcltk8/tcl8/alter-includedir.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 =
+++++-----
> =C2=A0meta/recipes-devtools/tcltk8/tcl8/interp.patch=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
> =C2=A0meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch |=C2=A0 8 ++=
++----
> =C2=A0.../tcl8/tcl-remove-hardcoded-install-path.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
> =C2=A0.../tcltk8/{tcl8_8.6.15.bb =3D> tcl8_8.6.16.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A05 files changed, 16 insertions(+), 16 deletions(-)
> =C2=A0rename meta/recipes-devtools/tcltk8/{tcl8_8.6.15.bb =3D> tcl8_8.6.1=
6.bb} (98%)
>=20
> diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/m=
eta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
> index bfc718cfd3..c5005cb4a8 100644
> --- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
> +++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
> @@ -1,4 +1,4 @@
> -From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
> +From ca538ba69b808b4e68ddcbea89a22f68ef4e4b4f Mon Sep 17 00:00:00 2001
> =C2=A0From: Mingli Yu <mingli.yu@windriver.com>
> =C2=A0Date: Tue, 22 Nov 2022 18:48:27 +0800
> =C2=A0Subject: [PATCH] tcl: update the header location
> @@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> =C2=A0 3 files changed, 4 insertions(+), 4 deletions(-)
> =C2=A0
> =C2=A0diff --git a/unix/Makefile.in b/unix/Makefile.in
> -index a3b7d69..969ddb8 100644
> +index c3b75e3..60ed93e 100644
> =C2=A0--- a/unix/Makefile.in
> =C2=A0+++ b/unix/Makefile.in
> =C2=A0@@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	=3D $(INSTALL_ROOT)$(TCL_LIBRA=
RY)
> @@ -39,10 +39,10 @@ index a3b7d69..969ddb8 100644
> =C2=A0 # Path to the private tcl header dir:
> =C2=A0 PRIVATE_INCLUDE_DIR	=3D @PRIVATE_INCLUDE_DIR@
> =C2=A0diff --git a/unix/configure.in b/unix/configure.in
> -index 4974fb6..a72934f 100644
> +index 8e6726b..2345689 100644
> =C2=A0--- a/unix/configure.in
> =C2=A0+++ b/unix/configure.in
> -@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> +@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> =C2=A0 eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
> =C2=A0=20
> =C2=A0 test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(libdir)/tcl$(VERSION)'
> @@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644
> =C2=A0 HTML_DIR=3D'$(DISTDIR)/html'
> =C2=A0=20
> =C2=A0 # Note:=C2=A0 in the following variable, it's important to use the=
 absolute
> -@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH=3D"`pwd`/${TCL_STUB_LIB_FILE=
}"
> +@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH=3D"`pwd`/${TCL_STUB_LIB_FILE=
}"
> =C2=A0 TCL_STUB_LIB_PATH=3D"${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
> =C2=A0=20
> =C2=A0 # Install time header dir can be set via --includedir
> diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipe=
s-devtools/tcltk8/tcl8/interp.patch
> index 2e0dc94cff..d5d2b1821b 100644
> --- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
> +++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
> @@ -1,4 +1,4 @@
> -From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
> +From d17505bf4630d9c432e897b5b3abb2a28f56f57a Mon Sep 17 00:00:00 2001
> =C2=A0From: Ross Burton <ross.burton@arm.com>
> =C2=A0Date: Mon, 12 Jul 2021 14:50:13 +0100
> =C2=A0Subject: [PATCH] tcl: fix race in interp.test
> @@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
> =C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)
> =C2=A0
> =C2=A0diff --git a/tests/interp.test b/tests/interp.test
> -index d742484..fc90990 100644
> +index 24ffb1b..c6460ad 100644
> =C2=A0--- a/tests/interp.test
> =C2=A0+++ b/tests/interp.test
> -@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handle=
r of child [1999035]} -setup {
> +@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handle=
r of child [1999035]} -setup {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variable result
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set result [lindex=
 $args 0]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/met=
a/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
> index 1cd4d76283..057a08dee4 100644
> --- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
> +++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
> @@ -1,4 +1,4 @@
> -From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
> +From cbb5200cb2bb1d40a0535213630f689040ac7f76 Mon Sep 17 00:00:00 2001
> =C2=A0From: Richard Purdie <rpurdie@linux.intel.com>
> =C2=A0Date: Wed, 9 Dec 2009 23:59:44 +0000
> =C2=A0Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging=
 function
> @@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> =C2=A0 2 files changed, 7 insertions(+), 1 deletion(-)
> =C2=A0
> =C2=A0diff --git a/unix/Makefile.in b/unix/Makefile.in
> -index 7619afc..9dd053d 100644
> +index bc743b3..a2f9e21 100644
> =C2=A0--- a/unix/Makefile.in
> =C2=A0+++ b/unix/Makefile.in
> -@@ -904,7 +904,10 @@ install-binaries: binaries
> +@@ -812,7 +812,10 @@ install-binaries: binaries
> =C2=A0=C2=A0	done
> =C2=A0=C2=A0	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
> =C2=A0=C2=A0	@@INSTALL_LIB@
> @@ -27,7 +27,7 @@ index 7619afc..9dd053d 100644
> =C2=A0=C2=A0	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VE=
RSION)${EXE_SUFFIX}"
> =C2=A0=C2=A0	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
> =C2=A0diff --git a/unix/tcl.m4 b/unix/tcl.m4
> -index 0307a06..37c4d67 100644
> +index 7f5464e..cd8d929 100644
> =C2=A0--- a/unix/tcl.m4
> =C2=A0+++ b/unix/tcl.m4
> =C2=A0@@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
> diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-insta=
ll-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-inst=
all-path.patch
> index 93e7877256..c589612963 100644
> --- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path=
.patch
> +++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path=
.patch
> @@ -1,4 +1,4 @@
> -From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
> +From 574bc39a9e900870a1311148abf87830a943894c Mon Sep 17 00:00:00 2001
> =C2=A0From: "Song.Li" <Song.Li@windriver.com>
> =C2=A0Date: Wed, 1 Aug 2012 19:05:51 +0800
> =C2=A0Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit t=
arget
> @@ -17,10 +17,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0
> =C2=A0diff --git a/unix/configure.in b/unix/configure.in
> -index 4f62510..4974fb6 100644
> +index e88ec3c..8e6726b 100644
> =C2=A0--- a/unix/configure.in
> =C2=A0+++ b/unix/configure.in
> -@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> +@@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> =C2=A0=20
> =C2=A0 eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
> =C2=A0=20
> diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb b/meta/recipes-d=
evtools/tcltk8/tcl8_8.6.16.bb
> similarity index 98%
> rename from meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
> rename to meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
> index 928124148c..2f2b0c7db9 100644
> --- a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
> +++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
> @@ -24,7 +24,7 @@ SRC_URI =3D "${BASE_SRC_URI} \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/interp.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/run-ptest=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> -SRC_URI[sha256sum] =3D "844775491e435e34d83d6ccfbadd1342f1855f1705253233=
a86152df0765e78d"
> +SRC_URI[sha256sum] =3D "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fd=
eeb3d6a9a56f38e9"
> =C2=A0
> =C2=A0SRC_URI:class-native =3D "${BASE_SRC_URI}"

This appears to cause ptest failures unfortunately:

https://valkyrie.yoctoproject.org/#/builders/61/builds/607/steps/12/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/73/builds/608/steps/12/logs/st=
dio

Cheers,

Richard

