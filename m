Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id DE8797F874
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:05 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id bg7so1728798pjb.5
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SWEgxGGIJQpAHQdzzmiTVw+jmaRRPPxWW/CsXMjC2TE=;
	b=Cx9mTG9UBjcrYcYJe0lLmWY4BuhEdscLl6qFQT7W93Zvk/EGzrNwUP8jlt7n5HOs0c
	XzIQkwaKuy4FitwucouqSlFWf6+WpWZ6xcQ/42HG3j8HzYiOIJcKyZmhyIYVLNAfjgNx
	do8ZGXz0lnAFZSLrzfftTLq8VDktS+v0n4pVMFXTHzdN13v1gJBWadiyKIo9M4ryuBIA
	KKXvV1hqaJru7nOyij8LE9L9GgifjWLRRcmnonD5nK2TXJoT7BjnFGFiLzx/XhhBPymW
	+FuJmh6Zx1azLNaPFnp3NWOSDEFGncfjjn3ePOpvSXlrGgyWOXq2leSFBuDndsr7ypWI
	bw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SWEgxGGIJQpAHQdzzmiTVw+jmaRRPPxWW/CsXMjC2TE=;
	b=fKdEwG75abpkZKFctWBAoDa5ip2AsLoO5++pPZOwfJUiGWmnJGekLt9OPFjiMQFgHb
	qWdZSCChTiRww7qjzVq/KYISowo/icCEDlkZUjNZRev9xLa+XWao1bVNAL3bJH/41VSm
	N8hT6dyNcBI8gACbJZ0R8DwXJDkXpBezfGH8zw+m7KmfcbRGla/Sm0Wc7XHo3VtRTZW6
	ycf46j8OVyJXvi02kMaPrB/S7nyW0pPIewf0rDDJo0uFvKszgHeORx1nCsVcUUreFbKz
	Ev/pCM8cUOXaxBFCZ6sC4RKkkOW+oSftg4XMa0ZHZ4/BSYzP3+d+mjxBU47Ohv67sWu+
	aIgg==
X-Gm-Message-State: APjAAAXC5BFBLWULSQTg0cvi8aJIU1UjP2xfx54GdWP0/xs0g+E9gV7U
	uLRYc+6ULthFvLtRB/N8moFuaaT4
X-Google-Smtp-Source: APXvYqxSPvFMgfz3MlvRv//8fQzow5qJ3+r+VTqrhs72TLx6qnBDeAWPAZtXLFtamlhAn8/JY+V37g==
X-Received: by 2002:a17:90b:142:: with SMTP id em2mr7490079pjb.4.1579188066956;
	Thu, 16 Jan 2020 07:21:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.06
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:32 -0800
Message-Id: <9abd2b5c4ddfb98f3b8574954e1fd0e95a47ebcc.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 23/32] cve-update-db-native: add an index on the CVE ID column
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:06 -0000

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


