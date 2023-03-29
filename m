Return-Path: <gauragup@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DFBC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 16:51:26 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web11.1733.1680108677800097058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=gqJ0ypp/;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: gauragup@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5229; q=dns/txt; s=iport;
  t=1680108677; x=1681318277;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=qlo4zp2XuXOKDNRqsHBu6V1S7bBM/57kAQVUhERtt7s=;
  b=gqJ0ypp/gnsqsYYqDDKVwnMuilkDx7JM3RTbV2/BgEzBcQn0BVieb0ER
   PTm+DmdspDBCHXcfKou+rwGYIOI2Y4fwNTtQyslngDZXn2KOKbqfkZ7FP
   aHiTA2Lp02ufG+gQS1uGqckZtFuayGenOJk69iGvX8pEb9Q7f+lwrnyMj
   c=;
X-IPAS-Result: =?us-ascii?q?A0AlAAA/bCRkmIwNJK1aHQEBAQEJARIBBQUBQIE7CAELA?=
 =?us-ascii?q?YEqMVJzAlk7RogeA4RQX4lHlXSFIYEsgSUDVg8BAQENAQE9BwQBAYUFAoU4A?=
 =?us-ascii?q?iU0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOE?=
 =?us-ascii?q?CeFaAEMhlYCAQMSLgEBOA8CAU4yJQIEGxqCXAGCFUcDAQ8GoUsBgT8Cih94g?=
 =?us-ascii?q?TSBAYIIAQEGBASBSgJDnREDBoFBAYdHHlhdg1OERycbgUlEgRVDgjCBeoFdA?=
 =?us-ascii?q?gKBYCuDZIIumGlqgTRzgSAOgT2BBAIJAhFrgRIIa4F8QAINZAsOcYFKAoFPg?=
 =?us-ascii?q?QAHNgNEHUADC3U/NRQgBQRVgRkkBQMLFSpHBAg5Bhs0EQIIDxIPLEQOQjc0E?=
 =?us-ascii?q?waBBgsOEQNQgUcEc4EWCgIES51LIHs/lUGOEKJTCoN6ik+BIpUxFqk/l2ogj?=
 =?us-ascii?q?TKVBjmEYAIEAgQFAg4BAQaBYzqBW3AVgyJSGQ+OIAwNCYNQj3l1OwIHCwEBA?=
 =?us-ascii?q?wmLQwEB?=
IronPort-PHdr: A9a23:/0H6lxxqnogDfm/XCzPZngc9DxPP8534PQ8Qv5wgjb8GMqGu5I/rM
 0GX4/JxxETIUoPW57Mh6aLWvqnsVHZG7cOHt3YPI5BJXgUO3MMRmQFoCcWZCEr9efjtaSFyH
 MlLWFJ/uX+hNk0AE8flbFqUqXq3vlYv
IronPort-Data: A9a23:cpKFlqMQLDRPRG/vrR2vl8FynXyQoLVcMsEvi/4bfWQNrUp2hGMOy
 GtJXWzXM/aPYzT3KYx3bIW19x9U6pHRyNZhSHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgG/ytWIYoBggrHVU/EHx72Eo58wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjm878ZceKug9VWtGgj6MouFg0
 u9K8rXlHG/FPoWU8AgcexBcFyc7Nqpc9fqYZ3O+qseUiUbBdhMAwd03UxpwZtNeo70xWD0Wn
 RAbAGhlghSriOur2ru0V/FEjcU4J86tN4Qa0p1l5WqGV6d5G8ubK0nMzYZ+3jA/2foVJ8z1P
 ZUQVihMNDflbSQabz/7D7pnzLv32RETaQZwr0qYo6cy6WXfwAF9lbPqKtf9ft2RWd4TmV6Vo
 G/D9Wn1DhwWctuFxlK4HmmEj+vLm2bwX5gfUeL+/f9xi1rVzWsWYPELabelibqwqX+bRcB+F
 2AF8yErkJkj7nasCfCoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6l6o4sE2YphDsO6ZdeeNA66
 rOat4iyXGEw7dV5XVrYp+nI/G/jUcQABTJaDRLoWzfp9DUKTGsbtgjOSN1uDKmz5jEeMW6tn
 2jVxMTSakl6sCLm/6y/+VaCiDW2q92WCAU0/Q7QGGmi62uVhbJJhaT2sTA3Dt4Zc+51q2VtW
 lBfxqByC8hVUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehcxapxUI2S3O
 BCM0e+02HO1FCb1BUOQS9/vY/nGMYC7fTgYfqmON4EXMsQZmPGvrHo/DaJv44wduBF8zf5gU
 XtqWc2tFn0dQb921ya7Qvx17FPY7n5W+I8nfriil07P+ePHPBa9EO5ZWHPQNbpRxP3f/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcqo+pcMKLDce1AO9aNII6a5/I7NsrdNx8x9/tokN
 FniMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:ZRpG+auA6oUfUlZ3hbyEYbO27skC8YMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H8BEDyewKhyXcV2/haAV7GZmjbUQSTXfhfBOfZsl/d8mjFh5RgPM
 RbAuVD4b/LfCBHZK/BiWHSebtBsbq6GeKT9JzjJhxWPGVXgtRbnmFE43GgYypLrWd9dP8EPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+wQ+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRheerRfb8xPT9GA+cyjpAV74RGIFqewpF4t1H3Wxa0e
 UkZS1QevibpUmhOl1d6iGdpDUImAxelUMKj2XoxkcKZafCNWsH4w0rv/MeTvKR0TtQgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gCwlGl/NLQgF4vsulKREhg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.98,301,1673913600"; 
   d="scan'208,217";a="37297230"
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 Mar 2023 16:51:04 +0000
Received: from mail.cisco.com (xfe-aln-002.cisco.com [173.37.135.122])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 32TGp3T0011399
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 16:51:03 GMT
Received: from xfe-aln-002.cisco.com (173.37.135.122) by xfe-aln-002.cisco.com
 (173.37.135.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 29 Mar
 2023 11:51:02 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-002.cisco.com (173.37.135.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Wed, 29 Mar 2023 11:51:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqocYwbDtIgz98wvlsdPGwy58snFs1fJ2JFqNQkUx2SzBxHPDwDM/vQEUzKhiHS7FzfFG78ASiq5yrFGkqAkL7F80LL4auhOWbsToRh7fb+QHwQtRbB23nZ6iLRu7c6r2T3bBgpADmv2wp5QnFto9G8FqGRjz2pyH7OX2g7yRoyS/NEhgpjLMcprOL0mccaeJ97TXrufqhpv8EgLGugqtHq46DnLxPcIeVFWl/SMi2DJ2RBWLqA0G+jAgDCWHDzeP7V6qGYeTP54b7A3Lck/AFx10g4D+GiGBacsGL9O0umI62dr0H0wguR0lUxjRemMcb9CwmmuOYAi7XprHHf2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSb/kfkSdog4xry0TJ1hnONERVi+xjATrtm/cFsNm1I=;
 b=JX5Q+otRSZHfwVnsW85UY5Dg3ULt7WkHeyrCpVcvnKhMZBQqzDCedFyoluwhnLLgkwQee6TjUvsO6JGff3bhKRnmxQd80GifqKku0eqUMcy4NBhBngL9C5/W02zvDK9/rIFke6J4Q42xq4d2aduaOUv+0/QkBTrb7oTMGYlkuXQ5F+dX5HnStt1boUerx7d+cli72jVEBrhFSLvA+8Y2k5LXWU23rCi1Rqdx6X9cZcSR/+nvvzYFs49hp0cKXQd3Gg1DIQQXu/2tkQWZAPq4FsUaLcqf1iw8i7xEKO41yOAtB+E7BaCYEfDoPRwr4RHp6BAA718spRJIygUngl2PNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSb/kfkSdog4xry0TJ1hnONERVi+xjATrtm/cFsNm1I=;
 b=C39xjR/hi8okhvE1iq+zVvEqJAT3Ijf+d7xQmrehOcXl6VplxKtKhVUqqwzfbPyRJzEPdA4ssSXp7F/QAZEj6zVjz5aCcv6e2+N0bzBU9x2UlhMAkhu11tK81n3Fk5tpGCQOyHwD/9BaiiGQXIZgH88cOz7WQl/uOBVt6hbgi3E=
Received: from BYAPR11MB2886.namprd11.prod.outlook.com (2603:10b6:a03:8f::23)
 by PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 16:51:00 +0000
Received: from BYAPR11MB2886.namprd11.prod.outlook.com
 ([fe80::1908:a74f:fa57:714e]) by BYAPR11MB2886.namprd11.prod.outlook.com
 ([fe80::1908:a74f:fa57:714e%5]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 16:51:00 +0000
From: "Gaurav Gupta (gauragup)" <gauragup@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Build error with dunfell release "yocto-3.1.24"
Thread-Topic: Build error with dunfell release "yocto-3.1.24"
Thread-Index: AQHZYl2DaLs9yR5t8keJNdqNf2Zp268R+H8X
Date: Wed, 29 Mar 2023 16:51:00 +0000
Message-ID: <BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
References: <BYAPR11MB28862F0807337647C5351586C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB28862F0807337647C5351586C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2886:EE_|PH8PR11MB6974:EE_
x-ms-office365-filtering-correlation-id: 8b3a5d44-9c48-4d03-75a9-08db3075c6bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GOueLukKDd662ClPJHcSv7UnOrmezlhlMw2GjC0u07Lqj8Vtw5rmS02fYeoSMsplrjwZEkGkv/UY6NE7BEqkKN3lHM4DIbrksIaK+I4eW16ZCuBxp/w/Lr+PMxXv/doamsd7ooFGaZFHNh59TKgrES1sNfNYm3wr7jcDJ4lmM4k1mqwAI+9wY/S/TYPdeQQ963iZvVOta3eX/pN3HrHcyQElNBZngzw0MYJv9SRONWHZYZG6jn7RM8JWOnGy2lzYJx8m3uWbvkA1SV7F60QGW801RTzmOjAR0lagygWFCCJpTQD4q+UyGqQaR4r8bppox6G9vhEuT4+nt8JJDaK2q1g000hEYJk42Dl4LCJYtgs7vM6PJ5XtGCw6uAIGfspGAL8DValcstVKkhEimiFQkmgxs7o2xX7jfE7UelJSWKnUAQwHSjaEbO+rZEMJKLOmDiPZyt0iJPe5ywXgI3MZKFM/mCQiffcwvKhkIby55PXkKsdvnvyVJcN7OJeENJJMaTa1ZwyYfR2JkOeYVSBjKuhYgx6CQYoRZTb/VVpMXVYU80GJcgJAXAZuVcVDiZyA0kLWl6TLjbK54cPkO5pwQZVchNOLmV3GsS24ac+vG7E0/jTPsbPIHdy3ysSlF6rELtQDX4BttVZ1q0eUDXrfLg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(966005)(7696005)(478600001)(9326002)(316002)(6506007)(9686003)(71200400001)(52536014)(66476007)(66446008)(6916009)(8676002)(66946007)(8936002)(2940100002)(186003)(76116006)(66556008)(41300700001)(33656002)(122000001)(64756008)(55016003)(5660300002)(2906002)(38070700005)(38100700002)(166002)(86362001)(83380400001)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?nPL2vOPg06M4W7HtH2RSqtoMRiQdSpvfAMtE4P6b1V1QiSxNImAZaURx?=
 =?Windows-1252?Q?CtuWhdSRsjVw3eE02EL3JMqKjXbIWTjyA8cHEYhHb+17iqds8D7o9lyz?=
 =?Windows-1252?Q?kWllxbs8Cm+90E12DJy5651GzJxLyYnAnXHYgoxeX4k+oblU6a8SAM6g?=
 =?Windows-1252?Q?VmFxqeg/9+cYU4aORfqLc7Q9208GhkCUZB+iZDjYC3DFdFiGBOHd0INS?=
 =?Windows-1252?Q?jARl4no7fYW7CPjY0W8xuuf94TmME+OgStnO4xxPY0KaJi/MsFiLUh/N?=
 =?Windows-1252?Q?SLkyWG6Dt0MvPDorOEmgd8pZGgg6JOmqx6l2RTbM2YdMbaaV2OkWk/Yq?=
 =?Windows-1252?Q?Ow5a9Ifwq991Ju2025sE5NEzh9K9dNYq18IrSD/iXIdfOL8rQCsOINKE?=
 =?Windows-1252?Q?R4wWf1AIrNeYCW+TpWkQWJmz9w8yLu08gMjMtJCbAojYUt/g1rtwAA2l?=
 =?Windows-1252?Q?nJ7e1El0sGy1ZfQ8WEROi0R1OygHomVopTgKPlbNr0++kIB0XCcfr5EF?=
 =?Windows-1252?Q?SzsUP5BlhvQd5ry5F7PUjYgxeKkDSMPOo8zOYZYnzohpmWIASBBdxM3R?=
 =?Windows-1252?Q?/JymYsGvrRIeA3JSBDHOPioyhk0wfhHg4JWZSsJ5eIKUR9xkdR6LdilN?=
 =?Windows-1252?Q?A12FafiDDY9nirWB8UAdfKD6ngvYETNTC6zVaPV9c8HgQYhlkSdl31Ug?=
 =?Windows-1252?Q?u75JutroSFF01f970qsP83WWvEr13ULpqH0z6vN3CesQZ5M/4aJYvdGx?=
 =?Windows-1252?Q?fRFZRBNBlawgpC9xAlsqfGWEl6pMpE1B9Pwv4/8axuPnq8hpBTx6mqGU?=
 =?Windows-1252?Q?tnNicqNA5Tw9Xjb10q5orkka5wGFs8XrpSHf+N6Ke9EHIO4ui1riypVs?=
 =?Windows-1252?Q?Z2aglPTEl2tiytnet9bf0GHpAZZMMGRxuu1O5/I25aJpJty8SgxNYbJq?=
 =?Windows-1252?Q?iTAUfvIdnikyecU8nflwAb7BSvrMpsQKBYulI/qnl27YDkaK5FfwKnMj?=
 =?Windows-1252?Q?cErlzDpyVkwVS7Z1WmYXA3RxaSkJXBgXMe05HNO/cYHBulbLICd4ykcp?=
 =?Windows-1252?Q?fGO8yX9BLNpy8JMjlwrn/SMzZBTqiethC+HvepH+gPzq+CgsqZAG2e96?=
 =?Windows-1252?Q?WCz+V9M3YIh+JLADmNK2Bc/n27C7xlPlFlGWLp3m7NjamNKnFNgsGKfy?=
 =?Windows-1252?Q?O6g8IdAtWtrmCE+0M0Ijs3GnGp5i/e+t5bK6h2ibk2aRGi5hj5AG3jIL?=
 =?Windows-1252?Q?4Rli65gygwrXO5gr9WsgtntpZqhkrcjVPspYVUPwPKHW2N9Aes/oiSbM?=
 =?Windows-1252?Q?kumjhXR3o4zwYAFpLzJmriLWdM112oMC5TepJKNjztn1s08lqMyLZFjy?=
 =?Windows-1252?Q?/Uwx5i9uOPELhFayZsnTIxvpgadnYUpasj6vY183KTyRRJ/oWxwKQdWs?=
 =?Windows-1252?Q?PzaAXeZp0nAlN2BCNNhPTfBkL5csc1fPnfkJ+qLwYaIvWHZAE6TzwghM?=
 =?Windows-1252?Q?J0s9wFjUzxbbg7YL5Sdi+gvJEaM5bFTXSXjWjX/wfhkO79nM84fH2DvC?=
 =?Windows-1252?Q?7ssALTjz7fN/ZW1HgkKImuLV+queAffbotrj5jikDhNrYwjSEkuQDLeH?=
 =?Windows-1252?Q?D2FRJqPeT67EDz0nLi2RgmdHjfBpYKVBeXKYYoBApjwlGgKOi685utzd?=
 =?Windows-1252?Q?IEt/OCZAzTk5iomdWOGIDTUVrYc5XfravIjiPaLh6TSwHEtwXVu+EUAF?=
 =?Windows-1252?Q?FFWfVng3XD8vVKK7Fdcr1SGqUislFl7t0NK1T8nMFmvLHjqSYcDUI81Z?=
 =?Windows-1252?Q?u0xbDg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899BYAPR11MB2886namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3a5d44-9c48-4d03-75a9-08db3075c6bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 16:51:00.5825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAKplZFuSrH2W94qOCUfcpLywMH/L00gzXCVPYxv3SwNCzSV797JFK1kf7aTkEuH963OcJX3rLRgv5blLhRm2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6974
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.135.122, xfe-aln-002.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 16:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179292

--_000_BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899BYAPR11MB2886namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

On latest =93dunfell=94 branch, there=92s a compiler warning/error when bui=
lding QEMU.

The patch for CVE-2021-3929 applied on dunfell returns a value for a void f=
unction: https://github.com/openembedded/openembedded-core/blob/dunfell/met=
a/recipes-devtools/qemu/qemu/CVE-2021-3929.patch#L58

This results in the following warning/error:


<ws>/qemu/4.2.0-r0/qemu-4.2.0/hw/block/nvme.c:77:6: error: void function 'n=
vme_addr_read' should not return a value [-Wreturn-type]

return NVME_DATA_TRAS_ERROR;

^      ~~~~~~~~~~~~~~~~~~~~

In newer versions of qemu, the functions is changed to have a return value,=
 but that is not present in the version of qemu used in =93dunfell=94.

Thanks,
Gaurav

--_000_BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899BYAPR11MB2886namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Helvetica Neue Light";
	panose-1:2 0 4 3 0 0 0 2 0 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.p1, li.p1, div.p1
	{mso-style-name:p1;
	margin:0in;
	font-size:10.5pt;
	font-family:"Helvetica Neue Light";
	color:black;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello,</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On latest =93dunfel=
l=94 branch, there=92s a compiler warning/error when building QEMU.</span><=
span style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The patch for CVE-2=
021-3929 applied on dunfell returns a value for a void function:
<a href=3D"https://github.com/openembedded/openembedded-core/blob/dunfell/m=
eta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch#L58">
https://github.com/openembedded/openembedded-core/blob/dunfell/meta/recipes=
-devtools/qemu/qemu/CVE-2021-3929.patch#L58</a></span><span style=3D"font-s=
ize:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This results in the=
 following warning/error:</span><span style=3D"font-size:12.0pt"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"p1">&lt;ws&gt;/qemu/4.2.0-r0/qemu-4.2.0/hw/block/nvme.c:77:6: e=
rror: void function 'nvme_addr_read' should not return a value [-Wreturn-ty=
pe]<o:p></o:p></p>
<p class=3D"p1">return NVME_DATA_TRAS_ERROR;<o:p></o:p></p>
<p class=3D"p1">^<span class=3D"apple-converted-space">&nbsp; &nbsp; &nbsp;=
 </span>~~~~~~~~~~~~~~~~~~~~<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">In newer versions o=
f qemu, the functions is changed to have a return value, but that is not pr=
esent in the version of qemu used in =93dunfell=94.</span><span style=3D"fo=
nt-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,</span><span=
 style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gaurav</span><span =
style=3D"font-size:12.0pt"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899BYAPR11MB2886namp_--

