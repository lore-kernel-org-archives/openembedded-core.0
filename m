Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB738C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:00:33 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.8556.1699358427980686064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=TUTAsCgu;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.47, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZLZe0zx2eNs1uYPWVUwJ7eLJypX7SZcu0Kc9yjxjexExayiUOV2asrRbjl+57h6eciwwklxbw3sDghi1+2UK/CtsqcBkNQwxgDwoC+VWU/4f/Ubi45gapwxzVCeI+10YZnoyjPc0skymruAxnGQ7ScJNtEiMjJFeYFB2XxaGyoGGziizUpAHGOShEAU4qIRlT/inUcWNhHBgViN5OFq1djJiNwe8KkoLAg1/4ZHfdqYPxngp1lscTewfpu5d7LzqLBKctzDGJ5Hx4JlAOHBVCUAFSBzFbckth1b68TUq9WbldCNHMIjFDmnnExnuaG56UALi47gmjSQDNAPA5mu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiF7ZNCwnZ/B4qAFFxI7sf1mEiKRkxpm2AzBS4Vo4IY=;
 b=Q35UVjZQ2uHKDMQIFplR546aKG8b5khGCXxkyLxlbcLTQjlZO+12XlHQgOUtGZJ5hDT5Pe8hzSIUhrERLRlQNh2fiU2mNIH4qBr8XWS/dvVlW6AjO+FLbcSf8oPdTGzptjbI1DMntLOYQuavrUEFv3tgyHGFoKMQTwos+dskYIkOKAO7P/JaqPaGkch09Xf7/xd7hX8uJnUINCLSpwtNRLaJJprL9GPlXgpA2pDViEmNyKNQqWJyi8ViZe/1DcdOznnitWXSIsrJ4+yuDPY3b851QPlwo9pUOxvLPE4M/peEGMwhlCXYKSL7yL1N3IuUcoXm/3b+S7TACLomxC2Faw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiF7ZNCwnZ/B4qAFFxI7sf1mEiKRkxpm2AzBS4Vo4IY=;
 b=TUTAsCgu4eakKogWvwaWPo0hgPLzTaluPJbAa+j4UxS+f1rji8rDMPVH5v5HOwOgzA78/J06HR2OrxhbvlG4inmDm6nvEfTbp63zkFACrPsk+tVk3V/lRq3NzdeyTIYrnHOBiZGBCMeD8bJhEHXlygoL7KQXAco6rP3C0HSGRjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PA4PR08MB6144.eurprd08.prod.outlook.com (2603:10a6:102:e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 12:00:23 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 12:00:23 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH] udev-extraconf: mount.sh: check if filesystem is supported before mounting
Date: Tue,  7 Nov 2023 13:00:17 +0100
Message-ID: <20231107120017.515892-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PA4PR08MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: c70a30b2-f013-4c3d-94d2-08dbdf891f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ETemKvop8mymcM3wOGdpg9W1UdloGuvszHLV8JWoH1IbUIN+pGNAn4AR2iI1G2TjCCyKDvg9zJ5vrhqwdH+hQnnMYpxokNRx/0hFaZUIqBoXRIeaXUyWaAUFlcaO+VzemJvQOx6qRukbqiCBSeyePJxHDR4uwwma2PJiNik0sG8ipJebGevu15tpGgeHu7GqjM5f7NjtSuhRV7NF21I2zHS2R8rvUgujitO10J4cJgYZQjQsaCkgmDw273koW3G3z75myQszzoucuhD24IbgIBd0w+9YY1KeoX7TQRD+8XzpE9zwES/xjKTQ0RceI+3X4wERlDyGYkCHm0lZbVl/+aK7HPHySkscE2zH9h5KChII/B5schO/Kj3tuwbRslxTda4mEZVvZSgJJVyMd/OncZgOcs1VIUAWN2s1IcpD7gwwrJVZ4qWkf1ezqE+5OKodgMYhsUUk7oaYaVZ96JN/2hUdvO96RZCB9ksam9U2n0V4g2dplTKvOB7lkcKWk30hXnvsZbi7eWbdcwjDk1lse79ubFyvVnvQc7LCunLUe/YRmTSJ1KotmLC/8OBwt1lWNJf337drDZk6mDYcgifXfv/QfoAhaugYZ9fGKKLjom1SxzLH+/u3Xq3JJ0fuPlAG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(2906002)(5660300002)(86362001)(66476007)(316002)(66946007)(6916009)(66556008)(8676002)(4326008)(36756003)(38350700005)(41300700001)(8936002)(1076003)(107886003)(26005)(2616005)(52116002)(9686003)(6512007)(6666004)(6506007)(38100700002)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?huNJ90FdQA13TEjg2s8cwdfxoeQ/ID8JpvoE48OGg8WKNZNFtjGaUYfu00k7?=
 =?us-ascii?Q?BevfhIIG19cBSuTiJBS4Gvbl4FN+9kpO65qLP0xwfd0xJmllqPhgSvyIH2/n?=
 =?us-ascii?Q?whweWHTneGbGmNqpi57PTHv7w9sl6rmsiYZaO4iyLIqt+l/APB+tsX4ac83I?=
 =?us-ascii?Q?aKp55nVIy2wvDCypl0blABBKSupUNgz0gwEgSWYwPY2TTxvh5knfuWF3GvKI?=
 =?us-ascii?Q?gKMqhqSXFFYoTlxrjS6/sODlrWXQF9aYKGKjfqLIDTLaYVGx9i+Jn/dB81Pz?=
 =?us-ascii?Q?+Wr9A+AX3uiCk0T6cnhCJTSWv7zWYnnNRtuzmK3CDVIntfHOE3duAQcnnpsp?=
 =?us-ascii?Q?A3CP8pZ0H4gr0diHnIlY35CsTSOj7mKYbUTsgpjE3yzCepUM8hoxjYpwkkYy?=
 =?us-ascii?Q?97wnHQQNymTFOm9+/JanFoEZzVqdPtMkefv4GYwjlIaOI+b0av1LkyjuxpPR?=
 =?us-ascii?Q?Zvep6sd/jKYPY82LFY0CaQkQZMEDQdDBjA+OCOkih7c9qtJUVFG4zd8hDret?=
 =?us-ascii?Q?7M2Fyk0mWGETiIW8IC2ZsjG6QDmLBe3z7CnRSP3IXjAJ8QtZveQoBvGhOmdz?=
 =?us-ascii?Q?u+uRtUQfci3/6j7sFdei8+lPW9/00wslj5pVPDnuKfG4iK5UJD2tcgWYtK1J?=
 =?us-ascii?Q?IFyrFg42EVQ/QlyV33cfsDaid0StMSkfTNUDxnwwdQYjhmy7gKcSLK/hk4bD?=
 =?us-ascii?Q?jPWclbBEjQdzQHWsRc42If8tx74fkZoYzt/Wh/yJ0V1ehN4dq/T6nPWMzLqj?=
 =?us-ascii?Q?u+4cvS5ZuFK5BUHbTDWuqq9ljsWy7zPbgGuYfJW94PLUZR2EiWxGCrESm2Ce?=
 =?us-ascii?Q?fdC3BY+TiyNfwHCel5bn7it/T8mlrREUSn2WEfr/8DAyhn7R6gAzoinMEsIf?=
 =?us-ascii?Q?4VHTwtf22e+bOhwjkLGWUKHhZL2Ggxg5t8TUw1AIVehlHgR3FUmPNB3OF9zS?=
 =?us-ascii?Q?jpi26Oe5yZJjCt+Ifihulj+mKuTTB3EHuBbzTfrm81/pye94kk3F9WASthEB?=
 =?us-ascii?Q?q4LGZEIAT8uJaHXXiubGQFbIAL2N9rKa0exacxB1lXRte+HN22bgY8VL0dj0?=
 =?us-ascii?Q?HkNV6ARNAaxPow6zyKaR+5eX9ex1BmL17jIraSQoQppK6DW2oIF5PBUDyVJX?=
 =?us-ascii?Q?8F5pIsjSQZMD5GAS82lNgrIxPXQxlJM/CFnQbXWP8TAxr9pSbFz6B+U3ta2L?=
 =?us-ascii?Q?k0P0xJIgyk1qIKSd6uYJXCfLrtvACLbFIiuLMiOZs8MF3yVXefVsG0uq0Ut1?=
 =?us-ascii?Q?gUQsmYZCBcqm27kMpQ23hT3kPN4fqZCoW20fqFVdDFdKq0lKKNgejMu+VbIx?=
 =?us-ascii?Q?R1LXNdcTKtgEVvO5vTPvrHPWIxjowWS9B53QhhtYwWW6b2OdbLjZudIXZPp6?=
 =?us-ascii?Q?FyPjGGZn+Om4Z7/zRZSKoVzli1B4XSd4bzIHlBCQ67PEtrDbi2BP/gAerH5d?=
 =?us-ascii?Q?AHCnakmmAs5SevWn9iVmy+ejcetV8KT9+XKUmY5cWE9Uvn8H+Hqtd8wK7omd?=
 =?us-ascii?Q?aBIMR5vZypQSbt0mWXhnxzXkirKwgdlMKlhkcEkaIDzMrp31C+Y7TZC0XVkf?=
 =?us-ascii?Q?yLcghzcT2J3yIfW03IChHigqmNYhuS+D53n4L6tkkRWAGVDY7tZhHELxv5vE?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70a30b2-f013-4c3d-94d2-08dbdf891f86
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 12:00:23.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFAPOJLMF8aaP7fvIN1/Apu4TdWZ+2x8h1FQI2s8WLt3SONfw/htFyC/bEmScr0pTzrNdyV3O88zhC4Ut6cFPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190272

From: Lukas Funke <lukas.funke@weidmueller.com>

Check if the filesystem is supported by the kernel before trying to
mount it. Systemd-mount will mount the directories asynchronously
resulting in stale directories if the devices filesystem is not
supported.

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-=
core/udev/udev-extraconf/mount.sh
index 989fabc194..59563b7511 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -36,6 +36,17 @@ do
 	fi
 done
=20
+is_filesystem_supported() {
+    list_fs=3D$(cat /proc/filesystems | cut -f 2 | tr '\n' ' ')
+    for fs in ${list_fs}; do
+        if [ "$fs" =3D=3D "$ID_FS_TYPE" ]
+        then
+            return 0
+        fi
+    done
+    return 1
+}
+
 automount_systemd() {
     name=3D"`basename "$DEVNAME"`"
=20
@@ -64,6 +75,11 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
=20
+    if ! is_filesystem_supported; then
+        logger "mount.sh/automount" "Filesystem '$ID_FS_TYPE' on '${DEVNAM=
E}' is unsupported"
+        return
+    fi
+
     [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
=20
     MOUNT=3D"$MOUNT -o silent"
--=20
2.30.2


