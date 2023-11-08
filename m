Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90236C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 09:41:15 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.78])
 by mx.groups.io with SMTP id smtpd.web10.9939.1699436470384511516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 01:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=YSWEP0gM;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.78, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIZM1dAvYqe8naTqijIhPDrLn2Y8LcqDtSpxairu1YTUuVMqMrBPAaNh1E/0yIVZnqa/gxymQtyzQ1xP/m0zrBCoWWdSraOLnbupQalliUM5NcdDSHdvDD1z2byacoE1hLX38WFdIGtA2jfFBVQ98XXP69qB6EtCPHr5imFVyQEVnghffLWpZZoEL983qzZYAhWAcM3QfNXKjHc9LRR5g9xpqCNuv7m6UkABDQ27pOoPIL435CkabERaH8kHYeG+O9IT2abwEEMnMmHGY7OCj4/aERjY/L7XfbwL4kuxnIq5xzbG9yeo9ZvvmlR8foQnvZisgHY2X9duXiCzHeuPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOeeAYz5i2ezwdKbwRoFoUQLVVcTX4kKmlmFhUJnGPE=;
 b=leu93C5Mu+7Oz1NdqzUHyNeSgsl2YJsGr9BDPpmUXq0ZZaNzU0e+vRxL49Lc2vPEbKDFceVYOPG7RN4vUSM/XMUTGunEwUDJyGii7iH6Gjo3jllHmKer4R6wQnZtW6hu83SuUbVEF75NYk1WJOz9+VQvPrha+zLwXNsGXjK3HH0vScrFu94c+6WdHX7zXoYIu2aNWfiGiEeNaFYGfmNXIpO4HsAzYLpe1Rj7TZ+uPtKcxSW4VSRpgKXdNlr4SJGmwm6yv1Fn1Oy+/eiKnrxfE2DVDY7H21Q2cwnP1446vjEKAigZsJcEO8O7o9OtuLCYfvQPh2JEFeLF786UM2/4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOeeAYz5i2ezwdKbwRoFoUQLVVcTX4kKmlmFhUJnGPE=;
 b=YSWEP0gMckAJmpoGVv+xg+0+GcLVzEeSY0JUjqUZb0qgKshibVa1puVDByxp9SxESeXn/A9WuVONNGt66iwlzrbtgXRwWnfdSwzbpYBCG8jy1xnRwHK65lBB/0uhszd09zUTUODhBJW2ARpYkmjuXoTBllUwi7gfwQjcsu1Yxig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAXPR08MB7672.eurprd08.prod.outlook.com (2603:10a6:102:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 09:41:05 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 09:41:05 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v2] udev-extraconf: mount.sh: check if filesystem is supported before mounting
Date: Wed,  8 Nov 2023 10:40:59 +0100
Message-ID: <20231108094059.79116-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAXPR08MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bf251c-6e4b-417c-a9ed-08dbe03ed42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+BEJoo/Vx1LOEBitsQMy+FOCEwtvv9Y2LA3TjdTBk1E1mtPC9DhlodlBv0tT87nP4vIYcryqhTgTkyVhQEbzXgh/5NBveoyD3HKiRRtgqVLa6nb4oC8yiKyQNSfa1NkCbfCeGQhfgNV9GnaCayBK5XpEYjXj11fh2Jdp7VbjcWrzDTXJeb8Q/KD+P7FoqPrZmuythfuRr54vqu6i3t45O07+7oq3wAFmGHDatkWFAW+rN49l3iY80mmYOsET4OXkmDEc4fk25jpdLPThxsAP+vrLhQev/V1v1Q4Co3yTvqyZMgh/3JkOBSQBimkvgStduhT3J1Nxs7vwKgTJvHMnt9Q/Cqr0hYTxXNpQDlLQP8SO4BvQTwrmjqmLIN0ryLFnlJ0XOjKfPja+DrgJiX7Wl06IpQk222ZmFwgFpqg7x0wnNsKpHqtTxaXn3EVHQml4oknrhHQ5UFfjT1KFfJGnHlqK/FkHcjhQMGe4b1XdLGkAj/0cgIvpJ11ukZlLyAvx6CeRC7WkRTrHTDsnfRpTvLqFpDytdwGO2McxPCzzz9UHACRHPddnFiBiqaKsF2QbsLi+gClmlXWwJ+9DvF1tc5A3GzSFn4oNyJdpn9J+hp6Ov2zSgs24R49XWXKDtsLE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(41300700001)(1076003)(52116002)(26005)(6512007)(2616005)(6506007)(6666004)(9686003)(107886003)(36756003)(38100700002)(86362001)(6486002)(8676002)(5660300002)(4326008)(8936002)(2906002)(38350700005)(66476007)(316002)(66946007)(54906003)(6916009)(66556008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i+xMK5+Rb01qdkoq/xRwITxFPyohABw6caxXeLgooNdFp+keIW6XXVipmsIn?=
 =?us-ascii?Q?KSw9O0WVYClAxT+xI7sqpfQJSLi/DomJ3zXdro2Ta2t803+Qw5LkCEIrilFW?=
 =?us-ascii?Q?mDf+dMzh0Of0pUmLuVYagEqfGvu7LCeLMUFei52tWRS2Ay1j2f3eB6AOXhKh?=
 =?us-ascii?Q?dhBeGSfXo9W0h/llffP+7puhq0pz9dZarYwSKcnPeD8hHMDxGTfBIIgvBwEP?=
 =?us-ascii?Q?FyD2gDg/5L5oRFLf3LQakodT9f1dDadH7DQPk4agnOG7Og3sSXQYTnyZlGsr?=
 =?us-ascii?Q?ve6L6npL6sOHxRlzKeX4+TVGmEBr6nUAxqBJhsduVicPco/j2XsuFFT3u0Lx?=
 =?us-ascii?Q?QecawEm5vWfRjFP1Rlh7dyeGvcAgriCTvi1deFSO2YugHRkukohUvVEEEz86?=
 =?us-ascii?Q?nsoshLr8O6JEvP4BmXQ9SZETJsbZ8eJwIuZ7nfWz1+p+PanHlZxhuL7tMeX8?=
 =?us-ascii?Q?KBqJsU4p596wHUDEVor8FMS8HqTO+13qJhCKVxQfjZjqIJW1p3Dp1siLWvLh?=
 =?us-ascii?Q?ycwoyL0caal+uEharbKk9S2IiYyK1YjPy/+L1armaV/ApzX9RCZkwpUrV8cy?=
 =?us-ascii?Q?sE0/LZdAH/N3G+y1f+H71m2JDihE5uOZqVuk4Xdqk9yko9epj8hW26Xr4njD?=
 =?us-ascii?Q?KSw75eDMKI4199A7ZrK9DazAIsPc1vJZrpfgg3rMdQixLhSKqXtEInDBSYdK?=
 =?us-ascii?Q?pwrpTjw5eATty+eqvw0p3U94Ohdb5zmdDVb4dktLV19L6Z3FTy3Ecsh6bzB7?=
 =?us-ascii?Q?eTQK58tv5ZoO5q6aGRrnydl7JKw6K18HzAFyuRHD8lXZJYfpH/MEfyCettY2?=
 =?us-ascii?Q?Zu9k9apkJpVnQoIydnjWoU3+KMRmKEZt91JMbwDgI2sr+1owXViROKhyC1At?=
 =?us-ascii?Q?zrpe+lsitFMfexpp/OEu13MkRLNpSRUzzHKQHQUIZ4PXX3Ad+nKKNQgZ6uc1?=
 =?us-ascii?Q?Xy3/7FRtQcesaWwKwQTggoExYaOSIGSsEDlW97Kll1alxjHMQJhCRjRaA/di?=
 =?us-ascii?Q?1lCvh3XjWSTK2kyzfPa+ZebBzVaemV8RPB4FBJrPu/5NOc473/3Um2F8V8JL?=
 =?us-ascii?Q?RJidxDVTQSNiLvbYqjM5lAO8cihDw4eXYuwK2yteX7XB1+LUx2UB9eBVwa/6?=
 =?us-ascii?Q?xP9nmbdu4gE1ZTNDIRrntJo1g3rNNtNUxZv74tLFu+fMzTXYwQ/pJUzTY9Fy?=
 =?us-ascii?Q?NVl/sMVrjWmc+0JO7/eGHKjW+3IMy/r7oVKVrbZ+ywmkqp1jmj3J56wEzHal?=
 =?us-ascii?Q?UiaNjFtGu1xrtDO1R7m84aqKV532nkDnJ4n3NTxi4RwJuygjNMKI9l81mDYE?=
 =?us-ascii?Q?INWDdEF8npnyltFZIeDJbJd0857OCDZ5zxLKnPSv1vGuLT1T+FbSnf9cExtQ?=
 =?us-ascii?Q?MwcNcxPOKSVYhY0EllC+k7Tq43qrBdROzMGasfceghm15CnBx8+Zb1PyFbkA?=
 =?us-ascii?Q?EDOMR+x/U9wFI2zVUlnPO42+rgj0mR5AxazgdeADZHEjLv8vLSYQtSFf4keC?=
 =?us-ascii?Q?TdZ3XZ/3bVetJbmngW7Q0X4rR/q1SxzjEsIR8be1XM9WKllRfC2tKcBo0Wxw?=
 =?us-ascii?Q?Sx+NkMWnNUfQgZI0YOENvOfwAeFuHJpI6RSghQQAB8yu6B42HAnMhBarDXZm?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bf251c-6e4b-417c-a9ed-08dbe03ed42b
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 09:41:05.7207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgftktcPFIqPx8qef80Nr/p3woST3pALM5oYg57CFvMOOEyolaTD3KXDMisrJyMddgHoRJY6hWQA14UE9WPeKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 09:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190308

From: Lukas Funke <lukas.funke@weidmueller.com>

Check if the filesystem is supported by the kernel before trying to
mount it. Systemd-mount will mount the directories asynchronously
resulting in stale directories if the devices filesystem is not
supported.

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-=
core/udev/udev-extraconf/mount.sh
index 989fabc194..adf0c7aafa 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -36,6 +36,16 @@ do
 	fi
 done
=20
+is_filesystem_supported() {
+    while read -r fs; do
+       if [ "${fs#nodev}" =3D "$1" ];
+       then
+           return 0
+       fi
+    done < "/proc/filesystems"
+    return 1
+}
+
 automount_systemd() {
     name=3D"`basename "$DEVNAME"`"
=20
@@ -64,6 +74,11 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
=20
+    if ! is_filesystem_supported $ID_FS_TYPE; then
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


