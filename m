Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF0FD74ED3
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 13:37:19 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67966.1769175432634267011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 05:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FzsIKUOB;
 spf=pass (domain: siemens.com, ip: 40.107.130.9, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9gS+Fgu8h8ypV+vdPuv3CjMTHd48oUJwPmzIB8GyfI+dLgN4zxv+Ob56v5tujsO2ROjiAD+CwHXohAWEmLZ/eUwyTym89o6wx0FdsZvB6gK+a1R/LfYGeNbjE2Bmr6OHjCyWr6SruYpjmIqgOlXXbuxWXoCMk96Q9rw1QyJ4biRrsWQqMsXjZq2h7NStvy3Z2TIE/KKnCrrHlOyY8aMCyZ/5QIL5K/DPEv5OIIdVfCc4GXcyKpge0GHSVb/wmd5dCuon2R/LlezCIM87GBbGqkA6myXON2lZWyEtDWTf/xfSYDerA1beSa8W4T8IWAFc0ahXMZVS8NgM3G029huow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKV/fjMI+rTbOh05DVi4+3X3h+c8Dqg9mcQy8Biac+Y=;
 b=S3pMz42WlLBHqvcb8CwD5t3Rt6wVDKEx4bCBxHzxYHMY0V8FiK9EANEkZ1RXcpiB0h4S+VZShOIZ7nR7pnfdLBc/IS67Pr3nz7ZDSb6bywoTzz7YvDR1GGgVqJ2bGkRPN7NCuWtOWunaaA7s6Mweb7ehiYcrSSAZvro9ZOVkgvPDEEE+9lXO+xDVIcBa1GEBKNAntI+qGgsP5EiK+ooa25FMR+EgMVe5P3FszmNcJndPcBa6T/KIqDB+zIgpaMqPJcZf+Z3zT8O/n6i5WTuQbkDfmF863O1+j3FYy2xlPV0hxMS1WmcS8Si5bCmgPLlhd340Cm+X6uushDOxS47fDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKV/fjMI+rTbOh05DVi4+3X3h+c8Dqg9mcQy8Biac+Y=;
 b=FzsIKUOBtBFqYsuMEliqWcryNNewcX3SytPeawOZUmdYq7XvjkiG9tEXka7Vo+1qAVBSPOTl7K5lAHah6uHamK0/etavFOKyiQOPitq2NC0+x8+edkoAwxMu+y3LZl8O/oyyqHsC4ohR4l8JhsycXMQI4qN3LKW2UR8ZiQ23vSpUY8XJMnDjWalqcDS17vY6OwXz30aaiCR9sc38sShMchTq5M3ScqU+w6/bblhNqZzs9xW4VANqNnq/ZlT6oqoJW2qjrmu7jm9h2QB+BXCQEDqLTmFyxWesvUq2OuH6mXRDO9i2QSjcgzCu0twI2Z620RufjXSH6lxmUgmZBvsp6Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB9126.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 13:37:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 13:37:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing
 multiple INITRAMFS_FSTYPES
Thread-Topic: [OE-core] [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing
 multiple INITRAMFS_FSTYPES
Thread-Index: AQHcjGrEiOhl5/CDJ0eBEbKbvgnAobVfvblQgAAD0ICAAAAywA==
Date: Fri, 23 Jan 2026 13:37:08 +0000
Message-ID: 
 <AS1PR10MB569760B5B4D67E595F633FD4FD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260123131814.586417-1-dmitry.baryshkov@oss.qualcomm.com>
 <AS1PR10MB569720FF73A415EC84069B29FD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAO9ioeXzRQPwVb3j23FcXQE4OYZkf9JETKmg4iui5UPmWF+MCA@mail.gmail.com>
In-Reply-To: 
 <CAO9ioeXzRQPwVb3j23FcXQE4OYZkf9JETKmg4iui5UPmWF+MCA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=843fe41f-bdb1-4142-b765-0d521561d248;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-23T13:36:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB9126:EE_
x-ms-office365-filtering-correlation-id: 6c84cd13-d11d-46cd-071e-08de5a84813a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UXdNR1VzK1NqOWtRUXNiR3FlL1RzU3h5M2liMS9nRnY0Q2ZGR3JTbS9jVU9o?=
 =?utf-8?B?WlUrd0hpS2ZSZjJtbVFiRGpRNWdHNEo0Y0lmT0ZNbi9EaEpBdFRua2c0T0Np?=
 =?utf-8?B?RmJhV2ZVREh5NkowdjB4MDdIQ3hoay9DWkU0VFVpa1VteUE3TS9iaGhPOXA5?=
 =?utf-8?B?Z0RyaWpDdG1KOFVvZCsrOFFoM2p0cEU4a3d3UVQxSDhjV2ozT1UxOFZlZVZz?=
 =?utf-8?B?OWd0SGo4WHVPQU5odXlyN1RVdlp4QjdkakhwSUFKYUhXZ1NIVDBGcHZQVysw?=
 =?utf-8?B?amFWSldjMDVueWFwSkl3bjN2aCtLczBJTWVBRE9LMzNxb1JON0pGN3JZM0oz?=
 =?utf-8?B?cXVEL3gzSElzaWkwZjlkbVk4VzB2dzZRdVY1WXd4cGoyTVVSa294UUJkZTJE?=
 =?utf-8?B?UzFBaEp4TFVnYUZoR0pNZE1DK0NuR2hBK2ZDUFdZek1wN3VabWllVVNpOTlV?=
 =?utf-8?B?bXpjelFGck5za1VBc2NWR05oWUdBL3hkVm1kRnBBY2p5Q2RueCt6ajYwY01K?=
 =?utf-8?B?ZnJZbXUvNEo1UWVpRVA5c1JCZVpQc2N1Z0J1NzVVeXRhamUwaGtXZ3EyWTE3?=
 =?utf-8?B?SmFlUGtoU1lmNXgwdnZNQjFTd3pmbmgrckJvRlFmM2M3SE43SjV1RDRPUHBO?=
 =?utf-8?B?b3lFakY1KzZGTVU2Zk9QVzJHSXpMTGFWTTRhd1BoeFZ0VmRwT00yRmZnQUlG?=
 =?utf-8?B?RVlmaVFGeHY0Z3EraGdWd0lQdmt4UEZpdER5bmlvZXREZnNsbHVSeTlrdEwr?=
 =?utf-8?B?MWVNc0RaczhaUXQ3dzJpelM4V3RlREUzYUNqK0E2R2d1OEU3MHV4MDR4R1Vp?=
 =?utf-8?B?bzVmRjdZV0tTRlExRFJHbnpaT29WS01ETEJsYjVyZWVpMVZZblBPeVJkSlM2?=
 =?utf-8?B?K0dzdUM5b2dSZ1c2M1lBRmZWY2t2SjFVOEUxSDc1UDRWTm5PYm8rbERNWEJC?=
 =?utf-8?B?Mitjd2JXRjY2cVYzdTJBUG1paXlYSTNxeElQWnZ2czlHUk82WlVEaUZFVFdE?=
 =?utf-8?B?QUljTmJpVG4xN0NYeTNmTFBPRkRUMlNFc1NYQjZxSzdHUEx1N2FuUzF4MHhI?=
 =?utf-8?B?MS9yV0VUTFl0RDhzY3ZjcXlUU0RUVGMyMDZmTVk2M1pCM1FEMzVhM1Yrc2U5?=
 =?utf-8?B?QUs2YjEzVkR5RzBHRURxTGdZUnhEOTgwdVdIc3VxbUszUldhY2FHL1pjOExJ?=
 =?utf-8?B?V09MZzd2MGVoQThCYnRIeTBHRWhTcUhQOVhxcGZ2QklCV2lMWW5XZGM2OXVz?=
 =?utf-8?B?bmlhSEVRR29RMFZOY1pRMnBNWEFlQVpBR3ZLQ1NUQkRaTDN0YWxTTUhMZVo5?=
 =?utf-8?B?aTdQbldhdE5xYjRma0dQKzRxMFB4UjFXazJyOGFkYVBzL3V3RXJOY2tHemZY?=
 =?utf-8?B?OThkTkFqOHJ3amF6TXAyNUwrSzlCRG5oM1ZVMGd5SVE2dzZab1Z4eVJLV2lk?=
 =?utf-8?B?TEdGVk52Ri9PN0d3bmpNRjQ2NS91S1VQd0ZnUFR1M1VHYndIdlNVYlVWSGhE?=
 =?utf-8?B?UFBPdVI2cXdvZ0FQbVRGU2wva1dxTzdvNHBWSzVja05WdG15ZG53L2xrekFp?=
 =?utf-8?B?UHQzMndScTFobG1YRW5tdEtqZ05WdHVsczkvVGx5N3pVekg2V2FnUmEzT3Z1?=
 =?utf-8?B?YkJNNysyc2g2dTZIRGMzZ3lhMVdnSUJMeHkxRkVjNG1HV0hseFhvNDh4MTdm?=
 =?utf-8?B?dG5PUW5naWtMeFUyY3RJTHdUMGgvTW9WdXAydXBhcDE4UjQ1dVQzcmgveXMz?=
 =?utf-8?B?a2dXQUNFU000NDNQbURLMnlTdEdEdzBBTTJhejEvaGpLd3Bjc3Nqbi9BL1lS?=
 =?utf-8?B?T3BLQUtkWFBIQnhMZkVCeXo2T3U1VWFmWmhxL0VDK2Z3MXoybnhackd5bGdp?=
 =?utf-8?B?dEl5bFBEMFNIUE53eExZYU9jRUpsc0JqTjBNcjliWDU4aDJxYWU4WG1hdGFD?=
 =?utf-8?B?b0dWOGdHbElIZFdpTWdERnBqencycFRWbWtTc28zaGlDNnhtQ2xyMm84WFZP?=
 =?utf-8?B?WGNCUkMxVUpSWEZwUFZlRFhydml2L0ZuYzF6dHUvNnBnVzU1MXdES29kc3Za?=
 =?utf-8?B?TkluamVRVElFdit5SHFPQ2hqaDc1NWw1cTFOTEVhUExmVldNVTN5VHdBR0hh?=
 =?utf-8?B?RHBldGdnbHZwdjVMRGFWUTZWMnB4eEY3L01WSHZ5Y1hqTHpybUN2eERyVXZx?=
 =?utf-8?Q?H5ZsOZJGPTWllY0YYtk7w1E=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bWdZODV1ZkFLcm03bkhxZ1I2d2dPNVN2cXhUVHpCOTRLNGF1eURqbmIrd2hJ?=
 =?utf-8?B?NzVTZlRlYnZtWXczT05jY3NzKzFqYmdCdEU5REpQdk9YYTV6QUxDV1pTSWRG?=
 =?utf-8?B?NGlKTlRScUM2YkR6dngwaVJCL25uTUNSSGt3TjN1NnNEQmRxSjlTZ1NHU3gw?=
 =?utf-8?B?YlF2NGl3ZHh6VjV4dlVOSjBGaFF0NmNidFFMMStwRmtrM1VZUzVMb1pGR3lP?=
 =?utf-8?B?cFlML0hYUnpEeXlxdWVrOUVLc1FGUjV2bUYzTzVMZnhHTy9SeDQrVjBaaVV3?=
 =?utf-8?B?YWV0WWhhcmp6TzVUdHJUQXpqMklwUFVyam40RDJlZjJGOVhCN2VVWHNBNVQy?=
 =?utf-8?B?M29rY2F3S3dUL2F0a3BkWjdIQStnQnJoWExVK0tEOU1lTHptS1NEbmlKN1Z6?=
 =?utf-8?B?UUpjRENNbWZlYnhxTnZUZVdxNG5jTWZLMDhMcWtJajNZS0F3TmRVMHU2dVI5?=
 =?utf-8?B?NGRYMmpvbWpFUUNrVUZkZ3hObW5XdFRlaWtiUC9wQzcwa3JrR3VXZHVnRFFr?=
 =?utf-8?B?dmpXQTlJOGJxdVBjbllNSHR4aUFFUGRQUVJXeTBUeHVKME5YczNvSldObkdw?=
 =?utf-8?B?c1FRVW9zdXRmUmswR2srSVFmOHcwMHN2dzNzQy9PemZtQkpCbDJLWEVZeC9O?=
 =?utf-8?B?cktNdVg0NG1LNUlqMllHTXFrRDhEZmlDY2UwTTZ2MlE2eWRWanB4Znd0OVcr?=
 =?utf-8?B?dFhLVTE5bis0NGREL2hQQnBBS3BlbHVEaUtqWkdSTFVHUDQvcWw1N0h3eUVG?=
 =?utf-8?B?YVpVOWRsa01qdlFPQ0FJcFlXMWZYTjlnYkovZ2hWUlZkTlhTUmtNd3lPZy9z?=
 =?utf-8?B?SkdPSmxaSExlb0F3bzRHQWl3YzhEa1FWRXVSdjFNeFpDMnQ3U3UyUXNzdEFG?=
 =?utf-8?B?OHNzWlBwRzdzN0JlS2JQWlhyMHZ0N0QvaEo5VnpGRG43TVVGemJnb2ppOHds?=
 =?utf-8?B?SGJrK0txK2R5N2V1b1JiWGF5MTdaQmRSM1FwR1hGR1BEZStaM1liUjRHdFVj?=
 =?utf-8?B?MlpnM3I1bzRNK3ZlR1FUc20xT0I1UkRQeXJ0Wk8wZGZPWXBDK3BWRGprUjBI?=
 =?utf-8?B?d1hjcVIvWEMzV0NQNFlvbkpGVlQ0Y280bkpnbjJVOGhXYW9jakhaZXJESm15?=
 =?utf-8?B?Vm1LMlJWekF6SEhoWTZHUFZxRVpKT3pQdzRET3FsTFg5MEp6Q2Rad0g4di9x?=
 =?utf-8?B?eHRIbGMzU1JSSGt3MUFFM1NrZk05TTlGN2JNNFdtYnhjdVJ2cmp5V0NsSkd1?=
 =?utf-8?B?S2l2U1dNdHJ5Y2dGOWdyVzdydU5LbS9xMURTVjFtRm5iZFlCVndqWXVLQVE0?=
 =?utf-8?B?ZTlxaGtxU1FTT3M0YU5icHlreVgyUlg4emRrNW1IbmRVUVFVKzVSckZrUkF6?=
 =?utf-8?B?WFl1Y2EyaENDclFhbTZHZ0xVTzNJWGp4c0RhK3AzbVFjOHZjRFFicGU5cGY5?=
 =?utf-8?B?T2w4eEZwVG82dEVqT1h2dERLamMyZ3RCWGNRMXlmVXdnY2ZIRUpqQTNsTnJy?=
 =?utf-8?B?aTBaZDdnd3h3NFVjNHpXN09VYzZiREhtcXhBbFRKMUd1Q2RVakh6YmpzZ0to?=
 =?utf-8?B?WGZ6d3U0Q05kMlBWUjlFSVVZUVpueXBoNFBsYTRFRzI3YzRPV3hyNjZWRWtx?=
 =?utf-8?B?QTVJWTg1bXhKSi9NdVZOMXhId2U0UWQrWk5QendRNmRhWGpxejNjYVVMdzFY?=
 =?utf-8?B?b2lNc0ZjTy9UOFJZVXV2MFY3ZXYyTHZCMEtOc2FpeFlONVVYT1krUzRwUndK?=
 =?utf-8?B?OXJ1bTRBNnZ5U1RJblpCS2tTb1NPY3ZldlJrV0E5RVpTQUV5WDJWOXVVU1oy?=
 =?utf-8?B?QWlqL3o2bDFBZ2JmQzJKMGMwYmZ1Vm1yeVNSVDNEV0NnV1FhVzRXN1Q1Sk8x?=
 =?utf-8?B?bVI0YXYra0V2aUR3dW9WVGNiSEVCcVRtb3Bnc1FxemMvMWdldWlFclJvUGVP?=
 =?utf-8?B?T0pFRlV5UENORHJQUFcycHVaS0ZOaTMyeVd1WXRWUFNtSVYyQytrRklVUkZh?=
 =?utf-8?B?R3NVOTNqV21XSUZYek40ZGtycnFMdE1qRTQybGJDeVE2b0V2V1JjdFEwdlkz?=
 =?utf-8?B?eVl2WHFxd3VpY2pvTEFGOFI3NlJEYWNFWHRzZ1RUenkrWFl2VW9wN3hzaTRw?=
 =?utf-8?B?aG0raDd1TG5BUXFwajBIR29RNHVqdFZiZXBHRkt6VzlrU0JNRmFpY2hYQ3Jo?=
 =?utf-8?B?blFMc2o0Q1VRZTRxQlc1eE9JVnJneUhxU2d4VlV6WUlmQVNOZmtKTkc2Wkor?=
 =?utf-8?B?VU5Eb29iNGNRa1ptbXptWmF5cm03MzVySDdZLzVROFF5Sy80cUt2Q2lTc3VR?=
 =?utf-8?B?dGh3ZUo2MlVpNE9kek5Vak1iZWVpSVlXdUJYSGdjSUtjVFZFWHFwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c84cd13-d11d-46cd-071e-08de5a84813a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 13:37:08.2881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EKIdkEOVPNmcrWlOQMrK8yC97d6WUp+BCYh7h+a7DZwqUdDzOuSiy2o78xTPeIvey7nFDU1O/FDnFvEqYFfLbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229891

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBEbWl0cnkgQmFyeXNoa292IHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyMywgMjAyNiAxNDoz
Ng0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVt
ZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjNdIHVraS5iYmNsYXNzOiBkcm9wIElO
SVRSRF9BUkNISVZFLCBmaXhpbmcNCj4gbXVsdGlwbGUgSU5JVFJBTUZTX0ZTVFlQRVMNCj4gDQo+
IE9uIEZyaSwgMjMgSmFuIDIwMjYgYXQgMTU6MzIsIE1hcmtvLCBQZXRlciA8UGV0ZXIuTWFya29A
c2llbWVucy5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gPiA+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gT24gQmVoYWxmIE9mIERtaXRyeSBCYXJ5c2hrb3YgdmlhDQo+ID4gPiBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+ID4gPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMjMsIDIwMjYgMTQ6MTgNCj4g
PiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBT
dWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIHYzXSB1a2kuYmJjbGFzczogZHJvcCBJTklUUkRfQVJD
SElWRSwgZml4aW5nDQo+IG11bHRpcGxlDQo+ID4gPiBJTklUUkFNRlNfRlNUWVBFUw0KPiA+ID4N
Cj4gPiA+IElmIElOSVRSQU1GU19GU1RZUEVTIGNvbnRhaW5zIG1vcmUgdGhhbiBvbmUgZW50cnks
IHVraWZ5IGJ1aWxkIGNvbW1hbmQNCj4gPiA+IHdpbGwgZmFpbCBhcyBJTklUUkRfQVJDSElWRSB3
aWxsIGNvbnRhaW4gZXh0cmEgc3RyaW5ncy4gRHJvcA0KPiA+ID4gSU5JVFJEX0FSQ0hJVkUgYW5k
IGhhbmRsZSBmc3R5cGVzIGRpcmVjdGx5IGluIGRvX3VraSgpLCBsZXR0aW5nIHRoZSB1c2VyDQo+
ID4gPiB0byBzcGVjaWZ5IG90aGVyIGZzdHlwZXMgaW4gSU5JVFJBTUZTX0ZTVFlQRVMuDQo+ID4g
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtv
dkBvc3MucXVhbGNvbW0uY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgbWV0YS9jbGFzc2VzLXJlY2lw
ZS91a2kuYmJjbGFzcyB8IDUgKystLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2Ns
YXNzZXMtcmVjaXBlL3VraS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS91a2kuYmJjbGFz
cw0KPiA+ID4gaW5kZXggYTJiMWM4YTgyZDZmLi5lYTQ0OTU0MGRiNjYgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9tZXRhL2NsYXNzZXMtcmVjaXBlL3VraS5iYmNsYXNzDQo+ID4gPiArKysgYi9tZXRhL2Ns
YXNzZXMtcmVjaXBlL3VraS5iYmNsYXNzDQo+ID4gPiBAQCAtNzMsOCArNzMsNiBAQCByZXF1aXJl
IC4uL2NvbmYvaW1hZ2UtdWVmaS5jb25mDQo+ID4gPg0KPiA+ID4gIElOSVRSQU1GU19JTUFHRSA/
PSAiY29yZS1pbWFnZS1taW5pbWFsLWluaXRyYW1mcyINCj4gPiA+DQo+ID4gPiAtSU5JVFJEX0FS
Q0hJVkUgPz0gIiR7SU5JVFJBTUZTX0lNQUdFfS0NCj4gPiA+ICR7TUFDSElORX0uJHtJTklUUkFN
RlNfRlNUWVBFU30iDQo+ID4gPiAtDQo+ID4gPiAgZG9faW1hZ2VfY29tcGxldGVbZGVwZW5kc10g
Kz0NCj4gIiR7SU5JVFJBTUZTX0lNQUdFfTpkb19pbWFnZV9jb21wbGV0ZSINCj4gPiA+DQo+ID4g
PiAgVUtJRllfQ01EID89ICJ1a2lmeSBidWlsZCINCj4gPiA+IEBAIC0xMjcsNyArMTI1LDggQEAg
cHl0aG9uIGRvX3VraSgpIHsNCj4gPiA+ICAgICAgdWtpZnlfY21kICs9ICIgLS1zdHViICVzIiAl
IChzdHViKQ0KPiA+ID4NCj4gPiA+ICAgICAgIyBpbml0cmQNCj4gPiA+IC0gICAgaW5pdHJhbWZz
X2ltYWdlID0gIiVzIiAlIChkLmdldFZhcignSU5JVFJEX0FSQ0hJVkUnKSkNCj4gPiA+ICsgICAg
dWtpX2ZzdHlwZSA9IGQuZ2V0VmFyKCJJTklUUkFNRlNfRlNUWVBFUyIpLnNwbGl0KClbMF0NCj4g
PiA+ICsgICAgaW5pdHJhbWZzX2ltYWdlID0gIiVzLSVzLiVzIiAlIChkLmdldFZhcignSU5JVFJB
TUZTX0lNQUdFJyksDQo+ID4gPiBkLmdldFZhcignTUFDSElORScpLCB1a2lfZnN0eXBlKQ0KPiA+
DQo+ID4gVGhpcyB3aWxsIGxlYXZlIG9ycGhhbiBJTklUUkRfQVJDSElWRSB2YXJpYWJsZSBkZWZp
bmVkLg0KPiANCj4gV2hlcmU/IEl0IGlzIHJlbW92ZWQgaW4gdGhlIGZpcnN0IGNodW5rLg0KDQpT
dXJlLCBzZWxlY3RpdmUgYmxpbmRuZXNzIG9uIG15IHNpZGUuLi4NCg0KPiANCj4gPg0KPiA+IEFk
ZGl0aW9uYWxseSwgSSB0aGluayB0aGVyZSBpcyBwcm9iYWJseSBpc3N1ZSBpZiBzb21lb25lIHNl
dHMgbm9uLWRlZmF1bHQgdmFsdWVzDQo+IGZvciBJTUFHRV9NQUNISU5FX1NVRkZJWCBvciBJTklU
UkFNRlNfSU1BR0VfTkFNRS4NCj4gPiBJc24ndCBJTklUUkFNRlNfSU1BR0VfTkFNRSB0aGUgY29y
cmVjdCB2YXJpYWJsZSBoZXJlIGluc3RlYWQgb2YNCj4gJHtJTklUUkFNRlNfSU1BR0V9LSR7TUFD
SElORX0/DQo+IA0KPiBJdCdzIGEgc2VwYXJhdGUgaXNzdWUsIHdoaWNoIG5lZWRzIGEgc2VwYXJh
dGUgY29tbWl0Lg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg==

