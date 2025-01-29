Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6131C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:35:45 +0000 (UTC)
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
 by mx.groups.io with SMTP id smtpd.web10.10565.1738150318763245854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ai0867.net header.s=transip-a header.b=aEmIdPJu;
 spf=pass (domain: ai0867.net, ip: 136.144.136.11, mailfrom: ai@ai0867.net)
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4Yjg3c1YGYzTPNcK
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:31:56 +0100 (CET)
Received: from ansuz.ai0867.net (ansuz.ai0867.net [IPv6:2a01:7c8:bb01:991:5054:ff:fe2e:6d57])
	by submission10.mail.transip.nl (Postfix) with ESMTPSA id 4Yjg3b1sQtz2nC0cg
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:31:55 +0100 (CET)
Received: from ai by ansuz.ai0867.net with local (Exim 4.97.1)
	(envelope-from <ai@ai0867.net>)
	id 1td6IU-000000005Kp-3d8f
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jan 2025 12:31:54 +0100
Date: Wed, 29 Jan 2025 12:31:54 +0100
From: Alexander van Gessel <ai@ai0867.net>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] busybox: Change symlink locations to match alternative
Message-ID: <Z5oRqr5sBh8FuUFi@ansuz>
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=ai0867.net; t=1738150315; h=from:subject:to:date:
 mime-version:content-type;
 bh=Vg3HVBi878giR/My1rBto7YjvbSUmaApoSOTQxL3fWA=;
 b=aEmIdPJudg0qIazHFtaiWPkshOaqQ/7kx6zhs4NfN/ltFsrNo/YU6QUbOKMWGgz7q9GKRK
 ZvkBdhhTzUSHu1X3aZnSfTbkgSwGDKwL3GiJnPNWOMC1EI8Xi1QdVZZU8A0O6M6fQj0c5B
 ubQ35dyf3IivKgj/kHLxLmBRl/K5JYDej/TzyRNu+7UZmOaqYE4zxGdDBbuYZy3Q70VN8o
 ALZHXSUngUR2c2EzmvPwRs4M2ydaP5SFDuoQv0sq3rQSa8C292gZXGK3KdE99k6qV0OcRr
 uTYKHzHvCWic7+ssKoZAEmZOG0KxpLED5JEyBlD9U/4Nd34BD4d5wgDT6fCLPg==
X-Report-Abuse-To: abuse@transip.nl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210377

Change the symlink locations of start-stop-daemon and base32 to from
BASE_S?BINDIR to S?BINDIR, to match dpkg and coreutils, respectively.

Related to bug #14804 [1].

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14804

Signed-off-by: Alexander van Gessel <ai0867@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index cebfd3c48c..638b40c758 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -222,10 +222,14 @@ do_install () {
 	sed -i "s:^/usr/bin/:BINDIR/:" busybox.links*
 	sed -i "s:^/usr/sbin/:SBINDIR/:" busybox.links*
 
-	# Move arch/link to BINDIR to match coreutils
+	# Move arch/base32/link to BINDIR to match coreutils
 	sed -i "s:^BASE_BINDIR/arch:BINDIR/arch:" busybox.links*
+	sed -i "s:^BASE_BINDIR/base32:BINDIR/base32:" busybox.links*
 	sed -i "s:^BASE_BINDIR/link:BINDIR/link:" busybox.links*
 
+	# Move start-stop-daemon to SBINDIR to match dpkg
+	sed -i "s:^BASE_SBINDIR/start-stop-daemon:SBINDIR/start-stop-daemon:" busybox.links*
+
 	sed -i "s:^BASE_BINDIR/:${base_bindir}/:" busybox.links*
 	sed -i "s:^BASE_SBINDIR/:${base_sbindir}/:" busybox.links*
 	sed -i "s:^BINDIR/:${bindir}/:" busybox.links*
-- 
2.45.3


