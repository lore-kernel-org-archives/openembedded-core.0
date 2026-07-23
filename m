Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AD7C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:32:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22361.1784809935332926123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bXjXdHtT;
 spf=pass (domain: est.tech, ip: 52.101.66.45, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzKyxxhZjV8YYHcFGgO2JZhdJIJycijQfxk9smGnBNs2lYZ+qviWpzN8tPP4m0IdLiYZ4BkCbCeFCKcJjA+8nq+eTpx0TTtLlQmfjolTGj5e/vtjqvwLKmCl2BhcE2X0b7z6B8QV15RyOlxraW5oa2HgW0bUxMO4amUYWEKHPR0tgqNUgs9WGfIG8WihfARShYdXbtiQCXVBFDIL1gEcOr8vrtQNLWOKV0SyhfqGSWBWOzrFB9a0JD6thiEW/rYYe0aEuL1krW0Y9L7Dbc/cNJ5U2WAKknWJr78aoF0cDLitfRDMk91WEwNMhSZOGP2JQsm2zFwe0vrGJZRhrn0uZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APP1oPUeg1Du3XQ5hw5Z5kSrFf5M9b711CbAj6T0op0=;
 b=Ms+WwPadOfmYaC2V8GQsGNmu0usmS7Pw/YHuZQ7fGcMMzB8z1iyj4w5MUAkcl94z9S3E5ChJ4tZ+b//0WzAk3v44ssQoo6ZKAJTzHtxG3AmWWF1xvO+aG2CEBQrMsuvf5DAanbNq7/EbVIB7IfNVkSNIsnKvqEPucmH8+bkOgaRaeTx4DrIH6c3OXx+j5Ip0F1C2o3xfSEMncmmEaezbPnCq3/L7nj0wTNJPgbavAECp0LvlATbnDZ/foJbAucR0PBuvHfCPz6Y750NtGPcCy60Ur6vEdtbZuFyGEYq+93VOdw0iWBOXBz/E09jpwLQJh+ufKPpCvMpmdC/sSjnmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APP1oPUeg1Du3XQ5hw5Z5kSrFf5M9b711CbAj6T0op0=;
 b=bXjXdHtT5XLWbeE/8iR2Npd/QoIOOJYLTz7jTn8zwcr/E7UqKg+RHx2YuVwfR/MJx+3268yfkBhRSW+waV00zByMP5Lti4L0Va+q3LkCFk3PfBbMxLmjLVGyn7kfQjKEIX4ilnSGuNPpoSXR5I6CeTAl2hePw2WaYk8cwgTYzXzYZsMZhWrsaXfzONIdBcE4CRnBModNO5ybgcdyP3Yk9SrqJJKAk8HYLW4L4fyaehZ9AUvQ9100255kkGhjcEHPwwngcATLZ25zi23xhB6436YPcnh1+TUNSAsEDhz0YBwLt7GoJkY5F72kSXGfDJzLyZGbmEz53X10dXDCsibdlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by PA1P189MB3603.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:500::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 12:32:11 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 12:32:11 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][wrynose][PATCH 0/2] libgcrypt: fix multiple CVEs
Date: Thu, 23 Jul 2026 14:31:53 +0200
Message-ID: <20260723123155.795532-1-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::8) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|PA1P189MB3603:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b891cb-2ce5-4e56-2567-08dee8b66aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	k1vIMDFaR5ROju55pg8ngQrAGq+x+M6Vicv8YXDakMOCBuWHyAmM9Pv5lFplPs3PDf/Qizc6Tw3+0pQGvcRMxMcYJactIzPz1rKU6y0VYg8wXBiI6nWRz4fjysL+cDuMSuqmzUcQVVC1kLDMjvqfwMjTW2I2d0uv2snFl2SMHUjLb2nWZxLRhOb39X0YOvHGoVfQczlQZszqLpmc+vTZf06qsypzUF+lrmjMuqCJ+jqRNlbd/h/3WmhUV1Hf3gcj0TNQ5M9eya7Q2yCLlv9RgBn6h9/Sc9eUHF0JhQ70q0mQxjzV3t+f/jxw83yULBLnyxFEhctKKhBkDL03/coEyEiZyVqhGbgmLuwfNB4pdTqD1NLg77l/YsIcbJ4Ak6exn7XWYjJh8r4bMNmIHt3eoxYg1dART9czphzwmmgW5x/NWeB6c2TX2vcKwaLmbfOiCDKjrtXXsAwAfSLek8utRVOPMgg5YCrxxCO7ac35hFxSckkp5fYYMtif+LAawKZ9GOmvi1RuOiNAfoeIyQRnt9e0rN1E2TYtHA3GHOfYXljbotn/ivjbLwrmdBnMr5CruUhepcW0xFmSoG4pcybmrD1muGhfeAPRkaOq6ch65N39nfwwWcqoploV+qjXGo+65xnBjZPgix4Z/xxGdh2GvXNCJ/aCglFpKBQIHmT7KyY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zeJdyEKRigkO0OPEK3JhBV6CSGb+QmzMrFXC6N7KROaSBc54KXD8wlJDdsl6?=
 =?us-ascii?Q?IzK65wFQHu+m9bT19GyAGwmTdw9rUr4STK+PemmwpX+aqTDNG6cYkSQHbYJk?=
 =?us-ascii?Q?GvfE0HiOIu7sy5qgJV5K0Xo9/R6wC77PB+qjt9qX0hjFJUug50YQkwEmzgWM?=
 =?us-ascii?Q?EyUqlfskY7T8Z+Vq7eb3M+A5Yggq4U1j62x82k5/mnya9PvyFiyYNNmWXBa7?=
 =?us-ascii?Q?Ta4AUKke2EPlAAvcduwWXy/yj/4xUv31u+bWzyBHSp1048A3jwLMWhEZASoo?=
 =?us-ascii?Q?XPAb/cLxKI6dij4ZTTCZ8Gsxp/c3PnMWBKUIWaIsHrzuArRhuM8EyMnhOHaO?=
 =?us-ascii?Q?XnBTuw8CvcvS6QPe3jWByPp2m23tRupAkrTh/RmV9n47I5uYdkrxR263otnb?=
 =?us-ascii?Q?zdmG9kG09h1QePoCgxcNHx2+H4yUIjYQvgwzBi2drn14WYzgVVZMoh57Bkpu?=
 =?us-ascii?Q?f/bnAg4ktpp7NjYR5OnENf7fJfwmS0VydWAvc+mY5ErO6um9DHMtGrXyC8Dc?=
 =?us-ascii?Q?Cn3ikqUsHaR7dcN8Krcw4m0OAXieyoGyz+Es39IvANisagJTn+F4Y6BB5No4?=
 =?us-ascii?Q?VEsuXMFhhKhuwAEcK1+1aqwoKl4Aqf5jIb6nHTBdgpluQIWHyx8hnCaapgpc?=
 =?us-ascii?Q?VrGMBuvVGLGfI4ckMaj7BuOFaMv1MK9O6gZnd2q9qj9U46VGBxG5EWB1/4QO?=
 =?us-ascii?Q?HnGu3Cyr2SgLPDuN7edkA0d5T7pm+MtPUvuck1qeY3/TUwM0djsCgjCSX91N?=
 =?us-ascii?Q?Jkp2mPV1GUdzJoqn7d7QQjeMs2THL/fqhyas7kLzGX/ajsKquX07gX7TbrJF?=
 =?us-ascii?Q?gr7ojydG5KPz4jT0980ZcwqaKLWHatxvJwLqMtoaxr2hO8U3N2rmFH97Ad6c?=
 =?us-ascii?Q?xlsNXodf5vMWbf/Uzi0pLck/sdzIuTN8wtZ2p8RjMe6KYCBHh/7HRtTR/MC+?=
 =?us-ascii?Q?O27w9VfOVQv2vM0F7F2oiPW2ESr6hcsErtX/bOyDDXpck/qCEZ59GjE6/Gaa?=
 =?us-ascii?Q?Ni+n+XKdeLCLTu7s7zL6AU3c6xpDoU1SNsWYjF6K5XFOUGX0SeRkQ/TaDKun?=
 =?us-ascii?Q?pekfxiN7itd/MpbxXljC7Y3XQvQ/dDoeJ+uOhzbZywLVnRkGRKsPpwCPmRjH?=
 =?us-ascii?Q?W4Ob9SeRfMzihKTTr5vEGtqG6JG37CuWdn4UxKCW4p852uUkIFKXpi+G5KES?=
 =?us-ascii?Q?YXsoM5R95nh6YGYb/5d24ls8ecsahHuf9or5cN3yBqVDQx10/Zg2rYfy+Kcf?=
 =?us-ascii?Q?Gduj/eGZpQ33dMVl44qOEqHvZMD9jxQQ5ZhHA44LnP6VVo9fs+5ELJxNHtZ4?=
 =?us-ascii?Q?vi6v0/YlliJ68onvmbBBwkborWEgeHUv76bFu6PW+NpVUoz9m9ugcz9t3r7y?=
 =?us-ascii?Q?/Bvew9wgIcT6eorgOwTr/dAMvznYNyc/0I7u2qqSCqCXTWv0wBJf3WchL0e4?=
 =?us-ascii?Q?8T0FXA7C6i2/fQZOVxOuMYkvxbYffyRAWVHtJ+7gTJmIgYjqdHx+Q3jXyWuD?=
 =?us-ascii?Q?vO6YFABD3NsLM/sdmPidurAvW5VLFxHCMA15qGvIhjFf//atHqf1GxY6FfPS?=
 =?us-ascii?Q?lQjzg5cyapqF9qtkH9t+534i57jRCKljjcnNfbAq1CKAL1aKny3v7Edi7Mh5?=
 =?us-ascii?Q?PaWO//XRwwU6pdrAF3jMwWH+WTtWcwq+NCWkLoUUjU9dwUkgj3zGWL6nIjjK?=
 =?us-ascii?Q?MzYEY5QlWXiriZrKKsf/SkSINCRoDRf+q+1BGtaIu48DeVGsNWwRLxDrZZzW?=
 =?us-ascii?Q?uGeJO12c3MXJqFjm8H9GBDSZ/Fo1Vzg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b891cb-2ce5-4e56-2567-08dee8b66aef
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:32:11.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPZ2HPQUft8nmtMtBvbuRspaNCI3BVxsQdkmsCivYxEBF/s9UIRQpXYDY1hZxKXd3BN677F7y29dAjJLWGm3amH+Y1k7WFleOlIk9j6CT4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3603
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241827

This series backports upstream fixes to libgcrypt 1.12.1 to address
multiple CVEs.

Leonid Iziumtsev (2):
  libgcrypt: fix CVE-2026-41989
  libgcrypt: fix CVE-2026-41990

 .../libgcrypt/files/CVE-2026-41989.patch      |  42 +++
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 ++++++++++++++++++
 .../libgcrypt/libgcrypt_1.12.1.bb             |   2 +
 3 files changed, 360 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.pat=
ch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.pat=
ch

--=20
2.53.0


