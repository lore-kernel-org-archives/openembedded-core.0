Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E7CC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:34:03 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5623.1785306834273836009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GFtoSscC;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14914; q=dns/txt;
  s=iport01; t=1785306834; x=1786516434;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=fkrzuAzwj68Jt22p5+iDjgSKBZRjln98xt6koJjEhJs=;
  b=GFtoSscCQoj9aVbFW2dgFjCMOfTMFbrAmMy17vPdrBiXauhgvG8e2Kkv
   Mc+40xx5o+1QYuWfgATOs5MXbt04poPxskNC0wRstKsFRbopKiLSLbybP
   gY0Rglc9fpER9Epgq6gxLcHDL/QWJOSjmN3N6+Dr3IqjkI2RR2NVBx2S7
   wplsjElT5wRKoQ0BIstd2FZfZ5eq14I4ZAL/BGS5JY5RezigORMCKTUye
   XHK6Dyh7UVBFgU882Fla1qWf/KRe/jBHQxikceB+v7GlpVRLS4mIZ5rnL
   pIHLI+BxPRXX7xrb24XMCqY6cq8sJN4Qchy+WP1Z2b1dI0ebE1NV8JbCL
   g==;
X-CSE-ConnectionGUID: 7Y4n+Yh7R/a3ybfXSjoh1g==
X-CSE-MsgGUID: DwGLZJagSKWpF4rHTKw5dA==
X-IPAS-Result: =?us-ascii?q?A0B0AwDdnWlq/43/Ja1agS6BK4E9ATBTgQgCgSFJiCMDh?=
 =?us-ascii?q?SuIeQOeG4F0Cg8BAQENAi4BGwcEAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBETkBGxIQAgEIEQQBAQEuJ?=
 =?us-ascii?q?wodCAIEAQ0FCBqCYYIdFkEDAQIOBrF7AYE9AooqeIE0gQGDKAE/AkPcChWBO?=
 =?us-ascii?q?IU/gwEbAQEFJUlsgl2BIhgBhHwnGxuBcoFXgmk+gQWBXAICAReBHSs8g1eCM?=
 =?us-ascii?q?ASCInoSG4MZgV+NHFJyIgMmMywBVRMXCwcFgSMQMwMqLy0jSwUtHXAMJxIPH?=
 =?us-ascii?q?RcXHlgbBwUSICpBRSMDQTQLQwWBVgKBeD8jGTZ/gS91SnctaQECEBdKOBiDO?=
 =?us-ascii?q?QKCQQMLbT03Bg4ZAwSBNQWNAwdbIYJFARVCLAoBKyAoB4EdQJM3Fo9BjmCVF?=
 =?us-ascii?q?woog3WKe4EmjT6IMheEBIFXkkCSUQuYfSOCNosxlWCFLgIEAgQFAhABAQaBa?=
 =?us-ascii?q?DyBRA4HcBWDIgkKQBkPVpFNhRPJJ3kCAQEBBjIBAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:ULiC4RYCldzFVZSHFxHgnvj/LTAchN3EVzX9orI9gL5IN6O78IunZ
 wrU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:IN4F46lk2qrhazGP/k5hu+zo5gzaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcUTqPbv+IZmr2etB+bNnn/BhUuZ+Bn95lTAE4+H8wF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdIppuA0MGERz
 7sRcyEHYCC4heW2mb3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYz/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKII4LWHZsMwBvwS
 mTu03vWJiM4PdOk6gWd3C62ptPsgn73cddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:jmWBe6muaqqoqC4aOQSw+EJM39npDfMsiWdD5ihNYBxZY6Wkfp
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
X-Talos-CUID: 9a23:HcRNdW8jailcAVi15cCVvxElRsZmQ32C9jDZeF6yB1ZSSrqVEFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AGmXxog9Mr0HhQ0bM4SKFwkOQf+t3zICcKkkCqrY?=
 =?us-ascii?q?5o+fYLwxMGCjAgB3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 06:33:53 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 1974918000182
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 06:33:53 +0000 (GMT)
X-CSE-ConnectionGUID: 6MM6DPmLQ1ij90tCCdNTrg==
X-CSE-MsgGUID: 3FoqffTQQfmE1o6XP6T2dQ==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208,217";a="75412525"
Received: from mail-westus3azon11012005.outbound.protection.outlook.com (HELO PH8PR06CU001.outbound.protection.outlook.com) ([40.107.209.5])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 06:33:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxlcDmJ7kfIouIZbSWnDMS+0QkgL4usuByoq8znHnEe3m7ehJwej1jTDGFT++7wVJ1LbaEojwTxZZGkOCuJtq4svo1qqBv4zF/LhBnLWG+dalVhaurUjLi3+EvEGJ+w908irUwrIYuVzWaNwYZp25efEyJ0RfBIlzHx9ZA5qrWvQt1QmciUehx12KfxpqbZWb/pNbPTXheDaRg75teQ3ihzMQXCdbJ4EzyutdgHS+9+lOSOYrRq5HPPp5c/NsptZD2pp/Lhl7+y9yOzbazWFj09DZZJbVIzpZMFF4ojIh/8ciQnQBjUPgsAizdPqIPs2XkqKv0SOSQewO3h1qdZWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkrzuAzwj68Jt22p5+iDjgSKBZRjln98xt6koJjEhJs=;
 b=eHkzJZS25W21bLLfhBbbRdd+NcjwumJpCZuJKtrwOLmPLvMnokFfktA2Ll5AalEjMYFHQAZGs5JLH3aEC2zfsHXf1PVQRSZnNc+v8WGASKi3gaQ0dHRfCwUhyXd2T1RTsny1n7zfoVhzo7+oRJrXw4bqvgWaIpLAbQPeA275YtU1HGmv724pVm8ce51VRnjI/4NFAcjd9uQ96t9dqUMlORoJ3cY0UHWsHNke9UqIiupW/W4Pq3DM2eSnKJP1mQe+PSMaR01FoBZQnj1iJuz2bsiK/CKLBm219MxyvvnNchdC/zDGDifz1/TNMrlo3l7DOZtpdoOHI1w2tVpcAUHf4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 06:33:49 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:33:48 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
Thread-Topic: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
Thread-Index: AQHdGyaR6mkxWI3zbUKPI208OS7mZbaC83yAgAEdhkY=
Date: Wed, 29 Jul 2026 06:33:48 +0000
Message-ID: 
 <PH0PR11MB59020D843247D3B789DCE7E7CFCA2@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260724043914.4061351-1-asparmar@cisco.com>
 <DKA8MSUA8QRC.3P1RM7SCLTGG4@smile.fr>
In-Reply-To: <DKA8MSUA8QRC.3P1RM7SCLTGG4@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|SN7PR11MB8066:EE_
x-ms-office365-filtering-correlation-id: 3c758a1e-d55d-40ef-c82f-08deed3b5925
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|5023799004|11063799006|6133799003|56012099006|18002099003|22082099003|8096899003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 fgxILImkkELLd3dwNAe02Q0Vdix39NXS97Tcn1NoEM7Nj3Qu5p4iG+WRDgj8I7JidQghx+26az9i8ODiE5t0wNKg0M76tH5wIBUA09bMJKsrIWtqj+bc5U678bKNpHXvEQlSevTtDxJls3oV+jt34yQm5K6RdkPb7u9icBZ1RbP+4cqVWj3vorKI+gOMVfQ0v9YoxQWBdfKu8Rk7JX+kCAezK49b1B3+k5UUa7M6KNGSEsX2rloLXb9vdoamy/MTQOIEL4DQ/LSIHBYZeRfVO1ddVOwiFu4ilzXBm06NTcLlUzo90G9s3uIKr3QlDIFaRKir/jI4uN4F861yjp1LlKrxluhzzDMYKY+NPPag2zl6ltdAX6JAQwQqrZfs4wtpHwrf3u5Xc1F1mPwXiwkDXuYkkGWq8Br/f9aYLjvDtim9i4VR9Cq9ZGo9yz9vslE7MYw5d0ulNFmetzVQYdBtIyN0frTycU6rfYMmbQDmbX03hcaytdUhS1Y+ZaelG4rFJUtbMtcQImRbTt5zqEnANVggeXxKhDwKJfSoyyYz9r7v7TSvvT3fbdaJ/5GPXfpbKyClB8WZpoS7MB8kVQwtLVb6VEJZYvjclc6Fs098+hIKxxCuUPPdiEw+p4W+v4pLlIBZ8yQby9PHaLmPEq39NvB38dqhJrPhCNHMLdqpAnPj6gmlEF9AkFyDNwjekYt3z13JTgELKOpl05fxWvA4n6jQlmAft0+BlIOLm1r3LN8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(5023799004)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(8096899003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wP10xD9K4C5Z0ZJA5mB215b4R/HVIIAPaLtr3UtjCNp8VDl9RZqPgdGDvt5d?=
 =?us-ascii?Q?yzCLAEF/UY5NScZDmnMpEaLhnFp9thQULEnZXimuO/wMYzkxS+TBkwAKozh+?=
 =?us-ascii?Q?kMgyd4SigwGqEqZDWxblRxnP1kGZuDpnPehbm7t851l7a/3WYh8VzYRhS84X?=
 =?us-ascii?Q?qCHBxrWx9C64CGTw45lAds88YeL5nfUPXlZCjg0AU6yHhZ3VStCzQDntRqPB?=
 =?us-ascii?Q?ndgIXtubDImhwv0gnaQPFtDTN/gJ7UmC2GGX+oOayJOmPUTd2SX5774sanSK?=
 =?us-ascii?Q?u33l58ooBOigNc9tnuDbN59IEyh8yYUESjwRBbyfqkE6XXjNkeiCtVbxLQRo?=
 =?us-ascii?Q?lPnku07p30VufNjnVfj7nCE1hVNHvNwVd6bTzf0wNtS4KWF7cgEbHNsQ6Mkd?=
 =?us-ascii?Q?CKh5pj9/yhArhyiOEDrVnUhpvCURVekSR3JebANZUG28CYJTIE9uPvYAqoUd?=
 =?us-ascii?Q?+/rzSy1dcBkXf7+LCPhydkyCEJtRd57TUo/A29G7dB0Uf5r8WlRRmI2MtMqD?=
 =?us-ascii?Q?2LolJKH8Xt6CSUafPednScTjwjw/OzvuriP1Iddzzw2W9J7vRMhfIbcEuAip?=
 =?us-ascii?Q?rdJxf7TmEG2rgjZ26n2DX7EDJ2yxDksAmRhN9Gy8T9VsAQdbosdvSBT9xJxQ?=
 =?us-ascii?Q?arlEFmIy4eAxZk2zpao7q8zij2PAsAVzaMOYtvaC3kROTMfvVOrt1t7J6Q9C?=
 =?us-ascii?Q?uulo4wqvxPfwAPxDVYRQAG262O+tpAe2ieq50zGLvpluzeXOpKUH+HAGnt/z?=
 =?us-ascii?Q?Tc76NYD/J+ApHuXT8kehEALp+QcQefO6lH5SIPeLYrYQ4n+fyNuATGA54Hc7?=
 =?us-ascii?Q?iXUFv8GsLpZxOeGl9jdy5oj428wGtGfkvozhYC1ENd+4gy5VkFCPwW1VJGmL?=
 =?us-ascii?Q?eBf5EpR6IGRi2H5JDHIiBEoooi1/Q+IvvLZoahVMrsoLwN2eFS23UQigwl9+?=
 =?us-ascii?Q?Lw/NbV8F3ix4G6gEYkRDMMMnH0WMMtDl5SCRqXxmQW34JEFlJuPvq6TN4Bt6?=
 =?us-ascii?Q?tqzxHM8UkUUjwdsOPPUEe1Tv0DnXD0QMLEIragon7JAbRJnxCznhplDH8L9P?=
 =?us-ascii?Q?NKawMOLLGgGCcJJ/SikFJXSkEztG76lhemHDYVTquqV8wHYeKoIDXWmPm9T1?=
 =?us-ascii?Q?AuSxWl6s3q0EVRB2o6laeH6cYFkvh6FMKPYr0MJuA3apoPLQA4WIsQtZ9hDf?=
 =?us-ascii?Q?j/DfvFhx0g4b8oXmuAuT10VbKtd6Qm9QDag/G5aUMeswxQAnjM7i3USid03s?=
 =?us-ascii?Q?dlF38PKHxB5VgXNePK0xQckeQmWhy+X/qG0AjsAgochD9XADrGKL8Uqvk2TX?=
 =?us-ascii?Q?AnaM7zR7T8EFUna8CeOZbW7e7hvX5s74DG3HFzJ3P1VUdSctZCX7Fr4mBi54?=
 =?us-ascii?Q?Rsp0wHJwQyDK0I0TJJEoDXTFsueCWsZZkiZVB754wW4N0GPO89MSyCZ53rj4?=
 =?us-ascii?Q?ex8jJ6zvZlXkQSXWMY1GkGCVn8U+pYPR6CEoBwH/QeP+r1QJ3qLjn71NpH9E?=
 =?us-ascii?Q?LEl06xEjrwEzGF7telaOsO3VMU+9SIzYYzKJJlMF4oWxlzxIZsYTQHTRo/Aq?=
 =?us-ascii?Q?8t6Yk2v3fpmF+S7ap3JubMmF2qlgGLtTv+hf1Jkl9MOLP99Jp0aOQUwtizUX?=
 =?us-ascii?Q?mIYnt3tGbDtKEbgUD6mUb9XfKEjNmVZdxX+ylgvPKLr/CTeSkh1X37co9zMo?=
 =?us-ascii?Q?Krnm4+sFbi9DJmSw+P3VrwmKPa1s2t0smYH58YjvI1f3O1/e?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB59020D843247D3B789DCE7E7CFCA2PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	VcX+5nBPNSFg5rMzCpQW5zKCQjcW7ZEJvmKhX9zEhPkn3kwi0ancrxwANa1YHr2hkF8afx1ccFWXkvWMH6UUfzCmyAduEdb2cAaT3mIdz8BUaphwcKUifmIneMD5LKU/I9/SbB+omAvhb3psmDcax2E1EDNYXJLFmg3CjjOA6mOR0Dnt9bqj5YWlrbu4+8evzLiedwV0HDbF+lZchrKy/F/gqbaGCJ6uze/RQ/mfA35gwmcLx9tLw/UEFYwiWhxytnYiZcb2eqolz4V25U6MOz82wv4wqwiyhv7XVhwHJuPBn6Caw6az/Yoy0qEQuw35fO/DElHEmipL3QeWgKWtdQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c758a1e-d55d-40ef-c82f-08deed3b5925
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 06:33:48.7101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDfjyPY6zwEDlEGWq9Hp+uNtcnrvRdMHJJsPnyo9UOumtysJWZKwGiVLfxccbjMS0BMre2mV1dEMmlz2zuyZVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 06:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242237

--_000_PH0PR11MB59020D843247D3B789DCE7E7CFCA2PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,

Thanks for reporting this.

I tested the complete rsync series in a clean Debian 11 environment. The
rsync-native build passed all 157 tasks without sstate reuse.

This differs from the Scarthgap issue. Wrynose already includes the upstrea=
m
openat2 portability fix as CVE-2026-43619_p6.patch, including the
configure-time checks for <linux/openat2.h> and SYS_openat2.

The reported Wrynose failure instead occurs during the compiler sanity chec=
k,
where the linker rejects the unsupported --no-rosegment option:

/usr/bin/ld: unrecognized option '--no-rosegment'

This appears to come from stale or mismatched hosttools/ld state rather tha=
n
the rsync patches.

Could you retry after regenerating hosttools/ld?

Regards,
Ashish
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 28 July 2026 18:57
To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembedd=
ed-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518

On Fri Jul 24, 2026 at 6:39 AM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This patch backports the upstream rsync v3.4.3 security fix train for
> CVE-2026-29518. The direct CVE fixes are [3] and [4]:
>
> - [3] enables secure_relative_open() for daemon modules running with
>   "use chroot =3D no", closing the receiver-side basis-file TOCTOU.
> - [4] routes the sender read path through secure_relative_open() from
>   the trusted module root, closing the matching sender-side TOCTOU.
>
> This patch also carries [1] and [2] from the same upstream v3.4.3
> security/update train. These are supporting secure_relative_open()
> changes, not standalone direct CVE fixes: [1] uses Linux
> openat2(RESOLVE_BENEATH) to preserve the same confinement while allowing
> legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the
> equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's
> rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits
> before the direct CVE-2026-29518 commits.
>
> The upstream fixed release is referenced in [5], and the public CVE
> record is referenced in [6]. Individual backported commit links are
> also recorded in the embedded patch headers.
>
> [1] https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18f=
e2fd6cd79adef8a1
> [2] https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707ec=
8b829524c3809a43
> [3] https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569f=
aa60216582fb6c5d
> [4] https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba050=
337ef32092f2894c
> [5] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
> [6] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
> Changes in v2:
> - No changes made; rebase only.
>
>  .../rsync/files/CVE-2026-29518_p1.patch       | 392 ++++++++++++++++++
>  .../rsync/files/CVE-2026-29518_p2.patch       |  98 +++++
>  .../rsync/files/CVE-2026-29518_p3.patch       | 328 +++++++++++++++
>  .../rsync/files/CVE-2026-29518_p4.patch       |  71 ++++
>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   4 +
>  5 files changed, 893 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.p=
atch

Hello,

This series caused a build issue.
See: https://lore.kernel.org/openembedded-core/cover.1785190123.git.yoann.c=
ongal@smile.fr/T/#mac8cd24d85cb37cd8fa468a51921ac376e238c7f

Regards,
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB59020D843247D3B789DCE7E7CFCA2PH0PR11MB5902namp_
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
Hello Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for reporting this.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I tested the complete rsync series in a clean Debian 11 environment. The</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
rsync-native build passed all 157 tasks without sstate reuse.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This differs from the Scarthgap issue. Wrynose already includes the upstrea=
m</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
openat2 portability fix as CVE-2026-43619_p6.patch, including the</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
configure-time checks for &lt;linux/openat2.h&gt; and SYS_openat2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The reported Wrynose failure instead occurs during the compiler sanity chec=
k,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
where the linker rejects the unsupported --no-rosegment option:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
/usr/bin/ld: unrecognized option '--no-rosegment'</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This appears to come from stale or mismatched hosttools/ld state rather tha=
n</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
the rsync patches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Could you retry after regenerating hosttools/ld?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Ashish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 28 July 2026 18:57<br>
<b>To:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;; openembedded-core@lists.openembedded.or=
g &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29=
518</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri Jul 24, 2026 at 6:39 AM CEST, Ashishkumar P=
armar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openemb=
edded.org wrote:<br>
&gt; From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch backports the upstream rsync v3.4.3 security fix train for<=
br>
&gt; CVE-2026-29518. The direct CVE fixes are [3] and [4]:<br>
&gt;<br>
&gt; - [3] enables secure_relative_open() for daemon modules running with<b=
r>
&gt;&nbsp;&nbsp; &quot;use chroot =3D no&quot;, closing the receiver-side b=
asis-file TOCTOU.<br>
&gt; - [4] routes the sender read path through secure_relative_open() from<=
br>
&gt;&nbsp;&nbsp; the trusted module root, closing the matching sender-side =
TOCTOU.<br>
&gt;<br>
&gt; This patch also carries [1] and [2] from the same upstream v3.4.3<br>
&gt; security/update train. These are supporting secure_relative_open()<br>
&gt; changes, not standalone direct CVE fixes: [1] uses Linux<br>
&gt; openat2(RESOLVE_BENEATH) to preserve the same confinement while allowi=
ng<br>
&gt; legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the<=
br>
&gt; equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's<br>
&gt; rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits<b=
r>
&gt; before the direct CVE-2026-29518 commits.<br>
&gt;<br>
&gt; The upstream fixed release is referenced in [5], and the public CVE<br=
>
&gt; record is referenced in [6]. Individual backported commit links are<br=
>
&gt; also recorded in the embedded patch headers.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/RsyncProject/rsync/commit/4fa7156ccd=
b2ad34b034d18fe2fd6cd79adef8a1">
https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18fe2fd6c=
d79adef8a1</a><br>
&gt; [2] <a href=3D"https://github.com/RsyncProject/rsync/commit/7f60ec001a=
0be63b770707ec8b829524c3809a43">
https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707ec8b8295=
24c3809a43</a><br>
&gt; [3] <a href=3D"https://github.com/RsyncProject/rsync/commit/f1c24ab03b=
c85cb2638a569faa60216582fb6c5d">
https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569faa6021=
6582fb6c5d</a><br>
&gt; [4] <a href=3D"https://github.com/RsyncProject/rsync/commit/859d44fa4f=
1420775e4ba050337ef32092f2894c">
https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba050337ef3=
2092f2894c</a><br>
&gt; [5] <a href=3D"https://github.com/RsyncProject/rsync/releases/tag/v3.4=
.3">https://github.com/RsyncProject/rsync/releases/tag/v3.4.3</a><br>
&gt; [6] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-29518">http=
s://www.cve.org/CVERecord?id=3DCVE-2026-29518</a><br>
&gt;<br>
&gt; Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt; - No changes made; rebase only.<br>
&gt;<br>
&gt;&nbsp; .../rsync/files/CVE-2026-29518_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 392 ++++++++++++++++++<br>
&gt;&nbsp; .../rsync/files/CVE-2026-29518_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 98 +++++<br>
&gt;&nbsp; .../rsync/files/CVE-2026-29518_p3.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 328 +++++++++++++++<br>
&gt;&nbsp; .../rsync/files/CVE-2026-29518_p4.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 71 ++++<br>
&gt;&nbsp; meta/recipes-devtools/rsync/rsync_3.4.1.bb&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 4 +<br>
&gt;&nbsp; 5 files changed, 893 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29=
518_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29=
518_p2.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29=
518_p3.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29=
518_p4.patch<br>
<br>
Hello,<br>
<br>
This series caused a build issue.<br>
See: <a href=3D"https://lore.kernel.org/openembedded-core/cover.1785190123.=
git.yoann.congal@smile.fr/T/#mac8cd24d85cb37cd8fa468a51921ac376e238c7f">
https://lore.kernel.org/openembedded-core/cover.1785190123.git.yoann.congal=
@smile.fr/T/#mac8cd24d85cb37cd8fa468a51921ac376e238c7f</a><br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB59020D843247D3B789DCE7E7CFCA2PH0PR11MB5902namp_--

