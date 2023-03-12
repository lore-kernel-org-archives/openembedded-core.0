Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EEEC6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 06:55:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.62336.1678604132716530422
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 22:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAEiSBgN;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id v16so8645945wrn.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678604131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+x5rVJYqx9eDOo8X0EKKf/COdzWXT2iPKBe4TyhPEYA=;
        b=TAEiSBgNVIle43w3TANb8NRR7S8JQkWS0wTeNeSjOIF/tV7rLWZfsrr3Xba22hoIkV
         ofKjMOjUYVrSWujO48UI81234OH2Pix0ZBLYG0xqCJ/ZED/Hx1dnFYThYRMWCBMJF1sF
         KUYKPiWwa3HT1Frh27cF7i+DL1OPbnGKDvHn94xvC+5LEddgLXPcgVQX4B5FqmSgrjd4
         psO+DR++zjsY1KPcGkYtodiRYv/u+4RPd0YPo/ZaBhfzHbrhzFl4BN7TN8eNlfpUXbRH
         gjKs8gTzT9vIXbkah34uN+9qy9tb8k6j4lOMHhPcLeYqYP1xypiF1LKRw4/I1kLdhdvG
         4jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678604131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+x5rVJYqx9eDOo8X0EKKf/COdzWXT2iPKBe4TyhPEYA=;
        b=YRV4ex5jDJ4rL38/Yi/MroNxSVp+EmAJZmVj2qKcmwfThB4NfU5OK7dyTnC36BYMVY
         DaavLPowYpmnAIIWlxqOqc3+kJRRlSltJADJvOzx+T4jT3y10uDhaO2dTarz8KYgMHq0
         l+7S2a926s+eJatFZYs6GT1Pz+U1dVJpqtqgPXSMKwjFUqC07e3dDYk/OA4pyYIHz0Kh
         OnL3j7wrnbESqPMy/rN3ci1IyVIvSIdXKljeTvG5MfwiYo1uuFy49WHxELtNGkiNVGhn
         3C09shRtY1Jn+ksEXsp4GadVaQ7B0nUJ/JGWMuijJGH5PVSxFiGml5/jWRLkPMWmjviD
         3Yxg==
X-Gm-Message-State: AO0yUKVNbrm2K14AEeq0Yidn9j9Xj44uxTuDB5DmhnBKOKt5AEuFcsTk
	KwBgyH0VAGSAFmmfQnHGEANLCaZ4pVQ=
X-Google-Smtp-Source: AK7set9xDKeH2wx7SeoTGEGaO8AQmGJ++azsAFZioeTOxHog92uwS+XW5shJ+JTJ8/XXYIx2DvsF5g==
X-Received: by 2002:a5d:644b:0:b0:2ce:ae50:9d7f with SMTP id d11-20020a5d644b000000b002ceae509d7fmr174506wrw.36.1678604130780;
        Sat, 11 Mar 2023 22:55:30 -0800 (PST)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:13a5:314e:b651:2ea0])
        by smtp.gmail.com with ESMTPSA id n9-20020adfe349000000b002c55de1c72bsm4159464wrj.62.2023.03.11.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 22:55:30 -0800 (PST)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH] cargo_common.bbclass: do not use buit-in git to fetch crates
Date: Sun, 12 Mar 2023 07:55:17 +0100
Message-Id: <20230312065517.61051-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 06:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178375

From: Frederic Martinsons <frederic.martinsons@gmail.com>

When a project has a dependencies from a git repository and ssh
access, this kind of thing in Cargo.toml for example:

[dependencies]
my-crate = { git = "ssh://git@smyserver:7999/myrepo.git, branch="main" }

do_compile step failed with authentication error:

|     Updating git repository `ssh://git@myserver:7999/myrepo.git`
| error: failed to get `my-crate` as a dependency of package `bscli v0.0.1 (/home/fmartinsons/bscli)`
|
| Caused by:
|   failed to load source for dependency `my-crate`
|
| Caused by:
|   Unable to update ssh://git@myserver:7999/myrepo.git?branch=main
|
| Caused by:
|   failed to fetch into: /home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/bscli/v1.0.0+gitAUTOINC+5b5ba2aa3e-r0/cargo_home/git/db/cra-d8e163876777fda6
|
| Caused by:
|   failed to authenticate when downloading repository
|
|   * attempted ssh-agent authentication, but no usernames succeeded: `git`
|
|   if the git CLI succeeds then `net.git-fetch-with-cli` may help here
|   https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
|
| Caused by:
|   error authenticating: no auth sock variable; class=Ssh (23)

No problem if I run "cargo build" manually.

As the compiler suggested, it is corrected by adding git-fetch-with-cli in
cargo config file.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index f503a001dd..c16aa4934b 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -114,6 +114,12 @@ cargo_common_do_configure () {
 	progress.when = 'always'
 	progress.width = 80
 	EOF
+
+	cat <<- EOF >> ${CARGO_HOME}/config
+
+	[net]
+	git-fetch-with-cli = true
+	EOF
 }
 
 oe_cargo_fix_env () {
-- 
2.34.1


