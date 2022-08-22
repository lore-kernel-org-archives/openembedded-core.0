Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1793C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 19:16:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22207.1661195761600303306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AJE6yVVa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5233a6570f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27MDtcXi012721
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:16:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=kHcrkhr0/pThBH64gnsp4OzExxKdg6K/j+13GddNMhI=;
 b=AJE6yVVaPE0iQ1X7247lmudcizo6Ek2G0cD7VKTT9lnNMqFNK3TjWYQpbkOudU0qIAji
 q9Zi5q2fCQAfWwtGIULtIUHCl2ljkfxG7ObQ4EsYI9foXvQ88KoKsoQV1jDDNYtgjrsl
 JYkiN0qn7m+hM2UcEZUcLrqdoKLhbrO++X8t1rCsKXu4mTki8fdGZaxspzNeThx4pPrW
 iziO20n6dMPFHyHwwzRyUWur52cGB4UsBJwN5LG51xyn+X+6uHkGPRK9qLjmU4HG6u0s
 qijarRPymbGUevZ46mx5GGNpfzW3mzUtUZqoGwrUuUSzbzHd264FoYw8M3tNU6VgYVzq IA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2y4jj18h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdKCVBjt//3p92/L4AWr8wlz8Dv0jvKFrMUGa6HYxH+FHJHR2cNubEFjFMsKr8XBYQrrH7sd/wT6GzNOnF90XeXIAP0Fx915wD37dci5/N9y/u5LAzrsNknTfkl2yhQOW0i3g0sck+5cgii2hE/dF//Cd3lGhR4S0A3SiNYbT5PnNmkYXPaSuA/m1Ofr5FCJp9ehP/F5dvbAnxqxubW8ne9mxmFAeRq+s0OAs2+vApJKqmNnCEpeTeWGXen0bpQJ4TSt9j8J4hAtz6hIIvDxFN34jnxA1Msf/kGogkif0WVzW2ksmfHL5GGLpj9uLK7WULSGADzK+to7Qj3AIdxG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHcrkhr0/pThBH64gnsp4OzExxKdg6K/j+13GddNMhI=;
 b=EG+GndS85OAyERDS2s1dPCPtMaq5rFxLmtjq+LTpojUUerFax2slEluD6GinslMg2boPxrpWTZMIje6yTNfWueOX9WH6Re6MyGM4fmXX+mCaxMM1WRAsRdp/Uq+ByaCKX275Kd4Qi26QmcUK8bSURlx6BpUb8fH0GR6fKkGDUYuyerp5t9/CA8EwnHVaPp0zOLjxKitVmVHtUJMCxlsyVYuKvFgnLq0ItVdZyqP+JzWVu8kmF4VyBv3wXxS78CzdUIrnQFBp8Y2vGYajZd6R2bha8epOa3WlCURLFWzROAAUpweRoNGGIYmO2hfAk1QCiasMzjspSJ0E5QNUzKm8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB2970.namprd11.prod.outlook.com (2603:10b6:5:65::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.21; Mon, 22 Aug 2022 19:15:58 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 19:15:58 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: fix CVE-2022-0216
Date: Mon, 22 Aug 2022 15:15:37 -0400
Message-Id: <20220822191537.25682-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220822191537.25682-1-sakib.sajal@windriver.com>
References: <20220822191537.25682-1-sakib.sajal@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::39) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa449d20-e424-4516-db46-08da8472bdc5
X-MS-TrafficTypeDiagnostic: DM6PR11MB2970:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ksq8Qbwawk3R2KyK5mJXhucr67BYMPHz3bPByuFliz6eNfnsKP6CPErXmkLqa0QFxcroVU+0vjS4x2lzhdHIMpBEj1EyQbCOmqNAtnPF3ACTCcAQ4oCVyW9nZK1B8oyiyPDSyoZXmRYEFNfaXmC8M8XNtYhFxY9yPb+EWNNZWX7HeCzhncmq5hIqZnLCyUZBahejchzmygNw1pn3TiO7AQgY7KE/tpxMon3iT3P9XSNcvZOJjD65etLNcENDNVBEZYxoKl1F6z7qUOtyLedTAFFaiMB3gihXih62dPPNpzB5iFGnjIH3W2lh0EReeX1KK6mr+fu8x9+Tv0VyFTecvoosp+Eu9chzYg7hP+HV1jKBp/XEu2BR4RAojD6+XriVpjlM85VpiiazL5PC4dugoAr4Pg7nnI1nGqc3plUSAGDYrV2PBjpJwYzYvsWbnF5yYYuGljObHM8kluD2QPZQSijxq2gjvqoP7Qoolmp1+IzamYX5iCFnSeHNeowtzZB0RTg4Qx7grhcaoef2EmK+cTX3C5XQ3NtlOe5TSly8YgV8nQvub0dWsVqJwBXjNOoJ5Y6r2FNeOtVKX3RvP8l72tlPZHW6235Hkvyr5VKwGw1LmSLwk3W67LT985NxsatVFHcsye8OmJTInsO6z83vAB7pYj2+EGTkr4AS4BRlPKM08FKsRmRhcWOzXfLX4Z4KcqiJHTVbljPxTtFaebF01bhUSs+79Fon0h6raHKDm11Q2IFnQvbyAQWldhgvF/InpuwbncKwZI2BvIQMMLfjD85cA1pXcXfYRInc6inLpYlfKbqNV0xh1zOhimWH1/VQLclkXEcYYay7dSccT9WY7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(2906002)(52116002)(6506007)(86362001)(6512007)(26005)(6486002)(966005)(41300700001)(44832011)(478600001)(6666004)(5660300002)(8936002)(186003)(1076003)(83380400001)(38350700002)(2616005)(38100700002)(66946007)(316002)(6916009)(66556008)(8676002)(66476007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2s5X1DdDxyjfZVcuhi8+VUuAkQNxonEvBCbebg8o4jwGyD3IzgnjtMtACQOh?=
 =?us-ascii?Q?u5vy9GjwKbED9guIc3KwxDnSFOvsFeMuT0XR+FOtGNB9VlljdG105jITG+0D?=
 =?us-ascii?Q?FlVX+AgITf+FrZfn2PN9VWV7Ec8xOLRawowy6xKMHT5RAH0WyM6GqLCSdWqW?=
 =?us-ascii?Q?0IWmmKqwnJXp+wKmGMkmAPKa/p8S29/JYJ0AYh7uxmDRIlwoJBr4sJxsTZvd?=
 =?us-ascii?Q?aF6iXrCxP4+n4Ka74yIVoCYpoQFEp+LnRkTW5OWnHpvr42Rjs/iKx0XxJNJP?=
 =?us-ascii?Q?qigOhkUuviX+dYmUfkn3XkByeveWmItZJuLBK+d3BcT3kx2AdMCTpIqV85QQ?=
 =?us-ascii?Q?V9fCOFhFwCNWMWkpNW8bT2RS5S37BB9rcxsYyu99fyaPXjDa8PMrWwSdFOlN?=
 =?us-ascii?Q?LNPcINBJ/NofaAnZnWkq0MiE50ycXnJho1FaAbltVtg6vmkBVZNC7trEj/hq?=
 =?us-ascii?Q?TXe/M69nu2ZBjvBYjB9sRqmkFh+8ATA9JXV3zPS/rveQFXlO+ftM1eDF1EiL?=
 =?us-ascii?Q?vkEyGmwWs3BTAECw/B6ZChBBJxLiYVp1wdXA1ylqYiZnwwE17xQ+FX4Nnhi0?=
 =?us-ascii?Q?uLc8UHA7MtWH/Y7qqFmU/tJTySCks8/5aB5rA32w+OlVMF2Q6U/M/5FpGU0g?=
 =?us-ascii?Q?2czj1wd3lGXWo8LJCzTIMwVLaMMhOsZyBpEVYKWkaifjk3d6z7Vx7se3vFxK?=
 =?us-ascii?Q?KI0i6VLCacBnNebWF7RC5u6wFrSaoNRrsWQ86eXRYnvtJxw7XEi+mhyTkRUl?=
 =?us-ascii?Q?XANmSyJt9N4e9iDEMiVisT5+XacThpLv2FDQhIZkmnpLIXEAWx4MmBeBdJZI?=
 =?us-ascii?Q?ln80qN0kq0MH1fx2Eqr6C+5vPFs9Fsezs8/Xwr+9TZtoXCKtJdc+TrMaVN2D?=
 =?us-ascii?Q?LTO+QAPV0ZA7L92/1j0hWKSAsaI9cXf82dkdaE/Jfzz03ighP0mWW3O4bxxd?=
 =?us-ascii?Q?5k1Ke6WCWEM+RPIFH1Tcv9yXLkKHzA77Lg5zArsfX70NbAFELpSdJFHz6tJR?=
 =?us-ascii?Q?cUqzUQns/I/hOwWVVfdcMxPjXjqMv3oQfSMGGRkU125V0Ukx8nudrVrZgf7m?=
 =?us-ascii?Q?ZAR0dTeItZ5k2xCCP0iLXhpKkt1m/HSRgbyZ989Jt9T7eaSeGUdFWsTJFfYK?=
 =?us-ascii?Q?gk2DznffrRbei8z5LWR3r3I99DaocbJoIfAiDaMVKZqeGs4m9+pa4iBqlo4x?=
 =?us-ascii?Q?0YkHGAhJOIeuNTqK91rkojNtZ8k09tCD12ZQJUVjsWv6nnaTeax8g7fW0KRg?=
 =?us-ascii?Q?D9nUqjbsPn408UF4XOoS/dZSYYG456pf3BSw2GOUB0ROaccA+TPhvj/fw8ai?=
 =?us-ascii?Q?J8MhFRF0Fmevloo/WyK5khEKsMmSiX6vp5iI18degwzUDdd+ArEaYcjofz4X?=
 =?us-ascii?Q?u1kDZ43ZX5Q7jyDHBna207eUWfkBGT0FdOqIT1qq8iMaP0nCqZqsdoQvFtFU?=
 =?us-ascii?Q?d5oJ7Ef5GZqOaWWfWluU7lCGkb1xzFZYu1IHPoHi3M34e2dPHdwZV2KgfzkB?=
 =?us-ascii?Q?enFI9LkG2vtVrDEefLXsT+6oCrJy+TvDyLFpWZQ41Qhpscgw5egh8C76GlI0?=
 =?us-ascii?Q?7ozP1Arg011GU4QU5d1SyIIeSd6x480fCbuivbxzAox9H8YD62iCNUwwxdKy?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa449d20-e424-4516-db46-08da8472bdc5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 19:15:57.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gxHPSV4ET70FbNztPeRjy+uJU39TrstBIdDeQ4lbg5mFaUQt3Tu931ph3kUWbupheeW2mh5LnnoC3l9Rtdud3YWK4GgGdJ3yM1pCnOUPWLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2970
X-Proofpoint-ORIG-GUID: 35-5uP66159PtUxV1R2W6kDPTJ-987wF
X-Proofpoint-GUID: 35-5uP66159PtUxV1R2W6kDPTJ-987wF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_12,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=912 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 19:16:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169680

Backport required patches to fix CVE-2022-0216.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2022-0216_1.patch           |  42 +++++
 .../qemu/qemu/CVE-2022-0216_2.patch           | 146 ++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9fdb8c6428..56fc7aaf55 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-35414.patch \
            file://CVE-2021-3507_1.patch \
            file://CVE-2021-3507_2.patch \
+           file://CVE-2022-0216_1.patch \
+           file://CVE-2022-0216_2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
new file mode 100644
index 0000000000..56fc34ce5a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
@@ -0,0 +1,42 @@
+From f37ac8619a39498edd225c4a0b3039b28814833d Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Tue, 5 Jul 2022 22:05:43 +0200
+Subject: [PATCH 1/2] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
+ (CVE-2022-0216)
+
+Set current_req->req to NULL to prevent reusing a free'd buffer in case of
+repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.
+
+Fixes: CVE-2022-0216
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20220705200543.2366809-1-mcascell@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [6c8fa961da5e60f574bb52fd3ad44b1e9e8ad4b8]
+CVE: CVE-2022-0216
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/lsi53c895a.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index c8773f73f..99ea42d49 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
+         case 0x0d:
+             /* The ABORT TAG message clears the current I/O process only. */
+             trace_lsi_do_msgout_abort(current_tag);
+-            if (current_req) {
++            if (current_req && current_req->req) {
+                 scsi_req_cancel(current_req->req);
++                current_req->req = NULL;
+             }
+             lsi_disconnect(s);
+             break;
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
new file mode 100644
index 0000000000..f332154b6a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
@@ -0,0 +1,146 @@
+From 5451bf6db85ce3da1238e9154d051ebccec8f171 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Mon, 11 Jul 2022 14:33:16 +0200
+Subject: [PATCH 2/2] scsi/lsi53c895a: really fix use-after-free in
+ lsi_do_msgout (CVE-2022-0216)
+
+Set current_req to NULL, not current_req->req, to prevent reusing a free'd
+buffer in case of repeated SCSI cancel requests.  Also apply the fix to
+CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
+the request.
+
+Thanks to Alexander Bulekov for providing a reproducer.
+
+Fixes: CVE-2022-0216
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [4367a20cc442c56b05611b4224de9a61908f9eac]
+CVE: CVE-2022-0216
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/lsi53c895a.c               |  3 +-
+ tests/qtest/fuzz-lsi53c895a-test.c | 76 ++++++++++++++++++++++++++++++
+ 2 files changed, 78 insertions(+), 1 deletion(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 99ea42d49..ad5f5e5f3 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
+             trace_lsi_do_msgout_abort(current_tag);
+             if (current_req && current_req->req) {
+                 scsi_req_cancel(current_req->req);
+-                current_req->req = NULL;
++                current_req = NULL;
+             }
+             lsi_disconnect(s);
+             break;
+@@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
+             /* clear the current I/O process */
+             if (s->current) {
+                 scsi_req_cancel(s->current->req);
++                current_req = NULL;
+             }
+ 
+             /* As the current implemented devices scsi_disk and scsi_generic
+diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
+index ba5d46897..c1af0ab1c 100644
+--- a/tests/qtest/fuzz-lsi53c895a-test.c
++++ b/tests/qtest/fuzz-lsi53c895a-test.c
+@@ -8,6 +8,79 @@
+ #include "qemu/osdep.h"
+ #include "libqos/libqtest.h"
+ 
++/*
++ * This used to trigger a UAF in lsi_do_msgout()
++ * https://gitlab.com/qemu-project/qemu/-/issues/972
++ */
++static void test_lsi_do_msgout_cancel_req(void)
++{
++    QTestState *s;
++
++    if (sizeof(void *) == 4) {
++        g_test_skip("memory size too big for 32-bit build");
++        return;
++    }
++
++    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
++                   "-device lsi53c895a,id=scsi "
++                   "-device scsi-hd,drive=disk0 "
++                   "-drive file=null-co://,id=disk0,if=none,format=raw");
++
++    qtest_outl(s, 0xcf8, 0x80000810);
++    qtest_outl(s, 0xcf8, 0xc000);
++    qtest_outl(s, 0xcf8, 0x80000810);
++    qtest_outw(s, 0xcfc, 0x7);
++    qtest_outl(s, 0xcf8, 0x80000810);
++    qtest_outl(s, 0xcfc, 0xc000);
++    qtest_outl(s, 0xcf8, 0x80000804);
++    qtest_outw(s, 0xcfc, 0x05);
++    qtest_writeb(s, 0x69736c10, 0x08);
++    qtest_writeb(s, 0x69736c13, 0x58);
++    qtest_writeb(s, 0x69736c1a, 0x01);
++    qtest_writeb(s, 0x69736c1b, 0x06);
++    qtest_writeb(s, 0x69736c22, 0x01);
++    qtest_writeb(s, 0x69736c23, 0x07);
++    qtest_writeb(s, 0x69736c2b, 0x02);
++    qtest_writeb(s, 0x69736c48, 0x08);
++    qtest_writeb(s, 0x69736c4b, 0x58);
++    qtest_writeb(s, 0x69736c52, 0x04);
++    qtest_writeb(s, 0x69736c53, 0x06);
++    qtest_writeb(s, 0x69736c5b, 0x02);
++    qtest_outl(s, 0xc02d, 0x697300);
++    qtest_writeb(s, 0x5a554662, 0x01);
++    qtest_writeb(s, 0x5a554663, 0x07);
++    qtest_writeb(s, 0x5a55466a, 0x10);
++    qtest_writeb(s, 0x5a55466b, 0x22);
++    qtest_writeb(s, 0x5a55466c, 0x5a);
++    qtest_writeb(s, 0x5a55466d, 0x5a);
++    qtest_writeb(s, 0x5a55466e, 0x34);
++    qtest_writeb(s, 0x5a55466f, 0x5a);
++    qtest_writeb(s, 0x5a345a5a, 0x77);
++    qtest_writeb(s, 0x5a345a5b, 0x55);
++    qtest_writeb(s, 0x5a345a5c, 0x51);
++    qtest_writeb(s, 0x5a345a5d, 0x27);
++    qtest_writeb(s, 0x27515577, 0x41);
++    qtest_outl(s, 0xc02d, 0x5a5500);
++    qtest_writeb(s, 0x364001d0, 0x08);
++    qtest_writeb(s, 0x364001d3, 0x58);
++    qtest_writeb(s, 0x364001da, 0x01);
++    qtest_writeb(s, 0x364001db, 0x26);
++    qtest_writeb(s, 0x364001dc, 0x0d);
++    qtest_writeb(s, 0x364001dd, 0xae);
++    qtest_writeb(s, 0x364001de, 0x41);
++    qtest_writeb(s, 0x364001df, 0x5a);
++    qtest_writeb(s, 0x5a41ae0d, 0xf8);
++    qtest_writeb(s, 0x5a41ae0e, 0x36);
++    qtest_writeb(s, 0x5a41ae0f, 0xd7);
++    qtest_writeb(s, 0x5a41ae10, 0x36);
++    qtest_writeb(s, 0x36d736f8, 0x0c);
++    qtest_writeb(s, 0x36d736f9, 0x80);
++    qtest_writeb(s, 0x36d736fa, 0x0d);
++    qtest_outl(s, 0xc02d, 0x364000);
++
++    qtest_quit(s);
++}
++
+ /*
+  * This used to trigger the assert in lsi_do_dma()
+  * https://bugs.launchpad.net/qemu/+bug/697510
+@@ -48,5 +121,8 @@ int main(int argc, char **argv)
+                        test_lsi_do_dma_empty_queue);
+     }
+ 
++    qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
++                   test_lsi_do_msgout_cancel_req);
++
+     return g_test_run();
+ }
+-- 
+2.33.0
+
-- 
2.33.0


