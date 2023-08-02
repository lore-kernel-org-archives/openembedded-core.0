Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE5FC001DE
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 05:44:06 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.8276.1690955037142494313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 22:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=FOb3uo3b;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=ClAA6jxZ;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2488; q=dns/txt; s=iport;
  t=1690955037; x=1692164637;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=BUarYdLm8bxTmXN7drQvaSRIdEdvHKAibKaZDfjAwlo=;
  b=FOb3uo3bc8SJR9/L0REACmDpsfwOOyNu3B6Lcc1gsxvWkt97lg8Fvnvw
   J0yp518t8onFi1zXmjoHVKef8DtIXo6XZbRyU1UFTwDZeOdKScnTtLgev
   eyNBUoiydkkqN4geS3shiXTfL5WyM6uD123NmdP3l24kpcVWKWu0kxsHM
   Y=;
X-IPAS-Result: =?us-ascii?q?A0CkAgCb7MlkmIwNJK1agQklgSqBYVJzWyoSR4gdA4Uti?=
 =?us-ascii?q?F+BFpxkgSUDVg8BAQENAQFEBAEBhQYChkcCJTQJDgECAgIBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaAEMhgcWLgEBNwERAYEAJ?=
 =?us-ascii?q?wQODRqCXIJdAwGhTAGBQAKKJniBNIEBggkBAQYEBbJsCYFChFWDKwGFQIQ3J?=
 =?us-ascii?q?xtAgU2BFUOCMINYAoFCIIQSgi6KAoVNB4JniWgrgQgIX4FvPQINVQsLY4EXg?=
 =?us-ascii?q?kgCAhE6FFAIaxsDBwOBBRAvBwQyJAYJGC8lBlEHLSQJExVABINOCoEGPxUOE?=
 =?us-ascii?q?YJPIgI9OBtLgmoJFQw1UHoQLgQUGIEUdR8aHj0REhkNBQh/HQIRJj8DBQMEO?=
 =?us-ascii?q?gwXHQNEHUADC3A9NRQbBQSBQAWdboM6CQpMgV16kjSQV4IYnFKCOAong2ShN?=
 =?us-ascii?q?xepWpgoIKd3AgQCBAUCDgEBBoFjOoFbcBWDIlIZD445g1uPeXY7AgcLAQEDC?=
 =?us-ascii?q?YpqXgEB?=
IronPort-PHdr: A9a23:umij3BIAePR28og3M9mcuakyDhhOgF28FhQe5pxijKpBbeH/uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1o2t2qjPx1tEd3lL0bXvmX06DcTHhvlMg8gJf72E5bbk8mf3OGp8JqVaAJN13KxZLpoJ
 0CupB7K/okO1JJ/I7w4zAfIpHYAd+VNkGVvI1/S1xqp7car95kl+CNV088=
IronPort-Data: A9a23:lKLLE61z4rtBe0XGUfbD5cNxkn2cJEfYwER7XKvMYLTBsI5bpzMEy
 DRMW2+EOv2PMWP2fNAkaY2390JSupKBxtBlHFE+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZxyFjmGzvuUGuCJQUNUjclkfZKiTradUsxNbVU8Enx52Uo6w7RRbrNA2LBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2yxH5OKkiyZSZdBMUdGX78tmSH
 I4vxJnhlo/QEoxE5tmNyt4XeWVSKlLe0JTnZnd+A8CfbhZ+SiMa84AHa9s+chhrohbSs+189
 95q7qaMRlJ8VkHMsLx1vxhwGiV6O+hN/6XKZCf5us2IxEqAeHzpqxlsJBhpZstDpKAuWicXq
 aRwxDMlNnhvg8q12rGyUuBwi+woLdLgO8UUvXQIITTxVK18EMiYHf+UjTNe9A8OrYMQXsb+X
 tMIMhxhRR75fEZfYH5CXfrSm8/x1iWgLFW0smm9orI65WXWxgF93LXhddHSYNGiQcROgl3eo
 XrL+Wn8CBwWONGTjz2f/RqRavTnlCf/XscZE6e1s6Esi1yIzWtVAxoTPbemnRWnom+YZ41+C
 VdLxgMN9oQP+XOgaYLHYxLt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4othpNYJOWCgeGGJC6
 7OZoz/6LWc06OzPGRpx4p/R/G3sZXVJRYMXTXJcJTbp9eUPt23aYvjnZ9JnHajdYjbdRmyom
 2riQMTTe9wuYSMj3qG/+xXMhCih48ePRQ8u7QKRVWWghu+YWGJHT9H3gbQ4xa8fRGp8crVnl
 CNV8yR5xLxWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggdR84a5paImC3M
 BO7VeZtCHl7YiPCgUhfPdrZNijW5fOI+SnND6qNNYMePvCdiifXpHoGibGsM5DFyRhwzv5X1
 Wazese3BnFSErV80DezXI8gPUwDmEgDKZfobcmjlXyPiOPGDFbMEOttGAXVNIgRsvjbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TWcyr+50JJ77bSuekcUl4Y8LsLXoaU9UNt4xel/zD+
 Te2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:cBgMu6qg22CaPqhqYpoDCMIaV5uYL9V00zEX/kB9WHVpm5Oj9v
 xGzc506farslkssSkb6K290cm7K0819fZOkO4s1MSZLXXbUQyTXcxfBOrZsnfd8kjFltK1up
 0QCJSWZOeAaGSS7vyKrDVQcexQuuVvmZrA7YyzvhQdLz2CAJsQiTuRfzzranGeMzM2fKbReq
 DsgvavoQDMRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1kjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3TRY0eTFcRcso+5zXIISdKUmRMXeR
 730lMd1vFImjDsl6eO0FzQMkfboXATAjTZuCClaDPY0LLErXQBeoV8bUYzSGqA16Lm1+sMiZ
 6i0w+ixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MUiFW5uYeA99RjBmfYaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgAl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjrwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw+zvkMehTJYd3A8LAt23EigMyNeFPCC1zxdGwT
X-Talos-CUID: 9a23:IdV89mFGqgVrlDJFqmJG0nJLO+I+LUH07yz8HkKHAkEycoGaHAo=
X-Talos-MUID: 9a23:okYs+wZ/hTBZmOBTjwHHx28hBOdR+rX1Lk4km6wZ4NneHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 05:43:56 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 3725hu1B007219
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 05:43:56 GMT
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=krkapate@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.01,248,1684800000"; 
   d="scan'208";a="4968980"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 05:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWYRD0b8wnf46dYg9xK3WZ08VhScXR5opNwjiUoxcZyKrEuBxt/kRimtrc5t/lI3mBrcW346IxmF1+kpajQoAepJUPAkBPXMhBfMsXuFFzWjCeSlvFlfhZs3dtSsEdqFdjq9Bz4TkQ8K/r2A2HWO/ymZ3kNs7pLLjbdLnkHwolUbdfsSWHJgOWL2TmdiOetEgSll0/dmIsS+0pLY4KxFgLsmnDh3BmYDPm3HulZJRJV3qW4posDXq7Sps5XuUDQAPeb6t2Hzc1gUpyO1ZoKyLZ7wjmve33inTxL6YjjwZEHKhl00fijjdmI8Ck6KADLvU5ozoR5ybr59fSah5/nJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRIEBuf9QfQz/IMHcGnAb4eexwcKdbJAFpMQuh0MYzE=;
 b=ULfn1Se2UsjMHqf9s/qBvJrbUHIkgtr5dR1uuFe7lDL4ST5MsW0iU3vkTUQuSkMKMGktdM+s5US7kVTgrjJ8Qm1f4oeOJozIxAa4d23SutjCGAGx2PILWKu4E1XvuYgve1ZoALXgTN7Y8ahznbx6o+RrStcVHRneetTJ5CcNqorP9OJo74oTC4+POIUwYKLGwojJrJiRR2nEbaSGUO/Ms6Bl0Gg3vARIm+KB5bYBc+EUEiyHqupH6M/Damr09QT6yAreg2cLyb5wnsLWmKep6HnkvcWJZvZNGvADXzlTaZxVJfcGIZ9C57oE90vSmm9NxAo/aY9UMB3K9WqdH8D8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRIEBuf9QfQz/IMHcGnAb4eexwcKdbJAFpMQuh0MYzE=;
 b=ClAA6jxZN35h11dPPGaOFpf/saG2FVjZLiCuLhZh2Lgmol5kZ1c1n7KHxoHRwb5YPpfLEkV9qE/+MiL5fXQNdogwFmyUdBNKYWO16LRJBCSnh48mzlRKZ6Yd2m7sBodT9rq1eQBkuMu24L4NF79N0zqS4Z/AkXCgg6KPEcMnrhw=
Received: from BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 05:43:54 +0000
Received: from BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::e293:5aa5:9de5:2b88]) by BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::e293:5aa5:9de5:2b88%4]) with mapi id 15.20.6652.019; Wed, 2 Aug 2023
 05:43:53 +0000
From: "Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC at Cisco)"
	<krkapate@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Python3-bcrypt fails for Power Pc
Thread-Topic: Python3-bcrypt fails for Power Pc
Thread-Index: AQHZxP8+9amtTvQKD0qclIctM6VPnA==
Date: Wed, 2 Aug 2023 05:43:53 +0000
Message-ID: 
 <BL1PR11MB53994CAE41FD6DD380B2A385D30BA@BL1PR11MB5399.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5399:EE_|SA1PR11MB6783:EE_
x-ms-office365-filtering-correlation-id: b218202a-06e6-4688-ebcc-08db931b74cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FdJz2P12H+YyfQ/hBL/teIsHyNbYaMMLTEsRTSR2xwUXhP+NaFw0cz2WVY2blNzJqTZi2zMMD8/AWSxZS5rgyYiLaSuls1c4Kgu0vdOFUw9f1kfESNrLTnWFyHZGxRg3B5szhSfpps4Q0+M22AIzEjWmA/e9YQNSszir+VIDVtVkyTpgAEfxkLpFfnsREXUKsjNPv0Q5dn92xxn3pT6Q1oYJTwcsZpEybneb23zlDo/MTipXN0KPq/LABPQAqbPpab/VWPsS/ix5OL9qbhRnKSoK4RNQOkpdZlNT2ZO7EE3IJeoepU3bHFwZ22qY/yHDVidp7YVw7KdkvGuyn8lIpdUfuToLgCojXKjS17k19YiDxeY+Jse6tC0cpwAh3oa/ltXOebgGnf5tv8q9R1WUDB98GitpGP4MUpSD7vBdDbBp7RWzlnFBeJnZFZIe6fgeybTx4kD3qM37FNmY6EyztoVh38EUhe54qT1TPGZEOXYUGNJFvWW08+UkC4J0cU1Tj/2m23jMn846ESw9xRXK2SCEghVzk1G+gQNEQQ+vbiyldv2dyP30udbLEcD5EjRyvlnaheGIyMjsugYST3tvq9s3tagq/bXmZCj1osG8VCV02UCb/wt+oiLI8Ja0nIBl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(55016003)(186003)(9686003)(316002)(86362001)(122000001)(478600001)(38100700002)(66946007)(76116006)(66446008)(66556008)(66476007)(33656002)(71200400001)(64756008)(7696005)(4326008)(6916009)(91956017)(55236004)(26005)(6506007)(41300700001)(8936002)(8676002)(38070700005)(83380400001)(52536014)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VmoIBfg3fNaXI27aJdjRt2gZ4pRxKf+Nm5ZNfXKqOwf2PzyN4oTll9BGyV?=
 =?iso-8859-1?Q?NpBNi+Ivc7B2lvTXEnW3pjk3ybgYlFKTgYaYHkMGhKJcGiGyp6y+zDRx+m?=
 =?iso-8859-1?Q?Ps7eROzP/66EV3uTeKuxTLvhA7GQOeK1S09P4ItvY9pEDyQQcqpfSF8eti?=
 =?iso-8859-1?Q?CgQCbQ5UmqKHmmdCZn716vfF075z66BV7gyesN0Zc8N4D88oBZM8rkabjJ?=
 =?iso-8859-1?Q?7tmqKK5Z2rox+HBWgNdvRXQMW8krXcLyAQAc30DgjFpfxkUbHqqJxxtV5G?=
 =?iso-8859-1?Q?A7hFc4CRCs41lNzMNvdCyjOdxyaReAKbFIKvfZ0OwHrRKvAAazHwgu0qqX?=
 =?iso-8859-1?Q?qjmTwYhxPpJkQ5UgHUhBI13NgCH6c3rsUC9uSzh4NaQ5NpZbiQyYwmnvMR?=
 =?iso-8859-1?Q?wAgJyg2XdCf+xnSn3ZGXNgDNYtM8M91d7wE4m2XHLwtme2zPheY8fG6ErE?=
 =?iso-8859-1?Q?bjhXS8OrVTEjnC5lowYzS/JyP04RynSVD6m5SNmZa6yl8E4UisJHZfYlbX?=
 =?iso-8859-1?Q?IY69bpE0QMIJY0NQDl9r/sGtH71JU1UkmRv360y4dud1mLxeFAkOlfQrJe?=
 =?iso-8859-1?Q?ohBn2jxPxa3njtr2n2arqIUPhTuWcC4IdEtR9bc6jTzneiYzPEUckA5uo2?=
 =?iso-8859-1?Q?kKKx9uVpo4EB842lVFK9ae1EWEfYN4XE4FAHGHszjk+QuEpYYV3oLRHAYM?=
 =?iso-8859-1?Q?XQ/3QA2cuUnYHOhA7ffrE0Mqp3jxBeedALUhsOMtWt6cE0cMekZY6JifJf?=
 =?iso-8859-1?Q?QrRfmG+Z1Gd9kxbnPmINiMAPy9PL0PxYkj+ZDGwiyfleRoEvkZR6jZbvP/?=
 =?iso-8859-1?Q?1CttBAA4gbrCHooi0kSsQ940Xf4yforT5aNAIvbhmjoNjfDaQtKCrEn5fk?=
 =?iso-8859-1?Q?CaZJypDa8A7OU34AztLS2K+z60CCyoyz+MZ52uaOl0TcIEhlcCbc5xK//6?=
 =?iso-8859-1?Q?geDWzOqGAusKw95kpjAZY+/Sizgs/Rgq7PqjotjfGdnlPRUhZBmCP+zden?=
 =?iso-8859-1?Q?mJuWflu75gGrnnxKsdK1+Y+tNxLmYbOGjTXonRx0Cah7IWX+nFcPSI/TWz?=
 =?iso-8859-1?Q?nVfg8KKdehnQInaInLiUsauM+WgeccaETR1VF4eCWdHYO++VNfKB+uI+vZ?=
 =?iso-8859-1?Q?NG1P/EPfW4n2S8fkBZuBTNRm/1qFTHxeUtr+0qPQ9bW9UPZUAZxNTY2yDI?=
 =?iso-8859-1?Q?4ShpZLMSV+K4Ui13tqDHIdNEgyq07U70zPBsn5LtGj6misY4DgnaA/meeI?=
 =?iso-8859-1?Q?IPTyjzyMOIplK6aijtqVreeodm3G2Nm0PJns1x13faucYA1tDe/VRY3TbU?=
 =?iso-8859-1?Q?J3lexuATfYblX08XM+28HVPuE8PiLsAKhOPR0ayxUnkPs/0jIM1GSZu/8d?=
 =?iso-8859-1?Q?o6C3LUiZaN/PDLfiUOuviNaWxDLQ5jgUCSwJPBWdgshWdOF1pROynLkbY1?=
 =?iso-8859-1?Q?A+MC5tmZgmgjwJj1p341CAoB875jhADGENiH3sZa8ZGLcl7sp6P1s9WUHx?=
 =?iso-8859-1?Q?87AaDGUNKIxxl+mJtprNTeqtnAPmhLgcdnbyTmvk887WKqWCcIejyRdZ7K?=
 =?iso-8859-1?Q?QZWRfbuBBSx5k+fOm6eySxTBxwH0KEjhepfQMHTuD3WADhI56WTClWojSx?=
 =?iso-8859-1?Q?3eCtY43FGjDMM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b218202a-06e6-4688-ebcc-08db931b74cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 05:43:53.5883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hve7XtVe/Y1Rhx93sqtkxOVzCEIQnCAvMHq8KCMinBbd5liOhyDYpr6LvtFfz3vRl0QaPm3I3r9PhZ+52V4PPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 05:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185376

Hi Richard,=0A=
=0A=
The python3-bcrypt fails for PowerPC with the below error:=0A=
=0A=
ERROR: python3-bcrypt-4.0.1-r0 do_compile_ptest_cargo: Unable to compile te=
st with cargo, '/nobackup/krkapate/poky/poky/build/tmp/work/ppc7400-poky-li=
nux/python3-bcrypt/4.0.1-r0/recipe-sysroot-native/usr/bin/cargo build --tes=
ts --message-format json -v --offline --target powerpc-poky-linux-gnu --rel=
ease --manifest-path=3D/nobackup/krkapate/poky/poky/build/tmp/work/ppc7400-=
poky-linux/python3-bcrypt/4.0.1-r0/bcrypt-4.0.1/src/_bcrypt/Cargo.toml' fai=
led=0A=
ERROR: Logfile of failure stored in: /nobackup/krkapate/poky/poky/build/tmp=
/work/ppc7400-poky-linux/python3-bcrypt/4.0.1-r0/temp/log.do_compile_ptest_=
cargo.2752082=0A=
ERROR: Task (/nobackup/krkapate/poky/poky/meta/recipes-devtools/python/pyth=
on3-bcrypt_4.0.1.bb:do_compile_ptest_cargo) failed with exit code '1'=0A=
NOTE: Tasks Summary: Attempted 2173 tasks of which 4 didn't need to be reru=
n and 1 failed.=0A=
=0A=
Further, in the log.do_compile_ptest_cargo log file, below are the error me=
ssages:=0A=
=0A=
undefined reference to `PyBytes_AsString'\n          /nobackup/krkapate/pok=
y/poky/build/tmp/work/ppc7400-poky-linux/python3-bcrypt/4.0.1-r0/recipe-sys=
root-native/usr/bin/powerpc-poky-linux/../../libexec/powerpc-poky-linux/gcc=
/powerpc-poky-linux/13.2.0/ld.bfd: bcrypt_rust.1fd22faf-cgu.6:(.text._ZN3st=
d9panicking3try17h86d4eb792b27c0beE+0x180): undefined reference to `PyBytes=
_Size'\n          /nobackup/krkapate/poky/poky/build/tmp/work/ppc7400-poky-=
linux/python3-bcrypt/4.0.1-r0/recipe-sysroot-native/usr/bin/powerpc-poky-li=
nux/../../libexec/powerpc-poky-linux/gcc/powerpc-poky-linux/13.2.0/ld.bfd: =
bcrypt_rust.1fd22faf-cgu.6:(.text._ZN3std9panicking3try17h86d4eb792b27c0beE=
+0x258): undefined reference to `PyBytes_AsString'\n          /nobackup/krk=
apate/poky/poky/build/tmp/work/ppc7400-poky-linux/python3-bcrypt/4.0.1-r0/r=
ecipe-sysroot-native/usr/bin/powerpc-poky-linux/../../libexec/=0A=
=0A=
=0A=
As a workaround I can remove the below lines from the "bcrypt-4.0.1/src/_bc=
rypt/Cargo.toml" file, after that, I was able to build it successfully.=0A=
=0A=
- [features]=0A=
- extension-module =3D ["pyo3/extension-module"]=0A=
- default =3D ["extension-module"]=0A=
=0A=
Can anyone explain what is the proper way to fix this issue? =0A=
=0A=
Appreciating any responses/insights (for this issue).=0A=
=0A=
Thanks & Regards,=0A=
Krupal =

