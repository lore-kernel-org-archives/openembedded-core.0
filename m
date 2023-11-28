Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E65C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.10467.1701211992823925451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g5dOBcTj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cf8c462766so44422025ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211991; x=1701816791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70Z7z+Dc5mmHICn6hDFdmM95h93ri59HkHmPPpIXg58=;
        b=g5dOBcTj5p38NvVTwPxiVcFRcEAM1cviHlWq0DC0ZZfRQ3L7pUe6SweskuXCovWh5P
         FV3qFwuuyAVL2n7Nx7yTbOkb/TpJsNs3s5K4ZZORXtqM0+NfkxjPOpQhf4So62O5xvKV
         FbY5qF3eCM7b5mbE+oOGd0G0CHFRhGaQCEKO3Q+nileMhchj8ggPHvr9yQZaJR4wt/s9
         1yX1Uaq3ONFt+k+V8i/PAy1w992FsavyIBwIwroPiw8E32Q8/CgJ1DYTsS0EOuy56s0k
         1Xeui0/AytstT0dTQ8cNJbjpiV5LxK5FjOGNYFDZ1+8G6phX0wvwhJIKNTDEE+C7pUhV
         TM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211991; x=1701816791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70Z7z+Dc5mmHICn6hDFdmM95h93ri59HkHmPPpIXg58=;
        b=xTPeu18wBFX/rQPnN/AIuxQrtkAHxYLE5JnVE8mtfmU4k6/bGjgIeM6FlpUuM/v3cQ
         hteD0skvhhoxLxep7TYo2ipdwN55AcGhGokvmNgHHN2N8xFAcixZV4L0M1aBcvf2LMWT
         z3pL1fIet7nWIOR+dYE7v0rBy0tJLe103HR7UZg1vN/2YX0ky/vG1dXSz5KRaCHFbIlN
         LMaImZHJ3VPQMc24ObUMehN18fpi6S6gmICaCnol8XgwlhMSTwbizho8oSnNjQefljs3
         faDXfP2HG7DwEfjLBkDpW4S/DOkA7HBq1DnJ/PagThFdHl3JDJsOSLclUDmFwOd85Ek1
         w2+Q==
X-Gm-Message-State: AOJu0YwJVEbmAJubGZt5XooYbn5/sTRpis+ss6VOqX5fd4mQPw8wW8N6
	eCUxORPlcuU82cxo00Sd64+BDnJDevd9YhAO3UEYwA==
X-Google-Smtp-Source: AGHT+IG2rZkhenwVDgtHTGbaX7ZvLwpa9uOKVe7IMG7p6djBoXOCz8okTb4G/S4NL2TtYFjnQG9POA==
X-Received: by 2002:a17:90b:4d8b:b0:27d:c36:e12c with SMTP id oj11-20020a17090b4d8b00b0027d0c36e12cmr16915671pjb.9.1701211991602;
        Tue, 28 Nov 2023 14:53:11 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:53:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/13] vim: Upgrade 9.0.2048 -> 9.0.2068
Date: Tue, 28 Nov 2023 12:52:39 -1000
Message-Id: <2854c285ebf615ea71ecfc6fc559419e72005c5e.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191407

From: Archana Polampalli <archana.polampalli@windriver.com>

This includes CVE fix for CVE-2023-46246.
9198c1f2b (tag: v9.0.2068) patch 9.0.2068: [security] overflow in :history

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-46246

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a12e3c8d89..9a74a52b52 100644
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


