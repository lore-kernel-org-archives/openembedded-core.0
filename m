Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343C1E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 10:15:00 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.64])
 by mx.groups.io with SMTP id smtpd.web10.33791.1733480093097294447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 02:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=qWGPVNPa;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.247.64, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rb5ckwrLZYu/frh/ljWq0N851DdwgbQld/JTa+vX5rhIe6sSP3q5A66yKwMY3FYevL0oTFfnv4cbcPXxMyjzgGyKlRPpVdMOTEFLhjtACzssTNN6y4GUz4D3+GAqFDRM0sm8fZzmvd63+esX/3/TD36sS3L46/tdGRJ5WL2g+S8ECbsuMD1GDtLcRcujt5sQNYMGa7evYh74SEgZlQbpomcMtLotKHlks1DzvkgN2DLMFVyFIOFytvhuICAszlY1cGhyOygo6BGCQBrIGlry/hA1qZVDOLJGdYfauXypkhyYxp3to5dcjwIB61Uwgi82zSW/ttKUnbNKOpyeqjW8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuQZpt3MPF1Va1RcF/viOlOGeMxhycrVq32e0RRrNW0=;
 b=anu4ZUxPd4WnmL+/Cgt4/q7+8ALoos1wfCscpubfwzAihqPptJwNdKVdalmnym6eUuJ8NJHtsoPMIt0afhc/OiM5XBzAjuzP+yXL4CJsNXm+cfA/RSKYxwvFFwnNjFHwEAwQ/tUAYcZC4656HivANgSG1gYxDr60i1hUbzp6TeOmLDuasJ+zDaQb2dLBTN7hT/hJximRcOE6HsjqzxK5hnHWf8bJIFIB5fPGqkDyNvHJexANXaGB86TvXtr5W2NC14DhVyGIPON7SJ89x8S68ZpynJxkdockaCXJmy3O8m2JgU2DR0ASGtBVeSMAgIN4EIYbdg+sUo/mvORMPrs0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuQZpt3MPF1Va1RcF/viOlOGeMxhycrVq32e0RRrNW0=;
 b=qWGPVNPaeS++cmavZqRXW/GJLfDg4cJ0Joljzf2HCcRxZxNtxhAuhs5j5jX1yW5bvjq7AzCGQoGR0uQiNIB3vPYe1N+6Q6pOkfIJABjNHujnkUjTsjeBQgFl40j1fW3ZgPcTWoA3RqSOzDWeaXO+V09Y88c8G+8+B1cLNLbufv0=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PA2PR06MB9754.eurprd06.prod.outlook.com (2603:10a6:102:417::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 10:14:49 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%7]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 10:14:49 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>, Johannes Schneider via
 lists.openembedded.org
	<johannes.schneider=leica-geosystems.com@lists.openembedded.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v10 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v10 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHarFIAcEy2Q4uuIU62MWDF+Zott7LaLawOgAAElwg=
Date: Fri, 6 Dec 2024 10:14:49 +0000
Message-ID: 
 <AM8PR06MB75210E2157872D66B0228CD7BC312@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
 <jwqr06lp2pz.fsf@axis.com>
In-Reply-To: <jwqr06lp2pz.fsf@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PA2PR06MB9754:EE_
x-ms-office365-filtering-correlation-id: 43897858-206f-4666-deb3-08dd15ded15b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|10070799003|4022899009|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?q1pfuMj4+kIevEvvm/xC2FghYLhOP38HgFwQDXNDCyKvpj8UCPkj7xnh2t?=
 =?iso-8859-1?Q?zdNJp0E2ztL2yd0fHibUWfWK1XmrWeFbIyvWC7+PjXrz0l420522rsj+uD?=
 =?iso-8859-1?Q?yv7apf7oUeeglNoX5DiJ6PmNZRr0Di0SfTc0cjtVbQbof8nKZqYhOc1F27?=
 =?iso-8859-1?Q?9W1TEt07UKNrYf4zfY40gj+VLijD2scw+MpSYYqbSux8+hrSlJHNOA/VeC?=
 =?iso-8859-1?Q?y245/3vqcV1Kz557hlGjC3/PV+08yAoP8seXLDPkhexZW/9n6cA/wjLV41?=
 =?iso-8859-1?Q?IloUz4mGDlzC4Jp/NR0kjxISyJem44BHBiZi15qp0fUL9a/B2H4BUxOmP+?=
 =?iso-8859-1?Q?oVLs2UJzIhjb/ZqBgZWWnOIiCxnKyaa5SkjtzJKGwQdV9n7syirs3weOJB?=
 =?iso-8859-1?Q?I3w9gz8QDV66BHBo9Kc3hcBtylAJqyfLaDUxWV/CAQci5qFyT07aVefyGg?=
 =?iso-8859-1?Q?lBnHmLXy1l0dr7rAUvnMq2RVQn+i1vjz18FoiCEhdS1lYhJHBRZpPmpgHb?=
 =?iso-8859-1?Q?qOJEhJsZFgIvT6MZfr2fPXAyktPkGYsIdLgBVUTruR0Ul0vsV7a6r6ELEx?=
 =?iso-8859-1?Q?DV+tSxKA9i/q1VepmJW6C2LJY3nz60CbMrHXSH+eIRY2cpLeFBIlX9WOky?=
 =?iso-8859-1?Q?waNYHnN/zgqL2ugzRycAFp6SIxwfrvBFGToSXJ0Y5KBRoKZnjEegLAT0oA?=
 =?iso-8859-1?Q?K+c49CvTiun5RX3AosSRa7m4m6I6dalHuGz6x10RnBPJEti78ViIEm0yrn?=
 =?iso-8859-1?Q?0t3nTp3DT2JBTrFPnnMg1Xkocrr5CV2uFkUXRrnGBS33xzPUUkGU0JI7Nf?=
 =?iso-8859-1?Q?oQCccZAfrn0bYAuLCzExT5O/XPQDLcMSlAEqrG+1w1reRA1K3ueefnbZ0l?=
 =?iso-8859-1?Q?WTorDBzuIImQ+8bq+i8F7HCDq3TVKv5Rd2gtGGiLVvOCaKgBFJMuLcQY9j?=
 =?iso-8859-1?Q?n7NpDz0lNeZmoscnyWg9Nf9YGc32U0fXqW6u+mvsBpCbfM5LJYD8ptllMy?=
 =?iso-8859-1?Q?zBDsy23DrZeut9WBJIdgQzgKOGEV+cS6OFKRI6cAqzjf5Ql5R6Fo+OBt6g?=
 =?iso-8859-1?Q?Y+Vv2An8XpSOBbpswvSDfaH9S/35wZRXlXW3jF8U/aupl3NUQBIxzih/ss?=
 =?iso-8859-1?Q?w8gHwEh6CzwNU89QiLB8kdQ8jHSWV7Vwi2QUcumuwYXMt6jyAmgq3fOYKB?=
 =?iso-8859-1?Q?Qv9ufdr+SpguX0gfPzOodZjTtE7xYsXu5LC7e9kzBRFAs677tqlI6BCW85?=
 =?iso-8859-1?Q?n+UAlFpXzgp5DtQkCXkkJBiEWIniWDPJOUHW5p0OQcl21yW8CFlSHJgz0F?=
 =?iso-8859-1?Q?yE45uA2rAuLnAqPUukPZAEw9SLKeh4p0j9bsivYPGeRFqLcMHVTsA5Wia6?=
 =?iso-8859-1?Q?1Dq29plgQweDk4ub9MD3r2r6LUfwLeJFzJ8pS2gp1D4yKalYnXAvs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(4022899009)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EHMk4lIpXGoQWbsMCG+vmOw/9pmX4mkve6fNACaDRkLZEuQ3JWHkJ172ez?=
 =?iso-8859-1?Q?yGYpU48fE4CyJY+ZiwGPsnLw9J6CCun1pG3MXzSI18Hoi6+lHGO9dIax9v?=
 =?iso-8859-1?Q?VOnd3w9NjKZG+8hUhezqG4aAdG2LWT8fKcVFV4u3VQoPcB/6xQ3knphf2B?=
 =?iso-8859-1?Q?XKqYJ+K49uFS+6ZU8hHCFw1ywDVFGj+L6cN0r9MmNNar25bXKNhaTo9Per?=
 =?iso-8859-1?Q?dbR5EF5LocMGa12CrmtIzEy8OwdRCRgVF7ZwDeA8dDH3y/L/hWnoIF8Ek4?=
 =?iso-8859-1?Q?adu3H9lHsYrKGXuTYcRswQ5kLmbq70hiuKlqvsPgoWxLwbHdyjLO98nE+Z?=
 =?iso-8859-1?Q?cPv5BSGaiEcX525GEdIBXwliJlRakoDEycuGsmbBZ9lK0kRpznDXdH/AtM?=
 =?iso-8859-1?Q?orqBfGn7f3CHpvovAHpxw1RyB8JsvUecg0c66aWGo1YgW25hY4nGKCwVF/?=
 =?iso-8859-1?Q?N6UnA0iT2UqynIf0ctrcUVP454ZDYTLwSYmdUMHHqmD8LP39yff/ZDbcI1?=
 =?iso-8859-1?Q?IB4jqFthflIRdzfEUicG2ChSt8F9JfWaRT4zRQPThqyxc6kfhD6VokhtJt?=
 =?iso-8859-1?Q?C2XRABtTY7UxdaJOZrXCHQnGasTXma6j4EiXjI97tXMtokRCF8IudMA6D6?=
 =?iso-8859-1?Q?u2jt+LyBdxzQ+uNbIMy64xpPi7ba4ahpYbjhG2cqIZG+M92dV4iNcKYyBs?=
 =?iso-8859-1?Q?5dAuZnAYNzgHfFud8f8O7PGDVD0ZyEj1Nwmwpn0odJXmw6rQLlAELOxlOX?=
 =?iso-8859-1?Q?85DDdC8PCWFq3ZKJKvE+3erYbINCu37Xc7eRMxkZe66QeIBmI+4x1iGvG8?=
 =?iso-8859-1?Q?RUOw2uR4mOzRfrO0/Bb6Fn66UrPB2qRqsXPebduA5QAQRTel/D4FEaAJDa?=
 =?iso-8859-1?Q?CQbVnZaqWT+BtR1FwvGPmqyi+mLhh7tKvVnJSmgt/jDjjmv561S4NMgl6H?=
 =?iso-8859-1?Q?gvrOfObamvZByeCQSXapfuNdzKi1jfskSd7AipUQ7UeNj2neUFuYWeGAJ8?=
 =?iso-8859-1?Q?e0PETpZfMlPGNoLjbCu0jbhk7tghcRyVy+gZShczJkRWtVLdWI+afFVMOb?=
 =?iso-8859-1?Q?NvWTbNCieyBPr69TCCoS3v75eCIiocFRuKaqjKZtjFqVzFpFux+2M7YdXx?=
 =?iso-8859-1?Q?wevvZc5buoPLyJAhp7rkeCa54yajWdHTjQ+e2oQB9p5oavTTV9XZxsHpu6?=
 =?iso-8859-1?Q?TSYMvxnHuBTZbVbtry//Fw5/xdKDlL22OxsnN+EzKMyqfsQVThm8C0EwVU?=
 =?iso-8859-1?Q?afVsKLIzc4hoYmcnm0uZcDMcLzQHpwiPEJ75/Ye8QLJ0DLmsxuGzRRT0jC?=
 =?iso-8859-1?Q?PpZ5OGeIAlCCHJt/gCLKPfHXQuQH1Zp/5FswnVa1p37XSPVAaAn9Ca40rl?=
 =?iso-8859-1?Q?tHY6Rz1a6VRffcJPOjDhR8SwaR7JD8pEFmUw44+54h1SFQaw+L+vTyKlEE?=
 =?iso-8859-1?Q?DnnjZeFeF1+YJ8yWtlUtMj4t5e23zPZIYx1mAfO+0cD7K3XsAwunjBPgr6?=
 =?iso-8859-1?Q?XjMkyIjXtJrtKB6F7tGmpfWwEpaaK1JhmuqghyFyOu8TFNw/YstZstPv1c?=
 =?iso-8859-1?Q?NmDCcch/qGBluLv11lZZHJY7SuRXihOapx3Ts1yDMvbUGrQeY/t0TDmeR8?=
 =?iso-8859-1?Q?718q1hzM9UnA5jqzkIqgaIyVdYIbxXwFwFhfLMWuaEtinnyOhjvWqGw1LU?=
 =?iso-8859-1?Q?SZ4UbkOzP7DTZrLKfXqLGuxIVWEvgRXNOpGfRxPbp1etZJMWDF+5ZXjf18?=
 =?iso-8859-1?Q?DxZvGUW4NwKPBjT/26X4A0QfU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43897858-206f-4666-deb3-08dd15ded15b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 10:14:49.5759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTs0hbyw2IxBRVUcHwi+6v8Pne3eaaxOqzFBjBuvKYAl4IqRI6FziLex4UGue5ekye7vSzPphWGyTADSFTLTb3RGb32M2JUYeQ7It5SPVybItQzVMVz8EVVFqmWSMYhb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9754
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 10:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208415

Hoi,

> Hi,
>
> Johannes, what's the status of this patchset?

the status is: it's working (locally) since around v6
but some combination of the testing CI where failing, which led to back-n-f=
orth up to v11
which was AFAICT almost there, but then the patchstack was dropped :'-(

> I'd like to start experimenting
> with system extensions and this looks like the place to start.

please do, more voices that use the feature might get it picked up again :-=
)

>
>/Ola


On Wed, May 22 2024, Johannes Schneider via lists.openembedded.org wrote:

> systemd-sysext allows to overlay another image (or multiple) ontop of
> a "base-image" =3D the current rootfs, via the use of overlayfs; to add
> tools and features meant for development purposes.
>
> To quote the documentation on systemd-sysext:
> " ...addition in order to make debugging/development easier). System
> extension images should not be misunderstood as a generic software
> packaging framework, ..."
>
> To build a lean image, that only holds packages that are not already
> part of the base-image, a snapshot of the package-database is taken
> after the installation of the base-rootfs is done, and picked up again
> when collecting the rootfs of such a extension image.
>
> with all this in place an example usage could look like this:
> some-core-image.bb
>   inherit core-image
>   IMAGE_GEN_PKGDBFS =3D "1"
>
> extending-image.bb
>   inherit image-sysext
>   IMAGE_FSTYPES =3D "squashfs"
>   IMAGE_BASE_PKGDB =3D "some-core-image"
>   # the above pointing at a package-db similar to:
>   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-20240210172305-=
pkgdb.rootfs.tar.gz
>
> then on the device, running some-core-image, with the extension image pla=
ced at FN:
> $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> $> systemd-sysext list
> $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
>
> As long as the VERSION_ID of the extension image matches the os-release
> in the base image, the above commands return sucessfully;
> for details on the compativility check see the docs for systemd-sysext.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> changes with v2:
>         rebase from 'kirkstone' onto 'master'
>
> changes with v3:
>       incorporate review suggestions for simplification
>       add task dependency handling
>       add oe-selftest for the pkgdb handling
>       add variable documentation and
>       some more comments, and examples in the commit-msg
>
> changes with v4:
>       rebase onto 'master' =3D> no functional changes
>       fixed patchtest findings
>
> changes with v5:
>         rebase onto 'master'
>       add '.sysext' to the deployed symlink name
>         sidenote on the tests and autobuilder failure: run locally they s=
ucceed, e.g.:
>           #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_im=
age_gen_pkgdbfs
>
> changes with v6:
>       tests: restructure to call 'bitbake' only once in the testcase itse=
lf
>         (in hopes of solving the autobuilder problem; local test runs suc=
ceed)
>
> changes with v7:
>         tests: undo the restructuring of done in v6, in favour of explici=
tly forcing steps:
>         '-c rootfs -f'.  since concurrency of the autobuilder, and reusin=
g artifacts/sstate-caching is probably the issue?
>
> changes with v8:
>         tests: fixed missing feature=3DPACKAGE_CLASSES during 'test_image=
_gen_pkgdbfs'
>          which is now split into three, one for each of the three availab=
le packagemanager: ipk, deb, rpm
>
> changes with v9:
>       tests: fix singular failure in 'oe-selftest-armhost'
>          which was due to the built image not containing a 'kernel-image.=
..', which the gen-pkgdb sanity
>          check expected, but 'packagegroup-core-boot' instead
>
> changes with v10:
>       tests: fix runCmd usage in relation to native-dirs
>          due to which only the use-pkgdbfs-ipk test would fail in a qemu =
run armhost environment
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199756): https://lists.openembedded.org/g/openembedde=
d-core/message/199756
> Mute This Topic: https://lists.openembedded.org/mt/106243260/3618480
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ol=
a.x.nilsson@axis.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

