Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 033A56D134
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2013 22:41:54 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id ea20so4203450lab.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2013 15:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ewW10gfRaUzYtVVKFokfBBbHtzRihNB8eEQQXpjcCoc=;
	b=rZhcWaZVvosttBKm72NRqWq/U0UNx2seuUQwnlIWHCdMRf5LP5gPtw7Wats1ASwsKo
	DfOekcDLeLxnZqcLn4ZY/nelepn7IPjsa10TokCxx7vq2rT3D3skDJMQZBwDW388OVHg
	CE28b9/1WZ88KVMO+K0Ql23MpVfRzk05qPBRRXlXdlv5RDcVnpghdIYQbpGUn2w2WFy5
	c9dEq66Kdl3txAYwpxkvuXrsHdF/aOXjdZMFPQR4sciX1iuh+efmhQl4xrvz0Lw1A6X1
	u6XubTMg7mwiQuuU5j0thPzp8ifL/Fjae51cpUv/x8OhK2Dy+346paPPac/ycLNV0xX4
	lwxQ==
X-Received: by 10.152.22.97 with SMTP id c1mr6266352laf.31.1382827316086;
	Sat, 26 Oct 2013 15:41:56 -0700 (PDT)
Received: from skeletor.greyskull (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id u20sm7393437lbh.7.2013.10.26.15.41.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Oct 2013 15:41:55 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2013 00:36:57 +0200
Message-Id: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] update-rc.d.bbclass: Fix host/target test in postinst
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
X-List-Received-Date: Sat, 26 Oct 2013 22:41:56 -0000

When running the postinst script I get a shell warning:

sh: argument expected

and the service is never stopped. This patch fixes the warning
message and stops the service.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/update-rc.d.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index e14659d..835b717 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -16,7 +16,7 @@ updatercd_postinst() {
 # test if there is a previous init script there, ie, we are updating the package
 # if so, we stop the service and remove it before we install from the new package
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
+	if [ -z "$D" -a "test -f ${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
 		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
 	fi
 	if [ -n "$D" ]; then
-- 
1.8.3.1


