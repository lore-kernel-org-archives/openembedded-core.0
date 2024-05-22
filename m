Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CA9C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:10:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.60])
 by mx.groups.io with SMTP id smtpd.web10.528.1716412207021232438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 14:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=IUdLzlwm;
 spf=pass (domain: siemens.com, ip: 40.107.21.60, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaqjlVXiQIIxFpob2hTmrK3yULeMvHF6oLIlpoi+kDZ1vjran8q6qxCOL1l6fMcDNi4C9WgxeVRCUwqGtDhi2sFG/0WcEfjYD+Mh/NxvnIhOJuCCz5BSV4/dmmgDlNf1v8lHKu9LogodvfI8I/BNsbBcO51VTWlGRnRZxmF8JVA/Ny3yYcBJS3x+sKdbz3LJztNDtloKGYD3iijN7njSElUK9WbU7OKrGzZC7H3u1Zk8PQQVVmRzJBO8hkrdrNv8ZtMgorFt//JxfbTLruq/q16Yf1i3FABpzoD7ss3FNJMfBQaidWfrcSxPUO1sORUI8mnANY4w8hEBreaFM02VKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehz0ARFIo3V6kVP7619Gf1GZtIMHlYXUQG75m7115xA=;
 b=DBoTQKuvry1fKgfKhPJmNNjckcOb7K4FSufMxqluQ65Woq+IFstFtcSEid8C1UOwZCnZGsMFldPfjbeyGXxmw6WkYVoSuG8wMX6uAZrnrlgg++FFhMV3c4Rg4iF06ZFFsS3AZawP8QsrNX9a1SAOpkScRqNghERqKxT+smHYcxec6QZZ/AXp+lIxbVnokTha5BQVjo5R+Wu+R3qQfKTF3UGQRN3njdNJzcua5VmUUn91W45H0D7knHUvRxyKuOtLTvo8fSuDxAWaRuU6Vm6UDgPwRFIiUDiYfaODG2PmqUGrf6JxE+T5ny1tvoFq0qLV8d2t/U+5YX9HzMfX19pltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehz0ARFIo3V6kVP7619Gf1GZtIMHlYXUQG75m7115xA=;
 b=IUdLzlwm4t/jp+i1Mv/9yKdhhIbvBuDzpCTtf7H2rk2zG7GWOUmEFpY7O0Sr6XiSynMfUtHQZA5qqjtymrpS48oXgP9J2Aj73VB7/Ph+3Pu9SP48dNlykcl1vQN3JdKjLh1BQg5DgyFczdoTmqFxDwBJZZtueCQEBM0KfzvQ4+q6FPu0Aii46zKbVJPoXgA3Qu5KLgXV9Aq7gkh+DMFrmskOJikouZoKf2/rpNxFO1S4LRXNvan3TrbmR+U6hvdmuTZV9guXOFz0SN5oKCuAYBM61adYa6Jp5rBpzG7nGbzQ1B3ha245amuldAqRjRUkxSh+AQ9EMfcMXYacQPjjcg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7166.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 21:10:03 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 21:10:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: scarthgap backports
Thread-Topic: scarthgap backports
Thread-Index: AdqsidQ0tv3Ttld1QnygjFI3/SsJxw==
Date: Wed, 22 May 2024 21:10:03 +0000
Message-ID: 
 <AS1PR10MB5697A571F24C68195FB82070FDEB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=92c58b66-00f4-4e7c-bbbb-7dc6983e6b33;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-22T20:51:23Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7166:EE_
x-ms-office365-filtering-correlation-id: 7e5936e3-bbbb-4559-ae6c-08dc7aa38c50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?toFTyMOJrdD5LRcvOjnRHftMMaPeXflv6n8oHoMz3IitZFbPhkP7dbZuimLm?=
 =?us-ascii?Q?sCXSOuCMycisRM7VpRFcY+k2/YUBU3b6WHzOZUzy1W8yDi3C8RsBjuGNH23E?=
 =?us-ascii?Q?Lmp8NNxtJ24JVMaCZZmGaYmThhiIbaFhTx4UnGEU2pVewe8A5epHgWz6NDIE?=
 =?us-ascii?Q?VCUrlDPFlsyuzc3TZeFfPwOqbe2IGJ39JhI3xigNqy7B19xyIh3TSFo+pQ6e?=
 =?us-ascii?Q?eJiLck+VcOG9FYftzJBXgIR2y2X6Bm7XTyb4Wr0VcP8rQiCfxvSvRrZ6FMVP?=
 =?us-ascii?Q?XyRVJmdhrHUha/TWqOwdsi36nqfbTJF8cZvnORNS+2EUuDwpB/N9euJvodTW?=
 =?us-ascii?Q?I+avKg3uz+Va7+FgVqtAnOgr6ScgSBzGJQuwJ5sKu2GMcGwyhQfBD7rtmJ4f?=
 =?us-ascii?Q?dKBWbkPUkcR+hWBv1pmyyV8r6eJH3q7FiNDQ/kZBSgbPY48gMHyrrLMHrDMB?=
 =?us-ascii?Q?FHnNXBDVpl5eM7W0vqaUOOnUi5T2OmSP0a76s4H1qteeDiJMCwD1Rcs1CRAz?=
 =?us-ascii?Q?tW8P3PYV1UuQpaKZMeRzsSzK8AyB+yPNdUsIuJyTlp9o6L3NhpR4kxIu4Wxu?=
 =?us-ascii?Q?6drZavEdJ8d5yPbpv/fhZJWOdhwbVh/8rlTsEIxZWvIAinGIJmmCUQb/lkKZ?=
 =?us-ascii?Q?wJu7FOKxiWKgjzD/zkJV78zOWU2QeH4dlj6aqnffzUEcOalopASuVbLjCds0?=
 =?us-ascii?Q?pqBu1eJtorVUGj4bYk8/6P4lgvmuO2ooYcIXaABsWrGXx8qdsspCfkiimXDa?=
 =?us-ascii?Q?okQHpuBC2KiaHnrThYX4NzlT3KzAuMnO3wpVxaAnkNH5UufcfrIaC5w8ujPh?=
 =?us-ascii?Q?UwfXf6/3A0axgI7sEPx/p+sxkBFzxcr/rWzJ1VMVhwwZJWG887H335XJE2F0?=
 =?us-ascii?Q?kubYS8XcD35wNTpMuL/XjUnO/osJlxMgP8SqOD0ag431HEQWBwVXQHzHFOXQ?=
 =?us-ascii?Q?L+16Lr8VHFzEH6InlVWxgaENLSSOtVFpjzOScEJD3Ts4JhJwTB1qURH3oQUT?=
 =?us-ascii?Q?K/d94U7x29OOCfG4JxolMSUmxVCWnz8NwpNKmUVE+ophFGoVwcC7vyA7E293?=
 =?us-ascii?Q?BwIzHc0g2x1qxPTPWn76tjBHYdB1sgyZLJU1V4rQgMEIVJi4TnKIRLJV8Qmm?=
 =?us-ascii?Q?cyGDSdef2gwZYrlhsCWR7x3jvzEyYDS2Q+x+c8okGy3nVf9SG0GKeBTMyBxh?=
 =?us-ascii?Q?ZWXlN23XninuU2hc0P2XezS7mcO2enEtgyX7dvZ33a9J+e2XyAxssuaP5+sx?=
 =?us-ascii?Q?NZWLX7D9kv1K6/FFlZCYc3JkZNbJ9ubrFRNAGEqV72UQ50nCDasmrLoauMSs?=
 =?us-ascii?Q?FL6eRmc7oKWIUBpJNKJzTUiXkIQPUtbqATZDS9Hnzzf76g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rUQGFcYZfg2yZ5mI9/HQnFBmnoe1s+SeL7CJawgySmigHnNhBguvGhL1OZvD?=
 =?us-ascii?Q?AeiLI3lE0tuI6+UJpLao3SuZ/108KB+/1oRNQiMfBh3FaXcjE6sleczqo3Pr?=
 =?us-ascii?Q?x53afT6xNtWOLJowk0kZBWtnz5Lw9O2CZhrFsG+eo6mVk51l/suhRkaumD8G?=
 =?us-ascii?Q?MLxgRNWqAYJRNC63FPK6z2sIuPApvfPdmbqbOcOuBgAfSvFo+R7MNS3AjFPm?=
 =?us-ascii?Q?BXp//6vtB2WKX08viYfFofaAGNjReb7PMjGDbKMAGV+MK9u0W9BlIXgNms2c?=
 =?us-ascii?Q?uCzZXt0zM8KjWAYrO8eecM7SEMeKchvN2Zxxld4+xXKsA7djfzznJtsHlBq4?=
 =?us-ascii?Q?NrXFp1vTZlNC+QNz7MSqTye5ZPZQNKVeG4qySU6aWzUchhIWE2izAHpyzuYe?=
 =?us-ascii?Q?8Uqg1S0HyhRq+/oUbSTwajqQoFsez/MYQP1j+ujNpXxqmktN66zO0La6IXlq?=
 =?us-ascii?Q?T9+NxvKpHMd0E0NIdb4+F3BwgJWEFz4lDr0R1taFvm91uQWrcpQsSGsqscy0?=
 =?us-ascii?Q?OTzrVvYkTAmSLzUNqC6OXuHx+Q7akNbDe8bKL70jl8zLbxgTguS7IM8A0cSI?=
 =?us-ascii?Q?SMUIxhmi5OCwLCvFgtOCs2LJZqQmcx+Dz8ft1EuRH5h/sMeEZz2GS3Kn/yu0?=
 =?us-ascii?Q?vKKqc8k28SrKMd+u5pVutJTxtDSH7m1jKiAvS6nh4tcUplYArm5h/pJ0Pgmy?=
 =?us-ascii?Q?lx9Z4NwjANGcaYi14G+6pM/DdUsyMchhVotSEEz8i/BRdrrmPNqZ2rq6bcV8?=
 =?us-ascii?Q?RrGjBip8/x2bqr2Rhs3R5AtIC0lHW5ixmMaqv2c7S4gBZ+LNJ4XNrsY4Hx2F?=
 =?us-ascii?Q?HOcaFaGqhGmkWmc2vsAa9WG25Y5SNUf7vhcxk33KTUmENIB+RGun2LhemFsL?=
 =?us-ascii?Q?oRQEwazkmydm9Ys4UZBO1oBy8VJiy7VjDn8RrQhG47Mh2mQE/PAeLPJX0ABw?=
 =?us-ascii?Q?Ckbj5calFXISuBw2WHf7YLRp2+GUz0dRvC+UUMOM1J4bWUYRHWwR+mWa1um2?=
 =?us-ascii?Q?JWNbzxTbdZGL+h7rXlCNaAOxQUOXMMvJscND1C97x8Zam8xDlcDIe9ZMZUxk?=
 =?us-ascii?Q?GtXaIIaIZSbTJ+MemW1CoQGXRjkBqXnZ6XVZLgNa6IDVrWbRQiG0OL2K4q2l?=
 =?us-ascii?Q?HYAsvGrYt5+u8avMOTvrtcNsO7FIuY8B+vF2ohuq5kzLzzMIX23X06MK7H5L?=
 =?us-ascii?Q?hRiyXRKmsz81yoE3S8j/7MqFXOgXLbcZLYPwEupD7liSo5ilxU01jh1mNqq2?=
 =?us-ascii?Q?a73yxJWuO21oLxVb1PXWnwJ3m+h/pQ5UzufBhhX9CC8lZ69Y1UH4FYLVcmgh?=
 =?us-ascii?Q?lz1ZOk3T/fn4EsFwbc/7wlQ7w7RhlFq+SSZwxkD+yh3xeeKTIrQeBxXmVbLq?=
 =?us-ascii?Q?8jk4foLWGtAnXflioEOlqNxpPk3gWA0jLrkTbDNpL505HRr0zUg9/0kUBK1U?=
 =?us-ascii?Q?3Lj66VMoxh45/SZslgLtwPAY29b3rB4qTTXBNXWpDTfFu5cp9O/vCOOW8gSO?=
 =?us-ascii?Q?bDBgnGk0zoZkwbQOl09PwV1o3B+nTErBVL4Oz+yTpim/+HR1fTkSp5YauWkR?=
 =?us-ascii?Q?hAT/f8+k6ZYHl1s5EgD96A3qLNOo95tnYYZIC1jH?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB5697A571F24C68195FB82070FDEB2AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5936e3-bbbb-4559-ae6c-08dc7aa38c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 21:10:03.2042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oOtiKcnhqwYeekiVQEYV7pkV10xhzWJZBVP9oYoNhhv8vzyuUF6BlFTMkqgnbv4YfjJ+a6Wf8k4XgyCaJE7OXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 21:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199769

--_000_AS1PR10MB5697A571F24C68195FB82070FDEB2AS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to request following backports from master to scarthgap

To match versions in scarthgap branches between oe-core and meta-clang:
adc2651a8e902af24fee6ff30a72f4b7c63bef6f llvm: Upgrade to 18.1.4
02df2fc6241ac8fb0e78f2fdff97a04e5c561d54 llvm: Upgrade to 18.1.5

Fix CVEs:
bdf7b7460a4816e3d447264730a2814209667fb0 ncurses: Fix CVE-2023-50495
6573995adf4cfd48b036f8463b39f3864fcfd85b ncurses: Fix CVE-2023-45918

Version correction:
c94e46019a7d443ccc4763ba16d87e7e97abe977 update-rc.d: add +git to PV

Thanks for considering this request,
  Peter

--_000_AS1PR10MB5697A571F24C68195FB82070FDEB2AS1PR10MB5697EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d like to request following backports from m=
aster to scarthgap<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">To match versions in scarthgap branches between oe-c=
ore and meta-clang:<o:p></o:p></p>
<p class=3D"MsoNormal">adc2651a8e902af24fee6ff30a72f4b7c63bef6f llvm: Upgra=
de to 18.1.4<o:p></o:p></p>
<p class=3D"MsoNormal">02df2fc6241ac8fb0e78f2fdff97a04e5c561d54 llvm: Upgra=
de to 18.1.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Fix CVEs:<o:p></o:p></p>
<p class=3D"MsoNormal">bdf7b7460a4816e3d447264730a2814209667fb0 ncurses: Fi=
x CVE-2023-50495<o:p></o:p></p>
<p class=3D"MsoNormal">6573995adf4cfd48b036f8463b39f3864fcfd85b ncurses: Fi=
x CVE-2023-45918<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Version correction:<o:p></o:p></p>
<p class=3D"MsoNormal">c94e46019a7d443ccc4763ba16d87e7e97abe977 update-rc.d=
: add +git to PV<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for considering this request,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Peter<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS1PR10MB5697A571F24C68195FB82070FDEB2AS1PR10MB5697EURP_--

