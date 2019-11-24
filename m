Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1757FC50
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:48 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id cq11so5612172pjb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Cg4ckRcTmWbznFYo1v+ip3JEdDP5iM/tv32hOxb5mXc=;
	b=Y5ghSVe/Eh+dbjaWzPMPl8PReaU97yq2WI3dUF5qOpaK02tvG/3MYbF9rhYAR9FNPq
	LibgDdFULmy4msChhFZEugaYetRtxrKAqYmfguM7kdOoVPEA3TT7mnh3InXS60rqRcw7
	0CP9liRpMHJtVhe1epy81itWsEuyl46S9Kqz59sm5sJ/asDrotR/bL8oBQSnT1UK0lOa
	JbIifYAHG1NRBWNyhMBw2ywL5ia59msSBfsb7IWjYNSCB03NedjvAvBi64xPgdJeYvwe
	QzU6q2yhQrWeVrnebd3T/o8e/Gxu9zKTXwK4aYAJ+avsTS3poLr561PWPMrSgINHMM4C
	2ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Cg4ckRcTmWbznFYo1v+ip3JEdDP5iM/tv32hOxb5mXc=;
	b=Va5sA8UStPUaQ553O+Cy6hGF0it+MqFKdHcVW5sSPK641CAJIQ3KfZE8uYXIafjzLe
	DPuxTNiha3+YHunhiHmEG0hS3xHJZeLhaY+AM561St7rDKgF05dZP3/dHRpNvZ33KrIn
	7sINjB6Rm/JFJyP6/F5I1ZkWUcxQOtAw4/L+d+eZyHWl/TYXHa4JjjnXffmrQLHcJAyH
	rbekayFZ14iiDJcysLV4HUvv38s1GV2nmV8ou8aAfV7cbOKqohkJB7B4gLQfhLI8g3Hf
	PZynv79rxNgpg6RpNTYZZupxSR+B0AvLrvSfa56S+3adIsLOO0rG8v+KOslqnsVsZN/o
	r8SA==
X-Gm-Message-State: APjAAAUCHRSClOWgOCYLfZnKB+2nMSYg6ttXsMRpvm0/aI9AG2KzoUAP
	hBuhVeLANmriOwLqofildyXNNkF2
X-Google-Smtp-Source: APXvYqydAl5riV22y+D1YoNFD6Qcr+wMgS6KFv5yVxsWB7Bt4UF3XYhPYS9WvQtE6+T5WAkFgZc4HA==
X-Received: by 2002:a17:902:bd03:: with SMTP id
	p3mr25075457pls.115.1574639449368; 
	Sun, 24 Nov 2019 15:50:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:11 -0800
Message-Id: <fabb573a0e221ae024aca3de0633439f94e5c17a.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 06/35] cve-update-db-native: add an index on the CVE ID column
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:48 -0000

From: Ross Burton <ross.burton@intel.com>

Create an index on the PRODUCTS table which contains a row for each CPE,
drastically increasing the performance of lookups for a specific CVE.

(From OE-Core rev: b4048b05b3a00d85c40d09961f846eadcebd812e)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index c15534d..08b18f0 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -120,11 +120,14 @@ python do_populate_cve_db() {
 
 def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
+
     c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
         SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+
     c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
         VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
         VERSION_END TEXT, OPERATOR_END TEXT)")
+    c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(ID);")
 
 def parse_node_and_insert(c, node, cveId):
     # Parse children node if needed
-- 
2.7.4


