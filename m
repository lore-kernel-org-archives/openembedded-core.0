Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466A4C00528
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:18:41 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.123])
 by mx.groups.io with SMTP id smtpd.web10.17305.1690906715465494903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=SeDX7Dx9;
 spf=pass (domain: ni.com, ip: 40.107.220.123, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSp7iFnDlh+sngn+gRRZjosJE93KsSOk/b6vLVZj9cnyEkPVPbTmOPHl73lzEl6igUMLSvG28htph4S4qfXgOXsyNlXtUTwunwzfnHK3llg8dPjjl6Ge3KzH3LQobOutRnFFvF861nYeXNGi8BdkSejt4WoIi5MUBnSGEOWxEjASoMLM3i2x1T+BbQY+xMiFvc7YV2hwW9rXMKgyTCEmpoMvHRSzPRLLJJyBSU4UBWJDrm+yhhdsuxOoTcMnnYq+UKLjSHi1QS66lsnEw6o98ouL8IdjYmJNXLr0u1/qIlPxBHX8/25Jq8q9Xon05E4XO9I06VASYS3n1CBSUwiyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kJlMZCZ/HxE3sc/SEo/Zn/Z/E1gOaDJNeNY3m6ukn0=;
 b=BXoWbGukzpbcCJeliaq4IgpK54O1qoc1mWRuJW2rNDz6Gk6wiLrkrZUvuTmPvq8vF0X5uNQ8hG1ODc/dQ9LeIsHR09OrimVbDDmET5pUi1+46gqk+5e3rv90IxO6PB4oNfmzJGlwpjOh8G+OOPpNC87dC13hx/RKsfSHXhhQAs/yG2+yvhdP/NNDFxIzQZdPlpoQTBYFFQsd5iuZ7UeVsBX9O0kQO7492jPGne3C338DFqZjOOzEaIr4Zl1l4AlWUPWHYnGTiJlGWOsTpT20k4kLEhi0qBSdT8uhdkd1ymSzd586iEKN8i99MA5OiIdGjXFDXWkRVGIXUZlbq8/iJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kJlMZCZ/HxE3sc/SEo/Zn/Z/E1gOaDJNeNY3m6ukn0=;
 b=SeDX7Dx9WcmlykUdmfZ7coCpraufaPK3VkEqFWI1WQtUVfllk3GevLOypBPne5Q/yqWr7RAhEMOnNwUB437nOhhKO5i0sszSaLjlqbh7gceLS0BBIpKIYXyGAeycTWIFohCvJcg7aGqFkOYANlstn5tB+2FS8MMr67Uu/xaiO2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by CH2PR04MB6618.namprd04.prod.outlook.com (2603:10b6:610:68::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 16:18:30 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 16:18:29 +0000
Message-ID: <0eb9fc01-30df-c9fd-8b27-e7f7eb0ebd23@ni.com>
Date: Tue, 1 Aug 2023 11:18:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe-core][RFC PATCH v2 1/6] bitbake.conf: Add new DEPLOY_DIR_FEED
 variables.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
 <20230731215310.3949441-2-charlie.johnston@ni.com>
 <CANNYZj-Q0FD=1Bvczk=m9HhLBBk+Sfzx0TFQQci0+n=wOfOBZg@mail.gmail.com>
Content-Language: en-US
From: Charlie Johnston <charlie.johnston@ni.com>
In-Reply-To: <CANNYZj-Q0FD=1Bvczk=m9HhLBBk+Sfzx0TFQQci0+n=wOfOBZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:5:74::46) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|CH2PR04MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 04458f6d-6f9f-410c-bf4d-08db92aaf16d
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u3u+xborWP+2R2PGs48bfDRXFjE52svh/9Xrc3lSsatRGbh2mmp2EQH+bh0hwimD8MAdddRdjKG5wPeWpMXpsVRd59ze2nUTcz5/2NTd4VSh81/FgYFtb8wsWnLA0AnJ2pEjSyR5qMh4DbCocWgUwY90JhSCAP1JvLOyMBHz0mm0Fy0uiSbZB3zbhjT0HzMfO9zZ/roqyOviVyWv9CCBKOea/Pvk4ACygXqELZtNJvzDM1vrx5ZTwZzBFMrJ/WvL3ylddfOj9Bx9sgrb/OZT8NBv0rxBd6gtuPLKplQQFedlJSZDWqzUggWHANZw6+PTAVLgO05j/BPnDyJbO518foZZ9QjqY+KMoOXTJ0NPTbjfO5Tdi3h2Bnwnl5ErbauesCdDkP1GoH4j4yfDE8GL0TcSq3TOvgThX7qrypyIME3WZJ/hFOGWoo1yRcyhwTwi0HSYERmFMeelKvZq1ehqP+ENwXU4DXFztOwFPt3a5wwCqxvwmPkKUwsWlus3nOf3UEsJiAhuFa9Ejvlr513Tz6HiJCzHLWSVSa44laK3HYWhYAhgLFyUiUaWGqxzYw7ucJ7XEgZ6nOIuhYprZbDFdJR52KobU/cGBFYbDyFHv2aPCD6srhnmM1msw5SIOHd//IsgQE6v9U02J/pj7/I3iA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(478600001)(5660300002)(26005)(6506007)(186003)(38100700002)(31686004)(66556008)(41300700001)(66946007)(66476007)(44832011)(6916009)(4326008)(316002)(8676002)(53546011)(8936002)(66899021)(2906002)(86362001)(2616005)(966005)(6512007)(31696002)(6486002)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q04wWk9lSUV3MmI5VDRuLzVFV3ZFVjlHQzZaUnQrWlVtRU1ZL3JLRnlMalVW?=
 =?utf-8?B?TEMrRFphZWova0g2MTZ2eFZNRUl2d1dmYjM2Y0QybVJzQ2VEVzI3VUtCMWlQ?=
 =?utf-8?B?SEwraTRkcFVvZWJ6bzhjVHpSVFlzZW1yeXpjY2JzcldrWnFMM2NSNG1IMVRW?=
 =?utf-8?B?c3Z5OFZ6N1hZU2N3dHRaeitBemxkNFVjK1V6UHFvNE54VTV5ZVpodElFUnhj?=
 =?utf-8?B?NUh0ZFZVazc1M2hFSkQwT1plMCtDTWU5M1I0N003MjFEZ3Z6MjJkTVEyc1JF?=
 =?utf-8?B?ai9BQndSV2ZWTERueGlXYXJ4S09uRXFCS2lPdGYyRXhjY2ttNXZaTnFCTzM4?=
 =?utf-8?B?UENyUXN6QW5iNms1V3VuR2RmM3g2RVNGRnEyL1VHa3lXL0N2Tm4xSDRNTldN?=
 =?utf-8?B?R0N6ekZrRFFIRFJTRW1nN3pHSVNjZ2dnOG9naTlXMXBuR2p1QkJxeUZFQ1Zz?=
 =?utf-8?B?SCtCbkFzcUxaREgwMUxtQS9icUFrZk5xNmQ3d1FCaXJ3bUpaVUhPUWVPNWxn?=
 =?utf-8?B?NDE2VGY2d3A3MDIzMXVnWE1UVjR2Mk83dTExTFFpZ2ppMms4KzkwcGRvc09C?=
 =?utf-8?B?TEszazcyclE5cW5jc20rYnhJSXpXVG0ycWRxL09Mc1U0ZVh1OGxrbDJMVVor?=
 =?utf-8?B?SUh4US8vNlhpV094NXUwSlNKNUo5YmFKcUx0TjNBOEwrTUgxRXFzcUczem1Z?=
 =?utf-8?B?Uk1lVTljaVpITlVyZjNuNThuTnM5NjNxR3dZbDcxQ1ZzY0lGcUdrMXJXbkd3?=
 =?utf-8?B?UEFycW1vNDQ3RTROQjI1OEpaVEExdmw4d0xDOVVEV3FNd3JVTWprQkVadEds?=
 =?utf-8?B?eEdEQ3UyRjlveTdXL3hEOHdlQ285OUhwVDJYaWRBVEJEdm1HKzlUcTVGVFJa?=
 =?utf-8?B?ZmM4SU54cGQ2WG50ZWFhYTFwaGVpVGpjWVdocmVTMTBwMjZVTUd1M1A1SHRD?=
 =?utf-8?B?WXR3M01sN3R3bkZ2eENkdjhWbENqT2FJMzB1ZER4RHZGU04yRllqTmVHUWN1?=
 =?utf-8?B?aEdOWGtCQWZaTnVTR3krRHFGRlZEdnNadm5MVFFuV2wyR0JibHdueVdZU1ZX?=
 =?utf-8?B?SUlSSGR2QURJUzlsSXNOaENPdjFxbVA0b1Mwa014eVFyYXNiRUJQSStzVmt5?=
 =?utf-8?B?THdJdG1SWjBJOE9qVmVweWtBeVFsRE53UHlWcTNhVWs2cFpLWDg5cVlRaWxX?=
 =?utf-8?B?MGdlM3FkWE51Mlo1dGdGZ1Z3eWhXeEUwVFo4RFhTby9oMW5sWVRxNTZGL201?=
 =?utf-8?B?dmJ0SFFVU1YrbkpybGZrTjIrdWd5OWFMTE9kNWRxTHNvRjZOb0psWDRkdGps?=
 =?utf-8?B?YUdudEtXZUNJdlhLR1pmTFBPcFZSMzM2dXBnVFNOUHY0Y1Nia0RzT1o1SWI4?=
 =?utf-8?B?YU8vb0gyUTFUenc0RzlySklSYllmNDYrcTRYUGxxdmd2NmJwTHMvVC9TUGhi?=
 =?utf-8?B?WWFjb3F3YXRwRHlxeHpKeElka0lZVGNONDNCYmNKcFY5d0FMUnkzMkFUVUJI?=
 =?utf-8?B?STNMZ0svNUs0S3RTNDBMSSs3VHpPQnlJV0ZDczk1Z25VZjBWNFBRZEI5Rk9q?=
 =?utf-8?B?dXVDUnlWOHR5VDBjSW5LdXpUYklqUGF1UjR6cm1vUWxCSG1MZ0Rha1h3Z0x5?=
 =?utf-8?B?Q1NldlpmeDBzZkNUUUNLOXRwcnVJR3d2TW5qeWd0eTNPcE02Ly9UUHM3M2lH?=
 =?utf-8?B?Q2UrTWlrbmYyb0x3WE9VMjBIKzBPdW5pQ1BuT3A5ellVT09DSjZqcWlndVFw?=
 =?utf-8?B?YXlncnhxRjZGcXNqYlRsN2tyRmlzM0s4K2pJNjJvZnhKdWZ4YXVyV2hiL1Qy?=
 =?utf-8?B?WFZSOHkwOGFQYy9sNVdJYlBVL2NpUEZBN1JNK2c3Z0tjNWRsaHpZYXBqTjU3?=
 =?utf-8?B?eVp1QmNvOEVuT1pQV2p1RXZVNGNxNVNUZU16em5haTRIY1JwSHpJTWgzaDNL?=
 =?utf-8?B?ZS9xc096MHhRaGYrWXJNVTl4aXN6Y2s4NzdvVXMyVEpYWFhsRWNMdS8zL0w2?=
 =?utf-8?B?SXBIYXVRa1JzM1hOT1R6bmFqZXFDYXF6ek1WWjZuZ0xmYTI4QXkxWmpzMDZv?=
 =?utf-8?B?V2Q2eW9YLzhqbmwxSnEvdks0cWdya3VoQ2VWUkFUekx1eXhGbzNHa3N2SU5t?=
 =?utf-8?B?QVhPaHNHcWlFR1o4VGJ3NjBSbkpQUDM1UDJnbHNmR0kwSTllU083WUtlczBu?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04458f6d-6f9f-410c-bf4d-08db92aaf16d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 16:18:29.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XanZn04NcjeLVMDOs1Zi6fanX7tpPNHyMRv600FDv6NeDqh7A/oPvXYDds0K4DfMMJUwu8wgo3WKYAfOMTDGKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6618
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185256

Ah, good idea. I had the bbclass adding the ${PN} but it definitely
makes more sense here.

Is it worth it to add [lockfiles] for each package type's directory?
Or maybe one at the top level "feeds" location?

Thanks!
Charlie Johnston

On 8/1/23 05:25, Alexander Kanavin wrote:
> As these directories will be written into by multiple recipes that use
> the packagefeed class, won't they race and step on each other? Should
> there be a ${PN} in these definitions?
> 
> Alex
> 
> On Mon, 31 Jul 2023 at 23:53, Charlie Johnston <charlie.johnston@ni.com> wrote:
>>
>> This change adds a new variable that defines where
>> feeds should be created when building a packagefeed.
>> A feed location for each package type is also added
>> to allow multiple package type feeds to be created
>> in parallel.
>>
>> The location is ${DEPLOY_DIR}/feeds/<pkg_type>
>>
>> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
>> ---
>>  meta/conf/bitbake.conf | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 8daaaad615..fd1738069f 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -450,6 +450,10 @@ DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
>>  DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
>>  DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
>>  DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>> +DEPLOY_DIR_FEED ?= "${DEPLOY_DIR}/feeds/"
>> +DEPLOY_DIR_FEED_IPK = "${DEPLOY_DIR_FEED}/ipk"
>> +DEPLOY_DIR_FEED_RPM = "${DEPLOY_DIR_FEED}/rpm"
>> +DEPLOY_DIR_FEED_DEB = "${DEPLOY_DIR_FEED}/deb"
>>
>>  PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
>>  PKGDATA_DIR_SDK = "${TMPDIR}/pkgdata/${SDK_SYS}"
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#185175): https://lists.openembedded.org/g/openembedded-core/message/185175
>> Mute This Topic: https://lists.openembedded.org/mt/100471799/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


