Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487FF108B8F5
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 11:04:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10064.1774004656330082884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 04:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S7J4P16+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b2965d4bso357188f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774004654; x=1774609454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4U621qN27JyC2rqDyG/yxOcGpW16qs+FW/rVTLoYkc=;
        b=S7J4P16+ozg7iqOtS06m1qov+kdxiO+FWL3p4pE8MguXwy9UMXHetw+h4FSGdX2Q3O
         GrGuiI/KdPh7fjC2QY8T6oNPdFsstmduM2pBGU4OqFjzxXsIlPQ+ZbUB3eacIRx39TmA
         jt2L8eeuuB21YTs5QovF+iA1yj9eEPGi0+7bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004654; x=1774609454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4U621qN27JyC2rqDyG/yxOcGpW16qs+FW/rVTLoYkc=;
        b=tTPt92T+PyjxTeEgoiUrRbzLowvOHxbTvaisNtnUHcRYMZEaDYNdbCTzUP6pRhWgEm
         3UAFsU00wz0rAPSgA4/B9A+/f9YfoxU01bJpEIU90AaTbKKUrLdD4OzyVgrG36pk9msa
         B6hwe6mJy0yi7TzU3gUjFzyrhROIjFudXJ1XKmpGoMeznRpyhoIjWvyQTkdWFNoDKkBb
         BXLcWQi+49IycrXGxh485cJlxekYtuAkOFy/MPznIaeoxkPdUYEWVLGzRLENo5KWClob
         gKiT1JmnSSwLK+OjDwtBJx7WHJj3/BIEnxI9ka4mQyx2t7y8Mdr2E908stnIeG4HKwHM
         uO4A==
X-Gm-Message-State: AOJu0YyioX6w5RKTSzpEZSD2nNSJnEVljMKtKViPPCvM+1AtipmkqrA6
	+sV/0w5ouI7JRNk130Bb+sYSFMr4sKoPZE1W/aZkV+Il70LFSY9vZ8OUd09vCIBp1LOwYtWZQ3p
	3D68pMXw=
X-Gm-Gg: ATEYQzwLAWtXjh/lbL27IWqh3/vOx/xURxa5vjzZ189gZWI1lsQu6BUyudCbRVv4+7r
	SMkQ5k7YFbYzc5LEXLeeboj2dZ2VXTiq6z2If2/dvvyMrI5Lqz/9c2yw7KobywU7kk1T+ppuaht
	S3hTxfi/YAuPgK+Ykyz4G+rDcE7Zh8FSK+U/KQKPxxve8zsrT8zM2cB6jZgadq0vzTqbjvTAJya
	wOfdHmDpwgpai+j7HFsvJ0rX/mOywKOv+75ZpkNZ8FM+buusQzcraijOobFawyLivHekbbh/067
	l/iQVVP6qret1NBnujQ83NkYfqYlcvydbMJ9vyHMhC17AmbtXASMiZUuIC5tMocg2J/cN3nnBaz
	4DCAMD53Yco6bgOJwr7MWa9TVTZk2sSpydKDnyHGRMO4aJOzloWtPL2oQRW8UJ4ZviPtG112twW
	Wp4XIA5da+yuFNShBYYaQxil4l6yfoOA5SpE/mvRvKrnid4smSZ9u9
X-Received: by 2002:a05:6000:2303:b0:439:b6d6:723 with SMTP id ffacd0b85a97d-43b64287251mr4325462f8f.42.1774004653835;
        Fri, 20 Mar 2026 04:04:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:72df:cb96:568c:f7d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm5992960f8f.33.2026.03.20.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:04:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Kai Kang <kai.kang@windriver.com>
Subject: [PATCH v2] packagegroup-core-tools-profile: add lttng-modules to LTTNGTOOLS
Date: Fri, 20 Mar 2026 11:04:12 +0000
Message-ID: <20260320110412.460822-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 11:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233596

From: Kai Kang <kai.kang@windriver.com>

It has removed lttng-modules from lttng-tools's RRECOMMENDS, so add
lttng-modules to LTTNGTOOLS in packagegroup-core-tools-profile.bb to
make its dependent packages unchanged.

[RP: Fix for riscv64 which doesn't support lttng-modules]
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-tools-profile.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index c57669f1d74..aaceed14d25 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -32,9 +32,10 @@ SYSTEMTAP:nios2 = ""
 SYSTEMTAP:riscv32 = ""
 SYSTEMTAP:loongarch64 = ""
 
-LTTNGTOOLS = "lttng-tools"
+LTTNGTOOLS = "lttng-tools lttng-modules"
 LTTNGTOOLS:arc = ""
 LTTNGTOOLS:riscv32 = ""
+LTTNGTOOLS:riscv64 = "lttng-tools"
 
 BABELTRACE2 = "babeltrace2"
 

