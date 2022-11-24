Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809A4C43217
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 13:11:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23107.1669295455248790586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 05:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k+yz2Rqq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8327d198c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AOCBXqB025048
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 05:10:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=DeBJLM6kMbpsTH3EPApvwhI3dn+9lSmfzRB4k3lI+OM=;
 b=k+yz2Rqqd+2qkNowgWqrpxjyrmIjBuQI+92XiuUkh7/PUAYeyRE+zMp6gLs+yFt/2nh5
 dG3UqsKsCTGN74Ed3qmpbD2efas+VCBhJJhL5g4FfYgFbEtsmq7hwXQZ25LV8qGF9DY1
 NaVnx0MMFYiVgKYmKd91ouV8sSuHFIcLp8iD6YaDuevh39OfePEeufxaF27hPBTmNqg0
 Kk7fb9bWHkmfRU5IYF6ucwjt/r831OhWT561Qxj7HlJRiG92cXxO2x62g+OSBAWlrWnj
 tNv61rFSs3fNoePFP6f4X35fEeCNVWxkMgkEjx+iA6SYld13lPRygpqdN3OIzcjZV8sH hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqc0yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 05:10:54 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AODAsIE028169
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 05:10:54 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqc0yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 05:10:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJoAcR9IXbjjJm9LqjQA3VwRFdV7ofM0Gq8/lM1QOH9Xh/lF3MS891dMq7XC19ew4ziaefU9zGCbIn0yvl01pc3J9vJxKagx2Xm4+nKQRggmxuz6lJsZDRgJqdED1RFn5XurGRPBXnsLSrMhlBuqH06ks17NhIYf4YI4hulirnQ6tuQAbTzqQhLZ6DS1LdC5T+iYivC0/OXJ/YJYkq2LfMHZcNwWLQa6Q1h7Bm0wBfeoAzuCUWaStnoAmMUEZqYdfdpVr2nU/E5WFjWtYbzRCmcIOxlpCZpEmMCBagMsJNWiV391LJyoK9FTEvxxncyw9i/IKPBrRakMI29xFMxqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeBJLM6kMbpsTH3EPApvwhI3dn+9lSmfzRB4k3lI+OM=;
 b=cmuFDb+jGTwKvemTps5p1UIIgDt+H+vTT4yORFX9N9VPfsIB9nsMf1eugojFQJhQE0gqdZfF71A2/RaNz/9VXe8BZ4rC7ypCommM4doW7gI+mH9ud1vqey3xOe0x0LXISx9dlli1PXx80i7KoSDgt1TffplWhi4vAZzzfGOPCHX7CojiAitYNuGsODVEmOuqIvADIwhY8qZUWbmXC2LrGPOF8MqsA3QuEp+KKXEF3HUwd8fHCz1y7zS9uVjiNMiDg9rTOzJaNBK4Cw1US6hcU/WGOayq3hFaLBWWR6sXrvah4MiehOoOBDP14WC+SoHobp6DChJbNG14a2erdjhz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5236.namprd11.prod.outlook.com (2603:10b6:610:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 13:10:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 13:10:51 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Thread-Topic: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Thread-Index: AQHY/7BG2G3bzAyn2UW4ZPq5312Nlq5N8jsAgAAL9ECAAAxXgIAAAPvQ
Date: Thu, 24 Nov 2022 13:10:51 +0000
Message-ID: 
 <CO6PR11MB56029B5C9F7EA25EB2CE1F6AED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
 <Y39W7D6ps5v1cCyn@mail.local>
 <CO6PR11MB5602B903C8B0BB9EB6C94214ED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <Y39rTVzD41m41oyP@mail.local>
In-Reply-To: <Y39rTVzD41m41oyP@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CH0PR11MB5236:EE_
x-ms-office365-filtering-correlation-id: 730b6096-4fd1-40a4-3c7a-08dace1d4fee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y148TWpvxsn4wXc0WVJnPkTOkKfd7al39lM+YP+Yi+AwUew106wCI580CeRlx2ksqwz0TyLv15vPQWSlK0c6JjCZjaLOSH5xzQy/tlZtIZvwiDwQ6kWoiH0iSo9Wx28vIaf3KnLKxPL1kmFin3GS6Bl5wCj2/usfWlJap3SRF4dD4EKvYS6MNTLzn69xhGSAH0ct0TIKfqzRiPcT59ybh42VdqJ+4U6ajryMQdyLLE9jwN3qgMsTCfS5QpMJmk3pqAfhsTv1T+lO17V0jSHDUnMiSjcnLhPCkqbiDNpyEb/rvvZdzsUfXpHyFootm0BD0QuCC3QC0l5Br/bx+IG8oe5POTuJkbjrXBhZ4+32g69KwgcQdPig8WpsAs2nzoaBf123cHcoVJDSy9i3S2/uJgphUEtGpBhPecmOC6xEcOfG7uG01JQFIDkGRzqv3h57kYbQAo/rN5mXHRsp6VPBZajrpbArwfeCcO2DXCKl9JjdJtV/qGh4YYdpTnnPTQUnhYH63CIUxsQ3wLwV2vJ7K5jYJ4WpMCWdENjrIXonnAZPQDlmRCkJTUFheGoJxf6cm8Wd+vqF4a3ZswVKt5q5bOuFfdAISGz/iOrMGAWyF6XqSXyx1V7ypTf2zy+NsbefThIyQWg5Jd2hbgE/EuxIgn5x7WjlzWyiHx8U1W6ngbxNgpO/5Kxy0RE2+vBM51YzkWCokKWV65VyIFLuvCCpx0h/QtkBG/Skbns2h42qhf8qMqO3oxCi8TyC6EroBLKFduZdHH3ZbqVpxqGXsrrCfkn8F3LEoz3dEv0nwkj3KV/vze4JHTFMlREpXUiQg9Hr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(451199015)(86362001)(66899015)(33656002)(8676002)(38070700005)(64756008)(66446008)(66476007)(66556008)(76116006)(71200400001)(66946007)(6916009)(4326008)(38100700002)(26005)(122000001)(55016003)(478600001)(6506007)(7696005)(83380400001)(53546011)(9686003)(55236004)(41300700001)(2906002)(316002)(5660300002)(186003)(52536014)(8936002)(966005)(9126006)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Yg6EhV6G6shjZ30iPXiKHh7AdA+sSfVvIbjPYvsQi8z3FtrPXxfj4WjdNtkr?=
 =?us-ascii?Q?Cu7pTG+LO51Y3IKMuZHzurBx3t32xqSBNj8oME8OplfJh6oVO1mo8gWiJeOA?=
 =?us-ascii?Q?Zab2qwWzzISCtI3Hi9Or+3PRz8N4jEArffIQk7muAj3O9rlaSrG6C2NDHfXU?=
 =?us-ascii?Q?XCd6w7G8lTy/jzF0mxZiadRH3nZw+5sLi190GFGXQ8oOSC83XOxH6EdOBg57?=
 =?us-ascii?Q?0ipl7AYuS6ssGelBK5Pvqya9v2Yc2K2wko2GPIulDf7uqpKhTAEfGHEbrFW9?=
 =?us-ascii?Q?/rftW8AAFM8vmeAQ3yzwL/UxG15YP8N67DAmMP+mCK+u9OgI7vFv9d49H9Ld?=
 =?us-ascii?Q?rpzJRDHcp0nMktZ64bwyAhqqhUBsJEPE073BF9c+qCgv6eYX7rdRaRdOcDXX?=
 =?us-ascii?Q?PfPkmwr43LnWVwX7eXDZVHStwfq1xvjzF/2TklGVwxSOOLOa466Ah/g4batC?=
 =?us-ascii?Q?9vQt36A9WlPFYrpEVqUxjlbAPfBDqnwILP6cd42B/dV6+OnIXObg/pGEz3+q?=
 =?us-ascii?Q?9vbRSW6JLdLcB2hk/FEgx8PC6gb7DCtq6Gw9xVwMtI9GCs8luja395MRPCpa?=
 =?us-ascii?Q?1DEW6DFP9KAYbgWlWAp3ENPFyeQbzmXcXSHODeQlWO9Nf5ToP81w73XAfsqK?=
 =?us-ascii?Q?l+iv5iVzTgm6LYLuHXu4Kaj5UZjaPYNFOaWUtYeW8hSRzhJjD+oFw+KcxV/C?=
 =?us-ascii?Q?fBqU+iMi5LXHzKH3mOfMZAcdZHW2PEWdNqsz8lXQfRsC2sX/C5WWTZmhpsgQ?=
 =?us-ascii?Q?etGPepAIrOLlzSlKpLnvcar0RPqV62xwhJl13wAL52WDPzOVsnn9KE5in+GX?=
 =?us-ascii?Q?u5bCChXW0qBvbOU/qbvMhQfF1dqxCqWEFWL+W2tcjxTgXXAYHNVmOaYlNQfB?=
 =?us-ascii?Q?pJzsL6HA4X2FnBeHSrb8uduEyIFm8hSdtmkQdXd5hihm3S00br8sxWyn/bgV?=
 =?us-ascii?Q?ns3FGZ6Ja0H3ohj9JFAounYCZyugOdFmCnFKNgdU3zRk4baAnQzHNwRVwJLe?=
 =?us-ascii?Q?/P/4AUGAN57fQ2sQHTcpQ0tvqXRuslcCyuICfk8MffaIrF8/EMKHg/m+CQhh?=
 =?us-ascii?Q?aPa9Etck9fWEXIs02gJM3Ylw6YFyJCBc3oJzEnRji6STkukhapeUbBPNTpru?=
 =?us-ascii?Q?U5Tc3c7ROchLLq6R1U1dE8lIFbds5B2+a2TvCM02uZp0Tf2iHJhHAYLVG8lQ?=
 =?us-ascii?Q?llulPYG9BHcVKlhiWa24RVq5TXyBPuwFUfjQItb1DOaycoJRAWHyxbNCBYcR?=
 =?us-ascii?Q?kbbP/4Y9LxYbRsFLpWs1OIWHiMREIuM370Puh91C38y+cpIc9Yndp/OSXE8s?=
 =?us-ascii?Q?rtOqHM5P6yKd3ZCVsK07/pIJAwrhkJoCX2PK/r59dGTJa3uabuMKjP+B0YaB?=
 =?us-ascii?Q?v9MqS8f21NiR8P4ToYcQESo5SJ8rbyDq62PhXoZ1wT7CmyW+X/xYT4NCbGeC?=
 =?us-ascii?Q?WFnX+SUZBAIehsZ9hlIR/2N90tCVyEUAgPMZxgbyKLizVwWsSg3Hlc8v7niR?=
 =?us-ascii?Q?umGDCrqyT7aV5C/GpT8T0qCYS6BlvM3oW2hCBrTcAgDVyEtgSU3AIq9SOx5b?=
 =?us-ascii?Q?NcTU8gWcvlZTNfsbG0t3P+3g7o6iqBSk/6k2VgUw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730b6096-4fd1-40a4-3c7a-08dace1d4fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 13:10:51.6577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7xW6VFj2XYGiRIEHU4yycjHEX+BemlxC5adwNAMKtUwO0/uBeRelVIk+Fhn84+EI7NqduDqeVbZeyxlAIRyxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
X-Proofpoint-ORIG-GUID: WmS9UaXSBx0a_jomyShYXHRII-8rUrtm
X-Proofpoint-GUID: bcb3j4Fuq9HbHjJ5TBu_GYhZVCBd9lBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_09,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 13:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173748

Hi Alexandre,

The command line is: oe-selftest --skip-tests distrodata.Distrodata.test_ch=
eckpkg buildoptions.SourceMirroring.test_yocto_source_mirror reproducible -=
T machine -T toolchain-user -T toolchain-system -j 15

The '--skip-tests' option is the long format of '-R'.

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Thursday, November 24, 2022 9:02 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used togethe=
r

On 24/11/2022 12:24:38+0000, Chen Qi wrote:
> Hi Alexandre,
>=20
> Yes, I'm aware of this behavior regression.
> With this patch, 'oe-selftest -R xxx' needs to be changed to 'oe-selftest=
 -a -R xxx'.
>=20

Yes, my point is that there is no -R in the command line used by the AB

> I'm not sure if this is useful for other people. Because how people use o=
e-selftest is unknown to me.
> For me, I want to run something like 'oe-selftest -r A -R A.B.C'.
>=20
> Regards,
> Qi
>=20
> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Thursday, November 24, 2022 7:35 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used=20
> together
>=20
> Hello,
>=20
> On 23/11/2022 18:55:28-0800, Chen Qi wrote:
> > For now, there's no easy way to skip some specified tests when using=20
> > 'oe-selftest -r'. This is because '-R' and '-r' are in the mutually=20
> > exclusive group. Looking at the codes, the codes have already=20
> > allowed running specified tests and skipping specified tests at the sam=
e time.
> > So move '-R' out of the mutually exclusive group and change its help=20
> > message.
> >=20
> > After this change, the following command could be used.
> >   oe-selftest -r A -R A.B.C
> >=20
> > This does introduce a behavior regression.
> > Previous 'oe-selftest -R xxx' needs to now be changed to=20
> > 'oe-selftest -a -R xxx'.
> >=20
>=20
> This fails on the autobuilders which uses:
>=20
> oe-selftest --skip-tests distrodata.Distrodata.test_checkpkg=20
> buildoptions.SourceMirroring.test_yocto_source_mirror reproducible -T=20
> machine -T toolchain-user -T toolchain-system -j 15
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4395
> /steps/14/logs/stdio
>=20
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/lib/oeqa/selftest/context.py | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/lib/oeqa/selftest/context.py
> > b/meta/lib/oeqa/selftest/context.py
> > index 78c7a467e2..c7dd03ce37 100644
> > --- a/meta/lib/oeqa/selftest/context.py
> > +++ b/meta/lib/oeqa/selftest/context.py
> > @@ -154,9 +154,6 @@ class OESelftestTestContextExecutor(OETestContextEx=
ecutor):
> >          group.add_argument('-a', '--run-all-tests', default=3DFalse,
> >                  action=3D"store_true", dest=3D"run_all_tests",
> >                  help=3D'Run all (unhidden) tests')
> > -        group.add_argument('-R', '--skip-tests', required=3DFalse, act=
ion=3D'store',
> > -                nargs=3D'+', dest=3D"skips", default=3DNone,
> > -                help=3D'Run all (unhidden) tests except the ones speci=
fied. Format should be <module>[.<class>[.<test_method>]]')
> >          group.add_argument('-r', '--run-tests', required=3DFalse, acti=
on=3D'store',
> >                  nargs=3D'+', dest=3D"run_tests", default=3DNone,
> >                  help=3D'Select what tests to run (modules, classes or=
=20
> > test methods). Format should be: <module>.<class>.<test_method>') @@ -1=
71,6 +168,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
> >                  action=3D"store_true", default=3DFalse,
> >                  help=3D'List all available tests.')
> > =20
> > +        parser.add_argument('-R', '--skip-tests', required=3DFalse, ac=
tion=3D'store',
> > +                nargs=3D'+', dest=3D"skips", default=3DNone,
> > +                help=3D'Skip the tests specified. Format should be
> > + <module>[.<class>[.<test_method>]]')
> >          parser.add_argument('-j', '--num-processes', dest=3D'processes=
', action=3D'store',
> >                  type=3Dint, help=3D"number of processes to execute in=
=20
> > parallel with")
> > =20
> > --
> > 2.37.1
> >=20
>=20
> >=20
> >=20
> >=20
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel=20
> engineering https://bootlin.com

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173743):=20
> https://lists.openembedded.org/g/openembedded-core/message/173743
> Mute This Topic: https://lists.openembedded.org/mt/95231396/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
> [alexandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--
Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel engi=
neering https://bootlin.com

