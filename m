Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51795C6FA8D
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.1787.1663122374977306337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=a3WJq6Z1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso13065289pjm.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=RldTtulFJLWQRnanyiQdDoxY2RswPlDD6vojyODelVs=;
        b=a3WJq6Z1hMnOK2ylE2IRH62Zi9mmmirsnhLcRbdFsaQ2Ht3wvd6aXsFkmYEp2gcOlQ
         O6VuCoHpsrJYR/ZBq00+/cU8lwhoc9ZCbC3o7YYYbBr9uq4Vgo+n57MPuBIWTH0SDV85
         6GoO8iq2hY9K122csm00JjZzh0YmIYYP7Oc2uR8uXgSeiqQ77PjS2ifaJGPlPyGKY2sG
         ibYOUTnq9zMe9hIqaJB6UhO7CtkzXdENEEJ2YDTqAbAZcPubMWEcZBZ1x5vbmnQpwktc
         RB9Gec1UKptZcHx3je3otMYtIs/AwNieBCoqMv16Gluuq/IyJsI2tQvWfY3sM/uUG77Q
         zVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RldTtulFJLWQRnanyiQdDoxY2RswPlDD6vojyODelVs=;
        b=p0ATBWcu8qhp75p2Bl34mF2rNFzFR5sC8lYngZ7lfdwyYvcEkRWnd1TbsJcLrk/eVv
         IHUuqon1ZLb6B9qBSAanuSsQcSSp0tNTPOqVuOuTTFMymKRmJqhQEOi3+hvLhs0Q1T5H
         gspfmXKM5qbBOlXgjRkMJOGmU7IgSOeI6Ty1z1cQP6u7dR74AEVNLHDJVak7yfsVIRXZ
         ICWvZwzBhjMTAmEY/f8HzLfJsq4yiw2RPqtGBt7XpTHLizjZ3TBKAoPDU4FPSE5dmfd+
         3c6+eshooJnuNdN3PREXcmuxqx+3/z8vLwjJVATFqgt9TtffLSuv4RkikbI93P1Eppre
         lbAA==
X-Gm-Message-State: ACrzQf1ybtundJFLTaobWVwuu/xybbpyjxh02hkgURvYHGYQh3DYrHYq
	KSg3Ejk1HdrpNwa55xRKurHZgW2L0MQlgpo7
X-Google-Smtp-Source: 
 AMsMyM45Ca9joghytq4MeA0GisIotQymo92FnvP+4vIIMP2C1A+1F/pzmMI2Zo8oRaK8sjdQDWoiXA==
X-Received: by 2002:a17:90b:1e0a:b0:202:e897:9bb3 with SMTP id
 pg10-20020a17090b1e0a00b00202e8979bb3mr2282086pjb.169.1663122374016;
        Tue, 13 Sep 2022 19:26:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] gnutls: fix CVE-2021-4209
Date: Tue, 13 Sep 2022 16:25:15 -1000
Message-Id: 
 <d08031bffafbd2df7e938d5599af9e818bddba04.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170623

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2021-4209.patch         | 37 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch b/meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch
new file mode 100644
index 0000000000..0bcb55e573
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch
@@ -0,0 +1,37 @@
+From 3db352734472d851318944db13be73da61300568 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Wed, 22 Dec 2021 09:12:25 +0100
+Subject: [PATCH] wrap_nettle_hash_fast: avoid calling _update with zero-length
+ input
+
+As Nettle's hash update functions internally call memcpy, providing
+zero-length input may cause undefined behavior.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+https://gitlab.com/gnutls/gnutls/-/commit/3db352734472d851318944db13be73da61300568
+Upstream-Status: Backport
+CVE: CVE-2021-4209
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ lib/nettle/mac.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/nettle/mac.c b/lib/nettle/mac.c
+index f9d4d7a8df..35e070fab0 100644
+--- a/lib/nettle/mac.c
++++ b/lib/nettle/mac.c
+@@ -788,7 +788,9 @@ static int wrap_nettle_hash_fast(gnutls_digest_algorithm_t algo,
+ 	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+ 
+-	ctx.update(&ctx, text_size, text);
++	if (text_size > 0) {
++		ctx.update(&ctx, text_size, text);
++	}
+ 	ctx.digest(&ctx, ctx.length, digest);
+ 
+ 	return 0;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index e9af71c7bd..f1757871ce 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2021-20231.patch \
            file://CVE-2021-20232.patch \
            file://CVE-2022-2509.patch \
+           file://CVE-2021-4209.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.25.1


