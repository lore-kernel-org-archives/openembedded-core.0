Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B8CC41513
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:10:39 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.12191.1714741838584739553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=geS4GZXq;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a05f376effso67402366d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714741837; x=1715346637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDLQ8Ddxh9OEUGInsddUB2jLWf6lvx2JDytZmXZh5Ys=;
        b=geS4GZXqm2U4U7I5JcXuXKpzzsbuHH/yJchtKf+GmhxVoQ1/Vmlvza7SEyHNsW7GDt
         yeGkM3d07e8gMN086wZWSb0sHyvoueoPSQWBJ12F1tNHjY8vF/GbIQNjyqQOhdRWo2Nz
         Im7w9Ks3vmPr/9qaKeAMT0xVhyYDOr/RAlR5wiGJQ09gnQ8uADQgd2oRdQrh/YSHB5xj
         KexN5E5QMuNW6TMKnoCFP24T+V2IfJCslNxERhNZ10Yp4Q861pNKJv9x6/XKmFUdzceh
         6svOr+OptnVhH553lobwwFu+jN6ePsA0Os+lCfCyZijk7PwMh/IiJY2KDXTfHcDFg2dG
         f5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741837; x=1715346637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDLQ8Ddxh9OEUGInsddUB2jLWf6lvx2JDytZmXZh5Ys=;
        b=KCNIxx2HMRGELULFq2KrU/P9n4BYktwA+Vv2adZU+j6U+Rq0EtrAaPR3HNUVJpcUaX
         yreH2Ovy/2BvFUr5ih/ryPyMCbbnY07pHSTwlLvVIlSCoIz6TnOFhl1DGPuuVpYo8gdc
         pzTSIojnFk4GICZKMiuJjDA87NMUjOrfywFo/VDhrbX+YmdzddRk0ZcQH9wc1tV3Dosb
         qygT0ulvlNshQQ/MFWRuJynx+h9TPmSRYH3HpbygSVAaH9V0xAP/5akXGNdgq9ZTtj2a
         lslaFl+oPqRh2Rd48xmcomiByRsXQcBuscgEzv/SfblH7lMllEdOjRdYje6dgsKLX2f+
         XgWQ==
X-Gm-Message-State: AOJu0YwPdblC0yNjCvBZYPXytVhCJjhdUgq4EKo02jBD/qIfUsMHoIyu
	vPmrpwDPbUXN7M39sa5siJ4icPl38vnIr09TENZyqX4kbGj36uUqFcn62I3i6zWMmfNQrgakJBU
	MBrs=
X-Google-Smtp-Source: AGHT+IGTzPQ3eXlJwE0Cj7RAZATn4fsjoR2GdCSrldciO/0nODoTkArPUPnNK4y+sV5xa35W5/Sfuw==
X-Received: by 2002:a05:6214:29ca:b0:6a0:cb52:b065 with SMTP id gh10-20020a05621429ca00b006a0cb52b065mr2544697qvb.32.1714741837392;
        Fri, 03 May 2024 06:10:37 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id jh20-20020a0562141fd400b006a0e94eb3e9sm1193510qvb.34.2024.05.03.06.10.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:10:37 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] patchtest: utils: remove unused functions
Date: Fri,  3 May 2024 09:10:32 -0400
Message-ID: <20240503131033.1665297-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503131033.1665297-1-tgamblin@baylibre.com>
References: <20240503131033.1665297-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198989

Specifically, remove four things:

- get_subject_prefix(): This function is only being used once (in the next
function found in the module), so remove it for easier
comprehension/maintenance.
- exec_cmd: the backend for executing a custom command
- exec_cmds: for running multiple calls to exec_cmd
- CmdException: A custom exception class specifically for exec_cmd

These are only used to execute git commands, but GitPython can be used
to handle all of that more efficiently, so remove them.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/utils.py | 129 +++---------------------------------
 1 file changed, 11 insertions(+), 118 deletions(-)

diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
index dd0abc22d9b..8eddf3e85fb 100644
--- a/meta/lib/patchtest/utils.py
+++ b/meta/lib/patchtest/utils.py
@@ -14,109 +14,6 @@ import logging
 import re
 import mailbox
 
-class CmdException(Exception):
-    """ Simple exception class where its attributes are the ones passed when instantiated """
-    def __init__(self, cmd):
-        self._cmd = cmd
-    def __getattr__(self, name):
-        value = None
-        if self._cmd.has_key(name):
-            value = self._cmd[name]
-        return value
-
-def exec_cmd(cmd, cwd, ignore_error=False, input=None, strip=True, updateenv={}):
-    """
-         Input:
-
-            cmd: dict containing the following keys:
-
-                cmd : the command itself as an array of strings
-                ignore_error: if False, no exception is raised
-                strip: indicates if strip is done on the output (stdout and stderr)
-                input: input data to the command (stdin)
-                updateenv: environment variables to be appended to the current
-                process environment variables
-
-            NOTE: keys 'ignore_error' and 'input' are optional; if not included,
-            the defaults are the ones specify in the arguments
-            cwd: directory where commands are executed
-            ignore_error: raise CmdException if command fails to execute and
-            this value is False
-            input: input data (stdin) for the command
-
-         Output: dict containing the following keys:
-
-             cmd: the same as input
-             ignore_error: the same as input
-             strip: the same as input
-             input: the same as input
-             stdout: Standard output after command's execution
-             stderr: Standard error after command's execution
-             returncode: Return code after command's execution
-
-    """
-    cmddefaults = {
-        'cmd':'',
-        'ignore_error':ignore_error,
-        'strip':strip,
-        'input':input,
-        'updateenv':updateenv,
-    }
-
-    # update input values if necessary
-    cmddefaults.update(cmd)
-
-    _cmd = cmddefaults
-
-    if not _cmd['cmd']:
-        raise CmdException({'cmd':None, 'stderr':'no command given'})
-
-    # update the environment
-    env = os.environ
-    env.update(_cmd['updateenv'])
-
-    _command = [e for e in _cmd['cmd']]
-    p = subprocess.Popen(_command,
-                         stdin=subprocess.PIPE,
-                         stdout=subprocess.PIPE,
-                         stderr=subprocess.PIPE,
-                         universal_newlines=True,
-                         cwd=cwd,
-                         env=env)
-
-    # execute the command and strip output
-    (_stdout, _stderr) = p.communicate(_cmd['input'])
-    if _cmd['strip']:
-        _stdout, _stderr = map(str.strip, [_stdout, _stderr])
-
-    # generate the result
-    result = _cmd
-    result.update({'cmd':_command,'stdout':_stdout,'stderr':_stderr,'returncode':p.returncode})
-
-    # launch exception if necessary
-    if not _cmd['ignore_error'] and p.returncode:
-        raise CmdException(result)
-
-    return result
-
-def exec_cmds(cmds, cwd):
-    """ Executes commands
-
-         Input:
-             cmds: Array of commands
-             cwd: directory where commands are executed
-
-         Output: Array of output commands
-    """
-    results = []
-    _cmds = cmds
-
-    for cmd in _cmds:
-        result = exec_cmd(cmd, cwd)
-        results.append(result)
-
-    return results
-
 def logger_create(name):
     logger = logging.getLogger(name)
     loggerhandler = logging.StreamHandler()
@@ -125,20 +22,6 @@ def logger_create(name):
     logger.setLevel(logging.INFO)
     return logger
 
-def get_subject_prefix(path):
-    prefix = ""
-    mbox = mailbox.mbox(path)
-
-    if len(mbox):
-        subject = mbox[0]['subject']
-        if subject:
-            pattern = re.compile(r"(\[.*\])", re.DOTALL)
-            match = pattern.search(subject)
-            if match:
-                prefix = match.group(1)
-
-    return prefix
-
 def valid_branch(branch):
     """ Check if branch is valid name """
     lbranch = branch.lower()
@@ -153,7 +36,17 @@ def valid_branch(branch):
 
 def get_branch(path):
     """ Get the branch name from mbox """
-    fullprefix = get_subject_prefix(path)
+    fullprefix = ""
+    mbox = mailbox.mbox(path)
+
+    if len(mbox):
+        subject = mbox[0]['subject']
+        if subject:
+            pattern = re.compile(r"(\[.*\])", re.DOTALL)
+            match = pattern.search(subject)
+            if match:
+                fullprefix = match.group(1)
+
     branch, branches, valid_branches = None, [], []
 
     if fullprefix:
-- 
2.44.0


