Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27496.1792952334704607207
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=c/+vDNOq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20261025181851ac0dd5d56c00020724-j5dlm4@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261025181851ac0dd5d56c00020724
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DptLzR39Hz7wZETPur9ylLpgGGqOSAizOaIzNr8ev4M=;
 b=c/+vDNOqAXwLGn28hdDPkkP2ITvFemJYKIiGTX7iBm/y7SrrxgUH0OwIa8Y8MMfKxz4yMR
 UAUmWxP6PiiaKXJf04TcGfFxBKf5zwbvq7YuDtwptwoVnxzhXAHBmKT00VA8MJ4A5/D+tKk+
 Ex9QnaGIIGH1oMjWU2PbqydqUxCUhskZpnHZnmA3aNjp5z8owbQzEa3GhnnTSvUa8afbm9Oz
 BGkIRsC6AhMNIoAMSUycvSyClF7kBOL/9RtWze7xW3x4JflQrtmdCLGP/sl5PmO4r3qJ1jHk
 Q/IbFXJlXdc8GWCAzK0x2jrgKuw7EvtVOx6Xuy07FxPayusawyuzdVZQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/6] oeqa/selftest/esdk: pass only the image name to get_bb_vars
Date: Sun, 25 Oct 2026 19:18:28 +0100
Message-ID: <20261025181847.784113-3-adrian.freihofer@siemens.com>
In-Reply-To: <20261025181847.784113-1-adrian.freihofer@siemens.com>
References: <20261025181847.784113-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248617
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

get_eSDK_toolchain passes "<image> -c populate_sdk_ext" as the target to
get_bb_vars. This works only because get_bb_vars passes the target to
"bitbake -e" as is. The task does not change the variable values which
are reported by bitbake -e, pass the image name only.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/esdk.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/esdk.py b/meta/lib/oeqa/selftest/cases/esdk.py
index 7a5fe00a08..691a80cc8d 100644
--- a/meta/lib/oeqa/selftest/cases/esdk.py
+++ b/meta/lib/oeqa/selftest/cases/esdk.py
@@ -42,9 +42,7 @@ class oeSDKExtSelfTest(OESelftestTestCase):
 
     @staticmethod
     def get_eSDK_toolchain(image):
-        pn_task = '%s -c populate_sdk_ext' % image
-
-        bb_vars = get_bb_vars(['SDK_DEPLOY', 'TOOLCHAINEXT_OUTPUTNAME'], pn_task)
+        bb_vars = get_bb_vars(['SDK_DEPLOY', 'TOOLCHAINEXT_OUTPUTNAME'], image)
         sdk_deploy = bb_vars['SDK_DEPLOY']
         toolchain_name = bb_vars['TOOLCHAINEXT_OUTPUTNAME']
         return os.path.join(sdk_deploy, toolchain_name + '.sh')
-- 
2.56.0

