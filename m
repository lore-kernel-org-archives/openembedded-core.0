Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71CFC7EE21
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:19 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.10392.1682179092568642614
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NA4zos4g;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-51b5490c6f0so2887095a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179091; x=1684771091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rc1yBFSlek2eETfAFBNhmVJGiXURnJ5+S1ajXs6e/dM=;
        b=NA4zos4gbI7IVxgqqbC2Tkd8Mm94LWCUa1B2Jq8lAyMY/0qNPOXwy8nCR/6HIXVX78
         PIFxO96DaC/vOss5cwP56fEvsMoCTgbnaMj9rU0/X+w7t7vg8V6QACD6uyptyiijdMkf
         P6ROA9sHWke8t6HQRSu9gnOwUqSaUmiYE8e/VZZ7t4pfc3PltnvAdexsG4rCC54+sYDX
         dkJ46LKGm8ve4rSYPoxhPpOhZK9lSCB/GnPhxGA2ToiqAimGgRKVRUmCHtvfcSD7pB60
         /UoS45ALlckZmlQaaPxlN9tdqHgDyfCEGYNUOZTrL7UBC7B4wYESgnZsxutyUD6ss5OY
         Tl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179091; x=1684771091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rc1yBFSlek2eETfAFBNhmVJGiXURnJ5+S1ajXs6e/dM=;
        b=ATFeYwo3l1P0MgyKPl4rp0q5kwaX0MFHSftMUhZ4deF1k1sprb9Xen42ayE3oNGKXG
         TvwmlVRoDkVpd2AfyZ6823k8nobUkQASh3zXT7HytD4uLCfMsyDjiQJTh6acCUr1p2d2
         j/j/0njwCt+QZgEijLEN+xi7j5KYylkg6K2QBKT6WYj9KOTPGO6Qvla973ZDgFRE2VkD
         exl+oDOWLxd4HMiFq/7N/28UbKKDtgX7eNQVlZH8w6HmLrDWzXhAGS7GvNB6beUri0qz
         +1VQunRwhKoCl9E2pHeyaw5X9l902C0vZeWRuDcsBXIGKEEgeAzPGRAqEEYeP3Z+rnLx
         88rg==
X-Gm-Message-State: AAQBX9dTUHdSNkg8PzngkESozaCJ+j4g6zfaknb8m0txoQDKiwX9pHM3
	8RRXvePRuM/r9N3yvro0zegx/dzejcZSK4HWw/g=
X-Google-Smtp-Source: AKy350axi8IPWBCeb5ZVsK+NCFv0riKORVHjJca7rH3Uzq5vD7zGDwzGiajDJQZKXI5CQkCP/efsPg==
X-Received: by 2002:a17:902:d4cc:b0:1a6:b971:faf8 with SMTP id o12-20020a170902d4cc00b001a6b971faf8mr10775500plg.53.1682179091589;
        Sat, 22 Apr 2023 08:58:11 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] curl: CVE-2023-27538 fix SSH connection too eager reuse
Date: Sat, 22 Apr 2023 05:57:58 -1000
Message-Id: <b2740d1ff74b2c55011b5d4230c7b06b5109376d.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178944.git.steve@sakoman.com>
References: <cover.1682178944.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180312

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-27538.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
new file mode 100644
index 0000000000..6c40989d3b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
@@ -0,0 +1,31 @@
+From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 10 Mar 2023 08:22:51 +0100
+Subject: [PATCH] url: fix the SSH connection reuse check
+
+Reported-by: Harry Sintonen
+Closes #10735
+
+CVE: CVE-2023-27538
+Upstream-Status: Backport [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 8da0245..9f14a7b 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1266,7 +1266,7 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
+-      if(get_protocol_family(needle->handler->protocol) == PROTO_FAMILY_SSH) {
++      if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_SSH) {
+         if(!ssh_config_matches(needle, check))
+           continue;
+       }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index a7f4f5748f..46ee25da3a 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-43552.patch \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27534.patch \
+           file://CVE-2023-27538.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


