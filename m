Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE23C25B7E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.12847.1715774190931219557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JJ9abh2Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41fe54cb0e3so41995735e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774189; x=1716378989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wH1li6xMCpVN77dF3ypvQ1pvCXJPpfXR8CeKPE0HP0s=;
        b=JJ9abh2ZGNyxzTDbqoUHua6YcIuwnXHso7Q2v+9TaxKJfXkfbEROgJXBJp5GpUd5Pr
         JKul5jMU2Q6UWwNuljwwPGnRaG8xeEgqQmg/miXUbvEVkrxwbSoRTCSy+j3+ELK+bERd
         STRAdiMnyuwniSQV48khG4EZx3f0B3EmlrvtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774189; x=1716378989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wH1li6xMCpVN77dF3ypvQ1pvCXJPpfXR8CeKPE0HP0s=;
        b=p7s/iESHsQinAWqcfl6LwEZi6uPuYj6xrhKhxKwqr6fIXQIkGFL74Ur7D3d3RuEXs+
         uJ7x/0PXJJg5OduVBXFc8YpqgUfpkFtgRKczNatHmT9VtZjQOTNEW8TVIiSGmDmzB/s3
         W7HY3Lbw2cjaSWUgnFv86z70NDZJodiOnB9zZfyGMRXqLH3B1IkjGezqW4nJWNUTUitD
         jMjnkxAwLRCsvvvbmmURirCTuQVvb53Ak/NE5RJfjrOTdPWn49BCWMkDkdFAS0inmN85
         r0BPhkSeCfLF4KPuySJIXDfBEe/MZcZfDCqrE5uUlhTopVhfQRy+PuFvr7Iuj7jUW9K0
         TPZA==
X-Gm-Message-State: AOJu0YyFGpmFH+SChLOaTEiqieY8FgzdKzEzPvC4+2jTMSFw71NbRyHp
	Hgm2U8YrbyMl9pFF83demw86uvH2St6kvmBnIfGibUeDPpLTR0zDRoDrBP/fnss0vOiX7lF98hg
	8+qI=
X-Google-Smtp-Source: AGHT+IFs9s5ojpnpcfRKVn2T2+DtIkPmX7tCGJ7QHo0mANIeXcWwHYTYLew9e5CSsXHaS4WxWd0meQ==
X-Received: by 2002:a05:600c:3589:b0:41b:aa11:29b3 with SMTP id 5b1f17b1804b1-41fead697aamr110571265e9.35.1715774189320;
        Wed, 15 May 2024 04:56:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] build-appliance-image: Remove warning about S not existing
Date: Wed, 15 May 2024 12:56:20 +0100
Message-Id: <20240515115620.420558-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199286

Disable the qe checks the cause a warning about S not existing as this
recipe is special case where that doens't matter.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index dbb257eda1b..e406968df2e 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -129,6 +129,11 @@ python () {
     d.delVarFlag("do_unpack", "noexec")
 }
 
+# ${S} doesn't exist for us
+do_qa_unpack() {
+    return
+}
+
 create_bundle_files () {
 	cd ${WORKDIR}
 	mkdir -p Yocto_Build_Appliance
-- 
2.40.1


