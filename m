Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCAACD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 11:01:30 +0000 (UTC)
Received: from mx-relay149-hz1-if1.hornetsecurity.com (mx-relay149-hz1-if1.hornetsecurity.com [94.100.128.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9546.1779274879856526987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 04:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=EHm2yGgX;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.159, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate149-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.162.113, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=pa4pr04cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=0LGFmN9WB4W37wGTW6p+2faN4YJwxn7wmfdhiTxVS94=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779274874;
 b=L2jHKjgbbefuEHI8BvXOqcKdj2yGSpvumSKJYixlRQXTMzfGWry3OxoQi7B2P8q3xVw6UuaQ
 XhTIdU+4istzSXIclqlGyEpDzwTgGY5fAZLhQgnU4G+PAynW/xpkLGSvdh9k0l1jZEk6WT3YsGS
 cMjU3Dw++UJyXaQbtKWtOdzcEO75jwaCMFYMn5PR0qPOjtRPcPcFox1OKdBHdoS+NvA1Srzav3C
 dOo+hAhknAqTm/DM4T0v+1Tw6oa8MHPa7tZ7ORGV3i/mFjGYSoTGa5WC2iBydFg8uGbtRhddR4a
 KtnGXU25lkeqXlx9/5CSq1h3WoKFcl6CuXyNTJMxwn5bQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779274874;
 b=gpxcV4xkFtjukJizOucrssPhqWEnOQDP9+REKTvZkf5/CUzNJhOhmK/h+tQSg36W5qdWZEVD
 OfIcv5XlL03FXCgBu3UXmM2liguUS3VANOn5TN1MwM5VPN8TUdsUDoOrxF0bTrFtVH6Uopsqgxl
 NyctcxSbjy5xzKP8J/WNxxvcsUXzQ2FY6TAq8dGMekVGuQdk8z+U2AP7nUaghRQ1DxhnX17AYBw
 UEdWpWuARVa8lXlt+PM2ocYnQT6/BLLGkBWblsdtN4jnPY7vv6z/eWrXm9acOIULxLG8wKbxz2a
 ws7IehsIWglPlDZkDx1ZnngpeuCgbZAU0/bbNnnoTfEIQ==
Received: from mail-francecentralazon11023113.outbound.protection.outlook.com ([40.107.162.113]) by mx-gate149-hz1;
 Wed, 20 May 2026 13:01:13 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHe3zAz1G1RhK8sBQLfnsSXChD97O7Pbsmu7CZjwM50XwN+ESAHh6y84vP+mQL24ww+FGwPcniTediCmpFai5EHhKvD5LF0iSJ9kFTlur5eVI963iHqtNVhdse/CjwaMrONPdNGgQYByuz7EzxvsXTpwoNH5K4mpVWKmX4qPEmdKXAjkRQHwyI3aO1vgxstPbH+Cml0HhDYWbbf9J/izvhTu3fGc/0cpR38Qu4iwLy5VBALOx+LzrWUl6+GI0LvgEoIaK7aFrmgILvq4oRvNB5/8gjzi0/hiM4SD1JK3vQE0RqJZqcF5Yq0I5WEmeQ9uXktUnkIy+ErFqH8wOfDbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LGFmN9WB4W37wGTW6p+2faN4YJwxn7wmfdhiTxVS94=;
 b=cHWrSQyXuXcVfW+9aKOX3PiSDE4ToWnK9HS6Lol5eqpLit6LmX74j9PJzMowsFVVqQpOo7mRS6pGTRUiiXAKGAk+7IdeO8skfXm0o45X474cWVEeGGuf0gHC4sbxYmBsKmJGhA215cFKjGg0CjmhEElVEN9kgT5aGo8YUm96mYITl5RU6W8neOnFT2DotNBchv2P98mSrpeKPNIT5iYuuBR+J7sV9/zofdEVzweLhlZFkYs+lhH6i3XUDLsasqhFhizm+ZML/3rnzl8mURGD8xqU6/Y2WVXDHoauDcd4xn8BAyhX5GZe9lM42e3AzVOQx1nxx7gD328bya4bqdgM5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LGFmN9WB4W37wGTW6p+2faN4YJwxn7wmfdhiTxVS94=;
 b=EHm2yGgXGHIkOVoK5sXU4H2eTzzzA8m6MRh4qJy3hzvy+JxGDEyhSg0WYnvygcFNSU71EFkuOUzdlRODLFo+Xso+KX7PvGAZpeD0aKrHJV0WXLm6mLp78Bf20ytb8RGLivIRhYrqICGxqeUOVMbzJ4SrJrjRtZ8bivcw7/3psyEoMLBSLZ1R8quD1vDE5gb4L9ExfeI78Od3vfrj6469PVqOG0vmmKXvLY2Iv73SakrQF/brU3PzSwFh0NRUrFzIKqia5kVFavIQFWXE+SAH3/sDg9MwXoIx+vqAydeYONcBug9Hv+FNFKbHw7O/WdoPRaFuDIoLiExs8JJfksm2QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AS8P192MB1773.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:521::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 11:00:48 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 11:00:48 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 2/2] util-linux: Fix CVE-2026-3184
Date: Wed, 20 May 2026 12:59:59 +0200
Message-ID: <20260520105959.3115597-2-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520105959.3115597-1-hsimeliere.opensource@witekio.com>
References: <20260520105959.3115597-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AS8P192MB1773:EE_
X-MS-Office365-Filtering-Correlation-Id: 043e821b-12ff-4817-9dcb-08deb65f0c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|52116014|3023799007|18002099003|22082099003|56012099003|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Di20nIsaVaX6NwgyUVGQiulcS6jd3eazMlzTdJhTyEGabi6nlgfgyG+1XzUn2YlwscjcHlY3ngF6VP2fEsYliHpn6HPJzTTBfpfOx8jZWd79EBttY73Na5Kz/XsHBH5LEaZN2NNij1Go81ISS+L3I2LIH0MLzpPZ+Kh60mcT318hxZ98vLpzUMu6hf+tgUOMySGltjKKdIrY7l9bciptFWCCIjZsJ/ctiVQsWyzBefFpnZLtHXSpx7DamkZlED/41P2GysVVvEaVgum+AOzTAU6r2c6afwxccQlvIpmjyGE3y2VzK9UZiZxtjcmOogrI5wPeZUkiX2ZvdlHvGyGuP3IeEyug26VeY+9yzcayGM9pu7pZRauEcHV2YG4zsBgVNgCWLGBLpM5WofZM1sCzJxBUfebUZJbfsqVnjJoPxIqYAJfCO0IFMvPLYe2VO4E2VCFmNXZNupm4jWbBCW7rdBKRQDjOPIAEUbLbOkuJs45O1OmQkqIzWjRMpkrKfp2of8jUkU3o/QRNjTDvMidxf0GELMqrirjNAiqBSFDtQrzclzZiYmT+L70dFVasUPt2vX5B+KN7kG/gSRZmucHZVUznO6W1F45qV39ylLC+GZJ73IxZr+PW5/gWshvHPy38ZvirIKId6vtzbBdcbf0Pz3Drfo5a95ci3X0FDIloU/jNffYnqfCaB3JJDSc0gWhrCrPYOamH6pjnIpxSUtapCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099003)(5023799004)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3J/C9QjMMl7V0qB4hr7Wm3fAFEPr+tGkVHEZceMyLXD8usZBtOkvE6KX9OJc?=
 =?us-ascii?Q?kOrnH/dB/CJSYUI5H0Fpd6MZHDt+xMcyu+GcymJNdIen9/P7dSQT/hETKxh0?=
 =?us-ascii?Q?ES2Ce5igyDy1QwGgT5K7/4c3cLo77m1Wc8tHXEv6b8Mb+YKi4Bg9p8ktuUL/?=
 =?us-ascii?Q?N+LrSk3UIonokDyEpnJmRtwOIIiJSZeogQiAxhMvDmtfxLt0ypRAARU+rRG0?=
 =?us-ascii?Q?49K4464IK1E0646BK88gSlcInyefr3OgJBS3wJPU7MFGjuUAyeQUw+g9mZ5X?=
 =?us-ascii?Q?4tTv16m03+RGhh/uHmSs4JEoEYa9s9gS4RQZSpDXIXqC++YgpOha4Ae4fei0?=
 =?us-ascii?Q?fHInoWfnuZMRa94009Ka7PIIHYkuUkKsoA6OHlCXXDgYZokcLjZXt5N6vGo7?=
 =?us-ascii?Q?VLRvtgFiTXKiqLtUGcksBHisF4qUV1tkYq1k2oaf7DBnmOiXtr/UmsHo3/KO?=
 =?us-ascii?Q?af2wvtP7wO7s8w5uOkaJMB0bh268P/fuQDi5/fKEAo4POQP9ArEV6h2dc7Iw?=
 =?us-ascii?Q?/2fJaKxqPhQfwzVklzUfdr1YDxzuP6wOtUaifsR1MG/kmcBE2XUqyA1CTD8N?=
 =?us-ascii?Q?83kY68QecM3i4o5xphrOcbiMjilu45RChHNpWGEuDi7ZWqq4AjHX4KjKs9J7?=
 =?us-ascii?Q?+VSn6CEUE1dsQdQFsa29CBcH7cb6JlMCzMltuhY5NwBiPqinJV2TgIUGtZ1O?=
 =?us-ascii?Q?+aK+72bUGJGgynQJfQ+jK9mh+hNEDMNP2pO2p2ipRjONGNChF+af2JoytXtL?=
 =?us-ascii?Q?flFk5IBhXEbilShLnGjec5/oNerPt+JtrSyMSQ1agmx2GxEgwWFLOMf5ieSr?=
 =?us-ascii?Q?wBdV6T0rTmFC7PWXOvlxrUd/V/RRXZ/soSTd6oVLgnIpC8UYl6mnfQPtPEc7?=
 =?us-ascii?Q?XBcRUvU+7KdGQ/le3T3bu0uPWI/vXfoExhwHjbTuCH1C1I2D+UzeEUDM8h5g?=
 =?us-ascii?Q?zM9uCJsk3/xiPbQShAmtyjOTfTjb0BbpzZCJRkDeZxSuCfzPTfAw36tG43aY?=
 =?us-ascii?Q?zpEL2UUiDIzyYn10+NW4UC4pCAYzxMS2vPK6s9vKSwkLxC1pyPV940oRy5TL?=
 =?us-ascii?Q?QM5LLKq8AYda0EmUxA7/YTQ6CZZxRT+m9Hx+0c0EfXNdx4fMpUhW0DZU5Jtt?=
 =?us-ascii?Q?dDn7b5u7UOAWLbsF2eMHM4pFwRjluEYYmMSKQeP4MY3ZTfyEgNQPv2+jEXQr?=
 =?us-ascii?Q?gU63TbSLLeL1HBjqN7eznBpTnTpj0dbW2bFhibo4VPSPBgZ9T/XcHHPjP0bQ?=
 =?us-ascii?Q?SNrliVzUPwd42dc3LmFNvt7ikcOM65OPuC2a3JAgx4ZGvdtTT51kg6y0Q6CU?=
 =?us-ascii?Q?6c5owqZIIgFjA//Sa1QoaAAZCGqUy8OJkDy+vcnkc34B4q17bAUZtTaYQH15?=
 =?us-ascii?Q?A4DqmDgTtlWt8rkAQzWXV0/xf9TkbMo4+FTtncoLpTSG6A46q1dwxpZYk+mq?=
 =?us-ascii?Q?G1vzA9dePUFUkxjiLXz8AGF/u9MXGdPSqejpMsVTJ2p/3RCpnPRjEwAIhXZm?=
 =?us-ascii?Q?QuEubfWXG4KzC4AFHB2LttLSb62UGBd4nK0r5BcvNpm37OtIaFMPOy6Fw1tE?=
 =?us-ascii?Q?OAq7xgz7Ld+bkH6S7JGofMHmNvjUfj7IzOfdaMXOIX2BU58Vg0RsKVl5iN/W?=
 =?us-ascii?Q?gUXmE6c8w3hfSJx/N7/hTIw8efdfCYsRCF7ChJhwjkvwsXA9CLc7CUPBiyG5?=
 =?us-ascii?Q?rp78DyNXg7ndWmdHttRpYQWBaRt9bauH8bp67zFOMii27o1Ydsex38E2Fl1F?=
 =?us-ascii?Q?0wfxhhkiMqkzT6W3jR6XRnRoM/57YvL43Kwlvu9f1ToX7AKar1ob30qqK5RV?=
X-MS-Exchange-AntiSpam-MessageData-1: 1UnvhBDtzZJwpA==
X-Exchange-RoutingPolicyChecked: 
	gGXwNZljfh2LRztkxcm0215Q/wEDl1s+YD86MJ2EK8hBAhCG8qvt5SxG1GZlt8YXrKIjqtyZfyv4iDAL4FrkwKnkZnfZZj8UpvkE4EzpWeyD7Jq3+UnjnuUP4zBDEc7OwIzAUkzP887chBO8BapGBAWbk4Fer7CbV099KRmGfO4IJGAh9GdchEgYAVftl9oM2HFUFbSgVxejV4nBlTAnRk7Afeb2sVxPUPf2qnHyW4GS+HE8Z1o1uxT8JYkVsV/x5FiI5kSviT9RAQNkVVkjH0URJpqNl74JCmHzv7QGpIlJu+ecWyBTdfmYC7CAI9LHzB9mMxfCHMbXBJ2cb0jBCQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1VlmzEz5E/uzN8uQ8VIF/hcotZAoUpNPsVZpZvyGAHG3Ig4J95kxzpt1QGJjA2UlzvF9xQl5Zjv6jDx5jnbYdD/6LBWE8jEfaTAYpCjnWvUyGMgRhuJ+oPzAZB9ZkWtATvGlaq7bPj1wzWCVlYgSlyfzatbQnkNhcRCTvBWHA6wpFX6tyCd1QyHXoHkb4szFSzCt2DKbosUvkyGNNJI0hGaF4ivSlenPiHSR2C8QxS68QEie9oyDP30ADzknJ8OfYZwl5+uvNTbnLXQw6WVc7jMpLomdVbLGU+DylGfB8ykeKwL8Q62kQi5pw7zez7c0sanEVRSJQl7jwxAY2lHqPtml8SUiws51IAQA6kLSoUJppLVJ6DFrVFOSNZfe+yQhx0XmvhH3amUQc6Gw/BmPSXZlYlRvkQGhG86G2Z1pTFni4baueYOdgbsRrBO6pPHyOp0wtdTLioggLIMwSi1yZ6hXbRJGbfhOlRu/n+5q1me/T1Lw8HwIZPNdGTU5UmT3k75oMznwyZE7DQ7E9XPUQqbEbXG9CsMBXK7N60FwP5BQQkrmUsi4Ia1rEWcFMnRugxsQZXvBVYNVBteMtjnGfZ0SGMFhclhT0NFDVW8MlOHW5td0gK5VAs17XUspsfBf
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043e821b-12ff-4817-9dcb-08deb65f0c75
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:00:48.1391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4p5BXu3z4Bytw8BsYBfunEIVIc9G+0/9vhgYo72ooe/R6oJAuAHpZIiF+qUzRMR+FiCtKFRpTe1BQ/7xPhWwxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB1773
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate149-hz1 with 4gL7r21VY6z18S1X
X-cloud-security-connect: mail-francecentralazon11023113.outbound.protection.outlook.com[40.107.162.113], TLS=1, IP=40.107.162.113
X-cloud-security-Digest: 6a2fb17777805ccbd9da5f5ea0f7c176
X-cloud-security: scantime:7.447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 11:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237447

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].

[1] https://github.com/util-linux/util-linux/commit/8b29aeb081e297e48c4c1ac53d88ae07e1331984
[2] https://security-tracker.debian.org/tracker/CVE-2026-3184

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/util-linux/CVE-2026-3184.patch | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 8380419634..961a7318aa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -47,6 +47,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2025-14104-01.patch \
            file://CVE-2025-14104-02.patch \
            file://CVE-2026-27456.patch \
+           file://CVE-2026-3184.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
new file mode 100644
index 0000000000..933adb3250
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
@@ -0,0 +1,63 @@
+From bbd20203765f3d705d45b2f51201041ed94fc3a3 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 12:20:28 +0100
+Subject: [PATCH] login: use original FQDN for PAM_RHOST
+
+When login -h <remotehost> is invoked, init_remote_info() strips the
+local domain suffix from the hostname (FQDN to short name) before
+storing it in cxt->hostname. This truncated value is then used for
+PAM_RHOST, which can bypass pam_access host deny rules that match on
+the FQDN.
+
+Preserve the original -h hostname in a new cmd_hostname field and use
+it for PAM_RHOST, while keeping the truncated hostname for utmp/wtmp
+and logging unchanged.
+
+Note, the real-world impact is low -- login -h is only used by legacy
+telnet/rlogin daemons, and exploitation requires FQDN-specific
+pam_access rules on a system still using these obsolete services.
+
+CVE: CVE-2026-3184
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/8b29aeb081e297e48c4c1ac53d88ae07e1331984]
+
+Reported-by: Asim Viladi Oglu Manizada <manizada@pm.me>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 8b29aeb081e297e48c4c1ac53d88ae07e1331984)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ login-utils/login.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/login-utils/login.c b/login-utils/login.c
+index 1812b9017..211968f30 100644
+--- a/login-utils/login.c
++++ b/login-utils/login.c
+@@ -127,6 +127,7 @@ struct login_context {
+ 	char		*thishost;		/* this machine */
+ 	char		*thisdomain;		/* this machine's domain */
+ 	char		*hostname;		/* remote machine */
++	char		*cmd_hostname;		/* remote machine as specified on command line */
+ 	char		hostaddress[16];	/* remote address */
+ 
+ 	pid_t		pid;
+@@ -894,7 +895,7 @@ static pam_handle_t *init_loginpam(struct login_context *cxt)
+ 
+ 	/* hostname & tty are either set to NULL or their correct values,
+ 	 * depending on how much we know. */
+-	rc = pam_set_item(pamh, PAM_RHOST, cxt->hostname);
++	rc = pam_set_item(pamh, PAM_RHOST, cxt->cmd_hostname);
+ 	if (is_pam_failure(rc))
+ 		loginpam_err(pamh, rc);
+ 
+@@ -1231,6 +1232,8 @@ static void init_remote_info(struct login_context *cxt, char *remotehost)
+ 
+ 	get_thishost(cxt, &domain);
+ 
++	cxt->cmd_hostname = xstrdup(remotehost);
++
+ 	if (domain && (p = strchr(remotehost, '.')) &&
+ 	    strcasecmp(p + 1, domain) == 0)
+ 		*p = '\0';
+-- 
+2.43.0
+
-- 
2.43.0


