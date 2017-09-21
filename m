Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B5EDA782D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 17:42:23 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m30so3784830pgn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Y8TQpQeHEuSDPV1ggSiPhMI2EHgmXPGA3/2gFt32nU=;
	b=VSkPEqqvzjaUMY+bRIL5eE2l4jruo32oLe1Yd0TuxFWRO5RbDQoXF4ioj80MoKW1mF
	81J3nKBRnSqU07nJo0GF1ZrKL2GQDwSKJs1AryUidTjTILr+FFxcyYnbB7kGJ2OKgTxt
	rKltxF5M7niO9enbObYKl2MbfsximvYbt+Rwck+blefBCAsbU0fqg6lU8cGxvUGZJ8VX
	y3+L7IWLYfb+EIWyoqVHDii4pJgnhlV0ukgKQt5+pHNa9t3LgZSrkTi114ZMEOw8zSFn
	8idJD+QMnx+xVmiv4w623+c2zZxrs/YsbyMWPaXhKVabDWcuI8wbZXQYpQgs0WIbBsBr
	FH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7Y8TQpQeHEuSDPV1ggSiPhMI2EHgmXPGA3/2gFt32nU=;
	b=Hhzdx6z+mYt80L6SD25DwxAXS1XJccfQBC9ojUoCeXuSmpqsiDogIpXLcA/qMhRvoW
	vBvzKCW1q1HO0TzsiRyg+PBhHEj7MYhDKr7ijRvMTW0x5cZwK3chpeykou/FXjA3iqVS
	U6LdwCVlKmde7W/KTBR4+uboOwAi+tk8nxFIKOAZ5DdtI28XtD3IvsUXDMQ1yZv041KA
	N2tw8Jksa6qGdifSS1vZPml2BM9+kNKlrtzHRLcAp6TWHtjzwii+6VBhV1UV811DbumQ
	K6yeBb6sdB5tXPC3Ra1hEr4pKthQ0vbpwIIO3iVOL9V5WcDUk/0vsOmx/jmf9QSwVWAG
	h3FA==
X-Gm-Message-State: AHPjjUgcwJgaSkwZYfeCGhWGQasQgDBlUkbNTf4Kp3HuiWPDVSrTtRpE
	SJPARN52Oe9GZJdz5uw0oQjNXA==
X-Google-Smtp-Source: AOwi7QC1pievFkSnLURohrkg0zKyoOycr7J4QnCSbAof7ajbuEXJ2o+dIsR6XrdgH0fYsUiYNkUacg==
X-Received: by 10.159.218.7 with SMTP id v7mr6448566plp.322.1506015744759;
	Thu, 21 Sep 2017 10:42:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	u20sm3241745pfh.171.2017.09.21.10.42.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 10:42:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 10:42:16 -0700
Message-Id: <20170921174216.33386-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170921174216.33386-1-raj.khem@gmail.com>
References: <20170921174216.33386-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] go: Remove mips32r2 from march to get cgo working
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
X-List-Received-Date: Thu, 21 Sep 2017 17:42:23 -0000

on mips, cgo used mips32r1 and that conflicts with mips32r2
lets remove it for now and work go upstream to make it work
for golang as well

Fixes
| # runtime/cgo
| cc1: error: '-mips32r2' conflicts with the other architecture options, which specify a mips32 processor

Fixes [YOCTO #12108]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-common.inc | 4 ++++
 meta/recipes-devtools/go/go_1.9.bb     | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index ce1eb86812..41f661bc4e 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -20,3 +20,7 @@ B = "${S}"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
+
+TUNE_CCARGS_remove = "-march=mips32r2"
+SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS = ""
diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
index 08ab793f86..c67e2cb050 100644
--- a/meta/recipes-devtools/go/go_1.9.bb
+++ b/meta/recipes-devtools/go/go_1.9.bb
@@ -1,4 +1,2 @@
 require go-${PV}.inc
 require go-target.inc
-TUNE_CCARGS_remove = "-march=mips32r2"
-SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
-- 
2.14.1


