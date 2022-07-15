Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDC3C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:07:24 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.42])
 by mx.groups.io with SMTP id smtpd.web12.1139.1657901240978390450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=YifoiBgI;
 spf=pass (domain: kpit.com, ip: 40.107.222.42,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCGWuUfziNGrCOtMctjTOVG5Q2ljsS9DmwuLYg7nOadR+csAv/1l1vAXx2RHRV5wJM0e5+wLw/LKN14RLls9SPa6KqdQeLSk911GD15cqoReQtc7E7bpL+usanO9KGHviffu9hcaf5eiqCf9YP09HNMApXt6C3rap9pKIv+HGmOKzNeN4374RwXTTgj5+lv5Z29NJVk9hJiSTeYJdMnHD4wB5hjvTYU901pdYWgAj2HA1KEAqIdWDRKXuk6Mfj943G7wze/zXAS2+uFRWyRXTovWu3P3HBx7an5FUCooRPwMY48N9vefGfSu3Iw51Jjw3ESqAkuSjD9Lkb/6dctfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1Q6L70FabzkkA45wraJJHHCBuAmYJLmew4zxHlGQmE=;
 b=L+UlqpTdMYbkz9BwHAADjNS7ZmJC5sIFal0abEwCUhjPIVT8L1PzCU6RD0tIYzT6ee4oP0pH3gT8S+LcL7UDpkHY/vboJVgl89+JfWBuR3r+qbS7YaLXNS/5wJVUz45yJ9315Vpt7JATUu8LC0XfN3wcYA8zc29zfbdsUF9Aku3hOyXR+Zvnss6J2LKpYJj+RJRrb/X+25wOVpCyfWDfT7ds8y+BmShSFvq5KEnKuTVhRNteC/wJFO1LefGEyXTjohUzOOPVLx1fiFncn8eRsTf+7VhKWT80tW780Ul4adJSQzQdAcXJll1qoKB78HGJ7ZCI5KKLsa3PNnugfQwDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1Q6L70FabzkkA45wraJJHHCBuAmYJLmew4zxHlGQmE=;
 b=YifoiBgIeN1x5Ca8Ge/KSVRAkMU5ARv2S+l8p0ELfOWwNijdWNISDC0BNqOZ/aE+wmYENe0GztvRRcCES2Df7xWJuA9oDTGdojImhhB5/K2oEgD6OPuIPsVIpRQyrD/eYfKEOaCt7h7GWpPcGtyggQL4d9AXVy2vnZV/VMxG0Lc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MAXPR01MB2719.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 16:07:15 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed%4]) with mapi id 15.20.5438.017; Fri, 15 Jul 2022
 16:07:15 +0000
From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [OE-Core][dunfell][PATCH] cve-extra-exclusions.inc: Use
 CVE_CHECK_WHITELIST
Date: Fri, 15 Jul 2022 21:36:43 +0530
Message-Id: <20220715160643.29341-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::19) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b34fcf21-8865-405a-0c1e-08da667c158c
X-MS-TrafficTypeDiagnostic: MAXPR01MB2719:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TGKjSbkgEqy4r3wxcceLkTnYZIyjUjs+K1GmHwH0N/3CUVbLgXHg+ydeUBC34tt8AnrYSWnu3DWs24Y8hcFKF0yGSZUB0W4dfpaa9a6dgHZLAeXUKP23xoXQkLq/nyop1YJznUy3vMUNYZrs96vfPLT0mjx0H0bCUZnexFJE0To72cBP4MmA7KAHK2dgjpedRur8cJH96zg/SNG0XdgvJQq2iVSBMQxyz2yA+MgeEiyXyNb4LGc3dto06g/v4H5jY4x+UfxhZlmdi4Nx73JEAzcoOPwSEki9NUVbokpz8ORF0m4Ga6vlQE6HMErBZFgedtGuk2nEQWm0WvjU+iwIEh/LhM9W1SS2UOZ72NZuCnVoo7z/hfoAWO4og45fn+tz8zVk66ooDAcEbgp8eHE2cl4OIQNtm0s5LRs5s6TlGdEaY8kIvms4bqq6ImlLUCEuslHQDvufe/meAbU9CJHxWeAjBczzq8AlyEVH1loY3qvDkwdYuV1uHjk/ySq9sB6fw7+2jfWIDTMKyCC92NhuOhDvn5BlX42qBGigEjmexDz+Ge4PKuS58Gms7xwFCFBOqdKXJ1xHKVS75tPViwQIcjedyyut4OLMHg/79DBkoJebBiWHSDluJOUEbnIiyXX8FvLR0opMp9thfzVVZ86iouaRv8Da3GP2QZSBr5Vu25aRdL3tPqtK62/MFE2Vcu7VbawCcgWKf5e3Kv9j3lXU/61R8KBChCG2RubC8RJ5VDzXS+Ij4JfhY3m+I86WH9eaSbM5L3QFADWI4sGJp8Ko0w5SeBFj2t/Ema30RXPwVocbBPFjI12eoNi7TD6QZ9gek2lE7yfglB0curgCt3dHJUJdEBtQobumyANFseaxPwg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(5660300002)(44832011)(8936002)(66556008)(4326008)(26005)(66476007)(8676002)(2906002)(83380400001)(86362001)(52116002)(36756003)(1076003)(38100700002)(38350700002)(186003)(478600001)(966005)(6486002)(66946007)(316002)(6916009)(2616005)(41300700001)(6506007)(6512007)(66574015)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JooGw1aWZCtkIaX6AiI+ZhPHvCwK0RBoIN7z/gFbMzuwwSeA2C4iua4AS/Tv?=
 =?us-ascii?Q?R8q+4rJEWqdw1IVgZYwvRXWFqqJwCo+QvWxuva7XLp1tTiABCosKC9Sc5vpu?=
 =?us-ascii?Q?sNIcsP6BEZx7pwCX1AO+/FhIlCJus8CJ/cxVhUm5wf1g9icEG3w3wpxeW9LW?=
 =?us-ascii?Q?i87E6Bs4bwQ5Gr28csgZarG2jxYYhGYXVtSTFL+qUvRfQdEkXKOdrJdVBh2L?=
 =?us-ascii?Q?I/gG2UDfctg0zCXXIemw49bkX8QAHwtUDcO2JzuDAEtoybtCUh2sirRnpbGz?=
 =?us-ascii?Q?AlsMYsm+i1X3ThAS+JEVU7EmZTkcBMVbIBMH37Sm4xceOLITVzKAxqUO+KpK?=
 =?us-ascii?Q?B2eAL0rul2M9XSJ3JRM0I7WYnK7TD5+Xsfe+2Mwd2smi5sACsLsT4+Gf/5AJ?=
 =?us-ascii?Q?jmG83a7dLVa8pGOdj/yLNk/8S0vaBPHziM3GA/5v0KH1/lX1SKjKgQzLAwf9?=
 =?us-ascii?Q?iuteUINbV8wicCRzSCMRnPPPvO6ABtUYfTMVjOu6w2cOTW2cIsD783ThJYRF?=
 =?us-ascii?Q?8WkxwW38h07WJle8s93c0oXqO3j+rkJNx4WgWaa25lTU0jEMRBgbHCGZcn/E?=
 =?us-ascii?Q?iLYNJh4QShNhuuXY1F+3I3/pAMmFzIkbjiaobvV7eTE4pvNR1nbNttefSAon?=
 =?us-ascii?Q?A4tCxxMzWSYTafp186y4yS5Hca2jPUqXVz5WWG2IWRoOy0NmhGXWunxI+sxn?=
 =?us-ascii?Q?Vck4wVJptjybpiOI5NwI+etf4fuEQASfmk9mD2ZK5iQrbmAOn9dXh9TNeOg3?=
 =?us-ascii?Q?aKq2GMujEY0d05NmnfUR79c9Qk21dmmC9VMauvfU5IVeUji5uxKOzmNoJsdh?=
 =?us-ascii?Q?qeDXlRpJno9BXnNSsu6pkZkfsCy7IYY4SKgXheib2VgRfSN0MXLPUYDosQwz?=
 =?us-ascii?Q?3hNP9KzsGUkLUULS/2zsux6+U9z4nPwJM8AwC4xv749D09BJG2DxQq//W9Ya?=
 =?us-ascii?Q?zMiBdeVb0zmVqb4j8mtljxK+HWNanNlrccGqENJ2SwIrBWQVxAshJPvF6RQb?=
 =?us-ascii?Q?w8SSVkqEHsPGl9dVH2thac9R+gKImbPQsP+OTY6H2wh0IDpDXppMTENVn+ax?=
 =?us-ascii?Q?FKlg1ToD9zIWXQ9s066Nda2gP1AUCgaQqBEuDYy2KIBQQivoLs7XapcR0Zi/?=
 =?us-ascii?Q?pw63tZPabezuhM/xzbTQ2T5RVcAmvwJ3JE6O6z7REPVqXzFHIajxBC2VY16B?=
 =?us-ascii?Q?kWDky/hu9eQ+2gCgpqwbZLA2BqqzEI7DEHroQ/OCtvcO89bJJ9ZzLdGSBWaB?=
 =?us-ascii?Q?f/dzwQKLxEez0DgrwSkntEjpObZ3hS7PdOA1iXr6TaF2uxlmjtQCPvkpNq1l?=
 =?us-ascii?Q?cekYtZj1pH1HK/c2YNVqxKCZGITQmhJlGEV+BG2QVnm7Ps5HBlnqP72gCxen?=
 =?us-ascii?Q?ROJw/MXS2tIlx//b8Zk3AZPzCT+4iEmY9bPYXc3+0gY99Ao2fK3O6ltQ/1Gf?=
 =?us-ascii?Q?vyQuudIqVbzo67P2vEqx1cSBBIGgltJxjZN5gJSfBbov9bbDFrz6DUzEi4nP?=
 =?us-ascii?Q?3pwIQcVgV681A2A5RU8fOvTRlhBR0IhYerAd1GZ62Nz6ojVw0E9LkTQW/3/j?=
 =?us-ascii?Q?oII2X7RFy0Yf9zlfRrkoZhCd7kPCoOrk+BGe951w?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b34fcf21-8865-405a-0c1e-08da667c158c
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 16:07:15.2167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q6Hd0jjoVXJB7kvrSvtBHk3o0IzmP6SK3Oexvv344LFqXnXEkbSVYjeYUyj3Vx1SGPE7LIOzdRVq+1RKzcSykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:07:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168122

Use CVE_CHECK_WHITELIST as CVE_CHECK_IGNORE is not valid on dunfell
branch

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/=
distro/include/cve-extra-exclusions.inc
index 70442df991..f3490db9dd 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -57,19 +57,19 @@ CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418=
 CVE-2020-2981"
 # There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel=
/2021-02/msg06098.html
 # qemu maintainers say the patch is incorrect and should not be applied
 # Ignore from OE's perspectivee as the issue is of low impact, at worst si=
tting in an infinite loop rather than exploitable
-CVE_CHECK_IGNORE +=3D "CVE-2021-20255"
+CVE_CHECK_WHITELIST +=3D "CVE-2021-20255"

 # qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2019-12067
 # There was a proposed patch but rejected by upstream qemu. It is unclear =
if the issue can
 # still be reproduced or where exactly any bug is.
 # Ignore from OE's perspective as we'll pick up any fix when upstream acce=
pts one.
-CVE_CHECK_IGNORE +=3D "CVE-2019-12067"
+CVE_CHECK_WHITELIST +=3D "CVE-2019-12067"

 # nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2020-18974
 # It is a fuzzing related buffer overflow. It is of low impact since most =
devices
 # wouldn't expose an assembler. The upstream is inactive and there is litt=
le to be
 # done about the bug, ignore from an OE perspective.
-CVE_CHECK_IGNORE +=3D "CVE-2020-18974"
+CVE_CHECK_WHITELIST +=3D "CVE-2020-18974"



--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

