Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 584506D15F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 09:23:13 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id el20so4406877lab.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=KrkNKfnraP4jVFkR+YlJ4hWGtz9+JeGTCJJTT2U3z/Y=;
	b=h70dvGSQ/H1dYhexgL3t9WYVNKZ3yvIFGTITlIinSGpTDIBKnDszLQ1UMcdUq5YooR
	NVh8m86Y61UjX0P9SIRmYm3droCduSL5n6WeggU95dMZSSMlmAJkMKib/Keoff8o6yUC
	imRelM5Q80mdFZGYLD92Z5+wjXyRASGuPP+7dEc/JWLRe9xpZoBK0RLzwooraHTYREdl
	7FVZEC4NpqW8d17L7O+8q3c83QcFHt0HyXs0xQ0nbPjNeGq84Jj4/Z4AJfD1l+q/sJp2
	X/lEVolA8+qX1ZAENy9LckREOswIoaSnuCP+AjQw+tcyz+Ehc0N1OPKItKN0HTkqZ8SQ
	k+VA==
X-Received: by 10.112.198.39 with SMTP id iz7mr7322846lbc.24.1382865794401;
	Sun, 27 Oct 2013 02:23:14 -0700 (PDT)
Received: from skeletor.greyskull (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id u18sm8840199lbp.4.2013.10.27.02.23.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2013 02:23:14 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2013 10:20:29 +0100
Message-Id: <1382865629-29145-1-git-send-email-jacob.kroon@gmail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH v2] update-rc.d.bbclass: Fix host/target test in postinst
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
X-List-Received-Date: Sun, 27 Oct 2013 09:23:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running the postinst script I get a shell warning:

sh: argument expected

and the service is never stopped. This patch fixes the warning
message and stops the service.

Patch v2: Hans Beckérus pointed out that the patch is not correct.
          This version uses the syntax proposed by Hans. I've tested
          that the postinst script works correctly when run on the target,
          both when the init script exists and when it doesn't exist.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/update-rc.d.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index e14659d..9437e9c 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -16,7 +16,7 @@ updatercd_postinst() {
 # test if there is a previous init script there, ie, we are updating the package
 # if so, we stop the service and remove it before we install from the new package
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
+	if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
 		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
 	fi
 	if [ -n "$D" ]; then
-- 
1.8.3.1


