Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD55C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:16 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.40954.1684291500572848002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=m7/2O/MX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64ab2a37812so9922401b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291507; x=1686883507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rhjtlNH9mwgqABc/rI61JtERMdL3sxBIX00DnpQojE=;
        b=m7/2O/MX3aErZBHdiAEUTYWqwfx7miMpeGYkVY4YOCpLFG3t8G4x4o4xGTNe3z/rzr
         Z9neVAb1SdbOuCjVojDPuIsYDR8m1YsjBGX50z9ikhQ5AvJjCFK/ozBwoBhAhMlQciM5
         1nHkVfeihRCSyZgL+E5l1zRm/Y6PI2iEBe5EZYMI1bx1XIrArz+C1EJt4zyHwCnWC5R5
         yMJi1Xe3xRpbvFfgYO0UBWTwaxfKzi6Pg/ui0tpt/7tLnSn+vHMaAsW+z+Ya7FksO6ir
         6x0dYsmMac2Q0YDvdSv0EyGJ2kFMrprox9IRdZY902NXKSMHvC2WPAD88wvcestceynb
         IX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291507; x=1686883507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rhjtlNH9mwgqABc/rI61JtERMdL3sxBIX00DnpQojE=;
        b=OeF9rGAEZesu48jifzAgv1diPDoX+tpvjKfbJlxHDlucpmsKZnorTb1zVUnY8z0Mtw
         7H6XE6QbwIuSkfGXTUk4MR1AF7nwvJGip87RtC5MsgtyYvaD1gseK9gQpa2Ky8zdy4Br
         CfweFsQswpSQ5Cizb4CdZTVhay0la5K0CElUKOmhnVpwLr+Ew+t2DAP/m6jkUF/1V455
         ID4YpL2TDbfwkTsov03GN9bmyYpTvjTGW2wiGa1lfJegGhmcasuRPfLkBdQm8QYNVF+A
         IjrRsY8wfa9YgL5E3kwJ85AHyDYRGDCTkpzl+QsLPKP1ZfQJsIsK5pc3eKqm/g9KwOzy
         7hbg==
X-Gm-Message-State: AC+VfDx7PEmve2TosHNQje/PIfjkFmflszuqDfpzRngPML1hK2509Rmu
	GSDpRlp75kCOwR5hN66mBZw9SgV2fNmiGaSV684=
X-Google-Smtp-Source: ACHHUZ73v/3zQM9EzwrT2IPUEg0k16qAm6n7OHLjNaHJpmPaxLPzSdmdSJ+bHO7f2dp5nZvsHQb+Qg==
X-Received: by 2002:a17:902:b210:b0:1ac:5d9b:d971 with SMTP id t16-20020a170902b21000b001ac5d9bd971mr662599plr.34.1684291506640;
        Tue, 16 May 2023 19:45:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.45.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:45:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/13] license.bbclass: Include LICENSE in the output when it fails to parse
Date: Tue, 16 May 2023 16:44:35 -1000
Message-Id: <faa2baeb4256f0df3c34badf5cb30febeede5ab8.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181441

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a5197760da3890cc80ac7da8d589766612d9051)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 560acb8b6f..23625f0104 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -229,7 +229,7 @@ def find_license_files(d):
         bb.fatal('%s: %s' % (d.getVar('PF'), exc))
     except SyntaxError:
         oe.qa.handle_error("license-syntax",
-            "%s: Failed to parse it's LICENSE field." % (d.getVar('PF')), d)
+            "%s: Failed to parse LICENSE: %s" % (d.getVar('PF'), d.getVar('LICENSE')), d)
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
     for path, data in sorted(lic_chksums.items()):
-- 
2.34.1


