Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1096E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 22:27:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.5329.1736288863362000796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 14:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E8d7Vtjs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so12482525f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 14:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736288861; x=1736893661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vvg8VDx+1CbEmxhVgmqrg1mpiWle/O3UCOfBl1qUO8=;
        b=E8d7Vtjs2isM+Vw/pwo0DK+cvLfRBGb4VjW+DCP920Z+NsfFW+JjvQvMW7kQBEg+Qd
         cwCFLKRgNGNzT3h7P+sfhi3JKBtcmFkO2QgGOgpJEzajmUoF5lqNaRa5MaJZPvnu8uGi
         s3KwRMbeI9gUnljS0jri4CzbKCzW2Z5xsT3eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288861; x=1736893661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vvg8VDx+1CbEmxhVgmqrg1mpiWle/O3UCOfBl1qUO8=;
        b=vqfIERZ5jNV01Y3D2RrGRbgvECi4K0bNgfIzpHi1Y4XYRUuV/Z9NUU2txnBuQ8gFtp
         kjU7jLfNsGEBKCrRebMkXa7wxIRf9YyT2SJK4W/tLc5ryFjYJKtz9i10uMHFmMfusCyr
         JlY7gHVn8MIO/2wRwspW61bFGRMm60/Ti/ib7A/2gfoh/ByJXQbcDqdpARIhjdtZsgOB
         RE0sUKMCdqTKzbCCv4Lv3hSrwnfeSCXYg1c6rlqxeL+YGbVUzJ4KEPyMpeDk2SLpI9m3
         NO2+QDYhNTWn5Me5xs+BUd4LrP4SpGTeIMOg5nxEMoGtKDUEFUoG9lCjD86BKb+6+PV4
         AeoQ==
X-Gm-Message-State: AOJu0YybqYI40ne4Wkzl9GfVG9DTy2S4eUvUwvqh9NTv27Wjc/C/CSqp
	XsAAB0nGnarA144BdESjF521DQelqKn9L2ftD8D446p4Nu+mbajV7pqM90kXbYxiXfvKBePbmWh
	Hrbk=
X-Gm-Gg: ASbGncvaxhrNcGQlNRobLA5xK+LSNyYClTruaghZp2a+aQqGFTOeYo97pkoSVNOzYPT
	LfOtl0bPMFMO8DjmhxjtFqrwti0N0vdpQ/xvF+TBpeqhM6GapG+HamXc1rOqj1iU4CnILQxuFlI
	n67UrFVkwU3Ho1rpUtg286GkprL7/vVNgEOnj87sPQ5SwN7cUMJma59uKQ7xMDEctEEtNq3SFtu
	4X1GFcM0G+tfs2IKI8UvivdOlTEn7l/l4D9661yG4J7JyO7ZI55qwxufLCrOe7WWep/bt/uGOhO
	xlZdLPkXZg==
X-Google-Smtp-Source: AGHT+IGdsG681TrJHMTfkR4S8x+FVnJhMurtYkJz/lQYltroGb0cpxt7QdBHAtv44xVVOpP0wkpRew==
X-Received: by 2002:a5d:5847:0:b0:386:407c:40b9 with SMTP id ffacd0b85a97d-38a872eb4b9mr208415f8f.28.1736288861397;
        Tue, 07 Jan 2025 14:27:41 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:f113:f9ed:a6de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a47c9b2efsm31808269f8f.91.2025.01.07.14.27.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:27:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Drop obsolete and misleading comment
Date: Tue,  7 Jan 2025 22:27:39 +0000
Message-ID: <20250107222740.3520980-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 22:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209505

"packaged staging" is obsolete and now we have sstate. Multimachine is just
the norm now, I doubt people remember how things used to be!

Drop the comment as it is misleading and obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2dfb9ce94cd..6123bcd123d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -443,8 +443,6 @@ STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
 
 STAGING_DIR_TARGET = "${RECIPE_SYSROOT}"
 
-# Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
-# packaged staging and/or multimachine.
 DEPLOY_DIR ?= "${TMPDIR}/deploy"
 DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"

