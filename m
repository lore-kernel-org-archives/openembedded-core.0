Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A699D37496
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:32:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.48944.1729171926734794035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O8xDZS0h;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso8486345ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729171926; x=1729776726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSGi3TxCKO04jQPIsfOhWEiHTd12/oACdoFlBXUOqOs=;
        b=O8xDZS0h5GCyGDCFOykJUoHqjR88Ht8TpkyoC4pQxWO9ni5LMdFmim+TONHXMfDF13
         UQuedTrZwrXab7Mo9xHexZdmoCaCN69CI5LvAL4EVa3eeJwhW+APNRqY5jzHAa/eHSey
         LOysKZM0pjAjUjNFWKdizJNZGc6yWk+u8geDYRg5sXizdk+AxJXRPcPJX+141EmMPqrr
         LB2gkM8d5ch6OSuQNYfs4hkNTajF2mHrr5kTsSOk2mdDiFGtuS9dwT81YkWfVRv+NMlj
         H5mDoU0hkiH4IuZXsmlUa6ZTIYvaPJqBfZxOYNWkL9o5aX91gBahkO0Y3qM7863YHiGn
         DSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171926; x=1729776726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSGi3TxCKO04jQPIsfOhWEiHTd12/oACdoFlBXUOqOs=;
        b=hHFCqaV7fHF9SXwO4pVMyRzsuwHLI7aejRsLCj8Ld/c25tdbHq+0CBlC015bCKY9Ng
         +Y5sUuVIgG2EBTwB6pq7dKJa86Ow76oYPGOjeGbPJjyR/kly2WzNuMPf9aSkHZvosSeo
         MrqZhmwjieT5b01ldjaAee8+tc8Wc0AzfA5UM/X2KsadQpdZs53EVe4MaFb91ny2HtyC
         Y8Fp52tPnGYQ+FCoQLjjtH0k0uieNbJ/knLfnipq/KPeEva1YLSGATKfHQqFJeKEfk5a
         m2rFGJUxu3hT7xOMZ/CkLOmWdF/W1gTxH1cHddCitoswWMzo7F5KFzYwm+xipcHcDARi
         j10A==
X-Gm-Message-State: AOJu0Yy+MumI4tPYLF8AJM1zNIh/wg4/aN4sf+99EMQyThJNnNgNGEEI
	qWhbeRYc0skX6ZI9eHAbzmYGYpe8zGcYsgsmkCQx4+PhbCiERB84mS0qnlVLkeuQe4hZ7h133du
	p
X-Google-Smtp-Source: AGHT+IGtxOKxcknoYPrucFwJGL1YIK2MGaURqj5qsfseZM4NOP3WZc0B6YI9FpRIGdIgKbyuk6QRXw==
X-Received: by 2002:a17:902:c945:b0:20c:6bff:fcc2 with SMTP id d9443c01a7336-20d27f2fb13mr86284875ad.56.1729171925922;
        Thu, 17 Oct 2024 06:32:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b093sm44161595ad.254.2024.10.17.06.32.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 06:32:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] gcc: ignore CVE-2023-4039
Date: Thu, 17 Oct 2024 06:31:53 -0700
Message-Id: <d74fd7c4e9353fc00f0b79f05de101efb0148a6f.1729170868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729170868.git.steve@sakoman.com>
References: <cover.1729170868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206021

From: Peter Marko <peter.marko@siemens.com>

Last version bump removed patch for this CVE because it was integrated
in new release. This has caused the CVE to reappear in reports because
2023-09-12 is "higher" than 11.5...

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index c316d2a9a0..5d29b8e61e 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -121,3 +121,6 @@ EXTRA_OECONF_PATHS = "\
 
 # Is a binutils 2.26 issue, not gcc
 CVE_CHECK_IGNORE += "CVE-2021-37322"
+
+# This is fixed by commit 75c37e0314, nvd uses arm versioning (2023-09-12) which will alway be higher than 11.x
+CVE_CHECK_IGNORE += "CVE-2023-4039"
-- 
2.34.1


