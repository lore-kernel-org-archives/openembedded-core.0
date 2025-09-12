Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6A5CAC58E
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 02:00:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5236.1757642395788743032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 18:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=etuI/Edr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13502c760a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C1ZdHJ1181280
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 18:59:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SMOunHPboSfJ6xJWrOhH
	PFDFxjSXlv80CUF8EtRRVK4=; b=etuI/Edr4caUzt/+2nhIQmqlRtF1REqTsUan
	tJzJOOQuXv6a7p3a/RrLayMvEC4Jm1A35xcJ/Gjvugcp5FQ4ZN7ISKIMwGKRnBCC
	ZqEMophrs0reyy4qTjL0w+BA3nghDYeU3X9e4I+ITWcGlUbHbezyBXwoJ84GCrkO
	3NNY3C1PXV7cxVrw1Fd6ePA06qpNblX+zNpKqTeNbJdUqS0EbIxOg+nGC50Zz/ft
	/cKm8BQ+TJOLOzLNk9S+VlZNcrQnR2+5o/gmkve41Fl1Of40cKZ0WN0bGDOKrNZx
	1WkBeAwyLAkMu93kHROq/Tit5rP1AI1ELB81dVGw097uNt36rw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490g80epy9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 18:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqY3idhc9KeMniavUBMyzkPOC7KxDudIi5Su9Fc7TUVqlqY04s+O+QE8A6GSVKFTRBXKmQ4CBwD5gMu2PsXp9Sujo5C9/DP7G+BkiCMe/K+hrwFYQjTidhcFeIusBWOGQRnjYvUJxaAJA7HcfEavOV/P/W8TGvQ5FzHZ/L5wbaLQD0r740Rab/hR5hgbKN4rUEqWrE9hYR1ujEC4V6+mQuGadfW1HSCE3BTPrqrad39zxKBECDMmwIA3wA1G6j3ME6DK7bmexcFMQeLCnCxHQwP5Acj0xH7y7E7CfOtq15OUmkpe5m3tkFiuXMy7Zhmkvxa56Xea4NqXY7tK5/y+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMOunHPboSfJ6xJWrOhHPFDFxjSXlv80CUF8EtRRVK4=;
 b=U2U2L8JVACFbhSP8584b2dmHptupd7xLVvzUA4PBThiukZsVHXQF2Tpldz9ABSbXyIAPWiJTXZudyCOxCgM58fx7ZEGvcAegQb0hJFU1IHmm7rT/zJFmWOqYZIx1pPOlaxGg4zEX4jd3QzRkE8A7zYGH8ugglGng68eFWBXA3vbPC3Fyp+o0/h8wDsQM1xyBLJwRtKclkUsaOU4wP0sWT0IFdNojQ/R5llNYNB5YBnK0YgUkV5OGv9T2ZxYDEbtoDy5o8Q1lrQGOLBH7IAC3T9RwozsWSXvMjUvS2Uq+FSoHVdWr4FloGhINFua29d8k1eRqgXzaX/iaO43Bp+niag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH8PR11MB9458.namprd11.prod.outlook.com (2603:10b6:610:2bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 01:59:53 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 01:59:53 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v4] buildtools-tarball: fix unbound variable issues under 'set -u'
Date: Fri, 12 Sep 2025 09:59:33 +0800
Message-Id: <20250912015933.1169516-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0239.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH8PR11MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: d0067370-0ddc-4a22-b52d-08ddf1a01062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yFHb9CmGLgyX00/68/sD3LedGnFPDlRseIyyLx6gklJedLcSHVKixCOCc9wd?=
 =?us-ascii?Q?tndvqNit3fnffD+BALGfiKOpK14kPgakb3+DrCePQ5Eih3IMo8jr4Zr4A/nU?=
 =?us-ascii?Q?DS5ztFix8wRh9Jx3tCVa8yCeq91jJJfRG5BUj9aHna19mQLvAb67evCgLoxF?=
 =?us-ascii?Q?LzNYhM56CGxnkXmQWZ56OEVmjXTuGkOayu8h5DhwSsSziWuEISRr/fqMcpZE?=
 =?us-ascii?Q?Ia5HkYjN0pDkqVL8ki1+yFXkcmgFeQVueNP8JcDAkwEcpk88jgDvwXzu6jhS?=
 =?us-ascii?Q?P95LhU+FtDE9OBsp+7syB/M8pp+kbNXxyuUqUurHgq9nBu6g4CSLa/Wjn6VM?=
 =?us-ascii?Q?7B/k4+yrSyw/cGE9UTnOuKsvChxnevIGlmGmZBlyhUkI0Kj2Z/zXyehfW3fi?=
 =?us-ascii?Q?fnOR8j3n9w0GWy5tKz8+K+1LxA8Qh3TQfCalrq8AY2LEO+guH14jeThqgmfv?=
 =?us-ascii?Q?Ps7R7JzdTWL32v5dANaWR15E75U5HQuaD+ketmpjb4PXR0A60r2nKYJHzM8r?=
 =?us-ascii?Q?9AFGg1HNtXI0FFS8xd2BsjVpvcsFD6VyimBWMC6vQ4Oh8rgqaQ84tWr7xxpl?=
 =?us-ascii?Q?I+7CjPEk4mpvYh8z+tBaJbniVhV2/xBVmmyGru4bjFslM++cgASJcTQRsKRk?=
 =?us-ascii?Q?aT3H423+TlxXlPwAXo6RhwvX5M947iv2zNSeE2b89q541fXSxTDnPKO43luF?=
 =?us-ascii?Q?DY1Tc4/dZs3BO2ON1SiUS67jFZdhItQInnFPhwNZ6m0S+L+cJcpceMNgyUUk?=
 =?us-ascii?Q?ZkQsRlQZEILb78NvXZnnjd7Zj0JZ8L1zKqBtc/xbJNJhUr8YK5ma9G4X3tOD?=
 =?us-ascii?Q?VcHxqqmwY/MIKoQVys072H4b/wItGaN+/CSwFjM1cfqk4v/xIbbWqBBHa2H1?=
 =?us-ascii?Q?iVzPAAEnmUjKInU6+6yAV7isC09qD4Q3xbsuXZ8VF/W7WdFhUBhPUInq5RBw?=
 =?us-ascii?Q?9mU6MRgrpTwAb5lMEKygfiIgY2aXiKtomUM4dFwEeoyKbg05rZRJemVTMpOH?=
 =?us-ascii?Q?18sCIuFtnd/eP9pBCi++dgQpzexB0bVUr17CNxpYDAnhHz7YjQTIO5dXlyvj?=
 =?us-ascii?Q?9/gAVgHT2hHSFQf4DwBT+LFXIjneB/9LbDGkWuIgRCeIBzLhwDxOfMi+cX0X?=
 =?us-ascii?Q?a/X3bT4KcKssH/y7KlKk7C3fis22+6PXRSfTW8SPHSDsg6SnLjKJ28+llA7I?=
 =?us-ascii?Q?+14leC764+P5zpy5PhC/9tK1qdVy9UBRsFRQo1nV7TOVYDb9l6ApLFXhbhx/?=
 =?us-ascii?Q?Td10VP/BGrAas9fiZeJPDru3Zr7vkwt/3zL542fwba7CNqdbLZSyzS36gRAo?=
 =?us-ascii?Q?GHMZH/IEYwhHJL+OzJyqCP7iwElBnnvskPzSt/ggytpwe4otZ/seT1CD6hl4?=
 =?us-ascii?Q?UJ5xGqlZH1WdKtnKEJTH9GkH2Ept/FINbu1QhKx2vrzWdzxUaSsWHbtxcjJU?=
 =?us-ascii?Q?ys9ghjzpK0XURe+L3lzomhEfs4HaIZ31Kz/7uqVGgU5I+J9ln5ZinA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xk8ZcbI7VEEzQGXIbm+HLnLU3LVqRGq/eubtPzkFMCoBKedsxNnS5h1+FPar?=
 =?us-ascii?Q?nCT4LcGpQBeAkVIR13C0cDJcq7soht7SdnK7H1LmfDLt9nh5e+EgfBLM0fv4?=
 =?us-ascii?Q?S87bnU1pBnqlNfoszw5xindiShyCuo3g3l5VpheKHiXFPJYRjdmtdHwyF9ik?=
 =?us-ascii?Q?GNsjpeoUCMPFKvacldmG0ShnAIk+wJPQIYev+ImsKlGX3XsLD1KmilzAStEr?=
 =?us-ascii?Q?s8I19u2WVO8x/1GBNOSFeuak3ZklkadB9Oaza5g1sDsbcNnlpms/C0DEpNC0?=
 =?us-ascii?Q?D80kfHYTtjss4PNgC6BnGvFQDTE+vtQ/yEyDF2X7YX/E05ZXkx6Tja0h1uoQ?=
 =?us-ascii?Q?yH9zREfTMFgfu/oZZYD/5VCmik8dovVUQYtfOZjFQFutsjK6KNPvSUGlaPL/?=
 =?us-ascii?Q?AQWrKN1izxEwCwHUW6BxkrYp6lRqZ3Tc8NDmy5USSe/K+XAKwNX0Q+b62MyR?=
 =?us-ascii?Q?b+IZQOGKQy+7kSl8paS02oSmgLve2nFqe2k5hbzV9OMeNxy9j3+Fx4irqaic?=
 =?us-ascii?Q?pwcgVMdIIAglEKA7ARYcRaTP8CQGAI+2M/9WBql81DbffNoWTgIlB+wMBs8i?=
 =?us-ascii?Q?V9ibvS7sQCykE4hODbePLIYahz/2pQVxP0t0KH7x19tBl1YRyxxgdjIt3afL?=
 =?us-ascii?Q?Tq/nTFhNMwBQXEK056gIdTgNdIHavTmZ+ztmwfsG8wOHVvFyWK5+n5Cy4J7a?=
 =?us-ascii?Q?R0uDSKNaJP/fOPNrZJwsEaDhGGzSmzAaPmdWkDLq3fEmmUomfE8E+qoV/2Bb?=
 =?us-ascii?Q?TZ0iEp4RIKJ9E2GlQAj+GprwHnUA4Z5uAXrU2g5VzOXXjVMgKGtjDtXReSRC?=
 =?us-ascii?Q?9v1jgClPuE8hL5YqO5zNK6lhJACKdwkR1Z33bHvhXLN8Oj6CSP+1mPUTZeSV?=
 =?us-ascii?Q?psc5tmJVesHjM/50OcgzY9IftLj4DaDBo8hni7aWCnZTbpASX2N/URuBlhNt?=
 =?us-ascii?Q?juvj7VoEteCJD4UXkZ6z+9YnzFf5E3S9o8HLxN/VEc1qz+6WXG2DKSFyxKMT?=
 =?us-ascii?Q?EGmxcbXm1eZqUuALYrLre0stIOs4QJtn9Iq2Ev/l7lsRm5nHrf2Ov+BC6w9K?=
 =?us-ascii?Q?Idf+60R0FDtj1tpD2wb0gA+bH++NAIuGFG59gMrVwlSajUF6eLjnrl1d+EmV?=
 =?us-ascii?Q?/bFODsOBOLwexzFhh1UYOE3/hHMXYW1BHrMMeDUhSWQQqQWGCiI/ZiHg573n?=
 =?us-ascii?Q?GuT2phy4LVU5L3sSiIbAtbTbMbUkFQn3dAfRY+LlUFlA8OZHr8/zLaV+U5LF?=
 =?us-ascii?Q?oT48ftZa+6/drDP1YEPbrrbjxdVEB9XhR5/oAX41OPlNtJHEUMHPm8iAb/S2?=
 =?us-ascii?Q?ZZJT1EJSRduEJ4p23g2j1KOnzlC7wTDOBOWbzmOQhxO2s/fZO3dK1K4DpZGM?=
 =?us-ascii?Q?eX4YDKxG3ww8O+9uK/jCkU8y8SdsSTbjohhQxactUY2RniV1Xtm0TBHbYr0U?=
 =?us-ascii?Q?zE/9Wd3YOcus0m46e3KqMcdt8i6vazKSG5gVGZSJpj2scjm6WrNTLyaJZdvR?=
 =?us-ascii?Q?RmuS4BP1HJEfyP7s89yNO2uh0D0lI3rB/GqEnEZ1q3nYI92/Yu3OCv7R8Ksl?=
 =?us-ascii?Q?ZSo65zi4NCoPrbrkcJZb6bH2/y0qRlxM/SMjGGacUpd9bBLNqav0ESiZygMj?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0067370-0ddc-4a22-b52d-08ddf1a01062
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 01:59:53.2398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSlKAU03qd1CzyoCqdzbnybrr4nH02bif++7teAQjg2DQvWX6qVL62+jhOY8hy59Scr7Y1r4JR2tFxFoAez93J7raiXmqUTshEErd0C5vdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9458
X-Proofpoint-ORIG-GUID: w-dLMOlCJ-L6fewC1E0bvdJdOLHMru2U
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=68c37e9b cx=c_pps
 a=5SMz4P2gKhLJVQMJtRKoOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=G8RaOm78J5cyyXkNedkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: w-dLMOlCJ-L6fewC1E0bvdJdOLHMru2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDAxNyBTYWx0ZWRfX5Q3eCiemwj/O
 CGyuxEOpd+YyrIQr/ee7+ehWOfIdU+F/5nPMsWcTznXPMDIhNL7CE3/PaudJl4y7ZiCMkRFZMn7
 UIYOYMoFA+oIgGbMNmUBOtjWV+Z9rzYqcSSFoGo2bhd3MMCzeCYHGY40JYhDFNm+Qc1M+I566ck
 GCX9FfVAPlkJWmcsXfE14Qu/9lmiAjv1S0jbUFqo1B8BdmdSsITT5kxe4sdmejTQgS0EYg0DELV
 GePfbEIJM0xn+MNWz7RcKu5K/PB3oNUTa/YdZWgttoYsbTWUL/Ytc7JG38pzTZTQbMxlk6WjRKr
 7zkV3PEv1x9zLv73oM1dgsQPPGxkC8pnOoCCk2tZqk5wnhb4HG7/eau/nq2YlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 02:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223298

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

When Bash runs with 'set -u' (nounset), accessing an unset variable
directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
is never triggered and the script aborts.

The current code assumes these variables may be unset or empty, but does
not guard against 'set -u'. This breaks builds in stricter shell
environments or when users explicitly enable 'set -u'.

Fix this by using parameter expansion with a default value, e.g.
"${SSL_CERT_FILE:-}", so that unset variables are treated as empty
strings. This preserves the intended logic (respect host env first, then
CAFILE/CAPATH, then buildtools defaults) and makes the script robust
under 'set -u'.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v4:
Change the tile to mention the changes.

v3:
Using 'set -eu' changes global shell behavior, so any later sourced
scripts also run in strict mode. This causes failures when they access
unset variables without guards. Remove 'set -eu' to avoid propagating
strict mode to other environment.d scripts.

 .../openssl/files/environment.d-openssl.sh                | 8 ++++----
 meta/recipes-devtools/git/git/environment.d-git.sh        | 8 ++++----
 .../python3-requests/environment.d-python3-requests.sh    | 4 ++--
 meta/recipes-support/curl/curl/environment.d-curl.sh      | 8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index c635be8acab3..d989a2279183 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -4,16 +4,16 @@ export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$SSL_CERT_FILE" ]; then
-   if [ -n "$CAFILE" ];then
+if [ -z "${SSL_CERT_FILE:-}" ]; then
+   if [ -n "${CAFILE:-}" ];then
        export SSL_CERT_FILE="$CAFILE"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
    fi
 fi
 
-if [ -z "$SSL_CERT_DIR" ]; then
-   if [ -n "$CAPATH" ];then
+if [ -z "${SSL_CERT_DIR:-}" ]; then
+   if [ -n "${CAPATH:-}" ];then
        export SSL_CERT_DIR="$CAPATH"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 9c7b5a92512a..fdfa721c3b2e 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,15 +1,15 @@
 # Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$GIT_SSL_CAINFO" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${GIT_SSL_CAINFO:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export GIT_SSL_CAINFO="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$GIT_SSL_CAPATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${GIT_SSL_CAPATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export GIT_SSL_CAPATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index 492177a9c377..400972814b6e 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,7 +1,7 @@
 # Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$REQUESTS_CA_BUNDLE" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${REQUESTS_CA_BUNDLE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export REQUESTS_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 7c2971b3dad1..581108ef35d8 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,15 +1,15 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export CURL_CA_PATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
-- 
2.34.1


