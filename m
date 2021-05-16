Received: from m43-7.mailgun.net (m43-7.mailgun.net [])
 by mx.groups.io with SMTP id smtpd.web09.4822.1621164221635194752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 04:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=WVLbi6nC;
 spf=softfail (domain: mg.codeaurora.org, ip: <nil>, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621164261; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=G/CPCnGEjvttp+VCHeLvBwZJu7G3Cj2AAa3xkQdreIA=; b=WVLbi6nCSR5RNCcbiuiutvfMv6ygAtsWSEmpEYbNV6DBPxtkk/cRRUm53TPZn2+lkswlPNmi
 IzRfFB5GZ5chUvq8hbj/JNs6WvvpEOatqCIIPllO6K5qSr8lphRidlGcYRSHZvUpOUIZ4pCw
 qoYhG6B82mESbE+fwd/bDYvdS3k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60a100be7b5af81b5c61ce60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 16 May 2021 11:23:42
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id E975DC43460; Sun, 16 May 2021 11:23:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from lnxeng01-le.qualcomm.com (unknown [202.46.22.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 56604C4338A;
	Sun, 16 May 2021 11:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 56604C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sbanerje@codeaurora.org
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: openembedded-core@lists.openembedded.org
Cc: Sourabh Banerjee <sbanerje@codeaurora.org>
Subject: [bitbake][PATCH 2/3] bitbake: fetch2/repo: add support for sync specific projects
Date: Sun, 16 May 2021 16:53:12 +0530
Message-Id: <1621164193-9434-2-git-send-email-sbanerje@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>
References: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>

repo tool can fetch projects by name. I.e., if there are
multiple projects listed in the manifest file.

 <manifest>
  <project name="project1"  path="sync path1"  revision="sha256" />
  <project name="project2"  path="sync path2"  revision="sha256" />
 </manifest>

Documented Usage: repo sync [<project>...]

By supplying project=<project_name> recipe can choose to sync a specific
project.
Example:
  SRC_URI = "repo://REPOROOT;protocol=git;branch=main;manifest=default.xml;project=project1"

This is helpful when recipe needs to sync only a specific project
from a manifest that lists multiple projects.

Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
---
 bitbake/lib/bb/fetch2/repo.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/repo.py b/bitbake/lib/bb/fetch2/repo.py
index 8547b9e..e7c5255 100644
--- a/bitbake/lib/bb/fetch2/repo.py
+++ b/bitbake/lib/bb/fetch2/repo.py
@@ -41,7 +41,10 @@ class Repo(FetchMethod):
         if not ud.manifest.endswith('.xml'):
             ud.manifest += '.xml'
 
-        ud.localfile = d.expand("repo_%s%s_%s_%s.tar.gz" % (ud.host, ud.path.replace("/", "."), ud.manifest, ud.branch))
+        project = ud.parm.get('project', '')
+        if len(project):
+            project = '_' + project
+        ud.localfile = d.expand("repo_%s%s_%s_%s%s.tar.gz" % (ud.host, ud.path.replace("/", "."), ud.manifest, ud.branch, project.replace("/", ".")))
 
     def download(self, ud, d):
         """Fetch url"""
@@ -52,7 +55,8 @@ class Repo(FetchMethod):
 
         repodir = d.getVar("REPODIR") or (d.getVar("DL_DIR") + "/repo")
         gitsrcname = "%s%s" % (ud.host, ud.path.replace("/", "."))
-        codir = os.path.join(repodir, gitsrcname, ud.manifest)
+        project = ud.parm.get('project', '')
+        codir = os.path.join(repodir, gitsrcname, ud.manifest, project.replace("/", "."))
 
         if ud.user:
             username = ud.user + "@"
@@ -76,7 +80,7 @@ class Repo(FetchMethod):
         if jobs:
             jobs = '-j' + jobs
         bb.fetch2.check_network_access(d, "%s sync %s" % (ud.basecmd, ud.url), ud.url)
-        runfetchcmd("%s sync %s" % (ud.basecmd, jobs), d, workdir=repodir)
+        runfetchcmd("%s sync %s %s" % (ud.basecmd, jobs, project), d, workdir=repodir)
 
         scmdata = ud.parm.get("scmdata", "")
         if scmdata == "keep":
-- 
2.7.4



-- 
Regards,
Sourabh
