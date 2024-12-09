Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44832E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 13:19:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.101232.1733750333068170413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 05:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2073e4fa42=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B97SIm6013287
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Dec 2024 13:18:52 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3hcur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 13:18:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 9 Dec 2024 05:18:49 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] libpam: fix CVE-2024-10041
Date: Mon, 9 Dec 2024 13:18:26 +0000
Message-ID: <20241209131826.3859767-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: TaBdfwMZyCT5i0rb-gcGHQDLD9LKQxpm
X-Proofpoint-ORIG-GUID: TaBdfwMZyCT5i0rb-gcGHQDLD9LKQxpm
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=6756ee3b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=RZcAm9yDv7YA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8
 a=2GFxnkHHc1LUGy-WfuYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_10,2024-12-09_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412090104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 13:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208482

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability was found in PAM. The secret information is
stored in memory, where the attacker can trigger the victim
program to execute by sending characters to its standard
input (stdin). As this occurs, the attacker can train the
branch predictor to execute an ROP chain speculatively.
This flaw could result in leaked passwords, such as those
found in /etc/shadow while performing authentications.

References:
https://security-tracker.debian.org/tracker/CVE-2024-10041

Upstream patches:
https://github.com/linux-pam/linux-pam/commit/b3020da7da384d769f27a8713257fbe1001878be

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../pam/libpam/CVE-2024-10041.patch           | 98 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
new file mode 100644
index 0000000000..41949cbf2a
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
@@ -0,0 +1,98 @@
+From b3020da7da384d769f27a8713257fbe1001878be Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Mon, 1 Jan 2024 12:00:00 +0000
+Subject: [PATCH] pam_unix/passverify: always run the helper to obtain shadow 
+ password file entries
+
+Initially, when pam_unix.so verified the password, it used to try to
+obtain the shadow password file entry for the given user by invoking
+getspnam(3), and only when that didn't work and the effective uid
+was nonzero, pam_unix.so used to invoke the helper as a fallback.
+
+When SELinux support was introduced by commit
+67aab1ff5515054341a438cf9804e9c9b3a88033, the fallback was extended
+also for the case when SELinux was enabled.
+
+Later, commit f220cace205332a3dc34e7b37a85e7627e097e7d extended the
+fallback conditions for the case when pam_modutil_getspnam() failed
+with EACCES.
+
+Since commit 470823c4aacef5cb3b1180be6ed70846b61a3752, the helper is
+invoked as a fallback when pam_modutil_getspnam() fails for any reason.
+
+The ultimate solution for the case when pam_unix.so does not have
+permissions to obtain the shadow password file entry is to stop trying
+to use pam_modutil_getspnam() and to invoke the helper instead.
+Here are two recent examples.
+
+https://github.com/linux-pam/linux-pam/pull/484 describes a system
+configuration where libnss_systemd is enabled along with libnss_files
+in the shadow entry of nsswitch.conf, so when libnss_files is unable
+to obtain the shadow password file entry for the root user, e.g. when
+SELinux is enabled, NSS falls back to libnss_systemd which returns
+a synthesized shadow password file entry for the root user, which
+in turn locks the root user out.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=2150155 describes
+essentially the same problem in a similar system configuration.
+
+This commit is the final step in the direction of addressing the issue:
+for password verification pam_unix.so now invokes the helper instead of
+making the pam_modutil_getspnam() call.
+
+* modules/pam_unix/passverify.c (get_account_info) [!HELPER_COMPILE]:
+Always return PAM_UNIX_RUN_HELPER instead of trying to obtain
+the shadow password file entry.
+
+Complements: https://github.com/linux-pam/linux-pam/pull/386
+Resolves: https://github.com/linux-pam/linux-pam/pull/484
+Link: https://github.com/authselect/authselect/commit/1e78f7e048747024a846fd22d68afc6993734e92
+
+CVE: CVE-2024-10041
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/b3020da7da384d769f27a8713257fbe1001878be]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ modules/pam_unix/passverify.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/modules/pam_unix/passverify.c b/modules/pam_unix/passverify.c
+index 81b10d8..97a81d6 100644
+--- a/modules/pam_unix/passverify.c
++++ b/modules/pam_unix/passverify.c
+@@ -237,20 +237,21 @@ PAMH_ARG_DECL(int get_account_info,
+ 			return PAM_UNIX_RUN_HELPER;
+ #endif
+ 		} else if (is_pwd_shadowed(*pwd)) {
++#ifdef HELPER_COMPILE
+ 			/*
+-			 * ...and shadow password file entry for this user,
++			 * shadow password file entry for this user,
+ 			 * if shadowing is enabled
+ 			 */
+-			*spwdent = pam_modutil_getspnam(pamh, name);
+-			if (*spwdent == NULL) {
+-#ifndef HELPER_COMPILE
+-				/* still a chance the user can authenticate */
+-				return PAM_UNIX_RUN_HELPER;
+-#endif
+-				return PAM_AUTHINFO_UNAVAIL;
+-			}
+-			if ((*spwdent)->sp_pwdp == NULL)
++			*spwdent = getspnam(name);
++			if (*spwdent == NULL || (*spwdent)->sp_pwdp == NULL)
+ 				return PAM_AUTHINFO_UNAVAIL;
++#else
++			/*
++			 * The helper has to be invoked to deal with
++			 * the shadow password file entry.
++			 */
++			return PAM_UNIX_RUN_HELPER;
++#endif
+ 		}
+ 	} else {
+ 		return PAM_USER_UNKNOWN;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index bcaa84c9a5..c3387d953a 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://0001-pam_namespace-include-stdint-h.patch \
            file://0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch \
            file://CVE-2024-22365.patch \
+           file://CVE-2024-10041.patch \
            "
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
-- 
2.40.0


