Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id DFA877FDCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:22 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ep17so3167568pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8Le6d7C523lNb84zEbuxPQle3X0mR+I5HfoAKRveFIs=;
	b=aCdfNsG38KCFe8j9XkrxvlnTM/OLCTYXorhcmHF8A+WMYBhIyIjSmd96Bw50vico2D
	WZiybBCmaCXCwr/MivQXXL5Au2G1++ryskDV90eoARC9xZAUF1sDBWcN+j69C2dYxHRi
	qtVd2lFvHWuXh0r+ynq8RGcry6JTmup+jh6fdD6iaf5Xav5tOWBNb+cbN3+kGLJ3DjQO
	X33jzUxITVQw2OO0P6AXd/P9wiPMIXO5ww8abTzyRQMxGReLkbDDgIzaVAawNOOa1TvV
	t+kaqbHbp2iHKbG7Dh0bf6LgcyvhoZ7eABbQcwUA6jdouYYBJqNLiAUunNaiKSzKMuY3
	5PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8Le6d7C523lNb84zEbuxPQle3X0mR+I5HfoAKRveFIs=;
	b=FMrneETUu7YK4PdjAx7lptlzAQYECOROloENTqtERkML0E+qg4c6XTN0uIuc+lWdfp
	pmOuC2pXGhsO0TNuXD/4ZAqrnluFaRbNf46kcRJdWJcAs0KJJbH44nQ9eN+s6s0ueQWw
	LEX2GjvDnZNpLck/FfOQk1xA6fOwWhaghNsnCNpfoLhjpLtIdzD3szWWw033/SOk9geZ
	92xqk91PjTk1UabmE/cKDu4Vnyi0e8l26o3k2rw0NWZim9SbqD4MszOd6zxnEuwYFXap
	wo5o0yp3cHYIF0bzHnUgKPgSR5DI0AUncG1Edd9r5dQUqRgGfKK75UMZWZC32xj1JXQf
	/39A==
X-Gm-Message-State: APjAAAXRNWB6Z5HhC4OqugYeEaD4NxtKsu6VRCputVeWWUKaMn5VFhub
	C9nyoFAIHQU8aNeRYVnAspPrJd+DKy8=
X-Google-Smtp-Source: APXvYqyU+7FuDHP9zhR8rtF29/qQS5BVZeNBd7spoZWq5reGcoyivxhFDmAUXrHk3n3J4z1KhlEWSw==
X-Received: by 2002:a17:902:b08d:: with SMTP id
	p13mr1884999plr.109.1576512023861; 
	Mon, 16 Dec 2019 08:00:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:02 -0800
Message-Id: <27ee95bd1ec2076509cfc2230eadb876fb35d6c2.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 12/18] cve-update-db-native: add an index on the CVE ID column
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:23 -0000

From: Ross Burton <ross.burton@intel.com>

Create an index on the PRODUCTS table which contains a row for each CPE,
drastically increasing the performance of lookups for a specific CVE.

(From OE-Core rev: b4048b05b3a00d85c40d09961f846eadcebd812e)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


