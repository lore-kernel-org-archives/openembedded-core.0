Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB4EC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:05:02 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.44075.1669903500700934150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LVVfEN7w;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20221201140457fde1d577d592709fcb-0mgjh2@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20221201140457fde1d577d592709fcb
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Dec 2022 15:04:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bzOHF3bMZbGxrNWS5kkXOqQifnhtpEzbFk4MtExjf5U=;
 b=LVVfEN7wUkYg3o7Cz1KJ6dtPOQEO2ITZVJ54fXXVQnXS8xZ5J0HV749Sf/L9UjBpuMUQeR
 1X0yX8sqhUhjMtt651O6QecMO119isiWfJcbH7KFdBQkDzt/gCergFwITPC/Xdl7PaTl4JXK
 DwpevV1PduOf8oTZ5wBvyU6DoxWC4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][master][PATCH] externalsrc: fix lookup for .gitmodules
Date: Thu,  1 Dec 2022 15:04:40 +0100
Message-Id: <20221201140440.9051-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174061

Commit 0533edac277080e1bd130c14df0cbac61ba01a0c broke
bitbake parsing when bitbake is executed from directory with existing .gitmodules
and the recipe in externalsrc does not have .gitmodules

The check needs to search for .gitmodules in sources path, not cwd.

iParsing recipes...ERROR: ExpansionError during parsing <path to recipe>
...
bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-checksums], expression was ${@srctree_hash_files(d)} which triggered exception CalledProcessError: Command '['git', 'config', '--file', '.gitmodules', '--get-regexp', 'path']' returned non-zero exit status 1.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 75fb91bcb0..0deb5dbf5f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -230,7 +230,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(".gitmodules"):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.30.2


