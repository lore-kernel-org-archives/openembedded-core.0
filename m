Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EC2CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:15:21 +0000 (UTC)
Received: from mx-relay22-hz1-if1.hornetsecurity.com (mx-relay22-hz1-if1.hornetsecurity.com [94.100.128.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7308.1779264912241215128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=QkpAjmWv;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.32, mailfrom: hsimeliere@witekio.com)
Received: from mail-norwayeastazon11023134.outbound.protection.outlook.com ([40.107.159.134]) by mx-gate22-hz1;
 Wed, 20 May 2026 10:15:10 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOp0f0yt4pL9PzV+b211c6oirQKyGok8F4jxgxF7W2HIbLwus3rFAvELZbNQ9X02wqTLxk1BxVOuHEgvZZ1EUkvjBN3tPuwCtfZrvaGmtfg4+aNMO7JQsdqgTD1SBFJ7hw/JapiBhlP0bC/RQKimH7Ae2I5T/Huz0Q+oeFrU0ZMu9cg0CKTMbbMNqykIb2g08xYCNFMVV/vPUUU+jXj5cpW7FXA1QKEB83z7PMLgxaKAQNYc7hlCtfPdbl/iM12kJb5vlTg3Uklzc+SBVUyjat59MpgF2DQLHZgN9C51JwEFeto/rGbkE8bE3m0qxZhDRBdyZUa9bOGQ8iz1DfVEFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqgYuSnR+cQFV2k2ab0NGsi7zOz5Sy+LRpczB7bXhs8=;
 b=FDFxRdL5cFvpmdMmuHRwrRLMTOVI6twKQcgUTF0ycjWUwxNwoJC/EQ5QH7nmJZmdK7C6pOgsnUfo8g0Tku7P07MheLYE6oLBr84BMJeLXwuf+GwRE75CDvNasygEd6t09uEN1Q+9i7B870hKXQJ709GgVcT2fmILRucnc6P6415BXNPiwixl30ZlBXJwnJZrTZNJbW/JwuDs71JrzwBWhX0kJr15gDFs8gJuKM4YBP+oEVr5O6ADOLMgteKPqHeDMVM4FJfZL+GlrFRKKU4TbRwsYy4iNwxHJ0J4bniYAA2uhDPWAKQDK2z8kkwaBElPisBfm5pcfO3bU9pQahR4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqgYuSnR+cQFV2k2ab0NGsi7zOz5Sy+LRpczB7bXhs8=;
 b=QkpAjmWvIRrgtsAiElL1ngccuY08c6/7zZhyRsq1lwrmdTcBky1a9uho/SoCInycrcYryDfke6rrygE2Mv8XLClPk0CB/lCWUR05bWSQ+TkmklGdM+r0dICkljcWjdQC73Auyk2dIfHweFiCB7xjF9xBHwZLv7tMUF2U3/sIqlbLO4s6Zh5SBGstwZo3sNkpj+wLL973aU43mQkYvvTVjuMsH0348V9D1ERHvzG+LW3jMUV1KWZ9n2AtHXELMf2SVnrtjaFJzPZuDurwwXlc7EznQZGbqa3MLTwXsX5WDl2RiO1F88i0UJqR13Wxq2dMx2FFpEuPtcreZckJIh8i3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU4P192MB2472.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:573::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 08:14:45 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:14:45 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 6/7] gnutls: Fix CVE-2026-42010
Date: Wed, 20 May 2026 10:14:02 +0200
Message-ID: <20260520081403.3052797-6-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0410.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU4P192MB2472:EE_
X-MS-Office365-Filtering-Correlation-Id: d62bfdca-3495-4202-7374-08deb647d9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|52116014|366016|13003099007|22082099003|56012099003|18002099003|12006099003|25016099003|29003799003;
X-Microsoft-Antispam-Message-Info: 
	828DH/VXtkrSpDJX/MxFkMh7sgC5nQdKtgItOaxUWIxHzBNW5ewgOLJXZ/tZC41fDasPepkHhfwk6D1+aIhbqBdig4ykaU0Oo38Buxn0xX/dPRyI4xUgS/GDw0r9CjtKey0iLavhPy8+480kkKQMbtIQywPMdmVeSXQ5cKIM2yfpP+DdWhnR+1zkK3Wy9vJMVPf+WUS612Bhg9h/koAky4YvGlZB1di9QQcZxVUlLcJ9MedWZ5iH34Z9H2X1HChR4yX+60A2Wql7hP+sSO/1p+C501Brhy+aGbbWdnErUffl1MiQ5Xj4y7BZMRM6DG3dC3uhPf2zqYXTbjxejFTkZH4XXGfBP3PxM63Bfz5pPENXYtz41/MXsp42JOTQCH+JhpUlqQUJtN4WMfiXesBk4FaiA1aBL9IptFhNRWt6GgsCquyLNa0XuiNDDwZJhOyMZek7cy6gzxv7r4jPBUHYKiE7uvaZpRjNJmzVjrFlTmxBL+NXXmPntdkz3uc7C4Woe5lS8kTLG9BgLrXP6tk7BBFA5ufwyQiCYHKAFb/XZt2yrlGUdthr+UL0O6Tm/6SIDOwYDFHDqBi9vT2p/lf+1RSHylDPRjW2jp2ecl+hnYNg9J0dMPB+KATVfNzqtDU2i8HVVpr4QN+f4cT1NHvUu26IsebtRxAgupWO5rx66p/XBYGEduRwfiNHmT4kjAal
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(52116014)(366016)(13003099007)(22082099003)(56012099003)(18002099003)(12006099003)(25016099003)(29003799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MI+K5CV5JgTxPDbK+6+QIE1VqABurrJE3hz5qQ86nPsMjWkGvc3hlfAsPK9b?=
 =?us-ascii?Q?ulzcycJ795sFFs5Ht+GCCN7YFTPzfed3gt4GMEJyfbC9dKi//b9qTCivvNqn?=
 =?us-ascii?Q?kx7ta3HI0tXV2S9IASYLfo8AUtpxADMgnA9bSvo16SrZBbHfdOxsIfpMSvAH?=
 =?us-ascii?Q?E4os6qHAxlV3TfLFwYb9iFm5aY6hLHidTQ9ZjXSUNEueowdiJVWQOwskntNR?=
 =?us-ascii?Q?dhe3MQEHNfQK9VXfPUsMCoSkYBhNLynjtv7blTlQ/fjqCqH9XGqS3z7q+FDW?=
 =?us-ascii?Q?hTV9fNOr9PaXu0wBJFeLa1/2xNCRh0DLxGg8kNR9cAc+0o+uQSZQ1LZvcT/h?=
 =?us-ascii?Q?iHLAw7NEBHhMxqaTcLY6kWml1kKhHZJH+zQiEfhA6y3zpL4zN919U2ixCg+5?=
 =?us-ascii?Q?HOWE4tpcUV5xLQsG36up361n+sWlhSk+YGEZNceMCeG+sG7zbAGgSSMdQ+1+?=
 =?us-ascii?Q?h34ITdIo2OZmVfusGVHAXsLsRykta8/dX1s8Ehi1aIKTgFQXvE00PSaK8A1e?=
 =?us-ascii?Q?7CHoYySFtH4BthMUAtGQzDuscVPwvbkRrQmL/Qf17LlQaN/KbqFvFJ/Roe2b?=
 =?us-ascii?Q?asiMi5pyegIlRYrEEaf5vnrXoBcuqxJWx52p0d592Mgo8OFRB3f2TP59OL1C?=
 =?us-ascii?Q?wgoB4AC3lMl63TPNYSw6yMBnv+j8m9zxAZOGLCQ+pfShE2qb4xbv9cc1OyBI?=
 =?us-ascii?Q?iqQAvYmm1JHnOPA8R/EM9GluYkp44OmhcdPYSnhrX/QPEFGsGGdusUZPgFS/?=
 =?us-ascii?Q?xvp7Vd6rlFRERq/xm2bga4Ka1rFDSB/5yX2Rj52YoeGlK3RgjWZezjFHtHT9?=
 =?us-ascii?Q?oXiYsEhXt6vFPTxzRbsijO1JjUu6WNf18vqtcSfjM/WgQV/6HJOF6VJ+hMfP?=
 =?us-ascii?Q?E0IEUTrPyGX83GNBhNKYiDKB3nobf6jTUSIQ5YdJ6Bnm9Tr53szZ15CE51cb?=
 =?us-ascii?Q?QN6vDGJ+6ZWNGmWqhmIaFVvjIzJs796+xRJcFn14gI1YyuPIsWwR9ispsDxC?=
 =?us-ascii?Q?g/KEY7ACgQ9vP4qzQRIj62ZlfNI53ykVeB2Pd8PclUFROTnfrXgzVKKvzEOe?=
 =?us-ascii?Q?mwImPfKcjH/3VW+oecHU3nHhAk257x8XZmsZH+LRILYVqenhzyJf9dJhPWyG?=
 =?us-ascii?Q?780epfa018JaJxVntPGj1CePWyMIF0dwI5xTyP3Lj8Mxx0XpiIja8zzYXv5d?=
 =?us-ascii?Q?PaiaMejTCGdpdoNm3KcTyy5QO7KcbXpg2dLFcT2iZ+KL8v4Vubs5EIfQ6SUK?=
 =?us-ascii?Q?/5KcpJtch+w2obWgpBysJZyyNPOn+KGVoI2fX+MI5vqh4Le9ztXsbxKhvR7R?=
 =?us-ascii?Q?AIVh1DPlU0MHoEI+w2AP+vHEfQNOhDMbgjI4fgXT7C2cZ/VN0358Fx56hIAm?=
 =?us-ascii?Q?IyzSL2Sf1jLQMNavk/4fF2cgMHZQAD67akMkHfdQpXx13LSh8JRiwAAlhKhP?=
 =?us-ascii?Q?rzd+5a/Y2bYqXfdDOu2xoz5SrVg/V1K+wFpNotpT/6sBhkSGYMCRHPmWsnY9?=
 =?us-ascii?Q?yPmhsMtMugmdKqM2H8Gt2jt/1dDWUOHOELK4dktHSVrVgBW6nGUsACgiDbQX?=
 =?us-ascii?Q?YHP9RkgJGdKNjBN2PMmT7djKPrSTt6ZPkovQIvCVizHNi89Gz09kHziAYSsJ?=
 =?us-ascii?Q?h9C9MCZDl2nJxl0jhndYY1pZ7kYJcdOE08W6vXTLwnwJ7zg9oHL6sMXqxUxT?=
 =?us-ascii?Q?FZS8qBFz6mNdlac/RYwJlWDFsl8C4MpYOPKqnUxLBh50y83HB6jUt647CKRC?=
 =?us-ascii?Q?4IwUnMFbltn9LAywTJSG5ckZUaTbRRCX6STjK1BGkTgynIL9OSxeLOqILOXS?=
X-MS-Exchange-AntiSpam-MessageData-1: xn8KPjvYXYH1Vg==
X-Exchange-RoutingPolicyChecked: 
	UNy4ZdVxYR5il44mddHM0QfCUvAdmPptpoG1iyJbdw2EF2mbh76JKeSioo0/JreN5epr1bWYAxQ0sdwTLO7Q+ZVEOpoSFaK9Q1+nepYL/Gas7KQeJf58w+ac4+53oVPv5Q1efZiBRVaxJCUs06Q2jSp8LVrNSC8XAIVDHzVu+Cdq/H675W95rII8dgjcdQmkXtv5T0Fr9GkuAQDLXImMkEOnQsvaux4Fd0sf3ujNLZbeW3U18vtEX4ObIlsTwGJ+fnc7Kr5AyzlWznRBB3/2tzwFmMmoJCWqZ6F8ffgGMXMZaL2s1Du/dCtFOmY6tatqqevfK+XgyqgAXAJz6zZxsg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Uy8UxkCWaninqLvEj05bWE2S/FhGBHYpqC+QlcGFdeoszrgjaolZkmnPdRr7cpASl/lRLPLtzSjtWboIdPSkGSRrXQbL4IIQ6qMZ8VGZHQzT7+PknTj46JUskIJG6EsJrRj+5x7oDo/Ybi55/VFC+li7rlakozcN0qSKc6uV1xcSUhZjwogj0DRWU+QLFJ56lHhl9zcGw/ySS1LfE+2pCh8kS+OrZWuFIbKPhZp+e7Wq+MUGbJrjOxDqw1BJrE2PJwU+QnKAqDQCJJ60BdKkBVqzJg/hRw7GE/33IIOIjRoGTfwO58nueh0FiGcVug94lEhAsQf06LhluUY+ePMODMlJNXdm9N4FUsZudNxjkXr3p+qrbS3PUiWbb7uDBOCl1wg14li1ZknON7WnKTJk03oY/6gmCRsn1jUYZtN0Z15l3Nhg9FNZcZJVJ6F/6tz916tGUxkpMeFRJP5deFr2nDXUKcEL/rEg4ACzMnZdwINsAULYZH66fxwtIEmMad0f8fk1bj4L0mecuWQsaMXJOzJrVkBQsqkgelSGlRqIjFGxPap4oz3KveHQ8nPlfu0anlQ/VAGHlniR9sDasF2+/n3TWD/Ie7pcy6nUe3Ui9z1pjvlWqwmf49m12mZKhLbt
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62bfdca-3495-4202-7374-08deb647d9f0
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:14:44.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCDOWUxPf1eePAHCrs7R6Vq0a5OjGOOAORNcEv6UmXV3YXghHcLNdvDn0+2RJRp7+c8RoAYtTmGd6tiE1Nuk5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P192MB2472
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate22-hz1 with 4gL48l6JwVz2BcqS
X-cloud-security-connect: mail-norwayeastazon11023134.outbound.protection.outlook.com[40.107.159.134], TLS=1, IP=40.107.159.134
X-cloud-security-Digest: d1d73ca04344f7e4c727bda2b7bcbc15
X-cloud-security: scantime:1.689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237398

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].

[1] https://gitlab.com/gnutls/gnutls/-/commit/cb1833afd9b6309563211b1c0a7c291f52ca98d5
[2] https://security-tracker.debian.org/tracker/CVE-2026-42010

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../gnutls/gnutls/CVE-2026-42010.patch        | 42 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
new file mode 100644
index 0000000000..59454cefe7
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
@@ -0,0 +1,42 @@
+From 590f730b1cd35202bb372480e6a0ac0c3d31933e Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 21 Apr 2026 19:26:10 +0200
+Subject: [PATCH] lib/auth/rsa_psk: fix binary PSK identity lookup
+
+A server looking up PSK username with a NUL-character in it
+was wrongfully matching username truncated at a NUL-character.
+Fix the check to compare up to the full username length.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1850
+Fixes: CVE-2026-42010
+Fixes: GNUTLS-SA-2026-04-29-4
+CVSS: 7.1 High CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:L/A:N
+
+CVE: CVE-2026-42010
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cb1833afd9b6309563211b1c0a7c291f52ca98d5]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit cb1833afd9b6309563211b1c0a7c291f52ca98d5)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/auth/rsa_psk.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c
+index 399fb4da1..a14de467a 100644
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -321,8 +321,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 	 * filled in if the key is not found.
+ 	 */
+ 	ret = _gnutls_psk_pwd_find_entry(session, info->username,
+-					 strlen(info->username), &pwd_psk,
+-					 NULL);
++					 info->username_len, &pwd_psk, NULL);
+ 	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index dc8e28c99b..0b3abb827c 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-3833.patch \
            file://CVE-2026-42015.patch \
            file://CVE-2026-42014.patch \
+           file://CVE-2026-42010.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


