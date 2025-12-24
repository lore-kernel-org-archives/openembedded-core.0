Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406C5E74905
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 01:48:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.113076.1766540878840525694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 17:47:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=tDyPTXHt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4453ea62e8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNNuKhs597343
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 17:47:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=aIcOjSxNq/wWDRhIDnH7U+
	69p9AGygGSqbne7iARuIo=; b=tDyPTXHtXQuB9yWmGyACIf1OIwzSGMhQZCTqOa
	a1TZtWALPvlYP61C7s++KyZC5Zab5mpACp1h1tZDmNodr9xTliKQURh0u9oJKQYN
	HLJg0tYdKklopAbaRLTB3f2mIDSaF5P1EOT/OOYSYBZ9BiIrhF2cCW5w0UYXVs5F
	qrtiAZ6UmavwHUOs4xdjuD1ZfndtD+Poeo70LS6oQ0p3i/oyKBE06Ylz1DsIWb33
	5clVMxzkWPT2zWIFBl2BZWDw+hkxDrbtEnzHJwHjB/9cp3vF9lj3WqwScYQ5q2MC
	JsJ26AD7Kxu4qEV3KU8BZcbgczQltBcmcAa4/qn4uW5qyQww==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6hbdqb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 17:47:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USTmx1b3V1Ud/o/lhhYl290g9Z0hswQaHbUHiHuDRTFtskCYDP+yNZHhqYYfbBghHpZlQG5bEGdJQ63PimMhjKyKqpzXh4Crkge/njUKcRFPGZVSNq52aYJ4FnPa2QdDT2Yq5yR4qxDJYkBVPCgzopjB/HIMm/TyzIALmWiiDnDyVf/MFkUwFfP/CYdZ5TBeCmYsv0SYnCr8ZrTbBe/pfEb4Os5KDNppF7bLukvNCgb/Y7RsIe0++np3fLiF4oNff8Pywmc1ypyzuy6N9kDArsQ2Xx8m0Zgop5fye+0QpqoZnEna+SQwABaXVHds5xDaWOGXNIo3z7Msf633jELqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIcOjSxNq/wWDRhIDnH7U+69p9AGygGSqbne7iARuIo=;
 b=x1SE2xyigrplqwOU/H5SnL4qaIf0WQs9aGHeM3fuOF5yyo+G1NRB3SHTYO2CyzECVqAAdkEP1MLy7+ns8EftYv2mX0qS2ZEouq9lj7FpMhWgMv0OUHZPckvL+V6/0JuM5Ik3ATU1E+I1DgLaI80z2d5DmYF5OS1dsrz9wydn/tEJgWSSo/uVjaYm0EwtvMF7rEzu/n8Q4Mg1fLljydfaeqqrRqS8fuLTnARIw4BmIF+SYwtMLEAu2BXTYpqaCIB8KULnLsD9K+DP27j2CfgN74RWjg+YhRmo38S0OdEqFh7+qQxcieEdjoUG9L+517Js9nuVluVku8x9KW38Wh6dDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 01:47:55 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 01:47:55 +0000
Content-Type: multipart/alternative;
 boundary="------------bBJ0oYO0rkKxyEamhmtHFwyR"
Message-ID: <c2a296a3-0345-4814-ae07-257440b67fef@windriver.com>
Date: Tue, 23 Dec 2025 20:47:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
To: Ken Kurematsu <k.kurematsu@nskint.co.jp>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Ross Burton <ross.burton@arm.com>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp>,
        Yoshitaka Ikeda <ikeda@nskint.co.jp>
References: <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
 <1883AE2C045A1BB3.1614991@lists.openembedded.org>
 <TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
X-ClientProxiedBy: YT4PR01CA0218.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c389bd0-320e-48a1-8731-08de428e7506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZnlIbjN4YVcrZGpDb1YxTkVIU2haMnh2YVIwRDMvSmh6cktmZGhkdTNpbnBR?=
 =?utf-8?B?NURNaFU2bEVNbHdIbmVndWQ2MUdmdGc0ZzZvWkhlY3RSVDFLWUtHdEVPNDVP?=
 =?utf-8?B?TmFRa3VkVUc1eUlKWE04STNsdVNTZ0VQQU4rYTdOYjhTUThJQ09YN3E2Z3VT?=
 =?utf-8?B?eHhxbmdTT1orZ2djRWdZN2xqRVpDSkFPQm04YTBQVFpPSW9tQTBkVUMwVmZB?=
 =?utf-8?B?UmpDd09uZW1ZN0M2c3BwbkFEcTdseEZXOTQrcEdIdGw5R01mN1RaNmhVSDZF?=
 =?utf-8?B?amZwUjB5S2kvVkNSYlhpemZ1aU9ZSWZGeTBzS2tMaHFpaDhibzdNRlJlSHRj?=
 =?utf-8?B?aUwwRXNrdzlvRU1IRXI5SEVteXZ1bDVuOFdoQ1IzYUxseHdndGNOZWUzbUxE?=
 =?utf-8?B?ZDBIYmpzcUxCZjNMMStDY0h2S25jSkpKeW1SRkRiRFppb0xEK0NFS2tlSzBj?=
 =?utf-8?B?YUswTkdQL1ZiZ1gxZmliWXBrdXlXRjRaS1c4cGhBQ25oNDJkd0d4VWQ5YVFU?=
 =?utf-8?B?SUZ1K2ZSUWFzMVVtWUdKSnFPYWNtdFhqbGUydU5jRHhBQ3gvMklRWURJNzk4?=
 =?utf-8?B?NE15MGF1a2ZnV05pODBaSHk1ZCtldUwzemVDa1VLa0pyUlZQNjNxa1NpYW94?=
 =?utf-8?B?TVNEdk1CUTdlMHZIYlA5ZHBoRzhPZGVxVlpKY2xXbEhsK0ZKTkkrMmdVVlRB?=
 =?utf-8?B?WTYxRmk1Rkphayt0NXVyV3lqNkVpa0VGZHBMVUdXV0hQelJLN3NiZ05lWnVi?=
 =?utf-8?B?QnlVQk51QmFPZ2k0ZUdHN1F0L1p0b3luRXRNaEQ1dnUxZGg2UzVGSm8wOXlq?=
 =?utf-8?B?WXg1dXM5UEFPdG13ZjBTbXcvSVcxTGcwUzR5eGdtRHlhVkM5LzlpRlNEV3Bu?=
 =?utf-8?B?Uk5wcmlnNUNwL2krbU5jOGFJVFl5K1lvZEk0dHZ6MFVZSk1BM3o1N25Nd2JV?=
 =?utf-8?B?eDJMYk9LM2JHK25aOXE2eU1DVEM0TVVubkJGU0pEcmRVS3BwVzFQSDd4SDk3?=
 =?utf-8?B?UTVubENWNnlkSEpDYll1MWdib0tJUy85UDdGY3ZxWDl1Nm5MQXFvSXU0akND?=
 =?utf-8?B?d0tqbk1NOUJsL3Z6ZDhqNVFSQ056TzVvNmo4NVd6STFWL3NSQm1kSHgvN0RP?=
 =?utf-8?B?TGczOWZnaVpON1huWmFBWGIzZnI3QVduYi9Da1Jzc3dod00xaDBPeHFHVFEz?=
 =?utf-8?B?NkM5NkVKNFZPcURZOHd1L29xaXpCbk5zdDJNRkgrR09vcW9Xd2RMWVk3SlFl?=
 =?utf-8?B?QVFteDhmT3d3UlRsNWJuMlM1dytLYUFyQmdhRWd3VzdMZGZMNGxwZWEvbFdy?=
 =?utf-8?B?aXJEdGwxTk5YOUFnL3grQ3JhNTlZUFB3Q3VhM1lvQlRpajBQamlVMDY2WUgz?=
 =?utf-8?B?OGEzV2J0UFY2OERXWVNPY3NlWDU2anJMbXRLMU9VYnFsNENpUHJ1dzhhNGFG?=
 =?utf-8?B?M3RITUF3cTRRWDFkRXpuaW1MYk5waU9kRzhZdmVRWm1VUW11OFFvT2VZUVlX?=
 =?utf-8?B?N0Y2aGpEVDh6bG10VmZrMG5QN0xDT0Y5NTk1NFZOeS8xQzA3UldMQ2w4aUwx?=
 =?utf-8?B?TlVQQ0Q1UXUyeUtza0VsZ2hOR3I2TnpSM2lHYklrT1l4b0Y2Q1RsRlcrR0ZE?=
 =?utf-8?B?YVp0a0dTNytGZ2cyZm1tcDZDdktkWnN4dEh0bXV0MURJYTFUYWJBQUtzaTJJ?=
 =?utf-8?B?WGYwWTdUVGN2NWFUMnNMZWtsbGQ1TnozOUp2RVJkb1ZlV1EyaThnME1RZkw0?=
 =?utf-8?B?Z0MwUFR4eGUrL2w2OUtpWDJNQnpvMjRKbTIrVXd1K2NCandzaW5QLzh6akFh?=
 =?utf-8?B?OG9iWENXYUVQWnhGOWpZSHc5TWVRdWdQWDY0VkppUXppcTI5WWpUUjdNRXhJ?=
 =?utf-8?B?WkFFRjFWUzEyM0tpMVVsMkFDbXNsdFh4V0lNV0dibzhKSFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzNYR0dNN0N0MlNYNVh1d2FBNmJkQmdOakxyTjh2R2tQSk10eXRqcVFqTnBZ?=
 =?utf-8?B?OUNuL3Z5cmMzLzE2MkYwRGxzTUFFbHJZdCtjM2FJMkpuaFFJQ3h4aWlxNnk0?=
 =?utf-8?B?SWk1c2llbFZWYkJCcnpNWVNMTmpTQURqNXQ2V0dqOE9KR2xCTDVnTUZnazRq?=
 =?utf-8?B?VGF3bnNlYmhhd2orRld3SDh0T2NrbktTZXZ3UERoY2xwVFYxaUswWi9HemJO?=
 =?utf-8?B?Z0syU2tuY0VuQmE0WXBzVys1Um9Da3oyclR5cVJWSUtCbC9XV1B6WngzVXdH?=
 =?utf-8?B?am9qWTgxeGcyTjFYditIaTFyZnp2OWk5M3FjMEExNG9NcE9ldXVOUUEwZUpj?=
 =?utf-8?B?VmJ5V2srWEk2NzhsMjljTWVGV0tQVTV6UmgycVRTbzVHc3Y5NFRiOXVjS0VT?=
 =?utf-8?B?Q3ZKeXE4WXhkaTZNRlR2ejA5SGNMUWtlMTBmcXRDWWZEQXp3QUZISVYvQnVR?=
 =?utf-8?B?REUzZGdpZGVsZnBFL0ZhVUs2ZE41OVR0S0Y1UlRoUml0Zmg0M0pDcWVLQ3RF?=
 =?utf-8?B?L3BaN25kM08xRWVXVWNmN2dIWENlM1BIVGRqdGZiQ3laMmtmTzMraE5KNjB1?=
 =?utf-8?B?Sm1tYWtEcEp6dDlPaXdvYlZwNXNWdEU3TEpFNmZCQksrVzVVajF3WlJEYXBQ?=
 =?utf-8?B?UTdHc293SWt2blh2blcrRytwTzV6Ym1ESGkvVld4MHc0QWJPWUJrU0pvTXli?=
 =?utf-8?B?VHJJWHgxek5meE9WV1ZFb3RLaThrVEdBaUE1VWFkaEJ2SkxqNExadWoyU2xn?=
 =?utf-8?B?YVlyZHlSWGFTV1lLckp1MEZLdmkrcmRBZjZrck9zRkdqQmVXWER0QU1BT0Zt?=
 =?utf-8?B?UEF5eU10ZVJVdWpOVTdvZ1JZa2hzK2hFY05IQ0J3NHgwZTNXbUoyQ05xRTRy?=
 =?utf-8?B?TEYwU013eFF4dzdYa00yU1FZdEhrdFAxaHVKd01CUTZlOVg1bFoxOU5pQkc1?=
 =?utf-8?B?QStuWmV4MThaOUN5Y0FBMnFMbEZlYldtR0dBbTh1SVYvdkQva0J5NXlzeUV1?=
 =?utf-8?B?elp3WjcyUWl0UVdLNTlteitUMG1tcjRua095VmJzN3F6YkNyTS9lSWxuUlhP?=
 =?utf-8?B?MkY5SnlYb0wyYjZVVlg0cE5sZE0wMjYxNDhxYkhRbktEMkp1a3VnbHFmYjE2?=
 =?utf-8?B?Q1JGOS8wZ2drTUtTNzF6ek1CVVE4RnNkdWdxTEFPdnBFT0p5T2pzaXorOWhk?=
 =?utf-8?B?Z3V4OHA0MlhscFhvZllIQWU0a2NZNGpob2R6VElncWhqeEdJKzZMREtMcVBv?=
 =?utf-8?B?R0pvSHgxaHhHRnc3VHFxbEJMcjJCOUFPb0JhQm5hbUF0MWxKWkVuUEZGOVp4?=
 =?utf-8?B?cnVLUDNuT21lYTFiRVZzNnF2QjRQY0hUam5lbUFwTVZwcG9Gb2ZrOWg3eW9K?=
 =?utf-8?B?aTE1SU5la0RDcVFTTGpNcXBrSlZwQkZRNDQ5NVJhMkV5enE4ckZzaTNCZndO?=
 =?utf-8?B?MDhTUlNrRm9BUEkveXFiZmxuRUZ0NjE2cjB6Q2JyVFQ5WExaZUVOSXd4TldG?=
 =?utf-8?B?TEI0czIyK3UrS3l1bGhtUjB4cTFmRjNSNllXVFQwbGljaTRwMk40WEFXbVor?=
 =?utf-8?B?a21Mb1ppeHdjQ0plQVpSSmV6Y2xLVWlyazM1SCtPOWFDT3lIQm93V1pZTmJF?=
 =?utf-8?B?eU9CS2ZtMlpzbU5jMHVYMlhmY2VEYUpSbm1taDRsc2FtMzNkV0VUaHkrS01p?=
 =?utf-8?B?RjFieUhBeDRnWHc1TytGN3ZYRElVS2d0T1NYZVpSdzBOcG1BQUhpRHpqU2Z1?=
 =?utf-8?B?dFNiZzBZRUUxL2VwK0V1TnRvb0FVcHVLMFF6ZitzeXFoclRQTGx2ZnhJYjBB?=
 =?utf-8?B?SlhlTTBYT1l5S2M3QzBpZjhpMk5CSnYvcHdqOFR0clVJMXVSNS92OXZBcWtn?=
 =?utf-8?B?cUk2SzUrcW5lUGVuMFZVV0JGUWNOWEk2WExpdmtVSnhIOTFvdFpMRUZpcWox?=
 =?utf-8?B?cWNGK0NjRkRYcFhqRHkxUkVob1ZsdGJQRDJXM1ZlWDJGQjU4MjhBRGxaQ1dO?=
 =?utf-8?B?akExOEhPU3ljNzFOeXlXTVErcW9XOXpGWmpKTWx1a09aOE1uS0cvSlFBUnpv?=
 =?utf-8?B?L3Uzeit5S1YzTmVPNDkyUnVZVDhsNXlUSXE5N2UzZE85N3NmS1JDa0RxV1JU?=
 =?utf-8?B?Z0RSWktjYUJoWjByN2N6aUpyajRsVUFEWWk4TnlWczRqNmlQR0gwc3Y2YlFr?=
 =?utf-8?B?QWxpaEhjYTBSNXBwWmlFMWF4c25tYnNxODJMWXVZQ2ROVHc5cFRuc3B6SCs3?=
 =?utf-8?B?dDNFTHhvWjRMblpaMkdyV3pIRkpSTE1paDFIdlJoRWJEbVNtT0gvVUhCK2M0?=
 =?utf-8?B?R1A5NEkvWGp5WE4xckcrd0d4SlhmbDFIUGRqekhJWXFHVDJWRWpPQ1d4a3RT?=
 =?utf-8?Q?Mi11pHNts8zz5rRQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c389bd0-320e-48a1-8731-08de428e7506
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 01:47:55.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aE5akeZZNREjnCPF8nzRj0hlNvhhqUtj+qOMOyt0RyXtBlBWKrUu6cvKv5MPCaNGZgZLms9uD5XxKoaXVtnHgtuwn++2u89l+S8xbt3GXhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxMyBTYWx0ZWRfX7/QAyCIawW/6
 iSutVBXjk0IIBuxUHx1T46c96L1c/5YyEaPBf0vfQKwP6pzbBTP6wGTjmDm4FbtbOXqpwap3hyX
 oWkZC/2JGNxt3sn9HueOsiRVNKpsurOTVqEKck/OBDfEqaaiWeZ8Zji24ZYQdC4NZXkFnh788oz
 CP6g5MtMRBRICiZKEfZ4cYOaVVTmRd+Xomp93wAry+Jq52QoY76RbrviSsFdasmnJ46cqQs6IQz
 bRksL6ddqUiedZYttarpgzyWA2nn24jbNK41kbA7yMBllUNQj8XtZ+dyCqAW55+nA1O4Pj5TTsu
 KlBwZ6PeKHhETil3b7sxqkgg++9Io7Nvk3pqkTNzZ0ugTDxfYINf2d3EUIOYYcBiqhwnrivOtqB
 HaJIDm35/5ndP4t2ObF5wgGL5qVkhGKIQUjQyZDh0rn+P+ErlxadJebOI+QInWzltufcTmwv3zb
 FJKtN5e2+6P73k4S4NQ==
X-Proofpoint-GUID: 3VD0sogctNYNl5uBVMf-8Xb6OE9LeojY
X-Proofpoint-ORIG-GUID: OtI6RuSdNO0GMCwpjpl2LoaynN_C994J
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694b464e cx=c_pps
 a=hwAR686YzpmZ7aH69gEPcA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=vmi6oJg5AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=RsLdkipBEaNfqpvOsREA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=uplykQ84CrIpgIUoPzAA:9
 a=by5dLmwGKkx8mEFn:21 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=ioboX4i089tB3dTPuEcW:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 01:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228512

--------------bBJ0oYO0rkKxyEamhmtHFwyR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BNNuKhs597343

On 2025-12-22 7:05 p.m., Ken Kurematsu wrote:
>
> Hi Randy,
>
> Let me confirm one thing about your comment.
>
> If I make the corrections as suggested in the comment, when I retrieve=20
> CVE_PRODUCT with bitbake-getvar,
>
> only "theora" is included, not "libtheora".
>
I expect both libtheora and theora to be valid matches...
>
> (This is the result of an old test environment, but it was the same in=20
> 1.2.0)
>
> $ bitbake-getvar -r libtheora CVE_PRODUCT
>
> #
>
> # $CVE_PRODUCT [2 operations]
>
> # set xxx/create-spdx-2.2.bbclass:11
>
> # [_defaultval] "${BPN}"
>
> # append xxx/libtheora_1.1.1.bb=20
> <https://urldefense.com/v3/__http://libtheora_1.1.1.bb__;!!AjveYdw8EvQ!=
eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm=
6WVIz8qZmIROdM8lL0jRA$>:23
>
> # "theora"
>
> # pre-expansion value:
>
> # " theora"
>
> CVE_PRODUCT=3D" theora"
>
but=C2=A0 it doesn't look like that.
>
> If libtheora should be included, I think the following correction=20
> would be best. What do you think?
>
> Sorry if I misunderstood.
>
> CVE_PRODUCT =3D "${BPN} theora"
>
probably not.

I replied to your email in response to a discussion in the Yocto patch=20
review meeting.
IIRC, Ross Burton was the one who suggested the +=3D.


I don't often use the CVE check scripts in oe-core so I'm not sure=20
off-hand, how to confirm
that the BPN is the default.

Ross ?

Ken, please be patient, it the winter holiday season so Ross may not=20
reply for a week or two.

../Randy


> By the way, the NVD records have the following values, so I think=20
> theora alone will be fine.
>
> (itheora is a different product)
>
> $ sqlite3 downloads/CVE_CHECK/nvdcve_2-2.db .dump | grep theora
>
> :
>
> INSERT INTO PRODUCTS VALUES('CVE-2008-0797',=20
> 'itheora','itheora','1.0_rc1','=3D','','');
>
> INSERT INTO PRODUCTS VALUES('CVE-2024-56431',=20
> 'xiph','theora','','','1.2.0','<');
>
> $
>
> Best Regards.
>
> --
>
> Ken Kurematsu k.kurematsu@nskint.co.jp
>
> *From:*openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org> *On Behalf Of *Ken=20
> Kurematsu via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu6=
7Ekm6WVIz8qZmIROdOLXrdmwg$>
> *Sent:* Tuesday, December 23, 2025 8:43 AM
> *To:* Randy MacLeod <randy.macleod@windriver.com>;=20
> openembedded-core@lists.openembedded.org
> *Cc:* Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda=20
> <ikeda@nskint.co.jp>; Ken Kurematsu <k.kurematsu@nskint.co.jp>
> *Subject:* Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
>
> Hi Randy,
>
> Thank you for your review.
>
> I will reflect your comments and post v2.
>
> Best regards.
>
> --
>
> Ken Kurematsu <k.kurematsu@nskint.co.jp>
>
> *From:*Randy MacLeod <randy.macleod@windriver.com>
> *Sent:* Tuesday, December 23, 2025 3:58 AM
> *To:* Ken Kurematsu <k.kurematsu@nskint.co.jp>;=20
> openembedded-core@lists.openembedded.org
> *Cc:* Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda=20
> <ikeda@nskint.co.jp>
> *Subject:* Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
>
> Hi Ken,
>
> On 2025-12-18 11:01 p.m., Ken Kurematsu via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu6=
7Ekm6WVIz8qZmIROdOLXrdmwg$>=20
> wrote:
>
>     In the NVD database, the product name of libtheora is theora.
>
>     This was set to ensure that cve-check works correctly.
>
>      =20
>
>     Signed-off-by: Ken Kurematsu<k.kurematsu@nskint.co.jp>
>
>     ---
>
>       meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++
>
>       1 file changed, 2 insertions(+)
>
>      =20
>
>     diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b=
/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
>
>     index 04de8507fb..bacaf3aee6 100644
>
>     --- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
>
>     +++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
>
>     @@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D "ebdf77a8f5c0a8f7a9e423238=
44fa09502b34eb1d1fece7b5f54da41fe
>
>      =20
>
>       UPSTREAM_CHECK_REGEX =3D "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.g=
z|tgz)"
>
>      =20
>
>     +CVE_PRODUCT =3D "theora"
>
>     +
>
>  =20
>  From YP patch review,
>
> Please use:
>
> CVE_PRODUCT +=3D "theora"
>  =20
> to catch both libtheora and theora
>  =20
>  =20
> Thanks,
>  =20
> ../Randy
>  =20
>
>      =20
>
>       inherit autotools pkgconfig
>
>      =20
>
>       EXTRA_OECONF =3D "--disable-examples --disable-doc"
>
>      =20
>
>      =20
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------bBJ0oYO0rkKxyEamhmtHFwyR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-12-22 7:05 p.m., Ken Kurematsu
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}@font-face
	{font-family:"MS PGothic";}@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	font-size:12.0pt;
	font-family:"MS PGothic";}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	margin:0mm;
	font-size:12.0pt;
	font-family:"MS Gothic";}span.HTML
	{mso-style-name:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D";
	font-family:"Courier New";}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style>
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Hi
            Randy,<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Let
            me confirm one thing about your comment.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">If
            I make the corrections as suggested in the comment, when I
            retrieve CVE_PRODUCT with bitbake-getvar,<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">only
            &quot;theora&quot; is included, not &quot;libtheora&quot;.</span></p>
      </div>
    </blockquote>
    I expect both libtheora and theora to be valid matches...<br>
    <blockquote type="cite" cite="mid:TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">(This
            is the result of an old test environment, but it was the
            same in 1.2.0)<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">$
            bitbake-getvar -r libtheora CVE_PRODUCT<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#
            $CVE_PRODUCT [2 operations]<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;
            set xxx/create-spdx-2.2.bbclass:11<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp;
            [_defaultval] &quot;${BPN}&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;
            append xxx/<a href="https://urldefense.com/v3/__http://libtheora_1.1.1.bb__;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIROdM8lL0jRA$" moz-do-not-send="true">libtheora_1.1.1.bb</a>:23<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp;
            &quot;theora&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#
            pre-expansion value:<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;
            &quot; theora&quot;<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">CVE_PRODUCT=&quot;
            theora&quot;</span></p>
      </div>
    </blockquote>
    but&nbsp; it doesn't look like that.<br>
    <blockquote type="cite" cite="mid:TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">If
            libtheora should be included, I think the following
            correction would be best. What do you think?<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Sorry
            if I misunderstood.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">CVE_PRODUCT
            = &quot;${BPN} theora&quot;</span></p>
      </div>
    </blockquote>
    probably not.<br>
    <br>
    I replied to your email in response to a discussion in the Yocto
    patch review meeting.<br>
    IIRC, Ross Burton was the one who suggested the +=.<br>
    <p><br>
    </p>
    <p>I don't often use the CVE check scripts in oe-core so I'm not
      sure off-hand, how to confirm<br>
      that the BPN is the default. <br>
      <br>
      Ross ?</p>
    <p>Ken, please be patient, it the winter holiday season so Ross may
      not reply for a week or two.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">By
            the way, the NVD records have the following values, so I
            think theora alone will be fine.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">(itheora
            is a different product)<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">$
            sqlite3 downloads/CVE_CHECK/nvdcve_2-2.db .dump | grep
            theora<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">:<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">INSERT
            INTO PRODUCTS VALUES('CVE-2008-0797',
            'itheora','itheora','1.0_rc1','=','','');<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">INSERT
            INTO PRODUCTS VALUES('CVE-2024-56431',
            'xiph','theora','','','1.2.0','&lt;');<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">$<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Best
            Regards.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">--<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Ken
            Kurematsu
            <a href="mailto:k.kurematsu@nskint.co.jp" moz-do-not-send="true" class="moz-txt-link-freetext">k.kurematsu@nskint.co.jp</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm 0mm 0mm">
              <p class="MsoNormal"><b><span lang="EN-US" style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang="EN-US" style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                  <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
                  <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>
                  <b>On Behalf Of </b>Ken Kurematsu via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIROdOLXrdmwg$" moz-do-not-send="true">lists.openembedded.org</a><br>
                  <b>Sent:</b> Tuesday, December 23, 2025 8:43 AM<br>
                  <b>To:</b> Randy MacLeod
                  <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
                  <b>Cc:</b> Masahiro Mizutani
                  <a class="moz-txt-link-rfc2396E" href="mailto:m.mizutani@nskint.co.jp">&lt;m.mizutani@nskint.co.jp&gt;</a>; Yoshitaka Ikeda
                  <a class="moz-txt-link-rfc2396E" href="mailto:ikeda@nskint.co.jp">&lt;ikeda@nskint.co.jp&gt;</a>; Ken Kurematsu
                  <a class="moz-txt-link-rfc2396E" href="mailto:k.kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a><br>
                  <b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set
                  CVE_PRODUCT<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Hi
              Randy,<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Thank
              you for your review.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">I
              will reflect your comments and post v2.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Best
              regards.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">--<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;">Ken
              Kurematsu &lt;<a href="mailto:k.kurematsu@nskint.co.jp" moz-do-not-send="true" class="moz-txt-link-freetext">k.kurematsu@nskint.co.jp</a>&gt;<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
          <div style="border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm 4.0pt">
            <div>
              <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm 0mm 0mm">
                <p class="MsoNormal"><b><span lang="EN-US" style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang="EN-US" style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                    Randy MacLeod &lt;<a href="mailto:randy.macleod@windriver.com" moz-do-not-send="true" class="moz-txt-link-freetext">randy.macleod@windriver.com</a>&gt;
                    <br>
                    <b>Sent:</b> Tuesday, December 23, 2025 3:58 AM<br>
                    <b>To:</b> Ken Kurematsu &lt;<a href="mailto:k.kurematsu@nskint.co.jp" moz-do-not-send="true" class="moz-txt-link-freetext">k.kurematsu@nskint.co.jp</a>&gt;;
                    <a href="mailto:openembedded-core@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">openembedded-core@lists.openembedded.org</a><br>
                    <b>Cc:</b> Masahiro Mizutani &lt;<a href="mailto:m.mizutani@nskint.co.jp" moz-do-not-send="true" class="moz-txt-link-freetext">m.mizutani@nskint.co.jp</a>&gt;;
                    Yoshitaka Ikeda &lt;<a href="mailto:ikeda@nskint.co.jp" moz-do-not-send="true" class="moz-txt-link-freetext">ikeda@nskint.co.jp</a>&gt;<br>
                    <b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set
                    CVE_PRODUCT<o:p></o:p></span></p>
              </div>
            </div>
            <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
            <div>
              <p class="MsoNormal"><span lang="EN-US">Hi Ken,<o:p></o:p></span></p>
            </div>
            <div>
              <p class="MsoNormal"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
            </div>
            <div>
              <p class="MsoNormal"><span lang="EN-US">On 2025-12-18
                  11:01 p.m., Ken Kurematsu via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eK1ouKPWLXaDnUfQ3gMs8G0Yz5LwabHD57DRjPY3zICpVSF-uVGuK9BBiDKmGkE_mqMu67Ekm6WVIz8qZmIROdOLXrdmwg$" moz-do-not-send="true">lists.openembedded.org</a>
                  wrote:<o:p></o:p></span></p>
            </div>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>In the NVD database, the product name of libtheora is theora.</pre>
              <pre>This was set to ensure that cve-check works correctly.</pre>
              <pre>&nbsp;</pre>
              <pre>Signed-off-by: Ken Kurematsu <a class="moz-txt-link-rfc2396E" href="mailto:k.kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a></pre>
              <pre>---</pre>
              <pre> meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++</pre>
              <pre> 1 file changed, 2 insertions(+)</pre>
              <pre>&nbsp;</pre>
              <pre>diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb</pre>
              <pre>index 04de8507fb..bacaf3aee6 100644</pre>
              <pre>--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb</pre>
              <pre>+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb</pre>
              <pre>@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = &quot;ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe</pre>
              <pre>&nbsp;</pre>
              <pre> UPSTREAM_CHECK_REGEX = &quot;libtheora-(?P&lt;pver&gt;\d+(\.\d)+)\.(tar\.gz|tgz)&quot;</pre>
              <pre>&nbsp;</pre>
              <pre>+CVE_PRODUCT = &quot;theora&quot;</pre>
              <pre>+</pre>
            </blockquote>
            <pre>&nbsp;</pre>
            <pre>From YP patch review,</pre>
            <p class="MsoNormal" style="margin-bottom:12.0pt"><span lang="EN-US">Please use:<o:p></o:p></span></p>
            <pre>CVE_PRODUCT += &quot;theora&quot;</pre>
            <pre>&nbsp;</pre>
            <pre>to catch both libtheora and theora</pre>
            <pre>&nbsp;</pre>
            <pre>&nbsp;</pre>
            <pre>Thanks, </pre>
            <pre>&nbsp;</pre>
            <pre>../Randy</pre>
            <pre>&nbsp;</pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>&nbsp;</pre>
              <pre> inherit autotools pkgconfig</pre>
              <pre>&nbsp;</pre>
              <pre> EXTRA_OECONF = &quot;--disable-examples --disable-doc&quot;</pre>
              <p class="MsoNormal" style="margin-bottom:12.0pt"><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
              <pre>&nbsp;</pre>
              <pre>&nbsp;</pre>
            </blockquote>
            <p><span lang="EN-US"><o:p>&nbsp;</o:p></span></p>
            <pre>-- </pre>
            <pre># Randy MacLeod</pre>
            <pre># Wind River Linux</pre>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------bBJ0oYO0rkKxyEamhmtHFwyR--

