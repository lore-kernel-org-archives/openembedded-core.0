Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B47C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:33 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.50468.1710953070413214380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QMZdTnB5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5e4b775e1d6so66115a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953070; x=1711557870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shtJfcZ8wRAXrdgxJT+aqQDcjm9BmdjW8s5AuYlo3D0=;
        b=QMZdTnB5bT5GLFKVj/cggBaw7WLjuSQztBsc6g/WoYv4CiEcVEXupEGVPg5sNUFAmz
         GJ5EHoCKBfH2iE8ukxwKYxX+JLcCkTatc7MmCg7qCYSEE2Ilkunr+sa64kWoV+bq4djh
         xK1q+ELrbmm9TQvtVDKCIFxLWDh//vaAEbq4tbZHKdNFWPTBgbkP1HuOf9uQv6TNCTym
         owhD2f+96d7ussyzbgWDXIesUGQXCEZn4vyqPo+KQIA7XTLLifLUjD61svxWgOeJi80z
         Ab5WLDZGWby76OWMGxn2ukCOMStHeKOM7H33GMYF6UXh1Wa7SrCw8O/RQ3yrq6rSj69o
         wvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953070; x=1711557870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shtJfcZ8wRAXrdgxJT+aqQDcjm9BmdjW8s5AuYlo3D0=;
        b=fBq/8bix4fiBX3bPcp/jFnW9WCzYvfMaaOEWwGHl41YAlltBUcTjHmEyeqlXkAUczt
         cY36YFtENkMYJ1PF4wYmFHJEaRXOcgx7YQ/z1fdwlO/h5Eth8I/Gkz5MKfCKr+mTP0b7
         e6m4l3X4U7y3TqIPsk9GUBNyCwFkoJ9WvPntnuMJWOkscIUgZEM89aqGkuT5Fiyr57L3
         bjE81tjhLrAMkHdaJlsYvYjpRQxIyMYp9iD3p7dA1GbhWGJlIaMujjlMlSW0uiWQRJXu
         9ZLE1Wgt9BCsmu/KVjq/wIwEEzU2ttWppqyrJA1fLKqacMxMzRxGvfsIkaKD9uHKggdP
         BtDQ==
X-Gm-Message-State: AOJu0Yxv1mIFEmovWxiBG6Uv8CuJR+glBn81waSHtYGqWaVfpN7KSMF+
	Pw1Y4+BvebuEDaC56BUYRAJhiR9jA5e50qGP63XTbtIs3OWSJdO+beYF9l3hmUOiNe3DFTE8/Pl
	4gqE=
X-Google-Smtp-Source: AGHT+IEOvX+/sa68ocl1nRKkm7LW0f2LT8dw1P1y84ToqUMqzYHfa7xXyRONQCJzkvbYl+X6KzWN+g==
X-Received: by 2002:a05:6a20:7fa2:b0:1a3:64be:752c with SMTP id d34-20020a056a207fa200b001a364be752cmr255630pzj.26.1710953069647;
        Wed, 20 Mar 2024 09:44:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] cve-update-nvd2-native: Fix CVE configuration update
Date: Wed, 20 Mar 2024 06:44:00 -1000
Message-Id: <80946fbe8c95169b871d816f2b71ee001a2a3d75.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197393

From: Yoann Congal <yoann.congal@smile.fr>

When a CVE is created, it often has no precise version information and
this is stored as "-" (matching any version). After an update, version
information is added. The previous "-" must be removed, otherwise, the
CVE is still "Unpatched" for cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 641ae3f36e09af9932dc33043a0a5fbfce62122e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index a703b68aac..0044529b7d 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -352,6 +352,10 @@ def update_db(conn, elt):
                 [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
 
     try:
+        # Remove any pre-existing CVE configuration. Even for partial database
+        # update, those will be repopulated. This ensures that old
+        # configuration is not kept for an updated CVE.
+        conn.execute("delete from PRODUCTS where ID = ?", [cveId]).close()
         for config in elt['cve']['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
             for node in config["nodes"]:
-- 
2.34.1


