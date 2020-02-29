Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 3C291619D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1409; q=dns/txt; s=iport;
	t=1582963384; x=1584172984;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=uOveh3yrHGf2vQyTWn4b9U3c7R1+orEmVxJjXAch5Zo=;
	b=SoQftFLw22VZ6Lp7y8oNVz4S1G10v/B7CQqbZkwF4zegRwHknboz8yJx
	xd3djRmXOkMYqD/i0WtW0DU7OJ18mBYJ4aoPNNwax82DKvTM9p71vEptL
	jjyiaEc1FKc1jMa8I+ExHAdgH0plerklYumkMuHOFZYYP2QOBLUsB6vmC o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D9AABSGFpe/5RdJa1mGwEBAQEBAQE?=
	=?us-ascii?q?FAQEBEQEBAwMBAQGBe4F4MWyBByqUOpwnCQEBAQwBARsUBAEBhECCDCQ4EwI?=
	=?us-ascii?q?DAQELAQEFAQEBAgEFBG2FYoYcAUZJgQiDJgGCe607gieFSoR2gTiHR4ReGoI?=
	=?us-ascii?q?AhGOFEwUIhRoEmCGXeoJGglGFAI8IDBybMAEtqgsCBAYFAhWBaSKBWE0jFYM?=
	=?us-ascii?q?nCUcYDY4pARaORiADMI1AgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,499,1574121600"; d="scan'208";a="734199166"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	29 Feb 2020 07:55:57 +0000
Received: from kamensky-p53s.cisco.com ([10.24.32.162]) (authenticated bits=0)
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPSA id
	01T7toir004404
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Sat, 29 Feb 2020 07:55:56 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:55:46 -0800
Message-Id: <20200229075546.12713-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.32.162, [10.24.32.162]
X-Outbound-Node: rcdn-core-12.cisco.com
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] make: disable use of posix_spawn on mips
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
X-List-Received-Date: Sat, 29 Feb 2020 08:03:03 -0000
Content-Transfer-Encoding: 8bit

After make-4.3 migration child_execute_job function started
using posix_spawn function, which happens to be broken on mips.

It manifests itself as when make executed by root, it switches
real user id to wrong value because of some issues with direct
setresuid system call done in glibc __spawni_child function
through inline assemble and/or gcc compiling it produces wrong
code. I.e instead of passing -1 posix_spawn function incorrectly
passes 127 as ruid. Subsequently job started by make can fail
with permission issue because they run under wrong user.

For now workaround is used by explicitly disabling posix_spawn
call use by make on mips through configure variable.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/recipes-devtools/make/make_4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/make/make_4.3.bb b/meta/recipes-devtools/make/make_4.3.bb
index 70caf0ae16..5fa7059169 100644
--- a/meta/recipes-devtools/make/make_4.3.bb
+++ b/meta/recipes-devtools/make/make_4.3.bb
@@ -12,6 +12,9 @@ SRC_URI += "\
 
 EXTRA_OECONF += "--without-guile"
 
+EXTRA_OECONF_append_mips=" ac_cv_func_posix_spawn=no"
+EXTRA_OECONF_append_mips64=" ac_cv_func_posix_spawn=no"
+
 SRC_URI[md5sum] = "d5c40e7bd1e97a7404f5d3be982f479a"
 SRC_URI[sha256sum] = "de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82"
 
-- 
2.21.1


