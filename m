Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67575C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:44:39 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19105.1784796275770327629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=idAA0mg8;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8479; q=dns/txt;
  s=iport01; t=1784796275; x=1786005875;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Ft/Bio9OnYWFZUubDMnf2r7QchISrZUjgdyKcYHRJ+M=;
  b=idAA0mg8MsLlGO6aWWMvBzRuzVc6NAabuxxXbFK+r5HjJhekQ/HMOOVW
   PBl2dNr+v9Z9Z2q3UiTf125fsKYFt9mfg2vucNxV824hQn44mL/LCJSUU
   TClVL2MZQsrtW4QcIe2mlGvQrx2XPFa6Qr/qVp7F/abTZF7uuVS8JibF5
   3jBVhxoWmMhqtNpUIp+GW3FNFht7FkGcxRIFs129DTm1TfKnOm8sevoj4
   dJAV5d+94Pn6NMLNghvJ1J9Jiv5wip9z3B8XRWILtdxmCi9YNtIcmfo/4
   X5EKkb0a9R8wDH3lUxZMVBfsNbDcirp73xb59e0yZg0/8RNITsMhaD2Hr
   A==;
X-CSE-ConnectionGUID: GKDKw5/WTLW0WE6rbRxiMg==
X-CSE-MsgGUID: M6G3LCnuR3imtogGVI6FfA==
X-IPAS-Result: =?us-ascii?q?A0BwAwCV02Fq/48QJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UmIIwOFK4h5A54bgXQKDwEBAQ0CLgEVDQQBAYUFAo1aAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwERZxACAQgRBAEBA?=
 =?us-ascii?q?S4nCh0IAgQBDQUIGoJhgh0WQQMBAg61UwGBPQKKKniBNIEBg2gCQ9wKFYE4h?=
 =?us-ascii?q?T+DARsBAQUlSWyCXYEiGAEbhGEnGxuBcoFXgmk+gQWBXAEDAReBHSs8g1eCM?=
 =?us-ascii?q?ASCInoSG4ItZxkmgWGMX1JyIgMmMywBVRMXCwcFgSMQMwMgCi8tAhQNIg8aB?=
 =?us-ascii?q?S0dcAwnEg8dFxYeWBsHBRIgKkFFIwMULz84C0MFgVcCgXw/Ix8DOX+BMHVKd?=
 =?us-ascii?q?y1pAQIQF0o4JIIUgToCgR0DC209NwYOGQMEgTUFjQQHWyOCPBWBACAEMB9Jb?=
 =?us-ascii?q?A8Bk2WPQYF8jGSVFwoog3WKe4EmjT6IMheFW6URC5h9I41nlWAghQ4CBAIEB?=
 =?us-ascii?q?QIQAQEGgWg8K4EcCwdwFTuCZwlKGQ9YkUuBf4MUyGV5AgEIMgEBBwIHDgMLg?=
 =?us-ascii?q?WiQAIF+AQE?=
IronPort-PHdr: A9a23:XorAOxD0c9/HM6awVpA8UyQVXRdPi9zP1kY9454jjfdJaqu8us2kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:7SK+/6131dY+gcgtPvbD5Ypwkn2cJEfYwER7XKvMYLTBsI5bpzEAz
 GEfUW+PMqyDajH2c9x+PNm+o0kAsZGBnIVgQFM63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuaTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGI2IaHpJFvdlLJV4Wy
 tFGMjo3fhGmiLfjqF67YrEEasULJc3vOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME+ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQugOW3bISOIYziqcN9uxi3/
 Ubt+XnDWRAfKNuQ5gSkrFyir7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:elHCc68Yk4h1WHlfeWJuk+HYdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBfpTnhAsW9qXO1z+8S3WBjB8bSYOCGghrmEGgM1/qZ/9SNIVybygcZ79
 YeT0EcMqy/MbEZt7eG3ODQKb9Jq7f3ktHMuQ6d9QYQcegAUdAY0+4NMHfhLqQAfng/OXNWLu
 v62uN34xCbVTA8aMO9CnMZX+7FieHqufvdCyIuNloM0iXLqSmnxoLbPnGjsys2Yndi0L0i+W
 /Kn0jD4Lm/s/a08xnY12XCxZVbktnsx7J4dY2xY84uRQnEu0KNXsBMSreCtDc6rKWE81Axiu
 TBpB8mIoBa927RVnvdm2qv5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksbus1m2q
 4j5RPai3MXN2KEoM3O3amOa/hYrDvznZPkq59Ls5Vra/pbVFaWl/1GwKoaKuZaIMuw0vFWLA
 AnNrCu2B8RSyLbU1np+k9y3derQnM/Wj2CQkQEp4ip9gI+pgEi86Pdr/ZvwkvpM/kGOsR5D+
 ioCNUbqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOGl3fb2sR82AiRQu1C8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/uSUfsumDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbXMeTMoWsNAmXE/mmLOHFqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YN5N60i6M0WIySQ5m0mdDHAX0agAZ5QypdJjvbTlHrc8xjQotQ==
X-Talos-CUID: 9a23:BS2gQG0StX+tk2GcLoytKLxfNeMJUWKAi0jsB3DgNks3UrevWV619/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A4HKF2Q3JDrkfSlYhsdZpU0bZBjUjxvqBU2Qml4g?=
 =?us-ascii?q?84MiBKSt/FAm80hq5a9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:44:34 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id A616B18000247
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:44:34 +0000 (GMT)
X-CSE-ConnectionGUID: BsvvyNqkQrKqSl6NW5G06A==
X-CSE-MsgGUID: OSrAXvXmS/SV7XpsZndhDg==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208,217";a="81423427"
Received: from mail-westcentralusazon11013071.outbound.protection.outlook.com (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.201.71])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKFHJsLhZPBsTWrtn6kuaeST6rggAoGMkCiH3uCXsQx9SEguKb+MRBez7RVVt3Y+ptiUflofkDuFGPo+3zH2xo0/t7Ed5Tdd3tOdqX7IuOj5b2LgagrD6ctqFs6G7g4sKPQI+Dahx2mNlioG/YEWbxfubVt3vN8+aljcqL1e/v5xvoQiF8m9MPWRgpNGsZuULCy2oM+pJaP5jo3/O47z19NNOjmq9nrYbs5PezWtKas+UJ47R+8jIJvZ+Yde3T2uYd1K9cu/MCGDW4JciNTd+X6Z0F90YLukk0Hjhf0RpCcdPWZPedwfXJsHgSGHQdhY4OPEVNIYJOK1o8bXESgHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft/Bio9OnYWFZUubDMnf2r7QchISrZUjgdyKcYHRJ+M=;
 b=U4vbZZ4xsKpCQaYD4TP1s7GrTym9dgv2iQE0RKikD/TOeYOuoz/RgRFAngS4b6s/q9qDkSP5ruBMWkuFN68X70gY5k4Jps1ontjoHT/tZtD0708UHx6zKm39vz8E33tU1XXBmOkAyKNLYvZ8lGZjXRPp45tXMrF2aWpX968MTrul+YtbRtVwI07Vb7SMfRBZNL7oSKhWetXIkRD9gfFFMsay+1sSXH8kccFAI+mbt1PmiuJ3/2N9pNJT203+jQLW0CE9u96Kaa8dI2wD4gJ2CsKBAL5Uce1L4PwEHy8YF1OpC1YiKMsGrNJdfiN2sNOpC5ft3f2c0VKkdi44niID7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:44:31 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:44:31 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469
Thread-Topic: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469
Thread-Index: AQHdGcIPB2riZAId8EOIK/wreLjQg7Z5zxoAgAD7wmM=
Date: Thu, 23 Jul 2026 08:44:30 +0000
Message-ID: 
 <PH7PR11MB8598AB8F89B7886FD3EC9148ADC02@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260722100754.1568842-1-hthakar@cisco.com>
 <DK5A9LUHCWGD.3GUNQMOARHVNU@smile.fr>
In-Reply-To: <DK5A9LUHCWGD.3GUNQMOARHVNU@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|SJ0PR11MB6573:EE_
x-ms-office365-filtering-correlation-id: 3a6ea977-6603-4ef1-9283-08dee8969cfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|13003099007|56012099006|11063799006|4143699003|10067099003|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 vCrUyQSdiT6r8QeADWSyRXXbX0cJITkAlsJjFbX0ndryLsp/RVqnoCKmZmpWbaPetDYMYF9lH2eoVUe03PPe6Iyub/hpMeZ19z4zr7pkpJ+kpLv/XY2caI7KS7+J8nu6UyZE5J/MXk3rcTvw72XDpABLDlbcwnsJ3xmCM7XfKeTH7Cf7TlPOhfFujtfJ7VvhJOCaCC7YocLQf/0PrIl4mTQqM9PeKhT5KMq8RKzvGCTDd4fQ0jmaqBjIukW1SGGHI4+6JL0YUYxmzE9hP5OhoKoLMVwuGo3JxBKgfFx6fz9iYwkQCPBVh3T7sawr835+ulVKHbqhzd+cu5d3w51fmjlzIKe3eiCilEpTtQe1ZO1nK3jtyaOPj9gUQGQhR3aIxcwpDJ/3clIRKftatJAkqtSpwkgIlZVI/TuIng7wSsI3bAVpSR9dG+Aj2nJyiqhlgmp9BWu3uPVs+2IsQPZYBU7VGMWQ8QLXRaEmJWoUy0LoqocftW7XMsBehrzBBoYTHu0ctQAE1Oe/EROC1Bp68DaxfSnLWmrALbX3R5ZLsgcubqqreOo1yRKqJ7VFz7JM5YQNtIXz43gZZonPX1uybrOumimZSz1VOypmG47AlJf/kXzbuQ34fJC0yVdriV6PcnjO5aKFALNMgI/6haMtwMXSekJWwQZ60eIialMe1xYmhXbHqq2Ek2docReoTXH/6N9MFjTgiCvZO90qAFBUFW7Z1eVEhuiVrJi6n4KkzOg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(13003099007)(56012099006)(11063799006)(4143699003)(10067099003)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bv1DLYWQ+eo6RnD5E+0idlN/l43GtqAS9JEoeAOdbVzaNU6eAVHvws9agt?=
 =?iso-8859-1?Q?U3cHzfG4l36M27WPPIqsNEWjUr51G+2cH4B1P+DGDkBrRXAJ1vWhtW1muo?=
 =?iso-8859-1?Q?/acPqb/H5mXrQoaKS94Kf1MVf6wzwEhYwOJxWU1/iYxG+BiUvhACG6sod1?=
 =?iso-8859-1?Q?ueSTitF7iLNLDClE+AhbjH7e2UAT9KcXrcrqKzMfTG5alDk/E9T/26zju7?=
 =?iso-8859-1?Q?n0P4knGMZhUUBe0klCY2/oyPQ8/mOT96DgyynXX1pwf8VG7LmoHgClQb7u?=
 =?iso-8859-1?Q?KpdR0A5i64mmOUgymF/Lv9gPJH32956quXh8Hi1hJOXMvRFnF85CYPKvxK?=
 =?iso-8859-1?Q?hW0VpL4cEAlILfvwNLaLai1Tv1qhYZrrSK7wSe7eTjbiVlgbgr3DjToCnD?=
 =?iso-8859-1?Q?f7IA3qPiTsrsiRVWVk8v5Y/m/6ZhubPj8ftd5eIZctylz7/8zw5KusVEAF?=
 =?iso-8859-1?Q?IQUDEvndTxdHahG9H0WzqnJoJEtO5c2/jyeraf42CUMoDGVoo2krMSs6g8?=
 =?iso-8859-1?Q?Y/1El+gWXPc0wjjP51ifArt2NOGj9jvnvGPUoRchDmuPdmVVGWSJgzCX2R?=
 =?iso-8859-1?Q?qjIHVILdNOtB910wQnLtqbAf8qZUQuMvl/Krb3Ntwb0fPwO58gSiIHGZla?=
 =?iso-8859-1?Q?FTOw7/ABzP580HyO2RJrfQ+tsJlBU4VZdTbgph+9GgIZnrEMxAIPErOrVG?=
 =?iso-8859-1?Q?JlG5H5F/wKcqg470FcgCpqnq6mB1pJITZeTDOY+F7URqAz8PsFwpx+yeY9?=
 =?iso-8859-1?Q?RBaFGaGqEq48QK0GOHuDSIC3OB91YMoj2hopxPNN5YVCfNGQxfNM93nB2j?=
 =?iso-8859-1?Q?VtRn5Ersj8qFHmG6i33o/ZNHGhpOiS3VNBPuJGkH/F7SN/aWt208TFWlM0?=
 =?iso-8859-1?Q?vcgmlEodf6CjjtoxDWAlsDJOqetEIi4XqaB+BVDxyabT5VecnmeDtseU2v?=
 =?iso-8859-1?Q?VrIqA3IGIKnYw7vTyyow6RxwXZF31gMHpiBjDihYBTRhxsSGi5J/fcxVfw?=
 =?iso-8859-1?Q?3anNotDZ4ZiAVyEcVTBcA9WOjYUU+KnrmM+kxpM9qDQUl/W1PAYFJaIsMT?=
 =?iso-8859-1?Q?QyBfke+Ej2h3rLq7BY55iDhJaUYqHpt8gHQVENjfftZv99411G1j0dG07K?=
 =?iso-8859-1?Q?/LjllrmrRTHIhJAQ66N8/vX+H6dwCmDaK3xXQ8rE9k+fvIA4RN0fnGr9Jw?=
 =?iso-8859-1?Q?+ARzhaQyx9AfeltMf2ROczbb+iYgYw9iS+1ji20B0omWhqjULBaq+FBFSG?=
 =?iso-8859-1?Q?5cl52Lg5IpRkAwBhksk0hG7jPqS8Xhy2NZdllmSKbIUxa+be80jubviuTB?=
 =?iso-8859-1?Q?GUQVHlY0uYpQrSxoTQy6OfgLLjbmn2PaDsfpZkooR5tvzzLqVRmxcA4x4d?=
 =?iso-8859-1?Q?8LzQOFS3pUcAQyFekxK4CkIAgdSBY4vAy7HO5yfCeBLsDP+6V2ISO7zxH0?=
 =?iso-8859-1?Q?D/NEttMTfnNMuoCRfpWlJHgJhFOekQBs55WaXtbBAxwim51RcwhQ8SGYq2?=
 =?iso-8859-1?Q?bARNbdFczudz/Z7YZ6cYfZXYKWgam3ZphOuTsBnpJB6+f0EPnBmuXZm8tn?=
 =?iso-8859-1?Q?EfE9Gh3tOFUSwJH9/hrqx60V9drF8ZhKO5GyrM9sY5T/66y6d7P2kdMB1K?=
 =?iso-8859-1?Q?iHpt/Jzk6p8C++aJjV24TPUaK4ffEWzsDurbzYIAeX7iZGQMod6iRCisYr?=
 =?iso-8859-1?Q?ph86OoDA5tfCsqtOeG7EvKA7Pl8aRS6lJQhR3d335I1ZmtJpl5xYuWRlgE?=
 =?iso-8859-1?Q?mzId+4vUPKyo5TuA9FW7Fbu6/Rt6FtzKWSGP3pDAO0omLK?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB8598AB8F89B7886FD3EC9148ADC02PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	jscBXQiLpqnnnA4fkwXhw7NhDc9aSlE4f11yjV+J3IrrPR2toAHPB5LLjtClZrAzlxkAVrmifnh8na5j99Y56YalSPdFoGiW5bNLefxSHu6nut+Hpp3yM7kNfEwnLz8sZto/wep921Cm27peqdzzpZZyolo91XQfxDMbY4apGbxla+dpE0pEogya6c6XKwFPorkeTxbFApAbR6ild1EA6qOqMksXmJIp6iKd4WGMT7aW4xaopIQyXSVIELb5Gr1cMUYdZ+kz4TJC+vsIjOf3DX6AkCzEFCKb1og+qYHRx2zd97VU7nnM6iAmFcsBMbWDvCDYgw4uEtawn3Qys+3qWg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6ea977-6603-4ef1-9283-08dee8969cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:44:30.9407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfIpsuYOGw80HQafhfZqzz45INIsErV8Oab+5VstPSvLKsZ9a+2Dr9sHem4tVZ6vWrtVotCm1Doid/vlS1QmDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241795

--_000_PH7PR11MB8598AB8F89B7886FD3EC9148ADC02PH7PR11MB8598namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I reviewed the earlier series.
It looks like the follow-up upstream regression fixes for
CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
These follow-up commits are required to complete the backport, and I
have included them in my series .
I kindly request you to review my series as well.

Thanks,
Hetvi Thakar


________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Wednesday, July 22, 2026 23:11
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469

On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> It also includes the upstream follow-up fixes referenced in [3]
> and [4]. These correct the trailing whitespace check introduced
> by the original fix and add the required <ctype.h> include for
> isspace().
>
> [1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7=
a4fb0b6f7826
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
> [3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a=
00386c3f3bcf
> [4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac=
298c24fe00a1
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

I received another similar series 2 hours before yours:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48992
Can you help review it?

Regards,
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB8598AB8F89B7886FD3EC9148ADC02PH7PR11MB8598namp_
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
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I reviewed the earlier series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
It looks like the follow-up upstream regression fixes for</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
CVE-2026-58469 and CVE-2026-58472 were not included in the backport.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
These follow-up commits are required to complete the backport, and I</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
have included them in my series .</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I kindly request you to review my series as well.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hetvi Thakar</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, July 22, 2026 23:11<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469 =
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi=
 Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.opene=
mbedded.org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt;<br>
&gt; It also includes the upstream follow-up fixes referenced in [3]<br>
&gt; and [4]. These correct the trailing whitespace check introduced<br>
&gt; by the original fix and add the required &lt;ctype.h&gt; include for<b=
r>
&gt; isspace().<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153=
f69537c7cbc2a7a4fb0b6f7826" id=3D"OWAc58779da-f616-35ab-2a69-1175d736a3a8" =
class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b=
6f7826</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58469" id=3D"=
OWA844478b7-6c0f-06e0-6e3a-6adf674df5b1" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-58469</a><br>
&gt; [3] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77=
bde220fc575c8a00386c3f3bcf" id=3D"OWA41406738-53e5-d3b1-767b-7b0d13da6c86" =
class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c=
3f3bcf</a><br>
&gt; [4] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc994=
2b78b2bf736aac298c24fe00a1" id=3D"OWAc91abc8e-f6e1-aaee-8194-fbbf576d7357" =
class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24=
fe00a1</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
I received another similar series 2 hours before yours:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D48992" id=3D"OWA3f23b775-d3d7-cf27-8e21-07292cd91897" class=3D"OWAAutoLi=
nk" data-auth=3D"NotApplicable">https://patchwork.yoctoproject.org/project/=
oe-core/list/?series=3D48992</a><br>
Can you help review it?<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH7PR11MB8598AB8F89B7886FD3EC9148ADC02PH7PR11MB8598namp_--

