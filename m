Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C48BE77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.25346.1733345130417489007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hE1J9BRm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215c4000c20so1817515ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345130; x=1733949930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRmqhV12aGtbcjX6yLuyWKV1o/1xDElWtBMeI8HgRkI=;
        b=hE1J9BRm2XuUrpEQcZTbS5mGOsNtDZDecqh4GklF8ewSnuW7IWdVmZS5w0bjjIAh4T
         nw5mPHdhDDHtHaqfMRp0HVf7N8oCGZKFRczfTKptXhqZwAKxzpoIgon6ohoNPYAsozMF
         kP5ssW3u0bnpEgPb1GQyFXfPqjofkyOe609ij1iWwP5kx6ZG4DQjja3IdFskTnoCtoXs
         wFy1DGF8uEvI00SQEMqOu77Wryn6gb65YZ5ECjclw8Wr1WN1E1wxnOFiW5ypk46XnVDC
         meWFzJYOBHRNSxZKdS/HFoeJpV4wOROl9LtTafZEzkTKSDcJnTaIkTmv+JQgr6w9W1TP
         hKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345130; x=1733949930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRmqhV12aGtbcjX6yLuyWKV1o/1xDElWtBMeI8HgRkI=;
        b=PpwxPajncBalGkDKKQiAjyvvqBO1mmF5KJIxRzYWs9Xdz74FBZnnMVmb84WKHMi6pv
         Xv5NofyFRPTvwZavRqGF53ffTW1M1znkNAGq0wIDJm++zPrOD1Xcvv/rNG5dH/YwRD/5
         E3YhhY2mEzmsTvZXig+cmYcriENpeb8l40mpfU8h4tq9/yLEK/mBkQXJprAyz12JDQT/
         Snb+0u3xgmo5pGk7pZfwJQZLILx8I/uBlhMD7CJBn5BwHynF+aJmqFObNZ2GmubDwqYU
         EdaheWS6QtCg1nhphxDfnSg5ucMpT2p2xS8ZacHIK9yttQ1NdUGikYz1ARM5G+GS9xKg
         w2/Q==
X-Gm-Message-State: AOJu0YzupiWqkRawVrMVPuMeZ67PeUPr4yzEIzorB4iS3eBwwK/nBTFj
	cnv2UB9zBPaw5pxI3SDla5VssUSmo+dSLZCAyOZ5dyeXzpZJEjaebZhVPadA09qNlZv3rBHKf+u
	i
X-Gm-Gg: ASbGncuiO8chaFOJZU3jeUeld8Pe/F8o/zD5jTUeLdTi2xqAABZhqCLOVGo1/SvQaE7
	GNd5JvqCStOASx0LvLxXFUAVVTaYeQsm5/0XQ3rwHImFeKr51DzMxHhj4hq9dluwhVuNJFHZXnz
	/NYr4FeHHjFHLe80pABSnaF9TN4ZsOhs5sPlOjF4oDVv5yaI5KFJnDmtUpQD0BVi4fLiazL8X12
	zekJuDEJIfBHjBx8m6kCiWDEkuHKvC9ntrGokM=
X-Google-Smtp-Source: AGHT+IGkAjvr7zNilgO1saKNxY+hzqHDB9lOZPHrJSEn5S1fu99d40vAksZJpVQ1M5vzfNPRmV+IYg==
X-Received: by 2002:a17:902:ea04:b0:215:a18c:88fa with SMTP id d9443c01a7336-215bd251540mr124052155ad.38.1733345129757;
        Wed, 04 Dec 2024 12:45:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/14] rxvt-unicode.inc: disable the terminfo installation by setting TIC to :
Date: Wed,  4 Dec 2024 12:45:11 -0800
Message-Id: <571e50db36d2b4bac075d4025efbdfdb8548468b.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208346

From: Changqing Li <changqing.li@windriver.com>

Without this change, TIC is the native tic in recipe-sysroot-native.
By default, native tic has set its default terminfo path to native path:
${datadir}/terminfo; $HOME/.terminfo

When sstate cache is used, the cached native tic's terminfo path could
be a path not exist on current host, then native tic will try to install
terminfo to HOME dir, cause host contamination.

Disable the terminfo installation by setting TIC to :

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe35ead2c3135a18c346e7baa31d34b15c3e2d95)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 5193eebb0b..95757dbd01 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -28,7 +28,8 @@ EXTRA_OECONF = "--enable-xim \
 		--with-codesets=eu --enable-pointer-blank \
 		--enable-text-blink --enable-rxvt-scroll \
 		--enable-combining --disable-perl \
-		--with-x=${STAGING_DIR_HOST}${prefix}"
+		--with-x=${STAGING_DIR_HOST}${prefix} \
+		ac_cv_path_TIC=:"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
-- 
2.34.1


