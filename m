Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723CCC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:25:09 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7724.1784550303658216326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FnQc+ym0;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16212; q=dns/txt;
  s=iport01; t=1784550303; x=1785759903;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=vOPoR3WR8KetnFh+recs49Zp1mkqmENgJZ6EJ/oQWe8=;
  b=FnQc+ym0KXcrqvgfUKgdOVbNquN+1wzZqpROGfikQNshifT5Cpjprv0q
   ZfLj/Pk2S2mFRQRR6++sjMDC9Ws3fsCO7amldMCj7ir8M7uMUlwBJKoJ4
   i3f45utd1CpEKE/D5FSaWJguQQScYk2x+EhNoVL06e0+M4gYh8yHcs7aO
   1mqvkATYNItwAji31jOGxZiiuMP6N+zrjSmb7EDDEc02fqqbHE1wjpYSb
   sNCftaQQFVGElR92fCXVr4Dns5XXwo6FkrTiWsxjYInfkl9DpAuuIuSXZ
   EesQEjhoULns1jLBpAjMEQWL1u/btGpNtqm/cAyrWoS3Z/1pVwBmnYo9F
   g==;
X-CSE-ConnectionGUID: s0Zgy4h3RAWjJq+RKsxk1A==
X-CSE-MsgGUID: zWzleoEPRBGzgzqWpvgi3Q==
X-IPAS-Result: =?us-ascii?q?A0B0AwCbEl5q/4oQJK1agS6BK4E9MVOBCAKBIUmIIwOFK?=
 =?us-ascii?q?4ZYgiEDl0SGVxSBYAoPAQEBDQIuARsHBAEBg05xRgKNUwImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDARF3AgEIEQMBA?=
 =?us-ascii?q?QEBLicKHQgCBAESCBqCYYIdFkEDAQIOsTIBgT0Ciip4gTSBAYNiAQUCQ9wKF?=
 =?us-ascii?q?AGBOIU/gwEbAQEFJUlsgl2BIhgBhHwnGxuBcoFXgmk+gQWBXAEBAgEXgQ0QD?=
 =?us-ascii?q?xweg3WCMASCInoSG4E/ghuBYYwQUnIiAyYzLAFVExcLBwWBIxAzAyAKLy0CF?=
 =?us-ascii?q?A0iDxoFLR1wDCcSDx0XFh5YGwcFEiAqQUUjAxQ7PzgLQwWBVwKCBU4jHwM5f?=
 =?us-ascii?q?4EvdUp3LWoCEBdKOCSCEgKBOwIHAwttPTcGDhkDBIE1BYxQB1sjgj4BAYENL?=
 =?us-ascii?q?E+BBT8fk0ePQYF8jGSTZIEzCiiDdYp7gSaNPogyF4QEgVeLPZlUC5h9I41nl?=
 =?us-ascii?q?WCFLgIEAgQFAhABAQaBaDyBRwsHcBWDIglKGQ+Nf4QkgX+DFMMqeQIBCDIBA?=
 =?us-ascii?q?QcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:r3ngjBVffWJ1MoFpeB6T98ciFy7V8K3PAWYlg6HPw5pHdqClupP6M
 1Oav7NmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:SiTjXKnn9DfPtQn7Hn6vwBro5gzZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWTiHbvbbYmeke4t0a4S+pxgAv8KDzNNlQABrrXxhQ1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+8SkUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZZAyOlmXWEVz
 9UnKhIULSqgnPK1mZvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkYfUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIqNIoXbFZkMxS50o
 ErUwHb9DxY3DOa15iiK4GuTnvHAnHjCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dbDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:5STaTKklfJ1PTETVF+4bK6TWxEPpDfMliWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj+fZq9z/JICPoqTMmftWjdySeVxe5ZnPDfKlHbaknDH6tmpN
 tdmstFeZLN5DpB/LzHCWCDer5KrqjkgcWVbKXlvgpQpGpRGsddBnJCe36m+zpNNXB77PQCZf
 2hz/sCjQCNPV4QacO2DGQEWe/sm/3n/aiNXTc2QzQcxE2rlz2H1J7WeiL04j4uFx9fy7Yr9m
 bI1zf++riitP+DzBrd3X/47phdmtfto+EzSvBkjPJ7FhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nL4ZAiO0FvQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6nAnoMp33M
 twriGkXttsfFH9dRbGlpz1viJR5w2JSL0Z4KguZklkIM4jgXlq3NUiFQ1uYc899WnBmfEa+a
 FVfbHhDbBtABKnRkGcmHVzy9qxWXl2NBKHTk8e/vGx6VFt7StEJ49y/r1Dop/Gn6hNEaWt64
 n/Q9dVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjnwQrPMkfwIDduRCdQ15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNffWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104j2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6PvPEQYQKbRqXSx+MFLEGBxZlg9GEkDPw4jjQo
X-Talos-CUID: 9a23:DDmg+W+HQw63iONIChOVv1VMKM80Ln2G9l7vIW2hSlxKU62WEHbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AEWpXcA7eI6VzIu+3kjVbcGsrxox63LaqBUcgqa8?=
 =?us-ascii?q?slNuLJzVPIymSjW+OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:25:02 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 99657180003DA
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:25:02 +0000 (GMT)
X-CSE-ConnectionGUID: Cxm++7BbSkKvVveuFUWz4w==
X-CSE-MsgGUID: TxevCr5iRJu4DjC2zIjXNQ==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="56160775"
Received: from mail-eastus2azon11011003.outbound.protection.outlook.com (HELO BN8PR05CU002.outbound.protection.outlook.com) ([52.101.57.3])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:25:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn8QQnnzYlQy4CQl1/KZAES2Yz35ohlhKqV87IIoTMU7Ig3c6LlaD9HSFBk8/lU2O6d09ZU5d5Fdctsirm/Zp424INKupxOwZDWN7ThMP9hmhgoXm8wPixVMSw/PUE0Ago2WHQapcG1V7PDrnyj7boaV7jhcrd8svU9i+d47uLo3GCKl2oHYQl5WBys/SBMNayToFsAV2xRhLaxTL+34+4mnRM8v9g5C4va77S0QzGzAUdymbHs/vRw4bEIAownOjtcEI7xVR/r62QyoGC116rLBhAcFgnPakDpAP8L60fIVMkheGfsgm4T+wJp2Ao8yC+llnrLTEGYNbFTtFuq4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOPoR3WR8KetnFh+recs49Zp1mkqmENgJZ6EJ/oQWe8=;
 b=APeVxKwSC76h6pSyaVVYX/C9+CwsAlrh4cPoPvfY3By30ZIRLoioI0LsG5o39I0cyJFQBmvArxog6PutjYekoaM+4Io+1NtYE1FeSX1CVrx2yxl+cj/LNPm+KOFV5bG6Ofb23SB+4arvB176DwEv37zpcYQBOZ/D/Ba2EkiWWyVChD+72WM5PZmLBmMSOFAE5X9LGIRPaV0GcTg50v/Acy+9oqx04NC4g1VY1vCi+AfgWhu22vkhfF+yOQ2Fce8W4U3hCP6fLVGeVbD4w2v5hVHxpaF4jHtYlKUoAo/7kfwj+zXI76FE0N65SqNrpW57cS5Ug6oFFEJwtWz4O1pXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 12:24:58 +0000
Received: from CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec]) by CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 12:24:58 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 01/10] expat: fix CVE-2026-56403
Thread-Topic: [OE-core][wrynose][PATCH 01/10] expat: fix CVE-2026-56403
Thread-Index: AQHdFgA5nbiV0RcrhkCpNCvvMQlb8bZ2WI79
Date: Mon, 20 Jul 2026 12:24:58 +0000
Message-ID: 
 <CY5PR11MB618758AFAF579F8372CFD9B7C4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <DK0Y76VFY9IE.2KH0G9SO8XT0U@smile.fr>
In-Reply-To: <DK0Y76VFY9IE.2KH0G9SO8XT0U@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6187:EE_|SJ0PR11MB6695:EE_
x-ms-office365-filtering-correlation-id: 11610962-f0f8-40fe-2837-08dee659ea18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|13003099007|6133799003|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 sJaBbamQYjlI1G2ZybJykmtbEOK8gqfQwCxGPQMuTYCPzSyy6//ShDxezgkXMZPCYCXvD2tIuVia0lDaRy7XGz/OOdDeHYrU0OR57L+I+V0P7Jb8Wi5VNOsNdbX2fokIgchkR+zvjortfJ3ekmFQ1rmDSigfgaeMllruzlFz3YhHRITDAGw1tgrtEeDv2qbHl9CXt0ZsUjhfDqSo6pp1vY8HQRGdMLSkor6QMRaI/H4ns7XL3VIvwHiWGfvJy5YB+I/FAD0Jd8GI+wr1Tz9cfGLGlfGh2wHJPlrNknNAFqyQ1QArIvG4v+nmscT8GSjrsWoA4lwE+gsfGc4W5gyM54AMC6hvOsvqD6jE1MsWuHdEZKw4+g5J4/Z8up1G3lBXcCmdSIeQYuTlKnqnj7BAnLiMB06cNHsuHMI8eLNe0oZRuwv7qFNUDFhmbvNqFLS7Y+nY6+C5gOURU5UsMkxHQl7D02J+AiutIXQiFoNy37lGchSlBCK/9ouW/Lt+AnAEsFiAqPIoTajEUI5HQRv8SxunE+X5UAkXsJCergSPhCdgc4GLm02GO3OKfxOzjhk6ZiZjUJHHxgEoqaCHM/LWrCVC4tsaRjn7nQPQVvnYlXqSXg7BWRQTRcvMJgpwSO2+7Ii++e+znN2juQyEpv9H6VPGYydIIAF0njGr3lT9ZiQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(13003099007)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pQ27bwn/8K+fMnNeuFHtpy6LS1zwMYPnyu2GpnZkVQi8EeVKLK3NYnB6Td?=
 =?iso-8859-1?Q?X5mQhuElDzWa0JJdcBImhUMTkjLWbfHWsCLGsObobkv/9EP/f/pRlluWob?=
 =?iso-8859-1?Q?gkjU6UHg3BlCpT5kxgFbYLMvA++0TS5rTMxHadZAShcC4gTRu7SQbWb9C4?=
 =?iso-8859-1?Q?GTOtTZOTtXqU/lwsCzwDE3n6rl07QvMGuOfSoHQ0h2w4ClSJ0O5rpOjxFO?=
 =?iso-8859-1?Q?qWbO4HOy9As47Gf+1soXZRv/iIzJDRO8nTd0m4/dDrYz5w/JD8UkJhl15M?=
 =?iso-8859-1?Q?EUGwesyTLzUkn4dyYdC9RgYb9RsvaoVMwD+w6jeL1+hCNwapCs//mCYl5x?=
 =?iso-8859-1?Q?/M/anYz66u3xK5kbbT58qvAcuzwZ7J8tjB7rFlVkcGVYyrSugcGJFFNPr6?=
 =?iso-8859-1?Q?/k7tAO11WGrncxKFqLuxwXfigjaZoXuEhnZDFCLAzwnAWwWPKHV6NE93OE?=
 =?iso-8859-1?Q?GRDQpOy14C/TBPChrc17YUrAi87IR8YkczA1llJPXbShp82kAo1LZDuFKC?=
 =?iso-8859-1?Q?tHLiKiIGZde8o2TV94wvWNXTcCBP177/KiV8lkvegQYXAWNqcURCGovjmP?=
 =?iso-8859-1?Q?U7LGf/d6Yx3e1sp8oCNmG8bOd3XhS0nC47ILf55CBV9arXgbinUi2yEHct?=
 =?iso-8859-1?Q?+SK4MV09E7yAXFC8ol+SkwCyUAmF1WmWIu4hSVRpc/H8XZGLjU3ehyj12K?=
 =?iso-8859-1?Q?cA/WZmnJ/6DY4xiJViYbKCwha32sc+PBAyqcRNBwaXvx7VsZv78ckUNhIw?=
 =?iso-8859-1?Q?4qSEh6mkK4Masac7msbm6wvsmNAaFMdOlUUfiFt7PB5klJ59uWt4HkkEw+?=
 =?iso-8859-1?Q?hUTSXLBUdbULFcHpFUB06NgvwSYy5BvKzR9jDd41/eOIxYmnSw0wktzMQ+?=
 =?iso-8859-1?Q?pUIPDFJRwbiqNzBWaz2kCN7M2QuYFe/NhsN+2U/k4Gi1QkNPYmAzz5ButM?=
 =?iso-8859-1?Q?3tMeu9wzh+DmfQzdLhsa0ZYho9nhtvCuhfGptKjtgmbHWVOdFsV6ZX5uKC?=
 =?iso-8859-1?Q?eiziWaHDu8T2EGktVoLF6f1fpk/YtA+vyknqJgxE8Bontv9mZjUnsqfdIq?=
 =?iso-8859-1?Q?YPPzMVQYx9sP6tCoaqEeV1dDTko9tf6skUwoxnACmxTF79rxwaq9Qb/IAz?=
 =?iso-8859-1?Q?VShSBpsoAWPSICdHDyI7qwFpDSzwE3JFYNBM3K2fysC2ufNql9s5EWBTa5?=
 =?iso-8859-1?Q?cLUtfLc0mngEPkPpfq2iqzxuYk9YZSPjiPGedUDmaWlDypK0bFfvKefQMw?=
 =?iso-8859-1?Q?4ZQM8CxEEsiJ7c0zKgtItxED3vauVpFh2qIzNoPePUgMzk3eKmOwl/7o1r?=
 =?iso-8859-1?Q?FPTAbe7W5WqjAVU/smjyocHzvjzxftV8UbSChKkgPILIxKvxji3HcayOPC?=
 =?iso-8859-1?Q?UgCOpLLNPow2rYtNDlKKxnbZs+GjhpaVojhvdgYmhDsMeOyf0zlcwKZz9H?=
 =?iso-8859-1?Q?mMzSNX+L5Pw0IZmMK6Il13npldNdY7dwIo7GJJXU0WgRz7L8oSohL4fgwn?=
 =?iso-8859-1?Q?0WwfcEgWVTBATBvs18w0mhgrRZveixZfP3zIbEQlhvVmNeP0uddwqIzrfp?=
 =?iso-8859-1?Q?FI6gjaK6gS1bN7kTha5sT3FR6IAZsPH3a/HyV0Sj01WZYQITIWxAsAeQ//?=
 =?iso-8859-1?Q?qkX49Z7kB/c1H5xxu1ayxhGwk1/4PrX856iM6YmcgqpIfRBfUn26lWyM73?=
 =?iso-8859-1?Q?tBZCX2Xvj7hXNT/fmSdRSFxAYHWOJG86ou6+Ogk/Y5emFXZtE7N1iuVjr5?=
 =?iso-8859-1?Q?5beB/Z0gEZZUleu9wT1vE2xyBRwkf0JSWk8JBJTZo6c0HJ?=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR11MB618758AFAF579F8372CFD9B7C4C32CY5PR11MB6187namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	TyQ5+LyEg1dyMe3UF4c4qMJl4JK+YwucdhTh6hXLuWfhK76ciiH0IAxIENI7WNn1VxyBwV/ORpa8qu3WBNSlzmNl7nGXtDPp8PTKUOI9g1xdaxwa4Z84e7H3N862b9/vCBniq+GN77GuDQl+RaFOQ9ayKUPXo5oy27Xxp6Ck1j7BILM8xoe01i4qVegQ2pyLi1P3eU9RTdRleFgfYkTD5YfTQMC9NzPJqVW94hVcu2ZvGqSEr2kamfoBV6LT5FhGM6sWYw0DbO8+kO5c19p5+YAqJTb1KFZFANFYhC0lwZNLfon0ULzaVGP6GVx5h8zjc7K+6pV3Ekd5g8eh9VnAww==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11610962-f0f8-40fe-2837-08dee659ea18
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 12:24:58.6633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4ENyJMinuCQRYCySV3wKHyGTBE1Fd6ZY6BCd6yeAfocd37pdu7dxoTNzQer9pLcC1YuLfw/7OQiPeCnJto9uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241389

--_000_CY5PR11MB618758AFAF579F8372CFD9B7C4C32CY5PR11MB6187namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have rebased all the expat patches on top of the latest wrynose merge com=
mit and refreshed all the patches and removed not needed backport changes.

Please see the v2 of this series as below:

  1.
https://lists.openembedded.org/g/openembedded-core/message/241377
  2.
https://lists.openembedded.org/g/openembedded-core/message/241378
  3.
https://lists.openembedded.org/g/openembedded-core/message/241379
  4.
https://lists.openembedded.org/g/openembedded-core/message/241380
  5.
https://lists.openembedded.org/g/openembedded-core/message/241381
  6.
https://lists.openembedded.org/g/openembedded-core/message/241383
  7.
https://lists.openembedded.org/g/openembedded-core/message/241382
  8.
https://lists.openembedded.org/g/openembedded-core/message/241384
  9.
https://lists.openembedded.org/g/openembedded-core/message/241385
  10.
https://lists.openembedded.org/g/openembedded-core/message/241386
  11.
https://lists.openembedded.org/g/openembedded-core/message/241387

Thanks for your review.

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Friday, July 17, 2026 8:53 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 01/10] expat: fix CVE-2026-56403

On Fri Jul 10, 2026 at 3:08 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> These patches apply the upstream fixes shown in [1] and [2], as
> referenced by [3].
>
> [1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d856=
5f6bf1cf245f648
> [2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c0983=
70a8362aed47b15
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> [...]
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta=
/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> new file mode 100644
> index 0000000000..a17e3a8b3a
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> @@ -0,0 +1,52 @@
> +From e8100827a4f68c70d8cadf446bb82bec7cbebbac Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Fri, 22 May 2026 00:43:52 +0200
> +Subject: [PATCH] xmlwf: Protect function `xcsdup` from signed integer ov=
erflow
> +
> +CVE: CVE-2026-56403
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1=
47c8f36d6277d5c6011c098370a8362aed47b15]
> +
> +Backport Changes:
> +- Include stdint.h explicitly because Expat 2.7.5 does not expose SIZE_M=
AX
> +  to xmlwf.c.
> +
> +(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + expat/xmlwf/xmlwf.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
> +index 2d0c4f8e..934473ce 100644
> +--- a/expat/xmlwf/xmlwf.c
> ++++ b/expat/xmlwf/xmlwf.c
> +@@ -46,6 +46,7 @@
> +
> + #include <assert.h>
> + #include <stdio.h>
> ++#include <stdint.h>

Hello,

I *think* you don't need this backport change anymore since:
https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&id=3D210=
42df15008ce90b76958d74200298d09d71254
(added stdint.h into expat.h)

This may also apply to
meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch in a later patch
of this series.

Can you check and send a v2 of the whole fixed series?

Thanks!
--
Yoann Congal
Smile ECS


--_000_CY5PR11MB618758AFAF579F8372CFD9B7C4C32CY5PR11MB6187namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have rebased all the expat patches on top of the latest wrynose merge com=
mit and refreshed all the patches and removed not needed backport changes.<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Please see the v2 of this series as below:</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://list=
s.openembedded.org/g/openembedded-core/message/241377" id=3D"OWAd15f3246-7f=
94-3552-8504-934f98739e0f" class=3D"OWAAutoLink">https://lists.openembedded=
.org/g/openembedded-core/message/241377</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241378" id=3D"OWA217e6798-1cd6-e045-4845-a6983903d8f7=
" class=3D"OWAAutoLink">https://lists.openembedded.org/g/openembedded-core/=
message/241378</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241379" id=3D"OWA6dafdc10-a65c-6109-dc80-944f6995879d=
" class=3D"OWAAutoLink">https://lists.openembedded.org/g/openembedded-core/=
message/241379</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241380" id=3D"OWAb992ad00-673b-5d0e-6e22-1a12c13f62f1=
" class=3D"OWAAutoLink">https://lists.openembedded.org/g/openembedded-core/=
message/241380</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241381" id=3D"OWA410e7ee9-ae5e-0c1a-c539-ca481e7d3140=
" class=3D"OWAAutoLink">https://lists.openembedded.org/g/openembedded-core/=
message/241381</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241383">https://lists.openembedded.org/g/openembedded=
-core/message/241383</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241382">https://lists.openembedded.org/g/openembedded=
-core/message/241382</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241384">https://lists.openembedded.org/g/openembedded=
-core/message/241384</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241385">https://lists.openembedded.org/g/openembedded=
-core/message/241385</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241386">https://lists.openembedded.org/g/openembedded=
-core/message/241386</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241387">https://lists.openembedded.org/g/openembedded=
-core/message/241387</a></div>
</li></ol>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, July 17, 2026 8:53 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 01/10] expat: fix CVE-2026-564=
03</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Fri Jul 10, 2026 at 3:08 PM CEST, Deepak=
 Rathore via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; These patches apply the upstream fixes shown in [1] and [2], as<br>
&gt; referenced by [3].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/libexpat/libexpat/commit/12dc6d8d3d6=
5f79471a94d8565f6bf1cf245f648" id=3D"OWA46118e1e-b356-1f93-04ee-2a35747d229=
8" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1=
cf245f648</a><br>
&gt; [2] <a href=3D"https://github.com/libexpat/libexpat/commit/147c8f36d62=
77d5c6011c098370a8362aed47b15" id=3D"OWA5d1f13c7-0e99-44a5-2471-8f926abfc60=
3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a836=
2aed47b15</a><br>
&gt; [3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-56403" id=3D"=
OWA9b4765bb-a6c5-9aa3-3a1e-bd885e18c265" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-56403</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; [...]<br>
&gt; diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/m=
eta/recipes-core/expat/expat/CVE-2026-56403_p2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a17e3a8b3a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +From e8100827a4f68c70d8cadf446bb82bec7cbebbac Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Sebastian Pipping &lt;sebastian@pipping.org&gt;<br>
&gt; +Date: Fri, 22 May 2026 00:43:52 +0200<br>
&gt; +Subject: [PATCH] xmlwf: Protect function `xcsdup` from signed integer=
 overflow<br>
&gt; +<br>
&gt; +CVE: CVE-2026-56403<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libexpat/lib=
expat/commit/147c8f36d6277d5c6011c098370a8362aed47b15" id=3D"OWAdec56f87-31=
c6-e35c-7c0b-22ae0fef1ebe" class=3D"OWAAutoLink" data-auth=3D"NotApplicable=
">https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8=
362aed47b15</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Include stdint.h explicitly because Expat 2.7.5 does not expose SIZ=
E_MAX<br>
&gt; +&nbsp; to xmlwf.c.<br>
&gt; +<br>
&gt; +(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + expat/xmlwf/xmlwf.c | 8 +++++++-<br>
&gt; + 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c<br>
&gt; +index 2d0c4f8e..934473ce 100644<br>
&gt; +--- a/expat/xmlwf/xmlwf.c<br>
&gt; ++++ b/expat/xmlwf/xmlwf.c<br>
&gt; +@@ -46,6 +46,7 @@<br>
&gt; +<br>
&gt; + #include &lt;assert.h&gt;<br>
&gt; + #include &lt;stdio.h&gt;<br>
&gt; ++#include &lt;stdint.h&gt;<br>
<br>
Hello,<br>
<br>
I *think* you don't need this backport change anymore since:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dwryno=
se&amp;id=3D21042df15008ce90b76958d74200298d09d71254" id=3D"OWA83d7970e-dff=
e-1833-b4ee-86811ce19cf5" class=3D"OWAAutoLink" data-auth=3D"NotApplicable"=
>https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&amp;id=
=3D21042df15008ce90b76958d74200298d09d71254</a><br>
(added stdint.h into expat.h)<br>
<br>
This may also apply to<br>
meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch in a later patch<br>
of this series.<br>
<br>
Can you check and send a v2 of the whole fixed series?<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_CY5PR11MB618758AFAF579F8372CFD9B7C4C32CY5PR11MB6187namp_--

