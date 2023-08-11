Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D386EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 16:42:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.47776.1691772147032912243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 09:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OO0rW3xC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7587b24ba7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37BEhdE2012007
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 09:42:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=vBubsawKE4+EFJ+u+xF
	rH0ewi6rugxzOpLIjJlUZtPQ=; b=OO0rW3xCZKPvsyitu6+4gznAYivHjAsgZy9
	EKAk2diz2eibYHTSSOhFJXvjNj/qPvVxwk86wpKlPqMh/1/VMKhtk5lDFa8i/U2U
	9XN3cofKSFwAgv4kboL4z5M1BuPiBKTZDfoAdy599JB0FSqWQ1q6jZPdJ3q9EKrx
	gQNyBmuQpiqsGQemKpmfOdC10E8v2eop2922Srha8Ej+3M30D84uQHI8QKAH7psc
	w7V8clstkASPcYc9ybKLQMyyUdsOktTDi76m0ANIGgJ2fayDo0G5M/IQz19nr87F
	U/aDLfaRZ5D5jdnps2dC7feZdubkQCtWwX1Y1aMCgVCRUKJy0BA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sd91ygq78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 09:42:26 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37BGgPLS030941
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 09:42:25 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sd91ygq76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icViLOhh0Je5GUm43kEi85VPK+pPNla6kMnHQnyCSCSTSrxMB3PsQqMUc2dE86n7P10e926XurgD3Y1sXaYYEnDMbORzeeSjutzLKZISiWOkT0pca+U036zEKW0St57XsfFHp0sSa5A8bi+p4gioPS+bp6jD4teXzFoPULtAutLnsq5ZGYfXvn4fjQWNjEFULnuEhOWYdCYDJW1fyPilZ+2UegHUFJi9+IRNx7CVXT0OSLS4DLnvJHzfB5W6EnyXfVCw6N0MhMuCaMQzGUmXZSnXAh0+RXeVaBQit2+3jW2jxX9g9Q+7Qt819CVIjUbi1AS2u+hpDez6mbakl4d6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBubsawKE4+EFJ+u+xFrH0ewi6rugxzOpLIjJlUZtPQ=;
 b=kSqiDE/sbn6ydh2f3c4HWgg0ayP8wWp6UWMj78ggb6Sh1OQw3SiAdWOxy6oMsBkgaMzBpZXqdxlZf0Senxfi4YCcBKj6HF9KSDW0hLbqs2DTYaGSqwz0Tf/TajwrjfoifMue13c8qFvHlTWDoMluVqrKe5/XqupWDdjbzjHwYdF4hgnTjXf1FVxeDY4W68PxSISXjP5bLVD7mDS6OGC6bJlBptem8VvgfiO9P6QLV4J/MGAFVpBeOMq7w+iJe9PxQLiu3tpk6n07rbE0i34FKqvQl23MkTTt4GxtEENdBaeyhkoxQ0E/kkFr1mxUcq9h0IH5T2G9J3gSHlFNRTIqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
 by MN0PR11MB6253.namprd11.prod.outlook.com (2603:10b6:208:3c6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 16:42:21 +0000
Received: from MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::c14a:e618:3f7c:ea1a]) by MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::c14a:e618:3f7c:ea1a%7]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 16:42:20 +0000
Content-Type: multipart/alternative;
 boundary="------------bV8Y6uGEy8T1S6HC4sEASRcv"
Message-ID: <3187f839-36f2-d226-2478-a6810ade6671@windriver.com>
Date: Fri, 11 Aug 2023 12:42:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][mickledore][PATCH 1/1] python3-pygments: upgrade 2.14.0
 -> 2.15.1
Content-Language: en-CA
To: narpat.mali@windriver.com, openembedded-core@lists.openembedded.org,
        Tim Orling <tim.orling@konsulko.com>,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20230808083242.3788723-1-narpat.mali@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230808083242.3788723-1-narpat.mali@windriver.com>
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To MN2PR11MB3998.namprd11.prod.outlook.com
 (2603:10b6:208:137::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3998:EE_|MN0PR11MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 8845c77d-9a59-4ba5-b037-08db9a89ee7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7woXz/inL7DdkO2TQZ7dcoLEpn/IZ/mSd1gBDVIExOcM6Eb0gA4Gvj1HVG+a0b9gJAl9+iwtPZ/+uokXGtb1bWfHui2A5mu90shsDfuOASnXsEkWt4q+eib9OMO1PEB2TAh8VlkCDzAJ2A8lACgUyWRuHjWHpF7r10YH0iQ40OGV4JnOsiH2HmUTt+Od4UGdirrNmLgM8VEQOPAnopigdk1lFqE8bcT5ULUZEl2QG9frbt4NOadjOtRL0+RnMZOqObQU/U2WoXs0WyYgvEuf9Qw9A6iKJJK6FM3vvrMVeUzFhcXEJY7t/iJ/0IqUT4DGVfJK3VEFzilHTQQ6h0w8ADy8IgW6CsetWSFi9ek3B3E/xAY3mqLiyNe4PZZLou21TKFEd8iQ3tT1VulbzjraqY5ctTjlKKqcPNuUOQuY8LBw/sKr4tS3MyJD2rRPuEu730dYdC8khfcM7WSrm63CkZ6kPj/ldVCE15hcXerInz2WJreXT+1pL0yl8GNm3DpnZPTcZluk5Epi9/Mw/UWioU05iOvNiw8yv4WNMdCxq2lFo5fujoqCIfhPvWez94XQkVNHSr3NDGmK1q816viCBsZw3zgM3VF5ClUN1Zv4y2+0UT0xsZcP9e7Y7Ts7chDshuHMVs0NqBhFLD8iy3pdSlcHQ9u2T3DGFeQOQ8/9Cdk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39850400004)(396003)(136003)(346002)(186006)(451199021)(1800799006)(2616005)(316002)(66899021)(86362001)(478600001)(166002)(26005)(53546011)(6506007)(5660300002)(36756003)(6486002)(8676002)(8936002)(41300700001)(6666004)(6512007)(966005)(66476007)(2906002)(31686004)(66556008)(110136005)(33964004)(30864003)(83380400001)(66946007)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UG0xM0lpV0FZSmhDaUtQNFN3bS83Qm9ZSVcrbGdwWVhxdWFoTnhZUWNkR3gr?=
 =?utf-8?B?b3AvLy9sbmNNWEE4RFVrQ1ptQ1JXVUV2b241Q25hUkdvMFBGMEdqWEhXSjF6?=
 =?utf-8?B?dHVyVytibU0xNmtVZzl5UlM0cFFYaU1oMFIwZW9uQUViampEOTdDcy9Jd2lv?=
 =?utf-8?B?V3o1S21CWVFWQTUxZmw0aFo5UWxySDVnSzBMVmxqT2lQNkd0ZjNIWFZnb3F4?=
 =?utf-8?B?OSs4aUdSNDc1c1hZckhRRFg1NUtBWWE3bkN0bkYvbHl2dlJJeHdvRjBJbEJq?=
 =?utf-8?B?Y1VRS3U2RzhvbysxN2UyWGFraWdmOFAwOU9EcDRzbmZnSlEvcDhMUjB3bzJs?=
 =?utf-8?B?U3lCbXE1SHdhT0w2a3RMVlRvMlEyMFNpWXg5YU1HcHIrYXp3QzFoKzlZY1pY?=
 =?utf-8?B?ZHcvcEtUbSt5aWNkZ2gyQ2I1cUVNSDhXR3o3ZVZUaERlSUM0UXlFTlhLR05v?=
 =?utf-8?B?UTZiUXo2ZzgvbEJkSldLbHVPcjlXUWRlQkh2Q1F2STZmYWZMTzAvcURySktZ?=
 =?utf-8?B?YjVxWlNTbmp2UlhLalhzWTZuKzZ2RVovaHpTakV1Rkx4N21Yb24zQ2xxaUxM?=
 =?utf-8?B?UGhIRjlSdHJJOWtPQ0kxTmo0U0ZmZjk0RnNiRnA1NWtpNnF2KzE2TktVcXBL?=
 =?utf-8?B?WXgyK3I0ZUl6amQxWTM0WlgvWlVrT2dGMlhvZEViUnRzNERxOXc4ZVU4M2gz?=
 =?utf-8?B?RmtnR0RndnpKM2ZBOVBHdVRWZUtwV0oxdk1nbVU0aU8zbi9rbEJ3Umo4UTVV?=
 =?utf-8?B?bkkyR1llNDBwTVVobjI5aHVwRlRSVjJCYjBTa3pPdVBnYVRyZkN3bFQ0cmVP?=
 =?utf-8?B?UEtHYVdlSWJJS29TeXdRRHlpaTUwcXFFR2NnWFRQeFRsaXZ3Z0VGeTI4cm5r?=
 =?utf-8?B?RmNnTzB2SmF1NVkxOEQrT2VXUUxJUEp5S2IzODFMdTRiTzdqbjJaSnY0Skxo?=
 =?utf-8?B?UmZRSG9RTlJXRUZQRTZzNG9kV1NuK0N3VzlQZ0dlbHRrWi9QakNsc3NoaTZE?=
 =?utf-8?B?b1FTQ0lBQm1yb1hLcWxvMmt4N3NrOVJncWNGQ0I5c2dSaVdRRGYyWEgycnNZ?=
 =?utf-8?B?UXVDSVdDTnlVRS9GRUxCYm03VnFmajFZcTVEd2w0ZyswbkVQSGMvTWdSYWY5?=
 =?utf-8?B?ZzVnOWx5Nk5VbFh6c1h1cmthKzJpWHM2UTM0cWVhZmpVTHJRVzdWNE9KaG03?=
 =?utf-8?B?V3ppZi9sTStGNitPT3R6RDZYZnNxSEhDSlhDY2dTbUhIWTlsbzQxNkFIaCt5?=
 =?utf-8?B?L21hMWJzRU03UTBNTEw1MXBOSHoyVDdqb1FacTNCNnVDVFdsOFFnTnYyNjY1?=
 =?utf-8?B?SUoycHZPL1BseEEvQ3dxeHlHTXFybnBDSnhEMVdvdXIyQjBQRUpidjZPbTYv?=
 =?utf-8?B?aXlCTHdFNTUyNGxBcVJGWjRrYmN1VGc3bzF5ODFiN244QitRbXFwMW53b3Vn?=
 =?utf-8?B?cWREZ2ZMM0JFUUovRzA2L05ma2VaN1BlN0dSQnR2ZmFVYWt0SjVodHRpQXov?=
 =?utf-8?B?WWExUzBXOXYyRnU0bEdrS1o5c2VtbWQ2S0x6K0FlaHhvSnlyVG9wUmphRzdy?=
 =?utf-8?B?WDRsRFdNa2RINEgxclZiMUxJMDg3TXI3dWlLT1paRExremFGeGdXTUZ0N3Vr?=
 =?utf-8?B?V1c3ZnVIVm5UbWpYYzVkMjhJUGIrL3RPcTRPVXhRMzM3SzhaMjdKeVhzYkQ5?=
 =?utf-8?B?VVZLbG9TNnowZVgwc3NwZHhJSE1lTGs2QVpCQUxnaHJpNlBZYTVicFZkQ093?=
 =?utf-8?B?TEpEd3Vkcmg3SWdxQjNJdy8rVXNPRlo2S2tkazZrZGhVSWU2c2Y4WFZHMEow?=
 =?utf-8?B?bUN0dDZaQjh2eUh1bmVlOXNOQmtVMkFaV3NQWjlWb1g3WHNQTDBXMnA0S1hi?=
 =?utf-8?B?RmJsV1JSSGRZSXVlOXMyek1aR04waUVxM3RXMzdMT2x2c1ZscFlYb3NaMS9Q?=
 =?utf-8?B?dlpjSVJPMGFac1ZKaDRzNDJPNDkvUEdBYVBPUERPSmJHZ2FBZE1BRWRiZ25m?=
 =?utf-8?B?SWI2S254UG5oQ2Q5eUdnZHU0dWtlN2crUng2MjlNTlY5d0k5V2NYT2VHdmM4?=
 =?utf-8?B?VTJPWjRTL3M5MkZlM3dZdGd4NmRwSU50Z0VJdEFUV3I1SG85eWU3ZWwwN3U0?=
 =?utf-8?B?aHoraWxMR3gyek85Zkw3SzZsSEh0ME1SRjRTK1czRkxWVzRZWHBFVjdGK1d4?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8845c77d-9a59-4ba5-b037-08db9a89ee7c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 16:42:20.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wCYaeY4NZyrBP8Js592cJd7MxbQpPNaaM58pLRgrZq3B2sx4OXjIObCcO4HRjEJuPCtPNyF/Y3GLvpfVL3F5u0zTnYqPbSS22QXDIQV6r0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6253
X-Proofpoint-ORIG-GUID: 7qc7uhK2nKGItgXss_OR0Tybvft0JO3w
X-Proofpoint-GUID: 68pYBelQCf496q4v8AaZX8I36hMpwZlM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_08,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308110154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 16:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185850

--------------bV8Y6uGEy8T1S6HC4sEASRcv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37BEhdE2012007

Narpat,

I don't see this in Steve's test branch:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable%2F=
mickledore-nut&qt=3Dgrep&q=3Dpygments

which is good since for mickledore, I think that you need backport only=20
the fix commits
because 2.15.1=C2=A0 has added features and build related changes. I'm no=
t=20
using pygments
so I've CCed Tim to ask him to confirm that this is the right approach.

I think that since we've worked on chromium and maybe vim together, and=20
seen my
suggest an upgrade rather than a commit backport for dmidecode, you are
under the mistaken impression that it's generally acceptable. It's not.


Also you asked about kirkstone privately, so I'll quote that here:
 =C2=A0=C2=A0 "the current version of python3-pygments is 2.11.2 in LTS22=
 and
 =C2=A0=C2=A0=C2=A0 have tried back-porting these above fixes but, the so=
urce files
 =C2=A0=C2=A0=C2=A0 have been changed a lot and I am unable to back-port =
these.
 =C2=A0=C2=A0=C2=A0 So, upgrading this current version 2.11.2 -> 2.15.1 w=
ould be=20
acceptable or not ? "

Here as well, the answer is no, we need you to backport the fixes. If=20
it's simply not
practical to fix a CVE, in rare cases, you could tag the CVE with=20
something like:

meta/recipes-devtools/flex/flex_2.6.4.bb:CVE_STATUS[CVE-2019-6293] =3D=20
"upstream-wontfix:
or =3D "backporting-not-sensible"

but that's a last resort and others may rightfully object to that=20
conclusion.




On 2023-08-08 04:32, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali<narpat.mali@windriver.com>
>
> * Upstream has dropped setup.py
> * Inherit python_setuptools_build_meta instead of setuptools3
> * Add self as maintainer, as this is a dependency for python3-sphinx
>
> Adds some new lexers, updates a few others. A handful of bug fixes.
>
> https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L6
> https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L18
>
> Have cherry-picked the upgrade commit from upstream/master:
> https://git.openembedded.org/openembedded-core/commit/?id=3D22e2569ae48=
43071b2b48d026ca4742351baf6d1
It's good that you amended the commit log to show where the work
came from. It seems that you dropped these two SOB lines:

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>

I'd keep them since it's part of the upstream commit.


>
> Signed-off-by: Narpat Mali<narpat.mali@windriver.com>
> ---
>   meta/conf/distro/include/maintainers.inc                      | 2 +-
>   ...{python3-pygments_2.14.0.bb =3D> python3-pygments_2.15.1.bb} | 4 +=
+--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb =3D> =
python3-pygments_2.15.1.bb} (76%)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distr=
o/include/maintainers.inc
> index 07498a23a9..c9d790ca32 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -666,7 +666,7 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 =3D "Tim Orling=
<tim.orling@konsulko.com>"
>   RECIPE_MAINTAINER:pn-python3-pycairo =3D "Zang Ruochen<zangruochen@lo=
ongson.cn>"
>   RECIPE_MAINTAINER:pn-python3-pycparser =3D "Tim Orling<tim.orling@kon=
sulko.com>"
>   RECIPE_MAINTAINER:pn-python3-pyelftools =3D "Joshua Watt<JPEWhacker@g=
mail.com>"
> -RECIPE_MAINTAINER:pn-python3-pygments =3D "Unassigned<unassigned@yocto=
project.org>"
> +RECIPE_MAINTAINER:pn-python3-pygments =3D "Tim Orling<tim.orling@konsu=
lko.com>"
This came from the cherry-pick but clearly you should CC Tim and=20
probably email

him first to see if he agrees on maintainership for the recipe in=20
mickledore.


../Randy


>   RECIPE_MAINTAINER:pn-python3-pygobject =3D "Zang Ruochen<zangruochen@=
loongson.cn>"
>   RECIPE_MAINTAINER:pn-python3-pyopenssl =3D "Tim Orling<tim.orling@kon=
sulko.com>"
>   RECIPE_MAINTAINER:pn-python3-pyparsing =3D "Unassigned<unassigned@yoc=
toproject.org>"
> diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/=
meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> similarity index 76%
> rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> index 16769e9263..e0e477100e 100644
> --- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> +++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE =3D"http://pygments.org/"
>   LICENSE =3D "BSD-2-Clause"
>   LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D36a13c90514e2899f1eba7f41c3=
ee592"
>  =20
> -inherit setuptools3
> -SRC_URI[sha256sum] =3D "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c=
078f094ddc476ae297"
> +inherit python_setuptools_build_meta
> +SRC_URI[sha256sum] =3D "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe98336=
6be1a21e171d12775c"
>  =20
>   DEPENDS +=3D "\
>               ${PYTHON_PN} \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185652):https://lists.openembedded.org/g/openembedd=
ed-core/message/185652
> Mute This Topic:https://lists.openembedded.org/mt/100618182/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------bV8Y6uGEy8T1S6HC4sEASRcv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Narpat, <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I don't see this in Steve's test
      branch:<br>
    </div>
    <div class="moz-cite-prefix">&nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable%2Fmickledore-nut&amp;qt=grep&amp;q=pygments">https://git.openembedded.org/openembedded-core-contrib/log/?h=stable%2Fmickledore-nut&amp;qt=grep&amp;q=pygments</a></div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">which is good since for mickledore, I
      think that you need backport only the fix commits <br>
      because 2.15.1&nbsp; has added features and build related changes. I'm
      not using pygments<br>
      so I've CCed Tim to ask him to confirm that this is the right
      approach.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I think that since we've worked on
      chromium and maybe vim together, and seen my<br>
      suggest an upgrade rather than a commit backport for dmidecode,
      you are<br>
      under the mistaken impression that it's generally acceptable. It's
      not.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Also you asked about kirkstone
      privately, so I'll quote that here:<br>
    </div>
    <div class="moz-cite-prefix">&nbsp;&nbsp; &quot;the current version of
      python3-pygments is 2.11.2 in LTS22 and <br>
      &nbsp;&nbsp;&nbsp; have tried back-porting these above fixes but, the source
      files <br>
      &nbsp;&nbsp;&nbsp; have been changed a lot and I am unable to back-port these. <br>
      &nbsp;&nbsp;&nbsp; So, upgrading this current version 2.11.2 -&gt; 2.15.1 would
      be acceptable or not ? &quot;</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Here as well, the answer is no, we need
      you to backport the fixes. If it's simply not<br>
      practical to fix a CVE, in rare cases, you could tag the CVE with
      something like:</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">meta/recipes-devtools/flex/flex_2.6.4.bb:CVE_STATUS[CVE-2019-6293]
      = &quot;upstream-wontfix:</div>
    <div class="moz-cite-prefix">or = &quot;backporting-not-sensible&quot;</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">but that's a last resort and others may
      rightfully object to that conclusion.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2023-08-08 04:32, Narpat Mali via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230808083242.3788723-1-narpat.mali@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Narpat Mali <a class="moz-txt-link-rfc2396E" href="mailto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a>

* Upstream has dropped setup.py
* Inherit python_setuptools_build_meta instead of setuptools3
* Add self as maintainer, as this is a dependency for python3-sphinx

Adds some new lexers, updates a few others. A handful of bug fixes.

<a class="moz-txt-link-freetext" href="https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L6">https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L6</a>
<a class="moz-txt-link-freetext" href="https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L18">https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L18</a>

Have cherry-picked the upgrade commit from upstream/master:
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=22e2569ae4843071b2b48d026ca4742351baf6d1">https://git.openembedded.org/openembedded-core/commit/?id=22e2569ae4843071b2b48d026ca4742351baf6d1</a></pre>
    </blockquote>
    It's good that you amended the commit log to show where the work<br>
    came from. It seems that you dropped these two SOB lines:<br>
    <br>
    &nbsp;&nbsp;&nbsp; Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:tim.orling@konsulko.com">&lt;tim.orling@konsulko.com&gt;</a><br>
    &nbsp;&nbsp;&nbsp; Signed-off-by: Richard Purdie
    <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
    <p>I'd keep them since it's part of the upstream commit.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230808083242.3788723-1-narpat.mali@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Narpat Mali <a class="moz-txt-link-rfc2396E" href="mailto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 ...{python3-pygments_2.14.0.bb =&gt; python3-pygments_2.15.1.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb =&gt; python3-pygments_2.15.1.bb} (76%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 07498a23a9..c9d790ca32 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -666,7 +666,7 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 = &quot;Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:tim.orling@konsulko.com">&lt;tim.orling@konsulko.com&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-python3-pycairo = &quot;Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangruochen@loongson.cn">&lt;zangruochen@loongson.cn&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-python3-pycparser = &quot;Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:tim.orling@konsulko.com">&lt;tim.orling@konsulko.com&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-python3-pyelftools = &quot;Joshua Watt <a class="moz-txt-link-rfc2396E" href="mailto:JPEWhacker@gmail.com">&lt;JPEWhacker@gmail.com&gt;</a>&quot;
-RECIPE_MAINTAINER:pn-python3-pygments = &quot;Unassigned <a class="moz-txt-link-rfc2396E" href="mailto:unassigned@yoctoproject.org">&lt;unassigned@yoctoproject.org&gt;</a>&quot;
+RECIPE_MAINTAINER:pn-python3-pygments = &quot;Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:tim.orling@konsulko.com">&lt;tim.orling@konsulko.com&gt;</a>&quot;</pre>
    </blockquote>
    This came from the cherry-pick but clearly you should CC Tim and
    probably email<br>
    <p>him first to see if he agrees on maintainership for the recipe in
      mickledore.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230808083242.3788723-1-narpat.mali@windriver.com">
      <pre class="moz-quote-pre" wrap="">
 RECIPE_MAINTAINER:pn-python3-pygobject = &quot;Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangruochen@loongson.cn">&lt;zangruochen@loongson.cn&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-python3-pyopenssl = &quot;Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:tim.orling@konsulko.com">&lt;tim.orling@konsulko.com&gt;</a>&quot;
 RECIPE_MAINTAINER:pn-python3-pyparsing = &quot;Unassigned <a class="moz-txt-link-rfc2396E" href="mailto:unassigned@yoctoproject.org">&lt;unassigned@yoctoproject.org&gt;</a>&quot;
diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
index 16769e9263..e0e477100e 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pygments.org/">&quot;http://pygments.org/&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592">&quot;file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592&quot;</a>
 
-inherit setuptools3
-SRC_URI[sha256sum] = &quot;b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297&quot;
+inherit python_setuptools_build_meta
+SRC_URI[sha256sum] = &quot;8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c&quot;
 
 DEPENDS += &quot;\
             ${PYTHON_PN} \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#185652): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/185652">https://lists.openembedded.org/g/openembedded-core/message/185652</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/100618182/3616765">https://lists.openembedded.org/mt/100618182/3616765</a>
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

--------------bV8Y6uGEy8T1S6HC4sEASRcv--

