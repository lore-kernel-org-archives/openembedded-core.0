Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id F23F271984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 19:56:53 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id i6so4220077ywb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 12:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7YHToIxBKwsmhf7WE2POXFBbLkgt7SPQnw97H1ExweM=;
	b=EL5YJnmkhY73w0HExMQoZlDifyKZgJoYQmqzRlovRmv3p3ncjIvgJJD79OByEMy9An
	ps+kptYvLBspCmx7ry8RC7G12IqrUzBVVDnq6hdn6s5IRTInImxP6iEZJ8MjeSvCDc/a
	akiwJXUyLPdDNTHbyd9QbiS9UeVC9dFwpclRzDYaNYaDjsM4sO9I971XZQGqkyibsp/a
	1WNrWayerMInT8bZTxDFktCRgIzNbGz+R5OBAATCNLUHFx+E1gg7JUMnG3IYQkfO4hLM
	UdQwsWjh3fOfon81D69zce1cmtnwhAznrNkJP9RcrGgyDCLpBuZN3HEErWh/cGWV994L
	AreA==
X-Gm-Message-State: AIVw113OSpVUNBORC+PT8GQgxkG2Qd0OOWu2oEWGbXCsXBPxVMu6henN
	X+0YOIBjnAr4kiTp
X-Received: by 10.37.188.76 with SMTP id d12mr10052236ybk.193.1501012614774;
	Tue, 25 Jul 2017 12:56:54 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58]) by smtp.gmail.com with ESMTPSA id
	n187sm5287619ywf.76.2017.07.25.12.56.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Jul 2017 12:56:53 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 15:58:09 -0400
Message-Id: <1501012689-2574-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image: Fix "metadata is not deterministic" when chaining 2+ CONVERSION_CMDs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 19:56:54 -0000

When we have more than one CONVERSION_CMD being used, for example
ext4.gz.sha256sum we will see errors about "metadata is not
deterministic".  This is because we do not have a stable order of
intermediate files that will be removed in the generated shell command.
We fix this by calling sorted() on the set of rm_tmp_images so that we
will have a stable hash again.

Cc: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b095bca..dee17ae 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -474,7 +474,7 @@ python () {
         # Clean up after applying all conversion commands. Some of them might
         # use the same input, therefore we cannot delete sooner without applying
         # some complex dependency analysis.
-        for image in rm_tmp_images:
+        for image in sorted(rm_tmp_images):
             cmds.append("\trm " + image)
 
         after = 'do_image'
-- 
2.1.4


