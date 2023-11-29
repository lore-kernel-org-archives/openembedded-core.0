Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3B3C10DC2
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.57644.1701299122166951003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lz5qRieB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d01c45ffebso3508675ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299121; x=1701903921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JROZafmciNwQKae1JBXhlFOAeNUM5zktCgkzlpmItc=;
        b=lz5qRieBgTThRmB0oAVSxy+T7/cSsipAvUnx78ssvswMcLnTinzJf2j9zf1uU7vL24
         gqA51eYAuNsm53o5MGty1XLXmn4gDtz7RSplStbyPpOVCIdfNqEmFtxHwXeHLSv1ipSC
         +q+C0yFS1+B9wPBE06BXyabufV5wMDQUnM4/M2fIvKVzLofAu+NqI/CEz0QEDfx6rWoD
         IIANHtmbqapmVHWSfk1VSdqP+HF6cy90G8jH1R/j6B/JOLSJutOrAUbaQdfyiTC1sdEK
         An3tEuBWSpAGCShF0zN1sF7uzLM5dJEBioEPSqBjyAgbVpX6OnWYlUXC4CdcVJxp22vZ
         vAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299121; x=1701903921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JROZafmciNwQKae1JBXhlFOAeNUM5zktCgkzlpmItc=;
        b=GUy1lQbKx/YnQqN22g+BBc5y7f+WcP5CYgHkNNdZv2uJF5GqSYtyOi2oiVlY2NxPoh
         vpQHEGSVhGo9KNQqeHlhQfUKdDclMrMt9udbVreq06zr8vbQriv9HTMWLXUSTEcuzvQX
         gabXZOaTvuw8hxSqo9o35FQJ3qy6jvgGT+o2Ud1s2C0YJaJ7IPxCPx/ms1BFw2REqK90
         0u5ECIP0evkYSh5Np+f0k3acsSkqEJM7OA9PFa61UStxWULJ9e/mNrC/IHcqzig5wkLe
         hbjfMX6t0XMDS5epKOyKb58f3DRuQ67gaTItg9wmxlYxNiJmMEn/FdKAyWkTBawJaoNv
         9ucw==
X-Gm-Message-State: AOJu0Yx7s9vSNBIZmJiBAgIGgZrHKz//22N+n6rEhsKwObojyNuLKKzS
	7R3nviMBPGYDj+qLdQWVY5nePqQw+Zixvxxb1y+MgA==
X-Google-Smtp-Source: AGHT+IHtouORbIYNctNDoTpTIzhMg3IwiCs9UR9REgaxe9xmsYbq8UGpM/VpEp6Vfqy92yFbx+owWA==
X-Received: by 2002:a17:902:e54b:b0:1ce:6589:d1c0 with SMTP id n11-20020a170902e54b00b001ce6589d1c0mr25220862plf.46.1701299120920;
        Wed, 29 Nov 2023 15:05:20 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] vim: Upgrade 9.0.2048 -> 9.0.2068
Date: Wed, 29 Nov 2023 13:04:59 -1000
Message-Id: <8c83a25494f99ebe63f59a267001e4a19d0a6b14.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191470

From: Archana Polampalli <archana.polampalli@windriver.com>

This includes CVE fix for CVE-2023-46246.
9198c1f2b (tag: v9.0.2068) patch 9.0.2068: [security] overflow in :history

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-46246

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63bc72ccb63d2f8eb591d7cc481657a538f0fd42)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 888f8f0e5a..a37310afd8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2048"
-SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
+PV .= ".2068"
+SRCREV = "9198c1f2b1ddecde22af918541e0de2a32f0f45a"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


