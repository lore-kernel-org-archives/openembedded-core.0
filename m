Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFEFD64074
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 05:22:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7479.1765948962288892754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 21:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H0qt6D1w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444662dbf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH1bQYm1219900;
	Tue, 16 Dec 2025 21:22:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NpLWk7Fw6FG9q29wMbPZTd0Xhy/H1Ea/toCWyQ5BzWo=; b=
	H0qt6D1wsb6FoppLKYHeN9oqHhBvE+cUBLosw5smsaPU7AMbaj4k6BFCDkgUHqjS
	3WOgTaaknn9SgY5n6jpUBlSL5e5nz9yllpPmDaeLbDBuVpgBEdBanQL37yTdDZ73
	UhcaEu23uax1kcRBDFLYWiO4PLv8FnSzPq48WIB6SPeHB06zQ1mHM3oh93rdrqpT
	7YZZVX8YvGpB22pH7uS4+TCHoNS2Phc4N6wDAMtWFEEM9yub/0s7U9dySfDkDPNX
	3NCLmBQC81upHCzEm8FNmSFhD6MK9BkRo2eGR+WBIA37jhJNZOwlX5hUnqJLXF4u
	N5RFprXIRdeNS99ar5WSGA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0sg55p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Dec 2025 21:22:41 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 21:22:40 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 21:22:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <paul@pbarker.dev>
Subject: [OE-core][PATCH V6 2/2] rootfs-postcommands.bbclass: fix adding 'no password' banner
Date: Wed, 17 Dec 2025 05:22:40 +0000
Message-ID: <20251217052240.3400449-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217052240.3400449-1-Qi.Chen@windriver.com>
References: <20251217052240.3400449-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tkMBTpQp9qijCJj7J7f5M14h00k4FMmo
X-Proofpoint-ORIG-GUID: tkMBTpQp9qijCJj7J7f5M14h00k4FMmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA0MSBTYWx0ZWRfX85w6qVOnyW/K
 j5/i/ZvpZ73Zc7BmoFU/s9/6Tx4FS67XMzka4P6aYs7tJjTtz4BpAlbuvp3k1sH7Qw0DOuqdDdG
 9O+zfTqOHapAMcR5jCcWTse/j9e6gjBftTTcBm7qk9IO74UyzX7oo1Oas7tHFYwORYYsq3GLpEC
 blHohEKLurAL7qkYfhkMv003vKve/hbESbbxjfO/yKlt5wP6GcKFsa7a2SbzLTYkn/va6HI3d1A
 uD0L2HsCDT1zkV3fPqnZu6sG2WemoBnZpD1azl0091F6W3dE75iHJ+UqdYdlF5N5r1pEhkq32cs
 LFc7gmoUcnH80dtbIuogcexnJ9Yt0rdBkYOUbLmoBbIAgFfd+L6A6/KSLYsUzjC9Hq3YkqSZ+45
 2qHpZbHJt333ObnNrnJxL9enMOWPXw==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=69423e21 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=0kx6w0X72yRMwSFDy18A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 05:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227997

From: Chen Qi <Qi.Chen@windriver.com>

It's possible that users use EXTRA_USERS_PARAMS to set password
for root or explicitly expire root password. So we need to check
these two cases to ensure the 'no password' banner is not misleading.

As an example, below are configurations to make an image requiring
setting a root password on first boot, but without having to first enter
a static initial password:

  In conf/toolcfg.cfg:
  OE_FRAGMENTS += "distro/poky core/yocto/root-login-with-empty-password
  In local.conf:
  INHERIT += "extrausers"
  EXTRA_USERS_PARAMS += " passwd-expire root;"

Adding such banner is only meaningful when base-passwd and baes-files are
installed. In case of container image, they might not be installed (e.g.,
container-test-image). So add extra checking for it. With the above logic,
we avoid breaking the following oe-selftest test case:
containerimage.ContainerImageTests.test_expected_files

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index f4fbc4c57e..2a36840f29 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -5,7 +5,7 @@
 #
 
 # Zap the root password if empty-root-password feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "add_empty_root_password_note", "zap_empty_root_password ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "", "zap_empty_root_password ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "allow-empty-password", "ssh_allow_empty_password ", "",d)}'
@@ -58,6 +58,9 @@ inherit image-artifact-names
 SORT_PASSWD_POSTPROCESS_COMMAND ??= "tidy_shadowutils_files"
 ROOTFS_POSTPROCESS_COMMAND += '${SORT_PASSWD_POSTPROCESS_COMMAND}'
 
+# Check and add 'no root password' banner.
+ROOTFS_POSTPROCESS_COMMAND += "add_empty_root_password_note"
+
 #
 # Note that useradd-staticids.bbclass has to be used to ensure that
 # the numeric IDs of dynamically created entries remain stable.
@@ -259,8 +262,14 @@ zap_empty_root_password () {
 # This function adds a note to the login banner that the system is configured for root logins without password
 #
 add_empty_root_password_note () {
-	echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
-	echo "" >> ${IMAGE_ROOTFS}/etc/issue
+	if [ -e ${IMAGE_ROOTFS}/etc/shadow -a -e ${IMAGE_ROOTFS}/etc/issue ]; then
+		rootpw="`grep '^root:' ${IMAGE_ROOTFS}/etc/shadow | cut -d':' -f2`"
+		rootpw_lastchanged="`grep "^root:" ${IMAGE_ROOTFS}/etc/shadow | cut -d: -f3`"
+		if [ -z "$rootpw" -a "$rootpw_lastchanged" != "0" ]; then
+			echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
+			echo "" >> ${IMAGE_ROOTFS}/etc/issue
+		fi
+	fi
 }
 
 #
-- 
2.43.0


