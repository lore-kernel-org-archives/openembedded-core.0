Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7008CC83F01
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 14:24:06 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.18360.1693491837601110492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 07:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nOS8CuKG;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: sweng5080@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1c4b4c40281so1095151fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693491836; x=1694096636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y851bnEUWtDC2IlEsDuFYhpisCDrzQGaui+bhqOL1TA=;
        b=nOS8CuKGD/EkNlilo/kGJ+eu8VNnMJkgJXi/mEb3yrpYIVHNNnCoTHfRx4GbrX91pF
         Hdp/KNB+WteMjeD/uR/bWKcfUyFz/Pz4XtyfvI9JagjjT9ZFgkCc0U4/cKvYjPAHq8fI
         N/DjJuOmhcCIbwoKvKiJVwekxQmM6n3JKHIZN7Q7DAJAdCxSEDNKFj+rSxZ4YlFn8MAR
         6iAEXm0mT3p0o94IBLBpNgoySaSloS7LTsm62CmeclpcYPtPtlN3VaCSBVDbB3pfGE6+
         2YTnvqWqE218ouSE2WgHlvWPjNQOHCxBDLVHV/2DoHFuAYvlp+w51zOMxEm7v/mY3hke
         i4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693491836; x=1694096636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y851bnEUWtDC2IlEsDuFYhpisCDrzQGaui+bhqOL1TA=;
        b=FGwL2dhQWTzaG7eNkaRv+xWipTORkJEbZ9c0aUa+kjPW3P5AjRotqlIUnw+76MlGfE
         oTcJVMGv3Oe5wQiEfc6XdKs9/r9++Vh1/o7smKZZDmdeLPYnkUrUKzgUXJgjoJ4ZoJav
         TvyfBvwnqNSogaQU4DSd1vbbrbO0dnvYyQtf9AiPXlYCOUxPreqGByDI/2bxqxXsaVAF
         zXzC7efukRJflHfn1d4ys1DBnK8Z0kpA4fXDGvgP8Z4GFkfO5mlFy0hGB6RYjn2vdpPg
         nhClVlyQEDIOpWFigICe2D0jW27PhVRbsUcZ7WlrSF1B3sH1OESyM+wQRYCX8XPGtkiN
         i/ag==
X-Gm-Message-State: AOJu0YzDPuAonjXjhGEtLNAffokaO416KsmlatAX04PJuXbrvSRqe/an
	bM/I2jxBQ8XQtYQ6ppx/WFj65JrV460=
X-Google-Smtp-Source: AGHT+IF6ppNdaRWbQZfa2TF+EaNheo2fv91+UnkRJJnzcfxG/ttk1s7qCnPPcL0ZLenmiPO4QR2wMg==
X-Received: by 2002:a05:6870:b68a:b0:1bf:8978:1eb8 with SMTP id cy10-20020a056870b68a00b001bf89781eb8mr1823145oab.17.1693491836572;
        Thu, 31 Aug 2023 07:23:56 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id h2-20020a056870860200b001c548ecc52asm903879oal.13.2023.08.31.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 07:23:56 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [PATCH 2/2] ppp-dialin: Fix groupname gid change warning
Date: Thu, 31 Aug 2023 09:23:05 -0500
Message-Id: <20230831142305.10981-2-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20230831142305.10981-1-sweng5080@gmail.com>
References: <20230831142305.10981-1-sweng5080@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 14:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186978

This patch fixes warnings when useradd-staticids.bbclass is used and
USERADD_PARAM is used to add the user to a group that has not been
explicitly created yet. By adding the GROUPADD_PARAM for the new group
being used the warnings for changing the gid from GID-OLD to GID-NEW
is eliminated.

Warning fixed:
ppp-dialin: Changing groupname nogroup's gid from (WXYZ) to (JKLM), verify configuration files!

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 8a6c297cb0..a7b566515e 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -23,6 +23,7 @@ do_install() {
 }
 
 USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system nogroup"
 USERADD_PARAM:${PN} = "--system --home /dev/null \
                        --no-create-home --shell ${sbindir}/ppp-dialin \
                        --no-user-group --gid nogroup ppp"
-- 
2.37.0


