Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B58C46467
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 12:24:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22246.1669292683962459305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 04:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=I4J90biv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8327d198c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AOBjbLO027359
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 04:24:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=C0XCFaJQe8jWnssuQI1Tk58FCPPguMGlLqrKUArtFhs=;
 b=I4J90biv+3hI60oL1wcNlGL9fYCzW3utKtmF0cMHBg9T7tmU4FMnbY8lcrnJN3TPFkCG
 Za8RXyqjAZ5qee45mNt6PM0i0JHUfxzfpm3J1Yc52rvatbbJAsUuhw2ZBy0NNH/o6ovK
 dK/3ZCQODCFabs1tMVz5teE5ZKDMGknTAMviTJznTkeEQ6ppoSgXVjx/CeRvP0C5qwRL
 rmGYJt/IgpU8VoFbwiO5sBz9anOYGVhV1P71trcE5UMpsma4erUFnW/8DVsVxCjfiOT9
 F0owpBHj8K1+b2xRyjeGJ7d9OpeCWRjLGXmzHb+vnyky0tzi8U1HgkDP8/E5rzADdeSN 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqbyvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 04:24:43 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AOCOhSx020061
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 04:24:43 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqbyvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 04:24:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+1OK0oOiL9o18dtxIUt2geFCLwA6W9qeXxkSz4AN5w+mW4cxpHUfbsVTvSmhJWO+DfYTQg3mMJCmX3veoL14sMYbRo0VUOmuepzBAZps+GmqqNX2tgFmZ7iDTl2dphCPjKZVhhRBXh2ILwc4Aqz0SI3TMLKqI2UGO03Z0frxgaA7KJsvTQ9R8Gq+S7UYKhOi3euACdqJ48z4/qbCfTjR9I33AFE76Y2Sl1j5nfbfjaFFa6wcn5EV91Zsy54kSDgbY8xBzJlJSMs/UdbQppMRJql3+x0KPAMSjkdSCFPTMYhDUa2L2nd9PIBdRbdLIIpxz8sGX4NHwNqBSBfMV0/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0XCFaJQe8jWnssuQI1Tk58FCPPguMGlLqrKUArtFhs=;
 b=XKgfuO5SjXeNyhSTD6+SKPhRP4ZdSkn+okdCIX6Qfg2zuQEZ8PXwhsXdTQrU2yarJaxJSSeyB26TYZzgk6vBMM9Ab3J8A9gPIl/5MdR5ppBltTUnvtNRlNwFHfInUV1s/p26Ig+6w49wPthnqwK3FdaIVE7sLsjD/vaskuVLP/CjOy49OCjs/cGQxS7r1UCnAkrXe0NHKEeIo3WJTZFzBp3WP6Gq+2pjzD6yFaFftqMPWQ5OhtTohYuwg17na5D+w77sEpvt6kIjHC+w7QqxELyrxJ1wQNOCc2YsL/RAlYRooHpqSfsxAQey3DCoogS0sPqI/hElfnzdKldbAEtMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 12:24:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 12:24:38 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Thread-Topic: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Thread-Index: AQHY/7BG2G3bzAyn2UW4ZPq5312Nlq5N8jsAgAAL9EA=
Date: Thu, 24 Nov 2022 12:24:38 +0000
Message-ID: 
 <CO6PR11MB5602B903C8B0BB9EB6C94214ED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
 <Y39W7D6ps5v1cCyn@mail.local>
In-Reply-To: <Y39W7D6ps5v1cCyn@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS0PR11MB6375:EE_
x-ms-office365-filtering-correlation-id: 308e3c81-bb94-40af-b3a0-08dace16db36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dAc6B67YWpd5eaYVr3Lt9vbSv/VLz78Us8Fu3AchLzm8AEkjrUwYBP6I4QemAqp6r70Aoiq0IlhJsbH8P19p+VzX5/O2/JHI3Op4X1RxagjiverXogkK+4ooIJ+1YVlDNhZJqKhhwYuWvhmH0uo08V7xJa1xuj0r8pHsJGxjnebS/HvnbcK3eMF9SnhOe2rrf6nD2F1/PZIB142O+Q6HnDcbzbhbeWNcDs0ghTMhY0zU9XQFqC4P+4oMddnx3chBvUozhp6D75z4GUnu95mLdvOwDZHIOg4POqf5RCpisA2/UWrTwJJoqrESH91GD8RMlwnNjnaUWnT0ciUnJOfbVt5/g+1obUgjn+4aVjZObEZri6WYeC1Kq7ACsrMDcfs47NBZm9dc3lfzS+XWX8vWS6TU7jkoa5rd35ZrZiEn4abAYooYUT5I1Bah2A4SsVoc3nATQU09otueKEe++yVK/dr8tBpomEUxKDqEXWhgElGWuMnNE7DP/joX5sRmlEiJg2j6S//+qwV+1uQbzGuGhYcrSZiBDmyN5WtMjbtcfhSwIaU+PxeKtXdZfxvYOtEtbE34lVOJpp2mUf0Bnf774kMnJYQyqqqwKQgfTgLgWwY5xxHA14IjzW04RI3QWck+Am2qTkmWOA7AD0IROk6RXIchjsjh9WoB7uycPqy16TyyS2Pn6ZfYTXN3ocSdOs4F146iW/VLWqKhnIxzSooZhCH9Bh1Q1JT+FHw+ns3dMlJrCSXVpWiEXe2IY8FbLgL9HR/YWc746l7JaFDhINIzeXMugGpeVauB9Bt7hVPnj9P1N6xFG1aD57xv2CfUAaEj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(366004)(346002)(396003)(451199015)(2906002)(122000001)(83380400001)(8936002)(26005)(41300700001)(316002)(6916009)(86362001)(33656002)(186003)(5660300002)(55016003)(38070700005)(52536014)(53546011)(6506007)(7696005)(55236004)(9686003)(76116006)(478600001)(38100700002)(66899015)(66446008)(66476007)(66556008)(64756008)(71200400001)(966005)(66946007)(8676002)(4326008)(9126006)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ldVdxOCv904kTxLoFk5Fje0z4wsXfP3hDTSWsjosMLwcnReNbne1N2zoJvBH?=
 =?us-ascii?Q?dohq6f7Y/zDDcfoRLJexbYVEfcuvi5feh/LhEWXA/UcnwOo8Vy90WFXAuC4C?=
 =?us-ascii?Q?uqRqCFSHE0svfBPXYlx0Kl8xg8KaF4hv1Op0r186bprB/vAr1QUlmZsOE3VB?=
 =?us-ascii?Q?5z/pVkGFVDXJxgFa8YjaKMEp7h6RCfeDlPkk2AjZUrGv9uL8seSN1hrcauTT?=
 =?us-ascii?Q?84RpIn0NDsyTPbXdB6LCZ5b38f1Z2vg7db30xXGdIaAZj5mzb94POxLV/1r7?=
 =?us-ascii?Q?NEesZvHy6PJ9fnlFFPXXZojed5/FgMHrzKkKad7ih/ypKmTKK5fWnJLFUrTv?=
 =?us-ascii?Q?y1CNhfVjssfqp+bAbqJcZ5kqlAeEcFWMN0v2x4nGEwVD/H16dmqlsJ/7l0Wq?=
 =?us-ascii?Q?r0gZEQhpauiAlqqG4USOhZ+oe0ucIQfdvdWy0hkoonD3CEfsx4OWxF9BUQA1?=
 =?us-ascii?Q?PzDaGX5U1FbuAnYZdfA+b43pXIjFGYQgjIQoBuJdBDnADzsRs2Gv/zlJolCf?=
 =?us-ascii?Q?TyfkB/CyQhivD1u+1rUElwgFzfPCtk30W9XzJEyAaIqRg5mudRtonZBiARAG?=
 =?us-ascii?Q?rmDPGN7ndtlE3S2cbahoIY4RyeNsCvs65qMEsvczqfpDkG4KDhFnIacFpTGy?=
 =?us-ascii?Q?OzoxysN6VPxO+SeMJt0lp0v4lDfqT3Nx8x3U3yrcmb2sJ/3VchD1VhNsPNWs?=
 =?us-ascii?Q?jwmwHdM9MwK2JipH4vG5TpsnS1g4EG2mhED8dot5NG4qrTYMaHqy44x+bkDi?=
 =?us-ascii?Q?j8lyEG1bexTL3z34baJc5aVYw90nOGZYO7S5KOo4ddBKNA9SHGTjfW3ZpWyA?=
 =?us-ascii?Q?PHtk4x9cMGRKFmd9tE2QxFKTQSuEneNtaS82ZuI00Hiwn6GydFOhlB5d1qoS?=
 =?us-ascii?Q?/jdASVFmq0yH7kwzvXbDULvXQWD+BCu3u8jXhGsLkPWj/PELyTjhNTforQdg?=
 =?us-ascii?Q?XXHsWUCcbWDUu8Kio+HGY6WP0362S6R44wxOsaEqsNWooG40OBSGzk9HiorV?=
 =?us-ascii?Q?aXiTlKt/dQyCTvwCknTR45B5nkheu+SomfKh19t1ilZOpWkN5KJVVKc5cP1/?=
 =?us-ascii?Q?QVbcoTfU1Z3cojtDJKKZPXeRWPbDfAAMfVjhIiU7k6+qxfeDeB+gDKKJSeGf?=
 =?us-ascii?Q?joz2mDqdzHnru4odDPwZfspEJH9PuMUmieuZ/5iJlH/1+H749chcwEddpAXw?=
 =?us-ascii?Q?S8lOxNbNsH5AIfJ8dNY6mqDF2T8UJFMSi4eVWdWRL8jFmxO2tfDiBrfK8pV2?=
 =?us-ascii?Q?lH4oP2uTi5E6HQrrn/wAqO2uUbd7aoSkyr0yTUtCcaari3eU+hY3QBRos4l6?=
 =?us-ascii?Q?nepOpCDa3u7CTJVzpdoyRxiugva6oETbBY7++6Dl32TdurJh8DD1XkatPzvU?=
 =?us-ascii?Q?DDlN9CoMAp7PKVLJ34f7FCeP3NNGolBTiklhSSZDFGIrurcB93G29VFVhsc+?=
 =?us-ascii?Q?nPrO++Ou+7164bwxy8+RvoNjFkcDVsnxWSDVa61MdF3IAibcAyyOeStWzGND?=
 =?us-ascii?Q?Nz/hQyMan/vQP0F7VTPJcZxDA/9LUJhIxehNWOLmTkHtjm/IrvnudCHwIYhj?=
 =?us-ascii?Q?gglVJ3NpJ162ZkMrR6/4Ho2xvc1DHvc7JS7YheEw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308e3c81-bb94-40af-b3a0-08dace16db36
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 12:24:38.8432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2H788dRNk6nMzG7B7rypT79LVw1W012uhQw1bE1XINIMpYWk2AcpXs2HOq8E1fBodIY2YPLWMbqmmKqbqUl9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
X-Proofpoint-ORIG-GUID: EJcy0OqTsLlXPD0h8z9OzaVUJuoxiU7C
X-Proofpoint-GUID: _71tyTrh_BHQHFk2QHSysIoMlrWg2j-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_09,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 12:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173743

Hi Alexandre,

Yes, I'm aware of this behavior regression.
With this patch, 'oe-selftest -R xxx' needs to be changed to 'oe-selftest -=
a -R xxx'.

I'm not sure if this is useful for other people. Because how people use oe-=
selftest is unknown to me.
For me, I want to run something like 'oe-selftest -r A -R A.B.C'.

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Thursday, November 24, 2022 7:35 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used togethe=
r

Hello,

On 23/11/2022 18:55:28-0800, Chen Qi wrote:
> For now, there's no easy way to skip some specified tests when using=20
> 'oe-selftest -r'. This is because '-R' and '-r' are in the mutually=20
> exclusive group. Looking at the codes, the codes have already allowed=20
> running specified tests and skipping specified tests at the same time.=20
> So move '-R' out of the mutually exclusive group and change its help=20
> message.
>=20
> After this change, the following command could be used.
>   oe-selftest -r A -R A.B.C
>=20
> This does introduce a behavior regression.
> Previous 'oe-selftest -R xxx' needs to now be changed to 'oe-selftest=20
> -a -R xxx'.
>=20

This fails on the autobuilders which uses:

oe-selftest --skip-tests distrodata.Distrodata.test_checkpkg buildoptions.S=
ourceMirroring.test_yocto_source_mirror reproducible -T machine -T toolchai=
n-user -T toolchain-system -j 15

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4395/step=
s/14/logs/stdio

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/selftest/context.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/context.py=20
> b/meta/lib/oeqa/selftest/context.py
> index 78c7a467e2..c7dd03ce37 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -154,9 +154,6 @@ class OESelftestTestContextExecutor(OETestContextExec=
utor):
>          group.add_argument('-a', '--run-all-tests', default=3DFalse,
>                  action=3D"store_true", dest=3D"run_all_tests",
>                  help=3D'Run all (unhidden) tests')
> -        group.add_argument('-R', '--skip-tests', required=3DFalse, actio=
n=3D'store',
> -                nargs=3D'+', dest=3D"skips", default=3DNone,
> -                help=3D'Run all (unhidden) tests except the ones specifi=
ed. Format should be <module>[.<class>[.<test_method>]]')
>          group.add_argument('-r', '--run-tests', required=3DFalse, action=
=3D'store',
>                  nargs=3D'+', dest=3D"run_tests", default=3DNone,
>                  help=3D'Select what tests to run (modules, classes or=20
> test methods). Format should be: <module>.<class>.<test_method>') @@ -171=
,6 +168,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>                  action=3D"store_true", default=3DFalse,
>                  help=3D'List all available tests.')
> =20
> +        parser.add_argument('-R', '--skip-tests', required=3DFalse, acti=
on=3D'store',
> +                nargs=3D'+', dest=3D"skips", default=3DNone,
> +                help=3D'Skip the tests specified. Format should be=20
> + <module>[.<class>[.<test_method>]]')
>          parser.add_argument('-j', '--num-processes', dest=3D'processes',=
 action=3D'store',
>                  type=3Dint, help=3D"number of processes to execute in=20
> parallel with")
> =20
> --
> 2.37.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173732): https://lists.openembedded.org/g/openembedde=
d-core/message/173732
> Mute This Topic: https://lists.openembedded.org/mt/95231396/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

