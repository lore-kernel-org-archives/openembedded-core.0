Return-Path: <nkela@cisco.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Feb 2017 18:25:09 UTC
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	by mail.openembedded.org (Postfix) with ESMTP id C421260745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1013; q=dns/txt; s=iport;
	t=1487096710; x=1488306310;
	h=from:to:cc:subject:date:message-id;
	bh=Uz+rZ1QbMozYcpuVpJpAS3jDvGrckDP5tre5Dj5bM98=;
	b=Vul44NyLsLzioNO/clrtdrEMC+mZYgmZg6p8dAjfn8cqPb+9IcCokZpH
	xoiTwnYsxsChYLsJGFIXvhiP7hGvGRrfGa2d+BLMvQVKFH04HiEQ2raKk
	dPR5scgp35UNLw+C19/YGlNQ5DbnRsIVLWAzqcj70eurmkA2A8c9cIbAV I=;
X-IronPort-AV: E=Sophos;i="5.35,162,1484006400"; d="scan'208";a="211573735"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
	by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2017 18:15:39 +0000
Received: from sjc-ads-4850.cisco.com (sjc-ads-4850.cisco.com [10.28.39.114])
	by rcdn-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id
	v1EIFcGL027758; Tue, 14 Feb 2017 18:15:39 GMT
Received: by sjc-ads-4850.cisco.com (Postfix, from userid 323395)
	id B3D93B7E; Tue, 14 Feb 2017 10:15:38 -0800 (PST)
From: Nikunj Kela <nkela@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 18:15:28 +0000
Message-Id: <1487096128-20725-1-git-send-email-nkela@cisco.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] relocate_sdk.py: skip debug files from relocation
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
X-List-Received-Date: Tue, 14 Feb 2017 18:25:10 -0000

Debug files only have debug symbols hence don't need
to be relocated. Relocation script throws errors when
run on the debug files. This change skips these files
that have zero size.

Signed-off-by: Nikunj Kela <nkela@cisco.com>
---
 scripts/relocate_sdk.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index e47b4d9..c752fa2 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -103,6 +103,8 @@ def change_interpreter(elf_file_name):
                fname.startswith(b("/lib32/")) or fname.startswith(b("/usr/lib32/")) or \
                fname.startswith(b("/usr/lib32/")) or fname.startswith(b("/usr/lib64/")):
                 break
+            if p_filesz == 0:
+                break
             if (len(new_dl_path) >= p_filesz):
                 print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
                     % (elf_file_name, p_memsz, len(new_dl_path) + 1))
-- 
2.5.0


