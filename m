Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB379C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 06:25:53 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13942.1784874348739138489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 23:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PE/usZeg;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14677; q=dns/txt;
  s=iport01; t=1784874348; x=1786083948;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=upvlGN3h8Q3eSJJlrXI+08Gk52O/dMujtmSn9FbnWUk=;
  b=PE/usZegpNyHi/tGkCtU02nSvkMS1UBu8+wEEkxjFerSjWsbaRM9+kvJ
   QOcS6DRnSPhY5D8g5R+LlI9mAG9n6fprLAs+yfijYBvJHsjvC5VwZZJmT
   IMvjkwtp9MOLiUqqJnFACTZSfGpm8C1lfmm0IttU46rW1y6U7NC/onh5R
   R2pOgulXj8a6JqAqpwJWndhTkZGBJEZtt/KdFSr5xBnYi/rkRzMMZvMwr
   7z1UiMG5cJVIygKeWFyfjhz9lsaFvRkCLg8OtVQxsc9ymSmBCnNNQEqVa
   3GvFWAHMwFwFZP62mO3ZZV/nJs9Qabs8AsNpUxqAHPFpKeu1x59jhq3Ow
   Q==;
X-CSE-ConnectionGUID: G6C+OfLiTUqeAhlv/horBA==
X-CSE-MsgGUID: vEAwL885R7i46MstZBDU9A==
X-IPAS-Result: =?us-ascii?q?A0B3AwDsBGNq/4z/Ja1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UkEiB8DhSuIeQORSoxRgX4PAQEBDQIuARUNBAEBhQUCjV8CJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQECAQEROQEbBAMLE?=
 =?us-ascii?q?AIBCBEDAQEBAS4nChcBBQgCBAENBQgagmGCHRYaJwMBAg61awGBPQKKKniBN?=
 =?us-ascii?q?IEBgygBOQEFAkPcChQBgTiFP4McAQEqgTWCXYEiGAEbhGEnGxuBcoFXgmk+g?=
 =?us-ascii?q?QWBXAICAReBHSseHoNXgjAEgiJ6EhuBP4FkJoFfGoxRUnIiAyYzLAFVExcLB?=
 =?us-ascii?q?wWBIxAzAyovLSNLBS0dcAwnEg8dFxYeWBsHBRIgKkFFIwNBNjgLQwWBVgKBe?=
 =?us-ascii?q?D8jHwM5f4EvdUp3LWkBAhAXSjgkg0kCgTcDC209NwYOGQMEgTUFjH8HWyOBc?=
 =?us-ascii?q?0wBWgoGJAEbCgZPAYFDGQYLilSIUY9YgXyMZJUXCiiDdYwhjT6IMheEBIFXi?=
 =?us-ascii?q?z2ZVAuYfSONZ5U2S4UNAgQCBAUCEAEBBoFoPIFZcBU7gjMBATIJCkAZD5Ijh?=
 =?us-ascii?q?RPEdXkCAQgyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:CFuL5h+GIuWawP9uWBDoyV9kXcBvk6//MghQ7YIolPcTNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:rbJxd65iYh05pldKYN+wqAxRtGLGchMFZxGqfqrLsTDasY5as4F+v
 modDTzXP6yKNmKket0jOo2+8hsCuJWHytdjSlY9rHw2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Ot/rdwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEtMzucF5JWByy
 OUVATAJcFeDgPic6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIeMJ4XTH5ULxS50o
 ErY0k3mJkFKaebAyGbb12mwtMXjoHLSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dePEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:ijLeKalce/dfJ7RY3wImPqGopDbpDfMsiWdD5ihNYBxZY6Wkfp
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
X-Talos-CUID: =?us-ascii?q?9a23=3AQcpfR2pVUtQ3DLgcTmH4yijmUe97WT76wlPRH3K?=
 =?us-ascii?q?hBE9pTKPSSViK0ooxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A0kYOMQ4FX1YzfqbOHMNZgkWaxox2zo2xLBBdzK9?=
 =?us-ascii?q?ZupXaEDdsCR2xsWWeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 06:25:21 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 4CB4518000593
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 06:25:21 +0000 (GMT)
X-CSE-ConnectionGUID: FGMhn6nsQJiwQVQ5PR5xAg==
X-CSE-MsgGUID: yK73Gdj5TvaEYVfzv3KMdA==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,182,1779148800"; 
   d="scan'208,217";a="63979703"
Received: from mail-southcentralusazon11012057.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.57])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 06:25:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgWnpw5prqsOnjOf5MMg0Nku6byVFEJX/JYYVb2C6i2XvNiW8u2vY8OA2l8astOV9MueJO1OXuZxtuqTyYWBj1XbGxe02zm/Jbz3hUP5EsDAKZUajzT3YtIid0QMdyBMhdxcU9O63NST+uHyTCa3MYitXBAXY0mJw3rAmDnIeVDjxE75lv6mOPni8VxnwTNUIpNLTXeNjLt09P9ZlLtUvo2CKu3XjpgIvs4p4wHiNiiCvInieTU1tMj0E9OvHcLACsI9MJZDpy46JDvfWbSa1czWekUNYqH1JpiobjyJhncNriBZqeec5NS2f4h9Wy06jNoYbHHOlI+99szQay9qTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upvlGN3h8Q3eSJJlrXI+08Gk52O/dMujtmSn9FbnWUk=;
 b=Be3+ExhI3WNGln20650D9yaytongNDPV+Xi7o/w9hkb+eOsMkpniSb74VlxGVv2IVTD9UH8F6G9gX/NRp4VZCI/AFanuADrtrQirIPnSIpX8OVz2yDP8tsKV4ZWdWaJJGpHiI3Ik9MnmP6hZTA8D44RPp3QfoI/SbTB6InKKBd2EWo0PnUYt+bvEvmc4a54+t1V/K7xZcKrA/w7evd7okY4y1yvXsgSouSEPZ8UJYqXo6fD8hEnXfG+mMJr2azz0gKzLPwmKLE9iYx8ka4FB/OYmMVg2tcO/DuVKlm1uVl89BzgnB6Xxx5hWbJ3DTMDIFIXxXXamoiTSgX+dmT6biw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:25:18 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 06:25:18 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
Thread-Topic: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
Thread-Index: AQHdGHE0amyDDHyddE616yvy4J0K2bZ4Cg2AgAFGhiWAABpIgIACyvnR
Date: Fri, 24 Jul 2026 06:25:18 +0000
Message-ID: 
 <PH0PR11MB7616CD8DEB2FD928C0312E8AD3CF2@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
 <20260720175518.3546447-3-devanshp@cisco.com>
 <DK4BKV6WDHSA.2WEWS3ZC4DO23@smile.fr>
 <PH0PR11MB761612C89B048D93B36C708ED3C12@PH0PR11MB7616.namprd11.prod.outlook.com>
 <DK52FOCV13U0.39JMR5DDF9CVQ@smile.fr>
In-Reply-To: <DK52FOCV13U0.39JMR5DDF9CVQ@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|SN7PR11MB6970:EE_
x-ms-office365-filtering-correlation-id: 404cc86f-8b10-4e64-3cf1-08dee94c54ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|8096899003|6133799003|13003099007|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 UgdbNHHQAJvU34xkBkya91BkwTm22SOC26//UB0s14fq/E7u9SIUP+BtpoOA6xIevxivf386eejJ8u50YxnazFVlK7lEOLFTWyr3r75BaFh+m7oMlXjrr7dUbBOEUB+cSshhKFN7+c3botMr0eMKsU3ZT0PYLsT2pUOEVLEhf4AkISOoPK+IpqN+pxdTnDOR/Mr4gsaLmtN43B//FJykPvmoVZyLZRoSK4M74NEwbso8zYMq/hR3qbVWMRUyWcR23jXk6UDfIi196nKXNXkq8IbS4xP0fGSA9EIrm4z0Ut0NlG5Ph4g6h2t50p4WmJ/BEQUBd87CHLA47Fes1Q6oeQP87jgImCbPxU0fakox+OHzrqnkTIzwdxy6PwvGfYpfD/2FcOaivaQ7uUD3iMcosCYY3cMwiHYC8MOyztvE1GHTB1qEsmHkX2Eh6H8OocusgX9euy6yVIbxnLIIqlpNfkjfdLVBWGfLv2Dqz8is51PeQTI+tN/St9RbR+AsLlf3XToIZvDMcnJ+zYwtg3IpDD3rQnhYqDl+FQnhorBmzf06wBGewyvHU27/QO6p5eZJyBqR+N5HrsoLGnDCQSV5KHuygjfFJ8mc0Q7oT8goFLF1/TA3H6rZUB47CIlX+URbILiEPIl35ChpDxKuPjwtrmLcWmYc1AdW62T3pKQz3zY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(8096899003)(6133799003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pnW99JEg1LhYv0g4D0SW1lvRbE72q7/JTR9hK5LSDZ2fwjiNJui4wkhr4w?=
 =?iso-8859-1?Q?QRu5Q3S5zu2m5erAPoeUp7VYZhaPKpSHRQ49SQ2eWe9S8axKTSsIaswu2n?=
 =?iso-8859-1?Q?afh/uNE8aMTWEVoMdJ4lzCPUS341kXmzBILO4gT6GqbpKSWP5S6JDzxHcY?=
 =?iso-8859-1?Q?Pj/khw3iiUNcaKgIk0kbktA8ZPq1gW2LgKRAH9vg7chsGGEdJHUWvyzKam?=
 =?iso-8859-1?Q?Zvj6WD6LZ5EPUMbdvj3htnasfzUkDsmkJoqzORTCedWgwPqZ5eCLP/P36X?=
 =?iso-8859-1?Q?kt+ia7otoPAkkZNirqok01A97R3KkeEWhivXxHZiUFQw0A8sEh77hcL98m?=
 =?iso-8859-1?Q?V5S8tzxabfBRe5Y94othmF9CepQG0ClsqXv3rB6LBK/n/JmFy8IncxcF1v?=
 =?iso-8859-1?Q?cyIpDYX2yy77M60fHi7R4IWJSp74s5p/gUvJN4EYQlL/+ZO/M7isZsnZ10?=
 =?iso-8859-1?Q?n4gg+3XfPSdpmz1X65zDPNdGzQTLxM2nvKqOvZG3ZlEglsPBV9M3dsaMkA?=
 =?iso-8859-1?Q?gjNaTVo8zlpMpVJRNUgxRTL+EbWY4mAdrBVyWdEMnt+ZcEV9rvQrHEkMYy?=
 =?iso-8859-1?Q?yStjKIWYlpXwHRjylhDGCGquCIYrwxvSaS/lWizrQJCXk52P5fas+Tm3+R?=
 =?iso-8859-1?Q?RbjGQklaro5ck/bZdz5D1RqcG6aIPChn1uo1u2Lb9BmvuRMbRGCVYayNYE?=
 =?iso-8859-1?Q?PVc7QV/4fGAaKH4i8qs9/d8UcS+eZwT37I9nStkIdrTbK0X8LasbPtjes5?=
 =?iso-8859-1?Q?KWiwmqXvZ7cMpxD7xewpQiM5fiGBbDa6vshb5WbA3Yyu17nfshFaooYKcd?=
 =?iso-8859-1?Q?nWZVlhtx5ocU1O7j0v6mAg5Jp/+TJWYkDKgPsQrQhIDMMu8YaCOJWO/dbm?=
 =?iso-8859-1?Q?I9A6Blt+/S6fEFu7l0AjEGQpVTyeHdglp1EbN344epTFJ772xPTyVJE7Rv?=
 =?iso-8859-1?Q?fK7jbHvHxISoSSuCFNI2YICSlDqkce5jSfNXtZSJZQqqAxH6WTt4SRLiRq?=
 =?iso-8859-1?Q?rzt7WNoO6NiGzmuxFKX5HCnhkeRm+6oVxnx0MmB4kPTq1V0vKnqp7hgPcQ?=
 =?iso-8859-1?Q?HI5+mAy6Jg5ys1qbwfsl6uo6OxKy/+ZUBNRbtDCX/GuqUqok8jNW76yvFd?=
 =?iso-8859-1?Q?GFpBpoWwtCYASEdeengUmb35m2FZbw7IYaITeyHATxdrD+8QzZmQlA4IZe?=
 =?iso-8859-1?Q?bP2MMU7MQY9EEgEI6wjmtRY+zyhdd6Z5jx3cMsulQ6AKqJetvQh0YW/GEr?=
 =?iso-8859-1?Q?Lwwysz7VEaplJHqwmgb2KHDgucJYESZAsIHSJ9IjkzjO1ouzXIL5UmoSLh?=
 =?iso-8859-1?Q?VD3dxhOPrid1fEP5bVfmiO7M1IbyyjgKrRGtynxqg6FutjcR1Fipb6chEF?=
 =?iso-8859-1?Q?+8mOFZlxhX9m59QvVmf3WElLj7OmFiR6bXcgJoOuIOHWrEbp5pQbpKUb4c?=
 =?iso-8859-1?Q?bpK465NRqZJdG7zU1kVlbkQFxpvj95ewyfwU83BZquSYVRwYeIfIA0jKSS?=
 =?iso-8859-1?Q?JcpDhPoU1YS7Tu1CvMzQOhXrgb4lNTd1/vqkrpZG3SoyNBO1o4GvKJyeRp?=
 =?iso-8859-1?Q?ThTIjdegP8N7N32+jzKXqWYiUHGfeLSbUP2ZFnBfEQAJKZ21DPEFcgwJBA?=
 =?iso-8859-1?Q?9sU7MwNTDwCQNGjNfZIGQ5a4a35uRL4sJMyzPccP71QThVQ1pyU+MGfFZa?=
 =?iso-8859-1?Q?QLvY5CQO14rVvLVsQBewAwKpbIew0lP0JD0uMdlTsz8PJzexEpjJoITSKL?=
 =?iso-8859-1?Q?Biz9LApyo2RmfFQw9bbhZZjpdA4xTEVgdb4htx7d+xLLHG?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB7616CD8DEB2FD928C0312E8AD3CF2PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	pmQBYX1GBnEF39YRXct3xAikjDlLwPhUWHfPq7N9Onj511h2YaWou4GrDxPRDXgze6FrLjK1sluLVpVRbNxl70CyyzXi6OEioSkzrINJg+xoqmWIO2Q66nZL0Aj9Ll1lbeYGh3rQqqRucg4D1jxwFrCCr58FsodeKz3FelB/3dmWonrOAkYBRBZjm3SDYwfDvmxSHUFnM6KpNvANJ6Kr9gWK9TUrvyYAaFIHJ7nRJlGJ3lEwrxr+2HbSxtggWe9udg01tMrSgv5cO/HSj6DVJat8IWlBz8gRry54O9pLteD2bjedWqDFOvaai/R8LCyQKtgNPhFckuUdYHbf3mFL8w==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404cc86f-8b10-4e64-3cf1-08dee94c54ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 06:25:18.4467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EM+ceBOMy0vEW/JAP8dHjC4BHbunm/upcwCbeCGJo5qN3tCspRz3zVZxtlLZuzIu1uyigLCyV0S6xUO3CgPGnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-5.cisco.com [72.163.7.169];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 06:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241901

--_000_PH0PR11MB7616CD8DEB2FD928C0312E8AD3CF2PH0PR11MB7616namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
As requested, I have submitted the v2 change to OE-Core as a single patch.

Mailing-list archive:
https://lists.openembedded.org/g/openembedded-core/message/241801

Patchwork link:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260723090704.162=
5527-1-devanshp@cisco.com/
Thanks,
Devansh
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, July 22, 2026 17:03
To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <dev=
anshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-co=
re@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998

On Wed Jul 22, 2026 at 12:02 PM CEST, Devansh Patel -X (devanshp - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> Thanks for pointing this out. You are correct.
>
> The Wrynose OpenSSH recipe does not enable the kerberos PACKAGECONFIG
> by default, so it is configured with --without-kerberos5.
> Consequently, GSSAPI authentication and GSSAPIStrictAcceptorCheck are
> not available in the default OE-Core build, and this scenario cannot
> be triggered.
>
> Also, the referenced upstream commit only documents the existing
> Windows Active Directory behavior; it does not change or remediate
> that behavior. Therefore, carrying it as a CVE fix would be
> misleading.
>
> We will withdraw this patch and replace it with a configuration-aware
> CVE_STATUS: not-applicable-config when the kerberos PACKAGECONFIG is
> disabled, while leaving the CVE unpatched when Kerberos/GSSAPI support
> is explicitly enabled.

Sounds good. I'll send the rest of the series for review. Please send
this v2 as a single patch.

Thanks!

>
> Regards,
>
> Devansh
>
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Tuesday, July 21, 2026 20:00
> To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <d=
evanshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-=
core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
>
> On Mon Jul 20, 2026 at 7:55 PM CEST, Devansh Patel via lists.openembedded=
.org wrote:
>> From: Devansh Patel <devanshp@cisco.com>
>>
>> This patch applies the upstream OpenSSH 10.4p1 backport for
>> CVE-2026-59998. The upstream fix commit is referenced in [1],
>> and the public CVE advisory is referenced in [2].
>>
>> [1] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b7=
9ec926221fbe6fcc296d432
>> [2] https://www.cve.org/CVERecord?id=3DCVE-2026-59998
>>
>> Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> ---
>>  .../openssh/openssh/CVE-2026-59998.patch      | 36 +++++++++++++++++++
>>  .../openssh/openssh_10.3p1.bb                 |  1 +
>>  2 files changed, 37 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-5=
9998.patch
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.pa=
tch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
>> new file mode 100644
>> index 0000000000..3e15fe19fa
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
>> @@ -0,0 +1,36 @@
>> +From 94a089cd331eeea77ffd6fd715e61d281c3b97c3 Mon Sep 17 00:00:00 2001
>> +From: "djm@openbsd.org" <djm@openbsd.org>
>> +Date: Wed, 24 Jun 2026 06:55:12 +0000
>> +Subject: [PATCH] upstream: mention a caveat regarding
>> + GSSAPIStrictAcceptorCheck in
>> +
>> +some environments
>> +
>> +OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2
>> +
>> +CVE: CVE-2026-59998
>> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/=
commit/8058c5bdb507591b79ec926221fbe6fcc296d432]
>> +
>> +Backport Changes:
>> +- Omitted the upstream OpenBSD revision and Mdocdate-only hunks in
>> +  sshd_config.5 and retained the Wrynose OpenSSH 10.3p1 values because
>> +  this stable backport carries only the security-relevant documentation=
.
>> +
>> +(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)
>> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> +---
>> + sshd_config.5 | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/sshd_config.5 b/sshd_config.5
>> +index 3f5e29812..22b9039d2 100644
>> +--- a/sshd_config.5
>> ++++ b/sshd_config.5
>> +@@ -769,6 +769,7 @@ machine's default store.
>> + This facility is provided to assist with operation on multi homed mach=
ines.
>> + The default is
>> + .Cm yes .
>> ++This option may not be effective in Windows Active Directory environme=
nts.
>
> This is a oneline manpage patch for "Windows Active Directory
> environments.".
>
> I'm not expert in GSSAPI but can we even trigger this?
> If not, I think this should be handled with a CVE_STATUS.
>
> I'll hold this patch in the meantime.
>
> Regards,
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_PH0PR11MB7616CD8DEB2FD928C0312E8AD3CF2PH0PR11MB7616namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
As requested, I have submitted the v2 change to OE-Core as a single patch.<=
/div>
<p class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Mailing-list archive:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/24180=
1" style=3D"margin-top: 0px; margin-bottom: 0px;">https://lists.openembedde=
d.org/g/openembedded-core/message/241801</a></p>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Patchwork link:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/2026072=
3090704.1625527-1-devanshp@cisco.com/" id=3D"OWA60ba9210-1033-1177-02c6-4f9=
22aec7379" class=3D"OWAAutoLink">https://patchwork.yoctoproject.org/project=
/oe-core/patch/20260723090704.1625527-1-devanshp@cisco.com/</a></div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 color: rgb(0, 0, 0);">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 11pt;">Thanks,<br>
Devansh</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-s=
erif; font-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, July 22, 2026 17:03<br>
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
<div style=3D"font-size: 11pt;">On Wed Jul 22, 2026 at 12:02 PM CEST, Devan=
sh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; Thanks for pointing this out. You are correct.<br>
&gt;<br>
&gt; The Wrynose OpenSSH recipe does not enable the kerberos PACKAGECONFIG<=
br>
&gt; by default, so it is configured with --without-kerberos5.<br>
&gt; Consequently, GSSAPI authentication and GSSAPIStrictAcceptorCheck are<=
br>
&gt; not available in the default OE-Core build, and this scenario cannot<b=
r>
&gt; be triggered.<br>
&gt;<br>
&gt; Also, the referenced upstream commit only documents the existing<br>
&gt; Windows Active Directory behavior; it does not change or remediate<br>
&gt; that behavior. Therefore, carrying it as a CVE fix would be<br>
&gt; misleading.<br>
&gt;<br>
&gt; We will withdraw this patch and replace it with a configuration-aware<=
br>
&gt; CVE_STATUS: not-applicable-config when the kerberos PACKAGECONFIG is<b=
r>
&gt; disabled, while leaving the CVE unpatched when Kerberos/GSSAPI support=
<br>
&gt; is explicitly enabled.<br>
<br>
Sounds good. I'll send the rest of the series for review. Please send<br>
this v2 as a single patch.<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Devansh<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: Tuesday, July 21, 2026 20:00<br>
&gt; To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;devanshp@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;o=
penembedded-core@lists.openembedded.org&gt;<br>
&gt; Cc: xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.com=
&gt;<br>
&gt; Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998=
<br>
&gt;<br>
&gt; On Mon Jul 20, 2026 at 7:55 PM CEST, Devansh Patel via lists.openembed=
ded.org wrote:<br>
&gt;&gt; From: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; This patch applies the upstream OpenSSH 10.4p1 backport for<br>
&gt;&gt; CVE-2026-59998. The upstream fix commit is referenced in [1],<br>
&gt;&gt; and the public CVE advisory is referenced in [2].<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://github.com/openssh/openssh-portable/commit/=
8058c5bdb507591b79ec926221fbe6fcc296d432" id=3D"OWA5138636e-01af-79e2-1c44-=
845e215ad1fe" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec9262=
21fbe6fcc296d432</a><br>
&gt;&gt; [2] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-59998" =
id=3D"OWAcdcc6b8c-ebd0-2e16-221a-38c13b1c4ce7" class=3D"OWAAutoLink" data-a=
uth=3D"NotApplicable">
https://www.cve.org/CVERecord?id=3DCVE-2026-59998</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; .../openssh/openssh/CVE-2026-59998.patch&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | 36 +++++++++++++++++++<br>
&gt;&gt;&nbsp; .../openssh/openssh_10.3p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1=
 +<br>
&gt;&gt;&nbsp; 2 files changed, 37 insertions(+)<br>
&gt;&gt;&nbsp; create mode 100644 meta/recipes-connectivity/openssh/openssh=
/CVE-2026-59998.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59=
998.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch<=
br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..3e15fe19fa<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.pat=
ch<br>
&gt;&gt; @@ -0,0 +1,36 @@<br>
&gt;&gt; +From 94a089cd331eeea77ffd6fd715e61d281c3b97c3 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: &quot;djm@openbsd.org&quot; &lt;djm@openbsd.org&gt;<br>
&gt;&gt; +Date: Wed, 24 Jun 2026 06:55:12 +0000<br>
&gt;&gt; +Subject: [PATCH] upstream: mention a caveat regarding<br>
&gt;&gt; + GSSAPIStrictAcceptorCheck in<br>
&gt;&gt; +<br>
&gt;&gt; +some environments<br>
&gt;&gt; +<br>
&gt;&gt; +OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2<br>
&gt;&gt; +<br>
&gt;&gt; +CVE: CVE-2026-59998<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/openssh/=
openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432" id=3D"OWA=
4fadb5e5-ed3c-d422-e3dc-22e230d7726a" class=3D"OWAAutoLink" data-auth=3D"No=
tApplicable">https://github.com/openssh/openssh-portable/commit/8058c5bdb50=
7591b79ec926221fbe6fcc296d432</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Backport Changes:<br>
&gt;&gt; +- Omitted the upstream OpenBSD revision and Mdocdate-only hunks i=
n<br>
&gt;&gt; +&nbsp; sshd_config.5 and retained the Wrynose OpenSSH 10.3p1 valu=
es because<br>
&gt;&gt; +&nbsp; this stable backport carries only the security-relevant do=
cumentation.<br>
&gt;&gt; +<br>
&gt;&gt; +(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d4=
32)<br>
&gt;&gt; +Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + sshd_config.5 | 1 +<br>
&gt;&gt; + 1 file changed, 1 insertion(+)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/sshd_config.5 b/sshd_config.5<br>
&gt;&gt; +index 3f5e29812..22b9039d2 100644<br>
&gt;&gt; +--- a/sshd_config.5<br>
&gt;&gt; ++++ b/sshd_config.5<br>
&gt;&gt; +@@ -769,6 +769,7 @@ machine's default store.<br>
&gt;&gt; + This facility is provided to assist with operation on multi home=
d machines.<br>
&gt;&gt; + The default is<br>
&gt;&gt; + .Cm yes .<br>
&gt;&gt; ++This option may not be effective in Windows Active Directory env=
ironments.<br>
&gt;<br>
&gt; This is a oneline manpage patch for &quot;Windows Active Directory<br>
&gt; environments.&quot;.<br>
&gt;<br>
&gt; I'm not expert in GSSAPI but can we even trigger this?<br>
&gt; If not, I think this should be handled with a CVE_STATUS.<br>
&gt;<br>
&gt; I'll hold this patch in the meantime.<br>
&gt;<br>
&gt; Regards,<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB7616CD8DEB2FD928C0312E8AD3CF2PH0PR11MB7616namp_--

