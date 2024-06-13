Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56749C27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.9681.1718288452016696777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=upuGtHrj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6c5a6151ff8so790147a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288451; x=1718893251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1q9tukFDires2N/hk4Wi4LkTl4gQgWqutcUS7/1Jls=;
        b=upuGtHrjHJTGHPliRAzNkgZp7/OCmn5iwyB9IXBu+w0n1YCKOO18jxoCew/CUOaHnf
         rCjltuvwserEKMnmA7zqrqWy/4L303nHFvrivJ2/d342p3CserSsYp/CGvrg6XthvhMj
         cYTgCy+FFAubQGKIn1wSpy5gBohzGDTpE1U5ekRHtW7MeS4xVjVrirmnkRdwCzMPCo1Y
         jCOqR4xbw412Iuuf1rLJTqOh5L8NQ1/CvnJsSzQNAs0xnnjmRt44fzfUl3dtSE7/KJao
         YiN9egglpekqKj8blzp7p8NHUZbiGosw2bXWb1cyKbehn7/ignJjzHg+dLHTM0wj57Zx
         VD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288451; x=1718893251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1q9tukFDires2N/hk4Wi4LkTl4gQgWqutcUS7/1Jls=;
        b=qZAsE0+6NifHyCNCDUrxe797Un0pUhTMU+ycuNWN626PznSwJV5QZrGGnBXQZju1vI
         +vJOXvPNpvSO25sviChc7m97qPCgiZRlpcJFs14vISYRstMJD5yVM15PKROolR6go/O3
         NiPdMWn6Y2sFkgCFPA7EIJwUYdSw9k4tiBphyqVUozDrk6RuJ2pDxLIwSdzPktdyGFP4
         sD3aTLRwcBUBxHBETR+2xMaMFlJrXx+FZSWLV4NU1k+M7T9t/0VgmfifrsRFzGooZkQu
         bY0YonsDmuBS5Vn2+16FO/QtUqhMbWL2qOHxwkRuJ6dm8t7vn19VHVVXN2OIRHRgd4zY
         Od3g==
X-Gm-Message-State: AOJu0YxNF8R8ubsBEMBkM6HmZxzLglB8LDCx/BtZBaV0TvZBxU+LA5mT
	oG/cNFm1yUTtywNZeVysbsW+n1ezzdzsKf8u3Uwzb97SFj8hAiOdWQt7CbtEg+XjxK0ay3Ch8Ol
	T
X-Google-Smtp-Source: AGHT+IF2y/oWxlPVZPRqOh+kC5m9+upslcvIWMJB1pD6T71s9MOYdFqErhf4FbM/uA8EWed9oCcE1g==
X-Received: by 2002:a17:903:8cc:b0:1f4:620b:6a27 with SMTP id d9443c01a7336-1f83b626511mr55470975ad.13.1718288451291;
        Thu, 13 Jun 2024 07:20:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/29] base-files: profile: fix error sh: 1: unknown operand
Date: Thu, 13 Jun 2024 07:20:13 -0700
Message-Id: <7ef2c9ab669785e5e073d6f925f1a3f447fc31d9.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200611

From: Felix Nilsson <felixn@axis.com>

Handle errors when SHLVL isn't set.

Signed-off-by: Felix Nilsson <felixn@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5df53fcfe3b70a5312fced3fcc1ba6290f2ee794)
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index bded3757cc..5e8393c91c 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -58,7 +58,7 @@ resize() {
 	fi
 	# only do this for /dev/tty[A-z] which are typically
 	# serial ports
-	if [ $FIRSTTIMESETUP -eq 1 -a $SHLVL -eq 1 ] ; then
+	if [ $FIRSTTIMESETUP -eq 1 -a ${SHLVL:-1} -eq 1 ] ; then
 		case $(tty 2>/dev/null) in
 			/dev/tty[A-z]*) resize >/dev/null;;
 		esac
-- 
2.34.1


