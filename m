Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92C9E63F3D
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:34:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19364.1771248852934721526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQFtPvQM;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-481188b7760so26516865e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771248851; x=1771853651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhXCFXJHAhsNk9XTWf8Tg2vgmt4Ixy1F8tK4eVZil5U=;
        b=eQFtPvQMRAlGde1nfagtxQcJ2gL5dbke283J+Hx9g5HFC8sDn9Z7x0cApE9HvC/q49
         kCkMhXVKcF5hFlSDW3c7HVea4ubulE5WLVZXdtzPdDFgmZjYU0nZO2JKO7Oxql6xEv5W
         MI33t0FzAU4tdQxZ7CxEch26vfHaKhvfkizBM6NEdh5pzQXueHp+o23Ga6DbMGk8KnZM
         HCAkMFywyIRCgHmDiffIALMW3ZbHvl1aB2BBvQSDzZBxLgn0AMsPGdTyTJxRNI8Lof/b
         x0Z21b2d2L7/Rq5Him2gvUOU2cR8qmKL/uukdyWx2c98sftK5sePi8OLXvruATYysHRK
         5ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771248851; x=1771853651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LhXCFXJHAhsNk9XTWf8Tg2vgmt4Ixy1F8tK4eVZil5U=;
        b=CwF2DbEFuuFgKFTswIgw84Q11H1koO+AtxfRQVqPB4OXbcHRjrw3nDOn2FZge2R4F4
         XB8O0bmuXmu9gI9KMTAlrIQVPC4Qv181/VmQJpOBHPyvocVplS2fa9LWX8VjwDmPW0Z5
         XOVjwyPHfQSK4Zn87B8tM4aMPy9wCSSL5mdI4pVdKPibmY892RVnYnm+Ujwl0MzPyQzS
         qadq2nhfzRQxrq0pdSOYY+R9bWi8EOhgupVqA3hyrlZco6BQTIzZJfWHTB9UFGfE21sK
         QyNAbYhRj+T9shqJZ34hFq4VcFIRXD3jumgQsWeuzkDgACCOU25dN9rqmmpt3r764Tf0
         wTsg==
X-Gm-Message-State: AOJu0YyCAc6zsYZJVVtsBJQARYuxCj7ros5Y4TK/MUV/Tm2nJiySu3dE
	ao3zBsTHAqPI3/bj/aWicfPDO9FVP6J/o26f+y3H1jXlWWC+EX1zQUJowa61oA==
X-Gm-Gg: AZuq6aJtztUnqUP8k88DHuCyS+90JVClIpsCcQdrJ9eMEOS4HBVRxIchUkBQyjZg+TF
	H6Ikx7YeZZT/9NApcPLtb4ql2kR17XtRDw7B8KGEKlUC7MD9UcWcH6JFyWOiBLgUPGshqKExw05
	GIKF7TTd+M624tcEyxa03w8dg2fzLaXDWrITj4sh8ob7Y9O3/vPmvRbBWdSxF+XlIj+LDjR2e7G
	rfEiI3fs52hL+9jeLd9G3PJZEM3RBoRya3xahwOoAoRsHkwMDDUqKfnh4/DNnndIkIVYF56KZFb
	/fCbAqohA6WYCDpmrG3DMMht3OG1x4T+vYt1AzcULfWBLbrgRbnTnb/sN/DlWAVi0qcaWJWO/eW
	ah6wOhEW2xFNzWJatSHs/RKnwMMVLffL3w4l3CINvoTM6dYO5eE6ghGJb8vTMiaBtgqZc6m8XuG
	gWDjUZi2Gse+ix1NwTtxILMR/Y8dowvpW1oQ0uW2pWDFX64DRc4RRZrUUI6bWiY35rNafm0w==
X-Received: by 2002:a05:600c:8706:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-48373a58a97mr162345855e9.35.1771248851164;
        Mon, 16 Feb 2026 05:34:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm340037485e9.4.2026.02.16.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:34:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] lttng-tools: install .expect test files with a wildcard
Date: Mon, 16 Feb 2026 14:33:49 +0100
Message-ID: <20260216133351.1034740-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216133351.1034740-1-alex.kanavin@gmail.com>
References: <20260216133351.1034740-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231200

From: Alexander Kanavin <alex@linutronix.de>

Otherwise, there will be failures on 32 bit hosts. Note
that the needed files are erroneously absent from upstream
release tarballs:
https://bugs.lttng.org/issues/1436
but once that is resolved, this commit will be effective.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 1106867aeb..620ddfb1cf 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -90,8 +90,8 @@ do_install_ptest () {
     for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng \
             tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh \
             tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh \
-            tests/regression/tools/trace-format/ust-local-trace-pretty.expect \
-            tests/regression/tools/trace-format/kernel-local-trace-pretty.expect \
+            tests/regression/tools/trace-format/ust-local-trace-pretty.expect* \
+            tests/regression/tools/trace-format/kernel-local-trace-pretty.expect* \
             tests/regression/tools/base-path/*.lttng; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
-- 
2.47.3


