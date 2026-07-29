Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738B2C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 17:32:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17126.1785346330981092169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 10:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hViD42dp;
 spf=pass (domain: est.tech, ip: 52.101.72.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9nfjtW0IUuaIRNYKzelQjxfnY8Y6RzYWScvmDr36IcWyB8dfkm3A3ghF6VcYNrEaa9B4cgdD1XlhP3WtOzexYc7/KeDSYuRYp1Wz2+43JEtjerZAfAEJ/vYLimAPD3thXJqzY/K46q7GIPBT8MaeO9uqRv136vfwye8OLRiBR3LW56B5J4eDErZL3vH/iO0C2DLzuvv0hlsutYq7cAJadJrjuVJo2AHbJ01gYnOQM1By/4EXxWPUAzeK39U0L5r9WCPs0ZQkcP3iX/acurWbBnPLkduUqH6sSw01Wk1TRdHbpzRdLHmjNGNpz8xwqOuKTDjIyUJQHX0pf8G9iKQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Np9HzUgOOkoOxkOyZhQc99291g1Bn7/3zvxk5pPHYk=;
 b=G4uRvpyN3Mz3ijQ2m19VYIp+42XGYtNSlZiKmLY8lv71wW+OcXjsVkGPWKQ9IJcCdo7QQmxDmY6faMiZl6MnN7Cqj/WgUtkSitzdVYCh+6xXJIGhaj00JWVLP2Di00Q1sAGuEKHPqQy/8RFVduG82yhSSfbA8QqduQuNZKqsfSQnma3NUaW8pNIwSuxjedEKTJPRtKpKFLKLRw6ZwOxAPI6DoKegFUVBOJPJ5mQd8cAB6F0vK7c35gc8Urr0990Nx3Kaq+4hflQC3DPBabB75A1iMhHV+sJPqsQCTvp6EExfJ29l2IyF6CPGIZE0O9ll2vRkRnGeMY5uG1HFqiYzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Np9HzUgOOkoOxkOyZhQc99291g1Bn7/3zvxk5pPHYk=;
 b=hViD42dpT4BzF9KjyexCQkt+FyEo3EZatn/6Xvbuqq/riHYG21tKmZ4aaSfJZ6dtjA2eXdGlLIErY36Kx3z/q8SokE2LGeylHKdaAmmgmnlPnHpwta5wh4jsmohmXCmo4FYB2gJFv8JKrevyktWnHoiiOolvIbHVg7/dYg84bE5qY0or/0EOElznRv9RDFMSVIah0owJRRj/HQsE/bx0ZYQD8JQ/9jebb8RlpSz4+Amhq6jF4fscFNkQS3f/GFlcj8Ag+vgKTSMnAbtu2Sw55Dbhm7FQ9KxY1OwgjwZlKILp1+pQp14Dkz/EsYy2NkmfvDFwStRtlvsQ1G4noS6baw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAWP189MB2609.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:335::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:32:06 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 17:32:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] libarchive: upgrade 3.8.8 -> 3.8.9
Date: Wed, 29 Jul 2026 19:31:55 +0200
Message-ID: <20260729173157.71731-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0005F6F0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::258) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAWP189MB2609:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fdaa48-0444-4a4f-3bad-08deed974f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	i9E6WwM7nvUnBVcbD6xJhlma0bUbM6tg51C0tYTmV9v20ATsHFn5KAPqrN7bY9yA7/TORq0vyoWkXOOeTaG39lWmITpfGQ4hawZD5IC017H03S6I1RvKWhyzr14oJNL0hs+pD1Y+IjgE3RPhLqk2eojDSovu6HAh/DaxGrLqPSSHuK1snwlvdEru62Qo3lZNPZ4/NQCmDNzhD+L4ScVxm4boJwqpPgtv/bE/weET5++ynvXMb1ciLVFiy265HT1k87TnjEZbLw0fWgGSKoGvS5o5OdbNQzsRLw7A0II3/boGPb9idhgUSrzOpaCaCU4fdeC+0Q6JaR/kALBrAtNQ8uU9eNzZdPxKufaMjpvxYN6UMNjb3cePJJ+c/MRpJyKK60ne8XJOTubpq5KbzNi7/n0cAikUJ0gjAyTOURQMm5LjxkVUbWqkw9cWNCeDB0yyvmKDGxwSbdeGZN3FiscWOEm1J/TluqsaejsEywbXVGGSgYmhTp4rWbA1nvsU8KPPpDu0Nij8utE62u7Yasbi6TMPsB3qdfsQ2TxYSC1sNdMz7x2dLN0iiKtdJGuWnNGMddKkY8MAv+3lD5A/OX731FqE6ZrK49nk9xeji17YhpqpmvLgGdK9uhi8rF6XPuAlWeaCOJfErmjIBKKuWfhbni/yT9cEvzoqzIfoqkCbd00=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BHk7HsmHpQfXrjaV+AYSQJ7LkoNqPtcysjkjTL1T7pbaCZ9G/GauQWIPj7Vg?=
 =?us-ascii?Q?4KzWB52v/pQUrdw8BW/nqEyxO33Oyyrc0HmowgMjnKF0YAuOdvMh/XFCKwZ0?=
 =?us-ascii?Q?hVxDxHuTf/C4fzAP64AkfmwXlxuRJPmYe4K6zNu4seQJEKdCf54D4JEPAMub?=
 =?us-ascii?Q?37euOcrBeZ/csIATvCF6NSO6wAJpPZCRFj491uk72QbN8haDcHxvQg1MNWpU?=
 =?us-ascii?Q?MPTnqT8P6t4tFFFTDqaFEXsZRT5ArsGdGK2b0mhvGYItuDgcowL2PdA/GD2V?=
 =?us-ascii?Q?6kjy7F13Uj13Hp3TRKpum0kMZmKD16VF++pk6FeaCBKSLrB4cKX8jKPocJYi?=
 =?us-ascii?Q?2R7UIPIkjGuQygnrvHRwsqJbjPizM8E0dHFqBv6NlmZv1DZ7WYXOvqC5uX3r?=
 =?us-ascii?Q?mnq3l1BDKdpCbJu0xa50h1rhUtCuFuDAEFMoIbGihPMo7HVuKHk29HJrKcmy?=
 =?us-ascii?Q?7SlApKk6bFHaqZgI2QhtfykSvsfGWFUGSwWP2YeWMYlUYfy1WNK8hJyV8ksI?=
 =?us-ascii?Q?5VVeyhRreTdP1yZe0qBI1bmYm8FGU31+I6kMEn7cHe7Hmvsl28fmER88VR9H?=
 =?us-ascii?Q?TLMWLCxyMEWfExqIqn0Q3Mv8MyCJikuhcbet+IFErZnDxbiMVTBlUugUHD3x?=
 =?us-ascii?Q?6umCn83kd88HKJVGJ2dAOgk+OmfqnxG51PZl29jOFZcb3xQXKxjWh2CJiOq0?=
 =?us-ascii?Q?/bDbl0UE1eZiw8khAx2/KPBygUq72B2VVVR5OzDoUCU3R9TnjxsJFdgaCZPM?=
 =?us-ascii?Q?CC8+/+nx/nl4jl9kj5ldBE7yXXx67IDIbg9qYHUA6nlPmm8nGvwSH6Jzid35?=
 =?us-ascii?Q?lg0keoSDrHecbzh6zb+08OOpGbi7xzKmJja8FiSJLKOLbv3P+fLw4wqmOAEp?=
 =?us-ascii?Q?1r8WDp34XV9APF6qv+sA+Bctn8Eaa4HrsBLlspnbl9TYfAxmYC1DZVSCdH94?=
 =?us-ascii?Q?KAQ9zG3sM3ZgF5welhx3Qd3KZw7zOfPL233dGArq8F0HaAsp4JJS18iozrIh?=
 =?us-ascii?Q?YYiN5+o7PL8eno4ta1H7sKmoxSXpEnQq/aDM4ZBCDzomGgAX4XMzsBeMPU3/?=
 =?us-ascii?Q?oiaaJRabg2PwHhmeLXomtQKFQyZDahQdfld2zQz+JR569KfZtEG8M955fTmF?=
 =?us-ascii?Q?V7QsxFDE2ynoFbrXtPpNSgulgL2FfTmb/dV/lqjDsKZHt0gT0/4YcsAdu/dt?=
 =?us-ascii?Q?xBUQvwgLy//TCe82EzJJYMark8PjLvsNcxL8x0218RuHk3x04yd6ClpbYUXQ?=
 =?us-ascii?Q?11zMCk3wyF+9NFPwbH0TWtKLnT2N48nV2lCxUU9X3yvJ1OVw9loiCVb4I7ZV?=
 =?us-ascii?Q?qP8IgoOSzxU/sH8rHnKtyQHYun+KqrFMZswKruc3isRx/gLQYb9aPlNqYo+6?=
 =?us-ascii?Q?ZDrl7eAs+FWZmnV//T/74K8jmzfKFq3kFNTPgcttf3lD437bTjtUuyiFNWWj?=
 =?us-ascii?Q?sqCfKFhvOSEjkJCkDlnMPW5UKs6QYbcE5U+wWgO5kpf6CEEW2X2M9Upp3VlQ?=
 =?us-ascii?Q?9H0AXsRbyCzWFcp83zfAp6VR5BxEZvg7JeTDcJcAy7PfNe7UmUyzYzDoUgm9?=
 =?us-ascii?Q?3bpVo3EIwU2o2NXs7jPdS0mRUq2IW9ed79q2sIeMLO50lT/l7PJ/9k7LZyI8?=
 =?us-ascii?Q?lj6Sf0Lp3oNe640drgZcLxMwkFIHG7PjG+wEbHOEUedYSvmUh1z0geUfcj+K?=
 =?us-ascii?Q?fi9PyBrJTXXNjdbzkqnXK6DVUv10nySRszZOJr5ty2UA7Tn87bla8ydQuNUy?=
 =?us-ascii?Q?G+AGLBH1QMGjDyBcd8mnPclRKYZcIYrbau6P1D3SjGLVbvCMTwU4OsYng1RI?=
X-MS-Exchange-AntiSpam-MessageData-1: RIZy/7uHPGcTGAjZGVRI280Wtb/vwa/NPaI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fdaa48-0444-4a4f-3bad-08deed974f35
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 17:32:05.9294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqwDanpJxsrad2NoJrd00A+VqThAhTYcgcpVloEMlGQKiuoi2NCzhNYz5zY6J04q61R1MqpSqlKqOr6yBVbSUZgXtmyvu560uR9/uvo+dkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 17:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242281

Upgrade libarchive to 3.8.9, a security and bugfix release fixing
CVE-2026-14164, CVE-2026-15028, and CVE-2026-16517.

Also includes a fix for a new ptest that fails when no crypto library
is configured (upstream PR: https://github.com/libarchive/libarchive/pull/3=
335).

Jaipaul Cheernam (2):
  libarchive: upgrade 3.8.8 -> 3.8.9
  libarchive: fix ptest failure when built without crypto library

 ...aes256-streaming-test-when-no-crypto.patch | 46 +++++++++++++++++++
 ...ibarchive_3.8.8.bb =3D> libarchive_3.8.9.bb} |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-test-s=
kip-ppmd8-aes256-streaming-test-when-no-crypto.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.8.bb =3D> libarchi=
ve_3.8.9.bb} (95%)


