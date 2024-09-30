Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC76CEB2CB
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 22:29:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.68382.1727735357645812386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 15:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXDFmHFb;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7193010d386so4225974b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 15:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727735357; x=1728340157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGYXCDkJsC/7j4LZ21THWlk06F/KjvJtjnCkcreZ0NA=;
        b=gXDFmHFbeeIxHrEYuub6/yf4/gyfTGvoc8OrR2J/y/foSDbltphTiI1Kk7Lbf9fFhl
         E+Kl0FfRl8AvcdlCqWIiruOr3qGrODxeKD/OODeT+7e5IIBJvutks9vpUF49s5ErL5AD
         Q8s6QKwVk1CzAjfsgyT+zhsHLfFl//7X1ltVDOD4B4CEktJ3uh/N0p182qSehVpiAvCJ
         ue+kyZvcUmUQLhd5vyIIN4b3xQLq6b6cKuA40Up/3UyAgqJfzjdW3Nw8moNp/taP0hp8
         Lk9f11VOf1jbSeST1RaziZCZZ8Re2hyxVVa46k3BmLDrID9KHrpdzoZTMuk0dbGTqz1v
         A9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727735357; x=1728340157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGYXCDkJsC/7j4LZ21THWlk06F/KjvJtjnCkcreZ0NA=;
        b=MpNX6GDEyWgmO+F8hTdJElsMQXevruhidtmofpXt24eQQv61SlqigzGUblD9LTiasY
         Pxr4KQofMbXuOaIG2v/bENDDGkUC2JloQ9LKG+pI5Hrpv456k7ly/9gwzvjbhBFRhwWO
         a3wLyl7WMI+VMFvvbEfb7sWT1k46163vX+wPM1TsmHx9OPNaVbWkjZdd+2ia243yVXgD
         EqKg8M1hr/mEnVwa3M+DVBZ7MSoD09Kq680+Zrmdskvkewfd0J+iwL8HThWjvYZABqvf
         Bpk9964HrHXwVweZnqpgV3qD+oZbWJ2l3rf7nPCHV+QOo5WlHiTwV7/agrBBLlmvknAf
         sq8A==
X-Gm-Message-State: AOJu0YzW/gdvB6xKS2csphUltF4mZod1895obiYXvcyfoUJ9XuLNTmDf
	3+JRiGqC0Gk5gJV4mnP+4boPoin2rdDCA48pR+stdNQxLHVJd+NYaN1qCA==
X-Google-Smtp-Source: AGHT+IH5pOSm7LTygWD1Sl/srr7JYlLhq6PeRlwwAUPlZGtOK5BG5dgY7RiN9FcEPVljl7evAeOCsA==
X-Received: by 2002:a05:6a00:10d2:b0:70d:323f:d0c6 with SMTP id d2e1a72fcca58-71b26077721mr21077311b3a.24.1727735356838;
        Mon, 30 Sep 2024 15:29:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ae14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b7dd6sm6774526b3a.46.2024.09.30.15.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:29:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 2/2] linux-yocto: Enable l2tp drivers when ptest featuee is on
Date: Mon, 30 Sep 2024 15:29:13 -0700
Message-ID: <20240930222913.3981407-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930222913.3981407-1-raj.khem@gmail.com>
References: <20240930222913.3981407-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 22:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205127

openl2tp ptests from networking layer depend upon these

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 87f7794bbef..cee06c22ea3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -66,6 +66,8 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " fe
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 # libteam ptests from meta-oe needs it
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
+# openl2tp tests from meta-networking needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cgl/cfg/net/l2tp.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"

