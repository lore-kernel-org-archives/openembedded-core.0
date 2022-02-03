Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06153C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:44:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2822.1643917448605231200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UOAWwsaY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90331aff7d=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 213Iv7Ts020411
	for <openembedded-core@lists.openembedded.org>;
 Thu, 3 Feb 2022 11:44:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=dJT1wBMZygHALvLaAvC6lplP/Ea3Gzbe+JuGw/vmTRc=;
 b=UOAWwsaYDJoWAcPKgMDc29Oq4vMvZKdNfjN9y4JlA7LP4rX6sHto36w9By3Gi63st5Zd
 VLWwcCa3fSMkhy7M2yteTfbUpiAnDm9boXkOWi88WWUR6J+/vaHRCb2pjRRCqLa9LReH
 WDFLoBzL2TYuM1Shwvq6RLBDC+5yvaWo2m2Zz0gkq526cJSYYLA9eBUfzgz+iBJXZX0X
 FqkkAXxeP1mQuVNm4Ce4yJi6v1idhhp7R59qjyKZl5eZfbh7Y/p3iYISfgQCSKAYdj9V
 Ua3kvOsw+W2J6Is0/94DVFSoRxiCs80caDuDKqMU5+HhtRubsCLWhSk/MDtxc/Z1exMO KA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgg4jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:44:07 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 213JeTYT025596
	for <openembedded-core@lists.openembedded.org>;
 Thu, 3 Feb 2022 11:44:07 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgg4jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Feb 2022 11:44:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fChKoqODThHwlJZb9HQW41m1YyTF+05zPM5R4DbZVoQx59WNfKGqaG+sHPbTibl794yPOuzNr4m3qI2pbeiSFRVY4l9B+zmCU7Evd6vVvMrMZO58kLK8D3D+EVHdbC5hdBRxsQzKxkr9xrw/N/tM/S4UINushJ+gwB5dcFg8oJW14U/ewJZAg/VeiPam+bZVsrcZZi7hEZvFgjtitoVVI8q4/sAAiwWNI5527nwQj7bTptXsiOt99+rdv0+IlleMlsdp9RXBoHGGcSykWWbFGX/i4D0gdDhD1hyYAim+7tXaFcDnm5xfcUUyfzuH4Ooo5LRDbMbazCQSdHLf/Z8FUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJT1wBMZygHALvLaAvC6lplP/Ea3Gzbe+JuGw/vmTRc=;
 b=Wn3cDFA1ZAWOLsmzmV0cd7Qlo91McVzo4X08dK9wwdp4dDiWzq2S8Oc4vJVU81lv86loexdCcF0QB+ALZou4qTqcyLZVyINRpOH0ACKi5czu6/S7z26lMDtsLpHjmczW///YOTdj8/REg/UK0zp+SGLKvNuJZxhlEy4V0gtj0buRB1lxYJDJmVYK5jezCuSRaxoYq5e0c22PQUMWmQrC5vtY1Y0ZxVj3SmfCoNDW6jHCyQItUMn4zKpsKnctcHk3IMQ2A3ZzYdvkrS4K1rGinnDTgg2DDvj5p5566/82Qx/yN8NqT+llMnO8DCVt+Zs+UeeI69TXwiGDN9kCvq50OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 19:44:04 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 19:44:03 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, ticotimo@gmail.com
Subject: [PATCH] recipetool: Fix circular reference in SRC_URI
Date: Thu,  3 Feb 2022 11:43:48 -0800
Message-Id: <20220203194348.1350919-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR01CA0030.prod.exchangelabs.com (2603:10b6:300:101::16)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c32f060d-053e-49d3-afcc-08d9e74d8860
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5214828A102A77FD0B430988EE289@SJ0PR11MB5214.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rhqqD1q3iE/qGNH6odMYpDWhv2AnDL9mctJu+A+jmcEGAZrYgxl9Zxpkjh573pzdLBFH1Tvy942lAl8gYlFlqxp28jevlzV6Fg/QjBJHoo+WkMKisTNfSy96D2nkL4ChshPXkiBPpZDWfBZxMdzI2aE7HSbIUXvYDxvpsP1ZVfCn7+mrl5ekCJF5fbmogvoGfuZKn7ffXVtyb97ZP12wiW67TwYR5NX9Xywn+sSGdjvWRMMSa5bZUj/WBOA/q3WrKHz6zJkM5H6npOazv6RvfmjgRCfMX1dylR0tBRycu8/VEVFQsEqSTqSncX7KBaXkNkQwcAHHV0ZD+Lzjw6uFe3whOIagaRvBXht53XnuDuJBbu0WG8lKPJCGstmxmFXD4m2ddQZdVkMNrUft3NztIy8TDmYQj1KKUtm5hT/eZg4dm7DlszRfzaaJCOd79BR39YdtBebnqCCdCyic16W5J1HssAAJP/CWFb8umwr35WWSC1O/w9FyfwB+FkBZ6CpTe8wRFx6GEuqg4N9H0mr9AznnZQiuqkMftrZm48EfojftqGRybcMDwLxaUlAz71/auLh6FDRmL6Nf3dmeLwq3jCBQJsUZ3MgdGiB5k8oI9LUZEjBBvz82GprqE6c+fj7HYmxpnOWkxQ3wVMUOAebksBwfLXYImVXcSjBKiPUIdUdlaE44gwKmAVgMvZTuNfGV3muPY0bqm41Jd2tkGY5Ahw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(86362001)(8936002)(44832011)(66556008)(66946007)(8676002)(66476007)(2616005)(1076003)(316002)(186003)(2906002)(38350700002)(38100700002)(508600001)(6486002)(6512007)(52116002)(26005)(6506007)(6666004)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4vaEooWocSfpiXhhGJv9IF5zdQc9k/vnFCTGx2fdkVqLCFhFC6eafy4a/lX2?=
 =?us-ascii?Q?PULsaFZSAJ/4MlhZZDprkbxQbNmGLKOE+UUBVhamFckdHPV0id5kXjUaKaxw?=
 =?us-ascii?Q?+q5wkmnTAiFeS/4O5ALCFbTiOSzsixPzpIJcbVjGxt7mvujFDuIK2ND4jyvi?=
 =?us-ascii?Q?EuPZUtpZcz7ozMZffF50uqOHIgfG6gcY3EuH9YXepkFdGUBJ+zrRj2oS6FC5?=
 =?us-ascii?Q?d+XkFpJ3jPzMShr8C8N3bfr4xEaYSgsCnQ/xTNQ1zvcyo6bdefGIjEISJWwz?=
 =?us-ascii?Q?mlgT3POSxuJm7xoPLpCBZJ+0H0Cd4wMRZO7iaydvp3JONEcRF/xKHETCoGou?=
 =?us-ascii?Q?W2Xnq7GyfbApSCJihlY/XArgbUe8KLfgWR1DexmCWGbgPxzhagmCfuRVvse9?=
 =?us-ascii?Q?700BNLMPu//z7vkFZgeqpU66HrDTJpkl22RT90bvrwWcovvRKPE0offXIGpS?=
 =?us-ascii?Q?5FIy6d9PiRNzysWMnGM9GXD2bJr3OEFO1LIsFRMJLXFOLY/1IPH2XJwHFvgk?=
 =?us-ascii?Q?v6wYnlK/YGT/evRZiwTeIryEE9fYugqCv+Cb5Hk7Q1JkK8UGmYFXGULVF4tR?=
 =?us-ascii?Q?xev5W7nA8zKwf0l38VTtZ0P0ohgP8pFkwwEsSXzhwv6EPJXZt6CrgUBbRWbw?=
 =?us-ascii?Q?93T92lIay7cAruy7I/cutraAMFGxH9mhnNEwctILXUsMCiTN6HnvOx/h/KCu?=
 =?us-ascii?Q?t1Q6iBLw5sz8bReF2TXCOJh6cszdL1NOydYMstjQxMiITaavSQhAtewRr5gO?=
 =?us-ascii?Q?azcWvjYh8YBjmBotFSeHeZQULeoEoiwd6pwLmL9BbmZ0lMYwdX9o1W56uWVF?=
 =?us-ascii?Q?513LH1W18inlqvu95hjz8nCwtV1Q4+jPJWPqvL2gAtFhZJHGcQJTAgyDtPq3?=
 =?us-ascii?Q?re3ZqRDu3xbsKJlVYX/DATOM8KLNiMdvbcJcVMGR1xUv5Th+2igNVk9U+ddc?=
 =?us-ascii?Q?eNoK7i7BN3p/JYy/Dw4NdrwTBv1vEYeEEZBzIFgl2JcIvspmYHqHfqmmCVZQ?=
 =?us-ascii?Q?UJ3+uR1bnYvw+Sk9KbsSZylLBHlsYwr3pAQM6fRLgVu57lWbXe+rFY/ylt+/?=
 =?us-ascii?Q?x21ItYibD43Ot+ZPuvThboCsMYqOwot2dK9GH6ujI+bPuogSiu87lwFg1vTi?=
 =?us-ascii?Q?ZJXc3MyvdZk3MSIqXsB/8kOEaA8RLfi7/9PD7FaAiWI7TAQ9IpyBk82kSo7X?=
 =?us-ascii?Q?gNDHOL1PPmLjdsDCK6QCZGIsphIgEjVeJhqt5YX/M2q4c3g8sQoKD0s/hkns?=
 =?us-ascii?Q?trqEFJYHhtxpYMKqmhbSXMRpjky8L+U6dFwkEuMd262E/tA7o/t7v4J3ecDH?=
 =?us-ascii?Q?h3u8J5/URdwdYlCxVGWZEv8QhzQPOcbuU8lgf2bRSHJPdT5kCSVqZb29XuPe?=
 =?us-ascii?Q?XxvIIVsxmnmx9bOA/YLEQkxqFzfpa5w/KJ20cx0/8X5e5W1IX4P6qLYgpcWW?=
 =?us-ascii?Q?KH1n1m+NvsLEJKpO81S8Iq2P+C0mO0LEGepe5yTLR/LUqpR2CaxgprioA1UB?=
 =?us-ascii?Q?FlxNZ90D9hfxhQKnEVNohg1fPb2rvavISGMEH4wuy8/BLXEvfGmBi+wCFIvl?=
 =?us-ascii?Q?XV5kNr7zH1UgdFEx5RKfP4/WTSuy2fdVtmn3f9PBrV2KZC33doJHcufDkUJh?=
 =?us-ascii?Q?GUMTpnoxRuUmuuIym3nFabQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c32f060d-053e-49d3-afcc-08d9e74d8860
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 19:44:03.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tclNs41bYBu0zfb/aJroZtacnkl0JeWODzyR/OGGGV1QWl22nmrO6PJKY94M3j972LRt4lmYsFV6ILWvKfzhVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-Proofpoint-GUID: 2cJh8nsYK72tItS7Dc00t3OxZDu22dYE
X-Proofpoint-ORIG-GUID: jo-H0FLFA-F-u3_K0Z28_Sl545Seubno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=884 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:44:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161294

When creating a new recipe.bb file for a binary, don't use BP which
includes the version information, instead use BPN which is just the
name base Package Name.

Since PB is not specified, it takes the default:
PV = "1.0+git${SRCPV}"

But SRCPV is defined in terms of the SRC_URI, which leads to infinite
recursion (traceback below). Here are the pertinent variables which
cause the recursion:

SRC_URI = "git://github.com/lvc/abi-dumper;protocol=https;subdir=${BP}"
BP = "${BPN}-${PV}"
PV = "1.0+git${SRCPV}"
SRCPV = "${@bb.fetch2.get_srcrev(d)}"

def get_srcrev(d, method_name='sortable_revision'):
    # ... trimmed
    scms = []
    fetcher = Fetch(d.getVar('SRC_URI').split(), d)
    # ... trimmed

[YOCTO #14040]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 507a230511..4cf6a5a95c 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -435,7 +435,7 @@ def create_recipe(args):
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
-            fetchuri += ';subdir=${BP}'
+            fetchuri += ';subdir=${BPN}'
         srcuri = fetchuri
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
-- 
2.25.1


