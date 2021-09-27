Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58C1C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 16:09:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1238.1632758988573211881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 09:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=rdomIIN9;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4904b47dfe=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RD9nLY007970
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 16:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=wCjNSJqhIpC71Y9VkPOJHPgueLrYslYnwVqZSEPlIs8=;
 b=rdomIIN99bbePIcI/sxd/4MJcgeCnMm03/kmzkJN00hiVuuHrJi7xWoC/n6vsXaEYGPJ
 hyxDEGSSPv+c6+b40IaAQE1Ewxwg3K56riC3WOles+3IqwD4hrTMPh77QV7Ei2kY7WK7
 KjlUWPrr65y0JW7aH+jD9fH1vlgDU2faokxWRy06KGC6edJxll9RintdiFPxMYOqHe0c
 Ycp6kb2SQJZaLpj3nalnfTfZPJYlyxu1MnrzKRYX2oSHioOIGO6TFQD4L3siKEKbKzMY
 p7zCzybamw/BP48ZdtSsA1q6P2pdNiePDRynVNesDtUlQOceMF9kJ7sB/cj76N45GiWh ng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhrc6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 16:09:44 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18RG9iCL007734
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 16:09:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhrc6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Sep 2021 16:09:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+7DN1yn9ss8LzdSuOTMpJG/PJPIGiMVED61HKnfKNE/W30liC0VonMZCsnvg6lOceo0X8mmnmXfHB/NHjrKOX+ATFKszxct/NvbtJk4W1yvOOnLrXr/uZOMjpdHK1qOIBhFTvPG9tvFPly58HXG5xrtmD/a2FQGL66NWg4/0NaQZkhmxV46rTiOiF8th9ZNEa3xmiXFPfHwQaAdt9RkdhPOgpw/gvSMSY1RaUS2YuFelnkpffI/hzuS33kukGo2yF0Dz/WBBJzP2ueCeTdwnIOFE+a9fAB0Rnuws0SYl0c6EHjpxPHijmr87ySgzeUxQQe1rhiE3p2G9faHfoqkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wCjNSJqhIpC71Y9VkPOJHPgueLrYslYnwVqZSEPlIs8=;
 b=E4Fwejeq55uUx3oWKzgM/46GQh38xC4NHjSdgrzSltkx4alGyRhFl3UrE2ERTGKRY7O2IG9NWnv/z0FIiaW++UpK2ySkm28LtW4UOLhcnUQBONB+6+klX3UrfDVW40FIgzyvhESXWj9W+Y/Wdf0FywOcfzC1TR3S3mKkQywsbkm4+VubuQhaEMDLCffXPUgGtIG/TtwhZWSGP+JgwCrFMqLGEh7ayIGAQWNOfwA+q/oifCPapJ1OBpeQQuVXjJJoA5a852o+bDIe3CjnhObkcJCGqgAuG2BWV9TNovkampyB4LC0Xzdq+zWo5SxOowuEMtXZPgb1eMVwW+WM7q4hVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 16:09:39 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::20bb:b9a1:85a1:44c7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::20bb:b9a1:85a1:44c7%5]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 16:09:39 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com,
        ross@burtonini.com
Subject: [PATCH] spdx-licenses.json: Use 3.14 tagged version
Date: Mon, 27 Sep 2021 09:09:20 -0700
Message-Id: <20210927160920.1218977-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: MWHPR1601CA0020.namprd16.prod.outlook.com
 (2603:10b6:300:da::30) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by
 MWHPR1601CA0020.namprd16.prod.outlook.com (2603:10b6:300:da::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 16:09:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 849f19d4-ec5c-47a0-27c2-08d981d134b9
X-MS-TrafficTypeDiagnostic: CO1PR11MB4916:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4916AAC81BA040356AAF347EEEA79@CO1PR11MB4916.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lsnDgBFFQq5QadPLDTs1LkGFSsvgLDFN+pz/EjSRZYD/BTZZ88kFFT/xEwTUJe+5qXKpfqhlhKuVeRzg1c+69nF6NXv3ckTG2iom56l1Mw/U54p5lDBM8IJCzzmj64lgKcbua364g/+qpuxX9ExyUITteec3EVWulPMrEa2LH//aUwz6Xh6vAjfCcHbTR3szElSPmxYEpcL6c5l1/VdPqTkBs+advdC/WPVPQqIgjEsWm5yDavd9Iptenadms0Kv7S/Rm+l0NYXjpHDOcvbmOHLmA4HlnZ7a3Miv+eyRaQRJ80t2AtxOwmjEMwLRvySBeDfIobL2Nci6kzpFHtclPMAUOQOd10XtcApL/VE/sycBaJQ4b6HNEwqz4pmnbLCW6IWj95GQ1HbX5ZA4MGhK9YyGWFZFe/5jm1nhKvomDLECr3qzDQi8o/5tnyR2kOfEvT3gCfDfjU9TDGTBe67ZL0UiEECaExYW4sckSOY2RAbEQdmj2rCNdYM4QQK0W8y86xrxH77IM66dPV9NvA8fXg7Pwttd2MNqqWm59Rd7w3kVPR6O7hrJeeBInqUHxJXHV82O7SWeQSldBIhrMZM6NS2xGaCiriKLRHVA3cRzmYUY6Pl5hMnzk1SoA0V/2naOKKFWxY3bpD/PnGl5pMj3V1q7iYM8zkfEisvNURvUl3jXqEqM1DxxqPC2LZ3VfPMG9as9Ot4lZ8Wny1ao4QWvjHeF3yqodU6NHnww7RBA/MYGzEqB+8+nehwLdcSDR6fXmLPq/lzrgQFnjETL/UV3IuRv5jVKnG8dcjlm00MzeurMZ0sa2rban+ho2p3o3jkKh2ZjC+912kBs/Wu6UUtNPdGytmeAEyN0rSgGUt19tKcj9e0MsCSOC79TnOJ7MESoBcR7/2b4ccc6z6eWvnmlIaYCHbaV/ORO7tcg/iM3EAM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(209900001)(38350700002)(38100700002)(36756003)(30864003)(6486002)(6506007)(508600001)(44832011)(2616005)(86362001)(956004)(1076003)(6666004)(83380400001)(186003)(52116002)(19273905006)(26005)(15188155005)(66574015)(6512007)(66946007)(66476007)(66556008)(8936002)(316002)(16799955002)(2906002)(5660300002)(8676002)(45080400002)(2004002)(562404015)(559001)(579004)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVNhbVp5c1ZsZXFuRTZpam5nWEVBMEpYS1AyZm9Jdm5PaDdDcjN5TUY1bzh4?=
 =?utf-8?B?WFRKbEhYK0FZR3RabWtYaGhtckg3bFpKUkI0WmNlZUpCbUdKbjl6UXBmNnNR?=
 =?utf-8?B?d3k5Z05YNXRMWWJzS0Y1ZE1QRysxVTJ3aFBiYUFWc1NKbjRVRFBwQ2dDa2c1?=
 =?utf-8?B?UXQ4R1U4ZmlpYWYzQVd3NEtJb3NhNU5qMTZrSC84U0kzWmRoRStaNmFnSGxq?=
 =?utf-8?B?UTNlVWpSYkkxOHIxbVZOQ21jS1NCeE5tc3pPNlNOVCtQMzNZNG9XNWxGbHo3?=
 =?utf-8?B?UjNaMVo1Szd1eDlCYXZPaE52RmwwaWV4MjN4UFZvQ3FONVJYd3pNNFZraVpY?=
 =?utf-8?B?U2Urb0UxYmNXeEU5Qlg2ZUU2RjNYMXY3ZGRXeUVvdERBOENPN1o1ZGhWVFJM?=
 =?utf-8?B?bHV2SmkyVWhGay9tdmtNUzF3Z0pEMzJ0R2JhVzNrTHJ6bVNmQk9VNG4rTXRW?=
 =?utf-8?B?T21BdWZIQUNiQUpaNkF0NWtyR1ZRKzhvYjV3Q0lDVW1VeGdIOEVKY2drY2pT?=
 =?utf-8?B?dkE5TURvNEFwTkxBUVhBdFpyYUZGN1h3b3U0NEkyQmF1bG1KalY1T3pIUkEx?=
 =?utf-8?B?aDBDVGJZNFRYWlUydkdieG9rdTQ4OW81aG9LTE5ja3l0T0JPMWxsN2Qzb1Bm?=
 =?utf-8?B?S2lqUzZyaEorZERaWS9DOFZZNENrVkhScXBhTVBSUG13bXZKNml0UnRJc0dq?=
 =?utf-8?B?UUtkaFB5OGh3YjhXQ09GL0FRWFdvaCthbS9KdnlSV1NHSld1Uld6MzdUVno5?=
 =?utf-8?B?NkM3M2IvRlNhR0M3YnlwR1JtZzNJUk56UFJyTzJ1TTk5VTAzQ2twWFM2TWRY?=
 =?utf-8?B?NnAwaklZWlBJRW0wK3ZYKy9ldTkzK1QxR0lLbEg5MDJOZkN0Rko3WWl1VlFh?=
 =?utf-8?B?eXR1QUFQZ0RlT01OMHNmODUrbHFCWHY1TDZ5eUF0RVNBSDBRcHJpSFFaY0hV?=
 =?utf-8?B?c1JHeGhBZldPYTRpeGRHUWZFOXdhbFlVYWc0dHd4bndIWHJzbjRzVHo3N2dQ?=
 =?utf-8?B?THFaRHZEQmF2Rmd4U1hBM1ZsTXlsUGwzVE00TWNCUmUwT0I4ZllmZ25DRzhu?=
 =?utf-8?B?Q1paNVBRd3Mva1hRd3YvamhoSnY3bm1nUHJEaEtQbGxBeGQ5Qk5pMnVkTHJW?=
 =?utf-8?B?MURIZjBTMjhyRURmM0s5cEdQQzN1N2xTL0ZEMVVYeFhhY2hNVHNlV25Wc2hh?=
 =?utf-8?B?emdoaDU0NEswblBQUGdFckgxNGZOMFNWQVVYUGtKcUJsd3VrRGlmV0lKUDlw?=
 =?utf-8?B?b2UvUjh6eDZEbGlFZm1lUHBYYjJIUU40VGhLdyswNlpHVTF0eWRaam5MMUNJ?=
 =?utf-8?B?SjBrQ3dxWjc5MEZpenB1OFpPVzRaTXlQS3JHcHo5dTFJVzhNSHZubjZZMXF0?=
 =?utf-8?B?RGM5Yy8wVzBJMS90QUlyQUdMSi9TOXJoSE9NZzh5NmlrRWV6QTViSmNyV1Iw?=
 =?utf-8?B?SDRBcS9SQ1F2UkN2ZndxUStwQzlzd0ZPNzBzWVFvZzlvYVZQZzRzMVNiRnYz?=
 =?utf-8?B?YStZTUNqdEozK0dhazdZR3Z3akttSXNtN0FiNmxwbXpQU1FpMEtNMlJud0lG?=
 =?utf-8?B?aUJqUlJDeXdsSVVOeG1OU1Q5SDFJUWJkWm1wb1pMVFlHWDdBRGI4SGpWSGZ1?=
 =?utf-8?B?WEpRYll4YVc3clNSY1RjUWxzWHJkWTRyMUk4MFZDcGgrMFhJSXlwNjlyOWVT?=
 =?utf-8?B?ampKWGhwY0NZVUlYbzQwQ3VCdHl5VHA2THltd2hjV1BTa3FMTFp5cVhsYlpU?=
 =?utf-8?Q?9uJSy90wFSJ3TAPwx0qa+2XbA0dmg8DeO1lckcr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 849f19d4-ec5c-47a0-27c2-08d981d134b9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 16:09:38.8984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9Yx52IAH5JHKcjih7afVLZazahUJy7rF33MlbX8BwClMiV6MhX82zmrIsfBLZvAEZbJ/6U23qGtWqIm7NWAoBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
X-Proofpoint-GUID: Sug4JPQ-7EH7El8mMsl3sQmvDtmjnLu6
X-Proofpoint-ORIG-GUID: hovNvq6JdT3_riEaOhPVYoIF94eCWV-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_06,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109270110
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 18RD9nLY007970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 16:09:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156389

The validation tools expect the licenseListVersion to be a proper X.Y ver=
sion,
not an intermedite git hash version.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/files/spdx-licenses.json | 2579 ++++++++++++++++-----------------
 1 file changed, 1289 insertions(+), 1290 deletions(-)

diff --git a/meta/files/spdx-licenses.json b/meta/files/spdx-licenses.jso=
n
index 582c73ca64..ef926164ec 100644
--- a/meta/files/spdx-licenses.json
+++ b/meta/files/spdx-licenses.json
@@ -1,5 +1,5 @@
 {
-  "licenseListVersion": "7bcf79d",
+  "licenseListVersion": "3.14",
   "licenses": [
     {
       "reference": "https://spdx.org/licenses/GPL-1.0.html",
@@ -13,11 +13,24 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.6.json",
+      "referenceNumber": 1,
+      "name": "bzip2 and libbzip2 License v1.0.6",
+      "licenseId": "bzip2-1.0.6",
+      "seeAlso": [
+        "https://sourceware.org/git/?p\u003dbzip2.git;a\u003dblob;f\u003=
dLICENSE;hb\u003dbzip2-1.0.6",
+        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/Intel-ACPI.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Intel-ACPI.json",
-      "referenceNumber": 1,
+      "referenceNumber": 2,
       "name": "Intel ACPI Software License Agreement",
       "licenseId": "Intel-ACPI",
       "seeAlso": [
@@ -29,7 +42,7 @@
       "reference": "https://spdx.org/licenses/XSkat.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/XSkat.json",
-      "referenceNumber": 2,
+      "referenceNumber": 3,
       "name": "XSkat License",
       "licenseId": "XSkat",
       "seeAlso": [
@@ -41,7 +54,7 @@
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.json",
-      "referenceNumber": 3,
+      "referenceNumber": 4,
       "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.0 Generic",
       "licenseId": "CC-BY-NC-SA-2.0",
       "seeAlso": [
@@ -50,15 +63,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
+      "reference": "https://spdx.org/licenses/Plexus.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.6.json",
-      "referenceNumber": 4,
-      "name": "bzip2 and libbzip2 License v1.0.6",
-      "licenseId": "bzip2-1.0.6",
+      "detailsUrl": "https://spdx.org/licenses/Plexus.json",
+      "referenceNumber": 5,
+      "name": "Plexus Classworlds License",
+      "licenseId": "Plexus",
       "seeAlso": [
-        "https://sourceware.org/git/?p\u003dbzip2.git;a\u003dblob;f\u003=
dLICENSE;hb\u003dbzip2-1.0.6",
-        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
+        "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_Lic=
ense"
       ],
       "isOsiApproved": false
     },
@@ -66,7 +78,7 @@
       "reference": "https://spdx.org/licenses/Giftware.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Giftware.json",
-      "referenceNumber": 5,
+      "referenceNumber": 6,
       "name": "Giftware License",
       "licenseId": "Giftware",
       "seeAlso": [
@@ -74,18 +86,6 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/Plexus.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Plexus.json",
-      "referenceNumber": 6,
-      "name": "Plexus Classworlds License",
-      "licenseId": "Plexus",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_Lic=
ense"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
       "isDeprecatedLicenseId": false,
@@ -184,25 +184,11 @@
       ],
       "isOsiApproved": true
     },
-    {
-      "reference": "https://spdx.org/licenses/W3C.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/W3C.json",
-      "referenceNumber": 15,
-      "name": "W3C Software Notice and License (2002-12-31)",
-      "licenseId": "W3C",
-      "seeAlso": [
-        "http://www.w3.org/Consortium/Legal/2002/copyright-software-2002=
1231.html",
-        "https://opensource.org/licenses/W3C"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
-    },
     {
       "reference": "https://spdx.org/licenses/JPNIC.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/JPNIC.json",
-      "referenceNumber": 16,
+      "referenceNumber": 15,
       "name": "Japan Network Information Center License",
       "licenseId": "JPNIC",
       "seeAlso": [
@@ -214,7 +200,7 @@
       "reference": "https://spdx.org/licenses/SAX-PD.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/SAX-PD.json",
-      "referenceNumber": 17,
+      "referenceNumber": 16,
       "name": "Sax Public Domain Notice",
       "licenseId": "SAX-PD",
       "seeAlso": [
@@ -226,7 +212,7 @@
       "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.5.json",
-      "referenceNumber": 18,
+      "referenceNumber": 17,
       "name": "Creative Commons Attribution No Derivatives 2.5 Generic",
       "licenseId": "CC-BY-ND-2.5",
       "seeAlso": [
@@ -234,6 +220,19 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/eGenix.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/eGenix.json",
+      "referenceNumber": 18,
+      "name": "eGenix.com Public License 1.1.0",
+      "licenseId": "eGenix",
+      "seeAlso": [
+        "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.=
pdf",
+        "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_Lice=
nse_1.1.0"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/LGPLLR.html",
       "isDeprecatedLicenseId": false,
@@ -247,27 +246,26 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/eGenix.html",
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/eGenix.json",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.2.json",
       "referenceNumber": 20,
-      "name": "eGenix.com Public License 1.1.0",
-      "licenseId": "eGenix",
+      "name": "Open LDAP Public License 2.2.2",
+      "licenseId": "OLDAP-2.2.2",
       "seeAlso": [
-        "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.=
pdf",
-        "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_Lice=
nse_1.1.0"
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003ddf2cc1e21eb7c160695f5b7cffd6296c151ba188=
"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.2.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.json",
       "referenceNumber": 21,
-      "name": "Open LDAP Public License 2.2.2",
-      "licenseId": "OLDAP-2.2.2",
+      "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
+      "licenseId": "CC-BY-ND-3.0-DE",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003ddf2cc1e21eb7c160695f5b7cffd6296c151ba188=
"
+        "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
       ],
       "isOsiApproved": false
     },
@@ -284,23 +282,11 @@
       "isOsiApproved": true,
       "isFsfLibre": true
     },
-    {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.json",
-      "referenceNumber": 23,
-      "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
-      "licenseId": "CC-BY-ND-3.0-DE",
-      "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/NCSA.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/NCSA.json",
-      "referenceNumber": 24,
+      "referenceNumber": 23,
       "name": "University of Illinois/NCSA Open Source License",
       "licenseId": "NCSA",
       "seeAlso": [
@@ -311,27 +297,28 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/PHP-3.01.html",
+      "reference": "https://spdx.org/licenses/W3C.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PHP-3.01.json",
-      "referenceNumber": 25,
-      "name": "PHP License v3.01",
-      "licenseId": "PHP-3.01",
+      "detailsUrl": "https://spdx.org/licenses/W3C.json",
+      "referenceNumber": 24,
+      "name": "W3C Software Notice and License (2002-12-31)",
+      "licenseId": "W3C",
       "seeAlso": [
-        "http://www.php.net/license/3_01.txt"
+        "http://www.w3.org/Consortium/Legal/2002/copyright-software-2002=
1231.html",
+        "https://opensource.org/licenses/W3C"
       ],
       "isOsiApproved": true,
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/CC-PDDC.html",
+      "reference": "https://spdx.org/licenses/Adobe-2006.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-PDDC.json",
-      "referenceNumber": 26,
-      "name": "Creative Commons Public Domain Dedication and Certificati=
on",
-      "licenseId": "CC-PDDC",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-2006.json",
+      "referenceNumber": 25,
+      "name": "Adobe Systems Incorporated Source Code License Agreement"=
,
+      "licenseId": "Adobe-2006",
       "seeAlso": [
-        "https://creativecommons.org/licenses/publicdomain/"
+        "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
       ],
       "isOsiApproved": false
     },
@@ -339,7 +326,7 @@
       "reference": "https://spdx.org/licenses/Net-SNMP.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Net-SNMP.json",
-      "referenceNumber": 27,
+      "referenceNumber": 26,
       "name": "Net-SNMP License",
       "licenseId": "Net-SNMP",
       "seeAlso": [
@@ -347,6 +334,19 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-4.0.json",
+      "referenceNumber": 27,
+      "name": "Creative Commons Attribution Share Alike 4.0 Internationa=
l",
+      "licenseId": "CC-BY-SA-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
     {
       "reference": "https://spdx.org/licenses/YPL-1.0.html",
       "isDeprecatedLicenseId": false,
@@ -359,23 +359,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/Adobe-2006.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Adobe-2006.json",
-      "referenceNumber": 29,
-      "name": "Adobe Systems Incorporated Source Code License Agreement"=
,
-      "licenseId": "Adobe-2006",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/Nunit.html",
       "isDeprecatedLicenseId": true,
       "detailsUrl": "https://spdx.org/licenses/Nunit.json",
-      "referenceNumber": 30,
+      "referenceNumber": 29,
       "name": "Nunit License",
       "licenseId": "Nunit",
       "seeAlso": [
@@ -387,7 +375,7 @@
       "reference": "https://spdx.org/licenses/MITNFA.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/MITNFA.json",
-      "referenceNumber": 31,
+      "referenceNumber": 30,
       "name": "MIT +no-false-attribs license",
       "licenseId": "MITNFA",
       "seeAlso": [
@@ -395,6 +383,19 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/PHP-3.01.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PHP-3.01.json",
+      "referenceNumber": 31,
+      "name": "PHP License v3.01",
+      "licenseId": "PHP-3.01",
+      "seeAlso": [
+        "http://www.php.net/license/3_01.txt"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
     {
       "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
       "isDeprecatedLicenseId": false,
@@ -420,18 +421,16 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
+      "reference": "https://spdx.org/licenses/Motosoto.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OPUBL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
       "referenceNumber": 34,
-      "name": "Open Publication License v1.0",
-      "licenseId": "OPUBL-1.0",
+      "name": "Motosoto License",
+      "licenseId": "Motosoto",
       "seeAlso": [
-        "http://opencontent.org/openpub/",
-        "https://www.debian.org/opl",
-        "https://www.ctan.org/license/opl"
+        "https://opensource.org/licenses/Motosoto"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/OSL-1.1.html",
@@ -447,41 +446,40 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
+      "reference": "https://spdx.org/licenses/NGPL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-4.0.json",
+      "detailsUrl": "https://spdx.org/licenses/NGPL.json",
       "referenceNumber": 36,
-      "name": "Creative Commons Attribution Share Alike 4.0 Internationa=
l",
-      "licenseId": "CC-BY-SA-4.0",
+      "name": "Nethack General Public License",
+      "licenseId": "NGPL",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
+        "https://opensource.org/licenses/NGPL"
       ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+      "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/Unicode-TOU.html",
+      "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Unicode-TOU.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5-AU.json",
       "referenceNumber": 37,
-      "name": "Unicode Terms of Use",
-      "licenseId": "Unicode-TOU",
+      "name": "Creative Commons Attribution 2.5 Australia",
+      "licenseId": "CC-BY-2.5-AU",
       "seeAlso": [
-        "http://www.unicode.org/copyright.html"
+        "https://creativecommons.org/licenses/by/2.5/au/legalcode"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/NGPL.html",
+      "reference": "https://spdx.org/licenses/Unicode-TOU.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NGPL.json",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-TOU.json",
       "referenceNumber": 38,
-      "name": "Nethack General Public License",
-      "licenseId": "NGPL",
+      "name": "Unicode Terms of Use",
+      "licenseId": "Unicode-TOU",
       "seeAlso": [
-        "https://opensource.org/licenses/NGPL"
+        "http://www.unicode.org/copyright.html"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Li=
cense.html",
@@ -496,16 +494,18 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Motosoto.html",
+      "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
+      "detailsUrl": "https://spdx.org/licenses/OPUBL-1.0.json",
       "referenceNumber": 40,
-      "name": "Motosoto License",
-      "licenseId": "Motosoto",
+      "name": "Open Publication License v1.0",
+      "licenseId": "OPUBL-1.0",
       "seeAlso": [
-        "https://opensource.org/licenses/Motosoto"
+        "http://opencontent.org/openpub/",
+        "https://www.debian.org/opl",
+        "https://www.ctan.org/license/opl"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
@@ -520,47 +520,35 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/gnuplot.html",
+      "reference": "https://spdx.org/licenses/NLOD-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/gnuplot.json",
+      "detailsUrl": "https://spdx.org/licenses/NLOD-2.0.json",
       "referenceNumber": 42,
-      "name": "gnuplot License",
-      "licenseId": "gnuplot",
+      "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
+      "licenseId": "NLOD-2.0",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Gnuplot"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/Eurosym.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Eurosym.json",
-      "referenceNumber": 43,
-      "name": "Eurosym License",
-      "licenseId": "Eurosym",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Eurosym"
+        "http://data.norge.no/nlod/en/2.0"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
+      "reference": "https://spdx.org/licenses/gnuplot.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5-AU.json",
-      "referenceNumber": 44,
-      "name": "Creative Commons Attribution 2.5 Australia",
-      "licenseId": "CC-BY-2.5-AU",
+      "detailsUrl": "https://spdx.org/licenses/gnuplot.json",
+      "referenceNumber": 43,
+      "name": "gnuplot License",
+      "licenseId": "gnuplot",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/2.5/au/legalcode"
+        "https://fedoraproject.org/wiki/Licensing/Gnuplot"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/EPICS.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/EPICS.json",
-      "referenceNumber": 45,
+      "referenceNumber": 44,
       "name": "EPICS Open License",
       "licenseId": "EPICS",
       "seeAlso": [
@@ -572,7 +560,7 @@
       "reference": "https://spdx.org/licenses/Info-ZIP.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Info-ZIP.json",
-      "referenceNumber": 46,
+      "referenceNumber": 45,
       "name": "Info-ZIP License",
       "licenseId": "Info-ZIP",
       "seeAlso": [
@@ -584,7 +572,7 @@
       "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.json",
-      "referenceNumber": 47,
+      "referenceNumber": 46,
       "name": "Open LDAP Public License v2.0 (or possibly 2.0A and 2.0B)=
",
       "licenseId": "OLDAP-2.0",
       "seeAlso": [
@@ -592,6 +580,18 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-P-2.0.json",
+      "referenceNumber": 47,
+      "name": "CERN Open Hardware Licence Version 2 - Permissive",
+      "licenseId": "CERN-OHL-P-2.0",
+      "seeAlso": [
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
+      ],
+      "isOsiApproved": true
+    },
     {
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Wa=
rranty.html",
       "isDeprecatedLicenseId": false,
@@ -604,23 +604,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-P-2.0.json",
-      "referenceNumber": 49,
-      "name": "CERN Open Hardware Licence Version 2 - Permissive",
-      "licenseId": "CERN-OHL-P-2.0",
-      "seeAlso": [
-        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
-      ],
-      "isOsiApproved": true
-    },
     {
       "reference": "https://spdx.org/licenses/AML.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/AML.json",
-      "referenceNumber": 50,
+      "referenceNumber": 49,
       "name": "Apple MIT License",
       "licenseId": "AML",
       "seeAlso": [
@@ -632,7 +620,7 @@
       "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/MulanPSL-1.0.json",
-      "referenceNumber": 51,
+      "referenceNumber": 50,
       "name": "Mulan Permissive Software License, Version 1",
       "licenseId": "MulanPSL-1.0",
       "seeAlso": [
@@ -641,6 +629,18 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/Multics.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Multics.json",
+      "referenceNumber": 51,
+      "name": "Multics License",
+      "licenseId": "Multics",
+      "seeAlso": [
+        "https://opensource.org/licenses/Multics"
+      ],
+      "isOsiApproved": true
+    },
     {
       "reference": "https://spdx.org/licenses/VSL-1.0.html",
       "isDeprecatedLicenseId": false,
@@ -654,39 +654,38 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/NLOD-2.0.html",
+      "reference": "https://spdx.org/licenses/RSA-MD.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NLOD-2.0.json",
+      "detailsUrl": "https://spdx.org/licenses/RSA-MD.json",
       "referenceNumber": 53,
-      "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
-      "licenseId": "NLOD-2.0",
+      "name": "RSA Message-Digest License",
+      "licenseId": "RSA-MD",
       "seeAlso": [
-        "http://data.norge.no/nlod/en/2.0"
+        "http://www.faqs.org/rfcs/rfc1321.html"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/RSA-MD.html",
+      "reference": "https://spdx.org/licenses/CC-PDDC.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RSA-MD.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-PDDC.json",
       "referenceNumber": 54,
-      "name": "RSA Message-Digest License",
-      "licenseId": "RSA-MD",
+      "name": "Creative Commons Public Domain Dedication and Certificati=
on",
+      "licenseId": "CC-PDDC",
       "seeAlso": [
-        "http://www.faqs.org/rfcs/rfc1321.html"
+        "https://creativecommons.org/licenses/publicdomain/"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/O-UDA-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.json",
       "referenceNumber": 55,
-      "name": "Open Use of Data Agreement v1.0",
-      "licenseId": "O-UDA-1.0",
+      "name": "Creative Commons Attribution Share Alike 2.1 Japan",
+      "licenseId": "CC-BY-SA-2.1-JP",
       "seeAlso": [
-        "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1=
.0/O-UDA-1.0.md",
-        "https://cdla.dev/open-use-of-data-agreement-v1-0/"
+        "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
       ],
       "isOsiApproved": false
     },
@@ -703,23 +702,11 @@
       "isOsiApproved": false,
       "isFsfLibre": true
     },
-    {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.json",
-      "referenceNumber": 57,
-      "name": "Creative Commons Attribution Share Alike 2.1 Japan",
-      "licenseId": "CC-BY-SA-2.1-JP",
-      "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/Spencer-94.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Spencer-94.json",
-      "referenceNumber": 58,
+      "referenceNumber": 57,
       "name": "Spencer License 94",
       "licenseId": "Spencer-94",
       "seeAlso": [
@@ -731,7 +718,7 @@
       "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/OLDAP-1.2.json",
-      "referenceNumber": 59,
+      "referenceNumber": 58,
       "name": "Open LDAP Public License v1.2",
       "licenseId": "OLDAP-1.2",
       "seeAlso": [
@@ -739,6 +726,19 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/O-UDA-1.0.json",
+      "referenceNumber": 59,
+      "name": "Open Use of Data Agreement v1.0",
+      "licenseId": "O-UDA-1.0",
+      "seeAlso": [
+        "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1=
.0/O-UDA-1.0.md",
+        "https://cdla.dev/open-use-of-data-agreement-v1-0/"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
       "isDeprecatedLicenseId": false,
@@ -801,23 +801,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/BSD-Protection.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
-      "referenceNumber": 65,
-      "name": "BSD Protection License",
-      "licenseId": "BSD-Protection",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License=
"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/LiLiQ-R-1.1.json",
-      "referenceNumber": 66,
+      "referenceNumber": 65,
       "name": "Licence Libre du Qu=C3=A9bec =E2=80=93 R=C3=A9ciprocit=C3=
=A9 version 1.1",
       "licenseId": "LiLiQ-R-1.1",
       "seeAlso": [
@@ -830,7 +818,7 @@
       "reference": "https://spdx.org/licenses/Noweb.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Noweb.json",
-      "referenceNumber": 67,
+      "referenceNumber": 66,
       "name": "Noweb License",
       "licenseId": "Noweb",
       "seeAlso": [
@@ -838,23 +826,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-lat=
er.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-or-la=
ter.json",
-      "referenceNumber": 68,
-      "name": "GNU Free Documentation License v1.3 or later - invariants=
",
-      "licenseId": "GFDL-1.3-invariants-or-later",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/CC0-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC0-1.0.json",
-      "referenceNumber": 69,
+      "referenceNumber": 67,
       "name": "Creative Commons Zero v1.0 Universal",
       "licenseId": "CC0-1.0",
       "seeAlso": [
@@ -863,11 +839,23 @@
       "isOsiApproved": false,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/BSD-Protection.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
+      "referenceNumber": 68,
+      "name": "BSD Protection License",
+      "licenseId": "BSD-Protection",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License=
"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.5.json",
-      "referenceNumber": 70,
+      "referenceNumber": 69,
       "name": "Creative Commons Attribution Non Commercial 2.5 Generic",
       "licenseId": "CC-BY-NC-2.5",
       "seeAlso": [
@@ -879,7 +867,7 @@
       "reference": "https://spdx.org/licenses/Zlib.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Zlib.json",
-      "referenceNumber": 71,
+      "referenceNumber": 70,
       "name": "zlib License",
       "licenseId": "Zlib",
       "seeAlso": [
@@ -890,14 +878,14 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-lat=
er.html",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-lat=
er.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-or-la=
ter.json",
-      "referenceNumber": 72,
-      "name": "GNU Free Documentation License v1.1 or later - invariants=
",
-      "licenseId": "GFDL-1.1-invariants-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-or-la=
ter.json",
+      "referenceNumber": 71,
+      "name": "GNU Free Documentation License v1.3 or later - invariants=
",
+      "licenseId": "GFDL-1.3-invariants-or-later",
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
       ],
       "isOsiApproved": false
     },
@@ -905,7 +893,7 @@
       "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AT.json",
-      "referenceNumber": 73,
+      "referenceNumber": 72,
       "name": "Creative Commons Attribution 3.0 Austria",
       "licenseId": "CC-BY-3.0-AT",
       "seeAlso": [
@@ -917,7 +905,7 @@
       "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/LPPL-1.3c.json",
-      "referenceNumber": 74,
+      "referenceNumber": 73,
       "name": "LaTeX Project Public License v1.3c",
       "licenseId": "LPPL-1.3c",
       "seeAlso": [
@@ -930,7 +918,7 @@
       "reference": "https://spdx.org/licenses/EPL-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/EPL-1.0.json",
-      "referenceNumber": 75,
+      "referenceNumber": 74,
       "name": "Eclipse Public License 1.0",
       "licenseId": "EPL-1.0",
       "seeAlso": [
@@ -940,6 +928,18 @@
       "isOsiApproved": true,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-lat=
er.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-or-la=
ter.json",
+      "referenceNumber": 75,
+      "name": "GNU Free Documentation License v1.1 or later - invariants=
",
+      "licenseId": "GFDL-1.1-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
       "isDeprecatedLicenseId": false,
@@ -964,23 +964,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/Multics.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Multics.json",
-      "referenceNumber": 78,
-      "name": "Multics License",
-      "licenseId": "Multics",
-      "seeAlso": [
-        "https://opensource.org/licenses/Multics"
-      ],
-      "isOsiApproved": true
-    },
     {
       "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/OLDAP-2.3.json",
-      "referenceNumber": 79,
+      "referenceNumber": 78,
       "name": "Open LDAP Public License v2.3",
       "licenseId": "OLDAP-2.3",
       "seeAlso": [
@@ -993,7 +981,7 @@
       "reference": "https://spdx.org/licenses/ZPL-2.1.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/ZPL-2.1.json",
-      "referenceNumber": 80,
+      "referenceNumber": 79,
       "name": "Zope Public License 2.1",
       "licenseId": "ZPL-2.1",
       "seeAlso": [
@@ -1003,22 +991,24 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
+      "reference": "https://spdx.org/licenses/Apache-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.json",
-      "referenceNumber": 81,
-      "name": "Creative Commons Attribution Share Alike 3.0 Germany",
-      "licenseId": "CC-BY-SA-3.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
+      "referenceNumber": 80,
+      "name": "Apache License 2.0",
+      "licenseId": "Apache-2.0",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
+        "https://www.apache.org/licenses/LICENSE-2.0",
+        "https://opensource.org/licenses/Apache-2.0"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/SGI-B-2.0.json",
-      "referenceNumber": 82,
+      "referenceNumber": 81,
       "name": "SGI Free Software License B v2.0",
       "licenseId": "SGI-B-2.0",
       "seeAlso": [
@@ -1028,29 +1018,27 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/Apache-2.0.html",
+      "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
-      "referenceNumber": 83,
-      "name": "Apache License 2.0",
-      "licenseId": "Apache-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
+      "referenceNumber": 82,
+      "name": "Hippocratic License 2.1",
+      "licenseId": "Hippocratic-2.1",
       "seeAlso": [
-        "https://www.apache.org/licenses/LICENSE-2.0",
-        "https://opensource.org/licenses/Apache-2.0"
+        "https://firstdonoharm.dev/version/2/1/license.html",
+        "https://github.com/EthicalSource/hippocratic-license/blob/58c0e=
646d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
-      "referenceNumber": 84,
-      "name": "Hippocratic License 2.1",
-      "licenseId": "Hippocratic-2.1",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.json",
+      "referenceNumber": 83,
+      "name": "Creative Commons Attribution Share Alike 3.0 Germany",
+      "licenseId": "CC-BY-SA-3.0-DE",
       "seeAlso": [
-        "https://firstdonoharm.dev/version/2/1/license.html",
-        "https://github.com/EthicalSource/hippocratic-license/blob/58c0e=
646d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
+        "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
       ],
       "isOsiApproved": false
     },
@@ -1058,7 +1046,7 @@
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.json",
-      "referenceNumber": 85,
+      "referenceNumber": 84,
       "name": "Creative Commons Attribution Non Commercial Share Alike 1=
.0 Generic",
       "licenseId": "CC-BY-NC-SA-1.0",
       "seeAlso": [
@@ -1066,6 +1054,20 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-or-later.json",
+      "referenceNumber": 85,
+      "name": "GNU Lesser General Public License v2.1 or later",
+      "licenseId": "LGPL-2.1-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
     {
       "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
       "isDeprecatedLicenseId": false,
@@ -1103,18 +1105,16 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
+      "reference": "https://spdx.org/licenses/Eurosym.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-or-later.json",
+      "detailsUrl": "https://spdx.org/licenses/Eurosym.json",
       "referenceNumber": 89,
-      "name": "GNU Lesser General Public License v2.1 or later",
-      "licenseId": "LGPL-2.1-or-later",
+      "name": "Eurosym License",
+      "licenseId": "Eurosym",
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
-        "https://opensource.org/licenses/LGPL-2.1"
+        "https://fedoraproject.org/wiki/Licensing/Eurosym"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/GFDL-1.1.html",
@@ -1178,14 +1178,14 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
+      "reference": "https://spdx.org/licenses/libtiff.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2015.json",
+      "detailsUrl": "https://spdx.org/licenses/libtiff.json",
       "referenceNumber": 95,
-      "name": "Unicode License Agreement - Data Files and Software (2015=
)",
-      "licenseId": "Unicode-DFS-2015",
+      "name": "libtiff License",
+      "licenseId": "libtiff",
       "seeAlso": [
-        "https://web.archive.org/web/20151224134844/http://unicode.org/c=
opyright.html"
+        "https://fedoraproject.org/wiki/Licensing/libtiff"
       ],
       "isOsiApproved": false
     },
@@ -1253,18 +1253,16 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/MPL-1.1.html",
+      "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MPL-1.1.json",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2015.json",
       "referenceNumber": 101,
-      "name": "Mozilla Public License 1.1",
-      "licenseId": "MPL-1.1",
+      "name": "Unicode License Agreement - Data Files and Software (2015=
)",
+      "licenseId": "Unicode-DFS-2015",
       "seeAlso": [
-        "http://www.mozilla.org/MPL/MPL-1.1.html",
-        "https://opensource.org/licenses/MPL-1.1"
+        "https://web.archive.org/web/20151224134844/http://unicode.org/c=
opyright.html"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
@@ -1280,34 +1278,24 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/CNRI-Jython.html",
+      "reference": "https://spdx.org/licenses/MPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CNRI-Jython.json",
+      "detailsUrl": "https://spdx.org/licenses/MPL-1.1.json",
       "referenceNumber": 103,
-      "name": "CNRI Jython License",
-      "licenseId": "CNRI-Jython",
-      "seeAlso": [
-        "http://www.jython.org/license.html"
-      ],
-      "isOsiApproved": false
-    },
-    {
-      "reference": "https://spdx.org/licenses/ZPL-1.1.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ZPL-1.1.json",
-      "referenceNumber": 104,
-      "name": "Zope Public License 1.1",
-      "licenseId": "ZPL-1.1",
+      "name": "Mozilla Public License 1.1",
+      "licenseId": "MPL-1.1",
       "seeAlso": [
-        "http://old.zope.org/Resources/License/ZPL-1.1"
+        "http://www.mozilla.org/MPL/MPL-1.1.html",
+        "https://opensource.org/licenses/MPL-1.1"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/GPL-2.0-only.json",
-      "referenceNumber": 105,
+      "referenceNumber": 104,
       "name": "GNU General Public License v2.0 only",
       "licenseId": "GPL-2.0-only",
       "seeAlso": [
@@ -1317,6 +1305,18 @@
       "isOsiApproved": true,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-4.0.json",
+      "referenceNumber": 105,
+      "name": "Creative Commons Attribution Non Commercial 4.0 Internati=
onal",
+      "licenseId": "CC-BY-NC-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/FreeImage.html",
       "isDeprecatedLicenseId": false,
@@ -1342,41 +1342,40 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
+      "reference": "https://spdx.org/licenses/CNRI-Jython.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-4.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Jython.json",
       "referenceNumber": 108,
-      "name": "Creative Commons Attribution Non Commercial 4.0 Internati=
onal",
-      "licenseId": "CC-BY-NC-4.0",
+      "name": "CNRI Jython License",
+      "licenseId": "CNRI-Jython",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
+        "http://www.jython.org/license.html"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Rdisc.html",
+      "reference": "https://spdx.org/licenses/ZPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Rdisc.json",
+      "detailsUrl": "https://spdx.org/licenses/ZPL-1.1.json",
       "referenceNumber": 109,
-      "name": "Rdisc License",
-      "licenseId": "Rdisc",
+      "name": "Zope Public License 1.1",
+      "licenseId": "ZPL-1.1",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
+        "http://old.zope.org/Resources/License/ZPL-1.1"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-except=
ion.html",
+      "reference": "https://spdx.org/licenses/Afmparse.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MPL-2.0-no-copyleft-excep=
tion.json",
+      "detailsUrl": "https://spdx.org/licenses/Afmparse.json",
       "referenceNumber": 110,
-      "name": "Mozilla Public License 2.0 (no copyleft exception)",
-      "licenseId": "MPL-2.0-no-copyleft-exception",
+      "name": "Afmparse License",
+      "licenseId": "Afmparse",
       "seeAlso": [
-        "http://www.mozilla.org/MPL/2.0/",
-        "https://opensource.org/licenses/MPL-2.0"
+        "https://fedoraproject.org/wiki/Licensing/Afmparse"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
@@ -1391,14 +1390,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/libtiff.html",
+      "reference": "https://spdx.org/licenses/Rdisc.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/libtiff.json",
+      "detailsUrl": "https://spdx.org/licenses/Rdisc.json",
       "referenceNumber": 112,
-      "name": "libtiff License",
-      "licenseId": "libtiff",
+      "name": "Rdisc License",
+      "licenseId": "Rdisc",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/libtiff"
+        "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
       ],
       "isOsiApproved": false
     },
@@ -1429,16 +1428,17 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/AAL.html",
+      "reference": "https://spdx.org/licenses/Sendmail.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AAL.json",
+      "detailsUrl": "https://spdx.org/licenses/Sendmail.json",
       "referenceNumber": 115,
-      "name": "Attribution Assurance License",
-      "licenseId": "AAL",
+      "name": "Sendmail License",
+      "licenseId": "Sendmail",
       "seeAlso": [
-        "https://opensource.org/licenses/attribution"
+        "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
+        "https://web.archive.org/web/20160322142305/https://www.sendmail=
.com/pdfs/open_source/sendmail_license.pdf"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
@@ -1453,39 +1453,39 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/APSL-1.2.html",
+      "reference": "https://spdx.org/licenses/AAL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APSL-1.2.json",
+      "detailsUrl": "https://spdx.org/licenses/AAL.json",
       "referenceNumber": 117,
-      "name": "Apple Public Source License 1.2",
-      "licenseId": "APSL-1.2",
+      "name": "Attribution Assurance License",
+      "licenseId": "AAL",
       "seeAlso": [
-        "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
+        "https://opensource.org/licenses/attribution"
       ],
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
+      "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-except=
ion.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-no-RFN.json",
+      "detailsUrl": "https://spdx.org/licenses/MPL-2.0-no-copyleft-excep=
tion.json",
       "referenceNumber": 118,
-      "name": "SIL Open Font License 1.0 with no Reserved Font Name",
-      "licenseId": "OFL-1.0-no-RFN",
+      "name": "Mozilla Public License 2.0 (no copyleft exception)",
+      "licenseId": "MPL-2.0-no-copyleft-exception",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_=
web"
+        "http://www.mozilla.org/MPL/2.0/",
+        "https://opensource.org/licenses/MPL-2.0"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/Sendmail.html",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Sendmail.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.json",
       "referenceNumber": 119,
-      "name": "Sendmail License",
-      "licenseId": "Sendmail",
+      "name": "Creative Commons Attribution Non Commercial No Derivative=
s 2.5 Generic",
+      "licenseId": "CC-BY-NC-ND-2.5",
       "seeAlso": [
-        "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
-        "https://web.archive.org/web/20160322142305/https://www.sendmail=
.com/pdfs/open_source/sendmail_license.pdf"
+        "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
       ],
       "isOsiApproved": false
     },
@@ -1502,16 +1502,18 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
+      "reference": "https://spdx.org/licenses/LPL-1.02.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.json",
+      "detailsUrl": "https://spdx.org/licenses/LPL-1.02.json",
       "referenceNumber": 121,
-      "name": "Creative Commons Attribution Non Commercial No Derivative=
s 2.5 Generic",
-      "licenseId": "CC-BY-NC-ND-2.5",
+      "name": "Lucent Public License v1.02",
+      "licenseId": "LPL-1.02",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
+        "http://plan9.bell-labs.com/plan9/license.html",
+        "https://opensource.org/licenses/LPL-1.02"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/ECL-1.0.html",
@@ -1526,14 +1528,14 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/Afmparse.html",
+      "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Afmparse.json",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-no-RFN.json",
       "referenceNumber": 123,
-      "name": "Afmparse License",
-      "licenseId": "Afmparse",
+      "name": "SIL Open Font License 1.0 with no Reserved Font Name",
+      "licenseId": "OFL-1.0-no-RFN",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Afmparse"
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_=
web"
       ],
       "isOsiApproved": false
     },
@@ -1588,41 +1590,40 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
+      "reference": "https://spdx.org/licenses/APSL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-or-later.json",
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.2.json",
       "referenceNumber": 128,
-      "name": "GNU Free Documentation License v1.3 or later",
-      "licenseId": "GFDL-1.3-or-later",
+      "name": "Apple Public Source License 1.2",
+      "licenseId": "APSL-1.2",
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
+        "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
       ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+      "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/LPL-1.02.html",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-onl=
y.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPL-1.02.json",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-on=
ly.json",
       "referenceNumber": 129,
-      "name": "Lucent Public License v1.02",
-      "licenseId": "LPL-1.02",
+      "name": "GNU Free Documentation License v1.2 only - no invariants"=
,
+      "licenseId": "GFDL-1.2-no-invariants-only",
       "seeAlso": [
-        "http://plan9.bell-labs.com/plan9/license.html",
-        "https://opensource.org/licenses/LPL-1.02"
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/AFL-2.0.html",
+      "reference": "https://spdx.org/licenses/Artistic-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AFL-2.0.json",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-2.0.json",
       "referenceNumber": 130,
-      "name": "Academic Free License v2.0",
-      "licenseId": "AFL-2.0",
+      "name": "Artistic License 2.0",
+      "licenseId": "Artistic-2.0",
       "seeAlso": [
-        "http://wayback.archive.org/web/20060924134533/http://www.openso=
urce.org/licenses/afl-2.0.txt"
+        "http://www.perlfoundation.org/artistic_license_2_0",
+        "https://www.perlfoundation.org/artistic-license-20.html",
+        "https://opensource.org/licenses/artistic-license-2.0"
       ],
       "isOsiApproved": true,
       "isFsfLibre": true
@@ -1642,30 +1643,27 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/Artistic-2.0.html",
+      "reference": "https://spdx.org/licenses/RSCPL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Artistic-2.0.json",
+      "detailsUrl": "https://spdx.org/licenses/RSCPL.json",
       "referenceNumber": 132,
-      "name": "Artistic License 2.0",
-      "licenseId": "Artistic-2.0",
+      "name": "Ricoh Source Code Public License",
+      "licenseId": "RSCPL",
       "seeAlso": [
-        "http://www.perlfoundation.org/artistic_license_2_0",
-        "https://www.perlfoundation.org/artistic-license-20.html",
-        "https://opensource.org/licenses/artistic-license-2.0"
+        "http://wayback.archive.org/web/20060715140826/http://www.risour=
ce.org/RPL/RPL-1.0A.shtml",
+        "https://opensource.org/licenses/RSCPL"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/MS-RL.html",
+      "reference": "https://spdx.org/licenses/Sleepycat.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MS-RL.json",
+      "detailsUrl": "https://spdx.org/licenses/Sleepycat.json",
       "referenceNumber": 133,
-      "name": "Microsoft Reciprocal License",
-      "licenseId": "MS-RL",
+      "name": "Sleepycat License",
+      "licenseId": "Sleepycat",
       "seeAlso": [
-        "http://www.microsoft.com/opensource/licenses.mspx",
-        "https://opensource.org/licenses/MS-RL"
+        "https://opensource.org/licenses/Sleepycat"
       ],
       "isOsiApproved": true,
       "isFsfLibre": true
@@ -1683,14 +1681,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-onl=
y.html",
+      "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-on=
ly.json",
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Sharing-1.0.json",
       "referenceNumber": 135,
-      "name": "GNU Free Documentation License v1.2 only - no invariants"=
,
-      "licenseId": "GFDL-1.2-no-invariants-only",
+      "name": "Community Data License Agreement Sharing 1.0",
+      "licenseId": "CDLA-Sharing-1.0",
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+        "https://cdla.io/sharing-1-0"
       ],
       "isOsiApproved": false
     },
@@ -1709,14 +1707,14 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/HaskellReport.html",
+      "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/HaskellReport.json",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-only.json",
       "referenceNumber": 137,
-      "name": "Haskell Language Report License",
-      "licenseId": "HaskellReport",
+      "name": "Affero General Public License v1.0 only",
+      "licenseId": "AGPL-1.0-only",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Repor=
t_License"
+        "http://www.affero.org/oagpl.html"
       ],
       "isOsiApproved": false
     },
@@ -1733,17 +1731,17 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/RSCPL.html",
+      "reference": "https://spdx.org/licenses/AFL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RSCPL.json",
+      "detailsUrl": "https://spdx.org/licenses/AFL-2.0.json",
       "referenceNumber": 139,
-      "name": "Ricoh Source Code Public License",
-      "licenseId": "RSCPL",
+      "name": "Academic Free License v2.0",
+      "licenseId": "AFL-2.0",
       "seeAlso": [
-        "http://wayback.archive.org/web/20060715140826/http://www.risour=
ce.org/RPL/RPL-1.0A.shtml",
-        "https://opensource.org/licenses/RSCPL"
+        "http://wayback.archive.org/web/20060924134533/http://www.openso=
urce.org/licenses/afl-2.0.txt"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/Intel.html",
@@ -1810,28 +1808,28 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/HTMLTIDY.html",
+      "reference": "https://spdx.org/licenses/Naumen.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/HTMLTIDY.json",
+      "detailsUrl": "https://spdx.org/licenses/Naumen.json",
       "referenceNumber": 145,
-      "name": "HTML Tidy License",
-      "licenseId": "HTMLTIDY",
+      "name": "Naumen Public License",
+      "licenseId": "Naumen",
       "seeAlso": [
-        "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md=
"
+        "https://opensource.org/licenses/Naumen"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/Naumen.html",
+      "reference": "https://spdx.org/licenses/HTMLTIDY.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Naumen.json",
+      "detailsUrl": "https://spdx.org/licenses/HTMLTIDY.json",
       "referenceNumber": 146,
-      "name": "Naumen Public License",
-      "licenseId": "Naumen",
+      "name": "HTML Tidy License",
+      "licenseId": "HTMLTIDY",
       "seeAlso": [
-        "https://opensource.org/licenses/Naumen"
+        "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md=
"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
@@ -1859,16 +1857,16 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-or-later.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.0.json",
       "referenceNumber": 149,
-      "name": "GNU Library General Public License v2 or later",
-      "licenseId": "LGPL-2.0-or-later",
+      "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
+      "licenseId": "CC-BY-ND-2.0",
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
+        "https://creativecommons.org/licenses/by-nd/2.0/legalcode"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/OGTSL.html",
@@ -1884,16 +1882,16 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
+      "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.0.json",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-or-later.json",
       "referenceNumber": 151,
-      "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
-      "licenseId": "CC-BY-ND-2.0",
+      "name": "GNU Library General Public License v2 or later",
+      "licenseId": "LGPL-2.0-or-later",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/2.0/legalcode"
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
@@ -1908,26 +1906,26 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-1.0.json",
       "referenceNumber": 153,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 4=
.0 International",
-      "licenseId": "CC-BY-NC-SA-4.0",
+      "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
+      "licenseId": "CC-BY-ND-1.0",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
+        "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
+      "reference": "https://spdx.org/licenses/dvipdfm.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/dvipdfm.json",
       "referenceNumber": 154,
-      "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
-      "licenseId": "CC-BY-ND-1.0",
+      "name": "dvipdfm License",
+      "licenseId": "dvipdfm",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
+        "https://fedoraproject.org/wiki/Licensing/dvipdfm"
       ],
       "isOsiApproved": false
     },
@@ -1944,64 +1942,64 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/dvipdfm.html",
+      "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/dvipdfm.json",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-UC.json",
       "referenceNumber": 156,
-      "name": "dvipdfm License",
-      "licenseId": "dvipdfm",
+      "name": "BSD-4-Clause (University of California-Specific)",
+      "licenseId": "BSD-4-Clause-UC",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/dvipdfm"
+        "http://www.freebsd.org/copyright/license.html"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-3.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0.json",
+      "reference": "https://spdx.org/licenses/NLOD-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NLOD-1.0.json",
       "referenceNumber": 157,
-      "name": "GNU Lesser General Public License v3.0 only",
-      "licenseId": "LGPL-3.0",
+      "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
+      "licenseId": "NLOD-1.0",
       "seeAlso": [
-        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
-        "https://opensource.org/licenses/LGPL-3.0"
+        "http://data.norge.no/nlod/en/1.0"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
+      "reference": "https://spdx.org/licenses/MS-RL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.5.json",
+      "detailsUrl": "https://spdx.org/licenses/MS-RL.json",
       "referenceNumber": 158,
-      "name": "Open LDAP Public License v2.5",
-      "licenseId": "OLDAP-2.5",
+      "name": "Microsoft Reciprocal License",
+      "licenseId": "MS-RL",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d6852b9d90022e8593c98205413380536b1b5a7cf=
"
+        "http://www.microsoft.com/opensource/licenses.mspx",
+        "https://opensource.org/licenses/MS-RL"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/NLOD-1.0.html",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NLOD-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.json",
       "referenceNumber": 159,
-      "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
-      "licenseId": "NLOD-1.0",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 4=
.0 International",
+      "licenseId": "CC-BY-NC-SA-4.0",
       "seeAlso": [
-        "http://data.norge.no/nlod/en/1.0"
+        "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/SMPPL.html",
+      "reference": "https://spdx.org/licenses/HaskellReport.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SMPPL.json",
+      "detailsUrl": "https://spdx.org/licenses/HaskellReport.json",
       "referenceNumber": 160,
-      "name": "Secure Messaging Protocol Public License",
-      "licenseId": "SMPPL",
+      "name": "Haskell Language Report License",
+      "licenseId": "HaskellReport",
       "seeAlso": [
-        "https://github.com/dcblake/SMP/blob/master/Documentation/Licens=
e.txt"
+        "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Repor=
t_License"
       ],
       "isOsiApproved": false
     },
@@ -2042,28 +2040,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
+      "reference": "https://spdx.org/licenses/SMPPL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-only.json",
+      "detailsUrl": "https://spdx.org/licenses/SMPPL.json",
       "referenceNumber": 164,
-      "name": "GNU Lesser General Public License v2.1 only",
-      "licenseId": "LGPL-2.1-only",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
-        "https://opensource.org/licenses/LGPL-2.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/GL2PS.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GL2PS.json",
-      "referenceNumber": 165,
-      "name": "GL2PS License",
-      "licenseId": "GL2PS",
+      "name": "Secure Messaging Protocol Public License",
+      "licenseId": "SMPPL",
       "seeAlso": [
-        "http://www.geuz.org/gl2ps/COPYING.GL2PS"
+        "https://github.com/dcblake/SMP/blob/master/Documentation/Licens=
e.txt"
       ],
       "isOsiApproved": false
     },
@@ -2071,7 +2055,7 @@
       "reference": "https://spdx.org/licenses/PHP-3.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/PHP-3.0.json",
-      "referenceNumber": 166,
+      "referenceNumber": 165,
       "name": "PHP License v3.0",
       "licenseId": "PHP-3.0",
       "seeAlso": [
@@ -2081,15 +2065,26 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
+      "reference": "https://spdx.org/licenses/GL2PS.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NIST-PD-fallback.json",
+      "detailsUrl": "https://spdx.org/licenses/GL2PS.json",
+      "referenceNumber": 166,
+      "name": "GL2PS License",
+      "licenseId": "GL2PS",
+      "seeAlso": [
+        "http://www.geuz.org/gl2ps/COPYING.GL2PS"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CrystalStacker.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
       "referenceNumber": 167,
-      "name": "NIST Public Domain Notice with license fallback",
-      "licenseId": "NIST-PD-fallback",
+      "name": "CrystalStacker License",
+      "licenseId": "CrystalStacker",
       "seeAlso": [
-        "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897=
d9a7d2656b42abe3/LICENSE",
-        "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c5=
986071cf6568cc34/LICENSE.rst"
+        "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd\u003=
dLicensing/CrystalStacker"
       ],
       "isOsiApproved": false
     },
@@ -2106,17 +2101,17 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CPL-1.0.html",
+      "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CPL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD-fallback.json",
       "referenceNumber": 169,
-      "name": "Common Public License 1.0",
-      "licenseId": "CPL-1.0",
+      "name": "NIST Public Domain Notice with license fallback",
+      "licenseId": "NIST-PD-fallback",
       "seeAlso": [
-        "https://opensource.org/licenses/CPL-1.0"
+        "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897=
d9a7d2656b42abe3/LICENSE",
+        "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c5=
986071cf6568cc34/LICENSE.rst"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
@@ -2131,29 +2126,31 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CrystalStacker.html",
+      "reference": "https://spdx.org/licenses/CPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
+      "detailsUrl": "https://spdx.org/licenses/CPL-1.0.json",
       "referenceNumber": 171,
-      "name": "CrystalStacker License",
-      "licenseId": "CrystalStacker",
+      "name": "Common Public License 1.0",
+      "licenseId": "CPL-1.0",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd\u003=
dLicensing/CrystalStacker"
+        "https://opensource.org/licenses/CPL-1.0"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/TCL.html",
+      "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TCL.json",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-only.json",
       "referenceNumber": 172,
-      "name": "TCL/TK License",
-      "licenseId": "TCL",
+      "name": "GNU Lesser General Public License v2.1 only",
+      "licenseId": "LGPL-2.1-only",
       "seeAlso": [
-        "http://www.tcl.tk/software/tcltk/license.html",
-        "https://fedoraproject.org/wiki/Licensing/TCL"
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
+        "https://opensource.org/licenses/LGPL-2.1"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/ZPL-2.0.html",
@@ -2207,23 +2204,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
-      "referenceNumber": 177,
-      "name": "GNU Library General Public License v2 only",
-      "licenseId": "LGPL-2.0",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
-      ],
-      "isOsiApproved": true
-    },
     {
       "reference": "https://spdx.org/licenses/EFL-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/EFL-2.0.json",
-      "referenceNumber": 178,
+      "referenceNumber": 177,
       "name": "Eiffel Forum License v2.0",
       "licenseId": "EFL-2.0",
       "seeAlso": [
@@ -2233,6 +2218,18 @@
       "isOsiApproved": true,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/Spencer-99.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Spencer-99.json",
+      "referenceNumber": 178,
+      "name": "Spencer License 99",
+      "licenseId": "Spencer-99",
+      "seeAlso": [
+        "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/re=
gfronts.c"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exce=
ption.html",
       "isDeprecatedLicenseId": false,
@@ -2259,14 +2256,15 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/psutils.html",
+      "reference": "https://spdx.org/licenses/TCL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/psutils.json",
+      "detailsUrl": "https://spdx.org/licenses/TCL.json",
       "referenceNumber": 181,
-      "name": "psutils License",
-      "licenseId": "psutils",
+      "name": "TCL/TK License",
+      "licenseId": "TCL",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/psutils"
+        "http://www.tcl.tk/software/tcltk/license.html",
+        "https://fedoraproject.org/wiki/Licensing/TCL"
       ],
       "isOsiApproved": false
     },
@@ -2295,62 +2293,62 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-W-2.0.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
       "referenceNumber": 184,
-      "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal"=
,
-      "licenseId": "CERN-OHL-W-2.0",
+      "name": "GNU Library General Public License v2 only",
+      "licenseId": "LGPL-2.0",
       "seeAlso": [
-        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
       ],
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/NRL.html",
+      "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NRL.json",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-W-2.0.json",
       "referenceNumber": 185,
-      "name": "NRL License",
-      "licenseId": "NRL",
+      "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal"=
,
+      "licenseId": "CERN-OHL-W-2.0",
       "seeAlso": [
-        "http://web.mit.edu/network/isakmp/nrllicense.html"
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-2.1.html",
+      "reference": "https://spdx.org/licenses/Glide.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-2.1.json",
+      "detailsUrl": "https://spdx.org/licenses/Glide.json",
       "referenceNumber": 186,
-      "name": "CeCILL Free Software License Agreement v2.1",
-      "licenseId": "CECILL-2.1",
+      "name": "3dfx Glide License",
+      "licenseId": "Glide",
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
+        "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Glide.html",
+      "reference": "https://spdx.org/licenses/mpich2.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Glide.json",
+      "detailsUrl": "https://spdx.org/licenses/mpich2.json",
       "referenceNumber": 187,
-      "name": "3dfx Glide License",
-      "licenseId": "Glide",
+      "name": "mpich2 License",
+      "licenseId": "mpich2",
       "seeAlso": [
-        "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
+        "https://fedoraproject.org/wiki/Licensing/MIT"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/SCEA.html",
+      "reference": "https://spdx.org/licenses/psutils.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SCEA.json",
+      "detailsUrl": "https://spdx.org/licenses/psutils.json",
       "referenceNumber": 188,
-      "name": "SCEA Shared Source License",
-      "licenseId": "SCEA",
+      "name": "psutils License",
+      "licenseId": "psutils",
       "seeAlso": [
-        "http://research.scea.com/scea_shared_source_license.html"
+        "https://fedoraproject.org/wiki/Licensing/psutils"
       ],
       "isOsiApproved": false
     },
@@ -2394,52 +2392,52 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/SWL.html",
+      "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SWL.json",
+      "detailsUrl": "https://spdx.org/licenses/FreeBSD-DOC.json",
       "referenceNumber": 192,
-      "name": "Scheme Widget Library (SWL) Software License Agreement",
-      "licenseId": "SWL",
+      "name": "FreeBSD Documentation License",
+      "licenseId": "FreeBSD-DOC",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/SWL"
+        "https://www.freebsd.org/copyright/freebsd-doc-license/"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/mpich2.html",
+      "reference": "https://spdx.org/licenses/SCEA.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/mpich2.json",
+      "detailsUrl": "https://spdx.org/licenses/SCEA.json",
       "referenceNumber": 193,
-      "name": "mpich2 License",
-      "licenseId": "mpich2",
+      "name": "SCEA Shared Source License",
+      "licenseId": "SCEA",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT"
+        "http://research.scea.com/scea_shared_source_license.html"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
+      "reference": "https://spdx.org/licenses/Latex2e.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.1.json",
+      "detailsUrl": "https://spdx.org/licenses/Latex2e.json",
       "referenceNumber": 194,
-      "name": "CERN Open Hardware Licence v1.1",
-      "licenseId": "CERN-OHL-1.1",
+      "name": "Latex2e License",
+      "licenseId": "Latex2e",
       "seeAlso": [
-        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
+        "https://fedoraproject.org/wiki/Licensing/Latex2e"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Latex2e.html",
+      "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Latex2e.json",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-cl8.json",
       "referenceNumber": 195,
-      "name": "Latex2e License",
-      "licenseId": "Latex2e",
+      "name": "Artistic License 1.0 w/clause 8",
+      "licenseId": "Artistic-1.0-cl8",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Latex2e"
+        "https://opensource.org/licenses/Artistic-1.0"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
@@ -2454,28 +2452,28 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
+      "reference": "https://spdx.org/licenses/NRL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FreeBSD-DOC.json",
+      "detailsUrl": "https://spdx.org/licenses/NRL.json",
       "referenceNumber": 197,
-      "name": "FreeBSD Documentation License",
-      "licenseId": "FreeBSD-DOC",
+      "name": "NRL License",
+      "licenseId": "NRL",
       "seeAlso": [
-        "https://www.freebsd.org/copyright/freebsd-doc-license/"
+        "http://web.mit.edu/network/isakmp/nrllicense.html"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
+      "reference": "https://spdx.org/licenses/SWL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-cl8.json",
+      "detailsUrl": "https://spdx.org/licenses/SWL.json",
       "referenceNumber": 198,
-      "name": "Artistic License 1.0 w/clause 8",
-      "licenseId": "Artistic-1.0-cl8",
+      "name": "Scheme Widget Library (SWL) Software License Agreement",
+      "licenseId": "SWL",
       "seeAlso": [
-        "https://opensource.org/licenses/Artistic-1.0"
+        "https://fedoraproject.org/wiki/Licensing/SWL"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/Zed.html",
@@ -2490,26 +2488,26 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RHeCos-1.1.json",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.1.json",
       "referenceNumber": 200,
-      "name": "Red Hat eCos Public License v1.1",
-      "licenseId": "RHeCos-1.1",
+      "name": "CERN Open Hardware Licence v1.1",
+      "licenseId": "CERN-OHL-1.1",
       "seeAlso": [
-        "http://ecos.sourceware.org/old-license.html"
+        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/SSPL-1.0.html",
+      "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SSPL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/RHeCos-1.1.json",
       "referenceNumber": 201,
-      "name": "Server Side Public License, v 1",
-      "licenseId": "SSPL-1.0",
+      "name": "Red Hat eCos Public License v1.1",
+      "licenseId": "RHeCos-1.1",
       "seeAlso": [
-        "https://www.mongodb.com/licensing/server-side-public-license"
+        "http://ecos.sourceware.org/old-license.html"
       ],
       "isOsiApproved": false
     },
@@ -2525,11 +2523,23 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/SSPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SSPL-1.0.json",
+      "referenceNumber": 203,
+      "name": "Server Side Public License, v 1",
+      "licenseId": "SSPL-1.0",
+      "seeAlso": [
+        "https://www.mongodb.com/licensing/server-side-public-license"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/GPL-2.0+.html",
       "isDeprecatedLicenseId": true,
       "detailsUrl": "https://spdx.org/licenses/GPL-2.0+.json",
-      "referenceNumber": 203,
+      "referenceNumber": 204,
       "name": "GNU General Public License v2.0 or later",
       "licenseId": "GPL-2.0+",
       "seeAlso": [
@@ -2542,7 +2552,7 @@
       "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/OLDAP-1.4.json",
-      "referenceNumber": 204,
+      "referenceNumber": 205,
       "name": "Open LDAP Public License v1.4",
       "licenseId": "OLDAP-1.4",
       "seeAlso": [
@@ -2554,7 +2564,7 @@
       "reference": "https://spdx.org/licenses/libpng-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/libpng-2.0.json",
-      "referenceNumber": 205,
+      "referenceNumber": 206,
       "name": "PNG Reference Library version 2",
       "licenseId": "libpng-2.0",
       "seeAlso": [
@@ -2566,7 +2576,7 @@
       "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible=
.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CNRI-Python-GPL-Compatibl=
e.json",
-      "referenceNumber": 206,
+      "referenceNumber": 207,
       "name": "CNRI Python Open Source GPL Compatible License Agreement"=
,
       "licenseId": "CNRI-Python-GPL-Compatible",
       "seeAlso": [
@@ -2574,18 +2584,6 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.0.json",
-      "referenceNumber": 207,
-      "name": "Creative Commons Attribution 2.0 Generic",
-      "licenseId": "CC-BY-2.0",
-      "seeAlso": [
-        "https://creativecommons.org/licenses/by/2.0/legalcode"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/Aladdin.html",
       "isDeprecatedLicenseId": false,
@@ -2599,17 +2597,16 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Sleepycat.html",
+      "reference": "https://spdx.org/licenses/CECILL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Sleepycat.json",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.0.json",
       "referenceNumber": 209,
-      "name": "Sleepycat License",
-      "licenseId": "Sleepycat",
+      "name": "CeCILL Free Software License Agreement v1.0",
+      "licenseId": "CECILL-1.0",
       "seeAlso": [
-        "https://opensource.org/licenses/Sleepycat"
+        "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/Ruby.html",
@@ -2624,11 +2621,24 @@
       "isOsiApproved": false,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/NPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NPL-1.1.json",
+      "referenceNumber": 211,
+      "name": "Netscape Public License v1.1",
+      "licenseId": "NPL-1.1",
+      "seeAlso": [
+        "http://www.mozilla.org/MPL/NPL/1.1/"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
     {
       "reference": "https://spdx.org/licenses/ImageMagick.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/ImageMagick.json",
-      "referenceNumber": 211,
+      "referenceNumber": 212,
       "name": "ImageMagick License",
       "licenseId": "ImageMagick",
       "seeAlso": [
@@ -2637,14 +2647,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-1.0.html",
+      "reference": "https://spdx.org/licenses/Cube.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-1.0.json",
-      "referenceNumber": 212,
-      "name": "CeCILL Free Software License Agreement v1.0",
-      "licenseId": "CECILL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/Cube.json",
+      "referenceNumber": 213,
+      "name": "Cube License",
+      "licenseId": "Cube",
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
+        "https://fedoraproject.org/wiki/Licensing/Cube"
       ],
       "isOsiApproved": false
     },
@@ -2652,7 +2662,7 @@
       "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-only.json",
-      "referenceNumber": 213,
+      "referenceNumber": 214,
       "name": "GNU Free Documentation License v1.1 only",
       "licenseId": "GFDL-1.1-only",
       "seeAlso": [
@@ -2662,41 +2672,30 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/NPL-1.1.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NPL-1.1.json",
-      "referenceNumber": 214,
-      "name": "Netscape Public License v1.1",
-      "licenseId": "NPL-1.1",
-      "seeAlso": [
-        "http://www.mozilla.org/MPL/NPL/1.1/"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
+      "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-2.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.0.json",
       "referenceNumber": 215,
-      "name": "Technische Universitaet Berlin License 2.0",
-      "licenseId": "TU-Berlin-2.0",
+      "name": "Creative Commons Attribution 2.0 Generic",
+      "licenseId": "CC-BY-2.0",
       "seeAlso": [
-        "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39=
e438a015da50035/licences/libgsm.txt"
+        "https://creativecommons.org/licenses/by/2.0/legalcode"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Cube.html",
+      "reference": "https://spdx.org/licenses/AFL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Cube.json",
+      "detailsUrl": "https://spdx.org/licenses/AFL-1.2.json",
       "referenceNumber": 216,
-      "name": "Cube License",
-      "licenseId": "Cube",
+      "name": "Academic Free License v1.2",
+      "licenseId": "AFL-1.2",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Cube"
+        "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
+        "http://wayback.archive.org/web/20021204204652/http://www.openso=
urce.org/licenses/academic.php"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
@@ -2710,23 +2709,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/MIT-advertising.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-advertising.json",
-      "referenceNumber": 218,
-      "name": "Enlightenment License (e16)",
-      "licenseId": "MIT-advertising",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/CECILL-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CECILL-2.0.json",
-      "referenceNumber": 219,
+      "referenceNumber": 218,
       "name": "CeCILL Free Software License Agreement v2.0",
       "licenseId": "CECILL-2.0",
       "seeAlso": [
@@ -2735,6 +2722,18 @@
       "isOsiApproved": false,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/MIT-advertising.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-advertising.json",
+      "referenceNumber": 219,
+      "name": "Enlightenment License (e16)",
+      "licenseId": "MIT-advertising",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
       "isDeprecatedLicenseId": false,
@@ -2760,15 +2759,15 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/AFL-1.2.html",
+      "reference": "https://spdx.org/licenses/OSL-3.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AFL-1.2.json",
+      "detailsUrl": "https://spdx.org/licenses/OSL-3.0.json",
       "referenceNumber": 222,
-      "name": "Academic Free License v1.2",
-      "licenseId": "AFL-1.2",
+      "name": "Open Software License 3.0",
+      "licenseId": "OSL-3.0",
       "seeAlso": [
-        "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
-        "http://wayback.archive.org/web/20021204204652/http://www.openso=
urce.org/licenses/academic.php"
+        "https://web.archive.org/web/20120101081418/http://rosenlaw.com:=
80/OSL3.0.htm",
+        "https://opensource.org/licenses/OSL-3.0"
       ],
       "isOsiApproved": true,
       "isFsfLibre": true
@@ -2810,25 +2809,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/OSL-3.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSL-3.0.json",
-      "referenceNumber": 226,
-      "name": "Open Software License 3.0",
-      "licenseId": "OSL-3.0",
-      "seeAlso": [
-        "https://web.archive.org/web/20120101081418/http://rosenlaw.com:=
80/OSL3.0.htm",
-        "https://opensource.org/licenses/OSL-3.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
-    },
     {
       "reference": "https://spdx.org/licenses/EUDatagrid.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/EUDatagrid.json",
-      "referenceNumber": 227,
+      "referenceNumber": 226,
       "name": "EU DataGrid Software License",
       "licenseId": "EUDatagrid",
       "seeAlso": [
@@ -2842,7 +2827,7 @@
       "reference": "https://spdx.org/licenses/MTLL.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/MTLL.json",
-      "referenceNumber": 228,
+      "referenceNumber": 227,
       "name": "Matrix Template Library License",
       "licenseId": "MTLL",
       "seeAlso": [
@@ -2854,7 +2839,7 @@
       "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.h=
tml",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-only.=
json",
-      "referenceNumber": 229,
+      "referenceNumber": 228,
       "name": "GNU Free Documentation License v1.2 only - invariants",
       "licenseId": "GFDL-1.2-invariants-only",
       "seeAlso": [
@@ -2862,6 +2847,18 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-=
later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or=
-later.json",
+      "referenceNumber": 229,
+      "name": "GNU Free Documentation License v1.3 or later - no invaria=
nts",
+      "licenseId": "GFDL-1.3-no-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/curl.html",
       "isDeprecatedLicenseId": false,
@@ -2875,14 +2872,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
+      "reference": "https://spdx.org/licenses/LAL-1.3.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0.json",
+      "detailsUrl": "https://spdx.org/licenses/LAL-1.3.json",
       "referenceNumber": 231,
-      "name": "Creative Commons Attribution 3.0 Unported",
-      "licenseId": "CC-BY-3.0",
+      "name": "Licence Art Libre 1.3",
+      "licenseId": "LAL-1.3",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/3.0/legalcode"
+        "https://artlibre.org/"
       ],
       "isOsiApproved": false
     },
@@ -2899,26 +2896,26 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/LAL-1.3.html",
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LAL-1.3.json",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.2.json",
       "referenceNumber": 233,
-      "name": "Licence Art Libre 1.3",
-      "licenseId": "LAL-1.3",
+      "name": "CERN Open Hardware Licence v1.2",
+      "licenseId": "CERN-OHL-1.2",
       "seeAlso": [
-        "https://artlibre.org/"
+        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
+      "reference": "https://spdx.org/licenses/TOSL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.2.json",
+      "detailsUrl": "https://spdx.org/licenses/TOSL.json",
       "referenceNumber": 234,
-      "name": "CERN Open Hardware Licence v1.2",
-      "licenseId": "CERN-OHL-1.2",
+      "name": "Trusster Open Source License",
+      "licenseId": "TOSL",
       "seeAlso": [
-        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
+        "https://fedoraproject.org/wiki/Licensing/TOSL"
       ],
       "isOsiApproved": false
     },
@@ -2935,38 +2932,38 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/TOSL.html",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TOSL.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0.json",
       "referenceNumber": 236,
-      "name": "Trusster Open Source License",
-      "licenseId": "TOSL",
+      "name": "Creative Commons Attribution 3.0 Unported",
+      "licenseId": "CC-BY-3.0",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/TOSL"
+        "https://creativecommons.org/licenses/by/3.0/legalcode"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-onl=
y.html",
+      "reference": "https://spdx.org/licenses/Qhull.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-on=
ly.json",
+      "detailsUrl": "https://spdx.org/licenses/Qhull.json",
       "referenceNumber": 237,
-      "name": "GNU Free Documentation License v1.3 only - no invariants"=
,
-      "licenseId": "GFDL-1.3-no-invariants-only",
+      "name": "Qhull License",
+      "licenseId": "Qhull",
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
+        "https://fedoraproject.org/wiki/Licensing/Qhull"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Qhull.html",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-onl=
y.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Qhull.json",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-on=
ly.json",
       "referenceNumber": 238,
-      "name": "Qhull License",
-      "licenseId": "Qhull",
+      "name": "GNU Free Documentation License v1.3 only - no invariants"=
,
+      "licenseId": "GFDL-1.3-no-invariants-only",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Qhull"
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
       ],
       "isOsiApproved": false
     },
@@ -3073,28 +3070,29 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
+      "reference": "https://spdx.org/licenses/Xerox.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Sharing-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/Xerox.json",
       "referenceNumber": 247,
-      "name": "Community Data License Agreement Sharing 1.0",
-      "licenseId": "CDLA-Sharing-1.0",
+      "name": "Xerox License",
+      "licenseId": "Xerox",
       "seeAlso": [
-        "https://cdla.io/sharing-1-0"
+        "https://fedoraproject.org/wiki/Licensing/Xerox"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
+      "reference": "https://spdx.org/licenses/CDDL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-only.json",
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.0.json",
       "referenceNumber": 248,
-      "name": "Affero General Public License v1.0 only",
-      "licenseId": "AGPL-1.0-only",
+      "name": "Common Development and Distribution License 1.0",
+      "licenseId": "CDDL-1.0",
       "seeAlso": [
-        "http://www.affero.org/oagpl.html"
+        "https://opensource.org/licenses/cddl1"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.h=
tml",
@@ -3109,14 +3107,15 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
+      "reference": "https://spdx.org/licenses/etalab-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-UC.json",
+      "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
       "referenceNumber": 250,
-      "name": "BSD-4-Clause (University of California-Specific)",
-      "licenseId": "BSD-4-Clause-UC",
+      "name": "Etalab Open License 2.0",
+      "licenseId": "etalab-2.0",
       "seeAlso": [
-        "http://www.freebsd.org/copyright/license.html"
+        "https://github.com/DISIC/politique-de-contribution-open-source/=
blob/master/LICENSE.pdf",
+        "https://raw.githubusercontent.com/DISIC/politique-de-contributi=
on-open-source/master/LICENSE"
       ],
       "isOsiApproved": false
     },
@@ -3146,14 +3145,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Spencer-99.html",
+      "reference": "https://spdx.org/licenses/LPPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Spencer-99.json",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.1.json",
       "referenceNumber": 253,
-      "name": "Spencer License 99",
-      "licenseId": "Spencer-99",
+      "name": "LaTeX Project Public License v1.1",
+      "licenseId": "LPPL-1.1",
       "seeAlso": [
-        "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/re=
gfronts.c"
+        "http://www.latex-project.org/lppl/lppl-1-1.txt"
       ],
       "isOsiApproved": false
     },
@@ -3170,53 +3169,39 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-=
later.html",
+      "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or=
-later.json",
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-2.0.json",
       "referenceNumber": 255,
-      "name": "GNU Free Documentation License v1.3 or later - no invaria=
nts",
-      "licenseId": "GFDL-1.3-no-invariants-or-later",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false
-    },
-    {
-      "reference": "https://spdx.org/licenses/LPPL-1.1.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.1.json",
-      "referenceNumber": 256,
-      "name": "LaTeX Project Public License v1.1",
-      "licenseId": "LPPL-1.1",
+      "name": "Technische Universitaet Berlin License 2.0",
+      "licenseId": "TU-Berlin-2.0",
       "seeAlso": [
-        "http://www.latex-project.org/lppl/lppl-1-1.txt"
+        "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39=
e438a015da50035/licences/libgsm.txt"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CDDL-1.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDDL-1.0.json",
-      "referenceNumber": 257,
-      "name": "Common Development and Distribution License 1.0",
-      "licenseId": "CDDL-1.0",
+      "reference": "https://spdx.org/licenses/GFDL-1.3.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3.json",
+      "referenceNumber": 256,
+      "name": "GNU Free Documentation License v1.3",
+      "licenseId": "GFDL-1.3",
       "seeAlso": [
-        "https://opensource.org/licenses/cddl1"
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
       ],
-      "isOsiApproved": true,
+      "isOsiApproved": false,
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/FTL.html",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FTL.json",
-      "referenceNumber": 258,
-      "name": "Freetype Project License",
-      "licenseId": "FTL",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-or-later.json",
+      "referenceNumber": 257,
+      "name": "GNU Free Documentation License v1.3 or later",
+      "licenseId": "GFDL-1.3-or-later",
       "seeAlso": [
-        "http://freetype.fis.uniroma2.it/FTL.TXT",
-        "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/do=
cs/FTL.TXT",
-        "http://gitlab.freedesktop.org/freetype/freetype/-/raw/master/do=
cs/FTL.TXT"
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
       ],
       "isOsiApproved": false,
       "isFsfLibre": true
@@ -3225,7 +3210,7 @@
       "reference": "https://spdx.org/licenses/LAL-1.2.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/LAL-1.2.json",
-      "referenceNumber": 259,
+      "referenceNumber": 258,
       "name": "Licence Art Libre 1.2",
       "licenseId": "LAL-1.2",
       "seeAlso": [
@@ -3237,7 +3222,7 @@
       "reference": "https://spdx.org/licenses/ICU.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/ICU.json",
-      "referenceNumber": 260,
+      "referenceNumber": 259,
       "name": "ICU License",
       "licenseId": "ICU",
       "seeAlso": [
@@ -3245,6 +3230,21 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/FTL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FTL.json",
+      "referenceNumber": 260,
+      "name": "Freetype Project License",
+      "licenseId": "FTL",
+      "seeAlso": [
+        "http://freetype.fis.uniroma2.it/FTL.TXT",
+        "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/do=
cs/FTL.TXT",
+        "http://gitlab.freedesktop.org/freetype/freetype/-/raw/master/do=
cs/FTL.TXT"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
     {
       "reference": "https://spdx.org/licenses/MirOS.html",
       "isDeprecatedLicenseId": false,
@@ -3282,16 +3282,17 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Xerox.html",
+      "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Xerox.json",
+      "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
       "referenceNumber": 264,
-      "name": "Xerox License",
-      "licenseId": "Xerox",
+      "name": "OSET Public License version 2.1",
+      "licenseId": "OSET-PL-2.1",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Xerox"
+        "http://www.osetfoundation.org/public-license",
+        "https://opensource.org/licenses/OPL-2.1"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
@@ -3306,39 +3307,38 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
+      "reference": "https://spdx.org/licenses/SISSL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
+      "detailsUrl": "https://spdx.org/licenses/SISSL-1.2.json",
       "referenceNumber": 266,
-      "name": "OSET Public License version 2.1",
-      "licenseId": "OSET-PL-2.1",
+      "name": "Sun Industry Standards Source License v1.2",
+      "licenseId": "SISSL-1.2",
       "seeAlso": [
-        "http://www.osetfoundation.org/public-license",
-        "https://opensource.org/licenses/OPL-2.1"
+        "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.h=
tml"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/SISSL-1.2.html",
+      "reference": "https://spdx.org/licenses/Wsuipa.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SISSL-1.2.json",
+      "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
       "referenceNumber": 267,
-      "name": "Sun Industry Standards Source License v1.2",
-      "licenseId": "SISSL-1.2",
+      "name": "Wsuipa License",
+      "licenseId": "Wsuipa",
       "seeAlso": [
-        "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.h=
tml"
+        "https://fedoraproject.org/wiki/Licensing/Wsuipa"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
+      "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Adobe-Glyph.json",
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.4.json",
       "referenceNumber": 268,
-      "name": "Adobe Glyph List License",
-      "licenseId": "Adobe-Glyph",
+      "name": "Zimbra Public License v1.4",
+      "licenseId": "Zimbra-1.4",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
+        "http://www.zimbra.com/legal/zimbra-public-license-1-4"
       ],
       "isOsiApproved": false
     },
@@ -3355,27 +3355,28 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/etalab-2.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
+      "reference": "https://spdx.org/licenses/LGPL-3.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0.json",
       "referenceNumber": 270,
-      "name": "Etalab Open License 2.0",
-      "licenseId": "etalab-2.0",
+      "name": "GNU Lesser General Public License v3.0 only",
+      "licenseId": "LGPL-3.0",
       "seeAlso": [
-        "https://github.com/DISIC/politique-de-contribution-open-source/=
blob/master/LICENSE.pdf",
-        "https://raw.githubusercontent.com/DISIC/politique-de-contributi=
on-open-source/master/LICENSE"
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://opensource.org/licenses/LGPL-3.0"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/Wsuipa.html",
+      "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.5.json",
       "referenceNumber": 271,
-      "name": "Wsuipa License",
-      "licenseId": "Wsuipa",
+      "name": "Open LDAP Public License v2.5",
+      "licenseId": "OLDAP-2.5",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Wsuipa"
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d6852b9d90022e8593c98205413380536b1b5a7cf=
"
       ],
       "isOsiApproved": false
     },
@@ -3415,11 +3416,23 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Glyph.json",
+      "referenceNumber": 275,
+      "name": "Adobe Glyph List License",
+      "licenseId": "Adobe-Glyph",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/0BSD.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/0BSD.json",
-      "referenceNumber": 275,
+      "referenceNumber": 276,
       "name": "BSD Zero Clause License",
       "licenseId": "0BSD",
       "seeAlso": [
@@ -3431,7 +3444,7 @@
       "reference": "https://spdx.org/licenses/W3C-19980720.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/W3C-19980720.json",
-      "referenceNumber": 276,
+      "referenceNumber": 277,
       "name": "W3C Software Notice and License (1998-07-20)",
       "licenseId": "W3C-19980720",
       "seeAlso": [
@@ -3439,18 +3452,6 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.json",
-      "referenceNumber": 277,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 Unported",
-      "licenseId": "CC-BY-NC-SA-3.0",
-      "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/FSFUL.html",
       "isDeprecatedLicenseId": false,
@@ -3464,26 +3465,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0=
.0.html",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PolyForm-Noncommercial-1.=
0.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.json",
       "referenceNumber": 279,
-      "name": "PolyForm Noncommercial License 1.0.0",
-      "licenseId": "PolyForm-Noncommercial-1.0.0",
-      "seeAlso": [
-        "https://polyformproject.org/licenses/noncommercial/1.0.0"
-      ],
-      "isOsiApproved": false
-    },
-    {
-      "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.4.json",
-      "referenceNumber": 280,
-      "name": "Zimbra Public License v1.4",
-      "licenseId": "Zimbra-1.4",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 Unported",
+      "licenseId": "CC-BY-NC-SA-3.0",
       "seeAlso": [
-        "http://www.zimbra.com/legal/zimbra-public-license-1-4"
+        "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
       ],
       "isOsiApproved": false
     },
@@ -3491,7 +3480,7 @@
       "reference": "https://spdx.org/licenses/DOC.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/DOC.json",
-      "referenceNumber": 281,
+      "referenceNumber": 280,
       "name": "DOC License",
       "licenseId": "DOC",
       "seeAlso": [
@@ -3504,7 +3493,7 @@
       "reference": "https://spdx.org/licenses/TMate.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/TMate.json",
-      "referenceNumber": 282,
+      "referenceNumber": 281,
       "name": "TMate Open Source License",
       "licenseId": "TMate",
       "seeAlso": [
@@ -3512,6 +3501,21 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/MIT-open-group.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-open-group.json",
+      "referenceNumber": 282,
+      "name": "MIT Open Group variant",
+      "licenseId": "MIT-open-group",
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/C=
OPYING",
+        "https://gitlab.freedesktop.org/xorg/app/xvinfo/-/blob/master/CO=
PYING",
+        "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/=
COPYING",
+        "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COP=
YING"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/AMDPLPA.html",
       "isDeprecatedLicenseId": false,
@@ -3525,32 +3529,30 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-open-group.html",
+      "reference": "https://spdx.org/licenses/Condor-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-open-group.json",
+      "detailsUrl": "https://spdx.org/licenses/Condor-1.1.json",
       "referenceNumber": 284,
-      "name": "MIT Open Group variant",
-      "licenseId": "MIT-open-group",
+      "name": "Condor Public License v1.1",
+      "licenseId": "Condor-1.1",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/C=
OPYING",
-        "https://gitlab.freedesktop.org/xorg/app/xvinfo/-/blob/master/CO=
PYING",
-        "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/=
COPYING",
-        "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COP=
YING"
+        "http://research.cs.wisc.edu/condor/license.html#condor",
+        "http://web.archive.org/web/20111123062036/http://research.cs.wi=
sc.edu/condor/license.html#condor"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
+      "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0=
.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-4.0.json",
+      "detailsUrl": "https://spdx.org/licenses/PolyForm-Noncommercial-1.=
0.0.json",
       "referenceNumber": 285,
-      "name": "Creative Commons Attribution 4.0 International",
-      "licenseId": "CC-BY-4.0",
+      "name": "PolyForm Noncommercial License 1.0.0",
+      "licenseId": "PolyForm-Noncommercial-1.0.0",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/4.0/legalcode"
+        "https://polyformproject.org/licenses/noncommercial/1.0.0"
       ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-L=
icense.html",
@@ -3566,15 +3568,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Condor-1.1.html",
+      "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Condor-1.1.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-4.0.json",
       "referenceNumber": 287,
-      "name": "Condor Public License v1.1",
-      "licenseId": "Condor-1.1",
+      "name": "Creative Commons Attribution 4.0 International",
+      "licenseId": "CC-BY-4.0",
       "seeAlso": [
-        "http://research.cs.wisc.edu/condor/license.html#condor",
-        "http://web.archive.org/web/20111123062036/http://research.cs.wi=
sc.edu/condor/license.html#condor"
+        "https://creativecommons.org/licenses/by/4.0/legalcode"
       ],
       "isOsiApproved": false,
       "isFsfLibre": true
@@ -3640,24 +3641,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/GFDL-1.3.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3.json",
-      "referenceNumber": 293,
-      "name": "GNU Free Documentation License v1.3",
-      "licenseId": "GFDL-1.3",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
-    },
     {
       "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/GPL-3.0-or-later.json",
-      "referenceNumber": 294,
+      "referenceNumber": 293,
       "name": "GNU General Public License v3.0 or later",
       "licenseId": "GPL-3.0-or-later",
       "seeAlso": [
@@ -3671,7 +3659,7 @@
       "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-2.0.json"=
,
-      "referenceNumber": 295,
+      "referenceNumber": 294,
       "name": "Community Data License Agreement Permissive 2.0",
       "licenseId": "CDLA-Permissive-2.0",
       "seeAlso": [
@@ -3683,7 +3671,7 @@
       "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0.json",
-      "referenceNumber": 296,
+      "referenceNumber": 295,
       "name": "Creative Commons Attribution No Derivatives 3.0 Unported"=
,
       "licenseId": "CC-BY-ND-3.0",
       "seeAlso": [
@@ -3694,13 +3682,25 @@
     {
       "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/C-UDA-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/C-UDA-1.0.json",
+      "referenceNumber": 296,
+      "name": "Computational Use of Data Agreement v1.0",
+      "licenseId": "C-UDA-1.0",
+      "seeAlso": [
+        "https://github.com/microsoft/Computational-Use-of-Data-Agreemen=
t/blob/master/C-UDA-1.0.md",
+        "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Barr.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Barr.json",
       "referenceNumber": 297,
-      "name": "Computational Use of Data Agreement v1.0",
-      "licenseId": "C-UDA-1.0",
+      "name": "Barr License",
+      "licenseId": "Barr",
       "seeAlso": [
-        "https://github.com/microsoft/Computational-Use-of-Data-Agreemen=
t/blob/master/C-UDA-1.0.md",
-        "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
+        "https://fedoraproject.org/wiki/Licensing/Barr"
       ],
       "isOsiApproved": false
     },
@@ -3730,34 +3730,23 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Barr.html",
+      "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Barr.json",
+      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.1.json",
       "referenceNumber": 300,
-      "name": "Barr License",
-      "licenseId": "Barr",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Barr"
-      ],
-      "isOsiApproved": false
-    },
-    {
-      "reference": "https://spdx.org/licenses/ADSL.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ADSL.json",
-      "referenceNumber": 301,
-      "name": "Amazon Digital Services License",
-      "licenseId": "ADSL",
+      "name": "BitTorrent Open Source License v1.1",
+      "licenseId": "BitTorrent-1.1",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesL=
icense"
+        "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/CDL-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CDL-1.0.json",
-      "referenceNumber": 302,
+      "referenceNumber": 301,
       "name": "Common Documentation License 1.0",
       "licenseId": "CDL-1.0",
       "seeAlso": [
@@ -3771,7 +3760,7 @@
       "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-1.0.json",
-      "referenceNumber": 303,
+      "referenceNumber": 302,
       "name": "Creative Commons Attribution Share Alike 1.0 Generic",
       "licenseId": "CC-BY-SA-1.0",
       "seeAlso": [
@@ -3779,11 +3768,36 @@
       ],
       "isOsiApproved": false
     },
+    {
+      "reference": "https://spdx.org/licenses/ADSL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ADSL.json",
+      "referenceNumber": 303,
+      "name": "Amazon Digital Services License",
+      "licenseId": "ADSL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesL=
icense"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/PostgreSQL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PostgreSQL.json",
+      "referenceNumber": 304,
+      "name": "PostgreSQL License",
+      "licenseId": "PostgreSQL",
+      "seeAlso": [
+        "http://www.postgresql.org/about/licence",
+        "https://opensource.org/licenses/PostgreSQL"
+      ],
+      "isOsiApproved": true
+    },
     {
       "reference": "https://spdx.org/licenses/OFL-1.1.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/OFL-1.1.json",
-      "referenceNumber": 304,
+      "referenceNumber": 305,
       "name": "SIL Open Font License 1.1",
       "licenseId": "OFL-1.1",
       "seeAlso": [
@@ -3793,18 +3807,6 @@
       "isOsiApproved": true,
       "isFsfLibre": true
     },
-    {
-      "reference": "https://spdx.org/licenses/GLWTPL.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GLWTPL.json",
-      "referenceNumber": 305,
-      "name": "Good Luck With That Public License",
-      "licenseId": "GLWTPL",
-      "seeAlso": [
-        "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb44=
2c0b31e33a65b9d6e85"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/NPL-1.0.html",
       "isDeprecatedLicenseId": false,
@@ -3892,17 +3894,16 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/PostgreSQL.html",
+      "reference": "https://spdx.org/licenses/GLWTPL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PostgreSQL.json",
+      "detailsUrl": "https://spdx.org/licenses/GLWTPL.json",
       "referenceNumber": 313,
-      "name": "PostgreSQL License",
-      "licenseId": "PostgreSQL",
+      "name": "Good Luck With That Public License",
+      "licenseId": "GLWTPL",
       "seeAlso": [
-        "http://www.postgresql.org/about/licence",
-        "https://opensource.org/licenses/PostgreSQL"
+        "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb44=
2c0b31e33a65b9d6e85"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
@@ -3992,37 +3993,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-or-later.json",
-      "referenceNumber": 321,
-      "name": "Affero General Public License v1.0 or later",
-      "licenseId": "AGPL-1.0-or-later",
-      "seeAlso": [
-        "http://www.affero.org/oagpl.html"
-      ],
-      "isOsiApproved": false
-    },
-    {
-      "reference": "https://spdx.org/licenses/BSL-1.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSL-1.0.json",
-      "referenceNumber": 322,
-      "name": "Boost Software License 1.0",
-      "licenseId": "BSL-1.0",
-      "seeAlso": [
-        "http://www.boost.org/LICENSE_1_0.txt",
-        "https://opensource.org/licenses/BSL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
-    },
     {
       "reference": "https://spdx.org/licenses/IJG.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/IJG.json",
-      "referenceNumber": 323,
+      "referenceNumber": 321,
       "name": "Independent JPEG Group License",
       "licenseId": "IJG",
       "seeAlso": [
@@ -4031,11 +4006,23 @@
       "isOsiApproved": false,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-or-later.json",
+      "referenceNumber": 322,
+      "name": "Affero General Public License v1.0 or later",
+      "licenseId": "AGPL-1.0-or-later",
+      "seeAlso": [
+        "http://www.affero.org/oagpl.html"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/OFL-1.1-no-RFN.json",
-      "referenceNumber": 324,
+      "referenceNumber": 323,
       "name": "SIL Open Font License 1.1 with no Reserved Font Name",
       "licenseId": "OFL-1.1-no-RFN",
       "seeAlso": [
@@ -4044,6 +4031,20 @@
       ],
       "isOsiApproved": true
     },
+    {
+      "reference": "https://spdx.org/licenses/BSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSL-1.0.json",
+      "referenceNumber": 324,
+      "name": "Boost Software License 1.0",
+      "licenseId": "BSL-1.0",
+      "seeAlso": [
+        "http://www.boost.org/LICENSE_1_0.txt",
+        "https://opensource.org/licenses/BSL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
     {
       "reference": "https://spdx.org/licenses/Libpng.html",
       "isDeprecatedLicenseId": false,
@@ -4193,28 +4194,28 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/libselinux-1.0.html",
+      "reference": "https://spdx.org/licenses/CECILL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/libselinux-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.1.json",
       "referenceNumber": 337,
-      "name": "libselinux public domain notice",
-      "licenseId": "libselinux-1.0",
+      "name": "CeCILL Free Software License Agreement v1.1",
+      "licenseId": "CECILL-1.1",
       "seeAlso": [
-        "https://github.com/SELinuxProject/selinux/blob/master/libselinu=
x/LICENSE"
+        "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-1.1.html",
+      "reference": "https://spdx.org/licenses/CECILL-2.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-1.1.json",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-2.1.json",
       "referenceNumber": 338,
-      "name": "CeCILL Free Software License Agreement v1.1",
-      "licenseId": "CECILL-1.1",
+      "name": "CeCILL Free Software License Agreement v2.1",
+      "licenseId": "CECILL-2.1",
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
+        "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
@@ -4229,39 +4230,26 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
+      "reference": "https://spdx.org/licenses/Abstyles.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-1-Clause.json",
+      "detailsUrl": "https://spdx.org/licenses/Abstyles.json",
       "referenceNumber": 340,
-      "name": "BSD 1-Clause License",
-      "licenseId": "BSD-1-Clause",
+      "name": "Abstyles License",
+      "licenseId": "Abstyles",
       "seeAlso": [
-        "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision=
\u003d326823"
+        "https://fedoraproject.org/wiki/Licensing/Abstyles"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
+      "reference": "https://spdx.org/licenses/libselinux-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.1.json",
+      "detailsUrl": "https://spdx.org/licenses/libselinux-1.0.json",
       "referenceNumber": 341,
-      "name": "BitTorrent Open Source License v1.1",
-      "licenseId": "BitTorrent-1.1",
-      "seeAlso": [
-        "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/MIT-enna.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-enna.json",
-      "referenceNumber": 342,
-      "name": "enna License",
-      "licenseId": "MIT-enna",
+      "name": "libselinux public domain notice",
+      "licenseId": "libselinux-1.0",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT#enna"
+        "https://github.com/SELinuxProject/selinux/blob/master/libselinu=
x/LICENSE"
       ],
       "isOsiApproved": false
     },
@@ -4269,7 +4257,7 @@
       "reference": "https://spdx.org/licenses/ANTLR-PD.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/ANTLR-PD.json",
-      "referenceNumber": 343,
+      "referenceNumber": 342,
       "name": "ANTLR Software Rights Notice",
       "licenseId": "ANTLR-PD",
       "seeAlso": [
@@ -4281,7 +4269,7 @@
       "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/GPL-2.0-or-later.json",
-      "referenceNumber": 344,
+      "referenceNumber": 343,
       "name": "GNU General Public License v2.0 or later",
       "licenseId": "GPL-2.0-or-later",
       "seeAlso": [
@@ -4292,14 +4280,27 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
+      "reference": "https://spdx.org/licenses/IPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.json",
+      "detailsUrl": "https://spdx.org/licenses/IPL-1.0.json",
+      "referenceNumber": 344,
+      "name": "IBM Public License v1.0",
+      "licenseId": "IPL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/IPL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-enna.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-enna.json",
       "referenceNumber": 345,
-      "name": "Creative Commons Attribution Share Alike 3.0 Austria",
-      "licenseId": "CC-BY-SA-3.0-AT",
+      "name": "enna License",
+      "licenseId": "MIT-enna",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
+        "https://fedoraproject.org/wiki/Licensing/MIT#enna"
       ],
       "isOsiApproved": false
     },
@@ -4316,17 +4317,16 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-RFN.json",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.json",
       "referenceNumber": 347,
-      "name": "SIL Open Font License 1.1 with Reserved Font Name",
-      "licenseId": "OFL-1.1-RFN",
+      "name": "Creative Commons Attribution Share Alike 3.0 Austria",
+      "licenseId": "CC-BY-SA-3.0-AT",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_we=
b",
-        "https://opensource.org/licenses/OFL-1.1"
+        "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception=
.html",
@@ -4341,17 +4341,16 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/IPL-1.0.html",
+      "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/IPL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/BSD-1-Clause.json",
       "referenceNumber": 349,
-      "name": "IBM Public License v1.0",
-      "licenseId": "IPL-1.0",
+      "name": "BSD 1-Clause License",
+      "licenseId": "BSD-1-Clause",
       "seeAlso": [
-        "https://opensource.org/licenses/IPL-1.0"
+        "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision=
\u003d326823"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/NTP-0.html",
@@ -4391,28 +4390,29 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/Watcom-1.0.html",
+      "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Watcom-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-RFN.json",
       "referenceNumber": 353,
-      "name": "Sybase Open Watcom Public License 1.0",
-      "licenseId": "Watcom-1.0",
+      "name": "SIL Open Font License 1.1 with Reserved Font Name",
+      "licenseId": "OFL-1.1-RFN",
       "seeAlso": [
-        "https://opensource.org/licenses/Watcom-1.0"
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_we=
b",
+        "https://opensource.org/licenses/OFL-1.1"
       ],
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/FSFULLR.html",
+      "reference": "https://spdx.org/licenses/Watcom-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FSFULLR.json",
+      "detailsUrl": "https://spdx.org/licenses/Watcom-1.0.json",
       "referenceNumber": 354,
-      "name": "FSF Unlimited License (with License Retention)",
-      "licenseId": "FSFULLR",
+      "name": "Sybase Open Watcom Public License 1.0",
+      "licenseId": "Watcom-1.0",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#=
License_Retention_Variant"
+        "https://opensource.org/licenses/Watcom-1.0"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
@@ -4427,26 +4427,28 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
+      "reference": "https://spdx.org/licenses/ODbL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause.json",
+      "detailsUrl": "https://spdx.org/licenses/ODbL-1.0.json",
       "referenceNumber": 356,
-      "name": "BSD 2-Clause \"Simplified\" License",
-      "licenseId": "BSD-2-Clause",
+      "name": "Open Data Commons Open Database License v1.0",
+      "licenseId": "ODbL-1.0",
       "seeAlso": [
-        "https://opensource.org/licenses/BSD-2-Clause"
+        "http://www.opendatacommons.org/licenses/odbl/1.0/",
+        "https://opendatacommons.org/licenses/odbl/1-0/"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
+      "reference": "https://spdx.org/licenses/FSFULLR.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SSH-OpenSSH.json",
+      "detailsUrl": "https://spdx.org/licenses/FSFULLR.json",
       "referenceNumber": 357,
-      "name": "SSH OpenSSH license",
-      "licenseId": "SSH-OpenSSH",
+      "name": "FSF Unlimited License (with License Retention)",
+      "licenseId": "FSFULLR",
       "seeAlso": [
-        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c=
59838b5fa574cd456d6047b2d4/LICENCE#L10"
+        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#=
License_Retention_Variant"
       ],
       "isOsiApproved": false
     },
@@ -4463,31 +4465,28 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/ODbL-1.0.html",
+      "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ODbL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/SSH-OpenSSH.json",
       "referenceNumber": 359,
-      "name": "Open Data Commons Open Database License v1.0",
-      "licenseId": "ODbL-1.0",
+      "name": "SSH OpenSSH license",
+      "licenseId": "SSH-OpenSSH",
       "seeAlso": [
-        "http://www.opendatacommons.org/licenses/odbl/1.0/",
-        "https://opendatacommons.org/licenses/odbl/1-0/"
+        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c=
59838b5fa574cd456d6047b2d4/LICENCE#L10"
       ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-only.json",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause.json",
       "referenceNumber": 360,
-      "name": "GNU Free Documentation License v1.3 only",
-      "licenseId": "GFDL-1.3-only",
+      "name": "BSD 2-Clause \"Simplified\" License",
+      "licenseId": "BSD-2-Clause",
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
+        "https://opensource.org/licenses/BSD-2-Clause"
       ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/HPND.html",
@@ -4503,17 +4502,17 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/NASA-1.3.html",
+      "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NASA-1.3.json",
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.3.json",
       "referenceNumber": 362,
-      "name": "NASA Open Source Agreement 1.3",
-      "licenseId": "NASA-1.3",
+      "name": "Zimbra Public License v1.3",
+      "licenseId": "Zimbra-1.3",
       "seeAlso": [
-        "http://ti.arc.nasa.gov/opensource/nosa/",
-        "https://opensource.org/licenses/NASA-1.3"
+        "http://web.archive.org/web/20100302225219/http://www.zimbra.com=
/license/zimbra-public-license-1-3.html"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/Borceux.html",
@@ -4552,17 +4551,17 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CPAL-1.0.html",
+      "reference": "https://spdx.org/licenses/NASA-1.3.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CPAL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/NASA-1.3.json",
       "referenceNumber": 366,
-      "name": "Common Public Attribution License 1.0",
-      "licenseId": "CPAL-1.0",
+      "name": "NASA Open Source Agreement 1.3",
+      "licenseId": "NASA-1.3",
       "seeAlso": [
-        "https://opensource.org/licenses/CPAL-1.0"
+        "http://ti.arc.nasa.gov/opensource/nosa/",
+        "https://opensource.org/licenses/NASA-1.3"
       ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/VOSTROM.html",
@@ -4577,16 +4576,18 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Abstyles.html",
+      "reference": "https://spdx.org/licenses/MIT-0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Abstyles.json",
+      "detailsUrl": "https://spdx.org/licenses/MIT-0.json",
       "referenceNumber": 368,
-      "name": "Abstyles License",
-      "licenseId": "Abstyles",
+      "name": "MIT No Attribution",
+      "licenseId": "MIT-0",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Abstyles"
+        "https://github.com/aws/mit-0",
+        "https://romanrm.net/mit-zero",
+        "https://github.com/awsdocs/aws-cloud9-user-guide/blob/master/LI=
CENSE-SAMPLECODE"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/ISC.html",
@@ -4641,18 +4642,17 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-0.html",
+      "reference": "https://spdx.org/licenses/NOSL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-0.json",
+      "detailsUrl": "https://spdx.org/licenses/NOSL.json",
       "referenceNumber": 373,
-      "name": "MIT No Attribution",
-      "licenseId": "MIT-0",
+      "name": "Netizen Open Source License",
+      "licenseId": "NOSL",
       "seeAlso": [
-        "https://github.com/aws/mit-0",
-        "https://romanrm.net/mit-zero",
-        "https://github.com/awsdocs/aws-cloud9-user-guide/blob/master/LI=
CENSE-SAMPLECODE"
+        "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/SMLNJ.html",
@@ -4681,16 +4681,16 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/NOSL.html",
+      "reference": "https://spdx.org/licenses/CPAL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NOSL.json",
+      "detailsUrl": "https://spdx.org/licenses/CPAL-1.0.json",
       "referenceNumber": 376,
-      "name": "Netizen Open Source License",
-      "licenseId": "NOSL",
+      "name": "Common Public Attribution License 1.0",
+      "licenseId": "CPAL-1.0",
       "seeAlso": [
-        "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
+        "https://opensource.org/licenses/CPAL-1.0"
       ],
-      "isOsiApproved": false,
+      "isOsiApproved": true,
       "isFsfLibre": true
     },
     {
@@ -4783,56 +4783,55 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CDDL-1.1.html",
+      "reference": "https://spdx.org/licenses/EUPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.0.json",
       "referenceNumber": 384,
-      "name": "Common Development and Distribution License 1.1",
-      "licenseId": "CDDL-1.1",
+      "name": "European Union Public License 1.0",
+      "licenseId": "EUPL-1.0",
       "seeAlso": [
-        "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
-        "https://javaee.github.io/glassfish/LICENSE"
+        "http://ec.europa.eu/idabc/en/document/7330.html",
+        "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id\u003d31096"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
+      "reference": "https://spdx.org/licenses/CDDL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.3.json",
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
       "referenceNumber": 385,
-      "name": "Zimbra Public License v1.3",
-      "licenseId": "Zimbra-1.3",
+      "name": "Common Development and Distribution License 1.1",
+      "licenseId": "CDDL-1.1",
       "seeAlso": [
-        "http://web.archive.org/web/20100302225219/http://www.zimbra.com=
/license/zimbra-public-license-1-3.html"
+        "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
+        "https://javaee.github.io/glassfish/LICENSE"
       ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/EUPL-1.0.html",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EUPL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-only.json",
       "referenceNumber": 386,
-      "name": "European Union Public License 1.0",
-      "licenseId": "EUPL-1.0",
+      "name": "GNU Free Documentation License v1.3 only",
+      "licenseId": "GFDL-1.3-only",
       "seeAlso": [
-        "http://ec.europa.eu/idabc/en/document/7330.html",
-        "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id\u003d31096"
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/Fair.html",
+      "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Fair.json",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.6.json",
       "referenceNumber": 387,
-      "name": "Fair License",
-      "licenseId": "Fair",
+      "name": "Open LDAP Public License v2.6",
+      "licenseId": "OLDAP-2.6",
       "seeAlso": [
-        "http://fairlicense.org/",
-        "https://opensource.org/licenses/Fair"
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d1cae062821881f41b73012ba816434897abf4205=
"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/JSON.html",
@@ -4875,17 +4874,17 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/OPL-1.0.html",
+      "reference": "https://spdx.org/licenses/Fair.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OPL-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/Fair.json",
       "referenceNumber": 391,
-      "name": "Open Public License v1.0",
-      "licenseId": "OPL-1.0",
+      "name": "Fair License",
+      "licenseId": "Fair",
       "seeAlso": [
-        "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
-        "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
+        "http://fairlicense.org/",
+        "https://opensource.org/licenses/Fair"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exceptio=
n.html",
@@ -4977,14 +4976,15 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
+      "reference": "https://spdx.org/licenses/OPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.6.json",
+      "detailsUrl": "https://spdx.org/licenses/OPL-1.0.json",
       "referenceNumber": 399,
-      "name": "Open LDAP Public License v2.6",
-      "licenseId": "OLDAP-2.6",
+      "name": "Open Public License v1.0",
+      "licenseId": "OPL-1.0",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d1cae062821881f41b73012ba816434897abf4205=
"
+        "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
+        "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
       ],
       "isOsiApproved": false
     },
@@ -5000,50 +5000,25 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NCGL-UK-2.0.json",
-      "referenceNumber": 401,
-      "name": "Non-Commercial Government Licence",
-      "licenseId": "NCGL-UK-2.0",
-      "seeAlso": [
-        "http://www.nationalarchives.gov.uk/doc/non-commercial-governmen=
t-licence/version/2/"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/QPL-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/QPL-1.0.json",
-      "referenceNumber": 402,
+      "referenceNumber": 401,
       "name": "Q Public License 1.0",
       "licenseId": "QPL-1.0",
       "seeAlso": [
         "http://doc.qt.nokia.com/3.3/license.html",
-        "https://opensource.org/licenses/QPL-1.0",
-        "https://doc.qt.io/archives/3.3/license.html"
+        "https://opensource.org/licenses/QPL-1.0"
       ],
       "isOsiApproved": true,
       "isFsfLibre": true
     },
-    {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-=
later.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or=
-later.json",
-      "referenceNumber": 403,
-      "name": "GNU Free Documentation License v1.2 or later - no invaria=
nts",
-      "licenseId": "GFDL-1.2-no-invariants-or-later",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/EUPL-1.2.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/EUPL-1.2.json",
-      "referenceNumber": 404,
+      "referenceNumber": 402,
       "name": "European Union Public License 1.2",
       "licenseId": "EUPL-1.2",
       "seeAlso": [
@@ -5057,15 +5032,14 @@
       "isOsiApproved": true
     },
     {
-      "reference": "https://spdx.org/licenses/Beerware.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Beerware.json",
-      "referenceNumber": 405,
-      "name": "Beerware License",
-      "licenseId": "Beerware",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-=
later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or=
-later.json",
+      "referenceNumber": 403,
+      "name": "GNU Free Documentation License v1.2 or later - no invaria=
nts",
+      "licenseId": "GFDL-1.2-no-invariants-or-later",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Beerware",
-        "https://people.freebsd.org/~phk/"
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
       ],
       "isOsiApproved": false
     },
@@ -5073,7 +5047,7 @@
       "reference": "https://spdx.org/licenses/eCos-2.0.html",
       "isDeprecatedLicenseId": true,
       "detailsUrl": "https://spdx.org/licenses/eCos-2.0.json",
-      "referenceNumber": 406,
+      "referenceNumber": 404,
       "name": "eCos license version 2.0",
       "licenseId": "eCos-2.0",
       "seeAlso": [
@@ -5082,27 +5056,27 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CAL-1.0.html",
+      "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CAL-1.0.json",
-      "referenceNumber": 407,
-      "name": "Cryptographic Autonomy License 1.0",
-      "licenseId": "CAL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/NCGL-UK-2.0.json",
+      "referenceNumber": 405,
+      "name": "Non-Commercial Government Licence",
+      "licenseId": "NCGL-UK-2.0",
       "seeAlso": [
-        "http://cryptographicautonomylicense.com/license-text.html",
-        "https://opensource.org/licenses/CAL-1.0"
+        "http://www.nationalarchives.gov.uk/doc/non-commercial-governmen=
t-licence/version/2/"
       ],
-      "isOsiApproved": true
+      "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-excepti=
on.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-bison-except=
ion.json",
-      "referenceNumber": 408,
-      "name": "GNU General Public License v2.0 w/Bison exception",
-      "licenseId": "GPL-2.0-with-bison-exception",
+      "reference": "https://spdx.org/licenses/Beerware.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Beerware.json",
+      "referenceNumber": 406,
+      "name": "Beerware License",
+      "licenseId": "Beerware",
       "seeAlso": [
-        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id\=
u003d193d7c7054ba7197b0789e14965b739162319b5e#n141"
+        "https://fedoraproject.org/wiki/Licensing/Beerware",
+        "https://people.freebsd.org/~phk/"
       ],
       "isOsiApproved": false
     },
@@ -5110,7 +5084,7 @@
       "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html=
",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.jso=
n",
-      "referenceNumber": 409,
+      "referenceNumber": 407,
       "name": "BSD 3-Clause Open MPI variant",
       "licenseId": "BSD-3-Clause-Open-MPI",
       "seeAlso": [
@@ -5120,14 +5094,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exce=
ption.html",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-excepti=
on.html",
       "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exc=
eption.json",
-      "referenceNumber": 410,
-      "name": "GNU General Public License v2.0 w/Autoconf exception",
-      "licenseId": "GPL-2.0-with-autoconf-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-bison-except=
ion.json",
+      "referenceNumber": 408,
+      "name": "GNU General Public License v2.0 w/Bison exception",
+      "licenseId": "GPL-2.0-with-bison-exception",
       "seeAlso": [
-        "http://ac-archive.sourceforge.net/doc/copyright.html"
+        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id\=
u003d193d7c7054ba7197b0789e14965b739162319b5e#n141"
       ],
       "isOsiApproved": false
     },
@@ -5135,7 +5109,7 @@
       "reference": "https://spdx.org/licenses/CECILL-B.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CECILL-B.json",
-      "referenceNumber": 411,
+      "referenceNumber": 409,
       "name": "CeCILL-B Free Software License Agreement",
       "licenseId": "CECILL-B",
       "seeAlso": [
@@ -5144,11 +5118,23 @@
       "isOsiApproved": false,
       "isFsfLibre": true
     },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exce=
ption.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exc=
eption.json",
+      "referenceNumber": 410,
+      "name": "GNU General Public License v2.0 w/Autoconf exception",
+      "licenseId": "GPL-2.0-with-autoconf-exception",
+      "seeAlso": [
+        "http://ac-archive.sourceforge.net/doc/copyright.html"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/EPL-2.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/EPL-2.0.json",
-      "referenceNumber": 412,
+      "referenceNumber": 411,
       "name": "Eclipse Public License 2.0",
       "licenseId": "EPL-2.0",
       "seeAlso": [
@@ -5162,7 +5148,7 @@
       "reference": "https://spdx.org/licenses/MIT-feh.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/MIT-feh.json",
-      "referenceNumber": 413,
+      "referenceNumber": 412,
       "name": "feh License",
       "licenseId": "MIT-feh",
       "seeAlso": [
@@ -5174,7 +5160,7 @@
       "reference": "https://spdx.org/licenses/RPL-1.1.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/RPL-1.1.json",
-      "referenceNumber": 414,
+      "referenceNumber": 413,
       "name": "Reciprocal Public License 1.1",
       "licenseId": "RPL-1.1",
       "seeAlso": [
@@ -5182,6 +5168,18 @@
       ],
       "isOsiApproved": true
     },
+    {
+      "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-1.0.json"=
,
+      "referenceNumber": 414,
+      "name": "Community Data License Agreement Permissive 1.0",
+      "licenseId": "CDLA-Permissive-1.0",
+      "seeAlso": [
+        "https://cdla.io/permissive-1-0"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/Python-2.0.html",
       "isDeprecatedLicenseId": false,
@@ -5195,23 +5193,11 @@
       "isOsiApproved": true,
       "isFsfLibre": true
     },
-    {
-      "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-1.0.json"=
,
-      "referenceNumber": 416,
-      "name": "Community Data License Agreement Permissive 1.0",
-      "licenseId": "CDLA-Permissive-1.0",
-      "seeAlso": [
-        "https://cdla.io/permissive-1-0"
-      ],
-      "isOsiApproved": false
-    },
     {
       "reference": "https://spdx.org/licenses/MPL-1.0.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/MPL-1.0.json",
-      "referenceNumber": 417,
+      "referenceNumber": 416,
       "name": "Mozilla Public License 1.0",
       "licenseId": "MPL-1.0",
       "seeAlso": [
@@ -5220,6 +5206,19 @@
       ],
       "isOsiApproved": true
     },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-or-later.json",
+      "referenceNumber": 417,
+      "name": "GNU Free Documentation License v1.1 or later",
+      "licenseId": "GFDL-1.1-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
     {
       "reference": "https://spdx.org/licenses/diffmark.html",
       "isDeprecatedLicenseId": false,
@@ -5245,14 +5244,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
+      "reference": "https://spdx.org/licenses/OpenSSL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-or-later.json",
+      "detailsUrl": "https://spdx.org/licenses/OpenSSL.json",
       "referenceNumber": 420,
-      "name": "GNU Free Documentation License v1.1 or later",
-      "licenseId": "GFDL-1.1-or-later",
+      "name": "OpenSSL License",
+      "licenseId": "OpenSSL",
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+        "http://www.openssl.org/source/license.html"
       ],
       "isOsiApproved": false,
       "isFsfLibre": true
@@ -5283,14 +5282,14 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/OpenSSL.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OpenSSL.json",
+      "reference": "https://spdx.org/licenses/AGPL-1.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0.json",
       "referenceNumber": 423,
-      "name": "OpenSSL License",
-      "licenseId": "OpenSSL",
+      "name": "Affero General Public License v1.0",
+      "licenseId": "AGPL-1.0",
       "seeAlso": [
-        "http://www.openssl.org/source/license.html"
+        "http://www.affero.org/oagpl.html"
       ],
       "isOsiApproved": false,
       "isFsfLibre": true
@@ -5334,24 +5333,11 @@
       ],
       "isOsiApproved": false
     },
-    {
-      "reference": "https://spdx.org/licenses/AGPL-1.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0.json",
-      "referenceNumber": 427,
-      "name": "Affero General Public License v1.0",
-      "licenseId": "AGPL-1.0",
-      "seeAlso": [
-        "http://www.affero.org/oagpl.html"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
-    },
     {
       "reference": "https://spdx.org/licenses/Xnet.html",
       "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/Xnet.json",
-      "referenceNumber": 428,
+      "referenceNumber": 427,
       "name": "X.Net License",
       "licenseId": "Xnet",
       "seeAlso": [
@@ -5359,6 +5345,18 @@
       ],
       "isOsiApproved": true
     },
+    {
+      "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-1.0.json",
+      "referenceNumber": 428,
+      "name": "Technische Universitaet Berlin License 1.0",
+      "licenseId": "TU-Berlin-1.0",
+      "seeAlso": [
+        "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9=
f526803d9680/gsm/COPYRIGHT"
+      ],
+      "isOsiApproved": false
+    },
     {
       "reference": "https://spdx.org/licenses/AGPL-3.0.html",
       "isDeprecatedLicenseId": true,
@@ -5374,16 +5372,17 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
+      "reference": "https://spdx.org/licenses/CAL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-1.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CAL-1.0.json",
       "referenceNumber": 430,
-      "name": "Technische Universitaet Berlin License 1.0",
-      "licenseId": "TU-Berlin-1.0",
+      "name": "Cryptographic Autonomy License 1.0",
+      "licenseId": "CAL-1.0",
       "seeAlso": [
-        "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9=
f526803d9680/gsm/COPYRIGHT"
+        "http://cryptographicautonomylicense.com/license-text.html",
+        "https://opensource.org/licenses/CAL-1.0"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true
     },
     {
       "reference": "https://spdx.org/licenses/AFL-3.0.html",
@@ -5400,16 +5399,16 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/APSL-2.0.html",
+      "reference": "https://spdx.org/licenses/CECILL-C.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APSL-2.0.json",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-C.json",
       "referenceNumber": 432,
-      "name": "Apple Public Source License 2.0",
-      "licenseId": "APSL-2.0",
+      "name": "CeCILL-C Free Software License Agreement",
+      "licenseId": "CECILL-C",
       "seeAlso": [
-        "http://www.opensource.apple.com/license/apsl/"
+        "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
       ],
-      "isOsiApproved": true,
+      "isOsiApproved": false,
       "isFsfLibre": true
     },
     {
@@ -5425,30 +5424,29 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-C.html",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-C.json",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Clear.json",
       "referenceNumber": 434,
-      "name": "CeCILL-C Free Software License Agreement",
-      "licenseId": "CECILL-C",
+      "name": "BSD 3-Clause Clear License",
+      "licenseId": "BSD-3-Clause-Clear",
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
+        "http://labs.metacarta.com/license-explanation.html#license"
       ],
       "isOsiApproved": false,
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.=
html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Clear.json",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Modification=
.json",
       "referenceNumber": 435,
-      "name": "BSD 3-Clause Clear License",
-      "licenseId": "BSD-3-Clause-Clear",
+      "name": "BSD 3-Clause Modification",
+      "licenseId": "BSD-3-Clause-Modification",
       "seeAlso": [
-        "http://labs.metacarta.com/license-explanation.html#license"
+        "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Varia=
nt"
       ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+      "isOsiApproved": false
     },
     {
       "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
@@ -5511,26 +5509,26 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.=
html",
+      "reference": "https://spdx.org/licenses/Spencer-86.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Modification=
.json",
+      "detailsUrl": "https://spdx.org/licenses/Spencer-86.json",
       "referenceNumber": 441,
-      "name": "BSD 3-Clause Modification",
-      "licenseId": "BSD-3-Clause-Modification",
+      "name": "Spencer License 86",
+      "licenseId": "Spencer-86",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Varia=
nt"
+        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_L=
ibrary_License"
       ],
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/Spencer-86.html",
+      "reference": "https://spdx.org/licenses/OCCT-PL.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Spencer-86.json",
+      "detailsUrl": "https://spdx.org/licenses/OCCT-PL.json",
       "referenceNumber": 442,
-      "name": "Spencer License 86",
-      "licenseId": "Spencer-86",
+      "name": "Open CASCADE Technology Public License",
+      "licenseId": "OCCT-PL",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_L=
ibrary_License"
+        "http://www.opencascade.com/content/occt-public-license"
       ],
       "isOsiApproved": false
     },
@@ -5572,14 +5570,15 @@
       "isOsiApproved": false
     },
     {
-      "reference": "https://spdx.org/licenses/OCCT-PL.html",
+      "reference": "https://spdx.org/licenses/NIST-PD.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OCCT-PL.json",
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD.json",
       "referenceNumber": 446,
-      "name": "Open CASCADE Technology Public License",
-      "licenseId": "OCCT-PL",
+      "name": "NIST Public Domain Notice",
+      "licenseId": "NIST-PD",
       "seeAlso": [
-        "http://www.opencascade.com/content/occt-public-license"
+        "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfec=
eb2db8cba05b7c2e0cd3/LICENSE.txt",
+        "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c=
98348188a65a135d98/README.md"
       ],
       "isOsiApproved": false
     },
@@ -5597,17 +5596,17 @@
       "isFsfLibre": true
     },
     {
-      "reference": "https://spdx.org/licenses/NIST-PD.html",
+      "reference": "https://spdx.org/licenses/APSL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NIST-PD.json",
+      "detailsUrl": "https://spdx.org/licenses/APSL-2.0.json",
       "referenceNumber": 448,
-      "name": "NIST Public Domain Notice",
-      "licenseId": "NIST-PD",
+      "name": "Apple Public Source License 2.0",
+      "licenseId": "APSL-2.0",
       "seeAlso": [
-        "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfec=
eb2db8cba05b7c2e0cd3/LICENSE.txt",
-        "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c=
98348188a65a135d98/README.md"
+        "http://www.opensource.apple.com/license/apsl/"
       ],
-      "isOsiApproved": false
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
       "reference": "https://spdx.org/licenses/Leptonica.html",
@@ -5934,5 +5933,5 @@
       "isOsiApproved": false
     }
   ],
-  "releaseDate": "2021-08-19"
+  "releaseDate": "2021-08-08"
 }
\ No newline at end of file
--=20
2.25.1


