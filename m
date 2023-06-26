Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF00EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 06:45:42 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web11.2319.1687761940703452560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 23:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=jTG3wBz0;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=936; q=dns/txt; s=iport;
  t=1687761940; x=1688971540;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FdPo6DnUhsHnQhDQoPWvS8PXOcDM5tHAG49s8+n0fhU=;
  b=jTG3wBz0NdqCl/hUZGgavxXlHctJQXtPRbbC95pBJ61Y2IpBi4rZQBk7
   +1X6zn+n0wPs6o7XBEST+ZNC26mFteedQKg751CdFeXFKP7uc/47sFvIR
   X0cDTxsTaQBtvJ3vleYVwZykU1LsAYs4hcE4z+ZfDKXRQwSuSgGBhr8+e
   Q=;
X-IPAS-Result: =?us-ascii?q?A0AVAwAKM5lkmJ1dJa1aHgEBCxIMQCWBHwuBYVJzAlkqE?=
 =?us-ascii?q?keIHQOFLYhXnXOBJQNWDwEBAQ0BATUPBAEBhQYChgUCJTQJDgECAgIBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaAEMhgUCAQMSL?=
 =?us-ascii?q?gEBCQEtAQ8CAU4yJQIEDg0TB4JcAYJcAwGjGQGBQAKKJXiBNIEBgggBAQYEB?=
 =?us-ascii?q?YEKAbFgCYFChFKDDXyEWYQ3JxtAgU2BFUOCN4NRAoFihBKCLoIXjBGFYweLN?=
 =?us-ascii?q?mWBKG+BHoEVC3oCCQIRZ4EICF+BagdAAg1UCwtjgRyCUgICESQWFFN4GwMHA?=
 =?us-ascii?q?4EFEC8HBDIoBgkYLyUGUQctJAkTFUEEg1gKgQw/FQ4RBIJVKzY/G1GCbQkXD?=
 =?us-ascii?q?jkDRB1AAwtwPTUUHwUEgkFqBIEMAiIkoG+DIYEVMRtbIGIGA4EAonWhEwong?=
 =?us-ascii?q?2EFi3eVOhepWIITlgwgolWFHAIEAgQFAg4BAQaBYzqBW3AVgyIJSRkPjiAZg?=
 =?us-ascii?q?1uPeXUCOQIHCwEBAwmLSAEB?=
IronPort-PHdr: A9a23:u3OvzhFuL19YCPplzTbmMZ1Gfu4Y04WdBeZdwoAsh7QLdbys4NG/e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HToeVNNFpPGbkbJ6ma38SZUHxz+MQRvIeGgGZTRhty+y+2a8JzIaAIOjz24Mvt+K
 RysplDJv9INyct6f78swwHApGdJfekeyWJzcFSUmRu9rsvl9594+CMWsPUkn/M=
IronPort-Data: A9a23:cL1DFqodULPUJXPlBq0mRltzhh1eBmIcZRIvgKrLsJaIsI4StFCzt
 garIBnVPfmPYWX2cot/YYS38h8AvJ7QxtFkTgY5rCowHyIXouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILas1htZG0k8EU/NtTo5w7Ri2tAy3IDja++wk
 YqaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDf3Zw0/Df2VhNrXSq
 9AvY12O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/RPjnRa70o1CBYTQWZJswmIg/os8
 vxAk5K+bD51DqrVyM1IBnG0EwkmVUFH0KXMLX76usuJwgiYNXDt2P5pSkoxOOX0+M4uXjoIr
 qNeeWtLN03c7w616OrTpu1Ehd4gJdHiII43sXB7xjafBvEjKXzGa/qavo4Cg29u7ixINfyFJ
 MYbZDFgVgbBR0JUYU8LCaMehvj90xETdBUB+A7K+sLb+VP7yxR81rXoOtfZdtGGAM5ShEuwo
 mPd43+/BQkXMtGawzeJ/n+gwOjVkkvGtJk6Dra08Lthh0eegzJVAxwNXlz9qv684qKjZz5BA
 20KwhYvsYJvzmWmaNfzeiTkkHmd7jdJDrK8DNYGwA2Kz6PV5SOQCW4FUiNNZbQaWCkeGGFCO
 rihwo2BONB/jFGGYSnCqerM/FteLQBQfDBSP3ZVJecQy4C7+Nlbs/7Zcjp0/EeIYjDdAzr8x
 XWBqzIzwutVhs8Q3KL99lfC695NmnQrZlBsjuk0djv1hu+cWGJDT9f0gbQ8xaoZRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxT8Z/rG3xoCX5LdA4DNRCyKFBb5dsldjBP
 he7hO+tzMQ70IaCNPUuONvhV6zGM4C5TIu6PhwrUja+SsEhKFDYlM2fTUWRxGvq2FM9ir0yP
 IzzTCpfJShyNEiT9xLvH711+eZynkgWnDqPLbillE7P+eTFOxaopUItbQHmghYRtv3U+W04M
 r93aqO39vmoeLeiM3mJodFCfQliwLpSLcmelvG7v9Wre2JOMGogEPTWh7gmfuRYc259zY8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:nubdmq50z/GSajwGlwPXwWeBI+orL9Y04lQ7vn2ZFiY1TiXIra
 6TdaoguiMc0AxhJ03I+errBEGBKUmskqKdkrNhQ4tKOzOW91dATbsSobcKpgeBJ8SQzJ8n6U
 4NSdkaNDS0NykHsS+Y2nj3Lz9D+qj8zEnAv463pBsdLnAJV0gj1XYFNu/xKDwReOAyP+tAKH
 Pq3Ls/m9PPQwVyUi28PBQ4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsV
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGIFq/QpF4t1H2mxa1O
 UkkC1QePibLEmhOF1dlCGdnjUIFgxeskMKh2Xo2UcL6vaJNQ7SQ/Ax9b6xNCGpqnbJeLpHof
 h2N6XzjesNMfvN8R6NlOTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVx4SxbpXWd
 WGNvusrMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNc7W2He4OSITeuOb0oAiPvE=
X-Talos-CUID: 9a23:SvOguW45AOTH8XAeJdss1VAsJsE5WCDn5Xr2LUGdMDpZT6TFYArF
X-Talos-MUID: 9a23:JIIYcAi46RXFOjWc1PTqzMMpPpwr76ajA083g5Qi5NLfLTBxCheHk2Hi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Jun 2023 06:45:39 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 35Q6jbeB026114
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:45:39 GMT
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=krkapate@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.01,158,1684800000"; 
   d="scan'208";a="3433747"
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 06:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD71A1A9Q/hCZea66hgitB3Fqlk8d0hs2ze9lkUvXaUd1ZrT/quWS1RFNMKewJ1Mh4l3i/9SSzQCnVc4NwUZMXe0riYaN2OfVruMPy0ktnAOdPO9HHkoATVGWH/S4XffzvHzlhgnDpy4S7uNfGVpixLm23j46+ksQta49eQoWVM1+QbeELbgZ2JKSuNo8oWN8O+Ni/RVB7z6WsvB9FpI4OBA7c5d8/ZMhhl46dkJv20r68UWPSjozFMVy1PQM1bPn3SJKDwCLh2Y3uTFn3gd0ouLbSTgt1Q/0n7NpQQCltkgX5o/G/kaLI95UkM+zVcS+BDJp1Uzsuqv9KRBT8d4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdPo6DnUhsHnQhDQoPWvS8PXOcDM5tHAG49s8+n0fhU=;
 b=RaRLcpKvtV3dsJHPf8Rg3h/NaNvvl0wIw32aoLMbQN4MbQ3SIPPMl+sokNsqxS/DdtN0clmtgfIHwK9zoTOUpVs1XzSQBxSaFXXV856rzNX5tBPygZ/KPwCb6LzGl4JQn3a12itq8NDYzJlTF5I8+7Le+HYbUF/319cFFTofA8sfoqaV8a15yxQktQ22ErGpHF8HRUSi8m+krOp+14OtAY6dR3XkjN+S26oXRQjdLn7V+1B0sxcYQMEvtbyZ5rF0G3ozZsbUyYENER9ZBzZXTVO/VkYfZdxzIRnrszdRsAMgs4JTbb4IKsw7Af+KYHqQmFtAMSpDMx5KCo5lKtVf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdPo6DnUhsHnQhDQoPWvS8PXOcDM5tHAG49s8+n0fhU=;
 b=fwmx/X0TBe1YGcG0/ONqDON2f7oQNMZrz9I5w9uYHf8Iv6EPKMSsCe5/udYMkEaapnz9+KvEwzyjvDTpe1u/RkI209EmUOyP0tEyU5WMLPSeNKc+S3Jpr9010CcnZgFGP6nZrPZHji4hkmEMm0py63WPSKhJrEz/dQUD+ENNf18=
Received: from BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 06:45:36 +0000
Received: from BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::5d2a:bca8:b83:597a]) by BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::5d2a:bca8:b83:597a%5]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:45:35 +0000
From: "Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC at Cisco)"
	<krkapate@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Multiple providers are available for runtime libltdl (libtool,
 libtool-native)
Thread-Topic: Multiple providers are available for runtime libltdl (libtool,
 libtool-native)
Thread-Index: AQHZpObVvpR86lAiz0evk36F2k4EgK+Wjm+zgAYaaVw=
Date: Mon, 26 Jun 2023 06:45:35 +0000
Message-ID: 
 <BL1PR11MB53990B0F5E0ACD4C6A10149FD326A@BL1PR11MB5399.namprd11.prod.outlook.com>
References: 
 <BL1PR11MB539919006E25CD8243EDE31FD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <BL1PR11MB5399A434D9A3B13D1A802A4BD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
In-Reply-To: 
 <BL1PR11MB5399A434D9A3B13D1A802A4BD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5399:EE_|IA0PR11MB8353:EE_
x-ms-office365-filtering-correlation-id: 8d35f3d7-5a19-4eef-4290-08db7610f232
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tUj9cWeiXSFvd/fqr2kXxI2se8DvbU4WLPMYGVpdN2aNGmIszoq/uPUTFVXrfaf5GNV4I3MtMK3xLRWoPqHq7I9Rf2+LTt3XbjJQVwJqhfxWxw0fN9m8R6+vRtaPcT4StbOIeKBWHmVx0DT86aB1uM8dXuDooHNSLzZZss/UmHUTevFUgkOVsIxBRdBIs7iNuZj1LJeelMZtptIjRE454XC4kQmMLZ0Ld5t+9Q6SK/AhPMhzH5gSh3obysoJepL/nzNxmaetkxcvmCOnl6YbtA9F0umoDu6UG9/0Opmu/jyP5F4+WVyE1fe2wnUsMY6rY4ppq4h0gzPh5dzFXOpqcdVAb5ib0Keb+XRhDSHHZ9aznCl9x7onRCIcwnc1ZsQ1EvBZejMf629bhJovwV5lpwLzL/KHH7UjNCZmFCjH7MKItLMjEgauw7RXOUGgMc5VPqbfvEGpaeR2wrGXSxUIiP07Xrs8E/v/M5Pi77z6Nfv3iW4PP7wNoIOiVlrYRQmSQSvoqZ3T55m54H+nz1TO5GSxp4qGkcdEjvFMB3UpG5VaG0Su4yLY6A/zUOD/fcwvugA11B+wDUmKd1SZkuGZn87I5slHhJxXCNaOLECCjGI/dmZ2j5Ds27mYAS+B+sMv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(5660300002)(52536014)(4326008)(76116006)(66946007)(91956017)(66556008)(66446008)(33656002)(64756008)(6916009)(66476007)(478600001)(316002)(8676002)(8936002)(2906002)(4744005)(55016003)(38070700005)(86362001)(41300700001)(7696005)(9686003)(6506007)(26005)(186003)(38100700002)(122000001)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?WzTUwZ/G2DdXXGFK0BGyyFdPmXckGlhVpasjjTu7szhyTBHhCS/AKdBEor?=
 =?iso-8859-1?Q?gQ1Ie65J/CZqKdW1nyizSIM/l7XW6jiO6goTqjRTPTnNaiaYtbgkm09z2/?=
 =?iso-8859-1?Q?hpjYS5i+Dvk1kILPRV/TooIW898X/BRXf3i+HIY38ths0d59kuwt2MEKri?=
 =?iso-8859-1?Q?J2DBx/mSTaJHrkyq67AnUeG9VF/yFaqyMhlmYxG6CEJpXrgXHoWVxVMyX6?=
 =?iso-8859-1?Q?xQ0xQx2dQW0+op3Fx0bq5GRd9CPd81WusY05sAynLylVEWqzOHqDoGWnCQ?=
 =?iso-8859-1?Q?u0Bfnkr5L1heTZF+NjtrRE0193V/fw5PMSM9rHgVgrpYl8gRNN+dQaHAEZ?=
 =?iso-8859-1?Q?wy23lohQdGbznVISmPQt3kUulVql9nsdx3feV4oi24v+F32rUVMxJLJ4DT?=
 =?iso-8859-1?Q?dZlw8B26EFjmF6ROfYEQfui52l0cFyuzjlyPDAKfXxkbqwFosnDM/NvQO0?=
 =?iso-8859-1?Q?SCdHu1YLiKQyToH6GqsLffEuZ66EkX33st9tuK0jS4nilYcL0/L/Bfkuot?=
 =?iso-8859-1?Q?WttJwSxKjcuFecnvuaraN1evYJ4SIULYYvY3jxhNs7uUgeX/MRDwrlDzXD?=
 =?iso-8859-1?Q?7SpiygcpVhSPobIm2hVd3qYcOtVvia5iP22FXVEX0FqX4nveOW+qkL7Aqo?=
 =?iso-8859-1?Q?O9dkACA9TnEy0SNGCw5vYXwly+b/Zpf96rrm5oPpB2EaxlHHVxzxjEKl5o?=
 =?iso-8859-1?Q?V56ztJQ+tRgJ3vobNTDFhlSujb3370MCLaq+uNanQfrGY+Ui4AHj8K+3WS?=
 =?iso-8859-1?Q?2nR9aHP8izKT9xBb+QGg7BurNSyn/CBuvRT53iirIJpN8jS4A5HonEHIW2?=
 =?iso-8859-1?Q?j4Z5wL4gGzXIgkYTiGdREJ+YfNUWv+TbbBYF/0vA1EfGqO5ZBvobpgYef+?=
 =?iso-8859-1?Q?yVfzri0OQlXgdmY56LrZC7JWcxJaI/Md3s0sofJRJrs4zRAQT4WIF+jp0k?=
 =?iso-8859-1?Q?bHhZLCl/RFkWx9GjZYT+K5akttIgwD5KhKiDAIDYSz2L5OHvggB3Z/mz/L?=
 =?iso-8859-1?Q?1CQ5jm1RYU+V8W58F0FCWjUVf1/oZ5ryl6Kulxqmjf40Dn/6tYxexFKLVQ?=
 =?iso-8859-1?Q?NWEb8XCfuEp41Tk8wVtJ2wZn+imh1YbcNjayfgC3FTu+ctwRxJxMtIEc7u?=
 =?iso-8859-1?Q?YJIYLsf5D7QPe43kBayAaxQmDLQnmTyBrt3eNXA11jGZdh73ym9BBhJwqr?=
 =?iso-8859-1?Q?zfdJbwXpM33cuQ/k9BbkXJ/O7On73AmR98+o1AIhtRl8BYMURZTcECg1nW?=
 =?iso-8859-1?Q?aSQ2ajfZSZYYeRmnRYB8PgV12ilKsa3uxxH9jXGrMi5lFsMR13NiSoVT/b?=
 =?iso-8859-1?Q?ZI8ITX+py9XM297YIwu8YaBLwYrndJy8wj4HFGbsoK9mytCK6w4obeoRVT?=
 =?iso-8859-1?Q?DBOPt/5snFNF+x/Hn85drKU7V644da95lne6UCaIGopYIe3X0K2tmx2xS3?=
 =?iso-8859-1?Q?MUaf3IGa8139S4tAw+kDmN7LkM8vmLAmuLJKY7oT6HgdEuuP3B00GFhGG0?=
 =?iso-8859-1?Q?u9lcXcuKy5TFE5Ssl54XC6/AzlLzN8tGULI5dd+iPmlFzzd42Si/Izoavd?=
 =?iso-8859-1?Q?YQEZuvi86tHZ2FueknlEkY43OnF7iv3ELKTiuhEhIhiikMBxn/A01cwJk+?=
 =?iso-8859-1?Q?25WUUZ+Scuf84=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d35f3d7-5a19-4eef-4290-08db7610f232
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 06:45:35.7676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9Mnmlk1qTHDSQupvQsUDI6Rr9HhJTIi+XJVi2L8nbdetvWFl5KuSa/a6cNuwtPq8jFif2o+ouISM2PckICG0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183406

Hello Richard,=0A=
=0A=
I see the following warnings while compiling an image (i.e., core-image-min=
imal). =0A=
NOTE: Multiple providers are available for runtime libltdl (libtool, libtoo=
l-native)=0A=
Consider defining a PREFERRED_RPROVIDER entry to match libltdl=0A=
=0A=
The following are my observations/findings:=0A=
- The package "libltdl" is defined in "libtool-2.4.7.inc" file.=0A=
- The "libtool-2.4.7.inc" file is in require in "libtool_2.4.7.bb" and "lib=
tool-native_2.4.7.bb"=0A=
- Hence, the above warnings appeared. =0A=
=0A=
Can anyone explain how to remove these warnings in a proper way or the case=
 requiring this?=0A=
=0A=
As a workaround, I can add the run-time preferred provider as below.=0A=
PREFERRED_RPROVIDER_libltdl =3D "libtool"=0A=
However, a proper solution is necessary.=0A=
=0A=
Appreciating any responses/insights (for this issue).=0A=
=0A=
Thanks & Regards,=0A=
Krupal=0A=

