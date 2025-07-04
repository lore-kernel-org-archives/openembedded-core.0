Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97181C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 12:25:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.84])
 by mx.groups.io with SMTP id smtpd.web10.11267.1751631916568386655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 05:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=xI1rLEsp;
 spf=pass (domain: navimatix.de, ip: 40.107.130.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjDsK07Nc6NNHHThlhStngXPdU0tGHH8IzuIkvwQcuIjIYZ1PjIdjw0SL8YekOc2CEvDD9w2PrOoOnNVYD6BdesPgDQfTkbPHUqx0rLN/y0FVb54Ivfre6TkjqKeEEYmBXw2EQU/ajyxgyM6+j0Df+QD73SrjEcGslkGCI8JtL6Jn89X0wg2ANC5b+ojaUm+hgjGd+oW4ifUNOpQPxAG7zv24p05PFRK3yL+WBD+HuDkJR+HX0QL+wk+WjcYQats9bzk4GCvigogKNEZLeHY9erCsKpOzne8RwefuYjJZ0t+yynOuiL1ZdT4in6WPvEy3YiHp8DemA1tIk9HAPPivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYF9rvVfABqXhN5DpjGA2uvveE2ykrFWlfTLMEjxEO4=;
 b=sDnc+7av81G92uKQK6pG67YNG67NL8JX51Axdb2L/NgimX76FErIxQiSneZtGbw82uGoQrEbZ03WCPMRdK3uZm0L7R8qLRnbmugK8OkGGT0tUp+tUO7dxpPxRqHjajIkKGPikXiSv6TwzJNqu3KlabtH8j0heC+NqfF0C2TdkhtkovbpGgLCx5e3Y4iHiAAXUZwCfnW9OaQR8Pw/PyozFJqb8+Y/sH/Q1m0D57q+WlGkhnRmuTzpOyN463rHp1z4GEzFVM/qBiqaN10DzEed5hzKgVO7Rv7+5Rel40vIBQ7gM8fWk7PNC77c18ip1NyMjLntgbv7sotawOV5asOH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYF9rvVfABqXhN5DpjGA2uvveE2ykrFWlfTLMEjxEO4=;
 b=xI1rLEsphpQUEWzgbesoj/ApBHMy1Ntq383RN8Rg0SHdR1kMEAtnXNTfMlkvNStQa3ELgn+90vnRixOx7Xfq8gT1plrj7Enwf3lSrnodGx3Z0qcCCr1T1kN7aDGn0SAfqqLNGAHFV87D0oO9OnNBrivD2NkbzZ5QKTWLgYphrmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18) by VI0PR01MB11065.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:263::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 12:25:09 +0000
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07]) by PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 12:25:09 +0000
Date: Fri, 4 Jul 2025 14:25:07 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, s.zhmylev@yadro.com, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [kirkstone][PATCH] classes: Move package RDEPENDS
 processing out of debian.bbclass
Message-ID: <4ibw4a2a3ipn7q4zi7ccr6lll7hiim4jixqw5kius5jkt6m7ul@qypqeob6esee>
References: <184F0B7F5F23DACA.27863@lists.openembedded.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="4cngfnc35ognsxb5"
Content-Disposition: inline
In-Reply-To: <184F0B7F5F23DACA.27863@lists.openembedded.org>
X-ClientProxiedBy: FR4P281CA0394.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::12) To PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR01MB7726:EE_|VI0PR01MB11065:EE_
X-MS-Office365-Filtering-Correlation-Id: 839b616a-1371-4fa2-204a-08ddbaf5d0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?SKrZ5pcfiX1JHZL9nRZ1UN97IIuAm54zQdWFr+ZDv7q9X4yEhYfuFxUmIC?=
 =?iso-8859-1?Q?P8JBTBL8Zvkxg9xK113KYUz9ZUdz2zq9Tx5q2msMVwlTeePkGTttk3hNQB?=
 =?iso-8859-1?Q?b3/znKWq1w5wkTmL6FacbCNXG0ygeI4R/1dE6mVV67XdR/3yRDTsGvZrwE?=
 =?iso-8859-1?Q?4EAZLeMqZzhfjwB8r4P96WPHL+yVrdHn58a4BmfCvfSGeCg024Z1x95V0o?=
 =?iso-8859-1?Q?GzDxLom5Wiw4QPwSt0rn+3cP+YKnc+Z044exeXUp8pZImVvsG1ZImRH/gn?=
 =?iso-8859-1?Q?YNHFBMpA+rszOC/JNHgJ/A9g5HyL3tlM43bHoCCrylwCalkwR9BqMtOCuF?=
 =?iso-8859-1?Q?PnkHwiJkRzu1EVBhNwN7cLxF9OJvOKgmT+ERDs15k9r9t1UqPSZ5Bjp86Q?=
 =?iso-8859-1?Q?9i4BON9oxE9wV1UAHpmE9IwTCMmvTjVodgr8qvaD/00/qX+9X0zKQ/QipO?=
 =?iso-8859-1?Q?qS1xSVvfvLufzS6DOMffTp5k4qQTirRao3ZmbCyl0KCjzOriIwIUbz+rFz?=
 =?iso-8859-1?Q?CwEq2GneaiyN1Ic89hxSHhZI0kZeO5WECTWCEFGnTMYhBkm5bzA1aKLoSI?=
 =?iso-8859-1?Q?aEPsOv2G70ApeQM3jU1jtgHhU1ud6S93hOTkZRljsM03qX2M2F8Tw3IvGe?=
 =?iso-8859-1?Q?PWy6uFvPLZk3WGBdec71udJJsZRUvNu06Uc7DWYn140tGA0vIfRqEeTTln?=
 =?iso-8859-1?Q?R/xM3SzaW3paeOvJWJUV1cxiUSGsP5XWdnzeB/WGwdy8irD98qAnsSl0zD?=
 =?iso-8859-1?Q?GrnHkts+cLhsEY1UqNrYNN+OWl+Y7sLvPc2+SLPPVSzbAe6JUZh4X5z/7M?=
 =?iso-8859-1?Q?91XC4dhttdbI5+9lv/13UKksIcEVzyLm1CCDei01l9GRkjfFTyLvviFyuW?=
 =?iso-8859-1?Q?Zm+WCwT1aAEQtW2ltAGRWaF9im1UD/1Guxbvb022Zg+ZbQw2DaKyZXWXNe?=
 =?iso-8859-1?Q?37QfJzdVLruMjgH+G9cTXgKa51vGCdsdkdOC5uo2dnr+INfuKmPJDsGHvA?=
 =?iso-8859-1?Q?kNshSV1PxvXQ4tDwNop/R/9I82uaoFCskd0yYOhIctv4Y6jEqdsHaHU3wS?=
 =?iso-8859-1?Q?PgSdIlS+2O51zfd4gnyfuwkBJ7hrYQLnBVLqMWXbyG5b4kWJ+mXWjYrC8F?=
 =?iso-8859-1?Q?h73U/rWtNeKsIuqV8SjKNWSUuF8AtRrRTESiHTe5IkjFtoKl+QXTYLyiKZ?=
 =?iso-8859-1?Q?fWWH6JWjcWsDCl2zLrtEygmCm7N0XyZd/iRp2X/tj/Tf4vQYtuLUGZh6CO?=
 =?iso-8859-1?Q?ny95sOt+STxxguBoFx+rNKVIf0Ou8hU3FxLyAI/CxcH0QCd0KxEviCowlb?=
 =?iso-8859-1?Q?5pu6o+v5i0yDn65umSjzooPg1qKtfV3Jb7GWc5zwnemgxWCg3uEPUMtxHR?=
 =?iso-8859-1?Q?I/1RPullb4EEaHLzOhegs0e8vsy5MIeAFTPp8Ti515rHq4Zrr2MY8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB7726.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?KpE0eTv/Y54Rhu/5NvvT2hJnrMfKbnrQifHkiVhNOBTqWuYREzdTg8LrX4?=
 =?iso-8859-1?Q?19jnnbkYpSueGE9TYvY+4X7rSWuyFzyknMqztFirRZX0RnvJ7g4ShiESNU?=
 =?iso-8859-1?Q?+yZphRNfVDd5UM5lI6BOoXI+fw2nKKDGJUlzRu5UfWLuKN6NksMo/3+WDk?=
 =?iso-8859-1?Q?bfwhIR/OuGx0UK6o0rT3NRhl+MWSM3oKq6LVHW6Ppiw+f7n6MxNypnu5TX?=
 =?iso-8859-1?Q?ck/Bu1y+dBqMEzatBlT0X7Qa4dzAq+YQvq4U7k8qTAfBUdNwDV+sq7e5UJ?=
 =?iso-8859-1?Q?NDtUBUX/UTsESyPltvGF/ZOrB38ozEzf75YQXpj8kZpc48ZlEgh9OHq/dN?=
 =?iso-8859-1?Q?AmQx7E1IQVjvZX7Gq+TKZPIxYPLdyYrdkOjBhb43S4PBxQby5eoFqe6QA1?=
 =?iso-8859-1?Q?J+daCKMVTdt1tMtXluyspoEewUS9TsTl6ZsUxXiuea7H7XH7/8YKoEWSRo?=
 =?iso-8859-1?Q?sP+YENel5jJIhk0vi/fTAviD1arrk/4KRTzmFx27HrcHQwntjEW294M+PX?=
 =?iso-8859-1?Q?psz0oInAOsbzK7xvou8qc0F6GkHZJLY5poGoXM6w6KneqZRpdEB8XRPvxf?=
 =?iso-8859-1?Q?fV26Zx7GSasCh1GdItPOVh/V0uyEs1zECXcq5tDvAb0P+tve66iUrjFjui?=
 =?iso-8859-1?Q?NgrbGqCeC1Fn7NUKOxt/XcnEYM7zgcYe7v6ocx1er8KvefZ6MKuSpS9uxr?=
 =?iso-8859-1?Q?+8dV1rtcwEpiPph/xeOND0lUo3rE4C7Z23RwTJVgST3Fgby13iLwMPe2Lu?=
 =?iso-8859-1?Q?TK9WI+lTKJKoLWYnRtDqJYVNOinVkV41P/lUj3Xfv10af/vlhj8avqZ1ih?=
 =?iso-8859-1?Q?tXRePYJrqMaQyLFT+qxs7Wuht1Lav9G6QAL6DaoZdAp5TLAN+sUGldd777?=
 =?iso-8859-1?Q?i/USnpG1ZVuH+q7rd5Q6YZ54Vs62i4vXl4djjWtj0Uw+5p/9tnewgsISLz?=
 =?iso-8859-1?Q?fft6l3OXQnPUdwJ6ZrJQtseBWRp4MOOI95yELJJlX/IoyBtoRyFPT1qCBK?=
 =?iso-8859-1?Q?+bj6egLCLVRPdL293kmKZ6minw0gpcvjaOUJXE7Ivku6uR8fChc8+b0to3?=
 =?iso-8859-1?Q?k5XkGpx8bgpjYhaxpMXSKO3D1QxjtEYzqDdaSYvqLGkSc8+ob8Gm0U2+dY?=
 =?iso-8859-1?Q?49ErhaWfELZUavTv3KrffqpU/sWBajHvb+ZsVXSXK32xTwAqhAgOVgsP1x?=
 =?iso-8859-1?Q?YUjBxVHrAWvNsnvXG25lI+xeoptwMJ2Yr9ApIOK8lZIlUdnm9bHcEzcJu9?=
 =?iso-8859-1?Q?daQp62VpF6XYMf2ekLo+EVfIJVS0mmw6DwJWynqDaqc0PA3LdCCwuDfnHF?=
 =?iso-8859-1?Q?qJMgcaNv4JAMK/oHdFDARE1z4rw2mvHGrapDH8uAdlN+A+5CYivlc1ioTy?=
 =?iso-8859-1?Q?Drmi23VbqVZOR0axj4BMYVjwEfne+aImwDZnbEldHTRkAdwzeTbVvB0QB7?=
 =?iso-8859-1?Q?7cC7ye94+irEMZXRudBKqfIpkvEATNvBpUAeYxUgEHRv2cBbRrRQlQ7hZF?=
 =?iso-8859-1?Q?V6KMJ26XX9jBnw82Me9NlGcC52Zaog/T4zRiGidp9rmphDzLJdpdsUwBOI?=
 =?iso-8859-1?Q?IDkkcAypmL5YX9k5Vm2Ixgm/YnHQu03RDf7hO1HQFrm2Tg00auoyOGSrgc?=
 =?iso-8859-1?Q?W894oIggR+eyzQD4ClKPeiRtsf+0MOq5QEmZC4O/ZcjwjwP16oFDECRg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 839b616a-1371-4fa2-204a-08ddbaf5d0e0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB7726.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 12:25:09.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xiRjCmbFSENTxagDLeSgMr9SifN5OJR4j0qoWyLAtcCPVUnTzPSWAbeKGf5RBB7WKxmQWpIf9LTnMwPBy3FWc40Kmuue84U97k/3CnIzpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB11065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 12:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219919

--4cngfnc35ognsxb5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [kirkstone][PATCH] classes: Move package RDEPENDS
 processing out of debian.bbclass
MIME-Version: 1.0

J=F6rg Sommer via lists.openembedded.org schrieb am Fr 04. Jul, 14:16 (+020=
0):
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> INHERIT_DIRSTO by default includes debian.bbclass which in turn properly
> establishes dependencies between package management tasks and build
> process. Debian class also unconditionally renames several packages in a
> Debian way. In order to allow disabling of such renaming rules, the logic
> of RDEPENDS handling is moved to a package.bbclass.
> This commit also solves the SDK building issue without debian.bbclass.

Is this code in master still required or can it be removed?

```
bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:100:DEBIANRDEP =3D=
 "do_packagedata"
bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:101:oo_package_wri=
te_ipk[rdeptask] =3D "${DEBIANRDEP}"
bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:102:do_package_wri=
te_rpm[rdeptask] =3D "${DEBIANRDEP}"
```

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--4cngfnc35ognsxb5
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
ATAcBgkqhkiG9w0BCQUxDxcNMjUwNzA0MTIyNTA2WjAvBgkqhkiG9w0BCQQxIgQg4eZxjJ4J
mqPkaIpmOInOS4aKycGuIh/80bYjfnMpuvQwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAHycsoBkO7dJ
Pr+ZdSrgJLlUe1UdJM/w5LjBtGm5e/nqmJsgPMCiv36ICSjsZbQFzNsClZLbYZLJLP+VR5RW
VjSu1S31TEO1GE2maadoZbMy+036duRiS05yEIcDqDhSqrDa7kZ1uceTbtN885N66NXddt5S
MlWVvr8YVrH2AtnTYych0PceWeOherK0Jq0LDFhLFp9mNIbYmJwzePwdHSJlCpFE8Chrd5/8
HQJt/pJPfgEZQOJOUdBxNvgJa8OjXDyJfTmb6ew2aW2PU1jnsm2w2dN4JddMiebgvDetKf9B
oeePLAMUkd2BOrl13d4oqsjoNKqwz9EeBLSlEIAwJfc=

--4cngfnc35ognsxb5--

