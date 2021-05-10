Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.32427.1620657067337113616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CeNe0/zF;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id n184so15913347oia.12
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PIvXnS2FzI0CaSo3bGlgTdfBYe3nsmVRVWXf87lrbRY=;
        b=CeNe0/zFEhtgZINDM9TRV9RgjBEkREqxyFzwVZ7x8/MzhR7MaD4TVzi+oVoel7AMJq
         0S7VHJ/YbwKlMntKcrBWUvmG1UFaYf4hR3cwIQJP2f6Swto3FBMs4EMcBw844N9K+hBQ
         /+oDclqp7WpZzKGO7GfBRDtrA2cfa1u9lN85QVSbbfNY3aTKbMotz9dx3dDfBV6nJlxZ
         CikZ3uvSvLujMsOql/4qJsMD5ykKtmuHAPp3wPQ33ABpg+fMJGZCnk18gQtm2d0eyG51
         DXy3GCEQgWvNJ3mfov2oC6jpkKGtkTljr/4zJw33reiNQXeJkaFJRVda86GReu4038WT
         Uljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PIvXnS2FzI0CaSo3bGlgTdfBYe3nsmVRVWXf87lrbRY=;
        b=MtTasR2Z7u5OCOAGd2LK4z/p1yjJ1ekEXZLrkwwtZyQxZEKciaqSuVGWvM9P/VawRc
         fPyznB97JlAYbHoC9BzXQUvyMXLA5gu6jMbFfB0fgZeYwrfLspWqZM7FnpiPqawVKkA3
         2VBXwVSRFdeDeROg+aU/W8jWcyoAfPWNr1NiiqwX9CJLDU9PItXl7E17EwJ9kikH4X1f
         GwVdO14b9gHkE9soBgEjkhNIaPATbVMT6bnspaGGpNL+pF+SUMvsxtepu6JL2vo9mXO+
         8d7j9ZojWCpmMS26EU0IV+26yhcMP2LN9gjixNeChuy1NTUJnIzJq09IJDeNk/2GZ+oV
         FliQ==
X-Gm-Message-State: AOAM532HKRe4y8V6zv+E0+4fnznRj615c4H98H7OWntedlLCcjM/P/uo
	qT74Clkz40bh/YAn3f3geJ4slmV1AQb9rzRx62k=
X-Google-Smtp-Source: ABdhPJwbIls1J4qiLanULrF1cIZxL8+9pNLzR4Gm/FsPNNifMAWxA8pmhVhpShBSiJHJFQvh5mWp5g==
X-Received: by 2002:a54:4396:: with SMTP id u22mr25634537oiv.118.1620657066243;
        Mon, 10 May 2021 07:31:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/25] Revert "oeqa: Set LD_LIBRARY_PATH when executing native commands"
Date: Mon, 10 May 2021 04:28:58 -1000
Message-Id: <a150f6fba94518509ee80869ffbfb973c1283e3b.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

LD_LIBRARY_PATH leaks into host executables too, and breaks them
as they are not uninative-enabled. E.g. on ubuntu 18.04 trying
to run host bash with a sysroot that was built on Fedora 33:

akanavin@ubuntu1804-ty-3:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-24341/tmp/work/x86_64-linux/gnupg-native/2.3.1-r0/recipe-sysroot-native$ LD_LIBRARY_PATH=./usr/lib /bin/bash
/bin/bash: ./usr/lib/libtinfo.so.5: no version information available (required by /bin/bash)
/bin/bash: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./usr/lib/libtinfo.so.5)

This was seen e.g. here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2090/steps/14/logs/stdio

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e9850486b74a3de934527ca1077df001d3a8d22)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

