Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E19C3DA7E
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 13:00:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.6])
 by mx.groups.io with SMTP id smtpd.web10.16782.1722344394214250292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 05:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@2n.com header.s=selector1 header.b=Ku/4HHhe;
 spf=pass (domain: 2n.com, ip: 52.101.69.6, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cf0GO4QfsnbM/Xryb8N4hNfv/AynBBZ+f47eKwWeNURsHYpoAta9ZgQJjHp/EEJx1U1pqVLwLWue9SFZaGvw2EmEocUKHdJqnBfcmrSHsqou1Gvg2KzHGaiEuppOZTXJHdbVkehBW3kZcF68+wcyw8zttq5Gerenk0ovlP4WgyeMs20oifgvDuj5GlxqHMcwIrOHH6eqYXj7EVJsVzj9UR+k3T/nlQ3rjTiADkypGoJ8jyKklH/YaaG0dnmQ+KF5HSYPbQbSWFpr4jipv8V+RSjcyGYVN0lMCczDsuQc1H4olI2UCYkfOUd6kABFzK07giTfQfZxxEG7Hy0ypXjwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO+oacyX2uAM/oTrVOGcPmO40/cmRi5YfwJBAzMMCNY=;
 b=A8+v0MY9iZNiwedI0G9hMxAT/XriI5ykQJDnlZ0U/dKTN3RwKQfihHvIe0RfqfT2gI1rdBZ49sKm0t6CCqQkgodv7E+6QFGwGe6dwTBf6dbpDJnL+5lUJyPq7D4dLfikzNpQlEZsCzw5nuJgHRsxFxt/gVTraWOD88fMnQaEPpJoG/FPaHxJA0XXWNSjVzQX6/dKMCGBWaG3LMSSMOavUaRUK+tH5BArc3f6yofF5pHslwfasGU6jOF9XgiMcOZzj/eG7OEABJtAwVhKg8KJRgH+NVZOuuX2yviZFMULcPbeN7DU/3RrZCE7dHiMi0JlV34jIjQM42XaKLGU/cOf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=2n.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO+oacyX2uAM/oTrVOGcPmO40/cmRi5YfwJBAzMMCNY=;
 b=Ku/4HHheL//iOZUKIFa17g8JDttqRiwxq4lH6RozjpZIZ5I5Hmg1ctsp4QmpszzeUCWutBc8n4T5ZDLSgBAAIxZ3U63/c67oURV2KulTITiHe12Ye92Fy+volqxMkxNtNwWtJrMi7Z9+Vf4fFNsB6U+oe2FvewC09mT1s7gVq+gFhaQMjCyazbyYwQNRrC1q744yGfy7WCxkPmVZyHC5oA1afzjEHzJCplgTkBNIcLnRpaurzLUy10/XZF0AgPKQuAL8wA+n4BDLs+DLI9F0wRuVNYl5VhGof7gMIdZYLQyXW8/5qVwsu/7QEQ5WRszVBfYOLoCkGPLezBuOUS8u3w==
Received: from DB4PR02MB10030.eurprd02.prod.outlook.com (2603:10a6:10:3f2::14)
 by AS8PR02MB6901.eurprd02.prod.outlook.com (2603:10a6:20b:2e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 12:59:47 +0000
Received: from DB4PR02MB10030.eurprd02.prod.outlook.com
 ([fe80::d1ef:323a:23c3:fbfa]) by DB4PR02MB10030.eurprd02.prod.outlook.com
 ([fe80::d1ef:323a:23c3:fbfa%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 12:59:46 +0000
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: meson: buildtype flags get overriden by CFLAGS
Thread-Topic: meson: buildtype flags get overriden by CFLAGS
Thread-Index: AQHa4m/9JzNFVvh/OEuCmgZQM2GfeQ==
Date: Tue, 30 Jul 2024 12:59:46 +0000
Message-ID: 
 <DB4PR02MB10030DB96660867379C9C45C0E2B02@DB4PR02MB10030.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|AS8PR02MB6901:EE_
x-ms-office365-filtering-correlation-id: e41b7fe8-9e16-4b33-1f3d-08dcb0977cdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-2?Q?wjAFP88pJJRcLAYD+9gXoof2jv2XTLpdy59bBioMyRx07781Iap8N02jZ8?=
 =?iso-8859-2?Q?CYkoxA8PX257MOd/9wvhf8L1qxMPxOBtaJbdQM8xCEeD2rvRbGtefdZLFV?=
 =?iso-8859-2?Q?X3bTmJzXJcrAtIwTe7Bmoc1LykogiNRX7ZnJt3r8gyyMigIMiObM9QN+48?=
 =?iso-8859-2?Q?oi0XZZ/7ufdTk1Oyanf7AWmHQkokKv7tjzA+Zvui3Jober5bqLuza4j217?=
 =?iso-8859-2?Q?LuJ3hcgukbCMVjvbM4APfVfDIdQ0bn6QDd972GcIWGbJ3KcD08m3hMLE/I?=
 =?iso-8859-2?Q?DkOmK9HslocUD8VNYAKqWy2zN5qLAZ+h83+3U6sJuJ8Sz+dY5kYvDlRRqQ?=
 =?iso-8859-2?Q?W1TwEyUebyyR5d4TvI/uXvFeuXG+YnR1OR4YWj+We1LAl+/ive24rPIwlH?=
 =?iso-8859-2?Q?JitSvEwZ9b9CXhpB5M8SplttO0Lz3zl/4nxywaMUbW49DK5HRrrfyB0Uiu?=
 =?iso-8859-2?Q?dXk5zIVtbTPfkdoT+gZhn2epd27tlKbPrW+kybp0yHUeqnZlEvfRjehxgx?=
 =?iso-8859-2?Q?6zhW+ZSsmoIzJxpELepVaM+4dEznadxiXfxLszpwTW6D1UE2BeHP6BwBc/?=
 =?iso-8859-2?Q?B58vLdY5i7jvFihEaVyhMW8NkmoTTc4dnb4HVO2bp/zNjj4XnQg2u9vOrp?=
 =?iso-8859-2?Q?YPAE6103cPrffv3ALWx72qw46BRs7SEqhz2IPkU2nvvwyaN8sriFZelqe+?=
 =?iso-8859-2?Q?2ePvQk4M5Cg6Pjo//gGdaiRc/2BilAhMJL/SAlINNrZ18TN8QClwhtvEeL?=
 =?iso-8859-2?Q?lBXam/odDv1SsndjoW1pgpJekJpmnDFU/g56BGsjhGwmpxzpKNBfYr0diA?=
 =?iso-8859-2?Q?abmwAUm9QIm3nlANtG/3UvaBTvUVeEwuIEjQt9drKdfkxdGEVsDl5ralgx?=
 =?iso-8859-2?Q?8tJnSsF0fKhJb9EHF37Ra6QES6utfu1UM8uIBVTQwaSm4c77uThaBswL7a?=
 =?iso-8859-2?Q?FYc63MrJ225zaRGmI+JHtqTyUCG+j+cxtHvHddyxF4PWhsIDziNw+j+grT?=
 =?iso-8859-2?Q?kZpF/iYSFvWCg0Z8a3QqxIXTSKvQjHS50IaRh1b8RpYVyDOCOSawIbzYkD?=
 =?iso-8859-2?Q?4007TUm283Vi/MkYSiBAJGqYLYQ2fDp2x8TyfZAMdJ97MUYtX+FsPbBTo5?=
 =?iso-8859-2?Q?qqHgcSrbcj9bqX4y+m+4QHGkaY6yT0Hm7tBoD7EAt4KLvOgKs7gqxF8gCi?=
 =?iso-8859-2?Q?Ol5gVg/B80TkJwrUCq3BQd+Zvz2OxtQlNnFrS1qO1GvjYLBif9kQXpUm/W?=
 =?iso-8859-2?Q?9f9hwFddz65CercStDvW33aXyA3EOlG4GWR4q75xIYRVdKFHX545Xs7pPy?=
 =?iso-8859-2?Q?0iuMwi3xg4R3YKNM7sqEV0HbTI2WcS7evbiTi4DRHG3ML3Sa7ePySqc9zm?=
 =?iso-8859-2?Q?WzXmB6dLIBfeyeYzXLdQTZmgm37GzJeA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?UB0Uh1A5PkpGLZt45yyQTq05fXH+883iA97xXR8a9HuNxl8+5vZKE3rGWW?=
 =?iso-8859-2?Q?FXvkDHd01Rg8zGVrt1/St5leLTP0MX3F22ZLpXY7YT4zqUZ+jvjZ4dZs5/?=
 =?iso-8859-2?Q?5zOE4iDWK/ScnQqD+ZghoTZOJj3bpEfOsO4nTr2WfM6wA2D22ZoZxQ+v5s?=
 =?iso-8859-2?Q?zI9dkPQDY9vVp/2BxaBqtMshzWrhNqaOj7xh7Jbh6HSkU3QLTcJNljFuDO?=
 =?iso-8859-2?Q?fkW3HtDRFLlpazJ4xAvcOQySC300hfvpPkuZp79lzdJdcmYjbARPBPPx6c?=
 =?iso-8859-2?Q?SpkxYL68pEkKfQf8tJMxD86mbrg57zENReo1Ry3UKqHf8vT17sCVWSjQGg?=
 =?iso-8859-2?Q?pdWy+JqVos47Nyj3x+oBXKoqFjBgrxaBqOWDJqcbeCk30/ZY1n1nrjQVQv?=
 =?iso-8859-2?Q?5VgcdUSOaYcdruHJtpX6ezHD3ag57RuFjaIu3jHD2ZjmBSbDpsWyr6ZCb/?=
 =?iso-8859-2?Q?oNvZkLDq1ClGiJgS6y7JK30ZXkIy+cDinAUh4KcLJUCx1YTyehOSJ0OKY5?=
 =?iso-8859-2?Q?N77hJGmvfLNylCNfP5zeqN+tTWbX9nYyHmf7KmiJxNNRBy9KCAIosZn3FT?=
 =?iso-8859-2?Q?sObKQxOGrUGP7z6jyLhVVnw1ovulQmvloA24SXgH057nG8wZ9EwT1Wc3+a?=
 =?iso-8859-2?Q?z/3KqcWvHhd3j1GVNvYgJ6tUDrdj9ZsC/HNy/9dX9VtE8mg84Ux45gJmG5?=
 =?iso-8859-2?Q?ks7w9Acq2j2V3Yb/xfMmAok5vIa3dn4sec6f60ZAenN7Yw7WNqiVYLzKa6?=
 =?iso-8859-2?Q?BnDXUTDwi3xD4zO8rvPH3Jbeq1yk5fkcCGX1tVNpbsu4n3wq+8Z8iUXm+L?=
 =?iso-8859-2?Q?ESNwtX9s88DjdrU8ZFq0YE/xCCLjHSNYCBXflFhwWpcRJKySbqDUP13G9Q?=
 =?iso-8859-2?Q?mNKqJ0Nritdyn8T70rUvJ70Ay4r5D7Do9qZoxa2Z4kamVOEX4hpeEYy2VD?=
 =?iso-8859-2?Q?DxLWRVIiQLx9jrX2S/TAmmlc/9eWHNGzO1/FwH4Q9nw9ENoeZ8yGfaDJN+?=
 =?iso-8859-2?Q?NXhv7IFT++ujwYUUxt97CfKPHhQBS1A+grkTb3HL9ED6/mVmNRyW9oolis?=
 =?iso-8859-2?Q?4ZH6Rf4aMscn6mh+uizx/82qsogCAQ7/6+Zw7g6B/e8ha2tqm7AjJR3rlI?=
 =?iso-8859-2?Q?WC6QdQwBjbA735rtePqlbsc3cyXULBL0eT6Fpel0Dq2PIWs4I3Ujw5S/33?=
 =?iso-8859-2?Q?qrYoFMjHs+dFzyCKQfeEPlcBdi7OSSu5EPvVH/Md+ZTPxBw8oxu/7vwSuJ?=
 =?iso-8859-2?Q?nUGPYG1qV+AMkulaAc3oxSE42BQIXg/4e2c9mEfUa0CFM1g8HVQ51iC/3m?=
 =?iso-8859-2?Q?MCnU4HEdvL6qqav3tfx6uRPncI01L7gq2WF2NvmXVmQglMI65xPmo3dDgW?=
 =?iso-8859-2?Q?LVTPTrmblxSsPOhfmQ4A6Mj7FIcgpNSES8+VObtWRHGpqOu+eT4RmqSt32?=
 =?iso-8859-2?Q?lk39wv1dtvuuxGirNiIG0gI09HjDXA8EKu28kTiV3UW73RD2Jofjex8wMB?=
 =?iso-8859-2?Q?UcL+uK+kGVSBeLYjX1h2wxp5WsDTvxhbuf05cX4exsA/I8aV7wZyjM9PlJ?=
 =?iso-8859-2?Q?buL8tnyhBPQ+o8bun8lnTez6R/BsxA9wjdnK+JudpfT5DL2axqXOpvDL6h?=
 =?iso-8859-2?Q?NIEpZSTzyc+1Y=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 2n.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41b7fe8-9e16-4b33-1f3d-08dcb0977cdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 12:59:46.0588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o2YgkckB/gZVa6l7RSzzz7/HZE61H5O5iHhTuNAZI1wIPN5+xmh2velt+xo2xtfK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 13:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202675

I have issues with setting optimization flags in meson-built project.=0A=
=0A=
1. In do_write_config task, meson.cross is generated with `c =3D ${CC}` and=
 `c_args =3D ${CFLAGS}`.=0A=
2. In do_configure, meson setup is called with recipe-defined buildtype and=
 generated meson.cross file.=0A=
3. In do_compile, compile commands are composed roughly as `$c <meson_flags=
> $c_args`, i.e. `${CC} <meson_flags> ${CFLAGS}`. Recipe-defined buildtype =
propagates as optimization flags into <meson_flags> (based on https://meson=
build.com/Builtin-options.html#details-for-buildtype mapping).=0A=
=0A=
CFLAGS is composed of TARGET_CFLAGS, which is in turn composed of SELECTED_=
OPTIMIZATION, which equals either DEBUG_OPTIMIZATION ("-Og ${DEBUG_FLAGS} -=
pipe") or FULL_OPTIMIZATION ("-O2 -pipe ${DEBUG_FLAGS}"), based on value of=
 DEBUG_BUILD. In any case, CFLAGS features optimization flags including -Ox=
.=0A=
=0A=
As a result, the -Oy flag in <meson_flags> does not have any effect because=
 it is always overriden by ${CFLAGS}.=0A=
=0A=
Is it intentional that meson buildtype has in fact no effect? Or am I missi=
ng something?=0A=
=0A=
/Petr=

