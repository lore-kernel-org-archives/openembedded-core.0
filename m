Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A22CE7AD4B
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 13:42:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.108213.1696340510864975172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 06:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dERHNJQP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86400e934f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 393Bx8Ff020233
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Oct 2023 06:41:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=mMHcMxQqwwFgSfEl29D
	2sLmfkx0KdMAPgjlzgAgd2mg=; b=dERHNJQP4wdvX51TQGxzY+6XpdfEy9/qjkV
	Dj9RfhcSUv8RkBiBb677TNxhH8ukh4LR+2X6f8fg0umkxhGK8oZvJ3BwRS+jZkFW
	U56AZ4dU12cSdhpm2wK/voti7KwhTYPNq+xi3oElH6qWyR5L4Jur20upZs07Nd5R
	Br6+FXFSIkEbwqVWZCpERvp3eJ/ZdfpZwkzJ3yOxckM8tYDB+AuPtRv7H7vV0PL7
	y9bTDx4CLbtBfukB0GUOeS8BZPrdIq89/cptHnPDE+HOZZkQYdNN/q6KwI8VPsHv
	isuclt4DemODsTcrS+0bKcGIexHmsxxKW7+HLt2DncTt2Fvpe/Q==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tek6g2hq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 06:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZffhQ+z8keTUBGXNdf39UttRP6L83jjUMf+4e94PJkmTHgPr7/cmzU/RivUYGP8YNkCTzaRC2ArsL9ZBlD8bPHwCI/e2cSWtrwbq5CY0/aucxntmEaV3Q5Z4SEHpQabDS2TrHhk+wdxm6sTbzuBKDl3LbXoq2DixFv9xgim0Os+IsWJguwXbUZWJyrhfIvjqtu4HzPm/ou4VL0JBOY8Cxk86pVK+aMG6k3/l+a+Mnya/Dez0HH5p1xbAF9Tj0dI7gGSpz4ZdFCLHl869bIDd9K/DE5nKclHU7Iwxl3t9jBSSmlX9lPKvIMDeeRrH7Bls/BDzi7oXy8/yDYmh2wKcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMHcMxQqwwFgSfEl29D2sLmfkx0KdMAPgjlzgAgd2mg=;
 b=J7Dk39tjFHd/bcZxsGunBO7aeeLrJjq9oYe5gh5/sUxo8cCywh+L+sQziyjFGRkMJUkawZpPjg6QJW4nSevqLlS8Y27U+vqyIMhCNkMFryicLbsO9Cko1SsUsOhLMaIcSOkphsWWDldsBc1HqUJpCUnhkALsNLMhXAX3i/UigXWL1Dlw9YG6csaSGNnbsUXNw5+yn+GDQByCJmNH90U1qVlxJlw2ZEInwr/85yUj2mPn17wWoSN9g2ZcHfydzhbGI71WVsD6OXIw5nXUtaisgAo8utBVruLi39P22QRapEa+QSsUwi/mIDBmM/z8KnbJ1SmWeMF027Kwe+Gw0f+CWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Tue, 3 Oct
 2023 13:41:46 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 13:41:46 +0000
Content-Type: multipart/alternative;
 boundary="------------0kLOJ2MSXdhNC9HUfF3rF0ZA"
Message-ID: <1c1083cf-206c-2160-9ae2-4cd7ef4fb8ba@windriver.com>
Date: Tue, 3 Oct 2023 09:41:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH V3] glibc: stable 2.38 branch updates.
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org, Deepthi.Hemraj@windriver.com
References: <20231003030917.3593279-1-Deepthi.Hemraj@windriver.com>
 <11138.1696311295328635413@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <11138.1696311295328635413@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 35897e0e-29a8-494f-cd5d-08dbc4167c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VaBWg3XbWKvO21te1NSD6nai+xcEPOOk+5NwpSJ58gUUD/h6PRS+37HQ0d3XCRV9nvahPHIYPrLm9QLUqi8CVHC6W92knNk3VQhMq+Lzy91zkf2iRy7zUzfIPT8Lj5wQmQESXTMpipcVLiHN4uZX91VEK1wgi72b23DOXt3J2mvYK6mEoGWqWjskoyjlBNmdzpq+qvnACRuGAxU94FHKpEMBY5yZarrt4h2gkyigJ+0daFfRmGEsn/riM78R2s71uOfgdGz5/bZsP3Anu4XVhfaM9WTRXRpLyCKGw4ooWiiFn1uEOGpUiMi8pwA/UrdsiqWUvYyI25NT+XoGaMDMnvFTl2y5GJUIETbkLbyXXmtC3B2F0KbSz0WW/kXdA+DbzGkLOpffNJfqn5dZKIzrrJnoQxeyNXZqDKmDreXgABJyFB2+/mwd8UxfQ6u4mFfK+YpXVW9PvFWTwFCjTIgMzaKbJ9c1yk7uA+RDdqsftWim6IGpDXURDHndoEke86HkTzkbNqvO+uF8cOa4fY77X9uHmP4PyzFXdV/esurJvVhx7+4p1qLaTtVzS4mt+FwcM4LLpBgnOQwE88GRX+mgWturIsm4Co/aTf19+2L9LhM+2CdGT9iLvOqEqr+cEIh/rQGoycZvSwZzE3icP3QPvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(66899024)(31696002)(86362001)(38100700002)(5660300002)(15650500001)(8676002)(53546011)(6506007)(6486002)(6666004)(6512007)(83380400001)(8936002)(26005)(33964004)(316002)(66556008)(66476007)(966005)(31686004)(2616005)(478600001)(66946007)(2906002)(6636002)(41300700001)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTBKRXMrK1VVTkVoSGdoWEYycVNxYzJqbnhhRUU0RkYwQ1lsUEsrNEVnUjJW?=
 =?utf-8?B?Lzl4VmtiYkZLTVgzUlNXQy9HMUN1WHkxbkpocWNseTVDekZYdjJ2dFQ4TDBV?=
 =?utf-8?B?azdDTVZYeTVyZ2NqYTRXQzZjSzcvY0k2dzR3b2RLUHhaTDgvYm5SSUJ5ZHBl?=
 =?utf-8?B?TlhVWndlOWRPeHE5ZWZURXo3UGhkL2xJV0ZXSHZqbDBJZUZiTFJWNEFuREY2?=
 =?utf-8?B?b0k0YXlaNXUzQ2JvZGNCanduTmJEWVFZaWtHZWJ5aGh4aUdBZlJZUVZ2aVNJ?=
 =?utf-8?B?NzhESDUyTEVpNisrQkFkU2x3Z0FGcnZvaVZ4TDV6YUlsc1lVSFVwK2pQeEJp?=
 =?utf-8?B?ei9xdkI1SUJGNTFrMlBxTmdsK0p5WDZvdU1UTlhXRW0vYlRlS3hGc1hhUm5B?=
 =?utf-8?B?WDltTHYydFVoNGgwK3FwdjdzTHBzTGEwc1R6UEo3ZjR6SEFkSzA5dTYycFhz?=
 =?utf-8?B?TlhSY1R5OEt6Z1c5VmlLeFRqV21ZRzQxVkpMeTRRY1loUlBiMGxVY1lvQkhZ?=
 =?utf-8?B?UUp5UUIydkFGU1p1S0Vzc1lZcEsxS1Y1UjdjNlYraCtNYzJCYW1IVFM3QTYz?=
 =?utf-8?B?SVlQd1NGdm9HODJhYk56VTZic0VvNVM5M3RtZ1pibTI3RmVQTDlON21XNDJJ?=
 =?utf-8?B?aG9VMEkrYmhGcmYzK0ttYmd0c3l5QStoeklOV3BEQUJIZGFtekRZTnhIVmVh?=
 =?utf-8?B?b3Q0bUJNSlVBQlkvRm5UMWIvSFhuL1dHZUcvQklRNnFBMk81WlYyOS9jY0oy?=
 =?utf-8?B?cjZJSHhIS1JBdEVGMWs3VTlOMVBsTkMxMTlCRm1RSzBUV01LcjdHQ3A0QlRy?=
 =?utf-8?B?R0ZOYlVDM2Z2THczMW9YN0dKSlJkTC9ISWVaa251U2tVcTBQWUlsWGIwUWt3?=
 =?utf-8?B?QVJHbUJuOU1HRHJCYzA3TnBwSGxOc21HMy9nbm5KTFB6WVN1dkNLaDhjTEdk?=
 =?utf-8?B?WlZJTElSMVhvRnBZU204c2k0bUNDZGo1K2VVNmZUbURFZmJRVmFGVERncXVI?=
 =?utf-8?B?M0srYWliMlc5bEtPdVJYRWg1WnJpRm92Qm5NT1BZVkdGaEwrS0l6T2FUVDFQ?=
 =?utf-8?B?TnEzM3ZGQ2hGZ21VbmFraWVzR0VMVSt2MGsxSUNFeXFTY3R3ODBpWWlhRGht?=
 =?utf-8?B?dXpmbnYzQzJqU1BsS2pyN2lTNWQxbjZFTldkSEZ5ckJWVi91Njk1aU40Tk13?=
 =?utf-8?B?ZmJ5clRaWTZHNlNBL2lGMDd1MmlFOUtXbG1XSTJaTE95SG14a244YktvL1ZB?=
 =?utf-8?B?WXNvUkE1dUN5Skd5U0k5OVZEaW1xc2hOK2lUTk9iYTZkRUx1c1dGenBWVG1L?=
 =?utf-8?B?a05lMWM1OTdxRE9BUHhqbHhyNFpseVcyMGhmcTJ0eksrVXRiVEllc2R1djZS?=
 =?utf-8?B?Sm9DVXlWQUJ1aTliSTl0ZG5jVzJDcGhSdktwTlZWb3RZWVI4SFdpWXUralda?=
 =?utf-8?B?V0YwQWFTTVFyRFl5MGMraXBscXZpOWkzYjlxZ2o3SDhoMWJyRDgxYXR3Tys1?=
 =?utf-8?B?WXdERC9ieHU3QkJtL00wdnJMUHJiMjB4Y3BHMVo1TStnUHJJK0QxMjVnaU5s?=
 =?utf-8?B?dzY2eDFnUzZ5b3N3c1JjZ3JWOUt3dDdHREl4N21GcENrNFNEOUZkajdKRzQ0?=
 =?utf-8?B?enMyai9uVHBCS01MN0d1R1RuTmp5WDZNME9mWlAxaEVVT2lzOXRua05raWdq?=
 =?utf-8?B?MlQ3TWNkSlphTW9uNzkxc2NaSTVSUGNWUUVOSWl1QnhWNk91OVAxSEZvN2dH?=
 =?utf-8?B?aWRlRkxabzRWd2QzMWs3R0VXMlBsRyt0aTN6SzB0RnhLK0Z1aElXK1BHNlVm?=
 =?utf-8?B?cCtmTWFyNFdQa2FkWDNjTk0yN1V5QVpMREYxUW55N0c3RHJHTmcwaTZaTXUr?=
 =?utf-8?B?NkR0VVlXSE9uUmRTK0JFNmpBcHE3U2RhcHBlNS93QXNVME5YOEVrbFkrNXRo?=
 =?utf-8?B?VjArWDZzNmNndGNoZzV4bzhaRWFMemNiTCtLVm01ZjNINVFRa1Q5ektzMFQr?=
 =?utf-8?B?QzJIRUd3bnZYb29QV1k3eXJxYkxmVkFVcDY3ODlHbG13U3VMc1BoY2o5WVJt?=
 =?utf-8?B?VjRnZ0I2TzBKYmQ0d0dVTlVpeFpzQXBWc0k5V1M3Ukx0eE5OZU5zKzZhNXpO?=
 =?utf-8?B?N0h4YjhQVEJDUHV1UDVObWVrOG5IWnRlQ3FWV1BLRVpqVy9kTjV2VjNGUkxM?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35897e0e-29a8-494f-cd5d-08dbc4167c78
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 13:41:46.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBsylWdzUbzi4cgXZt8P2hvfFh4P0IXlBf+bfCSbkRGjXbGcB8YDL1fC8tZ8x7TrKEqWYTawracsNLhniuuWMzIIbqV0Bci9zi9AVbhtS/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
X-Proofpoint-ORIG-GUID: QZI0FdwYLvme5RE532P6z6-J09x-qs9m
X-Proofpoint-GUID: QZI0FdwYLvme5RE532P6z6-J09x-qs9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_11,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxlogscore=953 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310030100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 13:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188638

--------------0kLOJ2MSXdhNC9HUfF3rF0ZA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-03 1:34 a.m., Deepthi.Hemraj via lists.openembedded.org wrote:
> Regression testing is done and below are the test results.
>
> Before glibc update
> Summary of test results:
> 213 FAIL
> 4805 PASS
> 16 XFAIL
> 4 XPASS
> 218 UNSUPPORTED
>
> After glibc update
> Summary of test results:
> 216 FAIL
> 4805 PASS
> 16 XFAIL
> 4 XPASS
> 218 UNSUPPORTED
>
> These are the newly added test cases

Thanks for the update, summary and initial analysis.


> PASS: io/tst-fcntl-lock-lfs
> FAIL: nss/tst-nss-gai-hv2-canonname
It's a little odd that a new test case is failing.

Is this reproducible?

Is there a bug reported upstream or discussed on an email list?


> PASS: resolv/tst-resolv-noaaaa-vc
> And below are new failures
> FAIL: nptl/tst-thread-affinity-sched
> FAIL: malloc/tst-malloc_info-malloc-check

Are these reproducible?

Is there a bug reported upstream?

Please do some additional analysis of the failures
including whether they only happen in a bitbake build and
report back here so we can decide how to proceed.

Thanks again Deepthi,

../Randy

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188623):https://lists.openembedded.org/g/openembedded-core/message/188623
> Mute This Topic:https://lists.openembedded.org/mt/101727838/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------0kLOJ2MSXdhNC9HUfF3rF0ZA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-10-03 1:34 a.m., Deepthi.Hemraj
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:11138.1696311295328635413@lists.openembedded.org">
      
      Regression testing is done and below are the test results.<br>
      <br>
      <span style="font-weight: bold;">Before glibc update&nbsp;<br>
      </span>Summary of test results:<br>
      <div>213 FAIL</div>
      <div>4805 PASS</div>
      <div>16 XFAIL</div>
      <div>4 XPASS</div>
      <div>218 UNSUPPORTED&nbsp;<br>
        <br>
        <span style="font-weight: bold;">After glibc update<br>
        </span>Summary of test results:<br>
        <div>216 FAIL&nbsp;</div>
        <div>4805 PASS&nbsp;</div>
        <div>16 XFAIL&nbsp;</div>
        <div>4 XPASS&nbsp;</div>
        <div>218 UNSUPPORTED<br>
          <br>
          <span style="font-weight: bold;">These are the newly added
            test cases</span><br>
        </div>
      </div>
    </blockquote>
    <br>
    <p>Thanks for the update, summary and initial analysis.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:11138.1696311295328635413@lists.openembedded.org">
      <div>
        <div>
          <div>PASS: io/tst-fcntl-lock-lfs</div>
          <div>FAIL: nss/tst-nss-gai-hv2-canonname</div>
        </div>
      </div>
    </blockquote>
    It's a little odd that a new test case is failing.<br>
    <p>Is this reproducible? <br>
    </p>
    <p>Is there a bug reported upstream or discussed on an email list?</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:11138.1696311295328635413@lists.openembedded.org">
      <div>
        <div>
          <div>PASS: resolv/tst-resolv-noaaaa-vc<br>
            <span style="font-weight: bold;">And below are new failures</span><br>
            FAIL: nptl/tst-thread-affinity-sched<br>
            FAIL: malloc/tst-malloc_info-malloc-check</div>
        </div>
      </div>
    </blockquote>
    <p>Are these reproducible?<br>
    </p>
    <p>Is there a bug reported upstream?</p>
    <p>Please do some additional analysis of the failures<br>
      including whether they only happen in a bitbake build and<br>
      report back here so we can decide how to proceed.</p>
    <p>Thanks again Deepthi,</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:11138.1696311295328635413@lists.openembedded.org">
      <div>
        <div>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#188623): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/188623">https://lists.openembedded.org/g/openembedded-core/message/188623</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101727838/3616765">https://lists.openembedded.org/mt/101727838/3616765</a>
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

--------------0kLOJ2MSXdhNC9HUfF3rF0ZA--

