Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by mx.groups.io with SMTP id smtpd.web09.4822.1621164221635194752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 04:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=N0ctZWmQ;
 spf=pass (domain: mg.codeaurora.org, ip: 69.72.43.7, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621164223; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kkcyxjzcNcvTYHJJhWI/34nDdVz0e1H2O2hrT52sZ1o=; b=N0ctZWmQTzukCalbEjZ1ExojVI9rmPELcvgSLTnVG7pOVHzwiSS4ldNpPsKmpKp/vA8/lrqu
 0yRCZUvGV/72MnTJ3cS2bLJKrcA+eb3P+B2sD6gmpT+xc7ZM98eaQhr7h2ehxW4qGvrEPNf9
 VaElW6vv+oIn9SapIF+TIyimnzs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60a100b060c53c8c9d84e6fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 16 May 2021 11:23:28
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 68D69C4338A; Sun, 16 May 2021 11:23:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from lnxeng01-le.qualcomm.com (unknown [202.46.22.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id EF568C433D3;
	Sun, 16 May 2021 11:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF568C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sbanerje@codeaurora.org
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: openembedded-core@lists.openembedded.org
Cc: Sourabh Banerjee <sbanerje@codeaurora.org>
Subject: [bitbake][PATCH 1/3] bitbake: fetch2/repo: add support for projects to be fetched simultaneously
Date: Sun, 16 May 2021 16:53:11 +0530
Message-Id: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>
X-Mailer: git-send-email 2.7.4

repo tool can fetch projects simultaneously.
As per repo sync documentation:
  Usage: repo sync [<project>...]
  Options:
    -j JOBS, --jobs=JOBS  projects to fetch simultaneously (default 1)

By supplying jobs=<some_number> recipe can choose to use the
simultaneous fetch feature of repo tool.
Example:
  SRC_URI = "repo://REPOROOT;protocol=git;branch=main;manifest=default.xml;jobs=8"

Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
---
 bitbake/lib/bb/fetch2/repo.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/repo.py b/bitbake/lib/bb/fetch2/repo.py
index fa4cb81..8547b9e 100644
--- a/bitbake/lib/bb/fetch2/repo.py
+++ b/bitbake/lib/bb/fetch2/repo.py
@@ -62,11 +62,21 @@ class Repo(FetchMethod):
         repodir = os.path.join(codir, "repo")
         bb.utils.mkdirhier(repodir)
         if not os.path.exists(os.path.join(repodir, ".repo")):
+
             bb.fetch2.check_network_access(d, "%s init -m %s -b %s -u %s://%s%s%s" % (ud.basecmd, ud.manifest, ud.branch, ud.proto, username, ud.host, ud.path), ud.url)
             runfetchcmd("%s init -m %s -b %s -u %s://%s%s%s" % (ud.basecmd, ud.manifest, ud.branch, ud.proto, username, ud.host, ud.path), d, workdir=repodir)
 
+        # Projects to fetch simultaneously at time of 'repo sync'.
+        # If SRC_URI provides parallel jobs parameter as follows:
+        #   SRC_URI = "repo://REPOROOT;branch=some_branch;jobs=8"
+        # Sync is run as 'repo sync -j8'
+        # When jobs parameter is not passed with SRC_URI then
+        # repo tool's default behavior is to fetch 1 project at a time.
+        jobs = ud.parm.get('jobs', '')
+        if jobs:
+            jobs = '-j' + jobs
         bb.fetch2.check_network_access(d, "%s sync %s" % (ud.basecmd, ud.url), ud.url)
-        runfetchcmd("%s sync" % ud.basecmd, d, workdir=repodir)
+        runfetchcmd("%s sync %s" % (ud.basecmd, jobs), d, workdir=repodir)
 
         scmdata = ud.parm.get("scmdata", "")
         if scmdata == "keep":
-- 
2.7.4



-- 
Regards,
Sourabh
