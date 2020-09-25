Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.128])
 by mx.groups.io with SMTP id smtpd.web12.3686.1601024785567961332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 02:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=K/WTTqJO;
 spf=pass (domain: prevas.dk, ip: 40.107.5.128, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRjwIaDJrn+gItivwJM2ZGWFkNEpkvTkESYMWeehle/7ZhiOCt9T6Un1/s+WWjUgCZqOj/0mTQPdpSXgo5ICa+23zb4LUjCqevUERTcJijl9li+iw1UdvmTINTjVsE+2YJ+CxjVAeOjF10qbkaLSjsai7MU/XWCnoc0Tf8jp6w28bUvBVLV4rgC8vIKapsfjnNm+K96hFAuVxQC0aKxrQw70ejXgyWDSiF9ftl0VVbsAq+oD0gqL6EMRPUm15s+/YMlJz5fa5IeThqV0hVUfM948gIJutPXiUvmKQcIRdSImN1pyGjksH77q3kNoYZOtCeRfVVGLwD8SSuKbPfcrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q402761w7qrfhkt3y1HBFq2TkSTF89mDM2Y1GjTgQmo=;
 b=SE3IiGZDEAjsOBEXQGbrJ0CKIrbU+KJlkfqpek2No6XOq7c81BQMgLzA932J/IA1AWQjhdZJBhCuMuSRoTdJDdaniloeiGiabuinhgX0MBPpP98LW7m+G61qdhGHSI6lR/TnbisPS5I81Qy0JNyypyFYIRIfACbg4IJIX1YOMUttsxggijTG7saomG/fJqR9voEAaiRpXFMaCKFov7ptz0xLoON/VDK68DLax21hYXPWQWmykF8TQZOBwpNvNc08V2YFYfVLgC0tHiiBZkfSkOseFyneAU0uY0oKIH/EOxP1BFeKjgkMWtcmHSY6O2v0IgzbJaNZdexmHjEAzWE66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q402761w7qrfhkt3y1HBFq2TkSTF89mDM2Y1GjTgQmo=;
 b=K/WTTqJO+QKobM6kBm0Bdsm4qSUsEXHrwKF/6woIj6SLW32PruH+S0RL6uoyu8g6oQ2LqWlMyJgLmrocU3a53CrSp7NdBHEMegLjUIbLgCPMXS+lVvf9rBNLq2L0eMjjJ9h9b6P20Wg5TNjvwR6VZmhim2UQjU2Fc1C3b0Us1QU=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB1937.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.24; Fri, 25 Sep
 2020 09:06:23 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc%5]) with mapi id 15.20.3412.020; Fri, 25 Sep 2020
 09:06:23 +0000
Subject: Re: [RFC PATCH 0/4] fix externalsrc task dependency issues
To: openembedded-core@lists.openembedded.org
Cc: parkch98@gmail.com, Steve Sakoman <steve@sakoman.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
Date: Fri, 25 Sep 2020 11:06:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
X-ClientProxiedBy: AM6P194CA0035.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::48) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM6P194CA0035.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 09:06:22 +0000
X-Originating-IP: [5.186.115.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1c79429-3ae1-4590-6489-08d86132462e
X-MS-TrafficTypeDiagnostic: AM0PR10MB1937:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB19370E73B84FAF9B7881CC1693360@AM0PR10MB1937.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dNfpk8ctEYe4PGnj6Fa1GcTN6fgz0x2WstMmszuyZ+jykk2v3bt2L6WI3IXZKCAuq3LasOFFW+AsO+H7MCa7tU0bfTUbTv2Z88IGglL0+N6TUyeLAmX1M8ZnDztkDqwxTWbqeoi55rWcNem9jOadvAm8wbvW9xplxSxDUaFEV2J668PLBxvsZIVkNmZ2vq9zGJrhdJ/ptfqluhrFFmOIhEMqvKuv0rN+n1nhsJanw1WebhVembFVLWAxK3uXswtEAkglt28ZWOUlY346NCJwUAuubCkVU5eqpFf3d9NLPmWoh9CnivliWIX7+qDJCq4hbusHsPg7PAL6E4otRUn5sk53Orp/Z4q3jY7+9T+G9BSe/+OSZel32nkQxgdjWSr7uJ2Nto++CdvOA1a2TpYKaDUDU9o35zpp6tO8nk8z2ypFcnsPZoOMymKV3hCicwq6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(39840400004)(376002)(396003)(8676002)(5660300002)(54906003)(31696002)(26005)(16576012)(8976002)(2906002)(6486002)(16526019)(186003)(52116002)(2616005)(44832011)(956004)(8936002)(86362001)(316002)(4744005)(66556008)(31686004)(66946007)(36756003)(66476007)(4326008)(6916009)(478600001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	n422lka2VA5zM850U1Lh9CqKzkxE38AAXi7TwzHQTs9vj2hkXz4tsfnet7SfSe37el6MeL3wqOp0SpwCLStkcD2/CR4ZWgo0GnydNehwzI49ALGHzXk1iFzVU2kRXIV4gWA83tFnacve129i+r+h9u0te4BRHFwihTcxg2tbqTY4CmSzZc1qNe/5gmTiNUrWepyDk/902WAeyyjOOeqE31YIGKW7ckZZzzZFCrYhRY++UCjAgvjABN75RpD9fa1OBQ7PnIv81Ist4Bg5f8xkvsS3jqBxyxqFRGMIB55tsgwPxfsCsjJrs1Fq5+K2z54QuxK+j3YH9Buz5T+6NNtTb6misUeLk6+03T0adQ88AbHOWD3Wx4VH2vYtDpkBypZwx5KPxcA1DOiK0mwJT2rgabE1oGV9ldNr2njpM6SmLEVOXaUP/09qjD/SdZ55CYCt2XXBAt6le2g+Js1RyY6IWeTPaX6H20cdFnXGT0wGLqzWmqhEBJ6v4E5Bz6EGlP/vMsX15wHedGEdOsyESqCMkaSt5oKLRv7VPe5UiRlLeI7SrYRArxGlCX+QmlV8iya+/GQBscOKd67Shtem7QzmUprJolY7vc+E2njz6lbXhIR9r061dhKoeWMq110oGY3ZTYz06N0eQcxOwVVhd7J4Uw==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c79429-3ae1-4590-6489-08d86132462e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 09:06:22.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsRUiDqSPrlHfw6kLu65lyeZG8ImJbdrJTEm2sBr4GIt3IaJg2Uce5f2B+u4CrXGAgRxczAh2xFArdxgMPxxZuNsG4+RPjPKR0nufb1jcWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1937
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/2020 17.15, Rasmus Villemoes wrote:
> This is all entirely untested, hence RFC. But if this doesn't work for
> some reason, I think externalsrc.bbclass should grow some comments as
> to why deltask is used instead of the noexec flag.
> 
> Patch 4 is a revert of patch 1, but I did it that way to facilitate
> backporting, in case patch 2 is too dangerous for backporting. If that
> is considered safe enough, it should be enough to apply patch 2 to
> avoid the churn. In any case, patch 3 is just a little simplification
> made possible by patch 2.
> 
> 

Ping. Chanho, can you tell if this would fix the externalsrc problem?
Richard, any comments on the deltask vs noexec usage?

Rasmus
