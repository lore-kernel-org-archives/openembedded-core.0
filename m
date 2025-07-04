Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666BFC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 17:30:38 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.85])
 by mx.groups.io with SMTP id smtpd.web10.1428.1751650236100935136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 10:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=cnhNW3kr;
 spf=pass (domain: navimatix.de, ip: 52.101.71.85, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lt3WiueUSmlyJZ9dj+BPBMxCPv5RZde4/497w1NgPnEBp0sdTqTpohQ9UElefGG/g85G1ozup80eJQH6Vb3PYhmT1T1OWqv9oJdd5cS8wrhJhbBxlDMy5/+v1ONSEdk2OW+5JXACcPRXZshuTwsSma9wNAUxqRzBIxT2uMGkuxMN6EMHDIBmhQlRU8sYpgUN5e0go3+LyVu10rU/BzSe1B+CaU5D0WPIKivyEF6QRc62wNmHUnjUoXfZxbsqbzp4ekKxps0T/pxOjxjMYPpIihfe/cvqaGr5wm/TEIaKB2Wu02TB0zVyBxZhYfgnEdHOBfucDMS6ZMewAsKwMk8NoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEp55u+XEFm9q9ddY/5bXwgF864tCd30pL5ylic/5ow=;
 b=kNmn53dId5xe3w0yfjkdg9zR2aP6kw7FoltMEbqJP8uAL+YGqc3nG5raabmNg4fNVx7T213EBo0Q7gmS0LkeeleqGPuFQLocQgSNRZc2SFvJFSKpZfh6XAeuS8XziwNQm4o4x9VsM920raBavTwR6/mk/aFjOjKu5KFaFWNSh+VfEB+HMLieGItNDpPvckggXfHa4mkOWyk57Bznc9VVkP5bZawnDc/aKKyMW98iAis0zi7ppPBHqgnvwbp44vy/HTnRYTjejbtC6QRl64aZR/1B9+rTkt7vh9tJkLITubY0rJtHP6PN6vNMQx2eHk9OkaI6lRG6OzvHp5LI7Jvcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEp55u+XEFm9q9ddY/5bXwgF864tCd30pL5ylic/5ow=;
 b=cnhNW3krH0MTcUL1sbOF53gTmOilt+wGOaqHYm83WyfLcJ6Gu/lXgmUB1IiTDHBViJ//9U9l0tg7Qffs8aTOmO0lb9uJ9cHGtUmz3BPjp+isWU9GHOYDnqPCaVnXJfvt9cB6HLOUEMmzjafeDR4cWuC+AWhWe7VaSb5meR087Dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18) by DB9PR01MB7225.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:211::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.13; Fri, 4 Jul
 2025 17:30:32 +0000
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07]) by PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 17:30:32 +0000
Date: Fri, 4 Jul 2025 19:30:30 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, s.zhmylev@yadro.com, 
	alexandre.belloni@bootlin.com
Subject: Re: [OE-core] [kirkstone][PATCH] classes: Move package RDEPENDS
 processing out of debian.bbclass
Message-ID: <w4icfeh4dq7e5xxhaoynlixc6gbuy5fo7i5ktahkwqzb37tea6@hfymdlytlxk4>
References: <184F0B7F5F23DACA.27863@lists.openembedded.org>
 <4ibw4a2a3ipn7q4zi7ccr6lll7hiim4jixqw5kius5jkt6m7ul@qypqeob6esee>
 <f75a5489f7a188dc8a03d68d971f208dcfc538e0.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="ztsmf4ktlczbvsyf"
Content-Disposition: inline
In-Reply-To: <f75a5489f7a188dc8a03d68d971f208dcfc538e0.camel@linuxfoundation.org>
X-ClientProxiedBy: FR4P281CA0427.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::8) To PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR01MB7726:EE_|DB9PR01MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: 1278af03-9cea-4295-12d1-08ddbb207a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?L4J37v8sRyX1Uwg7jZtW5P8x/u6EeZbvCzk/Qsd0+0G+znBBWKANMEZ5Cf?=
 =?iso-8859-1?Q?TBs+tU8KyAwo0dLvyn4rJppwxFhCeZ6NL7nmFzoV3hQgU8xKxDJ5/Q1GJ9?=
 =?iso-8859-1?Q?jfO2K5LYdBrM//WM6JcfWtCs5yoHQ4I656SCKBO+2K0JTMDBexwkmVG1FT?=
 =?iso-8859-1?Q?ueSGjacMh0ScF/GBTc3kqrxiJzEeiRGNC0O4ZQ7SdE9aVHr35zyvfw6J4O?=
 =?iso-8859-1?Q?I8OVSL73FC3GdwVlOXyWNJexxA/vcZ11pc17WhgX1yG62iBdEGGdgi15BW?=
 =?iso-8859-1?Q?Xtl34Ct/l4wcRdzoIaaW8bke9xYy42BFMNip+9WheCPUziud6LcqyEQ813?=
 =?iso-8859-1?Q?ifsyHt2uQXmB7/y+fd30TQKDvgrwoU2H2Rhhlok+1XWoinbL0V/m06/+/e?=
 =?iso-8859-1?Q?Cy3XjqnD5b42g5EwWHPfj9UoMZcmPVQhxKFd0Sy9sPc7H3jiKly5EzWl6F?=
 =?iso-8859-1?Q?5fLXwVZkfh9Nv9AZ3tVcD/4z+eGU3HtBESDwXKnKty22P2tRlqYelMQqIV?=
 =?iso-8859-1?Q?B7q3m84O5bDNRfiKKumZb7wE70MBg/4v8FGBohLrrygbpD621GeCPjBfXe?=
 =?iso-8859-1?Q?wI4Ufrkh3d8yMlkmPNIW73V7z0z0/6yVCAaLoU25O0snTr4+4jS8deVB4h?=
 =?iso-8859-1?Q?QsA15jrv2Jx4EjTcQWphHNdtqZcucPWr1Rfxj1vR4sEqoSOP0fuySXjn18?=
 =?iso-8859-1?Q?7tgl/k2DAdxa4I3xQf0DmvGojjl0tpY21ZVDw68WHqIX8fM1srGluaoSJC?=
 =?iso-8859-1?Q?44JFmRLMucf5kv/DCkDWe2CCv1KAbylT8Qk/WEP5aoF7YbnChTnjq/Bled?=
 =?iso-8859-1?Q?Wyudc5aAdx/Lx8FwF3XI/KjCBeIgK0tKxISpPL5UMcDiXKI2JhnpZZbBdi?=
 =?iso-8859-1?Q?Czw/59Tm8rQ8yWVCX0eO04iN3sIEp0Pcf2/rf4OKgmaqGvUVeGtNdFke/L?=
 =?iso-8859-1?Q?FR8bZ1VZATc+9tiZMx5KKeHWtTGz0U1jE+2tgU5u6DA6soVFvCrEgKTk/0?=
 =?iso-8859-1?Q?ZD/oXJ4vMnWqSrie9AWg7YXTAFt6Vtm+vFy4Tj0iCQIzFeJHsrdS64i0nV?=
 =?iso-8859-1?Q?RXDeS3fZUGOOxbCE76Q7f5KZAZIFjBwBQtjimpWjGgiNdm/+fvn1QHuHMU?=
 =?iso-8859-1?Q?d2x18EPo3mtXgxfqbRi+ao+GIIwH+ytSPaVLREHuBugFbeZ47NgPStvk/m?=
 =?iso-8859-1?Q?pyVysQQYz0Kxdxh6SKgF8X8fGmOzWsJigo00o5YQ3x167dhXg+jEBj+AaB?=
 =?iso-8859-1?Q?ijdeViWtxZrL3eo11loqa+SoC/QMU5AXG8auO8kbpkkl/nJLOHXr19PEKV?=
 =?iso-8859-1?Q?BK2kiMiMg2MthSDQeDPXCpV4foZ1eaTos1sAYaipX7T2XhMvhFQdTQW4zu?=
 =?iso-8859-1?Q?hVmeMj9oVGPXfxrdujf4ymhTsRVwpUdXvyTHAfumWMEPuWzxbW27s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB7726.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?RdwExzibmUi7YUL2mO+j4rKBb4JsKLLK/oXcXQL+FpTi2gl+If30Got5r7?=
 =?iso-8859-1?Q?rzd9+LeY/FpfpS5k7a65ajcvfqD7u5lNtLuNErquG94OhZv16J0HB7Xu7Q?=
 =?iso-8859-1?Q?X2B6ZUp18Ag/6YdY564odaP7PGqQGkjiqgj03PBC3dD7mim/uM8PQi8SJL?=
 =?iso-8859-1?Q?YAybc6r96wS3asbdKChdQi8iaRYmX2PSZ+iw3y5KtI/e8P9EyRIbCjSn8o?=
 =?iso-8859-1?Q?TLz9axUv9Z1+OT3jQyE8ttJPanAogO8f2rEp59g9phmoaU+8eaDGA4ynON?=
 =?iso-8859-1?Q?/e8TxxjJcoQs/i+cM1lkXJTW8KugS7POq5Yah0u7YOuKYvDA34lLmz9lKT?=
 =?iso-8859-1?Q?YgvNBpTxm1V0Jr+HLYYIKVBnmNzh6+VqWsnJ2/v6Ksu55Uui91a7QTelxB?=
 =?iso-8859-1?Q?n9oyTsg177ODgagDfEQAhb+I+KX/gNoN4UGVXD5jT+GxCjjdevd706IC/I?=
 =?iso-8859-1?Q?BkKBbkz/gYewEH3qcXmAEIZtQinzAnOuQkPKkY7fMnnTY1ivbSqn0l95n0?=
 =?iso-8859-1?Q?sdp5t68e1Dn81yDGCcfvZ7m0do0kMyJBKuY2MtWBO6cmzswsolGCcDD0Xu?=
 =?iso-8859-1?Q?dppcsPY0R8oLkR67x0b/a8VvBMWThUG8eg4VIyug6lLQfZnCIsSGomPnLG?=
 =?iso-8859-1?Q?hLRG1XHe3T+bTht9ebLYYt+4e4AzhIqCk+b8YJ0MyG7NsT47sMIABciQwD?=
 =?iso-8859-1?Q?nNKjYuEV/IvvG9qkFoITeTb/Y1tstBZcKh3zcayFa/Cv5nR0OSe8W/bCDB?=
 =?iso-8859-1?Q?qUjnBYqNL+davmKCOLjmL4bJhB0lPdEGtKQoX1FK7EhFRx1kinTTl4kgBG?=
 =?iso-8859-1?Q?MYly/W+7HKKTd24g2HIWC1BpQLCpiFTcjohZy6vx4bvrpX84XWe90KN//b?=
 =?iso-8859-1?Q?U//DsHtZMcorFGLSQQEnOLciSFKyuCD0L0XMOdME0wBVU6PneTYpNQuk8D?=
 =?iso-8859-1?Q?/yFFQkwDAA3XlwH5/6qTsfu+zT8sNUCjejhQgk9sSSdnsPh9SvDl8VEWHI?=
 =?iso-8859-1?Q?7VG79eBaXjT85MH89GYRliUl6rNL6PENcgu83CpNkK9UTMTbojG4NIlzDU?=
 =?iso-8859-1?Q?CFTqXiCxt4jOoiMpW8OQpuRHwmLIeBxNPWL0Eg8PObeNyL7KvNa6P7xkak?=
 =?iso-8859-1?Q?5jN2ORM3Ugoulj/orzzJMyS6qw/PZYbDJ4Ebba+HmcX6vNQdxpes0BPYPw?=
 =?iso-8859-1?Q?T4No4TGiY7k6NgY3HgVE7/S/a+W+n6lTaT58p0RjNYTV1wWg+kS1b0/KMi?=
 =?iso-8859-1?Q?AdQXT/EHOpbxTeoUK238PHfJQjIwV0OhK4NT+UcIxxtBHDzSbrwGyTF3oq?=
 =?iso-8859-1?Q?38/hOiQvfwJuz09awsTz0Lg50622jf7h4eb5yGXmExHWGeKWj7S8yndoRg?=
 =?iso-8859-1?Q?p39Jv1bLQJCOMeWTTtLh6oImd3B6u/Sur1ThmkTnVA027gHmrYCt5zQBsq?=
 =?iso-8859-1?Q?W/cKWFlsd/8Ul8Ol2Xw1L3DAvuzDaaDQXZSz4DUTuk1BjBsFwxCryp0hGC?=
 =?iso-8859-1?Q?qvRjblbiq8DXLwtjA3tQltuHo3vSpJdx0E8GUdZbncFvwbyuk4KUqQ+0zr?=
 =?iso-8859-1?Q?3dRTZC8C4LQQM2c1NUteZ1HgkWuNigA220zdKO1j6M8jvGYwbehMoURJbR?=
 =?iso-8859-1?Q?JHJt53dcAASb4bOqIXLoHFwaND3TsBbidn6ABdmi5rzcgbU3InoNFPzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1278af03-9cea-4295-12d1-08ddbb207a58
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB7726.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 17:30:32.4102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUnw9BDXLZpOWOUMtma5UWYyNGojn+5H/VtWa8TABsuqRNTZEJaXAQnv0PnYPWbmVz05TYYXptsm0MDDoP1uzyNaYz3HqG3YjO4EskFtFyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 17:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219951

--ztsmf4ktlczbvsyf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [kirkstone][PATCH] classes: Move package RDEPENDS
 processing out of debian.bbclass
MIME-Version: 1.0

Richard Purdie schrieb am Fr 04. Jul, 14:39 (+0100):
> On Fri, 2025-07-04 at 14:25 +0200, J=F6rg Sommer wrote:
> > J=F6rg Sommer via lists.openembedded.org schrieb am Fr 04. Jul, 14:16 (=
+0200):
> > > From: Sergei Zhmylev <s.zhmylev@yadro.com>
> > >=20
> > > INHERIT_DIRSTO by default includes debian.bbclass which in turn prope=
rly
> > > establishes dependencies between package management tasks and build
> > > process. Debian class also unconditionally renames several packages i=
n a
> > > Debian way. In order to allow disabling of such renaming rules, the l=
ogic
> > > of RDEPENDS handling is moved to a package.bbclass.
> > > This commit also solves the SDK building issue without debian.bbclass.
> >=20
> > Is this code in master still required or can it be removed?
> >=20
> > ```
> > bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:100:DEBIANRDEP=
 =3D "do_packagedata"
> > bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:101:oo_package=
_write_ipk[rdeptask] =3D "${DEBIANRDEP}"
> > bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:102:do_package=
_write_rpm[rdeptask] =3D "${DEBIANRDEP}"
> > ```
>=20
> That is in a bitbake test, specifically testing certani kinds of
> dependency so wouldn't we still need that? What makes you think it
> should be removed?

It uses the variable name of the code before
251a5c88f6bcf347d637b39b8a86e8a083774986 and I suspected that it solved
something similar as this commit. But I might be wrong. You know the code
much better than me.


Regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--ztsmf4ktlczbvsyf
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
ATAcBgkqhkiG9w0BCQUxDxcNMjUwNzA0MTczMDI5WjAvBgkqhkiG9w0BCQQxIgQgOyNndq4/
jqojuNg+GsHi7m1a1XBwJsT1zSEiXxXKgfYwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAKtrKH1BTjX+
+0Tqiof2JgVd2XhNno1C0i2/gOIuteZWbYhB1mmq2ycU/Mk64FtqZGBHvDKJLe4S5GxCQHw+
FjIYFPHGFRr152O7Wsvs/aUJzKqZjXzd2a2ttXElDNDHh0Stawr47WPrz1ELo8905hGn4+g5
Omw8r6rSFzut60cvV6Et/Kpcs4iE2vZT/YzAYhkYntfuZtfno9MLvAQ45h26Zk0hg/4T7+Hn
k61lArp92jA2zX/tjv4iHHhZVCkWEkLt2rxbk+Lb+VHMSOl4Q2tRMfHRbAPVNC9jFqVmpe5C
phM6/P1jqJMViRxYySZQHYYEf90bA4a/VDLqIvRvyvo=

--ztsmf4ktlczbvsyf--

