Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15844C25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:10:39 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.12188.1714741837444037933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=q6zuBgVI;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6a0d1032362so22168666d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714741836; x=1715346636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LPvlFYvAlpNBmqXQKP6hkZXJyqxh+/BN+3gCDmG7v4=;
        b=q6zuBgVIBaXbWdqAicoWG5iojLdywS8YOdY3Lh5svxzoGykzXhUzRXruEGyB5wGXjw
         FW4FWXX7vQg/AzypO118tYUQthUj4vfwLMs1iguAHp3Sc44KUOn1v0rmbJhTDBhJ1kf/
         Mmi4rDOXIa67eFCUDGqhj7sR+0zLytjzQx9J6hjReqKIu9z1Ew0xkYESS9VRPvrX/vhg
         cO/wT1JQ+vTVVUWIqU1WaSZAW5ToeAbp85aYvSy7iLjUiGAe3cXtk8YcQSTwVGd6eGXP
         xEhdZYn79VklvZwX7AFevY/FLJpCVRx+3CGWr9IsQXOUmoXWkA/DKdbEWJC61BxkM2wc
         JEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741836; x=1715346636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LPvlFYvAlpNBmqXQKP6hkZXJyqxh+/BN+3gCDmG7v4=;
        b=MQPfz3ZyrXRBZgf1AoXe3n6ivjpcT06xlARg6931MY2B3iX96TLLMtlv62qGo2oxTa
         EuKuLT5trQFhJwfd0Wy/vJi9DpKoQ/4pK9Q8Caqln6v6MEP5Sy3+Q6hvUiybIalDDkuZ
         dhmVvefspnmlSDKP0EA28hkZmDJC7Z6ejDfmoX8sGIvYbchhzXvRNyAFL3JnDc140peG
         YWIFRyzCl7NZMcTC9YQCdG7+V0NzkgdHNmh283DBznJJB3CIKIfvDL/pRCPZza6se64V
         MxswXsVzlE5Ex+qwi1qj2CmFzK4ED688Rf5D26+4oSMIv31C46VxP7Yjmf8RrrCsmryj
         b2uw==
X-Gm-Message-State: AOJu0YySpfF6ta9WEvl8+JbicrTXrUppHPtKCW7a+lLAzd/KI6SmbpjH
	uBcf+t8IIj9mU9z6tvNj36mt3K2NIqU+seFOfHKSAIm4//XwQ093E0kKlW2YuB9FqDBkrcYWl+X
	Kbvw=
X-Google-Smtp-Source: AGHT+IEiGt8U0cC6JQzJaHJ5g4RcSMzJC1LmRtrowKKLf4rVCBOIxcYyYd1qi4qtRjh68cm2+hJAuQ==
X-Received: by 2002:a05:6214:29c3:b0:6a0:d291:a35e with SMTP id gh3-20020a05621429c300b006a0d291a35emr2269152qvb.52.1714741836168;
        Fri, 03 May 2024 06:10:36 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id jh20-20020a0562141fd400b006a0e94eb3e9sm1193510qvb.34.2024.05.03.06.10.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:10:35 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] patchtest: repo: refactor to use GitPython
Date: Fri,  3 May 2024 09:10:30 -0400
Message-ID: <20240503131033.1665297-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503131033.1665297-1-tgamblin@baylibre.com>
References: <20240503131033.1665297-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198987

The repo module currently uses a custom _exec() function in order to run
various git commands as part of the patchtest setup/test process. These
can more efficiently be done with the GitPython module, so use that
instead and reduce the amount of custom code to be maintained for
patchtest in the process. Some specifics replaced using GitPython:

- get branch list
- use repo.active_branch to determine current branch
- use execute() for checkout, merge check, abort, rev-parse, reset

The _exec() function is removed entirely with this change.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/repo.py | 88 ++++++++------------------------------
 1 file changed, 17 insertions(+), 71 deletions(-)

diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index d3788f466d3..5f361ac5005 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -11,6 +11,7 @@
 import os
 import utils
 import logging
+import git
 from patch import PatchTestPatch
 
 logger = logging.getLogger('patchtest')
@@ -21,15 +22,17 @@ class PatchTestRepo(object):
     # prefixes used for temporal branches/stashes
     prefix = 'patchtest'
 
+
     def __init__(self, patch, repodir, commit=None, branch=None):
         self._repodir = repodir
+        self._repo = git.Repo.init(repodir)
         self._patch = PatchTestPatch(patch)
-        self._current_branch = self._get_current_branch()
+        self._current_branch = self._repo.active_branch.name
 
         # targeted branch defined on the patch may be invalid, so make sure there
         # is a corresponding remote branch
         valid_patch_branch = None
-        if self._patch.branch in self.upstream_branches():
+        if self._patch.branch in self._repo.branches:
             valid_patch_branch = self._patch.branch
             
         # Target Branch
@@ -52,22 +55,19 @@ class PatchTestRepo(object):
 
         self._workingbranch = "%s_%s" % (PatchTestRepo.prefix, os.getpid())
 
-        # create working branch
-        self._exec({'cmd': ['git', 'checkout', '-b', self._workingbranch, self._commit]})
+        # create working branch. Use the '-B' flag so that we just
+        # check out the existing one if it's there
+        self._repo.git.execute(['git', 'checkout', '-B', self._workingbranch, self._commit])
 
         self._patchmerged = False
 
         # Check if patch can be merged using git-am
         self._patchcanbemerged = True
         try:
-            self._exec({'cmd': ['git', 'am', '--keep-cr'], 'input': self._patch.contents})
-        except utils.CmdException as ce:
-            self._exec({'cmd': ['git', 'am', '--abort']})
+            # Make sure to get the absolute path of the file
+            self._repo.git.execute(['git', 'apply', '--check', os.path.abspath(self._patch.path)], with_exceptions=True)
+        except git.exc.GitCommandError as ce:
             self._patchcanbemerged = False
-        finally:
-            # if patch was applied, remove it
-            if self._patchcanbemerged:
-                self._exec({'cmd':['git', 'reset', '--hard', self._commit]})
 
         # for debugging purposes, print all repo parameters
         logger.debug("Parameters")
@@ -97,78 +97,24 @@ class PatchTestRepo(object):
     def canbemerged(self):
         return self._patchcanbemerged
 
-    def _exec(self, cmds):
-        _cmds = []
-        if isinstance(cmds, dict):
-            _cmds.append(cmds)
-        elif isinstance(cmds, list):
-            _cmds = cmds
-        else:
-            raise utils.CmdException({'cmd':str(cmds)})
-
-        results = []
-        cmdfailure = False
-        try:
-            results = utils.exec_cmds(_cmds, self._repodir)
-        except utils.CmdException as ce:
-            cmdfailure = True
-            raise ce
-        finally:
-            if cmdfailure:
-                for cmd in _cmds:
-                    logger.debug("CMD: %s" % ' '.join(cmd['cmd']))
-            else:
-                for result in results:
-                    cmd, rc, stdout, stderr = ' '.join(result['cmd']), result['returncode'], result['stdout'], result['stderr']
-                    logger.debug("CMD: %s RCODE: %s STDOUT: %s STDERR: %s" % (cmd, rc, stdout, stderr))
-
-        return results
-
-    def _get_current_branch(self, commit='HEAD'):
-        cmd = {'cmd':['git', 'rev-parse', '--abbrev-ref', commit]}
-        cb = self._exec(cmd)[0]['stdout']
-        if cb == commit:
-            logger.warning('You may be detached so patchtest will checkout to master after execution')
-            cb = 'master'
-        return cb
-
     def _get_commitid(self, commit):
 
         if not commit:
             return None
 
         try:
-            cmd = {'cmd':['git', 'rev-parse', '--short', commit]}
-            return self._exec(cmd)[0]['stdout']
-        except utils.CmdException as ce:
-            # try getting the commit under any remotes
-            cmd = {'cmd':['git', 'remote']}
-            remotes = self._exec(cmd)[0]['stdout']
-            for remote in remotes.splitlines():
-                cmd = {'cmd':['git', 'rev-parse', '--short', '%s/%s' % (remote, commit)]}
-                try:
-                    return self._exec(cmd)[0]['stdout']
-                except utils.CmdException:
-                    pass
+            return self._repo.rev_parse(commit).hexsha
+        except Exception as e:
+            print(f"Couldn't find commit {commit} in repo")
 
         return None
 
-    def upstream_branches(self):
-        cmd = {'cmd':['git', 'branch', '--remotes']}
-        remote_branches = self._exec(cmd)[0]['stdout']
-
-        # just get the names, without the remote name
-        branches = set(branch.split('/')[-1] for branch in remote_branches.splitlines())
-        return branches
-
     def merge(self):
         if self._patchcanbemerged:
-            self._exec({'cmd': ['git', 'am', '--keep-cr'],
-                        'input': self._patch.contents,
-                        'updateenv': {'PTRESOURCE':self._patch.path}})
+            self._repo.git.execute(['git', 'am', '--keep-cr', os.path.abspath(self._patch.path)])
             self._patchmerged = True
 
     def clean(self):
-        self._exec({'cmd':['git', 'checkout', '%s' % self._current_branch]})
-        self._exec({'cmd':['git', 'branch', '-D', self._workingbranch]})
+        self._repo.git.execute(['git', 'checkout', self._current_branch])
+        self._repo.git.execute(['git', 'branch', '-D', self._workingbranch])
         self._patchmerged = False
-- 
2.44.0


