Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D58DC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.617.1700498378832062882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HzNEEi8Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso3910687b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498378; x=1701103178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrXMK8ZKTcDceZgmVd46O8RrbSw82I25enJLJeo+nqo=;
        b=HzNEEi8YDg035OE3x817wbdBvoc0w8i1tqTglecTvi4EEdQ/JZmMuO8bCJ+0WfHBY1
         qO6vnmOrPWW3t9NG6DMO5zZHWBLaEQ/j14fwVWG+N0GHd0WfStCNj5lTicpfaTh8uLcp
         MSyP7wIr1V+2zdJOBefPiODJV6YZ7Vfx8MF0rr/V95CIF15Y/bQrcGKMM48Af2FfuLDJ
         Mq0b0kK78ZyvBgOsOgfKKs6om6V6A8jzeydqoHI3mgrIG04zEJvTGgkTQPbAOr10XppF
         +5IjyTIZgRHejmbzkltCJIwPbnoD95hGA4obDRLkYjLIESAM8uJ6snGKnMe3EZ7F0h3e
         L8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498378; x=1701103178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrXMK8ZKTcDceZgmVd46O8RrbSw82I25enJLJeo+nqo=;
        b=k9tn1Y6Z4LvZ9TUtPa6MmFkUX6VfWFlY1grDP85uiZUUtaeEW5wKmtpj4Ddz2mWoq+
         wqGq8gGlOjUNSpZFBlA0gWICwc/vdwkIjOL+Vp2tpmkVlzevVaJ+YduSZfVFlDd5DRfS
         pFwAp73sBxhvJSetFcvPXy/aKUvWDTXC2piC06lkoecLxHpXI3FdDPIhRkY30iHDjFU8
         hAdSogpFjd0VuH6jy8q+MGiMxwOw/ILU0xMm9IotJucAjU9TRPDyPrtzHAa04cdO328k
         V/I2SxgcTu1CzPKn6rhIh646ACT5My7mleVFY4vmRmxEvcaV+B0iUBtO5ruNeS+hyvJ1
         ixMA==
X-Gm-Message-State: AOJu0YzLD6xjDmtEgRgHbVY1D2NaTXyXo0wu4Tj9/4tlxB+BjOUc0e3o
	TP8SyJPFbHp1T3vo6YDYQFxkegmheS1+KdfEHIEiwg==
X-Google-Smtp-Source: AGHT+IHDDVFgQthXhgpNLYX4/FEZb+NLV/pdsSTjdzHHTT9yvYHhuLiCLl2qFisIN7XKCt0wDMl5hg==
X-Received: by 2002:a05:6a00:3923:b0:68e:3eab:9e18 with SMTP id fh35-20020a056a00392300b0068e3eab9e18mr6405255pfb.12.1700498378009;
        Mon, 20 Nov 2023 08:39:38 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 22/33] patchtest: disable merge test
Date: Mon, 20 Nov 2023 06:38:36 -1000
Message-Id: <0a8c8fef6ece7b0802f0b6f2d6aa2eb71afcc2fe.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190911

From: Trevor Gamblin <tgamblin@baylibre.com>

Disable the merge-on-head test until patchtest properly handles merging
of series subsets and accounts for patches that are rapidly merged (i.e.
before patchtest is run).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e561c614dc72b7f8bf5e09a09bbe6ebc3cf500bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_mbox_merge.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
index f69d57c71b..535026209f 100644
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ b/meta/lib/patchtest/tests/test_mbox_merge.py
@@ -18,6 +18,7 @@ def headlog():
 
 class Merge(base.Base):
     def test_series_merge_on_head(self):
+        self.skip("Merge test is disabled for now")
         if PatchTestInput.repo.branch != "master":
             self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
         if not PatchTestInput.repo.ismerged:
-- 
2.34.1


