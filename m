Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.63])
 by mx.groups.io with SMTP id smtpd.web12.8131.1619328791436308548
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 22:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=a3FKKxqY;
 spf=pass (domain: windriver.com, ip: 40.107.94.63, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+QUAiFXJzdu/WO9l1RNqejBg+v7pZK5Up7O7nJP6jLkplEifb7fpF52uvgtMF5czgnQneUgjUvyDknV/0+K+nKTwNO/18c2Oe0iIO7/BkFXhPXpZd6cU4a1WZHVniJORsS77paZStD6B3eSgIBgdKxuTuKWZ4wV/Huv1+1SXEeLyAwi+ByXQi9aKZujjEmMHJuFYe/X0/TBfkN8nZbJAKEtKilcUo6Nx/H6ChSe4dMtxCIGCqgmQZgQyQ9t06zOCRpkSrG/xEoL5helwReeT9WDy9oCRliz/umObgIgSiKWXG6BqnXK9AH5RLGiNfJ7TcZjzjJh2iH1Iy/+eqhp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uXsT1L9b+ciAILcHUWNxIfHBa0/02e2T403Tp5GCQ8=;
 b=izYfQ4mgJgbxU3P9zg4Vj6cIxaNUd+pHOQ6TKiMP6RQdt1OERnbqzQKVxai/sxKLSmz9AkJHOIT4YjBo5CbdDP+SQPzOqRgFrQUOOlenyc1P/i8SPlrI8kn0tHxF0dbMS7HM1ucY08ZfQC/5BdvPZYurJgFRpK2APvlQGG4P1zwaVkASSKU5vMvLQ9jMJ4S/pC+S9mQPtNhO0sznlX/ZAtwzQV7zfZOXrurWgzrkQv/XlayVAYyP2RqB1hVNU8Ig9m2gwxaf4rcEra3LPYrKgniIg14xobGIlQ9JTakGz6PaHRdxPMGy6Av2TnfMn+Hgi+dUU74zAAa6FzflPnn7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uXsT1L9b+ciAILcHUWNxIfHBa0/02e2T403Tp5GCQ8=;
 b=a3FKKxqY8wMLzPqvFWdFcpOKVMfmFpAL5ZBsdR+s8XgGV7WfTI4o0WMJdiJcF3x3kxrw2P35VnUIa5HbSsvsnFoCy0Ay2sdCyclRcs2oaY52/GqZzy9+ZLWkGixi3avFByPUp35xjEeLrlBSoMAnJKyGAZZ23v+V7gB8NoR2Jms=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Sun, 25 Apr
 2021 05:33:10 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 05:33:10 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][hardknott][PATCH] rsync: fix CVE-2020-14387
Date: Sun, 25 Apr 2021 13:32:52 +0800
Message-Id: <20210425053252.1972-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0066.apcprd04.prod.outlook.com
 (2603:1096:202:14::34) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR04CA0066.apcprd04.prod.outlook.com (2603:1096:202:14::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Sun, 25 Apr 2021 05:33:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ade4ebbf-ba37-401c-fe5d-08d907ab9c6c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4814:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48145906993CA979C03D92B5ED439@SJ0PR11MB4814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qTlZozsLW+smzIUh/viIn6F8W7FouNbLFWHDnXdJdgkWaCwIXFNom6bmwyvoUWZGmdP6H1Quk6RBFcrv15CmJikajU1/3ozXF8y/8JXDNR7oQ1Kdvf0+ErI9i/G0XGWPFKWDTyKGInrkZR/9y4prwUi7beWYE6QDF3x6VrOnAOpMi/A3Z+3KPGOtQ8HCYWrDKVvQ2O0OZ40Ur6r+vmd2LMmBQizhvYorcn2f5KY/GFbuGwz3hIbXhxHNliGjUWzomI+HhJRDeNycc4PXeH/nNsKn0VER9zzk0B3sNrdKTAhtGYUgeRiUiAsPkFuVlrdrVVV78OMiuHqd+BOiEZbuZbjE370SpLFbkWhjLQOSMWHwZdk93EKVDMiybpPCdQwl1poI6GMNuiS9k+gYIinuQVAzpOc1rWoutBKsk7WDEJSq9XTAvJuAfsrAEzpPP9O61bLNr2nkvGP1cKfB+0j2dlCZdFMwn6NRrrWna3QXYrAatescJnxdxcgo/rE3oENKW4ikOwaV9JT7v/Nd7lhpDmxJcO0ETX9enzCfCPEUGsp62eaPMCvITadgEvuuqBnXivZ5gXDU3nSKjo5DgFlZHJZirMRJ7X1514I07HQaq3WhPd2CxOExVJdXAzBwXtAoBWg170Vxk4jMzqHvUFdU+5OMmvo8ZhpyQOG+Ec0LWxK8eOxe2xA0tnR9uhClNZqltk9GOSl1cw8NApaKMc0XM8qrEbIZQ51gZrPpMIgm+cI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39830400003)(6486002)(2616005)(956004)(186003)(36756003)(66946007)(26005)(8936002)(16526019)(38100700002)(6916009)(66476007)(86362001)(66556008)(6512007)(8676002)(52116002)(478600001)(2906002)(38350700002)(83380400001)(5660300002)(6506007)(1076003)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?nryU00l+EmBiFHOD88PABMs+ipZUR8omcoRcsJkW/mk94M/rYdWQlrGuqPI+?=
 =?us-ascii?Q?C+DKczq+PzqiMrmVAPnmcLoaMX2rmi/PJHoR4nYMfgJGS4aY8HIqs1ZUikCw?=
 =?us-ascii?Q?BAL6NwNAE7oFZ2aMC6wKYckeMx/p4FkACC29Stk8kt/WuE3CzHgazzQjT1TM?=
 =?us-ascii?Q?C0OTXHSFjTIOTjbhn560VxV8qWURJL25OcJLtIrmQFncQAXSBJxDsqUdcGnW?=
 =?us-ascii?Q?0aRvH2ZsMLXdTOgODFdPXHSVAuRPU/240cSw/zv1FZsZidynFwMNQ9J9dJOw?=
 =?us-ascii?Q?1KIF4cpXlnM9ilqNtbEPgRVh1HQBbws1FfqgfXL8uEVCms9jsOOOLrG/splW?=
 =?us-ascii?Q?3rlwF6kuULrMVbXowOXFX8fdvfQ2Z/uJs/n7aggC6Y3+UiqYuRhGAxlveWyF?=
 =?us-ascii?Q?/D8ssZyKnlBEUVVdO3K76gzFd3thJSh4tDdhAAP2kRTiFzLLKtXgR3s68/r6?=
 =?us-ascii?Q?/k5kzhOYXva0wYfLHn1hDEjS0q6L5OAOPX1FjJn2L8daMPRjbGJ8vrW22Fd4?=
 =?us-ascii?Q?RziZFu6fuqjYg1r4KFA8cfNZ/f3LZoQBZXlicy+eZ5ggVyE+5grxpnHKespE?=
 =?us-ascii?Q?uBW5afrhDzUI7RIU9Knp7G4uTE91ZmDffwvQwxI+bxH5gQjt5jLRjDNxOoG9?=
 =?us-ascii?Q?XR5FRa++vstZ9vYjyNSAsUMrr4RAMB1Ssf6a6YwRUxT5T23yW1oRyuZ0HczV?=
 =?us-ascii?Q?gGMvtH5VuMMs/DG/BNym2/pwOlqnNQxPsr6ncKmar+Hj0H+B7uymlE/bSUh4?=
 =?us-ascii?Q?YnPOhdMFgRixqcA2ysD2rUDu1tWMhi6BTXSttQHHbFq1TeFND9sIQqKm4npz?=
 =?us-ascii?Q?uYSVPYxMl0lbPyochzE3XidpsqIOQAfBIgOhRrrpv1tfrgFztQBbN6mGLqEv?=
 =?us-ascii?Q?gv0Ax13aRNhc9kWVWM6L/Xw960+BqlBdnUm7fMVDnT61hW+bvlTB+Z4xcesw?=
 =?us-ascii?Q?y9tyZstg88rqZ8LaM7sF3VPYFrcNkKXu6hyMHMebX9Yep9VI5gY2fcHAKscO?=
 =?us-ascii?Q?kxiL85UElWT0ZuxwWQKEGWH3CZGSqyILa4cAgfwY2VRSf7g0z5KAsVysN0Tv?=
 =?us-ascii?Q?y0MVVr/Yu+bdatPnL5h/Eiw4GCjUplMgGck2+naa9zlo+kwHqM5TML18pOv6?=
 =?us-ascii?Q?YI/fp1dN//Vr7XsmBK8i9uEgnLRBIqVP5EQNUQzCzG138PaFZJKT3ZiAa2XC?=
 =?us-ascii?Q?eETH4QV0uzmKRRDUCmVXiryV9eT2of/geKvlHNY8my/sxFiEIceiolzxfHce?=
 =?us-ascii?Q?TAgTsnYtsjP8Pl4DdVMpCOJIArGSto3CXU8GqN4OcaaP3nzeCZC2TZ++tqw5?=
 =?us-ascii?Q?b/2V3BxOpisVAGvqAKoRBOy0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade4ebbf-ba37-401c-fe5d-08d907ab9c6c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2021 05:33:09.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgdwXZA7E+YhmO/QfTAwcyF8RQL4KAmQIUokTjAlBkRgaFrn2MCc+nJcVkfD6GHr/QLx/gDW32Hs0+NpDjItCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
Content-Type: text/plain

Backport patch to fix CVE-2020-14387.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-the-hostname-in-the-certificate-whe.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch b/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
new file mode 100644
index 0000000000..2d51ddf965
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
@@ -0,0 +1,31 @@
+From fbe85634d88e82fbb439ae2a5d1aca8b8c309bea Mon Sep 17 00:00:00 2001
+From: Matt McCutchen <matt@mattmccutchen.net>
+Date: Wed, 26 Aug 2020 12:16:08 -0400
+Subject: [PATCH] rsync-ssl: Verify the hostname in the certificate when using
+ openssl.
+
+CVE: CVE-2020-14387
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=c3f7414]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ rsync-ssl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rsync-ssl b/rsync-ssl
+index 8101975..46701af 100755
+--- a/rsync-ssl
++++ b/rsync-ssl
+@@ -129,7 +129,7 @@ function rsync_ssl_helper {
+     fi
+ 
+     if [[ $RSYNC_SSL_TYPE == openssl ]]; then
+-	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -connect $hostname:$port
++	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -verify_hostname $hostname -connect $hostname:$port
+     elif [[ $RSYNC_SSL_TYPE == gnutls ]]; then
+ 	exec $RSYNC_SSL_GNUTLS --logfile=/dev/null $gnutls_cert_opt $gnutls_opts $hostname:$port
+     else
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index 8b36a8ebde..cb18667755 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
+           file://0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch \
            "
 
 SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
-- 
2.17.1

