Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2342A78094
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:43:41 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id c11so32099425wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QIvgjjGXJ95J3qpwc640ajU7eHGfuauru7dV+gfkerU=;
	b=BhMjLnLEvwVgcMiBxz77CO3qg0unDX6UlxWJh2GF13Y5+UzFOved2ZwkSAwb3FlQvf
	RwWnr6eXa8YIPYxFzcWFuYjFzp5YC5WK2x/a7ki1REh+3/JIx3R344AmN9APnLFZTMxE
	oFvF62FSj7RuvFREBtq+vpbDWz7Q5lmwhgmNNuBMkTyvhuVJ/U8HrVOnTCvjfRa75oHS
	WrdU4E2E0q+mUW4X1AsqmR5XEODqseE73KsMFwIFxYgcgSQKLkHsSNWu8mZb6pJg+CPU
	8OZIs7fhwY6/lNw80o4Ct3yq0QeG9NMK2iQxFcb869JHvbIftPXkU2SXtmTXq8sWCWa0
	jlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QIvgjjGXJ95J3qpwc640ajU7eHGfuauru7dV+gfkerU=;
	b=cP1Hzrm/MOYCh96v6JSIJ94XL0oK/UI9FFtSF0n3v3EHsyV6afowbEdf/PEx76CVdo
	2FQT4S1CswcpiyhmXLHKnk0dRvJppAXCZQO4dy28IdBHAakkvHMBJ8tuQ4jKb80uwJ+C
	mrCfsrn81QaPrrDdTu794GCKuIA62O+x8rGPJgPehhNUlDueyCdppNqdWZ3WeXVMt7yt
	nxjFSvd+7ZOb5pYPNt/Kg87Y4LkJ/XaC3VNnbMN81AIIw7ZTKDVr5Ow/DpEU+Zk/m0lG
	thiv9GxA6MkWCSYg0bgdjoQj8KFILaHjQGn4Yqj11zqUuP/TIx9jSjEDs1G8h+ViJHUr
	Je3g==
X-Gm-Message-State: AIVw111fGAvzGdt05SV+5B5S6B6noB/d1ok9kCOiy8ejyLO4DQo9amEA
	h+lp/G3KUwJ3zbzwXUw=
X-Received: by 10.28.157.205 with SMTP id g196mr2616339wme.84.1499863422303;
	Wed, 12 Jul 2017 05:43:42 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r70sm2800052wmb.16.2017.07.12.05.43.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 05:43:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 13:43:29 +0100
Message-Id: <20170712124331.12444-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170712124331.12444-1-ross.burton@intel.com>
References: <20170712124331.12444-1-ross.burton@intel.com>
Subject: [PATCH 3/5] ccache: let ccache create CCACHE_DIR, reducing hash changes
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
X-List-Received-Date: Wed, 12 Jul 2017 12:43:42 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ccache.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 9f1b1f45e34..960902065c4 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -9,6 +9,3 @@ export CCACHE_NOHASHDIR ?= "1"
 
 DEPENDS_append_class-target = " ccache-native"
 DEPENDS[vardepvalueexclude] = " ccache-native"
-
-do_configure[dirs] =+ "${CCACHE_DIR}"
-do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
-- 
2.11.0


