Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559F2C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 06:09:27 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31320.1769062161142973943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 22:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZZvbKagU;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14303; q=dns/txt;
  s=iport01; t=1769062161; x=1770271761;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ve0B8HNNwoISmscSmaUViEZMBRWHDY8CwOPulIa8/mA=;
  b=ZZvbKagUJRIgESJ1xBVnRu83OkL09q1oHoMR8+hmhBXB8IDQatA4poLc
   7BykMfSqHPeSFpJSFND4xmGFMX4v813IQ7iN+E6if4LaM5YH4gpAMgP7U
   0FxgT5jYyWzS0xeWF8/d9/JACZYY6+xOnKFZ2mqqNst5M+jm9l7HrJtO1
   jnVll0TJ0wLUlW+AF9K99ao3LPNLdWBTawhnQs0240Kh7g0phAaQviv75
   rjZrGV81JBWxzIeTEih7PsnCGw/XshFlDvlE9vn4/n/Oe1WZR4jWHNktw
   lE5i7m0HtaV3Vj3a+0HT3ueBMMWZ/NwKMlNmc10Vp1agtNfnskz35IuJm
   g==;
X-CSE-ConnectionGUID: gb+LkncRSBmQHYvfo7KNxw==
X-CSE-MsgGUID: 0mqkCIdkSPWc73Tl/QIj7Q==
X-IPAS-Result: =?us-ascii?q?A0CcAwA0vnFp/5X/Ja1agQklgSuBPQEwUwd+AoEPEkmII?=
 =?us-ascii?q?wOFLIh5A5dDhleBfw8BAQENAi4BDhQEAQGFBwKNBwImNAkOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGFQgyDYZaAQEBAQECARFnEAIBC?=
 =?us-ascii?q?BEEAQEBLicKHQgCBAENBQgagmGCHRZAAwECDgajLwGBQAKKK3iBNIEBg2gBR?=
 =?us-ascii?q?NwBFQWBM4U7gxcBASqBNIJagR4QCYR4JxsbgXKBFEOCaD6CYQMCgTQrJBiDV?=
 =?us-ascii?q?4IvBIEOgRR6FB2LUIEJgSKFeVJyIgMmMywBVRMXCwcFgSMQMwMqLy0jSwUtH?=
 =?us-ascii?q?XAMJxIPHRcTH1gbBwUTI1MGGwYcEgIDAQICOlMMgXUCAgICghB7ggEPhwWBA?=
 =?us-ascii?q?AUubxoOIgIsFX4DC209NwYOGwMEgTUFjiJbRYF6LghzRk8LDAsKEYEgEwkCB?=
 =?us-ascii?q?KJqjl+VFwoog3SMHo0+iDIXhASBV6UQmQYigjamPgIEAgQFAhABAQaBaDwrG?=
 =?us-ascii?q?4ETcBU7gmcJSRkPh36GYYhVwF94AjoCBwsBAQMJhkiLIoF9AQE?=
IronPort-PHdr: A9a23:C9OBfBCG75fwmp7+9U2FUyQVXRdPi9zP1kY9454jjfdJaqu8us6kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:myi0LKslF5M1DHrLa1/gQB1JwOfnVA9fMUV32f8akzHdYApBsoF/q
 tZmKWmGa6qCYmWhf9wgaYzg9BgEvsCGxtBrHQNv/iAwHyhDgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/vZ8ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw9ew0JWJI/
 sYjAjU0TiGdieXp45SrVbw57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKJIYLVG5kPzhjwS
 mTup2HgATo7ON+k8QWOrSmQgqj2vCGkYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:zShn6a1rX4F1TqAUQC9sNQqjBfRxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K690cm7LU819fZOkO8s1MSZLXjbUQqTXc9fBOTZskfd8kHFh4pgPO
 JbAtdD4b7LfBlHZKTBkXSF+r8bqbHtntHL9ILjJjVWPH1Xgspbnn5E43OgYzZLrX59dOIE/f
 Snl616ThObCAcqR/X+LEMoG8LEoNrGno/nZxkpOz4LgTPlsRqYrJTBP1y9xBkxbxNjqI1OzY
 HCqWPEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwiy6zDb4RGIGqjXQQmqWC+VwqmN
 7Dr1MLJMJo8U7ceWmzvF/ExxTg6jAz8HXvoGXow0cL4PaJAQ7SOfAxwr6xQSGprXbIe+sMiZ
 6j6ljp86a/yymwxBgVqeK4DC2C3XDE0UbK2dRj/UC3F7FuKIO4aeckjR5o+FBqJlOh1Ggqfd
 Meef309bJYd0iXYGveuXQqyNuwXm4rFhPDWUQavNeJugIm0UyR4nFoj/D3pE1wvq4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRC/fZt3dE7lutry+vE49euqcJsHwN87n4
 nASkpRsSo3d1j1AcOD0ZVX+lTGQXm7Xz7q1sZCjqIJ9oHUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZMD/rqPQLVaM50Ns3FKtBvwFUlIbsoU4wAKiazS+rwW/rXitA=
X-Talos-CUID: 9a23:yBTkB2DqoUCDziL6EyZtt2oXHMsfSVfY9VfhPUG/VkVPWKLAHA==
X-Talos-MUID: 9a23:d09s+AofHoZXLLv86ugez2lnLcRDwqitM3gymspdh83DDA1yZA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jan 2026 06:09:20 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id EFFA6180001CE
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 06:09:19 +0000 (GMT)
X-CSE-ConnectionGUID: g4ZFD87CSKyXFpFJ/pATdg==
X-CSE-MsgGUID: Gn5buIOhTY+ifTY5LWr8sA==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,245,1763424000"; 
   d="scan'208,217";a="38281995"
Received: from mail-byapr08cu00301.outbound.protection.outlook.com (HELO BYAPR08CU003.outbound.protection.outlook.com) ([40.93.1.105])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jan 2026 06:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xi+keWQfGph6ft/lMN+dov/d/dl2yNyOVKHWKg1sKT5N5sD7jfEN8Si6aSI1T4beBJU8T92xmnQ7Wq/9s8CkbQNTtvdP+tG/YO+s1b+P2pn0VbeoIv1t0ELg3pNo8g9Zk30n6BNpD2w16+GXwiuX+l7Bdv2alOq6tjRo7UQUqo7iqeYsDdXdf2FMrQWyifw6IueADXk0peTwAarDY8FVwepHQI+vV1w3PMXnqbsvv4hcGSIJCITOkI7pIRhFN8AGf8WF/v/Hte3TxycoqNAcF3b7WjCIM+EdptPCy6k6Jf4/EWvQKxFzQ20VeoKQINfJUQYT1Fc4n+NZDCsSMilB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve0B8HNNwoISmscSmaUViEZMBRWHDY8CwOPulIa8/mA=;
 b=DvqimZWKZicDOhWbJmU3YFHOsx8AKtcPUvssF8Di2jOr4UlUrH8oKYonyfhOXBUmeNo7epYoh5SKEEnx+sAHtWPF2/PDtuCNv26lPyf7zGoa4CszIYgGTqH7PDRz4O05yk6qym9T6M5bnk+G4+/05ukRttm6Si7SQuyy04X8E/1cqwbxiFpwvAkqsX0Y02hyNbEwOpTV525spAXnQ76lRHo5sXj14XXYp/Z5UsqymRPDzp2TBDzo6zvP20PnZ4AW5iEvYB7fcuJlzxla30KVULAJup9Jlndq/r8voapY3eMgHwjgdjObLKn8JE0PUJZroA14ryJMrxGpbIJIKgdnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 06:09:17 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::f6a0:8764:5448:20be]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::f6a0:8764:5448:20be%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 06:09:17 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [PATCH v2] cve-update-nvd2-native: Use maximum CVSS
 score from all sources
Thread-Topic: [OE-core] [PATCH v2] cve-update-nvd2-native: Use maximum CVSS
 score from all sources
Thread-Index: AQHcir3ujDsgyhkhxEyX/Vw3aUZKsLVctBMAgAD+r54=
Date: Thu, 22 Jan 2026 06:09:17 +0000
Message-ID: 
 <DS0PR11MB7405DA2A53CA1A349B1E78DCDC97A@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <20260121100832.448281-1-hetpat@cisco.com>
 <a0397d55c2a7d9f21a237817c62d48a198ff913d.camel@pbarker.dev>
In-Reply-To: <a0397d55c2a7d9f21a237817c62d48a198ff913d.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|PH7PR11MB6378:EE_
x-ms-office365-filtering-correlation-id: f9d8e9dc-6e85-4f81-9398-08de597cc664
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?uj83cFTnnc6ytj+F7zw9TyegUaNZT9wfe3ognHyOlj5HybiHcChK8kBt?=
 =?Windows-1252?Q?x6F19fB8MQMW3k99nvx+NCGQBqXq2a4FLXRuE6IrzFpRR/8e3odmb6Yn?=
 =?Windows-1252?Q?t8FNSOUUzmPvK6Sof8+1lphVyWvivGhgeRuV+rz5EUt8b/RPIf9LiGAU?=
 =?Windows-1252?Q?gb8SrWO59VB2NMJN8hQ6D7p7wznvquXjTJhsZDo3UChjNUFNCxDCR6Gs?=
 =?Windows-1252?Q?PW+AUya+1SnNImcZWy4vZ5BzR6sXdo/BtiKmTN5R+F6aNN6I084LNNzE?=
 =?Windows-1252?Q?L+PLHAIeaeBSU+rlOSe19hCGu3TIDjAK8n/cUIvBEzJY0fSPx/ubbk+l?=
 =?Windows-1252?Q?hmY2IgKodrfkgiPLX6zZGEr+ujHHoyExdTQNSsHXb+xxGrXGrW7wlKAY?=
 =?Windows-1252?Q?1T1MrGEZOdcfX+tpXLjg8ov+byoNQIta1F3A83Je6980Jzxaj6sxFIYd?=
 =?Windows-1252?Q?fcHuNrxLxuFI5VJFDwPM0y13k+UW9KQqJQarbEJGM4x/O+3NdJutCJhz?=
 =?Windows-1252?Q?KizcSEyLEjvNSN7CERjW6kH3pit+RooQ9kTc4mUWatcfvHEiAdJ59d8z?=
 =?Windows-1252?Q?qL5VECq0hEeIO8gE6TIU07fyR5hHygA6GdMC+ne2rgrVcRpoCoR6cfZY?=
 =?Windows-1252?Q?NlQkjSS4wT2igTRoKTMhgkWoYP6XcjB0FjcHB+kfZEBC5raEhyB8ENc6?=
 =?Windows-1252?Q?0phDUiOeNvwYK/Wim7o9LWFR62BaGJ0Qk6FZS/B8C1L1EfdxMpzwH8ew?=
 =?Windows-1252?Q?ph8GAZEhmGIXMg2iupYsPcsMPri1deP5ALLI7MyuFqjUUgHHDJMJlR44?=
 =?Windows-1252?Q?Buhnbfyu6GQcU/27Y2amEPBbUuwwBsQPeRRbXxpt5sMyi3G292eEOktv?=
 =?Windows-1252?Q?P3QlMVGKX1VG+kBo0XtfUebrW+AhiAhhmB842Q6KShpdaJgJ6iIk7WRB?=
 =?Windows-1252?Q?6O23vJRmjCmYEw7fhSLNDroQkrrlBh/tgd/6LdyQbM+A+3fSuAU6NZ91?=
 =?Windows-1252?Q?1g5vuWrv9NGDFxxr6Ts7rRE7d2gLbhir8pCY1jVViCzQVQ31Ft/L4Mnf?=
 =?Windows-1252?Q?paVCyXLHaT5ACrjRqLr7b2dyqHKfPWsTbn0qpTCIQ4tzROBqLABVY9yh?=
 =?Windows-1252?Q?vx/Isq7jSjz+sEPHEcMvjmbBHmorMQPhktlqDdjBA8SzYMGEddiDkiYS?=
 =?Windows-1252?Q?JEzil1bESK69PEWXOJnHcMhAJF7f+8JzeYBb9/4O9y+fVVyQdhSelDZ4?=
 =?Windows-1252?Q?y6wxo1c9G/qrf62FZlUW0PgYuir1rC90PDJBOfRwkAH8eqyDz42n7enm?=
 =?Windows-1252?Q?oVxZ0hGzhvU7rsjbTtbn9Ny1aFK4x0M5B2LoT1XWil/t8yzA2auXJOas?=
 =?Windows-1252?Q?ur7Z8SPpfzE6UxNEnIiJnVGqjXGlof8z8KeAeEgY+H80k/HDyjDfHa1R?=
 =?Windows-1252?Q?dQNqfPGoIIXZfe0fxDa64BSf4wG9m1K/Bp0Wf10BlSfhyCkLgWwMng9K?=
 =?Windows-1252?Q?zXS1QclldGIsnN50WwpfU08L5H7FGBs3s1wDl/LNy5SADfHTYZBLN/QG?=
 =?Windows-1252?Q?pz1UlEcvFphYDjoLGNJPTEKIW/A36ywcOsm5ntDy1+IlE5ajc3Q1T0Ma?=
 =?Windows-1252?Q?N18RfGMAbaRikUtlHso10bFlzHIpfMSsMSqvAktnYR0IRN/FgcsJTuWt?=
 =?Windows-1252?Q?Mm2PHGAeKHvE4SAWnHqKHUScOy2nul5dwiPF4kf+oUiICWjwbzGQU3gI?=
 =?Windows-1252?Q?iTg+nrn90MJMGPRBkdI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?Bsfa7B7mq+c3WPJLNHUswxamyS8F40nno/8hUVV1s5t7sOsUOZXCsgX5?=
 =?Windows-1252?Q?qn7kBG26zSSc/V1XMQPh/Mmj0ZFaHqSNW3inIO5i9pv8o0dokOJ4y9gX?=
 =?Windows-1252?Q?SQ5xc2iHuchyvv87uI82UPDAZofJEwBGYxquww/u7kUI33ikjpBGOL0m?=
 =?Windows-1252?Q?th1DEkWTRhH3By5J+M3YzXKxQ06Pm0H2x+ZN9R16zd9EFdyZydDGbS5g?=
 =?Windows-1252?Q?tGN1gBKsMcX7iRzo4Y9cti18KmBYLmbfNn/6E4CVd/7tnWMInnigL8Ij?=
 =?Windows-1252?Q?oA7gEzAyffSUjgRuUt+f0YG2zNkj3qc6B/I20R9qIoRro8soVeXanlzH?=
 =?Windows-1252?Q?/sBB3D9ZwTIhF/pXkmzmL1YBrPiwudbSn5GSTRJznzNfJ/cWuh6zOz+h?=
 =?Windows-1252?Q?bzdE56Ro+s7TzKL1GZ85aud7aLp3D2OIve3RIQ+T5ykGVePxk+Z2RfAC?=
 =?Windows-1252?Q?dF/0N2KhmEmg31skD9w8iPKFiREiPXDE0Palg/u7Cg2U/oGFZl7bTJxb?=
 =?Windows-1252?Q?QCLcLbt9Xo16pb/CK/alIaNHvdwboUSe+Wx/I6rtac316fQntGfLb5sW?=
 =?Windows-1252?Q?gXawZL3aCtVmBqtRFKeouR1a/Iqih+v9PJYAnjKPsuShgODXbsdpyTbk?=
 =?Windows-1252?Q?0oPDrFE2ewIxWmsjEGm1Ej9VHEqZ/iO/AV4izq7wZ/m8HAsEGlCn1q95?=
 =?Windows-1252?Q?Kcw0svcx1x9MZNp8a1g54kU+Ke8uYBeR+fsqxUxFnjY6HVNMBUNU6GA4?=
 =?Windows-1252?Q?CZGOBU0/GeP0fl5o+R4Ytcf9YEcIAwYvv95q9sajt1MJyX3KfNaSKuxX?=
 =?Windows-1252?Q?DjrwDht6crF1LWXuwHIPkySYPNHpffBgqiL1qKv/avDXkNzqqZLgH1T0?=
 =?Windows-1252?Q?sQ1TdOyCNZcmjQhNibmcysbowJLni0hxyOlM1h7FdlrtQJGTqEYKc4Qn?=
 =?Windows-1252?Q?RfGRIAzaojrRbRc4ubWyWT7sLT1h00P8bq20slXOqA+lmAaSuZJ58CQ4?=
 =?Windows-1252?Q?JVDRQ8uVbKlbS6IDiahQG+s8FbDTOEl+wEHVSZkwRehaL0aZP4wRx6e3?=
 =?Windows-1252?Q?nYjQrR2FRuCfYTUWfP0zAv/uF1HxDoDPictyg/pHZAV0vIfFKP6sHOpJ?=
 =?Windows-1252?Q?hDRulqDQurKt4n0UTeVyGW7q0jHbq7yM2gZrxW/acoAMEFT8TZRySvZC?=
 =?Windows-1252?Q?BrGjLymILft63b61YkWYIvLEkThpInepyT36KzlZTLvg69/0UGvB4ZRQ?=
 =?Windows-1252?Q?WeNGhPh+aVpwAxYdCozm4Br53Oo608pDbqdlyc6BbHxDYPWmD3e25zHN?=
 =?Windows-1252?Q?zZo6+nLuzDqX67DiY4w3vgsC1bb8plzUHj9ApK1LK6I+izglUqpo6AnD?=
 =?Windows-1252?Q?Wx/g/GQC4c4EH6+8Pmq24NXlt65AH4WSmvm95oO+HHQEp37vHVrtfqUv?=
 =?Windows-1252?Q?PEOCzNYvdEaTAQ+wiblRE6M2l9zknjLdV91dYLy2DxNdOtAVwuYkCsci?=
 =?Windows-1252?Q?Fbon0g/a3KK24SmQ0uYR1iEC/xQJhUCgmr0H56mhaN5onMmlGPMqte+x?=
 =?Windows-1252?Q?1tm/XobZxHl9myMOKVsCHsSl0QGQBWDxWoq8LgiukasZThd8jsdQND8R?=
 =?Windows-1252?Q?SfEV27udDTQ8T0T3ayy6wGYrs9XKef4UuZnm072e1ag8iI2dyTEqjzon?=
 =?Windows-1252?Q?YsgMCYl2l/41jCJRj95QmuFLeo9yxvIt4KHO18CE70J/MoRSpHl3WDtj?=
 =?Windows-1252?Q?V9FEYTNJUMAeKi+NA1qumMFsC700kM7ZZYqe4Ipixg4yq75x2CMra6Q7?=
 =?Windows-1252?Q?3JX7uBNIVQxvHFfGOOhZrOKP1OL5P77abQX45EWDcApa8CV1?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7405DA2A53CA1A349B1E78DCDC97ADS0PR11MB7405namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d8e9dc-6e85-4f81-9398-08de597cc664
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 06:09:17.2259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMvwMNNaDDnoHS34GvreWU6fTBB9J+k6ktboz15+87wMvh9yu+hvliXtGzrfwlO5bx209n7eaOb1pyEpb88lag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 06:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229833

--_000_DS0PR11MB7405DA2A53CA1A349B1E78DCDC97ADS0PR11MB7405namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the feedback. The following justifications, derived from offi=
cial CVSS guidance and NVD standards, clarify why selecting the maximum sco=
re is the appropriate approach.

The National Vulnerability Database (NVD) often provides multiple scores fo=
r a single CVE. These are categorized as "Primary" (NVD=92s own analysis) a=
nd "Secondary" (provided by vendors or other organizations). Because differ=
ent sources may interpret the vulnerability=92s impact differently based on=
 product-specific contexts or information availability, these scores freque=
ntly diverge.
According to official documentation from FIRST (Forum of Incident Response =
and Security Teams), the governing body for CVSS, the "reasonable worst-cas=
e" assessment is the standard when multiple valid scores exist:


  1.
CVSS v4.0 User Guide: The guidance explicitly states: "In situations where =
multiple CVSS-B scores are applicable but only one is provided, the highest=
 CVSS-B score must be utilized."


  1.
CVSS SIG (Special Interest Group): Historical guidance from the CVSS SIG re=
commends generating a score for each potential exploitation path and "assig=
ning the vulnerability the highest of these scores."


  1.
Risk Assessment Principle: While CVSS v3.1 and v4.0 emphasize that the Base=
 Score represents intrinsic characteristics, the standard practice for auto=
mated scanners and reporting tools is to report the highest severity to ens=
ure that users are alerted to the maximum potential risk before they apply =
their own environmental or temporal filters.

By iterating through all sources and selecting the maximum score, we ensure=
 that the cve-check system does not inadvertently report a lower score that=
 might mask the actual severity of the vulnerability.

References:
[1] https://www.first.org/cvss/v4.0/user-guide
[2] https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-06202006.pdf
[3] https://www.first.org/cvss/v3.1/user-guide

Regards.

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Paul Barker <paul@pbarker.dev>
Sent: Wednesday, January 21, 2026 8:16 PM
To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@ci=
sco.com>; openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [PATCH v2] cve-update-nvd2-native: Use maximum CVSS =
score from all sources

On Wed, 2026-01-21 at 02:08 -0800, Het Patel via lists.openembedded.org
wrote:
> From: Het Patel <hetpat@cisco.com>
>
> The CVE check system was incorrectly reporting lower CVSS scores when
> multiple scoring sources were available in the NVD database. This
> occurred because the code only extracted the first element from the
> CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
> source with a lower score instead of the Primary source with the
> actual severity score.
>
> This fix iterates through all available sources and takes the maximum
> CVSS score to ensure the highest severity is reported.
>
> Fixes [YOCTO #15931]
>
> Signed-off-by: Het Patel <hetpat@cisco.com>

Het,

Thanks for the patch!

Why is the highest CVSS score the correct one to take? I think the
commit message needs updating to answer this or point us to a relevant
reference.

Best regards,

--
Paul Barker


--_000_DS0PR11MB7405DA2A53CA1A349B1E78DCDC97ADS0PR11MB7405namp_
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
<div style=3D"text-align: left; text-indent: 0px; white-space: pre-line; ma=
rgin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cal=
ibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Hi,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; white-space: pre-line; ma=
rgin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cal=
ibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Thank you for the feedback. The following justifications, derived from offi=
cial CVSS guidance&nbsp;and NVD standards, clarify why selecting the maximu=
m score is the appropriate approach.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; white-space: pre-line; ma=
rgin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cal=
ibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
The National Vulnerability Database (NVD) often provides multiple scores fo=
r a single CVE. These are categorized as
<span style=3D"font-weight: bolder;">&quot;Primary&quot;</span>&nbsp;(NVD=
=92s own analysis) and <span style=3D"font-weight: bolder;">
&quot;Secondary&quot;</span>&nbsp;(provided by vendors or other organizatio=
ns). Because different sources may interpret the vulnerability=92s impact d=
ifferently based on product-specific contexts or information availability, =
these scores frequently diverge.</div>
<div style=3D"text-align: left; text-indent: 0px; white-space: pre-line; ma=
rgin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cal=
ibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
According to official documentation from <span style=3D"font-weight: bolder=
;">FIRST (Forum of Incident Response and Security Teams)</span>, the govern=
ing body for CVSS, the &quot;reasonable worst-case&quot; assessment is the =
standard when multiple valid scores exist:</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" start=3D=
"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><span style=3D"font-weight: bolder;">CVSS v4.0 U=
ser Guide:</span>&nbsp;The guidance explicitly states:
<i>&quot;In situations where multiple CVSS-B scores are applicable but only=
 one is provided, the highest CVSS-B score must be utilized.&quot;</i></div=
>
</li></ol>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i><br>
</i></div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" start=3D=
"2">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><span style=3D"font-weight: bolder;">CVSS&nbsp;S=
IG (Special Interest Group):</span>&nbsp;Historical guidance from the CVSS =
SIG recommends generating a score for each potential exploitation path and =
&quot;assigning the vulnerability the highest of these
 scores.&quot;</div>
</li></ol>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" start=3D=
"3">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><span style=3D"font-weight: bolder;">Risk Assess=
ment Principle:</span>&nbsp;While CVSS v3.1 and v4.0 emphasize that the Bas=
e Score represents intrinsic characteristics, the standard practice for aut=
omated scanners and reporting tools is to
 report the highest severity to ensure that users are alerted to the maximu=
m potential risk before they apply their own environmental or temporal filt=
ers.</div>
</li></ol>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; white-space: pre-line; ma=
rgin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cal=
ibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
By iterating through all sources and selecting the maximum score, we ensure=
 that the
<i>cve-check </i>system does not inadvertently report a lower score that mi=
ght mask the actual severity of the vulnerability.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
References:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
[1] <a class=3D"OWAAutoLink" id=3D"OWA22d21dbc-ecf3-071e-f105-e0d20b5ad025"=
 href=3D"https://www.first.org/cvss/v4.0/user-guide">
https://www.first.org/cvss/v4.0/user-guide</a></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
[2] <a class=3D"OWAAutoLink" id=3D"OWAa6f500c9-4370-470c-c280-23a16420702b"=
 href=3D"https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-0620200=
6.pdf">
https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-06202006.pdf</a>=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
[3] <a class=3D"OWAAutoLink" id=3D"OWAcb1e8d92-320b-1c0c-fddd-6811de2e7322"=
 href=3D"https://www.first.org/cvss/v3.1/user-guide">
https://www.first.org/cvss/v3.1/user-guide</a></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Paul Barker &lt;paul@pbarker.dev&gt;<br>
<b>Sent:</b> Wednesday, January 21, 2026 8:16 PM<br>
<b>To:</b> Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt=
;hetpat@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;openemb=
edded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;xe-linux-external@cisco.com&g=
t;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] cve-update-nvd2-native: Use maximu=
m CVSS score from all sources</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2026-01-21 at 02:08 -0800, Het Patel via l=
ists.openembedded.org<br>
wrote:<br>
&gt; From: Het Patel &lt;hetpat@cisco.com&gt;<br>
&gt; <br>
&gt; The CVE check system was incorrectly reporting lower CVSS scores when<=
br>
&gt; multiple scoring sources were available in the NVD database. This<br>
&gt; occurred because the code only extracted the first element from the<br=
>
&gt; CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary<=
br>
&gt; source with a lower score instead of the Primary source with the<br>
&gt; actual severity score.<br>
&gt; <br>
&gt; This fix iterates through all available sources and takes the maximum<=
br>
&gt; CVSS score to ensure the highest severity is reported.<br>
&gt; <br>
&gt; Fixes [YOCTO #15931]<br>
&gt; <br>
&gt; Signed-off-by: Het Patel &lt;hetpat@cisco.com&gt;<br>
<br>
Het,<br>
<br>
Thanks for the patch!<br>
<br>
Why is the highest CVSS score the correct one to take? I think the<br>
commit message needs updating to answer this or point us to a relevant<br>
reference.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB7405DA2A53CA1A349B1E78DCDC97ADS0PR11MB7405namp_--

