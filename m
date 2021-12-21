Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB31C4332F
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 12:10:10 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web12.4990.1640088608825641960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 04:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport
 header.b=jvmh0lTZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2242; q=dns/txt; s=iport;
  t=1640088608; x=1641298208;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LK6m0h4/i///8XJKzynI9+87v1WkjMwmDfj1rRympVY=;
  b=jvmh0lTZGjq/jSmSIXMtO5fuISSbZOvQqFYBepxYf9LtaIdUdsZ8zEUS
   uim2yUqnF4/KRdI4sudbXYmC/PTD+T1IK3wXROg9urLXtUzICbof/hMaL
   PMISsCf3D/lR8GzClecavZIO7f+UmkuSt8xkhceFQFMjiwDuyC37KaJ63
   c=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AoqJAeBZnjM8Oi4fBAO9/nBr/LTAphN3EVzX9o?=
 =?us-ascii?q?rIriLNLJ6Kk+ZmqfEnS/u5kg1KBW4LHo+lFhOzbv+GFOyQA7J+NvWpEfMlKU?=
 =?us-ascii?q?BkI2skTlhYrVciCD0CzJfX2bis8ScJFUlIt/3yyPUVPXsjkYFiHqXyp5jlUE?=
 =?us-ascii?q?RL6ZmJI?=
IronPort-Data: =?us-ascii?q?A9a23=3AIg5OcKB7j25NXBVW//vhw5YqxClBgxIJ4kV8j?=
 =?us-ascii?q?S/XYbTApG521DEDz2IaDWqBbviCa2ejKdpzOom0pB9UuJ7TnYNjOVdlrnsFo?=
 =?us-ascii?q?1CmBibm6XV1Fqp7Vs+rBpWroHlPsoNOOrEsEOhuFiWF/033a+C7xZVB/fjgq?=
 =?us-ascii?q?oTUWbas1h9ZHWeIeA954f5Ss7ZRbrxA2LBVMCvV0T/GmPAzDXf+s9JC3s343?=
 =?us-ascii?q?IrYwP9nlKyaVDr1JTXSb9gT1LPVvyF94J7yuciMw3XErol8RoZWRs7Zx72/u?=
 =?us-ascii?q?2je5RpoU4njmbfgeUpMSbnXVeSMoiMJAO753V4T/WprjvZT2Pk0MS+7jx2Om?=
 =?us-ascii?q?Npw1NJRrrS7SBwiOevHn+F1vxxwQn8gYvUcpOObSZS4mYnJp6HcSFPr2/hoA?=
 =?us-ascii?q?UQ8MIEU9+oyCmZU+NQcKSsRdVaEn++wzbexR+Vgi8hlK9PkVKsFu3pgxCvVS?=
 =?us-ascii?q?+47W5zCTo3O5NlFzDk3m8ZCFOrfYMxfbiBgBCksyTUn1kw/EpkymqKjgWPyN?=
 =?us-ascii?q?mQC7lmUvqEwpWPUyWRMPHHWGIK9UrS3qQ99wS50fl77wlk=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A6eEFIa3sz1T3S8eFaK+f7AqjBfJxeYIsim?=
 =?us-ascii?q?QD101hICG9Lfb4qyn+ppomPEHP5wr5AEtQ5exoS5PwPk80kqQFoLX5XI3SEj?=
 =?us-ascii?q?UO3VHJEGgM1/qb/9SNIVyaygcZ79YcT0EcMqyxMbEZt7eA3ODQKb9Jq7PrnN?=
 =?us-ascii?q?HK9IXjJjVWPHtXgspbnmBE43OgYzRLrX59dPwE/fSnl656jgvlXU5SQtWwB3?=
 =?us-ascii?q?EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUCSw71M7aXdi0L0i+W/Kn0jS/a?=
 =?us-ascii?q?O4qcy2zRfayiv684lWot380dFObfb8yPT9aw+czzpAVr4RHIFqjwpF5t1HL2?=
 =?us-ascii?q?xayeUkli1Qe/ibLUmhJl1d7yGdgDUImwxelUMKgWXo8EcL5/aJHg7Tz6F69N?=
 =?us-ascii?q?5kmtyz0Tt8gDg06tM540uCq5RYAQnckCnK78XUXxtqkkayvEw5nfQIj3pZZ4?=
 =?us-ascii?q?sSAYUh3bA37QdbFowNEzn9751iGO5yDNvE7PITal+CaWvF11MfjeBEc05DVS?=
 =?us-ascii?q?tueHJy8PB9EgIm60xR3g8d3ogSj30A/JUyR91N4PnFKL1hkPVLQtUNZaxwCe?=
 =?us-ascii?q?8dSY/vY1a9Di7kISaXOxDqBasHM3XCp9r+56g0/vijfNgNwIEpkJrMXVtEvS?=
 =?us-ascii?q?o5el7oC8eJwJpXmyq9DFmVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+6r/AWEq?=
 =?us-ascii?q?TgKr6O0VJtcrbexEfVaPN0NjzFKu9vwCMlIb8oU/4AKiaznv4=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B1BgAKw8Fh/5RdJa1agQmBWYFSVQd?=
 =?us-ascii?q?4WjcxiA4DhTmFDl2CKJsegS6BJQNUCwEBAQ0BASoHEAQBAYFNgzkCgzYCJTQ?=
 =?us-ascii?q?JDgECBAEBARIBAQUBAQECAQYEgQkThWgNhkIBAQEBAwERLgEBOA8CAQgRBAE?=
 =?us-ascii?q?BAS4oCh0IAgQTCBqCXYJlAy8BoxYBgToCih94gTOBAYIIAQEGBASFCxiCNQm?=
 =?us-ascii?q?BOoMOiyQnHIINgViCMDc+gkwXBYFdAoNNgi6SAYEPJA2BWaF/nlMKJYMdimy?=
 =?us-ascii?q?MaIgDFYU5oiuWMqYnAgQCBAUCDgEBBoFhO4FZcBU7gmkJSBkPkhKFFFGEeXQ?=
 =?us-ascii?q?4AgYLAQEDCZA5AQE?=
X-IronPort-AV: E=Sophos;i="5.88,223,1635206400";
   d="scan'208";a="966702444"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 21 Dec 2021 12:10:07 +0000
Received: from mail.cisco.com (xbe-rcd-006.cisco.com [173.37.102.21])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 1BLCA5X6029227
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Tue, 21 Dec 2021 12:10:06 GMT
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xbe-rcd-006.cisco.com
 (173.37.102.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 21 Dec
 2021 06:10:04 -0600
Received: from xfe-aln-002.cisco.com (173.37.135.122) by xfe-aln-003.cisco.com
 (173.37.135.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 21 Dec
 2021 06:10:04 -0600
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-002.cisco.com (173.37.135.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14
 via Frontend Transport; Tue, 21 Dec 2021 06:10:03 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sisa5H4/OrswNEwh7k6u5Hk4UZl4brfHr43aAeitxumUDzaX2a4dAzownbwi+nD/g+VFAQR/nfM5t8fgQLfqMdUyTLJXqVbz6swAB/sN5BIGoHXMgCYRXdVeURDbbxwpVEe1AXxCUYAyEvNPpYXBY1NcyTY5B46bcNGNy+NalhgVVu/zqA1CMwGR8YGAP4H9TsWYND7S19UZbDOwndWZFbQvsoQ5OVQ5UHQwHczJa+VNvF5pX8aG6b7zwX3ee1uhslmvadACwsHD+uYNQEiIkqCZiq+GuNGbHR6fA0eANeJBVofe4f81yoYZSW6fJ3j+Ga0CSW44PD84HFcqWIhy/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY+eIvJ2PrOh1Ts7aT8NtZENi3pJHfKm7soFfEIZzyI=;
 b=JRmL1SI/0svGM9F9KLnOUBuj+w82oSiF6uDqtXF4MDkgIThny7vUHUk7DE2JY2XSZFlvwThLVzHWteJGEGDy4hpZGeVa5C83o7jC6U2gG2dUJkEeH486oWmQfqQbkEyrdCwc7vkl086B5PdvBth7pM55z/ooOgCnuft53KBXzb9BmLzs3UVrGpwSXVPZfcWezMYPNyAP0uEfAZ6EZERCJvqvRpEnBlLpDEWPdonCqRcs5zGLMcr+hyDyrngt9pUvkWVaVcpa3dEX63KeAelM3YLvdgj1ukkOBXBCBwamGppp1NjSs7/Kov76mQ2cehN4zLAJcEGUz0mCl4XadDAOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY+eIvJ2PrOh1Ts7aT8NtZENi3pJHfKm7soFfEIZzyI=;
 b=gIoJXFghs0NY/cAK+sN/8p2Wd2ya4NG/R2EWJoBXREkXWiLU8OvfE3OCF4zaQKWfE43HpJ02+jsNAriCJCiGfKBF/oCFIe1ast6xce3hB6mbBKPg522IjesxDY2OGaxxgY23WFDsMV4NNfMcGZN0Ml0oKmeNDkYl5TWntYfdpfs=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Tue, 21 Dec
 2021 12:10:03 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3150:dd81:6bcd:eeb8]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3150:dd81:6bcd:eeb8%6]) with mapi id 15.20.4801.021; Tue, 21 Dec 2021
 12:10:03 +0000
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Patches and
 discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Manifest for host (nativesdk) is empty
Thread-Topic: [OE-core] Manifest for host (nativesdk) is empty
Thread-Index: AQHX9NActaQNxm/lbES9g5XUwf15LKw7PXyAgAGfhRA=
Date: Tue, 21 Dec 2021 12:10:02 +0000
Message-ID: 
 <PH0PR11MB49023D65534F2B2ED0E3BB54D77C9@PH0PR11MB4902.namprd11.prod.outlook.com>
References: 
 <PH0PR11MB490252E71EAA39C3EAF277ACD77A9@PH0PR11MB4902.namprd11.prod.outlook.com>
 <35ef1b81e16d9319a9696beb3f590c6087622be7.camel@linuxfoundation.org>
In-Reply-To: 
 <35ef1b81e16d9319a9696beb3f590c6087622be7.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8628f371-8ecd-1e41-a757-5bbb16abf2f4
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b015e515-8f80-46a5-a4f5-08d9c47ad18a
x-ms-traffictypediagnostic: PH0PR11MB5949:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB5949957CE7FE62DB1A1B270ED77C9@PH0PR11MB5949.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iaRx5DOKGKPXzUzTFIG+Rrh1cERVAFBd0uRp+EsujCMeJJvI7WSXm0til2PUEbYoDiSBK2K2XLtc0sR8BLICzSKrbvEFGV1Hllx8OyHNqNklQ3CoYeX/azJyAo6s2advXzTiy+eQElPVL5P2Zx44RZ1FdE4EaSG2B3ttbkElArbKflAOINxYSE4ntqsRWoMgFOk5nkvSE1tuFjFc/ND9dhUl8GwmEf4dcHDjUOntgF2HpYmCrHR8bkKjRC6VeDujQcaVNO4yYJS/vRTQB2yvmxdjO0Bo5xsggzIjGYAm6FMR+Eg0ygHnOj3XbPdG0XvMMzg9o/wA9ft2PTcvuObQQLqh/2Ulr5cgcJy7d/KKW1bwc8E++54g+v9TDCMZzYpWFuSaLgnvRxEPWpig+Qz+VnAieTrCUVo8UtvhZRtF0cspEVwhUJNXSuqgnjl+6es+fatL/jhwQV/i8/DxioQur76Dzg2vWEkIw/o+seBIPhgXs/yi94pjfkQ0BglLKHlw9Av1N08jy3HdtYDZU4mDSkwu4ApV4tQnmBO7dfX2qCGaScXYplstS6i2tVQwLs+OQo5r5PcvQMYQP1gM7V0gnEj0J/J6omDJX6C17IcY9ZwDXrXZNr4WjRoGnGJ2dBRm+L9PUYDpwvtWRlSw8p+qIUfDR0ylv1jZml2Lb3Gi0Yd6tjbylCFSIMt5O7hz0CEjW+Rcxyjrg36WqheAkmFCbg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66446008)(55016003)(8676002)(64756008)(66556008)(8936002)(53546011)(33656002)(508600001)(4001150100001)(76116006)(91956017)(86362001)(9686003)(71200400001)(52536014)(316002)(66476007)(2906002)(122000001)(186003)(26005)(6506007)(5660300002)(66946007)(7696005)(38070700005)(110136005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XxyX3r5hL/qbyKp/IQhI53mlPZHIG1rsvsubcP5anfV0POlVA2UUAKX2Og?=
 =?iso-8859-1?Q?le/RJ5eevcA3KNSn+X3QXDgfB1YtQ7ClzttvEmqkNO5EcwCdYjB5X2rDID?=
 =?iso-8859-1?Q?WM6U8MM7xor3/D+LICGColWKc99qDtK1yo+tniEzurnufSciZWJWyi1BRY?=
 =?iso-8859-1?Q?VPx4ABKt03QIAMEJn0ZjUS/Y9g8yMA2jk2cJszED77VRpUX5rBd29uRuV6?=
 =?iso-8859-1?Q?rDKZIsi1p3v/A7tGzJW2oN5ghExECCZfIZoAV0hQbKTZ3KSJWVr/hOP2lR?=
 =?iso-8859-1?Q?PFEsndidcGgYHEGj2Ur8PYhKPycaCgpHHE/i8Ddg6YbO0P8N9q2fT+kL7x?=
 =?iso-8859-1?Q?bv98W1Dx2Re69OGQPCH3U05bttFZrz3Yds+iqPMgwb5Tfo+mP4BRLnOlka?=
 =?iso-8859-1?Q?bvGtkDHwPER7S8Wq2dzNOLYbtcfUcmZ9jrEbbMqZvYiPenTjLUXXcfoCMb?=
 =?iso-8859-1?Q?4XSUq+3P/U+2wl5uCqy6iVwUdswEmSNbFvOJYe/PoJ2vj/9M3N9EKBg1bS?=
 =?iso-8859-1?Q?I+OwdVkmq6HxKHzbEQpf3Yj6ln20kwFwUoLM49MkdgNv7Mj3sJLmsk6tsI?=
 =?iso-8859-1?Q?6wDWxB3naxh7sq154KMjU8udRYzN/rg3oYYGrb4ZYQThhTaDBP0/udvmSr?=
 =?iso-8859-1?Q?gHxzjTD2SAMcS3P76csYp6MDOPj+NT6reS0jvKRSmbzXgcfU5r8QnrKOGP?=
 =?iso-8859-1?Q?sg/MPaW7p51JZmx5aEosxocA9Ag3wp5MvE8JJOpbyngV2hB4+D+FsT1fhZ?=
 =?iso-8859-1?Q?aP87gdZP3VqW4jkMvtB/lL1r/qEJSz7ZLNbHPfXCnGwteBNpUIw10OSgHr?=
 =?iso-8859-1?Q?G3k+06PI64sIy055cRVHD/bX2fT6qjblp6NOSfguHro7BNN2F1XWdfC0EO?=
 =?iso-8859-1?Q?P3YgqhfZuLD4Y7LJ6wQYpNQpaefSIVisEKOvIP4YQOsOPGlOXRt2LcbHoa?=
 =?iso-8859-1?Q?Qg1fh+UasllbSUyi1WhwjgklIhuN0+6muItuRtOyCqS/KnYz3LqpUUHXqd?=
 =?iso-8859-1?Q?/NWNY3HBShc5DkBPJvncky11KmMqiXX0sbozdiF5sOXARcn1bM4e9xNLFZ?=
 =?iso-8859-1?Q?DXmj+AKC0T7hkp3enPpJl0srmqztvLYRxBV1kyNrfSgQW86UT1tUwrXHAv?=
 =?iso-8859-1?Q?7MO+7vOfbQVoGlCno9nlBL114Nek/DQ0igQG3HECFxEHZPS/oYMDE/ASUa?=
 =?iso-8859-1?Q?G9FVpaHS6+23CQXlnw3rc8uji9BNbPc629ACD9eTv0SucfS+CTxaNHUZzt?=
 =?iso-8859-1?Q?Ju5gme9ofvSKUQ3ym/QLdbnDb8nXh7950J2rr4h+4UkdUfLPQXhKArkDIi?=
 =?iso-8859-1?Q?NXcGNJ91wNSCWSles4VuBKng39UVb3k9zF1hoS1yB26smgtDAz07GaGPPb?=
 =?iso-8859-1?Q?cfXgL0WKgZpOpdjkGaOOMwe8HjjCEXWkbmgeRxMlksLh8TuQJeo5jgvprZ?=
 =?iso-8859-1?Q?ODXaqjtvqHOQyVpZI6+yuEkwLCGo9D07My4UhTFElYwpdFB9eZDSwFekuE?=
 =?iso-8859-1?Q?xFZMYtFzsI1eh7UC9YIcOyHYbklPsxxtY8/3yz8GlPzdO4OxThLNLLVt+N?=
 =?iso-8859-1?Q?K3GL2M87ct4sgzFxA+rgTl84axShUxkPO8/PTBtw6F1qSflsRm1q6uwo0d?=
 =?iso-8859-1?Q?gPJ24EJWC5PXnPxA/Ej0ETo0LJlVWdVhvbs47d5CjgpM6pD1wSgWS/ew?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b015e515-8f80-46a5-a4f5-08d9c47ad18a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 12:10:02.8701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 RkpYzE74co5Zem89Go0hqlTIvJQ6wG8TirGcpZMG5gM7xx5cbdL6QV+2W6m1X5QQC753tzAk2uy1lFHjWz6APw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.21, xbe-rcd-006.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 12:10:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159915

Something like this helps with host manifest.=0A=
It was just a guess - I found similar workaround into meta/lib/oe/package_m=
anager/ipk/sdk.py.=0A=
If it appropriate I could arrange it as a patch.=0A=
=0A=
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pack=
age_manager/ipk/__init__.py=0A=
index 4cd3963111..37962fb689 100644=0A=
--- a/meta/lib/oe/package_manager/ipk/__init__.py=0A=
+++ b/meta/lib/oe/package_manager/ipk/__init__.py=0A=
@@ -62,6 +62,13 @@ class OpkgIndexer(Indexer):=0A=
 class PMPkgsList(PkgsList):=0A=
     def __init__(self, d, rootfs_dir):=0A=
         super(PMPkgsList, self).__init__(d, rootfs_dir)=0A=
+=0A=
+        # In sdk_list_installed_packages the call to opkg is hardcoded to=
=0A=
+        # always use IPKGCONF_TARGET and there's no exposed API to change =
this=0A=
+        # so simply override IPKGCONF_TARGET to use this separated config =
file.=0A=
+        ipkgconf_sdk_target =3D d.getVar("IPKGCONF_SDK")=0A=
+        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)=0A=
+=0A=
         config_file =3D d.getVar("IPKGCONF_TARGET")=0A=
=0A=
Regards,=0A=
Oleksiy=0A=
=0A=
________________________________________=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie <richard.purdie@linuxfoundation.=
org>=0A=
Sent: Monday, December 20, 2021 13:20=0A=
To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco); Patches an=
d discussions about the oe-core layer=0A=
Subject: Re: [OE-core] Manifest for host (nativesdk) is empty=0A=
=0A=
On Sun, 2021-12-19 at 12:16 +0000, Oleksiy Obitotskyy via lists.openembedde=
d.org=0A=
wrote:=0A=
> Hi All,=0A=
>=0A=
> I'm working with gatesgarth and after 'bitbake core-image-minimal -c popu=
late_sdk' into .../deploy/sdk=0A=
> contains image installer .sh and manifests *.{host/target}.manifest. Host=
 one contains list of nativesdk packages.=0A=
>=0A=
> In honister target manifest is ok, but host manifest is empty.=0A=
> So, my question is it known behavior/done in purpose or not normal behavi=
or?=0A=
=0A=
It is unexpected and needs to be looked into...=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=

