Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A97C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 12:44:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15631.1787575436688759047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 05:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=CTTWnfxp;
 spf=pass (domain: navimatix.de, ip: 52.101.65.138, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQqPoClGQXWic8d62Yx7YQL2OOIvNB9vHK4qnz60ESkagRFm/udvFQEIiN3UhMNDbjNi7ul9GMYN4aSR9WN+QI6xgyBfp3M1FRNj0KPmTkWIfXJqAk1j3vF5+TskJlKMtXY3p1CNc1szOYcm68Xf6a8YMTlZBnyr33Vk8cPGIjSAr2m9cFRyD9G32kPPUc2AYDTc4x6xuyzDejvii0bLOWRWrN6GLX57q1HDSdIV6+IX5XTkGOFf/Af7gxvi+V49y/NH/rAQdPF0Z1/AVx7QVXmF03xO6r/UHS7BOBOvfZuwZULHrNqQXDyY0A9a0+NEpHizyE6aC+GZbs4kQDkD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFYHHxpZ3lbCSx59VNRxlFTOCmxvyVucYWMdXtASyR0=;
 b=CCB7054cQfYXHCQKvt7ZFOjN/ElngKCg65hLYMZEQ8kCPOFob2o7w0F0uo0lsXo67goLC2QdQC/Ey9bBRkMHUqJ+sDZyl1k1taqnhpkliJ4/hJoJR0Wnu3f6G7svbeqcpjIc1hRXeOm6w2YlbG/fthSvGKGWfjNjeFHR+o8/yLD4sNVTF+9mzaCD3v9rrPDM89/QNOOJwAJD3SX+1MEVMvBqUr+O3b2Ry68Yy2JJ4zxErEPJjVZUQuDLewB3uLVXD01wsJs2KnRWNjRnXVsYii4+SaLtoLAN3wXUK+oLN3wCa8UWuLeaknJSMqGi0DGaSS76wu4j+7r2C82OBZYCwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFYHHxpZ3lbCSx59VNRxlFTOCmxvyVucYWMdXtASyR0=;
 b=CTTWnfxpup82eNetaKAxYWlnCQ8guPtKm9i/6zuBK2nFyTN/3VdOLAR/oYt60InjucPLMBRQYjPKWehPBzA2aKEdRlM7zl0/qKPG2S6PyUEhDRRWVZ5YJix9SN3gT0ylYQyed61IG+AOId/ySced1l9OLo2Z/FEo9ItT+fhB6bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB7541.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2a4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 12:43:52 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0339.012; Mon, 24 Aug 2026 12:43:51 +0000
Date: Mon, 24 Aug 2026 14:43:49 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, rs@ti.com
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
Message-ID: <aow7fs_7Zb0KTAPf@navimatix.de>
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
 <aolV39x9UzHwcTrZ@navimatix.de>
 <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com>
 <aoms3iLkFaLTp8E7@navimatix.de>
 <DKWYNZVX7C32.11QQ5O5ZO8J68@bootlin.com>
 <aowSZF6aysT2amaR@navimatix.de>
 <DKX36LKP5G7W.3D3MAFXU05Z5X@bootlin.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="fcksp2h3mlsf6z5m"
Content-Disposition: inline
In-Reply-To: <DKX36LKP5G7W.3D3MAFXU05Z5X@bootlin.com>
X-ClientProxiedBy: BE1P281CA0378.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::11) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d4124b-da25-43e5-6790-08df01dd59e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	8DGRhfjgHIMiiyTt/f8+G/Ok37luJMJLBNWLoBk19HGmHp64wmCQ5sTXsbP7JpIASWmzwg4H595bobyS2oabjOLSMuwExiwCcCIdLFNwilfiFeokpM2if4we5Y95keD4bUgg5xKWbquQuI3C2NDtchHQCyuaam6hLu6tFdNmINUnEVSAoQABksTR2vyO+JBxjcd985OZedrx7nnbuvN3a94vAzpp7OED0vKiL/95qj4MtFOOst9l+jbPNM/G3ls9eDTLQkBkYj+gaF11IXBC/2nlBIlbQ8znJehNge4mmO2FkOomBfGQCW0hqi/bubHReiEou+dHBrJr1+SpTp8NvyYyO27VSvhj40ixGH2ffwUrBXjQUtqhTmjYyHFhEtmGUfATKGxkgFN8sPne5NLepPNvKYeJynIUN/fQfiKejIkpZ6NoatyRuO/GF3IFlDB1YU//E8aS3L63+WC2QPnY5QCFO5nVX+ggUPHYqlz6Qg2IpDaN+t4ZwIsOqUZbSudfShyZSfkbnX0ohFZS9mKcwhYPBChvKM/keoBfYT+Fr9NjJNTDzRqBFG5OZyFvAFEHNVTmvEQKdsP2CIM4MtNUstegcmpbPT9uiFUgG7AmqlQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?KnDIohz2nndmKlaD78II/zXlqmz2yf9QeGMz/qqQg9uCSiJJp6edi/C+4/?=
 =?iso-8859-1?Q?M0B2YKL9FJ5VkvZRXe20oehGx9YCY5Ami9HDsYoH9BIbv/5MvowjL2P+jz?=
 =?iso-8859-1?Q?XPcw6knE/xt5H7/t3DoeNXbhvW1akfT4EzlxlMR1Mht5Oqw7d8liblxpCL?=
 =?iso-8859-1?Q?6M1RAF3Y5mPyCEjtinoV+doBgbDIS99sQ3yBT28gircTAM55BJuJrAoPct?=
 =?iso-8859-1?Q?q73vWScD5+MZKuhahrYttbC7ARM6TQ61EdhwTgp3K8TxXV019YG8c1CnY9?=
 =?iso-8859-1?Q?4cQ0FlzEGlh05sa6FnBbUG3VUZiyuBqmdeJd9XSIJ0uNPfsuTPL11i2Hb5?=
 =?iso-8859-1?Q?1U3r98xQ8A/7qO77Rw2CkZOOV2F+QtF4dT0P+qwy72cDme7r2YqZgWyA+M?=
 =?iso-8859-1?Q?cJr634rYsUlEsGGn2DRUq/GO5N2ChNMEfKOvYZa45HwJnVjgUz0zTPG58n?=
 =?iso-8859-1?Q?B57lR1cb0YQp4dS8M12/zusDKA5mfipxZ+yTUtF2U7gz3RSDtk+jFARpnV?=
 =?iso-8859-1?Q?S3Ll6WaagaMnntmoYwc6jiaDzniGCOwx65PprO6VofOwmHIPZN1EP1T5uA?=
 =?iso-8859-1?Q?Hlnf6ji7FseAw7pAh7CoArBZbUm4oRljIDsIRWrEkV5b262wBeRFVjiQLt?=
 =?iso-8859-1?Q?dPim+068bgU5K37VTaExXtkR03XqWnhBg49Sp3yjSB4zqKPkqD7Er4EjWg?=
 =?iso-8859-1?Q?4eXsnHfDbzor35N7iuuIxQwJlylwomPcBXkQqE1ZOARZ3zbwV71Uy2r1ev?=
 =?iso-8859-1?Q?74k6Q4V8YTBb/BnayKDG84stvY1UYoKG1ycXztGEgZ5KRrf4X+kohytiHq?=
 =?iso-8859-1?Q?h7/3xLtq46HDXNei5UFGYD0LqmcB6vPS93WFu/fkDL6BVj3yumEqTWG0s2?=
 =?iso-8859-1?Q?h+7bTzSLKm+ozNdT7pa3KVT/SFLU1FEKH1e1NN84a8nSclgS9jDHYMTcuM?=
 =?iso-8859-1?Q?St1GSEwqjAYIUj6+MWRbBaSwI36E05MTo++7ldJE7pGFYq6G6z1LV86FOy?=
 =?iso-8859-1?Q?1fDdyPi4tVmiZ1NnJr//A9CJm4/nMSnsCLRDLkOBPpWW6qShA2S85trq+w?=
 =?iso-8859-1?Q?7LerL8UYBUcRAIcajnqryAjDPsaKI9qEXPnjMFKDDMSHHai0kxXQxLiezE?=
 =?iso-8859-1?Q?KeS624Ygy/pCG0mmTh19tn2XbIGZ5L+fwljGRN7MjNQpOTUu6YCxi/HAtp?=
 =?iso-8859-1?Q?QERJSh7qX07DdsHe1zBdVnC8ZcPKj3IiGbC0sNKPePrz7RMHYtPaLgobxq?=
 =?iso-8859-1?Q?4UPyAez+0Fz9kAfSBB+8uRmi6s+J6J2zkiIon5t5kw2v3ghlJQAnbxzjvA?=
 =?iso-8859-1?Q?87EJZ/D7XDzKdWd0uYkknFY5wW6OevhAKsqqWPMMQ1+6/cHZ0b7xrcxkne?=
 =?iso-8859-1?Q?f7EdLM7GNqa/rc4QxsLEPs7vM/PX42kgnyGds9AL7twGgi00sDFSKe8I2E?=
 =?iso-8859-1?Q?kE6pE0d/wZJPNX2/0tLaQMMsD6dfxUtiKc++/XRgQUwehT3d5+Z6DYPl0r?=
 =?iso-8859-1?Q?++nhJF/ictyWBctsuw3Oci1QOQOjdy3dFQGOkZ0GRRFajBcEkidxBJVc+1?=
 =?iso-8859-1?Q?5ohOColz8uUnBgaKxVfD1aAB69+FD0RrKPubXrB/+1fwZrChrA/nMYSYDp?=
 =?iso-8859-1?Q?WiN+ISYpbV+4eyYnphba+gE7HFRcivWkMPgVWn9kl9yY8S71JnoEl3FnaJ?=
 =?iso-8859-1?Q?o5mTFBTdZpnljtpIM4iOE0fLhzSusy8HpW+i0b8IEHyopCtr81MRco+pMt?=
 =?iso-8859-1?Q?f/98O1OPXqB8IrJOsxNfyoy9fwousbcyMeTyVWFS7OcWUaRdx9JoUGUqMV?=
 =?iso-8859-1?Q?zMeDHcGrNfmLWqBKu461UchnxY4A1xE=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d4124b-da25-43e5-6790-08df01dd59e5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 12:43:51.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17M77nOHgHJQ3iV7tpcI8fT52tmYGu7nu/wL5dzidw+VnFo+mCtCYXnnCaPSW/g5r3cm25YZTBVBxJtZl+tsCh4TfjCSD9fGmOBHVu2v6HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7541
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 12:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244094

--fcksp2h3mlsf6z5m
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
MIME-Version: 1.0

Mathieu Dubois-Briand schrieb am Mo 24. Aug, 12:02 (+0200):
> On Mon Aug 24, 2026 at 11:53 AM CEST, J=F6rg Sommer wrote:
> > Mathieu Dubois-Briand schrieb am Mo 24. Aug, 08:30 (+0200):
> >> On Sat Aug 22, 2026 at 4:09 PM CEST, J=F6rg Sommer wrote:
> >> > Mathieu Dubois-Briand schrieb am Sa 22. Aug, 14:16 (+0200):
> >> >> On Sat Aug 22, 2026 at 9:56 AM CEST, J=F6rg Sommer wrote:
> >> >> > J=F6rg Sommer schrieb am Fr 24. Jul, 11:00 (+0200):
> >> >> >> From: Randolph Sapp <rs@ti.com>
> >> >> >>=20
> >> >> >> The split of bin and sbin became more artificial over time, and =
it is no
> >> >> >> longer clear why programmes goes into the one or the other direc=
tory; e.g.
> >> >> >> forever normal users have used sendmail in /usr/sbin, and fdisk =
and mkfs
> >> >> >> learned to operate on files to create images long ago.
> >> >> >
> >> >> > Gentle ping. What's the state of this?
> >> >> >
> >> >>=20
> >> >> Hi J=F6rg,
> >> >>=20
> >> >> Previous builds showed some errors. Should it have evolve since tha=
t?
> >> >
> >> > Yes, I think so. The bootchart2 errors were addressed by 2bf18f9908,=
 and the
> >> > tcf-agent by 443f8c62ad.
> >>=20
> >> Hi J=F6rg,
> >>=20
> >> It looks like this is still failing, at least with alt distro:
> >>=20
> >> ERROR: systemd-1_261.2-r0 do_package: QA Issue: systemd: Files/directo=
ries were installed but not shipped in any package:
> >>   /usr/sbin
> >>   /usr/sbin/poweroff
> >>   /usr/sbin/mount.ddi
> >>   /usr/sbin/init
> >>   /usr/sbin/resolvconf
> >>   /usr/sbin/mount.storage
> >>   /usr/sbin/halt
> >>   /usr/sbin/mount.mstack
> >>   /usr/sbin/reboot
> >>   /usr/sbin/shutdown
> >> Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within do_install.
> >> systemd: 10 installed and not shipped files. [installed-vs-shipped]
> >>=20
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4407
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4430
> >>=20
> >> Can you have a look at the issue?
> >
> > Thank you Mathieu for your testing. I built systemd 261.2 with poky-alt=
cfg
> > and had no errors. Can I find your branch mathieu/master-next somewhere?
> >
> >
> > Regards, J=F6rg
>=20
> You can find a tag in there:
>=20
> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-4555

This really helped to track down the issue. In your commit [1] this block is
missing:

```
--- meta/recipes-core/systemd/systemd_261.2.bb
+++ meta/recipes-core/systemd/systemd_261.2.bb
@@ -196,7 +196,6 @@ def build_epoch(d):
 PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
 PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
 PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
-PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
 PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
 PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
 PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
```

[1] https://git.yoctoproject.org/poky-ci-archive/commit/?h=3Doecore/autobui=
lder.yoctoproject.org/valkyrie/a-full-4555&id=3D9da89593957c05809e58e85f2d5=
21ab80ce7f807

I'll send a v3 based on 261.2

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--fcksp2h3mlsf6z5m
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgyNDEyNDM0OFowLwYJKoZIhvcNAQkE
MSIEIKy8pPk0yCZ5EmmRkkRV2IdBw1N2+0k87YXC1TY0PnakMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQCu3GmPEzF3T3ypMkeiMZzErlnYhIZKLLe0yN/Xx99UIOtpnJaLWmoYSYBSbSYvzd41faqJ
zBOqCdt4c/6JHGwSCsaMwvefJmNUVYIz+tefh1ozeIa78sWNyv/9Z470L7I6EOeXqLuWvIGN
aEYmyJD5eONYoIhOHCh+Durv4vyt2bOyk3gEOdmAhTJaVhP6m1Kch2qCBxpkCU6BU575Kljx
cIPpyvSvUFdndz75b6UtxjXhgWPdVLEjZNFDAsxm+NWLM0Yr+Kg/1tN2mNiv25mWC8BC7bE+
1xM9yrnvZyyLkD9FXsVZXW+gfwa8k+T5l43DErg5SrtKGHiAXVqfSf+o

--fcksp2h3mlsf6z5m--

