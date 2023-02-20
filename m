Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3883C61DA3
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 21:31:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.26353.1676928653253526914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 13:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PKskUR5Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14150e789f=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31KLM1b9001742
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 13:30:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=F+stsi6+9HI27NvzdhDOFCDvpht8FRzOxBwqh7i5Spw=;
 b=PKskUR5QoQa7qURxxciiGacyncgdnWdK60iSzh5dCDbR62s4ahHMNx42RARvh8QCnfrc
 vB2onDE69tgZiYxq16wKjAIAx29RN10h9ln/ud8Q1QpQ0omeKc1dmh0iOOgBYvtBgm/K
 upYbqavIV0lAoCjQpqEf61hnzldjSN2z394irsszrEnLmLJuP/ISw1Hr/OPcdPERw21+
 S/dSejklQbWfUF6SnF8vPoavs6fjLHjgo4xYGimjQBAxZ05pSEHn3DZIbwtbyZ7OTnPG
 4LfAjX5WRyrzr11flii04okzjA13ST5WMncHTdNwGcpECK9Y35D5eutPLBkGSAWfqGhY pg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pstag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 13:30:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0ZsmxDOrTaCesvxKYCYi0j7n1FzPyIbQHOFYAYuf/bry317SRgUg1pgICKGEQGgDUbv4xM1ME/5AE2dpSRR61HRIWH6MHtXc07sR5Ca2AQuLTAKjbAWtfRdGYtDQA/Ws4e0NBBl9aPv7aiotkvfeI8812OrKcPfhCK3fgY2/085yZXXxOIqmOiDM4f8vBw7+1vwgOFaIzF2cHBgX0fWK6PZeixa0s6k6mR4EztvE2Xy4P2BbeDCsXpBrAbPMVVcpdTsIVorJe87B7KILoV+0rvuGdGfyGgTy6HUMj0wzOvd6jX7vBlmUHtrfRoLoBYaqQYjJJZ7XI/kIEjqi8rKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+stsi6+9HI27NvzdhDOFCDvpht8FRzOxBwqh7i5Spw=;
 b=RbYkVRl+pA+0iUTnNH6cALSLETh/KHy7bdqP4nck4qtR2Fa1n1ULeSXVMgpTHNFfAuWyxGE/en7zfcou4rmsvTo78r4zS2TX7fVVPV5lCxVC+X1w+l4+NeDczfG2nG6CFZbVhjrncPM0zQ1fYUwDT5zQNBjseeb+oqXsxn7y3RZa661r1dPJzmwwRIwoZmceWYdLsmzMFLYpuMfUTG3pE0DqWADPZcbQn6fR43/bHWaif52N5w6KPPBqBVhlGATdXGRc00ghaPhJoCJ7U2SevtXQAs67UcIlnFG2XBeV/ryOlDHRVOnjEPW8rMWpvDG1+QJwR741ZTq8QhpJeV4Wmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 21:30:44 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 21:30:44 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH] package.bbclase: Add check for /build in copydebugsources()
Date: Mon, 20 Feb 2023 13:30:22 -0800
Message-Id: <20230220213022.2898796-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.35.6
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: d57489d6-2007-4fa3-33fe-08db1389b901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ho33EMg+sqEFF2ECW3q3juBISttRck2irfk8RFX9f0rlTNfPCSmOG2KTGhtI8Phw+wD5KbqtdXHQVH7R75tSpucv0Gw6Ckaal2Y+n62e2dZbA99ghZvs1oVCMf+QGUDvIJ6iXSrktKTWZf5/QUyopZHrZjaZniOkoFKHTuH5sv5wIgGLKGedA8U6f3v4EsmDzIeDz2dOr02tXs2j7c7j8+zxptSk/MKWIhQ8oBKKb2pFVt+Jnqm9P30lrmcQ61Vmj0E+X5pXrWf1AlW+MgaGXNPyHKNZ9rVkNtgqYIeoEmRM+SGmJR0+gLGgsoIOhJa0OMQyTqAi4jYT0SBQl36DqaGkXwQ+XNTxQljHUNp/QBPPZw+Ucw0KZgNunzWsFdg9RmYi97+dji6ovzgDCZ3rW6rcAAJMatifJ2XeRlyKKC1v2tFPyyDCfNkVmpbfUhH1taFRWzZtp/eG3UBCO/BjHHBU6cfSvDaEbqnVKURtPYXbNm4QqO3XleAxHmByrT6Jd5MjY4fDOW6SH+2SsOVEzr2K32bGnal/NwB6NpTpHJl+PnWN819CGOcffaqeXnXmw64XpQW+oSQsttd58fCRu/Xs5GWcwkOqjZfsncDX06qH+B8Kij62gMb+SkYLTyOOBOJmqM4qKLEHE0YjQ7XJ7w818cxzGYH9hZuV+gPq5PTDbcAQEIo1DweF+4o25JRE4u9bnWRjF5m9KnKDTHLUPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39850400004)(396003)(376002)(346002)(366004)(451199018)(8936002)(5660300002)(52116002)(86362001)(38350700002)(38100700002)(316002)(66476007)(478600001)(66946007)(6916009)(41300700001)(8676002)(4326008)(66556008)(186003)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(107886003)(6666004)(36756003)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nHL/s6O7myJvsW9RXax3AVPOWkXAfuLu7nnj9vtwbTzxFIU4nXLFqmgoLA2d?=
 =?us-ascii?Q?v9D6ybbcloQK6OUT7eikxyw97BwcE223pFtrfAyTd7CZ4ZC9o0/If1FkJMcL?=
 =?us-ascii?Q?gzTPoSKHwnP4p4WYapXnQx56CXd2U2T/PYrRXh7+3U6hEYzFGwJ3NSpDYrnI?=
 =?us-ascii?Q?O3yAy43gP+Z6sv+o3M1h8T/N9q7HEvqwO3GPNhqvWKVTZo6VqyJk4u8EUFvQ?=
 =?us-ascii?Q?EFHcCdprMe98GPP8Gj47UzPfbAaZXd8yAzdImB2nR0jfqVWpSkp58CsjlJWI?=
 =?us-ascii?Q?h41Eaf7QGwEstSUczFWhQWmv/enpY4L9sD6ZBUWhy1H9VfY80BJOh1pQAEYZ?=
 =?us-ascii?Q?4ZOqeJWi6l90Seb1c69RYLtzng763heUNkbUF1kAM3O3SaSNbiG4g2MsGMX+?=
 =?us-ascii?Q?oZgG9ReZcBNZoLeDJvgNjZ6vgtu8Nump64tEcLV06sDnIrmr+uepfjfvbAWb?=
 =?us-ascii?Q?YIEy93I4Ye7DDVhFenrO7F8XAnFMqzX9XyroCNMFpBJekBzoAPBlj0fjo75C?=
 =?us-ascii?Q?vBP4wgGTWlTjkKDMKMsxC4aS48P9LksMeO6VFLxPORM2Fv8qDJHwrYWV9kXg?=
 =?us-ascii?Q?IHfPEQdhwv/gtMOnNVg2CUMhehpTDX/HmxFBa3bmT3P5y0xDWXa33Bd5tDI5?=
 =?us-ascii?Q?/5xR99Nj3HNGjzpNq6uyD397Nt/fTuWW8LdmHN8y6Zg0nawgyZzEXd7TMUdJ?=
 =?us-ascii?Q?4PyThY8lF2fB2yhNF+OekZh7DZ0ndvmZonIhXhDIeJnDHq2tvRhoUNYzh2cw?=
 =?us-ascii?Q?xTrHpllSyh9ebPvERLMZpL6V1oPF3vTZ8FTIWVJ/744noDEeGy6giHIDgbdO?=
 =?us-ascii?Q?ZvaeP/igb/sn4MBhK5iEQXNaR14aCeljOSfUyt92jZEUZEKmjBxalh4xbRbr?=
 =?us-ascii?Q?0yRXx0kooBpcjIRaRl2iYnGJvbZutNiYgptcWvJqv2Dvys88/d/qFfAN+LXM?=
 =?us-ascii?Q?+O+P7Clj5BcWJb04sgZXFblSl2CkXYyumcKHRjSU7MaAgNcQ6E/Q2NFXi8tu?=
 =?us-ascii?Q?PdIXaMjgVzYeoqsvpogPMi4g2wuaDcPuJmfYuJbGNlmuG6wvmNTVirvq+7FA?=
 =?us-ascii?Q?7ByfKnRNCOG6IIWOS96oemJfxJSkcWAOFxrVv5sH19N508jG+f6Zhv2Oyq5+?=
 =?us-ascii?Q?PXk9A0vWrMmhLVOWL6vj6fDVGkcdLciu2OQn2OzD1Jhl2iAIKt6vgnKqXZZU?=
 =?us-ascii?Q?+xD12dSMQDiEoR2rqmb786WAwjIuJerqfQdXnEGOyYHqqx/eTwISSIDmXq8g?=
 =?us-ascii?Q?uA0kMGfsGdcLbx9VwNOY8RlLt/AaV6WeZaUObqqxnHRfRnk2WXPWLhgSB7c5?=
 =?us-ascii?Q?Twi1/ysJhfAF1lKeCsFqyracK6F7Ry7BTEnY5EDLIITE/sPvT1sFV3kW/9rJ?=
 =?us-ascii?Q?FtAc9r45VQ1GMYavUTx7Fd3TcrPZ/z+MW/TaW2yFKbRZ7bfCKxCanDj4Hbvw?=
 =?us-ascii?Q?snrRTjkmH1bhn3Q071kQ0j+hBQyX//y2KZsv54jdRWKTAHPJOXjuJYMSIDyj?=
 =?us-ascii?Q?IoJ6DjwV7qMDpwSKo6/fBu1TT1ez4TL61bw+9GdhKl+l2xpLLAsdysBgi6qL?=
 =?us-ascii?Q?k0pcsM3n5/Wwcau7OH6pQsXAYF0gxjeXTdvaJ9PyINUruss5HiCUeBQAZSzM?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57489d6-2007-4fa3-33fe-08db1389b901
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 21:30:44.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7/OWKrnOATtVo6rQQMypDdPbdsR3cUeGCDpW06kaKlR/iQrL4iK6Wz9SY2yL6knCzm+6FCD5JRwfvwKZQTMFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-Proofpoint-ORIG-GUID: J6L09yMbRq5h057so1mD89yrLlmZ4xx4
X-Proofpoint-GUID: J6L09yMbRq5h057so1mD89yrLlmZ4xx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_17,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=797 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 21:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177459

This is needed when the SDK or eSDK is installed in a /build top level
directory as it conflicts with the build directory within the existing
/usr/src/debug/build (which is really a link). Rename it and then do the
copy, this is not an issue with master currently due to some other
changes that occurred in master.

Fixes: [YOCTO #15026]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/package.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8b11fdd155..2950218145 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -636,6 +636,13 @@ def copydebugsources(debugsrcdir, sources, d):
         # Same check as above for externalsrc
         if workdir not in sdir:
             if os.path.exists(dvar + debugsrcdir + sdir):
+                # Special case for /build since we need to move into
+                # /usr/src/debug/build so rename sdir to build.build
+                if sdir.find("/build") == 0:
+                    cmd = "mv %s%s%s %s%s%s" % (dvar, debugsrcdir, "/build", dvar, debugsrcdir, "/build.build")
+                    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+                    sdir = sdir.replace("/build", "/build.build", 1)
+
                 cmd = "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, dvar,debugsrcdir)
                 subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
-- 
2.35.6


