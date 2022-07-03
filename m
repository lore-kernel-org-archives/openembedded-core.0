Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DA2C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:05 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.64606.1656877075736006412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1dKkKdUG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id bh13so1178685pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A0/r9VQBUOYCLm57u4ntfn3lAMGvsksERostDxXxZPM=;
        b=1dKkKdUGh+jWDujIFXWjzfat1YrR9iIwtfwDWdU9uvH2QCZmSP4Hiufs5Z8NKW0mSC
         lA25KrjbAm8FpfnhzGRQTVM4gFedmBSESmpK6L5KnyWDUlSUH2annMY0re3XDkHnijHE
         qTActaguN0UZIBWnDQqnMFUuj3TB0zgxBM8oXL8BFy04TwuTjmNgFTIUdoGL8vFm3nLr
         oQYUnOlhls2mdu3Ie3vi0vfE/DadJRNF8RhKEOgAwBkJoQl0NpfYT/OUUC/tCD8y7Sy4
         PNtKJD2ePwpFnaAY+2tbpGdrfq49CA9ykrqy/oFDovmPa7zWVV9Pg0yBuwTow3nfkv/5
         CkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0/r9VQBUOYCLm57u4ntfn3lAMGvsksERostDxXxZPM=;
        b=kEgQ95JAkNK+tjpYsijvdH8i4zoIqs7PYsAW1guXPePHr705lRiD3qzeFn57QbDKaw
         m4RLk3MHvM43yoBfNppudbrYDOReRWj9RgzqgirX0C3BiiZUpGywZTWSsYdnB6RuTZB1
         Gqh/cbHLDGvZJOh1lMPnKsirxvn/iwX/3xG9rYMBK1aHIJsPcLEMTqcxbahzA6HOy6w7
         jWNjxsbGznM1FGoGFwopdMhLAAhaE7fAmtrbaW+NM2zZru/rRAHlwiuGvjx5RFcrEg6x
         NltSVwExCozQRS799VgeRf5iL8cYEWB1VLcWqSRCrwIAoPDv3iU+K8nL0iGhJG2m5G3r
         I3jg==
X-Gm-Message-State: AJIora9hILQg32NpbReVI+8b/b3PBrkDsFZIGETvqnkXfvi1FAQVNP5H
	jLxpixkKH+fortT0VBhWYVndRZ9UquTHR4D7
X-Google-Smtp-Source: 
 AGRyM1uyrAD9nvsn2QQW5X14zWo0WJEF7LcRaX68XqNijHDKRXrSA9gTEPuvE7wqYzyrscH2HyN/cQ==
X-Received: by 2002:a05:6a00:2185:b0:520:7276:6570 with SMTP id
 h5-20020a056a00218500b0052072766570mr32717997pfi.84.1656877074710;
        Sun, 03 Jul 2022 12:37:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/30] base.bbclass: Correct the test for
 obsolete license exceptions
Date: Sun,  3 Jul 2022 09:35:54 -1000
Message-Id: 
 <fb9e4559ed1357b65a016a3ddc73144dd7a9326d.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167579

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The test for obsolete licenses used in INCOMPATIBLE_LICENSE_EXCEPTIONS
tried to match the "<package>:<license>" tuples with the obsolete
licenses and thus never matched anything.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ad994d95815eefed2a72b675c7a323b3ed38191)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bdb3ac33c6..0cf27fbb91 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -596,9 +596,9 @@ python () {
 
             for lic_exception in exceptions:
                 if ":" in lic_exception:
-                    lic_exception.split(":")[0]
+                    lic_exception = lic_exception.split(":")[1]
                 if lic_exception in oe.license.obsolete_license_list():
-                    bb.fatal("Invalid license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
+                    bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
 
             pkgs = d.getVar('PACKAGES').split()
             skipped_pkgs = {}
-- 
2.25.1


