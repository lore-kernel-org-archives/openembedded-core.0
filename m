Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56144C47079
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 11:21:47 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.26881.1704194500380393723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 03:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JmrRfTmq;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: philip.balister@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-781708819c4so393572885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 03:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704194498; x=1704799298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/NM4g9mYSj83phVlQvBV9SVWTxFOPcU0tLuVZpr+lfw=;
        b=JmrRfTmqy1A/WdW8fNkzZRxmAqnt+Uz/Rks405REPJo4D+VI+lTdmYgj4/YtP/U/oV
         UszVhns/dAA0iB0+3fJYufCwqi518cn65xePiCQ0JFDsfmMapnLnzknHz0YY+izRURsE
         JFXJT4Ec5YFtG1oeSOWbeJSCFUIGTRbH2BwRAPOIW0qEOHz0awiFoXbwBITH+xfeou1O
         oPYL2UQOUhoCMB127cVNCZQKt8Stq/HZnEW+KZAJp/AVHS5bSb7wqrGOIa7/+aGI/5sJ
         44ytnUKsW3GBEor8YkOFFo55yRdkT2oS76AnMZxqmg/IZEFBu3ao5LAHBC0X4pw6y/4u
         f/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704194498; x=1704799298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NM4g9mYSj83phVlQvBV9SVWTxFOPcU0tLuVZpr+lfw=;
        b=khBnWbRS9VGzt9XXrwG94uFpIeD8EghljYmxhPLchfJblfS+/4LHq0R5pDvpCtToYV
         zWEw8u8iXXt8IBOfb437IJvUS6ijPInNFF2vgkFaoLO3GlSK9njCuOKwmRZkkKZ0Su/b
         /aYxMdthO2I1W2LNnwP5ZCXqVr5YUsjl0Ya+vqLf6AYIj+NfQkOgKI6S2U8iBeRXDowh
         nT2yMCGcqO6iB6Zg7N0SwreiZcMAkiBidjSGM4G5dfNXMrYfTgnROp+/rwd0mLnZyXNM
         x7XnSGda+8NG9IKPHeNZIBIMEAkXtXnHSzoRUVyofGmICoUXPMPAt2UjxqdZNmFNYznU
         xVVQ==
X-Gm-Message-State: AOJu0YxhnUv7Xc1gfRojC+wyiOAPd5N1LNbVmc6COSU4E7kMBQjO7gWv
	hyNE/r7P/ifpnKKDwkueZfnIr3R4Uh8=
X-Google-Smtp-Source: AGHT+IGMrgmNma9JiFKEnIcFUiSV/XZL8kKZEk1qdyMnDSCb6iCQfNSLdJYhXYdDZ2FSFoVpbOiCUA==
X-Received: by 2002:a05:620a:4586:b0:77f:2ee7:3eb with SMTP id bp6-20020a05620a458600b0077f2ee703ebmr19776909qkb.128.1704194498416;
        Tue, 02 Jan 2024 03:21:38 -0800 (PST)
Received: from dublin.hsd1.va.comcast.net ([2601:5c0:c200:483f:d85e:cf85:5150:cedd])
        by smtp.gmail.com with ESMTPSA id l8-20020ae9f008000000b00781b8f4c89asm1777622qkg.43.2024.01.02.03.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 03:21:37 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [PATCH] sanity.bbclass: CHeck for additional native perl modules.
Date: Tue,  2 Jan 2024 06:21:35 -0500
Message-ID: <20240102112135.3594972-1-philip@balister.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 11:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193227

Since we use the build systems native perl, we need to check that all
perl modules required for a build are installed. For a default Fedora 39
install, autoconf-native and libxcrypt both fail to build due to missing
perl modules. After taking careful notes, this commits adds checks for
File::Compare, File::Copy, open, and FindBin.

[YOCTO #14691]

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/classes-global/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 9b824915f2..57353b9478 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -532,7 +532,7 @@ def check_git_version(sanity_data):
 def check_perl_modules(sanity_data):
     import subprocess
     ret = ""
-    modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper" )
+    modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper", "File::Compare", "File::Copy", "open", "FindBin" )
     errresult = ''
     for m in modules:
         try:
-- 
2.43.0


