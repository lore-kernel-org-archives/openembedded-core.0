Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.136])
 by mx.groups.io with SMTP id smtpd.web10.8624.1593777073268846205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=C6AEp2Qn;
 spf=pass (domain: prevas.dk, ip: 40.107.22.136, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8tzWrTmO2tF9vyB/b0ZpQYjMT7AmiXrEhSVXwlBUC1g6Bw1KRpcXDUGSn1930VJ/b6sJSHLEnGPrtUrfcEOUxAU7zUosdrcYZgD/fcDG39Gdz/asZqQtFn4mhTHfMcHm7uAJG7bPJJYv+QfDjy2d96DYUD0xQqKZv/ZI3vSDRTVhdshxCUa+ehkvuaraiE8z5BFHqDfFJ/BK4nFZLcPGC+XWQ4Z3hEFND/ksULMqZELTRwVvrFV5QqnMgEP6Ky5jPCfug8n0t+uocw7ZIm8STxxO/C1ag2rKFWfp4OmvSX3wB4tgr30zfSdyYYbKt1p584B7elbDvocVMv1pd9kzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdcZp9tT+d0H2TDmne5xQIH98SnLzreqrX6zONKvZZE=;
 b=aKa+OOUevZEdQyNgzPBGWjTt3iJzjXLN53T88eNIopjK869Jsl3EdchSjwjmqIA+Lxe/7oEMeFEW5rnVuzUtEFsF7+yFCLdw84MLlxvuV92kmg4s+GbXq8NV8CYz1I83ZAjSkrZCH/u5Mqc1wlNZCYTuUd0ANx9BzNfsVmbyKSlR044Moy9upWwRXuMuQuZ34B3+t8Aul3Q9xuHjLHmt7/4MkzGijkfgVinPZATS6SeLHuF/+XIaQeSw6w1KoCdxFON2bwoKFoVxBUcTx8PxQUuB5SK/I1zH33nTGIRjW6jC/Vz8qww5sz0AR3DoCMgZdIyVkjik4bta0GyEHFWoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdcZp9tT+d0H2TDmne5xQIH98SnLzreqrX6zONKvZZE=;
 b=C6AEp2Qn/xa5GTCHCayokKO76l3S/rl7vP8HRaKmIbmsR6+PBkQpV0q1l/TWkoQjWwXxI/UCrtXXQROzNOEnU0WcAnD5In8EXWzbNKBxLCXOMLxWAsoq+ePz3TWo492Ziuc7ptRV1t2AtTwSMhP2kgM74UP/YHj+Z+N+z1citeE=
Authentication-Results: stusta.de; dkim=none (message not signed)
 header.d=none;stusta.de; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3331.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Fri, 3 Jul
 2020 11:51:11 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 11:51:11 +0000
Subject: Re: [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Bunk <bunk@stusta.de>
References: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
 <64b8f2c4fbc20ea866a83844d117816de59082dc.camel@linuxfoundation.org>
 <ee34bd95-2dcf-cbea-2b3f-e5c11f95e5e2@prevas.dk>
 <5c9d33386f921a0b7fe06bfc480b6d52bfa26708.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <0dd003cf-aa3b-7324-03f4-8ddcf098891b@prevas.dk>
Date: Fri, 3 Jul 2020 13:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <5c9d33386f921a0b7fe06bfc480b6d52bfa26708.camel@linuxfoundation.org>
X-ClientProxiedBy: AM0PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::22) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.153] (81.216.59.226) by AM0PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:208:d2::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Fri, 3 Jul 2020 11:51:10 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dda2632-a179-4e73-f172-08d81f47617b
X-MS-TrafficTypeDiagnostic: AM0PR10MB3331:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB33314AB4CBB5A430AB0DCC7E936A0@AM0PR10MB3331.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DLtwqX5DVEZJqCVjIgZyAzfi3WFbyBLJRSe3zyVPiLHh7QNzZniMsy34zdkkNPwx06FPdZtdF92mAuy8j2zKn0/iqYeLvCfgAm8IMQgfjVE14tOoFzqXSmLgH6XVSVbrm8uwhMwgU8GzmoSA1Gv84MXs0JGM7ksuwTzPoC/Y+yQJdPJs+zhZ5/hzBXl4eQjPdmiXt0ptI8WEUa20kJ5kJHGWUEM8LSv6gLR/ZBgWzmButfrPIruxl55fon7XNKlhnNf8z+9Nr1TMgOx7O2/BhDy8Z9fjiAqW9n/2BtAMKi08jxl8XI3cC+4RAnihEOWLV1P8BdFJTfMyCyaT3CHT0hoJk2jkBdRUGgtD4v89jkYZ9X1NjAoJ4JJNJcOnnl4u
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(8976002)(8936002)(36756003)(8676002)(31696002)(186003)(26005)(16526019)(316002)(16576012)(86362001)(6486002)(478600001)(2906002)(44832011)(956004)(2616005)(52116002)(66476007)(66556008)(31686004)(4326008)(5660300002)(66946007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	RlV88g3FQC700KM/4XR9qf/ExAEULdzTQpYEh00OFr22y/pqNXaexOKF8IrnzvgEkqPvuwvC6iCU0BRLxZ+pKuLb96NosS2TQDI51UEosXE8NAKdudJ64tapZsKIh0JjAXh21/6W2WkznlXaPPPb+V0hGPvrGOYx5q4E/Y3Vz8wRvKIzsmw96uVBZ+6qTzauqiDAnEh8mOzM2xcyMqGbcAT8T4ibw7/Md4+GUfTk0uTWpprDqFajLiUZ6LbLOvio1kxOuY04cFPsqephfEj9+iy4chV5rFa2yre5QIrSJ8Qk/B2W1foKRWr71LVMQCFBzALHXbOazPS7aaSQL4/RBAPogU/GdpqsK3l+dqE0fXF9gi1RLV/1uikTzgHy63jOlU70xPGjjZDNpuuNbOhkkb248cVO1CacjvPcpP05Z/vmBnfXxDCdUlJGr6SWOGJ2vQhPdVoRar6NQhIr77gQ9tAOpYG3EWSxuRk8WNvDszU=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dda2632-a179-4e73-f172-08d81f47617b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 11:51:11.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZz1T+f12+6s8CYFI+XsXXdfo7atsK1zuwbROX2mwy/dsgUqrYspEB0mSN6txNh0kdfIjxujEbUCZAEeIH+pWiQ5enFYDv2Q7NU8vyRLDmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3331
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/07/2020 12.48, Richard Purdie wrote:

>>> Whilst I realise there is a problem here is the correct fix not:
>>>
>>> RDEPENDS_coreutils-stdbuf_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils', d)}"
>>>
>>> ?
>>
>> [Well, the coreutils should be in the true branch of that.] I dunno, it
>> creates a cyclic rdepends between coreutils and coreutils-stdbuf. Is
>> that ok? Seems a bit ugly to me, even if it would work.
> 
> I hadn't realised there was already the reverse dependency. I think we
> need to let the package exist in both cases so the two dependencies
> need to reverse direction depending on whether single-binary is set.
> 
> So something like:
> 
> RDEPENDS_coreutils_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
> RDEPENDS_coreutils-stdbuf_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'coreutils', '', d)}"
> 
> ?

The argument for creating the coreutils->coreutils-stdbuf RDEPENDS was
that people would get the same stuff in their rootfs as they used to
(but they could also just get stdbuf if they needed that but use busybox
for all the rest).

The above would mean people who set single-binary and include coreutils
in their rootfs no longer get the stdbuf utility (the functionality is
in the binary, but they no longer get the /usr/bin/stdbuf wrapper
script). But I suppose few enough people use single-binary (or the qa
issue would surely have surfaced sometime in the past half year) that we
can live with having to explicitly add coreutils-stdbuf. But then
perhaps we can just unconditionally drop the coreutils->coreutils-stdbuf
dependency, and have anybody who need stdbuf include it explicitly?

In general, I do support splitting things to their own packages without
automatically pulling them back in by the main package; it can be a
little annoying for downstreams, but surely everybody have tests that
ensure the utilities they need are in their images. [I'm not being
sarcastic.]

Rasmus
