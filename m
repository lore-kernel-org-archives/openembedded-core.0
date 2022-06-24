Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CE3C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 13:58:27 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.7958.1656079101010097203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 06:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CSndf7Xi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id w17so3248111wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KojjJdu1F8BEenHcYLH3ECeJI907hEKlOWqMzLK7B/s=;
        b=CSndf7Xi60IJuSF3ajmIZCeoSqmIdFYhjXJkjPZFCqIboW8DtK19RydDhN/6WZinmG
         2fO9ZroIn6p53HkaoaX7XMskxfW2k3oUZm+Xke/gKjelDb8ztaPx2UlkgIVM7FaL07cT
         B6dsvaWvEOe5l8ZPVGsB3beiFz05ECIGIWncE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KojjJdu1F8BEenHcYLH3ECeJI907hEKlOWqMzLK7B/s=;
        b=NTYbfGPcZwCUfP4mIvAy2RaB8Q6YGBoO39dg4j7LX74md7LKkw3IuoW2PkiQSoPC+a
         FVNpBQ/LnvLfblCizTQCOqijdk0UNmDxWBrxpzruCY8l13dpl9roCuCN4BWV5WlURaGv
         ODeI7uKQ+nJR8xvun7l3oh9cJZS4Rl6f0+nA8mpnJoD2IwwN7N84F2bsDKx8yYJFRMgD
         i4IlTWnjJB3I6mh7wQtgJj6RHTFIpbjJweC9N7blDgBvdERL1Zr8gryUAP/CwtipNdly
         IdNqVMtyQUrmtxVTpUoFS/eZsIBpBFQ24/y3mH0PwY9V/XdpmPTl3Z+S0OKZPkkFK+Nu
         B3xw==
X-Gm-Message-State: AJIora9wwsRML2REX1NbUg1NDYpFv0extbEPfH8LF9BKiM/nFhy6809R
	QsjKvUBJWlshNCj9DYUtpeo0YDdERpbyAA==
X-Google-Smtp-Source: 
 AGRyM1tlfrNSeV6tfOcKfu8qEZOdAkECIlyHFyhm4E1rYQGnXD27Yc6Iyse6aFVa51YGbCmxJPY0eg==
X-Received: by 2002:a05:6000:10d0:b0:21b:8ffb:80ad with SMTP id
 b16-20020a05600010d000b0021b8ffb80admr13176024wrx.444.1656079098888;
        Fri, 24 Jun 2022 06:58:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9f36:46c7:838f:1b87])
        by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b00219e77e489fsm2356384wrt.17.2022.06.24.06.58.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 06:58:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] packagegroup-core-ssh-dropbear: Add openssh-sftp-server
 recommendation
Date: Fri, 24 Jun 2022 14:58:17 +0100
Message-Id: <20220624135817.259030-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 13:58:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167291

Seems sad to have to do this but openssh is moving to use sftp instead
of scp to move files. This means scp from Fedora 36 will no longer be
able to move files to/from a dropbear based image. This breaks a number
of our key QA tests and I suspect will cause users pain too.

The sftp server from openssh is small (200kb uncompressed) and standalone
so adding it to the packagegroup seems to be the best way to preserve user
sanity. If people really don't want it, they can just use dropbear instead
of the packageground.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb | 1 +
 1 file changed, 1 insertion(+)

v2: Make a reccomentation, tweak commit message


diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 4f844ad9255..d06c6a56095 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -4,3 +4,4 @@ PR = "r1"
 inherit packagegroup
 
 RDEPENDS:${PN} = "dropbear"
+RRECOMMENDS:${PN} = "openssh-sftp-server"
-- 
2.34.1


