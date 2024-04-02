Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EBAC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 07:15:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6804.1712042122902599791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 00:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hE8IlAMX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=482257f1d5=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43220dlD026214
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Apr 2024 07:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=0tOjSxEy9AohrbDRgBe
	LinOPTh/HiyxbVLd4Kv8wGVU=; b=hE8IlAMXXb0C01B9ZTjC2Zxc6u5o8fB1zof
	Sogo7AViASgf/PafSRMvzTLPSOr69chtWM0F51iQ6+Hd2QwvyiQx8DLW2xDMvlN7
	Sd0c3HmB0SghELgPBFwubHB92fun8DbWyhC0cnCWwbbEGqJQxfVPB2E6VWJmsQjx
	li0BoE+wVABUhu7yWmVBM+PKI4IVMncF0RtvIieV/rfO/mKWp4U/KmLOOBqy+ykz
	wboMH+ErzvS+FbQths6IM7oA2zOtP/39b/KqFGs72rxP+2REC5z6HIcTWRWeeZEV
	iftYEg3qQBS7Pvgh5WqivbWh/NeDE1qILsm4UcJuahyyqcZJdAg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x67xy2v1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 07:15:21 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4327FLdW023763;
	Tue, 2 Apr 2024 07:15:21 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x67xy2v1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 07:15:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geBNVmx+QRh2t8G/xjDXIgorQeUwR3lUIdPI8cgP8N3JNUZFVvSOyziu23sAH2ZRr6UzWq+tVVUIhRNalBeA0LQdCc3eY56xBbk+nFMzNaTpG26vHSVBUcv2kXoFzZzDQp6w5HayFQylXNFnMWn8q4MlqKCHThD35HaiTqfzDzaxBYVfCSmgWZy1CQPoXH+YVSHWk76NIi0c9FftfNUwE6pKZsk2zxZbP/94cwC/IGdYIDI7lzBErXHkz1x9V0taYTPSHjMUmJZdtOHeGlIY9ibjO096+yiRD2Va+/oultGXJ21tuLZSoTtFnNbxoSKrQaHlNdtMhecFqqoDHnzMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tOjSxEy9AohrbDRgBeLinOPTh/HiyxbVLd4Kv8wGVU=;
 b=SX/BwR9n5ypPd72Wn5tUhGecrTPo+ZPk2CsvDYZzreRjTEA5tx/fBv4OfjsAuJFPr0rxPnmKpOOCU9PW3QU+cTGLdV43vhyhDC/IeGdypFfrbLYHyH130C6HgSRNtsvKB3MGCOpnTkN9lH7zRqhDFDSTX74FNoCDdDfTGUl1qcrTWP3xyHwwgIHWPzu/itN1/1qWrdwcIskXs8AvIWsHQkiDCa1G0+F3i00a/gzR3+Hz8uzWuNcLZnc97RO5wC9pq1oABNu4fft0eV2dsVooSo6bPBOpBt8WpknHfCsWDez50X9jJPg14Wz3mr5ZkrfaQB3kHEpfjBGq+neKXiAVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 2 Apr
 2024 07:15:18 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 07:15:17 +0000
Content-Type: multipart/alternative;
 boundary="------------cslemTmidgk1lDRZvsaRbGM0"
Message-ID: <74eb50cf-730d-4627-bfb0-4e45877e6ee7@windriver.com>
Date: Tue, 2 Apr 2024 12:45:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Fix stale qemu processes left after
 glibc oe-selftest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240401081011.479084-1-Yash.Shinde@windriver.com>
 <CAMKF1spGJ_JjvgHezfhaEwuZHAmnyzK2vmWvqGps0AwOfbz2pg@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAMKF1spGJ_JjvgHezfhaEwuZHAmnyzK2vmWvqGps0AwOfbz2pg@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MW3PR11MB4571:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q621lS0jE7DoTCJFzF3eSnza/IoEYV+cwulD18e9urlCdLapGEj2B7MFLE4NZukrDcYZoq8pvI9J/BDkvtjY12+ORbFeeRe0iVlmvOeUePvweAndq2RvielgBCEiVBVSGYOsLy0BTLWc5Yy+8L65AGVq22b8O47Q7RNZJf3ISR4Ft80ajo7p4DKo5kVd5EcMod2kN7/BaTkHCSgPXB70bJjAYQx44Lz/PML2dcEVg159bmK9SK3HO4avmGb1XzamPBh3peiBJW2xbIy3mVwEDZ3+sVIaI5Iu3gg1ZgBq1nErHfgPOMQdhu1nOxfmdoqiIbi2Z4oaA0bDdwMUZPrcpxKBoVglnai9u/RjvXlTnZbyu+cEwu5tF6ya16ySq3bLgoyYLEvO4kLBZoQjwqloqjywGmzOw0Z8tKAH6/jKU+dBaySRQz6MGbVkyKm6O/1e72TsHsj6eDH/uhu9NZ0lxIWkwhUPn2XeTfn4zyt4lO4v8MBsOx1NoCH3/2TMsoxHLqa/ql3czYSlDFj9VNfXbndnsModbH0Ox2gFcpD5kyzVxmeaEjpNfToyFTRSz7JjkELnuMMWC1iGIqXyOitZ0qM0lFU6sIZIThVwcAcZPmrEPFqATt/dGEiMU9t32JsGxvS97f9vwR6P+rZaAZvLUlc22f7id8k0sdPkxiPLbwc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGhQRjR0bXNkVDJ3SXVjT2gzcm1nenBNT0xsWkZaRXNRTUNSMGl6R09xZFNp?=
 =?utf-8?B?NFUxQXpYSVdpYVpsQzdUMXEyZ1Jpb0RuL3UxS3Qxa3dCLzk3ZS9lRTJBdFNT?=
 =?utf-8?B?aEFJVTdZWTdFTGFYVmhLNjViTWdHVGVYblc4azVLY0laMDRYSjdjUkRLcGlQ?=
 =?utf-8?B?NmtDakRlSVR3a1hOdFd3VnoraDNnWkoyMVo4Y0ZmdmJTcE9aNm1TYm9RZnpR?=
 =?utf-8?B?cENyWmVhM1hGckJaTHBpWHZKZHlwUVRQN2ErTnlOMlFzTzRXdXYzd052cjJL?=
 =?utf-8?B?NGtsZEpvTEk1K2R1QkIzK3ZHajF3VzJwUlRZcmxFZnhaQ3NDZXI4aGUrN2E1?=
 =?utf-8?B?UzlQcTE4cFNudHRSby9xcnFVeU80LzRxZ2ZGdjBkZGd0RU1YRU53OTlvenVL?=
 =?utf-8?B?YWRLUlpTdkEzVmtXU3M3TURyemQyaVpjZzdFTnJ5TDhQbjBlNHpoejdoK2ph?=
 =?utf-8?B?UEN1VlJMbnhZRy9pa3Mxa3JtWmFVYzNQMEZlazd0bG5iaXVweXJ2Rm9tZnp4?=
 =?utf-8?B?d3kyb1M1RW5aTm9DNXU1ek9NL3o4c2tVOHcwYk9HMU54UUF3ZXJQMlJ1YlFB?=
 =?utf-8?B?ZjdVMS91elljQTJib1lKRndjSEM0TkMzWG01Z0RFSDc5SUNMbTIvRHVMckQ1?=
 =?utf-8?B?OVpoZWRVRlNDbE0zUFBZSEVJMmRiTjdBYjV1Y3BaUU9nSUNIYXdJWDJHQnZ0?=
 =?utf-8?B?SXFrY3E2NFYwOHBEcFJVVVNQaDRqYWpkdm1HS292am44U0V3WHRzUy80YXZ0?=
 =?utf-8?B?K3dISzd6MTZZOXVPZm9BWGVsci8vb0ZoeWFqWlZpeVp2RTZrdHZnUnpEbEk0?=
 =?utf-8?B?YkpxcUptRndyTHMxWDkyUFBXSDJjbGEwZjRhUHZXdlpPeGl5VlZuaFdVVFJw?=
 =?utf-8?B?QzkxZy9HaDQzZ3l0eU9tQXJ0ck9adGJ5VHVaSWRNRDdJUTBnSlhWbk9Vamx0?=
 =?utf-8?B?UGx2SklHOW5UTDk2TE1NVG5MbnpJRXR0U3Z6WU5VZUQ0NHVETW16M0ZPKzg5?=
 =?utf-8?B?YlVnWmdYWEVwdHV0V01McTUwY0xMQzB1NmxuMGJhY0gwQkd0eDk4K3IzeHRJ?=
 =?utf-8?B?amxNM1N5VG01cGZkODcxaEY1bnZVbE1pNmFOckp5b2NjMktUVjQzTjJobTJm?=
 =?utf-8?B?SFVpWWhIdGRMMmQ5aGxOa2pTeHByZy9HTWhobWs5bEpYT3hzbllwNzFGSlhu?=
 =?utf-8?B?cGhCOXhZeERvRFVjMTl3ckUwQ0ovOUc5ajloZ2daNmtYdUVON2UxQW1Vb1FL?=
 =?utf-8?B?emZXU0ZmMXI5c3gxS1N5Y0JkaUVvdjVTdVM1NmdZa2xKZy8wNGR0VjY0QWl5?=
 =?utf-8?B?SXdiUVNETmd3Zm1jajJhZEMvSE1PUm40a1JiN0M2NEZkdjVobkZoazhNRnAr?=
 =?utf-8?B?eFpmb2FFbnU3c2RaVUhFUnRsK0ZWY1hSaDFwbFFTY1l6WFJvbFNoSmVrWHMz?=
 =?utf-8?B?NjMyL3dSbURNK1JhOHJ5eG11aWRocUkrL2JIekczclBwZldVUUdvb2gzKzU0?=
 =?utf-8?B?UGMxaSt4Mm9MdUtsVSttaUdxS1UrSUgyeENVMkZQVW1sRGU1YmpBMlBVbHA5?=
 =?utf-8?B?VW5oOEdQYzZaR0oyWDdFQ0VnWFNmcERvK01Wcno0dkx0TDYrL0FaVmhObk1V?=
 =?utf-8?B?MGlSUWFoNGFmR3VPb0NWNW1CMVQvMkF3U0VLckhoSjFSQVJhRzdRY2MxZjVM?=
 =?utf-8?B?SzlnVXFCUGpqYmM5aERwb2xtWENyWFdJUUN2VGZnN3BwTEZrNGNvbkFQdXp4?=
 =?utf-8?B?T0psVFkxNEhaVjhDTllKNzZoSUNQY3BUT2dMYzd6c0tSYnBhZDRkWmRMUHZv?=
 =?utf-8?B?Vk0zd1RWRk9Ybk92ZkhRMkY4OFpQc0VTeG1ZTDJKMEVxb3VyaENuNGJLTEpB?=
 =?utf-8?B?T0FLOUYrV1RMTjk0T2VkZ0g1VTlDbFBqNWR6S3N4ZmI3OCtEeWlIRnhoenpS?=
 =?utf-8?B?clYrQlNIR3d4VEZjQTZsVHhIMzBQeXN3S0J5OFYrdnFrRzhXd0JHVWRSdGM2?=
 =?utf-8?B?SXVJd1I0Q1Mwdy9jRUFzK2k1YjNHMkJzb0FJeWVqR1ArSExiSWtRMmlDUVp3?=
 =?utf-8?B?Wi9TbTBXNFVyaisvV1A5REUzRVByekhGWVVhVGtKMk9RWlRlM1JCVTVLRTZI?=
 =?utf-8?B?OVlicUFNM3p3RFVLV2ZzMncrNFIrb0lrQTN5TzczMjVoQnZJaWRNWDNuVnZW?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c88437c-8714-499d-f13f-08dc52e4a616
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 07:15:17.6383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koCXArOU4PfOSBQnWjvswFjLxDSSNjTQWvc72n2ZrkHaRtPFGLf200MbWalCGP9bzpoI1MDZFub6JhfGRpuary4PLVhu6253UxdCxxK6WWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-Proofpoint-GUID: XG5U8E3Ynr6hAYNtjh8Y4uI5RDXsWLJx
X-Proofpoint-ORIG-GUID: 0LkDsqn7Sv8CPjb9ubyq0_AE2NWbbXsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_02,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=918 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 07:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197867

--------------cslemTmidgk1lDRZvsaRbGM0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 02-04-2024 01:28, Khem Raj wrote:
> it would be better to disable them just for architectures where it
> fails since it seems to be a workaround, it would be good to keep it
> as small as possible
>
Initially, we implemented the changes to handle only for architectures 
where it fails and reviewed it with Richard in a meeting,
but it was decided to skip the test cases rather than doing hard-coded 
changes.

Regards,
Yash
--------------cslemTmidgk1lDRZvsaRbGM0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02-04-2024 01:28, Khem Raj wrote:</div>
    <blockquote type="cite" cite="mid:CAMKF1spGJ_JjvgHezfhaEwuZHAmnyzK2vmWvqGps0AwOfbz2pg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">it would be better to disable them just for architectures where it
fails since it seems to be a workaround, it would be good to keep it
as small as possible

</pre>
    </blockquote>
    <span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">Initially, we implemented the changes to handle only
        for architectures where it fails and reviewed it with Richard in
        a meeting,<br>
        but it was decided to skip the test cases rather than doing
        hard-coded changes.<br>
        <br>
        Regards,<br>
        Yash<br>
      </span></span>
  </body>
</html>

--------------cslemTmidgk1lDRZvsaRbGM0--

