Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96439C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 17:18:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.140179.1692119878857281109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 10:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Xo0mWPXi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75917a1b4b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37FCe3kl020137
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 17:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=lCE9HxXYDgCUnwH0ZKe
	gApE5MNXpvWUmorBcj6S4Wog=; b=Xo0mWPXiksx40Vla3Z9lYe2mR7XF8cTRcLK
	GYsepJ3ScFR5zsmuiU/qjMEPco2bMHWXsZWo0Ter6UO70m1lUBB74RJcfvHWrWCy
	bcshQeqbmoyu/C+s+48c77Ego3ySuNyh6EDIX39UDYCbBrc4sLoXLtfUYeNpn9La
	6ac3qDDWJtLak3zdf45w7cZcyEQCfb6xLlI9h0EvyP9IU6PNaXv60yazqZG8CdZo
	I0BIQvxnFToUG4SmwBx2WX/tP0RQPRcFGZKlyqXZQKW6QwJ+9agWsPxXRXniNPG6
	yz5dymEP1fjlREVf3JvPIevfQl7fbam4J3XaFyzJgEYtmUxJUGA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wb3k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 17:17:57 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37FHHvmk022858;
	Tue, 15 Aug 2023 17:17:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wb3k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 17:17:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3N8o6LOOFgfLOk6W5PGl2I6zrXBZb4RsQaprZekXyucpJG+D6sFxpxSMgRfdEywXdpe/oBVU+Jonw0fZ3Ik6BYjdf4P9hcvavaTcUnVOb+kRmgrMwn6+S67adF8AlkuRSmrjj8u1+5otFYnprd+YXZaoQ07UfvrmHKORhcYYtiUso093HkX0jJT5HijW3IKV5K9qFu85Q55TNf3zet0eYecG0sSEdCx6+F3Mv3MIf6zac+StqmRmEGnx3jy1FPo0PBJgbAOy3V7E003o9jdcQKFmKIPVhV1BYHcSTkAjTK4DP6nBajIOETxZ9fN4M4Whv51yPsB+SJLpxyQibwhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCE9HxXYDgCUnwH0ZKegApE5MNXpvWUmorBcj6S4Wog=;
 b=cs6KoxZTsV52yTciPbPlZYUEHPbjDv4v1naxdQ382z0TG5Iv05hFLlGVs3tF2IQz0x1lFNRjX5D5/tUZEfYHbcWpRddAhrm/ZE9P0z/9ZFGMLGf++ZldToJH8yApuKc2HcdeiaXY67+Y8+oqTE7cEf5stT1ELnCIEoZN6UB4aj4w0mJyh383GWeXBPQdEgttRXJjQSuwGm/swstuJqF5HebXGBMZI0hLN2eVmegQmsx3238/s6YrQWFqcmv5AdjmnPPJVQ6zQI6016KMpoU3Uia6wyZhpDi1DI/5K29PZ8cvwD6+nNhvj6dzFJTQpFSs4P+l4AsSxWJvwI+c1pPnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 17:17:53 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6678.020; Tue, 15 Aug 2023
 17:17:53 +0000
Content-Type: multipart/alternative;
 boundary="------------COfCQbiVEE6TfirZRAetDCob"
Message-ID: <6040ec50-fba3-d12e-d451-0255a1abd1e7@windriver.com>
Date: Tue, 15 Aug 2023 13:17:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][master][mickledore][PATCH] openssl: Upgrade 3.1.1 ->
 3.1.2
Content-Language: en-CA
To: peter.marko@siemens.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20230801163641.1234605-1-peter.marko@siemens.com>
 <AS1PR10MB56974D76860791BC799D27BAFD16A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <AS1PR10MB56974D76860791BC799D27BAFD16A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: ef65b8d0-d212-49c4-ac3c-08db9db38efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hallBXhxsqADrZdEa/88x8Lz6fv+BHC0uLwhgWLgQouROKRNIsWlX6eHG3PTCrpx8Vr1vkcwzqmBslRN1Gbk5Ag3GisMH2CeT0xf22TXYd84sDVgr2Sqns9QtiXKCbjgW2FCP3plWipc9jnUqa9+I/GkbOP4fyBFMv20raREacan7qOHTZO59CZn15FSOGtiQRLsoE1liJVUTYX/QCB1mA6fDSZyhJ2bUmqFM+2Qsy6u80Hzh4+vj8eUWCuf3j5r9skpY27bzq6IRzql/YCvqwtRCD5b0y67B1DKG00HVIW3kfmuEwzXP96AcqWdI/wEq7ATtqqIsKRLBX8296MzCvnwK2+0d5nQsm0IaV1zudMSAEHN1cTJMe6FSnsNjVfOasRWEQZrbDiGYtBw5lqUDU0ybkcFhT4Dup8pM5A8zmbd9muwUVWRWSfwN5Tvo/Doy85gZx24lALYlk5TujyydpiSBUJA/GCQh1iW7+HH+u2wGcIgqN+9+wHjQScnAX6TMbdL1aI2jUruXMRn2KhTI8XAAnMnsjwVrkM9PPI7FnKpT9fqhBstPkyFY9KRtkXY7jLuyTCYUa014DNTvHCBbyJotxdWOoPU2bLwdBcwF82PyagWZpOnor//yehhfMJ2O/1svF6lGiZWETOAJDB+PA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(136003)(396003)(346002)(1800799009)(186009)(451199024)(26005)(316002)(5660300002)(83380400001)(8676002)(66476007)(38100700002)(53546011)(166002)(6512007)(6486002)(33964004)(2906002)(31686004)(6666004)(478600001)(2616005)(966005)(6506007)(41300700001)(66946007)(66556008)(86362001)(110136005)(31696002)(8936002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFI4TFVKeDdzSW9lOXVmeGVkUW40SWY3MTRHNDRBK1IyS2J2SVpnMStrR3hC?=
 =?utf-8?B?MGdtYjE1anRITzhYNXU0Nkw3aUpJdXpnSFFvazkySVFIcnZHZGNRU3FmT0JI?=
 =?utf-8?B?Wk9rMERHYlNuT3BnelRsb092QkRDaDdDc0RMTjkySVBwUzFBSFFiZnhpZDV6?=
 =?utf-8?B?ZVBMbitlcGxVd1NsVzNZOUVSWHFRMVNzT1Vvb05BWHl6UUdZT0RsMEtUY2U3?=
 =?utf-8?B?bytlRjdxN2xaQlJQSHJ6OXNoZXNHUlRBT2RXMmtmdWNvbS9aRWYwNFNibzZr?=
 =?utf-8?B?eERLREJFWHJiRWVXMUlKWVQxbzZZKzlab0dRR2NxOStMdUlwNWFnbW5jRUZq?=
 =?utf-8?B?bEd3dFhBbE9sQlZrZ21POFVic2NQZWc4VWgvdjhCZllCQ1dGUkxyamZwUHd5?=
 =?utf-8?B?OW5IRHJyK3RVZmFXVENKbnp4VTBPTXllNlJvcFk1d01wSUp1S0J2REt0MkR1?=
 =?utf-8?B?c2lLcUtWZzlMU0w3QnNpNU4zYXBRMTdCVE1UVkJwUUR5YURBQlBVVUdvS1Nj?=
 =?utf-8?B?ditvWm9GcUpQNGJ0OTQ4eUxuMHRNQ29lVFJPS2VoS0xKUlA2QzhaQlZNVUFk?=
 =?utf-8?B?SzU1RXJWL0tDc2hLVFVFbHJTTWcrbllZb0IwRW9zZ0FacjUyc1dOV1RBTkds?=
 =?utf-8?B?ejkyZE1nbFllYXJ3Y1NwamlMbFlhZTl3QlpZL1NuTmozb2dFU01FZ1IrZTVL?=
 =?utf-8?B?U2tzeTA5eVN0ZkR0U1h2VTZaN2I0L1lGWFdIVXJ0elRyUktHTWx0bUxqL0lN?=
 =?utf-8?B?UWdEV2tGZXMrZlQ2aSt6Q25DVUp1SHhBdVVTd0VJTW1vYXpLdzljS2JJNk8y?=
 =?utf-8?B?UmtEZ212M2puREtjNVYxZi95V0hRQXlVcHdYYnBqNzBvdUlXeTM1bEY1L2Yx?=
 =?utf-8?B?amNFVTRLY1AzWW9sMEc1S3crVE0yTVJQMGFKR1p0azY5dHczVkhhdWcvTTd4?=
 =?utf-8?B?ZTdkRmZDMWVpdEU4eEhWWTJFU2VlTzMzY1VXbE4vbm9YRlFQejgxc01DNW00?=
 =?utf-8?B?S0NYSWsrZkRkZU1aYzluRlZPcVBqck5uNWt2dGR3ODYrZ0JtWnhZeDdmMnk3?=
 =?utf-8?B?dVFVY2pVdWJXaGNvZHhPZjV3YUltSUt6V3lJRFhTblRZZTZnRFFQT1pDWU5B?=
 =?utf-8?B?K05rNGM0MkVhTGVrOW9xV2hoeXI4cDAveXJZRytHT0JnUDRiZFZKeGppMmxK?=
 =?utf-8?B?NkxMRWV3QjFBRUNCb2RwelU3TjQrRWpJbXptWjgvRUMrTk1iSFFDbEpWUHVN?=
 =?utf-8?B?aHNlR2c5ZnYrVytkbGlHSlB5d1ZOZFU1eTIxbW5iQUhVRjh5QStSWktkekxS?=
 =?utf-8?B?Ryt3c012cTRLWlcyYmFJOU8wTHp0MlhRZjBhU3YwRkZlZFBMcWxaVFB5MGpY?=
 =?utf-8?B?MFBCTVpaWXloa1JtQWRHTlZNNWFNdjI2eFkvYU93aEJDdE9qdEdSUi9FUjFC?=
 =?utf-8?B?bXpDWWJ1ODZkZmlQWkh4SXFvdEkyZWNVRTJyWngyZ3g1RllwazZ5L0lJMVow?=
 =?utf-8?B?WjhONmNFbFRJVXBSWUZua055bURyaEJaSU9IaFVIdEhWVGNoNlBkNHhWTk9o?=
 =?utf-8?B?azhRWnZJL1lSdUxkQ0N6azZwRFp0dW5ZMUpjTWZnTmJjZGNnT3FrMElVbWZJ?=
 =?utf-8?B?RHJjSCtJWlpPTzZSaEl5NE9ERk9sUFIzRGxRajlEOE9QTlhWUjBSYnhVdTFh?=
 =?utf-8?B?VFJrODY2U1QvNnhzcHVHSUQ5c1N6L2hYMjNqb0RiVDJwU0JwNHd5NVVOL2s5?=
 =?utf-8?B?TWRSQTU0SGVBYVA4WHFCK3ZmcG9acFc1b2tCUTVsV1oyNit1ekJwOUdveDVt?=
 =?utf-8?B?M2puR2Z6NkgvbGNXcUp6K1dlTU5YMjN5M1VmcXRWZHcwUTJrUVQ0b2tsamVn?=
 =?utf-8?B?OTZYVVN6M3RQVUJLVzhnN0ozWGJ6SFoxaTNvOHdJdkNaTXhldXQ1MFVFcldM?=
 =?utf-8?B?d1R0K3NXNDBNWHdUUnkvRWpiOUVmTXpqNGtzakwzb0lrVmxMTVUyZXBwU0x6?=
 =?utf-8?B?bHl2RTQ1WE90eTdyNG1MclVrQXhZSDhocmN0RU5ONFZ2WXNDOEJkbjgraEEv?=
 =?utf-8?B?MCtPY2YweFMyZlRiREFISXVkYSt0K2d6N0hkczladi9SWll0VFRQclF2UnM1?=
 =?utf-8?B?dmwvaEdOMHZRME9tZmN1emlwRWd0bURBT1hFREJ0KzRIMDRlN0FQaTRsRmdj?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef65b8d0-d212-49c4-ac3c-08db9db38efc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 17:17:52.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjxl0enCdEtaHThH8dVhIxtKgC1aF8OrY7g2fVGwPFiVS2sPb9w4j8zAN+JTCVXdap1370QF/OxM2E0pZOYYaHFYOvaeYMgQBlCegLa2cMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
X-Proofpoint-GUID: _nIHBP6-Aa255TJVZ19k-goekW9DuiQL
X-Proofpoint-ORIG-GUID: 1Ohiq19ZsogkaF_Q-DAKT9tfO-BjLRsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-15_16,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=661
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308150155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 17:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186099

--------------COfCQbiVEE6TfirZRAetDCob
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37FCe3kl020137

On 2023-08-13 06:49, Peter Marko via lists.openembedded.org wrote:
> Gentle ping.
> Is there any problem with this patch?
>
> Peter
>
Peter,

We'd all like to see this openssl update merged but I suspect, that for=20
master,
it's backed up behind the 6.4 kernel update and some glibc update=20
problems summarize here:
https://lists.yoctoproject.org/g/yocto/message/60802

and (I confirmed with Steve) because it's not in master, as a matter of=20
policy, it's not in mickledore-nut:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/mi=
ckledore-nut

Stay tuned, check on:
https://git.openembedded.org/openembedded-core/log/?qt=3Drange&q=3Dmaster=
-next
and ping again if it's not in oe-core/master-next/master in a week and=C2=
=A0=20
mickledore-nut a while after that.

Note that, it won't be in mickledore-nut until after a week or two after=20
it hits master.

--=20
# Randy MacLeod
# Wind River Linux

--------------COfCQbiVEE6TfirZRAetDCob
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-08-13 06:49, Peter Marko via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:AS1PR10MB56974D76860791BC799D27BAFD16A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre class="moz-quote-pre" wrap="">Gentle ping.
Is there any problem with this patch?

Peter

</pre>
    </blockquote>
    <p>Peter,</p>
    <p>We'd all like to see this openssl update merged but I suspect,
      that for master, <br>
      it's backed up behind the 6.4 kernel update and some glibc update
      problems summarize here: <br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/yocto/message/60802">https://lists.yoctoproject.org/g/yocto/message/60802</a></p>
    <p>and (I confirmed with Steve) because it's not in master, as a
      matter of policy, it's not in mickledore-nut:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut">https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut</a></p>
    <p>Stay tuned, check on:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/log/?qt=range&amp;q=master-next">https://git.openembedded.org/openembedded-core/log/?qt=range&amp;q=master-next</a><br>
      and ping again if it's not in oe-core/master-next/master in a week
      and&nbsp; mickledore-nut a while after that.<br>
    </p>
    <p>Note that, it won't be in mickledore-nut until after a week or
      two after it hits master.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------COfCQbiVEE6TfirZRAetDCob--

