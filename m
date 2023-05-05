Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D168EC7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.30342.1683300050268502844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2L6ucBLq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-52c6f81193cso1334666a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300049; x=1685892049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23a68kV3FOfk/Gv3ZeUmWVouy18wRnqQlwkTKg+3MvY=;
        b=2L6ucBLqFqRA6AgbvwHLa+a++ZHza37vTiptZPh1lSQVn81joKPj6S1opy4/hDfhMl
         IjLBFYiI89MLb8akN5GMQAmGtOHPXtcCmobrimkqhjFleSnULvZMIFgmWG3BdAfJWqcG
         Q1fK501zySzBjUmIJqHOLesCuy06NjuFRZlAuWOTHhb8fiRDxzhz18CBeFnfXKdNe89Q
         AdxNxXbyaWeh1CB2gh1QaI95CdtdA7TItLDfzw2/Npwi/k/NcVtVDDpME8vj0XI2kpfX
         Br/zhUA2eSp0wf5X5HOV55GoNHBFrBRfkD/T0vrZhr618p9w08X9ffBJJFh+2/8J8jHL
         N+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300049; x=1685892049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23a68kV3FOfk/Gv3ZeUmWVouy18wRnqQlwkTKg+3MvY=;
        b=KC319nE65fhA2g/Q3Iw0JmGYYF+n2MqwGjb1u+4kYi1bBLX4PXZ+CjfyJb7Qh1xLZb
         XvqOiJXW4R8YRABn1G450woZe/cymxHHElogTRXxpWN/I48Hyt8eVOkcNxZaEYqXk8Yg
         35GvStktYpR+kNntWixbqeI7xMTeZXIO+mx7yzr7uqx+2dZLtrGydqVwIp5sTsqWLsXI
         Z+AP1/AuPS9B+VfPbmuKxuA2LHMCf9QA4ewEWtzQEf7sQKQKJVOpIrV8Fa58sfV7gujM
         o0VCmZCiMIBHq7ccP3iOZ6K03DeqPfIt+pDqqAhhviHfFE5wpWHGhZ0m+SXuVHgaFCNn
         CKkg==
X-Gm-Message-State: AC+VfDxhdG6LpoEISpGyM+8itXCjfT4lFHYJPQbRg/1A+3s607zHRcAw
	KdlXUNz6x45Vb8PiAYG1oy/MbzATQg5vjmmlKjA=
X-Google-Smtp-Source: ACHHUZ5y13C7+WPuUvhAfq+qoh0QgiyamBGprk1CREwUeuidoT6zRztYUbAYWQcr7gfF4xI9OX/hmQ==
X-Received: by 2002:a05:6a21:99a1:b0:f2:f505:951 with SMTP id ve33-20020a056a2199a100b000f2f5050951mr2814699pzb.13.1683300049270;
        Fri, 05 May 2023 08:20:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/35] vala: upgrade 0.56.4 -> 0.56.6
Date: Fri,  5 May 2023 05:19:33 -1000
Message-Id: <d87a885a5b1f57039cf715504f6caacfd2dad097.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180942

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Regression fix:
  - vala: Improve initialization of namespace fields with compound
    literal [#1424]

 * Bindings:
  - gio-2.0,glib-2.0,gobject-2.0: Update 2.74 symbols
  - webkit2gtk-4.*: Update to 2.40.0
  - webkitgtk-6.0: Update to 2.40.0
  - gtk4: Update to 4.10.1~40b154bf from 0.58
  - gtk4: Add sealed to all the final types
  - gtk+-3.0: Fix ToolPalette.icon_size get-accessor type
  - webkitgtk-6.0: Update to 2.39.90

 * Various improvements and bug fixes:
  - codegen:
    + Consistently handle GLib.Error as boxed type [#1418]
    + Add cast to accessor calls for generic property implementations
    + Use g_object_class_override_property to implement generic interface
      properties [#1419]
    + Add declaration for register call of dynamic DBus interfaces [#1422]
  - vala:
    + Correctly handle pre/post-increment expression as index of element
      access [#1417]
    + Set proper value-type of unary ref/out expression in initializers [#1421]
    + Allow assignment of namespace fields with inline allocated arrays
  - gtkmodule: Improve error messages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e3eb6b4e6477dea953d4d93d2eadc5f430c160b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala_0.56.4.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.6.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.4.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.6.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.4.bb b/meta/recipes-devtools/vala/vala_0.56.4.bb
deleted file mode 100644
index 32fa81a08b..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.4.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "862c41d938543ed3d8d86c8219a61087797193defee8da0c50caf49993c66b6a"
diff --git a/meta/recipes-devtools/vala/vala_0.56.6.bb b/meta/recipes-devtools/vala/vala_0.56.6.bb
new file mode 100644
index 0000000000..bc5f5477d7
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.6.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "050e841cbfe2b8e7d0fb350c9506bd7557be1cd86a90c896765f1a09a1870013"
-- 
2.34.1


