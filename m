Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id D3BE47FD04
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:53 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id s7so4433334pjc.0
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SWEgxGGIJQpAHQdzzmiTVw+jmaRRPPxWW/CsXMjC2TE=;
	b=NfiTyPM6QBdaXlR241khnwBCyUFEqK1xGC+6O4AuR2DSA7S6JPRwBJcyNrEhOrYTGl
	nT9D+/Z3SWdAAxkLjuGjztp6CKdODYZDjSji1l/SUBLlrURmwVOf/gYYe26FeKS/Ikg+
	074wwLSMURkLnXfXwqDjD94J4FJeJ9tLdnlPUJSDLzpqAklfvQHF7z6xBYBBu5dEFULt
	5hCs4WTOn5D8kYmSqChbwq7PZ+ICShFrDi/mFjT+ydf6EaEslQEdAUf7or3IFbqt3ewo
	P4t7TAAYThtlEV0rr/Vkn2FNQPsHwDneiURHE/+xt9UUVUwJbEgGmXH6JKIbY47PMF/e
	zfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SWEgxGGIJQpAHQdzzmiTVw+jmaRRPPxWW/CsXMjC2TE=;
	b=AbihdNgjLe3xA7QF/s/W7HiomkeAawhguRruvizbppzHJf5qrPe43jugT6bpDgsRLH
	HS6X8WOzqDoSH9pELB9V50MDkUeJSi2JSFGGXh0IRVLRzPZHLv5yXY2bFcPo0yXqDu1h
	fvw6iYTHF4XMsfE+QFVGhjvjUjscITCvzSUblEF0u3ZtoRuz3YXNjFuUdw7K7Do/Lnb6
	gFLCpT+aLOb3TNqTGa/sOsq5+WQOMjwpehrUIT3Bk88WD/BnOzynJU/7ijdH+5z1ZC9x
	6nwIelsKLvjCJSZElXalCE3Zef5GrpEzCSFSydaG9uhkhczeaD6iyRg5NIpGc94GSy4b
	bDnA==
X-Gm-Message-State: APjAAAXlQWMkyDLvxYpdKuPWrHmWSC50vwUXramHZHCXQfYJZ3m+DWJW
	tJ3XXNr7Kup0TfcNesliXwGEWD+Q
X-Google-Smtp-Source: APXvYqxI5ZGF17fgCvHvRI3kx8U2KQXeAOdapvxP+ctMJkQKIJIMzqGo/uCF+f7FtzDEEpH5qhpGDQ==
X-Received: by 2002:a17:902:a98a:: with SMTP id
	bh10mr7823798plb.13.1578929454873; 
	Mon, 13 Jan 2020 07:30:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:18 -0800
Message-Id: <9abd2b5c4ddfb98f3b8574954e1fd0e95a47ebcc.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 19/28] cve-update-db-native: add an index on the CVE ID column
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:54 -0000

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
index c15534de08..08b18f064f 100644
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
2.17.1


