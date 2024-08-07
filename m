Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52238C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 10:33:48 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.58])
 by mx.groups.io with SMTP id smtpd.web11.30454.1723026815090403237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 03:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=OlsedkZj;
 spf=pass (domain: siemens.com, ip: 40.107.104.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXT3QIJflCPaxBI3arfHCkKgQCW5bd9VSclLwxU3L8t6rIzH9WUwBhDhzBg2J2zXteshcAXL1TNli9amUpq9u/MEUtaUrIK7tv1b2kfSFygqg3gXBJEJLSrHaTJMW9sj9EVOnf/IFt1XG8Jj1SsXVqFhubhYbxOO6k52pUCQNcCAR0b6yMLhQH6MmmIiDxlPQeNPN/Gd8STA+5ARL6BtgwmsLXK6nGbsqYQSLNMUfUTCxYpUaSUQXrNEFa3GkmyDQ9wnpXA4zHQW6zT7YXAOVC18BCDqRWUzSnxVU11LTjRrl7Y4uRPLChP3sXK3/gw1rgnXQlkYKG9DstFjnhSkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfXJ/VKc2j8xSaWwnIgoP7DXt2AO3/VvmIdBYbXPfBQ=;
 b=Fc5KbcAn8y0wjdxI1PO4Pf4K4mwsM8RW3aHpavuCvxjqHpJDBm6waHtWKVRkScvibTIynzPEenOj0eXUhpviRXmJYo7+gwQizHSYnk8pDwnbdWEycXRW9Mv+JndDRj63NQW0wAyAkm/2Y9HO3qrzD7T4hIPpqolWjw1m5sz9z/xse/PrCZ4Dy/I81HsU/koQO15h9Mc8EHIVhTM9I1mUnEEJGUI63SzvbhQRrSBILVE554ezJBOaJK/izsoyG2IkGZSkV3fvW4TRck/6XbF1Orztxzl0JkcQ5dpnoKr9a64ke2ZZH63q6+UJCgU166NoTBYiiqiihVIWVrBFKtXO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfXJ/VKc2j8xSaWwnIgoP7DXt2AO3/VvmIdBYbXPfBQ=;
 b=OlsedkZjy7hvESp5j4Y+sNT4f4sO3LgI5gxI+VFNsv/l613nZ7UiMlzImWUYmq+sS9XHy65+k0IJXSdmIgsBZuLxE6pY0MJwpFDlqdmLq1P+dQqiEdxjR1yNWn0mtUnvvxbj3oLbOZ2beqepSLDMbHC5KwHZBGQpINF4m2tuFr+NVWxJ0Kk+p70MqRWqSx+ZtWBFgDuYKAnU/euyngN+rXvOCURERq7oAbFxcXh7w12GR3H+lESLFPyUscUckCrD7QHOjfd2f0bYIQuZ9aqWzvDE8akzM21ApwG0GwEnp2WhweAnUDIL/QoPq1cHsRekKbqmRDS6mwbZKlVb68GWww==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3300.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:187::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Wed, 7 Aug
 2024 10:33:31 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 10:33:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)"
	<dnagodra@cisco.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
	Marta Rybczynska <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Topic: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Index: AQHa3YRKcSNFFBFi5kio91Rj31uJT7IFaWbggBZBjwCAAAOb4A==
Date: Wed, 7 Aug 2024 10:33:31 +0000
Message-ID: 
 <AS1PR10MB5697AE3874C9EECA6BF35D8BFDB82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <SN7PR11MB69717099C98AD23A85C9E66DD4B82@SN7PR11MB6971.namprd11.prod.outlook.com>
In-Reply-To: 
 <SN7PR11MB69717099C98AD23A85C9E66DD4B82@SN7PR11MB6971.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7752e62c-f1d5-4219-bb5f-b6b6692dea0c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-24T06:25:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3300:EE_
x-ms-office365-filtering-correlation-id: f034fbca-547b-4140-ed9c-08dcb6cc61ee
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?rAMqNECbRWVWv8MfyoJ1JwCQT5xRxXrUjeaZnxHJOFLsVIyFtyM8xkPyHx87?=
 =?us-ascii?Q?ZGhA20hUvVTIgJLOYFU8puzZlo7a+VpLGeFLldcPWNlO8iJIcq0xCyZSMn3Q?=
 =?us-ascii?Q?pTS5QkomGE6BvqlEGw7ywum1F9B61nKh2XRJ65tEV0f3v5q7YFMDMG5zpC5h?=
 =?us-ascii?Q?AJAhcANtZjReGe/YvidPkOOcH7Hp5WgWCvpv7my+6UgQAtGhmMqsoCOekNPz?=
 =?us-ascii?Q?AsAgpwcjaJ9cbf7EKDtj/iABsSKCT+Re8c0w7chinTWXKAPTLrKjXb8EmPAx?=
 =?us-ascii?Q?GCAUxDuvgzqAp0zUSe2QmIBT5e5h/+IidqOvz4PG9VZZmraBAgNdVrxgZGrP?=
 =?us-ascii?Q?1t3M7N4XnLfcGb0ryA1/QfiKFicst84rfXAi7RM7AJs5C9csocgmwko18h22?=
 =?us-ascii?Q?BtX/kPlmJBRVdz8QWhpB5LfahTy90bRASxlgbc819Yt1PQiqjUUgr86fdoaF?=
 =?us-ascii?Q?EN7a5Kay1SsjTGpgjfIx8XFxG6iQtEHS9QE/xH8Kh8AEuGA/SiWvVu6tl8Lh?=
 =?us-ascii?Q?56ZTyRF1Yp0KQzdcQ0dWq5/CgHg6ummuHem5KYSkAG6gkehX7+49X3h89QhG?=
 =?us-ascii?Q?gUwvhP0xRNFDFYeeJGaqcWdW1jPZhyzRSBY6JxpLMfIYqTiPk3Kmm90pUGlg?=
 =?us-ascii?Q?ew28jcCgCuPj+ODtQMBf5t299uEyzG7Le5VKEgRZ6EqKeziuVM6iz1LCAjj9?=
 =?us-ascii?Q?lZuNq7xvNuSRl9VVLggq3UTAWliqRpdwgB9E11K6qMZQ7KGDe3f/2f3UVcR7?=
 =?us-ascii?Q?dFBl5PmmQlKBnsomnQsfQSyBiAb5hEixMZJUBbQoQ0eethzRESRHI2x70gx5?=
 =?us-ascii?Q?ZPQ9L0afwTEn3E63uffKGdF+JaDqUWKU7jjysG7cKFt4qa2rA/NDYhbmgUdm?=
 =?us-ascii?Q?W1cfTxH89xFvqVsjghdrbV9VaXklNeukqE9hGUId2TXEdwEGeSAbihw6HXD7?=
 =?us-ascii?Q?n5xGMrpmuM6QO9cWyLNk1ddjQTa0bG8/XEFo0V3XMa8l08b5rtinVnqoQ5ps?=
 =?us-ascii?Q?rpJWWnN9S0sq9KjV73B4xtLJUf3T0COAGhBRb/IAweJtDBj00wFuowKtZdqV?=
 =?us-ascii?Q?Iv9xG+bN2EG3aXzmYwdpJTfpgviB0PcLhuwM5A2efoE54j5KSDrtzfg7dY9t?=
 =?us-ascii?Q?p/kIhJF+0uEwKYUw1lOpGku2gno7QVbUdLpVVYT/Op93Hzf959xKwFzlAeZh?=
 =?us-ascii?Q?feqwRF94b4juZ8Nv8eqNa1Us90RRMtL+TSsViWniFqYiuS4dn24PXRKxaCih?=
 =?us-ascii?Q?c+F0dhCq2mdnSc6EsQk2G3A+IokCHhiatXwHREHzvrnA/id7JXSykg7GdlBo?=
 =?us-ascii?Q?j+it7fwS3svjxrGg52KEvfk7StLI/4OpuuqJ0u3My0EXMtjMG2rSPBppurbG?=
 =?us-ascii?Q?+KpzpBpIOMKJzVzvhKlmtqYb9rCYwhVY1Pp3bdUTtSDQkhJXFg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VjiXjIhCWESAqwrhHGpDd92WdYuHlURSVDXlKpyMNxZWYNS1qhNOXammIgKv?=
 =?us-ascii?Q?wZD37wHz/UkWQFSzxUjS2r5ofKkWSZYs/dm4uC98zB4+5Z70FAzk/4xiBCdz?=
 =?us-ascii?Q?KSxLTPoJwWVr+43stdXLgDhv+ecKJpp3EmKhfoyZf+/phD45LL9smVuKCdHW?=
 =?us-ascii?Q?X+yL3jPYmQqoqwIrVsqT2X2ZD9S7w7haNv7BmSL32jYKszRJY5ENpfy27RJ+?=
 =?us-ascii?Q?R834pwaqCzvSwgoOe4MZs+98qkfywXroWsJLt1Jy/H/eZJ7fiesB1CBh8bIr?=
 =?us-ascii?Q?23J5HsNmbg7JF1tBIjao5+HvTYvGY42OZ4K8t01mfpkLQMwpL6XRk/Edr4YW?=
 =?us-ascii?Q?KzEgNUfuclwAkpZh35pIbRhDid54eIeW5dqewmSlAT9eIGMZCc7tUdnqAXVm?=
 =?us-ascii?Q?teAOPT7RwPqExh6txjQnsc0jykGNtXTE6tHm/T+y97K3rdrbhXVCD+ZkHRo3?=
 =?us-ascii?Q?eIBojn0i3NYLJhlWz/u+WBOGI1kQovS+c5FUYAzCLQ6pQCjiAdB4HjGaDSmQ?=
 =?us-ascii?Q?bteZpXuxri93K+JgNWRlkVLUzzRi+AcS4LgYlc6gplqR/HzzI/wO/2hLfUSd?=
 =?us-ascii?Q?bpTdiRaAm944BuSFODQIXscZe63FfFJdLeMBCWp5BQyHdh7rcnHqhpiUWuPT?=
 =?us-ascii?Q?viDYQv+PJbwohiddiDKC7AD6sTdFk8YNbZ4KGzsdgnAPFT5/m41oGhcgFQEl?=
 =?us-ascii?Q?kxJFc0NcaV233g8o6YHKNgbZKjt5dRrjJy6Vqxd63hPTx1AruQ7g5iBr29s6?=
 =?us-ascii?Q?9k8z668kkoE9y08QHcOsymlczxVfbtnZQIr/CbiTGOuZg9SW2hdLPs37gqjU?=
 =?us-ascii?Q?KVCAnHgDIm+eKXm+sp66DkmPHj4O1ZsisEWqMCbeznkw6js5saIkIoynu9WW?=
 =?us-ascii?Q?vJ+km21HU6PqTd9pvf9Dlo3rhkecCjbVGrQkUooHRovU/jnjMQc/G2omzQx6?=
 =?us-ascii?Q?rAm30TxfLRBcUbbEyIi+ggrU6/VB0EBwOcIF6uWpTAdhojOkG0qUAknzJ9Vc?=
 =?us-ascii?Q?0vADnSiT+VRW0Lquq6cmzfvhyKN7qV9NLAoIhOKzqRFWCFiNn3u/klZ7UHYq?=
 =?us-ascii?Q?Wzzzp+cjBrelfgiLax6y+ULeS06oNNS1xh9DQqUOPli2E7CuqkpknKiad/ie?=
 =?us-ascii?Q?OWYINVnKVkvv3K70xv3t/LhXi+iucJLkmTIfk1vUXeuLdOnQBi4qGgzy61Al?=
 =?us-ascii?Q?0+6/mZHsUV6dwYGe2ANeaYHh0giGonDK+CoqGUa6NnKnMn9ZnNQ+zpf1OLp3?=
 =?us-ascii?Q?f1MkHzBALI03FhFr4ETfzDQ19nTkXVhr7VbTSR1LUCqFwLi722ZeY1IAGWPM?=
 =?us-ascii?Q?Hx5pmdZnu44aHz/In8fMTUvhmfNymLflxHh/m1u2nLVmqQwuqXjkNA0EjNDT?=
 =?us-ascii?Q?i7eSPtzIdXE3VMQUBE9Pi6HNbjR3VuNCvt322Y7QJYqZPKLuFRDk5Z5pgy1r?=
 =?us-ascii?Q?izrfAqVIj1HfTcZX6qZDJxiSdAyqpraQwWrs0LUQqkvEQd9YnNCnbAZlvVDa?=
 =?us-ascii?Q?GRmBdNdzcr6VR1zYwcf9+7vFk31KkaabKP0eRTe37R5aN+mnhMdE0flisH/e?=
 =?us-ascii?Q?aHRKHpmMhA8Be6YCuEXyHgD+amJGRUypWtjrJ3id?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f034fbca-547b-4140-ed9c-08dcb6cc61ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 10:33:31.2013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MMF1YITtcrLnRXA4HfiMXnAvOP76QPQMaw4P7zMhimlcMVkk9HQH837AytxL4DS20oVN5vKs8Mo2ZH/0xnACKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3300
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 10:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203064



> -----Original Message-----
> From: Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)
> <dnagodra@cisco.com>
> Sent: Wednesday, August 7, 2024 12:17
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>; Richard
> Purdie <richard.purdie@linuxfoundation.org>; Marta Rybczynska
> <rybczynska@gmail.com>; openembedded-core@lists.openembedded.org
> Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
> "Unpatched" status
>=20
>=20
>=20
> >-----Original Message-----
> >From: Marko, Peter <Peter.Marko@siemens.com>
> >Sent: Wednesday, July 24, 2024 12:04 PM
> >To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> ><dnagodra@cisco.com>; openembedded-core@lists.openembedded.org
> >Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> >Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
> >"Unpatched" status
> >
> >-----Original Message-----
> >From: openembedded-core@lists.openembedded.org <openembedded-
> >core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
> >lists.openembedded.org
> >Sent: Wednesday, July 24, 2024 6:45
> >To: openembedded-core@lists.openembedded.org
> >Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.com>
> >Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
> >"Unpatched" status
> >
> >> - The 'upstream-wontfix' is to be used when the CVE is accepted by the
> >>   upstream, but they are not planning to fix it.
> >> - If the version used in Yocto is vulnerable, it should not have
> >>   "Ignored" status. The package is still exploitable by the CVE.
> >> - Also, when the status is exported out of the SDK, it would be
> >>   incorrect to put it under Ignored catgory.
> >
> >The purpose of this entry is to remove meaningless CVEs from reports so =
that
> >users don't spend countless hours over and over again on analyzing "open=
"
> >CVEs if they were already closed upstream.
> >If you look at comments of entries using this category (7 in oe-core
> scarthgap)
> >these CVEs are more or less irrelevant.
> >
> >So this patch is from my point of view step in the wrong direction.
> >If you really need to show these due to your CVE handling process, you c=
an
> >easily override this variable assignment in your own layer.
> >
>=20
>=20
> I tried this in my layer, created a .conf and included in my distro.conf =
file.
> The issue is, it gets overwritten by cve-check-map.conf (as it is include=
d later).

If you create meta-<your-layer>/conf/cve-check-map.conf it will be included=
 instead of the one from oe-core/poky.

>=20
> Would it be okay to make assignments soft in the cve-check-map.conf file?
> This would be similar to CVE_PRODUCT and CVE_VERSION.
> If everyone agrees, I can share the patch for it.
> Is there a better way to do this?

This is also an option; I'm not opinionated on this one...

>=20
> Best Regards,
> Dhairya
>=20
>=20
> >>
> >> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> >> ---
> >>  meta/conf/cve-check-map.conf | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/conf/cve-check-map.conf
> >> b/meta/conf/cve-check-map.conf index b9df41a6f3..7ff53f5601 100644
> >> --- a/meta/conf/cve-check-map.conf
> >> +++ b/meta/conf/cve-check-map.conf
> >> @@ -15,6 +15,8 @@ CVE_CHECK_STATUSMAP[unpatched] =3D "Unpatched"
> >>  CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
> >>  # use when CVE fix is not compatible to the current version and canno=
t be
> >backported.
> >>  CVE_CHECK_STATUSMAP[cannot-backport] =3D "Unpatched"
> >> +# use when upstream acknowledged the vulnerability but does not plan
> >> +to fix it CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Unpatched"
> >>
> >>  # used for migration from old concept, do not use for new
> >> vulnerabilities  CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"
> >> @@ -26,5 +28,3 @@ CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
> >>  CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
> >>  # use when vulnerability affects other platform (e.g. Windows or
> >> Debian)  CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
> >> -# use when upstream acknowledged the vulnerability but does not plan
> >> to fix it -CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"

