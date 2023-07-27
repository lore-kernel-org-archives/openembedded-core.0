Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09E6C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:56:38 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.117])
 by mx.groups.io with SMTP id smtpd.web11.3249.1690448193446322470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 01:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=ujMRXiix;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.117, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjPT2iNz+WnYyY5vIcTp9Oko6iuCKIpFOUEacQEbkKDqnu/VS7g41x2P0NqcFX7Mjc2xBtFHMMs6wARp6XrKj5ro4HiKw+EmTZxkCwayEZPNSNo9hcL/eKox3o+IXlt78EhgQqZnSyGlq8Ny1gu/6QcazLr4LkFMOnoRzCD8060In4xc6dfyMef03LUNqSaKqi29/RdFrCsYygvExQDxcKkrsZCv/y+YPntqeDdc/FyhWotpwhxlQ01M741mRqDXTo3A/a0O1oFCBlfx6MepcGaoGzlwo94GSG5evqS3zFLgVgn7LaGrLy9W45gkO6NIM6ss3JwOH8ZAyvyUEHiGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir5dOReoDB1XebavEyVNbYn0lNWGGlTHocYL+wPMe5g=;
 b=kBiZmE4a5v1azhvLTBj9iHsn2FF5TCNAE7tfOXo1wcmlmKjBoZKmw8eSWVm8c3oXD53Uc+bHU55g4SvidU6ievxOJDmyfOeHl9OPwnH5O6w2xx+88yPCKRzUxJJeS1G3rmGeY1Hdxy28TCBTsZSDwUn6bzqg+FZT1peQjCBQbCTOYov7hBXyARz2lFUYtVv0OOnaQ17eio59RAd24HyQK/GM8Leamfh5ANOKOrZlMMwXiOGYUE/ObhPkUmCTEH3jPc5OW8ZBKTwA3PzZf8CoT0SFwcg70Utq9LnG+9n28TvDm7q/P1Gt43o90zyuaC2OskS3xMDiDhgMDL1RTxxvdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir5dOReoDB1XebavEyVNbYn0lNWGGlTHocYL+wPMe5g=;
 b=ujMRXiix1TBil54pnTsmbnMwpR9W05KrGml2wN13/lp728D62dB4nCvdgvR6GFzKySlC5MWEP3PXUY9qrvVOz6YVfUHJucRVB50eyFH0Qux9x+1NO8MD3TwAtUFZMN1KrtnzjZ9MO3Z2KppFo4Ohr7pI7dCet3JSgY3tDiwTaww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by TY3PR01MB10940.jpnprd01.prod.outlook.com (2603:1096:400:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:56:28 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:56:28 +0000
Message-ID: <4430b025-a805-3efa-3bc0-58089c47e8f2@lineo.co.jp>
Date: Thu, 27 Jul 2023 17:56:26 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Cc: Yuta Hayama <hayama@lineo.co.jp>
Subject: [kirkstone][dunfell][PATCH] cve-update-nvd2-native: always pass str
 for json.loads()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:405:2::26) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|TY3PR01MB10940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3154159c-c2e0-4bce-6512-08db8e7f5dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uqjiefdZDr2vUxrS3by9lefc+ETVhx7+UaHcpqSmsn2idSDy7s8RcJXfYaGixqgzmFKsBTxcuNZh7NF1Md3jtrQoP+pI/U0wySYBhcDuWnD9A7GBwOj2DSu5/NB6ol3mq25AqAAPie+bIk1a0d3/I3C35l7esm5g5v8eOwWyC10erOI7X9Z59Gvnl+Kp0AZErea6tyh9OM1VOQnul0+19QmRjgqtCv+xl7jo7WO/eMufQT/JYRhBLmhSN2t8pIgKDngiC6aQfchQhyD7+blO5qud0Ft8l93S9MDlkVWnqyp2rETMSblqRjw/6lvNF0wv++JNsKlyQoHJysMBtX3ByYaXTkjOXibw9swlxFxIDu01B3dC/zstgyZX5yUjh96+QVxbPj0AnlYKTlupL/1m4GQFgXE+OGEHiXZX4kMJ8YNUZnxXTL6d9urn+JMEyfCsxOF/R3Ek8EakjoxLDJ+BWS/fP73LaXijDxS2aitT4u+ludL58BlblIROA7MCt7NDWISxfrgr1Od4VIoFz46WbIYUsCXEZoSzcuAvojauSks/sKfEcl01t54xvtOU/0zXr+qqZpZJuJscH5nTMS179Wr7Tj+L4lN8Pl3MtvbPTLrrisagJSfIcm8Z1NJ0bFaXAV+ZFJr9nUiZQzOTJwBGZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(451199021)(31696002)(86362001)(36756003)(31686004)(107886003)(2906002)(478600001)(4744005)(38100700002)(2616005)(26005)(186003)(6506007)(66946007)(5660300002)(6512007)(6486002)(4326008)(316002)(66476007)(66556008)(83380400001)(8676002)(15650500001)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qk0wL0M5QnJ3dy9kaEJwZlIxNElCb3dVRE40ZmFtOWt0Nit0c3R1akwvZlRy?=
 =?utf-8?B?cWg3YjE0cG80c0F1K3BIeDN5WTZJTUFZaFg2WHJzMFNwSmd6ZWd0clFtY3dr?=
 =?utf-8?B?NVUwWGE3dUJRREVyc0pja3VJSGxQNFpyWDdXUC9SODRiUUZsMTNhL3dURlpY?=
 =?utf-8?B?dDcrQ0hSNG5XV1k1M0Q5dVQyS1VtaUVxcDMyaGdjWTlVWE5BTjhVYmZWM0w1?=
 =?utf-8?B?bXJDamwzOFk4L3REUko5M2I5RVkrUUxaZmlOaDFJNGFJMC9RS01tTUYrdmhC?=
 =?utf-8?B?RS9YUjh2VnVnSzZRenY4QWUrRWZOUmVyaDZIMGx6dEdCQStxMmZRUEo3UFVm?=
 =?utf-8?B?V2o5VnU2c2NmNW1TVEwwc096TWRNbHBRVkVieGdQelFraDcrTjBtY2FodTJN?=
 =?utf-8?B?am9KWHZDaG9VYVFacXRpWVZWdlBpL0pDTDNYb05qVDZsVTl6bGIrMlFwaVRa?=
 =?utf-8?B?RG9WdHNjbytYbHkxdDNRdzNQanhkVW5IQ1RLUVZvVWJLY1hyL1ZXbGhuZzV2?=
 =?utf-8?B?YkFrYmN0a2padGJNVER4bFJWMDBsZkN5ZjExNU00R2VzcG9oVkZwTUxjL2Ux?=
 =?utf-8?B?SmRHY29JS2I5S25ObUZ4WlI0TktzOEs5VWpZdTVUV09yTGZRM3Q5TmVLQ2Er?=
 =?utf-8?B?UGZhNGZ4ZkV2enp1RklqQ1F2OUpRR1JCc0RXdkpDdkpuVmw0TXVnUTUyb1BP?=
 =?utf-8?B?OWxQM2ZkaHc0eWR3OXdPTWpYVjFlZGtNUWVDUXdKeVBwa0djaDBtUlRrSGtk?=
 =?utf-8?B?QUVDVmhDVnQ1YnJDeWhneXBJZVNyS3RYQVZTNnpFZ2JvVUpGalQ4dmpOYzNE?=
 =?utf-8?B?aTAxVEMxcHNzSTFiZXp0L29iTWhWVnZIL3JqZ3lQUTAyRmlVcFhpS1F0VzNS?=
 =?utf-8?B?QlEzOXhCbUtra3l1RS9nZXFiSzFVNTVjK05FajhjOVowRDFwZXhYdVlOMWNp?=
 =?utf-8?B?R01VZ0FjT3RTWTN6N294bW1LNGJsTGp5d0RlQTJHdEdFc3Y1RVNKTDdVOEk4?=
 =?utf-8?B?TWl5WE40Uy9NUlkwemVpeE5PaDF6NVRRWkU4b1lKeVpyNzJSbFo1VWJrQVpE?=
 =?utf-8?B?SGZKLzdFTVlpTTJNZU9xQXVUMGhjbFJ0ZzROaUVVZ085ZDB3cmVIb3JxLytH?=
 =?utf-8?B?S0o2cERNdlZ6U0J3Y0h2N2VXZk9kSXNXM2JWa0ZCUkZXbWFkemNwV25uRFNF?=
 =?utf-8?B?RWI4cElvVFliU1RzUFFLdW83TG9lbGUzTjd5bkFPK0pCZ3lRSU9XN0I4ZWpH?=
 =?utf-8?B?ODZDZUpqYUNkWWtnOCtBVGpaVXRhejgzVVpCMU11cU1QVys5V0s4TWJnTUh6?=
 =?utf-8?B?Yis0aUZLaCtTWmVYK3FwUzFpakppU1NIOWtJNVZneHdGUFRBT1VnTXMrN2VF?=
 =?utf-8?B?WFg2S2tVMFFBczVHNzY0QzdRbkhKd09iMkZZeS9rWG1DZnoyYXQ2QjBiL2NC?=
 =?utf-8?B?dTZXR2FnVTYyam1USVZmSTl0VHJqSExQc0Yvek5CZktNZWlYN2tLbEd5MFov?=
 =?utf-8?B?dzI2WFJ4dW1UOTZTNHF0NXlrOUczbXlkczBDaFl0Rk5iRnJoNjJ3dzRGTUNI?=
 =?utf-8?B?SzhHazBGeS9ld1V4cHh3OFhNMEtvcEZtRkFpTFMrSmFwbVI5eGptYy9pS2RL?=
 =?utf-8?B?L20xbGpGN04yRDNBbmhRSmVTUWFaYWhLNitEL3Q5dURZSHppY0c5RVRxc0Fr?=
 =?utf-8?B?K0c4ZllNd3U4cjJvaUJ6RDJUR05VR0lTSDF1aXBSTEEwTmhGbitmYUY1SzlL?=
 =?utf-8?B?Q1MwWjhrbUI4ZWRuNnpqWUo1RU96THZyK0JXZFBCTGxyckYydVVuUlk5OGZ2?=
 =?utf-8?B?SlZ4RWlKekpXQkFPMllHTXZFOGkxK1FYOVRpbnB6RytlK2V5bUVEUlBxRzJK?=
 =?utf-8?B?cnJoOHRTNmJiZFcxalJ4NWwrLzRmRVgyOURQNzFIbE9mbzVnYXFieHNMeEhJ?=
 =?utf-8?B?ZnZTVmdtRDREUDJSOHBpS0wyTkY1di9rdWRHbGw5RExtbWpXb2xzUmNUV1l0?=
 =?utf-8?B?VlM2a1p0dGtmVW5zS0FpdDl1b25Uc3NUQVNYdGxLMG5oU2E0TzFhMnJYYXFI?=
 =?utf-8?B?K0Z3T25pbW5oblhoWHQ0YTZoZHJMa1JSQU41TzZOb2x5M25pRVByQ2tYNWJj?=
 =?utf-8?Q?/xhg6CK/x0eb9SZPxqugIB2Vu?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3154159c-c2e0-4bce-6512-08db8e7f5dae
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 08:56:28.7477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ng9F3jive/M3FaBppgv9rcocigSDefzkZHmIC2Dd9ydO1PJF//S1+rqb9JQZYjPVHraAOKgOV+EkVkI/+EU5KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 08:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184924

Currently json.loads() accepts one of the types str, bytes, or bytearray
as an argument, but bytes and bytearrays have only been allowed since
python 3.6. The version of Python3 provided by default on Ubuntu 16.04
and Debian 9.x is 3.5, so make raw_data type str to work correctly on
these build hosts.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 2f7dad7e82..67d76f75dd 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -136,7 +136,7 @@ def nvd_request_next(url, api_key, args):
 
             if (r.headers['content-encoding'] == 'gzip'):
                 buf = r.read()
-                raw_data = gzip.decompress(buf)
+                raw_data = gzip.decompress(buf).decode("utf-8")
             else:
                 raw_data = r.read().decode("utf-8")
 
-- 
2.25.1


