Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 69B4872B9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:56:00 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k11so14203762wes.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZoicRvy+rt7n2YKitCnaE1miZx4WPr1KRX9zWT4IK88=;
	b=UqwK3agUy2iPlB1+FjdU1lZSIeVAv2PhKG61s77f3PBDyHqNJVmnrPTzxAzH2P/OEm
	VmI+2HPQLOBcDMoDdmj1hLlKrC3V3j7fIxk/PjgY7+mvbMfqYarRMO2zp8L7EYpghKZd
	S1sHskBZIL64ehVh8a/2rqgmi3FDcB9wU8Uw45CXtaJZZe2/xzU2l7Ac16Ty9cnaM6oD
	uBnRT3qDFMrYNijp3Q5RSYBm0Ha4WJL+4coJNzjS1tJJzQPySRIBbv2+TYgMZ1adP1ut
	Qu3ZkHYjVIprIlc4SbvVigPkWVNOgijaLSuXWWBnWk+9HfuOt6VgLvH5Mto6WtKeAovH
	Yrig==
X-Gm-Message-State: ALoCoQkpc3S0Xr/D7v7AabMgS4l0LEd/FWqmV3Ats1YWFHhAoaxSwYNAG2Au0JZCwonzaxdUYVL3
X-Received: by 10.180.98.138 with SMTP id ei10mr60085266wib.32.1421322957013; 
	Thu, 15 Jan 2015 03:55:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.55.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:55:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:16 +0000
Message-Id: <1421322860-12652-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
References: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com, Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/8] perf: Add libdw unwind support to perf-libunwind feature
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
X-List-Received-Date: Thu, 15 Jan 2015 11:56:01 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

perf can use either libdw or libunwind dwarf unwinders, or neither.
The perf-libunwind feature implies that if disabled, neither should be
used, so have it disable both libdw and libunwind DWARF unwinders if
disabled.

This fixes [YOCTO #7129].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d2c9805..bd57c6c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -64,7 +64,7 @@ B = "${WORKDIR}/${BPN}-${PV}"
 
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
-LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1',d)}"
+LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1',d)}"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
-- 
1.7.10.4


