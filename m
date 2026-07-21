Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44739C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 05:44:29 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16371.1784612667894409697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 22:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V1UpFUNG;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11854; q=dns/txt;
  s=iport01; t=1784612667; x=1785822267;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=2bDrDGsZ7tPwhMl5znlHj8AsTDySMvLjSUGheaegYvc=;
  b=V1UpFUNGG+dCtXq3pVpYd9KNsgajo4WAqk/76dqLvsBQVcWnXgO8YWUV
   hUIrqGTrxHVMHbCjXOcXYsBfsIBX6fbye3Dn6CrVAai9/OqW6PwKlmicZ
   TsCyAASdEIhu+7lau0NLsAb66suhIKI4YddyLclEiHASlwDfG9FEf9zFf
   Lr6HJi1gd3ea4QeJ6z32VYQ+Eyfz5pLwPMnuagVNe9kC0B/Jjme1ODzxL
   cKkV+dd3i6rltXWtZqqzYn+05zRoO0bXnsNAm5tfkGcgr1eNGaL9ZHjRu
   aYDFgNQWz1UXQRP6rVsz0Ui5LYTeAPy1Q44ser357vJGqwYG5jGmFYa7B
   g==;
X-CSE-ConnectionGUID: Jw564V97ScKl+z+bseN6Xg==
X-CSE-MsgGUID: 3qUSqbJQRRG5QSBQQGPZ0w==
X-IPAS-Result: =?us-ascii?q?A0B0AwDSBl9q/5L/Ja1agS6BK4E9MVOBCAKBIUkEiB8Dh?=
 =?us-ascii?q?SuGWIIhA54bgXQKDwEBAQ0BAS4BGwcEAQGEP0YCjVcCJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDARE5AT0CAQgRAwEBA?=
 =?us-ascii?q?QEuJwodCAIEARIIGoJhgh0WQQMBAg6xFQGBPQKKKniBNIEBgygBPwJD3AoUA?=
 =?us-ascii?q?YE4hT+DARsBAQUlSWyCXYEiGAGEfCcbG4FygVeCaT6BBYFcAQECAYE0Kx6Dd?=
 =?us-ascii?q?YIwBIIiehIbgT+CG4FhjDNSciIDJjMsAVUTFwsHBYEjEDMDKi8tI0sFLR1wD?=
 =?us-ascii?q?CcSDx0XFh5YGwcFEiAqQUUjA08/OAtDBYFXAoIFTiMfAzl/gS91SnctagIQF?=
 =?us-ascii?q?0o4JIISAoE7Ak4DC209NwYOGQMEgTUFjG8HWyOCQIEOAQckT4EFCjUCHZNHj?=
 =?us-ascii?q?0GBfIxkk2SBMwoog3WKe4EmjT6IMheFW6URC5h9I41nlWAghQ4CBAIEBQIQA?=
 =?us-ascii?q?QEGgWg8gUcLB3AVgyIJCkAZD5IjgX+DFMkneQIBAQcyAQEHAgcOAwuBaJAAg?=
 =?us-ascii?q?X4BAQ?=
IronPort-PHdr: A9a23:2/fp5hYL18p0bby/MySgoBv/LTAchN3EVzX9orI9gL5IN6O78IunY
 ArU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:H5dt765fFf+Lvklqd/925wxRtGPGchMFZxGqfqrLsTDasY5as4F+v
 jAWWWiBOvrfYGSmLtl/a9u39x4BuZXczYJlG1Np+3syZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eH5JFpLpJUD51/
 t8cayJOZAuOobyGz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkERUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMIYHbHZ0Kzy50o
 Eqd5lnCGxs4Deal5me8yViVv8D3r3vkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dbDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:z0ficKwmzyTHYswfK/eaKrPxJegkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5uxoWJPtfZquz+8K3WBxB8bvYOCIghrSEGgP1/qH/9SkIVyDygc/79
 YuT0EdMqyLMbESt6+Ti2fIcadE/DDEytHUuQ609QYKcegeUdAZ0+4PMHfjLqQZfnggObMJUL
 Cnyo5soT2mdX4LbsK9KEUkcoH4zeHjpdbNWzJDIwQoxjWvoFqThYLSIly1zx0eWzRAzfMY93
 TZkwv236Ons/uq4B7R3W3e4v1t6ZXcI914a/Cku4wwEHHBmwyobINuV/mppzYuutyi714sjZ
 3lvwogF94b0QKQQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINidAfD4UZIhqA+7E
 sL5RPai3NkN2KFoM3P3amOa/isrDvznZMWq59Xs5WYa/pGVFYel/1GwKofKuZwIMuz0vFWLA
 ApNrCc2N9mNXWHcnveom5jhPaoXng1A1O6Z3JqgL3P79CT90oJknfxA6ck7y09HJ5Rceg228
 3Udqtvj71AVckQcOZ0A/oAW9K+DijXTQvLK3/6GyWtKEgrAQOFl3fM2sR82Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjpg23ek1hpTsAL7wdSGTQlEnlMWt5/0ZH83AQv
 62fJZbGeXqI2fiEZtAmwf+R55RI38DV9B9gKdwZ3ue5sbQboH6vO3Sd/jeYLLrDDY/Q2v6Rm
 AOWTDiTf8wmHxDmkWI9yQ5d0mdDnAXp6gAYpQy19JjvbQwCg==
X-Talos-CUID: =?us-ascii?q?9a23=3AJJfTKGiMClSwmRSGMDFTJZxX9zJuUGKAkivuchC?=
 =?us-ascii?q?DAkVtC6/WQ0Sd3v1UnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ADAu6egx8Mzc9YkUDTnXICrvrneiaqP+3NXsUm7c?=
 =?us-ascii?q?/gfOraBVLEQ6kowyFGpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 05:44:26 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id D9A2318000203
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 05:44:26 +0000 (GMT)
X-CSE-ConnectionGUID: q2osOFUDSgCJp/AhLUdRdw==
X-CSE-MsgGUID: RPZv+a3PQHmo2EKrBoB4mw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,176,1779148800"; 
   d="scan'208,217";a="88891856"
Received: from mail-eastus2azon11011027.outbound.protection.outlook.com (HELO BN8PR05CU002.outbound.protection.outlook.com) ([52.101.57.27])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 05:44:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3qJhXHe1yqT/CMH3rOTjd7xNxZFc/hJvGmeWPhxTh+8GoHGe1FVlhN48dDLoMbaljeoWnrAL955c6AyMpYCdv521S+bfLs6GmYKssqki4KD4zKTUq0edbUIVpg5+GGYTTVpbaQl/4guKfC5Lx5BbAA597VMmaM9o+ggILD8/tltczxPJAuw5FA0n5fVxYsVYH0rxmSOJFFKsPGuds9M1eAJd2re2ik/8WsgAmBklgITeHUw7wGHK2L/8VAUCp45i+40szPU0LXU6pLss/EpvIBIJhFOADO3Yfjj6NncCQ7H+eWcDDmECPtcROn7bd63zUhnFTf5lT5kHFEySGccFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bDrDGsZ7tPwhMl5znlHj8AsTDySMvLjSUGheaegYvc=;
 b=E/s+R2MXwYEz1CmkJ5eKcaGwu5yzAzrd3UMkw8+zgGb5CvoETKoNT/PYhmbmP5v0+k/NSvEmS8H5/FwUOm9v6OKcqnTSrkiSEyXLbDWJ60psMhhSG2gh3zYsL7bc1sNq3NbGU0zg1yxgcOPh4KEEOS+dunmPWGSCEckyn9jzuyzZsMca2f+mZ9H6ltHo+tADY1vJNt2aJz/PjG9bs9wW0BbrebgFZIYRxM/Zb90Dq9XvQ5mtY9wqjU0jOhLarWj8BU/7skA604/b/bwr5lS/pA/8vjC96C2yVPtEEz3BJ2vljuMd/8yzxvlsUdvuC8Zby9Rhfblhoy6s5Kh6G7t80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 IA1PR11MB8832.namprd11.prod.outlook.com (2603:10b6:208:59a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 05:44:24 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 05:44:24 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 01/10] expat: fix CVE-2026-56403
Thread-Topic: [OE-core][scarthgap][PATCH 01/10] expat: fix CVE-2026-56403
Thread-Index: AQHdF5KO8BPV5w7e7E+TSunO7xkDBLZ2VpsG
Date: Tue, 21 Jul 2026 05:44:23 +0000
Message-ID: 
 <CY5PR11MB61878CA067B1DABD9ECA9294C4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260717060437.2910653-2-deeratho@cisco.com>
 <DK2NGFYC221R.2ZGB7E3EHC3QX@smile.fr>
In-Reply-To: <DK2NGFYC221R.2ZGB7E3EHC3QX@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|IA1PR11MB8832:EE_
x-ms-office365-filtering-correlation-id: deb90ff0-ce53-4674-9a3d-08dee6eb1eb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|56012099006|11063799006|10067099003|4143699003|8096899003|13003099007|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 WzaN5cE9TilYN0Z/y9d93ThYddMWtvlDVIP343/MmDVcjgBxt4H0eaXWQ/CWtdkEPoQHA/oz3WoE3QKSzSdIe2qjsfxzP/ZkeKFhbummcdJh9+zuK1USPGdNWMcjkJDAO1JFhtAyz42CHlISXiay1BFWlWemdkbKZMbD5/E2joMYIidhBL6Z/j6Z3LtbtTPbiiDzoYPNe6QMvlFNhIcaoYkuyde4lc8+yxkrX86lzwJIIhOnJNLsTZDUXB3ivhJ0WsXpRbJ5AplujTLuqvIokBEq0njCMxpAN4p4W8WqGrgVlyhnmmWVsPjdvA20ehPEShbZ2IPbMdW23YiB1+8vkt1C3LUCVLn0HzzFd5bxDNBJQQbam4RMc+oSnKrOSwo0Mpul76IYCvB5/PECt0/N6lVDcNLCZ216NT+ZrYyePkJ9XXYizP22ZdmW/QzRfFqy+ULJwCSbanPllcD6su/SJ8TrzeyYjX/uIWQtvS7kHWuk7xbigpRcgXMc/lCBaSfaacj6mU4qV7izySuI8nAWoTVdXHsWFemVEJOncY5a1OwDen12cJm8JT1KG2bFhUjj8BWhIG42kd8cQop2hKloAGSayRY2naO/nU+M9uaMY6WcEAryCaR3qQJjjg2F3RPBwh6D61i8PEDt8wm7Q1zL/ZDtuOGNigyKGu6ZPRyLCrU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(8096899003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hTwUF6B477a44LJC3fMDMiiRsq1qtrCEJmsWUXTSNYEoV5PFmv2N1LNyFW?=
 =?iso-8859-1?Q?qFQTA7V5O+A/WcusxHTNfeI0btBa50B05ADjzRKN5c/aut94mM+AVuizHx?=
 =?iso-8859-1?Q?sO7aTws2wauhbJB7W0WRa49Q8ZYuH3Bv3omPOI4+6/qCVtmKpXRTr2t5eX?=
 =?iso-8859-1?Q?aSvVeIXeYdOb7sc7KX1/5tUgz435lS1pkJ6W8OnBIwtJcYmx7kPJ1tRuTG?=
 =?iso-8859-1?Q?qKq8IrH1qHJ3qOS6VczbiFTUAy283h81dDcZx/+57825Ni8WKc8Uc8h6F9?=
 =?iso-8859-1?Q?mEeAaauet8L+ZXsxWPSCUCg5xzHWOknV+yp09t+G8zKL0jUz/CmIq05+gh?=
 =?iso-8859-1?Q?s1Xqv+/i3ZATf1APQXD5bjXAg60+2CqXNzNOZE6xXWNRcNiJYpgTuAduIM?=
 =?iso-8859-1?Q?ALr1y8ApP46cU5pXcQhwLdIksw2rrNlthCyLvjt9Mjp8EddIBuOvodeNTy?=
 =?iso-8859-1?Q?7sxNd21YYFxtyuDQY2hzWmNO6M0KlxrHazBWzWsk2Wpe7IIpX29RgxGBh7?=
 =?iso-8859-1?Q?oQUK7EWY6CfupbF47wDvRGGNvd1RDPeLPtDCLP2jPGGItmHrmpCt7GTOAk?=
 =?iso-8859-1?Q?uOgRzLj5P/IKsJwKEhZdRRBdTaF7cy5+KzXkM5TrUiy1H0yjB/uRJ/RgP0?=
 =?iso-8859-1?Q?C6TdVV+wDwwzcmJltI/GkBZenLe3P1ZpwaC6m3KBguC6X3s+j5/r3ZVe9I?=
 =?iso-8859-1?Q?5+vGc2VctH+n2gnndeO2uqIFQF1SlkdrNkrHgELHDxw52ywU1ErTxcZmQB?=
 =?iso-8859-1?Q?rn9cn/T2+WyRjHO9hRkW9bnvkib+kBGO6PaMBamDbfjAE7JUfd14O08l32?=
 =?iso-8859-1?Q?CqdFSkqCRW0lTdv8GV53g05Y5rzlxd8Z/3YrHQdNwJEfSEMGvSNcBtGz9T?=
 =?iso-8859-1?Q?zaEysS8UHJz3ugLgU1Ty0RFwWFS2Xx9VfQ9J3AQcHJ/uw5SF2bmypwMXBy?=
 =?iso-8859-1?Q?68eSNHGWagk9yZPFDh1viaj3fd16oQWFj8AVbEXAzenoAlcSE2iGynNoGl?=
 =?iso-8859-1?Q?DnCj5O9Tf7avOHhuhjyc0OKlL75RoyrXXfuTs9Wt2Kut42DEld8fxj0RcQ?=
 =?iso-8859-1?Q?hcwMMX1rmq+aMP9zG2EaPiQqbRa4D4Fm2O7zpYjqDS/gEPMimok6XoCpzM?=
 =?iso-8859-1?Q?RZ5q/GvtjyZ2SyqZK2sSHy6UoLrVUQskywWX/ke+VmZ2Y1+xSAPKSO3qOS?=
 =?iso-8859-1?Q?OOQNuCp0kZx473ovvgfRnGO21csX9Ee+jX+V8v24yUGD3VlENjDkeEIps8?=
 =?iso-8859-1?Q?SXfohlxTj9qKIll9z6ZZoDaJKmG0xoCX8HjTREV3GNWOkharzDeDoD7UxQ?=
 =?iso-8859-1?Q?8jfTnTne+3OoUJnCgFZ3xOhFnYDNanSDNTQBIcbfj+h1mDOUmChh4JxC4G?=
 =?iso-8859-1?Q?e1qAKMtfm2H+AExvY3lSCDDXmFGBaP0evA42fWkU65Y6ycNtBROEnzbe2H?=
 =?iso-8859-1?Q?sOX+WAkv5lMDJLndnKK9rpsx/5s7Xb7pjtlCb83ToUsH192RcmyPa2C+RW?=
 =?iso-8859-1?Q?gd8Z0i/o2IgViA6swob0gUSpw8Ek16Vt+5BAqnafOYnzTSCIFa95uDnTIe?=
 =?iso-8859-1?Q?5j68baY5JV5B8jFyN56ihnZRukWOiNpyi7f18D2aQuxcqQtKKxFcYB1jZt?=
 =?iso-8859-1?Q?mWqGxrfvVdgyW3/2JQv/82Ff7yLSjEB5v1hLSrCo8KJB7W9B/+FLziIRGF?=
 =?iso-8859-1?Q?1yrti2W73HxVE7Z6hNEZimuavTAydmVd7FtbxrtG58oV8sJZiORFDB0ZQn?=
 =?iso-8859-1?Q?CDnDWUyj1pZN+kr/m52AAz2EbiUiQLgmrOhK2Dg1FrSYAN?=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR11MB61878CA067B1DABD9ECA9294C4C32CY5PR11MB6187namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ezO7MGjmfT34J8lnwg2kzE6te62FA0KzwIojsy4wJ0LcLaztnB9J1QVE6wz+tlexNYrcl0pMQEQjwW9cdD1NJAeGft7nEsnEjJKY0uujadVLPPyjkQJPIf8/V0WeY8AxYxlN0hT2DX32y8Y0JXbqv6HhLdFE0zQYVbhF7R3hB4UYYs3VO1e13PivGpRFtANoYCb3iw78GXNqOzCcM4d7UCUmjvNKQFkIla2T2rA64RmApcHl9UIId+YoSwfp3rnZAc6W3vMDNdfa1L2iTcErS2JfR/T4YrE1ob2a19S3KqCXjyNn01iyTwZd/po8Hq64NwP/yyWmHqDwvlt5LhtBPA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb90ff0-ce53-4674-9a3d-08dee6eb1eb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 05:44:23.9812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7A55e5zgFnA4iq1Q351OLNgSAT2lGNVgjYZ4Yaxub76Pqqt41SATavuj8BEyLKnG6mIMuAtna/LGiSecmg1YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8832
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 05:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241504

--_000_CY5PR11MB61878CA067B1DABD9ECA9294C4C32CY5PR11MB6187namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sure, Yoann.

When the fix for this CVE CVE-2026-41080 is merged, then I will send the up=
dated expat patches series.

Thanks for your review.

Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Sunday, July 19, 2026 8:53 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 01/10] expat: fix CVE-2026-56403

On Fri Jul 17, 2026 at 8:04 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> These patches apply the upstream fixes shown in [1] and [2], as
> referenced by [3].
>
> Upstream pull request mentioned in [4] contains both the storeAtts fix
> and the related xcsdup overflow hardening so adding both source patches
> explicit, even though the published advisory description names storeAtts
> specifically.
>
> [1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d856=
5f6bf1cf245f648
> [2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c0983=
70a8362aed47b15
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403
> [4] https://github.com/libexpat/libexpat/pull/1232
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../expat/expat/CVE-2026-56403_p1.patch       | 81 +++++++++++++++++++
>  .../expat/expat/CVE-2026-56403_p2.patch       | 52 ++++++++++++
>  meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
>  3 files changed, 135 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
>
> [...]
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta=
/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> new file mode 100644
> index 0000000000..b578cb60cc
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> @@ -0,0 +1,52 @@
> +From 2855ce68a1ce9732267c06734427930364ab66c1 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Fri, 22 May 2026 00:43:52 +0200
> +Subject: [PATCH 02/17] xmlwf: Protect function `xcsdup` from signed inte=
ger
> + overflow
> +
> +CVE: CVE-2026-56403
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1=
47c8f36d6277d5c6011c098370a8362aed47b15]
> +
> +Backport Changes:
> +- Add stdint.h and convert count and numBytes to size_t because
> +  Scarthgap 2.6.4 lacks these upstream prerequisites.
> +
> +(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + expat/xmlwf/xmlwf.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
> +index fd4fc3f8..7bbdb303 100644
> +--- a/expat/xmlwf/xmlwf.c
> ++++ b/expat/xmlwf/xmlwf.c
> +@@ -45,6 +45,7 @@
> +
> + #include <assert.h>
> + #include <stdio.h>
> ++#include <stdint.h>

Hello,

Same question as the wrynose reviews:
https://lore.kernel.org/all/DK0Y76VFY9IE.2KH0G9SO8XT0U@smile.fr/T/#m9932c3c=
d0b7d0659653d92b0a3ae69577fb780c8

Since I'm trying to merge the fix from Peter:
[scarthgap][PATCH] expat: patch CVE-2026-41080 - Peter Marko
https://lore.kernel.org/all/20260505205229.2139449-1-peter.marko@siemens.co=
m/
... the new stdint.h include might not be necessary.

Can you follow-up on this series when that merges?

Regards,
--
Yoann Congal
Smile ECS


--_000_CY5PR11MB61878CA067B1DABD9ECA9294C4C32CY5PR11MB6187namp_
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
Sure, Yoann.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt;">
<span style=3D"color: rgb(0, 0, 0);">When the fix for this CVE </span><span=
 style=3D"color: rgb(0, 0, 0);">CVE-2026-41080 is merged, then I will send =
the updated expat patches series.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Sunday, July 19, 2026 8:53 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 01/10] expat: fix CVE-2026-5=
6403</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Fri Jul 17, 2026 at 8:04 AM CEST, Deepak=
 Rathore via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; These patches apply the upstream fixes shown in [1] and [2], as<br>
&gt; referenced by [3].<br>
&gt;<br>
&gt; Upstream pull request mentioned in [4] contains both the storeAtts fix=
<br>
&gt; and the related xcsdup overflow hardening so adding both source patche=
s<br>
&gt; explicit, even though the published advisory description names storeAt=
ts<br>
&gt; specifically.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/libexpat/libexpat/commit/12dc6d8d3d6=
5f79471a94d8565f6bf1cf245f648" id=3D"OWAbe32eab6-cc14-ee71-c818-94de478c382=
3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1=
cf245f648</a><br>
&gt; [2] <a href=3D"https://github.com/libexpat/libexpat/commit/147c8f36d62=
77d5c6011c098370a8362aed47b15" id=3D"OWA14e8e773-02c2-9f90-e0d9-806db61b788=
c" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a836=
2aed47b15</a><br>
&gt; [3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-56403" id=3D"=
OWA6c972f2f-f11b-cbaf-c6dc-935da40aa9cd" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-56403</a><br>
&gt; [4] <a href=3D"https://github.com/libexpat/libexpat/pull/1232" id=3D"O=
WA82fe4f8c-54d3-2440-6114-a7f4297d7cb9" class=3D"OWAAutoLink" data-auth=3D"=
NotApplicable">
https://github.com/libexpat/libexpat/pull/1232</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../expat/expat/CVE-2026-56403_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 81 +++++++++++++++++++<br>
&gt;&nbsp; .../expat/expat/CVE-2026-56403_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 52 ++++++++++++<br>
&gt;&nbsp; meta/recipes-core/expat/expat_2.6.4.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 135 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_=
p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_=
p2.patch<br>
&gt;<br>
&gt; [...]<br>
&gt; diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/m=
eta/recipes-core/expat/expat/CVE-2026-56403_p2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b578cb60cc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +From 2855ce68a1ce9732267c06734427930364ab66c1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Sebastian Pipping &lt;sebastian@pipping.org&gt;<br>
&gt; +Date: Fri, 22 May 2026 00:43:52 +0200<br>
&gt; +Subject: [PATCH 02/17] xmlwf: Protect function `xcsdup` from signed i=
nteger<br>
&gt; + overflow<br>
&gt; +<br>
&gt; +CVE: CVE-2026-56403<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libexpat/lib=
expat/commit/147c8f36d6277d5c6011c098370a8362aed47b15" id=3D"OWAdb569adb-95=
66-a211-5934-decfb15877e6" class=3D"OWAAutoLink" data-auth=3D"NotApplicable=
">https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8=
362aed47b15</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Add stdint.h and convert count and numBytes to size_t because<br>
&gt; +&nbsp; Scarthgap 2.6.4 lacks these upstream prerequisites.<br>
&gt; +<br>
&gt; +(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + expat/xmlwf/xmlwf.c | 10 ++++++++--<br>
&gt; + 1 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c<br>
&gt; +index fd4fc3f8..7bbdb303 100644<br>
&gt; +--- a/expat/xmlwf/xmlwf.c<br>
&gt; ++++ b/expat/xmlwf/xmlwf.c<br>
&gt; +@@ -45,6 +45,7 @@<br>
&gt; +<br>
&gt; + #include &lt;assert.h&gt;<br>
&gt; + #include &lt;stdio.h&gt;<br>
&gt; ++#include &lt;stdint.h&gt;<br>
<br>
Hello,<br>
<br>
Same question as the wrynose reviews:<br>
<a href=3D"https://lore.kernel.org/all/DK0Y76VFY9IE.2KH0G9SO8XT0U@smile.fr/=
T/#m9932c3cd0b7d0659653d92b0a3ae69577fb780c8" id=3D"OWAdd7a0553-2d3f-94ef-d=
d9b-b84a7981a567" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https:/=
/lore.kernel.org/all/DK0Y76VFY9IE.2KH0G9SO8XT0U@smile.fr/T/#m9932c3cd0b7d06=
59653d92b0a3ae69577fb780c8</a><br>
<br>
Since I'm trying to merge the fix from Peter:<br>
[scarthgap][PATCH] expat: patch CVE-2026-41080 - Peter Marko<br>
<a href=3D"https://lore.kernel.org/all/20260505205229.2139449-1-peter.marko=
@siemens.com/" id=3D"OWA7ee33b0c-b2ab-bd6d-9105-fa03705d8b95" class=3D"OWAA=
utoLink" data-auth=3D"NotApplicable">https://lore.kernel.org/all/2026050520=
5229.2139449-1-peter.marko@siemens.com/</a><br>
... the new stdint.h include might not be necessary.<br>
<br>
Can you follow-up on this series when that merges?<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_CY5PR11MB61878CA067B1DABD9ECA9294C4C32CY5PR11MB6187namp_--

