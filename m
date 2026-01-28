Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7CCD3567F
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 06:03:10 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7133.1769580188469571692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 22:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jp/qF/5v;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15761; q=dns/txt;
  s=iport01; t=1769580188; x=1770789788;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=wB9/h+o9adQQmQVA9w827y4wUfDCZcMHYuX9Nfss0r4=;
  b=jp/qF/5vf8vKzfzgFH8WDmum6+QpNA2JGZXrBMfqdDMLyffdVbXFpyEk
   M45DTi1SljI1lw4MLGCAk0T7rfgIOZhEN6X9kEm3L1Bi9q2jLZxDbaA/u
   DDGO4xPSZLJhdnm22PbNXnY1YgXhMbwKJwiyCdwpOyZ3mOEqBqOE1teqn
   IYmDIkEnlZ9YwhnYYgI38tjDEVeSmCGqTpmnCbxM+oEAOtW0IaRWh3jMV
   aDN1BUSvc/54GbY2K7k6ILiZDTXOO+kmlTliLRHafAZ9Cq45TuCikzYXk
   Xe+TZEPYYTxEnsdMv5/aohBbSK0S1xY7izguzyYcLBy7rA9OIEo9skDcB
   Q==;
X-CSE-ConnectionGUID: wQTzNF8XQq6cCcGd8gpTtg==
X-CSE-MsgGUID: kFhiULpFTJO15FqiUwV3cA==
X-IPAS-Result: =?us-ascii?q?A0CcAgD3pHlp/4r/Ja1agQklgSuBPQEwUwcPbwKBIRovA?=
 =?us-ascii?q?4ggA4UsiHkDl0OGV4F/DwEBAQ0CLgEOFAQBAYUHAo0PAiY0CQ4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4YVCDINhloBAQEBAQIBEWcQA?=
 =?us-ascii?q?gEIEQQBAS8nCh0IAgQOBQgagmGCHRZAAwECDgakKwGBQAKKK3iBNIEBg2gBR?=
 =?us-ascii?q?Nt1AQsUAQWBM4U7gxcBASqBNIJagR4QCYR4JxsbgXKBFEOCaD6CYQMBAYFfJ?=
 =?us-ascii?q?BiDV4IvBIIiehQdjEOHY1JyIgMmMywBVRMXCwcFgSNDAyovLSNLBS0dgSMSD?=
 =?us-ascii?q?x0XEx9YGwcFEyMpBhkGHBICAwECAjpTDIF1AgICAoIQe4IBD4Z3gQAFLm8aD?=
 =?us-ascii?q?iICLBVeWSIDC209NxQbAwSBNQWOMVtEgioHAXMaLFoMCwolgSiTYI8Qjl+VF?=
 =?us-ascii?q?woog3SMHo0+iDIXhASBV6UQmQYigjamPgIEAgQFAhABAQaBaDxGgRNwFTuCZ?=
 =?us-ascii?q?wlJGQ+HfoZhgh2GOL5qeAIRKQIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:MKzVchT5PnNjkhWLTDoYFUgomtpso47LVj580XJvo7tKdqLm+IztI
 wmDo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:U7Xeia3YjKoSZk/c4PbD5Ypwkn2cJEfYwER7XKvMYLTBsI5bp2NWm
 GEcX2rTP/3cMzT2eYpxb9y/9E1TuMLXmNcxQAE93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX7g2cuYjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGE3gKL6s2qtZOGD9F3
 vc3JGACdiyfiLfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWnOq0nnDjWzZZs1mS46Ew5gA/ySQvjeO1bYSNIofiqcN9nWiYp
 1/i50rFIDZDafKGyAeazCmnr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:GYbWQ6tjYS324NcQhKNVEtKg7skCMIAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tKLzOWyVdATbsSo7cKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKzPoSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAZIUE5nHfiTNz0uZcSGjdvNk57tfB4BADAayCTmt1mVwY+/OSK1mjMFXR1y4ZpKyw
 X4egrCiZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoTJ4JYczAgBkF5MWUrHo6mt
 jFpBkte+5p7WnKQ22zqRzxnyH9zTcV7WP4w1PwuwqgnSW5fkN+NyNyv/MfTvLr0TtngDi66t
 MT44utjesSMfoHplWk2zGHbWAwqqP+mwtTrQdatQ0sbWJZUs4QkWTal3klTavp20nBmdoa+O
 UCNrCo2N9GNVyddHzXpW9p3ZilWWkyBA6PRgwYttWSyCU+pgE186I0/r1Vop47zuN2d7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUPhvAQODl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P0bjE9eH0pFH+g3EBG+9QTPuwMdD4IURgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR+TuKGP/cLw5lzEWm6MiYEX2fPdlzOrTAWj+1v4jAreawdDmTA==
X-Talos-CUID: 9a23:QtPVum50/wfEP698ftss63coCOYLIk3k1SnbCESXBTZmUIGJRgrF
X-Talos-MUID: 9a23:7KffRQTCl9mEk1m5RXTvqjFjCeNwzZiMLxlQv4wHhta6bidZbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jan 2026 06:03:07 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 5D6C4180001EC
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:03:07 +0000 (GMT)
X-CSE-ConnectionGUID: qOkab3HVQ4SPoFPoDOzmYw==
X-CSE-MsgGUID: qJW8dCWAQ1S8T9IesB816Q==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,258,1763424000"; 
   d="scan'208,217";a="64109876"
Received: from mail-dm5pr08cu00405.outbound.protection.outlook.com (HELO DM5PR08CU004.outbound.protection.outlook.com) ([40.93.13.101])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jan 2026 06:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGPMyO7c7/pkx+goMePNYt0G/zZoniG0a+NovT8KlE8V4eIv2cebUftaV76ILEzHr9MLlevYKTGvTPpLLMqhWu0uLOYa8U2j67dkQAPwZwC5cx/tuqyL/EyKPE4089b9F6AS5m8LkMsZqYuC5R6G+Mkg9EDp53FhInDKA+4hlXEe4xb8RIWRnmAiLNEzaG+OpddqhhXvZoKWglFHql4BkfdKtwcRpJ6kprxI1ooJuQqeTkq8uzTnjobzBsH8t2f7KpXhNEpVhQSU/Lda8bNJu9N7Gwl0/n3bWuUad1jAcXgjCxOqa9guEImzOG+HJ17iVa1f7wByEezpE0fpZKeYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wB9/h+o9adQQmQVA9w827y4wUfDCZcMHYuX9Nfss0r4=;
 b=HpI4WPdj7ammKhzY3H/tXov5bFP7+s71O1DtCBQ8gBrO5VSE0WX2BcasOi1mcbAVbO0ZJ0DCrdTHUs9v92J/Ys/oUiYkEdEnBFer3AlC1xJwLjJMp6+WQjEUghF8YB8+beDIbJv3ipYbQWNHyVMgZEBtr9VR9xmfweB8mVpv5a8N0B7tkxo6lSCgUcBY8LlTkgv/pAwC6xoZShVstbv+HplbsD9Cg6pGDQL/OrgxBqlpzYitnNXth2JpoZjiT20HY8HmwKOQRnc4Zqd+n+bSBbBqCnRjGdtg65rKzV3rJe6pxX9f8I56EpWcICtl22bFyrgl6ucFzEG2tIfPWyU/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 06:03:04 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::f6a0:8764:5448:20be]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::f6a0:8764:5448:20be%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 06:03:04 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Het Patel -X (hetpat - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CVSS
 score from all sources
Thread-Topic: [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CVSS
 score from all sources
Thread-Index: AQHci6+4klQwDz08aEyL+mr6l7hUxbVnH3Dy
Date: Wed, 28 Jan 2026 06:03:04 +0000
Message-ID: 
 <DS0PR11MB740520FCABFFFCD88073D7D4DC91A@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <188D1595910BDEB4.3547823@lists.openembedded.org>
In-Reply-To: <188D1595910BDEB4.3547823@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|PH0PR11MB5110:EE_
x-ms-office365-filtering-correlation-id: b1e007d4-5d52-4a69-6829-08de5e32e6b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?nC9EQ4RPryyQaauf/cBTk9LhHjJvslApBUW52ksVgv05dLn8qcGzMRJwsZ/Y?=
 =?us-ascii?Q?72VpMsdoYRjDDI0bYdfN8d2tk/ucgDkHUHKN9/oLrn+yqTKa0m/snPrw6BDA?=
 =?us-ascii?Q?F5OXKB3iB7Z/V4oo+gKaV4B7BkVRDd7Plb92Mdz/mL7qj0vHyxOI1UI0H1Me?=
 =?us-ascii?Q?V+EhlL98LSQcfDN3gCuu4CPi3JVCoADgHlaeu82tdCWQmMYRwkySmVqgObZ4?=
 =?us-ascii?Q?CKpouTQ5jk7eoJxe9xrG/gcwlbLJYMqDrJPgG0mRvOtgj4pjCiVhTWixpM3W?=
 =?us-ascii?Q?XkUnJInEWf1E3QnuFz92YaFwuX2YnKqTt6ZfzDIHCvdiKqAU3q4LpvCU1czr?=
 =?us-ascii?Q?rvxmXcK7NOuXgmilE63MsD1kVFmrTobYDt9wSjN2ojCoptabTRQ393DIqoRo?=
 =?us-ascii?Q?jpEafjxA90I36aY5fcjn7sXYFa2CLf7zgA/Vq5//tRIqOujs5jiipPiNa6u+?=
 =?us-ascii?Q?I5UD5/Du6dfxDsfNYyZjjBy2x3PEi2JtPRf+prT7ZfaIISPhoucWApEVYZpR?=
 =?us-ascii?Q?X50P/+0djjQz9US8Fm3+mCwlmwsN8hYceXWQsge1ZPqkOC+B6S+2GoB6Z2MC?=
 =?us-ascii?Q?qN0bTx8mX9ASsbcgpjfoSGlzf45mX6vgu9HnnUYmiYtYQovHdYY2YMe2kBr5?=
 =?us-ascii?Q?hZanBN4VrLKdIc41dQLhsq+UaMkXYJdnWV0NzXHPF639XUKWV1ZZxfHtx4X5?=
 =?us-ascii?Q?lC6HUomHVIeiD4/6WjEJyTnve++y3+tl7Lg+/Wc+aytR5K3qlA5v+ShjrXNv?=
 =?us-ascii?Q?sfVizP1gXNK4eaMP3d1G7QajVlhnGitjxCR+mBFUvJgwqPdzAA9hQB9lAI51?=
 =?us-ascii?Q?hX7nyq9ZjDLsPCXxGoD2cDBrLm0Wo8am/kZV2PXUUSNxfbu9xLZg/2ZbFbpb?=
 =?us-ascii?Q?FYHXG6x1owB+jnj7ZaKbmTHfj3Zeqf5ieBGggx/z9xt7ipLlCXoYyWMprk84?=
 =?us-ascii?Q?466474/f35Eey3FElDJ7TFNtAkwjX94Ucc+n2wy1QbBT5Kw2pQ6XQJbpl9Hp?=
 =?us-ascii?Q?zHgyEcN4IqqKmlT5lff0Zq3TPKGi8wXCBgswxla5UMLwAlSEgr/4GDxeC6Rn?=
 =?us-ascii?Q?RQedO3Nt7xVp8hY5sW5tfCLunn4Alv6PS8el/b5Xg4/oeWuQHklAnC7S/9gj?=
 =?us-ascii?Q?1O+X61ik555dQF4KOMympVcneFsa/fg9BmQoNfAQliCIHEoZHmgglY6x3kzX?=
 =?us-ascii?Q?tAgYSgZv6bCmwZYir4QI4/1OnTxE1e4qQos0XvckkbQb5PgTLQrqproMIBR7?=
 =?us-ascii?Q?Fo3goPoK5t47AIoCYp9uVb4IS2DhzDEDiJChFQ4mq/W01AxL1MUd4yl3JV0l?=
 =?us-ascii?Q?ROcXRt2LElyvvxrFO0ZzjehAfWBXIqgk/KsK+KgtwakYr4gofQU90e151AHG?=
 =?us-ascii?Q?B1itOg0Z5kSs5wRhYiSzm1G/kqGg03saSKJjoJecjM7bcNaUJq2mcdMT4EW1?=
 =?us-ascii?Q?FkOUu9sGjgPzivR+IrAtJlS8j8lwl0ougNObKqu4cit1N7BF+Xe/N2Fw66Rr?=
 =?us-ascii?Q?Kl3C6xj8RW7yYSXE+ZkfMUI5LpdrHY9rku88nl2hAXPZb4rVfbJbBcy+grEu?=
 =?us-ascii?Q?Pmc8FJ6KfzW8H4H3e8NwE+4dbwhIBLwIsN0nGkN/VuFtseJU4cqgbUwKTY18?=
 =?us-ascii?Q?vtDP8GYhVtYJ+83XiQDRkWsnn1ybSj5m+mWjplh/o/Ue?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xl9ErCfgm2cUM8HLEWURaiHfBQ9DryQjkEMGZaKY7dVwOsGft3Rii306tZi1?=
 =?us-ascii?Q?Tuy+NBEG5HVBHcb1xLltxQ23o9EW9lcq14jJlYDYl8Yf0lXA0f1StD502DlH?=
 =?us-ascii?Q?9wn5ZNkPpxjdUK7vW5RBrWkDiunRjxlg5hxp/bGVJ1Ghni2RGeKi4b3N8REB?=
 =?us-ascii?Q?D5237XQ4dVkL/cbrAySzCjhL5wlAh1vwe2zF9LFj2NwhDdLbdR06tF5hJQ7X?=
 =?us-ascii?Q?bs5zLIgsElflMw3LI1/9Lp5qIJW7IOxfOgQachabP+5bqesmivzGNGOK7giZ?=
 =?us-ascii?Q?9wfwvpA81xePXnJcFpIjQTcXV+MNRRGvYFgvfGYnA5HhUyNhNKa0p1SbcMpq?=
 =?us-ascii?Q?+OlTWGtqeLWHS6X8T3NKT/k9dZ45myy/fx2L6Va8hRrobayljB+1hawHR9nj?=
 =?us-ascii?Q?xZrqrL12qPAyzr9mLey6bFSUwHYORxpxa/XQduox4Uh+N0BKDOCvoqM71QlM?=
 =?us-ascii?Q?z6oifZc6r9OeGnkSd3W5j/2M2bMl2SMa/cW7Z3eceVyut6gGHOB1hgAA6hY0?=
 =?us-ascii?Q?yFKHXKFlwNnlau9gNlffZG3hzlvXPGYSh9BkaxKErQIP6H/YqYtx9MgiIEld?=
 =?us-ascii?Q?16en/4vjs4V0Kdg9Lp6pxS/f2GYvcZhxrws55SYuZGTcPwVtgUAwu4M3MVDD?=
 =?us-ascii?Q?StQA/zxsNyeZiTb7UWnGLi/Ac6VGtn7xA5eG80K5mlewpKmEnWelkNfi++K2?=
 =?us-ascii?Q?izIMsUzGQYA4FQ0ByfIiA0nuQ5NsJwpPGQRMNxuT4KIWrTlcVdbZqtWhe1Tk?=
 =?us-ascii?Q?q/f4ZWkmg8eKJNMxVPDEix/SGm2ONy1dveOa4HXc71rULFqU4ZbhHxDZRwvs?=
 =?us-ascii?Q?/uJhnWrTLyUqDfyZT9e2FchqVNKLtTsxrm6oDCDJnv0xi4IB9NigvdfMjkoK?=
 =?us-ascii?Q?oi1Z6/ix4FrP9Cs2zbgC3y5Z1Iy+mc0dEOxjqWW1X3DO3nlTH5xOF40gNyJ9?=
 =?us-ascii?Q?WiWlWp5BSpYCutpJ0IpwiHnWjcOjWcYaMW+intoZslni2ugrdTwMb/ztPDlx?=
 =?us-ascii?Q?b5H/dBs3w7lQY4OQF7doR7esiXTOBAUtDUFv+usaRVVBYqHRQzjSVj6ee5GV?=
 =?us-ascii?Q?LDXCqEK9yC0Yw8HOOK9tECGILO6giox7qaK/JswtWGQWwtxWMJAQwJGxROo9?=
 =?us-ascii?Q?8+yYloklrGpN0c8xwddxeHRztwZeIhq82ivNG0giS1QLCcR4kNvsGx2eWCje?=
 =?us-ascii?Q?ssKwdQ6OYo2RudESAHmg/9wprOfEkXs0sGdLO2tjpArePpMQkcm4XVlvwf4x?=
 =?us-ascii?Q?iDOKOlZPZAfCW8bxXGoLaHC/QaSUxKspWEhmuA3Eg2JokAHP80GqMd9DQYtb?=
 =?us-ascii?Q?PG5y4DCeo5iLMRGdcGSGcd9mSt2r4vIvMBwCRI4mchANsP861cRraDBwRPga?=
 =?us-ascii?Q?E+f/jYAYBgtSM6qmQBI2UI7CB3FWrMZvVaCpzNiLP9PAHEkOpdQSVsdcTL7b?=
 =?us-ascii?Q?dWCVE11MjGQBEf5osHrbI6QsE2fInM/ZzTvBafkoeBqY/ZsDZkPedGv1YUME?=
 =?us-ascii?Q?oWlUGlIUKBr3VhYTVstOUrrqAGLELen6WWpjzobA3Yin41ywzRRfIR1PNnoW?=
 =?us-ascii?Q?Nn/3tpBPlAklRvIolwUb2bvVbo7rOkcB+cENp9FEFb3J9uSQRKseN83hXEuU?=
 =?us-ascii?Q?MFGDmili1/suZ/GeCuhBAsnXoc0cj25aTZ6+S1bwSrxXAR2KRIHrK3Ww3htk?=
 =?us-ascii?Q?WF8AQTv7hmzDk+aEXNLbhZsi94p0BDs8miX1L8+/lsNnBOR+?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB740520FCABFFFCD88073D7D4DC91ADS0PR11MB7405namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e007d4-5d52-4a69-6829-08de5e32e6b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 06:03:04.5166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2PktcNjPCEBPDi6g47zZdCjxb9YQ+d71KkAxwH1XM12cJQaAVmEyXBuNuuDeJ6Zs+NMRTY2dqOL1eUZEEJkzmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230078

--_000_DS0PR11MB740520FCABFFFCD88073D7D4DC91ADS0PR11MB7405namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Gentle reminder.
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Het Patel via lists.openembedded.org <hetpat=3D=
cisco.com@lists.openembedded.org>
Sent: Thursday, January 22, 2026 8:29 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
Subject: [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CVSS scor=
e from all sources

From: Het Patel <hetpat@cisco.com>

The CVE check system was incorrectly reporting lower CVSS scores when
multiple scoring sources were available in the NVD database. This
occurred because the code only extracted the first element from the
metrics arrays, which could be a "Secondary" source with a lower score
rather than the "Primary" source or the highest available vendor score.

According to the CVSS v4.0 User Guide, "In situations where multiple
CVSS-B scores are applicable but only one is provided, the highest
CVSS-B score must be utilized." This follows the "reasonable worst-case"
principle established by the CVSS SIG.

This fix iterates through all available sources (v2, v3.0, v3.1, and
v4.0) and selects the maximum CVSS score to ensure the highest severity
is reported.

Fixes [YOCTO #15931]

References:
- https://www.first.org/cvss/v4.0/user-guide
- https://www.first.org/cvss/v3.1/user-guide
- https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-06202006.pdf

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../meta/cve-update-nvd2-native.bb            | 55 +++++++++++++------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipe=
s-core/meta/cve-update-nvd2-native.bb
index 8c8148dd92..41c34ba0d0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -350,32 +350,55 @@ def update_db(conn, elt):
         if desc['lang'] =3D=3D 'en':
             cveDesc =3D desc['value']
     date =3D elt['cve']['lastModified']
+
+    # Extract maximum CVSS scores from all sources (Primary and Secondary)
+    cvssv2 =3D 0.0
     try:
-        accessVector =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssDat=
a']['accessVector']
-        vectorString =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssDat=
a']['vectorString']
-        cvssv2 =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['b=
aseScore']
+        # Iterate through all cvssMetricV2 entries and find the maximum sc=
ore
+        for metric in elt['cve']['metrics']['cvssMetricV2']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv2:
+                cvssv2 =3D score
+                accessVector =3D metric['cvssData']['accessVector']
+                vectorString =3D metric['cvssData']['vectorString']
     except KeyError:
-        cvssv2 =3D 0.0
-    cvssv3 =3D None
+        pass
+
+    cvssv3 =3D 0.0
     try:
-        accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V30'][0]['cvssData']['attackVector']
-        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V30'][0]['cvssData']['vectorString']
-        cvssv3 =3D elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['=
baseScore']
+        # Iterate through all cvssMetricV30 entries and find the maximum s=
core
+        for metric in elt['cve']['metrics']['cvssMetricV30']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 =3D score
+                accessVector =3D accessVector or metric['cvssData']['attac=
kVector']
+                vectorString =3D vectorString or metric['cvssData']['vecto=
rString']
     except KeyError:
         pass
+
     try:
-        accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V31'][0]['cvssData']['attackVector']
-        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V31'][0]['cvssData']['vectorString']
-        cvssv3 =3D cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cv=
ssData']['baseScore']
+        # Iterate through all cvssMetricV31 entries and find the maximum s=
core
+        for metric in elt['cve']['metrics']['cvssMetricV31']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 =3D score
+                accessVector =3D accessVector or metric['cvssData']['attac=
kVector']
+                vectorString =3D vectorString or metric['cvssData']['vecto=
rString']
     except KeyError:
         pass
-    cvssv3 =3D cvssv3 or 0.0
+
+    cvssv4 =3D 0.0
     try:
-        accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V40'][0]['cvssData']['attackVector']
-        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V40'][0]['cvssData']['vectorString']
-        cvssv4 =3D elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['=
baseScore']
+        # Iterate through all cvssMetricV40 entries and find the maximum s=
core
+        for metric in elt['cve']['metrics']['cvssMetricV40']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv4:
+                cvssv4 =3D score
+                accessVector =3D accessVector or metric['cvssData']['attac=
kVector']
+                vectorString =3D vectorString or metric['cvssData']['vecto=
rString']
     except KeyError:
-        cvssv4 =3D 0.0
+        pass
+
     accessVector =3D accessVector or "UNKNOWN"
     vectorString =3D vectorString or "UNKNOWN"


--_000_DS0PR11MB740520FCABFFFCD88073D7D4DC91ADS0PR11MB7405namp_
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
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Gentle reminder.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Het Patel via lists.openembedded.org &lt;hetpat=3Dcisco.com@lists.op=
enembedded.org&gt;<br>
<b>Sent:</b> Thursday, January 22, 2026 8:29 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;xe-linux-external@cisco.com&g=
t;<br>
<b>Subject:</b> [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CV=
SS score from all sources</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Het Patel &lt;hetpat@cisco.com&gt;<br>
<br>
The CVE check system was incorrectly reporting lower CVSS scores when<br>
multiple scoring sources were available in the NVD database. This<br>
occurred because the code only extracted the first element from the<br>
metrics arrays, which could be a &quot;Secondary&quot; source with a lower =
score<br>
rather than the &quot;Primary&quot; source or the highest available vendor =
score.<br>
<br>
According to the CVSS v4.0 User Guide, &quot;In situations where multiple<b=
r>
CVSS-B scores are applicable but only one is provided, the highest<br>
CVSS-B score must be utilized.&quot; This follows the &quot;reasonable wors=
t-case&quot;<br>
principle established by the CVSS SIG.<br>
<br>
This fix iterates through all available sources (v2, v3.0, v3.1, and<br>
v4.0) and selects the maximum CVSS score to ensure the highest severity<br>
is reported.<br>
<br>
Fixes [YOCTO #15931]<br>
<br>
References:<br>
- <a href=3D"https://www.first.org/cvss/v4.0/user-guide">https://www.first.=
org/cvss/v4.0/user-guide</a><br>
- <a href=3D"https://www.first.org/cvss/v3.1/user-guide">https://www.first.=
org/cvss/v3.1/user-guide</a><br>
- <a href=3D"https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-062=
02006.pdf">
https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-06202006.pdf</a>=
<br>
<br>
Signed-off-by: Het Patel &lt;hetpat@cisco.com&gt;<br>
---<br>
&nbsp;.../meta/cve-update-nvd2-native.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 55 +++++++++++++------<br>
&nbsp;1 file changed, 39 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipe=
s-core/meta/cve-update-nvd2-native.bb<br>
index 8c8148dd92..41c34ba0d0 100644<br>
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb<br>
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb<br>
@@ -350,32 +350,55 @@ def update_db(conn, elt):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if desc['lang'] =3D=3D 'en=
':<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
eDesc =3D desc['value']<br>
&nbsp;&nbsp;&nbsp;&nbsp; date =3D elt['cve']['lastModified']<br>
+<br>
+&nbsp;&nbsp;&nbsp; # Extract maximum CVSS scores from all sources (Primary=
 and Secondary)<br>
+&nbsp;&nbsp;&nbsp; cvssv2 =3D 0.0<br>
&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accessVector =3D elt['cve']['me=
trics']['cvssMetricV2'][0]['cvssData']['accessVector']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vectorString =3D elt['cve']['me=
trics']['cvssMetricV2'][0]['cvssData']['vectorString']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cvssv2 =3D elt['cve']['metrics'=
]['cvssMetricV2'][0]['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Iterate through all cvssMetri=
cV2 entries and find the maximum score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for metric in elt['cve']['metri=
cs']['cvssMetricV2']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; score =
=3D metric['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if scor=
e &gt; cvssv2:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cvssv2 =3D score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; accessVector =3D metric['cvssData']['accessVector']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; vectorString =3D metric['cvssData']['vectorString']<br>
&nbsp;&nbsp;&nbsp;&nbsp; except KeyError:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cvssv2 =3D 0.0<br>
-&nbsp;&nbsp;&nbsp; cvssv3 =3D None<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br>
+<br>
+&nbsp;&nbsp;&nbsp; cvssv3 =3D 0.0<br>
&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accessVector =3D accessVector o=
r elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vectorString =3D vectorString o=
r elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cvssv3 =3D elt['cve']['metrics'=
]['cvssMetricV30'][0]['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Iterate through all cvssMetri=
cV30 entries and find the maximum score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for metric in elt['cve']['metri=
cs']['cvssMetricV30']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; score =
=3D metric['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if scor=
e &gt; cvssv3:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cvssv3 =3D score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; accessVector =3D accessVector or metric['cvssData']['attac=
kVector']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; vectorString =3D vectorString or metric['cvssData']['vecto=
rString']<br>
&nbsp;&nbsp;&nbsp;&nbsp; except KeyError:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accessVector =3D accessVector o=
r elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vectorString =3D vectorString o=
r elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cvssv3 =3D cvssv3 or elt['cve']=
['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Iterate through all cvssMetri=
cV31 entries and find the maximum score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for metric in elt['cve']['metri=
cs']['cvssMetricV31']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; score =
=3D metric['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if scor=
e &gt; cvssv3:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cvssv3 =3D score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; accessVector =3D accessVector or metric['cvssData']['attac=
kVector']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; vectorString =3D vectorString or metric['cvssData']['vecto=
rString']<br>
&nbsp;&nbsp;&nbsp;&nbsp; except KeyError:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br>
-&nbsp;&nbsp;&nbsp; cvssv3 =3D cvssv3 or 0.0<br>
+<br>
+&nbsp;&nbsp;&nbsp; cvssv4 =3D 0.0<br>
&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accessVector =3D accessVector o=
r elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vectorString =3D vectorString o=
r elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cvssv4 =3D elt['cve']['metrics'=
]['cvssMetricV40'][0]['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Iterate through all cvssMetri=
cV40 entries and find the maximum score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for metric in elt['cve']['metri=
cs']['cvssMetricV40']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; score =
=3D metric['cvssData']['baseScore']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if scor=
e &gt; cvssv4:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cvssv4 =3D score<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; accessVector =3D accessVector or metric['cvssData']['attac=
kVector']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; vectorString =3D vectorString or metric['cvssData']['vecto=
rString']<br>
&nbsp;&nbsp;&nbsp;&nbsp; except KeyError:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cvssv4 =3D 0.0<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; accessVector =3D accessVector or &quot;UNKNOWN&quo=
t;<br>
&nbsp;&nbsp;&nbsp;&nbsp; vectorString =3D vectorString or &quot;UNKNOWN&quo=
t;<br>
&nbsp;<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB740520FCABFFFCD88073D7D4DC91ADS0PR11MB7405namp_--

