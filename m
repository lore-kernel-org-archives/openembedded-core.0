Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2891BE9E305
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 13:08:47 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18455.1770815324692252085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 05:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 11 Feb 2026 22:08:41 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo4.lge.com) (165.244.147.14)
	by 156.147.1.127 with ESMTP; 11 Feb 2026 22:08:41 +0900
X-Original-SENDERIP: 165.244.147.14
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO PUWP216CU001.outbound.protection.outlook.com) (40.93.139.6)
	by 165.244.147.14 with ESMTP; 11 Feb 2026 22:08:41 +0900
X-Original-SENDERIP: 40.93.139.6
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org,
	Qi.Chen@windriver.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgqTL4S1QtbZapipEhzQYt44sWtVZvLiwJvSk3aVALngLbWbtYUCNU9kPTdiwWGQcnB4DejjKKuvONQfgT2oLOrHJTmJZQfiSVz29bWHA0GezMevV6lNvIc/JQ+lA5Is72zVmeqvl4kr6V79ukQKPNSeMhSmAclpIwd/jIs7cctOqc5Pl8co2M/Q/YinBkKVw0rSX94QG/N50LPq7okUxrHi4p3YBu+96h4MH0iLoMBON1Hv6Q1a04kzCnv8bJPzR40hR5crAuyF2j0OTFvTBFLkTsHjyYAg4yrdMYiVkPDs/AZkzvOqxzTi78EMQiEd8tkKwXSTA+rLraFY+I1lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWFmGQxOQJgydqdAwRUBFdh7QkiYc+WA3uLkgN5ntnQ=;
 b=ZnMZ5Bqhop1rFUZvKUslTNjSH31YFfFvkhZPYK8LoEV+kqjpO4LjMIIv1TCAxgSmcBqlZJtc05ZR7ZtU4iC3k6oRO+CoTcBiXx1pwnmeZkWksTUNYgSeE1UGmHWqZZjQ4tvY+td53uQGmjywtn64d7+NS5w/ujhsRcrIpzK7yB33FKOowxfF8Pu80INDuXUIx0aikJUa2mgLyV1q9Dj9VLhLZUfcL94AGBYrNZO7JwrIbYQbj8CK/yZYmxFY9q+9+BYKDQ0hU+Ct+yEV9jpeeD/BZXRbGma8CivgBrm6q0Cx0EFhDWi9xtLC20V3XQGMfYmqT+rPH8gRSg6DAD3rWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::13)
 by SE1P216MB2261.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 13:08:40 +0000
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e]) by PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 13:08:40 +0000
From: =?utf-8?B?7KCV7J6s7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQ?=
 =?utf-8?B?bGF0Zm9ybeqwnOuwnOyLpCBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Qi.Chen@windriver.com"
	<Qi.Chen@windriver.com>
Subject: Re: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Topic: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Index: AQHcmlADBFFxn9txHUSRJnN9zE6LqrV7myYAgAAFi4+AABD7gIABGLMt
Date: Wed, 11 Feb 2026 13:08:40 +0000
Message-ID: 
 <PU4P216MB11339355245F5197F93D47F79A63A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
References: <20260210054147.838158-1-jaeyoon.jung@lge.com>
 <9f46cb53a43c6f01135b8a8e18269e92cceb1725.camel@linuxfoundation.org>
 <PU4P216MB11330708E3BBE2CC8996C2859A62A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
 <CO6PR11MB56022C6DD92B00B1FDA3E329ED62A@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB56022C6DD92B00B1FDA3E329ED62A@CO6PR11MB5602.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: PU4P216MB1133:EE_|SE1P216MB2261:EE_
x-ms-office365-filtering-correlation-id: 6712e992-c940-4350-f0f3-08de696eacf0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VS9EQ2Z4QUo0M3ZnSHdoakJXZHRHdFJVZHFid2ZwQUl2Y29kQ0JDWW5Jdmhp?=
 =?utf-8?B?dWpJRC9QN3Bha2MzVG9JZzVybHV3bUFhS1RIQlg2REdaWjgrR3NqN2lZdTBW?=
 =?utf-8?B?blpVQitsMnhpcU92SlZSdktybWh4N1R3YnF0Q2Npb2QxSWNWMXh3R1hlb0Q5?=
 =?utf-8?B?cHFoNTVCMXI1MnFvSzRwNjA5S2g3VUdGOUVPTGdyQWhWRjRrdURsaVZLMCs0?=
 =?utf-8?B?Ni9xTXBIL3hIc2J0TkpVSVJPL1g0RE5HSDJ1UXNUaTZZS1VLNDR0OTd3VmNN?=
 =?utf-8?B?VHBoSnhJSDk0VmZIV3N6L2M1SEltWjFlT2dYU2N2SFVLQitwM0YyTk9UNE9X?=
 =?utf-8?B?NTV6R3F1U2hnaVRiS0RCSmJnQVdGZ2w5eWpZdldselRFeWp0VDNpZFRrbENt?=
 =?utf-8?B?T2w1OXBpeEFnZjNwSllRZEpZWE5YY1lwQUF3VkE1THZYUjBzMnhUZnpCTkRn?=
 =?utf-8?B?VmVBZ1djZWx4T1hIS1BZRGtkQTIwMlN0MlJIR3hUTzVnVVFJZ2V4MitvUmpw?=
 =?utf-8?B?TTU2OHZGR3Q2ZjM4NzJpZ2JRTnlKc01tMlJ5d1ZkVkNuRjZiVWZPSVpVMXJv?=
 =?utf-8?B?SFI2Ukc3MkpLY1l1bnhwV3RSUUROZ2tPa29TQ2JMdlhqSUJUc2FiNm9LTEFt?=
 =?utf-8?B?QkhielhseUpkNzJmOXNiaXE3OE9uTHBMbEp0YzlseldKZU1sVkxHUXFqdDlP?=
 =?utf-8?B?Vk9LelV3MW9PT1llb3o1MElaR3g5MWJDUTNCQmh6TWhabE9JazFhL3QvWDd0?=
 =?utf-8?B?TXk4Y3VSYmVMTlZJc2NveFd5ZVZaaEVLbVZHZ2tFcDQzd0l3ZjY3RE9LLzRG?=
 =?utf-8?B?d2pPQ2hqQ3Z6Yk9rcmtsSmpWMUV4QlhERUtOZngxVzNxdlNwMFJhd0RrUTBv?=
 =?utf-8?B?MVNEdnRwb2Y2QTM3VkFjSitkTnZwWHArblJ0dyt4TzlSTk12emNXa3RmcnBk?=
 =?utf-8?B?ZGdQNlFWUHZlY1Y5dExRRHpLNHloOSt0MXFvRXU3YWc2ZCtYbXBVMjNHU1o5?=
 =?utf-8?B?QytXSFk2bzlFeUMzNzBsbWFMa0hFQkxVb2h5eUV0elRDdlV5N3JzeDgyc3dr?=
 =?utf-8?B?VW1YYVBmYWpxampCQXpVZ2ozc3ZGcFRwV3JKbElCNElONHAxOGpzdlVtY1da?=
 =?utf-8?B?QXpKaE9QTW1GREVKckR0S0J1ak5sNFZtcktWejBEYmNzSjdqM29hNVlydisr?=
 =?utf-8?B?N0RiZjd5R1M3WkpNS2VDYkV4dGJFQW4vT2hObFAvYnNhY0ZxQmh0dVdsYXdY?=
 =?utf-8?B?RmJaenBBRUtwOEw1Uzh5OC9QUVk5aTVPbkFzZkk3MlE1Rlh6SVdVOHNsS09X?=
 =?utf-8?B?MStGeXBxQ2FCUGFURWlIWXA4aThMQWxObk9LZkN6Q0xHR1NuM3hzQVpuZjlq?=
 =?utf-8?B?azdtbk9ZOHFVKzhMdEFUbU9iV2w4ajZCK0laTy8yRWNIaFZGQUt5eTErcW1Y?=
 =?utf-8?B?dk5Gb3BJZndLbGFmWFg1RHlCbStRYlZEb3Awak5XelNVdzBLYk9aWUV2ajA5?=
 =?utf-8?B?L2hveFY5Nno5NE9XNTQyNzV2bGJzMG5sbTZuWGdhRnZTV3R5eEMvYmVIYWZ2?=
 =?utf-8?B?Vkh5YmxJOUlNajJQRmRDblVRb3QybjE0c3AvZ01Sa0UvdTZxRHVaZ0cyTGVX?=
 =?utf-8?B?SkxMWm5oMFZFcDFEdzZSejBvcHk5eVlEY1N1cFdLUFhHK3hqYkxxZHJPUVgx?=
 =?utf-8?B?aHo5d1FLZGU3YStwZHFLWnVYTzhCZjM1ek9EVGl4czB2a3FGQ285dkN1UTNV?=
 =?utf-8?B?VG5mUHVmNlpLQjR4UUNqYkhBZG9JVjViVXhhVzRPSGpaazI0b2lDOVlaWld1?=
 =?utf-8?B?dmlueWZ1T0lVVnBLTFZ3b1dpdkl5ZHNDUGdMRHltaXNLTFJxcFFad0Jvc0ZZ?=
 =?utf-8?B?TGpTZFIvd3o1UTlrQnovb1B2cW9xS1h3N0ozdnRVL3FTckpHNm56NXlHRTYv?=
 =?utf-8?B?SmhoK1EwTHdmY3hKVCtBdWRvaHFQZDJtcW04dXNFV2hUcEV4NXd1cElpOGZl?=
 =?utf-8?B?NGhlM2dtS2lRdHZIOVZnN2l1Rmd6cmNiZEJBZ0tYeTZkM2JQcVliYTJWTDZa?=
 =?utf-8?B?Q2NPaktLc3JJWW55alpXUk5kcTFoMXdVQ3dwVFFRSkVhNkRYZ0dhSmRiaUI3?=
 =?utf-8?B?VEdmQVhOT2ZQY3NwcUlBSjJ1bnh5bmdObzUxRUl6MWlacFZxQ2hDRFlYRVVq?=
 =?utf-8?Q?d9BLt7i54rjh1tjibx60kko=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1133.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UkJJYm9VakxmbkJnUUY2dmJDUGxwUXlyTHRSMVUyY29lc2tjdXlJSjE0MnJw?=
 =?utf-8?B?cnN4bFQvcUFoUjRlbHNMM1RURFVtT3orMWRpTHRHeGlSRTdvb1U1WmxmK3ZU?=
 =?utf-8?B?c2lpWHJPbVp0M0MrZjd3Y0tPMmxyVWdubWxTV0xKdC9UcmpjYW1zZ2tzOHRL?=
 =?utf-8?B?NTBEYVk1TFV5WGJwaUdBWHd3a2Vqd3ZCcWsvZDJuRElSYlJpcFFWR2hmck15?=
 =?utf-8?B?dHVCM1VLWG9qQmsvT2M1akoxMlpkVk9sYzZ6dldkZGtFVHFkOXFscy9UckxU?=
 =?utf-8?B?Q2lnNWMzRlFqVjFJRitqL0MxZ3A5U05LbktMeVBURnF2ZE9IK0IxSU9Qeklj?=
 =?utf-8?B?TDB4cE9SRll2UE5kSlZlbW1Td20zYnVoREFKOHdJTzJQUWxpMG96bVlzWlda?=
 =?utf-8?B?a3JEbnFTVGY3M2tjMFJJc3Q1YXhDK3M1aVhkTWNreEpVc0laTENSQTZTNEpE?=
 =?utf-8?B?eTMrQXBBTXM5aWhscUk5NFNYMGZzUTNVejg1eDB3R0xRZ3V1bU9BV01BQk5V?=
 =?utf-8?B?a3ZLM0FaTk1hWXJEd3F4aFk0WmxYM1RuUTlpclJZNlpJVGdtaS95TkVDWUp0?=
 =?utf-8?B?QkhnaVVwVG9TZkxkaFF4ekE3bmtycnBNOHVaaGJkdDlFS1pQWmZNUXRORzh6?=
 =?utf-8?B?eE1ITFhlSDNuN3h2bERRd29DaWxRcUlwOHh6bGpMYXZpK0tpd0FZd1Q1alZV?=
 =?utf-8?B?V3ZURVJLRWp2cWdFTTJzRmFzc3kwRHBRT0tQZ2FnV09mRFJNK0hoeXlOQUhN?=
 =?utf-8?B?QTNIT3EzbEs2cml6V3A3MVdUV0VIOVBuWmw4aVRiYTBRTWtVeW1qTGMwb1R6?=
 =?utf-8?B?b05uTUdUTlNkQ0o1Y3g0dlIwSWpBUFpCc1BpTzNWTXZSdzhicHpMZ1owcGxh?=
 =?utf-8?B?SFVkMEJxTjFSS2NhRU5xL0Z5NEFTSVV4WFdOVGtydEdNYmc1SllGOCtxclV5?=
 =?utf-8?B?cDgwZXhsUE9DK1krZkJ1SW5hVnVPY1MxVm8vQ095bkFoOTJmc0xVSjhUenFq?=
 =?utf-8?B?YkVZUGpDUy9CUURyWEZJUVM2Qmh5UzFQTHcxYk9uMG9udGtFZ013b2VPNk5F?=
 =?utf-8?B?c1hQUFJOWUw1Tzd5VkdnSFJXYTdhbHZUNDdTeWRLT1I1UTFZc3Z6TnhvekdG?=
 =?utf-8?B?aG10N2ZMVGNEVlVTWWZ2a2g2VnNTWktFbmtIaUF4YzRNZ2pTbGpqbDU5WDkr?=
 =?utf-8?B?eldEMVZLd0VmZHd2aE5rSm9WcExPTisvZTFuc2N4VG9VeFNzRC9xenpNclpO?=
 =?utf-8?B?UHQ0eEtUVFk5OU9ESDRIanE5NEdGcTJoWnJFTGd4cHhWaC9nNW56bGpBdG9L?=
 =?utf-8?B?ZTl2UktPMkJ0Z3BpZURNNnNUQzZ4SDdnUGNwM3liS0gzblhKbWpuN1FJbjdj?=
 =?utf-8?B?UW05OFZHVHZ2a08xMUVSbjZMNG9sUE4wdE41ZGxlRlhJKzRwM2p4cUNwWlVC?=
 =?utf-8?B?OFFFd1lKd283Q05YQytXek95RGpmcU5CS2ZWVEkvOW5uY0wzYWYxZmxwMnZw?=
 =?utf-8?B?VEw5WmxBNDcvZGRzSWQ1ZWhoZ1BFc1N2NHZBY21CaFEvb1RzVGtLT0tuZTg2?=
 =?utf-8?B?SHFRdHc1RTBxbHJSWmZqcE5VMXlQeVRnVG94QUNzRm0wWEVEd3lJUkNNMGYv?=
 =?utf-8?B?eGdpSFBLVjdWaWZyV0F4Y0FXMThER2I2eGtjYlpXcE4yU0w0YjZHZnJMeUkv?=
 =?utf-8?B?LzZGUGJQNStCSFBBZmpqcVg5aStkVzVDYS93c01Ob09tbWIzOXF0NjdNdVpL?=
 =?utf-8?B?VjRtZE0xY0dxamN1WWZ2elBtZ0hqalZoY3EwT2JNSkg0REJ4TXJhelpPb2E2?=
 =?utf-8?B?eWIveXZ6SllITXl4Y1RQdVRxck1wbWNnYTltc1pIWVJUaXdsS0RFQTNNZkxK?=
 =?utf-8?B?eXAxWWwrT2VubzQ1Wm9CQ1ZyWFpJOStqR0dqQ1RZbXhUWVROOExtc25td2c4?=
 =?utf-8?B?TkxmODF1WmpPanZIK3BaaytHVFJuU05JU2hWRUFHMmdWY01DUTBCem9wcndz?=
 =?utf-8?B?SkpXdHBYMStrMUwrY3doU09BK29yeWw5TTBWNVNJdkg4aXpRSFRDNlMrSlNw?=
 =?utf-8?B?UjBYdStQcjVYeTRmZ01OUWh5TDF6eXdFcms0MkQrNjg3eTNldmVrbWs3cHJN?=
 =?utf-8?B?M2RqYWJNRVA5TVpuUU5NL0oybERXbWJqaWozazllOG1vUGZnLzByODFYODdU?=
 =?utf-8?B?MmNYb0s1MCtOWU5SeEczRWw4aW0yVGw1c09EMGxtd2tmZFpldU1ZSjBPQVR0?=
 =?utf-8?B?N01lakRzdVBVVSs0K0lvY3NDcHEzREYvd1g3UDdRQ3N2VEtDRllYUFBucXEr?=
 =?utf-8?B?a3phR2JEYWVoSEdQdUtjL3AwZllhVWVtRnVUR2NlcHZhOEtLaFJ0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6712e992-c940-4350-f0f3-08de696eacf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 13:08:40.1868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GavyF5oqYHQYDmhdVC6y1Fq/p3vrPQjUktkurSXdRx7ovNmlHbLDv+UjL+EzCvvH7YHs0TL2gLo2T8hylf4hFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 13:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230988

PiBGcm9tOsKgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gb24gYmVoYWxmIG9mIENoZW4gUWkg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPgo+IFNlbnQ6wqBUdWVzZGF5LCBGZWJydWFyeSAxMCwgMjAyNiAxODo1
Mwo+IFRvOsKg7KCV7J6s7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQbGF0
Zm9ybeqwnOuwnOyLpCBMaWdodHdlaWdodCBTeXN0ZW0gVGFzayA8amFleW9vbi5qdW5nQGxnZS5j
b20+OyBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+Cj4gU3ViamVjdDrCoFJlOiBbT0UtY29yZV0gW1BB
VENIXSBzeXN0ZW1kOiBmaXggbGlic3lzdGVtZCBMSUNFTlNFIGZvciBtdWx0aWxpYgo+IMKgCj4g
SGkgSmFleW9vbiwKPiAKPiBJIGNoZWNrZWQgdGhlIHJlbGF0ZWQgY29kZXMgd2l0aCBQQUNLQUdF
U19EWU5BTUlDIGluIG11bHRpbGliLmJiY2xhc3MgYW5kIHBhY2thZ2UuYmJjbGFzcy4KPiBJIHN1
c3BlY3QgdGhhdCBpdCdzIHRoZSBkb19zcGxpdF9wYWNrYWdlcyBmdW5jdGlvbiBpbiBwYWNrYWdl
LmJiY2xhc3MgdGhhdCBuZWVkcyB0byBiZSBmaXhlZC4KPiBUaGlzIGZ1bmN0aW9uIG1heSBhbHNv
IG5lZWQgdG8gdXNlIHJlbmFtZV9wYWNrYWdlX3ZhcmlhYmxlcyBvbiB0aGUgZHluYW1pY2FsbHkg
Z2VuZXJhdGVkIHBhY2thZ2VzLgo+IFlvdSBjYW4gcmVmZXIgdG8gdGhlIG11bHRpbGliX3ZpcnRj
bGFzc19oYW5kbGVyX3Bvc3RrZXlleHAgZnVuY3Rpb24gaW4gbXVsdGlsaWIuYmJjbGFzcy4gTm90
ZSB0aGF0IExJQ0VOU0UgaXMgYWxyZWFkeSBpbiAiUEFDS0FHRVZBUlMiLgo+IENvdWxkIHlvdSBw
bGVhc2UgY2hlY2sgaWYgdGhlIGFib3ZlIG1ldGhvZCB3b3Jrcz8KPiAKPiBSZWdhcmRzLAo+IFFp
Cj4gCgpIaSBRaSwKClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcsIGFuZCB5ZXMsIGl0IHdvcmtz
IQpBcyB5b3UgZ3Vlc3NlZCwgdGhlIHBhY2thZ2UgaW4gdHJvdWJsZSAnbGlic3lzdGVtZCcgaXMg
YmVpbmcgYWRkZWQgdG8KJ1BBQ0tBR0VTJyBsYXRlciBpbiBkb19zcGxpdF9wYWNrYWdlcy4gQ2Fs
bGluZyByZW5hbWVfcGFja2FnZV92YXJpYWJsZXMKYWZ0ZXIgdGhhdCBmaXhlcyB0aGUgaXNzdWUu
CkJ5IHRoZSB3YXkgSSBmb3VuZCBhIHNpZGUgZWZmZWN0IG9uIGxpYnBhbSBsaWtlbHkgZHVlIHRv
IHRoaXMgZml4Ogp8IEVSUk9SOiBsaWIzMi1saWJwYW0tMS41LjMtcjAgZG9fcGFja2FnZTogUUEg
SXNzdWU6IGxpYjMyLWxpYnBhbTogRmlsZXMvZGlyZWN0b3JpZXMgd2VyZSBpbnN0YWxsZWQgYnV0
IG5vdCBzaGlwcGVkIGluIGFueSBwYWNrYWdlOgp8ICAgL3Vzci9saWIvc2VjdXJpdHkvcGFtX2Vu
di5zbwp8IFBsZWFzZSBzZXQgRklMRVMgc3VjaCB0aGF0IHRoZXNlIGl0ZW1zIGFyZSBwYWNrYWdl
ZC4gQWx0ZXJuYXRpdmVseSBpZiB0aGV5IGFyZSB1bm5lZWRlZCwgYXZvaWQgaW5zdGFsbGluZyB0
aGVtIG9yIGRlbGV0ZSB0aGVtIHdpdGhpbiBkb19pbnN0YWxsLgp8IGxpYjMyLWxpYnBhbTogMSBp
bnN0YWxsZWQgYW5kIG5vdCBzaGlwcGVkIGZpbGVzLiBbaW5zdGFsbGVkLXZzLXNoaXBwZWRdCkkg
ZG9uJ3QgZ2V0IHdoeSBpdCBmYWlscyBmb3Igbm93LiBXaWxsIHRha2UgYSBsb29rIGEgYml0IG1v
cmUgYW5kIGFsc28KY2hlY2sgaWYgaXQncyBmaW5lIGluIG90aGVyIGRvX3NwbGl0X3BhY2thZ2Vz
IHVzZSBjYXNlcy4KCgpCZXN0IHJlZ2FyZHMsCi0tLQpKYWV5b29uIEp1bmcKU29mdHdhcmUgUGxh
dGZvcm0gTGFiLiAvIENvcnBvcmF0ZSBSJkQgLyBMRyBFbGVjdHJvbmljcyBJbmMuCgo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAKPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFs
ZiBPZiBKYWV5b29uIEp1bmcgKExHRSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiBTZW50
OiBUdWVzZGF5LCBGZWJydWFyeSAxMCwgMjAyNiA1OjA0IFBNCj4gVG86IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZwo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBz
eXN0ZW1kOiBmaXggbGlic3lzdGVtZCBMSUNFTlNFIGZvciBtdWx0aWxpYgo+IAo+ID4gRnJvbTrC
oFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4g
U2VudDrCoFR1ZXNkYXksIEZlYnJ1YXJ5IDEwLCAyMDI2IDE3OjMzCj4gPiBUbzrCoOygleyerOyc
pC9UYXNrIExlYWRlci9TVyBQbGF0Zm9ybSjsl7Ap7ISg7ZaJUGxhdGZvcm3qsJzrsJzsi6QgTGln
aHR3ZWlnaHQgU3lzdGVtCj4gPiBUYXNrIDxqYWV5b29uLmp1bmdAbGdlLmNvbT47IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiA+IDxvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPgo+ID4gU3ViamVjdDrCoFJlOiBbT0UtY29yZV0gW1BBVENI
XSBzeXN0ZW1kOiBmaXggbGlic3lzdGVtZCBMSUNFTlNFIGZvcgo+ID4gbXVsdGlsaWIKPiA+IMKg
Cj4gPiBPbiBUdWUsIDIwMjYtMDItMTAgYXQgMTQ6NDEgKzA5MDAsIEphZXlvb24gSnVuZyAoTEdF
KSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiA+ID4gRnJvbTogSmFleW9vbiBK
dW5nIDxqYWV5b29uLmp1bmdAbGdlLmNvbT4KPiA+ID4KPiA+ID4gUHJlcGVuZCAke01MUFJFRklY
fSB0byBMSUNFTlNFIGZvciBsaWJzeXN0ZW1kLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
YWV5b29uIEp1bmcgPGphZXlvb24uanVuZ0BsZ2UuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIHwgMiArLQo+ID4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwo+ID4gPiBiL21ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKPiA+ID4gaW5kZXggZGFmMzcwNjBkNy4u
ODBhNTI3ZGQyNSAxMDA2NDQKPiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLmluYwo+ID4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQu
aW5jCj4gPiA+IEBAIC0xMSw3ICsxMSw3IEBAIGVsYWJvcmF0ZSB0cmFuc2FjdGlvbmFsIGRlcGVu
ZGVuY3ktYmFzZWQgc2VydmljZQo+ID4gPiBjb250cm9sIGxvZ2ljLiBJdCBjYW4gXAo+ID4gPiDC
oHdvcmsgYXMgYSBkcm9wLWluIHJlcGxhY2VtZW50IGZvciBzeXN2aW5pdC4iCj4gPiA+IMKgCj4g
PiA+IMKgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vci1sYXRlciIKPiA+ID4g
LUxJQ0VOU0U6bGlic3lzdGVtZCA9ICJMR1BMLTIuMS1vci1sYXRlciIKPiA+ID4gK0xJQ0VOU0U6
JHtNTFBSRUZJWH1saWJzeXN0ZW1kID0gIkxHUEwtMi4xLW9yLWxhdGVyIgo+ID4gPiDCoExJQ19G
SUxFU19DSEtTVU0gPQo+ID4gPiAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9YzA5Nzg2MzYzNTAw
YTlhY2MyOWIxNDdlNmU3MmQyYzbCoFwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBbW2ZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7bWQ1PWJlMGFhZjRhMzgwZjcz
ZjdlMDBiNDIwYTAwNzM2OGYyIl1maWxlOi8vTElDRU5TRS5MR1BMMi4xO21kNT1iZTBhYWY0YTM4
MGY3M2Y3ZTAwYjQyMGEwMDczNjhmMl1maWxlOi8vTElDRU5TRS5MR1BMMi4xO21kNT1iZTBhYWY0
YTM4MGY3M2Y3ZTAwYjQyMGEwMDczNjhmMiJdZmlsZTovL0xJQ0VOU0UuTEdQTDIuMTttZDU9YmUw
YWFmNGEzODBmNzNmN2UwMGI0MjBhMDA3MzY4ZjIiCj4gPiA+IMKgCj4gPgo+ID4gVGhlIGNvbW1p
dCBtZXNzYWdlIGRvZXNuJ3QgZXhwbGFpbiB3aHkuCj4gPgo+ID4gSW4gbW9zdCBjYXNlcyB0aGUg
Y29kZSBzaG91bGQgYXV0b21hdGljYWxseSBoYW5kbGUgTUxQUkVGSVguIEFyZSB0aGVyZQo+ID4g
b3RoZXIgc2ltaWxhciBpc3N1ZXMgZWxzZXdoZXJlIGFuZCBzaG91bGQgd2UgYmUgZml4aW5nIHNv
bWV0aGluZyBpbgo+ID4gdGhlIG11bHRpbGliIGNsYXNzIGV4dGVuc2lvbiBjb2RlIGluc3RlYWQ/
Cj4gPgo+ID4gQ2hlZXJzLAo+ID4KPiA+IFJpY2hhcmQKPiAKPiBZZXMsIHdlIGhhdmUgb25lIGlu
IG91ciBtZXRhIGxheWVyIHRoYXQgcGVyZm9ybXMgYSBjaGVjayBhIGJpdCBkZWVwZXIgb24gTElD
RU5TRSBmb3IgZWFjaCBwYWNrYWdlIGFuZCBpdCBlbmRzIHVwIHdpdGggZmFsbGluZyBiYWNrIHRv
IExJQ0VOU0Ugd2l0aCBubyBwZXItcGFja2FnZSBvdmVycmlkZS4KPiBJdCdzIGFsc28gYW4gb3B0
aW9uIGZvciB1cyB0byBmaXggb3VycyBidXQgSSB0aG91Z2h0IHRoYXQgYSBoYXJkY29kZWQgcGVy
LXBhY2thZ2Ugb3ZlcnJpZGUgbGlrZSB0aGlzIHNob3VsZCBhbHNvIHRha2UgYWNjb3VudCBpbnRv
IG11bHRpbGliLCBsaWtlIG90aGVyIExJQ0VOU0U6JHtQTn0gY2FzZXMuCj4gCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IC0tLQo+IEphZXlvb24gSnVuZwo+IFNvZnR3YXJlIFBsYXRmb3JtIExhYi4gLyBD
b3Jwb3JhdGUgUiZEIC8gTEcgRWxlY3Ryb25pY3MgSW5jLgo+IAo=

