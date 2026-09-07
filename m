Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B379C79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34944.1788788170705966969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SiJ+0Z/U;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48436251906so4068616f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788169; x=1789392969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=97bUQEP2eAKwUGTPuhdvhHBw6dGNqEgYayxwOookziE=;
        b=SiJ+0Z/Uv0grQl8R2/am0e6MlwMLchuN2BZ45v0gOPUZ2cW/MvQHuUgBigcshNjiRX
         i4nQJYQCRCbpXA+wBIFXkLfmQY96zFl+D8+x5GmvTROopCo7sKw9gVb6GscZOXFUbBWN
         +bHGB/5UFZA6T5/s64N/Zac7CYukHnDfX8Z4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788169; x=1789392969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=97bUQEP2eAKwUGTPuhdvhHBw6dGNqEgYayxwOookziE=;
        b=gjiqn2ljmGBqKyuxLkLnRigmXWA5lcLHwuiG5JJ0pIO7uViq+GcjToJ+vCqv2bYc0V
         hoL3hBTguipnnwlxmvLjMVzWAVa1mSIGYX+sSO3isU7Ubq3ghM101mFO15PbJwzwtIG8
         pce/bcskdAX7MSSEK+HmTNK7GFnvcRO5LV5JXiCivH0B12OhH6e34N9XHtyUPfMchsLG
         conHzVUGDctcx5uhndiZR3OGqD9qrnePvPyowz0HG8wdgqzBayXp6fEJ5WXsLMBkN4D2
         XpeU5oN3B/7JjvSKOVgqncD2js+umoR5f/gbuq89K+Ie2UfCJMCGYBY0WeD6m9noOL54
         97Zw==
X-Gm-Message-State: AFuF++kP2AX7R8ZXtO4aW0A4J9vTfhMnXaE45pCoB4GQfurgru8oXLBG
	PM2cMzjginnAfoP4m4dFHh8JPFinBq3BLTGuQZHc5X1HANYnpBZAZ5ATNmhhkwamU91CTyZ7VA7
	x0SlgnnI=
X-Gm-Gg: AYBFou3A0dFw/rvwHcBu3uhOuPRM5Zb0v1BkG/kQOhy7RhDkEbGir6zOB5uB9UxkOqp
	lBwLKXVCSlmg83d2Xy29bGlbSO11JS84cadLWYv85ku9Rayh37p55rTX+8pLBGCR5g7u99c4bKk
	HtAZGUN0K9L13bsZktqGWD1W+tRmeB5v69TcmnKoeDbViEX/ZJnUkJxOKpIdQ8L25m+d5mRDz6V
	55DTfueW+jJ1zbI9oj4TGi7BMHQ5yHWLrEE2ry548RRbTv7bjsNsVGLhMbt4zS3JPTu60/Kz+94
	G5rnOhb2TngbSRId54vKS6nFQnYkHE38NfIIh3gDa6qwQVAg5iGXW9ezJzfTHQqS4SjaJVDjRbQ
	NNK1hebVFMa2VYrxQJG9jlOqfUMq+Bgs/vu5VSQ9vGFrGuZa/prKqh30ujgIen3nJEYqSC6/KE6
	dN9E/ZYMoXfsxunRdSgXPRzAo2Ail/gEbeCzxic0Fi9lATuet9mRz2KtU0L1IvAA1JxQHDf4/2i
	uzMLSbMCOlRK+ag7lmTmA9XpVCyX/kVBrA9hhJHaln/sYDIo6oPwVOfggcmmAX0+aYnaTo5Oe8=
X-Received: by 2002:a05:6000:26d3:b0:485:8393:2176 with SMTP id ffacd0b85a97d-485870902eamr40658661f8f.21.1788788168827;
        Mon, 07 Sep 2026 06:36:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/35] libssh2: Fix CVE-2026-58051
Date: Mon,  7 Sep 2026 15:35:28 +0200
Message-ID: <19c481ffd3824512eb85845f04ae7b08b947b4f6.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245289

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream fix for CVE-2026-58051 using the
commit in [1].
The CVE advisory [2] describes an uninitialized
publickey-list entry cleanup issue affecting libssh2
through 1.11.1.

[1] https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58051

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-58051.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
new file mode 100644
index 00000000000..6be1e81d636
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
@@ -0,0 +1,34 @@
+From 39ea6e1783afcbd72838eaf649999baa2c41ab12 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <vszakats@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 19:12:21 +0200
+Subject: [PATCH] publickey: fix potential arbitrary free in
+ `libssh2_publickey_list_fetch()` (#2127)
+
+Due to uninitialized list entry.
+
+Reported-and-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+CVE: CVE-2026-58051
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a]
+
+(cherry picked from commit a9758da45a52bc8c630ec9493804d0c6ea30b24a)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/publickey.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9ff2e5cf..5af3b50a 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -972,6 +972,7 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+                 list = newlist;
++                memset(&list[keys], 0, sizeof(list[keys]));
+             }
+             if(pkey->version == 1) {
+                 unsigned long comment_len;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index d3f39050474..c2570f2a909 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \
            file://CVE-2026-58050.patch \
+           file://CVE-2026-58051.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

