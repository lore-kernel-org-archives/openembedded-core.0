Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73871C636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.20817.1676236257901958271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=8QFyM43k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d8so10409346plr.10
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbWErJl5H9I7MHyubojrULiWuIOf187SSG7ccEMMjfA=;
        b=8QFyM43kZafdi70gUE0xCSI//EAMPEdZx0BHqIisT1l+ge2GC5hVKfEsaoUCav30rI
         9DqGWDR78jf2gvKXmHUmC6ejZznz/vnHqxFJ99z9gVWl+zm8dZkrhyBzChod7wIOpkWL
         8HYNWhH/x0QGqYCP2P/wduFSEOGV3VePbBG0fw+vFrJl+y6d/9n92ZSWfT3NYV+V2gbw
         p+wLVGgLsuB/VUsrAdMbqc0okE0ONUW/6zzBv8hHbotljTEbbL39Yp7qPz9uHB/X/UpT
         Nma1XN6cVawxBL2L02hyYXBSN60mDxPrQdIu8oorkVTTQ4pevyCYh2Q8Mr9Mfeakw7Hu
         o0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbWErJl5H9I7MHyubojrULiWuIOf187SSG7ccEMMjfA=;
        b=W6rCZB9xrsi7pShoPREEg5b5rgx5A7XLrwb6tvUnu22gqT2mocpONgNYHjOML3HWga
         Z9lIIh/U3TVaj7TcA4bHsNTA+U605JKMpAMq7w08mlFHIFwXOtqfHutnglpPc4pdWfGN
         gARMJ/OiQaHZytnq+TMic0PsADqBoqmkqesiWMa2PNz58N2OlVsB8gxKmCrOQXizA4f0
         WsMWa8QqKvOtP7ZjRsX//eMhoydbsW9InxiEP3+nBr/I4ATfEOQojnVFiGbAFkxrraYk
         HGqam4x+QoZUnGe64mYb7VTSXUtYSmkjp1sAyCcY+z8/DX1VTo2cJ1Bco7y49MdAWoZ6
         Nydw==
X-Gm-Message-State: AO0yUKUGTOsr5jXdmFEQFmtW6yLLdAIUHyIvD2OP8Wc5XVsimOog1WVz
	YxZsU506JUNDoiXtoof+jIETS67Rc1K2vJe+UYU=
X-Google-Smtp-Source: AK7set+tFe6rT4W99SjtdAuOESZYNEzKmr/olB+QALABa99j0lHsm5GnMXH9dHncgQMIDWYwMhrwtA==
X-Received: by 2002:a17:902:d10a:b0:19a:82d4:b2a6 with SMTP id w10-20020a170902d10a00b0019a82d4b2a6mr4659978plw.18.1676236269962;
        Sun, 12 Feb 2023 13:11:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/27] classes/fs-uuid: Fix command output decoding issue
Date: Sun, 12 Feb 2023 11:10:26 -1000
Message-Id: <ffa1de16fa82fbe7dfbed4c5ae0fc4e6d51e7ff3.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177054

From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

The default return value from subprocess.check_output is an encoded byte.
The applied fix will decode the value to a string.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 046769fa952a511865c416b80d10af6287147fb7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/fs-uuid.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index 9b53dfba7a..731ea575bd 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -4,7 +4,7 @@
 def get_rootfs_uuid(d):
     import subprocess
     rootfs = d.getVar('ROOTFS')
-    output = subprocess.check_output(['tune2fs', '-l', rootfs])
+    output = subprocess.check_output(['tune2fs', '-l', rootfs], text=True)
     for line in output.split('\n'):
         if line.startswith('Filesystem UUID:'):
             uuid = line.split()[-1]
-- 
2.34.1


