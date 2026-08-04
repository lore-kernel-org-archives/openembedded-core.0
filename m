Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2A9C561F8
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:11:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16077.1785849080505134966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZMnV+YEj;
 spf=pass (domain: est.tech, ip: 52.101.69.36, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BD6lcMEKE3QQnXNY2AYoX1N2mItJrX5tmIsXIJfkfFu3wnBlp6vihtrzPEcQ0UT2yLGLxxEHYsZ+oMXpiiqjaAkEkmBt4y59oWC6uJwKky2BfBloG/qYG5TKDrFj4rTf8JdhyQrXwaAJt6MhZ8zNRSKb6GWKQ9PVaGHXl2eSV8OC6BgDK4enO9tf81vljUpEskLoojyaUCSE6h5Z2LJDwP/83LB1NurikgNpyb7qbxiILjZuV+pYm1R+BYNFTKag9qRP3q/N7mAbWyMzizcJfCoWZvyMbvBWk8RBKsquVgAnPh2r8ixHne6tAUR+4Syo227Tzp5ty5ol7UKXfOJNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac5zgwtb2hGx1OTRDifTruVmzjRTjB+4Ya2zqV6LVAM=;
 b=H/kx9RheJU7LfQYNTnEZ68ZK1cu3deHcAY3AlIoXXe4mb+ib1odpvKFM+z+PBBs1e8OOqpVuyj36hFuGjkUfoMBvzzhc8SMzdhlhrV6nKCCxFAvQNHIPxqmps1qjvpCSnQvkUrXt9Xs/bXCDyRcvPLFG0pCzX7c24bzLh03If5s58iL7AO2xez9VQYY9/JyGo6zL//nsmXsldixyOPiWuxU8I17OHeYGI38fp7zxpGEtpsykPZTMe9LxDFyj+XMTI160JnI4mDbC+mumgiHv816Eeg8hcClm0m+nQRM6eDzVd51MUXPcmDP1N1vlG/nl8CmPZMtKeHM+vFmr3NOyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac5zgwtb2hGx1OTRDifTruVmzjRTjB+4Ya2zqV6LVAM=;
 b=ZMnV+YEjY7hOh/zmCU9fST90UaiZCDGp24ICvelan58jJjT7Jm490z/1RBSwoMMi5Ot+Z9Wj72SzdjHpMMYk4X0+iqTi90NwX8lzQpZH4Tzln8AvHBqgGLt2P34w0ptkvuSr7BwCgUAIFKRF8rJiTnrgknsz7fQR+hgY1oVzy4/NdJ8PXbpidRJU+ccu9dPe2aFn+THGvr8yY/3DeFg1HZ+pmuwE/4M6Bcpj86MfG1vk2/BLDH+fievYt5bwivRNb1ykskoQoRdgWkvIoNHx+PEkjZ3PravNtnaW3h0efqjo+FLTSsGUxmm/zoBEanjZiq5LdUXNNERbkHFECnohXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0858.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:11:15 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:11:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 0/4] libssh2: fix CVE-2026-66032, CVE-2026-66033, CVE-2026-66034, CVE-2026-66035
Date: Tue,  4 Aug 2026 15:11:09 +0200
Message-ID: <20260804131113.3588-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:10:120::36) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0858:EE_
X-MS-Office365-Filtering-Correlation-Id: 8317a74e-b645-4212-8d75-08def229dd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Je8FKSh7JduzKP7AgY/JT7ytBravBiTV4aA3WZjQDXmKvTKeErb093La3/IPFWKnia97ogMTgpIv88xEc0CU+rE1dzvJEjckRO4bDMxCtHDocA+PRGH2pgj6sKnEZ8U7wm9KR51ZciYUmec6QWaAIOITDhTsGxM1vRT7QoVS8Tp7GAgPgIr0nmz51O8qdsSJf1zkV9EsxxcQC0NTamDfYELPa0Btd2Tm8N6LTPlal40itlyZd9Cwy29L0rSq9ZcjICZ+uSbn4cCv5+XLtC0UadRKx1KvtiUFDxNMdQpdHIHjXHnub8iOkOh3iEPJMRQR0vtv+E9k/6qRvnsQLw4DcSwXAMQrz8yOv8NYtvuwPE5Ljtcbgg4l73uV1wYSftikHU5e9We2FwwyDfzRzOpxrJTrw4NYlBop37Lmxqch2VUMFp2xHtcprTy1jzCzfVTBWAZysyhBcHOPGtFRiIrgtnikeiq+/TJ6N5N4xwzQRmklIa6+GBpJpGkuV6GZw0HOardMMITzFqroqXNz8hCh/hq1qIkiOipaBYUdoJC+vVyfhH4FA/ly7MjQe39Ui988VYNDcMpBI6MZ0YIspQKZ8VMCrjn3W/orQOiDXqRhHaQh/ENXQvGAV/HqyLN4ER+iaJ2zMTxboOapguyG50YxaI6mtgWMBHg/NnIyUCv+Ufk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5c71dG7eOsaqY+0eHzTEbLi8kef2GfvxvNJoBnXdpUUqXRFNfso2pbWeuUtG?=
 =?us-ascii?Q?hC69x+NLLuV/afiswtX1m4LU0FCMRq6RUDLbd+VMa7sACM+aBncZQe0zRFzM?=
 =?us-ascii?Q?YhAYdUf0VONwqJ3w1qj0MDqZIujAdR3JxaLT5Dn9NnMZGXXZk0na2/ERSxxo?=
 =?us-ascii?Q?qRFffPHxztcR9qjdUNXp+YG/NnV4DTfMC1ESGGTdmL88BcNFn4At19AKgbdZ?=
 =?us-ascii?Q?RmlOxXVrZAk2t5O78ngZqRUZ7lXDZYsFt9UMUkcQ54ypJ82X76vrhYoMbeIk?=
 =?us-ascii?Q?FUMX2Are2uaHFSy3LsIvbtuGsJMH/kQDpt4pJgU3d0zqE44dmWg0QUK0w3Be?=
 =?us-ascii?Q?BFQMicBDlO7r4HwI3tihpySQ4Zoqa8fNVBz56hvdbuQ/DYhzPu3q2N4snhPG?=
 =?us-ascii?Q?Kpog3az2iMUSYo4a7sqqQs/SCbQXHXJ2NheHBP3wisDTYc+WjAf+41yOG3ii?=
 =?us-ascii?Q?DULpJJk5HQQwwGIEPl3CkheIH5Zl7iOfP8UUThMYZ0qqSKEJc3XDmf6UJ6kB?=
 =?us-ascii?Q?gMGQ8jbqq6xYP5FsuR2F826+3LsshFn8EB3WAWDzdlMA1eXHqC4sOzsheLPI?=
 =?us-ascii?Q?A6aDwDtr1CjC3gckFOX7MFfdjCeXGpZmtXeQCDCZqGjaAs7x+JcoonZdtPMK?=
 =?us-ascii?Q?oLGkgf5VSjDadvH8lAE7sTq7FzhIT1QDnV6JI/6T32Mmugs5+1zVTD+mtSpC?=
 =?us-ascii?Q?ebkA5kzatEiFfQjzU8XuBGHMmCdr2UbbYoWgrRhV2L9eVvrCUn8c3VxLhtaa?=
 =?us-ascii?Q?93utIFYdcjcc3yop3oys05lA0YAKfCrQkWUiLgnhFn5PSGSWVhgPaH596Jrp?=
 =?us-ascii?Q?Q+LzqJAfGgz0Em8TQ4TxHr6zA1Xf7ZvgjnwzbhgrsXuTtxIPWne1Tk4WLPqw?=
 =?us-ascii?Q?4ZXjLVXy5PRSNRqNV7Yn0HZJnWLE5FsVe1IPZ3ZzdugC9Vdejmb95e5eeBM4?=
 =?us-ascii?Q?pz0t+gHs2gxP/4sKBJxraB482SExLEkW4DBxCICXMVWftTmUHhqX993I/qWf?=
 =?us-ascii?Q?XUuGNk8XXWPCPiS6hTb1vSgQAOcCfL9emVIqKQbuIbSnwK37dw05Nddmn4Z1?=
 =?us-ascii?Q?zAwSHpbAxes3Dn6Lw3jnGaJYhJRHvSsm/Rth8fNQ1Bis4DAQng8o33MYiLN4?=
 =?us-ascii?Q?bJQfIGgSlwY1oC3nrvV/eX+SZCECszAAoAAR99hM/eE7a+OMicZT7ejWF/Vq?=
 =?us-ascii?Q?i1NxJsid/NAHT2opNXQN/xGl/r0OqWYqInkC3YWZO6P7iSwU55U/J8iY/YLE?=
 =?us-ascii?Q?aeQd1m6fGOVmw+4mTAAKJsre97Yh2RN+dL5yjlziUPYiux+BaErBpws9RELE?=
 =?us-ascii?Q?+B1Hv0uv4hCaOTbIYSnPC9249dSMvvL8Ac6cEq5jug3RdNk3q14fcwvZYUQ+?=
 =?us-ascii?Q?jpZrEryBo52hm8osD5npfgyWUzyfR4fCWY2uPrAHxWS0iRes5c8DdLlvMHex?=
 =?us-ascii?Q?0+dTpseakFFgjUI5TT6GS1Z6GMkhEjay+xPyIj57TDSfWxorW4SR5o0pPqgG?=
 =?us-ascii?Q?iHrsbAL+VDiXQ8M9gm/T4PZK26cRXS2oc5tmApJR3V/a9zf/b4HJg8ls/0Yq?=
 =?us-ascii?Q?ZUuniuKkvlvvnGKGqUR6zGhuHZAb3I5ObYZzHADY2kdnQ/NVKYQcwDQ67Jds?=
 =?us-ascii?Q?2Oj2/Jv5WThc5VhUlJzTXYih0iuRsUCT1kRVZrU2oPMbnAtf3Z8rvNrgoguQ?=
 =?us-ascii?Q?YAqWTvqDqWZljaWZzVHISS69mPv2PY5C63xJ9k5vYSelSwEV84RQ+txiyR6e?=
 =?us-ascii?Q?0pKnyyNyQY9UolHea/tENiSPp8CsJQk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8317a74e-b645-4212-8d75-08def229dd76
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:11:15.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcBI3v5WKSeCvvXEyvXwa1m8M7Ed0euJGNsDnGUZaOhkOCMGJixa5GM7RBh0e/Nx1kFmo/lTbQOoDzWvlCvnU/Em6s26WFwyIfVja2UiJeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0858
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242758

Fix four CVEs in libssh2 1.11.1 by backporting upstream fixes:

- CVE-2026-66032: dangling pointer in sftp_open after free
- CVE-2026-66033: potential OOB read/write with AES-GCM in ssh2_cipher_cryp=
t()
- CVE-2026-66034: potential OOB read in libssh2_publickey_list_fetch()
- CVE-2026-66035: potential heap overflow on ETM decrypt

Backport adaptations:
- CVE-2026-66032: upstream uses SSH2_FREE() renamed from LIBSSH2_FREE()
  in newer libssh2. Context adjusted for 1.11.1.
- CVE-2026-66034: upstream uses ssh2_err() which is not available in
  1.11.1, replaced with _libssh2_error().
- CVE-2026-66035: upstream uses SSH2_SAFEFREE() (not in 1.11.1),
  replaced with LIBSSH2_FREE() + NULL reset. Also upstream renames
  decrypt() to transport_decrypt(), retained original name.

Changes since v1:
- Added CVE-2026-66032 fix

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Jaipaul Cheernam (4):
  libssh2: fix CVE-2026-66032
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035

 .../libssh2/libssh2/CVE-2026-66032.patch      | 36 ++++++++++++
 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 +++++++++++++++
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++
 .../libssh2/libssh2/CVE-2026-66035.patch      | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  4 ++
 5 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.pat=
ch


