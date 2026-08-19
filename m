Return-Path: <roosesweb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA91C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:22:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1341.1787120532273431083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dVQG0uBB;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso4609645e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787120530; x=1787725330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwsLxxHQiHKwXu1TiRSspliWFtg6Lwra2IFaGa39S6w=;
        b=dVQG0uBBCuMcuZoo+RmWYnh3Hl/TV9AGvEPx4RAg5gaKvwGSEgehL9N7d+3a5N5QnY
         mB4epE80x2K8EPyAffSZxpdR5E92VnIMfB8HDLb9EfAbmHBHmxS/a6YNJKIKTJPYSnp0
         aRHeb4an5LZFOzWtC0bqvGgM22qvnLj7TFYxm83Lnje/DmRstf+alPOb8r3kv494pjtT
         Y4N1E4Y1+jOHbyzAVmCmYRr4CIVALHljYXwF4GLxYuR3C3TX30HGPz+z3w02C7A2rVwM
         vucunHo+74iX09slwPkv/oE7TxEJsmWUf781WmigPjxteEOHqEmO59/OwJk0jd/pZoqy
         Yv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120530; x=1787725330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwsLxxHQiHKwXu1TiRSspliWFtg6Lwra2IFaGa39S6w=;
        b=aNePJgJMV7EenNH5Aj6Ub3xwwA8GCdAYYDdpMcLemBAHDiHJ/ja0qm92UcpoIXosEq
         cDOPslAV2uFRQSiIvS2ft4ltDJ0PqPPrCdL/GMeFmqCsJSvjRDn8oDJtP+GtqybA0FUP
         4kHgeWtdfddCvsvQC4TIPRpR67N6O5K88Mb6WgtOMto6O6A8ewfBnXcvXB5rTDO6VP3L
         GuLzts0E9R//Ezt4QmRPLctzDbhbJTMzzw/NRA6GCdEng0xwz0yPn/9HfQTeWvfFlOcX
         FwemNaXQNaGH5mTlMLD4KvYfh/z2zkVVtyHSRKz/SwvpgwX5YKEverkZo7qP7Zsusk2z
         FCbA==
X-Gm-Message-State: AOJu0Yw5mz1UwTYLfyF6mXi024BOQjinbv8cB/G5TBjqQNPFjnZUqW21
	F7g+ZJjPOSMSrTCl7ZjN9L/Lr52Xf0xUTC1OiLyZjNClFxScChECZ7s6DDsbyCd8
X-Gm-Gg: AR+sD12ExLBbz6fTJ14q0BDOHVPzZrBpl44DlNdSmXEOCmKdsOSh1Xx3/YzlY0mVtuU
	K21S1egdXXjcegO3L0ib1IjDD2Rfc5KnTr1yik6y8QxIHtpNEKPxd9oevUNY+PEg5H8zw7ZIIo1
	DCj6GuYMONoFRFSPTsvlK3jKHxvFyu7/sSLo753vy93zl7PlwRQ4thYT1VLSU3Apblftj5L134J
	9O8lemydZxsUaZOw6I95EOMTxFgmUh9nceCW5XRuwlcz5aNVgHBq/tdeEtAawKWmQSyvKXFVXiz
	8bdnA+E7o42WMYSGDoSwhHf7uxGekb8PyTrK0ZEiH3e3VtJ2LsNcqThqU7qF1kdrdIjgnTmejYQ
	8ygo2iIlbVWzECXwJXqBjW8RNI72/zouuJCL72FBx7I40kM3QuPAl7/rKSHh4Fe4SZEnBvZ3t1u
	OvOo+3Yd+1II9fECwNtMq2bwbhgSAs3wM+1stYgbk648lulPjSPIPYrjcEkRBFLD/HBjvJ6q0C9
	tOl9yr7zd/YXZ7mwTDKZM279Pmkjq6+YA==
X-Received: by 2002:a05:600c:4e47:b0:499:8743:77c8 with SMTP id 5b1f17b1804b1-499aa17dfe4mr40220335e9.8.1787120530473;
        Tue, 18 Aug 2026 23:22:10 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:810d:ae08:d00:a23e:1b00:ebf4:5b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm32900085e9.13.2026.08.18.23.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:22:10 -0700 (PDT)
From: Thomas Roos <roosesweb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 2/5] vex: skip the VEX symlink when IMAGE_LINK_NAME is empty
Date: Wed, 19 Aug 2026 08:22:05 +0200
Message-ID: <20260819062208.680468-3-roosesweb@gmail.com>
In-Reply-To: <20260819062208.680468-1-roosesweb@gmail.com>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
 <20260819062208.680468-1-roosesweb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243708

An empty IMAGE_LINK_NAME left a bare ".vex.json" symlink in the deploy
directory. Skip the link, as image.bbclass and rootfs-postcommands do.

AI-Generated: Uses Claude Opus 5
Signed-off-by: Thomas Roos <roosesweb@gmail.com>
---
 meta/classes/vex.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index b3c2aca..eee3af6 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -204,7 +204,8 @@ python vex_write_rootfs_manifest () {
     with open(manifest_name, "w") as f:
         json.dump(json_data, f, indent=2)
 
-    update_symlinks(manifest_name, link_path)
+    if link_name:
+        update_symlinks(manifest_name, link_path)
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-- 
2.55.0


