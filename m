Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385F9C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 22:10:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3063.1647468623789886429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 15:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=b/yXINcP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00749dbd31=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22GM3w41015575
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 22:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MdVTeJiKlg/srV55bhx6NIVrSxapnYA5Ft4QhTnZOcs=;
 b=b/yXINcP0p9sPwFwlQ2p2XfFnL5EWH3cNIG2K984dR/LYZ2py3fkJpm7ZPYQwdbZGloR
 rrTZuoVIgOh7pNd/caxCoXlRKxMVVetuA+Ec0ap1TV1Kyo+44H4LSAyAT6eeECfXv2p0
 yDkzsEzx4+1vEw+dxs04sJ4b1TLjGgw/fsmKJZwzHbe0AxJH3c1zEc+dNTscTNoto/g3
 qlZNjEsYQRpte1sO1OaNq37RCqJa1k3YL1ADFhg+PGjVlsovX+fw24Wfi4US3jtvrvKU
 GsfLYrc6TL3GEXYurZcQSxidYspsaOg7dGBkNO7fa0RnRUH03Ov4HFUcp05T/OvdYLwp kQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erjg7uwfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 22:10:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22GMAM9S027473
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 22:10:22 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erjg7uwfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Mar 2022 22:10:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPDB3p7o63KRyQlaPVqUs7cdxdVj+81Lwn1e0Y6MH60l7w4/Jpr40zdXrDAM9Cu9j8b7/YxS/PWPRO4X0eZ8Ka6iz3H08oUgtmaplljsVqaSNkU1JHN/F6MBTRYn9NRoOJETwn8KAbXoUQ+/m9ceozr2G22SP24YRsBLCzkwA3AuvaYMPCpWJL28IQ1ASvS8B606pzAJ79jYJx0kpHfs4OsvBhORs2gu3M76wzKH37wPCMp5pJHyPI2SLQcJ0zlAKeFAkrVDebxqpRbi5TSGYV9DgMA/gWM5R06yfyILtxpHUAo1baDTeoxjitwYoMcD1pU6XwXL6ebKravk99s/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdVTeJiKlg/srV55bhx6NIVrSxapnYA5Ft4QhTnZOcs=;
 b=FPr/IBuNC/xzbNkq4IB5SFNWrfUd0G3Jq/IiwFjzv+CzJHOR0zZ/l9cSv90OREzEZElNMkJTroGjOWgNPg2Gf4vbPaPIDMrgvYBby3BM/uV4fbbaESH0FUssA33tyJZHZrnsmsWFBKIxoZtdOPr/ZG8B4rUNejeWntw7iL9HevPBb9E8zbMf94WGRoPZ/lni010wDjxk15fpPQ/BIblk/7FWs36kVK+V8GKyTDFz+cevx7eIw8rJlTb1CxqG29Tf4jJLBYQoTeFT8jYOTq8OWMeFRYcFscBGjEsHmk5wNB3oo8SliaFsBDXbH09xyF3uQzPNkmVt0FIVdnawGvSE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB0060.namprd11.prod.outlook.com (2603:10b6:4:63::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Wed, 16 Mar
 2022 22:10:19 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91%5]) with mapi id 15.20.5061.028; Wed, 16 Mar 2022
 22:10:19 +0000
Message-ID: <58facaa2-aeea-5e92-c669-4e6e3ee68e94@windriver.com>
Date: Wed, 16 Mar 2022 18:10:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [dunfell][PATCH] openssl: update from 1.1.1l to 1.1.1n
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Zhao Yi <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220316161547.1527214-1-ralph.siemsen@linaro.org>
 <CAOSpxdY8p-C5gRFoELnkd4xWb0+XW+OeJ41_2+eT24GVBSxiUw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAOSpxdY8p-C5gRFoELnkd4xWb0+XW+OeJ41_2+eT24GVBSxiUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d97d2873-fdef-456a-8c84-08da0799c1cd
X-MS-TrafficTypeDiagnostic: DM5PR11MB0060:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0060947CEFBEF152E985C9D2F8119@DM5PR11MB0060.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V1KeFmIfG2MxHA2Wvv4a91Om/Tq7kqe6gMHFnskusHWV8O5o68098UIrWrNhrVE0NYjZVC50SAyoPrDSwP6exq80Ng9ycMft97YxXerGvWWCTEM+OlB2SkS7xschVfgwk5CpEPXTsmJuMaWzfkqWz6MXh0DARb40/sESgBSndki/DXp/A+dgi7b3Avr8YlP4cPqgArzREdG3IyPaMMbeNSDDfgeUnu0Zyuw2XIKzoUuCoBuxifU+ySfDf2sYkcVXsXvc7aR/edK2tvDMZzQdQNnwnNIbIqKm2cu0dDbudClYZWztbPT9SSbDCXUAofUUTcvusmAaz76GvuHDfZ22lseTNMMTrzzdEUdvj5IG0QUCs7Q7DMAu2vV8sbe0i8gk8e2CfF5mk8ISOrV7hMZ2aNvDzOMm/+7ubmLe9JGrYMClF9h+zTq3VP/7WUbH1CpSCAIp3CE3j9YYJImVZQy0+LluwaqfIUlRbtBHbyDPKk+q3GglLkmq6tWUmfqZW4lXeSOsRsjAQk10aY7Zoi6hOZvCGSWS4Z2MUA72sbZE8OSRuas9uO+Qtk8DqvciM8K2Wrf3KjbIEDRf3desKvEgMTrjy1azpw5JmpmMGLF2cPtcFglKzjJUVy4Qq1MLHEoZMHBnADX/ECa+M+VRR7G3uEWx/3rN5wqX7r/R++5IXcSBWESqqI9CjSiDypzixODl59FdSRL68xRRh/RwrzR+oUs4eSxKNyEmFzyYDaxrZ8pSiC0ipUbbxtJPJfRxQ/4JZXrN7k5Ap4u/9lKdrPvHhv8z1SDkqX1Azdcosk8b55I3RllvN0hq9IKtva9a/UFjlXvDmUIz16WPfDR38izm/bS59FYAshBojiJUVTqr8f2cgEw+vp1VQrfTps5J2LTW59u680ReN47zOnjxdRuL5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(15650500001)(2906002)(316002)(53546011)(52116002)(508600001)(6506007)(8676002)(66556008)(66476007)(66946007)(4326008)(966005)(5660300002)(6486002)(45080400002)(31696002)(6666004)(86362001)(8936002)(31686004)(26005)(186003)(83380400001)(6636002)(36756003)(38100700002)(110136005)(38350700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0J6L2tnSTZlZitYUThaZGNZbUhKMW5peWVZQ2NZK3JsN3V3aksyb2t2UUFZ?=
 =?utf-8?B?ZDEyeGJNYnVOVXVLckZGMWp4VzBmb0g2T2VEZTRILy9uVFhJUDdGYldFS0R5?=
 =?utf-8?B?Zy9RUjE4NUxPS21mcXFTUm5lN0VGYW9DbjRqRkdlODdxTmN5bEVQci9CNllz?=
 =?utf-8?B?MzNDdjl3dnZoSlI2ci84YWlNdFBzL0U0Mkt3eWJ6bklidXA3NXQ0VHBqQnpL?=
 =?utf-8?B?Y3I0a0lIaEY4RWpjRE90NWY4M2RYV2JjSURlVWZ0RFNwRmw3RnBJRFUyblJ3?=
 =?utf-8?B?SlMzdlZDbXgrUzV0OU9OakpZYUNXYldrTFhlc2piS2Z6YlRsdnpJM1hURFVp?=
 =?utf-8?B?eXJCUGJMazFUZkR3b0tCZGVYUE92a2xmVXRYYXZSbllGS2RSUHdEV0t1ZjNh?=
 =?utf-8?B?N2dVRkY4ZTJPWDZUbmNvL3BTRVhjdk94cnk0Rmp4YzJjYlNyb0RsTWlqTzJR?=
 =?utf-8?B?RHpYU29mSmI1MWFXOFU5Um9BaWtndGlHTDJ0UmRqcy9yNXNNZGdTY2NZb29p?=
 =?utf-8?B?b3VQa0kxOElzVml5bkcxbDRGTlAvczBUSnJtWmtFMmFRZWJ3aEFHeCtUTVZ5?=
 =?utf-8?B?Vkp2Nk15UUNuNWVtMVc1SzJRMTBQbW1KWW9FRHFJUmVPUUlwYTRyWWhyVTM2?=
 =?utf-8?B?dEVyb1hUSGR4T21RQU91aVFldFp1SU02VlhsVlRVNy80NGE3U2U2d0FvMmZQ?=
 =?utf-8?B?R3lyTGJGM05zNUFZejQyNk14UUtGVVlRVmZpeWRKQmRGRk9XelJyVVdPN1NQ?=
 =?utf-8?B?VGMzcHVDbU9QN0tiRk1HU29UQXdIdXdHYVZma0JWT1hCNkZ6eFIzbmY2aGVY?=
 =?utf-8?B?dmdoY1BlUGpiekVGbmRhNlA1OUpmczF0cWpUcEF6MnQ3NC9VcHVFVjlkY1VL?=
 =?utf-8?B?Z0NUWVlhQ2ViZ25sTUFjZlZaUkZaZUV2QU5XMXU0UUtiRXdZZ2V3VlNvaXMy?=
 =?utf-8?B?TFIyYWRSL2RkbWx4bGpiaDZta21RVEtHbU9jSTZxemx1MnJxWW1mbHlidWlx?=
 =?utf-8?B?RHM3b3lyUnRtK3VLakVjOVVvMlQvMktSMWJZejRUTzY1V1FwaXhld0RhNmIx?=
 =?utf-8?B?TnU4NGZnRUhpNFU5WjY1alExWTl5NHo4SHBRUStpM0wrQTd4TC9WdnhSMFpD?=
 =?utf-8?B?TkZld1Znc003Wmd5a2VackdaSGI2c2o5YTBnZnJFTjNuVDQwVXQvZlNCTGg1?=
 =?utf-8?B?K1BvRm9TWm1aUE8wZGNreDBwY25rNEM2WkpGS25TdVVIYTB6a29ydUU3S1Nh?=
 =?utf-8?B?VEtEQzZRTElPNDdGVG9JYldUclFrK2t5U3ZGT2I3S3ZkZERVZFFWYUlOcVpS?=
 =?utf-8?B?UHZUNS81VGtBcDVlZ2xPK2FEcG1iWDJ0TXN2WkVyYk1LK2F4dTlRMTdVVFR5?=
 =?utf-8?B?MFovVXhkc0VSS29aMno2OERFRmttMWEzVUpOS215TmQvZ2phTmlFVHZFZUlJ?=
 =?utf-8?B?anY5aTF5U3VZTHJRVGVKV0thOTBJdVdYemFQY3Y2bHcrekhmT2lJMThkMi9K?=
 =?utf-8?B?NlVtMTVBdzRZUGh0VEJKWTQrS25Zd25XTmpoOXJ4bUc5clMyU3VTZjIxdHlu?=
 =?utf-8?B?bGM4bGk1NEhqMW9uYkQ3Sjd0TUdLZ2tZUkczSU0vYkFSVXJ4c0w0cHVTaHFD?=
 =?utf-8?B?cy9YWnpLZmZ2R0s5S0dGbllVc2FXNktOSUdYUG1xUWpycWEvOVVsaHNpaWZ6?=
 =?utf-8?B?MFZnWmp5Y3BpcG0wTDVBdHJvdVF3UlpUalBuTWZob2xQMXpPeFA1VG9hRlZr?=
 =?utf-8?B?bUc0Wkt1SzFuY3gwYSt0SFJKdzZvYXdtVEY1OC8xVCtLb3NTVHM0OEFnOHpP?=
 =?utf-8?B?ZFlTejlkcmRhZVoxZy9WS2dRNHVDTEFnNVQzRkpiaFFjY3Z3QlNkQUQ5Mm51?=
 =?utf-8?B?QzFUS1FZUmJsR01GYjcwc2VUU09ldU1VNVRjTDVFbUpKUFdCbXU1MzJvbTBl?=
 =?utf-8?B?N1F4RkdDV2ZiKzdvcFNTcFpEekdnYjFZZkd4Y2ZITWliOWZXYUVFSWtkcnJz?=
 =?utf-8?B?YW9Wb28vZDVBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d97d2873-fdef-456a-8c84-08da0799c1cd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 22:10:19.0616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NGlzIh+wHzW052pWRa8baKXM1r1UXHj0BD/VFd4BEBHrwOha478ZVIeQ+eXNG3onK3ovdVvZKE9VhVE1ns1GzvSFHJqppR82HFC2QPCGY/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0060
X-Proofpoint-ORIG-GUID: FaHg-QCgAWHd1kvxdOwKYlVpbc53Mfon
X-Proofpoint-GUID: SbeRMV1vc3oVbTdwFkQ7fKrTfGWMPrCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 22:10:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163360

On 2022-03-16 17:50, Steve Sakoman wrote:
> Sigh, now I remember why we did the CVE only patch - this version
> update introduces a ptest regression. It's sad I can't remember things
> from just a month ago!
> 
> See discussion here:
> 
> https://lists.openembedded.org/g/openembedded-core/topic/89179173#162027
> 
> If you can find a way to deal with the regression I'd be happy to take
> the upgrade!

Steve mentioned this GH issue on IRC:
   https://github.com/openssl/openssl/issues/17537
it's a long thread and I honestly haven't confirmed that it's the same
problem as our regression tests but it likely is.

Yi Zhao was looking at this update for hardknott but it's likely
also relevant for dunfell so I'm CCing him here.

Yi,

Do you have more to add to the discussion?
Where are you with debugging the ptest regressions?

Ralph,
Yi is in Beijing so maybe the two of you can do an email/poky-contrib 
ping pong
on the problem and get to a solution sooner.

../Randy

> 
> On Wed, Mar 16, 2022 at 6:15 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>>
>> This includes a fix for CVE-2022-0778. There are quite a lot of changes
>> but they seem to mostly be fixes or cves, see the CHANGES file[1].
>>
>> Drop previous fix for CVE-2021-4160 since it is now upstream [2]
>> and include since release 1.1.1m.
>>
>> [1] https://git.openssl.org/gitweb/?p=openssl.git;a=blob;f=CHANGES;hb=refs/heads/OpenSSL_1_1_1-stable
>> [2] https://git.openssl.org/gitweb/?p=openssl.git;a=commit;h=e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb
>>
>> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
>> ---
>>   .../openssl/openssl/CVE-2021-4160.patch       | 145 ------------------
>>   .../{openssl_1.1.1l.bb => openssl_1.1.1n.bb}  |   3 +-
>>   2 files changed, 1 insertion(+), 147 deletions(-)
>>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
>>   rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (98%)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
>> deleted file mode 100644
>> index ff1e807157..0000000000
>> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
>> +++ /dev/null
>> @@ -1,145 +0,0 @@
>> -From e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb Mon Sep 17 00:00:00 2001
>> -From: Bernd Edlinger <bernd.edlinger@hotmail.de>
>> -Date: Sat, 11 Dec 2021 20:28:11 +0100
>> -Subject: [PATCH] Fix a carry overflow bug in bn_sqr_comba4/8 for mips 32-bit
>> - targets
>> -
>> -bn_sqr_comba8 does for instance compute a wrong result for the value:
>> -a=0x4aaac919 62056c84 fba7334e 1a6be678 022181ba fd3aa878 899b2346 ee210f45
>> -
>> -The correct result is:
>> -r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
>> -    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3d 97ed17d4 7950b465 3cb32899
>> -
>> -but the actual result was:
>> -r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
>> -    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3c 97ed17d4 7950b465 3cb32899
>> -
>> -so the forth word of the result was 0x75be8e3c but should have been
>> -0x75be8e3d instead.
>> -
>> -Likewise bn_sqr_comba4 has an identical bug for the same value as well:
>> -a=0x022181ba fd3aa878 899b2346 ee210f45
>> -
>> -correct result:
>> -r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3d 97ed17d4 7950b465 3cb32899
>> -
>> -wrong result:
>> -r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3c 97ed17d4 7950b465 3cb32899
>> -
>> -Fortunately the bn_mul_comba4/8 code paths are not affected.
>> -
>> -Also the mips64 target does in fact not handle the carry propagation
>> -correctly.
>> -
>> -Example:
>> -a=0x4aaac91900000000 62056c8400000000 fba7334e00000000 1a6be67800000000
>> -    022181ba00000000 fd3aa87800000000 899b234635dad283 ee210f4500000001
>> -
>> -correct result:
>> -r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
>> -    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
>> -    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
>> -    2822309cd1d292f9 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
>> -
>> -wrong result:
>> -r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
>> -    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
>> -    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
>> -    2822309cd1d292f8 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
>> -
>> -Reviewed-by: Paul Dale <pauli@openssl.org>
>> -(Merged from https://github.com/openssl/openssl/pull/17258)
>> -
>> -(cherry picked from commit 336923c0c8d705cb8af5216b29a205662db0d590)
>> -
>> -Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb]
>> -CVE: CVE-2021-4160
>> -Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>> -
>> ----
>> - crypto/bn/asm/mips.pl |  4 ++++
>> - test/bntest.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
>> - 2 files changed, 49 insertions(+)
>> -
>> -diff --git a/crypto/bn/asm/mips.pl b/crypto/bn/asm/mips.pl
>> -index 8ad715bda4..74101030f2 100644
>> ---- a/crypto/bn/asm/mips.pl
>> -+++ b/crypto/bn/asm/mips.pl
>> -@@ -1984,6 +1984,8 @@ $code.=<<___;
>> -       sltu    $at,$c_2,$t_1
>> -       $ADDU   $c_3,$t_2,$at
>> -       $ST     $c_2,$BNSZ($a0)
>> -+      sltu    $at,$c_3,$t_2
>> -+      $ADDU   $c_1,$at
>> -       mflo    ($t_1,$a_2,$a_0)
>> -       mfhi    ($t_2,$a_2,$a_0)
>> - ___
>> -@@ -2194,6 +2196,8 @@ $code.=<<___;
>> -       sltu    $at,$c_2,$t_1
>> -       $ADDU   $c_3,$t_2,$at
>> -       $ST     $c_2,$BNSZ($a0)
>> -+      sltu    $at,$c_3,$t_2
>> -+      $ADDU   $c_1,$at
>> -       mflo    ($t_1,$a_2,$a_0)
>> -       mfhi    ($t_2,$a_2,$a_0)
>> - ___
>> -diff --git a/test/bntest.c b/test/bntest.c
>> -index b58028a301..bab34ba54b 100644
>> ---- a/test/bntest.c
>> -+++ b/test/bntest.c
>> -@@ -627,6 +627,51 @@ static int test_modexp_mont5(void)
>> -     if (!TEST_BN_eq(c, d))
>> -         goto err;
>> -
>> -+    /*
>> -+     * Regression test for overflow bug in bn_sqr_comba4/8 for
>> -+     * mips-linux-gnu and mipsel-linux-gnu 32bit targets.
>> -+     */
>> -+    {
>> -+        static const char *ehex[] = {
>> -+            "95564994a96c45954227b845a1e99cb939d5a1da99ee91acc962396ae999a9ee",
>> -+            "38603790448f2f7694c242a875f0cad0aae658eba085f312d2febbbd128dd2b5",
>> -+            "8f7d1149f03724215d704344d0d62c587ae3c5939cba4b9b5f3dc5e8e911ef9a",
>> -+            "5ce1a5a749a4989d0d8368f6e1f8cdf3a362a6c97fb02047ff152b480a4ad985",
>> -+            "2d45efdf0770542992afca6a0590d52930434bba96017afbc9f99e112950a8b1",
>> -+            "a359473ec376f329bdae6a19f503be6d4be7393c4e43468831234e27e3838680",
>> -+            "b949390d2e416a3f9759e5349ab4c253f6f29f819a6fe4cbfd27ada34903300e",
>> -+            "da021f62839f5878a36f1bc3085375b00fd5fa3e68d316c0fdace87a97558465",
>> -+            NULL};
>> -+        static const char *phex[] = {
>> -+            "f95dc0f980fbd22e90caa5a387cc4a369f3f830d50dd321c40db8c09a7e1a241",
>> -+            "a536e096622d3280c0c1ba849c1f4a79bf490f60006d081e8cf69960189f0d31",
>> -+            "2cd9e17073a3fba7881b21474a13b334116cb2f5dbf3189a6de3515d0840f053",
>> -+            "c776d3982d391b6d04d642dda5cc6d1640174c09875addb70595658f89efb439",
>> -+            "dc6fbd55f903aadd307982d3f659207f265e1ec6271b274521b7a5e28e8fd7a5",
>> -+            "5df089292820477802a43cf5b6b94e999e8c9944ddebb0d0e95a60f88cb7e813",
>> -+            "ba110d20e1024774107dd02949031864923b3cb8c3f7250d6d1287b0a40db6a4",
>> -+            "7bd5a469518eb65aa207ddc47d8c6e5fc8e0c105be8fc1d4b57b2e27540471d5",
>> -+            NULL};
>> -+        static const char *mhex[] = {
>> -+            "fef15d5ce4625f1bccfbba49fc8439c72bf8202af039a2259678941b60bb4a8f",
>> -+            "2987e965d58fd8cf86a856674d519763d0e1211cc9f8596971050d56d9b35db3",
>> -+            "785866cfbca17cfdbed6060be3629d894f924a89fdc1efc624f80d41a22f1900",
>> -+            "9503fcc3824ef62ccb9208430c26f2d8ceb2c63488ec4c07437aa4c96c43dd8b",
>> -+            "9289ed00a712ff66ee195dc71f5e4ead02172b63c543d69baf495f5fd63ba7bc",
>> -+            "c633bd309c016e37736da92129d0b053d4ab28d21ad7d8b6fab2a8bbdc8ee647",
>> -+            "d2fbcf2cf426cf892e6f5639e0252993965dfb73ccd277407014ea784aaa280c",
>> -+            "b7b03972bc8b0baa72360bdb44b82415b86b2f260f877791cd33ba8f2d65229b",
>> -+            NULL};
>> -+
>> -+        if (!TEST_true(parse_bigBN(&e, ehex))
>> -+                || !TEST_true(parse_bigBN(&p, phex))
>> -+                || !TEST_true(parse_bigBN(&m, mhex))
>> -+                || !TEST_true(BN_mod_exp_mont_consttime(d, e, p, m, ctx, NULL))
>> -+                || !TEST_true(BN_mod_exp_simple(a, e, p, m, ctx))
>> -+                || !TEST_BN_eq(a, d))
>> -+            goto err;
>> -+    }
>> -+
>> -     /* Zero input */
>> -     if (!TEST_true(BN_bntest_rand(p, 1024, 0, 0)))
>> -         goto err;
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
>> similarity index 98%
>> rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
>> rename to meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
>> index 24466e11b1..de6eafbcfe 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
>> @@ -18,14 +18,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>>              file://afalg.patch \
>>              file://reproducible.patch \
>>              file://reproducibility.patch \
>> -           file://CVE-2021-4160.patch \
>>              "
>>
>>   SRC_URI_append_class-nativesdk = " \
>>              file://environment.d-openssl.sh \
>>              "
>>
>> -SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
>> +SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
>>
>>   inherit lib_package multilib_header multilib_script ptest
>>   MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163359): https://lists.openembedded.org/g/openembedded-core/message/163359
>> Mute This Topic: https://lists.openembedded.org/mt/89825642/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


-- 
# Randy MacLeod
# Wind River Linux


