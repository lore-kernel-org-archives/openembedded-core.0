Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D55C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:10:31 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.4227.1751353828435144849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=mfTxA0+C;
 dkim=pass header.i=@bmw.de header.s=selector2 header.b=X6zRyoh6;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=27062954d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751353828; x=1782889828;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LEujyyIDiqKAfEx85MSi6s8ZuLfh1l5GHPHGxu1Yuu8=;
  b=mfTxA0+CrGildb6zMh4p7p1a4+kLkQR3bAEsmOqEsb1PdrV4vIRO92MG
   A5GEfdcW4x7p/vOKriG6aSke7Yc5losvaYXRJZ4BXA1dXHDCQJJrvb1jr
   5jFac+OJabwUWGzKNbBrycNCNRyDH+eCQydsorhSSnh+d/+al/UgQ54rT
   c=;
X-CSE-ConnectionGUID: 57NJX73ySuObYOTQBbnL0Q==
X-CSE-MsgGUID: Al/QQvejTQe/kqwKDsNiAQ==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 01 Jul 2025 09:10:25 +0200
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw1.muc with
 ESMTP/TLS; 01 Jul 2025 09:10:25 +0200
Received: from smucmp10h.bmwgroup.net (HELO SMUCMP10H.europe.bmw.corp) ([10.30.13.90])
 by esabb5.muc with ESMTP/TLS; 01 Jul 2025 09:10:25 +0200
Received: from smucmp19h.europe.bmw.corp (2a03:1e80:a15:58f::1:81) by
 SMUCMP10H.europe.bmw.corp (2a03:1e80:a15:58f::2047) with Microsoft SMTP
 Server (version=TLS; Tue, 1 Jul 2025 09:10:25 +0200
Received: from smucdzmp09.europe.bmw.corp (192.109.190.43) by
 smucmp19h.europe.bmw.corp (10.30.13.174) with Microsoft SMTP Server
 (version=TLS; Tue, 1 Jul 2025 09:10:25 +0200
Received: from DB3PR0202CU003.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.43) with Microsoft SMTP Server
 (version=TLS; Tue, 1 Jul 2025 09:10:25 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 DB8PR09MB4235.eurprd09.prod.outlook.com (2603:10a6:10:12b::16) with
 Microsoft SMTP Server (version=TLS; Tue, 1 Jul 2025 07:10:20 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 07:10:20 +0000
X-CSE-ConnectionGUID: z/mIL7kOR525J/7g4Mrsyw==
X-CSE-MsgGUID: ioI0gj5dTg2c4Rn76Seb5w==
X-CSE-ConnectionGUID: tObWYU9lQdWmXWGuY7tkxg==
X-CSE-MsgGUID: JEeyGtWNRuaYeXnkMSaeLQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9kJDdomQMSopTLP+vuUUor7LJoaKoc+4Fu/aJ6fuQKXK7UEBjV2xpIMRhQ+bhBFfVMeCIRSobO/dopp3YINHTLAaUskrXqifuvrExsM+CyjS51RzzGOCtGGFSWV8Fssp937yHVlfvbAGEH4sUamDKOx3ZfWp/yl71kriqKzKd3mNiLK7DLIncQQK/Q27ngSv7JuKCktXMOWcTYsRDYjwXRDCg18EJeb56RpiOrQx4cbwbUQBtfs+JVs8J1pq+u0SVGyIDpBEA9lUN2E/pFtRGrLDAS7zlW0BZxI1pTJI1+W1ZNrAe/15+tNStH9WDt4d7ZNMAgTlLS3YswNru2RxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEujyyIDiqKAfEx85MSi6s8ZuLfh1l5GHPHGxu1Yuu8=;
 b=jDeBx1deiRck/WHAg+ePVUsOPXwn2gmruOmntDym6Dy6/V8w6l6QuIXxpJPOqhXntgygr8ailraTC5mdWwdT+qD3JWO2/QWUthmDsObbiGq/CukYef5tilRETdI72JMMkuQV+L8dEMfooAVJmYuWuSSHnXtkV3jE4obGOFqLwlf7lNezF+5yjuAHoRfWfWqUM1s0mUDjn8pVYuAXUQYcnzoRCfoZoyatki3MsMA+djVTJd/FfuZ+fMPq7uUV4jPeqWT9OTBZMomLz++QwAMUhJf9MSLiHB2XFxNjAgWzU4ADnuOopvJ9ydOYzgkIK8dOG3512BKF5meMyb/CUiYhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEujyyIDiqKAfEx85MSi6s8ZuLfh1l5GHPHGxu1Yuu8=;
 b=X6zRyoh61hxqhrfo+fI2HQePLefbGKV7l9Af8SSLTuGmbFHHUh76F5iRKKyzpewSyjtjtOe1c0EUEHOIdM3GwOD39BnqidPsTTRprc+MDoI0P/BH2KjjiwKPg4Z3UFiRlENW3SjePKG1b8KZObQdbA2SVH6m+X3eXnnvHqbVm/3EeK+KIjQvmfu650+b+eRGo7T3g8k0eDkq+qx1MQStR5ORa0Jnl2DN+dmPAEt6UW315eMN3Gl+uGKfHyF6JwuhdOZcDiZXefTGPLVVObEq/glkG2ybjw2YnONBQswI1Kro7H1PI4mKVCN88C3pbAfBP59tuhuqH/sS04bonhXSIw==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
Thread-Topic: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
Thread-Index: AQHb6auTfwl2d/hnDkW6vnjnl1LkG7Qby0SAgAEMT8o=
Date: Tue, 1 Jul 2025 07:10:20 +0000
Message-ID: <DB3PR09MB6202B03623EBCB0CFDB4DBE0EA41A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de>
 <DAZYFBTDZ6SU.9Z5XXGYAZXRN@bootlin.com>
In-Reply-To: <DAZYFBTDZ6SU.9Z5XXGYAZXRN@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-8859-1?Q?MSIP=5FLabel=5Fc2601314-b878-4900-a263-6d04f23371fa=5FEnab?=
 =?iso-8859-1?Q?led=3DTrue;MSIP=5FLabel=5Fc2601314-b878-4900-a263-6d04f233?=
 =?iso-8859-1?Q?71fa=5FSiteId=3Dce849bab-cc1c-465b-b62e-18f07c9ac198;MSIP?=
 =?iso-8859-1?Q?=5FLabel=5Fc2601314-b878-4900-a263-6d04f23371fa=5FSetDate?=
 =?iso-8859-1?Q?=3D2025-07-01T07:10:20.421Z;MSIP=5FLabel=5Fc2601314-b878-4?=
 =?iso-8859-1?Q?900-a263-6d04f23371fa=5FName=3DNicht_=F6ffentlich;MSIP=5FL?=
 =?iso-8859-1?Q?abel=5Fc2601314-b878-4900-a263-6d04f23371fa=5FContentBits?=
 =?iso-8859-1?Q?=3D0;MSIP=5FLabel=5Fc2601314-b878-4900-a263-6d04f23371fa?=
 =?iso-8859-1?Q?=5FMethod=3DPrivileged;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|DB8PR09MB4235:EE_
x-ms-office365-filtering-correlation-id: 47204f2d-fe03-435a-e06b-08ddb86e576b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?CUQN/yWqtwAUAJJCUTUs/WVBZW4EwJFHVemYPonzWh76F15JxrFM44VBcZ?=
 =?iso-8859-1?Q?3/QvPVAct6g+Or6iPwgSt9QxcErdYbIpBaMWFUIAoHA03lZp/cTLmGHaux?=
 =?iso-8859-1?Q?v4PiUu6Wbs0je8FryHjxoqkEET3pr8S/YKa3vimwPUaUUrAG61Uk69Fb0U?=
 =?iso-8859-1?Q?py4Qhyjv/hgetK7t0mwggxL99dCjcdTVipdy/YWIODPj2l6RJ83fsZwHrN?=
 =?iso-8859-1?Q?+WQihCz8J3EJEgIcz2qQI2DdyvBBKwdcykqOIXDsGRCdYbD8jFvyy7Lpms?=
 =?iso-8859-1?Q?9ho2A77uCUJnMraQYSGx4WmCipWt4CaVph+Qlc+OMkakR4CpLMZDRaZHZe?=
 =?iso-8859-1?Q?4duslfR3xkj0W+tNWx2XK1Uv/lZlt6U5dL4evShGAvIkdTVRw+zmvYUHln?=
 =?iso-8859-1?Q?h4ZwLeCtJ1hcmqBwDPoGsVQRPBV70yPp0686aP1D9rvALsE9+rFv2cfK9o?=
 =?iso-8859-1?Q?VGh9Uq/JZgU1NoS3pD39aRToZ1bleeheBGgnm94dCRxxDK83g5+XgkUdjx?=
 =?iso-8859-1?Q?1X8fbAAFrjTgn8tVTaVIdHv7uoUxo+6u/8TkGEGZ2sMQjvWsWA7iQUB5sW?=
 =?iso-8859-1?Q?l+x09HD/EEmaXxbyFonzry58hylQKkti3Asxuqg8zD4YPpR+xOQQslFSfF?=
 =?iso-8859-1?Q?XRB0vDlUS1eqZOXnUofOPiOS7DGmexM8n/ZwsUhhbd8TbXaQkXQ3PVAR0t?=
 =?iso-8859-1?Q?idK/sUBD8NSO0yWMrIWfEhw8azO3+g41JKwhFJ+xZG5Fr5Y4Hl8uYGnU3M?=
 =?iso-8859-1?Q?7xMpO346LASukJ4G5I3lMwWFlH5nT0T8tzEgmdFPuyMQGSecl+RgcWUXuE?=
 =?iso-8859-1?Q?LKm1tXBEa1DYVBexTZiMv1uB1G8AN+feyI9rOfT0WV+fFAqbec14FaWHF/?=
 =?iso-8859-1?Q?xvVxa9rkabg6DJD4ZJhm4lfIQkqJfbvJ221CDQdNh6uJwIVFWgqlKZdY/p?=
 =?iso-8859-1?Q?NR8NKUPk0Q0y80HqL3NvFtz1LClk/q5hqv5zvmiksCiPf9Y088n6VTqAA+?=
 =?iso-8859-1?Q?2XLHq2RV3ElvDUFTC1PSyb0JS/U83p7G+QGoCL2PUCpMVoHrXtCbmIyqoY?=
 =?iso-8859-1?Q?m1oOT/4ei5aeAa3P5+it7/oWUjWf+pHUSnlSt5fvbqVvLKEB08rx9fy1i6?=
 =?iso-8859-1?Q?YcdT5S92prAhcXS7z9iEsRJaBcprClhmoFxwQ3GyYuXPBwkDm23mxSdMCP?=
 =?iso-8859-1?Q?4rnVtdJVMM3mXFAEHyEM/GX9GhdRQIc6AT5nKCoaLpW3HADyZHP6uvJw1Z?=
 =?iso-8859-1?Q?AjyDBMQF+C2ckVI1gUQcA4Cfbd9Q8pen+EglKFpCcG3rzBuAVEdBnvFHiN?=
 =?iso-8859-1?Q?+tdKo4K+V45nxJ8b/7gC1CDPBUkPk1PmJyk+lFZd7jIbUdJEbhQfC6rR7P?=
 =?iso-8859-1?Q?3TiAh9nQlfPwXYLu6mBBFJRyoR5uM0eAnDGrpjTbJ1iXV8DXmHqK+YuMUi?=
 =?iso-8859-1?Q?o/CpZ2d1QMFAB1Dvnn1AEqwSaZ5+ziofS/dNEW4z4wbvk7L5qKWPL12IQn?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QWNCoEYphAwvgpJlwsNRRAGd7OF1EMRfjnK6ZuUoXKZwvREQWnnSKYBgLv?=
 =?iso-8859-1?Q?141vi5FZmDZgXcC7RdoLzwUBvG2YSMQptjCrNvy0PVRCEqURNovN+0TXlo?=
 =?iso-8859-1?Q?6m6mW7d/kwOhaJJbeUnjhRcB9T57GFszEogtrKR3ibPNsYX1lBiiWnt3nH?=
 =?iso-8859-1?Q?TxRp3RsQ6ZSfwVZ3wuznkifmjLSGS/nRd9syY3B+478YPRGF9YF9ody+Jv?=
 =?iso-8859-1?Q?KJhrB/LzGaWHP1BlgYF7ggyvyYghOCLNjsQd5vCjVLq83ovnLUPFZU06xQ?=
 =?iso-8859-1?Q?EfMTa0D7Q0CTMXFWCP3wM0Ma73vhQPF3Gu8zffQB+5PKGCgujFYe3G7+QV?=
 =?iso-8859-1?Q?IR/vw0MrZDa1bmc9yG2CM4xrcqOaf7ClnCXBXAnQmcw09P7zJeyDJ7JmsM?=
 =?iso-8859-1?Q?95MXKNhCDhlHezlsXKC6LQrcvhnb6iAhQDrqQaOouZuzSUM86CqZndRNNv?=
 =?iso-8859-1?Q?A/nDu8e/rOiRlKLNCkzAG/+aWyuei/FjMLoQM1hlP74jyefp58vBx+1MUI?=
 =?iso-8859-1?Q?irMHNc9HnloQ6LwOFFOKTblbteKBoenVp06DcQ48SVda9h8NP1ZP31+Mpb?=
 =?iso-8859-1?Q?uxhIvwBmKxPDSAgpTSjmMHw6I9PgLOs1RYSeoces5edmzkJ0N8KELyCDUx?=
 =?iso-8859-1?Q?5fT5UG6ohzswEzozkbr15NCxeBvMMAOzBsQ3GDXz1sWygLZw1MI2KYYgtx?=
 =?iso-8859-1?Q?5ONa90sZVt7ihnV7tuIcJCT5E0ymL/1ZIeUfT8LdXZSqYU254DGdtg2m+a?=
 =?iso-8859-1?Q?DaUqsFF77sn0m3Dx61ycYfNJPouY9CzO6nkKiZ6bE2QHtoPEMOerQC3CoE?=
 =?iso-8859-1?Q?KandIAi2AsrrrlO5jX6Ctt5AVwCMXAyietpMCXLtAKDPdaOzghtEuolRii?=
 =?iso-8859-1?Q?6YYfje/KDsARkP92j0dfpuyWf0O1oeavmMT52AoAqQiLntE19Wkq1j+6qf?=
 =?iso-8859-1?Q?JJ0V4YRfy9whaxcrSJw9leCFiLVmj/jjVF3agI2Vx46x1ujPFtrTQmx16W?=
 =?iso-8859-1?Q?z5BivGPlh8sznQOtBpccq4lfQF8Tr28Ll2ZaeWYGQsjYzKVsnEuBtwgegh?=
 =?iso-8859-1?Q?W6Rp+9cZVn2Tia9RH48++dhxVDmBKTQnyKujfU0kzZE5i1exXyw2F9Yzt4?=
 =?iso-8859-1?Q?GjQ/Np7PIyVk26ld/Kh8Rgeg6sjFG8T6mGT1A68ZlU6d7FV2ItA85K9nyB?=
 =?iso-8859-1?Q?pGWdg0LeeW/6mWT/cm3+K2KdK3GeQPArShaTwUsUZsHj3baf84htDT00xY?=
 =?iso-8859-1?Q?TpxySEpy9Lr35DG5KQEtqnbxzRaQeI22bH+HHWk8HWXrlCWVFuEH0TCdba?=
 =?iso-8859-1?Q?IefXzQ0VAJB/cfFWiukCWyAj/rQwhFlbMthUvAY9etMLB9LdAXV+4PmUQp?=
 =?iso-8859-1?Q?tTNIXOmoph5LTCsaOjKIJwtD7jcuxtqogLusmkPZE0hfnI4lVJIv8d4zO1?=
 =?iso-8859-1?Q?ou1nVa3nwCoN7sv3L0BpABhn4XQ+OCIAePfFBB7vdh1H5srxM4JpbbprGV?=
 =?iso-8859-1?Q?3TMkksA7ahZOPtpYVlwduGHqex3uiqNwJcJUo6u1jSjVJUyIdQ/VCNUwwC?=
 =?iso-8859-1?Q?FMXeNszxAC1MrksdCFoErYUXXYtdkFThm6z46aTS+5zbpszd9R5ewO6lc0?=
 =?iso-8859-1?Q?t1jxtYoPV/BKU2+kivD69okXEMWrldmGaw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47204f2d-fe03-435a-e06b-08ddb86e576b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 07:10:20.8724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KiGG4D61EJlQBNNnNRnvAGL5f2Q/2qbGfHVk3BZe+bpOXTxugZhSEXcDM7KUmb+FgORqMEFJ/7LeiO47EAy5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4235
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219546

Hi Antonin,=0A=
=0A=
> Some builds are failing on the Autobuilder after applying this patchset.=
=0A=
> [...]=0A=
> An overview of the errors can be found here:=0A=
> [...]=0A=
=0A=
thanks! I've been able to reproduce most of those locally (via a 'bitbake=
=0A=
world') and they are easily fixable / there are backportable patches by=0A=
upstream. I'll add those to the series and post an updated version.=0A=
=0A=
The musl-locales failure I couldn't reproduce yet (I guess since my local b=
uild=0A=
isn't set up to use musl). Is there an easy way to replicate an autobuilder=
=0A=
build config locally? I couldn't tell from the docs I found at [0].=0A=
=0A=
@Alex: Thanks for clarifying expectations re. the patch series in the other=
=0A=
thread. If I can replicate build issues locally without much overhead, I'm =
happy=0A=
to continue to support in adding required patches for affected components t=
o the=0A=
build.=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://docs.yoctoproject.org/test-manual/understand-autobuilder.html=

