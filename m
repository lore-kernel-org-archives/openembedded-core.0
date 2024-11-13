Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EF4D597D7
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.3421.1731467792369429339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G1TCH+kl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c8b557f91so68773215ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467792; x=1732072592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdsS1XQdH3Hu+t+jLpEiTQJvshyUqKQjePYd4oFLEuk=;
        b=G1TCH+klP1IpNeGP2rkLwmAv8rJiKfnW3vJC7hAZfoSXSDmfE33gmPRT1Uq/niYnwK
         NsmYiekYZoK0SjhwzCJTHE+IiXOk8w2SX9rfJyKDd+/8ffhLse87fVl5C00E6VG+yf6N
         Tea5RFadevYGIxqAI5DPc6woNuyed8kqCKkly3BqXbz1yLwlrfV8C5rAK4eCFYUpqB1y
         BTbTuHQ6v+gshLl0rshgOosB4Aa/Lozggwr99Fp0iHWYWZPFODe5o0qiZhts9P+zfN7i
         YkR18LKRkdBc3CKueSUthCr4yXj3Y2gl9dnx6IFrmX4hHaB6pzMLqNgBNxa+8RvLsnRD
         910A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467792; x=1732072592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdsS1XQdH3Hu+t+jLpEiTQJvshyUqKQjePYd4oFLEuk=;
        b=NmoIeVxUGmW/5kRs/+Jgtq69Kn437b9Da+jDbKGu1yyclLuSNDB/Bxot3Q0xvke+Yg
         +XA31ixtFCDHgD1wFKmtJoqDhy+Q087Qst5sNkjiPRDqIWY0dp3Nxj2Mr1yflSHi8DNg
         sLJSCqaZi8fokWoexNLC5R99lb3MIgg+fi3aK4EZqelbBWopfUFTI9gw++ogIzAMgWoe
         JJRSzDwmgE7CKR/8Np8mfPKn94VmtZOavVPmiQogO+awYqYQLZihsaO5S0K2OOIPhroB
         kGWFT7RCI1NKYdGdI8mxDc58MQQsrAPiO83HHYa7pw12dUpvbtsGu2BO/ZrDa3/luxy/
         srog==
X-Gm-Message-State: AOJu0YwzEjBIwiFaf9SyqtQ4sMmiE67RjhF3rBLuTAOGDJI205x9IQjr
	AMm5UHZsN+d1VOOZXIohgyo86IBatG2Q6X6kc2IJBxPfY/y1VjKPx7f8QP4HKN9nLOX2yHO3JfZ
	7
X-Google-Smtp-Source: AGHT+IFBN3m+4cO4dETPgtNzVo0mRP04BmpMuVlSeciEvjDtU5ch6CV1TYWX5vEPSB3BuinAC5mCaw==
X-Received: by 2002:a17:902:d508:b0:206:aac4:b844 with SMTP id d9443c01a7336-21183c43373mr277005725ad.6.1731467791623;
        Tue, 12 Nov 2024 19:16:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/19] pseudo: Update to pull in linux-libc-headers race fix
Date: Tue, 12 Nov 2024 19:16:01 -0800
Message-Id: <77d018ce3b3a9390a5cc020bce9f9ea9017820dd.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207081

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to pull in:

    pseudo.c: Avoid patch mismatch errors for NAMELESS file entries

    In rare cases we see failures, often in linux-libc-headers for things like:

    |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
    | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.

    Pseudo log:
    path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/linux-libc-headers/6.1-r0/image/usr'.
    Setup complete, sending SIGUSR1 to pid 3630890.

    Whilst this doesn't easily reproduce, the issue is that multiple different processes are
    likely working on the directory and the creation in pseudo might not match accesses
    made by other processes.

    Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile things
    so rather than error out, we should ignore this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f30a1a74828e105cbe69677b3fbe5623f371543)
Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4dd9156238..6b0cb598e2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
+SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


