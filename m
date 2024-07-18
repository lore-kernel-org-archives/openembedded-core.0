Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC28C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 12:57:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.14370.1721307422611970625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 05:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K3T5mfqS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-368313809a4so1005927f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721307421; x=1721912221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDbDZvyLNPzvQMrnpeQIjUOf4KsFAYqtFsAh/3blt7Q=;
        b=K3T5mfqSk5xlJ3IhINVAKeXMuRM01PCLCIyywgWL16bMcGq7CTeqGHbJUEZg/1bUjC
         8xCbpqGgYv1JY/knNgU5znH1myFIeHZImhZTSM4I/kI7qyopkX1indISwWHIdagEMmWY
         uuy3fKIV9rNy5x9zy90v7Fs1PH6ehM5yjHgSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721307421; x=1721912221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDbDZvyLNPzvQMrnpeQIjUOf4KsFAYqtFsAh/3blt7Q=;
        b=mOidiPKKilwdzcjosXSIES7BCFwBrSCiYDZYENJ+albzpZsHPzG6M77ufWIBtWIWH2
         VeWelsxzXs42JqMvDZ/ixINBDAGlaKfzeYZSk7iBYlmK5UAgi3JMH1fpmS3AzJowNsRd
         X18RLqqQA5rhrrecniRB35OZ21EQZmT7lpfnLjy51tITGmi0R/GiVLRy+D+c59/wDeUN
         /jQp7I5k1a61FNuq0pzhaZST1NHRXlliOdgXDByh3F6Re8inlAZmGYCX6lCWhwGtbm3e
         rXHyJ8UDL5pYfxeTrO0RlQAut72RGFvsjHG9AQfvS94Xx+LdK39mlWwHnw7LR/sdyUYA
         QvBQ==
X-Gm-Message-State: AOJu0YzC3e8+7KdzzuMDPWRK7BWzDp+ikGiftVNTVTPn9Ah0N9wmv6Go
	2PtrB+c/9RhDxnmm0bL7egyNnIXgWHBvMhJdsoINfMO2sJtJ1PlFyVuXpKtQ1UqLso/wsIBg+mp
	X
X-Google-Smtp-Source: AGHT+IGqOr455wxSUzjGypZGU6tRis9RPIYmIADy7QBI/r3+DjT2x3g6wNo32A7sJEM4afUSnhLUMQ==
X-Received: by 2002:a05:6000:d0c:b0:367:9048:e952 with SMTP id ffacd0b85a97d-3684b3a727amr1931802f8f.18.1721307420702;
        Thu, 18 Jul 2024 05:57:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:490f:365a:34f5:8141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a635cdsm13375165e9.13.2024.07.18.05.57.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:57:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] populate_sdk_base: Ensure nativesdk targets have do_package_qa run
Date: Thu, 18 Jul 2024 13:56:58 +0100
Message-ID: <20240718125658.4067198-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718125658.4067198-1-richard.purdie@linuxfoundation.org>
References: <20240718125658.4067198-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 12:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202210

We've realised that "bitbake XXXx -c populate_sdk" doesn't actually trigger
the package_qa tests to run. This means test coverage on the autobuilder was
poor. Fix this and run the tests for SDKs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 8d79d88ebe4..342281efd21 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -385,6 +385,6 @@ do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
 do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_package_write_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('SDK_RDEPENDS').split()])}"
-do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
+do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb do_package_qa"
 do_populate_sdk[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask populate_sdk

