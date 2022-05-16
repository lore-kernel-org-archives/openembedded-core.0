Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B967C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 05:35:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.25327.1652679306708011127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 22:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OvvcMEhk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2135291d57=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24G5HE4Y029512
	for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 22:35:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=IAeG+mw/cq8jofMJyRRRKWWnP3uB73p5RKYOfQDsDC8=;
 b=OvvcMEhk9ugdOBj/svJNxRkVFnX6XX6xxSwYV6aCMZDOUP+RW/Cmf4Nzw5GBw0WDKeAi
 FvPCWzSLx2ZRUgQadQY78CRVoMUPF5HnC/ob9oGGrcjQp0k+WBe+A4tgtPAVpHOCcRPI
 q1Oz8S1ktCArQwf5KPe9qJA3Px9Z3K3yoPKcQnYrhUVNI8OSfb8rLBBRTAA287RCbgWL
 FaG3ZYZqEbLGHvxRrGca8vYUb+iGmo3K6cPAM8l/3sYyy4t2qqxCU9sq13PvSJdqDHz1
 oeEtJP+9yWjUd8nWB/P7LN1Ev4p7qbrwrqyCQk2N9dwVyMYydq8meL0eTSKLopKu7tfY PQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxms374-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 22:35:04 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24G5WLK7027902
	for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 22:35:04 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxms372-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 May 2022 22:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGFZiQTB6oxudJ/6463IC/X3PneJHk3gKB4wd0xhCgESs8KM5kDTM+bU2BiLREUbZj5ahVJYdRu/WFyCdFCtIf6WO7qW3wMRBKAGLa4yLvg6MdwQ95Noa6fdGxL09PpNHuPec6Q3gAdiuCtmxS+32Sr+ZRnT4e0ijIfwWxd951n4nIhKupRkkN6pkL7GYpWO4/CokP0pUd7Gz5qfh6GzSsfG37je3U20lHHO1Ia7kzTCvWIT457ry74yhPqp15DxXIvPE0XIzQIAgVPw9vMz39cJ0moEZm48fpaizFYpR6rdK096aKqgI/zSk6GzIshvYNCYSwwDL8ik+yQuF0Bj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAeG+mw/cq8jofMJyRRRKWWnP3uB73p5RKYOfQDsDC8=;
 b=nT2eN83iqX3CwFKZYhjxevls8UN8V/JffO5zm7/hZBBFRhGhaIqZB7N9LuLFaFIulRB7sv7YudmIVSdx23K4XAAdMtv5kmCPJZ5sDarX2QzJwfjNBLj+ja/kk0Y4FGLLISEk1Rkuroa54olQ3rKwT9RmnNtvOHeddZ2NQMvJUzVvl3kPXYwBz5hSgFa6Sbp2NGo6r52NOUNGxVbbHPu85N2xVhl6JDa5pQ7N2E29wrv3h4hN1kJULurDSVu8WseypWigl9uok/TnPMQf5BMmaCarBTVzYMazUTD1QeMVIwNyvc/PGw9xwCzFEYFj+g5TbtzU1YT6S1rKcvE/OZWKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3247.namprd11.prod.outlook.com (2603:10b6:805:c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Mon, 16 May
 2022 05:35:01 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92%4]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 05:35:01 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
Thread-Topic: [OE-core] [PATCH] eudev: create static nodes from modules
Thread-Index: AQHYZdRZqwkCY9rhpkqR+6R+bYoS160bC92AgAD6iqOABAaoAIAA8tTg
Date: Mon, 16 May 2022 05:35:01 +0000
Message-ID: 
 <SN6PR11MB255731C22AC93F566A3FEB6C82CF9@SN6PR11MB2557.namprd11.prod.outlook.com>
References: <20220512054303.429208-1-changqing.li@windriver.com>
 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
 <SN6PR11MB25578B38EF44CB5A0D00A40782CA9@SN6PR11MB2557.namprd11.prod.outlook.com>
 <CAO5Uq5Tyakm1_Q26j93ok83of5Uru-J07i4657fg58AYxBTaQw@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5Tyakm1_Q26j93ok83of5Uru-J07i4657fg58AYxBTaQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dd07265-393c-4a68-ff76-08da36fdd2c0
x-ms-traffictypediagnostic: SN6PR11MB3247:EE_
x-microsoft-antispam-prvs: 
 <SN6PR11MB32474F947FD120458581915582CF9@SN6PR11MB3247.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qirh66bGq94HtzWzwQABCGhdP7DX9iqj5jjRfPzo7ZNcFHyuSiAIFyc8L4c++iGn0r7uqFZkoZsOMCrcOttFQ426SItI3BZGRfTZteCSfk+tpHjMlvkapyqoCyTGAs3vWoXVdjC6Qc0I+0AeG4U1DFqHtKscJwfgsKnD6tuVB6O7rxEJSWBkBIcMnkVCGiOkrPoGjjjqzoCT0ToWqq/zIiVqHcRZQ6Ps2E+ahJ1FbVFK+EdUBBU3VDxrVLVvPkSdeloWLqKt3ud4aJ39uwApTcbr68XaREUOPQ5fBedyz3CAkB15ox25LC0CHCCYNRC89SFm0iillOEk6ZM1+gmOgSdNPSewkZm9/PTPf5ZyCMSk7ipc0oU9IP04LEFQdeYSixljhvZUOenkxUYHHizLRpQkvyQW9Wuwpxkb1tfMOBJuUgW3IyfRmfmKWYqd1GufP2KkNezG8oGj49nRyp9ICsizxnBkUboWYJI20nZR/wTSyNVNl2SCFs68JMcVAN8FDVJ72UwaYAHgkdvo8DB0SCLUeuOTC5pAxCh71tnE0dsxDMu+4aWX5cRZ8NsFOspfbACdZNY/ms29oLkXnFDYAhU5Q1+LQ2KrVaXjnKzB1lG3xYrz30G9f+d2IiH+Ki3V5mEeNz4THbECXCDIn+0beUU01qwOiOWd/YkX5gVFauUdq1uXOgUEzzEnFCyyeloUrZ+G7V2ePhmWNOiRNjvLpjGq1eTPNTydrBhG+VfOo4AiRDscXjA6G2iTOFygByusIjJ0W5NrPstuFVSHgoEGC/CUKnn7BMZ8stsg1TeousmpEL8SnQM/QQdqbTAlc+/l
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(54906003)(6916009)(86362001)(316002)(166002)(55016003)(7696005)(4326008)(9686003)(76116006)(66946007)(91956017)(19627405001)(186003)(66556008)(66446008)(64756008)(8676002)(66476007)(966005)(8936002)(38070700005)(38100700002)(6506007)(53546011)(71200400001)(5660300002)(508600001)(33656002)(52536014)(122000001)(83380400001)(2906002)(13296009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kR6UBKOaOW+Jt02gCFJ+yCsk8TpE+oIgyfXVVM605gXBp4Iuu1SKi+87iq?=
 =?iso-8859-1?Q?TxGrzI0vD6aahNkxAEXnskPmIy3aOSEOHVVbUBreUQh/om64cwF3y1qpUo?=
 =?iso-8859-1?Q?URwOmbpRC5FnSERqT9lJdWGgaww0edD1Irn1AsaoEkWGMLN4TASUGUInGK?=
 =?iso-8859-1?Q?SgcJKcysbVRDEfKUjAIfz4Af2Cmcl8T6aIS5266lXjtnuU7wcEIko5J3XT?=
 =?iso-8859-1?Q?hRjm/Ipfk3KFywK/5ctA6Q+Y2BqRCBSCCdMXnQnLymCKbK8s+zHlUhVNyK?=
 =?iso-8859-1?Q?xLqZXaLfV7aSzu8/+vN1I4zXWYAoqBiw0EARe4R2D7f01wMhttxoCfz6eB?=
 =?iso-8859-1?Q?xxD0bHDmMjpQLVyYQveepecZ7rAt5Z/ugPBhppu+gb+chHgGi5eBb1PRr9?=
 =?iso-8859-1?Q?9fx1GVAFPKI4a/Na5q6C92n/txpf8OOO4qOPZVx9+eZIS37JtW/lV8JdsY?=
 =?iso-8859-1?Q?yotP7qMuyL1P+HN8dRsar3xDKVQY7PBk9CYD8LnZa11Pp+cROMmCoWQBrC?=
 =?iso-8859-1?Q?6Aa7JtI79M7JlX2ozVMz/VYHJ5g6K7Ana/zcNW0UkNH/m9Hb8kxpwJEqcg?=
 =?iso-8859-1?Q?N/zfLvik4j7b353ve66syWZ+xqYWuuhTmvG4pul10O51n6B6Ql5WEdwhaW?=
 =?iso-8859-1?Q?sWk1f4l52jttHwY8EnxzssOLDMwm1JQhMxBBvI1Th8x2Xor4inYvJbVZ/j?=
 =?iso-8859-1?Q?3o0Z8xCtnRVU5vfPELRVc2eIAjKQZkClTZ3Y7L5caIp7GQuL17vEKdAmSw?=
 =?iso-8859-1?Q?S1oWsMVJEprIj1EyAomXfIzpxV7ncwkRnF1QOYen+XVpT/mHhBzg6mND2N?=
 =?iso-8859-1?Q?qprPS3D4mZTWaiNjel1OBddsdM1KeQstCKGzxUCsOpyD7KhdnMRQfLQmhS?=
 =?iso-8859-1?Q?WHgXIp2yW+3Y753pNB8sxhglTszpqSrsexuvftUOg+zFBJ+Fw0YcHJnErV?=
 =?iso-8859-1?Q?oNr9hLPmrvx3CBxbpJMG2hcyhLCrssS/ufL1xtiSfs7wBVBS8Pw3uoQzos?=
 =?iso-8859-1?Q?AIeed4ZEnV44lNbI8KUdXRFCUrWrx7gzsYSy88yE40qAjqaksZgOT/8LxO?=
 =?iso-8859-1?Q?0XBaGncfnAoCBMLvTf7q1xzofhtABL3kHB6qitK9jKsT4lhpOG3ZOv8aCV?=
 =?iso-8859-1?Q?horiXHmf7mYzc08l4RrW0i2781tQa0X35mZ3iOTR1ITDGBdssMgeXcfXhf?=
 =?iso-8859-1?Q?GT25vAEpdaEuIhhc3bMpiQN+IxEOgPg0sviSuUsE6gEXogm15BD8jtko2C?=
 =?iso-8859-1?Q?/5UaVcv+hAadmrXskW7g1Q9VFfSTnO5sWta0guU6I3qI0JzJzoJIRyanc5?=
 =?iso-8859-1?Q?alt49Vo/sArTqakxTHW5bgBT+D8/aCJfJs2uF3FuLAyQqGawaEgk0tBui1?=
 =?iso-8859-1?Q?FdKBqv3ErD1G5hssXzd+iCceL1apo08bg+ykTGfcAEloVKuGEVE+258B/+?=
 =?iso-8859-1?Q?uZ5pFD0WeUBBdXneP3i6lI/4CPGIkTpOXYenrpTdyHhpaGlR9SA7D8wrNS?=
 =?iso-8859-1?Q?gk3TOkwUg1Y+xd4RN6OWH7K1gapVHTx0TJmYkUd2N+qvEjhGI2dLL/cU6B?=
 =?iso-8859-1?Q?PRfd6d10IGgj3QvwZhQlHDvfyncXTeoqLQqguFNWLhAIRklW3UnP4bPx3w?=
 =?iso-8859-1?Q?S1DjSqLz58SX4tregHuDXgcd9Vjgyp3YQycSKZQbMq1d6rEO1/n/nnJ9w7?=
 =?iso-8859-1?Q?kVFR2l9Oumcy4HSww0lPx5WpNSYbQq5WLCyrJE/KRMNUJ6Ui47JIBpEJ1A?=
 =?iso-8859-1?Q?EVXIN62jI8WJXrfTkT9olYihCrSnaBAhAfto+yHkbSeYh4Yb6V8k7DEf83?=
 =?iso-8859-1?Q?D+T+aHOm/Q=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB255731C22AC93F566A3FEB6C82CF9SN6PR11MB2557namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0dd07265-393c-4a68-ff76-08da36fdd2c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 05:35:01.6679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 37EpEDWmYMYHmmWkxhcB/6kybBc9jg3PqMAjZ/oOv77CkfWzyP3WudHpNF4CEB1ydF662RQhAT53m5U7NT5BxXwjWnvbVT3hUhi6cImxo3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3247
X-Proofpoint-GUID: 3LzBwnIKTXH1OZ6WpGL_fayLzsXkGqcK
X-Proofpoint-ORIG-GUID: Y1SWeLlqaXbOoO7fUJkOthYzqEr1DBuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205160030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 05:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165662

--_000_SN6PR11MB255731C22AC93F566A3FEB6C82CF9SN6PR11MB2557namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Alex Kiernan <alex.kiernan@gmail.com>
Sent: Sunday, May 15, 2022 10:59 PM
To: Li, Changqing <Changqing.Li@windriver.com>
Cc: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>=
; Patches and discussions about the oe-core layer <openembedded-core@lists.=
openembedded.org>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Fri, May 13, 2022 at 2:42 AM Li, Changqing
<Changqing.Li@windriver.com> wrote:
>
>
>
> ________________________________
> From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.=
org>
> Sent: Thursday, May 12, 2022 6:33 PM
> To: Alex Kiernan <alex.kiernan@gmail.com>; Li, Changqing <Changqing.Li@wi=
ndriver.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-core@li=
sts.openembedded.org>
> Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:
> > On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windriver.co=
m> wrote:
> > >
> > > From: Changqing Li <changqing.li@windriver.com>
> > >
> > > dev in modules.devname should be populated in /dev on boot.
> > > remove create static mode from udevd will make these devices
> > > cannot be populated. When use sysVinit, devices like /dev/net/tun
> > > will not be created.
> > >
> > > more info:
> > > udevd in systemd also remove create static mode in udevd, but using
> > > service kmod-static-nodes.service and
> > > systemd-tmpfiles-setup-dev.service in systemd to create these node, s=
o
> > > systemd works well.
> > >
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++=
++
> > >  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
> > >  2 files changed, 116 insertions(+)
> > >  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-st=
atic-nodes-from-modules.patch
> > >
> > > diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-no=
des-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-sta=
tic-nodes-from-modules.patch
> > > new file mode 100644
> > > index 0000000000..19611f4e89
> > > --- /dev/null
> > > +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-fro=
m-modules.patch
> > > @@ -0,0 +1,115 @@
> > > +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 20=
01
> > > +From: Changqing Li <changqing.li@windriver.com>
> > > +Date: Tue, 10 May 2022 14:04:35 +0800
> > > +Subject: [PATCH] eudev: create static nodes from modules
> > > +
> > > +Revert commit <src/udev/udevd.c: remove create static nodes from mod=
ules>
> > > +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7abd5ec9cc47=
a8b895df6db77fb1537c6f1a39
> > > +
> > > +Upstream-Status: Inappropriate [oe-specific]
> > > +
> > > +Upstream intentionally remove create static nodes from modules, it i=
s
> > > +expected handled by tmpfiles services, refer [1].
> > > +[1] https://github.com/eudev-project/eudev/issues/229
> > > +
> > > +For yocto, when start with sysVinit, to enable systemd distro featur=
e,
> > > +and install systemd-tmpfiles is not proper, so revert this commit.
> > > +
> >
> > Reading the upstream issue, I'm not sure this really is an
> > "Inappropriate" upstream. eudev has dropped this commit, because you
> > can use systemd-tmpfiles ("as it works without systemd and can be
> > compiled individually" - presumably using our unsupported musl
> > patches...) or opentmpfiles (which is dead and points you back to
> > systemd-tmpfiles).
> >
> > Feels like this is an engage with upstream rather than carry a patch
> > forever which just causes us to be perpetually divergent.
>
> I agree, this does sound like something we need to address to keep the
> project maintainable...
>
> I tried to suggest upstream to add this back,  but  upstream seems prefer=
 to use tmpfile solution.
>

Given how limited the output format which static-nodes generates for
tmpfiles is (just d and c! entries), parsing that output directly as
part the eudev init script wouldn't be horrible. Or make kmod generate
files in the format that volatiles expects? Though that would need
populate-volatile extending to generate device nodes.

Thanks, I will dig more about the tmpfile solution, and send a V2 patch.

Regards
Changqing

--
Alex Kiernan

--_000_SN6PR11MB255731C22AC93F566A3FEB6C82CF9SN6PR11MB2557namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> Alex Kiernan &lt;al=
ex.kiernan@gmail.com&gt;<br>
<b>Sent:</b> Sunday, May 15, 2022 10:59 PM<br>
<b>To:</b> Li, Changqing &lt;Changqing.Li@windriver.com&gt;<br>
<b>Cc:</b> richard.purdie@linuxfoundation.org &lt;richard.purdie@linuxfound=
ation.org&gt;; Patches and discussions about the oe-core layer &lt;openembe=
dded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] eudev: create static nodes from modul=
es</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">[Please note: This e-mail is from a=
n EXTERNAL e-mail address]<br>
<br>
On Fri, May 13, 2022 at 2:42 AM Li, Changqing<br>
&lt;Changqing.Li@windriver.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: richard.purdie@linuxfoundation.org &lt;richard.purdie@linuxfound=
ation.org&gt;<br>
&gt; Sent: Thursday, May 12, 2022 6:33 PM<br>
&gt; To: Alex Kiernan &lt;alex.kiernan@gmail.com&gt;; Li, Changqing &lt;Cha=
ngqing.Li@windriver.com&gt;<br>
&gt; Cc: Patches and discussions about the oe-core layer &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules=
<br>
&gt;<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;<br>
&gt; On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:<br>
&gt; &gt; On Thu, May 12, 2022 at 6:43 AM Changqing Li &lt;changqing.li@win=
driver.com&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; dev in modules.devname should be populated in /dev on boot.<=
br>
&gt; &gt; &gt; remove create static mode from udevd will make these devices=
<br>
&gt; &gt; &gt; cannot be populated. When use sysVinit, devices like /dev/ne=
t/tun<br>
&gt; &gt; &gt; will not be created.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; more info:<br>
&gt; &gt; &gt; udevd in systemd also remove create static mode in udevd, bu=
t using<br>
&gt; &gt; &gt; service kmod-static-nodes.service and<br>
&gt; &gt; &gt; systemd-tmpfiles-setup-dev.service in systemd to create thes=
e node, so<br>
&gt; &gt; &gt; systemd works well.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&g=
t;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;&nbsp; ...dev-create-static-nodes-from-modules.patch | 115 ++=
++++++++++++++++<br>
&gt; &gt; &gt;&nbsp; meta/recipes-core/udev/eudev_3.2.11.bb&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt; &gt;&nbsp; 2 files changed, 116 insertions(+)<br>
&gt; &gt; &gt;&nbsp; create mode 100644 meta/recipes-core/udev/eudev/0001-e=
udev-create-static-nodes-from-modules.patch<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-=
static-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-c=
reate-static-nodes-from-modules.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..19611f4e89<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-=
nodes-from-modules.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,115 @@<br>
&gt; &gt; &gt; +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; &gt; &gt; +Date: Tue, 10 May 2022 14:04:35 +0800<br>
&gt; &gt; &gt; +Subject: [PATCH] eudev: create static nodes from modules<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Revert commit &lt;src/udev/udevd.c: remove create static no=
des from modules&gt;<br>
&gt; &gt; &gt; +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7ab=
d5ec9cc47a8b895df6db77fb1537c6f1a39<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Inappropriate [oe-specific]<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream intentionally remove create static nodes from modu=
les, it is<br>
&gt; &gt; &gt; +expected handled by tmpfiles services, refer [1].<br>
&gt; &gt; &gt; +[1] <a href=3D"https://github.com/eudev-project/eudev/issue=
s/229" data-auth=3D"NotApplicable">
https://github.com/eudev-project/eudev/issues/229</a><br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +For yocto, when start with sysVinit, to enable systemd dist=
ro feature,<br>
&gt; &gt; &gt; +and install systemd-tmpfiles is not proper, so revert this =
commit.<br>
&gt; &gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt; Reading the upstream issue, I'm not sure this really is an<br>
&gt; &gt; &quot;Inappropriate&quot; upstream. eudev has dropped this commit=
, because you<br>
&gt; &gt; can use systemd-tmpfiles (&quot;as it works without systemd and c=
an be<br>
&gt; &gt; compiled individually&quot; - presumably using our unsupported mu=
sl<br>
&gt; &gt; patches...) or opentmpfiles (which is dead and points you back to=
<br>
&gt; &gt; systemd-tmpfiles).<br>
&gt; &gt;<br>
&gt; &gt; Feels like this is an engage with upstream rather than carry a pa=
tch<br>
&gt; &gt; forever which just causes us to be perpetually divergent.<br>
&gt;<br>
&gt; I agree, this does sound like something we need to address to keep the=
<br>
&gt; project maintainable...<br>
&gt;<br>
&gt; I tried to suggest upstream to add this back,&nbsp; but&nbsp; upstream=
 seems prefer to use tmpfile solution.<br>
&gt;<br>
<br>
Given how limited the output format which static-nodes generates for<br>
tmpfiles is (just d and c! entries), parsing that output directly as<br>
part the eudev init script wouldn't be horrible. Or make kmod generate<br>
files in the format that volatiles expects? Though that would need<br>
populate-volatile extending to generate device nodes.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Thanks, I will dig more about the t=
mpfile solution, and send a V2 patch.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Regards</div>
<div class=3D"PlainText elementToProof">Changqing</div>
<div class=3D"PlainText elementToProof"><br>
--<br>
Alex Kiernan<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB255731C22AC93F566A3FEB6C82CF9SN6PR11MB2557namp_--

