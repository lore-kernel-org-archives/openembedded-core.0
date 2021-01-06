Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.6961.1609934682207124793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 04:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C+8G4A8O;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfaKCRSCBLAzhZxWTm64YP/Mkcwi809e/sCMc0oS2VWKeOLZ+jIGqOvOZF6ck5Tj5Bd9a6FIezEJmPlb4nM+rK+1EqBmNd4quaBlxcWd2pjjfizEV3ilxe/bFjBXMZTyOUZHUFPSBirzeEWtJt5R5jyJ9XrI0hV5HZH+cbgFRPsr6d40zjkn8Vbc1TWd8Zz0N36+lg0HlQ1RLXaCVoY0mb7zALnKb287rtTxEmWJg8zWCK2uvoLiH75e4cZ8VoRaETEnO1rsI6PBviq8XnONJy+SdPcG4Rl78vD8wbU2DTdXscGN1LWOKJLXPmvg1ezg18T6l+rjyLwmzqcMezYEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdzwZQaN4s4+JkS2pytaaUyTqweOMt/zECPaLoCEJOw=;
 b=RaPzSoaMNYM3Yg5X7YNhwOU21dGE68ZldHAUhwQ+D8hwq02wRlNVtd8xQgondlCbM8LMeN7+hV/kFhK0IvyC0mVVpHqfmfgOrxlskQ9r+InNFl416f9dDqnEzaKPFgfnfS6xfTXw1ks8xKYouR4c4zGRDBTVTKiQehA0pmnn5BuVRKXVBPrlUX2ZWIzjXaP/2yp1uHgpcwmi8yBM4wlO4hy5GZSceNO3vpMjwtKF4lF3C7XuwG6b7REITk1b4RAblc0UC6IJ9PMdE5MdREoCzCOV5J6B0ELRRlUJWavEY/0rzlXEXrpymkpeKd78CElOnDuj5QOF9gYetT8TPRfVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdzwZQaN4s4+JkS2pytaaUyTqweOMt/zECPaLoCEJOw=;
 b=C+8G4A8OJzjDPtUXpX4DpDyq+tuwZKZcWlNDDgLiKD1YOrEa6+X+vxSm1EBjCSvyoWdvSxBlBKq0xEGILVC0ylGLH8NsByqTEAR4Q11Sh/Y5rxk6F7gkHfDfuOCYBGTGpFBNSBS0+X046jwLKNdg8Cquu9aHoRNiAEaw12t6CR8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB2894.namprd11.prod.outlook.com (52.135.126.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Wed, 6 Jan 2021 12:04:39 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 12:04:39 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] base.bbclass: Fix dangling NATIVELSBSTRING
Date: Wed,  6 Jan 2021 04:04:32 -0800
Message-Id: <753dd31d17c544d8939b6369a5c866ab140ea247.1609934325.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609934325.git.liezhi.yang@windriver.com>
References: <cover.1609934325.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR21CA0017.namprd21.prod.outlook.com (2603:10b6:a03:114::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.0 via Frontend Transport; Wed, 6 Jan 2021 12:04:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82e64266-dd3c-403c-9d54-08d8b23b3ebd
X-MS-TrafficTypeDiagnostic: SN6PR11MB2894:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB289458470CD9A07D1BB68B0CFFD00@SN6PR11MB2894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8vOLS/IW1hoBbrQd05/ipKqCfDVLPV84q2cCs5h9SqyoyDsepy2kpOpolvvyiWvHWui3JSZoExxLeWG5zQRazoKAc8a/KdGlmBzz879Y8vJm44nE/RI5IbtODEJdr8XE1Jf8rFK1sEoZDgCV2gJ8EvlbiMJnv5YEbIcjsAorZp2DDJdYeT0eHVmtlspiz6uav8dUf2xP0xFjXTUiX+98frkTbtHWnBcU5Cx1w9kOR+v9p8x1jPUVd7jglSP1jSKZCxZZ4hWPwti+hzAhmiu94/dWHr/tAi1EcTfVs3LJdLglaJ7BDRDqpxHzTFmwHmQmWIioLp3rpi0Hblw+xgzEwV3PfT+uVDuA9QI9bz0dZqg6cSGcaaWeiTVtU5uhg5IiXZnAbUBeh4XCD/IcC8vwPutUyWE/pPAuvhWI59qSy5EvJBPq0RlumqguP3oRp4K6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(8936002)(16526019)(186003)(5660300002)(52116002)(6512007)(4744005)(66476007)(6916009)(26005)(6506007)(36756003)(66946007)(478600001)(316002)(66556008)(6486002)(2616005)(956004)(6666004)(8676002)(86362001)(2906002)(156123004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?sWBcN+0S1dlzSVuIBBt4+fRabOlo1Z1AwJsp+0g6mxTBmDAzMnhPzLl1qh8Z?=
 =?us-ascii?Q?5Ia67y8A+LsmF3ov8w49gyJOPnsnlHU78Vu0Fxbzp8BCSCcQBctJd5LPoniC?=
 =?us-ascii?Q?GRXRaIum3lE7NmH9TlK+uS4hMg2GHCeDavfi+sTOXPcypGI0FVX5zI7iOF8+?=
 =?us-ascii?Q?Y5cW+6NDKK87jHCwqCghh4yNA/aYguRYkPlqtdtxrYsQwIXIeY/F54ysIyW2?=
 =?us-ascii?Q?qKZsAxwJmyLNe4B3EAxSMmlJIH8D3S5r95fjn46uD86M9iCT6GvIQyo4Frlk?=
 =?us-ascii?Q?dX8vHrxczG81/bwrld6PzOCtln7QCFy8TdQWmSun8P1lYuwh8f876MtlzKt0?=
 =?us-ascii?Q?n3Nb89V3eAO5i5KJfJgvRJ5FnNEvVyyZ8HCvQH0Sdrx0zpn/9i3hYwgI+suz?=
 =?us-ascii?Q?VSueZ3IpJWgIXJE/fjqUG2cgulb4bJ8NAOLz8BaS/Bs029SPiQMt1/mdudCp?=
 =?us-ascii?Q?zUXI/1kHhaDqM1+uAd+ruZpnJxBPwu3utqRqcg35g3/lTOeKLkqPuhBHhpW/?=
 =?us-ascii?Q?qkFnlnI8huZ3XYBmK45AcF+VCVPYFJ6ruzpLtVsD1V9sTOlhOelU69VZnzt1?=
 =?us-ascii?Q?lyoCaGs8oRybdrljKH4K2wogjuXn+t54PGeIVroB5QLHcMI5spJNqJHfgNNq?=
 =?us-ascii?Q?VKvDOORvQVggBYKruwg3ubIEKIpfsrUnYJbRKtoe147Wxa+0bKiayZ83X7rA?=
 =?us-ascii?Q?guAx5CwhJNq66ZyWNvXuaMvp3tm4d3qDpt9fbNlinosNyGKWXczg9AkRwzz1?=
 =?us-ascii?Q?kqBALv0aQxHcRQXtSnr+3jDTSdjbcBf7Jiw987PsfjfWZ7u9/CUlQX+o5E1T?=
 =?us-ascii?Q?bNFIL3DDXXxordo5tl6mF6cyypCG6cBb3DeapKw+U2y+9bHXnRs5G1aG/8Ve?=
 =?us-ascii?Q?01jCM+h6dlBwyMtOyvKv5JJGt5Ffwt2RJNxN5iuQDqD2GCVhxF9K3SL1U3lQ?=
 =?us-ascii?Q?VPPPGO7jwgx8+/reXIS7BdYjUc0JAuNNSeI8PZjl40RW7jWqvFrnHWbb0fJS?=
 =?us-ascii?Q?qCbN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:04:39.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e64266-dd3c-403c-9d54-08d8b23b3ebd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85ED2mMVdY402bnWh6uzw8woC6cAfva0FciclINDcEoKdfixMJRfsqvIp9ylyR8eUU7jQ53KJX0eLsyEVeU5XPw2+TSBl7nXrbuuHVYmkY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2894
Content-Type: text/plain

Fixed:
$ rm -fr tmp; bitbake quilt-native -n
Build Configuration:
[snip]
NATIVELSBSTRING      = "ubuntu-18.04"
[snip]

And when run bitbake again:
$ bitbake quilt-native -n
Build Configuration:
NATIVELSBSTRING      = "universal"

It has been changed from ubuntu-18.04 to universal on the same host and build
directory, this is because it is overridded by NATIVELSBSTRING. This patch
makes it print the correct value.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 78ae28bb0f4..aeb41efd24d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -208,6 +208,8 @@ BUILDCFG_FUNCS[type] = "list"
 def buildcfg_vars(d):
     statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
     for var in statusvars:
+        if var == 'NATIVELSBSTRING':
+            var = 'ORIGNATIVELSBSTRING'
         value = d.getVar(var)
         if value is not None:
             yield '%-20s = "%s"' % (var, value)
-- 
2.17.1

