Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8CDEB490D
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 11:40:13 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43149.1770896410202949850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 03:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 12 Feb 2026 20:40:08 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo2.lge.com) (165.244.147.12)
	by 156.147.1.125 with ESMTP; 12 Feb 2026 20:40:08 +0900
X-Original-SENDERIP: 165.244.147.12
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO SE2P216CU007.outbound.protection.outlook.com) (40.93.138.30)
	by 165.244.147.12 with ESMTP; 12 Feb 2026 20:40:08 +0900
X-Original-SENDERIP: 40.93.138.30
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org,
	Qi.Chen@windriver.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxVKb+htvjV0LwZF5fKRHVr1RhcTUg8FY20xIav6yyZN4eGg18ToXgZnhme+3svM5QKhlpX+RSpN+YMkkwZCSb2s9F/g5LlkNrbPeK9BLHffds8x9Ayx12YEsB4ccxz2u8J5gaqUPgb3aEdCj10BEnZRQKp+42KS8msKvsaha/VZ6meH4QqckTzmvcNJ+wBMUDucCdHMMObmu9Pdr6c70ocFwxVXsxlBSsCktcvBGeRPYDXNqJxaNLDz0Z1ydp1QjMHdc4cT7u1NniPcH+CHm3bSPbFE0BkyMKsVF8rkKZ1mZ0g3EU3aV6LhInAx2vK1nzrVbflDEXxvFEXA4tDLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgik76/voOCtqRSbzFuQt/kyHP2hCefa70gHloejoyc=;
 b=zWYO6CJlHoh9m6xDzO5uyhsIyFN2h/Uhl19v/4mAaiA5HlNP4C57VDQO03I3W8VKvTDZ7yFaHo0JZexkPhJxSabvEmA3T69fBSTZNm8lAItE7tr88j+3G/vXcOKS8mmRrbb79try+qmg1OwugjEbKy8+oRmNxr7GDE1DZYkmRI4ZT0q3DfnXX+hA5LqDvZjrCLm107LKqCfujdMl4IDck9+6LUrYb3ikokYtkD5wD2D5RG0G3IoeX6pSQ3YX4CYESoq9EICnTew8gK4yVBSVojmu+JNfxnE+PebCvl1kNgduK3smYFAtEnfcMXHs1b75R6XLzPofYzhMuwVlEv8CMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::13)
 by SL2P216MB2771.KORP216.PROD.OUTLOOK.COM (2603:1096:101:281::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 11:40:07 +0000
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e]) by PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:40:07 +0000
From: =?utf-8?B?7KCV7J6s7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQ?=
 =?utf-8?B?bGF0Zm9ybeqwnOuwnOyLpCBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Qi.Chen@windriver.com"
	<Qi.Chen@windriver.com>,
	=?utf-8?B?7KCV7J6s7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQ?=
 =?utf-8?B?bGF0Zm9ybeqwnOuwnOyLpCBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
Subject: Re: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Topic: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Index: AQHcmlADBFFxn9txHUSRJnN9zE6LqrV7myYAgAAFi4+AABD7gIABGLMtgAInRo0=
Date: Thu, 12 Feb 2026 11:40:06 +0000
Message-ID: 
 <PU4P216MB11332C86C65D7EC3F43516D69A60A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
References: <20260210054147.838158-1-jaeyoon.jung@lge.com>
 <9f46cb53a43c6f01135b8a8e18269e92cceb1725.camel@linuxfoundation.org>
 <PU4P216MB11330708E3BBE2CC8996C2859A62A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
 <CO6PR11MB56022C6DD92B00B1FDA3E329ED62A@CO6PR11MB5602.namprd11.prod.outlook.com>
 <18933328255FC886.653184@lists.openembedded.org>
In-Reply-To: <18933328255FC886.653184@lists.openembedded.org>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=236d897a-e22f-4a38-b3ee-6b26a7e7f387;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-02-10T09:43:53Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1133:EE_|SL2P216MB2771:EE_
x-ms-office365-filtering-correlation-id: 82aff555-2b40-4add-bac2-08de6a2b7879
x-ld-processed: 5069cde4-642a-45c0-8094-d0c2dec10be3,ExtFwd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?alBNWjZYN1ovMFNoemFWWVR6OXU5dmtyQ2puRkc2cng2UGs3RDRTTXlVUlVa?=
 =?utf-8?B?aElFQTliYlFGcVVuV2tqMjdxbU55Q2hUaTg0UXRKaVRaV20vMjBmbnMyMTZu?=
 =?utf-8?B?UjNUVSs3U1JrWDJScFZRL2VvaVlyVHl6T3BCQTkyU2NBeDFtNDA3WjdRU0ps?=
 =?utf-8?B?bCsxTGJGaDc5SU03OVZ2MkUzTXRZYlo2TVNTcU5TV0EzcC80dTYrODBxNklx?=
 =?utf-8?B?bjBidDVtQVZ2aFBIYXo2QWtWZThQMkFNUUx0b0NMVzMrbmcvSmlINzlLbWZX?=
 =?utf-8?B?NTI0MFlDakFkR3dZTU9obVAyNis2R2V2dkttelViVW1veFlINEo5RFhzNkM5?=
 =?utf-8?B?cmpPUnpwNS9RL3ZIS2RHZE1QYVJxZnhSRjB2VkNxOTBDVStGdE9IZjdqYWZl?=
 =?utf-8?B?K2tMV0ptWVQ0ditFWHhCajZZVGVSWjAvZUZIUVdodTBLNWRtbmFBbHM0ZG83?=
 =?utf-8?B?WnQrOXVZdkZqTkVmd2RNdnR6WTJXaXJ5Y3UxOWhyOFllb0h3OHZkZDgweTBZ?=
 =?utf-8?B?eStYeEE5b2JZVUc1cklRa0prR2VHQ1NmNWR2RFJzWDBpWENmUkdIQVVxbWw1?=
 =?utf-8?B?ODYwYWljc2NBRDZaSkdpZldKb2pkejJuS0tYRy9kM2FQOEMrYng3NFQyTm9r?=
 =?utf-8?B?aEc0WXdITGIrSHZneUpHLzRWUkQ2YXJ3WDRsQ3cyT2R6MkVHdU5QOVpNUFFC?=
 =?utf-8?B?SEwwQldPMExReWM1Q3pLUEw4aWdnWXlXNUw4T1NQOWpHTVVxNlF0V1Y4c0tr?=
 =?utf-8?B?aW95NXJtRjZvRXRtZ2k2MllKcFA3enZPR0F2TGFHWFlMdXZHekh3dXZXOFNS?=
 =?utf-8?B?V2dyZ1J5cUZNMGxWQjJpcHhWaUdtdmFoWHdpT1VBT2cwWm4vZGVTSllzSFRo?=
 =?utf-8?B?Vlg0QXhQQmdabngwQ3FCbFUrbHhPT1RpdkRyN3hTNjdqZm9ySmpybFpDdlFI?=
 =?utf-8?B?Y1pPdCtXK1Rudi9NMkV2REJoQmpHUkQrM3FwR2VkSDZ0bk0zNW1GYzBocm9a?=
 =?utf-8?B?Vk53SzFKcGdOc3NPMTI0RHhkbnUxUnpvL21KODJINUtHYy9rNkc5VW9oNmNm?=
 =?utf-8?B?RUJ6YXBmRU41STFjaXFaVTFBQXE5V0Z1ZU8zY2xpRmxxYTY0VTczdytkdERQ?=
 =?utf-8?B?WWpBeXEwVmlBRE4xQ1VQdWE4ZmdPOUVXbnYzOC80clJWZ3YxZlRSNTRlT0Q5?=
 =?utf-8?B?ZkFQTDJqR08vVVY0OE5vRlZjUWo2OENySzE0M2V1cy9rSGdSaWZ6OSt3Ykkr?=
 =?utf-8?B?ZGdnT3lLNkxwNlB2WGlNVm5ibHQxZXZ6UEhZemY5Y1RIR1FaQW1UM3cyQjdL?=
 =?utf-8?B?M3NQYWZ6Zi9RVGJzYmFWM2V0SnBXQmQvZTl5Z0N5dGZCZ2R5SHo3T0dobWpG?=
 =?utf-8?B?RTAzQVEvdmROOCt2bUdEVThDTlAvbEovMW12MnE4a1hlazRhek02aTVvaDhP?=
 =?utf-8?B?b3N2RVdVajB2dGw3VFRTWDVLYmZiekJKK1V0bC9kdHI4Q3RQNGZqdzI5dy9T?=
 =?utf-8?B?bkIwcTBER0s2T3JVTXc3Z2hLdFFNRk16ckJMSzRWWHQzVVk1K1BrWSs1MWRi?=
 =?utf-8?B?Sm0yWThZU3NJejZiemtCU1Q3STg5OGhKS0dCNS84VDBzb0IrSUxzZVVQRzcy?=
 =?utf-8?B?QmxSaGNRL0lFT3M0MVcweXFUc293Y3lqUk5oVlVLem00NUwxbmF2UEdsU1dt?=
 =?utf-8?B?c3U2ak9Oc3RKRGhOSUNTejRhVk5odUJPSllObE1GeXZ4bWUwU3M3ZnhpRFF5?=
 =?utf-8?B?d3hiN2JjVTMrV25wQTUxdmRpYVYzMVNnUkp3M1luUm5wTXAwOFhDdlVzVWYv?=
 =?utf-8?B?MWQ5MnB3cmx3dzN4VEluMmtKMitXZUZwSlg4SGVobWJjSjVxRXpvdy9oWlNu?=
 =?utf-8?B?Vkl6VGI4cXlVUllnVERvNDVNY2tUVjZ6SldxUFByVGQ1UEJvVFh2WlhEZUhJ?=
 =?utf-8?B?TWxhcVcwQWhWY0E4TkpLT0tlQmxWYlpmY3ZFeDVWbER0WHdHTHFNVkt6aEcr?=
 =?utf-8?B?eS9aNEEvV3M0UHVxbU5jdHQxZTMvSU1ZV25seVNkbWdIbjg2WDFybVJVSXVF?=
 =?utf-8?B?UUxFK051TDkvQU5qWnB1UEJVYXdNNG14STA4bEU0NVNqbG5DeGduQ0VGOXcx?=
 =?utf-8?B?ZXBvQStxZW9mR1h3UDdYSVNZTWE1bDFHN3BUR1ZhMzBsdENzUVlBL2p3QVFB?=
 =?utf-8?Q?H7LBj82YCxaa3myHmo4DyPM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1133.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NURBVVVzNmxtVS9UR2xqNFBDMG5GTmh1QnFiYjJ4M2tsT0g1VUc4d0J6Wmhw?=
 =?utf-8?B?cVlrQVRuWnhkcGFiN2JBL3BRemc0c2Rrdld5WmpsekdaaUlOV2lPUUJRRFNo?=
 =?utf-8?B?N1BNemdiYWVLYXZGM3pHY2VONFFNNHJBSU9ncytEZmkwa3VDdURkV3ZQM2pO?=
 =?utf-8?B?TWhmSW1lU29iclkzNkxSTkVSbFJTWURrVHRnNWE0dEFxelE4NmI4c1hEdlE2?=
 =?utf-8?B?dnhjbFYydFVlM1AwZExMRldRUzhXWkxzSG9Md1pQQVZFcjdmQVI3Nk9LWTdJ?=
 =?utf-8?B?RDE1Z204Vjd4NzgxcWNmRlBYem1QL3hUQlRTRXJja0pOQlQwdktmVm9qWTVM?=
 =?utf-8?B?NXNaRUUrMURtR0NtcXFaWThyMUpydkJIOFBHSzJXdzU4c1c5cy81YWh1RFRY?=
 =?utf-8?B?NDE1SzFWRjJZK3RLSnYrYlhzWDJGbEhqTjdnVjZrSWJEVXVqbDI0Z3dBMktP?=
 =?utf-8?B?a1JGQW1VTXc4c2QxU0p3NVM1NjRPTHhOQ2FlTlUwZEZtRjNaOVdISk5MeGNJ?=
 =?utf-8?B?SHBlVHlwRExrdVpRZytmMkhsZTFuaGlmZkxiVjBNdmR3L1BpR05aZjZWSVlr?=
 =?utf-8?B?WWZ6QjZmSWRjRGxWbjdjNExYc1Mwbnd6UTE3d2dRd1RQcWEvNEFyUjBad0E5?=
 =?utf-8?B?KzFhN3IxS3VTVktjSFQrWEI0SXVMaStLNXd3MGRlYUtCd1p1ZVNLTll3QU40?=
 =?utf-8?B?bmJVRFhrZDVtazZYZExrc2ZVSXR3eHJvb2hrYVRtY1ZObkNoSitBNUlEMDhv?=
 =?utf-8?B?SzF2VnI1QU9SRHVTaHNjQ3RVVTFCREFIMGNGY3E3YmdQaWhySmRiQVYvdTg4?=
 =?utf-8?B?a01NSzZHTnZyMTMvWnhDY3p3aDhTcGg3U0doZkdNV2JiMURDbU5EaHpNWWV5?=
 =?utf-8?B?SWV6L3RDM2krRHhzMUhhUDdhYU1BK292VGlaakRNYnFiUkVGdnExV0lpL2ww?=
 =?utf-8?B?dXVpQ212a2pLdnJNQXNaY0ozdldMWVJlY3dHVXhJaUxIZSs3KzZVMkx3cW05?=
 =?utf-8?B?eFgrOHlJbC9VT0hwa3Z1cmJDb0tTcm13dmo1WTdiRjRSTnpydW1OaVJXOWtK?=
 =?utf-8?B?ejBzaXMwRUM0aHh0WTE3VTFaOU9rUlhrSTkyK2ttUm5QOUpvZU9XbUZ2NWdD?=
 =?utf-8?B?bmRmVXdBYUNON0c3SFN5cUQrYWIzL21wamhJeW9CSGhacFFBaDNxd0E2aXdG?=
 =?utf-8?B?QXhVbm5GU3pCRlRYVllsZkRBU0JrS3c4VEZFQ1pvV1NTTkxXOVlSa29ZUWJH?=
 =?utf-8?B?VTZaalEvTzVNY0ZpMjdUSlBtanUvUVUyOHNXYVN0MWxBVHpielZhSmFtcUNG?=
 =?utf-8?B?VWNLdWdoTjRkV2VlclhNUS9jbnN6bWhNV2E5a1NpYjg1czZiMHFOWVoyYnh2?=
 =?utf-8?B?M25BbGYzeTlrZ1FVZFpqODNKTGFtUXVvYTh2SW5vMnY4UUFYSi9zd0lzN2Mr?=
 =?utf-8?B?dlZiTGNEQUNxUVdKdE9YeUdlMFhBM3UralZ2VjFkNUxKbWZud01aZHBnajBB?=
 =?utf-8?B?ckJPVnkxNjJyMzZhRkV3MlA1MzFSR3dzY1Y4UFVhT1NBQjBnTGxVR013RFhD?=
 =?utf-8?B?MUVza2dpOFloOG9JSENtVVJlNTZaMm1SRU9Ob2NxRTRmblJka25zTnZXVWhV?=
 =?utf-8?B?RWNGS1UrZ3Z5YXpvZXg5a0RPeExON0RyVXhsWWhyY2dXTWlYK0NBWTgzcGVL?=
 =?utf-8?B?T1NsVkZqdjl1VzM0UnFYK2JQZlkzc2taNmRUMmdNZVpiRlFyMTdEZ1VHcXZ6?=
 =?utf-8?B?ZlJzeEtaUDg3ckZCdnF1U2w2T2xuT1JyZzRpeC92NDRORElKVFNLcjZCYy80?=
 =?utf-8?B?TGZRZGVQY1F3MmNWSmd4KzM5ZGtOTVN6SkYxakRjRkFkZXh4bkxUekZ6ZzdK?=
 =?utf-8?B?V21tWGF0VUd2Y0hXTzhrSHRTc0k5akRHZlVBTlJNSVVxMEw5THh4ZWlhbU5X?=
 =?utf-8?B?YitOL0NBaTcxcXNHdFhzbHZkdDhadThXNEcxek1rYVNNcXBKVitiakRNQmZm?=
 =?utf-8?B?V3hGM1hYNHhxY2JENmxlZFk0ZVdydmJTc00vWEdlWW9udWx6T2xPQzZ4R0Fs?=
 =?utf-8?B?ekticU9kOS9BUVcyV29BMU5FdDVyMklZMEZCVWlwSnpZdzkyeUpJSi9ma2NG?=
 =?utf-8?B?UmY5cFJ2MU4yWm5lalJvK2lDVmJiWHJqTjlaK1JGWU5Wcit0UUJMQWJ1L0xm?=
 =?utf-8?B?M2huaFJWbnlVeks3NnVWdS9qMlVYb01Ya3NjZy9VZ0lobWY2aUpEb2p6M2NK?=
 =?utf-8?B?MUh5S0J6NzA5bEh6bFVSY085LzhHRFNodGloZWxMMURzREJJWDlZbEkrMDBM?=
 =?utf-8?B?bURpUXR2OTdydWJUcjJNMlh0UWVibXNJYzh6L05mdjRrdi9VNm1Xdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aff555-2b40-4add-bac2-08de6a2b7879
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 11:40:07.0006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJP0YyLstw6SQidud862ZWAiLNn2eyF84/0kVh8DGrFooPrwRFV3kJISwLabMf/G/znAACkCSFYY0QYn6d/T1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2771
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 11:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231025

PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJvbTrCoG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IG9uIGJlaGFsZiBvZiBKYWV5b29uIEp1bmcgKExHRSkgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGphZXlvb24uanVuZz1sZ2UuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+Cj4gU2VudDrCoFdlZG5lc2RheSwgRmVicnVhcnkgMTIsIDIwMjYgMjI6MDgK
PiBUbzrCoFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
Pjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFFpLkNoZW5Ad2luZHJpdmVyLmNvbSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPgo+IFN1YmplY3Q6wqBSZTogW09FLWNvcmVdIFtQQVRDSF0gc3lz
dGVtZDogZml4IGxpYnN5c3RlbWQgTElDRU5TRSBmb3IgbXVsdGlsaWIKPiDCoAo+ID4gRnJvbTrC
oG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IG9uIGJlaGFsZiBvZiBDaGVuIFFpIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4KPiA+IFNlbnQ6wqBUdWVzZGF5LCBGZWJydWFyeSAxMCwgMjAyNiAxODo1Mwo+ID4g
VG86wqDsoJXsnqzsnKQvVGFzayBMZWFkZXIvU1cgUGxhdGZvcm0o7JewKeyEoO2WiVBsYXRmb3Jt
6rCc67Cc7IukIExpZ2h0d2VpZ2h0IFN5c3RlbSBUYXNrIDxqYWV5b29uLmp1bmdAbGdlLmNvbT47
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4KPiA+IFN1YmplY3Q6wqBSZTogW09FLWNvcmVdIFtQQVRD
SF0gc3lzdGVtZDogZml4IGxpYnN5c3RlbWQgTElDRU5TRSBmb3IgbXVsdGlsaWIKPiA+IMKgCj4g
PiBIaSBKYWV5b29uLAo+ID4KPiA+IEkgY2hlY2tlZCB0aGUgcmVsYXRlZCBjb2RlcyB3aXRoIFBB
Q0tBR0VTX0RZTkFNSUMgaW4gbXVsdGlsaWIuYmJjbGFzcyBhbmQgcGFja2FnZS5iYmNsYXNzLgo+
ID4gSSBzdXNwZWN0IHRoYXQgaXQncyB0aGUgZG9fc3BsaXRfcGFja2FnZXMgZnVuY3Rpb24gaW4g
cGFja2FnZS5iYmNsYXNzIHRoYXQgbmVlZHMgdG8gYmUgZml4ZWQuCj4gPiBUaGlzIGZ1bmN0aW9u
IG1heSBhbHNvIG5lZWQgdG8gdXNlIHJlbmFtZV9wYWNrYWdlX3ZhcmlhYmxlcyBvbiB0aGUgZHlu
YW1pY2FsbHkgZ2VuZXJhdGVkIHBhY2thZ2VzLgo+ID4gWW91IGNhbiByZWZlciB0byB0aGUgbXVs
dGlsaWJfdmlydGNsYXNzX2hhbmRsZXJfcG9zdGtleWV4cCBmdW5jdGlvbiBpbiBtdWx0aWxpYi5i
YmNsYXNzLiBOb3RlIHRoYXQgTElDRU5TRSBpcyBhbHJlYWR5IGluICJQQUNLQUdFVkFSUyIuCj4g
PiBDb3VsZCB5b3UgcGxlYXNlIGNoZWNrIGlmIHRoZSBhYm92ZSBtZXRob2Qgd29ya3M/Cj4gPgo+
ID4gUmVnYXJkcywKPiA+IFFpCj4gPgo+IAo+IEhpIFFpLAo+IAo+IFRoYW5rIHlvdSBmb3IgeW91
ciByZXZpZXcsIGFuZCB5ZXMsIGl0IHdvcmtzIQo+IEFzIHlvdSBndWVzc2VkLCB0aGUgcGFja2Fn
ZSBpbiB0cm91YmxlICdsaWJzeXN0ZW1kJyBpcyBiZWluZyBhZGRlZCB0bwo+ICdQQUNLQUdFUycg
bGF0ZXIgaW4gZG9fc3BsaXRfcGFja2FnZXMuIENhbGxpbmcgcmVuYW1lX3BhY2thZ2VfdmFyaWFi
bGVzCj4gYWZ0ZXIgdGhhdCBmaXhlcyB0aGUgaXNzdWUuCj4gQnkgdGhlIHdheSBJIGZvdW5kIGEg
c2lkZSBlZmZlY3Qgb24gbGlicGFtIGxpa2VseSBkdWUgdG8gdGhpcyBmaXg6Cj4gfCBFUlJPUjog
bGliMzItbGlicGFtLTEuNS4zLXIwIGRvX3BhY2thZ2U6IFFBIElzc3VlOiBsaWIzMi1saWJwYW06
IEZpbGVzL2RpcmVjdG9yaWVzIHdlcmUgaW5zdGFsbGVkIGJ1dCBub3Qgc2hpcHBlZCBpbiBhbnkg
cGFja2FnZToKPiB8wqDCoCAvdXNyL2xpYi9zZWN1cml0eS9wYW1fZW52LnNvCj4gfCBQbGVhc2Ug
c2V0IEZJTEVTIHN1Y2ggdGhhdCB0aGVzZSBpdGVtcyBhcmUgcGFja2FnZWQuIEFsdGVybmF0aXZl
bHkgaWYgdGhleSBhcmUgdW5uZWVkZWQsIGF2b2lkIGluc3RhbGxpbmcgdGhlbSBvciBkZWxldGUg
dGhlbSB3aXRoaW4gZG9faW5zdGFsbC4KPiB8IGxpYjMyLWxpYnBhbTogMSBpbnN0YWxsZWQgYW5k
IG5vdCBzaGlwcGVkIGZpbGVzLiBbaW5zdGFsbGVkLXZzLXNoaXBwZWRdCj4gSSBkb24ndCBnZXQg
d2h5IGl0IGZhaWxzIGZvciBub3cuIFdpbGwgdGFrZSBhIGxvb2sgYSBiaXQgbW9yZSBhbmQgYWxz
bwo+IGNoZWNrIGlmIGl0J3MgZmluZSBpbiBvdGhlciBkb19zcGxpdF9wYWNrYWdlcyB1c2UgY2Fz
ZXMuCgpGb3VuZCB0aGF0IHRoZSBpc3N1ZSB3YXMgYmVjYXVzZSBGSUxFUyB2YXJpYWJsZSB3YXMg
YWxzbyBvdmVyd3JpdHRlbgp3aGljaCBpc24ndCBzdXBwb3NlZCB0byBiZS4gU2VudCBhIG5ldyBw
YXRjaCB0aGF0IGFkZHMgYW4gb3B0aW9uIGZvcgpyZW5hbWVfcGFja2FnZV92YXJpYWJsZXMgd2hl
dGhlciB0byBvdmVyd3JpdGUgYSB2YXJpYWJsZSBvciBub3QgYW5kCmNhbGxzIGl0IGZyb20gZG9f
c3BsaXRfcGFja2FnZXMgd2l0aCB0aGF0IG9wdGlvbiBkaXNhYmxlZC4KaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMzEwMjQKCi0tLQpK
YWV5b29uIEp1bmcKU29mdHdhcmUgUGxhdGZvcm0gTGFiLiAvIENvcnBvcmF0ZSBSJkQgLyBMRyBF
bGVjdHJvbmljcyBJbmMuCg==

