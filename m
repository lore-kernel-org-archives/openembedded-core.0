Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66A3C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:35:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12489.1647966920393530399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ffXG/RH2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0080b8e7e1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22MFpZ0F014160
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:35:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tYYiBDarLKzuNGWOsdnrtxc5wHQkDqBu8YKUGPALRC8=;
 b=ffXG/RH2EjnkkQxXbriONpdh3jKxfvQlgKGrO0gpLTappgQ+oF8NFr35CFa/Aj8prVDG
 LDovaX8/qmOuWD+6FMAQr9e8qkYGRYVUwqw1MDSLGOrC56AWtsQZM/aJsD1IYhMuocgp
 8zlOyJfzTsBi1yYypBxQidiRgnmIuWI4ho/1rd3u8gdw6HEBiwFsqOzzYBe55yOFiF/n
 c2PwcYvf4qk/j3xTRSyZzQyPUH/tXjTzuJaLj/aamW35QuNHDlMuc3vBNkJkQnmrx8yo
 E5ijA4pBbdLRzRCHRzReGQeBX5YtLHrCxPvE3OI0acUCc6y5Myux4yfKL0gcDChVmpz0 Ug==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewepj2dh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:35:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNBktnOFAhGAypzo+hRqqy+M5jZkUbwMgk8Z5kI23xLHEbY1sRnMLAl8+qz6NkRtrGeMnw3a9l2VCGSYAmElQirl/3UR90gE24DmzMXM7DY1fWyKUa7JgQzOF88lVBt9tkAL+/v0/GAH4OYMu8kgM6nf2c2iEZN68uqzQIu26Bu/O9KQofW+oUVFIMWvJEzx4RpSjRwxbWbDLD4JKPb2wVfiYMQ+APUnDQf2wDDv86+luPFy1L32r4zHKI1e3VCQxbPbUUq885k4WqYMlhcoVzFAiF46Xp1z3bKzLDGJNYHoGPvSVkvj1I4zcwm0uWT1V3stJZEnuwBurJSU1eX4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYYiBDarLKzuNGWOsdnrtxc5wHQkDqBu8YKUGPALRC8=;
 b=nomEoqU5q4MV1Ef85oFmdP5kzU6dgAJLG/l3FW9gCXEm3Yn1ickTpztsXQliJu4/NgagFAC3gW6fBeih52BhWQZBtZMhVFD2bgZ3nXYS+4aK5Jl41ypuX2TCYGn25/tyRWog9zQs6Gk4Y01j4I50MsMBs61Ssh5WY2dPK6Np8sesNouWHMpXLPAttstur3QQBBcen0V+3oluD+NDRFOfsuFDSYx5LXurtGMIO9lpQlIBqOwKUs5CWL00Nwdf6f/AcePPBw9XnskDd7RuJ00i0I27/cmGgmNJEJksaUO4/vYkKDuvehKfENUMSvqUASwbBWkz6v8gdjG0Ej6DE/bPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SA0PR11MB4701.namprd11.prod.outlook.com (2603:10b6:806:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 16:35:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 16:35:17 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: upgrade 3.10.2 -> 3.10.3
Date: Tue, 22 Mar 2022 12:35:05 -0400
Message-Id: <20220322163505.36683-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46cd97c0-d192-4569-ae81-08da0c21f29e
X-MS-TrafficTypeDiagnostic: SA0PR11MB4701:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4701DDB9D3F5BD3DB5CB1A6D9F179@SA0PR11MB4701.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6P+4s0TUZFb4TPwxMAKGkte6Kt8CfgujW2VbMwwg0LVHSIjxVaQUMdlnX9f9TBC11JcUgSUwilVv6nqSul5Gjl54XusykrFrt7o47+IFE4bTNJ83uLAZmECE1FtoRhmKDXJ7hNnjswZ22vXxwaHBfq+WJY/2Mh4X+Z2faIQmevmt7uJe/zo6AhjfA1oOnraihbSZiJzmvELHlmv45qSyBVqeU4Ma0PJbpHwHIKlxhi62vcdwsFNV23nrcPsK+qokScgsqMH7Eijj0LaRMTDhIf/zyVayLpAHlgBBrRevYvrTaOgmeQCpxodutB40whKRT2IYyk3tVF+NuBE4KVjf4Jz4XlPaNCMzvTYbXr0W29arb3WRdXYcFmOew7kYVeEbhDqZTClZr+Ld900rI+rvqtRfiAkgv/g/sd/nBd4wc8ZNU/YDVhj7A1YV69olt8m0jLx5DV9b9Keo6AXOM0QdCYHfGxoFj1pAtxqPax0pHVab5jtm8IzngFKbh0sCWjPKPvq5kLaqoZnN0nstl1fLzruVQTqIwUe/bqy0cH2sdaqYpPNzSH5/0tuIxptQ5yHo+x8X5KHhWYEc2LM9IthEkfjjzafKKjTlOovcgYXLU9u5rEJxHN5NOPuaI8GYslk+fEzi/64h8rqCGCqEZhhQeqADKJVL06kcC6tptxO08kChYk4LWaY7AChdYUO7r90C+6otKdPBVh1M1Zt117ZUKwBfC0EtPwqS61YNsj24IC/aYp2p7th13fW+22TJ4W7KzZ2uAv82On/ymi7hbV8BT6nUKLudBf8OUSPnBmMkeec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(1076003)(2616005)(186003)(508600001)(6512007)(6506007)(6666004)(36756003)(52116002)(6486002)(966005)(8936002)(2906002)(86362001)(316002)(38350700002)(6916009)(66946007)(5660300002)(44832011)(38100700002)(8676002)(66476007)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WjdblBu7PrFgb1zsNn6YPt5m6eb254MccRJ+hIwLyY7eK0jJZJmzZmH/O4Wx?=
 =?us-ascii?Q?34iCus+qHfdshYN9FoZ/evPYLy1yts0sMoah1EhXUaGO7FTq319o412RmK6L?=
 =?us-ascii?Q?pwJndBrDHjPemL4KiuRE/LHivlQHBEnm8Fn9mncYyH3Fj+ZMnAE26RL4G+Nh?=
 =?us-ascii?Q?midH0HX2IgnYoE3jpq8xl/VhNAPevcI+RcW43P/n+LQ0vSeQZS/aqhXq+iLJ?=
 =?us-ascii?Q?j7C5BKxTCZbvFwsQbSs/iOimmhxDEM8GDrJe2fhBD4Z/0No6OqCA+jvhTo0u?=
 =?us-ascii?Q?7o8CCFpiRA6o+5e2EkdAmjnn8ba8n0AFOBLdcF18olC0plUayn2kEWgQdRrs?=
 =?us-ascii?Q?DEowJ4AEjEx5Yl5556u/Dy61D1tQSPsQl9+hx4Lil6x3ooAsp1SvDaLOiW2g?=
 =?us-ascii?Q?Fjxs5kYInr6ScjywWcC6AUSd5ZAm1njy2p74JbJ0YYZ3FKEylgrS4roZ1Wc/?=
 =?us-ascii?Q?DheYP4sWWkj/HzHTWfSoOMdYQDjtfWCEDD60W3zei5+3uhdvaYod1eTnJh6y?=
 =?us-ascii?Q?gdhB+pZO6NKn+57wuaxYGgyQNAn71CypZNsELPMLlIC16uWM+AALRlYSqZ6i?=
 =?us-ascii?Q?GG8xyFL4B2ivzJFvgK2obaAhRwuvK5TBEoxZhOeJeHTzrJBXkcuBR25X2JJZ?=
 =?us-ascii?Q?r60jl7yExTSY8jsuJas0e09DTLmFzRyQ7HPvF40PPPPJsdhoxyPUXhRTyqDb?=
 =?us-ascii?Q?E3VZbXGlfgmw7elqJ4BmGiWicODkvlLpF13707aJ2owFHCxBFKlTVB1JmuXr?=
 =?us-ascii?Q?BSWwqJLjT+L/AqQ/oM+svhf44ApIgdqpMUJFwtLLJvfSPPtbIXp00LqfOtLz?=
 =?us-ascii?Q?z7hCFRcqSa67VRBOrIXw3HZrnxGYhnw5y8wHGtEnu8qOMSJfafcnXFnJA2vd?=
 =?us-ascii?Q?1pguaAsIAza9lG0E7V/Oh+0waFHELRNVUXw5iLd1sO7Hjy6VJzIuL8y6mc+8?=
 =?us-ascii?Q?xdmhGpZJS+EGDloRR/rR2GyAklnEHuraHvaF00Zd0D96jlo8nvw/dq7bRG+s?=
 =?us-ascii?Q?XVjk5+v3csuG/RO/uCaaB3IPkP0+9t/lcholFSyaNpx4w2D2TlXbv55NsiE/?=
 =?us-ascii?Q?R5pXA4lftkBDh0zo+rCLTPP2aKVMF1fMzSGlE8abSO97VYyu5S0Wc3furfg4?=
 =?us-ascii?Q?CS7tVnm1mDophaAsN1fQQ9WaT6/3WI7seWapZdFAzc3r/5PmdBO+KUxuRIEN?=
 =?us-ascii?Q?d0bHA6qeQahFJJzZTwUDbfLXR89h1IlbSWR+qFKOhF0+saQRZlCiVXPR4v2j?=
 =?us-ascii?Q?j8Wd2u6dW/Lcq7sJvOrnxfatMZkBBb+Zsl/lye1nAhCVyfovN96LH4pOcEji?=
 =?us-ascii?Q?EIHqKyhhfF2776lA7f+t4lcM5UcqijiLsAmFXrj8P1vWNQQZmVqnKfe+SG4y?=
 =?us-ascii?Q?VwnQKZIm9i1s+N0yczewURS7CjTXjt/HIpiAmIvukGGvfujxV6W3vcvk9hqK?=
 =?us-ascii?Q?0Wgo1P2aeRgcjWNc6txlPZRZxDCyA3pxNTMlY1D9reqmCCYnDnI36g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 46cd97c0-d192-4569-ae81-08da0c21f29e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 16:35:17.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8vMFaTwaadAsE3ApRV2UPgQw/KEfstluIwZ9WgmiEmHP0JEEsovQERIzj4RG23QfHZONELZHrasNkfLcOJqQYs/+zpPQpmlgCplUR2RfbBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4701
X-Proofpoint-GUID: DEdyZDutSafg7dtXf-5X9HIMfaDxeI4I
X-Proofpoint-ORIG-GUID: DEdyZDutSafg7dtXf-5X9HIMfaDxeI4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_07,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 16:35:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163555

3.10.3 includes numerous bug fixes. See:
https://docs.python.org/3/whatsnew/changelog.html

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3_3.10.2.bb => python3_3.10.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.10.2.bb => python3_3.10.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.2.bb
rename to meta/recipes-devtools/python/python3_3.10.3.bb
index 32da2a12c8..75473bacd4 100644
--- a/meta/recipes-devtools/python/python3_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3_3.10.3.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "17de3ac7da9f2519aa9d64378c603a73a0e9ad58dffa8812e45160c086de64c7"
+SRC_URI[sha256sum] = "596c72de998dc39205bc4f70ef0dbf7edec740a306d09b49a9bd0a77806730dc"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.33.0


