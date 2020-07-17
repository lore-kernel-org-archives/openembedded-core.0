Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.12656.1594996694396403131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bX+kcl3U;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id k5so6448322pjg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Nqd+ffBap+OBI0pi7s+IPntUSLpbX5ilHnN8WortYIc=;
        b=bX+kcl3UjuF1BA4OXgX62wyDe5inpdWt7aKsxsCyfsrnOuF77CKsFRQf35j1IXEW46
         Qbua0xUeMxl4K7wbXdH/8iIUbtOSGLBcFM+U2Ak4yp5RHooVHtMFFaKqRhLbHiAHyDzc
         Y1qpRhKEssu/3FK31JrM1V3ZNajjGBtp+vnHG0E5WgeZ6SB2mQrFSLV5sOe37c7WNdOi
         F1pd/DWov/ZgVMfG2cXzMlBTR/7N0QomUrHbljCGsfLgOSf3m6QQchQTa5DSTcL3Ue4N
         Cwn4qXVYMYMtSwm0qyJSahkZc4daM8Au7guWWnN+5X783WVxFD9hF4c8RCmq7KsZ8IN1
         MhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Nqd+ffBap+OBI0pi7s+IPntUSLpbX5ilHnN8WortYIc=;
        b=fVhMo/XWjgx+/HM4lTpZj+jgJP5bwSNBMesiAAluSlmM7SIHChBpeXwV9xOfT9ZlAo
         aTSByuiMaW8j6050HjMcWqRplqYQgYO8i26JOVElvi0SxdTSiPe6aHxIaWrQYCqzn/Yu
         WiHIOGGhGgzLmpq6LmvHmGzCT69ZdZ4284CVzGTgl/eYMF9gPpjw6FofBLCjArnjtgvr
         E5grgjtzj3nAG0XCcpZK7mXfN97PW8TS49zIDizW73WjUODFIIBh7t9HGKPDOhZbyFNy
         WUS1hsVYqC+f/rnBuieO0N/qRWuYk46uE0xuQo++GrbaJWaxOVo5uzpduQzgMlm82CWc
         rnsA==
X-Gm-Message-State: AOAM533GWHBE8xUc1WCzvIUa4o/JgOTdevokIu4o3TDzKXoSJW2tB946
	cxC8spVjoxxKX127rLPdCGqrwPlQ1Fg=
X-Google-Smtp-Source: ABdhPJy0Ug6su6WSoRysQi+v/a9WZMm06Ryz/o+w3VA22j0UD2Av1mRczjW5wQHHuJ+b0I9EhJ7P7g==
X-Received: by 2002:a17:90a:f014:: with SMTP id bt20mr10446159pjb.135.1594996693468;
        Fri, 17 Jul 2020 07:38:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/20] oeqa/selftest/sstatetests: Avoid polluting DL_DIR
Date: Fri, 17 Jul 2020 04:37:11 -1000
Message-Id: <3f2971c2fa94970057cd4260aa1147a165d70fa9.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Every selftest run is currently polluting the autobuilder DL_DIR. Avoid
this by using a temporary directory for the test which is cleaned up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 002d321e02b3ce4f34c8a54211b109a5416c8a0e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 9adb511960..c46e8ba489 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -19,10 +19,13 @@ class SStateTests(SStateBase):
         # Test that a git repository which changes is correctly handled by SRCREV = ${AUTOREV}
         # when PV does not contain SRCPV
 
-        tempdir = tempfile.mkdtemp(prefix='oeqa')
+        tempdir = tempfile.mkdtemp(prefix='sstate_autorev')
+        tempdldir = tempfile.mkdtemp(prefix='sstate_autorev_dldir')
         self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(tempdldir)
         create_temp_layer(tempdir, 'selftestrecipetool')
         self.add_command_to_tearDown('bitbake-layers remove-layer %s' % tempdir)
+        self.append_config("DL_DIR = \"%s\"" % tempdldir)
         runCmd('bitbake-layers add-layer %s' % tempdir)
 
         # Use dbus-wait as a local git repo we can add a commit between two builds in
-- 
2.17.1

