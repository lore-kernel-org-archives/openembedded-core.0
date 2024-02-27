Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B800BC48BF6
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 02:08:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.3429.1708999732421149708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 18:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P10OgvsX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.178, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so2953382a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 18:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708999730; x=1709604530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EskFw51IvfnkeEsDzldR3hMMD1Ic362yFhpGGSHq+hM=;
        b=P10OgvsXR/a2ng7OVherlALnv569f6nUrXbSm9jh2tN637BefICXaKkeMliD4iBa3z
         DUnnMhWPrrSa+yCDbZocctajMppHWa2U/v6dfC95T4HxhaaPJRXJxtolhN8j4HAPrEn+
         LDK05wqUKUvLNTFaQSo9Q8wzw63vzzO4L7Voo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708999730; x=1709604530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EskFw51IvfnkeEsDzldR3hMMD1Ic362yFhpGGSHq+hM=;
        b=At/KRBaimcJlsCQvTfLM0gAvXwFJgFV+fkrE/DASL+fJiZKFe5GK5u+cRxebsTPzKJ
         fjBblhbwtNpS8GObEwB0Syo9TAIg8kDore0kwmZjL6P5A7fOdu7xLuT//MO8Clyr0KPZ
         jJuP03JWi1iyn+S9SMOuPEGZnp2GHl+/PJ/UQNDDCy4BleaJTGdJC+JPFZvOXShphJ0H
         kI1zyjvYK1wTGqUNVQYccbG76Tm1v3WOghX+s1brXraiWgck7m9geSiFQJ9f8aElfFk2
         ERASwhwZFct7C+OEi/FSzp2yEBaS6ewg5zIz5nThJV6fzPz6M0wTkQoeB8gm7N8/E4WR
         kVzQ==
X-Gm-Message-State: AOJu0YyAVibhwKY87vHTH+7OZcIWeGrj2NnwAfKtwYwkKtNYZl0p0zbC
	/wG87WArOOtMLaLFi9ONAmCsEhsrtHIQCOqRRt/vEmmHPT6Re8LpWsD//gI4vSWWMar3RHvirDP
	6MjM=
X-Google-Smtp-Source: AGHT+IGEOjvX0YnszQcf7KfZXIPKAVyuxG+MXNOTpbyrjsId63qQZlc/RBglAxiKNqmWHfuiajJmsg==
X-Received: by 2002:a17:90a:c20d:b0:29a:4f60:3f94 with SMTP id e13-20020a17090ac20d00b0029a4f603f94mr11020050pjt.1.1708999730451;
        Mon, 26 Feb 2024 18:08:50 -0800 (PST)
Received: from hd-yct-laptop.pdx.yoctoproject.org (97-115-93-169.ptld.qwest.net. [97.115.93.169])
        by smtp.gmail.com with ESMTPSA id sc9-20020a17090b510900b00298c633bd5fsm7235799pjb.30.2024.02.26.18.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 18:08:49 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] yocto-uninative: Update to 4.4 for glibc 2.39
Date: Mon, 26 Feb 2024 18:08:02 -0800
Message-ID: <20240227020801.48857-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196239

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index eaa3e9b31c..4ac66fd506 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.38"
-UNINATIVE_VERSION = "4.3"
+UNINATIVE_MAXGLIBCVERSION = "2.39"
+UNINATIVE_VERSION = "4.4"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "8df05f4a41455018b4303b2e0ea4eac5c960b5a13713f6dbb33dfdb3e32753ec"
-UNINATIVE_CHECKSUM[i686] ?= "bea76b4a97c9ba0077c0dd1295f519cd599dbf71f0ca1c964471c4cdb043addd"
-UNINATIVE_CHECKSUM[x86_64] ?= "1c35f09a75c4096749bbe1e009df4e3968cde151424062cf4aa3ed89db22b030"
+UNINATIVE_CHECKSUM[aarch64] ?= "b61876130f494f75092f21086b4a64ea5fb064045769bf1d32e9cb6af17ea8ec"
+UNINATIVE_CHECKSUM[i686] ?= "9f28627828f0082cc0344eede4d9a861a9a064bfa8f36e072e46212f0fe45fcc"
+UNINATIVE_CHECKSUM[x86_64] ?= "d81c54284be2bb886931fc87281d58177a2cd381cf99d1981f8923039a72a302"
-- 
2.43.2


