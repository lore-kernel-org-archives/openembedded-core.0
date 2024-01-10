Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAD8C47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 20:03:47 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.3660.1704917023814589607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 12:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AS1mrQQ0;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a28a997f3dfso354147566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 12:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704917022; x=1705521822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFOD7NQezotRV1DSZokbMP4SOHozZGJBOKhaXyCy/Ww=;
        b=AS1mrQQ0wDIDLoWGcQruU+TCtx3dOl7L+qFTNWHjc1pUHl5pm5w52VnWZulOMPCYLN
         aSSUiqUMHzUf8BIZs+aMHH1OTS0Eo5lszp/dWTAD9jEx/wuREst+Plr3j5YbRe5ie76u
         5wVC35TieH8sAYhc4wCs6yExBODzyzvbppPDua+NEXzLgABJJf79qB8eiWGJcK36AX6h
         88LdAWqMjqgsQ+Bw/7e+P+XQZdAszOIys207dln4ehkCOdwacSJfzBPoHe5Wb50AHLBO
         Qd0TtC00JAo8qD7G2Uq9ugxshHEPBVxi8nheuBnCCr22Yd3CYiVIQK0UBEOTvnTDqmKW
         gQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704917022; x=1705521822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFOD7NQezotRV1DSZokbMP4SOHozZGJBOKhaXyCy/Ww=;
        b=ZkQV+eOu4cTvYrBmfefkByrBtZI/Y/2nDK9j1dH8ljwOc1/Se+yZqJ4gId1Furrsxf
         xjGFTBtOC4vcMqxSEhqZc4k1QN3xtb/gaNDKPIjRf/HrufGnR9QYKvCMDEDsbJHumj9Z
         wFUipkgcO1RhifLnbiDMI89IHYZUK0O7HYflSLO+iIkeYBd417G13/JRuM9sEkwgtSwh
         vRjdC+11rp91+mYWtDlxIGMSxRv25t5u11vEngSxiP08cPZo+PxstmsoqABWWeO7Ajcu
         pWqs6UvkUhIjwk4P4blBu159ZibnhHg3B2JBr9EJulQF2SV1c6UCFCbHgk3iufu0f9BS
         IfxA==
X-Gm-Message-State: AOJu0YwIap83Lu8QdqxR4rS++JT6tt9dRbq+v8T8vPq7+5e6SgkhLJjs
	JL/3u8kEv4H0KWtV4uhqdZaS8tMnXig=
X-Google-Smtp-Source: AGHT+IGEnA1yudub1y0WuxFMPebIdiiXk2KDIhtql0j78k6Rzl/SffSp+4ZPxeCPd5mYDQuW7PNgAg==
X-Received: by 2002:a17:907:7b97:b0:a26:8c15:bf8f with SMTP id ne23-20020a1709077b9700b00a268c15bf8fmr47976ejc.11.1704917021919;
        Wed, 10 Jan 2024 12:03:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la8-20020a170906ad8800b00a2af8872e9bsm2455012ejb.14.2024.01.10.12.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 12:03:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] shadow: link executables statically for -native variant
Date: Wed, 10 Jan 2024 21:03:29 +0100
Message-Id: <20240110200329.2173442-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240110200329.2173442-1-alex@linutronix.de>
References: <20240110200329.2173442-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 20:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193522

shadow 4.14.x adds a number of libraries it dynamically links with
(md, bsd, attr). This causes troubles in setscene tasks where
shadow executables are used (such as useradd), as pulling in
the needed dynamic libraries needs unpleasant special-casing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
v2: patch only Makefiles that produce executables and libshadow.a
(that executables all statically link with), do not patch libsubid/Makefile,
as patching in .a linking can clash with producing dynamic libraries.
libsubid is used only in getsubids executable, which is not used in
setscene user management (or anywhere else from what I can see).
---
 meta/conf/distro/include/no-static-libs.inc | 5 +++++
 meta/recipes-extended/shadow/shadow.inc     | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 75359928a14..8898d53d756 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -21,6 +21,11 @@ DISABLE_STATIC:pn-libusb1-native = ""
 # needed by rust
 DISABLE_STATIC:pn-musl = ""
 
+# needed by shadow-native to build static executables, particularly useradd
+DISABLE_STATIC:pn-attr-native = ""
+DISABLE_STATIC:pn-libbsd-native = ""
+DISABLE_STATIC:pn-libmd-native = ""
+
 EXTRA_OECONF:append = "${DISABLE_STATIC}"
 
 EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index c024746d4ff..e16d3f010d2 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -47,6 +47,15 @@ EXTRA_OECONF += "--without-libcrack \
 
 CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
 
+# Force static linking of utilities so we can use from the sysroot/sstate for useradd
+# without worrying about the dependency libraries being available
+do_compile:prepend:class-native () {
+	sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
+	       -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
+	       -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g' \
+               ${B}/lib/Makefile ${B}/src/Makefile
+}
+
 NSCDOPT = ""
 NSCDOPT:class-native = "--without-nscd"
 NSCDOPT:class-nativesdk = "--without-nscd"
-- 
2.39.2


