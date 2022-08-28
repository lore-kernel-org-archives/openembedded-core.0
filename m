Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37915ECAAD5
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 15:57:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.60322.1661702235041293279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 08:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Ftv/hJV7;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=623952f52b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27SFvEhr009240
	for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 08:57:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=VSbqrAuMesZ2Z1L7n6U4jQdF4S5mGRTsKHtUrHLumu8=;
 b=Ftv/hJV7DiyZbfc50dH+Wc2giekN//iHkSiDVVbhiMcr75y7jgyTq+w38vtl32MH/3jw
 vs97oTY7lNXf+VBMzt8zYSUCoSj3Lww8xSZqPC16+ae9S2DKc9xIXGQpx+xWECTNG+IO
 gnTO06KVHo5TBpAtiKcYxJqCKxzs4NIvNDDIEP6gVWzf4PzFfO/h1AQvDKlkuwUT/pKH
 MdBSKwsqDu3cvtb5JnaRyXXikOFloMVFUyzqrREanHVRuIYvnV7zmXOMPdeYh0dxyERh
 PqWQ5GA1UN7z/dKfpv0LbtLWi2aq7tX9uizgULeh2UCDMssiM9jr1WXxiD9kaCl3QIDa rQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk8r1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 08:57:14 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27SFvEB2009146
	for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 08:57:14 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk8r1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Aug 2022 08:57:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3wHSer5O0g86kYfeq08SICAMYkypLjAXG8nC906oKNGIfIMWMRtBPAkCu4qIxC71NGwcjWc+S1YSNeJ4kpAtYL2mprNuEg8GmwgDD0hvQCt6n1i9j4djXOAVn3A+kgdx/76Qp+mmrZccZDxbpWeihPc1Id/sxA/lHazm70Pk1Na4EMYCwyj3/64tORJwezQnqwKSBwNGUhs/sr1dCmlTGaIKKNNR1mWSlwVpZyrQCejxQewCeTQ2EzD5WigIKok8JLamDMO+VmF1tJKp0Dp4YquMtGFFJB+A0JeQ7Rc1vAjLt+hku8TZI2LXs3920qbvo+DikYqfa59U7Vn1z4bEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSbqrAuMesZ2Z1L7n6U4jQdF4S5mGRTsKHtUrHLumu8=;
 b=gXtLayC3JK5wPb2KbD8UnVKJ3q22v/LBGiYppjiD/zo2c49+cF4rCqIo1Y+WAZejYkAb1fDOes7GjCqA29APQ0/SJzqOQBFp/UKhvc+HnrZqEeenCk/ILiwG+Qi17dWMsNRNIWk7eM8NB8a2kQUsl/bcG9bLFJyBt5DXTW0HgDSu44RzuqZeYfDIqQUi0YLBbGGfNrZJGeCS6Irvko9sLGhsSFs2vqxFCwaoFZrrnYGlm9wsZPNxeUIEfegcBsBSlco3YEPZaRYDqGzLqGh8i9pGAps7jeFVUE7WqTz1W4KZZLBVqbFPycZET/PiYbtaiRG9wlUdPfGVUPB3ZfpoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 15:57:11 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 15:57:10 +0000
Content-Type: multipart/alternative;
 boundary="------------jg2Q8cYu1NAbQV8qlEj9yuVB"
Message-ID: <a1338c71-475f-f214-7776-c3ee453e42ee@windriver.com>
Date: Sun, 28 Aug 2022 11:57:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe-core][PATCH] packagegroup-base.bb: remove wpa_supplicant
 preset from packagegroup-base-wifi
Content-Language: en-CA
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
References: <20220827050842.5781-1-f_l_k@t-online.de>
 <aa641d1c-5ac4-ae0d-b495-754ecf0121a1@windriver.com>
 <11VBHR.QPNRDRTYIU8J1@t-online.de>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <11VBHR.QPNRDRTYIU8J1@t-online.de>
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb627472-1bd0-4f77-d6cd-08da890df794
X-MS-TrafficTypeDiagnostic: MW4PR11MB6713:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lt8C2FKRBV6cZBXBnfzDZA9qcualxlKHazV76iQkQ/FUeicxRICjl0spAC+pd7oV7rvf29MRDyq1t6SxffvALS/WwXlShCoEslEdjAT4w3lGvZZqystrCpVR5uqwvwOQbBH1CfTUNgPGZRlO/tIeJnJb5eync7zdcdoGNiPDCau2XnRV8MBpp4GVhHQWlSYy3L7d3iWdbdWSVNSpCv48REcqVP1Ym/By+3qrE3Ng7RtSxjTux0Z33WkN0vnHr0/mel3rsWXWh+848yeysbHDubVMnsj3qy/dZuBGqRDgSwte5syFEJP18Yt1p28TbF0zNTpzFqZ4YLI1DU/uOqz4v/hGkNSFkvUPA+yGsLlP4wnMTZxeLCZX613636IjWJhcG0UtxUYPNKvYOUTrJFEoy+EK1a9czgsJflnAKq1c9Szv9phGxvFCClW1czc26aUDAwnVV1ccw+vpLsYECVwU8xAdX6ggnYI8JUnX44sVx7EZZnq+MRwAiWf7UjEmbmYpb9AHv6zDLPejLaSU5Jfubl3zZM+vFuPR/dn2+ehFIq+xgf4rSMSbpOOzpPCetSqjeb9irruBOJY6Cf1I/lXX3xyzv27cJ6qB/NimZgx2wbBHwAPnGz82RalX7IAqbL544VwJmFGERXsn69cU3HXAbyLCbDx7ObbEfz4og0VYVNskPKF9ioiRVSNqPHk4/qa/ELMoiK4C1iVm1NXpMLJscuYeQT6NgWzAVIgwao9jFe4iGbWdbNosMUt9a/E58e0Gr5V/ran5ed0oVKor3k7vo+B2fJf32G0L8ELSqk1ZY2eJjjPFzhXFWb/y7d4+33ghSuQSFGY7mKFPre7Yeec1U0/nXkPpjoefTjukPkd2IKg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(376002)(346002)(136003)(366004)(396003)(31686004)(5660300002)(21615005)(6506007)(38350700002)(316002)(4326008)(66946007)(66476007)(8936002)(38100700002)(6512007)(26005)(6666004)(33964004)(6916009)(66556008)(36756003)(8676002)(86362001)(166002)(31696002)(2906002)(83380400001)(966005)(6486002)(41300700001)(186003)(52116002)(53546011)(2616005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VU45VXNDVTVPc0I2eWc5U0t3dW5rWW0rdDVWTnJqZ0RjemZWVFZ5SGhpWFh1?=
 =?utf-8?B?TWVPRm9vRS9JaEdTN2hTNWpVeGFtUitMVWFldC90U2psVEFlWnl2YkhiVjBu?=
 =?utf-8?B?bEl4TjhUOFQvd1pWMEZTUkg4b1hmVnJpcDVGZ2xhaTZkMWthay94L3BBUS9a?=
 =?utf-8?B?Q09LdmtFakpPcmxlTXVmVmJRSS9JNUFhbGJOSHdSVHlPTG0xRnNkR2N4cUxv?=
 =?utf-8?B?eno1d0Y4VFhCcWhkVndSYnEzZGw5ZVRVTTF6b1pDQldCY2o5c0FhdDBPck4r?=
 =?utf-8?B?OVFJMGg4QXF2Ty9NVFM0MnVYbVp2eWdpVmFGOFZxMWYyR2FSRk1xT0dxN05L?=
 =?utf-8?B?L3QvVStkZE52UWhQUDIyZHZGaDlOM3dUUmtMaXpiMUhsWDNxeW85dHR2T1Q4?=
 =?utf-8?B?VFFrK2ZSeE8zWUI4ekE2ME0yaHNkZFRNSUJoLzh6ZHFVRDJOSE93NUFPVTM4?=
 =?utf-8?B?Z3MrUmVOaTdFeGQ1MGc0OCs0UnJ2SkZhMUdVYjRvVy9yUG1vMGRxOGtObmVD?=
 =?utf-8?B?OUNOZzVESENIVG1VRkhDaUFROXh4c1FJQzAzZUlxMm1TQ28wK2hYbi9JQlRz?=
 =?utf-8?B?bXV3d2p2M1FRQ2lCOVFwMEtpK2FDVjNuaVc5NTJTS2NUdDZyWWY0dmsyR2hZ?=
 =?utf-8?B?dytTOHlsNmlRYTJoVTlUQmN3a1BmaEdwc1RMZFJjTFdUczh2OTlNb0pvM2xH?=
 =?utf-8?B?RmhaQUpOdjhDdWhZKzZCZnVLSG1mTnlDQkdvbTZIbTlMa2dISTUzUGlHT21E?=
 =?utf-8?B?bVBTYTNHZWxPYllkTmI5RjlBWFZjc3JnZTJLYkI2ZUQzWWJ1RytWYjdsK0NV?=
 =?utf-8?B?MmtFLzFKSXgvZmE4NUhSaEtpWWtTdlowNkYrZ0k3Rmx1ejVLMTFrVTJhSEYz?=
 =?utf-8?B?ZzFSMWlSYWFEajhLV3JZK1ZuNXBiUlp6VGxzYXh3WWgvb0l6NHRpbm5Ndi81?=
 =?utf-8?B?V0tRODNZcVpGM3kxQTlhM1hMdEtaSitYR3NqK2JxRUljY0lOK2xSVFdIWnVi?=
 =?utf-8?B?OWtLUk0vUjJFbHNDWEpUZHpQMTdabG11cUdLL0x5Sk8zL3FvVGtCRSs1US9u?=
 =?utf-8?B?SlQ5RWFudzNzWXJZeDhCbmNRVFdCMVhKRjYySGczS05FZFgyNDVpdU1EYUxR?=
 =?utf-8?B?OVdDWENoTXpPakRtaGlqMnVKWUIzaG9nMHZlbnp0NUpTYjg1ZVFNUlMzcEww?=
 =?utf-8?B?VGg4VE00WFlwVnhxZ1VnYVB6UEZlNjdrdW1sZG5QZGpPSkVOV2RqRk9kOElv?=
 =?utf-8?B?ZGJDbml4YlcrMFhmUkNVaWQ2dzY0OHRnQURIbkJJY25pMVltK21lRHU1R1hV?=
 =?utf-8?B?YUU3ZkFQZThoUStON0gxelNOUTV4WGl1NysvR2J5R1dlcFE0Q08wQ2xFalFQ?=
 =?utf-8?B?dnp4aU5TTmxlMDNORWFoenMxbHgwOVJlKzdKSUd1NlkreHFEMUlvM1VUbEln?=
 =?utf-8?B?MnRXc2ZqVndudzF0OUUvelJoMlRodDlWazhPVW9XU3ZTRjZjcFE3VzBEOGhS?=
 =?utf-8?B?QWZHd3NMa0F3VlF0NVVlWC85NEowS0pHTTZKWUt4RzgvdGUvVEpsY05HWEo5?=
 =?utf-8?B?V1hJeEVmL0l4c0FPa000bGdsYjdwZUJsQnQvWTVpWlgzR3BJbjEzc1phYmxS?=
 =?utf-8?B?ajhHSVRZUDljQzhHamhqa29FZkRVT1NuNUVQVTdML1U1UlJzemJmeWV3bW4x?=
 =?utf-8?B?SjZrYTZ5a05DendwUjdScy9KSkVET3VackhCdTcvVjFldWlRNWFuM3hjUnpw?=
 =?utf-8?B?MjBBdDdzazdtNDc2OXhkT2hGb296NEl2ZUpaTWhyaVF6Tno1Y1l4QXdhT2dT?=
 =?utf-8?B?THpPM2twL213VWdReTFlbHhKeEFUSEhXcFNXRkM1eHgvOHJHWWtaZzJQMjdt?=
 =?utf-8?B?NHkxbndHdE9UUlJpM0haUDVmTWVTMzNqZFlNNXYxYzhsaXJYcTdVVkx5dDRY?=
 =?utf-8?B?eXljUTZLYmhRck94ZWw0QVdSRmFNVnIzOVdrTEs2ZllyREhhWWpQRktlRDBE?=
 =?utf-8?B?aFNnd1R2T2VzSytYK242UmdtckVNY3dqeVR2c3NKN1ZrK2x1OExHNTh2ZlVZ?=
 =?utf-8?B?cUVkTzVicVRUbWNwcHQvN0VBd1dVUlBGRmZOcFB5K202a0JjMGl5SC90V1dS?=
 =?utf-8?B?ckpBRkJ3YzJMVGpJUGk1UTAwcFZnNVIydmY3MXlTVVdTYnFqeXdYQ0J3UU9N?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb627472-1bd0-4f77-d6cd-08da890df794
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2022 15:57:10.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YBUKTptBpkr0r5jVZ/0Exn2cFeBpdGw66qH25ticM7b3PYUmJl6dWZGIs/ULFIqgCLvdopgrw7O6RbojMiWF++ckcshp4H2bsjOs3f9jGow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
X-Proofpoint-GUID: tHlQ0Fz7pCP5N2EGq6VOExaj72BixGwC
X-Proofpoint-ORIG-GUID: ZYNgMH3VqvvKYZv3qpaLRiZBGhZGNRVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-28_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208280068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 15:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169986

--------------jg2Q8cYu1NAbQV8qlEj9yuVB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27SFvEhr009240

On 2022-08-28 09:34, Markus Volk wrote:
> Am Sa, 27. Aug 2022 um 20:24:55 -0400 schrieb Randy MacLeod=20
> <randy.macleod@windriver.com>:
>> It's a little late in the release cycle for this sort of change but=20
>> if we do take it can you add a short list of some of the alternatives
>
> It's not a long list. Choices so far would be wpa_supplicant or iwd.
> wpa_supplicant is well known, so I'll write some information about iwd=20
> that I've collected in the last days.
>
> iwd is a wireless daemon written by intel and supported by all major=20
> network managers. It can be run in standalone mode and configured with=20
> 'iwctl' from the terminal, and with 'iwgtk' or 'iwdgui' from the gui.=20
> It can also work as a wpa_supplicant drop-in replacement for=20
> network-manager, connman or systemd-networkd.
> iwd makes heavy use of the kernel api, so it is not portable but does=20
> not need additional external libraries like openssl. Instead, make=20
> sure that the following options are enabled in the kernel:
>
> CONFIG_CRYPTO_USER_API_SKCIPHER
> CONFIG_CRYPTO_USER_API_HASH
> CONFIG_CRYPTO_HMAC
> CONFIG_CRYPTO_CMAC
Most of these config options are set but CRYPTO_CMAC is missing in the=20
kernel cache as shown below but it's enabled in 5.19 without an explicit=20
setting:

root@qemux86-64:~# uname -a
Linux qemux86-64 5.19.0-yocto-standard #1 SMP PREEMPT_DYNAMIC Mon Aug 8=20
22:57:25 UTC 2022 x86_64 GNU/Linux
root@qemux86-64:~# zcat=C2=A0 /proc/config.gz=C2=A0 | grep CRYPTO_CMAC
CONFIG_CRYPTO_CMAC=3Dy


# Save your list of modules to /tmp/iwd-modules

$ cd .../yocto-kernel-cache.git
$ git checkout yocto-5.15
$ git pull
$ for i in `cat /tmp/iwd-modules`; do rg -q $i || echo $i ": NOT FOUND";=20
done
CONFIG_CRYPTO_CMAC : NOT FOUND

Same for 5.10, 5.19.


> CONFIG_CRYPTO_MD4
> CONFIG_CRYPTO_MD5
> CONFIG_CRYPTO_SHA256
> CONFIG_CRYPTO_SHA512
> CONFIG_CRYPTO_AES
> CONFIG_CRYPTO_ECB
> CONFIG_CRYPTO_DES
> CONFIG_CRYPTO_CBC
>
> optional for wps support would also be needed:
> CONFIG_KEY_DH_OPERATIONS

https://cateee.net/lkddb/web-lkddb/KEY_DH_OPERATIONS.html

root@qemux86-64:~# zcat=C2=A0 /proc/config.gz=C2=A0 | grep KEY_DH_OPERATI=
ONS
# CONFIG_KEY_DH_OPERATIONS is not set

Not set in 5.19 yocto-kernel-cache right now either.

and not indirectly enabled either:

root@qemux86-64:~# zcat=C2=A0 /proc/config.gz=C2=A0 | grep KEY_DH_OPERATI=
ONS
# CONFIG_KEY_DH_OPERATIONS is not set

Someone can add a config fragment to yocto-kernel-cache if needed.

>
> In standalone mode iwd can use either systemd-resolved or resolvconf=20
> as dns manager. Additionally, dbus communication must be configured.=20
> In the default configuration, iwd expects the user to be a member of=20
> either the 'netdev' or 'wheel' group.
>
> As a backend for the network managers, I have only tested iwd with=20
> connman, which works smoothly and without additional configuration as=20
> soon as you make sure that wpa_supplicant is not installed. (connman=20
> will =C2=A0look for wpa_supplicant on startup and will bring it up if i=
t=20
> was found)
>
> but you only want the information from the first sentence in the=20
> commit message, right ?

Up to and including:

 =C2=A0=C2=A0 "... not need additional external libraries like openssl."
works for me.


Thanks for the great explanation.

--=20
# Randy MacLeod
# Wind River Linux

--------------jg2Q8cYu1NAbQV8qlEj9yuVB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-08-28 09:34, Markus Volk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:11VBHR.QPNRDRTYIU8J1@t-online.de">
      
      <div id="geary-body" dir="auto">Am Sa, 27. Aug 2022 um 20:24:55
        -0400 schrieb Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>:<br>
        <blockquote type="cite">
          <div class="plaintext" style="white-space: break-spaces;">It's a little late in the release cycle for this sort of change but
if we do take it can you add a short list of some of the alternatives</div>
        </blockquote>
        <div><br>
        </div>
        <div>
          <div>It's not a long list. Choices so far would be
            wpa_supplicant or iwd.</div>
          <div>wpa_supplicant is well known, so I'll write some
            information about iwd that I've collected in the last days.&nbsp;</div>
          <div><br>
          </div>
          <div>iwd is a wireless daemon written by intel and supported
            by all major network managers. It can be run in standalone
            mode and configured with 'iwctl' from the terminal, and with
            'iwgtk' or 'iwdgui' from the gui. It can also work as a
            wpa_supplicant drop-in replacement for network-manager,
            connman or systemd-networkd.</div>
          <div>iwd makes heavy use of the kernel api, so it is not
            portable but does not need additional external libraries
            like openssl. Instead, make sure that the following options
            are enabled in the kernel:</div>
          <div><br>
          </div>
          <div>CONFIG_CRYPTO_USER_API_SKCIPHER</div>
          <div>CONFIG_CRYPTO_USER_API_HASH</div>
          <div>CONFIG_CRYPTO_HMAC</div>
          <div>CONFIG_CRYPTO_CMAC</div>
        </div>
      </div>
    </blockquote>
    Most of these config options are set but CRYPTO_CMAC is missing in
    the kernel cache as shown below but it's enabled in 5.19 without an
    explicit setting:<br>
    <br>
    root@qemux86-64:~# uname -a <br>
    Linux qemux86-64 5.19.0-yocto-standard #1 SMP PREEMPT_DYNAMIC Mon
    Aug 8 22:57:25 UTC 2022 x86_64 GNU/Linux <br>
    root@qemux86-64:~# zcat&nbsp; /proc/config.gz&nbsp; | grep CRYPTO_CMAC <br>
    CONFIG_CRYPTO_CMAC=y <br>
    <p><br>
    </p>
    <p># Save your list of modules to /tmp/iwd-modules<br>
    </p>
    $ cd .../yocto-kernel-cache.git<br>
    $ git checkout yocto-5.15 <br>
    $ git pull<br>
    $ for i in `cat /tmp/iwd-modules`; do rg -q $i || echo $i &quot;: NOT
    FOUND&quot;; done <br>
    CONFIG_CRYPTO_CMAC : NOT FOUND <br>
    <br>
    <p>Same for 5.10, 5.19.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:11VBHR.QPNRDRTYIU8J1@t-online.de">
      <div id="geary-body" dir="auto">
        <div>
          <div>CONFIG_CRYPTO_MD4</div>
          <div>CONFIG_CRYPTO_MD5</div>
          <div>CONFIG_CRYPTO_SHA256</div>
          <div>CONFIG_CRYPTO_SHA512</div>
          <div>CONFIG_CRYPTO_AES</div>
          <div>CONFIG_CRYPTO_ECB</div>
          <div>CONFIG_CRYPTO_DES</div>
          <div>CONFIG_CRYPTO_CBC</div>
          <div><br>
          </div>
          <div>optional for wps support would also be needed:</div>
          <div>CONFIG_KEY_DH_OPERATIONS</div>
        </div>
      </div>
    </blockquote>
    <p><a class="moz-txt-link-freetext" href="https://cateee.net/lkddb/web-lkddb/KEY_DH_OPERATIONS.html">https://cateee.net/lkddb/web-lkddb/KEY_DH_OPERATIONS.html</a></p>
    <p>root@qemux86-64:~# zcat&nbsp; /proc/config.gz&nbsp; | grep
      KEY_DH_OPERATIONS <br>
      # CONFIG_KEY_DH_OPERATIONS is not set <br>
    </p>
    <p>Not set in 5.19 yocto-kernel-cache right now either.<br>
      <br>
      and not indirectly enabled either:</p>
    <p>root@qemux86-64:~# zcat&nbsp; /proc/config.gz&nbsp; | grep
      KEY_DH_OPERATIONS <br>
      # CONFIG_KEY_DH_OPERATIONS is not set <br>
      <br>
    </p>
    <p>Someone can add a config fragment to yocto-kernel-cache if
      needed.</p>
    <blockquote type="cite" cite="mid:11VBHR.QPNRDRTYIU8J1@t-online.de">
      <div id="geary-body" dir="auto">
        <div>
          <div><br>
          </div>
          <div>In standalone mode iwd can use either systemd-resolved or
            resolvconf as dns manager. Additionally, dbus communication
            must be configured. In the default configuration, iwd
            expects the user to be a member of either the 'netdev' or
            'wheel' group.</div>
          <div><br>
          </div>
          <div>As a backend for the network managers, I have only tested
            iwd with connman, which works smoothly and without
            additional configuration as soon as you make sure that
            wpa_supplicant is not installed. (connman will &nbsp;look for
            wpa_supplicant on startup and will bring it up if it was
            found)</div>
          <div><br>
          </div>
          <div>but you only want the information from the first sentence
            in the commit message, right ?</div>
        </div>
      </div>
    </blockquote>
    <p>Up to and including:</p>
    <p>&nbsp;&nbsp; &quot;... not need additional external libraries like openssl.&quot;<br>
      works for me.</p>
    <p><br>
    </p>
    <p>Thanks for the great explanation.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------jg2Q8cYu1NAbQV8qlEj9yuVB--

