Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C54C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 15:44:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18556.1670255088697948019
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 07:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Ut0WThn+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93387393af=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5EhrdB003744
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 15:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=9PiFg9u1J9drmEfhmdW0L2Y9WAzrqtwFeuSmmrKG1pI=;
 b=Ut0WThn+75+rLeqiHhMPiFtqanJVp9xOr6KyxdMjDQjaF1lxlMI1FgmOCYGIMojSJHlb
 PNGmDao00RpUAcDTPSGVdvNa1YN4TFEiy2HkFOD2iwwP8VlYAoapzxKnJZq5iFLP6ZX4
 7sK6L7KV9em+lYfOM9g3a9Kt68ncsc/pMy52cjH3ZQpUGpbUuRza4aHPO8bgoL9XJ7Kx
 Ynw5DJNR7tEROco6yIdaa4gbp7Q8xxkIZNdrB0I2UASslsB5epMTt9evhQEPoGl98M7j
 nYXsD2FNSDhpyYVwL8Bim4qc5htgrYgYK0VlKH3ZEIQ/NoNMUYL0UcpkGt+ST3QCnjA8 /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we91kcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 15:44:47 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B5FilHH007805
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 15:44:47 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we91kcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Dec 2022 15:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THzknLl1u+8y15EGJGzCuD1EZ+63JEtM72v1oXE9Iq+fhtuOvMgwM2yAZZdPUxVxJmOzm87hAmXRR5fv7yA2tcYHSp3YfG6eDR9IRg6qksty4EDkcFfrcgGrJo2LIm96RZnqcra5GDtg7JG+AEoKMlE5X2RZA7VtkJPEJ7Hu55VjiPTyoz1HT5Qz+UslmvklpjMP1jU8ayuEwEtrpCyGvhI+rViZ/pQJPWX5gtC27/tkosu4ZNtKv0Ax1A9NNFNmhaPdIOB+Xtb3T0Ionp4Fgx+kNLgJN5Wp4iWfAL6ViZBLpMEIIL2VBL58tacdS8n63AqHd3yQ1i+QIPDiduWj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PiFg9u1J9drmEfhmdW0L2Y9WAzrqtwFeuSmmrKG1pI=;
 b=L5Jrm99QBFaMaUYNJhx3luv2dpQczqsfROSWMHCLxbcICcd6wmYuky9mpV1rAf4fjnsPvSAQrOShi4a610/d1GsJURzxLVUwb0unh4xr6gnIsqUx6iifNQX8sGcwLaFJAl+tXF6GxQmttCys9Hs91WLxQnsYj8uoZgbWgBbpuM4qgB5yH/KaI9Gv16D7R0ZF3PngXYF3plbbc3sqJn4ERg7pc5O3PFdF47loMKXI5v/GUL0ftXbvgFv9Sj7qyI2dDirPti5F1TxKhL88GXdvTMYhcQthUSgKwQJPhQUdgyZhUzjZBWqKs3mIYOxPf3MIo6bM1De8NtNQzjrxyCMV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 15:44:44 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 15:44:44 +0000
Message-ID: <45ba3779-f507-14e0-9a7d-dcad87f9f5ac@windriver.com>
Date: Mon, 5 Dec 2022 10:44:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: GCC Patch Tracking
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Shinde, Yash" <Yash.Shinde@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <CY4PR1101MB21833846A4FBE3749853564DEB189@CY4PR1101MB2183.namprd11.prod.outlook.com>
 <b27e5efefa8552a1b64a55f9b9701c65c3a35d32.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <b27e5efefa8552a1b64a55f9b9701c65c3a35d32.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: a3adb116-21e1-437d-337d-08dad6d7a191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ou8OZxuxBewx6DKaYiZEC1a9hVc/+NLUIw7yBWsQRTJkP/4VR4NR/P4k+VZZPFfpmhG6ZSe4R/enhSQtXD6y7mYFgrAO3Q8gzvM5l/68SOr5UJUJSg+oqCvSUAn5eTjHdTcIf90xeXgIDRoMXadisV5qC6zg3OlfMrrZyQGJ5KLMRXZrCdVKLsVtBUcxvQEF6j5h+DPm7esj+E5jxxkH7sRytIzJbzmx/uRz9Y/Wd0PLR8GhDX7idO9LiNNJuCZcpwsK+H6q/RSkYxXf16aRRCSxGj3PGl4N1vM5scnYcyYnpOOx4TCiZBhOIJTp17CpcRe1g33PH9EnGZ6RsBv3NqGS0ohBMH55tziy0e5Xts+zteQnw+p3exIVpiJ0TasaB0v2CsS4DReV8MJdYYNRx4Y0025PbSwSDzqzqvIb0mzyzL2+w5FBxmFIMiDT7m35H28CPMpuLCBZvfLkfYnmhU+Oi/N9rIYtfvdZIlQvzQvJy9iznpU/ipoO5o9eQfDcdGFQG8HNyMz5rVRT0Q1y1u18HHNZUTfjTLhw++sg0Po0n2OOyAc6xF0b+ndIPophobxJrACf1x2Sl86NWoXIGgNS23kWFszTKE3KkGB5ZinBoDQCtg9MwNYvgMhr4N54mjrkjebje6ousm2iF+ncopfv/aZdLhHWkZST6cBxE7++ME5L6OII0khH9dGGAgtegFqD03ZMmGgpQpsZNx2V0eZazykebg2W7LB3QuN2LTm8NkpEs9KANf+8AVj8aYykwnvdLMUBcol6J5I3L5W7wCqjFYVS4wPS6cqT3KIGaGo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39850400004)(396003)(376002)(451199015)(31696002)(4326008)(3480700007)(8676002)(86362001)(83380400001)(38100700002)(8936002)(478600001)(7116003)(66556008)(66946007)(2906002)(66476007)(5660300002)(6512007)(107886003)(53546011)(26005)(6666004)(6506007)(110136005)(316002)(186003)(2616005)(41300700001)(966005)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTRnVXFJMVRnZ2pvaDFpSmJhTGczT3FlQjREbTlrSkdCNXovU2ltTmN3SU5K?=
 =?utf-8?B?bk5iOVJMVWNGMjF2ME91Q0IvMGRPY1p3ZEl6dm5lOHhoc3ViLzZEOXg0T2FH?=
 =?utf-8?B?d01Ybkdqdy9hWXFFeGQvVUlVMGVIL0NBc0htQnkwSjE5bDhyVEJwUzBHdnMy?=
 =?utf-8?B?Y1RoNXorOXZzM2RNTGNYMHBWVzZOeERHTFpuZS82T2V3ajNSQVRTWDdvK3c0?=
 =?utf-8?B?Vm5LcEtuN1lEYW1QdVIxLzZxRHp2dUhKU2FDUkg3WjZjR2N5aDlNNDQ5M1pw?=
 =?utf-8?B?c0cwY1ljYjdiK0FBNEhyREtTRDhsdE9KcEUzbjR4UTlPY2o5S0p1MjlrK0dv?=
 =?utf-8?B?TDRSSWpFNVNwUzNZT3dXQ1NrUVg1UmRHQnJrajVQVGU5bGpZQ3lFVVlKNDgz?=
 =?utf-8?B?MGg3ZmxCZ0hrckVXcXBsSUlKS2x5ZDYwUUV0b04wNVRRY3VuQ2ZucDBpL1dX?=
 =?utf-8?B?TjgxQVZ5WGx0ZTRjY3ByL01NYjJsSmtrL3F2MnYyK3lZWG81UHZzSDJOaHVU?=
 =?utf-8?B?UUNEc2JIV2haZjhoYTZIRTdYZnRBR05oYVQ1bFk3d21DbXZiL3BjbzhlOU1Y?=
 =?utf-8?B?c0RHL2hPMFcveFd1RHpEWG1SYVIrdytMcEpTNFFpRjA3eHIwTnVqYlRPa2ts?=
 =?utf-8?B?SElGSXM4VUNld3VteWM2Rmg4WWE3WDJxOWw0NGFIcnFGWW5wMDJTdk1lVTBI?=
 =?utf-8?B?RHRqd1VFbUdud1FSa1FOVmdyS0tmaUV1WkYrNW93bFR4SXNJbWtuVnRXeDZK?=
 =?utf-8?B?K09BMkFGQUZJaUdUMEJ1OG10RC9nZGtWbXVLQ1Y2alE5MEE2YjNPRkhQc29T?=
 =?utf-8?B?dngwN0xFblM5emF2K0VpbklDK2FpT2JoMjB1UjRXMHI5SHNzenNLM3NFZnZO?=
 =?utf-8?B?dnl0TFRQczl2alNmZDB3L0w0RWVtblVwcEVidVFRY1hkdFJVbExNYTlhK0lr?=
 =?utf-8?B?b2FYQUpGKzQ5VHdxNk12UVpOMkRNbmNwb2RWdlI3Yk9wcHArTlJ2MkFmUzIy?=
 =?utf-8?B?ejN1NHFGdysxNG84aldzV2ZJNjdVdWpKNTY3UDlYOGMzajFxRGJZYWcybXgr?=
 =?utf-8?B?RTZLdUF1Z0QrQ3ZqeXpsTU9CQjhzM3pGRUx2dStpZjMyd2pQeVJ3VFVhaGpM?=
 =?utf-8?B?b1MvZjNHOE1hMnRSbDFBL2JFUXNWcGNxQUlBM2JOSVpZeDVWbkNHdjFDUkhp?=
 =?utf-8?B?dTFibnRSdFNsZ2JCTDNMWVFSd1N0cFZUY3F6eVBUTTBMeFlwQVJ2ci90cjN2?=
 =?utf-8?B?VDQxRk5TWDZnSjRDME13aVRUOEVXRjFWbCtYdEl1T20ya2tSWnVDYVF0cUJi?=
 =?utf-8?B?VmFETGY4eDd6SzdUT1ExTnQyOXAxVzFqNXVKaFByS3VNVmFMNDg3eGxLVFFG?=
 =?utf-8?B?RHQxOWhMUWhwREJxVFVZQnpxZlJTZTJocCtpS044YUo1UmpDTkU3VHg3Y3BO?=
 =?utf-8?B?eGovRS9aK1FRSXdZL05ETjdLQzhUVVVVT0x1NGdJQlFVQmhUZDNwaDVxUkF6?=
 =?utf-8?B?RFhZSGxoUkNyS0pINU1DcGxhakdjUThBakZDL05UZ1paZStMQzByRG9pNzQz?=
 =?utf-8?B?Y2x5L0M4TjgwOVJuUTM4YWN2VzNFMkVNVHIrOGpmVW5vU2xBbmRrUDBrMTli?=
 =?utf-8?B?b0VMWGQwdWpWRms5d0xGODdpdHFwNmFaR1lPM0lYTVlpVVZkV2pZTzBKc3Bv?=
 =?utf-8?B?Y2xPR01YQUdsYXUwaUJnTjJ5TmkreUlzS0xDMncxYWgwTksxQjc3NndTZXNy?=
 =?utf-8?B?VkVnU0ZoVTdUWkI4aURkbXJQN2RvRFBhbE5HRmpBbnV5bDQ3QXVQaEoxc0ZD?=
 =?utf-8?B?Smxmc09OUkpkK0dkTmJ5ZnlXZWJlbmxMbnVIb1hmSDBOOXQybFp2L1krdTZ5?=
 =?utf-8?B?akRQRU1wQVNlR25nUnpkakxaSnVmaThlYWUybHBrS2RIdnlPR3RzUEFJY0Zr?=
 =?utf-8?B?cnRVaHJjblQ4cE1SM0NPa3NlSzlEdXJJTGJVWlFhM3BuM3NEMWR2M0M5QWt4?=
 =?utf-8?B?SERRenVqTGxKam9iTmtVTE80Qk5zVTB5WGl4NWZlNWZjUTFWYXFxODZBQ0NX?=
 =?utf-8?B?R0RWNTZ1dERCNzBBNXJleGxoSFJRSFBoaDQvU3pNNzk4ZThlVldPQ1dqUTBO?=
 =?utf-8?B?TmtEdlFEWVUvOHp4MkNiNndHZHR2Yk1HMm1EdmRaZksrRFlCNXR2QlNyTVB6?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3adb116-21e1-437d-337d-08dad6d7a191
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:44:44.4869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4+pDxSQQ93dJJJIaN3rMh4aPmYfYpFQxy9n1CpBKN3xHigNbOKD4LUOoRzjDe3XmrIpb6oNmW3gkrQTkznuU0QArbku94Ycls3ILAayziw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-Proofpoint-GUID: pzne1vldCA51HApHWZuwZ-sAK6yLrmwY
X-Proofpoint-ORIG-GUID: 3_3B49jX-xVW0HNZoPcRzSZxX9aPp2br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B5EhrdB003744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 15:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174293

Add the list and Khem in case anyone is interested in Richard's comments=20
below.

../Randy

On 2022-12-05 08:47, Richard Purdie wrote:
> Hi Yash,
>
> On Mon, 2022-12-05 at 13:06 +0000, Shinde, Yash wrote:
>> PFA=C2=A0 document for GCC patch analysis. There were about 28 patches=
 in
>> GCC sources out of which 3 patches are with the upstream status of
>> =E2=80=98Submitted=E2=80=99 and other 10 are =E2=80=98Pending=E2=80=99=
.=C2=A0 I had analysed the current
>> status of these patches by checking them with the GCC patch list and
>> archive list and documented the same in the attached document.
>>
>> Out of the 3 patches with =E2=80=98submitted=E2=80=99 as the status,
>> - The 1st patch is submitted but changes are not reflected in the
>> upstream. (hardcoded-paths.patch)
> We should remind them about this one.
>
>> - The 2nd patch is not found in the upstream (0014-Don-t-search-host-
>> directory-during-relink-if-inst_pr.patch), was not found in patch
>> list or archive list and
> This one is tricky since it is a libtool change. Was the change
> accepted by libtool? If it was, we might be able to then persuade gcc
> that they need it. It would mean updating gcc's libtool and I don't
> know how they do that though.
>
>
>> - For the 3rd patch 1 hunk taken to upstream and can be marked as
>> 'backported' and the other hunk is not taken to upstream yet.
>> (prefix-map-realpath.patch)
>> All the patch links are given in the doc.
> I thought both pieces of this had merged?
>
>
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D11543b27fe16d81=
ca5483ecb98ec7a5b2426e0c0
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3De5c15eb183f17e8=
06ad6b58c9497321ded87866f
>
> We should update the patch to mention it is now a Backport with those
> two links?
>
>> For the patches with =E2=80=98pending=E2=80=99 as the status, they are=
 pending from
>> quite some time. Should we contact the author of the patch or the
>> community for these patches?
>>
>> Please guide me on how to proceed further in GCC patch analysis and
>> what are the next steps.
> For the Pending patches I'll add my comments below.
>
> 0013-Ensure-target-gcc-headers-can-be-included.patch
> ----------------------------------------------------
>
> These headers are being installed under a prefix in the sysroot. We
> need to check if that prefix is as a result of our own changes or
> something upstream does. If upsptream uses the prefix, we should talk
> to them about whether we can expect sysroot layout like this to work.
>
>
> 0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> -------------------------------------------------------------
>
> I suspect this is inappropriate for upstream and should be marked as su=
ch.
>
>
> 0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
> ---------------------------------------------------------------
>
> Looks like it could be submitted/discussed upstream
>
>
> 0002-gcc-poison-system-directories.patch
> ----------------------------------------
>
> Mark inappropriate?
>
>
> 0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> ------------------------------------------------------------
>
> Looks like it could be submitted/discussed upstream
>
>
> 0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> ---------------------------------------------------------------
>
> Looks like it should be discussed upstream?
>
>
> 0008-libtool.patch
> ------------------
>
> Would probably need to go to libtool first.
>
> 0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> ---------------------------------------------------------------
>
> Check whether we still need it? (i686 musl?)
>
>
> 0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> ---------------------------------------------------------------
>
> Check whether we still need it? (musl related?)
>  =20
>
> 0006-cpp-honor-sysroot.patch
> ----------------------------
>
> reproduce original issue, if still present submit upsteam, or drop
>
>
>
> So in summary, there are a few issues we probably reproduce and discuss
> with upstream.
>
> Cheers,
>
> Richard
>

--=20
# Randy MacLeod
# Wind River Linux


