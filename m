Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.5370.1594244289543463926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gb2eg//2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id l2so4673374wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 14:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkcISeBrf3XXoYsHGdMSgGlSW/L5mhTxG4OqQ/omsl8=;
        b=gb2eg//2HBS6tlAsQF2XdTcgwWQhB8vjgddofcfcHcI2BIN74AsJfMrk0krT9G4TTO
         b2bY09AXWrfGcEu4XfPo7pbomA+91zgxiI0JSyn4qh0mwNpQ9miie0frtOQImWBePenX
         Wf53OyiTTfr3t0f5phXVNizZd8Cz/GGOMl3gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkcISeBrf3XXoYsHGdMSgGlSW/L5mhTxG4OqQ/omsl8=;
        b=FEFdR7yRLyGMlYEWiJL/e0VUyCDc4u7NSL7SJod0cbPJWmFD5y4rRNqXjUguuJVgLe
         mw2W0OupkURvFCwD3eUFC57eu+R6ZdwfeDLz03POUEdYFO0IAXrL8Z64jrLeHJ7p0YNf
         /rbaepp99P+JjDNQYjp/aHlZFpUJEThvp9H3R3oA1QK9bB7ZXii0hoAwa3G957q703nu
         xv/DPJnkhf7bmO/gWTEvWBZc111DeI2/VvAHnxYEOQj8jPk6AU2p33lvQjxBADdCSLRt
         U88jHKwuUZZi48+tb+0aQBKEdznfOK+0QX8modqsyArEgkgjgLug9fOHOcwSOSuMDXeU
         Imkg==
X-Gm-Message-State: AOAM532kS97ZOynxvDxOQXpp26DsDkS+sDXw50LucipfD9dTQDA9eESn
	8jgxv1eioFQL8Zl+dOiedMN4SRhi9E1CtQ==
X-Google-Smtp-Source: ABdhPJz5ruNQsRvZaHRXnu5uFBzQBVRlu6Zlvvf/cE8cFLfJvvEbCVE1LAB+fR84LU4P3EU3/wl5qA==
X-Received: by 2002:a1c:4086:: with SMTP id n128mr11638335wma.118.1594244287542;
        Wed, 08 Jul 2020 14:38:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l18sm1983269wrm.52.2020.07.08.14.38.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 14:38:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/sstatetests: Avoid polluting DL_DIR
Date: Wed,  8 Jul 2020 22:38:06 +0100
Message-Id: <20200708213806.394735-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every selftest run is currently polluting the autobuilder DL_DIR. Avoid
this by using a temporary directory for the test which is cleaned up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 9adb511960c..c46e8ba489a 100644
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
2.25.1

