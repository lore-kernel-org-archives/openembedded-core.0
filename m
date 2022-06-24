Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1B9C43334
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 13:45:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.7801.1656078314039360209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 06:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JiCNWecq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id w17so3202025wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9w5LjwGhCVh2r3hw99crPfG6V4Jk7Ubmrx7iyxClVk=;
        b=JiCNWecqbuDtWlhoTF0RQE2rpE3jwMtX5juaNlG34HLn2LmDaUFj6D8gt+YsK9kt18
         13njOZcea3q6FV8um+D82uRAs1on/H6QDXITkp8wM1sb9/HAnk7oGNQ24VlfoIR3tGrY
         2/Vi1mtJMyrEtSi9Oik5cx6d6WKahhpOFufok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9w5LjwGhCVh2r3hw99crPfG6V4Jk7Ubmrx7iyxClVk=;
        b=FswRtt7Eg1Xo02VtcpBPrHBAavlvayn+zSuvSt93Vysmn8EzMfr6AzrKjV7+ekpqFY
         9P3t1pkEi9hP4I/xM4msbu8gNl36EvkGCnugeDs9XLcZS5haMGlPCvS2fnIEhkCZ0KmY
         zOnWg4wVsvuIVmEZmP3CrUBk/3cHU/JYNxIyWAZd8ER0qvhlRkeGbDYEpr05UFlI3ta3
         lJ2gdr7fNRglmFBGOHOZTuPDltWBiyab2VG8HWj89NEO78aRgtBOtZ9XJbxW1lteNsc9
         T8UuDLzZH8M0w+8cnliHYcHimP9nibON/hSiVFkMCPCWX74P6C38uf6+6B5bSw6yOBPQ
         FAaQ==
X-Gm-Message-State: AJIora/WfmPS0HNzS5QPwxqjAaW97GwhWpmmhBDq5ra4FCrnK8aKBbz8
	AW0eBImUYu7iEqXJay18DfXEWOgnGG9WpA==
X-Google-Smtp-Source: 
 AGRyM1tzn6EXVHS9fTcayvpaTX/7utgBcfmKIPLByHkV78AK4Xwwo85xMC61/NZTd/7qwWa2+uPjDQ==
X-Received: by 2002:adf:fd92:0:b0:21a:3d15:91f9 with SMTP id
 d18-20020adffd92000000b0021a3d1591f9mr13177347wrr.262.1656078311957;
        Fri, 24 Jun 2022 06:45:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9f36:46c7:838f:1b87])
        by smtp.gmail.com with ESMTPSA id
 q13-20020adfdfcd000000b0021b8cd8a068sm2308043wrn.49.2022.06.24.06.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 06:45:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] packagegroup-core-ssh-dropbear: Add openssh-sftp-server
Date: Fri, 24 Jun 2022 14:45:09 +0100
Message-Id: <20220624134509.257546-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 13:45:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167290

Seems sad to have to do this but openssh is moving to use sftp instead
of scp to move files. This means scp from Fedora 36 will no longer be
able to move files to/from a dropbear based image. This breaks a number
of our key QA tests and I suspect will cause users pain too.

The sftp server from openssh is small and standalone so adding it to
the packagegroup seems to be the best way to preserve user sanity. If
people really don't want it, they can just use dropbear instead of the
packageground.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-ssh-dropbear.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 4f844ad9255..b969ab7ca01 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -3,4 +3,4 @@ PR = "r1"
 
 inherit packagegroup
 
-RDEPENDS:${PN} = "dropbear"
+RDEPENDS:${PN} = "dropbear openssh-sftp-server"
-- 
2.34.1


