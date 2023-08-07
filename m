Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D295CC04A6A
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 16:28:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39311.1691425693773196912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 09:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B83C1FB;
	Mon,  7 Aug 2023 09:28:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 389CC3F59C;
	Mon,  7 Aug 2023 09:28:12 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com
Subject: [PATCH 1/2] linux-yocto: extract generic kernel CVE_STATUS
Date: Mon,  7 Aug 2023 17:28:06 +0100
Message-Id: <20230807162807.4037215-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 16:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185609

From: Ross Burton <ross.burton@arm.com>

Some of the CVE_STATUS assignments are not specific to the version, so
move them to an unversioned file and include it in the recipes.

For example: some CVEs are disputed, or are specific to other
distributions.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc  | 10 ++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.1.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.4.bb |  1 +
 3 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion.inc

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
new file mode 100644
index 00000000000..42f1c195c9a
--- /dev/null
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -0,0 +1,10 @@
+CVE_STATUS[CVE-2018-6559] =3D "not-applicable-platform: Issue only affec=
ts Ubuntu"
+
+CVE_STATUS[CVE-2020-11935] =3D "not-applicable-config: Issue only affect=
s aufs, which is not in linux-yocto"
+
+# Introduced in version v6.1 7b88bda3761b95856cf97822efe8281c8100067b
+# Patched in kernel since v6.2 4a625ceee8a0ab0273534cb6b432ce6b331db5ee
+# But, the CVE is disputed:
+CVE_STATUS[CVE-2023-23005] =3D "disputed: There are no realistic cases \
+in which a user can cause the alloc_memory_type error case to be reached=
. \
+See: https://bugzilla.suse.com/show_bug.cgi?id=3D1208844#c2"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.1.bb
index a76d2dc4047..820475a9cf0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -3,6 +3,7 @@ KBRANCH ?=3D "v6.1/standard/base"
 require recipes-kernel/linux/linux-yocto.inc
=20
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.1.inc
=20
 # board specific branches
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.4.bb
index 443a89cc1ef..3a510fd168b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -3,6 +3,7 @@ KBRANCH ?=3D "v6.4/standard/base"
 require recipes-kernel/linux/linux-yocto.inc
=20
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.4.inc
=20
 # board specific branches
--=20
2.34.1


