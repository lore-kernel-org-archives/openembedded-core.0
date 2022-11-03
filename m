Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028B4C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:11:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.20319.1667488266039577650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 08:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s5aQVcTR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83062f08e3=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A3Cvw1E003360
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Nov 2022 15:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Y+NgZC+1Y0Z+oztiPZ6/Pu93UJID2Odd7/qLmC2Gh38=;
 b=s5aQVcTRoNAIooiBp6vhiOEDiN278nm3mUkJqlt5zUTeZZ6Tv9lYXpIzjWaZ8L07KfPT
 /ZZDBDoozk3rSDTk+t+wd2QtCDzANrlRMOiuIo/twaWUJKqu0vMUXGYT9PL6EBsbfhKv
 BxBAs5hkRkOIoSslFBd+uORGW0+yUK6Bo4mfgeIy52jkSHVTAvZokwaxzJTJ5PioMibz
 B2JizNr9c8jWw1AiNz8EEw93LOz9Q1AVO93F7JSbyNwxf5Xvbe/gJd2D9X9ANzdPXuiG
 2mcAAdizsKFnl76trYT4Dx2DEh5Z/MSjHrftRCLfdEHENWjklUo3H9I9c581RMDMxw0X Gg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3km4d30fpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 15:11:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK/GZdRBo2vCZRjr03bzpmbejrw9ZLixjE6ZTw5uC9HL7P6Corhz9y8YxA0KtBT6rjejtLa1Mc8HXBP5C92wOzxJ7YU7YpPEBvghFFsHZESAHqSf62vA26E65Ze8QxuxmO8d90Lo/fGmZqfK2oAFv35ciiUxNYGh/urLxpfSRv5yiGOyyWdMzJAYW6q2ztZvkNy4u6L0yQsxarKnNsZsG8LUORX9s5tmtqwXoih7y/whWXbE3WfzHdImMojZD2VSYLLp8hioC+eYoWfXVnrjRV1cd5fI5nQ7Nctra0vZHLUKjdLztTom6N7NL9hzj747Cpjcz+09XNxvhNmRv1/H5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+NgZC+1Y0Z+oztiPZ6/Pu93UJID2Odd7/qLmC2Gh38=;
 b=GmhUhC3ccLtUyfNJBLatOUppA7++RlDAPR+mzYk35lY3hLog2RxOGlMJk3BSoORSqZ+CmOg2now/4prYs3q/bDC9XMtfad30U5Dw+S4QxweK1ygrhMCGRSUPEZ0nz0sqo0opvZ9yULapFz30XJY2lQLPeNouGDYc7Cy35Te1ar5t3zGVcz3YtynCqnyJiNqOl66SeIxkgDdfHAmS30dHGJwe4BLuDSDVMAMd8VDrEYru5Nj1L5R/jzLU/kh70df1+BPuLCxelaN0RgRDWcbRMAAAd9hoU4q8q5qAcrZYdjDb+BdleTHYPD+4H/ZS48gOron7KjeNnAR4FlY3t6lVLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CO6PR11MB5572.namprd11.prod.outlook.com (2603:10b6:303:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 15:11:01 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d%7]) with mapi id 15.20.5791.021; Thu, 3 Nov 2022
 15:11:01 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] lighttpd: upgrade 1.4.66 -> 1.4.67
Date: Thu,  3 Nov 2022 11:10:47 -0400
Message-Id: <20221103151047.39436-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::23)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CO6PR11MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: 80422e54-74dc-4e0d-0e84-08dabdad9e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pywEb39PeCN5Xcyy/ok9tFi8yyP1QJyQKFO1/u+YWW71i/g0AYZJL0ovyqQsngC5egp/z5CsS0n85hGosDfKVYGbS/M+pKsVUCntFbkVsIJNgEb0EDsgeRQmglGxK/WadjzxO5PDbe+D0HNS96UGAt3ifLywDqhlYEyTkWz/G8YracUdpia1/DBti41XIMBUaUp0gb3gYer2btyc6TtI71XiEOrsVpeA4kKuCN84MG7ZpLi8v6cSNPiY7th1LOmFvbdqiU8/HBcD3803ZGNGJK6L1GLL1b1klwiv7NpIFcpKHlIuUkW5ng7Irw+4jQCuV6H0spqol36g8PRlA4AdI3P4SsPwjjFLHhs2vM2PGfalT7imimem1QYX67S1tVipI+79q0lL7s1uAe5kUfMOx9nOheSECwMzvPVJe2lOlrAnsDLd5U80l/DAllbkj7ASJXDprwgZGNdM3JhJhIYmRcRgrg1tVI4AXbnozfdKcBcyj3fHxHXOUhboG7ght1R1+f77HnJ6pgo+9Yua1IhQYPFm2vmjZKeXuiroz3U1/NDYhjzseRa3DO49RyufMP39GN6bco94JLW9iGJ0GXfgJxcCFL67zk6K/9OOqmPCwm4RNtCsHd+qaezKAkHj0cloDecFNxVaZ9B22+eJSweE6Mk0uiqRlnYDL1YKJJ9z0eg8suLMQSV7oKaqsqonSUc8qouBfuEwJlUQLAUqnHb5/DazT7vMD8RB9YpDJaq958vW1A3y7my/D7oK9rDKiBRjfsAMt4irD4gJDK9/URE5XsecTXSsGKrTxMoxsWHPGXI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(451199015)(66946007)(8676002)(6916009)(66476007)(66556008)(83380400001)(316002)(2906002)(6506007)(26005)(1076003)(186003)(2616005)(6486002)(5660300002)(52116002)(38100700002)(38350700002)(86362001)(36756003)(478600001)(6512007)(41300700001)(8936002)(44832011)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0DUvmcx5a/awRVXbrNaP4uMssUeL8FuQA3Ph2uAfzEaaZL0AdGDtwlqE6s2D?=
 =?us-ascii?Q?Nj/ueDzSqP/Br6RTzCGP0CvEUYoG5Z06P3YnJr7gZmmalWU9EH88Oi/86gTI?=
 =?us-ascii?Q?SLJ1lxLwfsyBCMbyFcqAShpXS281o73d2yPiKRsz4cTss5U0LZW8VswyJECY?=
 =?us-ascii?Q?1uXPKq2KLPDf8mvTZEWdiWL2D6v4zJPIugY7MkMGW3dstD/LQ3rOuIkrNebU?=
 =?us-ascii?Q?kX/TqNqwIez7R1OtzL6AJvqAcVeb16mnwWESn/PGFyEsDDYdqU0W4R35MA93?=
 =?us-ascii?Q?JFGM1vafdOLFa6L8niVRYKshaYZsGZeWt6F/4/zQYW6kdCfKcUv3WLonLtv+?=
 =?us-ascii?Q?/rk3qHl+A0A9lncFQK8D2xUEecU67pbUS+l+rg+WZ9r9AZACXKVjNyTrjO/Q?=
 =?us-ascii?Q?8+cDqxNRzWI4ya5opJVf2IzAaC8K+HNefHBVI+e4iY6TlrmLOTeISmGKEKC5?=
 =?us-ascii?Q?5031LVPdLXhiQtAhZAL6m7wTCCOMeZZZHjnXWM3mYozSbUjwIpMu5CsIDSj/?=
 =?us-ascii?Q?dw5kuXmKUnPf4kuLEENU02jxmVdUEq7qdkbCieu1Pj8OL5r0We7b+hhi9gBK?=
 =?us-ascii?Q?CkbU7W5t2E1e0L3XCXCrh2jPwwzAjOoMtnJROrv038+UhBoumqwJvVe8u70u?=
 =?us-ascii?Q?22rKphIUZ2DgWd9O3YPEeetjRBfG1TLy7z+LEiAUf8XyL2zoVy4m2TUL8tPq?=
 =?us-ascii?Q?QgvJ00bMnT8ubGdFzRzJRss3+cODBajqhP7JQeT5y2tsoBsTMsgmMFWRU8oA?=
 =?us-ascii?Q?3eGAqVr2ZCEx9XgnK87SZ3+07SB5tM5gKKaTBWUdtRKzynbIV8Tc/9TIKDqO?=
 =?us-ascii?Q?vgmZdE6vI4OAVAZfxEpyVrUdmAG+zyzF4SwdJNiUhRvIyjLvu9lpksGrlkg6?=
 =?us-ascii?Q?Z40PPIzEI0OAEj4MTRy7h4tHNlg12yXYjE2h8CJl36uvZJQkuUSu3dSVPIGI?=
 =?us-ascii?Q?WrBrYfsNzmrlWnmSwd8aARz/cKXmuEr6cOM8xXweU5mpKpWGbplIH28i4g2x?=
 =?us-ascii?Q?6yZ5X5wl7yOnJmka0ot7JRWI8p/adn7jlM0XguUvDsrvFlaSLd00TLDtFiaB?=
 =?us-ascii?Q?TGOiqp4/6pmJEI8tDc1NzEuLOQjdRCQ+qUr92SwGw3II+sgJBG0NjlYEan1C?=
 =?us-ascii?Q?LikqONWzO2qfa+DhdHWrRb78uwUKYAsyRiws7PhyWK0BfWYyaGpQ6tof7sA+?=
 =?us-ascii?Q?ilYeES9R37ghvwyMHNHEHBYtFgakqemNt8UZiP2V93wgBC9ZRWrn8znsRGJv?=
 =?us-ascii?Q?Sl9sCX2s5V1itEFQ4i/GPkbGw/PhpW6LblKqXZYKw1LT/ZAhgqYQl50FyRRB?=
 =?us-ascii?Q?+5x8TjGrrNQZS2sHj7GjVzzzj5LRoZ4y0jA7SKnHEzogZ5Wgc59CzNnr5t+1?=
 =?us-ascii?Q?bT2NURfSQmb5by766YvW1UUJrYzB5OGhPh2A0qRhOSX46y89VABJO/eP23qy?=
 =?us-ascii?Q?EWupSiqJC3QtDhB0GpJgI5/xWD5yZ1BV95NO9JXeR9uA66yEG2vrGR78Jzka?=
 =?us-ascii?Q?oK1OIJ5o95ih+biHHbV+pKfd12p2JzZtF7+0+ZXLAmziIOs317fZXB5fx4RP?=
 =?us-ascii?Q?e82gGWy/6hckGGTXubFVE9dDWC6fOsOJnfNZDeslLwnH9wZ7cL4AmtkVH7At?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80422e54-74dc-4e0d-0e84-08dabdad9e64
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 15:11:01.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBQmstOY9r2sb1sQdQ5caYRz4gY2MF3uN9+3wu+kriSQB2ILq34ws7FSwD5wN4WezOwujyzzIBKX/GwGww8gTbEGEUuQ78u6YtLh2NSNrI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5572
X-Proofpoint-GUID: oYZ8jV_XOWqy88Ycp3yKInL6GSLuzUcj
X-Proofpoint-ORIG-GUID: oYZ8jV_XOWqy88Ycp3yKInL6GSLuzUcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 15:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172635

From: wangmy <wangmy@fujitsu.com>

Changelog:
=============
  * Update comment about TCP_INFO on OpenBSD
  * [mod_ajp13] fix crash with bad response headers (fixes #3170)
  * [core] handle RDHUP when collecting chunked body
  * [core] tweak streaming request body to backends
  * [core] handle ENOSPC with pwritev() (#3171)
  * [core] manually calculate off_t max (fixes #3171)
  * [autoconf] force large file support (#3171)
  * [multiple] quiet coverity warnings using casts
  * [meson] add license keyword to project declaration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a399862bb2e1503fbffa18e7ec0767643f76132)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
index 801162867c..838881f238 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "47ac6e60271aa0196e65472d02d019556dc7c6d09df3b65df2c1ab6866348e3b"
+SRC_URI[sha256sum] = "7e04d767f51a8d824b32e2483ef2950982920d427d1272ef4667f49d6f89f358"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.33.0


