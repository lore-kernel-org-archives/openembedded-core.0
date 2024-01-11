Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197AAC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 13:15:41 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.10994.1704978930983692879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 05:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=doRodoRq;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28bf46ea11so929032866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 05:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704978929; x=1705583729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mheM5mqUpa47lNnJbCerRHM7htIyfnLkhdCqdpcGJYw=;
        b=doRodoRqkDm/DHY7swhFG8Oe5wUOkF2cka1oUCSnEWMzUXsYRI4croD8EgXPFT6Aol
         G/g/rXS8plQF2gOiVCnzj4Zn+EMvjm0UFxaYXg0Ppg5rTfKnYJRpNNHLVkJT7wYugX4S
         jby8AcBb+1XqWvmbc1WBL4SxdziPsrH0swuJgw7XmyQ/cw7e+VC53+jIH3L0xJJ3Mzgo
         SnR2l01Bn8pK29/O/0hGb3dOLRXS2iWgTCedTMPQ2a26v3kkqejVfdlxOJWKunc9WmNp
         3r3cDKbD2Lv4kG8XQ/vssF0A8z27mZVMVSDe712WUSRfvjvdyV41572I3AWLSLNEtvYV
         W00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978929; x=1705583729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mheM5mqUpa47lNnJbCerRHM7htIyfnLkhdCqdpcGJYw=;
        b=RhAjaH58E0U4ieJaVhnfE8ridJLqfssQHpOZWq97TARctNK+rq28A/4sbI4M8rWNM+
         VtzU206Qvd16posAo9ZoayNOHLOKSVS0MVFCMcetL6cBXlkC/0G4YkE3S55NSh8oA9pM
         ge6n1MpyhQmgP7klqYyLkFi7h0h2pYDOFBNK1mMEIinmlfqSQu4nRQar/TFDd3tQvH6m
         UJnR5eamhLYAVQwBSzd+EEJZynW9veRdbPJRSxhD1CVzdsIssyjq18SrxU6OLdMcP4XL
         WXejfHZfLNAz5xY3LAvglxoI3CAYpDSZ5+YmSjHxDsU7hdDiWTs9go64phKM6X1fAXHe
         yarQ==
X-Gm-Message-State: AOJu0Yw0SdzFT640/lUQcuaXwWejlLVWEiNytT+OyTYkI7MnGgX4nHP4
	IhR6v+RQMOdWA6/xqb+1yqn6ZDa1GIU=
X-Google-Smtp-Source: AGHT+IEOApvxFqIx8p0nMp/ZJzoravCDtTrwsWFh7KNKfAxxTbE5P8QpT5VdM/uCxM12jJN55PJeJA==
X-Received: by 2002:a17:907:2666:b0:a23:7633:59ae with SMTP id ci6-20020a170907266600b00a23763359aemr960770ejc.9.1704978929161;
        Thu, 11 Jan 2024 05:15:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a23-20020a1709062b1700b00a2a67731f31sm562874ejg.109.2024.01.11.05.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:15:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3 2/2] shadow: link executables statically for -native variant
Date: Thu, 11 Jan 2024 14:15:21 +0100
Message-Id: <20240111131521.2305172-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111131521.2305172-1-alex@linutronix.de>
References: <20240111131521.2305172-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 13:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193543

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

v3: add -no-pie to linker flags, as otherwise some host distros
would refuse to link against libattr produced on other host distros
and supplied via sstate (libattr made with gcc 13 and used on gcc 11/12
hosts seems to be problematic)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/no-static-libs.inc |  5 +++++
 meta/recipes-extended/shadow/shadow.inc     | 10 ++++++++++
 2 files changed, 15 insertions(+)

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
index c024746d4ff..43f456251a5 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -47,6 +47,16 @@ EXTRA_OECONF += "--without-libcrack \
 
 CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
 
+# Force static linking of utilities so we can use from the sysroot/sstate for useradd
+# without worrying about the dependency libraries being available
+LDFLAGS:append:class-native = " -no-pie"
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


