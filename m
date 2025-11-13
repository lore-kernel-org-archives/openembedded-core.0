Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065BDCD98D2
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 19:12:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.781.1763061163213554976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 11:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zdGZ0tkl;
 spf=pass (domain: siemens.com, ip: 52.101.83.2, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrVWROKa9U1Ub25tI5mDSRGH4tLBJnavffe3cAecrnEQ1SaIyMNtnplp+deErtYOLl/He0aJ5BdIdHnQtX0R/yvGoHGFpGy85iMYrC46dHREJK3JvYkxpSt7O037SPGIzOcBGcTAjcdfF3ju92F2eBXUH2Pd/1kFKpTnaVjtJg2j13Jh7nAl32F0UuWO/a3/KngqVMhbkpaJUAwZyXBpbz+cqs51y4jAoRv7F7ys9u1yChki7za1wYSI1RqS97TY+q+0heb2nqpO6GUmQIqigckYrOnd0EL8Xk4UgcTtCib3aJWdcdxL0ZT3ITLWOv1iNjLC+FVqsF+wetGdHSQzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvw5le2ybUpG6BBHvccqiy7H7fW52voRzgpxHXmwXiE=;
 b=HRIG+s2w93Ud1VG8LdQIF/KZ3H4VdXagXvjvVgv2rL+CXLGANGIbUvJM9KA2jZ0gwlNeTGuG2FDFJ8ziCz2kGqhZ4Jbi3BMbtrBre2F7atxmP7LyWrcO0jkodrYpdxM8fshWdpBrab72GV6V8Gb5ns/CHVimPh2M0qVWAH4/EoGSq1j8bbEvjdlfdIRqv9EhwP12L+FQL7UJGygPXpcEiailRdsOtkhCGJIyFmzNkYh8d68q9Pm67cP+y72NQ/rLbvLfXjNEcex+08C6Psjx0WSzxvmvpFOsgk3RwZuJ/KdWduW8Sx9UkQwd4e4l6sTo4uZTXeIryYHiPzHK3WSaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dvw5le2ybUpG6BBHvccqiy7H7fW52voRzgpxHXmwXiE=;
 b=zdGZ0tkl2OgxDqfDqJH46bOSBy5CYSJuUPTZuMWuZ0hyVGfkGGMB/tqvxESInyrNQvzDVXxEyqtIwAPG0b0lmZNTnCDkfGb5ywTYJRkF1kur7iaoSv9U4opocuXEhHqAxUFyeM1YY/AY2RCvI+xeA/Op2ikMXTWqzfef1BRvzJkRv7xdI6i2SirhiW2hDZTtJHr9B6lI0/97xsbVL3sMeoNCVlnu4/ytDAkw3GwulLeMgqr2OxCWZE731F1sNT8vlLqolAURSCUA0adPPIbrPbcdzdhe/JK7o+fJGm6O0QcKzhfFb3GAPD4i6Y5E34R1+7vOjUhjdaK/creHmHbI/g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6423.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:12:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 19:12:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "corentin.guillevic@smile.fr" <corentin.guillevic@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] insane.bbclass: check revision for every
 git URI
Thread-Topic: [OE-core] [PATCH 1/2] insane.bbclass: check revision for every
 git URI
Thread-Index: AQHcVMkOCpd/mr+RQEyW8hDxiQO+c7Tw+K1A
Date: Thu, 13 Nov 2025 19:12:36 +0000
Message-ID: 
 <AS1PR10MB56973F0FC2B2CB68AF3C6240FDCDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251113181157.410053-1-corentin.guillevic@smile.fr>
In-Reply-To: <20251113181157.410053-1-corentin.guillevic@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=724e8f89-7312-47e5-9e3f-176fd4ae1e20;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-13T19:10:07Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6423:EE_
x-ms-office365-filtering-correlation-id: ad4776f9-9a59-4b73-9fc6-08de22e89b72
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+1KY5TmC4rkT/NgZLF90399hX6gz1Zw0ClOFXXLHz5oSJgJdW+xvr/W9vYRk?=
 =?us-ascii?Q?NmA4hLSuCH0iP8IzAmq0lWvNjNKlQi34dxt0KEKf1I1d91s7ZmxBYD0Sv4Ab?=
 =?us-ascii?Q?FzOFknPzN4ClcOt7qQPWn2jvjfvD/FmjfzB4sTfGsbOaT6wq2Q2onTJ0+fo0?=
 =?us-ascii?Q?aDc+bfj90119NsYucPXE8iqfU7v22UlKIby8uL2zitsRDRdBE7tGuNu/8qqG?=
 =?us-ascii?Q?zAWSOwDZ04kRO1G1giuwqvkS/dy6quK3Zg/u22QILNwcuoqT+bqnX0nQw+4G?=
 =?us-ascii?Q?wNqJ+VdMQpo7CWnoJwvG5tQIvAbxPyRETJ24yUtkWhVcbVZ2KBm0+X81fvrr?=
 =?us-ascii?Q?FyGJQrcIy6PkHGNGH1qE7jblQLlLDeoLbTNOM0BYvHkbjq2VWV9UArVAIVs8?=
 =?us-ascii?Q?7wnI8oSgj1xFmKSWz6czG3JL0FKtvd1U9TerCuIveuVbtbEiLe1TF2VTnhcz?=
 =?us-ascii?Q?fA5gZ5MisYWndTacHrDD72/PAoBBkDGE3WbyGqR/U4NUefqffR3oLpCODdPK?=
 =?us-ascii?Q?2iZ6FvqfcUZKnAZr5gXvdZycqWwydIqDIV/iWp4yYXtlXCPKmtMEdS4b+52/?=
 =?us-ascii?Q?Ao+npLCP6eq5ysX6TMRYV0lUuyyn7TRZsZucwmby/deYc6XOO0sbMhnQolDX?=
 =?us-ascii?Q?6qxcjlJ8YVduzjuaVLzdYn4E/6VD29lPZ28VVz+9uGaXVOhqPkcDCKmFCJTW?=
 =?us-ascii?Q?kppg8rYsIMGUmBI/oquzd4o1KUafq5e5NT1SLHiZfbszDsBtrkUChM4n2Hp1?=
 =?us-ascii?Q?nsdIgbQTCJzWqFHA+KDV8WJ1qKtpKIE+PXjF+SaUY69hRS0SifNv2iLYeRcS?=
 =?us-ascii?Q?DPyPQJkB8L+pTfQ2RCIUORZy9Pt8OthPxx50SM5W81OrHClIKy1ZWF2TEnMG?=
 =?us-ascii?Q?gylqoIunSgC5WxW/s1SFLneuRf0HTmJdl7xi26LHRCYapjBIGoIYcqxg74dI?=
 =?us-ascii?Q?LUHI9ccmMbWA9W8RnZdx+xCI9dKntF6k3FvlaoyDdkYUsXMJ9xJLaEwzI1VD?=
 =?us-ascii?Q?4cqvrUDa/wNHkvlah2GkbOVZwSUwVmq/doIb39U8r123uUHM2pD/UP4nK6Nk?=
 =?us-ascii?Q?JDK7KeB8gZvrVzEZttqP5kUWriNTbwnyH6jTTItE/oz8o/QYcjSA6quneNMe?=
 =?us-ascii?Q?pJv/UBruIDAVxUoqLM+t4zLVmJNSHg21ejQ7/PCYsh7f+KgNlalpL4wcn1oN?=
 =?us-ascii?Q?QxlQ6wc6oWOIPi++Zw8MHRWDcw6VVQl2zoLsD17u7XX8MM6ORtYeqLTwl0by?=
 =?us-ascii?Q?rv+G+ilE0VDwe5wxPQ3Iqiz48Vsc5DZKPlXd2TS0DaQF8qe3IcMDVSI8oMV3?=
 =?us-ascii?Q?qpfZc3ve2YKMQwji7DkkM/thMcpPREs9PW1PyeBfm5MPSAtm5if5ZOqlyo1S?=
 =?us-ascii?Q?2p9759h/EtdL+OPSuhmeZ0fclyCX864+bg+cvTwgnEXvHFpjUOb6FwO3ul5O?=
 =?us-ascii?Q?ywbor8ybcZLpOhWZ0a8VJHQ42dDxWCVwGsBYHbMP5X4CSt4Mqym56Rv1la6Y?=
 =?us-ascii?Q?3ABoY/u5dKpvFcLAmo+/UAiyHvlvKRLYS/j3?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lDAuI21tR0iXB2d9IK1a9q/7IPtmOW9ZsDD74/27UxxHA8FmdrHLSrkUDXWW?=
 =?us-ascii?Q?wSpyjL/ht0ChpaULSQCXy5E6nWbUcj/XKJu95EUancS30pKfaTimPxRgaH6k?=
 =?us-ascii?Q?2gVzcQ17alPJKcZp4+r7WndAqgmv04DgSLzoa/ziPJ/wGWDri0rg0yOx0fR3?=
 =?us-ascii?Q?Hx7mu+QmJTnL2f4XD0DyNj2R/rSCIIh7jya30k3cYfOKx8enM7IkFLoZIedQ?=
 =?us-ascii?Q?OhQdA2aS89ZCbIZ9kTf7+EbGk/arFFoIJ2OY8wri6AGkZ5IyuR/+N3y5quHg?=
 =?us-ascii?Q?UgqZIT83Y2F93ogV1rhcVAUeCH3zQ7K1dgN7722sfJd4dDaPkybmFMh7njMY?=
 =?us-ascii?Q?Il8Fk3lVSZDnX+YyWpYP/NUVGJo3G7hRA65rwnoMekrf8QrlpfCoXyQUHzeU?=
 =?us-ascii?Q?UPDLjd9eEn4bRm1QD89RBeQSaWOswq37dFGUceLh4S63DDfPym6zO3pX23J7?=
 =?us-ascii?Q?rIgLFu8YeNGnROboqT5EBhDTU6o3DqTi9X0UAyqGq6tQ1Oua4IeyrUiw9yLw?=
 =?us-ascii?Q?dzAC9RB6RCsupdf6s9QyKFBtHE4XOfiEkea1MLrIpmYTvxRIIvb2p4rbK/9t?=
 =?us-ascii?Q?q/2IotREQdfY7SiPACpCmzHRjuE5/+XoxHc/96Isfx053+tvAARxaTAY9EZk?=
 =?us-ascii?Q?f+q9bUqIDQEEh1wSGpxoyxAiFonfNTrj9P6+jkrW4AQTC1i6RtTsNhmeKofH?=
 =?us-ascii?Q?MygvTWWKDaV6IT6OgAiqiUhUU/XA8uvpVY73LE+G2hf6uVlV6eMidWRVn35z?=
 =?us-ascii?Q?DQvQD/Zm1d6rihJYq+AbmsWHcRe63TP8MdYnquyOV5PWKuKAb0K8Slf56ZBh?=
 =?us-ascii?Q?h7rmymwLT9HDYXuruVuIHjm6r+6Dh9qPYXtGvtx1KbKyxn3n3OHmnWlCbhaE?=
 =?us-ascii?Q?GZ5qNgJYObNt2rr7AfjgjDbnpGU8pyQPy3h9+zkpVsa45lqHFhL1GzSaBa9F?=
 =?us-ascii?Q?0Y5LsgvXke7LkpQX5QczN5ADHrUguyzOcFF5OcXTQJ94mJD96maEPcelErsT?=
 =?us-ascii?Q?ot8WWiqPRtZv4tfpF650lsvT4xlBYsQNALSKKoRU7u2DPPA/z7jyatFhMj9/?=
 =?us-ascii?Q?Z3JTGXrIGoxVOl0BKiMvCx2docLcATORrbxqIguZZ9T2l8Rt9zjMKm3pkBGB?=
 =?us-ascii?Q?4Y0qFIhWixnYK3FowfzHbYbAf6WfILnP48t5KKo7gbDao58jiQr7/4j/wtUk?=
 =?us-ascii?Q?sz2CVdCFjRAfDjVfWUolm+rwvRlNrc4oonH+gxGnIPcHIiei7GE0Dv0Kgbmv?=
 =?us-ascii?Q?inBxYZ/nIUxaNT0I0Q7Lk5OMQcbCpu/83UJzbFNfEcTsyTC5YvXMcW29GbpQ?=
 =?us-ascii?Q?fSq3p+vXgITX0X2Jc3qCB6wIOXgkoan3vnHfDep9i6LkkcQ73EIGbLXYfVoG?=
 =?us-ascii?Q?qrTRnfwXZMGI1L9UK63rE2cFnvF2rrRi9z7jmVVdC1OILM9pVBh2//hWWTO/?=
 =?us-ascii?Q?31pWJpEQjnqZPG/xT4ICmx8d6gTE4phIKfhtZTlkRNg+uSjJ4lGJs5kbAqFJ?=
 =?us-ascii?Q?X2jt8qmpViQBDijEyTYYU0sxLmX43tLKScg/HRA1lWUnuqfO4TmPPibcWkuK?=
 =?us-ascii?Q?Z+kEthgkYyM1tnmlzpMN9SwwfaTphwZnefkSd43M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4776f9-9a59-4b73-9fc6-08de22e89b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 19:12:36.8894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Me+0932iVCIX4lR7VetbfPT8gTa4gtpEPDifsRDafE33z2wIYGPqSMSTCL/59ND5mk3mB5BviDjPH0TRyFxViA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 19:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226262

It is still possible to specify revision by adding ";rev=3D<hash>" to SRC_U=
RI.
We should not error-out on valid configurations.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Corentin Guillevic via
> lists.openembedded.org
> Sent: Thursday, November 13, 2025 19:12
> To: openembedded-core@lists.openembedded.org
> Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
> Subject: [OE-core] [PATCH 1/2] insane.bbclass: check revision for every g=
it URI
>=20
> Every git URI into SRC_URI variable should have a revision. However, if
> the revision is missing (SRCREV), BitBake will perform a query on the
> remote repository every time it parses a recipe.
>=20
> This check will raise an error if a git URI is not provided alongside a r=
evision.
>=20
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---
>  meta/classes-global/insane.bbclass | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-
> global/insane.bbclass
> index fed8163c3e..f6e9ed6347 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1495,7 +1495,26 @@ python do_recipe_qa() {
>                  error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, =
"
> ".join(sorted(invalid_pkgconfigs)))
>                  oe.qa.handle_error("invalid-packageconfig", error_msg, d=
)
>=20
> +    def test_git_missing_srcrev(pn, d):
> +        for uri in d.getVar('SRC_URI').split():
> +            if not uri.startswith('git://'):
> +                continue
> +
> +            # Get parameters for the current URI
> +            params =3D bb.fetch2.decodeurl(uri)[5]
> +            name =3D params.get('name', '')
> +
> +            # git URI has a "name" parameter
> +            if name:
> +                rev =3D d.getVar('SRCREV_' + name)
> +                if not rev:
> +                    oe.qa.handle_error("missing-srcrev", "%s: no revisio=
n (%s) defined
> for URI %s" % (pn, 'SRCREV_' + name, uri), d)
> +            else:
> +                if d.getVar('SRCREV') =3D=3D "INVALID":
> +                    oe.qa.handle_error("missing-srcrev", "%s: no revisio=
n (SRCREV)
> defined for URI %s" % (pn, uri), d)
> +
>      pn =3D d.getVar('PN')
> +    test_git_missing_srcrev(pn, d)
>      test_naming(pn, d)
>      test_missing_metadata(pn, d)
>      test_missing_maintainer(pn, d)
> --
> 2.49.0


