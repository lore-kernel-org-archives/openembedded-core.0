Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A95C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:10:53 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.65])
 by mx.groups.io with SMTP id smtpd.web11.2500.1711041043776646090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 10:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FU/RToG3;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FU/RToG3;
 spf=pass (domain: arm.com, ip: 40.107.241.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VSubucnmM4oPIZDOfdh2Yvcq/pKCu4fwQu+hg9HRcFKjtr2y264+GHu0OxOd/Sub7jA8YODGSRCZ5SW+KH5FDwJ3sXbdZZ2j3sStNX8Xf9eG7mji9l0+k8LszmIGTBn1xms/LEAUvwUPnlvyMxkf/fII3V2/+9fkuNY95bdeEb+YKBrdJv6A+V90mBzwME8v9sFg1wYhvLCJke6aNMqk6aRnpeAuZynubnuRwaaLcZcdi8Nq6yNisgTtJ6jAqTzLJzMHPC3UzHdrq5sHKAG5kPygoPn6Ylj28GUR5hvj3s4+BrG90E8oG2rm7mNzOQkX7zcB9y4TOeWDlsq1cJ27gQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXxhWdHMzQ7J5vwLqxyfv0H75cXFDQC2Mo836watWNQ=;
 b=OH6HSLOezP0gL9tQ0bIfXNyhEaHzMMBbXOlYt7PRTkPhOPuRHv3bOURZDFO69/0/6wxuQdt4JkZtIXL9MB2u+gfr4vF1ZL5KovdFpVCAstV7/F+sGkksSCq18Hs3XFXwExNIiDypcEYywshu5ek1qHBQuQ69yqsZxqnGfTtt0Ra1yamy4Ey9ZH1egwFYlN4bjDR4qPHKxLOMOOK7eHv97THwXPlR7rBwuyUqO6C5KBpjaZW2jdZTxic4WbiLTs/RstGPPoZZ0SzCCwC3VQvRovGD4zE1Z2gJAUmpzX9EtZQelOLdAuRAL6+/xjhrwZFQUjJuAzi+eIhaZ1KsUuS+Sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXxhWdHMzQ7J5vwLqxyfv0H75cXFDQC2Mo836watWNQ=;
 b=FU/RToG3CqPLlmtQnYSNnDWMSk10M9NRXaclB4JTqk8tvmTP6GzK0Ymox622+ul1K0m5cepyjahbCMs39o0y97yA4LdwyiP1YehBICKFqnP3zACuYzd2lWMm7/mq4KysPrKRSfnAjjS+w+dd/BANAKCppFRtKqDEE9EjinOaMcY=
Received: from DB8PR03CA0016.eurprd03.prod.outlook.com (2603:10a6:10:be::29)
 by AM0PR08MB5492.eurprd08.prod.outlook.com (2603:10a6:208:185::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 17:10:38 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::d2) by DB8PR03CA0016.outlook.office365.com
 (2603:10a6:10:be::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 17:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 17:10:38 +0000
Received: ("Tessian outbound e26069fc76b9:v300"); Thu, 21 Mar 2024 17:10:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ad8477ac3b54dcf
X-CR-MTA-TID: 64aa7808
Received: from 9ba0def9845f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EB4646CB-E0ED-4297-9487-2041DF5BBE96.1;
	Thu, 21 Mar 2024 17:10:31 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ba0def9845f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 21 Mar 2024 17:10:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5WT8KoykXMogDvYgo7FcgM/5B925lnaww3URQZsV7pEBRtifcaPtEuZk/g9FmJ7DR7/a+otxJZkQt9boyfdelR179hkN6QJZjk3YIsr6+2yjaBG2128+Moipan1tHAZXN8NGHeTNZHD342Jtl3Dj1i8aU/qw1fL01dxtJQijwIA/eoq/iFRybx0HMpKNnvlCN0luTVmQ0aDT0AiS3eXTvDK+RZKkqYUcMj2LEmq6davhPP4sc56mLE8GySkhXtkE4zuYafwEATkjCZBeHMECGOYJvbDuHy+ZccQhAGZqTL2ayQgusY39aFfn5haEYgyTuA22+S89Nz6Bsltjijo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXxhWdHMzQ7J5vwLqxyfv0H75cXFDQC2Mo836watWNQ=;
 b=VwEWRruaUBPB0AmQHvUtQMBorCv6Ipwm47PpLO5ZumcFDMwAeuEwOaeHagrAgH8ZRcJOgasyasiXikFjx/0lfKBNwMx9yxayYUKBYvT7mKIX60CqQLIU6D7z9Wgqb0NlSP5wlrdKR816toJdQUvyWLsqUXzleGMy4bJc50D+RtMELKyqJ+BfDfPA3p1ezx6i4c4grevdBp4Ckj5EQQFpKF2K1Qkk5s5NrHkv43tpFfS8/BfJHA0I42C8G2jxKXT0KolCFNYof451brfmhV5WkbXPp0o2qa9ebMD5p3P7lGjeXiR5n4xU0LRTvx1yKEdGDxzixKSJsOXU/xfqdmBtuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXxhWdHMzQ7J5vwLqxyfv0H75cXFDQC2Mo836watWNQ=;
 b=FU/RToG3CqPLlmtQnYSNnDWMSk10M9NRXaclB4JTqk8tvmTP6GzK0Ymox622+ul1K0m5cepyjahbCMs39o0y97yA4LdwyiP1YehBICKFqnP3zACuYzd2lWMm7/mq4KysPrKRSfnAjjS+w+dd/BANAKCppFRtKqDEE9EjinOaMcY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10839.eurprd08.prod.outlook.com (2603:10a6:150:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.35; Thu, 21 Mar
 2024 17:10:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 17:10:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "emil.kronborg@protonmail.com" <emil.kronborg@protonmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH v2] python3-pytest: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH v2] python3-pytest: add CVE_PRODUCT
Thread-Index: AQHaeuEPnl3a2tFa00m3FKHlPhoW+bFCb4kA
Date: Thu, 21 Mar 2024 17:10:29 +0000
Message-ID: <4DA87E3A-7D0B-46A7-B937-E5E91072ABB2@arm.com>
References: <20240320160910.231632-1-emil.kronborg@protonmail.com>
In-Reply-To: <20240320160910.231632-1-emil.kronborg@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10839:EE_|DU2PEPF00028CFF:EE_|AM0PR08MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fdca50c-ac71-471a-2d08-08dc49c9d4b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NQX7FfEj2IV4TpdespZXMXNkpiBPl+z+ZIgV/ijS0L9acgS0O2VVD080y+q5znC7Mn+s2O6I6WwOhvK5aEoAxK2YfPVr0ImarDMNzpiRqZ5MYfmjrI9QoxrfzZSoFCtvP7Lpl0UqTrjGSToyMPLgychoQC6hiIQUStqHsmRJoA4RbxI+D6hIvjS0aTFXDzx3vFmSzlAcRtXCRvMK+VZIysLTRyRIBvK4k2x7s/OmDzuaS83iqasaTtNF5j8hlBFTx8wL3JnGYn1a+abBa0enWAtRuJEg/06OfCP3+BT0dxs0+j+jusdD3JuUBKbG4sZGYUlxI793rSsbz79PJAe6qf7YMBDMJbFn0mn51C6r/mkhbGa2p3tIv8Slk7XvyqgoeOus8VJfz3BuBoVxP+CUHlLEINbZeuFR2X1+yeV8VK4RlSO3UY8F+C2Kdnu/PvQEFHjKcDratIxMRoFN9kg5+qrhiqg//L1U4l26K4Cbuarc0HXvi5WaBTZiV74qVFW0rw7nXbhbn5rlUE8q7h1WuXiTf+xwHGdW1M3xeU5di+fhKjfJe8q6y6J6nzJ6eLLk9vjlioZMbTYubRJrmsfGCbeA5hAHXWDVAVmP9RBTt5cAoXl2QALYHyQvtNTRay/8BGpyrvlx9hAvDchbPziiQ/xsxeqDn1lUq12rPnCjoxXUrlH6rmEezw/zJIbd7d0+
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9ADD7A53830A824FA55665FEFD8D44F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c32a7cb1-71d4-4103-c063-08dc49c9cf37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3cSMYcBKLMuiQdorqr39Z4nZU4cNw7w/1VpEcuBXNaXlJe0WHVjitN6TDqsKC635U+HmLkwjLW/sOqopt742wvXAx179xcN5GBYUxNKgOt66Pj48bsB1e1TcrMaQ1XkdDWSz4aZ8rSx0JK+hXnfkLw3XUIMtcW/eFVkCBz/WlhqJGkQ5DvOXrkyv5BhLk8sItXdLJpczI+4p7bc4HzLnfW1dtewD6FuIXOz3tWL+CPTWtSJ95tTC6VfyLMeyvGoZ5TuWKAWXSmXWiNVBvHK/hPYF7zyQTHbz+Oz9Lc/9Du4ibOmgmwb8bm7UeaCXR6ZHGOK9xchBqcjohMDNntF7nG6a073u9Ng5iv+/2oki9j1GVo87U/mzE1OodJDtaOWUbNMCxLC0NS3JNkt5CrnbP0oMZFi2TpuSvXqwPOH2LMxmuppBY4RM0DhJ6jsKi02CaxRrI+M1wjjK8VNc3UgnUDOJqF0zyoET+kPqcAczW4lY/sxtrRgJaJrECxV/giqi96z9eoXpSLtKrbMjm/AbUoQzaiqZGSNY4XnDMSdv/3z0BX1GvDZwMk7d4hUYNJRZmAyJbLLCFz5EfR8odt4oASbFz5uJaWpOkq4Z/OsjMi7KemjlWzYOcDypgf3oWfelIqdIhMmyKwtHEivXjfycUMBSkwtDFh+tCwC3E/VOefJTy7FV3f9pCcs4Q15O3HQcUy8oomliiK+BtFFjHhh4uw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 17:10:38.5337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdca50c-ac71-471a-2d08-08dc49c9d4b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 17:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197419

On 20 Mar 2024, at 16:09, Emil Kronborg via lists.openembedded.org <emil.kr=
onborg=3Dprotonmail.com@lists.openembedded.org> wrote:
>=20
> For some reason, the CVE product is just called py and not pytest in the
> NIST NVD database. Since the database only accept keywords with at least
> 3 characters, the CVE vendor must also be specified.

I can only find two CVEs with the CPE pytest:py and either of them are actu=
ally related to the pytest package:

https://nvd.nist.gov/vuln/detail/CVE-2020-29651
https://nvd.nist.gov/vuln/detail/CVE-2022-42969

These issues relate to https://github.com/pytest-dev/py which is not pytest=
.

Ross=

