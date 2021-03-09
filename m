Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web10.8331.1615295176342971771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 05:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=RNLGTtmI;
 spf=pass (domain: spinetix.com, ip: 40.107.21.73, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVqmo1JSnfM/s66QCxEmeSXFt4Abvm2DnrtJnk/tIaO2c70n1170teCo2zRXhOrjWuxoIQXvamr3WePSbdJ2bdRB9LcDz6MWQy37xmuHuVEuS2MMt/sq+stxRXL/MPnkjKR/CPsTJTLiWg1PKlF5l+Iwx14v8Ofdo2Lz4tHvEzbyY7LDU9WR42HmDv1DUnwbF7+dmuyjpBPG/q7yZaFG8Fiq5+xdYjJk40RGXWy+KD4/zZDk9b8F/k6Fj9L8yTEmZ/R+UbSRLUEfNiEC6bMIqL0uN8MaL0WHW4FU073/1Lqte3HGA5Xg4ClAIlCE5VFv2FfwTbcKHG5xRdsdRvj+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzcT1RtZ07g/t38FeL/NlQu2OfzRxbv8mAjMu1cacVc=;
 b=T2G+YdTYPsQLXuvZnHabf+ZUpFrdd9GoVlvTeeWMgjjG2vj52QHjAeE4ya4Ms9GKZRPXSLWnYCwwJhzvgp9LVV/iTnBR65EAKqq+qYR5h48zgEs3ZI2kQ6UyLgDQVqpSQAreZtK4QCcYQh5N1LOvagadQ4VmpSlCUjZDNdStnhfYCD6fJs894CTXBRAh3b2MFeS0BR29BbkIgw1t8HZ2HY/RimFW9X3jXHhJrCyIL8o0s22Yj3/lR9t2+jYvtyuvn/Ko2r+WpZnnA/TGU2Z8sYKiPOlOuWqIgQIXfb65IwlYzIRQ0OyJ+UREYTYRtsOh1FwUEHy8w9o8zFej3AC1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzcT1RtZ07g/t38FeL/NlQu2OfzRxbv8mAjMu1cacVc=;
 b=RNLGTtmIOLkUTaJq4APbhJQ18SkHDSOnl8YF8nL3hmYwpuwlCupLoCD/0R1VRYZssvZO3Yy2EGUr6QQSY2lBZlD5pQgB2skhu+ZAm/RwyTWQg/fW3Oa2IHiBQnsTPy8yYSm5I9DobQQag6buXIfV3ciMTaNyv+uIHw17iIR97jw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB3PR0102MB3402.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Tue, 9 Mar
 2021 13:06:11 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3890.039; Tue, 9 Mar 2021
 13:06:11 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [PATCH] sstate-diff-machines.sh: support rpm, deb and tar package types in analysis
Date: Tue,  9 Mar 2021 14:05:46 +0100
Message-Id: <20210309130546.26241-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0040.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::9) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0040.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 13:06:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae2e3b67-d132-4532-6af0-08d8e2fc1cc2
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3402:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB3PR0102MB3402673389FE2FE1EC66894988929@DB3PR0102MB3402.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fpHd/foYfa9Bm5EMVsh/xabpC6zU5iZ9cvcIS42YVVSNO27qZjQe5JQlD/QR1RehfSJduJ2iX323lFBuCk6Omu76pf0uot4Ayu02Zg+P386J/vlhWv1vzR38R4X3gr3RseLvjx6qoTif9d0Z1HOytVe48ieWQ7vEpBeFqcvimfhi2RDvWQlEr72JxP9jTimUmCeRhs/+RQe5W16uTQcAQq03znolJeZM026IYOnwG5M8ie6UqdfQsCFAYc00MuafkiRFbY+h4tb6wlbJ2B69jRWFcxSnvh45cNbhqv/paiF6KLa3qnYodmTE76C4KH00+Rf8awYKbyAB+b3BDLzKRjFzStKcGQxqEwTRNUonbcYgaGu7Dfk/vSUy+MXIZUhEZQ/tzQcx5dvGpVeraoU4+d+3zfo08aKwuuAeQSMMtKIMjHg3woLXL0H9YX5qmE4DqnJB941AIrQgnMUfhBs96aqe5q8sQUFrQK4C07k9SsZDOMY5rlwc/5e5+SJCMKv/Bq+4mIH71n8ZtU/0wc9COQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39830400003)(478600001)(2906002)(107886003)(66946007)(1076003)(4326008)(6512007)(83380400001)(8676002)(6916009)(86362001)(16526019)(186003)(6666004)(36756003)(956004)(66556008)(52116002)(66476007)(26005)(2616005)(5660300002)(6506007)(8936002)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+jUSQLpuaV0F3Rh3MYQDeAWWy0mxixF/RYROQRnnovZOthpclCgTzzd9etC8?=
 =?us-ascii?Q?8nlwTrs9T23PSlpqHIQruM395Lsm8zHA+zAdn/jt02+Q0NT03UeCcGtmjo59?=
 =?us-ascii?Q?hIR2yy8zviZ4wnseE3fvivdZpFVn1LCuDwRc+PaOQgt2XgSt6+iCPVizwIGI?=
 =?us-ascii?Q?kupO3ziyDQFsRmpCIbu0VnYrmiWfDMMjfzPYpe2OCqTHTZOFb229ziS3p7r5?=
 =?us-ascii?Q?LKxf4YvAHGDoP25zjQXNWT/+oxmjrfTq1T4DLkfR34GWRvAmAyyX2yc4Rbfs?=
 =?us-ascii?Q?lfIplnUXssGKQ0E6v3jFf+iWPPZQKe7OWSl1r6ibGMVy32MUziqaxbleM530?=
 =?us-ascii?Q?E420Lt8UwjMOqDrbVDeETwC881GXn54RoB6EuNp4gMDRV+JY5MPYv61HvZK0?=
 =?us-ascii?Q?PHnxlrMhtwO4edRWHCDXrs7T52YyY/GK+zdV4Jaa09374iCjwX2LEkZryTjP?=
 =?us-ascii?Q?hDC3QrXvxEPfdBXV2omjfDfkudNvb+b9yUMEzmC7NTAuom7QuRPEcZP8ltHL?=
 =?us-ascii?Q?liYjvgQkUHMo7TSJriH+Wexwox1j8TtSGzRbaJnlDQiYuZsrLb3mAkdcheEE?=
 =?us-ascii?Q?4VTJ0rkFP7rcTa7XsMKf6HT7u3pHXQQSijMir9DTn8NxpjbStLMDd0pg1lHI?=
 =?us-ascii?Q?9RyTWqJQLp+89bMfzYQQQd8aoOV6is8TlWD4zSoxzLSRRZ4eWNrpuAa08qqS?=
 =?us-ascii?Q?hPnsjTHO4KY2tu5DtpaA1dmC+Kl7hWrjelbtLwxpDHPoxPd2U7fFD0vwTx6j?=
 =?us-ascii?Q?JKM9Uxv0tIytG0y+EOIdHPEYPgh/l+8FaVv8u8xFWtb68x2qj02jxsCfn4pk?=
 =?us-ascii?Q?WhPByP90w1Mc2MxBPD5Pj2PQDTvjtMXcGUnQBhj0TLI8CnIFBfNlCHjqS6nu?=
 =?us-ascii?Q?nBWm+edJvXSIDEV0MRigfnPfzVpUvied1xwvlp9UGcn5vCK5+oCMb3VNxJYc?=
 =?us-ascii?Q?p1e547RqHFQz0GFLeo5dQyRaT1RyKdmOTwcAPwFoTAKpaAimifl0LCpaQa6z?=
 =?us-ascii?Q?TGek0ws1riPrVE+0bfsM096B6OG2cunGSdvGhcRNesAe4ZP0UONkp/GWj/Or?=
 =?us-ascii?Q?ZSAwKbnnP7hC4Krq5Crs3J+hT02UaOl7DGODE5VDqPhFECGlMWx6SrmhmdAw?=
 =?us-ascii?Q?adpZHU4BrEuXphH+xITy/NRz99JAX4Y06eBA9eP+QEaHGdPDtNb/Nb83aZBt?=
 =?us-ascii?Q?I5Z6oOS0q4JsqIDandt245zi3CKDplNWrA3BMC+S01tWU4/E3/IP06SIslW4?=
 =?us-ascii?Q?93o0xeFbWDkviRSiSpTT8h1Kaylrh50caje6LQjYLjTZu8/337bn+KiKHWJT?=
 =?us-ascii?Q?/ZRkXtCKLg+MBC2pGu29Cq73?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2e3b67-d132-4532-6af0-08d8e2fc1cc2
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 13:06:11.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akJOboGiuKL/cjWaYeCt8/lNraQqCoAigUPLqW0H3FYeuOwRV/U+64ZjvFntg0BRGckb1ATp2rrMROusPGoaStT433uhRt4g/XWLjI+4MiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0102MB3402
Content-Type: text/plain

The sstate-diff-machines.sh script's --analyze option was only supporting
ipk packages, this adds rpm, deb and tar packages, checking all the used
package types simultaneously.

Without this changing sstate between machines would not report an error
if the difference occured in packages and ipk packaging was not enabled.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 scripts/sstate-diff-machines.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
index 1d721eb87d..8b64e11be1 100755
--- a/scripts/sstate-diff-machines.sh
+++ b/scripts/sstate-diff-machines.sh
@@ -127,6 +127,8 @@ for M in ${machines}; do
   fi
 done
 
+COMPARE_TASKS="do_configure.sigdata do_populate_sysroot.sigdata do_package_write_ipk.sigdata do_package_write_rpm.sigdata do_package_write_deb.sigdata do_package_write_tar.sigdata"
+
 function compareSignatures() {
   MACHINE1=$1
   MACHINE2=$2
@@ -134,7 +136,7 @@ function compareSignatures() {
   PRE_PATTERN=""
   [ -n "${PATTERN}" ] || PRE_PATTERN="-v"
   [ -n "${PATTERN}" ] || PATTERN="MACHINE"
-  for TASK in do_configure.sigdata do_populate_sysroot.sigdata do_package_write_ipk.sigdata; do
+  for TASK in $COMPARE_TASKS; do
     printf "\n\n === Comparing signatures for task ${TASK} between ${MACHINE1} and ${MACHINE2} ===\n" | tee -a ${OUTPUT}/signatures.${MACHINE2}.${TASK}.log
     diff ${OUTPUT}/${MACHINE1}/list.M ${OUTPUT}/${MACHINE2}/list.M | grep ${PRE_PATTERN} "${PATTERN}" | grep ${TASK} > ${OUTPUT}/signatures.${MACHINE2}.${TASK}
     for i in `cat ${OUTPUT}/signatures.${MACHINE2}.${TASK} | sed 's#[^/]*/\([^/]*\)/.*#\1#g' | sort -u | xargs`; do
-- 
2.18.4

