Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F90DC77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 10:04:43 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.46317.1685354682032063405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 03:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=DtgTm7Dw;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2268; q=dns/txt; s=iport;
  t=1685354682; x=1686564282;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=my66e69xwzfUJgHGQBy6LhZpwu4bYtzjX5nuouu/bfQ=;
  b=DtgTm7DwDnaeWYnpDQQPEdgn9WK3uw33HM5cE81vEIxlJqxtHqFbQOv0
   31GBAtcaI8UlEgPGqomnirkWhmGjEsD/9D//rBxGm806hacTBRrkJNw6U
   hBLvUgpkOCWUEs6oDd5DEHJqbQ43dNO/dXC9ey+0kmvByPAbM2SgpbcpX
   s=;
X-IPAS-Result: =?us-ascii?q?A0ABAABJeHRkmJ1dJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBXCoocwJYPRothFGDT4ROiSOLUJIXgSUDV?=
 =?us-ascii?q?g8BAQENAQEuCwsEAQGFBgIWhUYCJTQJDgECAgIBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?QEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaA2GBAEBAQEDAREREQwBATcBCwQCA?=
 =?us-ascii?q?QgRBAEBAQICJgICAh8HChUICAIEAQ0FCBqCXAGCKAMxAwEQoD0BgT8CiiR6g?=
 =?us-ascii?q?TKBAYIIAQEGBAWBSgJDmkENgkkDBoEVLQGHU4Fkg16ESCcbQIFNgViCaD6BB?=
 =?us-ascii?q?YEbQgEBgWIFMQKDITmCLo5ZjT2BMHKBI4EogQICCQIRQSaBDghngXRAAg1WC?=
 =?us-ascii?q?wtlgSZVPoFNAgIRPhAFVX0SARMDBwQCgQgQLwcEMwkXCQYJGTEnBlYHLSQJE?=
 =?us-ascii?q?xVEB4QEAwqBKTU3A0QdQAMLOzo9NQYOHwUEIwEeLYFYBC9CgRkCBAEkJJx/A?=
 =?us-ascii?q?4NSZ4EYa5NfgmhIrHdwCieDYYt7jRqBeYYnF4N/jGqYZwuYAyCCL4sLg3KRK?=
 =?us-ascii?q?YUUAgQCBAUCDgEHgWM6SIEBCwdwFTuCZ1IZD44gGYEPAQ6CPYF/jXpDMjsCB?=
 =?us-ascii?q?wEKAQEDCYtGAQE?=
IronPort-PHdr: A9a23:yFN8VRAsX2AY4+rWMavRUyQVoBdPi9zP1kY98JErjfdJaqu8us+kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+iLzKlBbTf73fEaauXiu9XgXExT7OxByI7HuEY7Tk96w28i5+obYZENDgz/uKb93J
 Q+9+B3YrdJewZM3M7s40BLPvnpOdqxaxHg9I1WVkle06pK7/YVo9GJbvPdJyg==
IronPort-Data: A9a23:wDrcKqpngmdUT93egcK/wzbdtEdeBmIdZRIvgKrLsJaIsI4StFCzt
 garIBmAafyLamH0L9sjYIq0oEMDu5bRzYQ2HVFl+Hg0RH5E9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILas1htZG0k8EE/NtTo5w7Ri2tMy0IDga++wk
 YqaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDf3Zw0/Df2VhNrXSq
 9AvY12O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/RPjnRa70o1CBYTQRcN1gSJp/5D8
 Y9qspmsSjctHKDeiOtIBnG0EwkmVUFH0KXMLX76usuJwgiYNXDt2P5pSkoxOOX0+M4uXjoIr
 qNeeWtLN03c7w616OrTpu1Enc8jLdXxO483sXB7xjafBvEjKXzGa/uWvIQHjG1v7ixINcqDd
 e1DRQVuVyaaWTZVFk4PKrkGst790xETdBUB+A7K+sLb+VP7yxR81rXoOtfZdtGGAM5ShEuwo
 mPd43+/BQkXMtGawzeJ/n+gwOjVkkvGtJk6Dra08Lthh0eegzJVAxwNXlz9qv684qKjZz5BA
 xxOpxsulYYAzRaMSdzhXC28gnOWrhFJDrK8DNYGwA2Kz6PV5SOQCW4FUiNNZbQaWCkeGGBCO
 rihwomBONB/jFGGYSnCqerM/FteLQBQfDBSP3ZVJecQy4C7+Nlbs/7Zcjp0/EeIYjDdAzr8x
 XWBqzIzwutVhs8Q3KL99lfC695NmnQrZlBpjuk0djv1hu+cWGJDT9f5gbQ8xa0eRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxT8R7pmTzoCb+J9E4DNRCyKFBb5ZsldjBP
 RC7hO+tzMQ70IaCNPUuONvhV6zGM4CxRIuNug/ogipmO8gtK1DvENBGbk+L1Geli1k3jaw6I
 v+mnTWEUx4n5VBc5GPuHY81iOZzrghnnD+7bc6glXyPj+HBDEN5vJ9YajNimMhjsvPdyOgUm
 v4CX/a3J+J3C7ykOneIqtRPczjn7xETXPjLliCeTcbaSiJOE2A6APiXyrQkE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:tgDh+a/Yt7HR1lAU4oFuk+F1db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQ4dcLC7UpVpQRvnhPpICPoqTMmftW7dySeVxeBZnMbfKljbehEWmdQtrZ
 uJ/cJFeabN5DRB/KTHCUyDYqodKbq8ge+VbIXlvg1QpGhRAskKj3YbNu/YKDwKeOAsP+tfKH
 Po3Ls/m9PWQwVwUi3UPAhhYwHEnbD2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJp5mLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4N1HqWxa0+
 UkkS1Qevib2EmhOl1dZiGdnDUI5QxeqUMKD2Xox0cL7/aJHQ7SQPAx9L6xOiGpm3bI+usMnp
 6iGwmixsFq5dSqplWk2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZJIMvW0vFQLA
 BVNrCU2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZLyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR/2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKggFCvsuk6SRloeMMYYDaxfzO2zGu/HQ0ckiPg==
X-Talos-CUID: =?us-ascii?q?9a23=3Az2kTzWp8KjWjOsDLGGmpnozmUZB/L0zd9FniGhW?=
 =?us-ascii?q?fDmN1S42Ra1KC6Kwxxg=3D=3D?=
X-Talos-MUID: 9a23:L7fmJAsrW0bAJMnSb82nuGxwE51E3KWVOho3uo8qotGmHhReAmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 May 2023 10:04:41 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 34TA4eeP031433
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 10:04:40 GMT
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,201,1681171200"; 
   d="scan'";a="2069853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiKp2FIOjpbkxSRunaSgGLtePCbXRQFJMLx6gTlKnDNi83C3Ps65tY7sWXr1lAuZBLpRpMlVFVzUe654uRK8sH2pIliT3f83JwvnrVF2QkPbvsBS6Y5rL9YjOamXnThsCNXUGUXMLMNPzvi/ZWkvhUuX1do24ZQqNc0wQsLZF6nSKGAKHFv2f9cHiCg1wF4aDPCltHjAXO4St83gHjpDN2l3RT41vAfhZZ5gc1LmCHGcXGFpcocCD0OMblt9jCzGdWkRP0MyT4+9n3+kn/BG1nwELaStTyBuSpVZ5oSFfb20WObPAm4qb+oUBLhs6NeBxpgJIKBMVXQOMrwpQKgTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my66e69xwzfUJgHGQBy6LhZpwu4bYtzjX5nuouu/bfQ=;
 b=ibNmdc079tF8atZYA/WlJSqKnRGbohHK+1aX/lF9XdfiW2GDRmfZtiLLyLBBu3PO3Qt0vJAKeg89SW0B5xlfB/Tc6NylWJSG6mrjUurHfdOntFHIQVFx0PgSGJ72CTVpVmvesDr1bKcjhdNGVL2A/OiltAdmLGJFVjXAOa0abtVnW6J3z3BZimZu5+ompJ+9fSJCcxHLVuZuWruY7MDJPlFQOIo0Zb1LO7j+UfFXqFM7CmqYpF1NqBekj8AWSoy4rrYfgcesz4G1sqduaEDuT8ojo0ymdfmp+ghHjTD1pGEyMOhZ77IKCaPvz/lA/TBIiCciap1CfHBGwm4EsBw3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my66e69xwzfUJgHGQBy6LhZpwu4bYtzjX5nuouu/bfQ=;
 b=Iyv+Na8LILlLoYMAE9R+1RMRub8aTCxURMCm2xEbyvFfL8a3czD/MeQuNZ6icxbIdYftYrDp28eBKaLUuVQhL35OGtw1W0RwRMM2GsN+fyH2I/IfVBdWuVfe8xdtauPpA4YxssKMLoWMn2Vc9i8nLtnt8Jx2d6l3iz09IAIJExs=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 10:04:39 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 10:04:38 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Martin Jansa <Martin.Jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Marta Rybczynska
	<rybczynska@gmail.com>
Subject: RE: [OE-core][PATCH] sqlite3: Whitelist CVE-2022-21227
Thread-Topic: [OE-core][PATCH] sqlite3: Whitelist CVE-2022-21227
Thread-Index: AQHZkSi6Z7xD9vvOZk6/O4IA1imQCa9w2hMAgAAUC3CAABLwgIAAAFoAgAAFD5A=
Date: Mon, 29 May 2023 10:04:13 +0000
Deferred-Delivery: Mon, 29 May 2023 10:03:53 +0000
Message-ID: 
 <SJ0PR11MB6717BED7D1F2216C6CC663E9DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230528055252.3869703-1-schitrod@cisco.com>
	 <CA+chaQeCpJ-70Je8non8KADuDk8SZzysN7KiDFNFDd3-dVY6sA@mail.gmail.com>
	 <SJ0PR11MB671709960318A78D507DF394DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
 <4f049c921da7f473f90d63205de9391b153db51c.camel@linuxfoundation.org>
 <176394B80BEA3A08.6918@lists.openembedded.org>
In-Reply-To: <176394B80BEA3A08.6918@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|DM4PR11MB8157:EE_
x-ms-office365-filtering-correlation-id: 2e9f24ee-2968-4554-5e49-08db602c1d3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZIPYs1roSZJDLWy3MlOIcfI4E6wzw9VtU2PSkmp2oq37BN0yL5kkItph7MoLTrXFxJDcTTqQK2sspcO3ht03B0iW0aSzE/v5BdjycKySY4UFGUkbjuo5M02O4J50bFRdLnVycNkx1Cze90HVgIsuCx9zjX4Pcvlxqg7dtpPAj2aKS29/9F8UY6poBXfVri1yIrrLp0ET222MgRGH3R+JpleefDk5kGDRy4JgvbAkMZqBmTlcOtI1wmF7ucUr+KcLnh1dUgxmCzV9NUjWQP3HSA90LBPEQSF0Nz5zeB6I2A3UbMijZvzLtmtuDrT46H7JDMJlQ3wnqDqJtIJwy4VnHai1SxBltR1euDVbzvH3stMlyHF93UOaer0kRfQmXEYMcP2k+YIVbu32dipPCjqZ7wy6QzQMFGSrJ8//Bi7zvr38Q6X5gDrLMHNXvo1IoX2HVG1dfp89MbvNks6ABvGI8pASzCwp8fiatfezVPfiqQyCwds3mEnfFERIC1SIt6DPi8v0u84d525K8TTROIojob5QvpuwrJzMcN5XAqdMEl8NR+8bOLLeloJUq1gGXPHxZsTQnWDt782dzqhtWm1DsXc8m6Z/7K1Kpfe9ojx/3AH9RSMYR3pN7tW/9vKDKytNzqIy7geXD2+kPOTne5Kr6A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(478600001)(2906002)(186003)(9686003)(26005)(53546011)(6506007)(52536014)(5660300002)(122000001)(8676002)(8936002)(54906003)(38100700002)(110136005)(83380400001)(966005)(86362001)(38070700005)(7696005)(41300700001)(33656002)(71200400001)(316002)(4326008)(6666004)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cytYSjNxbEVMTzFTN3BlMlRzZXBYSmV4L010d21IWmh5ZkJvZHpneXdzQyt5?=
 =?utf-8?B?dEVuN0kzQVdMUmVoWXZZbTU3Y2w5b2tJakFLWUUzTUNwNzZYSE9LejZCZjN1?=
 =?utf-8?B?a3M2U0FhRVlJcHRON0kxeU14LzNxSlF2T1JVNCtaMWlpSjBhL0F1Rk9aRTR6?=
 =?utf-8?B?ZmVpODdPQVd6ekc2OC83eWlFNW1KaWlzYnJSRElCTnpBRlpkZW5jZnJ3b1U1?=
 =?utf-8?B?dnJnYjNkK3UyQm12Q3d1b2ZlMzJOd2V2Q3cxZ1U5bUdrYXFMVzZzbWRSRnBr?=
 =?utf-8?B?MndoZ1RKckx0SnBhbExpd1k5RXE2WEw3WmF3S0dHWWdiRWVzUXV1clh2OWEz?=
 =?utf-8?B?ckZUTzJSQjF5UkFTdGFPNUE2bDBMUkNSWHRzNUhnS3ArZjNsY0lYUFlwS2h0?=
 =?utf-8?B?N3ViYklnSVhlcVlFUnd2THhCNEVvb0JtWTRnSVBsajBnM29XTldhV0ZvbFhw?=
 =?utf-8?B?MFdLbEUzMlNxZGFFS2pXc09YdkRnRllGcDVicmVXQ2c5QVpnQk54Z3RZV01N?=
 =?utf-8?B?czA2T3JOS0xFQzNyR0QrWHIzZVVEZGZpM2JzaGg1ZUprVVVldXo2RWtKM2JL?=
 =?utf-8?B?d0pWa0JNMzhiaWZYSTVXcTNycEpGWWFhWGtuS2JDejJMK2tDeGJuVGJKQi9B?=
 =?utf-8?B?dXpQS1pDd05CcHg5UXNMWDdrdWRGL0tFdjdjRUNIcSthSnNDQXoxSktmanZJ?=
 =?utf-8?B?YWIvekRKSVhMM2xVY1VlZ0NyRmdob3VtdW80U3FQa3NuMExhc3F5ODRId0E5?=
 =?utf-8?B?QTliRk5nZVVMNmNqU1NUQlhPR2tPNFZ2azBlV3pGNjFSeWZpaHkrVjAxb0dH?=
 =?utf-8?B?UkxyZmNvSXFxUkUzV2JVK1BPTERNaCtFSUJUVEpxeldhWU5JQTYrdFNhZ3I2?=
 =?utf-8?B?V2xDS0lZbFpPdzRTOStuNWJIYlNBampwQ1RTbmpSWjM0Z0dlUjROcmk1Z2dX?=
 =?utf-8?B?cTRKL3BjTWQ2NkE3cFVBQ0lmb0ZHMFFnOFQvVHhadW5pTXlBS0lkL1ljYm5K?=
 =?utf-8?B?a0NXQllaM3JpM3JTR0VseVBtSldRS1k0T01JUlF0eG9vcTRtcndoYjVvTXpQ?=
 =?utf-8?B?aXFZQmQ5RStTSm1PT2JyY3hDZmpWaXlVbjJ6YkRQVE9EM1pRTmlOZXdQVHIw?=
 =?utf-8?B?SWw0ZFJsV3V4a282M0JDaWVWNnRGbGc0blZEMndTZ2RBWmIxajRzdHZzb1JR?=
 =?utf-8?B?V0orNDAvc0NKM3Y0OUJ3YVlpMy9DenZuTys5MnNlNjJLUnp2N1pFbEg5WjZy?=
 =?utf-8?B?UWZlN2RBN2ZFVFNyeVNMOHJrVzdEenlXK1BVTGNKamROZ1ZkY1FIb0JhNzRP?=
 =?utf-8?B?UGdmYjRxekduUmxiUGlhTitjb3I3MnFlS21RNjlTNzdBQ0FsV3hiN2xJMEtN?=
 =?utf-8?B?SWZ2UU1kc2dJbmwrVHI5c3ZTSXhyR016eHhmOWc2b2pZSUl5TzVmSG5aMXJ2?=
 =?utf-8?B?Q0xQUGVBUGMxMzNUb0d4Y0FvZHlGaEE0aCtKR0FrV0dvM1ZDdGEwWG1hZjlP?=
 =?utf-8?B?YWkvRjdnM3h3M1F5Q2ZzRmEwTk92cjY2MVMrSVFtQzJxMjlGYUM5N3kvaGZt?=
 =?utf-8?B?MjY3VFNDWXBPUlFRLzkzZG9aaGdhTGhHUkVjMHh4YnZndkZVdUlQRUI2SmFm?=
 =?utf-8?B?YXQwRVpDTTZ4NjZPd2gxLzI5Z2hhRXROclF1WVRFRkc1dzFYV0FKNE9Ocktx?=
 =?utf-8?B?Q0w3SGYycElyT21nOUViR2NFaVlFdTc5N3pyeXV0QzZGUVJiczY3MjdkM3RC?=
 =?utf-8?B?cmVjUFEwWXpWZ0JjZDdRay8xb0FQdFgzSzFubGpsUkpvY0RQTGFvV1dMakEy?=
 =?utf-8?B?cDh1dmt5c3dyTHMwSjhVRHZLRzNHQkVHbnVIWHlmZXJrSlRLUUFRRk0zTklO?=
 =?utf-8?B?MEpIWmtjbUVsZ0llZnZBdGQxVjRVZG1YbmdYQVFwT09EZkZtQVRtcTlHMXdL?=
 =?utf-8?B?SlBsSkZ5bmtoMmtEdFZUSlIrcjNDMnpWeGpVZEgwT0daUDgvSUxvZ0NibnBP?=
 =?utf-8?B?aFZNaUlKSGFtTHR4cElHdjREVVkyMFhrTUxTWU9KMDFwYlQyd0d0dWdsM05C?=
 =?utf-8?B?RWRkMDJiWmdHTE9rT1R4S0NlK3pGS1hzRmpiTExYU3FBYTdsd3k2SDFrbkJt?=
 =?utf-8?Q?ZlAgi4/rm6fZXy4C8Ob7emLLQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9f24ee-2968-4554-5e49-08db602c1d3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 10:04:38.8110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kmWAFomsAHHFSd2HG46XeMiSp2HxrLrmKztxyC/GLaQiZh+usItzYmuca2REZNVMP+1970TeaHnwqk4118CCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 10:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181861

SGkgUmljaGFyZCwNCg0KUGxlYXNlIGZpbmQgYmVsb3cgaW5mb3JtYXRpb24gb24gc3BlY2lmaWMg
U1FMaXRlMy4NCg0KTlZEIGhhcyBDVkVzIHJlcG9ydGVkIGZvciBzcWxpdGUgYWdhaW5zdCB0d28g
ZGlmZmVyZW50IHByb2R1Y3RzOg0KMS4gc3FsaXRlOnNxbGl0ZQ0KCS0gUmVmOiBodHRwczovL252
ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMC0xMzQzNQ0KCS0gVGhpcyBwcm9kdWN0IGlz
IGFwcGxpY2FibGUgdG8gb3VyIHNxbGl0ZTMgU0RLIHNvdXJjZQ0KDQoyLiAgZ2hvc3Q6c3FsaXRl
Mw0KCS0gUmVmOiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMi0yMTIy
Nw0KCS0gVGhpcyBwcm9kdWN0IGlzIGFwcGxpY2FibGUgdG8gTm9kZS5qcyBTUUxpdGUgd2hpY2gg
ZG9uJ3QgYXBwbGljYWJsZSB0byBvdXIgU0RLDQoNCkNvbmNsdXNpb246DQotIFRvIHJlcG9ydCBD
VkVzIG9mIFNRTGl0ZTMgc291cmNlIGF2YWlsYWJsZSBpbiBTREssIHJlcXVpcmUgQ1ZFX1BST0RV
Q1QgaXMgc3FsaXRlLg0KLSB3ZSBkb24ndCByZXF1aXJlIHRvIHJlcG9ydCBDVkVzIHdoZXJlIENW
RV9QUk9EVUNUIGlzIHNxbGl0ZTMuDQotIEluIFlvY3RvIFNESyBzcWxpdGUzIHJlY2lwZSBzaG91
bGQgaGF2ZTogQ1ZFX1BST0RVQ1Q9ICJzcWxpdGUiDQoNClRoYW5rcywNClNhbmpheQ0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KU2VudDogTW9uZGF5LCBNYXkgMjksIDIwMjMgMzoxMSBQ
TQ0KVG86IFNhbmpheWt1bWFyIGthbnRpYmhhaSBDaGl0cm9kYSAtWCAoc2NoaXRyb2QgLSBFLUlO
Rk8gQ0hJUFMgSU5DIGF0IENpc2NvKSA8c2NoaXRyb2RAY2lzY28uY29tPjsgTWFydGluIEphbnNh
IDxNYXJ0aW4uSmFuc2FAZ21haWwuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc7IE1hcnRhIFJ5YmN6eW5za2EgPHJ5YmN6eW5za2FAZ21haWwuY29tPg0K
U3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gc3FsaXRlMzogV2hpdGVsaXN0IENWRS0yMDIy
LTIxMjI3DQoNCk9uIE1vbiwgMjAyMy0wNS0yOSBhdCAwODozOSArMDAwMCwgU2FuamF5a3VtYXIg
a2FudGliaGFpIENoaXRyb2RhIC1YIChzY2hpdHJvZCAtIEUtSU5GTyBDSElQUyBJTkMgYXQgQ2lz
Y28pIHdyb3RlOg0KPiBIaSwNCj4gwqANCj4gSSBoYXZlIHByb3Bvc2VkIHNlY29uZCBjb21taXQg
dG8gcmV2ZXJ0UmV2ZXJ0ICJzcWxpdGUzOiB1cGRhdGUgDQo+IENWRV9QUk9EVUNUIiAtIFBhdGNo
d29yayAoeW9jdG9wcm9qZWN0Lm9yZykuDQo+IMKgDQo+IE9uY2UgYWJvdmUgY29tbWl0IGlzIGFk
ZGVkIG9uIG1hc3RlciB0aGVuIHdlIGRvbuKAmXQgcmVxdWlyZSB0byBhZGQgdGhpcyANCj4gY29t
bWl0Lg0KPiBBcyBDVkUtMjAyMi0yMTIyNyBpcyBkZXRlY3RlZCBkdWUgdG8gYWJvdmUgY29tbWl0
IG9ubHkuDQoNCk15IHdvcnJ5IGlzIHRoYXQgd2Uga2VlcCBnb2luZyBhcm91bmQgaW4gY2lyY2xl
cyBvbiB0aGlzLiBBcmUgd2Ugc3VyZSB0aGUgQ1ZFIGRhdGFiYXNlIHdvbid0IGxpc3QgdGhpbmdz
IHRoYXQgYXJlIGFwcGxpY2FibGUgdW5kZXIgc3FsaXRlMz8NCg0KQ2hlZXJzLA0KDQpSaWNoYXJk
DQo=

