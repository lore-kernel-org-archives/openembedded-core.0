Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF943C88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 06:07:17 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5177.1789711632884898295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 23:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TN35JJ49;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13155; q=dns/txt;
  s=iport01; t=1789711632; x=1790921232;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=xhSWyKft7MGMdyYrKdvENhkcDmvH+L9TsqAWZvYXJ10=;
  b=TN35JJ49OYecciVqCyv4IC5MPegaVAQ9AQwa6NQNkl07geDNgvUNlWDk
   X1zriIHugQ3OdbFU9kKNjGbYHYj3j3M6s5cwndTtEJJq1ry+GSqU040n4
   F2oDHimuqJocgw+92YOql9nIu+gBsXqpUfLYXQbP0Qt4yAx0wYsxyEUT3
   b/QwoljvloHKOb1xriuTSiEfjSLixfFBUMjd712T2u2vda/z8nnAJIRdu
   zgPWAqwxucUNf6dBbzGEWwxYEWIP6dGxnxuzmj53UurSHbwumurqRjnq9
   hE8/WZgKizHJqVKytgXa50z5LSvnWWkUujeJiPsvt6YKOoya2k6CEsFqZ
   w==;
X-CSE-ConnectionGUID: N+kSXVtkQLGNVQpJSXiEkw==
X-CSE-MsgGUID: Djgg+t81TVyh4yVq5CLXeQ==
X-IPAS-Result: =?us-ascii?q?A0ByAwDg06xq/4sQJK1agS6BK4E9MVOBCQKBI0kDiCADh?=
 =?us-ascii?q?SuIeQOBE50IgXQKDwEBAQ0CLgEVDQQBAYUFAo4HAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBeBACAQgRAwEBAQEuJ?=
 =?us-ascii?q?wodCAIEAQ0FCBOCaIIdFkEDAQIOt28Cih14gTSBAeA8FAGBOIU/gwMbAQEFJ?=
 =?us-ascii?q?Ulsgl2BIxmEfCcbG4FygRVCgjE4PoEFAYFbAgOBNCseHoNXgjAEgiJ6EhuBP?=
 =?us-ascii?q?3IWBEqGaYosUnIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnEg8dFxEeW?=
 =?us-ascii?q?BsGBRIgKkFDIwM+gVs/Ixk2eoEJXoErKWABAg4XRkGCCAKCVIEjXgIBSUMOB?=
 =?us-ascii?q?0VTCSdBAwcSRykiCBIJARMaMAt+bT03Bg8ZAwSBNQWOXwdaH4JaAXsTAQckT?=
 =?us-ascii?q?zZAQAkeBgsRKZJjH49BgXyCIZ9aCiiDdop8gSaNPogyF4VbpRKZCCONZ5VgI?=
 =?us-ascii?q?4ULAgQCBAUCEAEBBoFoPIFZcBWDIglKGQ+SJIUTxwZ5CwMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAAiYHgU8BAQ?=
IronPort-PHdr: A9a23:wtV5gRzYoA3oWkTXCzPsngc9DxPP8539OgoTr50/hK0LK+Ko/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:ljC/tKAIajb1KRVW/3Hiw5YqxClBgxIJ4kV8jS/XYbTApD9332QEn
 GJMXG+FOKqKN2Cjct5wa4+38B8Gv8WDyoNhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYA78h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5bZtN3EIIY4h3slRP1hW1
 8coKR0OcUXW7w626OrTpuhEj8AnKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmsHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFAujOG9YIeNEjCMbelXkUnbu
 jKfw1roAk0LCsXC4h61/0v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvCS6AeCDW9CRTlEADA7iPILqfUR/
 gbht/viBCdkt/ueTnf1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:gM5CJqnuZqrhhHTKoF9aImMQXgLpDfMsiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj/fZq9z/JICYl4B8bFYOCUghrYEGgC1/qs/9SOIVyFygcw79
 YFT0E6MqyOMbEYt7e13ODbKadc/DDvysnB7omurQYJcegpUdAd0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvGRV0nKu6AKj0uWe/Fq9fXlJTgTyInKnccgjWmvHeD0pK/NwKX8Cs/flp0rIsKwC
 zoggb57qKsv7WBzAPA12jc1pJSmNHw4NpODs6Bh6EuW3TRYwCTC7hJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt8xOI6kds11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 Nw2X6DvZY/N2KDoM293amMa/hZrDvynZMQq59Us5WZa/pGVFZll/1awKqSKuZZIMu10vF9LA
 AkNrCt2B8fSyLoU5mehBgu/PWcGlIuAxyBXk8O/uaR0zRQgTRF6nFw/r1Eop/Fn6hNF6WtII
 //Q/lVfL0idL5lUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR+2AiGQu1B8HIJou
 WLbHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFjr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2XTN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdM3AXPagAZpQy09Jjv7TlbLc8xzT9oW7Jkv22FQ==
X-Talos-CUID: 9a23:Bcj/I2OBOl7hAO5Dfmpkz34qBsMcVlL78k7IAXSICEtqV+jA
X-Talos-MUID: 9a23:Bl4wHwVe/1D5Yazq/BPuiz4hKJcx35q/CBwcr4xbkO20OBUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Sep 2026 06:07:11 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id B57B21800018E
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 06:07:11 +0000 (GMT)
X-CSE-ConnectionGUID: EpmnXJ0LQZSVyHIe12/0kQ==
X-CSE-MsgGUID: MpLTuelKSky2BlKx+eUEWw==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208,217";a="86903575"
Received: from mail-westus3azon11011047.outbound.protection.outlook.com (HELO PH0PR06CU001.outbound.protection.outlook.com) ([40.107.208.47])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Sep 2026 06:07:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HApelDCHqit66NSVlPOEpytw1vByK7P7nfSY4/gg25dbvExhn6P5aRtMpB7H+jGLXjRIr/KMVWmqAe68LNBWuD2Rvfy6dJoPJn1ibgZGgLrlJMeOIjZva5Jt5QdntBY/t8BYEI8725OOmYZr+rGXKCYHwMOvVH6Q95v8wl7H/SX3YjSRYACDpEh4h6hZwIyOe2d6A+Ll7MwJDk0MDpfiSlMQMZceqysCSfnnzmtPU7Tbya9WuKYN3AyYvEmMd17ZnvG+qhFQQ9h/quWRf1DghSQPxXZQdoW3GAMByIjFHbEz7geVICFcBwChnHODG9p+ppFa+rJEhgY5bZ2Pr4AWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhSWyKft7MGMdyYrKdvENhkcDmvH+L9TsqAWZvYXJ10=;
 b=w//yg0Y/jjhS1zauKezqTpG9qnpt734lYJ5t5tz78jrPhK+S4kRmDZm8CBUH1/2OqI3l39eUyxKjZtbhebLYBU6mTMQMZV2YypK3zlXt05gVBfa2/yq4XQ2+6D85yqybF7MiHfolZ3iv1BKndSzyMJWqyMSUhPuXxcGzzH0pNl/7cJBKPOsNQubNQeqalbfi6qPSyGEeTi90hGl0YewIcUibost4VYPZDr17KN3krsf7YRxRtFUZyN2v9uMIb7TAqa6rt6BpWDhnPKG14+XU6Hul5u/WYN9QohOVkisWkQ7+XpbieaPxwQWr24PJ51SYh2jgNs8MU2chmVi7+OxBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 06:07:09 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 06:07:08 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH] vim: Fix CVE-2026-28417 hostname
 regression
Thread-Topic: [OE-core][wrynose][PATCH] vim: Fix CVE-2026-28417 hostname
 regression
Thread-Index: AQHdNRwACphIQhllaEmMhA3YA5Gu2bbRR2EAgAK2BrM=
Date: Fri, 18 Sep 2026 06:07:08 +0000
Message-ID: 
 <PH0PR11MB7616D0F420B34500AC5930B2D3872@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20260826053017.51184-1-devanshp@cisco.com>
 <DLGQZ2Y90AYV.JQCTYY5WT1PY@smile.fr>
In-Reply-To: <DLGQZ2Y90AYV.JQCTYY5WT1PY@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|MW6PR11MB8438:EE_
x-ms-office365-filtering-correlation-id: f0c210c7-da82-41b5-8038-08df154b129b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|13003099007|38070700021|4143699003|56012099006|11063799006|18002099003|22082099003|8096899003|10067099003;
x-microsoft-antispam-message-info: 
 zBxVVS9bEaBhT1EKtkLQKOM2L0VqhjudW1mfjuTIFFgwaOyq+uMueTbJcSZY/TuBcQwVJLTAuOPbbHVZVyu5TjhrRMg0dRj3c2YBlZC6tvWSgkl5dHmkWSftEMagdKnVwAw+xNqhDf0VJH+w0OvZsJwlwrMfJH++XWNrvoJ4tg4CB+Z+H3RE0Cz8lsIOPi1lNBkfw95u+EhWyq9NOFZXWQ4KnLTnhs5pnMICZ0KQ52eUaq5iOMC1KWufz8flFJaWLijLqAcpEWsUcvevL6SDJfNXoX9WrBZzHdSs817HO6qtH6gWf7NS0sNjxVY9DTxg62XT80Q0R7vRYy10BgEp1tBtOcoCOVMLot8xiTQjlGakEDKvrqSqPddByecFy0SRI7xsPtl3Nn0Kl2tK3+J9jE9WuavU1koQSPNtUb0SatjJGOLhVVBl4VBw9rDk9FnO99vbmQuA8VqDqre8qWLGttza2KqAdxuQjdExxd7utBVAXoBbH+kr67tLojhmZpQ/7UDuB5Ao1PRTr7i5YXRuE7IzHFF4JV3/TgU+yu+QXITXvImB48lgeXMxbE2KO2FRjYE2plgOzu2UrMv8C0WMEjIHf5t11uIfSxX9rF/EmMa4Z/ImZlTm/ngkeDQhgS5KmBVz0kXpGeY2EnkCQN6qvCDufvjv6VMLtqntwLAJl0T/7TH4qewmFGKj5LWObW1zy4F3uLZq2cVScgffDovnT5J09Ml/t2xVcZ05LrJh2Zk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(13003099007)(38070700021)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(8096899003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?cQYrEDP/MU8NUgpmJZF6+SVkAEnVKa4jbxYgQQQcr8hsqEH8dJB8BgCjYf?=
 =?iso-8859-1?Q?ycggqCImDlgh5BYtEbZRvCDXb3B79+7DgqRJ6oYV9lnshWEu39ics/A65U?=
 =?iso-8859-1?Q?dkjIcRLtbPWBzhhVP5H6jxhHmfD4S9tc00FymaMXFwTAHkXxW59wugBDbf?=
 =?iso-8859-1?Q?B3G8iERmkmkRDwumkLRNNw/MCYPsAELv7yjeeKWyJMxGzDZ6emIUXLTcQw?=
 =?iso-8859-1?Q?36uOgNHNS02JL+/O3qI70QHptGkl2TdaBSrgnMinIn19D39YIYWgopZCCn?=
 =?iso-8859-1?Q?2EivnjjkoMffqM0FuG1Buccw5V7XFFIoOGMbE4BD8WEAyWw8M4hWIcZ86X?=
 =?iso-8859-1?Q?xlVYh3UIXOGRAsNP+sbueOJo4VEuuA1w9wDBV4Ys/xUvs8/S0NIolLI19Y?=
 =?iso-8859-1?Q?bcou7gN6BFKkjpTa8vhLz8+669/pIcQp5zkr82yatr8jEvIqIB15SFoVQi?=
 =?iso-8859-1?Q?Nl0ZFXHGuXUwRTrkydVmgcvRWJtbxDtUdK+wjAWcsudg2QBYGrMqy9mZrf?=
 =?iso-8859-1?Q?uk/GX//5m3n0Rj9EhIOBOt1dqTyudhTnsC5hqKNy1n//c9fRsLP60XsVlp?=
 =?iso-8859-1?Q?znwx/t2yp7FXImBm/g8Ge2I/62HbtStkp78rOAIgHNe9ZifTgRpQNoo9iQ?=
 =?iso-8859-1?Q?4uceUtSHFM2Z6ianDfZYzRml+VrG3NDtaLt996zd9RGsTKQSnwxsTOpKYn?=
 =?iso-8859-1?Q?1rhVSKNr057hJRgzb9sDUHmPHLauD6gWgQ+ErBaa8xIkg336l9pcRF6NlR?=
 =?iso-8859-1?Q?9BzAhGsNKBaEt9s2O6f1tnWrb+ytTmDiBJAxqLSyWQb1TYX7UZrMFeLC7n?=
 =?iso-8859-1?Q?cRlEcp8yTg7SaCm9Skq+K0xVNww2+fRBJfopqi+vTlv/xVUO/osCa+nXlM?=
 =?iso-8859-1?Q?/F+aloHi2trgM1fQH//LTYDp5vkD4aXudcfq1tRT+iXICQLXC0K6W2j6si?=
 =?iso-8859-1?Q?pAD2CYM96ycukn7M2o92JmmUsB+Dm5J/N7YsN+moogRRtYM/NjDGWHe8d1?=
 =?iso-8859-1?Q?rg7SDVRPOM9RTDXiiPTO36ENvBEngLgHJkwkigvK3MWDwlRfF5+VcBfPvI?=
 =?iso-8859-1?Q?7lnMKklUQjJxJatkmunqiEGpsK8hh9IPuCB7WaLPlvSle/dQVLhEGyPLM4?=
 =?iso-8859-1?Q?I8V0F4N9E8ettDQSr06Q0aut2oGCJVGPkPwOVdoY0km32vV2/9gsLh+K1P?=
 =?iso-8859-1?Q?a3mTsspGwBR35scVM4rfWsCjSlvmbcH7ab+0qcVGiIGOfZO71DApEOQBgN?=
 =?iso-8859-1?Q?Q9pFHT4ochCaHK2E2gp3cC5ug/lWoTrTUyg2IlfSGtoU8KrY7b6685V+Ls?=
 =?iso-8859-1?Q?7mYtktTi8g7gQwXMw7a2tnTWujvm8AHym+abdv6FCHek4/ZeyEAkgqzSg9?=
 =?iso-8859-1?Q?g6xRBb5G2hUgoy0103KlSyx11Vq2Av4CPVy+bH2vl7e1kgguq6K86sAF6H?=
 =?iso-8859-1?Q?mEdIsAPTL5KbnAwFPaq7L8sEo95Qc1fAQsBdF7cLB54K0tFRiUg4Fp+AzP?=
 =?iso-8859-1?Q?kVF8/XPNAU1XRxt2CX1b/17DCmZza7eh9P6Ismtghk8lip7mOWkbjAInHN?=
 =?iso-8859-1?Q?+rXxCX/w1YQsV088csn1y8ixIvVWKLf0ZMgHUWDjFS/YJcuRWjm5k/AASg?=
 =?iso-8859-1?Q?Qr47b076T9VrxXD7OWCAzOyvccRm0jxWYPKJsL9Dz658k7kMxGSCCKPFS/?=
 =?iso-8859-1?Q?VK/v76otmOscZcLqH/pyA9BiHyO0E+JY3wxmlGL1F5U5fGp41rPAR/8hes?=
 =?iso-8859-1?Q?r8GGk5/z+AxW3rZJjucnAV7PkdUFDXf188SHdHnFRQNcOe?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB7616D0F420B34500AC5930B2D3872PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	U4o3UWVnbAr6oXO8ilQZ3KSa7cV/f1s/fu8mpkIeMKc+d9xbmsmhVkYlhYF9YTNyVFOc1GL+28P9WM3JcjRrVj/lR9N+pbAgb9N+XLEgFMKHN9yOS4sJDALL1w7lzewgSZj8xolcql5VZex23dKBpt0Ftm79Elfc+rwLkqjo+l180AQq5Q7d43SyWPiAe/spxcdTdn6vjxsLIgekvI4k3xplIJftitsrMqM1LUUiEvnLyRQLwbFoIMyjX299uJY8YbZQdM3t7Hu1UuJx7aZ9sMiGrDk8MWJZ4dWUN588il4XJR8aZg4esWU50vKCIyZeovBgQx7N31dEW23QdE1V/A==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c210c7-da82-41b5-8038-08df154b129b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 06:07:08.8501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQSce9+G4FRDZoCcO0Tv/jwg0G61l8FxtN60umJ5PDIAGFft9KMs7VaM7viplKChlxyqpsxFOTbnNdbH2XIRTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 06:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246191

--_000_PH0PR11MB7616D0F420B34500AC5930B2D3872PH0PR11MB7616namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,
I'll refresh the patch and send it again.

Regards,
Devansh Patel
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, September 16, 2026 18:12
To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <dev=
anshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-co=
re@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH] vim: Fix CVE-2026-28417 hostname reg=
ression

On Wed Aug 26, 2026 at 7:30 AM CEST, Devansh Patel via lists.openembedded.o=
rg wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
> hostname validation. That CVE fix requires follow-up regression patches
> because it rejects valid hostnames containing optional ports or
> underscores.
>
> Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which
> corrects optional-port handling. It still needs patch 9.2.0553 to accept
> underscores, so backport that commit and retain its _gateway regression
> test.
>
> The netrw history hunk is adapted to preserve Wrynose's existing
> multi-line history and append the upstream 2026 May 28 entry. The
> src/version.c hunk is omitted because this backport does not change the
> recipe version or Vim's upstream patch-number table.
>
> [1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d6851=
4fcc1
> [2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d=
3cdda
> [3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e2=
64b11
> [4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../files/CVE-2026-28417-regression_p1.patch  | 64 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regress=
ion_p1.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.=
patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
> new file mode 100644
> index 0000000000..e6b81cc0ae
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
> @@ -0,0 +1,64 @@
> +From 2a49c9624cdd552ec975ee8b4f1853a0e4c2a78e Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Thu, 28 May 2026 20:53:53 +0000
> +Subject: [PATCH] patch 9.2.0553: runtime(netrw): netrw rejects hostnames
> + containing _
> +
> +Problem:  runtime(netrw): netrw rejects hostnames containing _
> +          (lilydjwg)
> +Solution: Relax the restriction and allow the underscore
> +
> +fixes: #20344
> +
> +CVE: CVE-2026-28417
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/93d177cd2b6=
9bac58fc51a5a514d7bc71e264b11]
> +
> +Backport Changes:
> +- Preserved Wrynose's multi-line netrw change history and appended the
> +  upstream 2026 May 28 change instead of replacing it with a single date=
.
> +- Omitted src/version.c because this backport does not change the recipe=
's
> +  Vim version or its upstream patch-number table.
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
> + src/testdir/test_plugin_netrw.vim              | 1 +
> + 2 files changed, 4 insertions(+), 2 deletions(-)

Hello,

Sorry, but this patch now fails to apply:
    ERROR: vim-9.2.0340-r0 do_patch: Applying patch 'meta/recipes-support/v=
im/files/CVE-2026-28417-regression_p1.patch' on target directory 'bitbake-b=
uilds/wrynose/tmp/work/x86-64-v3-oe-linux/vim/9.2.0340/sources/vim-9.2.0340=
'
    CmdError('quilt --quiltrc bitbake-builds/wrynose/tmp/work/x86-64-v3-oe-=
linux/vim/9.2.0340/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: App=
lying patch CVE-2026-28417-regression_p1.patch
    patching file runtime/pack/dist/opt/netrw/autoload/netrw.vim
    Hunk #1 FAILED at 24.
    Hunk #2 succeeded at 2604 (offset 1 line).
    1 out of 2 hunks FAILED -- rejects in file runtime/pack/dist/opt/netrw/=
autoload/netrw.vim
    patching file src/testdir/test_plugin_netrw.vim
    Patch CVE-2026-28417-regression_p1.patch does not apply (enforce with -=
f)

    stderr: ')

Can you refresh and resend?

Thanks!
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB7616D0F420B34500AC5930B2D3872PH0PR11MB7616namp_
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
Hello Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I'll refresh the patch and send it again.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Devansh Patel<span style=3D"font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, September 16, 2026 18:12<br>
<b>To:</b> Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;devanshp@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] vim: Fix CVE-2026-28417 hostn=
ame regression
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Wed Aug 26, 2026 at 7:30 AM CEST, Devans=
h Patel via lists.openembedded.org wrote:<br>
&gt; From: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;<br>
&gt; The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw<=
br>
&gt; hostname validation. That CVE fix requires follow-up regression patche=
s<br>
&gt; because it rejects valid hostnames containing optional ports or<br>
&gt; underscores.<br>
&gt;<br>
&gt; Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which<b=
r>
&gt; corrects optional-port handling. It still needs patch 9.2.0553 to acce=
pt<br>
&gt; underscores, so backport that commit and retain its _gateway regressio=
n<br>
&gt; test.<br>
&gt;<br>
&gt; The netrw history hunk is adapted to preserve Wrynose's existing<br>
&gt; multi-line history and append the upstream 2026 May 28 entry. The<br>
&gt; src/version.c hunk is omitted because this backport does not change th=
e<br>
&gt; recipe version or Vim's upstream patch-number table.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/vim/vim/commit/79348dbbc09332130f4c8=
6045e1541d68514fcc1" id=3D"OWA866edb13-0351-38c6-76ab-d7dd245baa8a" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1<=
/a><br>
&gt; [2] <a href=3D"https://github.com/vim/vim/commit/a6198523fb28a50d96945=
458792cdb4787d3cdda" id=3D"OWAb8b0988f-fe0f-8b02-9441-c40cd90d7ca8" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda<=
/a><br>
&gt; [3] <a href=3D"https://github.com/vim/vim/commit/93d177cd2b69bac58fc51=
a5a514d7bc71e264b11" id=3D"OWAaddb1d8b-9fad-01c4-28d7-7f6c85abb855" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11<=
/a><br>
&gt; [4] <a href=3D"https://github.com/vim/vim/security/advisories/GHSA-m3x=
h-9434-g336" id=3D"OWAfadb1da1-9d16-14f2-2088-8258d0bb5e9a" class=3D"OWAAut=
oLink" data-auth=3D"NotApplicable">
https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336</a><br>
&gt;<br>
&gt; Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../files/CVE-2026-28417-regression_p1.patch&nbsp; | 64 ++++++++=
+++++++++++<br>
&gt;&nbsp; meta/recipes-support/vim/vim.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 65 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417=
-regression_p1.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_=
p1.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e6b81cc0ae<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patc=
h<br>
&gt; @@ -0,0 +1,64 @@<br>
&gt; +From 2a49c9624cdd552ec975ee8b4f1853a0e4c2a78e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Christian Brabandt &lt;cb@256bit.org&gt;<br>
&gt; +Date: Thu, 28 May 2026 20:53:53 +0000<br>
&gt; +Subject: [PATCH] patch 9.2.0553: runtime(netrw): netrw rejects hostna=
mes<br>
&gt; + containing _<br>
&gt; +<br>
&gt; +Problem:&nbsp; runtime(netrw): netrw rejects hostnames containing _<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (lilydjwg)<br>
&gt; +Solution: Relax the restriction and allow the underscore<br>
&gt; +<br>
&gt; +fixes: #20344<br>
&gt; +<br>
&gt; +CVE: CVE-2026-28417<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/vim/vim/comm=
it/93d177cd2b69bac58fc51a5a514d7bc71e264b11" id=3D"OWA82e8b957-89e5-9d0e-54=
54-537506adc645" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://=
github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Preserved Wrynose's multi-line netrw change history and appended th=
e<br>
&gt; +&nbsp; upstream 2026 May 28 change instead of replacing it with a sin=
gle date.<br>
&gt; +- Omitted src/version.c because this backport does not change the rec=
ipe's<br>
&gt; +&nbsp; Vim version or its upstream patch-number table.<br>
&gt; +<br>
&gt; +Signed-off-by: Christian Brabandt &lt;cb@256bit.org&gt;<br>
&gt; +(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)<=
br>
&gt; +Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; +---<br>
&gt; + runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--<br>
&gt; + src/testdir/test_plugin_netrw.vim&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
&gt; + 2 files changed, 4 insertions(+), 2 deletions(-)<br>
<br>
Hello,<br>
<br>
Sorry, but this patch now fails to apply:<br>
&nbsp;&nbsp;&nbsp; ERROR: vim-9.2.0340-r0 do_patch: Applying patch 'meta/re=
cipes-support/vim/files/CVE-2026-28417-regression_p1.patch' on target direc=
tory 'bitbake-builds/wrynose/tmp/work/x86-64-v3-oe-linux/vim/9.2.0340/sourc=
es/vim-9.2.0340'<br>
&nbsp;&nbsp;&nbsp; CmdError('quilt --quiltrc bitbake-builds/wrynose/tmp/wor=
k/x86-64-v3-oe-linux/vim/9.2.0340/recipe-sysroot-native/etc/quiltrc push', =
0, 'stdout: Applying patch CVE-2026-28417-regression_p1.patch<br>
&nbsp;&nbsp;&nbsp; patching file runtime/pack/dist/opt/netrw/autoload/netrw=
.vim<br>
&nbsp;&nbsp;&nbsp; Hunk #1 FAILED at 24.<br>
&nbsp;&nbsp;&nbsp; Hunk #2 succeeded at 2604 (offset 1 line).<br>
&nbsp;&nbsp;&nbsp; 1 out of 2 hunks FAILED -- rejects in file runtime/pack/=
dist/opt/netrw/autoload/netrw.vim<br>
&nbsp;&nbsp;&nbsp; patching file src/testdir/test_plugin_netrw.vim<br>
&nbsp;&nbsp;&nbsp; Patch CVE-2026-28417-regression_p1.patch does not apply =
(enforce with -f)<br>
<br>
&nbsp;&nbsp;&nbsp; stderr: ')<br>
<br>
Can you refresh and resend?<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB7616D0F420B34500AC5930B2D3872PH0PR11MB7616namp_--

