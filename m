Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D17C46CCD
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 12:15:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13986.1702728929745197690
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 04:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UQz8X4m0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=071467d4b3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BGCA2mJ023385
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 04:15:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=FXqvcwnkOZ4m6tsew4
	lwSsbuLjvDgznNJBQdMVFl/LI=; b=UQz8X4m0t+YTc4JaJIwxZVOqBFTEFFUajT
	qqMPSrGAVLZCsqtLKBJPKvnlkZ297RyH3B7OGDv04zxHKZseJY2E+/WaKmDKiHC6
	VB/+2haSwsmb2Zgj1aYzwGIBfBzWCz46luUDkSNUG3Njzz3LHwNFrsng4csQFHoP
	ktXcXhhB5+FHu8wx48hwbg8yNHrGKluIjQuV3RJLEuS4DRDhUGZIhMOE9a34m5A9
	7f0/q/I9ZSU6cJ5UW4KxfBSzVxpjeba/DpjUHJoMP3XrCUaairkON20ffQaavF7W
	lVO6687BVWEMQPO93aGvNwBSHPYHIRmOSHrqBuZOu5P0IBJKsIXQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824g4dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 04:15:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApxsKiBSyVzAW5fRmcZC+xP87622Q6RAeGRt3GQwWd4FpbGo/J4yfHYrwmoCDluwU5CAAuZ+zKaoqZvfjJlOO+ls98L9cz8CRaFhCJhqp0IZulKsZOV7K8iofl0mWYkZp0TZvD3/1KREhIaCHkh6s2Kf3fMLTlYjgQDEopujgyZEF9wJCIgSv0yD0trGjZCasNU5l7LO9/RLXDqkp1UgDnmM/59cEcoKJF1hlvTstHvAqRCVRED61q6Ibi6Mx/j/mxBxVgcc52uduK/t0YFLp4ndc13Clmy3kJPNzF/jaMw4FcX2YIkkQA9bIo4dNnzJE+Op3q5M7RPJfLyupMxUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXqvcwnkOZ4m6tsew4lwSsbuLjvDgznNJBQdMVFl/LI=;
 b=SWW1QelKPLKDd0pm4/OOaecjdaEhWpRX31CUtyB78bXwzBrvJcEoEQZWkok4TjEfPGqR6+mvRBV/OSJUHXLejxNKZ41wkHeB/9fhQ3Zr3Zq5d6sBfNTOyScXyL4f4KeD9xSHpjEqfbE9TzGDzmR2nk4rTU5jIoCN79OSz08VXY/BfHJZcIfjwGIo2phoMmHW6Qlb+XwmzydG+AxL6rfKnC4b33zVo2Oit46MCBAMVg4U5KOQgMWX/Z/abSO/9IXod/SWO0DVptKqRRoWV75Npt49M5U5r1n6XxTs1fJRRtlrEV3sN95h2lzDbWaVjQx7GWkrKApYP2uUbGTPui4ysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Sat, 16 Dec
 2023 12:15:27 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7091.028; Sat, 16 Dec 2023
 12:15:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] debianutils: upgrade 5.14 -> 5.15
Date: Sat, 16 Dec 2023 20:15:16 +0800
Message-Id: <20231216121516.452373-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DM4PR11MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 5196332c-89b9-4710-7f02-08dbfe30b014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1MCS/B8XeyiGrgyK6U08I9TRCtbQ0JLVRSrc6ndg672yH7WSb+g51GfEXIbwFlkwHfv6KgUAGPWYhDlywrfoogKUfGFHWTM2bd883VNSKHwQSEgYH6TGfKh2xby50P98HBPosEvedh80v451eFQpRn41mqhC86Hka/RYm6a84JfD2wZBmwO5u3rgi3cu36taQXxvi9I0O0PdmBWd/DY9H/AlA36CEMrxxMWPGah0Ka3rKQJ0kh0jy9c9J6ffNTvR2il6PYhzETBElJE6idUfzttiQ9nccmEKQTFN8tYLA+lTveQS6eRa3EcVJJx1jGs7ZNT6N94Gc5cKtqlxoIWsGyPFtCJ231agLQk6XmabiBHC1Fn5nGPegWyS8HWEeDNMZKqJWRFzWJWlqawRmp+m1ti+t0dO04Cj+ePhIzwoTBHpyrimfc/4r+s38o9ofJyhg2wzuVSdWuJgdMfX9EKUlkWe6SgkClXzD26cAtXMUXakW01ffIQysCJTnKm6uZ6iMcELb7ecZqKkCqMF4/5rjJXaygaWKfBlMLU3IzWoloT7USmmDPJIKSbsaIaJMMJN2N+pAHojavJxi3+fm3c5Tx8YASbFQMW/m4CYvE5kIdjAmlXkvsbtNHh1dy6HhQ1B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(136003)(39850400004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(41300700001)(6916009)(8936002)(8676002)(316002)(44832011)(6486002)(478600001)(66556008)(66476007)(66946007)(38350700005)(2906002)(5660300002)(36756003)(26005)(38100700002)(83380400001)(6512007)(2616005)(1076003)(52116002)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MVVT7UZH1vFGoDg2Za6iofY+X73fABGCGEmCSIuez8afPuakaWs0qojbOIi6?=
 =?us-ascii?Q?eYYIoU/f4IzuOSCzGZR/yCzT7k64kWB0EP4fZwjQyivflzSuWGaxhDxxR7kY?=
 =?us-ascii?Q?arBmgdluEEWWhMEMJuMiY9lKlaVAb41rE35s8+Rg/2NiaBqEKAHpXasjzZ+0?=
 =?us-ascii?Q?adiyDGpYfeKVMjP6T9XrsC/TpcQrIKIk9RG5pz/pF0M+S1StNzO/x2p0r3AN?=
 =?us-ascii?Q?kHDUubV9+FCa81Dy2rK4GN+jJYVK+HEKxhVmZfc+I7AKsl/uwVlKzT8czn6D?=
 =?us-ascii?Q?gyflWe4TMbeansLNvVftsejFiJpW8OIhy9uX2SbssQIPuuokGiMfyx+NCNXw?=
 =?us-ascii?Q?VuyzSfeFXqVAfTJHtdClnIYC6ol+djkMOTUOw+UVqjBC7y/mN9f6wXEwhEmH?=
 =?us-ascii?Q?WVILTxsD5ZVCy4MVafY8okpATBJKjwLpA4qSq3+Y6iG8k2mWsIuVrf3hZEqT?=
 =?us-ascii?Q?CGZxekGHsuwyXrmyv2Q3YLohjmbzcdUXSjY4/fv6P4dW9F6AsVQbqlQsWOoJ?=
 =?us-ascii?Q?730cOl1O+moyXtAq1dymsjePlt0k4Omg6pEpje5PPOyGpKDeTbJ9qEZNOWTB?=
 =?us-ascii?Q?JZegvm76VnL4G4+l/wuroeRcPDuLeL26aTnyD0ulP1ZgHMCrKi0q2wYTUbKa?=
 =?us-ascii?Q?dLuroJs2SYmQ0uY6d6l/v1NqjFFhZXn8AqTNfGs1MNjuaUBVS8xrl4zLAx8g?=
 =?us-ascii?Q?yicxo1WiXXaUhy+TUsXaVt1GTFu59j84v3CdElqQIg8Nou22FQ69pMb2W/tK?=
 =?us-ascii?Q?UQj7GOwnnIqIu1GrUegKMB684tK/R0R25DYpi6EpyPjeSDb0HWb+cNLpKya6?=
 =?us-ascii?Q?HFEC6HMyqANTi6q5sA65F9b4C5yhHwze4Rd19zFTzUy52YmcAg5+BnHeNUVY?=
 =?us-ascii?Q?lefIm5giSpFJzifbhs2xSjOkrZD2OoZ8pIFC+dZwiFXSDRHSELKKN69w9zb5?=
 =?us-ascii?Q?O1iIbxzkbmVYt/3fY1U1vviz7wkm4PBhLO4eC3QehlL6ozaXe7gIIu409HCM?=
 =?us-ascii?Q?ApDKIJvSQkIzJgcOXOldxnQDkLrI9ialErUBSZ2Z0tVlFbiycZjpxVhPJ/qg?=
 =?us-ascii?Q?sFkYVjI65ikftve06xNVp/DSoJxkkmNm9ZVQuI8YW7w7WF42Y/3w9slJJUVN?=
 =?us-ascii?Q?SCaLtJk6YIMtW1yKnlFL2OieQfUZtxpaDJBpxoAw8+hmerjh6Zm6V606QWKB?=
 =?us-ascii?Q?RqlIewyQQXLKxA0mTAk1t9os9fYzdpNHHI68bVITCPyyyRE17NiuMAKdGriD?=
 =?us-ascii?Q?UnznwU4Ck4ZRkOe1DGRg+lqfweoXJjBnwHfXLsAmFBDt/jv44hTO11gd2MBg?=
 =?us-ascii?Q?IM6ueymveGcEjYPR/OaRnQJ7uugh9NGjqk82KWfDa34FRQqhi3FXBOffR73e?=
 =?us-ascii?Q?xMWeOVz/jD7kR/zysFdjmpEwQttLml8BNN73kjOyZltZHWLw/xwLBcZwOf4G?=
 =?us-ascii?Q?20U+nQDraZPf0MSfciiLyUvt4bhUqopzNAfMGTqKbmq3EMjoLjntrGRiS8st?=
 =?us-ascii?Q?A0vJgmc8xLFFSVOnMrkFkYkhrMLvqMSgXzJrOkfPntc6e0gFoxLqD6RKcs2P?=
 =?us-ascii?Q?R8+Iz0BegRfLMX9H/EvPYAzA+Ev/J4jpwc3ow7H4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5196332c-89b9-4710-7f02-08dbfe30b014
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2023 12:15:27.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKAdPhQdBLpd2z+sfLZdLF12iTSEXd3dqwVmKQGp/FXAWxyGTpspXXFmF4bbeZRX1DzhtLtfPQM8hn9OQLdsTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
X-Proofpoint-ORIG-GUID: uQ4jsqCSX9uy-Y1v0v6paexHkUYtf2o1
X-Proofpoint-GUID: uQ4jsqCSX9uy-Y1v0v6paexHkUYtf2o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=679 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312160095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 12:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192558

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../debianutils/{debianutils_5.14.bb => debianutils_5.15.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.14.bb => debianutils_5.15.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.14.bb b/meta/recipes-support/debianutils/debianutils_5.15.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.14.bb
rename to meta/recipes-support/debianutils/debianutils_5.15.bb
index deec8d1fe8..b1368a3b2e 100644
--- a/meta/recipes-support/debianutils/debianutils_5.14.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "7e63b32ea4126c70a5da958f0106add267810a94"
+SRCREV = "d886c15810b58e57411048f57d7fb941a6819987"
 
 inherit autotools update-alternatives
 
-- 
2.25.1


