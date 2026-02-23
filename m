Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317BBE98E10
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 09:08:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31828.1771837721989860818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 01:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vVVxyp6E;
 spf=pass (domain: siemens.com, ip: 40.107.162.46, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M399PaBbRieH7PAInQHaA/EP6lY9Pore/fwP3sljwGundPrEowN0Y5nfURSB5vN2JZ/y9cMmdkAByu+du8kwDqP1iWutH5SfObM3o0kWSxRSK0Rr/VkxoTsLT5TpG2dxD42ZbHQ7U2VJNzj0KeieaHNVV1U7UHJbr3OEakJldoXcj4P2j/nqJA6WoT1vtFlj3VLiaNvfTGJklDAcgSG04KHetJnCfbwX5X0VibaWXlVF0i9rBM1KKEdg5GcjwC5CwLBdqrxFOYFcB7Xz0Kfyx0H/MzDgshTuDA71Ait6htCULVWkccF3dzJRB69MGcOTL56cfiSPTV4zYrIjAtTiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/80s4yqv9vhRVdwt8gk/ehUr48FhOF4HKQkJatkOTps=;
 b=V2QN1Dvwdi4znvb4bbUsLfPI1egYZ1ZaUXlG0iwoMTqYEV7bF7uoAj3soQHDtY5dBO5bRvswknjhpe+2eR4AFj6oI3isguUyF1HmdBmjsPtIJZhe0CEQWz01OG0bOFGxaQrQ2hQ51FGWfcHws1duNLfqUjkrjLtiRoqWxHvrIWj8f67+vAaG+Jggke/pPp9STc/Zc7d3j3dKqlkdW0+LCZAm1M7NBKLqM6Tx/1Slor7R49p1RNGeK4JC1deUxvy1Y1GRXJ9gOU+VZeztWz+FuK8zr4II3gwQv95VnWIxEGEj01b8vT7Or/a50S2QM+XgX1i9fEAuRwhPMDJgwQPwxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/80s4yqv9vhRVdwt8gk/ehUr48FhOF4HKQkJatkOTps=;
 b=vVVxyp6E2aylzd5kQbMBAgnvJYJDFrjL20kx3p0HS4H72HgxpZNpCo3AQexk7KM8S9BJQCdepW7NmmF1GfyF9zyCwT7MwPKqfOUHPlh6FvpzyU8VsAE9XNhDeHVUvdkpWcHhgyBBb7HyUNwldxU4hBqfVMOGmayD34Kvi+QQcivD35EhDp7OXRXFW1Ev+f5gE74a1+ozA0TIXXBj8xEGnWh1ImYOuDOOUk+GnVIaS2DS7Msq3sj9vJ1nY6cKsKa3EWtMccNzz2myPJl1fGNQUcYabcW7QduuJKw4teJvwgUL6U6MlcJ9+8GdNGxYR2FqdVY/R4gw7VaE/sQBmXBQkQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:08:35 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:08:34 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, OE-Core ML
	<openembedded-core@lists.openembedded.org>, Yocto Security ML
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [OE-core] OE-core CVE metrics for scarthgap on Sun Feb 22
 22:17:13 2026
Thread-Topic: [OE-core] OE-core CVE metrics for scarthgap on Sun Feb 22
 22:17:13 2026
Thread-Index: AQHcpKJBXW0gVnb4c0upsYzIDH3cJLWP/l0A
Date: Mon, 23 Feb 2026 09:08:34 +0000
Message-ID: 
 <AS1PR10MB56972F68F447220AA2BC850BFD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260223085507.17802-1-yoann.congal@smile.fr>
 <20260223085507.17802-2-yoann.congal@smile.fr>
In-Reply-To: <20260223085507.17802-2-yoann.congal@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=fa2b71ff-c0fb-44d3-aea6-de59524d02d3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-23T09:07:20Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6066:EE_
x-ms-office365-filtering-correlation-id: 4fce62a7-dee8-4007-a83a-08de72bb1f68
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?SMrrKEYYcI/OlK0cOJjRnOOvoKN5bwxrjFHJWY5XkznJRPt75GssT/NW6K0c?=
 =?us-ascii?Q?LEUhwY5jAMFfNcduifKs31xJ0TptjqcBD7wIH6pFs4IndSdpp9f1Rr3/bvbl?=
 =?us-ascii?Q?UCC4hDTDw5s3rrG+qUxnJiwkWetONbRtjUGgc1C7waqG/MZh1nVkkZuUD2uJ?=
 =?us-ascii?Q?LBB+D+FqcFlWVbtTeMQANdC4IrVbVIB+RNVLL24MHR8XAPEZYZHtgAjlFd1I?=
 =?us-ascii?Q?uCia9Hx0gLrlh6yT/ZJ3rsJC0fDou2j2yPKsHN8m6ugbXbg0bkqg5OHVAfco?=
 =?us-ascii?Q?Cz9K0KkzFIHPPJaMLtEwgl1lQeLldLINY1Vyi5W8A/PAgBR9x89xVU6/QgE9?=
 =?us-ascii?Q?WD+Ct5gejP40liID1JnIeyprURlxh2lCbHmTMG8jdSlsZcdBTncWBwEY8tka?=
 =?us-ascii?Q?15nSL4Xq0Pqb6SbQJX+V1UnWrtR0IZm/iOWMkg9LoZrJ8l2hs7GtV0H7VnxF?=
 =?us-ascii?Q?ydo6J093V1FXyMTyNNO1nGJJhUpy28EflXKgqtuliOZSgaX89xFbYypkPI7J?=
 =?us-ascii?Q?9YgjNgvoi1jOJR/R2e8enPQHzF8O1/l1LMCaZk+kqNHMvBkhkh4kxjSmbd1M?=
 =?us-ascii?Q?jaJaNb0svssub6gbcdHsqp5652WnPjNX834rAKwrBRjUcfITtwL/+8cSCmMZ?=
 =?us-ascii?Q?1SePEFttil+KOSi1MJoV66k9766EtvTYqL0mY29Na4T4RdyuMnpM11t7qJ3s?=
 =?us-ascii?Q?1KAiC1ecS7+oY/TblsXli/PD0VaRqM64cZM2LLWM9P04HSHSDa/IhpwHR5Ws?=
 =?us-ascii?Q?YKwGpBSpCl+9gXYBcl6+I+kHV6A2Z9h8Opu0mqAaOBxULwcnDH4+LdIM+pus?=
 =?us-ascii?Q?eWVYX97KA9kOS4TmA2SEQMouoLJ+3HkIF28bvF5mDDxcNbBdOrnzR4u44aX0?=
 =?us-ascii?Q?Wol3AjuYOuATsyTUEY7Sumviu9WyJyWNc0at68GIeIyUWOBkw2+Aezy6q2VF?=
 =?us-ascii?Q?PuKIMb/gAO0DgEM6/gLXKzaN2djPyKITFK5n6vGV82mKXT9cSOr02eLGtXXj?=
 =?us-ascii?Q?Ghfyg/fDWpk63MUoRmHA9qN4fPT8Kaii9R3YWkNRTM0cHnz6ZIWkR5p4bqxi?=
 =?us-ascii?Q?8RE7B+WehPij4e+elXKzD3jhY7Ghd/rZS9pE1ZeZqnpKFDvOTlfeivdPjqM1?=
 =?us-ascii?Q?/wd87RZEU3ZvTnSQO6Jg4l2l2aPy3ybzfB0Tu3GynStRY7uh/c4v+ze86sTk?=
 =?us-ascii?Q?PKqFo30XE3rPsCBNg6ZVrmdPVKazXGw88vQnfpDl7Op1D8WyKra0d91SKYvF?=
 =?us-ascii?Q?m6yXvPHrXpMVhqyVxk28R9efqViC217o944aYmquQSpLXDnkRCfKz+2vmaOf?=
 =?us-ascii?Q?pZwg6LJ6laESsrkjYCgOWrpgV+l18E2D7RggV+VFhv23FnYEPqytkZ93eeTO?=
 =?us-ascii?Q?xb47rjYSyMdCWvn3v2i3L7muHVdYz00FQJ/kvJt3jYwukDZ8PMh2f4NoDEfX?=
 =?us-ascii?Q?Z/UfQ276Dwq6DFNVhGE/XennNY9xGpSQVYUcvRnvnGiYopMIIJO9ece9cRyn?=
 =?us-ascii?Q?J+WRbswl6vgE8akPDz9MYVIYraJdzxi9Qg3uFggR+eAwWVu/70WhMOLAbsY8?=
 =?us-ascii?Q?YqPzYrihGLRF6yFD4A0/nOiC3UWdS8jl5aMQwf6HmnjDqBFvX39LVLyxtLuf?=
 =?us-ascii?Q?ffB+9Al9Y0A+HG2b0Lkh/SI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wOIXdgw4kIZw8YF0vb5AIHm/2+5D40k7CH9NlYtViprGy+Z53f8hUkWftjxB?=
 =?us-ascii?Q?q0t0ogOpS+1jlE4v4CYWGaCMRBAFfggyYEm7FD1fUGxB8ENRAmj7YxfgOPRP?=
 =?us-ascii?Q?5Xf/1BIZ+KtKHTsXttHdNPknchkn7sX5k7LMI8VhY/sJ4JVO0iIBavstLOZd?=
 =?us-ascii?Q?n5MwKcdDNhHq/KyzZ9ovNrJEeRht+ItDnWerHV/q67MqrXjW9uYRrMb/k0nQ?=
 =?us-ascii?Q?03n9xh5MBbjmlTxlctm8AIBPo8XWKj3Rcs3/hsAOKRrJVxz09DhzQ0FDkx9O?=
 =?us-ascii?Q?PuuD9bYomxyO9trD6zUXHSx5rIgaN5W0NzNpbTJAMzWc8ZWtHfqvBbv7eYHP?=
 =?us-ascii?Q?Gkc1GV/KdhTQZHDwNXPaYYCbJgqkT6OzkGRT8pa12FNW/duJqT31X5j5AHpz?=
 =?us-ascii?Q?VdP9EMSrpjaeuSUA76SsyoMz7EJkLR8VcrywuCkx5RHUq/C3VlTPH5ZPDz59?=
 =?us-ascii?Q?SgO+/6OK650/J5/cN2hiJ/Fjt9wz5ZejGmL92mYv7kDB8oksgdntIzdiRpe9?=
 =?us-ascii?Q?4D4ENo+CnBqgduMDDHPy0TQcYze7SqH6BTfVBIeRVg/GTb8eSwoDdTwOW3LM?=
 =?us-ascii?Q?baQtfRLAgBNYoRE/OiWwaOTT4/vQN7f4WXFc5U11eKgixm1xcd7LSEY7hmyB?=
 =?us-ascii?Q?KjzMlNSD3gMh9G4zgY4VeSQFHehL7nPDq7cSRFGMQV3Psmx71vxNFOELlOfP?=
 =?us-ascii?Q?1TzAb7+rydXuWdi8FJa9AGDVLYk8XpolOSgyMXxcA3r2ZzxLX6PuSSe8pKe6?=
 =?us-ascii?Q?kr5VSPm1oC35oIjf9MEZLO4lGrAo/ZhSoekC8U2kt8/VifYgY806l4kUiDBO?=
 =?us-ascii?Q?o+r59o7G1IhKrTopyPVJu6alt4kqKz9q581uWcL9oThxD9vNe5O7phG7jkZE?=
 =?us-ascii?Q?2f1fe7O60A7YzTFUm2Eem4YXLo75TPxHoQV5A0Yffo8klCw2Wvf5cfXqWBfH?=
 =?us-ascii?Q?hAwdJLcIhb60pZv2FW2EfFxfOzQf3fnfjKKaF9IpsILyWKOME5uuoTB0Bozh?=
 =?us-ascii?Q?9tuw56BU/XTohdxh2K32tCqAUknfM5tyY55c4/aeSEJo2Vf/cdFGXxAX22Ug?=
 =?us-ascii?Q?Xd0760kevkBaKE0uYyDRW1GwVHW+Yw3twfPQ0432nB1JIzRiwMN4A6KvcoOP?=
 =?us-ascii?Q?7O2zq7cn4D8il37KFqqPPBDumTmGNqmfCrlrtAV+JBGhc37SlWSAkwWBfbmC?=
 =?us-ascii?Q?9TB/peDo46q4xc/IraCYPSdmo3XYRtPP3aaM7dEW5E4lsRpH5sDJz5N2XFem?=
 =?us-ascii?Q?CWM3iyr6Sz4l/2bFfAez5TKs6IjaJWGhmx+t8TzaYUH2VbL1eN5Z+Wj32SLF?=
 =?us-ascii?Q?O9aM/DsmJ74VXsTtoBGnKwDe0En+9WxUwbFqBnZQ3Nj/vDoOg0W5hspTx+hq?=
 =?us-ascii?Q?W1mMmcZ+d2cWcHhiIx4+odSe07Q+PEGGMTrJlQM9xxEA+EgdBGhSV8WqFwkV?=
 =?us-ascii?Q?8A/bA/THS/2nm+9vgn3/2L5LxzgOSfsyerqU56F8d9TYdlyq4Z3uirrbiwj3?=
 =?us-ascii?Q?06DR5F7Os5X2eeh+s4z0Mf79PvZ/NWlvRzfPLle4KDR588ewnG6FMSupAJfR?=
 =?us-ascii?Q?L/86MTHIcVzsnng0RjAswJs1eSRw7GGcxG3uXS+VeXzsk03jGD3LSEJMKv/z?=
 =?us-ascii?Q?MZ93+w0CmIXWcjc0baz2mx4RGe4nQ2XpxQSxyO/lixcAbBH7dIFQSMoxmJFZ?=
 =?us-ascii?Q?UqDFK0TGtxUKIGkP86wM3MZodsvsdTbzO8I5WK97HnE6YkMFloPwwY+QVMbI?=
 =?us-ascii?Q?6fsqqcoh5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fce62a7-dee8-4007-a83a-08de72bb1f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 09:08:34.4367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8YqKDolLAVyeM7IPREUyINR1aPulPoBkbM9M8kw/3JAA7RAV3mi8OmSdsB1LDZHsfvzfVU+AX4Nw4irug4Uhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 09:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231660

Reports on valkyrie also contain webkitgtk CVEs.
https://valkyrie.yocto.io/pub/non-release/patchmetrics/
Any idea what is the configuration difference for these reports and reports=
 on Valkyrie?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yoann Congal via
> lists.openembedded.org
> Sent: Monday, February 23, 2026 9:55
> To: OE-Core ML <openembedded-core@lists.openembedded.org>; Yocto
> Security ML <yocto-security@lists.yoctoproject.org>
> Subject: [OE-core] OE-core CVE metrics for scarthgap on Sun Feb 22 22:17:=
13
> 2026
>=20
> Branch: scarthgap
>=20
> New this week: 11 CVEs
> CVE-2024-56431 (CVSS3: N/A): libtheora
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56431 *
> CVE-2025-1594 (CVSS3: N/A): ffmpeg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-1594 *
> CVE-2025-22873 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22873 *
> CVE-2025-61732 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61732 *
> CVE-2025-68121 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68121 *
> CVE-2026-22693 (CVSS3: N/A): harfbuzz:harfbuzz-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-22693 *
> CVE-2026-24401 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-24401 *
> CVE-2026-25646 (CVSS3: N/A): libpng:libpng-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25646 *
> CVE-2026-25749 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25749 *
> CVE-2026-26269 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-26269 *
> CVE-2026-27171 (CVSS3: N/A): zlib:zlib-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-27171 *
>=20
> Removed this week: 12 CVEs
> CVE-2025-13151 (CVSS3: N/A): libtasn1:libtasn1-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-13151 *
> CVE-2025-13837 (CVSS3: N/A): python3:python3-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-13837 *
> CVE-2025-14524 (CVSS3: N/A): curl:curl-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-14524 *
> CVE-2025-15281 (CVSS3: N/A): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-15281 *
> CVE-2025-25469 (CVSS3: N/A): ffmpeg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-25469 *
> CVE-2026-0861 (CVSS3: N/A): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-0861 *
> CVE-2026-0915 (CVSS3: N/A): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-0915 *
> CVE-2026-21441 (CVSS3: N/A): python3-urllib3
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-21441 *
> CVE-2026-22184 (CVSS3: N/A): zlib:zlib-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-22184 *
> CVE-2026-22801 (CVSS3: N/A): libpng:libpng-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-22801 *
> CVE-2026-24061 (CVSS3: N/A): inetutils
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-24061 *
> CVE-2026-24515 (CVSS3: N/A): expat:expat-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-24515 *
>=20
> Full list:  Found 503 unpatched CVEs
> CVE-2019-14899 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-38096 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-3079 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3079 *
> CVE-2023-3397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-39176 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-39176 *
> CVE-2023-39179 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-39179 *
> CVE-2023-39180 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-39180 *
> CVE-2023-4010 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-52485 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52485 *
> CVE-2023-52585 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52585 *
> CVE-2023-52586 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52586 *
> CVE-2023-52590 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52590 *
> CVE-2023-52624 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52624 *
> CVE-2023-52625 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52625 *
> CVE-2023-52634 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52634 *
> CVE-2023-52904 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52904 *
> CVE-2023-52920 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52920 *
> CVE-2023-6238 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2023-6535 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535 *
> CVE-2024-23848 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848 *
> CVE-2024-24859 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24859 *
> CVE-2024-24864 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24864 *
> CVE-2024-25739 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25739 *
> CVE-2024-25740 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25740 *
> CVE-2024-25741 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25741 *
> CVE-2024-26596 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26596 *
> CVE-2024-26672 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26672 *
> CVE-2024-26686 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26686 *
> CVE-2024-26699 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26699 *
> CVE-2024-26756 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26756 *
> CVE-2024-26757 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26757 *
> CVE-2024-26758 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26758 *
> CVE-2024-26785 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26785 *
> CVE-2024-26811 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26811 *
> CVE-2024-26900 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26900 *
> CVE-2024-26944 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26944 *
> CVE-2024-26945 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26945 *
> CVE-2024-26948 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26948 *
> CVE-2024-26949 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26949 *
> CVE-2024-26954 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26954 *
> CVE-2024-26962 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-26962 *
> CVE-2024-27010 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-27010 *
> CVE-2024-27011 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-27011 *
> CVE-2024-27012 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-27012 *
> CVE-2024-27017 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-27017 *
> CVE-2024-27079 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-27079 *
> CVE-2024-35794 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-35794 *
> CVE-2024-35808 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-35808 *
> CVE-2024-35843 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-35843 *
> CVE-2024-35931 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-35931 *
> CVE-2024-35968 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-35968 *
> CVE-2024-36024 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-36024 *
> CVE-2024-36288 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-36288 *
> CVE-2024-36478 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-36478 *
> CVE-2024-38595 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-38595 *
> CVE-2024-38608 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-38608 *
> CVE-2024-39472 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-39472 *
> CVE-2024-40965 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-40965 *
> CVE-2024-40979 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-40979 *
> CVE-2024-40999 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-40999 *
> CVE-2024-41008 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41008 *
> CVE-2024-41023 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41023 *
> CVE-2024-41045 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41045 *
> CVE-2024-41067 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41067 *
> CVE-2024-41080 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41080 *
> CVE-2024-41082 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41082 *
> CVE-2024-41085 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41085 *
> CVE-2024-41932 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-41932 *
> CVE-2024-42064 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42064 *
> CVE-2024-42065 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42065 *
> CVE-2024-42066 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42066 *
> CVE-2024-42071 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42071 *
> CVE-2024-42075 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42075 *
> CVE-2024-42078 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42078 *
> CVE-2024-42081 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42081 *
> CVE-2024-42083 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42083 *
> CVE-2024-42107 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42107 *
> CVE-2024-42118 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42118 *
> CVE-2024-42122 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42122 *
> CVE-2024-42123 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42123 *
> CVE-2024-42134 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42134 *
> CVE-2024-42139 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42139 *
> CVE-2024-42151 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42151 *
> CVE-2024-42155 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42155 *
> CVE-2024-42156 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42156 *
> CVE-2024-42158 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42158 *
> CVE-2024-42162 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42162 *
> CVE-2024-42227 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42227 *
> CVE-2024-42252 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42252 *
> CVE-2024-42317 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-42317 *
> CVE-2024-43819 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43819 *
> CVE-2024-43824 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43824 *
> CVE-2024-43826 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43826 *
> CVE-2024-43835 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43835 *
> CVE-2024-43840 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43840 *
> CVE-2024-43857 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43857 *
> CVE-2024-43872 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43872 *
> CVE-2024-43884 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43884 *
> CVE-2024-43886 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43886 *
> CVE-2024-43899 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43899 *
> CVE-2024-43901 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43901 *
> CVE-2024-43904 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43904 *
> CVE-2024-43911 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43911 *
> CVE-2024-43913 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-43913 *
> CVE-2024-44950 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-44950 *
> CVE-2024-44951 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-44951 *
> CVE-2024-44956 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-44956 *
> CVE-2024-44963 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-44963 *
> CVE-2024-46681 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46681 *
> CVE-2024-46698 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46698 *
> CVE-2024-46701 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46701 *
> CVE-2024-46705 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46705 *
> CVE-2024-46710 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46710 *
> CVE-2024-46727 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46727 *
> CVE-2024-46729 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46729 *
> CVE-2024-46730 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46730 *
> CVE-2024-46751 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46751 *
> CVE-2024-46754 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46754 *
> CVE-2024-46772 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46772 *
> CVE-2024-46774 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46774 *
> CVE-2024-46775 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46775 *
> CVE-2024-46778 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46778 *
> CVE-2024-46808 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46808 *
> CVE-2024-46813 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46813 *
> CVE-2024-46823 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46823 *
> CVE-2024-46833 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46833 *
> CVE-2024-46834 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46834 *
> CVE-2024-46841 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46841 *
> CVE-2024-46842 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46842 *
> CVE-2024-46870 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-46870 *
> CVE-2024-47661 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47661 *
> CVE-2024-47662 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47662 *
> CVE-2024-47702 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47702 *
> CVE-2024-47703 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47703 *
> CVE-2024-47726 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47726 *
> CVE-2024-47736 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47736 *
> CVE-2024-47794 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47794 *
> CVE-2024-49885 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49885 *
> CVE-2024-49888 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49888 *
> CVE-2024-49891 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49891 *
> CVE-2024-49893 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49893 *
> CVE-2024-49897 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49897 *
> CVE-2024-49898 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49898 *
> CVE-2024-49899 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49899 *
> CVE-2024-49904 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49904 *
> CVE-2024-49906 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49906 *
> CVE-2024-49908 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49908 *
> CVE-2024-49909 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49909 *
> CVE-2024-49910 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49910 *
> CVE-2024-49911 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49911 *
> CVE-2024-49914 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49914 *
> CVE-2024-49915 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49915 *
> CVE-2024-49916 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49916 *
> CVE-2024-49917 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49917 *
> CVE-2024-49918 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49918 *
> CVE-2024-49919 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49919 *
> CVE-2024-49920 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49920 *
> CVE-2024-49921 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49921 *
> CVE-2024-49922 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49922 *
> CVE-2024-49923 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49923 *
> CVE-2024-49926 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49926 *
> CVE-2024-49928 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49928 *
> CVE-2024-49932 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49932 *
> CVE-2024-49934 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49934 *
> CVE-2024-49940 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49940 *
> CVE-2024-49945 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49945 *
> CVE-2024-49968 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49968 *
> CVE-2024-49970 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49970 *
> CVE-2024-49971 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49971 *
> CVE-2024-49972 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49972 *
> CVE-2024-49974 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49974 *
> CVE-2024-49990 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49990 *
> CVE-2024-49994 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49994 *
> CVE-2024-49998 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49998 *
> CVE-2024-50004 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50004 *
> CVE-2024-50009 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50009 *
> CVE-2024-50010 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50010 *
> CVE-2024-50014 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50014 *
> CVE-2024-50017 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50017 *
> CVE-2024-50027 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50027 *
> CVE-2024-50028 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50028 *
> CVE-2024-50067 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50067 *
> CVE-2024-50090 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50090 *
> CVE-2024-50091 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50091 *
> CVE-2024-50102 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50102 *
> CVE-2024-50106 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50106 *
> CVE-2024-50137 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50137 *
> CVE-2024-50138 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50138 *
> CVE-2024-50146 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50146 *
> CVE-2024-50157 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50157 *
> CVE-2024-50177 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50177 *
> CVE-2024-50178 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50178 *
> CVE-2024-50217 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50217 *
> CVE-2024-50221 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50221 *
> CVE-2024-50225 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50225 *
> CVE-2024-50277 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50277 *
> CVE-2024-50289 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50289 *
> CVE-2024-50304 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50304 *
> CVE-2024-50613 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50613 *
> CVE-2024-52559 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-52559 *
> CVE-2024-52560 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-52560 *
> CVE-2024-53050 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53050 *
> CVE-2024-53051 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53051 *
> CVE-2024-53056 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53056 *
> CVE-2024-53084 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53084 *
> CVE-2024-53085 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53085 *
> CVE-2024-53089 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53089 *
> CVE-2024-53090 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53090 *
> CVE-2024-53098 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53098 *
> CVE-2024-53114 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53114 *
> CVE-2024-53124 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53124 *
> CVE-2024-53128 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53128 *
> CVE-2024-53133 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53133 *
> CVE-2024-53147 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53147 *
> CVE-2024-53170 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53170 *
> CVE-2024-53187 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53187 *
> CVE-2024-53201 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53201 *
> CVE-2024-53203 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53203 *
> CVE-2024-53204 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53204 *
> CVE-2024-53205 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53205 *
> CVE-2024-53209 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53209 *
> CVE-2024-53219 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53219 *
> CVE-2024-53221 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53221 *
> CVE-2024-53222 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-53222 *
> CVE-2024-56431 (CVSS3: N/A): libtheora
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56431 *
> CVE-2024-56544 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56544 *
> CVE-2024-56549 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56549 *
> CVE-2024-56588 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56588 *
> CVE-2024-56591 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56591 *
> CVE-2024-56599 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56599 *
> CVE-2024-56608 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56608 *
> CVE-2024-56620 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56620 *
> CVE-2024-56647 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56647 *
> CVE-2024-56702 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56702 *
> CVE-2024-56712 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56712 *
> CVE-2024-56742 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56742 *
> CVE-2024-56757 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56757 *
> CVE-2024-56758 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56758 *
> CVE-2024-56759 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56759 *
> CVE-2024-56761 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56761 *
> CVE-2024-56775 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56775 *
> CVE-2024-56782 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56782 *
> CVE-2024-56784 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-56784 *
> CVE-2024-57795 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57795 *
> CVE-2024-57804 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57804 *
> CVE-2024-57809 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57809 *
> CVE-2024-57857 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57857 *
> CVE-2024-57872 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57872 *
> CVE-2024-57875 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57875 *
> CVE-2024-57898 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57898 *
> CVE-2024-57950 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57950 *
> CVE-2024-57974 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57974 *
> CVE-2024-57975 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57975 *
> CVE-2024-57976 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57976 *
> CVE-2024-57977 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57977 *
> CVE-2024-57982 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57982 *
> CVE-2024-57994 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57994 *
> CVE-2024-57999 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57999 *
> CVE-2024-58006 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58006 *
> CVE-2024-58012 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58012 *
> CVE-2024-58015 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58015 *
> CVE-2024-58089 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58089 *
> CVE-2024-58093 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58093 *
> CVE-2024-58094 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58094 *
> CVE-2024-58095 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58095 *
> CVE-2024-58096 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58096 *
> CVE-2024-58097 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58097 *
> CVE-2024-58241 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58241 *
> CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6519 *
> CVE-2025-12781 (CVSS3: N/A): python3:python3-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-12781 *
> CVE-2025-1594 (CVSS3: N/A): ffmpeg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-1594 *
> CVE-2025-21634 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21634 *
> CVE-2025-21635 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21635 *
> CVE-2025-21649 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21649 *
> CVE-2025-21650 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21650 *
> CVE-2025-21651 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21651 *
> CVE-2025-21672 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21672 *
> CVE-2025-21682 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21682 *
> CVE-2025-21693 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21693 *
> CVE-2025-21696 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21696 *
> CVE-2025-21714 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21714 *
> CVE-2025-21722 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21722 *
> CVE-2025-21723 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21723 *
> CVE-2025-21729 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21729 *
> CVE-2025-21732 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21732 *
> CVE-2025-21739 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21739 *
> CVE-2025-21751 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21751 *
> CVE-2025-21768 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21768 *
> CVE-2025-21786 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21786 *
> CVE-2025-21801 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21801 *
> CVE-2025-21825 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21825 *
> CVE-2025-21833 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21833 *
> CVE-2025-21861 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21861 *
> CVE-2025-21868 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21868 *
> CVE-2025-21870 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21870 *
> CVE-2025-21885 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21885 *
> CVE-2025-21888 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21888 *
> CVE-2025-21892 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21892 *
> CVE-2025-21907 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21907 *
> CVE-2025-21927 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21927 *
> CVE-2025-21949 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21949 *
> CVE-2025-21961 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21961 *
> CVE-2025-21972 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21972 *
> CVE-2025-21976 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21976 *
> CVE-2025-21985 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21985 *
> CVE-2025-22022 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22022 *
> CVE-2025-22026 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22026 *
> CVE-2025-22037 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22037 *
> CVE-2025-22039 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22039 *
> CVE-2025-22062 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22062 *
> CVE-2025-22070 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22070 *
> CVE-2025-22101 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22101 *
> CVE-2025-22103 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22103 *
> CVE-2025-22104 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22104 *
> CVE-2025-22105 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22105 *
> CVE-2025-22107 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22107 *
> CVE-2025-22108 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22108 *
> CVE-2025-22109 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22109 *
> CVE-2025-22111 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22111 *
> CVE-2025-22113 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22113 *
> CVE-2025-22115 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22115 *
> CVE-2025-22121 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22121 *
> CVE-2025-22124 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22124 *
> CVE-2025-22125 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22125 *
> CVE-2025-22127 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22127 *
> CVE-2025-22873 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22873 *
> CVE-2025-23129 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23129 *
> CVE-2025-23130 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23130 *
> CVE-2025-23131 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23131 *
> CVE-2025-23132 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23132 *
> CVE-2025-23133 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23133 *
> CVE-2025-23135 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23135 *
> CVE-2025-23155 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-23155 *
> CVE-2025-25468 (CVSS3: N/A): ffmpeg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-25468 *
> CVE-2025-37743 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37743 *
> CVE-2025-37745 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37745 *
> CVE-2025-37747 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37747 *
> CVE-2025-37750 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37750 *
> CVE-2025-37759 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37759 *
> CVE-2025-37802 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37802 *
> CVE-2025-37806 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37806 *
> CVE-2025-37807 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37807 *
> CVE-2025-37822 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37822 *
> CVE-2025-37826 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37826 *
> CVE-2025-37833 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37833 *
> CVE-2025-37834 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37834 *
> CVE-2025-37856 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37856 *
> CVE-2025-37860 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37860 *
> CVE-2025-37861 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37861 *
> CVE-2025-37870 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37870 *
> CVE-2025-37877 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37877 *
> CVE-2025-37880 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37880 *
> CVE-2025-37882 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37882 *
> CVE-2025-37899 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37899 *
> CVE-2025-37907 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37907 *
> CVE-2025-37920 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37920 *
> CVE-2025-37926 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37926 *
> CVE-2025-37945 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37945 *
> CVE-2025-37977 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-37977 *
> CVE-2025-38011 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38011 *
> CVE-2025-38022 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38022 *
> CVE-2025-38029 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38029 *
> CVE-2025-38038 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38038 *
> CVE-2025-38041 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38041 *
> CVE-2025-38042 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38042 *
> CVE-2025-38057 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38057 *
> CVE-2025-38060 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38060 *
> CVE-2025-38064 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38064 *
> CVE-2025-38069 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38069 *
> CVE-2025-38096 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38096 *
> CVE-2025-38099 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38099 *
> CVE-2025-38104 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38104 *
> CVE-2025-38125 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38125 *
> CVE-2025-38129 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38129 *
> CVE-2025-38132 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38132 *
> CVE-2025-38140 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38140 *
> CVE-2025-38162 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38162 *
> CVE-2025-38164 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38164 *
> CVE-2025-38189 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38189 *
> CVE-2025-38199 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38199 *
> CVE-2025-38201 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38201 *
> CVE-2025-38203 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38203 *
> CVE-2025-38204 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38204 *
> CVE-2025-38206 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38206 *
> CVE-2025-38207 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38207 *
> CVE-2025-38232 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38232 *
> CVE-2025-38234 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38234 *
> CVE-2025-38237 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38237 *
> CVE-2025-38248 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38248 *
> CVE-2025-38261 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38261 *
> CVE-2025-38264 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38264 *
> CVE-2025-38269 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38269 *
> CVE-2025-38272 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38272 *
> CVE-2025-38279 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38279 *
> CVE-2025-38292 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38292 *
> CVE-2025-38303 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38303 *
> CVE-2025-38311 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38311 *
> CVE-2025-38333 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38333 *
> CVE-2025-38359 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38359 *
> CVE-2025-38361 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38361 *
> CVE-2025-38408 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38408 *
> CVE-2025-38414 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38414 *
> CVE-2025-38426 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38426 *
> CVE-2025-38438 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38438 *
> CVE-2025-38507 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38507 *
> CVE-2025-38531 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38531 *
> CVE-2025-38556 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38556 *
> CVE-2025-38582 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38582 *
> CVE-2025-38584 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38584 *
> CVE-2025-38585 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38585 *
> CVE-2025-38591 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38591 *
> CVE-2025-38593 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38593 *
> CVE-2025-38595 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38595 *
> CVE-2025-38597 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38597 *
> CVE-2025-38605 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38605 *
> CVE-2025-38627 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38627 *
> CVE-2025-38636 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38636 *
> CVE-2025-38643 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38643 *
> CVE-2025-38656 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38656 *
> CVE-2025-38660 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38660 *
> CVE-2025-38678 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38678 *
> CVE-2025-38704 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38704 *
> CVE-2025-38705 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38705 *
> CVE-2025-38710 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38710 *
> CVE-2025-38717 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38717 *
> CVE-2025-38722 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38722 *
> CVE-2025-39677 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39677 *
> CVE-2025-39705 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39705 *
> CVE-2025-39707 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39707 *
> CVE-2025-39732 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39732 *
> CVE-2025-39745 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39745 *
> CVE-2025-39746 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39746 *
> CVE-2025-39747 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39747 *
> CVE-2025-39748 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39748 *
> CVE-2025-39754 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39754 *
> CVE-2025-39762 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39762 *
> CVE-2025-39764 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39764 *
> CVE-2025-39779 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39779 *
> CVE-2025-39789 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39789 *
> CVE-2025-39805 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39805 *
> CVE-2025-39810 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39810 *
> CVE-2025-39829 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39829 *
> CVE-2025-39833 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39833 *
> CVE-2025-39850 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39850 *
> CVE-2025-39851 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39851 *
> CVE-2025-39859 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39859 *
> CVE-2025-39862 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39862 *
> CVE-2025-39901 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39901 *
> CVE-2025-39905 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39905 *
> CVE-2025-39910 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39910 *
> CVE-2025-39925 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39925 *
> CVE-2025-39927 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39927 *
> CVE-2025-39932 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39932 *
> CVE-2025-39933 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39933 *
> CVE-2025-39940 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39940 *
> CVE-2025-39948 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39948 *
> CVE-2025-39958 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-39958 *
> CVE-2025-40325 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-40325 *
> CVE-2025-4598 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-4598 *
> CVE-2025-4674 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-4674 *
> CVE-2025-47906 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47906 *
> CVE-2025-47907 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47907 *
> CVE-2025-47912 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47912 *
> CVE-2025-50182 (CVSS3: N/A): python3-urllib3
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-50182 *
> CVE-2025-52194 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-52194 *
> CVE-2025-56226 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-56226 *
> CVE-2025-58185 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58185 *
> CVE-2025-58187 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58187 *
> CVE-2025-58188 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58188 *
> CVE-2025-58189 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58189 *
> CVE-2025-59529 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-59529 *
> CVE-2025-60876 (CVSS3: N/A): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-60876 *
> CVE-2025-61723 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61723 *
> CVE-2025-61724 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61724 *
> CVE-2025-61726 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61726 *
> CVE-2025-61727 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61727 *
> CVE-2025-61728 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61728 *
> CVE-2025-61729 (CVSS3: N/A): go-binary-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61729 *
> CVE-2025-61730 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61730 *
> CVE-2025-61731 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61731 *
> CVE-2025-61732 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61732 *
> CVE-2025-66382 (CVSS3: N/A): expat:expat-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-66382 *
> CVE-2025-66476 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-66476 *
> CVE-2025-68119 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68119 *
> CVE-2025-68121 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-run=
time
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68121 *
> CVE-2025-68276 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68276 *
> CVE-2025-68468 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68468 *
> CVE-2025-68471 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68471 *
> CVE-2025-68972 (CVSS3: N/A): gnupg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68972 *
> CVE-2025-68973 (CVSS3: N/A): gnupg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68973 *
> CVE-2026-22693 (CVSS3: N/A): harfbuzz:harfbuzz-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-22693 *
> CVE-2026-24401 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-24401 *
> CVE-2026-25646 (CVSS3: N/A): libpng:libpng-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25646 *
> CVE-2026-25749 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25749 *
> CVE-2026-26269 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-26269 *
> CVE-2026-27171 (CVSS3: N/A): zlib:zlib-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-27171 *
>=20
> Summary of CVE counts by recipe:
>   linux-yocto: 459
>   go-binary-native: 12
>   go:go-binary-native:go-cross-core2-64:go-runtime: 8
>   avahi: 5
>   libsndfile1: 3
>   vim: 3
>   ffmpeg: 2
>   gnupg: 2
>   busybox: 1
>   expat:expat-native: 1
>   harfbuzz:harfbuzz-native: 1
>   libpng:libpng-native: 1
>   libtheora: 1
>   python3:python3-native: 1
>   python3-urllib3: 1
>   qemu:qemu-native:qemu-system-native: 1
>   zlib:zlib-native: 1
>=20
> For further information see: https://valkyrie.yocto.io/pub/non-release/pa=
tchmetrics/

