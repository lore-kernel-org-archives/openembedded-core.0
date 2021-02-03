Received: from so15.mailgun.net (so15.mailgun.net [198.61.254.15])
 by mx.groups.io with SMTP id smtpd.web09.11739.1612369248403093486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 08:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=uYlet/+R;
 spf=pass (domain: mg.codeaurora.org, ip: 198.61.254.15, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612369248; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TWXNi8zJxWU+Ip4418ME8yu/70DgZPwcigHJTw58HUw=; b=uYlet/+Rit/igLDmWDzmXn4ImP4PlyzN1bSeX/KzBB5IypiOtSQx2aCOFrAj3sN2oHiJXgpf
 A6MoehR5/9JtP/JAVML04BhNEhj44Gf/AeDVX+alq3fUcKp/oLjvqpp8F39QdNLJvD/5ccTW
 D5usZSMfoslluy4pA5RywIgI5Sw=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 601acd5f59782fb516394379 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Feb 2021 16:20:47
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 6D4E9C43462; Wed,  3 Feb 2021 16:20:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hydlnxeng07.qualcomm.com (unknown [202.46.23.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 88A4CC433ED;
	Wed,  3 Feb 2021 16:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88A4CC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sbanerje@codeaurora.org
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	vkraleti@codeaurora.org,
	ndeche@codeaurora.org,
	himalg@codeaurora.org,
	Sourabh Banerjee <sbanerje@codeaurora.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [Dunfell][PATCH] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
Date: Wed,  3 Feb 2021 21:50:23 +0530
Message-Id: <1612369223-5608-1-git-send-email-sbanerje@codeaurora.org>
X-Mailer: git-send-email 2.7.4

Sanity checker reports following error for the PATH variable,
when bitbake -e <recipe> command is run in an extensible SDK workspace.
   PATH contains '.', './' or '' (empty element), which will break the build

In case of extensible SDK, PATH variable is formed with two consecutive ':'
as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty string.

This change adds ':' if BITBAKEPATH is a non empty string.

(From OE-Core rev: 05a87be51b44608ce4f77ac332df90a3cd2445ef)

Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index d593492..2d9cd05 100644
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
2.7.4



-- 
Regards,
Sourabh
