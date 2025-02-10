Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A10C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:05:11 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web11.56891.1739207105863663949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 09:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=hQGLmZEC;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8065; q=dns/txt; s=iport;
  t=1739207105; x=1740416705;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=CHTW3D8JG88pi9jvGfclmXi6wQIvL2DUxKxRTFwtHLg=;
  b=hQGLmZEC1ih2JzheuPa+S8BfSY1gYBmHYgG798ssHp8z7pwKkMEotnXN
   rvLO92xByM99gDdpYHAJD5Ln70dTUKVM3t9kenCsHdTeqHkReHyaVN4to
   N7tp61Ci6nu1WhXSoSZhE8KajyZ9HC4lV+SAwMFug45rMu0pQmPIxx7S0
   k=;
X-CSE-ConnectionGUID: 6YzQLu82S32vAVB0Q+nIHw==
X-CSE-MsgGUID: 1/zJ+gssQFyYGzq8U3FjkQ==
X-IPAS-Result: =?us-ascii?q?A0AFAAB9Mapn/5IQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBGgUBAQEBCwGBQDFSB3QCgRxIiCEDhE5fiHeLY4tchlWBJ?=
 =?us-ascii?q?QNWDwEBAQ0CLgEGDwQBAYITgnQCiwMCJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4ThXsNhloBAQEBAwERZxACAQgOAwQBAQEuIAcKH?=
 =?us-ascii?q?QgCBA4FCBqCYYIcDQcDMQMBpDcBgUACiit4gTSBAd07DYJagUgBiDAeASqBM?=
 =?us-ascii?q?okGJxuCDYFXgmg+gh9CBAGBXzyDV4IvBIIvgW4Bglhnlg2ER4kwUnUiAyYzL?=
 =?us-ascii?q?AFVExcLBwWBKUgDgREjgSMFNEE5AYINaUk6Ag0CNYIefIIrgiCCO4RDhEuFW?=
 =?us-ascii?q?IISgWADAxYTgyF4HIRPHUADC209NxQbBQSBNQWdBgcDEFsBPIQVOF4wgRakB?=
 =?us-ascii?q?YF7oH9xCiiDc4wYjTiBf4YtF4VapHiYfJIKlnoCBAIEBQIPAQEGgWc8gVlwF?=
 =?us-ascii?q?YMiCUkZD44tFohrvzF4AjoCBwsBAQMJkioBAQ?=
IronPort-PHdr: A9a23:N+tK2RambAcD1YyXRIkxwkH/LTAchN3EVzX9orI9gL5IN6O78IunY
 ArU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:XsvZVK3lBAYEQvTIBvbD5Ytwkn2cJEfYwER7XKvMYLTBsI5bpzQPx
 mFNX2iDbPqPMWegLYp3PY+0oBlS7ZLRm4Q2GwRt3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmE4E/watANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU4
 rsen+WFYAX4g2QtajpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUnAkBKkFqrxMWjtQ3
 MIycAlOaDGjmLfjqF67YrEEasULJc3vOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEqojx5nYj/7DLo5m+2pmn7jaBVTqUmeouw85G27IAlZi+GzaYqOJYPQLSlTth/ft
 ECF8H/iOz8LBfON0Gq4qVyuhdaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXN9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:vFKEPaxgHvbaiXgSPheKKrPxbOgkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYY72KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eAQ2SS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfZvln6LQ1hSRMK9AXUOQujEoPP2tL+OW3Q7Li9iwjOjyRez5pDHMzXw5HojujV0rosKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMotJ9EEStti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2COpwf30QWI6kds15ai8y7bvZLQm728eNsIMbsHuWufSGqe16MUhqA47E
 uM5RPBi3MYN2KZoM233am5a/gjrDvGnZNlq59Ts5SaOrFuMoO4auckjRho+JtsJlOJ1Kk3VO
 ZpF83S//BQbBeTaG3YpHBmxJi2Um00BQrueDlJhiW56UkfoJlC9TpS+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBUukChPfHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTceOwJpI+BbQR3jVZ0Wh9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRtbWXv
 6iUagmSsML7VGeb7qh8zeOLKW6c0NuJfH9kuxLL26zng==
X-Talos-CUID: 9a23:GqvKwmFJqFVrm7YyqmI5xVwtPt11KEaGlmn5HWXgMCVvaZ2KHAo=
X-Talos-MUID: 9a23:sl3HEAr7Xc4jN4S7tEYez2glJuUr7L+1MW4coLoUopm5bgJyOA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Feb 2025 17:05:05 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id F156C1800022F
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 17:05:04 +0000 (GMT)
X-CSE-ConnectionGUID: 6/mg50qBSaqeHrOnJToptQ==
X-CSE-MsgGUID: YuNnXMNESQW6EOBCwUWvUw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.13,275,1732579200"; 
   d="scan'208,217";a="47144813"
Received: from mail-dm6nam10lp2048.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.48])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Feb 2025 17:05:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmemVxImKCtlckjqe3TuqQSRRpqSpcc/FhDaXqa/Xk+HZnl4Ylyr057hGcvkCgKgNW0zB6pzW2jceH4G/fEgEeHT6/cfLJoCi/QpLgRUL8ZC53hs+9wOSkwSs8keleLCesWvepWuEh4Yr9ki5pOO+NChwT2Njea6ibnbgQnTyGfCdHdUQ0zQSrUYzENHE43Fy67r99VIcz6WBYqbJ0yhH+TcIsYB+Zqh8Aqz6uStuL2tI2MK6iMTPgHbooUaG/LZSS8wDZjjckzCRDMQho+sTKKCRhaj7aIiXwkmubNeAtvFFA10R0iEnXALEdm8D8otTo9SOToCvpmSBb/nLEepZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHTW3D8JG88pi9jvGfclmXi6wQIvL2DUxKxRTFwtHLg=;
 b=uBUTdOmIpAJDjRgxEYGzMdBq3VEgPJaX7zBzHGXUd2+Q2cv4MVGXI65db7Rnl7DDCgeyzDt0YRWbKVz6KOXpFqAb2AiQmx5MYi26gRJXVDt361UZVWL6Q69Ffv38YtKDMeoroVdlpPMRszEERfsAmBx8TCaDZeA32VwBBOH6LjVLo/WzaCCuTLcDdeIE84tCH8WCeL9I/BSa9bQtOoZhr/fxEytp2Cpn7GnOu0W1x8/0DzXQrL9WfUnEoHcXO0Atz/J73NLYSF0h2RoRP13k8rA1Pl7RLUEf3YOqnDQCZC4Y8Gwc6wg8XvnfZRXkfqmg1IHVU4GVBlzuaD2cFaZ37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:05:01 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:05:01 +0000
From: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: AQHbeKZRchNZZrPMpUmlkztBmF+albNAcbkAgAABw6+AAALQAIAATwug
Date: Mon, 10 Feb 2025 17:05:01 +0000
Message-ID: 
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4902:EE_|PH0PR11MB4853:EE_
x-ms-office365-filtering-correlation-id: fa68af68-b04f-49c4-9507-08dd49f50e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018|7053199007|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?QtbKVWpNKXKIfQcPlreVOvLasqaY/n55mj99RGB5ctcmJoQ4rB3PwpLXxU?=
 =?iso-8859-1?Q?uOiv/hSXJS1Qk/ax6OitxAtlmKskUuPIMQNkbj1fCsqxPhxhZeh0v+LgiV?=
 =?iso-8859-1?Q?aE9zHislanzmDqS+eecJUoP+E3ryy4lb24u2S0N6uqH0tLmAYOxJea5EAR?=
 =?iso-8859-1?Q?Mazew7raYx7cR1vlEbooSEqHvnWLgZMZ2G/MKMYfRd4vdS44Y47zL5YPl3?=
 =?iso-8859-1?Q?muXZpqbfI7+LJPsyzx0Sv30uWB/+RHVZiXwA1ckg8OuvIQeGxjh1rB3p2e?=
 =?iso-8859-1?Q?VLWT/tjg0LmGuwvhnDaf5cTCY+2gg3d/Kp5+g5qlBc2+35OTZ36ARIJDKi?=
 =?iso-8859-1?Q?Jx2Oa4KM4SfXctPO9lTNjWLH1YlcQ92hlWqaPzO+YatpRVNNsbFdKcPM05?=
 =?iso-8859-1?Q?MKi+x4hY2CFACradnmctQSl0+xoP90hv8cD6TkSVbKZ53tkymaJswUNO5e?=
 =?iso-8859-1?Q?t8xznASPBcqkwEhEPzEIZb53bbWV7a67QtrwpP2ts72252Ln8j+KxJpMyi?=
 =?iso-8859-1?Q?eMo3x8o1+8OLhD14vCxC/J2FI3LHzekn7L6tz5oKVu7qRmr6jNY/SJZ+3k?=
 =?iso-8859-1?Q?t+IYXzAdEr6if4CWtnmPJFHzoXZEABwg+3W/jf77RbmWm2JzGBEKhTGjzw?=
 =?iso-8859-1?Q?xEoF9kXrvpPz/eioNJjwsFeNLDthOkd2BRQB7rWdM1xk41iQFlcHJapI1E?=
 =?iso-8859-1?Q?bVQdyooJQuPfqv2BP7Gdhvp6AbtbTDqbfu1hpSUerVD5+XVjuQ94rGvzH1?=
 =?iso-8859-1?Q?f/3uejS1DMki1zAjmt3AIGQBDnxyo/1TTbi7p8uGAkP5Ts4AIrdGz3lSU4?=
 =?iso-8859-1?Q?4W5jMGZvCkXuSzkynla7+g/X/g0ZOpwGoqz7cZzXU0nKyq1F6FpNCRaOeH?=
 =?iso-8859-1?Q?tgz/ExYl3J/5QoBqjUeG5HWXlEj89hKUlMUnLyYGu7Ya0Z7g6p77l97ldL?=
 =?iso-8859-1?Q?jkeTbJXv6NdNFDFOjxmjwRCUGbds0FCCEYta0+toj1LqqruBavNUgsWPXh?=
 =?iso-8859-1?Q?2tjkaxYgq/vOSwyV82OQaUcKLy2AMDHBCZSCQhVayF6eJ2M3Z5GkC9kxyG?=
 =?iso-8859-1?Q?pDju1tHs4CJA7vVQkWOAUSikJ8gl6F3zOOTvp0QBWm8SSukSsQ1Xuk698Z?=
 =?iso-8859-1?Q?UlZk5CtuVqsu/ADYx58czPhsUCQ8lJmhBw/8WsYF00r/dhG46v6UbRSPTl?=
 =?iso-8859-1?Q?bqvA9thTgz3xejFT/6uluf1kmQez6Jm9rP2u70Dx4dvRdspCGOtKyR9dXm?=
 =?iso-8859-1?Q?2wdw7HT36Nvj2OWB1YYXoIh9P2udqCCmwC/0HFSjePXw/+hVy8gSViCmYq?=
 =?iso-8859-1?Q?vVu9jgWNopTqvX9SdJbhjnfkVDB1EdHMoq9PJLDTdEqU5u2nhc8+6yRixa?=
 =?iso-8859-1?Q?C+v+RrI/QRcpzyajxlqSn1cfmmM98JD2Om+qsyH+o4GrwfaO61k6fajRcc?=
 =?iso-8859-1?Q?7hUc7lfVBoaKs3Jxfpvu22s/fUjkraGxzWHavD1SLZb9kAVbaL1tTG+SEd?=
 =?iso-8859-1?Q?4a7NH+8iVdy6Mu0mNMjN9r?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KFZD+Dzrnltjvx4xmSwTGrF0k3iVDd2b5xCX35aIcjmpr0q+mSQE4XlGJv?=
 =?iso-8859-1?Q?J+SXnieOMEiw5XeJUlqA7jbD2B6qS0oWitTut//+FNDpLp0jmee9cuT0BE?=
 =?iso-8859-1?Q?ltKpXZZtnFlkQAbIuEufirThF6GZq1ABNKEKLHRR3He+uH+99mVolkJo7e?=
 =?iso-8859-1?Q?bmO7wrT4/p7GI1e/fQrt36W+05g1jGoc4KJewiLQJ6v+J4nWeT+VZFVxzY?=
 =?iso-8859-1?Q?xqxiCS+fDk20/Xkebalqte97evODFcjqzzpCGIH3dc2xEwiED7AsA94Fhr?=
 =?iso-8859-1?Q?EBmHAkKMQ+M0HyjhyUOBh4alnOP+vSyW7fis0PbqQ+IS9tnlF5sWsrx4sS?=
 =?iso-8859-1?Q?IXTXgMs0/Eepn2oA6pduXRRkR3+lBIaJBHB74uH+2g76PO86B+TMmIedPn?=
 =?iso-8859-1?Q?RPXaq0FgQ0U9OM6gmqbA+N9jZB1bTmXjZ2gPYf4SMuBmnmzPbU0LeVszyV?=
 =?iso-8859-1?Q?nC//FLQwZ4O2JwZlxSSBZwjH50upcoWrxjqdVJn5+Pv5Q+MTvq0JUdv3Cb?=
 =?iso-8859-1?Q?rtt3MNMZko3nCWNYvSYX9lk9VKorbYy226lbLLmUbdEKepGdnP/i+M/moG?=
 =?iso-8859-1?Q?k+/YfAAhd0ofVWcyVHlf1JOn435nPo7Y8N/RxKTcP6lHs5V27/BL8TkAeo?=
 =?iso-8859-1?Q?gIit+EPz2l5QOUcdciTmEKjJ2kwRwCjR6892iLyCXgB4xHkSROG3RqpBOT?=
 =?iso-8859-1?Q?ocLa81UwkR4ghNNYFo5L4TtYYypkiFJSYUtzhGTC/x9bwuoc35upARv93M?=
 =?iso-8859-1?Q?XJuT+RRQ6dpqLUioUUgMXNmIFQfri+eFCTnELMZr03gHokmM2Nwk0c3E/3?=
 =?iso-8859-1?Q?maf/FL6ptRovEP7FAWER9vPLrqknO87UmU1IgWV7bq9t4vw1zN58h0n1Lw?=
 =?iso-8859-1?Q?9Eu5tDn6iM8R/7ymoyj21IhdMk9PXy145Z9cLa/RuT3XgNtrzkeOvXbNTr?=
 =?iso-8859-1?Q?xVXCCJpMxu8WfAnx3UUdsJey8T52KePyMHkHZxxIYumEqB6P0k+IH1FdU8?=
 =?iso-8859-1?Q?vT83iK0Db3++58a+IWbVyivGa7mjY9xj1WwNAakWXxD3lCBc21tYzid5ek?=
 =?iso-8859-1?Q?OixRU214if5+ZoasbPYEB7bcZc5YMESV22dGaFD8VwrHl/GiCdGuWShHIr?=
 =?iso-8859-1?Q?syLl37uf3iBgY9pF1V6zW3P2Ou8rUusTyn9sYFChGEB1FuQDOmaK7K2k+j?=
 =?iso-8859-1?Q?6j1a4XK5BWkp6NS/Mc/UyDGplKiTy5qCASxt295jakwL5IvlGGP5dsG9EM?=
 =?iso-8859-1?Q?PPjnFbkJcsaav699M08PxXR95socMp1g7fj0kAJyIImdgkYrjWydZIYQAj?=
 =?iso-8859-1?Q?4c/lnOq2PttD2Nl7IVPo5m1zv3Ck8+kEwkB++/z3LWvOPMmSz8WtaF3oRd?=
 =?iso-8859-1?Q?PGNUp+vRIASOb5ViIFewebQ7+l0XDifnOEPPC/0R+zfTM5fU+2krU/jTZ6?=
 =?iso-8859-1?Q?KFt8bbcSTJuttOr6qIP6986sz/5NFGYr6Nbr+OHs6CQiRShy0cvK1oTuqq?=
 =?iso-8859-1?Q?k/OsQALXMTX9JlfzoGZelySdTyGMOJFc3J/klKv6G4H6siQ2+nY7pRFC66?=
 =?iso-8859-1?Q?oTaG0T3eBGhEizh8zDodirV2olglDC6hpb2pRPZ7Xcx5FcS00eou+c2uCj?=
 =?iso-8859-1?Q?LjdFRdnYNArCDXm3IATiz2Moe7+qa7JaItDQXykYYSUcsl/z9gdZ5fWv9+?=
 =?iso-8859-1?Q?/l6n0IRLfEEBBqc+/kHYKZ21FzRjuO3BDko2mE15?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB49027CBF82294C3F722688C0D7F22PH0PR11MB4902namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa68af68-b04f-49c4-9507-08dd49f50e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 17:05:01.3547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7RpNrP1InVYQ7vMfJBLAoAKF6TeEusoyA1M+FnxymUHqBUvSKdb1DPmPwTPLPnTdlvVWi1GCZvqR0300J6Dtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 17:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211106

--_000_PH0PR11MB49027CBF82294C3F722688C0D7F22PH0PR11MB4902namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

By 'deploying whole systemd' I mean next:

  *
Every component copy and installs packages with libraries, utilities and co=
nfig files in component local sysroot, i.e. directory used to create final =
component image:
     *
libsystemd0_255.4
     *
libsystemd-shared_255.4
     *
systemd_255.4

So, on disk we have duplication of files for every component that depend on=
 the systemctl.
In case of separate subpackage we have one root component depend on the sys=
temd and all other components will contain only systemd-systemctl package c=
ontent.

Of course, I understand it's quite a specific scenario.

Regards,
Oleksiy

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, February 10, 2025 13:03
To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@c=
isco.com>
Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-core@lists.openembedded=
.org <openembedded-core@lists.openembedded.org>; Ruslan Bilovol (rbilovol) =
<rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate =
subpackage

On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
wrote:
> We have next situation:
> - a lot of software components that depend on packages and deploy all pac=
kages they depend on locally inside component.
> - some components directly depend on systemctl only (e.g. this binary use=
d in scripts), so for every component we have to deploy whole systemd local=
ly.
> - finally, all/some of those components will be merged in some way and wi=
ll use systemd/libsystemd, but until then it will be nice to get rid of suc=
h duplication.

I'm sorry, but this does not quite make sense. You need to more
specifically describe what 'deploying whole systemd' means, and why is
that problematic.

Alex

--_000_PH0PR11MB49027CBF82294C3F722688C0D7F22PH0PR11MB4902namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Alexander,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
By 'deploying whole systemd'&nbsp;I mean next:</div>
<ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;u=
norderedStyleType&quot;:2}">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); list-s=
tyle-type: &quot;- &quot;;">
<div class=3D"elementToProof">Every component copy and installs packages wi=
th libraries, utilities and config files in component local sysroot, i.e. d=
irectory used to create final component image:</div>
</li><ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" s=
tyle=3D"list-style-type: circle;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof">libsystemd0_255.4</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px;">libsystemd-shared_255.4</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof">systemd_255.4</div>
</li></ul>
</ul>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
So, on disk we have duplication of files for every component that depend on=
&nbsp;the systemctl.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
In case of separate subpackage we have one root component depend on&nbsp;th=
e systemd and all other components will contain only systemd-systemctl pack=
age content.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Of course, I understand it's quite a specific scenario.</div>
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
Oleksiy</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Monday, February 10, 2025 13:03<br>
<b>To:</b>&nbsp;Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)=
 &lt;oobitots@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@=
lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;; Ru=
slan Bilovol (rbilovol) &lt;rbilovol@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] systemd: move systemctl utility =
to separate subpackage</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">On Mon, 10 Feb 202=
5 at 13:01, Oleksiy Obitotskyy via<br>
lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openembedded.org&gt;<=
br>
wrote:<br>
&gt; We have next situation:<br>
&gt; - a lot of software components that depend on packages and deploy all =
packages they depend on locally inside component.<br>
&gt; - some components directly depend on systemctl only (e.g. this binary =
used in scripts), so for every component we have to deploy whole systemd lo=
cally.<br>
&gt; - finally, all/some of those components will be merged in some way and=
 will use systemd/libsystemd, but until then it will be nice to get rid of =
such duplication.<br>
<br>
I'm sorry, but this does not quite make sense. You need to more<br>
specifically describe what 'deploying whole systemd' means, and why is<br>
that problematic.<br>
<br>
Alex</div>
</body>
</html>

--_000_PH0PR11MB49027CBF82294C3F722688C0D7F22PH0PR11MB4902namp_--

