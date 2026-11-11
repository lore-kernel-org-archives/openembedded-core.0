Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9802.1794405634361272039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gtFr9EN0;
 spf=pass (domain: est.tech, ip: 52.101.72.5, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duQZekV6xpBtZIph+yY/bwz2pkmo1c1Jh8vxHf/ZLbS8QHiKRtIlaowrNTzT6GmjIBtjek/uVI1v7+5HULq9frRu7KLqTJXujsF/aTLrtzmSJCpoMOZtg5FIVVZjxx+48/lT4kWjYs39MP3aMfs2qKc9gJuQk3le8h6T9qBE8hDe16oN3p6DZ7I2ipW7XqXkNmZ6c47Dh2qwQz/1e0+3DcXAEI4++40rDUuMisd3jqOE1qxgWfApNBs0Hg8ZAyisinbZNjF7zYYxH4zyKh1he66be2dsq/vm9OYt8zYE4cflcvt992724bHjBq7r9MSuUmavuHpetGjoNDM10TjE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SATJ8cfhJlNvpFccu4TMPMutP7T31WWtGEappiJXLKM=;
 b=PTlRnYhTHADpcPLI3XiuyBSR0jff+lnQT7Z23QuvCBqcmWyW6+lvoR03QFCEOhy3OWDKjI+3MAaZ1ZQbbJbzRKtUJaQu45APNzK0EZY2GmneAHSdHfZirkC6mj2OKETamjmMpdMtAFj+PaqRSpLOQJW2xdKEDVs41duasUChRLBk1NMy42RBJkahxrULRUawSE/+XzTpY50yRYx0Lg5izukFgmXVmWT0/+uRudywTgF3ItHfwJ+xjfdItsiJ2PgsrihtPADrHfFDHMWc3qume3rvfPyMsg7lRGDqU1lnCRuM3jqAQ0m6VgFUMsS4hMFWZn6uHA68xJrT9uzXswuNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SATJ8cfhJlNvpFccu4TMPMutP7T31WWtGEappiJXLKM=;
 b=gtFr9EN0Umu9wRFr0wP1U21Wqdu2CKpeWgVGMOGPDz/RZwPMlD1rwoyPzXIH2Rf3uqWuEZ15bmzpcSBbqNEHu52xNNiVlUpyNxiXOb+2tRGKXiJdKVJo5yuBZn8dxae726PyX+lUxHQlfgfP75TEpE5By2eLjNKwEh70fp0xqjLbYiOi9X2j4yWErAN3XmgRaKVc4c9Yy1+saHeWumheGzRcFnyZzGqnQ0Tkl6010rkQYmeDpgbzLRcjYACBMy3Ga6jgu6/lRDYI40OVbu+7cB6+zrAd0zPzHXaZzvDABKvrl8xLKfPM+HWf4hVETxJl0gX6PdQRGncM4otdWwDEXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DBBP189MB1275.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:00:30 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:00:29 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/gpg_sign.py: drop unsupported gpg-agent argument passing
Date: Wed, 11 Nov 2026 15:00:27 +0100
Message-ID: <20261111140027.69866-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::17) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DBBP189MB1275:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0e4d5c-fec8-4e1c-883e-08df3ffc2505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|261009223027099003|56012099006|261028144727099003|261102123227099003|261021123027099003|261022105027099003|261021121427099003|261026140227099003|261022075727099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: flLuayd/oAQrx0xWuN0hrkpkvuPvWAsN8lhsZYsVBcE3Aj/THEOL5CGzly5gUUsy7xnA5PA/6AsBxKfNx4wS7W+Kqd44joPOqQ2epXpwHLsVgcYlb6vgj//6jm0ILLw0dWRcnwCHKVm8gIGxG5lP6cpbhF1xiNkO8OafQlreaxz18TxyeuaZeowPzOKFAv0RoG+qmIwGaFa4wZPaWqdbvDkNQPyXJvzZeBss2W9pnmPxTqPo8PSTwmeSen39RusrdfnIJLsN5pp+n9dD/I37TCNO31FVu1YttuUDziqqZT68rq0b8w2BPh0iNooRW0XwrO19YeR6kQTNZhbKSdn3Ha2u0VX+xDpHNpkNbWujmQKvX/SrOiyWoXWgAjbhk172spfsh9ABS0wTJvWkrEyRog3aqM8f7PeUiliDhOYPZ9d+XbVH4MoBRCbWXkY1VqnvrlMoxg29muOb7QD5cpUt3dO5cTMbUjzm3a4yKuCm/Q3teQnUNzvN/7rj6QO2vcoKy2MfyOn69SHw2b71Px2ObCqQodsYZchuqTU3DApbYsPweEL43mxfV2vzh9JQ66yc2/Msh2a5diUjf/fl9Z4lxOTa8QIcr60gfyTbpnqKgUxkYdiKm/csBpp4qmrUoO7eqRacBH/GI6I8WmGaWYsO6/oJT2Sp5FcE/aQSlPsWYmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261022075727099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V7ZxcQ3c93oM9Me6aVr/LU0NuN2M0wrqL8A+Ew/eijcvWgYn4AQENBx8lEDx?=
 =?us-ascii?Q?tX+sAH8dCge1gPXU48D8aO9pwMegovpN/qQbEb5Gk4iWA2BaankPHmfwqhYn?=
 =?us-ascii?Q?g2jS+feCYnFIf95AcK7Ss9S5wiBsNvWGRXdlancmoe6M/IfzroXcxYj0Xuw1?=
 =?us-ascii?Q?SqfZs2tZltpVW+L66c6fsKKOEmhjYBORPpGK3wr+VM8BlRAvFC/3xmcix1GM?=
 =?us-ascii?Q?iNatrKjVZtRat+koxJbJM8rzzn0M2Uon5GOKIT7p9RlfDVmXbvjta//80vGv?=
 =?us-ascii?Q?5ojOj1RcqzxfUMHIqfDH2FR4PX9y86gIYxipKRYRNSQ3r5FmWrvCAIACWxMM?=
 =?us-ascii?Q?gs2pzGi0B0pmcexOvjT3MEBreukBKqkUb/MkEVbiRzoPcDEhw2wQNSXoCT6m?=
 =?us-ascii?Q?Wa/14eilz8c3mL1XN5/F1zlWlJF2YVocq504QTZfzt7Z/sroyJwG+wpGiEoH?=
 =?us-ascii?Q?5bk+UesK55F7YDgcrFmNWkKS1ivtEPnuUCRyVfIm6VHxf8gxkY2ujHt+Jzce?=
 =?us-ascii?Q?OzgmVEALTRgVvZ00CW6/XHxt38O0OTCkPfa2zDjriWTep5uOa8P52CWZ4Bo6?=
 =?us-ascii?Q?eDRB5b+kLUjF44l+NjkEpQagJIRMoBzASDkyXqixAP0zU91RbiV9VF7aZ7J/?=
 =?us-ascii?Q?OvtqW+ewTpy937/r1O4A1hdHDMPw9wE/0HP1313c+ZwD9Df7hGpgIp8Ta6Dv?=
 =?us-ascii?Q?mQrtn7JGLxfImfk01TdcT2xArkJJR5+nzUZNN8r3USTpmWF0p0hhsGNPShot?=
 =?us-ascii?Q?052sAB8WzX24AUQAGBiOz5Mx3FL1PwK9A5YlJr/4a7/ZZ29STDOGmD/33mQs?=
 =?us-ascii?Q?9s04R1nGIC3mVe1pfntQGHAmN+C5DXxnm80VjHlSP+5tjYNsLXp4DRLs6vBR?=
 =?us-ascii?Q?3VRbIazRPFSFFxWfFPyRDUz32QFtyXACwKiYt1jd5heFwEH7PIbmo9apWcLX?=
 =?us-ascii?Q?sCUntQHR6vSz6ImGjA2iJhaqEs24Jk1mNWJX+boKKi814xJOB1Z1SvI6Fjit?=
 =?us-ascii?Q?k8add+1fsoQk0X4tR2hiDj4C1CvQ4HtKhOUJ+xHJahvvEF80yN1T0eKZw2R6?=
 =?us-ascii?Q?/421sBCvy3gF+8wMQJyk3wkrRr89VXvn5WJZrVbvhqwihDZKjq7A14lrAxjH?=
 =?us-ascii?Q?JvJUgyZ++42CiaBpD6841DX8GnT34r7r4lkULZc9Z96Utg/vLyqdmNBQQXA7?=
 =?us-ascii?Q?VVTXEi41O3lvF+ED1djN9q6zRTqHiPPHOistnyeIJEnJ9ZUKEVNP6tSRinJQ?=
 =?us-ascii?Q?4fipffOfWRNUjXCK8oZt/Ys5Yf96WlklHd4dlzdkID2iRpofIhnfJK2qq/1m?=
 =?us-ascii?Q?shzIaEn1HSxRNH2cGwbbRByswHrp/y0nJduLs3U8Diu0Jm55srlMEaaSRzLq?=
 =?us-ascii?Q?9n0Dy+XvVMIuSN1LXy3o0Hyts+wXv0NeKo8yk2IdKZ7UCuUpbSDb3TgDYK7d?=
 =?us-ascii?Q?byeUV7nyPa3Bn//5oAPKiY3U4bq2bm0Cuh7x1Pptas1tvcmJYD2ThstWXfIg?=
 =?us-ascii?Q?CPawsyTuBv+r5j1s3cbuVY/EIwnMb469ewLe+tAYyxqJmEfxik2euCstbSUG?=
 =?us-ascii?Q?Rx/6W8Q2IVpytVdHk5kyKt16Jo6dmarGgpAgasE+WD2pDcYsBZ9CoZvqIKg6?=
 =?us-ascii?Q?JHql357Ya+TaNw42llpyy24VFNL4DXMf/eBOyIbiKfvzxQBi8zegAjx0uZuv?=
 =?us-ascii?Q?rAldLBUBiT2l/nVPqE33wfaYlNIqIAzJCRjFqVYzQzkp73yXyxZxOWxcc/N5?=
 =?us-ascii?Q?hEu4UfM1IXGkqvQkYphSHUxhk4i+OLE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0e4d5c-fec8-4e1c-883e-08df3ffc2505
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:00:29.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9NMfHGffhBcl3hXmqaV5XTmMdnGj5qNmamwPdEKayFSp29/A4xRhya4uCH4SgEo8KNrcr/FwVF8IqL3wYWugOAHR0IhN8YWDQYgWil2dv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1275
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250025
Content-Type: text/plain; charset="utf-8"

Passing auto-expand-secmem through --agent-program relies on GnuPG's
unsupported regression test interface. Remove this use and leave agent
configuration to the user, since the signing home directory is
user-managed and an agent may already be running. Users can enable
auto-expand-secmem in gpg-agent.conf to avoid secure-memory exhaustion
during parallel signing.

Tested with oe-selftest -r signing.

[YOCTO #16480]

AI-Generated: Uses Kiro (claude-opus-5.5)
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/lib/oe/gpg_sign.py | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index ede6186c84..fec6fb27ea 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -18,12 +18,7 @@ class LocalSigner(object):
         self.gpg_bin =3D d.getVar('GPG_BIN') or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
         self.gpg_cmd =3D [self.gpg_bin]
-        self.gpg_agent_bin =3D bb.utils.which(os.getenv('PATH'), "gpg-agen=
t")
-        # Without this we see "Cannot allocate memory" errors when running=
 processes in parallel
-        # It needs to be set for any gpg command since any agent launched =
can stick around in memory
-        # and this parameter must be set.
-        if self.gpg_agent_bin:
-            self.gpg_cmd +=3D ["--agent-program=3D%s|--auto-expand-secmem"=
 % (self.gpg_agent_bin)]
+        # Parallel signing may need auto-expand-secmem in gpg-agent.conf.
         self.gpg_path =3D d.getVar('GPG_PATH')
         self.rpm_bin =3D bb.utils.which(os.getenv('PATH'), "rpmsign")
         self.gpg_version =3D self.get_gpg_version()
@@ -43,7 +38,7 @@ class LocalSigner(object):
         """Sign RPM files"""
=20
         cmd =3D self.rpm_bin + " --addsign --define '_gpg_name %s'  " % ke=
yid
-        gpg_args =3D '--no-permission-warning --batch --passphrase=3D%s --=
agent-program=3D%s|--auto-expand-secmem' % (passphrase, self.gpg_agent_bin)
+        gpg_args =3D '--no-permission-warning --batch --passphrase=3D%s' %=
 passphrase
         if self.gpg_version > (2,1,):
             gpg_args +=3D ' --pinentry-mode=3Dloopback'
         cmd +=3D "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
