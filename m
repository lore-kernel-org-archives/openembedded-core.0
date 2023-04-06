Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E70BC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:03:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.162575.1680796988320831201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yOmn2uMT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id l14so26060020pfc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796987; x=1683388987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsFDWjkAPRhQrfr2klNHePAqg/0YKLYQcUvlS5pdx/Q=;
        b=yOmn2uMT/NynlA8vmECqvCo2bcoCbZMKxIOySp30YFs7leKbC3o9vOtU6UFwpQcC8u
         CwyDhY88zKna1Bm5hoZWwU1S482Lg4xk2mDW7lUFTydzb4/25wiAuKR+FMG6yGI6bTnk
         jSy39R3EebCu9x/O5jS4mpxgPkXNN/1nBSmXojXO4FDhbZ0TuMDVAAcdgsN77O8+c+Yr
         RNSxpGpddyR/s54o/jU9iMiezYmktMvxNILrC8ByZMBe5uNxq/bUZb+xQHZ9YNQwQf9z
         WHuFJVgCTZcfWF/KpMAU2NTs3+5CDIVOgUFPfD0B3SWVFsoJ8eRZr4G7TiRetjkcQXJ7
         30Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796987; x=1683388987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsFDWjkAPRhQrfr2klNHePAqg/0YKLYQcUvlS5pdx/Q=;
        b=YteF93pzwzlMDNh91+yxAE/mfZAlPnWTe4tlAcl8DZxDS+N+YtWdXTpO96zS1xC6GJ
         kC9TlaojeULFRAt1Iz2ZXxSlnRtIVDnC1WFgIwRbttrAaN+EOsLUsF3EsIxrfIegpg9Q
         X7AAHx+ji5h1GFhHIq699ID2hlEY4AoCT/1ZRKeRa22BWCSYNu6RL13I+MVQkA9NMY7J
         tiDiba1zmv9pSLwBfWd3kD/8q7uCjWbBv7jOW/C/OmLTv1u9iJu30yDCY5lw+84Ek/Jp
         +8ivfOMoPlS6Il5NrNDFrT/hPQjxOhtviaqka74yOblvXgyYTlmSgrXDE+A4WBr8czBR
         8VIw==
X-Gm-Message-State: AAQBX9dlAajiqUrj7OwqXmouWUO3/g7hVNs9wPYaKhJIz5/sIfZJB7fM
	X58ghvBVykp1EHzXj+MkctIRr/IfBgKeVPpsheM=
X-Google-Smtp-Source: AKy350ZadzHc1YdyUWwJ1WbdMpV+txM0Edia1oL26IT6idA6zGbxly+LGwyc5bup77OuvCAgk1LeEw==
X-Received: by 2002:a62:7902:0:b0:625:ce95:f2ba with SMTP id u2-20020a627902000000b00625ce95f2bamr10708051pfc.22.1680796987340;
        Thu, 06 Apr 2023 09:03:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.03.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:03:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/26] report-error: catch Nothing PROVIDES error
Date: Thu,  6 Apr 2023 06:01:53 -1000
Message-Id: <5f2d74856e6790e8742f7d6049f7a21c4c17d987.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179804

From: Mingli Yu <mingli.yu@windriver.com>

Make the report-error catch Nothing PROVIDES error and then
we can check it directly via error report web.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a57d8f82b83554c821a83eacc02f9c73b263ff02)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/report-error.bbclass | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 2f692fbbcc..2b2ad56514 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -107,6 +107,31 @@ python errorreport_handler () {
             errorreport_savedata(e, jsondata, "error-report.txt")
             bb.utils.unlockfile(lock)
 
+        elif isinstance(e, bb.event.NoProvider):
+            bb.utils.mkdirhier(logpath)
+            data = {}
+            machine = e.data.getVar("MACHINE")
+            data['machine'] = machine
+            data['build_sys'] = e.data.getVar("BUILD_SYS")
+            data['nativelsb'] = nativelsb()
+            data['distro'] = e.data.getVar("DISTRO")
+            data['target_sys'] = e.data.getVar("TARGET_SYS")
+            data['failures'] = []
+            data['component'] = str(e._item)
+            data['branch_commit'] = str(oe.buildcfg.detect_branch(e.data)) + ": " + str(oe.buildcfg.detect_revision(e.data))
+            data['bitbake_version'] = e.data.getVar("BB_VERSION")
+            data['layer_version'] = get_layers_branch_rev(e.data)
+            data['local_conf'] = get_conf_data(e, 'local.conf')
+            data['auto_conf'] = get_conf_data(e, 'auto.conf')
+            taskdata={}
+            taskdata['log'] = str(e)
+            taskdata['package'] = str(e._item)
+            taskdata['task'] = "Nothing provides " + "'" + str(e._item) + "'"
+            data['failures'].append(taskdata)
+            lock = bb.utils.lockfile(datafile + '.lock')
+            errorreport_savedata(e, data, "error-report.txt")
+            bb.utils.unlockfile(lock)
+
         elif isinstance(e, bb.event.BuildCompleted):
             lock = bb.utils.lockfile(datafile + '.lock')
             jsondata = json.loads(errorreport_getdata(e))
@@ -120,4 +145,4 @@ python errorreport_handler () {
 }
 
 addhandler errorreport_handler
-errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed"
+errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed bb.event.NoProvider"
-- 
2.34.1


