Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5BEE64037
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.10491.1732226095188869780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RKbK5fqd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724d23df764so861564b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226094; x=1732830894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLmXigqoI58DgK7XiIz0/VNXT9LZFROAqvxI19JHSb8=;
        b=RKbK5fqdESgsPy7oMb8wjmEg+YJcJ1leRcK3AY0mkx3YUVSv8ggkxzKKHE92s/eNtc
         6CBC2oj7K1i+lWTclXD72Twn7Yc7RqP2IMRc8gMMFR7L+DLoK56wEjN5fC5rNK0yeOJR
         GbpZbYfk5ueWo6etQQ0nh/t0ycSGDwmGNn3X3MFSYxzO0wqeXSdPksooBHiq2rw+o/r7
         MbZHS2ijl3AEUMVAlektshWMdpSni3G+9JumwJAr68nDHA9k+RYPZPVrfUjkMDWVAB+A
         5NtA7lOqeB5f/RAzzZu94f/+IBX4rRAgyrmjifsFidGc+51l3MvOBIFhrmy6v84Arhb2
         /iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226094; x=1732830894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLmXigqoI58DgK7XiIz0/VNXT9LZFROAqvxI19JHSb8=;
        b=uMlz8rgGTn+D7MCVzxtEwjnrH6QoaPr1r7ZwZJpgCEhDh6doVtWAsdLCurSkl7khrv
         0YPvOcjwqrHwZZe/DoeWLqhc1YNav/GG7OWuis8oSiR7FqkkZp22OH4zRj+PDOxonOAx
         HeCSQcRF+zffjMr9gpgYvZ7A9POhg1ULQf2TCLXS1h32tf1OBmL4NeTkIWE8lJPBbfXK
         0bkFBwNbNgXLKM9lGcjCWfX8TALG1DmaTrn4GjhTpiwe4saN1z7tLNKLroTw05DtJjW2
         OZBTiRa2+c6AxNPIPDvv3SD5r5nkY8NXSjy2fGM+ST0L9Jxmlu4FOw8yNfE9wH0RT0Kj
         k4fA==
X-Gm-Message-State: AOJu0YzrmZ0Wx7mrLT8qcTUxH0AwtUP5SGj9aN38hTNiVePLjHu6kwfK
	MfzA0l0KPZCDU+p6X+rlAlsuf4BuuWgYtKIMu/wLKx7Qb/KQGHD1bAqsmM6/MM/cfJzvQkm6dRk
	L
X-Gm-Gg: ASbGnctcWNBNh3e/s3Aw1pdQAOSjnFUwN6ECTpcxGDtztGT2869Z+EQJ/Tc3ClV8jxq
	SfyDmbFN4m6OTwodFCS9xq0uU+0tF68iF+ygVJq0asyFA5nwbf6flKzzpOji0RTR3Ro36AA5rmW
	tv/MnJAmmHitYnOzdQU/XWquki+xUSgV/uqR0M/g/fpiMv+qdLxzis2urmEEz3WBZi0I2V4R+lK
	5seZ7WTuAOhbTrGDAAqZ+51q9fUCRROikF1ZZs=
X-Google-Smtp-Source: AGHT+IFMzqorGOiaV9AVRMOPt045qQ/KJtjuMhlNBZVeJYUeW7sFp4GRbekSmSITgb1yNvEkWBI3tw==
X-Received: by 2002:a05:6a00:23cc:b0:71e:76ac:4fc4 with SMTP id d2e1a72fcca58-724df6a2926mr722423b3a.21.1732226094293;
        Thu, 21 Nov 2024 13:54:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/27] tcl: skip io-13.6 test case
Date: Thu, 21 Nov 2024 13:54:12 -0800
Message-Id: <12e7c110d14156cd1e6284a79a9d16feac3b4059.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207577

From: Ross Burton <ross.burton@arm.com>

---- Result was:
{abcdefghj
01234} 0
---- Result should have been (exact matching):
{abcdefghj
} 1 01234 0
==== io-13.6 FAILED

This test is documented as failing on slow machines, so just skip it.

[ YOCTO #15407 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f69183586655294c9aed6687cebe57767c2f3eb8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index a403a74bb6..c485e535c7 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -15,6 +15,8 @@ SKIP="$SKIP cmdMZ-6.6"
 SKIP="$SKIP exit-1.\*"
 # 15407 15421
 SKIP="$SKIP \*io-46.1"
+# io-13.6 explicitly says it can fail on slow/loaded machines
+SKIP="$SKIP io-13.6"
 # 14825
 SKIP="$SKIP socket-\* socket_inet-\*"
 
-- 
2.34.1


