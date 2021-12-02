Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D92C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 12:37:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.7739.1638448627095556443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KnK3PjiI;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79705ebf0d=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B2CURWV005094
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Dec 2021 12:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=PJF0j3tfkXk79OCQNi1AbhcPQFVJG50gi8sxKQ9HcCg=;
 b=KnK3PjiIZTyfK8b3EPBTlIBCj6aToHqqkduSw4pgIlokl3ZM5tCKNEddO/oH9Efkov3Q
 kjr22iBosyg5G/4SOfFqjj7EKpah4a5JSjWBY9/deRjwJJxCUKJ9jcesD/3m3Wjl+NvD
 IfTr5nLbB5B2uqzg5+EnCWJ2CyKSqQk3r0lho7Rdztlfa9x1a6kvvi1I9kUh46Rtvt4x
 KBxz2IEoyzrshl1+CV237hRKyXUEFQJUjF9K2+RhCS3MnbwKvM1dbOfoihufk5DMh3r7
 EYz7h6W1D/OuEmRbfcYJs6YUOizMsa2aT/BYOA3DTxENhe5xC9rRjtCQaI6jMSzA2/Eq sw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cnymg1btx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 12:37:06 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1B2Cb5wf019956
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Dec 2021 12:37:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cnymg1btw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Dec 2021 12:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2hwaQ3hSGtCczk+GOO3Gg3cgzuISPXF+BjeFZe5d3b5E+RpX9krwiOHNjzqGRuukHjH+uCmWWYY0dxn38sPT7J7+dImbqoCS0bkMKBcOg/idoWcLprxqwBT1MD8qM7rkD4SeaSOYxFepjfQ8aM8FaEo5KI8VU6lB+gEe/Wedo38OnwzDOzZavhVncwTWkbsSAlhxnq9lLKXh8qLyjyYS8hMW5Yyb9X7sMNw+10fXGBkkQsPSW39CkU/CbQ3QyHs0rrPWOa2syyUYdwIwoZ8hTjjNUJRseJ05UfEeLojKuexqQKYVfaNricu7PsnizfQ6nlmYYcGpQaqmdWq4yr7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJF0j3tfkXk79OCQNi1AbhcPQFVJG50gi8sxKQ9HcCg=;
 b=WShiPvXwp0fA/B1g3PV+NRkphnvdcfpGpbwVYkW+sra833DQv8CVlcGAAe52p4e4NlEgx6/Lq15YPl4KRSPJ1M2njscnm6xi6TGK9Lu+0TH+y0XzqDuO0BM+8F4CYHYD19V0RWVlw7aoaec5MDiffy+f/N3CfVgJ91gqpzzBquBmD2PpeHEDy86g7RSt2MHneAvl3Qgfnb1HZoxltJna57PNZno8jDEhxf6a425eb2s3TNW04CrE/jYQICw4pyUKTqUg3Xe04GOoIukMebsmfj/yz3fexlG/VI/6lxKDxcc5PufHdfqLQHtHi6x01CwUG+/ntY2N31Xb6VN8pyLDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by SN6PR11MB3342.namprd11.prod.outlook.com (2603:10b6:805:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 12:37:03 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::997d:91ed:f5d3:9293]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::997d:91ed:f5d3:9293%3]) with mapi id 15.20.4649.018; Thu, 2 Dec 2021
 12:37:02 +0000
Date: Thu, 2 Dec 2021 20:36:48 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Linux Yocto <linux-yocto@lists.yoctoproject.org>
Subject: Re: [PATCH] linux-yocto-dev: Make -dev kernel work for a fixed
 revision
Message-ID: <Yai94FCDxrdyG1oR@pek-khao-d2>
References: <20211201043934.3212357-1-kexin.hao@windriver.com>
 <f2c3aa7c59a874f99b80d49bde596e93664a5392.camel@linuxfoundation.org>
 <CADkTA4N_zXDJVH8hwZMVqa+tsHvrm4zD+UDKiYV4qHwu4WPx3g@mail.gmail.com>
 <Yah0YhJFeqv7gRrU@pek-khao-d2>
 <CADkTA4Oe-CrRKqeBe3Anq49dmSLN2UpOSB+bOmkbmh523aF65Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zor4A3EO9o7YW9od"
Content-Disposition: inline
In-Reply-To: 
 <CADkTA4Oe-CrRKqeBe3Anq49dmSLN2UpOSB+bOmkbmh523aF65Q@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0172.apcprd02.prod.outlook.com
 (2603:1096:201:1f::32) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
Received: from pek-khao-d2 (147.11.105.121) by
 HK2PR02CA0172.apcprd02.prod.outlook.com (2603:1096:201:1f::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Thu, 2 Dec 2021 12:36:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d34ae879-e755-4088-935b-08d9b59070f4
X-MS-TrafficTypeDiagnostic: SN6PR11MB3342:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3342BEBF80BB8B98580D3299E2699@SN6PR11MB3342.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WffD5qIx35oM8NCH9hW4venJuOrxi8YxM13/3YbeNb5EOLkiaDaCQzAZ0sSuu039C0bF7YZABm1fP+JzAivjVPzZuMRUORtRdynD/5LjMSy34/w1zY9S2f3yG8wzYJwJoe0XecgZdcvuczxsLcIql+KNyL4uZIy2B4LesrCW8yqFgQ88cM9SZy5WUKGy4gax6rdF4mdebCyDcs/HdpbgBLaFM9t1xUBwIiJKjSm3cfX03Pp95a390D5oQrxQCzpzuEZ0HSQs4tMZuavPbLoRItWqKjlm1cXE4uZCfxdjh7bDVnOEjfsGgtZ6cDqtnOcZLtAn898y2JfwdSe8veVMK3F1l26x51bV//CJx7sKfyUo0sGHW/i5xGudh51U+SNoDWzFb9tIcb5QE2Ho4OhsKhD6Uy+6VgSEQrqwmsFQKF2RLyZGc/tvJAWyef8B5laZ+W5X2bQ5ko/53zI/lUHzWVpGkMIO4hiUObDaQds1Jw59ljvk5WIc7tG82S2mFN67VDr9cG8GbQtVnNLMWIQ+jjepcBSpxFyuWM7xRYc/cpWwmfKWwEt7Y+uWITPKS+tWNcXa2NFvvRp+AQ91U8DZC/Oy3P1VVseN4LbGxhcDzE+rofpYXi4+YuGpwcfO+fWXJd2bUab/y440GNFK7lFyBQpN6q6wYXhz0XHts+n8c9KPIo2LP4zO58yL6LEqOXOsPMeB9AV06UsFKNlCc8GfFIvKp4lUAS/bawwDryfBJLE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(44144004)(33716001)(508600001)(2906002)(52116002)(4326008)(6666004)(66476007)(8676002)(6916009)(55016003)(66946007)(38100700002)(83380400001)(66556008)(38350700002)(5660300002)(316002)(9686003)(54906003)(86362001)(186003)(21480400003)(956004)(8936002)(26005)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GZ2XveOC76TnMP30AoYrxwKdr5LfhAlz0s+9FWENxhTfNRey5Adwc1343CLv?=
 =?us-ascii?Q?Y5HmO+OgNiq3+auArtorbFIaID/5HmDF0Gfoo1gBcAF+RlAej5k1kWMDWrn9?=
 =?us-ascii?Q?CH2hE7wbV3mtcDhaVOWyF55nPvdMvt0Ywk0+k8GtXegAT0ySDInip+kpcfIR?=
 =?us-ascii?Q?OZj2O3eemzZU/KRVXz6Qbt+Ey/rVZRoAIMyprPV9ucLh4l7FoGJ9MkewEeEl?=
 =?us-ascii?Q?pz0Ptg0CvwDy4z59YCa4ezKqrw8eGQN9eClCK4KUSnxkiP4cDpPkabHjn6wb?=
 =?us-ascii?Q?FDWfDAo9MF6TFIHmwHCZtDVcvlOUu/gvaMWTRtEb8Vh5qstBqQeQhsFZHFYZ?=
 =?us-ascii?Q?idDmyX+fWwtebHIEwVeRz1F+Dp3XYtEmLLgb68BfaULToPlZdTutcKh/xPYi?=
 =?us-ascii?Q?RhV6ucmuPSmPuQMFG4vkM6VgCkBolTddiNm7p/lscidK6wWm8SZM0+Tzc5Oi?=
 =?us-ascii?Q?//0eZpi3xvMtVcr19t0cz0Ke/BMRuBVJxLHQgPu6evuYp39JTEn/edlvJL4H?=
 =?us-ascii?Q?zqyZQYr3O7lK4zJ9P7Z5Okqf+BGa5s9t8njjqqFATF8zM6ULbDKBuyHxoh5r?=
 =?us-ascii?Q?AojPaAmZ7ii/F00PnYSnz4f8AFkjAGJwVcDL0hF6lyferb3bEB2jpM402Dtu?=
 =?us-ascii?Q?UOb/1gtdDQzoKcGM6o7t2xo64vLPuKMSIXTuduiPnIjsAfDyxMQ2NGMjViHe?=
 =?us-ascii?Q?ucSyVibz15JX9K1xOtZGviH/Kdpu14Rba002O1RH2Fs6Iz2GjoVVhy6nVdX8?=
 =?us-ascii?Q?Y3u1y7QYGp+Ffq+sLZl69kCyRHznippQSrpDDkLVPCEhIpEEARb7jYUoBMJc?=
 =?us-ascii?Q?WTGBtr6pEavPq7zn2FuZ/vlZ58yal+t4aM6BUAx0qhjY2C6XaBHuxnLCfkkU?=
 =?us-ascii?Q?Y+jT3VclnkihuSI1KFOHbTK//A3RhatRdWH2J9LSmzV9muiuYi7BeHIMMxfi?=
 =?us-ascii?Q?GYwnsHZKoZPdO+GqC0icJSG7pC+H6opJLj8fNlS9DCpjRI6u1C+CXkTFKL97?=
 =?us-ascii?Q?JOG2tBmqLXwkAua9Evde2cpRGFFtRmA8LqJtVmF642qtwrwUO7a2Fz0bGfjq?=
 =?us-ascii?Q?Cof9+BTq2hQ+NXNoqHk/r26Ti1EqDqvW1m5I8S1YpMLqN2RKJRvoGpB77SdZ?=
 =?us-ascii?Q?6/lSC1oHmTSsyEN64rdwNmliBWE3eUfyUz5v08S+xW5S5eGDUzxDrd77HbGV?=
 =?us-ascii?Q?7Oq9neuuiZ6dHhiuQP5rUjs++romlWX5rp0dvWvmPs8Am5tkL3s4qpPHCsaz?=
 =?us-ascii?Q?HXV0AbLafk0s9ASDINhZdQaIWEvrkRMgbWqky5KyEcqLTmkzio1bxud3f8Qi?=
 =?us-ascii?Q?mrX76TODNC0Ow5Jdc9yxEEVgKEv7ajYGNe6ujdjAUF4gRsqpxhGdpiJnQ0Jd?=
 =?us-ascii?Q?XXOevwglXXHVtaDsNJDG19oOQtkBfwt5/4uJZNuJ1Tv/wfjJG7TnDLyUmF7+?=
 =?us-ascii?Q?X5K/3rz4nsSuLc3GuT38RTSaIpcVviC2FBZY/Xw5YdLSVwKvvw2xeg54+NHB?=
 =?us-ascii?Q?7TGkqo+I85Tq5pwEv5raIQRDHgwKoogOLmD6p9ZwUWkRfP2aT0FhTmJpJ8Hi?=
 =?us-ascii?Q?sJjIVC0/dXCcbn2o2G8BemY0JY6oqsSzNWXOdbz/Lik0Zt4fgBzCwED6i+aB?=
 =?us-ascii?Q?BlvIgYoL3Iq2HDyjgmlBCcM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d34ae879-e755-4088-935b-08d9b59070f4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 12:37:02.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5lOD3pQLyG0m6TBzF2NuRy1kZRsdJ4ZzNh7YKw81FFKMng+FJY9qfy4G+nZe6wKbUWM6HoQKMb3x/X1uRdj+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3342
X-Proofpoint-GUID: A4JUFQKwEaxD187RextD2AmNTjjVKqig
X-Proofpoint-ORIG-GUID: 2i8A-W7a7jzXWddcAiApW5WI8NpS1p-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-12-02_07,2021-12-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 mlxlogscore=819 impostorscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 12:37:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159088

--zor4A3EO9o7YW9od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 07:31:52AM -0500, Bruce Ashfield wrote:
> > That would be great if you can do so.
>=20
> ok. Let's solve this with an explicit KBRANCH with your pinned SRCREVs
> for now, and I'll update -dev to use versioned branches for the current
> 5.16 cycle and all new versions that follow.

Thanks Bruce.

Kevin

--zor4A3EO9o7YW9od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmGoveAACgkQk1jtMN6u
sXG3MQf/SBfEFeHaIzTys9gwNJgdyDYSuKT0Zs3Gq8I2+HcF9hn3OvaiZCTRvg1c
/GEFo4g1wNSnvsAnVZ7j63P1PNupqtGV7ymyEFSTT16gdOK0lfdxxJ8nVWxn3jm4
Vs+1Kh+Hkkak1oKD3rvJa2SyJP1/ppRKs7y8OrRHerMUBgmjA/NNmFDhQncB6vwx
lgOf/gOuGRhTjRpx7HXCnh9fztj+oC0McJvlKEMO8Y3ToqcZaVblmSgRCxWgI4yq
F+foRObrhf2yHL85YaqAJI8gYzw+GW5dB6qkW1zqQgJlMBx5Yv4hDvvH3o86tMDH
UNY68E4XKHCP1VS7XnZfHu8dqD+YDQ==
=ottf
-----END PGP SIGNATURE-----

--zor4A3EO9o7YW9od--

