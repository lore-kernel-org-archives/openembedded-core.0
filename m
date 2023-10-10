Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D07CD80B9
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 11:44:58 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.93])
 by mx.groups.io with SMTP id smtpd.web10.89300.1696938288977982127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 04:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=KMx51Q4L;
 spf=pass (domain: prevas.dk, ip: 40.107.7.93, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbENjEMH6d94JXvB80UMy2jLx3vyTXHferSS7kpBfWuj+c5Xq+vak4NMBSM7ivG9rv4gBToT61IlNxLarsoUKmwYaKdc5uD7surx4+uuZxUeVVsANWsiQIBzNTpYIopKanr3TILNuwot/y+rH4fsFkXu7SS2tJyzyMixhPG8S/vOubHaQGgRoWTGW9D1pQuXTUFaTQgdJ4DT0Auw2iHbcWAR2odGnhNrtEaJNEeYX5pXC2IdLqteHFBsCt92kDdeibfCzrsDakK6LxpDNODLUV3S1D8CoEPkA6leTIpild1QNrsIpeYg+y8km3lYfCzixsxfuHgp5oNSeH82aHQf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhnNXFeyhZQRu2PYzi3yEAlNw1Hb9sr9ecd+7f+ROs4=;
 b=iPtKX3gvSVpdhnZtZG3TcD1a0a3i+TkaT+kfycCmwDXriI4Gf8BSGxM+Sr+hsIdArtINtktw0rrzMK929Fn7tQeD9JtT/tzj2EPK9ZOX1lbsFcRiAwa/lcwCl6mRuvTpm1YFVgD1DZWl/eR0x1uKXuN9Ez/W6WrYo93OP7gNFFYg5NsunzRQTOTzCXB7MRnulnujJIVPeAeBQJtJbLzTAPy7JueDU1nRhAZAeYVjbAp4ZytgTecWynex6VG4bsKN0zxjgq3fLslRSbOWbTRkpCJaE7spojDcx50qMUxTCwKSDKvIgTbbr9nbh7ED6Dk7QKY1ChzRtusRecMbTyjXqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhnNXFeyhZQRu2PYzi3yEAlNw1Hb9sr9ecd+7f+ROs4=;
 b=KMx51Q4LBOHz5E2z1atHlQTC2OR3Q+amDMghhO65WrGVVIX4SSHr8KrrlIxfz4GIPM4ppaAlBb0FkD17JuL5OywLp4rIkGJ5ruI1U5XCRADtu/mBTSpsg2ki4UBSB3L+cj8kRv4K5jhPDnGkwPa/6dfR+sUYeQWSrKLvUV9cxQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ea::10)
 by PAWPR10MB7174.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ed::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Tue, 10 Oct
 2023 11:44:42 +0000
Received: from AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2f42:739f:7713:5e99]) by AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2f42:739f:7713:5e99%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 11:44:42 +0000
Message-ID: <ca1963d9-39aa-d00f-6ac9-9ee919db7d32@prevas.dk>
Date: Tue, 10 Oct 2023 13:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH 04/15] perf: fix buildpaths QA warning in 6.4+
Content-Language: en-US, da
To: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
 <1c4a47b33bed622c5b7c137a830e359302293887.1688958789.git.bruce.ashfield@gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <1c4a47b33bed622c5b7c137a830e359302293887.1688958789.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0054.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::24) To AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5ea::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR10MB7082:EE_|PAWPR10MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: e340cc70-09f5-4d70-1c0c-08dbc9864aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AFaDiMt7Emz7hiHC0R8huYNmKnvBus430OPIcdONxAtCc4mNgJLcaUzJcXLQti9B8eX1t+zkRNZHtY16iLexXfFgECRShu1Q0cQKbiNXGVEVGbaoYZReHyUHsPplnR8DktwQVc8xMYmWJJYzRYQm8MKTXENNX47i2yfyAUU+0s/Lsq0hbh1b4k2rG5Ws7H7kGkZ+a69K2/vw7DZLjHAuO1/KjIdy/tCVUHUfXUBuox9Mc3oYsZiOUUfXfvenEyQwHN2Vdhw5NCKnYM2V80mrVDwrLbokaIs0lWxvnKNyioFTI4H9WS/wHulAjuD3oYEDCBbL0yrMxqDGblWDe79IG3xhN8F6H411VV9qLTq7vxR/unXUS/p8kzs9Tzl6DRy6BytnKPP3f/pER0ov9Va9T59XBY+3jGb0NXOCoUoB/SxA8Cvg/8TxWQA8uN9fBlD09qsEyh429ECziJrAKAS9WKsv0ayCVCQC2HdGyAf36Him+WgYSp2FBDwGBWJu8obRnwlUpfLeFliJNOGwt5ej3fbcHK7wx/tR3ci6OP+dhGVZCvouKyoxm2WyH/CVBT9yOHkcjiCfg2Gx40xd+O98EvCTB5hnuPIDlbkQTAdgkHbAOg8B1qU1EryXiK4Hx4ZReqPPUhd2VFEcPpmE7Nu3OdMSKaNFL4l4ygnAP0RTGps7pylSczziRnt9N4sOpwQE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(346002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(52116002)(6512007)(8676002)(2616005)(478600001)(6486002)(6506007)(66946007)(2906002)(83380400001)(8936002)(66556008)(44832011)(41300700001)(316002)(8976002)(66476007)(5660300002)(38350700002)(38100700002)(86362001)(36756003)(26005)(31696002)(6666004)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVN6eVc4K2JXVHRmeGRpUm5LSzBwOXNXNlRxcUZSR0pQYVlBY1p1cjBzNHhO?=
 =?utf-8?B?YTNlWDBMaTZHOUpCMFBRT2I2VE52WDFoRGQ3OHpMZTFKckJ2TktkSWpiVDNL?=
 =?utf-8?B?L05MaVd2SExXUktHWFBaWTV3Z2RHSlR3VysvVjdlb0VrMC9IeWlaYTVJTG0v?=
 =?utf-8?B?c3F6UmFJWGlobXlJZm1neTI1RWRkdEIya0l5elRtOXZya1FSZ2w4Y25SM0V5?=
 =?utf-8?B?TGx6elZMVnpzbDBtTEwwYmhLaHpLUTFNbVJxMGVUOWsvWWpheTJFZ0NneEZv?=
 =?utf-8?B?VkpZUTBDdXA0MUFZWUMyeUtzMGpSWlNuejJlOVBJalFHVzdBTjlYUUpKVUNk?=
 =?utf-8?B?SE5JN0I0UFFZcytLWmUwY0tDc2htRXZTS0JRMGc0TVdkbGEyamV4cFcrNjVl?=
 =?utf-8?B?TUkwUk5RUTE4WFBZdGdpelRYOWd2bGNnYkZWejZUZGhmbmx1cURad2ljMENH?=
 =?utf-8?B?aVZjQjY5Q3N4L25NU0FDdlNuWVcxalk1ZGlQbURjQ0tkOVB0ZEFzTUxORHpL?=
 =?utf-8?B?M29GMXNrUm8wWlFtbXRFb1ZtcSt1ajJkeSs0ZSt4RlJPRlBRUW56MGRFMEp1?=
 =?utf-8?B?ZVRORlM2SUIrY3lNbGNhYnZlbnNBY2d6QmZDZFQ1Q21LUUNlLzhVaWFpTnhV?=
 =?utf-8?B?U210WWdQc3JDbnArYjZOd3RQMXRIMUdSOFFQQWNEeTB6RWJBbkhqUWxUVWxT?=
 =?utf-8?B?RzFlanJsREV1bmFWZzVzd3N6cFZyOU1VcWdxcktoNzFxWWo3Tmx4eCtRd05V?=
 =?utf-8?B?ZmpCcmZLN01tK1NpRnF2THNXNXp6VGpSenpXUEp4Nnl2UWcxeTQ3WUVMUVVL?=
 =?utf-8?B?WFN4VnY1Tm5nRVRWSHZ4WlpTOUZsWHR0MXg1SW13TzI1dTEzazhFUFFkMWor?=
 =?utf-8?B?ZXozOHJCTzBPZkUyMFVwM3dTTWNVeTQ4Mm03QTRmVWEzNFNzeFNjRnEvN25T?=
 =?utf-8?B?d1RlMlNhNjJvTmRXQ0ZaUDQzdmpXRGIxMnQvT3BTM0dabFhOajZ4ZmZ1YWhR?=
 =?utf-8?B?ejZtRG14MldENm91eWtxVWY3bWcyaWRpWGdwNWJDODNVK0dJcHg5MUt2MFNQ?=
 =?utf-8?B?RUQ1RnZWZHR2SFozbjY2TmpxMDc0bU5sbHhaK0NoS0Fqc0x3UFB1LzJDSkNa?=
 =?utf-8?B?bTQ4WXhqTC9yeitGOG81OVZXS2N1cG0yY1daYnV6KzlCeWVuTFlvOXlQQnU4?=
 =?utf-8?B?ZXhqN09zTXlXa0lxNUZHWXZMbGs1dmd0a2lFV29Ob000c0JFaVRoVTBXNVR5?=
 =?utf-8?B?L1ZzMUtNTlRjRlYzbzNPa1RyZStQOS9ET2JHSVlxanI3NkVuaVNEdTA0TVJX?=
 =?utf-8?B?eDFoTm5MYzU0MnBFRUlxK1JGRHJKb0dtaytVNWlxclNBVmk3VmxQT2FvME9p?=
 =?utf-8?B?ZjI0eHdZUlg0MUVDTzZkRC9YUkI4SzBTTEw0cFg5WWtpUWZObk9nUzN1eGNU?=
 =?utf-8?B?VDJDbFNuSzlpOWMySEVjS2ppMG4wdVBkVlhZU3NjZHY0a3ErRWwyN3lEbEdR?=
 =?utf-8?B?ZjhKVDZtTmo3TGhPcndZd3JlWWYyVXVEVzVUbmcyeVc1NkorKzBaQ2R2V1FO?=
 =?utf-8?B?aTRDekltcGJ0WlZuR3cxbFdFL0xDeHo2UFkxcW5PcFdvc3UzRm92NjlSV3RI?=
 =?utf-8?B?cTJzR0pscDhOZldOZWk2amVackxocEZGK2NSTGYwNThGa1RjUVd1UXZpOGo0?=
 =?utf-8?B?TE5mZDlrZFBDR2QrUXR1R09LUWRWcnFneGFrQ2pRZ0dZVVc3ZmVma3BHV1JN?=
 =?utf-8?B?TThBQTltSldxMnk2ZEF0TWpBckxvMEVBN0NyeWdRYTNSYlh1b2VtSWQ4VUZn?=
 =?utf-8?B?WU0wam9rb3NPa3NwQ1RwbjAyekxHa1UyZ0prZlRibElrY3BKMlFvTWdudlVm?=
 =?utf-8?B?T2dDYThqRWc1SmpXL1EyNUtlY09wdVoyckxsQWhsTXJEYlRCOGxUOVJXSy9Z?=
 =?utf-8?B?RXlIRmd6YzhxWWpZM3NZdWJySHNTQkd6WEwrdnphWEtvVWZrRDFnTTh1WHBN?=
 =?utf-8?B?RFMrZnVkOXNPRmh5ZnB5ajhIQVQ2ZVBzUFg5a2E1VHRab2xXRXJXMmE2MTlE?=
 =?utf-8?B?TzlsbUwyN3lXT01ucmVKWlJ1R3k0RitRelJVZ2I2RERtOTFvOGwxcEhVUkIw?=
 =?utf-8?B?QUorRkFwQ2VhejI3bGh3dEtyT3lSWjJZSEQyS2E5R2FzOGJoRnhQSGI0RXls?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: e340cc70-09f5-4d70-1c0c-08dbc9864aeb
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 11:44:42.4590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0qtrxEOjpyWAGRiMLiOpPbCdMpDjYTEMlyYZ6vIRFMgW+Yh2phYKKzHSbfvP7AMlMTqSAcG61dtfkNsmyxYI8TduNq9K2klPG5JpDPSNT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 11:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188881

On 10/07/2023 05.20, Bruce Ashfield via lists.openembedded.org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> kernel version 6.4 introduces a new file that need to have
> absolute paths removed, so we can avoid the buildpaths QA
> warning and have relocatable packages.
> 
> We add pmu-flex.h to the processing, and the issue is resolved.

Hi Bruce

We've seen those buildpaths qa warning when building perf for a long
time, and they happen whether we build against a 5.15, 6.2 or 6.5
kernel. More specifically, what we see is

WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/.debug/perf
in package perf-dbg contains reference to TMPDIR [buildpaths]
WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
package perf contains reference to TMPDIR
File /usr/bin/perf in package perf contains reference to TMPDIR [buildpaths]

Looking at the .o.cmd files, there is indeed nowhere a
-fmacro-prefix-map or -fdebug-prefix-map, and apart from the bison/yacc
stuff, I also don't see where the perf recipe attempts to pass such flags.

It seems we can fix it with

$ git diff
diff --git a/meta/recipes-kernel/perf/perf.bb
b/meta/recipes-kernel/perf/perf.bb
index 420286e..59c0c10 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -81,7 +81,7 @@ EXTRA_OEMAKE = '\
     LDSHARED="${CC} -shared" \
     AR="${AR}" \
     LD="${LD}" \
-    EXTRA_CFLAGS="-ldw -I${S}" \
+    EXTRA_CFLAGS="-ldw -I${S} ${DEBUG_PREFIX_MAP}" \
     YFLAGS='-y
--file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \

but I'm quite curious what the difference between our setups is, since
apparently the only problem oe-core has/had was that new file introduced
in v6.4.

FWIW, what we build are vanilla -stable kernels, i.e. "6.2" means
v6.2.16 as tagged by Greg. The only modification of the perf recipe we
do is removing "scripting" from PACKAGECONFIG.

Rasmus


