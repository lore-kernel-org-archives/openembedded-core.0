Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63461C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:01:58 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6417.1784545308025074965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jDFdsDzT;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8446; q=dns/txt;
  s=iport01; t=1784545308; x=1785754908;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=asq14NTfuegf/XaDizgy27iGDpzxaRZZAQbLZkrYnrI=;
  b=jDFdsDzTIlBuiUbha0nBLLSZS8vR+9/1juG5DL1jOW/LPbH0jMD2Oqe0
   u7phuPFHRT2wC+j55/3/AfRzH4J1aBcl1frdkiaHbCNbQxhh/XMeY/53H
   d2slHQkxEeIxY31S/11ywE2/T9JOylADtxXrhFpn92EKNfSdGyXoGpLaf
   RuWibxyOeqZMEtL6HsAdAcAJdGAlBsSr1c45Zx04AxWLeqS5A91ftjmRR
   NlG7TcekoSesfYHzfiPT8W4/2iKQFIoY43O6NCq1CQWy8rXVXA0I/LQvx
   rxiGMp7GrYsXQUmTqZm5wtPTFK26xQ4JTxoEpu62Eipoa7L/NZsinI2Gd
   w==;
X-CSE-ConnectionGUID: dWYHw37qRauwCuTVEwsOsQ==
X-CSE-MsgGUID: t3rIE61CT22Z1usXSP7WIw==
X-IPAS-Result: =?us-ascii?q?A0CUAwC+/l1q/5IQJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UmIIwOFK4ZYgiSXRIZXgXQKDwEBAQ0BAS4BDhQEAQGFBQKNUwImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPAQyGWgEBAQEDARFcGwIBC?=
 =?us-ascii?q?BEEAQEBLicKHQgCBBMIGoJhgh0WQQMBAg6wWgGBPQKKKniBNIEB4DcVgTiFP?=
 =?us-ascii?q?4McAQEqgTWCXYEiGAGEfCcbG4FygVeCaT6BBYFcAQMBgTQrhBOCMASCInoSG?=
 =?us-ascii?q?4NagWGMFlJyIgMmMywBVRMXCwcFgSNDAyovLSNLBS0dgSMhHRcWHlgbBwUSI?=
 =?us-ascii?q?CpBRSMDTz84C0MFgVcCgghOIx8DOX+BMHVKdy1qAhAXSjgkg0sCBwMLbT03F?=
 =?us-ascii?q?BkDBIE1BYxQB1sjgUeCMgRLgUSjJ4F8oXsKKIN1jCGNPogyF4QEgVeLPZlUm?=
 =?us-ascii?q?QgjjWeWAYUNAgQCBAUCEAEBBoFoPIFZcBU7gmcJCkAZD5c2xnt5AgE6AQEHA?=
 =?us-ascii?q?gcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:wJYV5BLTlvgW0AKgG9mcuVQyDhhOgF28FgcR7pxijKpBbeH+uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:75152qlPif4h1r0tzhJoVHXo5gzZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfDGzUa/bYM2ejfohwOt+x9ktUsZCBmNIwHAdu+XgwRltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9HuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYEny8ZoWj5Xz
 /UFNxsQUi6umPmR24vuH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIWFJoHQH5gOwy50o
 ErapH7YL09DH+DFkwjc72mcvdeQogLkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dbDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:NB3pwKrX44Mv5q4g4s1FmWsaV5siLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H+BEDhex/hHO1OkPcs1NaZLUXbUQSTXfpfBOfZslnd8mjFh5JgPM
 RbAudD4b/LfCJHZK/BiWHSfadDsby6GeKT9JrjJhxWPGdXgtRbnn9E43GgYzRLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRhOerAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyGIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 F2NiOixthq5CH77WDADuvzJlZXf42P0DwfeNso/jliuE0lGeZsRMIkjRto+dw7bVPHAcgcYZ
 lT5YfnlbdrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomNrdLQT9TpE+CTZ9U1wrq7UR/R/lp
 f5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZeo60l/22tfKCY8OlamXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKhizi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHcZpY5ummnZ5rAQD2KwXsrKtmpwwE68vl5CrFx
X-Talos-CUID: 9a23:isQoN2wXK3WUkFuc1m0jBgUYJfEFbSaC1U3ZPlCTFFpXZaKObkSprfY=
X-Talos-MUID: 9a23:yFwP5QVwaDKaSrrq/CO3nhBPap5D3/70OhkQiqU9g5a7FDMlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:01:47 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id E506118000200
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:01:46 +0000 (GMT)
X-CSE-ConnectionGUID: uUKI6IMWSFyB97v/pzz3Ng==
X-CSE-MsgGUID: 4YDGjiReShajf+/mvS/FeA==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="60612470"
Received: from mail-southcentralusazon11011008.outbound.protection.outlook.com (HELO SN4PR0501CU005.outbound.protection.outlook.com) ([40.93.194.8])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:01:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6/2xyRsyPAIkvQi7n4/4qq6hs6AZPfgE7b52Zr3xWUThNLD3oLeDBPalSCQ17tfIsgI6juQK20u+BTPPHmcxrI24UkXdHE/TLrfE9lOWuAkmmSn5N55J2hVFddtLCeu2dEB+L5bCIdpob66af2IzJzH8U1gw2hQrkT3ThvQy0CBGRm4gQSUnuSdpSDq2jQLZLlNOTpX9mDjY3d75Q5TUhfQvUAMYQNsLYb5j7zbrKE/NWvEt1VP8AczwlTux6NUARm18veC0fxUpYj3t+2b/MP+8aaOC184PNpLQPp6Er3735l7iW71OJZU9eU9DDF1H7iH9H0v98MobyJ+Qbek4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asq14NTfuegf/XaDizgy27iGDpzxaRZZAQbLZkrYnrI=;
 b=hqG6zuPrt9NiWfXyNa0BwL5GBVDMmubBWpK86cdccXLxcy/m8k1Clv4ob1n7QqLjpamvR5WrM/Vz9jmdiUy5fu1skIEsQ3QW2G8d2VQ4DSwd6/PquV+ZQnfzC869dJYGxIeyXB5B5K40AkH88dlocrcaWK5xCJ+FW1HqCJFklTdJF5QIwH4v4I4ksFnGoY4G5LvOr3STH2Qh4oUGnoIBT+DIgUcpHQAuXMRm1g+iyxSzGaYXsy4Ouy1PxxGsoewhRzaac8FRCAKy+VKK2CKQ01Tdz1d6BOO06qr+ZglFXGmSy+E9yhEELOoBuo+mYzdX7NRg9H8Fr7qCMHmcSoUK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 DM3PPFFCD58DF03.namprd11.prod.outlook.com (2603:10b6:f:fc00::f63) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 11:01:44 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 11:01:44 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose] [PATCH 5/6] curl: fix CVE-2026-6429
Thread-Topic: [OE-core] [wrynose] [PATCH 5/6] curl: fix CVE-2026-6429
Thread-Index: AQHdB8lNDiouPU2uMkm3iR0ajacWg7Zbj94AgAkzKACAEE9pgIABSy94
Date: Mon, 20 Jul 2026 11:01:44 +0000
Message-ID: 
 <DM4PR11MB61897998C922ECDF463815A2C4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260629131453.1077612-1-adongare@cisco.com>
 <20260629131453.1077612-5-adongare@cisco.com>
 <DJOU3MGL8GSH.27D0R685LL2P1@smile.fr>
 <577721.1783577282244784131@lists.openembedded.org>
 <DK2N7XBD8QIZ.33JH3NJ89PGYI@smile.fr>
In-Reply-To: <DK2N7XBD8QIZ.33JH3NJ89PGYI@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|DM3PPFFCD58DF03:EE_
x-ms-office365-filtering-correlation-id: 1ca1224e-81ed-4e58-bdd9-08dee64e492e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|8096899003|38070700021|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 0nmL6iLzE1DpbsGSJPukltRDlb5Eqm/vElmRXfeY4s9iUy5HDYIqBT9luS8Z8tfT1h+tiCIRUdTye4/sVzAFFYExdEwdmQZgLPxiEUU5NDTSgLx0sTatpsSrxe7zx79RRonnRs599rpaBHYeJdZKOHhE1iMijvnd79FE/vxTZBmaljkT8JxJ3adyjgB3kUH0TGjRtpFTWz/f9TWg9cWx5YF7sEzfoucc0lPca23/3zIlgNh8BbIC+U3KoCkHfhww+RqWYbfKUO7mu/rW1emYpJnaagnJx0rvv2lTxq1X3wH2VOXqk90kMhBKoHDEUuE0SMVYN6U5AuDHicta2tbzeboRjPY06eNLIC0WyTN/OWLxsqV9s0Muew6P8tiJyCmrsm7APb4FDPEOZ+f1Ez4NRDWkzsVIEykL8ptEqVp77GeEun+dl6vRlt0ZhTjKl0cknsefz8Y62WI82h++GWUNGsdaHg92wiN0l5mz/yT/4JyNZEGvim+lbq+8Bvv7fEwNd+HHQWn6zCiK6+tiqlipsk+P1bx1nngUnUzwAqm5sWi9Ec4cnlet3aSvqndBYohuEF64JUsNg86AeweZN+kVEs1NCJHjH0uZyWvi9VusN1HedZF4qte0kDOZrE0xEvoxvWpt/Nk3wl6XnRZLU+rtBw4leQRS/7tt8WmjxvV0iSA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(8096899003)(38070700021)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?J4BkbFlq9hDEU6hXEV+s0MNlgSNFXGv3vYjvEu+ws6+QsPmTw3T9tUHABq?=
 =?iso-8859-1?Q?kNKvkwmZN5dQv07sS9tv5V2kpTx1Uz8oQ/7F4bE64msIcoH/Ji6zY9NrDQ?=
 =?iso-8859-1?Q?5+T5pqokSbk5+gPMQZDs/f0ttwvJL32qwORhsQ3lUPPtysw6NKQE4hmVBV?=
 =?iso-8859-1?Q?wmYLkGTwVrzUqPwUHZXLXrXk7nit3A/Otx9lgibTsONQDcB5jjDtqsgDhZ?=
 =?iso-8859-1?Q?mC6POTh4X7b8hYZLml8Nl992leTJXQwGKpApWzN7bXtNQ+z9DC+6Dh+dCP?=
 =?iso-8859-1?Q?neye9+A45NeTaVfTGGunG/5/Izn0r2mYKpCI6sFEOEucrBGK3OCthuQLLc?=
 =?iso-8859-1?Q?qpcc4cX5kyviiy07W9Ku+r/e+wZKCxOplNNmHakovjv4BfxvWTePimaYCm?=
 =?iso-8859-1?Q?MepliYRF3jdCErjqiB8ZLlg/vNnH/CufsXgC87HVTehx7sNdgG5yXdoYyD?=
 =?iso-8859-1?Q?q0J33ekQFqUCoWh+nCE6jqoDEK0++zL9TiB+UcYoyLxM0iojnewgX5CkZG?=
 =?iso-8859-1?Q?K+GyiTUKNbtzhYwHhiTPC5U5QZzVgHwxgqtKLmqYAxcIqUzzXVKaTNqOz0?=
 =?iso-8859-1?Q?G52w1K06EQZayF8/oe4SSrcFZ+tABsYbglL4byv/YNTxYpHa9HlWk5jr0v?=
 =?iso-8859-1?Q?oKYh1W/MaBGjsOcwiLgsDmyX5isufrEpbx9MtqPmXx2hG8tLLzDHejiE78?=
 =?iso-8859-1?Q?bK5DIMgA1wJrjAl0tkZFW/R/mEo7dBelk1EROMPHVNGu6/eVHCzWNF7o3l?=
 =?iso-8859-1?Q?pdJ4yZVbjgNWJjjCYPzlRIj+cf9lPCJpsJgHPDxJx5+nwLvFpV0nVPJEJN?=
 =?iso-8859-1?Q?b492PKV9LsOlZP4Bp0Xj0eaj0IVywBaFuvWA548ALiz2tMO4uYJIE3aJfy?=
 =?iso-8859-1?Q?REUN/w7Ta/Wh5Ug88EdPYT1dvWxURZeVQkbcMRXx/auN96ceJFCAES+nAE?=
 =?iso-8859-1?Q?pxzOuqhfahkJ1oJO3n1qnzaRrIxxQuGUj10fjB49I43yByXwagycUKTCyZ?=
 =?iso-8859-1?Q?Kyl9JWRg1OGh5ck7psUH8nNPEyZ1zxhwAXFUIYZLKlpMKcsLsXGQNe9cjv?=
 =?iso-8859-1?Q?5lb8n6dzvLTM81FpLnLCdZBcRzsZargX7sEclfHP3GIM0ib006i+TfQmMh?=
 =?iso-8859-1?Q?5y5cHEsX5JYDihgzO8cTunthlony2t3FeQtBDR/frwGLQ8frgJrJme+qJB?=
 =?iso-8859-1?Q?BRZFTWWcPY+tegU+wwwjVLXh2ENEbd3SAxnmYeBE7IeB+neAlTF11dI9w+?=
 =?iso-8859-1?Q?fumZLvGxpajmMVzcnxUnLSsJxk/rZn7E3udzLUYWyXxkNWHFsJkndy7Kad?=
 =?iso-8859-1?Q?fqPGvXs4kZbnaJGBiErzEF1S33U8bJush8tcdaPesUDb6wxa1VNEWvuE9L?=
 =?iso-8859-1?Q?8WMz0gl6A6EYkJ02UlZ/kNJcbI2KsgkJSRepCmiqJBVbSuowqOhY87YsVX?=
 =?iso-8859-1?Q?176CnuvZD8WvNaEAzYLVUMeastPpK/bgMvUFH1nLFW5OKQoIdAwU9bg1gA?=
 =?iso-8859-1?Q?4JmeyFXv91KMf2a5Kta9KEk9LT3yWFzXBP6DKHN/BqNh4/2IuPUnA6i+Wy?=
 =?iso-8859-1?Q?xUgCu2+NRUVyKkF2S+K5yFH/yNGIPpNqi2IVyYUablvAO//CDkO68IRwka?=
 =?iso-8859-1?Q?Bw1Q4QqCvoOZe71gJXN+N3zwJVNDfZ0G9GrrdNJ4pjOdNJK+3/GZCQzwfP?=
 =?iso-8859-1?Q?mh8F4d6S+kHsRATZKP+8bTm0TkRgCc547LK7UBCvxW9ROXItM1iuDh5xWn?=
 =?iso-8859-1?Q?dLLnXJkfJMclCbq7gGEZEALAcmqS0lKbRddapRM5ZQ3lFE?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61897998C922ECDF463815A2C4C32DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	EhoMgVkfwHLmXuz+l78RxNNOaQTfzncPC/w0C/tkqizc5dslFy/7051+DwT9voOJOMGaaat1W2kJdvh+VcM6LRBTlurjSRY1eWGnb6dPsIjVx8Uq3s5b5bKP4PBVOlYaLdeWuS/+kwubR0cS9kQ32bwfEaLDht8PIxtmW4xdjUJNUEcCsJN6/bB8A09TJ139ue9vmvDppnvdhuNej4WqN+Mtx9NdCcFAsNaJOjhAtoVBAD0o5EpFH5WqDTk+1EMUcFZbGxXllZ+AeCbsCBOLQxlOsgQvKRyum2GoYkGBv48L2GL9aAzusdG2ZDHYO2BMciD/iURQ8GewDcC1cdVeuQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca1224e-81ed-4e58-bdd9-08dee64e492e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 11:01:44.2004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6yamk40MLYdfs8ICC2y1SlDKXWGAb+i7rOUG2pkTE+4AJy0+PvLkvtdgB/xC6hj/+RcMbaGOcA6klHfF9/hng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFFCD58DF03
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-5.cisco.com [173.37.147.253];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241358

--_000_DM4PR11MB61897998C922ECDF463815A2C4C32DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Anil is currently on medical leave, so I have taken over this activity and =
submitted the updated fresh patch series incorporating all the requested ch=
anges.
Please find the corresponding upstream mailing list submissions below:

  1.
openembedded-core@lists.openembedded.org | [wrynose][PATCH 1/5] curl: ignor=
e CVE-2026-4873<https://lists.openembedded.org/g/openembedded-core/topic/12=
0356772>
  2.
openembedded-core@lists.openembedded.org | [wrynose][PATCH 2/5] curl: fix C=
VE-2026-5545<https://lists.openembedded.org/g/openembedded-core/topic/12035=
6773>
  3.
openembedded-core@lists.openembedded.org | [wrynose][PATCH 3/5] curl: fix C=
VE-2026-6253<https://lists.openembedded.org/g/openembedded-core/topic/12035=
6774>
  4.
openembedded-core@lists.openembedded.org | [wrynose][PATCH 4/5] curl: fix C=
VE-2026-6429<https://lists.openembedded.org/g/openembedded-core/topic/12035=
6780>
  5.
openembedded-core@lists.openembedded.org | [wrynose][PATCH 5/5] curl: fix C=
VE-2026-7168<https://lists.openembedded.org/g/openembedded-core/topic/12035=
6782>

Regards,
Deepak

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Sunday, July 19, 2026 8:42 PMhi
To: Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco) <s=
udumbha@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-=
core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose] [PATCH 5/6] curl: fix CVE-2026-6429

On Thu Jul 9, 2026 at 8:08 AM CEST, Sudhir Dumbhare via lists.openembedded.=
org wrote:
> Hi Yoann,
> Thank you for the review.
>
> I am working on same and will submit an updated patch series.
>
> Thanks & Regards,
> Sudhir

Gentle ping for a v2 of this series. It holds a patch on scarthgap.

Regards,
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB61897998C922ECDF463815A2C4C32DM4PR11MB6189namp_
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
Anil is currently on medical leave, so I have taken over this activity and =
submitted the updated fresh patch series incorporating all the requested ch=
anges.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Please find the corresponding upstream mailing list submissions below:</div=
>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://list=
s.openembedded.org/g/openembedded-core/topic/120356772" id=3D"OWA31585e31-0=
58f-2784-13fa-50263052f4f3" class=3D"OWAAutoLink">openembedded-core@lists.o=
penembedded.org | [wrynose][PATCH 1/5] curl:
 ignore CVE-2026-4873</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120356773" id=3D"OWA09e30d52-2a35-17f2-15b9-6cd90cea73c=
5" class=3D"OWAAutoLink">openembedded-core@lists.openembedded.org | [wrynos=
e][PATCH 2/5] curl: fix CVE-2026-5545</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120356774" id=3D"OWAd58e0d5f-afd2-69ab-9f95-368252aedb2=
e" class=3D"OWAAutoLink">openembedded-core@lists.openembedded.org | [wrynos=
e][PATCH 3/5] curl: fix CVE-2026-6253</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120356780" id=3D"OWAd8272a7e-7904-7138-2253-5ace200efa7=
1" class=3D"OWAAutoLink">openembedded-core@lists.openembedded.org | [wrynos=
e][PATCH 4/5] curl: fix CVE-2026-6429</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120356782" id=3D"OWAbc8a627c-49be-14c0-87fd-d6e6c727b34=
c" class=3D"OWAAutoLink">openembedded-core@lists.openembedded.org | [wrynos=
e][PATCH 5/5] curl: fix CVE-2026-7168</a></div>
</li></ol>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Sunday, July 19, 2026 8:42 PMhi<br>
<b>To:</b> Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Ci=
sco) &lt;sudumbha@cisco.com&gt;; openembedded-core@lists.openembedded.org &=
lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [wrynose] [PATCH 5/6] curl: fix CVE-2026-6429=
</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Thu Jul 9, 2026 at 8:08 AM CEST, Sudhir =
Dumbhare via lists.openembedded.org wrote:<br>
&gt; Hi Yoann,<br>
&gt; Thank you for the review.<br>
&gt;<br>
&gt; I am working on same and will submit an updated patch series.<br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt; Sudhir<br>
<br>
Gentle ping for a v2 of this series. It holds a patch on scarthgap.<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB61897998C922ECDF463815A2C4C32DM4PR11MB6189namp_--

