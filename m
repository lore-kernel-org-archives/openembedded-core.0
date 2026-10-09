Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB95CA5FED
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 04:32:01 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1179.1791520319272663036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 21:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ToR9wZzD;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13577; q=dns/txt;
  s=iport01; t=1791520319; x=1792729919;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=r/E9jxbnpUuPBJTHyK2Uv6XOXZzK3+byJ/81gOWxhiY=;
  b=ToR9wZzDImfpryEp/aKUK/n+0khBJWGt5tiyyp7ir5k4k/Fkp2uTdWZG
   GFxYBfi2TPbsa+sue9WHX+s+jILLsqU2AOsBvtYSi8vpk1Sa+RgF9tzAQ
   ykQmiU8x/rcYzRH3/RcVrUvmm+yDkYNljWjuzZXvQ4GV+7v7X0HtVLVjs
   dMDTShCdWk7ZV6r9DOGsvUJffYyo0AKo0L4xLHIJneR1RBv7UVeX0JNzK
   vHvF4Q3mQdvT0IPbyMB2nYU6y661L6eyDvu90olAIKRB8BK0X1JoSBm+Q
   zyItQzl/dBXeS+gAik2DyfQ2DoUA1iDTXUwKDoVSxLythPUHRGpxi2rfD
   g==;
X-CSE-ConnectionGUID: fcBxwkvyStKotG+Mqjcg/A==
X-CSE-MsgGUID: fEyHAvZJTyin2QKcyvdKjg==
X-IPAS-Result: =?us-ascii?q?A0CMAgDFbchq/5H/Ja1agS6BK4E9MVMWcwKBERIaL4gjA?=
 =?us-ascii?q?4UrhliCIQOeGoF+DwEBAQ0CLgEVDQQBAYUFAo4RAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBSgE9AgEIEQMBAQEeE?=
 =?us-ascii?q?ScKHQgCBBMIgnuCHRZBAwECDrA8AoodeIE0gQGDCh8BPwJD3AIBCxQBgTiFQ?=
 =?us-ascii?q?IMeAQErgTWCXYEjGAEbhGEnGxuBcoFXgmk+gQWBXAEBAgGBNBMYHoN1gjAEg?=
 =?us-ascii?q?iJ6EhuBP4EDSpJbUnIiAyYzLAFVExcLBwWBI0MDKi8tI0sFLR2BIxIPHRcRH?=
 =?us-ascii?q?lgbBgUSICpBQ12BWjwjGTZ6gQlegSspYQIOF0YuFYIHAoJUgSNdAgFJQQ4HR?=
 =?us-ascii?q?VMJFg8+BRJHJiIIEgkBExowC4EbODwJKEEXDGYOCG09NxUZAwSBNQWQGAdaH?=
 =?us-ascii?q?oJhgQ4BExgEHC8IHIEVNQuicoF8oXsKKIN2jCKNPogyF4QEgVeLPZlXC5h9I?=
 =?us-ascii?q?41nmw4CBAIEBQIQAQEGgWg8gUcLB3AVgyIJShkPkiSBf4IIgQzHBnkCCTIBA?=
 =?us-ascii?q?QcCBw4DC4FokAABJwSBUgEB?=
IronPort-PHdr: A9a23:4z6fMRPkz2gwE0rz7zcl6nc2WUAX0o4cdiYP4ZYhzrVWfbvmotLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:xMJ5DagsUrhqYwsDDTTx66RWX161OREKZh0ujC45NGQN5FlHY01je
 htvXTiAPamPZTSjcop+YYrl/E9Xu8SBxtdmS1dtrSs8RS5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/rT8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUW8cxnHmJQ5
 McECzcRQVOmnuC9z/WSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeMK4XSFJUPxi50o
 ErI0nXZKw8oFuCOyDzfy1Gnl/HDviH0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dbDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:hDKpMa+gtdnfiqlGShduk+HRdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBepTnhAsW9qADnhOBICOgqTPuftWbdyRCVxe1ZnO/fKnjbalHDH41mpO
 hdmspFeafN5DFB5K6QjnjbYrMdKZu8gd2VbIzlvhFQpHRRGtldBnBCe3+m+yNNNW57LKt8Pq
 CxouBAoD2tc2kWaMOUOlkpNtKom/T70LjdTVojHRAI1Cmi5AnE1JfKVzSI1BYXVD1ChYwl7X
 XElALB4KCiueGQyxPX1WPfhq4m1ucJzOEtOOW8zuwubhn8gAehY4psH5eYuioune2p4FE21P
 HRvhYJJa1ImjPsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhLhebgDS5yMbzZJBOe
 NwriCkXqhsfFf9dRfGlp/1vtZR5wyJSE8Z4KsuZrpkINIjgfFq3NQiFQhuYeY99WrBmfAa+a
 9VfYDhzccTV0+GZHbEuWQq6tmtUnMvWiqieCE5y5eoO/w8pgEl86Per/ZvxEvp+P8GOup5zv
 WBPaJymL5USMgKKap7GecaWMOyTnfAWBTWLQupUB/a/Yw8SjvwQqTMkf0IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyok6hlltVEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4M1QzjXJtZL2UYTaQuy5wGckPLptiOJpzht+TdfvqWLL3xESw8Ume6GX
 cHVCibHrQ30qlqYA6OvPH8YQKYRqWkx+MDLEHzxZln9LQw
X-Talos-CUID: 9a23:ZmvdyG6oNAHlCzFPR9ss+kU+Ct8mbGzm0FTXP2D7LH9rQ7LSYArF
X-Talos-MUID: 9a23:b2RAaAYOhD58oeBTuRL9pBh8BuVU8qWoUnkumoQYt+qGOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Oct 2026 04:31:58 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id E50DE180001C2
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Oct 2026 04:31:57 +0000 (GMT)
X-CSE-ConnectionGUID: QGVQRlG/SSCFIkj19746Pg==
X-CSE-MsgGUID: k0Uhm6nPQ1Wr6w3Pov6kvw==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,147,1787011200"; 
   d="scan'208,217";a="70150494"
Received: from mail-westcentralusazon11010048.outbound.protection.outlook.com (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.198.48])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Oct 2026 04:31:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARqdcbYI3hfK8XNOKhFq0lwMjUdZlHm94uFPq5uhnonsdHWu/7jP4LOCYWLoqXVJHIu6d3K9dT092aFFthlnJFbXql6cECG5Z8PrK+/JMwr6Afed/Q4+iZP4Pe/678x+q2BWlJ0pvfXpol5UJXW+Dj81RaiXxO0E4uW5FQkZ6+wke3poaSpNzqQ/YvtWDyBkUu9wqcK04q8b7q+zBVQGVZnIY3FI6psx13zhx8aIDz6VLIKvlFwwxCWcdhEnH0IyY/JBIaqvCM1HT0HZ0SHcAqjiaz0iyNzD1gyr8uxSY7wcuS+SP193y03XFmcfRRzBcA3tSAFyl/sECT1hK3XK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/E9jxbnpUuPBJTHyK2Uv6XOXZzK3+byJ/81gOWxhiY=;
 b=fhTOqxmlwJKJ1S6/5ZHFxADkoT3eGIrzZnGa+OUECATDiqG2YrF2bQ41m4Iy+QGX0GbiwI6hQtXQF/z1YC+OdBqbUuafYXCIj1nAD3Ef0g9PoMeAxvJwXeiEU89hQxhxXx5EzR/AiJ6XXZuFGg3p9b3tSWtigNnV6nUOdqGHUB2JWn6fJ9gI4L2KyP74GAbu3tlbT/33FOz53Jlq3RBR8N5ClHQiQ5WtqWJ/unpNic891Nj6CccgrYm6l4P5vb7u+9zcD5UNyFwJjmUQkwn1DNo/kPSOrj5zpdELDnOb4K4x8iFX3pLunDFGqUrs+E8r0N/qHCaVY7ids6nqt9nq7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 by SJ5PPF06F7EC6B5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::807) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 04:31:55 +0000
Received: from MW3PR11MB4585.namprd11.prod.outlook.com
 ([fe80::f24d:4165:33b5:d7dc]) by MW3PR11MB4585.namprd11.prod.outlook.com
 ([fe80::f24d:4165:33b5:d7dc%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 04:31:55 +0000
From: "Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<yurade@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Yogita Urade -X (yurade - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <yurade@cisco.com>
Subject: Re: [OE-core] [oe][meta-oe][scarthgap][PATCH v2 1/2] hdf5: Fix
 CVE-2026-17573
Thread-Topic: [OE-core] [oe][meta-oe][scarthgap][PATCH v2 1/2] hdf5: Fix
 CVE-2026-17573
Thread-Index: AQHdVjjis7bamfsLPkaaj1Vlc2tXf7b0n9zM
Date: Fri, 9 Oct 2026 04:31:55 +0000
Message-ID: 
 <MW3PR11MB45851E31F32E1F330D3B921CDE922@MW3PR11MB4585.namprd11.prod.outlook.com>
References: <18DC332997E5988A.3163793@lists.openembedded.org>
In-Reply-To: <18DC332997E5988A.3163793@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4585:EE_|SJ5PPF06F7EC6B5:EE_
x-ms-office365-filtering-correlation-id: 182d53c8-e88c-4887-d04f-08df25be3ff5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|13003099007|38070700021|260925021911599003|10067099003|56012099006|11063799006|260925022911599003|260925021311599003|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 WMhWUBUgqcGtKFTksTXydYvIepotUw1tlxKnoztTtmcIcbI2tQ0dlA852iqdhlaBhesoHkKT9OxLn7omkiIH/dqL2HlzF3/etWu8LgJRhSU2KxQ3iBbbmz1UK61eYdBfJDjSC0BaNPFKltouFzozTqby/B8L2okBTBk8TUd+C9AoFxWZ69bXYk6K8bwlcvwwzQTnm6mmClp648YHhm0MG547tAgsP1tH9h/t+S8ArultS/ewT0CPeJztHomMVS5Udl4K8eEsDafSOXV2HZ6GyebG2jzUegCUqfHanO0HlqDBvteA0u0ZUKSs3EdbjDeeFgsdl30eme7sN+GnVr0QaJfm0iLpjyy1mbueHnW773lR4gu58TRk8r0emWrplrcQ219aSex/IHnwgTiHNc2oCZwW31AGFSXFdQfuENied7p0B29BNzc+ezize3/A0QHJOVhSxMowhm63V8OzCo04mAenwcf6dJnc1u2RocPJFXRF+Ezax3AkCjHa2SKJApitWryteRWwwTuptjJ8ygZpZqwl1NPZBWR7Q7gFSuJ2eJkVA31P7Xn7ECJXLFzLCD6YihST15eZI1Vsej3TWvdKvCFbWbEYoNRgF/uH07GjtaVQ3OdoFrB+IYLOvBQ36ZuGrQKMm8LLPlYkYNvTmwCPDuQ6UDo96PvmKlp8w6IvYp3InxAVjxFvSw8L4GgDgu62
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(13003099007)(38070700021)(260925021911599003)(10067099003)(56012099006)(11063799006)(260925022911599003)(260925021311599003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YTgmH4wthY/LxYaggDI2pwUE5lbXF3LV1JzJKWV24nbkLh/Y8gmWSQH4Hg?=
 =?iso-8859-1?Q?HhjxtpSR4oIjd0gxMEjOY42DjQ8/LWcrU+iw4uYy5fusf54E3FWUb0UcPr?=
 =?iso-8859-1?Q?igm/HF/CuXEST1AFqm9Ygpqtv76akMHZzdggdDy9xgl6Em6uYdl+zoeFTW?=
 =?iso-8859-1?Q?L0RBYHcWDiPLzH0gW7yxndwlDZfQtBDjk5sc4p7xIDC+qeAIGY5sljt/W3?=
 =?iso-8859-1?Q?cgmtZ7acGQ+h/QHRdRv0hew/vBPaS9ZpcXaVS4mVxctskmdmy9+mcrVX4V?=
 =?iso-8859-1?Q?aSZqyQGdn5NR67HrOjIYDqiuPlWszu66SvUjcEdOyppiNHWuOfxm4QtAMp?=
 =?iso-8859-1?Q?CleYTXKa9j4fYyaJsOY6FLqioOOWZnyma5ZoFUjMZC1a6k75t/c7ekQMXz?=
 =?iso-8859-1?Q?ns4+mnOHlX6bQl2EgM5SkDzih7yAx8NP8AP0t/KAQE92dWITyXbBsr1CFa?=
 =?iso-8859-1?Q?rWquDed/BcvlsxzbkgYCwcl5ot+AKVmcke3gOPrOcK40kWIsd0pZ4sTqvI?=
 =?iso-8859-1?Q?WkYUGZyIaLjO4GgOZQ4vYcR1Dh8QJAUI3+YMdeCxWfHlnfA5p4J4eCJmyk?=
 =?iso-8859-1?Q?b2Nwr/uqJ/THGkekDG+xi57MoYp8AqeHhIFbfMQuk1cKr5vEeHLSEoxGbx?=
 =?iso-8859-1?Q?JuLqtVcbLnBFVJoDM89Tzn6wfyJuQztPexbkFmRrnJXi1y88L8csyPW3YO?=
 =?iso-8859-1?Q?J4DGvfyfMaVbkrQNOi14oWLYdLoXSgwIoKAkuDmGx6GeaN49QFy40QZb2R?=
 =?iso-8859-1?Q?UBQ0GcPvBUKEHx0AdydaGzJHzC2KRf6yjculOM8W8DFW6ZQ0mikXr4Mk0M?=
 =?iso-8859-1?Q?1/Q2aCyjosOuYloMAvZ1R+NEM/etoRr2JtvbdYc5FGb6+vMJPDqXxskt3q?=
 =?iso-8859-1?Q?SxyB+KvELs3l2cRjuMOsCE+8UW67yiFp77XnDgz8lsN9kVBssDG5FiFr7D?=
 =?iso-8859-1?Q?FBkyBTRt2P6avdWqVhe9J3xRiC2L1mO4s/Q87rRRt6Ej7Wn6i733wVsJom?=
 =?iso-8859-1?Q?5p6Ob1+bA3ID++b1rkP0zUOQjqlsp1J5wClXf+/O2eZJTtmQM3R/7LhvhH?=
 =?iso-8859-1?Q?xLZcVSXJat5zmszNhJgMrDRH4PhvtzZ/kwcNAvPoNmY2RedADlx6qjT3UA?=
 =?iso-8859-1?Q?rtg5WEf7uP3kEsPnsnPY0isNTlrFgnthFW5UKma0bQAZl0h8UmdPg4Y07L?=
 =?iso-8859-1?Q?4aHAgISb3B7LST4qIPA7dtATOZUIdE7QNJJ/mZu5Nt0OA95g38zYGvid8Z?=
 =?iso-8859-1?Q?Y+MIPiHJXl1QorTLsuHN9cpu36Ui/5a7cPa/ArLq0gyhHNFUD3YpZWNztv?=
 =?iso-8859-1?Q?xVNcUY5WgoBPd+AHq06tdldANtYcaTvZ0j8MB6R6yq3S1ObqLw5ULsaRXk?=
 =?iso-8859-1?Q?/rlMRy+JabG41pvoONWkcXFSYgMB0ASyJ3tK2NwKTkPaY/QcxngylPiu6L?=
 =?iso-8859-1?Q?ZGTG9Jv0lqf0/WoRU2jipiOV3Nx7hHzT5gPhw/Mwkw/SZKVA0fhTsHkF5k?=
 =?iso-8859-1?Q?lHvNpLOAPPCNdahkY1N+nIzXk1vrQm80Q6IsvfGjhntG5Zjm27Qs9WqPuD?=
 =?iso-8859-1?Q?H8NOCSCfqF3pbV6S9A/L3VE48naT9FtvRdGNk+bf5W1cqtaOBQF8rWb7Mw?=
 =?iso-8859-1?Q?dcCmQ8z8be76Sp9PCfT+KFtzpV73s8vxcvQfi7PgheDCtD1oYuj7or3aWO?=
 =?iso-8859-1?Q?kJQ77cj34XK7JzfeXi86ES1qoNJjepth2pxYfiyTsAx48lMjSditGvX6WG?=
 =?iso-8859-1?Q?iN9GHzt7NSMpx62ttoDN0K2/vWjPlWCyZDtDRd3e52WVP1?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB45851E31F32E1F330D3B921CDE922MW3PR11MB4585namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	W5ACCnE3AMI63KUElYw3a4qccZoZUfYDZQLz01nVmm0t4xg7V7jx2CupKUc1CeQZ/F/eaLXx3gzn40Zn2hz++il47JU2p3JjOmSgpHrs0GbzNvAIkk/0SoUycs1hryV8ShfrRz+J4ip6I3gmlDoM+f5VfDx4zWQBLTiECJ9U1RzfLn3aY1lIjIEO3LWY0qzqrY3sP7dJ758f1vaLRrlRTe8bMchavpgDkEkWDwyl4DVqShvKoZuO9CzF1GEXvEid9LQG7R+zii2EuQlHIPc8ZjK3ZvLv6OXz6KCRPRiVow5yyrmA6CN20xg9MZ44vpDCJ1oEJCDFOMNWUXmtTgjT7g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4585.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182d53c8-e88c-4887-d04f-08df25be3ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 04:31:55.6864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAgOOg+yloQkyUSahyIKIRyt3lAABc97DvAJIP3jYywPaWS3jBjpA+aUUmG/LkpbyhgAUz3PtbU2M2IeHZpF4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF06F7EC6B5
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-5.cisco.com [72.163.7.169];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 04:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247454

--_000_MW3PR11MB45851E31F32E1F330D3B921CDE922MW3PR11MB4585namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. It was mistakenly sent to OE-core and was intende=
d for meta-oe.
Thanks,
Yogita
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yogita Urade -X (yurade - E INFOCHIPS PRIVATE L=
IMITED at Cisco) via lists.openembedded.org <yurade=3Dcisco.com@lists.opene=
mbedded.org>
Sent: Wednesday, October 07, 2026 14:20
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [oe][meta-oe][scarthgap][PATCH v2 1/2] hdf5: Fix CVE-202=
6-17573

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915d=
a9e513262
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17573

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Prepared v2 to include the previously missed CVE-2026-26197.patch
  and CVE-2026-26199.patch patches. Updated the source code to
  resolve hunk errors.
---
 .../hdf5/files/CVE-2026-17573.patch           | 49 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch b/meta=
-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
new file mode 100644
index 0000000000..0acbbbf0c8
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
@@ -0,0 +1,49 @@
+From dd3080a58cc6bb86f3b34284399915da9e513262 Mon Sep 17 00:00:00 2001
+From: jhendersonHDF <jhenderson@hdfgroup.org>
+Date: Tue, 27 Jan 2026 05:55:38 -0600
+Subject: [PATCH] Fix double-free issue in H5D__chunk_copy (#6160)
+
+Fix double-free caused by loss of buffer pointer after re-allocation
+
+CVE: CVE-2026-17573
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/dd3080a=
58cc6bb86f3b34284399915da9e513262]
+
+Backport Changes:
+- Omitted CHANGELOG.md file changes
+
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+(cherry picked from commit dd3080a58cc6bb86f3b34284399915da9e513262)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/H5Dchunk.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/H5Dchunk.c b/src/H5Dchunk.c
+index 4727cc5d12..86340be16e 100644
+--- a/src/H5Dchunk.c
++++ b/src/H5Dchunk.c
+@@ -6809,7 +6809,7 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk
+                 H5O_storage_chunk_t *storage_dst, const H5S_extent_t *ds_=
extent_src, H5T_t *dt_src,
+                 const H5O_pline_t *pline_src, H5O_copy_t *cpy_info)
+ {
+-    H5D_chunk_it_ud3_t udata;                       /* User data for iter=
ation callback */
++    H5D_chunk_it_ud3_t udata =3D {0};                 /* User data for it=
eration callback */
+     H5D_chk_idx_info_t idx_info_dst;                /* Dest. chunked inde=
x info */
+     H5D_chk_idx_info_t idx_info_src;                /* Source chunked ind=
ex info */
+     int                sndims;                      /* Rank of dataspace =
*/
+@@ -6974,5 +6974,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk
+     /* Initialize the callback structure for the source */
+-    memset(&udata, 0, sizeof udata);
+     udata.common.layout    =3D layout_src;
+     udata.common.storage   =3D storage_src;
+     udata.file_src         =3D f_src;
+@@ -7024,3 +7023,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk
++done:
+     /* I/O buffers may have been re-allocated */
+     buf =3D udata.buf;
+     bkg =3D udata.bkg;
+@@ -7029,2 +7029,1 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk
+-done:
+     if (dt_dst && (H5T_close(dt_dst) < 0))
+         HDONE_ERROR(H5E_DATASET, H5E_CANTCLOSEOBJ, FAIL, "can't close tem=
porary datatype");
+     if (dt_mem && (H5T_close(dt_mem) < 0))
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipe=
s-support/hdf5/hdf5_1.14.4-3.bb
index a69e86ee5f..d0da4dc086 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -33,6 +33,7 @@ SRC_URI =3D " \
     file://CVE-2026-26199.patch \
     file://CVE-2026-26197.patch \
     file://CVE-2026-17572.patch \
+    file://CVE-2026-17573.patch \
 "
 SRC_URI[sha256sum] =3D "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef=
3c37724a318e03"

--
2.35.6


--_000_MW3PR11MB45851E31F32E1F330D3B921CDE922MW3PR11MB4585namp_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Please ignore this patch. It was mistakenly sent to OE-core and was intende=
d for meta-oe.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thanks,<br>
Yogita<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fo=
nt-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yogita Urade -X (yurade - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org &lt;yurade=3Dcisco=
.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, October 07, 2026 14:20<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [oe][meta-oe][scarthgap][PATCH v2 1/2] hdf5: Fix =
CVE-2026-17573
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">This patch applies the upstream fix as refe=
renced in [2],<br>
using the commit shown in [1].<br>
<br>
[1] <a href=3D"https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b3=
4284399915da9e513262" id=3D"OWA67fe250c-406b-6f9b-781c-daa73072c34e" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e5=
13262</a><br>
[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-17573" id=3D"OWA3c=
f25109-5a92-1f0b-7fce-1dc7a1853d38" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-17573</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yurade@cisco.com&gt;<br>
---<br>
Changes in v2:<br>
- Prepared v2 to include the previously missed CVE-2026-26197.patch<br>
&nbsp; and CVE-2026-26199.patch patches. Updated the source code to<br>
&nbsp; resolve hunk errors.<br>
---<br>
&nbsp;.../hdf5/files/CVE-2026-17573.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 49 +++++++++++++++++++<br>
&nbsp;meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |&nbsp; 1 +<br>
&nbsp;2 files changed, 50 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.=
patch<br>
<br>
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch b/meta=
-oe/recipes-support/hdf5/files/CVE-2026-17573.patch<br>
new file mode 100644<br>
index 0000000000..0acbbbf0c8<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch<br>
@@ -0,0 +1,49 @@<br>
+From dd3080a58cc6bb86f3b34284399915da9e513262 Mon Sep 17 00:00:00 2001<br>
+From: jhendersonHDF &lt;jhenderson@hdfgroup.org&gt;<br>
+Date: Tue, 27 Jan 2026 05:55:38 -0600<br>
+Subject: [PATCH] Fix double-free issue in H5D__chunk_copy (#6160)<br>
+<br>
+Fix double-free caused by loss of buffer pointer after re-allocation<br>
+<br>
+CVE: CVE-2026-17573<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/HDFGroup/hdf5/com=
mit/dd3080a58cc6bb86f3b34284399915da9e513262" id=3D"OWA338df538-deef-529c-9=
950-25426b16dd82" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https:/=
/github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262</=
a>]<br>
+<br>
+Backport Changes:<br>
+- Omitted CHANGELOG.md file changes<br>
+<br>
+Co-authored-by: Larry Knox &lt;lrknox@hdfgroup.org&gt;<br>
+(cherry picked from commit dd3080a58cc6bb86f3b34284399915da9e513262)<br>
+Signed-off-by: Yogita Urade &lt;yurade@cisco.com&gt;<br>
+---<br>
+ src/H5Dchunk.c | 5 ++---<br>
+ 1 file changed, 2 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/H5Dchunk.c b/src/H5Dchunk.c<br>
+index 4727cc5d12..86340be16e 100644<br>
+--- a/src/H5Dchunk.c<br>
++++ b/src/H5Dchunk.c<br>
+@@ -6809,7 +6809,7 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; H5O_storage_chunk_t *storage_dst, const H5S_extent_t=
 *ds_extent_src, H5T_t *dt_src,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; const H5O_pline_t *pline_src, H5O_copy_t *cpy_info)<=
br>
+ {<br>
+-&nbsp;&nbsp;&nbsp; H5D_chunk_it_ud3_t udata;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* User data for iteration callback */<br>
++&nbsp;&nbsp;&nbsp; H5D_chunk_it_ud3_t udata =3D {0};&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 /* User data for iteration callback */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; H5D_chk_idx_info_t idx_info_dst;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Dest. chunked index info */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; H5D_chk_idx_info_t idx_info_src;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Source chunked index info */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sndims;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Rank of dataspace */<br>
+@@ -6974,5 +6974,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* Initialize the callback structure for the sour=
ce */<br>
+-&nbsp;&nbsp;&nbsp; memset(&amp;udata, 0, sizeof udata);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; udata.common.layout&nbsp;&nbsp;&nbsp; =3D layout_=
src;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; udata.common.storage&nbsp;&nbsp; =3D storage_src;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp; udata.file_src&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; =3D f_src;<br>
+@@ -7024,3 +7023,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk<br>
++done:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* I/O buffers may have been re-allocated */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; buf =3D udata.buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; bkg =3D udata.bkg;<br>
+@@ -7029,2 +7029,1 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *s=
torage_src, H5O_layout_chunk<br>
+-done:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (dt_dst &amp;&amp; (H5T_close(dt_dst) &lt; 0))=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HDONE_ERROR(H5E_DATASET, =
H5E_CANTCLOSEOBJ, FAIL, &quot;can't close temporary datatype&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (dt_mem &amp;&amp; (H5T_close(dt_mem) &lt; 0))=
<br>
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipe=
s-support/hdf5/hdf5_1.14.4-3.bb<br>
index a69e86ee5f..d0da4dc086 100644<br>
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb<br>
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb<br>
@@ -33,6 +33,7 @@ SRC_URI =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-26199.patch" id=3D"OWA9=
62de517-1b12-4ad1-918e-498684090a77" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
file://CVE-2026-26199.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-26197.patch" id=3D"OWAf=
2cfe8ec-6268-c097-dd9c-39e46566a1dc" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
file://CVE-2026-26197.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-17572.patch" id=3D"OWA1=
9cc2126-9cfe-5762-de03-71ac855e7d3c" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
file://CVE-2026-17572.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-17573.patch" id=3D"OWAa4d439=
dc-180e-b8df-50e4-a66fd711c297" class=3D"OWAAutoLink" data-auth=3D"NotAppli=
cable">
file://CVE-2026-17573.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;019ac451d9e1cf89c0482ba2a06f07a46166caf2=
3f60fea5ef3c37724a318e03&quot;<br>
&nbsp;<br>
--<br>
2.35.6<br>
<br>
</div>
</body>
</html>

--_000_MW3PR11MB45851E31F32E1F330D3B921CDE922MW3PR11MB4585namp_--

