Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2542C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 19:16:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.22383.1661195761058198803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=evT+pcFB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5233a6570f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27MDtcXh012721
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:16:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=ZSVFaiPweuV4zN6ors5ekNIMvlOwkiLTSi37WmXR5jQ=;
 b=evT+pcFBHi/YF+/SuyfkUBbZFzXJzD4Q4N37DjUqOqlzg6J9Sxbwrzo1fUwpB5pHSYkG
 oRODdKmYG3d4LrRpnKcoVlDlGEOeQGvGmaqOjWen4gKqTzhFfY0+CnjA56bRq+7tQnJK
 NSVFCUVJrvxP2Y8Zhov1vRRVlRFl/y21ulPfYARD6EDIv5a8AhVJo//LgVrU9rBnzWXN
 d83slAhXrkIBBRc0oxRZUDWgpgKNCaecWmkKol4tv1Zcd1q2FSYvMRc31uAnHhc+46kK
 eDSqFaZ6bhjkURPvgCNzJNo4zVBQgl3oT9xdR7eKPXPZNMEj5xmH22vtKJV2vSzrqqhJ Zg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2y4jj18h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkPc9leR/GCkbUEKRfYHNs6DdQCidXZLIBHdRuOPU2EJ0h4KgrcvOPs3VUEx7CVI0Fkk4Lm/QJya2kg9bRx4s9cc2pb/TV1xWjnk4lgXVaWsYYT1OKxZvC2eaNEhfiJoaYFABIafm8hkmm/p4VOosRSiCDZ3NBnDkYAxKTdFZtJHj4dO64IuAq1MP8fLcEX4Csbe97Gua5mYXphptmjwKA1BALpyK+xeAhQG89OkWA0u3TxQ/7y9wVxdtzdmsZ6pk5HJrNCeSc3qvcIxR6dxrw8Jx/MXMNhiEmtnUeISvcsOUC5kX2COjVXe0IgFaT3YPkHymIQsM8gpfDbfnG9HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSVFaiPweuV4zN6ors5ekNIMvlOwkiLTSi37WmXR5jQ=;
 b=EGd1cxdh6OVUfM5K0Y0oP4+zeuXePPPrfLDGrD+xYBPl9q8mXqHArKvFI6UbA6dDreOr18K2BmYgQi8THj//3HqVwbzwR47B/W1UR+Vecj8wT3b5HiW2sWNqaJ7endmWjgZXYGwvLbQ6FkMlTLFeMBnBeUwiHkitcQxuOCjLp0+4c8NcAZki5yKGQGsidc/8WROLhvJrmNooH9kZQaS21gH0nUzD5HlHN/Ko7o9iEdkU9Hp2wVln2+Nz8YpEftN4QTwZattKZeqhl4F9vIkUsnLO62tkvIQ837Pwm1o0hIMwW4AVi47AMB/9XAvHoBK/MJV9PFtHKy4wok36U6ZRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB2970.namprd11.prod.outlook.com (2603:10b6:5:65::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.21; Mon, 22 Aug 2022 19:15:56 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 19:15:56 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: fix CVE-2021-3507
Date: Mon, 22 Aug 2022 15:15:36 -0400
Message-Id: <20220822191537.25682-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: YQBPR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::39) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc70420c-101a-4aed-a5da-08da8472bd6d
X-MS-TrafficTypeDiagnostic: DM6PR11MB2970:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B0RascKmNv1vQzoh/vhBtE1SYkEzhkzkmo40cDy+RO3ghrqyFzn3uccmzcXb/YLsKgH8n07dhCy75fhQ1tp2xMjg3PZ8jn99GZCQNr+sWbpqPj9pIeKaAinGHnpvs6rSmBE4dSJ5Os3YHHO7Qea4A/sZ+EZvYPy/fczocjYYF+/Sv089sYg9ZxomMJgA8KQPoj+oXrNPAtILSS58mshlCXboVijig8WDeddy5QPdgmTpjR1azrMnOgxc3XRiVPsTP7WX62yeDrJSJT+gT9dzJLrGxQ4me7hP2PAo0kZqT2PMnfky2+0LVviqCHDZUCe53SHfc+y0MjI21+/LkGEkwey0gH6HXCJdXuv2XUTxFFzHpXjIbe8LOQ8ZVxGUU3BluNk70sl4Nz2iq3fvSfit/gEZSQQadnbal8DWRnah4UOJCh/j0gML0zwiCc43QlxvNvmbeFeiwlNczsiogdT88YyBt6kcZrvZvMVJn1MXlbfp4bfP8OCeHI8aqXSDeOlVEU1hOx8LBNF9EneZqUQdsltgYsatqoy6swU6iw8LaLsO20NvPGeri1A6Nl7HfQlF1Y4EfcadZSnoXQ0w6dDp3e7xl+bNDEJlByF44hTeZYxP11ALvYSg1OO3uAouyVCEr85UvlalOFXqHByU2cdsKEzGTdOofL1kORBVjgUoldysti7aJYaQdNRNMKrnaRmwTbCd1y4TWgfpgeSyjbtujcWKwN0/jnj1gaB9NhyJU/v4uy8yoOHUQ2FeIU5HsrNdfe2hveu7RzKWlPOa3vdK/whIA+0+x9HqSpA8efDB4UXdVS8mKplUpLiqfhqG2kjVZAlxGywnvAux9hWkQ7pZcs4WTwxWGgo3Ypuy0a37TGw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(2906002)(52116002)(6506007)(86362001)(6512007)(26005)(6486002)(966005)(41300700001)(44832011)(478600001)(6666004)(5660300002)(8936002)(186003)(1076003)(83380400001)(38350700002)(2616005)(38100700002)(66946007)(316002)(6916009)(66556008)(8676002)(66476007)(36756003)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzArOVRlekZ0bDJ3QmdUMUpUbGpmK2pub3d0MmRQWm5RTElZM3oyK0JLOXFm?=
 =?utf-8?B?TjVVVGg4UmUrNmxIWkxJMnpxdTN5OXdRblRXSmFDa0E0Qy9tenB3MUIwdVFM?=
 =?utf-8?B?aEtkbVNRSDZQNW1jU3pwWW9IaXdMUisxY2FoNkpwYnlaY3ljWDFFLzZZK1hs?=
 =?utf-8?B?N3puZzMwZDVLRVo1MlRjRERwbi9BM0t5cEZ6STByNUxIclN4VnNHNm0rYk9V?=
 =?utf-8?B?QVV2L3FBcnBhd0kzNmtEZVR4dHN3MjdleFVOMTVyRUdmaytnbVQ4S016RzE1?=
 =?utf-8?B?U01UbEw0NWJDa1NZYjVVdmVKNEIyMk9JS2pkMHR4eWVnQng3cnRWbGRIekN6?=
 =?utf-8?B?eFE0cm8vTk9WcXp3SksxbjRvWjhQNEExd0hLZzQrS3RrbHpDeURCTXhQaHNV?=
 =?utf-8?B?Zmk1d2tOYlBFaEtudjZzb2pVYXlqUGZjUmRDMTR6cGhKV1E0SksveHpldTM2?=
 =?utf-8?B?NjFQK2ZTMHRGTVdoNm9HejlYM3hNb0ZhQWlROUo3Y1hnTVNoU0V4R0hlM1Jv?=
 =?utf-8?B?Q1FtYjgzOWJ5TVZmY0FUOVBQRDlSemRuTmU0Qi8yeUdrTHh3T25qaTNPL1k5?=
 =?utf-8?B?VVVIZ0g4dWRkQUJZNW5GN0M1aXRGVkhSWS9MRUYxanZQaFppenplcFJwWTN6?=
 =?utf-8?B?a2Z5dzlMcFI5QTlRNnNmQkZOYVZIR0VDNVpaVDE3SVVkdFBJZ0IwTHQ5bzM3?=
 =?utf-8?B?d3NKWFZ3VmtNdVNtVDR2dURZbGtUQ2xpcTlTVnpHZEZScWhieTl2WWxCdmdU?=
 =?utf-8?B?Rlo5TGo5b1pHL3pDZEhjZitXTHpIUVdocS9WV1pkeXM4T056aHJ5bndYM1Bx?=
 =?utf-8?B?SjlRc1F2MlNRY1pzTDJzT1E4MnJBRS9OQ1YzN01XQ2NLUFNYY1doalEva29n?=
 =?utf-8?B?eDhpRzVMSGd0TkZZekxXZFJTUXhKTXVDZjNaZmRRR0xqU0cxRjNJak5XT0Zs?=
 =?utf-8?B?enNINVpidHRINVIyWWxraVJRZXdqVEUrWHZ0dCtSMWw4WDJqZGkrMlFEVUZL?=
 =?utf-8?B?dWphMThqbGxTdGlpbE1WQlBQOXlZQ0RlY0x0R1Y5Y3l2OWtEQlpCVHFobTZM?=
 =?utf-8?B?c25TNlFJSVorSjlndTN5L2hCdlB3SG83aGh3V0ZuN3RkdjMraGF4OFh1UEJt?=
 =?utf-8?B?K3lBcS9ZU3UvbTNPZktaMFN3czRBa2Uvc0dCTmZuU0tBeTdWSEdlaWI3Umtn?=
 =?utf-8?B?c0k2SFg1NGZxM2tyeWhiaE56UkUxdjNMRmdLczdRSDFlZzdNOUp3c1c1YjRM?=
 =?utf-8?B?U2lYRS85b2VpMnIxUy95MUNwUDl2ZXVIZkdhUElpM3BlT2cwUFd5ZzJkTTJn?=
 =?utf-8?B?SE5nUEVlT2ZqRjcxNnZPZ0U2N2syWUJtVVpGa3lDR09ZQklpRmZCZXhGUkMw?=
 =?utf-8?B?eVZJbk0xWG43Y1o2U3dsdGI1U0lLNjBPRWczUER6V3daYk1ZU3gxSmRtS0M1?=
 =?utf-8?B?SWU2cm9ka0FiUVRUaUZVcitBQ3MyVzRvR2pVV2tpcVg2ajdFSy9zNE9MOWpk?=
 =?utf-8?B?U2hTbUpGNDZkUlVyL1B6dmh4VU1McGVmUm1NZmMrakJtVXZKSVhFUExBS2tw?=
 =?utf-8?B?TnZuZkVjS2QwcGVhditMKzA3S2U0YnVwYnRCbzRpMyt4amFaVDRWWDBYbVU1?=
 =?utf-8?B?bjQwbWVLZ2hZR0pHd2JxYWM4alFPQ242YkcwVGtYRUhKOFBNWFRidFBUQ082?=
 =?utf-8?B?aTM4WWkyQXJnVVo0YUpQbWRIcVB1MmIxVWx4VnhtRkRFY013VzZiYm95RzRC?=
 =?utf-8?B?Um1vQmhuUS8xRVNlQlpFbFhDRDlhQUhvZnRkeFByQ2UrRXJHK29YMGdLZEl3?=
 =?utf-8?B?akphV2xieHZrUEZETGFoc2U4OXNwSG44WWpNdzhjVHV6WFZIZkhmeWp5d3Fu?=
 =?utf-8?B?Q01PUGFwNnl5NnJjbXJlTVlNSktqSzRBY0ZVVUgvNGN3QlhMR0ZWVm16V3Ra?=
 =?utf-8?B?bWoxVHR3TEJqK3JPa3N4SXZzZHJGbkI0d0VmMTBmRWFNVDNkeUt0RXY1K1py?=
 =?utf-8?B?SStUSUd2T2kwY01WQ2VuaFBCLzlCL1piNDI3UFpYM1lydXl0MmFuOWVmMXg0?=
 =?utf-8?B?MnRWNzM3ZWplcVhhOXRGNWNic2l5em9JNjhqSlRxRDExNlRjaHVHUTNXeElj?=
 =?utf-8?B?M0ZWZE45OVlWMGh3UWdIQWRmVC9jOGhDem5JRk8yRGNTd09Ha2dkT3ZDSWhB?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc70420c-101a-4aed-a5da-08da8472bd6d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 19:15:56.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0WiOAJNcr5X5+soT8aI1Q/SNBLzQY8D8pre6jg2n0KVeerwElbkSZGrRtBuzPNdI2HB6JNTjz97bjfyPVs1Ix4VoXkFvCHT9TvSSAbWY5+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2970
X-Proofpoint-ORIG-GUID: kot5m87h7kaTkni0nxk4Q1iyDQsuJ0pm
X-Proofpoint-GUID: kot5m87h7kaTkni0nxk4Q1iyDQsuJ0pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_12,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=861 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220079
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27MDtcXh012721
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 19:16:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169679

Backport required patches to fix CVE-2021-3507.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-3507_1.patch           |  92 ++++++++++++++
 .../qemu/qemu/CVE-2021-3507_2.patch           | 115 ++++++++++++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index bcaa56bbba..9fdb8c6428 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-gues=
t-d.patch \
            file://qemu-7.0.0-glibc-2.36.patch \
            file://CVE-2022-35414.patch \
+           file://CVE-2021-3507_1.patch \
+           file://CVE-2021-3507_2.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
new file mode 100644
index 0000000000..24fd2c5ed3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
@@ -0,0 +1,92 @@
+From 57a89cc36ead7234e540d0ecbe1a792ab6b04cb7 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Thu, 18 Nov 2021 12:57:32 +0100
+Subject: [PATCH 1/2] hw/block/fdc: Prevent end-of-track overrun
+ (CVE-2021-3507)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Per the 82078 datasheet, if the end-of-track (EOT byte in
+the FIFO) is more than the number of sectors per side, the
+command is terminated unsuccessfully:
+
+* 5.2.5 DATA TRANSFER TERMINATION
+
+  The 82078 supports terminal count explicitly through
+  the TC pin and implicitly through the underrun/over-
+  run and end-of-track (EOT) functions. For full sector
+  transfers, the EOT parameter can define the last
+  sector to be transferred in a single or multisector
+  transfer. If the last sector to be transferred is a par-
+  tial sector, the host can stop transferring the data in
+  mid-sector, and the 82078 will continue to complete
+  the sector as if a hardware TC was received. The
+  only difference between these implicit functions and
+  TC is that they return "abnormal termination" result
+  status. Such status indications can be ignored if they
+  were expected.
+
+* 6.1.3 READ TRACK
+
+  This command terminates when the EOT specified
+  number of sectors have been read. If the 82078
+  does not find an I D Address Mark on the diskette
+  after the second=C2=B7 occurrence of a pulse on the
+  INDX# pin, then it sets the IC code in Status Regis-
+  ter 0 to "01" (Abnormal termination), sets the MA bit
+  in Status Register 1 to "1", and terminates the com-
+  mand.
+
+* 6.1.6 VERIFY
+
+  Refer to Table 6-6 and Table 6-7 for information
+  concerning the values of MT and EC versus SC and
+  EOT value.
+
+* Table 6=C2=B76. Result Phase Table
+
+* Table 6-7. Verify Command Result Phase Table
+
+Fix by aborting the transfer when EOT > # Sectors Per Side.
+
+Cc: qemu-stable@nongnu.org
+Cc: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
+Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-Id: <20211118115733.4038610-2-philmd@redhat.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport [defac5e2fbddf8423a354ff0454283a2115e1367]
+CVE: CVE-2021-3507
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/block/fdc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 347875a0c..57bb35579 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1530,6 +1530,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl,=
 int direction)
+         int tmp;
+         fdctrl->data_len =3D 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl->=
fifo[5]);
+         tmp =3D (fdctrl->fifo[6] - ks + 1);
++        if (tmp < 0) {
++            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
++            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x0=
0);
++            fdctrl->fifo[3] =3D kt;
++            fdctrl->fifo[4] =3D kh;
++            fdctrl->fifo[5] =3D ks;
++            return;
++        }
+         if (fdctrl->fifo[0] & 0x80)
+             tmp +=3D fdctrl->fifo[6];
+         fdctrl->data_len *=3D tmp;
+--=20
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
new file mode 100644
index 0000000000..acc93e897b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
@@ -0,0 +1,115 @@
+From 3e8601ec707dcbc3c768f7733d016dc70c947e4a Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Thu, 18 Nov 2021 12:57:33 +0100
+Subject: [PATCH 2/2] tests/qtest/fdc-test: Add a regression test for
+ CVE-2021-3507
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/33=
9
+
+Without the previous commit, when running 'make check-qtest-i386'
+with QEMU configured with '--enable-sanitizers' we get:
+
+  =3D=3D4028352=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on ad=
dress 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb419=
8bc0
+  READ of size 786432 at 0x619000062a00 thread T0
+      #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
+      #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:278=
7:13
+      #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
+      #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:18
+      #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
+      #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:2933=
:5
+      #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-co=
mmon.h:82:5
+      #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
+      #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:1=
3
+      #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
+      #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
+      #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
+      #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17
+
+  0x619000062a00 is located 0 bytes to the right of 512-byte region [0x6=
19000062800,0x619000062a00)
+  allocated by thread T0 here:
+      #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
+      #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
+      #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
+      #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
+      #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
+      #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13
+
+  SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1e=
65919) in __asan_memcpy
+  Shadow bytes around the buggy address:
+    0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+  =3D>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
+  Shadow byte legend (one shadow byte represents 8 application bytes):
+    Addressable:           00
+    Heap left redzone:       fa
+    Freed heap region:       fd
+  =3D=3D4028352=3D=3DABORTING
+
+[ kwolf: Added snapshot=3Don to prevent write file lock failure ]
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport [46609b90d9e3a6304def11038a76b58ff43f77bc]
+CVE: CVE-2021-3507
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
+index b0d40012e..1d4f85212 100644
+--- a/tests/qtest/fdc-test.c
++++ b/tests/qtest/fdc-test.c
+@@ -583,6 +583,26 @@ static void test_cve_2021_20196(void)
+     qtest_quit(s);
+ }
+=20
++static void test_cve_2021_3507(void)
++{
++    QTestState *s;
++
++    s =3D qtest_initf("-nographic -m 32M -nodefaults "
++                    "-drive file=3D%s,format=3Draw,if=3Dfloppy,snapshot=
=3Don",
++                    test_image);
++    qtest_outl(s, 0x9, 0x0a0206);
++    qtest_outw(s, 0x3f4, 0x1600);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0200);
++    qtest_outw(s, 0x3f4, 0x0200);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_quit(s);
++}
++
+ int main(int argc, char **argv)
+ {
+     int fd;
+@@ -614,6 +634,7 @@ int main(int argc, char **argv)
+     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
+     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
+     qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
++    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
+=20
+     ret =3D g_test_run();
+=20
+--=20
+2.33.0
+
--=20
2.33.0


