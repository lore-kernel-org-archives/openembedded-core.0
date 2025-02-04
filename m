Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7D5C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:30:58 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web11.115798.1738675853906228318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=kjJKuoHJ;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=12385382e=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1738675854; x=1770211854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HzVZs24U7n6eeqSNmnA327Di8Swi7w0b2IXmVaNOsSw=;
  b=kjJKuoHJfBDh5wmhXHPLBiEDbX+SoqKx2GdxLDX3Q0UYQ9OMILEyl8pg
   UNnv2IN9sYtlqyc/vAovuZpzDFy6JKieEXioYUzx9Rr8rzY/THlZM31Hk
   +1U30en3quNxHqTb7hUudItR+Vmh65mRfOLC3Usjn0Wyor/I8aPfMu/r3
   Y=;
X-CSE-ConnectionGUID: MPlzWdapRAmnQnpUGiOrAw==
X-CSE-MsgGUID: 1htDVoUTQpi3Mb48P16KlQ==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Feb 2025 14:30:51 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
 04 Feb 2025 14:30:51 +0100
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 04 Feb 2025 14:30:51 +0100
Received: from q1054628.bmw-carit.intra (10.30.85.212) by smucmp12a.europe.bmw.corp
 (2a03:1e80:a15:58f::1:9) with Microsoft SMTP Server (version=TLS;
 Tue, 4 Feb 2025 14:30:50 +0100
X-CSE-ConnectionGUID: ay5oBitZQXa3Lqp9beyuiQ==
X-CSE-MsgGUID: 6eY/svjhSi+9qVePm80NZg==
X-CSE-ConnectionGUID: yeX1bVNSQiaR+HpMRrU7bg==
X-CSE-MsgGUID: 0CQEa7ywRGaCzGMsBIUDYw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] meta: Enable '-o pipefail' for the SDK installer
Date: Tue, 4 Feb 2025 14:30:24 +0100
Message-ID: <20250204133024.20546-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP08A.europe.bmw.corp (2a03:1e80:a15:58f::212c) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210791

When testing a Yocto SDK installer on Alpine 3.21, we recently ended up with a
broken SDK. One of the commands the relocation script calls in a piped
multi-command chain failed (see [0]), but the installer did not realize that -
since it doesn't use 'set -o pipefail'. Thus, the error was never reported to
the user and the installer claimed to have set up the SDK correctly - which
wasn't the case.

Given that the SDK installer is a POSIX-compliant shell script and that the
'pipefail' option used to be missing from the standard, it's not surprising that
it isn't used. Thankfully however, in June of 2024, a new version of POSIX
(POSIX.1-2024) was released - and that one finally includes the 'pipefail'
option (see [1]). A number of shells already support it, so let's enable it if
available to make the SDK installer more robust.

The change has been tested locally using SDK installers for internal projects,
based on both Kirkstone and Scarthgap.

[0]: https://gitlab.alpinelinux.org/alpine/aports/-/issues/16797
[1]: https://pubs.opengroup.org/onlinepubs/9799919799.2024edition/utilities/V3_chap02.html#set

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta/files/toolchain-shar-extract.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index a5c5d0444e..06934e5a9a 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,6 +1,11 @@
 #!/bin/sh
 
 export LC_ALL=en_US.UTF-8
+
+# The pipefail option is now part of POSIX (POSIX.1-2024) and available in more
+# and more shells. Enable it if available to make the SDK installer more robust.
+(set -o pipefail 2> /dev/null) && set -o pipefail
+
 #Make sure at least one python is installed
 INIT_PYTHON=$(command -v python3 2>/dev/null )
 [ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(command -v python2 2>/dev/null)

