Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412E1C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 13:51:12 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11798.1785246665082343853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 06:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fWrZ62Ev;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22771; q=dns/txt;
  s=iport01; t=1785246665; x=1786456265;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=M6edIPAI5O2VKJHYOfKbOsSc68w5pon65Vr7INqFUbs=;
  b=fWrZ62Evdgu1bNYLB1LPMk7L2dBUizzpCjp7iqxOv1KMG10m8orKzehU
   9ioZ0D9kn86/BD89CPbDFIdzo+tyh8FmYU/TKgiMNcY1cyDzX9LTtcdqy
   eMAxxYkxuna4iwtqK18Ihg3TdO58Mw/UD5nSr0pCr+bf/ltX7zkWW0hSG
   5bM63/YMZHibP2/umOSxqa+JL9qBhby5qrhJm6mDgK8eaQ2ioYQ3Ajmf7
   H2zusdrGiU3CA9vTDgOeFMrSd7pF/ojheQm0kLcF+9zYvnQ/Cc5tGJTq/
   2KUy92ztG97dL95n43DNHUhNJUN4+Evi3w3faXeyS84UCmdoy+dFDqHEX
   w==;
X-CSE-ConnectionGUID: Elc7oxVDS52fUJnjZunYRg==
X-CSE-MsgGUID: LIApXhE7Q7yfO3/b+RjoHw==
X-IPAS-Result: =?us-ascii?q?A0AoAACGsmhq/5MQJK1aHAEBAQEBAQcBARIBAQQEAQFlg?=
 =?us-ascii?q?RcHAQELAYE8ATBTgQgCgSFJiCMDhExfiHkDkUqMUYF+DwEBAQ0CLgEVDQQBA?=
 =?us-ascii?q?YUFAo1jAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8Nh?=
 =?us-ascii?q?loBAQEBAwEROQEtEAIBCBEEAQEBLicKHQgCBAENBQgagmGCHRZBAwECDrV/A?=
 =?us-ascii?q?YE9AooqeIE0gQGDKAE/AkPcChWBOAGFPoMBGwEBBSVJbIJdgSIYARuEYScbG?=
 =?us-ascii?q?4FygRVCgmk+gQWBXAICAReBHREJETyDV4IwBIIiehIbgzmBYY0NUnIiAyYzL?=
 =?us-ascii?q?AFVExcLBwWBIxAzAyovLSNLBS0dcAwnEg8dFxYeWBsHBRIgKkFFIwNBHjgLQ?=
 =?us-ascii?q?wWBVwKBeD8jGTl/gTF1SnctaQECEBdKOBiDPAKCFQMLbT03Bg4ZAwSBNQWNC?=
 =?us-ascii?q?QdbIoI2BwE8NwcJCgEHJE92OAcEKgERM5JjH49BhB2KQ5UXCiiDdYp7gSaNP?=
 =?us-ascii?q?ogyF4QEgVeLPYcDklELmH0jjWeVNCw5hHUCBAIEBQIQAQEGgWg8gUQOB3AVg?=
 =?us-ascii?q?yIJShkPji0Wg2CCVoExgQzJJ3kCCTIBAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-PHdr: A9a23:j7GTqBeO2uz/WXNU5ksnyp2RlGM/gIqcDmcuAtIPgrZKdOGk55v9e
 RCZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:JyKVl6NI66zyhYzvrR39lsFynXyQoLVcMsEvi/4bfWQNrUoi1mNVy
 2EWXTqAb/iOZWX0Kd8laYS//E8EsJWDm9diQHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gW4sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69hqBx4xLbM0wbstD1xs8
 /4qNTY8VB/W0opawJrjIgVtrs0nKM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGYwBPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FMhgOm8b4SJK7RmQ+1xv2+Al
 mLroF2mEx89b5uVigCH9VKz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:60Fxo60aD9HwZylyk/C2JgqjBbJxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K690cm7LU819fZOkO8s1MSZLXjbUQqTXc5fBOTZskfd8kHFh4pgPO
 JbAtdD4b7LfBZHZKTBkXSF+r8bqbHtntHL9ILjJjVWPH1Xgspbnn5E43OgYzZLrX59dOIE/f
 Snl616jgvlU046Ku68AX4IVfXCodrkqLLKCCRtOzcXrCO1oXeN8rDVLzi0ty1ybxp/hZsy+2
 nMlAL0op6kr+y6zRHk0WrS5YR9mdfqyNdPbfb8y/T9LA+Cti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2Ccu3LWqkrd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vet7zL
 lA0wuixthq5FL77WHADurzJlZXf3mP0DwfeCko/iViuL4lGftsREokjRto+dk7bXnHAcscYZ
 lT5YnnlYVrmBWhHjDkl1gq5sCwVXIuGRrDaE0DtsuJlwVyphlCvhElLAh1pAZdyHr7IKM0ut
 gtPslT5cNzZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tTKCZgOlamXkaYzvdAPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5HdPQQGG+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rHYpSxQXxV5RbNHFbWswIvdQwXU6Iv6vwW8DXn/2edOyWKKvmED4iVG+6Cn
 wfXCLrLMEF9UyvUm+QummZZ5osQD2IwXtdKtmswwFI8vl5CmRliHlgtWiE
X-Talos-CUID: =?us-ascii?q?9a23=3AtabSJmgUFPRyfpMrpkbaupO2wDJuX3nWk3DAHWO?=
 =?us-ascii?q?DVDxndZ+TS22N/pJenJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AQ2bzbA9dvcRmrkXkIg5H+HSQf+NJyryeCG1SqMo?=
 =?us-ascii?q?Xte7fciYzATWarCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 13:51:03 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id D463818000579
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 13:51:03 +0000 (GMT)
X-CSE-ConnectionGUID: cHpA0S3cQX6HuuNFVu6gvA==
X-CSE-MsgGUID: aUODJw9lRrOwBZg97LCQrg==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,190,1779148800"; 
   d="scan'208,217";a="82012941"
Received: from mail-northcentralusazon11010038.outbound.protection.outlook.com (HELO CH1PR05CU001.outbound.protection.outlook.com) ([52.101.193.38])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 13:51:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPUNApRssXUFcxwB0i5sz6/+2r3W9TsjCT+fvr09LmOmeLDSWqEvLlMwvk1QTtnAWVChS5hWjGrEJn1QbYxj8hE9V9Wesjjq8wEYXA9AJIIybt1PZDEhbUUyS3GtjlXKvP2sfULsGNZWFSdW8YlfRdxEG3qQ9KOk50F/uyw0bz1iEZmDhRX5hTs5bD2UCQploz8eT9EVIQqbK9S/ndbpb454I8WQ+CO1ozLY9OVYnfi6UTEiQH2dmEazWRPf3CXo4GMrMQreDu+YcGpin5Rj4FhD9W9Bbw1SIrtIXFYAQsurTr/mxzOdXp28sY6suqubVQHlKkBp3v3Be+nXtFB9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6edIPAI5O2VKJHYOfKbOsSc68w5pon65Vr7INqFUbs=;
 b=AFZu1UNrKHPm8gEmY2CM0kRuVXoqMsEHYQqJWljfvH0HnSGWeYfL96K3FLtd02qYvMLj/kmSVaaEUdfimg0WUi0ZUxvJjSO/3z2qhqKq9UUxlr/RB4SDgTcGTY+G87BxtJrZSjLP+Ia3YfMK5rEl27GsiTiceUlgDkdHbA/usCSPToAQOpuRc3RDun3xjmCc0Ne/l0OQYfTjqTyKr0nc//xnVChUQ56WlMLqeRpqm7S4932pOGHKJxHVcdy+9ksMVaICqB46cx5TCjXg0jxsOaB6Lrjg5oqh4SFnyV67EzJwbOKQ7X1qlZIi1HMqu47C+yBpg7DeuUarlBdccvlguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 13:51:00 +0000
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::41fa:d12d:31c1:d5db]) by SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::41fa:d12d:31c1:d5db%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 13:51:00 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
Thread-Topic: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
Thread-Index: AQHc+mUoPWNwtzk+sEGobmto1GtfqraDMeyAgAAIESs=
Date: Tue, 28 Jul 2026 13:50:59 +0000
Message-ID: 
 <SJ0PR11MB5896A3DCBC1BB59645700280CFCB2@SJ0PR11MB5896.namprd11.prod.outlook.com>
References: <20260612121514.2282121-1-asparmar@cisco.com>
 <DKA8EDJ6USH4.2QWN8732Z6OV8@smile.fr>
In-Reply-To: <DKA8EDJ6USH4.2QWN8732Z6OV8@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5896:EE_|PH7PR11MB7513:EE_
x-ms-office365-filtering-correlation-id: f5dcd98b-ec71-4785-77f3-08deecaf41c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|6133799003|11063799006|56012099006|18002099003|8096899003|22082099003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 S0oXlhNkoWQvQVIWiQPRj/7QIN1fTajJ7ewudAIUOaIJDOJJH3Ss/cB5+21OIbBsW4OrxIhfnBl+JhJG7fHDEA2IjDEManUpZy0pUjda4XzkiAilKEehWHghl6sQExtxIbZuBk+QfvfyhQHiBTN/nolKGUdI5qZeftM63et2U8ZGpBczya6Za9htZDXTfGc4FS0sMsedKp4zxqlkowoMqkr9pAzEQBLZ88os/G1aj7g+j4svg/Qx7g/dVQZhjSrCg7PyOj6GHMIU/a02s/wwNMwtFzXekmKl4wi1c1gkHg8xEt+bIaZ5pZa4m7R/r14YzntPZI8wd88ZrNtIt95fOhchg+colEmG+exAtQHJpzcEU/82ITG3wWKh3KxJHKbyuEZphWq2mgo6v6aoyms1MYXDQ699USt3lCNEyrVAE2ffCN3V972/cMoxLkdeiRKSkPefn9haTbxs1TXfJxOtfodjxRkIkDHbr0fPA8+PFXIIVdYt22rPs5xywTzbNY9W1gnhypuJd80eUfrbXWzCjTEcqGZKkGXYL/tWDshGE97cQFxDGgXwFFRD8YtWVZO+4SGUQJRM2PD89YtR/Vld4FQJRUrAklZpKKA8970z9UOUH1Ar+Q8lFJPfjHq5SukmAZgSOTHoymGflxMZWzVek/RdRDgIzFjsJBrwqXKfcOS/BnfLP0aX1kfGzY4HpnON
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(8096899003)(22082099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+el21oLYBlTRdUGwbf+6jPsIJBGG72bCL1za7+zWLPLYcH3U2gkDzo241yWh?=
 =?us-ascii?Q?vnaKhdKp9IqQ2Pau5sGgaLfeqmed6sSNRt4GV+7KcrwRztWiG/Lim9M5GLkR?=
 =?us-ascii?Q?2LSSvFe7/CQcOCRSaocbzLo8nqfAphtXowu1mZuUqK+0/T9QD8cPdVp0HizA?=
 =?us-ascii?Q?rdF2sFcJc7q9ehwZNjwdl9hwtXKX6NvtKs1FWaZazIBq1MdDfcXjnRqfWkhn?=
 =?us-ascii?Q?slNhQNkmwa4xJbEqKiVhD5w1eh5ZyZ/fMLsu5d0gVzeS9RHFhyfREqGHZxN3?=
 =?us-ascii?Q?2WtCJyZwWbCWXtK1GcUn829rn/2OIPA8bYgfgwK4EcMN6qrL7E+gFgOIsRmY?=
 =?us-ascii?Q?yWhdVgEkOgcj9dIcyAgzv9RzCseS/HRMWiotiKZgmiaJyqpAgJY1ukhM/pyQ?=
 =?us-ascii?Q?epGyRTOw+aVU7O+MCUNQNXSW/QgSyY5CLUCGOo7cRyYMr6ZyWbE/+neOCxB6?=
 =?us-ascii?Q?dhGnzpWip8K87H4lS1wk9uRV3n8Bd2L0aZkFzGrL2Bv83GhH2EL5Gqe8RGjL?=
 =?us-ascii?Q?kQCJBCderl/Bj2JY5Ji8x5/+48uh4o2uX+1L0Q1hTEuhtMx7+c8RLJ63c5Ke?=
 =?us-ascii?Q?Jjj89aag+W/S0tdiyahTzfRurVPzcs+3+/EwZHBFSNeF6tJYA9NY4b16YtRM?=
 =?us-ascii?Q?Ou01Y4iKbLsGxbUg8VqbaWLLWX506Q9PqcjQy8rydl9QMNSli+2KMRp8PnCV?=
 =?us-ascii?Q?zMvHDOgzhc3cCbCuwr8acPIeogL2TVx3iFaXV04hhFBI821dz+75l1Jx3WFY?=
 =?us-ascii?Q?F8dtssrGFxG1dhBTp1ni0Bq4Oc0Jd21A3gyClq3P7pyYqTiHXQTXnLd1xMd1?=
 =?us-ascii?Q?KvzJhB8wA3ahglw38w79IYmvIW3SoEXQomr8lt6idCHTBxR+jzuMIkfBOvJW?=
 =?us-ascii?Q?Os6WJ/4PsCNZ6h29cKKsOE2Oiy2tOjsAwVHTIqRvinUPJEJJXhJbW15GSI0/?=
 =?us-ascii?Q?2tEf1Uo/mgq0u9i5h9g+d9IaxXfVKtG0oVQ0LeMCZU03pDr2Zsv7oR9oq2Sb?=
 =?us-ascii?Q?6d8QO3uTGqrDnL43CJ2tBuM8iBd3mb0Ety/V4xw90U8n410UthpDYE++6HOJ?=
 =?us-ascii?Q?adrqqy9BwiuobCxG/033yEKyCiGbONdFJZqYXzeAqKMbKzZ70eiD2+ICCPLj?=
 =?us-ascii?Q?sj2Yx+Hw+PZEEcdW2PIHjHRMqiybukudHlhENujRFcpD1qsA+lyYYx4VhvTW?=
 =?us-ascii?Q?RBBu3iOn/ZGCYUSYwJvsxoGRomhedWsF0jub51EVDdF6MLBVkVk9fNnwMP0a?=
 =?us-ascii?Q?WK8K+ecRSY85aJ03yGtIDv/jiDz4S1AxFO4HQA8tNmVXY3+ieoleeqEBU9Dt?=
 =?us-ascii?Q?bd3SdZaxmKAcBWmG2Avs4p8VoYDMGWjaGXND6Vid4OqGUcFm5H2vd5sIF/q0?=
 =?us-ascii?Q?g5/wrf3R/djksU5XONKNKB6wePLC9kcaUv5gOU+U4DWa5A0vxM6/fWDAp5eo?=
 =?us-ascii?Q?wrTsbHVFYhw73/KjJsiec4hh+0c/lFePeu2ATbLaL4pz3tttvJJSfaTFKxR+?=
 =?us-ascii?Q?kaNEOWiEJ9n4WvbwMX7qr9znoPBo3fVR+2WaIB4xYyAJFD/7+zjTHuAJIvoW?=
 =?us-ascii?Q?RTyL68Mu0nTTOqAIyWYANj/2L5//CBboLxj2QUVSbrrlacj3D0LtQw4paC9p?=
 =?us-ascii?Q?CL1ENdO0aShPkCJzuzIXeqv0nI44v+/O2E8MN7NqwXKQXBH5jSCUbdKAj8aZ?=
 =?us-ascii?Q?yRHALjiynVECPHTPICpt/dpC5xj/dFMU0ZevFxf++NL2Kjmq?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB5896A3DCBC1BB59645700280CFCB2SJ0PR11MB5896namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	fgSBwin2tKTjfITkYAKIBJuOucJ8xyAhkmagcqH1r3acOiyU/I0idnFdgYXXbSf02Gl00lrGKwjCBeCTJopjzSj/E18EROlrJt/zp0xJdNs5FjkcRufTP3p8kON0Tq5zvjpo2gibDNNuad7UBUPY5iRk8WL7y4CbhDE5R8R/YXwSkatohFZiQIjgHZwYfWrdyJEvdOU65cECIjNNZDyURuD7ZEGxOh9u4El/sWOh5p92K53Lj1qZw/erxGguo08urGE4wZL9rSFFljXhv6nrX5TYfDwbG8RdV9ItOlGlen/vQkjen1/AnHUtwdO50eawm0aMT7CG2szH/5g8uwodZA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dcd98b-ec71-4785-77f3-08deecaf41c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 13:50:59.9875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cBDcKU1MUzBRsdFKnawPKSXnNWprzJNlxCrfc17fZb3qrRgbgR4HO91LM1/p+0lWBtHlgl9Y2HixEarbJ8zsuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 13:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242194

--_000_SJ0PR11MB5896A3DCBC1BB59645700280CFCB2SJ0PR11MB5896namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for reporting this.

I checked the Debian 11 build failure. The Scarthgap rsync changes currentl=
y include <linux/openat2.h> and use SYS_openat2 unconditionally. The Debian=
 11 build headers do not define SYS_openat2, so the compilation fails.

My local validation passed because the available build headers define SYS_o=
penat2, so it did not cover this older-host case.

I also checked whether upgrading to the upstream v3.2.7-sec-patches1 tag wo=
uld resolve the problem. It would not: that tag has the same unconditional =
SYS_openat2 use and does not contain the required configure-time portabilit=
y check.

The current upstream v3.2.7-sec-patches branch includes the follow-up commi=
t:
 https://github.com/RsyncProject/rsync/commit/729ec83612d43e361ada1870173b5=
25bc0b9ebac

This checks for both <linux/openat2.h> and SYS_openat2 during configure, de=
fines HAVE_OPENAT2 only when both are available, and retains the existing f=
allback on older systems.

Once you confirm,
I will add this follow-up to the Scarthgap series and rerun both rsync-nati=
ve and rsync build validation before sending a v2.

  Thanks,
  Ashish
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 28 July 2026 18:46
To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembedd=
ed-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518

On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
> where a non-chrooted rsync daemon could be exposed to a parent path
> TOCTOU race that allowed file access outside the module.
>
> Also include the dependent upstream fix that followed the CVE fix:
> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>   opening files from the module root, closing the same race on the
>   read side.
>
> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba8=
41b94ffe19cd2505
> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a=
525a1f5566f10c85
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>  3 files changed, 405 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.p=
atch

Hello,

Something in this series made the test fail on debian 11:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4395/st=
eps/15/logs/stdio
|   399 ERROR: rsync-native-3.2.7-r0 do_compile: oe_runmake failed
|   400 ERROR: rsync-native-3.2.7-r0 do_compile: ExecutionError('/srv/pokyb=
uild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tmp/work/x86_64=
-linux/rsync-native/3.2.7/temp/run.do_compile.2977888', 1, None, None)
|   401 NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_patch: Succeeded
|   402 NOTE: Running task 392 of 412 (/srv/pokybuild/yocto-worker/oe-selft=
est-debian/build/meta/recipes-devtools/gcc/gcc-source_13.4.bb:do_preconfigu=
re)
|   403 NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_preconfigure: Sta=
rted
|   404 NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_preconfigure: Suc=
ceeded
|   405 ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe=
-selftest-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/=
3.2.7/temp/log.do_compile.2977888
|   406 Log data follows:
|   407 | DEBUG: Executing python function autotools_aclocals
|   408 | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc=
', 'bit-64', 'x86_64-linux', 'common']
|   409 | DEBUG: Python function autotools_aclocals finished
|   410 | DEBUG: Executing shell function do_compile
|   411 | NOTE: make -j 16 -l 75 STRIP=3D
|   412 | gawk -f ./daemon-parm.awk ./daemon-parm.txt
|   413 | sed 's;\@bindir\@;/srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7/recipe-sysr=
oot-native/usr/bin;g' <./stunnel-rsyncd.conf.in >stunnel-rsyncd.conf
|   414 | gawk -f ./mkproto.awk ./*.c ./lib/compat.c daemon-parm.h
|   415 | gawk -f ./define-from-md.awk -v hfile=3Ddefault-dont-compress.h .=
/rsync.1.md
|   416 | gawk -f ./define-from-md.awk -v hfile=3Ddefault-cvsignore.h ./rsy=
nc.1.md
|   417 | gcc  -I. -I. -I./zlib -isystem/srv/pokybuild/yocto-worker/oe-self=
test-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7=
/recipe-sysroot-native/usr/include -O2 -pipe -DHAVE_CONFIG_H -Wall -W -isys=
tem/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tm=
p/work/x86_64-linux/rsync-native/3.2.7/recipe-sysroot-native/usr/include -c=
 match.c -o match.o
|   418 | gcc  -I. -I. -I./zlib -isystem/srv/pokybuild/yocto-worker/oe-self=
test-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7=
/recipe-sysroot-native/usr/include -O2 -pipe -DHAVE_CONFIG_H -Wall -W -isys=
tem/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tm=
p/work/x86_64-linux/rsync-native/3.2.7/recipe-sysroot-native/usr/include -c=
 syscall.c -o syscall.o
|   419 | syscall.c: In function 'secure_relative_open_linux':
|   420 | syscall.c:1723:19: error: 'SYS_openat2' undeclared (first use in =
this function); did you mean 'SYS_openat'?
|   421 |  1723 |   dirfd =3D syscall(SYS_openat2, AT_FDCWD, basedir, &bhow=
, sizeof bhow);
|   422 |       |                   ^~~~~~~~~~~
|   423 |       |                   SYS_openat
|   424 | syscall.c:1723:19: note: each undeclared identifier is reported o=
nly once for each function it appears in
|   425 | make: *** [Makefile:76: syscall.o] Error 1
|   426 | ERROR: oe_runmake failed
|   427 | WARNING: exit code 1 from a shell command.
|   428 NOTE: recipe rsync-native-3.2.7-r0: task do_compile: Failed
|   429 ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/oe-selftest=
-debian/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_compile) failed=
 with exit code '1'
|   430 NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
|   431 NOTE: Tasks Summary: Attempted 394 tasks of which 381 didn't need t=
o be rerun and 1 failed.
|   432 NOTE: The errors for this build are stored in /srv/pokybuild/yocto-=
worker/oe-selftest-debian/build/build-st-2690503/tmp/log/error-report/error=
_report_20260728100237.txt
|   433 You can send the errors to a reports server by running:
|   434   send-error-report /srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-2690503/tmp/log/error-report/error_report_20260728100237.txt=
 [-s server]
|   435 NOTE: The contents of these logs will be posted in public if you us=
e the above command with the default server. Please ensure you remove any i=
dentifying or proprietary information when prompted before sending.
|   436
|   437 Summary: 1 task failed:
|   438   virtual:native:/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_compile
|   439     log: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build=
-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7/temp/log.do_compile.29=
77888
|   440 Summary: There was 1 WARNING message.
|   441 Summary: There were 2 ERROR messages, returning a non-zero exit cod=
e.

Can you look into this? My guess is the newly introduced openat2 syscall
is not compatible with debian11.

FYI, same goes for the wrynose series, I'll answer there.

Regards,
--
Yoann Congal
Smile ECS


--_000_SJ0PR11MB5896A3DCBC1BB59645700280CFCB2SJ0PR11MB5896namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
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
I checked the Debian 11 build failure. The Scarthgap rsync changes currentl=
y include &lt;linux/openat2.h&gt; and use SYS_openat2 unconditionally. The =
Debian 11 build headers do not define SYS_openat2, so the compilation fails=
.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
My local validation passed because the available build headers define SYS_o=
penat2, so it did not cover this older-host case.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I also checked whether upgrading to the upstream v3.2.7-sec-patches1 tag wo=
uld resolve the problem. It would not: that tag has the same unconditional =
SYS_openat2 use and does not contain the required configure-time portabilit=
y check.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The current upstream v3.2.7-sec-patches branch includes the follow-up commi=
t:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;<a href=3D"https://github.com/RsyncProject/rsync/commit/729ec83612d43=
e361ada1870173b525bc0b9ebac">https://github.com/RsyncProject/rsync/commit/7=
29ec83612d43e361ada1870173b525bc0b9ebac</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This checks for both &lt;linux/openat2.h&gt; and SYS_openat2 during configu=
re, defines HAVE_OPENAT2 only when both are available, and retains the exis=
ting fallback on older systems.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Once you confirm,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I will add this follow-up to the Scarthgap series and rerun both rsync-nati=
ve and rsync build validation before sending a v2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; Ashish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 28 July 2026 18:46<br>
<b>To:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;; openembedded-core@lists.openembedded.or=
g &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-295=
18</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar P=
armar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openemb=
edded.org wrote:<br>
&gt; From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;<br>
&gt; Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],=
<br>
&gt; where a non-chrooted rsync daemon could be exposed to a parent path<br=
>
&gt; TOCTOU race that allowed file access outside the module.<br>
&gt;<br>
&gt; Also include the dependent upstream fix that followed the CVE fix:<br>
&gt; - CVE-2026-29518_p2.patch [2] secures sender read-path opens by<br>
&gt;&nbsp;&nbsp; opening files from the module root, closing the same race =
on the<br>
&gt;&nbsp;&nbsp; read side.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/RsyncProject/rsync/commit/1a5ad81add=
1004354a3d8ba841b94ffe19cd2505">
https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba841b94f=
fe19cd2505</a><br>
&gt; [2] <a href=3D"https://github.com/RsyncProject/rsync/commit/99b36291d0=
6ca66229942c7a525a1f5566f10c85">
https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a525a1f=
5566f10c85</a><br>
&gt; [3] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-29518">http=
s://www.cve.org/CVERecord?id=3DCVE-2026-29518</a><br>
&gt;<br>
&gt; Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../rsync/files/CVE-2026-29518_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 330 ++++++++++++++++++<br>
&gt;&nbsp; .../rsync/files/CVE-2026-29518_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 73 ++++<br>
&gt;&nbsp; meta/recipes-devtools/rsync/rsync_3.2.7.bb&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 405 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29=
518_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29=
518_p2.patch<br>
<br>
Hello,<br>
<br>
Something in this series made the test fail on debian 11:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/bui=
lds/4395/steps/15/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie=
/?#/builders/35/builds/4395/steps/15/logs/stdio</a><br>
|&nbsp;&nbsp; 399 ERROR: rsync-native-3.2.7-r0 do_compile: oe_runmake faile=
d<br>
|&nbsp;&nbsp; 400 ERROR: rsync-native-3.2.7-r0 do_compile: ExecutionError('=
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tmp/w=
ork/x86_64-linux/rsync-native/3.2.7/temp/run.do_compile.2977888', 1, None, =
None)<br>
|&nbsp;&nbsp; 401 NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_patch: =
Succeeded<br>
|&nbsp;&nbsp; 402 NOTE: Running task 392 of 412 (/srv/pokybuild/yocto-worke=
r/oe-selftest-debian/build/meta/recipes-devtools/gcc/gcc-source_13.4.bb:do_=
preconfigure)<br>
|&nbsp;&nbsp; 403 NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_preconf=
igure: Started<br>
|&nbsp;&nbsp; 404 NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_preconf=
igure: Succeeded<br>
|&nbsp;&nbsp; 405 ERROR: Logfile of failure stored in: /srv/pokybuild/yocto=
-worker/oe-selftest-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsy=
nc-native/3.2.7/temp/log.do_compile.2977888<br>
|&nbsp;&nbsp; 406 Log data follows:<br>
|&nbsp;&nbsp; 407 | DEBUG: Executing python function autotools_aclocals<br>
|&nbsp;&nbsp; 408 | DEBUG: SITE files ['endian-little', 'common-linux', 'co=
mmon-glibc', 'bit-64', 'x86_64-linux', 'common']<br>
|&nbsp;&nbsp; 409 | DEBUG: Python function autotools_aclocals finished<br>
|&nbsp;&nbsp; 410 | DEBUG: Executing shell function do_compile<br>
|&nbsp;&nbsp; 411 | NOTE: make -j 16 -l 75 STRIP=3D<br>
|&nbsp;&nbsp; 412 | gawk -f ./daemon-parm.awk ./daemon-parm.txt<br>
|&nbsp;&nbsp; 413 | sed 's;\@bindir\@;/srv/pokybuild/yocto-worker/oe-selfte=
st-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7/r=
ecipe-sysroot-native/usr/bin;g' &lt;./stunnel-rsyncd.conf.in &gt;stunnel-rs=
yncd.conf<br>
|&nbsp;&nbsp; 414 | gawk -f ./mkproto.awk ./*.c ./lib/compat.c daemon-parm.=
h<br>
|&nbsp;&nbsp; 415 | gawk -f ./define-from-md.awk -v hfile=3Ddefault-dont-co=
mpress.h ./rsync.1.md<br>
|&nbsp;&nbsp; 416 | gawk -f ./define-from-md.awk -v hfile=3Ddefault-cvsigno=
re.h ./rsync.1.md<br>
|&nbsp;&nbsp; 417 | gcc&nbsp; -I. -I. -I./zlib -isystem/srv/pokybuild/yocto=
-worker/oe-selftest-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsy=
nc-native/3.2.7/recipe-sysroot-native/usr/include -O2 -pipe -DHAVE_CONFIG_H=
 -Wall -W -isystem/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7/recipe-sysroot-native=
/usr/include
 -c match.c -o match.o<br>
|&nbsp;&nbsp; 418 | gcc&nbsp; -I. -I. -I./zlib -isystem/srv/pokybuild/yocto=
-worker/oe-selftest-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsy=
nc-native/3.2.7/recipe-sysroot-native/usr/include -O2 -pipe -DHAVE_CONFIG_H=
 -Wall -W -isystem/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7/recipe-sysroot-native=
/usr/include
 -c syscall.c -o syscall.o<br>
|&nbsp;&nbsp; 419 | syscall.c: In function 'secure_relative_open_linux':<br=
>
|&nbsp;&nbsp; 420 | syscall.c:1723:19: error: 'SYS_openat2' undeclared (fir=
st use in this function); did you mean 'SYS_openat'?<br>
|&nbsp;&nbsp; 421 |&nbsp; 1723 |&nbsp;&nbsp; dirfd =3D syscall(SYS_openat2,=
 AT_FDCWD, basedir, &amp;bhow, sizeof bhow);<br>
|&nbsp;&nbsp; 422 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ^~~~~~~~~~~<br>
|&nbsp;&nbsp; 423 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; SYS_openat<br>
|&nbsp;&nbsp; 424 | syscall.c:1723:19: note: each undeclared identifier is =
reported only once for each function it appears in<br>
|&nbsp;&nbsp; 425 | make: *** [Makefile:76: syscall.o] Error 1<br>
|&nbsp;&nbsp; 426 | ERROR: oe_runmake failed<br>
|&nbsp;&nbsp; 427 | WARNING: exit code 1 from a shell command.<br>
|&nbsp;&nbsp; 428 NOTE: recipe rsync-native-3.2.7-r0: task do_compile: Fail=
ed<br>
|&nbsp;&nbsp; 429 ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/o=
e-selftest-debian/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_compi=
le) failed with exit code '1'<br>
|&nbsp;&nbsp; 430 NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: S=
ucceeded<br>
|&nbsp;&nbsp; 431 NOTE: Tasks Summary: Attempted 394 tasks of which 381 did=
n't need to be rerun and 1 failed.<br>
|&nbsp;&nbsp; 432 NOTE: The errors for this build are stored in /srv/pokybu=
ild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tmp/log/error-re=
port/error_report_20260728100237.txt<br>
|&nbsp;&nbsp; 433 You can send the errors to a reports server by running:<b=
r>
|&nbsp;&nbsp; 434&nbsp;&nbsp; send-error-report /srv/pokybuild/yocto-worker=
/oe-selftest-debian/build/build-st-2690503/tmp/log/error-report/error_repor=
t_20260728100237.txt [-s server]<br>
|&nbsp;&nbsp; 435 NOTE: The contents of these logs will be posted in public=
 if you use the above command with the default server. Please ensure you re=
move any identifying or proprietary information when prompted before sendin=
g.<br>
|&nbsp;&nbsp; 436 <br>
|&nbsp;&nbsp; 437 Summary: 1 task failed:<br>
|&nbsp;&nbsp; 438&nbsp;&nbsp; virtual:native:/srv/pokybuild/yocto-worker/oe=
-selftest-debian/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_compil=
e<br>
|&nbsp;&nbsp; 439&nbsp;&nbsp;&nbsp;&nbsp; log: /srv/pokybuild/yocto-worker/=
oe-selftest-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-nativ=
e/3.2.7/temp/log.do_compile.2977888<br>
|&nbsp;&nbsp; 440 Summary: There was 1 WARNING message.<br>
|&nbsp;&nbsp; 441 Summary: There were 2 ERROR messages, returning a non-zer=
o exit code.<br>
<br>
Can you look into this? My guess is the newly introduced openat2 syscall<br=
>
is not compatible with debian11.<br>
<br>
FYI, same goes for the wrynose series, I'll answer there.<br>
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

--_000_SJ0PR11MB5896A3DCBC1BB59645700280CFCB2SJ0PR11MB5896namp_--

