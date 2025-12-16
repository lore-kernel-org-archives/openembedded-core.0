Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E012DD5C0C1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 02:13:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12293.1765851225222736424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 18:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=azYezQMr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444510d750=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG0p4aO3869003
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 02:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jt6YDq6ptNKvEPUBJ7oshm7FpRMgqlbB1vYuJ7E6nEE=; b=
	azYezQMr8urWdxNZSX4xtr2+xO1MXEPQ3XJl2lhgOKZffVGuirYGuXcreSVS8hR4
	v0TQAGrlkz4HTdUerUTACmmzuTv4u2C5Du28fwDJbg0IIcOP9sQ/AqF0eVSrWtdS
	Qf0OsX2O5W/NRN8AIHvVx34alCdiH8wEjfmyT/rMFKR9haXYuCaRF8DPXD+x/9XH
	2doymN9onSsjkthV1a1mZwU5K3e9gd8Ml+J++yYu5AvbeWcnP+SrbLr7uvHqGA3F
	E7ocdPU8Kc2Y5YdmxBOi8QnU7arMPaWRFuJyT9yhtaAF95D9rp+W6UUvlfWyANfs
	mcNvC/yT2+B4UrxEYDk46w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y48agmr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 02:13:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEIFpXsO1kPRBGLKmsSScafhMSsdyc5kZF66k4Z9xh2/Oyo9hb5IfIboYKAXqWu+rjpCal62por3lAF5a3ZhrVW0VwSZcLLh6gehfd6pNR9Y3ZGjXSFSaHFCsLEnc2v1Om4gofpK9yzokrryc2crAHvV1tY0aYTcQjPL6GK6tILSLxJuxMTwAiwLAcfV1eZtVsOrb48+kpdo3KiHnNL4KO8c6VzfcwUaiXJiAsLm56ajuWOTjmLPEvBIC55TMnGQB4J79Hns9t5wcNQ+8+M/MTA9oJi6WoU8FrdkJ39DS4T/abYR0uRFuIS52DRJOr4eF8xMEs0q17+ZQXDYdi3NvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt6YDq6ptNKvEPUBJ7oshm7FpRMgqlbB1vYuJ7E6nEE=;
 b=GEVR4vvG4AUYRanL+MAbCXAA2pGzEfq9e7hf1rj9t+TJGl98Qphfjzc/Tnr1hkPpcAr2ro8QRkv0GLrBuNSi0H5ZLCQK/9RPJVwqiSUaCThAlz7vwfwndHljhHvs7kfYMcLCz5RP/hHEE5sWt/mj65HFGadXL0VhpfFuuRhBcnrVMaqDkF+mWEqx1OBbwg/Wi7p+OjKOEfhA6eRw3Uyqi1052bgBhSC1ljWUTP7EkJGGI1v8VJ1OKgt/pRY2D37JMmbyuYxi/MpCeFmj1mW/ra6sczdZZGnWveHOhx+ZWy+86LkZZqfdTTLTNmKQxSHYVso+wQIKFrGB3/wGflWTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:13:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:13:38 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex@linutronix.de" <alex@linutronix.de>
Subject: RE: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Topic: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Index: AQHcaqVDC78O9K4gpEq7ZPdARKjv7LUdMsDAgAZZ9dA=
Date: Tue, 16 Dec 2025 02:13:38 +0000
Message-ID: 
 <CO6PR11MB56021F91F5A05724552D07E3EDAAA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251204083208.1046464-1-Qi.Chen@windriver.com>
	 <20251204083208.1046464-2-Qi.Chen@windriver.com>
 <09078a17ec73a43bfbda989cdc9f4a2ece5d4384.camel@pbarker.dev>
 <CO6PR11MB56028B34D3F4318930C01EC0EDAEA@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB56028B34D3F4318930C01EC0EDAEA@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=d774c981-b583-40d9-a177-5f67e8755960;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-12T01:09:52Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM4PR11MB6287:EE_
x-ms-office365-filtering-correlation-id: 23bbc585-4fc6-4253-0ed3-08de3c48b9c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cFY1UVh4UDZRRlFIcGhoSmpzWGN5bC9YSWgzRlRvclQ2bTBGVXp6WHh1T3B1?=
 =?utf-8?B?K1Z2SEFIRWdsbkNSL01vaitXZDRmbDRmMWNQY3loTHdKWVNmV1JSTXJzcmx3?=
 =?utf-8?B?UXZBUWNwb0ZUa2ZOaDE4SjB6amtTVU1ITzZpbko2QmNmZ0ZpYUp0OVZVbExR?=
 =?utf-8?B?d2t0VjhRY24vOVRLOVkwNXVQN1BEOXRSaVVjZ0MxTTY5N2Q1K3UrR0gzTkx3?=
 =?utf-8?B?QjdGOHdhWTZTdCtzVnh4SHNHYk9ER0dXZFBJeXZKdXZ0NWd6aU4ycmlPUVFv?=
 =?utf-8?B?a1NmRUlEbUxIZUo4VzZPZGV5WVBJUng4RzZLMjVlZFhrbE9QZ3ZwVVl3dm1U?=
 =?utf-8?B?c1FwZk9CN0VsL1JaMkhtZHI4dlM5bEJIbGpHQUh3NlJFYzZtWVo1My9jRVUw?=
 =?utf-8?B?U1JwYUh1M2VyNGwzaWprR01McVZxa0tlV1czMFNyZFZxc1JFSGxZc1JPN3pS?=
 =?utf-8?B?RjQzTzduVkt0RFlNOHErVGZJS0dCNlhCczNnR0kyUDZoK3l5N1FHaktiU0lm?=
 =?utf-8?B?clRwa2dMcFlnZWFmbndmZUNpQVlkOFBlWnVoM3ZXclZTa2R4SUxSN3JMOG5C?=
 =?utf-8?B?YVpxUXBSUTJZKzAyUTNteThYNm55cnIyY2FXRTMyM0Y0TVFTK1VXRXlaZURD?=
 =?utf-8?B?bTNsdkVOdGVkNEVONXZDRXJCYXJPRkpla2xyS3V6eWdRY3RSSFVqRysveXR2?=
 =?utf-8?B?aURZMmpFNlc0Q1F2U3JqWGpnQlFLaDlKKzhMU3BNTHpOT0lQak5WbjdlVjdC?=
 =?utf-8?B?K1B4emVrY0JxVUtPV0U5K2NjRU9DVVBYVzFsUkFJeDBrT2JPTUZPbUcxb21v?=
 =?utf-8?B?eUZVczFtNTVyNUtZMHBucnRyMjNlNHpvcnlrRndFbTl3azRpNUVnY1Niblhm?=
 =?utf-8?B?cWJFUThxOUpIMU0rY3NuL05FVjNDbGtqaVB2S0J4YWNyK3ErTEJITi9JOUNC?=
 =?utf-8?B?djZTL0VSM21TU3NNQnQ4TThWL0hwb0xCNjBlTEQ1SG1USm9qaXZiaTNkYjVv?=
 =?utf-8?B?dnFIbnhhUDdkS3FObW9ycWphUTFZSVVIM3o2dWEya1NPRHVNb0RlanNydkVE?=
 =?utf-8?B?LzBpTGF3a2pzK0tsS0JxZUxUSEtQVWFNNGZxNmtVUXo2VlZYdGl4cUpPVk1M?=
 =?utf-8?B?bWY4WUZvS3AwVnhUNjhMaW5aNlFCdTk5c0FISlMxMEhUN0FUWkRPdGo5SDU4?=
 =?utf-8?B?aXRoUU8yYkQvbW9XWW5XREdYY2FPSVdXajdzTXRyNWVjVkYwYlBuZU5rNkgy?=
 =?utf-8?B?emZFVnNPVEt4SlFyVGp0NythWEpkS0dsVkQ3dUFZVWRCSkduUXEwQjFXbTJ6?=
 =?utf-8?B?cFJJdHIvaldDd0NUcklDRGtzc285WFU1TWdpSEJ5VGEvR1NndUx6WnNnMHRF?=
 =?utf-8?B?am5IVnplVXMyRzY1UFFXV24raldPb3g3N3Q4NlBVdWRvNDJsMXg5aDFKNGpG?=
 =?utf-8?B?cWdhSGMzQSttUVlJdk1sYVluTE94OHlTRXk0QWpMdGpic3NFSnJLc0NOR3I5?=
 =?utf-8?B?NHluTXU0NFdvb3FlQXRkUzJXNTliSlNueFRneHpHcGRKVWJ0NE1qdXV6Mi9s?=
 =?utf-8?B?V05WcDkwMjU2YStVMGRRbFlLNnYwWVc4UW8yZzhtV1d0dnRQdTEvUklGTzRB?=
 =?utf-8?B?OHBBRDJUOVVMV0Q4Rk5EWUNUS1hxNjB1NGVGRDhEVkNLN3dIa2VEK0NKV2Fr?=
 =?utf-8?B?UDdwaHpCSVk0V3RoRUdzOVpwanJycUJYQ0FLZFBPTjI2Y0h3L3I4T2Nid0Ux?=
 =?utf-8?B?UkhzNWxLcVVHZ05wT3g5N0RBV0FtYkpBWm1sWW1xUWwwbHJ6N25aV3Rub3Vt?=
 =?utf-8?B?T3VIKzg5bW82N1VFQnc3eHJlOXNvL0cxdUNtSVpJK1RZWE9lTzh1YzRrd3pG?=
 =?utf-8?B?QUI2eERCNUpIdy80L3NkWVpYNUtSaFoyVFFxSm5oTDVqUTdELzdyeFFkZWlF?=
 =?utf-8?B?MjVJRHQ5NFBNVGhRSTZJTkhlZDZmUlNQQ0JRdCs4ZDRpeE1nTjhtOTl3NDVs?=
 =?utf-8?B?TzZHQTdBSHNZczQzdmxqWGpmQnlzZGE3djMrUXlJdEJrcDZySjZKUmFaWlJB?=
 =?utf-8?Q?zYTDCA?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MStVK3hXNDd0VEwvTVhQU0JUMzUycU5DZC9HWE1JTkVnNkRiNWZ0cTZMZjRn?=
 =?utf-8?B?ZkNsMnE4TW10QWUxaHNmbFJhOTd5cHZrTmV0YVlTeWRiUFpoMnJBZVFZYS9I?=
 =?utf-8?B?S3g5SXlkSlhHRDZhUVEvVmwzMThoMHZQNnMxUXVDQ3lxd1BYNnF5SjNnTXo1?=
 =?utf-8?B?UzF5T2lRZjFPSEpjYmJvNExuQmJnMWtBOVVxdTYvK0FjMTRxRkQzdXIyOVFz?=
 =?utf-8?B?THM4b3l4dkh2SU1ZaVBLRk5UTHhlcmM5bEJBNUFzcGlFODgwTkpUOWI1MXEw?=
 =?utf-8?B?eTYyMzlVVmJRSVRzNmphaEhZQzNXVHA3RldrYmhLelZET1FHTDJvcFVVcDZU?=
 =?utf-8?B?ZGFWQnJtakFNcGtIUjlpMG9NTDlKby9RRk1JNGQ5SFE0UXliTkJYMktaTkVp?=
 =?utf-8?B?dVZ1NmtrWUF0Wi9ncEg4QllJOWI5WHBSWkxDbjA2dEREUi9JYVBROHZ3OENS?=
 =?utf-8?B?eEh4b0FEb2RaWi9ydmFmUU5MekcySWJNVkk1RXc3bkFLWlo5QjNFZlBNU1Fv?=
 =?utf-8?B?NHRhODE0aWg0Nmp4MjF1Q1J4WGRmc2tPZlk3RjRzMnMzUUltYVlUVU9EMzZW?=
 =?utf-8?B?N3pCa0RCWjRmcFNYcFlSQk9IL2d1QnRZTzlYRGRYT2xpeGs3STFjN201blg0?=
 =?utf-8?B?L3VqcS9Hcm9HQURQOERyNnVNOXY3U1VCa25INHROdXZDMlF2eGtGTElXdmVE?=
 =?utf-8?B?YWdoN1BhT1Y3VmFkVjFFUGtkY2dBQ2h0TlJjK3AxZ0dmeE0yVVZXakN5eVFj?=
 =?utf-8?B?dWQxNHJEblFZaFZqa1EwV3hRR0FnZHlWaHozQUFQTjduNkJON0tVOG5acU84?=
 =?utf-8?B?ZWVrWVJUTi9jeVdOTy9pYTJpcmxKSkhpbS82ZnBtN3YvVzhrU1Q2cmVORUpk?=
 =?utf-8?B?YXRra0ZhTlBSbFE3aitSRXVodFFndTZ3Z0RWVWFvaitWMUhZMHNJQjdrWE9M?=
 =?utf-8?B?UlNON3VpdGdPWTR0WmJySVZ3R1g4Mk5Yd1Q1N1F1QXhENVNwWHNFQTB0UWNJ?=
 =?utf-8?B?akhOcFNsVk96K25GUDdEdDlzZmxUK0krT2NGUVFIaFVISGVuellvUFZaSWhR?=
 =?utf-8?B?T0RtU2lJdkc0Z1gxc3Znc1FNNlpxTGY1WWp5SWFoM3o2d2xHVjBsMGVVUkpj?=
 =?utf-8?B?Q0xqd1B4Ym0yaHRENWxoZ1c1WGdadzhYbndOZnVMSzFFNUszWkxNRVJpbmh2?=
 =?utf-8?B?VjRnZm43dDlIaWVNOExGNXlvbXlQU0hsOGs3ZXNOTkdQV1l3Wk9xaUFOdU1S?=
 =?utf-8?B?ZFdkQVV1UHBHb01zMlNZTFJuVExGVk1iV3JDRmM4STN3NHRGYmVNK292di9T?=
 =?utf-8?B?V0x2a1lxZEl2RTJFeHZUYW5peVIzZ2hVOFlvTWp6cFBrcTUrbllwWnNsamJv?=
 =?utf-8?B?aGVya0ZhUDdzNUh0K0dNUDBzM256R3JGc25yWXpGNUN2MnVTdWtFY0NRQnhv?=
 =?utf-8?B?dlIrMkRqcWZhWnhjcER4SXVDdXFZeklYcHdBcHRZam1hRXkwdTZOZzVLSjhw?=
 =?utf-8?B?YVZkb3NMcXp1dkZqcFBvMnFqQ2cycyt2TE8vRTJtQzdmempyd3lnVmd6cHVN?=
 =?utf-8?B?OTRXdU1QTjRYSlRPZlY2UFlmdkkwUkFyKzlPNXRXR0pHRXd3VkFVeUxjZUF1?=
 =?utf-8?B?WGgvTG1qUWR3YjZ5S1FjOWEyNWI0UWUyMVdpZnN4QSt0cHc4SHY5N1ZMY05T?=
 =?utf-8?B?WmUvcHVya2puT2N6bWpOMWFIQjVQNFFzbWZFajFYaExpS3BXeFI5S1ZrZHhG?=
 =?utf-8?B?K2NTQ0ZSVy8yVllUZVJ5WUFBaHpIbGdRcC9LQ0dkdkNDN01MSXNlM0RtdjRs?=
 =?utf-8?B?QTVDbWk4MHM3VEMzeVUvSldEQUdkQkFJZmkxQ01oVkxuTEc3ZjV0NURXSkdr?=
 =?utf-8?B?K2Q5aE90RFVPNVJVNk05dXRjKzdDL3ZUY0I1cXRKei8wUk1jOS9nQ1NPWlVS?=
 =?utf-8?B?cjh4bmROb1R6RkI0eXd0bGdrKzNvQW41NXhlUEM5UGpTOXRpbGY0byt3T1Z3?=
 =?utf-8?B?SlQyTk9mTDRwNG1WSkQzZWpNeE9CajdDV0JuSmMwZk1zY00ybkgzYXl3RTVt?=
 =?utf-8?B?dUg2TzBOZzU5bEF2WXdJMEhPbVJQVU4xTEpHMWdtNmZUcE1kZldKRThOcWV4?=
 =?utf-8?Q?zAaOIjqRPqvdSw+CeTj2TKHIn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bbc585-4fc6-4253-0ed3-08de3c48b9c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 02:13:38.5213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oZQ1wIPpuc0WnYwF4ycY4/+kv6L+daiHVhHkkY0zAJXRWTA1ShHk6fAwTKDQQwGRQBSQokXYVrB1iusQIn+vFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDAxNyBTYWx0ZWRfX7NR2qVa6nB7G
 rJFhqqwZ6JD9ytNOrUYbX6ZEXfg8MUD0abDTXYC0/GxZBVS6B/FR0QVt2WG65lAhzONkUQhf/8G
 j31/pIDvG3RjCUf0FIu/z/0m9L4QG4lQBViOaFA95gMoZ2mfVHdW8kcoxxyyQcGPP3N2SUH4MII
 cuIW2ksbY3R2vgZAjRdcDkIjs9s3JIYMGrcF6YJujrRD5YIupD4EVkiD1D/TQnuH2uE05bBg+II
 y7Pi4VhLQZbiZHlWy+k4hNa3DowqghR6D6bT8FLOTMtM+8BH76x8EI2I+G7CdJmyEOLau7876bL
 3IfT2lk41O8yIaDXDohaRB9PSroQOEUoo4uSpKEPR+S7542t4dzreDaM/LrFMqj/Q0chZcHNs9f
 rVoREZEpX8DhVNDBM5W8wwZcuKjA6w==
X-Proofpoint-GUID: lz06wqjhB8knqW8LS2RQBiPxPstjyywr
X-Proofpoint-ORIG-GUID: 7P08XiCSXI7fNRLR5LKqFt47_hfT82SR
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=6940c058 cx=c_pps
 a=wqOHD3zG9oVgxNNyXktjPA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=KJzV1jCKIve_iBD84RgA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 02:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227756

UGluZw0KDQpSYW5keSB0b2xkIG1lIHRoYXQgdGhpcyBvbmUgd2FzIGhvbGQgYmVjYXVzZSB0aGUg
OmFwcGVuZCBjb25jZXJuLg0KSSB0aGluayBJJ3ZlIHN0YXRlZCB0aGUgcmVhc29uIGNsZWFybHku
DQpUaGUgZnVuY3Rpb24gaXMgbm90IGNoYW5naW5nIC9ldGMvcGFzc3dkIGFuZCAvZXRjL3NoYWRv
dy4gSXQncyBqdXN0IGNoZWNraW5nIHRoZW0gYW5kIGNoYW5naW5nIC9ldGMvaXNzdWVzLg0KDQpB
bnl3YXksIGlmIGFueW9uZSBoYXMgc29tZSBvdGhlciBhcHByb2FjaC4gUGxlYXNlIGxldCBtZSBr
bm93Lg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IENoZW4sIFFpIA0KU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMiwgMjAyNSA5OjEzIEFNDQpUbzog
J1BhdWwgQmFya2VyJyA8cGF1bEBwYmFya2VyLmRldj47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCkNjOiBhbGV4QGxpbnV0cm9uaXguZGUNClN1YmplY3Q6IFJFOiBb
T0UtY29yZV1bUEFUQ0ggVjUgMi8yXSByb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3M6IGZpeCBh
ZGRpbmcgJ25vIHBhc3N3b3JkJyBiYW5uZXINCg0KSGkgUGF1bCwNCg0KVGhlIDphcHBlbmQgaXMg
bmVjZXNzYXJ5LiBTZWUgdGhlIGNvbW1pdCBtZXNzYWdlLg0KVGhlIGZ1bmN0aW9uIG11c3QgcnVu
ICphZnRlciogdGhlIHNldF91c2VyX2dyb3VwIGZ1bmN0aW9uIGludm9rZWQgYnkgZXh0cmF1c2Vy
cy5iYmNsYXNzLg0KVGhpcyBpcyBub3QgcmVsYXRlZCB0byB6YXBfZW1wdHlfcm9vdF9wYXNzd29y
ZCBmdW5jdGlvbi4gVGhpcyBmdW5jdGlvbnMgY2hlY2tzIHRoZSBmaW5hbCBzdGF0dXMgb2Ygcm9v
dCBwYXNzd29yZCBhbmQgZG9lcyBtb2RpZmljYXRpb24gb24gL2V0Yy9pc3N1ZXMuDQoNClJlZ2Fy
ZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGF1bCBCYXJrZXIg
PHBhdWxAcGJhcmtlci5kZXY+DQpTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTEsIDIwMjUgOTo1
MSBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+OyBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogYWxleEBsaW51dHJvbml4LmRlDQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIFY1IDIvMl0gcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNs
YXNzOiBmaXggYWRkaW5nICdubyBwYXNzd29yZCcgYmFubmVyDQoNCk9uIFRodSwgMjAyNS0xMi0w
NCBhdCAwODozMiArMDAwMCwgUWkuQ2hlbkB3aW5kcml2ZXIuY29tIHdyb3RlOg0KPiBGcm9tOiBD
aGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBJdCdzIHBvc3NpYmxlIHRoYXQg
dXNlcnMgdXNlIEVYVFJBX1VTRVJTX1BBUkFNUyB0byBzZXQgcGFzc3dvcmQgZm9yIA0KPiByb290
IG9yIGV4cGxpY2l0bHkgZXhwaXJlIHJvb3QgcGFzc3dvcmQuIFNvIHdlIG5lZWQgdG8gY2hlY2sg
dGhlc2UgdHdvIA0KPiBjYXNlcyB0byBlbnN1cmUgdGhlICdubyBwYXNzd29yZCcgYmFubmVyIGlz
IG5vdCBtaXNsZWFkaW5nLg0KPiANCj4gQXMgYW4gZXhhbXBsZSwgYmVsb3cgYXJlIGNvbmZpZ3Vy
YXRpb25zIHRvIG1ha2UgYW4gaW1hZ2UgcmVxdWlyaW5nIA0KPiBzZXR0aW5nIGEgcm9vdCBwYXNz
d29yZCBvbiBmaXJzdCBib290LCBidXQgd2l0aG91dCBoYXZpbmcgdG8gZmlyc3QgDQo+IGVudGVy
IGEgc3RhdGljIGluaXRpYWwgcGFzc3dvcmQ6DQo+IA0KPiAgIEluIGNvbmYvdG9vbGNmZy5jZmc6
DQo+ICAgT0VfRlJBR01FTlRTICs9ICJkaXN0cm8vcG9reSBjb3JlL3lvY3RvL3Jvb3QtbG9naW4t
d2l0aC1lbXB0eS1wYXNzd29yZA0KPiAgIEluIGxvY2FsLmNvbmY6DQo+ICAgSU5IRVJJVCArPSAi
ZXh0cmF1c2VycyINCj4gICBFWFRSQV9VU0VSU19QQVJBTVMgKz0gIiBwYXNzd2QtZXhwaXJlIHJv
b3Q7Ig0KPiANCj4gQ2hlY2tpbmcgYW5kIGFkZGluZyBzdWNoIGEgYmFubmVyIGlzIGVuc3VyZWQg
dG8gcnVuIGFzIGxhc3Qgc3RlcHMgb2YgDQo+IFJPT1RGU19QT1NUUFJPQ0VTU19DT01NQU5ELCBy
ZWdhcmRsZXNzIG9mIElNQUdFX0ZFQVRVUkVTLiBJbiANCj4gcGFydGljdWFsciwgd2Ugd2FudCB0
byBlbnN1cmUgdGhhdCB0aGUgZnVuY3Rpb24gcnVucyBhZnRlciANCj4gc2V0X3VzZXJfZ3JvdXAg
ZnVuY3Rpb24gZnJvbSBleHRyYXVzZXJzLmJiY2xhc3MuIFNvIHVubGlrZSBvdGhlciANCj4gY29t
bWFuZHMgaW4gdGhpcyBiYmNsYXNzIHVzaW5nIHRoZSAnKz0nLCB0aGlzIGZ1bmN0aW9uIHVzZXMg
JzphcHBlbmQnLg0KPiANCj4gQmVzaWRlcywgYWRkaW5nIHN1Y2ggYmFubmVyIGlzIG9ubHkgbWVh
bmluZ2Z1bCB3aGVuIGJhc2UtcGFzc3dkIGFuZCANCj4gYmFlcy1maWxlcyBhcmUgaW5zdGFsbGVk
LiBJbiBjYXNlIG9mIGNvbnRhaW5lciBpbWFnZSwgdGhleSBtaWdodCBub3QgDQo+IGJlIGluc3Rh
bGxlZCAoZS5nLiwgY29udGFpbmVyLXRlc3QtaW1hZ2UpLiBTbyBhZGQgZXh0cmEgY2hlY2tpbmcg
Zm9yIGl0Lg0KPiBXaXRoIHRoZSBhYm92ZSBsb2dpYywgd2UgYXZvaWQgYnJlYWtpbmcgdGhlIGZv
bGxvd2luZyBvZS1zZWxmdGVzdCB0ZXN0IGNhc2U6DQo+IGNvbnRhaW5lcmltYWdlLkNvbnRhaW5l
ckltYWdlVGVzdHMudGVzdF9leHBlY3RlZF9maWxlcw0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hl
biBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy1yZWNp
cGUvcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzIHwgMTYgKysrKysrKysrKysrKy0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9yb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xh
c3MNCj4gYi9tZXRhL2NsYXNzZXMtcmVjaXBlL3Jvb3Rmcy1wb3N0Y29tbWFuZHMuYmJjbGFzcw0K
PiBpbmRleCBmNGZiYzRjNTdlLi44ZDdlNWU3NjUyIDEwMDY0NA0KPiAtLS0gYS9tZXRhL2NsYXNz
ZXMtcmVjaXBlL3Jvb3Rmcy1wb3N0Y29tbWFuZHMuYmJjbGFzcw0KPiArKysgYi9tZXRhL2NsYXNz
ZXMtcmVjaXBlL3Jvb3Rmcy1wb3N0Y29tbWFuZHMuYmJjbGFzcw0KPiBAQCAtNSw3ICs1LDcgQEAN
Cj4gICMNCj4gIA0KPiAgIyBaYXAgdGhlIHJvb3QgcGFzc3dvcmQgaWYgZW1wdHktcm9vdC1wYXNz
d29yZCBmZWF0dXJlIGlzIG5vdCBlbmFibGVkIA0KPiAtUk9PVEZTX1BPU1RQUk9DRVNTX0NPTU1B
TkQgKz0gJyR7QGJiLnV0aWxzLmNvbnRhaW5zKCJJTUFHRV9GRUFUVVJFUyIsICJlbXB0eS1yb290
LXBhc3N3b3JkIiwgImFkZF9lbXB0eV9yb290X3Bhc3N3b3JkX25vdGUiLCAiemFwX2VtcHR5X3Jv
b3RfcGFzc3dvcmQgIixkKX0nDQo+ICtST09URlNfUE9TVFBST0NFU1NfQ09NTUFORCArPSAnJHtA
YmIudXRpbHMuY29udGFpbnMoIklNQUdFX0ZFQVRVUkVTIiwgImVtcHR5LXJvb3QtcGFzc3dvcmQi
LCAiIiwgInphcF9lbXB0eV9yb290X3Bhc3N3b3JkICIsZCl9Jw0KPiAgDQo+ICAjIEFsbG93IGRy
b3BiZWFyL29wZW5zc2ggdG8gYWNjZXB0IGxvZ2lucyBmcm9tIGFjY291bnRzIHdpdGggYW4gZW1w
dHkgDQo+IHBhc3N3b3JkIHN0cmluZyBpZiBhbGxvdy1lbXB0eS1wYXNzd29yZCBpcyBlbmFibGVk
ICBST09URlNfUE9TVFBST0NFU1NfQ09NTUFORCArPSAnJHtAYmIudXRpbHMuY29udGFpbnMoIklN
QUdFX0ZFQVRVUkVTIiwgImFsbG93LWVtcHR5LXBhc3N3b3JkIiwgInNzaF9hbGxvd19lbXB0eV9w
YXNzd29yZCAiLCAiIixkKX0nDQo+IEBAIC02NCw2ICs2NCwxMCBAQCBST09URlNfUE9TVFBST0NF
U1NfQ09NTUFORCArPSAnJHtTT1JUX1BBU1NXRF9QT1NUUFJPQ0VTU19DT01NQU5EfScNCj4gICMN
Cj4gIFJPT1RGU19QT1NUUFJPQ0VTU19DT01NQU5EICs9ICdyb290ZnNfcmVwcm9kdWNpYmxlJw0K
PiAgDQo+ICsjIENoZWNrIGFuZCBhZGQgJ25vIHJvb3QgcGFzc3dvcmQnIGJhbm5lci4NCj4gKyMg
VGhpcyBuZWVkcyB0byBkb25lIGF0IHRoZSBlbmQgb2YgUk9PVEZTX1BPU1RQUk9DRVNTX0NPTU1B
TkQsIHRodXMgdXNpbmcgOmFwcGVuZC4NCj4gK1JPT1RGU19QT1NUUFJPQ0VTU19DT01NQU5EOmFw
cGVuZCA9ICIgYWRkX2VtcHR5X3Jvb3RfcGFzc3dvcmRfbm90ZSINCg0KV2Ugc2hvdWxkIHVzZSAr
PSBpbnN0ZWFkIG9mIDphcHBlbmQgaW4gYWxsIGNhc2VzIHVubGVzcyB0aGUgc2VtYW50aWNzIG9m
IGFwcGVuZCBhcmUgYWN0dWFsbHkgbmVlZGVkLiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgd2Ug
anVzdCBuZWVkIHRvIGVuc3VyZSB0aGF0IGFkZF9lbXB0eV9yb290X3Bhc3N3b3JkX25vdGUgYXBw
ZWFycyBhZnRlciB6YXBfZW1wdHlfcm9vdF9wYXNzd29yZCBpbiBST09URlNfUE9TVFBST0NFU1Nf
Q09NTUFORCwgYW5kIHdlIGRvbid0IG5lZWQgdG8gdXNlIGFwcGVuZCB0byBkbyB0aGF0Lg0KDQpJ
dCB3b3VsZCBhbHNvIGJlIGJldHRlciB0byBrZWVwIHRoZSByb290IHBhc3N3b3JkIHJlbGF0ZWQg
bW9kaWZpY2F0aW9ucyBvZiBST09URlNfUE9TVFBST0NFU1NfQ09NTUFORCB0b2dldGhlciwgc28g
cGxlYXNlIG1vdmUgdGhlc2UgbGluZXMgdXAgc28gdGhleSBhcmUgaW1tZWRpYXRlbHkgYWZ0ZXIg
dGhlIHphcF9lbXB0eV9yb290X3Bhc3N3b3JkIGNoYW5nZSBhYm92ZS4NCg0KVGhhbmtzLA0KDQot
LQ0KUGF1bCBCYXJrZXINCg0K

