Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C6DA67FAA5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:58:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so4364895wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 15:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Cmq6F7kofldvo7dFqvfcQdjOLuAEqxo2Ly99Wk7oQd0=;
	b=1ZvVMCVmPfiFTdw/XeYcZ8rxcQLFUl/uV/h+2JrP+Ror3JV4/rW0aMZeLrcpdSZA1e
	rX1zsDqrQgzesyYDbkrJ374PEVbZSv8Ao9Xv5luxMrv8vS+o37e1lyaGSe5XsP/uMqA2
	+7HZZAhzBRoXDfgsI74mYppWFt7iqRDfPTM925er3WuvC3QmrOJFP5miWP4JDcdkke1s
	pm0rueqDITsMP0Y5sFSPAtWFYcda1W2TIWvbXavHAbSepHUkfmgu9xaROM4+FYfJbJqT
	dPsQPuH7vInv2DaaS+qBbOq11n/HjgB9CpD6LjamApSnxGj8JvRBXBVcJey0bWwBqN2G
	hq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cmq6F7kofldvo7dFqvfcQdjOLuAEqxo2Ly99Wk7oQd0=;
	b=TIapQEz82EbvPC2qlA4qKD3kgLPaqN358XkPOs6xmSQf8vDkH8zUoIFwmigKIewrfW
	ZvyVjIRcsGb2PdDcyvOFQ8avpcMT1iCswLNOx7DpCAhVPxsyeu3ftkY86LWJPh3itp50
	9t/Ou3VJRfXajHMFA/X8yqMAsnxh6QNjdP8+pqJ3csjKbFRTzekvkat+Nn4+PIATZ0gk
	qmf509gLMnKNSA5XwssOXKU/8bbBRivxW6ZivKXoZDy3aUMl0XWV4etuqwlPl4BA4AaF
	aO3Lce3o/RIROpTDZw7j8NmIg70VX2CJTDFDuR1I9znGtBAhXd4VwLG+REoAYmQe1JiU
	M1IA==
X-Gm-Message-State: APjAAAWLBnPZZ9qRZx4IvshaGATCp7Z+M2j2ib0Pglx10vnSz3nwOvcE
	jsU0Z82sF5+K3BuIjFaE5joONDKDka8=
X-Google-Smtp-Source: APXvYqwK6ciwgBEOiDpSqU1eSPJIuYa0u71sGGSI2vHbdyFv7Tbl+e1GjW9y99vrauzw8Pykb89x6g==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr5746421wmi.114.1573171118399; 
	Thu, 07 Nov 2019 15:58:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f13sm3702821wrq.96.2019.11.07.15.58.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 15:58:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 23:58:30 +0000
Message-Id: <20191107235830.26644-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107235830.26644-1-ross.burton@intel.com>
References: <20191107235830.26644-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] cve-update-db-native: don't refresh more than once an hour
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
X-List-Received-Date: Thu, 07 Nov 2019 23:58:38 -0000
Content-Transfer-Encoding: 8bit

We already fetch the yearly CVE metadata and check that for updates before
downloading the full data, but we can speed up CVE checking further by only
checking the CVE metadata once an hour.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2c427a5884f..19875a49b1c 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -31,8 +31,16 @@ python do_populate_cve_db() {
     db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
     db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
-    proxy = d.getVar("https_proxy")
 
+    # Don't refresh the database more than once an hour
+    try:
+        import time
+        if time.time() - os.path.getmtime(db_file) < (60*60):
+            return
+    except OSError:
+        pass
+
+    proxy = d.getVar("https_proxy")
     if proxy:
         # instantiate an opener but do not install it as the global
         # opener unless if we're really sure it's applicable for all
-- 
2.20.1


