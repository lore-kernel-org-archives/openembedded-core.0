Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EF3C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 15:22:54 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.73])
 by mx.groups.io with SMTP id smtpd.web10.23169.1690298566216889833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 08:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=YyUxnSS7;
 spf=pass (domain: welotec.com, ip: 40.107.15.73, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjMYk/f0a033eOnTL7TShIgnu6Dw/GlZQ2Q8xPJE3rBG8EIyobe1hzXGApdYdz8BO+p5D8rwIrztq/wMYyNPDZctWjccUW0/nEA6vhbFcWKU4aPauyq52CTbFRVJMKLoLIqDhXQusLLmnATrlZgQXmJLRbnst9Hr8k3igdgJWU8xC1/Xcfw+badXp4TcJUpVYGgv3WnfZVVQxBryVTa2nrOqrA33g1fkXmji/hXIbeIZSVPMsmgA+4zJAAnxtuUz2yfJIovKxVqSyRiqxY4hiRY8DNcDzKx66EW59pUyGJZx4lu0pS4HUi7apbjxEzwnrp0qLfGAgB9pEtasAUXE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTADQKcigEt/V+G+kd74RI+CVkrJbgDR1SIPb26PUS4=;
 b=RuZlX5pIfI4xasWpj3LahPhr0nbyUCmG0CFABB2YyaKu+FvEj7rbH43QI4XYDn3L+oSIfqvr1TF2jX17sZhe/zdLtkDogl7tTGV/LPuJr1TIykd6vpC3bFRJiOcNSM5YS42cDtHXl0OwXJqJJQ2L+dgksJzl5raP+1iVk02meIpiGusdqU763aFFcSBiXzS3PIKijnm3C+fTWC2pp4/9U7VkcfsoBOW99m2EXCJAiquA9A2mOshJvtj9MjPVvRKBvFSDwGZkcmjSdqTJHwBPIfe9bYe/1XmVMc8J96YrmJXMCMnx2ob8cGu9OpXFSBQt4YWLQaCpk0ZWRkRC7hnyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTADQKcigEt/V+G+kd74RI+CVkrJbgDR1SIPb26PUS4=;
 b=YyUxnSS7yCZMsQT2rURBlWZCXPd6Rx9PDDRl6siRyU/RX1qcCeX85RT6DoPJDK9sCWKdaIaY3ehNCZm9+Lm2Mjk/bZP2ooM5gBsc7sj6c39xIslecusrxymcuApoCtPjWFqttuOWFSIH2JEK5YyGVaN75+SuBDOpbfh6obxcyg8=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8818.eurprd04.prod.outlook.com (2603:10a6:20b:42d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Tue, 25 Jul
 2023 15:22:42 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 15:22:42 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: 
 AQHZvm/8VSlpWTizu02GvmSsctoHdK/JY0qhgADUnYCAAACDdYAABaoAgAAKgYCAAFASUw==
Date: Tue, 25 Jul 2023 15:22:42 +0000
Message-ID: 
 <VI1PR04MB53731AFF1A8F8FE9EF5B53C49103A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
 <VI1PR04MB537371C2BED481FEDB533DB89102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230725092837d3f47a0f@mail.local>
 <177512EFFC81235D.7114@lists.openembedded.org>
 <VI1PR04MB537367B15795A2E226290F849103A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <CANNYZj-g=pozvQ_+PNh-qCTNkU4DX1M0hKhs4L9EnmxCBAU-FA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-g=pozvQ_+PNh-qCTNkU4DX1M0hKhs4L9EnmxCBAU-FA@mail.gmail.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS8PR04MB8818:EE_
x-ms-office365-filtering-correlation-id: a7026447-d561-43fb-0604-08db8d22fd97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 n/D7MfUw2PhuEBYyUGPrGBr7l7423jUBCxOzsYyTPq1n/55tyl5FGuXmAWfK9qGXkXfoeJA7/htVKTxDpWDUNnpYQqZcqs6RTtTAezvzj9UGYjrKk2sdGqHVCLAk+LkiEl9hoz8XIUUfHqSKTfJLKgQXsGya8Q/1lOd20sXFgVUzESLul662OTIYcDE8gb2bKKxBIgy9NLC94wrQ22Eha0lWT/Q0YgFMsE2rECxNjwSvnDt/xZjGUohr9MiUd3lyM2ZSOHsqSE8dovTUkDTGFVuvD4SGIy2bReirMt+MS6BvyK1qt9v+xXw8lORwzt8wqrtaP2hNqX+zS5NFb1q+wRvCknqCLhxVGJsOk+J1WAIpAs3Opm6e3+qqc+0+Stsa1WUGKOha1ohRNYbitPTArKeTtIKtbjx7zHwer73pGnFQ7uVPSTemhJQ+rjiMJ6DKfN12tdMzoSpYB1A9qvFL6rhfsE7Ydz94GzEOz5LEUCXeqXj5nLV/qtjt0O3M0eaN75nnnPxKjANcn5JKPOA1y6MoaSfSDXoGS4Ggo0Ib+DF3k1SINXHy9cVyqwtpKpBkSpiry8tTO7oos9WIQKFV+YZTUk3jpQHl7s3wQnfZFEc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(39840400004)(346002)(451199021)(8936002)(5660300002)(52536014)(8676002)(41300700001)(19627405001)(316002)(2906002)(66476007)(66556008)(66446008)(64756008)(76116006)(66946007)(91956017)(166002)(38070700005)(38100700002)(6506007)(26005)(55016003)(4326008)(54906003)(9686003)(83380400001)(86362001)(6916009)(33656002)(66574015)(7696005)(71200400001)(478600001)(966005)(122000001)(186003)(45080400002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?/1ShWCC4xHpcbUdRXhDkKTzInb3AVOwFtxX7eg+TBZNTvrFeTyg2osDfhe?=
 =?iso-8859-2?Q?zl4oopgbMi0Cb5VYoUh9SBQiSCdYXIzZhYotUqBZ2Dtjp9607dRi9rkd1r?=
 =?iso-8859-2?Q?sG38Pg0KyUOpbxalxVpQmvsmBtzrllU+EQGZfpJ4jBD5LbG2h8xJzhEjWj?=
 =?iso-8859-2?Q?hA+hziHxl0ZZY1amLrXxhFzrctgWMwsUpGLuovNnsoehJ1MDOSEgp4ca5R?=
 =?iso-8859-2?Q?k4/VxoMc8X1QQaMF7UxggPhqMQvAR9ZtoweNr39JKD6Ri8taTCwhc2U4ht?=
 =?iso-8859-2?Q?agTNiujrQztpa1f/jGSi9lCuQ7X91sgSS7ZL9iFxqTi1ksFlCZtB9J7jLU?=
 =?iso-8859-2?Q?GEO8MFKYamVkmCov6zBkZkYCEF4j16Qgzm4IE0uK5cj8du3JBxQwKWHEnJ?=
 =?iso-8859-2?Q?tGyJF3F58rVkF/miv3I/xQ0I/5rgtuG4sLHXQyVuDbcIYeViu8iMZ7MXf9?=
 =?iso-8859-2?Q?CtssjXCmqYIWMiceh7hCUx76GKVWWbwbxt3JmTNY3tAXDOQoHVBE2YT9ui?=
 =?iso-8859-2?Q?ztq8bb4Gaz4zQASRKNzKqViuC3m8fd4jg2x5GcX/UnD1zRiE+v1OsNS1nZ?=
 =?iso-8859-2?Q?/Mkex89rBAX7UNgYmxp6o9mVX/OfXVaFXoHXNWsChUoBgWWvV7eoNQRs7W?=
 =?iso-8859-2?Q?CZjKrP9QtjFhqy6mkdIy/Z2FludUNsIdEr+o/ZeRpJCKfXMqg/ANX40Dq+?=
 =?iso-8859-2?Q?im4IwgXgidWS1yvt9bEOMY3kZJqc2m/au2J+nUmje5+kS45xILh6ZewQsq?=
 =?iso-8859-2?Q?kf1vZ7M2GNoEDGrs+QZrQsAKeO3w3oCqSY5mpVoMwCqo4dJUvQJbQx2Td7?=
 =?iso-8859-2?Q?dWT0GxsdB/Nq7JtL3Ma6rfDBv2uEVBBZAEMLiovH+RelPCX8VlYtJOWE6E?=
 =?iso-8859-2?Q?1A8jX+dGTz5nJy4drPf/VC9z7ysZZPs3+0ipxL+veJa4s+vdDJ3vbuljp/?=
 =?iso-8859-2?Q?zRUuypu7XnvotYTo41J/nL8bgxbLAaiyxthSNPzkjJjKaJsLNhKzVdzgvX?=
 =?iso-8859-2?Q?nQxe9OShCy0R+Bt8TQt7bKqyvrO6KN8zv/CYVgvJi3dXTo4LKQV4bEBGq1?=
 =?iso-8859-2?Q?6O4VORum/ItEK0AUmFmNiuR6hOYJeGTRprb4hM1PI5JhvQU9VDZljeCwhu?=
 =?iso-8859-2?Q?3hGrU/iMbcu5jK81xBnCy+8XsLoA4E8GXrbZJfNHLdoMVph1H02OF+us4D?=
 =?iso-8859-2?Q?0KqKm/CjiOoQ3YIoC+qvnsF6Fq+aa56LXJZ5/YZovz1VPDYV/Sf4RE5z1H?=
 =?iso-8859-2?Q?tzznJxKqgvCXddYaAcGtE27hFlSDWdOYMm/U2lKU7sXPu1tjs6zjjysoWe?=
 =?iso-8859-2?Q?P2p0BKh9v7dUQ6rGDaMbhIgyokmYO5vCylIQA0bf9/9Wwc7KGdUcxtUUBq?=
 =?iso-8859-2?Q?ANgqnWyarWcaemNeG3quHptPAFEeowDHqkVf7oiv01IYzXLZNVWjbVR7SA?=
 =?iso-8859-2?Q?myxicWFMGVJ8Ts3+Y0bRbepC581iQSHyzAPE+/6YI3cjGYNitt0GpO91aB?=
 =?iso-8859-2?Q?4mI0dNfaat03CHZIvHGrzcnaKBFMciZ50fcKj45RQ8CjtCBO/MNHiwfEB8?=
 =?iso-8859-2?Q?yM+WzeywO4SJZrrL/Cz/VlSiX7eKSnO8BMsd0qHy6OkIvaVSUynGS4VNR7?=
 =?iso-8859-2?Q?N6XFyyz0AUdEJLbXEduebBUzuhicVNbrtF?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53731AFF1A8F8FE9EF5B53C49103AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7026447-d561-43fb-0604-08db8d22fd97
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 15:22:42.5552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlhBkI5lv4fqBtKFlhAZSO23XJCmDX96k22pu8oHqyeO/Nx8nKIiOKq1yX1CuAonKAhEUBolemMY7UDCy+f2jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8818
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 15:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184849

--_000_VI1PR04MB53731AFF1A8F8FE9EF5B53C49103AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable


Hi Alex,
at the beginning I would like to thank you for your suggestions, and I want=
 to mention that this is what I wanted to do that from the very beginning,
but I could not find any good HowTo or manual how to do that. Right now, I =
have this poky-contrib:abelloni/master-next branch downloaded,
which also has the patches given by me.

Now, I'm trying to run it using these commands:

. ./oe-init-build-env build

and than:

oe-selftest -r reproducible

but for some reason it produces me an error:

raceback (most recent call last):
  File "/home/plobacz/workspace/poky-contrib/scripts/oe-selftest", line 60,=
 in <module>
    ret =3D main()
  File "/home/plobacz/workspace/poky-contrib/scripts/oe-selftest", line 47,=
 in main
    results =3D args.func(logger, args)
  File "/home/plobacz/workspace/poky-contrib/meta/lib/oeqa/selftest/context=
.py", line 406, in run
    self._process_args(logger, args)
  File "/home/plobacz/workspace/poky-contrib/meta/lib/oeqa/selftest/context=
.py", line 252, in _process_args
    bbvars =3D get_bb_vars()
  File "/home/plobacz/workspace/poky-contrib/meta/lib/oeqa/utils/commands.p=
y", line 248, in get_bb_vars
    bbenv =3D get_bb_env(target, postconfig=3Dpostconfig)
  File "/home/plobacz/workspace/poky-contrib/meta/lib/oeqa/utils/commands.p=
y", line 244, in get_bb_env
    return bitbake("-e", postconfig=3Dpostconfig).output
  File "/home/plobacz/workspace/poky-contrib/meta/lib/oeqa/utils/commands.p=
y", line 234, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
  File "/home/plobacz/workspace/poky-contrib/meta/lib/oeqa/utils/commands.p=
y", line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  -e' returned non-zero exit status 1:
ERROR: The following required tools (as specified by HOSTTOOLS) appear to b=
e unavailable in PATH, please install them in order to proceed:
  chrpath

But:

echo $PATH
/home/plobacz/workspace/poky-contrib/scripts:/home/plobacz/workspace/poky-c=
ontrib/bitbake/bin:/home/plobacz/.local/bin:/usr/local/sbin:/usr/local/bin:=
/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

Maybe I'm doing it somehow in wrong order?

BR
Piotr




________________________________
Od: Alexander Kanavin <alex.kanavin@gmail.com>
Wys=B3ane: wtorek, 25 lipca 2023 12:28
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: Alexandre Belloni <alexandre.belloni@bootlin.com>; openembedded-core@li=
sts.openembedded.org <openembedded-core@lists.openembedded.org>
Temat: Re: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

On Tue, 25 Jul 2023 at 11:58, Piotr =A3obacz <p.lobacz@welotec.com> wrote:
>
> Yeah, I have just checked it for acpid-src packages and diffoscope worked=
 without any errors.
>
> Question, is this test being run with acl or/and xattr? Because from what=
 I remember it was not. Can you check?
> If this will confirm, then something is still wrong with the gnu format, =
because right now all posix - meaning with acl/xattr support - packages are=
 working for me.

Hello Piotr,

may I suggest: you need to learn to reproduce the autobuilder failures
locally. Integrators are stretched very thin, they juggle a ton of
patches (other than the ones you want to get in), and the expectation
is that when they tell you something fails, it is on you to do further
investigation. Here's how you do it:

- start by finding the failed build in the list of their definitions:
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.yoc=
toproject.org%2Fyocto-autobuilder-helper%2Ftree%2Fconfig.json&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7C29e17992f2b148e9206c08db8cf9e54c%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638258777149507734%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3D3czxntfPZq68MvQxKQtJT6Rk5la4O0cca9osxYGcVqI%3D&reserved=3D0=
<https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json>
You can see that it's this one:

        "reproducible" : {
            "MACHINE" : "qemux86-64",
            "SDKMACHINE" : "x86_64",
            "step1" : {
                "shortname" : "Reproducible Selftest",
                "EXTRACMDS" : ["${SCRIPTSDIR}/checkvnc;
OEQA_DEBUGGING_SAVED_OUTPUT=3D${BASE_SHAREDDIR}/pub/repro-fail/
DISPLAY=3D:1 oe-selftest -r reproducible"],
                "ADDLAYER" : ["${BUILDDIR}/../meta-selftest"]

            }

What that means is you need to set up a plain poky build (no extra
layers, no custom configs specific to your organization), then run
'oe-selftest -r reproducible'. That is however a heavy test as it
builds everything, so we need to narrow it down to just the failing
pieces.

- the failure log shows that reproducibility is tested via
meta/lib/oeqa/selftest/cases/reproducible.py. If you open that file,
you can see OEQA_REPRODUCIBLE_TEST_TARGET narrows down the targets
used to test reproducibility, and you can also set
OEQA_REPRODUCIBLE_TEST_PACKAGE similarly.

- now you can run oe-selftest -r reproducible. Once it finishes and
confirms the failure, head to build-st/reproducibleA and
build-st/reproducibleB, to see where the difference first appears.

You can also replicate reproducibility test by manually setting up two
different build directories with identical configs.

Alex
H

--_000_VI1PR04MB53731AFF1A8F8FE9EF5B53C49103AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Alex,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0">at the beginning I would like to thank you for y=
our suggestions, and I want to mention that this is what I wanted to do tha=
t from the very beginning,</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1">but I could not find any good How=
To or manual how to do that. Right now, I have this poky-contrib:abelloni/m=
aster-next branch downloaded,</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1">which also has the patches given =
by me.</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1"><br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1">Now, I'm trying to run it using t=
hese commands:</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2"><br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2">. ./oe-init-build-=
env build<br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2"><br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2">and than:</span></=
span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2"><br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3">oe-=
selftest -r reproducible<br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3"><br=
>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3">but=
 for some reason it produces me an error:</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3"><br=
>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3 Cont=
entPasted4">raceback (most recent call last):
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/scripts/oe-selftest&quot;, line 60, in &lt;module&gt;</div>
<div class=3D"ContentPasted4">&nbsp; &nbsp; ret =3D main()</div>
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/scripts/oe-selftest&quot;, line 47, in main</div>
<div class=3D"ContentPasted4">&nbsp; &nbsp; results =3D args.func(logger, a=
rgs)</div>
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/meta/lib/oeqa/selftest/context.py&quot;, line 406, in run</div>
<div class=3D"ContentPasted4">&nbsp; &nbsp; self._process_args(logger, args=
)</div>
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/meta/lib/oeqa/selftest/context.py&quot;, line 252, in _process_ar=
gs</div>
<div class=3D"ContentPasted4">&nbsp; &nbsp; bbvars =3D get_bb_vars()</div>
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/meta/lib/oeqa/utils/commands.py&quot;, line 248, in get_bb_vars</=
div>
<div class=3D"ContentPasted4">&nbsp; &nbsp; bbenv =3D get_bb_env(target, po=
stconfig=3Dpostconfig)</div>
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/meta/lib/oeqa/utils/commands.py&quot;, line 244, in get_bb_env</d=
iv>
<div class=3D"ContentPasted4">&nbsp; &nbsp; return bitbake(&quot;-e&quot;, =
postconfig=3Dpostconfig).output</div>
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/meta/lib/oeqa/utils/commands.py&quot;, line 234, in bitbake</div>
<div class=3D"ContentPasted4">&nbsp; &nbsp; return runCmd(cmd, ignore_statu=
s, timeout, output_log=3Doutput_log, **options)</div>
<div class=3D"ContentPasted4">&nbsp; File &quot;/home/plobacz/workspace/pok=
y-contrib/meta/lib/oeqa/utils/commands.py&quot;, line 212, in runCmd</div>
<div class=3D"ContentPasted4">&nbsp; &nbsp; raise AssertionError(&quot;Comm=
and '%s' returned non-zero exit status %d:\n%s&quot; % (command, result.sta=
tus, exc_output))</div>
<div class=3D"ContentPasted4">AssertionError: Command 'bitbake &nbsp;-e' re=
turned non-zero exit status 1:</div>
<div class=3D"ContentPasted4">ERROR: The following required tools (as speci=
fied by HOSTTOOLS) appear to be unavailable in PATH, please install them in=
 order to proceed:</div>
<div class=3D"ContentPasted4">&nbsp; chrpath</div>
<br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3 Cont=
entPasted4">But:</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3 Cont=
entPasted4"><br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3 Cont=
entPasted4 ContentPasted5">echo $PATH
<div class=3D"ContentPasted5">/home/plobacz/workspace/poky-contrib/scripts:=
/home/plobacz/workspace/poky-contrib/bitbake/bin:/home/plobacz/.local/bin:/=
usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr=
/local/games:/snap/bin</div>
<div class=3D"ContentPasted5"><br>
</div>
<div class=3D"ContentPasted5">Maybe I'm doing it somehow in wrong order?</d=
iv>
<div class=3D"ContentPasted5"><br>
</div>
<div class=3D"ContentPasted5">BR</div>
<div class=3D"ContentPasted5">Piotr<br>
</div>
<br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0 ContentPasted1 ContentPasted2 ContentPasted3 Cont=
entPasted4"><br>
</span></span></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted0"><br>
</span></span></span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt; color=
: rgb(0, 0, 0);" face=3D"Calibri, sans-serif"><b>Od:</b> Alexander Kanavin =
&lt;alex.kanavin@gmail.com&gt;<br>
<b>Wys=B3ane:</b> wtorek, 25 lipca 2023 12:28<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;; openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bb=
class: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Tue, 25 Jul 2023 at 11:58, Piotr =A3obacz &lt;p=
.lobacz@welotec.com&gt; wrote:<br>
&gt;<br>
&gt; Yeah, I have just checked it for acpid-src packages and diffoscope wor=
ked without any errors.<br>
&gt;<br>
&gt; Question, is this test being run with acl or/and xattr? Because from w=
hat I remember it was not. Can you check?<br>
&gt; If this will confirm, then something is still wrong with the gnu forma=
t, because right now all posix - meaning with acl/xattr support - packages =
are working for me.<br>
<br>
Hello Piotr,<br>
<br>
may I suggest: you need to learn to reproduce the autobuilder failures<br>
locally. Integrators are stretched very thin, they juggle a ton of<br>
patches (other than the ones you want to get in), and the expectation<br>
is that when they tell you something fails, it is on you to do further<br>
investigation. Here's how you do it:<br>
<br>
- start by finding the failed build in the list of their definitions:<br>
<a href=3D"https://git.yoctoproject.org/yocto-autobuilder-helper/tree/confi=
g.json" data-auth=3D"NotApplicable">https://eur04.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Fgit.yoctoproject.org%2Fyocto-autobuilder-helpe=
r%2Ftree%2Fconfig.json&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C29e179=
92f2b148e9206c08db8cf9e54c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638=
258777149507734%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D3czxntfPZq68MvQ=
xKQtJT6Rk5la4O0cca9osxYGcVqI%3D&amp;reserved=3D0</a><br>
You can see that it's this one:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;reproducible&quot; : {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MA=
CHINE&quot; : &quot;qemux86-64&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SD=
KMACHINE&quot; : &quot;x86_64&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;st=
ep1&quot; : {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;shortname&quot; : &quot;Reproducible Selftest&quot;,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;EXTRACMDS&quot; : [&quot;${SCRIPTSDIR}/checkvnc;<br>
OEQA_DEBUGGING_SAVED_OUTPUT=3D${BASE_SHAREDDIR}/pub/repro-fail/<br>
DISPLAY=3D:1 oe-selftest -r reproducible&quot;],<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;ADDLAYER&quot; : [&quot;${BUILDDIR}/../meta-selftest&=
quot;]<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
What that means is you need to set up a plain poky build (no extra<br>
layers, no custom configs specific to your organization), then run<br>
'oe-selftest -r reproducible'. That is however a heavy test as it<br>
builds everything, so we need to narrow it down to just the failing<br>
pieces.<br>
<br>
- the failure log shows that reproducibility is tested via<br>
meta/lib/oeqa/selftest/cases/reproducible.py. If you open that file,<br>
you can see OEQA_REPRODUCIBLE_TEST_TARGET narrows down the targets<br>
used to test reproducibility, and you can also set<br>
OEQA_REPRODUCIBLE_TEST_PACKAGE similarly.<br>
<br>
- now you can run oe-selftest -r reproducible. Once it finishes and<br>
confirms the failure, head to build-st/reproducibleA and<br>
build-st/reproducibleB, to see where the difference first appears.<br>
<br>
You can also replicate reproducibility test by manually setting up two<br>
different build directories with identical configs.<br>
<br>
Alex<br>
</div>
</span></font></div>
H<br>
</body>
</html>

--_000_VI1PR04MB53731AFF1A8F8FE9EF5B53C49103AVI1PR04MB5373eurp_--

