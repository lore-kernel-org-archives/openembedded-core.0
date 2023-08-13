Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06859C41513
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.93783.1691961558748763467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Wdgya5cS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-26b51d4c985so234544a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961558; x=1692566358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VkXUUoURN1SXWEqDxtGVFoIjO8ZMUeIQ1piKhpeMfE=;
        b=Wdgya5cSJLCVk1HXB9BrMDtL2s/FOcPjvkQvaHZbcgguG0S7pe1xa/7bJWgpvjDsHV
         yr82FcpZzYnmpMMGb1KrXilulQxq48s3xKecSeeg0QC7Bu/UxS+P++8Oowswtx5xgkJR
         HIRHETa79UsDwMSGZJb6gfKE/WW568Ad4Oaf2C8B9ZG4HP+MLA2+45oFxW/UwBUs8MeT
         BgPozaVJdLcwnHKDXxL3Xenxhd/1PjUQ7xE14Xp0FVJ24urRlRl/VTrHhX+9PIkAUvPX
         +b+lDKVKwIaeR2c1YG/bD3/YSLaBrvTSjF55vKVQ3MC/GuRyaaBVuLxEnpUfggDcU9iq
         mThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961558; x=1692566358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VkXUUoURN1SXWEqDxtGVFoIjO8ZMUeIQ1piKhpeMfE=;
        b=Nugk/kFXU+sXipRyXl32NLPvqODh2mCO1EPx651qwLDv50KO590abR4MkhMTmIf7+P
         xR1OK/Qy81B6dRRJDCmo0G1djsN7OWMcJT77jWynydACU2ac3rw2eSf1NL/19NWu0Yh3
         jS4qS1tJ7+WQrNFkkiIysDVL+Y93gFXhInHoxnfdWY1zK32u4AtHHn3+LeEsCftgF+2K
         rXWUd/3vDqRPhzjl/Wy5YlqK8MeDXJoSsxqJp6o0DVVsGGQzTq5GmDIH9vTc1kbN74/0
         UZZ+n4Px9ZW+kZFgaEtwXH3zkzmD+7FrLqonQZOLNPVEuJ+l5Wux5aPtPlMPtOivaPTE
         Moow==
X-Gm-Message-State: AOJu0YwSUnRvjVY0UYvCNIKv1iLDT6fnWdborl+Lgv+LoQ07VwaA4pVu
	TBqWRwv4Lns5nfhjvhkpDiNJMy2hk7KgAHW4SRiSTg==
X-Google-Smtp-Source: AGHT+IH26PX/xwCc4bWNsNAdPfa1aC7GGt741+7Kr/EpyczBceMcHyfK4rtPHZ6Lbi6x240NX7Thqg==
X-Received: by 2002:a17:90a:bd91:b0:268:a691:412f with SMTP id z17-20020a17090abd9100b00268a691412fmr5255186pjr.39.1691961557722;
        Sun, 13 Aug 2023 14:19:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/22] harfbuzz: Resolve backported commit bug.
Date: Sun, 13 Aug 2023 11:18:21 -1000
Message-Id: <e3fda60c4131c21cfb3139c56c1771e342d4b9bf.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185906

From: Dhairya Nagodra <dnagodra@cisco.com>

The commit [https://github.com/openembedded/openembedded-core/commit/c22bbe9b45e3]
backports fix for CVE-2023-25193 for version 2.6.4.
The apply() in src/hb-ot-layout-gpos-table.hh ends prematurely.
The if block in apply() has an extra return statement,
which causes it to return w/o executing
buffer->unsafe_to_concat_from_outbuffer() function.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch       | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
index 8243117551..e4ac13dbad 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -1,4 +1,4 @@
-From 8708b9e081192786c027bb7f5f23d76dbe5c19e8 Mon Sep 17 00:00:00 2001
+From 9c8e972dbecda93546038d24444d8216397d75a3 Mon Sep 17 00:00:00 2001
 From: Behdad Esfahbod <behdad@behdad.org>
 Date: Mon, 6 Feb 2023 14:51:25 -0700
 Subject: [PATCH] [GPOS] Avoid O(n^2) behavior in mark-attachment
@@ -8,13 +8,15 @@ Comment1: The Original Patch [https://github.com/harfbuzz/harfbuzz/commit/85be87
 Comment2: The Patch contained files MarkBasePosFormat1.hh and MarkLigPosFormat1.hh which were moved from hb-ot-layout-gpos-table.hh as per https://github.com/harfbuzz/harfbuzz/commit/197d9a5c994eb41c8c89b7b958b26b1eacfeeb00
 CVE: CVE-2023-25193
 Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
+
 ---
- src/hb-ot-layout-gpos-table.hh | 101 ++++++++++++++++++++++++---------
+ src/hb-ot-layout-gpos-table.hh | 103 +++++++++++++++++++++++----------
  src/hb-ot-layout-gsubgpos.hh   |   5 +-
- 2 files changed, 77 insertions(+), 29 deletions(-)
+ 2 files changed, 78 insertions(+), 30 deletions(-)
 
 diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
-index 024312d..88df13d 100644
+index 024312d..db5f9ae 100644
 --- a/src/hb-ot-layout-gpos-table.hh
 +++ b/src/hb-ot-layout-gpos-table.hh
 @@ -1458,6 +1458,25 @@ struct MarkBasePosFormat1
@@ -102,8 +104,9 @@ index 024312d..88df13d 100644
 +    //if (!_hb_glyph_info_is_base_glyph (&buffer->info[idx])) { return_trace (false); }
  
 -    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[skippy_iter.idx].codepoint);
+-    if (base_index == NOT_COVERED) return_trace (false);
 +    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[idx].codepoint);
-     if (base_index == NOT_COVERED) return_trace (false);
++    if (base_index == NOT_COVERED)
 +    {
 +      buffer->unsafe_to_concat_from_outbuffer (idx, buffer->idx + 1);
 +      return_trace (false);
@@ -174,6 +177,3 @@ index 5a7e564..437123c 100644
    void set_auto_zwj (bool auto_zwj_) { auto_zwj = auto_zwj_; init_iters (); }
    void set_auto_zwnj (bool auto_zwnj_) { auto_zwnj = auto_zwnj_; init_iters (); }
    void set_random (bool random_) { random = random_; }
--- 
-2.25.1
-
-- 
2.34.1


