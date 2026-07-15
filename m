Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FA2C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:20:37 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8022.1784128827701556105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=SLDUXB3S;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=n6vkgyIA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBYbNo4080073
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=; b=SLDUXB3SlNtcSxn+
	YSyp0+ukXZXWeQAQM+NmmbEvK5IqCMf3ete6EIb4m3tx0I20rVsXJknK1nMoePnW
	etr14tByxMmzd+irxlf27D1rhT3aHk63p/zzQw7e2iJazuQvYwopguSNwlaBgrVd
	XhQu+jy3szMbb/cnU8In2RuC2ZlgxZgW3Iwv+n3Z/WVMpk0qVrhjN41jyYLXCucZ
	sp9nZCNGePvpQcmFwVYKIr7RyTeVz20x/OzumVPM7qG7dNqSZsnfe85D2ta5Ox0q
	jAnUceMLBND4i3CD6H9YYZrcIbHu376XhjcCFO7ts5hw2rgVnpzmwtVHRTWDKIL0
	I4HiDA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fe9f08mbq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpUo6smJUyehERtTsadYNw1ZxNhMCVrTnv5EVjztPYc52y6mTQXlSeslQpT4Q0c8oMOJcscDZ7yj0W6wUwYDbogp6RMY8JMmfYVZlNbOupsA74KieG7B2exFbS2xparCHnh1um4xYd9gYncPfGqVaD0GuRPVZC3d/aj7JkYlg/a5Mh5jpn2SzFLouaHrhBxqNUMEEZSL+cvxv5V2MQsU+bC2EFCZ3TqkZ5/j79S+TnRiOm05/eqXA6OaZ19qBM5EUDioTmhErNNTmPZeCIpxjT97BFuGOxQmT/h4UbiAjJ13FLIqq/7nzUHuCsN9Nx+Y8spl00giE0G6XGHjyE9adQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=pSl9LpZQpDAYu3o1avehxgBIc3ZSwAEVM8qdi0b+HrWYIsbLwtS5G+fIwZN5MwIOfz6xm8AKEn9rwvzwl4yFlkRvYF8GU6ZGZl4IUzZk2BDJXs3xH6mQ2SvU814Mi5bsqRqaJBiIwraQbBEXQgSb2dBti/F5vBNQx0I+gx0cacvM5lADtXflhBAO5Zhfn6vIVQ8euvSetM9v93aUQcuE0b71D0NqXo7zQdQcuv09KpPyyFuCC0mH/J78LrEmVYrMQgVVewGJ7EjR68Q/Pdb9tOxwQnPMwJm3igA8SIcuq3CV3ZioTRytMO9yN+3oq5WpH8XMBpWoAHAwue8VvZOYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=n6vkgyIA8VvU+cH3/1JuG5OkHbJukvm/Xs4ZroSzIvvd9pi7C0wNIzoGQWVZU97nt4FBZFIBU4V0Lc+hjWgHkCBaF3Z1l1PQayJuXpVFrm4o0OQW/fu55jcg0Al9h5kOBPflNIb+8miEYBHuu1DSGxYJCk5j52gvMfqwLIUeToM=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SA1PR17MB5717.namprd17.prod.outlook.com (2603:10b6:806:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:20:24 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 15:20:24 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v2 1/3] go-vendor.bbclass: Fix test file exclusion and license propagation
Date: Wed, 15 Jul 2026 09:20:07 -0600
Message-ID: <20260715152011.3542412-2-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715152011.3542412-1-john.ripple@keysight.com>
References: <20260715152011.3542412-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0077.namprd22.prod.outlook.com
 (2603:10b6:930:80::29) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SA1PR17MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: e7cba583-e512-4faa-be60-08dee28497b5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	QZcK2d9gnbiXiY8zwd3l/eBgnTfm7+SWZGwUUAMEK5lI+c3NsBUy65elSwxfu6+OtBEaFl/xyFNZWIcbwgbF3BL4k3j5y7yATxdGkdvp8WPz+Pi/N0sPxxoKZqZjL22Rgah+4W2Z31eG+LCndvqjYsT9mY48MoLnT5CFz0sXiNxpOEzLevEI8YCZPW30IKcXYnGz498WQyemqRFfC3VTTFZyEcfJUNXiAYZaDTCm4wtRFC8X34y6PkFXVNMQVLBzrhJrxDUeBh+VLxqrnCLw3v7+avV43Qv6cxmQo6Wu77ljYKd1IpqXaUhGV6qTiVpCDzLNpG+2labBYCdsBqqgrwoPHEoTbNvGWGWDGCHfC/JE05PqGzGx6+TLx5fO4mXMId9P8BqQ8VKE1VDpcyfI4fr1hpBoBE9O/x/rHUuxkHjtMkbJcar4y/T2t2TTrSOZuUIaCUuwb4GHgH+goEBxHM5DnmKvJvYLfb+ew8Pw0G/aCU73Cd1gKdFbDYfZLFOg6ii7rb6BAlzxmQPoEdCFTDcUF+5tDi1g2LNvK3ArVnlhhMYYv+7KEG+X6Vl+5xEJjrqtDmWyM0cHwu0PNKQYWtL5xKVRF+BM7rY37ckGYVkH5s8fUxyTTV5ov51oM1uv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E1d5/VUolkLbq/3jvSKq4aLMv5KRmzLauctezA5emTzYWRNGmHdNkX+i+hCA?=
 =?us-ascii?Q?qNV9IsGcdCvDOwUrVj9IxSd5YLwymLI8lhdqFML9P2eQMPkJZQ7b88cYqj46?=
 =?us-ascii?Q?CchVoeMjziB59lMXsWtAPN7C4adfBgWpXYORzYHDHs7zaUfSclLfndwhEAUS?=
 =?us-ascii?Q?qYVKRsxcw0IBzpb8v0aXU6rjivMncWKs+P5pfqh2FgEUohprwwDcmVIeEo0V?=
 =?us-ascii?Q?x9yEIWw+7MYFWdehn/eAovzNkjlVHeBhL2VsxISyUyRbrZ2z7ubUcjT0zGIU?=
 =?us-ascii?Q?vwARvXBIijxCkd3eACusi6/4/PHIZFYcZ/Xas2wBdf2cnIkxYKTGlD1OXmy/?=
 =?us-ascii?Q?xri96XNO8K4YE0ImNUMKEmarL9Dffx2O2nsx9GciHzvrw3DiLeRHHakP4rYd?=
 =?us-ascii?Q?n99mAWYoH3qB9tGLiltfiLvtrMIi9V4R6qPFFeElSXTy9pymvbNPJctgaI4c?=
 =?us-ascii?Q?8Ktw2hs823Q5/sShfp6j96U9+VcohihhZu190z4M75CMoajOfykW4bqGLr6G?=
 =?us-ascii?Q?SKL8ArjJCfwzcBbPFwC0uUdpIDIgCcz2NcMo8llYChbq1hCeIxnOL6naOPRD?=
 =?us-ascii?Q?f7cAz20q+YCKwX/AlW9yoqeMJoguR7upp1dzmX8xqKboxyNtYfW1JVVXLd21?=
 =?us-ascii?Q?+oHALSxk47gi3WVdxO/9GbQSiDd/qQAxOB8BZl8AaGiFJftRWI+eDNl5ZZjb?=
 =?us-ascii?Q?OrmOyT/yhFInYggD4WG8jITU9eOiDhVR8I5XeTW3Z9L4BuZUb/obyuyOr6em?=
 =?us-ascii?Q?hdJ4imWqnpckOLfRbNchYm8IRjp134l7dyQ56P1kGZDFJKvUkgWpNrFpRMcQ?=
 =?us-ascii?Q?e9vB5HpAmsHJt4u7nYV11qBj+ACZMFhFCU0cJXpcZHN2ymsrW34sfw5041gD?=
 =?us-ascii?Q?QG6bLvumXY8oKzjnX2XYThUbLAH6qu6RVfgE95d7vN2TK70AxXscaskoQtYO?=
 =?us-ascii?Q?zZbFsgizZl0N4X3GhsAkGHBtKOswzmpzEL3/9msi2xK7xI/kkUJCffEX3uFl?=
 =?us-ascii?Q?pu+eCduVqbtrHSVYq1imfR/3gtDAoZpnGNnm4xj1ewLsH9zDQtWiiQl9hLh9?=
 =?us-ascii?Q?GrNyoHLSFgtVtgkuNnmMh9TaDdzGxdU8n3lzfTylCtwaRlWDuKq/6tA1IEMm?=
 =?us-ascii?Q?4mhOgDMORqYmWOXt+CXZyzYkshoD3HuTegZqjqkPaKkm6V/GodR+OY48xrh4?=
 =?us-ascii?Q?kxvnQXUsVeqVI44K9EymIoknHKov/m0oBQgLVELZLuM6auDY4fZu1ZbjoNS+?=
 =?us-ascii?Q?dUar+yOvL13JRUBhZtA5BfBisdcn/eyNBJsUsROPxVd1P+bLgvXBXdwL7Ime?=
 =?us-ascii?Q?aSW0OoiC71vdHqip/x/DeHKWASrH3FGGCnHxt4vXguua3ZHwgaD2B4AOZOQh?=
 =?us-ascii?Q?Qq8/z4JfZ4uiAfSXhI9AF4ADrpNBDhIorc0HMS4lRca1Eh2ILIS2oOeZWF63?=
 =?us-ascii?Q?zKn+KKhdYgfrPNYaSbfmhXxapxEgpi5IxO7yinzntIlELPVE6dSSyK49i3fw?=
 =?us-ascii?Q?tl71mRCYx9pe6jAYkzylgQaRupauHqN4B/irBnj3Ig8wgx7rqzUEodAXuYFd?=
 =?us-ascii?Q?VbGnSlu+Df5JyNF7qZhI/TWA/7c+nlYN6gOh3tp0A0+12zNKt7Y9OF2CJssO?=
 =?us-ascii?Q?i85HuYJe5XeVNNWhyvAAUDabNc+1jPq8lxQxZkGAJVuxIHwyiWVSPFpYudWw?=
 =?us-ascii?Q?KPMa/L9cMyc7xsinUsLLiX7y/9SeCo1Yws/pQiCwTSt8uZKxPXdj+SjSqgIv?=
 =?us-ascii?Q?wMDQs7F8zA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	CzEE8ixWgck+ppnf9iYE+aoHO9wSNz2eCA3FpM6r+9CZQA0Tz5u+xuVsV8HLCNMMvNPRLEhGuJsp9y96yKzRdFm9JtvnGs1zarnD553A4vlTD6mMK+QnFN0CY/AvXVsjdkocGfN77VCSqeBypLyeFucfh8w4/YC+nEIuOaAFwwjpCZOg25AIxKzDaObUJVESvb3gI2QEj0HiDKb9S1MLbQLVuokqN2HK2az3/oglnOkCDtK1DX3RW0Opo8RI0ED60Mus7edQNbcRMbXoo78j9Cks05fIfAYG7+AATFOr+rwBPIkn3c4BFrerPIdBtD51oxdqZdvdfMs6TxyllPhlyQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	o9Fix+Ajyxi0a6NQZHCTr0y3ShLUxWMxfpTnvUOKC/sAkLAkGsQvXO2HhpAsoT+bCcXaajAGh69ucvWWDGay0x/k5zYvgxcsAHe57EkYMYMaLT9FdyAo8w1GniWgq4sKQ5FvQnoy2yI3o7DzDfV9hzIzUmdnniunnOqKCYGi5vIkO9gi9rxZN6VyORseqsJfyNikHLecy5KBwrb1PJp9+FTP247qFkBZ/ewC6xRoZaY2xdYayJLmmnwXL0wak8g2eBNppZDoYqizPUFUdE2w9sjlIHzT+egRzSg6OckEp3bxYTGCMf7Jmo6yfndJnOgIxI++ybgGQqmyG54bwJgO8qKtfEXIuQ9jXOQ30pV+rE0FhauCgWI6HV0w24ltHV4n18cryJi8redBiMGJkXOqjingnb2aBL5bnEapE+PgS/pbsT/dyfIbum+/RLeuCa6cNrVIiv8Cs3GdUWoxb5cefa2uX6xshBpjrQf+8sQtekD/mJppNII6I+pV1eSTAIkUD1wj2T3GugxUqJ4JeDuF0piXl8qfLNcBvvEp4RmTEsn+T0jQz95VyOkI6MU4oE/rTOUc/MgrQpAZ9WeqcZwinh5loBh7Nl76AKqCJd0y4MeSawN4GvnuyRnXGnLtgMGM
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cba583-e512-4faa-be60-08dee28497b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:20:24.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hRQC9Po9HKoMSOmJUWTukQtLFh1HXSvTMeRxIgpuQ7ZEjuiVgLy6NQfw4SXSx+ionARadSlrwE/YqZTCDPpOVRnLCzxAJlpyGM/rjeSCQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB5717
X-Proofpoint-ORIG-GUID: OZC4k9rV6IlfSFKTAKhVM4HruAvplJj-
X-Proofpoint-GUID: OZC4k9rV6IlfSFKTAKhVM4HruAvplJj-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfXzi3ec8NcjvuE
 WKOrO30OvrEuY84MWyMCRVWJVwBHUUq5/++QfQNv5x/V2aQH3JGp9yomjzOqvaQuB0+GqGnI5dy
 k3yF/wyrU9+FHv5/Hwh1RXA+fWOn4kdqi/hNnE+o3sMsaxXc4Lf3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfX+FU03KvNVq0Q
 7psDBJkWPrm/OrfYxVGWKhdYckkr1vQf9Z3EUQksq+//1mavvIj08Bp/YOCqQ9fXN6PrnCJlfuZ
 PuQshZH/9iYWV+s5XOTZuDJvhMcxFulXIxR39Su60Ic+7wLNbvBo9JuhYlmxp42tXVdepUF7T6J
 TCex7dcet7ljyBxX4VTWJv/MuoyBw21tKMFdbRCIdan/L/PxRq5P5d/x5BvQWvg5JKUMMc7DmK9
 WtG6+BUxK4D4K1LqyAj9kXNsJZmBekZ7e1Jsu4cLCKe6npAn8TyTdjWfdANCMJhczrbQOfeV6wH
 3VZPkyMXZ4UzlytVkQ0n9lFQRh7JXb1pVa3dom2TXgoB7mpknArCG+HUEMlOe5W/yWz/Dv2pBZl
 2zjSXzg8EiSNVVr/4aIf/A8Vv+fQHALpNI/esLFX1hBnza73pZxOqhNCRiR4aj3kGZy0Bw6tdC7
 ogYBxhwrszI8t5G+jZA==
X-Authority-Analysis: v=2.4 cv=a7EAM0SF c=1 sm=1 tr=0 ts=6a57a53a cx=c_pps
 a=5QB7A90Jg1Mn+JdiV6um6w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=at2XMroQgvxonBsO-bql:22
 a=plf8rDjJAAAA:8 a=F6MVbVVLAAAA:8 a=CKkP6PFZCmJgk5SHP5AA:9
 a=JWTSs7K9Rhv-lrTctFka:22 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11847
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240976

Two bugs in do_go_vendor:

1. The shutil.ignore_patterns glob was "*._test.go" (with an extra dot),
   which never matches standard Go test files (*_test.go). Remove the
   extra dot.

2. The license-propagation block used os.path.join(src, "LICENSE") as the
   copy destination, writing into the already-processed vendor.fetch source
   tree rather than into the vendor destination directory.  Switch to
   os.path.join(dst, "LICENSE") so the LICENSE lands in vendor/ where go
   tools and licence scanners expect it.  Also fix the guard condition from
   not os.path.exists(subdir) (checking an unrelated relative name) to
   not os.path.exists(subdirLicense) (checking the actual target).

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index e879d629a8..85a3c1b586 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -141,7 +141,7 @@ python do_go_vendor() {
         shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True, \
             ignore=shutil.ignore_patterns(".git", \
                                             "vendor", \
-                                            "*._test.go"))
+                                            "*_test.go"))
 
         # If the root directory has a LICENSE file but not the subdir
         # we copy the root license to the sub module since the license
@@ -149,9 +149,9 @@ python do_go_vendor() {
         # see https://go.dev/ref/mod#vcs-license
         if subdir:
             rootdirLicese = os.path.join(rootdir, "LICENSE")
-            subdirLicense = os.path.join(src, "LICENSE")
+            subdirLicense = os.path.join(dst, "LICENSE")
 
-            if not os.path.exists(subdir) and \
+            if not os.path.exists(subdirLicense) and \
                 os.path.exists(rootdirLicese):
                 shutil.copy2(rootdirLicese, subdirLicense)
 

