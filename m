Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5C9C25B7C
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 03:00:58 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web10.6822.1716433248161620873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 20:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=RVfHp06Z;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1716433248; x=1747969248;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=W8iIl1uB7pBP0L7R/6sIChH8Xr3G1hiDM1A4TdkLtC0=;
  b=RVfHp06ZI2geW13BZzpWOO3/Bz80hwdYm6JBI4I/WcvBhNGELixT3cR+
   plNq2UtDTdJ44lIRK5OJWMY33+1QrsMfqB7hUV5Kymyt6VLgPKlfZLj4U
   h4zXb1yFoVq159LmslrE/DY4dYWjxkQHk20Zpri7IDjnw1G7dwlBlSs3B
   cPyvyqRSFBNX1du0iHahmUR9sM8C9hzGvGCE0PAP521RlVVCvTocKUV9O
   Nm9vusQxE6vzi0OFftfAxB23Lo7J8LdzLqg7wjIbhsqJ8j3HJflsazhN/
   nMKGnvi6ug+R+2Gv6K/S3JR7m9On4Aoun8DQt+YZ0IM1MzXZ0X5hNV+W/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="120541222"
X-IronPort-AV: E=Sophos;i="6.08,181,1712588400"; 
   d="scan'208";a="120541222"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 12:00:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJeo/4EX9hW1vw1Kn4xx4Ht95tF5xlvmK+qVElEy5nk0FE0I1YSKTVI50dcExcDMS6Z/g9DgMT/2Qxl8CZgyCQML/aRAVz8zvrBi0Zk2jp7FwYvaTfpJKhm0o2LsbX0kx4PxotZJunq7eTpLxqLo3hIm9Lz0N4YxaC5OKjm3C40V7yzLtepbNv8G9jeeMu0eIzahNlTMlaIEd4HYkU4xVLpvU5beVLvmgmv7lTEDiyIxJ4XI6GrhwCBvwJi7cnKdHm69R7z5ayCgygEVSK02k9IkWg7xJVnBo2ISXMJOJkQ9rRr2CruZc5X4D4/hef9Tvmxc7V1Z4X2egnQvgtHrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8iIl1uB7pBP0L7R/6sIChH8Xr3G1hiDM1A4TdkLtC0=;
 b=cbLN79lBQkfQpPEZUWa0JGwcF2F4L688AzMHZ/9uL8Q8UVQCFuoSO1WLlKy1MmS0hoyGTEsSMV8TgoKIleN8izzqzf4egC/Q07vwPZ+gZw+n3X6T0Yq+ymP1vaZ99oJovmxsBSqB+m2jretpi90HGgCPQxgajb3uaI1JfCKzvwZHw2C3yjabRQt0Lcf/TzYUFXsLewFNQLxc0Hed7O2r+7DzyTbnjOZtLdWISXr+ucG9LWPW6ZOJAXCBRWG+W4WI4boVQTCkt8ooeWcmDn74A7SggovJsqfr6WikesZoLu4Sdf9YBOjjRqJd+RAEfQad61EUA4GuBCZ7iRF4AMdstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYWPR01MB8528.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 03:00:41 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 03:00:41 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: About an issue of run-postinsts.service
Thread-Topic: About an issue of run-postinsts.service
Thread-Index: AdqsuG1Dm358pEh5T9iqKv0mM6McXw==
Date: Thu, 23 May 2024 03:00:41 +0000
Message-ID: 
 <TY3PR01MB1105631CC9A9A05E506C8D948A0F42@TY3PR01MB11056.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=888b1794-306e-4c2d-9ef2-e00d3b500c02;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-05-23T02:23:24Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYWPR01MB8528:EE_
x-ms-office365-filtering-correlation-id: ebe9a5f9-2875-4d77-3e60-08dc7ad4880b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009|1580799018;
x-microsoft-antispam-message-info: 
 =?shift_jis?B?SkV3c1o4VVNZWXlVRzBlTmc1UkV4WlFMSDE1WWVuWTlTVWJqTmhjODhs?=
 =?shift_jis?B?VmhXeWpuNUt2RU1JczkrdjA3bVh2QXpVbXNoSXR3blVud1RVczdQTTMz?=
 =?shift_jis?B?ODYxVHRlVnA1ejNkT254VFJkMTBMV0Zpbk1jYnd1YkNYVFROdmpmRmIy?=
 =?shift_jis?B?REE1cTQ1VDhWVWNSOWhtSHh1T3J3YVNNcmk3aXczUEdNQ1NGZmU1K2dP?=
 =?shift_jis?B?QjAvYXdUSGJqeFZIanpNRkxqUHVaOUR2SjJsUWMxcFd2a1lUcTlZMUFa?=
 =?shift_jis?B?ZEdIQ0xta25tRXNOOEdWZllsZzFoVTFsMjl3RUM5ckVqVDBzSGlRUVlj?=
 =?shift_jis?B?Tmtvc2dtaVFIQ2xOQkdmZHM1RFFDWDB5NnVzK3IzNUQySGVnMGZmK3hi?=
 =?shift_jis?B?SHBqNXVSZm1BRWZNenp0amQwSGNNSDBCTWtoaTB6TmllU3ZzaG5vbzQv?=
 =?shift_jis?B?eUFhaGErcHI4M0NCaXRTMm1tNGtlQk5wSWV4QjdyKzhnS2pLZ1Z0VXRN?=
 =?shift_jis?B?OFd1TU5GdUE4MDl1eGxYRWJzUmw1Mk9OSVhraU1lZFNMazNSV1F6bFVH?=
 =?shift_jis?B?NkhLaERQRmhHeGVFS1NuMFJpdjY4MHY4YWg4dlNBa1JsUXVsTSt2cElT?=
 =?shift_jis?B?MXBkSGdETDNlZ2k3ZW1sVXVmaFVxcUpCT1F5Y0xUVXhlaWcvVC9qVjJH?=
 =?shift_jis?B?OE1vYXUrdUhhRWpta2ZwT0g3VmNmamZydXZjWVQvR2JHTzg0ZjVUdGlp?=
 =?shift_jis?B?VzNrODFKZWhFMlAzVy9SN1krWGJYWGdDazMrY1NZelFWMkZSUWJZYk55?=
 =?shift_jis?B?dkUvdXErVTJ1RmlZOFZJL3FsOUlObWk2c2VtZmRyNnU2OVYzbldrK21E?=
 =?shift_jis?B?NmM5T0hHdGdUbUhXb0lRWXVsdGp1ZTBuc0JOQ1g2UytiT05uT0dwYjB5?=
 =?shift_jis?B?NG51OG82N0NrMFl4a2FtenQ1eFdnV2V4RzRZeGdpblluTHZPR3BDZUNX?=
 =?shift_jis?B?MlJsSE81OUxWNXhxc09HMCsyRmZZRi9peGlRWjgrZ0xHVXZLUCtKWUFT?=
 =?shift_jis?B?c2NvQXdUdGVrMEpWb3o4cTBPR0lwTUlqcGg3K3VhcXVTUHNXRUhtcVZ5?=
 =?shift_jis?B?UlBSSFE5ZTh1a0o4akJ1bEZWOU5Ta2hqdG1NbnlnV2dpL3FJMnBsTzRa?=
 =?shift_jis?B?blIzUDNTZFNBcEhiQnVCUXA5OGI1bTlURjBBK3FBdnpGem81TWNiRklH?=
 =?shift_jis?B?R2l6M3l6OWtzdWViOXBwNmEyWUYrNnlONlpnWE9Pb3JFczc5d3I3dXRP?=
 =?shift_jis?B?VkdwK1ZnekcxS0kvNVhHWTlvMXF4VnRFTWdQSHZGR0lFWUQ0SERtWjN5?=
 =?shift_jis?B?NTA1ZkNZcXlRcFAvZ042NlZ5UGcydzVaNHBYWmY3UTBHNnU1LzF1QURN?=
 =?shift_jis?B?aDhFOHllSytUaWs0Vm1nSWtQOTluM01kdGdiQ0VQbWRjMUxyalZWKzhs?=
 =?shift_jis?B?TWdnV1BUWWMvSUhDMmZKdi9lQzV0QVJVNGlDcmlkTUVWZkRjZVhFZHRO?=
 =?shift_jis?B?aEFtSHhUSmczWUphRHVubWpabUd0VERiTDJsc3ZZbnc3VWdvNk9qWStx?=
 =?shift_jis?B?YU5uQ2E3c2gzZmg4bkNnMUViM0xtWWN1Zm9XSWU4TUhacFcrMVBidUhC?=
 =?shift_jis?B?bkF4OVRHTG8xM3RuQzNyRXJ6NFdRNVhxeEhTVitML0dsZXJmRkRwWjBR?=
 =?shift_jis?B?dEMzZHdadC9Sd2d0djF1TUNVbVNQNU1LZG84c2krWGUrYlEzWHB2Qmdn?=
 =?shift_jis?B?em5oZUwwOTUwNU54dndGUUR5OTduWk9hWUMrelBpT0Y1NE41Z2lWMDJl?=
 =?shift_jis?Q?DkD20h+U9d0rtZgex4EaSVIxxDZWf4MAClbkxVtCwd?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?shift_jis?B?MHJMUTR2ZU41YTBDMHNnYW1hMGQ0bUJLcVkyb0NBUlpmTmt6bmoyUGNu?=
 =?shift_jis?B?SW1yYUtlSGxQS2Y3T0JHRTBTSDRZVDhzK01CaGVKRWUyVTRtRDVBRlFx?=
 =?shift_jis?B?eXpzOVVQbDg0QVFtcHhvQ1MwYTNKZmRGWndPVFFpdE55SDVPRmVOTm82?=
 =?shift_jis?B?VlFxUHJ1Q3lGZVFlVm0yT1NUVktITXRRQzNhMXdDVkxnb2g5Sm9LbGsr?=
 =?shift_jis?B?T3lTTng3V1VBcHRSN0psdllUWlhkSC9JRnl3WnUzNXpLcUR5Vkg1U0tW?=
 =?shift_jis?B?S25DOGdvU1dlN1RIbzYxUUhtek5sOUU5Sm53Z2dlUHMxR2tSRVU2ZnBz?=
 =?shift_jis?B?MGZhVlZaMlhNUUNFd3pCZ3ZleDFPaTRVOE9tSTB0K3RDditydnRKMmk4?=
 =?shift_jis?B?QTMxWnN2Qi9iQkwxYzFjbUY2d3BCemJoYkl4Q0NWQTl5QlBTaTRjOFR0?=
 =?shift_jis?B?Ui93bldqTDRENnJvMkNUYVMyWjZuQWU0V0lsQ1pHOUttQjZNVEhqSmFM?=
 =?shift_jis?B?S25MUjN3V05qRFl0STV2cWlFa0RYa3AwSGZjMWdzNEg0LzBaWHNhTnBz?=
 =?shift_jis?B?MmVHRWpDeG5seDd0d29GcHo0Y0tNdzRpdVhkSXFEVzI4eFYyTnI4d2Yr?=
 =?shift_jis?B?aHJ5MG5aYlI2NVp1SnVPRGFXMFhSQ3QrMG1sU3hNYkJpKzEzT05EajZ3?=
 =?shift_jis?B?SUtPZFJZWDd3MFZWbmRtZ09LYzVHV21OS3M3VnpkbXdGUzJmZ1pRVHVT?=
 =?shift_jis?B?cEpVcEQxb01XL0g5OS9WU21aN3UrVFBNa1gwcERkUVpyTVJGQVhWL2lY?=
 =?shift_jis?B?dG81UVo0WVhXOEFnSVlya0ZnRS8xbU13LzM5ZjIwcnhRZmg5eThqcE1O?=
 =?shift_jis?B?ZVNQNDIyQnhBSkJlZDJyZENLbjI4by8wZnc2VmVMbjJ0U1RWUGhIRDJX?=
 =?shift_jis?B?SUEyL2JKekwyeFhyUGZKZ2lEUzNva0NOclpmNzFKSDNwUDAzelBxUTF4?=
 =?shift_jis?B?RnpGU0VZcmZZWVBkUFA2UGt5WTlNOFdKVmllQktuOExhdHNQYzVBQ3R1?=
 =?shift_jis?B?MmNCQzNwVXZtOTkxK0JYZEdSeS9pYzNNSWVNZVhuVGtHeXNhbXcrd0ZD?=
 =?shift_jis?B?Z2F0ZnJVNk9sYVpkb1FCTVo4bnlIR1NTcUtKM2VKZ1JMdXJKOTA1emt2?=
 =?shift_jis?B?TkQzWmpXQWJXOS9zakViczZJZS9FeFpTeS9aMUJVWEV5K2xRUVkrZmQx?=
 =?shift_jis?B?TGJObUZLbUdrbjZKVGgwMmZOL21kVS9MTVNkcnpSTXRoSlp3VUd4UHRW?=
 =?shift_jis?B?M1pyWjE4K2tHTjVsajhWSGVkSkM2WjdVM3M5Z1ZlczArbkEvdHNIaVFW?=
 =?shift_jis?B?amJwbjJTWnBRRlZpbjB1NU1Ga1lCd1RqUG9aZGl2SnViRWpPVzVpbE1m?=
 =?shift_jis?B?QjA1WEVGRkMwUFF2MFZtWWIzT0wyMGN2UXBGRDd0Qi9YQ2s1Q3lEK1dh?=
 =?shift_jis?B?c0dTNFFQb3ZaMUtjaXJpdFRsZ3Nzb3kyTGpPbVhBRjFURVZWNnJqUG9z?=
 =?shift_jis?B?MldocFZSQU53VlZYakYzVm9sdVlxdDVyWXdQUVh6WFEwK1g0MTFzNWZW?=
 =?shift_jis?B?Q3c2RkZYbzFyS3UybFdHMTNZN2hWSm5acmFwTGs3OFVSN1h2QURUaTJU?=
 =?shift_jis?B?aFo4OHNtMzkwTTFSVTFONURwZGdRZktvVHBoWGJSMWdWbTJlTzRrNVlY?=
 =?shift_jis?B?WElOT1JxdXdmSDhIbG1FVDhaS2hOZDRwaUxKT1o1TFdnTXZkdjMxNUJ3?=
 =?shift_jis?B?dFJsU0c2SDlwZlZlRFFRWmdxdVRQZ1BXTklKc2J0bzVvT1hCRWdmaUdM?=
 =?shift_jis?B?cEtPV2pNU1ZYN0pCRUNsWlpmMDN6QUxsR3V6WlpHdUdHVWUwVWY5MTZL?=
 =?shift_jis?B?aWIwU3V0T2Vibi84cGhCWUYxaUptNVF3YjNxdU1EZ0hhUGNvNEJ6NzBB?=
 =?shift_jis?B?c0l6cS82dTlHa3R0TnZIMTJzakFGUFFNbEd1K3U3b2cxRWIyQ3BjbWEw?=
 =?shift_jis?B?NGcxeHNmcGF2bXZrTVMvMHQrV0Rhdk80YWpqWHRyVWl3VTJIMXpyWXd5?=
 =?shift_jis?B?Z0hmNHFWaXZBZzREUElMSitoaEZHTnJyNlFuUXBFR2hTRDJXSHRiaFFt?=
 =?shift_jis?B?TmxleGowM1ozZGUxQmFZd1c3WHZ5cDFrbHN3Rkt2V09zaUExKzFkMWVk?=
 =?shift_jis?B?UVlaTzVJLzg1R0Rmc1pLUUJPeDMvM084eGxvYXpySzZ1Q2l4THlJV3dW?=
 =?shift_jis?Q?Nf1H?=
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mE+Bb8JlDBqYSjogPwv/DVpBkqUMCTcU3yoQ7o47yEA41GGiBkwl6vnB6TsP8u8MWPNdEt0USOMnml4+wrmCB2Brx+ecWXsKYKglKkoWwbqKbfvh23vS5mNDrbFvueAXPwFa7PGecv+5hViUDRYQYwWncK7Thk1sCHJivN3uqu+GeuMptzzvukGpKxHju3ZEoLQ9au/0X3aggl40A1NORewu7C/rjHSKvDeL+/8/DVsjZNkRXeRCP7UnUeNNjEu1s7fGWQGfJr1+XsYtmObufqDRi1r12G32p+6D7a1r7pSiwZJJyhNS8x328JP0bww6EgMQXkk7CmECWvPx2ItTH78d73mqsJxO2bUQVWz6jfMt3VLty7Wt3b1yyc5B+RQgWfNRcLEcPLhQc5dZLt442v88tK3FybvamNX5qrEQq8m2u9eJk+dV/slyvRQzFwrnbD15TUs9tuzG1/M//3FBt4CV4MNp+C/KLxvU27OcFjDpECGL4LdI22FIAfVbVWQ3nToabOI3ck0bGTrE2hljk1Y/mjdQ93la4hDTU5IeuNhXSK4WmToQZe1QtpOARG5MdvHnDPHBqEmmPLK7zEK8tO86J1i07Y5hhIyobykGS5DExbDCrKZ2LURIlU3DVsYC
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe9a5f9-2875-4d77-3e60-08dc7ad4880b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 03:00:41.3661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v1TU5jfiPmcxJ1vWpHlUVSc2xZPQ9jBuyHFpMyhIxKfArUkxqd1xuMwrpdvSd+ohxViS0qbKrspoG685OYyntA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8528
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 03:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199777

SGksIA0KDQpBZnRlciBzeXN0ZW1kIGhhcyBiZWVuIHVwZ3JhZGVkIHRvIHZlcnNpb24gMjU1Lios
IGlmIHVzZXJzIGFkZCBhIHBhY2thZ2Ugd2l0aCBhIHBvc3RzaW50cyBzY3JpcHQoZS5nLiBnbnV0
bHMtZmlwcyksIHRoZSBmb2xsb3dpbmcgd2FybmluZyB3b3VsZCBvdXRwdXQgd2hlbiBleGVjdXRl
IHN5c3RlbWQgaW4gdGhlIGZpcnN0IGJvb3QuDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kcm9vdEBxZW11eDg2
LTY0On4jIHN5c3RlbWN0bCBzdGF0dXMgc3lzbG9nLnNvY2tldA0KKiBzeXNsb2cuc29ja2V0IC0g
U3lzbG9nIFNvY2tldA0KICAgICBMb2FkZWQ6IGxvYWRlZCAoL3Vzci9saWIvc3lzdGVtZC9zeXN0
ZW0vc3lzbG9nLnNvY2tldDsgc3RhdGljKQ0KICAgICBBY3RpdmU6IGFjdGl2ZSAocnVubmluZykg
c2luY2UgV2VkIDIwMjQtMDUtMjIgMDY6MDY6NDEgVVRDOyA1bWluIGFnbw0KICAgVHJpZ2dlcnM6
ICogYnVzeWJveC1zeXNsb2cuc2VydmljZQ0KICAgICAgIERvY3M6IG1hbjpzeXN0ZW1kLnNwZWNp
YWwoNykNCiAgICAgICAgICAgICBodHRwczovL3d3dy5mcmVlZGVza3RvcC5vcmcvd2lraS9Tb2Z0
d2FyZS9zeXN0ZW1kL3N5c2xvZw0KICAgICBMaXN0ZW46IC9ydW4vc3lzdGVtZC9qb3VybmFsL3N5
c2xvZyAoRGF0YWdyYW0pDQogICAgIENHcm91cDogL3N5c3RlbS5zbGljZS9zeXNsb2cuc29ja2V0
DQoNCk5vdGljZTogam91cm5hbCBoYXMgYmVlbiByb3RhdGVkIHNpbmNlIHVuaXQgd2FzIHN0YXJ0
ZWQsIG91dHB1dCBtYXkgYmUgaW5jb21wbGV0ZS4NCldhcm5pbmc6IFRoZSB1bml0IGZpbGUsIHNv
dXJjZSBjb25maWd1cmF0aW9uIGZpbGUgb3IgZHJvcC1pbnMgb2Ygc3lzbG9nLnNvY2tldCBjaGFu
Z2VkIG9uIGRpc2suIFJ1biAnc3lzdGVtY3RsIGRhZW1vbi1yZWxvYWQnIHRvIHJlbG9hZCB1bml0
cy4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQoNCkkgZm91bmQgdGhhdCB0aGUgb3B0aW9uICItLW5vLXJlbG9h
ZCIgaW4gcnVuLXBvc3RpbnN0cy5zZXJ2aWNlIGNhdXNlcyB0aGUgaXNzdWUuIFN5c3RlbWQyNTUg
bmVlZHMgdG8gcmVsb2FkIHVuaXRlcyBldmVuICJlbmFibGUvZGlzYWJsZSIgdW5pdHMuDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCnJvb3RAcWVtdXg4Ni02NDp+IyBzeXN0ZW1jdGwgLS12ZXJzaW9uDQpzeXN0
ZW1kIDI1NSAoMjU1LjReKQ0KDQpyb290QHFlbXV4ODYtNjQ6fiMgc3lzdGVtY3RsIC0tbm8tcmVs
b2FkIGRpc2FibGUgc3NoZC5zb2NrZXQNClJlbW92ZWQgIi9ldGMvc3lzdGVtZC9zeXN0ZW0vc29j
a2V0cy50YXJnZXQud2FudHMvc3NoZC5zb2NrZXQiLg0Kcm9vdEBxZW11eDg2LTY0On4jIHN5c3Rl
bWN0bCBzdGF0dXMgc3NoZC5zb2NrZXQNCg0Kc3NoZC5zb2NrZXQNCiAgIExvYWRlZDogbG9hZGVk
ICgvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9zc2hkLnNvY2tldDsgZGlzYWJsZWQ7IHByZXNldDog
ZW5hYmxlZCkNCiAgIEFjdGl2ZTogYWN0aXZlIChsaXN0ZW5pbmcpIHNpbmNlIFRodSAyMDI0LTA1
LTE2IDAyOjExOjE3IFVUQzsgOG1pbiBhZ28NCiAgIExpc3RlbjogWzo6XToyMiAoU3RyZWFtKQ0K
IEFjY2VwdGVkOiAwOyBDb25uZWN0ZWQ6IDA7DQogIFByb2Nlc3M6IDE5MyBFeGVjU3RhcnRQcmU9
L3Vzci9iaW4vbWtkaXIgLXAgL3Zhci9ydW4vc3NoZCAoY29kZT1leGl0ZWQsIHN0YXR1cz0wL1NV
Q0NFU1MpDQogICAgVGFza3M6IDAgKGxpbWl0OiAyNTgpDQogICBNZW1vcnk6IDU4NC4wSyAocGVh
azogMS40TSkNCiAgICAgIENQVTogMzg5bXMNCiAgIENHcm91cDogL3N5c3RlbS5zbGljZS9zc2hk
LnNvY2tldA0KDQpNYXkgMTYgMDI6MTE6MTcgcWVtdXg4Ni02NCBzeXN0ZW1kWzFdOiBTdGFydGlu
ZyBzc2hkLnNvY2tldC4uLg0KTWF5IDE2IDAyOjExOjE3IHFlbXV4ODYtNjQgc3lzdGVtZFsxXTog
TGlzdGVuaW5nIG9uIHNzaGQuc29ja2V0Lg0KV2FybmluZzogVGhlIHVuaXQgZmlsZSwgc291cmNl
IGNvbmZpZ3VyYXRpb24gZmlsZSBvciBkcm9wLWlucyBvZiBzc2hkLnNvY2tldCBjaGFuZ2VkIG9u
IGRpc2suIFJ1biAnc3lzdGVtY3RsIGRhZW1vbi1yZWxvYWQnIHRvIHJlbG9hZCB1bml0cy4NCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KDQpBbmQgSSB0ZXN0ZWQgYnkgcWVtdSBhbmQgb24gUEMsIHRoZXJlIGlz
IG5vIGlzc3VlIHRoYXQgbWVudGlvbmVkIGluIHRoZSBwYXRjaChmZDI2NmIxYjY2ODQ0ZDY2MGVi
ZDhlMzNmZTIyYzA4YzhkZGFjY2JmKSB3aGljaCBhZGRlZCAiLS1uby1yZWxvYWQgIiBpbiBydW4t
cG9zdGluc3RzLnNlcnZpY2UuDQpTbywgY2FuIEkgc3VibWl0IGEgcGF0Y2ggdG8gZGVsZXRlIHRo
ZSAiLS1uby1yZWxvYWQgIiBmcm9tIHJ1bi1wb3N0aW5zdHMuc2VydmljZT8NCg0KQmVzdCByZWdh
cmRzDQpMZWkNCg==

