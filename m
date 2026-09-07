Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F385DC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:56:17 +0000 (UTC)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35391.1788789372980148902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Ud4msu0B;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.228.76, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8070899e8so112708a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788789371; x=1789394171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YclwjwBIgLn0vAquUtCNzGHaLyUaDbVvZekdA/66thA=;
        b=Ud4msu0BBgbreSO0ElxSYz1qIg6ozTVHSslIG0lbtaFL05HRrT2x8l5VI6mSmbWsoF
         V38SWFMzkXT13+umI82cDKJuhIgNq+IOtZuORDDxcB0G2rHY7MHS+ZyM+arY5Qe5k+J3
         /npZWyVVYA4guCv/EUmNEAoD3vMYY4O2XnGN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789371; x=1789394171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YclwjwBIgLn0vAquUtCNzGHaLyUaDbVvZekdA/66thA=;
        b=ZgVe9hvymyiK3bhQdS1b2a+1DKiHatz8lI/LXTARRH8VZ4hJrEPX/tHyvTz+b7Vkyn
         K8MrNG/DF4BEfa85nMg3ti3DAahryP397ANlgTAVe6wYb4nujZ/mD8C3+L1fsuHbnF4k
         o5KIdLCxcSpENJoaZ5cEeNry4lvsEjvRezVWFf582DcEY3CTrP0Eh2plIcHi9wc7Wv43
         Pg/86bloqHJDuCuNK2s/a8PtVXD266tIXGNaLweYMpcmDmkpyNn5rSf8k4Lw4dbBsS7v
         raVZaLTQOfWTiaSaLwZwQqct0o100M6rxKxU7hzLEodGOGNgY9azDO00iya26RT5g+jl
         l/9w==
X-Gm-Message-State: AFuF++l4JSfB+mWQvDNU6o32s1MQBIMa5cMBSLnZMDhhDehQygcp33u/
	ciD3qOdcb+/EzfEwgRlbqgazk1bs6fMG9ZP4VaLJD5gfZfLx/DwBTegrV163IJWPrIji1MNWvYg
	ciacJpbg=
X-Gm-Gg: AYBFou2JgO/M5IjVxNTrX8xPB/3NXlHVa55B+84T8cOcn+EttxatqBQi/u+fgMo6LyX
	Y6TOgn96SCCVh6o9xONRIihaFTJ71k4f8WmsZKVuKCd2Oc3l9fgcJ4eDsDYLhc+4xFOpyN9PkKH
	gGxNxfn9ZWuiuKd9tLOGaVlLNeK9F08p5XUhb2FfVLPF2ozpvvN0KHKyHVyeuJwhYHrovs7wGcL
	ORNVA7aDdoX3MZf8biEiLiJ+WWNtUF1mQGVwEjMcALV+E1TkJ9tS2Yvx1npUrmS/d2Qo95lcM5x
	zD8u2pfGbAqn7uz0oLqn2HgW9I6i2PhafsROVTa67A7powPA6Zd1RmyLOBL1LXEsfDhRTgbQHpS
	N1Pw6VVRZKiXzdjTxqXat5CgsaRRgYATXupPBTqzq/KaJSzcLC5Mv6+WyYmVKg5CJhsSDShIAN0
	LSAFqVVwjiX5pmImtSMGlwZOrGW789HgdNgpfSYhC++lXCWv8r4hVXoMFB4l5MjRBZHVlL1rINS
	57/s4L+a/lHaGVuMgBdbro263f2H3c5A89C0zi+ZK3wL2ntLHfRmYmaXwR8c2Ah9X0FkTicJ+/Z
	v20yoAhYrJwaMFeYtXHoRNoVjO5y/mXkLJssXFgX3JjitlaedFEZDRQHVKVRX0l4HkC2TRL9Tqk
	Wudg=
X-Received: by 2002:a17:906:c115:b0:c25:3ec4:9e43 with SMTP id a640c23a62f3a-c2624d2422emr533622066b.0.1788789371060;
        Mon, 07 Sep 2026 06:56:11 -0700 (PDT)
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm478290566b.34.2026.09.07.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:56:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v9 1/5] json-c: add patch to fix compiling with a C++ compiler
Date: Mon,  7 Sep 2026 15:56:00 +0200
Message-ID: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245294

Backported from upstream commit aab792578b4f081af6ed7b993475bcb2dbca8912

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...rs-when-building-with-a-cpp-compiler.patch | 50 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.19.bb   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-fix-defined-but-not-used-errors-when-building-with-a-cpp-compiler.patch

diff --git a/meta/recipes-devtools/json-c/json-c/0001-fix-defined-but-not-used-errors-when-building-with-a-cpp-compiler.patch b/meta/recipes-devtools/json-c/json-c/0001-fix-defined-but-not-used-errors-when-building-with-a-cpp-compiler.patch
new file mode 100644
index 0000000000..08e086f8a6
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-fix-defined-but-not-used-errors-when-building-with-a-cpp-compiler.patch
@@ -0,0 +1,50 @@
+From aab792578b4f081af6ed7b993475bcb2dbca8912 Mon Sep 17 00:00:00 2001
+From: Eric Hawicz <erh+git@nimenees.com>
+Date: Sat, 11 Jul 2026 09:28:49 -0400
+Subject: [PATCH] Issue #941: fix "defined but not used" errors when building
+ with a c++ compiler.
+
+ 
+Upstream-Status: Backport [https://github.com/json-c/json-c/commit/aab792578b4f081af6ed7b993475bcb2dbca8912]
+Signed-off-by: Eric Hawicz <erh+git@nimenees.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ json_object.h | 4 ++--
+ linkhash.h    | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/json_object.h b/json_object.h
+index 7edb63d4f8..2cd94906e7 100644
+--- a/json_object.h
++++ b/json_object.h
+@@ -488,7 +488,7 @@ JSON_EXPORT void json_object_object_del(struct json_object *obj, const char *key
+  * @param val the local name for the json_object* object variable defined in
+  *            the body
+  */
+-#if defined(__GNUC__) && !defined(__STRICT_ANSI__) && (defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L)
++#if defined(__GNUC__) && !defined(__STRICT_ANSI__) && (defined(__cplusplus) || (defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L))
+ 
+ #define json_object_object_foreach(obj, key, val)                                \
+ 	char *key = NULL;                                                        \
+@@ -520,7 +520,7 @@ JSON_EXPORT void json_object_object_del(struct json_object *obj, const char *key
+ 	                 : 0);                                                 \
+ 	     entry##key = entry_next##key)
+ 
+-#endif /* defined(__GNUC__) && !defined(__STRICT_ANSI__) && (defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L) */
++#endif
+ 
+ /** Iterate through all keys and values of an object (ANSI C Safe)
+  * @param obj the json_object instance
+diff --git a/linkhash.h b/linkhash.h
+index 5ad17cf2d2..48fb7c0b0a 100644
+--- a/linkhash.h
++++ b/linkhash.h
+@@ -345,7 +345,7 @@ int lh_table_resize(struct lh_table *t, int new_size);
+ /**
+  * @deprecated Don't use this outside of linkhash.h:
+  */
+-#if !defined (__STDC_VERSION__) || (__STDC_VERSION__ < 199901L)
++#if !defined(__cplusplus) && (!defined (__STDC_VERSION__) || (__STDC_VERSION__ < 199901L))
+ /* C89 compilers like VS2010 can't handle inline funcs, so skip it there,
+    note: this also applies to -std=c89 in GCC! */
+ #define _LH_INLINE
diff --git a/meta/recipes-devtools/json-c/json-c_0.19.bb b/meta/recipes-devtools/json-c/json-c_0.19.bb
index e42d4f6f56..9271d56326 100644
--- a/meta/recipes-devtools/json-c/json-c_0.19.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
@@ -7,6 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://0001-fix-defined-but-not-used-errors-when-building-with-a-cpp-compiler.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de"
-- 
2.55.0


