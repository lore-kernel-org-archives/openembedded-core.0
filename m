Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23A8CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:54:19 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15402.1792130058228076610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LIfn6HOa;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7858; q=dns/txt;
  s=iport01; t=1792130058; x=1793339658;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=vfK4VdjnUGmESO1BGkEqk8MLwcmmjgaBaq30FZ+Qjcg=;
  b=LIfn6HOaU1A+v5BGTWSWG2bYGfkYTn9fespXRAM8zonvnZZzyFBniru/
   3WqRWr+Y6duoC2KCWYmaJGjxnINTsz2ZGuKEPtK2wv8esj+rxhJz1/I20
   S5C9l2ALOurY20PrDTyvqjBiZfjibOCQAZG/k3XTQFEW+vs0wBYd7hhC5
   PV2xfz8qYye770XCbP3cphiLy5f5gEegJxNXlOfMUd3BXQXtW+XVmC/QT
   rEPQiGAGhFGXOnlIQKH3bxJtIFAtyWnPRyf8Jvq2qCJzRlor0vi9ROIBR
   YdjX1fNkElXRKxIjj1JjhZqKaQEF1GRlKHNmT2RV5PgTiWsz3cj7rFvpx
   w==;
X-CSE-ConnectionGUID: rvVfPfvzRNCRfIyIf+LvGA==
X-CSE-MsgGUID: wcZqv9NhTUyEjmflNqaEZw==
X-IPAS-Result: =?us-ascii?q?A0AGBACDu9Fq/5IQJK1agS6BK4E9ATBTgQkCgRESSYgjA?=
 =?us-ascii?q?4UrhliCIQOeHIF0Cg8BAQEOAS4BCBoEAQGFBQKOFQImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGUAyQEgEBAQEDASYkAT0CAQgRBAEBL?=
 =?us-ascii?q?ycKFwEFCAIEEwiCe4IdFkEDAQKyawKKHXiBATOBAYMpAd0SFYE4hUCDHgEBK?=
 =?us-ascii?q?4E1gl2BIxmEfCcbG4FygVeCaT6EChArhBOCMASCInoSG3KBUEqMFYdlUnIiA?=
 =?us-ascii?q?yYzLAFVExcLBwWBJUMDKi8tI0sFLR2BIyEdFxEeWBsGBRIgKkFDXYFaPCMZN?=
 =?us-ascii?q?nqBCV6BKylhAg4XRi4VggcCglSBI10CAUlBDgdFUwklPgUSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxlDgwdBSFRCAILAgkHKW09NxUZAwSBNQWRKAdbHoJlexR6A?=
 =?us-ascii?q?XNQGZM1RY8TjmCVFwoog3aMIo0+iDIXqm+ZCCOodAIEAgQFAhABAQaBaDyBW?=
 =?us-ascii?q?XAVgyIJShkPjmDRfnkCOwIHAgcOAwuRaIF+AQE?=
IronPort-PHdr: A9a23:XsOwHB1S/Zt0mjp6smDPmlBlVkEcU/3cNwoR7N8gk71RN/7l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:KCDkaahequFgrIfGcaoz4LBZX161OBEKZh0ujC45NGQN5FlHY01je
 htvXWyBaP+OYTehe4x1b4iy8BtTuJfUnIQ3HFNr+CAyECtjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUC5Nh5OW9Q5
 8Y+AwoDTwGiiaGS3p2SH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZD/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKFJI3RFJoIxh/wS
 mTu4G/LGw9LEtyj9Cuo8HeigsnWlA7JR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPkfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:OrAwnKr2oNWcdVV9xyUBECwaV5siLNV00zEX/kB9WHVpm5Oj5q
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
X-Talos-CUID: 9a23:x9I2ymHlmus81cRdqmJ96nAaIs47YEf7503eAl6ZByVNVpK8HAo=
X-Talos-MUID: 9a23:nJMi1Am9g7hjL94rnGzwdnp9P/Vx/fWICHwwgLgEvseAEzV5FgWC2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:54:04 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id DB37418000162
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:54:04 +0000 (GMT)
X-CSE-ConnectionGUID: Tcw22crpQ7+kzkBYGrBNWw==
X-CSE-MsgGUID: Zl4dgQXLSHWzXdF+oI21/w==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208,217";a="64783426"
Received: from mail-southcentralusazon11012052.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.52])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDJj03KJ2wZVQFtHUtyccYPXMkU603Rn1wgTwZVG+bC4fnGNAd5n4JNiVLi8LNieBkFqGM2nDpzM2V6tTCi5Eytzz+9iz2eISS0VoGj94dS+gaGJQvFBprSBvfLVml4tjZjzBwuwD6b/pYeI1pFzDBqxdo8sCqOwb16ryg80CEzpsxG+pv0NKg10NdujIc744RV7bpoV3US8z91LxLNUYrYiuOcmzHcvswh/S3h8n9RsJoGfQcmzMOMlcSe/5P6ScnI6kJTOlFiTlzqre0xPjaC1IKjfk+HtjGTjn2BQG9qlcTxx6O/Kr2HJ2aAXopGaIQllb8JnPFvEPLUFW8K24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfK4VdjnUGmESO1BGkEqk8MLwcmmjgaBaq30FZ+Qjcg=;
 b=JK71pF/m97OJlyerVRGWVyCkozARqyb5tXbb23qEzM/byxTV/ZccCA0xV/1W0fBQ8mDLS/v9JemNsIan91ygDwMxQHnKyslnnTSLc/6gQOpG21GuWkK2fsKPpqLLxOgUTJad1HFijZg4Jz+LQSuymYpt2Wcg3zOTSlwowAoEM5Cx7raJBU6jaZxAhswP/qwzxsCX+ZADTGqegUKNNpk2qDwkZFalXJYewk1hfL2yPQXXCGem2pK5SmOMLep/9tnGy31qlHCht6zisWvqFPNEhiyYUVPY4tITszXqsLoLNa8hFEr4EcpZq3mVqlektoSADvWqdOLp65Y2iZZs87YiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) by
 PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Fri, 16 Oct 2026 05:54:03 +0000
Received: from DS0PR11MB7262.namprd11.prod.outlook.com
 ([fe80::fd6:93:e5e2:7f18]) by DS0PR11MB7262.namprd11.prod.outlook.com
 ([fe80::fd6:93:e5e2:7f18%5]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 05:54:02 +0000
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<dkelaiya@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 0/3] python3: upgrade to 3.14.8 and
 backport security fixes
Thread-Topic: [OE-core][wrynose][PATCH 0/3] python3: upgrade to 3.14.8 and
 backport security fixes
Thread-Index: AQHdXTK/VUFhhYLjvUCMKdEctSEDpQ==
Date: Fri, 16 Oct 2026 05:54:02 +0000
Message-ID: 
 <DS0PR11MB726241CD80E20168CAB5917BD69B2@DS0PR11MB7262.namprd11.prod.outlook.com>
References: <20261016053944.3835603-1-dkelaiya@cisco.com>
In-Reply-To: <20261016053944.3835603-1-dkelaiya@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7262:EE_|PH0PR11MB7446:EE_
x-ms-office365-filtering-correlation-id: 68f374fb-2eab-4782-a59e-08df2b49e19a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|11063799006|261009223027099003|22082099003|18002099003|10067099003|6133799003|8096899003|3023799007;
x-microsoft-antispam-message-info: 
 IWEPbKDXGXpJEBnWmC3aVboRquSwaOA0sExcifxFCESItH3Oybzs3xFHIc1mSxvOf9+82UoyaeZhW7mTcc7pKRE0aC+q7EpE8xBA9P63B4SkgDKxntPVVrxREUxiaoC9xnJXdhPQVYDT8dVno5IGGt6IkivwCX0JtDLllLsHFi1A+dX4pkMCltOwVrFCb5J3eRSWGn7G8rh5k/xkh7kslREvXrvi4YxNIV0NJvt42leTwhNu2aDGyQRYSrZ6WmdrVlSoQjhvK3Vlr8uMiK+SnOcItlzZ8rf8E71wwswsl2Q2kjncUfVDKjOAGBNodH4zt4G7WaKSZA/6oocOLE6yPPRtzpQua1DMDeK1OO9lgkSfpIqOBnuHOar+3ACS7nqR8CfT7p008BI60U+6YE97TfYlCjNo6wdZUcCigp1pD7P1Em7Vaf3Gx1v34JZY7KPYO8rtixXCCLt7YM9O4gEzbKjMxVpShvR/27cxlGidPOV3+IFMO8dFQVUJKiKFzcEQSr95sRUlJPiptMYyfuYNtOkoOSNCMgB5z/zv4y/446h9YbF65HHDF4yEB7Qg0bh5DiPml3gVyTioZclA9WndZh34O0gol1RmthV6e1VFjBU4P1Yeqwpj5WlxIL5UnD3wXD7D/XQyRKu+7q1SXmRVMX4Q9AX/gp8AMcOPdroB4KH1UYP7Av5zTFNGax/yx7PWp0dJdDXx/3h5T9h9m8JPN7vq5fWjUXURiiif/g0IaXk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7262.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003)(6133799003)(8096899003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?N9RcbuHXUvR5b9yVm7ZdZ+4LLyoiiaf1W09PgB/xXeu3aP0o7TlYfptYsVu0?=
 =?us-ascii?Q?FUEkYzQPEUaAsXafFBodqg6pMULXuaQ91PxYO/ImCeXCBT1Yxl17bZsLu7+n?=
 =?us-ascii?Q?vQ1ojp2vK5MtyFu537oXglpxnn3yAUPc/Tq/u4mtUBrDWIFji9eqXZ0v0217?=
 =?us-ascii?Q?l81dS8ZWmVfK9B7+JyGftOotwueWGi+uIovJHZ14Qe8BXpR75y5txL099U2X?=
 =?us-ascii?Q?sic1kHVMlQV/vofY/zuDLn9sSNgaQoiW1q3+Jn0ZB8wRBk1QpxrXNVIc9kKy?=
 =?us-ascii?Q?Ss7ulMg6W+qfPlYdE3/EN0snVgzPJS3KZ9QxgdaYDg2QIDuFntiedMh8cBHT?=
 =?us-ascii?Q?MAG5Xg8lkQcxpn9mRz+V4AvSVyO4z2nkDq67pCeeOktlxEKXW0oN1RJ6qO/l?=
 =?us-ascii?Q?f4/f8zrYnpBfj+FD1Fd/7QZV9tsKdtkWBr4tnh1cR3nDCKPNo/Si5M/COXmK?=
 =?us-ascii?Q?Aiy+6zKfb6Ruz8KsSJkWu/MY9MbGvor4OtjWcZi6BoDOmZTeWOvrHY74A85i?=
 =?us-ascii?Q?0zPiTAbTVd+Jcw229tXgNnJqQpVWpqJXnBGLdzPQt+h0fBvWC0nZukSHf7Rl?=
 =?us-ascii?Q?ZU4jWdwBW5pzCthg9MoJ5jCRX0gzp6OZnPdyf6gMuTqbpXuEc1uuzxB8fNTo?=
 =?us-ascii?Q?Phs/xQjLd5Y8dmmTx7581v0r0i/jXMaih1gh9vEX5VXNcF/A01+U6Ls0FfPH?=
 =?us-ascii?Q?hpUztYe/BauyvxPClkDUEl61Z84qkHgGEXg/VSnhwwWfuCSDsK7ApQc4opjw?=
 =?us-ascii?Q?v1JL2zp+/MwE7qBSXJy4h0wWo2cdfJTQX02RIPz9ncEgOICzGUhxTLVBYoYr?=
 =?us-ascii?Q?3HlJhjSKYFM8DEoQVSlwiKV2X/RKBrcEfw0A6+qvfmiKVHDmGlZBadMEBR1y?=
 =?us-ascii?Q?izPGWWoAYv/dSL9TNMTrU8VLPjM4K7XFm2z3m2zv8zf5BF+LUNcd75wYhdjV?=
 =?us-ascii?Q?tA3SfwC9JSTnZLRTKCdHokTnZY4rQuabhKtN7HKIdfMjnAo/+OmvT9fmjgOE?=
 =?us-ascii?Q?4oFZQGLetbpGuwGy9Nw7yg8PRs4H4HVsNzBacHyfozb6k+6mCxRCKdtAISjH?=
 =?us-ascii?Q?73kAODxGmv9+myKzy6l3JTmB1egWTkJOcWbObfMu7Gx+YqeQGKGZCnK0y51E?=
 =?us-ascii?Q?YmlrltFJMHAavPkOWN1pEB0/f62JBZR5MUw3l8pFk7VXooh3qGDeTUtt4yfl?=
 =?us-ascii?Q?i+WHC4wknMLg9l5HIcdb1cVbd9nagzsYE8rYfwLpGlFfkh4d5MiXbsM9fRSk?=
 =?us-ascii?Q?ZWO9dAgurbo6OQ/JfmXC614yPlUM9EpiaUF/7NHfyHYWnVs0NLm4oCDthwn9?=
 =?us-ascii?Q?4f+dhynmlMKqe1QVT7I+9cdNBkSU5AbPYMMKGO4r0DstrQjGejcwCs2L1NgX?=
 =?us-ascii?Q?tK9GFqISCErgaCRd3EV222FRyFGM3r/kB/2zoAQZKEqlTLCLwk7OCiX6acFb?=
 =?us-ascii?Q?plNX2Jdb3XUDrzTVxQKSEEGySpf87BEF72PrFX3Dlbvv7EPwcXqGhBV0J+rW?=
 =?us-ascii?Q?ipWNyveQMaD/GzmE6twZZgSqLy+KF4i+SxANA7N4r85OuhKYilk+WxhVfvPx?=
 =?us-ascii?Q?3PtCv473vvhFt7tHroyeAAJW9ayiU1J5Qh8pMa/Sn0JDIuOut8tKOMyjJJUu?=
 =?us-ascii?Q?rUwkFPFpnTvHWa2yRypDVjA85MreGl17uhlHPvwneJbTGd+l5b8s/mGkYNJv?=
 =?us-ascii?Q?wXvmxKL0X8hF4RqepTzAMmG4JgdI6LMpXZ+xKJ7dlEhV8VAf?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB726241CD80E20168CAB5917BD69B2DS0PR11MB7262namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ktknrA3oCupOQLtqyD3W86083OoicD53N6XXRofuHyjsFW8xgs47hnyewTbAz7XKJKoTFIIkmKMSwXu56sLcJX3QNLOdnDrXT3Qkc2TK5vpDdkdZ4QryYQEnpYKkMtK2A5q1umizw1FJb26ZWUmmZnjPeysEfsxyaiG8jikORVi/+G6X0VWGk6hIlQ/UHiYw5zs99O+Q2fGf/2K1kZ7Wf9i3RPOq3iwP/q98JKw2CkoBq4qrvWLQFiT4hUHfujqIP/KkwUHNFyWvrcONU2YtMANBoAZ8iBU43qd5SIkE+aKU3bxr9xBIE3fgL+m7TPFcB9ajEG/Z+a7QYZ0BlCtXXg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7262.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f374fb-2eab-4782-a59e-08df2b49e19a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 05:54:02.6873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krKqSbCnYjYx9jksg64JiEuHbpt2w+ac+vBFA9TTsC2NlU3qlkzfGqoUl/Ju8hCLoVIGM7YHTLD5IWMa39Mhfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7446
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247959

--_000_DS0PR11MB726241CD80E20168CAB5917BD69B2DS0PR11MB7262namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

The [Internal Review] prefix in the cover-letter subject was
included by mistake. This series is intended for review and
inclusion in Wrynose.

Sorry for the confusion.

Regards,
Darsh
________________________________
From: Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco) <d=
kelaiya@cisco.com>
Sent: 16 October 2026 11:09
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco) <dke=
laiya@cisco.com>
Subject: [Internal Review][OE-core][wrynose][PATCH 0/3] python3: upgrade to=
 3.14.8 and backport security fixes

From: Darsh Kelaiya <dkelaiya@cisco.com>

Upgrade Python 3.14.7 to 3.14.8 on Wrynose and backport fixes for
CVE-2025-15367 and CVE-2026-87910.

The 3.14.8 release addresses CVE-2026-19445, CVE-2026-19553,
CVE-2026-19672, CVE-2026-15310, CVE-2026-15806 and CVE-2026-17084.
The new test_append_limited_history ptest fails with the default
libedit backend on musl. Patch 1 skips only that test on musl while
the libedit interaction remains unresolved.

Patch 2 rejects control characters in POP3 commands to prevent command
injection. This changes behavior for clients whose passwords contain
those characters: they must replace the credentials and handle the new
ValueError as a credential error.

Patch 3 fixes tarfile extraction so a filter rejecting a link fallback
is honored. It also includes the upstream Windows test correction.

Darsh Kelaiya (2):
  python3: fix CVE-2025-15367
  python3: fix CVE-2026-87910

Vijay Anusuri (1):
  python3: upgrade 3.14.7 -> 3.14.8

 .../python/python3/CVE-2025-15367.patch       | 66 +++++++++++++
 .../python/python3/CVE-2026-87910_p1.patch    | 98 +++++++++++++++++++
 .../python/python3/CVE-2026-87910_p2.patch    | 55 +++++++++++
 .../{python3_3.14.7.bb =3D> python3_3.14.8.bb}  |  8 +-
 4 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15367.pat=
ch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-87910_p1.=
patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-87910_p2.=
patch
 rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.14.8=
.bb} (98%)

--
2.35.6

--_000_DS0PR11MB726241CD80E20168CAB5917BD69B2DS0PR11MB7262namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi all,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The [Internal Review] prefix in the cover-letter subject was</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
included by mistake. This series is intended for review and</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
inclusion in Wrynose.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Sorry for the confusion.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Darsh</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Darsh Kelaiya -X (dke=
laiya - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;dkelaiya@cisco.com&gt;<br=
>
<b>Sent:</b> 16 October 2026 11:09<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;dkelaiya@cisco.com&gt;<br>
<b>Subject:</b> [Internal Review][OE-core][wrynose][PATCH 0/3] python3: upg=
rade to 3.14.8 and backport security fixes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<br>
Upgrade Python 3.14.7 to 3.14.8 on Wrynose and backport fixes for<br>
CVE-2025-15367 and CVE-2026-87910.<br>
<br>
The 3.14.8 release addresses CVE-2026-19445, CVE-2026-19553,<br>
CVE-2026-19672, CVE-2026-15310, CVE-2026-15806 and CVE-2026-17084.<br>
The new test_append_limited_history ptest fails with the default<br>
libedit backend on musl. Patch 1 skips only that test on musl while<br>
the libedit interaction remains unresolved.<br>
<br>
Patch 2 rejects control characters in POP3 commands to prevent command<br>
injection. This changes behavior for clients whose passwords contain<br>
those characters: they must replace the credentials and handle the new<br>
ValueError as a credential error.<br>
<br>
Patch 3 fixes tarfile extraction so a filter rejecting a link fallback<br>
is honored. It also includes the upstream Windows test correction.<br>
<br>
Darsh Kelaiya (2):<br>
&nbsp; python3: fix CVE-2025-15367<br>
&nbsp; python3: fix CVE-2026-87910<br>
<br>
Vijay Anusuri (1):<br>
&nbsp; python3: upgrade 3.14.7 -&gt; 3.14.8<br>
<br>
&nbsp;.../python/python3/CVE-2025-15367.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 66 +++++++++++++<br>
&nbsp;.../python/python3/CVE-2026-87910_p1.patch&nbsp;&nbsp;&nbsp; | 98 +++=
++++++++++++++++<br>
&nbsp;.../python/python3/CVE-2026-87910_p2.patch&nbsp;&nbsp;&nbsp; | 55 +++=
++++++++<br>
&nbsp;.../{python3_3.14.7.bb =3D&gt; python3_3.14.8.bb}&nbsp; |&nbsp; 8 +-<=
br>
&nbsp;4 files changed, 226 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-1536=
7.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-8791=
0_p1.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-8791=
0_p2.patch<br>
&nbsp;rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D&gt; python=
3_3.14.8.bb} (98%)<br>
<br>
-- <br>
2.35.6<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB726241CD80E20168CAB5917BD69B2DS0PR11MB7262namp_--

