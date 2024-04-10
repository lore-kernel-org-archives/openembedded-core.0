Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E928CD1296
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 07:06:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.159952.1712732810083325053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 00:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=X6w64wK4;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4173f9e5e05so1165075e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 00:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712732808; x=1713337608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tbmm+u7trlXu8HJj3bWuYuTX4b5pn3rKFqv+AOV2qEw=;
        b=X6w64wK4+k+efRWOH96SNmGm4WWWW2RXztQVC8Eh+AS9cy1HAoOEB8y3ustS7jGxVB
         QVQkUdf2LmQ9986aOR1hpvLEs4aY/9mJnaB9jr2FzELAkk3VhAcllXdJK+S0cmOiavMJ
         3sSX9A8XWmKEmSugakwFlfrwm9zxVB2gCTZwIr+EOk3aEOsuGv40/KxWs9SvSIcM3bNj
         bgbXKpiD4Pf+vdZtexBUa7qfC6l7d88MAITNoVsHNf0RMOTO8KUaPZywQrb0hCJPXhu7
         X7xI85DCOitBPqjbpDqeaBnuINZmcslZ9vtt6gSAoYAJQP9mijWu+hqR4Nlby4WMokAq
         cN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712732808; x=1713337608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tbmm+u7trlXu8HJj3bWuYuTX4b5pn3rKFqv+AOV2qEw=;
        b=X/WqQndYoXKAnJngeb9KddhUCu/iDl4IkhmK31AHiI+S4vhR6njqwtFvP5VQ23hsln
         aR1Owrizip5i3EkGlQfxJFo/Cu5ArDO+5uCagjcLLAfjSs4Lv6y/pgsVFIW1CXIj+tFF
         MBjqcoIGeUEZXvFS4KnwJ6ohgXxnQ1z4OsrWmy3p72jlWNxRus24SRzt2iPJ7Qilwgha
         gQjJ6qJl9Y8YJ1HwRMvqPWT36HkfkkA59ff+sDISkSpmFUFDslUvMGBDSzB+90xqWuGK
         ZMEXvjIvXbXnxScsrsWJy83rgHprIGwfZXBDB3WOi3+NlumfyeAK6e+BFrJot9a2LSbN
         0NIw==
X-Gm-Message-State: AOJu0YyvW0ii8YTOvqJGSa7rhsnSyCXDyBI77dvrFPocGQJ9bIKlJCEV
	h1QvCx9Z/X2I3gg6XDrCx0SsKkMS7tqC/ASGlI95vR7fBKGPgPtTX3nmrYGWlExdxUR/4IxPeoc
	E7oo=
X-Google-Smtp-Source: AGHT+IFHuQ/z9gfgBfSIMa9BDFmYqP2AlzlF77MP2tsBuDkfgrRykwWAPgFDadtQ2FiXXEq2m8Zu+w==
X-Received: by 2002:a05:600c:5127:b0:416:2c8f:12e7 with SMTP id o39-20020a05600c512700b004162c8f12e7mr1267310wms.1.1712732807569;
        Wed, 10 Apr 2024 00:06:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d5187000000b003434c764f01sm13115522wrv.107.2024.04.10.00.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 00:06:47 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2] devtool: standard: throws appropriate error if source is in detached HEAD
Date: Wed, 10 Apr 2024 09:06:47 +0200
Message-ID: <20240410070647.3783683-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 07:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198079

If source is in detached HEAD, we get the following error when using
detvool finish command:

    [...]
    File "<...>/poky/scripts/lib/devtool/standard.py", line 1938, in _update_recipe
      bb.process.run('git checkout %s' % startbranch, cwd=srctree)
    File "<...>/poky/bitbake/lib/bb/process.py", line 189, in run
      raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
  bb.process.ExecutionError: Execution of 'git checkout (HEAD detached at 9bbf87e)' failed with exit code 2:
  /bin/sh: -c: line 1: syntax error near unexpected token `('
  /bin/sh: -c: line 1: `git checkout (HEAD detached at 9bbf87e)'

Check this and throws an appropriate error in this case

Signed-off-by: Julien Stephan <jstephan@baylibre.com>

---

Changes in v2:

- update error message to avoid confusion with a potentially non
  existing "main" branch
---
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2c174927ddb..51e5794a0a7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1888,6 +1888,8 @@ def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_ver
         for line in stdout.splitlines():
             branchname = line[2:]
             if line.startswith('* '):
+                if 'HEAD' in line:
+                    raise DevtoolError('Detached HEAD - please check out a branch, e.g., "devtool"')
                 startbranch = branchname
             if branchname.startswith(override_branch_prefix):
                 override_branches.append(branchname)
-- 
2.44.0


