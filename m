Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A80C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:19:18 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.130954.1712647151173382142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JTaUYiW5;
 spf=pass (domain: baylibre.com, ip: 209.85.208.171, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d87660d5c9so29315911fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712647148; x=1713251948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP5Vh7hCjBxJtN45T3/6oRi7Todtqo4oHx06AyLiRB8=;
        b=JTaUYiW5KL8gO/WoGqhvqd8++WcQ9Fu8tLgq+8e1VnNH/S7fp7JEAtbvBpEC1EGKT8
         ha/5VzvMqtIFX3BBO4m6ah2GUbwnI5e7jaJo7tOOvuvg8LPnLT08lfP1EOo+2z3Txjuw
         NfpAFnjQfbTi52vOjCmqqERnfPIMNaa90uNhbOIBjAqTYJZWhMn68TbeExNF/a2CF4xS
         YFUKVVK3rNlI32HsER8gsWrEfIr9U0Or85gOiP8rq3TS4rPpaI+Okzz36HT6PkrnEW0+
         dzronIxHhWar1jIUOQbmXnx/i9Y5dW/P2TMFxaN8B7467VesZ09AM9ruZPTCdfgBA2Pq
         8dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712647148; x=1713251948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP5Vh7hCjBxJtN45T3/6oRi7Todtqo4oHx06AyLiRB8=;
        b=YKNi5wHIW+dtgmwTtFn+IyeOqKNo67rqUA6ua8Sowh5Z8UTkfyiJt8jDc8ZUZ8viWH
         aCF2yEmclyDM2fjiKGQmsK3sN4MJmlJXTsMa8txAFFkVbftAJHbYZD2lfxClRltqKfuw
         aM752yg8RGqS8VxkcPdE0wU77a9kGlvosdIRmrnWoxGsCJFxNeAHdj+0UZK5yGYkaixV
         ZeMkb1FqIYmPYHPBZj6bFXWKRH2oZ7WriaZywxL8TIC5Gvk6sDaSLx2+6Wkj3YcC2obM
         5Sf2oscIgDcI+sytr0HJRfW7Klcq4zXrtyWTjZK+rNWs4toe44Na9/4WFTfF1ZwobwQj
         2y/Q==
X-Gm-Message-State: AOJu0YyGC1JlwaR2fyKv9i9795InmjxTyqqhHO+1scXXK4cdqpYL3bw6
	1FLk+nZe5hUf8jZ36xnAKXeYXw2n0GnVVUYUdCfdWUiEcinpA6LyNwc3Wh5bRPoPyyb79vjLVRH
	J7uQ=
X-Google-Smtp-Source: AGHT+IFG1E8KwPFh/xGAduCXUes5zShd5S5QgSMzRihxlwn29d0/nL0citOu3TXc1Mi9IE22KvAysA==
X-Received: by 2002:ac2:52a2:0:b0:516:26cd:da71 with SMTP id r2-20020ac252a2000000b0051626cdda71mr8121902lfm.3.1712647147921;
        Tue, 09 Apr 2024 00:19:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b0041469869d11sm19607775wmq.47.2024.04.09.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:19:07 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] devtool: standard: throws appropriate error if source is in detached HEAD
Date: Tue,  9 Apr 2024 09:19:05 +0200
Message-ID: <20240409071905.3625142-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198054

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
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7972b4f8223..7f32b0999a4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1885,6 +1885,8 @@ def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_ver
         for line in stdout.splitlines():
             branchname = line[2:]
             if line.startswith('* '):
+                if 'HEAD' in line:
+                    raise DevtoolError('Detached HEAD - please check out the main branch in source tree first')
                 startbranch = branchname
             if branchname.startswith(override_branch_prefix):
                 override_branches.append(branchname)
-- 
2.44.0


