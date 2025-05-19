Return-Path: <Oliver.Rohe@wago.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D3BC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:14:43 +0000 (UTC)
Received: from mx07-005c9601.pphosted.com (mx07-005c9601.pphosted.com [205.220.184.198])
 by mx.groups.io with SMTP id smtpd.web11.48698.1747653274351867463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wago.com header.s=p012021 header.b=kklcMwis;
 spf=pass (domain: wago.com, ip: 205.220.184.198, mailfrom: prvs=12349d6b02=oliver.rohe@wago.com)
Received: from pps.filterd (m0237840.ppops.net [127.0.0.1])
	by mx08-005c9601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J2mJmm023582
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 13:14:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p012021; bh=cH
	Nwh7qNVgBjGG3H1kfo9hvG79zjVfC8w5cT1Vwa+Dc=; b=kklcMwiszJu0vds0XM
	XQxvtbzuBoxiUf+jXnrJiij/TKPSy8ASpTquPOnbwqoK9hUVJpgNdPAYXbuV7NHN
	wjVoybj1cR46/PMm72qrp9qeBmO68/d4N99B2SCbz+6jwNUU0DEyw4nuThqdPPOs
	uBBWjMMcQFEz4jjmDGPDIIhPSNxM/c5ZCoC8sHMzazmEvDeZHnJtkTHMZRegERAP
	jOFVaheLp6HqFYB5OC3kNt4LF5nLM4LTsf8FJUpDLiDfq3VI2ISB+t1rsu8t5D5R
	cs5vC5gOypYTIJWE6gZS+Kdw+UHDYs6NNbcOC3A0y8IzETjZ8mVNOAHoYbt9J8w3
	Iw7Q==
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
	by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 46pgansxj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 13:14:32 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8rW5SbKcH6t8nAU/IVIFrFa/KurfjHYd4adYcZ1zvLRIAGzbMjKi1QSGMDA9epp8BTi23ZOFTydTEDVehTtps7b2duTKXDHt8ZzVqrlpdr1JCVA+MrYjlL6dknW0q5U4foNYJ04czUZOOtjqWd+NoU6j7xGdt+6yT9o6+A4Gm2edovGS+i40s7+vXWywShQgd3NuZg4CQifUw10BDk/wwG61xwR75UzsqpFmSp61uQRNKIVPOVQHYLPQOFD0+Lo2OTe4fLQ6uLxjXONt4LbWhucgllzzZGmBA+BRdZJ17RMpV2BcjU2Vim1TUcYzaCV5PgGgyUj/Sfo3vyGATsOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHNwh7qNVgBjGG3H1kfo9hvG79zjVfC8w5cT1Vwa+Dc=;
 b=UH0cssBkPMEDiEhBJR9cnRDcJaTLPOH7vlgSCk20xZpaj/CCo0oQ3UAG7OxfkIZABjYz3sm1RqZaYXHuL+9aQZx55Lp8z4Z6SaVmW7tyfIR9bMfh3BzLt4wO8fYvdCCS/aSgba03DTn92dPjR+iuYfi8ntcAuLoiLncn7sW6oFhKWJmZiAU0d2s6NAhD3ey0Gi/FRo8kD89UtTrsgX8lvIU8EAL12DuMMEt2LO3KRXT3MnlHKZddMSX3XQIEbdXHdx502QZ+TRCPFlmrbd/kl0TCRPibY9GSooLha3WCswnqN4yy8C/7YpmspGToq4sKqipFzPkgXkTu6v+W6+YQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8)
 by AS2PR08MB9390.eurprd08.prod.outlook.com (2603:10a6:20b:596::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 11:14:29 +0000
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99]) by DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99%4]) with mapi id 15.20.8722.027; Mon, 19 May 2025
 11:14:29 +0000
From: Oliver ROHE <Oliver.Rohe@wago.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [scarthgap] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Topic: [OE-core] [scarthgap] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Index: AQHbyK8wuuk0gmzqn0aP7Tt6e+zNjQ==
Date: Mon, 19 May 2025 11:14:29 +0000
Message-ID: 
 <DB4PR08MB8102778287B8B1408AF455BB9E9CA@DB4PR08MB8102.eurprd08.prod.outlook.com>
References: <20250519110649.35526-1-oliver.rohe@wago.com>
In-Reply-To: <20250519110649.35526-1-oliver.rohe@wago.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Enabled=True;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SiteId=e211c965-dd84-4c9f-bc3f-4215552a0857;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SetDate=2025-05-19T11:14:29.073Z;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Name=Internal;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_ContentBits=0;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR08MB8102:EE_|AS2PR08MB9390:EE_
x-ms-office365-filtering-correlation-id: c71e4650-06a2-48a5-83ba-08dd96c652f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?uynswo2p6nO/ZmVYQnQ9B/9we2rQ+zhLyJs/xiD0SFd7QOVxVfuasW7MeB?=
 =?iso-8859-1?Q?vUefCTdaWMLYiYfzWGRFSxEbU0QCgpMD0oEkj7S0Ekgn4tuf9Q6Q+EhnxQ?=
 =?iso-8859-1?Q?13bdlSgnb1W4LBRf7/MiMP6OFZ31tgQA0xwFt8Hj255V/ku4Em4KVg/mqa?=
 =?iso-8859-1?Q?/ic+Lhrb2FJg0b9YnVM2tvT2g1+HhyM1AQTxTqSkyH+mFNsgsiE2tou/MF?=
 =?iso-8859-1?Q?3NMg5gpZy2U3QjqFeDEOWlmdyY/zHcWCANcIYLtEu9GVhrFOZ1kUzV4Hk0?=
 =?iso-8859-1?Q?4N9aLRnPbXnZayB5Gg5AnPowTWfLjyunNXvpUQubzHewT/bJKpbTIXCA3K?=
 =?iso-8859-1?Q?Rhz+c1MYeOROYq7bxZisMyFj3QUJ/4e1BTfDh775TInnEiyxqSD5XOMfTb?=
 =?iso-8859-1?Q?Fnx2rsEpBxNEO8/28mTgeQpJnzirGiSA7JWmX1A5eTVU+/RrMh5j9Op4DQ?=
 =?iso-8859-1?Q?WwgqgG/RzXCkahgSww09CMxqhPM9VPd8DwDNIbEbAQGGU+mDbZwYut8wT1?=
 =?iso-8859-1?Q?uaQuVXxkB1OLqLH50BkCkz6pDZttOAzS7DB+t2bV7D1s2kv74xGc76vnXK?=
 =?iso-8859-1?Q?v2xmOnwiYCUfwjztTPJXsLlGGZMUZH6SA/DAwVpfhdj5UoavPtg66scGFM?=
 =?iso-8859-1?Q?Hpjy9mBXRZZIQGd4TGZbUfqrXhvSnOvnIkdtqxe9i4c2XyNyWppIsWrDrL?=
 =?iso-8859-1?Q?guWtCQF3HyHYb5LILjO7E5scbPHOVEDMBk0YTR9Q8bVFQbd2qvp6b6fOn3?=
 =?iso-8859-1?Q?JsFL5sPL/MAd5k69yNpBHi4aEPOovG4F18U7MTBDMuuxLxM2pAihbMCIci?=
 =?iso-8859-1?Q?xDe6zz2rTVBKAz37mEm9c41lzcw9vO6UxJKX+UA0oYaMf4Ya75GCtMw7xX?=
 =?iso-8859-1?Q?BkuFqaiDVzfgVEFozWvueUKVGQM4RR1p6CAA+Hb854G6BQzf0qVgt0AH5r?=
 =?iso-8859-1?Q?Xocz8PAOJh5CJFUNstbi2lzxAWIzesaD8ZHktFCTIBc1iQeiQFd4tRmq/h?=
 =?iso-8859-1?Q?37/jS+1GBR0obCbONKcDdNQnBcFcrSya9wRbQFMUsM4259trErftjJ1PaK?=
 =?iso-8859-1?Q?/DJfhhX9MNK29aTKP5uHEH/5ezkA+XfwkAnWBQFHLifHv09dsTTc10HgLH?=
 =?iso-8859-1?Q?KbnFhQaeV3mB4FBTR+U4PMKo63wvp2v+DXnIth2+StNKbOeng2xGS72fF4?=
 =?iso-8859-1?Q?chyfIWC/1AJX8b/YtON+mvx0xKTiKhyUN3zzRPlLmO+N7SlIQMhryXCKfk?=
 =?iso-8859-1?Q?xRNi5T/GVGcDgByfnn1PzYmPDcNKj6sVeuRtJXmzv39f1HCkgKaM9W+Unn?=
 =?iso-8859-1?Q?lVcuE8pCL4Y/czCRGDwWegEmOrdvsb+70cEuz8Zpml8XdsTAcSZRibKwWD?=
 =?iso-8859-1?Q?ddIWDfx8bECyz4j74fy10Q/rDj+nXDDRK/jRP1tEK+YTLX/TgRSpRmaZQb?=
 =?iso-8859-1?Q?thlrzQiQ1LzISEZaaY6Ornum1Bd9LLaLOsAO0A+ReN3Eb66VmvQ/yw2P4/?=
 =?iso-8859-1?Q?ItHXRItw8rb5gQ5AHOJuvWdt+Xzd8iGbMd4ezPVwdSsQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB8102.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?aV2Oixam0MB9+RnJAJdqhdIHwdUWKgzjgpfFcyQfhbcDtLkZoTJ+noZBkJ?=
 =?iso-8859-1?Q?KSNjuKRMuyiLFNJIvaW0q4Pd/K1WtiKJ7Rb17drQ29dJNFarxCXvnqKpFZ?=
 =?iso-8859-1?Q?ETGTHFTh/daitwnwnbS6yAjziiUPUIVlFODKdchlMzNPFCdWsZC3VMaN5F?=
 =?iso-8859-1?Q?J1aaQA9uPthfr4ll26MQiVzSC7/02WC9zCP4Zrjt0ngJ21E8lBjjc2mZ5Z?=
 =?iso-8859-1?Q?nqc7SQbz+jveDEa6a7mgVwBTmoKQKdDlol+0h+TbDwc4E8eK7HQiox2HHu?=
 =?iso-8859-1?Q?8Z8OXIPcBt/xVntRYp2KSKpypEXgkEnoKm5hHaYO8w753m3zMBv2VxID5b?=
 =?iso-8859-1?Q?7VW9yJA3l1B7pQqEo6cP5SUE6aUHZC/jo+UlFpfuOt1j8rayrwjgMuPALm?=
 =?iso-8859-1?Q?Hbep9fCO/Bcn9J8tOj/9j77qGcHJlNczacLHrrP6s6tOueasvYAxGzw+FM?=
 =?iso-8859-1?Q?DrnNxXrnIzeYYb9q+fVXTWWP8XS6cJfJt91XTcRqfKmuhBApUhMnFs4RR+?=
 =?iso-8859-1?Q?Z3TOpQduFMgulSkSbSFKQK6fiVt7G7bEq3/myZ4FyCZLACTxjYtwStHJOM?=
 =?iso-8859-1?Q?xJQDZNpz2r0JgXQebbGAbzxZ2x6UkDD02fYTWEE6F0bxCsQ2jhVgvA9YR5?=
 =?iso-8859-1?Q?ohrU0+5ZzVi7kFaIJhvW5zfgh2hM0S7M6VpOMxluh6LUYzMEXheKWvXhNb?=
 =?iso-8859-1?Q?vPDM/fa+7E2k/411y/D2xVX7R3BflROuGl3BR5T+NuRuu4tV7lYJ9K2x/q?=
 =?iso-8859-1?Q?3OOc7+kCTvJCqLVgdn00v49rfeEn5oV0aEceX3U4rTIU5Qq3BCnWUCPTzP?=
 =?iso-8859-1?Q?I0jxbGLeha/KUOt9mDztGM/R+4k1NiOLMQUQsAtbhYJy0I+Z+xXKmivAdI?=
 =?iso-8859-1?Q?0BfLgVd21f+Faa0P1i/VQ2RgNlXFMvYWyy8Hu4/voLyT2K/Pc4ugn+7OmN?=
 =?iso-8859-1?Q?n81YohFIrLsr2/PjExmMllzSo2NJFNmYzo8ynuVNEJuN3IU/9x2X3QSSM3?=
 =?iso-8859-1?Q?iEXSutyea+PRBP+gVWfv5zLUj6ZyhqdyV15yg/KaP60vgIJvckDER0wi51?=
 =?iso-8859-1?Q?rjaoA04LD5xsP/VDVupBahthvOII0Df4Mpf3da3S7ohyEu9wrEKH4IshOB?=
 =?iso-8859-1?Q?L3NSo+TClIAB6gwaEExcWHEPXjcs/vhQSue494Dk2ZwpHCrKnl7CDHBJIJ?=
 =?iso-8859-1?Q?/Vk+o3X73O4SyI4yVkOMX1JkMCr6h/Yr/cNQzmh8TmryeU04HFOGiD9QY+?=
 =?iso-8859-1?Q?BaIxqEOGVVez9QFUpW4Rljr4x8ndNXZ4bTMnxABHvP9I2G8l5VwcxRp0+s?=
 =?iso-8859-1?Q?wV2evbPHz+MVvy0cCLrSjrvEt3zC7U6Tq3Er+hIqCbGORRaGCeNfWTZQwr?=
 =?iso-8859-1?Q?2GmPbwzRSVIglQdwAtxcrDK1lDKuOcGUzvBOsVpvHf/gzyedb+IZDQ0fYx?=
 =?iso-8859-1?Q?BZp/8P4rSS7+oolSHDOEhdQh1ErdNYD4g+yvDVFuU+OSQOcSwll2FtrITa?=
 =?iso-8859-1?Q?UIdeNC7h08s6fKMU8h/N9JrMzlfVPi1eSe9VW0JSB2b+6G82RuwRvfDzYH?=
 =?iso-8859-1?Q?ZPsAfDiTsCOA4bgaKvQc4xdq80Otshf6eyU7y8vwiXSdTBVt2YfzTlGWDG?=
 =?iso-8859-1?Q?Z3Nb7xI0uWSaU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pp8W0KH8V98w0vXny6TW8KfF+zRpMQ77Bt69MqbcrQN3BbCeGLGhPKlkDKImcKRogtD1KMSkrD0qidpDfM7CCzgugczLGy9RWdF0Fnuahmds5BA0Lgqidvi7dNyaoZ/MIv7Qqg5wXTWzML0IqJvNOe27pDseeZrdZW4a1u42me3pkLzo7yByDNmO36+cFhd2suXPOWmWtUmYzkIXGeP/TTbgnhM02tQExmtMSQli3ulrXrGNacCPR2yFpkAeMvVn2WdHsiAOVlkwF2zv0PImU/mpiOqM4JWtUEyxKCfWmXeEncwDD+15/K/g9tRzigr+PincFfVChBxqa43gXdPer0+skGNLZcZGCCvpZqdoz1yNMFIRtDXZzCyucaa0W33oo2CwA4lpsgaKPQ9W/V3X563fhV0uKez0j7bq7BUjs/l1qrPFHAYXvSeDz/izxvDPUyREtBLE3QqrDn6AdFVC7WIGu/GbeBXBpZJj0Z6tQoTp+13rQhTCVcy7zXzdwANoB6sngljl4Qc+fZL9yOJE6j5WDst//aKKn3IexhKC1XmyTHQSiO9E9Y7w2OqDA6Ue2AqVuEfhLsd27FtH7F/mOIGyurjs7uLPGFWOe/wyt/W2kqN+BdwpcybpWJP5ppWH
X-OriginatorOrg: wago.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB8102.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71e4650-06a2-48a5-83ba-08dd96c652f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 11:14:29.5749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rqx4r8FsAeaURlK+dJKDGD6au1fUxHhq0/3s9muQeO7hUtUmdDD/pdZFPle9Xr0YjG/6O0hhj8ZQTr6XqU2Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9390
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNiBTYWx0ZWRfXxnbjzkXgiLFr b76OwDVEXXlZxEZ+WVj0s1yvcWDVJRYzhxsUeMLo8T5A98e0Jrj9X2khTsIuJTA8UXyQftB/3nX c7k5LnPKI7cicGe7sXZxU1aF60QJ+yfwGWe3BdBazoy+KzY1FZosGd9IPJKFESDnynIzaG37trx
 QQ3kpR9ytu5nVTRKjWKqZiIStPA+81B1BG4ZWh7aLiA9lK16SNYDzbrb6eWwFaUJSEMs6U78q30 tCuBoy0fmH235YCOvUdYTOu/3Xx4SoWgXwKOdE75rg/HzQu7rJW26sjXHjAqcLuspvDeHMPCE/k v4D5e8EW8hOXnVQRlWcnvHr+uBdShxWDDyrBKpBsJ8oclNvoK7GmPjKApZwwT2j5P5YbuPMvaLE
 TQIEFDqEKM3wM6ooTxcwRcJ2RefN9hymInRU6xDDYEjcu7Th16q1IwR3C+qHkZD22p6geKyn
X-Proofpoint-GUID: 7IsYwV942Ef0ff89hEulSjYLoXn35ayV
X-Authority-Analysis: v=2.4 cv=MqJS63ae c=1 sm=1 tr=0 ts=682b1298 cx=c_pps a=ujVtL2Xc6AYuIgh9KuiIGw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=ThMX_IV2AAAA:8 a=P-IC7800AAAA:8 a=F6jVfZyWCpEgZ7UAgEgA:9 a=wPNLvfGTeEIA:10 a=0jcnvs3wCqEDeep41k2a:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 7IsYwV942Ef0ff89hEulSjYLoXn35ayV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505190106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216854

This allows to provide a custom label for each dtb
without having to overwrite the whole function.

Signed-off-by: Oliver Rohe <oliver.rohe@wago.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 25 ++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 4b74ddc201..53b5acb0fc 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -382,6 +382,15 @@ symlink_points_below() {
        echo "$realpath"
 }

+#
+# Simple function to allow overwriting the configuration node label
+#
+# $1 ... DTB image name
+fitimage_emit_section_config_dtb_label() {
+       dtb_img=3D"$1"
+       echo "${FIT_CONF_PREFIX}${dtb_img}"
+}
+
 #
 # Emit the fitImage ITS configuration section
 #
@@ -442,7 +451,7 @@ fitimage_emit_section_config() {
        # conf node name is selected based on dtb ID if it is present,
        # otherwise its selected based on kernel ID
        if [ -n "$dtb_image" ]; then
-               conf_node=3D$conf_node$dtb_image
+               conf_node=3D$(fitimage_emit_section_config_dtb_label $dtb_i=
mage)
        else
                conf_node=3D$conf_node$kernel_id
        fi
@@ -480,13 +489,13 @@ fitimage_emit_section_config() {
                # default node is selected based on dtb ID if it is present=
,
                # otherwise its selected based on kernel ID
                if [ -n "$dtb_image" ]; then
-                       # Select default node as user specified dtb when
-                       # multiple dtb exists.
-                       if [ -n "$default_dtb_image" ]; then
-                               default_line=3D"default =3D \"${FIT_CONF_PR=
EFIX}$default_dtb_image\";"
-                       else
-                               default_line=3D"default =3D \"${FIT_CONF_PR=
EFIX}$dtb_image\";"
-                       fi
+                       # Select default node as user specified dtb when
+                       # multiple dtb exists.
+                               img=3D$default_dtb_image
+                       else
+                               img=3D$dtb_img
+                       fi
+                       default_line=3D"default =3D \"$(fitimage_emit_secti=
on_config_dtb_label $img)\";"
                else
                        default_line=3D"default =3D \"${FIT_CONF_PREFIX}$ke=
rnel_id\";"
                fi
--
2.43.0



Internal

