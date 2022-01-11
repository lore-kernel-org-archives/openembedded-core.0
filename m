Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC55C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 21:05:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.14212.1641935149603893512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 13:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=I7ik1xI5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8010f76d9b=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20BIYBZm013485
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 21:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=PTPRM9KH8HfyvArcEs7ZlqgSNUMwoT6+YUeaVjIGJ1Y=;
 b=I7ik1xI5ezLtC1KTIehkiC4/76l6RQwwv/UtAIdfZeKE1DGAcUCiSgKemNJZBakjZpeT
 cXq0shyI7bQfk2XThbJf99uMMhgWBaXfu6fabAvV0KlSlnyszQaSpzbt/TacX9G6ZKyM
 SYDHMDxouPQf93h/96/4viBv57CNQ9oxAN82pb3W9CQP5j3F38eWD1d9e5bQa8BMdOLM
 Cvm6sENqQaENwKv0tQRKOfJFV+F9bGGZwXBKy7gcz47wCvEr+Bz9JlpaqmwjzPrGUD6n
 v5q+VOqHWJ+s3Sc7IVWPcbreL7+oqMKEASRC65GA8p3kFIxbtfqQ9JuV8MxqMgi+USCl ag==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1d55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 21:05:48 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20BL5mkQ015946
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 21:05:48 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1d54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 21:05:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grxV5/6Sd7yyRImgN3MJnrFJbZKqZ4uMC9Aro/SC1t5NaSlVXXgBWtgUSAyOsqEr229EWj4HHxmEwjk8YnjUdJ9iOLDqI/elPX4YVCOISv+vSGUBu2c9653yGko5BuqJWCJ4Vcn7bwfZVA3Z6gTopHL/uyUOH6b8RNyL1H5MqRZoqHPg2pca4K42CuTkFl+Nir7/Vp/tfFbGzaCltpRNi0qhl6sdunqkpynqgcPVsDasJ53xpfzHhQ+hE+w8hDwRvGVqR6dGWx87dQN0cu7uNZQNd5jtWj0niYAMuRbwNgoN0KaVk+q5x1ayoUN1QbNPSTcOHSDNrzWxBpL6pgoXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTPRM9KH8HfyvArcEs7ZlqgSNUMwoT6+YUeaVjIGJ1Y=;
 b=K0wADGCuzTtGrNhXMzrOjd4GQMPiFF1zyxT4GVTO0/eaSg46kPE89Lj8CvT+0WWZhp7IbD0lqGQNAMoiEZLsih5vM/7JxyZi8F/1b3ufPuaKIGU/yVQuRVE0/vW1NQ8VBtQ4EhsmZ02ZAB/PKyo9WW7tW3eZgxkkiAMSvX/7dtfL0sg5/nLFZ/+cCHZj/ewpoX+If6fWyIEznaBEltNDPP9Y7TrA5o0LjRW5vvLuvpUfiXKrO30oy2HDx8G6h1hYFYMNA56VP+tJlmMsO1YkJjn5aEQfERyX3Fy9N/YNcxGjxsoh/0zzZc8ORP0s3JhsW87JA+JyKZlqvofwe3IlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2030.namprd11.prod.outlook.com (2603:10b6:300:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 21:05:43 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 21:05:43 +0000
Message-ID: <28cf821b-89d4-9260-6df7-9f3b0cf5580d@windriver.com>
Date: Tue, 11 Jan 2022 13:05:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [RFC PATCH 2/3] kernel.bbclass: remove do_strip()
 method
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Joshua Watt <JPEWhacker@gmail.com>
References: <20220107212446.132386-1-saul.wold@windriver.com>
 <20220107212446.132386-3-saul.wold@windriver.com>
 <838c638d90097e11725f01f525178c70a15dfcd9.camel@linuxfoundation.org>
 <CADkTA4NYGboThC2b5=R6vw13HeGKOu93raMbgUk9iPUmwPSX+Q@mail.gmail.com>
 <3af9de80-884d-41e0-59a4-ea700c9b6656@windriver.com>
 <fef673ddc40d0ec2159fa01ad968aa4950121e06.camel@linuxfoundation.org>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <fef673ddc40d0ec2159fa01ad968aa4950121e06.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: CO2PR07CA0045.namprd07.prod.outlook.com (2603:10b6:100::13)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d50edff-3104-4a4a-b3ae-08d9d546210d
X-MS-TrafficTypeDiagnostic: MWHPR11MB2030:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2030BF6A27BDC4280C6D5370EE519@MWHPR11MB2030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2yZVzbe7nPAC+XCxu2I81pJWoMAw6UoDmGZkgJ33vf7m22jL6JiCp4+q3gog3uK547RAZ0TrvhWYer3jItlc4XkxS9amlkcPPX6T/u92bApvQ7vYj0l5g4NcNBalJbLrLLXUL2dVFEaWZOr5Oxwp+L2+0dOeoUi+vf6iRCnR3U4SYXrt6e6cKIzyOSHIENObC6xCTbf1ibO4m75cOLuwajkzsF7iXZmDwe0h30LxLa9bw0i2UqqQozFm7iUyOIJNT7B64RU85FrJQoMz8n+xpao93lsot0WwrwYrgBHBeJ4QqeCamI4vopwLVN185Wjrd0mX9ngzrWGJLAnJTmJ7b9UpZhm4mTj2iEN3S5tABGXRVFmNfY23YRDlWk2LvlV6iOg5oQNvITnPn9jRB8W8tARGnrh6R0gYSboK1MwchsZTr+c4zrlMu03HsOztUSjsVb9tbiSpBeAZHxo8u6DruylGW78teSP0FdAAUsJwdJ9xSfLlT/W0QDg6If2EIdsHetK4G9q/ZEva0SimSsqyTrhxcRLTVPssl0cFXff9XkjJoPhJn3PohO36ZACKYOHqV4rmbi2dgvuU058r17XLmQHQK9q4SPj6/pn1EQD3P+I74oBC0UMdhwjEYh7U5chE8LcVa18c7vCtZWdQzQdv7ijOBT4RJd+gEsUZGecUrB55RF7IwuGjo7ey43Hv93PXXlffOe4ACpU9IgjQ9atGBEjcvyijHGHWQtU3tuoKvOSjEHkYt5s1nnE/bD/8Wh93ckoZGx1pHQdDsUL4TSlrVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66556008)(66476007)(31696002)(66946007)(2906002)(38350700002)(52116002)(38100700002)(4326008)(8676002)(8936002)(26005)(6486002)(86362001)(6512007)(83380400001)(508600001)(110136005)(36756003)(186003)(316002)(54906003)(6506007)(53546011)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWRSREppRGJwNzhPTGxFTlB5REZaeUphdE9qL3BTTlFxcHB4czJpN3duRjZY?=
 =?utf-8?B?Q1hlcnVXZTBMQUVuZGUzdmEyWEliU2oycC92Q21ZcHJ5d2l2MFpJbHQ2WjVv?=
 =?utf-8?B?OERjY3JzNzVuM3hQU1dOaUZGaUdPd3EzS3dYbVpRQnNXRzR2YVRYdG5hWWRS?=
 =?utf-8?B?OVJqRWpuZkRkOVlTaEJCaFNsY3RkWDF1Tm9MS21hMWZNVGpKbG9NWkJIZ1JU?=
 =?utf-8?B?Rk1aRzZLanI4emtNN2xEQ3RQcVNXS1NibmhZN2hKTUluQngxN1lHVndUQTI3?=
 =?utf-8?B?MXlIcE40bUhHRmwrRXFEWU1zaUprOGlKNllDSVpGNkhuYlVzN1pUdFJzTHcz?=
 =?utf-8?B?bFhrRnBXaEZUOGp5c2ZlUEN2T3BwQzRXbWxDNm5qYVFBb2FJVzJTb1pxdWNa?=
 =?utf-8?B?ZXZRcEpkSFpldzBXeFRJdWpUV00vSDZwM2x1M25NSDA4NVFRcHkza0xyc2V6?=
 =?utf-8?B?L1l3cmVlVWxISmlYU0V2b3YyaklYaUZYblRYc1ZNN00zSFFVYkNnaDdJWkl0?=
 =?utf-8?B?UGJ1TlZuQkRoWUZnaVNrT2dHaUdlZmR5VUphZTdUMkxUQ3FpZCtGZW4yQ1Y1?=
 =?utf-8?B?WHZYVlFwSzZ0aW5uNGMxc2Q2Z0FTRHhManMxNXNnODhlWVNkT0VHUjRjZXBG?=
 =?utf-8?B?VnJOMUJ3emJZbENkaldPdzlpNEM0OEVWejZEdGhGOE1DM2N1VEJUd3VDaGFG?=
 =?utf-8?B?eURSVC92WGp6UzVQMGIyaTlCUnVTTy9VWWptWkJzZjE4dlU5bkU1VE1STFhp?=
 =?utf-8?B?ekdZZnE5RGZCaTFveEZSRmpJR0dZV21RakQrNEZST2JBYjUzT2w4eXF0QXR3?=
 =?utf-8?B?RHlZNGczM0FMM0hCOVhpRzFQRmFodSswYjl6NHlsN2dvZ1VMcUNkb1M0anpD?=
 =?utf-8?B?V1lRVlpxZTVBSk12SmNNc1YzQUlZZlB0MlJ6NTVRbWFsR2MvK2NOUjZ0SFFQ?=
 =?utf-8?B?aXpQanV3K3phOW1NUStsRWhrZEEycDlFMSswSGVwZS95aVlZOS90RTRoS0RD?=
 =?utf-8?B?d0szeHJucHoydG9CTFFzOVhiQyszUUtQcmg2VWpndUNTb3lrK2djeWNvazlx?=
 =?utf-8?B?Tk5ZanF5MDA4SWVveEZvTVd1T1pHd2ExWXBPTE1iWDU1UWd5QkJjUFRvdkFB?=
 =?utf-8?B?NW9zOHg4TlcwSm9aVTF5dHBJUHltM0dPVjFmaTZxVWRDaUp2cFZOUWVhY1ZP?=
 =?utf-8?B?VzFJVmd2Vis1eUtvQmNkT3NvSld3eE1zNFY2S3NzMVdkWDZESHV3NXhWZ0JN?=
 =?utf-8?B?SW83TDFDd1lJU2Y0c3pKcXNoeUllb0IwS2pYU0RsOUtMQlZBYVhSQ2RpdVVS?=
 =?utf-8?B?QVV6cENmLzRVcmh0M1RmSkdVaHB5eitSYUJBdXdVOG5JcGxiN0h5ZXVQWDJV?=
 =?utf-8?B?dGxKcFV3RmZlYThSdWR2REdKSnNtcFppMDBFeWtNQklFUWoyNkhNV0Nwbnh3?=
 =?utf-8?B?K3A5ZEgydmFJM1E2TFFqUWRZb001U09kQ2NMcHFQTnRrMis4RHVyQkNxY1RL?=
 =?utf-8?B?c3NtamZ1emhtbEN4eTdWRGlHMVplY1NKVU5ZdVJET0lOL3VjeVhXT3Axdisx?=
 =?utf-8?B?d0RNR1N2TXBsL0lGOS85OEpNMmp4T0JJMXZOTWtYMUtXeU5ZV2pEeUVxUjly?=
 =?utf-8?B?Z3RDZzlscDZjV1ZKU05qSiswNDA3ZytSZ3BvUWx2RkVCektTbXFGQSs3N210?=
 =?utf-8?B?d0V2b0NST0FsdlY2Z0plcDIwNjJRTlhsZ3hhbloyN3B3d240MlUzQTNxRTBH?=
 =?utf-8?B?QnpNZGZwYVpsSzI0clZyWGxTMXFqRGdQcmZsb25ObTlYdkRtYVVldTNDWDUr?=
 =?utf-8?B?WmtiT0RDeGg5UHRuSmFyMHV1c2dQVWsySEFpWEJ1eUdUcFJWL0p6OWJkVFBh?=
 =?utf-8?B?TUUxOFhnQnlVdCtIZGhpK2YweE4vc0c3WXQ4Qk1rUXB6cnE3VyszcGVOOEUz?=
 =?utf-8?B?MEF5SHlSU05mS041RE5CdHgzeC9Bd3kxNGFyZUNqeEJzR2x2TWYrOXEwMk9J?=
 =?utf-8?B?Nmw5VzFVOWd2L0hoRVpmczFiaWcveExOS0p5dGFjSVFRc0dUSDV6SXVrUmFz?=
 =?utf-8?B?VVFiQVFMSzNuWm1BOHhxNlZUR2dTWGFVaXY4T3ZNNjc2V0pTTTVPdFVJc0M4?=
 =?utf-8?B?eGV1RitBSjl1NlhOZ0VhdTlpZTBxZjYwRWZBOFVyWGRtQmd0RzhNZjNWRTY0?=
 =?utf-8?Q?iBNnxLqejVpbFjh/lkfDim0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d50edff-3104-4a4a-b3ae-08d9d546210d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 21:05:42.9858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f4hsUfYqo1ynGspZK1y1S9t1tlqISFvIUi923p/VXKcj/Hnxf7ZLm6vTaCBOEb2PmJR4AXeqnfWY6sBZcsZtmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2030
X-Proofpoint-ORIG-GUID: -nM4QMW033G3zrhMewdsmXsHdIsBSJaC
X-Proofpoint-GUID: YwLa3pfrwEZlGAnxCowf-rxoXKkPcc5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201110108
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20BIYBZm013485
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 21:05:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160464



On 1/11/22 03:27, Richard Purdie wrote:
> On Mon, 2022-01-10 at 16:42 -0800, Saul Wold wrote:
>>
>> On 1/8/22 11:27, Bruce Ashfield wrote:
>>>
>>>
>>> On Fri, Jan 7, 2022 at 6:19 PM Richard Purdie
>>> <richard.purdie@linuxfoundation.org
>>> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>>>
>>>      On Fri, 2022-01-07 at 13:24 -0800, Saul Wold wrote:
>>>       > Move the do_strip() functionality to a more common location i=
n the
>>>       > package split_and_strip_files() flow. This makes it possible =
for the
>>>       > extended packaging data to be generated correctly for the ker=
nel and
>>>       > kernel modules. The KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is reus=
ed in
>>>       > the runstrip() part of package stripping.
>>>       >
>>>       > Signed-off-by: Saul Wold <saul.wold@windriver.com
>>>      <mailto:saul.wold@windriver.com>>
>>>       > ---
>>>       >=C2=A0 meta/classes/kernel.bbclass | 35 +++-------------------=
-------------
>>>       >=C2=A0 1 file changed, 3 insertions(+), 32 deletions(-)
>>>
>>>      As I mentioned in previous mails, I think this will mean the
>>>      do_deploy output
>>>      will change and become unstripped which may cause a problem for =
some
>>>      platforms.
>>>
>>>      We likely need to keep a strip task but call the new strip funct=
ion
>>>      from it?
>>>
>>>      I personally think this is a reasonable direction apart from tha=
t
>>>      though, at
>>>      least in principle.
>>>
>>>
>>> Agreed. It looks ok to me as well, with us making sure that do_deploy
>>> can remain as it was.
>>>
>> I have been looking into this and realized it's maybe a little more
>> complex since the do_sizecheck() needs to run also before do_deploy.
>>
>> Currently, I believe the ordering is:
>>
>> do_compile()
>> do_compile_kernelmodules()
>> do_kernel_linux_images()
>> do_strip()
>> do_sizecheck()
>> do_install
>> do_package()
>> do_packagedata()
>> do_deploy()
>>
>> If I move the strip() process to package, I also have to move when
>> do_sizecheck() runs. As you mention we need to keep what gets deployed
>> to be the same with and without the package split_and_strip_files().
>>
>> I understand what your talking about having the vmlinux image (which i=
s
>> the one getting stripped) is the same before and after this changeset,=
 I
>> don't think it's an issue of the deployed vmlinux being un-stripped bu=
t
>> the vmlinux being stripped in the deploy dir.
>>
>> We can't really call the package.bbclass strip from the kernel bbclass
>> since it's part of the package process and called in a multiprocess() =
way.
>=20
> This bit puzzles me. Why can't we manually call the function from kerne=
l
> bbclass? It might not be particularly nice given the multiprocess bits =
but I'm
> sure it can be done and likely the lesser of several evils. If it works=
 in a
> multiprocess context, it should work without? (the other way around is =
much
> harder).
>=20
I might not of explained myself well, since I did not mention the=20
gathering of debug info (extended packagedata) occurs during the=20
do_package() phase.  Yes, I can use the runstrip() function from=20
oe.package in kernel.bbclass, but it still means the kernel image is=20
stripped by the time it gets to the do_package when we want to gather=20
the debuginfo, but can't from the already stripped kernel image.

It's a task ordering issue in combination with what happens in the=20
split_and_strip_files() to get the extended packagedata that the=20
create-spdx bbclass then uses.

The kernel do_strip() happens on the vmlinux image in B, while the=20
package stripping happens in the PKGD directory, while do_deploy goes=20
back to B for the kernel image (KERNEL_IMAGETTYPES) which might not be=20
the vmlinux.  It's a twisty little process with back and forth.  I think=20
this is where I got a little confused also, I thought do_deploy was from=20
either D (WORKDIR/image) until I re-read the run.do_deploy script=20
itself! (my bad).

I could add special handling in the kernel to do the strip/split
Hope that makes better sense.

Sau!

> Cheers,
>=20
> Richard
>=20

--=20
Sau!

