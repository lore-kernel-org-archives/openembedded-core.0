Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0223B7FA88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:58:36 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b3so5012366wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 15:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sN8mTAXvhFbsewVbDOBqh3cEnNLgks6SCZUx5WU7qHA=;
	b=Sq9v1NsqrZ1dWv0w+9EXznj/t1pWtonw5XzqSg4sUwmzT8WQMIFh4RxsnQTJqhMrjc
	8cXGbLzQWIKSSzVS6+EcnwF04sxkt7Kc2mLc1azNPAi3uZzwJ2uCmKSP31DD+R3Wg+F6
	n6q6dX6m6kcVXPfmAxQLLjTpQj9s3X9Ea2fOI2hXmuE5mdR5klD2aI8ioMN/5L7G+Pj0
	tacwFcSTytJeSnxemUEbAOwN7K6Rxpyz67ABnd8LlyMfVCVmEszOj3ZjD+Gqrz0Vvhvv
	JVEGc85+NIFBXRSb1vnDhYhGN5n8wlPJs0oRlAqdrPTmA5cCJ72P2Qq9ARi8pbg3+8du
	OetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sN8mTAXvhFbsewVbDOBqh3cEnNLgks6SCZUx5WU7qHA=;
	b=oM+X7mNXYHzAWdiZjxXJ0wybxCCYx2/ixs25mW8y13JfvOEdwX9oJ4QA1OWc5Gy5YR
	GvWFheUUE8HSpvLTwSQA82VltBkrcjxM43CsiVoY1+FaKEe/zPgN+X24lvvw91arpRB9
	uElNi9uf01O8/yrBqJtK677TWtB7zNkEiTqIDFZAchGCUhQNtpfKxRJRKeJYu6NamRiR
	pOfzeKyBockv+delxdzcUt/o9ylb3un2AUYROLmdMGSEab/lblXHXZON9bsuMjk+v1Ne
	ijob3cwXrwYag9jCESQ+oxmTj9LvDloS18jHQ8C07Qq7GA0JHR9MXr79Bwn3c4UOsBuS
	yh+Q==
X-Gm-Message-State: APjAAAX8mlqWfOBkE+YbegRz7XXQZEWLb7n5wLC9NVV/MAjKKZGxj0MG
	hbztu6kpK6oXkjUgcoRrA+QimS5Zscg=
X-Google-Smtp-Source: APXvYqxjryAi/elOyHnDybcAFFB6Zlm2jDfTztynzFqwt9PoCddzpI5DuUMxPkl4/1cJxlhSGRMdXg==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr5856315wrq.79.1573171117563; 
	Thu, 07 Nov 2019 15:58:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f13sm3702821wrq.96.2019.11.07.15.58.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 15:58:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 23:58:29 +0000
Message-Id: <20191107235830.26644-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107235830.26644-1-ross.burton@intel.com>
References: <20191107235830.26644-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] cve-check: we don't actually need to unpack to check
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
X-List-Received-Date: Thu, 07 Nov 2019 23:58:37 -0000
Content-Transfer-Encoding: 8bit

The patch scanner works with patch files in the layer, not in the workdir, so it
doesn't need to unpack.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1c8b2223a20..3326944d791 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -62,7 +62,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check after do_unpack before do_build
+addtask cve_check before do_build
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
@@ -70,7 +70,6 @@ python cve_check_cleanup () {
     """
     Delete the file used to gather all the CVE information.
     """
-
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
 }
 
-- 
2.20.1


