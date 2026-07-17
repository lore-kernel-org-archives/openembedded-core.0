Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2FEC44521
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12143.1784290752794986477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lvq5z+av;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJBXb1111922
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:19:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dVRzyHlbF02oivTXo3eyvu/NHP56zYc9geKJhvDFtSI=; b=
	lvq5z+avYHwSgfJOzwD4gbv5sJAomr8GY+WgyYgmAMTulHBW0pJA6fP7NSTzyPQi
	j0Uw46B4l3Dw4YOLpndU75lnq0bIJZ2H7b/YR4XRQQMCg2WHF8WHTcHSXHTydGpA
	o+Cmi4EeXjYcHShBdTZKsBz8GKMZq+PfzWxuvMPYKYxY7eVvRMv3gr1m5WGwgHtH
	0yy+nC4yRvFCjZrbQkAOxpGlFsrysdmWOQ3hdKbxj9jzqJxqpkY7OGDQ+WrVlRUQ
	7JbMMBG83ziCBrkTYWJQ0sovgS+f0fm01q4UXiw+quVc0HlpSVkFySvrN8etD2R5
	WsnMDI+FjGFnbpzc6MuKmg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgn588dx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZUZAYUjZz1evIzNotuaqSvqV0E+bxSAkv0bTwX6OOSTEHmXLdIM8Ygds2/B86jU6V+ptVKVTpJKxJsJyYdsHnuzglY0zwbaT0wrH7ZELHVOWkxlEze757WFqXfHx8yp+JHytnzzpA5BmieyUufQ6LLqNrFdqwKFBNWumcLhOCQXRMjmLkaEi/pKsanic+KIWZE8lcsaCQvPlPgFqh83shgj9xBO5gPozx/PbZSna+ct4ggUfhzsIvAdmqIyKUDfX77hZREpOk9iyVCqvaMtLsye87wD6B6GZmik77BFHn8CB0DpbPPfhoQ7cjMpwOwtQmZokl2LGG8GhFKz55Adyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVRzyHlbF02oivTXo3eyvu/NHP56zYc9geKJhvDFtSI=;
 b=ZpFluTGRenh0XRTGZ0J6ScZoCiJDunLNq4vVsKM6RAkXrCzoTYre3D0AByt+KELlM5I5IOA3mOcyVZ1KoBRZz5gJE6Hw6kp4KJT1Mpj/eDj/i7Z+PzKlkDemjVPB4pEpzvpG8Gg3sYl6OBBcwRUH1KDO0C7n0mEoSuWVPKJOSGIRQ0uz2CLSxLhqWX46wIxUXmDRNMTYbANfmwpZV/8i9DQiBsrUlj+S3BhJIRaZLy5XsK+NDcxOqN4byOBg7iWVXmxajc2TFxgaqpYOr43K+IF/4Ii8TyVHQktlTj1xJJH5jUVciefCRw6A7Tk2HISagTtn/AA0an0nrFwKkE0lWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 12:19:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 12:19:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/4] packagegroups: add nativesdk-packagegroup-sdk-host-rust
Date: Fri, 17 Jul 2026 05:18:47 -0700
Message-ID: <20260717121849.2163115-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
References: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0438.namprd03.prod.outlook.com
 (2603:10b6:408:113::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: d51f1d6f-5b04-4540-8566-08dee3fd99f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	n/tvDGoE59t9oPP47Fvhz/eN565qtSCAu0O3/BQdIKB7R29C6YCGfYbbI9AL4nwhpsC4ONJUm2P6sapjuBtUsH89k9efcwasvEd7Jn3QGhVXmSnUxDcFugWlmU3YzSL9xeAKZZRWAIgkuW/wrpEUJ1+JdWRAhJdqhUazvcZw2eAt3w5DDW6m82mtfqE2J2usCxwR/xj4VV12qJjPrd9BP0xIc+Qc0dOQhKegrPAyOp41YTFtBejpXRrsR8J0ygwaXJAAMIz74k9FdOR7nTpQxNcCqRuADnU3ZLVpwdvoj/ZnTprvLPslMachTlGbKL2wujtAmnn2gzpBnB9lUkhFz2a9lsTQD1cfegO8AzIpF+BdDh5J4udr3s9X4QLaZMlcyGEV/ZaCim0YY5JIWHxTec1pu10ZP4BushtwF0+cENGtNhmUsx7QfjhXGInr2+B2HVtGxmoK4+cM/HHzqtFoJDe+xxai6c96MELYNYwRdu4AjGX/qmPXMOgZ6GxSMaFl9VnbENhEaei5jagVWQr7cfB5OnXpLrO6I2VBOc0E4qnFfSyKatiUIdF+p6ldfZggAMdqoHVcSSWk0/RXcsbFZekNJPgNrY1bqkyRlWNg9wkBHKBYfpAIh+p/cOMJNuKyrABq4G7lfv8i3n2lbVKtPjojpHvWo2ZVVvY+B5sgA2vMoPe/TVjf4roc9Ur6qO98Jx6DAwjeDaUJIYWuCFgZr0ZXrwnNC2Km7RLhyWOOJPo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jJl1V5oZKu1/XswG3JnEScBznJeSSxZE+xXtRJUZh9w8gWeK/wfph+Eh78Eg?=
 =?us-ascii?Q?T1tmpoSg1lrtu9h714QtKB2DMFnhd5kR2FYP0BfdcvAYcDYD4HUSOh9px9Hr?=
 =?us-ascii?Q?Kuo/rufdO6+HK+PZqAGKtJ1zcgvE6c5ePTNk5bCLS5WuMxXkzaDmbtCvMvtJ?=
 =?us-ascii?Q?maUEA1/p5bVzeGQ5AWV8Tz8WzSlRHlEtP0W5k/DiyGbH6TYOejhNMk7JwFaE?=
 =?us-ascii?Q?PvO18zuwbHT+fbS5fiaOdM//sOPQ3JSz4i5VK9QjszlrW0nPzkV5WO4H5zp3?=
 =?us-ascii?Q?Q+nN151JxBdb7D1Ir6bx0XrMDoH2XT+GudSQWLUCj1BfDpge61BBPmEIIJ9I?=
 =?us-ascii?Q?Jtnh/T9JVnCGIwP/D3v6KroLqYNhq8DMnGHXFLAuQOmKTQajvlyEqdoY+ipV?=
 =?us-ascii?Q?hXWDK/JWPviGQE7HqK1KL1WQIZ0+0N/e+t9BAi95SfLyw0OHi7goH8a0o//w?=
 =?us-ascii?Q?ClJYezbxPa/xSGaAGhamQd4ZZnnsOUnyvMSR/G/hEfdylHfWjIdMpbUlV1vs?=
 =?us-ascii?Q?rASg6FKHvfQo/pa/gGs2tcVh2DoEuxtn4UKDLcF1h18RH19lobIX0BtWIDl4?=
 =?us-ascii?Q?qJrT1HfDkSOg3bACbx9jJmPbjC6N62EALczZln5dAXVPKh+XY6xDPsC97SQs?=
 =?us-ascii?Q?CkIBUNCXz6Q2OTpL0AjAkwNzkrW/oo0QFT1RtYqZmCd7NnWHFt7yxI2mdMbV?=
 =?us-ascii?Q?AwBtw7ZA6CH1qx3iLZr2xwUrzfiNttnWTQ99SYd6GAytnNmgIvuIKdamz0IG?=
 =?us-ascii?Q?UDAVt2YugEc3w6i30qa7jsV86wEcnX+WkYSHR4EN+gpsZDPfALwsDBfD1ICe?=
 =?us-ascii?Q?ij5uMEqoiB1tERHSTeUq93Zl/ihzSfChv2ca2RoP9GHQ5CS/wT0M7YUtBwxp?=
 =?us-ascii?Q?J3CDb23cy5iog1L9NQi93ks4feg2pKDTh/KgJAZIB/1up9yUaqBH1u/Bnqd/?=
 =?us-ascii?Q?Fk7AVvUcMIBxvlzEMQixb8/e4r5MHTHrykVVvpoF1lh+uAISgF12CT2QUZmb?=
 =?us-ascii?Q?jKGgJ5p+lo1xlO48fn65xcWI/hpILCSmF8GHAxKCI28rM6Ig8YD2TDPL60CS?=
 =?us-ascii?Q?FjUGQZT/V5gJuypkJHXUx8brVMINgXI57rWejAlSCoZtPFx38Peelm+BdO0O?=
 =?us-ascii?Q?3R9KQLHOSc28JZT2G4vQnIyOZlCfQJ25jZNGmogl4KDgJw910uL4wt+RX3zO?=
 =?us-ascii?Q?/QuQnpcaTSRoOjMU8TisSwcrN04Zk/r7J+K4bdbaih8Emg3m7quL4M7iTUDe?=
 =?us-ascii?Q?/Hpund0a5snC6F7eGmSrgKO2ixf6BP6G0FL7vO34wAKUOVeL4l0OaQRBKjxh?=
 =?us-ascii?Q?5U04HvY90Ey9ZAH0hyfAXJyCRDl9mmszBaa1TUyA9lwERn39jMM8BalSPOOo?=
 =?us-ascii?Q?+IgK7HavOFBdTLWr/6nKZEdcr6nj2MTIQzYA7MLRVJi+g5HATqD+p6cZxOnZ?=
 =?us-ascii?Q?33AP0yPauioYz8Jqcxsi21L+MHwxVncRq2wJJU72G86JO+6tuQnxKVwJT1D3?=
 =?us-ascii?Q?OviUVZBdkYsl8SxKDTxclQaaILq9usnaYFRND9/IvW45TFjpy505vS3kAryY?=
 =?us-ascii?Q?roAOJnDvxSMF5pH5bPd/qYabc/6mqhZnDdXNOQ7/AZXM4+ra/+REIHTlqls0?=
 =?us-ascii?Q?j+bXpXD9jjQLuCjf3jxBB3VgtPMGauWKxMgBXlD983aP08A8hcfRy3V+toBl?=
 =?us-ascii?Q?tLEuo8baFsghiG5nilmtVaNH8pJrNWohfLjEUZAMIsG95Js3GxcpI2zYX0Li?=
 =?us-ascii?Q?KCbr5pg4ypwZuj6OaYSmWpwxlPIQBaM=3D?=
X-Exchange-RoutingPolicyChecked: 
	QmuA7b43GWxi+zcpMhrSRXQVcAp4c42CAz44IJy5GtvajaaIv8/RQPj47sGV+wTT6NR5baDOOls5l7FPs5LH884MEEb1WXKnlObHj02TYgCIzMtlZEcup9CXzHPlP/tbZNIIbLJzw5dAyVZTtwOJWmtEXZNH67y3ywyrRCSu5NiAgHT7N1oD6a5eEfU7521RpXdoa7WZRsiDGDXE7iLEYxeCS4EucsJ5aQoXu37dcKffGp2U1u7U5zNp3fYzU3fh0SGm8R/4KjH7hD13DRvbirZUrxTv8qf4JnW99Ue5J5GISjEbRlTf6p/5ua8mhpyL82hrTZyRrs00wPLR+tDT6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51f1d6f-5b04-4540-8566-08dee3fd99f6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:19:08.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jX5Hcix7y9jq6GqndJjRHYV06LPLbkr657NXYlC8BenWj9Ky9d4x6eAX8aLKPppnkLr+zApWgOwFQvPxK0qlcFpT+KRcSS7rBbh2nfQrkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a5a1dbf cx=c_pps
 a=e7UpQLGcWimQYEoqUdNrWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=1HcokD4nGsmBfvQgh2UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JbVfwJaVTm61jQGItZpsk5cYMPf6jhYP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX7bHZXQWWxgdV
 lAWulLeiE3Mk65Ie0Y5vO0zIhms3pVRasEUL7h5Da/bfaXmAbIE8sR8AFn/ZkkkI50PJP9lYjJy
 2rd4QcM7PfPrzYfmcTjyHc3t+ZUWHOkNuaoT67/Y1+SjDkA1xP7usFy/H9c/MshLG86gfxr3Wl7
 gSBmPH3j9+RD36fX2CbzPawQQk4AalhuPTvzGSdwVq2vKzxQNZOafMtdMKfHzhXQE1GbGy9tVsV
 tMKJWuTYmF5dlrOPoZLqFqvkYE4mILQ0K7DmNW6Ry+LvosTfaWY8yCcFqPFTLAcAs9mQNsrFIDG
 +FOX34wOa5duqsv3TfnwJfe1KACqlq+71I8Zdv8wY0xh0Jltj8vC/WcJ7jcev5eRCngzIYlPVH1
 1TDnm7aq3J5UYEokKhVBgNR8u3l0D+hUHgKA6BSSPPEniCY8SIKslpPwafvwI1he1DgKH0EG1aC
 cayRUe/5guywANKIEdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX3ukl7+AE5m7u
 9XohgjWNct8tT2MzeCEd0NygFeolv1YV11QJKXbD5U71ti4GgfBsMZ0lFFqC9kh4ug6MqEtK41K
 rPthxQtIjpFomwfSNF3xMmf464Z7S8XVZHR18uQ/H6/xZjYsqQYC
X-Proofpoint-GUID: JbVfwJaVTm61jQGItZpsk5cYMPf6jhYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241165

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add a new nativesdk packagegroup providing the dependencies needed to
build external/out-of-tree rust modules in sdk.

Set PACKAGE_ARCH to TUNE_PKGARCH instead of the packagegroup
default of "all", since nativesdk-libclang is dynamically
renamed per build (e.g. nativesdk-libclang22.1), which is
incompatible with an allarch packagegroup.

Add this to TOOLCHAIN_HOST_TASK to include it in the SDK.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../nativesdk-packagegroup-sdk-host-rust.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb
new file mode 100644
index 0000000000..b10d420acd
--- /dev/null
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb
@@ -0,0 +1,16 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Dependent packages for building external rust modules"
+
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
+inherit packagegroup
+inherit_defer nativesdk
+
+RDEPENDS:${PN} = "\
+    nativesdk-rust-src-lib \
+    nativesdk-bindgen-cli \
+    nativesdk-libclang \
+"
-- 
2.51.0


