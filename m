Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AE8C4708D
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 22:33:53 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.600.1670452431139167975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 14:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=dhoT4Ghr;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=9340fa93ca=alex.stewart@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7K4ulm007251
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Dec 2022 16:33:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=TvvJEHimr9qJLZ2OalV44yMv8CPVSGik/ELSmBixDSU=;
 b=dhoT4GhrffYjQ3B81d/STgKTPX/KabfFWWf1GrshQsr5s2xBhk12wtPyqW9YpelBdtUU
 UA9iIyP3up/AxTO/d+yIDKb+rzJZCm4lVHndiFIZ3Luo8vwrkhmf9C8flB4Voh13D0dM
 uBnamz5Q8W1MwNV1QOmUGCsNh9ZECcB1Vt+O05g6cMXOw1+Qz+y4ku8SzPd+RwlXsGNL
 9ES0x63lT0TJ3Zx73BoDi7z92Z0RY7EeH+g+kaWGFHk6oRtQ23EkUV1zNQR9mvTnvCIP
 6lQYXot/S6nuq5J4hXO5IvyIKtWmGA1C6MSb/27dBmrRItgkdC3kMRTq++SyCtDH9PCe JQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3m83dk8exg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 16:33:50 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jx4VxyPlKLMJF/kf5ZRwx9IZgjZhTAMHBxxxwi9YPQtU9dVLCPw3rmK8ArqTK0UEKCNOq1fIPRzGYEguQeYL2GWydarRfrHZs5vBMlTgCYbWKHLJhlaZJwAGkE3PyaWkpAf3Ayu/Jxa5LlHh2AKAnMLMSO0anQYYf6UqziEF7mHELV5fFRtUOD4bbDiTYxRp9l5BbscSBHBW23Ofb5oZAr3RR0ShypuIwEBOyrY5mLezyGprubYxOVCKonr2B++gWgf57bUaUAKuCG2KwFFbAI8vLHn8BJbdYAyeX0vi+MogwgdbIyCfvvVkonAMjFoEfLKfCOYz9/zjKCa3KEe2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvvJEHimr9qJLZ2OalV44yMv8CPVSGik/ELSmBixDSU=;
 b=Lw/8g/0d4IFY0eXEPvFxeqAVf7z9qoIEwo5LsnrR+5deFF78DCUFO/491knBnYAL+i6kRyJ8GdAPT6I6zHPZ5L00LLLD6ES2gl1jyer0aB5PZG7QDnVKyITi31Z3Nvnu4hAFCTKso55whL3TV/AjhdhlJTWtA7wULcJOWXVtuCw73aVV8TkzlOxlXNDs1s02bMvl76/qG2gA9DIFw7rfxSWtoNCvK8EFmpiAXYWdfhU+KJTSjDYUwJaUxMF1sgqM2pZIthBT4Z6x4AmxCoErOoqFeuKEyviXP0r5BKaKjK0GjwRgi/hUVis6Zg7W287OfNam3+7mZ5jd6sceTLGQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvvJEHimr9qJLZ2OalV44yMv8CPVSGik/ELSmBixDSU=;
 b=c/SzimqjRY8e+a2l/CJYML9N8zBAO90puG4gsPa+4CqZ7SfOaV9OYN+mdtxjushoSwMAiNY7iQiKrz5PqXJ14Qz50S7L9G+InWL8KogLkGOBx7VPYqFP3SxxblmPKf9yl1b7j1cxMyZkWmB0moBdadWVas0o5B7/7cc2MBbpTV4=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BYAPR04MB6213.namprd04.prod.outlook.com (2603:10b6:a03:e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 22:33:48 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 22:33:48 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH] opkg: upgrade to version 0.6.1
Date: Wed,  7 Dec 2022 16:33:33 -0600
Message-Id: <20221207223333.856058-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0044.namprd16.prod.outlook.com
 (2603:10b6:208:234::13) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BYAPR04MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: e76df2f1-4399-4f0c-c404-08dad8a31b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S3+U7dybCYB3ZKFuRHDHYRHBB0FwVadaAOXS88M7sTYyzEUEVZyTRBcWr1r114VPKQwYIF0O2NwM3Sbs7pR6Fl7oiJUri//HBNYNqJ5SJU+goK94rYAygCwzJgvPSfIi2Y4wBrWlOnf0DlUAtdo5VYp8mdi0al/6jYcqegnAnrNvqer3UMmLupmK7199Gs3n7HR/kroDxJ8sJRmrEIfnWA4y4pE/QltssSfxUalQKLfTXwGo3VTq7FRmddP92vUYT2E8pMZh7VbKVA1GjMThXUrhilhrgq1VShsmAJmjTzOgreDankwsNJu3ZuSGQ9kABViSO35TLF/SsxRAsfmuWd61qwo3RC9SZUD9sTGypsRD4v+/zDI/MOQ2RipkbhNUfGujpEoi2jgdfcBEiVYTqdMVJGikz0aEcaN72rt6Pn65EhxirqaSfEM7o48Vd/i7nW1YAch6uXPAJhqJ37tzOm3kzLBlKt/mRW8TE0D8Am72bFajWZXr3YKkiC7tFs7RSoU5LWNgsh2LlWfJwHycFVIoNDROGtVw3IzE/FgnFzKputBx98PxWeOyeoz5lfCaRgGhGSm881AXyyTLVIPhFYnqDzNG2bsc9jLazugi+7I3VB+Fv1KTEbGsJ2ChKwSXki/4jtMUEUmiTSe4ZKfDLEGyU/SsojD9Jp5HGiO5V1o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(2616005)(186003)(1076003)(86362001)(41300700001)(38100700002)(83380400001)(8936002)(44832011)(2906002)(5660300002)(6512007)(478600001)(8676002)(26005)(6506007)(6666004)(66946007)(6486002)(4326008)(66476007)(6916009)(316002)(66556008)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CLRh1ZcNlBWQmRzUjOy/vERS++BcIrAwIespqXdGjWUVIlc5PK/O9ntYucE+?=
 =?us-ascii?Q?emo5aQi9d3cfJSUQr/QLgdoRkynDLTZNJR/t+9LWnndREZOhlHLEIlQPBN6v?=
 =?us-ascii?Q?WZb5k7dApdqKWhSrBE+EjovuJ1k6ffgOwJvkwc8HztHufqzf2WKQ0vCAw1Pz?=
 =?us-ascii?Q?JtPg0yZMwrMHW/hxnpYEDoSMzoSmkNOnb2ppPoKRCUghj3VKaHcwrKzFdsXl?=
 =?us-ascii?Q?sxUrGEufg0ZsxyiT2f9TGwI1SCCE6T298X0Ag0IRJXtgItiwYnBPCuOF7RnX?=
 =?us-ascii?Q?amZJBPWTiOjQ/qeuRKCnhiKjo0fSJdNMkJqnIDF3vyPi797gTtHZuXRurWpR?=
 =?us-ascii?Q?qW3QjVdhBVqM9AiGEBCH09vIxY2uh6XGbB5hjUQeZkRg8E9692B3XlOpJGRc?=
 =?us-ascii?Q?WyDDzRD4LMmV/2lJyuxLm7/ZKau0l4xPY8DJyB71DFRM11+NHin1vy9mPiGT?=
 =?us-ascii?Q?q1uvNkoAfqiIrVbaUBHMmosRL2urphlTBE9soQemkly+IWZSJCZsk/wQWGMb?=
 =?us-ascii?Q?6cI21Ap+BV1nTJPPi0BY21f0/skGfJDz9o5+ozng6I/dEi6bYX9QBmhK0IHt?=
 =?us-ascii?Q?xFQPAlTzXaaJznnKqlp2XVPnFD3QtnBI0NwBSS720moqff5p+Xajkaq9okdq?=
 =?us-ascii?Q?DE9MvyRE5lgEObTem7h36srNKdiXCAqXjlI7Gq8vpGldgs/KCjW+eIncrlrp?=
 =?us-ascii?Q?UGVmRIgYXFGkCRM3zPWIxw7BEnvx27CcCCkV+bJQpp6Izw9MDnlmCl8bwfHn?=
 =?us-ascii?Q?y2Lx3WNGm3ElO+dBPrTlUbDnOcAuEmlHkPROmz5HQyVhz7M0n/5BpFv3YV9n?=
 =?us-ascii?Q?RRD0/Goj2UpXvw/fPgokKCf1IhyZ1dVBEE/v3SgjYXv7ywPKUvFAwbg+bwcP?=
 =?us-ascii?Q?aY6Gb9LrsqDk6xjCXvQ6zu1uBHiyGr0fI6bbyMEPLN1zErMCu6J1n3+/gOV3?=
 =?us-ascii?Q?y2T2+GZZtEDQbPPa4AWn7bjDtxulZ8XkFW2PU6ROaarLqgKUOwt/p0quu64d?=
 =?us-ascii?Q?Qn+s9web0zwfBykV23Ruue+AUuQff6zh0Du0vMdMtKTFBg7JCzihv8GFYFiL?=
 =?us-ascii?Q?+w9+Svj6NRWU+Z7cdktHQZ4Y0XT0nGUZYDUGnClu8+mgXQOgwXWNsFdK3o/F?=
 =?us-ascii?Q?9xVmaIJSVVBsk4lPOVivYGT/9mYVfbyctPxoeWMxU4uUyV0AHVHcftBT7K15?=
 =?us-ascii?Q?8O+m2kiQnjfksFp/N4z34/lAfbNo+ac5cMJ1/l2JBmqTx0FGmXG8ESVV7KwU?=
 =?us-ascii?Q?SLn/98jad9pf65+4DvF7sRYdkMPcXJnogebe/g6dHYcO4yN1oH6TNKlcpPKo?=
 =?us-ascii?Q?egXdUMM/txexUr4eG/ReCTSMDh/WMcCwUwFKrYfA33R/Q9s21SbXgtG3586p?=
 =?us-ascii?Q?/wQQI0VtoadQoMULrDEikoPZA2K7lFO89DqmGvB8xLC7UkkobWfnnPD26NZ4?=
 =?us-ascii?Q?DYM83M3px5u/slkoEQk5ZQqKuCOfzpr8/ZdLBK5AH3A5+YqkvFhsROB0210B?=
 =?us-ascii?Q?oed/SO2/ERLuqO/CGz5A0CL8HrObWZJgPO8kwTNzF7zAmkEshUDbk5uO36CV?=
 =?us-ascii?Q?LmBykBv5j4LcW+PZizW9P9QTHr+jghIIMkHjnEjC?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76df2f1-4399-4f0c-c404-08dad8a31b97
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 22:33:48.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ulh5fReWpiCFcnIp3gFqyPb4CDQt1fb9+NElGBO787rIET/BInVT5pbLYHwtWeab4S3+Hcuceog5Yqu30qRDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6213
X-Proofpoint-GUID: c28HO3IQP9f-uAZv4p_CAXMwD9pKpKMH
X-Proofpoint-ORIG-GUID: c28HO3IQP9f-uAZv4p_CAXMwD9pKpKMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_11,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=907 lowpriorityscore=0 adultscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212070191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 22:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174369

Opkg 0.6.1 Changes:
- Opkg will no longer complain when trying to clean up the temporary
  directory, if the directory does not exist.
- Fixed a SEGFAULT when parsing package indexes with invalid `Size` or
  `Installed-Size` fields. These indexes will now produce a
  comprehensible error.
- Fixed an inconsistecy in .list generation where files would sometimes
  be entered with/without a trailing slash. The trailng slash should now
  always be removed.
- Fixed [a bug](https://bugzilla.yoctoproject.org/show_bug.cgi?id=10461)
  in package removal, where empty common directories would be left on
  disk, even after all owning packages were removed.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb} (97%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
similarity index 97%
rename from meta/recipes-devtools/opkg/opkg_0.6.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.1.bb
index 53c7399929..50c9451a57 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
+SRC_URI[sha256sum] = "e87fccb575c64d3ac0559444016a2795f12125986a0da896bab97c4a1a2f1b2a"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.38.1


