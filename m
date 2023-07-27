Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB91BC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:19:58 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.112])
 by mx.groups.io with SMTP id smtpd.web11.2837.1690445990640319724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 01:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=d75JUEzu;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.112, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKMztN77lcOjAyhiLlE+zqKu2FzKw4muzViv6AqD60DNj9sfa+bt2lyDKgNaH6XeceEvzgPgBKFmKVEfttRowVXaCFAHY4wQZlbQGn1BiD5dwFHDtBHGtyEzVEX2R6pibWToaxJsRi9ukAbbf3+7DjvQ8FkU3qu0yJQfUMokv0qN4GNAiGbmrnw6CWKPlGFqASlmcI94snTWkHzHyNW1Z/ByMe7ZaGQ9KeEhSH5Lm/8ZpA410VBDxUgUyv4/QOknSq6eiV7p1CmGAhwxIuqOOcPcwgtCwpHfhTw8+2FF+U56MuYFMOkf1o17rVeT69WR44qh88Xowdby2utXVRWOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqVfBDYt0dtdDZFniAEof/1L+FLt3j+Fe6U84w7JC8Y=;
 b=SzqJ1MhcMy+bXYV6cwDUguo+j2NS7rOnTNMtfy/46LYo7niJourrIaC+xZ2+Zx3PZ4zpfg9kM0FpJuJ/UFkOUyUB2NJ7wXC/Gjfsdz8nu1MdGNZKJI69lOdBhylVYkpd0YCd5GdGkKLb5WXLLoKtRGSjXo9Y/lOOHizjpLAps6pbEXwRZ6BGv5zlh+lhKp9e2paN1LgfQdT0GfqkMuEV8gOwStQMAGy0Pv2GGZmcj4FwfsmTrDb1/kyD+/jyZSHSRLirs0uaK1ALcwpZfhHGHlLe9Nv5i6v9g3Io85POBRW8vbvpN8UxEatYEUv2pJKb5qdWw7S4oL4fzePy+JsvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqVfBDYt0dtdDZFniAEof/1L+FLt3j+Fe6U84w7JC8Y=;
 b=d75JUEzuOtAKvQ2pIi1mj9sSOL2UaT9e7cA2FrFtc0ZOS2pc+DNN9Kj37QFAIVaooS31gIEIu/oeb6fXT525uTgHX1/OOiaNCsBtt35gZZJHBN2caWLTKE8O9UUeJZaJPXU71zOkprbXu8rrFub4T/yUD+EY9U1UFvKyWSySuuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by OS3PR01MB9673.jpnprd01.prod.outlook.com (2603:1096:604:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:19:46 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:19:46 +0000
Message-ID: <a1a5f06b-62ac-9503-ab95-8ec29a6bf0a7@lineo.co.jp>
Date: Thu, 27 Jul 2023 17:19:43 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Subject: [mickledore][kirkstone][dunfell][PATCH] systemd-systemctl: fix errors
 in instance name expansion
Cc: Yuta Hayama <hayama@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS7PR01CA0168.jpnprd01.prod.outlook.com
 (2603:1096:604:24c::6) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|OS3PR01MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9786b8-bcc7-4102-98a5-08db8e7a3cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JH9bR7v4LhhMvh+DYpl+QMNM3QIEQnOGjMhAFFnp23QAcSFiGR2EbZErj01XwrWB0dAXSkDKnLoE4e6wuZuSBZ5jy85mY8FyJugovdyG/x4IqoZ95CY+L4s/IzHtWFawmvKaqXxR1gmyQ0JrHyZBErkgPq5F7n+VOJW9vX9vbBLFLPpfhSmLFQGTytdRYQGIgyV7LbVJjtJLX9517gXAgd9QxDZUQ4Qi/8RYoBmoSGPH37hAbDKmfP7nX69P7nwGcUaA20YwO/4BV7CFKU8P2En9O08IhsYailQEbRTeFQmBqg8F2MVzINSndGqWRq2D3j6lPOvzCe4AyFd4AtGcCHmARlK5rM7/PKqfYM1kkzAfJ3d2E8KYIBBWx3UHQVjT0RTd43qUty99oe5QLfGv4Cn71K7RvJkDYIEPTLO3QQiKdT+AuE0UFbBCx9RwkloPmQENqLZFLUkLOSILCEo7393pwI+qjJuses38NmrfGWcWsNql7wuKPJQkIE3OPnJamBbQLEYgeZERDVENUa34EYyf2ANfNh1/2H1eR0gyGYGQGFH7TmQ4ioUjzXGp9RID5GwkhMvS74Tub0UXCt1CwPhUONeQ334nPaDHzqS3GWGlG2rnpsq3JHkLs9gCxdvOlPN6AqWKCvi35RJa97mUvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(136003)(346002)(366004)(376002)(451199021)(6666004)(6512007)(38100700002)(6486002)(478600001)(41300700001)(5660300002)(2616005)(8676002)(4326008)(66556008)(66946007)(66476007)(8936002)(316002)(186003)(83380400001)(26005)(107886003)(6506007)(31696002)(86362001)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWo2UStrVXVPRUovRUtoSlR6YUVQclVSV2NHaEMyWmgzYVNyVStNR09EWHgy?=
 =?utf-8?B?cWh6UGVMaHRqWHBCMzJVOGlFQnlHVTNGelhidXlVZ3VMZkxKemFWUGFIdDRQ?=
 =?utf-8?B?MStvRTZqOXA1bGpnaFQxdU9iNU9HN2xmK0MxTDFudjRtWjl3dXI4aHZKcmhx?=
 =?utf-8?B?elFLRnNheDBBTFg2Z1labUI3ZlcwRU1rZUdBdDJlV1Q3bkRmSHY1UTNjWTI2?=
 =?utf-8?B?ZGpMNWs1dWRoSEF6QnFHcnc1ODJKakVMOVhjd3RFdWkxYnpDd1N5cDlBdUFa?=
 =?utf-8?B?Sk9KLzVRQlpUNFRJL3hRTHR1OHNENDg4MDh2V3hsYllkZkhEWUpEM1FMcGpW?=
 =?utf-8?B?VkRiMnFabnZtVmtza3c2Wkhjb09QUnJTenpZNTZ6R1hnbDJJYVJscVNJNW9S?=
 =?utf-8?B?M3dxS0ErU2hoSjEwQUNWc0M1S0hSditFMy9WbHdBRjExQVlkWElFQWFYS2pX?=
 =?utf-8?B?d2tzYWM3TFpuem1KSDM1ZlZXdWtaTHlnaXA1OFhlMzFadHdTTU5OZmQrcUN5?=
 =?utf-8?B?K0pmazF5c1dLWGJ2VXF2R2w4UGZyWjZZQ3hVNHNKQ3dXV2Q4cld1a2xjM0gr?=
 =?utf-8?B?UlF6ZjZhVXhLREZmMjkrS2JVS2dKSUk3aE9nR0g2UUFSSEhYT09aVGV4c2dC?=
 =?utf-8?B?SkZCTm82UGFZQ2trTFhvWG5ZVUVpNHpITysrdWRXV3ZhVHplbHVBa0RrK1Bz?=
 =?utf-8?B?T0tBTjFSY1hHaDZiM3hmeThxalo3R1lWUVRZZEIrNUJyWXg2UEc2cGcvSTVG?=
 =?utf-8?B?ODZObzlnRnAwK1NpUW1RK05JNnllVTcrVWpSSlVKUzMwOEJrWEpENkpBUWM3?=
 =?utf-8?B?Nk9adnc2UTJzT2pzMTJsMkIyazRQZldObEVweUFXSWhBc1V5QWlsK2V4VXJr?=
 =?utf-8?B?bHRJN25YUHphaGdWcC9vaVhFbGMyYVlPZnpET2F0S1FkaTd3Y0xOd0x4NUFJ?=
 =?utf-8?B?RzcxR3JUY2FGSTZrNHJ0TFNQWjVFRW9rVkJ4ZDUwVlVlQ3laL01CR0JJdWxr?=
 =?utf-8?B?MC9lK1dXWEw2V3IxdGxxMTlPMnFKOHJpY1M4cmJ5N1p6RmhSRzBTMm5Bb2hF?=
 =?utf-8?B?VVFtN1lObWNGM2JqVVg2NXpma1RleEJLU2VIRVNGamxudDFrbkQwaUxVYTVU?=
 =?utf-8?B?Wm9WM0J3QWFza3NrK0Vob3NZWXV3WmxIcGFKLy9lNGZKV1FZNnBsVWwyUlBP?=
 =?utf-8?B?L2VYUDdGZVd2V2lCZlFNN0ExdXFPL1R5Vy9ObXdRS0hEaVFsSlY4OExna01L?=
 =?utf-8?B?K2pnSHhVTHorTGZCbW1PcGJjN05uMlNnc3ZxWTUrS2p0KzZuVlpVV0YrOWEv?=
 =?utf-8?B?TUtXVHhXOEtDd3Bxd1NQWDhNMTJyWFAzdzF1ZXhQVzF1VVZlK0xmWVNPY01S?=
 =?utf-8?B?d1NmaDVrM1lSMkI4UnBKcFlUVDB0aUk1ajZoSHdEbThGU3FpSkhXQnZCQVNO?=
 =?utf-8?B?NXMrWVBxemd6RC91ZFY4UWhRRkVHcWR0SlBLWFhySzV5dUUzaWlCWFBPR2lR?=
 =?utf-8?B?a09JZld2NG93L09mWVFDbjFROFZqSCtuQmlaUWVXZTlJNWJjNkV6V3UzVTRJ?=
 =?utf-8?B?aGRLZGpmMzhzUjRVOXVnVTJDTFh1UjdqbG8xVzZ4MFlkc29IVVVQWHQ0QXpt?=
 =?utf-8?B?ZVBVdGFLZzMxM0h6RkJjK2E3NG9LVUF4TFBEaGF1bi9XTFV5anB4a2F4ZEJn?=
 =?utf-8?B?aVdtWHNraHF4ZWxHNFhWclZ5ZElGd3BoOXBIdGlhZVVNemVIbW9KVXgxQ25s?=
 =?utf-8?B?Mi9aNkFxb29IUVNEdjh5MG00aTlmVktaZ000UGVVMjVFMldOckRETHE5MFN1?=
 =?utf-8?B?bXhlbHFQbHBpQUxxSjZhUnZicjdlL2VUS0VzSUsxZzMyRUVYZzE4Zy9GUG13?=
 =?utf-8?B?dWZ2ckxldkNxSkVzNHpMU1ZMaFBXdnA2S0ZTT3phM0FhV2p6d0l5bzJNekZU?=
 =?utf-8?B?ejJjeStIWW42YlZadnhSNUhZVy9UOWpjMFdDS0ZhcU9wVklYL3kxdGtWbnA3?=
 =?utf-8?B?bDJjVVp4YlhEUGdkZHFncVdpK0d3eHlvVGgvL0ZEcXJSbU9IdmNoOTVvSzhB?=
 =?utf-8?B?bm9MWkFMV2tacUd5M09GRnVaWDdHOWtJdVVBZWx5bnFVdkxnZHdzU0JBVGx2?=
 =?utf-8?Q?/u+oYuwJVT5f60CwGHdPGisbM?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9786b8-bcc7-4102-98a5-08db8e7a3cc5
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 08:19:46.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBesGmaOFwmbLs+r0BQQOQW85yqD/K+D3b2O9YPg7J6MdJTETImDBwPOs3tYpZMN0XnkB4TrV+jquqLpYid+bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 08:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184918

If the instance name indicated by %i begins with a number, the meaning of the
replacement string "\\1{}".format(instance) is ambiguous.

To indicate group number 1 regardless of the instance name, use "\g<1>".

(From OE-Core rev: d18b939fb08b37380ce95934da38e6522392621c)

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 514f747fe6..7fe751b397 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -202,7 +202,7 @@ class SystemdUnit():
         try:
             for dependent in config.get('Install', prop):
                 # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
+                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.25.1


