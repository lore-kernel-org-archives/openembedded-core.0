Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD667E3E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:15:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p11so1639813wre.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xHvksOymvcsMa6d3Z5dpUTBl6nBEz5STUUOmpuFMCpo=;
	b=vXfQ3P+/qwEnadwNAMC+h8U0BOrhkKXUlgC6YdXfzC1Wox3RV2Hq2dVNhZcgLsxoxa
	iK8xA3iWfRsB7VqDTqBBoyI4w6x56g7oNoZLNwulOkDKW92oNqPoCgcs2asxp+CUP+8T
	768fa6/hk68h2TCZBkEq7rzLCxTq+UwAqgW/Xmr2qUGvtIPE5T9TINsBAmhqfIWKMotf
	DAK7qLpbYTZdzVFLBzMdBPxkHWdcfUfMs3DY3ewcbJbycFvvbP7LVjpB0SiQs0IciFTr
	sJoaEhlRtMbsZczx60ApbS3NcRkbm4OKnKB9det95cGolO6TD3lbJyG+o2aW98d8AGHF
	xb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xHvksOymvcsMa6d3Z5dpUTBl6nBEz5STUUOmpuFMCpo=;
	b=JJMrIGuHiPHLBoNjwo3i+WIWGAGd6x8VaKBg+41F3RK1zZphFCqrehoVwUGB92a027
	NJbAwKEECw11aII7REf9mpayP2oILrYbCQLOUJkQRZCjx4kpZBNjjgRAAOOQdlwDWX82
	GG9XUyg+GpXLFDP3SzeGiWvWMwKDcIbGIQ93I7Z56AYaPHtIqZULRBTXGes04438w0Xu
	SyDHZASPRRzVgoytF4UfrfT0P8d3zH93z+OJLKxaR7wtWeNVxeaAIF2HPOrepk8IcRu/
	OXHx5tY7s4Gf4s2QENn7U+1W23eSvmLycXjdE/4JT/I6SMJ/AHb+PkZ6+i1uV5kB9Wyu
	yHiQ==
X-Gm-Message-State: APjAAAUM6uVDJlF2Hqy0D6BC32thOBh6lh1EI4VqKzfcosjKjI+/yAcl
	BRRvaxZKxwG+m/PSvfaZyO5uO93l
X-Google-Smtp-Source: APXvYqzGnEv+a2OFBR7UHvlPnDk8ez/gzbhkXQtup/aHtjKU+03X1wmho3Bp8zTGTfHpPvPtOI3Ztw==
X-Received: by 2002:adf:e446:: with SMTP id t6mr2377976wrm.115.1561626945812; 
	Thu, 27 Jun 2019 02:15:45 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	f204sm6365800wme.18.2019.06.27.02.15.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 02:15:45 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 11:11:15 +0200
Message-Id: <20190627091115.5801-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH v2] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Thu, 27 Jun 2019 09:15:45 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

To be able to populate NVD database on a fetchall
(bitbake <image> --run-all=fetch), set the do_populate_cve_db task to be
executed before do_fetch.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 522fd23807..e096db7717 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -4,9 +4,12 @@ LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 PACKAGES = ""
 
+CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd-json.db"
+CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
+
 inherit nopackages
 
-deltask do_fetch
 deltask do_unpack
 deltask do_patch
 deltask do_configure
@@ -115,7 +118,7 @@ def update_db(c, json_filename):
 
 
 
-addtask do_populate_cve_db before do_cve_check
+addtask do_populate_cve_db before do_fetch
 do_populate_cve_db[nostamp] = "1"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.11.0


