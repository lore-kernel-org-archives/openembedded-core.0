Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBB9C25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:38:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.22250.1659940732271119389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j3sIBCst;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id m4so14815498ejr.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DqimKH6CS8gvgLOlM7tER5Etk8v6wlUucyRC5CaNShI=;
        b=j3sIBCstbSLzFhqpYhL4wHHibZX5TVLrd/8tdrsFwnJt3e8vnb4clz0Nypa0ZbCz8a
         BSOv6ONYbGRdFyKZFwiVRweCUNajbt8Bh7QxuYFyvJAcVyzwRDCznvHmQTyw5kYJOfg7
         IHga44ZKl/TIr7NsSpjd9FQ3aKaNwee6nasXZ2Yp265vVSxWl8JJxgivZ7Rv8oUgl9UL
         mCy3HtET8eewG/fTd55pKfGW6db4bZKXpxA2w3mR0kUbT9V76ijsQpADOipbryC2JqK/
         Qz0QZPoM7JAlW26EaPs4hAgTuilIuIRtp2wWBvI83ozugb5YDc+PpdGFAbxohi6dbKfk
         D+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DqimKH6CS8gvgLOlM7tER5Etk8v6wlUucyRC5CaNShI=;
        b=hun0SATAxK6sxZD22jtrtFl52OBGigTM+A82w1reSQREkQbzLmEO6Zc8STv6nlAIjF
         wefgAWMQ+yNwjPzIjbElYJRs0l8wWasNbmhEsj8sIQSBSxlBBSPdyVVK7vTUI2Fc8Lhj
         zo4HPlupSoVJOZXzm6Qz1UQisl0tHm3U9MiBaM1LPxt/U/eIznQoa2zDlqBdqidy9Afx
         xzGRFF1nNHSyI+CXCBJ9ZUk7FGln3vYnzKgAAvYYT9vAGV/amX5GrciVMrXcvMxQKG1a
         y57dofyL0Pv6D13f04yUNCocP4HtjJBe2gCVhrmY4pSugfs5mBODsA4deFBHpn9zIOYn
         ZCkA==
X-Gm-Message-State: ACgBeo0n+fGoeqRzFXur+KTLvxokyY+S7RsccV/DOKZF+gmmJp8TQodi
	Y3AENbJ1p9svn9Ff2wSOYktIdrMoSF4=
X-Google-Smtp-Source: 
 AA6agR4khwY6B8QajVj+FhSEMYXgy8v55ubj/RG4jcVWpiEdKgYmAb2U1Q2fPes7u4KG4BYOTd+o9Q==
X-Received: by 2002:a17:906:974a:b0:731:3310:4189 with SMTP id
 o10-20020a170906974a00b0073133104189mr5546215ejy.683.1659940733052;
        Sun, 07 Aug 2022 23:38:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/45] go fix 2
Date: Mon,  8 Aug 2022 08:38:03 +0200
Message-Id: <20220808063843.3975130-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169018

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/go-1.19.inc          |  1 +
 .../go/go/stack-protector.patch               | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/stack-protector.patch

diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devtools/go/go-1.19.inc
index 3bccfcbecf..f733a807b4 100644
--- a/meta/recipes-devtools/go/go-1.19.inc
+++ b/meta/recipes-devtools/go/go-1.19.inc
@@ -14,5 +14,6 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
+    file://stack-protector.patch \
 "
 SRC_URI[main.sha256sum] = "9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9"
diff --git a/meta/recipes-devtools/go/go/stack-protector.patch b/meta/recipes-devtools/go/go/stack-protector.patch
new file mode 100644
index 0000000000..cc92a444a7
--- /dev/null
+++ b/meta/recipes-devtools/go/go/stack-protector.patch
@@ -0,0 +1,32 @@
+From c537b87782293fe222f2ef5eb1ae818092118e97 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Sun, 07 Aug 2022 19:21:15 -0700
+Subject: [PATCH] runtime/cgo: add -fno-stack-protector to CFLAGS
+
+Some compilers default to having -fstack-protector on, which breaks
+when using internal linking because the linker doesn't know how to
+find the support functions.
+
+Fixes #52919
+Fixes #54313
+
+Change-Id: I6f51d5e906503f61fc768ad8e30c163bad135087
+Upstream-Status: Submitted [https://github.com/golang/go/issues/54313]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+
+diff --git a/src/runtime/cgo/cgo.go b/src/runtime/cgo/cgo.go
+index 298aa63..4b7046e 100644
+--- a/src/runtime/cgo/cgo.go
++++ b/src/runtime/cgo/cgo.go
+@@ -23,7 +23,9 @@
+ #cgo solaris LDFLAGS: -lxnet
+ #cgo solaris LDFLAGS: -lsocket
+ 
+-#cgo CFLAGS: -Wall -Werror
++// We use -fno-stack-protector because internal linking won't find
++// the support functions. See issues #52919 and #54313.
++#cgo CFLAGS: -Wall -Werror -fno-stack-protector
+ 
+ #cgo solaris CPPFLAGS: -D_POSIX_PTHREAD_SEMANTICS
+ 
-- 
2.30.2


