Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF813C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 05:39:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2213.1677044353115512100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 21:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Zv+lLnHr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1417fd3ed4=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M5dCeO008333
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 05:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=9VWMSNsBXomWpQwZobm5fvz81FRl1s0N/5Xa1eTZhYQ=;
 b=Zv+lLnHryPY1yGIKZCQEPWJeSyJSK96WTzxlWGl5QnXjFsceM+9EOIKAlGJrOHvCpWyd
 LlDMwHBLY+71GFTqpLrAgeMn5qiq30t1CLrMNUXy5gbtpmdnJk0F6jGko3CcpyI7nCwg
 PR3l3kOHBMlo07sh2unyE9doNUpS+DO2KAyKU5ex70vHWNUSBCWRU52rSt4szO6JzOxR
 7EW8YdTKtYJ7xZBECCHq6MYdBZzBbaThd9BEYF1KWaDEerKlXyTHlfpMVQYc8NFgRIH2
 NqO68LAO+hpc97lRKSe109tzHfa6zwlrW6ZYJLLpSgAQOc1hPYkSmRKK36v1b8NXEr9i iA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3ue2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 05:39:11 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M5dBrP008324
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 05:39:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3ue2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 05:39:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzeEA4Sn62smZ954T0HBwMAjMK1brLMKajuc0tWzdOgADzN94eRSTVLLyPkDzeYrLQPDnF/GWik2QBRIu9E4wLZzKzxudI3MT2/BX862UGDMnNkuQcvjitHQN+Ru2Sf14X+Xo5qgfo/WMbBkBFODSosrzqfEVzstytEVsWsJEn2Bde+7i8rH4t3Z88YRIpA2VyeMa0n0Gy8MyT7abSb/nGzqFfI9ME5ijvkZoMJkIbbW3dHOdMiPXMHFeI51mxcsUiyGK3bXNak6MTgZTIMFB/5MUKvvA0lqruTTpc6IM6LV+PmMEgmWknBYcDQbRNJgJ0ZnGvVqRizLCpmKgM1XWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VWMSNsBXomWpQwZobm5fvz81FRl1s0N/5Xa1eTZhYQ=;
 b=oM5ogmJUnDVY/uzV99b/KaU+kCkz9LcL8AARIckTr9C0D0ZPjv5l1ojlFQYdNtfhYA+b8byDLNKwPipGeGys1CiImKZ5xliKrTMPI44nDJGX8rUD//FEuekeAGAiUdQHGY3jmuvo6FfPVApyUeAWajdmV0E5iQQyYGhdaW1tVX+plE9nRujUwrVe5jFhPAsj9F0QvBDArMSsKxYeCwCHEVIemaao3ikZ5TBfqe3Zfz28gIYBPn042lwA+Pa0qKW2qkp/NQTm39qRJ11caHOjCt4+th8x+OQDhfdRku2fOzzNKqfTBuZpByBUn3D0FXELPCocNBxWNjA9COxWtaJ6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Wed, 22 Feb
 2023 05:39:08 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::37fa:8b56:8596:c286]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::37fa:8b56:8596:c286%4]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 05:39:08 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Tim Orling <ticotimo@gmail.com>
CC: "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] apr-util: fix for CVE-2022-25147
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] apr-util: fix for CVE-2022-25147
Thread-Index: AQHZRfdVdeODI0XPG0yOZ33Z6cubzK7aOOAAgAAzTts=
Date: Wed, 22 Feb 2023 05:39:07 +0000
Message-ID: 
 <DM4PR11MB5550B49CF75B575F3984553DE4AA9@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20230221132021.2838669-1-narpat.mali@windriver.com>
 <CANx9H-DmrK58Ws+2sBmcr5u4oKPxhpZr7knGcZMm=0kDL=XfSg@mail.gmail.com>
In-Reply-To: 
 <CANx9H-DmrK58Ws+2sBmcr5u4oKPxhpZr7knGcZMm=0kDL=XfSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|CY5PR11MB6488:EE_
x-ms-office365-filtering-correlation-id: 88366057-a14c-4e23-6ff7-08db14971e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EGmgMRVsWNz483pwriweVozrbMc9bkEDdZYCHq//HRlz3lI5nt9Ytq+PQ/lM9WwT6x0ze64RELe5EWOSr7ib/e2YOzLMmxeC+NFWFrJOxPC76KLU1AhSfprLIjrkuEKUXa1Gy/bRnb2cJ6F5bIfAp6ZCcCKvh1h40F3XXLWoLwCp5QaA5GgxYbSfY53C/lyEjywPp30Edn/T3t6joTrdtXQWfktb4F9Q5HwBZ5SscxRzBRlNjSxCTnX0qeE6XlbvDZOJY9cikHg3+GFrAPZhyBnhqJ6xjKHkyADCDB9nRAwRx+4wqK+yimyrrA5vwhkwoEXXjBYvXZdZ/ilx/sXReZ6gI6qM043o4Q3WYHtdh8orEyMd63Yqp0gCr2VJNVBFRPNJg7WXNyyGesAu2LxyD0LtBSQAywzHeHNCpYOfljlOqXa4L/aipV3YvB3Tkm1XSLg0IDYysZk0RMpGPYCl/RfjMhQSmvunObu924sLZjupdJhaiwqnydQdSgTxr2Dp6OYdE/xQK3lPrbMxLxE31KHrZTZRLlfgRJ3apZ/Q148OuGNRov7ewQtg2ItMHJGJjHDI2jK4apf9olwt5/GCzcEYy+1soSvaIzDZZFGgfsPzkqfieuxg+e+phTs1mvy1KVdpSfqywt3cnzHwDREk3yTuynvPCDWXicRLF8Vdh2MZUYHvFWx1ruOtac0xrtlXhmNhThzPBhrmLWtJXogKTAwAhzGlXcy03kv6wMWqvBw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(451199018)(966005)(83380400001)(66946007)(76116006)(66556008)(66446008)(64756008)(66476007)(52536014)(91956017)(5660300002)(316002)(41300700001)(8936002)(54906003)(4326008)(26005)(186003)(53546011)(6506007)(8676002)(71200400001)(478600001)(7696005)(9686003)(6916009)(38070700005)(55016003)(33656002)(86362001)(122000001)(2906002)(166002)(38100700002)(66899018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?ap7zkTmVXxHUMtiIsc7z/upyDoOCkvQUpIaB75qoqmmmXYts3aTcfSzr?=
 =?Windows-1252?Q?u41vWYoJBZuVCXTIZFj7HRb5sU3/yMJazFCAP70idk7qd4Am7G9U040e?=
 =?Windows-1252?Q?xoKRV8tTiI5EiaY5JH3AxwBXbVd5DmrcGCfbeNOz9b2dZyi8EgX1at/k?=
 =?Windows-1252?Q?MwDZMb2kY/2HcwuPZ/vx5zYWRKCzlIBqkuY30E6M3+Qwg6MvBTazaXeR?=
 =?Windows-1252?Q?pPpqM2nVNQr/9Sy/XH0Vsz9R3HR2+xVEyHOdXI4tHk4bOeZoWbFeS3cv?=
 =?Windows-1252?Q?aBc7GM1/ACOjtKF8tn3G7mPQv4hj/BXoU4D21YlNZlmGi/tPJyIB2QzZ?=
 =?Windows-1252?Q?pQ6U91BCIY7XVU4ptkkMpXt6pNE/5PyAoecTrJj5S2s9PtUwZRLbasuk?=
 =?Windows-1252?Q?vMJTd5QXFKLG9CZyF84dA3oaUPacJb1dU/alWyl7ZX4R2yjCoBUWDzS7?=
 =?Windows-1252?Q?X2Xhcj5EiLv56p2J5xxO9AounqbZc+cx5CQHKsqX+3Rw7iQa+j7uF+4f?=
 =?Windows-1252?Q?6kt+jsMMPNUvVUd/B09b63y/gWERS4JjUin3RCac0wjBcTKC1/x9zpd6?=
 =?Windows-1252?Q?MwImpZ2ql8EN/vV7LNncedzO8cvnOwJRGm+9CCiqh6nSVK+EcRB4E17j?=
 =?Windows-1252?Q?pQi0eQ/mBvB09DVr5gN9ysq5Lax4FTSd9aOUhTtNBuF6HrO0LzYRkRMr?=
 =?Windows-1252?Q?t02IUHIz0pkMPJEF/YGkLd8AyorR4mTFFSAaaRrwk6Xpp1TzsAWG82pp?=
 =?Windows-1252?Q?ifUcB88FfK944XDpgOaL6EimmMDouSSWqRZW778UPqmkMXAl96zi7rC6?=
 =?Windows-1252?Q?1MsaK1KR6Oy8WsRfifD6tc6YPl31w0q9nHB0vfdIGU39ecEqUQH9gEU0?=
 =?Windows-1252?Q?p/ZJQzkX9L/HLnEV6zYfUpTCSaQSPTvjEmD14Hz3nyt/POTqr/ceE0TP?=
 =?Windows-1252?Q?K3Ikh1JECPmUa2dodQn6ja3hzo06q/kMHQ5XBytFPDDc/km/0SF49qoZ?=
 =?Windows-1252?Q?xWbtVXRUk+v2rnHVReN8i7aThpADcWCFq9/2bofVsllaqAATyc++DrWd?=
 =?Windows-1252?Q?2s829exKIKUhimI+UByzpC1ql3FkcoVX/DDBI3hHefbL/dLkqBxp54a+?=
 =?Windows-1252?Q?xGZxHUtnHYAA4hOS4OS1nnXT4QnQ6Z8NZSIR4J/2+/6fzX16hNGOcV46?=
 =?Windows-1252?Q?r5iVuJgHgwRbS1kxLEmTi15N9euaRK1AyQIJljx9xk66jsNhS7t21MI9?=
 =?Windows-1252?Q?xRQKT1BovJaE+EU5IAkN2FDFVJUl4HPM+QAiBkdyaLLx8oBcNWZmOXa3?=
 =?Windows-1252?Q?eWR7e0kW/yFvcuKzZW60xdQ5a2VtjFXsjvk8PXJYF2NB12kYZVp4wd7E?=
 =?Windows-1252?Q?H1mCZIkEjrHrH/mOmVLoVr26rNCOAi6T/x4dox5VmIlETzn4haG5KwcJ?=
 =?Windows-1252?Q?exZDis+wCz9WgDzs66YAEjVHEyFOGddUP9/lbJH1Etgzl2spL5xygObU?=
 =?Windows-1252?Q?tfQlCdiltP9ZaQWKvMMI4up7aUJvV4s8oQ73I88rL1qOIrzUNwZEbUZz?=
 =?Windows-1252?Q?c4aF8B8OzMGHE7+ylaXdQqjfzjaQLRI+g5eV4h7rAYO1m91QjP1Ue7gH?=
 =?Windows-1252?Q?/t7H0p5VEJH/bLQ5i+Q4vBedH0y1Cf9hMl2jepgnUSUt72tKrTjTgRBa?=
 =?Windows-1252?Q?3OYcFjWVRHyFXlB9vc81YoboQQ0+RQhtK7QOSxguwAKH6ZIg+gD/7Mv7?=
 =?Windows-1252?Q?tuv1+wR+uj1Ro0JhV6M=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB5550B49CF75B575F3984553DE4AA9DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88366057-a14c-4e23-6ff7-08db14971e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 05:39:07.9075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73QVCHhiyqWTg3InEwaL5NzeY9ks/aftmpyMFFPhaTOZzZAhUjK1kqd/mOo7e8z8/+qi+y6EdbdKI7UEZJEkvRx/evasRdF2yxgMcvDS3yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
X-Proofpoint-GUID: UeBltMlUv0Mnrueu1ovNADbRNTOVpzZU
X-Proofpoint-ORIG-GUID: 3UTUPr2ivKnhk2eFkcZby1MCQWe8w3M8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_02,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 05:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177560

--_000_DM4PR11MB5550B49CF75B575F3984553DE4AA9DM4PR11MB5550namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sure, Tim.

I think there is no need to send the patch again to upgrade apr-util to 1.6=
.3 since, Steve Sakoman has already sent review request for some set of pat=
ches for kirkstone and these also include the patch for apr-util: update 1.=
6.1 -> 1.6.3 version. These patches are currently available at =93stable/ki=
rkstone-nut=94 branch.

http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3De24b38a14b3520648ec418783fb74fcf61df7ff2

Please let me know if my above understanding is correct or not.

Best Regards,
Narpat


From: Tim Orling<mailto:ticotimo@gmail.com>
Sent: 22 February 2023 07:37
To: Mali, Narpat<mailto:Narpat.Mali@windriver.com>
Cc: Polampalli, Archana<mailto:Archana.Polampalli@windriver.com>; G Pillai,=
 Hari<mailto:Hari.GPillai@windriver.com>; openembedded-core@lists.openembed=
ded.org<mailto:openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] apr-util: fix for CVE-2022-251=
47

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.


On Tue, Feb 21, 2023 at 5:20 AM Narpat Mali <narpat.mali@windriver.com<mail=
to:narpat.mali@windriver.com>> wrote:
Integer Overflow or Wraparound vulnerability in apr_base64 functions
of Apache Portable Runtime Utility (APR-util) allows an attacker to
write beyond bounds of a buffer. This issue affects Apache Portable
Runtime Utility (APR-util) 1.6.1 and prior versions.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-25147<https://urldefense.com/v3/_=
_https:/nvd.nist.gov/vuln/detail/CVE-2022-25147__;!!AjveYdw8EvQ!esmjxUfJK-k=
9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XH58ssc0$>

It might make more sense to upgrade to 1.6.3, as it appears to include some=
 additional fixes and no new features.

https://downloads.apache.org/apr/CHANGES-APR-UTIL-1.6<https://urldefense.co=
m/v3/__https:/downloads.apache.org/apr/CHANGES-APR-UTIL-1.6__;!!AjveYdw8EvQ=
!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2=
N6XNKeh7pM$>


Signed-off-by: Narpat Mali <narpat.mali@windriver.com<mailto:narpat.mali@wi=
ndriver.com>>
---
 .../apr/apr-util/CVE-2022-25147.patch         | 180 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.1.bb<https://urldefense.com/v3/__htt=
p:/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M=
__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$>    |   3 +-
 2 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2022-25147.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch b/meta/=
recipes-support/apr/apr-util/CVE-2022-25147.patch
new file mode 100644
index 0000000000..e85785aca0
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch
@@ -0,0 +1,180 @@
+From 3f5257075c7eb601aed6333e9bb5d9eb0e11254b Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org<mailto:ylavic@apache.org>>
+Date: Thu, 20 Oct 2022 09:38:34 +0000
+Subject: [PATCH] apr_base64: Make sure encoding/decoding lengths fit in an=
 int
+ >=3D 0.
+
+The (old) API of apr_base64 functions has always used int for representing
+lengths and it does not return errors. Make sure to abort() if the provide=
d
+data don't fit.
+
+* encoding/apr_base64.c():
+  #define APR_BASE64_ENCODE_MAX and APR_BASE64_DECODE_MAX as the hard leng=
th
+  limits for encoding and decoding respectively.
+
+* encoding/apr_base64.c(apr_base64_encode_len, apr_base64_encode,
+                        apr_base64_encode_binary, apr_pbase64_encode):
+  abort() if the given length is above APR_BASE64_ENCODE_MAX.
+
+* encoding/apr_base64.c(apr_base64_decode_len, apr_base64_decode,
+                        apr_base64_decode_binary, apr_pbase64_decode):
+  abort() if the given plain buffer length is above APR_BASE64_DECODE_MAX.
+
+
+apr_base64: Follow up to r1902206: Cap to APR_BASE64_ENCODE_MAX in apr_pba=
se64_encode().
+
+
+Merges r1902206[, r1904666] from trunk.
+Merges r1904727 from 1.7.x.
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1=
904728<https://urldefense.com/v3/__https:/svn.apache.org/repos/asf/apr/apr-=
util/branches/1.6.x@1904728__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV=
4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIcUV_A5$> 13f79535-47bb-0310-=
9956-ffa450edef68
+
+CVE: CVE-2022-25147
+
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/3f525=
7075c7eb601aed6333e9bb5d9eb0e11254b<https://urldefense.com/v3/__https:/gith=
ub.com/apache/apr-util/commit/3f5257075c7eb601aed6333e9bb5d9eb0e11254b__;!!=
AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5=
xElVB-xSOU2N6XFWd2o7a$>]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com<mailto:narpat.mali@w=
indriver.com>>
+---
+ encoding/apr_base64.c | 41 +++++++++++++++++++++++++----------------
+ 1 file changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/encoding/apr_base64.c b/encoding/apr_base64.c
+index e9b75e3d..ac9f2816 100644
+--- a/encoding/apr_base64.c
++++ b/encoding/apr_base64.c
+@@ -20,11 +20,20 @@
+  * ugly 'len' functions, which is quite a nasty cost.
+  */
+
++#undef NDEBUG /* always abort() on assert()ion failure */
++#include <assert.h>
++
+ #include "apr_base64.h"
+ #if APR_CHARSET_EBCDIC
+ #include "apr_xlate.h"
+ #endif                                /* APR_CHARSET_EBCDIC */
+
++/* Above APR_BASE64_ENCODE_MAX length the encoding can't fit in an int >=
=3D 0 */
++#define APR_BASE64_ENCODE_MAX 1610612733
++
++/* Above APR_BASE64_DECODE_MAX length the decoding can't fit in an int >=
=3D 0 */
++#define APR_BASE64_DECODE_MAX 2863311524u
++
+ /* aaaack but it's fast and const should make it shared text page. */
+ static const unsigned char pr2six[256] =3D
+ {
+@@ -109,24 +118,22 @@ APU_DECLARE(apr_status_t) apr_base64init_ebcdic(apr_=
xlate_t *to_ascii,
+
+ APU_DECLARE(int) apr_base64_decode_len(const char *bufcoded)
+ {
+-    int nbytesdecoded;
+     register const unsigned char *bufin;
+     register apr_size_t nprbytes;
+
+     bufin =3D (const unsigned char *) bufcoded;
+     while (pr2six[*(bufin++)] <=3D 63);
+-
+     nprbytes =3D (bufin - (const unsigned char *) bufcoded) - 1;
+-    nbytesdecoded =3D (((int)nprbytes + 3) / 4) * 3;
++    assert(nprbytes <=3D APR_BASE64_DECODE_MAX);
+
+-    return nbytesdecoded + 1;
++    return (int)(((nprbytes + 3u) / 4u) * 3u + 1u);
+ }
+
+ APU_DECLARE(int) apr_base64_decode(char *bufplain, const char *bufcoded)
+ {
+ #if APR_CHARSET_EBCDIC
+     apr_size_t inbytes_left, outbytes_left;
+-#endif                                /* APR_CHARSET_EBCDIC */
++#endif /* APR_CHARSET_EBCDIC */
+     int len;
+
+     len =3D apr_base64_decode_binary((unsigned char *) bufplain, bufcoded=
);
+@@ -143,7 +150,7 @@ APU_DECLARE(int) apr_base64_decode(char *bufplain, con=
st char *bufcoded)
+  * the conversion of the output to ebcdic is left out.
+  */
+ APU_DECLARE(int) apr_base64_decode_binary(unsigned char *bufplain,
+-                                 const char *bufcoded)
++                                          const char *bufcoded)
+ {
+     int nbytesdecoded;
+     register const unsigned char *bufin;
+@@ -153,12 +160,13 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned c=
har *bufplain,
+     bufin =3D (const unsigned char *) bufcoded;
+     while (pr2six[*(bufin++)] <=3D 63);
+     nprbytes =3D (bufin - (const unsigned char *) bufcoded) - 1;
+-    nbytesdecoded =3D (((int)nprbytes + 3) / 4) * 3;
++    assert(nprbytes <=3D APR_BASE64_DECODE_MAX);
++    nbytesdecoded =3D (int)(((nprbytes + 3u) / 4u) * 3u);
+
+     bufout =3D (unsigned char *) bufplain;
+     bufin =3D (const unsigned char *) bufcoded;
+
+-    while (nprbytes > 4) {
++    while (nprbytes >=3D 4) {
+       *(bufout++) =3D
+           (unsigned char) (pr2six[*bufin] << 2 | pr2six[bufin[1]] >> 4);
+       *(bufout++) =3D
+@@ -178,13 +186,8 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned ch=
ar *bufplain,
+       *(bufout++) =3D
+           (unsigned char) (pr2six[bufin[1]] << 4 | pr2six[bufin[2]] >> 2)=
;
+     }
+-    if (nprbytes > 3) {
+-      *(bufout++) =3D
+-          (unsigned char) (pr2six[bufin[2]] << 6 | pr2six[bufin[3]]);
+-    }
+
+-    nbytesdecoded -=3D (4 - (int)nprbytes) & 3;
+-    return nbytesdecoded;
++    return nbytesdecoded - (int)((4u - nprbytes) & 3u);
+ }
+
+ static const char basis_64[] =3D
+@@ -192,6 +195,8 @@ static const char basis_64[] =3D
+
+ APU_DECLARE(int) apr_base64_encode_len(int len)
+ {
++    assert(len >=3D 0 && len <=3D APR_BASE64_ENCODE_MAX);
++
+     return ((len + 2) / 3 * 4) + 1;
+ }
+
+@@ -203,6 +208,8 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, cons=
t char *string, int len)
+     int i;
+     char *p;
+
++    assert(len >=3D 0 && len <=3D APR_BASE64_ENCODE_MAX);
++
+     p =3D encoded;
+     for (i =3D 0; i < len - 2; i +=3D 3) {
+       *p++ =3D basis_64[(os_toascii[string[i]] >> 2) & 0x3F];
+@@ -227,7 +234,7 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, cons=
t char *string, int len)
+     }
+
+     *p++ =3D '\0';
+-    return p - encoded;
++    return (unsigned int)(p - encoded);
+ #endif                                /* APR_CHARSET_EBCDIC */
+ }
+
+@@ -240,6 +247,8 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encode=
d,
+     int i;
+     char *p;
+
++    assert(len >=3D 0 && len <=3D APR_BASE64_ENCODE_MAX);
++
+     p =3D encoded;
+     for (i =3D 0; i < len - 2; i +=3D 3) {
+       *p++ =3D basis_64[(string[i] >> 2) & 0x3F];
+@@ -264,5 +273,5 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encode=
d,
+     }
+
+     *p++ =3D '\0';
+-    return (int)(p - encoded);
++    return (unsigned int)(p - encoded);
+ }
+--
+2.32.0
+
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb<https://urldefense.=
com/v3/__http:/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnx=
sXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$> b/meta/recipes=
-support/apr/apr-util_1.6.1.bb<https://urldefense.com/v3/__http:/apr-util_1=
.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbN=
FQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$>
index b851d46351..f5a2888016 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb<https://urldefense.com/v3/=
__http:/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4R=
tEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$>
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb<https://urldefense.com/v3/=
__http:/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4R=
tEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$>
@@ -14,7 +14,8 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configure_fixes.patch \
            file://run-ptest \
            file://0001-Fix-error-handling-in-gdbm.patch \
-"
+           file://CVE-2022-25147.patch \
+          "

 SRC_URI[md5sum] =3D "bd502b9a8670a8012c4d90c31a84955f"
 SRC_URI[sha256sum] =3D "b65e40713da57d004123b6319828be7f1273fbc6490e145874=
ee1177e112c459"
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#177496): https://lists.openembedded.org/g/openembedded-=
core/message/177496<https://urldefense.com/v3/__https:/lists.openembedded.o=
rg/g/openembedded-core/message/177496__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJ=
FIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XJm6XEay$>
Mute This Topic: https://lists.openembedded.org/mt/97108181/924729<https://=
urldefense.com/v3/__https:/lists.openembedded.org/mt/97108181/924729__;!!Aj=
veYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xE=
lVB-xSOU2N6XAvKdrkF$>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded-core/un=
sub__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJ=
tPzT-sS5xElVB-xSOU2N6XOfvUNlL$> [ticotimo@gmail.com<mailto:ticotimo@gmail.c=
om>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_DM4PR11MB5550B49CF75B575F3984553DE4AA9DM4PR11MB5550namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Sure, Tim.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I think there is no need to send the patch again to =
upgrade apr-util to 1.6.3 since, Steve Sakoman has already sent review requ=
est for some set of patches for kirkstone and these also include the patch =
for apr-util: update 1.6.1 -&gt; 1.6.3
 version. These patches are currently available at =93stable/kirkstone-nut=
=94 branch.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://cgit.openembedded.org/openembedded=
-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3De24b38a14b3520648ec=
418783fb74fcf61df7ff2">http://cgit.openembedded.org/openembedded-core-contr=
ib/commit/?h=3Dstable/kirkstone-nut&amp;id=3De24b38a14b3520648ec418783fb74f=
cf61df7ff2</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please let me know if my above understanding is corr=
ect or not.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Narpat<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:ticotimo@gmail.com">Tim Orling</a><br>
<b>Sent: </b>22 February 2023 07:37<br>
<b>To: </b><a href=3D"mailto:Narpat.Mali@windriver.com">Mali, Narpat</a><br=
>
<b>Cc: </b><a href=3D"mailto:Archana.Polampalli@windriver.com">Polampalli, =
Archana</a>;
<a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>; <a href=
=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a><br>
<b>Subject: </b>Re: [OE-core][kirkstone][PATCH 1/1] apr-util: fix for CVE-2=
022-25147</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"MsoNormal" style=3D"background:#FCFC03"><b><span style=3D"color=
:black">CAUTION: This email comes from a non Wind River email account!</spa=
n></b><span style=3D"color:black"><br>
</span><span style=3D"font-size:10.0pt;color:black">Do not click links or o=
pen attachments unless you recognize the sender and know the content is saf=
e.</span><o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Feb 21, 2023 at 5:20 AM Narpat Mali &lt;<a h=
ref=3D"mailto:narpat.mali@windriver.com">narpat.mali@windriver.com</a>&gt; =
wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">Integer Overflow or Wraparound vulnerability in apr_=
base64 functions<br>
of Apache Portable Runtime Utility (APR-util) allows an attacker to<br>
write beyond bounds of a buffer. This issue affects Apache Portable<br>
Runtime Utility (APR-util) 1.6.1 and prior versions.<br>
<br>
Reference:<br>
<a href=3D"https://urldefense.com/v3/__https:/nvd.nist.gov/vuln/detail/CVE-=
2022-25147__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40=
QbNFQWJtPzT-sS5xElVB-xSOU2N6XH58ssc0$" target=3D"_blank">https://nvd.nist.g=
ov/vuln/detail/CVE-2022-25147</a><o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">It might make more sense to upgrade to 1.6.3, as it =
appears to include some additional fixes and no new features.<o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://urldefense.com/v3/__https:/downlo=
ads.apache.org/apr/CHANGES-APR-UTIL-1.6__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2Yir=
QJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XNKeh7pM$">https:/=
/downloads.apache.org/apr/CHANGES-APR-UTIL-1.6</a><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:0cm;mar=
gin-bottom:12.0pt;margin-left:4.8pt">
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
&nbsp;.../apr/apr-util/CVE-2022-25147.patch&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| 180 ++++++++++++++++++<br>
&nbsp;meta/recipes-support/apr/<a href=3D"https://urldefense.com/v3/__http:=
/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__=
yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$" target=3D"_blank">apr-util_1=
.6.1.bb</a>&nbsp; &nbsp; |&nbsp; &nbsp;3 +-<br>
&nbsp;2 files changed, 182 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta/recipes-support/apr/apr-util/CVE-2022-25147.p=
atch<br>
<br>
diff --git a/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch b/meta/=
recipes-support/apr/apr-util/CVE-2022-25147.patch<br>
new file mode 100644<br>
index 0000000000..e85785aca0<br>
--- /dev/null<br>
+++ b/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch<br>
@@ -0,0 +1,180 @@<br>
+From 3f5257075c7eb601aed6333e9bb5d9eb0e11254b Mon Sep 17 00:00:00 2001<br>
+From: Yann Ylavic &lt;<a href=3D"mailto:ylavic@apache.org" target=3D"_blan=
k">ylavic@apache.org</a>&gt;<br>
+Date: Thu, 20 Oct 2022 09:38:34 +0000<br>
+Subject: [PATCH] apr_base64: Make sure encoding/decoding lengths fit in an=
 int<br>
+ &gt;=3D 0.<br>
+<br>
+The (old) API of apr_base64 functions has always used int for representing=
<br>
+lengths and it does not return errors. Make sure to abort() if the provide=
d<br>
+data don't fit.<br>
+<br>
+* encoding/apr_base64.c():<br>
+&nbsp; #define APR_BASE64_ENCODE_MAX and APR_BASE64_DECODE_MAX as the hard=
 length<br>
+&nbsp; limits for encoding and decoding respectively.<br>
+<br>
+* encoding/apr_base64.c(apr_base64_encode_len, apr_base64_encode,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; apr_base64_encode_binary, apr_pbase64_encode):<br>
+&nbsp; abort() if the given length is above APR_BASE64_ENCODE_MAX.<br>
+<br>
+* encoding/apr_base64.c(apr_base64_decode_len, apr_base64_decode,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; apr_base64_decode_binary, apr_pbase64_decode):<br>
+&nbsp; abort() if the given plain buffer length is above APR_BASE64_DECODE=
_MAX.<br>
+<br>
+<br>
+apr_base64: Follow up to r1902206: Cap to APR_BASE64_ENCODE_MAX in apr_pba=
se64_encode().<br>
+<br>
+<br>
+Merges r1902206[, r1904666] from trunk.<br>
+Merges r1904727 from 1.7.x.<br>
+<br>
+<br>
+git-svn-id: <a href=3D"https://urldefense.com/v3/__https:/svn.apache.org/r=
epos/asf/apr/apr-util/branches/1.6.x@1904728__;!!AjveYdw8EvQ!esmjxUfJK-k9hs=
O2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIcUV_A5$" ta=
rget=3D"_blank">
https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1904728</a> 13=
f79535-47bb-0310-9956-ffa450edef68<br>
+<br>
+CVE: CVE-2022-25147<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://urldefense.com/v3/__https:/g=
ithub.com/apache/apr-util/commit/3f5257075c7eb601aed6333e9bb5d9eb0e11254b__=
;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-=
sS5xElVB-xSOU2N6XFWd2o7a$" target=3D"_blank">https://github.com/apache/apr-=
util/commit/3f5257075c7eb601aed6333e9bb5d9eb0e11254b</a>]<br>
+<br>
+Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com=
" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
+---<br>
+ encoding/apr_base64.c | 41 +++++++++++++++++++++++++----------------<br>
+ 1 file changed, 25 insertions(+), 16 deletions(-)<br>
+<br>
+diff --git a/encoding/apr_base64.c b/encoding/apr_base64.c<br>
+index e9b75e3d..ac9f2816 100644<br>
+--- a/encoding/apr_base64.c<br>
++++ b/encoding/apr_base64.c<br>
+@@ -20,11 +20,20 @@<br>
+&nbsp; * ugly 'len' functions, which is quite a nasty cost.<br>
+&nbsp; */<br>
+ <br>
++#undef NDEBUG /* always abort() on assert()ion failure */<br>
++#include &lt;assert.h&gt;<br>
++<br>
+ #include &quot;apr_base64.h&quot;<br>
+ #if APR_CHARSET_EBCDIC<br>
+ #include &quot;apr_xlate.h&quot;<br>
+ #endif&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* APR_CHARSET_EBCDIC */<br>
+ <br>
++/* Above APR_BASE64_ENCODE_MAX length the encoding can't fit in an int &g=
t;=3D 0 */<br>
++#define APR_BASE64_ENCODE_MAX 1610612733<br>
++<br>
++/* Above APR_BASE64_DECODE_MAX length the decoding can't fit in an int &g=
t;=3D 0 */<br>
++#define APR_BASE64_DECODE_MAX 2863311524u<br>
++<br>
+ /* aaaack but it's fast and const should make it shared text page. */<br>
+ static const unsigned char pr2six[256] =3D<br>
+ {<br>
+@@ -109,24 +118,22 @@ APU_DECLARE(apr_status_t) apr_base64init_ebcdic(apr_=
xlate_t *to_ascii,<br>
+ <br>
+ APU_DECLARE(int) apr_base64_decode_len(const char *bufcoded)<br>
+ {<br>
+-&nbsp; &nbsp; int nbytesdecoded;<br>
+&nbsp; &nbsp; &nbsp;register const unsigned char *bufin;<br>
+&nbsp; &nbsp; &nbsp;register apr_size_t nprbytes;<br>
+ <br>
+&nbsp; &nbsp; &nbsp;bufin =3D (const unsigned char *) bufcoded;<br>
+&nbsp; &nbsp; &nbsp;while (pr2six[*(bufin++)] &lt;=3D 63);<br>
+-<br>
+&nbsp; &nbsp; &nbsp;nprbytes =3D (bufin - (const unsigned char *) bufcoded=
) - 1;<br>
+-&nbsp; &nbsp; nbytesdecoded =3D (((int)nprbytes + 3) / 4) * 3;<br>
++&nbsp; &nbsp; assert(nprbytes &lt;=3D APR_BASE64_DECODE_MAX);<br>
+ <br>
+-&nbsp; &nbsp; return nbytesdecoded + 1;<br>
++&nbsp; &nbsp; return (int)(((nprbytes + 3u) / 4u) * 3u + 1u);<br>
+ }<br>
+ <br>
+ APU_DECLARE(int) apr_base64_decode(char *bufplain, const char *bufcoded)<=
br>
+ {<br>
+ #if APR_CHARSET_EBCDIC<br>
+&nbsp; &nbsp; &nbsp;apr_size_t inbytes_left, outbytes_left;<br>
+-#endif&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* APR_CHARSET_EBCDIC */<br>
++#endif /* APR_CHARSET_EBCDIC */<br>
+&nbsp; &nbsp; &nbsp;int len;<br>
+&nbsp; &nbsp; &nbsp;<br>
+&nbsp; &nbsp; &nbsp;len =3D apr_base64_decode_binary((unsigned char *) buf=
plain, bufcoded);<br>
+@@ -143,7 +150,7 @@ APU_DECLARE(int) apr_base64_decode(char *bufplain, con=
st char *bufcoded)<br>
+&nbsp; * the conversion of the output to ebcdic is left out.<br>
+&nbsp; */<br>
+ APU_DECLARE(int) apr_base64_decode_binary(unsigned char *bufplain,<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const char *bufcoded)<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=
onst char *bufcoded)<br>
+ {<br>
+&nbsp; &nbsp; &nbsp;int nbytesdecoded;<br>
+&nbsp; &nbsp; &nbsp;register const unsigned char *bufin;<br>
+@@ -153,12 +160,13 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned c=
har *bufplain,<br>
+&nbsp; &nbsp; &nbsp;bufin =3D (const unsigned char *) bufcoded;<br>
+&nbsp; &nbsp; &nbsp;while (pr2six[*(bufin++)] &lt;=3D 63);<br>
+&nbsp; &nbsp; &nbsp;nprbytes =3D (bufin - (const unsigned char *) bufcoded=
) - 1;<br>
+-&nbsp; &nbsp; nbytesdecoded =3D (((int)nprbytes + 3) / 4) * 3;<br>
++&nbsp; &nbsp; assert(nprbytes &lt;=3D APR_BASE64_DECODE_MAX);<br>
++&nbsp; &nbsp; nbytesdecoded =3D (int)(((nprbytes + 3u) / 4u) * 3u);<br>
+ <br>
+&nbsp; &nbsp; &nbsp;bufout =3D (unsigned char *) bufplain;<br>
+&nbsp; &nbsp; &nbsp;bufin =3D (const unsigned char *) bufcoded;<br>
+ <br>
+-&nbsp; &nbsp; while (nprbytes &gt; 4) {<br>
++&nbsp; &nbsp; while (nprbytes &gt;=3D 4) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;*(bufout++) =3D<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(unsigned char) (pr2six[*bufin] &=
lt;&lt; 2 | pr2six[bufin[1]] &gt;&gt; 4);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;*(bufout++) =3D<br>
+@@ -178,13 +186,8 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned ch=
ar *bufplain,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;*(bufout++) =3D<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(unsigned char) (pr2six[bufin[1]]=
 &lt;&lt; 4 | pr2six[bufin[2]] &gt;&gt; 2);<br>
+&nbsp; &nbsp; &nbsp;}<br>
+-&nbsp; &nbsp; if (nprbytes &gt; 3) {<br>
+-&nbsp; &nbsp; &nbsp; *(bufout++) =3D<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (unsigned char) (pr2six[bufin[2]] &lt;=
&lt; 6 | pr2six[bufin[3]]);<br>
+-&nbsp; &nbsp; }<br>
+ <br>
+-&nbsp; &nbsp; nbytesdecoded -=3D (4 - (int)nprbytes) &amp; 3;<br>
+-&nbsp; &nbsp; return nbytesdecoded;<br>
++&nbsp; &nbsp; return nbytesdecoded - (int)((4u - nprbytes) &amp; 3u);<br>
+ }<br>
+ <br>
+ static const char basis_64[] =3D<br>
+@@ -192,6 +195,8 @@ static const char basis_64[] =3D<br>
+ <br>
+ APU_DECLARE(int) apr_base64_encode_len(int len)<br>
+ {<br>
++&nbsp; &nbsp; assert(len &gt;=3D 0 &amp;&amp; len &lt;=3D APR_BASE64_ENCO=
DE_MAX);<br>
++<br>
+&nbsp; &nbsp; &nbsp;return ((len + 2) / 3 * 4) + 1;<br>
+ }<br>
+ <br>
+@@ -203,6 +208,8 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, cons=
t char *string, int len)<br>
+&nbsp; &nbsp; &nbsp;int i;<br>
+&nbsp; &nbsp; &nbsp;char *p;<br>
+ <br>
++&nbsp; &nbsp; assert(len &gt;=3D 0 &amp;&amp; len &lt;=3D APR_BASE64_ENCO=
DE_MAX);<br>
++<br>
+&nbsp; &nbsp; &nbsp;p =3D encoded;<br>
+&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; len - 2; i +=3D 3) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;*p++ =3D basis_64[(os_toascii[string[i]] &gt;&g=
t; 2) &amp; 0x3F];<br>
+@@ -227,7 +234,7 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, cons=
t char *string, int len)<br>
+&nbsp; &nbsp; &nbsp;}<br>
+ <br>
+&nbsp; &nbsp; &nbsp;*p++ =3D '\0';<br>
+-&nbsp; &nbsp; return p - encoded;<br>
++&nbsp; &nbsp; return (unsigned int)(p - encoded);<br>
+ #endif&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* APR_CHARSET_EBCDIC */<br>
+ }<br>
+ <br>
+@@ -240,6 +247,8 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encode=
d,<br>
+&nbsp; &nbsp; &nbsp;int i;<br>
+&nbsp; &nbsp; &nbsp;char *p;<br>
+ <br>
++&nbsp; &nbsp; assert(len &gt;=3D 0 &amp;&amp; len &lt;=3D APR_BASE64_ENCO=
DE_MAX);<br>
++<br>
+&nbsp; &nbsp; &nbsp;p =3D encoded;<br>
+&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; len - 2; i +=3D 3) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp;*p++ =3D basis_64[(string[i] &gt;&gt; 2) &amp; =
0x3F];<br>
+@@ -264,5 +273,5 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encode=
d,<br>
+&nbsp; &nbsp; &nbsp;}<br>
+ <br>
+&nbsp; &nbsp; &nbsp;*p++ =3D '\0';<br>
+-&nbsp; &nbsp; return (int)(p - encoded);<br>
++&nbsp; &nbsp; return (unsigned int)(p - encoded);<br>
+ }<br>
+-- <br>
+2.32.0<br>
+<br>
diff --git a/meta/recipes-support/apr/<a href=3D"https://urldefense.com/v3/=
__http:/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4R=
tEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$" target=3D"_blank">apr=
-util_1.6.1.bb</a> b/meta/recipes-support/apr/<a href=3D"https://urldefense=
.com/v3/__http:/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQn=
xsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$" target=3D"_bl=
ank">apr-util_1.6.1.bb</a><br>
index b851d46351..f5a2888016 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"https://urldefense.com/v3/__http:=
/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__=
yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$" target=3D"_blank">apr-util_1=
.6.1.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"https://urldefense.com/v3/__http:=
/apr-util_1.6.1.bb__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__=
yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XIvEEi5T$" target=3D"_blank">apr-util_1=
.6.1.bb</a><br>
@@ -14,7 +14,8 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.g=
z \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://configure_fixes.patch \<br=
>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://run-ptest \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-Fix-error-handling-in=
-gdbm.patch \<br>
-&quot;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://CVE-2022-25147.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
<br>
&nbsp;SRC_URI[md5sum] =3D &quot;bd502b9a8670a8012c4d90c31a84955f&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;b65e40713da57d004123b6319828be7f1273fbc6=
490e145874ee1177e112c459&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177496): <a href=3D"https://urldefense.com/v3/__https:/=
lists.openembedded.org/g/openembedded-core/message/177496__;!!AjveYdw8EvQ!e=
smjxUfJK-k9hsO2YirQJFIQnxsXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6=
XJm6XEay$" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/177496</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.openem=
bedded.org/mt/97108181/924729__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnxsXz=
CV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XAvKdrkF$" target=3D"_blank"=
>
https://lists.openembedded.org/mt/97108181/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.openembedd=
ed.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!esmjxUfJK-k9hsO2YirQJFIQnx=
sXzCV4RtEx_M__yeayUk40QbNFQWJtPzT-sS5xElVB-xSOU2N6XOfvUNlL$" target=3D"_bla=
nk">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB5550B49CF75B575F3984553DE4AA9DM4PR11MB5550namp_--

