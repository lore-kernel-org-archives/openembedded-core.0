Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8A2C55188
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3806.1649484461479841896
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 23:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Jf89t5QR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1098eeccff=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2395vnUC005880
	for <openembedded-core@lists.openembedded.org>; Sat, 9 Apr 2022 06:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4NkmOvMFwZJqKfIqxxbCnDKYNQx5S47/fJ9l8o3YqFQ=;
 b=Jf89t5QRKQ9hKTnyTMQ05BIq2RS6Qt08b2juos4xaGIlxYZ1tOyGaPnA3g+QzVfG8Pad
 ydq41MUfeLKGb7nHtxRPM0xWo3uV3RGsfxiDjGIPFX7QTM1IQR2hVgdLMOvUcPvPs66Q
 7FBeACK+7E69xhtGl7BavSFZrt8BO2nYxMboHY1zxdw+nw2Zs/kWTjHnAJDWMMJUh8mL
 vWxjLsW0mPVUfybMGRHovhA5tCPwqF2zg5Jo54DD6XtTG00ML/LnIa7Qg66NpcgXG3bp
 KgolHz1fEG6ioGU3uc/2UXX6qS2fwsVsw4cWUQ68oi746730+xzkNYqh5uOpM6Q0rt+t 5g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fayc0g4k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 06:07:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUG5TxljXOuwsTDGoYYWuzrsTYTtdcvycpmyborS6GH7qmhlj+buWhLieUXGt8rsoYqF5TdAwdMINmnb3whVWMYjamYHOZwuPjhHO65+y7PlYfWT8Tg6YX6jI4kgPLoOBvapOSDvAF5ZDS6lekO3xB4zKo9o5i4kz+AoUgkp7cFbG+TGiLhmTKCSXrUpJajnBndmTw7VNib5N6IZSl/K2ot7RLwgG5Kh0P0bXSWgoD4tUDptIGKfvEAW2BY6jqv1nqPR8/hueOD2DX+lL2GE35y3OerjVNsVfhPJYwjygsQc+1Q5tO5VhvwBBSAt2FlY2D3SnOknP859NyPaGbOzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NkmOvMFwZJqKfIqxxbCnDKYNQx5S47/fJ9l8o3YqFQ=;
 b=Xu2f+Eq2jnk5Z35auW2sR8U7xI7EY5JPza0xFcJRoa2CUEnVxIu+lgywOnhWGpFnpxWD/yFHVbq/Pz+lXGDhmy89fNanVxZ8Y1hTdMSyC9ipSF0GXzZIU9z825qE01kTuXTFrx3Bzu0danPHlrAK11kjbwiBeP23/XzNm+JoQ1b4FF+q18dN9R1lpnl2zI4AmBq/EwAqHcmWfQg9nEcF0M5Q36y4XMr49PmjCPvL5bukVzSk98BJ8sYeUljf8x682DNv2xg3z4Kd9ytRpNCh1reg08sbB5DmJdDr/z8BJfOjdhSyLoonmACl5h0v/HiErxkSrHS6DL7ZVaj2OsU+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Sat, 9 Apr
 2022 06:07:36 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::99c9:9a8c:e613:ee62]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::99c9:9a8c:e613:ee62%8]) with mapi id 15.20.5144.027; Sat, 9 Apr 2022
 06:07:36 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel.bbclass: Fix the do_strip() malfunction
Date: Sat,  9 Apr 2022 14:04:40 +0800
Message-Id: <20220409060440.2167569-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::23) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dbb1f39-f1f9-4156-76cf-08da19ef3e68
X-MS-TrafficTypeDiagnostic: MW3PR11MB4521:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB452185B15757AF424A6F7FB0E2E89@MW3PR11MB4521.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gvUyaY3cmmi0H+edv/lqEH3dJ4z04Sommp6384BBKl8XG69XIk8NPUZw8jnNLO5M247JAjYhiZtHMFeVt6CyufhPLJL9IWtfEWQt57nZBg+MsQO71xibmu5SJkjpiPPhkLcDiyNgeQZj+Nk/I0tAupi4On2ZHGOUL/R7LnCOTRuWnYinppety2Bm0NHOSpytKVlrdz8OdnKPkh2Ni3iK0SvVjlbbTDqHwGj/5CW0fghLUOIJEJLBpQcyPmY5scdUAONgNOXZAAaY9Hf5L2Gc8ZTdN8185ypuDPGikcQWr3n865Fg1iZi/nxFcgt4Y/zpfioyPhPx+J3nLos36K8scfOfIVXl2aAlAVuuyqxNoB7Lf7FVBad3ALyl328nuXF51ysp4EDkv602sWuJ+XnBB4/rSw3RKeoFaRseY4KVIvdjX7xFojBVsgzMGwTaZ0tA/2xS6V+ZtKmo6WeKE/X6Rln5SLsshDoi97FXDLwkmqYHGFxo8Fv1JK3pYrFwGeHu6UjdbWFHXLjXb8hoOyfjNxsNcgbCQlfVW7fjqwLx0v1R7tD1/BQFvSzU43DF3UgkEQCm3A+BmX5Z4W/3iiPx/CRBlTs2Nj9uIWf6KM23oabTrosZrjujO7/++RzHuGmX9fL3jiGoOgDP/JheRlNvVgBxfAvYWjCIb/eTG1kXaK9eVUAP7aF9gPmZKfIvHRvvrvpcy8+TewJ+I6b4ekpIyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(508600001)(86362001)(66556008)(8676002)(66946007)(6916009)(38350700002)(316002)(8936002)(6486002)(38100700002)(6512007)(5660300002)(1076003)(36756003)(2616005)(83380400001)(26005)(186003)(2906002)(6506007)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xCHX/VmOnNOm3nbWyl9C8z5jyDjuj8MVi822lyPzz2wBkxqNt8/xrEn3BM6h?=
 =?us-ascii?Q?NC4JSUHeXVm0i+9aCer7pUCcSHUY0HMiPdRbrcF6MebXmfm/xjs4HRtjrC14?=
 =?us-ascii?Q?Vg4cso+iBQukflwejfc5JysnRpkmwZ8mTEp+qo/nlmJZahnKx6NFNMLBjm3G?=
 =?us-ascii?Q?hqASEjbiNI+PSZ8+2UvVvmM7Os6dpiiRUw0Egzscu8YE0b3OnAgXW08ANlWT?=
 =?us-ascii?Q?BUuy8FtP2cnG/cLRZa+KUhIosWQmbPn2EkLXpvLanqGqokdbsXbk38QcFPTb?=
 =?us-ascii?Q?n7xNbxA2SckhqvvilKc3JJHAKo/9L58txjQFcNNhFrtELWoV1joh4nAlj9Eg?=
 =?us-ascii?Q?vev1pf8K1mgQuh0k+P76OGh1kZjmk2USlOfiu8Gldpt6E2hw9UwPVR48IAoR?=
 =?us-ascii?Q?TBElXBILK9oVhs+B6r1kpdXGsDxqINAm4N6FBwJ1ezdjSwkBq1er7CsevCyC?=
 =?us-ascii?Q?/WgsdRSiwAyfu9kIenvVzfbzriggrV9z2HqK6a7IZUm4dOaEA7FVAbQcHZWx?=
 =?us-ascii?Q?m63dV5ge2B50F3Mc1hlApxS2liIX7SwjdnZyz2ymRH7rA5lHyoD1MpH60ZeF?=
 =?us-ascii?Q?HEHy7RsJo++2LnxBHQ3AUksF/S0qdWzbTAl0RRFDpuvWj2qqEeJ6ij8CkEk4?=
 =?us-ascii?Q?MplnuCX2fV1Ss4WKcKR2C2REmeZR7q02bh9h1s8oFpS/LizgjAPJGC5LjdVS?=
 =?us-ascii?Q?9AI06kdJJHwHvkg8CuLjrwgofJV8MsE35I/ZDcUk1L58nYwVfeda3gbZaCkl?=
 =?us-ascii?Q?Wb5ByveQ5T1a7SfZ8X/o8GjA1/kGdL0UDehCW7KN10uEfkaphsJGFVD8W7RW?=
 =?us-ascii?Q?d0bdygHFTDxn9+wU7yP6poSITZVQbpzWFdHKzXIpMc9UBC6g/aG1EQLZCdpW?=
 =?us-ascii?Q?8rHSv461YbpvqHHW1tsOLkTm1zejINhYGJNM98oRmiI9Dh3z6H/jZamVr4Oa?=
 =?us-ascii?Q?kGL9LnGR/ssK45nj+bJEO7vE/KFIG7UNZSMRormMAo+7hbaSx3pFxONg5tIV?=
 =?us-ascii?Q?9YtbIO+IyjIi9eujf1OiphAWDPyoeE5NEAS6I0KOpLEw3RBlFo09WjbPZQuK?=
 =?us-ascii?Q?CbQcjHCFWTWVfK9COXXzkCw4Q4RwmI56+y0dMny/i7JYAxhEjRT0zSTAStsq?=
 =?us-ascii?Q?MQxvb2vkl5YuI73thlYMNt+YPf3dyQgcytRXDGhSl3eiMlK1oXex6RYEmucZ?=
 =?us-ascii?Q?das2ICy97Z73l5U0Cd+ue/qvd1+lLrGAZZ0vy62GLjkgJDWJM1llbPbu0XbR?=
 =?us-ascii?Q?fk+aN6zMfsrW3XKrLtgicl3kbJaHoNW9+t9G8kTH3UqznR/h/cSdN2xjXEUB?=
 =?us-ascii?Q?0DXwehnY9IQwYcVYKfFJyEUecbmN+lAv+9WFE6kvM713yKaUuRM96rJE0ppL?=
 =?us-ascii?Q?YDLmxilkxB8TZsE2gEd2c5W0Wwz4/yaWD0mG4F6Nqb7rhaNuEf642bPFwyBX?=
 =?us-ascii?Q?bJeAKUpnay/Nm1x4sDWSAtwIzB3Va7ID5r/hOFoyYvUqAf5YsBpT7JChqwip?=
 =?us-ascii?Q?Of8YRlh3KYtiIy+UECSE/4vm04tXu+iWnJixZAMRTeayw0ZvP1WwCljL7YDR?=
 =?us-ascii?Q?AdFt1VVh9IIHoJCuWVLKSLY9WVhiaGAPCiCNfbGVJFY2mnWdBiWIKr/OcBib?=
 =?us-ascii?Q?FgThXU31oVix98MctXwOKN4RER8bzFlwuV6l9fIjiUO4PHVDgvRNiXqFO1sv?=
 =?us-ascii?Q?K90wMOKslGx6FMq3ZVfddh9xFnLRl5MvFHfBD+6l9x5wtLQwkY08kKF7j1jm?=
 =?us-ascii?Q?m+Ed+BaHXxsLGS28ryhvYqzjqWPG1vQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1dbb1f39-f1f9-4156-76cf-08da19ef3e68
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 06:07:36.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wqvmucAdTE3gl4YN4m5iEmb8bR2D9sRQFhTvubbhX5zu6TyhStfQhRFyl52cE1qvBdx/X8QzxVVLH2vZ9K+Pfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
X-Proofpoint-GUID: kuIiZmZ-M-f1fYe-vCo_EdHmolnVFCVg
X-Proofpoint-ORIG-GUID: kuIiZmZ-M-f1fYe-vCo_EdHmolnVFCVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=706
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204090037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164184

The BB variable can't be referenced directly in a python function,
this misusage of the variable reference causes strip function to be
always skipped.

Fixed: b9c3db4953e4 ("kernel.bbclass: Use KERNEL_IMAGEDEST instead of hardcoded boot path")
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7ca847f0a341..bc52419e0945 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -711,7 +711,7 @@ python do_strip() {
     extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
     kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
 
-    if (extra_sections and kernel_image.find('${KERNEL_IMAGEDEST}/vmlinux') != -1):
+    if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
         kernel_image_stripped = kernel_image + ".stripped"
         shutil.copy2(kernel_image, kernel_image_stripped)
         oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
-- 
2.34.1


