Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6207EC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 10:47:36 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web11.10119.1686653247682149218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 03:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=lNK9VucC;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=916; q=dns/txt; s=iport;
  t=1686653247; x=1687862847;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AM3WK9wIdGEgSzhofT2frsxOW+hQ6gPcR9o0d7ee884=;
  b=lNK9VucCti4JK4PFveYnGCXqrUXfdSItTaaPQhFo6U6GfRNPkNkWtpoq
   /KtAXH+ulLthk/Om+7Mswhw3a8ln8TbtJYOJ7IkMJl29RiQNLr3FWqfB1
   CRKz2g7XUXIY2wZbiDzBkouKB9tAVc0SaBO828b1TsYjrAzCZccw/s9ED
   o=;
X-IPAS-Result: =?us-ascii?q?A0ADAAAfSIhkmJldJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBXFJzAlkqEkeIHQOETl+IVZ1ugSUDVg8BA?=
 =?us-ascii?q?QENAQEuBw8EAQGFBgKFdAIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBA?=
 =?us-ascii?q?gEHBBQBAQEBAQEBAR4ZBQ4QJ4VoDYYEAQEBAQMBESgGAQE3AQsEAgEIEQQBA?=
 =?us-ascii?q?QEeECgKHQgCBA4FCBqCXAGCXAMBoHgBgT8CiiR4gTSBAYIIAQEGBAWfJgmBQ?=
 =?us-ascii?q?gGNF4RIJxtAgU2BFUOCaD6BBYFdAgIBgV+EEoIujiWQCoEob4EegSJ/AgkCE?=
 =?us-ascii?q?WeBCAhegXFAAg1TCwtjgRyCVQICETwPBVJ7HQMHBAKBBRAvBwQyHgkGCRgvJ?=
 =?us-ascii?q?wZRBy0kCRMVQgSDWAqBDT8VDhGCWyQCBzZDG1oQNwNEHUADC3A9NRQfBQQjA?=
 =?us-ascii?q?UmBVzBAgRICIiSfDUOCf1OBToEaxE0KJ4Nhi3yNGoggF4VXo38LmAyoDgIEA?=
 =?us-ascii?q?gQFAg4BAQaBYzqBW3AVgyIJSRkPjiAZg1uFFIpldQI5AgcLAQEDCYtIAQE?=
IronPort-PHdr: A9a23:dFT1Gh1jXpKBMS1hsmDPZ1BlVkEcU/3cJAUZ7N8gk71RN/3l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUQwt5Gm1ZHBcA922fFjOuju35D8WFA/4MF9uLeT0BpTVg+y81vu5/NvYZAAbzDa4aKl5e
 Q2/th6Z9tFDmJZrMK831hrPrzNEev8Dw2RuKBPbk0P359y7+9ho9CE4hg==
IronPort-Data: A9a23:gCep461Ya7CGoFbhnPbD5ddxkn2cJEfYwER7XKvMYLTBsI5bpzBRm
 mQaXj2OPPeIMGqhLot1bNvj9U8O6JPQnIVmSwE43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZxyFjmGzvuUGuCJQUNUjclkfZKiTracUsxNbVU8Enx510s4w7dRbrNA2LBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2yxH5OKkiyZSZdBMUdGX78tmSH
 I4vxJnhlo/QEoxE5tmNyt4XeWVSKlLe0JTnZnd+A8CfbhZ+SiMaiqIZDtgXbl1srRK7w45I1
 et2icW/VlJ8VkHMsLx1vxhwCSpyO+hN/6XKZCL5us2IxEqAeHzpqxlsJBhpZstDpaAmWicXq
 KdwxDMlNnhvg8qty7K6VvNriuwoLdLgO8UUvXQIITTxUq95HcGcGvWiCdlw/DYopf0fM63iX
 OEeZyJgcEvYUi12AwJCYH45tL742iagG9FCk3qSvacx7m3ZwQB93bSoO93Pd/SORN5JhQCfv
 m/A8mHzDx0WOdDZziCKmk9AncfVli/9HYkVDrD9rLhhgUaYwSoYDxh+uUaHTeeR0kqcYfBUL
 FYv3A0c8fYL6XKQcoDyQEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblToqBYcNrTKU+drGFQXO
 k+1c8DBXmMw7eXEIZ6J3vLF8mPoYHl9wXoqPHdcFWM4D8/fTJbfZy8jo/55G6Kzy9byAzy1m
 XaBrTM1gPMYistjO0SHEbLv3mzESnvhF15dCuDrsoSNslsRiGmNPNzA1LQjxawcRLt1t3HY1
 JT+p+CQ7foVEbaGnzGXTeMGEdmBvqjVbmCN3QA0Q8l4p1xBHkJPm6gOuFmSw280Y645lcPBO
 yc/RCsIvsYIZSv2BUOJS9vrUJ1CIVfc+STND6CIMYUmjmlZfw6c9yYmfl+Lw23oiyARfVIXZ
 /+mnTKXJS9CU8xPlWPuL89EiOND7n5lnwv7G8ukpylLJJLDPhZ5v59fbgvXBg34hYvZyDjoH
 yF3bpTTkUkBDbenP0E6M+c7dDg3EJTyPrivw+R/fe+YKQ0gE2YkY8I9C5t7E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:27ZW3KlDX13tAh/wUf+msxMnhMbpDfODimdD5ihNYBxZY6Wkfp
 +V/cjzhCWbtN9OYh4dcIi7Sde9qBPnn6Kc4eEqTNCftXrdyRqVxeZZnMTfKlzbamHDH4tmtZ
 uIHJIOc+EZgzJB/LzHCWWDYrMdKZy8gd+VbITlvjlQpGNRGtxdBm5CY27xfjwUNWt77NgCZe
 ahD6F81lydkAEsH7yG7w4+LpH+TrPw5fbbiBg9aiIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijm+vT8G6d60bjq7Bt3PfxwNpKA8KBzuIPLC/3twqubIN9H5WfoTEOpv214lpCqq
 iOn/5gBbUw15riRBDwnfLf4Xim7N/o0Q6l9basuwqnnSU+fkNiNyMOv/MATvKT0TtRgDg16t
 M544vejesXMfsF9x6NveQhkHpR5xGJiGtnnugJg3NFV4wCLLdXsIwE5UtQVIwNBSTg9ekcYa
 JT5eznlb9rmGmhHjjkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 n5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzvdEPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4RjjpwtE23ekOhlQ9fsudDcSuciFbryL7mYRsPiTyYY
 fHBK5r
X-Talos-CUID: =?us-ascii?q?9a23=3AiCHtyWm3ACbPfu2nmamCR9DkDqzXOSXZ7k3yKEi?=
 =?us-ascii?q?iMkBOeuHLcEKuw589nNU7zg=3D=3D?=
X-Talos-MUID: 9a23:0y0LwAiHJKJtRpU3/Vpso8MpFMZwwJn/Jhsxqr4BtdGLKXNoCgektWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 13 Jun 2023 10:47:26 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 35DAlQEC030061
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 10:47:26 GMT
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,239,1681171200"; 
   d="scan'208";a="2903152"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKui9hjcUqQb7EzFYEbSBkgAza0JySVmWbjbOtm9vX7mYVDy+g5YE237r9kIqSd6Psa6aN+vtVNkfEHe6CjwZ0vo5CMRF1TXzRSz3LpqHh5C+Gjv7csgqXkdpZqKRwbwBUmRPhKIk0cDrth/cykUyGsDf15PqE6JBQwf/T4vjVNcy/MItkTIiDlu57Dve3gvv1qcv+BOrkNdYMO6c+wodX04jXoUjQoUJi1Ql0VGjDATm74kle7AKZ8JGjWbhWZyFtVe/+j5ZjgHDUGgixsc+40YVCLhrtf/G+jvUT4ClNjunnaRXNQYB96smzbvKdMbZaX+H8IxYDZSL0kCix7sYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM3WK9wIdGEgSzhofT2frsxOW+hQ6gPcR9o0d7ee884=;
 b=HQTgv1rSNAjQrun8rsTpn/13YQSPWkumMEVY0c5R8SC0cqwWPO0eGJwLwHFbCMsMQzZx7gIlyaQTjFzAfSRCe1DcX7e4NzP9+4X1jVwFYMfXSo6oXi3Kziazn9s3aFTUErbnV8tMuM5XTABtmYSAJe9imC+VOhJTYM7l92za8CHEaSiOZQ6RsHKhyaeEbL6m/osq57AKtlY4klaoQyN0nNZnZB3lIoFcCqdr7sSEzj+tDpYsrVncZUKu1Q82lqfhhPbaaZLw+velLWzoPk2BbM0yWzXSf+j6MxZsWNQBRzlTSTkk22ZRjD6kt7RVVBlJn/cE9YemaGuWXdEEFjHgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM3WK9wIdGEgSzhofT2frsxOW+hQ6gPcR9o0d7ee884=;
 b=Mz3wu3Ls9f9RfbJyplbPRPcyRnzZ4JIPs646VIeYEIYYJF0qIC6zxW8atVWOGLjd/y66kgS/Uix3vOArTWkrNy0QRPRrZ+CquJJuVlJkWISXaO9xFQO+ASf9XzP11YUspiyacOccOGtD1jKBVNma5Q+7PAPYH+gZqkr3UD76mwo=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by SA1PR11MB5828.namprd11.prod.outlook.com (2603:10b6:806:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.41; Tue, 13 Jun
 2023 10:47:24 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 10:47:24 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] cups: Fix CVE-2023-32324
Thread-Topic: [OE-core][PATCH] cups: Fix CVE-2023-32324
Thread-Index: AQHZm5dZMVDF8wmYLECtoO6CFWhuda+IjugAgAABiiA=
Date: Tue, 13 Jun 2023 10:47:17 +0000
Deferred-Delivery: Tue, 13 Jun 2023 10:46:44 +0000
Message-ID: 
 <SJ0PR11MB6717FDADB0BCA8688BB9B375DC55A@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230610123008.4179883-1-schitrod@cisco.com>
 <686C4180-10F1-4BE0-AD52-CBEAAFB1BE78@arm.com>
In-Reply-To: <686C4180-10F1-4BE0-AD52-CBEAAFB1BE78@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|SA1PR11MB5828:EE_
x-ms-office365-filtering-correlation-id: 1eac0691-dd57-4f07-df1c-08db6bfb9281
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sieozKryPs+OZsHfxzLoJfhK2SrG4b72HwZptoXI0n312h1xh0QNJJsAf7XEMidCLmDXavfviw8YUsphmeRXQkzlLnNz4CTRCDe1yURype/MXS69qVT8cd6YzMyMDIU/S0praEK7fJUhg2bBEd1sqSOXoWG7noETgxABhzJMrV1eNsyfo4wvBCUpjJJX/Jxbnj5mTCbg1sHHsncqKvnZFzd96+prYaglL5TrlYFjdWMaFna/DLObq6b95VUhFrCbZljumiDhe9FLacMLjEMP7cZBzq1HN8xpMjt56dUV2QTeLlL5urWVtsGVgQ+8Ge3Un4EB1dyy+sS7x/cZoGkBC01nheki4lZ2okRKUBoawCn+qL52lQtE++F5A4kjuTZzW5YqSw1LrbW3uY2b768lM9ZR9VzlOP1WGZxYx7pihj/ha2zxxj+AyPTTW0V3DvDAX3zcqvOEQgKx/GMZ0RXswMFkjCuBS0B2gZFxil83LVNNSrOXK5qMSTq1U/b9i/Omu1mwjnmk3bYjetrkxKUJjDqB68DjaupxraDo/och0FzcC4L0gbzN+zJoup39Uom7T0f3DM47bDVCiKDnmKnDtp5CYqKXaJMcPcbyi24LQIupd9v1srK/tSBe2S7nHbeN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(33656002)(4744005)(2906002)(38070700005)(86362001)(5660300002)(52536014)(66446008)(8676002)(66946007)(55016003)(83380400001)(71200400001)(6666004)(6506007)(26005)(186003)(7696005)(55236004)(9686003)(53546011)(478600001)(122000001)(6916009)(66476007)(76116006)(4326008)(38100700002)(316002)(41300700001)(64756008)(66556008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tBsLV79G3TJON00ShJ5kRTW0pR4H62dr5PwTzWcb27xssVZbWGACOeE7jzn2?=
 =?us-ascii?Q?oO20WybfTnd+cRLiI/PNW1RmhvZp9i7IDZ57m6khPqTQJhLvFFAiPTt6sh41?=
 =?us-ascii?Q?rta6farI4WxstulmlciEAHcX3xVVQRfduQzAvjGpbkXz+69CVtOpdm9bKM/u?=
 =?us-ascii?Q?zeD/7RWeIRp/F/tpJqHgbbUOcf4U5x4UujhjiLhXW7Y0bIQO/k9p3g9vHuMX?=
 =?us-ascii?Q?sNQsOqVZkBwYMZCwFv8AvIinXPy/2M8fXBKu/Byu975qYWCDeZ8/Cx+anFNG?=
 =?us-ascii?Q?hMHENcakOvm0x+y9/m7AQaS2uECI30PG1CLnjz1PhG38u7b5YVr89SXLzAP6?=
 =?us-ascii?Q?cT0Pcv/R5zQ331o2vj0om1uTHQIuHbDRSYOUgsRSSFd34+NF/gf3ra3ttP2r?=
 =?us-ascii?Q?30OrROr2wuMVpaArFa16vyZGI+WFpOYfBANSUIHfhePp2SCiIf3rimybNUYa?=
 =?us-ascii?Q?PjjablTYAvuVXzZOFGu0ovHWwT1MvecPWX8b4dMQ9DWEyDPrvz8NbwBfajXe?=
 =?us-ascii?Q?iQEmkh5jsnCfMFd5RAofwWcArpQfSx6E0QtPS7oDLnptp1l/vEDhA3YlvEbX?=
 =?us-ascii?Q?N744FOwTh9rsejwby/RXhj9YC1CdqHUoQExQxau6MPfCxT6960UR4R1izoik?=
 =?us-ascii?Q?UA1RnFuEdYI3SK4RiifMuavl2HozAjbuN6jNlVTlO5N1rh4TYcHHgPXvawQc?=
 =?us-ascii?Q?U9fVm1LlSncb/DvsPQZ+krnC6PKeIeU62WzEUP2ybb1IZPCbdxXt5vaY/CUT?=
 =?us-ascii?Q?3qf5/pPIIKmTAGgZmRfoklVx8mCOJlzn1MtUUt1WNLwavR+jlBjBS6d6Ubrg?=
 =?us-ascii?Q?stoXAO0gREL/ERzr+WWp750fPfso15v3ujgDUkEL8Lycn6rlhRvcA+zdTJ3X?=
 =?us-ascii?Q?EHhAdsHLOCOrGDg5z4Ct6JeyqukanbwiSqoteeGECvEz8A9hp1ZUdpEY3YHl?=
 =?us-ascii?Q?nIkbSTIyFzTzId7YRPViWfbey94nWdlGI218GS66d/OaVhBZIoqzNMVD2uN3?=
 =?us-ascii?Q?OMYL/iLlMWa7g6oVoVEOXDllG6zVJWLs3Xn6VWIFiWJ8QhwChS8m0wX/PWs+?=
 =?us-ascii?Q?1KEh6iS3tB7wt9gRoSWHZQqRttUWiF5xGU10TF2ucxPDitVJrZDhyYDpmgj6?=
 =?us-ascii?Q?hoD/pqCavtjAyou1K78pmmzSy282L5utHOordaJBEiznP23K1BiIRgfnvqDb?=
 =?us-ascii?Q?HshD2rdY+HshTQRhXJtBiNp8+jf7TyDzS5gv8lvbJ209uDb8f81cf/QwTctF?=
 =?us-ascii?Q?edCgW6c1rORBfH1ysUrQ+wXMHGQ/lGHf9Xq36BJ0PCk5LJadNsIZ2OxUM0Gd?=
 =?us-ascii?Q?q96MA6eoIBMZlxIBdtdcQz7SA7wTgaEy0jGWG1eVD2J/VI9zWWCoq0FFqW+V?=
 =?us-ascii?Q?KTP7M5Yo4NaQIFisP6j38br42+B44Xbh+db+cjvZFUiMG+BAOhliJR0APriu?=
 =?us-ascii?Q?ma4tugNNY5ZlN4RtHskS3yLCVVHRl+gXpV2VBUpKlhd4aAJac8Q/1CLi6Ja8?=
 =?us-ascii?Q?CUTJZpOolaaH2N1p/nnnWsiZF3Hr/MxSIczSFp0L0dXFd9b4FslSbDPoYmub?=
 =?us-ascii?Q?rSptiEMaOj5/RfaGJ2e15WFvvyehpOs1X0iV56LT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eac0691-dd57-4f07-df1c-08db6bfb9281
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:47:24.1709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWcQgBUzkuo+wmOTZOcB3OVk5MIEhgGs01Xr2s7nKH1ADGNpIT2DxmMph1BOm+ApCLV024vVyM1WR5Y1I5d2XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5828
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 10:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182709

Yes, correct Ross.

Below information are specific to CVE-2022-46456.
I will create and send patch v2.

Thanks,
Sanjay

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Ross Burton
Sent: Tuesday, June 13, 2023 4:07 PM
To: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] cups: Fix CVE-2023-32324

On 10 Jun 2023, at 13:30, Sanjaykumar kantibhai Chitroda -X (schitrod - E-I=
NFO CHIPS INC at Cisco) via lists.openembedded.org <schitrod=3Dcisco.com@li=
sts.openembedded.org> wrote:
>=20
> NASM v2.16 was discovered to contain a global buffer overflow in the=20
> component dbgdbg_typevalue at /output/outdbg.c

Copy-paste failure? The patch is for cups but the message says nasm.

Ross

