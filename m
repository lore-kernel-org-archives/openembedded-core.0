Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC13AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:43:10 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.7895.1685515388336457600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=gVBvZ3uf;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5082; q=dns/txt; s=iport;
  t=1685515388; x=1686724988;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4evD+7MT2Yoy/+aTFvPLNJI48go1X9n6vVx0aV2nN+0=;
  b=gVBvZ3uf+LCfHhOOzzM8qh4sftMkjwJ4F0gNc/nwmIPq5x4gtnFi8u5G
   Sf7AWoWcnCrsPsMcUGlDKN/JRrDWcerfGEKSOdAtljloEyJsO52VvKrZg
   rnV1MjVQwpgk5HzVgc2IGzrq6LUQuzEhITXS86TBJ3oE9r11n/Qnz+Sij
   c=;
X-IPAS-Result: =?us-ascii?q?A0ARAADW63ZkmIcNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBXFJzAlg9RwSIHIROhnyBN20DnWeBJQNWDwEBAQ0BAS4NCQQBA?=
 =?us-ascii?q?YRARgKFXQIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBA?=
 =?us-ascii?q?QEBAR4ZBRAOJ4VoDYYEAQEBAQMBERUTBgEBCQEuCwQCAQgOAwMBAQEfECgKH?=
 =?us-ascii?q?QgCBAESCBqCXAGCXAMBEKM7AYE/AookeIEBM4EBgggBAQYEBYEKAZ4bCYFCA?=
 =?us-ascii?q?Y0VhEgnG0CBTYFYeYFvPoEFgV0CgWKEEoIujkuDcTOJI4EvcIEhgSaBAgIJA?=
 =?us-ascii?q?hFngQ4IYoF0QAINVQsLY4EjVT2BRwICET4PBVF8DgERAwcEAoEHEC8HBDIJF?=
 =?us-ascii?q?gkGCRgxJwZWBy0kCRMVQgSDZgMKgRtMFQ43A0QdQAMLcD01Bg4fBQQjAUuBW?=
 =?us-ascii?q?AQvQYEWAkqcXgOCBngBUjsBK4EYZQbEeAong2GLe40aiCAXg3+MaphnC5gDI?=
 =?us-ascii?q?I06mjACBAIEBQIOAQeBYzqBW3AVgm4BATIJCj8ZD44gDAEMCYNShRSKZUMyA?=
 =?us-ascii?q?gEIMAIHCwEBAwmLRgEB?=
IronPort-PHdr: A9a23:Px7OERaNuqig1aVa2nP/1jv/LTDhhN3EVzX9orI9gL5IN6O78IunZ
 grU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+YgBOAMirX1TJuTWp6CIKXBD2NA57POPwT5XZj8Wrzee+05bSeA5PwjG6ZOA6I
 BC/tw6ErsANmsMiMvMo1xLTq31UeuJbjW9pPgeVmBDxp4+8qZVi6C9X/fkm8qZ9
IronPort-Data: A9a23:p47pJ6nprpnLmQ8kxlLMJlvo5gycJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNCD2PP6uOYzagfd92O9u1oUMCsJKEndBmHQdr/yA9EltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuKU5NXsZGYpHWeIdA970Ug4w7Ni29Yx6TSEK1rlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJM53yZWKEpfNatI88thW6
 Ar05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkSvqkAqm8A87ko0HOYbR35ahQuCpfxol
 4lC5JGXFywEJaKZzYzxUzEAe81/FaRC/LmCKn+lvInJiUbHaHDrhf5pCSnaP6VBpb0xWj8Ir
 KdecWtQBvyAr7reLLaTUeJsh9g5K8XDN4IEsXYmxjbcZRojacmaGv2XvYYFgV/cgOhoP/KFO
 fgpVwFXZQ//PDlLPkkHUawHybLAan7XKm0E9w39SbAMy2/LwQp81bLgPNbYdpmBQt9YtkKZv
 X7duWPhDxcXMdaSxTaI/jSrnOCnoM/gcIsWELv9/flwjRjJgGcSExYRE1C8pJFVl3JSRfpDL
 GIt9yQQppIe7RP3QYjweEOTjWWL60t0t8VrL8U27wSEy6zx6gmfB3QZQjMpVDDAnJJrLdDN/
 gLT9+4FFQCDo5XOEyLAquv8QSeafHlLcD5TPUfoWCNYu7HeTJcPYgUjpzqJOIG8lNn8Hz2YL
 9ui83Vm2+57YSLmK8yGEb3vijaooN3CSRQ4o1+RVWO+5QQ/b4mgD2BJ1bQ5xasaRGp6ZgDe1
 JThpyR4xLtRZX1qvHfQKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aKWK1P
 xaP4l4BtcM70J6WgUlfPdrZ5yMCkPeIKDgZfqu8gidmO8IoL1bXoEmCm2bJhzqw+KTTrU3PE
 c7LLZnzZZrrIa9m1zGxD/wMyqMmwztW+I8gbc6T8vhT6pLHPCT9Ye5caDOmN7lphIva+1+92
 4gEaKO3J+B3DbeWjt//q9BDdDjn7BETWPjLliCgXrHceVY3QDh8UJc8A9oJIuRYokicrc+Rl
 lmVUU5Dw125jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:8ceLqqt0bjKMDAKY16dMWqSl7skCwIMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEDhexnhHO1OkPYs1NCZLUTbUQqTXctfBO7ZogEIdBeOj9K0W8
 1bAtBD4bHLfDpHZIPBkXSF+rUbsZW6GcKT9JzjJh5WJGkAC9AC0+46MHfgLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXfOpACZYX+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K13TDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/Qzd4dvfqGrCou
 O84SvIDP4Drk85uVvF5ScF7jOQkwrGLUWSjmNwz0GT5/ARDwhKdfapzbgpAycxrXBQ8+2VFM
 lwrjqkX109N2KYoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIdLH4sJlOM1GkcKp
 gZMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Vol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke++3JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9NFlVnQ6dv/22y6IJyIEUHoCbQRFrYGpe4Pednw==
X-Talos-CUID: =?us-ascii?q?9a23=3ApXl24moQ+YZ/RMWN/Ne04sjmUdwiXETQwknbGWO?=
 =?us-ascii?q?hVjpmGbCyF3S946wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A7q4xkg9DsjAOU65j5lQlJjiQf+FK5//wOnAzqq0?=
 =?us-ascii?q?PoPbbESh0JSfEsg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-2.cisco.com ([173.36.13.135])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 31 May 2023 06:43:06 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 34V6h4Wx027244
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:43:06 GMT
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,205,1681171200"; 
   d="scan'";a="2187351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkIF6tuWX+WL1m/pSb4Kro0mqi9Y+yWmJm4UFDFrIqNKuw/B5lov2+Om7LBEHEtRxNVuT6mZoo6i+JWAaoDAc8csM3kkefQ4Bg3kJxLlSD6uIsbwfa5kp1YIeFeqCcXOUVk34M5vH/D3Fsi8SE3/MX57DsN4ik5XMwOkxIy1RMio+8Ysfgl97uDO4pvmacVG0PPUfo3zAqZ/ADeNXn/Y8Sb2BBWPpj8ueXkW7T4yKAQ+c8TysqmMBOmx4xIKbVjH5tGZSvYMWoRXoEEyN0uE+OypytIzwJfJvd1336f4Ben7qTWc4Xji3gWsp9dpgIzocFaRBrzgb4P8670bjvid1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuBWtrO06BGSl8MCfkwvKfJdqSoYXnpLULRCU0F5UwI=;
 b=eqo7q2DMLMV8s3ddiOXbzyPlyEg68BSQ4zgadaDHW7AIAK575UYbEQJZ4Q1re26KUkdTd1zyJ11rI1VWWUmC/ZLbKV407F6tvhtyuV0wCmHhFSn/mU0Fu6/HDz5gnCVt6dsOpJJds+zjU0Sxhy727Y8EWrzQq+43/DOqaaE+7LHG2SnoEqBF0FZxSNfe9+/GKB1VPXOsN0dcAJK1QS1yBM36YsFlDwAq+a9KPcUy4UM+tDqpLTBc4W2QsVW/zGiGNNniMnipgeXG0eF62On1q4kjL/xtTxO/JIo0f5mXfPanzKrw3yR9KCecKcCKiRJYRQBX2+0fcPluvM3m2jowKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuBWtrO06BGSl8MCfkwvKfJdqSoYXnpLULRCU0F5UwI=;
 b=JsvFMog8N2x9grCfOQ05+yWllGv5fCF3wuYnhtw3RKue7OngyVPEjQ731PQyiE57Swtp0Ru6Qv5G3PXW4dmZcxZ9Fzwk3ZyGKVjKdKI/O40/pnAQnmwqQGJw36baitl/AVMKDngJ7F/Ge2XF4Dj8BPoE+fb665WVeCY10CVjaeg=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 06:43:01 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 06:43:01 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Hitendra Prajapati <hprajapati@mvista.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH] sysstat: Fix CVE-2023-33204
Thread-Topic: [OE-core] [kirkstone][PATCH] sysstat: Fix CVE-2023-33204
Thread-Index: AQHZk31uUGWNLoxB60uKZsQTKh5dA69z7ZnQ
Date: Wed, 31 May 2023 06:42:34 +0000
Deferred-Delivery: Wed, 31 May 2023 06:42:00 +0000
Message-ID: 
 <SJ0PR11MB6717AE755195813177D2B157DC489@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230531050429.33073-1-hprajapati@mvista.com>
In-Reply-To: <20230531050429.33073-1-hprajapati@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|LV3PR11MB8482:EE_
x-ms-office365-filtering-correlation-id: cd139b9e-3531-4875-4bc9-08db61a24770
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4BJ/g7G9RiQXuUgehC6Kq/K9WzygJXA25dYlPaUSE6WMxI0pLSJUwjZSMrIJkdY5kDtRoRnI9Jl7iHo4gtgWXjV6JGm9EmnxkWHFvcA4K9BANRgtrBew6kEfUHks6YVo1KjqA6rRoClzSjIwzbjbhX2c6FXWZokpM24MHzfzW3AHFJZs5NnqZCe4BEpRmf7hkkdzciJQ0rAuFg0e8k3jCb6luuA02j5T3EshiWhzttrRQ+Nxrg6XihQacz5Ech0yvENj08cpxN0Lmqi8wBPWv8uo79qmAz3VcSba0L4mBSUowurU97YKjRtG+7CPqAVTL9CTME9s0b76R27ckjRjdUgoG8h8a53jdWgd+QSxZp/KGZD9zYIx5KXmr5VNBeZxl4d1BboBLkWxUjfI/LTUVQXUquNf7R1zIC6SSDvefn1BQo6bXmDi3lh3sdtG6lgFQqvMmKUKSOomqMo6Gco7WZSv5yqPPtDwgehGEmLgGjqcVRzdrBL4G/u67zGJjTbAkLkrW+bpNeLIleGnb5j11qYvUCvWMbN/j8rYAhTXKJrbTRAhD0/Swbz/N0YvUco/xMNVPicBbBOcCtzdZdiPmEERNoVdM+M/WxrBs9JK0EZXU10xRgzC0Yg5B2/AwKX7986aSKINT6MVXV2grTUO2w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(64756008)(66556008)(66446008)(66476007)(66946007)(186003)(76116006)(478600001)(86362001)(2906002)(316002)(83380400001)(966005)(38100700002)(26005)(41300700001)(55236004)(52536014)(5660300002)(110136005)(53546011)(9686003)(6506007)(33656002)(122000001)(7696005)(71200400001)(6666004)(38070700005)(55016003)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8WVeArQvEIPrG1ejJ9M9xxyyWIEWbypor4+0PJ8/noc8OHuXbPLYDNX/8Nem?=
 =?us-ascii?Q?OznoDpwZVxog+zPaINVKtOOBVKIaZKUNNd73tcpOdAiD/Qx9Eq/6a4f4vYNA?=
 =?us-ascii?Q?yLXjehT9Ift5qXFI59VkL8RrDJPXm7ygHBMN9IYmziAeXvLLp0Y0Kp39XmBr?=
 =?us-ascii?Q?I+E3fSJ9CSk+PWPNmibsC4/GnKrV6KkDUH/a6UJB6WsfXl43lAaa1XwhgMSb?=
 =?us-ascii?Q?QRUTP5J/zq9JnkXwU929s5u2v8IUC5sPNxYBc8Y74Yx3MqwPK4pibdHsZoUM?=
 =?us-ascii?Q?GuWVkKrp0yqVZEL+JVnVrUqFe5GLdKZu7pmGpPgnXboJplC+S6lexYW4u4m1?=
 =?us-ascii?Q?OrF7tt0SxZ5DLGqd9fE4er/ytE3oKjN/Bz+OIakx3r6vL475b37LOaiyEWrs?=
 =?us-ascii?Q?/OKpP61VTCHHEwMslZhM/vcb7bwJesWiNmhLWvgkCpH0vGluD2qhld9rxH6M?=
 =?us-ascii?Q?Fc6JTr4Uaal+upoBabr+JgEcJsMKC+0UmP1o8b297PXtsQdXGxFEJae+wyM8?=
 =?us-ascii?Q?TScoDiOYIms5RDSUWgmdavmHM3wu/WA83wkmxtAraJmOZuU+dwNa2ZQbiwGi?=
 =?us-ascii?Q?23633+THIHIA9Bm9szI6WzmtWEfZpEbp6wM+8LFOmc1ml/9Rs4VTU5ByH+jz?=
 =?us-ascii?Q?NAtBzTe8/UqDvw01IFyv9BsH3Wv3Vajz75XBfM2bIVWxlXml5bxpI2HR28Kv?=
 =?us-ascii?Q?jYUO7CLKCWe6R0qofAwuGM7t/X+FDvs0+FieX49JH2FnB0YJCopStpbBu6d3?=
 =?us-ascii?Q?FmB2OX5BCaTHwcJNxjlUhepYgwpsf8jNyF/isYPAD5pZzX0S/t6qArpWSgnf?=
 =?us-ascii?Q?kpZxtk6QJNe2hqJpnpfYirwH74bdByprfDtD2+9UHzDYbCN0YCc3NT2SfYvc?=
 =?us-ascii?Q?BayrwI/mzUV7sxA5xNnPxOCT/oyu/Bqk1W13tRsCwwigDsdT4iwtvVhWngX8?=
 =?us-ascii?Q?eM+A3n/BDkuysVVFQgHCs3ZjYNuSVsZ8qIaGOWwl8lpACaUsdmLbQu9LNvaG?=
 =?us-ascii?Q?ZhJebFtc/5lH7TYZt2qpmB6VGJqgQyIZ9xQF6RWCj3YVPM3jOCvCRgt+mQeS?=
 =?us-ascii?Q?AfPKmmIq7b0+yVzWjR6WH9FJVKN/+tSgjf+ZCP+aqsoKJ2WScafx6DZHrpF5?=
 =?us-ascii?Q?WnDvyPuoaVfPPiArri6qRscU7PLTjDVT1aNXjnbOZfTK7/482lVLHmQeu4D3?=
 =?us-ascii?Q?10kKAtqcRNubYcbi8MbmmWNrTzCKph3FqJa2a1v2KRc7y8EYDwuhnfVse3PE?=
 =?us-ascii?Q?h3eNbQa1xlloW1dg71F3+s0vpfEFACYa2HBbChEHS86siHSVAWGpBoAU6t99?=
 =?us-ascii?Q?t1CA1dB+0c1KCT6wYXMByTKyzA7A2FW/v/uKoAuCJAjjtRb5WazhNXYsiEPb?=
 =?us-ascii?Q?lNp8XkU33rdZXJK5Fd0m6o82EKSKpgcq0WUu/TqMW3aXzFNrflXt5wRVQVWu?=
 =?us-ascii?Q?lmJx9Dc4gPSx1fyNgGFbFU3RlzHBQ9DKenNymZK/eqfdOBAqSurIvOt+c3AU?=
 =?us-ascii?Q?ibJ49R0YPyKl0Q1uIXyJnxSkYKXWyekG4KA8+ZeYlINRdtt81cTv+aDPyqGG?=
 =?us-ascii?Q?yfDJsAkI4wpGr6rjY0ZZMehzz9lRs1Rjb0aQ/ZHQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd139b9e-3531-4875-4bc9-08db61a24770
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 06:43:01.4055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87oE7gbQa7wtjFzf22FAft8Yy1PknJ0prNJzETR4D+xeAAFPrmES1l0QWJak5mGUFaGtQ0F/k7KQoOrVLya6Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181994

Hi Hitendra,

Below commit is merge commit, we shouldn't cherry-pick merge commit:
https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04e685b=
f9237c0

Please refer: https://patchwork.yoctoproject.org/project/oe-core/patch/2023=
0529080302.1154687-1-schitrod@cisco.com/
Once CVE fix gets merge on master, we can backport fix on release branches.

Thanks,
Sanjay


-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Hitendra Prajapati
Sent: Wednesday, May 31, 2023 10:34 AM
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [OE-core] [kirkstone][PATCH] sysstat: Fix CVE-2023-33204

Upstream-Status: Backport from https://github.com/sysstat/sysstat/commit/6f=
8dc568e6ab072bb8205b732f04e685bf9237c0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 80 +++++++++++++++++++
 .../sysstat/sysstat_12.4.5.bb                 |  5 +-
 2 files changed, 83 insertions(+), 2 deletions(-)  create mode 100644 meta=
/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/m=
eta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..5744870bdc
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,80 @@
+From e806a902cc90a0b87da00854de8d5fd8222540fc Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+Upstream-Status: Backport=20
+[https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04
+e685bf9237c0]
+CVE: CVE-2023-33204
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@...>
+Signed-off-by: Sanjay Chitroda <schitrod@...>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ common.c    | 18 ++++++++++--------
+ common.h    |  2 +-
+ sa_common.c |  4 ++--
+ 3 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/common.c b/common.c
+index db9b0ed..e05c5bb 100644
+--- a/common.c
++++ b/common.c
+@@ -1640,17 +1640,19 @@ int parse_values(char *strargv, unsigned char bitm=
ap[], int max_val, const char
+  * @val3	Third value.
+ =20
+***********************************************************************
+****
+  */
+-void check_overflow(size_t val1, size_t val2, size_t val3)
++void check_overflow(unsigned int val1, unsigned int val2,
++		    unsigned int val3)
+ {
+-	if ((unsigned long long) val1 *
+-	    (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 !=3D 0) && (val2 !=3D 0) && (val3 !=3D 0) &&
++	    (((unsigned long long) UINT_MAX / (unsigned long long) val1 <
++	      (unsigned long long) val2) ||
++	     ((unsigned long long) UINT_MAX / ((unsigned long long) val1 * (unsi=
gned long long) val2) <
++	      (unsigned long long) val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__,
+-			(unsigned long long) val1 * (unsigned long long) val2 *	(unsigned long=
 long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+-	exit(4);
++		exit(4);
+ 	}
+ }
+=20
+diff --git a/common.h b/common.h
+index 0ac5896..b2ffe9f 100644
+--- a/common.h
++++ b/common.h
+@@ -256,7 +256,7 @@ int check_dir
+=20
+ #ifndef SOURCE_SADC
+ void check_overflow
+-	(size_t, size_t, size_t);
++	(unsigned int, unsigned int, unsigned int);
+ int count_bits
+ 	(void *, int);
+ int count_csvalues
+diff --git a/sa_common.c b/sa_common.c
+index 1b8fcaa..1144cfe 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -452,8 +452,8 @@ void allocate_structures(struct activity *act[])
+ 		if (act[i]->nr_ini > 0) {
+=20
+ 			/* Look for a possible overflow */
+-			check_overflow((size_t) act[i]->msize, (size_t) act[i]->nr_ini,
+-				       (size_t) act[i]->nr2);
++			check_overflow((unsigned int) act[i]->msize, (unsigned int) act[i]->nr=
_ini,
++				       (unsigned int) act[i]->nr2);
+=20
+ 			for (j =3D 0; j < 3; j++) {
+ 				SREALLOC(act[i]->buf[j], void,
+--
+2.25.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes=
-extended/sysstat/sysstat_12.4.5.bb
index 3a3d1fb6ba..f8a950e8a2 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
@@ -3,6 +3,7 @@ require sysstat.inc
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da23a74b3f4caf9616230789d94217ac=
b"
=20
 SRC_URI +=3D "file://0001-configure.in-remove-check-for-chkconfig.patch \
-           file://CVE-2022-39377.patch"
-
+           file://CVE-2022-39377.patch \
+           file://CVE-2023-33204.patch \
+           "
 SRC_URI[sha256sum] =3D "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7=
e85dc04b7eee5b"
--
2.25.1


