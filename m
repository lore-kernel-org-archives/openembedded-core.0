Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BB1C32796
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.470.1660894069618602835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qaF1fhPI;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e20so3685662wri.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/fGtIKnOFnrkIo7hr0957S4a8WR4+Krm16jHhOw4TxU=;
        b=qaF1fhPIDHOUd2SzSFqPkRWLH7iu0zG9W9Jd5ucBX+g0W94NeiNyk1uLYfmEeq6vej
         OLaEu3vleocGDueobWwIKf8OibPAHqvptq4CoXNt+F7A+WrtBKrZoDv55b0hSfGt5BI1
         T/p/TLErJW2ScwjCy93Mvhq1CLe8Im6UVaxtE8QXc1C/T0p1RPlNWQOg0DyFf9nr7Mbs
         8BeK8yiVnbrVBuonWXwHOPgBKGU9liSa+Ij2gqYhB35YKM/nyrRICP80G6fm1umFvtCP
         WQt5anU/rEuSgcflYyaS7HNoVx4V7rRqsjvfi1YbvymSiF3h59NneVsKHkNP8U1kabNJ
         3gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/fGtIKnOFnrkIo7hr0957S4a8WR4+Krm16jHhOw4TxU=;
        b=YxUkwMSkFVkrCQOvQeAzYynnr8dyznpzqpnzkO3C2s8isX3FFBG4ZbipA9HUcLatl6
         BwgAFqBiouMrklQQc9OpXnNtHxri6nhA42QG+QOcbXbt/GJdBFRLuFHN8384oG2nTGQZ
         QMyBGdZu1YKHaFH4SJjS0zq/Lzeh3mU5ejKKl+j+PLhFXZ0IREl0wS0jRq6khRnJNoex
         NLrN3fNJIWrhSqk0bqUcp82gTsnEFyyMDVqonYXXUBc46Cc6wgLz4NmhoL91K7EwGQQN
         bepz4so7uwaGVLa1M3WMUC446fmDudWvFFWAwdLdoq0EYdRrGGJbH2YIlCYGcDL0uDJv
         vCSA==
X-Gm-Message-State: ACgBeo1NrR+pVTW7DnxH3hrgH8iDdAzQtt2ufTR4KOyENF0kHAe6Y14b
	K1Sa3DMEpn7JSQ36umqb7kg46mnuL+I=
X-Google-Smtp-Source: 
 AA6agR7yzU62kceFNveGW3i/VKCDxH4yYNgACAI6snC6hUEVeEAX28210rxV8zGq/pG3jD1BRL2xTw==
X-Received: by 2002:a5d:64aa:0:b0:21f:12ae:f8ef with SMTP id
 m10-20020a5d64aa000000b0021f12aef8efmr3489660wrp.452.1660894068058;
        Fri, 19 Aug 2022 00:27:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/42] libcgroup: update 2.0.2 -> 3.0.0
Date: Fri, 19 Aug 2022 09:26:48 +0200
Message-Id: <20220819072727.2236928-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169574

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libcgroup/{libcgroup_2.0.2.bb => libcgroup_3.0.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libcgroup/{libcgroup_2.0.2.bb => libcgroup_3.0.0.bb} (81%)

diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
similarity index 81%
rename from meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
rename to meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
index 7ade372cae..efd887844d 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
@@ -5,15 +5,15 @@ in Linux. Control groups allow you to limit, account and isolate resource usage
 (CPU, memory, disk I/O, etc.) of groups of processes."
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4d794c5d710e5b3547a6cc6a6609a641"
 
 inherit autotools pkgconfig
 
 DEPENDS = "bison-native flex-native"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v3.0/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "8ef63b32e0aff619547dbb8a25e1f6bab152d7c4864795cf915571a5994d0cf8"
+SRC_URI[sha256sum] = "8d284d896fca1c981b55850e92acd3ad9648a69227c028dda7ae3402af878edd"
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/releases/"
 
 DEPENDS:append:libc-musl = " fts "
-- 
2.30.2


