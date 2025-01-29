Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06175C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:28 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.19286.1738173921982579192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xtwI6gqg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b1f05caso126966285ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173921; x=1738778721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdQfDkkAg3oBK6N7aOlRAd6ou62y/IN9uco9E+Dpgfs=;
        b=xtwI6gqgjHEV8SonIOfFRbt7n6i5aetDe3/dGkCy5dWoQHnsW+YyADjADNjnnVIUNE
         ESOlHn0XYx5QyIkHwetqQ4yt3EzUt5qwVDZEPsGgGghbqhBx1AxYKLAJ97uYu685T1Kr
         Z3oXpZ1lN4/VPTIwVTM7A2ezTvpoNhBmBl36RBZNlY6SJemk0DQ8dhytsakTYk+Qmoyg
         BM6XGXNocLqYTZw2CWFfVGKVQA7JNn0A7zkG0eMwXUOB3Tb1tWuWJQW1Qv9nRc/8vThy
         rB0Q6Va3fSBNZteSPSE9tVxitdX3iDTfZvkSkrCIircUYWzYCuk9/0N4a1r0u7mCAYGh
         Su2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173921; x=1738778721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdQfDkkAg3oBK6N7aOlRAd6ou62y/IN9uco9E+Dpgfs=;
        b=oBxcn9T3sHalqoSgjsKhdG5U5vCoyTS8pUm0/wUT6M7oJePRl8AtS7JMJIzab0L6J8
         h4rAy5rYGIO9aIDTTBKHaEShniUcTRjTr2Rhg5el2iCqNdGkyXfF2mByDtBBTQAW+58N
         M4qJi2kbmTUgHSb0EBt5IDXApPZj9veAph/OKbWtVa7vhJwcgdPvRCAYbxDYmdRTaXUP
         UTGRvSfI2mxSmGgkluJ6Axt5C7I8KsH2lLooBZDK6w2klf8KE4hHD8Lidp1ZK+CD98rS
         r0rvTICqInc8JlD8sMzeDd7H47Y10b3Vpp3AsgriBp/cj6T7lZrt5nxwouO1oop31q9W
         f/YA==
X-Gm-Message-State: AOJu0YwEt30GHgXgENxCFv3baqh2Ww64yO4fup904xytPiPxDyFDRGSO
	q/q0Tx92FKPTe4EE1BqUcnX3yjUA9VNTGVXTsRrKLwpGfR+FbeoO18PChhaSnUAB1JdRbsG8sBp
	c5oo=
X-Gm-Gg: ASbGncuZGH+ra1A2f7IUhp0IlO8v6HWTv1WXkGFPmT4a2vXA1m6Vql5Xd+HExSnWTjl
	edbjtoVheN0yzOtzHlxFIq8ZPM4egQ08JpA6FjTqLjNXmku/djdru0CAyUHSHGpEyCbMrlkvDWn
	qHPcKApM+1RQihAEGrCkS3u+WBea2J7f5fX+9RXJz0vxPgCq8yDY0m4bZ/zDyOoGGUTJhCucBgZ
	w8r0FuyRd4Y4X0mjLQuutgsyBPe0QQjMwkjzYgWj3thsKkE1W8ojSq8GVDDE68mzz+AB+dmK4rM
	kcSb
X-Google-Smtp-Source: AGHT+IGCMNZGXYVbgUJ0B6TDJHdmJBsvVXVs+RoF6UEjgHZ6JLOcO4cq3Rq1L6ykWlg9KNkJQMwrCQ==
X-Received: by 2002:a05:6a21:3416:b0:1e1:afa9:d39b with SMTP id adf61e73a8af0-1ed7a5a5102mr7510469637.7.1738173919730;
        Wed, 29 Jan 2025 10:05:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 7/8] oe-selftest: devtool ide-sdk use modify debug-build
Date: Wed, 29 Jan 2025 10:04:56 -0800
Message-ID: <c15220660b3c61f88a34cbc193afd875e5026704.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738173760.git.steve@sakoman.com>
References: <cover.1738173760.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210402

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8e709944a8..a89f9edda3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2533,7 +2533,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
 
-        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir))
+        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir))
         self.assertExists(os.path.join(tempdir, build_file),
                           'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf',
-- 
2.43.0


