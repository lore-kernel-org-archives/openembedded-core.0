Return-Path: <net147@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8D8771F9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 12:14:17 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g202so6636613pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Dc+UiOqYOE7bUQ786Kad3amhjN/HolnapMXrPiDDBww=;
	b=vDqlTZZ83HlCUEfUeBMmF76OZom2iLe8vrP477meX5pWsItiERu+UOQJnN6umXI3V4
	u7FNz127hDf08Oi92IiMbm7jsyiRlLBpgz5r4fFPLVgHxSAcvDDSx6raEDX17GwKr+0K
	SdlQyaRCg2Yq0p4ItjVPV5EsyFSIId1/50fZV3DZ/pLEgbRRVs/qGU2OPjFbQR+y7P66
	N+dNQVvS5SzMFRsrKIh3m5mVuHRTWCf1fsVLLAOB5VnzFU0W9C/sx7urgxQ8+/1Qp2k6
	mxS+0pISp205Zwk5Td7G19P3wcQjiJe0PjZLEfBRq2yYWbswZqAkM0W1uA+2gbNXfw8T
	AEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dc+UiOqYOE7bUQ786Kad3amhjN/HolnapMXrPiDDBww=;
	b=Jn8dqlpjOgLZSOhUY3MfFObp2ik66X8+nNATcoMMYTgKig/M/8GJiML1LuulX19NRI
	Cz9mzS/+ZeofuaHoCa4MyjDCvIHFpd6UUEO74cVb0Ul4+pOpzYsm0manOoWo+e2PwhuO
	88rMqHm6Xzh8J4SHy7zMUSP+2Z3C++zAGyxx7AeYm6VFo/XhlVafcYKnazhZ8qMP+2mg
	Xl0J7RStqXGMTdpaotXGEquRyzBXP2sWQwfa6jLmfnqruAEORKsmnWzHjkwx7Skk64pI
	fg+TG8+BEu1AKv1Cef7WWlws+wHu/ahH6DXiscUNwp2cj4NBTjWUl2FL9qZRqKG6cTuJ
	T79Q==
X-Gm-Message-State: AE9vXwPrCUDp0pXbPJlNHCMB0FxYimP2iaRaqktJlrgqPxG5uZTxwCGhszbt2RzCLhBvGg==
X-Received: by 10.98.79.213 with SMTP id f82mr13100010pfj.64.1473596057929;
	Sun, 11 Sep 2016 05:14:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	t7sm17493891paz.21.2016.09.11.05.14.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Sep 2016 05:14:17 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Sep 2016 22:14:16 +1000
Message-Id: <20160911121416.31304-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] image.bbclass: Do not expand variables in IMAGE_CMD vardepsexclude
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
X-List-Received-Date: Sun, 11 Sep 2016 12:14:18 -0000

This fixes tashhash mismatch errors creating images when IMAGE_CMD
references a variable whose value is always changing even though the
variable is specified in IMAGE_CMD vardepsexclude.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8c8b8a2..f85ea86 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -441,6 +441,10 @@ python () {
         localdata.delVar('DATETIME')
         localdata.delVar('TMPDIR')
 
+        vardepsexclude = d.getVarFlag('IMAGE_CMD', 'vardepsexclude', True) or ''
+        vardepsexclude += ' ' + (d.getVarFlag('IMAGE_CMD_' + realt, 'vardepsexclude', True) or '')
+        for var in vardepsexclude.split():
+            localdata.delVar(var)
         image_cmd = localdata.getVar("IMAGE_CMD", True)
         vardeps.add('IMAGE_CMD_' + realt)
         if image_cmd:
-- 
2.9.3


