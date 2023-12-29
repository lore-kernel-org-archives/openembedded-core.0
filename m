Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1E3C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.151054.1703864779387687919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QkKcbSee;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d426ad4433so24168345ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864778; x=1704469578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCm3dpnyWiWC8VzeqmEGDcgoYFs///YTL5GEheKd004=;
        b=QkKcbSeemmLvmkzo8ThxfYtWiZSBbsLxN/9g/cb6tvr3+A3nCD6gAveozu6/mc8IHX
         f42Q0NpHOgxtZoVuY2CPeGQlyGmyOCx9yD0kiV4GzpCGfPI/MuRYESyg31iCFNKzsbqH
         XlfZ+Fu9ybuPf2cW5G68AhasF7lmfpt8XaOLcxhA8wn11AaTZsr44zBBsEzZBWJcNqec
         OkMEaQ9Lv6goZ+4xsHMB9YCnfL91Vnuc0B9+14q/cq3KMm39On9OxnV/KK9Y0xeYNag0
         IUueJ5d3r0Out3FLIeOJKH/SvGAkYfof1OypOtMwdPl/dtRYUPDwuLOrHx57ld0z5ihB
         vjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864778; x=1704469578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCm3dpnyWiWC8VzeqmEGDcgoYFs///YTL5GEheKd004=;
        b=RZV9MNfykPiv9i+NZJc/rcz5za19IVEAxMh6IpNridG/wtVdxW09/3ZFeT8X3W+gjc
         6DKcNpP7cY5iNB4mmQB7s06dI0gMrMlo8EvKdDtSW3syxo5GTIxk8QhuzJPgxY5Ny8AR
         c2zAyAY5urgzQ6CRI4o4rmKQBVHQEA8rkafLRjacw4VKXT+vnw553xPTASheMYFCi3gv
         SjNY0DKxCXPE6JOw1NYJMHefIeL+e2Ne8yJHBaJWX3eAbR6kNTbt/wZ4OSFke1I5Z4eD
         E9KyxAZ9+uk8x2NYeiKpfBVfCZE+CSYWWRLbY/RpEqLCvGjTSWJ9MszxLXAGxyaVYlat
         Mxvg==
X-Gm-Message-State: AOJu0Yx5jk5fMVMgKNw8HeMpofuM9f6KLITF9h5baU6hQq9V4oGuE2rE
	tiJzKGHEY5okitSgTYEpYOZKC9w96N41XnVB0rTmyAhcYFmhQA==
X-Google-Smtp-Source: AGHT+IFo8AOuxjAPFBygf9X50FmNLX5mjRQjbJqLUZW5r/M3pU59+x6hFbfnAGRX+Uo3ixZdliM2XQ==
X-Received: by 2002:a17:902:82c5:b0:1d4:11a8:a2cc with SMTP id u5-20020a17090282c500b001d411a8a2ccmr5079955plz.19.1703864778192;
        Fri, 29 Dec 2023 07:46:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 40/41] tcl: skip timing-dependent tests in run-ptest
Date: Fri, 29 Dec 2023 05:44:54 -1000
Message-Id: <bd9070fbf4942d412099b4a0a8d199f9d63e33e3.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193057

From: Ross Burton <ross.burton@arm.com>

There are several tests in the test suite which are very dependent on
timing and fail on a loaded host system, so skip them.

[ YOCTO #14825 #14882 #15081 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 68beb4f4b5a0bea5d431decddf7656f18ac7a04a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 5b9127784e..51e1e4aa7b 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -3,7 +3,11 @@
 # clock.test needs a timezone to be set
 export TZ="Europe/London"
 export TCL_LIBRARY=library
-SKIPPED_TESTS=
+
+# Some tests are overly strict with timings and fail on loaded systems.
+# See bugs #14825 #14882 #15081.
+SKIPPED_TESTS='cmdMZ-6.6 exit-1.* socket-* socket_inet-*'
+
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
     grep -q -F -e "Files with failing tests:" -e "Test files exiting with errors:" $i.log
-- 
2.34.1


