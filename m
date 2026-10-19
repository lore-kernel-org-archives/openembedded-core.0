Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2215FCCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 09:52:30 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30793.1792403544227759881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 02:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Oq0m48QZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15158; q=dns/txt;
  s=iport01; t=1792403544; x=1793613144;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=faCE0M567IbgnevV2bj0f6EvYy1gkoUa679rcXm1iho=;
  b=Oq0m48QZ4sjPBojy7uci6I1d6Tu7HU4KMOx/LxT1JxbBGMw706mDk6Ll
   bY7P9V75s2qhSD4aYzHjgnbx4c1eM3INYQiUPH4wTVGFShv9HKF5ANMz2
   C0njOfhrXv16akG37pMxCTDdq9CY141KqQUB+23wlBjKqlyafn2TpTCay
   NC0G7cG1+6GtYAinQpdMxL69ATJ49kypWwgmdugjWm6JmqRqOjrark9tS
   PZ8s2hMu4mERT1q16zol8XDmp5gS1mmzQ8Fn3U7C7xXjq5jyen41YR7zV
   PsU9npdfAZN4WxWhMktz5vzCZ887mQui4Y4VhkBYXXRXiRbkAAEHAskPx
   g==;
X-CSE-ConnectionGUID: 8YWj1TnWQxKNtIyOwtN6/Q==
X-CSE-MsgGUID: rdiC/zklRlCBwbpnCbclUA==
X-IPAS-Result: =?us-ascii?q?A0CxAwD85tVq/4//Ja1agS6BK4E9ATBTgQkCgRESSYgjA?=
 =?us-ascii?q?4UriHkDnhyBJANXDwEBAQ0CLgEVDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBeBACAQgRAwEBAQEuJ?=
 =?us-ascii?q?wodCAIEAQ0FCIJ7gh0WQQMBAg4GQLNoAoodeIE0gQGDWwUDAQUCQ9wIBhQBg?=
 =?us-ascii?q?TiFQIMeAQErgTWCXYEjGAGEfCcbG4FygVeCaT6BBYFcAgIBgTQrHoN1gjAEg?=
 =?us-ascii?q?Q6BFHoSG4E/gQNKiwqJBlJyIgMmMywBVRMXCwcFgSUQMwMqLy0jSwUtHXAMJ?=
 =?us-ascii?q?xIPHRcRHlgbBgUSICpBQ12BWjwjGTZ6gQlegSspYAECDhdGLhWCBwKCVIEjX?=
 =?us-ascii?q?QIBSUEOB0VTCSU+BRJHJiIIEgkBExowC4EbODwJKEEXDGUODB0FIVEIAgsCC?=
 =?us-ascii?q?QdNbT03Bg8ZAwSBNQWRPgdbHoFycgEBFV8ZASoBT4E1DwEYE5NqjxGOYJUXC?=
 =?us-ascii?q?iiDdowijT6IMheEBKZrC5h9I4I2izGbDgIEAgQFAhABAQaBaDw5gQsOB3AVg?=
 =?us-ascii?q?m4BM1MZD5IkQc1teQIBCDIBAQcCBw4DC4FohF6LIgImB4FPAQE?=
IronPort-PHdr: A9a23:3O3pLB/C4a5ZSP9uWBDoyV9kXcBvk6//MghQ7YIolPcXNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:PwGu7KOFejuU6MHvrR39lsFynXyQoLVcMsEvi/4bfWQNrUp3hTFRn
 GobC26Ca66KMzejfYp/Od6+8hkF78WBx981T3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gm8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66VfM0NvAYsnw/ZUJ31v5
 NsHNBZTKSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzN3wsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEri+C9aIKJIrRmQ+1Pkkez4
 XDF+179KTsFPsSZ4jCO9k+F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:0UhMT6gxvZjBKY48TKazamkf4XBQX9p23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sde9qBPnmaKc4eEqTNGftXrdyRqVxeBZnMTfKlLbalfDH4JmpM
 Ndmu1FeaLN5DtB/IjHCWuDYqsdKbC8mcjC65a9vhJQpENRGt1dBmxCe3+m+zhNNXJ77O0CZe
 KhD6R81l2dUEVSRP6WQlMCWO/OrcDKkpXJXT4qbiRM1CC+yRmTxPrfCRa34jcyOgkj/Z4StU
 TVmQ3w4auu98q81gLd0GHr6ZFXksvKy9dIBsCA4/JlawkEjDzGWK1RH5m5+BwlquCm71gn1P
 PWpQ07Ash143TNOkmovBrEwWDboXUTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Z
 hMw3mSu/NsfFH9dWXGlp31viNR5w2JSEkZ4KguZrtkINIjgYpq3MgiFYVuYc899WzBmdsa+a
 JVfbHhDb5tACCnhjbizylS6e3peGgvFRGbRUVHkMmU3z9K2E1d9SIjtZYidrNqzuNgd3GCjN
 60b5iBmNx1P70rRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkf8IDcyRCdQ1JaEJ6d
 /8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORwTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6HmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKlRqU+x+MHLEH3xZll9GFWDPw4juE8syXM2v22
X-Talos-CUID: =?us-ascii?q?9a23=3AbMjCtWozNpzAZGpdpoeQuQ3mUZAUTX+E8HHvGl+?=
 =?us-ascii?q?bL3pIWZqKVXnOv5oxxg=3D=3D?=
X-Talos-MUID: 9a23:ofNVUAtLaCVbe3t1wc2nnj1jH4B64KCUDGsnjp8eveKOPihNEmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 09:52:23 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 111E1180004B1
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 09:52:23 +0000 (GMT)
X-CSE-ConnectionGUID: tSAyoy5OS9yPXZt+1a0rsw==
X-CSE-MsgGUID: IOP+KzYvQRKNL4lXPkfU7Q==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208,217";a="72584196"
Received: from mail-eastusazon11011050.outbound.protection.outlook.com (HELO BL2PR02CU003.outbound.protection.outlook.com) ([52.101.52.50])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 09:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKyv4LRN67ReRdScwqNv+1oRTlXPx0mjt2Lc5RVVkrhc8DU2GuBciycn0lnKcg+D2xtgwwni3Ptadtnj7uts00dazPW10HjVtBmntgPiZkntYk0w1Q7/J3+I8cdKabxqjbdNI5rqBURSMlCNvpEO7TrVXQbh8vnF1suhlxQ6q7m7MMksGXq3SSgjLaU3Op0KJl9wIAtqlW2iH3VkhwrzbZr5Q6DU5mbM3tGCP0+L37Y7Wmlt2dROhlEggDHc+kTiQD/rdERJ8nWKijHgZEbR9H1Trutl9DRkiPWLdiiYl4HomboJCKvXRLgkwTAKnrxFSEmusTGFVka9wqzbPsPU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faCE0M567IbgnevV2bj0f6EvYy1gkoUa679rcXm1iho=;
 b=URZe3NfHpK8LWPub0amNenxu3mAfN/Dmm9EfDZ91ZOLXD+ajnYnpXEHUDjzYZCY+JBEM6YCDYDmqcCXKFvKqSJ/HBtdIEi4Ih60dY7s1M9xBiNrU3kTa/Ax2sBIlsgyB5zdL0sm7wCmSffzPwfAYQxC7siyhl7B6ip73w1lz1RQeQTGwYOoQJYp8vAwk63FYrgWUjgHhDrGDfmFdu+UtkX2ySjHT0lzsLXNdwiniWOp/iu8S/0Q4lCebeN2xmpO2v3vkrb3QzOJzuBoJpn367Ep3hIo1rLUgSPQpUHbNuEtbI30dN1orQnK4a/ROtvYKCPXSGCexnpS4xByYhaeq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 19 Oct
 2026 09:52:19 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 09:52:19 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>, Yoann
 Congal <yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] go: Fix CVE-2026-33814
Thread-Topic: [OE-core][scarthgap][PATCH 1/2] go: Fix CVE-2026-33814
Thread-Index: AQHdORALipN5BC9WtUmzsWjbwI5w6LbS5zqAgDIFePg=
Date: Mon, 19 Oct 2026 09:52:19 +0000
Message-ID: 
 <PH7PR11MB85988110C1425A7BD276918FAD982@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260831061447.180612-1-hthakar@cisco.com>
 <7ceb1874bae6aae6c4bb27b948a38c1015960739.camel@pbarker.dev>
In-Reply-To: <7ceb1874bae6aae6c4bb27b948a38c1015960739.camel@pbarker.dev>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|SJ1PR11MB6084:EE_
x-ms-office365-filtering-correlation-id: 4b1604f1-2adf-425d-3499-08df2dc6aa40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|13003099007|22082099003|10067099003|260925021311599003|260925022911599003|18002099003|8096899003|260925021911599003|4143699003|5023799004|261009223027099003|56012099006|38070700021|11063799006;
x-microsoft-antispam-message-info: 
 6HiDdQ3hg1OgREZhrAVqv0YWCKFCCyGdlpoiLUnlu2nEkKIcB6dvP84IHmm2WSeWeumxJGblxOfvrPh4RxIoaAhruyTiyNgYsSjIXYqtZLqqW3VNLsSj1QQuUCSGRYgqeLX7DuwEvkN4kD0nsRGN6vk5a3KyfoW9EFCyYUsOEYHJvgIohocclGMckWB2gSk+o8U2AnNAFkS0WQQRBEktJbxvEOnQHX9dGifInzqOoJjtnfA/DyCE90Wgq2+6R1WkEapc/n4sMhRYNtV8kDAdeqFci7/F4dQHZzBxYf/lB36EshpdTEfqDwJFuooCYu+wYsPXkC8jsvK33E+r2t+JzqeKVsmgdKRRg1cYVyEHHHvnRFNevVMWTZsNEV3zGodIllGLeUCviojNLGjiTnwt+FDzaMtpiLbKMVHTaUlazE5uATiAxEnWa5Xv+RTGZIYWFRLwEu7886PlZP/pAPJHEYaeBXF0yBuBGxBBlUH/89OzQIzBHVqApl3LwLi8/1xqymjtjKU3usFSbI0H1JxtQwCMzsYC5eLKUmced87yQ/yWTBh/timBw2QoyciCs6V7CEezg0gZIZG537LqhsUTfPhdAR6+Np4bQyYuBgq5iTcKCWY7BAKNAp6xmkrxNGmPYPft0mNPEVPGIm2eo3dnAy8PG9/rjzED3Azp1CkWZJA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(13003099007)(22082099003)(10067099003)(260925021311599003)(260925022911599003)(18002099003)(8096899003)(260925021911599003)(4143699003)(5023799004)(261009223027099003)(56012099006)(38070700021)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9Rb14E7Bj2kUoZSn3RzLaYUObNdYvEHib5LPOSLM2dt5sfse6deYZ5qq4CC1?=
 =?us-ascii?Q?ijJJeuamuGp9mamKXPM9za1+dSQ1YH97c81B5F8A6eM6Gnsq17o+ECZuax9s?=
 =?us-ascii?Q?uiWG6Svs9C/Hagqipa3Y+DVqgHwvi+wBuGAeJtXVkMNiSoIMhrog9E3CdIRH?=
 =?us-ascii?Q?s1kZmnJgKc5w4Eel+KaKh59R+OyoInOwSGLu8FmhwdRsXiHFR3J9zPMVvMGk?=
 =?us-ascii?Q?JPzWVbp26rZ2NSQe2ffIXlLvdZIlwUqmb1trm93S/y9ilth88unLu4u//zfa?=
 =?us-ascii?Q?P0EqFWSmpK6Q4POzZRm1Tcd/T3iTNC9ymsMiqJdGfFK1VaGNaCFI1WbKWI/t?=
 =?us-ascii?Q?ckANAzd6xao5Ioh7nMdTfvjHCybXws9AM9UJCI+mvFAO19tgH788qMF/T5Of?=
 =?us-ascii?Q?s0PtGpYjYJzgMYKkRXJ+jYSPT4n6XzBjMMtSeQVzvqg5X89fix4AUSYjArHO?=
 =?us-ascii?Q?ZNGCs12KaImpZzGs9D4RqVJDlYNOpiV/pOO3HcvbxLFdUny0UqyORBYOyX5K?=
 =?us-ascii?Q?Z1FhMEL25pVQZ9gXa8nX7AiAEPJD3kffzn01b+QtPeQa1GPhEU1/Uz2b3s7C?=
 =?us-ascii?Q?x58Ka0K46l2Jkr3OM0v6uztsr09t+M4mU3zkfIBByStyJH4qw9KiEJeF5Es3?=
 =?us-ascii?Q?dOzCJ6BdjsBzkCkMraVxy4NNKEkg8WOtpWesCiZBnoWR5LZ9yLpUfHZ/oQG4?=
 =?us-ascii?Q?uABJq3eL7WL10kb00fmZEZBvphDZcw1t4tZECxpQZLJnE8W6gHDJSMBTZseJ?=
 =?us-ascii?Q?n4JQJNXYmt3w8xPLnoEuKiEhSaCGZ7LvfpV0F/DvufiGOF6Hh7BRmAF5gYKh?=
 =?us-ascii?Q?GHl/2KVNMna4IcbeFM/DYwEi6TEE2Aig0CisW6ykcZaBbLPunxE2WyiDlIWy?=
 =?us-ascii?Q?VnwKoIqvYIJaTaYuXTiplL1cHw0wfcm9s0FMBR8fL8KbcovpZWBK3wZ2kos9?=
 =?us-ascii?Q?qiGzs5CrFnkBjzQwhqQsqg98IsLdxg9n5lpHC4CCPYemKgnXzIVsrG6yTXi9?=
 =?us-ascii?Q?zRQWl8qDscd/W5m9evtK3xbar1ClRWHof+8oxHITcjKj/dmeXc2c1giJe38L?=
 =?us-ascii?Q?V8FiftsZ4GDym8e52L8tOEccxXBPKdczy8ErTSJgaloUGFEQGGunVUkoOUKR?=
 =?us-ascii?Q?4gOeJ4lsBdAKrT46Pvndss4b2hZj8mo+5Q5lCG3aVR7bs2iNLrrOZnRfdwof?=
 =?us-ascii?Q?Q6kN4WqllyTJHfy6ZutXp12pL+m2PXI4paxhmFOwHxKCHKPxkDwFeQFf3KP2?=
 =?us-ascii?Q?UiiKLc4FLnB0y402Iy9XdgCPnBSOcwHIElfZRFUsFnMClhLJuD86JTlP7qQ3?=
 =?us-ascii?Q?W5mj2Dro4U1FjBI6eiWwKO9E2lZNgpCA9Ay+T0N68qCym3oJv+kwSg1GfNn5?=
 =?us-ascii?Q?mOhpzDpyif6H1GneS7ZQ1mHc/rkUChtKMWsB1bUXm+aljKfySNUSZ1B7g3Co?=
 =?us-ascii?Q?BR0cZ0S7ePywsT0ouNXYH2Gqq9eNqNIKF9dxPcm618wIzpftMwvfwRfTj2kO?=
 =?us-ascii?Q?bBnoboD84LYmE0vtA+XE3YZKYwLe1QLb11x8pHhNrRQZVIOiPIR1I/JlT3vx?=
 =?us-ascii?Q?lLxehJL3P1UPC8ZtFD6kSh4uCrrADN5sQ8E1Vwe65JGDBPUB3AVc4lB9XxrH?=
 =?us-ascii?Q?Ik5o31Lc++RCwO1F06Sfk/v39ypiuevwt5LDiCA8Yf9fQvWJw/QYs3DYWC9A?=
 =?us-ascii?Q?CMGSx6sCOtmrlnGBgmOpOMCWmwhT7rGdtr2Y9U3ggqyFnUAh?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB85988110C1425A7BD276918FAD982PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	oJSomuYJAefgLCXGfLEGrsLRFtgGwkd5h0IAqeMM1P08dLGDFBzkigNXQj19NMpY9mHpdOEcBqJhQHWbTP1E07di9kI39Omj2iWz+qzuYPPbAp/LJzzTaghRgqyLMzacf2hFVYdFm9xZkjzUGB1qLJNhTscEmnQ5PGKC7LdN5SRTbFf5tACT3JbQacKMk2XEmWrhopWo3Xviz/AF++SIfdc8pP8B6VNUehCON6pfCMFKXEHAuM2jLQRLLP3K8pFx1/29lf5GTB8UtnHcM3Rpk/xFj0NqRwdIhFIfIEnSKuAFt2zobLFdW1ZLWMYYooQkR9t7t6EbiruAWvWoGKoKsQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1604f1-2adf-425d-3499-08df2dc6aa40
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 09:52:19.2744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tv4y6E2NHmjMkcsTkuJRIsGu2V3Nw9UEcFqrferH0m9hDO+r+RFvSTM5rEj9YI3T2v/PSv787CcE777WZt0e8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 09:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248154

--_000_PH7PR11MB85988110C1425A7BD276918FAD982PH7PR11MB8598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul, Yoann,

Thanks for the review.

The go.mod, go.sum, and vendor/modules.txt changes are not required for thi=
s Go 1.22 backport, as the upstream Go 1.25 commit updates the entire x/net=
 dependency to revision a9171bc8 [1].

For Go 1.22, the required security fix is applied directly to src/net/http/=
h2_bundle.go [2]. The fix addresses the infinite CONTINUATION frame loop de=
scribed in the CVE.

Updating only the dependency metadata without updating the complete vendore=
d x/net source would be inconsistent. Since this is a focused security back=
port, the dependency update is not needed.

The additional validation-related change in the upstream commit is not appl=
icable to Go 1.22, as the corresponding code is not present in this version=
 [2].

References:
[1] https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359ed5=
307%5E%21/
[2] https://github.com/golang/go/blob/go1.22.12/src/net/http/h2_bundle.go

Regards,
Hetvi
________________________________
From: Paul Barker <paul@pbarker.dev>
Sent: 17 September 2026 19:28
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; Yoann=
 Congal <yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] go: Fix CVE-2026-33814

On Sun, 2026-08-30 at 23:14 -0700, Hetvi Thakar -X (hthakar - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7=
896f67f
> [2] https://pkg.go.dev/vuln/GO-2026-4918
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
>  .../go/go/CVE-2026-33814.patch                | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devto=
ols/go/go-1.22.12.inc
> index 99c5f8b63b..ee2f5ca277 100644
> --- a/meta/recipes-devtools/go/go-1.22.12.inc
> +++ b/meta/recipes-devtools/go/go-1.22.12.inc
> @@ -62,6 +62,7 @@ SRC_URI +=3D "\
>      file://CVE-2026-25679.patch \
>      file://CVE-2026-32288.patch \
>      file://CVE-2026-27145.patch \
> +    file://CVE-2026-33814.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b=
9cf4d9ca02db986e17d71"
>
> diff --git a/meta/recipes-devtools/go/go/CVE-2026-33814.patch b/meta/reci=
pes-devtools/go/go/CVE-2026-33814.patch
> new file mode 100644
> index 0000000000..8265bf205f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
> @@ -0,0 +1,44 @@
> +From 825d42a14d8ffbdbdda87a39e78795eb17e4f0f2 Mon Sep 17 00:00:00 2001
> +From: Mark Freeman <mark@golang.org>
> +Date: Fri, 17 Apr 2026 16:28:03 -0400
> +Subject: [PATCH] [release-branch.go1.25] all: update x/net to a9171bc8
> +
> +Fixes #78477
> +
> +Change-Id: I0a4c8e25f569fc1bfb8ac39ff728bfe7300b751f
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/768323
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
> +
> +CVE: CVE-2026-33814
> +Upstream-Status: Backport [https://github.com/golang/go/commit/9024c3f6b=
150fb1349d8a5dc5e9aa31d7896f67f]
> +
> +Backport Changes:
> +- Omitted src/go.mod, src/go.sum, and src/vendor/modules.txt because
> +  their x/net version updates are not required for this focused backport=
.

Hi Hetvi, Yoann,

My Go knowledge is limited, but omitting the go.mod/go.sum changes
didn't seem right to me. Those files track dependencies.

Looking in to it a bit further, the CVE description is:

    When processing HTTP/2 SETTINGS frames, transport will enter an
    infinite loop of writing CONTINUATION frames if it receives a
    SETTINGS_MAX_FRAME_SIZE with a value of 0.

The commit message is "all: update x/net to a9171bc8", if we look at
that commit in the x/net go module [1] it makes other changes which look
relevant to this CVE.

[1]: https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359ed=
5307%5E%21/

Could we check if the backport submitted here is a complete fix? As I
say, my Go knowledge is limited, and I'm not sure how we would pick up
changes to the x/net module if we need to.

Best regards,

--
Paul Barker


--_000_PH7PR11MB85988110C1425A7BD276918FAD982PH7PR11MB8598namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Paul, Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for the review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The go.mod, go.sum, and vendor/modules.txt changes are not required for thi=
s Go 1.22 backport, as the upstream Go 1.25 commit updates the entire x/net=
 dependency to revision a9171bc8 [1].</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
For Go 1.22, the required security fix is applied directly to src/net/http/=
h2_bundle.go [2]. The fix addresses the infinite CONTINUATION frame loop de=
scribed in the CVE.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Updating only the dependency metadata without updating the complete vendore=
d x/net source would be inconsistent. Since this is a focused security back=
port, the dependency update is not needed.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The additional validation-related change in the upstream commit is not appl=
icable to Go 1.22, as the corresponding code is not present in this version=
 [2].</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
References:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[1] https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359ed5=
307%5E%21/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
[2] <a href=3D"https://github.com/golang/go/blob/go1.22.12/src/net/http/h2_=
bundle.go">
https://github.com/golang/go/blob/go1.22.12/src/net/http/h2_bundle.go</a></=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hetvi</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Paul Barker &lt;paul@=
pbarker.dev&gt;<br>
<b>Sent:</b> 17 September 2026 19:28<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;; Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/2] go: Fix CVE-2026-33814<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sun, 2026-08-30 at 23:14 -0700, Hetvi Thakar -X=
 (hthakar - E<br>
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; <br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/golang/go/commit/9024c3f6b150fb1349d=
8a5dc5e9aa31d7896f67f">
https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67=
f</a><br>
&gt; [2] <a href=3D"https://pkg.go.dev/vuln/GO-2026-4918">https://pkg.go.de=
v/vuln/GO-2026-4918</a><br>
&gt; <br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-devtools/go/go-1.22.12.inc&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; .../go/go/CVE-2026-33814.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44 +++++++++++++=
++++++<br>
&gt;&nbsp; 2 files changed, 45 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.pa=
tch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-de=
vtools/go/go-1.22.12.inc<br>
&gt; index 99c5f8b63b..ee2f5ca277 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.22.12.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.22.12.inc<br>
&gt; @@ -62,6 +62,7 @@ SRC_URI +=3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-25679.patch">=
file://CVE-2026-25679.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-32288.patch">=
file://CVE-2026-32288.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-27145.patch">=
file://CVE-2026-27145.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-33814.patch">file://CVE=
-2026-33814.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[main.sha256sum] =3D &quot;012a7e1f37f362c0918c1dfa333445=
8ac2da1628c4b9cf4d9ca02db986e17d71&quot;<br>
&gt;&nbsp; <br>
&gt; diff --git a/meta/recipes-devtools/go/go/CVE-2026-33814.patch b/meta/r=
ecipes-devtools/go/go/CVE-2026-33814.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8265bf205f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go/CVE-2026-33814.patch<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +From 825d42a14d8ffbdbdda87a39e78795eb17e4f0f2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Mark Freeman &lt;mark@golang.org&gt;<br>
&gt; +Date: Fri, 17 Apr 2026 16:28:03 -0400<br>
&gt; +Subject: [PATCH] [release-branch.go1.25] all: update x/net to a9171bc=
8<br>
&gt; +<br>
&gt; +Fixes #78477<br>
&gt; +<br>
&gt; +Change-Id: I0a4c8e25f569fc1bfb8ac39ff728bfe7300b751f<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/768=
323">https://go-review.googlesource.com/c/go/+/768323</a><br>
&gt; +Reviewed-by: Dmitri Shuralyov &lt;dmitshur@google.com&gt;<br>
&gt; +TryBot-Bypass: Dmitri Shuralyov &lt;dmitshur@google.com&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2026-33814<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f">https://github.com/golang/go=
/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Omitted src/go.mod, src/go.sum, and src/vendor/modules.txt because<=
br>
&gt; +&nbsp; their x/net version updates are not required for this focused =
backport.<br>
<br>
Hi Hetvi, Yoann,<br>
<br>
My Go knowledge is limited, but omitting the go.mod/go.sum changes<br>
didn't seem right to me. Those files track dependencies.<br>
<br>
Looking in to it a bit further, the CVE description is:<br>
<br>
&nbsp;&nbsp;&nbsp; When processing HTTP/2 SETTINGS frames, transport will e=
nter an<br>
&nbsp;&nbsp;&nbsp; infinite loop of writing CONTINUATION frames if it recei=
ves a<br>
&nbsp;&nbsp;&nbsp; SETTINGS_MAX_FRAME_SIZE with a value of 0.<br>
<br>
The commit message is &quot;all: update x/net to a9171bc8&quot;, if we look=
 at<br>
that commit in the x/net go module [1] it makes other changes which look<br=
>
relevant to this CVE.<br>
<br>
[1]: <a href=3D"https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f=
96e361359ed5307%5E%21/">
https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359ed5307%=
5E%21/</a><br>
<br>
Could we check if the backport submitted here is a complete fix? As I<br>
say, my Go knowledge is limited, and I'm not sure how we would pick up<br>
changes to the x/net module if we need to.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB85988110C1425A7BD276918FAD982PH7PR11MB8598namp_--

