Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06629C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 12:52:05 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.44])
 by mx.groups.io with SMTP id smtpd.web09.9216.1634647921957412537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=MXofikjO;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.44,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZNXeQCqdImBd3bkmBqArCu4PbKy18YkOBxwX/NphM8UR+y6GoB/PiahNVJnWBxi2aFlCz8jsCKfv2PLxYmHCzlPKF2ZpEkoKhGiBPYN/I/8PVzVv8D5KUoxbH6hyq7yJn1OGemdrcK8s1e47x+YkTp/xtpDN1Z/CEdWRvdxkjbtRTmHnmxwYOMS7bwt6CtCmTj5FZNg66Oosv5vNkem+VTiTNL1MhcTKJ8ail9cM1op3DoJcP74DMDdLebTa5fqf90fr7fUk3XIG0+x90BjKoKOLFloU0zqHSU2omK/buMBX0Cobd2QjytbqRuWwMHD/aiBuQvZdKdiGPmR6DtSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNfZJFVuOJNZrCIGRr5AQSaSe/7/sxyi1GFiyYboPj0=;
 b=FM9RtJKf9cAFC+FD6toILAuzMJvRtjRQEG8wwJLPh3a1q3ZPrVLXMXbBOFozizPiSZm+ywrowLZ1/KJsHBppBu/rKLxjZFWND/K/6ZXVjw2dc65onRXEtk2kj+jxNwcwvnWNJuBvnQeoQm+hIMMUkAFQa5m/NBlkxhcHBi+qPwQQaItkc8uGgNCah7n7sF2i/mL4PmgLxcQt63+GYdCu+acqNd7ZpAfgCgDfF01MXLNTDUZ+BZ9FNY/gB7y327fFlnEe4CB9tiaKVHSRxeMsedgELBZ5XwvlFYrv6KZlndhysM7srcEs5HM66jEgg6jt4wmDBQr/iEQou01skKCvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNfZJFVuOJNZrCIGRr5AQSaSe/7/sxyi1GFiyYboPj0=;
 b=MXofikjOkqSsdP+wmfdZd83SoyLQyG2xYSF/ZmKNOXHYFjt6E4Z6VEfl9TxjGjIXWkkL8D5ijvdvPmWYS9GJxS/hjz7FyBUVUShntyV5kp7cPAvLIPinz5A8VBadINwEOTA1nMRQJ4xWrDcuE8w5RYKi31zMgOk+FN7Fpbt0+z8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6448.eurprd08.prod.outlook.com (2603:10a6:102:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 12:51:59 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 12:51:58 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 chuckwolber@gmail.com, oecore.mailinglist@gmail.com
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <71df6b93-bdcc-b09f-48c7-3ec822ef3228@weidmueller.com>
 <AM9PR09MB4642A8B32B686649507B9406A8B09@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANNYZj9eeW4+uJ=-fB1pDZq4Qa0EbgwRCCXXiEjrzuGL-jcq3w@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <89e69707-d624-865d-f306-00ef8018a8de@weidmueller.com>
Date: Tue, 19 Oct 2021 14:51:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj9eeW4+uJ=-fB1pDZq4Qa0EbgwRCCXXiEjrzuGL-jcq3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0108.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::49) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.34) by
 AM6PR10CA0108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::49) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 12:51:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a412be1-7098-4ae3-5245-08d992ff3cfc
X-MS-TrafficTypeDiagnostic: PAXPR08MB6448:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB644870ECEB297CEFC72C752ED7BD9@PAXPR08MB6448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LqNOubMfQAWO6QpFpF0rLRoIimrsHLbTDpSNH6tHP+O9jW0DprUmuWX8CcsKHXLSHsdgBTLmFewlbWRpa94zri7MiTCBojt9UnkaO8/vI5UFWXbEVB2A2Dpe07vgbrzT/QLiT6F/1cQ1KkX3asDIozT64sSD4eKNrVFEtI4O3Jl3PnvI9RNcrEpqipsAIecE9FxMPv3D+OsRdrejA9Gj/smahID/Mg8rTFIfUR+OFTkV0eW8b1Z3eY4x3Cnoprk4N8wjm+/mnkVsPmBgW0yeoMZbINoHXyJVgCf57841l3mqrI1yK0/+g/SCc58WpPDUVq4h8IAT09ypyMQkiFx5nbukkZfvl7Tlk3Bl22VjEkr8YORWBgQHp1VQCvg6Lj+woMZQoOY0+103gTz3GAwljhzZWwYFrSOhFCLbTJgaIPtLcpGoM5XBF+b8ZxiuZQJrRHu0tBjnrdK8ic7mIYvnkNfx5TFNKgp8HiEADz7h/3uwBGazvcES/yDukXWsEJV6Lhr9LHash7x709HNDQscy6NMcp1XgN6G3E3mm9kkRGu5S5cUERMYRBUEGbN7hct++MgoYtcQxzsaT2rdSo8ejH7T8R6SGDTh1/pPK3VcTWsFCVxw2rEVr0NtXMKXEEfV1uBADQrF1k1U5wed4R9jeccbvDq8bGKDouJhteRxYQjHcNwELWSyUn70G3NnyTsb6KmaNjnfFO3FmfI0JvFDHSXjH9Lpb2i/nZL/wJR+3RJuVSom/Kdtjx7PQEL8ha8GpId/AEewNCwZafwZOfad8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(2616005)(956004)(316002)(31686004)(36756003)(5660300002)(52116002)(4326008)(66476007)(31696002)(83380400001)(6666004)(2906002)(26005)(508600001)(186003)(66556008)(110136005)(38100700002)(16576012)(38350700002)(6486002)(66946007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q081WEExN050Tjk0VktrRWpPTUI4UUptN0p6TnpXRFQzRklPbW04T1oyWTM1?=
 =?utf-8?B?dlR0TWVmdDlIek96b2MzUkV1WlArNkZRZG1QaGEwK1FJZ3pQV1VOZ2tjUkl0?=
 =?utf-8?B?QXc4WkhjM1lTVWx3YTVhSUVWdW96ZjZkWFdYTmNmR0FBN0FsQ0JCbVluOWUr?=
 =?utf-8?B?bDRHY29oKzRLdlB0WUhicEZ1dE9aR1dqMlYvT0g4a3VqbkVjVFVPQnhlMkIv?=
 =?utf-8?B?WXlCWEpCaEpuMEdobWx0aFVEK0RMWGQvTVNwL21SU09rQ1Z3a1MwV0xudVZZ?=
 =?utf-8?B?YUZqcmZNR3luZWlaYm1GN2pMWTB3enI5cWZqNk9CcXpkQzRnRmhjbE1XMlhG?=
 =?utf-8?B?aTJPa09lT3A5dGRCeDhFcmswMkRIdUVwUmtLbTRSTFA4ekRmRnpUbEFZa2sv?=
 =?utf-8?B?WWNsVmVXU3d1dmU3MmphQjIrR1BKR3laVFpkRUR0ZDZSWUFwL3FtT2dxOFFL?=
 =?utf-8?B?WDdIYTdzSmxNUDhURFhaZFFRekgxc1EyT2xUN3ZhankwQ3BKRzF6SnhPNzVq?=
 =?utf-8?B?Q28vK2hzM1VGTVF5VHJMeWNQQk1EM0ltTWZudzhKbkpDS284YmZpNG1seDgv?=
 =?utf-8?B?U2FwdlcyRC93SHRnczFCSXRaWUNMcEdNMXA4dSt5MFBhVWFNK0dYV0NLbmJw?=
 =?utf-8?B?TFY2ZFh1YmVneGE2c2x5bEVueFdOK0tvN3lWSk55Q1oxdERTZGJWTEVhK2sw?=
 =?utf-8?B?R0Vtd2dPeGFPdUM2ZXQ0SCsvZ3FKNDJzVE9aeTlyNUNuZDFzRVdMUFJhbElC?=
 =?utf-8?B?czRaQnRzRmNmdFRqS3haMUd2ZU91MHNyKzc2ZUxJSXgxSmEwbjV4clp4dDVY?=
 =?utf-8?B?YS9JTmxOS2hFTExsTlpxVlN0aVNMdkVKcnlNcis1dG0rc2x4L09FSHc5NkFy?=
 =?utf-8?B?V2xrYjdLVXVUNHZtcWxPWXJFVGpjeS81aDI0ajJBdnJqTDVhOWNiZmVVcEk1?=
 =?utf-8?B?SmdVcGgwYktzZ1lTNGdpWUU4eEphVmVvQXZocmt5elBCQVJjdHBUUHRCSlJO?=
 =?utf-8?B?N2wzQWNISFR5dHE2U2RmRGoxZmI5VncwZFhxOVFRM2dzTmN3SFBuczNjRnBS?=
 =?utf-8?B?SE1RTm1PQWZlSkJKdU1seWZMdlRqZTlKWk84RkZyYW9SMHU3aGtWODIxY2ty?=
 =?utf-8?B?c1NTTWRrYnp0eVhGanJDY3VESjlEWmluSnRTYVY1R3ZQQVpFajVoYW9LUHBu?=
 =?utf-8?B?N1dLRHVhcUVEMWpVQnJIeG1scWhNcWhLMFVEaVMxbkQ3MXU3bmVnNW00TUIw?=
 =?utf-8?B?OE4za3ZEWUoxRlVLZ25zYmlyQmlqb2VEUnhvc2tvcHpOL09heU5qYXdnNDRv?=
 =?utf-8?B?ZmxSRnZqTDQzUTVrN2FKQTZsZTZ4Z3dKM0tEam9FRnllZ295UUtLWkxWMnJQ?=
 =?utf-8?B?ZHZhTElkK1dUeklTWXdlWWJqY2pyVTE2YjRPclZXRmNqZFprbW9PWG1MdjJr?=
 =?utf-8?B?Q0lGeHE4R2ZRZ0pBaHBKUFVaMngvMldQZDhBSnRxb210WnNSN2FlQ0NscUxF?=
 =?utf-8?B?OVRMYzRFMkJHcnlvYzY1NlZUYS9PVmNOcnRSdDlzdncyYURCY0xHOG9iVUhU?=
 =?utf-8?B?WGdYTVIzQTZ1aGNiSzVpT2RlMm11bE1ycUppaUZDNTNVMzRXdU5Wa2I2eXE2?=
 =?utf-8?B?dll1VldBNC9KUTd5dHJ1dXhqMkFlL2Y0QVBadFJzMmZVZzJOdXRSaXNvYWE1?=
 =?utf-8?B?M2JLdFpoaTg3Qk5RNHdhTjJwWHlSd3hrYXF2b1EySktwWC9zM0ljY01renVh?=
 =?utf-8?Q?Up2soAQ+mKCipqvm+VZ7oyPDesx1Y729iGfoiqI?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a412be1-7098-4ae3-5245-08d992ff3cfc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:51:58.8405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xeiShjEZTqYzVe8cvZtvrzqzcoji00pw0Pm75EsXf3/1ZuVZKh8kCBLcDdyHbipjDSNE6Z3BEFp1eiCO58AXbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 12:52:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157115

Hi,

Am 06.10.2021 um 11:47 schrieb Alexander Kanavin:
> The OE landscape is littered with unmaintained or barely maintained 
> layers. By the looks of things, no one wants to maintain this proposed 
> meta-nodejs layer either, which involves thousands of recipes, (so far) 
> non-existent tooling to create and update them in scalable ways, and 
> rigorous testing. Or such a layer would have already happened.
> 
> It's for this reason that I think the shrinkwrapped, self-contained 
> recipe approach is more viable (even if it comes with its own pain 
> points) and also matches how node.js community operates - we can fix the 
> CVE stuff as well to look into dependencies if that's a concern.

How should we run build scripts which need native npm packages and how 
should we handle licenses of build and runtime packages?

A simplified node.js flow looks like the following

cd ${S}
rm -rf node_modules
npm install --arch=$NPM_BUILD_ARCH --dev
npm run-script --arch=$NPM_BUILD_ARCH build
rm -rf node_modules
npm install --arch=$NPM_TARGET_ARCH --global <OR> cp -r dist/* ${D}

Should we split it into two recipes or should we handle everything in a 
single recipe?

Is it accepted to use the output of a native recipe as source for an 
target recipe?

Regards
   Stefan

