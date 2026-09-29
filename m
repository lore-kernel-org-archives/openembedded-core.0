Return-Path: <BhavikkumarGirishbhai.Ronvelia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C49CCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:58:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1032.1790657879654619732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=knieFWIy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4732b2873d=bhavikkumargirishbhai.ronvelia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T4f5Kl1067181
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Nn6SayckWoROaQH1NEnLi6
	FiDQ7bxbMeAVs8i4uhyGY=; b=knieFWIyaQdghhyI38FV1uImIpKe7rqR+1Xmd5
	d3iSnVs/UvfYpTKnpESH04rY+BFQLYMVKvt8yw5oWpfWhHiolS+ooSnKLva3UuzK
	o/ocwsGQfVcSv00kj8PA7ToB9CwbKr6+jDlPaA8mfKsDq4rlQjSEiAbYNt8oRU2C
	eoJ5HAUGjxzwsNXUA7T9C5oOii7TNCowcTiYUnHMzgi6vPhvPhS6OGjYMu7tq83d
	CPdxVtHFgMI9V7lft7KN+X4AEiuZRJ2W30JNakGEnN9nokP7ummeM7qdySsRZ45k
	6zrGP2OU7fPCoUkHyLbN0y5wIaxEGVWsjEQ+V4h+oQyUig6w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022133.outbound.protection.outlook.com [40.93.195.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515btwh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 04:57:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEuaZNwxg/5OvB9PpdJf5ycjiB/Ymb8JzrJeB7U3Sb8UnjIw6BUZNWqhA8zcuKqii2UkzrkzlSdjhrOzKt9jMLCeBkGUmIWk4hJFMf1/itXamDmePzdEbldJBM9Y5XQeCq2DtWgub4m7GBAQCH+Wt23x3UcTBGJ7x15LVUqEp/z7U0oyvEE3Se2hc/wT1+uB/RnOPv3PyKGwv9tF7TuPgf6f0PoUuZag9p9zHsmxHF8go0fO9TAY6/3oWKCA6DW44XxSkZU2Jv6OsQRi4TaLchVbMKvHWD96ItFxEdjqoXjL3VltgeSr/KZTN6yjRMTBkouexyVM0lxZn01Ty8dP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn6SayckWoROaQH1NEnLi6FiDQ7bxbMeAVs8i4uhyGY=;
 b=DDNGXoREvcBDh7uePzEVJE8o0jKblSaqvf4/l5tOO/5e4MqhUlW/XyAIxVFii9IlpDExK+vfskTRAwOPFZhJxY449dLQ22AqhkXsKTkUtL4+/r97dWENm9jhx0VEp9mUfdi1qISoVOzCMaU4rh7hPjxSEgoTLp04/VgUu14nQ0WH2YSMSKddPB/D8SAcuwrk3A2oute73JrcaYEE3i9NC7qWKEdcumGu/82qny1iMeuraWQ/6Vq/JSsWXdZ1DbFFcNm1wJ6+h7lzgWJ0DkwkIaJ2kvaEBciQEQLAaFdXvJTUaPIkP3qCGdH6B083B+nYGqejz4PSS7jpO5FDyFVgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 by MW4PR11MB6861.namprd11.prod.outlook.com (2603:10b6:303:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 04:57:54 +0000
Received: from SJ0PR11MB6816.namprd11.prod.outlook.com
 ([fe80::db81:db0a:7818:3113]) by SJ0PR11MB6816.namprd11.prod.outlook.com
 ([fe80::db81:db0a:7818:3113%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 04:57:48 +0000
From: "Ronvelia, Bhavikkumar Girishbhai"
	<BhavikkumarGirishbhai.Ronvelia@windriver.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Komati, Shiva" <Shiva.Komati@windriver.com>
Subject: Re: [OE-core][PATCH v2] libpcre2-ptest: add testoutput3C for locale
 variant
Thread-Topic: [OE-core][PATCH v2] libpcre2-ptest: add testoutput3C for locale
 variant
Thread-Index: AQHdTzVGx9IqDvz+sEqujZwPbmVBRrbj0aUAgAEt6Xc=
Date: Tue, 29 Sep 2026 04:57:48 +0000
Message-ID: 
 <SJ0PR11MB68164E93F661CA2D6DC02523828C2@SJ0PR11MB6816.namprd11.prod.outlook.com>
References: 
 <20260928103639.816523-1-BhavikkumarGirishbhai.Ronvelia@windriver.com>
 <22a606d48b2107c3eb2c8158369a656aefe4c057.camel@pbarker.dev>
In-Reply-To: <22a606d48b2107c3eb2c8158369a656aefe4c057.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-09-29T04:58:25.693Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6816:EE_|MW4PR11MB6861:EE_
x-ms-office365-filtering-correlation-id: d42e0977-454b-4479-6f58-08df1de63520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|5023799004|11063799006|3023799007|18002099003|22082099003|4143699003|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 hGfxaOysIOUgIvjmf6eGhHYNylZEcWTkDSQb1/ymGaxv5NtrVblBnOx8GF4835EwRbmBAEP2j1NxOLq6tRM1gWa1drDgl/N3KVhOWtwR7m85UXVC2+aSZQq5/zdigom/X+w0MTRqiWsa0+ERn9h3vj9pT3ixhEtdTPWh8KsIMO2QwSYbGknyzM30gtbDAGWYtT7gKtVDuyW3+oay8akL5qzhHgwwr3CHMZupu7bXkl1qPyDjuhmFVcDumNWikk+Y7auk2BmVNbqwBuSTvRPm5QrnkC2/6YxdyVjRmBA1Bvvn8Urx7ZOqvC7xk9aU5ay2KtSQru5zKatYtdJUuW+rDQx5xtdTCyjkAEhV6UAGWdZGPmeY5s/xshoxBjTMiskvSBpV8vQJtWRsbY+um27FpgF2fJtB3IRnIgt9BZQMcAffqXWwnnSn/E41fNxzPNMQggO7R4Wl2izsTg4lIQwla/3RwVxQdY5buFEiBnigP4jxFir8qZmt/B6AAR7/6RXIF9OGIr7p0UUyLs9YtrImh/6j9bcF+opDa3YjWxLJNBbEXbxBmxx0RkQEP6ZvbuynYiON/4BJDwG0g8IWqiT7dNMLXE7P/Vmd4wv74gpYuivj0uUG36WRO46cWzIlnr2mnWSQZPoU6KxTER7XgDLEDDgu0VjNPBm8v9Td7E5sPLg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6816.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(18002099003)(22082099003)(4143699003)(8096899003)(13003099007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?E0EavWpdC+kbl1LBH3gFiTfFWzbqxbhLYfzx4j74LMQQ0IE882YqT7KTxNqR?=
 =?us-ascii?Q?ZWtXMlaXN/fYLk8FAugY20W7BoKbTuIDjXujKPTU+fOPLE7aZtFcfgxDBqOq?=
 =?us-ascii?Q?03EgKcrsBGXCtLBCfvJgueGmoGCFV4zNl8lGjpfnHySb7oyBLUqhPPW/b3Db?=
 =?us-ascii?Q?pMI5A4iS8BoT0fgZKyqSaaDlDdU9dsePYcHtSjga8NxZKaT01sWhBDh71wtJ?=
 =?us-ascii?Q?8GMU0Gac78LPKutWl/M1zLszBSfcDH4tyHMT8sUeOUV3RtZ3X92E/7f+j65d?=
 =?us-ascii?Q?LMqycj/fMrPok13I5lYLpiCbd1rNNKNZcqkctWRzf+cUtWWm5Im5lHB0mhES?=
 =?us-ascii?Q?whKJGb8l3GhNP7cFt3YLZz5yOCfonvcs1NVLkQLD96OAuRopl0YKtL/THMwV?=
 =?us-ascii?Q?qP6lJ8DPnhcEM0EDKs6i7Upi8kMKRsCN+EYwCXNchITYpj8THBXbmRxs6Jbt?=
 =?us-ascii?Q?qaR5zfJE7wGajK+f33Xr6PVYMaw7BpJXqrpLJGBVaUIgbdQFQGBBE5xIOQ62?=
 =?us-ascii?Q?KC+aplDhnADJERjOM4r57yn2BiC2AHqimXpYwpqhFW16TtqzxRbwd/G/wpbf?=
 =?us-ascii?Q?wAGh3LsCc6PFWE+0YfljAZ34tIzx91128moH8F7n9QQV6JtLUnRwrfgdyN9T?=
 =?us-ascii?Q?3wfH1fQHEKYwz/0ycmlFf7QR3pp1J7l07/AXwonu2a06L/fxek9ePMYbRQhk?=
 =?us-ascii?Q?BP6gfYNsn0Zxq/+gTHb8qgxOT1udNyNEO339/t/Rshw4/+mWPVCH/LQn06w6?=
 =?us-ascii?Q?66zXmQBrImrP5FTeBZr/UYPQNNUDSQR9GzcgOGXgNxZhSzIsRMfELuN81M7M?=
 =?us-ascii?Q?4TJe2to4PMP5hNsDA28LI0pwSf0CQWtJwB7pADWmqEDgznmP5zHsKq1nKr25?=
 =?us-ascii?Q?DlUhFZ+8nRNN7EA6fyKEog3OErVE/gXeXMMhgW9VEeK3rGy2j3ZIfQLpl3BW?=
 =?us-ascii?Q?1CPtWIostUuMpxNTDUk1eFH8ZAywNVuEcGNfN7iYHq4kWZEHte+3L6YoZKrZ?=
 =?us-ascii?Q?yvsuwuZzvdmNyy9WCRzwRhAB8zyoXgUjKGy6pD560QHzAQvEcmkU0O5Z1a8T?=
 =?us-ascii?Q?wWXQSIRV7C/oMjk/xvwT8/G5N9dCDNELVJ32JMwLehSbt/okKw8/iS8gtFal?=
 =?us-ascii?Q?/HEm0VkM88fOSPr2BrEbDK+ktYi6Fu9ZxAYOGjX51NsNw9cGDJf+5LzlgkTa?=
 =?us-ascii?Q?k7+41AXRymZGefxUuN18XgS7oKZLSoBjfKKo77XzHo4QEiubwXjcJ0OArOGh?=
 =?us-ascii?Q?/3V1OTx+sh8yfYqwTm7ZbIOJkPpxGBpa9QsEpjQuLhjvvkFJa2w+o6tCBUSy?=
 =?us-ascii?Q?YFJRtFcgP+vsrQRBr1GmNGzB/uzenavnVLFku5b4vj4zyCMZ4ns07V+WqwwL?=
 =?us-ascii?Q?SXS2Ii7qjyI0U8SoEBMhCf6/M7hUZX69er7UEDZw2JCurdYly5+9R6RWEIKB?=
 =?us-ascii?Q?rq4rf/h2Hwp/JEK+1PeFUETfz7LaNtJsZUY4Ofub22bFfU58n2yX+5ul0sZ8?=
 =?us-ascii?Q?Hdv+Klrg1WmzG5Vyx/gkfWgk4OzzWfwLqqqe8iUXSFlnORAW5mZYhwDeWzrS?=
 =?us-ascii?Q?d7bBBCKWIvM+xeZIkpwvVaDhQB436nDVAN5sEAgrkdYSP/8DqFzs4s8uFnWi?=
 =?us-ascii?Q?QajXT5b5eF6KJ43yXle62mosWt+qGR/F+PU/rUPB6xJSskW9pdHKJxIC22+x?=
 =?us-ascii?Q?5GF8FXnBDszulVixSzKmjlPuxLXwt8VHi7N/HVHrmbr1uG8f75wTsMGAr76H?=
 =?us-ascii?Q?Vopcy80USBlYSrTysUvw8jWHhUiQI6j+LJXBmczdHH+Vp2UicrC9?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB68164E93F661CA2D6DC02523828C2SJ0PR11MB6816namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	jKN2u8t08CDDtVckzMz83mrUH87pKJFmKRUvGfuBgcZ56LXgnDtw4+g/yPri5mEQ6DmaE6Hg3hXlVh61Vw/Q9t1BnWVUegOpPVGbRNxBIDNfOeyE/FQTmZ7IY/BlzRQg7d8gyLd/2FAIlBS5Q5MvxFMWz9M/2K4QdnSczsc5SSK/UnyQ/sVyS59tPCZORMWZz2Mm47qt9MbU5hHcyeCgDGCSdQc17SprjcZlqAgtLV+yxfwwJUTKs6fvMjB7oEU6urmT1FzSVawALeIhjHuqzODiCjPUO2xTLM7Hhp8zs4QtJtLlrfAaRxBQX/JuCbNqUmSV9WrW/PAnjQ/zgyP4iQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6816.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42e0977-454b-4479-6f58-08df1de63520
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 04:57:48.0390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PfVn2w8WngM4/QCE5E5nNCEL5S82DNWl+xXFgbW2a+uSwDH4OHBjtTTQ2eSXNXdJCJon28bcrL8injf2YV/lW8rzOJxMcG3ZNloZtGZlDDAjFQ5hdP1Eq0DkFl2p54GQ4kBl95t9vQzR00k/ftJsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxOSBTYWx0ZWRfXxjR0FqqM1q12
 HzmKA0n7+JzR3GujIwFKNfpQfw7sM4l/0mYXzu5QObKlyuaaNB4o99zeMw9eU28Vf+bMQar96lN
 Q9gGE0yfK8JYc/cmjItL0I/VH8Wd8p0kUlLk3NmPsTJceptb4Mxd
X-Proofpoint-ORIG-GUID: EkXVKs4CPPDgWCaVdKDw8a8VH7xV64GG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxOSBTYWx0ZWRfXwXzSSo5Jodct
 cHwALtQaSyDl0HWOBZbi30Yejpl6nNiYKBtYtbVgcmgMkqJVpavi0H0blh9jR+AI9iiN4FcOgV4
 4ZuYhJf/RgVCqTvZPOUJ4dqfborFu+bJfz19ESrzlkyFQhdtbfv1qn0QenHmz5U1ril0A/bD37e
 cCAZh4VU6+2+bXPaQwwK5efChCO2k5as0ggYMyGW0AW8w31OYWMS5dpFhrs1K39YOHVg5cjLnTA
 tRVG2me4aWBp6EcG2ODx0fk4wox1GTyBvFNTS7zh1U6KV5PDcvlf5lxA0oVPG5kWyztU1jy3tQt
 sDwtgeYqdXMC8aaZx9zllKxbBlB/Y88kp835WoegkyC7i/APBT5MB0Y3etGkXR67iIK5UM6U03l
 X9JsmGaulUdnlGjhrSYeIHAu3ZWby0TmSEiOIJ678p/5dfIyKFKI0OoPrCDnVlIA/j1yQMHv4f2
 qM9cG4PZF/q4tSZeQxA==
X-Proofpoint-GUID: C14wdVpmruGMcSNOHaELP1VOkMpLLYNQ
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abb4556 cx=c_pps
 a=OPAOkIGUrGl6b3ZAImYRoQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=Mol9FZS-AAAA:20 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=CjuIK1q_8ugA:10 a=SjwQ8lFL4Pp8xDvg:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246819

--_000_SJ0PR11MB68164E93F661CA2D6DC02523828C2SJ0PR11MB6816namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, Paul, for confirming the root cause and the review.

Regards,
Bhavik
________________________________
From: Paul Barker <paul@pbarker.dev>
Sent: Monday, September 28, 2026 4:26 PM
To: Ronvelia, Bhavikkumar Girishbhai <BhavikkumarGirishbhai.Ronvelia@windri=
ver.com>; openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org>
Subject: Re: [OE-core][PATCH v2] libpcre2-ptest: add testoutput3C for local=
e variant

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 2026-09-28 at 10:36 +0000, Bhavikkumar Girishbhai Ronvelia
wrote:
> Test 3 (locale-specific features) fails because testoutput3C is missing
> from the PCRE2 10.48 release tarball. It exists on upstream main branch
> and will be in the next release. This carries it until OE bumps to that
> version.
>
> On systems where glibc fr_FR locale does not classify extended Latin-1
> bytes (0xC9, 0xE9, 0xAA, 0xBA) as alphabetic, none of the existing
> expected outputs (3, 3A, 3B) match, causing Test 3 to fail.
>
> testoutput3C was generated on the target by running:
>   ./RunTest 3
>   cp testoutput8/testoutput3 testdata/testoutput3C
>
> The file is installed into the ptest testdata directory at package time,
> following the same pattern as the existing run-ptest file.
>
> Signed-off-by: Bhavikkumar Girishbhai Ronvelia <BhavikkumarGirishbhai.Ron=
velia@windriver.com>

Hi,

I can confirm that the testoutput3C file is missing from the 10.48
release tarball, but it is present in `pcre2-10.48` tag in the git
repository [1]. I suspect the issue was that it was missing from
EXTRA_DIST in Makefile.am [2], which has now been fixed on the main
branch [3]. So this should be included in the next release tarball.

[1]: https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/testdata/testou=
tput3C
[2]: https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/Makefile.am#L76=
6
[3]: https://github.com/PCRE2Project/pcre2/blob/main/Makefile.am#L898

So, I think we can take this patch.

Best regards,

--
Paul Barker


--_000_SJ0PR11MB68164E93F661CA2D6DC02523828C2SJ0PR11MB6816namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks, Paul, for confirming the root cause and the review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Bhavik</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Paul Barker &lt;paul@=
pbarker.dev&gt;<br>
<b>Sent:</b> Monday, September 28, 2026 4:26 PM<br>
<b>To:</b> Ronvelia, Bhavikkumar Girishbhai &lt;BhavikkumarGirishbhai.Ronve=
lia@windriver.com&gt;; openembedded-core@lists.openembedded.org &lt;openemb=
edded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH v2] libpcre2-ptest: add testoutput3C fo=
r locale variant</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon, 2026-09-28 at 10:36 +0000, Bhavikkumar Girishbhai Ronvelia<br>
wrote:<br>
&gt; Test 3 (locale-specific features) fails because testoutput3C is missin=
g<br>
&gt; from the PCRE2 10.48 release tarball. It exists on upstream main branc=
h<br>
&gt; and will be in the next release. This carries it until OE bumps to tha=
t<br>
&gt; version.<br>
&gt;<br>
&gt; On systems where glibc fr_FR locale does not classify extended Latin-1=
<br>
&gt; bytes (0xC9, 0xE9, 0xAA, 0xBA) as alphabetic, none of the existing<br>
&gt; expected outputs (3, 3A, 3B) match, causing Test 3 to fail.<br>
&gt;<br>
&gt; testoutput3C was generated on the target by running:<br>
&gt;&nbsp;&nbsp; ./RunTest 3<br>
&gt;&nbsp;&nbsp; cp testoutput8/testoutput3 testdata/testoutput3C<br>
&gt;<br>
&gt; The file is installed into the ptest testdata directory at package tim=
e,<br>
&gt; following the same pattern as the existing run-ptest file.<br>
&gt;<br>
&gt; Signed-off-by: Bhavikkumar Girishbhai Ronvelia &lt;BhavikkumarGirishbh=
ai.Ronvelia@windriver.com&gt;<br>
<br>
Hi,<br>
<br>
I can confirm that the testoutput3C file is missing from the 10.48<br>
release tarball, but it is present in `pcre2-10.48` tag in the git<br>
repository [1]. I suspect the issue was that it was missing from<br>
EXTRA_DIST in Makefile.am [2], which has now been fixed on the main<br>
branch [3]. So this should be included in the next release tarball.<br>
<br>
[1]: <a href=3D"https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/test=
data/testoutput3C">
https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/testdata/testoutput3=
C</a><br>
[2]: <a href=3D"https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/Make=
file.am#L766">
https://github.com/PCRE2Project/pcre2/blob/pcre2-10.48/Makefile.am#L766</a>=
<br>
[3]: <a href=3D"https://github.com/PCRE2Project/pcre2/blob/main/Makefile.am=
#L898">https://github.com/PCRE2Project/pcre2/blob/main/Makefile.am#L898</a>=
<br>
<br>
So, I think we can take this patch.<br>
<br>
Best regards,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB68164E93F661CA2D6DC02523828C2SJ0PR11MB6816namp_--

