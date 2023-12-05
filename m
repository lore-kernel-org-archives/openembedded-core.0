Return-Path: <jandryuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98328C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:42:41 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.1735.1701801758597555497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MOmJmwxM;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: jandryuk@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77dd4532a60so409310585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701801757; x=1702406557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrpFNyVAvGeBiVQvXLmbBBMmMVsnEKk7jnWiKWnZFdk=;
        b=MOmJmwxM+eBYVoM9S2a5Ky/AT2/mfZtxIKl0cYjw8ZtRWH8Npw95bPqC6XIqlz4W2D
         Sml+0fUBv4yn07RdFHH0wwnfrlVbxBZEmd1gay3K05wbZw9qU2+dE6CtlqncntzQt2Ur
         LXaIvw2inSyIW8RR9i4FdIeSWV7Cn7lQbV+YQzIe8HXkrihj+EMcM4g3O+EznYjzw2y+
         I7Inb4soiJabZG2XyrLDhL6WoFp6C6jVq6vmvMUvUbJI2Sw+BQ7HGatGB1MuxXZKmuA8
         lCuiH2+AKVWrVLeRi7NPemRfExd9usJjrXoFtOezNTjm6tY1FV5QBnqNy6f0+eukCkkc
         5cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701801757; x=1702406557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrpFNyVAvGeBiVQvXLmbBBMmMVsnEKk7jnWiKWnZFdk=;
        b=CSXFQggx8btWCFdT0YKOufdkv7zm+QqRZv9ssaVRCwhppfFENV2lC8XJC+3ycrKMRj
         E4sIVw63B3ncgfxiY3r3xaTUF7/lE+xnonkx3vE3j+CvX1VrzcX80LsXYG4ZEL91G9ev
         3PKFlMZB3WgvcQCoYHAlVDZbXl8KnylN2vzu5cN7iNphtSwEgmTCMYhmgGCuT0PNZCc9
         oo7TGt2PiTtvRNVw2sHRs67Boq4vEecv7Mz7uF2JMADcEYFhISILjoAJboMaKx0LDSws
         6WdznS53tj4NYBwlsazngcdPC05vOPTMvkBna8dOt1YlrOmYubnmopdvEi0JKW2VAnZh
         i8pQ==
X-Gm-Message-State: AOJu0YwBZrtYwxHymLQeshz8ovfkyQXfsP+a0Oi/tq/O8rX0l0Rr7k4i
	HRPu9X39kDWkpnVw0XJw47L+cfO7tG8=
X-Google-Smtp-Source: AGHT+IFRXvHyTIgekgIj683tczpT99L+q0Y7oD2OUdD3g8/LzWxJ2kARD4DcXKIUAFYEeGkRCToX7Q==
X-Received: by 2002:a05:620a:ec8:b0:77d:d481:11a0 with SMTP id x8-20020a05620a0ec800b0077dd48111a0mr1564927qkm.28.1701801757158;
        Tue, 05 Dec 2023 10:42:37 -0800 (PST)
Received: from pm2-ws13.praxislan02.com (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com. [207.172.141.204])
        by smtp.gmail.com with ESMTPSA id uc7-20020a05620a6a0700b0076cbcf8ad3bsm5267386qkn.55.2023.12.05.10.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:42:36 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 1/3] linux-firmware: Package iwlwifi .pnvm files
Date: Tue,  5 Dec 2023 13:42:04 -0500
Message-ID: <20231205184206.30387-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205184206.30387-1-jandryuk@gmail.com>
References: <20231205184206.30387-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 18:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191860

The iwlwifi uses the .pnvm files for newer AX210+ cards, so package them
into the iwlwifi-misc subpackage.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index c0394b9b3b..b849c086b6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1187,7 +1187,10 @@ FILES:${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.u
 FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
 FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
 FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode"
-FILES:${PN}-iwlwifi-misc   = "${nonarch_base_libdir}/firmware/iwlwifi-*.ucode"
+FILES:${PN}-iwlwifi-misc   = " \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm \
+"
 
 RDEPENDS:${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
-- 
2.43.0


