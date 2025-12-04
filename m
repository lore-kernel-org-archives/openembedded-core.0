Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38305D1D899
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 08:32:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38820.1764837145209928168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 00:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bW7WObEh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44334587b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4763uh911639;
	Thu, 4 Dec 2025 08:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=M3xZnso6e0c8L6CLpg8jDGpTqwRsxxuJb73aXY3tefU=; b=
	bW7WObEhY+5KHCI3XhvL7KOkTv6jPXLwHmtIVtnxcFZttiUvaLKeBT76IsxJmsxE
	+YxtV8balMdEkmFlJB88noXNMuruINlIJZpfy7mO9ONYXm9DM6r7kG8PuQN+XvKX
	XVYsAZz3p7wU0mjhStAMc1dasJqMZqyRPTI/qLByNhmnKccDPn+nIf+TsOV0j1St
	0q5kBiN27V1iDPoZezsY8oV+lPSkmMhkActlu27ybOWSxJhPs53Ks8/cwQ3WYQg7
	C5+D6/VgwlBhbHJ+UQUbaKfQp+zt7esXzg+4++6BkrKPOB94wTYDaVNdFY2La6e7
	RUianpoHKRgeqYn7rULcKQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6e4q5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Dec 2025 08:32:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Dec 2025 00:32:08 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Dec 2025 00:32:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding 'no password' banner
Date: Thu, 4 Dec 2025 08:32:08 +0000
Message-ID: <20251204083208.1046464-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204083208.1046464-1-Qi.Chen@windriver.com>
References: <20251204083208.1046464-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2OCBTYWx0ZWRfX9RkRYzFxnFSn
 SKbiNPCPYvQ6ssfldRL99hqrafYpQa1eWEgaKGDe6URjDsTwJMuHCleuJGR0XNdcZhrgCMjFzxq
 iR9FahWDQUsf490aYvDsx9DMle03V7F/JH63mCl1B96OzQhglPWsP8QPtUjZywsvMl+FfIenju2
 o65vpSk9+2tteEa8SfaSNW+2duLMwpH5+5m3/lzwL5wh4zw3MRh1g0qo6vbRTAdCBlYN7qHomOz
 jXfO6I4HZJrR7X3pF/olL0fBj6n5Nwvw3dX8NI1FvpWW6R5AmuiOZHBAG4DDuQipLiFjLvgOX0U
 +Da98Vcu+Xd3eCf3MisPD877pzedSEZvbTYRexezoOoHBNkSsXeL4G2T3ZejUz7IbyoWpmPcXoF
 wrprrQ+ApZYz+pWxLB9wVXNv9wOO0g==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=6931470a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=MkTlg00Ot9B_tvrZbC4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: T50dYOuL4s9cswrSLg0yhcpNteSjmF1M
X-Proofpoint-GUID: T50dYOuL4s9cswrSLg0yhcpNteSjmF1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 08:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227276

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

Besides, adding such banner is only meaningful when base-passwd and
baes-files are installed. In case of container image, they might not
be installed (e.g., container-test-image). So add extra checking for it.
With the above logic, we avoid breaking the following oe-selftest test case:
containerimage.ContainerImageTests.test_expected_files

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index f4fbc4c57e..8d7e5e7652 100644
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
@@ -259,8 +263,14 @@ zap_empty_root_password () {
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


