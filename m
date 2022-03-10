Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24F8C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 00:54:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4499.1646873679982493378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 16:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Y4GZ7flx;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0068e34002=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22A0bZuZ010167
	for <openembedded-core@lists.openembedded.org>;
 Wed, 9 Mar 2022 16:54:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=IsBrsSEoknJsPMvvOwIcMCfK2O1hAId1X5EjiUXmoSw=;
 b=Y4GZ7flx69zqyDUSJvHLOwoiM0gwTLaQh2gMd/j6xj2Dfx26WYppepQJxq43IEnNxy5m
 6pTAqovMd360csPBqEc5b/zJgFHPCWUls0DuiAaCqwrYTdTkfiSSQX+K3x/df9e+SJFF
 LfEjdX/2WeFuyDY3Yh2xGJvfEiwqBEd6DxW0MztwnOdPh78GONdkBUtLTPAl1COfCpMv
 6w38eUOyqLJCEDA+mi4QvEMocDLlrRnuHZuBQpEotu51BgqIPsj+y/rkLWuByImELCD3
 /o2YgDYg+uI3gWTReUWGEsNffzRUuk/fHhgOapIJdjqqL+OoSj8XlvRHf5kXXlU1AxeH oQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3em416bt2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 16:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h62ax2QXi8jA/cey2Sk5GxbYd2RJyp8zomk1M9LPTjdob57RQuP+kwOFf4ki3d7tCFA8maTloLpFC+VBYvFjCkVu0A51X4qL3qKzebBCBo8ChifcGcBNT8y5HOpDHQbMdLGZ4dzAnPRPwF3ZnA5iT9/7zes1VpSDp1PMoBo/v4tkejj2K3q8/8AS9f0nZgxbeoE+L6e73hp4SuDhezHfjw4xSJVUOfJQdvtjP0xN2O3Vk+wxDvT2BFxtPw9hRlRCucBRx0J1LgceaPbjKrUZXY9r91LFWJVNKvQKEIeKVCaTZQsdB5hM36y/q9jrIEpyfK5nLnCBGCzTsQkra4GWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsBrsSEoknJsPMvvOwIcMCfK2O1hAId1X5EjiUXmoSw=;
 b=NhFi5CYUqmImzMxGgsOs8yxMGLYoC5t84QOysd30zG2B+2CQKrg8V7XwhgSlE6UwUS1MMdsbiacyQ8BByhLztFuwpdDBlMlDuTMR7zUF6cB+BswizA4XIkPAedbDpFxMdXJbHFFpP3jM6K8M8cjb+qmXyehShAuCYi+Fky/ez3p9frBgWpIziI4VupemiwCMo1fMegdOeuckMfjfVYsxFVEgquo9b8hJzZ9G+Wwx6zTVAqq4+KZALraXrgIBH6tzh2RELcnAGwAV1ewtnVXXdXE0/XrENQLCdRoUkAHCvvIcWdQavZKzaq6OjgCbywEhyq9hnCGjE0zZ4/1rT8oO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BN6PR11MB1475.namprd11.prod.outlook.com (2603:10b6:405:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Thu, 10 Mar
 2022 00:54:36 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 00:54:35 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][PATCH 1/1] libvert: modify dependencies on
 lxc_protocol.h
Thread-Topic: [oe-core][PATCH 1/1] libvert: modify dependencies on
 lxc_protocol.h
Thread-Index: AQHYNBjt4nEmo7kCFUuxAfiZkGxiEKy3yoHw
Date: Thu, 10 Mar 2022 00:54:35 +0000
Message-ID: 
 <BY5PR11MB39926CF30B9514E3A4E5ACA4880B9@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20220310005048.37403-1-joe.slater@windriver.com>
In-Reply-To: <20220310005048.37403-1-joe.slater@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75f353b4-1554-4a26-0675-08da02308c25
x-ms-traffictypediagnostic: BN6PR11MB1475:EE_
x-microsoft-antispam-prvs: 
 <BN6PR11MB147514C850F4987035BAE2AF880B9@BN6PR11MB1475.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XhTNJ5bErPtizi1XM+xPi//IXfQOcn7wO+JV1AoFm/NKVqq7NhOmTMW0UaxqLDhkmEOrAliQ5iBhMbyKrhHCjbdtkSKyfFpR5qc46ghEbNU43IlN8zV+wOkgrDqHNwHARqA173SZF55B3wzYO4qnaTHOe+l7FxLDvkYi/WX1eIlb7PGTEVYEID9gDBQmY1uzASSM6A4zJePZPzG+9Ag3mTCNKaW3sXWm5G5SxP2F+E35oe/F2NZUa17OPLIXPOJvMkP5ASU8QMyGOubxwrwpuBdEw6Juh++Qhga3ztyb1gXsbkImPw6XFFnfIDLYoIjF1WNr0HkWAFnK7ecgmW3eb1kYoUh8PqdBSC3H/qNTGH0pWurRdZ3l3/Ts2+udStdSSsGK/yetslHHmT4stKetE87TpWjbY/gwPWhNtBswAIV0MhjMRYGh/HxLY2od/PZUsDStQkIDDiCJQqzmovysEpqrj8pZavItfk1WqP/H5IbMRgarRizPwl+B5tta4xYTiAsAv1h/mJ9tD1xo+hn+eM2TODNJ6kU5NxA0XJcqVGZ2OHAsqN63wRUN/vJgHMIfBi0ZdbOxJrFTBsXgXhqEDxVKwbRWDU72ff2AWSq4ZFQa9w7nZ4iu0RZWPkyex/zL7KJcxBBLOtBfDR4sJ43WAT2ArnkmBdMJpmxcBmajU7/CtceTE59uEDWQV0EIDPzQKI9ePvTkcylZLKqH9jTR1FOi6yyEHy5cngcvLpIrGDzatvhLnMRgi0TlvIdbIosE8SlK9dkF8v2JPqyaEyl1i/QhDsef+VjpLY57AeICEgDQaBFksQhge2IHKmsGGlui
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6916009)(71200400001)(316002)(33656002)(38070700005)(66946007)(8676002)(66476007)(64756008)(76116006)(66556008)(66446008)(122000001)(55016003)(52536014)(83380400001)(6506007)(5660300002)(186003)(26005)(53546011)(38100700002)(9686003)(7696005)(86362001)(2906002)(8936002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sqIG+lKT4uZY+U+xWB5q1qlVHSxHI6O8/dbiMuQiJsXskFKCvCPakeirUS29?=
 =?us-ascii?Q?EfA7V1M8i0qFOUGEL3BR2DcWEjqD9RrjC5opkEzR3Axq5YwDUfp67yZmFTf4?=
 =?us-ascii?Q?XKqnvqqHxNSiTenh/KkYy/CJLMlIizQTUSJzjejiyDo5DttFCEZ1QJSC6lB7?=
 =?us-ascii?Q?8Abz2nAUOB6gOtNXJKhVaESp+Kr9nYsTCmMt4PNEWL1ReXzY8RHQCczevk0O?=
 =?us-ascii?Q?PijHKj2tisq0SA05p+HUROzRQre03LSXblLTzsmRn+RESxHYCxE9QsL6p1l3?=
 =?us-ascii?Q?2hG82BwhV1XDQUXuKTofY0AtQbRe1H1UtH7TJrOi5BU3o2FQWbF5dJylKZaL?=
 =?us-ascii?Q?vFoV8SpEjR4Py4BVKOR1bcNKK8h9yq3qAERh6NvORp4Y5B5j4EuJ7FkVMxw2?=
 =?us-ascii?Q?cONjXlvjTjdBRJD3L2JChHz372xLeXbxR6RrvGnqrZnjAZ3bCQBHPZwBL1Hq?=
 =?us-ascii?Q?Ebwcwj021xu31TJZSLTQj9FkHU5c8GKjeMaLyaOjdtwOUJSEAMJxfpM61srt?=
 =?us-ascii?Q?G3egX1ELO0QRUgtevyF1Eokq4LE+6tACw9NuMy07tf+bxonIRKIXV/V5YoRD?=
 =?us-ascii?Q?1BgZzmrosR3TkqZl7pfhdITkRgl5HuxNv1Nka/z/3+Sy7zJqhBOzv4ojnZUl?=
 =?us-ascii?Q?OBgkS9DdKB3+0LNSnAtW9ZfLMJl1+fttxLRCly6lzHc03qlYh6YuVSgUnwTj?=
 =?us-ascii?Q?pjLbNMUINQQvl48pr19NQfSsW2cMCSD+2b3HIDhCnW3V76qQ3F3XM4lwlwHF?=
 =?us-ascii?Q?ZpWavY0AwMuyf8lu7MUnxwxpmQj1p8Ddm4cPE3ww/TvnZxH1z6mRfYoMdmPX?=
 =?us-ascii?Q?bwdJBI2m9oHR+E2DNJTtQU0L+bv/dM+SXJ+l/Ujx8MG4NrYFs58H0+IXQOdO?=
 =?us-ascii?Q?dgen9qf9vGmFqmGJY02bgzW+IOME2m9T4x/CpYpYIBffLM05VO89jJIwfrnY?=
 =?us-ascii?Q?rOMuVulRrjLykvqqoxnXgBttlVv8FZgtRzRXnR2ChAJNvzjQL69OBTU+Pg2N?=
 =?us-ascii?Q?xKXCCnVc6H3QDezwGypJzNFtrstc773jq1gWAIKKkfSPyaeCtf2/7QQZkHm3?=
 =?us-ascii?Q?3xKnuRTVcqowuToPyTNcdbs2CRkntGSkLRdgoqIMs4Xj3lmvub5UtpYjZHiP?=
 =?us-ascii?Q?Ot8efVWVOLqZLjGTDM4+9flIX5R1eXVGUzH0DDZlGNMlQJAjD+CJfVphUCtC?=
 =?us-ascii?Q?F5FV8uGVRmK4LCpEzJ31cNrB9R9MDnI7pri5VTP9cz+vBDQS4fO2zJ6+vPYA?=
 =?us-ascii?Q?buXXvQ70ugMK09Mn5KX3GMRPAGC8jZ8ceeFez7MwEOPK3a7BDKukJXwReIDo?=
 =?us-ascii?Q?B6UL27stb1ACWoqm+NesfciDpJYbh3VZ+wxc1geiOU4pAe/tm3BElE0YD3Zo?=
 =?us-ascii?Q?Q5i8vXClDt7KTQL6/KlG6AK1sY31KnUXKexvqDlufavWgU3+CaBHh5JH1aVk?=
 =?us-ascii?Q?d1i8XFJHqo+BqAkT+kS8jpd0sLIQed+/jtVt41f2Nnux1NGq4zWsekG1WELv?=
 =?us-ascii?Q?ul3WK6/pCmPbUcN04j/H0HnPOxhJQ2wfGKPI9ZbYbRdfqT2JxbwsrezPX128?=
 =?us-ascii?Q?EK48MSZgBDWaDHTrxK+kf+np9iCmvvrlWZeYbN+ykzR7XMQuJUKY9sF5EkLP?=
 =?us-ascii?Q?B2koM+clvUr5XHeS/L9T8P1gOLMbNVMdceAz575iTNGF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 75f353b4-1554-4a26-0675-08da02308c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 00:54:35.8175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 2QnntGpu/ZV82OCyrbruIMeAbi0S8N9nuRYlRnkrtrcKwHoqeJ/q0XvNU4RaxgDWakA1khZtIA4ECnXTe39tsfLf3t7cXMEYUHQzkpNFAnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1475
X-Proofpoint-GUID: 3uq3Qdgmah8ubGq07Dra1cyOtotk6id-
X-Proofpoint-ORIG-GUID: 3uq3Qdgmah8ubGq07Dra1cyOtotk6id-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_10,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=893 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 00:54:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162997

Oops, wrong list.   Joe

> -----Original Message-----
> From: Slater, Joseph <joe.slater@windriver.com>
> Sent: Wednesday, March 9, 2022 4:51 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: [oe-core][PATCH 1/1] libvert: modify dependencies on lxc_protoco=
l.h
>=20
> src/remote/meson.build does not create a dependency on the generated
> lxc_protocol.h for remote_daemon.c.  Restructure how this file is generat=
ed to
> allow the dependency.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../libvirt/libvirt/lxc_protocol.patch        | 104 ++++++++++++++++++
>  recipes-extended/libvirt/libvirt_7.2.0.bb     |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/lxc_protocol.patch
>=20
> diff --git a/recipes-extended/libvirt/libvirt/lxc_protocol.patch b/recipe=
s-
> extended/libvirt/libvirt/lxc_protocol.patch
> new file mode 100644
> index 00000000..595c3fe4
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
> @@ -0,0 +1,104 @@
> +From 38af66c1a9c4cdeb256eeaf563c6807757c370ce Mon Sep 17 00:00:00
> 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Wed, 9 Mar 2022 23:17:33 +0000
> +Subject: [PATCH] working commit
> +
> +remote_daemon.c and others need the generated header lxc_protocol.h,
> +but do not have it as a dependency in meson.build.  This means that
> +builds will randomly (ok, very occasionally) fail.  Restructure how the
> +header is built so that remote_daemon can have it as a dependency.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +---
> + src/remote/meson.build | 48 ++++++++++++++++++++++++------------------
> + 1 file changed, 28 insertions(+), 20 deletions(-)
> +
> +diff --git a/src/remote/meson.build b/src/remote/meson.build index
> +0a18826..31a30ee 100644
> +--- a/src/remote/meson.build
> ++++ b/src/remote/meson.build
> +@@ -1,27 +1,11 @@
> +-remote_driver_sources =3D [
> +-  'remote_driver.c',
> +-  'remote_sockets.c',
> +-]
> +-
> +-remote_driver_generated =3D []
> ++remote_xxx_generated =3D []
> +
> + foreach name : [ 'remote', 'qemu', 'lxc' ]
> +-  client_bodies_h =3D '@0@_client_bodies.h'.format(name)
> +   protocol_c =3D '@0@_protocol.c'.format(name)
> +   protocol_h =3D '@0@_protocol.h'.format(name)
> +   protocol_x =3D '@0@_protocol.x'.format(name)
> +
> +-  remote_driver_generated +=3D custom_target(
> +-    client_bodies_h,
> +-    input: protocol_x,
> +-    output: client_bodies_h,
> +-    command: [
> +-      gendispatch_prog, '--mode=3Dclient', name, name.to_upper(), '@INP=
UT@',
> +-    ],
> +-    capture: true,
> +-  )
> +-
> +-  remote_driver_generated +=3D custom_target(
> ++  remote_xxx_generated +=3D custom_target(
> +     protocol_h,
> +     input: protocol_x,
> +     output: protocol_h,
> +@@ -30,7 +14,7 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
> +     ],
> +   )
> +
> +-  remote_driver_generated +=3D custom_target(
> ++  remote_xxx_generated +=3D custom_target(
> +     protocol_c,
> +     input: protocol_x,
> +     output: protocol_c,
> +@@ -42,6 +26,30 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
> +   rpc_probe_files +=3D files(protocol_x)  endforeach
> +
> ++
> ++remote_driver_sources =3D [
> ++  'remote_driver.c',
> ++  'remote_sockets.c',
> ++]
> ++
> ++remote_driver_generated =3Dremote_xxx_generated
> ++
> ++foreach name : [ 'remote', 'qemu', 'lxc' ]
> ++  client_bodies_h =3D '@0@_client_bodies.h'.format(name)
> ++  protocol_x =3D '@0@_protocol.x'.format(name)
> ++
> ++  remote_driver_generated +=3D custom_target(
> ++    client_bodies_h,
> ++    input: protocol_x,
> ++    output: client_bodies_h,
> ++    command: [
> ++      gendispatch_prog, '--mode=3Dclient', name, name.to_upper(), '@INP=
UT@',
> ++    ],
> ++    capture: true,
> ++  )
> ++
> ++endforeach
> ++
> + remote_daemon_sources =3D files(
> +   'remote_daemon.c',
> +   'remote_daemon_config.c',
> +@@ -49,7 +57,7 @@ remote_daemon_sources =3D files(
> +   'remote_daemon_stream.c',
> + )
> +
> +-remote_daemon_generated =3D []
> ++remote_daemon_generated =3D remote_xxx_generated
> +
> + virt_ssh_helper_sources =3D files(
> +   'remote_sockets.c',
> +--
> +2.32.0
> +
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-
> extended/libvirt/libvirt_7.2.0.bb
> index 5ad7d59e..04c66eb5 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -31,6 +31,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-
> ${PV}.tar.xz;name=3Dlibvirt \
>             file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
>             file://0001-security-fix-SELinux-label-generation-logic.patch=
 \
>             file://0001-storage_driver-Unlock-object-on-ACL-fail-in-stora=
geP.patch \
> +           file://lxc_protocol.patch \
>            "
>=20
>  SRC_URI[libvirt.md5sum] =3D "92044b629216e44adce63224970a54a3"
> --
> 2.35.1


