Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9947D3CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 08:14:42 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p13so15933218wru.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qQ5CCa9FRao6k5jJ9UWoNQ2dlCnptYqG7mP6sDNmSQg=;
	b=kfI5eSfQazOAVI+8EsiY/698CuwgmxaJRgKnAKIcaFGrTSXeJ408BTq4+XV14Lqm5X
	uPvovCsKRm5lwUHiTslR3fSzaXdMmhlDOiaRcc+6LXwGueYCGkc6QyQUycnGHMHYW+IK
	P9CLwZN3q3Y/gmJkH04/CCb5SUylCKw3R1ZN22MuTxdL8HUF6+ErB6gNXcVuWDWkTTP1
	KdrBFkZso4SH83EozzmM3IxXV1G/zfNK1LrdKF+seLE3IMISY83AVhl0EFWx8UudORMr
	YVljrFMM1Q6EueJROgi76lKoezP7KkD4WAGeJC7gYXB14vq/LV+mRpmaIIuRguj8hOHw
	0SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qQ5CCa9FRao6k5jJ9UWoNQ2dlCnptYqG7mP6sDNmSQg=;
	b=fq83RpmaYEy23Twc1CdEkT/zm5u/LzDUnvxNq6dX9l2sH4pRoPrCP290EtOT2ejklC
	RBU6cPEM/C26jrdjMIbAIssihTcTB4+IOMoRxgrwcRmpERZOA1f/BIReIBODk2RC0kt0
	mRISbKxdGN/lnpwLI+Dcv+er/44ZV79Nv1CiYghJ18cm3Wi6sJfVvgIrykdEov6a353E
	xBVgMlIkUsIxiMVk7BCuKX+KBAVWbCvYScDVbqaMKct0VWseiGc0OFmbbU/U7OD2h4PB
	/d/Gjb8mgizjEQD29glNkw9/IvCww+++2fwCCrJo35Uz/rXXh7je2NBEFOP+JGryBWYw
	abag==
X-Gm-Message-State: APjAAAUT9lS+nbl2W02MTg4P2/6wCVCiLW3myO9C2muHgZsGru+tiIly
	+uAwXX53+sMo2kX5LJ3zdIk5t9dQ
X-Google-Smtp-Source: APXvYqx5VL++NlZS3lWqVvXE9jfKNtMnWSy/C5KkuZaYcV450Hwj3bqjTZKbWHWcIa3uu1N9WnXsSQ==
X-Received: by 2002:a5d:69cc:: with SMTP id s12mr16588938wrw.174.1562573682815;
	Mon, 08 Jul 2019 01:14:42 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	g17sm12243420wrm.7.2019.07.08.01.14.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 01:14:41 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 10:14:23 +0200
Message-Id: <20190708081423.8849-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cve-update-db: Skip recipe when cve-check class is not loaded.
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
X-List-Received-Date: Mon, 08 Jul 2019 08:14:42 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index ae8f1a958b..cfeee91c2e 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -13,6 +13,11 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 
+python () {
+    if not d.getVar("CVE_CHECK_DB_FILE"):
+        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
+}
+
 python do_populate_cve_db() {
     """
     Update NVD database with json data feed
-- 
2.11.0


