Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D6ECF6A8B
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:18:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2876.1767863892959227001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=H2gySjGv;
 spf=pass (domain: est.tech, ip: 52.101.66.54, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nG+Ie2v/UyOC6THqbrfWsDdHneS44s7Z2sbznriyI6y35T391fBecnM8WwAKP3sxlscz273Eij8DX1oQtSpsg2+bAh/H52l5yRdzHRtunSHlyrv0wA/3lZA6tTKIuhFxqIBrmqNVO5QNIveP+M29Z4nalaX+tykcvzFzAVMnnthTr+xG2VdjmoYGD4MQyZ0G+UC9TPywQ/8fS7tNuuuES/ggADT4csTMQLhTkyEFRTyubAj51BQQIciGGCnH8AQvzPCP5VkL+B+n2ZITI5gJz78GwvRVtwVFZzl1uFWwOFhvcv2x9qKyl1d+jxLiqoBgjOAjZS4qCwm9ML8yNdKBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vfc72Pa5tflwNJ1uMr7BMo+5SnX1Aeks2dJ5ueKt0E=;
 b=EWe87nk5tYZHGc3VTbcxHBA7Se6HhVsXxRekTzXn2LPXU1N/yf0nq6WdOo0wl0CsDbQor0TQjEjf2pLx2Lka6oX5uNDpuUEXxWhcD1UxLxGA/48rsLZQ32duGK6wKFQXp57ISKsllNkK7uqB7nNys2+i1vP7LNnvP2Nurj7jIevSuKZvdo+ZE1sOZjWXBGZNzGqzcoUXIn+J5HQxLSNYsDhvPwpuwFaSVdkM2/H2cU82L5kJxnEaI0gH0I8zozfObR02EYfB3KMRA7l1heApcxWiNiitE+4z6ug94ZkjDqKo5n6P4VJpWf8ZjZHm+L1h1AFUjNisMdncbyRQ/3+FXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Vfc72Pa5tflwNJ1uMr7BMo+5SnX1Aeks2dJ5ueKt0E=;
 b=H2gySjGvbXy3Ak3TfmCYonJJbjBW+hjSOp9K39Bq+tqWQoTwxk2CgwkP4t2zmJpe0hN5Nqg7lizTE3lP/EuO9qlJDFJXiwsuPToxuDKBa4fQ1Xv7j1nxNGq0CdEJZFEVws1cT5iOPnqUNage1azWmCJWYzhu7E3AfvWuLtJYCjWZb3X8aBXZSlQO98Y2X0bFw21+SdbaF3gDVnOGZ+QX/LZhXD9PJjwnUflg/89YWTm5vbmqKfcG12V64jZvSRKJv8TlTW8A3IcLAyMiwgHQy8WAxCBMogGpDG0xNB5UE0uT/UZmGKaMIkYxrkVq5k/ylVWEHL5AZ1yqP2DrOjTeyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM8P189MB3144.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:32e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 09:18:09 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 09:18:09 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v4] libyaml: add ptest support
Date: Thu,  8 Jan 2026 10:17:57 +0100
Message-ID: <20260108091757.9546-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121131306.19079-1-pratik.farkase@est.tech>
References: <20251121131306.19079-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0362.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::7) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AM8P189MB3144:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de87821-cb2f-45f0-a0a2-08de4e96d6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|7142099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E6fFDBQE2iahsHisut1BybQa6f4ucd0Ueu8Uszl7srmJM/as0C5NUsZ76cRa?=
 =?us-ascii?Q?HM1EvvmaaOuo3gku9evkzg+3YomK++iKzYk3NiXkqkqEuuth8zVGI6jfvX/0?=
 =?us-ascii?Q?Sp+dLDAWdEt2UPgwHGqHk1x0zysPC5GxU2YtIvHM1TVacW5hiNj+R8V7K2YP?=
 =?us-ascii?Q?AY6tvpakksvqd4fqgWc3Wq5X17trPPQ7QtkGXGyrvNnrZivVrSJmEwWWv66q?=
 =?us-ascii?Q?bfMh0Y0y4fm0m7TXPbrkF5uO+8+UJ3YbGv3+nP3kGXQd1whWLUOxa6HYCG3E?=
 =?us-ascii?Q?ikiuP1KkcvnfrhYPCd58vRou5K7MZ7M9H1V4Y8pRcoPUquLSZEQaREFeEHtC?=
 =?us-ascii?Q?V56fn1QjzO5Tn49SmvcBOwMUsauEuQI2YEVXAl9i42T5u4B/+RFopudjYaqr?=
 =?us-ascii?Q?/9rVR6xgAVQ8UxI5FRugXv/cfPxv+Mpt3EuvoGndxAHilVSMSlJieursopuj?=
 =?us-ascii?Q?fWxsn597gm++T1dT8ali74D589qW8K8+NxnKfgoRcrpTU0EC2r5NAZiPh1gr?=
 =?us-ascii?Q?L2RuiC1n9Cg8Axai9pFVnmnd5fU+U1lii4VyURBF3TPdUYt64epiQXpbuC3i?=
 =?us-ascii?Q?QEAD1xHlca6/U1mkFRta8T/td6BC2Aw6iqaCz+R0+5g6mOAG1bgCOKYDMYXX?=
 =?us-ascii?Q?TFtMemmAGcA6dTTY15u9n7folK0ZNRnhYFEZy0eXewxyX7oZdKvqCsQIk4cW?=
 =?us-ascii?Q?6/9JYOG8D2wmU1uib1+PiiqAP+8dk+jgFeH5mN0j4TP25NwiAoQBnxahJLjl?=
 =?us-ascii?Q?MpTjJPm4c+6VvRpVWEtLfK2FHnKfjhuey63YbPRGvXNJ1SQtPmIE0EjJFOKK?=
 =?us-ascii?Q?NQdaAreXW8GuMkMrIUlKRjAxv529SqgpsBQC6dmny+SwszHIYv+bb2s/pBzC?=
 =?us-ascii?Q?xncU6Tao7OswozDa0yNMNX+N5V3aj1asp5nNdWIWDOrsaHizToqja6V+F/r9?=
 =?us-ascii?Q?YWhH+8XVQNA2uWXfuuch6jIXbU4Sf75z88GG4PvhJS1KNTunpbScLZDck8K6?=
 =?us-ascii?Q?zCiydCMHjlqJANLhuh127KVmh9n6EVrHHQgpNkMZ9V3QRHK7A+pptvaiHeiT?=
 =?us-ascii?Q?qD/smHnfDZ5zOH7hpUK1XT22uAKds+8CTQk35jDUKu7vcb87AY2niwUYqjXL?=
 =?us-ascii?Q?IbpCZlqBSKqsxRIQpAchWS2vhfReGseM6lkGK3hYyH1PUmGqAJbQWRSHg7IZ?=
 =?us-ascii?Q?cHnQ5vVRMrz0D3xKnJtZ5nNGU1KJ8Fw6DUQCR2Y6AuJ6bm5Bn9DQ8RMeMGCf?=
 =?us-ascii?Q?VpNHkzARC8YsLxZabidcoV1e+tof0IXozMX2zUoqNOG9WAKMBfqXdYKcJU6O?=
 =?us-ascii?Q?M8iI9Q0czUsRSjsGqxIzM+DUxRJ7Y5oq/kADJBpJkqTRkv6Qf67YN1aLiR4f?=
 =?us-ascii?Q?ySlMRmJSyYw116ntHr2du4Cwuz8vW5dUPnoUZJNtzz8ObbF2ulhJcOzSmZlH?=
 =?us-ascii?Q?YrVhxSZe56VTAbzRNEWMlCsm3NtVWWKz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tfo97J7Z/hLWP3XDY06G6ljzYvA1KREGlEQifyWLvk/pOpbXyfZEx5WX4U0D?=
 =?us-ascii?Q?cdZs5oTIQW/7bTlOUamYvOPoESpOWHXjmAbimKazC0vcxfCvF8bpf2ZX2MLh?=
 =?us-ascii?Q?4qbTRbToL1d4QkEMYRaazYuUSEuJHsqbfKnDz7Vgwjx3D+S9y0HDeM0ZG6LC?=
 =?us-ascii?Q?NRxnNzq44IseJIzLTO2mceqPLHgLvtehRVQnzJANG2LOb0ba6/1s4KYmMJM/?=
 =?us-ascii?Q?TPtNq/kY2nX72qWWQSwJjVXyGR+xXxXmOMUwtHYRr4dw5JGhY+vr5h9Vaq+8?=
 =?us-ascii?Q?rEw1W/ucTdTX6qrnL9/RaMUXRVQkUZWX7fPu2qurrYsN7Q6yryMgk1i1W1CS?=
 =?us-ascii?Q?/80U1i7dCmqO0ZdIglV/Gwa+LegzVAQJ6fVux7T/+fcaT/2Y1JfY66dorJ0r?=
 =?us-ascii?Q?YviDBUONVNDm6q/z8acKCs2PlL15Pzejl+5dva/XNTbfsgupfm/PHAYfK4X/?=
 =?us-ascii?Q?TqpegxDKYpTREF9baiIPQAEv+/vwJSsotLI9ARTSrBGirtauPDI8+k0kkmIp?=
 =?us-ascii?Q?o12DZbX+kex7/sj0+pfP/6K1h09My/KgnmN3141fdvu/m/OOXQUIfA4vujvp?=
 =?us-ascii?Q?1xhcr/60Hu7Tmj0N4pCPSNZFiP1ndOb7IsH5BnuIKn5BWQ9Q721QNIwAVksp?=
 =?us-ascii?Q?hfdT3Oh3j7abJ8ViBlpgcX81H9O4UCf+K8tyKqrcPplIMZiEm9pO54O9RtFM?=
 =?us-ascii?Q?M9gJ/qZsLu+NDWxItqzGUxOOZb6pZ4LK9XlrzWqno6sXzYIpuJLIXpaF0yEa?=
 =?us-ascii?Q?hulE+cbv+ESQrLOaohP/cOJCePhahFwICIjbJa54WkFd/Lqu2ijfFDkPi61d?=
 =?us-ascii?Q?r//8e8mcg5q4KZirhq7fxeGCN6UJeA9ekswqYtzaTE8wAUwAhgl1TbTUv4Ad?=
 =?us-ascii?Q?jj6dHLh5jyOAscNjOjNoT5EFdFX3SGtL/6Ri/CAVvLVmbyl+V6R87cG4MqNT?=
 =?us-ascii?Q?PSTP6WgYkK4pJLU6TMEUWpJa2lEpjkYl/jE/jgAKMT/MwmEt/VVC0fjXvPeK?=
 =?us-ascii?Q?9kTgsuL2kwxBlATnTzYx6osPtmZzbmtSW3kAbyPf3W75ml6Uw6Rvfw7QOM+N?=
 =?us-ascii?Q?WMA4VoOblMMMJz7tFCunegZ7IcMSVAXFL/jVDOZrNhAidYpvk3WRxqCjbsK2?=
 =?us-ascii?Q?HlvA7nCFl0cOWw6Trbvn75R/JFEVa76w/DpsJQW4D1ULFg6+8jZazYgEYfKV?=
 =?us-ascii?Q?C0c77EOQXN9QTfP/GSeUPkJJCkxECNTr9rIBs7Bf7z2zwQq1er08vVquD6OB?=
 =?us-ascii?Q?FbeST2LNRPoaDpXpl9CLZ5aFZXgm1CPadI9p7hH42OqxPVaZyY1we53bcxPX?=
 =?us-ascii?Q?wwN2ablRQDSV5mD9xRZRFY6/3G9APHlIjHjhdmhzk3oGj9DLAgwdLbW2PqNk?=
 =?us-ascii?Q?a+QmBHdrjuoYX0yiEO875eZVElULHsFrsQegOBZT59QCnSFB+Z6DX6fvHt5b?=
 =?us-ascii?Q?yJ9yE2VBvInsiXF++Z+fX7vr1pc0QcxH2HWIjGbTy3aFD4+Z82l+WtqOnNMy?=
 =?us-ascii?Q?PEUEsZoJ4jhp44EwQAEv04OgzsRHGp5qIu/hSf2cCCQN4zMO7NPLdYs5GDhZ?=
 =?us-ascii?Q?koNWBVatrd9dFiF0c8uBPtQlo/fZNBGHiNJ6OKtEYmhN+ngXNctVV9R71f5c?=
 =?us-ascii?Q?RmqeAPlaAIV23b1wSZIcy0CI+Hh1wzlNMoXqhLEUVZNJ9UYUU4a10qM1pTXz?=
 =?us-ascii?Q?GENO03J8DLrIH8UI/2/G0ajJKMPKyQKF2p4/Llwtol2N+7gT8XkcEjP0mDuC?=
 =?us-ascii?Q?QXRkJaSJxw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de87821-cb2f-45f0-a0a2-08de4e96d6a0
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 09:18:08.8573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FB8CvYS8Nj9X8tQ5XDz7ApQ28H+w6K1PIOhFPxTeqevaNARqr/gsXmZyjNszND3t8rhBD7K0HdxhgjROZd+z3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB3144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229046

Add ptest support for libyaml to enable running the test suite
on target devices. This includes:

- test-version: Verifies library version information
- test-reader: Tests YAML reading functionality

All 2 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libyaml/ptest
checking utf-8 sequences...
	a simple test:
		+ (no error)

	an empty line:
		+ (no error)

	u-0 is a control character:
		+ (reader error: control characters are not allowed: #0 at 0)

	u-80 is a control character:
		+ (reader error: control characters are not allowed: #80 at 0)

	u-800 is valid:
		+ (no error)

	u-10000 is valid:
		+ (no error)

	5 bytes sequences are not allowed:
		+ (reader error: invalid leading UTF-8 octet: #F8 at 0)

	6 bytes sequences are not allowed:
		+ (reader error: invalid leading UTF-8 octet: #FC at 0)

	u-7f is a control character:
		+ (reader error: control characters are not allowed: #7F at 0)

	u-7FF is valid:
		+ (no error)

	u-FFFF is a control character:
		+ (reader error: control characters are not allowed: #FFFF at 0)

	u-1FFFFF is too large:
		+ (reader error: invalid Unicode character: #1FFFFF at 0)

	u-3FFFFFF is 5 bytes:
		+ (reader error: invalid leading UTF-8 octet: #FB at 0)

	u-7FFFFFFF is 6 bytes:
		+ (reader error: invalid leading UTF-8 octet: #FD at 0)

	u-D7FF:
		+ (no error)

	u-E000:
		+ (no error)

	u-FFFD:
		+ (no error)

	u-10FFFF:
		+ (no error)

	u-110000:
		+ (reader error: invalid Unicode character: #110000 at 0)

	first continuation byte:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)

	last continuation byte:
		+ (reader error: invalid leading UTF-8 octet: #BF at 0)

	2 continuation bytes:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)

	3 continuation bytes:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)

	4 continuation bytes:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)

	5 continuation bytes:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)

	6 continuation bytes:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)

	7 continuation bytes:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)

	sequence of all 64 possible continuation bytes:
		+ (reader error: invalid leading UTF-8 octet: #80 at 0)
		+ (reader error: invalid leading UTF-8 octet: #81 at 0)
		+ (reader error: invalid leading UTF-8 octet: #82 at 0)
		+ (reader error: invalid leading UTF-8 octet: #83 at 0)
		+ (reader error: invalid leading UTF-8 octet: #84 at 0)
		+ (reader error: invalid leading UTF-8 octet: #85 at 0)
		+ (reader error: invalid leading UTF-8 octet: #86 at 0)
		+ (reader error: invalid leading UTF-8 octet: #87 at 0)
		+ (reader error: invalid leading UTF-8 octet: #88 at 0)
		+ (reader error: invalid leading UTF-8 octet: #89 at 0)
		+ (reader error: invalid leading UTF-8 octet: #8A at 0)
		+ (reader error: invalid leading UTF-8 octet: #8B at 0)
		+ (reader error: invalid leading UTF-8 octet: #8C at 0)
		+ (reader error: invalid leading UTF-8 octet: #8D at 0)
		+ (reader error: invalid leading UTF-8 octet: #8E at 0)
		+ (reader error: invalid leading UTF-8 octet: #8F at 0)
		+ (reader error: invalid leading UTF-8 octet: #90 at 0)
		+ (reader error: invalid leading UTF-8 octet: #91 at 0)
		+ (reader error: invalid leading UTF-8 octet: #92 at 0)
		+ (reader error: invalid leading UTF-8 octet: #93 at 0)
		+ (reader error: invalid leading UTF-8 octet: #94 at 0)
		+ (reader error: invalid leading UTF-8 octet: #95 at 0)
		+ (reader error: invalid leading UTF-8 octet: #96 at 0)
		+ (reader error: invalid leading UTF-8 octet: #97 at 0)
		+ (reader error: invalid leading UTF-8 octet: #98 at 0)
		+ (reader error: invalid leading UTF-8 octet: #99 at 0)
		+ (reader error: invalid leading UTF-8 octet: #9A at 0)
		+ (reader error: invalid leading UTF-8 octet: #9B at 0)
		+ (reader error: invalid leading UTF-8 octet: #9C at 0)
		+ (reader error: invalid leading UTF-8 octet: #9D at 0)
		+ (reader error: invalid leading UTF-8 octet: #9E at 0)
		+ (reader error: invalid leading UTF-8 octet: #9F at 0)
		+ (reader error: invalid leading UTF-8 octet: #A0 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A1 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A2 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A3 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A4 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A5 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A6 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A7 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A8 at 0)
		+ (reader error: invalid leading UTF-8 octet: #A9 at 0)
		+ (reader error: invalid leading UTF-8 octet: #AA at 0)
		+ (reader error: invalid leading UTF-8 octet: #AB at 0)
		+ (reader error: invalid leading UTF-8 octet: #AC at 0)
		+ (reader error: invalid leading UTF-8 octet: #AD at 0)
		+ (reader error: invalid leading UTF-8 octet: #AE at 0)
		+ (reader error: invalid leading UTF-8 octet: #AF at 0)
		+ (reader error: invalid leading UTF-8 octet: #B0 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B1 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B2 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B3 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B4 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B5 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B6 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B7 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B8 at 0)
		+ (reader error: invalid leading UTF-8 octet: #B9 at 0)
		+ (reader error: invalid leading UTF-8 octet: #BA at 0)
		+ (reader error: invalid leading UTF-8 octet: #BB at 0)
		+ (reader error: invalid leading UTF-8 octet: #BC at 0)
		+ (reader error: invalid leading UTF-8 octet: #BD at 0)
		+ (reader error: invalid leading UTF-8 octet: #BE at 0)
		+ (reader error: invalid leading UTF-8 octet: #BF at 0)

	32 first bytes of 2-byte sequences {0xc0-0xdf}:
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)
		+ (reader error: invalid trailing UTF-8 octet: #20 at 1)

	16 first bytes of 3-byte sequences {0xe0-0xef}:
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)

	8 first bytes of 4-byte sequences {0xf0-0xf7}:
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)

	4 first bytes of 5-byte sequences {0xf8-0xfb}:
		+ (reader error: invalid leading UTF-8 octet: #F8 at 0)
		+ (reader error: invalid leading UTF-8 octet: #F9 at 0)
		+ (reader error: invalid leading UTF-8 octet: #FA at 0)
		+ (reader error: invalid leading UTF-8 octet: #FB at 0)

	2 first bytes of 6-byte sequences {0xfc-0xfd}:
		+ (reader error: invalid leading UTF-8 octet: #FC at 0)
		+ (reader error: invalid leading UTF-8 octet: #FD at 0)

	sequences with last byte missing {u-0}:
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: invalid leading UTF-8 octet: #F8 at 0)
		+ (reader error: invalid leading UTF-8 octet: #FC at 0)

	sequences with last byte missing {u-...FF}:
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: incomplete UTF-8 octet sequence at 0)
		+ (reader error: invalid leading UTF-8 octet: #FB at 0)
		+ (reader error: invalid leading UTF-8 octet: #FD at 0)

	impossible bytes:
		+ (reader error: invalid leading UTF-8 octet: #FE at 0)
		+ (reader error: invalid leading UTF-8 octet: #FF at 0)
		+ (reader error: invalid leading UTF-8 octet: #FE at 0)

	overlong sequences {u-2f}:
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid leading UTF-8 octet: #F8 at 0)
		+ (reader error: invalid leading UTF-8 octet: #FC at 0)

	maximum overlong sequences:
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid leading UTF-8 octet: #F8 at 0)
		+ (reader error: invalid leading UTF-8 octet: #FC at 0)

	overlong representation of the NUL character:
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid length of a UTF-8 sequence at 0)
		+ (reader error: invalid leading UTF-8 octet: #F8 at 0)
		+ (reader error: invalid leading UTF-8 octet: #FC at 0)

	single UTF-16 surrogates:
		+ (reader error: invalid Unicode character: #D800 at 0)
		+ (reader error: invalid Unicode character: #DB7F at 0)
		+ (reader error: invalid Unicode character: #DB80 at 0)
		+ (reader error: invalid Unicode character: #DBFF at 0)
		+ (reader error: invalid Unicode character: #DC00 at 0)
		+ (reader error: invalid Unicode character: #DF80 at 0)
		+ (reader error: invalid Unicode character: #DFFF at 0)

	paired UTF-16 surrogates:
		+ (reader error: invalid Unicode character: #D800 at 0)
		+ (reader error: invalid Unicode character: #D800 at 0)
		+ (reader error: invalid Unicode character: #DB7F at 0)
		+ (reader error: invalid Unicode character: #DB7F at 0)
		+ (reader error: invalid Unicode character: #DB80 at 0)
		+ (reader error: invalid Unicode character: #DB80 at 0)
		+ (reader error: invalid Unicode character: #DBFF at 0)
		+ (reader error: invalid Unicode character: #DBFF at 0)

	other illegal code positions:
		+ (reader error: control characters are not allowed: #FFFE at 0)
		+ (reader error: control characters are not allowed: #FFFF at 0)

checking utf-8 sequences: 0 fail(s)
checking boms...
	no bom (utf-8): +
	bom (utf-8): +
	bom (utf-16-le): +
	bom (utf-16-be): +
checking boms: 0 fail(s)
checking a long utf8 sequence...
checking a long utf8 sequence: 0 fail(s)
checking a long utf16 sequence...
checking a long utf16 sequence: 0 fail(s)
PASS: test-reader
sizeof(token) =3D 80
sizeof(event) =3D 104
sizeof(parser) =3D 480
PASS: test-version
DURATION: 0
END: /usr/lib/libyaml/ptest
STOP: ptest-runner

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v4:
- Remove conditional check in do_install_ptest
- Use libtool --mode=3Dinstall instead of direct install from .libs/
- Don't redirect test output to allow debugging of failures

Changes in v3:
- Remove redundant executable check in run_test function

Changes in v2:
- Remove hardcoded version from test summary
- Remove static XFAIL/XPASS/ERROR lines (always 0)
- Move PTEST_TESTS definition above functions for better readability
- Auto-discover test binaries in run-ptest
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libyaml/libyaml/run-ptest | 38 +++++++++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 19 +++++++++-
 3 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 06d113e264..6a0c23586e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -49,6 +49,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libyaml \
     logrotate \
     lua \
     lzo \
diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-=
support/libyaml/libyaml/run-ptest
new file mode 100755
index 0000000000..fa7d9bdb5a
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+# run-ptest - Execute libyaml test suite
+
+cd tests || exit 1
+
+TOTAL=3D0
+PASS=3D0
+FAIL=3D0
+
+run_test() {
+    test_name=3D"$1"
+    test_bin=3D"./${test_name}"
+
+    TOTAL=3D$((TOTAL + 1))
+
+    if ${test_bin}; then
+        echo "PASS: ${test_name}"
+        PASS=3D$((PASS + 1))
+    else
+        echo "FAIL: ${test_name}"
+        FAIL=3D$((FAIL + 1))
+        return 1
+    fi
+}
+
+for test_bin in ./test-*; do
+    if [ -x "${test_bin}" ]; then
+        test_name=3D$(basename "${test_bin}")
+        run_test "${test_name}"
+    fi
+done
+
+echo "# TOTAL: ${TOTAL}"
+echo "# PASS:  ${PASS}"
+echo "# FAIL:  ${FAIL}"
+
+test ${FAIL} -eq 0
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-s=
upport/libyaml/libyaml_0.2.5.bb
index 0d8e8762d5..3587f2f250 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -7,14 +7,29 @@ SECTION =3D "libs/devel"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://License;md5=3D7bbd28caa69f81f5cd5f48647236663=
d"
=20
-SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] =3D "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2=
988e3c02678ef4"
=20
 S =3D "${UNPACKDIR}/yaml-${PV}"
=20
-inherit autotools
+inherit autotools ptest
=20
 DISABLE_STATIC:class-nativesdk =3D ""
 DISABLE_STATIC:class-native =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+PTEST_TESTS =3D "test-version test-reader"
+
+do_compile_ptest() {
+    oe_runmake -C tests ${PTEST_TESTS}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for test in ${PTEST_TESTS}; do
+        ${B}/libtool --mode=3Dinstall install ${B}/tests/${test} ${D}${PTE=
ST_PATH}/tests/
+    done
+}
--=20
2.43.0


