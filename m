Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FBFC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:06:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36357.1702044358434269874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CBJqSuKc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0706163bac=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B8BZ2v8008211
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 06:05:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=+/rDq7QaaaMxwLghh9E
	H2ZIJbdJWfmWIVf5amkOujQ0=; b=CBJqSuKcNdgKlK7n1qsMNYrABYLS3reIZmK
	4HL9YAA9W2ozg9ks9hTaPtSP7MAvX1eB6Ot7znaPT65b6RqSr8x/hhDDF7jKYQz4
	m3CddkRTYrQ2OSvXDatMYu0oreI+lhRTEU/nfDdgJi6YDpW445S6saoI7hoYWZc4
	GInv4eFEdwOfRfc64XijrIuaQVh+/Ji+SbabVF1MgZJ+OB9fZUUzOkCH3enP5MnC
	ZUrh/I9bUy7R7B+WbZ0nOH1DWh3WU+3QJbCuaeMkcaUE+gy7kIh8UxyqeEIYZwak
	LDxlvh6/GI25550JqcbLVLAL62G+VPQlf238GcPQJoxsCgURZKQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2rtv52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 06:05:57 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B8E5vvi015635
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 06:05:57 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2rtv4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0I2NGHjEOig5U7RsrY0JL2oDVD+TGeGq702OxiP45e3M68pm8WwQtqAqxebfqMlEDv9h84GMrjKZGl2iuyXH8WMviPKed5zXT7yChWhYeID5waBbP7+pWtb/QM8DVHS27aKLceegIUIlqROMvG2qRZ9zGkcVOHzHGdzYRA4bYtnaJzZRkv0s7HD1mojzsyrK88Ar78RNYpPZyhOj7OsN6xTGRAAQ5ChQaol1FKq1n/Evjq3I1PvqU0oRFeNhhsVObcxZWBkXUIyjCWWVFO3nWnEL322uCP4egDeGvwaLuPox0HlAtBsUtf5ongR8zxykdTAM8kff8zfsq+wqziZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/rDq7QaaaMxwLghh9EH2ZIJbdJWfmWIVf5amkOujQ0=;
 b=Vez86cIluWLhztO2lPY8XbzpIALVuYryTcMZigR4+q2i70e8vaBKc0sPn/hV0puwy6BNFc9objxrlibT95OkIGJvNwkAOyTHgqsk5/fosDDfdiqoKJBN76r7yaITJXOL7/LkbQ48Kv22oqnPmDYLVTxkW7TPGgI5AtRlGf2COU4eCKcfoA1XTFJUjMWRipiZ4fZiBjatkLsNJlf0k2W8mBb5klhKQ1TAOYN9EpwM6nn8cQmE1e8pEa6qXzYyO61jufvGOXQk9HNyHfbCim9m7KmLwkncydh9P3f3o8YLHy4H7akIZCYdbQwKBU9Fh6mo//L+4zAw2UcCnsjnwDkVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 14:05:55 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 14:05:54 +0000
Content-Type: multipart/alternative;
 boundary="------------KcU8IkPDkqooncKSKXQZCCee"
Message-ID: <bb8e3b3c-9f8d-41ac-b67c-f58465c81aef@windriver.com>
Date: Fri, 8 Dec 2023 09:05:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: Disable rust oe-selftest
Content-Language: en-CA
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Tim Orling <tim.orling@konsulko.com>
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20231208104800.4175679-1-Yash.Shinde@windriver.com>
 <20231208104800.4175679-2-Yash.Shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20231208104800.4175679-2-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: fe76e444-e976-426c-c878-08dbf7f6cb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dA5c+krDoCK/Q8CqkrNKcygzI/yavLtGheHJveE307+rXcd0gIM35IGXouaIDkSqY0NK3NBR8wZ8qmQWfm4pj7zcnTgSDNJK5MeJdiGI6U93y1kqevaEcjLFQrynL6N0zJu2p6O4b837qISufjRfRUxt2HfDBhmerkDe3tbdXAWu/+D6rNtOibMP6ZaXbQ9Epk1dP9zq1BFOxL+8uE2PZhAXkvK/R1P0BjENaK76rCAhSvwa8p3yqNKOlTrHlZuBDfB8uaLD7fzpnkbVv7ETYATEPMnIRQw4KYfIGLnE/7CGf6SN/xgPlsWZTfqOkeX7HgakYKoNzj/3ACq0nYh530VTuB+YsCMwKnJYJncupAqz2qecWEwaLQJ2MundKjoNuAXovL1iQrL8JJkrB1UxJ5cB7Z/COgy8sPJLCy0y6S7H8a6Qt2ZP/Naa6T04YAmL0xBss5ClfQpRoMY1154C4PaBsH2ifbTimHH/qgGgts6XpWtaaN63soi4Qg98iejvqogIlF1pER/CoGx+cj9darR/upjCVA9KAaWuhjKUomNpXgf7hAXSDO9ZPbvxKS7g/IMb9mpSUp/E+8v5jADz9dLGS4hTc0eglUnBufm2kKq0Ho5BdQxQPKeUBhLr/BAj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(346002)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(31686004)(83380400001)(6512007)(26005)(2616005)(107886003)(6506007)(6666004)(53546011)(33964004)(478600001)(6486002)(966005)(316002)(110136005)(66476007)(66946007)(66556008)(31696002)(38100700002)(8676002)(8936002)(86362001)(4326008)(36756003)(166002)(5660300002)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2srRVVTN1JUejUxa3dFTGxoYWlWREtqOTZTcmdJOExjbHZ1QVN3YlFsVU5h?=
 =?utf-8?B?ZWdMSlVSTXo3aktnUnk2NkR0QnNQa1N6WGo2cGRSYXlzNXQwb200UTArbDcx?=
 =?utf-8?B?a0dwTlJJa3I1ZnNPZ3U1ZlRmOWFycFpQMFFtUlJic2FKZWw3dUw1UXRCeFpG?=
 =?utf-8?B?QU0vbmIyaTRKWUY0d3hCNWdQcUpRMkphSVgwWERvaklCMGpFTzFuR01RMGlQ?=
 =?utf-8?B?b0ViZ1VDcWJXNjRNaVlESkpoK01zOVExalNCM2dCdFBDeTcxbFhCOHFOT2ZR?=
 =?utf-8?B?R2gxajNMd3FVN211a0RLeGszLzU3TlhlekthS2ROQzZRa0xRaHNmMzRGUmRC?=
 =?utf-8?B?T0NqT01xekRUTXdpczA1bFcvU3BjdlBadmhEOGVXMFZXSW5MUzJWQzFPNTBX?=
 =?utf-8?B?TzBaMzRIUEJTZmFoK0dIZUtsN29PRW11cFFQQzhIOHpYclFicWd3dHFhYnVP?=
 =?utf-8?B?bFVrbitTQmdNSkpaNzdpaU84aG0xUXJzeVhuUFRhN1J2MkIvNW10UHF4dHRn?=
 =?utf-8?B?L1BpUFJhTzl4NnFOSnJYVTRTT1dyNjRUN0NxQTBBUzVseVp0QzNoTmJHaW5K?=
 =?utf-8?B?TzdHNmpnMktKZTZycjZLdnRsSGk0N01mVGtSYmx5UjdLRjBvVjBJbkQrd1BH?=
 =?utf-8?B?T0p2ZHFSWDh3ZDdVb2QyVUxBUncyWVFBaSsraDlCcFFBSElIVldWSFRoWHdM?=
 =?utf-8?B?Yk5nakNSNHRuaTVUYjJCYzdseU03dmZZTHVFZWtYTlJ1WDJyb2NRRkpZak1Q?=
 =?utf-8?B?K1lmYmVLdDR6RmlKbWtiWTRIaElCUDdBSEgzVU42Zyt6VGs3ZHBFayswd0Jn?=
 =?utf-8?B?ZGozNEt0WEY1MVE1K2I0MExldFFZczZYWS94L1U4VHlXL0plUW9QZU5RV2lo?=
 =?utf-8?B?NXN4ZEVWK3ZTbFlOK25wMHQyaXRnZUtPUG5WMHIyekZLS2c0M0h6SDM3WTJu?=
 =?utf-8?B?Ym5VVHhoVGRjVzdweUZvSkpxbnNmZ0FFSjJEbGxNNlZLUjQ1WkUva05FelR0?=
 =?utf-8?B?TGpXcUtnam0ydm8vamRDVWlxOTBZSzJXb0c3WmovaUN6cXNCYW9rQW5EUURl?=
 =?utf-8?B?NWNQeUFjNkJjMTlRY0llU3VWT0JWdS9YTS9OdXR6VmY0L3d2cjRUM1c2eFJG?=
 =?utf-8?B?OTgvOFRUTWVtTjVqRGpXRTFXc2U2bVV0eFBiY3NvMytVV213cjQ4OUNEU2Jl?=
 =?utf-8?B?UnN1NUp4SjRRZlB6dVhUdllDVmdUTWhyQnBOTmdNNmo5VzdTb25USDU4MXV2?=
 =?utf-8?B?STViK01JTk1ZWXhVRE05RHg5dVlhaFovZUQ0bEdwQzMvanBXS0RTd2RmVTBy?=
 =?utf-8?B?VmNycGZKUDdVd1VFSk1hU09FSWZvd0NXRVdjWkNtV3JEMjg1c04zWitOSGtT?=
 =?utf-8?B?RE5HZkRQWTl2YjJsYmYxSVFBZlY2RU4xSTNYSUJ3TzZYZ1VNeUV0TWhVZ1pH?=
 =?utf-8?B?c05IcUVpSGIvNFpKQkdVSXd3ZjJSTDg3K0hQZTV1eXFOUDY5Z01xUlNIaHBr?=
 =?utf-8?B?OEhDWHRhOW5sYzNSYnRFQ3JRS1BhNjlKc1YrbU14WTBjTi9tZiswM1F1QkJJ?=
 =?utf-8?B?VjVPNDFBSW5scG9xUG1OcFJJZm1PaUp3aER0VVhyMzQ3V0ZVK0wrMkJBaXhK?=
 =?utf-8?B?VmJ6YWtoOWRQdHRPb0NNQWcxSTNCSE5PRDB1UHFqUVZUR1VmNEpDeXN3aWVu?=
 =?utf-8?B?aWpGcWpQbmlzbGcwenpzNFpDM1ZUQlV0UENONCthTHRZVkhFZXJGMmRBU212?=
 =?utf-8?B?b1AwZ05GeVdZemw4aDFaKzUwemRvaGw1TlVLZFlOWmdNL21rYVZ2Mk9Xb0k5?=
 =?utf-8?B?Kzh5VE0ycWtndm1iWjJoMnFIME9teEI1NmhTcGMwcUNGSm9SZHdTMWRmUXFk?=
 =?utf-8?B?Rjh4WU9UR1pDMDRCUURRclptR3pRVnlqWUc4S0tsUVhJZ1RSTWxGYmliMVM3?=
 =?utf-8?B?Ym5CTEhNWWdMNzZ1b2tLdHpnNnIxVjZMVXJaRnNQemZVWWhVMGRDdGdDWDF2?=
 =?utf-8?B?cktlanlVTmtqYllzWkRtWWl1Y1JjZ0RJUGs4YTNCNDNOVUpkbmhGaGsvZlNo?=
 =?utf-8?B?eGxIMzBiV1c1M2NQakwxelJYWUV0Nzd6RlovL216SFFLSE5lT2oyUjgrVXQ1?=
 =?utf-8?B?aFI5WFV2UzhOT1pROC9aK015Sm9CUVJiUEx1SWpMekFnanEzTlhSOUV3QVQr?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe76e444-e976-426c-c878-08dbf7f6cb2a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 14:05:54.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zXahAwyB49jkasgLs7RyA3LRxjcvcbULcuBunQqPIYWDGHew6uuWvJAF9t7dYJgXJ17e+DkRVF6ZczS3TWKk//Mx7araVSlkiAn38cjnSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
X-Proofpoint-GUID: _Df-c_2AHgzdrGfnFqZaNyYoLE3ObqSq
X-Proofpoint-ORIG-GUID: zdi2y53MhTTcRqgqhjwDfUvQmlRit89N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192070

--------------KcU8IkPDkqooncKSKXQZCCee
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-08 5:48 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> After rust is upgraded to 1.71 and later versions, the rust oe-selftest gives
> build errors due to unstable nightly options(see the error mentioned below). Thus, disable the test suite
> until the issue is fixed
>
> error: the option `Z` is only accepted on the nightly compiler
> thread 'main' panicked at 'failed to gather the target spec for x86_64-poky-linux-gnu', synthetic_targets.rs:66:9
>
> Following issues are created in Yocto bugzilla and rust upstream to track this issue-
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275
> https://github.com/rust-lang/rust/issues/115642
> https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108
> https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> index 7d148142fc..6dbc517006 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -39,6 +39,9 @@ def parse_results(filename):
>   @OETestTag("runqemu")
>   class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>       def test_rust(self, *args, **kwargs):
> +        # Disable Rust Oe-selftest
> +        self.skipTest("The Rust Oe-selftest is disabled.")
> +
>           # build remote-test-server before image build
>           recipe = "rust"
>           start_time = time.time()

Thanks for the Rust update Yash and it's unfortunate that we haven't 
resolved the problems
with the test suite. We decided to diskable the tests and do the update 
because some changes
were blocked waiting for a newer version of Rust according to Tim.

Yash,
It would be better to disable (skip) the test suite first so that there 
isn't a commit with the testsuite
broken.

Alex, the commits are independent, will you please re-order them before 
merging?

../Randy

-- 
# Randy MacLeod
# Wind River Linux

--------------KcU8IkPDkqooncKSKXQZCCee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-12-08 5:48 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231208104800.4175679-2-Yash.Shinde@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

After rust is upgraded to 1.71 and later versions, the rust oe-selftest gives
build errors due to unstable nightly options(see the error mentioned below). Thus, disable the test suite
until the issue is fixed

error: the option `Z` is only accepted on the nightly compiler
thread 'main' panicked at 'failed to gather the target spec for x86_64-poky-linux-gnu', synthetic_targets.rs:66:9

Following issues are created in Yocto bugzilla and rust upstream to track this issue-

<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275</a>
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/115642">https://github.com/rust-lang/rust/issues/115642</a>
<a class="moz-txt-link-freetext" href="https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108">https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108</a>
<a class="moz-txt-link-freetext" href="https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959">https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959</a>

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7d148142fc..6dbc517006 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -39,6 +39,9 @@ def parse_results(filename):
 @OETestTag(&quot;runqemu&quot;)
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
+        # Disable Rust Oe-selftest
+        self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
+
         # build remote-test-server before image build
         recipe = &quot;rust&quot;
         start_time = time.time()
</pre>
    </blockquote>
    <p>Thanks for the Rust update Yash and it's unfortunate that we
      haven't resolved the problems<br>
      with the test suite. We decided to diskable the tests and do the
      update because some changes<br>
      were blocked waiting for a newer version of Rust according to Tim.<br>
    </p>
    <p>Yash,<br>
      It would be better to disable (skip) the test suite first so that
      there isn't a commit with the testsuite<br>
      broken. <br>
    </p>
    <p>Alex, the commits are independent, will you please re-order them
      before merging?</p>
    <p>../Randy<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------KcU8IkPDkqooncKSKXQZCCee--

