Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F7CC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 21:34:33 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.52])
 by mx.groups.io with SMTP id smtpd.web10.100443.1738618468871709420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 13:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=BjKqAYgl;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.52, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFCf3bq9NH56gNUqcOkZE4pp0aKWNRg+uQnN7BthYN8Wiw1KXDLiyPdWgXO3Dh36KJHcr/SCn3SpGzkPwtOrjPVUaEvOhRNEu/8XrrQ4PZ7OwmNk5dECpp/r1oZCJ7r60DAbt7sdit4NjKWiG8JDiXTOPIqJkoPTs7zRgzfcAxHwHXDNiHgZ+aqAjiLVWEY4IqpFsrQ4kGEjbs9bIpFLIsYJoO3Q4zAxr6b+XKrcoxMM3tvRVeKXm0ZPJ7jU8rbOUY9nuO6YkYp61clh7OoNAzasyYPDbLHj9GTEBglOuiYYaLt0kip1PpoG1GXxlamJr5q6uclEei6fqIEBJIA68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbG+rGBSXtSOK8qIdLQ9Pjm6nhWlD6iGmAEgyYdfRnw=;
 b=hTRjyG8cNvH6VtG6GcJb/ITpe7Gn1ib+7jtB3STk0cbgHrqPobOQB8jjd1+b9Kgnt9rWGr4LJcNT3AuOWI9fsDzhbItLvDIet2BxLdo45cKEnwYryVyF+Mikpw8xSEWNmHry7xfS5M4qSj3xdCSrRZS6+/i+TKrSHPM4dX6F7mr1rO2B9ezNfw6jD522fhBEyVgtGtLYVUO5ZP9DGM9dHRAg0bwQvSCpCA8a8P/pMWD1pNtjU0WWim+uQ+tubhrnfmcDW7KjftirqdlCPoZfDTce9N8vCy6wXp1IvE9p5MsXdpEU1Rc5etgweEluRtzI2V5zYpuOBmOwsP4IF6xlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbG+rGBSXtSOK8qIdLQ9Pjm6nhWlD6iGmAEgyYdfRnw=;
 b=BjKqAYglpZrbCcLcU51Dp5Vj40COisrqhXds/wwAgeS2cRW/I/f3syQpB73b4myROFTi+n8+pGzo2BT4fpzsSIU0jrDt0PU6B8wwCXn5ul356pIhRgTyugU/jCZpl4eeKNI/KkdESC0tfJucFT4aUQNKYY0w7sdPCbjDPp+c3wb/Zgwy75i/HIcWfljcaCXBEh3GGcPezRMkskCKkbrXFHWg99pdZXAb3qYXAdn8iK128DCWV7cjahyDxoXKxRlt9PnQP4Z5ODlKfEmykrvJIVsH1JxTkfPm+QqvDYcdWMjhzSp5UTKvmieyxmTBrZ8nxAyz6athISAcNQ1ux+5Ibw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 21:34:25 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 21:34:25 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "Openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Strange behavior in sstate-diff-machines.sh
Thread-Topic: Strange behavior in sstate-diff-machines.sh
Thread-Index: Adt2e2zuDqfbEJfWRDSo3WEf7sDerw==
Date: Mon, 3 Feb 2025 21:34:25 +0000
Message-ID: 
 <DM8PR12MB543086C50EF71EBADF83E63D8BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=1674333c-d43d-4618-9ef5-1f41b4a49d3e;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-02-03T20:34:11Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SN7PR12MB6715:EE_
x-ms-office365-filtering-correlation-id: 7c7175ac-3eba-4cf0-dc70-08dd449a87e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?WgbQ4wZjP4lFYttd6j8ZwaxQcuntKNsLFuPqNjUHc0xtoPUolHrl0QNEqQFv?=
 =?us-ascii?Q?cAJK1r77THuHxrVJW4Q0PlUMERKfXw0WC4kef6A2zD1dxpX8pK22cRBHuGYm?=
 =?us-ascii?Q?G+yUd/YyN4Yiuzshp6J6c4ixkDzpOR/V+lGAkKi4GStXsUvG5l6XMIzKHEXq?=
 =?us-ascii?Q?bmrbkMq6UQyQihcmqduF7WpRWSXbKBBoET4NRyhqKu+K5BvfJ152KVTA771G?=
 =?us-ascii?Q?2J99zSOhy54SdY2UDBJd6wHjNW8bi35e1bUf32mIxTMIzBV3u9ePMHcgZvm+?=
 =?us-ascii?Q?yVOrhlGii6CEqQcoENd7OYcW0gHOWKeSIJ9ODRfU2/7HKk28Ai7QHdjGMjBz?=
 =?us-ascii?Q?jX6HMtrlcpMrs+Bx/Vmy8PFdn0Pp0cwmAZxiACOL1lYhDng7BKiLAhvxO0Jg?=
 =?us-ascii?Q?wo5Z+JXDoSfFZWzYZMxm1fAMvALZd6tUpT956iA1xahuvZnVP8JCUbDsvOcj?=
 =?us-ascii?Q?/dNYJ3KKf2jdPjIrxgh2M0nAgJvj4co5h+FPUPQYDJagwY+hUIw8XEf3jM0/?=
 =?us-ascii?Q?sLzJ0oKB/8B8ENVqZq6i/cdKymG1jKP0VzuLGiCzjqFnidASBI5DngvJVXey?=
 =?us-ascii?Q?1goSokINotni+ucbp3svIogkaPW1ICNtrZF29QyDCBGHgO65TrMVvd2ynnoz?=
 =?us-ascii?Q?B8EW12iSVdSznWlq9/a9xkPc25D0xS+BHhD4vH6wArQU8xy3ATmkygjn/5E0?=
 =?us-ascii?Q?qIRGwlSbHYY5RtA/7zaR049ofROtT8Lwz3QmnLIXUG2V+KrJOC2+pNWwZCim?=
 =?us-ascii?Q?NP85ovWbH7MTfaOzhj9dtKrXbvufEV8K9ekB9pOgbFnAFoEVvsO6hfbxg8Nz?=
 =?us-ascii?Q?xwbhL6mRQuvzQNQ5Q7AwN3j2FerBvhWPO0u/dMTVmSJiFQUG5WnzCoUUOeVy?=
 =?us-ascii?Q?wp765lEdROkiOvH4DOlYBm56JNB9dbYFDHnsrR2VqCA+VCDD+R3qkYgSRRsk?=
 =?us-ascii?Q?uY1AfSQ7skNgjXl9pBg/ZU6vLSArcBPYysHlJbBa4dsujcH5e7S5p6idlQYe?=
 =?us-ascii?Q?s9F77oqeyxTWcbFFCGTC5gMSvvtMrZbDmpsSxWPo4rHt4f93p5P/4wixg+++?=
 =?us-ascii?Q?gugbsLyuSGpoN0LdJGrz5GF5vRDSClz+sAIvsse+M77AtpiQgdHGwqc/DUux?=
 =?us-ascii?Q?pLwB//Db4SIDT5L/9cigSQU6I+V6j0FAn8qm010P1kxk+7HfPYXuyEBXkDEi?=
 =?us-ascii?Q?zlul/uJhT8HdJoDlJq7W0FpZJ/uB+7YqbPMpzZTn86TkHZL8Fr7JVF8l2Dye?=
 =?us-ascii?Q?5iDGOR/2HkOOM4PGB2maZfrK1ekXKOKimKdD1SsvjBoV3hgZl8gzl9Z++vi5?=
 =?us-ascii?Q?Ch7cn1+UT64QLyn5M+ZMlCj3dBIQAlzrj4p70WZjs5dU4cq+9yi6WCdxfSH1?=
 =?us-ascii?Q?ji3LKS9RJmafFF893/aqLFQKEneKMPVSLa6/zKegVDALzPNOE54OlCKrPRVZ?=
 =?us-ascii?Q?fLoDucflh3c+xK//mGdj15x379wVBCRC?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aYe71oSxe15YBwwYp2opHoe33/bGkg4VvGeJYCbZ0juWVL//JNt9t3xsmjRX?=
 =?us-ascii?Q?CUyr4C6mtC7Q+d7sT+Pwz4X/RGW2uneBJ6EtsJk0IJQwNxzHMcForIMiaIcf?=
 =?us-ascii?Q?knHwbg8eT8cuxC0xAvQkUwcw6hxlJw7akv9wqRmcshIXZQ26zII6mAP8iKIV?=
 =?us-ascii?Q?BdU3BfVayhQ3F3o2rwZKT7wAaXBgoPKVNJKkx0GYt8hNeMINfQz1xXasAsU1?=
 =?us-ascii?Q?GEISkYTsef1AnuuAcLCpA3XE9Y39Kpnk70q6vqOLDUhdtECSNJA+QT2TYH5B?=
 =?us-ascii?Q?bhgknTQEf3EZO/hWQGHzFXaxvpD968VybL1ah3P3sGEdp1nXG7QOdusuemUD?=
 =?us-ascii?Q?igIIrRaPXPr8x4GuInPrxRjl8yyIs621Ml9EP8UGPiBNxMPlN+N4agdkrJ2W?=
 =?us-ascii?Q?HQC7L/xBmYbxkgCl0Vo6hqEZMZ7K1hYfzxs65dim3RJ+2po875dmzyxrj6uJ?=
 =?us-ascii?Q?PHlGOHpBbt4H4Pfa3O07RhYgZBzbenzi/A7Y1Utxc6I4bi/6w16kbdAA5x5H?=
 =?us-ascii?Q?Y+aEydY0nODOMb1rjCenGxYym4ZND+n8iERIRcSLGMJE8sTxauRQ0WHxC233?=
 =?us-ascii?Q?BJ+VySyMh5joF5iEyO47/0QdgbwUGDXFXxcHlvm8JgKurv73hcaYXq7oaWxw?=
 =?us-ascii?Q?ZCUYZJVx1tim+8JQdnH0x45VpdC7gnBpIPX/T7RyIScmLbJPKIziaX49ctr8?=
 =?us-ascii?Q?CxnbaiKu5Yoo7Iii0NUdxvv2uBPZ+Vs8xMbDFQKaOdLwNZf9+tzwd4+G6DZY?=
 =?us-ascii?Q?HqN+OwXVhx3osOFW9OjCgbHOVfOT1XdfeyhQ0RHsfmEzOzTHzsGTECsjHV+p?=
 =?us-ascii?Q?J0txCsu09FfqN4HLX+0s643kxWEtm+Xe7Mcnzo3ap0ggleWK6BEeUWwEM2ds?=
 =?us-ascii?Q?XwU8LxAqGphEi9B72d4l4GVm/KOpX+4aUL5xO8Wvp/A+Yfkx75Mfg3GA0m+t?=
 =?us-ascii?Q?N8A9vUiQvazXcgPYcVY23o6EioJmoduoC3ydVh2fViPkHhsXoqSmjB7Qo+O7?=
 =?us-ascii?Q?2kpF+sDYMrbnQDuaL/AgI5aCcxagSTf2Fw131/P3ikiF7ip3EduGVG1x5Ylx?=
 =?us-ascii?Q?VHl1G010YUISN/xGBUnHNVBMS99Obaa9opl5foQyiGRT0+h3n7hasLzEXAg6?=
 =?us-ascii?Q?3Euko5VGyEG7Km5cq8gs8SF9nODqCXqP2e+MaQFt7k8fqWaQI3JDkU5rglh8?=
 =?us-ascii?Q?u9sc1OsBb4RhBhJaS8jO+RY8ty1c8iNaHQBRP1SOW90F9IGVe8yh1Evzuv63?=
 =?us-ascii?Q?gNfr7iVLgJwluOYc+o7pPQ4LZjzBXfuk90dDa6PMUNWkJ2sbUYscpCteD6/c?=
 =?us-ascii?Q?2Ef157TQDlgIkxECjeAj+/vDhxuYzdLiV6c8tASwGOfL6Iv0wcWNlO9fH7TE?=
 =?us-ascii?Q?JL9eFV3A4DpY9GeRkBCJ4TaYnzU8whg4UXMJng73fwO8rFvDh6DNG7qTzpUe?=
 =?us-ascii?Q?3TebvzSIJUttrLY0uUYRFpQWLsJnacl0dYGXl8MhdxSNjOG8+HsD/chC4ZOD?=
 =?us-ascii?Q?USDnfbyhPszkPBE9cs/mHzXyikk9RcbwZoc2QBJqFO0UhlFbxvf7jdkGPV8Y?=
 =?us-ascii?Q?Jpb9u0zhdfQClayyhtMhuXSp8+3ng/TR+0C4zESY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7175ac-3eba-4cf0-dc70-08dd449a87e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 21:34:25.1910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8BpSjc+93GML2r1jNuVx+m5xvNVnAWL6rzWG0X5Y/e38qgtxQ0/RJL1mXIS5Kbt/ZMYewGewlbyRRkBdvU5dKEcybRUx8jxPTwhsfeRDFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 21:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210736

Hi all,

We are on Scarthgap, and I am seeing an issue with sstate-diff-machines.sh =
wherein the script claims to see task signature differences, but then doesn=
't report any. For example, I get:

ERROR: base-files different signature for task do_package_write_rpm.sigdata=
 between my-machine-1 and my-machine-2
NOTE: Starting bitbake server...

There should be output from bitbake-diffsigs after the 'Note:' lines.=20

I did some poking around in tmp/sstate-diff. The 'list.M' file for my-machi=
ne-1 has:

MACHINEpoky-linux/base-files/3.0.14.do_package_write_rpm.sigdata.af0c3fb3b1=
b8494fcd7a31ba513495df384fdf25a8eced584e7c71d722b26683

But the list.M for my-machine-2 has:

my-machine-1-poky-linux/base-files/3.0.14.do_package_write_rpm.sigdata.af0c=
3fb3b1b8494fcd7a31ba513495df384fdf25a8eced584e7c71d722b26683=20

So interestingly, the hash is the same (af0c3fb3b1b8494fcd7a31ba513495df384=
fdf25a8eced584e7c71d722b26683), but in the case of 'base-files' for my-mach=
ine-2, it ended up using the sstate (I guess?) from my-machine-1. Maybe thi=
s has something to do with hash equiv? (I have BB_HASHSERVE set to 'auto')

Can anyone please help explain?

Thanks,
Chris

