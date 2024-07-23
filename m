Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E104C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:42 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.43726.1721740418281330895
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NHhxOVFw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cb4c584029so2959105a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740417; x=1722345217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjAWjaiwBC441RODwHKF47QUNy/U9aLi/gHbKmiihj8=;
        b=NHhxOVFwHEe6aLf1KIdGEi7rEzIDagrrYGX2NwthBI+d2gcOnHi2Z8w6aZWEg7Axam
         ct6D7GOiVimPMOsLn8+lQIIE2V8mg1sncptvE4HwCcleyKvFK0syW6152UDHavnbtjSI
         GGiHP4GjFdAEM3XLNnex+nZUYwhwuVfU3qOZBMgbd86ojg0ftLCb05ynDPtzAn/efSw7
         TKvWxC6pyLHWhAK2+0bkAwBMNnmbi3bYx/Qj8kYVm51G1RrRYPVFXlRI1Y/wG7yjUwnF
         PQJMdApfqTMvrckY6lhFqbHe6wu1L6/88PEFVV/68w+vn/RAB89C/tSJ2UfbFLl1pa4j
         WLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740417; x=1722345217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjAWjaiwBC441RODwHKF47QUNy/U9aLi/gHbKmiihj8=;
        b=nHpj0Z6G3mNYTZ5kuqpXZr7er/BHMNHYVaownACOy1sU/5P9XA8UeTF3dG8iuNqI/t
         tgwhnci7tcl1uQwhY92M4dde6J+p3OV+/coL1nkh27rTg+I7bc05+EyidZnZ8IQ+s/eb
         YX0gCF0yrwR116v+fXWYGJkiLzolRBqX0t4/kVfQkMoj1KsKy3BsPgfqvqTeXJGwh6Cx
         9rERgKqWCpc8GN8vFtiiv2++Osix//RIUcjNLn8cHEpgwOyN5UBpLxM7NxVNNKYCauq/
         mGMJyuoJdPhTEeQ2U/S06i9M+M6jy935urDF9c/Sc4AevkhgEXZK8pEAEhLFJgSjj0Xs
         3aHQ==
X-Gm-Message-State: AOJu0YxTKgIl0YTkOmLad6gZ5EglSQTXEQ8BPm/0k0q5XnYILpmtQDoF
	93o5cM3XsIyUWwQvtsWYMI7gpBWU4FryJDGUoLX1/3XlDR6rGpi9Rti9EPNUmqKNAfeefoZePRo
	cn4w=
X-Google-Smtp-Source: AGHT+IENMLdSDIZoD9b4OG7W/7Unyfj+S8iJOL145bxKX7gAYBY0bDT8Fwt74xaGdUmsbzbIqvJYRw==
X-Received: by 2002:a17:90b:1d8d:b0:2c9:6f06:8006 with SMTP id 98e67ed59e1d1-2cd27430ca8mr6523574a91.25.1721740417586;
        Tue, 23 Jul 2024 06:13:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/17] mmc-utils: fix URL
Date: Tue, 23 Jul 2024 06:13:07 -0700
Message-Id: <03b1b0798e6eda991f78ada80d4c2846034ea0ff.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202353

From: Quentin Schulz <quentin.schulz@cherry.de>

The current mmc-utils git URL still (for now?) redirects to the URL in
this patch, but the homepage doesn't, so let's just migrate both to the
new URL.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59870f6d87bb516d74081fde1c670e4838e6e134)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index a7e4d369ff..9d3f673273 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Userspace tools for MMC/SD devices"
-HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
+HOMEPAGE = "https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
@@ -9,7 +9,7 @@ SRCREV = "b5ca140312d279ad2f22068fd72a6230eea13436"
 
 PV = "0.1+git"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


