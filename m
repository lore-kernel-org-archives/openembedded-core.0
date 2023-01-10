Return-Path: <openembedded@hetsh.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61044C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:11:46 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
 by mx.groups.io with SMTP id smtpd.web10.107698.1673367100879023135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hetsh.de header.s=strato-dkim-0002 header.b=TmpDa6Qf;
 spf=none, err=permanent DNS error (domain: hetsh.de, ip: 81.169.146.163, mailfrom: openembedded@hetsh.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673367097;
    s=strato-dkim-0002; d=hetsh.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+aD9ZRmmOW/20iqbU8dmvxMwc/cY42aYVCeqbArDTo8=;
    b=TmpDa6QfyTB0HdsqUOPSFaQtvT25sovUkboQpijodKAljPG4xiBUeptZdZEU7D8/OJ
    k3FpaiHJHYNa5EhgI10KXO9+hz9mGj17Tq3vpjVmge8gd/OrYOLnLFgxti33lysyHdLF
    KcbrywG3NX4IfigqbFc1SU8i3fbsv2SUdfmIYPDhP7tj9UySOsrYeaYw1widmuGKmGyq
    ZSJVCWLcpKklpTbOoedBGB7emvIyF4fqGvy2jkGr8CqMZ2hisQmMvdNDJl4nOagGgPYR
    JRME5YIKYnUPmHI9wz4wALvaUaJ+Xg3q//TYKfSlqOYdHAVwVbYJ13jxnrp/zbr8jDN/
    8rkg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":O2kGeEG7b/pS1EW8X2y7xyihuZgPME9HDAjhVnIUFMhcwSLHSb7X0Xp5m9VC1BPS30aBdQmy2jR6f1Z28X1BuYejAzHfGoR2r9iHS7BYJQ=="
X-RZG-CLASS-ID: mo00
Received: from laptop.fritz.box
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id R05be1z0AGBb6Oh
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jan 2023 17:11:37 +0100 (CET)
From: openembedded@hetsh.de
To: openembedded-core@lists.openembedded.org
Cc: Jan Kircher <openembedded@hetsh.de>
Subject: [PATCH] toolchain-scripts: compatibility with unbound variable protection
Date: Tue, 10 Jan 2023 17:11:18 +0100
Message-Id: <20230110161118.8527-1-openembedded@hetsh.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 16:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175719

From: Jan Kircher <openembedded@hetsh.de>

Fixed an error when Bash's unbound variable protection is enabled (set -u) and variable "LD_LIBRARY_PATH" does not exist.

Signed-off-by: Jan Kircher <openembedded@hetsh.de>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 3cc823fe63..fa658a6596 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -37,7 +37,7 @@ toolchain_create_sdk_env_script () {
 	echo '# http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80' >> $script
 	echo '# http://xahlee.info/UnixResource_dir/_/ldpath.html' >> $script
 	echo '# Only disable this check if you are absolutely know what you are doing!' >> $script
-	echo 'if [ ! -z "$LD_LIBRARY_PATH" ]; then' >> $script
+	echo 'if [ ! -z "${LD_LIBRARY_PATH:-}" ]; then' >> $script
 	echo "    echo \"Your environment is misconfigured, you probably need to 'unset LD_LIBRARY_PATH'\"" >> $script
 	echo "    echo \"but please check why this was set in the first place and that it's safe to unset.\"" >> $script
 	echo '    echo "The SDK will not operate correctly in most cases when LD_LIBRARY_PATH is set."' >> $script
-- 
2.39.0


