Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EF9CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 05:34:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.133])
 by mx.groups.io with SMTP id smtpd.web10.2753.1761284091949040260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 22:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=mA46waZN;
 spf=pass (domain: navimatix.de, ip: 52.101.83.133, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvD/ze1gr5CSFkQDPLo5dn1ZhGj+kuhmfUYjpz7plCOAM92szErDIR0Uiu1dtQE4VzqpBv93Y/Y39R2vHHivZCEc5Pg1MQyqWF0p2snWNGaebOMjQXNWZSfAxDDoISgxYWCFtrnQlAQDFW64MZID/rGFk3oQSSM6cTdthekX3Wr5Jt0U3FNeoJLEeqTqApg63knIlkeQhF98rr9BRXBH2DUktN/IJskxy+OpLKbvkl1B2qgbQVw9oY76oU2QgFRey/5hsv63FsN3antx0/TcTvllDl62KRoJli8bibv45UQ/tDOTVfaTXDlsCTQWe/XO+owGJ0C4DkxwDE82vW2VRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bINtgud1q3gUifBCbvU6GIByxdNbN1c9FGUovGNCHiw=;
 b=jmYYAZcVguKClbg+FjrbYAcRjsfCnYyCOPZRmZYoXQAM2GaYVlO/yMzA6OYZiQw8c4JCs21bgmnbfKZgMfh47fmg2bEvsL9j9LNyhm8suAChn2O61Q7XppawLb2yaEbx7BIBk/7dMllbMNClychvsCJhlDY7dOy1BUDfgg6P/1DyXBt/dF/BlSQklMAp4uxJBrHyDinYxpVlBMhBgE5wyGt3FmDn4q5/spbGp2YbvcRAvQVyk+4b51sCaQq+d9B7CpUchCSefUmEWVWdqhrUDZIoRU8sQeF9+a2i/s7/9k9aCX1VG0jgIL/NzwiFAmmlFLwLCX9L0oB0AFv9UkEy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bINtgud1q3gUifBCbvU6GIByxdNbN1c9FGUovGNCHiw=;
 b=mA46waZN3ZZXnaIRUm2T2RizrHFJNK/24y+gqfYNuG5Hex90yfjWY1yNnIV3t2TIUBD5baAC3Ye1exuWhg5Y0r1vb+LEheVFweuY5pk2huXqYTuADYM9GFLboLW93/8zurWyuXMVH5Y0z1DJoNfxLgHLNpkjnJ926V02nxjjLK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB8236.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:206::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 24 Oct
 2025 05:34:47 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9253.011; Fri, 24 Oct 2025 05:34:47 +0000
Date: Fri, 24 Oct 2025 07:34:44 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH v2] gtk+3: Update 3.24.43 -> 3.24.51
Message-ID: <ypksivfvbqelvf5s2btkdecctrxqk4qjp2ipr7ykz7yqe3q6oi@zpjhqtabnokz>
References: <c9b01153cce85ee303c68507f6afcc74903dc3de.1761070660.git.joerg.sommer@navimatix.de>
 <CANNYZj8Dm2f=XC8sKcKq0c_1emmVtjS52bX7_N1Yp4cFG86eQg@mail.gmail.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="mn4uxtnpk5oegwwa"
Content-Disposition: inline
In-Reply-To: <CANNYZj8Dm2f=XC8sKcKq0c_1emmVtjS52bX7_N1Yp4cFG86eQg@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0476.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: da85a5f7-ad07-40bf-00f6-08de12bf0b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?84/fHa9gEqwAVhTXv4rr7AaCT6UyOakN5paOemZzPqGESL1zFSc2J562OD?=
 =?iso-8859-1?Q?qFXCk+5YqXyQeJvdi7GJiH/QJeCNpj7fRRO6kV36JWHiYHxmI6tBDFzR+v?=
 =?iso-8859-1?Q?bhKlQYr7nzwjovvAVp4sWANM6wGGY1LwWZ9YwV8YuFoMvSQRYJZJrMVsaa?=
 =?iso-8859-1?Q?5xz3e/Ie05tP1FWxH4DGIw7+KPMm9JhnI4feOuSbWRn7ees+g7oMXaNKvJ?=
 =?iso-8859-1?Q?ykWprNYR2ETv+sOHtfXxNl/sRnjqBH1NgfS8jcvyx+mCDlZWsRhLdHgOTU?=
 =?iso-8859-1?Q?PDb1IuM4NspEIofGTt4DykGaiyrgK+0HOdfxX3rT2Son6wprcGPpfYz4+x?=
 =?iso-8859-1?Q?IqyJzqV3znSpgpuMh+MQnzJJs80LctsnZdfiRMIOx6z9dRi9r33hHi/xBr?=
 =?iso-8859-1?Q?vgwosshAxUnEvh2iYIlTCnLrFkpUC+JBhMlNUon9d7FQgWchZy3DVSihLw?=
 =?iso-8859-1?Q?Hzb2amAyg5gsFFAiOziL8r9UVgqVnkj6w6OkgPoiSAT6Us9hbhxEdMIPzO?=
 =?iso-8859-1?Q?WUsTEA+e8iRUsRugsjUn5U2KW1teh5TUCDHZmls34EpUP4JfcaqO3yKY7n?=
 =?iso-8859-1?Q?MmLfN5G9O906GsxrGXmHbors2QAMTuP4cn63NySlMMcafR5gQJBZ9SYoUC?=
 =?iso-8859-1?Q?NONFe7Yr1lNPBOLl73KnOPP1TxjhtQVwt1M0Fxu6kx4nhvkqOm7S81boLM?=
 =?iso-8859-1?Q?t4fm58VabJKZTkrqXAbo458mEgBYHr31aejHxtOuSr6PXU5sLug8MxSzNL?=
 =?iso-8859-1?Q?3rhRxnFTmIApt2nd4fpUtn0NLTEsxwzDyk/W0XYMQDbODR/RG7V6yK/lJj?=
 =?iso-8859-1?Q?YFFsO0NU+VHx/gH0TiaQKKwj8dQl/JDrrT72wq0EMQyLUhJiGIR2/BzqXL?=
 =?iso-8859-1?Q?cAEWRgZ7+rPIJ2iqI2r2MmB4YUvHTk35Xesin8Eavni9s+TC8v3m8KQZIU?=
 =?iso-8859-1?Q?P5dEmdnqU9cGBjP5OWySJrVGbaQ9KCYEE2OOZMO7aVR1eZmjicxGDCddv6?=
 =?iso-8859-1?Q?Sui4hqDP7W/NXiyTLVWmx8Tk9zgqfjmYeWO6DsJo+FQm0wVTA+DhYCBNBY?=
 =?iso-8859-1?Q?gmhu3l1vX0X8ibKj86JWNQuTAYHr1efR8malQYI6dEaVof7Q9aW7ogj+Be?=
 =?iso-8859-1?Q?LOqy27Vnnz/2F7VIaEUSlJqvTirRY4aG5qdmyzKSq40fXuVDf1yO+/mNFP?=
 =?iso-8859-1?Q?mKHlvTMprjNAJ29KsXQpaxOK3IgRXgfWyWrYw9JuczfiKNt8jjZLAs7zOT?=
 =?iso-8859-1?Q?5OiuOI/kvXczdqilIpR7Hplq7/Logg0kUBSZU1XwSajzFIWI+NKTvi3/Md?=
 =?iso-8859-1?Q?StI2XZ6KNUqApVOD9CaBjwFJv4HGKT7+bEAP/hsjMhG1flp0n4sHK2B0fW?=
 =?iso-8859-1?Q?KPIBE3sQutH4eKCYd9uYFTWsdLDORGUmgAdMf6ymcnn/AlN4nkG7IgY43/?=
 =?iso-8859-1?Q?n0i8PCe93Q4kfwfE30xvr7u3Td+TlfLGnFhy42A8ugLcu5zl/QjQHR7O4a?=
 =?iso-8859-1?Q?m9Jbq+lEKxL6G0Z50brbBD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?LNJh3sUUuAJlsO7I/oJMRFSyVdT8OjY0vDS5WkIR9zkMxoBCJGwR66Mbq9?=
 =?iso-8859-1?Q?O47GkxRKSgeSXrk1Z6Cd9F3ntRFLo9cAinzcudylzkN8LTznzLB2lyKfKH?=
 =?iso-8859-1?Q?7IEPImBp3cdIiviDICxqbyyOzbBT2N63vLOgfPrFQvK0ytu+fXEuIVVafc?=
 =?iso-8859-1?Q?Kc0ZTKDZ4ivJvLgze1a4Et/jlTxp6GWkvWGa/P38JAa3kD7ipjjPntF0q7?=
 =?iso-8859-1?Q?Bf6ELolQj7aFanwQPV6tCEAydDUO21v8wCAZ9G3BgAdw3K3mVh/zdCQVqm?=
 =?iso-8859-1?Q?m09pCPTYY+TM6g38l4EbwJHblAmm+P85tfP0ulzZ/FI3KBlVdd4cZEWJzj?=
 =?iso-8859-1?Q?FWikcFeXyqaHNX1r4IHnhXYiIo1tVTImDlGVfgYTcrlanCTWLEoCcH8THL?=
 =?iso-8859-1?Q?CPcJ9hCaM/OCpL0dR8wzPrQCd5iMttBdkzEGG6BNZoZLPRFwBla9z8o5gV?=
 =?iso-8859-1?Q?c39ml502UpR5yeh8tR1oH+zf/WO6Pyl9VeQ9zObP6yQNTN9FZx7hrFk15w?=
 =?iso-8859-1?Q?YWlOldCcOHM6dfbkbvB05u4a0kzM1IBbSaWG8LpPjM4Ie+Ipbj6ZxPfvNM?=
 =?iso-8859-1?Q?oDiB+gNrrNRQ3IEcmdjg5R/12UaHpj5WOWkQJTLD1qd7Xp6hbegDzqO6MG?=
 =?iso-8859-1?Q?cM9/FeM8d/Wf8nneku+P7WNxiOcsjKzMcuP73Iq4Um174fnfqV/DtNPVeL?=
 =?iso-8859-1?Q?JNgOdX2z3F1au/pwrQTFlqLK1fPgI2kswLPbfyZPXZEp+E1wdpSlHpDI/5?=
 =?iso-8859-1?Q?7Sm20jD1iWUju3vOn9RA5T9T27x8gjcSUCH+VAMLDq4Q0xMkWRCFDN53Rm?=
 =?iso-8859-1?Q?CFJZv3hRm20y5DaejHAdlJ1MEIr/OcQdGXDO69sQ2wMmtZOJ67JPRWreGJ?=
 =?iso-8859-1?Q?g89StNwNTPYKDeQ8DddWrTBI3UC1RNNPRPlUq22xEOjIm63a39I9JbtLWt?=
 =?iso-8859-1?Q?dYPxTT10gVNDoVnOdwsB7ClCTf95hAQZL2n+tLZG7Xdx4LMB4XEvOWSmLs?=
 =?iso-8859-1?Q?SfUpNRctEocQm5yqFq9of8r+VFLKBT4nrKaDykmQcGoy67c3cqoQhOnwSd?=
 =?iso-8859-1?Q?yGgPHBDYIt2GLwyMVTutDmFBKSvRBotRscHlmnF509cZBH2FnIDLxXZIPG?=
 =?iso-8859-1?Q?tqBCgMDVTZtdTEVNfKsv2fk3U/0uS8HYqU6pwNhn7mDlR8jnm0AEn54hgp?=
 =?iso-8859-1?Q?HRZohQh8Vn3rVOtR2GCfrAiv5iiopCaVuRaQB5mUragFVLTZEmQPandfr4?=
 =?iso-8859-1?Q?ddRAEv/Oh8XzRfIqok7mC6KfLXIRkkri4725QE1oaZq7iYoKwI7AE3pbGf?=
 =?iso-8859-1?Q?Q02Uj5FykThE8MN38toUlck9xysOZ1wTDj8IKhhDcLlk8Xoohd1bzVDOl7?=
 =?iso-8859-1?Q?GH//53PLFgFe7fQC/dI448V3DzDiYZF9QrV2gowZb1Ac42XAwJi+DlxAUa?=
 =?iso-8859-1?Q?mdcUUKjI/LgEatD6n0HbWnl9+UAopCOjjdYGqPKvlr6e9kglLKr1K8rCOa?=
 =?iso-8859-1?Q?84EVdIbzanPZ7V/HeHmpYPsTzMOD7oZz7eVrVwrjgChJZO3WGZLyKpqfcc?=
 =?iso-8859-1?Q?SgMHbXtSw4SAPYk64AGazDh4k7qHrLE1Vwe8Lta24D5QFm92ivJ/RkUuvW?=
 =?iso-8859-1?Q?YzAk8VG1jJIAviM4f8BqRaLyzNDCRRCnl2No3rrXzwUsIKjm36axvqvA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: da85a5f7-ad07-40bf-00f6-08de12bf0b4a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 05:34:47.3114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBv+Y79o6p6vHJmNhbE2qJIkHOQVqvrERapYJqegYEx7NWCLp1OkghxLhusafPohjopSK6zV8a92/8dLNwoWEeTndHYXRKUUBUFu8dzJItY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 05:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225280

--mn4uxtnpk5oegwwa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH v2] gtk+3: Update 3.24.43 -> 3.24.51
MIME-Version: 1.0

Alexander Kanavin schrieb am Do 23. Okt, 12:53 (+0200):
> On Tue, 21 Oct 2025 at 20:20, J=F6rg Sommer via lists.openembedded.org
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > According to https://www.gtk.org/docs/installations/linux/#gtk-v3x the =
new
> > place for downloads is download.gnome.org aka $GNOME_MIRROR (ftp.g.o
> > redirects to this). And new versions are without `+`.
>=20
> "Let's change the name of the project in the middle of LTS cycle, and
> hope downstreams magically find it".

Yes, that's ugly, but on the other side when should have been a better
moment? As far as I saw they unified the deployment system with 3.24.48.

> Anyway, there's a number of other recipes in core that use
> ftp.gnome.org, can you update their SRC_URIs in a separate patch
> please?

Yes, I'll do. How about the gnomebase class. Might it be a good point to
start using it or is it meant for other things?



--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--mn4uxtnpk5oegwwa
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
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
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUxMDI0MDUzNDQ0WjAvBgkqhkiG9w0BCQQxIgQgmMz+N6N1
+jnpNO7zOkVg6JH9syB+uNJUYnDvMkx1wdUwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAKDV2Ea/UrW3
oSulsp/YuDZh6t/hHUxy38jucgb8z09nl5Jf4XtVU9iRPclpVr4XyH3Te/hrFi8+4mKK95SF
mSF/saaqXZp/prBJYYOfqKwszEsettJT43QBA8BW8ob79EDYNqhHCxqY3Tij1OY1ZHWyzxNr
JymbrWwmo0+EFN1bggZ3QsW5Ti37rDZP5oXgvweLM2kfgWa1iYKPkLxp87nEv3dATbzSUOYg
bGRXqqBpv5XDUmeSQ6c6q6QuuinGLchR9gpA2m837j4ytNUpOnCUi4Bkmu+jz+mbUu76sIUv
hbWi0gPkeGA5LA1wj3+Pi4zyx0uLGlNfzlg6q6t7kuQ=

--mn4uxtnpk5oegwwa--

