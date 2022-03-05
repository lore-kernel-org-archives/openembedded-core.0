Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CA9C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 00:50:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1472.1646441428100954650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 16:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Kfdwom2F;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0063bd2280=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2250nmEB012379
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Mar 2022 16:50:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=yVu0KcKI/L1MqNv4zJoU98qERhG7QIDbfoMyTUbTytA=;
 b=Kfdwom2FwZlZNjZLT1Xb8hA2B3aJ7RIL2kB9jNSxL9N/Ie4oks4QeuirJV/pWFVWgPmB
 lWF6+UkwrM5qm4tOWp84mUhF3ZzCyv4irbDKFu2yDeh3jHvgi1e3O9R6rwkCx3YEE1GM
 JuCYvYindjcjTa/+0dQOTTOtQmHRU1Mv7odg1kv7r+7Zx14XrmVD2lkaofU2XKeTD7lK
 eMQflo1E6dkVXKwpwrCtW2vpwFvadEeaTMUCcboVY2/yvVBkuYW6Tr2doMykqsmSKc29
 20Zkg89TiZMzi+C3EI4rosTshZD9Fog7cluTRa8nL49p7O0TjjgF+NW/qrQjuOPaNzNE QQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ek4jms0t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 16:50:27 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2250oRD7013994
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Mar 2022 16:50:27 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ek4jms0t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Mar 2022 16:50:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6aCFi2g0gLPbPqPgtEO/qIDt6LowLLwzM+7/yxOu4JWLngKLORH+PQAs3kAJEP6zoY2pzn6oI0+NVjsZrjELHj/Q4wvXqmijofM4aqMQK0cH0vUDMKx+Z3zoAl+G3QC8JIDLXb8VkufHljAaN6j9hqOguuvS0jJRVB2dKyoMPB0LU8OYK8vA9u7hN2kh0NMR6MAf+U/2tYl4/yGgkkdgouOxMUhVUwjlV6zSBz3OM9SoyMz6XYsmKo9T/RYP3B3pQg+g7uFHNJgBYCMf33zeCmJBtSeDTM5v7a5HTnTwEHTUf4kcUofiDuU6BHgS2OkQ2RIUhzO/rXRAMkTURF7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVu0KcKI/L1MqNv4zJoU98qERhG7QIDbfoMyTUbTytA=;
 b=C2HdtV/5Tnq7BsOxCEY8UGcApTfdK0WOgE98vLm9K4DKU3ksQHDGdrzEoMOBVSliv1rZfWS7Df3H+7z1fohV61f764ErUzhJFRL5IaYcrzUFTWUWwJvxpjhCTe74vQI+Z3sD2TvVRgz7k4Vvo+hjOuHQhMwlQdSwF+Hd5gx2NtK4szQPRkCDVGU5KRwGwiDQaSQOlw0wuBNj1H0ntDokgrRwCwSiSlKrBWruLKDccOxqZVsr8rqGpdgLYfGsIPODWeGf8EZeAOs21J29plloHExmGyW5+lzt/zMWAe1gv69W2fZgm6Zj4MFq5nzNFiclbrp7YzpbzsVCtmTm4MLiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN2PR11MB3997.namprd11.prod.outlook.com (2603:10b6:208:13b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Sat, 5 Mar
 2022 00:50:24 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91%5]) with mapi id 15.20.5017.027; Sat, 5 Mar 2022
 00:50:24 +0000
Message-ID: <17cbb4de-0ca6-1ce7-9754-979f1c850688@windriver.com>
Date: Fri, 4 Mar 2022 19:50:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.59.0 FAILED
Content-Language: en-CA
To: Khem Raj <raj.khem@gmail.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Pgowda
 <pgowda.cve@gmail.com>,
        OE-core <openembedded-core@lists.openembedded.org>
References: 
 <0101017f50e03108-050c414c-790b-4c05-8b8d-daf41cff5a1b-000000@us-west-2.amazonses.com>
 <ee42785d-ef25-fcc8-1b2d-c1dffbc0cb6e@windriver.com>
 <CANNYZj9YmuQoMUgskuxqOqk=QRBpMWAGxj7soQtZvJ-uwtA1EQ@mail.gmail.com>
 <CAP9ODKoxHMbmLnS38f+9TO0edcwmpPJ+MFDmtgskZG3iAJiWtg@mail.gmail.com>
 <CAMKF1sqXH9mQwbR-HrcQCadL_U14KZz4B5q3iHyBXpS3aBtVtg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAMKF1sqXH9mQwbR-HrcQCadL_U14KZz4B5q3iHyBXpS3aBtVtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b49671ae-b46e-4f3a-be65-08d9fe42223f
X-MS-TrafficTypeDiagnostic: MN2PR11MB3997:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3997656F1972EEDDF42945CBF8069@MN2PR11MB3997.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SAvkU+OeRaeW3qOu1hPKPhR7WN/Oh84IcO3v2ik4N8veOiZTQwDxMuapOfTN5w20I4/4AGh0REt+CCx4vT+vLJFuOi39NNqlbKjeae9XC2PTAhV+FF/ewD9d6R6inQnNVM0To3K7R2s8zafjBQY+N4ajtcPez5SmKc0zlotwbh4xp3NstL4fhpnShUvKdyDnz1MZgN0RqtIxxOxkvIu40oxl05zUROyqPEwCLiIqiy6r1gWglGxIjEAtVwWkzT7ooJYSVY65akaxjVbX/xqLTNBy5qHEcbPRRTDX2mUBbKPPLlKl5GlyKkedvDGQyndF1qyu0nsb5F/z/eEs4+rQG7IynvxeAOaRRsH1JyNoLLXzJsM7H8XRXAGRd8+mXKJb/En916DDnxzrn14RLNewNGQ02Pt+ngk7vkjgoEd4nHDrBttE1xM2479Jwhcr/jknfeKqT0EXyllz9tCqnH00P0s7bC3BLq3w0PG6X+UCl2m32CBYMTlybegWBDofNCHQxHX1YrTPHwyG0bGlC/RF63/8ho+4w8Gix25VRc+BlaXueyaINmJsw/rKcgZaE7o5XjLi+aiDMInisuekN22C1bEqFGrWQJOeGo2gkYvxZaQFIzGg3V6tW0px+68aiflCaIDjOuzwDIMGEywWBeAVUh3uczQb8DgBi9XKrVfPBn4HfZf2GiUA40ZVCtY5nGkSDsjQnuhSMBpa1E5mPLB+qC2ClYkEDO1gwP7QbgzMYMEYo85xpANw59KJMZxypnJUGMsUtiKy9ciZMxsDWEBjb3mQNcYe3CqaynQPcT6h+4tjBWc5+pxaL6OBjJOK/UWYdSnGclVmyGbvgcl7UIcAe1hOQVRrDbw35QGgOz8y9BTPQIRdtAOV7lkrQO6ozdLBenFTl64xbt4HNk/L67poLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(86362001)(6486002)(966005)(508600001)(66946007)(40140700001)(66556008)(66476007)(8676002)(110136005)(316002)(4326008)(83380400001)(54906003)(31686004)(186003)(26005)(2616005)(53546011)(6666004)(52116002)(6506007)(38100700002)(36756003)(6512007)(38350700002)(5660300002)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TlhNcTJuWkRsMWN6dkt0VCs3dDhKSGJaVndqTkFIbmZXTlh0QkVKeE5yQmdl?=
 =?utf-8?B?NHlGUU1oYnordW0xUzBHTGsvZ2pCcmRyc1o5NWErMURGbWtxV2x4LzNiMXF4?=
 =?utf-8?B?dTZqaVYveGtmZWZjcC9IYU0yazltZE9BTjF3VUZuSkpHZVArd0hWTHlhbzRI?=
 =?utf-8?B?VTFxNVZMTkU1ZXZnbnRDeGwwdWh5RittbWI3WWdHM21xOVB1MnhKRHVVMDZt?=
 =?utf-8?B?U25pYU16anNXZWx4Q3llZDJkMkJLbG5pSnNycHhZOGdWQWZ3eVpxN003bTlE?=
 =?utf-8?B?LytweUhCSlVQbEdMSC9nK0JlVnJTMnBKU1NDbmFmNGVNR254UzMrZnZLbFNi?=
 =?utf-8?B?eUZWaG4vQkoza1pteHFneEt4MHRWWHFVYm52YkZLOHg2VFUycE12Q2NEZzN1?=
 =?utf-8?B?ZVZ1OFRSaWtKaTcvNjUvUHpPcXpJelRUUk14TzB0d1JpaENwMndwandMSXQy?=
 =?utf-8?B?TndkUStVMHk2Z293Qy9wTXR5Z2VTS1Rhb29FcXpWRnBwSUhqRnJlUjV6Unlv?=
 =?utf-8?B?SVFhSXBZcDdqV0JlVFQvU3NHaDZraWk3QTNvek4vTFdsRW9JeGQvM0NMeHFn?=
 =?utf-8?B?Ti9oVXlSMUI1dDArUC96eEdJd3VSS3RndEZsL0wySFljQ2FKbmx2dnU3Z0Zz?=
 =?utf-8?B?S1VtYmNvZSt1RTJuSXE4V0FselBHYjZXbGFhWkRVTlRlZitMZEdneW1FWjhF?=
 =?utf-8?B?SUpFd3ZvbHpIOFU2NjlaK2ZVc2VhRVJvWjBWL0Z5UjdXS25XQzcxS1FVUms4?=
 =?utf-8?B?enZ1ZElDVU84UVdGV3REaXJCUlZndUdFdWlWRWdNLzRCL3hwTjU4Tzk3THRv?=
 =?utf-8?B?bmFuclJ6NmtxMXFoTlVIUmFzRlhLbC8rREdHZDEwcjJzVGVreW1sVTBFMkRS?=
 =?utf-8?B?SUM3aGt2NDNXdThWT3gyejAxbkYzZlhtNDJvd1Bqa21mMzl1S0VyWjV3dFRQ?=
 =?utf-8?B?VUZHVjRLeUh4Z29HSzFqU3VTU0hZYXhSa0FtSnluUWhsUUR6WEVEZHRRTU1E?=
 =?utf-8?B?MGVyRzNvUDVyUis5MDl4WmNHdll2WnhuQklSa0M2dUxNa0xjUk5rSHJJK25t?=
 =?utf-8?B?Q21YWEU0ZU9jaTZaTU1ydkZqR2NoUmhvazk3NisrK3VHdUJBdFhHcEdGN3JS?=
 =?utf-8?B?dXZESVM0UWgrSE9ENTN5SWtaWVM2QmxEN0pPRlBnTC9Id1BDUUtVTHNyazRm?=
 =?utf-8?B?MG1VR2RGTGdvTWx6MVR1dU4zWVEwaXU3NHlXa3ZNQkorVjZHN2RZRUN5QWFt?=
 =?utf-8?B?MGFWT1lKaXRyeXZBdy8rVGhUMjNKdVpsMysxZDdIcFl0blhWSUs4UWlhWTFj?=
 =?utf-8?B?UDJJY0NaN1Eya2wyZ2VURzNNSWozWTZGQWlFYzRYaUdDUk1kMVJQcGtUY0NC?=
 =?utf-8?B?RGU0blpQZlI5VERCTVVlYW8rZ3VkS0oxeVZMTDBwYTJKOHpzT0RUemM2dHFr?=
 =?utf-8?B?VkFOMVpKM3pHTVQ3OUhrMFUzUWZCM0ExYmx6UjJhNkFPNnhVWE1Bakd2VzNO?=
 =?utf-8?B?blVMT0NrU3RkM25BNWFIaUtsRWpRUktCdXExOXk0QTRhd1puL2RNVDhNMEEw?=
 =?utf-8?B?YVkvb3ZTbVhnaU9tRTR2dWNxTVpuSUJOMmhVUVBsQllQR05SVXNCNnZzVC80?=
 =?utf-8?B?V1RMcWJJaUZobXlhcWo1NkI0RG1RMXppUkZmK2JJazZqMC9zcEtxUFQ0aFd2?=
 =?utf-8?B?NHp0TXlkSm5zdVJYSHgvZmNoVkJEYVhpNnVWV3EvaUZBTXhPb0c5QWQyclNu?=
 =?utf-8?B?TVVNdjBTN3JOK3JwTlNwWk9uMjBLcnR4Z1BGUm1nSWtBaXFucUpGYUpLT1VN?=
 =?utf-8?B?Tm1VUnZxbVJqQVRXVGdCM0Y3c2RsSlkva0ZoRkFMOXYydFlNQTl6eTlYWWFM?=
 =?utf-8?B?NnFhMVR5bE83STI5aDFuNEFXZnRXNWJ6WnZ4RGlJVWVJZWc3cWQ4ZDBKNUxR?=
 =?utf-8?B?MzlDNlp2QnJrWTZSOWpVcDdUeU1ORHFuNHp2K3Y4TFVuTmduRkhzaks5Zi9v?=
 =?utf-8?B?S1RTK0FJTGErb1lEbGplSit0MkxXdHdQMExWWHp3bHNJOGdhMzE5NStPbXI2?=
 =?utf-8?B?UTNRMjBCNFdxSE03blAzaDIvY1pvNWliWitnb09UMHJFdWJBRHVqaGRBei9t?=
 =?utf-8?B?MUNmM3E3cHR2K3ZSSnFZMll4L3ZVMGxxNWErQXBxTW5NaW9wQTRiRHh0a1lW?=
 =?utf-8?B?WlJWR3FSNE9ZQ2ZRVE1RVldTYkpXSnI0VnZoRGdaNkdFSWRpOXdqQ0NoZmtN?=
 =?utf-8?Q?17lCbASdfkZXTCD8Qe4tkCdgWYNKAcWR3IJAN0Dsq8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b49671ae-b46e-4f3a-be65-08d9fe42223f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2022 00:50:24.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n+HtRyAPu6nEQikfpHPRdbY5LsnuTYNajYrz+RucQqCMd0VHN+QD+aqhBybibwA+kS+WTktJ82necaCILjdc/ejWwndtbAJB1KTah2Px8OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3997
X-Proofpoint-GUID: hk6FTu-H8NwhEEyF5CuEIqCyq1cSJb9b
X-Proofpoint-ORIG-GUID: Zo79KOUWEV8VmvMtT0_HqoxxmY_Lhnrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_09,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=613 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203050000
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2250nmEB012379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 00:50:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162764

On 2022-03-04 16:10, Khem Raj wrote:
> On Fri, Mar 4, 2022 at 12:56 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Em sex., 4 de mar. de 2022 =C3=A0s 15:04, Alexander Kanavin <alex.kana=
vin@gmail.com> escreveu:
>>> Rust is a low-risk item from feature freeze perspective, so I already
>>> queued a patch. If a-full is ok with it, there's no reason not to
>>> merge it in my opinion.
>> I agree; it makes sense to upgrade it (even during the LTS lifetime) e=
specially because Rust compiler isn't long term maintained so we should c=
onsider it.
> Its not end of world even if its not merged, given the rust compiler
> cadence we perhaps will have a mixin layer for
> it for kirkstone few months after release.


My approach of drawing an bogus line in the sand worked! ;-)

I'm fine with upgrading to 1.59 or staying with 1.58.1

I have been meaning to look at how other distros are handling
Rust in their releases so I looked at:
 =C2=A0=C2=A0 https://pkgs.org/search/?q=3Drustc

and Debian/Ubuntu/Fedora seems to be sticking with the
"ship a version and stick with it" model, unlike say chromium
where the policy varies a across distros.

As Khem points out, Rust is under substantial development so
a mixin layer might make sense for some; we'll see.

./.Randy

>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#162757): https://lists.openembedded.org/g/openembe=
dded-core/message/162757
>> Mute This Topic: https://lists.openembedded.org/mt/89530593/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux


