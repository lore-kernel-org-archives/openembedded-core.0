Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C1BD111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:25:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14293.1764566739988281222
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BDjQowPw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430bdac1a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B14mPnR1161487;
	Sun, 30 Nov 2025 21:25:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Jmm2WZO0xc3km1nA59jVqcRk9NYJcGjmi/WxH9yTyW4=; b=
	BDjQowPwgFTHSJ4Dh9nVDcdlEDRrKgGd7QCJIaoJ62MlCmZyh2g8f+uyqvHN9BZT
	qAErDHOV6WVCuhNUHUHwxHcxA/CA+gzzwSVYeD1W/+Y4TaKQeoecZNjDzIC7xN+v
	Wjkx+q/wh0M8gq7eDJiABFtJpbL4MzgamM0a4VLoOXYvikAHf9Tk6mZi56mfiEzE
	ezUQR4fhVdMmxXq7tU4VopLxVHun2LIJx0HhkmVsI4zVIDpAWnml48/Z13su6O5G
	sw8lmuDhImFIy1B1HOnepZNIgBTKlGPzZOfQLwS2IEBu0vV7uzFiPJkvE/R1VQRH
	7mD5H2MuLYArbNb5HFK8vw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05h6x9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 30 Nov 2025 21:25:24 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 21:25:24 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 21:25:24 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V4 2/2] rootfs-postcommands.bbclass: fix adding 'no password' banner
Date: Mon, 1 Dec 2025 05:25:23 +0000
Message-ID: <20251201052523.1222217-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201052523.1222217-1-Qi.Chen@windriver.com>
References: <20251201052523.1222217-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PpbIl7RtjuXICBMOV5XdX1hFaHc71t_w
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692d26c4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=UUVBzBPBGgh56k2lcE8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PpbIl7RtjuXICBMOV5XdX1hFaHc71t_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA0MSBTYWx0ZWRfX01TspHpyhvLr
 XemBVLXaNQBP3HGcFPaBE3rD65Sa/znrJ/OTmpMw6RMa5fZx4Ci9siTC0512ge1JV23K8EeCOTR
 ao68wHPiiKho9KCRVDp3/wnd3V9LfVeA1lHIVvMWG82JvG2waO1bartll5BbX5eEIkBQ7M9ifwg
 X/fNpQRXUAcPqqHsGXEV/1nw3qsyB7HChbduOvh8mPx3o+VzRDUcBA6DFGyjBZijPzMoUWZpjVp
 kp8Z+ohmyXkYiLenUfwGrii2Q2w7bu+AORUkqD034NtbRkOKk3Nz1sftPOphqtsdZo1K3ueBlt2
 2mMINLF8bnTVhSWtiirYd5Ns/ZXbQqVqxZRGDk/VBpaPatZxM6XVLotiB/yzMP1nEDTWzSmeSPj
 jaMNY6pGIXPpUEkVTAmdD0kQiS5QUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227114

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

Checking and adding such a banner is ensured to run as last steps of
ROOTFS_POSTPROCESS_COMMAND, regardless of IMAGE_FEATURES. In particualr,
we want to ensure that the function runs after set_user_group function
from extrausers.bbclass. So unlike other commands in this bbclass using
the '+=', this function uses ':append'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index f4fbc4c57e..f57782b87b 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -5,7 +5,7 @@
 #
 
 # Zap the root password if empty-root-password feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "add_empty_root_password_note", "zap_empty_root_password ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "", "zap_empty_root_password ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "allow-empty-password", "ssh_allow_empty_password ", "",d)}'
@@ -64,6 +64,10 @@ ROOTFS_POSTPROCESS_COMMAND += '${SORT_PASSWD_POSTPROCESS_COMMAND}'
 #
 ROOTFS_POSTPROCESS_COMMAND += 'rootfs_reproducible'
 
+# Check and add 'no root password' banner.
+# This needs to done at the end of ROOTFS_POSTPROCESS_COMMAND, thus using :append.
+ROOTFS_POSTPROCESS_COMMAND:append = " add_empty_root_password_note"
+
 # Resolve the ID as described in the sysusers.d(5) manual: ID can be a numeric
 # uid, a couple uid:gid or uid:groupname or it is '-' meaning leaving it
 # automatic or it can be a path. In the latter, the uid/gid matches the
@@ -259,8 +263,12 @@ zap_empty_root_password () {
 # This function adds a note to the login banner that the system is configured for root logins without password
 #
 add_empty_root_password_note () {
-	echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
-	echo "" >> ${IMAGE_ROOTFS}/etc/issue
+	rootpw="`grep '^root:' ${IMAGE_ROOTFS}/etc/shadow | cut -d':' -f2`"
+	rootpw_lastchanged="`grep "^root:" ${IMAGE_ROOTFS}/etc/shadow | cut -d: -f3`"
+	if [ -z "$rootpw" -a "$rootpw_lastchanged" != "0" ]; then
+		echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
+		echo "" >> ${IMAGE_ROOTFS}/etc/issue
+	fi
 }
 
 #
-- 
2.43.0


