Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB77FD065C
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:42:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16330.1773218563643333540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pFvHPVgq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530cedf69=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B56FUD2900142
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 01:42:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gGSqmuz+5bPrWIiqmrc/3yD/hFgMNLaADvgjqM113Lw=; b=
	pFvHPVgqJDRd0YM0fpkbQQ95KiiV+p3R1RYcCMsTbAE2xTw2/mGJNfcJr7EkjcQ7
	RpR2+9Z33BTEIfCdZ4MbnvlD5G2wBiYjTS+niGQxW348lFEZ8VLLoDBlrjKQHegR
	Deb4POXS/vGcOFJ80pONW+UFxh9yb8+g5vMIrjyR3ZHovnvpxj9pc8+nvdYXK7NJ
	a15PgJ+yaUEfX7VGMtrGDVjGpRLj1J4x0BZD1ks2L9DSRLK95huahZAcWDQnn6RC
	0UDcnqaI4yqT5KcS5uyPVvrxf0/GwqPgVgVJZ2nF/wzLR/TKWUSyKhrY7ot8nQhe
	WPLiWqFe+4P+uSRDBjgkFA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty530asx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 01:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfZo0glEddj2Xf4DrAaEymfH9kRLUwMSKdc0waSxjDsPI+TUIrYAJhIKtl3Eyh32VbtWFEZdHJ1x++44roZZ2tZrosHHmcuNt5Fean90bGtzJfn0fS5xkKgerqg+ISiKYVMjETXVJb9cTZ0m+niI+KPKZvfq0eAqCfD4AVp+wl+y/DbXuNDEgHsluF7FpXSsy+Ju7qswvcszLhVV902Fl5CC0X1IuPs1q3RWg6YCu4+prciHjgIia2WsWQuINU2BfacOMoprQ+XCgoFZhB0clxfd79k5V6g/sC4yZqIdsTOoXNQMxspgOlBHrPbslwROu35xkXrGJV7hyaqd586Mcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGSqmuz+5bPrWIiqmrc/3yD/hFgMNLaADvgjqM113Lw=;
 b=HyvKNg5kuScpn7GFKS5NpbSzeAmCAyxmqVHIEEsO0TK5BUGZ/JVl7qaxXJeEMF2FQw/BE4RZBpag0VArSoBW+IIq5s8WI409ilS1Z9uiRV9FlS4O1+qf4TZzfhqI+9uUYwbmV7uINwIqEuyZlv+A6A1vX1bTHpBieGKodIPDKQvPXZkCvPBsnKiuel+BrUzYbxdR3hKEF7wvuBh0O4+x1l9GY261eU9oAg1F0iep+nCMKFQtPaORGZw7XbiJA3cnXhc5H0LqaaXdBerrzTlG8PRHiXEBnr7GdZ0pLBH28d2ZwtGwXmYt24NKD8EVNUf7bZ+OBTmtI0h/0xEcKYX/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:42:40 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:42:40 +0000
Message-ID: <0f19a07e-0499-4520-b0b4-22669fd5a68d@windriver.com>
Date: Wed, 11 Mar 2026 14:12:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
        "Tatrai, Peter" <peter.tatrai.ext@siemens.com>,
        peter.marko@siemens.com
References: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
 <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <c6ab8919113f64c3891f0987246ce4d9a537ac00.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <c6ab8919113f64c3891f0987246ce4d9a537ac00.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::13) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8c7886-63cf-4ac6-f070-08de7f4a2756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	UleFt+GUYULTdMKlB+5QQgbM7AXsPkiKfW5U01WR8D+mbPJJH+sXSOgBMq1c+hW6LI1YN7WVHzHmLHRb4g3OJwIb6NN5pqoxJZ4I9zj7hl7Q4TcM+So8BxI5l4L33nITEWFna6Kzou8FrrUWG7d//OsyauirSWT+hIEy0GwKGaDu35HeA1d0OI1Pnk8jQoIccHeRtCnHAkwf5+CpUescy1LlAUEldRG70VVCEL8IDMwhWroVDz5QM1kpPBYcZC+eS1jJRJD+/W3revtPjtvxfeEl3L8MUoy086632fV3TJjoujqEj9oRuWLIKUugztEZgGrmLw0wp9YNG9XImjHef26aNYEmrT8M9NWzaQCDkqpPlYFrLFVF4ShX+9BtpQCeOEF9VrrKX2kXWzyFT0nM3SpeOf0UBarIQ9d2lzPrfuXzVsJsGnsbXWwX4FyUAJHyoZYf44G2zNjjz6PYsyesBRji7xhi9ZmuHWTZJEXKtwACzeD3UPO1/1hWGBjMqfGbHvCDO9BbXpEpYCL9FUnqLh8Yo6mGz7vxPhMmhsmHrsLwaD5WF2AVNvc/tUOvn9jrD0cDK1q102pRpBDtxCPmchyMApzUIBNcuS4i+WBW5p14wDBa/AGIEgzrQJotrOcChhh2AHVjNhtaHGfmGwScOz1a5WlieqpMfDDxqHplbI2U+HKG3byueTBtoUDl3HFFcBzN9vZDJD36cnbg4Ic51LzN5nCPPXy04B1EaCOdM3U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXJKZkVua1lMV0pQY1Y2UWJNMVRRZ2F4M0cwekZKZU90c1g0TmJVNEFPOGR3?=
 =?utf-8?B?d1JNUDdETjVJenlWV2hlMFlKRjFVaUszZkppVEkxREMwdnF0MlM1VFcxZ2Fm?=
 =?utf-8?B?K0NLNk1rc3poWTZkSHd0M1RES0RkQm5HMTNOK1pMUUprUGs1RFNua0J3alZu?=
 =?utf-8?B?QytudWxqUWlDMThEVExOVHhDSnkvMEsxeHg3cWRzeXhhRjlzZExEVnlLcDVo?=
 =?utf-8?B?clJoN0RCTkNZWXF4K1EvN1dJZ0gwdDlVTVhWai9USXRBNngvbVY2MDZVWnVM?=
 =?utf-8?B?RVZjTC9HMlpZWERLcFFuZjdKRDJCVnphR3MrNlZ0YjJiOW52UGdvK1RSOTJF?=
 =?utf-8?B?VS8vOTV0TE1WSnhVYWMxK2pNamhMSWc0R1NwZTVHVGwrUzlEMG44TkE5NGhI?=
 =?utf-8?B?TkxJcTRVbjJaWnQ5VUVrbFVvUXRORGdLL0k2QmQ0cjVYL1JYRXludjAvUmsv?=
 =?utf-8?B?ZGlLc2hZSGdpamtQRXZvNFVPUXoyYjlLK2dmelc5VzBnckdnWlZWQ0xndlFS?=
 =?utf-8?B?ckJnQlpTcmhIRTVTcFZMTVN3c1dzZ1l5bE9mdWJnNzhFazF1TDgrVGhLRDAz?=
 =?utf-8?B?OUFMb2I1cWk4SkhVRVZUcGQ4VEpWNk1uN2Iyek5NSEQ2TWQ2bHNhZ2txZ040?=
 =?utf-8?B?WmZ1THBzT2IydDM1OFppZjFhSlZ2cHVZUmpMdllla1NMUVZBbFc4SHRUdGMy?=
 =?utf-8?B?YzNCU3JRZnBBOUZXRnhKZHdYeWlYUnpqZEFQZDMyQjRCR0FZUFJJNzVJN25W?=
 =?utf-8?B?Rm5TeDk1ZjRsRzhtajI3YXdRVHZMSlFQK1lTUlZJQmtneENHdjc2QzFJeEFB?=
 =?utf-8?B?OERiTnQ3ZnluWldodzNQQzIvWGFsTjNBbFVPMXNKUm9YaVZaZ3BoYzBVM3V5?=
 =?utf-8?B?WWllZG44ODVjbzllaDNhZU9wU29EL1NkNStsVW9zTEdxcnlrZld6aS80ZGJu?=
 =?utf-8?B?OVEvU3pGeno0S05KKzBrdlFyMDhuN0FIeWN6OXJyTWZxeVl0clhRb0IzSTNN?=
 =?utf-8?B?SVpnUW1pQjV6Nko5Qy9udjNGanJXcVFSbXVXL1hyZWpMcmdrUE8yN2h3L1lu?=
 =?utf-8?B?NjBBb0RrQk5tWXd1bnU3QWFOMlFrU0dpUTIvWUJPRDdZQlhraVNRVjJsK0NH?=
 =?utf-8?B?TWpEOHZWYVR0RWdsYUdycWRyUEVkRVdVdkEwNkcveHA1VlJ6ektTSGMzNjRB?=
 =?utf-8?B?Z3EzRXpHd0phWG9Lb01LMVBKOGgzR0MrdVl2Mi9IV01hb25hM0lRditVRVBP?=
 =?utf-8?B?VHJ6a3pFbWVBcEF3eUVMeGFWQUdlbmxUSnZTMnNHL3NvL1B1UGpQYzRmWlZZ?=
 =?utf-8?B?cnkrN2dabG1nc3E0MXVqSjRtTzdNVkJMOU1NUmtlU2xWbG02enZZRmJ5bHV0?=
 =?utf-8?B?YktTTWJzV21KdG5na2pidlNPN3dFeTZHclZWOG9mRTBsdEQ5VytQeUZ2RU4x?=
 =?utf-8?B?Ri9WZ1dvU25XNlJseWdUaXgxeFV5dmN5d3ZlazVoMkx6YjBYeDE3RWczd2ZX?=
 =?utf-8?B?WDhPeCtwV3FMdGxwSUE1MDZXMms3dkkwcFZVWmRPME1VRmtsNkZ1MWtRRFd3?=
 =?utf-8?B?dm5sL0hDVzlaWnFsRWhEa3BCTDNMYjVjeHRuMnpsMUJoQ015R1RTTDcwcWZ0?=
 =?utf-8?B?TlRZSXJSbXhIZ0NmRlIwenRVaEoyb2c5eW5kc2E0SDQ3UVNHU0wzRS9TQjNY?=
 =?utf-8?B?emNQY1RpNU10VkRnU0RDdXM5K0ZZb3lTMXY5M1dDVFo4NU1lSGFQbTk4YTZl?=
 =?utf-8?B?WE9KVjVkM1labDlqRGJWb2d2MHJGbnQraEN3a1ZqbEtmZGhzelNmbHNsL0Ux?=
 =?utf-8?B?NHUvNzYrOXJwa3V3MDQyOExIWXlJTzlzNE5zZitJS3pWSnVEVUpVcSt3MVcx?=
 =?utf-8?B?ZE0xYVZmMEJmMktObWFkY215SUYyMVg5UkJkNGk1Vk42YnIzTzhnVm14WUg0?=
 =?utf-8?B?djVzS0VRQkdhTVJmRnZnMG1ZbGhFNHpOUGZKNG5kUFVXZmVhejZiYmkyeG9a?=
 =?utf-8?B?RU9kY3BaeVpTMnM2c1dPbWw3VGxIYlZsSjRIaitiSWJyZXJQd0RFUjVHKzln?=
 =?utf-8?B?aW1DWGdidWhhSXBKalQ2Q0F2Z0Nqc0hjQ2lMeGhGTmhCTHI5RlQ1S21nM29z?=
 =?utf-8?B?eXFqV0tlM3ZlSEJVcHpPREM3VS9SZVNySE1SS3pnUXNpQkF0UzF4RmxjSVJM?=
 =?utf-8?B?WHBKaU9JL200dXJiYllmcDU2R2wxYUJwQmZ4YzJnR2VMNnhmbTg3eHpJWlBs?=
 =?utf-8?B?N2IrdGI2aDBFYzJGT3RiNzc1c0J3b0U1MHd4RnVocVhuTVdmWGpTaXg0dUlN?=
 =?utf-8?B?SG1HRGkwb1NGbWdnSDEweVNoNFpNQ0ZxZEI0UTBER1R1cHprM1NNM0pIR2tn?=
 =?utf-8?Q?ri7mstAkye9N+2UWyRbruqulWE/xyXS0op9El?=
X-Exchange-RoutingPolicyChecked: 
	sFQj+27cYLC3z0okYXek6TDDVf56Mb1v33nzTMlSSkP1feHhT4mWGiUlC+zTfQPWxEKVSOdc1y2F/v2fSPu6FAGPVWgE8smTEk5YVWBRwUb1FJZ3NTiNtFt0XAE9IyBFlhI87SMXgeQqhGbB2nFU6XuQRst/ojJeEEdzhLpq153T41+RZI69rQGD4p0SeDQxsRBdkRCRxCa35nPhrhv4IEHjOk7IWh1T8lO9NC+t57uAHHA4VNCpPVqZz+sC/5N4XxRjfta2WV9YNnnSNb5GTG7KqSM1OXe+hWdRhA4ycdKw6xCjBpZA9LX+fzJyO/N4VsoLMSLneF94FidN7lo+HA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c7886-63cf-4ac6-f070-08de7f4a2756
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:42:40.1689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjQ2nQ3vugCZ25ewMAlz0d4SVbWkKjmuZpLyEDeImcNc1innruDH+oqGIsaPQoQZ7oSHryvmZZVLnKf49ZCnpBzjBTiagBxirUD/dTqwfAHHjhZkYZML/Xr3gsY0KLbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX0QynIXDk2f4c
 xwv4H5N7tDwzBVjfTTzb2JGB+b4LDFBnXQ85hBZPOWTFjsI+l0qpsvDHOF5vwKjr+Gip/Owymxo
 RxIPrCS39bu1UHwyjcYhabmf/gbTbkRVIdk8Dgx9cpiuaOKby12k3x0LZ0E4RkMY6cvfaXvMcEH
 0cB24q2lacinzOXt0JWqGErVgOG94c8okwO5Pi0i5i06EwxNCT2abN0eKc0a9mMHkXm1lsFQm++
 8y3IgODOm/XMAl1BuW4aEYXWdrVXz9m5RQhDvlwcU8as2gK785lgueE/SWZZ8Zy5XAq6N1UPt3v
 49ejjVOzZk+CqHD/GrGWlx+l20+UhY/1NcpPIKNgFcJ92x264TGNMP+d1SO9N5YM/kEBkK2yfmt
 I4k+EUXAgK0a2NYUSBoWwSUFzTERkBgdOP2Q26MvWLhx+ljY87tc09j2ZYUarZ1ED4cXcI600pj
 FNDOM/Mcdp+Kd1y4/dQ==
X-Authority-Analysis: v=2.4 cv=PvWergM3 c=1 sm=1 tr=0 ts=69b12b03 cx=c_pps
 a=41oIdeUvPxzefjUhlJkc5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Hc_oNCbVxRYTYK1gEdwA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: u_vjdArcbTQGSkkYjtyJXMldpAo2t-na
X-Proofpoint-ORIG-GUID: Q4YTzuvMpwnlP6OlUJPM-QloBPvTN4Az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 08:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232842


On 21-01-2026 16:29, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 2026-01-21 at 09:14 +0000, Peter Marko via lists.openembedded.org wrote:
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org <openembedded-
>>> core@lists.openembedded.org> On Behalf Of Varatharajan, Deepesh via
>>> lists.openembedded.org
>>> Sent: Wednesday, January 21, 2026 8:55
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: Sundeep.Kokkonda@windriver.com; Deepesh.Varatharajan@windriver.com
>>> Subject: [OE-core] [PATCH] rust: Drop oeqa-selftest-Increase-timeout-in-process-
>>> sigpipe-ru.patch
>>>
>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>
>>> This patch was originally added to address a rare failure on the PPC
>>> target observed in AB. Currently, we are no longer testing the PPC
>>> target in OE-Core. Therefore, we can remove this local patch. We have
>>> also verified PPC testing locally several times without this patch,
>>> and the issue has not reoccurred.
>> Was this tested for 32-bit ppc on a build machine which was under some load?
>> I wouldn't like to play a remove/re-add game, flaky timing tests have tendency to return.
>> It's rather trivial patch which should not be causing any maintenance effort.
>>
>> Note that this architecture is not being tested on AB, so the commit message is bit misleading (as it was not observed on Yocto AB).
>> Also not being tested in AB is not a good reason to remove something as users are still using it (as a tier-2 feature).
>> Note that we're discussing some form of return of Yocto AB testing for 32-bit PPC.
> There is a bugzilla ticket number in there:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15625
>
> and that shows that it did happen on the yocto project autobuilder when
> testing 32 bit PPC. The autobuilder would have been under load and this
> happened in 2024 with this fix around a year ago.
>
> I think Deepesh is right, we should see if upstream would be willing to
> increase the timeout. Carrying patches like this with no hope of ever
> removing them is something we have a natural pressure to try and avoid
> it at all possible.

Hi Richard,

How we should proceed further on this? After our discussion, it stayed 
in master-next
for a few weeks but has now been removed. Would it be okay if I resend 
the patch
after rebasing it to the latest sources?

If the mentioned failure shows up again, I can open an upstream ticket and
follow up with the community. Please let me know what you suggest.

Regards,
Deepesh

>
> Cheers,
>
> Richard
>

