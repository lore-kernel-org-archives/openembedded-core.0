Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C1FC4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:41:27 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7572.1784266878400350655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DHa4N48o;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=394979; q=dns/txt;
  s=iport01; t=1784266878; x=1785476478;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=pvulZSQ4rcZspTPQOLA6Tm2aIm3EFxSwTFoQce0mRv8=;
  b=DHa4N48oIGAI9IbNFMjERG0O53BsGEHQeUZsLL5LkPU6nH98IyGUp9jH
   tjLUed092rDzPRRHfmtuj/AqcH27za2FycqpG5WRuDFKYII3vq7sgBYdk
   RnFhuCCgPjUL8iBUdSxW/HP8vn6mc3Ix7TVXQUGKEXEzqLQPm/MYNoH1/
   MGwKjOMKBy7KDqR48w2+t/zZvFLgItIxU/FRDDhgbf28ZU6cXgMZH7f9U
   NrJ2z8eZwqACMwf4u+s3ZzQ+6d716Z8HkeH9SmlVWLaSXSG9KBHtREC1s
   4is/1lfWhfPwYXpY2C0JFnTesgW85/xZSDCxB4LgL7TvoEhqrKPjRYBhj
   g==;
X-CSE-ConnectionGUID: JjF6Oi44QF+o/NJIft6eRQ==
X-CSE-MsgGUID: VFuHVS5STHGFOSqqeMBXoA==
X-IPAS-Result: A0DRBAByt1lq/4oQJK3AQJNTBgMCIwMHh3aPLYG5Lw
IronPort-PHdr: A9a23:XOmQiB93t812vf9uWBDoyV9kXcBvk7zwOghQ7YIolPcUNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:X4l7Pa40Arjc1Qfq3nVZpAxRtGDGchMFZxGqfqrLsTDasY5as4F+v
 jYcUWCAb//bYGr0f9t/YITjp0tSusDSmoNmHQpopXtmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1NtfrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eH482pMF2XT132
 78fbxYvTx6f2e+M+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZOE0n1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3Fb4qPKoTbGJ8O9qqej
 lzo4kTHOUwhCPyw5x2+62uho8X/mgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWUHmJWeSGmW8fGfqjbaBMTfBTVqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:MlRk3KlvpcgwmBfZKnrBZGNvyyfpDfMliWdD5ihNYBxZY6Wkfp
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
X-Talos-CUID: =?us-ascii?q?9a23=3AxFbhlmsH7/zEsROArBPHn+bv6IsHcFOD63aMf3a?=
 =?us-ascii?q?WSmEubp+0R0PO9Zldxp8=3D?=
X-Talos-MUID: 9a23:Ge3iOgiA68p80dxPVfP3UcMpCul1w5qVVXsxsboonPKdLCFVEQeapWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:41:17 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 807A6180003F4
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:41:17 +0000 (GMT)
X-CSE-ConnectionGUID: DVQOuTH3TrGczRbb/ZT8dQ==
X-CSE-MsgGUID: vpE+CE7GTbOFnJOBzMgqxQ==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208,217";a="55965076"
Received: from mail-westus2azon11012043.outbound.protection.outlook.com (HELO MW6PR02CU001.outbound.protection.outlook.com) ([52.101.48.43])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wma58iE++ktM9HbcoeMnbtJhaobtOh8LjVD30iqp0Q4wbeKSOfqc1dE1U4soMBi4qxKOHdJSg6j+bGPaooqC1qBwkIqnk5IIuv+0nlcZ1h1cRrgywB48ffqTAPDbeU7Of+jPSVSJJq+mih6KCYCVshqhVvx9r1zkn1kc8otDESkdYJ+ae451mQ6vCFHiEQwYBvaJvYiHMwFgrJCBZyUeuaL9e2G1NPl9G/6DGj9lLvmtSGkOghQBfQgJDlzOpBUAHVUO4SSrfVQAGbJFRNohcX0EjQUZc+1QP56O1dneSANNDkKMfBXoBeO2d8b6nk6gmaSJjPKc5aMYpO7KzNdVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvulZSQ4rcZspTPQOLA6Tm2aIm3EFxSwTFoQce0mRv8=;
 b=kHYpo51r8/nbd3d0CI/BQXoXzjPBKpjD3nuyRQ7FTFIDk9Gi+X24bJbkQGQhw+wGMsbcBpiaCTLFV1p1DdymvLeA1+ZQAwAs4dqAPbjtDCrYhDx/KUPk/PBbZgC5Ddw65zCLnehvr64TwvbzUv9dRqeCvxqUWOghCbpbme4TnJT3ke6cXK9yPoFHdo5JwjDVLrXe3No0fQ4hYOc2wfBBpxD7PXjs/KKIuDi/aRj2LBzSMcHT5+sDlfpUgCxCzcgyKzpcbwQtVCVh095SXyLb9OIXsYOEp2/NmEGPh5YTOaB2cKCfOX5cWoFOEGgV2mq9TiMk6zZxhw4jOGS+wNq5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:41:13 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:41:13 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 2/6] rsync: Fix CVE-2026-43619
Thread-Topic: [wrynose][PATCH v2 2/6] rsync: Fix CVE-2026-43619
Thread-Index: AQHdFawW/sKdpJeS00iYwheSxzgzXbZxMmFu
Date: Fri, 17 Jul 2026 05:41:12 +0000
Message-ID: 
 <PH0PR11MB5902B0D383F9119AB84AF482CFC62@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
 <20260717052059.773645-3-asparmar@cisco.com>
In-Reply-To: <20260717052059.773645-3-asparmar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 78797f0c-fcda-455a-202f-08dee3c602e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|25016099003|12006099003|29003799003|16056099006|13003099007|22082099003|38070700021|18002099003|8096899003|56012099006|5023799004|11063799006|10067099003|3023799007|4143699003|6133799003;
x-microsoft-antispam-message-info: 
 XzpRrh3NffTSfddR6IVVS/yD8DS2SBiRGJpsZYkptS3//Lrf44MjjK7BkMAhFJEw5VFmt/mgh6j+aTpc4KRQLvvZ8rojMvvDNsqH/u48//p+OlwjDHAwXoaD7bVRw0QDEHzbG2uEQ4jFu7Jiy5WO6iS/538wrJkEm04D7jNQUnf8API3rUV0KFyWnaD8EOeI8ke5uUeAQq4UNp5cNopDZpYjI0I3HSnysg8u4Cz23mXVUnUv574KPYeRAlamU9r5nY7dqBtGFiWmd8f8A5aUBLfYbepIe1wD1gnl16rlM1+V/dvqGZ6y4Pk8Kk2i0GlaZGBn+YTbTr/amwea5idAmPVEDKyX8N/f7BIAMTd0KoMH4t4i04Wuu5madO0Fdi+LLCJj7uXH+7qljiBqKypxWuHT+Ad3w0F+uESjPvTrKSBSZps3kaX/6vrozS2xeYvFWRiBdmML0YBjzxpxeuW4GnPsnfH4XsTADHcH9Pd0bRW0irmAsNyiHFrgVcsIHrqSUGeJpvlqQf9SLW0q8g7HteuLLnhX8bzgHwh4WB41x8TEh8RVp0e8KS94SMII2HMroHBoYVwsnWXSO5y8RRAkRQpL1zBwRw82toRfKqML+iawoQudq2BdebHjBIbfnSK/66DHKpC+nM46mcuMKihI6bSw0MwxPkEw0rzex3K6RH4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(25016099003)(12006099003)(29003799003)(16056099006)(13003099007)(22082099003)(38070700021)(18002099003)(8096899003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GB8jZEz4SK/ZrdACtA/DI7rzYmVmJFFUzeR/SqKfJpffaZ8jct1nLHvNuZn8?=
 =?us-ascii?Q?fMtu/i4vCXN0RFnbk820Pj1Q9w2BLUwIyXMhAhzN9ZdGL1RFLngftz7/Z5TC?=
 =?us-ascii?Q?UXM2EEQ0uIFDxmHdA0+Nf9PQVRgh6ptVNIob1ot6A8GAQOQ0AzUN2uAIrvXr?=
 =?us-ascii?Q?RTSAKz3Fdbpo1NXRT9z0HOaWJbATzPaXhNdSt9EzxHfxXrk05MCNAAvHmmU2?=
 =?us-ascii?Q?02K3u7DZDwcuZEyTlOLf5OCbA1SI6c3wBW79vjXByKNK9aEjAY7ydmyQ6YQy?=
 =?us-ascii?Q?sodPx3soppPSWp8CWMRkE6pYu0nT4tqKggkrRF0Na8EjeokxWnBO32+XWjHT?=
 =?us-ascii?Q?MHF6+7TV4PIXM+WG3xvWQhwLg5brD0Kp6V8o3nlUIE0Vfk1unXOLGB6L4+fC?=
 =?us-ascii?Q?58xYuwX8GuvlaHJPOykVfz6Zqo0KjKyORwkIZkwhkoyLmGAss13PABL3ISxm?=
 =?us-ascii?Q?m12WBUiqFMSnxCnaoFDuIhgDNoBejufjGVdXiGpJrBwVhKBobPlTyE4luhIS?=
 =?us-ascii?Q?dKF3OkbjP6P1bC2J96wnW5YW+uO8RUYAgEtFmcC+eOTyVOoC/Cu4sM1zCRam?=
 =?us-ascii?Q?sGS6sFiHy2mmD+7XRdYqQqpdJm97UrhM12uzx/LUFUtSohgzXiAA+7+w52HM?=
 =?us-ascii?Q?vXaPek5YQUDQ/WbGuL8M8m5CtSCQ1KP/1iUNnzqgoxl8foLqIiLSxGljxvwG?=
 =?us-ascii?Q?DwooUFXWKlfWxVwXIl0IH/M23f76Gkc/MndUhQ9my1a9xEPZTOxaaRbH6+mK?=
 =?us-ascii?Q?BE0JYiYlBbHN5f9IvqswkXIKaT6wVa4m+rALVIPoNbeN89DM3SLPV4zw6s5U?=
 =?us-ascii?Q?1rJ2R4g51SSUc3YbydShhUJzA602GPrhTS5QBmjRSfd9bHu/w5AeMzWRNUmT?=
 =?us-ascii?Q?rIQxRqnwiEsJieCDKb0+OKNjqZsdBBp0loonx3imHZTq/t7h3sPFYlyPgphB?=
 =?us-ascii?Q?WBDXdYpQYVtC+7630qqlYb1V7AXKwZZb+29UmyEUv1fhbqWis28r/Y1Dp0Vn?=
 =?us-ascii?Q?oIooNGcKYjceXj2NOTm/ctdBM544JUhdUr+pKzHIjz11maV1L8V/KVFxVxCm?=
 =?us-ascii?Q?qrhq4LzhgLEd/MVG7Z/YYL3uHuu94Ejr6CVVYyWlBMsiYqsSaR9BjU6TRijk?=
 =?us-ascii?Q?ykz4cnPdD+7h9yEA6Rvwehu6Mld7+U5JEMJyKIY0x44PPqCRSKJUHpvx5Vko?=
 =?us-ascii?Q?wpXj/Bn18EBMqQVJyvetQ2MuamCqkh5hKNHaG3TZSDZW1Jd4iswh+Atfe0hx?=
 =?us-ascii?Q?4vvdxcQPVwGvHwFDrhbBU66HxlAuHuB6PfU4TPTdnAOJYyVEpapSBmnEWbeK?=
 =?us-ascii?Q?JOqcMMoILz+AA2GLHC8n1PJMDZDP5CYrbrOJsAB2AxWE5X81vYX4y6I35p3c?=
 =?us-ascii?Q?7uYmpnqUC+nEQHsHFk0dobdgTou38vQGoGvIex4eg7sXKNwwaw+OqcSg+16h?=
 =?us-ascii?Q?+1NKYYYQDwAs1ebxdcvmwFxdLGRCK0ZVc+mkbXr7QEaldygJrElLfLBj4deg?=
 =?us-ascii?Q?iCVbT46yyGEY+v86ODLOwqCmWYpOr304QtI/v805CalLfbPsMyj0NdXVcE/7?=
 =?us-ascii?Q?aPmFquyzsUxUx72ZJ4qPVH359gGVjJMa1143cK4WaoOpFVNJEn5uiwZ0iVZV?=
 =?us-ascii?Q?xiTMHIOM4C3KlLlc0Tzkj+9+/RqN50tgPt3HXqg6OLxGq5HhKNB4oXgMz1fq?=
 =?us-ascii?Q?0oxvBe+IxSehnCV7m1AlxSBX4kOpTcKabaHCwdm3t/02eoJ/?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5902B0D383F9119AB84AF482CFC62PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	OfVwJ4HmdSU1YzDW8nRjr45drIqzVtVnLYR7fyl150d0FSh349XnclljdW0KSD5+2zyA5aCNnHc2OngwmsPZF1lDtHqGH5KCHjI8ltGYwU8iue7OYERyEPFGy9uDFwkErVg7+DrJ4+4aAFpJZowXAsuT9iVmxkZ1zHDTjv7nxJlbMs5qEyblbu+ZIBdOoq8C8PWwGP3RJnExkPXYDpcjYtJhxELZQAC88VjimoCPSTBAuErOhBWjuth9OmKJvVXKZ46HcS++v9af8GNOGhkuT6D8jnmGtderNsCjivlABWQLn2xHbM19+PangDetZ9pJB7hv8A5tFcukkuO4UlIBLA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78797f0c-fcda-455a-202f-08dee3c602e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 05:41:12.3907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbldv+hMkwfWaOqZM9Dn9HwNoYO1FmjRZXl0GfLn+KGNOkMph3DsafVklCR5UqqzNpaGjLKnLNBqRVfOqo/4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241135

--_000_PH0PR11MB5902B0D383F9119AB84AF482CFC62PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please ignore this patch series. I will send corrected patches again.

Regards,
Ashish.

________________________________
From: Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco=
) <asparmar@cisco.com>
Sent: 17 July 2026 10:50
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 2/6] rsync: Fix CVE-2026-43619

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch backports the upstream rsync v3.4.3 symlink-race fix chain
for CVE-2026-43619. The upstream NEWS entry describes this CVE as
symlink races on path-based system calls in "use chroot =3D no" daemon
mode, generalizing CVE-2026-29518 beyond the receiver's open() path.

The backported commits form the following linear upstream chain:

- [1] closes the receiver-side do_chmod() path.
- [2] closes the daemon-no-chroot change_dir() escape.
- [3] adds the remaining symlink-race-safe do_*_at() wrappers and
  migrates the affected path-based syscall users.
- [4] closes adjacent bare-path copy/open surfaces. Upstream titles this
  commit "defence-in-depth", but it is in the same linear v3.4.3
  symlink-race fix chain and Debian's rsync 3.4.1+ds1-5+deb13u3
  security update carries it as part of the CVE-2026-43619 patch train.

The v3.4.3 security train also has portability and functional follow-ups
that were released in v3.4.4, so this CVE-scoped backport includes them
under CVE-2026-43619:

- [5] adds the mknodat()/mkfifoat() configure fallback used by the new
  do_mknod_at() path.
- [6] gates <linux/openat2.h> and openat2() use behind configure/runtime
  checks so systems without the header or usable syscall fall back safely.

The upstream fixed security release is referenced in [7], the v3.4.4
follow-up release is referenced in [8], and the public advisory is
referenced in [9]. The Debian tracker entry is referenced in [10].
Individual backported commit links are also recorded in the embedded
patch headers.

[1] https://github.com/RsyncProject/rsync/commit/862fe4eeaf82178324c66e504b=
f2c6c2e4038f99
[2] https://github.com/RsyncProject/rsync/commit/15d296425609a997f56eb8f901=
7ff73922f99b20
[3] https://github.com/RsyncProject/rsync/commit/30656c5e358b1c6033f4caf24f=
3e11b29d25c9f4
[4] https://github.com/RsyncProject/rsync/commit/3cc6a9e8cdcffb637ecdd41dae=
47833096dca317
[5] https://github.com/RsyncProject/rsync/commit/f3757a470ad3defdb2c4c6ad33=
4e3839f3c7f1ae
[6] https://github.com/RsyncProject/rsync/commit/c14e2258b59a3f16a99c6e83a2=
8660ba438a73e9
[7] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
[8] https://github.com/RsyncProject/rsync/releases/tag/v3.4.4
[9] https://github.com/RsyncProject/rsync/security/advisories/GHSA-4h9m-w5f=
f-j735
[10] https://security-tracker.debian.org/tracker/CVE-2026-43619

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43619_p1.patch       |  471 +++++
 .../rsync/files/CVE-2026-43619_p2.patch       |  205 ++
 .../rsync/files/CVE-2026-43619_p3.patch       | 1783 +++++++++++++++++
 .../rsync/files/CVE-2026-43619_p4.patch       |  568 ++++++
 .../rsync/files/CVE-2026-43619_p5.patch       |   69 +
 .../rsync/files/CVE-2026-43619_p6.patch       |  264 +++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |    6 +
 7 files changed, 3366 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p5.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.pat=
ch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch
new file mode 100644
index 0000000000..b1556e51fa
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch
@@ -0,0 +1,471 @@
+From e406eb555ea1fadb7c0dd8ddef3fde1b92771aa7 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Mon, 4 May 2026 21:53:14 +1000
+Subject: [PATCH] syscall+receiver: secure receiver-side do_chmod against
+ symlink-race TOCTOU
+
+CVE-2026-29518's fix routed the receiver's open() through
+secure_relative_open(), but every other path-based syscall the
+receiver runs on sender-controllable paths is vulnerable to the
+same TOCTOU primitive. This commit closes the chmod variant.
+
+Add do_chmod_at() that opens the parent of fname under
+secure_relative_open() and uses fchmodat() against the resulting
+dirfd. Gate the secure path on am_daemon && !am_chrooted (the same
+gate use_secure_symlinks already uses for the receiver basis-file
+open), so non-daemon callers and chrooted daemons keep the original
+do_chmod() fast path.
+
+Migrate the receiver-side do_chmod() call sites in delete.c,
+generator.c, rsync.c, and xattrs.c.
+
+Adds testsuite/chmod-symlink-race.test (with t_chmod_secure helper)
+as regression coverage.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/86=
2fe4eeaf82178324c66e504bf2c6c2e4038f99]
+
+Backport Changes:
+- Upstream also updates runtests.py and a newer Makefile.in test
+  helper list that includes simdtest. Wrynose 3.4.1 does not carry
+  runtests.py and its CHECK_PROGS list has no simdtest entry, so
+  those test-runner hunks were not applicable.
+
+(cherry picked from commit 862fe4eeaf82178324c66e504bf2c6c2e4038f99)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Makefile.in                       |   9 ++-
+ delete.c                          |   4 +-
+ generator.c                       |   4 +-
+ rsync.c                           |   2 +-
+ syscall.c                         |  80 ++++++++++++++++++++
+ t_chmod_secure.c                  | 117 ++++++++++++++++++++++++++++++
+ t_stub.c                          |   2 +
+ testsuite/chmod-symlink-race.test |  68 +++++++++++++++++
+ xattrs.c                          |   6 +-
+ 9 files changed, 282 insertions(+), 10 deletions(-)
+ create mode 100644 t_chmod_secure.c
+ create mode 100755 testsuite/chmod-symlink-race.test
+
+diff --git a/Makefile.in b/Makefile.in
+index 2c5cf996..c30b8876 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -62,12 +62,13 @@ TLS_OBJ =3D tls.o syscall.o util2.o t_stub.o lib/compa=
t.o lib/snprintf.o lib/perms
+
+ # Programs we must have to run the test cases
+ CHECK_PROGS =3D rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(=
EXEEXT) \
+-      testrun$(EXEEXT) trimslash$(EXEEXT) t_unsafe$(EXEEXT) wildtest$(EXE=
EXT)
++      testrun$(EXEEXT) trimslash$(EXEEXT) t_unsafe$(EXEEXT) t_chmod_secur=
e$(EXEEXT) \
++      wildtest$(EXEEXT)
+
+ CHECK_SYMLINKS =3D testsuite/chown-fake.test testsuite/devices-fake.test =
testsuite/xattrs-hlink.test
+
+ # Objects for CHECK_PROGS to clean
+-CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
rimslash.o wildtest.o
++CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
_chmod_secure.o trimslash.o wildtest.o
+
+ # note that the -I. is needed to handle config.h when using VPATH
+ .c.o:
+@@ -183,6 +184,10 @@ T_UNSAFE_OBJ =3D t_unsafe.o syscall.o util1.o util2.o=
 t_stub.o lib/compat.o lib/sn
+ t_unsafe$(EXEEXT): $(T_UNSAFE_OBJ)
+        $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_UNSAFE_OBJ) $(LIBS)
+
++T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o util1.o util2.o t_stub.=
o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o
++t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)
++      $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_CHMOD_SECURE_OBJ) $(LIBS)
++
+ .PHONY: conf
+ conf: configure.sh config.h.in
+
+diff --git a/delete.c b/delete.c
+index 89c1f8d6..ded0ab2a 100644
+--- a/delete.c
++++ b/delete.c
+@@ -98,7 +98,7 @@ static enum delret delete_dir_contents(char *fname, uint=
16 flags)
+
+                strlcpy(p, fp->basename, remainder);
+                if (!(fp->mode & S_IWUSR) && !am_root && fp->flags & FLAG_=
OWNED_BY_US)
+-                      do_chmod(fname, fp->mode | S_IWUSR);
++                      do_chmod_at(fname, fp->mode | S_IWUSR);
+                /* Save stack by recursing to ourself directly. */
+                if (S_ISDIR(fp->mode)) {
+                        if (delete_dir_contents(fname, flags | DEL_RECURSE=
) !=3D DR_SUCCESS)
+@@ -139,7 +139,7 @@ enum delret delete_item(char *fbuf, uint16 mode, uint1=
6 flags)
+        }
+
+        if (flags & DEL_NO_UID_WRITE)
+-              do_chmod(fbuf, mode | S_IWUSR);
++              do_chmod_at(fbuf, mode | S_IWUSR);
+
+        if (S_ISDIR(mode) && !(flags & DEL_DIR_IS_EMPTY)) {
+                /* This only happens on the first call to delete_item() si=
nce
+diff --git a/generator.c b/generator.c
+index b56fa569..e5aff654 100644
+--- a/generator.c
++++ b/generator.c
+@@ -1499,7 +1499,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,
+ #ifdef HAVE_CHMOD
+                if (!am_root && (file->mode & S_IRWXU) !=3D S_IRWXU && dir=
_tweaking) {
+                        mode_t mode =3D file->mode | S_IRWXU;
+-                      if (do_chmod(fname, mode) < 0) {
++                      if (do_chmod_at(fname, mode) < 0) {
+                                rsyserr(FERROR_XFER, errno,
+                                        "failed to modify permissions on %=
s",
+                                        full_fname(fname));
+@@ -2111,7 +2111,7 @@ static void touch_up_dirs(struct file_list *flist, i=
nt ndx)
+                        continue;
+                fname =3D f_name(file, NULL);
+                if (fix_dir_perms)
+-                      do_chmod(fname, file->mode);
++                      do_chmod_at(fname, file->mode);
+                if (need_retouch_dir_times) {
+                        STRUCT_STAT st;
+                        if (link_stat(fname, &st, 0) =3D=3D 0 && mtime_dif=
fers(&st, file)) {
+diff --git a/rsync.c b/rsync.c
+index b130aba5..cc46a2f9 100644
+--- a/rsync.c
++++ b/rsync.c
+@@ -657,7 +657,7 @@ int set_file_attrs(const char *fname, struct file_stru=
ct *file, stat_x *sxp,
+
+ #ifdef HAVE_CHMOD
+        if (!BITS_EQUAL(sxp->st.st_mode, new_mode, CHMOD_BITS)) {
+-              int ret =3D am_root < 0 ? 0 : do_chmod(fname, new_mode);
++              int ret =3D am_root < 0 ? 0 : do_chmod_at(fname, new_mode);
+                if (ret < 0) {
+                        rsyserr(FERROR_XFER, errno,
+                                "failed to set permissions on %s",
+diff --git a/syscall.c b/syscall.c
+index dcecda1a..06d5ed3f 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -281,6 +281,86 @@ int do_chmod(const char *path, mode_t mode)
+                return code;
+        return 0;
+ }
++
++/*
++  Symlink-race-safe variant of do_chmod() for receiver-side use.
++
++  Threat model: on a daemon running with "use chroot =3D no" (the prerequ=
isite
++  for CVE-2026-29518), a local attacker can race a symlink swap of one of
++  the parent directory components of a path the receiver is about to chmo=
d.
++  Because chmod() resolves symlinks at every component, the swap redirect=
s
++  the chmod outside the receiver's confinement.
++
++  Defence: open the *parent* directory of fname under secure_relative_ope=
n()
++  (which uses openat2(RESOLVE_BENEATH) on Linux 5.6+, openat() with
++  O_RESOLVE_BENEATH on FreeBSD 13+ and macOS 15+ (Sequoia), or a per-comp=
onent
++  O_NOFOLLOW walk elsewhere) and do fchmodat() against that dirfd. A syml=
ink
++  substituted into one of the parent components is then either followed
++  within the tree (legitimate dir-symlinks still work) or rejected by the
++  kernel (escape attempts fail).
++
++  Final-component handling matches do_chmod(): fchmodat() with flag 0
++  follows a symlink at the final component, which is the same behaviour a=
s
++  chmod() and matches every current call site (the file being chmod'd is
++  one the receiver itself just created or transferred). For the rare case
++  where the caller wants to chmod a symlink-as-an-object (S_ISLNK in the
++  mode bits), we fall through to do_chmod() which has portability code fo=
r
++  that case.
++
++  Falls back to do_chmod() for absolute paths and for paths with no paren=
t
++  component, where there is nothing to protect against.
++*/
++int do_chmod_at(const char *fname, mode_t mode)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      /* Only the daemon-without-chroot case is exposed to the symlink-
++       * race attack: a chroot already confines the receiver, and a
++       * non-daemon rsync runs with the user's own authority so a
++       * symlink they planted can only redirect to files they could
++       * already access.  Everywhere else, fall through to plain
++       * do_chmod() to avoid the dirfd-open overhead on every call. */
++      if (!am_daemon || am_chrooted)
++              return do_chmod(fname, mode);
++
++      if (!fname || !*fname || *fname =3D=3D '/' || S_ISLNK(mode))
++              return do_chmod(fname, mode);
++
++      slash =3D strrchr(fname, '/');
++      if (!slash)
++              return do_chmod(fname, mode);
++
++      dlen =3D slash - fname;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, fname, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D fchmodat(dfd, bname, mode, 0);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_chmod(fname, mode);
++#endif
++}
+ #endif
+
+ int do_rename(const char *old_path, const char *new_path)
+diff --git a/t_chmod_secure.c b/t_chmod_secure.c
+new file mode 100644
+index 00000000..114dfb2d
+--- /dev/null
++++ b/t_chmod_secure.c
+@@ -0,0 +1,117 @@
++/*
++ * Test harness for do_chmod_at(). Confirms the symlink-TOCTOU
++ * primitive used by CVE-2026-29518 (and its incomplete-fix follow-up
++ * for chmod) is closed by do_chmod_at(): a parent directory component
++ * being a symlink that escapes the receiver's confinement must be
++ * rejected, while a parent symlink that resolves *within* the tree
++ * must still work (so legitimate dir-symlinks are not regressed).
++ *
++ * Not linked into rsync itself.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include "rsync.h"
++
++#include <sys/stat.h>
++
++int dry_run =3D 0;
++int am_root =3D 0;
++int am_sender =3D 0;
++int read_only =3D 0;
++int list_only =3D 0;
++int copy_links =3D 0;
++int copy_unsafe_links =3D 0;
++extern int am_daemon, am_chrooted;
++
++short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
++
++static int errs =3D 0;
++
++static void check(const char *label, int actual_rc, int expect_ok,
++                const char *path, mode_t expected_mode)
++{
++      struct stat st;
++      int got_ok =3D (actual_rc =3D=3D 0);
++      if (got_ok !=3D expect_ok) {
++              fprintf(stderr, "FAIL [%s]: rc=3D%d errno=3D%d (%s), expect=
ed %s\n",
++                      label, actual_rc, errno, strerror(errno),
++                      expect_ok ? "success" : "rejection");
++              errs++;
++              return;
++      }
++      if (path && stat(path, &st) < 0) {
++              fprintf(stderr, "FAIL [%s]: stat(%s) failed: %s\n",
++                      label, path, strerror(errno));
++              errs++;
++              return;
++      }
++      if (path && (st.st_mode & 07777) !=3D expected_mode) {
++              fprintf(stderr,
++                      "FAIL [%s]: %s mode is 0%o, expected 0%o\n",
++                      label, path, st.st_mode & 07777, expected_mode);
++              errs++;
++              return;
++      }
++      fprintf(stderr, "OK   [%s]\n", label);
++}
++
++int main(int argc, char **argv)
++{
++      if (argc !=3D 2) {
++              fprintf(stderr, "usage: %s <module-dir>\n", argv[0]);
++              return 2;
++      }
++      if (chdir(argv[1]) < 0) {
++              perror("chdir");
++              return 2;
++      }
++
++      /* Simulate the daemon-without-chroot deployment that do_chmod_at()
++       * defends. With am_daemon=3D0 or am_chrooted=3D1 the wrapper falls
++       * through to plain do_chmod() and the symlink-race test would be
++       * meaningless. */
++      am_daemon =3D 1;
++      am_chrooted =3D 0;
++
++      /* Test layout (all inside the directory we just chdir'd to):
++       *
++       *     ./realdir/sentinel        -- regular target file
++       *     ./inside_link -> realdir  -- legitimate dir-symlink within t=
he tree
++       *     ./escape_link -> ../trap  -- attacker swap, target outside t=
ree
++       *     ../trap/sentinel          -- the file the attacker wants to =
alter
++       *
++       * The shell wrapper that calls this helper has set both sentinel
++       * files to mode 0600 so we have a clean baseline to compare.
++       */
++
++      /* Scenario A: legitimate parent dir-symlink, chmod must succeed. *=
/
++      int rc =3D do_chmod_at("inside_link/sentinel", 0640);
++      check("A: legit dir-symlink within tree",
++            rc, 1, "realdir/sentinel", 0640);
++
++      /* Scenario B: parent symlink escapes the tree -- chmod must be
++       * rejected and the outside file's mode must be unchanged. */
++      rc =3D do_chmod_at("escape_link/sentinel", 0666);
++      check("B: parent symlink escapes tree (the attack)",
++            rc, 0, "../trap/sentinel", 0600);
++
++      /* Scenario C: plain relative path with no symlink components,
++       * regression check that the safe wrapper doesn't break the
++       * normal case. */
++      rc =3D do_chmod_at("realdir/sentinel", 0644);
++      check("C: plain relative path (regression check)",
++            rc, 1, "realdir/sentinel", 0644);
++
++      /* Scenario D: top-level file, no parent directory component.
++       * Falls back to do_chmod(); should succeed. */
++      rc =3D do_chmod_at("topfile", 0640);
++      check("D: top-level file, no parent component",
++            rc, 1, "topfile", 0640);
++
++      if (errs)
++              fprintf(stderr, "%d failure(s)\n", errs);
++      return errs ? 1 : 0;
++}
+diff --git a/t_stub.c b/t_stub.c
+index eee92729..63bc144c 100644
+--- a/t_stub.c
++++ b/t_stub.c
+@@ -23,6 +23,8 @@
+
+ int do_fsync =3D 0;
+ int inplace =3D 0;
++int am_daemon =3D 0;
++int am_chrooted =3D 0;
+ int modify_window =3D 0;
+ int preallocate_files =3D 0;
+ int protect_args =3D 0;
+diff --git a/testsuite/chmod-symlink-race.test b/testsuite/chmod-symlink-r=
ace.test
+new file mode 100755
+index 00000000..48bbfbb4
+--- /dev/null
++++ b/testsuite/chmod-symlink-race.test
+@@ -0,0 +1,68 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for the symlink-TOCTOU class of bug applied to
++# chmod() on the receiver side. The CVE-2026-29518 fix used
++# secure_relative_open() for the basis-file open, but every other
++# path-based syscall the receiver runs on sender-controllable paths
++# is vulnerable to the same primitive: a local attacker swaps a
++# symlink into one of the parent directory components between the
++# receiver's check and its act, and the syscall escapes the module.
++#
++# This test exercises the new do_chmod_at() wrapper via the
++# t_chmod_secure helper. The helper sets up two scenarios:
++#   - a parent dir-symlink that resolves WITHIN the module tree
++#     (legitimate -K-style use, must continue to work)
++#   - a parent dir-symlink that escapes the module tree (the
++#     attack, must be rejected)
++# plus two regression scenarios (plain relative path, top-level
++# file) that just confirm the safe wrapper doesn't break the
++# normal case.
++#
++# The kernel-enforced "stay below dirfd" path resolution is
++# only available on Linux 5.6+, FreeBSD 13+, and macOS 15+.
++# Skip on platforms that fall back to per-component O_NOFOLLOW
++# (Solaris, OpenBSD, NetBSD, Cygwin); the per-component fallback
++# would also reject the attack but the legitimate dir-symlink
++# scenario would fail there.
++
++. "$suitedir/rsync.fns"
++
++case "$(uname -s)" in
++    SunOS|OpenBSD|NetBSD|CYGWIN*)
++      test_skipped "do_chmod_at relies on RESOLVE_BENEATH-equivalent kern=
el support not available on $(uname -s)"
++      ;;
++esac
++
++mod=3D"$scratchdir/module"
++trap_outside=3D"$scratchdir/trap"
++rm -rf "$mod" "$trap_outside"
++mkdir -p "$mod/realdir" "$trap_outside"
++
++# Set up the four file-system objects the helper expects:
++echo bystander > "$mod/realdir/sentinel"
++chmod 0600 "$mod/realdir/sentinel"
++echo target > "$trap_outside/sentinel"
++chmod 0600 "$trap_outside/sentinel"
++ln -s realdir "$mod/inside_link"
++ln -s ../trap "$mod/escape_link"
++echo top > "$mod/topfile"
++chmod 0600 "$mod/topfile"
++
++"$TOOLDIR/t_chmod_secure" "$mod" || \
++    test_fail "t_chmod_secure reported failures (see stderr above)"
++
++# Sanity-check from the shell side too: the outside file's mode must
++# still be 0600 -- the helper checked this, but a second look from
++# the shell guards against a helper-internal stat() bug.
++mode=3D$(stat -c '%a' "$trap_outside/sentinel" 2>/dev/null \
++       || stat -f '%Lp' "$trap_outside/sentinel" 2>/dev/null)
++if [ "$mode" !=3D "600" ]; then
++    test_fail "outside sentinel mode changed from 600 to $mode -- chmod e=
scaped the module"
++fi
++
++exit 0
+diff --git a/xattrs.c b/xattrs.c
+index 26e50a6f..4462d63b 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -1086,7 +1086,7 @@ int set_xattr(const char *fname, const struct file_s=
truct *file, const char *fna
+         && !S_ISLNK(sxp->st.st_mode)
+ #endif
+         && access(fname, W_OK) < 0
+-       && do_chmod(fname, (sxp->st.st_mode & CHMOD_BITS) | S_IWUSR) =3D=
=3D 0)
++       && do_chmod_at(fname, (sxp->st.st_mode & CHMOD_BITS) | S_IWUSR) =
=3D=3D 0)
+                added_write_perm =3D 1;
+
+        ndx =3D F_XATTR(file);
+@@ -1094,7 +1094,7 @@ int set_xattr(const char *fname, const struct file_s=
truct *file, const char *fna
+        lst =3D &glst->xa_items;
+        int return_value =3D rsync_xal_set(fname, lst, fnamecmp, sxp);
+        if (added_write_perm) /* remove the temporary write permission */
+-              do_chmod(fname, sxp->st.st_mode);
++              do_chmod_at(fname, sxp->st.st_mode);
+        return return_value;
+ }
+
+@@ -1211,7 +1211,7 @@ int set_stat_xattr(const char *fname, struct file_st=
ruct *file, mode_t new_mode)
+        mode =3D (fst.st_mode & _S_IFMT) | (fmode & ACCESSPERMS)
+             | (S_ISDIR(fst.st_mode) ? 0700 : 0600);
+        if (fst.st_mode !=3D mode)
+-              do_chmod(fname, mode);
++              do_chmod_at(fname, mode);
+        if (!IS_DEVICE(fst.st_mode))
+                fst.st_rdev =3D 0; /* just in case */
+
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch
new file mode 100644
index 0000000000..9decc58545
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch
@@ -0,0 +1,205 @@
+From a2269dd38ddc83bbc8738d8b0897400e8088c1a8 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 5 May 2026 14:34:33 +1000
+Subject: [PATCH] util1: secure change_dir() against symlink-race chdir-esc=
ape
+
+The receiver's chdir(2) into a destination subdirectory followed
+attacker-planted symlinks at every path component. Once CWD
+escaped the module, every subsequent path-relative syscall (open,
+chmod, lchown, ...) inherited the escape -- defeating
+secure_relative_open's RESOLVE_BENEATH anchor against AT_FDCWD,
+since the anchor itself was now outside the module.
+
+Route change_dir's relative target through secure_relative_open()
+and fchdir() to the resulting dirfd in am_daemon && !am_chrooted
+mode, so the chdir step itself can no longer follow a parent-
+symlink. Same treatment applied to the CD_SKIP_CHDIR /
+set_path_only path so it also can't follow attacker symlinks
+during path tracking.
+
+Adds testsuite/sender-flist-symlink-leak.test covering the
+sender-side flist resolution variant of the same primitive.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/15=
d296425609a997f56eb8f9017ff73922f99b20]
+
+(cherry picked from commit 15d296425609a997f56eb8f9017ff73922f99b20)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ testsuite/sender-flist-symlink-leak.test | 90 ++++++++++++++++++++++++
+ util1.c                                  | 56 +++++++++++++--
+ 2 files changed, 142 insertions(+), 4 deletions(-)
+ create mode 100755 testsuite/sender-flist-symlink-leak.test
+
+diff --git a/testsuite/sender-flist-symlink-leak.test b/testsuite/sender-f=
list-symlink-leak.test
+new file mode 100755
+index 00000000..011d93d0
+--- /dev/null
++++ b/testsuite/sender-flist-symlink-leak.test
+@@ -0,0 +1,90 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex re-check finding: the sender-side file-
++# list generator can still follow an attacker-planted symlink out of
++# the module via change_pathname() -> change_dir(...,CD_SKIP_CHDIR)
++# followed by change_dir(...,CD_NORMAL). The CD_SKIP_CHDIR sets
++# skipped_chdir=3D1, and the next CD_NORMAL call's secure-branch in
++# util1.c is gated on `!skipped_chdir`, so the secure path is
++# bypassed and a raw chdir(curr_dir) follows attacker-controlled
++# symlinks during flist generation.
++#
++# Reach: rsync daemon module with `use chroot =3D no`. A local
++# attacker plants module/cd -> /outside. A client (innocent or
++# malicious) pulls rsync://<daemon>/<module>/cd/. The daemon, as
++# sender, enumerates files in /outside and ships their metadata
++# (names, sizes, modes, mtimes) to the client. The actual content
++# transfer fails later at the secure_relative_open step with EXDEV,
++# but by then the metadata has already leaked.
++#
++# We detect by running a dry-run pull of the symlinked subdir and
++# checking whether the client's --list-only output mentions any
++# file from /outside. With the bug, /outside/secret.txt appears in
++# the list with its size; with the fix, the daemon's chdir into
++# the symlinked subdir is rejected and no /outside file is listed.
++
++. "$suitedir/rsync.fns"
++
++case "$(uname -s)" in
++    SunOS|OpenBSD|NetBSD|CYGWIN*)
++        test_skipped "secure change_dir relies on RESOLVE_BENEATH-equival=
ent kernel support not available on $(uname -s)"
++        ;;
++esac
++
++mod=3D"$scratchdir/module"
++outside=3D"$scratchdir/outside"
++listfile=3D"$scratchdir/listed.txt"
++conf=3D"$scratchdir/test-rsyncd.conf"
++
++rm -rf "$mod" "$outside"
++mkdir -p "$mod" "$outside"
++
++# Outside-the-module file the daemon should NOT enumerate to clients.
++# A distinctive name + non-trivial size makes the leak easy to spot.
++echo "OUTSIDE_PROTECTED_FILE_USED_AS_LEAK_DETECTOR" > "$outside/leak_mark=
er.txt"
++chmod 0644 "$outside/leak_marker.txt"
++
++# The symlink trap planted by the local attacker.
++ln -s "$outside" "$mod/cd"
++
++my_uid=3D`get_testuid`
++root_uid=3D`get_rootuid`
++root_gid=3D`get_rootgid`
++uid_setting=3D"uid =3D $root_uid"
++gid_setting=3D"gid =3D $root_gid"
++if test x"$my_uid" !=3D x"$root_uid"; then
++    uid_setting=3D"#$uid_setting"
++    gid_setting=3D"#$gid_setting"
++fi
++
++cat > "$conf" <<EOF
++use chroot =3D no
++$uid_setting
++$gid_setting
++log file =3D $scratchdir/rsyncd.log
++[upload]
++    path =3D $mod
++    use chroot =3D no
++    read only =3D no
++EOF
++
++# Pull recursively into the symlinked subdir with dry-run + verbose,
++# capturing the daemon's flist (file list) on stdout. If the daemon
++# enumerates /outside, leak_marker.txt will appear in the listing.
++RSYNC_CONNECT_PROG=3D"$RSYNC --config=3D$conf --daemon" \
++    $RSYNC -nrv rsync://localhost/upload/cd/ "$scratchdir/dst/" \
++    > "$listfile" 2>&1 || true
++
++if grep -q "leak_marker\.txt" "$listfile"; then
++    echo "----- leaked listing follows" >&2
++    sed 's/^/    /' "$listfile" >&2
++    echo "----- leaked listing ends" >&2
++    test_fail "sender flist leak: outside/leak_marker.txt was enumerated =
to the client (daemon's chdir followed the cd symlink during flist generati=
on)"
++fi
++
++exit 0
+diff --git a/util1.c b/util1.c
+index d84bc414..6e457d4f 100644
+--- a/util1.c
++++ b/util1.c
+@@ -1112,6 +1112,7 @@ char *sanitize_path(char *dest, const char *p, const=
 char *rootdir, int depth, i
+  * Also cleans the path using the clean_fname() function. */
+ int change_dir(const char *dir, int set_path_only)
+ {
++      extern int am_daemon, am_chrooted;
+        static int initialised, skipped_chdir;
+        unsigned int len;
+
+@@ -1150,10 +1151,57 @@ int change_dir(const char *dir, int set_path_only)
+                        curr_dir[curr_dir_len++] =3D '/';
+                memcpy(curr_dir + curr_dir_len, dir, len + 1);
+
+-              if (!set_path_only && chdir(curr_dir)) {
+-                      curr_dir_len =3D save_dir_len;
+-                      curr_dir[curr_dir_len] =3D '\0';
+-                      return 0;
++              if (!set_path_only) {
++                      int chdir_failed;
++                      /* In the daemon-without-chroot deployment we must =
not
++                       * follow a symlink in any component of the chdir
++                       * target -- otherwise CWD escapes the module and
++                       * every subsequent path-relative syscall (open,
++                       * chmod, lchown, ...) inherits the escape, which
++                       * defeats secure_relative_open's RESOLVE_BENEATH
++                       * anchor and re-opens the CVE-2026-29518 class of
++                       * symlink TOCTOU attacks. Use the secure resolver
++                       * to get a confined dirfd, then fchdir() to it.
++                       *
++                       * If skipped_chdir is set, a previous CD_SKIP_CHDI=
R
++                       * call buffered an absolute prefix in curr_dir
++                       * (e.g. change_pathname's CD_SKIP_CHDIR to orig_di=
r)
++                       * without syncing the kernel's CWD. Resolve `dir`
++                       * relative to that prefix as basedir so the secure
++                       * branch still anchors at the operator-trusted
++                       * directory rather than wherever the kernel CWD
++                       * happens to be. */
++                      if (am_daemon && !am_chrooted) {
++                              const char *basedir =3D NULL;
++                              char prefix[MAXPATHLEN];
++                              int dfd;
++                              if (skipped_chdir) {
++                                      if (save_dir_len >=3D sizeof prefix=
) {
++                                              errno =3D ENAMETOOLONG;
++                                              chdir_failed =3D 1;
++                                              goto chdir_cleanup;
++                                      }
++                                      memcpy(prefix, curr_dir, save_dir_l=
en);
++                                      prefix[save_dir_len] =3D '\0';
++                                      basedir =3D prefix;
++                              }
++                              dfd =3D secure_relative_open(basedir, dir,
++                                      O_RDONLY | O_DIRECTORY, 0);
++                              if (dfd < 0) {
++                                      chdir_failed =3D 1;
++                              } else {
++                                      chdir_failed =3D fchdir(dfd) !=3D 0=
;
++                                      close(dfd);
++                              }
++                      } else {
++                              chdir_failed =3D chdir(curr_dir) !=3D 0;
++                      }
++              chdir_cleanup:
++                      if (chdir_failed) {
++                              curr_dir_len =3D save_dir_len;
++                              curr_dir[curr_dir_len] =3D '\0';
++                              return 0;
++                      }
+                }
+                skipped_chdir =3D set_path_only;
+        }
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch
new file mode 100644
index 0000000000..fac413f3ea
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch
@@ -0,0 +1,1783 @@
+From a55d00c0f37fd811b0fddc1eaeb7f420215b1e05 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 5 May 2026 15:02:48 +1000
+Subject: [PATCH] syscall: add symlink-race-safe do_*_at() wrappers and har=
den
+ secure_relative_open
+
+Add the rest of the path-based syscall wrappers and migrate every
+receiver-side caller:
+  - do_lchown_at, do_rename_at, do_mkdir_at, do_symlink_at,
+    do_mknod_at, do_link_at, do_unlink_at, do_rmdir_at,
+    do_utimensat_at, do_stat_at, do_lstat_at
+
+Same shape as do_chmod_at: open each parent under
+secure_relative_open(), call the *at() variant against the dirfd,
+fall through to the bare path-based syscall in non-daemon /
+chrooted / absolute-path / no-parent cases. macOS's
+setattrlist-based set_times tier is also routed through the
+utimensat_at path on daemon-no-chroot.
+
+Hardenings to secure_relative_open() itself:
+  - confine basedir resolution under the same kernel mechanism
+    used for relpath (basedirs from --copy-dest / --link-dest are
+    sender-controllable in daemon mode)
+  - reject any '..' component (bare '..', 'foo/..', 'subdir/..')
+    so the per-component O_NOFOLLOW fallback can't escape
+  - return the dirfd we built up from the per-component fallback
+    when the caller passed O_DIRECTORY (otherwise every do_*_at
+    failed with EINVAL on platforms without RESOLVE_BENEATH)
+
+Adds testsuite/alt-dest-symlink-race.test and
+testsuite/secure-relpath-validation.test (with t_secure_relpath
+helper) as regression coverage for the new hardenings.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/30=
656c5e358b1c6033f4caf24f3e11b29d25c9f4]
+
+Backport Changes:
+- Upstream also updates runtests.py and a newer Makefile.in test
+  helper list that includes simdtest. Wrynose 3.4.1 does not carry
+  runtests.py and its CHECK_PROGS list has no simdtest entry, so
+  those test-runner hunks were not applicable.
+
+(cherry picked from commit 30656c5e358b1c6033f4caf24f3e11b29d25c9f4)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Makefile.in                              |   8 +-
+ backup.c                                 |  14 +-
+ cleanup.c                                |   2 +-
+ delete.c                                 |   2 +-
+ generator.c                              |  22 +-
+ hlink.c                                  |   2 +-
+ receiver.c                               |   8 +-
+ rsync.c                                  |   6 +-
+ syscall.c                                | 841 ++++++++++++++++++++++-
+ t_secure_relpath.c                       | 151 ++++
+ testsuite/alt-dest-symlink-race.test     |  96 +++
+ testsuite/secure-relpath-validation.test |  34 +
+ util1.c                                  |  20 +-
+ xattrs.c                                 |   9 +-
+ 14 files changed, 1164 insertions(+), 51 deletions(-)
+ create mode 100644 t_secure_relpath.c
+ create mode 100755 testsuite/alt-dest-symlink-race.test
+ create mode 100755 testsuite/secure-relpath-validation.test
+
+diff --git a/Makefile.in b/Makefile.in
+index c30b8876..c0cc7a06 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -63,12 +63,12 @@ TLS_OBJ =3D tls.o syscall.o util2.o t_stub.o lib/compa=
t.o lib/snprintf.o lib/perms
+ # Programs we must have to run the test cases
+ CHECK_PROGS =3D rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(=
EXEEXT) \
+        testrun$(EXEEXT) trimslash$(EXEEXT) t_unsafe$(EXEEXT) t_chmod_secu=
re$(EXEEXT) \
+-      wildtest$(EXEEXT)
++      t_secure_relpath$(EXEEXT) wildtest$(EXEEXT)
+
+ CHECK_SYMLINKS =3D testsuite/chown-fake.test testsuite/devices-fake.test =
testsuite/xattrs-hlink.test
+
+ # Objects for CHECK_PROGS to clean
+-CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
_chmod_secure.o trimslash.o wildtest.o
++CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
_chmod_secure.o t_secure_relpath.o trimslash.o wildtest.o
+
+ # note that the -I. is needed to handle config.h when using VPATH
+ .c.o:
+@@ -188,6 +188,10 @@ T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o uti=
l1.o util2.o t_stub.o lib/com
+ t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)
+        $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_CHMOD_SECURE_OBJ) $(LIBS)
+
++T_SECURE_RELPATH_OBJ =3D t_secure_relpath.o syscall.o util1.o util2.o t_s=
tub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o
++t_secure_relpath$(EXEEXT): $(T_SECURE_RELPATH_OBJ)
++      $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_SECURE_RELPATH_OBJ) $(LIBS)
++
+ .PHONY: conf
+ conf: configure.sh config.h.in
+
+diff --git a/backup.c b/backup.c
+index 686cb297..ae8cb49e 100644
+--- a/backup.c
++++ b/backup.c
+@@ -39,7 +39,7 @@ static int validate_backup_dir(void)
+ {
+        STRUCT_STAT st;
+
+-      if (do_lstat(backup_dir_buf, &st) < 0) {
++      if (do_lstat_at(backup_dir_buf, &st) < 0) {
+                if (errno =3D=3D ENOENT)
+                        return 0;
+                rsyserr(FERROR, errno, "backup lstat %s failed", backup_di=
r_buf);
+@@ -98,7 +98,7 @@ static BOOL copy_valid_path(const char *fname)
+        for ( ; b; name =3D b + 1, b =3D strchr(name, '/')) {
+                *b =3D '\0';
+
+-              while (do_mkdir(backup_dir_buf, ACCESSPERMS) < 0) {
++              while (do_mkdir_at(backup_dir_buf, ACCESSPERMS) < 0) {
+                        if (errno =3D=3D EEXIST) {
+                                val =3D validate_backup_dir();
+                                if (val > 0)
+@@ -197,7 +197,7 @@ static inline int link_or_rename(const char *from, con=
st char *to,
+                if (IS_SPECIAL(stp->st_mode) || IS_DEVICE(stp->st_mode))
+                        return 0; /* Use copy code. */
+ #endif
+-              if (do_link(from, to) =3D=3D 0) {
++              if (do_link_at(from, to) =3D=3D 0) {
+                        if (DEBUG_GTE(BACKUP, 1))
+                                rprintf(FINFO, "make_backup: HLINK %s succ=
essful.\n", from);
+                        return 2;
+@@ -207,7 +207,7 @@ static inline int link_or_rename(const char *from, con=
st char *to,
+                        return 0;
+        }
+ #endif
+-      if (do_rename(from, to) =3D=3D 0) {
++      if (do_rename_at(from, to) =3D=3D 0) {
+                if (stp->st_nlink > 1 && !S_ISDIR(stp->st_mode)) {
+                        /* If someone has hard-linked the file into the ba=
ckup
+                         * dir, rename() might return success but do nothi=
ng! */
+@@ -246,7 +246,7 @@ int make_backup(const char *fname, BOOL prefer_rename)
+                goto success;
+        if (errno =3D=3D EEXIST || errno =3D=3D EISDIR) {
+                STRUCT_STAT bakst;
+-              if (do_lstat(buf, &bakst) =3D=3D 0) {
++              if (do_lstat_at(buf, &bakst) =3D=3D 0) {
+                        int flags =3D get_del_for_flag(bakst.st_mode) | DE=
L_FOR_BACKUP | DEL_RECURSE;
+                        if (delete_item(buf, bakst.st_mode, flags) !=3D 0)
+                                return 0;
+@@ -277,7 +277,7 @@ int make_backup(const char *fname, BOOL prefer_rename)
+        /* Check to see if this is a device file, or link */
+        if ((am_root && preserve_devices && IS_DEVICE(file->mode))
+         || (preserve_specials && IS_SPECIAL(file->mode))) {
+-              if (do_mknod(buf, file->mode, sx.st.st_rdev) < 0)
++              if (do_mknod_at(buf, file->mode, sx.st.st_rdev) < 0)
+                        rsyserr(FERROR, errno, "mknod %s failed", full_fna=
me(buf));
+                else if (DEBUG_GTE(BACKUP, 1))
+                        rprintf(FINFO, "make_backup: DEVICE %s successful.=
\n", fname);
+@@ -294,7 +294,7 @@ int make_backup(const char *fname, BOOL prefer_rename)
+                        }
+                        ret =3D 2;
+                } else {
+-                      if (do_symlink(sl, buf) < 0)
++                      if (do_symlink_at(sl, buf) < 0)
+                                rsyserr(FERROR, errno, "link %s -> \"%s\""=
, full_fname(buf), sl);
+                        else if (DEBUG_GTE(BACKUP, 1))
+                                rprintf(FINFO, "make_backup: SYMLINK %s su=
ccessful.\n", fname);
+diff --git a/cleanup.c b/cleanup.c
+index 40d26baa..0493fbbb 100644
+--- a/cleanup.c
++++ b/cleanup.c
+@@ -198,7 +198,7 @@ NORETURN void _exit_cleanup(int code, const char *file=
, int line)
+                switch_step++;
+
+                if (cleanup_fname)
+-                      do_unlink(cleanup_fname);
++                      do_unlink_at(cleanup_fname);
+                if (exit_code)
+                        kill_all(SIGUSR1);
+                if (cleanup_pid && cleanup_pid =3D=3D getpid()) {
+diff --git a/delete.c b/delete.c
+index ded0ab2a..4a52122d 100644
+--- a/delete.c
++++ b/delete.c
+@@ -160,7 +160,7 @@ enum delret delete_item(char *fbuf, uint16 mode, uint1=
6 flags)
+
+        if (S_ISDIR(mode)) {
+                what =3D "rmdir";
+-              ok =3D do_rmdir(fbuf) =3D=3D 0;
++              ok =3D do_rmdir_at(fbuf) =3D=3D 0;
+        } else {
+                if (make_backups > 0 && !(flags & DEL_FOR_BACKUP) && (back=
up_dir || !is_backup_file(fbuf))) {
+                        what =3D "make_backup";
+diff --git a/generator.c b/generator.c
+index e5aff654..e5b2d176 100644
+--- a/generator.c
++++ b/generator.c
+@@ -984,7 +984,7 @@ static int try_dests_reg(struct file_struct *file, cha=
r *fname, int ndx,
+                if (find_exact_for_existing) {
+                        if (alt_dest_type =3D=3D LINK_DEST && real_st.st_d=
ev =3D=3D sxp->st.st_dev && real_st.st_ino =3D=3D sxp->st.st_ino)
+                                return -1;
+-                      if (do_unlink(fname) < 0 && errno !=3D ENOENT)
++                      if (do_unlink_at(fname) < 0 && errno !=3D ENOENT)
+                                goto got_nothing_for_ya;
+                }
+ #ifdef SUPPORT_HARD_LINKS
+@@ -1112,7 +1112,7 @@ static int try_dests_non(struct file_struct *file, c=
har *fname, int ndx,
+                 && !IS_SPECIAL(file->mode) && !IS_DEVICE(file->mode)
+ #endif
+                 && !S_ISDIR(file->mode)) {
+-                      if (do_link(cmpbuf, fname) < 0) {
++                      if (do_link_at(cmpbuf, fname) < 0) {
+                                rsyserr(FERROR_XFER, errno,
+                                        "failed to hard-link %s with %s",
+                                        cmpbuf, fname);
+@@ -1315,7 +1315,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,
+                                }
+                        }
+                        if (relative_paths && !implied_dirs && file->mode =
!=3D 0
+-                       && do_stat(dn, &sx.st) < 0) {
++                       && do_stat_at(dn, &sx.st) < 0) {
+                                if (dry_run)
+                                        goto parent_is_dry_missing;
+                                if (make_path(fname, MKP_DROP_NAME | MKP_S=
KIP_SLASH) < 0) {
+@@ -1427,7 +1427,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,
+                         && (stype =3D=3D FT_DIR
+                          || delete_item(fname, sx.st.st_mode, del_opts | =
DEL_FOR_DIR) !=3D 0))
+                                goto cleanup; /* Any errors get reported l=
ater. */
+-                      if (do_mkdir(fname, (file->mode|added_perms) & 0700=
) =3D=3D 0)
++                      if (do_mkdir_at(fname, (file->mode|added_perms) & 0=
700) =3D=3D 0)
+                                file->flags |=3D FLAG_DIR_CREATED;
+                        goto cleanup;
+                }
+@@ -1469,10 +1469,10 @@ static void recv_generator(char *fname, struct fil=
e_struct *file, int ndx,
+                        itemize(fnamecmp, file, ndx, statret, &sx,
+                                statret ? ITEM_LOCAL_CHANGE : 0, 0, NULL);
+                }
+-              if (real_ret !=3D 0 && do_mkdir(fname,file->mode|added_perm=
s) < 0 && errno !=3D EEXIST) {
++              if (real_ret !=3D 0 && do_mkdir_at(fname,file->mode|added_p=
erms) < 0 && errno !=3D EEXIST) {
+                        if (!relative_paths || errno !=3D ENOENT
+                         || make_path(fname, MKP_DROP_NAME | MKP_SKIP_SLAS=
H) < 0
+-                       || (do_mkdir(fname, file->mode|added_perms) < 0 &&=
 errno !=3D EEXIST)) {
++                       || (do_mkdir_at(fname, file->mode|added_perms) < 0=
 && errno !=3D EEXIST)) {
+                                rsyserr(FERROR_XFER, errno,
+                                        "recv_generator: mkdir %s failed",
+                                        full_fname(fname));
+@@ -1808,7 +1808,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,
+                ;
+        else if (quick_check_ok(FT_REG, fnamecmp, file, &sx.st)) {
+                if (partialptr) {
+-                      do_unlink(partialptr);
++                      do_unlink_at(partialptr);
+                        handle_partial_dir(partialptr, PDIR_DELETE);
+                }
+                set_file_attrs(fname, file, &sx, NULL, maybe_ATTRS_REPORT =
| maybe_ATTRS_ACCURATE_TIME);
+@@ -2016,7 +2016,7 @@ int atomic_create(struct file_struct *file, char *fn=
ame, const char *slnk, const
+
+        if (slnk) {
+ #ifdef SUPPORT_LINKS
+-              if (do_symlink(slnk, create_name) < 0) {
++              if (do_symlink_at(slnk, create_name) < 0) {
+                        rsyserr(FERROR_XFER, errno, "symlink %s -> \"%s\" =
failed",
+                                full_fname(create_name), slnk);
+                        return 0;
+@@ -2032,7 +2032,7 @@ int atomic_create(struct file_struct *file, char *fn=
ame, const char *slnk, const
+                return 0;
+ #endif
+        } else {
+-              if (do_mknod(create_name, file->mode, rdev) < 0) {
++              if (do_mknod_at(create_name, file->mode, rdev) < 0) {
+                        rsyserr(FERROR_XFER, errno, "mknod %s failed",
+                                full_fname(create_name));
+                        return 0;
+@@ -2040,14 +2040,14 @@ int atomic_create(struct file_struct *file, char *=
fname, const char *slnk, const
+        }
+
+        if (!skip_atomic) {
+-              if (do_rename(tmpname, fname) < 0) {
++              if (do_rename_at(tmpname, fname) < 0) {
+                        char *full_tmpname =3D strdup(full_fname(tmpname))=
;
+                        if (full_tmpname =3D=3D NULL)
+                                out_of_memory("atomic_create");
+                        rsyserr(FERROR_XFER, errno, "rename %s -> \"%s\" f=
ailed",
+                                full_tmpname, full_fname(fname));
+                        free(full_tmpname);
+-                      do_unlink(tmpname);
++                      do_unlink_at(tmpname);
+                        return 0;
+                }
+        }
+diff --git a/hlink.c b/hlink.c
+index 2c14407a..eb36730f 100644
+--- a/hlink.c
++++ b/hlink.c
+@@ -454,7 +454,7 @@ int hard_link_check(struct file_struct *file, int ndx,=
 char *fname,
+ int hard_link_one(struct file_struct *file, const char *fname,
+                  const char *oldname, int terse)
+ {
+-      if (do_link(oldname, fname) < 0) {
++      if (do_link_at(oldname, fname) < 0) {
+                enum logcode code;
+                if (terse) {
+                        if (!INFO_GTE(NAME, 1))
+diff --git a/receiver.c b/receiver.c
+index 5a2c8c5a..8cf8366b 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -442,7 +442,7 @@ static void handle_delayed_updates(char *local_name)
+                        }
+                        /* We don't use robust_rename() here because the
+                         * partial-dir must be on the same drive. */
+-                      if (do_rename(partialptr, fname) < 0) {
++                      if (do_rename_at(partialptr, fname) < 0) {
+                                rsyserr(FERROR_XFER, errno,
+                                        "rename failed for %s (from %s)",
+                                        full_fname(fname), partialptr);
+@@ -926,7 +926,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+                                recv_ok =3D -1;
+                        else if (fnamecmp =3D=3D partialptr) {
+                                if (!one_inplace)
+-                                      do_unlink(partialptr);
++                                      do_unlink_at(partialptr);
+                                handle_partial_dir(partialptr, PDIR_DELETE=
);
+                        }
+                } else if (keep_partial && partialptr && (!one_inplace || =
delay_updates)) {
+@@ -935,7 +935,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+                                        "Unable to create partial-dir for =
%s -- discarding %s.\n",
+                                        local_name ? local_name : f_name(f=
ile, NULL),
+                                        recv_ok ? "completed file" : "part=
ial file");
+-                              do_unlink(fnametmp);
++                              do_unlink_at(fnametmp);
+                                recv_ok =3D -1;
+                        } else if (!finish_transfer(partialptr, fnametmp, =
fnamecmp, NULL,
+                                                    file, recv_ok, !partia=
l_dir))
+@@ -946,7 +946,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+                        } else
+                                partialptr =3D NULL;
+                } else if (!one_inplace)
+-                      do_unlink(fnametmp);
++                      do_unlink_at(fnametmp);
+
+                cleanup_disable();
+
+diff --git a/rsync.c b/rsync.c
+index cc46a2f9..1d2ae82a 100644
+--- a/rsync.c
++++ b/rsync.c
+@@ -547,7 +547,7 @@ int set_file_attrs(const char *fname, struct file_stru=
ct *file, stat_x *sxp,
+                if (am_root >=3D 0) {
+                        uid_t uid =3D change_uid ? (uid_t)F_OWNER(file) : =
sxp->st.st_uid;
+                        gid_t gid =3D change_gid ? (gid_t)F_GROUP(file) : =
sxp->st.st_gid;
+-                      if (do_lchown(fname, uid, gid) !=3D 0) {
++                      if (do_lchown_at(fname, uid, gid) !=3D 0) {
+                                /* We shouldn't have attempted to change u=
id
+                                 * or gid unless have the privilege. */
+                                rsyserr(FERROR_XFER, errno, "%s %s failed"=
,
+@@ -758,7 +758,7 @@ int finish_transfer(const char *fname, const char *fna=
metmp,
+                        full_fname(fnametmp), fname);
+                if (!partialptr || (ret =3D=3D -2 && temp_copy_name)
+                 || robust_rename(fnametmp, partialptr, NULL, file->mode) =
< 0)
+-                      do_unlink(fnametmp);
++                      do_unlink_at(fnametmp);
+                return 0;
+        }
+        if (ret =3D=3D 0) {
+@@ -774,7 +774,7 @@ int finish_transfer(const char *fname, const char *fna=
metmp,
+                       ok_to_set_time ? ATTRS_ACCURATE_TIME : ATTRS_SKIP_M=
TIME | ATTRS_SKIP_ATIME | ATTRS_SKIP_CRTIME);
+
+        if (temp_copy_name) {
+-              if (do_rename(fnametmp, fname) < 0) {
++              if (do_rename_at(fnametmp, fname) < 0) {
+                        rsyserr(FERROR_XFER, errno, "rename %s -> \"%s\"",
+                                full_fname(fnametmp), fname);
+                        return 0;
+diff --git a/syscall.c b/syscall.c
+index 06d5ed3f..ffd8df20 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -93,6 +93,63 @@ int do_unlink(const char *path)
+        return unlink(path);
+ }
+
++/*
++  Symlink-race-safe variant of do_unlink() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. unlink() resolves
++  parent components, so a parent-symlink swap can delete an outside
++  file under the daemon's authority. Defence: open the parent of path
++  under secure_relative_open() and use unlinkat() (flags=3D0) against
++  that dirfd.
++
++  Falls through to do_unlink() for the same dry-run / non-daemon /
++  chrooted / no-parent / absolute-path cases as the other wrappers.
++*/
++int do_unlink_at(const char *path)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return unlink(path);
++
++      if (!path || !*path || *path =3D=3D '/')
++              return unlink(path);
++
++      slash =3D strrchr(path, '/');
++      if (!slash)
++              return unlink(path);
++
++      dlen =3D slash - path;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, path, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D unlinkat(dfd, bname, 0);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_unlink(path);
++#endif
++}
++
+ #ifdef SUPPORT_LINKS
+ int do_symlink(const char *lnk, const char *path)
+ {
+@@ -117,6 +174,70 @@ int do_symlink(const char *lnk, const char *path)
+        return symlink(lnk, path);
+ }
+
++/*
++  Symlink-race-safe variant of do_symlink() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. Only the parent
++  directory of `path` needs protection -- symlinkat() does not resolve
++  the final component (it creates it). Defence: open parent of `path`
++  under secure_relative_open() and call symlinkat() against that
++  dirfd. The link target string `lnk` is stored verbatim and not
++  resolved at creation time, so it doesn't need scrutiny here.
++
++  Falls through to do_symlink() for the --fake-super (am_root < 0)
++  path -- that code path opens `path` with do_open() which has its
++  own (separate) symlink-race exposure tracked elsewhere.
++*/
++int do_symlink_at(const char *lnk, const char *path)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return do_symlink(lnk, path);
++
++#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
++      if (am_root < 0)
++              return do_symlink(lnk, path);
++#endif
++
++      if (!path || !*path || *path =3D=3D '/')
++              return do_symlink(lnk, path);
++
++      slash =3D strrchr(path, '/');
++      if (!slash)
++              return do_symlink(lnk, path);
++
++      dlen =3D slash - path;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, path, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D symlinkat(lnk, dfd, bname);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_symlink(lnk, path);
++#endif
++}
++
+ #if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
+ ssize_t do_readlink(const char *path, char *buf, size_t bufsiz)
+ {
+@@ -153,6 +274,106 @@ int do_link(const char *old_path, const char *new_pa=
th)
+        return link(old_path, new_path);
+ #endif
+ }
++
++/*
++  Symlink-race-safe variant of do_link() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. link() resolves
++  parent components of *both* old_path and new_path, so a parent-
++  symlink swap on either side can plant the new hard link outside
++  the module, or hard-link an outside file into the module (read
++  disclosure).
++
++  Defence: open each parent under secure_relative_open() and use
++  linkat() between the two dirfds, reusing one when the parents
++  match. flags=3D0 matches the existing do_link() (don't follow a
++  symbolic-link old_path). Only available on systems with linkat();
++  pre-AT_FDCWD systems fall through to do_link().
++*/
++int do_link_at(const char *old_path, const char *new_path)
++{
++#if defined AT_FDCWD && defined HAVE_LINKAT
++      extern int am_daemon, am_chrooted;
++      char old_dirpath[MAXPATHLEN], new_dirpath[MAXPATHLEN];
++      const char *old_bname, *new_bname;
++      const char *old_slash, *new_slash;
++      int old_dfd =3D AT_FDCWD, new_dfd =3D AT_FDCWD;
++      BOOL old_owns =3D False, new_owns =3D False;
++      int ret, e;
++      size_t old_dlen =3D 0, new_dlen =3D 0;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return do_link(old_path, new_path);
++
++      if (!old_path || !*old_path || *old_path =3D=3D '/'
++       || !new_path || !*new_path || *new_path =3D=3D '/')
++              return do_link(old_path, new_path);
++
++      old_slash =3D strrchr(old_path, '/');
++      new_slash =3D strrchr(new_path, '/');
++
++      /* Resolve each path's parent dir independently. A path without a
++       * slash lives in CWD (AT_FDCWD), no parent open required. A path
++       * with a slash needs secure_relative_open to confine its parent
++       * resolution -- otherwise a parent symlink (e.g. --link-dest=3Dcd
++       * where cd -> /outside) lets the kernel-level linkat(AT_FDCWD,
++       * "cd/target.txt", ...) escape the module. */
++      if (old_slash) {
++              old_dlen =3D old_slash - old_path;
++              if (old_dlen >=3D sizeof old_dirpath) { errno =3D ENAMETOOL=
ONG; return -1; }
++              memcpy(old_dirpath, old_path, old_dlen);
++              old_dirpath[old_dlen] =3D '\0';
++              old_bname =3D old_slash + 1;
++              old_dfd =3D secure_relative_open(NULL, old_dirpath, O_RDONL=
Y | O_DIRECTORY, 0);
++              if (old_dfd < 0)
++                      return -1;
++              old_owns =3D True;
++      } else {
++              old_bname =3D old_path;
++      }
++
++      if (new_slash) {
++              new_dlen =3D new_slash - new_path;
++              if (new_dlen >=3D sizeof new_dirpath) {
++                      e =3D ENAMETOOLONG;
++                      if (old_owns) close(old_dfd);
++                      errno =3D e;
++                      return -1;
++              }
++              memcpy(new_dirpath, new_path, new_dlen);
++              new_dirpath[new_dlen] =3D '\0';
++              new_bname =3D new_slash + 1;
++              if (old_owns && old_dlen =3D=3D new_dlen
++               && memcmp(old_dirpath, new_dirpath, old_dlen) =3D=3D 0) {
++                      new_dfd =3D old_dfd;
++              } else {
++                      new_dfd =3D secure_relative_open(NULL, new_dirpath,=
 O_RDONLY | O_DIRECTORY, 0);
++                      if (new_dfd < 0) {
++                              e =3D errno;
++                              if (old_owns) close(old_dfd);
++                              errno =3D e;
++                              return -1;
++                      }
++                      new_owns =3D True;
++              }
++      } else {
++              new_bname =3D new_path;
++      }
++
++      ret =3D linkat(old_dfd, old_bname, new_dfd, new_bname, 0);
++      e =3D errno;
++      if (new_owns)
++              close(new_dfd);
++      if (old_owns)
++              close(old_dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_link(old_path, new_path);
++#endif
++}
+ #endif
+
+ int do_lchown(const char *path, uid_t owner, gid_t group)
+@@ -165,6 +386,66 @@ int do_lchown(const char *path, uid_t owner, gid_t gr=
oup)
+        return lchown(path, owner, group);
+ }
+
++/*
++  Symlink-race-safe variant of do_lchown() for receiver-side use. See the
++  comment on do_chmod_at() for the threat model and design rationale.
++
++  Resolves the parent directory under secure_relative_open() and invokes
++  fchownat(..., AT_SYMLINK_NOFOLLOW) against that dirfd, so that an
++  attacker who substitutes a symlink into one of the parent components
++  cannot redirect the chown outside the receiver's confinement. The
++  AT_SYMLINK_NOFOLLOW flag matches lchown()'s "do not follow a final-
++  component symlink" semantics.
++
++  Falls through to do_lchown() in the dry-run / non-daemon / chrooted /
++  absolute-path / no-parent cases, identical to do_chmod_at().
++*/
++int do_lchown_at(const char *fname, uid_t owner, gid_t group)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return do_lchown(fname, owner, group);
++
++      if (!fname || !*fname || *fname =3D=3D '/')
++              return do_lchown(fname, owner, group);
++
++      slash =3D strrchr(fname, '/');
++      if (!slash)
++              return do_lchown(fname, owner, group);
++
++      dlen =3D slash - fname;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, fname, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D fchownat(dfd, bname, owner, group, AT_SYMLINK_NOFOLLOW);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_lchown(fname, owner, group);
++#endif
++}
++
+ int do_mknod(const char *pathname, mode_t mode, dev_t dev)
+ {
+        if (dry_run) return 0;
+@@ -215,6 +496,76 @@ int do_mknod(const char *pathname, mode_t mode, dev_t=
 dev)
+ #endif
+ }
+
++/*
++  Symlink-race-safe variant of do_mknod() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. Defence: open
++  the parent of pathname under secure_relative_open() and use
++  mknodat() against that dirfd. mknodat() covers both regular-file
++  (S_IFREG with dev=3D0) and FIFO (S_IFIFO) and device-node creation.
++
++  Falls through to do_mknod() for fake-super (am_root < 0) and for
++  sockets, both of which use auxiliary path-based syscalls that
++  don't have an *at() variant in any portable form.
++*/
++int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return do_mknod(pathname, mode, dev);
++
++      if (am_root < 0)
++              return do_mknod(pathname, mode, dev);
++
++#if !defined MKNOD_CREATES_SOCKETS && defined HAVE_SYS_UN_H
++      if (S_ISSOCK(mode))
++              return do_mknod(pathname, mode, dev);
++#endif
++
++      if (!pathname || !*pathname || *pathname =3D=3D '/')
++              return do_mknod(pathname, mode, dev);
++
++      slash =3D strrchr(pathname, '/');
++      if (!slash)
++              return do_mknod(pathname, mode, dev);
++
++      dlen =3D slash - pathname;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, pathname, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++#if !defined MKNOD_CREATES_FIFOS && defined HAVE_MKFIFO
++      if (S_ISFIFO(mode))
++              ret =3D mkfifoat(dfd, bname, mode);
++      else
++#endif
++              ret =3D mknodat(dfd, bname, mode, dev);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_mknod(pathname, mode, dev);
++#endif
++}
++
+ int do_rmdir(const char *pathname)
+ {
+        if (dry_run) return 0;
+@@ -222,6 +573,57 @@ int do_rmdir(const char *pathname)
+        return rmdir(pathname);
+ }
+
++/*
++  Symlink-race-safe variant of do_rmdir(). See do_unlink_at() above;
++  same shape but with AT_REMOVEDIR set to require the target be a
++  directory.
++*/
++int do_rmdir_at(const char *pathname)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return rmdir(pathname);
++
++      if (!pathname || !*pathname || *pathname =3D=3D '/')
++              return rmdir(pathname);
++
++      slash =3D strrchr(pathname, '/');
++      if (!slash)
++              return rmdir(pathname);
++
++      dlen =3D slash - pathname;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, pathname, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D unlinkat(dfd, bname, AT_REMOVEDIR);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_rmdir(pathname);
++#endif
++}
++
+ int do_open(const char *pathname, int flags, mode_t mode)
+ {
+        if (flags !=3D O_RDONLY) {
+@@ -370,6 +772,89 @@ int do_rename(const char *old_path, const char *new_p=
ath)
+        return rename(old_path, new_path);
+ }
+
++/*
++  Symlink-race-safe variant of do_rename() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model and design rationale.
++
++  rename() is the central tmp -> final operation in rsync; if either the
++  source or the destination has an attacker-substituted symlink in one
++  of its parent components, the rename can publish or vanish files
++  outside the module. Defence: open the parent of *each* path under
++  secure_relative_open() and use renameat() against the resulting
++  dirfds. When old_path and new_path share the same parent (the common
++  case -- tmp file living next to its final name), we reuse the same
++  dirfd for both sides.
++
++  Falls through to do_rename() in dry-run, non-daemon, chrooted, no-
++  parent and absolute-path cases, identical to the other do_*_at()
++  wrappers.
++*/
++int do_rename_at(const char *old_path, const char *new_path)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char old_dirpath[MAXPATHLEN], new_dirpath[MAXPATHLEN];
++      const char *old_bname, *new_bname;
++      const char *old_slash, *new_slash;
++      int old_dfd =3D -1, new_dfd =3D -1, ret =3D -1, e;
++      size_t old_dlen, new_dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return do_rename(old_path, new_path);
++
++      if (!old_path || !*old_path || *old_path =3D=3D '/'
++       || !new_path || !*new_path || *new_path =3D=3D '/')
++              return do_rename(old_path, new_path);
++
++      old_slash =3D strrchr(old_path, '/');
++      new_slash =3D strrchr(new_path, '/');
++      if (!old_slash || !new_slash)
++              return do_rename(old_path, new_path);
++
++      old_dlen =3D old_slash - old_path;
++      new_dlen =3D new_slash - new_path;
++      if (old_dlen >=3D sizeof old_dirpath || new_dlen >=3D sizeof new_di=
rpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(old_dirpath, old_path, old_dlen);
++      old_dirpath[old_dlen] =3D '\0';
++      memcpy(new_dirpath, new_path, new_dlen);
++      new_dirpath[new_dlen] =3D '\0';
++      old_bname =3D old_slash + 1;
++      new_bname =3D new_slash + 1;
++
++      old_dfd =3D secure_relative_open(NULL, old_dirpath, O_RDONLY | O_DI=
RECTORY, 0);
++      if (old_dfd < 0)
++              return -1;
++
++      if (old_dlen =3D=3D new_dlen && memcmp(old_dirpath, new_dirpath, ol=
d_dlen) =3D=3D 0) {
++              new_dfd =3D old_dfd;
++      } else {
++              new_dfd =3D secure_relative_open(NULL, new_dirpath, O_RDONL=
Y | O_DIRECTORY, 0);
++              if (new_dfd < 0) {
++                      e =3D errno;
++                      close(old_dfd);
++                      errno =3D e;
++                      return -1;
++              }
++      }
++
++      ret =3D renameat(old_dfd, old_bname, new_dfd, new_bname);
++      e =3D errno;
++      if (new_dfd !=3D old_dfd)
++              close(new_dfd);
++      close(old_dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_rename(old_path, new_path);
++#endif
++}
++
+ #ifdef HAVE_FTRUNCATE
+ int do_ftruncate(int fd, OFF_T size)
+ {
+@@ -412,6 +897,66 @@ int do_mkdir(char *path, mode_t mode)
+        return mkdir(path, mode);
+ }
+
++/*
++  Symlink-race-safe variant of do_mkdir() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model and design rationale.
++
++  mkdir() resolves parent symlinks at every component, so a parent-
++  component swap can place an attacker-named directory outside the
++  module. Defence: open the parent of fname under secure_relative_open()
++  and call mkdirat() against that dirfd.
++
++  Mutates path in place to trim trailing slashes (matches do_mkdir()).
++  Falls through to do_mkdir() in dry-run, non-daemon, chrooted, no-
++  parent and absolute-path cases.
++*/
++int do_mkdir_at(char *path, mode_t mode)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++      trim_trailing_slashes(path);
++
++      if (!am_daemon || am_chrooted)
++              return mkdir(path, mode);
++
++      if (!path || !*path || *path =3D=3D '/')
++              return mkdir(path, mode);
++
++      slash =3D strrchr(path, '/');
++      if (!slash)
++              return mkdir(path, mode);
++
++      dlen =3D slash - path;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, path, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D mkdirat(dfd, bname, mode);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_mkdir(path, mode);
++#endif
++}
++
+ /* like mkstemp but forces permissions */
+ int do_mkstemp(char *template, mode_t perms)
+ {
+@@ -465,6 +1010,76 @@ int do_lstat(const char *path, STRUCT_STAT *st)
+ #endif
+ }
+
++/*
++  Symlink-race-safe variants of do_stat() / do_lstat() for receiver-
++  side use. See the comment on do_chmod_at() for the threat model.
++  stat() and lstat() resolve parent components, so a parent-symlink
++  swap can make the receiver's stat see attributes of a victim file
++  outside the module -- which then drives later behaviour (e.g.
++  "this isn't a directory, delete it" -> attacker-controlled unlink
++  on something outside the module).
++
++  Defence: open the parent under secure_relative_open() and use
++  fstatat() with AT_SYMLINK_NOFOLLOW (lstat) or 0 (stat) against
++  that dirfd. Same fall-through gating as the other wrappers.
++*/
++static int do_xstat_at(const char *path, STRUCT_STAT *st, int at_flags, i=
nt (*fallback)(const char *, STRUCT_STAT *))
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (!am_daemon || am_chrooted)
++              return fallback(path, st);
++
++      if (!path || !*path || *path =3D=3D '/')
++              return fallback(path, st);
++
++      slash =3D strrchr(path, '/');
++      if (!slash)
++              return fallback(path, st);
++
++      dlen =3D slash - path;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, path, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D fstatat(dfd, bname, st, at_flags);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return fallback(path, st);
++#endif
++}
++
++int do_stat_at(const char *path, STRUCT_STAT *st)
++{
++      return do_xstat_at(path, st, 0, do_stat);
++}
++
++int do_lstat_at(const char *path, STRUCT_STAT *st)
++{
++#ifdef SUPPORT_LINKS
++      return do_xstat_at(path, st, AT_SYMLINK_NOFOLLOW, do_lstat);
++#else
++      return do_xstat_at(path, st, 0, do_stat);
++#endif
++}
++
+ int do_fstat(int fd, STRUCT_STAT *st)
+ {
+ #ifdef USE_STAT64_FUNCS
+@@ -486,12 +1101,26 @@ OFF_T do_lseek(int fd, OFF_T offset, int whence)
+ #ifdef HAVE_SETATTRLIST
+ int do_setattrlist_times(const char *path, STRUCT_STAT *stp)
+ {
++      extern int am_daemon, am_chrooted;
+        struct attrlist attrList;
+        struct timespec ts[2];
+
+        if (dry_run) return 0;
+        RETURN_ERROR_IF_RO_OR_LO;
+
++      /* setattrlist() takes a raw path and follows parent symlinks
++       * (FSOPT_NOFOLLOW only blocks the final component). On a
++       * daemon-no-chroot deployment, return ENOSYS so set_times()'
++       * tier walk falls through to do_utimensat_at(), which routes
++       * the timestamp update through a secure parent dirfd. The
++       * macOS-specific attribute set this function would have used
++       * (ATTR_CMN_MODTIME / ATTR_CMN_ACCTIME) is the same set
++       * utimensat() handles, so no functionality is lost. */
++      if (am_daemon && !am_chrooted) {
++              errno =3D ENOSYS;
++              return -1;
++      }
++
+        /* Yes, this is in the opposite order of utime and similar. */
+        ts[0].tv_sec =3D stp->st_mtime;
+        ts[0].tv_nsec =3D stp->ST_MTIME_NSEC;
+@@ -508,12 +1137,25 @@ int do_setattrlist_times(const char *path, STRUCT_S=
TAT *stp)
+ #ifdef SUPPORT_CRTIMES
+ int do_setattrlist_crtime(const char *path, time_t crtime)
+ {
++      extern int am_daemon, am_chrooted;
+        struct attrlist attrList;
+        struct timespec ts;
+
+        if (dry_run) return 0;
+        RETURN_ERROR_IF_RO_OR_LO;
+
++      /* Same path-follows-parent-symlinks concern as
++       * do_setattrlist_times. There is no portable at-aware variant
++       * of setattrlist that targets ATTR_CMN_CRTIME, so on a
++       * daemon-no-chroot deployment we return -1 and accept that
++       * crtime preservation is silently dropped for that file (the
++       * caller treats this as "crtime not updated"). The transfer
++       * itself continues normally. */
++      if (am_daemon && !am_chrooted) {
++              errno =3D ENOSYS;
++              return -1;
++      }
++
+        ts.tv_sec =3D crtime;
+        ts.tv_nsec =3D 0;
+
+@@ -529,10 +1171,19 @@ int do_setattrlist_crtime(const char *path, time_t =
crtime)
+ time_t get_create_time(const char *path, STRUCT_STAT *stp)
+ {
+ #ifdef HAVE_GETATTRLIST
++      extern int am_daemon, am_chrooted;
+        static struct create_time attrBuf;
+        struct attrlist attrList;
+
+        (void)stp;
++      /* getattrlist() is also path-based and follows parent
++       * symlinks. In daemon-no-chroot, refuse rather than read the
++       * crtime of a file the parent-symlink chain might point at
++       * outside the module. The caller's "no crtime available"
++       * path returns 0; the file gets a fresh crtime instead of
++       * preserving the source's. */
++      if (am_daemon && !am_chrooted)
++              return 0;
+        memset(&attrList, 0, sizeof attrList);
+        attrList.bitmapcount =3D ATTR_BIT_MAP_COUNT;
+        attrList.commonattr =3D ATTR_CMN_CRTIME;
+@@ -598,6 +1249,81 @@ int do_utimensat(const char *path, STRUCT_STAT *stp)
+ #endif
+        return utimensat(AT_FDCWD, path, t, AT_SYMLINK_NOFOLLOW);
+ }
++
++/*
++  Symlink-race-safe variant of do_utimensat() for receiver-side use.
++  See the comment on do_chmod_at() for the threat model. utimes()
++  resolves parent components and follows a final-component symlink;
++  lutimes() doesn't follow the final component but still resolves
++  parents. Either way, a parent-symlink swap can redirect the
++  timestamp update outside the module. Defence: open the parent of
++  path under secure_relative_open() and call utimensat() with
++  AT_SYMLINK_NOFOLLOW against that dirfd.
++
++  Falls through to do_utimensat() in the same dry-run / non-daemon /
++  chrooted / no-parent / absolute-path cases as the other wrappers.
++  Returns -1 with errno=3DENOSYS on systems without utimensat()
++  (caller is expected to fall back to the legacy tier walk).
++*/
++int do_utimensat_at(const char *path, STRUCT_STAT *stp)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      struct timespec t[2];
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (dry_run) return 0;
++      RETURN_ERROR_IF_RO_OR_LO;
++
++      if (!am_daemon || am_chrooted)
++              return do_utimensat(path, stp);
++
++      if (!path || !*path || *path =3D=3D '/')
++              return do_utimensat(path, stp);
++
++      slash =3D strrchr(path, '/');
++      if (!slash)
++              return do_utimensat(path, stp);
++
++      dlen =3D slash - path;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, path, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      t[0].tv_sec =3D stp->st_atime;
++#ifdef ST_ATIME_NSEC
++      t[0].tv_nsec =3D stp->ST_ATIME_NSEC;
++#else
++      t[0].tv_nsec =3D 0;
++#endif
++      t[1].tv_sec =3D stp->st_mtime;
++#ifdef ST_MTIME_NSEC
++      t[1].tv_nsec =3D stp->ST_MTIME_NSEC;
++#else
++      t[1].tv_nsec =3D 0;
++#endif
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++      ret =3D utimensat(dfd, bname, t, AT_SYMLINK_NOFOLLOW);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_utimensat(path, stp);
++#endif
++}
+ #endif
+
+ #ifdef HAVE_LUTIMES
+@@ -820,6 +1546,30 @@ int do_open_nofollow(const char *pathname, int flags=
)
+   The relpath must also not contain any ../ elements in the path.
+ */
+
++/* Returns 1 if path has any "/"-separated component that is exactly
++ * "..", 0 otherwise. Used by secure_relative_open's front-door
++ * validation to reject inputs that the per-component walk fallback
++ * would otherwise resolve through ".." -- e.g. bare "..", "foo/..",
++ * "subdir/.." -- which RESOLVE_BENEATH-equivalent kernels reject in
++ * the kernel but the per-component fallback (NetBSD/OpenBSD/Solaris/
++ * Cygwin/pre-5.6 Linux) does not. */
++static int path_has_dotdot_component(const char *path)
++{
++      const char *p =3D path;
++
++      while (*p) {
++              const char *q;
++              if (*p =3D=3D '/') { p++; continue; }
++              q =3D p;
++              while (*q && *q !=3D '/')
++                      q++;
++              if (q - p =3D=3D 2 && p[0] =3D=3D '.' && p[1] =3D=3D '.')
++                      return 1;
++              p =3D q;
++      }
++      return 0;
++}
++
+ #ifdef __linux__
+ static int secure_relative_open_linux(const char *basedir, const char *re=
lpath, int flags, mode_t mode)
+ {
+@@ -833,10 +1583,25 @@ static int secure_relative_open_linux(const char *b=
asedir, const char *relpath,
+
+        if (basedir =3D=3D NULL) {
+                dirfd =3D AT_FDCWD;
+-      } else {
++      } else if (basedir[0] =3D=3D '/') {
++              /* Absolute basedir: operator-trusted (module_dir and the
++               * like). Plain openat. */
+                dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY=
);
+                if (dirfd =3D=3D -1)
+                        return -1;
++      } else {
++              /* Relative basedir: may be wire-influenced via
++               * --link-dest / --copy-dest / --compare-dest. Resolve it
++               * under the same RESOLVE_BENEATH guarantee as relpath, so
++               * a parent symlink on basedir cannot redirect the dirfd
++               * outside the CWD anchor. */
++              struct open_how bhow;
++              memset(&bhow, 0, sizeof bhow);
++              bhow.flags =3D O_RDONLY | O_DIRECTORY;
++              bhow.resolve =3D RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;
++              dirfd =3D syscall(SYS_openat2, AT_FDCWD, basedir, &bhow, si=
zeof bhow);
++              if (dirfd =3D=3D -1)
++                      return -1;
+        }
+
+        retfd =3D syscall(SYS_openat2, dirfd, relpath, &how, sizeof how);
+@@ -859,10 +1624,17 @@ static int secure_relative_open_resolve_beneath(con=
st char *basedir, const char
+
+        if (basedir =3D=3D NULL) {
+                dirfd =3D AT_FDCWD;
+-      } else {
++      } else if (basedir[0] =3D=3D '/') {
++              /* Absolute basedir: operator-trusted, plain openat. */
+                dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY=
);
+                if (dirfd =3D=3D -1)
+                        return -1;
++      } else {
++              /* Relative basedir: confine its resolution beneath CWD
++               * (see secure_relative_open_linux for the rationale). */
++              dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY =
| O_RESOLVE_BENEATH);
++              if (dirfd =3D=3D -1)
++                      return -1;
+        }
+
+        retfd =3D openat(dirfd, relpath, flags | O_RESOLVE_BENEATH, mode);
+@@ -880,8 +1652,20 @@ int secure_relative_open(const char *basedir, const =
char *relpath, int flags, mo
+                errno =3D EINVAL;
+                return -1;
+        }
+-      if (strncmp(relpath, "../", 3) =3D=3D 0 || strstr(relpath, "/../"))=
 {
+-              // no ../ elements allowed in the relpath
++      /* Reject any path with a literal ".." component (bare "..",
++       * "../foo", "foo/..", "foo/../bar", "subdir/.."). The previous
++       * substring-based check caught only "../" prefix and "/../"
++       * substring; bare ".." and trailing "/.." escape on the per-
++       * component walk fallback used by NetBSD/OpenBSD/Solaris/Cygwin
++       * and pre-5.6 Linux. RESOLVE_BENEATH on Linux/FreeBSD/macOS
++       * catches some of these in-kernel with EXDEV, but the front
++       * door must reject them consistently with EINVAL across all
++       * platforms so callers can rely on the validation. */
++      if (path_has_dotdot_component(relpath)) {
++              errno =3D EINVAL;
++              return -1;
++      }
++      if (basedir && basedir[0] !=3D '/' && path_has_dotdot_component(bas=
edir)) {
+                errno =3D EINVAL;
+                return -1;
+        }
+@@ -911,15 +1695,47 @@ int secure_relative_open(const char *basedir, const=
 char *relpath, int flags, mo
+ #else
+        int dirfd =3D AT_FDCWD;
+        if (basedir !=3D NULL) {
+-              dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY)=
;
+-              if (dirfd =3D=3D -1) {
+-                      return -1;
++              if (basedir[0] =3D=3D '/') {
++                      /* Absolute basedir: operator-trusted, plain openat=
. */
++                      dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DI=
RECTORY);
++                      if (dirfd =3D=3D -1) {
++                              return -1;
++                      }
++              } else {
++                      /* Relative basedir: walk it component-by-component
++                       * with O_NOFOLLOW. This is the per-component
++                       * RESOLVE_BENEATH equivalent for platforms without
++                       * kernel-supported confinement, and matches the
++                       * relpath walk below. Symlinks in basedir are
++                       * rejected outright on this fallback path; the
++                       * Linux openat2 / O_RESOLVE_BENEATH paths above
++                       * still allow within-tree symlinks. */
++                      char *bcopy =3D my_strdup(basedir, __FILE__, __LINE=
__);
++                      if (!bcopy)
++                              return -1;
++                      for (const char *part =3D strtok(bcopy, "/");
++                           part !=3D NULL;
++                           part =3D strtok(NULL, "/"))
++                      {
++                              int next_fd =3D openat(dirfd, part, O_RDONL=
Y | O_DIRECTORY | O_NOFOLLOW);
++                              if (next_fd =3D=3D -1) {
++                                      int save_errno =3D errno;
++                                      if (dirfd !=3D AT_FDCWD) close(dirf=
d);
++                                      free(bcopy);
++                                      errno =3D save_errno;
++                                      return -1;
++                              }
++                              if (dirfd !=3D AT_FDCWD) close(dirfd);
++                              dirfd =3D next_fd;
++                      }
++                      free(bcopy);
+                }
+        }
+        int retfd =3D -1;
+
+        char *path_copy =3D my_strdup(relpath, __FILE__, __LINE__);
+        if (!path_copy) {
++              if (dirfd !=3D AT_FDCWD) close(dirfd);
+                return -1;
+        }
+
+@@ -945,8 +1761,15 @@ int secure_relative_open(const char *basedir, const =
char *relpath, int flags, mo
+                dirfd =3D next_fd;
+        }
+
+-      // the path must be a directory
+-      errno =3D EINVAL;
++      /* All components walked as directories. If the caller asked for
++       * O_DIRECTORY, return the dirfd we built up; otherwise the path
++       * resolved to a directory but the caller wanted a regular file. */
++      if ((flags & O_DIRECTORY) && dirfd !=3D AT_FDCWD) {
++              retfd =3D dirfd;
++              dirfd =3D AT_FDCWD;
++              goto cleanup;
++      }
++      errno =3D EISDIR;
+
+ cleanup:
+        free(path_copy);
+diff --git a/t_secure_relpath.c b/t_secure_relpath.c
+new file mode 100644
+index 00000000..a0fdf0d2
+--- /dev/null
++++ b/t_secure_relpath.c
+@@ -0,0 +1,151 @@
++/*
++ * Test harness for secure_relative_open()'s front-door input
++ * validation. Codex audit Finding 5 noted that the existing check
++ *
++ *     if (strncmp(relpath, "../", 3) =3D=3D 0 || strstr(relpath, "/../")=
)
++ *
++ * catches "../foo" and "foo/../bar" but misses bare ".." (an actual
++ * one-level escape on platforms that fall back to the per-component
++ * walk), as well as "a/..", "foo/..", and any other form that
++ * decomposes to a ".." component when split on "/". The kernel-
++ * enforced RESOLVE_BENEATH (Linux 5.6+) and O_RESOLVE_BENEATH
++ * (FreeBSD 13+, macOS 15+) reject these in-kernel; the per-
++ * component fallback used on NetBSD, OpenBSD, Solaris, Cygwin and
++ * pre-5.6 Linux does not, so the validation must happen at the
++ * front door.
++ *
++ * This helper invokes secure_relative_open() with each suspect
++ * input and checks both the failure (rc < 0) and the errno
++ * (EINVAL means "rejected at the front door"). Pre-fix, the kernel
++ * may reject with a different errno (EXDEV from RESOLVE_BENEATH);
++ * post-fix, the front-door check catches every variant up front
++ * with a consistent EINVAL across platforms.
++ *
++ * Not linked into rsync itself.
++ */
++
++#include "rsync.h"
++
++#include <sys/stat.h>
++
++int dry_run =3D 0;
++int am_root =3D 0;
++int am_sender =3D 0;
++int read_only =3D 0;
++int list_only =3D 0;
++int copy_links =3D 0;
++int copy_unsafe_links =3D 0;
++extern int am_daemon, am_chrooted;
++
++short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
++
++static int errs =3D 0;
++
++static void check_relpath(const char *relpath)
++{
++      int fd;
++      int saved_errno;
++
++      errno =3D 0;
++      fd =3D secure_relative_open(NULL, relpath, O_RDONLY | O_DIRECTORY, =
0);
++      saved_errno =3D errno;
++
++      if (fd >=3D 0) {
++              fprintf(stderr,
++                      "FAIL [relpath=3D%-12s]: returned valid fd %d (esca=
pe) -- expected -1 EINVAL\n",
++                      relpath, fd);
++              close(fd);
++              errs++;
++              return;
++      }
++
++      if (saved_errno !=3D EINVAL) {
++              fprintf(stderr,
++                      "FAIL [relpath=3D%-12s]: rejected but errno=3D%d (%=
s), expected EINVAL\n",
++                      relpath, saved_errno, strerror(saved_errno));
++              errs++;
++              return;
++      }
++
++      fprintf(stderr, "OK   [relpath=3D%-12s]: rejected with EINVAL\n", r=
elpath);
++}
++
++static void check_basedir(const char *basedir)
++{
++      int fd;
++      int saved_errno;
++
++      errno =3D 0;
++      fd =3D secure_relative_open(basedir, "ok", O_RDONLY | O_DIRECTORY, =
0);
++      saved_errno =3D errno;
++
++      if (fd >=3D 0) {
++              fprintf(stderr,
++                      "FAIL [basedir=3D%-12s]: returned valid fd %d -- ex=
pected -1 EINVAL\n",
++                      basedir, fd);
++              close(fd);
++              errs++;
++              return;
++      }
++
++      if (saved_errno !=3D EINVAL) {
++              fprintf(stderr,
++                      "FAIL [basedir=3D%-12s]: rejected but errno=3D%d (%=
s), expected EINVAL\n",
++                      basedir, saved_errno, strerror(saved_errno));
++              errs++;
++              return;
++      }
++
++      fprintf(stderr, "OK   [basedir=3D%-12s]: rejected with EINVAL\n", b=
asedir);
++}
++
++int main(int argc, char **argv)
++{
++      if (argc !=3D 2) {
++              fprintf(stderr, "usage: %s <test-dir>\n", argv[0]);
++              return 2;
++      }
++      if (chdir(argv[1]) < 0) {
++              perror("chdir");
++              return 2;
++      }
++
++      /* secure_relative_open's daemon-only confinement protections only
++       * fire when am_daemon && !am_chrooted (the threat model is the
++       * daemon-no-chroot deployment), but the front-door input
++       * validation runs unconditionally. We set am_daemon anyway so the
++       * helper exercises the same code shape the receiver does. */
++      am_daemon =3D 1;
++      am_chrooted =3D 0;
++
++      mkdir("subdir", 0755);
++
++      /* Each of these relpaths must be rejected with EINVAL at the
++       * secure_relative_open() front door. ".." is the actual one-level
++       * escape; the others ("subdir/..", "subdir/../subdir") resolve
++       * back to the start dir on systems that allow them, but we still
++       * reject them as defence-in-depth: a path containing a ".." token
++       * is suspicious and the caller should normalise before passing
++       * it in. The "../foo" / "foo/../bar" / "/foo" / "/" cases are
++       * regression checks for the existing checks. */
++      check_relpath("..");
++      check_relpath("../foo");
++      check_relpath("subdir/..");
++      check_relpath("subdir/../subdir");
++      check_relpath("foo/../bar");
++      check_relpath("/foo");
++      check_relpath("/");
++
++      /* Same checks against basedir (which the codex Finding 2 fix
++       * routes through the same RESOLVE_BENEATH-equivalent). Absolute
++       * basedirs are operator-trusted and intentionally not validated
++       * here. */
++      check_basedir("..");
++      check_basedir("../subdir");
++      check_basedir("subdir/..");
++      check_basedir("foo/../bar");
++
++      if (errs)
++              fprintf(stderr, "\n%d failure(s)\n", errs);
++      return errs ? 1 : 0;
++}
+diff --git a/testsuite/alt-dest-symlink-race.test b/testsuite/alt-dest-sym=
link-race.test
+new file mode 100755
+index 00000000..2256f2f2
+--- /dev/null
++++ b/testsuite/alt-dest-symlink-race.test
+@@ -0,0 +1,96 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for the basedir-confinement gap in
++# secure_relative_open(). The function opens basedir with a plain
++# openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY), without
++# RESOLVE_BENEATH or a per-component O_NOFOLLOW walk, so a parent
++# symlink ON basedir is followed unrestrictedly. RESOLVE_BENEATH is
++# then applied only to relpath, anchored at the wrong directory.
++#
++# The receiver's basis-file lookup at receiver.c passes
++# basis_dir[fnamecmp_type] (from --copy-dest / --link-dest /
++# --compare-dest -- all sender-controllable in daemon mode) as
++# basedir. A daemon-module attacker with write access can plant a
++# symlink at module/cd -> /outside, then run --link-dest=3Dcd to
++# make the daemon's basis-file lookup resolve into /outside,
++# leaking the contents of daemon-readable files via the rsync
++# delta-rolling read-disclosure primitive.
++#
++# We detect the escape by leveraging --link-dest: when basis
++# matches source exactly (content + mtime + mode), --link-dest
++# hard-links the destination to the basis file. With the bug, the
++# destination ends up as a hard link to the outside-the-module
++# file (same inode). With the fix, no basis is found and the
++# destination is a fresh copy (different inode).
++#
++# The vulnerable code path is the same on every platform
++# (including the per-component fallback on systems without
++# RESOLVE_BENEATH), so this test is not platform-gated.
++
++. "$suitedir/rsync.fns"
++
++mod=3D"$scratchdir/module"
++outside=3D"$scratchdir/outside"
++src=3D"$scratchdir/src"
++conf=3D"$scratchdir/test-rsyncd.conf"
++
++rm -rf "$mod" "$outside" "$src"
++mkdir -p "$mod" "$outside" "$src"
++
++# Portable inode-number helper (GNU coreutils stat -c, BSD stat -f).
++file_inode() {
++    stat -c %i "$1" 2>/dev/null || stat -f %i "$1"
++}
++
++# Outside-the-module file an attacker would like the daemon to
++# treat as a basis.
++echo "OUTSIDE_SECRET_DATA" > "$outside/target.txt"
++chmod 0644 "$outside/target.txt"
++
++# The symlink trap planted in the module by the local attacker.
++ln -s "$outside" "$mod/cd"
++
++# Source file matches outside/target.txt exactly (content + mtime
++# + mode) so --link-dest will hard-link the destination to the
++# basis file iff the daemon's basedir lookup reaches outside/.
++echo "OUTSIDE_SECRET_DATA" > "$src/target.txt"
++touch -r "$outside/target.txt" "$src/target.txt"
++chmod 0644 "$src/target.txt"
++
++cat > "$conf" <<EOF
++use chroot =3D no
++log file =3D $scratchdir/rsyncd.log
++[upload]
++    path =3D $mod
++    use chroot =3D no
++    read only =3D no
++EOF
++
++# Recursive --link-dest push directly into the module root. We
++# avoid pushing into a destination subdir because the receiver
++# would chdir into it before resolving --link-dest, making the
++# relative basedir "cd" resolve in the wrong CWD and masking the
++# bug. The realistic attack pushes into the module root (or the
++# attacker uses a basedir path that resolves correctly from
++# whichever subdir the receiver chdirs into).
++RSYNC_CONNECT_PROG=3D"$RSYNC --config=3D$conf --daemon" \
++    $RSYNC -rtp --link-dest=3Dcd "$src/" rsync://localhost/upload/ \
++    >/dev/null 2>&1 || true
++
++if [ ! -f "$mod/target.txt" ]; then
++    test_fail "destination file was not created -- daemon transfer failed=
 before the test could observe the basedir behaviour"
++fi
++
++outside_inode=3D$(file_inode "$outside/target.txt")
++dst_inode=3D$(file_inode "$mod/target.txt")
++
++if [ "$outside_inode" =3D "$dst_inode" ]; then
++    test_fail "basedir-escape: --link-dest hard-linked module/target.txt =
to outside/target.txt (inode $outside_inode); daemon's basis-file lookup fo=
llowed the parent symlink on the basedir"
++fi
++
++exit 0
+diff --git a/testsuite/secure-relpath-validation.test b/testsuite/secure-r=
elpath-validation.test
+new file mode 100755
+index 00000000..5b77f7cc
+--- /dev/null
++++ b/testsuite/secure-relpath-validation.test
+@@ -0,0 +1,34 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex audit Finding 5: secure_relative_open()'s
++# front-door input check rejects "../foo" and "foo/../bar" but
++# misses bare "..", "subdir/..", and other variants whose "/"-split
++# components contain a literal "..". The kernel-enforced
++# RESOLVE_BENEATH (Linux 5.6+) and O_RESOLVE_BENEATH
++# (FreeBSD 13+, macOS 15+) reject these in-kernel; the per-component
++# walk fallback used on NetBSD, OpenBSD, Solaris, Cygwin and pre-5.6
++# Linux does not -- so the validation must happen at the front door.
++#
++# This test invokes the t_secure_relpath helper, which calls
++# secure_relative_open() with each suspect input and verifies the
++# return value is -1 with errno =3D=3D EINVAL. EINVAL is the marker
++# that the front-door rejected the input, not the kernel; pre-fix
++# the kernel returns -1 with EXDEV (or, on the per-component
++# fallback, may return a valid fd at all -- "escape").
++
++. "$suitedir/rsync.fns"
++
++testdir=3D"$scratchdir/relpath-test"
++rm -rf "$testdir"
++mkdir -p "$testdir"
++
++if ! "$TOOLDIR/t_secure_relpath" "$testdir"; then
++    test_fail "t_secure_relpath rejected one or more inputs incorrectly (=
see stderr above for the specific case)"
++fi
++
++exit 0
+diff --git a/util1.c b/util1.c
+index 6e457d4f..8850019f 100644
+--- a/util1.c
++++ b/util1.c
+@@ -141,7 +141,7 @@ int set_times(const char *fname, STRUCT_STAT *stp)
+
+ #ifdef HAVE_UTIMENSAT
+ #include "case_N.h"
+-              if (do_utimensat(fname, stp) =3D=3D 0)
++              if (do_utimensat_at(fname, stp) =3D=3D 0)
+                        break;
+                if (errno !=3D ENOSYS)
+                        return -1;
+@@ -479,13 +479,13 @@ int copy_file(const char *source, const char *dest, =
int tmpfilefd, mode_t mode)
+ int robust_unlink(const char *fname)
+ {
+ #ifndef ETXTBSY
+-      return do_unlink(fname);
++      return do_unlink_at(fname);
+ #else
+        static int counter =3D 1;
+        int rc, pos, start;
+        char path[MAXPATHLEN];
+
+-      rc =3D do_unlink(fname);
++      rc =3D do_unlink_at(fname);
+        if (rc =3D=3D 0 || errno !=3D ETXTBSY)
+                return rc;
+
+@@ -515,7 +515,7 @@ int robust_unlink(const char *fname)
+        }
+
+        /* maybe we should return rename()'s exit status? Nah. */
+-      if (do_rename(fname, path) !=3D 0) {
++      if (do_rename_at(fname, path) !=3D 0) {
+                errno =3D ETXTBSY;
+                return -1;
+        }
+@@ -538,7 +538,7 @@ int robust_rename(const char *from, const char *to, co=
nst char *partialptr,
+                return 0;
+
+        while (tries--) {
+-              if (do_rename(from, to) =3D=3D 0)
++              if (do_rename_at(from, to) =3D=3D 0)
+                        return 0;
+
+                switch (errno) {
+@@ -559,7 +559,7 @@ int robust_rename(const char *from, const char *to, co=
nst char *partialptr,
+                        }
+                        if (copy_file(from, to, -1, mode) !=3D 0)
+                                return -2;
+-                      do_unlink(from);
++                      do_unlink_at(from);
+                        return 1;
+                default:
+                        return -1;
+@@ -1329,20 +1329,20 @@ int handle_partial_dir(const char *fname, int crea=
te)
+        dir =3D partial_fname;
+        if (create) {
+                STRUCT_STAT st;
+-              int statret =3D do_lstat(dir, &st);
++              int statret =3D do_lstat_at(dir, &st);
+                if (statret =3D=3D 0 && !S_ISDIR(st.st_mode)) {
+-                      if (do_unlink(dir) < 0) {
++                      if (do_unlink_at(dir) < 0) {
+                                *fn =3D '/';
+                                return 0;
+                        }
+                        statret =3D -1;
+                }
+-              if (statret < 0 && do_mkdir(dir, 0700) < 0) {
++              if (statret < 0 && do_mkdir_at(dir, 0700) < 0) {
+                        *fn =3D '/';
+                        return 0;
+                }
+        } else
+-              do_rmdir(dir);
++              do_rmdir_at(dir);
+        *fn =3D '/';
+
+        return 1;
+diff --git a/xattrs.c b/xattrs.c
+index 4462d63b..2e16024b 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -1249,7 +1249,12 @@ int set_stat_xattr(const char *fname, struct file_s=
truct *file, mode_t new_mode)
+
+ int x_stat(const char *fname, STRUCT_STAT *fst, STRUCT_STAT *xst)
+ {
+-      int ret =3D do_stat(fname, fst);
++      /* Use the *_at variants so that on a daemon-no-chroot deployment
++       * the metadata read goes through a secure parent dirfd instead
++       * of bare path resolution. The *_at wrappers fall through to
++       * plain do_stat outside the daemon-no-chroot context, so this
++       * change is transparent for non-daemon use. */
++      int ret =3D do_stat_at(fname, fst);
+        if ((ret < 0 || get_stat_xattr(fname, -1, fst, xst) < 0) && xst)
+                xst->st_mode =3D 0;
+        return ret;
+@@ -1257,7 +1262,7 @@ int x_stat(const char *fname, STRUCT_STAT *fst, STRU=
CT_STAT *xst)
+
+ int x_lstat(const char *fname, STRUCT_STAT *fst, STRUCT_STAT *xst)
+ {
+-      int ret =3D do_lstat(fname, fst);
++      int ret =3D do_lstat_at(fname, fst);
+        if ((ret < 0 || get_stat_xattr(fname, -1, fst, xst) < 0) && xst)
+                xst->st_mode =3D 0;
+        return ret;
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch
new file mode 100644
index 0000000000..26d2122d7c
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch
@@ -0,0 +1,568 @@
+From 1efd7d95ad3813ea3d4b303d277cd46297f7c2f5 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 6 May 2026 09:45:30 +1000
+Subject: [PATCH] util1+syscall: secure copy_file source/dest opens; bare-p=
ath
+ defence-in-depth
+
+Three related codex audit findings:
+
+  Finding 3a: copy_file()'s source open in util1.c used
+  do_open_nofollow(), which only rejects a final-component
+  symlink. A parent-component symlink (e.g. --copy-dest=3Dcd where
+  cd -> /outside) follows freely and reads outside the module.
+  Route through secure_relative_open() with O_NOFOLLOW.
+
+  Finding 3b: generator.c's in-place backup-file create still
+  used a bare do_open with O_CREAT, leaving a tiny but reachable
+  parent-symlink window between the secure unlink (already
+  through do_unlink_at) and the create. Add do_open_at() that
+  goes through a secure parent dirfd, and route the call site
+  through it.
+
+  Finding 3c: copy_file()'s destination open in
+  unlink_and_reopen() had the same bare-do_open pattern; route
+  through do_open_at as well.
+
+Adds testsuite/copy-dest-source-symlink.test and
+testsuite/bare-do-open-symlink-race.test as regression coverage
+for both attack shapes.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/3c=
c6a9e8cdcffb637ecdd41dae47833096dca317]
+
+(cherry picked from commit 3cc6a9e8cdcffb637ecdd41dae47833096dca317)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ generator.c                              |   2 +-
+ syscall.c                                | 138 +++++++++++++++--
+ testsuite/bare-do-open-symlink-race.test | 186 +++++++++++++++++++++++
+ testsuite/copy-dest-source-symlink.test  |  83 ++++++++++
+ util1.c                                  |  21 ++-
+ 5 files changed, 416 insertions(+), 14 deletions(-)
+ create mode 100755 testsuite/bare-do-open-symlink-race.test
+ create mode 100755 testsuite/copy-dest-source-symlink.test
+
+diff --git a/generator.c b/generator.c
+index e5b2d176..311e9b78 100644
+--- a/generator.c
++++ b/generator.c
+@@ -1896,7 +1896,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,
+                        back_file =3D NULL;
+                        goto cleanup;
+                }
+-              if ((f_copy =3D do_open(backupptr, O_WRONLY | O_CREAT | O_T=
RUNC | O_EXCL, 0600)) < 0) {
++              if ((f_copy =3D do_open_at(backupptr, O_WRONLY | O_CREAT | =
O_TRUNC | O_EXCL, 0600)) < 0) {
+                        rsyserr(FERROR_XFER, errno, "open %s", full_fname(=
backupptr));
+                        unmake_file(back_file);
+                        back_file =3D NULL;
+diff --git a/syscall.c b/syscall.c
+index ffd8df20..10a3c231 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -203,11 +203,6 @@ int do_symlink_at(const char *lnk, const char *path)
+        if (!am_daemon || am_chrooted)
+                return do_symlink(lnk, path);
+
+-#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
+-      if (am_root < 0)
+-              return do_symlink(lnk, path);
+-#endif
+-
+        if (!path || !*path || *path =3D=3D '/')
+                return do_symlink(lnk, path);
+
+@@ -228,6 +223,34 @@ int do_symlink_at(const char *lnk, const char *path)
+        if (dfd < 0)
+                return -1;
+
++#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
++      /* For --fake-super, do_symlink writes the link target into a
++       * regular file rather than creating a real symlink. Do that
++       * here against the secure dirfd, with O_NOFOLLOW so a pre-
++       * planted symlink at the basename can't redirect the file
++       * creation. (Previously the fake-super branch fell through to
++       * the bare-path do_symlink at the top of the function.) */
++      if (am_root < 0) {
++              int len =3D strlen(lnk);
++              int fd =3D openat(dfd, bname,
++                              O_WRONLY | O_CREAT | O_TRUNC | O_NOFOLLOW,
++                              S_IWUSR | S_IRUSR);
++              if (fd < 0) {
++                      e =3D errno;
++                      close(dfd);
++                      errno =3D e;
++                      return -1;
++              }
++              ret =3D (write(fd, lnk, len) =3D=3D len) ? 0 : -1;
++              if (close(fd) < 0)
++                      ret =3D -1;
++              e =3D errno;
++              close(dfd);
++              errno =3D e;
++              return ret;
++      }
++#endif
++
+        ret =3D symlinkat(lnk, dfd, bname);
+        e =3D errno;
+        close(dfd);
+@@ -503,9 +526,12 @@ int do_mknod(const char *pathname, mode_t mode, dev_t=
 dev)
+   mknodat() against that dirfd. mknodat() covers both regular-file
+   (S_IFREG with dev=3D0) and FIFO (S_IFIFO) and device-node creation.
+
+-  Falls through to do_mknod() for fake-super (am_root < 0) and for
+-  sockets, both of which use auxiliary path-based syscalls that
+-  don't have an *at() variant in any portable form.
++  Fake-super (am_root < 0) is handled inline against the secure
++  parent dirfd: it creates a regular empty file (the same file-as-
++  metadata-placeholder pattern do_mknod uses) via openat() with
++  O_NOFOLLOW. Sockets fall through to do_mknod() because their
++  bind(2) takes a path argument with no portable bindat() variant;
++  this is documented as a residual.
+ */
+ int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)
+ {
+@@ -523,9 +549,6 @@ int do_mknod_at(const char *pathname, mode_t mode, dev=
_t dev)
+        if (!am_daemon || am_chrooted)
+                return do_mknod(pathname, mode, dev);
+
+-      if (am_root < 0)
+-              return do_mknod(pathname, mode, dev);
+-
+ #if !defined MKNOD_CREATES_SOCKETS && defined HAVE_SYS_UN_H
+        if (S_ISSOCK(mode))
+                return do_mknod(pathname, mode, dev);
+@@ -551,6 +574,29 @@ int do_mknod_at(const char *pathname, mode_t mode, de=
v_t dev)
+        if (dfd < 0)
+                return -1;
+
++      if (am_root < 0) {
++              /* For --fake-super, do_mknod creates a regular empty
++               * file as a placeholder for the special-file metadata
++               * (which is stored in xattrs elsewhere). Do that against
++               * the secure dirfd, with O_NOFOLLOW so a pre-planted
++               * symlink at the basename can't redirect the file
++               * creation. */
++              int fd =3D openat(dfd, bname,
++                              O_WRONLY | O_CREAT | O_TRUNC | O_NOFOLLOW,
++                              S_IWUSR | S_IRUSR);
++              if (fd < 0) {
++                      e =3D errno;
++                      close(dfd);
++                      errno =3D e;
++                      return -1;
++              }
++              ret =3D (close(fd) < 0) ? -1 : 0;
++              e =3D errno;
++              close(dfd);
++              errno =3D e;
++              return ret;
++      }
++
+ #if !defined MKNOD_CREATES_FIFOS && defined HAVE_MKFIFO
+        if (S_ISFIFO(mode))
+                ret =3D mkfifoat(dfd, bname, mode);
+@@ -639,6 +685,76 @@ int do_open(const char *pathname, int flags, mode_t m=
ode)
+        return open(pathname, flags | O_BINARY, mode);
+ }
+
++/*
++  Symlink-race-safe variant of do_open() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. open() resolves
++  parent components, so a parent-symlink swap can redirect the open
++  to a file outside the module. This wrapper is defence-in-depth for
++  bare-path do_open() sites that callers know are otherwise
++  protected by secure parent-syscalls (e.g. generator.c's in-place
++  backup creation, where robust_unlink() rejects the symlinked
++  parent before this open is reached): if any of those upstream
++  protections is later removed or regresses, the open here still
++  refuses to escape the module.
++
++  Defence: open the parent of pathname under secure_relative_open()
++  and call openat() against the resulting dirfd with O_NOFOLLOW
++  (so the basename itself isn't followed if it happens to be a
++  pre-planted symlink, which is what we want for O_CREAT|O_EXCL).
++*/
++int do_open_at(const char *pathname, int flags, mode_t mode)
++{
++#ifdef AT_FDCWD
++      extern int am_daemon, am_chrooted;
++      char dirpath[MAXPATHLEN];
++      const char *bname;
++      const char *slash;
++      int dfd, ret, e;
++      size_t dlen;
++
++      if (flags !=3D O_RDONLY) {
++              RETURN_ERROR_IF(dry_run, 0);
++              RETURN_ERROR_IF_RO_OR_LO;
++      }
++
++      if (!am_daemon || am_chrooted)
++              return do_open(pathname, flags, mode);
++
++      if (!pathname || !*pathname || *pathname =3D=3D '/')
++              return do_open(pathname, flags, mode);
++
++      slash =3D strrchr(pathname, '/');
++      if (!slash)
++              return do_open(pathname, flags, mode);
++
++      dlen =3D slash - pathname;
++      if (dlen >=3D sizeof dirpath) {
++              errno =3D ENAMETOOLONG;
++              return -1;
++      }
++      memcpy(dirpath, pathname, dlen);
++      dirpath[dlen] =3D '\0';
++      bname =3D slash + 1;
++
++      dfd =3D secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY,=
 0);
++      if (dfd < 0)
++              return -1;
++
++#ifdef O_NOATIME
++      if (open_noatime)
++              flags |=3D O_NOATIME;
++#endif
++
++      ret =3D openat(dfd, bname, flags | O_NOFOLLOW | O_BINARY, mode);
++      e =3D errno;
++      close(dfd);
++      errno =3D e;
++      return ret;
++#else
++      return do_open(pathname, flags, mode);
++#endif
++}
++
+ #ifdef HAVE_CHMOD
+ int do_chmod(const char *path, mode_t mode)
+ {
+diff --git a/testsuite/bare-do-open-symlink-race.test b/testsuite/bare-do-=
open-symlink-race.test
+new file mode 100755
+index 00000000..b8c51bbe
+--- /dev/null
++++ b/testsuite/bare-do-open-symlink-race.test
+@@ -0,0 +1,186 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex audit Findings 3b and 3c:
++#
++#   3b: generator.c:1905 -- the in-place backup creation opens
++#       backupptr via bare do_open(O_WRONLY|O_CREAT|O_TRUNC|O_EXCL).
++#       With --backup-dir set to an attacker-planted parent symlink,
++#       the backup file is written outside the module under the
++#       daemon's authority.
++#
++#   3c-symlink: syscall.c:207 -- do_symlink_at falls through to bare
++#       do_symlink for am_root < 0 (fake-super), which then opens
++#       the destination path with bare open() (final-component
++#       fake-super file). A parent symlink on the destination path
++#       redirects the file creation outside the module.
++#
++#   3c-mknod: syscall.c:506 -- do_mknod_at falls through to bare
++#       do_mknod for am_root < 0, same path-based open(). For
++#       FIFOs/sockets/devices the bare path is also used.
++#
++# Each scenario plants a "secret" file outside the module at a
++# location the symlink trap points to. The check is that the
++# outside file's content and mode are unchanged after the attack
++# attempt.
++
++. "$suitedir/rsync.fns"
++
++# All three scenarios depend on receiver-side daemon code paths
++# that are only secured on platforms with a working
++# secure_relative_open. The chdir/chmod tests already skip the
++# same set; mirror that.
++case "$(uname -s)" in
++    SunOS|OpenBSD|NetBSD|CYGWIN*)
++        test_skipped "secure_relative_open relies on RESOLVE_BENEATH-equi=
valent kernel support not available on $(uname -s)"
++        ;;
++esac
++
++mod=3D"$scratchdir/module"
++outside=3D"$scratchdir/outside"
++src=3D"$scratchdir/src"
++conf=3D"$scratchdir/test-rsyncd.conf"
++
++# Portable inode-and-mode helpers.
++file_mode() {
++    stat -c %a "$1" 2>/dev/null || stat -f %Lp "$1"
++}
++
++setup() {
++    rm -rf "$mod" "$outside" "$src"
++    mkdir -p "$mod" "$outside" "$src"
++
++    echo "OUTSIDE_PROTECTED_DATA" > "$outside/target.txt"
++    chmod 0644 "$outside/target.txt"
++    outside_pristine=3D"$scratchdir/outside-pristine.txt"
++    cp -p "$outside/target.txt" "$outside_pristine"
++
++    ln -s "$outside" "$mod/cd"
++}
++
++verify_outside_unchanged() {
++    label=3D"$1"
++    mode=3D$(file_mode "$outside/target.txt")
++    case "$mode" in
++        644|0644) ;;
++        *) test_fail "$label: outside/target.txt mode changed from 644 to=
 $mode" ;;
++    esac
++    if ! cmp -s "$outside/target.txt" "$outside_pristine"; then
++        test_fail "$label: outside/target.txt content changed -- daemon f=
ollowed the cd symlink"
++    fi
++}
++
++verify_outside_unchanged_or_absent() {
++    label=3D"$1"
++    target=3D"$2"  # specific file under outside/ to check absence of
++    if [ -e "$outside/$target" ]; then
++        test_fail "$label: outside/$target was created -- daemon followed=
 the cd symlink"
++    fi
++}
++
++
++############################################################
++# Scenario 3b: --inplace --backup --backup-dir=3Dcd
++#
++# Pre-create module/target.txt so the receiver enters the in-place
++# update path; a backup of the existing content must be made
++# before the update. With --backup-dir=3Dcd, backupptr resolves to
++# "cd/target.txt"; with the bug, robust_unlink and the bare
++# do_open at generator.c:1905 both follow the cd symlink, the
++# unlink deletes outside/target.txt and the create writes the
++# pre-existing module/target.txt content there.
++############################################################
++
++setup
++echo "EXISTING_MODULE_DATA" > "$mod/target.txt"
++chmod 0666 "$mod/target.txt"
++echo "NEW_DATA_FROM_SENDER" > "$src/target.txt"
++chmod 0644 "$src/target.txt"
++
++cat > "$conf" <<EOF
++use chroot =3D no
++log file =3D $scratchdir/rsyncd.log
++[upload]
++    path =3D $mod
++    use chroot =3D no
++    read only =3D no
++EOF
++
++RSYNC_CONNECT_PROG=3D"$RSYNC --config=3D$conf --daemon" \
++    $RSYNC --inplace --backup --backup-dir=3Dcd "$src/target.txt" \
++    rsync://localhost/upload/target.txt >/dev/null 2>&1 || true
++
++verify_outside_unchanged "3b inplace+backup-dir=3Dcd"
++
++
++############################################################
++# Scenario 3c-symlink: fake-super symlink push to a path with a
++# symlinked parent
++#
++# With "fake super =3D yes" set on the module, the receiver
++# represents symlinks as fake-super files (regular files with the
++# link target written to them). The path-based open() in
++# do_symlink's fake-super branch follows parent symlinks. We push
++# a single symlink to the destination path "cd/sym" so the
++# receiver's create-file call lands at "cd/sym" relative to the
++# module root, where cd is the symlink trap.
++############################################################
++
++setup
++
++mkdir -p "$src/cd"
++ln -s /etc/passwd "$src/cd/sym"
++
++cat > "$conf" <<EOF
++use chroot =3D no
++log file =3D $scratchdir/rsyncd.log
++[upload_fake]
++    path =3D $mod
++    use chroot =3D no
++    read only =3D no
++    fake super =3D yes
++EOF
++
++RSYNC_CONNECT_PROG=3D"$RSYNC --config=3D$conf --daemon" \
++    $RSYNC -rl "$src/" rsync://localhost/upload_fake/ >/dev/null 2>&1 || =
true
++
++verify_outside_unchanged_or_absent "3c-symlink fake-super symlink push" "=
sym"
++
++
++############################################################
++# Scenario 3c-mknod: fake-super FIFO push to a path with a
++# symlinked parent
++#
++# Similar to 3c-symlink but for special files. mkfifo works
++# without root; we push a FIFO and verify the receiver doesn't
++# create a fake-super file at outside/fifo.
++############################################################
++
++setup
++
++mkdir -p "$src/cd"
++mkfifo "$src/cd/fifo" 2>/dev/null
++if [ ! -p "$src/cd/fifo" ]; then
++    test_skipped "mkfifo unavailable; cannot exercise 3c-mknod"
++fi
++
++cat > "$conf" <<EOF
++use chroot =3D no
++log file =3D $scratchdir/rsyncd.log
++[upload_fake]
++    path =3D $mod
++    use chroot =3D no
++    read only =3D no
++    fake super =3D yes
++EOF
++
++RSYNC_CONNECT_PROG=3D"$RSYNC --config=3D$conf --daemon" \
++    $RSYNC -rD "$src/" rsync://localhost/upload_fake/ >/dev/null 2>&1 || =
true
++
++verify_outside_unchanged_or_absent "3c-mknod fake-super FIFO push" "fifo"
++
++exit 0
+diff --git a/testsuite/copy-dest-source-symlink.test b/testsuite/copy-dest=
-source-symlink.test
+new file mode 100755
+index 00000000..2d20fab4
+--- /dev/null
++++ b/testsuite/copy-dest-source-symlink.test
+@@ -0,0 +1,83 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex audit Finding 3a: copy_file()'s source
++# open in copy_altdest_file() is via do_open_nofollow(), which only
++# refuses a final-component symlink. Parent components are still
++# resolved with normal symlink-following. A daemon module attacker
++# who plants a parent symlink at module/cd -> /outside, then runs
++# --copy-dest=3Dcd against a source file matching the size+mtime of
++# /outside/target.txt, drives the receiver to:
++#
++#   1. Find a match-level >=3D 2 basis at "cd/target.txt"
++#   2. Call copy_altdest_file -> copy_file(src=3D"cd/target.txt", ...)
++#   3. do_open_nofollow follows the "cd" parent symlink and reads
++#      the contents of /outside/target.txt under the daemon's
++#      authority
++#   4. Copy that content into the module destination
++#
++# Result: outside/target.txt content lands at module/target.txt,
++# accessible to the attacker on a subsequent pull.
++#
++# We detect by content: src/target.txt and outside/target.txt have
++# identical metadata (size + mtime + mode) but different content.
++# After the transfer, module/target.txt should match src (no
++# basedir escape) -- if it matches outside, the bug copied across
++# the symlink boundary.
++
++. "$suitedir/rsync.fns"
++
++mod=3D"$scratchdir/module"
++outside=3D"$scratchdir/outside"
++src=3D"$scratchdir/src"
++conf=3D"$scratchdir/test-rsyncd.conf"
++
++rm -rf "$mod" "$outside" "$src"
++mkdir -p "$mod" "$outside" "$src"
++
++# Outside-the-module file the daemon should not read on the
++# attacker's behalf.
++echo "OUTSIDE_LEAKED_DATA!" > "$outside/target.txt"
++chmod 0644 "$outside/target.txt"
++
++# The symlink trap.
++ln -s "$outside" "$mod/cd"
++
++# Source: same size, same mtime, same mode as outside -- so the
++# generator's link_stat + quick_check_ok finds a match-level >=3D 2
++# basis and calls copy_altdest_file.
++echo "ATTACKER_KNOWN_DATA!" > "$src/target.txt"
++touch -r "$outside/target.txt" "$src/target.txt"
++chmod 0644 "$src/target.txt"
++
++cat > "$conf" <<EOF
++use chroot =3D no
++log file =3D $scratchdir/rsyncd.log
++[upload]
++    path =3D $mod
++    use chroot =3D no
++    read only =3D no
++EOF
++
++# --copy-dest push to module root.
++RSYNC_CONNECT_PROG=3D"$RSYNC --config=3D$conf --daemon" \
++    $RSYNC -rtp --copy-dest=3Dcd "$src/" rsync://localhost/upload/ \
++    >/dev/null 2>&1 || true
++
++if [ ! -f "$mod/target.txt" ]; then
++    test_fail "destination file was not created -- daemon transfer failed=
 before the test could observe the basedir behaviour"
++fi
++
++if cmp -s "$mod/target.txt" "$outside/target.txt"; then
++    test_fail "basedir-escape via copy_file source: module/target.txt now=
 contains the contents of outside/target.txt -- daemon read /outside via th=
e cd symlink and copied it into the module"
++fi
++
++if ! cmp -s "$mod/target.txt" "$src/target.txt"; then
++    test_fail "destination doesn't match source content (and isn't outsid=
e content either): unexpected state"
++fi
++
++exit 0
+diff --git a/util1.c b/util1.c
+index 8850019f..d28a8e02 100644
+--- a/util1.c
++++ b/util1.c
+@@ -336,7 +336,13 @@ static int unlink_and_reopen(const char *dest, mode_t=
 mode)
+                mode |=3D S_IWUSR;
+ #endif
+        mode &=3D INITACCESSPERMS;
+-      if ((ofd =3D do_open(dest, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL, m=
ode)) < 0) {
++      /* Use do_open_at so the create/truncate goes through a secure
++       * parent dirfd in the daemon-no-chroot deployment. Otherwise
++       * an attacker could swap a parent component with a symlink in
++       * the window between robust_unlink (which uses do_unlink_at,
++       * already secure) and the create here, and redirect the new
++       * file outside the module. */
++      if ((ofd =3D do_open_at(dest, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL=
, mode)) < 0) {
+                int save_errno =3D errno;
+                rsyserr(FERROR_XFER, save_errno, "open %s", full_fname(des=
t));
+                errno =3D save_errno;
+@@ -360,12 +366,23 @@ static int unlink_and_reopen(const char *dest, mode_=
t mode)
+  * --copy-dest options. */
+ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t=
 mode)
+ {
++      extern int am_daemon, am_chrooted;
+        int ifd, ofd;
+        char buf[1024 * 8];
+        int len;   /* Number of bytes read into `buf'. */
+        OFF_T prealloc_len =3D 0, offset =3D 0;
+
+-      if ((ifd =3D do_open_nofollow(source, O_RDONLY)) < 0) {
++      /* On a daemon without chroot, route the source open through
++       * secure_relative_open so a parent-symlink on the source path
++       * (e.g. --copy-dest=3Dcd where cd is a symlink to an outside
++       * directory) cannot redirect the read to a file the daemon can
++       * see but the attacker should not. Plain do_open_nofollow only
++       * refuses a final-component symlink; parents are still followed. *=
/
++      if (am_daemon && !am_chrooted && source && *source && source[0] !=
=3D '/')
++              ifd =3D secure_relative_open(NULL, source, O_RDONLY | O_NOF=
OLLOW, 0);
++      else
++              ifd =3D do_open_nofollow(source, O_RDONLY);
++      if (ifd < 0) {
+                int save_errno =3D errno;
+                rsyserr(FERROR_XFER, errno, "open %s", full_fname(source))=
;
+                errno =3D save_errno;
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p5.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p5.patch
new file mode 100644
index 0000000000..c15af2c0ba
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p5.patch
@@ -0,0 +1,69 @@
+From d944dae7e5c1c194db23a1fefa443dd240d52afd Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 4 Jun 2026 14:46:38 +1000
+Subject: [PATCH] build: fall back to do_mknod() when mknodat() is
+ unavailable (#896)
+
+do_mknod_at() (the symlink-race-safe variant used by a non-chrooted
+daemon receiver) calls mknodat()/mkfifoat(), but the at-variant was
+gated only on AT_FDCWD.  Older Darwin declares AT_FDCWD without
+mknodat(), so the build failed with "mknodat undeclared".
+
+Probe mknodat()/mkfifoat() in configure and require HAVE_MKNODAT for the
+at-variant; without it do_mknod_at() falls back to do_mknod(), exactly
+as it already does where AT_FDCWD is missing.  Linux keeps the mknodat
+path since HAVE_MKNODAT is defined there.
+
+Thanks to @debohman for the report (#896).
+
+Fixes: #896
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/f3=
757a470ad3defdb2c4c6ad334e3839f3c7f1ae]
+
+(cherry picked from commit f3757a470ad3defdb2c4c6ad334e3839f3c7f1ae)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ configure.ac | 2 +-
+ syscall.c    | 6 ++++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d2bcb471..1d9b3713 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -888,7 +888,7 @@ AC_FUNC_UTIME_NULL
+ AC_FUNC_ALLOCA
+ AC_CHECK_FUNCS(waitpid wait4 getcwd chown chmod lchmod mknod mkfifo \
+     fchmod fstat ftruncate strchr readlink link utime utimes lutimes strf=
time \
+-    chflags getattrlist mktime innetgr linkat \
++    chflags getattrlist mktime innetgr linkat mknodat mkfifoat \
+     memmove lchown vsnprintf snprintf vasprintf asprintf setsid strpbrk \
+     strlcat strlcpy stpcpy strtol mallinfo mallinfo2 getgroups setgroups =
geteuid getegid \
+     setlocale setmode open64 lseek64 mkstemp64 mtrace va_copy __va_copy \
+diff --git a/syscall.c b/syscall.c
+index 10a3c231..25c92aac 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -535,7 +535,9 @@ int do_mknod(const char *pathname, mode_t mode, dev_t =
dev)
+ */
+ int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)
+ {
+-#ifdef AT_FDCWD
++      /* HAVE_MKNODAT: older Darwin declares AT_FDCWD but not mknodat(), =
so
++       * the at-variant won't build there; fall back to do_mknod() (#896)=
. */
++#if defined(AT_FDCWD) && defined(HAVE_MKNODAT)
+        extern int am_daemon, am_chrooted;
+        char dirpath[MAXPATHLEN];
+        const char *bname;
+@@ -597,7 +599,7 @@ int do_mknod_at(const char *pathname, mode_t mode, dev=
_t dev)
+                return ret;
+        }
+
+-#if !defined MKNOD_CREATES_FIFOS && defined HAVE_MKFIFO
++#if !defined MKNOD_CREATES_FIFOS && defined HAVE_MKFIFO && defined HAVE_M=
KFIFOAT
+        if (S_ISFIFO(mode))
+                ret =3D mkfifoat(dfd, bname, mode);
+        else
+--
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch
new file mode 100644
index 0000000000..9cdbf4e2fe
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch
@@ -0,0 +1,264 @@
+From 94e63a8632a3c3bc10ac630a53a99ed01a82f9de Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 1 Jul 2026 02:40:00 -0700
+Subject: [PATCH] build: openat2 autodetect + android probe (R1
+ #924/#905/#900, R10 #904)
+
+configure now probes for <linux/openat2.h> + SYS_openat2 and defines
+HAVE_OPENAT2 only when both are present; syscall.c gates the openat2 inclu=
de
+and the openat2(RESOLVE_BENEATH) tier on HAVE_OPENAT2, so the build no lon=
ger
+fails on kernels/headers that lack the openat2 header (3.4.3 included it
+unconditionally on Linux).  android.c probes openat2 usability behind a SI=
GSYS
+handler so the Android/Termux seccomp sandbox falls back to the portable
+resolver instead of killing the process.
+
+Backport combining c73e0063, 83a24c21, the syscall.c guards from 1d5b5ab8,=
 and
+4634b0ad; the --disable-openat2/gcov coverage knobs and test changes are o=
mitted.
+
+Thanks to @mmayer (#924), @fda77 (#905), @darkshram (#900) and @ketas (#90=
4) for the reports.
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/c1=
4e2258b59a3f16a99c6e83a28660ba438a73e9]
+
+Backport Changes:
+- Rebased syscall.c context around Wrynose's existing
+  secure_relative_open() hardening while preserving the upstream
+  HAVE_OPENAT2 compile gate, openat2_usable() Android SIGSYS probe,
+  openat2_beneath() wrapper, and ENOSYS/runtime fallback behavior.
+
+(cherry picked from commit c14e2258b59a3f16a99c6e83a28660ba438a73e9)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Makefile.in  | 12 ++++-----
+ android.c    | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
+ configure.ac | 22 +++++++++++++++++
+ syscall.c    | 23 +++++++++++++----
+ 4 files changed, 128 insertions(+), 11 deletions(-)
+ create mode 100644 android.c
+
+diff --git a/Makefile.in b/Makefile.in
+index c0cc7a06..f2590b69 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -49,7 +49,7 @@ LIBOBJ=3Dlib/wildmatch.o lib/compat.o lib/snprintf.o lib=
/mdfour.o lib/md5.o \
+ zlib_OBJS=3Dzlib/deflate.o zlib/inffast.o zlib/inflate.o zlib/inftrees.o =
\
+        zlib/trees.o zlib/zutil.o zlib/adler32.o zlib/compress.o zlib/crc3=
2.o
+ OBJS1=3Dflist.o rsync.o generator.o receiver.o cleanup.o sender.o exclude=
.o \
+-      util1.o util2.o main.o checksum.o match.o syscall.o log.o backup.o =
delete.o
++      util1.o util2.o main.o checksum.o match.o syscall.o android.o log.o=
 backup.o delete.o
+ OBJS2=3Doptions.o io.o compat.o hlink.o token.o uidlist.o socket.o hashta=
ble.o \
+        usage.o fileio.o batch.o clientname.o chmod.o acls.o xattrs.o
+ OBJS3=3Dprogress.o pipe.o @MD5_ASM@ @ROLL_SIMD@ @ROLL_ASM@
+@@ -58,7 +58,7 @@ popt_OBJS=3Dpopt/findme.o  popt/popt.o  popt/poptconfig.=
o \
+        popt/popthelp.o popt/poptparse.o popt/poptint.o
+ OBJS=3D$(OBJS1) $(OBJS2) $(OBJS3) $(DAEMON_OBJ) $(LIBOBJ) @BUILD_ZLIB@ @B=
UILD_POPT@
+
+-TLS_OBJ =3D tls.o syscall.o util2.o t_stub.o lib/compat.o lib/snprintf.o =
lib/permstring.o lib/sysxattrs.o @BUILD_POPT@
++TLS_OBJ =3D tls.o syscall.o android.o util2.o t_stub.o lib/compat.o lib/s=
nprintf.o lib/permstring.o lib/sysxattrs.o @BUILD_POPT@
+
+ # Programs we must have to run the test cases
+ CHECK_PROGS =3D rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(=
EXEEXT) \
+@@ -176,19 +176,19 @@ getgroups$(EXEEXT): getgroups.o
+ getfsdev$(EXEEXT): getfsdev.o
+        $(CC) $(CFLAGS) $(LDFLAGS) -o $@ getfsdev.o $(LIBS)
+
+-TRIMSLASH_OBJ =3D trimslash.o syscall.o util2.o t_stub.o lib/compat.o lib=
/snprintf.o
++TRIMSLASH_OBJ =3D trimslash.o syscall.o android.o util2.o t_stub.o lib/co=
mpat.o lib/snprintf.o
+ trimslash$(EXEEXT): $(TRIMSLASH_OBJ)
+        $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(TRIMSLASH_OBJ) $(LIBS)
+
+-T_UNSAFE_OBJ =3D t_unsafe.o syscall.o util1.o util2.o t_stub.o lib/compat=
.o lib/snprintf.o lib/wildmatch.o
++T_UNSAFE_OBJ =3D t_unsafe.o syscall.o android.o util1.o util2.o t_stub.o =
lib/compat.o lib/snprintf.o lib/wildmatch.o
+ t_unsafe$(EXEEXT): $(T_UNSAFE_OBJ)
+        $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_UNSAFE_OBJ) $(LIBS)
+
+-T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o util1.o util2.o t_stub.=
o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o
++T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o android.o util1.o util2=
.o t_stub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o
+ t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)
+        $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_CHMOD_SECURE_OBJ) $(LIBS)
+
+-T_SECURE_RELPATH_OBJ =3D t_secure_relpath.o syscall.o util1.o util2.o t_s=
tub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o
++T_SECURE_RELPATH_OBJ =3D t_secure_relpath.o syscall.o android.o util1.o u=
til2.o t_stub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.=
o
+ t_secure_relpath$(EXEEXT): $(T_SECURE_RELPATH_OBJ)
+        $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_SECURE_RELPATH_OBJ) $(LIBS)
+
+diff --git a/android.c b/android.c
+new file mode 100644
+index 00000000..572f5f21
+--- /dev/null
++++ b/android.c
+@@ -0,0 +1,82 @@
++/*
++ * Android-specific helpers.
++ *
++ * openat2() usability probe
++ * -------------------------
++ * openat2(2) is invoked directly via syscall() because the C library lac=
ked a
++ * wrapper for it for years.  Under a seccomp filter that uses
++ * SECCOMP_RET_TRAP -- as the Android application sandbox does -- a disal=
lowed
++ * syscall raises SIGSYS and *kills the process* rather than failing with
++ * ENOSYS, so inspecting errno after the call is too late.  We therefore =
probe
++ * openat2() once, behind a temporary SIGSYS handler, so a trapped syscal=
l is
++ * caught and secure_relative_open_linux() can fall back to the portable
++ * per-component O_NOFOLLOW resolver instead of the whole process dying.
++ *
++ * This is only needed on Android, so the probe body is compiled only the=
re.
++ * __ANDROID__ is defined by Bionic's headers and reflects the *target*, =
not
++ * the build host: it is set both for NDK cross-compiles (from a Linux/ma=
cOS
++ * host) and for native Termux builds, and is unset on every other platfo=
rm.
++ * That makes it a reliable compile-time switch for cross builds -- there=
 is
++ * nothing to detect in configure.  Everywhere else openat2() is never
++ * seccomp-trapped to SIGSYS (a missing syscall simply returns ENOSYS), s=
o
++ * openat2_usable() collapses to a constant 1 with no run-time cost.
++ */
++
++#include "rsync.h"
++
++#if defined(__ANDROID__) && defined(HAVE_OPENAT2)
++
++#include <setjmp.h>
++#include <sys/syscall.h>
++#include <linux/openat2.h>
++
++static sigjmp_buf openat2_probe_env;
++
++static void openat2_probe_handler(int signo)
++{
++      (void)signo;
++      siglongjmp(openat2_probe_env, 1);
++}
++
++#endif
++
++int openat2_usable(void)
++{
++#if defined(__ANDROID__) && defined(HAVE_OPENAT2)
++      static int cached =3D -1;
++      struct sigaction sa, old_sa;
++
++      if (cached >=3D 0)
++              return cached;
++
++      memset(&sa, 0, sizeof sa);
++      sa.sa_handler =3D openat2_probe_handler;
++      sigemptyset(&sa.sa_mask);
++      if (sigaction(SIGSYS, &sa, &old_sa) !=3D 0)
++              return cached =3D 0;
++
++      if (sigsetjmp(openat2_probe_env, 1) !=3D 0) {
++              /* SIGSYS delivered: openat2 is blocked by a seccomp filter=
. */
++              cached =3D 0;
++      } else {
++              struct open_how how;
++              int fd;
++              memset(&how, 0, sizeof how);
++              how.flags =3D O_RDONLY | O_DIRECTORY;
++              how.resolve =3D RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;
++              fd =3D syscall(SYS_openat2, AT_FDCWD, ".", &how, sizeof how=
);
++              if (fd >=3D 0)
++                      close(fd);
++              /* Usable only if the probe actually succeeded.  Any failur=
e --
++               * ENOSYS (kernel < 5.6), a seccomp SECCOMP_RET_ERRNO denia=
l
++               * (EPERM/EACCES), or EINVAL (RESOLVE_BENEATH unsupported) =
--
++               * means we must fall back to the portable O_NOFOLLOW walk.=
 */
++              cached =3D fd >=3D 0;
++      }
++
++      sigaction(SIGSYS, &old_sa, NULL);
++      return cached;
++#else
++      return 1;
++#endif
++}
+diff --git a/configure.ac b/configure.ac
+index 1d9b3713..123480e1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -331,6 +331,28 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[ ]], [[return 0;=
]])],
+ CFLAGS=3D"$OLD_CFLAGS"
+ AC_SUBST(NOEXECSTACK)
+
++dnl Only define HAVE_OPENAT2 when both the <linux/openat2.h> header and t=
he
++dnl SYS_openat2 syscall number are present.  syscall.c uses openat2(RESOL=
VE_BENEATH)
++dnl for the secure resolver on Linux 5.6+; defining it unconditionally br=
oke the
++dnl build on older kernels/headers that lack the header (#924, #905, #900=
).
++AC_CACHE_CHECK([for openat2],rsync_cv_HAVE_OPENAT2,[
++    AC_COMPILE_IFELSE([
++        AC_LANG_PROGRAM([[
++#include <sys/syscall.h>
++#include <linux/openat2.h>
++]], [[
++struct open_how how;
++how.resolve =3D RESOLVE_BENEATH;
++return SYS_openat2 + (int)how.resolve;
++]])
++    ],
++    [rsync_cv_HAVE_OPENAT2=3Dyes], [rsync_cv_HAVE_OPENAT2=3Dno])
++])
++if test x"$rsync_cv_HAVE_OPENAT2" =3D x"yes"; then
++  AC_DEFINE([HAVE_OPENAT2], 1,
++    [Define to use Linux openat2(RESOLVE_BENEATH) in secure_relative_open=
 where available.])
++fi
++
+ # arrgh. libc in some old debian version screwed up the largefile
+ # stuff, getting byte range locking wrong
+ AC_CACHE_CHECK([for broken largefile support],rsync_cv_HAVE_BROKEN_LARGEF=
ILE,[
+diff --git a/syscall.c b/syscall.c
+index 25c92aac..f26b144d 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -33,7 +33,7 @@
+ #include <sys/syscall.h>
+ #endif
+
+-#ifdef __linux__
++#if defined(__linux__) && defined(HAVE_OPENAT2)
+ #include <sys/syscall.h>
+ #include <linux/openat2.h>
+ #endif
+@@ -1688,7 +1688,20 @@ static int path_has_dotdot_component(const char *pa=
th)
+        return 0;
+ }
+
+-#ifdef __linux__
++#if defined(__linux__) && defined(HAVE_OPENAT2)
++/* openat2(RESOLVE_BENEATH) via the raw syscall, gated on openat2_usable(=
) so a
++ * seccomp filter that traps openat2 with SIGSYS (e.g. the Android sandbo=
x)
++ * makes us report ENOSYS and fall back rather than killing the process. =
 Only
++ * the openat2 call is gated here; a plain openat() is always safe to att=
empt. */
++static int openat2_beneath(int dirfd, const char *path, const struct open=
_how *how)
++{
++      if (!openat2_usable()) {
++              errno =3D ENOSYS;
++              return -1;
++      }
++      return syscall(SYS_openat2, dirfd, path, how, sizeof *how);
++}
++
+ static int secure_relative_open_linux(const char *basedir, const char *re=
lpath, int flags, mode_t mode)
+ {
+        struct open_how how;
+@@ -1717,12 +1726,12 @@ static int secure_relative_open_linux(const char *=
basedir, const char *relpath,
+                memset(&bhow, 0, sizeof bhow);
+                bhow.flags =3D O_RDONLY | O_DIRECTORY;
+                bhow.resolve =3D RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;
+-              dirfd =3D syscall(SYS_openat2, AT_FDCWD, basedir, &bhow, si=
zeof bhow);
++              dirfd =3D openat2_beneath(AT_FDCWD, basedir, &bhow);
+                if (dirfd =3D=3D -1)
+                        return -1;
+        }
+
+-      retfd =3D syscall(SYS_openat2, dirfd, relpath, &how, sizeof how);
++      retfd =3D openat2_beneath(dirfd, relpath, &how);
+
+        if (dirfd !=3D AT_FDCWD)
+                close(dirfd);
+@@ -1788,7 +1797,7 @@ int secure_relative_open(const char *basedir, const =
char *relpath, int flags, mo
+                return -1;
+        }
+
+-#ifdef __linux__
++#if defined(__linux__) && defined(HAVE_OPENAT2)
+        {
+                int fd =3D secure_relative_open_linux(basedir, relpath, fl=
ags, mode);
+                /* ENOSYS =3D kernel < 5.6 doesn't have the syscall even t=
hough
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb
index e2fe0128d5..47e195ef24 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -20,6 +20,12 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/$=
{BP}.tar.gz \
            file://CVE-2026-29518_p2.patch \
            file://CVE-2026-29518_p3.patch \
            file://CVE-2026-29518_p4.patch \
+           file://CVE-2026-43619_p1.patch \
+           file://CVE-2026-43619_p2.patch \
+           file://CVE-2026-43619_p3.patch \
+           file://CVE-2026-43619_p4.patch \
+           file://CVE-2026-43619_p5.patch \
+           file://CVE-2026-43619_p6.patch \
            "
 SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf6=
9850d65fd88c52"

--
2.35.6

--_000_PH0PR11MB5902B0D383F9119AB84AF482CFC62PH0PR11MB5902namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this patch series. I will send corrected patches again.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ashish.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ashishkumar Parmar X =
(asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;asparmar@cisco.com&gt=
;<br>
<b>Sent:</b> 17 July 2026 10:50<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;<br>
<b>Subject:</b> [wrynose][PATCH v2 2/6] rsync: Fix CVE-2026-43619</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt=
;<br>
<br>
This patch backports the upstream rsync v3.4.3 symlink-race fix chain<br>
for CVE-2026-43619. The upstream NEWS entry describes this CVE as<br>
symlink races on path-based system calls in &quot;use chroot =3D no&quot; d=
aemon<br>
mode, generalizing CVE-2026-29518 beyond the receiver's open() path.<br>
<br>
The backported commits form the following linear upstream chain:<br>
<br>
- [1] closes the receiver-side do_chmod() path.<br>
- [2] closes the daemon-no-chroot change_dir() escape.<br>
- [3] adds the remaining symlink-race-safe do_*_at() wrappers and<br>
&nbsp; migrates the affected path-based syscall users.<br>
- [4] closes adjacent bare-path copy/open surfaces. Upstream titles this<br=
>
&nbsp; commit &quot;defence-in-depth&quot;, but it is in the same linear v3=
.4.3<br>
&nbsp; symlink-race fix chain and Debian's rsync 3.4.1+ds1-5+deb13u3<br>
&nbsp; security update carries it as part of the CVE-2026-43619 patch train=
.<br>
<br>
The v3.4.3 security train also has portability and functional follow-ups<br=
>
that were released in v3.4.4, so this CVE-scoped backport includes them<br>
under CVE-2026-43619:<br>
<br>
- [5] adds the mknodat()/mkfifoat() configure fallback used by the new<br>
&nbsp; do_mknod_at() path.<br>
- [6] gates &lt;linux/openat2.h&gt; and openat2() use behind configure/runt=
ime<br>
&nbsp; checks so systems without the header or usable syscall fall back saf=
ely.<br>
<br>
The upstream fixed security release is referenced in [7], the v3.4.4<br>
follow-up release is referenced in [8], and the public advisory is<br>
referenced in [9]. The Debian tracker entry is referenced in [10].<br>
Individual backported commit links are also recorded in the embedded<br>
patch headers.<br>
<br>
[1] <a href=3D"https://github.com/RsyncProject/rsync/commit/862fe4eeaf82178=
324c66e504bf2c6c2e4038f99">
https://github.com/RsyncProject/rsync/commit/862fe4eeaf82178324c66e504bf2c6=
c2e4038f99</a><br>
[2] <a href=3D"https://github.com/RsyncProject/rsync/commit/15d296425609a99=
7f56eb8f9017ff73922f99b20">
https://github.com/RsyncProject/rsync/commit/15d296425609a997f56eb8f9017ff7=
3922f99b20</a><br>
[3] <a href=3D"https://github.com/RsyncProject/rsync/commit/30656c5e358b1c6=
033f4caf24f3e11b29d25c9f4">
https://github.com/RsyncProject/rsync/commit/30656c5e358b1c6033f4caf24f3e11=
b29d25c9f4</a><br>
[4] <a href=3D"https://github.com/RsyncProject/rsync/commit/3cc6a9e8cdcffb6=
37ecdd41dae47833096dca317">
https://github.com/RsyncProject/rsync/commit/3cc6a9e8cdcffb637ecdd41dae4783=
3096dca317</a><br>
[5] <a href=3D"https://github.com/RsyncProject/rsync/commit/f3757a470ad3def=
db2c4c6ad334e3839f3c7f1ae">
https://github.com/RsyncProject/rsync/commit/f3757a470ad3defdb2c4c6ad334e38=
39f3c7f1ae</a><br>
[6] <a href=3D"https://github.com/RsyncProject/rsync/commit/c14e2258b59a3f1=
6a99c6e83a28660ba438a73e9">
https://github.com/RsyncProject/rsync/commit/c14e2258b59a3f16a99c6e83a28660=
ba438a73e9</a><br>
[7] <a href=3D"https://github.com/RsyncProject/rsync/releases/tag/v3.4.3">h=
ttps://github.com/RsyncProject/rsync/releases/tag/v3.4.3</a><br>
[8] <a href=3D"https://github.com/RsyncProject/rsync/releases/tag/v3.4.4">h=
ttps://github.com/RsyncProject/rsync/releases/tag/v3.4.4</a><br>
[9] <a href=3D"https://github.com/RsyncProject/rsync/security/advisories/GH=
SA-4h9m-w5ff-j735">
https://github.com/RsyncProject/rsync/security/advisories/GHSA-4h9m-w5ff-j7=
35</a><br>
[10] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-43619"=
>https://security-tracker.debian.org/tracker/CVE-2026-43619</a><br>
<br>
Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
---<br>
&nbsp;.../rsync/files/CVE-2026-43619_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 471 +++++<br>
&nbsp;.../rsync/files/CVE-2026-43619_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 205 ++<br>
&nbsp;.../rsync/files/CVE-2026-43619_p3.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 1783 +++++++++++++++++<br>
&nbsp;.../rsync/files/CVE-2026-43619_p4.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 568 ++++++<br>
&nbsp;.../rsync/files/CVE-2026-43619_p5.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 69 +<br>
&nbsp;.../rsync/files/CVE-2026-43619_p6.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 264 +++<br>
&nbsp;meta/recipes-devtools/rsync/rsync_3.4.1.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp;&nbsp; 6 +<br>
&nbsp;7 files changed, 3366 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p=
1.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p=
2.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p=
3.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p=
4.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p=
5.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p=
6.patch<br>
<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch<br>
new file mode 100644<br>
index 0000000000..b1556e51fa<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch<br>
@@ -0,0 +1,471 @@<br>
+From e406eb555ea1fadb7c0dd8ddef3fde1b92771aa7 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Mon, 4 May 2026 21:53:14 +1000<br>
+Subject: [PATCH] syscall+receiver: secure receiver-side do_chmod against<b=
r>
+ symlink-race TOCTOU<br>
+<br>
+CVE-2026-29518's fix routed the receiver's open() through<br>
+secure_relative_open(), but every other path-based syscall the<br>
+receiver runs on sender-controllable paths is vulnerable to the<br>
+same TOCTOU primitive. This commit closes the chmod variant.<br>
+<br>
+Add do_chmod_at() that opens the parent of fname under<br>
+secure_relative_open() and uses fchmodat() against the resulting<br>
+dirfd. Gate the secure path on am_daemon &amp;&amp; !am_chrooted (the same=
<br>
+gate use_secure_symlinks already uses for the receiver basis-file<br>
+open), so non-daemon callers and chrooted daemons keep the original<br>
+do_chmod() fast path.<br>
+<br>
+Migrate the receiver-side do_chmod() call sites in delete.c,<br>
+generator.c, rsync.c, and xattrs.c.<br>
+<br>
+Adds testsuite/chmod-symlink-race.test (with t_chmod_secure helper)<br>
+as regression coverage.<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-43619<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/862fe4eeaf82178324c66e504bf2c6c2e4038f99">https://github.com/Rsync=
Project/rsync/commit/862fe4eeaf82178324c66e504bf2c6c2e4038f99</a>]<br>
+<br>
+Backport Changes:<br>
+- Upstream also updates runtests.py and a newer Makefile.in test<br>
+&nbsp; helper list that includes simdtest. Wrynose 3.4.1 does not carry<br=
>
+&nbsp; runtests.py and its CHECK_PROGS list has no simdtest entry, so<br>
+&nbsp; those test-runner hunks were not applicable.<br>
+<br>
+(cherry picked from commit 862fe4eeaf82178324c66e504bf2c6c2e4038f99)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ Makefile.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp;&nbsp; 9 ++-<br>
+ delete.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp;&nbsp; 4 +-<br>
+ generator.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp;&nbsp; 4 +-<br>
+ rsync.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
+ syscall.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp; 80 ++++++++++++++++++++<br>
+ t_chmod_secure.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 117 +++++++++++++++++++++++=
+++++++<br>
+ t_stub.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp;&nbsp; 2 +<br>
+ testsuite/chmod-symlink-race.test |&nbsp; 68 +++++++++++++++++<br>
+ xattrs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp;&nbsp; 6 +-<br>
+ 9 files changed, 282 insertions(+), 10 deletions(-)<br>
+ create mode 100644 t_chmod_secure.c<br>
+ create mode 100755 testsuite/chmod-symlink-race.test<br>
+<br>
+diff --git a/Makefile.in b/Makefile.in<br>
+index 2c5cf996..c30b8876 100644<br>
+--- a/Makefile.in<br>
++++ b/Makefile.in<br>
+@@ -62,12 +62,13 @@ TLS_OBJ =3D tls.o syscall.o util2.o t_stub.o lib/compa=
t.o lib/snprintf.o lib/perms<br>
+ <br>
+ # Programs we must have to run the test cases<br>
+ CHECK_PROGS =3D rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(=
EXEEXT) \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; testrun$(EXEEXT) trimslash$(EXEEXT) t_unsa=
fe$(EXEEXT) wildtest$(EXEEXT)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; testrun$(EXEEXT) trimslash$(EXEEXT) t_unsa=
fe$(EXEEXT) t_chmod_secure$(EXEEXT) \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wildtest$(EXEEXT)<br>
+ <br>
+ CHECK_SYMLINKS =3D testsuite/chown-fake.test testsuite/devices-fake.test =
testsuite/xattrs-hlink.test<br>
+ <br>
+ # Objects for CHECK_PROGS to clean<br>
+-CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
rimslash.o wildtest.o<br>
++CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
_chmod_secure.o trimslash.o wildtest.o<br>
+ <br>
+ # note that the -I. is needed to handle config.h when using VPATH<br>
+ .c.o:<br>
+@@ -183,6 +184,10 @@ T_UNSAFE_OBJ =3D t_unsafe.o syscall.o util1.o util2.o=
 t_stub.o lib/compat.o lib/sn<br>
+ t_unsafe$(EXEEXT): $(T_UNSAFE_OBJ)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $=
@ $(T_UNSAFE_OBJ) $(LIBS)<br>
+ <br>
++T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o util1.o util2.o t_stub.=
o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o<br>
++t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_CHMOD=
_SECURE_OBJ) $(LIBS)<br>
++<br>
+ .PHONY: conf<br>
+ conf: configure.sh config.h.in<br>
+ <br>
+diff --git a/delete.c b/delete.c<br>
+index 89c1f8d6..ded0ab2a 100644<br>
+--- a/delete.c<br>
++++ b/delete.c<br>
+@@ -98,7 +98,7 @@ static enum delret delete_dir_contents(char *fname, uint=
16 flags)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; strlcpy(p, fp-&gt;basename, remainder);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (!(fp-&gt;mode &amp; S_IWUSR) &amp;&amp; !am_root &amp;=
&amp; fp-&gt;flags &amp; FLAG_OWNED_BY_US)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_chmod(fname, fp-&g=
t;mode | S_IWUSR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_chmod_at(fname, fp=
-&gt;mode | S_IWUSR);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* Save stack by recursing to ourself directly. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (S_ISDIR(fp-&gt;mode)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (delete=
_dir_contents(fname, flags | DEL_RECURSE) !=3D DR_SUCCESS)<br>
+@@ -139,7 +139,7 @@ enum delret delete_item(char *fbuf, uint16 mode, uint1=
6 flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; DEL_NO_UID_WRIT=
E)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_chmod(fbuf, mode | S_IWUSR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_chmod_at(fbuf, mode | S_IWUSR);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISDIR(mode) &amp;&amp; !(=
flags &amp; DEL_DIR_IS_EMPTY)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* This only happens on the first call to delete_item() si=
nce<br>
+diff --git a/generator.c b/generator.c<br>
+index b56fa569..e5aff654 100644<br>
+--- a/generator.c<br>
++++ b/generator.c<br>
+@@ -1499,7 +1499,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,<br>
+ #ifdef HAVE_CHMOD<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (!am_root &amp;&amp; (file-&gt;mode &amp; S_IRWXU) !=3D=
 S_IRWXU &amp;&amp; dir_tweaking) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_t mod=
e =3D file-&gt;mode | S_IRWXU;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_chmod(fname, m=
ode) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_chmod_at(fname=
, mode) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FERROR_XFER, errno,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;failed to modify permissions on %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; full_fname(fname));<br>
+@@ -2111,7 +2111,7 @@ static void touch_up_dirs(struct file_list *flist, i=
nt ndx)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; fname =3D f_name(file, NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (fix_dir_perms)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_chmod(fname, file-=
&gt;mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_chmod_at(fname, fi=
le-&gt;mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (need_retouch_dir_times) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STRUCT_STA=
T st;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (link_s=
tat(fname, &amp;st, 0) =3D=3D 0 &amp;&amp; mtime_differs(&amp;st, file)) {<=
br>
+diff --git a/rsync.c b/rsync.c<br>
+index b130aba5..cc46a2f9 100644<br>
+--- a/rsync.c<br>
++++ b/rsync.c<br>
+@@ -657,7 +657,7 @@ int set_file_attrs(const char *fname, struct file_stru=
ct *file, stat_x *sxp,<br>
+ <br>
+ #ifdef HAVE_CHMOD<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!BITS_EQUAL(sxp-&gt;st.st_m=
ode, new_mode, CHMOD_BITS)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int ret =3D am_root &lt; 0 ? 0 : do_chmod(fname, new_mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int ret =3D am_root &lt; 0 ? 0 : do_chmod_at(fname, new_mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (ret &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR_XFER, errno,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;failed to set permissions on %s=
&quot;,<br>
+diff --git a/syscall.c b/syscall.c<br>
+index dcecda1a..06d5ed3f 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -281,6 +281,86 @@ int do_chmod(const char *path, mode_t mode)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return code;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+ }<br>
++<br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_chmod() for receiver-side use.<br>
++<br>
++&nbsp; Threat model: on a daemon running with &quot;use chroot =3D no&quo=
t; (the prerequisite<br>
++&nbsp; for CVE-2026-29518), a local attacker can race a symlink swap of o=
ne of<br>
++&nbsp; the parent directory components of a path the receiver is about to=
 chmod.<br>
++&nbsp; Because chmod() resolves symlinks at every component, the swap red=
irects<br>
++&nbsp; the chmod outside the receiver's confinement.<br>
++<br>
++&nbsp; Defence: open the *parent* directory of fname under secure_relativ=
e_open()<br>
++&nbsp; (which uses openat2(RESOLVE_BENEATH) on Linux 5.6+, openat() with<=
br>
++&nbsp; O_RESOLVE_BENEATH on FreeBSD 13+ and macOS 15+ (Sequoia), or a per=
-component<br>
++&nbsp; O_NOFOLLOW walk elsewhere) and do fchmodat() against that dirfd. A=
 symlink<br>
++&nbsp; substituted into one of the parent components is then either follo=
wed<br>
++&nbsp; within the tree (legitimate dir-symlinks still work) or rejected b=
y the<br>
++&nbsp; kernel (escape attempts fail).<br>
++<br>
++&nbsp; Final-component handling matches do_chmod(): fchmodat() with flag =
0<br>
++&nbsp; follows a symlink at the final component, which is the same behavi=
our as<br>
++&nbsp; chmod() and matches every current call site (the file being chmod'=
d is<br>
++&nbsp; one the receiver itself just created or transferred). For the rare=
 case<br>
++&nbsp; where the caller wants to chmod a symlink-as-an-object (S_ISLNK in=
 the<br>
++&nbsp; mode bits), we fall through to do_chmod() which has portability co=
de for<br>
++&nbsp; that case.<br>
++<br>
++&nbsp; Falls back to do_chmod() for absolute paths and for paths with no =
parent<br>
++&nbsp; component, where there is nothing to protect against.<br>
++*/<br>
++int do_chmod_at(const char *fname, mode_t mode)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Only the daemon-without-chroot case is =
exposed to the symlink-<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * race attack: a chroot already conf=
ines the receiver, and a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * non-daemon rsync runs with the use=
r's own authority so a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * symlink they planted can only redi=
rect to files they could<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * already access.&nbsp; Everywhere e=
lse, fall through to plain<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * do_chmod() to avoid the dirfd-open=
 overhead on every call. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_chmod(fname, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!fname || !*fname || *fname =3D=3D '/'=
 || S_ISLNK(mode))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_chmod(fname, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(fname, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_chmod(fname, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - fname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, fname, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D fchmodat(dfd, bname, mode, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_chmod(fname, mode);<br>
++#endif<br>
++}<br>
+ #endif<br>
+ <br>
+ int do_rename(const char *old_path, const char *new_path)<br>
+diff --git a/t_chmod_secure.c b/t_chmod_secure.c<br>
+new file mode 100644<br>
+index 00000000..114dfb2d<br>
+--- /dev/null<br>
++++ b/t_chmod_secure.c<br>
+@@ -0,0 +1,117 @@<br>
++/*<br>
++ * Test harness for do_chmod_at(). Confirms the symlink-TOCTOU<br>
++ * primitive used by CVE-2026-29518 (and its incomplete-fix follow-up<br>
++ * for chmod) is closed by do_chmod_at(): a parent directory component<br=
>
++ * being a symlink that escapes the receiver's confinement must be<br>
++ * rejected, while a parent symlink that resolves *within* the tree<br>
++ * must still work (so legitimate dir-symlinks are not regressed).<br>
++ *<br>
++ * Not linked into rsync itself.<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License version 2 as<br>
++ * published by the Free Software Foundation.<br>
++ */<br>
++<br>
++#include &quot;rsync.h&quot;<br>
++<br>
++#include &lt;sys/stat.h&gt;<br>
++<br>
++int dry_run =3D 0;<br>
++int am_root =3D 0;<br>
++int am_sender =3D 0;<br>
++int read_only =3D 0;<br>
++int list_only =3D 0;<br>
++int copy_links =3D 0;<br>
++int copy_unsafe_links =3D 0;<br>
++extern int am_daemon, am_chrooted;<br>
++<br>
++short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];<br>
++<br>
++static int errs =3D 0;<br>
++<br>
++static void check(const char *label, int actual_rc, int expect_ok,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; const char *path, mode_t expected_mode)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int got_ok =3D (actual_rc =3D=3D 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (got_ok !=3D expect_ok) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr, &quot;FAIL [%s]: rc=3D%d errno=3D%d (%s), expected %s=
\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label, actual_rc, err=
no, strerror(errno),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expect_ok ? &quot;suc=
cess&quot; : &quot;rejection&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errs++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (path &amp;&amp; stat(path, &amp;st) &l=
t; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr, &quot;FAIL [%s]: stat(%s) failed: %s\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label, path, strerror=
(errno));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errs++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (path &amp;&amp; (st.st_mode &amp; 0777=
7) !=3D expected_mode) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAIL [%s]: %s m=
ode is 0%o, expected 0%o\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; label, path, st.st_mo=
de &amp; 07777, expected_mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errs++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;OK&nbsp;&nbsp; [%s]\=
n&quot;, label);<br>
++}<br>
++<br>
++int main(int argc, char **argv)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (argc !=3D 2) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr, &quot;usage: %s &lt;module-dir&gt;\n&quot;, argv[0]);=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return 2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (chdir(argv[1]) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; perror(&quot;chdir&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return 2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Simulate the daemon-without-chroot depl=
oyment that do_chmod_at()<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * defends. With am_daemon=3D0 or am_=
chrooted=3D1 the wrapper falls<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * through to plain do_chmod() and th=
e symlink-race test would be<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * meaningless. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am_daemon =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am_chrooted =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Test layout (all inside the directory w=
e just chdir'd to):<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; ./realdir/=
sentinel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- regular target file<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; ./inside_l=
ink -&gt; realdir&nbsp; -- legitimate dir-symlink within the tree<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; ./escape_l=
ink -&gt; ../trap&nbsp; -- attacker swap, target outside tree<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; ../trap/se=
ntinel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- the file th=
e attacker wants to alter<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The shell wrapper that calls this =
helper has set both sentinel<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * files to mode 0600 so we have a cl=
ean baseline to compare.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Scenario A: legitimate parent dir-symli=
nk, chmod must succeed. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc =3D do_chmod_at(&quot;inside_link/s=
entinel&quot;, 0640);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check(&quot;A: legit dir-symlink within tr=
ee&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc, 1,=
 &quot;realdir/sentinel&quot;, 0640);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Scenario B: parent symlink escapes the =
tree -- chmod must be<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * rejected and the outside file's mo=
de must be unchanged. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D do_chmod_at(&quot;escape_link/senti=
nel&quot;, 0666);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check(&quot;B: parent symlink escapes tree=
 (the attack)&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc, 0,=
 &quot;../trap/sentinel&quot;, 0600);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Scenario C: plain relative path with no=
 symlink components,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * regression check that the safe wra=
pper doesn't break the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * normal case. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D do_chmod_at(&quot;realdir/sentinel&=
quot;, 0644);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check(&quot;C: plain relative path (regres=
sion check)&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc, 1,=
 &quot;realdir/sentinel&quot;, 0644);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Scenario D: top-level file, no parent d=
irectory component.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Falls back to do_chmod(); should s=
ucceed. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D do_chmod_at(&quot;topfile&quot;, 06=
40);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check(&quot;D: top-level file, no parent c=
omponent&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc, 1,=
 &quot;topfile&quot;, 0640);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (errs)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr, &quot;%d failure(s)\n&quot;, errs);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return errs ? 1 : 0;<br>
++}<br>
+diff --git a/t_stub.c b/t_stub.c<br>
+index eee92729..63bc144c 100644<br>
+--- a/t_stub.c<br>
++++ b/t_stub.c<br>
+@@ -23,6 +23,8 @@<br>
+ <br>
+ int do_fsync =3D 0;<br>
+ int inplace =3D 0;<br>
++int am_daemon =3D 0;<br>
++int am_chrooted =3D 0;<br>
+ int modify_window =3D 0;<br>
+ int preallocate_files =3D 0;<br>
+ int protect_args =3D 0;<br>
+diff --git a/testsuite/chmod-symlink-race.test b/testsuite/chmod-symlink-r=
ace.test<br>
+new file mode 100755<br>
+index 00000000..48bbfbb4<br>
+--- /dev/null<br>
++++ b/testsuite/chmod-symlink-race.test<br>
+@@ -0,0 +1,68 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for the symlink-TOCTOU class of bug applied to<br>
++# chmod() on the receiver side. The CVE-2026-29518 fix used<br>
++# secure_relative_open() for the basis-file open, but every other<br>
++# path-based syscall the receiver runs on sender-controllable paths<br>
++# is vulnerable to the same primitive: a local attacker swaps a<br>
++# symlink into one of the parent directory components between the<br>
++# receiver's check and its act, and the syscall escapes the module.<br>
++#<br>
++# This test exercises the new do_chmod_at() wrapper via the<br>
++# t_chmod_secure helper. The helper sets up two scenarios:<br>
++#&nbsp;&nbsp; - a parent dir-symlink that resolves WITHIN the module tree=
<br>
++#&nbsp;&nbsp;&nbsp;&nbsp; (legitimate -K-style use, must continue to work=
)<br>
++#&nbsp;&nbsp; - a parent dir-symlink that escapes the module tree (the<br=
>
++#&nbsp;&nbsp;&nbsp;&nbsp; attack, must be rejected)<br>
++# plus two regression scenarios (plain relative path, top-level<br>
++# file) that just confirm the safe wrapper doesn't break the<br>
++# normal case.<br>
++#<br>
++# The kernel-enforced &quot;stay below dirfd&quot; path resolution is<br>
++# only available on Linux 5.6+, FreeBSD 13+, and macOS 15+.<br>
++# Skip on platforms that fall back to per-component O_NOFOLLOW<br>
++# (Solaris, OpenBSD, NetBSD, Cygwin); the per-component fallback<br>
++# would also reject the attack but the legitimate dir-symlink<br>
++# scenario would fail there.<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++case &quot;$(uname -s)&quot; in<br>
++&nbsp;&nbsp;&nbsp; SunOS|OpenBSD|NetBSD|CYGWIN*)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_skipped &quot;do_chmod_at relies on R=
ESOLVE_BENEATH-equivalent kernel support not available on $(uname -s)&quot;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
++esac<br>
++<br>
++mod=3D&quot;$scratchdir/module&quot;<br>
++trap_outside=3D&quot;$scratchdir/trap&quot;<br>
++rm -rf &quot;$mod&quot; &quot;$trap_outside&quot;<br>
++mkdir -p &quot;$mod/realdir&quot; &quot;$trap_outside&quot;<br>
++<br>
++# Set up the four file-system objects the helper expects:<br>
++echo bystander &gt; &quot;$mod/realdir/sentinel&quot;<br>
++chmod 0600 &quot;$mod/realdir/sentinel&quot;<br>
++echo target &gt; &quot;$trap_outside/sentinel&quot;<br>
++chmod 0600 &quot;$trap_outside/sentinel&quot;<br>
++ln -s realdir &quot;$mod/inside_link&quot;<br>
++ln -s ../trap &quot;$mod/escape_link&quot;<br>
++echo top &gt; &quot;$mod/topfile&quot;<br>
++chmod 0600 &quot;$mod/topfile&quot;<br>
++<br>
++&quot;$TOOLDIR/t_chmod_secure&quot; &quot;$mod&quot; || \<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;t_chmod_secure reported failures (see =
stderr above)&quot;<br>
++<br>
++# Sanity-check from the shell side too: the outside file's mode must<br>
++# still be 0600 -- the helper checked this, but a second look from<br>
++# the shell guards against a helper-internal stat() bug.<br>
++mode=3D$(stat -c '%a' &quot;$trap_outside/sentinel&quot; 2&gt;/dev/null \=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || stat -f '%Lp' &quot;$trap_outside=
/sentinel&quot; 2&gt;/dev/null)<br>
++if [ &quot;$mode&quot; !=3D &quot;600&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;outside sentinel mode changed from 600=
 to $mode -- chmod escaped the module&quot;<br>
++fi<br>
++<br>
++exit 0<br>
+diff --git a/xattrs.c b/xattrs.c<br>
+index 26e50a6f..4462d63b 100644<br>
+--- a/xattrs.c<br>
++++ b/xattrs.c<br>
+@@ -1086,7 +1086,7 @@ int set_xattr(const char *fname, const struct file_s=
truct *file, const char *fna<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !S_ISLNK(sxp-&=
gt;st.st_mode)<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; access(fname, =
W_OK) &lt; 0<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; do_chmod(fname, (sxp-&gt;=
st.st_mode &amp; CHMOD_BITS) | S_IWUSR) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; do_chmod_at(fname, (sxp-&=
gt;st.st_mode &amp; CHMOD_BITS) | S_IWUSR) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; added_write_perm =3D 1;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ndx =3D F_XATTR(file);<br>
+@@ -1094,7 +1094,7 @@ int set_xattr(const char *fname, const struct file_s=
truct *file, const char *fna<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lst =3D &amp;glst-&gt;xa_items;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int return_value =3D rsync_xal_=
set(fname, lst, fnamecmp, sxp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (added_write_perm) /* remove=
 the temporary write permission */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_chmod(fname, sxp-&gt;st.st_mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_chmod_at(fname, sxp-&gt;st.st_mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return return_value;<br>
+ }<br>
+ <br>
+@@ -1211,7 +1211,7 @@ int set_stat_xattr(const char *fname, struct file_st=
ruct *file, mode_t new_mode)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode =3D (fst.st_mode &amp; _S_=
IFMT) | (fmode &amp; ACCESSPERMS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 (S_ISDIR(fst.st_mode) ? 0700 : 0600);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fst.st_mode !=3D mode)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_chmod(fname, mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_chmod_at(fname, mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!IS_DEVICE(fst.st_mode))<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; fst.st_rdev =3D 0; /* just in case */<br>
+ <br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch<br>
new file mode 100644<br>
index 0000000000..9decc58545<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch<br>
@@ -0,0 +1,205 @@<br>
+From a2269dd38ddc83bbc8738d8b0897400e8088c1a8 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Tue, 5 May 2026 14:34:33 +1000<br>
+Subject: [PATCH] util1: secure change_dir() against symlink-race chdir-esc=
ape<br>
+<br>
+The receiver's chdir(2) into a destination subdirectory followed<br>
+attacker-planted symlinks at every path component. Once CWD<br>
+escaped the module, every subsequent path-relative syscall (open,<br>
+chmod, lchown, ...) inherited the escape -- defeating<br>
+secure_relative_open's RESOLVE_BENEATH anchor against AT_FDCWD,<br>
+since the anchor itself was now outside the module.<br>
+<br>
+Route change_dir's relative target through secure_relative_open()<br>
+and fchdir() to the resulting dirfd in am_daemon &amp;&amp; !am_chrooted<b=
r>
+mode, so the chdir step itself can no longer follow a parent-<br>
+symlink. Same treatment applied to the CD_SKIP_CHDIR /<br>
+set_path_only path so it also can't follow attacker symlinks<br>
+during path tracking.<br>
+<br>
+Adds testsuite/sender-flist-symlink-leak.test covering the<br>
+sender-side flist resolution variant of the same primitive.<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-43619<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/15d296425609a997f56eb8f9017ff73922f99b20">https://github.com/Rsync=
Project/rsync/commit/15d296425609a997f56eb8f9017ff73922f99b20</a>]<br>
+<br>
+(cherry picked from commit 15d296425609a997f56eb8f9017ff73922f99b20)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ testsuite/sender-flist-symlink-leak.test | 90 ++++++++++++++++++++++++<br=
>
+ util1.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 56 ++++++++++++=
+--<br>
+ 2 files changed, 142 insertions(+), 4 deletions(-)<br>
+ create mode 100755 testsuite/sender-flist-symlink-leak.test<br>
+<br>
+diff --git a/testsuite/sender-flist-symlink-leak.test b/testsuite/sender-f=
list-symlink-leak.test<br>
+new file mode 100755<br>
+index 00000000..011d93d0<br>
+--- /dev/null<br>
++++ b/testsuite/sender-flist-symlink-leak.test<br>
+@@ -0,0 +1,90 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for codex re-check finding: the sender-side file-<br>
++# list generator can still follow an attacker-planted symlink out of<br>
++# the module via change_pathname() -&gt; change_dir(...,CD_SKIP_CHDIR)<br=
>
++# followed by change_dir(...,CD_NORMAL). The CD_SKIP_CHDIR sets<br>
++# skipped_chdir=3D1, and the next CD_NORMAL call's secure-branch in<br>
++# util1.c is gated on `!skipped_chdir`, so the secure path is<br>
++# bypassed and a raw chdir(curr_dir) follows attacker-controlled<br>
++# symlinks during flist generation.<br>
++#<br>
++# Reach: rsync daemon module with `use chroot =3D no`. A local<br>
++# attacker plants module/cd -&gt; /outside. A client (innocent or<br>
++# malicious) pulls rsync://&lt;daemon&gt;/&lt;module&gt;/cd/. The daemon,=
 as<br>
++# sender, enumerates files in /outside and ships their metadata<br>
++# (names, sizes, modes, mtimes) to the client. The actual content<br>
++# transfer fails later at the secure_relative_open step with EXDEV,<br>
++# but by then the metadata has already leaked.<br>
++#<br>
++# We detect by running a dry-run pull of the symlinked subdir and<br>
++# checking whether the client's --list-only output mentions any<br>
++# file from /outside. With the bug, /outside/secret.txt appears in<br>
++# the list with its size; with the fix, the daemon's chdir into<br>
++# the symlinked subdir is rejected and no /outside file is listed.<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++case &quot;$(uname -s)&quot; in<br>
++&nbsp;&nbsp;&nbsp; SunOS|OpenBSD|NetBSD|CYGWIN*)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_skipped &quot;secure chan=
ge_dir relies on RESOLVE_BENEATH-equivalent kernel support not available on=
 $(uname -s)&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
++esac<br>
++<br>
++mod=3D&quot;$scratchdir/module&quot;<br>
++outside=3D&quot;$scratchdir/outside&quot;<br>
++listfile=3D&quot;$scratchdir/listed.txt&quot;<br>
++conf=3D&quot;$scratchdir/test-rsyncd.conf&quot;<br>
++<br>
++rm -rf &quot;$mod&quot; &quot;$outside&quot;<br>
++mkdir -p &quot;$mod&quot; &quot;$outside&quot;<br>
++<br>
++# Outside-the-module file the daemon should NOT enumerate to clients.<br>
++# A distinctive name + non-trivial size makes the leak easy to spot.<br>
++echo &quot;OUTSIDE_PROTECTED_FILE_USED_AS_LEAK_DETECTOR&quot; &gt; &quot;=
$outside/leak_marker.txt&quot;<br>
++chmod 0644 &quot;$outside/leak_marker.txt&quot;<br>
++<br>
++# The symlink trap planted by the local attacker.<br>
++ln -s &quot;$outside&quot; &quot;$mod/cd&quot;<br>
++<br>
++my_uid=3D`get_testuid`<br>
++root_uid=3D`get_rootuid`<br>
++root_gid=3D`get_rootgid`<br>
++uid_setting=3D&quot;uid =3D $root_uid&quot;<br>
++gid_setting=3D&quot;gid =3D $root_gid&quot;<br>
++if test x&quot;$my_uid&quot; !=3D x&quot;$root_uid&quot;; then<br>
++&nbsp;&nbsp;&nbsp; uid_setting=3D&quot;#$uid_setting&quot;<br>
++&nbsp;&nbsp;&nbsp; gid_setting=3D&quot;#$gid_setting&quot;<br>
++fi<br>
++<br>
++cat &gt; &quot;$conf&quot; &lt;&lt;EOF<br>
++use chroot =3D no<br>
++$uid_setting<br>
++$gid_setting<br>
++log file =3D $scratchdir/rsyncd.log<br>
++[upload]<br>
++&nbsp;&nbsp;&nbsp; path =3D $mod<br>
++&nbsp;&nbsp;&nbsp; use chroot =3D no<br>
++&nbsp;&nbsp;&nbsp; read only =3D no<br>
++EOF<br>
++<br>
++# Pull recursively into the symlinked subdir with dry-run + verbose,<br>
++# capturing the daemon's flist (file list) on stdout. If the daemon<br>
++# enumerates /outside, leak_marker.txt will appear in the listing.<br>
++RSYNC_CONNECT_PROG=3D&quot;$RSYNC --config=3D$conf --daemon&quot; \<br>
++&nbsp;&nbsp;&nbsp; $RSYNC -nrv rsync://localhost/upload/cd/ &quot;$scratc=
hdir/dst/&quot; \<br>
++&nbsp;&nbsp;&nbsp; &gt; &quot;$listfile&quot; 2&gt;&amp;1 || true<br>
++<br>
++if grep -q &quot;leak_marker\.txt&quot; &quot;$listfile&quot;; then<br>
++&nbsp;&nbsp;&nbsp; echo &quot;----- leaked listing follows&quot; &gt;&amp=
;2<br>
++&nbsp;&nbsp;&nbsp; sed 's/^/&nbsp;&nbsp;&nbsp; /' &quot;$listfile&quot; &=
gt;&amp;2<br>
++&nbsp;&nbsp;&nbsp; echo &quot;----- leaked listing ends&quot; &gt;&amp;2<=
br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;sender flist leak: outside/leak_marker=
.txt was enumerated to the client (daemon's chdir followed the cd symlink d=
uring flist generation)&quot;<br>
++fi<br>
++<br>
++exit 0<br>
+diff --git a/util1.c b/util1.c<br>
+index d84bc414..6e457d4f 100644<br>
+--- a/util1.c<br>
++++ b/util1.c<br>
+@@ -1112,6 +1112,7 @@ char *sanitize_path(char *dest, const char *p, const=
 char *rootdir, int depth, i<br>
+&nbsp; * Also cleans the path using the clean_fname() function. */<br>
+ int change_dir(const char *dir, int set_path_only)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static int initialised, skipped=
_chdir;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int len;<br>
+ <br>
+@@ -1150,10 +1151,57 @@ int change_dir(const char *dir, int set_path_only)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curr_dir[c=
urr_dir_len++] =3D '/';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; memcpy(curr_dir + curr_dir_len, dir, len + 1);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!set_path_only &amp;&amp; chdir(curr_dir)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curr_dir_len =3D save=
_dir_len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curr_dir[curr_dir_len=
] =3D '\0';<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!set_path_only) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int chdir_failed;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* In the daemon-with=
out-chroot deployment we must not<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * follow a syml=
ink in any component of the chdir<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * target -- oth=
erwise CWD escapes the module and<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * every subsequ=
ent path-relative syscall (open,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * chmod, lchown=
, ...) inherits the escape, which<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * defeats secur=
e_relative_open's RESOLVE_BENEATH<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * anchor and re=
-opens the CVE-2026-29518 class of<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * symlink TOCTO=
U attacks. Use the secure resolver<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to get a conf=
ined dirfd, then fchdir() to it.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If skipped_ch=
dir is set, a previous CD_SKIP_CHDIR<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * call buffered=
 an absolute prefix in curr_dir<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (e.g. change_=
pathname's CD_SKIP_CHDIR to orig_dir)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * without synci=
ng the kernel's CWD. Resolve `dir`<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * relative to t=
hat prefix as basedir so the secure<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * branch still =
anchors at the operator-trusted<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * directory rat=
her than wherever the kernel CWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * happens to be=
. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_daemon &amp;&a=
mp; !am_chrooted) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; const char *basedir =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; char prefix[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; int dfd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (skipped_chdir) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (save_dir_len &gt;=3D sizeof prefix) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chdir_failed =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto chdir_cleanup;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
}<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
memcpy(prefix, curr_dir, save_dir_len);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
prefix[save_dir_len] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
basedir =3D prefix;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(basedir, dir,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
chdir_failed =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
chdir_failed =3D fchdir(dfd) !=3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; chdir_failed =3D chdir(curr_dir) !=3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; chdir_cleanup:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (chdir_failed) {<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; curr_dir_len =3D save_dir_len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; curr_dir[curr_dir_len] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; skipped_chdir =3D set_path_only;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch<br>
new file mode 100644<br>
index 0000000000..fac413f3ea<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch<br>
@@ -0,0 +1,1783 @@<br>
+From a55d00c0f37fd811b0fddc1eaeb7f420215b1e05 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Tue, 5 May 2026 15:02:48 +1000<br>
+Subject: [PATCH] syscall: add symlink-race-safe do_*_at() wrappers and har=
den<br>
+ secure_relative_open<br>
+<br>
+Add the rest of the path-based syscall wrappers and migrate every<br>
+receiver-side caller:<br>
+&nbsp; - do_lchown_at, do_rename_at, do_mkdir_at, do_symlink_at,<br>
+&nbsp;&nbsp;&nbsp; do_mknod_at, do_link_at, do_unlink_at, do_rmdir_at,<br>
+&nbsp;&nbsp;&nbsp; do_utimensat_at, do_stat_at, do_lstat_at<br>
+<br>
+Same shape as do_chmod_at: open each parent under<br>
+secure_relative_open(), call the *at() variant against the dirfd,<br>
+fall through to the bare path-based syscall in non-daemon /<br>
+chrooted / absolute-path / no-parent cases. macOS's<br>
+setattrlist-based set_times tier is also routed through the<br>
+utimensat_at path on daemon-no-chroot.<br>
+<br>
+Hardenings to secure_relative_open() itself:<br>
+&nbsp; - confine basedir resolution under the same kernel mechanism<br>
+&nbsp;&nbsp;&nbsp; used for relpath (basedirs from --copy-dest / --link-de=
st are<br>
+&nbsp;&nbsp;&nbsp; sender-controllable in daemon mode)<br>
+&nbsp; - reject any '..' component (bare '..', 'foo/..', 'subdir/..')<br>
+&nbsp;&nbsp;&nbsp; so the per-component O_NOFOLLOW fallback can't escape<b=
r>
+&nbsp; - return the dirfd we built up from the per-component fallback<br>
+&nbsp;&nbsp;&nbsp; when the caller passed O_DIRECTORY (otherwise every do_=
*_at<br>
+&nbsp;&nbsp;&nbsp; failed with EINVAL on platforms without RESOLVE_BENEATH=
)<br>
+<br>
+Adds testsuite/alt-dest-symlink-race.test and<br>
+testsuite/secure-relpath-validation.test (with t_secure_relpath<br>
+helper) as regression coverage for the new hardenings.<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-43619<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/30656c5e358b1c6033f4caf24f3e11b29d25c9f4">https://github.com/Rsync=
Project/rsync/commit/30656c5e358b1c6033f4caf24f3e11b29d25c9f4</a>]<br>
+<br>
+Backport Changes:<br>
+- Upstream also updates runtests.py and a newer Makefile.in test<br>
+&nbsp; helper list that includes simdtest. Wrynose 3.4.1 does not carry<br=
>
+&nbsp; runtests.py and its CHECK_PROGS list has no simdtest entry, so<br>
+&nbsp; those test-runner hunks were not applicable.<br>
+<br>
+(cherry picked from commit 30656c5e358b1c6033f4caf24f3e11b29d25c9f4)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ Makefile.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +-<br>
+ backup.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 14 +-<br>
+ cleanup.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
+ delete.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
+ generator.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 22 +-<br>
+ hlink.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +=
-<br>
+ receiver.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +-<br>
+ rsync.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 +=
-<br>
+ syscall.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 841 +++++++++++++++++++++=
+-<br>
+ t_secure_relpath.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 151 ++++<br>
+ testsuite/alt-dest-symlink-race.test&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 96 +=
++<br>
+ testsuite/secure-relpath-validation.test |&nbsp; 34 +<br>
+ util1.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 20 +-<br>
+ xattrs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 9 +-<br>
+ 14 files changed, 1164 insertions(+), 51 deletions(-)<br>
+ create mode 100644 t_secure_relpath.c<br>
+ create mode 100755 testsuite/alt-dest-symlink-race.test<br>
+ create mode 100755 testsuite/secure-relpath-validation.test<br>
+<br>
+diff --git a/Makefile.in b/Makefile.in<br>
+index c30b8876..c0cc7a06 100644<br>
+--- a/Makefile.in<br>
++++ b/Makefile.in<br>
+@@ -63,12 +63,12 @@ TLS_OBJ =3D tls.o syscall.o util2.o t_stub.o lib/compa=
t.o lib/snprintf.o lib/perms<br>
+ # Programs we must have to run the test cases<br>
+ CHECK_PROGS =3D rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(=
EXEEXT) \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; testrun$(EXEEXT) trimslash$(EXE=
EXT) t_unsafe$(EXEEXT) t_chmod_secure$(EXEEXT) \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wildtest$(EXEEXT)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t_secure_relpath$(EXEEXT) wildtest$(EXEEXT=
)<br>
+ <br>
+ CHECK_SYMLINKS =3D testsuite/chown-fake.test testsuite/devices-fake.test =
testsuite/xattrs-hlink.test<br>
+ <br>
+ # Objects for CHECK_PROGS to clean<br>
+-CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
_chmod_secure.o trimslash.o wildtest.o<br>
++CHECK_OBJS=3Dtls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t=
_chmod_secure.o t_secure_relpath.o trimslash.o wildtest.o<br>
+ <br>
+ # note that the -I. is needed to handle config.h when using VPATH<br>
+ .c.o:<br>
+@@ -188,6 +188,10 @@ T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o uti=
l1.o util2.o t_stub.o lib/com<br>
+ t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $=
@ $(T_CHMOD_SECURE_OBJ) $(LIBS)<br>
+ <br>
++T_SECURE_RELPATH_OBJ =3D t_secure_relpath.o syscall.o util1.o util2.o t_s=
tub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o<br>
++t_secure_relpath$(EXEEXT): $(T_SECURE_RELPATH_OBJ)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_SECUR=
E_RELPATH_OBJ) $(LIBS)<br>
++<br>
+ .PHONY: conf<br>
+ conf: configure.sh config.h.in<br>
+ <br>
+diff --git a/backup.c b/backup.c<br>
+index 686cb297..ae8cb49e 100644<br>
+--- a/backup.c<br>
++++ b/backup.c<br>
+@@ -39,7 +39,7 @@ static int validate_backup_dir(void)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STRUCT_STAT st;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_lstat(backup_dir_buf, &amp;st) &lt;=
 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_lstat_at(backup_dir_buf, &amp;st) &=
lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (errno =3D=3D ENOENT)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; rsyserr(FERROR, errno, &quot;backup lstat %s failed&quot;,=
 backup_dir_buf);<br>
+@@ -98,7 +98,7 @@ static BOOL copy_valid_path(const char *fname)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for ( ; b; name =3D b + 1, b =
=3D strchr(name, '/')) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; *b =3D '\0';<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; while (do_mkdir(backup_dir_buf, ACCESSPERMS) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; while (do_mkdir_at(backup_dir_buf, ACCESSPERMS) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (errno =
=3D=3D EEXIST) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D validate_backup_dir();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (val &gt; 0)<br>
+@@ -197,7 +197,7 @@ static inline int link_or_rename(const char *from, con=
st char *to,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (IS_SPECIAL(stp-&gt;st_mode) || IS_DEVICE(stp-&gt;st_mo=
de))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0; =
/* Use copy code. */<br>
+ #endif<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_link(from, to) =3D=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_link_at(from, to) =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (DEBUG_=
GTE(BACKUP, 1))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FINFO, &quot;make_backup: HLI=
NK %s successful.\n&quot;, from);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 2;<=
br>
+@@ -207,7 +207,7 @@ static inline int link_or_rename(const char *from, con=
st char *to,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ #endif<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_rename(from, to) =3D=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_rename_at(from, to) =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (stp-&gt;st_nlink &gt; 1 &amp;&amp; !S_ISDIR(stp-&gt;st=
_mode)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If some=
one has hard-linked the file into the backup<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * di=
r, rename() might return success but do nothing! */<br>
+@@ -246,7 +246,7 @@ int make_backup(const char *fname, BOOL prefer_rename)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; goto success;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (errno =3D=3D EEXIST || errn=
o =3D=3D EISDIR) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; STRUCT_STAT bakst;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_lstat(buf, &amp;bakst) =3D=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_lstat_at(buf, &amp;bakst) =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int flags =
=3D get_del_for_flag(bakst.st_mode) | DEL_FOR_BACKUP | DEL_RECURSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (delete=
_item(buf, bakst.st_mode, flags) !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+@@ -277,7 +277,7 @@ int make_backup(const char *fname, BOOL prefer_rename)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Check to see if this is a de=
vice file, or link */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((am_root &amp;&amp; preserv=
e_devices &amp;&amp; IS_DEVICE(file-&gt;mode))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || (preserve_specials &am=
p;&amp; IS_SPECIAL(file-&gt;mode))) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_mknod(buf, file-&gt;mode, sx.st.st_rdev) &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_mknod_at(buf, file-&gt;mode, sx.st.st_rdev) &lt; 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR, errno, &quot;mknod %s failed&quot;, full_fname(buf));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else if (DEBUG_GTE(BACKUP, 1))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FI=
NFO, &quot;make_backup: DEVICE %s successful.\n&quot;, fname);<br>
+@@ -294,7 +294,7 @@ int make_backup(const char *fname, BOOL prefer_rename)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D 2;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_symlink(sl, bu=
f) &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_symlink_at(sl,=
 buf) &lt; 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FERROR, errno, &quot;link %s =
-&gt; \&quot;%s\&quot;&quot;, full_fname(buf), sl);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (D=
EBUG_GTE(BACKUP, 1))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FINFO, &quot;make_backup: SYM=
LINK %s successful.\n&quot;, fname);<br>
+diff --git a/cleanup.c b/cleanup.c<br>
+index 40d26baa..0493fbbb 100644<br>
+--- a/cleanup.c<br>
++++ b/cleanup.c<br>
+@@ -198,7 +198,7 @@ NORETURN void _exit_cleanup(int code, const char *file=
, int line)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; switch_step++;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (cleanup_fname)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink(cleanup_fna=
me);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink_at(cleanup_=
fname);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (exit_code)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kill_all(S=
IGUSR1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (cleanup_pid &amp;&amp; cleanup_pid =3D=3D getpid()) {<=
br>
+diff --git a/delete.c b/delete.c<br>
+index ded0ab2a..4a52122d 100644<br>
+--- a/delete.c<br>
++++ b/delete.c<br>
+@@ -160,7 +160,7 @@ enum delret delete_item(char *fbuf, uint16 mode, uint1=
6 flags)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISDIR(mode)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; what =3D &quot;rmdir&quot;;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ok =3D do_rmdir(fbuf) =3D=3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ok =3D do_rmdir_at(fbuf) =3D=3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (make_backups &gt; 0 &amp;&amp; !(flags &amp; DEL_FOR_B=
ACKUP) &amp;&amp; (backup_dir || !is_backup_file(fbuf))) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; what =3D &=
quot;make_backup&quot;;<br>
+diff --git a/generator.c b/generator.c<br>
+index e5aff654..e5b2d176 100644<br>
+--- a/generator.c<br>
++++ b/generator.c<br>
+@@ -984,7 +984,7 @@ static int try_dests_reg(struct file_struct *file, cha=
r *fname, int ndx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (find_exact_for_existing) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (alt_de=
st_type =3D=3D LINK_DEST &amp;&amp; real_st.st_dev =3D=3D sxp-&gt;st.st_dev=
 &amp;&amp; real_st.st_ino =3D=3D sxp-&gt;st.st_ino)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_unlink(fname) =
&lt; 0 &amp;&amp; errno !=3D ENOENT)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_unlink_at(fnam=
e) &lt; 0 &amp;&amp; errno !=3D ENOENT)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto got_nothing_for_ya;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+ #ifdef SUPPORT_HARD_LINKS<br>
+@@ -1112,7 +1112,7 @@ static int try_dests_non(struct file_struct *file, c=
har *fname, int ndx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !IS_SPECIAL(file-&gt;mode) &amp;&amp; !IS=
_DEVICE(file-&gt;mode)<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !S_ISDIR(file-&gt;mode)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_link(cmpbuf, f=
name) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_link_at(cmpbuf=
, fname) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FERROR_XFER, errno,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;failed to hard-link %s with %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; cmpbuf, fname);<br>
+@@ -1315,7 +1315,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (relati=
ve_paths &amp;&amp; !implied_dirs &amp;&amp; file-&gt;mode !=3D 0<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; do_s=
tat(dn, &amp;sx.st) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; do_s=
tat_at(dn, &amp;sx.st) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto parent_is_dry_missing;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (make_path(fname, MKP_DROP_NAME | =
MKP_SKIP_SLASH) &lt; 0) {<br>
+@@ -1427,7 +1427,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp=
;&amp; (stype =3D=3D FT_DIR<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; || delete_item(fname, sx.st.st_mode, del_opts | DEL_FOR_DIR) !=3D 0))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup; /* Any errors get repor=
ted later. */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_mkdir(fname, (=
file-&gt;mode|added_perms) &amp; 0700) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_mkdir_at(fname=
, (file-&gt;mode|added_perms) &amp; 0700) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file-&gt;flags |=3D FLAG_DIR_CREATED;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto clean=
up;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+@@ -1469,10 +1469,10 @@ static void recv_generator(char *fname, struct fil=
e_struct *file, int ndx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; itemize(fn=
amecmp, file, ndx, statret, &amp;sx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; statret ? ITEM_LOCAL_CHANGE : 0, 0, N=
ULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (real_ret !=3D 0 &amp;&amp; do_mkdir(fname,file-&gt;mode|added_per=
ms) &lt; 0 &amp;&amp; errno !=3D EEXIST) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (real_ret !=3D 0 &amp;&amp; do_mkdir_at(fname,file-&gt;mode|added_=
perms) &lt; 0 &amp;&amp; errno !=3D EEXIST) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!relat=
ive_paths || errno !=3D ENOENT<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || m=
ake_path(fname, MKP_DROP_NAME | MKP_SKIP_SLASH) &lt; 0<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || (do_mkdir(fn=
ame, file-&gt;mode|added_perms) &lt; 0 &amp;&amp; errno !=3D EEXIST)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || (do_mkdir_at=
(fname, file-&gt;mode|added_perms) &lt; 0 &amp;&amp; errno !=3D EEXIST)) {<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FERROR_XFER, errno,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;recv_generator: mkdir %s failed&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; full_fname(fname));<br>
+@@ -1808,7 +1808,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; ;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (quick_check_ok(FT_REG,=
 fnamecmp, file, &amp;sx.st)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (partialptr) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink(partialptr)=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink_at(partialp=
tr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle_par=
tial_dir(partialptr, PDIR_DELETE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; set_file_attrs(fname, file, &amp;sx, NULL, maybe_ATTRS_REP=
ORT | maybe_ATTRS_ACCURATE_TIME);<br>
+@@ -2016,7 +2016,7 @@ int atomic_create(struct file_struct *file, char *fn=
ame, const char *slnk, const<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (slnk) {<br>
+ #ifdef SUPPORT_LINKS<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_symlink(slnk, create_name) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_symlink_at(slnk, create_name) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR_XFER, errno, &quot;symlink %s -&gt; \&quot;%s\&quot; failed&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_fname(create_name), slnk);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+@@ -2032,7 +2032,7 @@ int atomic_create(struct file_struct *file, char *fn=
ame, const char *slnk, const<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return 0;<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_mknod(create_name, file-&gt;mode, rdev) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_mknod_at(create_name, file-&gt;mode, rdev) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR_XFER, errno, &quot;mknod %s failed&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_fname(create_name));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+@@ -2040,14 +2040,14 @@ int atomic_create(struct file_struct *file, char *=
fname, const char *slnk, const<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!skip_atomic) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_rename(tmpname, fname) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_rename_at(tmpname, fname) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *full=
_tmpname =3D strdup(full_fname(tmpname));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (full_t=
mpname =3D=3D NULL)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out_of_memory(&quot;atomic_create&quo=
t;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR_XFER, errno, &quot;rename %s -&gt; \&quot;%s\&quot; failed&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_tmpname, full_fname(fname));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(full_=
tmpname);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink(tmpname);<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink_at(tmpname)=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/hlink.c b/hlink.c<br>
+index 2c14407a..eb36730f 100644<br>
+--- a/hlink.c<br>
++++ b/hlink.c<br>
+@@ -454,7 +454,7 @@ int hard_link_check(struct file_struct *file, int ndx,=
 char *fname,<br>
+ int hard_link_one(struct file_struct *file, const char *fname,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *oldname, int terse)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_link(oldname, fname) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_link_at(oldname, fname) &lt; 0) {<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; enum logcode code;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (terse) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!INFO_=
GTE(NAME, 1))<br>
+diff --git a/receiver.c b/receiver.c<br>
+index 5a2c8c5a..8cf8366b 100644<br>
+--- a/receiver.c<br>
++++ b/receiver.c<br>
+@@ -442,7 +442,7 @@ static void handle_delayed_updates(char *local_name)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We don'=
t use robust_rename() here because the<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * pa=
rtial-dir must be on the same drive. */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_rename(partial=
ptr, fname) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_rename_at(part=
ialptr, fname) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FERROR_XFER, errno,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;rename failed for %s (from %s)&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; full_fname(fname), partialptr);<br>
+@@ -926,7 +926,7 @@ int recv_files(int f_in, int f_out, char *local_name)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recv_ok =3D -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (f=
namecmp =3D=3D partialptr) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!one_inplace)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
do_unlink(partialptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
do_unlink_at(partialptr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle_partial_dir(partialptr, PDIR_D=
ELETE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; } else if (keep_partial &amp;&amp; partialptr &amp;&amp; (=
!one_inplace || delay_updates)) {<br>
+@@ -935,7 +935,7 @@ int recv_files(int f_in, int f_out, char *local_name)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;Unable to create partial-dir for %s -- discarding %s.\n&qu=
ot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; local_name ? local_name : f_name(file, NULL),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; recv_ok ? &quot;completed file&quot; : &quot;partial file&quot;)=
;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink(fnametmp);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink_at(fnametmp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recv_ok =3D -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if =
(!finish_transfer(partialptr, fnametmp, fnamecmp, NULL,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; file, recv_ok, !partial_dir))<br>
+@@ -946,7 +946,7 @@ int recv_files(int f_in, int f_out, char *local_name)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; partialptr =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; } else if (!one_inplace)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink(fnametmp);<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink_at(fnametmp=
);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cleanup_disable();<br>
+ <br>
+diff --git a/rsync.c b/rsync.c<br>
+index cc46a2f9..1d2ae82a 100644<br>
+--- a/rsync.c<br>
++++ b/rsync.c<br>
+@@ -547,7 +547,7 @@ int set_file_attrs(const char *fname, struct file_stru=
ct *file, stat_x *sxp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (am_root &gt;=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uid_t uid =
=3D change_uid ? (uid_t)F_OWNER(file) : sxp-&gt;st.st_uid;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gid_t gid =
=3D change_gid ? (gid_t)F_GROUP(file) : sxp-&gt;st.st_gid;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_lchown(fname, =
uid, gid) !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_lchown_at(fnam=
e, uid, gid) !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We shouldn't have attempted to cha=
nge uid<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * or gid unless have the privil=
ege. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FERROR_XFER, errno, &quot;%s =
%s failed&quot;,<br>
+@@ -758,7 +758,7 @@ int finish_transfer(const char *fname, const char *fna=
metmp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_fname=
(fnametmp), fname);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (!partialptr || (ret =3D=3D -2 &amp;&amp; temp_copy_nam=
e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; || robust_rename(fnametmp, partialptr, NULL, file-&g=
t;mode) &lt; 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink(fnametmp);<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink_at(fnametmp=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D 0) {<br>
+@@ -774,7 +774,7 @@ int finish_transfer(const char *fname, const char *fna=
metmp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok_to_set_time ?=
 ATTRS_ACCURATE_TIME : ATTRS_SKIP_MTIME | ATTRS_SKIP_ATIME | ATTRS_SKIP_CRT=
IME);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (temp_copy_name) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_rename(fnametmp, fname) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_rename_at(fnametmp, fname) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR_XFER, errno, &quot;rename %s -&gt; \&quot;%s\&quot;&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_fname(fnametmp), fname);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+diff --git a/syscall.c b/syscall.c<br>
+index 06d5ed3f..ffd8df20 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -93,6 +93,63 @@ int do_unlink(const char *path)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return unlink(path);<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_unlink() for receiver-side use. Se=
e<br>
++&nbsp; the comment on do_chmod_at() for the threat model. unlink() resolv=
es<br>
++&nbsp; parent components, so a parent-symlink swap can delete an outside<=
br>
++&nbsp; file under the daemon's authority. Defence: open the parent of pat=
h<br>
++&nbsp; under secure_relative_open() and use unlinkat() (flags=3D0) agains=
t<br>
++&nbsp; that dirfd.<br>
++<br>
++&nbsp; Falls through to do_unlink() for the same dry-run / non-daemon /<b=
r>
++&nbsp; chrooted / no-parent / absolute-path cases as the other wrappers.<=
br>
++*/<br>
++int do_unlink_at(const char *path)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return unlink(path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!path || !*path || *path =3D=3D '/')<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return unlink(path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return unlink(path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, path, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D unlinkat(dfd, bname, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_unlink(path);<br>
++#endif<br>
++}<br>
++<br>
+ #ifdef SUPPORT_LINKS<br>
+ int do_symlink(const char *lnk, const char *path)<br>
+ {<br>
+@@ -117,6 +174,70 @@ int do_symlink(const char *lnk, const char *path)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return symlink(lnk, path);<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_symlink() for receiver-side use. S=
ee<br>
++&nbsp; the comment on do_chmod_at() for the threat model. Only the parent=
<br>
++&nbsp; directory of `path` needs protection -- symlinkat() does not resol=
ve<br>
++&nbsp; the final component (it creates it). Defence: open parent of `path=
`<br>
++&nbsp; under secure_relative_open() and call symlinkat() against that<br>
++&nbsp; dirfd. The link target string `lnk` is stored verbatim and not<br>
++&nbsp; resolved at creation time, so it doesn't need scrutiny here.<br>
++<br>
++&nbsp; Falls through to do_symlink() for the --fake-super (am_root &lt; 0=
)<br>
++&nbsp; path -- that code path opens `path` with do_open() which has its<b=
r>
++&nbsp; own (separate) symlink-race exposure tracked elsewhere.<br>
++*/<br>
++int do_symlink_at(const char *lnk, const char *path)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_symlink(lnk, path);<br>
++<br>
++#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_root &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_symlink(lnk, path);<br>
++#endif<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!path || !*path || *path =3D=3D '/')<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_symlink(lnk, path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_symlink(lnk, path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, path, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D symlinkat(lnk, dfd, bname);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_symlink(lnk, path);<br>
++#endif<br>
++}<br>
++<br>
+ #if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS<br>
+ ssize_t do_readlink(const char *path, char *buf, size_t bufsiz)<br>
+ {<br>
+@@ -153,6 +274,106 @@ int do_link(const char *old_path, const char *new_pa=
th)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return link(old_path, new_path)=
;<br>
+ #endif<br>
+ }<br>
++<br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_link() for receiver-side use. See<=
br>
++&nbsp; the comment on do_chmod_at() for the threat model. link() resolves=
<br>
++&nbsp; parent components of *both* old_path and new_path, so a parent-<br=
>
++&nbsp; symlink swap on either side can plant the new hard link outside<br=
>
++&nbsp; the module, or hard-link an outside file into the module (read<br>
++&nbsp; disclosure).<br>
++<br>
++&nbsp; Defence: open each parent under secure_relative_open() and use<br>
++&nbsp; linkat() between the two dirfds, reusing one when the parents<br>
++&nbsp; match. flags=3D0 matches the existing do_link() (don't follow a<br=
>
++&nbsp; symbolic-link old_path). Only available on systems with linkat();<=
br>
++&nbsp; pre-AT_FDCWD systems fall through to do_link().<br>
++*/<br>
++int do_link_at(const char *old_path, const char *new_path)<br>
++{<br>
++#if defined AT_FDCWD &amp;&amp; defined HAVE_LINKAT<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char old_dirpath[MAXPATHLEN], new_dirpath[=
MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *old_bname, *new_bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *old_slash, *new_slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int old_dfd =3D AT_FDCWD, new_dfd =3D AT_F=
DCWD;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BOOL old_owns =3D False, new_owns =3D Fals=
e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t old_dlen =3D 0, new_dlen =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_link(old_path, new_path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!old_path || !*old_path || *old_path =
=3D=3D '/'<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || !new_path || !*new_path || *new_p=
ath =3D=3D '/')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_link(old_path, new_path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_slash =3D strrchr(old_path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_slash =3D strrchr(new_path, '/');<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Resolve each path's parent dir independ=
ently. A path without a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * slash lives in CWD (AT_FDCWD), no =
parent open required. A path<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * with a slash needs secure_relative=
_open to confine its parent<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * resolution -- otherwise a parent s=
ymlink (e.g. --link-dest=3Dcd<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * where cd -&gt; /outside) lets the =
kernel-level linkat(AT_FDCWD,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * &quot;cd/target.txt&quot;, ...) es=
cape the module. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old_slash) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; old_dlen =3D old_slash - old_path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (old_dlen &gt;=3D sizeof old_dirpath) { errno =3D ENAMETOOLONG; re=
turn -1; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memcpy(old_dirpath, old_path, old_dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; old_dirpath[old_dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; old_bname =3D old_slash + 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; old_dfd =3D secure_relative_open(NULL, old_dirpath, O_RDONLY | O_DIRE=
CTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (old_dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; old_owns =3D True;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; old_bname =3D old_path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_slash) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; new_dlen =3D new_slash - new_path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (new_dlen &gt;=3D sizeof new_dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D ENAMETOOLONG;<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old_owns) close(o=
ld_dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memcpy(new_dirpath, new_path, new_dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; new_dirpath[new_dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; new_bname =3D new_slash + 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (old_owns &amp;&amp; old_dlen =3D=3D new_dlen<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &amp;&amp; memcmp(old_dirpath, new_dirpath, old_dlen) =3D=3D 0)=
 {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_dfd =3D old_dfd;<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_dfd =3D secure_re=
lative_open(NULL, new_dirpath, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_dfd &lt; 0) {=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (old_owns) close(old_dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_owns =3D True;<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; new_bname =3D new_path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D linkat(old_dfd, old_bname, new_dfd=
, new_bname, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_owns)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(new_dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old_owns)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(old_dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_link(old_path, new_path);<br>
++#endif<br>
++}<br>
+ #endif<br>
+ <br>
+ int do_lchown(const char *path, uid_t owner, gid_t group)<br>
+@@ -165,6 +386,66 @@ int do_lchown(const char *path, uid_t owner, gid_t gr=
oup)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return lchown(path, owner, grou=
p);<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_lchown() for receiver-side use. Se=
e the<br>
++&nbsp; comment on do_chmod_at() for the threat model and design rationale=
.<br>
++<br>
++&nbsp; Resolves the parent directory under secure_relative_open() and inv=
okes<br>
++&nbsp; fchownat(..., AT_SYMLINK_NOFOLLOW) against that dirfd, so that an<=
br>
++&nbsp; attacker who substitutes a symlink into one of the parent componen=
ts<br>
++&nbsp; cannot redirect the chown outside the receiver's confinement. The<=
br>
++&nbsp; AT_SYMLINK_NOFOLLOW flag matches lchown()'s &quot;do not follow a =
final-<br>
++&nbsp; component symlink&quot; semantics.<br>
++<br>
++&nbsp; Falls through to do_lchown() in the dry-run / non-daemon / chroote=
d /<br>
++&nbsp; absolute-path / no-parent cases, identical to do_chmod_at().<br>
++*/<br>
++int do_lchown_at(const char *fname, uid_t owner, gid_t group)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_lchown(fname, owner, group);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!fname || !*fname || *fname =3D=3D '/'=
)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_lchown(fname, owner, group);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(fname, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_lchown(fname, owner, group);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - fname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, fname, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D fchownat(dfd, bname, owner, group,=
 AT_SYMLINK_NOFOLLOW);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_lchown(fname, owner, group);<br>
++#endif<br>
++}<br>
++<br>
+ int do_mknod(const char *pathname, mode_t mode, dev_t dev)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
+@@ -215,6 +496,76 @@ int do_mknod(const char *pathname, mode_t mode, dev_t=
 dev)<br>
+ #endif<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_mknod() for receiver-side use. See=
<br>
++&nbsp; the comment on do_chmod_at() for the threat model. Defence: open<b=
r>
++&nbsp; the parent of pathname under secure_relative_open() and use<br>
++&nbsp; mknodat() against that dirfd. mknodat() covers both regular-file<b=
r>
++&nbsp; (S_IFREG with dev=3D0) and FIFO (S_IFIFO) and device-node creation=
.<br>
++<br>
++&nbsp; Falls through to do_mknod() for fake-super (am_root &lt; 0) and fo=
r<br>
++&nbsp; sockets, both of which use auxiliary path-based syscalls that<br>
++&nbsp; don't have an *at() variant in any portable form.<br>
++*/<br>
++int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_mknod(pathname, mode, dev);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_root &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_mknod(pathname, mode, dev);<br>
++<br>
++#if !defined MKNOD_CREATES_SOCKETS &amp;&amp; defined HAVE_SYS_UN_H<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISSOCK(mode))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_mknod(pathname, mode, dev);<br>
++#endif<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pathname || !*pathname || *pathname =
=3D=3D '/')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_mknod(pathname, mode, dev);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(pathname, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_mknod(pathname, mode, dev);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - pathname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, pathname, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++#if !defined MKNOD_CREATES_FIFOS &amp;&amp; defined HAVE_MKFIFO<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISFIFO(mode))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D mkfifoat(dfd, bname, mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++#endif<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D mknodat(dfd, bname, mode, dev);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_mknod(pathname, mode, dev);<br>
++#endif<br>
++}<br>
++<br>
+ int do_rmdir(const char *pathname)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
+@@ -222,6 +573,57 @@ int do_rmdir(const char *pathname)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rmdir(pathname);<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_rmdir(). See do_unlink_at() above;=
<br>
++&nbsp; same shape but with AT_REMOVEDIR set to require the target be a<br=
>
++&nbsp; directory.<br>
++*/<br>
++int do_rmdir_at(const char *pathname)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return rmdir(pathname);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pathname || !*pathname || *pathname =
=3D=3D '/')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return rmdir(pathname);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(pathname, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return rmdir(pathname);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - pathname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, pathname, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D unlinkat(dfd, bname, AT_REMOVEDIR)=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_rmdir(pathname);<br>
++#endif<br>
++}<br>
++<br>
+ int do_open(const char *pathname, int flags, mode_t mode)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags !=3D O_RDONLY) {<br>
+@@ -370,6 +772,89 @@ int do_rename(const char *old_path, const char *new_p=
ath)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rename(old_path, new_pat=
h);<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_rename() for receiver-side use. Se=
e<br>
++&nbsp; the comment on do_chmod_at() for the threat model and design ratio=
nale.<br>
++<br>
++&nbsp; rename() is the central tmp -&gt; final operation in rsync; if eit=
her the<br>
++&nbsp; source or the destination has an attacker-substituted symlink in o=
ne<br>
++&nbsp; of its parent components, the rename can publish or vanish files<b=
r>
++&nbsp; outside the module. Defence: open the parent of *each* path under<=
br>
++&nbsp; secure_relative_open() and use renameat() against the resulting<br=
>
++&nbsp; dirfds. When old_path and new_path share the same parent (the comm=
on<br>
++&nbsp; case -- tmp file living next to its final name), we reuse the same=
<br>
++&nbsp; dirfd for both sides.<br>
++<br>
++&nbsp; Falls through to do_rename() in dry-run, non-daemon, chrooted, no-=
<br>
++&nbsp; parent and absolute-path cases, identical to the other do_*_at()<b=
r>
++&nbsp; wrappers.<br>
++*/<br>
++int do_rename_at(const char *old_path, const char *new_path)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char old_dirpath[MAXPATHLEN], new_dirpath[=
MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *old_bname, *new_bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *old_slash, *new_slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int old_dfd =3D -1, new_dfd =3D -1, ret =
=3D -1, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t old_dlen, new_dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_rename(old_path, new_path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!old_path || !*old_path || *old_path =
=3D=3D '/'<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || !new_path || !*new_path || *new_p=
ath =3D=3D '/')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_rename(old_path, new_path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_slash =3D strrchr(old_path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_slash =3D strrchr(new_path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!old_slash || !new_slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_rename(old_path, new_path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_dlen =3D old_slash - old_path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_dlen =3D new_slash - new_path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old_dlen &gt;=3D sizeof old_dirpath ||=
 new_dlen &gt;=3D sizeof new_dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(old_dirpath, old_path, old_dlen);<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_dirpath[old_dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(new_dirpath, new_path, new_dlen);<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_dirpath[new_dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_bname =3D old_slash + 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_bname =3D new_slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_dfd =3D secure_relative_open(NULL, old=
_dirpath, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old_dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old_dlen =3D=3D new_dlen &amp;&amp; me=
mcmp(old_dirpath, new_dirpath, old_dlen) =3D=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; new_dfd =3D old_dfd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; new_dfd =3D secure_relative_open(NULL, new_dirpath, O_RDONLY | O_DIRE=
CTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (new_dfd &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(old_dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D renameat(old_dfd, old_bname, new_d=
fd, new_bname);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_dfd !=3D old_dfd)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(new_dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(old_dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_rename(old_path, new_path);<br>
++#endif<br>
++}<br>
++<br>
+ #ifdef HAVE_FTRUNCATE<br>
+ int do_ftruncate(int fd, OFF_T size)<br>
+ {<br>
+@@ -412,6 +897,66 @@ int do_mkdir(char *path, mode_t mode)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return mkdir(path, mode);<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_mkdir() for receiver-side use. See=
<br>
++&nbsp; the comment on do_chmod_at() for the threat model and design ratio=
nale.<br>
++<br>
++&nbsp; mkdir() resolves parent symlinks at every component, so a parent-<=
br>
++&nbsp; component swap can place an attacker-named directory outside the<b=
r>
++&nbsp; module. Defence: open the parent of fname under secure_relative_op=
en()<br>
++&nbsp; and call mkdirat() against that dirfd.<br>
++<br>
++&nbsp; Mutates path in place to trim trailing slashes (matches do_mkdir()=
).<br>
++&nbsp; Falls through to do_mkdir() in dry-run, non-daemon, chrooted, no-<=
br>
++&nbsp; parent and absolute-path cases.<br>
++*/<br>
++int do_mkdir_at(char *path, mode_t mode)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trim_trailing_slashes(path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return mkdir(path, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!path || !*path || *path =3D=3D '/')<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return mkdir(path, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return mkdir(path, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, path, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D mkdirat(dfd, bname, mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_mkdir(path, mode);<br>
++#endif<br>
++}<br>
++<br>
+ /* like mkstemp but forces permissions */<br>
+ int do_mkstemp(char *template, mode_t perms)<br>
+ {<br>
+@@ -465,6 +1010,76 @@ int do_lstat(const char *path, STRUCT_STAT *st)<br>
+ #endif<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variants of do_stat() / do_lstat() for receiver-=
<br>
++&nbsp; side use. See the comment on do_chmod_at() for the threat model.<b=
r>
++&nbsp; stat() and lstat() resolve parent components, so a parent-symlink<=
br>
++&nbsp; swap can make the receiver's stat see attributes of a victim file<=
br>
++&nbsp; outside the module -- which then drives later behaviour (e.g.<br>
++&nbsp; &quot;this isn't a directory, delete it&quot; -&gt; attacker-contr=
olled unlink<br>
++&nbsp; on something outside the module).<br>
++<br>
++&nbsp; Defence: open the parent under secure_relative_open() and use<br>
++&nbsp; fstatat() with AT_SYMLINK_NOFOLLOW (lstat) or 0 (stat) against<br>
++&nbsp; that dirfd. Same fall-through gating as the other wrappers.<br>
++*/<br>
++static int do_xstat_at(const char *path, STRUCT_STAT *st, int at_flags, i=
nt (*fallback)(const char *, STRUCT_STAT *))<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return fallback(path, st);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!path || !*path || *path =3D=3D '/')<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return fallback(path, st);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return fallback(path, st);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, path, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D fstatat(dfd, bname, st, at_flags);=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return fallback(path, st);<br>
++#endif<br>
++}<br>
++<br>
++int do_stat_at(const char *path, STRUCT_STAT *st)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_xstat_at(path, st, 0, do_stat);<=
br>
++}<br>
++<br>
++int do_lstat_at(const char *path, STRUCT_STAT *st)<br>
++{<br>
++#ifdef SUPPORT_LINKS<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_xstat_at(path, st, AT_SYMLINK_NO=
FOLLOW, do_lstat);<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_xstat_at(path, st, 0, do_stat);<=
br>
++#endif<br>
++}<br>
++<br>
+ int do_fstat(int fd, STRUCT_STAT *st)<br>
+ {<br>
+ #ifdef USE_STAT64_FUNCS<br>
+@@ -486,12 +1101,26 @@ OFF_T do_lseek(int fd, OFF_T offset, int whence)<br=
>
+ #ifdef HAVE_SETATTRLIST<br>
+ int do_setattrlist_times(const char *path, STRUCT_STAT *stp)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct attrlist attrList;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct timespec ts[2];<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* setattrlist() takes a raw path and foll=
ows parent symlinks<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (FSOPT_NOFOLLOW only blocks the fi=
nal component). On a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * daemon-no-chroot deployment, retur=
n ENOSYS so set_times()'<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * tier walk falls through to do_utim=
ensat_at(), which routes<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the timestamp update through a sec=
ure parent dirfd. The<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * macOS-specific attribute set this =
function would have used<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (ATTR_CMN_MODTIME / ATTR_CMN_ACCTI=
ME) is the same set<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * utimensat() handles, so no functio=
nality is lost. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_daemon &amp;&amp; !am_chrooted) {<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENOSYS;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Yes, this is in the opposite=
 order of utime and similar. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ts[0].tv_sec =3D stp-&gt;st_mti=
me;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ts[0].tv_nsec =3D stp-&gt;ST_MT=
IME_NSEC;<br>
+@@ -508,12 +1137,25 @@ int do_setattrlist_times(const char *path, STRUCT_S=
TAT *stp)<br>
+ #ifdef SUPPORT_CRTIMES<br>
+ int do_setattrlist_crtime(const char *path, time_t crtime)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct attrlist attrList;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct timespec ts;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Same path-follows-parent-symlinks conce=
rn as<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * do_setattrlist_times. There is no =
portable at-aware variant<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * of setattrlist that targets ATTR_C=
MN_CRTIME, so on a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * daemon-no-chroot deployment we ret=
urn -1 and accept that<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * crtime preservation is silently dr=
opped for that file (the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * caller treats this as &quot;crtime=
 not updated&quot;). The transfer<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * itself continues normally. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_daemon &amp;&amp; !am_chrooted) {<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENOSYS;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ts.tv_sec =3D crtime;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ts.tv_nsec =3D 0;<br>
+ <br>
+@@ -529,10 +1171,19 @@ int do_setattrlist_crtime(const char *path, time_t =
crtime)<br>
+ time_t get_create_time(const char *path, STRUCT_STAT *stp)<br>
+ {<br>
+ #ifdef HAVE_GETATTRLIST<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static struct create_time attrB=
uf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct attrlist attrList;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void)stp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* getattrlist() is also path-based and fo=
llows parent<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * symlinks. In daemon-no-chroot, ref=
use rather than read the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * crtime of a file the parent-symlin=
k chain might point at<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * outside the module. The caller's &=
quot;no crtime available&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * path returns 0; the file gets a fr=
esh crtime instead of<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * preserving the source's. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_daemon &amp;&amp; !am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;attrList, 0, sizeof=
 attrList);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attrList.bitmapcount =3D ATTR_B=
IT_MAP_COUNT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attrList.commonattr =3D ATTR_CM=
N_CRTIME;<br>
+@@ -598,6 +1249,81 @@ int do_utimensat(const char *path, STRUCT_STAT *stp)=
<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return utimensat(AT_FDCWD, path=
, t, AT_SYMLINK_NOFOLLOW);<br>
+ }<br>
++<br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_utimensat() for receiver-side use.=
<br>
++&nbsp; See the comment on do_chmod_at() for the threat model. utimes()<br=
>
++&nbsp; resolves parent components and follows a final-component symlink;<=
br>
++&nbsp; lutimes() doesn't follow the final component but still resolves<br=
>
++&nbsp; parents. Either way, a parent-symlink swap can redirect the<br>
++&nbsp; timestamp update outside the module. Defence: open the parent of<b=
r>
++&nbsp; path under secure_relative_open() and call utimensat() with<br>
++&nbsp; AT_SYMLINK_NOFOLLOW against that dirfd.<br>
++<br>
++&nbsp; Falls through to do_utimensat() in the same dry-run / non-daemon /=
<br>
++&nbsp; chrooted / no-parent / absolute-path cases as the other wrappers.<=
br>
++&nbsp; Returns -1 with errno=3DENOSYS on systems without utimensat()<br>
++&nbsp; (caller is expected to fall back to the legacy tier walk).<br>
++*/<br>
++int do_utimensat_at(const char *path, STRUCT_STAT *stp)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct timespec t[2];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dry_run) return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_utimensat(path, stp);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!path || !*path || *path =3D=3D '/')<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_utimensat(path, stp);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(path, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_utimensat(path, stp);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, path, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t[0].tv_sec =3D stp-&gt;st_atime;<br>
++#ifdef ST_ATIME_NSEC<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t[0].tv_nsec =3D stp-&gt;ST_ATIME_NSEC;<br=
>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t[0].tv_nsec =3D 0;<br>
++#endif<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t[1].tv_sec =3D stp-&gt;st_mtime;<br>
++#ifdef ST_MTIME_NSEC<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t[1].tv_nsec =3D stp-&gt;ST_MTIME_NSEC;<br=
>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t[1].tv_nsec =3D 0;<br>
++#endif<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D utimensat(dfd, bname, t, AT_SYMLIN=
K_NOFOLLOW);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_utimensat(path, stp);<br>
++#endif<br>
++}<br>
+ #endif<br>
+ <br>
+ #ifdef HAVE_LUTIMES<br>
+@@ -820,6 +1546,30 @@ int do_open_nofollow(const char *pathname, int flags=
)<br>
+&nbsp;&nbsp; The relpath must also not contain any ../ elements in the pat=
h.<br>
+ */<br>
+ <br>
++/* Returns 1 if path has any &quot;/&quot;-separated component that is ex=
actly<br>
++ * &quot;..&quot;, 0 otherwise. Used by secure_relative_open's front-door=
<br>
++ * validation to reject inputs that the per-component walk fallback<br>
++ * would otherwise resolve through &quot;..&quot; -- e.g. bare &quot;..&q=
uot;, &quot;foo/..&quot;,<br>
++ * &quot;subdir/..&quot; -- which RESOLVE_BENEATH-equivalent kernels reje=
ct in<br>
++ * the kernel but the per-component fallback (NetBSD/OpenBSD/Solaris/<br>
++ * Cygwin/pre-5.6 Linux) does not. */<br>
++static int path_has_dotdot_component(const char *path)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *p =3D path;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (*p) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; const char *q;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (*p =3D=3D '/') { p++; continue; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; q =3D p;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; while (*q &amp;&amp; *q !=3D '/')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (q - p =3D=3D 2 &amp;&amp; p[0] =3D=3D '.' &amp;&amp; p[1] =3D=3D =
'.')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; p =3D q;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
++}<br>
++<br>
+ #ifdef __linux__<br>
+ static int secure_relative_open_linux(const char *basedir, const char *re=
lpath, int flags, mode_t mode)<br>
+ {<br>
+@@ -833,10 +1583,25 @@ static int secure_relative_open_linux(const char *b=
asedir, const char *relpath,<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (basedir =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dirfd =3D AT_FDCWD;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (basedir[0] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Absolute basedir: operator-trusted (module_dir and the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * like). Plain openat. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (dirfd =3D=3D -1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Relative basedir: may be wire-influenced via<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * --link-dest / --copy-dest / --compare-dest. Resolve it<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * under the same RESOLVE_BENEATH guarantee as relpath, so<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * a parent symlink on basedir cannot redirect the dirfd<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * outside the CWD anchor. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct open_how bhow;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memset(&amp;bhow, 0, sizeof bhow);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; bhow.flags =3D O_RDONLY | O_DIRECTORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; bhow.resolve =3D RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D syscall(SYS_openat2, AT_FDCWD, basedir, &amp;bhow, sizeof b=
how);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd =3D=3D -1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retfd =3D syscall(SYS_openat2, =
dirfd, relpath, &amp;how, sizeof how);<br>
+@@ -859,10 +1624,17 @@ static int secure_relative_open_resolve_beneath(con=
st char *basedir, const char<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (basedir =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dirfd =3D AT_FDCWD;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (basedir[0] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Absolute basedir: operator-trusted, plain openat. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (dirfd =3D=3D -1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Relative basedir: confine its resolution beneath CWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * (see secure_relative_open_linux for the rationale). */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY | O_RESOLV=
E_BENEATH);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd =3D=3D -1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retfd =3D openat(dirfd, relpath=
, flags | O_RESOLVE_BENEATH, mode);<br>
+@@ -880,8 +1652,20 @@ int secure_relative_open(const char *basedir, const =
char *relpath, int flags, mo<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; errno =3D EINVAL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncmp(relpath, &quot;../&quot;, 3) =
=3D=3D 0 || strstr(relpath, &quot;/../&quot;)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // no ../ elements allowed in the relpath<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Reject any path with a literal &quot;..=
&quot; component (bare &quot;..&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * &quot;../foo&quot;, &quot;foo/..&q=
uot;, &quot;foo/../bar&quot;, &quot;subdir/..&quot;). The previous<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * substring-based check caught only =
&quot;../&quot; prefix and &quot;/../&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * substring; bare &quot;..&quot; and=
 trailing &quot;/..&quot; escape on the per-<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * component walk fallback used by Ne=
tBSD/OpenBSD/Solaris/Cygwin<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and pre-5.6 Linux. RESOLVE_BENEATH=
 on Linux/FreeBSD/macOS<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * catches some of these in-kernel wi=
th EXDEV, but the front<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * door must reject them consistently=
 with EINVAL across all<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * platforms so callers can rely on t=
he validation. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (path_has_dotdot_component(relpath)) {<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D EINVAL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (basedir &amp;&amp; basedir[0] !=3D '/'=
 &amp;&amp; path_has_dotdot_component(basedir)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; errno =3D EINVAL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -911,15 +1695,47 @@ int secure_relative_open(const char *basedir, const=
 char *relpath, int flags, mo<br>
+ #else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dirfd =3D AT_FDCWD;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (basedir !=3D NULL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (basedir[0] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Absolute basedir: =
operator-trusted, plain openat. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirfd =3D openat(AT_F=
DCWD, basedir, O_RDONLY | O_DIRECTORY);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd =3D=3D -1) =
{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Relative basedir: =
walk it component-by-component<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * with O_NOFOLL=
OW. This is the per-component<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * RESOLVE_BENEA=
TH equivalent for platforms without<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * kernel-suppor=
ted confinement, and matches the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * relpath walk =
below. Symlinks in basedir are<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * rejected outr=
ight on this fallback path; the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Linux openat2=
 / O_RESOLVE_BENEATH paths above<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * still allow w=
ithin-tree symlinks. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *bcopy =3D my_st=
rdup(basedir, __FILE__, __LINE__);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!bcopy)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (const char *part=
 =3D strtok(bcopy, &quot;/&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; part !=3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; part =3D strtok(NULL, &quot;/&quot;))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; int next_fd =3D openat(dirfd, part, O_RDONLY | O=
_DIRECTORY | O_NOFOLLOW);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (next_fd =3D=3D -1) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
int save_errno =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (dirfd !=3D AT_FDCWD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
free(bcopy);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
errno =3D save_errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDCWD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; dirfd =3D next_fd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(bcopy);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int retfd =3D -1;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *path_copy =3D my_strdup(r=
elpath, __FILE__, __LINE__);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!path_copy) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd !=3D AT_FDCWD) close(dirfd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+@@ -945,8 +1761,15 @@ int secure_relative_open(const char *basedir, const =
char *relpath, int flags, mo<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dirfd =3D next_fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // the path must be a directory<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D EINVAL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* All components walked as directories. I=
f the caller asked for<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * O_DIRECTORY, return the dirfd we b=
uilt up; otherwise the path<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * resolved to a directory but the ca=
ller wanted a regular file. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((flags &amp; O_DIRECTORY) &amp;&amp; d=
irfd !=3D AT_FDCWD) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; retfd =3D dirfd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D AT_FDCWD;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto cleanup;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D EISDIR;<br>
+ <br>
+ cleanup:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(path_copy);<br>
+diff --git a/t_secure_relpath.c b/t_secure_relpath.c<br>
+new file mode 100644<br>
+index 00000000..a0fdf0d2<br>
+--- /dev/null<br>
++++ b/t_secure_relpath.c<br>
+@@ -0,0 +1,151 @@<br>
++/*<br>
++ * Test harness for secure_relative_open()'s front-door input<br>
++ * validation. Codex audit Finding 5 noted that the existing check<br>
++ *<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp; if (strncmp(relpath, &quot;../&quot;, 3) =3D=
=3D 0 || strstr(relpath, &quot;/../&quot;))<br>
++ *<br>
++ * catches &quot;../foo&quot; and &quot;foo/../bar&quot; but misses bare =
&quot;..&quot; (an actual<br>
++ * one-level escape on platforms that fall back to the per-component<br>
++ * walk), as well as &quot;a/..&quot;, &quot;foo/..&quot;, and any other =
form that<br>
++ * decomposes to a &quot;..&quot; component when split on &quot;/&quot;. =
The kernel-<br>
++ * enforced RESOLVE_BENEATH (Linux 5.6+) and O_RESOLVE_BENEATH<br>
++ * (FreeBSD 13+, macOS 15+) reject these in-kernel; the per-<br>
++ * component fallback used on NetBSD, OpenBSD, Solaris, Cygwin and<br>
++ * pre-5.6 Linux does not, so the validation must happen at the<br>
++ * front door.<br>
++ *<br>
++ * This helper invokes secure_relative_open() with each suspect<br>
++ * input and checks both the failure (rc &lt; 0) and the errno<br>
++ * (EINVAL means &quot;rejected at the front door&quot;). Pre-fix, the ke=
rnel<br>
++ * may reject with a different errno (EXDEV from RESOLVE_BENEATH);<br>
++ * post-fix, the front-door check catches every variant up front<br>
++ * with a consistent EINVAL across platforms.<br>
++ *<br>
++ * Not linked into rsync itself.<br>
++ */<br>
++<br>
++#include &quot;rsync.h&quot;<br>
++<br>
++#include &lt;sys/stat.h&gt;<br>
++<br>
++int dry_run =3D 0;<br>
++int am_root =3D 0;<br>
++int am_sender =3D 0;<br>
++int read_only =3D 0;<br>
++int list_only =3D 0;<br>
++int copy_links =3D 0;<br>
++int copy_unsafe_links =3D 0;<br>
++extern int am_daemon, am_chrooted;<br>
++<br>
++short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];<br>
++<br>
++static int errs =3D 0;<br>
++<br>
++static void check_relpath(const char *relpath)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int saved_errno;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D secure_relative_open(NULL, relpath,=
 O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; saved_errno =3D errno;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &gt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAIL [relpath=
=3D%-12s]: returned valid fd %d (escape) -- expected -1 EINVAL\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; relpath, fd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(fd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errs++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (saved_errno !=3D EINVAL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAIL [relpath=
=3D%-12s]: rejected but errno=3D%d (%s), expected EINVAL\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; relpath, saved_errno,=
 strerror(saved_errno));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errs++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;OK&nbsp;&nbsp; [relp=
ath=3D%-12s]: rejected with EINVAL\n&quot;, relpath);<br>
++}<br>
++<br>
++static void check_basedir(const char *basedir)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int saved_errno;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D secure_relative_open(basedir, &quot=
;ok&quot;, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; saved_errno =3D errno;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &gt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAIL [basedir=
=3D%-12s]: returned valid fd %d -- expected -1 EINVAL\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; basedir, fd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(fd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errs++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (saved_errno !=3D EINVAL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FAIL [basedir=
=3D%-12s]: rejected but errno=3D%d (%s), expected EINVAL\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; basedir, saved_errno,=
 strerror(saved_errno));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errs++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;OK&nbsp;&nbsp; [base=
dir=3D%-12s]: rejected with EINVAL\n&quot;, basedir);<br>
++}<br>
++<br>
++int main(int argc, char **argv)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (argc !=3D 2) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr, &quot;usage: %s &lt;test-dir&gt;\n&quot;, argv[0]);<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return 2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (chdir(argv[1]) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; perror(&quot;chdir&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return 2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* secure_relative_open's daemon-only conf=
inement protections only<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * fire when am_daemon &amp;&amp; !am=
_chrooted (the threat model is the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * daemon-no-chroot deployment), but =
the front-door input<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * validation runs unconditionally. W=
e set am_daemon anyway so the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * helper exercises the same code sha=
pe the receiver does. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am_daemon =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am_chrooted =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir(&quot;subdir&quot;, 0755);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Each of these relpaths must be rejected=
 with EINVAL at the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * secure_relative_open() front door.=
 &quot;..&quot; is the actual one-level<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * escape; the others (&quot;subdir/.=
.&quot;, &quot;subdir/../subdir&quot;) resolve<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * back to the start dir on systems t=
hat allow them, but we still<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * reject them as defence-in-depth: a=
 path containing a &quot;..&quot; token<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is suspicious and the caller shoul=
d normalise before passing<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * it in. The &quot;../foo&quot; / &q=
uot;foo/../bar&quot; / &quot;/foo&quot; / &quot;/&quot; cases are<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * regression checks for the existing=
 checks. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_relpath(&quot;..&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_relpath(&quot;../foo&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_relpath(&quot;subdir/..&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_relpath(&quot;subdir/../subdir&quot;=
);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_relpath(&quot;foo/../bar&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_relpath(&quot;/foo&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_relpath(&quot;/&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Same checks against basedir (which the =
codex Finding 2 fix<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * routes through the same RESOLVE_BE=
NEATH-equivalent). Absolute<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * basedirs are operator-trusted and =
intentionally not validated<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * here. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_basedir(&quot;..&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_basedir(&quot;../subdir&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_basedir(&quot;subdir/..&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_basedir(&quot;foo/../bar&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (errs)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fprintf(stderr, &quot;\n%d failure(s)\n&quot;, errs);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return errs ? 1 : 0;<br>
++}<br>
+diff --git a/testsuite/alt-dest-symlink-race.test b/testsuite/alt-dest-sym=
link-race.test<br>
+new file mode 100755<br>
+index 00000000..2256f2f2<br>
+--- /dev/null<br>
++++ b/testsuite/alt-dest-symlink-race.test<br>
+@@ -0,0 +1,96 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for the basedir-confinement gap in<br>
++# secure_relative_open(). The function opens basedir with a plain<br>
++# openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY), without<br>
++# RESOLVE_BENEATH or a per-component O_NOFOLLOW walk, so a parent<br>
++# symlink ON basedir is followed unrestrictedly. RESOLVE_BENEATH is<br>
++# then applied only to relpath, anchored at the wrong directory.<br>
++#<br>
++# The receiver's basis-file lookup at receiver.c passes<br>
++# basis_dir[fnamecmp_type] (from --copy-dest / --link-dest /<br>
++# --compare-dest -- all sender-controllable in daemon mode) as<br>
++# basedir. A daemon-module attacker with write access can plant a<br>
++# symlink at module/cd -&gt; /outside, then run --link-dest=3Dcd to<br>
++# make the daemon's basis-file lookup resolve into /outside,<br>
++# leaking the contents of daemon-readable files via the rsync<br>
++# delta-rolling read-disclosure primitive.<br>
++#<br>
++# We detect the escape by leveraging --link-dest: when basis<br>
++# matches source exactly (content + mtime + mode), --link-dest<br>
++# hard-links the destination to the basis file. With the bug, the<br>
++# destination ends up as a hard link to the outside-the-module<br>
++# file (same inode). With the fix, no basis is found and the<br>
++# destination is a fresh copy (different inode).<br>
++#<br>
++# The vulnerable code path is the same on every platform<br>
++# (including the per-component fallback on systems without<br>
++# RESOLVE_BENEATH), so this test is not platform-gated.<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++mod=3D&quot;$scratchdir/module&quot;<br>
++outside=3D&quot;$scratchdir/outside&quot;<br>
++src=3D&quot;$scratchdir/src&quot;<br>
++conf=3D&quot;$scratchdir/test-rsyncd.conf&quot;<br>
++<br>
++rm -rf &quot;$mod&quot; &quot;$outside&quot; &quot;$src&quot;<br>
++mkdir -p &quot;$mod&quot; &quot;$outside&quot; &quot;$src&quot;<br>
++<br>
++# Portable inode-number helper (GNU coreutils stat -c, BSD stat -f).<br>
++file_inode() {<br>
++&nbsp;&nbsp;&nbsp; stat -c %i &quot;$1&quot; 2&gt;/dev/null || stat -f %i=
 &quot;$1&quot;<br>
++}<br>
++<br>
++# Outside-the-module file an attacker would like the daemon to<br>
++# treat as a basis.<br>
++echo &quot;OUTSIDE_SECRET_DATA&quot; &gt; &quot;$outside/target.txt&quot;=
<br>
++chmod 0644 &quot;$outside/target.txt&quot;<br>
++<br>
++# The symlink trap planted in the module by the local attacker.<br>
++ln -s &quot;$outside&quot; &quot;$mod/cd&quot;<br>
++<br>
++# Source file matches outside/target.txt exactly (content + mtime<br>
++# + mode) so --link-dest will hard-link the destination to the<br>
++# basis file iff the daemon's basedir lookup reaches outside/.<br>
++echo &quot;OUTSIDE_SECRET_DATA&quot; &gt; &quot;$src/target.txt&quot;<br>
++touch -r &quot;$outside/target.txt&quot; &quot;$src/target.txt&quot;<br>
++chmod 0644 &quot;$src/target.txt&quot;<br>
++<br>
++cat &gt; &quot;$conf&quot; &lt;&lt;EOF<br>
++use chroot =3D no<br>
++log file =3D $scratchdir/rsyncd.log<br>
++[upload]<br>
++&nbsp;&nbsp;&nbsp; path =3D $mod<br>
++&nbsp;&nbsp;&nbsp; use chroot =3D no<br>
++&nbsp;&nbsp;&nbsp; read only =3D no<br>
++EOF<br>
++<br>
++# Recursive --link-dest push directly into the module root. We<br>
++# avoid pushing into a destination subdir because the receiver<br>
++# would chdir into it before resolving --link-dest, making the<br>
++# relative basedir &quot;cd&quot; resolve in the wrong CWD and masking th=
e<br>
++# bug. The realistic attack pushes into the module root (or the<br>
++# attacker uses a basedir path that resolves correctly from<br>
++# whichever subdir the receiver chdirs into).<br>
++RSYNC_CONNECT_PROG=3D&quot;$RSYNC --config=3D$conf --daemon&quot; \<br>
++&nbsp;&nbsp;&nbsp; $RSYNC -rtp --link-dest=3Dcd &quot;$src/&quot; rsync:/=
/localhost/upload/ \<br>
++&nbsp;&nbsp;&nbsp; &gt;/dev/null 2&gt;&amp;1 || true<br>
++<br>
++if [ ! -f &quot;$mod/target.txt&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;destination file was not created -- da=
emon transfer failed before the test could observe the basedir behaviour&qu=
ot;<br>
++fi<br>
++<br>
++outside_inode=3D$(file_inode &quot;$outside/target.txt&quot;)<br>
++dst_inode=3D$(file_inode &quot;$mod/target.txt&quot;)<br>
++<br>
++if [ &quot;$outside_inode&quot; =3D &quot;$dst_inode&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;basedir-escape: --link-dest hard-linke=
d module/target.txt to outside/target.txt (inode $outside_inode); daemon's =
basis-file lookup followed the parent symlink on the basedir&quot;<br>
++fi<br>
++<br>
++exit 0<br>
+diff --git a/testsuite/secure-relpath-validation.test b/testsuite/secure-r=
elpath-validation.test<br>
+new file mode 100755<br>
+index 00000000..5b77f7cc<br>
+--- /dev/null<br>
++++ b/testsuite/secure-relpath-validation.test<br>
+@@ -0,0 +1,34 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for codex audit Finding 5: secure_relative_open()'s<br>
++# front-door input check rejects &quot;../foo&quot; and &quot;foo/../bar&=
quot; but<br>
++# misses bare &quot;..&quot;, &quot;subdir/..&quot;, and other variants w=
hose &quot;/&quot;-split<br>
++# components contain a literal &quot;..&quot;. The kernel-enforced<br>
++# RESOLVE_BENEATH (Linux 5.6+) and O_RESOLVE_BENEATH<br>
++# (FreeBSD 13+, macOS 15+) reject these in-kernel; the per-component<br>
++# walk fallback used on NetBSD, OpenBSD, Solaris, Cygwin and pre-5.6<br>
++# Linux does not -- so the validation must happen at the front door.<br>
++#<br>
++# This test invokes the t_secure_relpath helper, which calls<br>
++# secure_relative_open() with each suspect input and verifies the<br>
++# return value is -1 with errno =3D=3D EINVAL. EINVAL is the marker<br>
++# that the front-door rejected the input, not the kernel; pre-fix<br>
++# the kernel returns -1 with EXDEV (or, on the per-component<br>
++# fallback, may return a valid fd at all -- &quot;escape&quot;).<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++testdir=3D&quot;$scratchdir/relpath-test&quot;<br>
++rm -rf &quot;$testdir&quot;<br>
++mkdir -p &quot;$testdir&quot;<br>
++<br>
++if ! &quot;$TOOLDIR/t_secure_relpath&quot; &quot;$testdir&quot;; then<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;t_secure_relpath rejected one or more =
inputs incorrectly (see stderr above for the specific case)&quot;<br>
++fi<br>
++<br>
++exit 0<br>
+diff --git a/util1.c b/util1.c<br>
+index 6e457d4f..8850019f 100644<br>
+--- a/util1.c<br>
++++ b/util1.c<br>
+@@ -141,7 +141,7 @@ int set_times(const char *fname, STRUCT_STAT *stp)<br>
+ <br>
+ #ifdef HAVE_UTIMENSAT<br>
+ #include &quot;case_N.h&quot;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_utimensat(fname, stp) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_utimensat_at(fname, stp) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (errno !=3D ENOSYS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+@@ -479,13 +479,13 @@ int copy_file(const char *source, const char *dest, =
int tmpfilefd, mode_t mode)<br>
+ int robust_unlink(const char *fname)<br>
+ {<br>
+ #ifndef ETXTBSY<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_unlink(fname);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_unlink_at(fname);<br>
+ #else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static int counter =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc, pos, start;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char path[MAXPATHLEN];<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D do_unlink(fname);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D do_unlink_at(fname);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc =3D=3D 0 || errno !=3D E=
TXTBSY)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return rc;<br>
+ <br>
+@@ -515,7 +515,7 @@ int robust_unlink(const char *fname)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* maybe we should return renam=
e()'s exit status? Nah. */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_rename(fname, path) !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_rename_at(fname, path) !=3D 0) {<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; errno =3D ETXTBSY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -538,7 +538,7 @@ int robust_rename(const char *from, const char *to, co=
nst char *partialptr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return 0;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (tries--) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_rename(from, to) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (do_rename_at(from, to) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; switch (errno) {<br>
+@@ -559,7 +559,7 @@ int robust_rename(const char *from, const char *to, co=
nst char *partialptr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (copy_f=
ile(from, to, -1, mode) !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink(from);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_unlink_at(from);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+@@ -1329,20 +1329,20 @@ int handle_partial_dir(const char *fname, int crea=
te)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dir =3D partial_fname;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (create) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; STRUCT_STAT st;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int statret =3D do_lstat(dir, &amp;st);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int statret =3D do_lstat_at(dir, &amp;st);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (statret =3D=3D 0 &amp;&amp; !S_ISDIR(st.st_mode)) {<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_unlink(dir) &l=
t; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_unlink_at(dir)=
 &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *fn =3D '/';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; statret =
=3D -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (statret &lt; 0 &amp;&amp; do_mkdir(dir, 0700) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (statret &lt; 0 &amp;&amp; do_mkdir_at(dir, 0700) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *fn =3D '/=
';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_rmdir(dir);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; do_rmdir_at(dir);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *fn =3D '/';<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
+diff --git a/xattrs.c b/xattrs.c<br>
+index 4462d63b..2e16024b 100644<br>
+--- a/xattrs.c<br>
++++ b/xattrs.c<br>
+@@ -1249,7 +1249,12 @@ int set_stat_xattr(const char *fname, struct file_s=
truct *file, mode_t new_mode)<br>
+ <br>
+ int x_stat(const char *fname, STRUCT_STAT *fst, STRUCT_STAT *xst)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D do_stat(fname, fst);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Use the *_at variants so that on a daem=
on-no-chroot deployment<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the metadata read goes through a s=
ecure parent dirfd instead<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * of bare path resolution. The *_at =
wrappers fall through to<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * plain do_stat outside the daemon-n=
o-chroot context, so this<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * change is transparent for non-daem=
on use. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D do_stat_at(fname, fst);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((ret &lt; 0 || get_stat_xat=
tr(fname, -1, fst, xst) &lt; 0) &amp;&amp; xst)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; xst-&gt;st_mode =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
+@@ -1257,7 +1262,7 @@ int x_stat(const char *fname, STRUCT_STAT *fst, STRU=
CT_STAT *xst)<br>
+ <br>
+ int x_lstat(const char *fname, STRUCT_STAT *fst, STRUCT_STAT *xst)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D do_lstat(fname, fst);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D do_lstat_at(fname, fst);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((ret &lt; 0 || get_stat_xat=
tr(fname, -1, fst, xst) &lt; 0) &amp;&amp; xst)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; xst-&gt;st_mode =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch<br>
new file mode 100644<br>
index 0000000000..26d2122d7c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch<br>
@@ -0,0 +1,568 @@<br>
+From 1efd7d95ad3813ea3d4b303d277cd46297f7c2f5 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Wed, 6 May 2026 09:45:30 +1000<br>
+Subject: [PATCH] util1+syscall: secure copy_file source/dest opens; bare-p=
ath<br>
+ defence-in-depth<br>
+<br>
+Three related codex audit findings:<br>
+<br>
+&nbsp; Finding 3a: copy_file()'s source open in util1.c used<br>
+&nbsp; do_open_nofollow(), which only rejects a final-component<br>
+&nbsp; symlink. A parent-component symlink (e.g. --copy-dest=3Dcd where<br=
>
+&nbsp; cd -&gt; /outside) follows freely and reads outside the module.<br>
+&nbsp; Route through secure_relative_open() with O_NOFOLLOW.<br>
+<br>
+&nbsp; Finding 3b: generator.c's in-place backup-file create still<br>
+&nbsp; used a bare do_open with O_CREAT, leaving a tiny but reachable<br>
+&nbsp; parent-symlink window between the secure unlink (already<br>
+&nbsp; through do_unlink_at) and the create. Add do_open_at() that<br>
+&nbsp; goes through a secure parent dirfd, and route the call site<br>
+&nbsp; through it.<br>
+<br>
+&nbsp; Finding 3c: copy_file()'s destination open in<br>
+&nbsp; unlink_and_reopen() had the same bare-do_open pattern; route<br>
+&nbsp; through do_open_at as well.<br>
+<br>
+Adds testsuite/copy-dest-source-symlink.test and<br>
+testsuite/bare-do-open-symlink-race.test as regression coverage<br>
+for both attack shapes.<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-43619<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/3cc6a9e8cdcffb637ecdd41dae47833096dca317">https://github.com/Rsync=
Project/rsync/commit/3cc6a9e8cdcffb637ecdd41dae47833096dca317</a>]<br>
+<br>
+(cherry picked from commit 3cc6a9e8cdcffb637ecdd41dae47833096dca317)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ generator.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
+ syscall.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 138 +++++++++++++++--<br>
+ testsuite/bare-do-open-symlink-race.test | 186 +++++++++++++++++++++++<br=
>
+ testsuite/copy-dest-source-symlink.test&nbsp; |&nbsp; 83 ++++++++++<br>
+ util1.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 21 ++-<br=
>
+ 5 files changed, 416 insertions(+), 14 deletions(-)<br>
+ create mode 100755 testsuite/bare-do-open-symlink-race.test<br>
+ create mode 100755 testsuite/copy-dest-source-symlink.test<br>
+<br>
+diff --git a/generator.c b/generator.c<br>
+index e5b2d176..311e9b78 100644<br>
+--- a/generator.c<br>
++++ b/generator.c<br>
+@@ -1896,7 +1896,7 @@ static void recv_generator(char *fname, struct file_=
struct *file, int ndx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; back_file =
=3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto clean=
up;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if ((f_copy =3D do_open(backupptr, O_WRONLY | O_CREAT | O_TRUNC | O_E=
XCL, 0600)) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if ((f_copy =3D do_open_at(backupptr, O_WRONLY | O_CREAT | O_TRUNC | =
O_EXCL, 0600)) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR_XFER, errno, &quot;open %s&quot;, full_fname(backupptr));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unmake_fil=
e(back_file);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; back_file =
=3D NULL;<br>
+diff --git a/syscall.c b/syscall.c<br>
+index ffd8df20..10a3c231 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -203,11 +203,6 @@ int do_symlink_at(const char *lnk, const char *path)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return do_symlink(lnk, path);<br>
+ <br>
+-#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_root &lt; 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_symlink(lnk, path);<br>
+-#endif<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!path || !*path || *path =
=3D=3D '/')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return do_symlink(lnk, path);<br>
+ <br>
+@@ -228,6 +223,34 @@ int do_symlink_at(const char *lnk, const char *path)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+ <br>
++#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For --fake-super, do_symlink writes the=
 link target into a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * regular file rather than creating =
a real symlink. Do that<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * here against the secure dirfd, wit=
h O_NOFOLLOW so a pre-<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * planted symlink at the basename ca=
n't redirect the file<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * creation. (Previously the fake-sup=
er branch fell through to<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the bare-path do_symlink at the to=
p of the function.) */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_root &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int len =3D strlen(lnk);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int fd =3D openat(dfd, bname,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; O_WRONLY | O_CREAT | O_TRUNC | O_NOFOLLOW,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; S_IWUSR | S_IRUSR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (fd &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D (write(fd, lnk, len) =3D=3D len) ? 0 : -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (close(fd) &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return ret;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++#endif<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D symlinkat(lnk, dfd, bna=
me);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
+@@ -503,9 +526,12 @@ int do_mknod(const char *pathname, mode_t mode, dev_t=
 dev)<br>
+&nbsp;&nbsp; mknodat() against that dirfd. mknodat() covers both regular-f=
ile<br>
+&nbsp;&nbsp; (S_IFREG with dev=3D0) and FIFO (S_IFIFO) and device-node cre=
ation.<br>
+ <br>
+-&nbsp; Falls through to do_mknod() for fake-super (am_root &lt; 0) and fo=
r<br>
+-&nbsp; sockets, both of which use auxiliary path-based syscalls that<br>
+-&nbsp; don't have an *at() variant in any portable form.<br>
++&nbsp; Fake-super (am_root &lt; 0) is handled inline against the secure<b=
r>
++&nbsp; parent dirfd: it creates a regular empty file (the same file-as-<b=
r>
++&nbsp; metadata-placeholder pattern do_mknod uses) via openat() with<br>
++&nbsp; O_NOFOLLOW. Sockets fall through to do_mknod() because their<br>
++&nbsp; bind(2) takes a path argument with no portable bindat() variant;<b=
r>
++&nbsp; this is documented as a residual.<br>
+ */<br>
+ int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)<br>
+ {<br>
+@@ -523,9 +549,6 @@ int do_mknod_at(const char *pathname, mode_t mode, dev=
_t dev)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return do_mknod(pathname, mode, dev);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_root &lt; 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_mknod(pathname, mode, dev);<br>
+-<br>
+ #if !defined MKNOD_CREATES_SOCKETS &amp;&amp; defined HAVE_SYS_UN_H<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISSOCK(mode))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return do_mknod(pathname, mode, dev);<br>
+@@ -551,6 +574,29 @@ int do_mknod_at(const char *pathname, mode_t mode, de=
v_t dev)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_root &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* For --fake-super, do_mknod creates a regular empty<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * file as a placeholder for the special-file metadata<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * (which is stored in xattrs elsewhere). Do that against<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * the secure dirfd, with O_NOFOLLOW so a pre-planted<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * symlink at the basename can't redirect the file<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * creation. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int fd =3D openat(dfd, bname,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; O_WRONLY | O_CREAT | O_TRUNC | O_NOFOLLOW,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; S_IWUSR | S_IRUSR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (fd &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D (close(fd) &lt; 0) ? -1 : 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return ret;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+ #if !defined MKNOD_CREATES_FIFOS &amp;&amp; defined HAVE_MKFIFO<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISFIFO(mode))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; ret =3D mkfifoat(dfd, bname, mode);<br>
+@@ -639,6 +685,76 @@ int do_open(const char *pathname, int flags, mode_t m=
ode)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return open(pathname, flags | O=
_BINARY, mode);<br>
+ }<br>
+ <br>
++/*<br>
++&nbsp; Symlink-race-safe variant of do_open() for receiver-side use. See<=
br>
++&nbsp; the comment on do_chmod_at() for the threat model. open() resolves=
<br>
++&nbsp; parent components, so a parent-symlink swap can redirect the open<=
br>
++&nbsp; to a file outside the module. This wrapper is defence-in-depth for=
<br>
++&nbsp; bare-path do_open() sites that callers know are otherwise<br>
++&nbsp; protected by secure parent-syscalls (e.g. generator.c's in-place<b=
r>
++&nbsp; backup creation, where robust_unlink() rejects the symlinked<br>
++&nbsp; parent before this open is reached): if any of those upstream<br>
++&nbsp; protections is later removed or regresses, the open here still<br>
++&nbsp; refuses to escape the module.<br>
++<br>
++&nbsp; Defence: open the parent of pathname under secure_relative_open()<=
br>
++&nbsp; and call openat() against the resulting dirfd with O_NOFOLLOW<br>
++&nbsp; (so the basename itself isn't followed if it happens to be a<br>
++&nbsp; pre-planted symlink, which is what we want for O_CREAT|O_EXCL).<br=
>
++*/<br>
++int do_open_at(const char *pathname, int flags, mode_t mode)<br>
++{<br>
++#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *slash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dfd, ret, e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t dlen;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags !=3D O_RDONLY) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RETURN_ERROR_IF(dry_run, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RETURN_ERROR_IF_RO_OR_LO;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am_daemon || am_chrooted)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_open(pathname, flags, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pathname || !*pathname || *pathname =
=3D=3D '/')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_open(pathname, flags, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slash =3D strrchr(pathname, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slash)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return do_open(pathname, flags, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlen =3D slash - pathname;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlen &gt;=3D sizeof dirpath) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENAMETOOLONG;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dirpath, pathname, dlen);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirpath[dlen] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bname =3D slash + 1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dfd =3D secure_relative_open(NULL, dirpath=
, O_RDONLY | O_DIRECTORY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++<br>
++#ifdef O_NOATIME<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (open_noatime)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; flags |=3D O_NOATIME;<br>
++#endif<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D openat(dfd, bname, flags | O_NOFOL=
LOW | O_BINARY, mode);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(dfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_open(pathname, flags, mode);<br>
++#endif<br>
++}<br>
++<br>
+ #ifdef HAVE_CHMOD<br>
+ int do_chmod(const char *path, mode_t mode)<br>
+ {<br>
+diff --git a/testsuite/bare-do-open-symlink-race.test b/testsuite/bare-do-=
open-symlink-race.test<br>
+new file mode 100755<br>
+index 00000000..b8c51bbe<br>
+--- /dev/null<br>
++++ b/testsuite/bare-do-open-symlink-race.test<br>
+@@ -0,0 +1,186 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for codex audit Findings 3b and 3c:<br>
++#<br>
++#&nbsp;&nbsp; 3b: generator.c:1905 -- the in-place backup creation opens<=
br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backupptr via bare do_open(O_WRONLY=
|O_CREAT|O_TRUNC|O_EXCL).<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With --backup-dir set to an attacke=
r-planted parent symlink,<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the backup file is written outside =
the module under the<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon's authority.<br>
++#<br>
++#&nbsp;&nbsp; 3c-symlink: syscall.c:207 -- do_symlink_at falls through to=
 bare<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_symlink for am_root &lt; 0 (fake=
-super), which then opens<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the destination path with bare open=
() (final-component<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fake-super file). A parent symlink =
on the destination path<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; redirects the file creation outside=
 the module.<br>
++#<br>
++#&nbsp;&nbsp; 3c-mknod: syscall.c:506 -- do_mknod_at falls through to bar=
e<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_mknod for am_root &lt; 0, same p=
ath-based open(). For<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FIFOs/sockets/devices the bare path=
 is also used.<br>
++#<br>
++# Each scenario plants a &quot;secret&quot; file outside the module at a<=
br>
++# location the symlink trap points to. The check is that the<br>
++# outside file's content and mode are unchanged after the attack<br>
++# attempt.<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++# All three scenarios depend on receiver-side daemon code paths<br>
++# that are only secured on platforms with a working<br>
++# secure_relative_open. The chdir/chmod tests already skip the<br>
++# same set; mirror that.<br>
++case &quot;$(uname -s)&quot; in<br>
++&nbsp;&nbsp;&nbsp; SunOS|OpenBSD|NetBSD|CYGWIN*)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_skipped &quot;secure_rela=
tive_open relies on RESOLVE_BENEATH-equivalent kernel support not available=
 on $(uname -s)&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
++esac<br>
++<br>
++mod=3D&quot;$scratchdir/module&quot;<br>
++outside=3D&quot;$scratchdir/outside&quot;<br>
++src=3D&quot;$scratchdir/src&quot;<br>
++conf=3D&quot;$scratchdir/test-rsyncd.conf&quot;<br>
++<br>
++# Portable inode-and-mode helpers.<br>
++file_mode() {<br>
++&nbsp;&nbsp;&nbsp; stat -c %a &quot;$1&quot; 2&gt;/dev/null || stat -f %L=
p &quot;$1&quot;<br>
++}<br>
++<br>
++setup() {<br>
++&nbsp;&nbsp;&nbsp; rm -rf &quot;$mod&quot; &quot;$outside&quot; &quot;$sr=
c&quot;<br>
++&nbsp;&nbsp;&nbsp; mkdir -p &quot;$mod&quot; &quot;$outside&quot; &quot;$=
src&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; echo &quot;OUTSIDE_PROTECTED_DATA&quot; &gt; &quot;$ou=
tside/target.txt&quot;<br>
++&nbsp;&nbsp;&nbsp; chmod 0644 &quot;$outside/target.txt&quot;<br>
++&nbsp;&nbsp;&nbsp; outside_pristine=3D&quot;$scratchdir/outside-pristine.=
txt&quot;<br>
++&nbsp;&nbsp;&nbsp; cp -p &quot;$outside/target.txt&quot; &quot;$outside_p=
ristine&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; ln -s &quot;$outside&quot; &quot;$mod/cd&quot;<br>
++}<br>
++<br>
++verify_outside_unchanged() {<br>
++&nbsp;&nbsp;&nbsp; label=3D&quot;$1&quot;<br>
++&nbsp;&nbsp;&nbsp; mode=3D$(file_mode &quot;$outside/target.txt&quot;)<br=
>
++&nbsp;&nbsp;&nbsp; case &quot;$mode&quot; in<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 644|0644) ;;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *) test_fail &quot;$label: out=
side/target.txt mode changed from 644 to $mode&quot; ;;<br>
++&nbsp;&nbsp;&nbsp; esac<br>
++&nbsp;&nbsp;&nbsp; if ! cmp -s &quot;$outside/target.txt&quot; &quot;$out=
side_pristine&quot;; then<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_fail &quot;$label: outsid=
e/target.txt content changed -- daemon followed the cd symlink&quot;<br>
++&nbsp;&nbsp;&nbsp; fi<br>
++}<br>
++<br>
++verify_outside_unchanged_or_absent() {<br>
++&nbsp;&nbsp;&nbsp; label=3D&quot;$1&quot;<br>
++&nbsp;&nbsp;&nbsp; target=3D&quot;$2&quot;&nbsp; # specific file under ou=
tside/ to check absence of<br>
++&nbsp;&nbsp;&nbsp; if [ -e &quot;$outside/$target&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_fail &quot;$label: outsid=
e/$target was created -- daemon followed the cd symlink&quot;<br>
++&nbsp;&nbsp;&nbsp; fi<br>
++}<br>
++<br>
++<br>
++############################################################<br>
++# Scenario 3b: --inplace --backup --backup-dir=3Dcd<br>
++#<br>
++# Pre-create module/target.txt so the receiver enters the in-place<br>
++# update path; a backup of the existing content must be made<br>
++# before the update. With --backup-dir=3Dcd, backupptr resolves to<br>
++# &quot;cd/target.txt&quot;; with the bug, robust_unlink and the bare<br>
++# do_open at generator.c:1905 both follow the cd symlink, the<br>
++# unlink deletes outside/target.txt and the create writes the<br>
++# pre-existing module/target.txt content there.<br>
++############################################################<br>
++<br>
++setup<br>
++echo &quot;EXISTING_MODULE_DATA&quot; &gt; &quot;$mod/target.txt&quot;<br=
>
++chmod 0666 &quot;$mod/target.txt&quot;<br>
++echo &quot;NEW_DATA_FROM_SENDER&quot; &gt; &quot;$src/target.txt&quot;<br=
>
++chmod 0644 &quot;$src/target.txt&quot;<br>
++<br>
++cat &gt; &quot;$conf&quot; &lt;&lt;EOF<br>
++use chroot =3D no<br>
++log file =3D $scratchdir/rsyncd.log<br>
++[upload]<br>
++&nbsp;&nbsp;&nbsp; path =3D $mod<br>
++&nbsp;&nbsp;&nbsp; use chroot =3D no<br>
++&nbsp;&nbsp;&nbsp; read only =3D no<br>
++EOF<br>
++<br>
++RSYNC_CONNECT_PROG=3D&quot;$RSYNC --config=3D$conf --daemon&quot; \<br>
++&nbsp;&nbsp;&nbsp; $RSYNC --inplace --backup --backup-dir=3Dcd &quot;$src=
/target.txt&quot; \<br>
++&nbsp;&nbsp;&nbsp; rsync://localhost/upload/target.txt &gt;/dev/null 2&gt=
;&amp;1 || true<br>
++<br>
++verify_outside_unchanged &quot;3b inplace+backup-dir=3Dcd&quot;<br>
++<br>
++<br>
++############################################################<br>
++# Scenario 3c-symlink: fake-super symlink push to a path with a<br>
++# symlinked parent<br>
++#<br>
++# With &quot;fake super =3D yes&quot; set on the module, the receiver<br>
++# represents symlinks as fake-super files (regular files with the<br>
++# link target written to them). The path-based open() in<br>
++# do_symlink's fake-super branch follows parent symlinks. We push<br>
++# a single symlink to the destination path &quot;cd/sym&quot; so the<br>
++# receiver's create-file call lands at &quot;cd/sym&quot; relative to the=
<br>
++# module root, where cd is the symlink trap.<br>
++############################################################<br>
++<br>
++setup<br>
++<br>
++mkdir -p &quot;$src/cd&quot;<br>
++ln -s /etc/passwd &quot;$src/cd/sym&quot;<br>
++<br>
++cat &gt; &quot;$conf&quot; &lt;&lt;EOF<br>
++use chroot =3D no<br>
++log file =3D $scratchdir/rsyncd.log<br>
++[upload_fake]<br>
++&nbsp;&nbsp;&nbsp; path =3D $mod<br>
++&nbsp;&nbsp;&nbsp; use chroot =3D no<br>
++&nbsp;&nbsp;&nbsp; read only =3D no<br>
++&nbsp;&nbsp;&nbsp; fake super =3D yes<br>
++EOF<br>
++<br>
++RSYNC_CONNECT_PROG=3D&quot;$RSYNC --config=3D$conf --daemon&quot; \<br>
++&nbsp;&nbsp;&nbsp; $RSYNC -rl &quot;$src/&quot; rsync://localhost/upload_=
fake/ &gt;/dev/null 2&gt;&amp;1 || true<br>
++<br>
++verify_outside_unchanged_or_absent &quot;3c-symlink fake-super symlink pu=
sh&quot; &quot;sym&quot;<br>
++<br>
++<br>
++############################################################<br>
++# Scenario 3c-mknod: fake-super FIFO push to a path with a<br>
++# symlinked parent<br>
++#<br>
++# Similar to 3c-symlink but for special files. mkfifo works<br>
++# without root; we push a FIFO and verify the receiver doesn't<br>
++# create a fake-super file at outside/fifo.<br>
++############################################################<br>
++<br>
++setup<br>
++<br>
++mkdir -p &quot;$src/cd&quot;<br>
++mkfifo &quot;$src/cd/fifo&quot; 2&gt;/dev/null<br>
++if [ ! -p &quot;$src/cd/fifo&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_skipped &quot;mkfifo unavailable; cannot exercise=
 3c-mknod&quot;<br>
++fi<br>
++<br>
++cat &gt; &quot;$conf&quot; &lt;&lt;EOF<br>
++use chroot =3D no<br>
++log file =3D $scratchdir/rsyncd.log<br>
++[upload_fake]<br>
++&nbsp;&nbsp;&nbsp; path =3D $mod<br>
++&nbsp;&nbsp;&nbsp; use chroot =3D no<br>
++&nbsp;&nbsp;&nbsp; read only =3D no<br>
++&nbsp;&nbsp;&nbsp; fake super =3D yes<br>
++EOF<br>
++<br>
++RSYNC_CONNECT_PROG=3D&quot;$RSYNC --config=3D$conf --daemon&quot; \<br>
++&nbsp;&nbsp;&nbsp; $RSYNC -rD &quot;$src/&quot; rsync://localhost/upload_=
fake/ &gt;/dev/null 2&gt;&amp;1 || true<br>
++<br>
++verify_outside_unchanged_or_absent &quot;3c-mknod fake-super FIFO push&qu=
ot; &quot;fifo&quot;<br>
++<br>
++exit 0<br>
+diff --git a/testsuite/copy-dest-source-symlink.test b/testsuite/copy-dest=
-source-symlink.test<br>
+new file mode 100755<br>
+index 00000000..2d20fab4<br>
+--- /dev/null<br>
++++ b/testsuite/copy-dest-source-symlink.test<br>
+@@ -0,0 +1,83 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for codex audit Finding 3a: copy_file()'s source<br>
++# open in copy_altdest_file() is via do_open_nofollow(), which only<br>
++# refuses a final-component symlink. Parent components are still<br>
++# resolved with normal symlink-following. A daemon module attacker<br>
++# who plants a parent symlink at module/cd -&gt; /outside, then runs<br>
++# --copy-dest=3Dcd against a source file matching the size+mtime of<br>
++# /outside/target.txt, drives the receiver to:<br>
++#<br>
++#&nbsp;&nbsp; 1. Find a match-level &gt;=3D 2 basis at &quot;cd/target.tx=
t&quot;<br>
++#&nbsp;&nbsp; 2. Call copy_altdest_file -&gt; copy_file(src=3D&quot;cd/ta=
rget.txt&quot;, ...)<br>
++#&nbsp;&nbsp; 3. do_open_nofollow follows the &quot;cd&quot; parent symli=
nk and reads<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the contents of /outside/target.txt under=
 the daemon's<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; authority<br>
++#&nbsp;&nbsp; 4. Copy that content into the module destination<br>
++#<br>
++# Result: outside/target.txt content lands at module/target.txt,<br>
++# accessible to the attacker on a subsequent pull.<br>
++#<br>
++# We detect by content: src/target.txt and outside/target.txt have<br>
++# identical metadata (size + mtime + mode) but different content.<br>
++# After the transfer, module/target.txt should match src (no<br>
++# basedir escape) -- if it matches outside, the bug copied across<br>
++# the symlink boundary.<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++mod=3D&quot;$scratchdir/module&quot;<br>
++outside=3D&quot;$scratchdir/outside&quot;<br>
++src=3D&quot;$scratchdir/src&quot;<br>
++conf=3D&quot;$scratchdir/test-rsyncd.conf&quot;<br>
++<br>
++rm -rf &quot;$mod&quot; &quot;$outside&quot; &quot;$src&quot;<br>
++mkdir -p &quot;$mod&quot; &quot;$outside&quot; &quot;$src&quot;<br>
++<br>
++# Outside-the-module file the daemon should not read on the<br>
++# attacker's behalf.<br>
++echo &quot;OUTSIDE_LEAKED_DATA!&quot; &gt; &quot;$outside/target.txt&quot=
;<br>
++chmod 0644 &quot;$outside/target.txt&quot;<br>
++<br>
++# The symlink trap.<br>
++ln -s &quot;$outside&quot; &quot;$mod/cd&quot;<br>
++<br>
++# Source: same size, same mtime, same mode as outside -- so the<br>
++# generator's link_stat + quick_check_ok finds a match-level &gt;=3D 2<br=
>
++# basis and calls copy_altdest_file.<br>
++echo &quot;ATTACKER_KNOWN_DATA!&quot; &gt; &quot;$src/target.txt&quot;<br=
>
++touch -r &quot;$outside/target.txt&quot; &quot;$src/target.txt&quot;<br>
++chmod 0644 &quot;$src/target.txt&quot;<br>
++<br>
++cat &gt; &quot;$conf&quot; &lt;&lt;EOF<br>
++use chroot =3D no<br>
++log file =3D $scratchdir/rsyncd.log<br>
++[upload]<br>
++&nbsp;&nbsp;&nbsp; path =3D $mod<br>
++&nbsp;&nbsp;&nbsp; use chroot =3D no<br>
++&nbsp;&nbsp;&nbsp; read only =3D no<br>
++EOF<br>
++<br>
++# --copy-dest push to module root.<br>
++RSYNC_CONNECT_PROG=3D&quot;$RSYNC --config=3D$conf --daemon&quot; \<br>
++&nbsp;&nbsp;&nbsp; $RSYNC -rtp --copy-dest=3Dcd &quot;$src/&quot; rsync:/=
/localhost/upload/ \<br>
++&nbsp;&nbsp;&nbsp; &gt;/dev/null 2&gt;&amp;1 || true<br>
++<br>
++if [ ! -f &quot;$mod/target.txt&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;destination file was not created -- da=
emon transfer failed before the test could observe the basedir behaviour&qu=
ot;<br>
++fi<br>
++<br>
++if cmp -s &quot;$mod/target.txt&quot; &quot;$outside/target.txt&quot;; th=
en<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;basedir-escape via copy_file source: m=
odule/target.txt now contains the contents of outside/target.txt -- daemon =
read /outside via the cd symlink and copied it into the module&quot;<br>
++fi<br>
++<br>
++if ! cmp -s &quot;$mod/target.txt&quot; &quot;$src/target.txt&quot;; then=
<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;destination doesn't match source conte=
nt (and isn't outside content either): unexpected state&quot;<br>
++fi<br>
++<br>
++exit 0<br>
+diff --git a/util1.c b/util1.c<br>
+index 8850019f..d28a8e02 100644<br>
+--- a/util1.c<br>
++++ b/util1.c<br>
+@@ -336,7 +336,13 @@ static int unlink_and_reopen(const char *dest, mode_t=
 mode)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; mode |=3D S_IWUSR;<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode &amp;=3D INITACCESSPERMS;<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((ofd =3D do_open(dest, O_WRONLY | O_CR=
EAT | O_TRUNC | O_EXCL, mode)) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Use do_open_at so the create/truncate g=
oes through a secure<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * parent dirfd in the daemon-no-chro=
ot deployment. Otherwise<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * an attacker could swap a parent co=
mponent with a symlink in<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the window between robust_unlink (=
which uses do_unlink_at,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * already secure) and the create her=
e, and redirect the new<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * file outside the module. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((ofd =3D do_open_at(dest, O_WRONLY | O=
_CREAT | O_TRUNC | O_EXCL, mode)) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; int save_errno =3D errno;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; rsyserr(FERROR_XFER, save_errno, &quot;open %s&quot;, full=
_fname(dest));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; errno =3D save_errno;<br>
+@@ -360,12 +366,23 @@ static int unlink_and_reopen(const char *dest, mode_=
t mode)<br>
+&nbsp; * --copy-dest options. */<br>
+ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t=
 mode)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chrooted;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ifd, ofd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[1024 * 8];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int len;&nbsp;&nbsp; /* Number =
of bytes read into `buf'. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OFF_T prealloc_len =3D 0, offse=
t =3D 0;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((ifd =3D do_open_nofollow(source, O_RD=
ONLY)) &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* On a daemon without chroot, route the s=
ource open through<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * secure_relative_open so a parent-s=
ymlink on the source path<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (e.g. --copy-dest=3Dcd where cd is=
 a symlink to an outside<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * directory) cannot redirect the rea=
d to a file the daemon can<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * see but the attacker should not. P=
lain do_open_nofollow only<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * refuses a final-component symlink;=
 parents are still followed. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (am_daemon &amp;&amp; !am_chrooted &amp=
;&amp; source &amp;&amp; *source &amp;&amp; source[0] !=3D '/')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ifd =3D secure_relative_open(NULL, source, O_RDONLY | O_NOFOLLOW, 0);=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ifd =3D do_open_nofollow(source, O_RDONLY);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ifd &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; int save_errno =3D errno;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; rsyserr(FERROR_XFER, errno, &quot;open %s&quot;, full_fnam=
e(source));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; errno =3D save_errno;<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p5.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p5.patch<br>
new file mode 100644<br>
index 0000000000..c15af2c0ba<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p5.patch<br>
@@ -0,0 +1,69 @@<br>
+From d944dae7e5c1c194db23a1fefa443dd240d52afd Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Thu, 4 Jun 2026 14:46:38 +1000<br>
+Subject: [PATCH] build: fall back to do_mknod() when mknodat() is<br>
+ unavailable (#896)<br>
+<br>
+do_mknod_at() (the symlink-race-safe variant used by a non-chrooted<br>
+daemon receiver) calls mknodat()/mkfifoat(), but the at-variant was<br>
+gated only on AT_FDCWD.&nbsp; Older Darwin declares AT_FDCWD without<br>
+mknodat(), so the build failed with &quot;mknodat undeclared&quot;.<br>
+<br>
+Probe mknodat()/mkfifoat() in configure and require HAVE_MKNODAT for the<b=
r>
+at-variant; without it do_mknod_at() falls back to do_mknod(), exactly<br>
+as it already does where AT_FDCWD is missing.&nbsp; Linux keeps the mknoda=
t<br>
+path since HAVE_MKNODAT is defined there.<br>
+<br>
+Thanks to @debohman for the report (#896).<br>
+<br>
+Fixes: #896<br>
+<br>
+CVE: CVE-2026-43619<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/f3757a470ad3defdb2c4c6ad334e3839f3c7f1ae">https://github.com/Rsync=
Project/rsync/commit/f3757a470ad3defdb2c4c6ad334e3839f3c7f1ae</a>]<br>
+<br>
+(cherry picked from commit f3757a470ad3defdb2c4c6ad334e3839f3c7f1ae)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ configure.ac | 2 +-<br>
+ syscall.c&nbsp;&nbsp;&nbsp; | 6 ++++--<br>
+ 2 files changed, 5 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/configure.ac b/configure.ac<br>
+index d2bcb471..1d9b3713 100644<br>
+--- a/configure.ac<br>
++++ b/configure.ac<br>
+@@ -888,7 +888,7 @@ AC_FUNC_UTIME_NULL<br>
+ AC_FUNC_ALLOCA<br>
+ AC_CHECK_FUNCS(waitpid wait4 getcwd chown chmod lchmod mknod mkfifo \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fchmod fstat ftruncate strchr readlink link utime=
 utimes lutimes strftime \<br>
+-&nbsp;&nbsp;&nbsp; chflags getattrlist mktime innetgr linkat \<br>
++&nbsp;&nbsp;&nbsp; chflags getattrlist mktime innetgr linkat mknodat mkfi=
foat \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; memmove lchown vsnprintf snprintf vasprintf aspri=
ntf setsid strpbrk \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; strlcat strlcpy stpcpy strtol mallinfo mallinfo2 =
getgroups setgroups geteuid getegid \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; setlocale setmode open64 lseek64 mkstemp64 mtrace=
 va_copy __va_copy \<br>
+diff --git a/syscall.c b/syscall.c<br>
+index 10a3c231..25c92aac 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -535,7 +535,9 @@ int do_mknod(const char *pathname, mode_t mode, dev_t =
dev)<br>
+ */<br>
+ int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)<br>
+ {<br>
+-#ifdef AT_FDCWD<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HAVE_MKNODAT: older Darwin declares AT_=
FDCWD but not mknodat(), so<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the at-variant won't build there; =
fall back to do_mknod() (#896). */<br>
++#if defined(AT_FDCWD) &amp;&amp; defined(HAVE_MKNODAT)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern int am_daemon, am_chroot=
ed;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dirpath[MAXPATHLEN];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *bname;<br>
+@@ -597,7 +599,7 @@ int do_mknod_at(const char *pathname, mode_t mode, dev=
_t dev)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return ret;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-#if !defined MKNOD_CREATES_FIFOS &amp;&amp; defined HAVE_MKFIFO<br>
++#if !defined MKNOD_CREATES_FIFOS &amp;&amp; defined HAVE_MKFIFO &amp;&amp=
; defined HAVE_MKFIFOAT<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (S_ISFIFO(mode))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; ret =3D mkfifoat(dfd, bname, mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-- <br>
+2.35.6<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch<br>
new file mode 100644<br>
index 0000000000..9cdbf4e2fe<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch<br>
@@ -0,0 +1,264 @@<br>
+From 94e63a8632a3c3bc10ac630a53a99ed01a82f9de Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Wed, 1 Jul 2026 02:40:00 -0700<br>
+Subject: [PATCH] build: openat2 autodetect + android probe (R1<br>
+ #924/#905/#900, R10 #904)<br>
+<br>
+configure now probes for &lt;linux/openat2.h&gt; + SYS_openat2 and defines=
<br>
+HAVE_OPENAT2 only when both are present; syscall.c gates the openat2 inclu=
de<br>
+and the openat2(RESOLVE_BENEATH) tier on HAVE_OPENAT2, so the build no lon=
ger<br>
+fails on kernels/headers that lack the openat2 header (3.4.3 included it<b=
r>
+unconditionally on Linux).&nbsp; android.c probes openat2 usability behind=
 a SIGSYS<br>
+handler so the Android/Termux seccomp sandbox falls back to the portable<b=
r>
+resolver instead of killing the process.<br>
+<br>
+Backport combining c73e0063, 83a24c21, the syscall.c guards from 1d5b5ab8,=
 and<br>
+4634b0ad; the --disable-openat2/gcov coverage knobs and test changes are o=
mitted.<br>
+<br>
+Thanks to @mmayer (#924), @fda77 (#905), @darkshram (#900) and @ketas (#90=
4) for the reports.<br>
+<br>
+CVE: CVE-2026-43619<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/c14e2258b59a3f16a99c6e83a28660ba438a73e9">https://github.com/Rsync=
Project/rsync/commit/c14e2258b59a3f16a99c6e83a28660ba438a73e9</a>]<br>
+<br>
+Backport Changes:<br>
+- Rebased syscall.c context around Wrynose's existing<br>
+&nbsp; secure_relative_open() hardening while preserving the upstream<br>
+&nbsp; HAVE_OPENAT2 compile gate, openat2_usable() Android SIGSYS probe,<b=
r>
+&nbsp; openat2_beneath() wrapper, and ENOSYS/runtime fallback behavior.<br=
>
+<br>
+(cherry picked from commit c14e2258b59a3f16a99c6e83a28660ba438a73e9)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ Makefile.in&nbsp; | 12 ++++-----<br>
+ android.c&nbsp;&nbsp;&nbsp; | 82 ++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++<br>
+ configure.ac | 22 +++++++++++++++++<br>
+ syscall.c&nbsp;&nbsp;&nbsp; | 23 +++++++++++++----<br>
+ 4 files changed, 128 insertions(+), 11 deletions(-)<br>
+ create mode 100644 android.c<br>
+<br>
+diff --git a/Makefile.in b/Makefile.in<br>
+index c0cc7a06..f2590b69 100644<br>
+--- a/Makefile.in<br>
++++ b/Makefile.in<br>
+@@ -49,7 +49,7 @@ LIBOBJ=3Dlib/wildmatch.o lib/compat.o lib/snprintf.o lib=
/mdfour.o lib/md5.o \<br>
+ zlib_OBJS=3Dzlib/deflate.o zlib/inffast.o zlib/inflate.o zlib/inftrees.o =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zlib/trees.o zlib/zutil.o zlib/=
adler32.o zlib/compress.o zlib/crc32.o<br>
+ OBJS1=3Dflist.o rsync.o generator.o receiver.o cleanup.o sender.o exclude=
.o \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; util1.o util2.o main.o checksum.o match.o =
syscall.o log.o backup.o delete.o<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; util1.o util2.o main.o checksum.o match.o =
syscall.o android.o log.o backup.o delete.o<br>
+ OBJS2=3Doptions.o io.o compat.o hlink.o token.o uidlist.o socket.o hashta=
ble.o \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usage.o fileio.o batch.o client=
name.o chmod.o acls.o xattrs.o<br>
+ OBJS3=3Dprogress.o pipe.o @MD5_ASM@ @ROLL_SIMD@ @ROLL_ASM@<br>
+@@ -58,7 +58,7 @@ popt_OBJS=3Dpopt/findme.o&nbsp; popt/popt.o&nbsp; popt/p=
optconfig.o \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; popt/popthelp.o popt/poptparse.=
o popt/poptint.o<br>
+ OBJS=3D$(OBJS1) $(OBJS2) $(OBJS3) $(DAEMON_OBJ) $(LIBOBJ) @BUILD_ZLIB@ @B=
UILD_POPT@<br>
+ <br>
+-TLS_OBJ =3D tls.o syscall.o util2.o t_stub.o lib/compat.o lib/snprintf.o =
lib/permstring.o lib/sysxattrs.o @BUILD_POPT@<br>
++TLS_OBJ =3D tls.o syscall.o android.o util2.o t_stub.o lib/compat.o lib/s=
nprintf.o lib/permstring.o lib/sysxattrs.o @BUILD_POPT@<br>
+ <br>
+ # Programs we must have to run the test cases<br>
+ CHECK_PROGS =3D rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(=
EXEEXT) \<br>
+@@ -176,19 +176,19 @@ getgroups$(EXEEXT): getgroups.o<br>
+ getfsdev$(EXEEXT): getfsdev.o<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $=
@ getfsdev.o $(LIBS)<br>
+ <br>
+-TRIMSLASH_OBJ =3D trimslash.o syscall.o util2.o t_stub.o lib/compat.o lib=
/snprintf.o<br>
++TRIMSLASH_OBJ =3D trimslash.o syscall.o android.o util2.o t_stub.o lib/co=
mpat.o lib/snprintf.o<br>
+ trimslash$(EXEEXT): $(TRIMSLASH_OBJ)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $=
@ $(TRIMSLASH_OBJ) $(LIBS)<br>
+ <br>
+-T_UNSAFE_OBJ =3D t_unsafe.o syscall.o util1.o util2.o t_stub.o lib/compat=
.o lib/snprintf.o lib/wildmatch.o<br>
++T_UNSAFE_OBJ =3D t_unsafe.o syscall.o android.o util1.o util2.o t_stub.o =
lib/compat.o lib/snprintf.o lib/wildmatch.o<br>
+ t_unsafe$(EXEEXT): $(T_UNSAFE_OBJ)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $=
@ $(T_UNSAFE_OBJ) $(LIBS)<br>
+ <br>
+-T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o util1.o util2.o t_stub.=
o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o<br>
++T_CHMOD_SECURE_OBJ =3D t_chmod_secure.o syscall.o android.o util1.o util2=
.o t_stub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o<br=
>
+ t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $=
@ $(T_CHMOD_SECURE_OBJ) $(LIBS)<br>
+ <br>
+-T_SECURE_RELPATH_OBJ =3D t_secure_relpath.o syscall.o util1.o util2.o t_s=
tub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o<br>
++T_SECURE_RELPATH_OBJ =3D t_secure_relpath.o syscall.o android.o util1.o u=
til2.o t_stub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.=
o<br>
+ t_secure_relpath$(EXEEXT): $(T_SECURE_RELPATH_OBJ)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(LDFLAGS) -o $=
@ $(T_SECURE_RELPATH_OBJ) $(LIBS)<br>
+ <br>
+diff --git a/android.c b/android.c<br>
+new file mode 100644<br>
+index 00000000..572f5f21<br>
+--- /dev/null<br>
++++ b/android.c<br>
+@@ -0,0 +1,82 @@<br>
++/*<br>
++ * Android-specific helpers.<br>
++ *<br>
++ * openat2() usability probe<br>
++ * -------------------------<br>
++ * openat2(2) is invoked directly via syscall() because the C library lac=
ked a<br>
++ * wrapper for it for years.&nbsp; Under a seccomp filter that uses<br>
++ * SECCOMP_RET_TRAP -- as the Android application sandbox does -- a disal=
lowed<br>
++ * syscall raises SIGSYS and *kills the process* rather than failing with=
<br>
++ * ENOSYS, so inspecting errno after the call is too late.&nbsp; We there=
fore probe<br>
++ * openat2() once, behind a temporary SIGSYS handler, so a trapped syscal=
l is<br>
++ * caught and secure_relative_open_linux() can fall back to the portable<=
br>
++ * per-component O_NOFOLLOW resolver instead of the whole process dying.<=
br>
++ *<br>
++ * This is only needed on Android, so the probe body is compiled only the=
re.<br>
++ * __ANDROID__ is defined by Bionic's headers and reflects the *target*, =
not<br>
++ * the build host: it is set both for NDK cross-compiles (from a Linux/ma=
cOS<br>
++ * host) and for native Termux builds, and is unset on every other platfo=
rm.<br>
++ * That makes it a reliable compile-time switch for cross builds -- there=
 is<br>
++ * nothing to detect in configure.&nbsp; Everywhere else openat2() is nev=
er<br>
++ * seccomp-trapped to SIGSYS (a missing syscall simply returns ENOSYS), s=
o<br>
++ * openat2_usable() collapses to a constant 1 with no run-time cost.<br>
++ */<br>
++<br>
++#include &quot;rsync.h&quot;<br>
++<br>
++#if defined(__ANDROID__) &amp;&amp; defined(HAVE_OPENAT2)<br>
++<br>
++#include &lt;setjmp.h&gt;<br>
++#include &lt;sys/syscall.h&gt;<br>
++#include &lt;linux/openat2.h&gt;<br>
++<br>
++static sigjmp_buf openat2_probe_env;<br>
++<br>
++static void openat2_probe_handler(int signo)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void)signo;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; siglongjmp(openat2_probe_env, 1);<br>
++}<br>
++<br>
++#endif<br>
++<br>
++int openat2_usable(void)<br>
++{<br>
++#if defined(__ANDROID__) &amp;&amp; defined(HAVE_OPENAT2)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static int cached =3D -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sigaction sa, old_sa;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cached &gt;=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return cached;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;sa, 0, sizeof sa);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sa.sa_handler =3D openat2_probe_handler;<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sigemptyset(&amp;sa.sa_mask);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sigaction(SIGSYS, &amp;sa, &amp;old_sa=
) !=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return cached =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sigsetjmp(openat2_probe_env, 1) !=3D 0=
) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* SIGSYS delivered: openat2 is blocked by a seccomp filter. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; cached =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct open_how how;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int fd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memset(&amp;how, 0, sizeof how);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; how.flags =3D O_RDONLY | O_DIRECTORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; how.resolve =3D RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fd =3D syscall(SYS_openat2, AT_FDCWD, &quot;.&quot;, &amp;how, sizeof=
 how);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (fd &gt;=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Usable only if the probe actually succeeded.&nbsp; Any failure --<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * ENOSYS (kernel &lt; 5.6), a seccomp SECCOMP_RET_ERRNO denial<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * (EPERM/EACCES), or EINVAL (RESOLVE_BENEATH unsupported) --<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * means we must fall back to the portable O_NOFOLLOW walk. */<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; cached =3D fd &gt;=3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sigaction(SIGSYS, &amp;old_sa, NULL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cached;<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
++#endif<br>
++}<br>
+diff --git a/configure.ac b/configure.ac<br>
+index 1d9b3713..123480e1 100644<br>
+--- a/configure.ac<br>
++++ b/configure.ac<br>
+@@ -331,6 +331,28 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[ ]], [[return 0;=
]])],<br>
+ CFLAGS=3D&quot;$OLD_CFLAGS&quot;<br>
+ AC_SUBST(NOEXECSTACK)<br>
+ <br>
++dnl Only define HAVE_OPENAT2 when both the &lt;linux/openat2.h&gt; header=
 and the<br>
++dnl SYS_openat2 syscall number are present.&nbsp; syscall.c uses openat2(=
RESOLVE_BENEATH)<br>
++dnl for the secure resolver on Linux 5.6+; defining it unconditionally br=
oke the<br>
++dnl build on older kernels/headers that lack the header (#924, #905, #900=
).<br>
++AC_CACHE_CHECK([for openat2],rsync_cv_HAVE_OPENAT2,[<br>
++&nbsp;&nbsp;&nbsp; AC_COMPILE_IFELSE([<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_LANG_PROGRAM([[<br>
++#include &lt;sys/syscall.h&gt;<br>
++#include &lt;linux/openat2.h&gt;<br>
++]], [[<br>
++struct open_how how;<br>
++how.resolve =3D RESOLVE_BENEATH;<br>
++return SYS_openat2 + (int)how.resolve;<br>
++]])<br>
++&nbsp;&nbsp;&nbsp; ],<br>
++&nbsp;&nbsp;&nbsp; [rsync_cv_HAVE_OPENAT2=3Dyes], [rsync_cv_HAVE_OPENAT2=
=3Dno])<br>
++])<br>
++if test x&quot;$rsync_cv_HAVE_OPENAT2&quot; =3D x&quot;yes&quot;; then<br=
>
++&nbsp; AC_DEFINE([HAVE_OPENAT2], 1,<br>
++&nbsp;&nbsp;&nbsp; [Define to use Linux openat2(RESOLVE_BENEATH) in secur=
e_relative_open where available.])<br>
++fi<br>
++<br>
+ # arrgh. libc in some old debian version screwed up the largefile<br>
+ # stuff, getting byte range locking wrong<br>
+ AC_CACHE_CHECK([for broken largefile support],rsync_cv_HAVE_BROKEN_LARGEF=
ILE,[<br>
+diff --git a/syscall.c b/syscall.c<br>
+index 25c92aac..f26b144d 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -33,7 +33,7 @@<br>
+ #include &lt;sys/syscall.h&gt;<br>
+ #endif<br>
+ <br>
+-#ifdef __linux__<br>
++#if defined(__linux__) &amp;&amp; defined(HAVE_OPENAT2)<br>
+ #include &lt;sys/syscall.h&gt;<br>
+ #include &lt;linux/openat2.h&gt;<br>
+ #endif<br>
+@@ -1688,7 +1688,20 @@ static int path_has_dotdot_component(const char *pa=
th)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+ }<br>
+ <br>
+-#ifdef __linux__<br>
++#if defined(__linux__) &amp;&amp; defined(HAVE_OPENAT2)<br>
++/* openat2(RESOLVE_BENEATH) via the raw syscall, gated on openat2_usable(=
) so a<br>
++ * seccomp filter that traps openat2 with SIGSYS (e.g. the Android sandbo=
x)<br>
++ * makes us report ENOSYS and fall back rather than killing the process.&=
nbsp; Only<br>
++ * the openat2 call is gated here; a plain openat() is always safe to att=
empt. */<br>
++static int openat2_beneath(int dirfd, const char *path, const struct open=
_how *how)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!openat2_usable()) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D ENOSYS;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return syscall(SYS_openat2, dirfd, path, h=
ow, sizeof *how);<br>
++}<br>
++<br>
+ static int secure_relative_open_linux(const char *basedir, const char *re=
lpath, int flags, mode_t mode)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct open_how how;<br>
+@@ -1717,12 +1726,12 @@ static int secure_relative_open_linux(const char *=
basedir, const char *relpath,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; memset(&amp;bhow, 0, sizeof bhow);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bhow.flags =3D O_RDONLY | O_DIRECTORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bhow.resolve =3D RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D syscall(SYS_openat2, AT_FDCWD, basedir, &amp;bhow, sizeof b=
how);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D openat2_beneath(AT_FDCWD, basedir, &amp;bhow);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (dirfd =3D=3D -1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retfd =3D syscall(SYS_openat2, dirfd, relp=
ath, &amp;how, sizeof how);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retfd =3D openat2_beneath(dirfd, relpath, =
&amp;how);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDCWD)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; close(dirfd);<br>
+@@ -1788,7 +1797,7 @@ int secure_relative_open(const char *basedir, const =
char *relpath, int flags, mo<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-#ifdef __linux__<br>
++#if defined(__linux__) &amp;&amp; defined(HAVE_OPENAT2)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; int fd =3D secure_relative_open_linux(basedir, relpath, fl=
ags, mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* ENOSYS =3D kernel &lt; 5.6 doesn't have the syscall eve=
n though<br>
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb<br>
index e2fe0128d5..47e195ef24 100644<br>
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
@@ -20,6 +20,12 @@ SRC_URI =3D &quot;<a href=3D""></a>https://download.samb=
a.org/pub/${BPN}/src/${BP}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-29518_p2.patch">file://CVE-2026-29518_p2.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-29518_p3.patch">file://CVE-2026-29518_p3.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-29518_p4.patch">file://CVE-2026-29518_p4.patch</a> \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43619_p1.patch">file://CVE-2026-43619_p1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43619_p2.patch">file://CVE-2026-43619_p2.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43619_p3.patch">file://CVE-2026-43619_p3.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43619_p4.patch">file://CVE-2026-43619_p4.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43619_p5.patch">file://CVE-2026-43619_p5.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43619_p6.patch">file://CVE-2026-43619_p6.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;2924bcb3a1ed8b551fc101f740b9f0fe0a202b11=
5027647cf69850d65fd88c52&quot;<br>
&nbsp;<br>
-- <br>
2.35.6<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5902B0D383F9119AB84AF482CFC62PH0PR11MB5902namp_--

