Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59028C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:29:41 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44428.1784714569443488308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eJKQggDc;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12364; q=dns/txt;
  s=iport01; t=1784714569; x=1785924169;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=bHPxOctzRjrQyLaiWD1RMRwpw5ruiMXLtwoimRqUlzw=;
  b=eJKQggDcieT6l6mPDSf9k1xGMh+9TLKlLzAud46gD8ySGjDv0opvuKPy
   QtR18je6egFE4i3Ls65RFaevuGfcogBrI8exFAzXqJBfCtf7Y2siYTlp8
   NhZ3IdSOrJPXFf1hb/vds5pJt0sfSs7szNDznQvJUgB1l7yoFD4ODBF8d
   XDrYccqv+YZs1ytXYTI84JLSTXVA1goZQqmbg+euYSbyN5Y7of9ehsQVs
   O4CjD+BrntmqLCosHItUEuVnrbarsWfsQ1xk7gzhPzXoF0Y87NhLqLr0j
   5ej7XlgfplSkkxPSxT8jNhdiwKnaYTF0egl6F3PTGKBd8HzaCrYjyHoRO
   A==;
X-CSE-ConnectionGUID: gpm0DCMFQXSWoIRdwB/CYg==
X-CSE-MsgGUID: x7vhoCOGQJ+Kd9h+6V9Q6A==
X-IPAS-Result: =?us-ascii?q?A0B1AwDDlGBq/5IQJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UmIIwOFK4h5A54bgXQKDwEBAQ0CLgEVDQQBAYUFAo1XAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwEROQEbBA4QAgEIE?=
 =?us-ascii?q?QMBAQEBLicKFwEFCAIEAQ0FCBqCYYIdFkEDAQIOtHkBgT0Ciip4gTSBAYMoA?=
 =?us-ascii?q?T8CQ9wKFAGBOIU/gxwBASqBNYJdgSIYAYR8JxsbgXKBV4JpPoEFgVwCAgEXg?=
 =?us-ascii?q?R0rHh6DV4IwBIIiehIbgT+CFD2BJBqMMVJyIgMmMywBVRMXCwcFgSMQMwMqL?=
 =?us-ascii?q?y0jSwUtHXAMJxIPHRcWHlgbBwUSICpBRSMDQz84C0MFgVcCgX9OIx8DOX+BL?=
 =?us-ascii?q?3VKdy1pAQIQF0o4JIIUgToCgQMDC209NwYOGQMEgTUFjH0HWyOCPwFaCgYkA?=
 =?us-ascii?q?SUGT4FdEZMlj1iBfKF7CiiDdYwhjT6IMheFW6URC5h9I41nlTaFWAIEAgQFA?=
 =?us-ascii?q?hABAQaBaDyBWXAVgyIJShkPkiOFE8hSeQsyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:jgWlRRRX4QmeGTZXuWWikaI7XNpso47LVj580XJvo7tKdqLm+IztI
 wmFo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:4sK1zapVrprCPMh5pd23DBXNQFheBmJAZBIvgKrLsJaIsI4StFCzt
 garIBmCPPrbamrxetp2a97l8UNTvJLcyNY2GVM+qCozEy5AouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8kk35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ulvBDli3
 tk2EQA2UReive6p6vWQe+Y506zPLOGzVG8eknhkyTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtJYH49tL/Aan3XfzBGoVSOpbIf6GnIxws327/oWDbQUoPbHZ4FzhrH9
 goq+UzpXQ8aM/e45gOnsVGg1++Mwx2qYdw7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YQLtcnr8QxAzct0
 zdlgu/UONCmi5XMIVq1/baPpjT0Mi8QRVLurwddJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:anKpw6OFkiwVmcBcT8H255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHO1OkPgs1NaZLUbbUQSTXftfBOfZslnd8mjFh5FgPM
 RbAuZD4b/LfCVHZK/BiWHSfadDsby6GeKT9JvjJhxWPHhXgtRbnnxE43GgYzVLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRi+erAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 B2NiOixt9q5CH77WPADuvzJldXf42P0CMfeNso/jhiuE0lGedsRMIkjRho+dw7bVLHAcgcYZ
 pT5YfnlbZrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomJrdLQT9TpF+CTZ9U1wqa7UR/R/lp
 b5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZes60l/22tbKCY8OlaqXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/HBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKh+zi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHjZpY5ummmZ5rAQD2JwXsrKtmuwwE68vl4CrFx
X-Talos-CUID: =?us-ascii?q?9a23=3A+P4D7GpMNsAVQSorhq6nmhXmUc89dyXx51L+Gn+?=
 =?us-ascii?q?DNmFIcrGKYxi7yawxxg=3D=3D?=
X-Talos-MUID: 9a23:o/jEBwZt1i+i1+BTp2DyhDZJE+hRweeNBBEN0ss46vDaHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:02:48 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 4658418000159
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:02:48 +0000 (GMT)
X-CSE-ConnectionGUID: HDXg4ujATWSfkOTd7vrhmQ==
X-CSE-MsgGUID: N9WHHwLnTOa4G9OQMIhxrA==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208,217";a="56336233"
Received: from mail-southcentralusazon11013021.outbound.protection.outlook.com (HELO SA9PR02CU001.outbound.protection.outlook.com) ([40.93.196.21])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kodpr9Z3jKg9bAjniDhsuSn6zLYwf4/0EcEcYxl5BC+p2qqyHLDX8RB0nd01hgodQZS7zgtD7SD7xrgod20z3TnpL6BOgz+mOIu8eIY5IOrG5axUT5xCIkGyM9rHFKE7PI4D7r8u5y1x1aVwVu7KGxhgii0x/7hGVwLCVg/NxPvIsbckYx/Zu2gw3A6DQNwRhkMXWmo28yTX+2PYK08/Rk/1DOGksQne5FbIvA9XshV1mojenolpFz5SxsBRVSKte1Wa06uxikGNLQgWZAguHbxo+sKaoaU4OY3fhWFD4qxf7zg7Qiq5Zbowfo2XuNgzK8tXDDqOw+kO2JLrRHOFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHPxOctzRjrQyLaiWD1RMRwpw5ruiMXLtwoimRqUlzw=;
 b=ty3d5fzztghU0lSlnFdfczsQ3/lKQOHQu1czzfIfyX7D1UZpyJCyluKLU2EHc/sNdLQgrZjEksooM9+egV1bwrBAu4K9iI1hiYlLF4g5gX+ApmNA5lt5xx5ghU4cgwfRmZuXZu9WBvhsADTaCTf0ByQw7RV957/JYVc6ftOHZWLhhKDSaNrai42/m57B74mcSHz6LgoDfk4nMBEqbJJXd5GGVfRSKyndtlDkQvhx3MW5Hczqg3LxGECINNVpiNGtXLs1jqcMnrSXcHT+FPqF9Pva5FF/h9CQ2CrDCrTsKTCh4H7cQgnpAvD239qv+Bgd5n4RgEfSPVsRJqHfrxLfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by SA1PR11MB6807.namprd11.prod.outlook.com (2603:10b6:806:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:02:43 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:02:42 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
Thread-Topic: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
Thread-Index: AQHdGHE0amyDDHyddE616yvy4J0K2bZ4Cg2AgAFGhiU=
Date: Wed, 22 Jul 2026 10:02:42 +0000
Message-ID: 
 <PH0PR11MB761612C89B048D93B36C708ED3C12@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
 <20260720175518.3546447-3-devanshp@cisco.com>
 <DK4BKV6WDHSA.2WEWS3ZC4DO23@smile.fr>
In-Reply-To: <DK4BKV6WDHSA.2WEWS3ZC4DO23@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|SA1PR11MB6807:EE_
x-ms-office365-filtering-correlation-id: f3609daa-d2b9-412d-37eb-08dee7d85f2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|4143699003|11063799006|56012099006|6133799003|8096899003|18002099003|22082099003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 lMPZTh5YIsaPzkWm90FkPOz6yqMIKbbYhPIU1y8YlrW1kOr+zjLlXAy0uG07W49OO7N4/0KSuBU1IGSMZVUbLKhScElCBFS0kceDRftT3RGt+dzIU2KPu2e6pPEf4/OIAOongZ64QYP8ttyUHTZ6pSJV7xjRnfsMMYJeJdJunViROMUC0wsbcDC+jo9xqeqpFc3mKMOfUjJ+5mN0cYcrOkjK/rpbI4RjLNRq7i7qS7b1Z7ROjWamkccKyXvLeoH+dddo4Zn8A4GIgokstcNbq4hpVdzpCk7RL89uO+WVs0iecTm7Ydq2rnvwm7pFuFm9DrB7BTmNWLp8wyP1E6UIesO7noCrffuYs+X2x0KjiELrI9LARH1N0yPyxcgazXeKjaqqGwBlm3Ku4n+a+jxojq+t18nndnqr21Z5Ocjoyxfm1H4l9QUL6jEaGkRfeSyQDO2WP9j5mX4qNd+I7mPCnb7QHzeTFFrr0boShQVVGVw48LmiZ1uA7PAWuBe31nrZ9L/ISJmzJvfYYbpemXsGQnehm9yUjkJCv2JGv+4nPge8Ccw8FibwlNCNPWnqn8Qqm+PdFJKggwiXv6KMRTSBP0KcyFigBUIjzV1rJv9xu5R5ZskUqyIjkK4TCf0yNevcc28Mbwl3YJ/p4eQbj7N0MiAcWUW0m2lCZz1t2uu/1soM5perRocgZTcRrIZwse51M6bu6jFag1zoqFXvYjWUVivKknDWcLsCH5O8/G5HAao=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(6133799003)(8096899003)(18002099003)(22082099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hx+O/HZTEDoCG1ejkzlOTfMBG1Gutn9knXDoiiVSHYL0P+80sG5vSLn1hT?=
 =?iso-8859-1?Q?H7/z8FYHbDZjBobWT9jbuSIGPqbuj7SgWIros6assTvXIF1OUZHq4MBdpT?=
 =?iso-8859-1?Q?Yw0Q6ws8MHL5o2xO6/C+dzZNETrmdSYg84nllT14zcl1dfOfuLb/8VBwUm?=
 =?iso-8859-1?Q?Sj0dJVxdz1AQ1mLJDCPiWxTPhcYMa43kiw/tKK5OlZ9KW7pLGYjnls7D4E?=
 =?iso-8859-1?Q?0x2Gb8hVR5yOzx+2vMjKV8sLg4yZZCAApCpmvk3kFVfcp7/x4JD7iM38EO?=
 =?iso-8859-1?Q?0/rUMTE0tFx25WjtNIo8nKAyVAqpT2JPys1v6OeRiG8S+Cwf2UNtm2jKpV?=
 =?iso-8859-1?Q?MoZx0SsLFCMZUzKmM32nuOdyFSUAG3KT4Xe1xYgVDlxI21V/HTN81jeNUu?=
 =?iso-8859-1?Q?qodkxDSs9fpnPIY/FReoUBFNvYOQVapwzvr+/V8/NjSR5HQ7IFujt4CiPm?=
 =?iso-8859-1?Q?Un1GSRFI9cw4w0eW+Wws/8bbyFUfhij9+S8FgPBNS0+Meh2oo21mF0LD7h?=
 =?iso-8859-1?Q?6jGPFZX0HTfS/gyksuxlLNGoQ2ENdBAmk/B8MlXDJ/9WLPeK3SeKO77xzL?=
 =?iso-8859-1?Q?hjWCNIVTCkLZE+vmL9Tz04QDBe80xgSXk7GQ6cqQRNUkx0PWa+9w72oKaV?=
 =?iso-8859-1?Q?Oj9ehSKVhKm8hrDGkax5ZT1VJ+XGpV4d61qxxdLRSZzEP1NW7k7vRTtLkm?=
 =?iso-8859-1?Q?3I6KfMep0P/pjU0d5BikWBYzRzcw0PGj11QsBfAS9dQbypen9YRl2ABTKA?=
 =?iso-8859-1?Q?uq5Jb3ipENb6aEUS2a8TkGFCc2kHiRF7k8prr7osQ1XkSpJCSHlZvr6AZa?=
 =?iso-8859-1?Q?OBg3BwexeEWMCnsCNwfvUJSfsvcIXY6sqrLee0ibn+5gETuz87CbFxkvDh?=
 =?iso-8859-1?Q?JIBJKf7g7P1bXdks5SP7wHnx7wah9WZpnJGUWDoGzHixCYlfmDoJwHDlCx?=
 =?iso-8859-1?Q?+kHgUECgGdnCekDcCu3PF5501Xixx9Mn78Ktik9R6BIHOdbLTzMxiPBNCV?=
 =?iso-8859-1?Q?ARNpBMaeu4srGWWwug+flRuJLjL79yOsqAmje58AORZUTGV+kRgC3PFX/F?=
 =?iso-8859-1?Q?/W/PaOaLafi4N+GU3UxuZDvR+X38sjaFn+Idnd3X9TOT2PK0cnyKccVdqZ?=
 =?iso-8859-1?Q?P7KOfSRY6Y69RkUKqeNTL//9RYEPi8BjbjXS5nXCJkkMmUNBQ8abaFfyJg?=
 =?iso-8859-1?Q?1O4x8a+hsd7K7ighoi8/Lyt7bw8AKEiGnOzsRMaEZPRwqnseCE9zdtqIX9?=
 =?iso-8859-1?Q?unHAGI9XxFjb+4IHiuONnyyG5irybonvgZ1dE0AjheWxfUlR3DnS0OBaMj?=
 =?iso-8859-1?Q?+yz+YAMBuu38fNvC4J0qtaty67qdoXFblZKtYcCxrqoZNY7/80PbhsJpE9?=
 =?iso-8859-1?Q?/XoBFXejEbP43ElE/njseKJ0p8lVAhawBEfGOTkJVPD+XeCNE7iffGTty1?=
 =?iso-8859-1?Q?ajaju4o1jRs7RpQam7C9V/mznKQ7yHjPqcHzQT/A6Bv2isDu6Z8Zv3e0h1?=
 =?iso-8859-1?Q?mwJt33LAYsSfLFkA3Bvr35rFkEjar5zHmkbDiTOPmHrZfPEZ0rXpkHX0z/?=
 =?iso-8859-1?Q?aynOqBDEO53Wi0/IHEISF+itHbg7VRrBLfHgshxbCpQIC4kkGVvYfI+pJk?=
 =?iso-8859-1?Q?2TifqFiriad2mEees9OZ7MZ37EOPL9/K1PQNrDl6tSn5UT+dEqQeDklu+D?=
 =?iso-8859-1?Q?OD+F+A+IHZ7Y9EewqCLOEkl0qu0q4beGH8cR78Y2jEvWyLVafZ0w9XfD/+?=
 =?iso-8859-1?Q?haTPCImo2uhQTdCfFTXn07pHgEQTQL1f7gK+rK0ZOcEKFl?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB761612C89B048D93B36C708ED3C12PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	i8pt+nFzwUK6FLQwiirPWMOdL1FMY93YU5ZoDBHw4rlO3dezpCGcvAvoRUkHJkXKIq8Ou3kgPUXCv6hckl7BGHSM9Gna+0WGtk4r85QqCRUZXZF810JBIs8J40idSMiYSAAwVrbsA7OhFL5Bm4zqGtVd2HfB3qQxy0GYoq7/YJVZN0d+7MNo74rfqUVnffJvW0v0i+EDCC37KVSMggGkI52hoMbMEWaFkVkxZL+UCn6frPz6hcoMP2k4LwqNpFCuYvV6FStZwIk1o1++UrNR4gO02+J4RKAvEKhDSyLOufk6Rg8iHdNmc1tTs4wQ+TLiKnQ7a71y5nGFlzAQaRiw5g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3609daa-d2b9-412d-37eb-08dee7d85f2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 10:02:42.8741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DepFya+1412OB5EJEgUBM/nZG2bCgndXhvy0dkFAuUfPCMpd+EbZ15HBFSOdNXgFQ6lTZMQUken5p3zeW9wv0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6807
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241644

--_000_PH0PR11MB761612C89B048D93B36C708ED3C12PH0PR11MB7616namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for pointing this out. You are correct.

The Wrynose OpenSSH recipe does not enable the kerberos PACKAGECONFIG by de=
fault, so it is configured with --without-kerberos5. Consequently, GSSAPI a=
uthentication and GSSAPIStrictAcceptorCheck are not available in the defaul=
t OE-Core build, and this scenario cannot be triggered.

Also, the referenced upstream commit only documents the existing Windows Ac=
tive Directory behavior; it does not change or remediate that behavior. The=
refore, carrying it as a CVE fix would be misleading.

We will withdraw this patch and replace it with a configuration-aware CVE_S=
TATUS: not-applicable-config when the kerberos PACKAGECONFIG is disabled, w=
hile leaving the CVE unpatched when Kerberos/GSSAPI support is explicitly e=
nabled.

Regards,

Devansh

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Tuesday, July 21, 2026 20:00
To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <dev=
anshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-co=
re@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998

On Mon Jul 20, 2026 at 7:55 PM CEST, Devansh Patel via lists.openembedded.o=
rg wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream OpenSSH 10.4p1 backport for
> CVE-2026-59998. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79=
ec926221fbe6fcc296d432
> [2] https://www.cve.org/CVERecord?id=3DCVE-2026-59998
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../openssh/openssh/CVE-2026-59998.patch      | 36 +++++++++++++++++++
>  .../openssh/openssh_10.3p1.bb                 |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59=
998.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
> new file mode 100644
> index 0000000000..3e15fe19fa
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
> @@ -0,0 +1,36 @@
> +From 94a089cd331eeea77ffd6fd715e61d281c3b97c3 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Wed, 24 Jun 2026 06:55:12 +0000
> +Subject: [PATCH] upstream: mention a caveat regarding
> + GSSAPIStrictAcceptorCheck in
> +
> +some environments
> +
> +OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2
> +
> +CVE: CVE-2026-59998
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/8058c5bdb507591b79ec926221fbe6fcc296d432]
> +
> +Backport Changes:
> +- Omitted the upstream OpenBSD revision and Mdocdate-only hunks in
> +  sshd_config.5 and retained the Wrynose OpenSSH 10.3p1 values because
> +  this stable backport carries only the security-relevant documentation.
> +
> +(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + sshd_config.5 | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/sshd_config.5 b/sshd_config.5
> +index 3f5e29812..22b9039d2 100644
> +--- a/sshd_config.5
> ++++ b/sshd_config.5
> +@@ -769,6 +769,7 @@ machine's default store.
> + This facility is provided to assist with operation on multi homed machi=
nes.
> + The default is
> + .Cm yes .
> ++This option may not be effective in Windows Active Directory environmen=
ts.

This is a oneline manpage patch for "Windows Active Directory
environments.".

I'm not expert in GSSAPI but can we even trigger this?
If not, I think this should be handled with a CVE_STATUS.

I'll hold this patch in the meantime.

Regards,
--
Yoann Congal
Smile ECS

--_000_PH0PR11MB761612C89B048D93B36C708ED3C12PH0PR11MB7616namp_
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
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-fam=
ily: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0);">
Hi Yoann,</div>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; ba=
ckground-color: rgb(255, 255, 255); margin-top: 1em; margin-bottom: 1em;">
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Thanks for pointing this out. You are correct.=
</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; ba=
ckground-color: rgb(255, 255, 255); margin-top: 1em; margin-bottom: 1em;">
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">The Wrynose OpenSSH recipe does not enable the
<code>kerberos</code>&nbsp;PACKAGECONFIG by default, so it is configured wi=
th <code>--without-kerberos5</code>. Consequently, GSSAPI authentication an=
d
<code>GSSAPIStrictAcceptorCheck</code>&nbsp;are not available in the defaul=
t OE-Core build, and this scenario cannot be triggered.</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; ba=
ckground-color: rgb(255, 255, 255); margin-top: 1em; margin-bottom: 1em;">
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Also, the referenced upstream commit only docu=
ments the existing Windows Active Directory behavior; it does not change or=
 remediate that behavior. Therefore,
 carrying it as a CVE fix would be misleading.</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; ba=
ckground-color: rgb(255, 255, 255); margin-top: 1em; margin-bottom: 1em;">
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">We will withdraw this patch and replace it wit=
h a configuration-aware
<code>CVE_STATUS</code>: <code>not-applicable-config</code>&nbsp;when the <=
code>kerberos
</code>PACKAGECONFIG is disabled, while leaving the CVE <code>unpatched</co=
de>&nbsp;when Kerberos/GSSAPI support is explicitly enabled.</span></p>
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; ba=
ckground-color: rgb(255, 255, 255); margin-top: 1em; margin-bottom: 1em;">
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Regards,</span></p>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-fam=
ily: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0);">
Devansh</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Tuesday, July 21, 2026 20:00<br>
<b>To:</b> Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;devanshp@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-599=
98 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Mon Jul 20, 2026 at 7:55 PM CEST, Devans=
h Patel via lists.openembedded.org wrote:<br>
&gt; From: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream OpenSSH 10.4p1 backport for<br>
&gt; CVE-2026-59998. The upstream fix commit is referenced in [1],<br>
&gt; and the public CVE advisory is referenced in [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openssh/openssh-portable/commit/8058=
c5bdb507591b79ec926221fbe6fcc296d432" id=3D"OWA9ad093d8-02d4-e6d0-0c05-40e7=
8eb4a227" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec9262=
21fbe6fcc296d432</a><br>
&gt; [2] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-59998" id=
=3D"OWAe9f15953-d03e-c7bb-5bb6-d2ed6afd26bf" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">
https://www.cve.org/CVERecord?id=3DCVE-2026-59998</a><br>
&gt;<br>
&gt; Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssh/openssh/CVE-2026-59998.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 36 +++++++++++++++++++<br>
&gt;&nbsp; .../openssh/openssh_10.3p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<b=
r>
&gt;&nbsp; 2 files changed, 37 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE=
-2026-59998.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.=
patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..3e15fe19fa<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch<b=
r>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +From 94a089cd331eeea77ffd6fd715e61d281c3b97c3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;djm@openbsd.org&quot; &lt;djm@openbsd.org&gt;<br>
&gt; +Date: Wed, 24 Jun 2026 06:55:12 +0000<br>
&gt; +Subject: [PATCH] upstream: mention a caveat regarding<br>
&gt; + GSSAPIStrictAcceptorCheck in<br>
&gt; +<br>
&gt; +some environments<br>
&gt; +<br>
&gt; +OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2<br>
&gt; +<br>
&gt; +CVE: CVE-2026-59998<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/openssh/open=
ssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432" id=3D"OWAc9e3=
235c-26f1-827f-a107-0a2aac0c1566" class=3D"OWAAutoLink" data-auth=3D"NotApp=
licable">https://github.com/openssh/openssh-portable/commit/8058c5bdb507591=
b79ec926221fbe6fcc296d432</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Omitted the upstream OpenBSD revision and Mdocdate-only hunks in<br=
>
&gt; +&nbsp; sshd_config.5 and retained the Wrynose OpenSSH 10.3p1 values b=
ecause<br>
&gt; +&nbsp; this stable backport carries only the security-relevant docume=
ntation.<br>
&gt; +<br>
&gt; +(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)<=
br>
&gt; +Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; +---<br>
&gt; + sshd_config.5 | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/sshd_config.5 b/sshd_config.5<br>
&gt; +index 3f5e29812..22b9039d2 100644<br>
&gt; +--- a/sshd_config.5<br>
&gt; ++++ b/sshd_config.5<br>
&gt; +@@ -769,6 +769,7 @@ machine's default store.<br>
&gt; + This facility is provided to assist with operation on multi homed ma=
chines.<br>
&gt; + The default is<br>
&gt; + .Cm yes .<br>
&gt; ++This option may not be effective in Windows Active Directory environ=
ments.<br>
<br>
This is a oneline manpage patch for &quot;Windows Active Directory<br>
environments.&quot;.<br>
<br>
I'm not expert in GSSAPI but can we even trigger this?<br>
If not, I think this should be handled with a CVE_STATUS.<br>
<br>
I'll hold this patch in the meantime.<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
</div>
</body>
</html>

--_000_PH0PR11MB761612C89B048D93B36C708ED3C12PH0PR11MB7616namp_--

