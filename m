Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAB3C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 07:03:30 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.8068.1741158204166227110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 23:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R46x5hw3;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf6f3b836aso523806366b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 23:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741158202; x=1741763002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZT5+l8KP/VS6QC9xpNyP1qr2m5FGAHabggdJmBKcbg=;
        b=R46x5hw3gIseFHGTQs8hZLJogGeKvs/eU/SsPjZGrMuOQH1DPTXx6bZew3AFSW/HW2
         C+cra4O6qITzE2mTeV+5DnoKAgPjghh58EyC2my5I2ouKQnoNZnLtoCTlahDd6ZF1cKX
         KufKuw7IHbWQcWCZP0DRrw6Arzc4tGWLmrRozBCkg3Vhds+PDjoUT9f1zh/ddMo/MKCi
         PRv2SIEkgMWfst30SQ/yIfhbXwIL4gVCSBFNLCfsoJj5Uf7pxMao2n5E3VzKr8mvf7Vr
         MVXqUJ69gLeoX2dh5/2KZ/aH4rPNKPpreNwKgXbm/+GhiHu8Y2160T6Wfcbnoc5Y5llo
         khuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741158202; x=1741763002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZT5+l8KP/VS6QC9xpNyP1qr2m5FGAHabggdJmBKcbg=;
        b=agBFGSI/LT+MdScZ+Cxmui5WUY3fTU+33Xo/EKk8IHTZI4EcH1Tyvd+F50DVVfpwEX
         FAunX24m1t10hTTf9oHTd36UmvZy3GursY59QJyfFVeMmAobvyBJj1791j37UKRm/gK/
         q5zwnZ43qKs9zdojB51emRehKSelTydtktyD0LJJ6hg/4MGFbFEDAuSVY4Sf2KLHA/kl
         LNqmEzWUcADgDhST7KOkm0Sr1mFY24Qr9zjvwoBDJV7JTT3bEHwRi+JFhgNHCbrPaJ4l
         lgA02luVVVlVl26d4KZipKmk3xQZqLh9awcF0toUxbqQAopEftBb0nFHiNCecjdXjY/j
         2k6Q==
X-Gm-Message-State: AOJu0Yxoohr3Vx28G9d+opgA/24S8MoVQ+q5WNDQMVKzzVPyO3drvHpi
	c+13/v+UKnjuQJispeOzQV3xh9ZNwJZMUsTioVEam8Ue1tCedFcj4uTLeA==
X-Gm-Gg: ASbGncvIZmJCwi331u3GEOiHr7AWf1kqARvcEPtXIwm6KUtx3GahGEdo4MLjVu0yS6Y
	ttF58Ebhp7NYo+Q2+QWd+HR/gDenuJ+H88D0mV56FHeTLL1v+s6Ow1n61b909gwkEtzSPBJpl6x
	kCDAUrR5ySKv6nzd/PYCHpegMRGCZ5vwAIAEHT/YQ6ZAwO8IhATsaIzeYiZSdF68p2we1u94fM0
	87EnMRDIGH1WwM6DU5NloQTQvZsWebr534DZvVsBEv4ZR2/eAf/uX2Rw7Wwo4gzxnkiDiUVwS9K
	AsaKXNhHnAHyr7vmr6d4BPPSsnolIaCGB0RxmuPvFboNRo02cvOgRpwaO+uX0AjzYpT8sM8BMGk
	=
X-Google-Smtp-Source: AGHT+IFc9avxYaQaQxa94M8XBoxKVDVLxThF5VCRkhDJeLj6Ag0+QTjK1RjEa9dZBZaNX7qYM8fsGQ==
X-Received: by 2002:a17:907:7f2a:b0:ac1:ebda:afad with SMTP id a640c23a62f3a-ac20e042bc0mr165774466b.54.1741158202063;
        Tue, 04 Mar 2025 23:03:22 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1fa7294besm199884566b.155.2025.03.04.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:03:21 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Yi Zhao <yi.zhao@windriver.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] rpm-sequoia-crypto-policy: Don't validate gnutls crypto policy
Date: Wed,  5 Mar 2025 08:03:19 +0100
Message-ID: <20250305070319.74490-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212297

Building this recipe may fail on hosts with an old GnuTLS version,
like Ubuntu 20.04.6 LTS.

Add OLD_GNUTLS=1 to disable validation for this policy variant
that isn't needed anyway.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Tested-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb               | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index f66cb56468..522e9a393d 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -20,9 +20,10 @@ do_compile () {
 	# It speeds up the build and we only need DEFAULT/rpm-sequoia.
 	rm -f $(ls -1 policies/*.pol | grep -v DEFAULT.pol) || echo nothing to delete
 
-	# Don't validate openssh policy variants.
+	# Don't validate openssh and gnutls policy variants.
 	# Validation may fail and these variants are not needed.
 	export OLD_OPENSSH=1
+	export OLD_GNUTLS=1
 
 	make ASCIIDOC=echo XSLTPROC=echo
 }
-- 
2.48.1


