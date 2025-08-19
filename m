Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FA0CA0EFB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:25 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3355.1755634090522690769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T7DM/6XJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso6829865b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634090; x=1756238890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRwt1anOj95EnmnJlJzuA4807O6a38ZlqkJZLhUNHgI=;
        b=T7DM/6XJ4hSULzDMWaJ5iHVZSCrq5uxOKVw781iWwSDV9eEByjfcgF/Od/3tqB/5hw
         LcEsoTr0FKvbq3wHjOLeK94EooBQWJZORmyAOZK8YduJyGb1o5LC4zF4ojt3gO4lEiXb
         bWrznar3i9J/AHH+T7UADhijzGvAhY2fN1cWjt8vNKRc/gkKF2t7wG15+aqBiuBNkiz+
         clP7TvpBxS6K++JJCJTQfVKKrEdnVFgYYoxLqAwbI08zlIk6RGtoE32oFbeBo/7FYAM2
         6NoMsfApjSB5o3lhPksLivdXVCUTLOQDCou5b04Wp8QPB1YTPPwqbgmK3DVHEfo53MxB
         KmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634090; x=1756238890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRwt1anOj95EnmnJlJzuA4807O6a38ZlqkJZLhUNHgI=;
        b=niIp/Mr5uraXv/hZ0PLP0AKs/34VrHgdD2XIAdv1RCPEfHU9fqofuJ23kRaE8bTHB+
         xtmM/HzYUohpDIZlwp6oqssOarrxHrabRlWNxpGhELBxn3ISD5SPBSbpPxkneC5AhVmh
         EEpN2NdeV3vV4DVLsdrZs8Zn2At8zS9n3XFkKeKYT6W+/1w/DqcxvviBgebuMeGNj39L
         SuouQZ1pw6mbmRcmC4ob5Z9XQSmk9v1BUR+JUEgcBPzt7CgoYHPkTW+TlWIPi9dr6u65
         +kqxpJfOnKpAzU82hF0lWHOE08kOfDA4nCBaTM11u254MinA0v2kIMkwzYXjjv1H4rnY
         kdQw==
X-Gm-Message-State: AOJu0YwglInhMjlG714Dw03IvHlXdB8ohzjihKXW5/CI+gG+WlnL5zoh
	3w5T+600jvs6TfebnKs3fTb8tjdSZh8v4kPOI1j+fL/YPZNhKG2SPK0+jOt7/vdRMYqkTAdWr3+
	JVSg4
X-Gm-Gg: ASbGncv4nMXI1v1kAd5JWIkheh47WzVpjFXQjmaUi0izaXpJihuVj6RmYrTmeQvPtt7
	jLPE7XZhMKPQ2kAnT22SiasapMDhdl7Kwxr/z+wjhiWD6yyc7rnGLKRbI3pm0uOpDfcqJOlm2VL
	q+jbJ5rKP/avhDAbS6sG8up3SOufBt13QYfnl878y0Dm5yJELsdsPp795Eh+skwIGCE34y/vTkZ
	BcKU/S4OJemdMHVYPE5myOIXjSNHdbtEAbNAXTR1fi0vSXmyXVpqRgW/lj32IVr78yaAV4ChQAP
	8wI96vKGjacjKWztdwEheUsu/9LiSiet/kpFQ7OFTmm70UOlFs4DU0D66EmJ55nbjw5pHgvZ0uB
	cZlBhNpqDGlfNbQ==
X-Google-Smtp-Source: AGHT+IEj9GtidmFC+x1eLT6U5lQ1DArkapfwB7iYX6ueBKGjLo5H0Dt3tQboQEw4YZVzxcOEBfdOJQ==
X-Received: by 2002:a05:6a20:6a04:b0:231:a5f3:4d0c with SMTP id adf61e73a8af0-2431b816096mr869900637.26.1755634089744;
        Tue, 19 Aug 2025 13:08:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/10] libxml2: ignore CVE-2025-8732
Date: Tue, 19 Aug 2025 13:07:48 -0700
Message-ID: <348ce728af1cea4f909de5c3597801b5612719e4.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222132

From: Daniel Turull <daniel.turull@ericsson.com>

The code maintainer disputes the CVE as the issue can only be triggered with
untrusted SGML catalogs and it makes absolutely no sense to use untrusted
catalogs.

The issue triggers a crash if an invalid file is provided.
Source: https://gitlab.gnome.org/GNOME/libxml2/-/issues/958"

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.12.10.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 078988286a..a155c3708e 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -32,6 +32,10 @@ SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be47223
 # Disputed as a security issue, but fixed in d39f780
 CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail"
 
+# Disputed as a security issue, if attempts to process an invalid file, it fails
+# https://gitlab.gnome.org/GNOME/libxml2/-/issues/958
+CVE_STATUS[CVE-2025-8732] = "disputed: the code maintainer explains, that the issue can only be triggered with untrusted SGML catalogs and it makes absolutely no sense to use untrusted catalogs. The issue triggers a crash if an invalid file is provided.  https://gitlab.gnome.org/GNOME/libxml2/-/issues/958"
+
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python \
-- 
2.43.0


