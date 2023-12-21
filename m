Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8E4C46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:36 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.43018.1703124574303589435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rX5AN6S0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28bd623c631so252609a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124573; x=1703729373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7L0wrhOmu4E+V/0h+cPJzKVStfY9MlaY4tIEUV/S8k=;
        b=rX5AN6S0HsGDs4LKG2rtjz1dwlSLpvGJBA4ynmDiaAgFkuwhool3YDiyneKcnULj07
         39Xiug8zARE8ZmzIS3FAz8HqpRCYsEGCL//2XdzgLshT1orTaEFizz2OaJ7h+j/caQAa
         u29JJDISD+3hpwncLNchRF0B2GrJNyB+eiDKiGRs8OhIbD3UhaRCmpv/CiI59I8+3+8P
         rTnHEFFqMJvwdEN82T6m68+uGpJoVFpjZMD/tleASssaNhp7+AXLC36PGwtoZRRFayzR
         ViCUJuW7ZOu5ks/kHlwVSr0wDP3iPhHVXbbGC667GhOFcvoTGHhGRNGirOwIEaHmnUBt
         6iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124573; x=1703729373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7L0wrhOmu4E+V/0h+cPJzKVStfY9MlaY4tIEUV/S8k=;
        b=dA4iO+wSmVywTzimBZ0EOWvfBbTCyk8gQuDj1kIhul9J6VryA0qItlwLzsLsrAj4XE
         AXx4Q5yuJHEW3lOBgw9jsFHS2lF8St7z8bzlNTJkeMQaROt50zBRBHfRtUcIXs/7kNAe
         B2M63O1K55c+vAz4bzkem0OnAC6rYgJG5sxW8gJKJSb0j//R9oCtsFXTxYCJySotQqiJ
         RqAt1sOXiFuylLifnBDQhAt9j8HLdLyx/JvpR/OPP1Xct9TrDfakr1B+mMeoZPY3KxKJ
         S4Oi81hqyGtwZ+cObaWkUiBFR2q1sJUzhrcPfr5+98OxZMZZlst7SuJOs2fbaW/ID3Nk
         ga2A==
X-Gm-Message-State: AOJu0YzOjszD9/LgINbSYnOcwUmkFCOGCGgyzf10E3iUaLYLgO1vklof
	TxQT/2kSjfxf34yJ04VOMo5viAe92tepJ7ordVn7ig==
X-Google-Smtp-Source: AGHT+IH9vCvQtSFZpuhW4eUf1yN8yXKYg6NPc1ZV/5ddFbGw45daKg2LPTnxPYCmDiqSF/EPPaA0RQ==
X-Received: by 2002:a17:90a:6407:b0:28b:d596:39d9 with SMTP id g7-20020a17090a640700b0028bd59639d9mr1521026pjj.82.1703124573062;
        Wed, 20 Dec 2023 18:09:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/11] externalsrc: Ensure SRCREV is processed before accessing SRC_URI
Date: Wed, 20 Dec 2023 16:09:09 -1000
Message-Id: <f6563cca6c4bf627e904d81fbe5b0b0f2b16a107.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192821

From: Yoann Congal <yoann.congal@smile.fr>

When SRCREV is used, call bb.fetch.get_srcrev() before accessing
SRC_URI. Without this new bb.fetch.get_srcrev() call, SRC_URI might be
accessed before SRCREV had a chance to be processed.

In master, this is fixed by https://git.yoctoproject.org/poky/commit/?id=62afa02d01794376efab75623f42e7e08af08526
However, this commit is not suited for backport since it is quite invasive.
The part of the commit that fix the bug is:
    --- a/meta/classes/externalsrc.bbclass
    +++ b/meta/classes/externalsrc.bbclass
    @@ -63,6 +63,7 @@ python () {
             else:
                 d.setVar('B', '${WORKDIR}/${BPN}-${PV}')

    +        bb.fetch.get_hashvalue(d)
             local_srcuri = []
             fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
             for url in fetch.urls:

NB: bb.fetch.get_hashvalue() does not exist in kirkstone but is
equivalent to bb.fetch.get_srcrev().

Fixes [YOCTO #14918]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Suggested-by: Chris Wyse <chris.wyse@wysechoice.net>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 97d7379d9f..a209730240 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -62,6 +62,10 @@ python () {
         else:
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
+        if d.getVar('SRCREV', "INVALID") != "INVALID":
+            # Ensure SRCREV has been processed before accessing SRC_URI
+            bb.fetch.get_srcrev(d)
+
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
-- 
2.34.1


