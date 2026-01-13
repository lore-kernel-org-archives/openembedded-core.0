Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44F6D29DD1
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:02:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53397.1768284170008330742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BQejSMyy;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768284171; x=1799820171;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Bi29Q3meqUdnmTAUm+TtviQT/tf+bYmKXOhBDulPY4k=;
  b=BQejSMyyRYJo41Ny3aE9Lk44hGHxxLEtCSE/cdibUkqdzanfnebcG6I/
   1cJwbNXFPw1huJDPkvQkPJBE7SfZkW/s8+kuvSYo/0PsBO0I98tAq57Qh
   O/qNsDKGzQIWaoXJEbTi8xJLqh54QBQRC7xgyJcBmeoKVQmdLjDuf4zHL
   B9WGNoX99oAeF+7UL7dHs7k4as0Cbg0FEJDt0m09SPOiEp+OMczEsY+lt
   ss7HSaUEvRFrDo04rBdeKLax29ri6IcQuHNl2XMhkWTcDBb/Nq21QFVoK
   Y95nGfNfkMwlDpq0oixSMi16VLTNHRJKLObxoxP4ilq+99zarlY2bOX5B
   Q==;
X-CSE-ConnectionGUID: ATL/1dReQGGbd0P8fSWcrQ==
X-CSE-MsgGUID: mE6Con3NR6uk87zOgMKBPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80672391"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80672391"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 22:02:50 -0800
X-CSE-ConnectionGUID: 1QFKYCe8Soy2XjOeu/2poQ==
X-CSE-MsgGUID: vEEzVfSJQUq6SpbW4/TKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227514856"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 22:02:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 22:02:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 22:02:48 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 22:02:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghMX2vbCV2AL20UzAAtpmq7w7OwQZJR+0JrfngNZKQLEhWO+IWxkeCt3gyqOEDfI2H/WSMg1BdHr5hLlK61tSuux8qnkwXravc2ZePfvnB8ZMITfagy+bUK1nbFRZzYxorzeFbvyzH7c587rwYLx1bJk1eZTOanBH2AYoTvG14+rpYTfjkzu8fJw1l2bXkmAuT3r8i52lbuEaR7BpQLWjMiQrrUocRrwZutaDyaP2NIPlXZ3sX756hY2mJ16hSO1tBTn3sOQzu7k20bqPdsWM8kZhTX3oNy/J78lIroE6NwmMGxP90xlnbV2AFySNhBQFvj16zvyr5DRXmrRYs4F8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JIGIIw+VHJUYOVcmJiXXqxQVgi33ebeV2j8+g8R1EU=;
 b=vc5DxBzpBneZmbOXvzkqNn6iX8bQrJdp+fjWNQrqe8iucPINhxcXaKhe7FmbuOEG8u7cEIZpfKcQylFORc2wVTC9iAD7HahiLXjaCy02H3NN+/Sc40JsQ7nwtfq2DohtRMlqxuDMaOnlJ6+kVEgNkAYfzBwH9l7qD53KIM8nvT56EKLla3gmRMjE9EXrSBm31jRbSOcMloxuUjWGXMeLw4Nf172iT6QUYM1L+hzfAPJQY/jOWjA4PgDAE5zMBa7EASbUm/MpMMjuaIhzaitFg/zsMj1tEQMumDaQncILf1h6EPO8bJ2wTuP6nranzF9hbqmQUepKGNtsv/XalBPgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 06:02:41 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 06:02:41 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.1.rc2)
Thread-Index: AQHchBhDX8PZ2I/g/kG4erUw19Nit7VPm3hg
Date: Tue, 13 Jan 2026 06:02:41 +0000
Message-ID: <SN7PR11MB7018A62C540BE199DB680050F48EA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019bb476ef27-8b7fdc51-0e56-4f57-96dd-07d91ed02b9a-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019bb476ef27-8b7fdc51-0e56-4f57-96dd-07d91ed02b9a-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SJ0PR11MB5896:EE_
x-ms-office365-filtering-correlation-id: 93d09581-a8f7-412f-054e-08de52695cdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|38070700021|7142099003|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?AvXalqQOT+4k600IVXlUgquSkGvVfEcysWeeAGQfkhKTmDDlFh7fRjUxk7OI?=
 =?us-ascii?Q?wb3G0Y+1WBE9nZTmOYfOO/RKw3UhkU0mXcu0QPu4aztVc/UENlEjnNlH7nv9?=
 =?us-ascii?Q?2hjdAHuvv8UPmMZGlmP+BUA3OAyQ/Mze/eigQFMs7sgv2nt8b8DENGWsxhcG?=
 =?us-ascii?Q?u5cM5msUtXAb2K06dI+betA2xu5/C4Rtvn4zuVwiQvyoSLP3efQH1B+PL1rN?=
 =?us-ascii?Q?CsDin4B91O4pMcQcb8JFbb8TJiDODNDZaX8gr1bqcRl2KN1dYbSswEbVQvsm?=
 =?us-ascii?Q?raiqFBXAayQCLis9ljqT2TmvtrRALYlx+m/jQoenspPOkLaQswQjelKyMk2M?=
 =?us-ascii?Q?qxk1muf3QLLUdnJGm9KJdMV9FTbsKHWA2CSQ1JuLWUjXIn+BTypUaM9Vx2xo?=
 =?us-ascii?Q?QUBIjEZMXBHez+WN3W7BKoGira7Bc8oi3q9VmIbloTxqQ6EF7Pd1LRZmMzfn?=
 =?us-ascii?Q?Bta8rl2rV/2H//G8eLcqA4RqJVCrjtMwAltzCSI8a18WXdlxmqBuu+xHyOCf?=
 =?us-ascii?Q?r6Sb2ykLwDfbFHDaA9d2oAEgMsYdj9d4LL9QpCJuiOkw6+1YNuYk0X5oUbyu?=
 =?us-ascii?Q?1IaBGvVMd267C70JAowNm7CbQn6Qt90uEdS+UVYb2hFlpbV+Y8HzWb78Rhyq?=
 =?us-ascii?Q?crWPJfAud/gAKf1tn6pmmiSfn6eU/vCB1MStRPLTpxTWUurkN6DVqOe/zBYq?=
 =?us-ascii?Q?EzENehFhTl2AJPkSyOvQ+733YZH4CHpKKX2U4mxtrT+jL4N3PIA4hGCcksvJ?=
 =?us-ascii?Q?lgEQIjiRjmWp+itt6/OSbgqgvvtQeaB0C/UFCfD02ispaPWIsqU0mOuhOD8z?=
 =?us-ascii?Q?We0zCuLL/qmxvpm53DAipEarOBowGhPRXEf42A0VMmjigPuyBYEXuzWA4AYd?=
 =?us-ascii?Q?NFhnpgrb2F3zcQLS/OCiLuX2ZHYxirBPISKuyV3DVvjGH4/VS5LLkcsv4jza?=
 =?us-ascii?Q?3zivk/ik4YvKjQjyJaN0sJqmuLlamSkrMMtUZXibALNjx2sgjxen0eryexwS?=
 =?us-ascii?Q?6paAuZ1jkE/rUbDzBzh/vJycQ0zhWWdhu3+WrDQSv+TGafB7uDZUcB+zTJgH?=
 =?us-ascii?Q?5gntE2KpC2Wevi12zTob1z8YfQrQvI+d+mTxJAJv4LXzK7R8/r5g8oOCCHSh?=
 =?us-ascii?Q?/R8lgMOoLmfG34INbfJrVt81PTjCNPL7zTdz1x8qBrdZAf39I0WJJo5r7CEU?=
 =?us-ascii?Q?+z3x0Q3ekNkDbKE+hwvzvzDCmn7e30+OwrQigYEsLuRXe5TCj6BDqZhOISnA?=
 =?us-ascii?Q?qbBPebl5tzJH4fsQK3BEp1T9PFYLloNdcT9K65EZYT1npOu5sOlVI6WFGPvP?=
 =?us-ascii?Q?rJhU+7SqslLr7qyr/kvsldxJHvwk/nxJfB3VjtEnLyJOrn9Vf/4j1U4ohIl3?=
 =?us-ascii?Q?6jNO+omvmfwHwG7kkBi2dd0Nh4q/WcMbseXQJc9oObl76kxMoHW5o6cZMX0x?=
 =?us-ascii?Q?Xm4EOAMiv/C6YEEK1HZu/k7Q1PmEdwuXzgs/i4JYoIWkCzVgtVj09A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(38070700021)(7142099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5VpizpTQVHjPaZnXyJ0MGFumQglt/6ZGCWvHIwAkIKsHhvjK7T6Oj0gU2WVa?=
 =?us-ascii?Q?EfeYcClMpOqa8I2u3ThRnpXhxz58dwW7iJlJ6qIJ+Dsm5S8Bn8o/d0bnywVU?=
 =?us-ascii?Q?7NfvFgIoQjPp7VJ/LM5vCn++6IqKBreU0dc09SLUiDFpwHhIJj66PNMZW3x9?=
 =?us-ascii?Q?tYMPHsnI9nUxW2hsiAzAjxy1xleGrHoMCa4ZADeTR2OX+0cVw5w8dCEMdif1?=
 =?us-ascii?Q?68LSeR7KVKShKXRT+3Ul9+QcHx1/Pt0MR2o63tlEdwji1Sf5/YnXILph4a1k?=
 =?us-ascii?Q?J8TsZxd+BcPdS4+W4f4+gcSTMSNobiRT7XgLxtt20srwXMPp/JDjS5+PD6Ge?=
 =?us-ascii?Q?aAy2QbvkE7zoiQO4GpJlOnDm0f5RK+5i3ar9a/Q5GPo+V9s05wLKLLM8e/0d?=
 =?us-ascii?Q?QuWqfvfY0sWkuRb/8FKCa03bfUiKI4xVI7ltjUEBhdlTp9GG0HDvq1+SlmoP?=
 =?us-ascii?Q?YylOMO9IZY9xXC69sUeJUq9mCZPw3+DhA0y1BZKCtsjWMsA/MtxYRrCjw4+Y?=
 =?us-ascii?Q?oih8mlsjOkD+2tYX26PRjsOPIj5xTbSn7efr2esoP3WPStoooDG/niyF87Vn?=
 =?us-ascii?Q?Tr5FPWebXsXNMUxoRbnMIbzjfqb7t449CZk5tmfcFeI3cAND0uAUYxs1TNCY?=
 =?us-ascii?Q?qI8vsoy5AGUkTqgmOf3kABs/Q5fPgmP/Qf+C5kO5y5+Qr5n1O/zXK9ssNBBF?=
 =?us-ascii?Q?tLKPopppZEpKFZSiispPfunVTXhZ7k/i+ft//YG44XSG9sQOtb4OQeTxcd07?=
 =?us-ascii?Q?V4Xg7FsIENiQZcuH3JSZYxkIp7vK8UXYTB608vKGLbWN3P8uhOtnOlgJhjEE?=
 =?us-ascii?Q?uWwzsmfBhZ0GPaaq3CcDAIfw+BbMwFDsT7WAC15e5zrcrG1P5+tLtZIWkaMG?=
 =?us-ascii?Q?8F0lFMZ298T/oe9Tm5Apn6eoM1hhq9ebSrWnOipgmNGdEbsjxbrJA5Hn8Yys?=
 =?us-ascii?Q?n2DrEE6diGCLB/C83VLAwoCIfR7BNR0nt0kvtdYavx7D1LIZJYlVOrYv6kIx?=
 =?us-ascii?Q?rYVNROXQOEOMPPgHf7XuEiTYz3wEKgydRF571GVzJ3DSjB11MA638QX3EA7g?=
 =?us-ascii?Q?AXPoMpgXHuNScFOT+iU0JpBjtni+NiftkUFfGEuJqADIFLxeSU7265CTNbdK?=
 =?us-ascii?Q?CkayKmMf860g7ieKHtvu22a9FrHM7hhHZt5sgKt9v3JUULfzm4uEJrNoGzgT?=
 =?us-ascii?Q?8MMrPldCwLo8R9JlrRxGNwdrQXKOl1x7pORaYSHaJbdotIYLGsgEF7br1xqL?=
 =?us-ascii?Q?Ijy8xiz5kDWzDfa5KWynuGaYY8Y/itOOMsP3J6HJSIOiMkeA4RZi2PPA3uaa?=
 =?us-ascii?Q?1HvtaM6KI8ROHZfZIhDf5YTLht/uxdXVPeUWaefT0p29GFmMGfD8SfFFdbRf?=
 =?us-ascii?Q?MMmECKX8TUi+xzjUD/ynCQ6oAoOUyw4JjOYxtyNc4UmRMDxsruZDlLxKVn+L?=
 =?us-ascii?Q?GdSFKl9SEbZidj4rMnJv2B0177jACG6GLuXKsskiDtIwuJfOAeRfYIh1MM/Z?=
 =?us-ascii?Q?vCcoml7Daj/zxzoQA0RKocqHbwsKBZUau2aufwhj8wR6RQHGzQx2VbGAdKir?=
 =?us-ascii?Q?Z9FTH28pQ1YzCWZbR5XFa/cszHuJS83UCPP2fvmI+ZLwTD7USdoSpIPDEJCB?=
 =?us-ascii?Q?ogw3ySuucFjGU3U4A+CawWgcyqvY1KgfG/i6qtXPYadihcwXvq8oJQjH3NZH?=
 =?us-ascii?Q?3XUkrrVV8LhD1qP/gOtglN0dXApDlTVa+reVhiyBePa0IWmDCHwmBO0aIQI0?=
 =?us-ascii?Q?jPOcICHkfQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d09581-a8f7-412f-054e-08de52695cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 06:02:41.5696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UExvGPAM9GBN7XBzfW2AhmLtUYM+wGUjOwQzZ7Uhk/J+h33fkYunWkFsi6lIHsV+13GQn156Llm9iL3wQ2oJ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 06:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229225

Hi all,

Intel and WR YP QA is planning for QA execution for YP build Yocto-5.3.1.rc=
2. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Alder Lake-S
Meteor Lake-P
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay




ETA for completion: 21/01/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 13 January 2026 04:38
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.1.rc2)


    A build flagged for QA (yocto-5.3.1.rc2) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.1.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3041

    Build hash information:=20

    bitbake: 663021740bc086bd959a8457ad9ddb6da52a8278
meta-agl: fcc4176504cd4b5b9d27d20797b11be5330e9f10
meta-arm: 955b1d8e6921d8e03388c5013dfaebbb0cfc5099
meta-aws: dde608c015c80442356bd180202f955cc9b61267
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: 9182026daca13f7efca0bb6ff1eacb039946c476
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: a4e768dcfae181dd99e39c4286fa0729ca7f4e47
meta-qcom: dc5f692bff1032c40a19f4ab4cd7eb63afcfaab1
meta-virtualization: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff
meta-yocto: 6973ca663aaa9c3ab517ee960ab7985a5bf54c07
oecore: dd10706cfafb5574b7cf316fca2300d166ef71b0
yocto-docs: 102a33294e63a5581c413555040f790161fc80ff


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#638): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/638
Mute This Topic: https://lists.yoctoproject.org/mt/117234373/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



