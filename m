Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF21C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 12:12:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40684.1656331972021670659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 05:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=cRMvRKuj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3177180a79=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25RBN3E9020521
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 05:12:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=doCBDva8+ghuIN2532T5WxDR2aT3SPiXL6qLgp2LcC0=;
 b=cRMvRKujCe1nY+J4OCGr3Jeq5Y/jWHlY1gGfF0f3zITvUnKj/DLPYIMwkqJOcAxOjING
 5YHU7gSgUrB7SQAkTvYigEd5VLubhDrh5df3Ypb4ita313Tc4VUVP53FgEAeRsao0p/U
 y1X6N3Q6FC8uu9kqwYBK6Y4q+2p3E5/tKGQO3WfwC9vFphPofek+bs7cxqABKxm9/DdL
 cDMS/nciNQ3MK+uYrL02MGfOeqiTyHklQSIkgYtunWgVthX0jk6HPlkS5/G9kO4CRueW
 AfQ7p2vXm4fPOYb3MWyBS5xkjFxeFwBRWuB1u2fV0TziUGqG6bSV5MWFd4onVWBKdA4Y NQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwwn499fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 05:12:51 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RCCouv002130
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 05:12:50 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwwn499fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 05:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpnOJd9peFdlNv+hyfTTLlQHEm8+2X3UZMHkKGmgvlH3Q8AoRJ3p6uVs7fV1sBT1DrTN7PTJAHgwLv315YGYm9E1NEg2JdlAuB2E3ETNfDtfWHnuDHCjpi3QAqPVxgTkI2jq4PoCLlARtrBq4SDKA7/nNjKHcMmeNOcY24+oK0mtasD1/JJ1+TydTyuDGv1+s9z4s+jBD1gsaMMw4SBU/oyuV02+SvxwSIqoyxtsnrRMLWlZWN9Q4Icv102/1PH9TzKf/A43dNxus8z84ZoxrGfBcgcIJn6bcKEZogwtnuTwDU9FC3vvewEyS/7rJnzaFvF8NXXmyBmC8M7CzQxKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doCBDva8+ghuIN2532T5WxDR2aT3SPiXL6qLgp2LcC0=;
 b=P1FfpFnCyJLWhwL5t7cnii4P+m3taL1eaV7Hkt/pMyySq87qEwZu4qYLv42UYP+i44ZEpZtG12G6ljnYN9wdiUsCXBol6i+9J38GmJrUIYw/kOGRUpp73nj0ZvHlrAcz82FTP6jGfiKxe+5sxweIPddEcwTtPfdHLGG2mbmzBNBpHX394LqsFKqQx4iwPujOchd+6Q19TtlcNLfGKd6GSaHVaC37JizYMy0yu9bP8p0OQ8MvKzxHhThbZN3eVnHm4aHliCxfdnmyBueK75jq9Hodd1JaKOwEMFGSHInBq0Z8xTOTlwFFGwrbUyMyYQf0V80+BXokS0Rb7wh+ENnSdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN9PR11MB5404.namprd11.prod.outlook.com (2603:10b6:408:11d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 12:12:48 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 12:12:48 +0000
Content-Type: multipart/alternative;
 boundary="------------dlSGWEi0CYlocrfHV4TZ5MpQ"
Message-ID: <9cbdacd8-96ec-2170-3a1f-5f1fb0654114@windriver.com>
Date: Mon, 27 Jun 2022 08:12:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone 00/26] Patch review
Content-Language: en-CA
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
        openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: 
 <CAOSpxdY7jX0L+eVhQmsATJ0Ui7WY2BO3YLhHPy9A1_xD8WVo7Q@mail.gmail.com>
 <10174.1655345951333043146@lists.openembedded.org>
 <e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com>
 <4b1d26ac-6fe2-50cf-4cbd-23fcee49b0b8@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <4b1d26ac-6fe2-50cf-4cbd-23fcee49b0b8@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b026e6e1-be8e-4c6d-0423-08da583659df
X-MS-TrafficTypeDiagnostic: BN9PR11MB5404:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g+4E4OfiZ2eg9rGYU6ytSYdiOEnMpiYL/vOLYymysM/fqoNudBmImm3fI61+vHxRWzZZXWh/UlKs8gY6fZtjy0Jwm19T25pdrw0PBiYKMlWJlfVmAXQrxU+msLVtdXDJiG8/f6ZgIFJuNBcJQA8OhocFEN7BsX9JdZZui1BECYeuaTwTdvMwk06C2lziPtKjHF+w0RjMr153Z1ag5vjgKsId3n0vLYlSwT0Go6FXX0wa/Sdhb1lRUHIq1cZrKHIGERhTvajqGA3jmLVdo93MkiUsoLywERrxMPgCyF2JcTdedREM2Bur8/jQg+1VGyESpcViIOEhHN8KKwCWSk4Ce5+Nrm2P5+QTw4+4kjwYWDBW+SgZf+iudBkGQuHXHoAv+Wo48eUrHx/agTMbja9zjgPPZVU1fx80L2/P1/vEvzaOLnZixU4FtqsyYVXb1918aBBdU5zjEhzbZgTitI754mzyzI7xVFOMer7Q8fe8i1X66MQMETIM34WJSzn5r/HIVj2cHgWu/Qs+TtfiKiGJdKSG4jW6nsXARHQ16+DcD11BWvIDXrXya7nJ3e0tahrdbX1eFuDrulqxMa6ygw2vDn6eAtLUX5KnBuPCQzNhSvjjm5Xc3QdBwYmO/EYdedQdy2gcR1HBaC8dM8hBg66PY/ge8wTu+8rFCFY/DF5SipYh2fXcY0UfZDzIxaLyKVcTamP24SnlNd+h9XIB9gkyfR2O3z0KymbbUuzHvSAZlFRnEAva68+PGaWAAd5k6wVxfAjAFMPMl4wDMypPhU7FmCVyS3yKO5YZzNgIqHJoapWLCGFKZgOf//y2kmdT/LRcP0CjmiNFsqjEjQa7oiXbnj6tWlXFlUeyYDRWeF/DKdtK4qLsNfq2iQngR/kWCA1s1HzUBNgZmcA5gXyCirvc2EmIL7jHH1frUqcqLjLqMwQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(376002)(366004)(136003)(346002)(396003)(186003)(2616005)(66946007)(66556008)(6512007)(6666004)(38100700002)(83380400001)(5660300002)(110136005)(8676002)(38350700002)(316002)(2906002)(6506007)(33964004)(478600001)(8936002)(26005)(6486002)(86362001)(41300700001)(84970400001)(53546011)(52116002)(31686004)(36756003)(66476007)(166002)(966005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amJSVURTQzA2ckFlcnRCMTZHa0JKMEJQTW9Ub1VLSm9BeDhsQzEybjlVbnNK?=
 =?utf-8?B?WVU5Tk54Zkl1MURXbUU1Mlc1VCs4eHJJbzZWelgraHlTR29IRGJyc2ZYdmlK?=
 =?utf-8?B?ekVPdmxpTkFWNXBtdzk5Z09SK2hVdFZGcHBxOElGVWdRSzNoUkxoVDliVTF6?=
 =?utf-8?B?cDY2WitXVnVmSlpFQ21HTVVmMkdKOTNKdlA2T3RuUzBIVDJ6UmZrRjJUT1Y1?=
 =?utf-8?B?SDhDbmNhTzI3QUYzb012YWtCN3pkMHNZQWtOSjUwemtXV2lwTEhlZzFJQXBw?=
 =?utf-8?B?MFRjOFRxWjlYNHJ0eTRoMTlpajlZako5a3RkODBadmpCZnZLbms3enBiZlh4?=
 =?utf-8?B?WHJwLzl5YmdRckhGOWpDWitEY0lpdWRNN2pvcHJWS3lDRkV2alNWRGRiaDMw?=
 =?utf-8?B?RGVvRDNpb1lUOW1UTkhnTllUYVRlTHBFTFJaQUZxOUt6TkhyM2Y3TUtHNmlx?=
 =?utf-8?B?RWlZVzdQYXpQWmVpWTNnbmk4TkdjTzhtOTFianF6eXFKMCtWYWZacjl6bXdl?=
 =?utf-8?B?Ykp6WnEvMUZDcktXaDVRcmQwb1pvK2JrQzJzRUZZenFXdXNpRVN6c0RVbWYr?=
 =?utf-8?B?MXdXUTdPZ1V6YmI4Mjh5ZTdjeDlwVENvbEFlT1BBYzdxZXc3Q1d3STdjRmJE?=
 =?utf-8?B?YXNYNERrTUJabjEzZWlIWDNNZElxUEtLOFhRYmNHRFAzeHVCYm81Q2Z5YUhu?=
 =?utf-8?B?MFp1d0JuV3dTQzA5Z3JCRlEzMzQ5a1ZRUVd1ZU9WZjhXb0wzUks3MUE4TU9T?=
 =?utf-8?B?c21JbVlENHJtUUQxKy9VV3JpUXRvQ3N5Tkhmc2dmV3NBRFJBaUxTb2JFN3R4?=
 =?utf-8?B?c3hSY1hhQ0x4bjN3b0tEZEczeWExenFIK1lnbjJqV25jeTcwd2N5V3dkMFR0?=
 =?utf-8?B?cTlvd0FVR0MyUzhUYjZ5RUhVMnB3TjFzajlBa3k4TVRRVndEMFNIN2R5ZHc1?=
 =?utf-8?B?cnBJaWc2akRwbEdOK255ZTV1RnNKd3RHUzJ0M1IrSi9UazJaZlo0RkVyQTVH?=
 =?utf-8?B?QVJIT1hyLzlVbDRsSmVKR3NvNlc4SWZrdVZQTG1EU0pGNjl2TVJDUE9qcmRE?=
 =?utf-8?B?Z2ErM09PRzl0M3RMYWoxYXBFd1BoNmFzeU80Z0p4YkdKek4yczhPYkdyUktZ?=
 =?utf-8?B?Qmgwb0ZTOWF4S0xiZmV6ZHptSE1RZWNIVS9zRXlYeWVNamJnNWxuNnVkbkcz?=
 =?utf-8?B?eVFFbG8xYkJhdlB3VW9qbkxRTUJiUGpkY2JSVS9KUGhpZXd2NjdjeUlMYnRO?=
 =?utf-8?B?Z3VjR1EzOW5wRWNOanp5YVZ5ZTdrTFZvTE1LeXB0Zm9vNWlMaTNwblJYM1Vo?=
 =?utf-8?B?TlA2b1cxb2k2NnJiNkx3eXpiamNXbmRwQ0FyY2VXM0FiYVRoSnZMTDhoM3Z6?=
 =?utf-8?B?ZkhNeHJPaXkwa2hEcUM0Q2lVOGhlTnQ5QldEL1BzWGdvL3lldGtFL2l1a2Fl?=
 =?utf-8?B?MVA0TzZEY3pnZThnMGhKN2krLzVYYWM0TXZhTEFlN3RWNkhHYVlvTFF3MTk0?=
 =?utf-8?B?TVdhek1VNENuZC90MjJKWmtaVjVZWEVnVU9Ba29weUNEK2pDbFBPR3JmZGFw?=
 =?utf-8?B?NnhyM2VINVJGbE9uSWhUUG1raWRDc0VtZTNWQS9iVkdxVUwrd3AvdVRBaUVX?=
 =?utf-8?B?K1IzOFdpRnFrTzE5ZXBlU1MzdkZRb3hqMWM3K0xmb3g1LzM2SXFYU0JiTWZM?=
 =?utf-8?B?ZStRY2E1OU5WR3I3b2lNMkd3NFZxWUtpT1NCcEM4KzZIWklkVVIzVm5Xbmx6?=
 =?utf-8?B?ZHplak9yQkRGdWNubDk5dzIxT3k0K1BNZEs2bDk4SFRBZmtGZExoN1ZMcmVP?=
 =?utf-8?B?YThtMHpRZmFrcXkxZ3B3QytzZWIyRzVnbU5UYmlDcUZEU0pIOU15WER1Q0M1?=
 =?utf-8?B?YlJsUS9IZXlBNGtuWlphbnBrUVc2ZGhNU1BHVStUR08rbnJmSXB5SWJ2MU1i?=
 =?utf-8?B?ZWhNR0U3RVIyeWJqQWQxTHpmY0hWU0RYbU9JazZLb01sQk5Hck1xZldLTHdr?=
 =?utf-8?B?TW5ZdmJJVEN0Qkd6NVcwL1ZFbjg3M2VKTWpXdzBxSlZJdlk2Tk9GdTBZODgy?=
 =?utf-8?B?enZ4N045bFovQ2ZCd2YrTnljQWxGbkhyYXByNSs1TVFuOWFqc3BhWURXekE5?=
 =?utf-8?B?dEJuUDVWaUFOSUJ5Y25JeldLRmJhUFIzTkdWS2F4SjMxSENDSXE4N0ZsV3g2?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b026e6e1-be8e-4c6d-0423-08da583659df
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 12:12:48.6550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R2LVjPJHU6RbAI6mDTFtazZknvjWydkQM0iLlEJSoRA/go3l4Q8EL3PzDVPV22Br0wsnvHS9a0AJK80/ImzVLYFON7RX+zErUec7n8JZfdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5404
X-Proofpoint-ORIG-GUID: TpSgc-LMGNo0l8SIyxUiGldBowZZrkIc
X-Proofpoint-GUID: HcWNfIw3flDSioQW-mSti-H3smGid1tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 12:12:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167318

--------------dlSGWEi0CYlocrfHV4TZ5MpQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 25RBN3E9020521

On 2022-06-19 23:09, Sundeep KOKKONDA wrote:
> Hello Randy,
>
> On 16-06-2022 19:49, Randy MacLeod wrote:
>> On 2022-06-15 22:19, Sundeep KOKKONDA wrote:
>>> Hello,
>>>
>>> GCC regression test performed on /Kirkstone/ with gcc-11.3 &=20
>>> gcc-11.2. The results are *NOT* identical. Below is test summary.
>>>
>>> *gcc-11.3:*
>>> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D=3D gc=
c Summary =3D=3D=3D/
>>> /# of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 126552=
/
>>> /# of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24295/
>>> /# of unexpected successes=C2=A0 =C2=A0 =C2=A0 =C2=A077/
>>> /# of expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 782/
>>> /# of unresolved testcases=C2=A0 =C2=A0 =C2=A0 =C2=A010/
>>> /# of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2760/
>>> //home/bft1/skokkonda/kirkstone/poky/build/sdk/sysroots/x86_64-pokysd=
k-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc=20
>>> version 11.3.0 (GCC)/
>>>
>>> *gcc-11.2:*
>>> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D=3D gc=
c Summary =3D=3D=3D/
>>> /# of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 125933=
/
>>> /# of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24215/
>>> /# of unexpected successes=C2=A0 =C2=A0 =C2=A0 =C2=A076/
>>> /# of expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 773/
>>> /# of unresolved testcases=C2=A0 =C2=A0 =C2=A0 =C2=A010/
>>> /# of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2779/
>>> //home/bft1/skokkonda/kirkstone-gcc-11.2/poky/build/sdk/sysroots/x86_=
64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc=20
>>> version 11.2.0 (GCC)
>>>
>>>
>>> /
>>
>> /11.3: # of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
26552/
>> //11.2: # of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
125933//
>>
>> So >=3D 619 additional tests were added and they mostly pass (as you'd=
=20
>> expect).
>> That's good news.
>>
>>
>> /11.3: # of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24295/
>> /11.2: # of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24215/
>> /
>> /
>> /So 80 additional unexpected failures - can you summarize what these=20
>> failures are?
>> /
> There are 83 tests failed with GCC-11.3 and out of them most of the=20
> failed cases (75 tests) are /execution /tests and the remaining are=20
> /test for excess errors/ (Tests with excess messages output to=20
> stderr). The Failed tests list is attached.=20



>> /Were any of them fixed after the 11.3 tag?
>> /
> Does it mean, do you want me to test on 11.4 and compare?


When it's out, yes certainly, but until then can you take a brief look at=
:
$ git log --oneline releases/gcc-11.3.0...
and the actual code changes and tell us if any of the
failed tests are issues that others have fixed.

Do you have the test pass/fail/skip/... numbers for 11.2 ?
If so, please compare the 11.3 numbers to them.

>> /
>> Are they related to one part of the toolchain or spread across=20
>> various features?
>> Are they reproducible when buiding outside of bitbake?/
> The test failures are from gcc.dg/torture, gcc.c-torture & gcc.target=20
> <https://urldefense.com/v3/__http://gcc.target__;!!AjveYdw8EvQ!b_lsS40I=
eXan8BPrk7uRlgocKqibMQVnhzcDoWw4Y4cAWykDtRGiBACxR9Ii9jcUyww-mrPYHPd2Vn-dS=
0pMqj_bvdyA_Xop$>=20
> testsuites.

Ok, that sounds like the parts of a test suite that might fail!

../Randy


>> /
>> /
>> /The other differences are less significant.
>> If you post similar data in future emails, please do the math for=20
>> people!
>> /
>> /
>> /
>> //
>>> gcc-11.3 & gcc-11.2 test summaries are attached.
>>
>> I didn't look at these yet but=C2=A0 thanks for providing them.
>>
>> Since we're not seeing any runtime regression in our Yocto
>> test suite, I suspect that we shouldn't panic but should instead
>> just work to understand, fix, upstream and monitor for future=20
>> regressions.
>>
>> ../Randy
>>
>>>
>>>
>>> --
>>> Thanks,
>>> Sundeep K.
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#166997):https://lists.openembedded.org/g/openembe=
dded-core/message/166997
>>> Mute This Topic:https://lists.openembedded.org/mt/91503792/3616765
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub =
 [randy.macleod@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux
>
>

--=20
# Randy MacLeod
# Wind River Linux

--------------dlSGWEi0CYlocrfHV4TZ5MpQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-06-19 23:09, Sundeep KOKKONDA
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4b1d26ac-6fe2-50cf-4cbd-23fcee49b0b8@gmail.com">
      
      <div class="moz-cite-prefix">Hello Randy,</div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">On 16-06-2022 19:49, Randy MacLeod
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
        <div class="moz-cite-prefix">On 2022-06-15 22:19, Sundeep
          KOKKONDA wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:10174.1655345951333043146@lists.openembedded.org">
          Hello,<br>
          <br>
          GCC regression test performed on <em>Kirkstone</em> with
          gcc-11.3 &amp; gcc-11.2. The results are <strong>NOT</strong>
          identical. Below is test summary.<br>
          <br>
          <span style="text-decoration: underline;"><strong>gcc-11.3:</strong></span><br>
          <div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; === gcc Summary ===</em></div>
          <div>&nbsp;</div>
          <div><em># of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 126552</em></div>
          <div><em># of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24295</em></div>
          <div><em># of unexpected successes&nbsp; &nbsp; &nbsp; &nbsp;77</em></div>
          <div><em># of expected failures&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 782</em></div>
          <div><em># of unresolved testcases&nbsp; &nbsp; &nbsp; &nbsp;10</em></div>
          <div><em># of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2760</em></div>
          <div><em>/home/bft1/skokkonda/kirkstone/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc&nbsp;
              version 11.3.0 (GCC)</em></div>
          <br>
          <span style="text-decoration: underline;"><strong>gcc-11.2:</strong></span><br>
          <div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; === gcc Summary ===</em></div>
          <div>&nbsp;</div>
          <div><em># of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 125933</em></div>
          <div><em># of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24215</em></div>
          <div><em># of unexpected successes&nbsp; &nbsp; &nbsp; &nbsp;76</em></div>
          <div><em># of expected failures&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 773</em></div>
          <div><em># of unresolved testcases&nbsp; &nbsp; &nbsp; &nbsp;10</em></div>
          <div><em># of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2779</em></div>
          <div><em>/home/bft1/skokkonda/kirkstone-gcc-11.2/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc&nbsp;
              version 11.2.0 (GCC)<br>
              <br>
              <br>
            </em></div>
        </blockquote>
        <p><em>11.3: # of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 126552</em><br>
          <em><em>11.2: # of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 125933</em></em></p>
        <p>So &gt;= 619 additional tests were added and they mostly pass
          (as you'd expect).<br>
          That's good news.<br>
        </p>
        <p><br>
        </p>
        <div><em>11.3: # of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24295</em><br>
          <div><em>11.2: # of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24215</em></div>
          <div><em><br>
            </em></div>
          <div><em>So 80 additional unexpected failures - can you
              summarize what these failures are?<br>
            </em></div>
        </div>
      </blockquote>
      There are 83 tests failed with GCC-11.3 and out of them most of
      the failed cases (75 tests) are <i>execution </i>tests and the
      remaining are <i>test for excess errors</i> (Tests with excess
      messages output to stderr). The Failed tests list is attached. </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:4b1d26ac-6fe2-50cf-4cbd-23fcee49b0b8@gmail.com">
      <blockquote type="cite" cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
        <div>
          <div><em> Were any of them fixed after the 11.3 tag? <br>
            </em></div>
        </div>
      </blockquote>
      Does it mean, do you want me to test on 11.4 and compare?<br>
    </blockquote>
    <p><br>
    </p>
    <p>When it's out, yes certainly, but until then can you take a brief
      look at:<br>
      $ git log --oneline releases/gcc-11.3.0...<br>
      and the actual code changes and tell us if any of the <br>
      failed tests are issues that others have fixed.</p>
    <p>Do you have the test pass/fail/skip/... numbers for 11.2 ?<br>
      If so, please compare the 11.3 numbers to them.<br>
    </p>
    <blockquote type="cite" cite="mid:4b1d26ac-6fe2-50cf-4cbd-23fcee49b0b8@gmail.com">
      <blockquote type="cite" cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
        <div>
          <div><em> <br>
              Are they related to one part of the toolchain or spread
              across various features? <br>
              Are they reproducible when buiding outside of bitbake?</em></div>
        </div>
      </blockquote>
      The test failures are from gcc.dg/torture<span style="color:
        rgb(0, 0, 0); font-family: monospace; font-size: medium;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"></span>, <span style="color: rgb(0,
        0, 0); font-family: monospace; font-size: medium; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">gcc.c-torture
      </span>&amp; <a href="https://urldefense.com/v3/__http://gcc.target__;!!AjveYdw8EvQ!b_lsS40IeXan8BPrk7uRlgocKqibMQVnhzcDoWw4Y4cAWykDtRGiBACxR9Ii9jcUyww-mrPYHPd2Vn-dS0pMqj_bvdyA_Xop$" moz-do-not-send="true">gcc.target</a> testsuites.<br>
    </blockquote>
    <p>Ok, that sounds like the parts of a test suite that might fail!</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:4b1d26ac-6fe2-50cf-4cbd-23fcee49b0b8@gmail.com">
      <blockquote type="cite" cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
        <div>
          <div><em><br>
            </em></div>
          <div><em>The other differences are less significant.<br>
              If you post similar data in future emails, please do the
              math for people! <br>
            </em></div>
          <div><em><br>
            </em></div>
          <em></em></div>
        <blockquote type="cite" cite="mid:10174.1655345951333043146@lists.openembedded.org">
          <div>gcc-11.3 &amp; gcc-11.2 test summaries are attached.<br>
          </div>
        </blockquote>
        <p>I didn't look at these yet but&nbsp; thanks for providing them.</p>
        <p>Since we're not seeing any runtime regression in our Yocto<br>
          test suite, I suspect that we shouldn't panic but should
          instead<br>
          just work to understand, fix, upstream and monitor for future
          regressions.<br>
        </p>
        <p>../Randy<br>
        </p>
        <blockquote type="cite" cite="mid:10174.1655345951333043146@lists.openembedded.org">
          <div><br>
            <br>
            --<br>
            Thanks,<br>
            Sundeep K.</div>
          <br>
          <fieldset class="moz-mime-attachment-header"></fieldset>
          <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#166997): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/166997">https://lists.openembedded.org/g/openembedded-core/message/166997</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/91503792/3616765">https://lists.openembedded.org/mt/91503792/3616765</a>
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
      </blockquote>
      <p><br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------dlSGWEi0CYlocrfHV4TZ5MpQ--

