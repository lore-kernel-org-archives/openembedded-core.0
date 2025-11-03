Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F166CCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15256.1762154834368359678
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=UU1PU1ae;
 spf=pass (domain: navimatix.de, ip: 40.107.162.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=momU8eKrd+5DMVIpO7LkxAfpemwNvuMC8Eic9iozFdoJ8IZlzLJPicXdp4P9iX4vQFpk1/FD7xAPs7ZDLOvEDdE+j1RF8Ta3dcuanPHDFVNbOORxGdEKy2U22rRYr8Fy0SwBJSI6w8L0r0UdXT1OXzgy5WwxGfOyCWSuT+RF6ZZx6UrOQbWrJ6lu7zLAbEoWAHKq+E0wXOfl6sGeAgbdDcvXKDb6zZkojmyKJURsHA5k3NTQmGoJLw9d45qd2dXtVxv+mfEuh88zhg+2urJ1ViLM+8OWPZ1DJa/Ar6KJuFcZruz+TNG4LEnCsLvEXd4+EIaUIiN8zcZRrJV3ZTcLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+hrtAI9Xp82eLxo/nTDbTC19Oehq8djBQWFG8XYXEc=;
 b=ejMtHW0wfOPjeVfCRhgwxVfQiNO+SrYyL58QcYeYGynEHI6i+OidIm9G2oX2pQTVUrg3SK3asnEUUJ6bBCE3ah5vDPDjOs/Jwyt7EyLKRiDtSG1EUkrnHaOiveXhuzqtvfgrco3uiM61QnG0rWcwmxuGsRaPuW5leTUVhgp0x6mmX6zFxKuRDaCn/H/kc+HROr4VllbLiZdUxDnI68jgvnCB//2NM4HxSbI2qtmWOv8LMRX9E6jgnXlhx872x1K0L4/q2mZSLcvmJhaWa1WkOKw5XatWcKIzQDyaCMDAY9Xy604vroew2h0tHkAk4UXVnoGxrIY6j9cIEllcSsdnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+hrtAI9Xp82eLxo/nTDbTC19Oehq8djBQWFG8XYXEc=;
 b=UU1PU1aeLUTfyOzeM6vK6s80sEtnEINxaAN3fQCbdfw7ltpuiEs0CuvJE66QlCFU6SipTq1/q2VOb8CobIIQJqrGZp7RGoyNAWKQR7HetxgAxNUC/X/3ch57YclM4/b5Rho058V2+cc+Jqq3rofnsFHTALvayNFsV6W0AkrmbRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:13 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:13 +0000
Date: Mon, 3 Nov 2025 08:27:12 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 12/18] glib-2.0: Upgrade 2.86.0 -> 2.86.1
Message-ID: <42a078860d319a90ff0a346546a70dd972c28613.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 25df2b91-44ab-4879-13b8-08de1aaa687c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?52vGG6CGiLeZlyVB186mFlGDlxNv2Eb/s1CE3sCK7DKOM1ptU6aZN1RER+nu?=
 =?us-ascii?Q?9FDKpYXiC4qN6CTIBzxLa3cXqUDIUvAXBqPln3puSylHr7cWRfMK9AOI7kU2?=
 =?us-ascii?Q?o4D8sPndOBUjBwE9Yk1x86nJIEGyWCVlmnaV+7F67rSojqOY+ykHiUSS9NWB?=
 =?us-ascii?Q?gyIZgIVOMAqQOVyZIvfjQcTxtRzVO/Vr4z2AwD0U+vz1j40G9BcdynlItgrJ?=
 =?us-ascii?Q?4/H1DS03+LRARIPnqKXRd58dfYOm44JBHQqKMthH4U2mZO6uqKA+y8egVU6n?=
 =?us-ascii?Q?vQ7U77X8rtVzzuVbQ9xa5r5EHH8/jxgPEpYNWDEcrV3hAJODCQGxCPM0hYQ5?=
 =?us-ascii?Q?I56bW3fzjqODIgBnccziHmBGrLRyGCN+X6DXRIE9qLnw3p3zb1k6v4cpC67E?=
 =?us-ascii?Q?WktyJS/1zEmNAaRZp3ZB0GA9ECF6/NplBXWT3sOQHB2kYRsgABFbX8V+c6c4?=
 =?us-ascii?Q?BpdePSmlRJTIY82wYonYTpZjxtHHWOqQudLMUowCSmlB/Hbgw17CnyZvnM4L?=
 =?us-ascii?Q?kRkMSXrHlBWG4VELx3tZ/QCVCfNe/Pm7GEkGZChckRplQ1nlainrZOr0rRw+?=
 =?us-ascii?Q?+9oKMMZ1Am9MWEuwf3sCRhT0S422FJWkaLrv/KeHTu/K7iQBg51EU/xCays1?=
 =?us-ascii?Q?kb+Ej7PdhF4x++Zhlmunqx5B4p+v187D3n473ADm0rr7XfbxF6ZQRhbZFuu4?=
 =?us-ascii?Q?B1U1L9EjBARb+FnWRVQ4UKDqFmeAz5f8EIizUub/3XeVUeLCZmZmaUrMB1na?=
 =?us-ascii?Q?E9W9cLOmqV9zylL7TTwF0g70lHi3uGPWlc6ibXsZocRWK97y2smh3FCf0ciM?=
 =?us-ascii?Q?Vnm5JE0KxyEXHfncnKzUXLza1HH7k/hrDUOFtcHGrSmq4vrz3nH2yTcPQ6Wm?=
 =?us-ascii?Q?pu39ahBqsuyW4aiigc9WGy6Bf0icGtDLep32tKUlENhnMK3YUn7+XiLbdkB+?=
 =?us-ascii?Q?qVyO0ZLfPFxyuNZDa9WmwH+DMFCBlPk/ihmvYggJGSoNMp993kmw96NsxRhU?=
 =?us-ascii?Q?Ky9mpB2U4jnT1MfEAIRYiyXhHZCfoOcM95/MUVbqz0bDtIpnNH6/0d4Zhb+F?=
 =?us-ascii?Q?XwDCDE8e8EhhDeH1Sr2thI32HNDWJjR9mPEevobagfwWDA+zxphkng5O1mV7?=
 =?us-ascii?Q?rMjbU1DaSIE4pkjBLOtAfYHulFsbYAf3ImKkAmh+PVBa1rxONxAwGK1V1F+U?=
 =?us-ascii?Q?+zpsSckywJcHBKgRi5bMWlLWunhisUVQYslRF/iTtXx1RCzuhpExJmfTQ+e8?=
 =?us-ascii?Q?RkINfDVROdbvQvqUiDwMwcSWk3mpdwauLM4BAMsUpPdW24kWJ01i/3Pm5g2W?=
 =?us-ascii?Q?HHSqzWjKCV/On2B5wcd8Mbm08MIi0XivoX6tKpUEAc0Xc2Rad0GDPwBKVQws?=
 =?us-ascii?Q?XypBc4032FPfPnNxcANuLzKwpu5u5UXsNmeRchnZmi35dVd2kt7ltisYiBDX?=
 =?us-ascii?Q?o4q5h4Cu1S3D0krrZ15+ykTdwSJjOIEKjRrFJYiKFWhOFxlmvEFI5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aaxdYr6nNlqNd7Zxxo7lCJS7fh5XTyVBN6jPlhyJnJLa5Khaizm76ID1ZtgX?=
 =?us-ascii?Q?emT+2ypxKAMmDkOHeDNpiN1BucVVL5QN/pqTkqdGyjsHSH9togvLkp9BtY5D?=
 =?us-ascii?Q?JfKMwMbWvzfpG+Ud3O5Uivh1LZSF6M4ePL07Wt0lqYRKRwV+uhgPKgZphwAz?=
 =?us-ascii?Q?SMxpQzBggd9l9xlsk41rAX+Cgo19mT5G/3VVm2tIQkoIw97zWnsXQJBMrejx?=
 =?us-ascii?Q?nUqNOpmAYBjredcxsPEj+TriOryDHlZgzAv+KZ0HULllmKl64qwqzK3iiYSh?=
 =?us-ascii?Q?6vph8tjTVcQwwhrePOIAOwxH67eWGJzTpOwpdMAh3cWCQc5sXXSEsqtkkp1E?=
 =?us-ascii?Q?rJNXwoeJRQal7ypr6ywepyo0hA8qG+q+CdtYfYn6Jp1COtZGA0B4kLzQ680Y?=
 =?us-ascii?Q?V+6KajeoFvuOKWk2DrBwSQY4DDB5KUGx6urznHpLuYbHZyR75HSj43YHm+Xe?=
 =?us-ascii?Q?hGe9O/J1a+BkRTGngx+pZHv20Ew6Behbd7iPiIeHBe50+GuHtq0D02fkPqKU?=
 =?us-ascii?Q?wpjmiI8Cfwumtjq3K+k4hoYe5JbC8rg6hV80+Nn6cX0c/8bE9IFV3RfqEWLd?=
 =?us-ascii?Q?s23qWVgoGFUKmn4HDNFbkbio3RJpck7hW5Oo6Bnji6jGiqmvbFovBb1u4OFl?=
 =?us-ascii?Q?m6RLd2U08TEUCblTXLzsA7mrd/Umm6+c4t9Qk3f1rMLPtu1pOeuHqA9yqJ3b?=
 =?us-ascii?Q?p/v7HSciIqSHA2UM5w00/tJvg81xiPPXf0pplC6pzgKhnAJHqkRab36GyuJT?=
 =?us-ascii?Q?3pdP2VsC+q645as7vlqlVDBhRBQYQNlleHm17/JkxcgnjX33CiN8laOlP0Yq?=
 =?us-ascii?Q?fpT0MNgJf7GJ8ayr+n7/1NwNHKBqwq867Z4s7MBW7stKD0xryoScYkH7jnZ6?=
 =?us-ascii?Q?bFxtdijnpMn+hndoV6FSig5X517zgB2aFg1rMzOYfYyD9APeW4NIPreEmMlu?=
 =?us-ascii?Q?Dkb69n5U7134GIGeYSCvvpawwsYHzeMsBWrgkKHKgSKl9KDCQHX0LPz+RZnp?=
 =?us-ascii?Q?LITnFRcf4jl4g9P1O5Fqds1LRLiYkf/x3GGktzZerY8zfGAVF0BXrJu+1ies?=
 =?us-ascii?Q?FbosEwhdZLhJXTIdy0X1yVFngfVwtDXA5pF8LiLYiLmL+DHEHK8EwnRP8Zss?=
 =?us-ascii?Q?+fZaL9amtxTKbMUTjHPaWsyfR3nWNhiNJujvncDjE/kdRq0iR5VHFt9X/HGX?=
 =?us-ascii?Q?CkT5Fp+2yA8f3dOMrPJjGVpQuFGAxQzgpvexgHv8m35PyDOVXPcpNMqO+TyY?=
 =?us-ascii?Q?+yFgqzSs1eAN2+lJ8ijrRyOlvuHWsmb442B3ZfiUP0Bclp+tQP5Mz8xvIC2+?=
 =?us-ascii?Q?JvYgYEeMHsAL9voEr5TGhCVdS6Egusyew005HNarMh7Lu+X2dN2K4Nz20w88?=
 =?us-ascii?Q?5Wn+/YzDsmxhhTihNZ+/3EEkk1ObWdpTDHMGaICTKTMEhJ/XlzCME+jOKndB?=
 =?us-ascii?Q?msz9SkpS953/tLD1EWC2eL9Li5Ce3SqSex9AjVstVLDX2/9qEyw0ne+KkXAt?=
 =?us-ascii?Q?tyy0qf9GZ2wmmnlrKAX6foqxLYQWP4lVVL5LJhZXGaqzyy1cJ6seqB9+PB45?=
 =?us-ascii?Q?9zLlywUWedGqPlFfjiDxR7tDutiZO+f0lE7BUpfHVrRwDDQsPuv63fSVf8nh?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 25df2b91-44ab-4879-13b8-08de1aaa687c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:13.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxGkxR10tTj7KfNEoMyKm58FyrE7vwwPVJ3utxWCjigh+HYt9GeW4XCrQK7/YU9f1u/Q4YaeEbPF3Qt2XQ1N6Wp4Xzp2JAuIMSsHiG/iVec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225603

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Overview of changes in GLib 2.86.1, 2025-10-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #3745 GIRepository: union fields offsets for compiled typelibs all have
    offset 0xffff (unknown) (Philip Chimento)
  - #3780 `gio/tests/socket-listener` requires dlsym
  - #3781 GLib.OptionContext's get_help() includes width of invisible optio=
ns
    (FeRD (Frank Dana))
  - #3783 [CI] Pipeline on 'main' failed for commit c31c4a52 (Tobias Stoeck=
mann)
  - #3784 Memory leak related to g_get_home_dir (Michael Catanzaro)
  - #3798 Gio.AppInfo.launch_default_for_uri_async crashes with non-existen=
t
    paths (Philip Withnall)
  - #3803 GNetworkMonitor's netlink backend doesn't notify connectivity cha=
nge
    (Philip Withnall)
  - https://gitlab.gnome.org/Infrastructure/Infrastructure/-/issues/
  - !4755 ghash: Fix entry_is_big for CHERI architecture
  - !4756 ghash: Handle all table sizes in iterator
  - !4760 gbookmarkfile: Escape icon href and mime-type
  - !4773 docs: Add Luca Bacci as a co-maintainer of the Windows code
  - !4775 Update Ukrainian translation
  - !4776 Update Catalan translation
  - !4777 Update Lithuanian translation
  - !4778 tests: Fix clang compilation warnings
  - !4779 gmem: Replace SIZE_OVERFLOWS with g_size_checked_mul
  - !4780 Update Brazilian Portuguese translation
  - !4781 Update eu translation
  - !4782 Update Korean translation
  - !4785 Update Japanese translation
  - !4786 Update Galician translations
  - !4787 Update Hungarian translation
  - !4791 gstrfuncs: Check string length in g_strescape
  - !4800 gutils: Improve load_user_special_dirs' user-dirs.dirs parser
  - !4802 Update Turkish translation
  - !4809 Trivial backport of "gutils: Handle singletons in unlocked functi=
ons"
    to glib-2-86 branch
  - !4814 Backport translation updates to glib-2-86
  - !4821 Backport !4820 =E2=80=9Cgio/tests: Fix a race condition in
    /gdbus/connection/flush=E2=80=9D to glib-2-86
  - !4828 Backport !4827 =E2=80=9Cghostutils: Treat 0x80 (and above) as non=
-ASCII=E2=80=9D to
    glib-2-86
  - !4834 Backport !4810 and !4819, various fixes to user-dirs.dirs handlin=
g in
    gutils
  - !4836 Backport !4835 =E2=80=9CUpdate Portuguese translation=E2=80=9D to=
 glib-2-86
  - !4839 Update Romanian translation
  - !4842 Backport "girnode: Fix computation of union member offsets" to
    glib-2-86
  - !4848 Update British English translation (2.86)
  - !4865 Backport !4859 =E2=80=9Cgopenuriportal: Fix a crash when the file=
 can=E2=80=99t be
    opened=E2=80=9D to glib-2-86
  - !4867 Backport !4792 =E2=80=9Cgtype: Use transfer none for types (un)re=
f functions=E2=80=9D
    to glib-2-86
  - !4872 Fix macOS and msys2 CI builds on glib-2-86 branch
  - !4873 Backport !4871 =E2=80=9Cgnetworkmonitorbase: Add missing notify::=
connectivity
    signal=E2=80=9D to glib-2-86

* Translation updates:
  - Basque (Asier Saratsua Garmendia)
  - Catalan (Jordi Mas)
  - English (United Kingdom) (Bruce Cowan)
  - Esperanto (Kristjan ESPERANTO)
  - Galician (Fran Dieguez)
  - Hungarian (Bal=C3=A1zs =C3=9Ar)
  - Japanese (Makoto Sakaguchi)
  - Korean (Changwoo Ryu)
  - Lithuanian (Aurimas =C4=8Cernius)
  - Portuguese (Hugo Carvalho)
  - Portuguese (Brazil) (Rafael Fontenelle)
  - Romanian (Antonio Marin)
  - Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=
=D0=B8=D1=9B)
  - Turkish (Sabri =C3=9Cnal)
  - Ukrainian (Yuri Chornoivan)

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../{glib-2.0-initial_2.86.0.bb =3D> glib-2.0-initial_2.86.1.bb}  | 0
 .../glib-2.0/{glib-2.0_2.86.0.bb =3D> glib-2.0_2.86.1.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb =3D> glib-2.=
0-initial_2.86.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb =3D> glib-2.0_2.86.1=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 2e8dde2820..5909851896 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native =3D " file://relocate-modul=
es.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "b5739972d737cfb0d6fd1e7f163dfe650e2e03740b=
b3b8d408e4d1faea580d6d"
+SRC_URI[archive.sha256sum] =3D "119d1708ca022556d6d2989ee90ad1b82bd9c0d166=
7e066944a6d0020e2d5e57"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.51.0


