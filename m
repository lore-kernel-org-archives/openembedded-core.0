Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CC1E6918F
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:36 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87808.1766434106515472408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TxKxzAbw;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b79e7112398so703506366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434105; x=1767038905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxuaIz6orMS5HObWz5KoCWqtZuHmshy3U/T/+k/Xcx0=;
        b=TxKxzAbwBc97G+KBB7Y4Kom8gyOHFPHUkxb5RhkbE9qQ9IofPL84QQjuNtT84lKpPO
         elvdJmuFMFzNXuXGVdpP7jmO3nzqyQ0mt4l0VmRquLc2r0jRjkaJvB5nZvnxmseHSZQT
         Af8e9tPVfQ9i6rPJsXv7zagCZAxHXLIJq0F5UNfU8qcMIYH1ybZyWTrA7cvOSah53H9f
         vnP/WmGpZbzpZwvlbor8LJLlJ1s5GyZNcXJSdmy/kOGdUfu+HVB5DJkMPPDn4wqEHl3L
         1Wp9eLwLHKu2VVpfW5y9Kw5SBb0CDtqTw4EtFAz1KbUGuJBWHMIw4O6Cr/E/nOLuwrux
         LiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434105; x=1767038905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxuaIz6orMS5HObWz5KoCWqtZuHmshy3U/T/+k/Xcx0=;
        b=YnubgQ3JG/ROSI+AtCylzFpAHTCPM9RNKNI1BckVFJRuu23nU6QlOOnSYRrkaJvN+G
         ng/cIO7jYF7vKu7Nd3hpi//DfysJtSOu7JwRW8uus0SuQgA3Y0qMEXJT73wrn8d66hTB
         6imbfYqMqqv/Cbt9LZH7DGDXutp1tedG0c6GF+Yq4guzc/YSDjka062CWbGI8lNHT28+
         pB+gPRrB7aXSTrjdTJinnPfhiIeexnH+gVfoluew81+DTiAB7imsVVSCnUf8dzq6ew4v
         o7DLHJQQdS0ecW6GxGGbJ0eWboE107osW79+iGCHg1kdfYYE52ZS9pW3haFQgGRjR2Wf
         znxQ==
X-Gm-Message-State: AOJu0YxkuiJaIJysBhZue/WmkdjqhbB7Poowbn1TnGNShOQb7hVmJ2Jy
	JLKojknWBjIQUMhtj9PD5fncMcU2qlIwPTJVnXknjdPC5VrbX/Iro31cO9pRng==
X-Gm-Gg: AY/fxX4fNSbnQQYuJ2KBlqqCHqS0pHfwUwKVf+czHFDKGiTzpP2J4jTvXlm40NjV9mz
	XoGLDBg3KKh/QVf+quSho602qyYfepBog0v+AvwR4OXijE92z9SBrFYfFrW2GVPbK+8565TlWpO
	v7ZaHez3Hdi+tTCJGEQqzzziYDYAVl6sptu6oXP5sip7IIHVuXCkijt+a9YDLP6ZmX9YRphA87n
	4IghkvRh0JMVESSamBdI8qG9KJK4GY8GoZWYDXbnVjVMDHHsONKKbgviwKJ98FcObKFd4dxWD5F
	43/RrpCTUhow17FUtHh7YB7wSSNEmyo9Kj6Lq6O80L4HaDw/kii5rsDFHiy0oLVOMzcg6y7oCKV
	bAar4HznvQfDsD1ncRG8vd0LadHvzMDXp5GVhG+OPKVmpC01rvpdw0bbHLePxSeB3q8LBW0mSMp
	zgzUwpTOwRiY3A+xYd2c3NnBRfz8kTXGRKrE3ea2VYPfGJBzs=
X-Google-Smtp-Source: AGHT+IFwFdqJbvuxwM3qwh3fFevwqD0Za1X0rBDbcdC2nswD7L4nnKSJ0Lg6cuTAZlQRfh69TDOllw==
X-Received: by 2002:a17:907:6ea1:b0:b7c:532b:cc91 with SMTP id a640c23a62f3a-b803719d43dmr1290879066b.47.1766434104754;
        Mon, 22 Dec 2025 12:08:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 056/114] python3-cython: upgrade 3.1.3 -> 3.2.3
Date: Mon, 22 Dec 2025 21:06:38 +0100
Message-ID: <20251222200739.2278706-56-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228381

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ce-not-predictable-build-path-prefix-with-hardc.patch | 9 +++------
 .../{python3-cython_3.1.3.bb => python3-cython_3.2.3.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.3.bb => python3-cython_3.2.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 1fbbd8fd48..d232f58e02 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 1690c505f1387e1884565021991a162e2f88f2b9 Mon Sep 17 00:00:00 2001
+From 77c73d8c317224f66af66521f8cfe7a8e5491136 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,10 +53,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 6672cb986..b1123515e 100644
+index c1d8783..f24b2d9 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -779,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
@@ -67,6 +67,3 @@ index 6672cb986..b1123515e 100644
              code.putln("END: Cython Metadata */")
              code.putln("")
  
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/python/python3-cython_3.1.3.bb b/meta/recipes-devtools/python/python3-cython_3.2.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.3.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.3.bb
index 3b2835d9c5..f58b74f272 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.3.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
+SRC_URI[sha256sum] = "f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.3


