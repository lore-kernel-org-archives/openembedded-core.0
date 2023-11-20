Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6832C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:22 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.619.1700498356503054090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rqTn2U9f;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b6d88dbaa3so3045419b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498355; x=1701103155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utgOX76huIwlfXXkDFEn5LHemJ5rhnFRTvYSeQBqqHk=;
        b=rqTn2U9fv4dnDhFS8HikUuqD1xntk7ESNsRO6tWuEKeiP59oFV3Vz23RhjQwx96S83
         x1uPJrJoGYd3LnpUvfhYm1I5ySnUKKvnA1PGCZEbRT35lICrx5DNw6GNoyFdsANA11x7
         uvnCbS/FnbI/KuFmSDHZxRQPKmzgxDOQEYEBpLZYuXQJCENtNcNvUFvXW2YLv6moMvmH
         KP2JOcW++nHtJv6Uyf85kZLy15xUgsvE8sVEJHvTJHktSm/I7qaIoziKwVqS5WQ/G1BE
         zg3q4RPiVZXMHvGm/pmkHg29r7NiRTV44wp95UzqhjtR/4OUq+UifJoQUDfDPznWhMX2
         oV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498355; x=1701103155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utgOX76huIwlfXXkDFEn5LHemJ5rhnFRTvYSeQBqqHk=;
        b=h3c+s9y7YO8nEh/yEoJJpOKxKHbBQdYIrutJmVWCFvywCGiO/b1r6CfqGTDEsafnIx
         QoUBRalKoKUZqyibaBUK327wtmRrgJP9g6OK8TDb9v5hvOKQqYq5qHZ9pu2Fh08zzVg7
         /rpWCzO/oLkX0+b+7kqy6/EiDsW+GAIc7OwSmeIMv7dV6s/Ijfnux79m1s4DL5of85y2
         YGYuK39pryWVFjCtVs7pjqxbxpDA5X5JMgczAOmiKih7/X4OBFTarq42NIs3VhsqHdOS
         x1I+Jhp4N0bX7KSqsFvR2j2LRBGufb2yhYfksQFeO+DyUNA6LDNexM/32MsaxZFGGcWC
         uHhg==
X-Gm-Message-State: AOJu0Yz6NW9nVzvy3c7Bj7N6iKYxlaRgElkVHbMGoKzgCKO8Uyxq4hp9
	+nURNO2ctIwlhiF83wMPE15Ew1p0II/z8+RiCRIVhw==
X-Google-Smtp-Source: AGHT+IE6vdr3WXcqgRfVrCVCp6KlFb91fRY/AJnIROTcM6SlQfRgntgDcrQP+BYDLxT8uVjbmhDp1Q==
X-Received: by 2002:a05:6808:2392:b0:3af:9851:4d32 with SMTP id bp18-20020a056808239200b003af98514d32mr11143343oib.7.1700498355196;
        Mon, 20 Nov 2023 08:39:15 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/33] bb-matrix-plot.sh: Show underscores correctly in labels
Date: Mon, 20 Nov 2023 06:38:24 -1000
Message-Id: <a8039d601187b28d9cec4402c9e0bd72b2805eb2.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190899

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Underscores previously caused the next character in the label to be
printed using subscript due to the enhanced string support in gnuplot.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 282b48f90f77e0766993018d22fe03dd303febdc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/contrib/bb-perf/bb-matrix-plot.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh b/scripts/contrib/bb-perf/bb-matrix-plot.sh
index e7bd129e9e..6672189c95 100755
--- a/scripts/contrib/bb-perf/bb-matrix-plot.sh
+++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh
@@ -16,8 +16,8 @@
 
 # Setup the defaults
 DATFILE="bb-matrix.dat"
-XLABEL="BB_NUMBER_THREADS"
-YLABEL="PARALLEL_MAKE"
+XLABEL="BB\\\\_NUMBER\\\\_THREADS"
+YLABEL="PARALLEL\\\\_MAKE"
 FIELD=3
 DEF_TITLE="Elapsed Time (seconds)"
 PM3D_FRAGMENT="unset surface; set pm3d at s hidden3d 100"
-- 
2.34.1


