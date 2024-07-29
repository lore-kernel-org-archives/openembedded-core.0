Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C63C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 11:39:16 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web10.54004.1722253151219493562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 04:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=FXa1ayLd;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1833; q=dns/txt; s=iport;
  t=1722253151; x=1723462751;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2ZdwsKJjxGkyUVGf2z49mpJxsA4jDM/pqnXB3XPStx4=;
  b=FXa1ayLdRAMVapQdiTfElTGpA+0Sfvdt/IfpUT7A/1Bu3lefeqdEN7hx
   M29EKdyfflnVqHx+z/GS1TrwZTHGOejYRX7/AEuUK8uD7P/MAn8C5EqIr
   2RPwTyX6r6dbPELRsH3/ikjD7YR8TtUuuSA+UxJt0yXgd/cKwyeFFol6V
   A=;
X-CSE-ConnectionGUID: FgaPXaJjT0ixztpk6Fz13Q==
X-CSE-MsgGUID: HgbzbRanQv6j/+YKyK2vYA==
X-IPAS-Result: =?us-ascii?q?A0ABAADwfqdmmI0NJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBcVJ6AoEcSIghA4ROX4hxA54RgSUDVg8BA?=
 =?us-ascii?q?QENAQEuCwsEAQGFBgKJPAImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQUBAQUBA?=
 =?us-ascii?q?QECAQcFFAEBAQEBAQEBNwVJhXUBDIZdAQEBAQMBESg/DAQCAQgRBAEBHxAnC?=
 =?us-ascii?q?h0IAgQOBQgagl4BgmQDARCeRAGBQAKKKHiBNIEBg2IB3DQGGIEwAYg8AYU+L?=
 =?us-ascii?q?4RnJxtAgU2BV3mBNzg+gmEFgV+EE4IvBI1EhFEOghsogR9HVw+CXIFWgjomS?=
 =?us-ascii?q?40aUnscA1khAhEBVRMXCwkFiUwKgyMpgUkmgQuDDoE1g3mBawxhh3JigQ+BP?=
 =?us-ascii?q?oFfAUmCdkuDZ4F/gRwdQAMLbT01FBsFBIE1BaEag3YBHh5RLBk1DD4DgS+TT?=
 =?us-ascii?q?LJACiiDbYwUjTKIKReqPphuIo1Zmm4CBAIEBQIPAQEGgWc6gVtwFTuCZ1IZD?=
 =?us-ascii?q?446iHXHMng7AgcLAQEDCYpqAQE?=
IronPort-PHdr: A9a23:EQ81wBYA9UD6xanDEBbOQff/LTAchN3EVzX9orIuj7ZIN6O78IunZ
 QrU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:pn3r6K8FMJIJcOCdJAGPDrUDrH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GpJCD3VMq2NM2GnKdx2atu09EwCupLTn99lS1FtrX1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEzmB4E7rauW8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4ujyyHjEAX9gWIsbThEs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kYMoQgyu9VA10W9
 OwKNCgOMD6R3rmPlefTpulE3qzPLeHiOIcZ/3pn1zycXbAtQIvIROPB4towMDUY358VW62AI
 ZNCL2MzNXwsYDUXUrsTIJ44leivimP2WzZZs1mS46Ew5gA/ySQqiuO9boGEJoPiqcN9vkmSt
 Gj89mLAHE8Yc5+u6iumqGydr7qa9c/8cNlPTOLjrKECbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIwa3O7kPJQGMFVTVGLtchsafaWADGy
 HenkNrRNTVNsoHNSGKP6q+X8x2gYHMseDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsjETMW+tq
 9xthHZi74j/nfI2O7OHEUcrag9AS7DASgozow7QRG/gvkVyZZWuYMqj7l2zARd8wGSxEAbpU
 JsswpT2AAUy4Xelz3HlrAIlR+zB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RCJ41sKvMUOZSH0Mcebhr5d7ex3kcAM8vy4BpjpgiZmOMMZmPKvpXs3PBXBhQgBbmBwzvhhZ
 f93jvpA/V5BVPw4l2DpLwvs+bQq3Ss5jXjCXoz2yg/v0LyVIhaopUQtbjOzghQCxPrc+m39q
 o8HX+PTkkU3eLOlOEH/r9VMRW3m2FBmX/gaXeQNKL7aSuencUl8Y8LsLUQJINw+x/0Iy72Zo
 xlQmCZwkTLCuJEOEi3TAlhLY7L0VpE5pnU+VRHA937ys5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:yjTbharEJ1PwoKpXhe+6d6AaV5tuLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H/BEDhex/hHZ4c2/h2AV7QZniWhILOFvAt0WKC+UyuJ8SQzJ8m6U
 4NSdkbNDS0NykEsS+Y2nj4Lz9D+qj7zEnAv463pBkdL3AOV0gj1XYENu/xKDwOeOAyP+tDKH
 Pq3Ls+m9PPQwVxUi2TPAh3Y8Hz4/fwuNbNZxkACxQ76A+Iow+JxdfBeSSw71M1aR8K5a0t31
 TkvmXCi5lLtcvV9jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8RryrplkO0aKSwWdvtO
 OJjwYrPsx15X+UVHqyuwHR1w7p1ytrw2P+yGWfnWDoraXCNXAH4ot69Mdkmynimg0dVeJHoe
 R2NqWixsNq5Cb77WDADh7zJklXfwSP0CEfeKUo/gxiuMMlGc1sRMokjQNo+FNqJlOm1Gjhe9
 MeVv309bJYd0iXYGveuXQqyNuwXm4rFhPDWUQavNeJugIm1kyR4nFojPD3pE1wv64VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRC/fZt3d07lutry+vE49euqcJsHwN87n4
 nASkpRsSo3d1j1AcOD0ZVX+lTGQXm7Xz7q1sZCjqIJ94HUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZMD/rqPQLVaM90Ns3FKu9vwFUlIbooU4wAKiezS+rwW/nXitA=
X-Talos-CUID: 9a23:sP3n3mwX+jkQesecBYErBgU6FckdQnT/zkuIIl+qFX5qFpOHEASprfY=
X-Talos-MUID: 9a23:NlqacAsqUfLkl1Zsas2npD5oJs1S6qKXFh4P1tY3mNinbzJBEmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 11:39:10 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 46TBdARq020597
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 11:39:10 GMT
X-CSE-ConnectionGUID: gsnAh5KsTUqsBNvGITLfFg==
X-CSE-MsgGUID: 6mpZ3QsiRgyzhFvXittIVg==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.09,245,1716249600"; 
   d="scan'208";a="35145463"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
  by alln-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 11:39:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9XxOX8/pUOtpbZrE2ulCn8QJ9D0b/ieNflzQy9+SOFKKjTUV84r0D5jrNrdNjqS5/bO3e6UvqxVnApHjdlI9sgCZ2eQuVeOXDh8Ie6FBaVoAZApMnieC5AtO0yXt+OZPXyzjjiO8Gk742Piu68rYEw3uBhdTvmQWdDilq/1JpPv+3JZluiZFnG3HV5+cbw4yC58RRG4OtW79uGBALdcxdnEbaqDHY99oGAgOL+e61za+p/L2pCXFX6r/IAglqkBUGbjatAX/C3KsBvpMeEmNEvXC4+wCZwaZLKnWBlU7LU5CJK9tQk4Z38jVQNVzOXiIbNCReHtnngtZOiGLosLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZdwsKJjxGkyUVGf2z49mpJxsA4jDM/pqnXB3XPStx4=;
 b=hk2KFZG9Kjux4VY11P5iCKvmK87h6mecCnXMocj9bhCtY83WdbDZTsesxKWY9FhvKlUBQXyvxJVFJe5HCVtRP6ZlpsZpzuf9hLuLZzTrtAiaZL8R78pMVhhBstAxyUWmzi1eH+sndNCms+vrVXruKNoXhAR707k0SMF6brfNpxsMPKDsjZblqmCxvqyTs53Yh6GzxT7bVoeAP7khFq/yu6C/0KTt310wnFvsM9tHew+sSFzlgJIQHFTtM96PxWN0Qe2MDOGVAB1xNvi3GdmyO1PE08WYUaDwnK0Qf1AiY+Wi2jjcJYW53p9xKYzH1+lxZe/F/vbBfVzl8G88P9iYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.32; Mon, 29 Jul
 2024 11:39:07 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896%3]) with mapi id 15.20.7807.009; Mon, 29 Jul 2024
 11:39:07 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: RE: [PATCH] cve-check-map: Add 'cannot-backport' to status map
Thread-Topic: [PATCH] cve-check-map: Add 'cannot-backport' to status map
Thread-Index: AQHa3YQozjHzqDLook6Ce3xcy5nGlbINnBUA
Date: Mon, 29 Jul 2024 11:39:07 +0000
Message-ID: 
 <SN7PR11MB6971EB33EEF5317173CE3523D4B72@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044412.3343884-1-dnagodra@cisco.com>
In-Reply-To: <20240724044412.3343884-1-dnagodra@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: 70209ec7-a272-46c7-5531-08dcafc30e26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?xk9wMF3GoWonLu5Z3LJ1WZ/6dizinddlaYR7IRJpgYM2bz6TPHvby92rQaih?=
 =?us-ascii?Q?HS3U+CvED/F3Hl7vrxr3kwu5oPnnQoabMF8Q/TrsRADlcSRhOcNwbfDYtNe5?=
 =?us-ascii?Q?20Smq89UOR6KllnzRGoyBnI6srJkUxGjn2KMzgKjq1B/ejUJBUcvP2tdz6vP?=
 =?us-ascii?Q?yHWKV30nL0fvmlzAwQGhFC/hre2AoSXZAE3PpLlA3y5ObKI582JGu5z5QHas?=
 =?us-ascii?Q?hQRQGObGS97A4osbE2I7ya9JzDSbhh+UaIOaU2lFogpO6ddlfTca0aumZfcI?=
 =?us-ascii?Q?sYSSZ2Y8nTzkYeumkUMGkkPEC1odRbT/2jmL3Pqfmqz7vs/n3mjWInK2flJI?=
 =?us-ascii?Q?Cp1tEfbBYodZ9AvWSbSO0xo8HKHztOHEVjz/e5qvNZl5lwnxurECHnr4ao2W?=
 =?us-ascii?Q?lFqU3x3OU3AAXmV1+UI6F5QSOahuUzrc5nhIq8KPgeC7CETeKTq0iS0i8FRB?=
 =?us-ascii?Q?Fwtzh6K8CgYaz4kioceakokIcwIXVfK7H8BQc+LQrvNErBrvSp21xB7ECgJW?=
 =?us-ascii?Q?geZo4noRMdBZperxIRb7B8tCZDPwCUki30NCWIYoYIMSp07c6NHQHUzQg4z1?=
 =?us-ascii?Q?QkCk2T9s1S2NutcuSTXaGmz7zXZVJAqaDzY6eT9Zg4k48ncXi/qVY1BeuPeM?=
 =?us-ascii?Q?99mH9SuiFBjDMCtCSv5ibj50+V49eBzkAQZAopPVPFJputQfYSJLGT5Q7K3Q?=
 =?us-ascii?Q?ULpWtsDL+yDiXqn805fecT+vr29BU6xnGsxxf0kMijqaHYAL2dJ0q7/+Ry5k?=
 =?us-ascii?Q?F+j8jBkj3ZWTrzRyYukkEbleWWSJ+tjm39b9BSYP+oV/EmC88H1QhH5kfHO4?=
 =?us-ascii?Q?j8YgbGhxET7Wth270VxSxEhLlNJ88RH/CrbXJRVcZmZ6E+xp4gatvn7J9Ts/?=
 =?us-ascii?Q?DatOTzqWZrOTfkFOPM2cGCcWOmjbxPiJvZrynsYXWmKrFnWjksAndmNfTjBJ?=
 =?us-ascii?Q?m7fwnObegRWgZnrHQkFQTzye6FqkXLPGnaURKkc6InFo3Pw/VyiCYwu58+Fz?=
 =?us-ascii?Q?/64hE88TPbfGtJUwyXeGX7GK+iJA1f1hXsBOfgeOtiKJX+cvyEHsne5uJxEk?=
 =?us-ascii?Q?L8CIMpd86/M6FpAnKgZFtL3QA6rvhWoUIY4nB3qCd5z7bq4d81o64NxPmsDR?=
 =?us-ascii?Q?pouprQWp57aCC4EUiwhmU1uKNPXXdbkVmF/1eFQ9ONiXVEzAGNgcDjeqfz2T?=
 =?us-ascii?Q?Ph4BAkLSlotpwC9Yxk1xS5+hTNUaRDpFDnDktArCgE7ABQqJ0qk1SpFMzS2d?=
 =?us-ascii?Q?1Jr8GARTMc/WXKdQ06OWeBM5ooHoLMKC1hCwQ+mVfSAQztTzooLPqz6+tr2m?=
 =?us-ascii?Q?qKlHjTysLBgqRTcd6Z9sHE+6r7IodX4c2BsQz1C+WrN395yyyE+KcDfxcP4O?=
 =?us-ascii?Q?ePBshvI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mTnjlRTeWmZomwwIiVddLMslHBGHixw4k2W5KtKEJUafifdW6RZ6UEnlyt0C?=
 =?us-ascii?Q?4k+8g+DccytwDpCuTeEcCuswVOHLu1b/r85Ufg7+X0LDCjRmwPk/qbxvdXKP?=
 =?us-ascii?Q?EVEbydzA3sBvlewRfk2mc2vfg7/chWmt3JVIRc/dQbbg2mWMnQjp8QcTpEUk?=
 =?us-ascii?Q?bBaZKyDdLTp0P/nrosHPUM3oi+0vcOrLVbVCPYrGnIiBiEe6UzMgccehtCWM?=
 =?us-ascii?Q?+rvhV7BOemBFP+5DwmAuOBWgZH4NlZypk7WBpmYbQfQyedtpaOQsBZtTY5B7?=
 =?us-ascii?Q?OV5Hll9tQRxM9ThiBgyNm4I9wBaemPnnmBAruGX5EnHjaMRpN9/K4qz1aWvi?=
 =?us-ascii?Q?sU3VWiyqwCfjCdiCMhEXJIqK55yYtphnr1nHNPPRHDX5+jxIyIP6V8gVVYad?=
 =?us-ascii?Q?jiztWPM3/CQflvPHzb+0hkPKOaFnU8kiYCygnB2jzEvyZdwBQXB3IXYafFud?=
 =?us-ascii?Q?JTFWLFJEmb5MNMIM8DcPU80F1IzcrnNuS1n/cwYXPcn/W+mtU2xm8Pv/MeWP?=
 =?us-ascii?Q?+QOd/XDtYwwN70VFchifa6Rt5wNUfaDouyKGlVXdFJ0kuq1f2cLZ+mlpWtGD?=
 =?us-ascii?Q?mPIrGvB7rW4dGBhJrarxL4ZRnvDbeusqOujWqxyprR4123iE0So7XZflVeaN?=
 =?us-ascii?Q?Zhj7og2cUA4F156PBjYR7T1IoYwr8uabtRRJkW1I69hORp6LSgAktlwBwXen?=
 =?us-ascii?Q?KU/UpoO00Q0jx48isqSLcwB9/klDecEEoGNiTq0qfBD3b9vS5ITqmH6+1Dqp?=
 =?us-ascii?Q?RGCya8BDgFz6RmeCHOllkRP9qhf3F5eNdcUECtD9tRoZudWF8WjZATh4dpQh?=
 =?us-ascii?Q?VpRR8lB09eRn2Xui3TSF4R46GULuHAnEW251gbtQDyVPxlwnAkrN+71Cfq4b?=
 =?us-ascii?Q?sHdQGWsUw0G+suqKFxIZzD5p5uVw1vdvVH0lSVlF5VAPHrwJZvwV2iHaGvG/?=
 =?us-ascii?Q?W373nI9JFkkmFCdTnPmLzrRQkvjQTEfOv1VG17Qm2niOTyUZwr2RmgzrSpTZ?=
 =?us-ascii?Q?R9cMgMyCD5jsabv6YDOgLHGCPz9npH+LG0kuwyvmGnDV4wo15vG33CZNQRsG?=
 =?us-ascii?Q?70oh3iuOLxDqIu/CL9COC9il8WAHQRuyJIL27h5PH3tiRbc4EJEpbFR3/3x7?=
 =?us-ascii?Q?6saZiOm1bqHebIo5AIKYQiPq8zmMEzUYnDKjXrs8cfIXT4Xn1c3EBrqeDF5F?=
 =?us-ascii?Q?r2YAXmaRS34saLXHrEdclJhqeQ58Y1KRr4ERLiNVtasdl2YONyO+/8SPm1d8?=
 =?us-ascii?Q?SQ/0JBNvDAM438SkrUMapwAlsSRZ1aAq26mZPaEoGlRS2+Hl7LN8bz26fj6+?=
 =?us-ascii?Q?Vft2+JaPh3e899IsuBaQlGdpMbOYPM+O1WrhsqTx0OdOiQ6J1duooUWasH5l?=
 =?us-ascii?Q?U4Nh76WEKlw1jqXE1nil4XBYRSgktA7qJBhAagwzNtjW5HSSk8Mj8n83EU6q?=
 =?us-ascii?Q?6g/yORMIcSvtNL5mNgaZ0ErznVbqh+8GQ9IGWoOdPs0pQLFC1YcSXy6M9Fqt?=
 =?us-ascii?Q?5SHHT0Zo5iyxgbkPEpxrIzh5IRkRnL34bDKgMs/Xpo/a6TImPjyAjiGMxXCe?=
 =?us-ascii?Q?sT49+Z8C4pW3B5I6SZA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70209ec7-a272-46c7-5531-08dcafc30e26
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 11:39:07.0330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcGC/LNqU1ToPBX/mvfWZm8Vd+TgB6r6eluk91LLk5MCrAg6+QCXU0S9R038s1Q8sQVj1ZZ1pWb5olx62WvEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 11:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202610

A gentle reminder.
This patch can be independently merged and is not dependent on https://list=
s.openembedded.org/g/openembedded-core/message/202425

Thanks,
Dhairya

>-----Original Message-----
>From: Dhairya Nagodra <dnagodra@cisco.com>
>Sent: Wednesday, July 24, 2024 10:14 AM
>To: openembedded-core@lists.openembedded.org
>Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Dhairya
>Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco) <dnagodra@cisco.com>
>Subject: [PATCH] cve-check-map: Add 'cannot-backport' to status map
>
>- Sometimes, the difference in the codebase of the fixed CVE's version
>  and the current version of the package is huge.
>- This would make the backporting of the CVE not a feasible option.
>- And due to other dependencies and limitations, the upgrade of the
>  package might not be possible as well.
>- This commit would allow users to add a description via CVE_STATUS and
>  still show the CVE as vulnerable.
>
>Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
>---
> meta/conf/cve-check-map.conf | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
>index 17b0f15571..b9df41a6f3 100644
>--- a/meta/conf/cve-check-map.conf
>+++ b/meta/conf/cve-check-map.conf
>@@ -13,6 +13,8 @@ CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
> CVE_CHECK_STATUSMAP[unpatched] =3D "Unpatched"
> # use when CVE is confirmed by upstream but fix is still not available
>CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
>+# use when CVE fix is not compatible to the current version and cannot be
>backported.
>+CVE_CHECK_STATUSMAP[cannot-backport] =3D "Unpatched"
>
> # used for migration from old concept, do not use for new vulnerabilities
>CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"

