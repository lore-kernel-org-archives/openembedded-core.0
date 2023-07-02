Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A096EB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 04:22:53 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.597.1688271766621312174
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 21:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=XSRgsEaZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6968; q=dns/txt; s=iport;
  t=1688271766; x=1689481366;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=2duXaqoXss9TDANVoOKDbXQVZGyrv4+mWCYOUaY4bNA=;
  b=XSRgsEaZNmgIGBRf1BSviNhfzZjCfggbJSckJjdkPkvNGMR/bJCu3d1F
   NP4gr+upCu1zY+HQ1Z9QpVVTETSsXtVef8G4tlJJPgzGSSlkshT1mSkG8
   j0yFFWzWfFK41r8vpPumbPg357VQpqv8fnzB3G+tkrmDOEtRH90eqYWph
   s=;
X-IPAS-Result: =?us-ascii?q?A0AbAACw+qBkmJldJa1aHAEBAQEBAQcBARIBAQQEAQFlg?=
 =?us-ascii?q?RYHAQELAYEvMVJzAlkqEkcEhE2DTAOETl+IX5ckhk+BJQNWDwEBAQ0BAS4BD?=
 =?us-ascii?q?AkEAQGFBgIWhXMCJTQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUA?=
 =?us-ascii?q?QEBAQEBAQEeGQUQDieFaA2GBAEBAQEDARERChMBATcBDwIBCBEEAQEeDQICA?=
 =?us-ascii?q?iYKHQgCBAENBQgaglwBghVHAwEQog4BgUACiiZ6gTKBAYIJAQEGBAWybAmBQ?=
 =?us-ascii?q?gGEUoMPHl5jAQGDX4RMJxtAgU2BWII3MT6CYgIDgV8VFhGDHTmCLo4mhWIHM?=
 =?us-ascii?q?oJDigyBJ2+BHoEgegIJAhFngQgIXoFwPgINVQsLY4EcUjqBRgICEToUU3gbA?=
 =?us-ascii?q?wcDgQUQLwcEMgkWCQYJGC8lBlEHLSQJExVBBINYCoEMPxUOEYJaKzY8G1CCa?=
 =?us-ascii?q?wkXCD4HTG02A0QdQAMLcD01Bg4bBQRogVcwPoENAiIkoWoqA4RhgVo5lwOKc?=
 =?us-ascii?q?Y43lFoKJ4Nii32NGoggF4QBgVaLFpU9gy6YIiCNP5UahRwCBAIEBQIOAQEGg?=
 =?us-ascii?q?WM6gVtwFYJuAQEyCQo/GQ+OIBmDW4UUimV1AgE4AgcLAQEDCYtIAQE?=
IronPort-PHdr: A9a23:Vya9kx3AAG+iW+mLsmDPZ1BlVkEcU/3cJAUZ7N8gk71RN//l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUQwt5Gm1ZHBcA922fFjOuju35D8WFA/4MF9uLeT0BpTVg+y81vu5/NvYZAAbzDa4aKl5e
 Q2/th6Z9tFDmJZrMK831hrPrzNEev8Dw2RuKBPbk0P359y7+9ho9CE4hg==
IronPort-Data: A9a23:B6wH/a38uJk7DqvE1PbD5ddxkn2cJEfYwER7XKvMYLTBsI5bpzcEz
 mBLWWiPO/+OZjamc90gaYS/phgBvcXQzdIwGgFl3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZxyFjmGzvuUGuCJQUNUjclkfZKiTradUsxNbVU8Enx51ko6w7VRbrNA2LBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2yxH5OKkiyZSZdBMUdGX78tmSH
 I4vxJnhlo/QEoxE5tmNyt4XeWVSKlLe0JTnZnd+A8CfbhZ+SiMa+/seFL09V3hslmvVsN9y8
 MR87aCUYFJ8VkHMsLx1vxhwCSpyO+hN/6XKZCL5us2IxEqAeHzpqxlsJBhpZstDpaAmWicXq
 KdwxDMlNnhvg8qty7K6VvNriuwoLdLgO8UUvXQIITTxXa9+G8uTHfWiCdlw0jcLj88TLN/if
 tMINjVudDbkbiBmNQJCYH45tL742iagG9FCk3qSvacx7m3ZwQB93bSoO93Pd/SORN5JhQCfv
 m/A8mHzDx0WOdDZziCKmk9AncfVli/9HYkVDrD9rLhhgUaYwSoYDxh+uUaHTeeRoxObe5V+F
 XMv53RygqcxzF2aFuXZdkjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblToqBYcNLTKU+drG1QXO
 k+1c8DBXmMw7eXEIZ6J3vLF8mPoYHl9wXoqPHdcFWM4D8/fTJbfZy8jo/55G6Kzy9byAzy1m
 XaBrTM1gPMYistjO0SHEbLv3mPESnvhF15dCuDrsoSNtVMRiGmNO9TA1LQjxawcRLt1t3HY1
 JT+p+CQ7foVEbaGnzGXTeMGEdmBvqjVYGeH3wQzR8V9qFxBHkJPm6gNsVmSw283aq45lcPBO
 yc/RCsIvsYIZSv2BUOJS9voVZlCIVfc+STND6CIMYUmjmlZfw6c9yYmfl+Lw23oiyARfVIXZ
 /+mnTKXJS9CU8xPlWPuL89EiO9D7n5lnwv7G8ukpylLJJLDPhZ5v59fbgvXBg34hYvZyDjoH
 yF3bZPVkUoACbekOUE6M+c7dDg3EJTyPrivw+R/fe+YKQ0gE2YkY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:Jo9QSqoYl0syE3BGVy8eePYaV5uCL9V00zEX/kB9WHVpm5Oj9v
 xGzc506farslkssSkb6K690cm7K0819fZOkO4s1MSZLXjbUQqTXc1fBO7ZowEIdBeOjdK0W8
 1bAtJD4bHLfD1HZIPBkXaF+rUbsZa6GcKT9JrjJh5WJGkAB9ACnmVE40SgYzFLrWJ9dPwE/e
 +nl7J6Tk2bCA0qh6qAdx04tu74yuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX252oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF0nAjv0idorD
 D/mWZkAy1B0QKUQohzm2qr5+DU6kdt15Yl8y7fvZKsm72heNtwMbswuWsQSGqr16NnhqAz7E
 qOtFjp7Ka+ynj77XzAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdw99Q/Bmcka+d
 NVfYnhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyJeFOwC1zwdLkHqbrUn8ki
X-Talos-CUID: 9a23:mYnyu23Vnrd7cKXtlHKrRrxfM50AUjr88kjrPhHkJmlqcKykEWO00fYx
X-Talos-MUID: 9a23:r5/mrAqwasMytKZVsTgezz9iD85nvpWHNFkUgMoJutGmESFNEjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Jul 2023 04:22:45 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 3624MjBL028437
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Jul 2023 04:22:45 GMT
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.01,175,1684800000"; 
   d="scan'208,217";a="3694190"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 04:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXmEHSF8XweGTcgS1cC2w+e4W3ec0X9OqnT0n4lzuKKimn5xd4sL4q8Mv46YpA/EKjYbPF7JCeVrpaxfHU72VLJZ/QKeeG4NzIjIHFvZQnKbG4Mg4VpRu3sKRGRuRoEbix7YMUiXghgpzXbgphEN4IROwyPmt8GcJuvuIEXN4vWpAjUSGngSAqS2rlkKW+ynZZYKh/SQw6SK80T8x0Xe28yU1B3MUKtra6vL4YicCDZ00x/zxJmsp75tlitBODOftBzD78VklwReWACl+TlbzusXcuRPtiC9Cajk9lhzKN1nYIUzVD+D9SwzEpMr9G9EWxmGvBcpdcfw1IMwf1n7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2duXaqoXss9TDANVoOKDbXQVZGyrv4+mWCYOUaY4bNA=;
 b=OAQaaVv3cQD7+rJwsJlOxWuZ1QHJgx1ctiOEdN1GnmLq8fTrgMbWTqDZXj7vE9NaoqhQVoAY1dezy4cuas5fQIQi3sq6YncYg5dsZcQKzTgmhI4DyRmfMoCGfJUyJl9Opy3TMaS9S1skvvSNmEWlklE+LMw6uDdUWYvbiAyOo/Uz+IICI/LytjnoHff/VogKjiInXa1VZHHpkeWm1nP9Zdd2EGTr7bP6oO7wsqaihfha5XsJPONiQ/9lUexpxZ7p0q1w/9DlFPdF7wXxz6BEGZASIYKwQV2RZaeiYOpkn/TJz3kI7gT5p2dfIBBLGwbQo9x9DS8h9zcz5pkFHmMVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2duXaqoXss9TDANVoOKDbXQVZGyrv4+mWCYOUaY4bNA=;
 b=DKHIs7JLTXcRgmniFluQk+N/HkWNjvcBgWPbzqnRz50CSM9kRQ47vUCldm03koZX3/PJ6dBtSV4QPUuzn9xt4Oh0ga2SGIH0lohDjjuTd9pGcFOApapLqgpSIaIb4WhjpSzQuELdlNtV6Fs9/mU4KIRsZYGI2C+/kY1Tv4G0ttI=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Sun, 2 Jul
 2023 04:22:43 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::12b8:1caf:f325:f6af]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::12b8:1caf:f325:f6af%6]) with mapi id 15.20.6544.024; Sun, 2 Jul 2023
 04:22:43 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "ecordonnier@snap.com" <ecordonnier@snap.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Steve Sakoman <steve@sakoman.com>
Subject: RE: [OE-core] Backport of libxcrypt fix to kirkstone branch
Thread-Topic: [OE-core] Backport of libxcrypt fix to kirkstone branch
Thread-Index: AQHZqz9nHXc4Z8HzsUWly3us1S8JRq+l4Xcg
Date: Sun, 2 Jul 2023 04:22:14 +0000
Deferred-Delivery: Sun, 2 Jul 2023 04:21:22 +0000
Message-ID: 
 <SJ0PR11MB67179B21B31BE9532F28FC87DC28A@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: 
 <CAHUKmYaD2u05xyrNoGd+8eFFHbFo1wXHN1COxj+TDSmNAkHSXA@mail.gmail.com>
In-Reply-To: 
 <CAHUKmYaD2u05xyrNoGd+8eFFHbFo1wXHN1COxj+TDSmNAkHSXA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|DM4PR11MB6477:EE_
x-ms-office365-filtering-correlation-id: d7b7adf1-5ea3-4977-6f44-08db7ab3fb42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8vSvXGBgB5R9KmN6gP4v++rrTuwzwAPg1He78q/e5plJm9dTE0Mob2ljqz7um/i55nGXaU4D5TyIdr2ntiWWC2hgNCKw/qLPIn/LZGrP7LT3c/gIKTXBtvfBG8EudhtGHFjJLI05SnNAxMBKd7nhwfQ0b9YCEsLla1zOi2izjZ0qcsfhvk3ovhV7kQgE3a/rd9LoCWGued/5yPUpUkIOpMiKx8c+9oiqYDEjzCOC9Iz6AUrKy1zQBtmiGGluioa/I2r1EsLCJucPFDG+12VXectJuKZFyhsNVoaoSH+QnoIcTAmvpsFsgXQS+vmW99jyRn8jMMsvmV6UQQH6rH5WB9Ram4aNI4VY6nccdnBZ37uLzNTxiD1Ws91CtnA30pLQKblpIKlBBd19MXJ4GbO6u43M4ItIL6iwimy7ivX+EWx0MOpH5bIWj4U8Gc1J1h4vMEIw1ieJKFzMVMaFc23lkuTFaIXVs11OHG2hYPWmWWoewJUkfQwPCTCeROW68vzz8MZ6SH7oDSt5TxATFMhgatn8+1L8s/mzIYv4NLm+pkk78sp5qzpskKGDIMc+wSlBdrhkJWTcO6g3Uwtiq+xT0At3F+kJDTgvqcVvlLah8DE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(71200400001)(110136005)(9326002)(5660300002)(8676002)(8936002)(478600001)(4326008)(7696005)(6666004)(64756008)(66556008)(66446008)(66476007)(76116006)(66946007)(316002)(41300700001)(38100700002)(122000001)(55016003)(53546011)(6506007)(52536014)(26005)(4744005)(9686003)(38070700005)(86362001)(186003)(166002)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y0xiQlZOVER3SDhZRWIxK29UeWtlZVI2eElOeWNMT25nemlFT3FJZndOcTRq?=
 =?utf-8?B?MmRLQi90NlA4eTRKdGNCenZ4NFFMQVZMNkQrTDdWVVlZWml5UlhKWmxva2Rt?=
 =?utf-8?B?MDZUUHp3Um9OOUdJR2RXcmdmNTdMaEpheW1yV0hTWXE0K3RjcmpFck1MRUxV?=
 =?utf-8?B?dFlnZmVTN0pNL1kwdVBFaUdIL241alZFdnpaL3RFTTVHVTdPQTl0OXdFak5r?=
 =?utf-8?B?NGVOM0EzcW0zWkhDZ1Y2djB1bWx3TUh6Z2pNSUZhNzF4OTVoajhuRWY0NDY2?=
 =?utf-8?B?YTIrVU0wdDdJZTRtUVdyV21KRGlNZU5qTVFTOU1DRVJlTU0zUXBrZHhXUEhl?=
 =?utf-8?B?S29mOEFYUm5LbjlJcGk5bnZ4anM1NW9aNWg1K2hiWkZFL3RvMlI5K3JjbDVu?=
 =?utf-8?B?YWNudjBCU1RRUWNaQk12Z0JSWlNRL3h6emw0R0djZlBDL0xKbEw5dW1pamo2?=
 =?utf-8?B?RGhsQjRBWnpNSEhjaUlHRVdFWXZkWnRIeFZETERuYlR0RlVCMWFZWm5NcVp1?=
 =?utf-8?B?NTNhV3dUL2RldHBvOVMrMjgxcFg5VlRBK2ZKYWVodmNCT2U4RGNTRkYzRDAr?=
 =?utf-8?B?VjliK0ZNdWdaRUhSYjdwT3V3MnJ6R2kzT2w4bnk1RUVZN2FQbW5VWmpCNVZE?=
 =?utf-8?B?MC8zbVdlVi9yaWJsUlRPd2JEQWFQT1J3ZEUyYU94VythSDR0L3NzUDJ4WXI2?=
 =?utf-8?B?N1RBUmMzOEkvRjBJNkNaWXNKd2ttYjlFbnlxT2pCRFRhL2haNzhWVWNMWHU0?=
 =?utf-8?B?M01YZktBVmJSSVJOQjQyRHJwL1BCdWhsMXBoY3Nibk5GakxKSTQrOTl6WXAr?=
 =?utf-8?B?Nm9ZVzBFZmd0RnZjeEdxMngxNEtvdlQ5cGxtMzdZc1BjNDk5MmQrVzNDeVdJ?=
 =?utf-8?B?YStpdkhjaURqVy9ONlh4cElSQWptdlhpZzlBd0ZtY1ptZTFSQlhCNWtkcDJa?=
 =?utf-8?B?ejF3QjRFb1RSQzV1dElhUVVjblhPMVkyY0lFUzhkbncwcTl6MW5lRVhmOWZG?=
 =?utf-8?B?MmVHZjZhejN5eTBna1lxQmpMNkt2dFRiL0pBeWt6RTNNbm9VUU5zT1BZQmps?=
 =?utf-8?B?Uit2RXkyZnVtSEZaUTBSc0dLWkUzQ1RkUlkwR2JuQXk2K2tDYVN3QSs4b0tZ?=
 =?utf-8?B?aTl2QzAwQkhNNmJFeVRaLzZXaUdHRnV6M3lXUlRJN1FrYlh1Y3JhOHBxRXg3?=
 =?utf-8?B?TytGT3NyMUQrTTFqa1VNZ1lJWlZRUUlGdStWTzIxNGZKazJDak5sWTg0eGdz?=
 =?utf-8?B?TEZiRzVqeDRwektlblBibSt1S1pHTGRWL1N3SFZQRE5LVVVvTm1PWE1yWmll?=
 =?utf-8?B?MGUyOUtPamE1eXhxVGhDd3M3cE8yS3llQW1QTW5MZ0hYT2NSbFpSMWhONmxr?=
 =?utf-8?B?VEhxd0Z6ZTF0YVNwUDgwbER4bHI4TkJVb2RpaVRMaGM1TFdUNEx5Mk1QbjRx?=
 =?utf-8?B?NXpyaGp5bzYvK1I0ODZzVFIwR2xseFFYeUVvUEk3OFFBR05ieTFiSUo2TDFX?=
 =?utf-8?B?cmM5L0VPNEdjUmsyZ0tvQUgyeTNnMFEyb3I0ampaVnlMdmdaQ0xnM1BQTVZo?=
 =?utf-8?B?Z2d6WjlSV08zem0xWjVYS05oOVc1REQzQXVKVHBpQUpLSXRKUUI3OTA5dE03?=
 =?utf-8?B?cUs2WFg4ZkxzV2RWNTJubWlndk1PSU5PYzhGYm11T21zQzRFZDFkRERkRFB2?=
 =?utf-8?B?WkFIZThKZi9pSm5lRWQycGh4TVU2OWxlVGVrWlFTSDNZTE43aGVrcUlWOTlC?=
 =?utf-8?B?NWZZL1RDY05HSmNuRzRJUHZieU16aEVhelo5YjFLWGpvUkJBdktwWHFNUjVW?=
 =?utf-8?B?c0kxQ1hiZE9RN1E3Q3d3MVVyT21DWENTV0tuZE1DZUttWUgwSTRBRVVkUGY3?=
 =?utf-8?B?bGZkOTcyRDhCN254YzZ4Q0k4d3RaSUQ1bTl3cjhmSXhhdmtWRnRIeUFGY3BN?=
 =?utf-8?B?UHpvcnUyTkgzQWNVbVJMS0lBMDhQczQ0cjNrOVJIODVOQXlSdUhRM2N1OHBQ?=
 =?utf-8?B?WC84MlRyVXhSUkVpRi8vZDY5SFlQLzhBQnRvT3ozZjNvcTVSS3AvOEZ1aE8z?=
 =?utf-8?B?bm9SMWlxRDBETUlIZGpNaTRnU3Yza0dKVzFxWXhYVVowZnBFQXRmZDE1OWZD?=
 =?utf-8?Q?MGjFShk5lM91ml0RRnfFjnXRa?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB67179B21B31BE9532F28FC87DC28ASJ0PR11MB6717namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b7adf1-5ea3-4977-6f44-08db7ab3fb42
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2023 04:22:43.5798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gmiTlYhGT8jt5aXu2U2zANd2t4HGkjJ9I8yPRQgcByjQ3V7Tt88sC/Vw1DPQPRPuH9z/e5frBKIwxwHqJrm3sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6477
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 04:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183775

--_000_SJ0PR11MB67179B21B31BE9532F28FC87DC28ASJ0PR11MB6717namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCkkgaGF2ZSBjaGVycnktcGlja2VkIHNhbWUgY29tbWl0IG9uIEtpcmtzdG9u
ZSBicmFuY2guDQpba2lya3N0b25lXSBsaWJ4Y3J5cHQ6IGZpeCBoYXJkLWNvZGVkICIuc28iIGV4
dGVuc2lvbiAtIFBhdGNod29yayAoeW9jdG9wcm9qZWN0Lm9yZyk8aHR0cHM6Ly9wYXRjaHdvcmsu
eW9jdG9wcm9qZWN0Lm9yZy9wcm9qZWN0L29lLWNvcmUvcGF0Y2gvMjAyMzA3MDIwNDExNTMuNDI4
MTItMS1zY2hpdHJvZEBjaXNjby5jb20vPg0KDQpQbGVhc2UgcmV2aWV3IGFuZCBwcm92aWRlIHlv
dXIgY29tbWVudC4NCg0KVGhhbmtzLA0KU2FuamF5DQoNCkZyb206IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBFdGllbm5lIENvcmRvbm5pZXIgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNClNlbnQ6IEZyaWRheSwgSnVuZSAzMCwgMjAyMyAyOjIwIFBNDQpUbzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KQ2M6IFN0ZXZlIFNha29tYW4g
PHN0ZXZlQHNha29tYW4uY29tPg0KU3ViamVjdDogW09FLWNvcmVdIEJhY2twb3J0IG9mIGxpYnhj
cnlwdCBmaXggdG8ga2lya3N0b25lIGJyYW5jaA0KDQpIZWxsbywNCmNhbiB5b3UgcGxlYXNlIGNo
ZXJyeS1waWNrIC8gYmFja3BvcnQgZm9sbG93aW5nIGNvbW1pdCB0byB0aGUga2lya3N0b25lIGJy
YW5jaDoNCiJsaWJ4Y3J5cHQ6IGZpeCBoYXJkLWNvZGVkICIuc28iIGV4dGVuc2lvbiIgKCAyNjM5
NzQ2YmE3ZjhhNjUxZmZmYWE5ODE5ZWY5ZDlkZjc3NjEwOGUzIGluIHBva3kgYW5kIDdlZDZiZmEy
NDI4YjRmMWJhN2YwOWQ2ZTllNjdjNDYyZmYzNTUxNTMgaW4gb3BlbmVtYmVkZGVkLWNvcmUpLiBJ
dCBpcyBuZWVkZWQgdG8gYmUgYWJsZSB0byBidWlsZCBtZXRhLWRhcndpbidzIGtpcmtzdG9uZSBi
cmFuY2ggd2l0aCB0aGUgbGF0ZXN0IGtpcmtzdG9uZSBicmFuY2ggb2YgbWV0YS1jbGFuZy4NCg0K
VGhhbmtzIQ0KDQo=

--_000_SJ0PR11MB67179B21B31BE9532F28FC87DC28ASJ0PR11MB6717namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsN
Cgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0
aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJz
b25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3
aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5
Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCW1zby1mYXJlYXN0LWxhbmd1
YWdlOkVOLVVTO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsN
CgltYXJnaW46NzIuMHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5Xb3JkU2VjdGlvbjEN
Cgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHht
bD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3ht
bD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6
ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBl
bGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tSU4iIGxp
bms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQi
Pg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJtc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+SGkgU3RldmUsPG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9Im1zby1mYXJlYXN0
LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0ibXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPkkgaGF2
ZSBjaGVycnktcGlja2VkIHNhbWUgY29tbWl0IG9uIEtpcmtzdG9uZSBicmFuY2guPG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGEgaHJlZj0iaHR0cHM6Ly9wYXRj
aHdvcmsueW9jdG9wcm9qZWN0Lm9yZy9wcm9qZWN0L29lLWNvcmUvcGF0Y2gvMjAyMzA3MDIwNDEx
NTMuNDI4MTItMS1zY2hpdHJvZEBjaXNjby5jb20vIj5ba2lya3N0b25lXSBsaWJ4Y3J5cHQ6IGZp
eCBoYXJkLWNvZGVkICZxdW90Oy5zbyZxdW90OyBleHRlbnNpb24gLSBQYXRjaHdvcmsgKHlvY3Rv
cHJvamVjdC5vcmcpPC9hPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0ibXNv
LWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPlBsZWFzZSByZXZpZXcgYW5kIHByb3ZpZGUgeW91ciBj
b21tZW50LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJtc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9Im1zby1mYXJlYXN0LWxh
bmd1YWdlOkVOLVVTIj5UaGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9Im1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj5TYW5qYXk8
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtw
YWRkaW5nOjMuMHB0IDBjbSAwY20gMGNtIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFu
IGxhbmc9IkVOLVVTIj5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gbGFuZz0iRU4tVVMiPiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnICZsdDtvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnJmd0Ow0KPGI+T24gQmVoYWxmIE9mIDwvYj5FdGllbm5lIENv
cmRvbm5pZXIgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5TZW50OjwvYj4gRnJp
ZGF5LCBKdW5lIDMwLCAyMDIzIDI6MjAgUE08YnI+DQo8Yj5Ubzo8L2I+IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5DYzo8L2I+IFN0ZXZlIFNha29tYW4g
Jmx0O3N0ZXZlQHNha29tYW4uY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBbT0UtY29yZV0g
QmFja3BvcnQgb2YgbGlieGNyeXB0IGZpeCB0byBraXJrc3RvbmUgYnJhbmNoPG86cD48L286cD48
L3NwYW4+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpw
PjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTox
Mi4wcHQiPkhlbGxvLDxicj4NCmNhbiB5b3UgcGxlYXNlIGNoZXJyeS1waWNrIC8gYmFja3BvcnQg
Zm9sbG93aW5nIGNvbW1pdCB0byB0aGUga2lya3N0b25lIGJyYW5jaDo8YnI+DQomcXVvdDtsaWJ4
Y3J5cHQ6IGZpeCBoYXJkLWNvZGVkICZxdW90Oy5zbyZxdW90OyBleHRlbnNpb24mcXVvdDsgKCAy
NjM5NzQ2YmE3ZjhhNjUxZmZmYWE5ODE5ZWY5ZDlkZjc3NjEwOGUzIGluIHBva3kgYW5kIDdlZDZi
ZmEyNDI4YjRmMWJhN2YwOWQ2ZTllNjdjNDYyZmYzNTUxNTMgaW4gb3BlbmVtYmVkZGVkLWNvcmUp
LiBJdCBpcyBuZWVkZWQgdG8gYmUgYWJsZSB0byBidWlsZCBtZXRhLWRhcndpbidzIGtpcmtzdG9u
ZSBicmFuY2ggd2l0aCB0aGUgbGF0ZXN0IGtpcmtzdG9uZSBicmFuY2gNCiBvZiBtZXRhLWNsYW5n
Ljxicj4NCjxicj4NClRoYW5rcyE8YnI+DQo8YnI+DQo8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_SJ0PR11MB67179B21B31BE9532F28FC87DC28ASJ0PR11MB6717namp_--

