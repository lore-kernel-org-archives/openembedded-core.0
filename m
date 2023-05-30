Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABABC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 11:39:41 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web10.7500.1685446773588462721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 04:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=jg4Wughy;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4139; q=dns/txt; s=iport;
  t=1685446773; x=1686656373;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4EkJwxtP2TWqR4zV/mxlsPgzrJnOwGLS1I4WqyXcJeU=;
  b=jg4WughyryPxl0yr8LRWNFq8vNiq6dQKag9AbQXXIjZGxFwI1B2FdrMy
   9VJvLZv4CbJr5LclR0mn6MvMifXav9FxjdP/px7oChv+F0MLx65YvqFSQ
   rUABXMhvxb3wffD/HHtA57/am8vvrKloCj6L1YMFIEbLULSIpHt7qRPlk
   w=;
X-IPAS-Result: =?us-ascii?q?A0AQAABB33VkmJldJa1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBXFJzAlg9RwSIHIROhnyCJAOdZ4ElA1YPAQEBDQEBLg0JBAEBh?=
 =?us-ascii?q?QYChVwCJTQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBA?=
 =?us-ascii?q?QEeGQUOECeFaA2GBAEBAQEDAREoBgEBOAsEAgEIEQQBAR8QKAobAQEFAwIEA?=
 =?us-ascii?q?RIIARmCXAGCXAMBEAahNgGBPwKKJHiBNIEBgggBAQYEBYFKAkOdFwmBQgGMe?=
 =?us-ascii?q?hsghCgnG0CBTYFYeYFvPoJiAgIBF4ENFwEBIgWEDYIughqMJYNTM4kegS9wg?=
 =?us-ascii?q?SGBJ4ECAgkCEWeBDghme3lAAg1VCwtlgSNVPYFHAgIRPhRNfA4BEQMHBAKBB?=
 =?us-ascii?q?xAvBwQyCR8GCRgxJwZWBy0kCRMVQgSDbAMKgSM1NwNEHUADC3A9NQYOHwUEI?=
 =?us-ascii?q?wFKgVkEL0KBEQJKnEIDgnYHAYENKgEBWDQMAzFHKiuSWx8NsQoKJ4Nhi3uNG?=
 =?us-ascii?q?oggF4N/gVaLFJU6gy0ul2Aggi+INIJXmi8CBAIEBQIOAQeBYzpIYh8LB3AVg?=
 =?us-ascii?q?m4BATIJCj8ZD44gDA0Jg1KBf2WCMIplQzICAQgwAgcLAQEDCYhsgloBAQ?=
IronPort-PHdr: A9a23:npWNwh/pMAUYjP9uWO3oyV9kXcBvk6//MghQ7YIolPcXNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqLgF1J/jvHYL6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49ALiJFrLLowzBaBrnpTLuJRw24pbV7GlBfn7cD295lmmxk=
IronPort-Data: A9a23:WIeK+KLUHPC6zgerFE+R1ZUlxSXFcZb7ZxGr2PjKsXjdYENShDwPy
 2UYCDyGO/uKYjTweo90YI608hkGuZHVy4NmSQUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbuS6ULas1hxZH1c+E3980ko7wYbVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQQO/p8QLNknaHt1kg6ioIBv1
 PRk7rKZHFJB0q3kwIzxUjFCGC14eKZB4rKCez60sNeYyAvNdH6EL/dGVR5te9ZHvLcsRzgTr
 pT0KxhVBvyHr/m9wLOnUO5grs8iN8LseogYvxmMyBmHUa57H8mYGM0m4/dDg2gN3+1/Ac+Fd
 pBHZBxkQTvtOkFQbwJ/5JUWxbf02SaXnydjgFWNqKw65mLewAB83P3mN8DYUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rvXEkSW+U4UIGfjisPVrm1aUgGcUDXX6SGdXv9GFpneVQ/FkK
 nA24xEFkvgs6G2CFffUCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOoTiZmMdADDBnJJsLQHGx
 mNljPuyWmMy6Oz9pWa1s+bL/WnraED5OEdbPXdcJTbp9eUPt23as/4iZsxoHKjwhdrvFHSqh
 TuLtyM5wb4UiKbnNplXH3ia3lpARbCQHmbZAzk7uEr+vmuVg6b+O+SVBaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuabYa22B2QU0QsF7n9hIx5JFVd0AiN2ZDBo2WvvohReyC
 KMukVoLvcQKbCfCgVFfOtrrU6zGMpQM5fy8BqyLMbKik7B6dRSM+2l1dFWM0mX2+HXAYolhU
 ap3hf2EVC5AYYw+lWLeb75EjdcDmHtkrUuNHs+T8vhS+efEDJJjYe1bYALmgyFQxP7snTg5B
 P4EaZTSkEgDDrajCsQVmKZKRW03wbEALcmeg+Rcd/WIJUxtH2RJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:PW5hZ6wSrYWI7PbpMYQMKrPxiuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBdpTnhAsO9qADnhOFICO4qTPuftWjdySaVxeRZjLcKrAeQYhEXeIRmpN
 9dmsRFeb/N5B1B/LvHCWqDYpkdKbu8gduVbI7lph8HLXAIV0gj1XYCNu/xKDwTeOAyP+teKH
 Pq3Lshm9PPQwVzUi28PBQ4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsF
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RG4Fq/QpF491H2mxa1e
 UkkC1Qe/ibLEmhOV1dlCGdmTUIFgxerUMKh2Xo2EcL6vaJNQ7SQ/Ax9b5xQ1/85008vNd6ys
 twrhykXtxsfF39dOCX3amSa/ms/XDE+UYKgKodiWdSXpAZb6IUpYsD/FlNGJNFBy7i7ps7ed
 MeRP00ycwmB29yVUqp91VH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ90cjt
 60eJhAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaXLU78HK8KNnrRo9r84akz5uutZJsUpaFC06
 jpQRddryo/akjuAcqB0NlC9Q3MWny0WXD3xsRX9/FCy8rBrXrQQFm+oXwV4r6dSq8kc77mst
 6ISeBrP8M=
X-Talos-CUID: =?us-ascii?q?9a23=3AJKbfE2g73B68i82kEtHQcetH5DJuTlHk52/zGE6?=
 =?us-ascii?q?EK39SY4LFV0Ox0fhKup87?=
X-Talos-MUID: 9a23:/iKvWATeJY2qjodgRXT3225fbepZ/531GRpTnLMNluapbHBvbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 May 2023 11:39:32 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 34UBdW0Q018218
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:39:32 GMT
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,204,1681171200"; 
   d="scan'";a="2138946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdzU462PS9HR+bUM0YS6YVygfy9w6WwazZ7uoVub5IolbQ4DJrRZ7zaZXR4McCYD7MfBVGygk5rqDNMIPjYYrtmM71FPLGScCT8wO5y4A1O5kiTYRGP5NtA6Aym7wRbvrf+chcNhgresLCyJ6hArBqaYJOiXGxeHn4K3tBF2e3ZgBZ2EbC3vVrgMRN1utVe4mSyXM/lWaywDu04+zll5jo3rUQ74LwEbADYa1hdWb5TzbtgJ4WZjDmp0Vmq9/6EW69btRHBY24BRsjpKN7/s0grLDQ1ZTBv41SWqEyKYeLOmyc3b8Z3D9nEG8SP3uLtm9vGJoXkmHj8mucn8Ei+dYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EkJwxtP2TWqR4zV/mxlsPgzrJnOwGLS1I4WqyXcJeU=;
 b=RhSiYfFH8hm6swqprPCDuzz1xjgw5EKIbABe95JDXKDI47+QEGFOk8jsnwqCmAm/Xh8OpcocAIGVH9Oe3TcGm4xzmI7xW7vAROaYq4Z1dJaG6AnIS7+SWecgdHJ8Jw60LP6JhRO7tho/fnqlwGMA2+mPALUiY/wiE02/+Ii/ogDK540wWuQqYt/n+rR/YgCQEjbl0cACFK8BXYljhKO7qcgIBTAOpe9ZeCmkweXL5FK6utTTW1tBTWOUMpV5iwT4yjgpgwSt+YqhqaDalDoGJfIlAzpSUF+KJWRTjtQORYqn6OPFVOawUX8qzVF57fX7To+BOEDLYDairVQZGh7ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EkJwxtP2TWqR4zV/mxlsPgzrJnOwGLS1I4WqyXcJeU=;
 b=PbZc1L/FzbFa/Mk+ZfNlTVH5K6oYt7LDw1XiFzhpGMt1sduVFic9Z2KFvO/SEaUJuK8qex10GF8lxL+w1tWDEI3aIOYboi7AvwecEkH75aIb2x6m4DyKwPWBl7JWmwk/C8SGKXt0hUDBjsUupV9qSbq/r+m3B096v1S/WKCwpPI=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 11:39:30 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 11:39:29 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Steve Sakoman
	<steve@sakoman.com>,
        "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Subject: FW: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
Thread-Topic: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
Thread-Index: AQHZkTBOVmroIWwMLUm3v6XydG2/ca9vQcwggABgykCAAQ/bIIAB/+rA
Date: Tue, 30 May 2023 11:39:07 +0000
Deferred-Delivery: Tue, 30 May 2023 11:38:32 +0000
Message-ID: 
 <SJ0PR11MB6717FA035FCEDBFFD85254B0DC4B9@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17633BD1C0C1B26D.6918@lists.openembedded.org>
 <SJ0PR11MB6717FDF0FA29DCBA25329983DC459@SJ0PR11MB6717.namprd11.prod.outlook.com>
 <CO6PR11MB5602E50D7AEA18519A55F239ED459@CO6PR11MB5602.namprd11.prod.outlook.com>
 <SJ0PR11MB6717A6C93932B85EE1CBAEA2DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: 
 <SJ0PR11MB6717A6C93932B85EE1CBAEA2DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: steve@sakoman.com,richard.purdie@linuxfoundation.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|PH8PR11MB7967:EE_
x-ms-office365-filtering-correlation-id: 02662249-35e7-4dd8-a1ec-08db61028787
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MOLJ1Em+PGI6Lq3kzJ7ZMf7sTV3i+Ybbl/H7sHxhtS/5EbWAYMqLkEleaMCv8gi2+y2FQQOkRhAcm+qm9r8n8clFRIrzklbUw6tj4zfbojuqUk2V2xxp4cZ/tvyPu+8sSLxxhtvCVuGP/O8vVZzQEUIp7lRJk4KwRrwcgsE0FbqyserSo1+2SIenLvbwlAq7ZlC0GsBXdUsAhFKmDBskyqMrzr6wjsp+2UjaWMmqmbgJeWrJX88OKdPh5x/Hv6g+83MyEz2X0hUZx9DVQRBt/S0bD5oQoVcbH2PkRF1niBMIP9oaqll6rAY6okNfGTkrr/ca3kYgKsLIGPKFSej485AiNBa1+ldHvoKIUCMXKSZoPnTCnLFexfagCNerD4wsaZbAhxvR47jxjdcm1HuQ625nqYI0mW4fZ0HOGpg+xFQDHQuaUXZfh1pIvrUSdXsExJwzbbKslGx8zKPTt+aUPECD8TnB06yyPwq2dBA8sW9HiH1EOcRfoIqNbwK89VxNopyM2TCn6ThStJpvBk9NQDHojWQok7xhIHOZ0wqZ4zyXJRnbg4o/g3xm+lm9xcEGpTdmbkyXk+XeNsnQmq4Rq0rnjPNGubkRNiCHpwcI7PKlosZmw84iPGqJqq5nG7jnNvJP4rgpTXvNE4pD83WQpA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(316002)(66899021)(71200400001)(6666004)(966005)(38100700002)(55016003)(41300700001)(122000001)(38070700005)(7696005)(53546011)(52536014)(478600001)(86362001)(15650500001)(186003)(9686003)(66946007)(83380400001)(6506007)(55236004)(110136005)(26005)(5660300002)(2906002)(33656002)(66476007)(76116006)(64756008)(66556008)(66446008)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oz1B6PEy42c07Fo502iiEZ6j5bZ/CkwCN1h8J712+O9ZVnX4CagEDR1coLWA?=
 =?us-ascii?Q?IUP9oM2YMNo6huqzGWFYdHuMA6QzKGKS34jbtjWBgCEwumXU9KsYRIhU+OPu?=
 =?us-ascii?Q?vjJ2SPgnGQXw6Xx1zBT8SMkHuPi6O0OsDFNtQOXryieVYxc28w8NUEperzvn?=
 =?us-ascii?Q?kD9BZqalm+clGpdMpCtqmRKAkrZ0zzjwt7Cij+87nmpHr1QW0jq2Kf/vwp4r?=
 =?us-ascii?Q?5jckb6ohg9I+JuZkbnLtO10I8WTObyyOnnsKiHkryCVkXzoXor/LYQ3T+OH/?=
 =?us-ascii?Q?ExXnSimsYKShv9q4UVAUnlaYhfERyX5SDJT+EIa/WONkM0zclo4XKXR2pG5A?=
 =?us-ascii?Q?hlLL3qvweOrjvV9tBHE/3b6Hpg8I7yggn8qpLfAVEf+63Eq0+CUSI24hW2tI?=
 =?us-ascii?Q?0Pl2XdHmw+EM9vc3GzxMIicLLVz/f+CLh/ujgTVQb5msESBzKdlt7UAl9TxM?=
 =?us-ascii?Q?pOqJ2x+ikBkPAHwxr+T0Z4sY25LaoGrJSi1R/ITYBOFgUTAYWkDpK8Ddegrq?=
 =?us-ascii?Q?EwzkVU0Bt9ya/Z2rdSQpUX2U8aD89IKxwuuUJ+hxKZ2/miqCM4WFjVrwFU95?=
 =?us-ascii?Q?tH8Fy9ad//kohhZ0YtM/kQppAdbC8OJI2Fw0nMeAFJ683AyJX8tjDzEu1DDg?=
 =?us-ascii?Q?IzwgljI7OoNSsyAa3gvDfxsiIbcQyk/pK0eDM2mX2vxdscMBs6QklhpeNQxZ?=
 =?us-ascii?Q?UNkI58tmPqB6cpzNcK1Vlz7QDpWf8T1GUreefAdc/v/kROXB+0HNo/884PfF?=
 =?us-ascii?Q?yFu5nCccqQRlPSyV0xYL/RzBKg2Y53DVVIESx1W0w+CMN3vqqm+IugGbcOaa?=
 =?us-ascii?Q?HxB/BUz9Ap5hNPiLSdK/mHSkMl/GUHSdE8UqAqAzcjKDDAk3c60jf09MSqbx?=
 =?us-ascii?Q?+1uz7NXAB9joXrYrpmZZlyVN1bvtPqjPq80XShd5KxZGekVdZOdrYysvnYEv?=
 =?us-ascii?Q?NkKGj68M+sxARZ+Bchl9IH7vj0Cf8o/Pj7O+osuNSZw5yuAabIEuzuS0NkFI?=
 =?us-ascii?Q?p/DB+bIEytiRbe9+FAemo2YJ3h4MU+Mlus4+Tg/zRi5KHMzN01N/EE7p3u+X?=
 =?us-ascii?Q?F9JDbAT9eomtCsCK1HNPDBTnEFt4gaXKet9BMfDzuMPgTv2R1PDqcYOtYmVi?=
 =?us-ascii?Q?2WigzEVSJUVlmrLxgJxSALmGgr0deMUXGNaTwWbs6UgO7xgtMu82jRZPS3X0?=
 =?us-ascii?Q?Ecb6ybc92yIxORxVpZyWVM8xmoT/RPvTR9q/D5QeSIXhDOz0Jrzshg0dhy1x?=
 =?us-ascii?Q?mj3PnGmAEctOdndIvhCdzJ6e36O0U/IuzJGElj6D98Ng385U9VKbrmxu5siy?=
 =?us-ascii?Q?U6WzuDfhx1zsUSResKoM32QKOs+ZhdDDi4jGpLNR9fmkaKX326O7m7N0eyET?=
 =?us-ascii?Q?9nVcPrDZcW81jdPE1XK9Ll5fVV6Tjru68lp8Q3iabbPZU6EEl4Ev83Eggftn?=
 =?us-ascii?Q?TKmbZp98/T9H+rlI0jj5pgJ6RSHsKRVllMbPTuVwsmWpgmx4bSpIDG7+RBS0?=
 =?us-ascii?Q?uUXzxCpX/gPlf9dIG2yzTmRp1HdZck8ISLbgGDiv+bHExIcuru1fQUIiC9pq?=
 =?us-ascii?Q?/BnHidRKv4u4+wtd9GRb58/4Nxibm7wzwuHZ75kk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02662249-35e7-4dd8-a1ec-08db61028787
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 11:39:29.4558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VeBbNAfalzc+6N4LBt0o3SNxJ466+0KyPZMSb3zdlMvCQh7MJCAoRaD6rKYdTzM3Kp5y7t/rKAuMEd9GrEFbEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181916

Hi team,

I had discussion with Chen for this patch, but conversation is not availabl=
e on OE-core patchwork.
Anyone has any idea, why we can't see our conversation on website.

@Steve Sakoman @richard.purdie@linuxfoundation.org
Please take this conversation in consideration, and help/guide us on how to=
 proceed further.

Thanks,
Sanjay

-----Original Message-----
From: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cis=
co)=20
Sent: Monday, May 29, 2023 10:35 AM
To: Qi.Chen@windriver.com
Subject: RE: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"

Hi Chen,

I can't see our mail conversation on patchwork website.
https://patchwork.yoctoproject.org/project/oe-core/patch/20230528064732.389=
0226-1-schitrod@cisco.com/

Any idea on this why so?

Thanks,
Sanjay

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
Sent: Sunday, May 28, 2023 6:22 PM
To: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>; openembedded-core@lists.openembedded.org; alexandre=
.belloni@bootlin.com
Subject: Re: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"

Thanks for the patch. I did check the NVD database before I sent out the pa=
tch. But when I checked it just now, I can see that there's really no 'sqli=
te3' for this recipe. All 'sqlite3' refer to the node js package.

Acked-by: Chen Qi <Qi.Chen@windriver.com>

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Sunday, May 28, 2023 3:10 PM
To: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>; openembedded-core@lists.openembedded.org; alexandre=
.belloni@bootlin.com
Subject: Re: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"

Hi Alex,

It looks that due to https://github.com/openembedded/openembedded-core/comm=
it/8800976e79d65956218ab462d9644d0661579301 commit.

"CVE-2022-21227: sqlite3-native:sqlite3 https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2022-21227 " is wrongly reported on master branch:
https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-master=
.txt

Ideally CVE-2022-21227 CVE is applicable to https://github.com/TryGhost/nod=
e-sqlite3 which is " SQLite3 bindings for Node.js".
"https://github.com/sqlite/sqlite" is "Official Git mirror of the SQLite so=
urce tree".

Please review the case and share your comment.

Thanks,
Sanjay

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Sunday, May 28, 2023 12:18 PM
To: openembedded-core@lists.openembedded.org; Sanjaykumar kantibhai Chitrod=
a -X (schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com>
Subject: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"

This reverts commit 8800976e79d65956218ab462d9644d0661579301.

As per NVD database "ghost:sqlite3" product is specific to "node.js"
CVEs reported against above products are not applicable to us.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support=
/sqlite/sqlite3.inc
index c246d42fdf..9a0de08553 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -18,7 +18,7 @@ S =3D "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
=20
-CVE_PRODUCT =3D "sqlite sqlite3"
+CVE_PRODUCT =3D "sqlite"
=20
 inherit autotools pkgconfig siteinfo
=20
--=20
2.35.6


