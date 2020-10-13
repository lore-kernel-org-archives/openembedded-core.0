Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by mx.groups.io with SMTP id smtpd.web10.910.1602607526981563625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 09:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=Euigl7M9;
 spf=pass (domain: mg.codeaurora.org, ip: 69.72.42.4, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602607527; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=d2hJbnKC9PV4BSlG6tTkuPJv9lR8An14xmvtz3QXjCo=; b=Euigl7M9aAb3lLuiHTtygQrOLhfjC1aYCEYgPkMXGMCSjb7Mpx7XhWbiWLHHcMKuZwKcZonO
 nkGfyRsuqz7YPd7NGanpuK9l87fnYLb3TbW27aAZx1RVszuOAot0xP2Dz7pmPDO+UDkAOpVn
 cvi7bCrj+pdbbWffFoeH5Lyh2V8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f85d9a5d63768e57b1a6091 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 16:45:25
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 132D2C433CB; Tue, 13 Oct 2020 16:45:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hydlnxeng07.qualcomm.com (unknown [202.46.23.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B5B66C433FE;
	Tue, 13 Oct 2020 16:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5B66C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sbanerje@codeaurora.org
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: openembedded-core@lists.openembedded.org
Cc: Sourabh Banerjee <sbanerje@codeaurora.org>
Subject: [PATCH v3] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
Date: Tue, 13 Oct 2020 22:15:10 +0530
Message-Id: <1602607510-46491-1-git-send-email-sbanerje@codeaurora.org>
X-Mailer: git-send-email 2.7.4

Sanity checker reports following error for the PATH variable,
when bitbake -e <recipe> command is run in an extensible SDK workspace.
   PATH contains '.', './' or '' (empty element), which will break the build

In case of extensible SDK, PATH variable is formed with two consecutive ':'
as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty string.

This change adds ':' if BITBAKEPATH is a non empty string.

Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
---
 meta/conf/layer.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 38df0f3..9ff5fce 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -102,4 +102,6 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
 SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 
 # We need to keep bitbake tools in PATH
-PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
+# Avoid empty path entries
+BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
+PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' is not '' else ''}${HOSTTOOLS_DIR}"
-- 
$(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project')



-- 
Regards,
Sourabh
