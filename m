Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D074EC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:17:32 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43314.1784708218571660923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=kQmndleG;
 spf=pass (domain: est.tech, ip: 40.107.159.70, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXOpOQGA0EPYCdTzclQ2l7cBt4wvpNk6pUrgzZsNWStBOGgDUpAzTHct539rK1XdlCLXqGBiQC8w890UxFo5yUUFCPCxAqDAGwZYTw1hp08FhDeje5iG9z2j736yGKPrF2j13TG7ipuaCV2C7BZSkfjTYp59Td3Sxi19s+jykxD6p7763ViRVSby9WpZmoVBU0JSTM/JVNibTaSOUU1Jzoh7vhUmiROTPUL2p7jZ1Ol0JWKONrYtzFEE/oLtEC37DwzhHMb8MZP+bhKnWR5tJML6qDZEhf30WSpNY0VL+YdxsMhkVM+pJACyNZ0TLCRyeWmRVsi7z9ZUgYZFyxPe5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph6F/b+gtt2ixaqG3NuyU7yMk5DfAecHCfDGj6mjgWU=;
 b=p8aVo6BK6XKYWRFb0VgEtApz+lqMRHv8PZAyN9+WXYKVxAhfzlrRC7bUfSxvTu7wP/UsQNcX/vslhS+pCFn80LnZaCAvEj6vubXNXxGuiNAwxKEIfd7CQkXuaIY1dnU1/yWKV9aJjmBleXPs2niXOoTgIjxqtONby3QHtIU6GuylJ6zrXefeWD2CXG69vpYv6KUaVboK+pTJL/4+SFAOI9n84zS0MZV4u4jmNvfLdj6tJI0YrDFFUuir8wktplaJuMjbzZsSsUuQh7FK54amhP6S0yFBVHenafsC7mZzjz2ldBgM1GlHc8Lhwx/HxT/yJIe6N5X9ae8IW6vXukKHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph6F/b+gtt2ixaqG3NuyU7yMk5DfAecHCfDGj6mjgWU=;
 b=kQmndleGU3zaEnsdCCfMbKwspFRX7vjyhIO9JB0sO3lyfuxznXw8p4UHp53lh7IDQr/bx/oVaN5EapSk838rXV72pInFfW9+QZo6IYo/dxhDPtbRjW9M7/e6o3UkGlN1AbsH/J+gaYkGWsAygQ1+4I/PlTtMo2/scSIeagUJosRbbXObR8xvsKipjT0EEaUgYxzb9csELi0Lzhy8VJTLhLTgyjH66YJvUdS4DrfzEoBVQwVr/NtwhuqEQrk4nrv+XzpXgoT9IKJT78l8cM5YcoOBH2G1pR/IOOI85cuoDWZGePi5YaHqy1Dcos1Vo5LCwYS1Rnr1dBkw+Zfk/zP3ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV1P189MB2129.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:16:48 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:16:46 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] wget: fix five CVEs in wget 1.25.0
Date: Wed, 22 Jul 2026 10:16:26 +0200
Message-ID: <20260722081639.14702-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::7) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV1P189MB2129:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f22c34e-f33e-4077-7ae9-08dee7c99251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vEX+yrBY9+eA2kVhCy5kdiZakP9To6J21E1rYOqv1HhKhtysI6Cq+ad3+92JPxi/wg+ypOO69SmbyPoOBIVaGQ5fWItaihdO2xfUtwPmUOjd5EmDUMjY9iXYsDHXcufYaOp0thw8MqispAsCjIa4VdglYlulYS0Ig1XXZUJtJPYEWjrCDfl7JUmU0XU1EHtNI09CHcL8Gl6OhbQzB6FHPcdQDqOKobILWmOx6BhvU61CztnqROoj1SqO+AWInOxQ9UWXL+LZvMky/h2PXvkSCodZYSKIuL6r5Jc89Yz9OW2qnyY42gKOG/JDQqoDAbRrL9Qhshaoea3XgBKXr2/8RICvVzpaobXQhZ+KfWgx0NXuFA4uhxMUYFcX5kenbYvciSZCXB+vK+f8gVjB+r7L+HWWXBwTnqxHtz7yytEjlu2wJ7bDSjWBdscxNtXpqlE/roTLyLoqm4mQz0ao+kLibH2S0PTumr1nO6V4E+nV2OoWS59Wz2oqzK04aHKmefRTPbQjsg2eKFefuuJ+AnRJHspPE0+cV1JzQiiiPF+3aJT034JSmo2QjxcqSA+fyUjgyerrtiPbSAwKL4blHJqjT4mLRLq9raR8TITgBdWfCaRzLhgcdkG/C3LNZlhULAgwG5D/6swBpwTSg91YZOFWv9Z5v8FXJGicfa629MQHlko=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?62YgY7mL6kr6mRm+OBtoJWplLqLHfIzf+oY7kNNStHOBg1WyNb8TwpVDMJwV?=
 =?us-ascii?Q?pZr11ha0EH3n13Xg4myty8IIfx69Ir1XLmq2N0S2XPmdQvSwQEwXiGtt793u?=
 =?us-ascii?Q?rd2dhin/SQxhOTIjqcIMsnk65WvHdTehsw27gEoNBk40Mxz0nzVLbjmjxVud?=
 =?us-ascii?Q?rdHU5qC4wR++PEd9vORHyGhijQkOSaOdFFsefEHrdmk7dnS7QPqCOnuqNqGW?=
 =?us-ascii?Q?eW0QLlNhwNBReVO+ppeUcCCPiDtbDXpju359h6XME9H0x0foQ6Ka09VoT1nd?=
 =?us-ascii?Q?s8y5tgI16+wP9y/akhIrubVeeQ6gN0fnhn0GE4G9cX8ZarytKxh0xDkgxy4G?=
 =?us-ascii?Q?yUhgbSlrumamXOeLVcBoNFuLK616qgywojn3HZKOLpnZ7st1N24kf6f69CQD?=
 =?us-ascii?Q?SwmkGT1BQuOAJlV0w51vl4UBOefLWAsUSuqDqCA0rmYl8naA83CKgYQLmtyY?=
 =?us-ascii?Q?n1MHdeOS6dLQUS77GpxH3flkAVI0p8Fo0fdRsMiHl8/sOpiM+LqQ/YJg03xx?=
 =?us-ascii?Q?ZpFuxZQSWdRxwM604Z7y/TnnsFQ4ARfuQry3531/mF9rP1C3ieh0KtybI7bp?=
 =?us-ascii?Q?unneFXmm+wTi5MrQI+aMRmWqjA4nxESeqyjL2DWA4td+dbixMw3nyR4MxdRj?=
 =?us-ascii?Q?+wkQG9dckQy+To+qySxA4y+WkMrrDYnatikeH+TgnSyXBJsa63EqDg+uIysv?=
 =?us-ascii?Q?n4fDdA2cuXiuDqJ4DPEAtSsYCBDyBOkqysroK/WsZWZJPq+i+ySay2niqglq?=
 =?us-ascii?Q?ZikvWbvW8KXtj2Zd4I09tX7m08RmuU5mOFy/rGxqaBIj4Uv//eVcQ2tlQ+GN?=
 =?us-ascii?Q?nTntzWnksa+jm9d2xHOFXMu3j5NEb4VGA2lpK/srnV74QNb1RzwLHg9Dkmyk?=
 =?us-ascii?Q?+C7ZO37X+jFomgtZ5XK9I0HpT94uVwj2j2D5DLT/5eVaE934nAvMGSPkMRqA?=
 =?us-ascii?Q?YQBf7M47OwkgmZacUXkh0DX/ZzPocUCiGoVZhb7aRTKN7BgFLb2FlBgS9baY?=
 =?us-ascii?Q?JsV/qhZ8up+3mD11xcMQHcvUS5ZM2v556GhvJAmIvmvJeWC5+VN8LseGQRbe?=
 =?us-ascii?Q?M70Lq0XTK9ZT8E+BafuCw+OapuiEYlhO/Kr7IBKihQxgS/MsKlEDvsQlFyEr?=
 =?us-ascii?Q?ZR/DdFu1Xq/ovHvNFbck9VHXn+r7yXM8HSpJPBtep2ZQIkv8MroENVbiTob0?=
 =?us-ascii?Q?CQriTiadoNZwnY7xhtN8svdNZS9X3swSS85QYhS08m8zWX9Hnba98jV4fdM3?=
 =?us-ascii?Q?yAsjrAGpP0T9TG+mZmf3ygWhOT/E/N2njx5/C7ciVWlWvK5kSkrlO5KL1ySj?=
 =?us-ascii?Q?79sou/TqQSwvAs0NwGyVuTD8N0YXZQwcf7wMqMpR3cOYdZqWSxwR77FiAH2f?=
 =?us-ascii?Q?vsKEThklz442rV8yVh6LLdMmw013K5RimXZT9P9o0a7ojMX8ILeHNhlmH/Jd?=
 =?us-ascii?Q?4/WZgNHYdgS9+HKiwnxzUxSD/Tp/JlB/6m5VkahUEtTvc+BurnB18xnXcQ6g?=
 =?us-ascii?Q?ADoysjFM6TECbmOqaef27LoRowVSfbHYyZblV0IZe3ZATT4zJY6lwVsS0UEh?=
 =?us-ascii?Q?Tw3A91fbWP3+8UHcpWhJtSQdYXk5QqtpWpBpuelp/ISFSKLuNXKsYvBGXiiC?=
 =?us-ascii?Q?KUDKU7vwTnY+u4AtvrLmkeolhKjxQvIiX1YXAf1gIabnY1mjczesIoW0I19Y?=
 =?us-ascii?Q?bIR9TMR0kA4Z+Fm9HK+YiwYG+YxcAJn8tEoTc/3KWSvfNmFVNNcErBzxQqN/?=
 =?us-ascii?Q?CfpoQiLgKg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f22c34e-f33e-4077-7ae9-08dee7c99251
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:16:46.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pC7L0D5NX0XVMI/byBVDNXkxwippBULvq1BBB/lrVkBOamWPBiM15JV5SyMAIlwYnwIYtNtWz0J4rIm50tHilw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241608

This series backports five security fixes for wget 1.25.0:

  - CVE-2026-58469: buffer underflow in metalink string trimming
                    (clean_metalink_string)
  - CVE-2026-58470: integer overflow in HTTP Content-Range header parsing
                    (parse_content_range)
  - CVE-2026-58471: buffer overflow in filename encoding conversion
                    (convert_fname)
  - CVE-2026-58472: integer and buffer overflow in HTML entity quoting
                    (html_quote_string)
  - CVE-2026-15146: SSRF via FTP PASV/LPSV response address spoofing
                    (ftp_pasv, ftp_lpsv)

