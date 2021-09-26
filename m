Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2B0C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 03:16:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.14751.1632626217856090186
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 20:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hF/egqFG;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=49033f7fcb=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18Q3GvAm023653
	for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 20:16:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tx451SbUXbZEB2kHnMvTSOvZE9LyZWgXHknJAsJivl8=;
 b=hF/egqFG5CexCqhsQNTMk6hKxFuNP0SBgajxsxGbsS1RX1UuR4kx1hAsy3fWmtyO+Slx
 m/l0peXbYGZBLKcBFDkQIc+9rLn3j/fdQYBHBBIF8bLDTi73COygx6X6JAzyUdn8yXfL
 kypnPNzmGcOGAxaF4L1YmM0fmcCR/wRTfUHyfoAe0MGkxfXOxcUayfBqRCFj0ADOKKve
 0TAHF9h8ZALMQl2Mi+eB9+5X74axF2D7r2n1mV+qaGG5cdwiHwvmzrXbgp5aNnXnRB+0
 OM0DOQsVT/S4RtdkMol7MgfJoANzjnar+e+jTsSYm/Z/vkDTeMz+JWEOcYTLGi/DiXzm 9g==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ba39k0b5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 20:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQP+uiuLBBl1EbDe36Iu1CBB21Jj6ri5FtNn2boOfKwsra+xpG2fLvC1n46CexpYIM5yc2wqVM0fq99upXregFi0SUJkmLKfsW657W7+iH5gNvLwZxpIIMtx+0b0v62/pkY1krio3LLwwPdYeLtw7N9OeQ+ZMF6CYLKNrdM8XG1u/QhbLVIgnpliejO16UfPc29MZz0oDVQ2Iz4gmGm5KT2tNeOPAo+adfccvkoB1M/3O9ode5emzpf6yojFW0MvEanXfZrRGEY/+BOO5QOcpViR9IPcWyGEwylYlDHmuTqR5qexjQ9wV9qea2gitu1zAlgwsohcBnZBKsJMX4QkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tx451SbUXbZEB2kHnMvTSOvZE9LyZWgXHknJAsJivl8=;
 b=c5F6QnbiSvSCm4fOn1N55L63lmvf+ZRvtGMyvnJtl7oSuFCzfbPlzOvJiVMoEkgRvgBYlwCwRp7v2L8D/au75bIwZoy9oqmGdjLr8NElBa3SXwqxfrjYhW+pIIqDSj1by6vcg9wJBSnQyn30/l5JXAMwy0kusYc9eNa5ShXMBdpw960GR5IO/Ord8che2OUhTCnBvLhnEC5zt0mpwFHhrC7zMShJT8y3DdUNfj9Jal031dgFlSdSHeVTDHka/g7bNFuQk6Jfkx6DwkMbfPFlB5g7i6hVjwHgv2QVHlDTdC38a+ZTUGj3jy56P2bvOJ2NSggB9VRkewwPGo6V+M5ctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2351.namprd11.prod.outlook.com (2603:10b6:300:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Sun, 26 Sep
 2021 03:16:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017%9]) with mapi id 15.20.4544.021; Sun, 26 Sep 2021
 03:16:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] inetutils: fix CVE-2021-40491
Date: Sun, 26 Sep 2021 11:16:42 +0800
Message-Id: <20210926031642.27606-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 SJ0PR03CA0058.namprd03.prod.outlook.com (2603:10b6:a03:33e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Sun, 26 Sep 2021 03:16:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20357194-0672-4a46-6b1b-08d9809c165d
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2351:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB235101F8C833E21B80143E6EF9A69@MWHPR1101MB2351.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qu8bt4GVfrwegSDbK+UTdrbp6FOgiifKddAJTWEw/T2Evyc2r3Z7ecc9mnlK+O8PgpbD8tkT682Cd6SKBx61J1Fp7tdD320QhgAI4ZLIQduTAndki9+DnEqNOkk7dJfDeJg9XQGnkyN5/bqhlq7dCIJlJUa68zsObDduIEbS9itrPL/TGMwTqmjDyKide6GGgNanbfucLHvAZ2DTyeO3oqYgfCScxusfaWdfUk7G8DSvODkVfN2o8oZUL3A/jPJsSySc/KIG0TT792GfoKgyb9vW3Yw2CS/cbCa48V5EcKnKQYxa2JT5nsr4PXSM/t7OA8DaN2yaeoKfM9zTrYu0AiSKqzYV/Mm1gnDXYV+Wnfa6fenNyUIJyqMDtMkY0GwBVLJ/K/lQP+3AjBx4sMbShn33Q0CTjZmy7I0cA2hlbLDqn8RNZFIHc6qyv7lRajAXDxh4E2VIUSKLICfcchW4YQBjVrxiJG29HQPTqHch+H8hY2JG8KDR00ZNGKy81icL6VxHs4SgSaj7DqYbNRNZA/dGxHvXD/XpiOGX0u8tNyuCC2sr5OV5OD+VIhOqCIWpw6lEtf9JwGiFM29dkKPIvp9i5slkDp3flRolC9PrsbeaLknp1drWuQ4k2JYSET+BhYUMij1EYPhewJBGh/LokacGWDrWPXDADvDCunvQ6S7ew1suVsakSUZIwkUmFeSaWtKGh89QmVbk21OtJXa5TMOi5yNheTeylelVw6BEPcTj3pL5WMOjoh3AIQ+1YEduDuzaQSpcpUyaaAkT10M8EGMidrzydw5PPpt6Jf0r/6dFLkSJkx0vujYD+g3LUwwmARTcQLYZwnoQcEGrj/h35Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(186003)(2616005)(6512007)(8676002)(38100700002)(38350700002)(6916009)(5660300002)(36756003)(966005)(6666004)(508600001)(1076003)(83380400001)(26005)(8936002)(2906002)(52116002)(86362001)(66556008)(66946007)(66476007)(6506007)(44832011)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x3emtw9Quhv1n+fcZY4WNnAM4h53Ys22mOa9rRVQBrwEM0VK4OL6/JfPOO/q?=
 =?us-ascii?Q?9hoccXrBSU8Y9a7U9WEigiyZMiKELo1uL8hg3eKfelhbAqInjZUeNkZv2Aoh?=
 =?us-ascii?Q?0pNegk6IIVyMSgkocbsqJLKWPXvwkSVkK7tFi6qjgrdWyOoEQ2cDleeIP5M8?=
 =?us-ascii?Q?GqtXPed8p1HdliDhWoa/qPNE7P/3QLZPtisTTwU1gKo5w5FJf1vUm6qstbUl?=
 =?us-ascii?Q?7NW8CfrSFqQXORSJkjOwaeRlLtv5kn+qzPVpF49E9qntnKK1ZUycp+zZf/gv?=
 =?us-ascii?Q?Scqw6yuH0CZSjRNew2EbhfycO5GO/Ri5ZIaBFT/9a8Wnal984+IERIX3KT4t?=
 =?us-ascii?Q?qGQfw1VqALBuGlC8ImHVieORmn5dUzV+n9QJZ8FeR0SYoMqL0FGESNPb5ATu?=
 =?us-ascii?Q?Bxr2D/eK1ZES/eMN6EGP90U1xLbiF2Z/HVZ2rZUEsljLlzNsZGkADU4rU+V7?=
 =?us-ascii?Q?Cw35z/GgoNoB5MvOG4ZEcrutrqyUH6Ci1Fjf587XOGQsAG+WYIMXPDdy6y58?=
 =?us-ascii?Q?9X+B9Ws5NkDHd8uRq7dNs3HVYBJNRnbvWDtWObk9Lsj9R357f+XjijwHzEN2?=
 =?us-ascii?Q?pECYb1XI57xtjyTMC1O485BTIic3ZhrYNRZ12Mv6+0TANGovR3z+qLJmNpCD?=
 =?us-ascii?Q?GTvXYRzRCVjgfXi6H01z24qhWHJCGQJAee4U4n+8/YWXrAD2szhrfyrwHisH?=
 =?us-ascii?Q?pKxcVTInuWTH16b9YhAhB8+gQys7fHQZkg7ZQ2SWY/rw/t2Yglo5Olh4ax32?=
 =?us-ascii?Q?JA2YvnM7gAkDY4/YcdDW2YO9jh+MaWGP1V+DV5NLdg2pW0YRMgvMdkFf82fj?=
 =?us-ascii?Q?K/Nf+p3JUDGQXr01+qkSBjUv+SKrzlCubzrSZR6LfjwedNQYdQk5in8ja8yX?=
 =?us-ascii?Q?jE8X7ROBOrcQCI9FgH4BNEpjOjdo+UNXNIZioVEqIHn29yE36/HTokxMkzbA?=
 =?us-ascii?Q?8Slf0d4d+0xvtKUqrrTcjoJeNcnKL56Pg3xvEMRmHbg4VSlYmWo6XqfOf47f?=
 =?us-ascii?Q?Zzt7VRFjPrifQbYMotajVrvJrGLYiz9R5AioLsgR14SvahstXjnX9If0WLYc?=
 =?us-ascii?Q?JHz6kBTt2fjY1Hj9U+rPXeGWjkmwYevhWo3jdvnKCb5kesSDcVYQszNvRmmA?=
 =?us-ascii?Q?QSL8jhsduRmTDKxE3IEJa/x99kGpYcgeNGDr/1QrJWGwUQ9Q5fuO9Jdo4iy0?=
 =?us-ascii?Q?D5sNvcuh7tbadDXXMBE7KIogr5gvxwyHvnZ4Jp86E1RzTVpftaXjws96dM5/?=
 =?us-ascii?Q?4jT0LMdW/iDNYcKpjSMATnjTU9vxvvTdiNNTIu9SzHyBmJpC5W6khyMcH+j8?=
 =?us-ascii?Q?S7KDWbqq/lwLrFraFbbDQ/Hc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20357194-0672-4a46-6b1b-08d9809c165d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 03:16:53.0450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Dw5jcKu5WC4yPtwTICkY77oH3pJyz5yVCgcZlbcnhhDrdvBf9AKdDweVBrcr+wqf7KSo1zMohPbckonLXKjaWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2351
X-Proofpoint-GUID: FhPGhyd6v4amzAxSd9290haM63YNhyjn
X-Proofpoint-ORIG-GUID: FhPGhyd6v4amzAxSd9290haM63YNhyjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-25_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109260024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Sep 2021 03:16:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156358

CVE-2021-40491:
The ftp client in GNU Inetutils before 2.2 does not validate addresses
returned by PASV/LSPV responses to make sure they match the server
address. This is similar to CVE-2020-8284 for curl.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-40491

Patch from:
https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../inetutils/inetutils/CVE-2021-40491.patch  | 88 +++++++++++++++++++
 .../inetutils/inetutils_2.1.bb                |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
new file mode 100644
index 0000000000..202488f75c
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
@@ -0,0 +1,88 @@
+From 98ccabf68e5b3f0a177bd1925581753d10041448 Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Wed, 1 Sep 2021 09:09:50 +0200
+Subject: [PATCH] ftp: check that PASV/LSPV addresses match.
+
+* NEWS: Mention change.
+* ftp/ftp.c (initconn): Validate returned addresses.
+
+CVE: CVE-2021-40491
+
+Upstream-Status: Backport
+[https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ NEWS      |  9 +++++++++
+ ftp/ftp.c | 21 +++++++++++++++++++++
+ 2 files changed, 30 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 7c5e62c..bd9a4da 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,6 +4,15 @@ GNU inetutils NEWS -- history of user-visible changes.
+ 
+ ** ftp
+ 
++The ftp client now validate addresses returned by PASV/LSPV responses,
++to make sure they match the server address.  Reported by ZeddYu Lu in
++<https://lists.gnu.org/archive/html/bug-inetutils/2021-06/msg00002.html>.
++
++Thanks to Luke Mewburn <lukem@netbsd.org> for discussion and fix to
++NetBSD code, we used a similar solution.
++
++** ftp
++
+ Disable use of readline when environment variable TERM is unset or set
+ to "dumb" (caused problems with Emacs AngeFTP on MacOS).  Thanks to
+ Alex Bochannek for report, debugging and patch.
+diff --git a/ftp/ftp.c b/ftp/ftp.c
+index d21dbdd..7513539 100644
+--- a/ftp/ftp.c
++++ b/ftp/ftp.c
+@@ -1365,6 +1365,13 @@ initconn (void)
+ 		  uint32_t *pu32 = (uint32_t *) &data_addr_sa4->sin_addr.s_addr;
+ 		  pu32[0] = htonl ( (h[0] << 24) | (h[1] << 16) | (h[2] << 8) | h[3]);
+ 		}
++		if (data_addr_sa4->sin_addr.s_addr
++		    != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
++		  {
++		    printf ("Passive mode address mismatch.\n");
++		    (void) command ("ABOR");	/* Cancel any open connection.  */
++		    goto bad;
++		  }
+ 	    } /* LPSV IPv4 */
+ 	  else /* IPv6 */
+ 	    {
+@@ -1395,6 +1402,13 @@ initconn (void)
+ 		  pu32[2] = htonl ( (h[8] << 24) | (h[9] << 16) | (h[10] << 8) | h[11]);
+ 		  pu32[3] = htonl ( (h[12] << 24) | (h[13] << 16) | (h[14] << 8) | h[15]);
+ 		}
++		if (data_addr_sa6->sin6_addr.s6_addr
++		    != ((struct sockaddr_in6 *) &hisctladdr)->sin6_addr.s6_addr)
++		  {
++		    printf ("Passive mode address mismatch.\n");
++		    (void) command ("ABOR");	/* Cancel any open connection.  */
++		    goto bad;
++		  }
+ 	    } /* LPSV IPv6 */
+ 	}
+       else /* !EPSV && !LPSV */
+@@ -1415,6 +1429,13 @@ initconn (void)
+ 			 | ((a2 & 0xff) << 8) | (a3 & 0xff) );
+ 	      data_addr_sa4->sin_port =
+ 		  htons (((p0 & 0xff) << 8) | (p1 & 0xff));
++	      if (data_addr_sa4->sin_addr.s_addr
++		  != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
++		{
++		  printf ("Passive mode address mismatch.\n");
++		  (void) command ("ABOR");	/* Cancel any open connection.  */
++		  goto bad;
++		}
+ 	    } /* PASV */
+ 	  else
+ 	    {
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb b/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
index 0cf73cdb24..45b88b1d7f 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://CVE-2021-40491.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.25.1


