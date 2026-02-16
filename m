Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF3DE7BDBC
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:34:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19551.1771248852064114528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V69NHCW0;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806bf39419so37317175e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771248850; x=1771853650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vQdQmXk0hhFa4dJZ+RlXWxkDcXk3dDB3il4aeQ7H00=;
        b=V69NHCW00rah5TthUEnLZBxK7fs7Nb3sRqgWaqicKTePQU2UMgA1BDOfG3vDAlXWeA
         BL3j3V7rLj4GHu9O91GmOGOF7zROz7813TuaOJ4VlD8LZWwN1iOcdnCC9+Kkfek+s3rO
         7TZ1glQEsu0aQRu/q7OxVSgfpExTSPgvHCo9ReOK8X8kQw+KzZmWFJ4CSrUDRk5S1yMQ
         Es8Y8HesOkkB901HPV40Cle1XqTupczkbFxU/J6sxw9pa9sbY8dqNtdlSfMcIeOWPtJt
         RQ6xcYGbnzrGm47YMG4ECSQiKKXRzfBErFFzUknowZX+EX2VquP6jm7cDsnZ2KazZIhq
         Nsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771248850; x=1771853650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vQdQmXk0hhFa4dJZ+RlXWxkDcXk3dDB3il4aeQ7H00=;
        b=dOay+fEMeeA3hmWevP6RUihDqwsxl+sQ9VSjLfzDp8KXfLKoOQiaKqQtKC3ucnGjtw
         pKWFlGG+Du9ZwCCUUjaf8TcY8SOdCYur/wo58DO04gYd0OEvpfFI7vpRDSHooYUVh+Eq
         YjSoE5DVRq/h6FtpRqD0hsMJOw0jyDbWHVAT/YkQVG5UWxulhSd5dcUPoBFLowIqbzmM
         aCC/GIAP8Z+cYySz9ZWhPgZW8fxuDYUP6yI7J4n0jX2CUtUxhBOzm51gUsDwtncC7jOc
         qwoFGq0UTO8W5Vdbk35z1nxa11zeOn4BSb/Q4T8yiiDm3TQ2tULmG3V1roGD5cVutFLH
         a1yA==
X-Gm-Message-State: AOJu0YzCzOoCuLqdTaDheWXizRjn80NLu/Q3IKVPIZGpc9TAyS3bwaT5
	lBQ1ezhIon/6y/QO4YASw3HGIDq5g/2W8EHq0+G4e0UowXli1BuHLly6PmFRdA==
X-Gm-Gg: AZuq6aI6nQ8ibvrCvY4lngUTBL8MvZS3cbE9wI42KI194CE+PR1dJAfwv+kifonBT/N
	RzJ7YtCCPIav0goD7Ij7hlKybrgAS5hPUV3KUuJSZbYPsVGFSlXUGJftrU/XKjJ+CeFS3vTsctK
	u54h8N3Ull/d/PKHbvYkUO5z/k694Yyfhj5GP9HhnN81GM5HiOmjRQgl1/YRulX+kvZJpzAqqdY
	80e2niQNX0AsqGrPf2aDU+/4+jiQXCYz+CEg01OSuZaAacJHP6r13xf5qzARyT9qX7dRD8h3GKm
	k637pMGQPFmFIecTMrseidOPKjG02pm8Ep7kwiTlr6unuHVriTp+iZYNFIoy8UQeh3uj2nxFuHl
	QWgRpAur2CCvbmELk9itmcm0dUeH7cs25LCduFmdaW/RFMwVB31/V3FNftDKe19YzbeY/7A3Tql
	BxNlixJhmMVjy51H/D9rHBfcTXMRiy3xD1T9+9yhLpuPzS+VOnxPxF28+ItH0=
X-Received: by 2002:a05:600c:19d3:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-48378d6bc48mr139399935e9.7.1771248849830;
        Mon, 16 Feb 2026 05:34:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm340037485e9.4.2026.02.16.05.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:34:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] lttng-tools: ensure that ptest errors are not suppressed
Date: Mon, 16 Feb 2026 14:33:47 +0100
Message-ID: <20260216133351.1034740-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231198

From: Alexander Kanavin <alex@linutronix.de>

At some recent point lttng-tools ptests have quietly regressed,
and most of them aren't executed anymore. Errors are printed
on the console, but aren't reported as exit code from run-ptest.

The reason is that exitcode was set to what sed returned, not make.
The original reason for piping through sed was to unify /tmp/tmp.xxxx outputs
for easier results comparison, but (after fixing the tests) I don't
see such lines anymore, and in any case ensuring such regressions
are caught is more important.

With this fix, run-ptest and testimage starts to fail as it should.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/lttng/lttng-tools/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index f4f7a3baea..e7edc03e96 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -31,7 +31,7 @@ validate_lttng_modules_present || {
 make -k -t all >error.log 2>&1
 # Can specify a test e.g.:
 # -C tests/regression/ check TESTS='kernel/test_callstack'
-make -k -s $makeargs check 2>error.log | sed -e 's#/tmp/tmp\...........#/tmp/tmp.XXXXXXXXXX#g'
+make -k -s $makeargs check 2>error.log
 exitcode=$?
 if [ -e error.log ]; then
     cat error.log
-- 
2.47.3


