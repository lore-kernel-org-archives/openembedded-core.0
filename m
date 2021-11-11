Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12773C4332F
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 09:58:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8612.1636624697251562511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 01:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CHqy7TRS;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6949a5142b=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AB8cUVH027291
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 01:58:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nVto4+zSz+CZGwt7aeveq07r+fYQSCHheQdbq9k+vOM=;
 b=CHqy7TRSuKzYqkT9kup43QhZbse4qbi2B8utlhCNCGqATT0RVE94/3r3VfPt+ILQf7I6
 lqmszca0ZczpLTfor5BxX8FbYlJHKsxEiPcfwphJnlF1BzCzOpr6PiAEfWLy/6ci/BId
 dzIv1+VFf95dzS0abd2RmUCETQd3u+ql4ViSlfgjGO9CdS+1p6ZRxHo3QyelCKRybH/o
 N/3YWUltREmhgqxMTvu9HPMGDPfpNpYzvXyxI1LxOnB1j1Z3DRBEWsueWo+vCnQIp7kh
 Er4OMNJFCfLSSH02vAz+eeSbeKokXvfk2niZiz5vamvXcFHMcdwoUt48g595H2MeELHy Jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c8dx910gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 01:58:16 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1AB9wGFE003982
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 01:58:16 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c8dx910ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Nov 2021 01:58:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6QpA0jqKEhGIvrA0QzL1LF1DVzYNTqbdX0Bu9JTpeH89dSQJkJiQIoVyoStvfHnThHJB1XYYyTEYHMxvK/Jw77ejhOI7SyuhnFVjg4ej8aazBxGJQk+j0urgSPT/FHOotUj/MP09/mwxnsNUNUlI87ZG8QTJxrwL6fAg3QggXGTYCTjttxtjRemB8h5kFAw6GmkLUPfwWLCz7kzHId+6iHptkm6RAlKmQxeL/t9ILWVIZnueb5S2hDXKa6HKvoZp3n7zPKGRkcjvKtCLM+o+3QA6SDpUy1gIIgp2oA9GRu8qtbNp/qx5SzaD15HYX1FESjges/edOm6j6ouePTvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVto4+zSz+CZGwt7aeveq07r+fYQSCHheQdbq9k+vOM=;
 b=DZb10x41Dy05F0OId4YMPWSzT9Ki9LDvXOMa+FRmOcn8O5CvesRCZUKH8Wd6xKAvXFk7FatmNmojYOqBmJPHiBuZ/3k+/7cJDu7ccIfKhmfmDuw5Gf5wWkryrEVdMEJ5daOY7Go7i+0rky1UN+cZiHQXrr+G8WjcF0hCLoI614VG2du/fUkjAfPeiYGv/SgeuSa2MCeO/NBaM6dZIbtHWF5IOERD1CIGsI0mmbXUCurGYXonrv98S+bvsT7FuM3vEm2+6C3dA5tKocIFg7j0MH20dqiqYQmPYcjYkMlEkmhWKGdXsQukcD+SRbzwz/EXszVvgkSbIaNDbYnFgeYhJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 09:58:14 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%6]) with mapi id 15.20.4649.015; Thu, 11 Nov 2021
 09:58:14 +0000
Subject: Re: [OE-core] [PATCH] convert-srcuri.py: remove extra spaces before
 backslash
To: Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org
References: <20211111034814.16625-1-kai.kang@windriver.com>
 <A219A85E-A0CE-4F41-A92D-094DEC90E3F1@0leil.net>
From: Kai <kai.kang@windriver.com>
Message-ID: <2aa4cdce-e6b6-0740-eabc-2afc06d7ee23@windriver.com>
Date: Thu, 11 Nov 2021 17:58:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <A219A85E-A0CE-4F41-A92D-094DEC90E3F1@0leil.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.162.156] (60.247.85.82) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend
 Transport; Thu, 11 Nov 2021 09:58:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e3e57da-9421-4acf-297f-08d9a4f9c726
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB55889B144C1837AFC909E7BA95949@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	am5KahxcSdw4+YC9JIlQotQu0HvXsXe8v3PUYxA+WdYboVwGKTmeS4AUI8JS1p7KsanqjEsw3dWz3NFnaOx+Vz/jTXnvpV7jM8wXpzOc+Mjaw8RJ9NwxfUwvarqFy8dEk7CP0T8xVPM0Z0GrnYNwAWP9VV5RkgkIpFnCKHWvhoj9hdx6yXkrYcfIqDUJKKUlUedYzR0oOfxV2C3BxUBuZP2Q1rOF+T92jDJvteL0UWKsj6u434PRrXNjr9fxSQ+/wJxDrnk05DOyGaQLHoQENbB6HXW0O4UNQKOieAB4Xw6wN8Bk9cxOn9k0ngJS0qzCV+Z6hc4jA7Dtbt05/9apI/zfHS2NPSm2vLjjcY3QjTlJ2OOR/8J2sdm5OaufuMYvXJeQY4zzA/4GQB/7ieDDwEwac6a16WmBh8b/QMhxer6rWUHXb+TueF8WNX3GIP86mklZMSBOaBleOeyqzkFIIZcWCAGENN1+xh7ivVrHigz1nln9YNGXXadMBRk9dXYErMzmz8MJyk/GXn5DyrGKmVXHSByz2Q1iXfi4qzYepbmXUINVuxgUx+BSQbkG0+qAG2+RlvigCCpfrSQ/pqJkOKVnaw+Him3DhZwLPH3evtpkL1zW7Lu4Z6FZVV+uapsyU1QzIWc/T51K4f0zxUhINZ4flQghmo0kWN7lNhwCiCyYKfXT4/Edv9Ck0Wfh5cdScZ7rWAWDgZXEIT3cm1GgQfupffzTzDk6gOlFEmzPl+r2WvFzrnhnD/uv6Ub01T28mKHfsDAaDgI9kPxykqjeA3PmBzjk7pJIogeF//oWPmk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6706004)(31686004)(316002)(6486002)(2906002)(86362001)(16576012)(31696002)(508600001)(8936002)(52116002)(66556008)(66476007)(186003)(8676002)(26005)(36756003)(53546011)(5660300002)(66946007)(6666004)(956004)(2616005)(38100700002)(38350700002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzZsNDRoZmxBOE1XcVdYT0NPdHA1ZVh0bzl1d0dvcGJpUHBqdUdLWFkzTlcr?=
 =?utf-8?B?OWFBdkM3MFF4dTNvQzNVUGJFRHVnTDJYelVta0NYSmFBTkVZMlJwTXlSTHJi?=
 =?utf-8?B?eEpZU2w1TEhkUFVXWU9ZTTFPbWtWSElIblFNUXBKVTE2d1lqSWZLWnp5cnRy?=
 =?utf-8?B?NDk0WFJsODJCYkdjSFRVRVBIUWRJdTJYZFhDSitsSHUvYm83b0g1dUdsUjFP?=
 =?utf-8?B?cFFQNHJKekFsYzdrb3MyaFNKaC9jemRLQzFPbU4rUkNyMFhuaEdVNzl5Nytm?=
 =?utf-8?B?VUx0RU4ranVydytsTDl6Ykt2NEhMS2UrcDM1Y1VleEYydTVQeFFqZk1EOWpL?=
 =?utf-8?B?RUw3S1VLZFdBVVp3TFdlbVpXSFErb0F4MGk1WjI2RmlieHNabXNTSTlvcTBH?=
 =?utf-8?B?WnVYTmhSbjh2RDFpdjFQb081dWs5WmVXQ0Ixa2VpMkFaSXZtZUpYT3FkekM0?=
 =?utf-8?B?T0x3M1Nab0RFNHRTNTdtRTdEYU5ndzYwbG1vK3Z0MmtTdHhmVmNtc1QzSmcw?=
 =?utf-8?B?Z2xVaVhLbFdVWmhud29BVHRBanNXdllzSFNuelVTcGMvUW5UZnByZUhaSjRS?=
 =?utf-8?B?eWFiUjl5VWh5SXpUOFRBUXRvdWtJZ2RWcnR1eFJSbTVKNkdxbXJBRW0wRkQ3?=
 =?utf-8?B?TldORUp4Z2tMQzhvUThoQnlhbWw1RTJTd0xrcUNwWHMxalhlSXpHNWNiN0cr?=
 =?utf-8?B?MmQyNnYrTXBjYnpPMFNyUEwyaUs3d2NzdDJpOGsyTG9XUm95UG9maHd5aGxm?=
 =?utf-8?B?b1RaZkhFMlpneEJJWE5pckpMUC8raWdJRTdRWUFzelUvUzBUYmdtdkdhdTRL?=
 =?utf-8?B?OE1JWUZ6TWRYMDVjajhKUTRJMUdlTVVVWjl6WTM5Mlllam1BVm5Wa1RzdjF6?=
 =?utf-8?B?TnFrS1hKUk1nK0Iwa01uNllDZDZycStZZjVYVGRuZUYrakhQMGJ2MDhjVHM0?=
 =?utf-8?B?SlcrTjYxY3Y1R2xZSVJiT21XL1QxcjNvWVRManJlWWVMS2htdFExSjEzUDh1?=
 =?utf-8?B?b3BPekUzaWhaMEc1dUtjcmt3bm1sRDFoV1JNVTc4aFFPVzlhbzc4ZzFtME1M?=
 =?utf-8?B?VzZqdnBlUVNEMGJYMWJJS2V2VmlYOWltQWNuQkVES0tjM3JybUhpNG9ncEw3?=
 =?utf-8?B?U0pwYjE5VnM1YlI3dS9Ea1pYbzJCa2MrNjZPUmN1cE83N0xYdldkUjFMWUpm?=
 =?utf-8?B?T3RReEFVODRlY2orUzJ1UWRXL1lxZTNQT1FqUEpCOHk3c1pqdXJUVEE3QmJZ?=
 =?utf-8?B?dlhWTUNKdWZQTUtKcTFpSlJMclVxb2crTzV4V2NZeUFtaHhCYXR1WlNHZXQ5?=
 =?utf-8?B?Q016U3YyVlUrdDMxS2M4akM3c29icUxGb3BwTlFMcE1NUVlMam1IL1VsQ09Z?=
 =?utf-8?B?T3ZRblAxbFI2TVFUekZzRG14MFZIMHl3UjgvUXlTU1pSS0l0ak5QcGRQc2Vm?=
 =?utf-8?B?cmdZMitJcUpyODFSVUI2VXc0YVJnYVh4N1hOaVA4Y3BOQWRRTlFMaFV5RmNq?=
 =?utf-8?B?S0h2dm1pM0lOb2prbVBoQUFJd1REQjBEWFo2UnV1OWc5ZytGOUlXVGEwWEpR?=
 =?utf-8?B?UzZrUVNTclk3ZEZFSHFWNEplRmtiMitDSkJDQVVoaklwcmw0QVEwQjN4ZnlC?=
 =?utf-8?B?REtVQ1lqLzM4UitZUVN0ZUlzYzBYVmNPZDVoaVFCb0d3UE9yTTN6c01lZFIv?=
 =?utf-8?B?MXd5TEJET2pFUm9JK0NCRzNwdEdLTFdXWUk2dWhJZ05TWGpObFlHdGhiZjNr?=
 =?utf-8?B?NDIxNjJDcHlFTURVY3lNVDRGQlEway9oQ0xDNm5WTUpNL2ZSL1ExVUpncys2?=
 =?utf-8?B?OHdmZ3NWcDllUklQZCsyMVhvcjFWeWtpRFJoL291bERUcnpGcnhhMTErekZt?=
 =?utf-8?B?L3VXV3hIYjBLYnFEUHowWXZkK1pJMEgzRkVPRENsUDNLdDE0SjV4alYxOTlz?=
 =?utf-8?B?cVVUcEsyelJtQnJyOVF5cU15OFZrbDZTZlExdmVpSVp4MmRwK01HQWswRzBI?=
 =?utf-8?B?KzYxenZIMFFDei82YnpXZVU0Qy9mWExMMzlPQVdBWGdTTGg3bElaUGJITldS?=
 =?utf-8?B?QVRVaFlGdFBKdUZ6S3g2Z1dsZjNDcVVHNGFZZUpmR1I4dUdrWGdBZitkSXNn?=
 =?utf-8?B?bVJzSmxWYUZWSGNJUVpPT3A5cWxLL2U1MVA4VXM5Z3lrWnFmbWFLZnJtYjUv?=
 =?utf-8?Q?2057kW5s1Y49YOwx4HS7GOI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e3e57da-9421-4acf-297f-08d9a4f9c726
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 09:58:14.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2/wYw1jpcKEAaiPePEUW2MXC2Uq4TfSa62k3e9hq1jygff2Zg3zV7Za2Os6oXz37lnvRcV77uFr9fZCKOxuANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
X-Proofpoint-ORIG-GUID: 3OMK--sSMJxbbTYVQUEGBV_Dhq7CyXk4
X-Proofpoint-GUID: JQgP1fJldJdevrN_2L2Yq9kfyQPqxM1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=824 priorityscore=1501 mlxscore=0
 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 09:58:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158151

On 11/11/21 4:40 PM, Quentin Schulz wrote:
> Hi Kai,
>
> On November 11, 2021 4:48:14 AM GMT+01:00, kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> There may be more than one spaces before backslash in SRC_URI. Strip
> There could technically be tabs too and the current code (even after your patch) does not seem to handle that (from the git context I see in your patch). Maybe a regex would be ok here, using \s* to match as many tabs and spaces as needed. Not sure we care that much but I wanted to raise this so it's known at least.

Thanks for comment. v2 sent.

Kai

>
> Thanks for the patch,
> Cheers
> Quentin
>
>> them otherwise it forges a malformed uri such as open-iscsi-user in
>> meta-openstack:
>>
>> SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> scripts/contrib/convert-srcuri.py | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/contrib/convert-srcuri.py b/scripts/contrib/convert-srcuri.py
>> index 5b362ea2e8..e7a97fdbd4 100755
>> --- a/scripts/contrib/convert-srcuri.py
>> +++ b/scripts/contrib/convert-srcuri.py
>> @@ -36,7 +36,7 @@ def processfile(fn):
>>                          if line.endswith('"\n'):
>>                              line = line.replace('"\n', ';branch=master"\n')
>>                          elif line.endswith(" \\\n"):
>> -                            line = line.replace(' \\\n', ';branch=master \\\n')
>> +                            line = line.replace(' \\\n', '').rstrip() + ';branch=master \\\n'
>>                          modified = True
>>                      if ("git://" in line or "gitsm://" in line) and "github.com" in line and "protocol=https" not in line and matchline(line):
>>                          if "protocol=git" in line:
>> @@ -44,7 +44,7 @@ def processfile(fn):
>>                          elif line.endswith('"\n'):
>>                              line = line.replace('"\n', ';protocol=https"\n')
>>                          elif line.endswith(" \\\n"):
>> -                            line = line.replace(' \\\n', ';protocol=https \\\n')
>> +                            line = line.replace(' \\\n', '').rstrip() + ';protocol=https \\\n'
>>                          modified = True
>>                      new_file.write(line)
>>          if modified:


-- 
Kai Kang
Wind River Linux


