Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677D8C44500
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:24:57 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.174351.1783430689140011867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=A1v94fmt;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16814; q=dns/txt;
  s=iport01; t=1783430689; x=1784640289;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=embhWuvvo3SltlzZxhcuzNT1X1+sEOj/XckT2EnKjBo=;
  b=A1v94fmtBZELpwYaSUoSz/34nRyWKKZGAuuNJVbjlY4vsCTX8giF/JVQ
   mIxMM2MyUkcjCWMSCVpL1YrkLs/Bnk/ObK/TSNxrhSTTv/vgkbsWuGbAi
   lwyqNO0FSMjlDMThOP+JMlVYgJRR3Q02GzuJv+2TXaMOEliT0bAXRRl2D
   SZjj9cUy8e77JDQ++NDU4PbP1O4lpuNYmS47I/lI6JaWzPu9wCBrCEdx3
   fOPQdqQRisfaeBniaA80mkaOw7H6gaF1errKR98cPQkfdp7AzLeW3VyRT
   4ORQJp84BJMDzDWeawaIcN18PAgBNTB+gp397vkHMVBKXVin+6yFXtvef
   Q==;
X-CSE-ConnectionGUID: xJGd/IzERZajDcRPsVpLug==
X-CSE-MsgGUID: c+DKoIEZRcyxAx/Tz+d61Q==
X-IPAS-Result: =?us-ascii?q?A0B1AwDp/Exq/4oQJK1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJBIgfA4UsiHkDgROWMYZXgX4PAQEBDQIuARUNBAEBhQYCjU0CJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQECAQERFSQBL?=
 =?us-ascii?q?RACAQgRBAEBAS4nCh0IAgQBDQUIGoJhgh0WGScDAQIOBq1dAYE9AooqeIEBM?=
 =?us-ascii?q?4EBgygBQ0HcCBQBgTiFP4MbAQEqgTWCXYEhGAEbhGEnGxuBcoEVQoEogQk4P?=
 =?us-ascii?q?oI/BB4BAgEBgSQQGhE8g1eCMASCInoSG4FdUIEfJ4FhizhSciIDJjMsAVUTF?=
 =?us-ascii?q?wsHBYEjEDMDKi8tI0sFLR1wDCcSDx0XFh5YGwcFEiAqQUUjAxxYPzgLQwWBW?=
 =?us-ascii?q?QKCCE4jHwM5f4EwdUp5LYECAQIQHgpsQiSBUQMLbT03Bg4bAwSBNQWMFgdbF?=
 =?us-ascii?q?w+CNgYBgQQKCCICT0xpDzEEL5JGaXSOII5glRcKKIN1jCGNPogyF4QEgVelE?=
 =?us-ascii?q?ZkII4I2izGbDQIEAgQFAhABAQaBaDyBWXAVgm4BATIJCkAZD5c2yRR5AgEBO?=
 =?us-ascii?q?QIHAgcOAwuRaAImgVUBAQ?=
IronPort-PHdr: A9a23:iH1AyRYa/EMMb9WkJcpXecj/LTAchN3EVzX9orIuj7ZIN6O78IunZ
 grU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:aSQSHqJtnFDHDrjTFE+RiZQlxSXFcZb7ZxGr2PjKsXjdYENS3jAEy
 GVNWWrUaPqPMDD1ft1/aYu+8k4GvcLTz4BjSFMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGYrajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1+Lm46eqwK19xFCGNi/
 sYgMw4VSg2M0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62AI
 ZNHL2M0PHwsYDUXUrsTIJslhO6yg3DlWzZZs1mS46Ew5gA/ySQugOCya4qPIIfiqcN9lQW0h
 WXn0lbDCQAKHczY9SjG/iz1v7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:ervSWqyNIIxZOaZvw/ZgKrPxLOgkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYY72KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eAQ2SS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfZvln6LQ1hSRMK9AXUOQujEoPP2tL+OW3Q7Li9iwjOjyRez5pDHMzXw5HojegIK7aYp8G
 DDnQC83aO+rvG9xCbb0m/Y/75WlNHixtYrPr3MtiESEFrRozftQL4kd6yJvTgzru3qwk0tis
 PwrxApONk2w2/Nf0muyCGdmDXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cghtdhy6
 hGtljp9aa/TCmw2RgV1eK4EC2CpXDE50bKVtRj1kC3ZLFuLIO5a7ZvpH+9Xq1wRx4So7pXYN
 WGRPusl8q+N2nqL0zxjy1I3MGmWGg1E1OtR0gPvdHQ7h1t9UoJlXfxAKck7ys9HFVXcegY2w
 zJX54Y5o1mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94aIfzY9FrN1CQqZ4h6caid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbfRGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7Z7HCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8VHssrPWCzrCFL5LYd/nFrIouf0w36V3w3wotWg=
X-Talos-CUID: 9a23:2KNPOmHX0JwDZNtEqmJ31mEYXeE3X0fvxXX8KHWAElhxbKCaHAo=
X-Talos-MUID: 9a23:hNr2cAqALoW9QRqSr4wezzohGORvwomcMkscgbwW/PWWdiAuYg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 13:24:48 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id F3DC618000186
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jul 2026 13:24:47 +0000 (GMT)
X-CSE-ConnectionGUID: PpJwlv4nQ1WutZOIi98V+Q==
X-CSE-MsgGUID: mMqB0C1ZSZq4Z1wgdEswwg==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208,217";a="55128045"
Received: from mail-westcentralusazon11013033.outbound.protection.outlook.com (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.201.33])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 13:24:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5xy/wirqGmc/hpj6JhcEYMDguaWjXtw9PEseWOswCJ+9k4EMvgUM3WUV97DQgkE/JR4ghTqGlKJy/WnYi/LJxgx2VrPvNeXkYd17OVeLS+ekq8HKVdo4J6sCTWRWh1/Wfnc+sSc7JO9hKxsptAPLGKtQ8WSCqtJ/Qj+xk2BNhVzHCTlpp+wGi4L6ocmuBVd70Ck6/zBJWMe1m4BbVKINoalF/o9XUXy59L0vT1YBolXOnx4OfOXFywu/j9GvlfAWkLmxGFh9upzceZzY+Bv9Q7rSN4niD8cMrhAdIz/MwSckQuGETjzkeIqGwSnHUy9nxyiw9x7OMtp+qqy70juQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=embhWuvvo3SltlzZxhcuzNT1X1+sEOj/XckT2EnKjBo=;
 b=YAPrSJ4uAn2kiMxUREz1lWlcDeqzl/ytnCBYdnmbwo8QvlKgscragZT50BrHnUVX0iqoPYwgo0Pfbl2alvTLUIhwfL9tWFExYr8u4Tje9bXaELobwQYqB6qWoOrQgdqNr5DJcNE9v8n0TWcq9sV54lFykY54PTTa8gcqa1jWsg6RxNAKTwyI0gtWuhln4RTBGF727Dw2IhaJK1zOx+Y3sXKQo3vh7W4OqmAvmeOT3ASxbdrYVoxstLlPfomQduKyV0pdTi7ralRngK6IB+M2qwjTqRE3GCs65pgP3ptj6/2oyzoMHYFoTseRR2Grgc/VQW1X6muK0vz3PuvZQ8Zr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 13:24:44 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 13:24:44 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.49
Thread-Topic: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.49
Thread-Index: AQHdCFZOmWslZyu8ak+iKIqEurFLQ7Zh44AAgAAxSvI=
Date: Tue, 7 Jul 2026 13:24:44 +0000
Message-ID: 
 <PH0PR11MB5902116D97221B6725047B50CFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260630060410.1203985-1-asparmar@cisco.com>
 <DJS9H2DLIVVC.2DDDZVKTEK2TS@smile.fr>
In-Reply-To: <DJS9H2DLIVVC.2DDDZVKTEK2TS@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|IA4PR11MB9249:EE_
x-ms-office365-filtering-correlation-id: bea0baab-fd1f-4736-488c-08dedc2b1c0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|13003099007|38070700021|4143699003|16056099006|22082099003|18002099003|11063799006|56012099006|8096899003|12006099003;
x-microsoft-antispam-message-info: 
 dQeWRBD3Ja/5bdRgiDpG0E+7tQKAwPJasinEVHK9pnlgUfDzYDmCVJ3Oc73nTtREcdeRQWto3a0o/owe2j8cSfZ4LrRtQXt1+ozEFcCwWFqJieDTGXfmLGzwilhA/naZwU6lgIgyQ/ynzSo6BUo8wpFhaX+UWioSVPnj0wnSsg9h2i0QVc4E7tVoLOynRK+DSFfYn8jE/uDwMedjGQTcwpQQrHLtHZ/UOLlA0UnQoVVOWlobWiO10oMIl6lsm1v3Hfa2DZo1Z9pdttNBYApgrAXbsESoCXqRAIUzYvVtgImXzrzLaxlNzR0aTOVAlMi4j08patbdM8L0ultPcHXo5+2RTxnjI5zTmOuDq+eCLOLB74krwjAVFN96KApSaDv7/LxJWwlYf6oANAwOlgtijDx99hPFOGhuEDt8d6mV6jJLoY1TrCPasBBBPesg9xujosVrSIQweBbF8SfOWyAG5sUskLPqHPsFUOpf/irVAruMQZTxbrCSonXfJ9IsWTM8z48KyhmB4HeHDpmpIf7d6d5p3see0ScATaPY75K7LtMgNAKlPjaWCyN22nYN2NkhuAEL2CKNGK17sCwirEpCnxBKmqi1x0Yo404ojO5roGAex7uYKGFVOlT33a3XmNnYHT86NY/5uvoGNtxKleIRXFSjEl09rnl6JmMqBPzTOD8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(13003099007)(38070700021)(4143699003)(16056099006)(22082099003)(18002099003)(11063799006)(56012099006)(8096899003)(12006099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qBRxCFnjzm2CIRsLO0YbxKaMr0GHns9posAGQwT9+672e43cxl28bdwkNd+j?=
 =?us-ascii?Q?Zpbn3OeTAd7nNwdioquYz6N3/0uXTgMe/Mz1XVaM7Er3YxFHPYR19lbxAXCG?=
 =?us-ascii?Q?yUGvJu/lt00HpTZz+6h8tejp+qkl4hwRIFNUu8gB9BhArp1Hm0UA4FufSrkX?=
 =?us-ascii?Q?ncz2b9KU5xCeS7jz82YSB6y8+kWH7R7Pa1YZz0rQSuMZ66A1aeVPElF4C4eb?=
 =?us-ascii?Q?4UKWTV5Jxt8HIp4YgTGw9l3ggffQvGYHUZhwWA7BDi0srzJG/rEgDyhTuqAC?=
 =?us-ascii?Q?HbK6KPzxmX6UxcV65pCqCKcv04lNA5tEZFGy/XEYGY0uhQ1pB/9lmuwA7BD+?=
 =?us-ascii?Q?a1BYelLVNvVL97KhowyyVleyXZ0I83d1ELpYiXFQXJoMVbD0iMXSgDYl2s6e?=
 =?us-ascii?Q?iiOedPh0MNVubOyTLjgO8OpRxxFI8LLXzBLsdqF4+eU/sQF9F7MKVvKECj1b?=
 =?us-ascii?Q?9iP7wZ618ZY56Y88vj6WXJvbcjHuSuUzmIRAU3D+PUNdzoPupd9htwoF9nPQ?=
 =?us-ascii?Q?b5FsBAjKJB2xdFaD8RzgUE3ZCriKL2hPPL6BLvbmNqJUmWlt2OnQcyuKeQSL?=
 =?us-ascii?Q?PUr5QEmcVoPA/Cg9v17pR5BQX2DQE61C9fwKmc+Uouiwd3SR0C7egSPG1AwC?=
 =?us-ascii?Q?eQPGo325WYIS88NwSnLJJzcKlWUz9gmTXQF4SN/qV9muyrzRPDCnkIx+Q80s?=
 =?us-ascii?Q?zw24xqE3FWcGQPp+ZkDG2yF51YPEn/tnkz5W95sf0GKwl8/TfZk6epUVXXkb?=
 =?us-ascii?Q?I1mLpyTG2TOLn7jFcfMWZQVUf7LMZivVF3G+zbl+rqK74MEtLatpKicQuGF8?=
 =?us-ascii?Q?I8tgSM/seN5/qkCr6pBJJwgU57+dUthujtKR+XhnBeYwrvxHFEw5DIVSIqQN?=
 =?us-ascii?Q?JkHjP4iiiODnjCEl7uVvqh0SWD4qyzt3T3ez/3+qCmkryZbfZfsru1qrd4su?=
 =?us-ascii?Q?0dbz0imB7NQLZN6SjYouNodhtyPkCtBZTJ+rhSx/RtHbiKOOVGTDot/SQYzr?=
 =?us-ascii?Q?3+wxJvpVoz9FEgMfDlo/SVyx8cZgTK1CsAmkJebZeDCssNWfS4QqE0KfLsRu?=
 =?us-ascii?Q?hQ+pJWKrb3htIeT55EPVIPk/hQw/oB/NcGuClh2lC2VzMMpGAeo2djfrbeYA?=
 =?us-ascii?Q?o9cy5f9tY7aP9427r9999OjNH6b1nJJUE9Xe7AWGMQfraxVtNbTkuzPx0SMb?=
 =?us-ascii?Q?bgGfsM+meTldykNL8bgvbZYJpXxd1LOI0qwVzQZcb0Eow0W/XuvCJc2PWVpy?=
 =?us-ascii?Q?lyTgyTAiSz2AHFClUO7kBPWA1TgD4MNUE3rG9vo0A5xWuDIMGmGX+CmtIBwd?=
 =?us-ascii?Q?rE143CSsWikG0MpQ8be+LRRfa59aLEPFKShaSdVKER3feoGqwOevw8lh3dcU?=
 =?us-ascii?Q?y/zw9QPZo19Kr/iKIo6gulbD4NmIC/GSuszPRJDcjdDXQoJ+fnXwD+eN57Ug?=
 =?us-ascii?Q?2Uatf2QDRzgj3bU2wR5Q7YeaEAPeXn6O+x73VfsZKfmmy1HtPn7xnWoV+I/s?=
 =?us-ascii?Q?oKZmntTo/9Dntlheh0Eiw3lsfgcvTRCDFL/UKLbyEb4eKja+4te0ZYhVST1P?=
 =?us-ascii?Q?peU+OJ1srPuD+pLEmi7jAruUQ7TZwjffV9a0Z80Sj4Uk3N3PibJs98w9disV?=
 =?us-ascii?Q?0mRyK1HnUGe11++QN1QQo70n4GABguULaDC3pPalsI/QDkDSdGnpQNHLwVV5?=
 =?us-ascii?Q?JxvKU6gu6t4HtKXcFTz+EmXdUWU/J7o8u0Y1/+3cH1UsHMb3?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5902116D97221B6725047B50CFF02PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	gX3WjuqbYLIeyOVIySI5JXMm4yFsePTot6g3YlB/XPmRH0czAOldsn02n1NOLncjpfpTNBXoFIhPV+V0d6TSbHiwXsBtopRp8JGr0FhbfPq1h/Jq8CjIpshvOLbwVpfbP6Dwi/WOzagi6RpUgtqlJk18OJz7t3uTy4zKL5OFuR58rel16cDWYeHLnKE/oTPwx44/FOEj400OdQuV014rMdR1yfxFsvll2wyWt6N5/j5uLgBYg87CMbHDfEl/VcJi+61E6Ec8RzbBsJ8z1uJ3DFAPUEFinpADGa7FUj7pnWTLoc7Td6gYP6RksDPm6zL/c47sQw5ZmCf+2sJlbOAYhQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea0baab-fd1f-4736-488c-08dedc2b1c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 13:24:44.5139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJ0l5K6Chik5ix8q5j/K3wtlCZvBqVN0qw2wII1FCuSuArs5zX1q+wvsLpgb5QzXTE/4I0PkuFle3fwGz+V9XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 13:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240386

--_000_PH0PR11MB5902116D97221B6725047B50CFF02PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, Yoann.

Yes, feature changes are usually not something we should take in stable.

For this BIND work, I first submitted the individual CVE backport patches f=
or scarthgap:

- CVE-2026-1519:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.2=
993940-1-asparmar@cisco.com/
- CVE-2026-5950:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.2=
993940-2-asparmar@cisco.com/
- CVE-2026-3592:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.2=
993940-3-asparmar@cisco.com/
- CVE-2026-3039:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.2=
993940-4-asparmar@cisco.com/
- CVE-2026-5946:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.2=
993940-5-asparmar@cisco.com/

During review, the feedback was that BIND is one of the rare projects where=
 the upstream stable branch matches OE stable policy, and that upgrading al=
ong the 9.18 branch would be preferable to carrying a large CVE backport pa=
tch stack. That is why I superseded the backport series and sent the 9.18.4=
4 -> 9.18.49
upgrade instead:

https://patchwork.yoctoproject.org/project/oe-core/patch/20260630060410.120=
3985-1-asparmar@cisco.com/

For the specific 9.18.45 changelog item you pointed out, the change is limi=
ted to ISC's upstream system test suite. It raises the Python requirement f=
or running `bin/tests/system` and tracks those test-suite Python dependenci=
es in `bin/tests/system/requirements.txt`.

OE-Core's `bind` recipe does not enable or package that upstream system tes=
t suite and does not inherit `ptest`, so this change is not part of the tar=
get build, installed packages, runtime dependencies, or runtime behavior.

So the reason for the upgrade is that it follows the earlier review directi=
on to use the BIND 9.18 stable branch, while this particular feature change=
 is test-suite-only and not target-visible in OE-Core.

Regards,
Ashish
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 07 July 2026 15:49
To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembedd=
ed-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.4=
9

On Tue Jun 30, 2026 at 8:04 AM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-2026-=
5946 and CVE-2026-5950.
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html

That changelog contains:
| Notes for BIND 9.18.45
|   Feature Changes
|    Update requirements for system test suite.
|      Python 3.10 or newer is now required for running the system test
|      suite. The required Python packages and their version requirements
|      are now tracked in the file bin/tests/system/requirements.txt. [GL
|      #5690] [GL #5614]

Feature changes are not usually acceptable for stable. Can you justify
why this is the case here?

Thanks!

>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
>  .../bind/{bind_9.18.44.bb =3D> bind_9.18.49.bb}                   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind_9.18.44.bb =3D> bind_9.18.49=
.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipe=
s-connectivity/bind/bind_9.18.49.bb
> similarity index 97%
> rename from meta/recipes-connectivity/bind/bind_9.18.44.bb
> rename to meta/recipes-connectivity/bind/bind_9.18.49.bb
> index d424edcb4e..723a09e739 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}=
-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274ab=
f73f5b5389a6f82d"
> +SRC_URI[sha256sum] =3D "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa=
352b1093e525cd24"
>
>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>  # follow the ESV versions divisible by 2


--
Yoann Congal
Smile ECS


--_000_PH0PR11MB5902116D97221B6725047B50CFF02PH0PR11MB5902namp_
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
<div class=3D"elementToProof" style=3D"line-height: 22px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Thanks, Yoann.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Yes, feature changes are usually not something we should take in stable.</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
For this BIND work, I first submitted the individual CVE backport patches f=
or scarthgap:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- CVE-2026-1519:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100=
404.2993940-1-asparmar@cisco.com/</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- CVE-2026-5950:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100=
404.2993940-2-asparmar@cisco.com/</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- CVE-2026-3592:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100=
404.2993940-3-asparmar@cisco.com/</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- CVE-2026-3039:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100=
404.2993940-4-asparmar@cisco.com/</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- CVE-2026-5946:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100=
404.2993940-5-asparmar@cisco.com/</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
During review, the feedback was that BIND is one of the rare projects where=
 the upstream stable branch matches OE stable policy, and that upgrading al=
ong the 9.18 branch would be preferable to carrying a large CVE backport pa=
tch stack. That is why I superseded
 the backport series and sent the 9.18.44 -&gt; 9.18.49</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
upgrade instead:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260630060410.120=
3985-1-asparmar@cisco.com/</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
For the specific 9.18.45 changelog item you pointed out, the change is limi=
ted to ISC's upstream system test suite. It raises the Python requirement f=
or running `bin/tests/system` and tracks those test-suite Python dependenci=
es in `bin/tests/system/requirements.txt`.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
OE-Core's `bind` recipe does not enable or package that upstream system tes=
t suite and does not inherit `ptest`, so this change is not part of the tar=
get build, installed packages, runtime dependencies, or runtime behavior.</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
So the reason for the upgrade is that it follows the earlier review directi=
on to use the BIND 9.18 stable branch, while this particular feature change=
 is test-suite-only and not target-visible in OE-Core.</div>
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
Ashish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 07 July 2026 15:49<br>
<b>To:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;; openembedded-core@lists.openembedded.or=
g &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -&=
gt; 9.18.49</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Jun 30, 2026 at 8:04 AM CEST, Ashishkumar P=
armar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openemb=
edded.org wrote:<br>
&gt; From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;<br>
&gt; This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-20=
26-5946 and CVE-2026-5950.<br>
&gt;<br>
&gt; Changelog<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <a href=3D"https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/no=
tes.html">https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.ht=
ml</a><br>
<br>
That changelog contains:<br>
| Notes for BIND 9.18.45<br>
|&nbsp;&nbsp; Feature Changes<br>
|&nbsp;&nbsp;&nbsp; Update requirements for system test suite.<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Python 3.10 or newer is now required for ru=
nning the system test<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suite. The required Python packages and the=
ir version requirements<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; are now tracked in the file bin/tests/syste=
m/requirements.txt. [GL<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #5690] [GL #5614]<br>
<br>
Feature changes are not usually acceptable for stable. Can you justify<br>
why this is the case here?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt; Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../bind/{bind_9.18.44.bb =3D&gt; bind_9.18.49.bb}&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&nbsp; rename meta/recipes-connectivity/bind/{bind_9.18.44.bb =3D&gt; b=
ind_9.18.49.bb} (97%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/rec=
ipes-connectivity/bind/bind_9.18.49.bb<br>
&gt; similarity index 97%<br>
&gt; rename from meta/recipes-connectivity/bind/bind_9.18.44.bb<br>
&gt; rename to meta/recipes-connectivity/bind/bind_9.18.49.bb<br>
&gt; index d424edcb4e..723a09e739 100644<br>
&gt; --- a/meta/recipes-connectivity/bind/bind_9.18.44.bb<br>
&gt; +++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb<br>
&gt; @@ -20,7 +20,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://ftp.isc.o=
rg/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-avoid-start-failure-with-bind-user.patch">file://0=
001-avoid-start-failure-with-bind-user.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; <br>
&gt; -SRC_URI[sha256sum] =3D &quot;81f5035a25c576af1a93f0061cf70bde6d00a0c7=
bd1274abf73f5b5389a6f82d&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c43ce4548ebed788cd9df63658a7de105ceafba4=
3fcd63fa352b1093e525cd24&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/=
bind9/">https://ftp.isc.org/isc/bind9/</a>&quot;<br>
&gt;&nbsp; # follow the ESV versions divisible by 2<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5902116D97221B6725047B50CFF02PH0PR11MB5902namp_--

