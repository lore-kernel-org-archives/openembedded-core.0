Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B64ACA600A
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:58:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1791352706928220788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=peAR+nRT;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAIDINRQRn1AzGmwDPIb3ZRNeEusS4JnRbCJbjjTTfRUJZfKZZv6DkNrSstXqutOxLpMb5bWsAJxz8YVuanB3E40OsMcLLRtEg9lIv76jAuyhJwA6uuJtr58LR4Y2OLeg4JA5jpR4mFToxFz3GfV2NNrLVRhBrXAB+odNKEFyFdbEoNa3sA7bUQtWu/83INlkH+GbPAlcEpveykZyQG8NhmAVag9s0BHE2Vk3txsfoB4eQvehPm+YWMeUxAjFmKVjtUPGF6wS+vZG9qxFoDzKddegN5NGTy9u6XxiO7Qt4aW4vCCgaHiFA/8+oQTH0z0V87jliwRDlFqPaQQXyY+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WgtyTIpkp5sjmm1x3a5E6qLLvHZtByfc5GEVJecLyE=;
 b=P6w2NnOJV2k6XVd5mjgwY97xfkJqWJxak5Y7NK1RLIc8HDWveFIQgwYgn6ceO16O5ofNSSi46gvtaGGze++qBnzPTNEHZnjGWNJbnuwveZXg+2JbGpqjvwRj+/T2sdCgO1M3mC+OwoYsx0QJMh3HZalAZ8IlO0nkNXJsalhZlWYLJ8bcFDyQAqZVHW/hQBmQsPOnt87dBfhlk4BLynYpG0X5pg9ALmmiEPvB51T2g539qdhsSNuV055uWIYWuA5TtaUnoOg47w9yePz7zebekqx4nxC9zlNSycQ1L7OibhRapjv2zV+jO57DBkJJbS/Bd1JrgMyqZiO4L8V30Jb3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WgtyTIpkp5sjmm1x3a5E6qLLvHZtByfc5GEVJecLyE=;
 b=peAR+nRT24W+eaY6qn4L6NbnrIr9emxbBKYtWAmjMpIj5oxOa3tqtjcW8HoHaQtzVashCgIcuBpnwYvZXt0sQOGNSJw9Ej3KJ8P8FjklS5ZSnELqAytcekVa4zsXD4/1a/hXfYRiKurz8yvdmuM6oHVeKXzX0QklwxaWUxp2yiOKjq+NLH7Wh3XKQwP+AW0LioZB/8WMfAaLi4g/WP7NG9cJPuFYcT7PhuurzjBk5KdlrJ0/Ze4aUOaC1YEywDzoMvNTelfKDmh8l84bBn8rHt9hf//CJ1p1OV1q7lW/aaUPKGJp6I/od6eiw7W/Qn9WbTY2pLfwjBkCea9Od6i1Xg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1316.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:246::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 05:58:25 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:58:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] rpm-sequoia-crypto-policy: upgrade to latest revision
Date: Wed,  7 Oct 2026 07:58:17 +0200
Message-ID: <20261007055820.59633-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
References: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0061.eurprd04.prod.outlook.com
 (2603:10a6:10:232::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: b3483a34-e37a-4a98-d6b2-08df24380053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|18002099003|10067099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	hRz9FUqt6iGoYlP2tc35vpB8cUfylMLUW6qEwbKa4mVc2j3hiliLD+bBX/PviTX4JEqHPnx4Vc0fjdKMEUZ7f9ETI+V8TWatB2aQQBXzKhFeai9NfFKdoSmwbsWErEXhoD/YY2mVonKqLB6w9WVQtzb3Zg4X67bzn8TY+Y8+oEht7qKo9OvmFfKiom9nkAF/fCipWZH2kW1bc0/nMXvJBOXQ5jFn09BYioe+KOjD2LCxEEJtVE2+deS1qLe/MDcr7YHmFpgAsnXHuB+fp9hJ7oLyG1ZX/tEkVKqRMnw+6UM0tRV8xygGLfx4unq/3+1EOMx1QAPxn+CamehVuU4hnEMUku9bUlDvvTM/Biaih1AmXcOPm6yG2fft2Vd+9FHCcl9h/oMPr6gKbwxf5N1xoSfxSX6yhxJCludmDVCS+LEOR5kHI/f7aCOuEcb9MxR/b35CmZcZWuO7BG2kstdJE+n2a56V2w5oEFx9B7IaWtfRw2Yfo02YRJOhYK5wVUOB3csBdKWGaWQ08cyADMoQYWDtYkYbyndxo3caYqXVO5FAr5eHr4UemuBS9/CirG6yhcBF99hRMtfYY27Yi9XkLwQC44mXRwvb9MLHP8s7okCnypqhX6f6lBP7GENlh+KK45ICaS5mKpVN7/Ek1kEi7CDHooLJ4iK9EyHm1SI2Lkc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N9df0aWs2f5gjeGh0pMifB84bBNtxMSzJ/soAA8s9J5fEjMz/IefPtVMhc8a?=
 =?us-ascii?Q?A2LXX+tgqHLovr5piX0x+nP1DUxkYGYocIj1CzkglH54mz62XED5oA3iVWGU?=
 =?us-ascii?Q?OfZYYRWRTm/BHb1hMXXdHQFI8enPlmqp2EFNGbUyBDu/377zl/NtNFrW3JLM?=
 =?us-ascii?Q?86obgjiP0thOvnZJl9q37jgEgYQnR36IkQBK2AYXrFSqsDoYLYbXB46jjMMa?=
 =?us-ascii?Q?+yfIGy+BeoHGHAXyVhvjTpn1NXCCJ8teaJKBIH9fQKiKWUkQCru/oQGlWk0q?=
 =?us-ascii?Q?6W7wCwgqH67g1JdK+NLj3DYafFkhb8JIQDKELJkcLXPF/DYdD9mqILqLtkko?=
 =?us-ascii?Q?H/hNTF4G9XsJwGS5C+X5aUDAsLvb9a7+S/Gh7r2IIRFUZTSLmTrvVaqQEcmL?=
 =?us-ascii?Q?u29zXZmmR2AfbexUnEyfEHOa3k2icqiZBEJytQ7aQyHG/e8CK1sORjEDA6f/?=
 =?us-ascii?Q?zUfFbX1XOmdM1zHpzn7UvY4PwuohRII/PILSo9OxJ0vqtD/IvqiJo+9atANi?=
 =?us-ascii?Q?jpTbds2obipDZl6mi33H72SUjyWyzYKI/LOvQC1g9nKEGtkY8luYKjJoJgmp?=
 =?us-ascii?Q?YahOUYuvtgVuSLbcFIymAgK+lLJULucO7l6cv84qgqcLADIcIwi9JRYixj6l?=
 =?us-ascii?Q?Dcn6/fR2LYQ7GvyRsku1V8VVRwy46/2waUP6E49diUPNf91gW8Dw8bKIwtJr?=
 =?us-ascii?Q?yRevw0H7geP2Kk5z3H8GGwlMuwffbu1/VWhshiPH1onGlusxSufN9Wh9EwXh?=
 =?us-ascii?Q?ECZuUPUEt9Z8b4JKh3t9pkYvPBf6y6n4U0+aUVLKrqFSzPcHP2o81B403RoS?=
 =?us-ascii?Q?aOMTPb6I3nzf7D/DG7h3V1Vi+lsfHglFF89jCyDmXRndc4p8yhuvxKvbGfd6?=
 =?us-ascii?Q?YgeggBDrMHi2bZ7ht5lCdNwnJMr+pw8DJqS3wWHrYLl/nQIqcCqKolDCzQbg?=
 =?us-ascii?Q?a56spYYA0RNiyedStpIM/4wm/Y+h0keQ5LICtuUr1EZtN0KKU4+2VIVlhUIT?=
 =?us-ascii?Q?JE4Agba2gz9iPccOrxxZJamvI99yP7z77y6jmdznVCaZXXevsvI4YpfwQCLM?=
 =?us-ascii?Q?ewDJSkPzVuJEn2gtbV/vv0HTh+MG+Oq/zYmjSjbUhjqmGoEdtiv2FThYoScO?=
 =?us-ascii?Q?DEfnWZN2O+62UBjlFXQ9BNySlaVHfgFQHzm+9YO9YM3/z9mh5lErDj1lJhcW?=
 =?us-ascii?Q?dmS83EKAVDjKogkVYmgiPbIQWnBOCvkLSLLXqpCsMgD9PSEq9KFhFsHH5iv5?=
 =?us-ascii?Q?KMwFsNQIaKpRIFFJn8wr1PtovDSV5c/tdhXMn8qW8+Bjfb6NfJbZq838YE3T?=
 =?us-ascii?Q?1Q+vbUUFZj/NwdZzy2SvkMahhjaK7q5oG/qhOeiGTAfYa4rFJUu5OzxbqNsn?=
 =?us-ascii?Q?gZpeJ0kD9XW70UbVwsTPH8kDXu2/ylkmJ89Xb3yxI+bnUtSySo0ZcYoen4HM?=
 =?us-ascii?Q?gMpsNWSrMBqUkxXhRuySJspAJgwJcY2NM7TjI1x4+/oXKZsN/30lVsm2zLGt?=
 =?us-ascii?Q?6wr7WackkSWDOtVeClP69CnmwyV+evfFJmEbD2PVM2Xp+dl/MffGCkt0z+Q5?=
 =?us-ascii?Q?UtxyAP+Fnw5PVygWK2iDMgeXYkMntIvPAM/d+muCffNaSSTk2PFLFchaffB5?=
 =?us-ascii?Q?NPx2azVovMxo3rivLDloKDrDYG+BIbFJ/rqmerj71hrHn1lmXZXcJcZauuAh?=
 =?us-ascii?Q?86g4dyO1FK8y7kNGX+d3H9c4+9bEiMxCC3Km291vhdOhZvVfrt1TIDeDl7A2?=
 =?us-ascii?Q?fKDFeSMhpp5vSi41hO+mQ4YShONwZZw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b3483a34-e37a-4a98-d6b2-08df24380053
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:58:25.2806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yYviuyNjFH7BCT/nt5lGrY+5EGf1RTjzeu9o9MakhzF5lEzVQ7NYuAhCmPzAmFG4jt32dB7V3Hs5YxBcE93HIv3QDI/9mjeeRoG37a3sMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247371

.gitlab-ci.yml: hardcode prebuilt image URLs for forks to use them
update-crypto-policies: add ruff ignore for positional arguments

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_gi=
t.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 7f7896cf85..ab6a3755e5 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
=20
 SRC_URI =3D "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;pro=
tocol=3Dhttps;branch=3Dmaster"
=20
-SRCREV =3D "359ab169da6a0d4d0fa09fed562bb0d56f470030"
+SRCREV =3D "14a7b30a95489e38e63c61779e2410cbf5884613"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 do_compile () {

