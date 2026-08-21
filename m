Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B68C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:18:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2904.1787300305699901350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 01:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xDRFReBo;
 spf=pass (domain: est.tech, ip: 52.101.72.52, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9LawhqRwCN/hHb+R4kN1pdNpj1oCUfY4pcixSf1t0oQFzHzFt0oGySzFlZMlUN6Dq625W2YLjW4IHMseCTxwy0aEY2zugBPxMCtAxpvySwuKKrUuxDIAy2+eg+8iMWq9m18Q5bS+ZuzHcWG3nv5zDu+xr0NTnj0EX2FSxnkhEfSZpWbutAAe6wkEBbUA0aW+I04SpFDioo+uANEWfbtzmnCd4SC/apcj0O+/uU2hobI69xVGsvLYipLUFaDeHinulHLgOhBC5cFdlqDwvhJuc7vo7Dt43B/NvnBbE0EsPVtCaT0Tez+BGBqaacOTz9UaVVz2y+5MFG4mTiaQYtROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG9v45NhanT6CYue2LVYY5JfUPy/ErQ83shHSvr+3p4=;
 b=xleftARQAxc9PR8BGZXagxzd2DOjfDF+24n3MsUZ02SYtY+PQ55XWI0lTXrMqPiwqZz5Xnh0dj/C+xvgeKkb2KoYZLUWufXTkkcc7C6F1bhbsGNvMf/f8S0YbTZxQtt3KDipu8icNJ3SNbMS5bP9GReqEA7hWDSyfH9IlNv7+yK7aJMs5XrVyv0Nx92YkEExTjZXSXUFvXm6UQfOY6s/BMploGMdPN3XKuzB57KVQvTURiuM2I0tbFzdXeYSMk6YJCVvqeAd10745scwV2il/XAYR91FhMZ+7KzjDSpUzJmk97lrNZoRhnxzHlAg1ghxxWfXgy5E2xTJPAsagL+5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG9v45NhanT6CYue2LVYY5JfUPy/ErQ83shHSvr+3p4=;
 b=xDRFReBoJ4Zkn44pgioNyl56lWX2m+aDr2jG0w9zwHlAkzXhi8LvWHkA6S5tcfM9etivyLOttbGGS+WbHVA4ZD6VwTnliJyYZt1ZvGpaq4GpZyaWpZkMKuUyJmpp7teMBuO8WC9XHKf1FVH3F2rYQKIk3qAE9ftIdgM8w6VDuklY/efvvpPZeX4hiLRDVloH/bBoVIZAudEAC5jeV0qLkFmNQyRexc9NXmzqJLV5b/IuJGaJG8dhJ+kSKD/2YAeWe3oIExW+ZZ0cRvKc/kYwESobbt/st7IvLRTGsKRV9NUpVztQ1bGr2G26VhCK9rz6sDLUInZ1qMwGUqDMUYHOxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PRAP189MB1828.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 08:18:18 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 08:18:18 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] gnupg: Mark CVE-2025-68972 as upstream-wontfix
Date: Fri, 21 Aug 2026 10:18:15 +0200
Message-ID: <20260821081815.1039423-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PRAP189MB1828:EE_
X-MS-Office365-Filtering-Correlation-Id: b73e74b3-37bc-47f6-4e91-08deff5cc149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vFgqZIQkk783To6anHaYJOkPJPrrlT9FJHpWDDNGnsNR3+lhEThUYikg/dO2avHvykWV3hjryShtegrv8XAasPkRaYdbf2DpfSd5tgmJCtsiWc+dh2YawGxbDpJp8lHUxh5X9iMD7XAwcVCT0vpbBwovGRBQdU+X8Jwgo8K4OCb+DjbrZz7Lgo8jtDUySXq39nxtGttupRvNEY+WmukHe1EtMisPXi558CbofZXcl1v9V2AzPCb4qDC7ezlOHDbd1xgnaSYp+S7Cwk/8B3Q2QE8z3UYaoOz7snRuwmOv5jT993bJDxpL4Da4s0Ow2bKuAqzm4DPA5o928yN1PIIcJ/WaKJodQ/73HgfCOMUKY3rtZU29J82uAcVtYS1bOAXkK7eblNpcZc/NGbkN//ZhxbkPvk+NvE8ZIM9jKTifrM/i5kw/sGTwAZn07qeYKXIXdps5uVSoAK5Sy4kHa/kwfu/3Kc8/FBtZTJF6+a3/nqoeGo46bxxGnROA+HFlKnZvKLtRxQDuCdQU04ZXNOD22hphgpE8KgckIRjkCdaspsxQWqoYsziZ7BrG5Oe8N7hzdoYiGsOFKEIjPEn2CBOCy7QVPF/pNi48i3JyOMjynqWgh+3h+Rsn+wkRkNn6l3CH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RGTimpQZLmcMc51HOuxaWWy0TdNLirw7VAghghFCp3ULBfxwH39wR89HoRTd?=
 =?us-ascii?Q?5zs8OJTBb8C9jD4YfEx8pPltLWop2zf4lWCJZPs3IlZ+t2AgleLztr3tR5Mm?=
 =?us-ascii?Q?mOMJhdVrHrhJf4OEh/1C74oz8cLN3g6c52uUBY3oHZ6wwELAVbdBvwFXEGI0?=
 =?us-ascii?Q?MKv5vNzDT+LPEaCiVyPLqYnW6i3brOekSyj3qranm2RcJ3BgEPIJwrBGMcfC?=
 =?us-ascii?Q?gytc8dLc5UddJCtGp83WM15sZgr7YPZjZdDpmbr7e86fDHXAheiZESUiAVdQ?=
 =?us-ascii?Q?6HFshG7u+0NZSpF2PwNPk0d3+tdNr9uVDyi0rxyfsDFUPy3/OXuxZxDmh2Lx?=
 =?us-ascii?Q?D9pyW0jxny3FsYZWHZb+smWdFtnV2PNi2MdJi0qJbq1JBRuMqrGnKlZugiZl?=
 =?us-ascii?Q?qy+bnfeLXtVn6sjfjKPE9LnQrkK5XQJG8I6ZAazrcps3KvwGPpsz5mRFThpL?=
 =?us-ascii?Q?SvHk+cWylrU+isDTZen2RAfaRk8coxsWfiKkSKT2i4h4t2Td63/Mk+KgNQ+K?=
 =?us-ascii?Q?Hzj5GeUsAdviW2BRLQ0T8W1Oi+pdmmmgS/ilU5Oyiaw6HIUXIIzUzIU7cCCm?=
 =?us-ascii?Q?/fZtYjz1XYb23sYFEtpw5KhVqwxjxVigA/6AN2IS1sNImQhRysZto+h9tnYb?=
 =?us-ascii?Q?H/lPSrIfj2gEBnAXk3ILMz5+/P2KvtRbgndpair5cE2F4YsBLEjwqD+ifsse?=
 =?us-ascii?Q?cAmUvCzsFQagAbIcHhqPI6qpYeO8bwiv6Vj3JmAUv57FYfBwUdrIaRhqeRYI?=
 =?us-ascii?Q?wZEcmZYw4Dd1EvIb1jiz+6FhCiqq5akWLl6hW49SeMOBO7k/xtzw/1uqqNca?=
 =?us-ascii?Q?orjizEzV0WRntpfTmh06PKndMnu9Jv0wo6uVTy3oeEJtGa+/QbXfZRAQ35NV?=
 =?us-ascii?Q?FENqzwNj1WMPU63qYisjG2SzIRpeq8T1GRe4GftYb3VbtlUI/OsmwBOeRPAl?=
 =?us-ascii?Q?dH/WJm2Ulo1L0hozYACJ49WqhSk/c0uF5kDRw4pnopir+XFu2NhwPrNCJqvK?=
 =?us-ascii?Q?SnBawaPdhagIW/OAeXxS6saaxTOI8Agq1kxsG9KiOtiAzECBdyUWHL2jeoab?=
 =?us-ascii?Q?0i5703zOsupF3pYDdk9WYia2/qyBOwbGaP47p9EwZ7AAWC66AdSwZRfWUDOr?=
 =?us-ascii?Q?GX/Ie7pzHuHd7knt/cxSAOl3x4tvjwker3sh1/rFeJX6g2K6Nj3MfOIUb5Jw?=
 =?us-ascii?Q?Z+lzQY8uvudQ4GctNCf6sTCc64m8acY3g59wMLRsFAK0LXUXb3JMIs2pI8EO?=
 =?us-ascii?Q?cMxv7kIy0WAY0Lp9rvAtyksrGpQXuDFt4EaJx5aSz1rHct4wWFYf3iqL+FvE?=
 =?us-ascii?Q?iuAacark+1W4/fY2b4kZXmIUw1QJG73EmPII63CFixnTeZli6w/U57qKuhit?=
 =?us-ascii?Q?mph2ZGXUc/gTIJ6q9m7K6XQL0tpEEuhLiQfflT5HR+h/t/5YdHvYjTDCBS+e?=
 =?us-ascii?Q?2ZONv/IhIhlSDlypBvl7BEBpaDVIp/BAk4SYV1WnmA2ezf/8ZIuP/NHFGuYP?=
 =?us-ascii?Q?na8LYL5kE2cTzBr1xnae7PragLvXMLgk5t/q3DftK576KE7bcFXJ95uUFSB2?=
 =?us-ascii?Q?zcS90am01U5kPo0Vybp3OkA4R4tCyqJwJaHiQai15z1OF+i+b6LEB6QdXjXX?=
 =?us-ascii?Q?Qr28CpJcijMPr7VGccRb2SWfxZKLWzYizWx/B8r0rBEGPIh2o0IYzj8FOZo1?=
 =?us-ascii?Q?3JFOX13KfDUQ8a6AzJh0ceqCd1eFfNzz7UFbfH6Ulsg09RssUrN8M1sOyM7H?=
 =?us-ascii?Q?DmGpA2DuRw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b73e74b3-37bc-47f6-4e91-08deff5cc149
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:18:17.9762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kleMj6ryEQTAD7GBHalSblTRP/b45I3D04MR/DWFTy6IqLlfSa8knxLozyf31DdPEnca1QI7BWkyC6WUWBa3MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243897

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 meta/recipes-support/gnupg/gnupg_2.4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.9.bb b/meta/recipes-suppo=
rt/gnupg/gnupg_2.4.9.bb
index c85de6047f..3ebea399d7 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.9.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -85,3 +85,4 @@ lcl_maybe_fortify:mipsarch =3D ""
=20
 CVE_STATUS[CVE-2022-3219] =3D "upstream-wontfix: Upstream doesn't seem to =
be keen on merging the proposed commit - https://dev.gnupg.org/T5993"
 CVE_STATUS[CVE-2025-30258] =3D "cpe-stable-backport: fir for this CVE was =
backported to version 2.4.8"
+CVE_STATUS[CVE-2025-68972] =3D "upstream-wontfix: Upstream considers this =
CVE invalid - https://lists.gnupg.org/pipermail/gnupg-devel/2026-January/03=
6154.html"
--=20
2.43.0


