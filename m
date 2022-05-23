Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D30C433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:11:33 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.24803.1653293486382967526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 01:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1
 header.b=wEO3vghl;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1653293486; x=1684829486;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AZhn6A3vF7Ge7LS2Y/I6Se3VAtDwqfA7k5/1zlXD8r8=;
  b=wEO3vghlEIiA93YOPFsIgahJkb1u4NojsnY3vGyK1jMTnW0ns4QlX3oM
   ih6MtxWLTCeKGDZQ01Uch5h3FezaUZ/nmmCoCGUxfpP1fk+9w7f5Dm0rT
   DybdAOvqfTFX+JWszlqajpaqKR+pgJgFXCdDJYx9DENcrgg8mUvuAQxVX
   mC8keYgXsteXOFmUg18EPHw3ITnnJ98+jYMFVSlvjXwWfXtAU6zUIIQZM
   7gm+wb/8WAh1SHV7MvaRKC69OIHSyK9VIxumlKyaMTH1+7rVc8Q7LLydf
   H1cNytuYh+QW4u/T2Sm1E/nVE6o9lWIgLaC95KynvqF2JMwQik5EgrKgV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="64484222"
X-IronPort-AV: E=Sophos;i="5.91,246,1647270000";
   d="scan'208";a="64484222"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 17:11:22 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnZQY3Zr2kGMZdNE+GGOT78U3hWBekbs93tv8WVOkseouGqxdpbKli1Vzl7jTOydLygvBZKSH+4eqsB7KwGuZF1vg6ZrcZElINIeaA86Uzjhk56MHo/jW/dsbFati5beDj694nLBs33sOlHnrc7GeyAHXh+BH2R4j2DFUp0B/XLqIHRs9Wan7G57KSQZSTjJmys7I4yoPftlnf/bsz3ks2in7W+lJBJDmv1Ekv+dqZ8OhcBOLTpOvqTr0PI/dAB6+LFe3WoqTkCJjpk3OS4QogtKfRtAlKMQxqSMaBE7MGw8TMFXzfM10hgSXs7JMjiGoK0iz0l18LBalzPalHRTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZhn6A3vF7Ge7LS2Y/I6Se3VAtDwqfA7k5/1zlXD8r8=;
 b=dmRL1T5gezjpNX1t2GpOExE8eXYaPQLiWDDpAsTjo2r6GSi4RA/T7QdN9YZYA//AuNNTTx3QaeCvJ1wkH0Lniw5qOz6u8dG9Y6W8hHsuF9BL0dfuXnWFOGbiXweVo1qjeGF9xVhTHJOJK2PD1HA3l22r2jW8BzZQ+nEDq1Yf5xP+j91X+yMgYou5PiuZsOxvdxwktt4oQeA2FPYpf3FiejqxLm7+wZLj0VCxG6lHNUHRh6bTCeP78GKewNbfpMO0FSyo77BtBlKT7MPLqjp8NV11KLhLSaejEND9TzKKY5bsEA3dlrZ03bLvyhbDCK99gK9MALtSlVETTM0M7evEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZhn6A3vF7Ge7LS2Y/I6Se3VAtDwqfA7k5/1zlXD8r8=;
 b=DMLWtfOtyWLTdueEOVY/c155zuuQyZkvqSWNOS+NGhUCXmrz1AFx2W2AfqJ6+sPp6U0yvuxG/CqLMfi4GtR6SarloGO3evTWETY80orSncAu95xroTkvpiSLlsBncn89qzoUSSABLa1EMrkgFPUCyvUdxm78lxUOEaFThG2p62A=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OS0PR01MB6468.jpnprd01.prod.outlook.com (2603:1096:604:e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 08:11:19 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%6]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 08:11:19 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3] gnutls: Added fips option.
Thread-Topic: [OE-core] [PATCH v3] gnutls: Added fips option.
Thread-Index: AQHYbnHmQ3OhSO1XYk++xOyeJ6uvka0sC1wAgAAQXJA=
Date: Mon, 23 May 2022 08:11:19 +0000
Message-ID: 
 <OS0PR01MB6178939BA9278DC29B898EAFA0D49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1653288813-3748-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj_f-wQqQ=mXHFwY57qjvvo6JXE73X2gyk7v-GjQAkHuTg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_f-wQqQ=mXHFwY57qjvvo6JXE73X2gyk7v-GjQAkHuTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86a87630-61fb-434d-dd62-08da3c93d15d
x-ms-traffictypediagnostic: OS0PR01MB6468:EE_
x-microsoft-antispam-prvs: 
 <OS0PR01MB646848BA6181AC14298C4D61A0D49@OS0PR01MB6468.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 q/ap4L1w3EGzMGwb/QutoP0oB30iQps30hQvrmNeHaLsRWKiPQJBE7LB4jRU0OsPB3Y7+x0a9VKGx8cdHpeEKa340nisqfd69e4UzIkE2Fm1ZNAsR3RIvxcfHom18lgYP3RH+2Q+Yul1nDBpp88hpNM3kw+arbwWxlCwOFSca+HNeE+rk+c2mw6EM55STR2NPoEDatshf54TiZ5i18SLfZZxVi2mNUUyWKpeAJRVIvvZn3gb+QSmCwcRyzitH2aqXQvCVmBPAH2nnPGaGLBl6JcAcmZtBWe4hzY/G81eFOqY66iOVYMCU8r+mWqM/FlyChv6EBwKTRiXGpIYtS881vT7bSfXbAnYoIxGdb8A75VcRvK1pEOiW7sy6bcPLXdAMgLnlyR6oX/HGILHRmg5ehoXk1P46V3RjEgHoUTaP7PF+y/hxhX8rvol1QRBwQB0NVPbbVDRCvhm6hy1eGRIRbKNCPBQ5GxIFj2hxe8MgEwjXRfg/cbePHfJ30y//VguQ0haM4MxucfSaXIKg+fsxV1qEnEte9wIHFFWdv38cuo9F+jUqe+EjG/RoUyzC4fspIzpwM+Caadt85svvdO5HywP4wf2uaJmRny4L60DFZDQhBOBdSCLQIM6xRbPqx5iK//e31fPNvilF7D2c2sHcrZinsj6b6YkTXcwWELHqQ29c2ullji7bm1QXyCJMiRYawLtkzX1zRN8pGOoJKkYF6b0KOlAovPX0b3M9PaSOzV6yvIJuAXxuDeEOFpjErUEoUzjkf33hbHvWHEoBIbcpRO/UVBf3KcSoJeLQs4juFIzUhMh6PoUlhsp4PINMnUaac+/rDq1GivmaTdEUU/P+g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(33656002)(64756008)(66446008)(66946007)(66556008)(76116006)(66476007)(5660300002)(4326008)(82960400001)(52536014)(122000001)(8936002)(38100700002)(38070700005)(8676002)(86362001)(508600001)(55016003)(966005)(83380400001)(85182001)(26005)(9686003)(2906002)(71200400001)(7696005)(6506007)(186003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d0U4eTh2eVB3QXpLdjFDeWkvd3FtZGFzSHByU0syZk04VzRQczA4M3BHKzN2?=
 =?utf-8?B?WWQ1WkNiL0hlSndjY1lESC9VUkpaelR1dGlKbEJYL3Y4dy9OZkZ5MlNiK2Vs?=
 =?utf-8?B?Mzg3NmpkOStXRGgzMkJwV244VTdBUkZFMW9BMW5qUi9ZZFN1L29aTHVucEVN?=
 =?utf-8?B?cFZEdzJNUGU5RGRUZzdnNGtPNEQ0RkJ1R2Z2M3pPMVBsbFFjSVhVQnBjMUxC?=
 =?utf-8?B?TnpZS2hYamRTQm1WS0dCR0dKc0x4N0IxVXdYdUJqdkZCbWF5ZlVrTGJmZ3Qw?=
 =?utf-8?B?c2l3ZEdVQ0xzam5WVnJXVHZQZk15c2p0ZDUrZmRQZlA3UEZWMm8rZXpmRmpi?=
 =?utf-8?B?cUlCQ3lPaVJGbWxhbEVEcjBSQ0hCU3hDYnZYVGs5RlNlL1A0SS8yQnovYXhX?=
 =?utf-8?B?bEdqNHNFQlJEdlRlZmlYeEpVZENkUlFsYk1EbG1SdmlSS2lEeHlLbVN6Z04y?=
 =?utf-8?B?dmFEdjAzOGY0YWMxWU9TYURnNlh0NnJPN3YydHMzSHpQcEUvckp1T2RQcXpD?=
 =?utf-8?B?MGlwT2JvWVk4Y242ZlhnUGVGMXpNM0FlcFV4TFRmOWVDM2ZaM3JGL2xLUzRi?=
 =?utf-8?B?MkNDVmhDa1pmL3pPWlV2TGxpZXkrNTJIZ0xXQW9acDZtaHVKOVEwRUdCWkhu?=
 =?utf-8?B?Uk1oSEk3eFdWTjhTT3hLNUJydUl6bVlKd0RHdUQrZXpQSTF5ZTZBeDJqM2ZC?=
 =?utf-8?B?Q3FaNkRlbDZQSWhGd1RUN2ZrUlVOTXRzeW5nUERyeEpEak1IM3ZxZjNLdDFi?=
 =?utf-8?B?ZlYyNnY5WHhhYVY1NTU2N2xRZ1JUSWJKSnB2VDZoT2djdmJGcGM2OFdKc0Jl?=
 =?utf-8?B?eTlxZERzOTRqVVBWdEduYmdIRGlxWHRWZEw4TlVDRWJmRlp4NVpYRlR6Qlk2?=
 =?utf-8?B?YzZ3c1BMNEJLaVE0SWxvWFpvZjd3YlViYVVtL2tiZWxZTnkzZHlEcEw3LzE4?=
 =?utf-8?B?WHN4Ny9DRjZjM1JWS01HcFMweEVBenNPK213UmZ1ZXowbUNPcDVOSThLMDV6?=
 =?utf-8?B?T1ZoV3cxeXZicEtFWmMzWS9vaDlER3Rna0x1NFBHYVVRKzdZUEU5M1hZbmVC?=
 =?utf-8?B?TEVPTDRTcUJ6YjJJYjlWRVIxQ2p1a2l0aU1McmRXdThFNDVKbk94ZXh0eCti?=
 =?utf-8?B?TmMzaXYxYXZPeVcycEJTOW9oQzF6TjZnRUpjdjM1L3o0YldMK3owQXJkUUM3?=
 =?utf-8?B?NWRqSW9MVWc4d1l4cHZMcGV3bTh5aUdaSTRlT0ZPUUdqZkdSUzViT2JHTysz?=
 =?utf-8?B?eFVkVnZDSVdwdjErN1ZMYTRFY2dnMFZjbFNzR1Q5b0ZWWFYzMFloSW4vc0g1?=
 =?utf-8?B?WXdJdTZucFZiMnVvLzlKanBKOUh2S296NzMxeElLRzVUdzA3ZzN6V0hOTnVC?=
 =?utf-8?B?MkE3Q25VWE5aMVFoQ1FoNDdSd1Boc2JUTWpLYVd6VGZHaGc5cnZycllSZE9W?=
 =?utf-8?B?NWtndjRIOGJDTEQyZS9zY3dONjlCRHpqbWhzT3V6eFhHcGJicGhac3Zta3lU?=
 =?utf-8?B?dXNzUGNXaXN4eHN6V2FSd1pTU0V6clV5ZktlRk42NjNUaHRaanNLUld4bnhB?=
 =?utf-8?B?N1ROcEl4T0ZFeFc3SWJHclFmc2hyY0JmNkRJUjFhM2lpNjNDL0hEcnkvakti?=
 =?utf-8?B?MC9DSVliV0hxTTRSVzdiemo2MFM0RVJ4bUoxK1crUUQ1YzZEYjBheHgyZ3hp?=
 =?utf-8?B?azZ6RlRNTDBWbHJqdkJObkpsVG1RYTVSek1hUlh4dVBRWnJvYXg2ajRNYm1I?=
 =?utf-8?B?SUdtSVJnOU1CQkpNQjlyLzBFS1k1eVlrQndBeU9PVUhxS2dXWEh4clRCRXdr?=
 =?utf-8?B?Y1RBUFAyRmwybitaeHJEbWhDa01iTVliaDUyT1ZqODcwdGZadXo4TnpMUUJP?=
 =?utf-8?B?NFhYQTl4WHAyTExiMGg2K0lKejJVUjQ1a1pvejAwTjRnaG0wVFhsMkQ3STVy?=
 =?utf-8?B?TEt1TlJYUFZXTlBQMnlFb1RmRkpNTXVOamFQQW9qeXZnZDlUdERDN1dQQ20x?=
 =?utf-8?B?K0prNjVFME5Md0RpMXdlTjJLY1ExQVFyeTJua01CN3VzOWR3bTgzTzZzTkdo?=
 =?utf-8?B?cTk1NWJiVEdzcW9uOVdYMWhYVStRdVRscUhGTDYvR0UyOHh0YWhUd0kydDdW?=
 =?utf-8?B?SDFPbllKeVZ4NEFpZnV1a21pcDA4SWN5ZE1BWWtPVTlNU2poLytRUE14bHVS?=
 =?utf-8?B?M0xZNHJKb1FDck01U2ZHMU9lOG12dGl3d2JtbEZLNjA0VVdaN1lCdGtWV2dr?=
 =?utf-8?B?Y2sxUWc3MU1UaTVZSEQwNVkwT3JpWFdHcWd1UVJkRWk5M0xWejBISUEwcmdL?=
 =?utf-8?B?Q1hmR25sek9pMzVDcFkxTVIvRW1XazRDQXVSUUlTMUJTNmNLTllRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86a87630-61fb-434d-dd62-08da3c93d15d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 08:11:19.6326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 +cJjuMXzr8XUMHrXbasorcwDMUIY0cOu3zRsuBMijPVOynqH6UK9nFVxbrOhl8LevgOFz6xOp4xM+TPT1tb+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6468
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 08:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166002

SGksIEFsZXgNCg0KPiBIYXMgdGhlIGlzc3VlIGJlZW4gcmFpc2VkIHdpdGggdXBzdHJlYW0/IFdv
dWxkIGJlIGdvb2QgdG8gaW5jbHVkZSBhIGxpbmsgdG8gdGhhdA0KPiBpbnRvIHRoZSBwYXRjaDog
YW55IG5ldyAnaW5hcHByb3ByaWF0ZScgcGF0Y2ggaXMgYSBzdXBwb3J0IGJ1cmRlbi4NCg0KSSBr
bm93LCBhbmQgSSBoYXMgc3VibWl0dGVkIHRoaXMgaXNzdWU6DQpodHRwczovL2dpdGxhYi5jb20v
Z251dGxzL2dudXRscy8tL2lzc3Vlcy8xMzczDQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDIzLCAyMDIyIDM6MTAgUE0N
Cj4gVG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IENjOiBPRS1jb3Jl
IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCB2M10gZ251dGxzOiBBZGRlZCBmaXBzIG9wdGlvbi4NCj4gDQo+
IEhhcyB0aGUgaXNzdWUgYmVlbiByYWlzZWQgd2l0aCB1cHN0cmVhbT8gV291bGQgYmUgZ29vZCB0
byBpbmNsdWRlIGEgbGluayB0byB0aGF0DQo+IGludG8gdGhlIHBhdGNoOiBhbnkgbmV3ICdpbmFw
cHJvcHJpYXRlJyBwYXRjaCBpcyBhIHN1cHBvcnQgYnVyZGVuLg0KPiANCj4gQWxleA0KPiANCj4g
T24gTW9uLCAyMyBNYXkgMjAyMiBhdCAwODo1MywgbGVpbWFvaHVpIDxsZWltYW9odWlAZnVqaXRz
dS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gLSBBZGRlZCBhIHBhdGNoIHRvIGF2b2lkIGV4Y3V0ZSBm
aXBzaG1hYyBjb21tYW5kLiBCZWNhdXNlICouaG1hYyBmaWxlDQo+ID4gc2hvdWxkIGJlIGNyZWF0
ZWQgb24gdGFyZ2V0IGluc3RlYWQgb2Ygb24gYnVpbGQgZW52aXJvbm1lbnQuDQo+ID4gLSBBZGRl
ZCBwa2dfcG9zdGluc3Rfb250YXJnZXQgdG8gbWFrZSBzdXJlIG5lY2Vzc2FyeSBmaWxlcyBhcmUg
Y3JlYXRlZA0KPiA+IG9uIHRhcmdldC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9o
dWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uaWxlLXNob3VsZC1i
ZS1leGN1dGVkLWluLXRhcmdldC1lbnZpLnBhdGNoIHwgMjggKysrKysrKysrKysrKysrKysrKw0K
PiA+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy41LmJiICAgfCAyNCAr
KysrKysrKysrKysrKystDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251dGxzL2dudXRscy8wMDAxLUNyZWF0aW5nLS5obWFjLWZpbGUtc2hvdWxkLWJlLQ0KPiA+
IGV4Y3V0ZWQtaW4tdGFyZ2V0LWVudmkucGF0Y2gNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvMDAwMS1DcmVhdGluZy0uaG1hYy1m
aWxlLXNob3VsZC1iDQo+ID4gZS1leGN1dGVkLWluLXRhcmdldC1lbnZpLnBhdGNoDQo+ID4gYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzLzAwMDEtQ3JlYXRpbmctLmhtYWMtZmls
ZS1zaG91bGQtYg0KPiA+IGUtZXhjdXRlZC1pbi10YXJnZXQtZW52aS5wYXRjaA0KPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uN2EwZTJmZDQ3NA0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxz
LzAwMDEtQ3JlYXRpbmctLmhtYWMtZmlsZS1zaG91DQo+ID4gKysrIGxkLWJlLWV4Y3V0ZWQtaW4t
dGFyZ2V0LWVudmkucGF0Y2gNCj4gPiBAQCAtMCwwICsxLDI4IEBADQo+ID4gK0Zyb20gYjcyOWEz
NTY1MzhkNDk5ZmUyNWU4MmJmYzc4ZWE2NjNiZGFjYTBhOCBNb24gU2VwIDE3IDAwOjAwOjAwDQo+
ID4gKzIwMDENCj4gPiArRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0K
PiA+ICtEYXRlOiBNb24sIDIzIE1heSAyMDIyIDEwOjQ0OjQzICswOTAwDQo+ID4gK1N1YmplY3Q6
IFtQQVRDSF0gQ3JlYXRpbmcgLmhtYWMgZmlsZSBzaG91bGQgYmUgZXhjdXRlZCBpbiB0YXJnZXQN
Cj4gPiArZW52aXJvbm1lbnQsICBzbyBkZWxldGVkIGl0IGZyb20gYnVpbGQgcHJvY2Vzcy4NCj4g
PiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbRW1iZWRkZWRdDQo+ID4g
K1NpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiAr
LS0tDQo+ID4gKyBsaWIvTWFrZWZpbGUuYW0gfCAzICstLQ0KPiA+ICsgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ICsNCj4gPiArZGlmZiAtLWdpdCBh
L2xpYi9NYWtlZmlsZS5hbSBiL2xpYi9NYWtlZmlsZS5hbSBpbmRleCAwYjQzZWY5Li5jZjI2M2Yw
DQo+ID4gKzEwMDY0NA0KPiA+ICstLS0gYS9saWIvTWFrZWZpbGUuYW0NCj4gPiArKysrIGIvbGli
L01ha2VmaWxlLmFtDQo+ID4gK0BAIC0yMDYsOCArMjA2LDcgQEAgaG1hY19maWxlcyA9IC5saWJz
Ly5nbnV0bHMuaG1hYw0KPiA+ICsNCj4gPiArIGFsbC1sb2NhbDogJChobWFjX2ZpbGVzKQ0KPiA+
ICsNCj4gPiArLS5saWJzLy5nbnV0bHMuaG1hYzogbGliZ251dGxzLmxhIGZpcHNobWFjDQo+ID4g
Ky0gICAgICAkKEFNX1ZfR0VOKSAkKGJ1aWxkZGlyKS9maXBzaG1hYyA+ICRALXQgJiYgbXYgJEAt
dCAkQA0KPiA+ICsrLmxpYnMvLmdudXRscy5obWFjOg0KPiA+ICsNCj4gPiArIENMRUFORklMRVMg
PSAkKGhtYWNfZmlsZXMpDQo+ID4gKyBlbmRpZg0KPiA+ICstLQ0KPiA+ICsyLjI1LjENCj4gPiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjcuNS5iYg0K
PiA+IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjcuNS5iYg0KPiA+IGlu
ZGV4IDVmZWVkYjdmZGMuLmI3OTY0OTRiOGQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjcuNS5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dudXRscy9nbnV0bHNfMy43LjUuYmINCj4gPiBAQCAtMjEsNiArMjEsNyBAQCBTSFJU
X1ZFUiA9DQo+ICIke0BkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzBdfS4ke0BkLmdldFZhcign
UFYnKS5zcGxpdCgnLicpWzFdfSINCj4gPg0KPiA+ICBTUkNfVVJJID0NCj4gImh0dHBzOi8vd3d3
LmdudXBnLm9yZy9mdHAvZ2NyeXB0L2dudXRscy92JHtTSFJUX1ZFUn0vZ251dGxzLSR7UFZ9LnRh
ci54eiBcDQo+ID4gICAgICAgICAgICAgZmlsZTovL2FybV9lYWJpLnBhdGNoIFwNCj4gPiArDQo+
ID4gKyBmaWxlOi8vMDAwMS1DcmVhdGluZy0uaG1hYy1maWxlLXNob3VsZC1iZS1leGN1dGVkLWlu
LXRhcmdldC1lbnZpLnBhdA0KPiA+ICsgY2ggXA0KPiA+ICAgICAgICAgICAgICINCj4gPg0KPiA+
ICBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiMWY4NTAyODQ3NWI0ZjI1NWNjNWI0ODBhZjBjMzdl
NjFlYWI0MzAyNGMxNTA3YzhiNzVkNmJlNTA2YzA1NTNhZCINCj4gPiBAQCAtMzYsNiArMzcsNyBA
QCBQQUNLQUdFQ09ORklHW2xpYmlkbl0gPQ0KPiAiLS13aXRoLWlkbiwtLXdpdGhvdXQtaWRuLGxp
YmlkbjIiDQo+ID4gIFBBQ0tBR0VDT05GSUdbbGlidGFzbjFdID0NCj4gIi0td2l0aC1pbmNsdWRl
ZC1saWJ0YXNuMT1ubywtLXdpdGgtaW5jbHVkZWQtbGlidGFzbjEsbGlidGFzbjEiDQo+ID4gIFBB
Q0tBR0VDT05GSUdbcDExLWtpdF0gPSAiLS13aXRoLXAxMS1raXQsLS13aXRob3V0LXAxMS1raXQs
cDExLWtpdCINCj4gPiAgUEFDS0FHRUNPTkZJR1t0cG1dID0gIi0td2l0aC10cG0sLS13aXRob3V0
LXRwbSx0cm91c2VycyINCj4gPiArUEFDS0FHRUNPTkZJR1tmaXBzXSA9ICItLWVuYWJsZS1maXBz
MTQwLW1vZGUNCj4gLS13aXRoLWxpYmRsLXByZWZpeD0ke1NUQUdJTkdfQkFTRUxJQkRJUn0iDQo+
ID4NCj4gPiAgRVhUUkFfT0VDT05GID0gIiBcDQo+ID4gICAgICAtLWVuYWJsZS1kb2MgXA0KPiA+
IEBAIC01OSwxMCArNjEsMzAgQEAgZG9fY29uZmlndXJlOnByZXBlbmQoKSB7DQo+ID4gICAgICAg
ICBkb25lDQo+ID4gIH0NCj4gPg0KPiA+IC1QQUNLQUdFUyA9KyAiJHtQTn0tb3BlbnNzbCAke1BO
fS14eCINCj4gPiArZG9faW5zdGFsbDphcHBlbmQ6Y2xhc3MtdGFyZ2V0KCkgew0KPiA+ICsgICAg
ICAgIGlmICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2ZpcHMnLCAndHJ1
ZScsICdmYWxzZScsIGQpfTsNCj4gdGhlbg0KPiA+ICsgICAgICAgICAgaW5zdGFsbCAtZCAke0R9
JHtiaW5kaXJ9L2Jpbg0KPiA+ICsgICAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7Qn0vbGliLy5s
aWJzL2ZpcHNobWFjICR7RH0vJHtiaW5kaXJ9Lw0KPiA+ICsgICAgICAgIGZpDQo+ID4gK30NCj4g
PiArDQo+ID4gK1BBQ0tBR0VTID0rICIke1BOfS1vcGVuc3NsICR7UE59LXh4ICR7UE59LWZpcHMi
DQo+ID4NCj4gPiAgRklMRVM6JHtQTn0tZGV2ICs9ICIke2JpbmRpcn0vZ251dGxzLWNsaS1kZWJ1
ZyINCj4gPiAgRklMRVM6JHtQTn0tb3BlbnNzbCA9ICIke2xpYmRpcn0vbGliZ251dGxzLW9wZW5z
c2wuc28uKiINCj4gPiAgRklMRVM6JHtQTn0teHggPSAiJHtsaWJkaXJ9L2xpYmdudXRsc3h4LnNv
LioiDQo+ID4gK0ZJTEVTOiR7UE59LWZpcHMgPSAiJHtiaW5kaXJ9L2ZpcHNobWFjIg0KPiA+DQo+
ID4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPiArDQo+ID4gK3BrZ19w
b3N0aW5zdF9vbnRhcmdldDoke1BOfS1maXBzICgpIHsNCj4gPiArICAgIGlmIHRlc3QgLXggJHti
aW5kaXJ9L2ZpcHNobWFjDQo+ID4gKyAgICB0aGVuDQo+ID4gKyAgICAgICAgbWtkaXIgJHtzeXNj
b25mZGlyfS9nbnV0bHMNCj4gPiArICAgICAgICB0b3VjaCAke3N5c2NvbmZkaXJ9L2dudXRscy9j
b25maWcNCj4gPiArICAgICAgICAke2JpbmRpcn0vZmlwc2htYWMgJHtsaWJkaXJ9L2xpYmdudXRs
cy5zby4zMC4qLiogPg0KPiAke2xpYmRpcn0vLmxpYmdudXRscy5zby4zMC5obWFjDQo+ID4gKyAg
ICAgICAgJHtiaW5kaXJ9L2ZpcHNobWFjICR7bGliZGlyfS9saWJuZXR0bGUuc28uOC4qID4NCj4g
JHtsaWJkaXJ9Ly5saWJuZXR0bGUuc28uOC5obWFjDQo+ID4gKyAgICAgICAgJHtiaW5kaXJ9L2Zp
cHNobWFjICR7bGliZGlyfS9saWJnbXAuc28uMTAuKi4qID4NCj4gJHtsaWJkaXJ9Ly5saWJnbXAu
c28uMTAuaG1hYw0KPiA+ICsgICAgICAgICR7YmluZGlyfS9maXBzaG1hYyAke2xpYmRpcn0vbGli
aG9nd2VlZC5zby42LiogPg0KPiAke2xpYmRpcn0vLmxpYmhvZ3dlZWQuc28uNi5obWFjDQo+ID4g
KyAgICBmaQ0KPiA+ICt9DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KPiA+DQo+ID4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNl
bnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE2NTk5Nik6DQo+ID4g
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2Fn
ZS8xNjU5OTYNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tdC85MTI4MzM2OC8xNjg2NDg5DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1j
b3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gPiBb
YWxleC5rYW5hdmluQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+
DQo=

