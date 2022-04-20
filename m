Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDF5C63714
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.9390.1650469300468850219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OVuxGzUb;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1109983ce3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23KE0Q5v030994
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Apr 2022 15:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=v5RgrXINkYMgA5+QtaJ9qbyYpXunMo9UexvMhjk6Qdw=;
 b=OVuxGzUbExPDOfjrxr/kVcN9emyenj0pnDrWo0FQucxU1WXPwVPoNFO2iYSu32qSo5qH
 bsenFIbDSEDc8jTXAoDVdxEwxszJrFkYCSbeeaRRlWWVpWkLhu+gtwhgRH4a+VRotPOq
 ZmaXClRHnTGY72FMUGSZqsQkRRNGaSNyUpMHAp9+pt3u+jbpO/ktFzW8MkJMpM93zmNn
 KoW5ZGCzjItzklbVGI+gN8BWYnum2zrkN0FFeqabDeKK82jzdoDJBXlz/r/jZ+y/7a2J
 nubrQXXOBBMOi9R0vZWG7QTFR4kHIkoW6eQ8O3jeZrNG7wu8oyDu0p9JeY5wonHJGQqe 6A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpqn32vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 15:41:39 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23KFfdYq026871
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Apr 2022 15:41:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpqn32vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Apr 2022 15:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYykzdgEA/5Ot+Tu9wSGyzznhkfnOzMRseK7DuTXiVTf4INOJMJNTiIehLf7URdplFlTFUfC7uzX7q3uX+fCIoxLRUSu+jNLv5kHfTg7NIIblt9Pa5fvRMm3SV0WbAg4i8IMM+m7DVQDTw49+beU7+P6lLOviV/e2odIukg0piXhaK77uNpCsqdiL2AAGx65Gkt1FC54ASEiar5vJY++Bvvp5V9qmd5VAjq2ryjMABcaOtdAOTXxhbpGYoc3DdyZeGyeRcDbvOkp4ZcXUfmdUlOSB0W9tRn+AADa7/cgQzpNsAmJK6hb/z8Iq0lPTXM8ny1pelp22XfOKwnZK5urfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5RgrXINkYMgA5+QtaJ9qbyYpXunMo9UexvMhjk6Qdw=;
 b=W7TN3xWB0LMddKaA1bEqva8DKdIHgPwY+n0Y30Ccve0omwn0q+ck0dacTYKnRsSblTzzlURCrgjx+aQhIN+LnUdnkB/pEE/TuTiconAw9HNiVYnNfvu/D1DmYb9cbPcKlhv8BVAYkSeslaKPE6jdAOYIJ/1i9Zt3b+s+0mnDSHlvOgzm0dsCPDoZOLxUaT+KSH9q7SY2x4NHzsUfQk/tKTDVcWMdYLdclNtDgPIdb7uyxSm5MwOAZvzXrsCowzsvIVLSFHcKN9bDCWIbQ1f5HvdvrUU2IE0eu7MZ6NLL/9SEGpx2aVyK8uh0e1GDLUu4uvPZadC+xItD9hul7KU8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BY5PR11MB4193.namprd11.prod.outlook.com (2603:10b6:a03:1c8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 15:41:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 15:41:35 +0000
Message-ID: <5cab64a0-a667-47f2-4e36-5da9f47550d8@windriver.com>
Date: Wed, 20 Apr 2022 11:41:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest
 version
Content-Language: en-CA
To: pgowda cve <pgowda.cve@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Mittal, Anuj" <anuj.mittal@intel.com>,
        Randy MacLeod <rwmacleod@gmail.com>,
        umesh kalappa0 <umesh.kalappa0@gmail.com>
References: <20220130062039.151292-1-pgowda.cve@gmail.com>
 <3fbc21f8-da33-55f5-587a-aadbe34e8678@windriver.com>
 <CALY4986MhE4bJd-_1zRrE+W2nOCkzZZ51MrqpSJPkszodzxRTA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CALY4986MhE4bJd-_1zRrE+W2nOCkzZZ51MrqpSJPkszodzxRTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0059.namprd07.prod.outlook.com
 (2603:10b6:5:74::36) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10654108-b89f-4bf0-a072-08da22e4408b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4193:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB419322C641DE9AB2895ED13DF8F59@BY5PR11MB4193.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xZzJ+h8x4IyE3HzKSGI0WREfwAV41RDoOszr42GBm0+X3G8rSzegNHBd69TElThSB+447J1kejh+QhIYPH1ShyRtsHCJ2nPcvKVt8m7We/+8uW9TFk5zXTJL6/S9o3o4FTN4IqbPi4ygAzClpGB0j5pYJyEtTc9GxqZ8XpNnjf3FYwnAEIDGl+YQYQc6x4iEZayen7OXV+f5qAEV4Mtfmsti2w3RIIxizabMik62snRCGkpFVvKxXov2e8+/aFHqgyVkplR0aHBFdel1oMcN5vTB/Bj3G542XLb6emY0b18lZaNAfA7Crz5S6cVLMZOZ+iGp9KqemqSocSkqzNsoEAEb3VjTtPcO4j8Gx7b+9cn0kiwySXNShFmz0h2j19yEjAocgBxiKe9UcJfUZ0Yee5Q6ADK/oWxC4kRECgyw12XguCvTmu7+LYuOX936HKmJZ29W+CAravhRL164YUgT5d6kGLXf4YN3Leu9ipGContN/ob066HQXWFyxiJ6bB4ckjoQEeOIy+Ogp26J8NF2e6pqiaOkqK/0v3pnJbl8JmNzYRz+oX4FxGzYN49hZ0Fc/CIKMSZ3HXCAsqeF+ukEAWEX3kVPEV3FQmRMBcXUmLAygZ9UtUXOt0z7A3sHek8VNIl0blLsOhFIP7HyuYRwKCl/76zsVrYA3sV11omMVipQQDdtwT1T6/OJOtoK20WB35yvFxs0wbYIya1avgvqkZ5XCznlSNfZ1ulQQpBhJFFUgE75avBEIf4yTm/unyv1Iu2e57mUtA586l7SL81w8dOZCP84c7n2BrzvA1eqEYe8LLgDiiQHlpEGKsXvSPnL24sT2xoGXXgjJMzPxaY7oNPuNWQPYhQaZIC0akAcd8/b61WQqPYb9mieh167capuw4ebFHOPN8yhJT5hr/JHRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(6506007)(66556008)(6512007)(2616005)(31696002)(966005)(86362001)(31686004)(26005)(53546011)(316002)(66946007)(6916009)(54906003)(36756003)(66476007)(52116002)(186003)(4001150100001)(4326008)(38100700002)(38350700002)(8936002)(2906002)(83380400001)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGxFNnh2WXJjYm9PaHE3WkxqL0dNYVl5VC9GNDVFNkZBcDVxUURocVA4bm5O?=
 =?utf-8?B?MzhzQWxFYmhCSkJpSy93WWdFRnhwYUJtdjFTUjVhaW14OHI5YjdnL3hLSmdr?=
 =?utf-8?B?VWlvOWlZMDF0KzFkdGRoUUJveUhOZTBzVHcvOUg5Mk9iVjFRWWxEdWxNdUJ5?=
 =?utf-8?B?SVZ2NENUZ2RiNm1veXpSL2F3NHBpdTdWK0JzcTFNQVhlWFlLQThDLzJZMmpI?=
 =?utf-8?B?MjB1cGlDS3puYmFwM2pRVDlMTFVQZmRsb3FvUTBob09CeEhkNnBhRFFNcHAv?=
 =?utf-8?B?bUhhWEw4c2JtbnUwd1oraXh1bGNEU2R6YU9wYVMyOXB5SGVHTzA4Q3JKWDNM?=
 =?utf-8?B?a0JQL3dXVElJanJzdmNBY2pjUWF2Q0szMjNxWFh2MUFOT0o4di9EWGVHNk5s?=
 =?utf-8?B?Zm52S0FsVFlZMUdINUxOdXBTRTlSNkVUZXhSVEJPTlhZM2xJMkJKa0VnRWhs?=
 =?utf-8?B?V1FDN1dCdUdLLzdjSER0Ylo1THRocXFTdWI2ckNWME5lL3VPS1g0WmhFT29a?=
 =?utf-8?B?eXFDeVp0TTB6T1dEenJ3Rk5sVDhFSWI1V09YUVk4eTdMVi9LZ0xRRFRYQnZR?=
 =?utf-8?B?N0g2R0dDd2NUZVAya2JFMGRDbFoycXBGS2lOeTJCKzdHWXQxZlRIUDIxY3Z6?=
 =?utf-8?B?Rlhjc1JHZ25yTW92Q3BHNjJvM2VOcVljM1YyQjQxMDdialR6am1JSDBTMmw5?=
 =?utf-8?B?MndDMWxnem4wZkMraThHUW1LUDhwZ0diSFN5MFhCR05jQlVZVmFheGUwZjRN?=
 =?utf-8?B?KzJYNDJEM0t1eGZTYnBOa0dYSFpPK29pSC9yRU9CcFRPaHZVRHZtRkJSWDIw?=
 =?utf-8?B?UFFmK3k0L1dBWUNBbG82ajk4YzNRNmRQcVBmeHFWeGhFaXFOcVc4REp5cEw1?=
 =?utf-8?B?Tk9iWUl0cUQxWG5SQ1BXdjFxUW01SjVmY2pBeVQwTTQyQkR3S0wvNks1NjVC?=
 =?utf-8?B?ZEZROEhmOTRQUjZPSm1wUWtWOFdEY252NXc1QXkzVjF6VXFhVDZ3VGUrL3pH?=
 =?utf-8?B?dkdFbnNiTjlxUk9DWmlleUY0M2hmN2g4WjAyRThZSlZDemd4NU9QYy9XeVc2?=
 =?utf-8?B?elNYWlZBejRuOTFjLzRpcFR1QnhzTER5OUZGNkhaRGNiOUdjWDVnTGZ6MDV4?=
 =?utf-8?B?SDRQeFF2VmxqYmVZUVFXLy8zQzNQNXkrNllMcGVOdUtsb1RSQ0tLeWluTE5S?=
 =?utf-8?B?U3YwWGNIT0s3blhwSWRlb2hKZFJDWE9VV2N5aWFVa1ZhZ1dxd0pSVnZFMGpT?=
 =?utf-8?B?bldOQjdWOUwvaFE4ZW5McnVZa1A2a2dhTFM2TjJuc0puK0xBQUE5a0lYZ2tn?=
 =?utf-8?B?VTQ4Q0QrU2RsUlpjTFYrZ1FHOFRkYzNyb2xzMkIxam9kWVkvRGVTQ3hNWGx5?=
 =?utf-8?B?MmcvZjBUdnNDSkltb3ZWV0tzd0lYSFlxN2l2Q3dibnFRdWh0WWNYazhVSC92?=
 =?utf-8?B?U0k3Y1ZyV1VCTnFrRURrV2lDZDhacHBidnFYVGNlMERTcEI3elNMcDN3eTl0?=
 =?utf-8?B?OU1DNzdvcjNjVVJqNlhPNmJQS2JQRUFmSE8wL0FYOElQZFp0Yi96ZzhjbWRT?=
 =?utf-8?B?YmNMZXRJMzNLbFlGaVRJRmFIOWtxSEdscWcrMnhwNUFXOGpqR0pidzNGMXFx?=
 =?utf-8?B?Z0kyRlJjV3NmcGx0UGNLSUZ4VzJyVHV1Wi9oZjJreFk2eDZ1YzgvNjhDbDVH?=
 =?utf-8?B?V29UK2J0eXNyRmdMZ0dBVGJRNTZ1WEJkNmIweVZRTlJIcU9xUkd5dDVBVlk4?=
 =?utf-8?B?UFNvKzBSZUs5eU9xVEVjS2krK1pVNFE4ZVVlTTdHckh5Qkx6eDg3YWtsVjhS?=
 =?utf-8?B?ZDhvVXVoMGxkcjNMS2N6UHV1RjQxNGkzVXJHNE9mUHVGbmlab0FEZHQ3L1hl?=
 =?utf-8?B?VzI1LzJyY1M2YmZJVHA3U2hrZ3h4cExoWHVvNFUzbnludmJXRkRXMS9XM0lV?=
 =?utf-8?B?d0tMb3hodDhua1Zxa1cyYW8zZzdLcVlGSzNCN2dCeGNkVHdYaDgzYXczTjN5?=
 =?utf-8?B?OWR0UkZCVlZoekdBcE5IaXJDSGhMZ3h1Qk8xSVI0Uy9DUXVnU21DQmZxV05T?=
 =?utf-8?B?SVBQUTRRdTJLUUJzWU1ibnQyRENBbTVzVzJyVlFzcmRKOTVWZVJ5TFFsdlQ0?=
 =?utf-8?B?aHp6OUJIMGp1ak1BY0pqRDY3STkyT01BcGdGQlJtRTNHWTR1NXdabjE2THNX?=
 =?utf-8?B?WWhaZTc3S2xESys3ajBuUnVNVW1idXhXQ0FMQWk3T0VCT1ZRMzg2d2U4WEV0?=
 =?utf-8?B?NkpEbXMyNGFuSFZlaGM5czlSSVRSY2VCTERHWHNQaFBIQkh1aEQvcStUY2xS?=
 =?utf-8?B?aW1EUGg2MHJoaTV6RHNsaHBtOGdvUTlpSjEwSjR3aGF5RlhaT25xZ2drV21r?=
 =?utf-8?Q?Jyy90hnSqIXphcluiUvyLII/S32gzAeIr2CFo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10654108-b89f-4bf0-a072-08da22e4408b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 15:41:35.8376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vMyy1FWTIclZlFIJOE7S7F6vipoBWmDMFSfvHuH+l3jEJlFuNHFVK/3lL2NEBqG9lyau+t0a7X6qPXzU3T1EcNKBahLgnML8dzjxQNko05M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4193
X-Proofpoint-GUID: Zzrhq917Y-t3XrHGZu-UI3vXAjzenX6l
X-Proofpoint-ORIG-GUID: erDYuXp9DuNwBqmP3_2VnGzzrSHCamWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_04,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164707

On 2022-04-20 11:30, pgowda cve wrote:
> Hi Randy,
>
> The GLIBC was already updated to the latest version on top of [BZ #28353].
>
> Please find the commit which had [BZ #28353] patch along with others.
> https://git.openembedded.org/openembedded-core/commit/?h=hardknott&id=d5bdff460cc8b0f38177f1f38d625eeda729b459
>
> Thanks,
> Pgowda


Ah good. I'm not sue why my repo seemed to be behind.

There are still 23 commits that could be picked up, several of which
are marked as bug fixes but since we have the patch that was my main
concern, I'll leave it up to Anuj to see if he wants the update for 3.3.6.

Naveen,

We'll need that update regardless for WR Linux so please test it.


Thanks,

../Randy


git log --oneline 3e2a15c666e40e5ee740e5079c56d83469280323...
5eddc29c92 (HEAD -> release/2.33/master, origin/release/2.33/master) 
S390: Add new s390 platform z16.
c78ad8eb47 hppa: Use END instead of PSEUDO_END in swapcontext.S
32f74d4f14 hppa: Implement swapcontext in assembler (bug 28960)
baa74e8589 hppa: Fix warnings from _dl_lookup_address
6d9525b620 nptl: Fix cleanups for stack grows up [BZ# 28899]
8f56ecc19b hppa: Revise gettext trampoline design
ea94346dbe hppa: Fix swapcontext
aeab7584c2 Fix elf/tst-audit2 on hppa
f341ab08fc NEWS: Add a bug fix entry for BZ #28896
24e95955aa x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
6f8e99b567 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
a3cd0fe201 x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ 
#28896]
cb922428dc string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
211cce703d <bits/platform/x86.h>: Correct x86_cpu_TBM
55446dd8a2 socket: Do not use AF_NETLINK in __opensock
9495d729f6 hurd if_index: Explicitly use AF_INET for if index discovery
78d25827ae Linux: Simplify __opensock and fix race condition [BZ #28353]
1956ad4930 x86-64: Test strlen and wcslen with 0 in the RSI register [BZ 
#28064]
260360e89b x86: Remove wcsnlen-sse4_1 from wcslen ifunc-impl-list [BZ 
#28064]
1b8f2456b9 x86: Use CHECK_FEATURE_PRESENT to check HLE [BZ #27398]
54fdfa2b33 x86: Black list more Intel CPUs for TSX [BZ #27398]
0a5f5e2dc1 x86: Check RTM_ALWAYS_ABORT for RTM [BZ #28033]
5cb6edb6cd x86: Copy IBT and SHSTK usable only if CET is enabled

$ git log --oneline 3e2a15c666e40e5ee740e5079c56d83469280323... | wc -l
23



>
> On Wed, Apr 20, 2022 at 8:05 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 2022-01-30 01:20, Pgowda wrote:
>>> glibc-2.33 has been upgraded to latest version that includes many CVE and
>>> other bug fixes. Ran the regressions and results are better.
>>>
>>> Signed-off-by: pgowda <pgowda.cve@gmail.com>
>>> ---
>>>    meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>>> index 63241ee951..e1eefdee49 100644
>>> --- a/meta/recipes-core/glibc/glibc-version.inc
>>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>>> @@ -1,6 +1,6 @@
>>>    SRCBRANCH ?= "release/2.33/master"
>>>    PV = "2.33"
>>> -SRCREV_glibc ?= "55b99e9ed07688019609bd4dcd17d3ebf4572948"
>>> +SRCREV_glibc ?= "3e2a15c666e40e5ee740e5079c56d83469280323"
>>>    SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
>>>
>>>    GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#161106): https://lists.openembedded.org/g/openembedded-core/message/161106
>>> Mute This Topic: https://lists.openembedded.org/mt/88782078/3616765
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>> Naveen, Anuj, Richard,
>>
>> Is there time to do this one last time for hardknott  to pick up these
>> 67 bug fixes in glibc?
>>
>> We're particularily interested in:
>>
>> 78d25827ae   2021-09-28   Linux: Simplify __opensock and fix race
>> condition [BZ #28353]
>>
>> but there seem to be many good bug fixes and optimizations in the list.
>>
>> Naveen, please try it and test ASAP.
>>
>> ../Randy
>>
>> 5eddc29c92   2022-04-13   (HEAD -> release/2.33/master,
>> origin/release/2.33/master) S390: Add new s390 platform z16.
>> c78ad8eb47   2022-03-15   hppa: Use END instead of PSEUDO_END in
>> swapcontext.S
>> 32f74d4f14   2022-03-15   hppa: Implement swapcontext in assembler (bug
>> 28960)
>> baa74e8589   2022-03-06   hppa: Fix warnings from _dl_lookup_address
>> 6d9525b620   2022-02-28   nptl: Fix cleanups for stack grows up [BZ# 28899]
>> 8f56ecc19b   2022-02-22   hppa: Revise gettext trampoline design
>> ea94346dbe   2022-02-18   hppa: Fix swapcontext
>> aeab7584c2   2022-03-06   Fix elf/tst-audit2 on hppa
>> f341ab08fc   2022-02-18   NEWS: Add a bug fix entry for BZ #28896
>> 24e95955aa   2022-02-18   x86: Fix TEST_NAME to make it a string in
>> tst-strncmp-rtm.c
>> 6f8e99b567   2022-02-18   x86: Test wcscmp RTM in the wcsncmp overflow
>> case [BZ #28896]
>> a3cd0fe201   2022-02-15   x86: Fallback {str|wcs}cmp RTM in the ncmp
>> overflow case [BZ #28896]
>> cb922428dc   2022-02-17   string: Add a testcase for wcsncmp with
>> SIZE_MAX [BZ #28755]
>> 211cce703d   2021-02-02   <bits/platform/x86.h>: Correct x86_cpu_TBM
>> 55446dd8a2   2021-11-22   socket: Do not use AF_NETLINK in __opensock
>> 9495d729f6   2021-10-18   hurd if_index: Explicitly use AF_INET for if
>> index discovery
>> 78d25827ae   2021-09-28   Linux: Simplify __opensock and fix race
>> condition [BZ #28353]
>> 1956ad4930   2021-07-08   x86-64: Test strlen and wcslen with 0 in the
>> RSI register [BZ #28064]
>> 260360e89b   2021-07-08   x86: Remove wcsnlen-sse4_1 from wcslen
>> ifunc-impl-list [BZ #28064]
>> 1b8f2456b9   2022-01-24   x86: Use CHECK_FEATURE_PRESENT to check HLE
>> [BZ #27398]
>> 54fdfa2b33   2022-01-14   x86: Black list more Intel CPUs for TSX [BZ
>> #27398]
>> 0a5f5e2dc1   2021-06-30   x86: Check RTM_ALWAYS_ABORT for RTM [BZ #28033]
>> 5cb6edb6cd   2021-06-23   x86: Copy IBT and SHSTK usable only if CET is
>> enabled
>> 3e2a15c666   2021-04-19   x86-64: Require BMI2 for __strlen_evex and
>> __strnlen_evex
>> 25941de34e   2022-01-27   NEWS: Add a bug fix entry for BZ #27974
>> 2b00ee820a   2021-06-09   String: Add overflow tests for strnlen,
>> memchr, and strncat [BZ #27974]
>> 8a3a0177c7   2021-04-19   x86: Optimize strlen-evex.S
>> cef3bffade   2021-06-23   x86: Fix overflow bug in wcsnlen-sse4_1 and
>> wcsnlen-avx2 [BZ #27974]
>> 3ac5a7fe8b   2021-06-23   x86-64: Add wcslen optimize for sse4.1
>> 5697e2dda8   2021-06-22   x86-64: Move strlen.S to multiarch/strlen-vec.S
>> 3dea108f60   2021-05-07   x86-64: Fix an unknown vector operation in
>> memchr-evex.S
>> 355afae940   2021-05-03   x86: Optimize memchr-evex.S
>> b72b89705e   2021-04-19   x86: Optimize strlen-avx2.S
>> 453ed0a0f2   2021-06-09   x86: Fix overflow bug with wmemchr-sse2 and
>> wmemchr-avx2 [BZ #27974]
>> e09c377806   2021-05-03   x86: Optimize memchr-avx2.S
>> 902af2f5ee   2022-01-27   NEWS: Add a bug fix entry for BZ #27457
>> 31dd3e3cb3   2021-04-01   x86-64: Fix ifdef indentation in strlen-evex.S
>> d49105cc7a   2021-03-07   x86-64: Use ZMM16-ZMM31 in AVX512 memmove
>> family functions
>> 763cea698b   2021-03-07   x86-64: Use ZMM16-ZMM31 in AVX512 memset
>> family functions
>> 82f1ba9af7   2021-02-23   x86: Add string/memory function tests in RTM
>> region
>> 0598a25cbe   2021-03-05   x86-64: Add AVX optimized string/memory
>> functions for RTM
>> 15bae38c8b   2021-03-05   x86-64: Add memcmp family functions with
>> 256-bit EVEX
>> 47bf9f38bb   2021-03-05   x86-64: Add memset family functions with
>> 256-bit EVEX
>> 1697e739ef   2021-03-05   x86-64: Add memmove family functions with
>> 256-bit EVEX
>> 06d1aed51b   2021-03-05   x86-64: Add strcpy family functions with
>> 256-bit EVEX
>> 9cee072f8f   2021-03-05   x86-64: Add ifunc-avx2.h functions with
>> 256-bit EVEX
>> f0a2b67147   2021-02-26   x86: Set Prefer_No_VZEROUPPER and add
>> Prefer_AVX2_STRCMP
>> a744a0a3fe   2021-03-27   test-strnlen.c: Check that strnlen won't go
>> beyond the maximum length
>> 6b7b6c7514   2021-03-27   test-strnlen.c: Initialize wchar_t string with
>> wmemset [BZ #27655]
>> 86c153d092   2022-01-26   NEWS: Add a bug fix entry for BZ #28755
>> 3d52239b30   2022-01-09   x86: Fix __wcsncmp_avx2 in strcmp-avx2.S [BZ#
>> 28755]
>> d251ad533e   2021-06-01   aarch64: align stack in clone [BZ #27939]
>> 06ce5fbd6d   2021-06-25   support: Fix xclone build failures on ia64 and
>> hppa
>> 48d9161e02   2022-01-24   Linux: Detect user namespace support in
>> io/tst-getcwd-smallbuff
>> 41980af2d7   2022-01-24   realpath: Avoid overwriting preexisting error
>> (CVE-2021-3998)
>> bcdde07537   2022-01-21   getcwd: Set errno to ERANGE for size == 1
>> (CVE-2021-3999)
>> 46a70c49ba   2021-03-10   support: Add xclone
>> f63cb3cf72   2022-01-24   tst-realpath-toolong: Fix hurd build
>> e41e5b97e3   2022-01-13   realpath: Set errno to ENAMETOOLONG for result
>> larger than PATH_MAX [BZ #28770]
>> e081bafcb1   2022-01-18   support: Add helpers to create paths longer
>> than PATH_MAX
>> ac148bdd88   2021-06-25   elf: Fix glibc-hwcaps priorities with cache
>> flags mismatches [BZ #27046]
>> 5cab4e3f3a   2021-09-25   powerpc: Fix unrecognized instruction errors
>> with recent binutils
>> 0f70b829f8   2022-01-17   CVE-2022-23218: Buffer overflow in sunrpc
>> svcunix_create (bug 28768)
>> 4f4452721d   2021-03-09   <shlib-compat.h>: Support
>> compat_symbol_reference for _ISOMAC
>> dae9a8e7f6   2022-01-17   sunrpc: Test case for clnt_create "unix"
>> buffer overflow (bug 22542)
>> 4653cd9e36   2022-01-17   CVE-2022-23219: Buffer overflow in sunrpc
>> clnt_create for "unix" (bug 22542)
>> f10e992e8d   2022-01-17   socket: Add the __sockaddr_un_set function
>> a51b76b71e   2022-01-17   x86: use default cache size if it cannot be
>> determined [BZ #28784]
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>

-- 
# Randy MacLeod
# Wind River Linux


