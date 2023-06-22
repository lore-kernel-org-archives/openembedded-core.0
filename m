Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E24BEB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:08 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.14627.1687447922866304402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X3ZCIK4I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6686ef86110so3250575b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447922; x=1690039922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKNtR8DL6Jd5N3l4BnIB0gxZ1rqX4LPcVZTtqzytVG4=;
        b=X3ZCIK4Iecr1Pnho9VnguOnv+N6ZycwnMPmAk7TJ9DKAkpzRRowLwxGOOmI2fWDqyS
         A9Ti5jqDyVht7k2wtpbCYHiH3FRiyl042GCiq5Q4pXifmI8rejv9ZNzZxNlIWENDL/Md
         CuzzBN04jbNAWlNPaG6a4U+js+xus7vBdOOm9YjobmjYih+gco7tM3FdszBvaktR5qfs
         9wHevq8ihlylWTSjGbINdWDEih7nvkkZ3EHzvmHhzJHwahZVTS+51zc/Nn82AJWmE+C0
         I+wjkgb6ciO7eGoRDOaPYuImEfHs7F8F9twMegWB8W+DLw99bJS6AD9YRNSF9f8BWKqi
         Sr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447922; x=1690039922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKNtR8DL6Jd5N3l4BnIB0gxZ1rqX4LPcVZTtqzytVG4=;
        b=EGk2xU2YWPJxKYWzkpT/DZhIscQ9Ccw50HcDgTU0s9yuRdSQxpkT/5C4PN38f1mg8Y
         Bmo408CZto4TfNYkoSyEJihCX6v7JMRQxhTtmNKm1ScyHxkm6TSHLmWyb4hOdzc6Z6z+
         U14oHVWZwYCFwNU7m51XoUeIxSlcHnWothGvokkYTlSyacnfQLEC2yd7EgKbJzpbNFsJ
         4TV+AFcDbjlCxFm9NR0AIoIEcXtAWlHZ3BFbJ5V/C2r8iCjNvAp2pv2d96KBoNrv5rqa
         4T4Cq209L2ekkFUbR86Yv6QaT+LP0ZbnrbBxTq5bDKwE+hlZWREqxSPaV3ldJAjlXNDk
         moJA==
X-Gm-Message-State: AC+VfDwzEbgtlhjnwHTaNdJRdCdXIwsICrUdLfmJLTgrxfI92Sh1PBCd
	/K34wlSWfNqil94dKA2FG5gJ3TS1NhNf9eJpPpw=
X-Google-Smtp-Source: ACHHUZ7gcS8uVJtfb8Eu4aIDDzvYEUkAnMJyjPIsqUEmcC+aLkg2u0uLwrGyRES/Se2PZXaSOiSvJA==
X-Received: by 2002:aa7:8882:0:b0:668:8c3c:3144 with SMTP id z2-20020aa78882000000b006688c3c3144mr10525403pfe.14.1687447921958;
        Thu, 22 Jun 2023 08:32:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] uninative: Ensure uninative is enabled in all cases for BuildStarted event
Date: Thu, 22 Jun 2023 05:31:34 -1000
Message-Id: <24897c70980f934cf59a28a0d3b6e8fddcb15a7f.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183252

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Recent changes in bitbake mean the datastore is not always reset between
ConfigParsed and BuildStarted. This means in a fresh buiild, with memory
resident bitbake active, uninative may end up disabled.

Update the code so the enable code is always run at BuildStarted if
needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db743cc78fe5172bb4a4dac9c1dad4f5aa9e1491)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uninative.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 4412d7c567..2940935dd7 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -34,6 +34,8 @@ python uninative_event_fetchloader() {
         with open(loaderchksum, "r") as f:
             readchksum = f.read().strip()
         if readchksum == chksum:
+            if "uninative" not in d.getVar("SSTATEPOSTUNPACKFUNCS"):
+                enable_uninative(d)
             return
 
     import subprocess
-- 
2.34.1


