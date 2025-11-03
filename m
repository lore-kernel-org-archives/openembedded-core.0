Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A591CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:04:28 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15833.1762157059973499685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=THup6JSm;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so1508158a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 00:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762157058; x=1762761858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/yOQKvEdQ7oe3+kiNEY+4z5YUUuHnegJAb35id0l+w=;
        b=THup6JSmyppCJPUpne9eq18Fcvjk7YsVjCy6p1OkMytmHJHpkPF0J4Nd3szbgnBYUU
         Ikw7WZXGy8PDyucRD4yYjfZECrsxC6bKRWB5UWgcb6k/TNVvsAZkLO4LZrFGBWBIKnHE
         tQxKnVPZfrf3eAdGLiCe7SF6tSkFHJ38Pdl8rQrxWzS0nKulGvHv229mCIJ+kCS1uXfe
         KyfajusKMbAKFJxsJ1en4sdc53Q9NF02OWCNJRJ90rZX9Lg+Jz7777LDp0cTjWcCcj1b
         6EdA8EE2r4DWVVL7uLBFIJG9qFJL+SiDkPsK9b1RkUX+edF2G+zVGV4pG4gqJ7IK3Yga
         rT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762157058; x=1762761858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/yOQKvEdQ7oe3+kiNEY+4z5YUUuHnegJAb35id0l+w=;
        b=kmyvY3C4IXcktJg7zihCeEFVEk2n7tltCGYqTWSZHEYoDZHWiuEJwwGTLbkGLfCTD3
         +z8o0kfDTuJk2TXvuVpyET8BjvojLeNO1VeSsBFx+zySjsbiPgfEVXOnL3Ou2IlkcydV
         fKcm3oGd8qKyxnJKJY48LvOmS7HOXnNGbyDQUFJNrovTuUlYN9qjQ386aZyabQf+xe4B
         b/AZzCDQ9egMk/5yV77QLhP6ww3XYntS3dedA/FKCOuzrFPdZRobmjxiUWuipgbfTmyd
         cfb/uyZi10wObiBWrXICFE4I54VnbVOCnBxOfAoX3Nesl9g4AnkailfSYAj0o1NOnf6c
         jYYw==
X-Gm-Message-State: AOJu0Yy0L9x/xeqPrsH4jEYFCpeqRMpkDWwmo4MURnVe+UV/PVN1bamR
	dMltAD6CsA2qJhB2U5d9JY3KelVeBFmbQuWuOdGJ09A48bUzePnMO6c6trwqug==
X-Gm-Gg: ASbGncsL/OoOHHX9MslD1EiFKsdLz4N7fffA3SPqxKbo1qEi9G1i4RXTBvZmTWGRx3h
	tkGgYkhnUe6ELG7CDummaNVxFGXlaoF7V3hObt+hxr7gOYba74ulz7bnYz6+1vGnGOgOhJVNtkB
	3H9SVPKG+csMgSnzHQn/0ogFxm+xD0M7Xkjfg5pdRfqDPt0l5fpjzkqi5G5AJYh4n6z6juRlbqP
	I3Anup8oMnRfWLlz5OlRMS5NOcViguY1TOKbQCVGHMaFZSZYjwYOy8iazMCaWzd8g0C3dbtthvq
	IrVYl079sn5/M/fCXEPGRZTdXY8Os4nszqUkpu8Q9UY55dSQN/9Uw2vyiU7RxLimm6Ma9V5lcNf
	lH2Z7U/+NGqOwaiQ6W1yBO9D4j4M3h4YhgRmbvavZ0wAke0Q7Nf4z/QTKcfxp5LUTO+OMhoIKnE
	mOMrSzUk3bYLYU3aL/eUhCPyyAyn3POHa3j9jVaKn4Keo=
X-Google-Smtp-Source: AGHT+IHPFiSNre+ASv9LrVhVRtGWREb03HCfYxH5v4QlxnaJkPQ5JVCCtub4Vv+Ae30fYji2vrCCkQ==
X-Received: by 2002:a05:6402:350a:b0:640:976f:13ad with SMTP id 4fb4d7f45d1cf-640976f1807mr5950599a12.8.1762157056282;
        Mon, 03 Nov 2025 00:04:16 -0800 (PST)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640adcf04bcsm4510376a12.10.2025.11.03.00.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:04:16 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] meta/conf/layer.conf: Avoid adding build deps of rpm-sequoia-native
Date: Mon,  3 Nov 2025 09:04:10 +0100
Message-ID: <20251103080410.2025712-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225613

Avoid adding dependencies of rpm-sequoia-native into sysroots
as it needs none of its build dependencies to run.

It can save significant disk space and speeds up packaging into
signed rpms a little.

It also avoids conflicts with different LLVM/CLANG versions,
like those found in meta-clang-revival.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/layer.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 54fa04e213..5e78bcfeaf 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -116,6 +116,13 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->perlcross-native \
     libarchive-native->e2fsprogs-native \
 "
+# Avoid adding dependencies of rpm-sequoia-native as
+# it needs none of its build dependencies to run.
+# It can save significant disk space and speeds up packaging
+# into signed rpms a little.
+SSTATE_EXCLUDEDEPS_SYSROOT += "\
+    rpm-sequoia-native->.* \
+"
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
-- 
2.51.0


