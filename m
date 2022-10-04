Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D356C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:38 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.12450.1664898693854145693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cFXLmO/d;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id s206so13051827pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=U6uu7HH3x2Y7lzYtl64HHY03xcS4lo8+kApl/t6fJVk=;
        b=cFXLmO/dUuZwK4RlpnNFMUnKYVtPMmKxgs1QAE0ey1p2pKvc0YUDqBgaUebboCFgqj
         3hypwI5jvG9xg+pnglyvdhqm5ueo3YpZnfyjsyL/c/VzuYxCxPA1fciwTFS7PCJlru05
         JQwWqUTsSk96Jyf8TMAm6OFj5csbPaY+c7iMkU516bvUmTwC6ZcHcBLLbKs3pSCa2NvO
         QmAcZrjvYJyESjZQSq5RlOoyr4JPsE5BG063nkmIFB4OSNDd6R0FppLJ/3MNfcEi3q7m
         mEV7hD8AnTkibogvjrFePoloj0N+PUd0SNsLAKqOD1miOEcNilYwsFN1Vh3IFqg733yP
         N4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=U6uu7HH3x2Y7lzYtl64HHY03xcS4lo8+kApl/t6fJVk=;
        b=KdHG9OJXT6MLowFP9w23uOSR2Msip5beWyA5bKpPst3pvBwDLjrJrl9B8hKYwi49/C
         qgLYLp/ryOe0qNGjHh40sKbo3YT6ewk4vzIz3bIRS+mKRvy/AdkDvkseJWwqC4hNJJVA
         IBgNO2yuNXMh1HXc0Nf5UXdjizfV/rckJm1Aqu86ew5YSWlKa0wMO0/el+Imvxn8sQX6
         /aBR9OjZxaEnpIE5ITJme0gkoQfOyJaZCUbNO1cXxVG9odT9W5iwUu1SLidAYZDcd9mK
         HbpDlydfyfRIYJhC2F/ktNSZ8/ZiUadUAH8wKvOZKUi5/IFVVkzmpp4exv/is1ctQQED
         nFjg==
X-Gm-Message-State: ACrzQf3jsvwbba0StaOk+xAJnW7NbwdzQaO/0DXuWOUlV5xG6K91Akw9
	rGx2aNcKojEmyq3CVHtqiiRfhSGUoBYA2XY3
X-Google-Smtp-Source: 
 AMsMyM4OKZPknRpXSZU1DVqJSysEzOUnhBIzzl+FlHVDS6xwK7MNRDOEtUsmbLq+vsFVbYear3LcYQ==
X-Received: by 2002:a05:6a00:2387:b0:550:bd29:7d7 with SMTP id
 f7-20020a056a00238700b00550bd2907d7mr27913708pfc.17.1664898694635;
        Tue, 04 Oct 2022 08:51:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/18] create-pull-request: don't switch the git
 remote protocol to git://
Date: Tue,  4 Oct 2022 05:50:42 -1000
Message-Id: 
 <5aac691040502e6f578316dfc090643d341dd3cb.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171420

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


