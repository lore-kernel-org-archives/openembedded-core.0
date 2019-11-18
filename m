Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id C19C07F8A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:46:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a15so20334338wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=M4ctuwA6cZs27fmHe6BG8al2Ng7rxmll+fGGZm4Bf/M=;
	b=mPheYBGy7AJJQE34JQMAAYW550m7zMmvWaaRrdaXK56dhjaVQoptQhX1w7ovXiQsrp
	p3lxWeMpTYPHpgz8eqb8rfJdk9yrwLJPrSJTaYnhYHR0eGxnB9pM2hwuzOY+brjUGeRR
	2pP9s65VGKfbkD+b8ybZiU4oPzmpuopmUXVeXs/V6pfvk+RGA2fDjLqSi3mpPPNcEtex
	RymCHt+if9D2KKoOTEzK6oZQiQticp2wO/Eq9UXnmdVu0+796vQQW07pE6PPiQeX8HjA
	F6MGLpd5ZKJOqJ46G8Ny8necS45VYCEeoq93EAqb2xAJU/lHscaJ8oN4aR0Tk7Vh8qWq
	DDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M4ctuwA6cZs27fmHe6BG8al2Ng7rxmll+fGGZm4Bf/M=;
	b=sH8FyDWaPbaB1n6+P//U2pzE64KYE4WMhoUasFF63gHPhjULcPiWvCVTnTaVMQu9X2
	acyrZhVKoBSMAxx3s9z1Q3dYPdfUDnq4her/SJeC5FiNncOJRmptjjNBhReTFbEkwWQl
	iPf7QXmsREmozAkS1F6zaiQVJBN2wO4R31QFQL2r+LOSCMlro+fVA5v+qXmaOBSluAZ6
	cQ5EgaGsyEdGd8iPmeVS5Rzy0XrmIbK6fei8glPIEW4qCtXlOcX4e/LktNDIB6RhTYEM
	IBpWa5kKQpyL4mrqO0wIxM10p8YzAQXBynkLh+bqma9rFaLrHoo/jwk6750POPDzFvg5
	XBmA==
X-Gm-Message-State: APjAAAXxGDq/WfiB2Zadq6tR0GO1YQceoYgR65pMIXJljta5oodd4vGK
	p98lR00KtKaHWgpjpXyIYso19NaBKRM=
X-Google-Smtp-Source: APXvYqxJKxhRpp/dtCmoUn88nRmfUi+nVt4yAAFNY25UHPqFOQR8EQi/tNUWP8TwbX/xQgx65GyyKQ==
X-Received: by 2002:a5d:67ce:: with SMTP id n14mr31034305wrw.67.1574095614265; 
	Mon, 18 Nov 2019 08:46:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y189sm20936208wmb.13.2019.11.18.08.46.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 08:46:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:46:43 +0000
Message-Id: <20191118164647.29409-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118164647.29409-1-ross.burton@intel.com>
References: <20191118164647.29409-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] cve-update-db-native: add an index on the CVE ID column
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
X-List-Received-Date: Mon, 18 Nov 2019 16:46:54 -0000
Content-Transfer-Encoding: 8bit

Create an index on the PRODUCTS table which contains a row for each CPE,
drastically increasing the performance of lookups for a specific CVE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index c15534de08b..08b18f064f0 100644
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
2.20.1


