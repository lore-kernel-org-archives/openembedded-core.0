Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C3EC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:32:10 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web10.15941.1747729924327514016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 01:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=O83PfPDm;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747729924; x=1779265924;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+xCctvy4fEHwhLIW52m4+KHM0fqmeop6c2g6SiCB8gI=;
  b=O83PfPDm2bEHuEd0FUrV90nYSoiACOKzUdIqdILnTUwtjq6ZQbRNUtdH
   zJr9g7C3+K2k1VYxFs6QJEVVRVe45Xz1xeJrMvsNzO1qmuSMYHEMKRJwA
   F4FIFy2U4meQdPfwPXfWAMaAQ5YjMviyEPZGrG2+jIaNKXbPgkfPBo/92
   KRDuW+HUFJq1T1IL5089Kb+QCYjdYEU6C/Jd2bQkYVRFipuugr+L074r6
   /PEOVsCrkOQpksbdmyUkxsUpI9nZbyyzWCr+F346zy0ziwmTfmBYWqZkb
   HiyC2FjZ+4FXwEI9zOprzBFclWDmE+XiuTCLE7dw6lnlAptIfh9lTbRPp
   A==;
X-CSE-ConnectionGUID: Wb+A4wCiQ56nIXZsxjS8VQ==
X-CSE-MsgGUID: ia7ZFNr4Q9OQSeKpVPTwGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="155971244"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="155971244"
Received: from mail-japanwestazlp17010000.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:32:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM0BkCFhHYxX/fCoz/4LmPAkm8LXkKnz4BOdAcHoQqFcAo9As4aOTKxq++xwQ2nxnIqyzitKI8X+qsT6mC6Cc3KAoPTTR+DITb1GxeCYEM0Z9z31DR5V0nsL1AR+6ogWm/kLzZ61MscwwF3rUomvaB5FYSDMymdHXTFmCRTFpbsvbLjy6VUd7ij4LLbrJ7cfbFdbSbJUAuLJ0GraZlCcMBhHH7JmpB0x16mTXrRfXnzGX7uSJBWcJsr5uS0wM8eF0klBhXl1BN1uwN0M5jUQUlthgpF3P6XTWBMXzPe7nNS0wrpIMKR92RjQ3EiJ81idBZsSpR4zTkhzjkqCskXH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xCctvy4fEHwhLIW52m4+KHM0fqmeop6c2g6SiCB8gI=;
 b=WU8P0H8fH2lD2KqujNVvT8glzYE6JqaoqKeASxavxJiEMX0VFM7GsIG4l3zDTS9Xlh40vKnfAZPuE873BVFH7APPHI4Oh7i9rxgMuX7wchn9BCgfOEJyhH4EyS3vVUtNSpCkj+FJ/UvnYx65HrxKBx3Tpe7I8DFCkjSzrgfwpWlZEt4pAFze2HWtxBJK2yodg8f6S48fFLWu3YIzDoGOIsTlQnfzSy39P3AAhXqimFbFNZKNhhroqHFJQe+RLQljlFcK7AxRLsaYXTAybPx8hPT4Wq7q7S7Ip91ilufxWuXnd/SVwTheZH0pUiyk8cBbZBusQ6K+oHh3jfrt1yCe7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by OSCPR01MB14500.jpnprd01.prod.outlook.com
 (2603:1096:604:3a5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 08:31:59 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:31:58 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Topic: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Index: AQHbxkQgvGR62EwISkC4dP6cxmz0dbPU/nIAgAY3O8A=
Date: Tue, 20 May 2025 08:31:58 +0000
Message-ID: 
 <OSRPR01MB11597C8AD2CB0276171EC06759B9FA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250516092238.1182-1-liuyd.fnst@fujitsu.com>
 <5625AB89-3201-47B0-B698-9039CE2BC553@arm.com>
In-Reply-To: <5625AB89-3201-47B0-B698-9039CE2BC553@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MGRiNDBiOGUtYTU0ZC00OWM0LTgxMTEtYTdkNmI5MWZm?=
 =?utf-8?B?OTk3O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA1LTIwVDA4OjI4OjA3WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|OSCPR01MB14500:EE_
x-ms-office365-filtering-correlation-id: 508502ba-9ab3-41f2-67d0-08dd9778c972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MFF1Y0pVWUJMdmllMU9DdTAxQjQzVmtSc3NvN2taOW1JQXp6WmxrSnkyVUlh?=
 =?utf-8?B?UkJJaXJWSCtVa0w1eVphWXdVRUkwVGRXK3I2SnprZlVPZ3ptTFhrRWxKbVlj?=
 =?utf-8?B?MG9RaUNMcmM0RXU1R0MyN3V4aWJLcTJWWHhvQ1JCU0ZYaVJ3bXJTbjQ4cnFG?=
 =?utf-8?B?dDdueG1ZNU54ZXgvNWQ1RGMxUHAwNnJFYnZ6c1BFVEgyQ0lkdGlHQ2NrR3ls?=
 =?utf-8?B?T2xRNUFvMGpCMFYrRFZSU1dmYlhrZkRlOG0zeUszWlpUQnJiK2p2UTZob2sz?=
 =?utf-8?B?aVlSK1UwNm4xMEQzY3RyYWpHT252VW81NDI4NFpoOWlrS3pkUEhpWlFNUXJB?=
 =?utf-8?B?dStGRDhITE1UT0FVYnFUb2JLSjVzSE9pQmZ3UWNPRmFJUEo1aXlLUDZjZmd4?=
 =?utf-8?B?WjlJMy8yYm1QVGZVTmpBalNma0Vndi9Xd09DYmRKdkpmTEgzeVVoaC9nYUVo?=
 =?utf-8?B?MEVLVkNHOVhZQTI3d2EyRnlRNTY4czRwY3ZKQitSQ213dnRsWXRTazNVbGRW?=
 =?utf-8?B?Q3VjWFJHUjU0RWVhUjQ1TzVGeG1nNlBhSS9jMVArYjVaQ3dZNnFwbDVLVTVs?=
 =?utf-8?B?ZkJYZ0FTRTRjQmlId0NHdURnRjU0VndhK2ZrQ0UrWmdvTUpqQmYrN01SaEdF?=
 =?utf-8?B?bVovaDl3SDZRMlQ4WVJmcng5bk9JT0VSY1piQ1BEdnNtaWlFRElOWTZxM0ZO?=
 =?utf-8?B?VllqZkZCQjRKN0FQZnhmSUQwa2hjTkNnSXluQ3QzVkx0L2NZanNzdXpOTU9u?=
 =?utf-8?B?NUVtazM2aWFKV2VVdXFmazRxZXVMVzZ3MEJIaU5aajRrUXd6RXN1anVsZjlG?=
 =?utf-8?B?N2t5OTZsVTFEeVd0bmxLdGdTQkVWbEtwSnd4VFM1M3hDOTVuZXhZSkZMd2ww?=
 =?utf-8?B?VWIrTHRDamxjbTQwVGNPM3grYWhJeUllNVlkdnJYRzl0L2M0OUZYcUIvNmxG?=
 =?utf-8?B?VlBBNUJhUnJ6YWREbFlOSEJQWHdncjlVZFNSdUdlcE9BQzZESVhWdmFEYld5?=
 =?utf-8?B?RWRiVjYycTlhdFdNaXNrNmtTUE1sMUxKUnJEZFBIbmtWUGNHR09TcUZSbjl1?=
 =?utf-8?B?b3poSXZrYnFLZ0M3QTN1QmkrdXJJNW1xVzVCa3JMRDZlRkc4Z0pWdjVjalJ4?=
 =?utf-8?B?VHBqaStjd2JFM0VtNkpmZ2NRRzFPYzhpQ1B4YWg5ejdmRkRCeFRBSUxTREQ4?=
 =?utf-8?B?VCtSZ1JRZ21tME1KTHpERituR2pzV21Kb3g1TUdSVzFPd0N5TElOZlI3K01o?=
 =?utf-8?B?dUFSNXB4NzB1cjlCczVCODBHREsrYTVybjBlTVFWYTlXWkJsazlpaDVkbC9j?=
 =?utf-8?B?ZUlKbG9SL211V0M0R2gwNkliVzNYWGh3RTI4dHYvbUsrNzBFZGNZeGF1RjNn?=
 =?utf-8?B?YS9URm5iMUFGdWZuYklodUV1RWJUS3hiNitUU09uQ3FmWHVYS3hIbjlYSk9a?=
 =?utf-8?B?VVVBOVBIOWJ6akh0WXd6QkRhYmVjSUJTOTZ6MVpraTFNVU85QUdBMmVEelB3?=
 =?utf-8?B?Qzd1L1JJWkFNdG12SmZsSCtxQk1nTm1FWERzNWxBbUxnTkw3NW5oNGJacUJ2?=
 =?utf-8?B?aDJDcVZJVjNoSEhHQnh1WjQyd2Z4OEVObXYxWG5nSEJUb2czdFNybFlKRUlP?=
 =?utf-8?B?dWpsNnlidXh5NXFHM0c1Y3JuZ2lsTkFJY1B3ckFLSmovWmdtOXpKa0hwSGlw?=
 =?utf-8?B?ZERRVllsejZxQkdoU0RNaVc2bGdQdVVua3V2TGlwRDN6dEplK1pLWnVzTE9r?=
 =?utf-8?B?bE5HNVRyQTc5SlZEdFg0M1NkenpUTWZMeThzMHR6R2xpME5GWDBWRzU1RTQ5?=
 =?utf-8?B?eEt4cE40MzJ4dzNhbkJIcU1QQ1hEUUZpVVFBbDhhU05VeWJDLzdDOXczdGEx?=
 =?utf-8?B?N28vZHlmNXl1MVVIdytoSzRXT1IvTERHSEIyb2pBTGRCVVZxcThPNmx6SVk5?=
 =?utf-8?B?RVNIV1lkMlhpVFdscU01Rk1EZkNDdFVlbStaNDJ1Ykl3VjhtaWtlWmk3NWw1?=
 =?utf-8?Q?EYanLWKtSSHzLktFimrftc2JYgNXoA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a1habzkwWVZYODJjNGF3d1ZxbWpDT2ZiNG1yMWREVWdpWWc2K29ra3dOYXV4?=
 =?utf-8?B?TjQ3dnBBN2lPb2VTTHpkRHNXUG5YRGk4bU5vVGJwOUI4VmRYRFR6enRsY2JJ?=
 =?utf-8?B?NkFJanpOUDkxcnMxWDJaZnhVOHNkY2o4OEpmZExFU0hmS0dmSTg4TThBVk96?=
 =?utf-8?B?K3RtN3BLMi81NzZaMkMyeE9iWHUxVkZKSjhKNFBvUUoremtvdzgxakxUdWdR?=
 =?utf-8?B?TmptS3N5SVkyNWNmaE5TOWlWdFdtNUZhUllWNTlMTzl1ZW5JSmt1aFFJWWdI?=
 =?utf-8?B?YzVrdzlnZnVDSjkrY1RDZWRnRU56MnQzVlRvZ2Y2allNQlI3T2lOdFM4eFdS?=
 =?utf-8?B?L0xoTGl1YUFFV1lFeWU1NEJyVDg1TXdlVU9RZ0g5ay9OTzNuYWh5SVVIc1RF?=
 =?utf-8?B?cjZaa2Z3Y0szTE9rQ0hXNWNJUGNaZmwwbVA5Y1NOQVQ5YUtIdjk2YkxqTnBm?=
 =?utf-8?B?UGsrSlVCZkJvZi8vR0RkeWszMVlBZVY5alZ2QmZzTHZmRzE0aThvYW1oQWhO?=
 =?utf-8?B?MitJU3M1NksrR2liR3oxM0tSNHJPY3p2dS9zM1FBcGZPbHJacWZVYVAxOThF?=
 =?utf-8?B?RkZHdm9QT3graHFtLzFMdTZMbzhBOTBMdTRjOTJSVkVReHNvYVFKMk43MkxB?=
 =?utf-8?B?dkdkM2d1NzNOaGJJNGFRa3M1QXQ2WmVEQWhDV1JQN0d1OVdDVHJRN20zbFlh?=
 =?utf-8?B?TGcyN0NUV0VqZmRJMk1wbVRqbEx6SC9hL2dmWnI4WWdLQmRYVTNPeW5vSk1i?=
 =?utf-8?B?T3U4YVNLdFIxM0hzQ0RGQnF2N2IwTG81L0QvanRueWNrVU1vOE1ubEsxcE01?=
 =?utf-8?B?VnUvMUY4aEdCYmN0ME0wZ3VRcll3bTdCN2FocWFtRlZaWDB4RkhTemVhTElE?=
 =?utf-8?B?bHVJTndDZ2FqcDhHQU14dmRhdnBJR2huZG9wRWVhVXlNY0pQV1pRVENvcGhl?=
 =?utf-8?B?VlFSdjdPZnIrbTRXVWwzTHI0Qm1vM0xXUExTb1MwM2ErQ282ZFk0cC9qWHFt?=
 =?utf-8?B?ZWtDZFNWL3pUU2pPbnJIYUtWWDdEV0VkbkJrYW81TU55ZldVTGhPWURrbVlY?=
 =?utf-8?B?clFLWkQyQVhLbEkyWVpBNEowK2VjVm5QUHo5VmFOU293S01oNGlxTmhUUlZ3?=
 =?utf-8?B?SlFCM1FqcHFlaEdDM2hMOGJvMlhGVTdKMzlFM1lKRUwrbDNNd1A3cXBEU2pp?=
 =?utf-8?B?WkFlR3pOSG1lamFjSkhXcnFEWkRqS3VBSldnVVgxanE5bTA5dU53S25BWjN3?=
 =?utf-8?B?dE5PTFZlbnBsWVM1dTUzOGxWaElPQzZvRGdpQk5Oa2VvMFByVHF0dFQ2NEps?=
 =?utf-8?B?QXI4ejB5TmdxWExJU2dxMXRhUmZGY3pzVlEzNjA0UjNGeDQrM29vK2dZdjdv?=
 =?utf-8?B?bTAvMzlsam9NVDNMZmUzR1l3NEdzQlZsMHIrRU5Vb1lJOVR1aURlN1U0SnUy?=
 =?utf-8?B?Kzl6V3lNL0pDMjNXSVZPalZsanBJcU9sKzNLOFlWdFlEclR6U2ZtUnA2UHRo?=
 =?utf-8?B?M1lHNWFuZkxLRUNOWERrSFVCQlQ2UzhqbStRMVRjZmlXejc3K0FJbzNmWnFv?=
 =?utf-8?B?Y3NtS3hXRDlQNnBjT3RUR1BQbmpOeUlhV09qUU9zMzdsQzYrdFkxcTJUbTRZ?=
 =?utf-8?B?RWNvSTVSRFM1cGF0SGN4MWdjZnBMYnNIeVJRWFdHb0FSa3pnT3N6VTBzbTcy?=
 =?utf-8?B?WTMxT3JRK2xLTVhwRHF4d1VxRkJaY21qNzc4dWtaVHB1Ymh2UTd5SGdqakM5?=
 =?utf-8?B?a2lreXRYNlU0RkVydm9Sd2hzREg4cWRRRXI1TDRzYU1BZVVnL25IbWsyT0NX?=
 =?utf-8?B?TXJuQ0xYYkFGNEFHTGpsei8xd2ludDVzcU9BM1F0SXZVWTU4VlVZWDBOczNn?=
 =?utf-8?B?WmFyRy9RZ0h0WmNqY0JkMHN2TWdEWWdtNkJmLytVUHRCc3VPeVF2bXFyT2pk?=
 =?utf-8?B?VVF1WFJZUmpvK2swbWRIQWRyWFNQb0VxS3dOUHFhUFYxaG03Umw3QVRBWDZJ?=
 =?utf-8?B?VFlOYkZ4TzlmUE03c3J3elg0WU1JSkdVTld6eVhnUVRSTHdXQ3dkcGh4T1RI?=
 =?utf-8?B?Z0paS0VMaU1yckJTNTNheHF4dUM1ZXFOOHFYQjU3eEtsYmZyMTVNRjV3K0Jm?=
 =?utf-8?Q?HArNlsKRyYWXubOj2/F8RVTE7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/SmVlUgnh2RQguuaDgl3UGUqMpSKEngDSaMw36AZ3FNj0sTUnR/ULd/CYA8d9Z1jJ5O7l/9VpKRKubH5KJdJddWDQkrZXPoNicwYw3cBD24rp/f36URG77sc3kR3K+uAKjVCP4Re6zMgzOHdgQQhq0Ff3pJ1077wkm9d5iXgPi/XXYOly/YdZomTtlotXT5VhPI4ef8maT7m50M+UZmzsRPxIRKW3hB4scF3asyzX32a5/4K3qI1Lmlgn+1gkS5cpuytgc5WZ7AzA1c+uK6mTZWmdxhPDKqXaa6wVW82umE9rE2LrDAPIHxipvQWC0oWMsKLN9hBF8U+EdgtKNJ7+b44AtTtvCzGdimpLMeiWT9bw+a2cE9r5Ke26irZfuFZRaj86o6vhFD9/OrJvxnybk97hDiAMea0OayCXerGu5ix258gO74Y7z/hyWBxJczOMf+W/H9JpugfwtxYe3O/tUecGyhC/Z15EqmGnWOIeywYtkUu4lAUu9cM9rQRUDb+Ps2m2mIkqZBd5ccjtUwK0iykveWBxMKvHl7cAENTdR944ASkk43Psy8X813GgFrHpM1aaBsZs/sdfRgT5iCvF9NbegV0Eak87GWpmCfzm+c+wRZe2Hq5sqNlYZNmzMFr
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508502ba-9ab3-41f2-67d0-08dd9778c972
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 08:31:58.7922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPdBDwtSusrW32+ucLadulnffbWy7CxLLJhcgXrmjajcF8Zh8RwGNVeYEkKduje1Y6BuoRrMLkCRS6XHpPPx/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14500
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216890

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9zcyBCdXJ0b24gPFJv
c3MuQnVydG9uQGFybS5jb20+DQo+IFNlbnQ6IDIwMjXlubQ15pyIMTbml6UgMTc6MzMNCj4gVG86
IExpdSwgWWlkaW5nL+WImCDkuZnkuIEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+IENjOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIHYyXSBsaWJ1bndpbmQ6IGZpeCBtdWx0aWxpYiBjb25mbGljdA0KPiAN
Cj4gT24gMTYgTWF5IDIwMjUsIGF0IDEwOjIyLCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IGZpeCBpc3N1ZSB0aGF0DQo+ID4gfCBFcnJv
cjogVHJhbnNhY3Rpb24gdGVzdCBlcnJvcjoNCj4gPiB8ICAgZmlsZSAvdXNyL2xpYmV4ZWMvbGli
dW53aW5kL2NoZWNrLW5hbWVzcGFjZS5zaCBjb25mbGljdHMgYmV0d2Vlbg0KPiBhdHRlbXB0ZWQg
aW5zdGFsbHMgb2YgbGlidW53aW5kLTEuOC4xLXIwLmNvcmUyXzY0IGFuZA0KPiBsaWIzMi1saWJ1
bndpbmQtMS44LjEtcjAuY29yZTJfMzINCj4gPiB8ICAgZmlsZSAvdXNyL2xpYmV4ZWMvbGlidW53
aW5kL3Rlc3QtcnVubmVyIGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZA0KPiBpbnN0YWxscyBv
ZiBsaWJ1bndpbmQtMS44LjEtcjAuY29yZTJfNjQgYW5kIGxpYjMyLWxpYnVud2luZC0xLjguMS1y
MC5jb3JlMl8zMg0KPiANCj4gVGhlIGNsdWUgaXMgaW4gdGhlIG5hbWVzOiB0aGVzZSBhcmUgdGVz
dCBiaW5hcmllcyB0aGF0IHNob3VsZCBiZSBpbiBsaWJ1bndpbmQtcHRlc3QuDQo+IFBsZWFzZSBk
b27igJl0IGltbWVkaWF0ZWx5IHJlYWNoIGZvciBtdWx0aWxpYl9zY3JpcHQgd2hlbiB0aGF0IGlz
IGFjdHVhbGx5IGEgbGFzdA0KPiByZXNvcnQuDQoNCkN1cnJlbnRseSwgbGlidW53aW5kIGRvZXMg
bm90IHN1cHBvcnQgcHRlc3QgeWV0LCBzbyBJIG5lZWQgdG8gYWRkIHB0ZXN0IGZvciBsaWJ1bndp
bmQsIHJpZ2h0Pw0KVGhpcyBpcyBub3QgZWFzeSBmb3IgbWUuDQoNCkJlY2F1c2Ugc2V2ZXJhbCBw
dGVzdCBjYXNlcyBrZWVwIGZhaWxpbmcsIGFuZCBJIGRvbuKAmXQga25vdyBob3cgdG8gZml4IHRo
ZW0uLi4NCg0KDQpMaXUgWWlkaW5nDQoNCg0KDQo+IA0KPiBSb3NzDQo=

