Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9278FC4829A
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 00:58:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31372.1707872323534140827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 16:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=eMUcADQ7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2774398e6c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41E0wMB3027234
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 00:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=t9MYogch4yhQLl5Faxb
	X5l6/1xdqlIHqSsY9/OeWETI=; b=eMUcADQ7uYWYmvdLgxg6kARFaUBye69Wc2X
	+H2kme0lyJ1ufPNn9trBVoEI5Xgv7QFsELoJDIZZGSRwAg3ILa3WFdWi5LJreG89
	bouVMymNaAou+uVeSaCr4bpOT4QGpFFi4GoyOvqVKeEet8RA5EMlWZy4ejdoNEJq
	4QqC4+uHpRh6e+wJ97zJ8+hFmEwdZVC185/K3R0WSJeqd7QBjmj61gs8gC2QWwyU
	7mXlDzIInde5Txnssnw9VHM8+2Xe1yW3BiTg3otLVtFNCs2anM+92URlIHcNNSTD
	36FFzG/tEzRp72O6ZqS1DkssoVeDUTPU12jnLLCdZctP9bGQOUg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxubgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 00:58:42 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41E0wg1d027610;
	Wed, 14 Feb 2024 00:58:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxubgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 00:58:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I70ReV2OKPJGS1MPOf01KBFBJIeFrdoa5PWCQKHj9RXwE3wU6DUEgteCLuWh8nRYZWAqeuZx0dAZyumxnEffAxZIQlBoG8bP45V4wtfRAvt/GYFKouSm/aCAWp6kR4dvACG7uMBwEIvtAYypBbQSqRn/RVmu3NK2OW+L4jhNQOppy5xZIZm4XohM8Ru0VoNw9nm2txqico2gyGmCXpIBckLGa2mXOLYHo5Ag9ATm4LjV7rACPhqwRGZepneEMbRCDNAB238pBQYxWC9ycVcuE2flNgyH8hFURUAlWYKZGx6MLQtduDXz9Shp6tJRO+D+PmyFQgw2WDBWEjmJGM5wqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9MYogch4yhQLl5FaxbX5l6/1xdqlIHqSsY9/OeWETI=;
 b=hrRATKNtjRxpfex75wskBM39oMAnLfRuWAqPZNiuTV+1DQFQwPWjCQ4s+wc7naHld3kwR8M/bhAeXc2iPtZYLqC3a3U5XEDzFBlB8uamxc8Hgv1/JG0Nhp799YixP+ShneIMFfeBq8blsH63tqsBFrD32kFS7Wi2cVo0JoY3/u0bfR1xhfGVf+5I/J4O2K3cPqCFPGpzyK+NdJ2dHDHXWqzlPHkLNNxAYATKBCjDogg0YNOhiOuIjYR3ZF1IA6ehA6tlL1ZW5J5ka5olgU0x7tydXiYYo2v62/bKzhPq85cY9pOqzWGxySwhbMp/Rx+JJrTXG9vO2xYmSCOMH08LPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 00:58:38 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 00:58:38 +0000
Content-Type: multipart/alternative;
 boundary="------------RqSwUtGO0dMoBxbeNvRSL4br"
Message-ID: <7cce68f8-333c-4854-bd65-df213c55f172@windriver.com>
Date: Tue, 13 Feb 2024 19:58:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
Content-Language: en-CA
To: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>,
        Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "rwmacleod@gmail.com" <rwmacleod@gmail.com>,
        "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>,
        "pgowda.cve@gmail.com" <pgowda.cve@gmail.com>,
        "shivams@gmail.com" <shivams@gmail.com>,
        "sundeep.kokkonda@gmail.com" <sundeep.kokkonda@gmail.com>
References: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
 <CAOSpxdbXC2D4iiUx8950bKHF1ajCOm1ijbazrkqKADNqdZnpOA@mail.gmail.com>
 <42f67a75-53c6-4b8c-891e-f2c33e74f1bc@windriver.com>
 <CAOSpxdbDg1TN12hpTrMpxf=VnL9D61v3ReKxLz-qrjdm1tsoTA@mail.gmail.com>
 <PH7PR11MB6449A5A0159A47FA7EE247228D442@PH7PR11MB6449.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <PH7PR11MB6449A5A0159A47FA7EE247228D442@PH7PR11MB6449.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: aae419f0-48b8-4e4c-4b8f-08dc2cf8140b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S8D736Yhmn55Yn/7C6MJmC+APZ5j8SBHt0wLTbjMbvhN75hrYD2zC4dp95yld2+jKXDrf2+wvHkhT9KmtMRCL+aYJRaq3s0iX1QuOqmjS6o+7CYAqr/UUeUY1jKygCdcRLgoBaz374ru6SNLyAZHUQykVHRujphzwUyd0qcE4GxNYUSjbHquxJME6jp8qGik/Q1wL75VYtHDgwpNB/StevMViapo2dDsBrQ43tBVHyjBuojyE4yd58UiT8DVJlannz4pCLrk4uRxDpnBapvToanI4PT4RX0P6mD5sNIg2uUlCZObFdde2NgTa5fA+KyEJhdd9o5QNScxeQEOIG7K6pklWFqPMoeeayYMg1ZBmsGPPUc56ziBnQ7kywxiPOsLenxRdPklOGntH1B//nVVGWpQBl/SuTq5+EeqUtZ6HS+v5uDmCZIvbll74q3zOikJB0B8shHl0JX3oMB0aDQzyYd2cjs31YZ3ej6+CXPb9XoCDwSktyouUhKtPb/F/fkU2Uq8AuaHbw9IRFVDLPwdeE+GVmsq1xtfViYlIF+ySnoNI9/fwvwneh7EEFtGZ16IY5veKl8NXQ5pMfKoFc1wkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39850400004)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(2906002)(478600001)(53546011)(6486002)(6506007)(66556008)(6512007)(8676002)(8936002)(5660300002)(4326008)(26005)(66946007)(66476007)(36756003)(41300700001)(2616005)(83380400001)(110136005)(38100700002)(31696002)(33964004)(54906003)(966005)(6666004)(316002)(166002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akxaaC9POTVOYUJ3b3NpOE1GdnE4MENmcG1QUmFseHdRRHBaRVFWUVluWnNp?=
 =?utf-8?B?QTR2dE1RSU9SakFsV3VFb3Z4Z29FR0ZRbFllQlZVUG55U1hjVngxcjVmU1Ry?=
 =?utf-8?B?emhEeE44Z3BYdGRKOW0rVkFuZ01GSkVmcGlEZC9iSFljSkJDQ3gxK1Y4NVlo?=
 =?utf-8?B?VjBPZXJPanZaNmoxMlpVeGI4YTFSOEp1K1BYbnBQUUlIZ0hFS1NQUnUrVUJ1?=
 =?utf-8?B?KzVtNSthOHhXUFpuZ3E5YWI2V0hwQmpWaTRiVFN0N1pQb2c4VzdsM2dmL0E2?=
 =?utf-8?B?STZieDFGRFh6eFJVM0tycTRCY0w1c3NQRDhrbjhXSEFaS0RvWU84TzFXOFZI?=
 =?utf-8?B?a3ZxZm04b1RwRHhzbDAvM0lXdUc0aGZraVVQVSt3czNsdXBoanBwSTZPaUtq?=
 =?utf-8?B?TTBiZ29Fd3FwSG9ieFRJcEsxaXhZdUFVc1lsTEJGcjlHNHdGdGFHWlE3MHZa?=
 =?utf-8?B?azQ2RXdZdk5YMjhKakJzVWZvSUdCSEJ6bnlEeUFQWmljY05NaWdoa1B3cjUy?=
 =?utf-8?B?bzBnR0VhTXIzTE02aHhlQ2U4OVRuSisycjdCeXlYRkh2aGcyZnRLeFhYdmxM?=
 =?utf-8?B?MDNvTDlOL0xKNGJ6QlNRSFkxTzNMckQzQ2hqSnNkcTA4ZXlGVjRweW5TL2Ft?=
 =?utf-8?B?SjJydHJ5cXVjdTJuK0ZXRFdLNE8vd0FkYi9UZmdCNFA4R2Q5K2NTSGZTNW1h?=
 =?utf-8?B?UFBpRlVsM0lhcTdUYTk1SERtVDF6NW9tdDIvS3FFRFVUYmo2TXRYSVgyZmg1?=
 =?utf-8?B?cWdlbUhGL3hiRUNrN0o2anFOVktLNzhEUmlCejllRUxmemFiVkthOG82djlo?=
 =?utf-8?B?dXd0cWhrN1pUTDA2cXl1Nmw1RWVVNzFXTUZ3T3NJZmxvcUs2c0xrako5VGcx?=
 =?utf-8?B?bGZ3OU9Gc1I4VkJPTHowaEhyc2lqdEFJTHVXd0F3a21lQy9hT1JMSTdydVp0?=
 =?utf-8?B?VTY3dUxBOFJzRVhBdFlYaW4xZFFhSnlqZStYNTlHWHZRSi9oS0E0WUV6bFVz?=
 =?utf-8?B?Znp4SDNsaUF0NmpPaGpKMy8yTHJjcU1jbWI2NmFsaTZnVXlTTTlKTkdEcjlD?=
 =?utf-8?B?TVFMQXd2aUo1Tno1QzBrUXpBNGI3cUNBZytBcjk2WVRzbmJpMUVvekJwY3U3?=
 =?utf-8?B?UTVLakRBZEV4eExCR0xYTW5rL3VveHJ6L2VGQzZOTVZhcU5TdDJDZ2N2TmYr?=
 =?utf-8?B?cnppK09ucnQ4aWJTeEV4OWVCcEFRb0c5U092ak5CSDhGTTg0ckpNRHJXZVhu?=
 =?utf-8?B?T1BjM1B3UWpEdHVtU1VTQ0RzWFBZcDVaR3VQR1o1RzAwYmdHSWNFbmVLaE04?=
 =?utf-8?B?N3FRbStJeDJoTFZ0SUlGcVZzSTVNVXh4SFBRVi9GMmsxbGFRYUtwOW1HcGFC?=
 =?utf-8?B?OGI4S0FOeWp4Wkk3c2JWY3ZiZGNWb3U4UnkzdDNCUTMxNWZoZ0ZwclhsOEYv?=
 =?utf-8?B?NzlKL2VRaFRLcFlFQW45ajk2UWRYblJwVFVRN3IrNkloQkVuT1VMQVJqZVhY?=
 =?utf-8?B?QURMQXJNVzFiQVoxOXJUdk1Sc1hYSFhhT3NoV1N4QVFFbG93OENCL0ZJQjlP?=
 =?utf-8?B?SXNzZjZlcE04enA5dThVWW5sOHpiZ1VoMzVGN00vQnYvMXNjSDExOG94dGRq?=
 =?utf-8?B?VUJCYjJ3ZlRzTHowRUh4VXFiMmdpczM4WDdOQUhPNUxjZlBCVys1aGNsSFYw?=
 =?utf-8?B?ZDNxOGcxRDhRNkZ3cUtKTGdVTDhBMjVhSEhGMUttSFlma0pscW9oWGxLNTI2?=
 =?utf-8?B?WllyY3cwNCs1WGl0TnpucGpNYS9CNXVKanNnc1RvNjdNZ2FaRjhKeXBlZDRK?=
 =?utf-8?B?L3BPcjcyNWpTbHMzMVpmWWkxU3RZeWZpUnFHMk9lWXdCNmp3ekRlNk53dWVo?=
 =?utf-8?B?WFFlbFplZ2wya2FnZS9WejhXTWdUUEJta2FCeGxmM3psQzF4SGh2MW9qdGhG?=
 =?utf-8?B?MElvNjNwQ0pXdkprVi9sQ0I2NjVyQ3NmUnBwWjNOc0xtR3RFSEtWQXo0eUQ2?=
 =?utf-8?B?TEdMMEJPdkpIRjJVM2lpVzJqczFPbERoRDJ5aFY0cktrUlhiTU5jY1NnbmxE?=
 =?utf-8?B?K1MzLzl1dk00UEpLOGhWQ3NUZmcyOU9YV1lHbG9WbzhybHp0OXlPU3dqeE9R?=
 =?utf-8?B?KytKdFhHbVZiMkVzRXF5ZUpTYnV1RFJac0NDc3RDZDdpTm1wNWZCY3RKMHE3?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae419f0-48b8-4e4c-4b8f-08dc2cf8140b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 00:58:38.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlgKq29jnCMMt5e5mcwkoY+vExsmw8vbL0MSTPIt2laBMxZ1t64jN6R81cGBw88ctidptacKUFtyfNYULiLEvr7g7ZXgWN1MLp68qPz0XRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-Proofpoint-ORIG-GUID: 3K5FekvksTckCa0B4yq9R04g3F7TUfc1
X-Proofpoint-GUID: Kgd1RrFNTL_yeNyjiyQSuFxnD7WX1gEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 00:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195448

--------------RqSwUtGO0dMoBxbeNvRSL4br
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41E0wMB3027234

On 2024-02-08 5:44 a.m., Hemraj, Deepthi wrote:
>
> Hi Randy,
>
> >>=C2=A0=C2=A0=C2=A0 " Fixed by 58abdf88782 (and follow-up patches from=
 mjw). "
> >>
> >> Deepthi,
> >> What can you find out about the "follow-up" patches?
>
> Based on your comments on the follow-up patches from mjw=20
> (LIN1022-5854), these two patches were found.
>
> https://github.com/TOUCHTHEARTWORK/binutils/commit/91df9a6f810bca02883d=
ae9275715b4960ea02f0
>
> https://github.com/TOUCHTHEARTWORK/binutils/commit/a6ce491c3d9266504079=
27a338d9678ca983bee4
>
> However these patches modifies the error messages and does not have=20
> any affect on the code. Hence they don't seem to be relevant for us.
>
Okay, thanks for checking and it seems there are no additional commits an=
d
Steve has merged the fix to kirkstone so we're done !

../Randy


> Thank you,
>
> Deepthi H
>

--=20
# Randy MacLeod
# Wind River Linux

--------------RqSwUtGO0dMoBxbeNvRSL4br
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-02-08 5:44 a.m., Hemraj,
      Deepthi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH7PR11MB6449A5A0159A47FA7EE247228D442@PH7PR11MB6449.namprd11.prod.outlook.com">
      <p class="MsoNormal"><o:p></o:p></p>
      <p class="MsoNormal">Hi Randy,<o:p></o:p></p>
      <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      <p class="MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp; &quot; Fixed by 58abdf88782 (and
        follow-up patches from mjw). &quot;<br>
        &gt;&gt;<br>
        &gt;&gt; Deepthi,<br>
        &gt;&gt; What can you find out about the &quot;follow-up&quot; patches?<br>
        <br>
        <o:p></o:p></p>
      <p class="MsoNormal">Based on your comments on the follow-up
        patches from mjw (LIN1022-5854), these two patches were found.<o:p></o:p></p>
      <p class="MsoNormal"><a class="moz-txt-link-freetext" href="https://github.com/TOUCHTHEARTWORK/binutils/commit/91df9a6f810bca02883dae9275715b4960ea02f0">https://github.com/TOUCHTHEARTWORK/binutils/commit/91df9a6f810bca02883dae9275715b4960ea02f0</a><o:p></o:p></p>
      <p class="MsoNormal"><a class="moz-txt-link-freetext" href="https://github.com/TOUCHTHEARTWORK/binutils/commit/a6ce491c3d926650407927a338d9678ca983bee4">https://github.com/TOUCHTHEARTWORK/binutils/commit/a6ce491c3d926650407927a338d9678ca983bee4</a><o:p></o:p></p>
      <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      <p class="MsoNormal">However these patches modifies the error
        messages and does not have any affect on the code. Hence they
        don't seem to be relevant for us.<o:p></o:p></p>
      <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
    </blockquote>
    <p>Okay, thanks for checking and it seems there are no additional
      commits and<br>
      Steve has merged the fix to kirkstone so we're done !</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:PH7PR11MB6449A5A0159A47FA7EE247228D442@PH7PR11MB6449.namprd11.prod.outlook.com">
      <p class="MsoNormal">Thank you,<o:p></o:p></p>
      <p class="MsoNormal">Deepthi H</p>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------RqSwUtGO0dMoBxbeNvRSL4br--

