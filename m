Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3608DC02187
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:38:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.102])
 by mx.groups.io with SMTP id smtpd.web10.48044.1736869106533705878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 07:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=z5Tq31NA;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.102, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nr6gdsifzzJwuRozpnre3HjG2Ii5xchaXW8CGm21kOMS/wdsQZNvVrNxRACoNTvfj/EhaO8ZcLtMCyidciqNuxlBdo0/26p0qXzbSL3+KMybOvTuN7ZYuHr5C5rqJMhS49jexGOdAMHPz/vROld641yx0cwzRGYamrKRhzWxyQ2DRCAC9yzrZg7Gi8DTMYqvjHelUQe3FRWbhwsehhGLntnTfIJIB97/tYJ3xd648P+0qpP6SzeEQhLBxfOaVmun5JseX1npi6iylcSt7xqw4eWuwmLgBWPLbVtUZx2w0ITS7/XlafRMXhB2mpK9orASIgHj20SiA7tlKhz8t9LQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDoWuAQIwRNvDo7Ut4Tx+E3vyZGDpp6/msQ4YU61+4s=;
 b=fXVYfDVpjMQFDona0tcRzXLUP99NqSG2EpWigi42k2/cmM8wvKG50kiZfdvpR0Il0CtZYVsHOuV7GLu3qKWgGu0fuZVvZ9vOl0xHwhEth+anIpFPtNBJ97rVSyyF5uebpBokXyQy/bveQbcnpfFlML5N8gMW+XgWo6yO+MQe28H8Q+9u2l++BWkr++EB/khnF2dmRYZuEBGrmcX7rPa4/vTujHneGH0CVy2Y4BsXElWsXjdKvdZw0uyFA9ruWJjzqODhyHNHmLKbyWR0GUj1MEXq4TtJNBc2rk1Ltkyc6SW1YGyMCsJr6SycssdONZWh8LkXipO6ljFBPQVCjnbXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDoWuAQIwRNvDo7Ut4Tx+E3vyZGDpp6/msQ4YU61+4s=;
 b=z5Tq31NAT88UdJYv+OIe8IWc0jQivAlN/i3uHMpkBHnaHkmMqVtMvH+bZwIF91Kk4bwZDzpeknL/8gNixAL5eIxCItKShYl1e/Bl8whcqAFnFtjooaYiWgbDmWTuETOwp+i6fkUcqr2+9UtSvclS0hFbyG83p8iBhUamOqlFHb3y/0fLNCU16hrxXbrDuua968Zisg0rAu+0O/B/Ynv0L+vdx9XNbAzRcXDzD3z1kx5k48TapVwSBqCkvMYEvDUOYZEmRQk8N3x9NvrkE/lWGTYcz+DdrmQQVzz8UYa8MZM9TDVUozGF48SkZTZQCvjlzILs/Eb9xuXisPlEPa9ikA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9178.eurprd06.prod.outlook.com (2603:10a6:150:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:38:22 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 15:38:22 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 4/5] cve-check.bbclass: Cease forced symlink creation
Date: Tue, 14 Jan 2025 15:37:47 +0000
Message-ID: <20250114153748.2358116-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114153748.2358116-1-niko.mauno@vaisala.com>
References: <20250114153748.2358116-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::8) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f555386-aa84-4ae8-b5d5-08dd34b179b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hR73LFJLg+7v72X1zrezFxJZ8snTKROCATxzsTCboSxHcbNtg+Mcz+h8sPyU?=
 =?us-ascii?Q?D5R/20h5tIZkBXQ/aYDPpq6CcPkaEvBnO4ErBm7wLF8g3HVuSDPTAtNgJx1x?=
 =?us-ascii?Q?hK2Xg3J/8wbIvjGzHBF79dWfnYszPSi582Y+FrSI+VNuFE+jRXsx7/RBtqYL?=
 =?us-ascii?Q?PbbAxMIwgcG5wsSXBdB/QxgqEJmZ+YSbj4gx7iKZe6Vb+Mb5ahpfCBP/aj5R?=
 =?us-ascii?Q?LJHtY7DctDK9cbSOr6VYLqb2/TLj0IyP4jw+lMfqoHLTBiY3jf2rln4SNPaw?=
 =?us-ascii?Q?1qL9oMkARS2vuNR4KCSvR5oagJSn5ypLBuHnZm4SzZrO3XY+sJpq/aY+Ojwj?=
 =?us-ascii?Q?uwu1RmkMoKesncUqSnU0ddL91LbAlv2Wc2eAlwYp9XuLw9JojO5N78VJhVey?=
 =?us-ascii?Q?VX4QZUBuPlDkUo4TPICN3PNef/+hz+mOlIItgn4pcelXG3hm51Op0vJU3SRE?=
 =?us-ascii?Q?5xYo6NPfPOO9EI9zj5mNpxFi/DDB7+CjtzVNQOD+BRPJwBQesFwCpwpZwlnD?=
 =?us-ascii?Q?ogcQIYU35ca+1uQXRARjN6gXFxBofgvUJIhsVBCmpywn3Li/azx/hZjxmWVh?=
 =?us-ascii?Q?POP7QbwqgPjH6Y21CCWHjAumnTEcUfBOHWnbekx0xHOOQQeWxdjIw4xt+UB5?=
 =?us-ascii?Q?DCTkpyI+HUaTrXENEOTP2LJUf27yFrcHQ0z89w/I88J5yjE8rJA5YtmHOZJ5?=
 =?us-ascii?Q?KI8e3NsK5I62o3IlVz6ubRtsZG5nO123Ckd2WbYKdLI1WaRJRwJGn47BbMXm?=
 =?us-ascii?Q?FmoJZJV8dZ34LkgQDzDnrbitvmqbywcqUOJE9QDpyV8wkcs5WQ37An+y9uL9?=
 =?us-ascii?Q?HDRrijxYLp56+yuE01VvZRJ4bwmH3ZuMnQavGM7F0xn/NPcxaofDSmtEeY+9?=
 =?us-ascii?Q?PGh6ZBVJrcMEfFgYXfrJ+z8+9fM5PJd6Fq8w/N7IfWsCY0Y8wJwYrJ+5S7w4?=
 =?us-ascii?Q?t14Me5ISCrXkziewXW/wSgppKjF4eNIkaupf87lBRIosJ68nTTNdixG7ABBu?=
 =?us-ascii?Q?pHnYtrUsfhOissQcZGxZ6A/8d9qU3fGgsAQk1Sb0ylp+t51otbN0wBOCSeiA?=
 =?us-ascii?Q?DtjhxlpafWkt5atCbCXJ3PyIjucRLAUw6XBuv36wJJaoL3L5CXH8yCsGXvOq?=
 =?us-ascii?Q?3Lquaiy58PM3pCRqdDhHSFiLf7hAgguWLIudlsj7NJx0av5hKDS1cv+4NeQX?=
 =?us-ascii?Q?uCIafyjo8iMYPeoovRuuPcO0yo6/j8jgWHnntfkoifnPZ6T2TpKZGJQrIqtk?=
 =?us-ascii?Q?QqZ0bTtqFE0DgaL6syyTnz94aiQC+xLauCBuxG0YMJyAANj9eiupzac5uMmy?=
 =?us-ascii?Q?q5ncDBsRf9W4Ixv1W1RwS4JnpOaSt1gJL6LxGqHm+LRvv0xuSBVBWFt2Yoog?=
 =?us-ascii?Q?gVpwI2sSVB5WiFrjBbgPMcaQLsFDhrWTnzKrxufsBa3gGeAgzcCO0M45Eakg?=
 =?us-ascii?Q?l3TrWkIiYMtajHEUvokVVxcEXbBTfJt1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PKMsI0zR6YBWyAUmuiIrELhO8SWmVymqzoOU4nkZ3OCm05vnd9KEQdTAe6xd?=
 =?us-ascii?Q?uJ44jwy1o7LyYcawlxDHtsSK/X5HU+qOsNM6NP3pO7Xgsx5DgnlktSc5uZCz?=
 =?us-ascii?Q?SUaGKJDJ9Af7FFqas5rNAsGrZJ3UMG+6SdMpxopVb0t1I8y43tJXBL2rrFX3?=
 =?us-ascii?Q?d+ezqSvgxkmeZJm6Ns9TZUgD/G3l24PzXr4TWzUYXqlCq2Y/dy2ERCqhhiXr?=
 =?us-ascii?Q?9oHJMhsl16d6CevWptOvKMYVpVj17JgCXyJkEiqx3OUZvsCMresaPE+h7i16?=
 =?us-ascii?Q?2dqMrMJB2PksvFaG+QQBv2TPjTO3cbSqKWfAiGHZYj8WCko8fBqwziopmUcj?=
 =?us-ascii?Q?KHCMbVBySz6SZEP4t2bNq4SMIfCQwrATZTHQH3AV17DAxFrrT0Td9yFg9rYR?=
 =?us-ascii?Q?zhw+5Vux1eW62gumeuEssgObvrib4Pu+2gao4eWDk6MzuX36jXs+nNx0zZUJ?=
 =?us-ascii?Q?gEJguodF7+nn++DB6TEg3eC4JWnKp/ET1+5YE44/ZM97Fy3bz90xs00AmO7E?=
 =?us-ascii?Q?2OeeRbUgMfsWE7XhmsKWwVir9XXGR517xmzYM48eQv4ejS2V+PccFf1JDmXd?=
 =?us-ascii?Q?sniDzRPcEGdHZ35tP+A6Gg9y7DWUfhjsiFPd+z2elZcuX9aU9IwiVvY5fcxN?=
 =?us-ascii?Q?MrUZePbHK9tmCQ7yRYVgeAYhJZbiZmnFA4QQcYudFOz+we33kxlvdRKIg3vp?=
 =?us-ascii?Q?3Ww6/dmjWVN1X6HPHNkrQ1oLjukk5uNTD9fzRzWLWvCt0cHFXW1TbK2NxQz9?=
 =?us-ascii?Q?RMqllDmfH7qrUzJlE6qfVcAy9QImnJxI9N77peNtVnY2A7Ugze1DGCG2etnN?=
 =?us-ascii?Q?ozR+pmgyIXMXpgz7JEVVmNHDGBnfIz5ik1SCMi3Y+pUaaykiebY4kuxPTwyk?=
 =?us-ascii?Q?UgE+KrklTHPX6bHnj2wWbDyW9nnJvWGqwjpaRnEiHKK+0EFk/1wYViDQzyhh?=
 =?us-ascii?Q?QWZ3gKxnDmaXLkRljDWBDReRyZ3A8DxeUqePO3RpUjo6fzTWaJ6071Uzzn+j?=
 =?us-ascii?Q?T4DRDwWU8aF1/aMoHzoTIQk0cx/hxNBFBA25JdWyMTLq/pHAptPoiz0l9paw?=
 =?us-ascii?Q?1Sg73BEOl4X3ChNm5Ynn/VmIyFIp3AcrkjoyuNrYUTFNweB5jwY97ylaufgP?=
 =?us-ascii?Q?CboXTqGgtOWVdvWcn3S5laaUPsuY5M17fwJ3/zYEokjJ8FFXV+XAxPpof5uC?=
 =?us-ascii?Q?wQWYJl/QvFDiS+pJVFGs4cWWjnA+APGHLj3eufqYk0seXUIpQsyW9fh3tlNj?=
 =?us-ascii?Q?xuTJxGicjyOUn1afsRqIV3EQMa1gES20ndLngTCZS7M8YyJ84e5G2LdRCFJl?=
 =?us-ascii?Q?pxOqBYQMlutuLpD0r1KYPQAmFvhThKDNb6vbbW803c/SLgVaR3P4O5VtY0Go?=
 =?us-ascii?Q?0TWqIFRyjRUkYpxie7CaLLV72fVeLWOlPe7OUVjwekbXGMuao9TUaZxox1iJ?=
 =?us-ascii?Q?XA8u0XwbgIKnDd9MXfe6oICRxriORKoIAff9mILtUDmTzYMmFomOlu09JjrC?=
 =?us-ascii?Q?4D9jAPBJH2Mad6gh8vL+MwwFyBCkI0W4MoQgVQzLb7rjb+q37OrMK8HKGMNN?=
 =?us-ascii?Q?p2CD38PuPlqiuJZ8AXQ47wvbTEbqkegK4YETwAPefvRAiCDlaNJrXpBYwEFE?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f555386-aa84-4ae8-b5d5-08dd34b179b8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:38:21.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJpFQad/Pm3CGMrgsfm2ak2fRBWRFLlnA4rtMnkFRZtEKgbfGydwHjJH3IE3gXSim274l+yQFfvO4DcUjLB2dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 15:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209802

Allow the method to work also when the user has overridden
IMAGE_LINK_NAME value as empty string.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 9f0a08becd..53f6a94b63 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -252,13 +252,15 @@ python cve_check_write_rootfs_manifest () {
=20
     if enable_json:
         manifest_name_suffix =3D d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX"=
)
-        link_path =3D os.path.join(deploy_dir, "%s.%s" % (link_name, manif=
est_name_suffix))
         manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
=20
         with open(manifest_name, "w") as f:
             json.dump(json_data, f, indent=3D2)
=20
-        update_symlinks(manifest_name, link_path)
+        if link_name:
+            link_path =3D os.path.join(deploy_dir, "%s.%s" % (link_name, m=
anifest_name_suffix))
+            update_symlinks(manifest_name, link_path)
+
         bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
 }
=20
--=20
2.39.5


