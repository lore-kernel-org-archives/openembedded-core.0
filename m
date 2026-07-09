Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3E5C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 07:58:24 +0000 (UTC)
Received: from relay-p05-hz12.hornetsecurity.com (relay-p05-hz12.hornetsecurity.com [94.100.139.205])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4066.1783583900259953111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 00:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=gmFHaoDB;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.205, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate22-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.130.81, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=mrwpr03cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=0EeaPtj9s4CYFtkg4t3hao1rE7loEyluY+u39owHF9E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1783583897;
 b=aVHzjJzsHbsYHZV2+eWd5tpF1BXW3sJbrix1ZMrvN4cHinKFbXT0wGf3LPkwuJgTP25hy2uA
 AJY5uJIvP+9FL8nHBZdoTrzG8/VtOHWGIGH05DRN0vVl46sUN7hT88rcuYY+Cv04UjN9Gn3baEU
 HTCwVyWibIM+bArWwKA+GJgMB9C3iX0x3D9Vmarrf7ZS6nvj1NYCEeWBp+W0f3iHNgllONwhZas
 r/pNN6ULofisasXKFB4ajcX6bE4H5lsd9gs+v90gIq46CPLry+fVDwjl+weqK01lnLUfH4E5/hz
 UT8soIgOwfJwYpsTWsCl0cFNlkHgu4Iq+qzsolrYJKX4A==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1783583897;
 b=gmoXpqvRMCxRGE6r1yl6YCDIY0xdewfmwz6yeHFSCTQmCmzhlJI2Q19gBqyr7004q1dE0zGe
 ELvrYxhIrPU/2irv5qtZ11YQqrM0RLCfcIHARPG5wHSZCiFEvk8mF4MbZI72OnacRI1wMc2Qn/S
 pMfEhcV/1pkjO0oiHzlfcidtF76zripHilTiwP1bBpeuHHSCkD9RoarMFnUh3TlJJ1hNZtYcoid
 c2FHoiZLSem6D9QGSIC+pfDnzbJzfN9gbQH0m5JHJRtJTCBOmVTppZAfmbpO0tIiFQMpXF9oE2N
 5psrkcRkIlZI9jmgX/swwfMyWxZclyiCoIE1XeXSTogPg==
Received: from mail-francesouthazon11021081.outbound.protection.outlook.com ([40.107.130.81]) by mx-gate22-hz12;
 Thu, 09 Jul 2026 09:58:17 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsaDC8yY7UbSEmooO4o88Akxd90qdvP4/LbEy9SsuEv1XLBv2yBi6nK2w1EanLw1MLCZjrpeSy060fcMWg4fb4ntj1dRSVdt+0rs/kaG/BRA2TN0LzmJ8HPbEZfNFptWf1JqI1WfHwLrQ9UVDuX2v7hjPmafqAm4IQ/m2eFkLPALD83hzfe/7uZ3w68p1bajNF82sfSh3OzDzhwZP/k1IRp99Vs1HSq9BoTHTq2+3vA0xETomW1+PbxRmpQjW5qYlw/c53jch37Q1tQm2iR6d5jyrtDTk5sAFXl+UxpkX4A9D495rFKRKoPl8lur0RcosvozPoLnVExS3iZDPbsF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EeaPtj9s4CYFtkg4t3hao1rE7loEyluY+u39owHF9E=;
 b=rGzxmJJt8sfEOVD+a1QKWRPNQQPB7C0Lfv7PBPKDt3e8Uc6rY6Q+RjWC+4qe/6SGNo1PbNAEewooc+XDYDR9qeU8IHXIhihsGJS+Yygo1YEv+6S+UAbY5knLKfhmnEwkJSUSBZ8mRiISpx3qPFDGrWouzCfL2ub2sHHcNNlHHLfsORUbNttUrXF0FmaYuHu20F0pCl8GsyKRXW9KtRqWuJzxoq8DHJ9A4CuoypGaxV/K392GyAmbbdZU+8DnYI1ucfXCnSLTG0pTFnfLueRvjDzQqvoP4YMp1d6i5t8RC8cDKlI6EmQnV6IyCzZmP44SvTuoDVn52Abg0yTt6pogHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EeaPtj9s4CYFtkg4t3hao1rE7loEyluY+u39owHF9E=;
 b=gmFHaoDBI+QyXQ3SVMAinYnd6mZFpuxuvtcAi3pGOWWaGGNbJ69KQ/tgGT15s36OuIsKtA6KUUP6lvfjrBXz2ib3H7a5ErEs5WCg2hK38tj5YLly521hkWmoNpocZkxq8mAsV5Elhm9ml/lB4Dg6Vzs6hUg/dYvzoWV4usLAg31oQ+AZJ3ZuW4NYe3Hb2036NMlMygkUnjS3KQMnZITsjC5kFQ8BONzxZkQK7qn7w+bLDYVMNerCZ8oxjZeY2ekyTKAP5eTUHbJ60LtfV5oUmrWAp8/NAxH+3KC9RPu+68QietVP+DiSEjH69Oxq5JUIYpOH9MqhdxJpPyOJ/x2xRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by GVXP192MB2305.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:1b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 07:58:10 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 07:58:09 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [wrynose][PATCH] expat: patch CVE-2026-45186
Date: Thu,  9 Jul 2026 09:57:52 +0200
Message-ID: <20260709075752.3801048-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::7) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|GVXP192MB2305:EE_
X-MS-Office365-Filtering-Correlation-Id: 207a31ea-b1d7-49d3-65e2-08dedd8fd0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|13003099007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	mucOijyy2jxv23SOLfjzLcxePmCeK5SWg5xdq87pMh0pNJ/ABRB9/+UeMAVXpB/8d52fE90tLwT0//j8wUCmtUZ8lJWKdi4XKo30hKKItr6rOlvKMSVOX+dyVe+jHto7S96be9UCANX3wFQ1oOyCM37zFLkgwXCGg5NO8db8b+y20jUTQO7i0s2MMLWwDE2va3K5Ua4A/H7yVC33P8aJd9YF5TwYI6XA07XFmNC4t4srwc6LHeM+2Ilj0pUdQoBg41MxRAUJFXxbfadmU1gJCJwQq1kW5o9z5OJl5hQKfKfoxn97CLj1vWhdxhYx6lG7UMHUfR2GdFsWe0dV6i8BljUg27wTg1RMV1vSKO3MRJB1d160LaF31ifrEW1/ZQ93rJN34Eg7cq+uyRUAbu7pJuub5xjss2PGrf1NFAE9+f5At5V/qJ37Yw8wmMWHYor/hkpyzQmW/PyXwsu7f6xfUIBO8hRur4IEdFcgSaiW/HrjYaV4NWBRJzRHt7Q6ITXkv3xJTI3nPl/UM2uRgdaj8g+5a0jFZD/S73yZpHn+rOp6rEEdOclYQn8SP4Mr/5s+JRW6roOM1YM5JwqOBvxfVWxdrtaPVDKfDEUMFbfa8HmSRaXEnI+K4fBjUd0trCvTLwCMhFnS7ur/8yvRz+0KmwSPIdJWam+W3RvTOsVAqhE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(13003099007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pt3orSYGaBg4gJC/XUzR6SiNFD9rbpvWy8ruJx5WcboYyLQYE/Ohtd4bptLQ?=
 =?us-ascii?Q?8XyehmW3ugLDVPgOI4Px0V+Fh+VMDic98MJpAhukVTR1cMfCsNT6rAUSjj28?=
 =?us-ascii?Q?8kaCt6ag1bVRlQK1Dhsgd+mVv2BBslbdrVzdHpvtQc0CjspRs11AMX10Amb4?=
 =?us-ascii?Q?UEwqPM7hJmshp4JN7xgCdQTpj/RDtjtMmRDiiU4NjUPl5ZvtoGtCJUu2X/Cq?=
 =?us-ascii?Q?+MLX0RSXwHB9iIAxBk+q8D/E1K4uBTThdcLj7rSvCqpZqkN/6vN/oB0ZTkk6?=
 =?us-ascii?Q?kvB9B1O48UZ65ToYud0UKyeunrSM6MwpxG0AqIoxjwpCWq0PuPgd3/+OB0ZK?=
 =?us-ascii?Q?t6ZuH7luuaJtGpvmY+4ctTx5DZpiEo0EVLNnwphjYteJrlGTxrNKZRB+zi26?=
 =?us-ascii?Q?zoo8G6++Ucl6WktaMqz481KRUh7RLHZqTW4NefgkB9/9NH0+RZ+emG9nsK+C?=
 =?us-ascii?Q?ULhNlago/khWeW2PwS0DCKY2LXK2fui0Ay4eeiR3I5Y8r2EOzEictvUTAZR+?=
 =?us-ascii?Q?49B9Tv6J54BBwQdlZ/6GCjpbJ237bwTu+6SgdLNuPg7lQN93wGQyC3IwKT03?=
 =?us-ascii?Q?PUImCKrwTnnpj0FhSsUZc8RuG7OFuPRKFqtrIZxoJaQMLQglFu+keGZdqDoo?=
 =?us-ascii?Q?sw5yzeeqZe9r3FQqkoMDg0Bm2rlqpDJryzkm6Qhkye3vNWAsgH2PGavJHglI?=
 =?us-ascii?Q?2Mj0GrRUzVYYJzv6tr2vh4fj7wv075xMwdr9ynxhxMiEitpeGnWON/+NqOeD?=
 =?us-ascii?Q?43memCQsqLrQT9vicrrC2ZHPSkWA2SsLi5IhJMWMzYPlv5W+pL/gMGmUlfG7?=
 =?us-ascii?Q?a5LHSBrU7RilsCQbS9w9eSrQC4C9laOUDtulWRDMnzkKlDQ7jGB3hSNyuvCi?=
 =?us-ascii?Q?VA97MFsut5LIkz03Iy2nKdmcv4tjVVsGCgcg6JJBmMQPSgslMSzQx9NbEu6u?=
 =?us-ascii?Q?O+eRKfCMgIJq+JnizhmMshMTEbZiQRNoLvrK/iscpFq0cuLjl/viAA4o90F1?=
 =?us-ascii?Q?ajF3UMf1cZXIOMcd/MNXfECETl8SxgDeQTml7GIIzMWG9mCTp0Ek9EjDc6Cb?=
 =?us-ascii?Q?9Xaa9eD6wnI0Dq1FlgKMXvFqMXd4u/hVzXNX8HyqcATWVht3k6BrO2VdTpIj?=
 =?us-ascii?Q?iDixBgIdSo7ZMpYR6Fn/nWz0FtdlFsr9TWkp4eGrTek+KoJ5Zuf3eYHnC1F2?=
 =?us-ascii?Q?6Mfv6klUvnG1IF45NPq7zVQh5Syzx/3+LeZA4UC7JV8rtz4huBfHq8HLlRI/?=
 =?us-ascii?Q?wcsV3z4fiej/G6RpDi4SNJ8d5Gy/89SMmXTz+BF7RveXG3M5jI+quvPKWrYs?=
 =?us-ascii?Q?f4iecjh78H55GqQeZqE5jyED8C4DRNK3Ejl9xoCyV0bigUp4ePEzmE8VRBmS?=
 =?us-ascii?Q?/at0Ncoz8dq05KJj+SATrKRe58oAZ0e+UV5rkxUfQAdnzZl5+E1UMqP6GvgW?=
 =?us-ascii?Q?lyVgPuQIp2Pk3dbTj7fX8X+iaGeuIkzx9Rti+kjp9jw0OxV31RJLwZA78Gtl?=
 =?us-ascii?Q?gZqGAjzLXH9B38Dp/W/FpQhWJ4p9GDQnYdsuI0idtao384IuGHFSDU6NAMBu?=
 =?us-ascii?Q?SvRf7TexNemHF7NjuWtzu3vLeSWT3//sE+ypjMe2lvzeVtpxLdu3ywB8emHQ?=
 =?us-ascii?Q?WwjNn1nnw2GT92NxNaviRnYV9DEy4LoAjPXXK4BPWAIF7vGM9TZID9j1zu8s?=
 =?us-ascii?Q?IRvEvcFhw1XJVunWRrKCfy6F5QFH8kVxh1BWP6+4UkUfnG5Ld/D7NWEUSs54?=
 =?us-ascii?Q?rjAjx3AfJA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Z/1XRiCleuiJyvoUmhoFDabI0gQmJATwFWUsbUm4ZMCwN13SP8znZ2dg68M29f14fEn9NXhstVZmB94eQBsNt9cEA+0M9qM5Gh2d92eKQWIRvSYHO4UTel7IgSxF65GGSy2YSJ4zUVxAZpyqyjraolBUfoCpGEtItWeJKgh7GjqyCZ8nB4/kCV4TFrKIyvIbe0RrO3s+8X1J48Lsxc8dhmYu9rSZYQeSN0HlF9OCofBvOKdNHr8639pgEAhqVa1eNcvR+cJnntkJN91QZegQzqfy4eGK2zHTCePKjgKrivzHbVhGXCQbzQJO8A59L8DNnwAM2mUWEUOjnTRyc28LTg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	la7ygqH1uiKf73F00JGA1DLMsb/LmJC/2s/8DmrQPSCubXPWVsyiyyIfRa3qjB+b1n5jje4AHz+cpPsaH2dMfgZaoImtQHO8qV+X5Fr9CVanPD6mFN8ag1qMcVA2Wmn0oJB4FCszu+3ixzOE+r9qIqE0mL9TK9jj4pBf/8fDkAV4ufYZVSwvMCZoOnmgq/tC6q8STZy1LF2BIc3zxcIJFoAXMh29PGmEJguJMQuQuYXGIlVtpnziuhBpwIY/RMVxaxHBm1jUL3f8+67c+/ZC2XQPnqqZx3qLX3qjtxo/oHiftHzIJIAT0oyiKYfVPj5i0qJ+ZkuQqQNwiYiK+dicJ4aFauXV2N6RkztrlO/E42rYwDIaGqNdKTEhRziweGh2btltqSPl5gQr2wT31XxoddLI5NpDjRqfweCFw1cc0HTaFOgXn36yD0kp4npktQDVZxp5ZMhrUM4DwvQSzIjOvCHjGaVRgzAfigYJrZ1/xp9C9lBR52K9ogImMCqmaAKR3eGRJHGe6JhuoqEW9soaKpEn6fLNpI+QxNnkA8A7hKwaWs9dAM03OFcrXmmc2bHftz/Jw5qDIJX1dBpEXSdXIU6m8WdS6K7p4x3UH9bXJL2cRmd1OmaaJPC2L5C1FoM9
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207a31ea-b1d7-49d3-65e2-08dedd8fd0be
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 07:58:09.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJLJ6Neh+QpM+VgO2EaoWFD4ZJxUj/8s1DW3OtBtWXMMVVa2vOrPKHYozJ9A5zwQYrLleWwndouqrz0MAfeR7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB2305
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate22-hz12 with 4gwnQG46hkz1b0jL
X-cloud-security-connect: mail-francesouthazon11021081.outbound.protection.outlook.com[40.107.130.81], TLS=1, IP=40.107.130.81
X-cloud-security-Digest: 18a7f9d41f7ffe8210da3b3898b916f9
X-cloud-security: scantime:1.443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 07:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240542

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1216

[2] https://security-tracker.debian.org/tracker/CVE-2026-45186

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../expat/expat/CVE-2026-45186-01.patch       |  70 ++++
 .../expat/expat/CVE-2026-45186-02.patch       | 318 ++++++++++++++++++
 .../expat/expat/CVE-2026-45186-03.patch       |  46 +++
 .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-06.patch       |  87 +++++
 .../expat/expat/CVE-2026-45186-07.patch       |  52 +++
 meta/recipes-core/expat/expat_2.7.5.bb        |   7 +
 8 files changed, 644 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
new file mode 100644
index 0000000000..478978f4ca
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
@@ -0,0 +1,70 @@
+From b659bf974f29b991870ba1f66af687c73e07fbf8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:26:45 +0100
+Subject: [PATCH 1/7] Make "counting_start_element_handler" count default attrs
+
+(cherry picked from commit 0802a5892030610144b736dec6e2f63e8600fe85)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/0802a5892030610144b736dec6e2f63e8600fe85]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 8 ++++----
+ tests/handlers.c    | 2 +-
+ tests/handlers.h    | 1 +
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 02d1d5f..8c025a2 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2466,9 +2466,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, XCS("id"), NULL},
+-                        {XCS("tag"), 1, NULL, NULL},
+-                        {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
++                        {XCS("tag"), 1, 0, NULL, NULL},
++                        {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+   info[1].attributes = tag_info;
+ 
+@@ -5543,7 +5543,7 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+diff --git a/tests/handlers.c b/tests/handlers.c
+index e456df2..bd1b54e 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -137,7 +137,7 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     fail("ID does not have the correct name");
+     return;
+   }
+-  for (i = 0; i < info->attr_count; i++) {
++  for (i = 0; i < info->attr_count + info->default_attr_count; i++) {
+     attr = info->attributes;
+     while (attr->name != NULL) {
+       if (! xcstrcmp(atts[0], attr->name))
+diff --git a/tests/handlers.h b/tests/handlers.h
+index fcde27a..27a53f2 100644
+--- a/tests/handlers.h
++++ b/tests/handlers.h
+@@ -88,6 +88,7 @@ typedef struct attrInfo {
+ typedef struct elementInfo {
+   const XML_Char *name;
+   int attr_count;
++  int default_attr_count;
+   const XML_Char *id_name;
+   AttrInfo *attributes;
+ } ElementInfo;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
new file mode 100644
index 0000000000..6c90e15b47
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
@@ -0,0 +1,318 @@
+From 32848241057dfaa4c68fae475f51fbe1a182c004 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:27:31 +0100
+Subject: [PATCH 2/7] test(attlist): Cover duplicate attribute names
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+(cherry picked from commit e569f47181c43dca5d262089e541ddf9a9c09927)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/e569f47181c43dca5d262089e541ddf9a9c09927]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 282 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 282 insertions(+)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 8c025a2..83c453c 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2489,6 +2489,279 @@ START_TEST(test_attributes) {
+ }
+ END_TEST
+ 
++START_TEST(test_duplicate_cdata_attribute) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected' attribute CDATA 'ignored'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_1) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier CDATA 'expected' identifier ID #REQUIRED>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("identifier"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier ID #REQUIRED identifier CDATA 'unexpected'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{NULL, NULL}};
++
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++                     "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored_doc'>\n"
++                     "]>\n"
++                     "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")}, {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 1, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_3) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++        "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++        "  <!ATTLIST doc second_attribute CDATA 'second_expected_doc' attribute CDATA 'ignored_doc'>\n"
++        "]>\n"
++        "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")},
++                         {XCS("second_attribute"), XCS("second_expected_doc")},
++                         {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 2, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc identifier ID #REQUIRED>\n"
++                     "  <!ATTLIST tag identifier CDATA 'identifier_tag'>\n"
++                     "  <!ATTLIST doc identifier CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc identifier='doc_identity'><tag></tag></doc>\n";
++  AttrInfo doc_info[]
++      = {{XCS("identifier"), XCS("doc_identity")}, {NULL, NULL}};
++  AttrInfo tag_info[]
++      = {{XCS("identifier"), XCS("identifier_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 1, 0, XCS("identifier"), doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Test reset works correctly in the middle of processing an internal
+  * entity.  Exercises some obscure code in XML_ParserReset().
+  */
+@@ -6374,6 +6647,15 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_foreign_dtd);
+   tcase_add_test(tc_basic, test_set_base);
+   tcase_add_test(tc_basic, test_attributes);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_1);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_2);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute_multiple_attlistdecl);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_2);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_3);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_multiple_attlistdecl);
+   tcase_add_test__if_xml_ge(tc_basic, test_reset_in_entity);
+   tcase_add_test(tc_basic, test_resume_invalid_parse);
+   tcase_add_test(tc_basic, test_resume_resuspended);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
new file mode 100644
index 0000000000..f3b0614b8d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
@@ -0,0 +1,46 @@
+From 468d6f44264e7ad73f3045f6487baccc846014e6 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 20 Apr 2026 13:44:43 +0200
+Subject: [PATCH 3/7] tests: Define .attributes the first time around
+
+(cherry picked from commit 05307d352a5aa858cdda57ec53a53b597b3a4a82)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/05307d352a5aa858cdda57ec53a53b597b3a4a82]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 83c453c..810ff5e 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2466,11 +2466,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
+-                        {XCS("tag"), 1, 0, NULL, NULL},
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), doc_info},
++                        {XCS("tag"), 1, 0, NULL, tag_info},
+                         {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
+-  info[1].attributes = tag_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   assert_true(parser != NULL);
+@@ -5816,8 +5814,8 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
++  ElementInfo info[]
++      = {{XCS("foo"), 1, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   ParserAndElementInfo parserPlusElemenInfo = {parser, info};
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
new file mode 100644
index 0000000000..d30ffa3f51
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
@@ -0,0 +1,32 @@
+From 0582bcabb773d4600d7c85516132b016f0163deb Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 13 Apr 2026 01:34:03 +0200
+Subject: [PATCH 4/7] tests: Make counting_start_element_handler enforce
+ complete attribute lists
+
+(cherry picked from commit 4176aff73840711060913e0ac6aa1168d8ba5c8d)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4176aff73840711060913e0ac6aa1168d8ba5c8d]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/handlers.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/handlers.c b/tests/handlers.c
+index bd1b54e..8cda3a8 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -155,6 +155,9 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     /* Remember, two entries in atts per attribute (see above) */
+     atts += 2;
+   }
++
++  // Self-test that the test case's list of expected attributes is complete
++  assert_true(atts[0] == NULL);
+ }
+ 
+ void XMLCALL
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
new file mode 100644
index 0000000000..6d98a3cd09
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
@@ -0,0 +1,32 @@
+From ebe5486739006105629b0bca6022f664566e56de Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 22:14:41 +0100
+Subject: [PATCH 5/7] lib: Extract a constant for upcoming reuse
+
+(cherry picked from commit fb35f2d2040d114f355bae8a7450942533237530)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/fb35f2d2040d114f355bae8a7450942533237530]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 0248b66..e833520 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7719,8 +7719,9 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+       newE->prefix = (PREFIX *)lookup(oldParser, &(newDtd->prefixes),
+                                       oldE->prefix->name, 0);
+     for (i = 0; i < newE->nDefaultAtts; i++) {
++      const XML_Char *const attributeName = oldE->defaultAtts[i].id->name;
+       newE->defaultAtts[i].id = (ATTRIBUTE_ID *)lookup(
+-          oldParser, &(newDtd->attributeIds), oldE->defaultAtts[i].id->name, 0);
++          oldParser, &(newDtd->attributeIds), attributeName, 0);
+       newE->defaultAtts[i].isCdata = oldE->defaultAtts[i].isCdata;
+       if (oldE->defaultAtts[i].value) {
+         newE->defaultAtts[i].value
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
new file mode 100644
index 0000000000..1b47776a17
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
@@ -0,0 +1,87 @@
+From 41f9f3c8479e8f8547d5bce6355b0484c2744d1e Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:05:49 +0100
+Subject: [PATCH 6/7] lib: Introduce ELEMENT_TYPE.defaultAttsNames
+
+(cherry picked from commit 7f0f1b9e70d937072d2e9e37ae9edf27784cc080)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/7f0f1b9e70d937072d2e9e37ae9edf27784cc080]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e833520..b7e2d72 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -388,6 +388,7 @@ typedef struct {
+   int nDefaultAtts;
+   int allocDefaultAtts;
+   DEFAULT_ATTRIBUTE *defaultAtts;
++  HASH_TABLE defaultAttsNames;
+ } ELEMENT_TYPE;
+ 
+ typedef struct {
+@@ -3853,6 +3854,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+                                          sizeof(ELEMENT_TYPE));
+     if (! elementType)
+       return XML_ERROR_NO_MEMORY;
++    if (! elementType->defaultAttsNames.parser)
++      hashTableInit(&(elementType->defaultAttsNames), parser);
+     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
+       return XML_ERROR_NO_MEMORY;
+   }
+@@ -7561,6 +7564,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7602,6 +7606,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7695,6 +7700,10 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+                                   sizeof(ELEMENT_TYPE));
+     if (! newE)
+       return 0;
++
++    if (! newE->defaultAttsNames.parser)
++      hashTableInit(&(newE->defaultAttsNames), parser);
++
+     if (oldE->nDefaultAtts) {
+       /* Detect and prevent integer overflow.
+        * The preprocessor guard addresses the "always false" warning
+@@ -7730,6 +7739,12 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+           return 0;
+       } else
+         newE->defaultAtts[i].value = NULL;
++
++      NAMED *const nameAddedOrFound = (NAMED *)lookup(
++          parser, &(newE->defaultAttsNames), attributeName, sizeof(NAMED));
++      if (! nameAddedOrFound) {
++        return 0;
++      }
+     }
+   }
+ 
+@@ -8474,6 +8489,8 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+                                sizeof(ELEMENT_TYPE));
+   if (! ret)
+     return NULL;
++  if (! ret->defaultAttsNames.parser)
++    hashTableInit(&(ret->defaultAttsNames), getRootParserOf(parser, NULL));
+   if (ret->name != name)
+     poolDiscard(&dtd->pool);
+   else {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
new file mode 100644
index 0000000000..5551d10243
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
@@ -0,0 +1,52 @@
+From 141a3c12639f9a4066293e81dbedde4c15b0881f Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:06:29 +0100
+Subject: [PATCH 7/7] lib: Leverage ELEMENT_TYPE.defaultAttsNames for attribute
+ collision detection
+
+.. to resolve quadratic runtime behavior
+
+(cherry picked from commit 4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b7e2d72..04195cb 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7189,10 +7189,10 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   if (value || isId) {
+     /* The handling of default attributes gets messed up if we have
+        a default which duplicates a non-default. */
+-    int i;
+-    for (i = 0; i < type->nDefaultAtts; i++)
+-      if (attId == type->defaultAtts[i].id)
+-        return 1;
++    NAMED *const nameFound
++        = (NAMED *)lookup(parser, &(type->defaultAttsNames), attId->name, 0);
++    if (nameFound)
++      return 1;
+     if (isId && ! type->idAtt && ! attId->xmlns)
+       type->idAtt = attId;
+   }
+@@ -7239,6 +7239,12 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   att->isCdata = isCdata;
+   if (! isCdata)
+     attId->maybeTokenized = XML_TRUE;
++
++  NAMED *const nameAddedOrFound = (NAMED *)lookup(
++      parser, &(type->defaultAttsNames), attId->name, sizeof(NAMED));
++  if (! nameAddedOrFound)
++    return 0;
++
+   type->nDefaultAtts += 1;
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 4f2578292d..210398fb50 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -10,6 +10,13 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-45186-01.patch \
+           file://CVE-2026-45186-02.patch \
+           file://CVE-2026-45186-03.patch \
+           file://CVE-2026-45186-04.patch \
+           file://CVE-2026-45186-05.patch \
+           file://CVE-2026-45186-06.patch \
+           file://CVE-2026-45186-07.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


