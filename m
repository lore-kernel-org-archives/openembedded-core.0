Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9BEC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:50:41 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13166.1787565027920136626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g0Y+LerU;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=45683; q=dns/txt;
  s=iport01; t=1787565027; x=1788774627;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=qRTUiqgBgmW10UdvAqQ7lx4XseMFbpYVQTTeVRrjsbM=;
  b=g0Y+LerUmDtyFG4CIEX5ML4eES3lwIyzreeQdw+Eo8dH00Rm5rvLdwJn
   EX7v9FPqFlQejmrJjfHgG546NUuG/l9lK3TCQgRKkXkknFvulxOE6Te+H
   H5hldPSW+ImJ/bQhGPz5mbRAWsDYrTmFHEkQ9VeP/RiT8R9n36OUallNZ
   lo0FLX6kxy261vVJEGxGRL1WKmDhiV2ssLsDFJemh/gxkavkJ+KW731MC
   u5wUFw9CxXzrGlYRPmAfPfEOe3OYyV/XAFhMQ/FekEySlrlGveCSeZtD5
   TLzAfdpkygOQgbHGQFQXO+wOVUA3mSVvz5HvRx7RkamSkkJeqaQV+ttnX
   A==;
X-CSE-ConnectionGUID: PhjLXFBqSyiUFCTGbhoU2w==
X-CSE-MsgGUID: 05mwQyZARyCOf4qMzrOaOg==
X-IPAS-Result: =?us-ascii?q?A0AFAADNEoxq/5AQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBZYEXBQEBAQELAYE8ATBTgQgCgSFJhjqBaQOETF+GWIE1bAOBE?=
 =?us-ascii?q?50IFIFkBg8BAQENAi4BFQ0EAQGBcQEggTyBNwKNbAImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBGQEMJAE9AgEIEQMBA?=
 =?us-ascii?q?QEBGAgBDScKHQgCBAESCIJ7gh0WQQMBAg4GuAYCihx4gQEzgQGDKAE/AgJAA?=
 =?us-ascii?q?dwMFAGBOAGFBDqDHgEBKoE1gl2BIxgBg12BHycbG4FygRVCgjE4PoEFgVwBA?=
 =?us-ascii?q?QEBAYEgAyACGh4wg0WCMASCInoSG4E/HlQkgVSPFlJyIgMmMywBVRMXCwcFg?=
 =?us-ascii?q?SMQMwMgCi8tAhQNIg8aBS0dcAwnEg8dFxceWBsGBRIgKkFEIwMTK4EZQQKBd?=
 =?us-ascii?q?T8jGTZ8gQlegSspZQIQF0YuFYIHAoJagSdeAgFJQw4HRyILbT03Bg4ZAwSBN?=
 =?us-ascii?q?QWNcgdbH4IPGBkGATEpBgEhAgEJASkBAQQrVn0BAQ8qDB2SdAePWUeDVol6l?=
 =?us-ascii?q?C2BMwoog3aMIo0+iDIXhVuWEo5/mQgjjWeVaBiFDgIEAgQFAhABAQaBUhY8g?=
 =?us-ascii?q?VlwFYMiCQkBDDQZD41/LhaBeIFohFBDLn/FWXkCAQgyAQEHAgcOAwuBaJAmg?=
 =?us-ascii?q?VgBAQ?=
IronPort-PHdr: A9a23:RuHx0BxP45SiSxLXCzPsngc9DxPP8539OgoTr50/hK0LKOKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:2RpWQa0oewxq8/ggt/bD5Ytwkn2cJEfYwER7XKvMYLTBsI5bpzwGn
 DMZWG+EOPyMYWv8f98gOty2/E0A65bcm9dhGgE+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNEE0Gb020P9MEGBz2
 9ckBzoNaS3ZmLfjqF67YrEEasULJc3vOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEiojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZgOG9YIKPI4TQLSlTth7Fo
 33/7lbQOAAxE9LD0B+X6FWloeCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:1kQ6ba45GAXIBVl/HAPXwcGCI+orL9Y04lQ7vn2ZFiYlEfBwxv
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
X-Talos-CUID: =?us-ascii?q?9a23=3AfoIq1mnuIbCLfX+L0urIIgfbNvfXOUXdzlPgDWW?=
 =?us-ascii?q?hMndodZO+dXCa+KRZydU7zg=3D=3D?=
X-Talos-MUID: 9a23:1utYsQur3YQI3c9Ays2n3GxnK/550Y2UGWsqn8kfntueEiVXNGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 09:50:26 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 67128180001C3
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:50:26 +0000 (GMT)
X-CSE-ConnectionGUID: OmmLExiRS9S6xJu9ED76XA==
X-CSE-MsgGUID: oDzfMVtrR2q0vQHrXcbY9A==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208,217";a="59245992"
Received: from mail-eastusazon11012054.outbound.protection.outlook.com (HELO BL0PR03CU003.outbound.protection.outlook.com) ([52.101.53.54])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 09:50:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tS3JB4pStud4l0JFJVWT4OSNwm0SawAQxYmVsNcF2qHO+n4umwrTnLvnEyDi9pT2NaRLTAdxXPflnhxNcAQ7I5YVmwNmVSJKI/q4hy/swaccdxXaDtLGMbxz3PHLWbjFVuqTYn5dnFwA223CQFtrLa/GHRPZHyztn4TL+DrBMhGHw01+GAp8lU7z+nKg/eyW9Jc2gxEROEPodoHg/IyKVq/OjOMIlJ4iEeAShNmjaGvuvfZgc4TbzcA+51jyMe+Dcp4VFlNe5NA70dOi8qVFXrbIBUooRshdvUTWDQe10nRvq7lreFqqiGB+6uESWN2yaDHUkoHjBOwLShKfohABvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRTUiqgBgmW10UdvAqQ7lx4XseMFbpYVQTTeVRrjsbM=;
 b=EVjjp1LySCHNfbkjmOZED4tnmue3KDH4C+mC9PW1dSLg6flSXK8xFcKOzIMyysn8N6OzDQ422aVkP7WRf74BqyjhivEscmvo8xIFAwR+iFznB9eKjfvAJn4kXfwIkkORM3sVS6+nPKXbBx9y+k1tszMR+pMu4LBDeVbdA5gCxcKnUlzfIjRzXEhciIwSs++/q/gXHXQiw8yRY7xB+iszCHEYlqMwuGuTUEAwEAFSdITA3plteQtY4dE8rKtsPaY+1eI2DmdQvRV1PB3/K98Zu2sXzdWigEXlT758dBpXl1Gw3ylAi3gTcJ3IZCs1eXjzgxM+kDrLYCfh0YGK8V8ePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 24 Aug
 2026 09:50:23 +0000
Received: from CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec]) by CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:50:23 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "fabien.thomas@smile.fr" <fabien.thomas@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 23/37] curl: fix CVE-2026-7168
Thread-Topic: [OE-core][scarthgap 23/37] curl: fix CVE-2026-7168
Thread-Index: AQHdMI4H+c2NSMwD5UGxI5f7N+PfXras+roe
Date: Mon, 24 Aug 2026 09:50:23 +0000
Message-ID: 
 <CY5PR11MB61874A2D5CEB59C424C1880BC4A02@CY5PR11MB6187.namprd11.prod.outlook.com>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
 <18CD4012388268D1.189677@lists.openembedded.org>
 <DKTP4ETBSBHF.1LWD2OE8VROP3@smile.fr>
In-Reply-To: <DKTP4ETBSBHF.1LWD2OE8VROP3@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6187:EE_|CYYPR11MB8358:EE_
x-ms-office365-filtering-correlation-id: dc47628a-b996-4305-79f8-08df01c51e38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|13003099007|38070700021|3023799007|6133799003|10067099003|56012099006|4143699003|11063799006|8096899003|18002099003|22082099003|20052099010;
x-microsoft-antispam-message-info: 
 inEI6+h7NVL4vcx0BfSvfm3ROGQKYtBcF375IOoE1ZhHfAqD1l7paExbY+dMKyMLCUj+QcQy/1w3uusoDJrGn6oLZSL9llIPgzX9Qu3r9vYQO00eT1uhJz3dLdpVSVKqgJWtixetu7VN/lnT8hKBfxLGdJhqd9SPWMdvVk+FC65Vn9adGlTbYZpLRXvXA+3/HzZpus9mszggb7zVsBFm5cK2rCKXEzZE3NnS14LXlXV3B+1ICDuGpMfGFjnALE8H0CNy7nZbJWiws2FUDz7WWMXY7uiXVUuBxaPO0eC4dXaSLsOkZzhCmIbbdg+rgQxZ3iFBJc+65JZiQ9ycBHH1fhSDQm33vIVBxGGpu0QJdCUGdUPkk5z1eTlhuOLE4AECh08nYQp6l0UiMSO0RpnQn5DoV1TvqhOHFp3aTi3rtWVkaKytAJ6B/+nsLeS/Yi2Z/+P9LBTCxg1xlghg553YP/3ImfoOR+us6jgYTu0ULqmLxoP0xTZ1pCiJg3QuZX+9GNkVq/VHQu1yrSDLwB+RfewyovNTu2WrrJQ6DM8NCORWQi5YpXwMZCx0afFe8bsudC7mFGYb8wS376kRWbbjWYh0SVLLtl8SyjZozGq7AGwDd6o5yB/qTHidgikoZGE+20JShA8IiXJFgdVO7Kmne4ndG4y0hAqZK91UTcOzW4o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(13003099007)(38070700021)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(8096899003)(18002099003)(22082099003)(20052099010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OiKXY8ORh8yRdSBrvqZ3x7iGB2aBup9eNpavSkittQO0MEFXogGqciFFBVMe?=
 =?us-ascii?Q?4w+OGG3T5qgYlyd24KZ3fSZRGfyZnki1BHOOq5kSKIicVuA/1XvPa1Q1Hf7s?=
 =?us-ascii?Q?VL/JFE7sJgQvVkh6obq1KFOVpBNV7QxMdc4nj6RidXbRf9NXd5ObtyIJFxtZ?=
 =?us-ascii?Q?fCsY9OXx15un/BCax890YWiHXKO5HP529G1QXf7GbDL7Hz+w2P7MDzo+qtJ4?=
 =?us-ascii?Q?sv2773lj1XB+87iFQ/ML084VRxT0n1Cq/eN9LXn8D4Sz0gIDADeBTo558SU5?=
 =?us-ascii?Q?T9apY1WxkgmAwsKj4bTo5q85OWPrN4d4ceedTx/4RyYo890SDI7oS1X+4knU?=
 =?us-ascii?Q?nmG0NISWAZA9eQ2SwNHHPpP6yDeU/hBFkdS0SXISOw56PrxCY6wCLO7GPR+w?=
 =?us-ascii?Q?TM3nyLLklSg89CpLLKv8eEYx//Z+mwDj1k33cQLZyhHDx42Mq9hPwspa7e9U?=
 =?us-ascii?Q?5sABP7TsomJGOAhQQoOl12r9RegAm+YWODXAymdCAypj86RWoAe5muZdcxn1?=
 =?us-ascii?Q?zauXYp8MTfVYVCmUjsK+2/zrAryCL441Jh0pNqfb3J+V8UQfM9TCNgsViUxN?=
 =?us-ascii?Q?bycj0XMQd22Js937fRRmwlJlLBY4MD2Am4q+/m8JCAMeBoU5VbB61V6s7PGE?=
 =?us-ascii?Q?Rx2MhRFQ1grZrYK2s6j3HP9YBf1HWrsubBXwKyj2buKCOYKVxXoz1NmnW8Cw?=
 =?us-ascii?Q?BYdALhk/2Cz/EU8XUdTlqdNSckpZjQgiUCNmFwZbtAHhXC5mViucuAeKEYxX?=
 =?us-ascii?Q?dPQNXCGwvEkMuMuCPvYl1vFwdO6Gq71co+G2pEZy5ItwJjpzU4TMKZi6Yeje?=
 =?us-ascii?Q?VMFQLH37dHCpESNLJ58WuMJeSYkyavboyH1y/PiqOFVskrkrDrdvL3YGYBVj?=
 =?us-ascii?Q?fWafqFEO8wamd3ATP8Tcx7RBXCvP3jWKw9WDFDYlc0o5WVNpJoa6m1qxqZiR?=
 =?us-ascii?Q?bQhSNMl+QpQoXKDxxH/dqMS8x7Ve+ZnETSzFfqkJRO+Z3kweU3iK71kmUE3k?=
 =?us-ascii?Q?Mx4QdUiGAmIgIysNFlly1U9j62pp4C91d0qEx1dtsApYP05ukPmIkkuz3I/F?=
 =?us-ascii?Q?qAA4nUVf/OATrMGN2BIgI2p2s04EVlRP+fIMmrLfN4PWWEcX5iADPFsUld17?=
 =?us-ascii?Q?xvT54f0dDNZ2UknSB9AJECht8DFd3vtbfKPs7cf+eaoOufIDcIY6dvbBegsy?=
 =?us-ascii?Q?/2uLnXJmasg5wE+MXg8IVOfkgUsazm41eZt7RumAB03Cmi8mfcI7qFk5+Y+U?=
 =?us-ascii?Q?9Gg2m7YR+ZyYMceiCl7iLM/xSTe+LAZWUFkKVRDiftruipoK4lGtl4RKDwsZ?=
 =?us-ascii?Q?YdmmymTOlnOIrmiPdNA3gISGfwrwSd82IoHLjywjYEkz9nvHCtloAO/A5+yh?=
 =?us-ascii?Q?FMumXnEaDgeyIL0HO58MZQIochWrlbHe53MotjNcPms7guNCYeDwQgHmITlj?=
 =?us-ascii?Q?TiiPFGCzd742REf8Zbn8OJHvjPC0dX4DGJE3+Zma/XxRq/djl4nJQYt2Z/kt?=
 =?us-ascii?Q?em6Ffh3ry0qaB6n5gl9eAFvMC33JfesNjmYR/+EIbm/dU7Hn4CDLyLH+2Nnc?=
 =?us-ascii?Q?iCg0mooDcWY2j0XykygJYE4wa29tMPjwELmD3iuxeOv5sL1VeJTJn0l65+iZ?=
 =?us-ascii?Q?URq0XygW/uB33twgQdF5TYKenDIZGUhAXn1sBWCr8Js/f1bjhp+K67YWD6kl?=
 =?us-ascii?Q?xWceFMNzUCvcZmZgq1VOqGOKwOVx05es8OqH0AAfSx+sRz74?=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR11MB61874A2D5CEB59C424C1880BC4A02CY5PR11MB6187namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	HMML8ZLx61sIY78UWNXlG37UOPPQ2J7tP8ih+n7ui61cFkXpUMA92jjdz0+tBd7cAhGo9bOIQf3FCnDwa73PQPkQOHs5bWRalGxPRgrcCWxqM9OWSEsXCoIiuGAQakH+VN1xbnAZxNzBVsgA9T6cYpu3FVUfCbLA6oLSCroJgYI6qkOd49i1q6f+CNpSUHjbsk3hup+VKLxozBab9V8vgKhK7TeWkaM3pssGr6GZUwowSOqjCRgq3fEUsaIcJubp6GIUo7XB7++gzfCRCNetxEKCSw2vo9d+3cAatAz0JP/UADZCRatLhd7NTkMDfEwqBB+VWkDfMX1zKPwTLYkV9A==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc47628a-b996-4305-79f8-08df01c51e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 09:50:23.6994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4wYjaTxHBz7/vPN/yiOMEydRXYReXT3qtxPzcDXhJnkBL6vG0RMPKnTtRNhr16KoNWr5NakcpYUk860Njf73HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244077

--_000_CY5PR11MB61874A2D5CEB59C424C1880BC4A02CY5PR11MB6187namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Fabien,

Thanks for your review. I have addressed this and sent the updated patch he=
re:
openembedded-core@lists.openembedded.org | [scarthgap][PATCH v3 5/5] curl: =
fix CVE-2026-7168<https://lists.openembedded.org/g/openembedded-core/topic/=
120900349>

Regards,
Deepak

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Fabien Thomas via lists.openembedded.org <fabie=
n.thomas=3Dsmile.fr@lists.openembedded.org>
Sent: Thursday, August 20, 2026 3:53 PM
To: fabien.thomas@smile.fr <fabien.thomas@smile.fr>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 23/37] curl: fix CVE-2026-7168

On Wed Aug 19, 2026 at 5:56 PM CEST, Fabien Thomas via lists.openembedded.o=
rg wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream backport for CVE-2026-7168.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c=
8594507
> [2] https://curl.se/docs/CVE-2026-7168.html
>
> (From OE-Core rev: 2fa295fe7473c6df94175de36528736bf32f1e9a)
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> ---
>  .../curl/curl/CVE-2026-7168.patch             | 425 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 426 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-7168.patch
> new file mode 100644
> index 00000000000..0669be6546d
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
> @@ -0,0 +1,425 @@
> +From 0f0bb5efbd1e4f2199eeb98e6c62a7a67242cad2 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 5 Jun 2026 01:22:37 -0700
> +Subject: [PATCH] setopt: clear proxy auth properties when switching
> +
> +Verify with test 1588
> +
> +Closes #21453
> +
> +CVE: CVE-2026-7168
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59a=
cbaf9504c4578d4cf56cdd7c8594507]
> +
> +Backport Changes:
> +- The upstream lib/setopt.c hunk reuses Curl_auth_digest_cleanup() from =
the
> +  newer tree. curl-8.7.1 does not expose that helper to setopt.c in the =
same
> +  way, so this backport adds the vauth/vauth.h include before applying t=
he
> +  upstream setproxy() cleanup logic.
> +- The upstream tree already provides a CURL_DISABLE_DIGEST_AUTH fallback=
 for
> +  Curl_auth_digest_cleanup(). curl-8.7.1 does not, so this backport adds=
 the
> +  equivalent no-op macro in lib/vauth/vauth.h.
> +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
> +  instead of the upstream tests/data/Makefile.am and
> +  tests/libtest/Makefile.am lists.
> +- curl-8.7.1 uses the older libtest harness, so first.h,
> +  test_lib1588(), libtest_arg4, and CURLcode result handling were adapte=
d to
> +  test.h, test(), test_argv[4], and int res.
> +- curl-8.7.1 does not define the newer digest test feature in runtests.p=
l.
> +  This backport defines the target harness feature as digest-auth, match=
ing
> +  tests/server/disabled.c, and makes test 1588 require digest-auth.
> +- The curl-8.7.1 server harness does not handle crlf=3D"headers" correct=
ly on
> +  response data sections for this test, so those attributes were removed=
 from
> +  the two server response blocks and datacheck. The protocol block keeps
> +  crlf=3D"headers" because runtests.pl normalizes protocol verification =
when any
> +  crlf attribute is present.
> +
> +(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/setopt.c               |  18 ++++-
> + lib/vauth/vauth.h          |   2 +
> + tests/data/Makefile.inc    |   1 +
> + tests/data/test1588        | 106 ++++++++++++++++++++++++++
> + tests/libtest/Makefile.inc |   5 +-
> + tests/libtest/lib1588.c    | 152 +++++++++++++++++++++++++++++++++++++
> + tests/runtests.pl          |   2 +
> + 7 files changed, 283 insertions(+), 3 deletions(-)
> + create mode 100644 tests/data/test1588
> + create mode 100644 tests/libtest/lib1588.c
> +
> +diff --git a/lib/setopt.c b/lib/setopt.c
> +index 8a5a5d7..7eaf309 100644
> +--- a/lib/setopt.c
> ++++ b/lib/setopt.c
> +@@ -51,6 +51,7 @@
> + #include "altsvc.h"
> + #include "hsts.h"
> + #include "tftp.h"
> ++#include "vauth/vauth.h"
> + #include "strdup.h"
> + /* The last 3 #include files should be in this order */
> + #include "curl_printf.h"
> +@@ -76,6 +77,20 @@ CURLcode Curl_setstropt(char **charp, const char *s)
> +   return CURLE_OK;
> + }
> +
> ++#ifndef CURL_DISABLE_PROXY
> ++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
> ++{
> ++  if((data->set.str[STRING_PROXY] && proxy) &&
> ++     /* there was one set, is this a new one? */
> ++     !strcmp(data->set.str[STRING_PROXY], proxy))
> ++    return CURLE_OK; /* same one as before */
> ++
> ++  Curl_auth_digest_cleanup(&data->state.proxydigest);
> ++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
> ++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
> ++}
> ++#endif
> ++
> + CURLcode Curl_setblobopt(struct curl_blob **blobp,
> +                          const struct curl_blob *blob)
> + {
> +@@ -1139,8 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURL=
option option, va_list param)
> +      * Setting it to NULL, means no proxy but allows the environment va=
riables
> +      * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
> +      */
> +-    result =3D Curl_setstropt(&data->set.str[STRING_PROXY],
> +-                            va_arg(param, char *));
> ++    result =3D setproxy(data, va_arg(param, char *));
> +     break;
> +
> +   case CURLOPT_PRE_PROXY:
> +diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
> +index 9da0540..bf5c7a3 100644
> +--- a/lib/vauth/vauth.h
> ++++ b/lib/vauth/vauth.h
> +@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_digest_http_message(struct=
 Curl_easy *data,
> +
> + /* This is used to clean up the digest specific data */
> + void Curl_auth_digest_cleanup(struct digestdata *digest);
> ++#else
> ++#define Curl_auth_digest_cleanup(x)
> + #endif /* !CURL_DISABLE_DIGEST_AUTH */
> +
> + #ifdef USE_GSASL
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index f673f86..461eb37 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -200,6 +200,7 @@ test1540 test1541 test1542 test1543 test1544 test154=
5 \
> + test1550 test1551 test1552 test1553 test1554 test1555 test1556 test1557=
 \
> + test1558 test1559 test1560 test1561 test1562 test1563 test1564 test1565=
 \
> + test1566 test1567 test1568 test1569 test1570 \
> ++test1588 \
> + \
> + test1590 test1591 test1592 test1593 test1594 test1595 test1596 test1597=
 \
> + test1598 \
> +diff --git a/tests/data/test1588 b/tests/data/test1588
> +new file mode 100644
> +index 0000000..8a3bf81
> +--- /dev/null
> ++++ b/tests/data/test1588
> +@@ -0,0 +1,106 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++HTTP GET
> ++HTTP proxy
> ++HTTP proxy Digest auth
> ++multi
> ++</keywords>
> ++</info>
> ++
> ++# Server-side
> ++<reply>
> ++
> ++# this is returned first since we get no proxy-auth
> ++<data>
> ++HTTP/1.1 407 Authorization Required to proxy me my dear
> ++Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"
> ++Content-Length: 33
> ++
> ++And you should ignore this data.
> ++</data>
> ++
> ++# then this is returned when we get proxy-auth
> ++<data1000>
> ++HTTP/1.1 200 OK
> ++Content-Length: 21
> ++Server: no
> ++
> ++Nice proxy auth sir!
> ++</data1000>
> ++
> ++<datacheck>
> ++HTTP/1.1 407 Authorization Required to proxy me my dear
> ++Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"
> ++Content-Length: 33
> ++
> ++HTTP/1.1 200 OK
> ++Content-Length: 21
> ++Server: no
> ++
> ++Nice proxy auth sir!
> ++HTTP/1.1 407 Authorization Required to proxy me my dear
> ++Proxy-Authenticate: Digest realm=3D"weirdorealm", nonce=3D"12345"
> ++Content-Length: 33
> ++
> ++HTTP/1.1 200 OK
> ++Content-Length: 21
> ++Server: no
> ++
> ++Nice proxy auth sir!
> ++</datacheck>
> ++</reply>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++# tool is what to use instead of 'curl'
> ++<tool>
> ++lib%TESTNUMBER
> ++</tool>
> ++<features>
> ++!SSPI
> ++crypto
> ++proxy
> ++digest-auth
> ++</features>
> ++<name>
> ++HTTP proxy auth Digest, then change proxy and do it again
> ++</name>
> ++<command>
> ++http://test.remote.example.com/path/%TESTNUMBER %HOSTIP %HTTPPORT silly=
:person custom.set.host.name
> ++</command>
> ++</client>
> ++
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Proxy-Authorization: Digest username=3D"silly", realm=3D"weirdorealm", =
nonce=3D"12345", uri=3D"/path/1588", response=3D"d0b2f000c7e3fca24452b58107=
13404a"
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://test.remote.example.com/path/1588 HTTP/1.1
> ++Host: test.remote.example.com
> ++Proxy-Authorization: Digest username=3D"silly", realm=3D"weirdorealm", =
nonce=3D"12345", uri=3D"/path/1588", response=3D"d0b2f000c7e3fca24452b58107=
13404a"
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index 9d3356a..4c42d34 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -62,7 +62,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntlmco=
nnect libprereq      \
> +  lib1540 lib1541 lib1542 lib1543         lib1545 \
> +  lib1550 lib1551 lib1552 lib1553 lib1554 lib1555 lib1556 lib1557 \
> +  lib1558 lib1559 lib1560 lib1564 lib1565 lib1567 lib1568 lib1569 \
> +- lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
> ++ lib1588 lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
> +  \
> +  lib1662 \
> +  \
> +@@ -687,6 +687,9 @@ lib2502_LDADD =3D $(TESTUTIL_LIBS)
> + lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib2506_LDADD =3D $(TESTUTIL_LIBS)
> +
> ++lib1588_SOURCES =3D lib1588.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> ++lib1588_LDADD =3D $(TESTUTIL_LIBS)
> ++
> + lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib3010_LDADD =3D $(TESTUTIL_LIBS)
> +
> +diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c
> +new file mode 100644
> +index 0000000..00c6b35
> +--- /dev/null
> ++++ b/tests/libtest/lib1588.c
> +@@ -0,0 +1,152 @@
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ **********************************************************************=
*****/
> ++/*
> ++ * argv1 =3D URL
> ++ * argv2 =3D proxy host
> ++ * argv3 =3D proxy port
> ++ * argv4 =3D proxyuser:password
> ++ */
> ++
> ++#include "test.h"
> ++#include "testutil.h"
> ++
> ++static CURLcode init1588(CURL *curl, const char *url,
> ++                         const char *userpwd, const char *proxy)
> ++{
> ++  int res =3D CURLE_OK;
> ++
> ++  res_easy_setopt(curl, CURLOPT_URL, url);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_PROXY, proxy);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
> ++  if(res)
> ++    goto init_failed;
> ++#if 0
> ++  res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);
> ++  if(res)
> ++    goto init_failed;
> ++#endif
> ++
> ++  res_easy_setopt(curl, CURLOPT_HEADER, 1L);
> ++  if(res)
> ++    goto init_failed;
> ++
> ++  return CURLE_OK; /* success */
> ++
> ++init_failed:
> ++  return (CURLcode)res; /* failure */
> ++}
> ++
> ++static CURLcode run1588(CURL *curl, const char *url, const char *userpw=
d,
> ++                        const char *proxy)
> ++{
> ++  CURLcode res =3D CURLE_OK;
> ++
> ++  res =3D init1588(curl, url, userpwd, proxy);
> ++  if(res)
> ++    return res;
> ++
> ++  return curl_easy_perform(curl);
> ++}
> ++
> ++int test(char *URL)
> ++{
> ++  int res =3D CURLE_OK;
> ++  CURL *curl =3D NULL;
> ++  const char *proxyuserpws;
> ++  struct curl_slist *host =3D NULL;
> ++  struct curl_slist *host2 =3D NULL;
> ++  char proxy1_resolve[128];
> ++  char proxy2_resolve[128];
> ++  char proxy1_connect[128];
> ++  char proxy2_connect[128];
> ++
> ++  if(test_argc < 5)
> ++    return TEST_ERR_MAJOR_BAD;
> ++  proxyuserpws =3D test_argv[4];
> ++
> ++  curl_msnprintf(proxy1_resolve, sizeof(proxy1_resolve),
> ++                 "firstproxy:%s:%s", libtest_arg3, libtest_arg2);
> ++  curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),
> ++                 "secondproxy:%s:%s", libtest_arg3, libtest_arg2);
> ++
> ++  /* we connect to the fake host name but the right port number */
> ++  curl_msnprintf(proxy1_connect, sizeof(proxy1_connect),
> ++                 "firstproxy:%s", libtest_arg3);
> ++  curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),
> ++                 "secondproxy:%s", libtest_arg3);
> ++
> ++  res_global_init(CURL_GLOBAL_ALL);
> ++  if(res)
> ++    return res;
> ++
> ++  curl =3D curl_easy_init();
> ++  if(!curl) {
> ++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
> ++    curl_global_cleanup();
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  host =3D curl_slist_append(NULL, proxy1_resolve);
> ++  if(!host)
> ++    goto test_cleanup;
> ++  host2 =3D curl_slist_append(host, proxy2_resolve);
> ++  if(!host2)
> ++    goto test_cleanup;
> ++  host =3D host2;
> ++
> ++  start_test_timing();
> ++
> ++  easy_setopt(curl, CURLOPT_RESOLVE, host);
> ++
> ++  res =3D run1588(curl, URL, proxyuserpws, proxy1_connect);
> ++  if(res)
> ++    goto test_cleanup;
> ++
> ++  curl_mfprintf(stderr, "lib1588: now we do the request again\n");
> ++
> ++  res =3D run1588(curl, URL, proxyuserpws, proxy2_connect);
> ++
> ++test_cleanup:
> ++
> ++  /* proper cleanup sequence - type PB */
> ++
> ++  curl_easy_cleanup(curl);
> ++  curl_global_cleanup();
> ++  curl_slist_free_all(host);
> ++  return res;
> ++}
> +diff --git a/tests/runtests.pl b/tests/runtests.pl
> +index ddfab20..b40df55 100755
> +--- a/tests/runtests.pl
> ++++ b/tests/runtests.pl
> +@@ -637,6 +637,8 @@ sub checksystemfeatures {
> +             $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;
> +             # SPNEGO enabled
> +             $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;
> ++            # Digest auth enabled unless disabled by build
> ++            $feature{"digest-auth"} =3D 1;
> +             # CharConv enabled
> +             $feature{"CharConv"} =3D $feat =3D~ /CharConv/i;
> +             # TLS-SRP enabled
> +--
> +2.35.6
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 8e39d821626..7d55f72b03f 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D " \
>      file://CVE-2026-5545.patch \
>      file://CVE-2026-6253.patch \
>      file://CVE-2026-6429.patch \
> +    file://CVE-2026-7168.patch \
>  "
>
>  SRC_URI:append:class-nativesdk =3D " \

I'll have to drop this patch too because it doesn't apply anymore without
the previous patch of the series (curl: fix CVE-2026-6429) which cause some
ptest faillures.

--
Fabien Thomas
Smile ECS


--_000_CY5PR11MB61874A2D5CEB59C424C1880BC4A02CY5PR11MB6187namp_
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
Hi Fabien,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for your review. I have addressed this and sent the updated patch he=
re:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/1209003=
49" id=3D"OWA3c2da999-d476-35b5-244f-9599a6597749" class=3D"OWAAutoLink">op=
enembedded-core@lists.openembedded.org | [scarthgap][PATCH v3 5/5] curl: fi=
x CVE-2026-7168</a></div>
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Fabien Thomas via lists.openembedded.org
 &lt;fabien.thomas=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, August 20, 2026 3:53 PM<br>
<b>To:</b> fabien.thomas@smile.fr &lt;fabien.thomas@smile.fr&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap 23/37] curl: fix CVE-2026-7168</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Aug 19, 2026 at 5:56 PM CEST, Fabien Thomas=
 via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream backport for CVE-2026-7168.<br>
&gt; The upstream fix commit is referenced in [1], and the public<br>
&gt; CVE advisory is referenced in [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4=
578d4cf56cdd7c8594507">
https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c859450=
7</a><br>
&gt; [2] <a href=3D"https://curl.se/docs/CVE-2026-7168.html">https://curl.s=
e/docs/CVE-2026-7168.html</a><br>
&gt;<br>
&gt; (From OE-Core rev: 2fa295fe7473c6df94175de36528736bf32f1e9a)<br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; Signed-off-by: Fabien Thomas &lt;fabien.thomas@smile.fr&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../curl/curl/CVE-2026-7168.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 425 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.7.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 426 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta=
/recipes-support/curl/curl/CVE-2026-7168.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..0669be6546d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch<br>
&gt; @@ -0,0 +1,425 @@<br>
&gt; +From 0f0bb5efbd1e4f2199eeb98e6c62a7a67242cad2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
&gt; +Date: Fri, 5 Jun 2026 01:22:37 -0700<br>
&gt; +Subject: [PATCH] setopt: clear proxy auth properties when switching<b=
r>
&gt; +<br>
&gt; +Verify with test 1588<br>
&gt; +<br>
&gt; +Closes #21453<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7168<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507">https://github.com/curl/curl=
/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- The upstream lib/setopt.c hunk reuses Curl_auth_digest_cleanup() fr=
om the<br>
&gt; +&nbsp; newer tree. curl-8.7.1 does not expose that helper to setopt.c=
 in the same<br>
&gt; +&nbsp; way, so this backport adds the vauth/vauth.h include before ap=
plying the<br>
&gt; +&nbsp; upstream setproxy() cleanup logic.<br>
&gt; +- The upstream tree already provides a CURL_DISABLE_DIGEST_AUTH fallb=
ack for<br>
&gt; +&nbsp; Curl_auth_digest_cleanup(). curl-8.7.1 does not, so this backp=
ort adds the<br>
&gt; +&nbsp; equivalent no-op macro in lib/vauth/vauth.h.<br>
&gt; +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.=
inc<br>
&gt; +&nbsp; instead of the upstream tests/data/Makefile.am and<br>
&gt; +&nbsp; tests/libtest/Makefile.am lists.<br>
&gt; +- curl-8.7.1 uses the older libtest harness, so first.h,<br>
&gt; +&nbsp; test_lib1588(), libtest_arg4, and CURLcode result handling wer=
e adapted to<br>
&gt; +&nbsp; test.h, test(), test_argv[4], and int res.<br>
&gt; +- curl-8.7.1 does not define the newer digest test feature in runtest=
s.pl.<br>
&gt; +&nbsp; This backport defines the target harness feature as digest-aut=
h, matching<br>
&gt; +&nbsp; tests/server/disabled.c, and makes test 1588 require digest-au=
th.<br>
&gt; +- The curl-8.7.1 server harness does not handle crlf=3D&quot;headers&=
quot; correctly on<br>
&gt; +&nbsp; response data sections for this test, so those attributes were=
 removed from<br>
&gt; +&nbsp; the two server response blocks and datacheck. The protocol blo=
ck keeps<br>
&gt; +&nbsp; crlf=3D&quot;headers&quot; because runtests.pl normalizes prot=
ocol verification when any<br>
&gt; +&nbsp; crlf attribute is present.<br>
&gt; +<br>
&gt; +(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + lib/setopt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 18 ++++-<br>
&gt; + lib/vauth/vauth.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp;&nbsp; 2 +<br>
&gt; + tests/data/Makefile.inc&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; + tests/data/test1588&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 106 =
++++++++++++++++++++++++++<br>
&gt; + tests/libtest/Makefile.inc |&nbsp;&nbsp; 5 +-<br>
&gt; + tests/libtest/lib1588.c&nbsp;&nbsp;&nbsp; | 152 ++++++++++++++++++++=
+++++++++++++++++<br>
&gt; + tests/runtests.pl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp;&nbsp; 2 +<br>
&gt; + 7 files changed, 283 insertions(+), 3 deletions(-)<br>
&gt; + create mode 100644 tests/data/test1588<br>
&gt; + create mode 100644 tests/libtest/lib1588.c<br>
&gt; +<br>
&gt; +diff --git a/lib/setopt.c b/lib/setopt.c<br>
&gt; +index 8a5a5d7..7eaf309 100644<br>
&gt; +--- a/lib/setopt.c<br>
&gt; ++++ b/lib/setopt.c<br>
&gt; +@@ -51,6 +51,7 @@<br>
&gt; + #include &quot;altsvc.h&quot;<br>
&gt; + #include &quot;hsts.h&quot;<br>
&gt; + #include &quot;tftp.h&quot;<br>
&gt; ++#include &quot;vauth/vauth.h&quot;<br>
&gt; + #include &quot;strdup.h&quot;<br>
&gt; + /* The last 3 #include files should be in this order */<br>
&gt; + #include &quot;curl_printf.h&quot;<br>
&gt; +@@ -76,6 +77,20 @@ CURLcode Curl_setstropt(char **charp, const char *=
s)<br>
&gt; +&nbsp;&nbsp; return CURLE_OK;<br>
&gt; + }<br>
&gt; + <br>
&gt; ++#ifndef CURL_DISABLE_PROXY<br>
&gt; ++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)<=
br>
&gt; ++{<br>
&gt; ++&nbsp; if((data-&gt;set.str[STRING_PROXY] &amp;&amp; proxy) &amp;&am=
p;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; /* there was one set, is this a new one? */=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; !strcmp(data-&gt;set.str[STRING_PROXY], pro=
xy))<br>
&gt; ++&nbsp;&nbsp;&nbsp; return CURLE_OK; /* same one as before */<br>
&gt; ++<br>
&gt; ++&nbsp; Curl_auth_digest_cleanup(&amp;data-&gt;state.proxydigest);<br=
>
&gt; ++&nbsp; memset(&amp;data-&gt;state.authproxy, 0, sizeof(data-&gt;stat=
e.authproxy));<br>
&gt; ++&nbsp; return Curl_setstropt(&amp;data-&gt;set.str[STRING_PROXY], pr=
oxy);<br>
&gt; ++}<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + CURLcode Curl_setblobopt(struct curl_blob **blobp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; const struct curl_blob *blob)<br>
&gt; + {<br>
&gt; +@@ -1139,8 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, C=
URLoption option, va_list param)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Setting it to NULL, means no proxy b=
ut allows the environment variables<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to decide for us (if CURLOPT_SOCKS_P=
ROXY setting it to NULL).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +-&nbsp;&nbsp;&nbsp; result =3D Curl_setstropt(&amp;data-&gt;set.str[S=
TRING_PROXY],<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; va_arg(param, char *));<br>
&gt; ++&nbsp;&nbsp;&nbsp; result =3D setproxy(data, va_arg(param, char *));=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; case CURLOPT_PRE_PROXY:<br>
&gt; +diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h<br>
&gt; +index 9da0540..bf5c7a3 100644<br>
&gt; +--- a/lib/vauth/vauth.h<br>
&gt; ++++ b/lib/vauth/vauth.h<br>
&gt; +@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_digest_http_message(str=
uct Curl_easy *data,<br>
&gt; + <br>
&gt; + /* This is used to clean up the digest specific data */<br>
&gt; + void Curl_auth_digest_cleanup(struct digestdata *digest);<br>
&gt; ++#else<br>
&gt; ++#define Curl_auth_digest_cleanup(x)<br>
&gt; + #endif /* !CURL_DISABLE_DIGEST_AUTH */<br>
&gt; + <br>
&gt; + #ifdef USE_GSASL<br>
&gt; +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc<br>
&gt; +index f673f86..461eb37 100644<br>
&gt; +--- a/tests/data/Makefile.inc<br>
&gt; ++++ b/tests/data/Makefile.inc<br>
&gt; +@@ -200,6 +200,7 @@ test1540 test1541 test1542 test1543 test1544 test=
1545 \<br>
&gt; + test1550 test1551 test1552 test1553 test1554 test1555 test1556 test1=
557 \<br>
&gt; + test1558 test1559 test1560 test1561 test1562 test1563 test1564 test1=
565 \<br>
&gt; + test1566 test1567 test1568 test1569 test1570 \<br>
&gt; ++test1588 \<br>
&gt; + \<br>
&gt; + test1590 test1591 test1592 test1593 test1594 test1595 test1596 test1=
597 \<br>
&gt; + test1598 \<br>
&gt; +diff --git a/tests/data/test1588 b/tests/data/test1588<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..8a3bf81<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/data/test1588<br>
&gt; +@@ -0,0 +1,106 @@<br>
&gt; ++&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;US-ASCII&quot;?&=
gt;<br>
&gt; ++&lt;testcase&gt;<br>
&gt; ++&lt;info&gt;<br>
&gt; ++&lt;keywords&gt;<br>
&gt; ++HTTP<br>
&gt; ++HTTP GET<br>
&gt; ++HTTP proxy<br>
&gt; ++HTTP proxy Digest auth<br>
&gt; ++multi<br>
&gt; ++&lt;/keywords&gt;<br>
&gt; ++&lt;/info&gt;<br>
&gt; ++<br>
&gt; ++# Server-side<br>
&gt; ++&lt;reply&gt;<br>
&gt; ++<br>
&gt; ++# this is returned first since we get no proxy-auth<br>
&gt; ++&lt;data&gt;<br>
&gt; ++HTTP/1.1 407 Authorization Required to proxy me my dear<br>
&gt; ++Proxy-Authenticate: Digest realm=3D&quot;weirdorealm&quot;, nonce=3D=
&quot;12345&quot;<br>
&gt; ++Content-Length: 33<br>
&gt; ++<br>
&gt; ++And you should ignore this data.<br>
&gt; ++&lt;/data&gt;<br>
&gt; ++<br>
&gt; ++# then this is returned when we get proxy-auth<br>
&gt; ++&lt;data1000&gt;<br>
&gt; ++HTTP/1.1 200 OK<br>
&gt; ++Content-Length: 21<br>
&gt; ++Server: no<br>
&gt; ++<br>
&gt; ++Nice proxy auth sir!<br>
&gt; ++&lt;/data1000&gt;<br>
&gt; ++<br>
&gt; ++&lt;datacheck&gt;<br>
&gt; ++HTTP/1.1 407 Authorization Required to proxy me my dear<br>
&gt; ++Proxy-Authenticate: Digest realm=3D&quot;weirdorealm&quot;, nonce=3D=
&quot;12345&quot;<br>
&gt; ++Content-Length: 33<br>
&gt; ++<br>
&gt; ++HTTP/1.1 200 OK<br>
&gt; ++Content-Length: 21<br>
&gt; ++Server: no<br>
&gt; ++<br>
&gt; ++Nice proxy auth sir!<br>
&gt; ++HTTP/1.1 407 Authorization Required to proxy me my dear<br>
&gt; ++Proxy-Authenticate: Digest realm=3D&quot;weirdorealm&quot;, nonce=3D=
&quot;12345&quot;<br>
&gt; ++Content-Length: 33<br>
&gt; ++<br>
&gt; ++HTTP/1.1 200 OK<br>
&gt; ++Content-Length: 21<br>
&gt; ++Server: no<br>
&gt; ++<br>
&gt; ++Nice proxy auth sir!<br>
&gt; ++&lt;/datacheck&gt;<br>
&gt; ++&lt;/reply&gt;<br>
&gt; ++<br>
&gt; ++# Client-side<br>
&gt; ++&lt;client&gt;<br>
&gt; ++&lt;server&gt;<br>
&gt; ++http<br>
&gt; ++&lt;/server&gt;<br>
&gt; ++# tool is what to use instead of 'curl'<br>
&gt; ++&lt;tool&gt;<br>
&gt; ++lib%TESTNUMBER<br>
&gt; ++&lt;/tool&gt;<br>
&gt; ++&lt;features&gt;<br>
&gt; ++!SSPI<br>
&gt; ++crypto<br>
&gt; ++proxy<br>
&gt; ++digest-auth<br>
&gt; ++&lt;/features&gt;<br>
&gt; ++&lt;name&gt;<br>
&gt; ++HTTP proxy auth Digest, then change proxy and do it again<br>
&gt; ++&lt;/name&gt;<br>
&gt; ++&lt;command&gt;<br>
&gt; ++http://test.remote.example.com/path/%TESTNUMBER %HOSTIP %HTTPPORT si=
lly:person custom.set.host.name<br>
&gt; ++&lt;/command&gt;<br>
&gt; ++&lt;/client&gt;<br>
&gt; ++<br>
&gt; ++# Verify data after the test has been &quot;shot&quot;<br>
&gt; ++&lt;verify&gt;<br>
&gt; ++&lt;protocol crlf=3D&quot;headers&quot;&gt;<br>
&gt; ++GET <a href=3D"http://test.remote.example.com/path/1588">http://test=
.remote.example.com/path/1588</a> HTTP/1.1<br>
&gt; ++Host: test.remote.example.com<br>
&gt; ++Accept: */*<br>
&gt; ++Proxy-Connection: Keep-Alive<br>
&gt; ++<br>
&gt; ++GET <a href=3D"http://test.remote.example.com/path/1588">http://test=
.remote.example.com/path/1588</a> HTTP/1.1<br>
&gt; ++Host: test.remote.example.com<br>
&gt; ++Proxy-Authorization: Digest username=3D&quot;silly&quot;, realm=3D&q=
uot;weirdorealm&quot;, nonce=3D&quot;12345&quot;, uri=3D&quot;/path/1588&qu=
ot;, response=3D&quot;d0b2f000c7e3fca24452b5810713404a&quot;<br>
&gt; ++Accept: */*<br>
&gt; ++Proxy-Connection: Keep-Alive<br>
&gt; ++<br>
&gt; ++GET <a href=3D"http://test.remote.example.com/path/1588">http://test=
.remote.example.com/path/1588</a> HTTP/1.1<br>
&gt; ++Host: test.remote.example.com<br>
&gt; ++Accept: */*<br>
&gt; ++Proxy-Connection: Keep-Alive<br>
&gt; ++<br>
&gt; ++GET <a href=3D"http://test.remote.example.com/path/1588">http://test=
.remote.example.com/path/1588</a> HTTP/1.1<br>
&gt; ++Host: test.remote.example.com<br>
&gt; ++Proxy-Authorization: Digest username=3D&quot;silly&quot;, realm=3D&q=
uot;weirdorealm&quot;, nonce=3D&quot;12345&quot;, uri=3D&quot;/path/1588&qu=
ot;, response=3D&quot;d0b2f000c7e3fca24452b5810713404a&quot;<br>
&gt; ++Accept: */*<br>
&gt; ++Proxy-Connection: Keep-Alive<br>
&gt; ++<br>
&gt; ++&lt;/protocol&gt;<br>
&gt; ++&lt;/verify&gt;<br>
&gt; ++&lt;/testcase&gt;<br>
&gt; +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc<=
br>
&gt; +index 9d3356a..4c42d34 100644<br>
&gt; +--- a/tests/libtest/Makefile.inc<br>
&gt; ++++ b/tests/libtest/Makefile.inc<br>
&gt; +@@ -62,7 +62,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntl=
mconnect libprereq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp; lib1540 lib1541 lib1542 lib1543&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; lib1545 \<br>
&gt; +&nbsp; lib1550 lib1551 lib1552 lib1553 lib1554 lib1555 lib1556 lib155=
7 \<br>
&gt; +&nbsp; lib1558 lib1559 lib1560 lib1564 lib1565 lib1567 lib1568 lib156=
9 \<br>
&gt; +- lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \<br>
&gt; ++ lib1588 lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \<b=
r>
&gt; +&nbsp; \<br>
&gt; +&nbsp; lib1662 \<br>
&gt; +&nbsp; \<br>
&gt; +@@ -687,6 +687,9 @@ lib2502_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; + lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS=
)<br>
&gt; + lib2506_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; + <br>
&gt; ++lib1588_SOURCES =3D lib1588.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS=
)<br>
&gt; ++lib1588_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; ++<br>
&gt; + lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS=
)<br>
&gt; + lib3010_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; + <br>
&gt; +diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..00c6b35<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/libtest/lib1588.c<br>
&gt; +@@ -0,0 +1,152 @@<br>
&gt; ++/*******************************************************************=
********<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _&nbsp;&nbsp; _ _=
___&nbsp; _<br>
&gt; ++ *&nbsp; Project&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ___| |=
 | |&nbsp; _ \| |<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; / __| | | | |_) | |<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | (__| |_| |&nbsp; _ &lt;| |___<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \___|\___/|_| \_\_____|<br>
&gt; ++ *<br>
&gt; ++ * Copyright (C) Daniel Stenberg, &lt;daniel@haxx.se&gt;, et al.<br>
&gt; ++ *<br>
&gt; ++ * This software is licensed as described in the file COPYING, which=
<br>
&gt; ++ * you should have received as part of this distribution. The terms<=
br>
&gt; ++ * are also available at <a href=3D"https://curl.se/docs/copyright.h=
tml">https://curl.se/docs/copyright.html</a>.<br>
&gt; ++ *<br>
&gt; ++ * You may opt to use, copy, modify, merge, publish, distribute and/=
or sell<br>
&gt; ++ * copies of the Software, and permit persons to whom the Software i=
s<br>
&gt; ++ * furnished to do so, under the terms of the COPYING file.<br>
&gt; ++ *<br>
&gt; ++ * This software is distributed on an &quot;AS IS&quot; basis, WITHO=
UT WARRANTY OF ANY<br>
&gt; ++ * KIND, either express or implied.<br>
&gt; ++ *<br>
&gt; ++ * SPDX-License-Identifier: curl<br>
&gt; ++ *<br>
&gt; ++ *******************************************************************=
********/<br>
&gt; ++/*<br>
&gt; ++ * argv1 =3D URL<br>
&gt; ++ * argv2 =3D proxy host<br>
&gt; ++ * argv3 =3D proxy port<br>
&gt; ++ * argv4 =3D proxyuser:password<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++#include &quot;test.h&quot;<br>
&gt; ++#include &quot;testutil.h&quot;<br>
&gt; ++<br>
&gt; ++static CURLcode init1588(CURL *curl, const char *url,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; const char *userpwd, const char *proxy)<br>
&gt; ++{<br>
&gt; ++&nbsp; int res =3D CURLE_OK;<br>
&gt; ++<br>
&gt; ++&nbsp; res_easy_setopt(curl, CURLOPT_URL, url);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto init_failed;<br>
&gt; ++<br>
&gt; ++&nbsp; res_easy_setopt(curl, CURLOPT_PROXY, proxy);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto init_failed;<br>
&gt; ++<br>
&gt; ++&nbsp; res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto init_failed;<br>
&gt; ++<br>
&gt; ++&nbsp; res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);<br=
>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto init_failed;<br>
&gt; ++<br>
&gt; ++&nbsp; res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto init_failed;<br>
&gt; ++#if 0<br>
&gt; ++&nbsp; res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto init_failed;<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++&nbsp; res_easy_setopt(curl, CURLOPT_HEADER, 1L);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto init_failed;<br>
&gt; ++<br>
&gt; ++&nbsp; return CURLE_OK; /* success */<br>
&gt; ++<br>
&gt; ++init_failed:<br>
&gt; ++&nbsp; return (CURLcode)res; /* failure */<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static CURLcode run1588(CURL *curl, const char *url, const char *use=
rpwd,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cons=
t char *proxy)<br>
&gt; ++{<br>
&gt; ++&nbsp; CURLcode res =3D CURLE_OK;<br>
&gt; ++<br>
&gt; ++&nbsp; res =3D init1588(curl, url, userpwd, proxy);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; return res;<br>
&gt; ++<br>
&gt; ++&nbsp; return curl_easy_perform(curl);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int test(char *URL)<br>
&gt; ++{<br>
&gt; ++&nbsp; int res =3D CURLE_OK;<br>
&gt; ++&nbsp; CURL *curl =3D NULL;<br>
&gt; ++&nbsp; const char *proxyuserpws;<br>
&gt; ++&nbsp; struct curl_slist *host =3D NULL;<br>
&gt; ++&nbsp; struct curl_slist *host2 =3D NULL;<br>
&gt; ++&nbsp; char proxy1_resolve[128];<br>
&gt; ++&nbsp; char proxy2_resolve[128];<br>
&gt; ++&nbsp; char proxy1_connect[128];<br>
&gt; ++&nbsp; char proxy2_connect[128];<br>
&gt; ++<br>
&gt; ++&nbsp; if(test_argc &lt; 5)<br>
&gt; ++&nbsp;&nbsp;&nbsp; return TEST_ERR_MAJOR_BAD;<br>
&gt; ++&nbsp; proxyuserpws =3D test_argv[4];<br>
&gt; ++<br>
&gt; ++&nbsp; curl_msnprintf(proxy1_resolve, sizeof(proxy1_resolve),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;firstproxy:%s:%s&quot;, libtest_arg3, li=
btest_arg2);<br>
&gt; ++&nbsp; curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;secondproxy:%s:%s&quot;, libtest_arg3, l=
ibtest_arg2);<br>
&gt; ++<br>
&gt; ++&nbsp; /* we connect to the fake host name but the right port number=
 */<br>
&gt; ++&nbsp; curl_msnprintf(proxy1_connect, sizeof(proxy1_connect),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;firstproxy:%s&quot;, libtest_arg3);<br>
&gt; ++&nbsp; curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;secondproxy:%s&quot;, libtest_arg3);<br>
&gt; ++<br>
&gt; ++&nbsp; res_global_init(CURL_GLOBAL_ALL);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; return res;<br>
&gt; ++<br>
&gt; ++&nbsp; curl =3D curl_easy_init();<br>
&gt; ++&nbsp; if(!curl) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mfprintf(stderr, &quot;curl_easy_init() fail=
ed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_global_cleanup();<br>
&gt; ++&nbsp;&nbsp;&nbsp; return TEST_ERR_MAJOR_BAD;<br>
&gt; ++&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp; host =3D curl_slist_append(NULL, proxy1_resolve);<br>
&gt; ++&nbsp; if(!host)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto test_cleanup;<br>
&gt; ++&nbsp; host2 =3D curl_slist_append(host, proxy2_resolve);<br>
&gt; ++&nbsp; if(!host2)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto test_cleanup;<br>
&gt; ++&nbsp; host =3D host2;<br>
&gt; ++<br>
&gt; ++&nbsp; start_test_timing();<br>
&gt; ++<br>
&gt; ++&nbsp; easy_setopt(curl, CURLOPT_RESOLVE, host);<br>
&gt; ++<br>
&gt; ++&nbsp; res =3D run1588(curl, URL, proxyuserpws, proxy1_connect);<br>
&gt; ++&nbsp; if(res)<br>
&gt; ++&nbsp;&nbsp;&nbsp; goto test_cleanup;<br>
&gt; ++<br>
&gt; ++&nbsp; curl_mfprintf(stderr, &quot;lib1588: now we do the request ag=
ain\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp; res =3D run1588(curl, URL, proxyuserpws, proxy2_connect);<br>
&gt; ++<br>
&gt; ++test_cleanup:<br>
&gt; ++<br>
&gt; ++&nbsp; /* proper cleanup sequence - type PB */<br>
&gt; ++<br>
&gt; ++&nbsp; curl_easy_cleanup(curl);<br>
&gt; ++&nbsp; curl_global_cleanup();<br>
&gt; ++&nbsp; curl_slist_free_all(host);<br>
&gt; ++&nbsp; return res;<br>
&gt; ++}<br>
&gt; +diff --git a/tests/runtests.pl b/tests/runtests.pl<br>
&gt; +index ddfab20..b40df55 100755<br>
&gt; +--- a/tests/runtests.pl<br>
&gt; ++++ b/tests/runtests.pl<br>
&gt; +@@ -637,6 +637,8 @@ sub checksystemfeatures {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $feature{&quot;Kerberos&quot;} =3D $feat =3D~ /Kerberos/i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; # SPNEGO enabled<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $feature{&quot;SPNEGO&quot;} =3D $feat =3D~ /SPNEGO/i;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #=
 Digest auth enabled unless disabled by build<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $=
feature{&quot;digest-auth&quot;} =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; # CharConv enabled<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $feature{&quot;CharConv&quot;} =3D $feat =3D~ /CharConv/i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; # TLS-SRP enabled<br>
&gt; +--<br>
&gt; +2.35.6<br>
&gt; diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-su=
pport/curl/curl_8.7.1.bb<br>
&gt; index 8e39d821626..7d55f72b03f 100644<br>
&gt; --- a/meta/recipes-support/curl/curl_8.7.1.bb<br>
&gt; +++ b/meta/recipes-support/curl/curl_8.7.1.bb<br>
&gt; @@ -41,6 +41,7 @@ SRC_URI =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-5545.patch">f=
ile://CVE-2026-5545.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-6253.patch">f=
ile://CVE-2026-6253.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-6429.patch">f=
ile://CVE-2026-6429.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-7168.patch">file://CVE-=
2026-7168.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI:append:class-nativesdk =3D &quot; \<br>
<br>
I'll have to drop this patch too because it doesn't apply anymore without <=
br>
the previous patch of the series (curl: fix CVE-2026-6429) which cause some=
 <br>
ptest faillures.<br>
<br>
-- <br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY5PR11MB61874A2D5CEB59C424C1880BC4A02CY5PR11MB6187namp_--

