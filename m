Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D27B76080F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 09:43:10 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id q83so94962164iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3LfokzNj8XMagQcZ5YVWFMACh0hnw0D+007YzbmDvjQ=;
	b=UHqY9yj1p3UBIMGZlYB2PhQN9j+GBP2HrYaY3fZ4mbGCW3KopJQgs0X1YpmDZnXTdc
	eBzBKywzLeNuJagQHM0zwXmEfMCr4AqMxLgI7N0aGepF1gBa+IMXWw3ru0wstkWDTdH+
	R4+fFjpwzmkfOQ0gvYOd4g/oZDtL8zSJAUQvMT8WVlY9SXGn8Mjvez/4GXp3azBjCHEP
	ANeXswWEX7rwK/rT3abT9deLo3Gx5MVHW4BTDsriM7D/vl2JaweM1WvB7AuNqb9v4yQF
	udIZCWRBtN5JtCZBY5xR4WRoCGadUBP4SE5Hx3CrjGmvsJoKC9cJkf2OLzAAa+3TmY/P
	T2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3LfokzNj8XMagQcZ5YVWFMACh0hnw0D+007YzbmDvjQ=;
	b=mD3lISI2vMq4mq18WY+6Uvs4c7Oy3npVbJOFA6SiMKjXeBBkDMuQeS77LhMG5RrRoR
	n2mRLoMFSIl05icmQ8g6wPKLXse07uDtWnVa64iQ9iK+oA7CHpmx6WSYxb7TcgMuRsO+
	xgm6E5inejQrp2TmuVdeDOLBGskZ6ATvmVrHdBZbo0p4xeJ9sS23XD5FiKD/gUnbzcxD
	/FmmL4xUCfLWCGb94scvk3knxrSM9QVlt/EIaamktYyg+Mar4jgKPwAXxEosOrFN1Wo5
	KKy6Gme0o6Wstf1DCL9lw1UjD8PQEZlNr2zOeAnuwCkgLeNr+jEdGknFyZpL31MvfBXo
	3p9Q==
X-Gm-Message-State: AEkoousY5uxfucrg6wTAIzJFY/jTR6FkZi9Do9zDsJ9/uTr73D4VTP01lsOrlbh+e1Gz6MIV
X-Received: by 10.107.47.152 with SMTP id v24mr37331504iov.154.1469698990973; 
	Thu, 28 Jul 2016 02:43:10 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C97F.dip0.t-ipconnect.de.
	[93.232.201.127]) by smtp.gmail.com with ESMTPSA id
	n190sm4625562ion.42.2016.07.28.02.43.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jul 2016 02:43:10 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 11:43:02 +0200
Message-Id: <59d8aa02834a80f62cb13e0437a5ee167570bbd4.1469697989.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1469697989.git.patrick.ohly@intel.com>
References: <cover.1469697989.git.patrick.ohly@intel.com>
Subject: [PATCH 1/1] useradd-staticids.bbclass: trigger reparsing when table files change
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
X-List-Received-Date: Thu, 28 Jul 2016 09:43:12 -0000

This addresses (among others) the following problem:
- USERADD_ERROR_DYNAMIC=error causes a recipe to get skipped
  because a static ID entry is missing
- the entry gets added to the file
- using the recipe still fails with the same error as before
  because the recipe gets loaded from the cache instead
  of re-parsing it with the new table content

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/useradd-staticids.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 149245b..46d4a4b 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -285,6 +285,19 @@ def update_useradd_static_config(d):
 
         return ";".join(newparams).strip()
 
+    # The parsing of the current recipe depends on the content of
+    # the files listed in USERADD_UID/GID_TABLES. We need to tell bitbake
+    # about that explicitly to trigger re-parsing and thus re-execution of
+    # this code when the files change.
+    bbpath = d.getVar('BBPATH', True)
+    for varname, default in (('USERADD_UID_TABLES', 'files/passwd'),
+                             ('USERADD_GID_TABLES', 'files/group')):
+        tables = d.getVar(varname, True)
+        if not tables:
+            tables = default
+        for conf_file in tables.split():
+            bb.parse.mark_dependency(d, bb.utils.which(bbpath, conf_file))
+
     # Load and process the users and groups, rewriting the adduser/addgroup params
     useradd_packages = d.getVar('USERADD_PACKAGES', True)
 
-- 
2.1.4


