Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AE0EA3F26
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:45:43 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15855.1770713140789985472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=PFkUlll4;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.52, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxB7RhN/mRVb16e0CslftKc0upWHxNajsudRj1il1Dtabr0eY2Km1Oy9JuOjMruchXhIgkCLFaYu8MaWJLXcfC3DeceeWNo3fb+bywD0CDyMJInS8pDk6BcnB0if8ziNsQEEOhU2HrXO64sIIVHHXcOo2rNqJkukPsWhmjPrS6EkppwgBRLbK42KKBT8o3Ako4Z2h+GeOy5x7QchD/djWQbKiLndFUEl3+Zn4hJqK+y0zgl/hBwkH69pguLJ8SmqyEqHF6N9t4LqkG7tzDsd1CxAtqbx7y6I8oz4Fa8bKWieaFosiRha5oJunmS89NyjMZurev2r3L/i0mWcsSP8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TW86YBz6+YMDo0quvxTVK54RQB05MN/RlTJuQ53V5w=;
 b=A2VKV09cRkXAhALrCMggoETZgER2HY5Du8mKcKzgixgZaZHag4+wMNxzzRlf8T6oI47dJeEnzdl01X5uSDAU1jDfqSvE6zd/QHnHvYBQRFnKVSMWk6G6QqgremNTKT+jQEhEY2YyXNe0DICJX8M1vwYyk6T6oTbtEGHUopQlqIbygG/V05cu7gFo9pokGfzm0KiC8EZD1tvnIzsOEdv21iPD3qs5I0BYcGOVRi8506vRbJlFRisxF1WIq1kvXB+JKogXfi1qT8vtWftsb5GyUTDBaeTXFUX7Dty91COTLBnWiCNqtiJgIfMA6MV/nBAOvRn7G1Uac6o+sFCpoTB5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TW86YBz6+YMDo0quvxTVK54RQB05MN/RlTJuQ53V5w=;
 b=PFkUlll4i6VNC9YWAU9ogYXF4f0Y4phJoDolHRpDZ6CiHdnjYByMoJtQP5Tgxun835aO4DT1d7/ZeMqzDNmRa31fA2y9Vegfu1djZuXJ87sN+OQ/OP12zqi2XWeYU+QBgYVJRQkx4BVGHI6A9zntPyZSt5lh24Hb3lGEFghDZ8cOoHTB0LLB3kJY01UBjPD/YFt35V3FMfalT+zGj8pMqXoQIMsjzRUHR1HM7lENFzHuwyNpslnOuOqxUSQdIqWQRNa146E2mvqSgUpMiGa4G4lOXqLxbALB1Q8wLF1tm/BcAKzDA5SOyqZTG7nHsXfubIGtgta1wgjHaRTAA+772Q==
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 PN2P287MB0351.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8; Tue, 10 Feb 2026 08:45:32 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::884b:d8b9:54fa:499b]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::884b:d8b9:54fa:499b%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 08:45:32 +0000
From: AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Improving ext* sparse image generation: migrating
 from img2simg to ext4sparse for ext* filesystem
Thread-Topic: [OE-core] [RFC] Improving ext* sparse image generation:
 migrating from img2simg to ext4sparse for ext* filesystem
Thread-Index: AQHcmYsU+26pkl3IdkaEcLslsZT4wrV7npYAgAABEjY=
Date: Tue, 10 Feb 2026 08:45:32 +0000
Message-ID: 
 <PN0P287MB0358BE4E2A93C1AC63CD52B88962A@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
References: <Tn1R.1770617538678222907.ff9l@lists.openembedded.org>
 <9c9458ef6c32d63781cdfa8039caae30f63e1437.camel@linuxfoundation.org>
In-Reply-To: 
 <9c9458ef6c32d63781cdfa8039caae30f63e1437.camel@linuxfoundation.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB0358:EE_|PN2P287MB0351:EE_
x-ms-office365-filtering-correlation-id: d9e1bfd1-abaa-4c35-551f-08de6880c03d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|39142699007|31052699007|366016|1800799024|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?39UN93ehleV9hDQaYtJrSQDqwjJKFdlV6tEqNWhkeL/VoDyZLe10IYCnX1Cz?=
 =?us-ascii?Q?UC5kjgXcRwlwSCoJ3W59dfOhv67nmzS8c2uDtu0+ZR5dIHfKFeOj1AFQnslh?=
 =?us-ascii?Q?0+IkpfHBfiuJF5chTqLUmv8tigMP2FXu6/aOi5FeKVWji785noOp7pPMhbfm?=
 =?us-ascii?Q?q805mTV88KhNwRGxtQ3Anq+l4O7W74+vBW8r9dxDA6GWixZW6Xw/pVuACIWp?=
 =?us-ascii?Q?Iq0g1EqiotrqzDrIjkX5dcoodvde6oWbyaTgm2HZqjOwBgcpZrviptxc23bX?=
 =?us-ascii?Q?/c1ngnNSUvlcLSdOGCzWecvk3h3QX7L1KbE292x5MdcHmqbkkquLFHgBLbZI?=
 =?us-ascii?Q?i7aIlub1X670NEvWWGywVoXmqfCtYufJCD70eh43ZEswZT2kO3q08YCYC0FG?=
 =?us-ascii?Q?HFRgQV5bBRLHhYYhqy8Yrl7f+3vhw0tab13rX33tUJ6Jj+gJpjj4sHv2aglM?=
 =?us-ascii?Q?4fRxeWe/JuXRGekPJW+iw+ouy2SrHigH2MsgVliyEfkhfLaGa3TmrFdKfBlr?=
 =?us-ascii?Q?ikdCG4gnxrDoVyT4YsHeujFh1HazSutw9KrbOJWNCrMgG2VhTkuXJjrrA6A9?=
 =?us-ascii?Q?pCHJ0gxh03avo5hAemy20NzXuuMz81ThbMzA92Br8JLSrMmJo/wdh7HfjxzC?=
 =?us-ascii?Q?vLnvQ3bfNd+lxrh1mrLzY4gsUoFcAk6SjVdijMrTwdr0Nz8IdHNE7jx5ahht?=
 =?us-ascii?Q?ygi+y8X7C8PQNmYSQe61T3a359HC168bcT+Xit1tfCU5UPbXefsqSjW3sCAa?=
 =?us-ascii?Q?Vg5hqu9gYSR1CiYkCrgDaOwxne36GcnulmP1ExnTKw+YAAy+hNJJcaSOseqM?=
 =?us-ascii?Q?8my72OCT2u+YXtB/wwiLfth9RBIvkksGpN6MpXqxGZ124zNTEcJ820V55vBF?=
 =?us-ascii?Q?H/ELYKo5qZVoZoZPYEz2BM1K3ptaD0C+dG/fRLZhMP6O7jdt13ZvvWB4C+gm?=
 =?us-ascii?Q?ClAeSeq0nlCgnxeJNB/U7ihCe9t9/O0W68dl0N5zXrrDu6aO7J9j7IwlRxk0?=
 =?us-ascii?Q?+ifzMfKHCs1+zGmxr8GpN6mhyKuUSNS8xqjORBFQ6L4KH7p0eSdjZg4sRkh7?=
 =?us-ascii?Q?Efe2vUCcnu6BPjwdgnQbN7rFO9eqh1VUxgL3jWBxUkgo2q5bM2GOMpKQ2NKt?=
 =?us-ascii?Q?xws64zB+SMDIHAJylTHylfYdBDNBK1VjHyJ/rV3UKGTgO7m1wKCjNjUVu7to?=
 =?us-ascii?Q?A10Wix1Gen05mJCMy5e3iKvJ8nGAKL4jlHqgsuyDtViJ9DmIkgru2138+XNQ?=
 =?us-ascii?Q?3scjeoU3/nf+oXM7IBsvH7iFfP44qpcF0nOMx0s6ZVThBx0AIjZ2NHGj2qLO?=
 =?us-ascii?Q?x4wdS6Gd5auvb1JyHVgR4hj4mR5e//rhZLNr/9zVLLOtRiyZpjcUyNSv5gVv?=
 =?us-ascii?Q?UR9AOnGesX6VZ6s1RkyJ+fpGQwdUgcXUcpPTcBRokfw4loQbrVxXopvFRdBO?=
 =?us-ascii?Q?nH39yuLoY7n6/eUW+3T06xyHFAUcKuB4kpSzNaCceooqO5f0keNCBzA0CO4z?=
 =?us-ascii?Q?Oqmj4Qxc/Gj3Z1k7MFCfqYv3sEfO4MLPINuaer6d2YV5ZxNDxga70kWLxqiw?=
 =?us-ascii?Q?u2LZ3zksbA0iItzZTrcyi5nN5S+GgKgW3/T37kvpLC87aHbva1uDLjP51s7k?=
 =?us-ascii?Q?Vy6Y0qizEjzqLfEfCodTOxU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(39142699007)(31052699007)(366016)(1800799024)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jk7z2FeCkkNgQAWt5I8XTuSRsHvQyllgjYsne+h4w3P1qNnisIpvLliXP8Gq?=
 =?us-ascii?Q?z2NwR66AJko6UH9oSgmBV5uj+fAB4eQm0BGdlAhLHxOWRubNFZm+laRQBi7V?=
 =?us-ascii?Q?FYE604ZZWwBRgfoWFVaPyEe7EZEwi47ohYHlRu7K4sp8jY472BkZibLeA0hv?=
 =?us-ascii?Q?xvjPHTyCmu0N4kHAkKnj0GF1syku9r8yGqSXJuMZTmvImwrCjHc3Hs99KfRP?=
 =?us-ascii?Q?XqJBkFP0wC78jIO7xV7dXTKfYeRmMMnmqSp46uMfFRgayOPlI3RAwR6Vu/1N?=
 =?us-ascii?Q?Frcc6QF7y1YS11i28QlQeo153Tept6IPEgO1fWu717yNbHUT5KYlYBxpyc81?=
 =?us-ascii?Q?I7mVuRAc3QyuLGh4L+Kv02/JN4d0n6W/qh4QQIeiogQ4oRRZXgYcZyOAP3/q?=
 =?us-ascii?Q?p6wqfmT6Elstfetv19esMH6RpW2Ddkg8XQGN8a3XYal7+TyMgVHQYG5toc/R?=
 =?us-ascii?Q?2h7IQGx7CkJXmbunoZDznprphUiPPme6HMiu8x5dGa0zylwbS4oCnk+JBd05?=
 =?us-ascii?Q?SeYIsQq41Rgs2FUlwTjbv70W/lNGcSSl6IFauYNGwcmRjbpNmjr60nhFc/9y?=
 =?us-ascii?Q?QB2Rho761YDBg1QCBy0NJ5dK2kM7Q4I/+fbAnekamXnXWuaoa0LRlbE9Ng9H?=
 =?us-ascii?Q?NlyWWbi3S9dFGWpdw+F4gt9juVUmeJzyufZ0e2V4/FunpcuJ+7gZwfDa572J?=
 =?us-ascii?Q?nlZ+h9twgOD7/c/wXDWu54f8ZImy+85zLnCIneihq95NdZNe4+tSJIZfnaB1?=
 =?us-ascii?Q?ZqMO9GhM+zKamZJ+H6CqregF5cKZyTtiVgpQ6iU+Q6VuvXXgVcxnAmXhRo2L?=
 =?us-ascii?Q?sULKq9oc7UG1YhGZP7VH1+T5CkiJDRT+oQ7lWXt3qPTpKyGkWoGJAsty039s?=
 =?us-ascii?Q?4JWyk7xFwN4fjUqnyKFcPtqE19f7+qX53/R2GUJ7Ti/6WjXfRpfe2CkHFxLA?=
 =?us-ascii?Q?C2H3582EvzQ5I7Kxy52HIDGFqT600vxQRntbR32lC2zBebG85M5HiP+py6O/?=
 =?us-ascii?Q?jwRe9iL3KFCYJY0kpyjrJoApZ3Z/iKCi1sHA4BrETZ49xfFUEUPKP+2Wdkvl?=
 =?us-ascii?Q?uoNKXVz3ctxegDJ1ujpofTAe2m//h7q1wiS75cXj6YN5KXhQ6MGGbVms2ctM?=
 =?us-ascii?Q?FhNRos3OrG73Uwdq29EQTfORynaGqDj6+loJ9hf4DmLcNnDNoMbzXjdUApxv?=
 =?us-ascii?Q?MF5nTlOxN+g+pcnBXvpg2x9BAw98BCOM/9NeermPMNXzRn7lvnvdVoGQJq2v?=
 =?us-ascii?Q?WWB89mYb+8dy6JBkJFDsTQO6qukTLDx4twRdweA01XeumcKNOP0TELx9lgrL?=
 =?us-ascii?Q?KBaRr3Kjaikux3Aa2/JRXzBhvBgljUkoJpYEBgMo8AyjJUEzUgfGFR+nGAi+?=
 =?us-ascii?Q?6rMBMzgWwuX0uM9Zn5tUTmx8PapQqNWd5HaeeP84PAPH3U6j8dT7pgxquScs?=
 =?us-ascii?Q?rciM8tRTYzv0hqMX5cvj2JWVXOGgi8G5VcncsJw5e0bRxgnFaZkP4hqOA32H?=
 =?us-ascii?Q?C8hxQ2KK9lRvcVZfuz2ReY+H5vJGmEtZccynhuri1r9kDuj6UQd+O98ylXx/?=
 =?us-ascii?Q?T1psOOUERrixCEfFP5YNSI9Uz9qur3/8OPaJSqY+mA+YFUIUt73KX13n9Kc6?=
 =?us-ascii?Q?LQff6rvThMiLuFYXPmsaGwI8ubPGJN0AA7ohkRDncaJQMF0IgezpvUIPCGzZ?=
 =?us-ascii?Q?qVW+5Wg7TOJ05BDDbh7Hsd10od1x6I+npLG9nd7+fPiJ7UYZQz7NoFHz89EA?=
 =?us-ascii?Q?0WvswrV2YgY2Xll53Ff1hr7UT1m2WSk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN0P287MB0358BE4E2A93C1AC63CD52B88962APN0P287MB0358INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e1bfd1-abaa-4c35-551f-08de6880c03d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 08:45:32.2928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtwRyDPcyXJVbo26Gzj+YtiFC5Z42i13BFI9RlYJDb1G5szHcxsyy+Dh8FYBLOO0dDrQSz35uT1exIxOYuhiKJkERpipDdy04t8XmiOzvUpLhs/BaFDeGicpFwENN6ox
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230865

--_000_PN0P287MB0358BE4E2A93C1AC63CD52B88962APN0P287MB0358INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Richard
Will rework on this approach
W.r.t e2fsprogs-ext4sparse , would approach to be singularly in meta-oe

Please feel free to share comments / feedback .
I will try to incorporate them

- Ashish

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: 10 February 2026 14:09
To: AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>; openembedded-c=
ore@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Improving ext* sparse image generation: migrat=
ing from img2simg to ext4sparse for ext* filesystem

You don't often get email from richard.purdie@linuxfoundation.org. Learn wh=
y this is important<https://aka.ms/LearnAboutSenderIdentification>
Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".
Hi,

On Sun, 2026-02-08 at 22:12 -0800, AshishKumar Mishra via lists.openembedde=
d.org wrote:
Hello Community Members  ,

I would like to propose a change to how we handle sparse image generation f=
or ext* file-systems in OpenEmbedded,
specifically moving away from the generic img2simg tool toward the speciali=
sed ext2simg in the e2fsprogs [contrib/android]

Firstly, you should probably mention that image_types_sparse is in meta-oe,=
 not oe-core. You should therefore probably mention this on the list where =
meta-oe is maintained too.

1) Problem
Currently, image_types_sparse.bbclass uses img2simg for all file-system typ=
es.
img2simg is a  tool that reads the raw image to find zero-filled blocks.
For ext* file-systems, this is inefficient compared to  ext2simg from e2fsp=
rogs [contrib/android]
which understands the file-system structure and uses the block bitmap to de=
termine sparse areas.

That seems reasonable.

2) History
Previously, 'ext2simg' was bundled within android-tools (v5.1 and older).
The utility has since migrated to the e2fsprogs project (contrib/android).
However, upstream e2fsprogs does not provide a build system for this tool,
and it requires libsparse from android-tools to compile.


3) Proposed Changes
To implement this, I am looking at a cross-layer approach:

a. meta-oe (android-tools):
Export libsparse, libbase, and liblog headers and libraries to the sysroot.=
 Currently, these are often internal to the build.
Reorganise header installation to ${includedir}/sparse to match the expecte=
d include paths for e2fsprogs contrib tools.

b. oe-core (e2fsprogs):
Add a conditional compilation step in e2fsprogs-native to build the ext4spa=
rse utility located in contrib/android/.
This would link against the exported libsparse from android-tools-native.

c. meta-oe (image_types_sparse.bbclass):
Update CONVERSION_CMD:sparse to detect ext* types.
Use  ext2simg from the e2fsprogs [contrib/android] for these types while fa=
lling back to img2simg for others (like f2fs).


4) Points for Discussion / Feasibility
     I am seeking feedback on the following:

a. Layer Dependency:
This introduces a tighter coupling between oe-core and meta-oe.
Is it acceptable for e2fsprogs-native (core) to optionally depend on androi=
d-tools-native (meta-oe),
or i can create an bbapend file in meta-oe called e2fsprogs_%.bbappend.

oe-core cannot depend on meta-oe.

The bbappend is one approach but it means e2fsprogs would rebuild whenever =
a layer is added/removed and it would likely fail the yocto-check-layer tes=
ts. It would also mean anything depending on e2fsprogs would also rebuild a=
nd sstate would not be reused. None of this is particularly good.

Instead, how about a separate recipe, e2fsprogs-ext4sparse which just build=
s this utility?

Cheers,

Richard


--_000_PN0P287MB0358BE4E2A93C1AC63CD52B88962APN0P287MB0358INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks Richard&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Will rework on this approach</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
W.r.t e2fsprogs-ext4sparse , would approach to be singularly in meta-oe&nbs=
p;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Please feel free to share comments / feedback .</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will try to incorporate them&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
- Ashish&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> 10 February 2026 14:09<br>
<b>To:</b> AshishKumar Mishra &lt;AshishKumar.Mishra@bmwtechworks.in&gt;; o=
penembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openemb=
edded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [RFC] Improving ext* sparse image generation:=
 migrating from img2simg to ext4sparse for ext* filesystem</font>
<div>&nbsp;</div>
</div>
<style>
<!--
pre, code, address
	{margin:0px}
h1, h2, h3, h4, h5, h6
	{margin-top:0.2em;
	margin-bottom:0.2em}
ol, ul
	{margin-top:0em;
	margin-bottom:0em}
blockquote
	{margin-top:0em;
	margin-bottom:0em}
-->
</style>
<div>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" alig=
n=3D"left" style=3D"background:revert!important; border:revert!important; b=
ottom:revert!important; color:revert!important; direction:revert!important;=
 display:revert!important; font-size:revert!important; height:revert!import=
ant; letter-spacing:revert!important; line-height:revert!important; margin:=
revert!important; opacity:revert!important; order:revert!important; outline=
:revert!important; overflow:revert!important; padding:revert!important; pos=
ition:revert!important; tab-size:revert!important; table-layout:revert!impo=
rtant; text-align:revert!important; text-indent:revert!important; text-orie=
ntation:revert!important; text-overflow:revert!important; text-transform:re=
vert!important; top:revert!important; vertical-align:revert!important; visi=
bility:revert!important; white-space:revert!important; width:revert!importa=
nt; word-break:revert!important; word-spacing:revert!important; writing-mod=
e:revert!important; zoom:revert!important; border:0!important; display:tabl=
e!important; width:100%!important; table-layout:fixed!important; border-col=
lapse:seperate!important; float:none!important; border-spacing:0px 0px!impo=
rtant">
<tbody style=3D"background:revert!important; border:revert!important; botto=
m:revert!important; color:revert!important; direction:revert!important; dis=
play:revert!important; font-size:revert!important; height:revert!important;=
 letter-spacing:revert!important; line-height:revert!important; margin:reve=
rt!important; opacity:revert!important; order:revert!important; outline:rev=
ert!important; overflow:revert!important; padding:revert!important; positio=
n:revert!important; tab-size:revert!important; table-layout:revert!importan=
t; text-align:revert!important; text-indent:revert!important; text-orientat=
ion:revert!important; text-overflow:revert!important; text-transform:revert=
!important; top:revert!important; vertical-align:revert!important; visibili=
ty:revert!important; white-space:revert!important; width:revert!important; =
word-break:revert!important; word-spacing:revert!important; writing-mode:re=
vert!important; zoom:revert!important; display:block!important">
<tr style=3D"background:revert!important; border:revert!important; bottom:r=
evert!important; color:revert!important; direction:revert!important; displa=
y:revert!important; font-size:revert!important; height:revert!important; le=
tter-spacing:revert!important; line-height:revert!important; margin:revert!=
important; opacity:revert!important; order:revert!important; outline:revert=
!important; overflow:revert!important; padding:revert!important; position:r=
evert!important; tab-size:revert!important; table-layout:revert!important; =
text-align:revert!important; text-indent:revert!important; text-orientation=
:revert!important; text-overflow:revert!important; text-transform:revert!im=
portant; top:revert!important; vertical-align:revert!important; visibility:=
revert!important; white-space:revert!important; width:revert!important; wor=
d-break:revert!important; word-spacing:revert!important; writing-mode:rever=
t!important; zoom:revert!important">
<td valign=3D"middle" width=3D"1px" bgcolor=3D"#A6A6A6" cellpadding=3D"7px =
2px 7px 2px" style=3D"background:revert!important; border:revert!important;=
 bottom:revert!important; color:revert!important; direction:revert!importan=
t; display:revert!important; font-size:revert!important; height:revert!impo=
rtant; letter-spacing:revert!important; line-height:revert!important; margi=
n:revert!important; opacity:revert!important; order:revert!important; outli=
ne:revert!important; overflow:revert!important; padding:revert!important; p=
osition:revert!important; tab-size:revert!important; table-layout:revert!im=
portant; text-align:revert!important; text-indent:revert!important; text-or=
ientation:revert!important; text-overflow:revert!important; text-transform:=
revert!important; top:revert!important; vertical-align:revert!important; vi=
sibility:revert!important; white-space:revert!important; width:revert!impor=
tant; word-break:revert!important; word-spacing:revert!important; writing-m=
ode:revert!important; zoom:revert!important; padding:7px 2px 7px 2px!import=
ant; background-color:#A6A6A6!important; width:0px!important">
</td>
<td valign=3D"middle" width=3D"100%" bgcolor=3D"#EAEAEA" cellpadding=3D"7px=
 5px 7px 15px" color=3D"#212121" style=3D"background:revert!important; bord=
er:revert!important; bottom:revert!important; color:revert!important; direc=
tion:revert!important; display:revert!important; font-size:revert!important=
; height:revert!important; letter-spacing:revert!important; line-height:rev=
ert!important; margin:revert!important; opacity:revert!important; order:rev=
ert!important; outline:revert!important; overflow:revert!important; padding=
:revert!important; position:revert!important; tab-size:revert!important; ta=
ble-layout:revert!important; text-align:revert!important; text-indent:rever=
t!important; text-orientation:revert!important; text-overflow:revert!import=
ant; text-transform:revert!important; top:revert!important; vertical-align:=
revert!important; visibility:revert!important; white-space:revert!important=
; width:revert!important; word-break:revert!important; word-spacing:revert!=
important; writing-mode:revert!important; zoom:revert!important; width:100%=
!important; background-color:#EAEAEA!important; padding:7px 5px 7px 15px!im=
portant; font-family:wf_segoe-ui_normal,Segoe UI,Segoe WP,Tahoma,Arial,sans=
-serif!important; font-size:12px!important; font-weight:normal!important; c=
olor:#212121!important; text-align:left!important; word-wrap:break-word!imp=
ortant">
<div style=3D"background:revert!important; border:revert!important; bottom:=
revert!important; color:revert!important; direction:revert!important; displ=
ay:revert!important; font-size:revert!important; height:revert!important; l=
etter-spacing:revert!important; line-height:revert!important; margin:revert=
!important; opacity:revert!important; order:revert!important; outline:rever=
t!important; overflow:revert!important; padding:revert!important; position:=
revert!important; tab-size:revert!important; table-layout:revert!important;=
 text-align:revert!important; text-indent:revert!important; text-orientatio=
n:revert!important; text-overflow:revert!important; text-transform:revert!i=
mportant; top:revert!important; vertical-align:revert!important; visibility=
:revert!important; white-space:revert!important; width:revert!important; wo=
rd-break:revert!important; word-spacing:revert!important; writing-mode:reve=
rt!important; zoom:revert!important">
You don't often get email from richard.purdie@linuxfoundation.org. <a href=
=3D"https://aka.ms/LearnAboutSenderIdentification" style=3D"background:reve=
rt!important; color:revert!important; direction:revert!important; display:r=
evert!important; font-size:revert!important; opacity:revert!important; visi=
bility:revert!important">
Learn why this is important</a> </div>
</td>
<td valign=3D"middle" align=3D"left" width=3D"75px" bgcolor=3D"#EAEAEA" cel=
lpadding=3D"7px 5px 7px 5px" color=3D"#212121" style=3D"background:revert!i=
mportant; border:revert!important; bottom:revert!important; color:revert!im=
portant; direction:revert!important; display:revert!important; font-size:re=
vert!important; height:revert!important; letter-spacing:revert!important; l=
ine-height:revert!important; margin:revert!important; opacity:revert!import=
ant; order:revert!important; outline:revert!important; overflow:revert!impo=
rtant; padding:revert!important; position:revert!important; tab-size:revert=
!important; table-layout:revert!important; text-align:revert!important; tex=
t-indent:revert!important; text-orientation:revert!important; text-overflow=
:revert!important; text-transform:revert!important; top:revert!important; v=
ertical-align:revert!important; visibility:revert!important; white-space:re=
vert!important; width:revert!important; word-break:revert!important; word-s=
pacing:revert!important; writing-mode:revert!important; zoom:revert!importa=
nt; width:75px!important; background-color:#EAEAEA!important; padding:7px 5=
px 7px 5px!important; font-family:wf_segoe-ui_normal,Segoe UI,Segoe WP,Taho=
ma,Arial,sans-serif!important; font-size:12px!important; font-weight:normal=
!important; color:#212121!important; text-align:left!important; word-wrap:b=
reak-word!important">
</td>
</tr>
</tbody>
</table>
<div><span style=3D"color:red"><i>Caution: &quot;External email, be cautiou=
s especially with link(s), attachment(s) or QR code(s)&quot;.</i></span>
<div>
<div>Hi,</div>
<div><br>
</div>
<div>On Sun, 2026-02-08 at 22:12 -0800, AshishKumar Mishra via lists.openem=
bedded.org wrote:</div>
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<div>Hello Community Members&nbsp; ,&nbsp;</div>
<div>&nbsp;</div>
<div>I would like to propose a change to how we handle sparse image generat=
ion for ext* file-systems in OpenEmbedded,&nbsp;</div>
<div>specifically moving away from the generic img2simg tool toward the spe=
cialised ext2simg in the e2fsprogs [contrib/android]</div>
</blockquote>
<div><br>
</div>
<div>Firstly, you should probably mention that image_types_sparse is in met=
a-oe, not oe-core. You should therefore probably mention this on the list w=
here meta-oe is maintained too.</div>
<div><br>
</div>
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<div><strong>1) Problem</strong></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Currently, image_types_sparse.bbclass uses img2simg for all file-system=
 types.&nbsp;</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>img2simg is a&nbsp; tool that reads the raw image to find zero-filled b=
locks.&nbsp;</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>For ext* file-systems, this is inefficient compared to&nbsp; ext2simg f=
rom e2fsprogs [contrib/android]</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>which understands the file-system structure and uses the block bitmap t=
o determine sparse areas.</span></div>
</blockquote>
<div><br>
</div>
<div>That seems reasonable.</div>
<div><br>
</div>
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid; padding-left:1ex">
<div><strong>2) History</strong></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Previously, 'ext2simg' was bundled within android-tools (v5.1 and older=
).</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>The utility has since migrated to the e2fsprogs project (contrib/androi=
d).</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>However, upstream e2fsprogs does not provide a build system for this to=
ol,</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>and it requires libsparse from android-tools to compile.</span></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>3) Proposed Changes</strong></div>
<div>To implement this, I am looking at a cross-layer approach:</div>
<div>&nbsp;</div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>a. meta-oe (android-tools):</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Export libsparse, libbase, and liblog headers and libraries to the sysr=
oot. Currently, these are often internal to the build.</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Reorganise header installation to ${includedir}/sparse to match the exp=
ected include paths for e2fsprogs contrib tools.</span></div>
<div>&nbsp;</div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>b. oe-core (e2fsprogs):</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Add a conditional compilation step in e2fsprogs-native to build the ext=
4sparse utility located in contrib/android/.</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>This would link against the exported libsparse from android-tools-nativ=
e.</span></div>
<div>&nbsp;</div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>c. meta-oe (image_types_sparse.bbclass):</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Update CONVERSION_CMD:sparse to detect ext* types.</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Use&nbsp; ext2simg from the e2fsprogs [contrib/android] for these types=
 while falling back to img2simg for others (like f2fs).</span></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>4) Points for Discussion / Feasibility</strong></div>
<div>&nbsp; &nbsp; &nbsp;I am seeking feedback on the following:</div>
<div>&nbsp;</div>
<div><strong><span style=3D"white-space:normal"><span style=3D"white-space:=
pre"></span>a. Layer Dependency:&nbsp;</span></strong></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>This introduces a tighter coupling between oe-core and meta-oe.&nbsp;</=
span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>Is it acceptable for e2fsprogs-native (core) to optionally depend on an=
droid-tools-native (meta-oe),&nbsp;</span></div>
<div><span style=3D"white-space:normal"><span style=3D"white-space:pre"></s=
pan>or i can create an bbapend file in meta-oe called e2fsprogs_%.bbappend.=
&nbsp;</span></div>
</blockquote>
<div><br>
</div>
<div>oe-core cannot depend on meta-oe.</div>
<div><br>
</div>
<div>The bbappend is one approach but it means e2fsprogs would rebuild when=
ever a layer is added/removed and it would likely fail the yocto-check-laye=
r tests. It would also mean anything depending on e2fsprogs would also rebu=
ild and sstate would not be reused.
 None of this is particularly good.</div>
<div><br>
</div>
<div>Instead, how about a separate recipe, e2fsprogs-ext4sparse which just =
builds this utility?</div>
<div><br>
</div>
<div>Cheers,</div>
<div><br>
</div>
<div>Richard</div>
<div><br>
</div>
<div><span></span></div>
</div>
</div>
</div>
</body>
</html>

--_000_PN0P287MB0358BE4E2A93C1AC63CD52B88962APN0P287MB0358INDP_--

