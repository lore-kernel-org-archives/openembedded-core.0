Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E14BC36014
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 13:15:14 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web11.11075.1743772507613073165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 06:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=nj452vKg;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Emerson.com header.s=selector1 header.b=1sh/we3C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=3189f59213=rajendra.desai@emerson.com)
Received: from pps.filterd (m0144091.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534B6oeS026806;
	Fri, 4 Apr 2025 13:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=email; bh=2EV+BzFTxie+qGdmZ3cprzOZxnZZ
	mGYY7tuaeLlkmeA=; b=nj452vKgmb6F320uAXAfKVEp8LPP2XwEP3+jZKwNnGF4
	K8aYKm7datMrJpCBpa5t5656uxbthzMqnHshHnP6quEZ0kqyc4/SZKYXcc9N1xVY
	SNW2+i8MDor2j+2ysg1IBuKW4qZl/2EYdC1qljxGEyY4cKwRoii7sf6T1z8FxdmI
	02PYBgwrdQAln+Uu9KASQmQnIIaF+h6Pvh4ujUGtoa8HzWQ2qNBFE3G41ttnzoN9
	m8Dq5xYbxFBpCclL+WKnpOfMuu7m7FUC7Ny+RwNWiOX6D51OXUb+GY0a5WsXPxPs
	8NeCYq1kA1S+acFxxXvcTTvdJO17EwHCYHeNQXrE+w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 45te8r1sqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 13:15:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0pwstAQhpQ6Z0z8dtByqAT6A0+H4Kicv97B4o+eZQvaSm5xmQ2YKN4d+R39jiHfrvG9W+t0YCGZZirPCO1+hlKugpSAChoUfCeI7lhjNktu2AxVzaIG4H/+cTgnT4xhFjf9B4DkrxUN1MTMZp6/Bo+TixJ+4ngqqqEO8GI9NCflMP3GRYg7LqbrVnOEpHj9GXN9IN7FXpdiirRpJKFYDN8RJjrWcNO2tWz/7niZ/KDTdh7Pd/EnRvKZGUOj0FF5aKBaM8hBjHhztFemqd0dmv8bEAQVSRfNOFe53xv90LnL1+aAOkjIYzvk3rMqALM2zIKmsTPkzCo4ctekduargw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FU684hg9E1OW/GuEnFRhz4oJUEnSk7zYgtgjD6JdPqw=;
 b=s9/XbgG9OBh9hKPkL4spgxTzth/ijEyIVUZ7Q/AiOTLHZmSp2UZDz08vP/U3DoxBcnaBqED6yYE9Htiu3mqIYeHHUNlcwmz7cP7TExPjPrzV1ZgOWmugAs5WNEgmDnB9/UIKYwULoMCFB32VN6jNzvRkMiZPnLpIBaZ1zAL92ThjIIBEmCR4vMfSBUpmdsCN9aazOmsp+XDWDtj/7vfgPhGJAHI8Z0kayI8n+Q5Fb0x4CemN7//sZ1irlCoyv14XPR4Gp700jD5+CEKKn1zJ6HskCzCS16S5kQin7XDtv8JWFtioR7zhndiF0M1x1+x8tQVLj1Z3tUL4eSxrffaVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emerson.com; dmarc=pass action=none header.from=emerson.com;
 dkim=pass header.d=emerson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Emerson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FU684hg9E1OW/GuEnFRhz4oJUEnSk7zYgtgjD6JdPqw=;
 b=1sh/we3CG1fqzoeWpVkGHdZq0oiUf2tYwXdcHF0C2vSsgxh1yKSw2MlYw7EB1GQEKCHST7tlNgGBGy3E+Jq9WWes4bZzR6D6ilmmjB6Ir4g8a3A8JTtLITcrD0+ospaOlze9ckqYAhxVGzOr/rU5TJ0OLNcM0hOdPNz/XusTT1K40KWsvIjj56I4cgRV9ku985ef/ELbzNj+FRyOVPM4V6AKh+kufIh2OfD+Ull+Ou8cx0jgC6vfhBXNmD+SK/+0iyHR6bnUhu5Ca7dFL6rIaignztxYDrAbz4S+y3NJmuP0m8rpsREKdEd4Tz6VnKgvjt0IWQbxXXZ0NG66086H/g==
Received: from DS0PR10MB7954.namprd10.prod.outlook.com (2603:10b6:8:192::7) by
 CY8PR10MB7292.namprd10.prod.outlook.com (2603:10b6:930:7a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.39; Fri, 4 Apr 2025 13:15:03 +0000
Received: from DS0PR10MB7954.namprd10.prod.outlook.com
 ([fe80::cb84:403:1604:dc14]) by DS0PR10MB7954.namprd10.prod.outlook.com
 ([fe80::cb84:403:1604:dc14%6]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 13:15:03 +0000
From: "Desai, Rajendra" <rajendra.desai@emerson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data
 from perl source directory
Thread-Topic: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data
 from perl source directory
Thread-Index: AQHbnv4WDFxL0wr7B0WdCOhA2f+qI7OGwcvAgAAclGqADIEMkA==
Date: Fri, 4 Apr 2025 13:15:02 +0000
Message-ID: 
 <DS0PR10MB795478EB553410AF51CB778D89A92@DS0PR10MB7954.namprd10.prod.outlook.com>
References: <20250327060855.428041-1-rajendra.desai@emerson.com>
 <CANNYZj8ko8LF8m32CoM2fWTCryTWW_Nwya62K_dpBZqdU_WZZg@mail.gmail.com>
 <DS0PR10MB79549ADC3C849A2D68F00BDB89A12@DS0PR10MB7954.namprd10.prod.outlook.com>
 <1830A652FEC6E4D0.25981@lists.openembedded.org>
 <CANNYZj_xbcvc1VgXe96zYhRj7AvOpou6x4oEHUE+M_Kvhu+8SQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_xbcvc1VgXe96zYhRj7AvOpou6x4oEHUE+M_Kvhu+8SQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_ActionId=16272959-9719-46f9-b266-5023206ea390;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_ContentBits=0;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Enabled=true;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Method=Standard;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Name=Internal
 - No
 Label;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SetDate=2025-04-04T10:45:37Z;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SiteId=eb06985d-06ca-4a17-81da-629ab99f6505;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR10MB7954:EE_|CY8PR10MB7292:EE_
x-ms-office365-filtering-correlation-id: d4408ab5-42d1-4a7a-10d0-08dd737ab5f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|4022899009|8096899003|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OXBJQnN1aFNEd2lLcDFIVDhBSkR0aFNmNkx0d1IzT3kvMHhoYU10Zjk4QWhB?=
 =?utf-8?B?ZWZ6WEZSTjRYUFZnMmJEOTI4Rkh4ZUo5T0FyWHlhSEFUU25kQUEzd3crTWFN?=
 =?utf-8?B?TzhFZU53VHR2VnBYKzBucWVBcmNHOEdtbjM2WS9nYlkwY3llZFpZaXA0bi9i?=
 =?utf-8?B?Rm83RC9CbjdhcVNNT00rbFRBa1lGY01tRHB6dGNtTlpnMG9Vck9GUE1zSk1C?=
 =?utf-8?B?UnhmZXhmZHhVYmQwcDJ2RG1CNVAxT1poenUrb0JQdkR2anc2NndxcWg3eWd2?=
 =?utf-8?B?M0g5eHplQVl0U3pWUXYzYVQvZ3J4YTA2amIzQ0hUTnRhU00vQU9wcHNubzZV?=
 =?utf-8?B?UnFZdmRHN2ZoanNsV0plNUtvVWtXME1kaVJUNkd0b21NR0pxb0I5VGR5Vzg3?=
 =?utf-8?B?dHRKYkNVRkR5ODVFWEx4ZWRleEJnVkdJd2UrbFVJdS9heTdkcGRFNTJhZG5U?=
 =?utf-8?B?ZEV1M3psWTJmaGxkdHorVDR4b0N4SzhOT3h0UXhidmozSmhUN0l2T1JLbWRw?=
 =?utf-8?B?NlZ6Y3l5TFdTZDVKd3QvbDNFcGJaa1IrOGhpZmNCVWY4aXlKMDR3RTR0ZHFT?=
 =?utf-8?B?SGVHbG14cGp4VVVja0tRS2VvQUsrcjl1eWQ1cEJSUzQyT2k5M0huZEtMdUpF?=
 =?utf-8?B?WXBuNVkyRzdTS0VNZUVPd3pLMWZEK2M3Z1hvOVVab3JvWXNwd05MZXltZWRq?=
 =?utf-8?B?N1QwKy9sLzMvNUh4M2VOeHFDcnFpMzdET3lZc1ljZ2UxTGRNVktvLzhreVNH?=
 =?utf-8?B?ckE5NmVXQzZ4WG4rc2VEMDZxYk5QTmdhQlgzSjhMbkxianFqSFQ1RkNaYVZu?=
 =?utf-8?B?c1FvanFNeGhmZktSdDRKSkg5bXZyWkFPZU5YVmVGdk84MzRRTEp1WlhRWGY4?=
 =?utf-8?B?L1J3c2VyOGVpQzNsVWlLcVpRb2FCVlBQeWJrNjJJTUljVWhLTlc5T09xNzgv?=
 =?utf-8?B?cE40cUxVSVBwOTZTdHcxOUE1VnJqTU5KSnlkV0RQSEtXeFhFcmpYdytrOG5L?=
 =?utf-8?B?b2pMRU1JU1haMGUwWUJydXJ2TkpzbG1DTnN5dE9LQzBSdkozTnBESFowajR2?=
 =?utf-8?B?QlM1cmNnV2RwZTdwT2cwelFLZWxPbEd2RjlxZzEwdUNxWmMrbGZZdGZ4WnhV?=
 =?utf-8?B?bE1ENFF6VjRndE15ZjlKblo3ekZrVEZtTlhZeUdmQ2xhYVBpTUtzZUlhbE9J?=
 =?utf-8?B?amQrVjIxd2ZjQ0dzZlltL3FCbGx5NktaMXZmUnB3UEIrdnVWejNOakxYSkx1?=
 =?utf-8?B?UHhnUlhTSHU3NHpuYzJJcEVONVQ2QmlJeHpLK2pEMXBlTnJBZi82ODR3dGI4?=
 =?utf-8?B?YWRJQWNrMnA3bWRoOTIxSVU5ODVDYU9YVW9iMk1kZjFTd1JzWG9BR0J1WEdv?=
 =?utf-8?B?T0VIdk9EOFZqTStDT2N0akwrUTBjdHJwazVwRGZCMjJCZ2d6MlBvbTZCY2VU?=
 =?utf-8?B?RWxpZ1Nqd2FjZnFObStFdkdXUFpBK1U1RjBLYnp3YjN2aURyN1JFbEc2S3Jo?=
 =?utf-8?B?aUFVQkVwWXVvUWxvRVJwM2Iya1ByU2tuUEpQbWRxMU1LSldtUUhLQ1N5RWpW?=
 =?utf-8?B?QXE1WktlVjFsVFBmeGY3c3JuQ3k1VUluSThHVmVsWlU5SHF4R0lyQ1JzZDRF?=
 =?utf-8?B?RU0ybDY2OWZpY0tKaGlhcUFmWHJuQ2IweEtoejBnNTR5czBJbm0rcEhJdDJh?=
 =?utf-8?B?VDY2L3BSL1dTN3FHbVEveWdOVGRrNjdVMjZLUlpFMWdOdjNiTG8rWDFBeldC?=
 =?utf-8?B?WU0ra2pERGxxWDZCSHB5cnF5L242U0dFcnl0VVpPbFlQZXNjQzdLdnpGNTgv?=
 =?utf-8?B?clVHTXJubjR2WktEMURzdnRnMGNvT0xZNkZSSmxNcUFLQlAyWkFacXJJWjhx?=
 =?utf-8?B?a1pUcS9QUjdxWnBKaGpyY004T1NIS1BmU2Ixb1VlUmhuR1daWjVGcjMyeGEw?=
 =?utf-8?Q?AfNJ/8/U59k=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7954.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(4022899009)(8096899003)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZGxiK2J5a3NjOFJDdTdwcTkwN3VTNDN5ZytJSkVqMGJ2Q29IcTgvYjZxU1lE?=
 =?utf-8?B?NnFNbVg2eU5GU3YyS0dESWFydW1lMnNQSW5TblVQcUZXRFBkd3lEUlYrRW9s?=
 =?utf-8?B?dmIyTWhkZ0pDSXVtSTBxdHozdzFVSVhpUkZrdzY2dEVieWRGWk91c1hGSWVm?=
 =?utf-8?B?Y2lyM3NKbE01bm44Y0JQQ2pJdmxGSDlMcStmbzlLcFRUTVRJVFpyUlZKTlF6?=
 =?utf-8?B?QUVtbjB1bDZZVWxYTHBUR0NIblp4aHp0bFhKNVVyM056OTdhQitrc1VYUzJ3?=
 =?utf-8?B?QkVYYTB6S29pc2pyNGh2TEVVVnF4cFh2VHZmTStUaGpyUUliUzI5VlNPMm15?=
 =?utf-8?B?Y0ZNLzlCV2M3dzRTaHhqV2IwY0lGaHBmV1pMV2NwTzMvR3dWUlZBVUphVmkz?=
 =?utf-8?B?dkFvTE1hU0FETXJudjVqMFJVNk5MMmFtaXdBM2RaczJ2WmNXdUIwK2xLbEU3?=
 =?utf-8?B?Rm1uZzZoY1ZwQS92SWxoWG1RTWtLMWxic3BjZ2MrVW0ydHhjRXRydGxUTXlP?=
 =?utf-8?B?THJiS0ZtL2xjaGIvQU9tWXU5YkZMRjNyQlZ1SnpVRHBJdzBZWXM1U2txcUJr?=
 =?utf-8?B?SnpIeVBJWGR4dzQzeS96Z1Yzd25abjBNdGpyWlVMTjQzTlAwQ1dJQTVYY3h2?=
 =?utf-8?B?Y3NCMlF1K29ycjZkZ0lqdUNhS3ltYVY4ZDBxU1lwNkRwNElFNjd2TGhTcGYv?=
 =?utf-8?B?SUxMaTdod1Zia3BJQUJXdDhmcGY2dDhHZjhRNHhwY0V6WjVUWGJGNVhUNzBK?=
 =?utf-8?B?ZW56dGdYUzRLOXhJQ1Z6Z3U1OVJOTkFzRkQ2L3NBYnFnNmU0b3cyOHM5c0Jt?=
 =?utf-8?B?NlBFRmJjN0pUWFc1cHV4SVJLbUtyd01lT2xFSXlUZ2xvUEVyZWxVbjZXUWoz?=
 =?utf-8?B?b0srSHhhY1ZlOXQ4NzZ5ZXNBY2RHdGpTSzdLS2JrOStXNENQcUNvL0F0cVJR?=
 =?utf-8?B?cnBuK3VrUGtPRUwxR0VqT01NcmY3VVV2Q0ZDY3pWNlIvOExPbWlzQVh2bTRM?=
 =?utf-8?B?MHdmaU00QUMyY0FDNlVGRUkrUS9IcXlkemh5KyszRFIvZ1lYaS9KNkIya3Vw?=
 =?utf-8?B?ditwcXVNT1VPU1FmL2IycTVkNXYvVWhwdWFBOW5xREZ2UjdsTWJFVnhOVlRX?=
 =?utf-8?B?SUNmWGZscTZxM01sRXNqZGEyRy95S1FtVlVvNFB5ZDNvN2gySGJRT043QzBU?=
 =?utf-8?B?d1pnUjRHVnpUNWRIYUdqb1RjZ1hCQUJza3MyZFpSNzRJNzNhMXUyMVpmSzBT?=
 =?utf-8?B?WHpZcDdlcy9xQy9tNUR5MCs1L3NNcUVtVlVubDVrczdMV1RwQzF4OHM3U3pS?=
 =?utf-8?B?Ny9yR3V5Y294RWgxNTNMM0sveU1rWVY4bU1EbmU1RE9tcmprZ25sOEhnUm5m?=
 =?utf-8?B?VTEwd0lnaU16VDkzVjAxbWVyQ2IrWlpXYUlieUUzNVRCd2ZsNlZLb2FYdFdK?=
 =?utf-8?B?OGoza1YyTDZUNm1GbU9DcXJwRHlNRXp6M0ZwNzZlaTZoMVF4cVNFWHgwSk1u?=
 =?utf-8?B?YWNJWitpS3NsVEMwMk51cHgvbkg5YzZTd1V1aUlWdnpFVU4vUDhTWEU1SWdF?=
 =?utf-8?B?OXNPUUpnVnFVc2RBS3VnaHQ0VTY4bGFLWGVzMk45cHJxQU9CcklEd09zV05o?=
 =?utf-8?B?K3pJVERPd1B6VWwxYmkzRFlBVHdYR2xoQUFVY1VQVlJGYmFCekpxK3ArbGpO?=
 =?utf-8?B?MzZ2RG83K3lyUVkrYlRPZ0FUcHNVRkpYdGhONW5GSEN3eXEwK2Z6SnNoN3hJ?=
 =?utf-8?B?NDU3NmdBbld3cXBtYVFMV2RxYVBENkpzcFkvSitVZVY3LzRwN0MrUkVPcHlV?=
 =?utf-8?B?cmNNMjBBdi9CcnpuSjFCK290VW5Lbm03WFNmTUxDSHBTbytTOE5MeDNXRURl?=
 =?utf-8?B?MlhEdEZYNzlkaVlXS3NKMDFJdFpEcTRtLzJWSWxiYUVEZDdGclUwOEF4M1lM?=
 =?utf-8?B?bHc4TkF6Wms2NE4yZW1PYnorRlhUMU9FQ040OGN2V2FuOWFFOVZzZ0g2SXp3?=
 =?utf-8?B?Uzd5L0grTHBSVlhwUG8xSi9rZTNKTi9tSmd1Q01FNXNNU1F6QWZHeXRTYXB3?=
 =?utf-8?B?WnpEUlRjSW9XK2YzaXFITmk4bStWaVRCWTk1Q3Rxb1g5ZDd2NWphUC9GMzMy?=
 =?utf-8?B?ajJOOE9mVXNOMDQ1SXRDTmdnSHpxMjFrNHBMb2FXQVBReVpnOG00aE5ST2dW?=
 =?utf-8?Q?BEpks4IT8HHBuTO/p+jK+KZsAt1HiNaTaGQBnrFZ0f0X?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR10MB795478EB553410AF51CB778D89A92DS0PR10MB7954namp_"
MIME-Version: 1.0
X-OriginatorOrg: Emerson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7954.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4408ab5-42d1-4a7a-10d0-08dd737ab5f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 13:15:02.9914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb06985d-06ca-4a17-81da-629ab99f6505
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQULpdNG+sXFYk5A/MIjmKA3aj96AaS/aL0sdTr/VTChwqSorwWcq41eAwG8HZPapFc1Xz+hFQ1eT8188BBZdasqkAz9vI0NBFK44QjV46o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7292
X-Proofpoint-GUID: CEM1RwPZXeu3jKX3Ia58XTqZmhvmqpqu
X-Proofpoint-ORIG-GUID: CEM1RwPZXeu3jKX3Ia58XTqZmhvmqpqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504040092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 13:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214347

--_000_DS0PR10MB795478EB553410AF51CB778D89A92DS0PR10MB7954namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex, apologies for the late response.

The image that I built which had the reproducible issue (missing header iss=
ue) was core-image-full-cmdline.

I am curious to know why is it important to only use core-image-ptest-perl =
and not any other images?
I tried with core-image-ptest-perl and saw similar compiler issues that you=
 mentioned.
Also, I am not completely sure how core-image-ptest-perl image is different=
 from core-image-full-cmdline in terms
of building perl/perl-ptest recipe and why are we observing different issue=
s between the two mentioned images.

From what I see, the image core-image-ptest-perl does not include x86_64-po=
ky-linux-gcc
compiler unlike the full image that has the compiler installed. Maybe that=
=E2=80=99s the reason we are seeing
Can't exec "x86_64-poky-linux-gcc": No such file or directory issues while =
running those tests
(as they are XS based tests that require a compiler)?

The patch I created mainly applies to the current scenario where the oe-cor=
e still uses cross compile patches
(that are applied as a part of perl-cross recipe) while building perl, wher=
eas the upstream perl is no more using this
approach of setting the flag (USE_CROSS_COMPILE). But in our case, we might=
 still need to depend on build host
specific data due to the use of perl-cross.

This is what the xconfig.patch in perl-cross says:
perl-cross assumes the sources use xconfig.h with -DUSE_CROSS_COMPILE
With perl 5.20.0, it's no longer true. Regardless of what mainline perl
uses, let's stick with the old xconfig.h way for now.
And we are still using this patch in the recipe in oe-core.


For your other question : are you using plain poky with no other layers?

I tried 2 different approaches:

1.       Plain poky with only oe-core enabled (core-image-full-cmdline)

2.       Full image with other layers enabled

In both these cases, I saw xconfig.h file missing error for those tests.



Regards,

Rajendra

From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, March 27, 2025 5:18 PM
To: alex.kanavin@gmail.com
Cc: Desai, Rajendra <rajendra.desai@emerson.com>; openembedded-core@lists.o=
penembedded.org
Subject: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data fro=
m perl source directory




Oh, one more detail, and it's important: which image are you using?

The correct one is core-image-ptest-perl.



Alex



On Thu, 27 Mar 2025 at 12:45, Alexander Kanavin via

lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org<mai=
lto:alex.kanavin=3Dgmail.com@lists.openembedded.org>>

wrote:

>

> I just run perl's run ptest on poky master to observe what is happening, =
and:

>

> - the tests are not actually erroring out, some of them pass, some of

> them are skipped

> - the reported problem is not a missing header, but a missing gcc

> compiler (which is hardcoded somewhere to oe-core's build environment,

> not the target environment).

>

> Can't exec "x86_64-poky-linux-gcc": No such file or directory at

> /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Bas=
e.pm

> line 362.

> PASS: dist/ExtUtils-ParseXS/t/001-basic

> Can't exec "x86_64-poky-linux-gcc": No such file or directory at

> /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Bas=
e.pm

> line 362.

> PASS: dist/ExtUtils-ParseXS/t/002-more

> Can't exec "x86_64-poky-linux-gcc": No such file or directory at

> /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Bas=
e.pm

> line 362.

> PASS: dist/ExtUtils-ParseXS/t/003-usage

>

> - additionally:

> SKIP: cpan/ExtUtils-Constant/t/Constant

> SKIP: cpan/ExtUtils-MakeMaker/t/02-xsdynamic

>

> I'm not sure why you are seeing something different (are you using

> plain poky with no other layers?), but any fixes must first address

> the issues observed on the standard ptest build performed in yocto CI,

> which is the one above. Then we can get to the issue of missing

> header, if it's uncovered.

>

> Alex

> On Thu, 27 Mar 2025 at 11:51, Desai, Rajendra

> <rajendra.desai@emerson.com<mailto:rajendra.desai@emerson.com>> wrote:

> > Ran the ptests (run-ptest) on the built qemux86-64 image

> > 5 of the mentioned tests failed with =E2=80=9CNo such file or directory=
=E2=80=9D error

> > (for which, I have explained the details in the patch)

>

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

> Links: You receive all messages sent to this group.

> View/Reply Online (#213726): https://urldefense.com/v3/__https://lists.op=
enembedded.org/g/openembedded-core/message/213726__;!!OkyjEqkqqe9UhNQ!yJkK5=
dQ3qt0Ghtd1jhFhcYBApNsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP=
_sD6dkDt1Q$<https://urldefense.com/v3/__https:/lists.openembedded.org/g/ope=
nembedded-core/message/213726__;!!OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBAp=
NsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_sD6dkDt1Q$>

> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.o=
rg/mt/111899754/1686489__;!!OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBApNsQEnH=
VVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_sBX5gBO2w$<https://urldef=
ense.com/v3/__https:/lists.openembedded.org/mt/111899754/1686489__;!!OkyjEq=
kqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBApNsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygK=
TvK8VPiTD-xtMEP_sBX5gBO2w$>

> Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openem=
bedded-core+owner@lists.openembedded.org>

> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g=
/openembedded-core/unsub__;!!OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBApNsQEn=
HVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_sCleMas7g$<https://urlde=
fense.com/v3/__https:/lists.openembedded.org/g/openembedded-core/unsub__;!!=
OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBApNsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhh=
Pe_ygKTvK8VPiTD-xtMEP_sCleMas7g$> [alex.kanavin@gmail.com]

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

>

--_000_DS0PR10MB795478EB553410AF51CB778D89A92DS0PR10MB7954namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1033309491;
	mso-list-type:hybrid;
	mso-list-template-ids:-1602471038 887145144 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:11.0pt;
	font-family:"Times New Roman",serif;
	mso-ascii-font-family:Aptos;
	mso-hansi-font-family:Aptos;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1738437426;
	mso-list-type:hybrid;
	mso-list-template-ids:1306534664 131228842 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-fareast-font-family:Aptos;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:=EF=82=A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Alex, apologies =
for the late response.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The image that I bu=
ilt which had the reproducible issue (missing header issue) was core-image-=
full-cmdline.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I am curious to kno=
w why is it important to only use core-image-ptest-perl and not any other i=
mages?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I tried with core-i=
mage-ptest-perl and saw similar compiler issues that you mentioned.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Also, I am not comp=
letely sure how core-image-ptest-perl image is different from core-image-fu=
ll-cmdline in terms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">of building perl/pe=
rl-ptest recipe and why are we observing different issues between the two m=
entioned images.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">From what I see, th=
e image core-image-ptest-perl does not include x86_64-poky-linux-gcc
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">compiler unlike the=
 full image that has the compiler installed. Maybe that=E2=80=99s the reaso=
n we are seeing<o:p></o:p></span></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">Can't exec &quot=
;x86_64-poky-linux-gcc&quot;: No such file or directory</span></i><span sty=
le=3D"font-size:11.0pt"> issues while running those tests<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(as they are XS bas=
ed tests that require a compiler)?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The patch I created=
 mainly applies to the current scenario where the oe-core still uses cross =
compile patches<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(that are applied a=
s a part of perl-cross recipe) while building perl, whereas the upstream pe=
rl is no more using this<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">approach of setting=
 the flag (USE_CROSS_COMPILE). But in our case, we might still need to depe=
nd on build host<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">specific data due t=
o the use of perl-cross.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is what the xc=
onfig.patch in perl-cross says:<br>
<i>perl-cross assumes the sources use xconfig.h with -DUSE_CROSS_COMPILE<o:=
p></o:p></i></span></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">With perl 5.20.0=
, it's no longer true. Regardless of what mainline perl<o:p></o:p></span></=
i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:11.0pt">uses, let's stic=
k with the old xconfig.h way for now.<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">And we are still us=
ing this patch in the recipe in oe-core.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<pre><span style=3D"font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-ser=
if">For your other question : <i>are you using plain poky with no other lay=
ers?<o:p></o:p></i></span></pre>
<pre><span style=3D"font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-ser=
if">I tried 2 different approaches:<o:p></o:p></span></pre>
<pre style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2">=
<![if !supportLists]><span style=3D"font-size:11.0pt;font-family:&quot;Apto=
s&quot;,sans-serif"><span style=3D"mso-list:Ignore">1.<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </sp=
an></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:&quo=
t;Aptos&quot;,sans-serif">Plain poky with only oe-core enabled (core-image-=
full-cmdline)</span><span style=3D"font-size:12.0pt;font-family:&quot;Arial=
&quot;,sans-serif"><o:p></o:p></span></pre>
<pre style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2">=
<![if !supportLists]><span style=3D"font-size:11.0pt;font-family:&quot;Apto=
s&quot;,sans-serif"><span style=3D"mso-list:Ignore">2.<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </sp=
an></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:&quo=
t;Aptos&quot;,sans-serif">Full image with other layers enabled</span><span =
style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></=
o:p></span></pre>
<pre><span style=3D"font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-ser=
if">In both these cases, I saw xconfig.h file missing error for those tests=
.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-ser=
if">Regards,<o:p></o:p></span></pre>
<pre><span style=3D"font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-ser=
if">Rajendra</span><span style=3D"font-size:12.0pt;font-family:&quot;Arial&=
quot;,sans-serif"><o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Alexander Kanavin &lt;alex.kan=
avin@gmail.com&gt;
<br>
<b>Sent:</b> Thursday, March 27, 2025 5:18 PM<br>
<b>To:</b> alex.kanavin@gmail.com<br>
<b>Cc:</b> Desai, Rajendra &lt;rajendra.desai@emerson.com&gt;; openembedded=
-core@lists.openembedded.org<br>
<b>Subject:</b> [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig d=
ata from perl source directory<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white"><o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;color:white"><o:p></o:p></span></p>
</div>
<pre style=3D"white-space:pre-wrap"><span style=3D"font-size:12.0pt;font-fa=
mily:&quot;Arial&quot;,sans-serif">Oh, one more detail, and it's important:=
 which image are you using?<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">The correct one is core-image-ptest-perl.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">Alex<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">On Thu, 27 Mar 2025 at 12:45, Alexander Kanavin via<o:p></o:p></span></=
pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">lists.openembedded.org &lt;<a href=3D"mailto:alex.kanavin=3Dgmail.com@l=
ists.openembedded.org">alex.kanavin=3Dgmail.com@lists.openembedded.org</a>&=
gt;<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">wrote:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; I just run perl's run ptest on poky master to observe what is happ=
ening, and:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; - the tests are not actually erroring out, some of them pass, some=
 of<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; them are skipped<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; - the reported problem is not a missing header, but a missing gcc<=
o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; compiler (which is hardcoded somewhere to oe-core's build environm=
ent,<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; not the target environment).<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Can't exec &quot;x86_64-poky-linux-gcc&quot;: No such file or dire=
ctory at<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuil=
der/Base.pm<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; line 362.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; PASS: dist/ExtUtils-ParseXS/t/001-basic<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Can't exec &quot;x86_64-poky-linux-gcc&quot;: No such file or dire=
ctory at<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuil=
der/Base.pm<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; line 362.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; PASS: dist/ExtUtils-ParseXS/t/002-more<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Can't exec &quot;x86_64-poky-linux-gcc&quot;: No such file or dire=
ctory at<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuil=
der/Base.pm<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; line 362.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; PASS: dist/ExtUtils-ParseXS/t/003-usage<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; - additionally:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; SKIP: cpan/ExtUtils-Constant/t/Constant<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; SKIP: cpan/ExtUtils-MakeMaker/t/02-xsdynamic<o:p></o:p></span></pr=
e>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; I'm not sure why you are seeing something different (are you using=
<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; plain poky with no other layers?), but any fixes must first addres=
s<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; the issues observed on the standard ptest build performed in yocto=
 CI,<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; which is the one above. Then we can get to the issue of missing<o:=
p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; header, if it's uncovered.<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Alex<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; On Thu, 27 Mar 2025 at 11:51, Desai, Rajendra<o:p></o:p></span></p=
re>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; &lt;<a href=3D"mailto:rajendra.desai@emerson.com">rajendra.desai@e=
merson.com</a>&gt; wrote:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; &gt; Ran the ptests (run-ptest) on the built qemux86-64 image<o:p>=
</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; &gt; 5 of the mentioned tests failed with =E2=80=9CNo such file or=
 directory=E2=80=9D error<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; &gt; (for which, I have explained the details in the patch)<o:p></=
o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></span></p=
re>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Links: You receive all messages sent to this group.<o:p></o:p></sp=
an></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; View/Reply Online (#213726): <a href=3D"https://urldefense.com/v3/=
__https:/lists.openembedded.org/g/openembedded-core/message/213726__;!!Okyj=
Eqkqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBApNsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_y=
gKTvK8VPiTD-xtMEP_sD6dkDt1Q$">https://urldefense.com/v3/__https://lists.ope=
nembedded.org/g/openembedded-core/message/213726__;!!OkyjEqkqqe9UhNQ!yJkK5d=
Q3qt0Ghtd1jhFhcYBApNsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_=
sD6dkDt1Q$</a><o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lis=
ts.openembedded.org/mt/111899754/1686489__;!!OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Ght=
d1jhFhcYBApNsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_sBX5gBO2=
w$">https://urldefense.com/v3/__https://lists.openembedded.org/mt/111899754=
/1686489__;!!OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBApNsQEnHVVEHn29p8B_HIA7=
Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_sBX5gBO2w$</a><o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.opene=
mbedded.org">openembedded-core+owner@lists.openembedded.org</a><o:p></o:p><=
/span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.o=
penembedded.org/g/openembedded-core/unsub__;!!OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Gh=
td1jhFhcYBApNsQEnHVVEHn29p8B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_sCleMas=
7g$">https://urldefense.com/v3/__https://lists.openembedded.org/g/openembed=
ded-core/unsub__;!!OkyjEqkqqe9UhNQ!yJkK5dQ3qt0Ghtd1jhFhcYBApNsQEnHVVEHn29p8=
B_HIA7Iuv7WX_WgQKhhPe_ygKTvK8VPiTD-xtMEP_sCleMas7g$</a> [alex.kanavin@gmail=
.com]<o:p></o:p></span></pre>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></span></p=
re>
<pre><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-ser=
if">&gt;<o:p>&nbsp;</o:p></span></pre>
</div>
</body>
</html>

--_000_DS0PR10MB795478EB553410AF51CB778D89A92DS0PR10MB7954namp_--

