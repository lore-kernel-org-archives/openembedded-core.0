Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9DF105F789
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 09:54:01 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12325.1773395634030588150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 02:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MoqmqIcs;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7595; q=dns/txt;
  s=iport01; t=1773395634; x=1774605234;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=3FDeKQvIYkUm8z50Dqw6Zs3/r3lxthogOBzcIiPVPb4=;
  b=MoqmqIcszrA9nRTXNZpIhsmUGriZooukV+3X6cLOEWGNFHq3FNVHSJqN
   J5z/TBhF1J8OUYu4aNJOb7SDvnZJ7mpe8VoEXDTn8Q++Oen1hERDEgTZe
   OwG08Wh9AP9PPwTCD7pqXFvgM073As56nLbncdsSCe1wyhdty4thgZdv9
   flPvKOtg9tftmrKUKFq8gNFJLuc+2Ub7zG4qZU+wa1P41sgZCZ2y47e1/
   kmjRbF0rWed9npxfQiwyD9hXNtVYBK0b/ANB3sPrCp3SODR08fFaLRAEm
   72NcK06yuQif6rIzzwu02Lca3pPCTuGMCImlNff9BIJV5SkGgv5k9A+PE
   A==;
X-CSE-ConnectionGUID: qsyCHT0SSVaykM3/b+43eA==
X-CSE-MsgGUID: VKLgsZOjT+mUEV/FDQvhfg==
X-IPAS-Result: =?us-ascii?q?A0A6BwBu3bNp/4r/Ja1aHgE8DAILFSWBK4E9MVMHfgKBI?=
 =?us-ascii?q?YhsA4UsoD+GV4F/DwEBAQ0CRA0EAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GXRZnEgFDPBcBDwQBDQ0agmGCH?=
 =?us-ascii?q?RZAAwECDqQCAYE9AooqeIE0gQHgKAYagTOFBIM1GwEqSWwBhBQbhF8nGxuBc?=
 =?us-ascii?q?oFXgjB2axoBgVsCgWKEE4IvBIIiehQdkwyBRCIDJjMsAVUTFwsHBYEzMwMgC?=
 =?us-ascii?q?i8tAhQvDxoyHXAMJxIsFzNYGwcFhRoPiHJ0FFmBEYMoAwttPRQjBg4bAwSBN?=
 =?us-ascii?q?QWNE1w9g0MrgRtiAaM6gXyhegoog3SMHpVwF4QEjROZVJkGIo1nlWAghQ0CB?=
 =?us-ascii?q?AIEBQIQAQEGgWg8gVlwFYMjURkPjl+DQskJgQMxAgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:r/I+0RTNXDMLDYEcb3m5rCrW8tpso47LVj580XJvo7tKdqLm+IztI
 wmEo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:IaZVNqokDmgCeCVXnNy1d9Xpy15eBmJDZBIvgKrLsJaIsI4StFCzt
 garIBmGbPzbZGegL91xOdy18k8P68KHmtUyGQE/rng8HikQ9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8Ug35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v9sEEpuy
 aQjEw4EfxOm3KW8g+7gR8A506zPLOGzVG8ekmtrwTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWPrSn8/w7pX7Wz5Cq1uNrLY6y2PS1wd2lrPqNbI5f/TUFJwNxhfC+
 zyuE2LRPDI+O8et7ji5sXeRq9GIsw/CRoIcG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9EBq13ryVtji1fyMSKAc/ieUsF2PpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:BnXrO6zDCtbhL2tqP90gKrPxQ+gkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5exoWJPtfZvdnaQFh7X5To3SIzUO2VHYYL2KgrGSuQEIdxeOktK1tp
 0QPJSWaueAcGSS5PySiGLXYrRQpeVvm5rY/Ns2uk0dNj2CHJsQlzuRZDzrdXGebTM2dKYRJd
 633OYCjTymfngcc8S8AVc4f8Wrnbf2vaOjSyQrQzo85iezrR7A0tPHOind8gYVUjtJz7tnym
 7Yjgz/6JyktvGw2jXc22XQ45k+oqqu9jJEPqOxo/lQDg+pphejZYxnVbHHlisyuvuT5FEjl8
 SJiws8PuxogkmhPl2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZSB3E8EAt1esMk5
 6jnljp9aa/Pymw2BgV1OK4EC2CUXDE50bKpNRjykC3l7FuMYO547ZvpH+9W61wYh4SoLpXYN
 WGSvuspcq/tTihHirkVq4F+q32Ypw+cy32MXQqq4ib1SNbk2t+yFZdzMsDnm0Y/JZ4UJVc4f
 /YW54Y342mY/VmJJ6VPt1xCfefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEw6PuxcJIFwZMukN
 CZOWko+FIaagbrE4mDzZdL+hfCTCG0Wins0NhX49x8tqfnTLTmPCWfQBQlktemof8YHsrHMs
 zDcq5+ErvmNy/jCIxJ1wrxV91bLmQfStQcvpIhV1eHsqvwW/vXXyzgAYHuzZbWYEIZsznEcw
 k+tRDIVbB90nw=
X-Talos-CUID: =?us-ascii?q?9a23=3A98P+YWhD3kZKCFEyvVdNQ8WqnjJua2bM51fse3S?=
 =?us-ascii?q?DN294S5jODlXTpPhpup87?=
X-Talos-MUID: 9a23:F7nBVwuNDnw+lgkS7M2nuhJGO9xaxKaSS0UwvKtBleW9Kyx+NGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Mar 2026 09:53:53 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 0E31E180000B5
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:53:53 +0000 (GMT)
X-CSE-ConnectionGUID: FnOgBcyhQz2somYShuYhXA==
X-CSE-MsgGUID: 72pgB3b6RvuQickRja1cAw==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,118,1770595200"; 
   d="scan'208,217";a="46805312"
Received: from mail-cy3pr08cu00105.outbound.protection.outlook.com (HELO CY3PR08CU001.outbound.protection.outlook.com) ([40.93.6.109])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Mar 2026 09:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yn8f3Z9jsdU4pfEOy9DbbgIclWaec6xUMNy02LtLxo6T8ig18zy/sjB5Gd08tUMJ8gw1djZSzKVyWDzmNgF4VRG41fJd9d6xxv/xRgQi5YsTXjbq1EEGnzORPzuo921qKwAu0i1TbKhV1bZ/KMIDqzp3uNZXPu/PJ1f4F4+PHTqfBb7ORoyXi5lH3eKiMt3Lhv3M5x247bAYmw4ZCu/r+ZYsQpcQlzCQ3B7cM89Xgky3sF2Rh2lLo2whH3E0lK81En0swcgGSaS+OX1VwvNGH4egdoDdtIP5K68U8oD7usnGwUoCmCIy/n0v9rDaoeWn62tkHShT+g4JMFC+pm4qYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FDeKQvIYkUm8z50Dqw6Zs3/r3lxthogOBzcIiPVPb4=;
 b=aMtlXPvl9U6F8UeHbxXaRKaSGdgjk+ukCPBbQbpx0vu17yBK6gx9aLGmb/SpdQTwBxBAgO1JtKIBV2BKNuyb/kKKfG//fVrX2K3sdJr5Que5R2B//Uh2hywBY1SKNSBgyMk0YN5QbBvZ+GSJlxcpLttBUwJcBOJoUFF/jqbyaZG2x4cdLGInokwXMuyYrb9yg3xXMbFHpizs+nsdejij7Ct8bReusR8zAvjv7aX2hE3k0hyInxP75Z4LbZRQMPnblmNsoFtAqVC/FyX684yjo/XnF/QhdrEZEy1k5cJ7DYsuISQX5xrciXRBXvRYHMkdTmBh7nbPCqJRG9qazIdgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Fri, 13 Mar
 2026 09:53:50 +0000
Received: from BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::9fa3:8f8d:951f:2cb8]) by BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::9fa3:8f8d:951f:2cb8%5]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 09:53:49 +0000
From: "Krupal Ka Patel -X (krkapate - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<krkapate@cisco.com>
To: "steve@sakoman.com" <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>, "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>
Subject: [OE-core][scarthgap] Backport request: python3-setuptools and
 python3-pip remove Windows launcher binaries
Thread-Topic: [OE-core][scarthgap] Backport request: python3-setuptools and
 python3-pip remove Windows launcher binaries
Thread-Index: AQHcssYgm4fYN2wPtUKiwcWZLJhLsg==
Date: Fri, 13 Mar 2026 09:53:49 +0000
Message-ID: 
 <BL1PR11MB5399F0A3D5E0ABEC59926791D345A@BL1PR11MB5399.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5399:EE_|DM4PR11MB8157:EE_
x-ms-office365-filtering-correlation-id: d5c2e3af-cf71-4b70-e9a3-08de80e66d5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700021|13003099007|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 lKCAooaLTPoiFB+ADpwPp1o7Pr9Dw1T8k4oMFvdC89gBPoWaORwgAS+8QV6EDlB0/WOpmTGcPuqi8Fw6Tp736LzzSJ7fcDH7jMb0fDlrwDbrvGKsW5QUr0hZoAE+rNgOAe/b7w9AlZKHNWHXFTGWUjDiBZ9pkkj0Qzvc2aCrh4roWQbvwVuwqfRxB78y3iawuXKa/aRVNYJj+CqFnsP4UzfsQOEP1PFEDlNcNfcTfyPPceYe5c2gdCiMGXgBbgtdpWAJSW7FyX2TycZGaW2V0jfheCTLJYhAwpp3I+QGwzNZUOXwVINfscUnxHVU5uvej0QHdyNylx2OeXXa5gCR2AocGRDSoC0akXso556sT21G3TLv7wAz+CvVpu/P7r5kD3Sw7IBZAuWmPrk6ZXKSo8taWqU0L5vBGRCh42fWSf1WioVqnrG/Pi/bynqoFDMYMOERQIGBRMFuJtXz7Qavj/zjLcGg6iNnS0PMnp60Njug6mQIAqq5JKUrtQXU0KKpb0kTmvNl2uhn4ZT322AsqYq/EEqAXuDTJnJxvxgYBN4nwumGKVg+iy5dDRR7CZyzZc/ytN1N7QAhkp570pys5lrM5bd/D960zrrriq4XepLk1/js9Byf7RP4T1PiyOPcrFkfv6Gnum17/WDG/mLewKXNihS1+7JtbikvyWJA7xOyHBE+ShWS3LG32BfdFekICqBkRa+9jl+5Knv/MKXm/VThatNkgF6Lc59eX1II/6/2Q85GLe39UlE+UhOoRShQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700021)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RPtHp3O3oK7dIlaJjQMq3SGJmHnhTLxxTG1vfDkKxR7r8PoiN8E9XU/ElV?=
 =?iso-8859-1?Q?OOgKwacp3hskrm5SFgSZDKuxKT6QL+UoWaLwEpGfOVx0xJT+qCOZCEZR+d?=
 =?iso-8859-1?Q?U3Ufta4GPJV8eM/hpGxkxaaR47AU10zaFieTk4EoIeYLsIHsuQPz+RNmRN?=
 =?iso-8859-1?Q?+eCOg18euVk6dHBkJaxil7LnxJpyABofYzeVHWHGGro/xEiQhb0m9zogxn?=
 =?iso-8859-1?Q?AmAieUmynZxe8m0fJxVB49hwkUSCqLM/NpEUxVZ5vS6nQINYn/rHy3IW5v?=
 =?iso-8859-1?Q?9WiPNfHUwmMNEUfohxSm680HTWrW40P1MFMLvfmzA+G/PGcnKcFw4ETxoK?=
 =?iso-8859-1?Q?AVYhBV6vNC0R2RJbi4302YnoJ+KgxHY5We5BdTo4bE0VV3oiKNRui4I7l7?=
 =?iso-8859-1?Q?8vx2jiGMV84MEk3bHs8RCj0UGnO+V8UWeVz/ZRkRM4XrNBDlXEJHSgSwBu?=
 =?iso-8859-1?Q?VQ5E9NiZORzpgDKMgD2YUvU4Yg5QejValaKfENTp8dSVjtWbBVXoIIZRAf?=
 =?iso-8859-1?Q?LjLXS1fYvuS0U45nqRTSxGiznzpifkb5Jw0B09+781YWHRwFKkFZYQxXYV?=
 =?iso-8859-1?Q?y1qlZrmkd1B2NmI5pTN0CRtJBOILDosdzlHmrd0tP/Z2rAVIWb14hg7ZUy?=
 =?iso-8859-1?Q?KA9eAeUyhheVao81cR1IdkWPVoqOT3U9eWOb9ifK302o3tCGUKz+RkR2Zu?=
 =?iso-8859-1?Q?Xw0P6bIYCH+g6hDXL5SfI7mBc+sqa4olfCVI66LWBz92qixkVWlSjf2mSX?=
 =?iso-8859-1?Q?x1nFLB3WV8GuZ7hQ3eLgSFXZ+1Z8edTZm+j2wdTk9dUAroUUV07EAT5GHK?=
 =?iso-8859-1?Q?CNNNfx+s148ExqQbrCvIQLSxYXGPl9NJPff0gzixfmreeLswUFNxxipSaO?=
 =?iso-8859-1?Q?3sPfkIxKTLNoJBcOLgNJBI/lE8dTdMUtgfGrMDoNNe463NTR6ZvBOTa+1C?=
 =?iso-8859-1?Q?h8FVnb7l86qoux/nWq/tvwaD2utZ48Z2XJjSyAR9uGFQglxxLnXqmy77hP?=
 =?iso-8859-1?Q?oZG8Des8DAf7K/embuYZuEZorXjYMMvsWvUMl268Zgqz12H7+LZc9N6m+i?=
 =?iso-8859-1?Q?ptZBGHArU9UZmNJcX2PC+NgayO0D5jgYYbW8+6PGZORdysjge6h1JRHbqt?=
 =?iso-8859-1?Q?kE7jh2u8e0+hKAcdvyguKVKTt4wM0zII57jLrfdpGZYl9Z0WFnWfDsZ/By?=
 =?iso-8859-1?Q?6tq8DgEYUetAsTkHKvXR0GPHc2Bkx0kqUBUhi+4DZu/xIOnoyW1FJ4XM7D?=
 =?iso-8859-1?Q?KIGwp7j5x7xS215ohT8KxCa9YfZnFDUbpeV9Hp2MKxsi4TKHkGg4HUnclD?=
 =?iso-8859-1?Q?4hOnd5GjdnbyMujQIqcnY+QJCBip15SyiI/oTV5S482nNmQwrg5C55oojw?=
 =?iso-8859-1?Q?lsbnioUU7Dr7dAhZGLojLtv5XnSqXICC/MuhRRZodJEMO5EySMdBoWkIdo?=
 =?iso-8859-1?Q?a9y7erWTbiunVjwR52sOIt7Zm2C5HKZei6qpdKkh8zAHsGgb8L5P/U5Oz3?=
 =?iso-8859-1?Q?CjTr186uDyVE4OL+8Xq1NX2hnTmxG+xBZZw551SRwHeqfGeS9PeQ0Ip2qK?=
 =?iso-8859-1?Q?GNS8YeEP8rHXs1EouDGgNkiLwWlj6s4e7kuD9zDYTg72mAAKUTyeYLGTjX?=
 =?iso-8859-1?Q?rBjVkHExJ6X1TKI6AzSuccjCFvYIo76F33rDyfDb15IC0+/VOer+ZTvype?=
 =?iso-8859-1?Q?qFiF0jWg7yU3lDeESUQo6n6VTE2YIeDKBunq9HSUKg3lItL2llDCaDM37p?=
 =?iso-8859-1?Q?eXmR/81XghryQfZJq8X+I1fa8LVWWq5BiT206cCMQ9lMWN?=
Content-Type: multipart/alternative;
	boundary="_000_BL1PR11MB5399F0A3D5E0ABEC59926791D345ABL1PR11MB5399namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ULymEh3lFqNf/1WqdFFNEOYkcomvBwwI7pre7ooJ6oEkTCfOFL+IJ5YRurppzFCblxs7Xh92N7a/1XkYhCIxisa8YvxK3FkERGRILEfbxGqKLXn/arAVHoqOF+kGZJ18rb+q3dBWmOxozWXgpovBT4DMM2cuM8SrnudQGjiJWgfSqFg5GuEfckWY/EcmTw2h9qVqB7oebMIn16adp2zte9uK4WneENxKsd9i7INVYsqAx4YaRYUmj2qy5Hlpc8+eot98gZJrGwn4x93xCQ8Gm6Ziq4bKhQJFjP289PfzGfb7ihhNuW9L5pbKSnrRyu1fQh1zevtUGZg7ozZHMwsCPQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c2e3af-cf71-4b70-e9a3-08de80e66d5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 09:53:49.8595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RP1WM9rd0j8wLPTC5xNZpSB2Jeuf3MKzNdMLcHn/+qlKc01hqHl0MImA2M8w61N2B9/CgE1UmswdXgsRe4yvRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233033

--_000_BL1PR11MB5399F0A3D5E0ABEC59926791D345ABL1PR11MB5399namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

The following commits were recently merged into master and would be useful =
to backport to the scarthgap LTS branch.


These changes remove Windows launcher executables that are installed by pyt=
hon3-setuptools and python3-pip. The binaries are only relevant for Windows=
 platforms but currently get installed and packaged for target, native, and=
 nativesdk builds even on non-Windows hosts.

Removing these files when not building for a mingw host (mingw32/mingw64) a=
voids shipping unused Windows binaries and reduces package noise.


Commits in master:

  1.  Cf7c79f3962f2be99cfda47e8cc730091e6a18cb: python3-setuptools: drop Wi=
ndows launcher executables on non-mingw builds

https://github.com/openembedded/openembedded-core/commit/cf7c79f3962f2be99c=
fda47e8cc730091e6a18cb
  2.  90d208fbb06b6e6b5aaddb0048fd6e2e1d46c8bd: python3-pip: drop unused Wi=
ndows distlib launcher templates

https://github.com/openembedded/openembedded-core/commit/90d208fbb06b6e6b5a=
addb0048fd6e2e1d46c8bd


These commits apply cleanly to the scarthgap branch.

Could these please be considered for backporting to scarthgap?


Thanks,
Krupal Ka Patel


--_000_BL1PR11MB5399F0A3D5E0ABEC59926791D345ABL1PR11MB5399namp_
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
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello Steve,</div>
<p style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The following commits were recently merged into master and would be useful =
to backport to the scarthgap LTS branch.</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</p>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
These changes remove Windows launcher executables that are installed by pyt=
hon3-setuptools and python3-pip. The binaries are only relevant for Windows=
 platforms but currently get installed and packaged for target, native, and=
 nativesdk builds even on non-Windows
 hosts.</div>
<p style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Removing these files when not building for a mingw host&nbsp;(mingw32/mingw=
64) avoids shipping unused Windows binaries and reduces package noise.</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</p>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Commits in master:</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;ord=
eredStyleType&quot;:1}" start=3D"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<p style=3D"margin-top: 0px; margin-bottom: 0px;" role=3D"presentation" cla=
ss=3D"elementToProof">
Cf7c79f3962f2be99cfda47e8cc730091e6a18cb: python3-setuptools: drop Windows =
launcher executables on non-mingw builds</p>
<div role=3D"presentation" class=3D"elementToProof"><a class=3D"OWAAutoLink=
" id=3D"OWA56a89b6c-f34e-4364-7a48-7f20c92fcaa4" href=3D"https://github.com=
/openembedded/openembedded-core/commit/cf7c79f3962f2be99cfda47e8cc730091e6a=
18cb">https://github.com/openembedded/openembedded-core/commit/cf7c79f3962f=
2be99cfda47e8cc730091e6a18cb</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<p style=3D"margin-top: 0px; margin-bottom: 0px;" role=3D"presentation" cla=
ss=3D"elementToProof">
90d208fbb06b6e6b5aaddb0048fd6e2e1d46c8bd: python3-pip: drop unused Windows =
distlib launcher templates</p>
<div style=3D"margin-top: 0px; margin-bottom: 0px;" role=3D"presentation" c=
lass=3D"elementToProof">
<a style=3D"margin-top: 0px; margin-bottom: 0px;" class=3D"OWAAutoLink" id=
=3D"OWAddf46276-2ce3-f592-3f0e-c826ada759c4" href=3D"https://github.com/ope=
nembedded/openembedded-core/commit/90d208fbb06b6e6b5aaddb0048fd6e2e1d46c8bd=
">https://github.com/openembedded/openembedded-core/commit/90d208fbb06b6e6b=
5aaddb0048fd6e2e1d46c8bd</a></div>
</li></ol>
<p style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</p>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
These commits apply cleanly to the scarthgap branch.</div>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Could these please be considered for backporting to scarthgap?</div>
<p style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</p>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Krupal Ka Patel</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_BL1PR11MB5399F0A3D5E0ABEC59926791D345ABL1PR11MB5399namp_--

