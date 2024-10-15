Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6C5D1F9DA
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 21:26:01 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.8350.1729026964638794534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 14:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNoa9rX6;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e2975432b8cso943345276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729026964; x=1729631764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfY3nWq6qRc31bOWYknr1JRJ+kvNkuceyEuTEx5NI2E=;
        b=cNoa9rX6jcyTfglFRFcPwMGHkpYih5vaCUikwQPai02AZHU+Mif6krskswHTpx6qtz
         wROBnKZRI2qnRCJ0bHL7KakEeEbzhGyCZzSmqDR4DD1MNAhRnpkOwlMRs3NmTVSiFdCW
         O6asC+m6/bJRHFex+titPRH8dqCcdDwq/jG09NxVtDtwra8PsQW8wWQ8V32bbe/e6Hbr
         klJMgJbBCac3+F08+kCQQ8Coz0uJJjTjP4QbobyLp9+N3yL6ug8q1lpDW27v3tIRKhWS
         i2utLiU7sANHqUIUCo+a4R9vBfeZqNQsB86GogNlL75xxhpdT0eSexQKWQWmoUEVeBjh
         wPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729026964; x=1729631764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfY3nWq6qRc31bOWYknr1JRJ+kvNkuceyEuTEx5NI2E=;
        b=QS5YJnMBiXMhBHPER87QpQUYptG8j6kJDv145JVSUgmXDnmvvkkGSfXeUliP3Rc2/X
         638gTa4FUtcCaRcYWQwTFAj34tAFq+33SLoTSv+lMgz/N9r6BS+L8gNC0HtlhSlaaWrZ
         MJqMnTMX0qdVXxPe8V57/27g+5lkThUm3WctrwRBGSMudhJ8mTtHxDAnhOXAyzHPorrB
         xZsx81XmKo21JR6ou/x5zdzVfNx72wZmJAurgjaljwTo9Zl6N05wOt0usTzKG5u0feJ0
         lOOjZLC+S/Xg6soGwKGVjyZp+XqAW2FW25yuGCR7gIXHUWASF/+LGtBTq6h14plQmbDZ
         urkg==
X-Gm-Message-State: AOJu0YxFSITdNk2Tcl7cpyLbeu1CqWV0pjtgmeHNN2uspJpvob6ChkMU
	eLUTXc7RVtu7KKnS472sguaJLOLiPrLuz8WInW2vYxiaHKn9twbR+W/juQ==
X-Google-Smtp-Source: AGHT+IHKKAeincz/60N2r885Ty/9ceoD1urWK639FTTVnpEZ1sgonmIdbu62ePRRzuQFQdJOiZy4Fw==
X-Received: by 2002:a05:6902:1004:b0:e29:6f57:226a with SMTP id 3f1490d57ef6-e296f572389mr2853799276.47.1729026963281;
        Tue, 15 Oct 2024 14:16:03 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e296d06a574sm365662276.59.2024.10.15.14.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 14:16:02 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [OE-core][PATCH] libxml2: upgrade 2.13.3 -> 2.13.4
Date: Tue, 15 Oct 2024 17:15:26 -0400
Message-ID: <20241015211526.267616-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 21:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205950

Changelog: https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libxml/{libxml2_2.13.3.bb => libxml2_2.13.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.3.bb => libxml2_2.13.4.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.13.3.bb b/meta/recipes-core/libxml/libxml2_2.13.4.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.13.3.bb
rename to meta/recipes-core/libxml/libxml2_2.13.4.bb
index df24f3031c..34a1d3fa46 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.4.bb
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138"
+SRC_URI[archive.sha256sum] = "65d042e1c8010243e617efb02afda20b85c2160acdbfbcb5b26b80cec6515650"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.43.0


