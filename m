Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AAFC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:48:08 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26046.1788169687990355451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EWfNioi1;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7104; q=dns/txt;
  s=iport01; t=1788169687; x=1789379287;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=cQhzi0vmE85do3MQFkZIYCyG/yyuW3i0VgiWgNxPvE0=;
  b=EWfNioi1JoxaIvw9aUV7HtD+1iT1bfNJXtHavXbXkmsm/ROWB2jK7Awd
   yn/52CNqgWmtBeb00MdUG+qrsozGqv3Ht/ZROmpgdZnhHGlpV3flANpDB
   1SE6UEfKNbFuHts7svVifZ9AYc4GRSqh24G0KiUfv1UHiL/4iBk52wGdu
   ON+XIOLMqp5vbdwO90E01PVdmg5VK1FNcN4GbpyjKnaQPYonvhLKttnle
   /G3E4BhsWT7PSirB0TDFuhf6skoolABur+YFTpapXMLgINVut+W5MmB7I
   6Wf1W6PyU8OZT03DivPBrcIMFNpTGojiUdPPQBbpLfcA61/3pyINCB+PR
   g==;
X-CSE-ConnectionGUID: ISjOX5BHTaWo0ci6H4Pmnw==
X-CSE-MsgGUID: VeTo8f2EQUGb0RA5cDuljQ==
X-IPAS-Result: =?us-ascii?q?A0B9AwDyTJVq/5QQJK1agS6BK4E9ATBTgQgCgSFJiCMDh?=
 =?us-ascii?q?SuGWIIhA54bgXQKDwEBAQ0BAS4BBR0EAQGEP0YCjXMCJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwEmJAE9AgEIEQQBA?=
 =?us-ascii?q?QEuJwodCAIEARIIgnuCHRZBAwECDrZzAooceIEBM4EBgygBPwJD3AwVgTiFP?=
 =?us-ascii?q?4MDGwEBBSVJbIJdgSMYAYR8JxsbgXKBV4JpPoEFgVwBAQIBF4EdGhGEE4IwB?=
 =?us-ascii?q?IIiehIbgjElgVSPNFJyIgMmMywBVRMXCwcFgSMQMwMgCi8tAhQNIg8aBS0dc?=
 =?us-ascii?q?AwnEg8dFxceWBsGBRIgKkFEIwMTK4EZQQKBdD8jGTZ6gQlegSspYQIQF0YuF?=
 =?us-ascii?q?YIIAoJagSdeAgFJQw4HR1MJBAttPTcGDxkDBIE1BY4OB1sfgkQHgQ8lBk8Bg?=
 =?us-ascii?q?UMxkzUtjxSOYJNkgTMKKIN2inyBJo0+iDIXhVulEQuYfSONZ5VghS4CBAIEB?=
 =?us-ascii?q?QIQAQEGgWg8gUcLB3AVgyIJCkAZD1aRTYF/gxTHBnkCAQEBBjIBAQcCBw4DC?=
 =?us-ascii?q?4FokAACJoFWAQE?=
IronPort-PHdr: A9a23:8W8CmhJvBs0K3Rt6idmcuVQyDhhOgF28FgcR7pxijKpBbeH6uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:5Wxt2qvFP3AdnsRNkajx1QF0vufnVA5fMUV32f8akzHdYApBsoF/q
 tZmKT/UPqrcMDP2f9Akao6y9UhVsJ7Vx4Q1QVRlpCk3EigagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LY8Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2911JlET3
 9wkIQ8KNhuC2cLq+Le9Vbw57igjBJGD0II3s3Vky3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgd/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9KoDTG5wEwxvFz
 o7A11r0PhZKOoay8Aeq+CqWr7LEsT7/WrtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:WfzmEaoSekIRN1OWQ8L6G0YaV5siLNV00zEX/kB9WHVpm5Oj5q
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
X-Talos-CUID: 9a23:1G0Qt2AYFD1q/9T6Ewhc9mkkR+oFTnTiyy/bIhGYVV5sTqLAHA==
X-Talos-MUID: 9a23:3kI3DAsWpr0pvialu82nujxeM5dmuYmXNW8Hya8v5sKoKChyAmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 09:48:07 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id EC72A180009A5
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:48:06 +0000 (GMT)
X-CSE-ConnectionGUID: QJvAEO1cRm2iti3uot2ypg==
X-CSE-MsgGUID: 9dUb7uA5RZSUK7o0Pe1YeA==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208,217";a="84891571"
Received: from mail-southcentralusazon11013009.outbound.protection.outlook.com (HELO SA9PR02CU001.outbound.protection.outlook.com) ([40.93.196.9])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 09:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yymEk9qZmvdGVS/dQn5n43hXbhzNeKeZdy54/PNHvGjmAIhiwp23XuFpkWaAvPYbdDhFRAkzJwDrIZN/IesTm/bOnyCf3HGFe2bwk6Z4gp6WhZaVxrSPRErnd2Y97jUu29u6WJyji4dgGlwJiUztQDIZCAkAlWRkP7+kfnzjrPfLuIhZLTAVX+wCaYntxaRtvtjBs6IKuyi/HNwRRnRE8w6DmHvp83HuGI/6MOxdoYw+8tu3W44OswzDoviWm2ssK8jO1huf9Jqcy5lEUGn42E6KNsPXR6hAohYZ6BxvsfWy30wQ+sHpKWAjRGgN3ndxeI0c7pE+wpsBUR5J6xws2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQhzi0vmE85do3MQFkZIYCyG/yyuW3i0VgiWgNxPvE0=;
 b=kzYXIaHyYdsHXXV7TuEEV7MsNFa0py7fxLTkcIV/LtNtokJeHs85ZUxBI0SgI2cSKjYJyS47+PEObCyKYdUg2L5LnMARKPTSJd4z5tfYVFUlPP220HaTn1t2OIh3gBkvQnOoFax/q1Pys299PRYXQtomDU/ud1ACHhOh+zcW0BOpzlExPzeh/NJ1oBvBU9J5c6RJoOFHkewQco1lcNOMPXQlmMG4lWDozNt+63rjqlWykJoXZwPjugmKLwb/410+rXZavjqfdX4sOtPwLkCzgx3Bn7j+UIH3euMEEVkv+P43rrRSb0RZEH6m+Vs+wAarbN6W2BxwWEHuYgIRaFQGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:48:05 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:48:04 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-15308
Thread-Topic: [OE-core][wrynose][PATCH] python3: fix CVE-2026-15308
Thread-Index: AQHdNisI3rVnnveW5EWuC6+Ni+GTv7a37x+4
Date: Mon, 31 Aug 2026 09:48:04 +0000
Message-ID: 
 <DM4SPRMB00745407AC3F810252E4AAEAC4A92@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <20260723134023.2501442-1-deeratho@cisco.com>
 <DKZRWIN340Q2.2ZUHT9JGBHM16@smile.fr>
In-Reply-To: <DKZRWIN340Q2.2ZUHT9JGBHM16@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|DS4PPF1DFB73954:EE_
x-ms-office365-filtering-correlation-id: 0ebd3b8c-4886-4759-47d7-08df0744f465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|13003099007|8096899003|38070700021|6133799003|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 BAdp6mldWDu1WJbhwtxTqN74a8Hs+5Xq0ihFNw9TFs/P9m4vh0bizUeytajIQaAXHdG8VixaXv6WoPWxgTg6bGbwMLIIZwlVAfB7VkosohCFP54MI3rYjUxWbGcNRIB+wy95Tg0qwBKSNzkuGaT66WxF/k7L7L5A1jrr1dueny7DggFXnf+Lgqb0VrmabE9MJfSq5CmS4CGcVIJvry+kyBLO64cZvLKcRdgKdQ4eLGLfqW0AWnbaJlcFhDUO3e88sYiv52wqFGrkpv2rGr/F58RBrhSNTocR77elJwgvUVZ32ep9LkpqD0bfMr8s6PPbiQzniWVsJWQIwna+crP4tzI+Y1/V1en+dgk3hUD6M4dKjLbooaty00Rm5M9IFDGQ20mOlJhxc8aqCP/AN5qKMGdf6oKqxJIWmWqDx1khlMg/d/Q3Uxe4POlYjLv+K8+1z1PWzF5PzdqZMAMoibENDW6lAb7m8WetpMYHmOZdbb2RQ9RFECiqWa0xPxhDzHqYtBqGBmdPSwgmSmeomzj+QQx6BxRaRmhaMexdWwPAJEXKzc6A3rqcqe31j+0DqWuBKQr8zJGEAV9eO1m/l3KLwKoKK5K39A/r/wKEyo2uocU++fc1nrEbyHWCRd15B8vPq81/vOkERgdq9e/ZPG9n9lvfbfduXqoBOrIx7m6rcb5xQ7owVNtbsrFIzcWIaGG9/J0j/aGPgc45r0PRSkdkRuQQOM937Dh1w1sQ5IcIPoU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(13003099007)(8096899003)(38070700021)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8fNEAmUHkOnqJV96Y6OGAyrH1o8xNCd+DK2l6MfDRd3e1Zv7nNyETdgDqPFb?=
 =?us-ascii?Q?wJe5OZoN+fhXArMbGpYD02P4FwfOetQeWS/E99hL/2mJiYLUE1t4dP09jdNL?=
 =?us-ascii?Q?Ccs7ZAbffrZhGXlKK6Kk4oUv7nsMaCsD+Tk4Q4Smz+OoTvDue/X7c2ODb3sC?=
 =?us-ascii?Q?iFyybUbfk+4GQ6/f5W54wJilDa0+wKB7sLuCgwzFco9Y97vAxpA0KNiUpjbu?=
 =?us-ascii?Q?/Z49CuTML+FXquJwHNc6yaglvZfGi44JIx5BfttlkMIBU/BGkh0o/+uQUQm3?=
 =?us-ascii?Q?cbC6rAqxSW6JG/Z+gouoYg7SbGRtIpbvgM5czqOtEKtHO1TQ2F+504P95etk?=
 =?us-ascii?Q?VbZQb1W+dFWpALe8nv6gKWWfITbmgZYqNUv/1NgZvy4XKjCu1Sdha8tHZfPy?=
 =?us-ascii?Q?/KF4ZECy+JAQVkSF0AcwpwIX9u+imEmT6Oi7pf4+rcCvKT5mXhqdbmaQ9ZHv?=
 =?us-ascii?Q?jx1zFD6QS80h8thzDddcKfEQw4MBKYjPBhs2Vt0qSJhlfC6C7K6R7K977yFi?=
 =?us-ascii?Q?5aByMxCIM8zwG7yAljfyvy6Oxj0fArMfcBEe95vGC1Y0N9wH6UpWurvjgrG3?=
 =?us-ascii?Q?Ajgg5zlLGiCShUYaaKY5d5FDSvb9P52yess/JyxyEeujbFSR/nN06btqNH6n?=
 =?us-ascii?Q?8nQu6tSmqhhFeyPJPpxhUxuZSiWLejv4bP6GMVe3zVz76h014hTvm97D9PIB?=
 =?us-ascii?Q?P129XwHuiCVMhsrZhUVufGb7uXoHxZVIcuOq9AD0DGDcnf4XX1Xs+8+eqZJo?=
 =?us-ascii?Q?ObIE13Pk7pQICxGGf46OHh6sNXQtIiG+KcbuKJotsEkuwe6oUS+dyZAFLRMV?=
 =?us-ascii?Q?45MqhtcOqNaXqTDAda0+ucrStEV+6lRmz3W4PolE0BQuheXMxpMtopsWrkUB?=
 =?us-ascii?Q?AsVtYadeV1bkl2fkOJHUjxiqSoGRu8SEHLSrAHisfALb1/VwKL8iMyqOlIN0?=
 =?us-ascii?Q?7cIMo0bA/ZZt2CA6P5DGarJ+mvhAW8sCKyUMP7fPH/+SzvK6/8I7DDmVloMi?=
 =?us-ascii?Q?PQh5u1vCeVSKiHnAt2QVjtWB3FIoc3JeqdzKA3YqhuuVYLeqenSgAhT8Djbq?=
 =?us-ascii?Q?dQ5+9whMBxEx0vBZobu96ZXYyxCsmQTd6BSD2zJ3yL13pAIewmOse4epfXp6?=
 =?us-ascii?Q?y8ErISjAAI3GmOBywteTBgd70EGkqiip4JCWWlKWIQjLxueDnxxntSMTSUD7?=
 =?us-ascii?Q?nJgBoJLlAiHtaUsowt7Pp216Jlm+SvzAMM3stD0Zif9A5xlyyEWGTU4q6a/L?=
 =?us-ascii?Q?lPpBVUGnHsGUwEExSpaFprtvm5/jjmKWwJSXiNziUJ1/5/0f+eYVr/aAd+xM?=
 =?us-ascii?Q?tFGySFwmu4TqxeXbpMOFU4sHWzNvCirWOUI835xQ2wzZLh++qFGDpxTSn4aW?=
 =?us-ascii?Q?T45BNiXdbIa7Lg8a60EANMz8natNEVJcTutOLzYThWCBtZNobx5sf6FR1lAJ?=
 =?us-ascii?Q?8PWls9uHN2PE+4HbZTzOLzsMYMgLHSm7m4ARuQtYBT5wBfVUFzqDXH8nQXGH?=
 =?us-ascii?Q?Uo3BLv2n6bG9sx7Ifdj10u8+A+Y+8PpV2jix8QK/mLNxVfX9CjeEuQB1xFng?=
 =?us-ascii?Q?nTfWfUefSJylKXvRmBkz86EpSBle1t8lYwcN5cDFEiDs9DRb7vLR3cVpeQYd?=
 =?us-ascii?Q?ZaD26uTWPkbOgAMbeodYdGoL5r7rA6MbIAk0y6Inl3boX1+Hg2lYTtrIXs8r?=
 =?us-ascii?Q?ZXfGrU2I6M+G4V2kro2OHC7Z3Xxx4NYPZWlqPInJpn2UhDaR?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB00745407AC3F810252E4AAEAC4A92DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	huCKZqA6O6rzAkIpSSHm/LaENMaTr7W8uj5c8Ce7965B+N/nyHd1WyeHKaI+WMZ9WtjziGK2LPLXgf1t2MK+lTl+p8+KjxfQ7VG+2zTH7I1GaIZnXqhozGpUgYvpzIpnDVIdGkIMapLAQQuuBj6UW/5s5Iq+PIxi6pXfzk2JiuWBO1t6bkStyq0CVLyIcp7y5sfEWu5E/fMc8QuuFZDhOYnC2hnEEIC0MDGngmdPaIB89bifUfxPwJWXyrqeXtysBxA5UvK1Qd0IvgxddWsemx2F5uy5Vnep1kcONNhRzeEPEFR28ZkEeBX6JDwzids9PdX/fmJM78WOxFk+2uQrPQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebd3b8c-4886-4759-47d7-08df0744f465
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 09:48:04.9193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUYyFrBH5fYJZErZ2M4tB+37HoiWWfihKQ+DZbPrPoy/aOhEgpmEl/WGC4QBuQXcm23TNX+Udh2oZd8DfcTq+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244760

--_000_DM4SPRMB00745407AC3F810252E4AAEAC4A92DM4SPRMB0074namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for your review.

Upgrade is already proposed: [wrynose][PATCH] python3: upgrade 3.14.6 -> 3.=
14.7<https://lists.openembedded.org/g/openembedded-core/message/243216?p=3D=
%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2Cpython3%3A+upgrade+3.14.6+-%3E+3.=
14.7%2C20%2C2%2C0%2C120704816>
So, I am skipping upgrade now.

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Thursday, August 27, 2026 7:20 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-15308

On Thu Jul 23, 2026 at 3:40 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream v3.14 backport for CVE-2026-15308.
> The upstream fix commit is referenced in [1], and the public CVE
> advisory is referenced in [2]. The individual backported commit link is
> recorded in the embedded patch header.
>
> [1] https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9=
d5626dca1ca9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-15308
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../python/python3/CVE-2026-15308.patch       | 116 ++++++++++++++++++
>  .../recipes-devtools/python/python3_3.14.6.bb |   1 +
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-15308.p=
atch

Hello,

In this case, I think we can consider upgrading to 3.14.7 (like master).
Can you look into this?

I'll hold this patch for now.

Regards,
--
Yoann Congal
Smile ECS


--_000_DM4SPRMB00745407AC3F810252E4AAEAC4A92DM4SPRMB0074namprd_
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
Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Upgrade is already proposed: <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243216?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%=
2Cpython3%3A+upgrade+3.14.6+-%3E+3.14.7%2C20%2C2%2C0%2C120704816" id=3D"OWA=
bf953c16-92f1-fa3e-2b6d-981bd9d82618" class=3D"OWAAutoLink">
[wrynose][PATCH] python3: upgrade 3.14.6 -&gt; 3.14.7</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
So, I am skipping upgrade now.</div>
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
<b>Sent:</b> Thursday, August 27, 2026 7:20 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-15308</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Jul 23, 2026 at 3:40 PM CEST, Deepak Rathor=
e via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream v3.14 backport for CVE-2026-15308.<br>
&gt; The upstream fix commit is referenced in [1], and the public CVE<br>
&gt; advisory is referenced in [2]. The individual backported commit link i=
s<br>
&gt; recorded in the embedded patch header.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/python/cpython/commit/07efb08123ba93=
67a7107325adb9d5626dca1ca9">
https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9d5626d=
ca1ca9</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-15308">https:=
//nvd.nist.gov/vuln/detail/CVE-2026-15308</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3/CVE-2026-15308.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 116 ++++++++++++++++++<br>
&gt;&nbsp; .../recipes-devtools/python/python3_3.14.6.bb |&nbsp;&nbsp; 1 +<=
br>
&gt;&nbsp; 2 files changed, 117 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3/CVE-2026=
-15308.patch<br>
<br>
Hello,<br>
<br>
In this case, I think we can consider upgrading to 3.14.7 (like master).<br=
>
Can you look into this?<br>
<br>
I'll hold this patch for now.<br>
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

--_000_DM4SPRMB00745407AC3F810252E4AAEAC4A92DM4SPRMB0074namprd_--

