Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750E0C00528
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:30 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.11758.1689696089596263164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XfgGxQID;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666edfc50deso3654148b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696088; x=1692288088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/HBcIpyB6FMUQk9Hi06+wpebDlRXIAt6puUGVKOxj0=;
        b=XfgGxQIDtjeww+IYFpSfQv0n7rDGvZCcdXAwLHF1ktMR87mG8i5cnL6qwGm+tN8/l0
         FZdQpl7NrIF8nFyxzcElVw+j3HzkUYF2RSo3r1C/G3Y3bJbL1deJmrjOn+zuapLNEHz2
         ma7JNeeNfwWn944iF5v3SEIbEFpG6bkD9CStHADSOJrcU1eig//vReWYOD/6TzTZH52E
         5XmQGizyErFd4Xl8uDCmW8Mxf+jB4CxAoya3m7lrOiBlzahLQdZHkGjKXzsb/Hw9/UKj
         lKK7td6ckpekXZFo3Q2mwoqB7qXGWzMYDxyjgn7glw4YY1wj+exLdtIjiSmb5ShXbRAQ
         +GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696088; x=1692288088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/HBcIpyB6FMUQk9Hi06+wpebDlRXIAt6puUGVKOxj0=;
        b=FCLOhyn9udHUiJ4E6oYV7jU0d55s0NhTdXqrmoBj+GBXUpSxyR2k1Rcyfd23/BWOTZ
         cknM3k1Z9HamdqZQN1m8RXwA3FtcAZs7HAnTW3gwTqHu4MiGBrwbG92BDUKG1qdlaNem
         E/zLG8OG+K1cdxL20lwj1VSaxYGPryF8VsICkDrIJER7BrU5plqridKwfsG9ry0a4S9E
         8Tw8oh1e5Sl6whL+ZbMqo7FB25KU8864KDkLOlPxxJdSARSmaMMDQrGaCZUOQ1geF4ty
         8veDrBYIkMMVmKFzKRnPNVlH2lc0AESTxEzuv7AgnGSF7NJtO0Ln+zIUwta7w7q8WPty
         LHzw==
X-Gm-Message-State: ABy/qLYY5LhqeEXZPdacBL+NnERnU5CUMJqiZ35WlGzaYTe9RB9P5mq3
	Y+VCuGVENc0Wf/GoFoBw5i5ES5FTP7DS5IsWcWA=
X-Google-Smtp-Source: APBJJlEIxvdTh9UyYXqVescdNJvtt863vLe5KYGJydu1Y81Y25T0wyzhCxCbPbkMIfu3gHcF9UD2Mg==
X-Received: by 2002:a05:6a00:368e:b0:64d:42b9:6895 with SMTP id dw14-20020a056a00368e00b0064d42b96895mr15752735pfb.5.1689696088635;
        Tue, 18 Jul 2023 09:01:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/13] tzdata: upgrade to 2023c
Date: Tue, 18 Jul 2023 06:00:57 -1000
Message-Id: <62c42d4a1029de4fe9b19631cbd34722f6535edf.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184543

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1834665a1e..2960bfefe3 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022g"
+PV = "2023c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
-SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
+SRC_URI[tzcode.sha256sum] = "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
+SRC_URI[tzdata.sha256sum] = "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
-- 
2.34.1


