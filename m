Return-Path: <quic_ericsmit@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E632D3C541
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 01:47:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.13543.1729216029470575400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 18:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=N5bKF9sL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_ericsmit@quicinc.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HE3vl0007525
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 01:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ntp7lLyODE/RjrKS0qWOL9t0alDUEM+Xl0wJzI1AjwY=; b=N5
	bKF9sL+YsY8TKGG0nl69WuqZW0GCYZp55pro6Qwt3fHPFug09NJuz2V4SreSELYo
	NOE7QDbQWGqh/zOr1nyKMlC5X+d4b9nDkc5J1iqTy897pMxF6u9ETKY1SvSkD2Oh
	lobbZ/GjsXZNCHW0mHFX+ipDvEe7f5g2XCKp7bFKk/kW1cLCQ3NT5xxTkICIG6ae
	JEvXw1wVXm2fyWvvAcfeBGoR0Wnb7j/nazG34TEEvvqij71xIFxgca37e0rUELV5
	RxsZhR6/QeKzz1LV6iBpG+JjnPpqiGhd9MBREcv38dPpBLHZpsJyVh3Ix7VQRRMH
	gfMLVpNDDTEjJyFRp18Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc3cdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 01:47:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp9ra0N1YpJUvRY9YYNu4DoTztvTXd8a9RXx+CuXMB94dy+EZtjbb+oaVX5yJOpy0ZENcl9xez4zBBUY78/yc5Xga3F2Uv7ff2lRX7BFGOJqqWU0TaOgSdEj7cKEj5BK9B7OQcS5JHmEw1D/iJiGA2w9UORNAhljwi8xJFNZkpahhNL5Rp6cgpnXdZ37SJsQGhjfvOs5UXcOfh3SMqwdqIqGYX0Hu7oxuoJ2GDKjQgWs23G7PJ6WN4JKwx7NiPIOoelr38m88dL6q3ngIsnQTQJYwzUZIa9K4/I7NR9mgMW1wjcJRzFmeHr0LXOmea5jJExtaqdHSmmrsF7fyv4Gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntp7lLyODE/RjrKS0qWOL9t0alDUEM+Xl0wJzI1AjwY=;
 b=oVXTbCDFDgROVB6dWSOR3HqJzit48aqSn7xMqTqnDVaYSdSgO/2n9o0VkLWSMRD/59wDQ5kvJRILx4mGL+3GRx3bYljquHU8BfDfvktFml1R+6zHg/Ol3XqnuXvVeRlXDsX1L+kUemjuHEEsFmgoyYIAJOy+foYcN5XWOFgicYu0+5ucTsEptweN/A3K9AAU5YwdmnEpmH5wEGhl8gG0jpJwQrp2e0GK5kwbDSYasAtL45onc8QSzjLQSItlfMfJ9jGsT4fqtxlGrk3OuWW5wMqG5BktEbsBKMO//8QBV0V5CXt0bADBibmm8UfVUpIIcsgvlkynzYeu6M16mw1Z6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SA3PR02MB10115.namprd02.prod.outlook.com
 (2603:10b6:806:398::21) by CH0PR02MB8118.namprd02.prod.outlook.com
 (2603:10b6:610:10b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 01:47:05 +0000
Received: from SA3PR02MB10115.namprd02.prod.outlook.com
 ([fe80::7d60:bda1:e5db:49f5]) by SA3PR02MB10115.namprd02.prod.outlook.com
 ([fe80::7d60:bda1:e5db:49f5%3]) with mapi id 15.20.8048.017; Fri, 18 Oct 2024
 01:47:04 +0000
From: "Eric Smith (QUIC)" <quic_ericsmit@quicinc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: systemctl native script does not support WantedBy=%i.target
Thread-Topic: systemctl native script does not support WantedBy=%i.target
Thread-Index: AQHbIP+Tvzs2gIuJe0iDClYlABh3nA==
Date: Fri, 18 Oct 2024 01:47:04 +0000
Message-ID: 
 <SA3PR02MB101158D739751F29809CDC851C1402@SA3PR02MB10115.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR02MB10115:EE_|CH0PR02MB8118:EE_
x-ms-office365-filtering-correlation-id: 04335aac-0960-4d61-2ce6-08dcef16c4b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?ld/AHWuF75tdKxnDDrT7c8BwvrNqBUzEeLzpFcoi050PTMRFk2uabUrO?=
 =?Windows-1252?Q?blmBvgXo56rlS3+6mn9suHhcZRQ5FScT+sdGY6JOKL1ceWTBh3oRBO5R?=
 =?Windows-1252?Q?hBWPkr/vmDosn/UYzJjBDH5bdyqgVybRgQNkmJEcXjHbVqQHfqK1criR?=
 =?Windows-1252?Q?UKyA4IsS7xEuNi1ro2qVM6LORqZlYO+cKVy/BsL9LlJG6/r9e5RIBdxx?=
 =?Windows-1252?Q?no6KZKRw5813L0kf5znU0a/5j3DLFBS6oIC6xmmWTI37HrYVNVJ5Yuih?=
 =?Windows-1252?Q?xAVg+pLjP7/CNj8Rbyep58czHgjlBhvBWA3y3Clb6PcL5JjuK38KuJ2P?=
 =?Windows-1252?Q?wFTJAX3BNOrWULv+YVVXf2N02nJKnpQy0fwVluXZsx+zTJ+HQX5ItsEI?=
 =?Windows-1252?Q?w7ssnpVuRiAcFXpETNGymTHOS8N36/D5/Z/YkCEg/Aizi9IaMcF6wvgc?=
 =?Windows-1252?Q?PiJMP8ULf7/Lje6WAu3hW7QCc06Vq6YxjrxY2upNaY5yNhpr9iGxBpRT?=
 =?Windows-1252?Q?PePv8kz0gkaKBX5+r0ZN5dcxnb/FU3gyhOM280vNJbcKR2EHbnkWYCbV?=
 =?Windows-1252?Q?zcsltGWVf/dC+gvzy8cB6v2fRHCW5spGbSElGMFlPd52Huym4F72IlUA?=
 =?Windows-1252?Q?/EiwTENibk3Y4ha+6oH8B1BQHf/C+axTHlTHYv3WhDHXHzCUjHbqB+sS?=
 =?Windows-1252?Q?+6nlDcHnsJ7dbM9VgmtCxnT+RvFfncnbjRZzkK2u3dhy9Zv+L1wYFMmM?=
 =?Windows-1252?Q?izzfGbajTSjQ7ml10+ReurRiGgjKr2XXC3wgqo53wBX+C7cdDjHYpcMz?=
 =?Windows-1252?Q?rxr9fks5RLYihoYGlSn3uR9S7WAsFEIUzGLRzVG7HBubyhKg/WW51ueT?=
 =?Windows-1252?Q?BrCw8EAReMPYeFseUBQzrj8zNJ1A78QWdZnuKFwYYYQuI1EHRZn75xIk?=
 =?Windows-1252?Q?dAaR93jiYUNhAWPn4zWVyOHLpgTsh9ongkHCMZdYiJT9ot0+9JecjF12?=
 =?Windows-1252?Q?h6ZOxwMkg/jeQ0tRQDCJ31Og9HJW3M3jhoon8lvsKql44hoE8ewuneo6?=
 =?Windows-1252?Q?iBavRS9tLZt3DXMA6mL55Hfo/nlP6bi25Rd3DS8HHN70JzEq12dRLuwu?=
 =?Windows-1252?Q?VS9zpFwfXvC9wfUA46CMZ66pBouvEXpCQHcCmINH3XCufQH0YOY4vz4K?=
 =?Windows-1252?Q?+c/1v7/trtmWcOvjKFTYCjCRZ22DMKfCPl3bkDwiJNmRVFd9nlrsFd8K?=
 =?Windows-1252?Q?1EEm+aabXfFrym6MAl1ufqn7OJjvi3fnJ/ohIULPTym9usAMhbJxL8jQ?=
 =?Windows-1252?Q?2vjoe+PYKum/P/X6/VLcRol8wk+MzzOUDczREBWFZNC1gjYBl7bOudKr?=
 =?Windows-1252?Q?5VPfja7DbxdOy9CVKwmePk+nBw7F8YLFhxRHyQPWNc80hyqJxMDfUZK7?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR02MB10115.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?SIC16/HlWTLshRlcVAAvpBJBlAvHtiVdwfDkER1WtO1zEfBdVD9tvybm?=
 =?Windows-1252?Q?dEgKfPB5Cw6D9b/R9Pi2oo42v1tUDJ/27KTMCo9iAGxro8Tv7zhTJEB/?=
 =?Windows-1252?Q?yIo8OOHce/7iPRiNkPC4dM2bThNiLqv3R30w/elmudtxY1ACcW5l9sMJ?=
 =?Windows-1252?Q?RLPkWbeZd9KuaKtW0YclucQ9HFDuld4em+dccId/IMJAelJauvhRYXEt?=
 =?Windows-1252?Q?8CXNnal5ZCPEucKMtqH1X42VzcqzEO4HQvZdmbfzu79JI1Wh8BOoYuap?=
 =?Windows-1252?Q?ISLv3/lLaDFpjUAUfRzOcv23Whr/UvyfFMTnHuDCtCJtZevfJ/++MW60?=
 =?Windows-1252?Q?zf7Hn40HjW/dfP3tX9pVUic3Fstccs99bun/HWRa9z0SWMsIjccmVn9U?=
 =?Windows-1252?Q?mhBgeo7Y6LAtDgCXiuxAzRHtxdwpXb6TX6TqtLDBIcmcfZyCiSDEJ3it?=
 =?Windows-1252?Q?omp+QP/wqF2X+7kdHLcON2rdvb5ULPmQxkEhVie1MLaNLOQ3MSeNQB9a?=
 =?Windows-1252?Q?+lgdhEoMMasS5jn8bTlT3e0FBOFk8XOyeNUkysXEXXrjXoxlh+w9jfEK?=
 =?Windows-1252?Q?AoENbuLZr1Y5UWQuhMp/ok8sUNGpjci4TsVC3MaDY9AjikEFkWwwjjgJ?=
 =?Windows-1252?Q?7lhPIMnWgbZZUg67ZCgnNTHuz2QEffO7DEYd1m4E7PREc12CkMvMjPxO?=
 =?Windows-1252?Q?qQ8pOsIXqbo6H6EHSBCKXgMYRYW+IA4/3jwAXKyAaMERTAzbiSxmIzKc?=
 =?Windows-1252?Q?uIUEya28uDmxy0igw0meuh6ijJMtsAcKoFGNrcjImhGD462GpjOjxnSD?=
 =?Windows-1252?Q?s/xuGWNnlRUoMYbmDYz+KOwEvI2gLm+Sxl1agDGbF7EejXXvyKp3Xjsn?=
 =?Windows-1252?Q?sCF8gTVQ+87O5Sh6A9OuUF+SxPWqdaGuuVjZmswNjDdmA0J9dHqABDUX?=
 =?Windows-1252?Q?5SXvSkPnJcmEkmogQRxykqw2lO6KjqUwq+aPOI6zYLyTkZo5x1UWc3y5?=
 =?Windows-1252?Q?r0xcvxE4IZc4NvbtEFIuKrCNMRgSg4p+eYbU2JktMx8E6CMrx9RHHNgt?=
 =?Windows-1252?Q?e3whux2uTcu/0uB3EUCbxZ0p0cUpkeU4w9tg6E1X2CNLi0QctNRn14KV?=
 =?Windows-1252?Q?0QuxoHpnK+6D4eCMP3quxwtVZbsCRlEKJDHaL0hRYDlfkVpzyy+Cm/dk?=
 =?Windows-1252?Q?GKkLiywODDseErwFW6ciGP8DJzmm9ADmpkORm2halxYc+VxqDCMPbSsB?=
 =?Windows-1252?Q?mILOEIpzMSUrFEDXquzzN/NnMiDWSoxLfGEtAA783rFQu10WwUd32RGu?=
 =?Windows-1252?Q?xqL46kCXQSfpzIqslq2yccL2QsN1S5Sa2Q/GGdPNmEodbP3fTRoZQujY?=
 =?Windows-1252?Q?qzdtYATnTIA0O+Il5T2pP/8nQPuba9cJKO0KvFd3fDWNBNkG77mlRaX1?=
 =?Windows-1252?Q?zfOrWcwtVo9m+pXuOUAAsBR/J3tXSH0O5n2UIDoNj/xHfi4JUhWB7usp?=
 =?Windows-1252?Q?VXwhlJJqJCXhelg75UgNBAgFguezPSQ5HADvpW2YNb8DUYBOqR6sOeEK?=
 =?Windows-1252?Q?fciCo7eOoHZF7tQzpG2tDZvJ62z6L0KP9TO5aDVU/WH0lwburmUkmtz0?=
 =?Windows-1252?Q?mPl4fHVEozLF2fJ4e1W0yccSdVCgwEjIB+jE1AN407irDVVQ6DKuZ3bI?=
 =?Windows-1252?Q?JdkSxZtLAes=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA3PR02MB101158D739751F29809CDC851C1402SA3PR02MB10115na_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	86eXIJg4THGSoJyNiRpntWojKA/h7LJYNaop0FixuDe3oRE8/3aHSJ/z0izBZAFmkUtbm+kIUiSwdGGZcAk7XhoGRp/XQqR9imjf3NohPCgOuLYQ/v5fFQ/cO1k8cyF8i0nvxiS+4r7phzPbGDs8IsV8x7yNkDvgFSs/HYUsDikqjL8oby0sFaVsNAOjhx8gXv5vWEc2OkEW23DrEZyAK/XQOQq7hnHKmwIb0s/jSkU1koRaTU6A2LgRu79Njt6qMnOLjD2xVLSyww+etaSDqu2KrSn56VbdjvvOHtIc0i6R6TTA+JE0559kxlQZ1TKrtPjviY1Sroqf/4xG+woQlmZowyPzePbnoDqKwciYQNCepGlQx4rLYmjp/dbSScq18ib55cd/VMiwbX2d56Wy/EOEZFPODLDzN1LT2DcvKRTjwZTv/msl427R89MBGVu7RZ3AQEybmGzFV3QHFf3QF4txdkyU+6rwNpTU0RXThhrqnZUubeC9NQXjaT+zcSzSvChWIwlJtVzBb6ZiRi3uCIHGFXqghLgh3qSEuUkBUW1ETDpzFaX2COLmVrcvWJrzPtypKWBYvD2S4KweMcDgpBX7KELoFXmnbq0YwULs/YrL56lKlsjJtKCG2Q45W65e
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR02MB10115.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04335aac-0960-4d61-2ce6-08dcef16c4b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 01:47:04.7509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YoAwYbG4UyxWRMW/QJuHMUPFQZK5VxleGwPbQEeGPMyvoj7MJKQ9+vv7BNsiEVXpmI3nF1vGfoh891eKhjuedg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8118
X-Proofpoint-GUID: -UuTBmXa5leJglOTqe3wxc5KbvynbjL9
X-Proofpoint-ORIG-GUID: -UuTBmXa5leJglOTqe3wxc5KbvynbjL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=987 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 01:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206035

--_000_SA3PR02MB101158D739751F29809CDC851C1402SA3PR02MB10115na_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello openembedded-core developers,



We are using systemd service files that use instance name to configure thei=
r WantedBy dependency. The names of the services could be abc@multi-user.se=
rvice<mailto:abc@multi-user.service> or abc@basic.service<mailto:abc@basic.=
service> =96 the abc@.service<mailto:abc@.service> is a template systemd se=
rvice that reference the instance using =93%i=94 in the [Install] section.



[Install]

WantedBy=3D%i.target



Expected behavior: When enabling abc@multi-user.service, WantedBy=3D%i.targ=
et is replaced as WantedBy=3Dmulti-user.target because the abc@multi-user.s=
ervice=92s<mailto:abc@multi-user.service%E2%80%99s> instance name is =93mul=
ti-user=94. And the enable script would then create a symlink from /etc/sys=
temd/system/multi-user.target.wants/abc@.service -> /usr/lib/systemd/system=
/abc@.service



Actual behavior: When using openembedded-core=92s native systemctl script f=
or enabling abc@multi-user.service during a yocto build, the %i is not repl=
aced. The symlink created is /etc/systemd/system/%i.target.wants/abc@multi-=
user.service -> /usr/lib/systemd/system/abc@.service



Currently, for Yocto=92s systemctl script to replace the =93%i=94 with inst=
ance, the first character after WantedBy=3D must not be a =93%=94 character=
. The regex used is in https://github.com/openembedded/openembedded-core/bl=
ob/master/meta/recipes-core/systemd/systemd-systemctl/systemctl#L205 (pasti=
ng the github mirror link because the normal git repo is inaccessible at my=
 end currently).


It seems like faulty behavior from my perspective. Systemd.unit<https://www=
.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers> =
man page does not mention any restriction about having =93%i=94 be the firs=
t pattern after WantedBy=3D, and systemd=92s systemctl program currently al=
lows WantedBy=3D%i.target.



Thank you,

Eric


--_000_SA3PR02MB101158D739751F29809CDC851C1402SA3PR02MB10115na_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; ba=
ckground-color: rgb(255, 255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">Hello openembedded-core developers,</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">&nbsp;</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">We are using systemd service files that use instance name to =
configure their WantedBy&nbsp;dependency. The names of the services could b=
e
</span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; colo=
r: rgb(70, 120, 134);"><u><a href=3D"mailto:abc@multi-user.service" id=3D"O=
WA2afe2ccd-6cc4-a9b9-85dd-236158686a94" class=3D"x_x_OWAAutoLink" data-link=
index=3D"0" style=3D"color: rgb(70, 120, 134); margin: 0px;">abc@multi-user=
.service</a></u></span><span style=3D"font-family: Aptos, sans-serif; font-=
size: 11pt; color: rgb(36, 36, 36);">&nbsp;or
</span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; colo=
r: rgb(70, 120, 134);"><u><a href=3D"mailto:abc@basic.service" id=3D"OWA100=
1177c-b122-58e6-3a2d-3e8b163bf9ff" class=3D"x_x_OWAAutoLink" data-linkindex=
=3D"1" style=3D"color: rgb(70, 120, 134); margin: 0px;">abc@basic.service</=
a></u></span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt=
; color: rgb(36, 36, 36);">&nbsp;=96
 the </span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt;=
 color: rgb(70, 120, 134);"><u><a href=3D"mailto:abc@.service" id=3D"OWA663=
63fd3-2e11-15e9-e746-7bdb71532ff6" class=3D"x_x_OWAAutoLink" data-linkindex=
=3D"2" style=3D"color: rgb(70, 120, 134); margin: 0px;">abc@.service</a></u=
></span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; col=
or: rgb(36, 36, 36);">&nbsp;is
 a template systemd service that reference the instance using =93%i=94 in t=
he [Install] section.</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">&nbsp;</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">[Install]</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">WantedBy=3D%i.target</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">&nbsp;</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);"><b>Expected behavior</b>: When enabling
</span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; colo=
r: rgb(70, 120, 134);"><u>abc@multi-user.service</u></span><span style=3D"f=
ont-family: Aptos, sans-serif; font-size: 11pt; color: rgb(36, 36, 36);">, =
WantedBy=3D%i.target&nbsp;is replaced as WantedBy=3Dmulti-user.target&nbsp;=
because
 the </span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt;=
 color: rgb(70, 120, 134);"><u><a href=3D"mailto:abc@multi-user.service%E2%=
80%99s" id=3D"OWA06610352-d20b-b813-a856-ce68c2900077" class=3D"x_x_OWAAuto=
Link" data-linkindex=3D"3" style=3D"color: rgb(70, 120, 134); margin: 0px;"=
>abc@multi-user.service=92s</a></u></span><span style=3D"font-family: Aptos=
, sans-serif; font-size: 11pt; color: rgb(36, 36, 36);">&nbsp;instance
 name is =93multi-user=94. And the enable script would then create a symlin=
k&nbsp;from </span>
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
70, 120, 134);"><u>/etc/systemd/system/multi-user.target.wants/abc@.service=
</u></span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; =
color: rgb(36, 36, 36);">&nbsp;-&gt; /usr/lib/systemd/system/abc@.service</=
span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">&nbsp;</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);"><b>Actual behavior:</b>&nbsp;When using openembedded-core=92s=
 native systemctl&nbsp;script for enabling
</span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; colo=
r: rgb(70, 120, 134);"><u>abc@multi-user.service</u></span><span style=3D"f=
ont-family: Aptos, sans-serif; font-size: 11pt; color: rgb(36, 36, 36);">&n=
bsp;during a yocto&nbsp;build, the %i&nbsp;is not replaced.
 The symlink created is /etc/systemd/system/%i.target.wants/abc@multi-user.=
service -&gt; /usr/lib/systemd/system/abc@.service</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">&nbsp;</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">Currently, for Yocto=92s systemctl&nbsp;script to replace the=
 =93%i=94 with instance, the first character after WantedBy=3D must not be =
a =93%=94 character. The regex used is in
</span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; colo=
r: rgb(70, 120, 134);"><u><a href=3D"https://github.com/openembedded/openem=
bedded-core/blob/master/meta/recipes-core/systemd/systemd-systemctl/systemc=
tl#L205" id=3D"OWA5e0005be-a4cd-af15-1166-79ad7a9c42ae" class=3D"OWAAutoLin=
k" title=3D"https://github.com/openembedded/openembedded-core/blob/master/m=
eta/recipes-core/systemd/systemd-systemctl/systemctl#L205" data-auth=3D"Not=
Applicable" data-linkindex=3D"4" style=3D"margin: 0px;">https://github.com/=
openembedded/openembedded-core/blob/master/meta/recipes-core/systemd/system=
d-systemctl/systemctl#L205</a></u></span><span style=3D"font-family: Aptos,=
 sans-serif; font-size: 11pt; color: rgb(36, 36, 36);">&nbsp;(pasting
 the github&nbsp;mirror link because the normal git repo is inaccessible at=
 my end currently).</span></p>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, sans-serif; font-size: 11pt; =
color: rgb(36, 36, 36);">
<br>
</div>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">It seems like faulty behavior from my perspective.
</span><span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; colo=
r: rgb(70, 120, 134);"><u><a href=3D"https://www.freedesktop.org/software/s=
ystemd/man/latest/systemd.unit.html#Specifiers" id=3D"OWA4865f434-c537-9bdf=
-a668-13f94fba87bd" class=3D"x_x_OWAAutoLink" data-linkindex=3D"5" data-aut=
h=3D"NotApplicable" style=3D"color: rgb(70, 120, 134); margin: 0px;">System=
d.unit</a></u></span><span style=3D"font-family: Aptos, sans-serif; font-si=
ze: 11pt; color: rgb(36, 36, 36);">&nbsp;man
 page does not mention any restriction about having =93%i=94 be the first p=
attern after WantedBy=3D, and systemd=92s systemctl&nbsp;program currently =
allows WantedBy=3D%i.target.</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">&nbsp;</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">Thank you,</span></p>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0in;">
<span style=3D"font-family: Aptos, sans-serif; font-size: 11pt; color: rgb(=
36, 36, 36);">Eric</span></p>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_SA3PR02MB101158D739751F29809CDC851C1402SA3PR02MB10115na_--

