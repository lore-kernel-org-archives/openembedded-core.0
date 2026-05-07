Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6F9CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 05:11:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5310.1778130667653789467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 22:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VS9VXqWN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95877633c6=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474aeku3194007
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2026 22:11:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PGMK5GWMl
	dJZjnvWlI4mUb3ZffZOkiFUp/O8fT4efzw=; b=VS9VXqWNrVD5XV5IaytXsQlFz
	4/8FZ1/L2T3ZDA8TfGfuImKM3S4VqySvYp6XJ5DVQ1dEkoQwmfiLVURjCyyx58B6
	INI8tf8UwqCBwg53szTlOeaVXoJJ25a+BLayUSIIuG0IUjvMhZ04B0RDn3DaMCpH
	wF+Qy15OfXkp4ciVKWR0X7weGztQhNPkX2AA4Y6fd49J1i1GNnJzILZuHbMRwN6/
	Z1sWMF0yaVPtDseiEjJaK0UmcfeZBuUQH+8Nm12DixcucHxAf3zQhpjYRDlQMC3D
	vTdUPBFHdi0aOm4K4+MK3+Cju3qVyPUtdTP5DtNmivDIAXvCfrzCosjeimoxw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012014.outbound.protection.outlook.com [40.93.195.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchywuyu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 22:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgL10iw9dkk9EZC/91MbqRiybhaC55czTSvEXuKGU2sIlwSydc+iaQ5zleyTuudMlw04gy+6r/j3OuT+S420B97bs+SwbFTRvUXKuKA6ohNRk8YsuBAiRNQru+T1z9ExNYVFQVOz0TP9eXgP6Egp0Il41Hm6jbeNEzYkGnfwUpdjGpMgJWoXN57O1uUZAcgPxs0+0h8f1piRr41mijigDbn9a0MI+HVAAesMfIlobr1IK04isdE835SrOXytgss5sreJGaJF9L1Eyl5TtZ/eIwrOpuQ9gE71Aqb3kOjV4sIMQzdggpBVeUB1dr9zfSJEQ1PAmbXxK8DlH+NIann+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGMK5GWMldJZjnvWlI4mUb3ZffZOkiFUp/O8fT4efzw=;
 b=aRK40/wM2TbVSjoI9A/dLBEyRQVI8zc4ZhGyYkHZaDV0qUfTyZHbjaRj5wvCY1T6vpavM4ZzmPd6g+u6IWSOXQH8nBZwq/NUhhahBj8yczuBWrpDHZatbi0yNN6VoNjsB9sslpqRlo8eOJPZrg5Gr+yEMLkn7a08bmEjjA6afewi1QQixNiDBHu5fHPdH8+/I4V4x2D9U0M2QRXOlkwWmzbI78sDQv15yYFf5tU4g8FWizhVJyhgiiABMk+HcbdxUHHzQU1idUdO0gLgzZBE4hI8901w5g3crZ0vgYJm0vJFIRDdJt/cJPbgikxvHgd8H4W1MFAVP7Rn0XU+ZN2yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 05:11:03 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 05:11:03 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [PATCH] gstreamer1.0-plugins-bad: disable vulkan when x11/wayland not enabled
Date: Thu,  7 May 2026 13:10:48 +0800
Message-Id: <20260507051048.3943372-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 9180d67a-d8d3-4774-5839-08deabf708f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	n6aIbezlR36btYaKD1gebTwlWsEPvxVvkux/dH52uiDrSvveJvKQ5skZs7fEZMIBJahyLwxtlyd/VltBKJD2Rpn7AVSPxfi4BSgQIbMZoRhg0kRoF5OWFxVa4d8ld+bHtKLgNopTi13MHfNvVCbF3DseYadc2xFN/eT0d2HKl48enBGONko7W5q7qhftwgG2hMvuqJ6LhlshoMpAFdn7gRLQQgYGeLVAhXJituhReqjp9FVxva/6EFXWG8pMK4qKzxSSFAThBc4JWBgJHDqMjWuO6OutgU8bqN7FfPwcV9MVjd2VYiwN2KecB61wkMKGHQAGiBmDeZd21graancPt1lTfd7ollEbWny06sCm+QS1NDQLpWmUfxFmZa2AOIHbWcaB1PcVqSMcbD04IYlQM4LyUs3BTNPP6bFJyvLiqVI2SmhiHpt6QwVjns+QL2rYwjt4WkHhAQzcOkanonivSo2AxOXpJfBx5XPOeziNDACmplEFBZ6XAPhMJ1J02xUsHAl/mD1G7oT4dHGI+YGVd81xVqX9JDroZHg0wfTH9Ad7MKF5PDr2TRBK+tBK8XtlyXJJb0eziQ5SxPkeoxmQbygrgpLOCGZhAp9/Dve6g+hzG7bsG4/e9l9o0OqcMvODOcADb/EnTSU2gQjIbhY4azNKxV4P7C3VwYS+RWCC5idkX+Sysndch4VkJfRwz0LXQnfv0SY9dJ2hBVZHlps9f9ZMljuLuF3G4Cxy9cV3o1zxN1yxKnG7kepqYp++IT07
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?40K/YrSSHczsQ1jL3ZSaWRAJaK3CunLzmlSFVnLrekn4zepi8zpkgP+U3nMV?=
 =?us-ascii?Q?7t1dOIFlnk3P98n1TA/YgODIdDZpFoxGlsZR5jCEJALOhF/RT83QB6bstdd4?=
 =?us-ascii?Q?YRk0AcULZxNV+QAJ2vUtuaPe3P2wEhOHoKpfWqB8235UBcz+ashH4+T1smTu?=
 =?us-ascii?Q?SKCWUi9S7k83bO+eDyW/gODiVLJO+oThrkRrwn8DJrEXBYLfvA6yvFNdzHTk?=
 =?us-ascii?Q?vQUlU8LmKbDY+X8QQvKPl7M3R4fST1RX7jZd31u5Q3WJ+ONzqErRSL+rVkLY?=
 =?us-ascii?Q?OkIqvE/rg4kk0i8/TZb0J8doDSQf6CvAG9hdYlTDt+lvEvgksDUAvnQjNW8/?=
 =?us-ascii?Q?9qxwZ/dOziBL3FX+kcc9b0uMwGuu+xCMVru4VFDoJNosHnZNTmlD8IPuY1+K?=
 =?us-ascii?Q?RyLLi8hUvGYyHVZnM3BQEaQFEePyTO+zKMEqdBl5XVxi7q+9xmXZ5uXHdZSz?=
 =?us-ascii?Q?CEtJPGT8vDvaFeO05HIEiJFxyO8X5AxEUjxpdK2zYl84mVuqgQbsRRDjcikm?=
 =?us-ascii?Q?GISEQs/nFaGFlbnUvXV0M/RGbOY7Y4bH3ST2dO/D9atwiJA+Edr6yYF+raN5?=
 =?us-ascii?Q?xCtA08Z5++7Cigetf64SGBS3SeIS5Sz4JPMtGDpXwaZC7sRLdog4mhMAU59T?=
 =?us-ascii?Q?Zotz0HeLZjXl6dQMdTIbA8z1R52U1Cc2PixACKs8noXgCI3zTIkleoYLD7HX?=
 =?us-ascii?Q?IXrAWo3WRpMyF7UFwCAugxZDV41aYMdTB07pgOzyrKVUOhky7qXj5yc2PkW0?=
 =?us-ascii?Q?hfCjX9cX+Fi4T+KHBjwDOcONeqSw7gXjrT6X9aDzpS+FU46hdVOrAQegAGOo?=
 =?us-ascii?Q?RI84p+6tvon57GqSsj6Qh8tYCy8DYb4fOXk+fs7tZ2+0j7DuZ/Gx0CAqlnPD?=
 =?us-ascii?Q?4I4+rsxBiFi9mmX/DNZ/tOaQE+Q0hZM8gFokY7NvtulRsiUWVjt3z7R12Mpj?=
 =?us-ascii?Q?NSQvlBxW7cJR6hWr7xtFswAKeBecnb4rlhVCaqpc69wdaScdHNQiQ+cpGaCO?=
 =?us-ascii?Q?p4WEdY9dfbUngUuzre8uxVMLLoMsY8jjw9HZMZuVNYX51INc3jdX+W9u21fh?=
 =?us-ascii?Q?1RE96A1uobYyT8bsgWSQ1N7t1f9BU6nYXOcEX2kOGiTQ2YOVhXhcWouBUC8D?=
 =?us-ascii?Q?1iQvytDxhEcvvX/Y2f8XRwhYHeqETo6j0fMdElk6B/wwpaV2C6oMTY8Qu3U8?=
 =?us-ascii?Q?KhA6d2xd93bUPaQpRSxUmBZH942BIacA0IqJMyT+cX6TvPKoSBDPYA4qTMtm?=
 =?us-ascii?Q?5XVJACTim7VJib9QXrdvIq7IsRBc4wuRHqvkNpONyjG/cGvuBFTm8VitB0kL?=
 =?us-ascii?Q?yZCHlgXFKrYegJHdler9tg/K+5hykJYfSqcHsrkSdQ7Ov/QAvxL05cLCk/VA?=
 =?us-ascii?Q?2LDzeAaaRjVjzE4+ZWaATED1izO3Yhhp8PSHuIbDnUTjPSnOCUCUQ7zkfWMC?=
 =?us-ascii?Q?0Q5QRWC5hZfi1/Wid7t7rafGBnPjEd5kfpcWO5pkjKigIMy2J1QqtPaK7Hos?=
 =?us-ascii?Q?P1I+4Zn2k8UfB3+9jG/G3UdXmYhudgAc79CnoE+DE0CGebbxzoxUK/uIW+Ir?=
 =?us-ascii?Q?oXlG/ueZYUPp/XBVzDApVaoi/LCwRPRerda5YmEnZ4cwUdnQmC1DiSoU+ZZK?=
 =?us-ascii?Q?ipwySig4GYy2za+TvM2jhHsrSEo1Z3BpT0YfzcYcKYmxHjmztG2NIPyAHZ9T?=
 =?us-ascii?Q?hT26kap2IsdQsCgYumYhJraYYDGyqBfY7tbRTNar8L+pU6Y8Q3RGoEWXmv4h?=
 =?us-ascii?Q?rzA9m2ez6KdtlcGK54Xm95JW+7XuP2E=3D?=
X-Exchange-RoutingPolicyChecked: 
	snk9m+DiNrNMrR10egSHyZFUGn4Izt+rE3MpBGTk47wr+z5nx6DCqZ15aGJBRw0wNu+QU8ohBA3U6gBKrkc3nUeRTctnrAht2xQsxd3NoifQPHsNL5puCb+gbChqaNVP63mq5b5xwtemZvYgPJxChlmkW1N0NmgHjERfaLViNLngKDdIfurB4MXZ5PGrLqOJvVFBBexzZdUBXKk0Wi3v0D6BYFTkIfLibNLmUijo50Fz60nKIOdkZqkIBjx7XCATUCyeflDQC9qi0CQu3sWv7ekjMBZmtStRhbM2CqBa08yRurAfpgtWe12MHRcZkY2eKlyAnYCgL2Mx9s9DZcMlLw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9180d67a-d8d3-4774-5839-08deabf708f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 05:11:03.2325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/+xdwCFqepTUHqmmEMsQw46TZDbcSGiOJzmEhwguX9na1diU59QfGSwc4m5T/fMnCarXzY1sA3Dnq9EGkYyxvgrZ81R1XCd7IQYuXjL0eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA0NyBTYWx0ZWRfX1l4cbIgYrVTX
 LvEM2cTiwI2OkbyCG1SeAcTcNmmwPlwN0o71yShKr9Z7Mhwr9g6q+Gw86REtGeN7zDqJntK7TKO
 BrYjeKGANqhfehGSjqVChEqiUmr83Jm0UDEj8jDCHa0HdhfJ1BP1iNVvBL0Jz3vUztzB6zRA9PI
 L38u3FDfZvT35ENpQAFc+F9gR/wtlB2VdkAToJ4dUilowUqHb3HEutziI8JmCCyt0fmZ5g2zgFW
 2KRJdVPkfPeAiolPzJ1wBmj4bM6S+xoCu+/j4fhW/R6WG18e/p8F8823OpJEnBAJfmNmKpFWIBA
 qp2YatgGqFr4mE5vjitcqDATtCmtXVb9kYqe7kLf6lf7aGrx0Y6Z2827ERpw1hrGifBXVuFg6yM
 qRZUqciDs8k0Uzu8ylAX0+Ha70t7VXnqIY3yx14qp5z/+pP+f7/Thh9lC9dA0jKAdQZ2bOdxrZN
 ZeQY/iKv8zVEPPIeAFg==
X-Proofpoint-ORIG-GUID: MorSx2hLCS_kQsZib5AhHyqjsx0ZSJTD
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fc1eeb cx=c_pps
 a=C5q/T6pJLpFJxMBEEzTjbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=8mI5Hb44qIRmAaL06cMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CrS6MIX5s5vQJ0gVvWtGHCvblgFaVX6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236555

When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
do_configure will failed with error:
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work

disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
index cdf3a20dff..51f51761f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
 "
 
+PACKAGECONFIG:remove = "${@'vulkan' if (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) == '') else ''}"
+
 PACKAGECONFIG[analytics]       = "-Danalyticsoverlay=enabled,-Danalyticsoverlay=disabled,"
 PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
 PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
-- 
2.34.1


