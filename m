Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8BDC2FC0A
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:09:40 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.2705.1695247779319683868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kT1nWzQp;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5789de5c677so179458a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695247778; x=1695852578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcszVW9LG1KgsANl8NPTdRt5X4Dg0o00b5QlHZp6Uto=;
        b=kT1nWzQp00E2NSoVWhm3WYz5yvt7IMLeWhE/1VEmrJBTRIyWUCzr2uJojFgVIRD90U
         nNq1TgUVlH3WAPVZahaS9eTpup5jHpdI/xlZle8vY6VO1cDWvmBySMN54verl1rI/DVj
         o8r4hINfFRubqz6LYXA1q3Z7n50KRL0742wtU0tnWWIvhJDPHeJpPm0o7tFk0pQWgYkF
         wj7To2k2M5PG6PAD/LyCGSUlDWXFu9VUHqBK/tnbIotYdcjazHzvHl6wPKVel3Hhg3M9
         mZVAbcpETOxNHwRGS0VZOQ7kJ3zENh2aYchXP4w/sSa5wqLp8e9qeUe5jdAL86sl7WrS
         Oswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695247778; x=1695852578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcszVW9LG1KgsANl8NPTdRt5X4Dg0o00b5QlHZp6Uto=;
        b=CcBIaQR2nlSUjDjEaminV6e5eep2ifpnmnlJ/8Oy/c5Ma1LOe9kerttjb/xSjenSVV
         HHK7cNGMe8VdtgkEND9n1rfU3r3EbEOquE0FLRQhjTYsjCmqTJADroaL0tQNFSj4v11W
         usL2Z4T9FkKoHKbLERLdNGmvgtmuUUHhm0iiijocnlm5GUoWirHAnvJblZkErZhOfauI
         LoIT+lpZyzCBU4hNdm82kbEdeGC+4Fi585WFZOWupDnJnRZgDQ7Wleq+pDd0YGa+sZcR
         DfykEO7nmyOtoI5HHJxRSPqZNCI07dhm+iQsK4Z0ZzQa4HGecuQcRTwQVAuCiRKnzyMk
         a2yw==
X-Gm-Message-State: AOJu0YwdBzgIU4UGsMs5DyUmQ46GTAFHTiN/sKr4ZacPectCMoEuV30u
	9q6fPvdh37bpQEx3i1F4BoQCB+wpM1c=
X-Google-Smtp-Source: AGHT+IFmMxn2Be/lSGpanUEZTJEWco8m3CFnmTkvGkMvaQNLQ3U7kbGp8GZMSZSLv/4dKSfJh6IkAw==
X-Received: by 2002:a05:6a20:4408:b0:14e:429e:b0e3 with SMTP id ce8-20020a056a20440800b0014e429eb0e3mr4483305pzb.52.1695247778083;
        Wed, 20 Sep 2023 15:09:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id r22-20020a62e416000000b0068fe68de4e1sm24324pfh.145.2023.09.20.15.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:09:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] bsd-headers: Define __CONCAT and __STRING
Date: Wed, 20 Sep 2023 15:09:33 -0700
Message-ID: <20230920220935.970957-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187944

Sync with other musl distros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 meta/recipes-core/musl/bsd-headers/sys-cdefs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/musl/bsd-headers/sys-cdefs.h b/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
index 209a623c0f0..841a5da8ba4 100644
--- a/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
+++ b/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
@@ -1,3 +1,6 @@
+#ifndef _SYS_CDEFS_H_
+#define _SYS_CDEFS_H_
+
 #warning usage of non-standard #include <sys/cdefs.h> is deprecated
 
 #undef __P
@@ -24,3 +27,8 @@
 # define __THROW
 # define __NTH(fct)     fct
 #endif
+
+#define __CONCAT(x,y)   x ## y
+#define __STRING(x)     #x
+
+#endif /* _SYS_CDEFS_H_ */
-- 
2.42.0


