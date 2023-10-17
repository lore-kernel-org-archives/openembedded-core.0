Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B449CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 16:54:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.224033.1697561633956776202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 09:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pp4ZLost;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D33420002;
	Tue, 17 Oct 2023 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697561632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+cAM61BAqqRmCukDYBVXPsSTgaqY2MbKg0sxox7tQqY=;
	b=pp4ZLostTkLItELGgSyJhkPDB0rmEOa85Tah+hDYXOPoqGpgAmQOU1W1eVwkBn+HN7gNBi
	P1KLpncg4ZcgR9C6PsajuAudyDl9JhJKG0/hsHkxjaV0G/BQjpxUDgTUPazvC6/MwMckMv
	dAZHzObkHpSmuJpD3X/rjiB+YHg5KAN0kUm7j0eDqCgYOqj1kY86f7TX93w9BsC1cW5LTP
	co9IEJ3ql6aVnf3doHqVtV5JeDCZ0PA+48vVkpE446k5GUk+vyRgYGiU4oxLClwu/vWvs5
	TMWTvj/MivS4ycqjFV3dk+PcMu38v860mdr3nTVbtZDFqzpkqO9NDpCJF4AujQ==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] strace: further clean up of ptest folders
Date: Tue, 17 Oct 2023 18:53:49 +0200
Message-ID: <20231017165349.30973-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 16:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189347

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Removing the out files removes about 350MB of data which helps staying
in the currently allocated ptest image space as we are hitting disk
space issues after enabling the parallelization of tests.

Fixes [Yocto #15220]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-devtools/strace/strace/ptest-spacesave.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index c5d8ff920789..4e86ccadc5b2 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -22,7 +22,7 @@ index 3540204..5e1e7c9 100755
  		$hdr
  		. "\${srcdir=.}/init.sh"
  		run_strace_match_diff $arg0 $args
-+		rm -rf log exp
++		rm -rf log exp out
  		EOF
  		;;
  
-- 
2.25.1


