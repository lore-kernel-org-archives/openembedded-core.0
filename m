Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB139C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 14:06:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150848.1783346770230251409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 07:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bR08LR91;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c83474ddso28269275e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 07:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783346768; x=1783951568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1Do3UufrJyjDYIOS28G3XZVL4NCdxG4P1M32A78PIY=;
        b=bR08LR911n8CTbkrRTmybt6Pq2lWINc+jtIVdar9D8RRmHFGz96MxdXrgg0HE1s5qg
         P71amnhWQfGw2p8Dx87AOg/ATtA5TX4MWo7Fxg7QJL0RrV90b6l8BIexss9NWwUOXMqr
         ZBD4uZSRvXyALW0Zk2mvmics+648ajfFOyv+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346768; x=1783951568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t1Do3UufrJyjDYIOS28G3XZVL4NCdxG4P1M32A78PIY=;
        b=QrN2FDrwRcrRHNwcoVcogoUJUBgTpuq5i8ryn4OsgV4HIKFguHRdTUU2+N948H3pgW
         P75ZtJyyIU0p/ojrDsUpaSinyNmF51fQWzk75hDfwbLiJRwVovvYPLXN4a1xbAv7rxe4
         FtnoHk9AMUaJ08xGdxHCvebsD0I5NE6mzutT7e+uZ/SSMkr5AmYWJcULKpEqRrTCE3dY
         +KIEe2kMsZpmUsCAGzOZoxhn4HzTmeFwD4wWSpboUfFCPAmIbH9dsEgYJd95DBSZV53T
         ZGjpu/Tn3gIb431qVuaGpcdGKWInKSy5am/KHhZSCQFqbw4aT2Y6mFy6p93/mJ9wyAHi
         kCdQ==
X-Gm-Message-State: AOJu0YytmVKZMKtx94RB1ffFmnLAEzl65JXWBMXTrUiAGBoTcOZDDNGs
	KQchtw8u0MZcxdkK4Bx3+FDkeIZBuJcMuXXKMB5xpMPB3OtAFVeFKWLjXRksNcWmB4siMTlo9o7
	7J2JZiDo=
X-Gm-Gg: AfdE7cl6x1FT1f70zDpqY5h2VwKb9oqrgwOLBcFtMIbe821YAzgacyscC9m+P/Oq5y4
	xL5s8fA+iA6s8GvcFJg+v0hoFnXijQEYtCJzl5Ew5UZF5B48Bpt7My92cZdcjeC5NahKLirLpAM
	N4XkDtJ8qUJiUE3rIiFN+cxY4P+0rNdYZqMOyn2wDVLIGAm9YL/eJyeSZQlqYZ5YjORO589KVRq
	Fhg0r6RzEjJy+BdxdyGe0/EWQ/JVjP20XYWM+yM3ywOIIOJcMpi64531m7Q1viXBgvg4AdLxfTd
	4YIQXUKD0MZFZDf0kDMEoZN3rDndGwh14H9y7nim2UW+OAc3UM/DtUmiCeLiukJpnJhg/PgTYP9
	ziTUrrsv+DP/U09M2haA38ILt+pYseN3r1hjvijJaQmY/pYIhdpESpFJY7R94A1sCHq6pSSts50
	o2JuHeEgx9yKcEWcC1KhANIhyscM+tZOjE8OA0z+c8oA==
X-Received: by 2002:a05:600c:8010:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493df0a6fbfmr6468805e9.39.1783346768271;
        Mon, 06 Jul 2026 07:06:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm426975175e9.15.2026.07.06.07.06.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:06:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] staging: Fix vardepsexclude
Date: Mon,  6 Jul 2026 15:06:05 +0100
Message-ID: <20260706140606.1021674-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240273

Set staging_populate_sysroot_dir vardepsexclude correctly (which does reference the variables)
and remove the incorrect pieces from extend_recipe_sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/staging.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 7494b8ba1bb..f0b3c6eedc4 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -247,6 +247,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
     for p in sorted(postinsts):
         bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output([p], stderr=subprocess.STDOUT)))
+staging_populate_sysroot_dir[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS BUILD_ARCH"
 
 #
 # Manifests here are complicated. The main sysroot area has the unpacked sstate
@@ -643,7 +644,7 @@ python extend_recipe_sysroot() {
 
     bb.utils.unlockfile(lock)
 }
-extend_recipe_sysroot[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA SSTATETASKS"
+extend_recipe_sysroot[vardepsexclude] += "BB_TASKDEPDATA SSTATETASKS"
 
 do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
 python do_prepare_recipe_sysroot () {

