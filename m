Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870A5C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 13:06:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.8005.1652447176386823363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eT8b9u/X;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2132ef7e69=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24DCqp32026699
	for <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=bwAiSXRlPifDWaGOzMYFK6CaGPt4t+o+YH4qNTYRi8M=;
 b=eT8b9u/Xg0/WW/LpIDR0z42V1a0RFANiWyAtZ3WZbnO7QEmtLJDAKYdSDH5vP+y2G1Hr
 SAkOEE6ejJqbV5Hgans5/jCvwamKs1Fa2FtP5fVmf/DXMRd8cpkBsQgA5zXJRPYwY7i5
 iOHbX1Gk7hEBMrzfpXlg6nwyiFlgcqCphq7ZVujjKtWQomrKYIC8KEBP9VrUhQrwM8ld
 dx0zSeIZfaTJC0etKOJPJIHqaGV8KjANzPTaARYNxjKW416uTOhOuIuYRusMSrJcTiy0
 jJ12rkAofW5bW3k1pfY3Rg9SD1rFToaetx6H5EgGRfBc/mVdB98vewxbg9FBeqwFD1W3 Qw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyyvu0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 13:06:15 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24DD6EMl024465
	for <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:06:14 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyyvu0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 May 2022 13:06:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVO6tald9bxcUcMIasL8PXcZpmKEjoGbKUJE9JP/rXS4n0kKPbjgB2jtTdbYd1vo/f6WDAbGYUJ15rIBZHDM1gWKLKD35dbNbzE7Uv6BI+H3BjEfDi/v0fCP1B2+oDT04nU+LJMykn5oTjccf4ycplRWplnpaYve0gR3BihzSx+jxjF2JpW++b0WGqbgmSmJxoOkBl5+7wyhuNqDw1xPzTNMlQyMeFVP/84DAVLwa2js+J9qAHLITxdVpcK0EiYGlSReJ7LWf+MBwFYfxG+nJYz8TgW5yY6Iob8DW2XcEA0qaNvofOQNzd6D98qG6kVbc05U1gDrXbLbHXSMPWXVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwAiSXRlPifDWaGOzMYFK6CaGPt4t+o+YH4qNTYRi8M=;
 b=Qb7rzTvtFAfVDTJSl3/9ZSZCakJ9F2wgQs5SCHkyZEw+fNZ2CVLABvPlnRmqWMScuP4Kl/ryhBWupeTjtd+WGR0RWm9WPri4nGJO8zbV03tVGkBUptVC1pc/slsnB5nmI2FSnGo6IwsNLwnjlqIF5UEN5hYegOml9lmsV9NniqRfoY40B5heZNr3WEyNklSBXJVzYCSYPgct2sgKK1K70killWBTnBBdI8QAKeIUxf6G+db7Ru9RoN+AfCGTeo6Q0kczT/2fqUzlBgcOxxq1UQOlBhrfMW/sNo01h2617GSCnj0vwLxRzz5e2e/vTTM/X7ftlvHglNPt74Mpb/CADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BYAPR11MB3429.namprd11.prod.outlook.com (2603:10b6:a03:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 13:06:12 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3%7]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 13:06:12 +0000
Content-Type: multipart/alternative;
 boundary="------------AiL2QRbTJhB01C9XBEgqklOq"
Message-ID: <aeb5d0a1-de07-9c3f-d539-e641fd9ded41@windriver.com>
Date: Fri, 13 May 2022 09:06:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
Content-Language: en-CA
To: Pgowda <pgowda.cve@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Randy MacLeod <rwmacleod@gmail.com>
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
 <20220502223054.3aa3ecd5@melee>
 <CALY4986U078AV7xgvpCr+Ev7sQDNW1RQymM=iPDgfN1-r29zuQ@mail.gmail.com>
 <CALY49869zPf6F8UELEue+9BvyToT=W=hGqSRtazXZW+zPO5c=A@mail.gmail.com>
 <215dded4d396c69a484a5404d07499b45af819d0.camel@linuxfoundation.org>
 <CALY4984taQDm3GRxcJBCzGgHAt8jUP6fj8bD7cRe1FmjLkVoUQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CALY4984taQDm3GRxcJBCzGgHAt8jUP6fj8bD7cRe1FmjLkVoUQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cf75e25-0206-463a-c796-08da34e15ad0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3429:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3429D1CEE859EF48CE046757F8CA9@BYAPR11MB3429.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G08r2Q37Lahc+DE+ZO52yBT6aTnUsmtjB0UjJijA34eA/9WSrZcMyE+lJvoV1kPWbZ5EDVq7+jdLFphim+/21XfxGhptX8kmF5ZEBlXcRtjiyDBvXe60GRkSnG8zqnKxPrrzMBe4NTu9Wnpvt2qRPL+q+/A1YhsZjTIUkqQjDuYwP+5AHFKkGWiDXFQzIL/8PeRsq+4JxCgCvRGXBz0MRce1TZzrTDfVaB8Tu79FREQMZ1ZcqiU9VbuPQJnUqnzdpdLxAdstbg3XUrtR5cQdgNYQJEpnq1bADq8n2GlyEUWy2N3pzmQQFw+X7io8a5cDJpOToBvcuCvArvCj/wJeFP7Tn28VN+roofZPpXxUk8pLwIm1q8K81/wyVlchNHHYusR2GYAJ/epZeIJvGvAyuE3KRpndquXR75mhKET5MfVW5sSBT9lYWyuLtUu1+ZLTLDZvO9QFK5eFOssqncwy5hlpi7IPQC6Tj6oHvRxxosNdtiuZn9k4Oiba3Xa+pzQwYj6eSUjtfKZpew/U4+4kJ8gcdc2YTGVb++s/O9LvAOFqJa74zwZ0u8BIJdp6TqVRg1hb1DsoRDxS0oy5Ea1DVbnyKzSuBMY3qUSq3Ug6OaAJDdWlbm4+pv7wWg753KXvdNfTlCThTs7rV2SKMY//8ckov9McZwqpArgPCfm/2h09FpbBue2oU6BgHheibbiEMCbId/Ow6UL8gHB7F3vrbbBtjbADzOmgEro3+i/NBvkpJUObMrLxvOpKhw2i1PIJI8lQrbmswRNuHpsvvXmuV4DRNaRN/mDwhhOyQFOkyl1nWOgAVCo73EVtMwEjX8vh5lxKMYgFCEBdbRKSAS/fO2WROuQEoRTKq5r7oNDvPP2ZznXRQP8TCa8cL+ILzFmtmM+A68uS2U/P/aRPkIyRSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(38100700002)(38350700002)(83380400001)(6512007)(6666004)(166002)(53546011)(6506007)(33964004)(26005)(66476007)(186003)(66556008)(4326008)(8676002)(66946007)(8936002)(2906002)(36756003)(5660300002)(31686004)(2616005)(966005)(6486002)(508600001)(54906003)(110136005)(31696002)(316002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWt6L00xL1F5S2hJTHE1MTcxL0VVeCs5V3hqdmowZUw4YjlBSi84NGxBNUZr?=
 =?utf-8?B?a3FaS2V0WkRtbmphdUlsKyt3N2hyaWNNaExvR240SGVaS1FZVGZzVTUweWFU?=
 =?utf-8?B?dzB6ei82SmhWdW40Vi9ZWUpFcXJuS2E3S2ZLN1RDWXdvdGZlSmVkMlhXbUJG?=
 =?utf-8?B?Z1hVbmFQdUdKV2dzNGxNYitjK1ZQeXRCSmdxNEZ3aWZVQ2NWTElKYlFheVdo?=
 =?utf-8?B?TWk5T0gzc3N3UmI2VGl1eEpocTRvN1JFcGdwRExCUmNCaXNQZDN0RlQ4azlZ?=
 =?utf-8?B?NkdIbHlEZUF2bmIrNkwyN3J5TUJrK2pTMjhGK3NqNFBPdXhNa1ZVMDlCMkFG?=
 =?utf-8?B?b2l4bnhlZnRxNHBmT2haYUlFLy9DY0RKc21RUjFtUDdMcHFvN0xvblFVS21K?=
 =?utf-8?B?V0FJTlJ6OXByQ2VXWW5BT2lEY1RYMGwwWThCS1dZWm1CbWF6K0VGTERGd3V3?=
 =?utf-8?B?bVo3ZzJjNDVld3RraWNFTmZOcmRmZ2ppV0k5U2tkVTZyelkzd2NMNTRqSy9z?=
 =?utf-8?B?SDhQYXFDRnd2akxIT213SU5Pc3U4TktaYVJuY1dPUGpvOEZqSFN0eG5kOStV?=
 =?utf-8?B?WG4rUTArcis0ZVFFTmFTYjJ0Z1VaZzViU1k5RmZ5ZnlIWHh6allYd1cvb2lr?=
 =?utf-8?B?Nm8vREkrb0xrT0IwOENuMmwxbUFta1pWcE5OaEFSMzF5KzBLeE1RdzlVVWJv?=
 =?utf-8?B?dFZEa3JiS0NpZWtjVjYrTW1DY3VPQXB3aUdERVlFS2Z0K3B0VEJoSjh6SlRG?=
 =?utf-8?B?cVJ0eXU1alU2Q1hFOUtxZXljM3Z5K2NXTWk2VUlCYmgwUkhTT1BnN2NJbHpj?=
 =?utf-8?B?Wm5MRG9xVFMwR282VytFWkhVRG5pZVNvVUFzaGxMZkVHV3VmbFVma3RhODI3?=
 =?utf-8?B?eHcrMjdicjRIUUJqOWowZ3h5NDBiYllEd05YYlJiS2h4Z0E2K1ZmUmVaY2Mr?=
 =?utf-8?B?dHNBL3ZqaUxPMWFnVHdOOXNjSUJKa0ZOcXdkd3g5OFB2WGExVnNTWURTdWVy?=
 =?utf-8?B?ZTNKNUZsM3NWUmkyOTFFQXpTVEo2TXZXZStxTW9Ib0duanBxcmlKek0yeS9T?=
 =?utf-8?B?WWJWdUQzeXpBMDRyS1ZRTGZ4VnhDdGEwMGhXMTZHSnNPRmphQ0hUUGM0SVBL?=
 =?utf-8?B?em9iaGE2bEtacEg5SUJMTGk0WTlRUTJuZUxBUmdrSlFBSnJDOHV0dVRBOXFt?=
 =?utf-8?B?QzVKaDNXd2oyQnlSU1p1ekhmMnlWRmhncnZqa0RHeU1iUTZTYUhnT0NRVWN3?=
 =?utf-8?B?NHBWbmdlUTYzUC9ZYWhQNE5LSUVLTmppcU50OUN5M2c0NklJakRxamF6QlN6?=
 =?utf-8?B?d3dTdWdTNHI2Q0kwRkNmMVRhMVZIYlFJREF1eVM3SndyYk8zNi9NOTdVSXJC?=
 =?utf-8?B?VXZDOXRjTzkxa0VmSVVseDVZMWdnZnI0REltSlRRV0kvWHpXS0NNU3ZsUDJN?=
 =?utf-8?B?cmZuTHBLUFRpOXlIUi9SZG4wcjJuSTdya3h4YkFuTnkzZlVkS21iWXZBYWpa?=
 =?utf-8?B?M2ozdkVhdE1TWUo4VEhjWXAxRFlVaTlOajZ1c2NNeUtPMURjaDd4ZDEvVG9o?=
 =?utf-8?B?RTdEQUVteEg1S3R5Tzc3blZqVDhsK1crVFJXaFNJM3RsY2I5VytKWmpWaE9N?=
 =?utf-8?B?YXYvL24zWThCNGJxS1B1RnNhRDZISGxrdGYzeG8yaENlL2ZWcmlOd0lrOUQ4?=
 =?utf-8?B?a2puQnJYQWtlemVtR0hYZTBKRUw5S1dkbzZvUktXd0p6emEveUwrcTRaRzNl?=
 =?utf-8?B?QmpVR25talRZeCs1UWVreXFuMWc1Y2g5T0VhcTJwbXUvZFYxRUZHOFFuZHAy?=
 =?utf-8?B?VGpWRWJRcDc4c2kxQkZOMFQ2ZDhrc2ZBSWFOa0xRNVIzcmZoMTBselE4enlN?=
 =?utf-8?B?WE1jY1lJQWlvODJLendJZUZhWXJGejZpdVI3clJ6Y1U0Q1Bibnk2OW1wcjJV?=
 =?utf-8?B?eStXMGUzczFvRWpyc1d5dU9qdVBYMlZ1c1hmelpZSkVQbEJ2aCtybXZzM1d6?=
 =?utf-8?B?dHp4Q3NlSS9IYnQ3UTRGTVUyb1QvZDQ1RE5GbDRRN09kdlF4RkIxODZNU1hW?=
 =?utf-8?B?NlNudmFIVnJHMGJ1LzhpOVBZZFM5R0pZM0ZsYkxPQlorbW4vaEJLbWhoVFIv?=
 =?utf-8?B?K3gyU1M3QWRaOEpuYnpqSE8yVG5PWUZrVTgrRjJjOWNlNVA4K1kwR1FCcnlH?=
 =?utf-8?B?L0pvQTJwcGFiZWZmK1c4Z1NsZDZ0bVZDNHpWWDNiSE9MU1Q2d29vNUR0bXlD?=
 =?utf-8?B?bHFJTm5IZy9wLzR5a0YzWnliT2RmaUZRelVBYWVnREt2ZWFXUWpycjdKMlFz?=
 =?utf-8?B?bTJaY0wwdmIwK3d2dlgvOWhCVGNxU0dFL05sYlJLbGVhTUN6czUxNW41QUFh?=
 =?utf-8?Q?7fAN+eEniT8DlLgc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6cf75e25-0206-463a-c796-08da34e15ad0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 13:06:12.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9xY8JD8vY2dQ/JMrq43PedtnuvY8JBwTqDd4Exb2bKeAT49m6LC2J4knydgKDzReOLIH2E7FPfjkzH+pr9VsACUaQJtPidSwKocj/KescCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3429
X-Proofpoint-GUID: _7eLpubcO3k_9ORPgnovudXpfsyVF83N
X-Proofpoint-ORIG-GUID: K8iF-haVtKlFjx5wkKb5GFmpQEcIe-Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_04,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:06:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165560

--------------AiL2QRbTJhB01C9XBEgqklOq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-05-13 08:56, Pgowda wrote:
> Hi Richard,
>
> Thanks for the confirmation.
>
>> What you really need is a way to replicate the failure. How did you
>> test this locally?
> I ran the complete Oe-selftest suite with the latest poky sources
> after applying the patch:-
> oe-selftest -a -t machine -t toolchain-system
>
> Can you please let me know if I have to export any specific
> environment to replicate the failure?

Please explain what changes you made to you local.conf
if any.

The only one that stands out to me in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100

is :

INHERIT += 'testimage'
but perhaps that's done automatically for:
oe-selftest -a -t machine -t toolchain-system


Also, what host distro did you use?
The failure happened on an alma distro: worker = alma8-ty-2https://almalinux.org/

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100

but that may also be incidental rather than required to see the error.

../Randy

>
> Thanks,
> Pgowda
>
> On Fri, May 13, 2022 at 6:15 PM<richard.purdie@linuxfoundation.org>  wrote:
>> On Fri, 2022-05-13 at 17:58 +0530, Pgowda wrote:
>>> Hi Luca,
>>>
>>> I have checked it again at my end and it seems to be working fine.
>>> The error is related to "setup NFS mount on target" and does not seem
>>> to be related to the patch.
>>> Can the patch be included again while running oe-selftest and checked?
>> No, it doesn't need to be checked again, it is breaking oe-selftest
>> when used to test target machine glibc.
>>
>> The change in in the glibc ptest recipe and the failure is in
>> "glibc.GlibcSelfTestSystemEmulated.test_glibc" i.e. in the glibc tests
>> so there is a clear connection between these two things.
>>
>> We need to work out why it breaks it and fix that. Running it again
>> doesn't help us at all.
>>
>> What you really need is a way to replicate the failure. How did you
>> test this locally?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165559):https://lists.openembedded.org/g/openembedded-core/message/165559
>> Mute This Topic:https://lists.openembedded.org/mt/90831085/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
# Randy MacLeod
# Wind River Linux

--------------AiL2QRbTJhB01C9XBEgqklOq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-05-13 08:56, Pgowda wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CALY4984taQDm3GRxcJBCzGgHAt8jUP6fj8bD7cRe1FmjLkVoUQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Richard,

Thanks for the confirmation.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">What you really need is a way to replicate the failure. How did you
test this locally?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I ran the complete Oe-selftest suite with the latest poky sources
after applying the patch:-
oe-selftest -a -t machine -t toolchain-system

Can you please let me know if I have to export any specific
environment to replicate the failure?</pre>
    </blockquote>
    <p>Please explain what changes you made to you local.conf<br>
      if any.</p>
    <p>The only one that stands out to me in:</p>
    <p><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100">https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100</a></p>
    <p>is :</p>
    <pre class="select-content log"><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="63"><span class="">  INHERIT += 'testimage'</span></span></div><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="63"><span class="">
</span></span></div><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="63"><span class="">but perhaps that's done automatically for:</span></span></div><div class="logline ng-scope"><span class="no-wrap log_o" data-linenumber-content="63"></span>  oe-selftest -a -t machine -t toolchain-system
<pre class="moz-quote-pre" wrap="">

Also, what host distro did you use?
The failure happened on an alma distro: worker = alma8-ty-2 <a class="moz-txt-link-freetext" href="https://almalinux.org/">https://almalinux.org/</a>

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100">https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100</a>

but that may also be incidental rather than required to see the error.

../Randy
</pre><span class="no-wrap log_o" data-linenumber-content="63"><span class=""></span></span></div></pre>
    <blockquote type="cite" cite="mid:CALY4984taQDm3GRxcJBCzGgHAt8jUP6fj8bD7cRe1FmjLkVoUQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Pgowda

On Fri, May 13, 2022 at 6:15 PM <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, 2022-05-13 at 17:58 +0530, Pgowda wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Luca,

I have checked it again at my end and it seems to be working fine.
The error is related to &quot;setup NFS mount on target&quot; and does not seem
to be related to the patch.
Can the patch be included again while running oe-selftest and checked?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No, it doesn't need to be checked again, it is breaking oe-selftest
when used to test target machine glibc.

The change in in the glibc ptest recipe and the failure is in
&quot;glibc.GlibcSelfTestSystemEmulated.test_glibc&quot; i.e. in the glibc tests
so there is a clear connection between these two things.

We need to work out why it breaks it and fix that. Running it again
doesn't help us at all.

What you really need is a way to replicate the failure. How did you
test this locally?

Cheers,

Richard


</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#165559): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/165559">https://lists.openembedded.org/g/openembedded-core/message/165559</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/90831085/3616765">https://lists.openembedded.org/mt/90831085/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------AiL2QRbTJhB01C9XBEgqklOq--

