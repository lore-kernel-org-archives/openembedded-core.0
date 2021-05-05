Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.10087.1620227990104955839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sktpafqH;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id b17so2543914ede.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QiQfT6lk5y1bltH6X4Jbjp9627/KlIGlztM4UzOjEfQ=;
        b=sktpafqHZ2zQEPHposKYMLucGfcL3tK425mjk1ZJVSOKkCQPjlSp60X4aqrRPtOQ9K
         2aaKEQODpot7D5uz9SQfWC+/uaKYJEyBlfhe2jA355hOGFMEFkuXFvBFhsIbJnA3uWab
         BYlAqFaCfI5AVDkDan+45WGt+2dnsSVkO1A8g1WPNOfIbyGCZtrdeD4o3Gtwd6/+GsNz
         ZkaRmzbR8VLASvzyFUuk6jwjRz3QDxe1I+IOYcOlR02kvlbPmnb6Nd4dCyH6WFeQWvan
         CSyAUuMatHfdpfFJSwWJQPcx1ifbtnJrQ6R/mSZBMv1Ae5OvSfS17xuGqvwrvF7yaBJI
         fgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QiQfT6lk5y1bltH6X4Jbjp9627/KlIGlztM4UzOjEfQ=;
        b=eFPYeoSCJFS1xBq6Yt10iBmcray3Oe5h7tYlv40GqfY17mFeXcDscPofDyjXao9Mf6
         /Phe7nXHV+5fGfWgUub1PIE13vkF/K7C0eG7tDvid7QLB4g0TcynfVM2TiRMW4evDsQ/
         mIuRh1WKDKHl61QKfWjbMBDdv35LuBEWkZ5Th1F/JgDFvWgreT1rjmz21f8fnBts7TTP
         eGpZCc/gOXnBSPAjZ/+4fuKOtjFxTEIX17iZ2baZD3iO957IRv7U7FKX2aitbUQg7HM7
         HdkbWX7uqMmcrnQJT8RYag9kG757BgN1KVa4/9h08Siatm93g+NW0gb/Cznl+TQF+Lsd
         gHSA==
X-Gm-Message-State: AOAM533oaCGah8c4K+ACqvCMbK8VFfbsrgQ7qQuTnL/IoKC40hC9j8Ik
	Kz7+L8CB7U6xKV2qd38t8nIqtVPzEh/t0g==
X-Google-Smtp-Source: ABdhPJwfSz8jfix1xp9PgD5BsJJ0ZwAgyhNRw21zEKQyImZws5VhlB1FIUtviP0YWPIrgjH2DkLNww==
X-Received: by 2002:a05:6402:351:: with SMTP id r17mr32995222edw.186.1620227988758;
        Wed, 05 May 2021 08:19:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:48 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 60/61] Revert "oeqa: Set LD_LIBRARY_PATH when executing native commands"
Date: Wed,  5 May 2021 17:18:49 +0200
Message-Id: <20210505151850.660512-60-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LD_LIBRARY_PATH leaks into host executables too, and breaks them
as they are not uninative-enabled. E.g. on ubuntu 18.04 trying
to run host bash with a sysroot that was built on Fedora 33:

akanavin@ubuntu1804-ty-3:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-24341/tmp/work/x86_64-linux/gnupg-native/2.3.1-r0/recipe-sysroot-native$ LD_LIBRARY_PATH=./usr/lib /bin/bash
/bin/bash: ./usr/lib/libtinfo.so.5: no version information available (required by /bin/bash)
/bin/bash: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./usr/lib/libtinfo.so.5)

This was seen e.g. here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2090/steps/14/logs/stdio
---
 meta/lib/oeqa/utils/commands.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index a71c16ab14..024261410e 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -174,11 +174,8 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
     if native_sysroot:
         extra_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
                       (native_sysroot, native_sysroot, native_sysroot)
-        extra_libpaths = "%s/lib:%s/usr/lib" % \
-                         (native_sysroot, native_sysroot)
         nenv = dict(options.get('env', os.environ))
         nenv['PATH'] = extra_paths + ':' + nenv.get('PATH', '')
-        nenv['LD_LIBRARY_PATH'] = extra_libpaths + ':' + nenv.get('LD_LIBRARY_PATH', '')
         options['env'] = nenv
 
     cmd = Command(command, timeout=timeout, output_log=output_log, **options)
-- 
2.31.1

