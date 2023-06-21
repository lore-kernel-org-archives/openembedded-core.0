Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1D1EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 08:01:05 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web11.5908.1687334455400533880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 01:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=b7Qp2XnZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5034; q=dns/txt; s=iport;
  t=1687334455; x=1688544055;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/6i05BiB4PpY5u8pNTuVbNLCztjM+GNMHM9oEY9rYfU=;
  b=b7Qp2XnZX58avivf17g0NaXFcQbudimGN+s0x6gN22l9bqsIXHBOrgUk
   oQARRIgEuCjqJCmZHL4wA23e5DWYoaso4L/lEQwI7jBM0aXR4F6NBH66S
   8GmsA6HW+x1EcU5QvMvd60yqWRi8c7pd1jMQH/DwYRj+TlUsbLOQnv8o1
   M=;
X-IPAS-Result: =?us-ascii?q?A0AnAAARrZJkmJldJa1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBYFJzAlkqEkcDhE6DTAOETl+GMYIkA51vFIERA1YPAQEBDQEBLg0JBAEBg?=
 =?us-ascii?q?hKCdAIWhWwCJTQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBA?=
 =?us-ascii?q?QEBAQEeGQUOECeFaA2GBAEBAQEDAREREQwBATgLBAIBCBEDAQEBAwImAgICJ?=
 =?us-ascii?q?goVCAgCBAESCBqCXAGCXAMBEJZbi28BgUACiVYaNXqBMoEBgggBAQYEBYFKA?=
 =?us-ascii?q?kOwWwMGgRUtAYk5g16CFYIzJxtAgU2BFUN5gW8+gQWBXQEBgSM/FYNEOYIug?=
 =?us-ascii?q?hiHQYRRhWUHgUMxiWWBKG+BHoEgegIJAhFBJoEICF+Bc0ACDVQLC2OBHFI6g?=
 =?us-ascii?q?UYCAhE6DwVSeBsDBwOBBRAvBwQyCRYJBgkYLyUGUQctJAkTFUEEg1gKgQ0/F?=
 =?us-ascii?q?Q4RgloiAgc2PxtRgiM3A0QdQAMLcD01Bg4fBQQkHiuBVzA+gRICRaAdA4JPT?=
 =?us-ascii?q?4EOASuBEQcDgRGTGSCDMK1yCieDYYt8jRqIIBepWAuYDyCNO5o1AgQCBAUCD?=
 =?us-ascii?q?gEBBoFjOoFJCwdwFYMiUhkPjiAZg1uBf4MVimV1CwIuAgcBCgEBAwmLSAEB?=
IronPort-PHdr: A9a23:t9LmwBKw4InfDnb3UtmcuakyDhhOgF28FhQe5pxijKpBbeH+uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1o2t2qjPx1tEd3lL0bXvmX06DcTHhvlMg8gPe/1G5LIiMif3OGp8JqVaAJN13KxZLpoJ
 0CupB7K/okO1JJ/I7w4zAfIpHYAd+VNkGVvI1/S1xqp7car95kl+CNV088=
IronPort-Data: A9a23:0eNsR6JmwNDNshvxFE+R1ZUlxSXFcZb7ZxGr2PjKsXjdYENS1mMCn
 DAdCGHVOffcNGfxLttxPt/l8kMG7ZKGn4NlTAcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbuS6ULas1hxZH1c+E39/00s7wobVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQRo9/1gLMoNNXx2rCqMhu5hl
 vBN67u/HFJB0q3kwIzxUjFCGC14eKZB4rKCez60sNeYyAvNdH6EL/dGVR5te9ZHvLcsRzgTr
 pT0KxhVBvyHr/m9wLOnUO5grs8iN8LseogYvxmMyBmGU6x/HsGdGM0m4/dh8GkvvMZJL8zGT
 PocQjdVcRDCPC9AbwJ/5JUWxbf02SaXnydjgFWNqKw65mLewAB83P3mN8DYUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rvXEkSW+U4UIGfjisPVrm1aUgGcUDXX6SGdXv9HjrxXlQ+JOd
 3c13TUrtJYiqmmrEP7yCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOoTiZmMfADDBnJJoLQHGx
 mNljPuyWmMy6Oz9pWa1s+bL/WnraED5OEdbPXdcJTbp9eUPt23as/4iZsxoHKjwhdrvFHSqh
 TuLtyM5wb4UiKbnNplXH3ia3VpARbCQHmbZAzk7uEr5tmuVg6b5P+SVBaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuabaam2B0QU2Qcl5n9hIx5JFVd4IiN2ZDBkxWvvohReyC
 KMukVoLvcQKbCfCgVFfOtjoUKzGMpQM5fy8BqyLMbKik7B6dRSM+2l1dFWM0mX2+HXAYolhU
 ap3hf2EVC5AYYw+lWLeb75EjdcDmHtkrUuNHs+T8vhS+efEDJJjYe1bYALmgyFQxP7snTg5B
 P4GbJfbm0sHAb2kCsQVmKZKRW03wbEALcmeg+Rcd/WIJUxtH2RJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:xRYRaaM27PysZ8BcT2n155DYdb4zR+YMi2TDiHoRdfUFSKKlfp
 6V88jzjSWE9wr5OEtLpTnyAtj/fZq6z+843WBxB8buYOCCgguVxe5ZnPPfK7OLIVyEygcw79
 YET0E6MqyNMbEYt7e03ODbKadb/DDvysnB7ouurAYOcegpUdAc0+4TMHf9LqQCfng+OXNPLu
 v72iMonUvFRZ0QVKmGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT0PARDAhKe/apw7gpPCcwLyEbzYpBOG
 Uh5RPAi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEy82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBNB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+q6GjMiq9NFlVcQ6dv/22vaIJyYEUbICbQxG+dA==
X-Talos-CUID: 9a23:3PuVMW+1rqm9wD7jW0KVvxQxQZs9QmyB91b3PEqhN3Y3bb3LblDFrQ==
X-Talos-MUID: 9a23:eFtZTQmtmlGFCLmDU+MMdnpbGJl32aKpOnoVuqUDkMS+KChyZAWS2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jun 2023 08:00:54 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 35L80qJG031097
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:00:53 GMT
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,259,1681171200"; 
   d="scan'208";a="3244251"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:00:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt+N5mIiLIL5Iutb1dA7Iu3L0i/OVYQB6HNv85cvW43SwBP/vudT+0/q51viNmA60QGNkFw30WmpfowKddq1xHs4gj65PFsH+TYW3pb8uqKAIgZrhgc0IOqpUMy248QUah62BJ2vNWDYKitysIj+QEajKpGZob7QPnKtBdW5NEudoIl4a1Asb1GhEAXJjoI727URyjmO5Q0BRmoPnYkFGg6t6WTBfV68jkuCsiqzgg6vwXYB2UY8BTOBgg7vcPNpgS1gLOfyqED9Vy57fwKtf1qVDtQoynlwyBvc24As16KW1ClDRXjTzfv9+jZ3WrnvWqpgo3CFq8aJ5/tVU4iaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6i05BiB4PpY5u8pNTuVbNLCztjM+GNMHM9oEY9rYfU=;
 b=hSDdRwM/hiY5pF+2k21kGQPUdYJyww9TemuZHvKqIcVaARR85PcWCO1pFX47sTwEgarAyXDz0b5gO8FLE98DYeQtcRZZCD4ckCcydDZctp1505DwO+Pb6W0a0JAVKuatUC89X3JryP38/BytC9Gc5g+lU5PKIl5CGtquifatuD7D2MXSIaGKHESknqQOTbrtDN2GPpTMVwvuf6JVmsmvumxJIrp2zNu3+IGWXXLtPGPXjTEk3tgInk0fOHJR3BHsF7xo79/c7uzhMq7OTHor62UvUliNez/KLNNVbv/eRSpOTuy75MvnkQYjP8zN/D50cUmYlI+xn6kjsEHSXHwO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6i05BiB4PpY5u8pNTuVbNLCztjM+GNMHM9oEY9rYfU=;
 b=K4X7EayfKCI/BRIs3z1UQfF/aaLBsrhT9bFeCh53RrG+YdzqTPYfGQ0dQ3VRdTf+d00cyFG3FecIz+p6kYGys9JqDVzH159ZsQ4iyKsinxXeGgWnCAXMRDdOR00EsWKRfaRbEtn9txJuy+xWAeX3czgjZVBGGXeAeY6tlX6ZHWs=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 08:00:50 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6477.037; Wed, 21 Jun 2023
 08:00:50 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Steve Sakoman <steve@sakoman.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone 02/18] cups: Fix CVE-2023-32324
Thread-Topic: [OE-core][kirkstone 02/18] cups: Fix CVE-2023-32324
Thread-Index: AQHZolmRXYSKBoOgE0u8azARDujzKa+U5rSQ
Date: Wed, 21 Jun 2023 08:00:24 +0000
Deferred-Delivery: Wed, 21 Jun 2023 08:00:07 +0000
Message-ID: 
 <SJ0PR11MB6717DC7CA09D8738FB1C3FB9DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <cover.1687143192.git.steve@sakoman.com>
 <cf741646f41835024c7e53234cfd527ff3f8542b.1687143192.git.steve@sakoman.com>
In-Reply-To: 
 <cf741646f41835024c7e53234cfd527ff3f8542b.1687143192.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CH3PR11MB8187:EE_
x-ms-office365-filtering-correlation-id: 25f2ce4e-083e-4507-eeb6-08db722da0cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f+HO4uotULBwm5AYi3Teu3PIeBR+ufhPJV2c3RACWkG/KJ317VMSHD/xtWO4KaSXAqda9O10BH3y7XHpi5cBDfnXvSxV9SUXBMPJm9+IRaEg5vCyRridDKXYtNLVgm8R6assyCoiaikmer6e2boq7UbPqBUXTzfBaWUysapPJfoJR0aTr/M7kfE06h65Ps1Xhd/vZ/3n2dnc1iQSy3GevrkL1bEmZYIbcrXTnkJ+0aEY44Cdcnkjnh/0cJ8Y0t3POVcR48pGf9tYc6O6l5G2EYYaUQsiJdWHvF3LFrnzYy0Koub++n+FnFGugOG3Oy7lAVQSiqHJ2XRve3ZyKC6e/RBIXtpBf+d0o32kI6WZ3EpFRAogg0GRWLLZZ65HR3XGyao1Fv5eqzrRAfdiL2RKBTFWJG9U5LEOyl2qgxBGfJg+3kugO9p7NDH9yWLLCFjxlOEiNdXo4lcyJnhqAYEFEeK783IJpNUxABU7Z/s/WBDxv4ypRIC5YGmL0UPq+kcT2xJDEakURqbGhGh0iz/PPn1/HT0OeQ0z5EhkC4Mv9nUV+E4GpFqK6xUKFcem682R1wW38f7i2uwO7BFZJpUf+3j0XaGx866kOEC1UUJXCUBo+voZ6AR4L3ljv/AI4GT2EdZFvkkiI9eTJRTuQUGPzg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(71200400001)(966005)(7696005)(478600001)(6666004)(186003)(9686003)(53546011)(83380400001)(33656002)(38070700005)(86362001)(38100700002)(122000001)(55236004)(6506007)(26005)(55016003)(66556008)(66446008)(76116006)(66476007)(66946007)(64756008)(316002)(8936002)(8676002)(5660300002)(52536014)(41300700001)(2906002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZkFxbWd1YXBTN2k4eHFlbTBSTUI3eGsvdVkraEZoK1lTYUtqUWRYcDRqT0dJ?=
 =?utf-8?B?TkVXN3FZSS9jV1hUNDZtb1ZKdzRzTUVmR2xHQ3JTT3A1a1hxS2xJSWpKcDBj?=
 =?utf-8?B?UTRkQmpLMFdCOUQ2djh1dVlrNkptQzhjZDZ2Tm9BZFRmNHVTYnVpMkl4MzdK?=
 =?utf-8?B?S3JWR2pHSDgxSkludm8vVGxDMXNnVEtRclRUVVFBWEdiZDJRaEZ1OTZyKzNi?=
 =?utf-8?B?aGZyYVBnbGJTeEI2SlpYaTlhQzZMQUJ5Sk1Db1JqOUNIeTRlUGk0TEZ0bU9W?=
 =?utf-8?B?bzFUdGVaQUE2bm9wMXUyaVFuRzVVNTlPSm5nbnZObGs1empvRkdZelFwdHFF?=
 =?utf-8?B?K2pkSEV4UUYwb3dUWGlqdCtEbW1uMThyb05NUWQ1cGtVZFQwTGp5Z2g1Wmcy?=
 =?utf-8?B?cmRWd3o5bVd3ZWpFS2pQd1NseFRmSDduNUEvWWRVUjZFQzFWT1gvZE13a20z?=
 =?utf-8?B?Y0tKKzFDVU44S0ZPOFlKczhMbThsaXVOQ2MvNGtBNHNFU1pVWHl3cHp5Y1pT?=
 =?utf-8?B?SHN5Tk8yb0gzOFhFVjJEZjJIVkJEbmpBQjY4U1dTajNuZ3ZHZlFyOUQ1RkZw?=
 =?utf-8?B?Z0I4NkRXYkFKejJSbzhOSFZYcmpDY0FDVlE0MmxSK0tVSjBKc0VYRHNDOWtz?=
 =?utf-8?B?bi9kU1hYVENCNGtqNHRYVnVlYkVVSVRtNnA5eHVuK0NPMGlZQi83SDF3SUVh?=
 =?utf-8?B?UlczRE9obVoxMm5SNng0VC9JanI0QjFDcGdYMTlHVlYwY29EN0xLNWJMT3E0?=
 =?utf-8?B?ZEhkTWllbGNrUE02N2p4akErcmxVY0Y2bjQxYVI1TWZzTCtaejJLOERybEVj?=
 =?utf-8?B?UitSMnM5SHZQay9lRm1kbnRHOUlVeTJndDduSUcweWgzTnJBeVp3eFZ3eTVP?=
 =?utf-8?B?WFRIeTNaQXl0aEhVRGJCamgzOUZyTmx6dzU4ZFFCVWJ4MlJGRDRBQ3hwc3lV?=
 =?utf-8?B?bmFVeVlaN3VUeTJnUUhmdEdxVjVyNUlvOVBYUVN0c0tCUEUzdCtyNkpjYWFP?=
 =?utf-8?B?ZnZLYXVjdUtaMS9VNkhUUStmQ21ac3VSU3dqRklCRUIxZDRNUlA1Zk40WUZI?=
 =?utf-8?B?cEV4aGR6N01ieTFxUStkamdEamtnTm4zM1F5bmY2aGJMUWc5NXV0STYzdXZ5?=
 =?utf-8?B?ZTgzNVpwN0xSaFpnUmc5WnFyeEIzZjN0Um5LTnJMcVNMWnRMeTQ1N2w1bHJC?=
 =?utf-8?B?b1FKcWhyS2dMUk9Hb0NjQk5CeW1lcG5Jb1hlV1U2VlkrekVYS1NiaUJ1M0lH?=
 =?utf-8?B?Y0xWU3lPOWVDdE5oYkNKQ3IzcUZDbGFiU0ViaWZYbEJ5Z09Lck9HWVBpQ0or?=
 =?utf-8?B?R2FNT0hqU0p3aFNqOHZTSTl1WThXanZTN2NEYU1SRnBRbENaV1FqTXhYU1Ux?=
 =?utf-8?B?OTZteHZZc0hCa1hDa3l0Z05sWEN4OVJwYnJjRkw1SmUyMEhFakJ6b2tPeHlt?=
 =?utf-8?B?Z2JtUjNEa21NaUtkQ3BnZ0p2bm1QaTd5dDRSN3FiNWl5NW13ejh5UndBYXMv?=
 =?utf-8?B?ZDdVMEErYi9YNWN5YlNSeGFNYkE0Wks4WFlrUXN1WlJTVFZyS291NjFHY1Q1?=
 =?utf-8?B?RlJIbDR0dDU1WitmOTJRWXlwYTJhdjg5Q01FSXRCZ0JuWnFWcXFEMHl6Z0Nv?=
 =?utf-8?B?M2NiSEIrM0Y2T3N2RUhwMXRmMkNlR3BQSVFuekxXV1ZYaFhSbldNWVo0Umh4?=
 =?utf-8?B?VEVVVUNUc2lrRit6bGR0a2RoWCtVM2ZzM3hCck03enh6TTVBQUQ3cmxQY2ZN?=
 =?utf-8?B?b243TTFKbkVDV2hzVkpOdVBob3YvRFFQZmRWNHRrME9Fd1I3Qyt2a1RxTnRq?=
 =?utf-8?B?b3RHeUNCS0RSa21obDhkUUVoVlFKcVBhMGZ5YldoZ09mK1cySnlXQjFoTmp0?=
 =?utf-8?B?UFhuNXdpUmdBSVRJV3RxV1RBYU9KQXM4K2pLaFhTdWQvOTJJSC9XU253VSsy?=
 =?utf-8?B?RHdrUFI0R3oyelFlOW1zZEZIRGVnUnpjSG8yOUN4azUxZVppL2FBYnQ5TXJh?=
 =?utf-8?B?a3VvN0dCOHlDb1Z2MHI4Uk9vL0dRWFhjUTcvY3RhZzNmM1NQNXFLYWZML1hr?=
 =?utf-8?B?UFRaUDhidkRZN0ZXN3p4MVI3TXVNWFJZdCsyUnZlT3RQclZhT2tUSUVtZXFS?=
 =?utf-8?Q?xw8GzfKnlwtikYZaCR4whzH1w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f2ce4e-083e-4507-eeb6-08db722da0cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 08:00:49.9423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FGIOpUNDTYpkWrvxqMCYEbXR1O28JYrHs5//t9wGue3jyzsHhloSr/S76PJt39rAAm2OGZ6TyiaufdDw7Q+AlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183173

SGkgU3RldmUsDQoNCkNWRSBmaXggZm9yIGN1cHMgcGFja2FnZSBpcyBhY2NlcHRlZCBhbmQgbWVy
Z2VkIG9uIG1hc3Rlci4NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVk
ZGVkLWNvcmUvY29tbWl0L2E0YmRiYzgyZjdlNWNjOWE1Y2I2MDNjYjcyMGYwOWIwMjE2YjBhMGUN
Cg0KSXMgdGhlcmUgYW55IGNvbW1lbnQgZm9yIHNpbWlsYXIgZml4IG9uIGtpcmtzdG9uZSBicmFu
Y2g/DQoNClRoYW5rcywNClNhbmpheQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFN0ZXZlIFNha29tYW4N
ClNlbnQ6IE1vbmRheSwgSnVuZSAxOSwgMjAyMyA4OjI1IEFNDQpUbzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogW09FLWNvcmVdW2tpcmtzdG9uZSAw
Mi8xOF0gY3VwczogRml4IENWRS0yMDIzLTMyMzI0DQoNCkZyb206IFNhbmpheSBDaGl0cm9kYSA8
c2NoaXRyb2RAY2lzY28uY29tPg0KDQpPcGVuUHJpbnRpbmcgQ1VQUyBpcyBhbiBvcGVuIHNvdXJj
ZSBwcmludGluZyBzeXN0ZW0uIEluIHZlcnNpb25zIDIuNC4yIGFuZCBwcmlvciwgYSBoZWFwIGJ1
ZmZlciBvdmVyZmxvdyB2dWxuZXJhYmlsaXR5IHdvdWxkIGFsbG93IGEgcmVtb3RlIGF0dGFja2Vy
IHRvIGxhdW5jaCBhIGRlbmlhbCBvZiBzZXJ2aWNlIChEb1MpIGF0dGFjay4gQSBidWZmZXIgb3Zl
cmZsb3cgdnVsbmVyYWJpbGl0eSBpbiB0aGUgZnVuY3Rpb24gYGZvcm1hdF9sb2dfbGluZWAgY291
bGQgYWxsb3cgcmVtb3RlIGF0dGFja2VycyB0byBjYXVzZSBhIERvUyBvbiB0aGUgYWZmZWN0ZWQg
c3lzdGVtLiBFeHBsb2l0YXRpb24gb2YgdGhlIHZ1bG5lcmFiaWxpdHkgY2FuIGJlIHRyaWdnZXJl
ZCB3aGVuIHRoZSBjb25maWd1cmF0aW9uIGZpbGUgYGN1cHNkLmNvbmZgIHNldHMgdGhlIHZhbHVl
IG9mIGBsb2dsZXZlbCBgdG8gYERFQlVHYC4gTm8ga25vd24gcGF0Y2hlcyBvciB3b3JrYXJvdW5k
cyBleGlzdCBhdCB0aW1lIG9mIHB1YmxpY2F0aW9uLg0KDQpSZWZlcmVuY2VzOg0KaHR0cHM6Ly9u
dmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtMzIzMjQNCmh0dHBzOi8vc2VjdXJpdHkt
dHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIwMjMtMzIzMjQNCg0KVXBzdHJlYW0gUGF0
Y2g6DQpodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50aW5nL2N1cHMvY29tbWl0L2ZkOGJjMmQz
MjU4OQ0KDQpTaWduZWQtb2ZmLWJ5OiBTYW5qYXkgQ2hpdHJvZGEgPHNjaGl0cm9kQGNpc2NvLmNv
bT4NClNpZ25lZC1vZmYtYnk6IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPg0KLS0t
DQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMgICAgICAgICAgIHwgIDEgKw0K
IC4uLi9jdXBzL2N1cHMvQ1ZFLTIwMjMtMzIzMjQucGF0Y2ggICAgICAgICAgICB8IDM2ICsrKysr
KysrKysrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9DVkUtMjAyMy0z
MjMyNC5wYXRjaA0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
cy5pbmMgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYw0KaW5kZXggMGFjYzVj
NTc1ZS4uMWI4N2Q0N2E0OSAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHMuaW5jDQorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYw0KQEAg
LTE1LDYgKzE1LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50aW5n
L2N1cHMvcmVsZWFzZXMvZG93bmxvYWQvdiR7UFZ9L2N1cHMtJHsNCiAgICAgICAgICAgIGZpbGU6
Ly8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2ggXA0K
ICAgICAgICAgICAgZmlsZTovL3ZvbGF0aWxlcy45OV9jdXBzIFwNCiAgICAgICAgICAgIGZpbGU6
Ly9jdXBzLXZvbGF0aWxlcy5jb25mIFwNCisgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMy0zMjMy
NC5wYXRjaCBcDQogICAgICAgICAgICAiDQogDQogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9PcGVuUHJpbnRpbmcvY3Vwcy9yZWxlYXNlcyINCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9DVkUtMjAyMy0zMjMyNC5wYXRjaA0KbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAuLjQwYjg5Yzk4OTkNCi0tLSAvZGV2L251
bGwNCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvQ1ZFLTIwMjMtMzIzMjQu
cGF0Y2gNCkBAIC0wLDAgKzEsMzYgQEANCitGcm9tIDA3Y2JmZmQxMTEwN2VlZDNhYWYxYzY0ZTM1
NTUyYWVjMjBmNzkyZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQorRnJvbTogWmRlbmVrIERv
aG5hbCA8emRvaG5hbEByZWRoYXQuY29tPg0KK0RhdGU6IFRodSwgMSBKdW4gMjAyMyAxMjowNDow
MCArMDIwMA0KK1N1YmplY3Q6IFtQQVRDSF0gY3Vwcy9zdHJpbmcuYzogUmV0dXJuIGlmIGBzaXpl
YCBpcyAwIChmaXhlcyANCitDVkUtMjAyMy0zMjMyNCkNCisNCitDVkU6IENWRS0yMDIzLTMyMzI0
DQorVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCANCitbaHR0cHM6Ly9naXRodWIuY29tL09wZW5Q
cmludGluZy9jdXBzL2NvbW1pdC9mZDhiYzJkMzI1ODldDQorDQorKGNoZXJyeSBwaWNrZWQgZnJv
bSBjb21taXQgZmQ4YmMyZDMyNTg5ZDFmZDkxZmUxYzA1MjFiZTJhN2MwNDYyMTA5ZSkNCitTaWdu
ZWQtb2ZmLWJ5OiBTYW5qYXkgQ2hpdHJvZGEgPHNjaGl0cm9kQGNpc2NvLmNvbT4NCistLS0NCisg
Y3Vwcy9zdHJpbmcuYyB8IDQgKysrKw0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
DQorDQorZGlmZiAtLWdpdCBhL2N1cHMvc3RyaW5nLmMgYi9jdXBzL3N0cmluZy5jIGluZGV4IDkz
Y2RhZDE5Li42ZWY1ODUxNSANCisxMDA2NDQNCistLS0gYS9jdXBzL3N0cmluZy5jDQorKysrIGIv
Y3Vwcy9zdHJpbmcuYw0KK0BAIC0xLDYgKzEsNyBAQA0KKyAvKg0KKyAgKiBTdHJpbmcgZnVuY3Rp
b25zIGZvciBDVVBTLg0KKyAgKg0KKysgKiBDb3B5cmlnaHQgwqkgMjAyMyBieSBPcGVuUHJpbnRp
bmcuDQorICAqIENvcHlyaWdodCDCqcKgMjAwNy0yMDE5IGJ5IEFwcGxlIEluYy4NCisgICogQ29w
eXJpZ2h0IMKpwqAxOTk3LTIwMDcgYnkgRWFzeSBTb2Z0d2FyZSBQcm9kdWN0cy4NCisgICoNCitA
QCAtNzMwLDYgKzczMSw5IEBAIF9jdXBzX3N0cmxjcHkoY2hhciAgICAgICAqZHN0LAkJLyogTyAt
IERlc3RpbmF0aW9uIHN0cmluZyAqLw0KKyAgIHNpemVfdAlzcmNsZW47CQkJLyogTGVuZ3RoIG9m
IHNvdXJjZSBzdHJpbmcgKi8NCisgDQorIA0KKysgIGlmIChzaXplID09IDApDQorKyAgICByZXR1
cm4gKDApOw0KKysNCisgIC8qDQorICAgKiBGaWd1cmUgb3V0IGhvdyBtdWNoIHJvb20gaXMgbmVl
ZGVkLi4uDQorICAgKi8NCi0tDQoyLjM0LjENCg0K

