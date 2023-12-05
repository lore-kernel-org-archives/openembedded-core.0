Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E699C10DCE
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 17:18:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.82.1701796730193411001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 09:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEFFE139F;
	Tue,  5 Dec 2023 09:19:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BFA493F5A1;
	Tue,  5 Dec 2023 09:18:48 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: shin.matsunaga@fujitsu.com
Subject: [PATCH] Revert "cve-check: Modify judgment processing using "=" in version comparison"
Date: Tue,  5 Dec 2023 17:18:39 +0000
Message-Id: <20231205171839.1693642-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 17:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191850

From: Ross Burton <ross.burton@arm.com>

This change introduced a warning if version comparisons failed, but
this is far too common an issue in data that we don't control, so this
shouldn't cause a warning:

WARNING: automake-native-1.16.5-r0 do_cve_check: automake: Failed to comp=
are 1.16.5 =3D branch_1-9 for CVE-2009-4029
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m1 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m2 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m3 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m4\/m5 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m1 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m2 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m3 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m4\/m5 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m1 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m2 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m3 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare=
 1.14.2 =3D m4\/m5 for CVE-2011-0715
WARNING: automake-1.16.5-r0 do_cve_check: automake: Failed to compare 1.1=
6.5 =3D branch_1-9 for CVE-2009-4029
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2003-0577
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-0982
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-1284
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2006-3355
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2009-1301
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2009-1301

This reverts commit a1989e4197178c2431ceca499e0b4876b233b131.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 086d87687f4..5191d043030 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -375,7 +375,6 @@ def check_cves(d, patched_cves):
                         try:
                             vulnerable_start =3D  (operator_start =3D=3D=
 '>=3D' and Version(pv,suffix) >=3D Version(version_start,suffix))
                             vulnerable_start |=3D (operator_start =3D=3D=
 '>' and Version(pv,suffix) > Version(version_start,suffix))
-                            vulnerable_start |=3D (operator_start =3D=3D=
 '=3D' and Version(pv,suffix) =3D=3D Version(version_start,suffix))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for =
%s" %
                                     (product, pv, operator_start, versio=
n_start, cve))
--=20
2.34.1


