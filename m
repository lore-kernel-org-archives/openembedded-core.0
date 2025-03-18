Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B099DC35FFA
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.4311.1742272743004442029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ngdj2ij2;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22548a28d0cso141195675ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272742; x=1742877542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ynk6VseWbOQWH7Z9/iUfjbzkDci8YP6WROlYoMRCllk=;
        b=Ngdj2ij2Bup871Gcr9yzgs3G8RVm+0lDioJ+F8qvPAMviCStqvEK6FRtc7s+rh/ttk
         RBnLcI67hReFhfM9miM5MyOvSQnlwLVCtKpWj9W+4BtXEgg6rFB6RtKAs76qZX8dRhsq
         GQf9Kvh2FcqKRWP1L4rfpCs9S8qxjc14D1ceffQEFdLIirn4Ci3cdqEs8gTyHDKurc6p
         POir7+9p6F9+8eun9w4quFuG14q7Ir2Rjyh0Hz+1Qc7OTEQ3BSd9fT11n6XAvtHT7lTm
         R8w9bRnzfXcOTuuZWwJJgkHuO94S7S0GqnxEdd5bPUOEItDSNP8I3XSETpusoBx1tiMk
         vsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272742; x=1742877542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ynk6VseWbOQWH7Z9/iUfjbzkDci8YP6WROlYoMRCllk=;
        b=isrkuEzkfRJ9FBegffLIXyLEJRpluw/ZAfUG1aU4lcwQKTm4gOnjltvqeRz2sTIBcS
         zNEik/mU5m9Id3Qb39ED3Mwc9eD0bfUEt6U6EZKFGIJQNYHWlHBUUnAAS4SD/5ZpXxLV
         CM/K8rtZ/uVdc+bNtHU4N0PeOGF5zDei3EOmLXqP/xgwEHAwk7K4OuoYqhjLieEOHf1h
         e36s4udz6HdwsleeUxPQV85y43VXtWTlQQy0AA/1C80+EiCknBKSoTUucFXE5YmLyNgH
         9lQ713ta5V3/yaJ8+TKh/hGG/4PU/+J4r+pqWUYXdC6TS0vrckRw2Ru0SnEvZbfKjw8x
         JIEw==
X-Gm-Message-State: AOJu0YyEAf5eDUcIvFa/AUll8knyp1Cfh1YhNb5DP/b8b1D5aBH6UpsG
	3gFsThdXBlMcpvUDZwb3qBYCImAOT8NkSJSZaNneegPSYeJpdtc5ZOnHjzUW
X-Gm-Gg: ASbGncv4xQHmDbNLtebS2tT0VkrbR5rzwvUNdpaHkKfXhODL1pk6iRAvUm+si5Wt/eJ
	yrRL8V5lHGUggNu3HRpMMDsx+JRk6X0eRnDdh+09Uyow+BpqjyaW/1+WW+wdaLVvEximusTaMfA
	vKwpDC08i9QtyRtodDlX5ThF/jtcKlF8ppUhylbXiU9BPVzbw41WVqE/yPhNuLNXgL/JgONyunD
	rXwdHwiN+tHgVHUqgipE3PehOL/PRaocO2FiBturMxqRES4awUakpa+J4fi+IXRxom+MRucpfiE
	Wg6mHez/87tSpmQE4lEHDAgsodvUpO7fFJh/nijXYyArlRo=
X-Google-Smtp-Source: AGHT+IE/AszHYYVu2fBECfZw5Jo7k94cJqjE4hfiYUZPhQcJjDn/kQbH5IYqvzb1RNk2LlMQKQu6qA==
X-Received: by 2002:a17:903:4403:b0:224:1c1:4ac1 with SMTP id d9443c01a7336-225e0b1a9b6mr189517685ad.47.1742272742269;
        Mon, 17 Mar 2025 21:39:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 14/24] dbus-glib: Fix build with GCC 15
Date: Mon, 17 Mar 2025 21:38:34 -0700
Message-ID: <20250318043846.2422141-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213148

GCC 15 defaults to C23, it can not handle it
latest release is from 2021, and this seems to be
deprecated upstream and no longer actively
developed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib_0.112.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index 4acf4356942..e892348262a 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF:class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 
+CFLAGS += "-std=gnu17"
+
 PACKAGES += "${PN}-tests"
 
 FILES:${PN} = "${libdir}/lib*${SOLIBS}"

