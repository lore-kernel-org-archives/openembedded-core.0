Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24ABC36004
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2945.1742372184665577145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/QFSjFN;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225d66a4839so6126595ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372184; x=1742976984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXbSqvhVSsKvj7vj8l9HWrGMl70WPnCT0uvZi2+V6L4=;
        b=L/QFSjFNYsRKfeUcwfeggPM8A7hJI9Xl3RaIcnMLEVIfY8ouDZRWGXl4LUMcAbyumq
         qWrW1wEDvcusf1cD5vSD8Cwqx7wIgtEK5DAondZ7taAVe+Mhl4Wnh5/vogP0vZmdq/Cl
         OS2DqIReZPizU+8vzxHEPUzMICAx4wwPR9ARMmP/j1NSzLuIDA1iffT7qMbrLrHoNQQ+
         NHAiisMqqmeODy1zRVHpVym46V1xgRD/pAYNRhKpoNUjMafASRN+weInUpr3gIPr6knK
         QB9Kf1ldpHn9z4+4T/2z48W0BEOy7iCYYc7HjCqj9QJp45FMrStpXfAuAz8tcXvjoijG
         3How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372184; x=1742976984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXbSqvhVSsKvj7vj8l9HWrGMl70WPnCT0uvZi2+V6L4=;
        b=nykQjGvU7OOrMC87ZrJcjEA0qGlJ4fDKugX0ZzKYCl/tjhHrgvGLhwXW8Iyz/bhgVC
         fvGpJKPFbDPzB3spZL0EaxS+0om/nxGnlADibhagtCfa8wXo3AxNkpvg5FxK/9gHYuiM
         WmQbBfQ7GSrGU+B/FxE3S9fsjF+JhmqpsCmpzywK5xSva78/T/yUgWbRmLVAg7c2jy63
         JKE2O2L8UhjTm00pqmoGKDNpPleAH+ZgzDOmPr/GGUHcq5bpbZEx+2mQ9LSJqyJjmxFZ
         70oyv1nxVf3qjCk9rXT5dMsXHhYWzFMVJYJ2yy3lZMoNIW9mpnSOKfnrZnKJf8CkjxfH
         ePXA==
X-Gm-Message-State: AOJu0Yz/9IRiZI50Z7XDaLcXKa5PAMc23tjJEmZQtHK1NDBwFUQddZ6C
	jIOoNafB2ywkPoDsqzCtg7GcR2yvhJ4cfldZAvprxW6pU2mD1OaaNRwoZOG2
X-Gm-Gg: ASbGncsYvIZLm572ZGD87rE3x6ehL1Ej6jDmcPgSDyXZ2JdIoCFFAn1phYhWjfUXM9w
	OFyvbeYedztI/vNgqkkv8g0C73IveYmc4j7h+Db9Bhlrd5ndsSq/PKj+wY8OiCCNzM5MWfo7nJT
	LmlYoD9Ga330Un0TlXIvOxztZR5rcLfeokeIv9UBb/FvRWSFzoWiwrOt8XszGTqmoiomKQhrq6E
	Z6i2UiNpcIAKdOTAqUkxjOFn8w1D0LAqCEU616PIjjticvCNQjShSdkQprkQ8ltFu5egQ3C82uz
	QHcNWPuGaX4xOKWs1lyY/N/NgQ2Qqrby5EqL
X-Google-Smtp-Source: AGHT+IEt9uWJUOkJXaIjcaBw5u5miYMESmCFEzLKMmur92H7qAmBuFSiOf/YmVl0RhX2TUbYkLf+Fw==
X-Received: by 2002:a05:6a20:144e:b0:1ee:c830:abdc with SMTP id adf61e73a8af0-1fa513b8f30mr8868830637.15.1742372183860;
        Wed, 19 Mar 2025 01:16:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 12/27] dbus-glib: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:15:40 -0700
Message-ID: <20250319081610.3536475-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213278

GCC 15 defaults to C23, it can not handle it
latest release is from 2021, and this seems to be
deprecated upstream and no longer actively
developed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib_0.112.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index 4753997d3d2..33675f50fd8 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF:class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 
+CFLAGS += "-std=gnu17"
+
 PACKAGES += "${PN}-tests"
 
 FILES:${PN} = "${libdir}/lib*${SOLIBS}"

