Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D72C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:45:17 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5167.1787139916795561138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WaEwDt1I;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16819; q=dns/txt;
  s=iport01; t=1787139916; x=1788349516;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=suc/6ZwNJ06sK/Uczx4E2kb2uEzqpCVqUAhC2gJfkxY=;
  b=WaEwDt1IgjlafFOV4gwzI+3it0O063JZK7Ic3gK/JraaT7UL9bfZGofQ
   61cTcT27Mmv1mfPnx0Dj6XgAuc1EOP2EDK2Qnc8g6++i2gj+T+RxO4xuJ
   mpi83QrhvngeUVLNp2xkp+NCcsUAXwI/hXhNDfR0VGadMz8HMyLcu7k9+
   teqq6cbLNe25GwjmU5e2Hry2mD8W+NmfM4NwX4fHhUZczKJbd6fnwlZRx
   TTwD7+sJEu9LbN0wsnbxEmBXGl9kDYpqIHvyWhFUA+xvutFAKP6L9SO/5
   ZM4EW/t6ReN2EJAyExLCInDNvvDnVO1tobZ9t3WCN7XCH/v2LdScOmOGF
   Q==;
X-CSE-ConnectionGUID: 0LlbrRetSnCgmB8LFQdR8w==
X-CSE-MsgGUID: Tkl7O+87RyWM+/3NoA1ujw==
X-IPAS-Result: =?us-ascii?q?A0DZBACVloVq/5D/Ja1aHgEBCxIMZYEgC4E9MVOBCAKBD?=
 =?us-ascii?q?xJJiCMDhSuIeQOeGxSBag8BAQENAQEuARUNBAEBhD9GAo1rAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwFKAS0QAgEIE?=
 =?us-ascii?q?QQBAQEuJwodCAIEAQ0FCAyCb4IdFkEDAQIOuU0Cihx4gTSBAYMoAT8CQ9wMF?=
 =?us-ascii?q?AGBOIU/gwMbAQEqSWyCXYEjGAGEfCcbG4FygVeBZ4ECPoEFgVwBAQOBKAELB?=
 =?us-ascii?q?wEjPINXgjAEgQ6BFHoSG4FdUAQSKYFUiHyFaFJyIgMmMywBVRMXCwcFgSMQM?=
 =?us-ascii?q?wMqLy0jSwUtHXAMJxIPHRcXHlgbBgUSICpBRCMDPjiBCEECgXU/Ixk2eoEJX?=
 =?us-ascii?q?oErKmEBAhAXRi4VggoCgnOBKF4CAUlFEQoLC209NwYOGQMEgTUFjV0HWyCBZ?=
 =?us-ascii?q?VsHARUnHTQBByMBT0k9BQRfCwKSc2mPFI5glRcKKIN2jCGNPogyF4QEgVeLP?=
 =?us-ascii?q?ZlUC5h9I41nlWCFLgIEAgQFAhABAQaBaDxpXgsHcBWDIglKGQ+SI4F/gxTHB?=
 =?us-ascii?q?nkCCTIBAQcCBw4DC4FohF6LIgImBAOBTwEB?=
IronPort-PHdr: A9a23:EfHZ4B0lW0QSbxU1smDPmlBlVkEcU/3cJAUZ7N8gk71RN/jl9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:huK2WqMqnKkOVObvrR3+lsFynXyQoLVcMsEvi/4bfWQNrUon0mAGy
 mtJDz+Caf3fYDGgKopybo61oUhXvpDcy9Q1S3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj661KCEssB4AEweBcDmRkp
 dg2ETw3Pg/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsiOa1bouOJoHiqcN9okWc+
 UWFrzvDEy4/d5vE7z2sq2+umbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:eaUnSa7gMGgzT9PCpQPXwciCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ8dcLC7VJVpQRvnhPhICPoqTMaftWjdySSVxe5ZnPHfKlHbaknDH6tmpN
 hdmstFeZPN5DpB/LvHCWCDer5KrqjkgcWVbKXlvgtQpGpRGthdBnJCe32m+zpNNXF77PQCZf
 2hz/sCjQCNPV4QacO2DGQEWe/sm/3n/aiNXTc2QzQcxE2rlz2H1J7WeiL04j4uFx9fy7Yr9m
 bI1zf++riitP+DzBrd3X/47phdmtfto+EzRfBkjPJ7FhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nL4ZAiO0FjQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6nAnoMp33M
 twriCkXttsfFb9dRbGlp/1viJR5wyJSL0Z4LcuZklkIM8jgXlq3NQiFQ1uYcw99WnBmfAa+a
 FVfbLhDbBtABOnRkGcmHVzy9qxWXl2NBKHTk8e/vGx6VFt7SpEJ49y/r1Cop/Gn6hNFqWt64
 n/Q9ZVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjjwQrPMkf0IDduRCdc15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfbWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104/2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6wvPEQYQKaRqXSx+MGLEGBxZln9GEkDPw5jjQo
X-Talos-CUID: =?us-ascii?q?9a23=3AvYBnWmoL8vOFSzJWsBhWLULmUZgBdnfH9nrMGEm?=
 =?us-ascii?q?TBmNDGJm7cFOqqLwxxg=3D=3D?=
X-Talos-MUID: 9a23:13l+1guO2TxxhwD3vM2nuDJma+Ars/uUGX8o0tJdnc6tbDFyJGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:45:15 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 80CA2180003D6
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 11:45:15 +0000 (GMT)
X-CSE-ConnectionGUID: NY98veauT6epbmPm6tnESw==
X-CSE-MsgGUID: skDDFWCYSBm3GV9jwYdyNw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208,217";a="92134771"
Received: from mail-centralusazon11011012.outbound.protection.outlook.com (HELO DM5PR21CU001.outbound.protection.outlook.com) ([52.101.62.12])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rmni0/uDpu9Xu5bJN4FjvgUo4IFTZOUaz3ZMFW0OWnc2BKDW6EdL/Erqg0q4+7spmvZF7y5NAnBaDNFK+/jyBgCmCUlWIeAJO9A5YMDAb96hWWo5Qi09N3PhEiDwS5ZKkBMVseu+KkcQgi95iMwBErfAPjfdRtCanLbygBzQPOvbvP4YFnRo9SJwTTNtce7PfPVatXOj8nkmO8w1Lxq1ml0IrRxaMzinPVHXrSf4uICZfiyKCfdQwqQhKeiDR3TfKIF7ZKdKlYuMUGp8DCpDtD5xgvCpaQXNc92uK4MB9QSDdo0EXYqSNQtCWAaa1wnBTkZ3NlINhf/HymEAIWtInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suc/6ZwNJ06sK/Uczx4E2kb2uEzqpCVqUAhC2gJfkxY=;
 b=M/5+AiwnhF3oMlFZxOS6S3GwRbk2W8g6KqrU48402e2J25dpu4Yl7ot9D5DyTbk+9viEHvtYWQ+cO34egElwhOexhK5q148t567eIiElOnK17p+lfSK4FMYOhRoNFFYFTk7BLB1sDaWJi7xH49uOMd5OQHWrqeTbjfJh6E9lw6LzVhRWKeONZZZsk3t5SosciHcp0YwO9dXuPv+61Z8I4zP0TIRUYvuQwLOR2tRQkJI0tgCSYBEbV+wte9DbHMpOauShy6JmVpI6bZ02thZylLOx1xQajwuFhnW2t0nbI9EK60tXHRcU9c5y+ZbValsj+0tpg1lMXzpmrfvnrkN+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SAWPR11MB9735.namprd11.prod.outlook.com (2603:10b6:806:4c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 19 Aug
 2026 11:45:13 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 11:45:13 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Fabien Thomas <fabien.thomas@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-58055
Thread-Topic: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-58055
Thread-Index: AQHdKnCFHNT/+BkjqkKz5e6aRcH617abfAKqgAnPJa0=
Date: Wed, 19 Aug 2026 11:45:12 +0000
Message-ID: 
 <DM4PR11MB61890AA22D68992DB6912558C4A52@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260805080334.2604235-1-deeratho@cisco.com>
 <DKN2SEC32827.35IBSQC8DBN5H@smile.fr>
 <DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2@DM4PR11MB6189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SAWPR11MB9735:EE_
x-ms-office365-filtering-correlation-id: 3e621cc0-924b-4a5a-3e63-08defde75481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|38070700021|13003099007|8096899003|6133799003|4143699003|10067099003|11063799006|5023799004|56012099006;
x-microsoft-antispam-message-info: 
 HYIMNkP0zmBAasy/CVsedVpTvGjvLqqY7jDC2CsphE+5DTyK3cqT7SckLqTtWsXGOdVa/FaLYdgZAM1QwwA5X3W9xk6FhDU6CQm8X75qJkwBbDmt5QrssVgTR/hXmQMzGNHJdcbwHPD98+vL4gAhyMF2oIztM1LMJdMwuC24mPMk58/fN1nl3gZCB0J9RE6JADavYk7lwPl2LeSlVeUqXl1M3vjhgZLM884k/9BM2/pD12U6x9Gzv0OLIshSJiZN2W0buIoRYcDH5WHSL4lnM6h+3fhrfRJuo3S+Btt87Om9Ji6xDNIm/DafZCa9R4AnCV4Tk4PwnLZEQGWKa9fU38yllrLZ4cCE593/iJXJQdfuju7Rgc5Pi9dVGXyMI3Vw68HY9d/JRD6sBo318ArFCYXXjHkO09z0BlWJ1eEE8z01VC6aFAeEN+EonwcWUWjYgBZKiqcqNK1KbexurzxVWp6qX9jlNEviY2bkEcqRVga5LTCFgqsKnPbJK1v+/oEc5npfTG/Sx6EzxmCFlxMQIo3x9/0VEf5sRTKANEerX41t0iU1UySKo4bnts3K4LbMByMon70N1uZqSTH4NYFPbXvfwv0HxZKR7WOiXC0sbaAkBzmIWpL8P0EfbKgnMWsamlyntTweHrW7xGUyVXfscVVCyA3xaH47fHqIXHu1ZNViGfasN17PnkoZAuxQyYHKrPjRWTCgOpPWOV/MN7GT9L7RVxKUOcSbAHPrEZLdPiM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(13003099007)(8096899003)(6133799003)(4143699003)(10067099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?6zNI9Y/VzdtcQ4XPzNKsisb+9OsyPAr2H9CzpMElvWKaRh68Bz1AF7P9?=
 =?Windows-1252?Q?pmX4H9w4pxa7dQ9O+SMV0hUsTRDi8LQplgulhrAVjsheCpTViMnkCxZf?=
 =?Windows-1252?Q?kM0bO5LRQicboEqq+v8AmYW3cXrxNspHnpHTF7oyTU1DDaiyyg0PeJxb?=
 =?Windows-1252?Q?6ahj6s2hTB9bc+aHu28YeaNtessbRi6dkwRoG2NN6npremX5wYSq+E3+?=
 =?Windows-1252?Q?yPXXrA5HsXwDYgKfwUt9IfD1BwfaRFq8eRauWLJG6py6+3IpiOwAzzr/?=
 =?Windows-1252?Q?ep4oFRleK2JUZPJiELkep5jaZO7/hZZJPI2aigaqQZN8Ufpwr0LFUdK+?=
 =?Windows-1252?Q?ZWhmllpLwfLsVmGljpYPsD00ZwqY269mW7UVkjfg22kNDevR/Ofvq8Fj?=
 =?Windows-1252?Q?5ekv4t+/G+NIVxFE8BujDCQaDlCmCueTg9lQSW6bKuEzl0JoAyrSDK1/?=
 =?Windows-1252?Q?6H9WS4d+uILdWfFjAEQrud7M8ACYkFkwMy5EKvnUKLxL6NrjSZ6EC1vo?=
 =?Windows-1252?Q?UrNL96pVt3sdxMWqqBo/ze/dFwW4Q2ort6XneHDAZc2s+t0MVwhgPWGn?=
 =?Windows-1252?Q?vAzT1MA3RowW7GdlfbYS+WKpkiVZvQa395TV0Cup2d0PRiX2kkNjfDpK?=
 =?Windows-1252?Q?DSk5kYTWkenfP/xgqBpfXTKblV8fkyfpR3kKlWiLPCvu9qWm6pfVrHgY?=
 =?Windows-1252?Q?9cvL0049N+qtnuQ1i4ja+h4/C2+GFjughAbp63z6M5FNVHVFY/9j+EAR?=
 =?Windows-1252?Q?JadUIw04INGTCB9Enaud/XpDowTL9YWAMmqgr9cnxJfZyAuw5hj66oBC?=
 =?Windows-1252?Q?1E65krZR4/CkXiCbmwGMAcN4L9hx44QOY7jeaQ+4LoQERnMdOX+BfA9u?=
 =?Windows-1252?Q?pqLemH2yN40LCuuA+XLOWen37aUxJvKetKNrRTVYddWVwQ1LsZiCFmGA?=
 =?Windows-1252?Q?wMdl5NaRwZbWhyRlv9oDgxrMMEElkP5eE1S49kjmVkU8Pl12NLAymSrn?=
 =?Windows-1252?Q?d+GUQ08H+yEY5yxSwIXnJhdqRKDAWZN95Z2H26oI2B0J+gjFc3/zek1B?=
 =?Windows-1252?Q?Zb1JD0dRbuVpaHdh4dH6ogoRHYYJA8gBdt25rUdxJ8OKqziDWvoC7NkU?=
 =?Windows-1252?Q?HnDJpLHdvIxdosUjqkvKGaZvu2XPUI5wCmpX0e1bh+42hmGJGegQIZE+?=
 =?Windows-1252?Q?8vj0OQR4ppPj8vophcvFICICI37+U3kIjIeQo9UiJbhXX1UcQXq4BnDQ?=
 =?Windows-1252?Q?xB70u4pjnYcU1y48BTma27roWpoTEj7KPF/1sHinpUlqLUm9DR0zr3sa?=
 =?Windows-1252?Q?1YZsyDYbpBmn9gMjCVQzY1k3cvFj88IqiCsN0vFIhUOUlEzq6XCArxf8?=
 =?Windows-1252?Q?W+WxrUDJ2l6zGLF1zew6w6yyeshnYoYagGi8vQlfMgCQa8v3GrGb2NfI?=
 =?Windows-1252?Q?9zu0e0pXCw15tE8F5zufvUr6PxeyChs58aahNBkJLe7hJvwwBjUbHA+q?=
 =?Windows-1252?Q?04DT3X5+QxvlSX+l/4vFb5/VeqlFDHYxNYEoJoDVSKYmJSO3+mer5ETk?=
 =?Windows-1252?Q?qdiZkPg3xh2Yetu6uoF2VfwPwf7XMzYvFtnrZ3IAQjhNf+k2cnh6WQLE?=
 =?Windows-1252?Q?bloPBa0qC67qBWUgOI8ZAOj+Np0hXmiInRs2BRN0Zy6u5hGBpvx9EAvw?=
 =?Windows-1252?Q?aRknmxzZTqyxMVbuNM8mEYCJl9LXErS8BlCWdzYn5F/d6YGj2OR3fYkT?=
 =?Windows-1252?Q?m0XDfJGtdJHkR2bxlArxfCtXANMnWBqth9COjaQoAxCFJ5Paea/2trN+?=
 =?Windows-1252?Q?2OiRMG6m4w74Mrso8snveqwKmJg1+Ledk/JTQh5TwouCUHdL?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61890AA22D68992DB6912558C4A52DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ixdb0Fjfo5zTP0+XssJVIY2O3DGUBP9Q20nOYKeKdX/ozUGXLb2NdrTkek0Me/QPjbQor7vYA9emuvtnwpcBkzzP/Si11vp1uIZ/Zhyn7fxnGJ861ZToCaN0z55hV12SLk+XaW9QfdtNgf5qydS+4XobXjICsrl4LbHbFUJko+koMRj0SlTWy532CPGo69dKgOC6RDVHuUdLVOYrIxMvQMhYNo+owPWT6aWdj/XNEKJmaDm40O6sbAqoapR87XJmHdVR66mbK6halbNe/DOX0l7dyVxr2NzvtKX/sdXXfWQSc2Eky77yWCinlR2i3uCD55ShZD4Nz4Vz4762EP0tFw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e621cc0-924b-4a5a-3e63-08defde75481
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 11:45:12.9493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8Y8upkCJqCLk3RvdqaJeD/qe4fTvYNblOKszWrF5/OocWPVoat6QkWl2aXBvpV7rx7A1HKzQJcK3qbpbUulSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9735
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 11:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243727

--_000_DM4PR11MB61890AA22D68992DB6912558C4A52DM4PR11MB6189namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello Fabien Thomas,
I hope you are doing well.
Just a gentle follow-up on my previous email regarding CVE-2026-58055. When=
 you have a chance, could you please share your thoughts on the validation =
approach for a backport in this case?
I would appreciate any guidance you can provide.
Thank you for your time.
Best regards,
Deepak
________________________________
From: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
deeratho@cisco.com>
Sent: Thursday, August 13, 2026 11:34 AM
To: Fabien Thomas <fabien.thomas@smile.fr>; openembedded-core@lists.openemb=
edded.org <openembedded-core@lists.openembedded.org>
Cc: Viral Chavda (vchavda) <vchavda@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-580=
55

Hello Fabien,

Thank you for highlighting the risk of checking EXTRA_OECMAKE directly. I a=
gree that a user could modify the CMake options through a .bbappend while t=
he original -DENABLE_LIB_ONLY=3DON option remains present. In that case, th=
e conditional CVE_STATUS could produce a misleading result.

I tested the complete upstream fix against nghttp2 1.68.1 with patch fuzz d=
isabled:
https://github.com/nghttp2/nghttp2/commit/ab28105c4a0197da24f8bfc414bc11605=
5249e1e

Unfortunately, it is not a clean or straightforward backport. Thirteen hunk=
s fail across six nghttpx source files because the fix was developed after =
substantial nghttpx refactoring that was included in the 1.70.0 release.

The current OE-Core recipe intentionally builds only libnghttp2 using -DENA=
BLE_LIB_ONLY=3DON. Consequently, nghttpx and the affected shrpx sources are=
 not compiled by the default recipe. This behavior was introduced when the =
recipe was converted to a library-only recipe.

To validate a manual backport, I would need to use a temporary local .bbapp=
end that:

- adds the nghttpx build dependencies;
- disables ENABLE_LIB_ONLY;
- enables ENABLE_APP;
- builds nghttpx with the backported patch.

I also have a question regarding validation: since nghttpx is not enabled b=
y the recipe=92s default configuration, how would the community normally va=
lidate changes to this disabled component?

Thank you for your guidance.

Best regards,
Deepak
________________________________
From: Fabien Thomas <fabien.thomas@smile.fr>
Sent: Wednesday, August 12, 2026 9:07 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-580=
55

On Wed Aug 5, 2026 at 10:03 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
> Upgrade requests with a Content-Length header and body.
>
> The default recipe does not build nghttpx. Add a conditional
> CVE_STATUS entry so the CVE remains unpatched if app support is
> enabled, while default builds are marked not-applicable-config.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-58055
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.68.1.bb
> index 71d5eef8d6..29a7d26819 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> @@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] =3D "-DENABLE_DOC=3DON,-DENABLE=
_DOC=3DOFF"
>
>  EXTRA_OECMAKE =3D "-DENABLE_LIB_ONLY=3DON -DENABLE_PYTHON_BINDINGS=3DOFF=
"
>
> +CVE_STATUS[CVE-2026-58055] =3D "${@bb.utils.contains('EXTRA_OECMAKE', '-=
DENABLE_LIB_ONLY=3DON', 'not-applicable-config: nghttpx proxy is not built =
in the default nghttp2 configuration', 'unpatched', d)}"
> +
>  BBCLASSEXTEND =3D "native nativesdk"

Hello Deepak,

I'm filling in for Yoann while he's on leave.

We would prefer to avoid conditional CVE_STATUS entries whenever possible.
The risk is that users who enable this feature through other means think th=
ey
are protected but actually no.

Conditional CVE_STATUS should really be a last resort. Could you please che=
ck
if the actual fix for CVE-2026-58055 can be easily backported instead?

Best regards

--
Fabien Thomas
Smile ECS


--_000_DM4PR11MB61890AA22D68992DB6912558C4A52DM4PR11MB6189namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hello Fabien Thomas,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I hope you are doing well.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Just a gentle follow-up on my previous email regarding CVE-2026-58055. When=
 you have a chance, could you please share your thoughts on the validation =
approach for a backport in this case?</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I would appreciate any guidance you can provide.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thank you for your time.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Best regards,<br>
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at C=
isco) &lt;deeratho@cisco.com&gt;<br>
<b>Sent:</b> Thursday, August 13, 2026 11:34 AM<br>
<b>To:</b> Fabien Thomas &lt;fabien.thomas@smile.fr&gt;; openembedded-core@=
lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> Viral Chavda (vchavda) &lt;vchavda@cisco.com&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2=
026-58055</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Hello Fabien,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Thank you for highlighting the risk of checking EXTRA_OECMAKE directly. I a=
gree that a user could modify the CMake options through a .bbappend while t=
he original -DENABLE_LIB_ONLY=3DON option remains present. In that case, th=
e conditional CVE_STATUS could produce
 a misleading result.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
I tested the complete upstream fix against nghttp2 1.68.1 with patch fuzz d=
isabled:</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<a href=3D"https://github.com/nghttp2/nghttp2/commit/ab28105c4a0197da24f8bf=
c414bc116055249e1e" id=3D"OWAd258ea77-9b76-7f93-84d1-6c2980e29a29" class=3D=
"OWAAutoLink" data-auth=3D"NotApplicable">https://github.com/nghttp2/nghttp=
2/commit/ab28105c4a0197da24f8bfc414bc116055249e1e</a></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Unfortunately, it is not a clean or straightforward backport. Thirteen hunk=
s fail across six nghttpx source files because the fix was developed after =
substantial nghttpx refactoring that was included in the 1.70.0 release.</d=
iv>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
The current OE-Core recipe intentionally builds only libnghttp2 using -DENA=
BLE_LIB_ONLY=3DON. Consequently, nghttpx and the affected shrpx sources are=
 not compiled by the default recipe. This behavior was introduced when the =
recipe was converted to a library-only
 recipe.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
To validate a manual backport, I would need to use a temporary local .bbapp=
end that:</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
- adds the nghttpx build dependencies;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
- disables ENABLE_LIB_ONLY;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
- enables ENABLE_APP;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
- builds nghttpx with the backported patch.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
I also have a question regarding validation: since nghttpx is not enabled b=
y the recipe=92s default configuration, how would the community normally va=
lidate changes to this disabled component?&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Thank you for your guidance.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Best regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Deepak</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Fabien Thomas &lt;fabien.thomas@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, August 12, 2026 9:07 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2=
026-58055</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On Wed Aug 5, 2026 at 10:03=
 AM CEST, Deepak Rathore via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1<br>
&gt; Upgrade requests with a Content-Length header and body.<br>
&gt;<br>
&gt; The default recipe does not build nghttpx. Add a conditional<br>
&gt; CVE_STATUS entry so the CVE remains unpatched if app support is<br>
&gt; enabled, while default builds are marked not-applicable-config.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58055" id=3D"OWAf=
b01d0a6-fd9b-9627-6a66-5221b5f5d30e" class=3D"x_OWAAutoLink" data-auth=3D"N=
otApplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-58055</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++<br>
&gt;&nbsp; 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/rec=
ipes-support/nghttp2/nghttp2_1.68.1.bb<br>
&gt; index 71d5eef8d6..29a7d26819 100644<br>
&gt; --- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb<br>
&gt; +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb<br>
&gt; @@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] =3D &quot;-DENABLE_DOC=3DON,=
-DENABLE_DOC=3DOFF&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; EXTRA_OECMAKE =3D &quot;-DENABLE_LIB_ONLY=3DON -DENABLE_PYTHON_B=
INDINGS=3DOFF&quot;<br>
&gt;&nbsp;<br>
&gt; +CVE_STATUS[CVE-2026-58055] =3D &quot;${@bb.utils.contains('EXTRA_OECM=
AKE', '-DENABLE_LIB_ONLY=3DON', 'not-applicable-config: nghttpx proxy is no=
t built in the default nghttp2 configuration', 'unpatched', d)}&quot;<br>
&gt; +<br>
&gt;&nbsp; BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
Hello Deepak,<br>
<br>
I'm filling in for Yoann while he's on leave.<br>
<br>
We would prefer to avoid conditional CVE_STATUS entries whenever possible.<=
br>
The risk is that users who enable this feature through other means think th=
ey<br>
are protected but actually no.<br>
<br>
Conditional CVE_STATUS should really be a last resort. Could you please che=
ck<br>
if the actual fix for CVE-2026-58055 can be easily backported instead?<br>
<br>
Best regards<br>
<br>
--<br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB61890AA22D68992DB6912558C4A52DM4PR11MB6189namp_--

