Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DB2C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 09:12:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.104])
 by mx.groups.io with SMTP id smtpd.web10.6674.1699348347100400114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 01:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=SdcptNmU;
 spf=pass (domain: prevas.dk, ip: 40.107.21.104, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwlDTUFR+he2ASrCpJxXahmTxwYA04IrLWQUxscpBsQldBdaie3oJdnsOO9uKgG2XBekCGuzORRPboKLYLHR0QguCRwYB9FceeQEJYkBaM0wmA7YksoJZxazEJU22lqGyuY4PsHFM9Kk5En0bVRtSizZMrE/4l7ffcpmm+2N3HD/79uPfYxDho5Q+VIMQzlckkN9HVucNESdhehR6DnfmsQQ8b4IeyP90Hv0ugcbfWVfcw7ge1jur2xc9SE9A9wZZJ7y1pJoOc1dxoJPgPQYLt3Rk1xFGJy1bCRmbY1voAjRX7FXrUyC1ucWevbjYWZrKMUDWW3m7FhiChppnSpfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNJEI+m7t4Dj8DrfXlJbwUB0662Qis+3hHNiTMR7Z0Y=;
 b=TiReo5M1JeKYb2h8dKge7Ar/4+vaD8SQUwihoRuJRwluDQafworgVKo1E3ZDYFuqtoVdBNEpBpSJhwbKkZWeYLmJurwUJWdkDQ1mwpTK1SfE0r1mSOTZH5Y4pCRG+BzGoTFKPRm/fTrhj5vl/iMGyz76dpaSfedg6ncoIhnlw0gOvcKuaHvF1D/gsLKNZjxh18wb9bd6BvOTfzqfShlJL8QoBbPdrhXydS+tEygim7vf0OsY14Tu7/eaByf5hMdDriYd85XsxG3cpkDj1SRDOh6QgGHwNxRWxZ1RAWhYVHCBDuNhHxPf9rCqLKKEv1lnFOy2DQGF8HF1nurqsO+vtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNJEI+m7t4Dj8DrfXlJbwUB0662Qis+3hHNiTMR7Z0Y=;
 b=SdcptNmUEMwTQkmgPl34nWFTThH9E0A88Ot2i6MJ26PfXmBSJ3+Qorhdt91O01lFUQVTDOgos1Gu+6EouZcMCi3/+o139d0ywvizEQlgF1J0fmVbpqYhB8tsc6NvO6Gny1r6ooCwR5n+HIoJg9+q5Kj08R284eC7WSJTU8YAChk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DU0PR10MB8023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:405::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 09:12:22 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 09:12:22 +0000
Message-ID: <5e886cb5-f46b-4400-adf5-c08535398d69@prevas.dk>
Date: Tue, 7 Nov 2023 10:12:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: add jevents PACKAGECONFIG item
Content-Language: en-US, da
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 Max Krummenacher <max.krummenacher@toradex.com>
References: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
 <27439f1c-a64d-41a0-815e-882a1a9a5b4d@prevas.dk>
 <143d65084f9acf56dd4fe3c6df868480345f12b8.camel@linuxfoundation.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <143d65084f9acf56dd4fe3c6df868480345f12b8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0023.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:a::9)
 To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DU0PR10MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 12610bc0-c787-4dac-0525-08dbdf71a684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1IDc0M3y/fBTRgRMVbTghW7BPV48vnZV45axy+9qNWXqxyYW5O6tm4IlmrFmPcOi1h9H0MUby3JNTl2EgdOsPbiWLSq7QRiw2BS3TwohuTtb4Gl+ZXCoXz0hY+PFp7aoVcPeEklcuL06twnfHnh0QBGVxfovhhea1SvCJZobQOnkCTafbzC7yeg8drjC6DZY+1YY6CKheZV98XmriZ31oOeJzY6mzQ8f7HdesnBqxsbJQo1u0sJZzHdxQ7pKEv9qvZBNb+KNcUz+acXlhR0/kjCf0V4m6YdxLf9X3ydNqICZI4lpHmceiD4bXncv4Riu2eeDq/fObYNTNQaof6BMVfL5i69VuzS4IxT++ZlPtIn+Y8SXEm3t36/CKOrHpLNnVuSEGKbqLRXXFch0dpJQkyko51RgdIFVp5hNrV0kBRPIplcxlLXlgXb/i9EEmR2yN+tzmPOK6LAEMSqqfBHxOvZCcrFgC2OOJZMVuW3ETYglFenR2WLd0w8OYkbM35UmQI54F797DGuh9qLyaXQ1k2y+UKeFVHGXMveIDGfFekN1G8toFh3e3ayLKTj5pn05RcNGap8QHk0SrhWz2pPM5MM8vmpWHG9p4gRUuUaWRwV0SI1Pq3uiqgIAoGEiwEjlDYhhsMZL1f7rxxv+joZVeg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39840400004)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(2616005)(83380400001)(66946007)(26005)(478600001)(6506007)(6666004)(966005)(6486002)(6512007)(66556008)(66476007)(2906002)(8936002)(8676002)(4326008)(8976002)(36756003)(38100700002)(5660300002)(41300700001)(31696002)(44832011)(86362001)(54906003)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDkzcktrWHZEYzM5T3dRVnN3WGhha3prNlVVaXZvRGhzSlhrZEU5NDBTcER2?=
 =?utf-8?B?bHNlNGlXcWlPV3lkYmhPVTVUUEtLQWhMUjhFVGFTMmVqZ0Vsc2hqb0F6TVJx?=
 =?utf-8?B?MEt5M0Nzb2VZNVd6a2pxQWNrZFlZQzNPSDZqb2V2dmhxdjZtSXkxQjVtVWRj?=
 =?utf-8?B?Rm52WjNPRU9hREticGZVQUtualErT0xDc3V6RUhIVnVhN0pzVHk3elQ0Q3ov?=
 =?utf-8?B?NkZxYk0yaC9IaVZSbG13MXRKYjNtQ2VySm1ReUFUVUV4dXFaMGJyYmMvZUpu?=
 =?utf-8?B?djJuYlRDWUNXMUJTSzVRM2lOYjQ5NEViSllWVlQ0QzVmRUw1dktucGdpYVE2?=
 =?utf-8?B?dGtVWS9GWnlrRHVxNmxqaXZtVmdhL3NCNXV0VTlJampvU2tXM0lkVmQ0di8y?=
 =?utf-8?B?NUZpNTZwWEtEUlJ3TDVVcTFkYXR2OFM1S0xrNk9KNkVHYWZ3ekMrWkdTYVg3?=
 =?utf-8?B?V2dYVnVBU0NJSG96YkZvOWh3WVpKekJjRHNHUFMyd3VibTNzSkoyNERXdFll?=
 =?utf-8?B?WjRtclBMVkRkT2JTQm1FSmtZN0JyT3MvdVNlYVRhQ0QzRmZCbEt5QmVPcHNh?=
 =?utf-8?B?bVRQV25uODNMc3JZZGp0a2YwcERiL21tdXE3UEV4MnZlTWdxais5S3JDR2Y1?=
 =?utf-8?B?QlhwSERVMWpNLy9Lb3Q4eFIvSkp3T1lMVXZXYU83TGRsYzdaZTBTV1djVmxn?=
 =?utf-8?B?NTdYZGo1NWtRUGNrcjRWNVpvS1JRZmNhdlM0WjdpOTFMUnFZUE5pVmFYcTRs?=
 =?utf-8?B?QitQQ1ZFVm5lWVRkU3RRVHl2eVJXbFA0WG9EWm1SVFFaN294R05BZ3czZm1S?=
 =?utf-8?B?UzdpeDM2dVdhQytEcVVHSHMzYmpCRlZSbUw1QTlMOGZWYjV0TWxmamJoUWR0?=
 =?utf-8?B?aUcvcUF3NW5OcW41Z0JGNjhlOE80TWtKbEtrWUdFODFGTUhOTndYcHlZNm1G?=
 =?utf-8?B?VkcxbVJxOEY1R0xUaFVkNG5HbWxMNUYycTZXNFNPQk1KeFkvYkpCUVErbm1G?=
 =?utf-8?B?TS9MVjgzei8zODZ6ZnJVenAzeVlDNkNqOGwvWTRxdW1VMFltaEVKdS84UnA5?=
 =?utf-8?B?cXVEa0s3aFlnSXNiQVVCUk1DcUNSK3dpc0VCSlFQYVlhaEwyYXF6dEZybE9m?=
 =?utf-8?B?L1h1SUszUVE5M3hEVDdzbjhVUCtsZmtXMnYvQjVkdkttTk1FeElJWGx2b3NC?=
 =?utf-8?B?V0JCY1RoQzRtTnlNNXorekQxdExxTE44YTJTU0t5ZnljV2pzV1Jpa0RTU1Uy?=
 =?utf-8?B?dG5RT0ZvTGR4YnpHcncySlpiN0cxMzVUWmIvdDBvNnZDa283MXlMNXdONWNE?=
 =?utf-8?B?V0pHazVoeHlKV1JsQUg4b1lTV0FBa01ETEJaZU51cnZIQm1ObmhDWUxpbXl3?=
 =?utf-8?B?dXMxSVZmcnozeWkvQ3grcTVtbndFc3pOc0hXMTdnTlk3dFRHTVVUcjBLZVJW?=
 =?utf-8?B?aHU2UkRibHIvQmVwMDRpTHpPdUtyQ1lqMGFheFJpS2VmUlRKSWNMNVlXVXdq?=
 =?utf-8?B?dTlNNk5iN2txVzVFSDArRHFFdXVLZEMyQnUxYzMzSGhGZjZDTWhWb2dQbmEr?=
 =?utf-8?B?RGtQeXpoQzJYTHJ2V3JvTE5zUTBncWNCcWhzeUpjdkd3QjNzbHNiZmxNSitl?=
 =?utf-8?B?ellHL3FyVjBFSVZhOWdpUDRURi96MURPeWQyODZudTBHVjJkdENFV1NlUXVq?=
 =?utf-8?B?UTNVVlZyWnBEeUIxTndtTWxHQWc2cWNxWTFWbFd1bUxUOXBUQ3haT25Xb2JG?=
 =?utf-8?B?RlRPc3VkZEtNd2d0WXkwV20yL2NYZ05jdDh6SlJscDdlaFNrcHkxUUc3Yy9I?=
 =?utf-8?B?cXhERCtXVm1MTk92SE9XME9VcEhXM3crYlRhTW12OUd4dGRjdHM0bVdtV3NV?=
 =?utf-8?B?VjB1RWdBVkVtQ3VzYXZIK1h2a25aaU4wa3NoVVVERWZBbWJxV3g2YWFyR1Jq?=
 =?utf-8?B?U29Od0gxQVgyRzBSOTNoTmNlT2w5Q3Y0dWFBY3dLRmEvVVEvbXhHbXBNMkJa?=
 =?utf-8?B?clhJeHA3Sy9GbHdMWkJiZ2sxMTkrSUh5ajRhWFhEZWJNMUtnTS90NTJ3VlVi?=
 =?utf-8?B?Q2NCam1Cc05OTGo1ZUdrVjUvK2VoWUNIY01yb2pDTFQxU3UvVktHVWM2Miti?=
 =?utf-8?B?WnRHcENnNHJhMjh0c21OUDlqeXhqTnhiWFZKa1h3SjdVamVNMHRsak50TjU5?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 12610bc0-c787-4dac-0525-08dbdf71a684
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 09:12:22.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb+fPJpUPXnQ0gIziaiU+GUPhMEnKfH8o1DLYZARL68oBn500dAmf0ApLuXpe4Q3s3Nje+CR9YihsdA3WAwafAj5o/CGXYGy1vXD3Gyru1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB8023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 09:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190258

On 06/11/2023 16.07, Richard Purdie wrote:
> On Mon, 2023-11-06 at 16:00 +0100, Rasmus Villemoes wrote:
>>
>> When I set PACKAGECONFIG for perf in a perf.bbappend file, without
>> python being in there, the build breaks:
>>
[...]
>> This difference is, to put it mildly, quite confusing and surprising
>> (and took quite some time to track down). I don't know if there's
>> anything to do about it. Is setting PACKAGECONFIG via :pn-foo overrides
>> the only supported method, or is this just a quirk of the perf recipe
>> that one has to live with?
> 
> That is a pretty horrible interaction of things. As you say, that
> inherit is effectively an immediate expansion of the data and wouldn't
> "see" changes in any bbappend.
> 
> Could you file a bug please?

Done. https://bugzilla.yoctoproject.org/show_bug.cgi?id=15276

I now see that the same problem probably exists for the perl item (just
the other way around because perl is not initially in PACKAGECONFIG);
the line

include ${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perf-perl.inc',
'', d)}

won't have effect if perl is only set in PACKAGECONFIG in a .bbappend.

> I'm wondering if we should have some other form of inherit which
> applies at the end of parsing which would avoid that issue. Sometimes
> order is important, sometimes it is less important with the inherits.

Dunno. Maybe a new bitbake keyword "defer" (or "late" or whatever):

defer inherit ${@something(PACKAGECONFIG)}

that would parse the rest of the line as usual, but instead of adding
directly to the statements list, instead to some new deferred_statements
(which StatementGroup could track itself, it would probably just need to
be taught .append_deferred and .eval_deferred methods and have a
.deferred member).

I don't really know much about bitbake internals, it doesn't sound too
hard to do, but I'm probably missing something. Also, perhaps it's too
subtle.

Rasmus


