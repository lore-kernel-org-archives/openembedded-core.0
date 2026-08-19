Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D45CC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10424.1787155080949190839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R40M5SyD;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4798bea72f9so673787f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155079; x=1787759879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WX4j30XiJIMWSnCzxhYuNhBuY1qu+uX3ny26CVEhzms=;
        b=R40M5SyDv1KL2Pu0vuDJdwHIjcOmXB8TI+VNJS6hobqZ1xNaFF+32rPQcrrOmXd9YX
         +Lm8JYzIOkH2AP1mA6l6FIaoC70Ba1MYnD2f28vYYQGtxJJg7djEaTw9Emgwgmt/LTHw
         ZeFfXauDi2VYJFuq5u2pzREpMx0ayMFTjLkCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155079; x=1787759879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WX4j30XiJIMWSnCzxhYuNhBuY1qu+uX3ny26CVEhzms=;
        b=L3qGrkCdpw8gc8DKNHHqOMLH2eXLXg9nuK6CK4sSprI9g1v6qU2vetA8IKJQO/JnzO
         rmyPoQsPXx9D17Rqd1qgUbnUUNe+Ev21o7vZ3FNemku04NFJMllNu5MDH/F740L3TFK+
         0L8vCYn9P5j96tFG5QSaQQP7z/jgoN7isgd6giyn86aUgaluwurYqdSBwz/F3EAW4dyI
         t8VhrQ82m45AJc+0EsvnAY2++ljB8jsfqrdY3a8o1TCHn2pHue0Lra8cdRCEuX80Ayq5
         4mtvyR5zw4gF3sJQnQaiubnyKIgNkx5AEYmnRiSWeTwT1+B4eYPTVmsFz3bLZwnx8Oxg
         68RQ==
X-Gm-Message-State: AFuF++kAyxyDBUxAd0t/Wmy835dSFzXQ2tWz0/WNtNY3ObFi6tjZa5/w
	5gB+nriwp+Z2qelA7C0mAQjOpGztvqhPEaLBoQdXjiAhsymRow8ig6VlLj6LFZuquNF5BU62NS9
	KmQnteiU=
X-Gm-Gg: AR+sD11G53FXQASagSVUxVWJMZqqTa1Qs5RXK3p6rylVPch83At73IQcMuragQYkLSO
	HKnjLSUW3rj7KG2/GNAM+FPkmqb+3kQJXEPO+e8YbLfwrALbBVPcgvrpBXBhGX8Cphr2O33AT6p
	hOTYGzHDSFp5rT/bowTiOEUEk3d75wdQEdD0+l6uSJot8fgNf9nyR34pGbs5+GwaT2yaec7BCwa
	PpsCbt3DMm+Whfi4eu2FjF4X2+ijCz5hTHoIccUR623Nuzuu3lELVdXYr7kKJD9Qwxkdd663GdG
	kZL+UaVkATTY8rlxfqF6AFq9BMSdClNItDP4BqWwnuM2P5qdILFl5uNlWPih9Zk8A+UzhKpsPTy
	q+wJJUs+waypzzfs5VbSy1XCGwUz8vlDMIK1dghr3dQr/9s5zKy9caHRASxsJ/zpvxYLxfA26tg
	dbJt2BHs1StVw/TB9+iXHXOd52u6kC+5nRLmUHgjmPrE1UgQ6mZk7S271zPtRPvk/9DsaERq6z4
	oO1VOh0TIJLL24sLo3fU/w7tYhaCGUz1pR7u0EXA5TMmot510AwmaBAB7eZ+uErSgnmMA3qf13Z
	5xAklpacmFyTkla66JYtT8w1s/uoWFfIu8JPZ/9+
X-Received: by 2002:a5d:5f09:0:b0:482:9a18:d757 with SMTP id ffacd0b85a97d-482b1e9620dmr12246305f8f.9.1787155079147;
        Wed, 19 Aug 2026 08:57:59 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:58 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/37] libssh2: fix CVE-2026-66034
Date: Wed, 19 Aug 2026 17:57:05 +0200
Message-ID: <ccad500dbc7e8979873eee2bde1bab8616ba08bf.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243770

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66034
https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804cd898d9

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

(From OE-Core rev: a19d6c5bbc4e2b4ab4803397e78c70370243a553)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
new file mode 100644
index 00000000000..906356baf28
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
@@ -0,0 +1,40 @@
+From 16720054e0b3f02e36f31dd04add534d73d4a18d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 11:19:49 +0200
+Subject: [PATCH] publickey: fix potential OOB read in
+ `libssh2_publickey_list_fetch()`
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-w6g9-cpfp-22gc
+
+Closes #2202
+
+Backport adaptations:
+- The upstream fix uses ssh2_err() which is not available in libssh2
+  1.11.1. Replace with the equivalent _libssh2_error() call.
+
+CVE: CVE-2026-66034
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804cd898d9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/publickey.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..f3776d2d 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -988,6 +988,13 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                 }
+ 
+                 if(comment_len) {
++                    if(pkey->listFetch_s + comment_len >
++                       pkey->listFetch_data + pkey->listFetch_data_len) {
++                        _libssh2_error(session, LIBSSH2_ERROR_BUFFER_TOO_SMALL,
++                                       "ListFetch data too short");
++                        goto err_exit;
++                    }
++
+                     list[keys].num_attrs = 1;
+                     list[keys].attrs =
+                         LIBSSH2_ALLOC(session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 5633d3bae4b..e2872c335b0 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
+           file://CVE-2026-66034.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

