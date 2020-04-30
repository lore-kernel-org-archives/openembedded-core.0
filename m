Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.2180.1588285880474919715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iymIleFd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id r4so3626572pgg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tPgjDJvAzoPYtUCVG7afMENFTM9/1VBBLPFOoY72kSQ=;
        b=iymIleFdffbKtot7FncioXj1MgjOl+LMuwkWdJXw1ZhDX5CfUZuZGVOcadr9AIqvrb
         0xtgiNSoxmqigCJJET+ezc+bQy8VNswwj5sa86lEpqffCpGp6dmawHjirBYlIp3gBH5n
         NS79TQnljZY0OHRn63OPbL74UXI0V0DcjjDZiR1rTFaVgcFLOLi4Tfn3Wb9pxrgEwftS
         H/2idu3vJ1IUtkPY6mmCimU0yFqCXe4DdX8Z+7O96KlOP6jKLf+eUrSYI/1bvrmcFM7A
         /H2SEqgYfWffeJG12iN4fU/VjVrHq2rWFAHfJiVmgMCl7wuN3+3BLNyL6XADwGx2gstl
         daog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tPgjDJvAzoPYtUCVG7afMENFTM9/1VBBLPFOoY72kSQ=;
        b=UqWSYcZfePZ/qP341wEGGD/AASj+lIieCJx/v/BpHlK/sJYhZHvt0DkwDmxDcryJOu
         ohnyZ5FLq9Tfup9XtU5vR8sOngOJqT7pkIJiUMRsz0ymqAJs+HtuG6p8BMmhFqyCONg1
         ixhQgSgMAU9rj7k72qoN/2z3HqQFpwiGsm8vTW/ufrKIi7vDBR7gHE/UDbbG8GIksNLm
         UIQegLA+BJ4ZVZ5Hys2suOBcHCBnYdBJHvBrOmeU6a4F15xqxiTn8ZUf2Egpia65tPPj
         qIrP0neQaz8hJzT8pzlj3dGCcAZ4+AZmRY8AoVaKmLJ05G9ZmKFj5yhB6T5zFC36Xn/T
         5uVQ==
X-Gm-Message-State: AGi0PuaGFXbPHnzwKpthZRSkQSW1Js+HkEmAORaE2+rrx76BvfGKhp2r
	BCmQL3h/7m5UtzRXCa1cwXoEDXetWpHqFg==
X-Google-Smtp-Source: APiQypITJqH9TYwGH1Np3kZodkkHBSN+buorZDm7w4FKSKPQGp4oDWJZB8jsrwVoVt5DOwNTmxYZOw==
X-Received: by 2002:a63:65c1:: with SMTP id z184mr1243962pgb.316.1588285879441;
        Thu, 30 Apr 2020 15:31:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 14/14] parselogs.py: ignore pulseaudio startup warning messages
Date: Thu, 30 Apr 2020 12:30:19 -1000
Message-Id: <2cc3fac9cd1a0d77931c9e49dbe2941fa8619c51.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

If set default syslog to rsyslog, we can see below messages
in user.log,

[pulseaudio] authkey.c: Failed to open cookie file
[pulseaudio] authkey.c: Failed to load authentication key

They are only warnings when cookie file is not found. And
PulseAudio will create it if it doesn't exist.

refer:
https://wiki.archlinux.org/index.php/PulseAudio/Configuration
https://lists.freedesktop.org/archives/pulseaudio-discuss/2014-December/022719.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index f94387c8bc..a1791b5cca 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -58,7 +58,9 @@ common_errors = [
     "Failed to rename network interface",
     "Failed to process device, ignoring: Device or resource busy",
     "Cannot find a map file",
-    "[rdrand]: Initialization Failed"
+    "[rdrand]: Initialization Failed",
+    "[pulseaudio] authkey.c: Failed to open cookie file",
+    "[pulseaudio] authkey.c: Failed to load authentication key",
     ]
 
 video_related = [
-- 
2.17.1

