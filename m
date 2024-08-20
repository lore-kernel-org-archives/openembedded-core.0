Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B50C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 07:34:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13258.1724139252102054456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 00:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8962e1501c=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K4Uo7o024085
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 00:34:11 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412uck2cm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 00:34:11 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47K7YAuL001777;
	Tue, 20 Aug 2024 00:34:10 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412uck2cm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 00:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe+3En9m7iPLXArJsk3uo1u4KhfU2QNovKD9FUZXK/Sj1TJ6kDVAUmn1hcbWkx4Asi3NBubOrOpFsXFn4ubyORDlK0vlGwB300u9ijVGNmR2gRqM3+KLPw6OfVWjjI6ZQqU1oTOoYIcJo/mDYYfJ5xUnKiZMIne5yvGW88Rf9rElQ5SoLbbOeDtI60elFtQRtvP9rkHxS8YyxBa+mrznjIJhDveqaPH9PUXRjLRwVYDsIsMsc233rZABZtC6ikRje2FfgGVGl5qa4x3D+DlEZjqafQrqL3qlv9QyKualoDFraa7BEcf/eGvEHrBQuDZvcy8Uq9gLKzyjeoxC0yscHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mudBePEr+zOfbD1sxNFJo5QWsGHKHoLRxOW5KeBmbo=;
 b=f0EohGjCm/2ygVgeVIbgEaPLFZYaQQt8rssyLEgHm6Ndiocbu7u4pdmGOHIxi+HMp3BWVjWVHSSp+3f9MZ310L1V9NN2zpPdZSsnaIEPkx348z64HH6L3TbUq1Al05W/4VIh5wj1EmZmkSSxfXcOq5Tr3Hq6SC6+ggWkW0A4xbBSzszd5F6mLAJ7XWtDi6PrjPAJBUGfGAbqKrcj5m/rgY1FFhBjpfu5ACOE/xmmIRSM1IHmN8WuwPB4i6BoduGxTE+sSSpcbIkJ4KMZp7irrHNoNbIkWuLu/2Hr0HkJuNwJcfCXprJA7+//nLjCfsMI3mXpsxqfVr3wNdogrywb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 07:34:06 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 07:34:06 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 10/24] kmod: upgrade 32 -> 33
Thread-Topic: [OE-core] [PATCH 10/24] kmod: upgrade 32 -> 33
Thread-Index: AQHa8s2fhXe4KVcb+kyXzRMtc1C7TrIvwJVA
Date: Tue, 20 Aug 2024 07:34:06 +0000
Message-ID: 
 <PH0PR11MB5611C2508302F6D7D70E100DED8D2@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-10-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1724136703-20023-10-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CH3PR11MB8547:EE_
x-ms-office365-filtering-correlation-id: a8a4be3d-af50-48ed-0ed4-08dcc0ea78da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?fyiNsQ/gYdH9yRWXpe7vXnGLSudmO4w5FcdSC5TaiwOdqgPQe3ui0Y2d6vcW?=
 =?us-ascii?Q?a5+uE6/wcrBD2uO2xnl6SJSjzd83Yge3JNxBAvwzA83Pb9J68Af05FUSc0gU?=
 =?us-ascii?Q?yFB6HZTSNORsnabQqWMHB4R4hyQ4CMQwVg4rjVfC1bY5oy25GeOYk7DZ31/3?=
 =?us-ascii?Q?AcCPUVX+o29KkLlVOn3VUv0fCuqokvt9RSiwYlPrtUrslXluPCjJIkrVPYe+?=
 =?us-ascii?Q?Cbi6SUfeLySBuqNLfi/TGN5jCGRX+fs6UQijTkRLB/fZk/FdbNbylLp/FnCO?=
 =?us-ascii?Q?iX4BPxL72MpOqISQ28wcbs9t1r8UdaMjRq6UIAxmoYIASox19Fs0Fg55OjWF?=
 =?us-ascii?Q?KKvzh1nNz2MhJcUXxosLL3uTQTo1BSBpYf3seClNtbKzH1WEOzowtLMLhlxN?=
 =?us-ascii?Q?jT1fSDhPlD334qtSctBQDzJSqCLWyBvlCRRMam/rNRHQvJRd0V7VwMAnIY37?=
 =?us-ascii?Q?9xMVxt1tdzo0lg6IOKxHbifjfu8hp/Yl5MOW4nfmHwOlqQ3P9nh2eaLXhO48?=
 =?us-ascii?Q?rBOSYELMKSCu93CfU50uJbzd71SCSdZ2eLLvncq6PcLX9DSA4k+CyBl2JWu5?=
 =?us-ascii?Q?agP4Cj9EqLb8kKrQVaCa5Ek62ap0DAuzKCNavT/vQ6Xk1lEVQT1hFyDjg1QM?=
 =?us-ascii?Q?dH10qgugSoAU7X2I/EYsQyhgGV+M/DEa33l/BP7eFITpSqntdMxJONRgOtSi?=
 =?us-ascii?Q?bTfy9yxk1W36bzp7xHaTYOMCcn8MAnLDgqjy4ipTBgl9VaxONBIaz7SxY76d?=
 =?us-ascii?Q?tO1+VIqxGcBCh8KCdYhNbfVpi9OTCvIVmIwGI27457mGd0qblcGBjvu7IlcV?=
 =?us-ascii?Q?8tYSrE8LJBaS5QEfIyDma1WJPE4t6MBSHnslpWfpJwZptxdHI84MAAE0KXh5?=
 =?us-ascii?Q?p5BJ7PUuKSS/6pDEz6Q/3E5jIhP7nEUd0BoEgY59FHdD1j7Lv6+eTpJ3JXgX?=
 =?us-ascii?Q?5zi9Rp93Tscky3k0rs8YuWx+2al/MBI0MhdcEUEueOdkoRVeYFaMwFsHqoRQ?=
 =?us-ascii?Q?sLVN9I/68f4hmOpmydzYXepA0pejh8YXucxhxRwwISjU8cRYw5tEBZbD++39?=
 =?us-ascii?Q?RX3XttZixeMq1hAMQJaxMxKPk3XBPU5reJ8Trb5n09RPJkKIBCAyaloKZZaF?=
 =?us-ascii?Q?xrV9pVGDt4ssx5YWMLvc8Atxp/n1HUi8OehAkqmDIBnlmeDe92zazmQMyNus?=
 =?us-ascii?Q?HM1O5S3BSt/REjl9hATPSKgZFlixtnj1ec+ITEWWEXWMg0txRSGZpvG6Ncg8?=
 =?us-ascii?Q?74dgNTpXLXX9KYVbI93ri1YT+Y8LZS5NYCRU8772MxUVKrDViJvi2JpoZNeM?=
 =?us-ascii?Q?UsXkaQMSPu0G5q33Rs9M3sLo+6Ydn3EqHcw55uDxvRXjDIb6FS+WRvdTTgMu?=
 =?us-ascii?Q?zxRXDkkIyykZL43GO4xUQ1DPiQ8arRtkefyhwhwFdipbkd/1Yg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2eZ0hbuqQmw0IhylH+2PnTaF5H/Wrd01aDVzFudb6vEpAlNSUknpxBlYNwnd?=
 =?us-ascii?Q?IpNCihmsXoWuoMMlc6UDSSIVwlQuw9wrquobyW+T8kfwGXjtuDvegL7i9+1+?=
 =?us-ascii?Q?uwwWyOyfz51A3cfl0uRGlyGdmnWcZMSIaEV7lcw/HeR6CwBkDhP3LpVSDwpB?=
 =?us-ascii?Q?olIYBt/neUe8kUocN09D6/NEJ94yPlrjTSc/C4mXH3NvGHKnignHpoXjV2iR?=
 =?us-ascii?Q?1FYMOb78PHqMpUqBATu9DwJNPhdrrWBC5TAlk0ypZoRURn1HaiPapnA7Wc4C?=
 =?us-ascii?Q?rkxvIhDys8HNW4r1JRCnQio6Au1NtnqRJfcvzh+1GnYREAZmU+DbWLlrPViT?=
 =?us-ascii?Q?W620xTKxQy6v1DUnitT7vTpUvQQYXHZ8cyjWwTq+k8vn/Nezt4A743Mbi/dm?=
 =?us-ascii?Q?PL+BnLawG35W+WGcujk0fXaQh7RfXZJJW9WzPATKrVyd5wgJfpjMPJwhE/xp?=
 =?us-ascii?Q?hZ7XMR7naOkyHCmlc/V9ABNBO0Z4lfleXuXMufWKLcABp2MQGAKNpaXAj59s?=
 =?us-ascii?Q?XJYevKgFik1ulymIDvgK2Tp8tiJxw4XjvAX1wCThDBh57DfjT+KjC6ESSMfk?=
 =?us-ascii?Q?NkrDS0+tJrYs7AdNMTW36BAexvjwQQxyp7mvyrCVbYIxYo7stEiO+Brp6F50?=
 =?us-ascii?Q?QiDPbUfZA3oNzj1jV6HBsOlzzsSxKsdUNyfM7VBjoqfMr9AsB3eJfjhSVLyj?=
 =?us-ascii?Q?/XCf3cLOQOAgCaz7S+4GjDccRqK140Wiy4Zu1Om7/VGuZ4ATKjsk2Z0N75S/?=
 =?us-ascii?Q?BdaitGInzSTdVZVuOiIBU4/azYK0YXknt/QCaxp3f2o7G8n7aOEun5v/eNe2?=
 =?us-ascii?Q?iyTL5I+l93WrRm0iCQuSlSJjMjxK5uGvm5IjDooG8ITcMy5qTKmywjUwudwa?=
 =?us-ascii?Q?bzI+cduV4OYder5DgGDs9eAfm6G5uBbtkqAPEfumzxwq9WMLcDvk91fR8oTt?=
 =?us-ascii?Q?PHK8Hnwbvz6MtkhlsIiQxCQClIRI+jZyBuDCDWpeddGmSUzQPTVg8bEVFCvn?=
 =?us-ascii?Q?ShF4eWW/LlVHA9RarA6bBvMlCZA985lTfr3uHXzKekQlFup6SldA9ly50V99?=
 =?us-ascii?Q?mpJ9Q6lDccJ+y+EN/2mVxVvF/39Pjc06hO7YgZUURytGlCF+BGYlpXUJlgu4?=
 =?us-ascii?Q?Td+o+oKoQi7k3Kb2kbVPf2wrJe+y8u8PljkPt4FiXIEqk9E8sShiaxQgQuTU?=
 =?us-ascii?Q?YGbsqFsLqrsPntW9WO9Eti/boACdBCdevVyfCLTfjl/XWsC90a/TWGGOQEgm?=
 =?us-ascii?Q?d6fr6Uep+0SwHIir+ep9dxS9K7atKwObC36Wc0iOCLx03+Gb3P/sT08ybjz4?=
 =?us-ascii?Q?Q7lOkzkPmku5fysx9zF3oOMyrqeUJp3OONWAPBit7KUWZY0Oz+R4Ug45TF6L?=
 =?us-ascii?Q?DrnE1LdBoi9Iak2vyANvZpDYRQ17rk2RfwOIkTN2txcx4LCgsiQL5l6yUE/P?=
 =?us-ascii?Q?wB2PfyNRbkb+4XZPDiDBCtA/8jG0ZulMlamAvsLXmhp/z2FsrQuomUiao1aW?=
 =?us-ascii?Q?tArFE2WIykCB5W+YbvFIaR832ALhkiIJldgyblYmej1a8QoB45fBv8bMp00k?=
 =?us-ascii?Q?6eIPChL5TVQAnOZRcEr5AjZFG11ajhFiUUxcOL77?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a4be3d-af50-48ed-0ed4-08dcc0ea78da
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 07:34:06.2017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vL538WpkU/UomqtGA4im+jZx6bIqsJq2OQzyOoF/9FV3jM4C+UdHp/cm+xPWSL5SrKcZ910PsncV0pomdJNUdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
X-Authority-Analysis: v=2.4 cv=SIcQV/vH c=1 sm=1 tr=0 ts=66c446f3 cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8
 a=pGLkceISAAAA:8 a=Sv4y0yS6AAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=Q-rr3z6Eip5Vteke8jUA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=I7ze7AG8jwQKfjVvUIqj:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=AjGcO6oz07-iQ99wixmX:22
X-Proofpoint-ORIG-GUID: nTHANuJwE3XmpS44hYSoo7mMpL2quwXI
X-Proofpoint-GUID: Ms6HjMkFzsJ1xnH7EYhfKEg4taXoSn22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408200054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 07:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203548

The 0001-Use-portable-implementation-for-basename-API.patch should be dropp=
ed, as it has been merged upstream, with some changes.

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of wangmy via lists.openembedded.org
Sent: Tuesday, August 20, 2024 2:51 PM
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/24] kmod: upgrade 32 -> 33

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-portable-implementation-for-basename-API.patch
avoid_parallel_tests.patch
gtkdocdir.patch
refreshed for 33

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...able-implementation-for-basename-API.patch | 50 +++++++------------
 .../kmod/kmod/avoid_parallel_tests.patch      | 10 ++--
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch |  9 ++--
 .../kmod/{kmod_32.bb =3D> kmod_33.bb}           |  2 +-
 4 files changed, 26 insertions(+), 45 deletions(-)  rename meta/recipes-ke=
rnel/kmod/{kmod_32.bb =3D> kmod_33.bb} (98%)

diff --git a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation=
-for-basename-API.patch b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-i=
mplementation-for-basename-API.patch
index 6a7f9ded4f..57330ff2a6 100644
--- a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-ba=
sename-API.patch
+++ b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for
+++ -basename-API.patch
@@ -1,4 +1,4 @@
-From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
+From 1ea666f8a2384581b5a960020acb958310cae95b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 9 Dec 2023 17:35:59 -0800
 Subject: [PATCH] Use portable implementation for basename API @@ -22,18 +2=
2,18 @@ Suggested-by: Rich Felker
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  libkmod/libkmod-config.c | 2 +-
- shared/util.c            | 4 ++--
- shared/util.h            | 7 +++++++
+ shared/util.c            | 2 +-
+ shared/util.h            | 6 ++++++
  testsuite/testsuite.c    | 2 +-
  tools/depmod.c           | 2 +-
  tools/kmod.c             | 4 ++--
- 6 files changed, 14 insertions(+), 7 deletions(-)
+ 6 files changed, 12 insertions(+), 6 deletions(-)
=20
 diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c -index e8=
3621b..8aa555a 100644
+index 919f4ed..02aca03 100644
 --- a/libkmod/libkmod-config.c
 +++ b/libkmod/libkmod-config.c
-@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *c=
tx,
+@@ -957,7 +957,7 @@ static int conf_files_insert_sorted(struct kmod_ctx=20
+*ctx,
  	bool is_single =3D false;
 =20
  	if (name =3D=3D NULL) {
@@ -43,15 +43,12 @@ index e83621b..8aa555a 100644
  	}
 =20
 diff --git a/shared/util.c b/shared/util.c -index e2bab83..0e16670 100644
+index 66a7622..c46af99 100644
 --- a/shared/util.c
 +++ b/shared/util.c
-@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[=
static PATH_MAX], size_t *
-
- char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t=
 *len)
+@@ -160,7 +160,7 @@ char *path_to_modname(const char *path, char=20
+buf[static PATH_MAX], size_t *len)
  {
--	char *modname;
-+	const char *modname;
+ 	const char *modname;
 =20
 -	modname =3D basename(path);
 +	modname =3D gnu_basename(path);
@@ -59,18 +56,10 @@ index e2bab83..0e16670 100644
  		return NULL;
 =20
 diff --git a/shared/util.h b/shared/util.h -index c4a3916..073dc5a 100644
+index 2a377dd..073dc5a 100644
 --- a/shared/util.h
 +++ b/shared/util.h
-@@ -5,6 +5,7 @@
- #include <stdbool.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <time.h>
-@@ -76,6 +77,12 @@ do {						\
+@@ -77,6 +77,12 @@ do {						\
  	__p->__v =3D (val);			\
  } while(0)
 =20
@@ -84,10 +73,10 @@ index c4a3916..073dc5a 100644
  {
  	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));  diff --git a/test=
suite/testsuite.c b/testsuite/testsuite.c -index 318343a..aafc987 100644
+index a567839..1af8702 100644
 --- a/testsuite/testsuite.c
 +++ b/testsuite/testsuite.c
-@@ -70,7 +70,7 @@ static void help(void)
+@@ -59,7 +59,7 @@ static void help(void)
 =20
  	printf("Usage:\n"
  	       "\t%s [options] <test>\n"
@@ -97,10 +86,10 @@ index 318343a..aafc987 100644
  	for (itr =3D options, itr_short =3D options_short;
  				itr->name !=3D NULL; itr++, itr_short++)  diff --git a/tools/depmod.c=
 b/tools/depmod.c -index 43fc354..cfb15b1 100644
+index 8b0a428..e8e3869 100644
 --- a/tools/depmod.c
 +++ b/tools/depmod.c
-@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***=
p_files, size_t *p_n_files
+@@ -724,7 +724,7 @@ static int cfg_files_insert_sorted(struct cfg_file=20
+***p_files, size_t *p_n_files
  	if (name !=3D NULL)
  		namelen =3D strlen(name);
  	else {
@@ -110,10 +99,10 @@ index 43fc354..cfb15b1 100644
  		dirlen -=3D namelen + 1;
  	}
 diff --git a/tools/kmod.c b/tools/kmod.c -index 55689c0..df91e5c 100644
+index d28ec7b..4e5c422 100644
 --- a/tools/kmod.c
 +++ b/tools/kmod.c
-@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
+@@ -50,7 +50,7 @@ static int kmod_help(int argc, char *argv[])
  			"Options:\n"
  			"\t-V, --version     show version\n"
  			"\t-h, --help        show this help\n\n"
@@ -122,7 +111,7 @@ index 55689c0..df91e5c 100644
 =20
  	for (i =3D 0; i < ARRAY_SIZE(kmod_cmds); i++) {
  		if (kmod_cmds[i]->help !=3D NULL) {
-@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char =
*argv[])
+@@ -138,7 +138,7 @@ static int handle_kmod_compat_commands(int argc,=20
+char *argv[])
  	const char *cmd;
  	size_t i;
 =20
@@ -131,6 +120,3 @@ index 55689c0..df91e5c 100644
 =20
  	for (i =3D 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
  		if (streq(kmod_compat_cmds[i]->name, cmd))
---
-2.43.0
-
diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/met=
a/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
index 04a8204815..f7ebe184a3 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From be6f82c54f694617c646ca1f8b5bcf93694e20ad Mon Sep 17 00:00:00 2001
+From 94aa964b875b391ad03ff79ea36c82292d53bf17 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Fri, 6 Sep 2013 21:11:57 +0000
 Subject: [PATCH] kmod: avoid parallel-tests @@ -11,16 +11,15 @@ serial-tes=
ts is now required
=20
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate (disable feature incompatible with ptest)
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac -index ee72283..60980c0 100644
+index 2f1c525..7056aae 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -14,8 +14,8 @@ AC_USE_SYSTEM_EXTENSIONS
+@@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
  AC_PREFIX_DEFAULT([/usr])
  AM_MAINTAINER_MODE([enable])
@@ -28,5 +27,4 @@ index ee72283..60980c0 100644  +AM_INIT_AUTOMAKE([check-n=
ews foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects c=
olor-tests serial-tests])
  AM_SILENT_RULES([yes])
  LT_INIT([disable-static pic-only])
-
- AS_IF([test "x$enable_static" =3D "xyes"], [AC_MSG_ERROR([--enable-static=
 is not supported by kmod])])
+=20
diff --git a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch b/meta/recipes-k=
ernel/kmod/kmod/gtkdocdir.patch
index a34ea466e8..8aa2763d9c 100644
--- a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
+++ b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
@@ -1,4 +1,4 @@
-From dd59095f70f774f6d1e767010e25b35ef6db4c4b Mon Sep 17 00:00:00 2001
+From 1d6d57c2da502dfcc4f09356306177130ceceec9 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 8 Dec 2023 22:35:45 +0000
 Subject: [PATCH] configure: set docdir in GTK_DOC_CHECK @@ -16,10 +16,10 @=
@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac -index de01e08..67696c4 100644
+index 7056aae..d53a20c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -255,7 +255,7 @@ AS_IF([test "x$enable_coverage" =3D "xyes"], [
+@@ -236,7 +236,7 @@ AS_IF([test "x$enable_coverage" =3D "xyes"], [
  AM_CONDITIONAL([ENABLE_COVERAGE], [test "x$enable_coverage" =3D "xyes"])
 =20
  m4_ifdef([GTK_DOC_CHECK], [
@@ -28,6 +28,3 @@ index de01e08..67696c4 100644
  ], [
  AM_CONDITIONAL([ENABLE_GTK_DOC], false)])
 =20
---
-2.34.1
-
diff --git a/meta/recipes-kernel/kmod/kmod_32.bb b/meta/recipes-kernel/kmod=
/kmod_33.bb
similarity index 98%
rename from meta/recipes-kernel/kmod/kmod_32.bb
rename to meta/recipes-kernel/kmod/kmod_33.bb
index 1c4e5a94db..8ee9618982 100644
--- a/meta/recipes-kernel/kmod/kmod_32.bb
+++ b/meta/recipes-kernel/kmod/kmod_33.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-altern=
atives
=20
-SRCREV =3D "41faa59711742c1476d59985011ee0f27ed91d30"
+SRCREV =3D "e193aeb99a04fb4b63ce47eb2c7f119db59446a0"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://depmod-search.conf \
--
2.34.1


