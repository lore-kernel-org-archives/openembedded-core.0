Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161CCC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 00:16:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.85048.1698624987511677335
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 17:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sidedUly;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9667820882=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39TNIADC005994
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 00:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=AygYTIiKjYqqflMFkzJ
	ZBWT9xKk8SihiDf6PkQQm4qs=; b=sidedUlybiXuYJb23KLA+usxclAiSQZPdAp
	2v0WUnrpET/FuJ4q2zdUMSQsv479t1XtJo+sievLeAbDXiumzUd3S9XN+La6G1UF
	09wfDhJwyZy133xvTBs9dqTLwH7u7xpA6CdYbMgkmnz/pY4drKqImXNevPnD5YGC
	cwzhPEvH7lS2PQtA6p0y6Gy7AAfimUvhN/s63u0jwXmk0mBdbaj0ktOJpPvBQGPv
	KozbqPan3U1YwKcg43J00Sdgs7sSeFteH+0ndwtBHTZBLY+fD1s4EWf4Ow3sN2U7
	eDdx0wwYzI4/GBQRfhCkGEFdUz1T7PUmgQLxkCU00rrY8Ed3eAQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxsrbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 00:16:26 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39U0GQ6d008305;
	Mon, 30 Oct 2023 00:16:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxsrbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 00:16:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVZjF+/td0bfDyOYaCw6/Q9FyW4OVysnTElTkDkCOWW+rA9jT3ZALuNyq+B3UaouNuPkdotL5Mq/jvMljNkV4XWeZG0+eQXA2ppwqbUjKySzHxrTT0gBtP3zzR0XOtAUbJ+5CMQKae9k/a+NT8x7obXsdfqBwo5MwgGvZ5Dl2oa5q84N1M28GFlk1ydn+RyZCg+ee7BTxXeAlv9DuUcpEBrcYWXCmb1Dk4Yhjb/l/RGEKDfX7Ro44yrywKmJD2rU1GlND14g59TtiTcbxoQXbqyJaLvSA9s1h4KKmSkTmBuMXZFYb265XjABZPBkQR5uS88bOlL9Jbfi6mG492dUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AygYTIiKjYqqflMFkzJZBWT9xKk8SihiDf6PkQQm4qs=;
 b=E0VAwkxjhogtp/VxGhbKWipAXewc5s8/N04vNsnpKiAVhisCOMdlhFZEl+GQ14uX59jtjOT02dF7gtcDkWZKNlKZnLiCnmqjNVGc/El9z464LtPHfnUrC/OKd512ER/n/Ic0YCAxjQ/E0nLRdKZzFPIBK8Ldk+Xy5e7DtgKNjbZAnUy7epJVnBER07pkL1iKADtZrsBQlToMHq8Jwso1grwSW9hRYs747ohpSpMH1Xbk6wH8DHcHfsoILc8ryJJBZuyxe+dT/mxWJrRn75wwaKFs7R0FvSc2g0MeYv4BV8OE+moYlTtzONcG7F9t0Gcep4pFcw+XaEQ4trx/6P12KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Mon, 30 Oct
 2023 00:16:21 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128%4]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 00:16:20 +0000
Content-Type: multipart/alternative;
 boundary="------------TwhI6T1302aLqZt0Y2e0ARY9"
Message-ID: <f5dc4c89-976c-4975-bc41-e844c50a64bc@windriver.com>
Date: Sun, 29 Oct 2023 20:16:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][kirkstone][PATCH 1/2] curl: fix CVE-2023-38545
Content-Language: en-CA
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>
Cc: peter.marko@siemens.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20231013092056.3841151-1-archana.polampalli@windriver.com>
 <AS1PR10MB56979D57215F72A83C7C7234FDA2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <AS1PR10MB56979D57215F72A83C7C7234FDA2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b9cf64-4b90-47d2-d97a-08dbd8dd7147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YcsZtqNMfeIXgMwIjUBqVEQEN5gGhRKy3drIXFW/T0xgGAa/v8j7MoONmnGZYXFGOESBx05J/mn4j+TFJdyS3dctKcS7HPb41CBIWj9AXjEqDXqEhxNS6jXvlCvEUCoCJmDmjyej6h2pvnAzXPi54Sg1OLnB8oRQcVCJhdO8AXYUB1HISc08WodKWCLSSxxTDs2OFswHYJUhNw2kP/14J0clcaixsFjwLDyMNnBltlHFinNXv0rNS2LNLs4FpUpP5m6YK0thNpK+lQ3omyHCB2CSZ9C4Fd7Yfji/0DrlfpY6nBIe997FKKkRuxKnoD4YmY7WAejFwzob4PMmOn2Tc0a965E5j2R36Lpzdeh5PPSVImaOfEBDtntXk1PPD2dAFu+GyrpatbKyyPXgTvsQ7vnvrwRL9BWksDhzAu7jjPuSVKjU5+xXxGp80S5MEB8mTby6f3/8kisLJI65MR/Iqgvn0EGWeHYtEceRmc32I2KgyUlhtcPRo+MyKzJJOetf1aOmu51GS8UQFusTl4ISw69XHbAXju8S/Rr4IsEs1IWtGYUBXMZqXOhyPGKPYAUQB8/8v/FlJCF1G5vNO/3aNK7sjLaKHYRvllSP0djPU4Lh/RzRpiIewbuTapM2b82xo3iVEnJOQEyprRgZcHnXGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39840400004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6636002)(2906002)(31686004)(316002)(4001150100001)(5660300002)(66899024)(66556008)(166002)(26005)(41300700001)(4326008)(6862004)(83380400001)(8936002)(8676002)(38100700002)(66476007)(37006003)(6512007)(53546011)(6666004)(36756003)(31696002)(66946007)(2616005)(33964004)(478600001)(6506007)(54906003)(966005)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2hOUkhDcExPZEEyZlUybkZOUzROQlpKS3Z0SFhrUktvTVpZdU9lMkpyRnhG?=
 =?utf-8?B?aXMvTElpS0FOem11Ymdld3JDWXFhL2VBRk5oelRyRlZuaHVtTHFVZ3JLTW81?=
 =?utf-8?B?MHVzVkZ5ajErOGh0QU83OWNJdHRNTmREa1M3RjMySzRGV1J3TmNXcS83b2lZ?=
 =?utf-8?B?UEJnRGFzbEgvelJjQnYxVndWOURhbjBkaGdzTExsMldldjBWRzl0L3RIalJZ?=
 =?utf-8?B?elB6MUV0cXpEMHRnL1lPcHBLZXJwUlZCbFBMY3RBcUEycmFRSWFaclZiK0hu?=
 =?utf-8?B?M0luQjZJeHJsTHNwL3o1YWI0Lzc0NGROV2pRT0tZWk1SWXg5bEk3cXBuMlRx?=
 =?utf-8?B?M2F6NlNJK092c3J2VXZnMG1Vb0xvbDJMVnBsdVFXTCsySjBucm44MkRVNmp6?=
 =?utf-8?B?VFJNM1hmNldENE1hOEFTYlZvbG45R0FTMFpobHB1enY1WTVUUG9zS2ptSW9q?=
 =?utf-8?B?cFRqbVJwR3FIS3doRXN3WmVaaXdUSlNwNGNLTFQrb0lzOHF2L2hSN05PZFY4?=
 =?utf-8?B?NlNqYTB3RjZDTTRqd3hlTlhYc29OOGZtM2l4TnpKNDBiNDA1ME5sbTk4dEVp?=
 =?utf-8?B?Q2lQUzgzQXl5TC83RFVaWitnVGhhcDE4dU4yK1B2Ui80MmozeW83RDJCMEla?=
 =?utf-8?B?TEtlMFRNK3l2am5zNHRtdVpvYzJRYlNQQzZkdEN2NjdGMHVNci9qeFdQR3ly?=
 =?utf-8?B?bWVaUW0xN0ZOZ3JVNG5NMHRmY1EvV2RLREZ2aHVTeUoxSFM5ekFpT3lXdjhK?=
 =?utf-8?B?MUZhb2VYRUVuVWR4WlhDaENVWHRqanBUT1dQbGZueFNFK1hDdCtBUkc2WjB0?=
 =?utf-8?B?WEJCZWsyd3YwZW9KTVZ2REdpdGd0YUk2NXFidU5CSW5IRytLRHlRYXQySVV0?=
 =?utf-8?B?aTdDdUlhTnZKN3hWWW1IRExiNEs5Ui8zN2xPRGhhV2xLc25JRzVkbStNUXBT?=
 =?utf-8?B?bXE1cDBrSXhlOXhhM1A2dWNPYnNHbnMzNE9NQm1RbjdoeFJZby9sZDhIenEw?=
 =?utf-8?B?Q3gwd2lKaHRsM2E4M0NzSXZxWk1BTDV6V1FTNC9FazVYRlJ4UWgxbkpCOXlm?=
 =?utf-8?B?eUk1KzdwcmM0Z1FlZW1wMzlpd3NnUklFaDQvUFU2QVBDbkd3MTkwTzRVK0VL?=
 =?utf-8?B?REQxV083Y2Nub01hYnBZRzlEV3J2WU1oeGY3Rzd6VzR0SzRtZ1c4bkFUUnla?=
 =?utf-8?B?QmVtQ0h3V0h6ai82ZllUNE42QUgzZ1lsblZKVjliU3A1MXdLTGF1Y1IwWTVP?=
 =?utf-8?B?T0VpdU9WcmRmajRyR2NNMFdPa0pnVG5GcHJpdW9oakVnSDg0b0dqQ0ErcjBO?=
 =?utf-8?B?eHg4TXdERW1ldkNURHF6OXdkaW03SHpQaXoxR29xWGtqZ015OXR1M0hXbXps?=
 =?utf-8?B?TDVpMFduQ0Fic1ZFbyt6bkhEOFVPZWtaVXlxWGtHTmpWR2ZGVEQ0cVljd0Ex?=
 =?utf-8?B?VUI3a1EvNVgrZGtIM3FGdkpGa2ZKSTFGN3pyYkRqMExqYTZtNldPRmJqMG9v?=
 =?utf-8?B?NzR5VzN0RDdLSHVQNG5BU1Naajl4TkdQUGk2NzV5OUNHdzJnbVdpMTFSbmxH?=
 =?utf-8?B?cTVhZXJQUXdiQ0tQNS9kTHRIUXducG9tYTMxL0NoRUpmd2M0alpmU0x4c2lm?=
 =?utf-8?B?QWtpMThNK0NtVnhVeWZTT3dTTG5WUEV6U1VSckZ5ejI2M0Fta09ROGFUKzRU?=
 =?utf-8?B?WjJjYXltWUhnYkc1RjFrUncxOTZMVS8vK2thbWZPT1ltczIwZW9XUGV0QWtk?=
 =?utf-8?B?K1hkeXhwSFFiWUFuTTBEb0dwTEtCVHluUTU5cmZPeVIyZ2tBWjdwTnBuTm11?=
 =?utf-8?B?SHdKTkpCdWMycVZKcVFOUUNUWElCSzJ4ZnpRai9TRnB6L0R3VGJvOFdYRFhD?=
 =?utf-8?B?bVdtdTVlV0dRT0tnV1ROTzRHS0FqVkYvYkJ3V00xVTNFV3o3Mzh6OC9vQVhY?=
 =?utf-8?B?SzV6U29OVm9JRTN3UGZrZjlZbkRwSW5LdUl2V0kwWU5vVzJzNkNPNVZ4Z2Zq?=
 =?utf-8?B?N2tsMUJnL0k0M1JRcFRjeHNEWVA1cHMvMDVYNkg1NjU2LzRJYjQ0bUljdHo2?=
 =?utf-8?B?Wkgzdk5VbGE4NDJOUERCT29VdVVrbzZZQUFvbzhwQ2lxejhKUUp3NzJjaXZt?=
 =?utf-8?B?VUlWTW5QeXpFM0hzMkdsUk5Tcm5JU0prbG1ORUVhVnVYdkV1RXdCalZqa2dN?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b9cf64-4b90-47d2-d97a-08dbd8dd7147
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 00:16:20.5684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD36ROhUz6zoYXGwWth0GOYgkhJmWQZeifPA2WeCe+tc9Y92kSlHb98ECforPUS99KvYM4izs31YCAw25FcbXUEWBcafxOXGjO+lC+hXjFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
X-Proofpoint-GUID: c-c7xmKUDCPzIoDBSAOj_GuJFuh9SGz8
X-Proofpoint-ORIG-GUID: MhfqvUZ0Ul2Y3wctpyT_nHp0pVoviIAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-29_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=748 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310300000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 00:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189779

--------------TwhI6T1302aLqZt0Y2e0ARY9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-29 5:49 a.m., Peter Marko via lists.openembedded.org wrote:
> Gentle ping.
> It would be great to have this in next kirkstone release which will be built in a week.
It's queued now:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana,

Can you be sure that you and co-workers are CC-ing Steve to make it 
easier for him
to notice the stable branch emails?

Thanks.

../Randy

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189769):https://lists.openembedded.org/g/openembedded-core/message/189769
> Mute This Topic:https://lists.openembedded.org/mt/101936671/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------TwhI6T1302aLqZt0Y2e0ARY9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-10-29 5:49 a.m., Peter Marko
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:AS1PR10MB56979D57215F72A83C7C7234FDA2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre class="moz-quote-pre" wrap="">Gentle ping.
It would be great to have this in next kirkstone release which will be built in a week.</pre>
    </blockquote>
    It's queued now:<br>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut">https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut</a></p>
    <p>Archana,&nbsp;</p>
    <p>Can you be sure that you and co-workers are CC-ing Steve to make
      it easier for him<br>
      to notice the stable branch emails?<br>
    </p>
    <p>Thanks.</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:AS1PR10MB56979D57215F72A83C7C7234FDA2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#189769): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/189769">https://lists.openembedded.org/g/openembedded-core/message/189769</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101936671/3616765">https://lists.openembedded.org/mt/101936671/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------TwhI6T1302aLqZt0Y2e0ARY9--

