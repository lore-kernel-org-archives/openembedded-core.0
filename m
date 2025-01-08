Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FF4E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:20:10 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.12617.1736316427073393984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 22:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=d8aupqsT;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: mmeerasa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5756; q=dns/txt; s=iport;
  t=1736316427; x=1737526027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zee0DO7Bm5xmnNjMDaOd5cwVvFSPnpDuScqAGpgCCEw=;
  b=d8aupqsTuDiUHO5rv37U8TxkXKbyUneI6JK9iH8+8LLA7EbJcDcbLFoF
   4mypGQdmuScNzs5S76J0OO/kTDrfCvXKRGv/1H0Na9z4WrGjueejtBS98
   UBsDkHEjhimtDMhuNpV13ppmUIVXQ0Bm67RVwxr/q2mbURD5AYexLNjVG
   Q=;
X-CSE-ConnectionGUID: dO6zkeOWQBuGvwYxoZNlAg==
X-CSE-MsgGUID: QJ0QQb+xQmu/jQNcw/89fQ==
X-IPAS-Result: =?us-ascii?q?A0ABAABIFX5nj43/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBGgUBAQEBCwGBcVJ9gRxIA4RSg0wDhE5fiHIDkUqMToElA?=
 =?us-ascii?q?1YPAQEBDQIuCwsEAQGFBwIWil4CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFFAEBAQEBATkFDjuFew2GWgEBAQEDARERERcBAisMBAIBC?=
 =?us-ascii?q?BEEAQEBAgImAgICJQkBFQgIAgQOBQgVBAGCXwGCZAMBEAalQgGBQAKKK3qBM?=
 =?us-ascii?q?oEBgygBOQHcPRiBAi4BiE0BgWyDfxuEXCcbG4FygVd5gW8+gmEDAQGBNCsVg?=
 =?us-ascii?q?0Q6gi8EggQCEhscLxAKgREBgQoCAgICAgICAgICAgICAoIZggCCBwIMA4FnZ?=
 =?us-ascii?q?3WBRoELgiQvgQaFTYNshlUJSXscA1ksAVUTFwsHBWRFHysDgRQmgSsFNQo3O?=
 =?us-ascii?q?oIMaUs3Ag0CNYIefIIrgiGCO4RHYS8DAwMDgzyFaIIXgWsDAxYTgn0dQAMLb?=
 =?us-ascii?q?T03FBsFBDp7BZptATyDbgEOZgcTCCICBB0uCyEVCAE0GxoRGRErkyeDQa83C?=
 =?us-ascii?q?iiDc4wYjTiILBeEBIFXpHiYfIJYiyyVKYFFhBECBAIEBQIPAQEGgWc6gVtwF?=
 =?us-ascii?q?TuCZwkKPxkPjjqDYYUUsGF4AgwuAgcBCgEBAwmPH4F9AQE?=
IronPort-PHdr: A9a23:9cbXdx2tzc7/7eVAsmDPmlBlVkEcU/3cJAUZ7N8gk71RN//l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:ZcCLHahFdisXdji/gileKBqmX161fRAKZh0ujC45NGQN5FlHY01je
 htvDG/TMvbbY2rxe9t3bYrko0IH6sWExoI2QVNspX0xFypjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOCn9SQkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZSFULOZ82QsaD9MsvrT8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUU3bhlAmxpy
 sUyNR8TcSGTgNCQxJu0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg5/5JEWxI9EglH6djBVsluOrII84nPYy0p6172F3N/9JoTVGZQIzh/Bz
 o7A113bWigjPp+P8D+YtXCVoOTQ2nOqVrtHQdVU8dYx3QXMnTZMYPEMbnO8ufS/h0u0Vt5TJ
 kBR8S00oIA29Ve3VZ/6RxC+rXuOsxIQVtYWFPc1gDxh0YLO6AqfQ2xBRTlbZZl+6Ik9RCch0
 RmCmNaB6SFTXKO9RVXD5LSZigyLEzU6M3AzdSg2aw8s7Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBTSYZ1N16bnMI3loTj6byKQm3TfcuIiCuzqsoOZAuFROdTNi2+AsASzARN8wGCxFQbpU
 J8swJf20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN8LvmsheBg1bJdbJlcFh
 XM/XysMtPe/21P3PMdKj36ZUZ9CIVXITI68D66IPrKinLAuJFfboUmCmnJ8L0i2zRBzyvtgU
 XtqWc2tFn0dQb921ya7QvxV0LkggEgDKZD7G/jGI+Cc+ePGPha9EO5dWHPXN7xRxP3f+m39r
 Y0AX/ZmPj0DC4USlAGLqtZLdTjn7BETWfjLliCgXrfeclc+RD56VqK5LHFIU9UNopm5X9zgp
 xmVckRZ01H4w3bALG23hrpLNNsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:W/SPMKnCVZwQ3NWRBM3GLBDz/ELpDfNpiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj/fZq9z/JICYl4B8bFYOCUghrYEGgE1/qt/9SAIVywygcz79
 YbT0ETMqyVMbE+t7eE3ODaKadg/DDkytHUuQ629R4EJm8aCdAE0+46MHfmLqQcfng+OXNNLu
 vm2iMxnUvZRZ14VLXdOpAtZZmxm/T70LjdTVotARkh5AOSjTWuxoLbPnGjtCs2Yndk+5tn1X
 LKvTDYy8yY3s1TzCWy60bjq7Bt3PfxwNpKA8KBzuIPLC/3twqubIN9H5WfoTEcuoiUmRUXue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgEHkvdfySFsBeoh8bMNiA17kAngbzZZBOZ
 FwriSkXl1sfEr9dRHGlpz1vtdR5xKJSDQZ4LUuZjdkIPsjgfdq3P4iFQVuYdc99OaQ0vF7LA
 GoZ/usvsp+YBeUaWvUsXJox8HpVnMvHg2eSkxHocCN1SNK9UoJhXfw6fZv1kvozqhNAKVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOVfUki956Lf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCG2XCjryMtZ+59l04eMCYbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7v5IW7nCe9yrkTDsllpWA8jueEuy6EGsgi107f2w6XRx5jmTMo=
X-Talos-CUID: =?us-ascii?q?9a23=3A+EYLrmhnxMO1l2aElExmxXyASTJuflqD3nTdBHC?=
 =?us-ascii?q?BI3tGVqKkWVii3qdNnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2IOg+w6pTMCm9qvoZPhMjgiPxoxRwfyXMUpOgaw?=
 =?us-ascii?q?Dpo6GDAp7JHDN3TqOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jan 2025 06:07:05 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B3163180001A2
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 06:07:05 +0000 (GMT)
X-CSE-ConnectionGUID: BQ66Who5Rr+SN7YaGvfrtQ==
X-CSE-MsgGUID: D/cnfhaNR9mmECinqcJxlQ==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.12,297,1728950400"; 
   d="scan'208";a="31200359"
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jan 2025 06:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oi4RIseNyPD+NjIBMxf9YZwOrq7TkhRwhVjHNZawDvR/D/PmyPxkYdCPt34vw1uaKslDOQCKiXEvD0wqZmRWom3EzyEU3eMh3cbdMPPf1Ik6h9BvUfhhxelKtAi/R1wU9GiTqpAG8gFjQsk1AZ3gXlkr3CzpYHKEgQL6QRGXnB9xdXJfDFZ43UsaC5TsBWRZQ5ldLmIvz0c3VMgd4cNWDqOmJSQLPv5vcfcPIjtZJccMqVIZL23xEbDRISRmfQjgLJ2LX/EPriKS6b881hkmMPgxmOArDxcoGNTP/AXZt9HHJTkKEKrn1sE6nICSMqoAoKhhAHCVDd/rIynJhTyqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zee0DO7Bm5xmnNjMDaOd5cwVvFSPnpDuScqAGpgCCEw=;
 b=LQaJ6KbLdu70PVXxRpdfDFU0JA6wOiOVfuIIg5vqsdyY4PousB462Ho+kt5kdqZGxv0EsW3oRM/e7tXe2GRGzMjiP0Ad+dRVwf4yUfN3mJiDy9qL5+Pyy7uXr39aTl9ZW8lU/v1SjMBoj0XBn1E44gInBatdVtQddrUWD1INE0I3D6iDenTw05NiwS3wsUVM9FoxlYD74V97ed3B11gglgNfNKJs9Wvl5Ctlk1x+FIfGQkUvAYAieaZ1HFnPJUoz48Sri78CtQ9WMAvXtF0MyRkqY9HxieMtEiBMhOSqgoTtyn7QVGK/6jDQXidfmmcEBzAboRjyfMndQGJaphE/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from BL1PR11MB5398.namprd11.prod.outlook.com (2603:10b6:208:31c::8)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 06:07:01 +0000
Received: from BL1PR11MB5398.namprd11.prod.outlook.com
 ([fe80::ee1e:304c:703a:275e]) by BL1PR11MB5398.namprd11.prod.outlook.com
 ([fe80::ee1e:304c:703a:275e%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 06:07:01 +0000
From: "Mohamed Meera Sahib -X (mmeerasa - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <mmeerasa@cisco.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>, "Poojitha Adireddy -X (pooadire - E INFOCHIPS
 PRIVATE LIMITED at Cisco)" <pooadire@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] db 5.3.28: Ignore multiple CVEs
Thread-Topic: [OE-core] [scarthgap] [PATCH] db 5.3.28: Ignore multiple CVEs
Thread-Index: AQHbYMdox3mRHFcHiEmphqP36/N+/7MLVfyAgAEOjyA=
Date: Wed, 8 Jan 2025 06:07:01 +0000
Message-ID: 
 <BL1PR11MB53986AB203FEA209F95E4A64C1122@BL1PR11MB5398.namprd11.prod.outlook.com>
References: <20250107054539.4002240-1-mmeerasa@cisco.com>
 <CAOSpxdb82DqKg6tQG0wcO+rpTeFGF3mEpABprEu=NpFFgJEE4w@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdb82DqKg6tQG0wcO+rpTeFGF3mEpABprEu=NpFFgJEE4w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5398:EE_|MN2PR11MB4664:EE_
x-ms-office365-filtering-correlation-id: 0e7ab592-732d-4242-4f49-08dd2faaab01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?anlFZXJCdG9VN29qa1UvalEzNEVlbTFENHQxTmJxTm85TllqSHdkRit3NkpV?=
 =?utf-8?B?SEFKQ1lKVG5LUXRQRytHdTVnQmdxRVdTSFpiZCtXQ0NmaFJQQmxFSFZ6cTFq?=
 =?utf-8?B?NlRxM0F3OEluYnRUa1hvRjVsM0lmVENUTE5FdHJHbTFudkRuNnE4NGpPcGp0?=
 =?utf-8?B?WERvT0lOcE5VTVNZeGpIdVlEM0w5K0szWlN6SGc1aGtXY2RUSWtYa3hycmtu?=
 =?utf-8?B?SGQ4Qk0xbGxTVEdNMEZVQ0poem42VlZXN1hGU1hWRG9QUFl6Qmw2bjNJZ1Vp?=
 =?utf-8?B?bWxWMDloNVZrZXdIQjB1bktJUSt1VExRN2VEVDR3TmpkbWJWcWI0N0oxOFJE?=
 =?utf-8?B?cFRoVzg2NThBUUdKUTR3andSQWJKaFl5V0NDSWVEOTJxUnh5dGdqbmowbE9J?=
 =?utf-8?B?OWZSeS9DS05kb2I2clhsd3JWWHVDa2xDMjB5aU9UZ1M0b002OVFIUFp4c2hx?=
 =?utf-8?B?UGZpMXRjTkVzbHBkQnoxOWJYd3ZlaDBKQzlJS1NwTGQwbW5jTkdPQWQyQVRj?=
 =?utf-8?B?UFhUZmFXemg0SGNRWVlESU1XVlkrTlRneGVrQWdvUStzdmw4dEpoVkZEMnZP?=
 =?utf-8?B?dmdTS0xIU1BIeThzUDRmeTRmWmZvd1NqZGltU1g1RnBZdjcvOENsaFViRWJh?=
 =?utf-8?B?b1JSOE1PdHV5VlEvYmpBWWZPZkFTcXpxSFE5UjlRRk1ON1AxbjFEbnZHMHNr?=
 =?utf-8?B?SFNRWFVTSzdGK0VnM3BGSVNEQzdVUzBkSW50MzRyeXcyWCs3amVMU3lVOTh5?=
 =?utf-8?B?a2d4OU1Gd3E2TFNyU29rYkFSakppSWhpK1kxd3UwQm1aRmhyVm1mTlFxVFNO?=
 =?utf-8?B?eUhFbjF6MEk5NzkzNTNaTFZKN2haeXdoMDBsdnprUVgxeXpYbVhianJ2SmxW?=
 =?utf-8?B?VUUwanR2eFVkRU14Zlg2aGw5QkZWKy9CUGVENTIyUmYxeFI2M1ZJN3VneDI2?=
 =?utf-8?B?MnlRRnluTGtkeTQ1QkdjanVvWHJnTnc3aW84RDdhT1FtekdidG0ySHgyS1J1?=
 =?utf-8?B?QmVmZUpzYnY2QjU5SjN5enZQaSsvZmh1c1g5eTVvbURYL1NDMFZDY0kyWmVi?=
 =?utf-8?B?MHZza2g0TVFuSFh6Zmlzanh3TnhCSnYvZHQrWFNrTC9vYlNEaFl6TE0zSytD?=
 =?utf-8?B?Ukd2MUwvQThRVjJaMkx1RTlLZ2orZENGclRaM0NEQkhJa20yUXlNRmpKU3JF?=
 =?utf-8?B?KzlCZTkwWit2a3NnQVNlaDkzemIzOThhdnVaUzNFdndXd00zaURBTzQwVlAx?=
 =?utf-8?B?bTJHVWVrdlNnbTZJVERtbHZsSng0akZqTVVwdWt2ZVFYSkNaRzdPZE0yRGtx?=
 =?utf-8?B?M3grUFhuK1Z3QzZwK084VStSMCtKVGlBaUFhMFlsWTdwcFlGTWlSc0RQR05V?=
 =?utf-8?B?SWlzYW5KemtRN2hsYll1dzV4eHFRSkhlZTJoMVU3RW5NRDlYdm1wRDV6SHlt?=
 =?utf-8?B?Wk04Mk1McXBFTFc4R1JsNG1OWWNvN2svTDFDcUtzalJsdlUvTmk0ckJFVHFo?=
 =?utf-8?B?eEF2M2wvazQ0T0dXcFhxc1VndzJ6ZnBiQzIydlNvaXVsZVFVblpmWlR5RlIv?=
 =?utf-8?B?Z05XNjcrdHFUa3hCYWxOaEVvUFRsSmZIWjNHWi9zUXNIaXd2cmZRYm1iRSs1?=
 =?utf-8?B?MEhBWU5IemsvNFB2bXhDVkwrT05hY094YXJUam5IeG1CeittSWVydlpqZTNN?=
 =?utf-8?B?ZzQvZDJ2VlhaVENHYXphZ1U1ajBWdVU2ektqY0JycDJJd2Q0S0FyeXJzUnBX?=
 =?utf-8?B?K2I2Z3VuS1pJYU91eGtXTlRGVVBXTnZ0YzRCR1REalArOW1mVDh6SkVGUEUz?=
 =?utf-8?B?YXNCNjllQzViUXVlQ2EyOUJxQXZJOUFrV2R3SDdncjFOZEhDSDJKeXpjNTBB?=
 =?utf-8?B?WENvSWV3U3NXUXNBaDNKWmMxbndWRnJuWm9Lb3ZDRmNUS2c9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5398.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MXJJdGxKZjllWlQ5MmZsK25OQ1ZJQW12U0xHZFNVdW1sd0VHT2dpTUFmMkU2?=
 =?utf-8?B?b1N3UzhQckV6OWkrQ3B6MC9TNWxmNmJBb2grVkhtSU9CeUtCZ1p2TU1lTFVp?=
 =?utf-8?B?b3B6QjVLRnZwRUlkNUJBMG1vSnMrMjVocFh2Znk0d2t4VUdEYnFsUUZGVUpG?=
 =?utf-8?B?U0FzR1VKM1cwdHJwZ3ljZzlNZTR0THNQeVFIVHd1anBQOTJHYkNMdk5MZEM2?=
 =?utf-8?B?bFFTdU5JTkZnMHpFREVzbW9MK1FIL3NRL0M2YVF5L3IyOXl4S2pMM1ZyNVJ1?=
 =?utf-8?B?ZmNoT1creVQrc3NHNUJQWXNCSHhPU2h2b1FXYjNxNUlJZzdEWkJ6d1pZanpH?=
 =?utf-8?B?eWg2OTY2QXl0bitPY2lickliUCs5UVhEU2E5ZHVaL01iRnhzY3N0L2ZZZmtn?=
 =?utf-8?B?cHhVWjJnVTQ1QlZLQzcyMy81R2lqbVFuUS9Pc1F6NlJUWDZyRTR1c29vTXFq?=
 =?utf-8?B?VS9HRGZXRnlKUjhTU2pOSXEyelBlM1R1eEpBdVFBRHlxK2l0TkJnODZ6dStk?=
 =?utf-8?B?V0U5V0lSQlMrZFhNS2dXU3VENlQ2VExnSHBORm9xZHhmRUdHY2dFMFNra0Rw?=
 =?utf-8?B?NWZydlRPa3JqQjVXM2NLbjJFYUYyVGUzQnpZLzBNckFoNzZSS1h0RkRNYTdt?=
 =?utf-8?B?RFZIbDhYYW5UQzZOZ0dkTEFyRDRXSTBrOGNsQUkzUTZFdFdqdVBrSXRHV1o1?=
 =?utf-8?B?a2RxelVxL1Z2UW43RkJ4YnhJR2JSN1NpZ0RMdVNqejhxZXFSWmNleDRxczBx?=
 =?utf-8?B?ZzBKd0doU0tmdm5hVHBRbjFJZFc3QTZMY1RYdC9ZRmZKd1QxR0QvRS9EOEl0?=
 =?utf-8?B?dk11SWg5aXpwb1FuR2tpM1Nsb2E3WE9LRkhpNHFnSkhRSHJnWEZUdEs5T0lv?=
 =?utf-8?B?cExSL09CRUpaUTgreFRTbHNjTjZTbHVpdDYzM3hSMGNqKytVOFR6QmhKV3pG?=
 =?utf-8?B?a05zRExBcWk1L3RBSGJrL0d1MElKcSs2WDV5MEJoK0ppa2VFQmVIVzdSWW5V?=
 =?utf-8?B?bTVva203ZXlaUDRGVGdhSnVza0lWZGdhK1JHYzBJUHpFekpBR1dCR2EvVzZ3?=
 =?utf-8?B?WDUzQXRnaS9sTURBYmZiRklzai9uUVVZaEJWRFNhUXlxZmZJVGZqVWgrcEd6?=
 =?utf-8?B?azVzb04xUTUrR1ArdmZtM1pjUEdnbFIzSDVjTjlLcDVrRTFHa0FFa3lpbUp5?=
 =?utf-8?B?NW5jYnlBODh3VThiWmVuNTJnYU1OUmV1ZHh5OUNrSVJzejcwNVBoRFEwRElX?=
 =?utf-8?B?TzFjNUJSVEdlaFRSR09lNlBReklVUGdMRDRrRFIzbWRTc056MUNaTUtiWEw4?=
 =?utf-8?B?TVhrZjNGcVlnRGwvanJVTnZwNlpucnBIR3pDWWMyMzdwWHJha3ppaG02alQ0?=
 =?utf-8?B?Nmltc0pyNHB2eC9jNisxVCtKM2VrclJXQ2VFOWF2RnAzaFBxVzF5eHlsUENp?=
 =?utf-8?B?c0ZNY3VIUEZ6UVJlNURpTTFPVVdqTFhzZTVDcEJpOU44Y3dqZjZXd2lJWS9j?=
 =?utf-8?B?UEpYZGMzQUp1NWp3Ky9Ka3J1NUR1RmViOWtGOGgrQysyLzhQOHMzVk9vVXlq?=
 =?utf-8?B?bWt4WXE4cXJKVTFlYUdkcmtJWVkwcitsQitmWGEzRUNyVVJMQ0JRSHdCZlg0?=
 =?utf-8?B?YkwySUZhNnFKZklpNUs4eWh0WUxPb0Z4MXZXWUtCeGRGUGtDT1ZLbGJLUU16?=
 =?utf-8?B?a3Z4TUNDR3ZLNWFWZENndVhiZU9KMTAwUTJmNENUd2NyQ3Nvbk0rNlhpcldR?=
 =?utf-8?B?clBzK2NJcVYrdXZZKytvL1N3R3ZmQWsyUXV1ZFVnbFNIbGNnQU13RUk4T1ds?=
 =?utf-8?B?dTZkWHpEVlB4T0ZsdEVxbC9aMm44OUJFd1o0N0w5ZW9EMU1EK3dNdUNwTDkw?=
 =?utf-8?B?QllBeEhVeG1rb1Q4MXNjZDhhN0duRzZDaDNSTFNzYjVTeTJ0ZVRQQzhvSzdK?=
 =?utf-8?B?V3FwdU1BTWFmQm9YaWpXdVVvTFhSRnV5dW85UW42d1NvOHZURVVYa1BSamhq?=
 =?utf-8?B?SWhZUVFjT0hDMm10cHdGL2t3eHFwSWlEcUxsU1BlcStiNFFGMHFOZTQ2WWdt?=
 =?utf-8?B?TkhQZHBkUUtBalg1V3R6Y1R1WDI5bUdtcHVIMkthYk92ZW9TR2JiVzZRM2tD?=
 =?utf-8?Q?IKnmQSDMYLvq76MgxPv5plhe9?=
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7ab592-732d-4242-4f49-08dd2faaab01
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 06:07:01.5917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20ZKf6DBlhUoMBk/Gl5OnCNTyb9siXV6XJKMnjJqGg7BSEmfnI/fqw6+zC2fzPOtqWbI5pph2ETMYEPeOjB9+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209544

SGkgU3RldmUsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHVwZGF0ZS4gSSB1bmRlcnN0YW5kIHRoYXQg
dGhlIHBhdGNoIG11c3QgYmUgc3VibWl0dGVkIGFuZCBhY2NlcHRlZCBpbnRvIHRoZSBtYXN0ZXIg
YnJhbmNoIGJlZm9yZSBpdCBjYW4gYmUgdGFrZW4gZm9yIHRoZSBzdGFibGUgYnJhbmNoZXMuDQpJ
IHdpbGwgZW5zdXJlIHRoYXQgdGhlIHBhdGNoIGlzIHN1Ym1pdHRlZCB0byB0aGUgbWFzdGVyIGJy
YW5jaCBwcm9tcHRseSBhbmQgd2lsbCBmb2xsb3cgdXAgb24gaXRzIHJldmlldyBhbmQgYWNjZXB0
YW5jZSBwcm9jZXNzLiANCg0KVGhhbmtzDQoNCk1vaGFtZWQgTWVlcmEgc2FoaWINCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4u
Y29tPiANClNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgNywgMjAyNSA3OjI1IFBNDQpUbzogTW9oYW1l
ZCBNZWVyYSBTYWhpYiAtWCAobW1lZXJhc2EgLSBFIElORk9DSElQUyBQUklWQVRFIExJTUlURUQg
YXQgQ2lzY28pIDxtbWVlcmFzYUBjaXNjby5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzsgeGUtbGludXgtZXh0ZXJuYWwobWFpbGVyIGxpc3QpIDx4ZS1s
aW51eC1leHRlcm5hbEBjaXNjby5jb20+OyBQb29qaXRoYSBBZGlyZWRkeSAtWCAocG9vYWRpcmUg
LSBFIElORk9DSElQUyBQUklWQVRFIExJTUlURUQgYXQgQ2lzY28pIDxwb29hZGlyZUBjaXNjby5j
b20+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtzY2FydGhnYXBdIFtQQVRDSF0gZGIgNS4zLjI4
OiBJZ25vcmUgbXVsdGlwbGUgQ1ZFcw0KDQpIaSBNb2hhbWVkLA0KDQpUaGlzIHBhdGNoIHdpbGwg
bmVlZCB0byBiZSBzdWJtaXR0ZWQgYW5kIGFjY2VwdGVkIGludG8gdGhlIG1hc3RlciBicmFuY2gg
YmVmb3JlIEkgY2FuIHRha2UgaXQgZm9yIHRoZSBzdGFibGUgYnJhbmNoZXMuDQoNClRoYW5rcywN
Cg0KU3RldmUNCg0KT24gVHVlLCBKYW4gNywgMjAyNSBhdCAzOjM14oCvQU0gTW9oYW1lZCBNZWVy
YSBTYWhpYiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bW1lZXJhc2E9Y2lzY28uY29tQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+DQp3cm90ZToNCj4NCj4gQW5hbHlzaXM6DQo+IC0gVW5zcGVj
aWZpZWQgdnVsbmVyYWJpbGl0eSBpbiB0aGUgdmFyaW91cyBjb21wb25lbnRzIG9mIE9yYWNsZQ0K
PiAgIEJlcmtlbGV5IERiIHdhcyBpZGVudGlmaWVkIGFzIHBvdGVudGlhbGx5IGV4cGxvaXRhYmxl
IHdpdGhvdXQNCj4gICBhdXRoZW50aWNhdGlvbi4gTGF0ZXIgdGhlc2Ugd2VyZSBjbG9zZWQgYnkg
dGhlIENyaXRpY2FsIFBhdGNoDQo+ICAgVXBkYXRlIChDUFUpLg0KPg0KPiBSZWZlcmVuY2U6DQo+
IFsxXSBodHRwczovL3d3dy5vcmFjbGUuY29tL3NlY3VyaXR5LWFsZXJ0cy9jcHVqdWwyMDE1Lmh0
bWwNCj4gWzJdIGh0dHBzOi8vd3d3Lm9yYWNsZS5jb20vc2VjdXJpdHktYWxlcnRzL2NwdWFwcjIw
MTZ2My5odG1sDQo+IFszXSBodHRwczovL3d3dy5vcmFjbGUuY29tL3NlY3VyaXR5LWFsZXJ0cy9j
cHVqdWwyMDIwLmh0bWwNCj4NCj4gU2lnbmVkLW9mZi1ieTogTW9oYW1lZCBNZWVyYSBTYWhpYiA8
bW1lZXJhc2FAY2lzY28uY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RiL2Ri
XzUuMy4yOC5iYiB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGIv
ZGJfNS4zLjI4LmJiIA0KPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RiL2RiXzUuMy4yOC5iYg0K
PiBpbmRleCBhN2QwNjFlMGRhLi5kOTNlNzdhMWVlIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kYi9kYl81LjMuMjguYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
ZGIvZGJfNS4zLjI4LmJiDQo+IEBAIC0xMjAsMyArMTIwLDIwIEBAIEJCQ0xBU1NFWFRFTkQgPSAi
bmF0aXZlIG5hdGl2ZXNkayINCj4gICMgbWFueSBjb25maWd1cmUgdGVzdHMgYXJlIGZhaWxpbmcg
d2l0aCBnY2MtMTQgIENGTEFHUyArPSANCj4gIi1Xbm8tZXJyb3I9aW1wbGljaXQtaW50IC1Xbm8t
ZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb24iDQo+ICBCVUlMRF9DRkxBR1MgKz0g
Ii1Xbm8tZXJyb3I9aW1wbGljaXQtaW50IC1Xbm8tZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb24iDQo+ICsNCj4gKyMgVGhlIHJpc2sgbWF0cml4IG9mIE9yYWNsZSBCZXJrZWxleSBE
YiB3YXMgcHVibGlzaGVkIGluIEp1bHkgMjAxNSBieSANCj4gK3doaWNoIG1hbnkgdnVsbmVyYWJp
bGl0aWVzICMgaW4gZGlmZmVyZW50IE9yYWNsZSBwcm9kdWN0cyB3ZXJlIGlkZW50aWZpZWQuDQo+
ICsjIGh0dHBzOi8vd3d3Lm9yYWNsZS5jb20vc2VjdXJpdHktYWxlcnRzL2NwdWp1bDIwMTV2ZXJi
b3NlLmh0bWwjREINCj4gKyMgVGhlIE9yYWNsZSBCZXJrZWxleSBEYiBpc3N1ZWQgdGhlIENyaXRp
Y2FsIFBhdGNoIFVwZGF0ZSBBZHZpc29yeSBpbiANCj4gK0p1bHkgMjAxNSAjIHdoaWNoIGRldGVy
bWluZWQgdGhlIHN0YXR1cyBvZiB0aGUgdnVsbmVyYWJpbGl0eSB3aGV0aGVyIGFwcGxpY2FibGUg
b3Igbm90Lg0KPiArIyBodHRwczovL3d3dy5vcmFjbGUuY29tL3NlY3VyaXR5LWFsZXJ0cy9jcHVq
dWwyMDE1Lmh0bWwjQXBwZW5kaXhEQg0KPiArIyBBcGFydCBmcm9tIHRoaXMsIGRpZmZlcmVudCBD
UFVzIGNoYW5nZSBzdGF0dXMgb2YgdGhlIHZ1bG5lcmFiaWxpdGllcyBlLmcuDQo+ICsjIENWRS0y
MDIwLTI5ODE6IA0KPiAraHR0cHM6Ly93d3cub3JhY2xlLmNvbS9zZWN1cml0eS1hbGVydHMvY3B1
anVsMjAyMC5odG1sDQo+ICsjIENWRS0yMDE2LTA2ODIsIENWRS0yMDE2LTA2ODksIENWRS0yMDE2
LTA2OTIsIENWRS0yMDE2LTA2OTQsIA0KPiArQ1ZFLTIwMTYtMzQxODogDQo+ICtodHRwczovL3d3
dy5vcmFjbGUuY29tL3NlY3VyaXR5LWFsZXJ0cy9jcHVhcHIyMDE2djMuaHRtbA0KPiArDQo+ICtD
VkVfU1RBVFVTX0dST1VQUyA9ICJDVkVfU1RBVFVTX0lOR1IiDQo+ICtDVkVfU1RBVFVTX0lOR1Ig
PSAiQ1ZFLTIwMTUtMjU4MyBDVkUtMjAxNS0yNjI0IENWRS0yMDE1LTI2MjYgDQo+ICtDVkUtMjAx
NS0yNjQwIENWRS0yMDE1LTI2NTQgQ1ZFLTIwMTUtMjY1NiBDVkUtMjAxNS00NzU0IENWRS0yMDE1
LTQ3NjQgDQo+ICtcDQo+ICtDVkUtMjAxNS00Nzc0IENWRS0yMDE1LTQ3NzUgQ1ZFLTIwMTUtNDc3
NiBDVkUtMjAxNS00Nzc3IENWRS0yMDE1LTQ3NzggDQo+ICtDVkUtMjAxNS00Nzc5IENWRS0yMDE1
LTQ3ODAgQ1ZFLTIwMTUtNDc4MSBDVkUtMjAxNS00NzgyIFwNCj4gK0NWRS0yMDE1LTQ3ODMgQ1ZF
LTIwMTUtNDc4NCBDVkUtMjAxNS00Nzg1IENWRS0yMDE1LTQ3ODYgQ1ZFLTIwMTUtNDc4NyANCj4g
K0NWRS0yMDE1LTQ3ODggQ1ZFLTIwMTUtNDc4OSBDVkUtMjAxNS00NzkwIENWRS0yMDIwLTI5ODEg
XA0KPiArQ1ZFLTIwMTYtMDY4MiBDVkUtMjAxNi0wNjg5IENWRS0yMDE2LTA2OTIgQ1ZFLTIwMTYt
MDY5NCBDVkUtMjAxNi0zNDE4Ig0KPiArQ1ZFX1NUQVRVU19JTkdSW3N0YXR1c10gPSAiZml4ZWQt
dmVyc2lvbjogVGhlIENyaXRpY2FsIFBhdGNoIFVwZGF0ZSBvZiBPcmFjbGUgQmVya2VsZXkgREIg
ZGlzY292ZXJzIHRoZXNlIHZ1bG5lcmFiaWxpdGllcyBtYXkgbm90IGJlIHJlbW90ZWx5IGV4cGxv
aXRhYmxlIHdpdGhvdXQgYXV0aGVudGljYXRpb24uIg0KPiAtLQ0KPiAyLjM1LjYNCj4NCj4NCj4g
DQo+DQo=

