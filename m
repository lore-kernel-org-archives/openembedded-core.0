Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C08C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 13:59:55 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.9579.1684936787885082248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=ZuzJZ6w3;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5667; q=dns/txt; s=iport;
  t=1684936787; x=1686146387;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=sfFSvTO2w464X7oOz75KRw1vAwO9wF2hVWytV9rqYyQ=;
  b=ZuzJZ6w33fuCsam066L6ttOnq38pYFG8wafiEbBqQvhn/pUk8JNW45Nf
   kwC4URfWGm6c7x5ji9ncWA5Ig78ZOd4Ts6C2SbwQTe/UtRfbRdDq3kL/g
   spqYAYPVcphP2Jac3xVCLX0hZgdJr25gWLV4LNpGCIcFeJd7rdvSdOMfx
   M=;
X-IPAS-Result: =?us-ascii?q?A0ABAACEF25kmIMNJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBXFJzAlg9R4gghE6GfIIkA4ETnFSBJQNWD?=
 =?us-ascii?q?wEBAQ0BATsJBAEBhQYChVwCJTQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBA?=
 =?us-ascii?q?QIBBwQUAQEBAQEBAQEeGQUOECeFaA2GBAEBAQEDEigGAQE4CwQCAQgRAwECH?=
 =?us-ascii?q?xAyHQgCBAESCBqCXAGCXAMBEAahFAGBPwKKJHiBNIEBgggBAQYEBYE8AgYBB?=
 =?us-ascii?q?QICQAGdFwMGgUIBhEyISYRIJxtAgU2BFUN5gTc4PoEFgV0BAQGBYTCDYoIuj?=
 =?us-ascii?q?y2DNDWJQIEwcoEjgSiBAgIJAhFngQ4IZoFzQAINZAsLbIE7WkOBaQICEUIME?=
 =?us-ascii?q?AVdAoEEEAETAwcEAoEOEDEHBDcLGAkGCR01LQZdBy8kCRMVUweEKwMKCkM3A?=
 =?us-ascii?q?0QdQAMLdT01Bg4fBQQjAUuBWAQvQoETAgRJnUQDgnwBYS0BGw4CUDUTbQ4Bk?=
 =?us-ascii?q?xpBsQgKJ4Ngi3mVOhepUAuYASCNOpovAgQCBAUCDgEHgWM6O4EOCwdwFYMiU?=
 =?us-ascii?q?hkPjiAJEAmDUoF/gxWKZUMyAgEIMAIHCwEBAwmLRgEB?=
IronPort-PHdr: A9a23:aILhLhW8xu8dkop+su1wjis+TaPV8K0yAWYlg6HPw5pUeailupP6M
 1Oav7NmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QS47lf1OHmnSp9nYJHwnncw98J+D7AInX2t+81+Gu4ZrfSw5JnzG6J7h1K
 Ub+oQDYrMJDmYJ5Me5x0k7Qv3JScuJKxGVlbV6ShEP64cG9vdZvpi9RoPkmscVHVM3H
IronPort-Data: A9a23:MZCPcaN3XnOz/ZHvrR24l8FynXyQoLVcMsEvi/4bfWQNrUp01zMPm
 DcbUD+EM6zcYGGgfIh/ao7n80IDvJ7Sz4dqGnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHp71Uo48wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjg0V+PoSMPQDUEtauQivpYtAl
 tBNpKXlHG/FPoWU8AgcexBcFyc7Nqpc9fqeZ3O+qseUiUbBdhMAwd03UxpwZtNeo70xWDoXn
 RAbAGhlghSrnOm2wa6hTeVEjcU4J86tN4Qa0p1l5WiAVa5/HcCaHs0m4/dx5HAdr51lH8/5b
 vYGQAheYTWQaD5AbwJ/5JUWxbf02SaXnydjgFWNqKw65mLewAB83P3mN8DYUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rubLmSW+U4UIGfjhsPVrm1aUgGcUDXX6SGdXv9GYrWTictZRN
 HUY9xgTi5JpxRKuTsjECkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOoTiZmMYADDBnJJuLQHGx
 mNljPuyX2wy7OH9pWa1s+bK8GLjYUD5OEdYPUc5oR05D84PSW3Zpj3GVNJqFqLdYjbdRmyon
 2viQMTTe9wuYSMj3qG/+xXMhCih48GPRQ8u7QKRVWWghu+YWGJHT9LwgbQ4xa8fRGp8crVnl
 CNa8yR5xLtVZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggdBs5bJhaJWawO
 B67VeZtCHl7YSTCgUhfPtzZNijW5fOI+SnND6qNNYMePvCdiifWp3EGibGsM5DFyRhwzv5X1
 Wazese3BnFSErV80DezXI8gPUwDmEgDKZfobcmjlXyPiOPGDFbMEOttGAXVNIgRsvjbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXMCm95IMLrLafmKL2ggJUpfs/F/oQKQ894x9nebT9
 Xb7UUhdoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:x6XT0KljYrCocm8fkyXx2w1b/N/pDfOaimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qBPnn6KdkrNhQotKOzOW9VdATbsSp7cKpgeAJ8SQzJ8l6U
 /vGZIOcOEYYWIK7/oSpTPIburIo+P3vJxA592utEuFJDsCA8oBnmRE40SgYzdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxw4tu74yuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX222oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF1nAjv0idrrD
 D/mWZjAy1B0QKVQohzm2qo5+DU6kds15Yl8y7evZKsm72+eNtwMbs+uWsQSGqp16NnhqAy7E
 qOtFjp76a+ynj77X3AzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYd499Q/Bmfca+d
 NVfbfhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zw93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf0IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTIYd0s8LAq23FUgMyPeFOwC1zydLkHqbrSn8ki
X-Talos-CUID: =?us-ascii?q?9a23=3A3Z0Rl2ljjbJ3+IgZpJdZ/IAyam3XOVz65iv5J0G?=
 =?us-ascii?q?nMGpkeoCzcwShpqZkgvM7zg=3D=3D?=
X-Talos-MUID: 9a23:h8ZD1gtrj1dwtGg0X82nrQklGe41yKaXL0kxjrw0isSlZSdTNGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 24 May 2023 13:59:46 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 34ODxk2v031501
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 13:59:46 GMT
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,189,1681171200"; 
   d="scan'";a="1863873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1OvnUPbZC+wf4M6KwGD9sii4cNoam1yi8XfL7n7l/4sgzhfKQv/feL2rPaXSaX9a6r8Bbm/wibdtLGn8btypM4gyi6+UH3viiYOfAHgk7cOrWrBriy92rhnnl2qHTLEvaregFKWcZtyHtv3BsoeCi0st4DE5QT4EtsaArZ/Usqwc5ZRJZg8+czCszaOXIVY6uf61lryz9VXfwGH8M3E6z/wAZ/zD540ONYZqJVEXT39Hog/AbxueNin0526fIm1Lrnp5NVIAbsL6vK7eImPAZj4v+HBYY8ZlABbhRReHjBjTBS7yV5S1Mr45utocArSc5BwBtCTRsaMBriss1+PGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEmgFF/TekEILnUZf69Us5k3M2QXgFy8p64c/QQVemw=;
 b=b0SCi1By5cLXcC+Kf7Za5eqy5Fm3aoeLq1qLJgToUu1kc2hHFlxgCod7MsCNL5waO2ztT3eiNft+BdDHyXA/7FRutMJ06577Eq7tEruyBhGnmLtg5cU/auYD4et7noWZlvhRIUcq/lzsyPuk99TlnulS/RE1vZtbW7yZqs/Df6ZyqM4Su+lboU9eSEGS8XMW3kP7S0iFv6WMZijKd7Mvi4WAkCmkmICamNhRtjhqPJJkwy6t+fi1+0RR92b18bTEWof3f+Jv2EhcD05uTNpx/SxccP6Rsu4Kv6pKmJQkw6YreyRpMJM0B+ZNNRhEqHERQMCNPqjKo6GHDHLU7gKJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEmgFF/TekEILnUZf69Us5k3M2QXgFy8p64c/QQVemw=;
 b=Rj5JIpOxP7Q+p0Ay9NulbxshaSBjUbHNMYio29LP4+3Tg+Sb2MtUxuL/tO6PlsYxinmYC4gMfdpwBS0c5aYr/2Orr20ul7CHn/XGUapNIMbDpF8nnT3G0g3p8bKH7cCbWQuQgpSEIw35ybaihTJohqeteSAmxTywfSUy6hBBFDE=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 13:59:43 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 13:59:43 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "sakib.sajal@windriver.com" <sakib.sajal@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH] go: fix CVE-2023-24540
Thread-Topic: [OE-core] [kirkstone][PATCH] go: fix CVE-2023-24540
Thread-Index: AQHZjgC2LrPWr4PTFky8CyFVeSoS069pbzpw
Date: Wed, 24 May 2023 13:59:22 +0000
Deferred-Delivery: Wed, 24 May 2023 13:58:14 +0000
Message-ID: 
 <SJ0PR11MB67172DFAB24257125B2E4B50DC419@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230524052853.1666676-1-sakib.sajal@windriver.com>
In-Reply-To: <20230524052853.1666676-1-sakib.sajal@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|IA0PR11MB7955:EE_
x-ms-office365-filtering-correlation-id: 86b7c631-b8ee-405c-d155-08db5c5f203b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1kg3/FvVevaInnRo4w9KW8Zo4DLJTu73bRhtuQncEHwVryIBart/eryn6h3MRSazKwrgrWMNjsiHZrZEPAw9HtrDj2iSxA+UeL5MU31hJPscgdtyd558yn2NJBbq1Xr6Jy/2vWKtOCszN2lUvjqFZGecBi85SS/8mgGo034RoX58BHxFsKtLjAdwbAbI4qkk6IKXSifDjQy5D5rLsBlkPsPPRsVxmfmd3DrOj/ORiF4iz4/IeMDBUerSkOu/w4k/AocHMWx0JTDZO+XhglE0JQjDfO8ywbkAj1nCI5qN71v+mOx+GsDE3wZU+v5w5v9bueh08Pva0swpmeNNWfM5VuAzYsP4Zq3acaovc1iuHy8ku+mnK48ptvRnfn2F0U+0GjqLG6i8IL8l9OaeCpOwUuvXsG63u1pnKh6iBcHLO0fSmk64NATagjCQEKgqhYg4GnCQnQyekYFlsYVSjLOTqGw+rsr5dbtU1tfvEj+AfoqNH/TPjfy6Q7uatccilHs362eNbzDBPdtoNGh4wdoPg4ckDGhKrGYeKYIKW/ABWDeLjpCpBebLIyJ6hzrCygy/UiWHnT2f3zvprvMZBJW3gubvLf2ou4l2zjvHLWrDdNloB/Guel2Q6kCHF5gCshtAsok/zBw1nS6KktNN2feebw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(41300700001)(86362001)(7696005)(71200400001)(6666004)(316002)(26005)(8676002)(8936002)(186003)(52536014)(33656002)(9686003)(55236004)(6506007)(2906002)(5660300002)(55016003)(966005)(478600001)(76116006)(110136005)(38100700002)(122000001)(38070700005)(83380400001)(64756008)(66556008)(66946007)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jcPVEN7k3QZIZxs3l5CCh3/Fqp9mIJDrN4P1eH3k2vRwnQEMN7IF8sifteuZ?=
 =?us-ascii?Q?mGTTdRiXw1MontKQY7fdMlwvz14oCqXHvDCwnuPbEeTHCcs8vaSDJWolUBzq?=
 =?us-ascii?Q?SpwN/o1vP85ixaL9uOTxgWdb3suE3jwBKeYt2UHIgwYi0mPuRPSZLdozEXOi?=
 =?us-ascii?Q?K6gdtqp5IXLpBzV+5fqzcMcoZ4CeTm+h9NFT2FIICnsMR4bppQZbxZfVsh7J?=
 =?us-ascii?Q?uIIE4g5oiLX+8ujz/uubVFzjVLquCor0txCGgPwrJjN67Kc0yO1E0FpAUa8l?=
 =?us-ascii?Q?MYwZOtbtgCLx+PDS2yY/DBIRID18HJRL2T/k/klLu7G9/E3m2i5TOj8cuyfj?=
 =?us-ascii?Q?utqJGVX8tAnfgEIos/LTHUCkThauIue7ozgmEjNTBz9h2r5ty7AMX0Ljxbqq?=
 =?us-ascii?Q?1fMyOjvxPb0qNYk5uFFwP1Y8l+Weg/v752fp92oZQJZJrXJo2aosK+jlclxT?=
 =?us-ascii?Q?3nPzEy+OkNFDBurCd/ayiiszuFbHeIzuDbpwiI/F4iWlxJpoX0GgxdquiETf?=
 =?us-ascii?Q?9kzb2QuF5k/7a31GLZNF843wbGy/CxKwO5gnA8zoTgY57Kez8Nt8HNYdw1wO?=
 =?us-ascii?Q?puEer/nxawCLxkv35QZahQOjaYQRljOvAL/ANzOyBr3w30yI8mfuxNF+Ft9B?=
 =?us-ascii?Q?WWjj1y5VI4+wbeueXx8xZNA3CwmtykW+YPK/rdPif3jpN9vTYEwypEntZDsH?=
 =?us-ascii?Q?skGGs0xVdKLUSkHl2XXS+eInXI1eIf13fxPfX6lvHInFJLgLKOjOnSwrFBhz?=
 =?us-ascii?Q?fJs7QAlOrzAcX6AI7PERZIcf7HcIpM3CJnS8fuFrV0JOzAxzxpHG4T1/F8jt?=
 =?us-ascii?Q?mOOq5rtnkRWeuHEYMvV5ZKZDerrvS6X2pZr72bkf36kG3Gp+ym7KMU9DkjVD?=
 =?us-ascii?Q?oNjH+knav6kM0vu6y9t2Ky0wsCSqxv4JIH9LeHdEceYugn+6txYJAGzVhso6?=
 =?us-ascii?Q?A8Vaarzjfya6Ltp9Ax3i7HBUo3rO4C+EJLUz+by5sffCukhCpESdonOaO8HB?=
 =?us-ascii?Q?uXsJa2BhgU3yGIPFtoF0M7PAkJd81TV51AFHewcfAGAulRc/N/iBLHZ/rMBh?=
 =?us-ascii?Q?A3D+T5TipA0C6M+MOd+6k0tzIglO2Pwk8bRu4p0Q5nDBE9dC2U0GLcR/O6y+?=
 =?us-ascii?Q?ukLILECl0zoCW4oMLDxR2WDyvSBKUagYiRJUdSsSvCXB2jLbCBcz5pnqUVJc?=
 =?us-ascii?Q?1x8uGYBWzv4HW46tw8GMCmR6IarsNn2zrZPKL+U403mlIIn/SL4qbf31Wfuf?=
 =?us-ascii?Q?mbwcExL6QhEI1zlcBac02kB6vV3V2Hp7ijjpRYY5GwP9NgbVV3FwUiknQsnQ?=
 =?us-ascii?Q?Y+OP3oAmKt/7YFQ3FH23BJR4TlqMcPkXsBMe7rQ5ndGwXeerl4Rgz3fZaEK5?=
 =?us-ascii?Q?9cQxTkwAR2Jl+Km5bv6ecUeYP34DbkhZAP6NNpv3bQ3g8mabSOcqvjVybpK3?=
 =?us-ascii?Q?A6/y7lPC2wUbjbI0dC1JomiEpTlzkzY7JJDrt5Gs4gpULi9HhN2Sm9HDZw4Q?=
 =?us-ascii?Q?JXnSbVT9i/qtf80tEXYqJotaI3VkDXLbLbf5Akx64ug+1GqEwet/Fa943aaB?=
 =?us-ascii?Q?ADjhUpNt4ocGf858b+KvxuAruX/u0JKXs4G+fjve?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b7c631-b8ee-405c-d155-08db5c5f203b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 13:59:43.5353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XtbOVyE9B8BXpH1vfCCEkC2iOUvA1cfhsIlfWfFq+u/F8NrueqLlIrn4j6UvZ8u0IwAECP4/1OQpnm1tEFwfQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 13:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181673

Hi Sakib,

Its good to have full URL link inside .patch file as below:
CVE: CVE-2023-24540
Upstream-Status: Backport [https://github.com/golang/go/commit/ce7bd3334541=
6e6d8cac901792060591cafc2797]


Its good have some information on CVE specifications in commit message:

go: Fix CVE-2023-24540

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-24540

Upstream patch:
https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591cafc279=
7 (go 1.19.9)

Thanks,
Sanjay


-----Original Message-----
Backport from go-1.19:
html/template: handle all JS whitespace characters

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.19/CVE-2023-24540.patch           | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtool=
s/go/go-1.17.13.inc
index d7cb47ebf4..e5e9d841c4 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -30,6 +30,7 @@ SRC_URI +=3D "\
     file://CVE-2023-24537.patch \
     file://CVE-2023-24534.patch \
     file://CVE-2023-24538.patch \
+    file://CVE-2023-24540.patch \
 "
 SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1f=
c0c1d784ada0cd300fd"
=20
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch b/meta/r=
ecipes-devtools/go/go-1.19/CVE-2023-24540.patch
new file mode 100644
index 0000000000..4ed9ba7096
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
@@ -0,0 +1,93 @@
+From 2305cdb2aa5ac8e9960bd64e548a119c7dd87530 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 11 Apr 2023 16:27:43 +0100
+Subject: [PATCH] html/template: handle all JS whitespace characters
+
+Rather than just a small set. Character class as defined by \s [0].
+
+Thanks to Juho Nurminen of Mattermost for reporting this.
+
+For #59721
+Fixes  #59813
+Fixes CVE-2023-24540
+
+[0]=20
+https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_E
+xpressions/Character_Classes
+
+Change-Id: I56d4fa1ef08125b417106ee7dbfb5b0923b901ba
+Reviewed-on:=20
+https://team-review.git.corp.google.com/c/golang/go-private/+/1821459
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on:=20
+https://team-review.git.corp.google.com/c/golang/go-private/+/1851497
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491355
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+TryBot-Bypass: Carlos Amedee <carlos@golang.org>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2023-24540
+Upstream-Status: Backport [ce7bd33345416e6d8cac901792060591cafc2797]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/html/template/js.go      |  8 +++++++-
+ src/html/template/js_test.go | 11 +++++++----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/html/template/js.go b/src/html/template/js.go index=20
+b888eaf..35994f0 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -13,6 +13,11 @@ import (
+ 	"unicode/utf8"
+ )
+=20
++// jsWhitespace contains all of the JS whitespace characters, as=20
++defined // by the \s character class.
++// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regu=
lar_expressions/Character_classes.
++const jsWhitespace =3D "\f\n\r\t\v\u0020\u00a0\u1680\u2000\u2001\u2002\u2=
003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u3000=
\ufeff"
++
+ // nextJSCtx returns the context that determines whether a slash after=20
+the  // given run of tokens starts a regular expression instead of a=20
+division  // operator: / or /=3D.
+@@ -26,7 +31,8 @@ import (
+ // JavaScript 2.0 lexical grammar and requires one token of lookbehind:
+ //=20
+https://www.mozilla.org/js/language/js20-2000-07/rationale/syntax.html
+ func nextJSCtx(s []byte, preceding jsCtx) jsCtx {
+-	s =3D bytes.TrimRight(s, "\t\n\f\r \u2028\u2029")
++	// Trim all JS whitespace characters
++	s =3D bytes.TrimRight(s, jsWhitespace)
+ 	if len(s) =3D=3D 0 {
+ 		return preceding
+ 	}
+diff --git a/src/html/template/js_test.go=20
+b/src/html/template/js_test.go index d7ee47b..8f5d76d 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -81,14 +81,17 @@ func TestNextJsCtx(t *testing.T) {
+ 		{jsCtxDivOp, "0"},
+ 		// Dots that are part of a number are div preceders.
+ 		{jsCtxDivOp, "0."},
++		// Some JS interpreters treat NBSP as a normal space, so
++		// we must too in order to properly escape things.
++		{jsCtxRegexp, "=3D\u00A0"},
+ 	}
+=20
+ 	for _, test :=3D range tests {
+-		if nextJSCtx([]byte(test.s), jsCtxRegexp) !=3D test.jsCtx {
+-			t.Errorf("want %s got %q", test.jsCtx, test.s)
++		if ctx :=3D nextJSCtx([]byte(test.s), jsCtxRegexp); ctx !=3D test.jsCtx=
 {
++			t.Errorf("%q: want %s got %s", test.s, test.jsCtx, ctx)
+ 		}
+-		if nextJSCtx([]byte(test.s), jsCtxDivOp) !=3D test.jsCtx {
+-			t.Errorf("want %s got %q", test.jsCtx, test.s)
++		if ctx :=3D nextJSCtx([]byte(test.s), jsCtxDivOp); ctx !=3D test.jsCtx =
{
++			t.Errorf("%q: want %s got %s", test.s, test.jsCtx, ctx)
+ 		}
+ 	}
+=20
+--
+2.40.0
+
--
2.40.0


