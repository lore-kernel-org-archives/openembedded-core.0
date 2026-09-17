Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D155C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 06:24:18 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33387.1789626250840979173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 23:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=q4Q7qPJH;
 spf=pass (domain: axis.com, ip: 52.101.83.70, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/8U+T2D1lkTmtc/pLGUETkNoWYVbl089kGOmyBoo7i1ZDTLF/FQKp+E9SeaoipdzrZ8HYsFQtnzmByPhGV3D2Sqtemqn7IKo1f/gynk1U4WYgdu1ueBQTI5Lt6GhS7ghwsEBPDQmsjy373hg299tQft3VfX4bJRXWqgXWDM2AOZxcEfG5VpiUDJVzQKnZa8Y2D5ZM8+r/dHT5es8wj9FMfiu7Ii3tjNAImg8Y9tN/ciSz7dKs9/DAoP2IGKGQ0I5OB7UfnfIdWctbuOqpFZsCfbga77e4qX7emmeuhyqPhtzDpw1RFiObegaZMJoyU5ILSQRCMRD8IyFb35Yx9SOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZGdiQHsrah1BICVZIZgECHqqNrBwD6mL27l51Npqis=;
 b=e6YG5qD8UJ3mvaKPMF8vMyKu0wCB2AKV/jRrSrl1t4nTVy/4T5O5A2mHbYPdYa8BP50r4QAeUjnU3MflQrPwyrNocr3CiD2Ji2oIhh4YLfP18Iuzh0OSjTeowxbDsgKaJsO8UWh519oXEuCEtxEogIc6gVuh3Hhx2rAyYKcjvBkck4gTzeq5zlzH0Dh+gvGbOUAmp+jPkZ/kOMf3Gd7O9XYb/6RWLcplI0h2IsF7+IuAekpH5K9s+dv9q9doZWlm0feHmNyFySCtVlPwAwRADJqaTtmbg9FSthrUzGDm05zPqHUBbeCoX9f2x8SHBpkpLL9xZBJDlCuitAcZqIgr7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZGdiQHsrah1BICVZIZgECHqqNrBwD6mL27l51Npqis=;
 b=q4Q7qPJHDL74wRS++vmQEXp9uP1viAYxhJKEKM8aEXJ60eVpDuSFX+jSqWD/LfK060r7B8lgXm+uzFVWeY7TJL6hKfwUeVza4dxzXuR6BmgoSz7nTbXtsW5paIituB5BGXXdfXsrAtkr9DRz1Wyd2xVb070wtxkc+R19dVwT9M4=
Received: from DU2PR04CA0213.eurprd04.prod.outlook.com (2603:10a6:10:2b1::8)
 by PAVPR02MB9675.eurprd02.prod.outlook.com (2603:10a6:102:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 06:24:04 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::72) by DU2PR04CA0213.outlook.office365.com
 (2603:10a6:10:2b1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 06:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Thu, 17 Sep 2026 06:24:03 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 17 Sep
 2026 08:24:03 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 17 Sep
 2026 08:24:03 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 17 Sep 2026 08:24:03 +0200
Received: from pc58073-2410 (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 72A082AA6
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:24:03 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: ASSUME_PROVIDED and pkg-config-native
User-Agent: mu4e 1.12.13; emacs 32.0.50
Date: Thu, 17 Sep 2026 08:24:03 +0200
Message-ID: <jwqo6dwz98c.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|PAVPR02MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 84849c74-e074-4631-dd08-08df14844545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Kbd6tAQXHiVFur90lOS3Q1HbYOYTDKa9fBKShIAH8APDuzk2U3pRIOjfHhwbXVFoxkKfCE36jMPAzleguEi1nyF/rY5PHw+A3AgX2mWHL81qNNgZjbImwj9jofKaKaUUyTLsb0sgVKfU7OEOetM4vIFZbfsWn6lxAfuEuFER0z8KwF9mqI/WgKFwYFt+NssF9LhZxAq3gAWBIBkO+bwfcwrSLyJsKcu2G7d3jU2CmaVo0Bi2yG9rqiVeAN3jH/awhfe+mZac4Uz7yk5lNraoP71XWM+XQPusIX87OWSIh+kS18OoOrJzbgBRSrKioQmalMx9VaJV/tmd3/dLu0R1sYp8nO+8VtCVbc67iwoAHpo0I1iGWHF34lfbY3Z5AMYD+31LKj29hMp3Bpno6ZGu8d4u1Dk+WC+28PPxWcIKDmpILy8W6y12u/s7B/hs852pacavpKeVYQEqUkdtWdZfNFpLUiNHVxwI+CW15wXoOt9wJC2v1tagTKj+dspaQLRDVJhk4Fur+tp1ereiYCxJbRJZO2g11cMoBYbNG/VLU+wZjZgJab2L5cYZyTOVMR92Y1JEExK9hGUsbH2AVYwGcxK0LyUU5l832Mnpqf7M0X5JNwoZeDfyl9D5aF7TEwVVp+aInvmL3OW/qnHDLX3UdO5jCZTUsDGJTPKlNYZGqMkFRnnfkxPl5VHi8vDtTGixedz9kzfki2wEK7SnCo8+ZQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Mdvd7+iUR3aBZ4dER/K+4z9fIYQFDqfDWtxgzanV3b+XbdKLI8gZpwlleXJJLo4z6iop5O8feQQUQBCV5CWPwPAkBS0SIAjHnyhLLFBd24C5n74q3R/z0IopyuSUVmRU4JcdNnPz3ftI5auZdWd4GQWSwbD3Y4HlzOZ1160NTfDd7YsvGkukyLNPg7T+k6MsKNmegDvj0PyQtag3TjFvXjc+ZLZVO5HxHlc6ip7NVtRVdgYH4lHxoOu0xT+H8qt3tBR9y4Ujll9MICnA8eV7gzil0jktJ4v6x+5nEGJ9W7zYjrSWg8kvDSnZXqbAb6AQXN+9CA5FiDaW6YBjc5FwJQXDJ0GPpIq/p4/TdbYrz8g9aWeY7kGMbvKO0jqt4cc5dMF+N1ZFYbpHhSBPuzwE5euc2VSoVGqEpLO05LAp6fgIEj93KTdyoJ8zZKIvBxf6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:24:03.9842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84849c74-e074-4631-dd08-08df14844545
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 06:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246022

Hi,

It seems it's not possible to use pkg-config to find .pc files of
all native recipes that are in the ASSUME_PROVIDED list.  Is this
supposed to work and I'm doing something wrong?  I'd appreciate any
pointers. 

Some background: 

I ran into a problem with a recipe using the Meson that had

DEPENDS = "libxcrypt apr-util"
BBCLASSEXTEND = "native"

In the native case, libaprutil.so is linked against host
libcrypt.so.1, but this recipe tries to link against libxcrypt.so.2
from libxcrypt-native, causing a conflict.

apr-util does not DEPENDS on virtual/crypt; for target builds,  it's
pulled in via util-linux. Maybe virtual/crypt should be added to
PACKAGECONFIG[crypto], but that's not really the core issue here.

virtual/crypt-native is in ASSUME_PROVIDED.  When switching to DEPENDS =
"virtual/crypt" Meson's dependency('libxcrypt') can no longer find the
.pc file, neither in recipe-sysroot-native nor in
/usr/lib/x86_64-linux-gnu/pkgconfig.  The pkg-config-native and
pkg-config wrappers around pkgconf ensure that system library folders
are not searched.

I don't think EXTRA_NATIVE_PKGCONFIG_PATH can be used here.  We want the
system folders to be searched last, and ideally only for packages listed
in ASSUME_PROVIDED.  In my case the project depends on several libraries
whose options are found using pkg-config.  I don't want to accidentaly
find a system library for something that is not ASSUME_PROVIDED. 

-- 
Ola Nilsson

