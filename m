Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD59EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:41:03 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.29465.1686861661788346515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=iB07aIQn;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686861662;
  x=1718397662;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y+Gc171d2ICrwEZcJS0E7wwzQJVeZMQ4xYSEpc5pPMQ=;
  b=iB07aIQnpn8kLesB7wizGPfRR2OJ4FFOI9tLh14k7Dpv9ATS2aBsYYq3
   ltppOwpHYkTKLHlnfqxJNZ+nwPKeGKxGqyH63b+ZLKivei+F6gjbgljv6
   FL2eIYDd/HW7XQueNEH4Z3f/ix0IKV0mdA5evueQIyWmK6rkSnVyFZQoW
   7qxFxVYeKBR5UBcsjoN0kp1lyJ6mBDt7qvKP8cwA5KDs8s3T8Kb3uaHAy
   A76TN6jEQBL3EWcSbrIduAiabWVpb6KHPAzVRB64RoF9WEIRYyYk7wgBx
   L/gt2YEsED0kY+vquhEeKI6s6o9krXRmWrb4iltvO0NqXvjKKoJiLC7uD
   Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z84utv8o+11gc1NeR7SksVJ3+SNpFdPEzpHMVi3yeXsO88sOZerPpdPj9vBDaA3JttWQVIvtK8TrRUEaQbNlE6akmZSyJmF/EMoEeb/YgGiLt6akDbyxIMTs8yTQfjl6KpyNelTcOPSyk6ibUK4FS/nVXxopRawlBZuXPV8mkLk+vgn0s+eFdahm9XUrrtAJvetD2MBUY1aDAjOgtnzcjKCgYkogb5N3BcCoHceavzNGfkSbvHnFgTRduENx32UwuOMKVEZwBP1Sg7wLDEfPwrkROalDaUrnC7vfVU2uFEvnZCvkj/WfHE10c5krjRpPvbziTqW7r46yQiEx9OXZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+Gc171d2ICrwEZcJS0E7wwzQJVeZMQ4xYSEpc5pPMQ=;
 b=fREBsQdgfblJZ8YFbxC/qMvFQvMMm/yOythIngUWiKzcNxhQWODozXnl4FQZBaky8EdWoJjK23WAMg7DtWemKEugdtIMekzoA6TOPeW7eMbD2W7vUCZM8QKIBgYjnbkdKrwGliNkZi2CdEfPW1qk39AnrooOasbUzNS8TfKpklHUSlDeM1ThXi17E0O6BgRWEjOnF//xZQco1IW1uxuNr0P7WsoWZ/KGif8Zu2to9cIZ/oQsFw4uGwpC3sRMo/hv3/ABIKGRO2XTAMBcroqKPBD5eXlAXDXnU0dkzPyIq67jOqz+PYw9XJNs0koAjS+UIC9nkz45Uy00W3Vn1FOUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+Gc171d2ICrwEZcJS0E7wwzQJVeZMQ4xYSEpc5pPMQ=;
 b=NTisW9GyxfdejQeBhOEe3he+34hZ24ENGMLPRq+EP0TDlqEdzE/X5ZudIWNBkC7NiZyj6nkKaVv4JFSh5SVRgNA6p7LyY4Pkaz6uwyFmfYOB+3YrQyApKDe4w5W5o7HuVHIs1g12dxcXeaTSO/LI0I3Klr76NLEPcZM98EEXj2A=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Martin Siegumfeldt <mns@gomspace.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][dunfell 3/5] systemd-systemctl: fix instance template
 WantedBy symlink construction
Thread-Topic: [OE-core][dunfell 3/5] systemd-systemctl: fix instance template
 WantedBy symlink construction
Thread-Index: AQHZnslQARpzuFe0M0SP4PbQQg+x3K+MUdDQ
Date: Thu, 15 Jun 2023 20:40:56 +0000
Message-ID: <DB5PR02MB102132E7293ED031B16A6C02BEF5BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1686751371.git.steve@sakoman.com>
 <f5ebbb87943bc583049909f4216ca1d73a794261.1686751371.git.steve@sakoman.com>
In-Reply-To: <f5ebbb87943bc583049909f4216ca1d73a794261.1686751371.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PRAPR02MB7834:EE_
x-ms-office365-filtering-correlation-id: 16e7ca25-7e24-44f3-0e04-08db6de0d23b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WmCDoyLJYAH2Zg5G5ZEs8mBtsmBwbWUR2V1tVRkdaJHRoWQn/S1/ICy4PlZY5CM7Q1LKyryOJobO1I6VMPnUlQqXR7IiVx7NkO14I5TAYZgRKyQZE64JfgA6/x3rAKD0J39EVA7XsE6an68wI8LDw3yTjrjirGlfLEFExVsX4gNNG8wZqIBA41HBjf9WWILCUY758c0nznfq6HyNJcrAyyxfRQhHtVrGYGQtXfuJRHsTEqAWgTO7sZ1dBogjOBBHzT0tPf7zwBHQhSDalXrEUjYYr+Yx126Yqkugtj6bUh22PO1aZgzxv0+fCC7RuARbHavTor6svWdAoE/cjH0486Zb015/TlDu2o1Q+wFUVg+HrhCyRphy1LETdk18LcpHEI1ExFjVjpiIa2pz58CExny/maXgYltokouO5joiqjX9DN1oR9V/j+m4RkIWkNqFZhb0QUrESCgthtWgm1DwIaFlSluV9mbhggR6dmAz168BI8lzpfPZk1rCDcBGTLvEhz2FErCQyyc0TRWO0/MVJyVnL76uDYURYZ3Bjxen85NUzLIEfOuV9JP4ELyhYNT0E6zCBib5eL+f6l+lQQ+g6+UJxHjAA8G+KCPfEpTu2eI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199021)(9686003)(186003)(53546011)(26005)(6506007)(7696005)(8936002)(83380400001)(41300700001)(316002)(52536014)(4326008)(44832011)(5660300002)(8676002)(2906002)(66476007)(71200400001)(76116006)(66446008)(64756008)(66556008)(66946007)(6916009)(478600001)(33656002)(55016003)(54906003)(86362001)(38070700005)(122000001)(38100700002)(84970400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lf5zPNtdfSbgOEPOV+leowMv+fO7rzfNjsqs8Am898FC+LgiSRVbPWxkP2SD?=
 =?us-ascii?Q?C3NYerrxYNmP43Py8XrX+OcrYI2EbF70pcSFcmhw5zslyqM+NhOiV94brGBU?=
 =?us-ascii?Q?mM8io44qKsEL4dhOSN+1Ac176afz7t7hwCMKbiiLAbJ60YCjiQvsG8Y8CxcI?=
 =?us-ascii?Q?Eguj/beY462n5Ob1b3KZZf0iy26mbo1iEbmhkOE+GyUOnZ2GOoJO5goYuebJ?=
 =?us-ascii?Q?PHyMztsNxhgVKcm0Bpjn/+NAS3+dkJ2YMDbN9vTLjJ2bqF/UVodtMkULgwqV?=
 =?us-ascii?Q?dB/8tStSUUIYewXPKNUc9uSGNz39V8WGGLdpAe1UHcL9jwzbMFDKEU5plYRK?=
 =?us-ascii?Q?6ql6JiQGKg9IGHldJXAGQMwyjvAOFlNHVOKv9AAqiV3FrPJ0Tx6NsA0vsRUs?=
 =?us-ascii?Q?QLw7bXr0OWGrBjxM33xbTs3L9hlZJj7p3vaEKApufDfDi9rXDX1xDfXXfluG?=
 =?us-ascii?Q?rNkjgw4RQWaoZhcg75zqyzVXndZjUQVJDPSWt7X08WKWNU2HBYPcciaQP6c1?=
 =?us-ascii?Q?/D+PV9nEhuU8tqux/BzIvMK1IcDy+oX4Y1k6Csa+q77oIa/CmmLB5CijehkQ?=
 =?us-ascii?Q?ophNsbSn/f0vCPmi2o6Z+ukP0Yt/+iGDonRR7ysfhORZ2BaiWXzafKePM4Ut?=
 =?us-ascii?Q?baAmPgqMNskD6l4VVecr++VoMMQgRxF/za7H1nuWjZ869KbUIQ4eZgFiCm0C?=
 =?us-ascii?Q?upbGjcC4iK09s+5AvalkDeQhvFZDK0Bc+LOLfeZ0oFrVXrt9Sq4/gvkAPd9D?=
 =?us-ascii?Q?Lr4Qo4I8vb9oA9TLfTxrnv5BHevSFMfSvi5SGL/IzqpAbitsLIFKoEgRdSc3?=
 =?us-ascii?Q?fQlwXtoZcKIDGxfX7PW24e/RxKGiqyJBzx0q9b/m8EzrwIxAkQqeLkR0BMzu?=
 =?us-ascii?Q?X4s7X2XkbBxu3KFeAQKx1n8VsaScsVRusC/csMbHPIuGTeKu2tm6JKf8W4Ot?=
 =?us-ascii?Q?lOpu0KOUvN4eWJLhEhz+tugvt9b+IDSxH92jq6D4fvRKbOQjM2PKCCBTP2jj?=
 =?us-ascii?Q?q/XOcivRJh6irjuqf2+h6ZfSGDFYTZeR1/k08n8jVn644jUgRuyDevrVlwqH?=
 =?us-ascii?Q?1S7ifRgerp7FDTC/g8T81ItPH2x6yqG8euuBZTogzeklJDbQTr/HZzp/RbIe?=
 =?us-ascii?Q?rirVOAyich0jfYOwYt9pr29MDaoKmaVJCbucD9Jo5FNCFYu3LPR5VM78BDwa?=
 =?us-ascii?Q?yHHCP0/WNyhQPIBVlNZXUnbIMIrQ/JtrSi7utGPua8GFBw9snUAQ/g34EgFE?=
 =?us-ascii?Q?IaxV2xq5s0Bn/mwLcWmy6fWvDRoi0lSu4QlkcB0BlD6pcsXIw7F4Dy2WHkR8?=
 =?us-ascii?Q?IXLtEovc8N0d+8jPAvBdh+1FBXgGvUJO00afm5rRvq69DsggrMW6XcXgo2si?=
 =?us-ascii?Q?pzxkIZzb+NHl8ytoxXcualjC8AmLELzPMeG5A/aJ6riW4K2grkmIGlOdCLBZ?=
 =?us-ascii?Q?kDBJJmYudov88Vf5JHP6jMHfEZac+t5uAi8DimBol+2AfNy3RWUaNjxBsGhd?=
 =?us-ascii?Q?37bJuEfSXu+DFvJqSJ4KsUnERCsRD7f8IN6vFpll9Dps87wf9IE/gGs/YK4u?=
 =?us-ascii?Q?TBBOpzKHPP7Ilsvd3Mw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e7ca25-7e24-44f3-0e04-08db6de0d23b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 20:40:56.9977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wOOhB3HaghSEcHXTzULXbf0kFCYL1rRmEanwdMH0gjzVZw87R294Mt/R9ABcVI3P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 20:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182872

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Steve Sakoman
> Sent: den 14 juni 2023 16:05
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][dunfell 3/5] systemd-systemctl: fix instance template
> WantedBy symlink construction
>=20
> From: Martin Siegumfeldt <mns@gomspace.com>
>=20
> Fix issue of the below instance template systemd service dependency
>=20
> [Install]
> WantedBy=3Dsvc-wants@%i.service
>=20
> creating the symlink (instance "a" example)
>=20
> /etc/systemd/system/svc-wants@%i.service.wants/svc-wanted-by@a.service
>=20
> which should be
>=20
> /etc/systemd/system/svc-wants@a.service.wants/svc-wanted-by@a.service
>=20
> as implemented by this change.
>=20
> The functionality appears regressed just after "thud" baseline when the
> logic was refactored from shell script into python (commit
> 925e30cb104ece7bfa48b78144e758a46dc9ec3f)
>=20
> (From OE-Core rev: 308397f0bb3d6f3d4e9ec2c6a10823184049c9b5)
>=20
> Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> (cherry picked from commit 372b29c8ad270d4d430c26a4e614976c7029afaf)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../systemd/systemd-systemctl/systemctl             | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index 6aa2e20465..577c373181 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -182,12 +182,19 @@ class SystemdUnit():
>=20
>          raise SystemdUnitNotFoundError(self.root, unit)
>=20
> -    def _process_deps(self, config, service, location, prop, dirstem):
> +    def _process_deps(self, config, service, location, prop, dirstem, in=
stance):
>          systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
>=20
>          target =3D ROOT / location.relative_to(self.root)
>          try:
>              for dependent in config.get('Install', prop):
> +                # determine whether or not dependent is a template with =
an actual
> +                # instance (i.e. a '@%i')
> +                dependent_is_template =3D re.match(r"[^@]+@(?P<instance>=
[^\.]*)\.", dependent)
> +                if dependent_is_template:
> +                    # if so, replace with the actual instance to achieve
> +                    # svc-wants@a.service.wants/svc-wanted-by@a.service
> +                    dependent =3D re.sub(dependent_is_template.group('in=
stance'), instance, dependent, 1)
>                  wants =3D systemdir / "{}.{}".format(dependent, dirstem)=
 / service
>                  add_link(wants, target)
>=20
> @@ -227,8 +234,8 @@ class SystemdUnit():
>          else:
>              service =3D self.unit
>=20
> -        self._process_deps(config, service, path, 'WantedBy', 'wants')
> -        self._process_deps(config, service, path, 'RequiredBy', 'require=
s')
> +        self._process_deps(config, service, path, 'WantedBy', 'wants', i=
nstance)
> +        self._process_deps(config, service, path, 'RequiredBy', 'require=
s', instance)
>=20
>          try:
>              for also in config.get('Install', 'Also'):
> --
> 2.34.1

You might want to be careful with this one. It broke systemctl for us when =
it=20
hit Mickledore and we have had to backport the version from Langdale for no=
w.

The problem is that it does not handle non-instanced units depending on=20
an instanced unit. In our case we have a unit foo.service that contains=20
a RequiredBy=3Dbar@0.service, which causes an error like this:

Traceback (most recent call last):
  File ".../recipe-sysroot-native/usr/bin/systemctl", line 366, in <module>
    main()
  File ".../recipe-sysroot-native/usr/bin/systemctl", line 352, in main
    SystemdUnit(root, service).enable()
  File ".../recipe-sysroot-native/usr/bin/systemctl", line 250, in enable
    self._process_deps(config, service, path, 'WantedBy', 'wants', instance=
)
  File ".../recipe-sysroot-native/usr/bin/systemctl", line 210, in _process=
_deps
    dependent =3D re.sub(dependent_is_template.group('instance'), instance,=
 dependent, 1)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^
  File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", line =
185, in sub
    return _compile(pattern, flags).sub(repl, string, count)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", line =
317, in _subx
    template =3D _compile_repl(template, pattern)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File ".../recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", line =
308, in _compile_repl
    return _parser.parse_template(repl, pattern)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File ".../recipe-sysroot-native/usr/lib/python3.11/re/_parser.py", line 1=
000, in parse_template
    s =3D Tokenizer(source)
        ^^^^^^^^^^^^^^^^^
  File ".../recipe-sysroot-native/usr/lib/python3.11/re/_parser.py", line 2=
26, in __init__
    string =3D str(string, 'latin1')
             ^^^^^^^^^^^^^^^^^^^^^
TypeError: decoding to str: need a bytes-like object, NoneType found

There are probably other cases too when different kinds of units are=20
involved (at least as far as I could gather from the systemd manual).

We have an internal issue to fix this, but I am going on vacation on=20
Monday, so I will unfortunately not have any time to look at it until=20
after summer.

//Peter

