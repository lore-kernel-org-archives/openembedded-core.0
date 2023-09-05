Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFF5C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 10:54:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18441.1693911263352821081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 03:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB6811FB;
	Tue,  5 Sep 2023 03:55:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF96D3F64C;
	Tue,  5 Sep 2023 03:54:21 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cve-exclusion: review the last of the historical kernel CVEs
Date: Tue,  5 Sep 2023 11:54:20 +0100
Message-Id: <20230905105420.3273603-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 10:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187204

From: Ross Burton <ross.burton@arm.com>

Review the last of the historical kernel CVEs.  Issues which are
specific to other platforms or distributions are ignored in the kernel
recipe itself, whereas general security concerns like "ICMP leaks
information" and "USB has flaws" are ignored with more details in the
extra-exclusions file as before.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 21 +++++++------------
 meta/recipes-kernel/linux/cve-exclusion.inc   | 12 +++++++++++
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index cfee028e5ba..fcef6a14fb8 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -53,24 +53,17 @@ CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-34=
18 CVE-2020-2981"
 CVE_STATUS_DB[status] =3D "upstream-wontfix: Since Oracle relicensed bdb=
, the open source community is slowly but surely \
 replacing bdb with supported and open source friendly alternatives. As a=
 result this CVE is unlikely to ever be fixed."
=20
-#
-# Kernel CVEs, e.g. linux-yocto*
+# Kernel CVEs that are generic but can't be added to the kernel's hand-m=
aintained cve-exclusion.inc
+# or machine-maintained cve-exclusion_VERSION.inc files, such as issues =
that describe TCP/IP design
+# flaws or processor-specific exploits that can't be mitigated.
 #
 # For OE-Core our policy is to stay as close to the kernel stable releas=
es as we can. This should
 # ensure the bulk of the major kernel CVEs are fixed and we don't dive i=
nto each individual issue
 # as the stable maintainers are much more able to do that.
-#
-# We have a script (generate-cve-exclusions.py) to have correct CVE stat=
us for backported issues,
-# but the data on linuxkernelcves.com isn't 100% complete for the older =
CVEs.  These historical
-# CVEs need review and typically linuxkernelcves.com updated and then re=
moved from here.
-#
-
-CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_HISTORIC"
-
-CVE_STATUS_KERNEL_HISTORIC =3D "CVE-1999-0524 CVE-1999-0656 CVE-2006-293=
2 CVE-2007-2764 CVE-2007-4998 \=20
-                              CVE-2008-2544 CVE-2008-4609 CVE-2010-0298 =
CVE-2010-4563 CVE-2011-0640"
-CVE_STATUS_KERNEL_HISTORIC[status] =3D "ignored"
-
+CVE_STATUS[CVE-1999-0524] =3D "ignored: issue is that ICMP exists, can b=
e filewalled if required"
+CVE_STATUS[CVE-2008-4609] =3D "ignored: describes design flaws in TCP"
+CVE_STATUS[CVE-2010-4563] =3D "ignored: low impact, only enables detecti=
on of hosts which are sniffing network traffic"
+CVE_STATUS[CVE-2011-0640] =3D "ignored: requires physical access and any=
 mitigation would mean USB is impractical to use"
=20
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/C=
VE-2021-20255
 CVE_STATUS[CVE-2021-20255] =3D "upstream-wontfix: \
diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 28f9c8ff2b6..78576339432 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -1,3 +1,15 @@
+CVE_STATUS[CVE-1999-0656] =3D "not-applicable-config: specific to ugidd,=
 part of the old user-mode NFS server"
+
+CVE_STATUS[CVE-2006-2932] =3D "not-applicable-platform: specific to RHEL=
"
+
+CVE_STATUS[CVE-2007-2764] =3D "not-applicable-platform: specific to Sun/=
Brocade SilkWorm switches"
+
+CVE_STATUS[CVE-2007-4998] =3D "cpe-incorrect: a historic cp bug, no long=
er an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=3D356471#c=
5"
+
+CVE_STATUS[CVE-2008-2544] =3D "disputed: not an issue as per https://bug=
zilla.redhat.com/show_bug.cgi?id=3D449089#c22"
+
+CVE_STATUS[CVE-2010-0298] =3D "fixed-version: 2.6.34 (1871c6)"
+
 CVE_STATUS[CVE-2014-2648] =3D "cpe-incorrect: not Linux"
=20
 CVE_STATUS[CVE-2016-0774] =3D "ignored: result of incomplete backport"
--=20
2.34.1


