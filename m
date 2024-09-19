Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D53CCF3962
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 16:26:38 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.24223.1726763192468957714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 09:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TmGfNO/Y;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a99fde9f1dso92726885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726763191; x=1727367991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlbenvjtZES7Efz4Tk0+xGXPfe+rOrWt4S79Tw76KZM=;
        b=TmGfNO/Yg9DrgPQQBa0mO03uoXgYeYqxc683Nr1BxWY01u7I55mkouGrUV1NiKjCac
         Oyv6veZWu/98AGwAUDsSDnQDU3PEmiud+y1Yc8kPk83u3LcbeJrHob5FuoVbpYoEXRui
         iYsCJDQd6bGGl02yds5B4WjzUWZp1DWiPi2RMMEBxitQSLTuB0xpecl8f6WOg6WDgU7K
         dT9qUUIlyRNYurQ9sLCgis3Uh5pk8DpEqeeRp5WaP85e0RkEYfa6YDmnfYBT9J6LLYBa
         QTBf2ylaF5E5xb2i7zaOtUJcnVz+7QW4vxtqL1kEpjgU0Va08HuJCUxtNLfxAPg1uePZ
         rzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726763191; x=1727367991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlbenvjtZES7Efz4Tk0+xGXPfe+rOrWt4S79Tw76KZM=;
        b=P8xxc3F3mBtMOKZZ6k1RgQP9tV2MY3y0mfczKqHJspBN8Xbxp2dhe5b3xk6VOPqnmq
         wzqPpXsIEg8Thy/kNz08LwHeMCgeX+tcdie2JDpfn03jOZiAfjsPvtm4SBulrpn0AfhO
         hFu2UUkhdFsYdf7RToweRkAWcrK70mU1LOjFA6/7rheaR4gUKgZmH/+KoWm4p2MLGcaA
         oTU/AGw8+imZozQycJXcvZPGxTSiJRHEEtXCjlHoFsDQFXrcdB3yEHZ5nHllXp7QT9q2
         JDb1++jFn68xYDLeDMUWOkJlE16g0Ozm6CHsXorjJHnaVfWLSDfhwC+Ujj08J6kwyrex
         fGSQ==
X-Gm-Message-State: AOJu0Yy0p/PG4HvHp59y9FXSOO36WUZ2jW3K4efLD/+lUZCjGFnLo1s1
	BcMbBboamremUXGsGX5WXpVyOlaIwKLj/0TIN3oMW8GmrWVuByV1GaZ4Qg==
X-Google-Smtp-Source: AGHT+IEX3vKv85zhYOSxImpa6pFbFiYoadaBR6D5ZYQ0MIZZbh1ZYmvh847mAmSFVs4SMDEIWhPJJQ==
X-Received: by 2002:a05:620a:4110:b0:7a6:4a8b:46f1 with SMTP id af79cd13be357-7a9e5f79719mr4316098685a.48.1726763191200;
        Thu, 19 Sep 2024 09:26:31 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08bddc3sm88636485a.90.2024.09.19.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:26:30 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 3/3] libpam: use libdir in conditional
Date: Thu, 19 Sep 2024 10:25:00 -0600
Message-ID: <20240919162500.2642940-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240919162500.2642940-1-danismostlikely@gmail.com>
References: <20240919162500.2642940-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 16:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204709

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Using the usrmerge distro feature for this check causes the -native
variant's build to fail. Simplify the test to be correct for both
native and target builds.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-extended/pam/libpam_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-extended/pam/libpam_1.6.1.bb
index b9ef564f564..c9ef40bf234 100644
--- a/meta/recipes-extended/pam/libpam_1.6.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.1.bb
@@ -155,7 +155,7 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
 	fi
-	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
+	if [ "${base_libdir}" != "${libdir}" ]; then
 		install -d ${D}/${libdir}/
 		mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
 	fi
-- 
2.46.1


