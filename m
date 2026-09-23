Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CA1C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:20:50 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1801.1790148047292350433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 00:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LdogEBwk;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.99, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so360486f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790148045; x=1790752845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H2FkeV9D6aYQvk1BvLugwyqmK1V8wOCMo2Jn7xeFLJI=;
        b=LdogEBwkS8Z+bg95QyR+EQmQcXl6v18yiZcroD572UHgCePW81ApEJNn5LpaiZ7SDb
         8CwuNgMTTm2S5b1aGI4BUsfJyTTElESaViRhB6qAtyDwM4JnreiHr26g4RhoCYiWJoVW
         EVBilwxk6UvpVRspvg3whFrXAE83P6KR07tIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148045; x=1790752845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H2FkeV9D6aYQvk1BvLugwyqmK1V8wOCMo2Jn7xeFLJI=;
        b=du/HTbjrNHNBXotrS28tWYQ5hacoSm7J1DRcnsegMuVeNxAycsID41T91llac3TLuc
         be1Ty9H/FU3ya9gK3myJXG2imBeJT2mfxfXZrgcKpLoQxDF+hpPNYfmiZBhMP/tIDOqm
         e57tk9B0PNdfhKqL79EnBuB8OadLPi5LNo/NRUMJcKMvUMjAtjnQmfJ4vzSvNUKOgMxj
         KcIX9V81yvpUSA7ZKkQv8/Z654X8ZvSSHQ66vYTGflATCfogorsdSxLYcnkCktE11Tzo
         iaiVO7b8t99W0P7HpAW2z3hKmlhUDQIk4vzDijIx6clLy3F6sllhxOZUZSLmzaElh6Js
         ExeA==
X-Gm-Message-State: AFuF++mopmVY0PQXPjZ/7A4QgZRuYhk651NaMg857ztEfIG+fQKzbUqx
	+mc8tBnU6Z3bORiJYX5KgzjwyFpnkr9/8eISsQmAWv/KFfUHFvoFS/N4uRXqZjm/VCGMLjsnLuC
	ycol/LrQ=
X-Gm-Gg: AYBFou3HL/21IopMGiSo3bOljpqfNriBULfoovt+72K2+YdP8JwqaM6vMhoj+gApl/p
	K4Po3mGuWdwkusDq9+XHxiDF8pu9pmTac8zO6iS8CFxIl3s8WoJlJjk8Ru2NBPqX2+pWAMu9F1j
	IuV+LwOv7/9jpxp6vgvJIvdM2sDAyeDFwI1z2ZjTHOXxlYiK1kaAWWjukEQ1Ktpu0MbxX3HS8Lw
	GsA3Sp9asi4y0yE/5ebyg5HOw8UIpvSOmGihOvdcWy0qzC2Do4/q6Ezy1SE2TN/bWInkepdihFn
	+94aD4GMVlaxIPxxhs7xskTn/QZi047NbIxaP4WTXzIJ1RuJ/r8HZV+/o5jo5/PUf1TILOT1OTL
	WzZY8PjhMqxXHMK8rg0fAiDtosENQaCFIThFz+Urxp/w/Nj0MzAoc9PoUX4Iy08DPi8mswa8CcE
	hZGXGDCp3oLUZBL0KvGBasp1JWdrZTydA9QGcTNFjL9t0i9u++FhHS1dw8Prrhs8bXm3iPP2A9a
	TSgyQ9D54785WFBLcWg+9K3zd8=
X-Received: by 2002:a5d:5e84:0:b0:487:2354:d9d5 with SMTP id ffacd0b85a97d-488670b91bbmr2586439f8f.55.1790148045514;
        Wed, 23 Sep 2026 00:20:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f510:706d:14a9:45ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm5427800f8f.14.2026.09.23.00.20.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:20:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] repo: upgrade 2.67 -> 2.68
Date: Wed, 23 Sep 2026 08:20:38 +0100
Message-ID: <20260923072039.3153452-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
References: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246455

info: reuse branch snapshots and combine history walks
project: avoid unnecessary sync revision enumeration
project: make fast-forward merges explicit
project: fold normal stash detection into status
sync: reuse status HEAD in the bloat scan
project: render worktree status from one snapshot
project: use one status snapshot for dirty checks
git_status: parse one porcelain v2 worktree snapshot
git_command: allow lossless capture of machine output
project: pass --no-filter and --no-tags in DownloadPatchSet
project: rename UncommitedFiles to UncommittedFiles
command: preserve project filters in regex selection
tests: avoid losing trace2 socket readiness signal
sync: keep generated jobs-checkout help host-independent
sync: implement reprojectcmd for the local half
project: report why refreshing the index failed
command: fix group selection across submanifests
release: update-manpages: restore __main__ guard
manifest_xml: Improve error message on base check fail
upload: bypass branch editor with explicit branch and -y

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/repo/{repo_2.67.bb => repo_2.68.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.67.bb => repo_2.68.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.67.bb b/meta/recipes-devtools/repo/repo_2.68.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.67.bb
rename to meta/recipes-devtools/repo/repo_2.68.bb
index 948a9a775c0..ee448583ab9 100644
--- a/meta/recipes-devtools/repo/repo_2.67.bb
+++ b/meta/recipes-devtools/repo/repo_2.68.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "d27d6829a84f488b7253ea693dcc429076c33914"
+SRCREV = "8c7e0a683e88cf23f2c4765b26cfa1c917b660f4"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

