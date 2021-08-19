Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.74546.1629400125975184164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GBVVJNZR;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id n27so9939118oij.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TvrIPk+utzHwGSnkmzvh+ioUX9loJPJ34qmR9eutnjw=;
        b=GBVVJNZRTWdxEFInyddToY/mAAVhW/lR63aJ43vsuIXcfK1iczfHMROIkUuGQnj5Fn
         US6UCBBylZ1qnDzxSX0D9fZwrlc/L4EvTGpzi7rapoLty4VlL2EXCaSoVTuvukAZs0QZ
         mqv5dm4VOh43gQgkLPS6rMARad7Mu0IQclgw+B7kJsplm3LahQ3By+kxqVsbAlItf+o5
         yQ61EvX/6FUwGni9r+vM+w6rAqPd+xFzKAX/0YiNtbeT2ltZqA5BYLGXukAF0svxxdx3
         NJP8cDkW7IR79Y8h/NzVjz0/KgKm+RMrskaqLeB5CJTWy96Q6xUAH/1TZQvwpW0+icDy
         DN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvrIPk+utzHwGSnkmzvh+ioUX9loJPJ34qmR9eutnjw=;
        b=Wr18DzkvuvEliuYuLaYO/5G4cjW1JjfryTfJF38fdp02FCLr903SPYIXHzwUp2TUe2
         JHf7zEjytc6FRTUZwJZ7ToYF8fN5HBdhUMa1So8EJYTeSXXjXFJxkhAxNeUHHfJ2Ijya
         tYIubaohz2oDO+8d6m0t9O8qTwFjKDQtYlsN2fN7ieEUcZ0IS5N0ynEE0VNI+NT6mX4o
         nLYJnc32DNOkvSAIM2qG6MWM2wzuIrVJZ1CsHvFDYu8l+pJsByVLOllTOW6lH4O6JiCt
         FSJmtQm9F0ONGiTOuxWFo9qEK2DvSEL95sLvI53/CqK4qCIoNi1wgvkzaz6OcqRBdfd6
         CDfw==
X-Gm-Message-State: AOAM5325nb9wMPuUygrTe/MRiX3n2xws6GpfgiSl85pmGVLsX4P7/s2X
	4553ZkbwYkCtUcHZdNJQlh9s/w5NVbo4+2Jj
X-Google-Smtp-Source: ABdhPJyScwVD2J12FkFWYZZkdI+M+U+qlMpcOKUfVPWcYk+jY4GNo+vnAXj7Urv8QY7u5gr5kqbbnQ==
X-Received: by 2002:aca:2419:: with SMTP id n25mr196964oic.90.1629400124954;
        Thu, 19 Aug 2021 12:08:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.08.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:08:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] oeqa/runtime/cases: make date.DateTest.test_date more reliable
Date: Thu, 19 Aug 2021 09:07:54 -1000
Message-Id: <fd5387e8707e12b5c442bbe745c50a3e27085d02.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The test uses the broken out time and can only handle about 59s of delay,
use a UNIX timestamp to allow for up to a 300s delay.

[YOCTO #14463]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b705e9373acd4119da75af4eb96ec92cc964aa86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/date.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index e14322911d..bd6537400e 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -28,14 +28,13 @@ class DateTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
         oldDate = output
 
-        sampleDate = '"2016-08-09 10:00:00"'
-        (status, output) = self.target.run("date -s %s" % sampleDate)
+        sampleTimestamp = 1488800000
+        (status, output) = self.target.run("date -s @%d" % sampleTimestamp)
         self.assertEqual(status, 0, msg='Date set failed, output: %s' % output)
 
-        (status, output) = self.target.run("date -R")
-        p = re.match('Tue, 09 Aug 2016 10:00:.. \+0000', output)
+        (status, output) = self.target.run('date +"%s"')
         msg = 'The date was not set correctly, output: %s' % output
-        self.assertTrue(p, msg=msg)
+        self.assertTrue(int(output) - sampleTimestamp < 300, msg=msg)
 
         (status, output) = self.target.run('date -s "%s"' % oldDate)
         msg = 'Failed to reset date, output: %s' % output
-- 
2.25.1

