Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EF4C001B3
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 06:06:44 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.10885.1688537198134159766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 23:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: hayama@lineo.co.jp)
Received: from [172.31.7.30] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 3C79680354A98;
	Wed,  5 Jul 2023 15:06:35 +0900 (JST)
Message-ID: <7721242b-e23b-9caa-c0f9-34ee73415f5f@lineo.co.jp>
Date: Wed, 5 Jul 2023 15:06:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
Subject: [PATCH] systemd-systemctl: fix errors in instance name expansion
To: openembedded-core@lists.openembedded.org
Cc: Yuta Hayama <hayama@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 06:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183875

If the instance name indicated by %i begins with a number, the meaning of the
replacement string "\\1{}".format(instance) is ambiguous.

To indicate group number 1 regardless of the instance name, use "\g<1>".

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 514f747fe6..7fe751b397 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -202,7 +202,7 @@ class SystemdUnit():
         try:
             for dependent in config.get('Install', prop):
                 # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
+                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.25.1

