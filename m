Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E653CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:33 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.49398.1710951031111374873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2ZDNr5ae;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e00d1e13acso23500645ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951030; x=1711555830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHO7zcpN++T4K/yoj1mLAkUqMCfyo17sDK2LDVZtdWU=;
        b=2ZDNr5ae9eys//yQsmtEd7qDRdJtxu3n/v3n+YPy3r+gbv8JK+oZLXeuXEBVviCM4D
         /+2C25pAj3r3AKWGhhJRj5PI5vXspz9w1Pt/4iKPP5hkSGHQf/RGg1Vl+nqEodte9Ler
         BE+89jvjcTlCpVSaPs83G6v6Pbj6U2eAJ9ho8ZVAD2bbCuzuT8/1DhaE4EZA0QiueGe9
         YuX04JoQc1lGA5MRWBMGrkLglqAXGQEEknaDy/0aRe9y6UhIibs0bXrEjJ8BPZ6k9aHk
         BJKO4mnrRCvJEAFfHUd5PlMZLrK9ort/yJyhMcmYYj4J7THdIyjNRqSbnVUJ4a/Oup/R
         Dnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951030; x=1711555830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHO7zcpN++T4K/yoj1mLAkUqMCfyo17sDK2LDVZtdWU=;
        b=FN6XssDy8HC/Q6EZX5IZmvCnFvnLONJBpV77aRLlQxGlwWYuEfBpkSEHaa1GY/MJ4e
         mi9+yLH+WhIr7842un/MMR2+EPZMhmYhh8PJupb5Qa9PgGnTHeSfwQmtrQoXi3kl5GSU
         TJ++Ks+7RfEGml88Vz6wBCE7yHJORppP5XdyUIdGnCKow7o5AeL+6JPFqoQa+PC7YaiB
         yGqGYeTfINwilzn8gC3Hc0szJdWmaVsdNkLb1EolqBkZCWgoAtdxr+mghRXJzK8BxZ+C
         JVdF5r03iqrgdz6Az4MPDoNgpiMfRZRKhV72dIrZwpSkxig4DhXmM2saQ9OyFEUDHpIu
         9vUw==
X-Gm-Message-State: AOJu0YxtH9HzpTKAvNSASViiMjnG5GJGyDhULH6pB2eWa53dn9CEW9fC
	qzpaiwQrwYcMZ78C6o6J69zxk1Anna9xUAlgqmCCfGCn2sxszJn5nhE+sD72M9t8CmwhLHYp8aO
	Aij0=
X-Google-Smtp-Source: AGHT+IGkzEXnzf+xuS0kzLBqMHs9KGqTeJufRlT0JHBjASWSXL6yKLFwehZZFNcDoOVKC5gU9fJ0sg==
X-Received: by 2002:a17:902:e5c5:b0:1df:f9fc:c9f7 with SMTP id u5-20020a170902e5c500b001dff9fcc9f7mr2857835plf.61.1710951030377;
        Wed, 20 Mar 2024 09:10:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] cve-update-nvd2-native: nvd_request_next: Improve comment
Date: Wed, 20 Mar 2024 06:09:45 -1000
Message-Id: <a98387021d80b5055a773f909eb685513902fb12.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197378

From: Yoann Congal <yoann.congal@smile.fr>

Add a URL to the doc of the API used in the function.
... and fix a small typo dabase -> database

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0157b3b81333a24abd31dbb23a6abebca3e7ba7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 506b4b6bbf..a703b68aac 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -123,7 +123,8 @@ def nvd_request_wait(attempt, min_wait):
 
 def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
-    Request next part of the NVD dabase
+    Request next part of the NVD database
+    NVD API documentation: https://nvd.nist.gov/developers/vulnerabilities
     """
 
     import urllib.request
-- 
2.34.1


