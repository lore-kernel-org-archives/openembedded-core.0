Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.37067.1598811480513718852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a2dSWyOt;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id y2so4715798ilp.7
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oJdiFbytqEhZ/LQTgDiICGsWRFIZHx/o/qT6zFKp8+o=;
        b=a2dSWyOtZlZjfjXZlXjoLpiiQatpcWP6Iqfs0pYhD+Vvyc5mb745zUhzg4ADpGKjUG
         5C47vNmW+axIO26NrYj1O9kucrb3RW/jx52bOysMRCfFLpt6GbngIzuPwOVfvV75qkkG
         yRE3KqlIPZj/zFqLOt9SwZknzXosfklk0Bk/VfrslyzRWxVgmazO27QUdT28m4jWbKUE
         U0jZTgTWx0GFyg+gBKyXz5TnBV1cj4Yj41hZn5RseL/r1xKPpRTwbz9bWbSPHxU4ndsd
         jhS2ryJ5gzY+hFtCnsFVsuF81eQcJcM1IUCEwOlFasc319iIxxfhkYQIENfNvqrUpJPr
         PHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oJdiFbytqEhZ/LQTgDiICGsWRFIZHx/o/qT6zFKp8+o=;
        b=ikFR0QjaiAp6Oh7dXBAz6ZmYT14k+5HkT8NLZ0YjUYurEL6hze9Z8Eh3ptGwRbcylI
         p4U5u19mYL474LbLp630o1iAmBqRWiMzZ6lMU/EBdK9mDeUGGHS+GtjYyAsmVFfJfTs/
         oPS35Ef5JF3yu+7gv5un3qDmcUrECNoC6wabuDTF3XYt18rRlsnGTmmBJ+1pMpBz/IB3
         n5UTrydERhizV7O9GTvGIuqehbOI0Q569IgQRpevWJYw5cxXfOXe8NPsvbmZc9BQTheH
         GgOGNSIT77xKbs99VbizDyrHeXpXQhuoFx6ezGuAPFX5+mpn5vK0MwA3NhZ/L/znvptm
         GbbQ==
X-Gm-Message-State: AOAM531/fwZt7hUdCBdYAkeNltS9wlgbvYxV0JzZNXErNtwpDtNVcchf
	V0rOzjFSqnbvDAG+mYqyvFXPArF0sASSw9HcVjk=
X-Google-Smtp-Source: ABdhPJw9CIa00dHdFTQWIhVD5Dy13c5LeEQFlUtlYt/I9wjdCYrRu4lXvbLx+GDiBsMD85kzKqaczg==
X-Received: by 2002:a92:7991:: with SMTP id u139mr5606184ilc.62.1598811479484;
        Sun, 30 Aug 2020 11:17:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.17.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:17:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/25] runqemu: Show an error for conflicting graphics options
Date: Sun, 30 Aug 2020 08:15:56 -1000
Message-Id: <e62c8207fa47ff4e325529ea84e0d51710deaa3c.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The autobuilder managed to pass the nographic option with "sdl gl" due
to a problem elsewhere. It would have been useful for runqemu to have
errored rather than passing conflicting options to qemu. Add an
error for this invalid usecase.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 377a6ffbcba0d3c5ede470c989756c4d1636873f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 398f0a0910..b24ac1c804 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -436,6 +436,10 @@ class BaseConfig(object):
             if arg in self.fstypes + self.vmtypes + self.wictypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
+                if ('sdl' in sys.argv):
+                    raise RunQemuError('Option nographic makes no sense alongside the sdl option.' % (arg))
+                if ('gtk' in sys.argv):
+                    raise RunQemuError('Option nographic makes no sense alongside the gtk option.' % (arg))
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
-- 
2.17.1

