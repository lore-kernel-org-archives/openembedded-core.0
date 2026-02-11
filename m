Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF31E9E2FD
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:29:16 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17839.1770812946746889208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SPWBQzbN;
 spf=pass (domain: est.tech, ip: 52.101.83.60, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M28TDNFtYY5V70Go96XtllGxIBgnETi+NINEhu6gca4K35om04KLpiFJ8z8jk7F21OadQwcpx6Qei7SfrKffytvW0Q75j22Kd/T6rFWiLYJFAWwsAI9qao23UuxbneEMkYNk2bYzXFTIPFig0ECrwccOlrBQ0JwG1hNtIjIpVubCRkXWqFsM+/c4K34Mu8T+3ypy34lOzh4Tryk/DZbcDoZd5Uv1gkMwO7WSGGGsDv/Du5+A19AMlEANO9dIk3ZMajTdpamedqdMSKfvlkqNt8b5E46zqQ6rTYGoWueU00CQX/E6skgZ0NuoAoTrkbrvSjt3zo+jvl5+fFlIaY723w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSooP4tp7cylfq9HApB591pbYEhU4PX/s5kvxkPQTBQ=;
 b=PWnTHqrDlKm/agAnatrNJrv26k4ojqx2U8jxxqu0A9BnZHAcZ9s+bXjz4I+84yfs7bSFFMotnPsorYN2aYldLLY/rLTH4ItdTQfbmqKowXvGpzuL2AheDYlFCq+TboRf9BLnfn98izqOTbnPFhNrnIOCtr/BaAhYiWcu65E3pCD3txS6eyqxWllu8V4LbJvVAodOKCqXeV7/iJTkEV8uVhs1kT4JuG86sb9zcqjrW0v/hh4mZiUCHDBZgOdv7pnRJsoavdaiqpjLizVemNmOqoa5Fcdt25IZWEDrzXAw/lLHvqmcatjtD1jwSdFSDMEpIolOBfeD4ds9YOZAsR8bPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSooP4tp7cylfq9HApB591pbYEhU4PX/s5kvxkPQTBQ=;
 b=SPWBQzbNTMLHbu3xvUk3Vr3VyaZPhAsMm1+wpI3MMuStcHIj3MYW07yK55JgWq5ZpFYAJQguj3hXtspboG4w2c6vnEKTL6MU1Rpr3eWZwThOQQItqVca90O/Q/NoZgoCxmlpJrosbn24TGxj2YA73jo+t0jztNF8FaidntVpZhmsNcV13U3jcB+ZsjZyNreRaEDYl5PL3F/ExYF03u7JEaFPEqjXLxfIHbKCQwczNFWKQnN/F/qhVjx+IC5Ox2NcnrZm03iapO1PdeGaWRlHCuEDy/Q8MZUP8FL7ccH9Q1U5cJjL6tbZyxL/j61jbfpfXeMQjTC7oNhJQ3TxLQDLhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DBBP189MB1257.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 12:29:01 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 12:29:01 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libsolv: add ptest support
Date: Wed, 11 Feb 2026 13:28:52 +0100
Message-ID: <20260211122852.6057-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DBBP189MB1257:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa3baef-7876-4180-5614-08de696922aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NIC3lZ5EoaNPLZZZajfULxYNctvd0rn7iAAUt84SkobOHXqI/3gTtKT+UcHe?=
 =?us-ascii?Q?r3JlDbur1hPL2IMjrDGsZ1BPfoi6IhSrovK88Sc0GWBzPssKuHJVlKn7ZekV?=
 =?us-ascii?Q?gJLrPl8Oa5na0hBI6bgvArgka/xeP//s+12tBcc/rmrcwLc8eOaNbEOfeiBu?=
 =?us-ascii?Q?AE55cF2OgJV/d+qDspXEGTzZWcHP3mouSN7NmM1yNaboeWMtc4g+s+Kgy1ML?=
 =?us-ascii?Q?asELZRHm/oVdrCklLHQg/3+SfoJT/LTA9SaZqVppYp3HyAFEDpb1Y07pmYFQ?=
 =?us-ascii?Q?VP9Xle0+OjZkThlHAJvjosD0NXI3NUd5KZUKiCIhs7DBtuRPkSwhq6owRHoa?=
 =?us-ascii?Q?VX7FDtiV/3zLpI4Dz9w3AbC1ZU0vd7FaaTMbHH+zHUQGjfc/bgit/svM/y/v?=
 =?us-ascii?Q?O7CrFbuRlhol555+oIzWqnhND9P2eNXBsxLGdtF3Fp2A9cM+Yb+C0OuBvyg3?=
 =?us-ascii?Q?vZp5JShdjiZEFHoOJpoZeOrmxY0TC/aSgS9U4bizbg9DkC6D/s4Ens39YVnN?=
 =?us-ascii?Q?8npgXRnaNvXPn321NMrQjRWlcR2GXOFLiFAzRLium0nM63RI+Dhq423u26AP?=
 =?us-ascii?Q?kTy2eViRCUWY/vpEPtS8T2TVydkhjBvbQKMhYAhpSCkIgpKQKqb1TIaj8jmt?=
 =?us-ascii?Q?8XzjVICL1QnPuudbU4c4Et0AFQVAp4H5w3N7cwUzbq+iM/r0sGNNwZ/ZPE5H?=
 =?us-ascii?Q?ABA729KIO6DlJp3DSRxBoEFUs2EhRYcqkBO5PhRm9WqTgVav59cIHP6q7Mjm?=
 =?us-ascii?Q?VBgWlG20eCFVF3iUDGy0/qgwJsLAgdAxmEjzk5DnknX/mk+E80pDdmS2lHto?=
 =?us-ascii?Q?mylndYgHE0fNngAA9JGXieC6QLuL9N9GdZ5kFuNJvE4U1h1W5k8+hkWN+sXt?=
 =?us-ascii?Q?4rVHGAFrdHuxSOfgPEeDqTw6p3hIgKT/kX0U4bw1s4DOr+a1IxzsF5+jJWH/?=
 =?us-ascii?Q?De3NFVWcQpxiGOd6Dz+LlbQFVi3B/ZSlquuKkDYV1cxQIDqXrtZKczsIYYXz?=
 =?us-ascii?Q?BlAYgg4zZvVEJQ8hlM+xWyajTlaDqYlcAMmLJPJcwZ98sJz5rZjs335uMITp?=
 =?us-ascii?Q?Caw9EKTfyQGtYqY4mO94xrvTsDSwnZcKXvjMdMUouEdpQ3PPWOqg2MAanvKZ?=
 =?us-ascii?Q?GwpQbCMDRagmG8Pmw19PLTcNuLntXwZCMCvIrPiD+R9uU6wCcdZ/u9zMbCk9?=
 =?us-ascii?Q?Cgab6x40RuCMQl6uZSMb5+6qeUtWKkno+1pVzaNHVw4Yiq2Mqlcz+qyyWoHT?=
 =?us-ascii?Q?nIqTJYgwrmpyGis2iI44UiUX4IUjHqPZHjnz3Er1iVc4hgmwCNjOIi+GFbSJ?=
 =?us-ascii?Q?OFlHdNX/vkfd/dieMil6GyDNnRxCBMz0sHo3TUwXFKr3br3fmoT7isEGBjOJ?=
 =?us-ascii?Q?331FB6rJ1AnIezPwcm246KKBcxbR7lJv0lcxcV0GOrTROnSChEmO3+AXBPPF?=
 =?us-ascii?Q?mNDQg7WC8mPl99iKU4HegBmXDd47CLlitF1lAMBiL4eCo5ZY+A+QFq3zk9qT?=
 =?us-ascii?Q?B4jv4Y4KdLhUz3FIxBXaqH4lLaVDjwOZMQ73bzKLQdHH8sSlHOlyNHZZ8UKJ?=
 =?us-ascii?Q?enXqHOhaS0sv66wxHCI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p1QBloQ8PtYjRLcNjhJ14Jwtg9wGmUmGn2Pm0r8/MabFZ8NiV3MweeyDLxVU?=
 =?us-ascii?Q?WrofObXVZPJL5NdkhwaWfv1hq8k03T3h1uiZrbH+NhnuQEHzFNwsXINBXu0p?=
 =?us-ascii?Q?MzhOvHHAHk4RTj0Sg02AKsnEuBrJhK+KMuyYKOgrSpDUQCF/VEAYs5qZG9m2?=
 =?us-ascii?Q?N2XNShg69Mp8MxVlLHJ4zeWwnpOMFOyb/VmM2IBqEMJ+PEZCbp7cvwUP9Xqo?=
 =?us-ascii?Q?hh8BHhBUYAoxwbP17GyvnNiDuz6W3owKUqpSDCsq8TTKXwS1avFBo7hlxjTe?=
 =?us-ascii?Q?0DGeUvRhYMwvYC1+vXoQ9+mrP/7TA/aEnvPuKWqKsESqcrqmnlbyDatGtURl?=
 =?us-ascii?Q?NzWf738oUEMGXXlchTh1Rkwfa33CO/Q1bWuul4Bc0MUTztqqR2nr81T5Jb40?=
 =?us-ascii?Q?K1dTIhpRXiadgbhC/hi/hRGz4eoCP2g39RVMK0FAEXziqvTsHAPj/fPzhpg4?=
 =?us-ascii?Q?SqbDhig/cN6os8/GhU1A0+aAdtNWbozkBbmN0jWs/ZJUtll4xYdN5Mui+5nY?=
 =?us-ascii?Q?XLH8d7f/A0nReQ4gtQZClLzZsTVI6i0fjqPk8vI/K7fgJCv0h8Bt01SeZgQb?=
 =?us-ascii?Q?+dJ6UXz/GQjEvzrpP5sx9sUFLOFz9mSoeP+RIcD2ZbZ0Ue56dyNJhvUH4Fio?=
 =?us-ascii?Q?tY66ixD8cJuwG32fMbjYCnoObTHUetUKFEKXnNT59BNAtB/tNkLs37oZh/e2?=
 =?us-ascii?Q?aogGrR1hiIxvTixKqkvbtT1ZUD4L4Nu7NKCaqDdzNTiDYd226EkLuLxaxGz8?=
 =?us-ascii?Q?eXFOd0L1C1x9K9eR5Gq6ku+i7BWSWcD2WMojOQz9e/eX9P8hiXPmdDajCPP1?=
 =?us-ascii?Q?OI2CCwQ1wsxLhZo7rBf/0Cenv4vhn2HYK7gbbEkibxjxqSx2w23MxbFoavNN?=
 =?us-ascii?Q?YJTy3l6lQeKYd0wnQXFSCuAQwGAAu1TT1Fat/1CA8S3EGl/n77iTggep2KA7?=
 =?us-ascii?Q?TtpqqItgVB78KFHCfFJCvlhSeQAcD6gllHuIgDEEIvCMHSAQMx3y1Z14udtw?=
 =?us-ascii?Q?yodS3IQSXm0Z34mt8S1zWldwvxHqiqtvaW23KHd7cLcksYU7GeIg0u7x3UdP?=
 =?us-ascii?Q?7ki4BhO9gLLneX2Bx9PrGC3XeKEb2R91lqq3doSdO8KwqsBKWpXt+ALtswdp?=
 =?us-ascii?Q?rlOqBGXxikUIXjY0fCju7G8sIfsH5A4u2Cm0gFetzy4MHIZ8qG01ycQ3wXbp?=
 =?us-ascii?Q?6h2gpryJFGFpXXvqb7P+dsO/WuXswv7mEZGBruto1M128p+LIj7LnzVF7SCt?=
 =?us-ascii?Q?GIdp4R527+mdlJHcRUBUnU+aUVI50MaxEDjNPI2crdFZaw+VE+Ox7eO3QNOm?=
 =?us-ascii?Q?x82x1XmyCfjFSx/G6AJiis+B2KJdlORxe0zWfDrFajxYa3wQFddNUmHK9TsC?=
 =?us-ascii?Q?sN0V1Xfbv3tMjtMTLkWJ0+dTn5eC7J8Bd88dLyO6mhPSpwf3WQH2FNJWHC36?=
 =?us-ascii?Q?MNZAZZ9v0ixbb1/6WIt/2CAPCFf73lEbP0T0b3lX+O+KNAXyrNNwcbpumOyW?=
 =?us-ascii?Q?OxgYwUFGIwx1b5IVPxfJ5Djq2EWKO4r+PqmRSwVZCjaC9qQl9Uem+1SuGtMm?=
 =?us-ascii?Q?Ft3HH5o3PmgDT2Rj/29833nDhCJYRK/JWBShOC2109aggd7v6rV77ynwQRoq?=
 =?us-ascii?Q?PbHDIiMXhiJD6Atc8nCrwtFtUa7+JHc37QUm9f6PYi5t9Jb61lplbWqcmB6q?=
 =?us-ascii?Q?bLI3x25jLShjUDdbeB5lGt/mVmWwoV3KU60R2zi8Gt5xSLMtNDi+ip7jBsMr?=
 =?us-ascii?Q?PP5lhDYnjA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa3baef-7876-4180-5614-08de696922aa
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 12:29:00.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOzlJqyXHDEzyLSm7ALDr1q2n1/kQNIa4y2+7nL2Vj+3+HovPqg/NWhBJFJcv5dtTbSeSZm6q6exablJ40dicw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1257
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230983

Add ptest support to enable automated testing of libsolv
using ptest-runner.

The implementation uses upstream's test infrastructure:
testsolv binary, runtestcases.sh script, and testcase data.
The test suite runs 28 test categories covering solver
functionality, package dependencies, and repository handling.

All 28 upstream tests pass successfully on qemux86-64:
START: ptest-runner
BEGIN: /usr/lib/libsolv/ptest
conflict.t .......................................   Passed
forcebest.t ......................................   Passed
PASS: testcases/allowuninstall
job.t ............................................   Passed
learnt.t .........................................   Passed
recommends.t .....................................   Passed
requires.t .......................................   Passed
strongrecommends.t ...............................   Passed
update.t .........................................   Passed
yumobs.t .........................................   Passed
PASS: testcases/alternative
ptf.t ............................................   Passed
retracted.t ......................................   Passed
PASS: testcases/blacklist
choice1.t ........................................   Passed
choice1b.t .......................................   Passed
choice2.t ........................................   Passed
choice2b.t .......................................   Passed
choice3.t ........................................   Passed
choice3b.t .......................................   Passed
choice4.t ........................................   Passed
choice5.t ........................................   Passed
choice6.t ........................................   Passed
choice7.t ........................................   Passed
PASS: testcases/choicerules
default.t ........................................   Passed
enhanced.t .......................................   Passed
oldversion.t .....................................   Passed
suggested.t ......................................   Passed
versioned.t ......................................   Passed
versioned2.t .....................................   Passed
PASS: testcases/choose
cleandeps_dup.t ..................................   Passed
cleandeps_in.t ...................................   Passed
cleandeps_up.t ...................................   Passed
cleandeps_up3.t ..................................   Passed
mistake.t ........................................   Passed
PASS: testcases/cleandeps
and.t ............................................   Passed
andor.t ..........................................   Passed
if.t .............................................   Passed
ifelse.t .........................................   Passed
ifelse_rec.t .....................................   Passed
or.t .............................................   Passed
orand.t ..........................................   Passed
PASS: testcases/cplxdeps
dup_allowuninstall.t .............................   Passed
dup_multiversion1.t ..............................   Passed
dup_multiversion2.t ..............................   Passed
dup_multiversion3.t ..............................   Passed
dup_noarchchange.t ...............................   Passed
dup_orphan1.t ....................................   Passed
dup_orphan2.t ....................................   Passed
dup_orphan3.t ....................................   Passed
PASS: testcases/distupgrade
caret.t ..........................................   Passed
testevr.t ........................................   Passed
PASS: testcases/evrcmp
excludefromweak-obsoletes.t ......................   Passed
excludefromweak.t ................................   Passed
PASS: testcases/excludefromweak
recommends.t .....................................   Passed
recommends2.t ....................................   Passed
requires.t .......................................   Passed
single.t .........................................   Passed
supplements.t ....................................   Passed
PASS: testcases/favor
best.t ...........................................   Passed
installed.t ......................................   Passed
new1.t ...........................................   Passed
new2.t ...........................................   Passed
normal.t .........................................   Passed
PASS: testcases/focus
forcebest_dup.t ..................................   Passed
forcebest_in.t ...................................   Passed
forcebest_up.t ...................................   Passed
PASS: testcases/forcebest
best.t ...........................................   Passed
dup.t ............................................   Passed
PASS: testcases/lock
infarch_install_best.t ...........................   Passed
lockstep_install.t ...............................   Passed
lockstep_update.t ................................   Passed
PASS: testcases/lockstep
multiversion.t ...................................   Passed
update.t .........................................   Passed
update2.t ........................................   Passed
PASS: testcases/multiversion
namespaceprovides.t ..............................   Passed
PASS: testcases/namespace
pubg1.t ..........................................   Passed
pubg2.t ..........................................   Passed
PASS: testcases/proof
recommended_conflicts.t ..........................   Passed
recommended_multirepo.t ..........................   Passed
recommended_oldversion.t .........................   Passed
recommended_targeted.t ...........................   Passed
recommended_version.t ............................   Passed
suggested_conflicts.t ............................   Passed
suggested_multirepo.t ............................   Passed
suggested_oldversion.t ...........................   Passed
suggested_targeted.t .............................   Passed
suggested_version.t ..............................   Passed
PASS: testcases/recommendations
assert.t .........................................   Passed
mm-test.t ........................................   Passed
reuse.t ..........................................   Passed
PASS: testcases/sat
disable: unknown package 'E-1-1.src@available'
disable: unknown package 'F-1-1.src@available'
selection_canon_rpm.t ............................   Passed
selection_filelist.t .............................   Passed
selection_matchdeps.t ............................   Passed
selection_matchsolvable.t ........................   Passed
selection_name.t .................................   Passed
selection_provides.t .............................   Passed
PASS: testcases/selection
strictrepoprio.t .................................   Passed
PASS: testcases/strictrepoprio
break.t ..........................................   Passed
disfavored.t .....................................   Passed
strongr.t ........................................   Passed
PASS: testcases/strongrecommends
targeted_color.t .................................   Passed
targeted_dup.t ...................................   Passed
targeted_up.t ....................................   Passed
PASS: testcases/targeted
nested.t .........................................   Passed
str2dep.t ........................................   Passed
PASS: testcases/testcase
supplements_implicitobsoleteusescolors.t .........   Passed
PASS: testcases/weakdeps
dup.t ............................................   Passed
dup2.t ...........................................   Passed
forcebest_in.t ...................................   Passed
forcebest_up.t ...................................   Passed
PASS: testcases/whatprovideswithdisabled
split.t ..........................................   Passed
split2.t .........................................   Passed
PASS: testcases/yumobs
DURATION: 7
END: /usr/lib/libsolv/ptest
STOP: ptest-runner

Note: runtestcases.sh requires bash as it uses bash-specific features.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../conf/distro/include/ptest-packagelists.inc |  1 +
 .../recipes-extended/libsolv/libsolv/run-ptest | 12 ++++++++++++
 .../recipes-extended/libsolv/libsolv_0.7.35.bb | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/libsolv/libsolv/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b9616e9bf4..fbbd118255 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -36,6 +36,7 @@ PTESTS_FAST =3D "\
     libnl \
     libpcre \
     librsvg \
+    libsolv \
     libssh2 \
     libtest-fatal-perl \
     libtest-needs-perl \
diff --git a/meta/recipes-extended/libsolv/libsolv/run-ptest b/meta/recipes=
-extended/libsolv/libsolv/run-ptest
new file mode 100755
index 0000000000..857b719ae5
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd test
+
+for t in testcases/*; do
+    ./runtestcases.sh ../tools/testsolv $t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.35.bb
index ec74308bb5..d42623b413 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -10,13 +10,14 @@ DEPENDS =3D "expat zlib zstd"
=20
 SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV} \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
+           file://run-ptest \
 "
=20
 SRCREV =3D "fb4b4340d46108cb365113e432642d6024886c7a"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-inherit cmake
+inherit cmake ptest
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm',=
'rpm','',d)}"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPMMD=3DON -DENABLE_RPMDB=3DON,,rpm"
@@ -29,3 +30,18 @@ FILES:${PN}-tools =3D "${bindir}/*"
 FILES:${PN}ext =3D "${libdir}/${PN}ext.so.*"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    cmake_runcmake_build --target testsolv
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tools
+    install -d ${D}${PTEST_PATH}/test
+
+    install -m 0755 ${B}/tools/testsolv ${D}${PTEST_PATH}/tools/
+    install -m 0755 ${S}/test/runtestcases.sh ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/testcases ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash"
--=20
2.43.0


