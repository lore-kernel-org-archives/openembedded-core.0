Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7F9C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.20374.1637901379174272680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L6fYgrba;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id m24so5864031pls.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NI+x7HNcjduaSqgHHEtMjDC/yb6uT3eKEFKPDLhNUuY=;
        b=L6fYgrbaeTnbj0tO9+O/tiwvouz0QqypwsaGo48Wq7g3Lq847rFglvTQFEbvWzTaDi
         hXTOr+aN9Bln+NWZ0kaGcXTKoS2484dWa0CdcIN3kGHFI+Ds1PvlLGK7SGssr/T2YGCk
         tEh5i26nlYnxGmmHvrKrd+hstpbSwvUcwwNX4q9v6pELBkqTb4pI1EBSqBOHdgjQ+Wao
         1JcJUOoFmmGUuHogL+GMmaylESQ+TcyD7TcqydokZo1dDX0bjTtHf2lMP315qRILOsjB
         e9Q3cLGJFMrelN6hioV7ZGNqvP4J/iBjE+JAoGfqqKWN1gkd669HndgYeBQk5DKUJ+YT
         5O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NI+x7HNcjduaSqgHHEtMjDC/yb6uT3eKEFKPDLhNUuY=;
        b=cYz8/mlT0a2fCbD6g3zXKeYSNCq0ix5NspD4e7TV62qoJ9/+wHpBKyEB0cBRNZ/WYI
         PJDsBfr+0frf1RAOEd2H1BdYpuhKyr9i5bBc0eNpg3rWRX/KTSsSCJMVvF3oKvDpY6+2
         fEupXzjak0WubitSwpZoW9jOuSBV99G0Gso8q/u/gJ9pHXV5uB6SHm6OkQLn6C915k+R
         S+0mHRlmFFc9Xx+AIx0z/cB9vQQwh5JaaU+XU3fROc2V6KKbRSRsWqGT8QaDCru28NB5
         Z+RKnEY2e+PBh9xURFdEzQOmE+JnM1uCnHOFOrHFHIDSosSWw6/1MIkU4l1Eo70sdAmI
         Tv2Q==
X-Gm-Message-State: AOAM533BIAo349KCuRp73XMVOO4Ff10DYIzsZ0T2Ofzl63N55Nzokx1s
	kQdZ+jDASf3snbjej8VfXLPViHGdSGc=
X-Google-Smtp-Source: 
 ABdhPJynGbawsz5YUGbw+EcvVWwbySMDACyOBKOGc0d+AzVzTtJfVcCb0qUIqCU93OVWQJeYTucmfw==
X-Received: by 2002:a17:90a:6b44:: with SMTP id
 x4mr13076294pjl.27.1637901378364;
        Thu, 25 Nov 2021 20:36:18 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 06/26] python3-dbus: inherit setuptools3-base not distuils
Date: Thu, 25 Nov 2021 20:35:45 -0800
Message-Id: 
 <63db93f8f02ca26cb4a0ad479bdc340f41b89bde.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158802

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3-dbus_1.2.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.18.bb b/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
index 9592fbf7169..c4687de13c2 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120a
 
 S = "${WORKDIR}/dbus-python-${PV}"
 
-inherit distutils3-base autotools pkgconfig
+inherit setuptools3-base autotools pkgconfig
 
 # documentation needs python3-sphinx, which is not in oe-core or meta-python for now
 # change to use PACKAGECONFIG when python3-sphinx is added to oe-core
-- 
2.30.2


