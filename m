Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73101C38A06
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3853.1649409823486077134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 02:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=XLEGKZW4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=10974aa226=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2387hQIZ007957
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Apr 2022 02:23:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=khkAV8nN/LP8A+J439YUVjsCXZAm7wb40AqI6OZ6PPU=;
 b=XLEGKZW4q6w+LXV7UNcVSqbNNuY6Reuj01O2aLLKCa3Y1LyTbfn/T6xYkAChbVLLwPeE
 JOwvIKpB/y8XZfpv59oIs17sGg91LciS0/yG5AzkCY3Rrff77zDstGJ7fiXatXKVi6BD
 huwnzR7st9MjctdAWiqy8/7TJLxijHjNP9+xL1pTZqEmZ/eM0IDPJqtJguEnvdo939GW
 i3oHCzbddfic/Gq836J3w2EbDWZKfY3sByPqUiLiP6C2HIVN95m9pPV5fAeAaknxkC9E
 yghZC9kZqZvWlXk5zS6s4/y+HTWxaKOPpL7I0BHwGVoigxIXSxKPv2LB/O/etln9DrJ0 /w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6hs3vy1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 02:23:43 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2389NgRk010390
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Apr 2022 02:23:42 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6hs3vy1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Apr 2022 02:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktjcVuqGCDzXJ/Pn6QFBh2q/TpqHkdkJcRHVh3Fxd7SQ8q8arUSkUW259fl9wuWc3SeCB52toSVMcIeuXEh9VqXphq/vaSU10DwDJaWfPpGqUJQXWVwhJ2+HR1SgtCLq2Mr+HzOcb/aaPxRuPALGviP5sf5hh56qevEyXOZAXMKAx0fNRhA5Kyj/ff3nrkwZYS0PzPbxLiGiUZkEw4UcXtmJRN0uMiYo5R5mOu9FmSTPu5MI4CtE6fqDCVUvwtfNiYFwjx21Gr2xRql4ba4eMuPZescy2fPZ8IRvT6NM6aQ+l+qi3uAU+CNlkazVP0G4fMuHWHXpWeNwlsfttmlOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khkAV8nN/LP8A+J439YUVjsCXZAm7wb40AqI6OZ6PPU=;
 b=EFTKkOMiLX6A/S2qhbvw0ziOJBkWzqa75QOgD/k88KH393S4d4Qw7hahe7y7muqBmfJRcb7EgmvUG4cB0l1S43y5fjHkv49oXYYeCg9WpnNITq8p0w8BnUAYFHkFhePneQOuRlFznL0AW+PiXJLra/Y1LjOewFMZU9OI2MJ/WvY1louEByGAeZS2PLZJxcnQXGUoqeG98lPc501JMv9MpAKNQGaA1NoTLXRpCqlL/xCDhQDBz8yi1pDsehew8cX2yq9KPoEewAAAExF929c1JWEVUMos4EPXZYHfnQwk6AnHnnH295EsH231pEqa7249xkK0W3VEor/g7TrmR/+NQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Fri, 8 Apr
 2022 09:23:39 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 09:23:39 +0000
Message-ID: <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
Date: Fri, 8 Apr 2022 17:23:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
Content-Language: en-US
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
 <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::12) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8237e5a-b5e4-4668-389c-08da19417783
X-MS-TrafficTypeDiagnostic: LV2PR11MB6000:EE_
X-Microsoft-Antispam-PRVS: 
	<LV2PR11MB600056B8C3C71BAF8B976152F9E99@LV2PR11MB6000.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fpAXH7ZXCSU0mQoHIweytORlu87G3eob9ur8fhhitTGLEoHi9qwrSRUdJnAjNODYfrWkT41dcPjkLTZrOuBMYA7px3sHUN3tvJohThm0dp5G0gLhcY+epVy2xbG3KoYr+3QCnc4XQSec2XZfcuNVwSHEvxstP+kiifJ5ISPzpud+4HM6AFyRuku9pos131cJ+tZKbMbl6G+q+TXOFuS27j5MUQvduO3ekvC7Mkhrs97wLtOnI8I//KeCH/RXYGaB2SkVzMjadfXg1SDr9J6qne05HqTBbd4E3o0lhA5u4WRdoOmXLYSJdXbNgyTZgttiOJvouZap1gj0b1MJQmF0/RDkueijM67B6444REy9+2pvu7InDX+NuBY2qIESrJ10BeKrRH6JIGcyAkMuPWI+/fBFwX6ha8WI3f/ExXQ0eq5P7Yto5e2PRNYXoltWYCPnePMpPD/Hwk3fwRI6jZIdK238G4KIcT/9SRIlHOn9MhQRrkugdJeO/qqFxbAFTK8pwps3adVjamfwS6kWnZuOKlkpgjoZPeA0di2CFjkstfWJrClAFpSPGKnGtCE0bKeoTKKl8W3XGVM8yvYqwQPt8iw4dEc2oeYh9wBfSGuXcMiJram//GvTLEKBCvK6GSQIas/jwR10y+tvxR8SAkBm/3Hjv7pljlSa3EvfPREPzkbmVu3EeM3hWNk9c6S2OZIgAjqDE6hbxC3utLMgL2gd1M8zMj+sXptummu0kcfBZG7GrD8gu8jRGYRcMqiceijPgMU2WTcv4BsXRzC4g7m/v8j1+HF7NqE+BXpbdz4RejAhsU9QSJeNRuw/kr3kwdVsVNDyqFjAvNAzzN/OxZsgH1UwfKm6+Q0Nwb9F/Du7Umw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66556008)(31696002)(66946007)(5660300002)(8676002)(2906002)(6666004)(31686004)(26005)(186003)(86362001)(2616005)(4326008)(36756003)(316002)(8936002)(38100700002)(44832011)(6486002)(508600001)(6916009)(966005)(53546011)(6512007)(52116002)(6506007)(38350700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXVjMHJCaldreFliaGwrd21ZNmhhcllDRHNuQ3NPYktmUWZ5eXVFODBtc3Fw?=
 =?utf-8?B?aWNQcnVpenRDL1J6eXFkWG1HTVRFQVlIRDJaMEhkeFZFdlYvYzlkTndJbW1p?=
 =?utf-8?B?TXVTQ1F2d2sxTXhnTWdLNVFEdk1Wd3o1SEpqK3VsYW15L0dtMXZNMmhIYWJX?=
 =?utf-8?B?aDdsR3lUaS9UUWVTQ3cxdi9RdGN2MjNoMGthVThkN1FBVU4zc01Gd3hnN0hj?=
 =?utf-8?B?MFlaQ3FMckNxNFBoK3ExakVUdUNiVG14dVkxV1IzcmM5V0src2Zkd3RHRVp3?=
 =?utf-8?B?ZWE1NWQ5aU1hK0YyczNja1J1RTQ4QVRDRk1LV3FBNWNvcWU3N3NPWksyQkpI?=
 =?utf-8?B?RmtnUGhCOWxsUVhmSzU1QzVGOFFSQ0lqQlRrYmpaeVlhRXdqcEdEY2pQK1p0?=
 =?utf-8?B?OFBmSGs2R3RYK3RPWEcwQms4R2Q5dWJLK3h6dkJTanpiaWs4c2FRbldGZ2ZM?=
 =?utf-8?B?TFdmVmhOc01WYWsvdVU2bzZvK0JmMUpmRExpVWdTa0NrU1NiY0I1blRvemlJ?=
 =?utf-8?B?Y3hVU1RoclVESEk1bmJSYlFjQWwyVFVWTUxVN05udlJyRFVzdnVnQUkyMVpI?=
 =?utf-8?B?NWNqVVdaRnIrZ1FTUXFQVTJDdE9scFhQTmJrYUoxN1hPUkdaVXdWbm03MTA3?=
 =?utf-8?B?S0JabXUwZ0FzbTVxMDFPSThLR21IZFBMYkl0MVNzUk9TelNBSUQ5Z0NybjdB?=
 =?utf-8?B?WXVVRmxNcTV6L1p3UlF5aURMcllOYWxEdURQdzlTcVBXcXl6eFBXQ21jSGsx?=
 =?utf-8?B?aS9CK3R4QWFMakx3K0NRc1NNd2dXNjYvVE5kVTM1c09XcHFYelExdGV5c3FY?=
 =?utf-8?B?c3A3MlhQUTVTaG9oOVRyUkN1VUkvQ1BMaHhDNlJDYmpwTHlsaHNZL1NTYkZi?=
 =?utf-8?B?Q3hLRzRtT20rQkxHTGw4TVp5YVk3TDY3OUpTU3ErSnl2YUlDVmFjdCtFYzFR?=
 =?utf-8?B?S3FkOTJjcHloSXpkOU9OVWpLVUg5NDFUMER4TUZDMnAxR2JNYkk5RjZabmZk?=
 =?utf-8?B?UjJ2UTVYcWt2NkpaU1NmRDQyNklMU25SdjdEOGwwVEZTNlVrcE91MmlJbHFK?=
 =?utf-8?B?TkNVMDMxVUpiMWw0VWQ2NXVsWmkwSlhsS2lzLzl0cUpiR29hRC9hZkc4WGY2?=
 =?utf-8?B?dXhMREkrZ0ZQZlJIS3JndmxMWjdUczhSams3c3FXRjhjUXVLQWdoc2Z6Nm9S?=
 =?utf-8?B?Q0xGOE5laGtFdGVmM2c3d0FoRHlSNTVrRHUvQzdmbmlDcEdMSzhPb0lJeGln?=
 =?utf-8?B?bEZJWEFlK3lBYXhFNzgwL1VkZW1TcVhna1dPNENsbWVqL0N5ZUFWMmNKa1h2?=
 =?utf-8?B?czZqdDJxMjJSOVJoSnhCTHpxbXRhTmRhUnpYMUVBWHlDaVVLKzJlZkpjN2xF?=
 =?utf-8?B?dWhsSEJxM0I0elB3dCtIN0xCY0ZIWDh0Tml5WmZ6czFPdjlVSVJFUitmTDVm?=
 =?utf-8?B?SWZwRStPRjNRRlZuWFBaa3pRb21adi93Uk9vVjBVaUdQR3NZYldpV3lkdGdG?=
 =?utf-8?B?NSs2ZjBpeWczcTRTUzBDZVBvWWdSaXBtZm95YXJzZEtRTjFHb25iMk8xNWRL?=
 =?utf-8?B?UFhYdDVUSzNYS0tzaXpCQWRMdlNyaityWC9yd2JCUjBrV1RySWw2ejVCdDVC?=
 =?utf-8?B?d0ZUdzlqalpiU3VWd25NcUczenJZVXNaUXR6L1FoZ0ZmRzRFTW1rVk14eVFq?=
 =?utf-8?B?SjJ0SFdwMkpMdm1xTmJyK1pwS0VVYU9sUk9TSlhDS0szNnlNajAwUC9naFFK?=
 =?utf-8?B?ZkUzMDdHZ3VWajFEaktLVHI5N29tMS9mRTZjSURzd01tT2lqSnFBUEJSKzJM?=
 =?utf-8?B?WGZ5WXRuaXBnbk41bDZXa3RyVkxUVEV6bmRsaE94UExyb25jNmQvMG9YYlRs?=
 =?utf-8?B?aFpjRUJRZ3NhQVNrVHZ6aDdiYzVMK080SHRGY25HQWNSNXp6YlhHZXNKSnU2?=
 =?utf-8?B?cnk2aHdsbkk4NkVqOEFEUU53U1hXdlc1QXVBOEhueFBxVk1lL1J5K2xpd3hT?=
 =?utf-8?B?TktkMkpMdzFBS1RjSVdxaHNld1gyelBYRE5ZQ21iNzZ5cFgwQU5UTlZrUlpQ?=
 =?utf-8?B?WWFCQnlkajBEaStTaFJxR1NPaVRRU2NtelI1OEcrRTJSRnNxNERmSFN1ZjRl?=
 =?utf-8?B?aWkvNDduRTkvS2VBTEkwcEkwd3ZTQlZwZ2Z0Y3FiVGQvczJmR2NIbWtEUnZZ?=
 =?utf-8?B?S05wYlg2Q0hxeHRKV2E3OHNlL2hWNTVDZ0VlMlhscWdRazFaSlltZEE2RElK?=
 =?utf-8?B?bVBaWkxuVnUrU1VtTjI0YVNCelQ0OXFFd2pDd2ViVmNSZ2dkMTBidG9HakVI?=
 =?utf-8?B?cHJFZzd5TC9ienZiU3pTOUs3UmU3ZkVneWRaM0VmVFZTcmQ2S29kQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8237e5a-b5e4-4668-389c-08da19417783
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:23:39.7034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v1dFE9UFsusyIh9iHSJn61NjfG+NUz/FHM6twEMwOKXKkNW92VzMU42utxvhek3vAsH3CmX9XyGyD0h07U7lkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
X-Proofpoint-GUID: XrXfjmqabpSL4-v9TBHv9rHCqWMThXfY
X-Proofpoint-ORIG-GUID: R5WepieivqrrQYvl-0euRKGu-XIIgGRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_03,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204080049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2387hQIZ007957
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164157


On 4/8/22 16:34, Stefan Herbrechtsmeier wrote:
> Am 08.04.2022 um 10:15 schrieb Yi Zhao via lists.openembedded.org:
>> There is a bluetooth service startup failure:
>> bluetooth.service: Failed at step NAMESPACE spawning=20
>> /usr/libexec/bluetooth/bluetoothd: No such file or directory
>> bluetooth.service: Failed to set up mount namespacing:=20
>> /run/systemd/unit-root/var/lib/bluetooth: No such file or directory
>>
>> This is because the directory /var/lib/bluetooth has been listed in
>> ReadWritePaths=3D in the service unit file but does not exist. We need=
 to
>> create it before service startup.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>> =C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc=20
>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index 79d4645ca8..ee2cdbcc59 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -102,6 +102,8 @@ do_install:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Patch python tools to use Python 3; t=
hey should be source=20
>> compatible, but
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # still refer to Python 2 in the sheban=
g
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e '1s,#!.*python.*,#!${bindir}/=
python3,'=20
>> ${D}${libdir}/bluez/test/*
>> +
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${localstatedir}/lib/bluetooth
>
> Please use systemd StateDirectory=3D [1]. Maybe it is reasonable to=20
> replace the ReadWritePaths=3D with StateDirectory=3D.
>
> [1]=20
> https://www.freedesktop.org/software/systemd/man/systemd.exec.html#Runt=
imeDirectory=3D


Thanks Stefank, but the ReadWritePaths=3D is set by bluez:

https://github.com/bluez/bluez/commit/442d211b5f30f00d5ddd69b43385a03c142=
8ac45


//Yi



