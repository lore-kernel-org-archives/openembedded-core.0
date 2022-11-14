Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD23C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 05:27:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2540.1668403664900096952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 21:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8317b30afd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AE5F5Oh016784
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:27:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt0q2s7ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcfKFgsOO3sd5QrFL8yudgCeTF3RvCxWz5ZXxGl5ko3w9M3UT6Ayb0/7/NLWjbCsWfttE9bapuJYrqc/j6R0UvfQ9WoKLGLyOUbzGzsShi/heg8u6KvrJiTCZWkFnTMINbXGDKgHQ5HmV/f35n3oGozWHuOpb3N4d8tRxIDqpTilc4rmOnH863kNOeCPpBRRwpbx0W7X8tllBbDAk8jbeUadki28QsizNdTupjS7gQqjE2A7lTX1asMQLSUgKNGKtKjvQnpGsowx/NSW9aA/Y/Dafo4TS5UF2oeR8+tMnV1xLcfZNl8tnx0V9+v2XkL52XNR5pLgfD14yFjGxqGUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUCWJYw8AbhFyL8FzQtvuMaQtOW5jVsv9FPw0MZTdXg=;
 b=aV9bxsbdNysN/eL/kND9TEa/fNUm7zYX+D6QVli0kQ87zo6CSNqJOMP9UXuSrYwr/RV/NheZo6LoPJ6H/5HsKRPvRBwtll2v5zIbuU9bcMbEa9qZOrBlrGdcFelZh2GwXGt/igXUylIruVHw12BlT2t/lNe2rrEeJ+Z0Mp/kS/2asAzJwP4hasduEObjWtrPlhhUAXHXwglORIPulBXDurMBOU4Cw+QkF9Jk7RBw+75AO1ry6yvn3UYi+ti4C1v9hC3VJ7wwrLR38twYqcR2VnyavCIC+7LqEDV2X9Eg24qiL3H2MrvJJPSl86C1spfqhb73lCCxadZnKrdSchlgxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 05:27:41 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 05:27:41 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] sudo: fix CVE-2022-43995 potential heap overflow for passwords < 8 characters
Date: Mon, 14 Nov 2022 13:27:21 +0800
Message-Id: <20221114052721.21489-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0174.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: d5765978-4dd4-43b9-15a0-08dac600f301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hWEO86tQzB5UewQhoN36UbvPmISE6dMxGYIOtFOUztUdsfQ/QxhOrF4LF9t5jpdnniwArBTHxa14TNDPlJR8uDz/Kk8kaiajLVoLn24x+SSR9aoYIfuqfbjVRlyROSXQbwkjyAagRfuI3RbWqjOxAt8amo2QWyC6lAa7CYXieW9I1laRp8/TSVJU44yG4rfqZfXGSzdOzu1iuAsceiS3SqkNDTei31YJFgQcpoWHgSpb2B5ukgb/XrZ0tz+N+VnEdJpxFJVlz+e2pzb+akxnflJY2ufY7TzMpNayiCbHxWVeBOjkHsmzg0ZixtFnnUQ7bdd3zcCDsaZGovXf63jcpmKC2P8dFxnvS6GwRC8uUxZCGh1zNqacjb07rAer8x6Slq8GhStzB/htD5GG/YVb/eErqds+C1MQWYNn7OfqMYIDjUitLXS25N5+4ZUo9sxzvJ/YJ59GzukAHepajlrAkeupuly0kh43NrQ6EO4QCl+iOsTKXTC/0EjRFAJWw1EzH1RR2K3omBKM7eNm9R7sZal5g2XFPVkSw2rduKPiRhz37f38rkhnXRhplsfAKO5rjdxdqsDQC9phoZQawUWQHF7MlQX6Qfut3Glzx11i3taSjqBZNTjFgTpnC1aX82wfC5qoMhk6mI+f3ApcX4uBjP6ttynOKklMlVU/Q1yYqeUHGR2cWjdr5bdaiY9lw48W/QPdoBQB9TfoWNN2pBf0Vh702d4Y9QUaemuuqRnqiLIJXs7YnFwWEKTLJYvAJc36R8JEtTKhkuwbaRDKy1A9xPLipzQkvGUquEVyOzSerhI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199015)(52116002)(83380400001)(6666004)(6506007)(26005)(2616005)(186003)(38100700002)(1076003)(6512007)(38350700002)(83170400001)(8676002)(2906002)(5660300002)(44832011)(8936002)(478600001)(6486002)(66556008)(66476007)(66946007)(6916009)(41300700001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D+KQVDGSbdEPSvGyoHpJH3OlVGUX55ard7MtQ1rywsX+L0LBRLdf0wu24p0a?=
 =?us-ascii?Q?CuYbTLWSRVpBOsMynoPjE7KYGk9DzoHaKPiH9nFrucgdIHoJoxZfaUxCa5Wv?=
 =?us-ascii?Q?Y2tG5Bm3T3yb4hpo2+xYnkI2k/ntHw10gl6Nj1Mpcue/IffZ4EUQbbCUPG6g?=
 =?us-ascii?Q?pQMeBa1GnX6Wp8KvCppkBSKMRj6hapgrW2cWyt4G+J+kJVI3kKqB3xOkxf/4?=
 =?us-ascii?Q?03UxtzSK95MYZvpFLkscpK78NChvQVWNe3byn2Uaen9ecvq1AEi5RFyaeT5H?=
 =?us-ascii?Q?36kbkP0+8q3nFKyVEWIRcjJTLsv0XNLd79Th4TYKjf/mjLw9EfIcMvpWS5gK?=
 =?us-ascii?Q?rRJlTL0bJWNxxan8r5TxywG+bI+7CTQL4JRTsuC72zK2V23elDHYWbmEo3nB?=
 =?us-ascii?Q?oOVZakMlZexf+c6Sws8azv3xTMEoyPi8L1GLQ5OwyY+hxv30ruByu8fc0rw4?=
 =?us-ascii?Q?28AhmzQtQh6Tew5iyXk5IVpTpjQZyhfDHxloP31PN4MVvACwqC+GkokKm7Ag?=
 =?us-ascii?Q?ugpqlsGaOkkAxtc0INwxEIlXfjpGjaqd9g/pWMVOzM0CzbkKjmNz890iewdi?=
 =?us-ascii?Q?Od34I1ez7dKvqfRPnJyUAyBmJIM5sN0cKBWDDIlEBRvFfN+al0v5vGU2FtnR?=
 =?us-ascii?Q?5czfTmJRGpa7KxPoGyTiv78hV4ejtcRFHVikstZGnmPZbNdVsK3HNiILzudH?=
 =?us-ascii?Q?/z9vl58QLWbqJp1FTYzPDTlAbVQSOrjB6BLmvju796aqixnHgx4theJKB2mk?=
 =?us-ascii?Q?Rgvot6ounoPH2xWIW/VwuItXts9IfMZRsp9BRPkARqM4i/JeGhoILyQjLdZD?=
 =?us-ascii?Q?K5+41PWYV8vOCsQf/Sk65FCzbz6ovMVeAgKRGPVLJxYQr1HyeExElYwNSq+u?=
 =?us-ascii?Q?P7fefV51z1AjEARuxEKjGJKQ+R+widWsDropcx915v4LIVxql9rnWUz6v/P6?=
 =?us-ascii?Q?eMZ6xsfXKgZ9Emjs+ZuCiZFsK3tuWLtATAhQ9kW1iDq1O7EhlgvZoGLzLwrG?=
 =?us-ascii?Q?ULgInWXCG8IhLrwfCwwIsaOVJWcUsJJCacuqV89au3fIZD049L02Hc8ulFcP?=
 =?us-ascii?Q?Qadq2iJ7dqfwiARkO4Y0q9t3bnitCee4CMdA3haWOvAZ0zANi2vevYuVhmsy?=
 =?us-ascii?Q?3wnFeDKedii+Nj+qj0DYtxERx18Kp09EeZ1Bh81e/MSfTCGAtUMjU/auEa7I?=
 =?us-ascii?Q?ZzgmAn8mq7n4PnD7utKIc7g2XcewSVlxRN8cIOvhn4kR+ssDTzVEmO78G2UB?=
 =?us-ascii?Q?+7YNmfTU7V197xSmkAdC+tgOhf3kjWwikwr3G/5EmSHJ2kbTNuepx8I+Yf1/?=
 =?us-ascii?Q?pUr4h8pCNB+K4uCz2gykDCyYoJ9s/bEWXDpIbO0LIg+8Lm7DUKzjYkbI7bd5?=
 =?us-ascii?Q?kjXGDWeQQZ5RV9IPmXJd4Nkbu2lLIpRXqWgqmJX0O+076neN66BUZpcJ0UeH?=
 =?us-ascii?Q?zqJCWrOA9X4E5B1duUZgNagYlbPFSZ9OzNhtgpeGRYLVwpJl0U7WMmhbYixR?=
 =?us-ascii?Q?GsY02GIX9arwC2YTtCf3TjUMBrZzXvpzZc7udwJyk5G318mebjMDJr6o4NVN?=
 =?us-ascii?Q?9mOs98saQnyxXervYyJWoc2HrYosDhRPnY8D+LqMMzGkaU/bRqkLjQYFuS/C?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5765978-4dd4-43b9-15a0-08dac600f301
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 05:27:40.7611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1waFfTmu0X1x2+LFxhcSjn9QQUKDyl6opqRoDazICSnY1cv07kfcEzJwRTneQiWS2lws1FizUCQZ86Up2QQxNs1YG6m6T2M4uDIqfDlxL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
X-Proofpoint-GUID: 3PDzaTv4-V5Bs2DwOFd580QhGsqBwpTc
X-Proofpoint-ORIG-GUID: 3PDzaTv4-V5Bs2DwOFd580QhGsqBwpTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_04,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211140039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173225

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...95-potential-heap-overflow-for-passw.patch | 57 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.10.bb     |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patch

diff --git a/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patch b/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patch
new file mode 100644
index 0000000000..be52af27e1
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patch
@@ -0,0 +1,57 @@
+From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Fri, 28 Oct 2022 07:29:55 -0600
+Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
+ characters. Starting with sudo 1.8.0 the plaintext password buffer is
+ dynamically sized so it is not safe to assume that it is at least 9 bytes in
+ size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
+
+Upstream-Status: Backport from
+[https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ plugins/sudoers/auth/passwd.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
+index b2046eca2..0416861e9 100644
+--- a/plugins/sudoers/auth/passwd.c
++++ b/plugins/sudoers/auth/passwd.c
+@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
+ int
+ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
+ {
+-    char sav, *epass;
++    char des_pass[9], *epass;
+     char *pw_epasswd = auth->data;
+     size_t pw_len;
+     int matched = 0;
+@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
+ 
+     /*
+      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
+-     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
+      */
+-    sav = pass[8];
+     pw_len = strlen(pw_epasswd);
+-    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
+-	pass[8] = '\0';
++    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
++	strlcpy(des_pass, pass, sizeof(des_pass));
++	pass = des_pass;
++    }
+ 
+     /*
+      * Normal UN*X password check.
+@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
+      * only compare the first DESLEN characters in that case.
+      */
+     epass = (char *) crypt(pass, pw_epasswd);
+-    pass[8] = sav;
+     if (epass != NULL) {
+ 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
+ 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-extended/sudo/sudo_1.9.10.bb
index aa0d814ed7..e1f603a125 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.10.bb
@@ -4,6 +4,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
+           file://0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.34.1


