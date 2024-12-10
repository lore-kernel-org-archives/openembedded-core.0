Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBCFE7717D
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 01:41:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.444.1733794906407298132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 17:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2074077de8=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA12AUg006980
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Dec 2024 17:41:46 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx1u254a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 17:41:45 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BA1fjEv032144;
	Mon, 9 Dec 2024 17:41:45 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx1u2549-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 17:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCQ5fnURbuKYQZMi6BJp64M2BXJnCJ1JNOx2euKOmJD+YzIfdtQf5VW6igrmFMd2BjqNPNBPNhug0I78vV5u9Zsm0qbxzogyAJKyVNsitHY765opdxPqr0OWayD+048lCV5w0UAf2dan3AN+2jJknrfkeDZgCgvd5jLyIPcvuamWHPnrWe1Rp+FH8aUsN9BiY5ZFng8h+BswEALE2dMnJzEEhWO8ne/dUJFMbgMhHvjRomulXYX5LXQe6BI0s481mQHLSuUi3ZeBwXOrbPRvNROQ3zHu5BS73WwDPBffs6qqeB/NWIpl+wPb9zdj45l9orm9+vAtc6K9djoVvOTkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fpt+3zeNrelI6ZuZaybLQpvaIJVC01yC76Xsgm2YNYo=;
 b=gSyiocb+b6Aglb84ZKWJeK80nbdRnrxl+INBNu8LwWHVAWp1zwXGmOu7TxVQ7FZC5Jkw1oc2yH68YVX+4//NIwQZoiboxH2D4r8vRQV28hF9EMmlXfpnBmOMKDVEVwXIgxXhULZLGu2i/XgRWLHqMjSv2FeBUq3ns246YbI6aC5oUS3zfU4d2VsXIyngtzmj9E0ECc4t2d4o6n6NHyXz+tbUUWCoal3KRIHI0bbpKFrdC+T+1jrrM+SQi/GyvyeEGQwBpE+qjZC5vjCXWtL4B7/CLomLoICJuCexuXgos8P3VKO2erqDtkNBybLeQi3ftMFC7EvRphK5CeYzf2YTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV8PR11MB8771.namprd11.prod.outlook.com (2603:10b6:408:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 01:41:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Tue, 10 Dec 2024
 01:41:41 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: fix RRECOMMENDS extend issue for
 multilib
Thread-Topic: [OE-core] [PATCH] base.bbclass: fix RRECOMMENDS extend issue for
 multilib
Thread-Index: AQHbR8s/XZpP6icfLEaONSJHTuNx1bLeuAn/
Date: Tue, 10 Dec 2024 01:41:41 +0000
Message-ID: 
 <DS0PR11MB7312A3B0C28C68D86653CC76823D2@DS0PR11MB7312.namprd11.prod.outlook.com>
References: <20241206084550.2424753-1-changqing.li@windriver.com>
 <dc94ff4219543832f6839246f4220a2299d8471b.camel@linuxfoundation.org>
In-Reply-To: 
 <dc94ff4219543832f6839246f4220a2299d8471b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7312:EE_|LV8PR11MB8771:EE_
x-ms-office365-filtering-correlation-id: d4d46961-9e88-462c-90d6-08dd18bbcbc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?HW17AP2PY7hgcETZiXa4G25f3Lm7i8w1/UDo1nPASbiQM3ClPtgsodKU1p?=
 =?iso-8859-1?Q?r9dHEbE/9ivC2jIlJLACGoZKieNWul7W58JaQE/kfxx55gzCNrEj7nNZk0?=
 =?iso-8859-1?Q?38ZMVEKvV0T/iypknym431HUBkDJfVFuGxlr8QkjIZdhucbdcLe/p12clp?=
 =?iso-8859-1?Q?wJhs6GViMjKvixKiMXK8Mm0CYm/vsrKzB1S1EsrbVDzo/Zi5wbUJro06Be?=
 =?iso-8859-1?Q?4kyknv3QQz20GVHqC9sogl+0z8uCq0l7J5vmnIf77mM++ceN6qA2z6YZHk?=
 =?iso-8859-1?Q?frMr0Cn9apkYDOjQFMv3/LirjUqHzEAD/+yaag9FJumqM3EzgEgyGnToP5?=
 =?iso-8859-1?Q?1MA9s5PVsudSVeomVDLGioeAX+rY7YzyK9YsKZMn0gJuXodaBOTxC7Mmag?=
 =?iso-8859-1?Q?xcHpjQt0wedN+5sCTVE2BpxNOSYky/7VbYPMsMDNu/wIWXIwQvoN1Dpcoh?=
 =?iso-8859-1?Q?xIbFKCo+sQhPo0my8RM1P0Pf2uoLitGjSE4mbB7m19Vb1DvV9GtgoDLFNI?=
 =?iso-8859-1?Q?qZ9TORg8xUa9NF3xwlhmrJ5YKKhQ25mHwWUqSovqSIKLfIc8wGcqn8rQcf?=
 =?iso-8859-1?Q?EnAkse8RoKTZ+SeImy8//WDj7VdAuHweppQF8zQ4fcuZXkTZZx3cvtrjOQ?=
 =?iso-8859-1?Q?YxtBPRhd33+iyGySDr+8MxBkKJjhid40IvXxUbRDIh2j2Lt3ojKOVltT/+?=
 =?iso-8859-1?Q?yY7lQywOlVH0TU6kdm49govqdklZLrlNg9FP8s33XMS2RHvZhfAJbC2wkk?=
 =?iso-8859-1?Q?pGrAjk3ROLKVOJPdqQEZhYsoHqurreEvVuYOjK5uB5VcmfDGwn/H7MZ3ju?=
 =?iso-8859-1?Q?WEXBCOtYeGEactscaNPowuIHmA5EsdRyOA6Pge2a99CJcyehIqJpp3hRra?=
 =?iso-8859-1?Q?5Adrh5rSrztK9qsxqb4EDRpiOE3yYr/9BetOcaj3nb5Mg68hpiwAeQl0fY?=
 =?iso-8859-1?Q?u7hn3Co7ilzxXASXvA6m1NBXFe7/jLpNqj+uzNndO1GNaH77A4mfOJmk4P?=
 =?iso-8859-1?Q?ut1u6W5FK63ZpwwPrVwO0BUx5hSqYA2WMl/Enli3+qKvGJnh9gbPX6xtvC?=
 =?iso-8859-1?Q?pTY4N7+TtlQv5LayLzctZYFKMeHIAGRTVhey/CV8BfRxloJ4+dV4a/Xa7F?=
 =?iso-8859-1?Q?VIQTwT1bNOfrGoXOpP7nQIvyiZLHzoiwfA8wu0pKivOTk9GS7xrAMNeEiF?=
 =?iso-8859-1?Q?tTePs8NqBlCyb9oi0XSgR9Ajb3a9mRD9t98pXbO51QPxdNU6nCEgsttKYR?=
 =?iso-8859-1?Q?2wXMFjruzSJnyl5OepkEPwN4rZY05IxB4a8PYkExpCNVqlYChBWG49yaYb?=
 =?iso-8859-1?Q?IL/EUQGDrEOBYDlQS4T7jPBwoCa/W657XaUP5BGmq+3yZ75YsFtqZsGO2R?=
 =?iso-8859-1?Q?d7a6ogPa4mZqPTgs+E9kfLTcJRAw7aRz6GPnhdHztqxvIUPUZ351YczFzD?=
 =?iso-8859-1?Q?7Xvc7Ebv6iF3TrBPeAg6g1VPMp2U8kluxWvUjA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ciEMOCJQhtgN1tHAuPIYY2o5MTqK988zeU5ccRZHugtb3T+9M6KDRTXdhD?=
 =?iso-8859-1?Q?t6eBFX99EF2lvC7GWNK2AnYPCWSzlXil7ez3fhrZeuBeydtTY4kgn9JqlX?=
 =?iso-8859-1?Q?yPXtKKIsQ8DIlmw1UX/V7LlshDj3a0oJTAmBqhEfami7JERNOCMJdwD1Q8?=
 =?iso-8859-1?Q?Bx883iIQePU9ZCeraH3XrNR88v1BhM+FXCylLaURIoTG20c4YusK3s6wPN?=
 =?iso-8859-1?Q?Ip07u8+ofg+eBaxZbrke3uw9mrys09LN3J9reTYVNvc7mdQxIf5Fc+hFBj?=
 =?iso-8859-1?Q?syeWgwzTXF3NC1j4Pmu6XTmMsuWegB70fhZ4d4pmfT5LjzckoG3ak3Vw1e?=
 =?iso-8859-1?Q?6NMaFqd9CsLO+6JYDefOw/zJC98FGcVCVnqdX6LDIF86zcY/TSpIm1YoFK?=
 =?iso-8859-1?Q?617zchajwAV6nyGDNttCwV/n9BWZMAtgocXNxgEq98ob6tfkwZ+4Dgs+Mn?=
 =?iso-8859-1?Q?zjerGfRJN5y8yW3ZTZhMzcjV8B/RUzX+41O8WLSXBqfj1c6nmQ5aGFOy4e?=
 =?iso-8859-1?Q?H2GWPt1pW6kZ+GLjPDdGXZzrBAfc9tsvrnkCgPoxWb2RtoL9UF8x3yF0RC?=
 =?iso-8859-1?Q?0s/lS2klJodW5JPgMRu6550BAwu7vRG/JLXfJEl3ZIStoJurRUJ5ENmIga?=
 =?iso-8859-1?Q?7jYllEUGH84TvA8qxYHSMWyfsKzu7sG97wsS/5q8SKOst/D+LTlstM7V/g?=
 =?iso-8859-1?Q?0lbhM+757L2eQ8YuZqpd5XErNYSqRCpNo03QNmJlCQ7yrrj0bkOZR6ie2X?=
 =?iso-8859-1?Q?Ygr/WvG+kSd+XuTOuuqqbBc97G8xO/oQutR1hAOj1I+gUc3NFCz3fD7T9k?=
 =?iso-8859-1?Q?bzP+t6NyfYcrNFKVapyIQA8/ZfHakWXZw+x1CtEqyp8zk2X+5g8skpRz6l?=
 =?iso-8859-1?Q?CGzY1gi1iW6UPp9W7Wux0i3zdZfd8+xksSEfeBF7mxexXakKnRcxU2kT0l?=
 =?iso-8859-1?Q?NH1W6i2klu+YoSUpHj8hxf1pjY7au6nkcoafJz9KoI1WoIHzObH55KuIog?=
 =?iso-8859-1?Q?UixhOfClM7EKP2d81pwMpoR3Nc4PRh3dRaADV5oxthNLciNzCzd5z9eqFc?=
 =?iso-8859-1?Q?IAG/ZX9cDTy5ojclxm/H39wjo/BbHyqPsLKn4+9t35DRWsBUcK/GPxHT7r?=
 =?iso-8859-1?Q?xvbqO4kjb1I0WKxZd8H42QNdrr4Qxgq9wL5lMeH71OqP5GLyjqHX+4LBQb?=
 =?iso-8859-1?Q?fIpHjvVG0iq86hcBR5/vu2/Bbs704mVXlA2IkdSl9CcLkq3JGnO5JAGrCH?=
 =?iso-8859-1?Q?Ljiy3h6HyrngwE7/K0rFojzMpy3xzqh7hdSJcxSMSEocDPRHg/R0W2MSH8?=
 =?iso-8859-1?Q?Xw/kYBFmw3YskytUI616wM6RqtDm7cYMGVndIeGoNUrBKaiVqmjKPBsF4L?=
 =?iso-8859-1?Q?FduUqnWweHEg6Qaj2eqbtnaqRHST4aB8mfsauay26QH6o5mN6yqAulRNY+?=
 =?iso-8859-1?Q?Oidz9j7lFwz92Lj0xnhfio4EIBHZgF4Erm+Dh3RxadVLYefQsKFg5/8G2I?=
 =?iso-8859-1?Q?gzGPsA5iu5SpPgOnAIVdJ7dXS4xJK0O5cXWmOmjvOoeWnCPheYTRlAqr3g?=
 =?iso-8859-1?Q?GdBu0itVAlNQUv0mNQQDwhXfn0ZxzFyVDpTi7bKpCxv/jIByAZjPpm6F6D?=
 =?iso-8859-1?Q?smLBQEo4wxdti2Gwjo3MZfRQ9DWmKkzA0M?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7312A3B0C28C68D86653CC76823D2DS0PR11MB7312namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d46961-9e88-462c-90d6-08dd18bbcbc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 01:41:41.2892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xd5uPSLhXHVyx3hBKPTCJWHUaHBQ+49k6uBBs42MDg41IkvfK79OTvH3NLxkCh6mWAF5ECHfXZLUHk2RcTN1hLL+ynvTNMuzr1fbYZRh6YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8771
X-Authority-Analysis: v=2.4 cv=H/shw/Yi c=1 sm=1 tr=0 ts=67579c59 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=wPNLvfGTeEIA:10 a=0KHYqyhMWIQfwq13:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 6z80xU0LqedkXEoyNMi2SU2haFtw_yIe
X-Proofpoint-GUID: VZR_WUb553JG1z79-axOkTz4yd4CbF_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_22,2024-12-09_05,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412100009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 01:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208517

--_000_DS0PR11MB7312A3B0C28C68D86653CC76823D2DS0PR11MB7312namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Friday, December 6, 2024 6:40 PM
To: Li, Changqing <Changqing.Li@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: fix RRECOMMENDS extend issue f=
or multilib

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Fri, 2024-12-06 at 16:45 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> After following commit in meta-oe,
> [fe3ba7ac5c cryptsetup: demote udev runtime dependency to recommendation]
>
> bitbake lib32-cryptsetup will failed with error:
> ERROR: QA Issue: lib32-cryptsetup package lib32-cryptsetup - suspicious v=
alues 'udev lvm2' in RRECOMMENDS [multilib]
>
> This is because RRECOMMENDS is not extended with mlprefix, with
> this fix, RRECOMMENDS:lib32-cryptsetup is corrected.
>
> Without this fix:
> RRECOMMENDS:lib32-cryptsetup=3D"kernel-module-aes-generic kernel-module-c=
bc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic ke=
rnel-module-xts udev lvm2"
> Whith this fix:
> RRECOMMENDS:lib32-cryptsetup=3D"kernel-module-aes-generic kernel-module-c=
bc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic ke=
rnel-module-xts lib32-udev lib32-lvm2"
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes-global/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index b81e61fdb7..3aaabb67e9 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -471,7 +471,7 @@ python () {
>          def appendVar(varname, appends):
>              if not appends:
>                  return
> -            if varname.find("DEPENDS") !=3D -1:
> +            if varname.find("DEPENDS") !=3D -1 or varname.find("RRECOMME=
NDS") !=3D -1:
>                  if bb.data.inherits_class('nativesdk', d) or bb.data.inh=
erits_class('cross-canadian', d) :
>                      appends =3D expandFilter(appends, "", "nativesdk-")
>                  elif bb.data.inherits_class('native', d):

When proposing a change like this to something as core as base.bbclass,
you need to explain why the issue is occurring and why it hasn't been
seen before.

I couldn't see why this was a special case until I opened up
base.bbclass locally, then I see that appendVar is in the PACKAGECONFIG
processing block and that at least then lets me guess at the issue. I'm
going to guess that these RRECOMMENDS are being added by some
PACKAGECONFIG code. The commit message should mention that!

appendVar is called in the form:

        appendVar('DEPENDS', extradeps)
        appendVar('RDEPENDS:${PN}', extrardeps)
        appendVar('RRECOMMENDS:${PN}', extrarrecs)
        appendVar('PACKAGECONFIG_CONFARGS', extraconf)

so there are a specific list of entries being processed and you're
expanding that condition to include another of the cases.

I'd note that ".find() !=3D -1" is old python and
varname.startswith("RRECOMMENDS") would be much nicer in modern code.

Thanks Richard,  I will update the commit message and the python code, send=
 a V2.

Regards
Changqing

Cheers,

Richard




--_000_DS0PR11MB7312A3B0C28C68D86653CC76823D2DS0PR11MB7312namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;Richard Purdie &lt;richard.purdie@linuxfoundation.org&g=
t;<br>
<b>Sent:</b>&nbsp;Friday, December 6, 2024 6:40 PM<br>
<b>To:</b>&nbsp;Li, Changqing &lt;Changqing.Li@windriver.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] base.bbclass: fix RRECOMMENDS ex=
tend issue for multilib</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">CAUTION: This emai=
l comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Fri, 2024-12-06 at 16:45 +0800, Changqing Li via lists.openembedded.org =
wrote:<br>
&gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt;<br>
&gt; After following commit in meta-oe,<br>
&gt; [fe3ba7ac5c cryptsetup: demote udev runtime dependency to recommendati=
on]<br>
&gt;<br>
&gt; bitbake lib32-cryptsetup will failed with error:<br>
&gt; ERROR: QA Issue: lib32-cryptsetup package lib32-cryptsetup - suspiciou=
s values 'udev lvm2' in RRECOMMENDS [multilib]<br>
&gt;<br>
&gt; This is because RRECOMMENDS is not extended with mlprefix, with<br>
&gt; this fix, RRECOMMENDS:lib32-cryptsetup is corrected.<br>
&gt;<br>
&gt; Without this fix:<br>
&gt; RRECOMMENDS:lib32-cryptsetup=3D&quot;kernel-module-aes-generic kernel-=
module-cbc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-ge=
neric kernel-module-xts udev lvm2&quot;<br>
&gt; Whith this fix:<br>
&gt; RRECOMMENDS:lib32-cryptsetup=3D&quot;kernel-module-aes-generic kernel-=
module-cbc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-ge=
neric kernel-module-xts lib32-udev lib32-lvm2&quot;<br>
&gt;<br>
&gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes-global/base.bbclass | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/ba=
se.bbclass<br>
&gt; index b81e61fdb7..3aaabb67e9 100644<br>
&gt; --- a/meta/classes-global/base.bbclass<br>
&gt; +++ b/meta/classes-global/base.bbclass<br>
&gt; @@ -471,7 +471,7 @@ python () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def appendVar(va=
rname, appends):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if not appends:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 varname.find(&quot;DEPENDS&quot;) !=3D -1:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 varname.find(&quot;DEPENDS&quot;) !=3D -1 or varname.find(&quot;RRECOMMEND=
S&quot;) !=3D -1:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if bb.data.inherits_class('nativesdk', d) o=
r bb.data.inherits_class('cross-canadian', d) :<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; appends =3D expandF=
ilter(appends, &quot;&quot;, &quot;nativesdk-&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif bb.data.inherits_class('native', d):<b=
r>
<br>
When proposing a change like this to something as core as base.bbclass,<br>
you need to explain why the issue is occurring and why it hasn't been<br>
seen before.<br>
<br>
I couldn't see why this was a special case until I opened up<br>
base.bbclass locally, then I see that appendVar is in the PACKAGECONFIG<br>
processing block and that at least then lets me guess at the issue. I'm<br>
going to guess that these RRECOMMENDS are being added by some<br>
PACKAGECONFIG code. The commit message should mention that!<br>
<br>
appendVar is called in the form:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; appendVar('DEPENDS', extradeps)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; appendVar('RDEPENDS:${PN}', extr=
ardeps)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; appendVar('RRECOMMENDS:${PN}', e=
xtrarrecs)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; appendVar('PACKAGECONFIG_CONFARG=
S', extraconf)<br>
<br>
so there are a specific list of entries being processed and you're<br>
expanding that condition to include another of the cases.<br>
<br>
I'd note that &quot;.find() !=3D -1&quot; is old python and<br>
varname.startswith(&quot;RRECOMMENDS&quot;) would be much nicer in modern c=
ode.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Thanks Richard,&nb=
sp; I will update the commit message and the python code, send a V2.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Regards</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Changqing<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</div>
</body>
</html>

--_000_DS0PR11MB7312A3B0C28C68D86653CC76823D2DS0PR11MB7312namp_--

