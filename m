Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 172D178CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 17:05:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e7-v6so17418949wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LhaTToqYRmbxO3WRdABDSc8TV5N0DH86MNMTd4oFZjU=;
	b=RhvbFIhIknMCKNfMSFzUBObnnpwohbtkwes1MhptAscMVy9w+pMmJjfFs7qH+aaFqk
	F49bdrQUqkFMoPINpMXSVqIF7wOh+jh7hHNTHThwMLdYXdCM1PH+mtdGHedllnm72Dl6
	Q7zIWtbyl9k1wl5rgMw8DcJEImTgXnorSWmAwTmKwMZJ4rXBuGssFhYFvROEVBlFSnbQ
	0LiG2HHRwj8rLT8y+tEw78Q+vv5Si6rhBFODZvMLRy+3yUjBFL4CHAiHlgle8RCxe2Rs
	EjRaTV/n3UnB1fS0N+XAYGdZqcYnXlWT5SRBqFIg7/Bu1naR4U9nsuiU2afD4xQoOBBd
	xGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LhaTToqYRmbxO3WRdABDSc8TV5N0DH86MNMTd4oFZjU=;
	b=TyUw5CkGEZxEKVGXkfrdBYnEuqR7GJKtwRUY0Rwr/t4/KLeflm3Ry5itighefgjpvB
	rUivii1Ix9fUrsHVGErQmxOIhCWFFNP/ysqHVMky6p15cti3iUlt7H2km4SpAl6vlZ02
	gBkj88BGn4ae69s3lFLjMkR4VgyNQXYbfp+jQTcyHKDCMD2kMGFAdd7lc/hn0VzlgOEO
	0qKKCh4KWEaOPoMW0Ypg4zu22NQxLBCcnCNr5sm4p8X86NpX3VHL8SDb4w/4W9LrVJg2
	AJqVIeIjToBPEonbkHLw/SDfUwOa+5rwfZZtn1BGWETnnaof/tMtiInleVp9kE4ynGt8
	GKWg==
X-Gm-Message-State: AOUpUlEmme32WVjn36n0yeo+o3XCuMinqevdo/4kdJt40ScdUKwj4TxN
	Bo9WCk8IxfIM/3CETlR9i8vsqvea22Q=
X-Google-Smtp-Source: AAOMgpeQAW8etJGOiqi30xwFRXiIsxgbpVXYkHl6N3kjPyIDH4lguCWBMkLJeOoYNpV2yfTL/1e15g==
X-Received: by 2002:adf:84e5:: with SMTP id
	92-v6mr21739055wrg.56.1533056745358; 
	Tue, 31 Jul 2018 10:05:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b8-v6sm13920419wrw.22.2018.07.31.10.05.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jul 2018 10:05:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 18:05:41 +0100
Message-Id: <20180731170541.13620-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180731170541.13620-1-ross.burton@intel.com>
References: <20180731170541.13620-1-ross.burton@intel.com>
Subject: [PATCH 2/2] python[3]native: allow use of both native Python 2 and 3
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
X-List-Received-Date: Tue, 31 Jul 2018 17:05:45 -0000

Instead of both classes using ${PYTHON_PN} (which is set by python-dir and
python3-dir), hardcode the right values so that it is possible to inherit both
pythonnative and python3native at the same time.

If both are inherited then both native Pythons are available, but the last to be
inherited will be the one to set PYTHON.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/python3native.bbclass | 6 +++---
 meta/classes/pythonnative.bbclass  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index 89665efee8b..da12a714703 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -1,8 +1,8 @@
 inherit python3-dir
 
-PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
-EXTRANATIVEPATH += "${PYTHON_PN}-native"
-DEPENDS_append = " ${PYTHON_PN}-native "
+PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
+EXTRANATIVEPATH += "python3-native"
+DEPENDS_append = " python3-native "
 
 # python-config and other scripts are using distutils modules
 # which we patch to access these variables
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index 4cc8b2769c2..ae6600cd155 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -1,11 +1,11 @@
 
 inherit python-dir
 
-PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
+PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 # PYTHON_EXECUTABLE is used by cmake
 PYTHON_EXECUTABLE="${PYTHON}"
-EXTRANATIVEPATH += "${PYTHON_PN}-native"
-DEPENDS_append = " ${PYTHON_PN}-native "
+EXTRANATIVEPATH += "python-native"
+DEPENDS_append = " python-native "
 
 # python-config and other scripts are using distutils modules
 # which we patch to access these variables
-- 
2.11.0


