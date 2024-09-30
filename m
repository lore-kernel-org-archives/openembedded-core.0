Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDF0CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 10:37:10 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
 by mx.groups.io with SMTP id smtpd.web11.51652.1727692624306215298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 03:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4XHHZ61VRZzpFB;
	Mon, 30 Sep 2024 12:37:02 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4XHHZ53nw9zJDT;
	Mon, 30 Sep 2024 12:37:01 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 30 Sep 2024 12:36:44 +0200
Subject: [PATCH scarthgap RFC] bitbake.conf: Add truncate to HOSTTOOLS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-6-11-kallsyms-truncate-v1-1-47fc9143fff9@cherry.de>
X-B4-Tracking: v=1; b=H4sIADt/+mYC/x3MQQqDQAxA0atI1gYmOkjtVcTFYKIN6lQmtljEu
 3dw+Rb/n2CSVAyexQlJvmr6jhlUFjC8QpwElbOhcpV3be2wQSKcw7LYbzXc0ycOYRfkB3tuR2r
 YE+R4SzLqcY+7/rr+wMnzf2gAAAA=
To: bruce.ashfield@gmail.com, Ross.Burton@arm.com, 
 openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 10:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205115

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some wic images need this command. Since it is part of coreutils, it doesn't really
cost anything to have in HOSTTOOLS and it avoids signifiant build dependencies on
coreutils-native.

[YOCTO #15571]

(cherry picked from commit 522000ce5c4f0201cbe42d7826b6a8489ed10117)
[necessary for building Linux kernel >= 6.11 with CONFIG_KALLSYMS, c.f.
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1472464c6248575bf2d01c7f076b94704bb32c95]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
The Linux kernel in its 6.11 release or later, with KALLSYMS config
enabled, will now fail to build because truncate host tools is
required, c.f.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1472464c6248575bf2d01c7f076b94704bb32c95

but the kernel recipe doesn't depend on coreutils-native, which is too
big of a dependency for what it brings according to Richard (for the
original patch destined to wic) and Bruce (as discussed over mailing
list for the linux-yocto recipe).

Let's backport a patch that was implemented for something else (wic)
from styhead/master as truncate is pretty much guaranteed to be present
on the host with hopefully no compatibility issues between
implementation.

Marked as RFC because it's a "big" change and I don't want the ML to
just gloss over it without questioning it :)

Note: I'm currently NOT building that kernel in my layer, but it'll come
at some point next year, though I did hit this issue when doing a very
quick test with a local tree.
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ba8bd5f975..78f15b76ae 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -521,7 +521,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
-    sleep sort split stat strings strip tail tar tee test touch tr true uname \
+    sleep sort split stat strings strip tail tar tee test touch tr true truncate uname \
     uniq unzstd wc wget which xargs zstd \
 "
 

---
base-commit: f888dd911529a828820799a7a1b75dfd3a44847c
change-id: 20240930-6-11-kallsyms-truncate-d8d4d9f16d41

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


