Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.132])
 by mx.groups.io with SMTP id smtpd.web10.8843.1601042869820762285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=J7BCZ+T2;
 spf=pass (domain: prevas.dk, ip: 40.107.8.132, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjdCUQdCFfkZgdJdqroA8bcUc1LQ8vHvQXK4K5tu5fYKP7L5GQLF/v3kbYkKQIXigKe4NjqHfT3GfU6kk6X+KTuY9w1dm27Vi+3x79GsmF+UsxPBeLFfg3U/ST7niwl0TPU5Eyhcs7Z5SMyJ/YVA8DeOXCYecQzcoYURJnpR7O//CdW+glDtDVpL5resxh//eqROmaylEdzdqCrlHcTSOqLnXsB11jKidFRmLACsw/s+CR1007TetYFjb6fpEyEpbqDXi13t1wW5SV/dHA8hoj5Y5tEyL9YuIpZD9066DhgDXBTYuyGGPs4csmiv/bzBls2XZafllXwvoZ3q5d/fTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uX5W3Ua3RvPsW0Z+lqzLUJV0Or5zGGd0ctSUW1zzEZE=;
 b=Tx6LkdcZSZdcNiayVon+VPezoqE2+tn+shCZlAN0HFeklhf+T0E5D5/3YLr7KxOOT6uAiwaqYm8nHZoxOqqCZRW3+34/7Xz27GNFNUYuNEQf2FOp2nWOPx4Yvl944+2lMqRqaR60YfO/9mxTZ/u4ObGxgIWORU6DBCXscv7sRVpsPWW0LtTo0R5OQkvz12G4yCZteSJKiOMSBg28W7H5TQeXJKwv+8XNE8F1HOMSxQsNCu010nc4n4nul50V6FLR0Kc4lE/pMYGgOVyn7AhlLivLV6C8n/m6krG11Wtrg9nWNhGnA9Qr95dHAs8JoqEq4z1abmMrN2r0qONy30gwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uX5W3Ua3RvPsW0Z+lqzLUJV0Or5zGGd0ctSUW1zzEZE=;
 b=J7BCZ+T2jdllaitTssYY01DTzrAzLolYFyJEuyZtEb5w+nn2vykAEy2N8SsdkopzTjsVeylKGlU8FEqYWrnPauAJd8MRiVIrSy97tLrtI15SewFLIWHSg8Bm5soyJ16XLeb6HzfRs/0J/QJ4WpaaZKyo/oP46V1JtPLqHuhPoYo=
Authentication-Results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2530.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 25 Sep
 2020 14:07:47 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc%5]) with mapi id 15.20.3412.020; Fri, 25 Sep 2020
 14:07:47 +0000
Subject: Re: [OE-core] [RFC PATCH 0/4] fix externalsrc task dependency issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: parkch98@gmail.com, Steve Sakoman <steve@sakoman.com>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
 <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
 <4a415c1606881f5f2786a51405c46b978443ba73.camel@linuxfoundation.org>
 <e923307a-eb4d-d716-82b9-ca420a317eee@prevas.dk>
 <3bcf67c6bbef25101b2f8b6bef4948b222a0fb64.camel@linuxfoundation.org>
 <1638091737A0620E.1347@lists.openembedded.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <f8daacb4-319a-580d-eac8-22b418bdfe23@prevas.dk>
Date: Fri, 25 Sep 2020 16:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1638091737A0620E.1347@lists.openembedded.org>
X-ClientProxiedBy: AM6PR0202CA0039.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::16) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM6PR0202CA0039.eurprd02.prod.outlook.com (2603:10a6:20b:3a::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 14:07:45 +0000
X-Originating-IP: [5.186.115.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf608b50-c3c5-4903-e3bf-08d8615c6067
X-MS-TrafficTypeDiagnostic: AM0PR10MB2530:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB253092B9D043657338FDA27B93360@AM0PR10MB2530.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SPAJNBS+lw2z4JsPwc2S0tGz7Rnbq1/s9laHKqJInabzDOsJIlMMCR+iMx9om/rHPfnI4ZB0CgF/kewlUxjVL7ZKBa1J0WeJzxGkDndGcPwjX0g2AjHzKx0CLfctT2KACvsXrutXT3CbTPwFIrhR28pkHhV/0mhjIdx2BckWa9pgLiwogeeF8xM7Ct+vimqsW3LE8uYU4Jz1EsqkWkTYBzFEHyd5eGbCtoY7UPsceE4Rxz+iMcmkOS4/r8FhIswYVXOmFeAUPTqhqqki78DiAtWRF7okyDQbRi+lWq+kzL8POHecEH9FRwqdSNGv++MyeEdlJKWeV/T38qfZFY25kvsTILdg5hW6sREnc9Vf90K6oR3KKiY5KjSXOQRTqAh/+Ibhejv9zbJ6WAVCVQeJ4GjG8yw1m3paXdr05sb22pss+lJIjOBG9PUjngD1jOU5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(376002)(39840400004)(346002)(396003)(136003)(8936002)(8976002)(8676002)(478600001)(36756003)(316002)(186003)(16526019)(16576012)(66946007)(956004)(2616005)(52116002)(86362001)(44832011)(26005)(31686004)(31696002)(4326008)(6486002)(2906002)(83380400001)(4744005)(66556008)(66476007)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	2pPx4kRvTGyxKeC34ETnRLMsRAt/vQgFrVOAY3ixnVeq5/BkmrVDcKrnEi3Tgbb5m1C0Je8APuQ0bXUmGSrKw9wZXMADmmZHL1fhjENrjphgPp588D7Czj7IcoigBCMAkHEELWPsIKua/xKvFMFBxtHzDKjTQ22jhCLIOGEtSwBFYKXyEXTjJaComRa/CDN6NlH+XVGeEVm67ATbNl9RNRuA+hvKLZW8C4nqYO7G13EINrqVY6qaOF3GriLjKV2/67pKNqC7QK00R6USaqPFnEv0InXMoBMCWWKVtc3yRPLsPizfAA6TzHtQaYQZm/uI23ld9xe6MItjLvM3PXDXT8W4CUSLWphVgb+6JjGHqRIbW7a9+lnBGMvfaXgHeYwopUuwgjO8P46yGeL0wMQ6IK+VhAKWqPqxNYMYDSGJ18zRamwnVcALEC3yaiSyIODi6rXobCeVAFkwxdCQqxKRworJXw2/gdyw4HuPNtV0fPHtSnG8y2d56JLkALFGK2ozcaUbbm2YK6HWMavqAUHPTtXzLFm6yRiL4ki86Peph2Kh90R44IJLl040zKib+Jv2N9lCTtlD6WKJQmi5MiO6kuakOEyS5rmbNCr4U+1sRz2IUT0JfdSmIUOj7A82fYStkLLqqEXKaHDyrTDoXB9DDw==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: cf608b50-c3c5-4903-e3bf-08d8615c6067
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 14:07:46.7804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt0Or6NsnvH7r3KP4XthNo6cLIamtPb4HY4kCrWJe7ZCbpbYz0Fr0S52FCm19wa1DZA1H99zJp7LrsAhQJLnKwMcBoQAdJjBMVYaoyK1zZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2530
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/09/2020 15.14, Rasmus Villemoes via lists.openembedded.org wrote:

> You've convinced me that changing deltask to noexec is too
> wide-reaching, which means that I think just patch 1/4 should be
> applied. Please consider doing that.

Or rather, please apply the v2 I just sent to update the commit log to
reflect my new understanding.

Thanks,
Rasmus
