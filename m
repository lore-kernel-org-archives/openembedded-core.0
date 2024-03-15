Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2642DC54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 19:52:09 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.2731.1710532323290720670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 12:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=OwiHopIq;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=KQMF8wxc;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2168; q=dns/txt; s=iport;
  t=1710532323; x=1711741923;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9beIT4I23Tu4lLm9l+w11W2m75FKNxC6i0n/4dtFC+M=;
  b=OwiHopIqstoHS96HGmCC5DOlqrdmwLOrjELHBv1d/BTpK4oD+b/dOAj5
   a3SVqneSffnDJP0fhYBsAjlFA2reaRmIGAxYJPhd1S6gzeoH0dFhPRy6J
   7TzHsMV1aJ8EL6Ius0rYZJqV9ahUxX6yWHsh6rKr5ObvgotYYVpgfADg+
   E=;
X-CSE-ConnectionGUID: nLWW3TruSHKSWcmVKKpkDA==
X-CSE-MsgGUID: peqZbsMaTt+cEZwAg52E3A==
X-IPAS-Result: =?us-ascii?q?A0ANAACupfRlmIYNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBZlJ6AoEXSIRUg0wDhE5fiGsDngeBJQNWDwEBAQ0BAS4HDwQBA?=
 =?us-ascii?q?YUGAhaHawImNAkOAQICAgEBAQEDAgMBAQEBAQEBAQYBAQUBAQECAQcFFAEBA?=
 =?us-ascii?q?QEBAQEBHhkFDhAnhWwNhk4BAQEBAwEREREMAQE3AQsEAgEIEQQBAQECAiYCA?=
 =?us-ascii?q?gIlChUICAIEDgUIGoJeAYJfAwGnBQGBQAKKKHqBMoEBggoBAQYEBbJ4CRiBA?=
 =?us-ascii?q?i4BiCUBgVaDVIUHJxtAgU2BV4IwOD6CYQICAYFfBTODITmCL4IXgxIpihuUA?=
 =?us-ascii?q?AlLfxwDgQUEWg0FFhAeNxEQEw0DCG4dAjE6AwUDBDIKEgwLHwUSQgNDBkkLA?=
 =?us-ascii?q?wIaBQMDBIEuBQ0aAhAaBgwmAwMSSQIQFAM4AwMGAwoxMFVBDFADZB8yCTwPD?=
 =?us-ascii?q?BoCGxQNJCMCLD4DCQoQAhYDHRYEMBEJCyYDKgY2AhIMBgYGXSAWCQQlAwgEA?=
 =?us-ascii?q?1IDIHIRAwQaBAsHeIICgT0EE0YBDQOBNIoiDIM2KoFOKYERgRcDRB1AAwttP?=
 =?us-ascii?q?TUUGwUEHwEdfAWiHQGCUwiCEz4DP5darm4KKINqjAqNK4goF4VbpFOYX6hTA?=
 =?us-ascii?q?gQCBAUCDgEBBoFkOoFbcBU7gmcJSRkPjiAZg2GFFIpleAI5AgcBCgEBAwmKa?=
 =?us-ascii?q?AEB?=
IronPort-PHdr: A9a23:V7AoSh9V+o+VdP9uWOnoyV9kXcBvk7zwOghQ7YIolPcTNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqOQx8KeP5AIf6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49Mbg4ZpNu49ywCcpHxOdqUeyTZjJEmYmFD34cLYwQ==
IronPort-Data: A9a23:bFyMzqJcb8YfNRuhFE+RwpUlxSXFcZb7ZxGr2PjKsXjdYENSgmNRy
 mQaD2+BOvrbZWKgcthzPIS/pBhVucDUyoAxQQMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcYZsCCea/0/xWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVvS0
 T/Oi5eHYgP9gGcpajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKmWDNrfnL
 wpr5OjRElLxp3/BOPv8+lrIWhFirorpAOS7oiE+t55OLfR1jndaPq4TbJLwYKrM4tmDt4gZJ
 N5l7fRcReq1V0HBsLx1bvVWL81xFatix4CcHWKiiuyw9HLNdkXP4O1tIGhjaOX0+s4vaY1P3
 fUcLDZIZReZiqfvmvSwS/JngYIoK8yD0IE34y47i2qHS699B8mYH80m5vcAtNs0rsxIFPnZa
 9AQQTFudx/HJRZIPz/7DbpkxL341iGgLGwwRFS9vacu0WLI6QVNzPvmHejKU9PXH+gOtxPNz
 o7B1z+kWk5BboP3JSC+2nW0i+nCmCn2VI4fGPiz8eRnqFmS3XAIThoOWF22pPO0hkKzV5RYM
 UN8x8Y1haE28EruRd7nUljh+jiPvwUXXJxbFOhSBByxJrT85SKmOTM4VCN6SP8di8Qzex8Jz
 lyltoa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRPoqyNburEPR6lt1HryosZfLUKjsjHi9djNL
 92ipSw6gfAYitQGkvzhu1vGmDmr4JPOS2bZBzk7vEr7sGuVh6b8O+REDGQ3C94bc+51qXHa5
 xA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pCf7INoPvG4gfRgwWirhRdMPS
 BKD0e+2zMICVEZGkYcqC25MI51zkvi+T4iNug78PoAeCnSOSON31HozPRHLhT+FfLkEmqAkM
 pDTate3EXsfEuxmyjHwL9rxIpd1rh3SMVj7HMihpzz+iOL2TCfMFd8tbgDUBshnt/zsnekg2
 4sFXyd8408BALSWj+i+2dN7EG3m2lBgW8Gn+pYMLb7TSuekcUl4Y8LsLXoaU9UNt4xel/zD+
 Te2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:+Ofi16v4nEc+U3b0mF0zMtlN7skCDYAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwSZVoIUmxyXZ0ibNhRItKLzOWyFdAS7sSrLcKogeQVREWk9Qtt5
 uIHJIOdeEYYWIK6voSpTPIberIo+P3sJxA592us0uFJDsCA8oPnmIJbjpzUHcGOzWubqBJbK
 Z0k/A33QZIDk5nFfhTaEN1OdQrjue75q7OUFotPTJiwg+Iij+j9b79FDal/jp2aVly6IZn21
 Lo1yji6Iuek9zT8HLhPmnogKh+qZ/E8J9uFcaMgs8aJnHHkQCzfrlsXLWEoXQcvPyvwExCqq
 iPnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3CQi4gAcYpv/MdTvKZ0TtlgDhP6t
 MM44urjesPMfoGplWk2zH8bWAsqqNzmwt4rQdctQ0EbWJUUs4jkWVWxjIhLH5HJlO41Gjie9
 MeUP01I51tAA6nRmGcsW91zNO2WHMvWh+AX0gZo8SQlyNbhXZj0iIjtYEid1o7hdkAoqN/lq
 75G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqI8vfMkfoIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyowMBD4JpyvKH6WdPQQGG+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rAopN1x2WYegbFZDfarxdhj8WYSP5niuQEPyfigXySoelGIbQ
X-Talos-CUID: 9a23:w4w0fG18Wi5ecPyJb7frwrxfHOQaTSbh1mrrA2yDNm1sdp62UVy80fYx
X-Talos-MUID: 9a23:3q8wOAjHxgPHZpCaKiQSMcMpLMpx0a61LUkxjdYNlvubHCMtYRrGpWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 19:52:02 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 42FJq2SQ025717
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 19:52:02 GMT
X-CSE-ConnectionGUID: UW4IHNqURGSb487Rfqd8kA==
X-CSE-MsgGUID: 8w36RaG6Sxe0YLjzQazjMw==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=dnagodra@cisco.com; dmarc=pass (p=reject dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708387200"; 
   d="scan'208";a="5781202"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
  by alln-opgw-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 19:52:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjv2OIsO1bfOB9xIJepU8DnhDL9yuTh3HCMsumaENDlMKtrrll6KcoCME49ut4N0eQOng25PqWklUIDAz+rYav+dA9K+eqUeJnPDhkp7hyPH24iTRR883cg92MfICIKGtmj1WFmRpYgfaqPj+L68CeZ+YG9yX59eRfref9AjXV8j9+hkM3xEIHklHjXEL6X7ESNgpxqDFUtieBlJUDUNLyqF+ab079y5iDPsTkskvbKUSLzk2Xmk0ohLqKf/W/1gvLZMaqiLd4VKfssxET6xQh882mIzaTDQExXhv4eTQ55lgtIce3uYnPP+fRIwAeDSCdXYIXPhVeavmW0lhGWGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9beIT4I23Tu4lLm9l+w11W2m75FKNxC6i0n/4dtFC+M=;
 b=O8wQl+4GP/RV6yeXbM98KVxcfe5MXa3S7OF/gcoSXeDups0T4173KhXQagPNRI2x8pjcoqbgX3S58wh2Y6JaeuMLFB1tywBPAFWHm5OKnvDQET0FzuHyQX6FuQKPS06S4pspYa3YpuNn6s6aJfXMcln+zjEKJvYQ1HqY+MA8I6cGxsn10Q7LRA/LKaZ0/g9rOSmGJiSf86efXMYQAyfk682C5kXQK/WU6F65XuXSLzmh6sCX2+d6wiUaLr4HMtOt8C9O46hbqxfCQLU/mhTL7QLgMNw8Aqo4Pd61DJv9VKMTTgFT+AD4VPZtvWqYLKSCVM2SlihJyQUxi+fiLTVn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9beIT4I23Tu4lLm9l+w11W2m75FKNxC6i0n/4dtFC+M=;
 b=KQMF8wxc8/Kird1ECUtHjDDCCFxvag14YANK5ZrUgtBr+jToO9VqOGM4e0pUghNDTdztG2iKsHECPQENOPBkDQv77ULqr8JVWPJJBPygvI1IPN+UTbDwE8rGvJsPQOe43k9VPgi+cXcTF68A0TBx0jFlfXCJcYcUxgyiJ+UOaFc=
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by SN7PR11MB6557.namprd11.prod.outlook.com (2603:10b6:806:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 19:52:00 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::c36a:5d77:e28:e55f]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::c36a:5d77:e28:e55f%6]) with mapi id 15.20.7386.015; Fri, 15 Mar 2024
 19:52:00 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: RE: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
 classes
Thread-Topic: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
 classes
Thread-Index: AQHabZO0sRLY//WB40GqcBqkcmJhH7E5CumAgAA7IwA=
Date: Fri, 15 Mar 2024 19:52:00 +0000
Message-ID: 
 <SN7PR11MB6971F0A6CDA076349AF6C9EFD4282@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240303175323.2526814-1-dnagodra@cisco.com>
 <3DFB9E4D-D025-4318-8BD0-6D7D8DCEE1C3@arm.com>
In-Reply-To: <3DFB9E4D-D025-4318-8BD0-6D7D8DCEE1C3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|SN7PR11MB6557:EE_
x-ms-office365-filtering-correlation-id: c688a50d-1373-467a-4233-08dc452960f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 l5FpFOcZmj1+s4FIZGNpxgVF9UFaJwzqzYvcQRa1C4qWhD6i1/8UEpnwAKSXHTXRZYN8o1N6WETwLAYsgSJdrSJomBefpaibdvo+CppM9QPb3UMzWR+D7ZhfCx1m+HDo97uPzJrpJagYDz1aCqUeFf1EqlIUJ2h/HfMPMI2LiQYe3pIj7mLpJdSvp7wQzaiLHrt1Tz5YaLu2TterqS60HPVOxHINB+CR1SHCGArS9ehs5FUCl+B68cLr+3dSwQZnCDxutXAzCZ0XuJS0qWCg7bit/1tebFGrhY1vyFHpKhq8e47hVs7+EfC/ohSmasu/kD7xURGqzmxBAA2b6AWQ1E4PW9yCYruLY8kj/Fxakgo1ji2E00/Mv7Yhrw/eBFxNAmQahPdnxiJpOt2fHRkNQAigjuJo110vHTibWUilz0D+jXQy5bGT1N0inFo0C1MBWEye+2/BHw8UEQVoa4pbpapKfauOjLOqOG+zchM73xfEi+YNb/2Fpr19IuqfcYVPhmUbboGUQAqJsYu0Tzddje93TJ85azEMw7kpPk52m6tbXH6AIyCYhZFMG8H1/nMjDfi2bTIgFGFp+J41di1CAww/m3Xrov9QMwBHXzTo3IE9U8IP37o7+6JpRfiAxgYtj7xENcQh9yiNATQ4o21awXLsS79NkjwFw5EdajReMZeZw6bpUI2hufGV8kMX83mht8ccTeH5/gZEpOwjrHrtkg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bVhqbjRwcnRYOWZ1bU1VUFIxbkM4eko3d2FHanpndVdKSnR6UDUwRkhId3NJ?=
 =?utf-8?B?T29KMlVDRVhVSjMyUVp4MzgzVC8ranRMeW1wbUN1TmdyYXRJeDZzK3Nycytq?=
 =?utf-8?B?eEJPYzYyTElkbkhWU1NiVitFT2lIVlFKSHBVVHVSeERDcHdwMmVuM3U5c1Q2?=
 =?utf-8?B?YnJyNXh2dGg4T0VReDdBSUJuUGdkc01ycXdIOElMdzRSS2xRbnVWOUFsQUxx?=
 =?utf-8?B?QmM0cnVUUjUrT3lOU3RjN2E0eVIyc1VIOUxlWlZBaUY2ZElzM1d2UlRtend3?=
 =?utf-8?B?MmJkdnd6N1E2Z0dxZ01aL1FySGI5VGV6RDdZbjBKU3hlbnRVQjJaN3N6Tmht?=
 =?utf-8?B?ejRLNklyamRneGtVVFJmNTgvVFVZSnR4TkM5VUZoS2l6c3NicTNLWDRKOVll?=
 =?utf-8?B?MWI4WkpMLzd0VWlYRzh1MitWd0M1Qlk0dmUrVER6UE4wRzBad3NOYWZkUU1l?=
 =?utf-8?B?Zlh0aFdRdWtpTE02NGMyYldvUUR2WEFPZWNmK1lrbDZUcWozTml3SGxjbEV4?=
 =?utf-8?B?dGMxWkJGTlRjaTUvejYzeitzazhSV3QyYW8wU3luQUhOMG11NWlaNUVxRlZC?=
 =?utf-8?B?ekJSZ3N1YzB6eTdLN1BBbkNxRVIyVjZxQmZXYUF1UUJBN0c2OFBxVHQxM3pw?=
 =?utf-8?B?ZWsxVGhTRWJGS2U5VW9JekVYT1ZyakxPcllDd2ZwcTB3bEEyRFU0ZmdQS01w?=
 =?utf-8?B?RVFoYW1PWmcyVFhaY1MvNzdhSGd2aUpiYi8wYzZCY0FZcFpxdWtxQmxmb2Zv?=
 =?utf-8?B?S3F3Qy83cFlCWHF1c04vZW1jaDVzR1YybGg5cUd5T0wzSWxHSVZYb3JPb2lm?=
 =?utf-8?B?UWozeTRaTkd1NWJYMGtVUVk2QWdLWGE4bWUxWVVSSzJQZzF5L0pRMThodXF2?=
 =?utf-8?B?bTBPYzZRYjc5elRkS2hGYld3K0pCQ2xkc2NUdHFOdWtrMGJzcnNueGYvVFFT?=
 =?utf-8?B?QjZJN0JsZFhqYXFBTFdCVFhVZ3M1T3h1eVRmeUh4LzR3RE5qd0hHZ3FCUEtG?=
 =?utf-8?B?UU10K29acU94Q2ZyZ2I5Y3U1dW1IbmFtSGI2K3J3VGp1KzVpLzJkV1o4c0lH?=
 =?utf-8?B?V0duQlAyNkJ1b2NUUHQweEJER1Zvb1l1eFVuZnluWm5sQXNuTEk3b2sxV21K?=
 =?utf-8?B?ZXlVZHlWallJalpGVlRPUmJpdEtyVGZnUnU2U3l0TTI1U3FNdGN0ekY2QWhZ?=
 =?utf-8?B?OGJ6MmxqaHFPSFRwSWk5TDF3NG9yaFJvRUg2bTFqd3AvQ0pWN0I3Tm1SWDBJ?=
 =?utf-8?B?RDdoT2N2cDl2RjA0dStmSTZOUHJOWndFdjU2L2Yyb203WkdwQStXZWRyTmZF?=
 =?utf-8?B?QVlUZFRpWTZYMy94VmpJUzVmMEdWRi90UTI4UlhnVHovWTA5WlhadSt2Q1VW?=
 =?utf-8?B?U09BdjFScG1QOEJZV1hMQjRiRU0xNzJJRjVRRkdiQy83M0NEVzZxNUxVY3Bj?=
 =?utf-8?B?ZmJ4UzRXdHY2L2hoOHFHdkxwcFdXSWZ5d2h3NmxtcVN0M2V6cjBsOTRaV2tD?=
 =?utf-8?B?SWQ1YmI3blVTdVlISloxTWtnUDFQQmFvdGNQUzhmanNzNmxWZVpOVktNU3ZG?=
 =?utf-8?B?S3JySHN1M1ZTc1Y0MTJLSDJ3QWhtUUROTnBpLzhJcE40b0pBam5uMVk0NFJU?=
 =?utf-8?B?VWJsdEhQTS9zTmNzVmxmMTRURDB3QksxZjdmRTJNVFY5RFhUMTlrdWczcith?=
 =?utf-8?B?dll0bWVDYnA2TWVZYTJkVnYrT09OVzFPZ2hPMHRqTXRmOEg4Z2puZUpRWFp6?=
 =?utf-8?B?UGJjdWFtOTFjQWlhamlEQnZmS0tsYUc3QnBZQjY1Y0VjWUErS1o0KzArcCta?=
 =?utf-8?B?RE5xbmdORUZ6S3RHWEYySkNrY3FvTVdMTUpuNTFjQnlVTEdkUi9oZXJtWHBN?=
 =?utf-8?B?NUlwL2hiMEhMU0hUM2Q2bC81ZmZRZ1F3eE9ib1FUcVZFdmpBa1J5U3NIRWtX?=
 =?utf-8?B?SnJHdit6UWJmUFQ3RFE1eXZWOXZoUnlQdko0b1pva21hN2NHRElRcVFBTGc1?=
 =?utf-8?B?YkZaUG5nUFFIU1dDMTVZZVVwbHJTV0NaUmV2bEJLbUNHRHNGa1hEaHZDYTVQ?=
 =?utf-8?B?N3ZEeDhMRmg4d3docDU1UVJCSFNZQW1ISXRTSllPZDZ5bjJWUk0vRDdWTUkx?=
 =?utf-8?Q?jLUY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c688a50d-1373-467a-4233-08dc452960f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 19:52:00.2004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+WjsJ9kOhCwQi/RRM4vI0gneXZHVGMKb1qGdtRy1usjJS1Ho3SNLt5riqfEFls+CRA9GaindtyeluxxRjacqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6557
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 19:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197249

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFJvc3MgQnVydG9uIDxSb3Nz
LkJ1cnRvbkBhcm0uY29tPg0KPlNlbnQ6IEZyaWRheSwgTWFyY2ggMTUsIDIwMjQgOTozOSBQTQ0K
PlRvOiBEaGFpcnlhIE5hZ29kcmEgLVggKGRuYWdvZHJhIC0gRS1JTkZPIENISVBTIElOQyBhdCBD
aXNjbykNCj48ZG5hZ29kcmFAY2lzY28uY29tPg0KPkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnOyB4ZS1saW51eC1leHRlcm5hbChtYWlsZXINCj5saXN0KSA8eGUt
bGludXgtZXh0ZXJuYWxAY2lzY28uY29tPg0KPlN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW21hc3Rl
cl0gW1BBVENIXSBjdmUtY2hlY2s6IEFkZCBwcm92aXNpb24gdG8gZXhjbHVkZQ0KPmNsYXNzZXMN
Cj4NCj5PbiAzIE1hciAyMDI0LCBhdCAxNzo1MywgRGhhaXJ5YSBOYWdvZHJhIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+PGRuYWdvZHJhPWNpc2NvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4+DQo+PiBGcm9tOiBEaGFpcnlhIE5hZ29kcmEgPGRuYWdvZHJhQGNpc2Nv
LmNvbT4NCj4+DQo+PiAtIFRoZXJlIGFyZSB0aW1lcyB3aGVuIGV4bHVkaW5nIGEgcGFja2FnZSB0
aGF0IGluaGVyaXRzIGEgcGFydGljdWxhcg0KPj4gY2xhc3MvY2xhc3NlcyBtYXkgYmUgZGVzaXJl
ZC4NCj4+IC0gVGhpcyBwcm92aWRlcyB0aGUgZnJhbWV3b3JrIGZvciB0aGF0IHZpYSB0aGUgdmFy
aWFibGU6DQo+PiAgQ1ZFX0NIRUNLX0NMQVNTX0VYQ0xVREVMSVNUDQo+DQo+V2hhdOKAmXMgdGhl
IHVzZS1jYXNlIGZvciB0aGlzPyAgTm90ZSB0aGF0IHlvdSBjYW4gY29udHJvbCB3aGV0aGVyIGN2
ZS1jaGVjaw0KPnJ1bnMgcGVyLWxheWVyIGFscmVhZHksIGlmIHRoYXTigJlzIHVzZWZ1bC4NCg0K
Q3VycmVudGx5LCB0aGUgQ1ZFIHJlcG9ydCBpcyBnZW5lcmF0ZWQgZm9yIGFsbCBwYWNrYWdlcyBh
c3NvY2lhdGVkIHdpdGggdGhlIGJ1aWxkLiANCkhvd2V2ZXIsIG5vdCBhbGwgb2YgdGhlbSBtaWdo
dCBiZSBnZXR0aW5nIHVzZWQgaW4gdGhlIHRhcmdldCBkZXZpY2UuDQpUaGUgcGFja2FnZSBhc3Nv
Y2lhdGVkIHdpdGggbmF0aXZlLCBuYXRpdmVzZGssIGNyb3NzIGNsYXNzZXMgYXJlIGV4YW1wbGVz
IG9mIHN1Y2guDQpUaGlzIHBhdGNoIHdvdWxkIHByb3ZpZGUgYSB3YXkgdG8gZXhjbHVkZSB0aGVz
ZSBwYWNrYWdlcyBpbiB0aGUgQ1ZFIHJlcG9ydC4NClNvLCBpZiB0aGUgdmFyaWFibGUgaXMgc2V0
IGxpa2UgQ1ZFX0NIRUNLX0NMQVNTX0VYQ0xVREVMSVNUID0gIm5hdGl2ZSIsIA0KVGhlIHJlcG9y
dCB3b3VsZCBub3QgaGF2ZSB0aGUgZW50cmllcyBmb3IgdGhlc2UgcGFja2FnZXM6DQogZ251cGct
bmF0aXZlLCBuYXNtLW5hdGl2ZSwgYmludXRpbHMtbmF0aXZlIChhbmQgc28gb24pDQoNClRoaXMg
aXMgaGVscGZ1bCB3aGVuIG9uZSB3YW50cyB0byBjb25jZW50cmF0ZSB0aGVpciBDVkUgZml4aW5n
IGVmZm9ydHMgdG8gdGhlIA0Kc3BlY2lmaWMgcGFja2FnZXMgZ29pbmcgaW50byB0aGUgdGFyZ2V0
IGRldmljZS4NCg0KUmVnYXJkcywNCkRoYWlyeWENCg0KPg0KPlJvc3MNCg==

