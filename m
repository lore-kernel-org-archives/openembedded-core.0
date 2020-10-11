Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by mx.groups.io with SMTP id smtpd.web10.13520.1602403033344221015
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 00:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=C+NuhqSn;
 spf=pass (domain: mg.codeaurora.org, ip: 104.130.96.5, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602403033; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EVcSBsGOq1p2mH/XYgqWX/D5bMzhwTh8ShXeIFISlnA=; b=C+NuhqSnfxghmC7fwqmEEk6I1Uy21LCeX6S+BgTvg4EoAzN54FRyVJxb0a4esb63XSRNA03b
 ZYGcBf3w8aEI+MI2DSh+cGolCpNi4tbSTHKk+ngfZw+2ETzal4TYUqQN+VmA+YKKPvQfzaQ5
 7pM2mRSFoX+e1REd7G3VqI9dp1A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f82bad83711fec7b10b59dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 11 Oct 2020 07:57:12
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id DE840C433CB; Sun, 11 Oct 2020 07:57:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from sbanerje-linux.qualcomm.com (unknown [202.46.22.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 20EC7C433C9;
	Sun, 11 Oct 2020 07:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20EC7C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sbanerje@codeaurora.org
From: sbanerje@codeaurora.org
To: openembedded-core@lists.openembedded.org
Cc: Sourabh Banerjee <sbanerje@codeaurora.org>
Subject: [PATCH v2] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
Date: Sun, 11 Oct 2020 13:26:45 +0530
Message-Id: <1602403005-20733-1-git-send-email-sbanerje@codeaurora.org>
X-Mailer: git-send-email 2.7.4

Sanity checker reports following error for the PATH variable,
when bitbake -e <recipe> command is run in an extensible SDK workspace.
   PATH contains '.', './' or '' (empty element), which will break the build

In case of extensible SDK, PATH variable is formed with two consecutive ':'
as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty string.

This change adds the ':' only if the bb.utils.which(d.getVar('PATH'),'bitbake')
returns a valid path.

Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
---
 meta/conf/layer.conf | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 38df0f3..75d2ee0 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -102,4 +102,12 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
 SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 
 # We need to keep bitbake tools in PATH
-PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
+# The ':' separator is conditionally added only if 'bitbake' is in environment.
+# In case of extensible SDK, bitbake is not in environment, which results in
+# two consecutive ':'. Sanity checker reports "empty element" error when it
+# encounters two consecutive ':' for PATH variable in the extensible SDK.
+PATH := "\
+${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}\
+${@(':', '')[bb.utils.which(d.getVar('PATH'),'bitbake') is ""]}\
+${HOSTTOOLS_DIR}\
+"
-- 
$(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project')



-- 
Regards,
Sourabh
