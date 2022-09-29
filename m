Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB91C04A95
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 02:06:12 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.5952.1664417171390819795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fCdozyFW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id a29so180054pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=U6uu7HH3x2Y7lzYtl64HHY03xcS4lo8+kApl/t6fJVk=;
        b=fCdozyFWzIzs9c0GlxEhR4OW0DFYDkDVw5It+n4MZtnHl7h6/puAyuRJbrs41d+s8H
         ngxOhLlYuR1pXyVizWG5KXImN8x8sRvyLQAwfH6Y5AcFrbY1MPo9x32X/LDlCcpi6wak
         cf8/02Q9SBFfxsY3jrhmH+uOFUaxOLYwUliU/8eEuv9xpC06xJXQSrz8vUT7Z/a5tCvi
         3UIgjy2Sd25cHJPztyD3d1IAeCK9TZR+h+lzzM/czJKPDj1T16vrMVZoB5OYEwRzj83g
         khBYnZDkgZCGK+svnE4GVp7qkw/84R4b+fHus5M7bjT8JRnlfQemxc52BBKaciqIdabg
         ZJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=U6uu7HH3x2Y7lzYtl64HHY03xcS4lo8+kApl/t6fJVk=;
        b=UoHt/d2OPstkegEwSuOraK1DgdR5x0gGL8HXWHEfIR4K0u26MNUNV//XiWGQBsIOZ2
         l1lv3vSV2CvbI/sAqfy7VL16HXz/PDCHKXcyS+GPoeFm7ZwW0YdDejxNfIaKpGEwn6G+
         mjL/mkDNtZiETfRC+CWdTAf1q6XDy5vz2Vpw3GJRDk8hB7vvIqdbgHuQOKsWW05NKmX1
         Fb4bBBZkt8sn7IN+4Owo/gcsx2Z9aPZ96lW067Hvgb9+fe3lV36v0JZIhZ4uMCKI/pIL
         j3Ktd7w6JTr2wjNYlHVmVacDeZHL512JJedI2KPzNdFig8MRXXgbD6AbZtnhYV9iFZ8u
         7q7w==
X-Gm-Message-State: ACrzQf2ArMIn2nWZyjhfXWl7HhpCqb8PJoOIioIP0LiO0GRq9HsNWRNt
	MoYR2tWo7JqDYOwb1ONaRYMLB2Yc3FE2L9bl
X-Google-Smtp-Source: 
 AMsMyM4u2IYbuRBOlZDN5xrxaljE1CzggVD5aTJ1DJv9ow9cBkngKZ/QPXdF2T5uCaRznDZsZ+Yb/w==
X-Received: by 2002:a65:6950:0:b0:439:51cd:8b8b with SMTP id
 w16-20020a656950000000b0043951cd8b8bmr776193pgq.230.1664417170129;
        Wed, 28 Sep 2022 19:06:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a1709027c0100b0017680faa1a8sm4464214pll.112.2022.09.28.19.06.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 19:06:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] create-pull-request: don't switch the git
 remote protocol to git://
Date: Wed, 28 Sep 2022 16:05:52 -1000
Message-Id: 
 <3013bb9183d0cf215721668a282b2e20c9e28266.1664417041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664417041.git.steve@sakoman.com>
References: <cover.1664417041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 02:06:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171163

From: Martin Jansa <Martin.Jansa@gmail.com>

Many git repos prefer https:// nowadays and many removed support
for git://.

This breaks the script when using github.com even when selected remote
is ssh (git@github.com:openembedded/...), it will re-write it to git://
before calling git pull-request causing:

openembedded-core $ scripts/create-pull-request -u github -b jansa/artifacts -o pull-kernel
NOTE: Assuming local branch HEAD, use -l to override.
fatal: unable to connect to github.com:
github.com[0: 140.82.121.3]: errno=Connection timed out

warn: No match for commit ea003bd026aa24bb4c8b7562f44ed6512e921259 found at git://github.com/shr-distribution/oe-core
warn: Are you sure you pushed 'jansa/artifacts' there?
ERROR: git request-pull reported an error

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64c466920b808c35d1ac87b47cf438bc79becea7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 8eefcf63a5..2f91a355b0 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -128,7 +128,7 @@ PROTO_RE="[a-z][a-z+]*://"
 GIT_RE="\(^\($PROTO_RE\)\?\)\($USER_RE@\)\?\([^:/]*\)[:/]\(.*\)"
 REMOTE_URL=${REMOTE_URL%.git}
 REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\5#")
-REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#git://\4/\5#")
+REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#https://\4/\5#")
 
 if [ -z "$BRANCH" ]; then
 	BRANCH=$(git branch | grep -e "^\* " | cut -d' ' -f2)
-- 
2.25.1


