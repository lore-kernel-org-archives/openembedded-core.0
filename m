Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADB0C3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 05:50:34 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.29803.1721886631858860526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 22:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=amp6cDvD;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=PMX5WB8F;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6204; q=dns/txt; s=iport;
  t=1721886631; x=1723096231;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XvrglqdPRFg/cwsYZHGGe/XDQC++0CnieoIyTpxzLws=;
  b=amp6cDvDsx7tYz4JzPoGw2CQZuuldShfz2x6TcKiUbTU2CX0/A3m9HcO
   6DsaqWoVEglcaiC+CW0CIXPM3Ka0Ey8P92Zh/+SBKd7J4MLaF6B25jX0/
   ZvM42cNF4E7d4cbhPZrznmZIEPXzFVkTbizZee0qKK5mbuyu8L14Jd0Am
   4=;
X-CSE-ConnectionGUID: ISSWIczKTNSZ/mGyqTSP4w==
X-CSE-MsgGUID: MoZVT/jFSwKjsJGpDB14QA==
X-IPAS-Result: =?us-ascii?q?A0ABAACf5qFmmIYNJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBcVJ6AoEcSIRVg0wDhE5fiHADi2GSL4ElA?=
 =?us-ascii?q?1YPAQEBDQEBLgcPBAEBhQYCFokjAiY0CQ4BAgICAQEBAQMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QUBAQUBAQECAQcFFAEBAQEBAQEBNwUOO4V1DYZdAQEBAQMBERERDAEBNwELB?=
 =?us-ascii?q?AIBCBEEAQEBAgImAgICHgcKFQgIAgQOBQgagl4BgjADMQMBoEcBgUACiih6g?=
 =?us-ascii?q?TKBAYIMAQEG2yQNgk8JGIECLgGIHh4BgV2BdYFrhRQnG0CBTYFXgmg+gh9CA?=
 =?us-ascii?q?gIBgV8FM4MhOoIvhiyEKIIshhmDDYMbhDhXD4JcQAOBE4E+fSaOAglLexwDW?=
 =?us-ascii?q?SECEQFVExcLPh0CFgMbFAQwDwkLJikGOQISDAYGBlkyCQQjAwgEA0IDIHEQA?=
 =?us-ascii?q?wQaBAsHd4FxgTQEE0YBDYEqiV0KgXqBLSmBSyaBDIMOgTWDfIFrDGGIWIEPg?=
 =?us-ascii?q?T6BYAGDRUuDaIIBJB1AAwttPTUUGwUEOnsFqTSDHFsIPBxRFBwCOCEWBy0gY?=
 =?us-ascii?q?y+NAYUzJDuCaUqPTJ5TcQoog2yMEo0ydIEJhisXhVukY5htkXmWbAIEAgQFA?=
 =?us-ascii?q?g8BAQaBZzqBW3AVO4JnCUkZD44hGR+DQoUUxyx4AgE4AgcBCgEBAwmKCWEBA?=
 =?us-ascii?q?Q?=
IronPort-PHdr: A9a23:4Qji4RNssmMBXIuWvqsl6nc2WUAX0o4cdiYP4ZYhzrVWfbvmptLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:hr3dvqKgSzAw2NIkFE+R+JUlxSXFcZb7ZxGr2PjKsXjdYENS0DZVy
 TdOD2vXPP2IZjegctsiaYm0o0oP65bXnYVhTAId+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcYZpCCaa/krwWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVvc0
 T/Oi5eHYgP9hGQpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1PN3oJHIYK2dpROlMJ8
 NMJMQw2Vkyc0rfeLLKTEoGAh+wqKM3teYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHP
 IxAMmYHgBfoO3WjPn8bDpsxm+uyj1H0ciZTrxSeoq9fD237l1YriOK9bYaEEjCMbeBSrHik4
 WDoxHvaAAo4G8Sz42PZy1v504cjmgugBdpNT+fnnhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQqK0KeRulzfDWkfRTkHY9sj3CMredA0/
 n6ypOzIDi5MjJuuezWY2aaNkQiKZTdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJYjvdR22YL
 9ei8nRWulkDsfPnwZlX6rwuvt5BjpHNSghw7QLNUyf8tEVyZZWuYMqj7l2zARd8wGSxEAfpU
 JsswpT2AAUy4Xelz3flrAIlR+3B2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RCJ4FMMu8QLZCXwNcebhr5d7ex3kcAM8vy4BpjpgiZmOMMZmPKvpXs3PBXBhQgBbmBxyfxma
 f93jvpA/V5BVPw4l2DpLwvs+bQq3Ss5jXjCXoz2yg/v0LyVIhaopUQtbjOzghQCxPrc+m39q
 o8HX+PTkkk3eLOlOEH/r9VMRW3m2FBmX/gaXeQNKL7aSuencUl8Y8LsLUQJIN08xfUOyb6Wo
 xlQmCZwkTLCuJEOEi3TAlhLY7L0VpE5pnU+VRHA937ys5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:+laghqr7FPUa3dxAMv4ABXQaV5tQLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6HwBEDhex/hHZ4c2/hpAV7QZniXhILOFvAi0WKC+UyvJ8SazJ8+6U
 4OSdkCNDSdNykcsS++2njHLz9C+qjGzEnLv5aj854Fd2gDAM8QinYcNu/YKDwIeOAsP+tAKH
 Po3Ls8m9PWQwVtUi3UPAhiYwHrnay4qLvWJTQ9K1oM7g6IgTm06Lj8PSS5834lOQ9n8PMJy0
 SAtxb2yJmCnpiApyM00VW9071m3P/ajvdTDs2FjcYYbh/2jByzWYhnU7qe+BgoveCG8j8R4Z
 vxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oPb+WCkxB6N69Mdkm1rimg4dVeNHoe
 R2NlGixsNq5NT77XzADu3zJlZXf4yP0CEfeKAo/iZiuMAlGcxsRMQkjTZo+dE7bWHHAERNKp
 gzMCkaj8wmLG+yfjTXuHJiz8erWWl2FhCaQlIassjQyDROmmtlpnFoifD3s01wv67VcaM0rd
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzaVwqSHr4kd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmL0IdQ+h7ATW2hVXDmy91Y5ZJ+prrgLYCbfRGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/0FYNAz2TFKtFvwLklIYQoU/oAKiSzS5jwW/nXX8TgAYHuGIY=
X-Talos-CUID: 9a23:EoRCkGNg2gBELe5DeRJcy28fCOMZVEbvi3L/MlaEMl41V+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AVjrqrQ3a7fNvVCV0mzYuyuXh/TUjxqOcNnxKk7s?=
 =?us-ascii?q?9pOqGLg5fIxu31WiOa9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by alln-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:50:30 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 46P5oUQK026488
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 05:50:30 GMT
X-CSE-ConnectionGUID: ofkrHMBLS8yyTRJCqUqFeQ==
X-CSE-MsgGUID: ZjhV91MjSimzoTfRljOFsQ==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716249600"; 
   d="scan'208";a="15485449"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:50:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUzYugBHexBCFFAmnt42B5lLZQkkW/ZPkhVn8NO83auYqbX8o+VkG4N1zqXOVOVJuNMx0+/cOIIPkgDxdg3ZT0LSH/Q38DFDAvr84V/+/Pi0kEk4kzg1jINEJZ3dXH+03Hy0RPJMmhxp5y/ilQ2PH7b+UHM/hTjCLticNjZRoAKJeQ7jUSBRMyHK4+8bYUPhgr9YKskMdlOPeamt5cb2emhd4c5G1BEUPEILpKidIfdbJNlT/CAiEcGS646mgEE7o2T4fgSdwm2mSm9G//NGppxpkixOUswRRMz6xHvNJfgEF5UKon3eh1Rpm58JYUH7o/oQ/m3sISf9LHpX14ZmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvrglqdPRFg/cwsYZHGGe/XDQC++0CnieoIyTpxzLws=;
 b=MXO2m/FwGgt4Jt+GSh7z+eZKXET9H5XQ3w89IULPMPl+oj4DVWaC/enClZj6N3jikMVJyzmJ6uYhSY0X6s4IVZzWKRCxtZx390i7iRxAvAWYqo3zycWxzHI1IrPpk6dYPeRBz56kCDbP8+igTOZHqcPUFJvwpwYjDK6ZIZqdjKP+gLq03Dft0GbKLQUu7hBnE60IXvIEzDJE7QxnwMVwSVwMjg7piFF5sl16tPtffWFrDLFOgPV+L5NuPRQqN4UddKxQZccX8oQgjw7qWVaUoaZFsc4tFS9RBA3sKJQueVwamgGiFSq0VuGQHsju5Ge3ylT2YKeKlkuuQRr7QySNqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvrglqdPRFg/cwsYZHGGe/XDQC++0CnieoIyTpxzLws=;
 b=PMX5WB8FPkyr8KLBuKLJAntAxUacyambluUoANGdR4lofEyRwkrirHkOlWGwFnT/pIkQNns5CfF8gOQu520F+svLEUyS62gYLpJLuhU77oNVB2qh3RLxjottPuYNEnRjXTfDINReO2mOurxXPwgZV0W2Rzwocd+/ELNtzEAZZOU=
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Thu, 25 Jul
 2024 05:50:28 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896%3]) with mapi id 15.20.7762.020; Thu, 25 Jul 2024
 05:50:28 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Marta Rybczynska <rybczynska@gmail.com>,
        "Marko, Peter"
	<Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Topic: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Index: 
 AQHa3YRHiRZeDkJzN0OXxSVyh6EHW7IFa/cAgAABQJCAACPLgIAAe+qAgABliICAAHVcIA==
Date: Thu, 25 Jul 2024 05:50:28 +0000
Message-ID: 
 <SN7PR11MB69711F1E679AA519A862338AD4AB2@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
	 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
	 <f54a3d6f471e2e612e693e79d0ef351d6274357d.camel@linuxfoundation.org>
	 <CAApg2=Q2pLxPL0EXH1URPBACknO9Gz0R1Ux_mK8Lp3p5H5zvpA@mail.gmail.com>
 <078214f14849ba7ca8f5017ebdeed1dc66cf91c8.camel@linuxfoundation.org>
In-Reply-To: 
 <078214f14849ba7ca8f5017ebdeed1dc66cf91c8.camel@linuxfoundation.org>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|BL1PR11MB6004:EE_
x-ms-office365-filtering-correlation-id: 883b9853-605d-4fec-2a67-08dcac6dafde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TEZIZ2ZobHhTWDFLWE50VERRb2pZL3hEREc3UndFMjlhQ3BnWkhQaXZLVEIr?=
 =?utf-8?B?WXB2c1k4V1Vtcmt4YVU0OTdzU2t3NS9ZRHpDYmZrUDRZN2t1dzBZaUJZNWdS?=
 =?utf-8?B?eHdMODVMaW9RVWZLL2xIMTZxU1JOdmNlZDNVV1IzTEFPUkJPVlo5RUlBSkVR?=
 =?utf-8?B?Ri9KR2lMbDBqZHdQU3ZEcmRSbHpQeVUyTThQeWxNSFMzcXJYWHdncm50YlVK?=
 =?utf-8?B?RFZMUi9BWUhiZXV2YXdxcVFqNkVWQ2JPN2dRT1A0ZmN0WnVTYXdtWVc3Rk1x?=
 =?utf-8?B?NGRtVWFTcnd1NlAwdXR5OW9YUXRMWlBRZW9ncnRtdDkwVERKRW9NUWxZWGlG?=
 =?utf-8?B?cWhkdk9SaVZBRy9hdjY5MWlNc1p4OTdBektWdG8wa1hZQjc3WE5DTDNKUE9M?=
 =?utf-8?B?K0g2TlNRQzl4Y0NSVUVOYks0N24zdWM4M2hVTVdFWHVuZ3dRNFpMSHk4YVB2?=
 =?utf-8?B?WGdIc1RCa05FSnBQSytxNGVPYWk2WGt2WUR1MlpRWGFsQTlmR0hqV3NqOGEw?=
 =?utf-8?B?NTdzRFJGVVRuckYzNDg2ZmI0TFI5UFQzMkxZLzNkaWN5MTQzNTltUDRQUGJa?=
 =?utf-8?B?YUo1bzluSEREejBNWVFuM0tsdW4yZFRwZ290R1VSYTY2blh6R2VrcStrSGpB?=
 =?utf-8?B?Y0VCSlIzTmQ0STR1cldZdnIvblFkVThyWlhJSlZlVjFBd1lkMTdFcWU4NDd0?=
 =?utf-8?B?U0VKNXFBM1BHK2p1ZTlzTys3MlRySE4zNWVuRERlWmFlV2p1U1FPMXYvTFpX?=
 =?utf-8?B?MlVvTm01T3ZZbmhYVWQzRlZYaElSWXN3TVNxWm9xVUNnY3o3VkJXT1o1ODFp?=
 =?utf-8?B?SzBod21oWC8wRjN3a2IwakUzSG5jZkdWYi9lNU1hanA1eEkwNTBHV1FXV1NW?=
 =?utf-8?B?UTZNOWc1cXpJbWVNOGFMZEdvc2JIRTIwWXpLTW04eXhWTTlGUUYxWjZXYmZY?=
 =?utf-8?B?RVdjVkVqWWRMclAyblRqNVZ4THpsWFhjVE1JRk1zMnFSN0w0VGx6MytYaE9N?=
 =?utf-8?B?WnRNT1UrTWNyM2N0a2h5UitPcGR1VnR4TEJWSVozVzBWaW04WDFKdDdMVkw0?=
 =?utf-8?B?U3ZnMDJ1Z2J0em5zSUk0ZDZFUlFqKzZtQ0pzVXdMRDZpNnJqYzczakZqZnhZ?=
 =?utf-8?B?aldzdlFmOElaRU1KMmZYZ1dLRkJ0OXhqeHMrL2pKemgwTE9aSmUvRTVqMWY2?=
 =?utf-8?B?R0ZGSmxvSGxHSkJ3aVMyNE91NHFiWmZSVEIrcXFTbVdRekhraGw0bXowd1Z3?=
 =?utf-8?B?OEsxd2pvT3dVTFlubm96clorZkFiU2FJMDRrWlArOXBzZlcxV1VLRzJUUHdn?=
 =?utf-8?B?REtoM2dDRzUzV3dvbUh2K0tURHJVVzJXbW5tbnJCNE5lVzNXTWc4L0w3ekN6?=
 =?utf-8?B?eGE2cUZpeFJEbFd4Um1vWklncEx5NWpLZTQzUEY2Sy9UNTA4NVZBdkdZSUdQ?=
 =?utf-8?B?K2I1emVOUHBpYURPRlp4SWNVb2RrVzdLZkZheEFDb055MVcwenUrYS91NE9m?=
 =?utf-8?B?WkxWU2h3NndHR2lLdURBazE2b0Y2cHV2TnZhWlNVME1jTlNCUXBTUmhtSjRl?=
 =?utf-8?B?MEZsTFE5MC94N29IclIvWTc1N0Z0OHZ0WjNFRHZKM1BOMmFJVjM4Kzl5ZW8y?=
 =?utf-8?B?QXRRbHVCWU5OR0ltWkErTDN5TnFqWDd0T1FibjZKWmllbG4rKzRDQitRQmJm?=
 =?utf-8?B?WStMTTdMRXhkQ2FSU05sYVZ4bXFWb1BQdXBrREl4Y3p3TVpFbDRCdGYxZTFX?=
 =?utf-8?B?bkd5bDBaU21XWHdlOXV0RE1pUTdQeVg4WXdsUzZQSjQ0Y3NKYlZVSUJQdkk1?=
 =?utf-8?B?ZWdtRXZQbGJETGY4TXBsTVpvd3BOMHZlM2p3Z0NNOVlMbXV4QlJMbGhOd2Mw?=
 =?utf-8?B?QVp3RGUvSnFqQ2hUTDkwS1dJLzNUbTRBWjk2NjhPclZZakE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cCtpT0dreWlQOTVRK3dZamJKVXdQV05LT0tXQjNPME5pMkFNWDZTTUp2V2I3?=
 =?utf-8?B?OUs4TXVadjJiNnZoYnZ2eUlBTzVsSWNiZnB5Z3V0MXRuWmdXYjJKNlp1YlRx?=
 =?utf-8?B?Q3k5Zi81SXNtTFVXem9hTHdmbU1WeUpaWTFvQkxkTzQwa0QvaGFHL0hOd0JS?=
 =?utf-8?B?cEdJLzB3VTRaakJ5STRMM2ZKUUdialRjM1M3dVEybEIrQ05xcnNHN1hGcmdJ?=
 =?utf-8?B?a1FPUzQrM0JmREZ6ckRPVVI2RzRaa0xLSnF3aFhMOURDS2MzNThndXJIVm9B?=
 =?utf-8?B?NkYxdWhhbklnNC9QWjlkb2FQbjdFNXR4Rm45NU5KUGhSbHE5R3BqMEVJY2lS?=
 =?utf-8?B?YzdiL0poMTlLVDNleURtNmtuVVZ2QU5FK3ZTRW9YaGUxeWpFQnJNTVg3N0R5?=
 =?utf-8?B?Q1kraTdqMkwvK3JwQmlSNjgvNU9rbHQ3SDNPN1I2UWdVYklsR3F4QkI3VnM3?=
 =?utf-8?B?S0djSWkzcUo4M1hNamR3cHlxOGx0YVlYS0Rna2h1QkpsK1pnZWlmZ2g4Y3Jj?=
 =?utf-8?B?WDZWTEdiQWdlN3o5SHdIeVRuaUs4RU90OHBwKzg5Vk9Dc1dqUDJnZVFYanlL?=
 =?utf-8?B?VFZBRloxUkJzbURGQThibWxrNWZ1M1JOK1RlMEppb1Zja3ppRzFiYXZQNXBz?=
 =?utf-8?B?RkZCVk9Fdm8rQ05nZHliSm1iZG5KbXlKdFE4SkUycTdBenhJazhDaWxKcUtp?=
 =?utf-8?B?aFAyNGZQL050aWRSWlN4YkxNbUprdCtrOGpYaTIwQ0RPbDl1U0ZxL1ZsdmZJ?=
 =?utf-8?B?eWZaMkJEYjUxRmVJcC82Z3JWRnNhN2hjUkZMMEtLQjRlZ2ptNlN1L2wwSHlt?=
 =?utf-8?B?QUpPczJyTHFjNnByWkE5S0Rlc2lXSTFBbnFMdnZzLzJWZ2dLMnBVRG5wUEYv?=
 =?utf-8?B?dlBRVzNWNEFhbzRJVHQxcmxlQUhWMjFSbmdYRGdOVW00eklxSnV5MitOcjJW?=
 =?utf-8?B?V2RJb0Z2SE9majF0Vk9LamYzTm04MFRaYW8vN0t0SWtIREdybTI4c1ZCcUhC?=
 =?utf-8?B?NFVlelc4UXFsY2wweHRrOWZRSG9hdFZSSExjUDJZMTNxK1diUGtZYWZURU9q?=
 =?utf-8?B?elpSekJmajh4NDNYVGxIYUJvRzBNT0tJVjdqUnVGcnI0UTRXQ25oZEdYZE84?=
 =?utf-8?B?NHlybTZhN091RWcxUG43ZlJTeG52OHBiUGcwNmJxMUxWMm1lR0Nyc3lFRVI2?=
 =?utf-8?B?N0VyeFdQQjRXWjZaTlRvd1dpbnptdWxTcWt3SmNjOXVHQjEvVE9XNjk5aGJo?=
 =?utf-8?B?QUlMZEtyQlBjVW5laFRFSzI1YjBEOXp4TmU4ZS9oU3dwWldSRW5VMkx1Y21M?=
 =?utf-8?B?S2lyVXhtVnZqWjcvSWYvVjl1SkhBeDVmUE9JeVlDbUNZOXJGWDF1Y21WbXVX?=
 =?utf-8?B?OEZqOFhjOE1DWFJhcEZRL0kySEhFdmZwdHdLMzdVRjFDK1pYWnhZM1QzT2Zw?=
 =?utf-8?B?cGNzTnBydlh2Z0RHZmxHNVB0K29pZkxzWTFiWW9kSE1kZ2tsT0QwWEJzZXg4?=
 =?utf-8?B?TmdPT3pOYUtVdlFMSmQ1VjdqczRKQldjbkJFU1laUjVCSU9EUVFzTkhQVUlF?=
 =?utf-8?B?eUxKSVNwK3VCYVh4NUVhY0dER3ZDYVBVVmc2b1Q0c29JZWpQcVU4T3I4bndK?=
 =?utf-8?B?SUFmcXFqMEhvU3JjM2duM2F0ZW5YM2JvTjRBL2kvZmFVOVlwdGNJVlYwZktw?=
 =?utf-8?B?NU92U0lyZHMvM3puYmVETFRQNko3bThMRy8yMTdBcGFsSnN4UnpMSDVUSEJu?=
 =?utf-8?B?QzRYZ1dubk5hYm9vcW1TSU5FN0plK2I0dGo0QUpwZDZPaUtXRXUxOFg1cy9E?=
 =?utf-8?B?RVVSZ2tlZU1pdFFpWFlZdGZwaHBybmk2b3dTN2QyNitvUGE5ckhLamlYTnVv?=
 =?utf-8?B?Wk1oRTFGWEt5VFdlMHhnSHhnWkw2eWo2MkI2V2JYTTdKcmRZYlRmZHI1QlVF?=
 =?utf-8?B?ZUZJRlNsREFVY1NUVlU2d0w0c1hDUmVNdWJrcDhoektYZDI0U0d4V01LVTkw?=
 =?utf-8?B?ekNoSHJPUEttTUZqb25qVExibjk4SVlIQWRIZGZhaWpoN080VlVYTkhPc0tk?=
 =?utf-8?B?QWR6TnhwbkRLWUQ1dWRMNm9MZFQ3dTBrK2JqVGkzLzRoMDArR0cvL0FRS3kv?=
 =?utf-8?B?UlRvb3FRUWZ2ZjVzMkUvWG1UQ3Jpc042YnB4K3lsdENHakVkdWl6VnJUbFdP?=
 =?utf-8?Q?DoNquBh3SIVXOgySJ1SUKkGvaOQ6uN4dWn6HfR8+bCIr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883b9853-605d-4fec-2a67-08dcac6dafde
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 05:50:28.1211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I9Tso4XjmmF38/2BNgwftY+UNJ7YSKK+v2XEtu4RDK6/meXuC9g452opNlXSXAQzcOI/Piw4Z5Mbe2ymFdpxSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 05:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202493

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPlNlbnQ6IFRodXJzZGF5LCBKdWx5
IDI1LCAyMDI0IDM6NDQgQU0NCj5UbzogTWFydGEgUnliY3p5bnNrYSA8cnliY3p5bnNrYUBnbWFp
bC5jb20+DQo+Q2M6IERoYWlyeWEgTmFnb2RyYSAtWCAoZG5hZ29kcmEgLSBFLUlORk8gQ0hJUFMg
SU5DIGF0IENpc2NvKQ0KPjxkbmFnb2RyYUBjaXNjby5jb20+OyBNYXJrbywgUGV0ZXIgPFBldGVy
Lk1hcmtvQHNpZW1lbnMuY29tPjsNCj5vcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnOyB4ZS1saW51eC1leHRlcm5hbChtYWlsZXIgbGlzdCkNCj48eGUtbGludXgtZXh0ZXJu
YWxAY2lzY28uY29tPg0KPlN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBjdmUtY2hlY2st
bWFwOiBNb3ZlICd1cHN0cmVhbS13b250Zml4JyB0bw0KPiJVbnBhdGNoZWQiIHN0YXR1cw0KPg0K
Pk9uIFdlZCwgMjAyNC0wNy0yNCBhdCAxODoxMCArMDIwMCwgTWFydGEgUnliY3p5bnNrYSB3cm90
ZToNCj4+IE9uIFdlZCwgSnVsIDI0LCAyMDI0IGF0IDEwOjQ24oCvQU0gUmljaGFyZCBQdXJkaWUg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj48cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0
aW9uLm9yZ0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+ID4NCj4+ID4gVGhpcyBp
cyBmYXIgZnJvbSBzdHJhaWdodGZvcndhcmQgdW5mb3J0dW5hdGVseS4NCj4+ID4NCj4+DQo+Pg0K
Pj4gSSBhZ3JlZSBhbmQgYWxzbyBhZ3JlZSB3aXRoIERoYWlyeWEuIFdlIGFyZSBmYWNpbmcgdGhl
IHNhbWUgaXNzdWUgd2l0aGluIHRoZQ0KPlZFWCB3b3JrLg0KPj4gQW5kIHRoaXMgaXMgZ29pbmcg
dG8gY29tZSBiYWNrIGluIHRoZSBjb250ZXh0IG9mIHRoZSBDUkEuDQo+Pg0KPj4gPg0KPj4gPiBT
b21lIHBlb3BsZSBhcmUgdXNpbmcgdGhlc2UgbGlzdHMgYXMgImFyZSB0aGVyZSBhbnkgaXNzdWVz
IHdlIG5lZWQNCj4+ID4gdG8gd29ycnkgYWJvdXQ/Ii4NCj4+ID4NCj4+ID4gSW4gdGhhdCBjb250
ZXh0LCBpZiBhbiB1cHN0cmVhbSBoYXMgYXNzZXNzZWQgYSBDVkUgYW5kIGRlY2lkZWQNCj4+ID4g
bm90aGluZyBuZWVkIGJlIGRvbmUgYWJvdXQgaXQsIG91ciBkZWNpc2lvbiB0byAiaWdub3JlIiBp
dCBpcw0KPj4gPiBjb3JyZWN0IGFzIHRoZXJlIGlzIG5vdGhpbmcgdG8gYmUgZG9uZS4NCj4+ID4N
Cj4+DQo+Pg0KPj4gVGhlIHByb2plY3QgbWlnaHQgaGF2ZSBkZWNpZGVkIG5vdCB0byBmaXggZm9y
IG11bHRpcGxlIHJlYXNvbnMuIFNvbWUNCj4+IG9mIHRoZW0gbWF5IGJlIGdvb2QsIHNvbWUgbm90
Lg0KPj4NCj4+IEkgZG8gbm90IGNvbXBsZXRlbHkgYWdyZWUgdGhhdCB0aGVyZSBpcyBub3RoaW5n
IHRvIGJlIGRvbmUuIFdlIG1pZ2h0DQo+PiBkZWNpZGUgdG8gdXNlIGEgY29uZmlndXJhdGlvbiBv
cHRpb24gdGhhdCBkaXNhYmxlcyB0aGUgdnVsbmVyYWJsZQ0KPj4gZmVhdHVyZS4gSW4gdGhpcyBj
YXNlIHRoZXJlIGlzIGFuIGFwcHJvcHJpYXRlIHN0YXR1cyB0byBwdXQuIFdlIGNhbiBkbw0KPj4g
YW4gaW4tZGVwdGggYW5hbHlzaXMgYW5kIGZpZ3VyZSBvdXQgaWYgdGhlIHZ1bG5lcmFibGUgY29k
ZSBjYW4gYmUNCj4+IHJlYWNoZWQgaW4gb3VyIGNvbmZpZ3VyYXRpb24uIElmIG5vdCwgdGhlcmUg
aXMgYW4gYXBwcm9wcmlhdGUgc3RhdHVzIHRvIHB1dC4NCj4NCj5JJ20gd29ya2luZyBvbiB0aGUg
YXNzdW1wdGlvbiB0aGF0IGlmIGVpdGhlciBvZiB0aG9zZSB0d28gdGhpbmdzIHdlcmUgdGhlIGNh
c2UsDQo+d2UnZCBoYXZlIGRvbmUgdGhlbSBpbiBwcmVmZXJlbmNlIHRvIHRoZSB3b250Zml4IHN0
YXR1cy4gVGhlIHdvbnRmaXggc3RhdHVzIGlzDQo+dGhlIGxhc3QgcmVzb3J0IHdoZXJlIHVwc3Ry
ZWFtIGRpc2FncmVlcyB0aGVyZSBpcyBhbiBpc3N1ZSBvciB0aGF0IHRoZSBpc3N1ZSBpcw0KPmFu
IGFjdHVhbCBwcm9ibGVtLg0KDQpBcyBwZXIgbXkgdW5kZXJzdGFuZGluZywgd2UgaGF2ZSAnZGlz
cHV0ZWQnIHN0YXR1cyBmb3IgdGhlIGFib3ZlIG1lbnRpb25lZCBzY2VuYXJpb3MuDQooV2hlcmUg
dXBzdHJlYW0gZGlzYWdyZWVzLCBvciB0aGV5IGRvbid0IGNvbnNpZGVyIGlzc3VlIGEgcHJvYmxl
bSkNCg0KQmVsb3cgaXMgdGhlIHNuaXBwZXQgZnJvbSB0aGUgY3VycmVudCBjdmUtY2hlY2stbWFw
LmNvbmYNCiMgdXNlIHdoZW4gdXBzdHJlYW0gZG9lcyBub3QgYWNjZXB0IHRoZSByZXBvcnQgYXMg
YSB2dWxuZXJhYmlsaXR5IChlLmcuIHdvcmtzIGFzIGRlc2lnbmVkKQ0KQ1ZFX0NIRUNLX1NUQVRV
U01BUFtkaXNwdXRlZF0gPSAiSWdub3JlZCINCiMgdXNlIHdoZW4gdXBzdHJlYW0gKmFja25vd2xl
ZGdlZCogdGhlIHZ1bG5lcmFiaWxpdHkgYnV0IGRvZXMgbm90IHBsYW4gdG8gZml4IGl0DQpDVkVf
Q0hFQ0tfU1RBVFVTTUFQW3Vwc3RyZWFtLXdvbnRmaXhdID0gIklnbm9yZWQiDQoNCj4NCj5JbiB0
aG9zZSBzaXR1YXRpb25zLCB0aGVyZSBpc24ndCBtdWNoIHdlIGNhbiBkby4gVGhlIHN0YXR1cyBp
cyBzcGVsdCBvdXQNCj5zZXBhcmF0ZWx5IHNvIGFueW9uZSB3YW50aW5nIHRvIGZpbmQgdGhpcyAi
Y2xhc3MiIG9mIHByb2JsZW1zIGNhbi4NCj5Ib3cgdGhleSB3YW50IHRvIG1hcCBhbmQgZXhwb3J0
IHRoYXQgaW50byBsb3NzeSBmb3JtYXRzIGlzIHVwIHRvIHRoZSB1c2VyIGFuZA0KPmNvbmZpZ3Vy
YWJsZS4NCj4NCj5UaGUgb25seSAiZGVjaXNpb24iIHdlJ3JlIG1ha2luZyBpcyB0aGF0IHdlIHdv
bid0IHNob3cgdGhhdCBzdGF0dXMgYXMgIm9wZW4iDQo+b24gb3VyIHN0YW5kYXJkIGxpc3RzIGFz
IHNvbWVvbmUgaGFzIGxvb2tlZCBhdCBpdCBhbmQgZGVjaWRlZCB0aGVyZSBpc24ndA0KPmFueXRo
aW5nIHRvIGJlIGRvbmUgKG9yIGNhbiBiZSBkb25lKS4NCj4NCj4+ID4gT24gdGhlIG90aGVyIGhh
bmQsIHRoZSBDVkUgaXMgb3BlbiBhbmQgdW5wYXRjaGVkLCBzbyBsaXN0aW5nIGl0IGFzDQo+PiA+
IHVubWl0aWdhdGVkIGlzIGFsc28gY29ycmVjdCBpbiBzb21lIHNlbnNlcy4gVGhlIHByb2JsZW0g
aXMgdGhhdA0KPj4gPiB0aGVyZSBpcyBubyBwbGFubmVkIHdheSBvZiBtb3ZpbmcgZm9yd2FyZCB3
aXRoIHRoZSBDVkUsIHNvIGl0IHdpbGwNCj4+ID4gc2l0IGluIGEgbGlzdCBvZiBvdGhlciAidW5w
YXRjaGVkIiBDVkVzIGFuZCB0aGlzIGRpbHV0ZXMgdGhlIHZhbHVlDQo+PiA+IG9mIHRoZSBsaXN0
IGFzIHlvdSBjYW4ndCB0ZWxsIHdoaWNoIG9uZXMgYXJlIGJlaW5nIHJlamVjdGVkIGJ5DQo+PiA+
IHVwc3RyZWFtIGFzIHdvbnRmaXggYW5kIHdoaWNoIG9uZXMgYXJlIHJlYWwgYW5kIG5lZWQgYXR0
ZW50aW9uLg0KPj4gPg0KPj4gPiBXZSBrbmV3IHRoYXQgcGVvcGxlIHdvdWxkIGhhdmUgZGlmZmVy
ZW50IHZpZXdzIGFuZCBuZWVkcyBvbiBob3cgdG8NCj4+ID4gaGFuZGxlIHRoaXMsIHdoaWNoIGlz
IHByZWNpc2VseSB3aHkgdGhlIG1hcHBpbmcgdmFyaWFibGVzIGV4aXN0LiBZb3UNCj4+ID4gY2Fu
IGNlcnRhaW5seSBjb25maWd1cmUgdGhpcyBhY2NvcmRpbmcgdG8geW91ciBuZWVkcyBhbmQgdGhp
cyBtYXkgYmUNCj4+ID4gYSBjYXNlIHdoZXJlIHlvdSdkIG5lZWQgdG8gZG8gdGhhdCBhcyB0aGVy
ZSBpc24ndCBnb2luZyB0byBiZSBhIDEwMCUNCj4+ID4gcmlnaHQgYW5zd2VyIHdlIGNhbiBoYXZl
Lg0KPj4gPg0KPj4NCj4+DQo+PiBJIHRoaW5rIHRoZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCB3ZSBo
YWQgdXNlZCB0aGUgIklnbm9yZWQiIHN0YXR1cyBmb3INCj4+IG11bHRpcGxlIHJlYXNvbnMgaW4g
dGhlIHBhc3QsIGFsc28gdG8gYXZvaWQgaGF2aW5nIGEgbG9vayBtdWx0aXBsZQ0KPj4gdGltZXMg
YXQgdGhlIHNhbWUgaXNzdWUuDQo+Pg0KPj4gQWdhaW4sIHRoZSBDUkEgaXMgZm9ybWFsIGhlcmUs
IGFuZCBkb3duc3RyZWFtcyB3aWxsIG5lZWQgdG8gcmUtYW5hbHlzZQ0KPj4gYWxsIHRob3NlIGlz
c3VlcyAob3IgZGlzYWJsZSBhZmZlY3RlZCByZWNpcGVzKS4gRWl0aGVyIGRvd25zdHJlYW1zLCBv
cg0KPj4gd2Ugd2lsbCBkbyBpdCBhbGwgdG9nZXRoZXIuLi4uICh3aGljaCBpcyBhIGJldHRlciBv
cHRpb24gSU1PKS4NCj4+DQo+PiBUaGVyZSdzIHRoZSBzYW1lIGlzc3VlIHdpdGggc29tZSBvdGhl
ciBzdGF0dXNlcyBsaWtlICdkaXNwdXRlZCcuDQo+DQo+WW91ciBhcmd1bWVudCBhcHBlYXJzIHRv
IGJlIHRoYXQgd2UgYXJlbid0IGluIGEgcG9zaXRpb24gdG8gbWFrZSBhbnkgZGVjaXNpb24NCj5v
biB0aGUgc3RhdHVzIG9mIGFueSBDVkUgYW5kIHdlIGNhbid0IHNoYXJlIHRoaXMgd29yaywgaXQg
aGFzIHRvIGJlIHB1c2hlZCB0bw0KPnRoZSBlbmQgdXNlciB0byBkbyBvbiB0aGVpciBvd24gYW5k
IHRoZSBDUk0gbWFuZGF0ZXMgdGhhdD8NCj4NCj5JIGRvbid0IGJlbGlldmUgdGhhdCB0byBiZSB0
cnVlIGJ1dCB0aGF0IGRvZXMgYXBwZWFyIHRvIGJlIHRoZSBjYXNlIHlvdSdyZQ0KPm1ha2luZyA6
KC4NCj4NCj5DaGVlcnMsDQo+DQo+UmljaGFyZA0K

