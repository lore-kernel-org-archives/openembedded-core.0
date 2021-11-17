Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A669BC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:13:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.10887.1637172777507073449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L/EOr7wy;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=695583d416=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AHDRgJr000809
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=FepMdwv3CLoyoE/emezRX6NLPv8T6HmjVpnnFj7IxpQ=;
 b=L/EOr7wy8JvMejJLH699l2JPQMGNFEeDH0fTX1588F1SAt+MkGqd52CdJAsQo13dSpiJ
 KilDOC/Cq3ralt3iUN+wiEtLuduzQ2b8BbZdyYV5O+WBZXLmn6zhIiwqJQValeP505T1
 GzvsteJE/fvfLtb/VmGIR2impNSSOjeodIGCwBltC91BKVMnewLSokokNCRaB+5Xqapb
 v4uMA+Ut3tE8te16EoBpkJq6GV6RtzOZbvBQ9oIfO7Jvjb0wT3X0yahc5PyR8xuvQJqE
 14PF5GIByxoB7eo8iE3YpQZweEypx9DEOzaw2jivBz5ofFMOGgHCQof8i8f6GL8kSljy vg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ccww00h0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:56 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AHICtmm023791
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:55 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ccww00h0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Nov 2021 10:12:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTVi/LAWrxEha8XJwR7b5bP2jPFhCvkZBdhwj5To4ZrXFEwX+AgsADRGMSrvmKHlewt/Cn8tG0dKHcFudqnxYV3HJdD8KxD5bf99CjP6TxEwEbjfFOyshXmkdBnUaXombT+AeLCNe3vnv6YRmt8oNXWQeF8p2YVGu/n79Yx/sNpGXU3bUY9tg13EN++6KvdnyumQiO9g6QSugEZHvWH/VlRaQs1UiQuQlNwXwiribMD+cDhD1DfFSXo+2vIt2UVoAV/E7ltz2ZIK6vViF2uEFCZl3Ge2pcLqiRcERFMIGb7eCxrS5heKEQtZbfoOQXpaSMwiUD6WF7eoPzfAU2t7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FepMdwv3CLoyoE/emezRX6NLPv8T6HmjVpnnFj7IxpQ=;
 b=Qld3m7vCe8lUmiFOdEt9IvzA11uu1RHjLDdo5YGMAT0m7vYhMf8S/Qmo2IMJQntxdgpuPa7coN/tXF/6DCTNnTuQCzcLP20xvFakEQ3CmMpi+dXpZk0sTXflwtj/dzcG8QFuq4OkiujL+AX8qergb0eIXQnqcZ7Gdvl7VCgloR+8ypqKWPCwlwzGsubm3iVU4DJngNaj1EG6PBJgqUPewknrNgGQaysUWVWCFFfJ6WYAQI+EZGfBMsynNTcgiFNB4G0iqzqhX17bv1Ehxra5S79IuScK4FUGOnPIwFLgCi0dL2DGaW8EmWPscXL/Q4Y/F5ITdmoHHGB30Xu+BJPeSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Wed, 17 Nov
 2021 18:12:53 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%7]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 18:12:53 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 0/2] Couple of SPDX fixes
Date: Wed, 17 Nov 2021 10:08:12 -0800
Message-Id: <20211117180814.29395-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 BYAPR07CA0090.namprd07.prod.outlook.com (2603:10b6:a03:12b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 18:12:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb2f5a6-d543-484c-8bdb-08d9a9f5df22
X-MS-TrafficTypeDiagnostic: MW5PR11MB5931:
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB59312758E3F97536C31F351AEE9A9@MW5PR11MB5931.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	omQ3MFyLXB/UKyKzwi8Zkfd8mPwaDez+o+AWUsMhroFbk1jCRNBjat1HV5em/q5Slqc/jP7mPsifMADXRpDYmkJW9/g5rCyiZ2/bo1NNNgQJeE8k0n8QxrvDglOpvF8v59Pvl8GO9Kqvhav+u6Lm8swORvXV2JXQzHexLg+oS6K6TULkuSztoa92bCgkTix/fhg5YveYXBI4cfysRsWSttJO3kRBRj28+7qv+csfkGDrXe10Lj1WITnoC5D6tnvBCj/Ln7jXsf1f5EbjaICZI8UgIZYAhVDipEB83vSUhvo+g0N6z36Vo7jiaPdIj4H2PwM32+hKoeQIET9AKvon/IV9CIzxgWPpdmtzO3e1IRkg+ZLirxUm3fnmF7Tzrjy/shG88mKJCYR9mt/XM5DfZVLxfWVrCOgS29dIJylv1m2Zyiv+7sIDypKeymZcUd4AX9MuXKxmYcSTXA9oqd4PrvsOOozM984zP6bImlW200s2V7Xw3FYDcMm4dYCxEq9Ed9ZabdCyqT0D5cRDbG5HC7aDpgT+4taphzYWOuhjQeo2aPNyHogdW5q5/qBXAFeMPbGfLDkFZKIFvhkhKl8D0YMuyQXNvKuIKnSdXcgUPxUBzI1u5rlWU7a92y2HTUxr9o9PHiNBbcCxG2w96HINwUvfrL9frffO5lqsNbgTa5tBES1PZ6OKZZASbDMT06mqE3VcICVShmBtc5q1m5oVEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66556008)(66476007)(52116002)(4744005)(508600001)(6666004)(44832011)(316002)(6512007)(1076003)(8936002)(107886003)(36756003)(8676002)(956004)(4326008)(6506007)(6486002)(66946007)(5660300002)(86362001)(38350700002)(38100700002)(83380400001)(2906002)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4ar6LCTmw6HmRyrduhxOBzpKgSYgtW3IGmUt1IFMlH9fcdLEW3WFWaZpE0s0?=
 =?us-ascii?Q?OnksFEFg7i5fDts7mhmGdmfi+ACCEwidq+sM3LHPEnVCWpIzzwin6RxcYSPY?=
 =?us-ascii?Q?4gXOH8wf2CiSpyquaeCMpetXUZfEiJFp/tAH0aLwAVm84kT34YDxLKFikhzv?=
 =?us-ascii?Q?7SHLOz2FcJbRIeh+EFr0VSLGOEJDretRhaR561h8+Zzx6ToMzH9tVOEITj2+?=
 =?us-ascii?Q?RxyZBynFvPULZgGx5skKwBZHeE4z5xBUOLZJbnFsCCf3Jdc1239KIbrGPpeh?=
 =?us-ascii?Q?KPswoqKae9lFjkxieDGQXpzEqYSZa/R7905Gq/WfuSLQq7DA6nrAuJ1SuoKQ?=
 =?us-ascii?Q?8JowZST48zq0e2Yho2cOMNrtgnu9UEHJEcPYsvBfxOxxPOvx0sEFq+EAGUwh?=
 =?us-ascii?Q?3SAqq/R/rW0gLwzcK3tOVBtBGaM0on4OYnMHXCiaD91KJK+G9hNQJAQK4NRd?=
 =?us-ascii?Q?dKex9uRgdaJMzvWdOCg4VIzRv7nBAbjcr7EzbgZHMAndUyVH97l6VF7l0z9J?=
 =?us-ascii?Q?BZuOHURWKqJSDWK9YCC5Zhi1hPROnp80gUqCPpNpw5RUwkLiqdUWKPHS20hG?=
 =?us-ascii?Q?U49IZ27W6GP1LP0s5FSfvczFNkFtPWDIFuqAvmjEnL5tI5xA5nyImlFjbE83?=
 =?us-ascii?Q?PQdPaEogKx2zLcD+sowN02n29xSlaSHeThLiwEsSd5JiO8ztd/u6ZfI8Mw2o?=
 =?us-ascii?Q?l4lOA08bF4VYqwChYZ8iKVUYC2C9IAK0NsPRJznlKkpSgCGClZY0xTfj7U7q?=
 =?us-ascii?Q?8UEntARPtmrAyRwTA7xXACWCHEcsj0lgvocuJ1VX+PezelU40ogrZxyesM57?=
 =?us-ascii?Q?YadCYnmqRDnSDUY5PXc363f/rz/C6t0Lk8WH52Q/HF7GnZWdi3hc15tYkMIc?=
 =?us-ascii?Q?QQlllMaoleyxaXrPf2siPiORbL4BcTa4mjy0D94+tDfGcAEQmjm/Expz2+b6?=
 =?us-ascii?Q?zw4jkzs6UcbSYzFoO0xTPB8t9/QA+8+31PrHJ+W8n3fSfaI4/udTnIoOIcaI?=
 =?us-ascii?Q?vjGsk4j49Pt/gqdnblqYaHVA1wBLJHevbpU1VMkGv6EHKmQoif4BS2ztSVnj?=
 =?us-ascii?Q?u9fB0YBMF7QJcGRbB2FM2s39q01HD+oO4XhzQIN4LU42OAbcedlRHLe6sCDu?=
 =?us-ascii?Q?V5kjO+8hSPF9VgXEoH8SxM6U9/ETSebvFch7vzwHid4DOqbW1GfqXFDufjFc?=
 =?us-ascii?Q?EHGmvrUXDooIdvLn5vyoVV1/mRflm1MREDOO3kgNlxYfOng81uk3LAfCQJFI?=
 =?us-ascii?Q?KcBHvhH8LswE7tRNHyVPyk6yZqeQzcg5++pA4HL5onSmjdCGNvgqjl1A1nFu?=
 =?us-ascii?Q?XBiImlQxpbW52RzoC1ZSivPy8shdBAID8/pAmituWXaAKLlWwfSnq8iWy8JY?=
 =?us-ascii?Q?CR0tWBpJJTgW2sgWMEtWfC6lJCVtmQtjzjLTCQuh5umUAGCjkxF7X8YhRoow?=
 =?us-ascii?Q?BoH9fmjgLvYPwkGtrRcglsILrmWCJC0sSN7SnLYxbASYrmpd/e3Fq71j9opg?=
 =?us-ascii?Q?lPlqIObU7VQ/CTnpPpG8AD5aYxLKQ0F2nVxkzlsJnlO+Xhat2t8ozzI2LlFs?=
 =?us-ascii?Q?H0tgsmRjO+6/OAxvIx+wzjdVz4Mn//0D3VeVc+79V8DfXcnVg4jahRBAQDZX?=
 =?us-ascii?Q?LKzUjv0SDDfPfJvyLL/5WAo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fb2f5a6-d543-484c-8bdb-08d9a9f5df22
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 18:12:52.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dw6LwxKo7SF2lvxYfdjHif7uKa1pRYuMAgcQeJqiTMfkrQgPiR9imjLfA3lU/DTqzS7TGZAqB6YUXFMMua+QsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-Proofpoint-ORIG-GUID: Vlbv6UURShpqy-xTsVG07bbFuNknqJqP
X-Proofpoint-GUID: u9jAUVl5gAqS6g2iG9HNdbhvjLnC_ZNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_06,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=598 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 18:13:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158449

I was trying to build more layers such as meta-clang and found 
additional changes are needed to support other packages that are
installed into work-shared.

We might also need a similar patch for the archiver is this change
is acceptable.

Sau!


Saul Wold (2):
  create_spdx: ensure is_work_shared() is uniqe
  create-spdx: Protect against None from LICENSE_PATH

 meta/classes/create-spdx.bbclass | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

-- 
2.31.1


