Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28132C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:24 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.2879.1643917883014660330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hLZWQule;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id v3so3166185pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WouBtHh1zoOsKRzb1Xewz7A5jk2TXGgTfBO5fGrfn9k=;
        b=hLZWQule5vJwsoCjTa2Ct5uzl8+xKuj/MF7YSVo3Lo7unDenstL/pgH/ULK6XkfYnn
         51ywTEHiCfXkaTLvdjrsMls+zourjZbat1YjXd9dy5CJ+0tvlPtEJDlvqIP5Fw59Ekr2
         qDQ9CLCYfVXcZjePfLJ56wstzOcXSc2MrhIma0CLvp+nrQNlP1WLzhxkbZOhtmsaieqN
         /FV+7/iioQIoD7/YnbkheB3KxP9XTug9TOnT0tchjULVo+WNSgey0iufD6JFR59APGiw
         QDGqUO2Lanyjta3S3fxQldsLy7GvpNEPj8AOwohiM75tuKB4rKjF2H8ToMaSoLb1AHlq
         F9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WouBtHh1zoOsKRzb1Xewz7A5jk2TXGgTfBO5fGrfn9k=;
        b=A0QwWr8w5L4o6i265Oo3FUtu0rklAp5u+KMnBGlHH3VaV0z8UWYn7s/W1tfg1Z6IsK
         wfnFm3cQPsM/5WBiw1HqLwBLYtc91x5OyQNPBfLxZHeipWw4Ec4MrlGvikwCjuJoLTSN
         jEURmFiNCvYC9uPfA4f3UhLhQuISZN4VhorbiB7GNO5i5h6kkIdP6PLRvfcbaXf9xy5K
         hsX2pOIzRpd07c0jYNXJNhfGKhRDLffXZYIIvQkr7KoZ3mUGLCx4dWUEm494Dfis45+3
         oR3kupkNim76e5UiY5UAcdGyQj7mUkxgJfeJB7GUC1gAO3bJzjLphOGNcTwqdDpposgy
         LcPQ==
X-Gm-Message-State: AOAM5323K+ufy3qTVGqd2d2GScAzK9mawoHfwgLNe2AtR5EDxYSR3q1i
	xbBaj7hO8OjIhnvwPAWXyz01I0JuPG9ckK/U
X-Google-Smtp-Source: 
 ABdhPJw4UQjKGIzLThRyN2Yye2CtIZ88MqL+hEKexskq0LyCOrM5l5R0O7qlYMBaGwn3lkMbMkWZiQ==
X-Received: by 2002:a63:6342:: with SMTP id
 x63mr29433073pgb.148.1643917881930;
        Thu, 03 Feb 2022 11:51:21 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/20] binutils: Backport Include members in the
 variable table used when resolving DW_AT_specification tags.
Date: Thu,  3 Feb 2022 09:50:33 -1000
Message-Id: 
 <ea0ed611b6440008fc711ed63c0fbbd299adb86f.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161304

From: Marek Vasut <marex@denx.de>

Backport binutils upstream patch fixing sporadic link errors in c++ code.
This triggers at least on arm32 and aarch64 with qt5 based applications.

The ChangeLog part of the patch as well as space change is omitted.

Binutils bug report for this problem is here:
https://sourceware.org/bugzilla/show_bug.cgi?id=26520

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 ...in-the-variable-table-used-when-reso.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 6104bec591..903b9d7b01 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -42,6 +42,7 @@ SRC_URI = "\
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
+     file://0018-Include-members-in-the-variable-table-used-when-reso.patch \
      file://CVE-2020-0551.patch \
      file://0001-gas-improve-reproducibility-for-stabs-debugging-data.patch \
      file://CVE-2020-16592.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.patch b/meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.patch
new file mode 100644
index 0000000000..dc1e09d46b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.patch
@@ -0,0 +1,32 @@
+From bf2252dca8c76e4c1f1c2dbf98dab7ffc9f5e5af Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Sat, 29 Aug 2020 08:03:15 +0100
+Subject: [PATCH] Include members in the variable table used when resolving
+ DW_AT_specification tags.
+
+	PR 26520
+	* dwarf2.c (scan_unit_for_symbols): Add member entries to the
+	variable table.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e6f04d55f681149a69102a73937d0987719c3f16]
+---
+ bfd/dwarf2.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index dd3568a8532..ef2f6a3c63c 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -3248,7 +3248,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
+       else
+ 	{
+ 	  func = NULL;
+-	  if (abbrev->tag == DW_TAG_variable)
++	  if (abbrev->tag == DW_TAG_variable
++	      || abbrev->tag == DW_TAG_member)
+ 	    {
+ 	      bfd_size_type amt = sizeof (struct varinfo);
+ 	      var = (struct varinfo *) bfd_zalloc (abfd, amt);
+-- 
+2.34.1
+
-- 
2.25.1


