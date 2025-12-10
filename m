Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7640D3C91C
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:53:03 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17363.1765378383538806660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:53:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a/FB4JIQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2dcdde65bso1047054085a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765378382; x=1765983182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83AGhFhlXfThfBYiluU9KRtRs1HjZ25XXU10Ptgl+Hs=;
        b=a/FB4JIQoTLPMeS1ElKWQ/63xkEvQLq7OsHRCOi8XvrTMUg3yy+SZVpEbcU4PRR/Fh
         pzwqFx66RdSjserWKd3l+heE4BDpQT0z3uPNKS4VoL9TBsR+8ikK9yaqaVlRNxC/wOU7
         qx8MTZflBkHTYNakK3ySjc6XxYBJh8PttE7Dyky+qdz43Nf+VNejgm5oqgDA7I05MI08
         zq551whX0oa53tlI/tjWFfbd8NqbWJnKZmZk+hVhvzw6QjcsJdSw8kub5YYxkofycNTe
         zuBOlpE+nf9T2GZCCgqaIHnygGXldGoTxnaB3KdCqBx41ch0jnRXAlN91aHFmDNKvXBP
         AV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765378382; x=1765983182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83AGhFhlXfThfBYiluU9KRtRs1HjZ25XXU10Ptgl+Hs=;
        b=IcCi41Qb07abmzNrBFfn4+1QkKemP9LEKwNlwB+cpVm5scvbHBt6QcI99DbjzNtE6F
         28vZs3BQMl+pi/V+Vu/p7eZeTEqUWCWRliT5xGHpj+z4O/CkddFiHqrG6nxgXaTaZFzv
         Z/RMKfgIV1M9CUX9PZQlC9abVtIMmyJ6FMDNNweOGl35fMl3tqQnuGLjgX2ARMzAKrvp
         WIJ9ARgjkG1o+pg1NNtTMXiUvSq1FVANQAIkiSgrvcAumi7HgH1VRZCPfVSE9vOuEWfZ
         v63W43RUNErgXrSQP67wj4HV4szDQ5geki6l1+xZ4Ex4EmoOBbr7YKNeG7L5mPlhvdqc
         RvEA==
X-Gm-Message-State: AOJu0Yz2va6jyZWPH7iuXc9RAgegfoUzRKriMH1V8Y3uPmizYm1ZUTOV
	y8+vks9vNytSf4qMzdvQT3V+eBl/MntYER6QquYu94I5SLrAYtpAB3HQ
X-Gm-Gg: ASbGncueXouQP9w88jPtgGzATYnSLzHYcF7GM9XwVdXAF7rp9TYrdzy7JxlObfekMop
	0LNgezD/DrM7Oph5eZjC20Ga8fK9GyxEobicBn238xbk+iQALdmcpDSUQgLWgRQmSupVLf9QdSn
	MNZOD8x14tjSxdhkOM9/ref0/l4EXV2OhCJ5XtocbgHb4ZbrByGGU6Qq6R2sAAg7tPIoq/PEt8x
	Gn2oaepJJM3OD3dGQDd3shEf3Hrw8S9bjFcQBkmnAHYdZNrQlAHNEKzGOavcsUnXsj0PwlWe3Gb
	JSnHR2HaB000PgjDGRFbpovn7RoUQQOeiBvsh/UfoeBExBe9cnTIyj4l8JqN36jtvodL+l3kEgN
	75SEl9PNIwIx8aVGArBxP1NO/lcKRfHcBOvjLxkImGO5qnEU5VqvNtY2Eg5+9XbKJFPn9PUtVN/
	4gwebxYQi49LXSsGN+LFb+wmSGzwcPIrlni/w63hdJVsjHhxEfOEQXR4dvrMuNbvQK7MtWKo5ie
	y/5U/QlA54AHMM=
X-Google-Smtp-Source: AGHT+IGtEQM8BL7MeQSNqN3oPbURBULDPYEOO+0WM9ojEq1Lri7JZGDXNVtAO83TpHWrlDklxLuhJw==
X-Received: by 2002:ac8:5dce:0:b0:4ee:483:3123 with SMTP id d75a77b69052e-4f1b1ada6f6mr34938581cf.67.1765378382431;
        Wed, 10 Dec 2025 06:53:02 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0276b210dsm125804431cf.14.2025.12.10.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:53:01 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: add files for 6.18+
Date: Wed, 10 Dec 2025 09:53:00 -0500
Message-Id: <20251210145300.2818964-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 14:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227480

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel's 6.18+ have added a dependency on rq-offsets.

The rq-offsets compile pulls in kernel/sched/rq-offsets.c plus the
scheduler-local headers (sched.h, cpudeadline.h, cpupri.h, features.h,
stats.h, ext.h) and kernel/workqueue_internal.h; those weren’t
previously in the devsrc payload, so kernel/ sched/rq-offsets.s
couldn’t be built on target.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 95dafa351f..a7e8162eca 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -348,6 +348,16 @@ do_install() {
         cp -a --parents kernel/time/timeconst.bc $kerneldir/build 2>/dev/null || :
         cp -a --parents kernel/bounds.c $kerneldir/build 2>/dev/null || :
 
+        # v6.18+ rq offset generation needs these scheduler sources/headers
+        cp -a --parents kernel/sched/rq-offsets.c $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/sched/sched.h $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/sched/cpudeadline.h $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/sched/cpupri.h $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/sched/features.h $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/sched/stats.h $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/sched/ext.h $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/workqueue_internal.h $kerneldir/build 2>/dev/null || :
+
         if [ "${ARCH}" = "mips" ]; then
             cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
             cp --parents $(find -type f -name "Platform") $kerneldir/build
-- 
2.39.2


