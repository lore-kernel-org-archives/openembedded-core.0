Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95AFC5B572
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:17:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2119.1786760218578076810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jNHlRbHe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26879dbf27=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67F2F43M865965
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 02:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=8rSTJEHs9j23Jrj1MzWvB4iIzQKCCf//yoY3gUFMUJc=; b=
	jNHlRbHeDK1KiaSIl+u2JDBJTD8jddLPf29yvdHO6mVAJ2eyInCAdTUUWEv3Jzze
	iL0ZYAsB+1b8gL7uOwMALeIVmAbluaZExWt7n3wkmey0yq4tZfwC10K7ZK9R0U6E
	wpAb7wyOwfd8aqohrE7xc1UHRB6T2pbiinvLTnK2vjFDUO9vVqYvy8BBimWLxLt+
	mRrt4LqYEcEdfO6j+rVAmN+15+28+e+9zu/o5HB+b2wTBK2OtkZZQcQDHsa6Qf3W
	oBZ6lx0kJiTlJjVLIfCldyVCTwgzZI52f6otG0MJhLMfd/x9VkN/ll/HDoWsLJ4A
	fpBtmns5bmXwLLkMX/Yuww==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022078.outbound.protection.outlook.com [40.93.195.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2eeb813d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 15 Aug 2026 02:16:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaRUratH4fravd+FW7DNC2SktxZfwxmhWZiq/XWxfLKIpqe1FGdndSO0IKRTm4CO4mxkuqNeCHywzaTg1y6j2P7SRCRdVEmcfDYgiCmBrPbmX6h5k++wJQ/Er5esTlgWDj7UKmT/QJ5SYTJDL86dRqgZ6vdvkelExbah/bCK9aKS/X3zkQQZOzGgWGj8lrYE4hLILCkqq9J4tIlh5z2B6u0zSO3n5o/3JGJeAX3TAiHavw3ohjuh/NjGl0WAz/+0KOjEyFoFrX8tsIgHL1OyBlbGwW6is4EeD7ASXU53+t49KVoAXfbK5nG2z93gPsVIELU6eH29Sl4sxoTAlrZzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rSTJEHs9j23Jrj1MzWvB4iIzQKCCf//yoY3gUFMUJc=;
 b=aCKkZfXblUon8mbKJ2X2Swqr06z3oGfUNxpBgX11KPpGnQ+U356EXmfFDmKqcm5i+gpt7g9kpJGp7/KMEs9QQgtwfGJ3GSTfz1PO4OVj1Vycd2F8RpROKn7i9gw8cGDPr4PTZ0Lh9N2CmTicWngZgsuceCnEU0gUNr+pH1lDo7Mqkytsky8txlKk6aqCfT/Mm1cog430P1jYQkyg7B57wWnST8dBNpOU1ClJKtVet6iIgvWkQZl4tABrFdQjUjT/EYizSu2nNLxjufElw5zJUTUDHCYMOZ+FIw1d+BnvXU1IDBgxTXY6O4hETe089KOr/B/juqbwJC0X3AC5P/NTMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by MW3PR11MB4619.namprd11.prod.outlook.com
 (2603:10b6:303:5b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Sat, 15 Aug
 2026 02:16:53 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0315.014; Sat, 15 Aug 2026
 02:16:52 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH v14 00/10] rpm: 4.20.1 -> 6.0.2
Thread-Topic: [PATCH v14 00/10] rpm: 4.20.1 -> 6.0.2
Thread-Index: AQHdKrUw4GlPDWx0PUqeHLOqPf8fxLab082AgAKPDIA=
Date: Sat, 15 Aug 2026 02:16:52 +0000
Message-ID: <4ebd8940-a044-4c14-8434-960ffbb0d525@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
 <DKNRRQM7Q3FN.34QV9VN15JGBS@bootlin.com>
In-Reply-To: <DKNRRQM7Q3FN.34QV9VN15JGBS@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF5EA507B64:EE_|MW3PR11MB4619:EE_
x-ms-office365-filtering-correlation-id: 05d24fe9-7db9-4d17-0839-08defa734569
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|56012099006|38070700021|6133799003|11063799006|10067099003|5023799004|4143699003;
x-microsoft-antispam-message-info: 
 u71Ec34j5aJzUFtEXb0mPT3ytPlpICSnvGKRD5WtThI4IyOL2t8ZAQ6Thl0EB/WFjGZ/O35+zYKlyDC9+k3Hj8roUgMIkW6uzR6g9pMKPa0t5Ze52bYfU31wx+5TDoStxxM7PN9ML3rHJhIrnqbwElKtg8+k0oKgjjRgo6kjrYj0TwEcEybS/7N8jKEizsW9p1ZtsWX87x1ICPEMj/m1KHvPyA+mbfD28CxIQNERl/prPHrK4FOUdh6M72KO4KQG3SD7InJmHL1c2qyXKqJAOs7V014khpx8oeI6VCvygIPSqeuPElPgnZ0vgquL5tA96dvBT/wM9NtHaVJSQiamc1o5W166Hj1rf7AMQjpYw+DCpkO6PiqECJ+Pos6JjkXMH8J8mjt4DhKLkfhYC0BXXzMlorCmr4dPGBT20JSdeFPSl7iA8qYI2Y/a5SnYFSzTrMLC81/Vmyz88OTj8sJ5g2pqiTIaaI9g4uwHoOYsSMCd2kOM/pKWI+cienTA+wv6AQiTLj2y+r7nAGn6u6PRiVUhOOBVCMC0aak22Czddw8QJFGIC3z9e/Vbv61JgoCOQIM7qJ7wzps5rRtZEmzCvTSObmRwD9tNEaTfod075+46vfPJCUie6bCtm9ZI1MR2UeW9RgQYn1n19SIi/RFP+huEEw1Fnihzn9DKnNUP6Gc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(38070700021)(6133799003)(11063799006)(10067099003)(5023799004)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VXZiMk5BSDZqaDNXeXFlRVhoc1hvb3F6aHpsZmcvbS9takwrMUZ2QWgyWHc3?=
 =?utf-8?B?SCsxSTg5bzZVcE1MNGlkRGM3S3FRR3hsYnQ2R2J1STIrL0VwS1FzUlZZNkZy?=
 =?utf-8?B?MTB5allxV21CLzV0R0ZjeUFxeHQ1V3c5aEQ5dVVWUHdYZ0RGYWRQQnNsYXZj?=
 =?utf-8?B?c21oYnp4MzBGZDVFbTBLUDhZNGZqS1B2ZnNpbTQ2aWRQbkVvc2ZuUG93dkIy?=
 =?utf-8?B?T0UwNDIxYXRsOXVaYytESFNjc1dhUEI1a1cwMHVWVEZtMlBmT3phV1R1RWVl?=
 =?utf-8?B?WDNQWVJVUE9rV3RVTDhrVVFWazIyZmd1a1JxdWpnUmhHenpoNFpmMGl3b0dk?=
 =?utf-8?B?ZnNreUViVkg4eGNFS3FVOCt2WDlld25OSk9kTklLNE1WcExjMGdJaGE1eXVr?=
 =?utf-8?B?aWlNOUtqSXBKRjE4T3kxdng2cEpHVGlFK245MVBOSWJSUm92Rk5JRDB5allx?=
 =?utf-8?B?UlhBUHQrS1c5UE9CWEo5MmNNQkpDS0tPcXFSTEtFbXVDQlE2SldXTjFQcE1B?=
 =?utf-8?B?NENXM2FGbmF5ZlgzK1dUQ3VzTGlHU0QwdXVPeitYVk1Ja1p2ZDN6elJKMmkx?=
 =?utf-8?B?N1JxY2cxQzNacjJ4bS9VU0pnaWpGT296ekJlVWI0SXVWUFZod2xKVk1jK2w4?=
 =?utf-8?B?djdicDZVOVR2R29NaExmR2Z0YjZVV1FZNUFoS2xHQUgwSnJGbnZ1OXllOVNC?=
 =?utf-8?B?S2oyWUJHWHB3aHZEcE43cXJ3VU5ZOXVsYm9YSTNxRy9PS2FJQWVtb2l0OXR3?=
 =?utf-8?B?djJDTXFmUGJNOGx0TlJRNTEvYmtVY2NlNHNlaElTajVlemppWlhOeW8yTCtw?=
 =?utf-8?B?NzQvN2R0K0h5N2t1UVd6VTBsZVQrcldRaUtEeG5iK0YzNGRCMEZKTlNKWUxH?=
 =?utf-8?B?aEU2ekpWQUdvQ0NWbjM1eHVmUnV1dXdvZ2JoWmFnZk9sNXpKV0lveWlEY29V?=
 =?utf-8?B?M25uK0J5dHkvQXgzZTFuYmdEL1pUTVc4enZ0aEtvZkJHb1dkOXBSRm94N0Qv?=
 =?utf-8?B?NWFlUmNCRUp6M050U2c3NG5TY3dRdjJEeUczRUg3d2J2akZwcTc1cTZzcVdQ?=
 =?utf-8?B?OEFYZWc0eTZ3WG1ZYU9kRVpCbVlNRlpuYlVHRFNQQ1EreXdGOU1EOCtScVh4?=
 =?utf-8?B?UXBxSk12V2tRZDN0c09QUG5LbWRUQU9XeVVlSU11MFJTOERaWCtUV3poaGh3?=
 =?utf-8?B?VVcvbjg5TFFMZFUyY2d3czNDM3NiTUFDVlFtR1VsMDl2ZVNFeXVuQXlheDJ0?=
 =?utf-8?B?WmNnb3pMdittMHhzc1JUa3hFQXJXRm5SSjlSZ3FLOWxKYjFzeHVNVlJFajBL?=
 =?utf-8?B?UnRHNm5lN3ZIOUsyNDF1UCtBN2hhazdtZERqQlJoQml0R2J4NmUzVkNBY2J5?=
 =?utf-8?B?cXgwUzRwN1ZIdzNUbXU3WU9mQjJJNHRJb3M4cTlYMW9hTUJlSHBQWDJwVFVC?=
 =?utf-8?B?enBqTXdVa1R3V25XbFVmeCtRakRSWVZ0U1hqb1BHanFZS216cmYrNTQzaytK?=
 =?utf-8?B?RXNJSGVMT1MxejdJZjlvSk9qUHFMU3J2VlZMMG0rNGVBWDYxd2xZNlN6bUNw?=
 =?utf-8?B?RkNwTXJpUUZLeVFuVmRDM0M5WGxncEwyZGVJT1luZ05FWDBOOTU3Y09ZQkpW?=
 =?utf-8?B?c0RoQi8xeFIvNzVuWWY1NXBqTGJLZzZyR1VVTGZuNk50ZHhnSHZ4aGxHb0FG?=
 =?utf-8?B?SzB3S1dHWTFORlU2VXI1b1lWRUdYK25YQW8rNS9pRTBIZHlSN0VDZSt2RStn?=
 =?utf-8?B?YmdDZzd6VXd6TnAxL3dJV3Bvc2EzdEJoU0tCaUJUWXZ2RmMxbHpFcWFDZHVi?=
 =?utf-8?B?ckk1V2dZUmppTDZvNFluMXExZ3pzUk5XTHJoRC9lVGRET3JXcnEyRTc0d0sy?=
 =?utf-8?B?YWVRbE5iTnJFbG9tV0wzVjlPdEtra2pLWDlHMjlrVFRBdE8wNTNxQmVvYUZj?=
 =?utf-8?B?NmRlNjV0SXJGRWNZeVJMRHRQa2lTMWNHb0V4U3c5U0lXcy8zb2ZyWXVVM3RO?=
 =?utf-8?B?dTVRbG15R1R5d0FHT0FUMkxKRm5ML2VvMXZWOWd2OTVjNlBORkQ4aEV2YjdR?=
 =?utf-8?B?YmplZ1JuNFZOcU5GWHNVMVAxbkUwaTVLNDBKOWMvN2pHSzhIcmdIeW1DNkFt?=
 =?utf-8?B?MzJ0NUFRdG9IMjFsdk5ieU9qeWYzZDljMFREZGo3UFpVU3Vkb1J3RHFaeTRX?=
 =?utf-8?B?N25KMkRWZ05rbk9FWlZzOEZ4NFAxREFDZ0gySVV3L1BEU0lZcmRvT0dKZkhh?=
 =?utf-8?B?K2Q3dHpLWHA3ZklybkhUMSt3OVpqekErM3JSZXR4UUdscjFpcllQNlVaaXlB?=
 =?utf-8?B?N05BUXFEUS9vTXhTRjBTRFVMWlB3a255M2lvaE1IZkdPSHVPUEpicTBYRnFp?=
 =?utf-8?Q?GW0jY+xmR9lc5liY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <249AA989D1574A4692585CCDF70379E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	pM86PIO0XrpGstYFrxp2h3CVwc7qBJda1Nbibgy9OUnvgSqlVTsdQ/RVxbOaY1DyakjwrBmcPz+ZZpoZUW4l1AFC2S3cP2rKxoOdJr9SY950RqXe8AelwsssAsHRx1alNtVYK0vnRI28L3/xg+yDDQB1AonXjXFLKzUrSy/56mI2Ch2Euvyxx1EJZe2t0SgmFqxu4c6msetZmDLH/It9UaEL8byEu9k7OvMnFhCe9DZYzNmpacR+37qVdYX9rV58ZAbIEopmdln6XNuJn+dzyKEW6f/wtSTSBhso5YdWLeT9fSrjAav3P5K1uHd5QPdAjqXbYJ6E3srfm38rkmFbXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d24fe9-7db9-4d17-0839-08defa734569
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2026 02:16:52.5601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EjPC5OQ/l3/XHEj+hItxzkDoWhLigfCiZ5SjD9ueQEXjdYWs9FuM8568rBmjZanQAcGhGuu1NaVpOKuNsbjGv7e0jTKGskLv3ratM0TKwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: gvW6f0VFm20VqMxjY0eKVsszEFM_ANM8
X-Authority-Analysis: v=2.4 cv=DLy/JSNb c=1 sm=1 tr=0 ts=6a7fcc19 cx=c_pps
 a=yg3rYln4nUvKBXPnFt2I5w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=G5WxvRm1FtJBCCK3KiQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDAxNSBTYWx0ZWRfXx3e0D3JJWKUm
 vhQLDBM0jz2D5+VEl+Il1FOzQwEQggPK/u81LQdV49eaKShRwBg0LIZZOG+XHMDMoyYgp4SPT39
 7yJ8Mf/O/peSmJdjlQSlp3ELh+uLVl5517duSoECvsu/6cDZt2TkytGJ32tQSMAe14NpkIwjLgp
 SeAjfzxP5DvouzE6JmSjxaYbigLP2wvS6xuetbGwZtgGol2SHEpi4kCeHhyCzwdtIzn3iwbHdPR
 aOPxuP5Rcv1B17mhtYiZ+q/3LdD7TOFA7bAcsg0BuRmi00hp8Zfd1+wEwTqLzd+dym/nBZuSCwo
 jIoB4TsJuz0jZ2NhQH00056oDscEv4myR1fHBmPItkmvL5j/HDClsqBGsDOt9hyEbJ5OcnTc23u
 VvJq8bLfT5OVW56qwrHqmpw8MCveSbr6z+t60Ys3TUVBM/CB388F7uAugIk6QFusAXgsq7YgY98
 kIAU/pWL1dubQW6cjXw==
X-Proofpoint-ORIG-GUID: X_M4yJlRc5LMjDW0w4wSD0DzfwTU95lY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDAxNSBTYWx0ZWRfX4lwrWKDmJttK
 Y1O2AWFYyTUhleCNPLap07ZzlwbFvy7ZY+xjR8WASd0AS+TCr7zRSKRfXcKcFZSpP8eIhzzxOgj
 U4CJ7SWK5Syxp/Wkd4mr/K1DImU4KhpFolYIMrjwQJL7U7O/NaPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_08,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 02:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243468

T24gOC8xMy8yMDI2IDY6MTIgQU0sIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3Vu
dCENCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4g
T24gVGh1IEF1ZyAxMywgMjAyNiBhdCAxOjQ4IEFNIENFU1QsIFN1bWFudGggR2F2aW5pIHdyb3Rl
Og0KPj4gKiBWMTQ6DQo+PiAgICAgIC0gRHJvcHBlZCAicnBtOiBmaWx0ZXIgL3Vzci9iaW4vcGtn
LWNvbmZpZyBmcm9tIFJQTSBhdXRvLWdlbmVyYXRlZCBSZXF1aXJlcyINCj4+ICAgICAgKHBrZ2Nv
bmZpZ2RlcHMuc2ggcGF0Y2gpLiBQZXIgUm9zcyBCdXJ0b24ncyByZXZpZXcsIGluc3RlYWQgb2Yg
c3VwcHJlc3NpbmcNCj4+ICAgICAgdGhlIC91c3IvYmluL3BrZy1jb25maWcgZW1pc3Npb24sIGFk
ZGVkOg0KPj4gICAgICAgIFJQUk9WSURFUzoke1BOfSArPSAicGtnY29uZmlnIC91c3IvYmluL3Br
Zy1jb25maWciDQo+PiAgICAgIHRvIHRoZSBwa2djb25mIHJlY2lwZSBzbyBpdCBzYXRpc2ZpZXMg
dGhlIGF1dG8tZ2VuZXJhdGVkIFJlcXVpcmVzIHdpdGhvdXQNCj4+ICAgICAgbW9kaWZ5aW5nIHRo
ZSB1cHN0cmVhbSBycG0gc2NyaXB0Lg0KPj4NCj4+ICAgICAtIFJlbW92ZWQgL3Vzci9iaW4vcGtn
LWNvbmZpZyBmcm9tIG5hdGl2ZXNkay1zZGstcHJvdmlkZXMtZHVtbXkuYmIuDQo+PiAgICAgICBS
UE0gNidzIGludGVybmFsIGRlcGVuZGVuY3kgZ2VuZXJhdG9yIGF1dG8tZGV0ZWN0cyBmaWxlLWxl
dmVsIFByb3ZpZGVzDQo+PiAgICAgICBmcm9tIGluc3RhbGxlZCBmaWxlcywgc28gbmF0aXZlc2Rr
LXBrZ2NvbmYgYWxyZWFkeSBwcm92aWRlcw0KPj4gICAgICAgL3Vzci9iaW4vcGtnLWNvbmZpZyB2
aWEgdGhlIHdyYXBwZXIgc2NyaXB0IGl0IGluc3RhbGxzLiBLZWVwaW5nIHRoZQ0KPj4gICAgICAg
ZHVtbXkgZW50cnkgY2F1c2VkIGEgRE5GIGNvbmZsaWN0IGR1cmluZyBkb19wb3B1bGF0ZV9zZGs6
DQo+PiAgICAgICAgIG5hdGl2ZXNkay1zZGstcHJvdmlkZXMtZHVtbXkgY29uZmxpY3RzIHdpdGgg
L3Vzci9iaW4vcGtnLWNvbmZpZw0KPj4gICAgICAgICBwcm92aWRlZCBieSBuYXRpdmVzZGstcGtn
Y29uZg0KPj4NCj4+ICAgICAtIEFkZGVkICJsaWJhcmNoaXZlOiBEaXNhYmxlIFJQTSBmaWx0ZXIg
YXV0by1iaWRkaW5nIiAoMDAwNSBwYXRjaCkuDQo+PiAgICAgICBXaXRoIGJvdGggdGhlIFJQTSBm
aWx0ZXIgYW5kIFJQTSBmb3JtYXQgcmVhZGVyIHJlZ2lzdGVyZWQsIHRoZSBmaWx0ZXINCj4+ICAg
ICAgIGludGVyY2VwdGVkIFJQTSBmaWxlcyBmaXJzdCBhbmQgZmFpbGVkIHRvIHBhcnNlIFJQTSA2
IHBhY2thZ2VzDQo+PiAgICAgICAoZGVidWdpbmZvZCBzY2FubmluZyBzdGlsbCBmYWlsZWQgYWZ0
ZXIgdGhlIDAwMDQgcGF0Y2gpLiBEaXNhYmxpbmcgdGhlDQo+PiAgICAgICBmaWx0ZXIncyBhdXRv
bWF0aWMgYmlkZGluZyBsZXRzIHRoZSBmb3JtYXQgcmVhZGVyIGhhbmRsZSBSUE0gZmlsZXMsDQo+
PiAgICAgICB3aGlsZSBhcmNoaXZlX3JlYWRfYXBwZW5kX2ZpbHRlcihBUkNISVZFX0ZJTFRFUl9S
UE0pIHN0aWxsIHdvcmtzDQo+PiAgICAgICBleHBsaWNpdGx5LCBrZWVwaW5nIHRlc3RfcmVhZF9h
cHBlbmRfcnBtX2ZpbHRlciBwYXNzaW5nLg0KPj4NCj4+ICAgICAtIFVwZGF0ZWQgMDAwNC1Db252
ZXJ0LVJQTS1yZWFkZXItaW50by1hLXByb3Blci1mb3JtYXQucGF0Y2ggdG8gaW5jbHVkZQ0KPj4g
ICAgICAgdGhlIHRlc3RfcmVhZF9mb3JtYXRfaHVnZV9ycG0uYyBjaGFuZ2VzIGZyb20gdXBzdHJl
YW0gUFIgIzI4NDYuIFRoaXMNCj4+ICAgICAgIHRlc3Qgbm93IGNvcnJlY3RseSBleGVyY2lzZXMg
dGhlIGZvcm1hdCByZWFkZXIgaW5zdGVhZCBvZiB0aGUgZmlsdGVyLg0KPj4NCj4+ICAgICAtIFVw
ZGF0ZWQgcGF0Y2hlcyA3LDkgYW5kIDEwIGZvciB0aGUgbGF0ZXN0IG1hc3RlciBjaGFuZ2VzOyBu
byBjb2RlDQo+PiAgICAgICBjaGFuZ2VzOyByZW1vdmVkIHVwc3RyZWFtIG1vZGlmaWNhdGlvbnMN
Cj4+DQo+PiAgICAgVGVzdHMgdmVyaWZpZWQ6DQo+PiAgICAgICAtIG9lLXNlbGZ0ZXN0IC1yIGRl
YnVnaW5mb2QuRGVidWdpbmZvZC50ZXN0X2RlYnVnaW5mb2RfcWVtdQ0KPj4gICAgICAgLSBvZS1z
ZWxmdGVzdCAtciBkZWJ1Z2luZm9kLkRlYnVnaW5mb2QudGVzdF9kZWJ1Z2luZm9kX25hdGl2ZQ0K
Pj4gICAgICAgLSBvZS1zZWxmdGVzdCAtciBzZGsuU0RLVGVzdHMudGVzdF9zZGtfbWFuaWZlc3Rz
DQo+PiAgICAgICAtIG9lLXNlbGZ0ZXN0IC1yIHNkay5TREtUZXN0cy50ZXN0X3Nka19ydW5xZW11
DQo+PiAgICAgICAtIGJpdGJha2UgY29yZS1pbWFnZS1wdGVzdC1saWJhcmNoaXZlOmRvX3Rlc3Rp
bWFnZQ0KPj4gICAgICAgLSBiaXRiYWtlIGNvcmUtaW1hZ2Utc2F0byAtYyBwb3B1bGF0ZV9zZGsN
Cj4+ICAgICAgIC0gYml0YmFrZSBjb3JlLWltYWdlLXNhdG8tc2RrOmRvX3Jvb3Rmcw0KPj4NCj4g
DQo+IEhpIFN1bWFudGgsDQo+IA0KPiBXZSBhZ2FpbiBoYXZlIHNvbWUgcGtnY29uZmlnIGVycm9y
cy4gSSBzdXNwZWN0IGl0J3MgdGhlIHNhbWUgaXNzdWUgYXMNCj4gZm9yIHRoZSBwcmV2aW91cyBz
ZXJpZXM6IHRoZSBnZW5lcmF0ZWQgcmVjaXBlIHNpZ25hdHVyZXMgYXJlIHRoZSBzYW1lIGFzDQo+
IGJlZm9yZSwgc28gd2UgYXJlIHJlLXVzaW5nIG9sZCBkYXRhIGZyb20gdGhlIHNzdGF0ZS1jYWNo
ZS4NCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8j
L2J1aWxkZXJzLzMvYnVpbGRzLzQ0MzkNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvOC9idWlsZHMvNDQxMw0KPiANCj4gSSBhbHNvIG5v
dGUgYSBuZXcgZmFpbHVyZToNCj4gDQo+IEVycm9yOg0KPiAgIFByb2JsZW0gMTogY29uZmxpY3Rp
bmcgcmVxdWVzdHMNCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIC91c3IvYmluL3BrZy1jb25maWcg
bmVlZGVkIGJ5IGFjbC1kZXYtMi40LjAtcjAuY29ydGV4YTU3IGZyb20gb2UtcmVwbw0KPiAgIFBy
b2JsZW0gMjogY29uZmxpY3RpbmcgcmVxdWVzdHMNCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIC91
c3IvYmluL3BrZy1jb25maWcgbmVlZGVkIGJ5IGV1ZGV2LWRldi0zLjIuMTQtcjAuY29ydGV4YTU3
IGZyb20gb2UtcmVwbw0KPiAgIFByb2JsZW0gMzogY29uZmxpY3RpbmcgcmVxdWVzdHMNCj4gICAg
LSBub3RoaW5nIHByb3ZpZGVzIC91c3IvYmluL3BrZy1jb25maWcgbmVlZGVkIGJ5IGttb2QtZGV2
LTM0LjItcjAuY29ydGV4YTU3IGZyb20gb2UtcmVwbw0KPiAgIFByb2JsZW0gNDogY29uZmxpY3Rp
bmcgcmVxdWVzdHMNCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIC91c3IvYmluL3BrZy1jb25maWcg
bmVlZGVkIGJ5IGxpYnotZGV2LTEuMy4yLXIwLmNvcnRleGE1NyBmcm9tIG9lLXJlcG8NCj4gICBQ
cm9ibGVtIDU6IGNvbmZsaWN0aW5nIHJlcXVlc3RzDQo+ICAgIC0gbm90aGluZyBwcm92aWRlcyAv
dXNyL2Jpbi9wa2ctY29uZmlnIG5lZWRlZCBieSBvcGVuc3NsLWRldi0zLjUuNy1yMC5jb3J0ZXhh
NTcgZnJvbSBvZS1yZXBvDQo+ICAgUHJvYmxlbSA2OiBjb25mbGljdGluZyByZXF1ZXN0cw0KPiAg
ICAtIG5vdGhpbmcgcHJvdmlkZXMgL3Vzci9iaW4vcGtnLWNvbmZpZyBuZWVkZWQgYnkgdXRpbC1s
aW51eC1kZXYtMi40Mi4yLXIwLmNvcnRleGE1NyBmcm9tIG9lLXJlcG8NCj4gICBQcm9ibGVtIDc6
IGNvbmZsaWN0aW5nIHJlcXVlc3RzDQo+ICAgIC0gbm90aGluZyBwcm92aWRlcyAvdXNyL2Jpbi9w
a2ctY29uZmlnIG5lZWRlZCBieSB4ei1kZXYtNS44LjMtcjAuY29ydGV4YTU3IGZyb20gb2UtcmVw
bw0KPiAodHJ5IHRvIGFkZCAnLS1za2lwLWJyb2tlbicgdG8gc2tpcCB1bmluc3RhbGxhYmxlIHBh
Y2thZ2VzIG9yICctLXNldG9wdD1vcHRpb25hbF9tZXRhZGF0YV90eXBlcz1maWxlbGlzdHMnIHRv
IGxvYWQgYWRkaXRpb25hbCBmaWxlbGlzdHMgbWV0YWRhdGEpDQo+IA0KPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zNi9idWlsZHMvNDM3
MQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWls
ZGVycy82MS9idWlsZHMvNDI2OQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5v
cmcvdmFsa3lyaWUvIy9idWlsZGVycy83My9idWlsZHMvNDI4Ng0KPiBodHRwczovL2F1dG9idWls
ZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8xMTAvYnVpbGRzLzk0Mg0K
PiANCj4gQXMgdXN1YWwsIHRoZSBkZXRhaWxlZCBjb25maWd1cmF0aW9uIGNhbiBiZSBmb3VuZCBp
biB0aGUgIldyaXRlIGNvbmZpZyINCj4gc3RlcC4NCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0K
PiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KPiANCg0K
SGkgTWF0aGlldSwNCg0KTG9va3MgbGlrZSB0aGlzIGlzIGFuIHNzdGF0ZSByZXVzZSBpc3N1ZS4g
VGhlIHBrZ2NvbmZpZ2RlcHMuc2ggZml4IGlzIGluIA0KdGhlIHJwbSByZWNpcGUgKHVzZWQgYnkg
Ym90aCBycG0gYW5kIHJwbS1uYXRpdmUgdmlhIEJCQ0xBU1NFWFRFTkQpLCBhbmQNCmRvX3BhY2th
Z2Vfd3JpdGVfcnBtIGRvZXMgZGVjbGFyZSBhIHByb3BlciBkZXBlbmRlbmN5IG9uIA0KcnBtLW5h
dGl2ZTpkb19wb3B1bGF0ZV9zeXNyb290LiBEZXNwaXRlIHRoYXQsIEknbSBzZWVpbmcgdGhlIHNo
YXJlZCANCnNzdGF0ZSBjYWNoZSBhbmQgaGFzaC1lcXVpdmFsZW5jZSBzZXJ2ZXIgc2VydmUgcHJl
YnVpbHQgUlBNcyBmb3IgemxpYiwgDQpnbGliLTIuMCwgZXRjLiB0aGF0IHByZWRhdGUgdGhlIGZp
eC4NCg0KSSBjb25maXJtZWQgbG9jYWxseTogZGlzYWJsaW5nIHNzdGF0ZSBtaXJyb3JzIGFuZCBy
ZWJ1aWxkaW5nIGZyb20gDQpzY3JhdGNoIGZpeGVzIGl0LCBubyBtaXNzaW5nIHBrZ2NvbmZpZygp
IFByb3ZpZGVzIGVycm9ycy4gQ291bGQgeW91IA0KcmV0cnkgd2l0aCBzc3RhdGUgZGlzYWJsZWQg
dG8gY29uZmlybSBvbiB5b3VyIGVuZD8NCg0KVGhhbmtzLA0KLS0gDQojIFN1bWFudGggR2F2aW5p
DQojIFdpbmQgUml2ZXIgTGludXgNCg==

