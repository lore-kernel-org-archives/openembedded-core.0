Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4FE7FA88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 22:13:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l1so976576wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=M4ctuwA6cZs27fmHe6BG8al2Ng7rxmll+fGGZm4Bf/M=;
	b=Cdfiuow2q8I5EZQgaeuPn0sZAousQ1v8k4QEZp6twbVbZEJqH7+XSoD0m9WvabXL0Q
	jEMnyo3e183I4oDVBuvWNaLGXoe8pb4XUzqK+htjJI5FCrWli5dw890lzMPOiRm4mqAP
	gV4X3DYsO2JV9/iFWDITHrCA+AIcOWCxo24TRuDwIOu5QLwkQZxijOXJIjglTbzkRrcL
	Bw/pNeSKAdcu7b5ybrVSmR6k+oYlbTEqDOD8i1KYWbFa5In2TwncvDFAGfNgzti2qZuW
	yJAnlZMJtFl2CQsip0ZRIsaVJnctcrTrluyip/QL7d7qwNH6QNSJPwuKQFp0EDR7QpJf
	CdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M4ctuwA6cZs27fmHe6BG8al2Ng7rxmll+fGGZm4Bf/M=;
	b=QDHLFt1CPQYa6goksYjuYQXWZFCBVrXfDFMzpyrhhSJMSAxh9OqT5ow6hE3Bh3dkxp
	PvmNS8LIxxqcO0MKprMNdD6mp9BsDF6rUFbOFaHMUAGSnXlgygEFCWQc4COfGqPO4yV5
	wlatJD8Ty+uU9GrMbe4f1x/8fdVVhG56N6L8mzZld8KSKkjpJsqyly465hOanekYwEgF
	LHejzeXvOF0Uqwtm/A1emvi83E7+iSfu4XVci6AEGM9q9poGANzeKah5bD/HeMwPW4LI
	BcTKC92ophBzRM5idJxAoyhHhMBa+UUkCfoupqmfx3pVAv9JulxOxIg6yespN2/yAwCc
	SvZQ==
X-Gm-Message-State: APjAAAX9abqXoZEUZbQxlLpOXdhSHfuMPE/6E9y3Qy8LqdbtU4xk88aw
	lK1KOPpTNnq7tqEXIqpr6XMXMGRcG+E=
X-Google-Smtp-Source: APXvYqxuFe1pspPoxvEx3MXGqXFnm7WcgO57ZDxfyke+1LaNo020rNvordK0VKIar1TCH+xI1xFldA==
X-Received: by 2002:a1c:3843:: with SMTP id f64mr918722wma.129.1573510421797; 
	Mon, 11 Nov 2019 14:13:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d11sm24900083wrf.80.2019.11.11.14.13.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 14:13:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 22:13:35 +0000
Message-Id: <20191111221337.20332-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191111221337.20332-1-ross.burton@intel.com>
References: <20191111221337.20332-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] cve-update-db-native: add an index on the CVE ID column
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
X-List-Received-Date: Mon, 11 Nov 2019 22:13:42 -0000
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


