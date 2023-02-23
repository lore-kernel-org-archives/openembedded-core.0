Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D676CC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 18:55:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19984.1677178541668366170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 10:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ff/TRJje;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1418931e81=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NBfYv0031464
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 10:55:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=laMMOJBXoZOMC/FgHZhfJcLWCBkDSyVxSRVdQ3wHfJo=;
 b=ff/TRJjeUC0PSgkJqLUvG91pID3guPTZlqCym/h2oqR23raIMuuoVC3jc/65juxBkcB8
 xW58J35qQfhUwUHblSbRnwRor6wq1y3BvScap86FwN9WTsAsIKymhfer8hk/Fj+TiKJ1
 HVgg5/9uxS1ol9HhBQKCPL0irmaw8q44b9Em7x9xjv2HWk7M21oGPhgrJ4F+BzhJSbbr
 kacM9gpKxzRhuo5sZDpftTq/YT35WgTpo2kLOn4iqWPPIZ1Lv3/6E7OVAr3GJrEwF5Gg
 Ps8BM+0lx9j2o3mpYMT6E0MrpHYynpwubiBDPFZebvsv8CkUpCibap5kS9uUQwVZ7ZFS 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6w17y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 10:55:41 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31NIteHL019934
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 10:55:40 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6w17x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 10:55:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oxmyuj52hBv7Uj2OcqsLlbPwQdUdiQ+iO+v+6v/oeKhwUNGD3ma7g1pyu03Bi0yLTlYLNHKxnT0Fj6WGM8z3XcL6xRxx2p0ZOrTZPxrQk/uZ3Cid3c+FRdwhq4MZfbhuMe77y/szaT34bdPyr2jFsHDb4lN6R3nJpNPIV+FhiJBocGJoHSN8P7MoCAinyuGNfLVivb7NXgu2hgLArJqmwfGjTNGSuAZp5076c7SyJIgz7RMHKcubDlN0uR4CscF+Kv53hPl+83jyQ4bOt5uqv0P+wG133gE7fwB6w+sdUR0PKPG6GKK+XTG0aOMmph0kekhtMi2woGf8zdoFJ/nIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laMMOJBXoZOMC/FgHZhfJcLWCBkDSyVxSRVdQ3wHfJo=;
 b=ey8Un354aY54CWWK/ud0j+iX+ioG4w+WyI7xKOJbHZrZlA2RWQKDcUNvJ5MpIE+dsWgNEvhpj6l9XH4U0uSgwkx0Ql6cJwPf9FRceyLcmbTqpUQn/lK7qzBIwdfi5H1ocdOvxkIcicMpnrwwGAU6tTPfZlDZgLKKcveok+FhsDnJ/uf3DTUJQLpCQ2Pdd1SvvLrnjeRbFhuiK0gSH/mFuUcgF3rqjd9iBZghoezTKWsZ41PGmdhoUk1fe92tZwkgloxapICB0lO4FxBSQCMpfEgrFFnXZW24aJnW8MrvYGtzfzPifh75+jZ/1z8yXLPLg6ggAqa7qSLwDPsNbMY0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Thu, 23 Feb 2023 18:55:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6111.021; Thu, 23 Feb 2023
 18:55:37 +0000
Content-Type: multipart/alternative;
 boundary="------------TQRUg5V3l5lbS6X6mLzEjZUd"
Message-ID: <18d49c01-cafe-aef9-4bbc-9ab97ec067e3@windriver.com>
Date: Thu, 23 Feb 2023 13:55:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH v12] Rust Oe-Selftest implementation
Content-Language: en-CA
To: pgowda.cve@gmail.com, openembedded-core@lists.openembedded.org,
        "Gowda, Naveen" <naveen.gowda@windriver.com>
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
        vinay.m.engg@gmail.com, "Shinde, Yash" <yash.shinde@windriver.com>
References: <20230223063624.2226016-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230223063624.2226016-1-pgowda.cve@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 2378f546-dc1d-47ed-5193-08db15cf8d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ah9IFtU2k4l632Y5ERqiGMYkIpTZvFvmorr7PkA4NuviAddJM1YOMnDd0C2cahthf/Lcpha/MAblT3sPzXqvAmMPU5wjYjAXqUS9UGrHK5z/e4lwmtLQvmZqDPGPqXaJCDd8bgJJVjTToq7sxKa9EoUfFiIfBbeVrRs10cdR8P3IXop+ZIZ2HTiNRi5XzJSz6aDloJIbJy8f5i8RpBmY/9l/nKkkO71eTw01um+EIiidUwov5bOVi8lNsZTtKnyjMYFcnyW1a0WzVFgUIazIL/KTtC9Y3fcxVlCsMIRJPOtrCICNXIy5U7ZhMgkspE5PFc0Sz11SwQ3+YrAB6w9l7X4ux4S4adyZ0ZL2Ea7fjdy0twNDBjWiqsNrZSHTTI7S5LxY6UtRzit2sZb54j9+TaiIGpE/qSBLZIaoekkmpc5WAmEGZ8sOY/JYh8PwLRavUnGPSuAlShEvD6+maEcZF41sLfMpgr+UJsUgo6LP5cpj3p8aPYA3TZDo2j+FRvId4I+WoolBOmW8BMOV4DeNiy8B6pzsaLJxiBkfWXJjr3QNDoAjKb97PXzgQu0dDNkFaJ1Djp6sjsD0zMhbzSYIB3ZuSxSmo21Z75Vd4GDHFsBBLXWj5uOoHkggKTbeK+FPM1S4xjPP8V63sa0sjGIoYiVs3+GaQVNEbGhZRWAY5S3goeQeXTLs2cnsEBzvxGfIlCxnJLhc+mUxPMg5X9ZiW889CNegJHrpfknYEguCCgg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(376002)(396003)(39850400004)(451199018)(2616005)(41300700001)(83380400001)(5660300002)(31696002)(478600001)(37006003)(6862004)(186003)(26005)(86362001)(38100700002)(8936002)(6636002)(8676002)(4326008)(66946007)(6512007)(33964004)(6506007)(316002)(66556008)(6486002)(36756003)(66476007)(66899018)(31686004)(2906002)(107886003)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Smk4UnIzVXFsYnJ2cm9PQ3ZRbkwyVWMxTEgwTXBpMDVPVk14MkpvVnRLYXNj?=
 =?utf-8?B?VnRTSks4T3ZIRHV0MFFwSEFVcnYyaC9mT1owcnM5NklpaVhQUjlXSU41czFX?=
 =?utf-8?B?L0RwQklDZHNrZzZ3NTFkUCtzQXI4cmV4T0oxYkxZNHJ6S1NsVGhFUDZCbFBJ?=
 =?utf-8?B?aGkvOUw2ajFodXNMQ2UvVVNxOEhmbktkUHdLQkZ6Qm5salNQeVpORkVaK3FN?=
 =?utf-8?B?bFRENVFaRnI1V291TDlZSHNBMGdhWk4wQWF3Ukk3Zm9sSFI3dXErdEdxSllX?=
 =?utf-8?B?ZE9VSUJjSW9nTHdjZ3BjcUUwcWRpMG9XS2taV0ttR3d1U0h0R2pFcnlkOVpZ?=
 =?utf-8?B?UDJUSWM0Y1VSQ0dhd1VvSXVhYmp6M3d5N2RkNHBRTGs1Qks5blBoWHlyWWE1?=
 =?utf-8?B?OU01aXRUclFIOWNXVjliekc3OVFFa3h5OHVGMjM4MGVhK0dvUStzandxOGVm?=
 =?utf-8?B?M3prS2N3MTA2QkduZmQwWXZ2MDQ0Q1BWNjdKcHU3dkwweHdzSGpsK1NCZFlN?=
 =?utf-8?B?QmNKTHhQNXp1cXBVNWQzV2swU2puV0pVRWRkV05LWjR5QnliejdpMnUwN0tU?=
 =?utf-8?B?Z3ZyUGljYXFhSjhDWlNLM3lwZ3JxWUpCWVJ0VzVIK2V4MWcxVGdXZWI1VjFX?=
 =?utf-8?B?MWw5aEJVOXFOZTU0aXVQcTZ3aXFXNFMxN3ptNWNOUVo2MWpUL0lGU3k1NXlY?=
 =?utf-8?B?MG1qOTNqWlYxOHpXQXFQeHY3SW9xeGcyNEhSTW1kYmYzT041Vjk3MEhBUEtm?=
 =?utf-8?B?S1FZSXhhYmt5UVZYOTYvYlJacUlQcXBZVnNrSmQ3R1E0WHh0b3VwRlNHampz?=
 =?utf-8?B?MGVUdVVseTRBMDM5UWd4a204M08zdkRueEgwOTJCWFE4MmVrWVlDcjNTVHcy?=
 =?utf-8?B?NUFiYUNHRkQ4bG1hWmJCbHh2N2ZiSC9TTFJReHNUUGpqUDg5WUdlWlVpenZS?=
 =?utf-8?B?alkyQ29QWjB6RkhobU5yKzV6VjRaZHlkb0JFVVRzTXlLcEp6RGpmUVdRYzVr?=
 =?utf-8?B?SUtqSnFTVGpOQUdZeVRuQ3Y3Z29RTVJhczVYSXEyc24zQmNzT0szblR5ZTlV?=
 =?utf-8?B?b1ZLbmhXNTJkV242MGpnRTRhMU5ud1MwSlNMNjY4cjlQRm9PZ2xsRHg1clA2?=
 =?utf-8?B?am5yMlVPM2x2Znh4RU5WMnE0VXpBdFVGNi8xeEdndFY4NEgwSXFyNi9BcWlm?=
 =?utf-8?B?K3pJdW92UmdqM0N3Rytsb2FtZUJkS0hjdnhUQVlHelZLb3d1UUdycjZHQk5t?=
 =?utf-8?B?amFuZzludVQ1ZzY0Y3BzUVpESWZScDNpUkRwalNURVB2aW41K0wrU1VtdXFj?=
 =?utf-8?B?RUoxcm54ekx3V000aFg4UWkvOGNtNHVSZnpOYlJkR2ZRSXNmcTNGSDlkb1Vq?=
 =?utf-8?B?NzArZHdzUEU2c012T2RKbWtTM1A1alJtU0R5QkNGYkJEL2thd3I0OUtFVk5W?=
 =?utf-8?B?eHVpaXVCYUNMWWl0M1BHRDYzK3FMcWZXMFBzVVhFZVBCZHVxR3VCVm5Dd2Rm?=
 =?utf-8?B?cmRyMnVLQ245bkVOd2loZDdrQ2pBYys4S2Q2c0UwWFMvMEV6VGcwRW1BUGhl?=
 =?utf-8?B?ZmlLM29ac1NpVW9ZdDd1SmJ5OW01SW5lWFRhbGdCN0pXT21DTWU5aVlxTEli?=
 =?utf-8?B?UzNoY0gydkVwdE1nZDdsVU9jb0tjV3FGbzU5eWlIajhoQTVrOUJ4RkhoZ0pH?=
 =?utf-8?B?SzROYW5zR1RKNkJLM1RFZC9lUEdlTUg1d1k3bTZmdFExWkQxM3VNYmI3SEE5?=
 =?utf-8?B?VlJVQW9tUmtFRVBVTnFTVUdJc21nQTdNcHVrUlY4bk1aQ1ZOdE1Pdnd3SWho?=
 =?utf-8?B?OVdxOVB0eElaMzlSdGtXVTlwTmI2YW51WjRsRjliTjE2UGRyZ1NoZlF6MzJo?=
 =?utf-8?B?THJYUDhDaThwYVJ6NHNvc1FPVG1DTzNRZ291cTZQR3JnNVgwNXRqckZ1OHpK?=
 =?utf-8?B?Q0pYQ2hCK25VbFZRZUNoemRGb0Y3eklVU0dGUHhxT29FeGIrVWRVMzRwWXRS?=
 =?utf-8?B?SjhRdVNRVFVqcld6T0hVL0pubWxTWldJMkZySWJFM0JQMHFVM2RxaWVHeUpr?=
 =?utf-8?B?b2RSNCtqc2dVWTUzd0NpUzJWZS9BVnFSdThkTDJQZUwyLzJvaktWZ0hDbHR6?=
 =?utf-8?B?QVVLNTFxVkFkWGovSG4vRkV4OUVna2FhZ09PZy9xMSs4TEJaZ2I2SjQ3Y0Zh?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2378f546-dc1d-47ed-5193-08db15cf8d19
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 18:55:37.4279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCpGXR70BMbhfQUm/qMXmwZ4IBKSIgE2MUKsgJCKQIiMILwdjYJCVT270DM8R/GoHnt0gdXZevqHqKb77VQkAl7GwQ6fZ4lO9iJe16V8AfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
X-Proofpoint-ORIG-GUID: QA47G_WIIEy8QFf4WFUnyXNw-Sf13GeW
X-Proofpoint-GUID: sr7Ps5leAxydDmGa1qqwiHJB6pyxUlw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_12,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 18:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177621

--------------TQRUg5V3l5lbS6X6mLzEjZUd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31NBfYv0031464

Thanks Naveen,

With a large patch like this it would be good if you could provide a
cover letter that summarized what is different in v12, compared to v11.

I've looked at the diff and my summary is below. There are some changes
which I see but would benefit from an explanation.

Finally, please change your SOB line to @windriver.com.


Summary of what changed in v12:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Rebase Rust tests to 1.67.1.

Switch from ssh-server-openssh to ssh-server-dropbear.
--> Why?
I know you were having problems with scp not working for qemux86
but either server should work in theory.

Tell the Rust remote-test-server to bind to port 12345.
--> Why?


Also add: --exclude src/tools/rust-analyzer to testargs.
--> Why?
I don't object but ideally the commit log would explain this decision.

As far as the tests go, you've :

 =C2=A0-=C2=A0 added 3 more 'ignore-stage1' comments :
$ rg ignore-stage1 /tmp/rust-test-v11.eml | wc -l
41
$ rg ignore-stage1 /tmp/rust-test-v12.eml | wc -l
44


 =C2=A0- added 20 more #[ignore] directives:
$ rg "ignore]" /tmp/rust-test-v11.eml | wc -l
4
$ rg "ignore]" /tmp/rust-test-v12.eml=C2=A0 | wc -l
24

Those additional test skip directives doesn't change the overall pass=20
rate significantly
since the test suite has ~ 18,000 tests so they're find with me .

I think that's about it. Did I miss anything?


Key, very abbreviated differences b/w v11, v12 are shown below .

../Randy


+Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10
+
 =C2=A0Signed-off-by: pgowda <pgowda.cve@gmail.com>
 =C2=A0Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
 =C2=A0---
 =C2=A0 meta/lib/oeqa/selftest/cases/rust.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 54 ++
- meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +-
- meta/recipes-devtools/rust/rust.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
- .../rust/rust/rust-oe-selftest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 508 ++++++++++++++++++
- meta/recipes-devtools/rust/rust_1.63.0.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 5 +
- 5 files changed, 570 insertions(+), 1 deletion(-)
+ .../rust/files/rust-oe-selftest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 736 ++++++++++++++++++
+ meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
+ meta/recipes-devtools/rust/rust_1.67.1.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 6 +
+ 4 files changed, 797 insertions(+)
 =C2=A0 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
- create mode 100644 meta/recipes-devtools/rust/rust/rust-oe-selftest.pat=
ch
+ create mode 100644 meta/recipes-devtools/rust/files/rust-oe-selftest.pa=
tch

 =C2=A0diff --git a/meta/lib/oeqa/selftest/cases/rust.py=20
b/meta/lib/oeqa/selftest/cases/rust.py
 =C2=A0new file mode 100644
-index 0000000000..e06ddaa6d7
+index 0000000000..f9889b840c
 =C2=A0--- /dev/null
 =C2=A0+++ b/meta/lib/oeqa/selftest/cases/rust.py
 =C2=A0@@ -0,0 +1,54 @@
@@ -237,7 +239,7 @@
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build core-image-min=
imal with required packages
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default_installed_pack=
ages =3D ["libgcc", "libstdc++",=20
"libatomic", "libgomp"]
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D []
-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features.append('IMAGE_FEATU=
RES +=3D "ssh-server-openssh"')
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features.append('IMAGE_FEATU=
RES +=3D "ssh-server-dropbear"')
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features.append('CORE_=
IMAGE_EXTRA_INSTALL +=3D "{0}"'.format("=20
".join(default_installed_packages)))
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config("\n"=
.join(features))
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake("core-image-mi=
nimal")

@@ -248,7 +250,7 @@
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog,=20
user=3D"root")
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ssh.copy_to(builddir + "/" +=20
"build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-server","~/"=
)
 =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 # Execute remote-test-server on image through background ssh
-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 comm=
and =3D '~/remote-test-server -v remote'
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 comm=
and =3D '~/remote-test-server --bind 0.0.0.0:12345 -v'


--=20
# Randy MacLeod
# Wind River Linux

--------------TQRUg5V3l5lbS6X6mLzEjZUd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Thanks Naveen,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">With a large patch like this it would
      be good if you could provide a<br>
      cover letter that summarized what is different in v12, compared to
      v11.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I've looked at the diff and my summary
      is below. There are some changes<br>
      which I see but would benefit from an explanation.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Finally, please change your SOB line to
      @windriver.com. <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Summary of what changed in v12:</div>
    <div class="moz-cite-prefix">=====================</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Rebase Rust tests to 1.67.1.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Switch from ssh-server-openssh to
      ssh-server-dropbear. <br>
    </div>
    <div class="moz-cite-prefix">--&gt; Why?</div>
    <div class="moz-cite-prefix">I know you were having problems with
      scp not working for qemux86<br>
      but either server should work in theory.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Tell the Rust remote-test-server to
      bind to port 12345.</div>
    <div class="moz-cite-prefix">--&gt; Why?<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">Also add: --exclude
        src/tools/rust-analyzer to testargs.<br>
        --&gt; Why?<br>
      </div>
    </div>
    <div class="moz-cite-prefix">I don't object but ideally the commit
      log would explain this decision.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">As far as the tests go, you've :</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">&nbsp;-&nbsp; added 3 more 'ignore-stage1'
      comments :</div>
    <div class="moz-cite-prefix">$ rg ignore-stage1
      /tmp/rust-test-v11.eml | wc -l<br>
      41<br>
      $ rg ignore-stage1 /tmp/rust-test-v12.eml | wc -l<br>
      44<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">&nbsp;- added 20 more #[ignore] directives:</div>
    <div class="moz-cite-prefix">$ rg &quot;ignore]&quot; /tmp/rust-test-v11.eml&nbsp;
      | wc -l<br>
      4<br>
      $ rg &quot;ignore]&quot; /tmp/rust-test-v12.eml&nbsp; | wc -l<br>
      24<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Those additional test skip directives
      doesn't change the overall pass rate significantly<br>
      since the test suite has ~ 18,000 tests so they're find with me .<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I think that's about it. Did I miss
      anything?</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Key, very abbreviated differences b/w
      v11, v12 are shown below .<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">+Tested for X86, X86-64, ARM, ARM64 and
      MIPS64 on CentOS release 6.10<br>
      +<br>
      &nbsp;Signed-off-by: pgowda <a class="moz-txt-link-rfc2396E" href="mailto:pgowda.cve@gmail.com">&lt;pgowda.cve@gmail.com&gt;</a><br>
      &nbsp;Signed-off-by: Vinay Kumar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.m.engg@gmail.com">&lt;vinay.m.engg@gmail.com&gt;</a><br>
      &nbsp;---<br>
      &nbsp; meta/lib/oeqa/selftest/cases/rust.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 54 ++<br>
      - meta/recipes-devtools/rust/rust-source.inc&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
      - meta/recipes-devtools/rust/rust.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
      - .../rust/rust/rust-oe-selftest.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 508
      ++++++++++++++++++<br>
      - meta/recipes-devtools/rust/rust_1.63.0.bb&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 5 +<br>
      - 5 files changed, 570 insertions(+), 1 deletion(-)<br>
      + .../rust/files/rust-oe-selftest.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 736
      ++++++++++++++++++<br>
      + meta/recipes-devtools/rust/rust-source.inc&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
      + meta/recipes-devtools/rust/rust_1.67.1.bb&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 +<br>
      + 4 files changed, 797 insertions(+)<br>
      &nbsp; create mode 100644 meta/lib/oeqa/selftest/cases/rust.py<br>
      - create mode 100644
      meta/recipes-devtools/rust/rust/rust-oe-selftest.patch<br>
      + create mode 100644
      meta/recipes-devtools/rust/files/rust-oe-selftest.patch<br>
      &nbsp;<br>
      &nbsp;diff --git a/meta/lib/oeqa/selftest/cases/rust.py
      b/meta/lib/oeqa/selftest/cases/rust.py<br>
      &nbsp;new file mode 100644<br>
      -index 0000000000..e06ddaa6d7<br>
      +index 0000000000..f9889b840c<br>
      &nbsp;--- /dev/null<br>
      &nbsp;+++ b/meta/lib/oeqa/selftest/cases/rust.py<br>
      &nbsp;@@ -0,0 +1,54 @@<br>
      @@ -237,7 +239,7 @@<br>
      &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # build core-image-minimal with required packages<br>
      &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default_installed_packages = [&quot;libgcc&quot;, &quot;libstdc++&quot;,
      &quot;libatomic&quot;, &quot;libgomp&quot;]<br>
      &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features = []<br>
      -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features.append('IMAGE_FEATURES +=
      &quot;ssh-server-openssh&quot;')<br>
      ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features.append('IMAGE_FEATURES +=
      &quot;ssh-server-dropbear&quot;')<br>
      &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; features.append('CORE_IMAGE_EXTRA_INSTALL +=
      &quot;{0}&quot;'.format(&quot; &quot;.join(default_installed_packages)))<br>
      &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.write_config(&quot;\n&quot;.join(features))<br>
      &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitbake(&quot;core-image-minimal&quot;)<br>
      <br>
    </div>
    @@ -248,7 +250,7 @@<br>
    &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog,
    user=&quot;root&quot;)<br>
    &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssh.copy_to(builddir + &quot;/&quot; +
&quot;build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-server&quot;,&quot;~/&quot;)<br>
    &nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Execute remote-test-server on image through
    background ssh<br>
    -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; command = '~/remote-test-server -v remote'<br>
    ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; command = '~/remote-test-server --bind 0.0.0.0:12345
    -v'<br>
    <br>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------TQRUg5V3l5lbS6X6mLzEjZUd--

