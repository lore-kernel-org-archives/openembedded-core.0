Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04977C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:07:16 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2533.1784567229183947711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HvuDHpjj;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8913; q=dns/txt;
  s=iport01; t=1784567229; x=1785776829;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=0A69cdzAWWeyB0xXqUsBKDHGSJ04cdOTRh2XclA5oWk=;
  b=HvuDHpjjiMhdMx2BwmNNKhzCFWcL2fqWucgh1vd8rbGsUOMKJiEEU0V2
   wbpdXLFtvYgvE9YQJA6O+HWGMUOtVF5gl5Tm773efhHXLgduv/Op0aynu
   NneIN4X+RGp9pthzyrYyPISfqPIT0+qt4X1b4e8vsNOnB84P4b63K22dj
   ixCrillD2eOX6xRykuQoNDtLdQjqdXDPMZQrseBaW7aLpSb4Bqc2W3Oeu
   lEyGnN9msywjttaYlGkyDB0wQOiZnCQSG3ikNCKPzWJw/Dk9uO+uKU6kC
   apzUB7RUYi1GocNtaA4hrdsFX27euMEG1+NVpCRIywhNYQ4oJtSAxzgkx
   w==;
X-CSE-ConnectionGUID: RU01YVqrQLuILoU7IMYQOg==
X-CSE-MsgGUID: 7z9nLgPjRMyLNxRGUxQ9sQ==
X-IPAS-Result: =?us-ascii?q?A0B1AwB0VV5q/5X/Ja1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJA4ggA4UrhliCIQOXRIZXgXQKDwEBAQ0BAS4BFQ0EAQGEP0YCjVMCJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDAREVJ?=
 =?us-ascii?q?AE9AgEIEQQBAQEuJwodCAIEARIIGoJhgh0WQQMBAg6vEgGBPQKKKniBATOBA?=
 =?us-ascii?q?YMoAT8CQ9wKFYE4hT+DHAEBKoE1gl2BIhgBhHwnGxuBcoEVQoJpPoEFgVwBA?=
 =?us-ascii?q?QIBgSQQK4QTgjAEgiJ6EhuDWoFhjBZSciIDJjMsAVUTFwsHBYEjEDMDIAovL?=
 =?us-ascii?q?QIUDSIPBBYFLR1wDCcSDx0XFh5YGwcFEiAqQUUjAxQ7PzgLQwWBVwKCBU4jH?=
 =?us-ascii?q?wM5f4EvdUp3LWoCEBdKOCSCEgKBOwIOAwttPTcGDhkDBIE1BYxUB1sjgU5ye?=
 =?us-ascii?q?xQrIi1RcxkGkzGPV45gklOBEYEzCiiDdYwhjT6IMheFW6URC5gXZiONZ5sOA?=
 =?us-ascii?q?gQCBAUCEAEBBoFoPIFHCwdwFYMiCQpAGQ+SI4F/gxTJJ3kCAQgDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:Pf57Fx/JHLrKIf9uWBDoyV9kXcBvk6//MghQ7YIolPcXNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:u2Rjsa65X+TylGUsmkh4LwxRtGPGchMFZxGqfqrLsTDasY5as4F+v
 jBKWziFaP+PNzbyfdogOYnnp0wPu8eHz4NmHgpqqC00Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Os/rdwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eB7BAo9dJGHt30
 eE5DDcwMTGmttuRz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMIYfVFZsIxi50o
 EqZ7TX/Jh4iNua62B6j4kiDu//2zDjCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dYDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:gVbZLK6c/uWS4UjDSQPXwcGCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ4dcLC7VJVoMkmsi6KdgLNhcYtKMzOWw1dAQLsSibcKhgeQZxEWldQtmp
 uIEZIOcuEYZGIS5a2VkWvIdurIguP3jZxA7t2uqUuFODsaE52ImD0JczpzfHcGIzVuNN4SLr
 bZzMxBoDarZHQQaeqGJlRtZYL+juyOvqjLJTodCTAayCTmt16VwY+/PwmT3x8YXT8K+rE/7G
 jDnTX+46Woo9u7xhXf22K71eUZpDLm8LR+Lf3JrvJQBiTniw6uaogkcaaFpioJrOam70tvuM
 XQoj87Vv4Dq0/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBv4REaRHUgnBQ/+2UkZ
 g7nV5xhaAnSS8orx6NoOQgkCsa0HZclEBS1NL7SUYvCLf2JoUh9bD3t3klYavoVBiKmLzPVt
 MeTf301bJxbU6QaWzfsy1ExdyhWWl2IzK9K3Jy4fB8F1Nt7S1EJ4xy/r1Eop8NmahNOKVs9q
 DKNL9lm6pJSdJTZaVhBP0ZSc/yEWDVRwnQWVjiamgPOZt3ck4lkaSHqIkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmL0IdQ+h7ATW2hVXC1o/suqqRRq/n5Xv7mICeDQFchn4+ppOgeGNTSX7
 K2NIhNC/HuIGPyEcJC3hH4WZNVNX4COfdl8OoTShaLuIbGO4fqvuvUfLLaI6fsCy8tXiflDn
 4KTFHIVbN9B4CQKwjFaTTqKgfQkxbEjOBN+YDhjp0u9LQ=
X-Talos-CUID: 9a23:/HbMp265zx36YKJySdssznNMQ/Eba2fk6GrxB0iFVkdMeYSyRgrF
X-Talos-MUID: 9a23:i5Lehwjwdgnb5GCH4VRAGsMpa9U55YChMEI3tIQindm+GhFgAmaGtWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:07:08 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id E9D4B180001D3
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:07:07 +0000 (GMT)
X-CSE-ConnectionGUID: iLp7CPucRoq79Bxe5FJJzQ==
X-CSE-MsgGUID: oRLNjwLIQsST4jfO4A7/aw==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208,217";a="65254572"
Received: from mail-westus3azon11010019.outbound.protection.outlook.com (HELO PH7PR06CU001.outbound.protection.outlook.com) ([52.101.201.19])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:07:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIYrmlJonCdYt7P9TPPPMIPG3j/mYbec0KD9rv+J/0qx1yhVUdQ0rIBVoUTbE816wCB4hvY3mAbvgqmYf9V9z+rIzzp/uD1k837Iy8lEgN17eRj3l1uzXnMj/p0+1Io1pPGuWKnFywTdXMZIQ5bJTaMmD11edHNFKY3Yf33bjbZZXYtZEv38o6rlr4qhc4Rr6chZFVqXjTzULE/L61DDkrONhyDGiBxLvLuSbwQFiWCS9VN4BRoD+cwIwbXXXsXTT1sj0sH8KzDpxwo95prbuhYWUR/aReWG3YBn00bamP+EL2wSbRj4VKuc+WY+jMSAKOdub3laTw8GWQh3Y25rQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A69cdzAWWeyB0xXqUsBKDHGSJ04cdOTRh2XclA5oWk=;
 b=M0TVzmKyd7YlX0J6JT4bvHRp0itH208+C8uahONazwi1x6P5PL4M6fCuyTd3YYAttEnmgxEC6H89O97mLnt1++tCJ2y91MuUaNivvOfAZXfO3H0zsU7M4a/JbnBp0MCyhwq54gNDpoRa9o21tzqAZ7a3uQNuRir0rP38f+6Fp7HAuPVnXdjVeu9uvlOug8GIs19ulukalRcTC86ZdLlVYvvuAc+t3Cbt+j7CKgfke4QR8iCTXVHaA0KLy76LFCKqe3CA+6PPArNY7jJnEi9Ow4jBatCKOtsA7Jn4n7Zd7yHytXx0zVdNeYoHxSvwVhgijP60+2FNpLwc3R0Xzj/qHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 IA0PR11MB7883.namprd11.prod.outlook.com (2603:10b6:208:3de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:07:05 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:07:05 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<sudumbha@cisco.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] libpng: Fix CVE-2026-34757
Thread-Topic: [OE-core][scarthgap][PATCH v2] libpng: Fix CVE-2026-34757
Thread-Index: AQHdE5dIEJruAtMHrEqJMmarv1t0DbZ1cqwAgAE5cB4=
Date: Mon, 20 Jul 2026 17:07:05 +0000
Message-ID: 
 <DM4PR11MB6189484F6ABA954C607FF120C4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260714134636.2883793-2-sudumbha@cisco.com>
 <DK2WCCX2M98E.292ZS2S1QFM96@smile.fr>
In-Reply-To: <DK2WCCX2M98E.292ZS2S1QFM96@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|IA0PR11MB7883:EE_
x-ms-office365-filtering-correlation-id: 6374e672-9f0d-4cbb-5f1f-08dee6815339
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|13003099007|38070700021|18002099003|22082099003|8096899003|10067099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 p5D1GCer3z2D5Zx2mLnLTim0uEeNONzV1fyk6YEomav4ISO9um14ZWTFWSGSYn0Zd5ggF0YYNgi4UMljFQVOpdzRAXHs1w+tCYv7SAmLUwmIHCLX8obvrDV3bUIuWd+OSyGILauwEg2be4m6pdYMr7cM7P77T6ghMi0cMxY8HBM59Ne44I0tL0+gz/O3lOkcuF2qnDzxUVR3Uy+KPw9f2xHFJpYvrTlagDIsszVl66kiKatNEYqHldPbm5f9ofRDwVQRJsg4bxfc0aMaoOuWDwFPJO2J2sKAw3w5OVsNkqkr3q7F8aAHISqJewi6wGR9S2hoquQHHnXfokfLnjDzWw8UlefkKAeXLPP6HfvQvpbZHNDC5YQeP100WQG02YNaT7IF7y2zgu4wnRQQN7o36t2x0VRrr3KSgShRU9IckR0Cz1X9oGMgbynJxb4fNt9kS8arKWJv7Lrz7TyTmg+Gqy9kgbPjuyJPfxWpUG2cO5AWKbmFEjZmFHV74rpEWCQub4XYmNksxEHVy85rMaHlVYoJ80MZy0Z1mqow9yQhvjqcV1btoVfFwElKu2dlHlsHIort2rh0Lqa9meFIIH0k2ERcPZBOhyxLlioMlUVAA0PE2qMmOGqz9v9jOGLO+ElxfTMX+32itlYDnfntJW0G2mGsK9dpseFdQi7bGodpsi4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(13003099007)(38070700021)(18002099003)(22082099003)(8096899003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PlckQr+1vH8vRZInjVVeFIRT+k+jXfsq7yZsDeQXrH17ErNYW0ovvGB+Tde2?=
 =?us-ascii?Q?1Zu+dyIQRXXNFvKs1uO0RQyp5jM18brjW9VEIhw1liKWNky0cketmLyrfjp6?=
 =?us-ascii?Q?k4h/5bXUnBoTKeJ7rpWHW+NODUVLki9NKZLkTkCCGLLhrvWa+zOjy/XjtVlX?=
 =?us-ascii?Q?NpwBFNFX8X6+gj0iOv3MAcDN1nJ8ToXT1ZRxHeBc4ndvNWqLtR3memLZzZK0?=
 =?us-ascii?Q?xmPMJdKg1zr/VaOuMYjjLZ32z0BhttVtdbW11syjGmGKd5mBxaE1Uel1VXCi?=
 =?us-ascii?Q?tACLNEH97giKwX64vXZB+2rKAAR1zbkhbSQrYz7eAW0MfR+vK6d/q2DcmfQe?=
 =?us-ascii?Q?aG9x0/ROUAVsL5g26MPC9Gcf9hxTLMPPqaOpIQQ9m14B2Qp8HI5juHtIT6sq?=
 =?us-ascii?Q?4tvlMAbDeHbNMRoVnubiOqs+NRe7UBHUwl2Sj9jcUQaz9W2X8T+Uknq3IAwU?=
 =?us-ascii?Q?9fW/mr+AUnFp005PhiwJK3iGCwt+T7l+Rr0oszOkPSNmwOAjdAkSEiaG9klW?=
 =?us-ascii?Q?CqzJBSJdvV610uO5U3fYhpOabR/B0h/Bv3pD+sizXw1CNskHIUdyl7xdZTfB?=
 =?us-ascii?Q?xcnJI4x8CfmamBtc6SRJehzVnPOcB/KrCZJfsbQUYF9scIRYzIqU8vrPdukg?=
 =?us-ascii?Q?NZe5XhGvfkAaC/ZCrQt8PuDQZm0lOw2o14cyPohHKgKNN8z7RrEpHPrT8Hi+?=
 =?us-ascii?Q?HYQ5jTDqYevaAYka4xj6cYwRLQSU2samjHayJVhFaw01pqKVL9dfReud+kHq?=
 =?us-ascii?Q?DKRkF+3NW3wQBn1vn02q3oWxfs1YD1e5XwEgpDtCepbGAIx7YapyTLYu4BGX?=
 =?us-ascii?Q?UeBjggZ5ka1AEL669xfku///Ipz/N10MA/M/Q8C+TiDSrw+ORXXw54KgXwsk?=
 =?us-ascii?Q?1iUp97gH2b/QAMF/5Z2UnlC0a3SrzXL1O7mr1nMqwjo/gOL7I3I+RLNFVtpz?=
 =?us-ascii?Q?f7N3pmUYpWbalx3ck0b4Er6XktCryeugIWO9kCHWZr2+K4QXtWf7ZElxCmnW?=
 =?us-ascii?Q?jKicz8GkAJjYMQyVZcpPxJ5z1ZIlZVVJ5v+yosx1t7xikOq4xppJiz4t8GIQ?=
 =?us-ascii?Q?2xam8CJhiCtYOeriBpwdcnKRslZrF+WEhCSvp3y98DuWwrXV3IVpGWkV+5kf?=
 =?us-ascii?Q?D0TpNFOr3N+gnhDtsuEncv1CSxSbRiiqKq5hr+gRGA2oPSwMcfnAPI+6dYV9?=
 =?us-ascii?Q?E5gasWTVFQh+3XfXu1GOz+MFHfSKLJmEuIHgfxm/UMBS25j/UCtxJg7fe2vi?=
 =?us-ascii?Q?14SfNNgbSgLf2+SAyRsYtD7Mjr/TjZ/+UpWgyYCIlq3X3fRLmY0L2RGtF5jD?=
 =?us-ascii?Q?kUhZ84LAegvzOUFRirJCzYDMkGT+lMgl45FvPkIQxYNMAimMQ3oF88/o36Sl?=
 =?us-ascii?Q?cv7cY36ke+agJ8eWnD4HeQaI8CkGzni2mIFJ864a9sI7XRS8+rwJnRM+OyEd?=
 =?us-ascii?Q?qEJ1bsdvg4TOkdyOZfIxnhFQlNO3VdZWI/LjGvX6xyvWbGVsvVdEcsgkTc82?=
 =?us-ascii?Q?phftM+pUORZgFUZ363foQFgXsKgnD/CPzxCFBtD56o4IL1CvLeY1EeViAlgM?=
 =?us-ascii?Q?iSM0KyM2L3iFhf/J9yDm4JfVKt682B+9rEitwU+jvXIRkDsyWLxHstuN2AF2?=
 =?us-ascii?Q?qua7mtCeYYkFp9SrjLIghhuf7kvM71qxRG0te8B2QXcf+tuMe65kxpdzHh2E?=
 =?us-ascii?Q?uMEwR2PhKlyAGy84mrLI8bNzCe1a8ZEIanQSgmVSF4zjIo+O?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189484F6ABA954C607FF120C4C32DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	KAjImiZK4ENS1HpizGIb7VMkckIH9XNgsQJ+3Y4DimQE2YHcNu3zYeVGIJldi28FngIff6WT3MchieRIUtCrQwPqKs1RXL5/QiIlO//TXIpbRUx2GDBrgI8/AImmkNG6cb0Qz3+mYgxjfXeyWpgLSngsDdtX+JGp8emfJUWP+tVEvDWWrw9XYYN0hWsc+pdCpPp5+xYIbV7tua8CSxisb4xMxC5pD67oooxd4O72bQcAT6/t8hlRtICQyRLxRP5oJnqhz4jYJix4cxtohE3+56PXPRV8qj7xFD6cvI5SA3gX989fwojjE6TkvTTH5Gs5bPCaYykEu5saeZ/X/TVEZA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6374e672-9f0d-4cbb-5f1f-08dee6815339
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 17:07:05.3929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKJcZQr/XQuNHBi/DQ2tJ7fL5M/Pd/7STnmBDznx1P78XBhzFeYuKO6UXxkkEkX2zWUNQPCs5mnmNIKV3HcOeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7883
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241430

--_000_DM4PR11MB6189484F6ABA954C607FF120C4C32DM4PR11MB6189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have sent the patch for wrynose: openembedded-core@lists.openembedded.org=
 | [wrynose][PATCH] libpng: fix CVE-2026-34757<https://lists.openembedded.o=
rg/g/openembedded-core/topic/120362567>

Thanks for your review.

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Monday, July 20, 2026 3:51 AM
To: Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco) <s=
udumbha@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-=
core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] libpng: Fix CVE-2026-34757

On Tue Jul 14, 2026 at 3:46 PM CEST, Sudhir Dumbhare via lists.openembedded=
.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> These patches apply the upstream fixes [1][2], which address
> getter-to-setter aliasing issues in libpng chunk setters that could
> cause stale-pointer reads, as described in [3].
>
> [1] https://github.com/pnggroup/libpng/commit/398cbe3df03f4e11bb031e07f41=
6dfdde3684e8a
> [2] https://github.com/pnggroup/libpng/commit/55d20aaa322c9274491cda82c5c=
d4f99b48c6bcc
> [3] https://github.com/pnggroup/libpng/issues/836
>
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2026-34757
> https://nvd.nist.gov/vuln/detail/CVE-2026-34757
>
> Test results on qemux86-64 using ptest-runner:
> START: ptest-runner
> 2026-06-04T11:29
> BEGIN: /usr/lib/libpng/ptest
> PASS: tests/pnggetset
> Testsuite summary
> # TOTAL: 33
> # PASS:  33
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 0
> # ERROR: 0
> DURATION: 80
> END: /usr/lib/libpng/ptest
> 2026-06-04T11:31
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
> Changes v1 -> v2:
> - Rebased on latest scarthgap (2bf388381ae3)
>
>  .../libpng/files/CVE-2026-34757_p1.patch      | 521 ++++++++++++++++++
>  .../libpng/files/CVE-2026-34757_p2.patch      | 484 ++++++++++++++++
>  .../libpng/libpng_1.6.42.bb                   |   4 +-
>  3 files changed, 1008 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p=
1.patch
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p=
2.patch

As fas as I can tell, this patch is also needed on wrynose.
I can't merge here until this is fixed on wrynose.

Can you send a patch to fix this and then, ping back here?

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB6189484F6ABA954C607FF120C4C32DM4PR11MB6189namp_
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
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have sent the patch for wrynose: <a href=3D"https://lists.openembedded.or=
g/g/openembedded-core/topic/120362567" id=3D"OWA1b0700f9-9fe2-e071-fb26-b96=
db1ac24ad" class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org | [wrynose][PATCH] libpng: fix CVE=
-2026-34757</a></div>
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
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 3:51 AM<br>
<b>To:</b> Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Ci=
sco) &lt;sudumbha@cisco.com&gt;; openembedded-core@lists.openembedded.org &=
lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v2] libpng: Fix CVE-2026-347=
57</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Jul 14, 2026 at 3:46 PM CEST, Sudhir Dumbha=
re via lists.openembedded.org wrote:<br>
&gt; From: Sudhir Dumbhare &lt;sudumbha@cisco.com&gt;<br>
&gt;<br>
&gt; These patches apply the upstream fixes [1][2], which address<br>
&gt; getter-to-setter aliasing issues in libpng chunk setters that could<br=
>
&gt; cause stale-pointer reads, as described in [3].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/pnggroup/libpng/commit/398cbe3df03f4=
e11bb031e07f416dfdde3684e8a">
https://github.com/pnggroup/libpng/commit/398cbe3df03f4e11bb031e07f416dfdde=
3684e8a</a><br>
&gt; [2] <a href=3D"https://github.com/pnggroup/libpng/commit/55d20aaa322c9=
274491cda82c5cd4f99b48c6bcc">
https://github.com/pnggroup/libpng/commit/55d20aaa322c9274491cda82c5cd4f99b=
48c6bcc</a><br>
&gt; [3] <a href=3D"https://github.com/pnggroup/libpng/issues/836">https://=
github.com/pnggroup/libpng/issues/836</a><br>
&gt;<br>
&gt; Reference:<br>
&gt; <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-34757"=
>https://security-tracker.debian.org/tracker/CVE-2026-34757</a><br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-34757">https://nv=
d.nist.gov/vuln/detail/CVE-2026-34757</a><br>
&gt;<br>
&gt; Test results on qemux86-64 using ptest-runner:<br>
&gt; START: ptest-runner<br>
&gt; 2026-06-04T11:29<br>
&gt; BEGIN: /usr/lib/libpng/ptest<br>
&gt; PASS: tests/pnggetset<br>
&gt; Testsuite summary<br>
&gt; # TOTAL: 33<br>
&gt; # PASS:&nbsp; 33<br>
&gt; # SKIP:&nbsp; 0<br>
&gt; # XFAIL: 0<br>
&gt; # FAIL:&nbsp; 0<br>
&gt; # XPASS: 0<br>
&gt; # ERROR: 0<br>
&gt; DURATION: 80<br>
&gt; END: /usr/lib/libpng/ptest<br>
&gt; 2026-06-04T11:31<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; Signed-off-by: Sudhir Dumbhare &lt;sudumbha@cisco.com&gt;<br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt; - Rebased on latest scarthgap (2bf388381ae3)<br>
&gt;<br>
&gt;&nbsp; .../libpng/files/CVE-2026-34757_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 521 ++++++++++++++++++<br>
&gt;&nbsp; .../libpng/files/CVE-2026-34757_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 484 ++++++++++++++++<br>
&gt;&nbsp; .../libpng/libpng_1.6.42.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 4 +-<br>
&gt;&nbsp; 3 files changed, 1008 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026=
-34757_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026=
-34757_p2.patch<br>
<br>
As fas as I can tell, this patch is also needed on wrynose.<br>
I can't merge here until this is fixed on wrynose.<br>
<br>
Can you send a patch to fix this and then, ping back here?<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB6189484F6ABA954C607FF120C4C32DM4PR11MB6189namp_--

