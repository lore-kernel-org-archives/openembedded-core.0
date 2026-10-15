Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3321CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 08:28:11 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34586.1792052885417939381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 01:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V8LNcboQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9546; q=dns/txt;
  s=iport01; t=1792052885; x=1793262485;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=lmm0puB7oPXVRX0X6jNp82RdRjpUVuyZ5zdVdbESBRY=;
  b=V8LNcboQRaSU0tYzpS3Fh7i/lShbKt6iatDRNTDz2SgqCIoxUpij7zOX
   vMX17ePZ7jhOm7kJ7c1ppzeYDOVydzLR39K4GjmRMIjixHl92Feqa4YAC
   SlAny33EQS1IzKVp9b0XvjCjD07FjItBDI+9+rDJ6/BGMZhqTDDwBFIpC
   Ms7zlw5yvFVCcd2de8SoM9Ljceg2hs0yRVZFb41o4uC4/bsfcQ5rUE8gf
   0ChRPqYcWemI74MBMJGQESWRwwzlKDWUn8vinVFHPSvEhr4RuB36xmFWV
   8too2WQLP7mzjc8bQXHiuvGEsSScw+1HwLxpM5wZAIzQHUqoDXjl1q8cY
   Q==;
X-CSE-ConnectionGUID: JH8pSnGBSc+2OssuAIYTmg==
X-CSE-MsgGUID: uu1Ll2WGQ4+KmIbIDqc6dg==
X-IPAS-Result: =?us-ascii?q?A0A5BABhjtBq/5MQJK1agS6BK4E9MVOBCQKBERJJBIgfA?=
 =?us-ascii?q?4UrhliCIQOeHIF0Cg8BAQENAi4BFQ0EAQGFBQKOFAImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDASYkAT0CAQgRBAEBA?=
 =?us-ascii?q?S4nCh0IAgQBEgiCe4IdFkEDAQIOBrBuAoodeIEBM4EBgykBPwICQAHcDhQBg?=
 =?us-ascii?q?TiFQIMDGwEBBSZJbIJdgSMYAYR8JxsbgXKBFUKCaT6BBYFcAgEBAYE0BwEBI?=
 =?us-ascii?q?oQTgjAEgiJ6EhuCQkqTY1JyIgMmMywBVRMXCwcFgSUQMwMqLy0jSwUtHXAMJ?=
 =?us-ascii?q?xIPHRcRHlgbBgUSICpBQ12BWjwjGTZ6gQlegSspYQIOF0YuFYIHAoJUgSNdA?=
 =?us-ascii?q?gFJQQ4HRVMJJT4FEkcmIggSCQETGjALgRs4PAkoQRcMZQ4MHQUhUQgCCwIJD?=
 =?us-ascii?q?W09NwYPGQMEgTUFkRAHWx6CGE0BYC0BKQJPCYEuN5M8j0Cjdwoog3aKfIEmj?=
 =?us-ascii?q?T6IMheFW6UUmQgjjWeVX4UuAgQCBAUCEAEBBoFoPIFZcBWDIgkWNBkPkiSFE?=
 =?us-ascii?q?4Etx3p5AgEBBzIBAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:PVXSkR0gcDlxzOaPsmDPmlBlVkEcU/3cNwoR7N8gk71RN/jl9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:k3gvzahurJeXfXpdZAm/NKNIX161OBEKZh0ujC45NGQN5FlHY01je
 htvXmmDPaqKYTPzfdglaYuxpk4Cv8eDzIBnSVc5rC4wFXtjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/ve8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU62rZvOmdh3
 8cTa2oqdQuersOH/Le0H7wEasQLdKEHPasWvnVmiDWcBvE8TNWaG+PB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZT/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFJYDRFZ8KxhbwS
 mTu4nmgJhVAC/OmlXmm91Omp8PWln33V9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1dFnhKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:VizkR6hgyKCKgdZAFmyy3VqChnBQX9N23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sda9qBPnmaKdkrNhQ4tKPTOW9FdAQ7sSlrcKrweQfxEWs9QtqZ
 uIEJIOR+EYb2IK9/oSiTPQe71Psbv3lZxAx92uskuFJjsaDZ2Imj0JcjpzZXcGPTWua6BJc6
 a0145snRblU3IRaciwG3kCWMb+h/CjrvjbSC9DLSQKrC2Vgx2VyJOSKXWl9yZbfyJEwL8k/2
 SAqArk+6Wlvci8zx/Xx0XT455VlNaJ8KoMOCWLsKcoAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6lvKF1vF4SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZ0Uw9p9txuZ
 g7nF5x9qAnTy8orh6No+QgZCsa0XZcZkBS19L7ukYvFLf2roUh9LD3snklSKvoVxiKmbzPWN
 MefP00oswmMG+yXjT+onRlxsCqUzAYGxeLRVVHh+muugImx0yQCyAjtZEidrBqzuNmd3FJit
 60QZhAhfVASNQbYrl6A/pEScyrCnbVSRaJK26KJ0/7fZt3cE4lhqSHqYnd3tvaMKAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79wh04eMCYbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7vmIXH1EYhE0gXiU91ZKGUYUscSptEnMmj+6P7jO8nvrKjWYfzTLL3iHXItXX7+GG
 IKWHzpKMBJ/imQKwnFadjqKgTQk2DEjOZN+fLhjpouIaA2R/hxjjQ=
X-Talos-CUID: 9a23:S5SDDmwCCfMReWUen/gJBgU2OpA9SXvy5kzbYBWfEn10YZykdVqfrfY=
X-Talos-MUID: 9a23:yB1kLws8ncGSi6H0tc2nmSw7EMMy3IuXVAMulLQMmuWdPnJ8NGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 08:27:45 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 14E6E18000154
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 08:27:45 +0000 (GMT)
X-CSE-ConnectionGUID: xAVJX1E5Sxu5gCj8HBqm5Q==
X-CSE-MsgGUID: b6IaZXANSgi7XFGMm05ibA==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208,217";a="89857474"
Received: from mail-eastusazon11012069.outbound.protection.outlook.com (HELO BL0PR03CU003.outbound.protection.outlook.com) ([52.101.53.69])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 08:27:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpRKc885MAeyMVeYYIJZHt0alP7QNYIIaF7gKSvhLh2TRV0jMXAPf0JOBi1lSIOylkUu/0htCDM6jk2pXCyP7bIi+/H6pBWbwNUZqMgUfgQFQF/jFJVU27AKOMqxXIYIPoHazmTiVmzMvrnonaP+DNmaujNvxevtQOSsa0kPvcjzkMBAoW8ICsC9ini3aeqObXcdBAobMKc/ngHJi08IWPBqfNzOKkguVsTRY5msvaOFeNN97bgvymSDwqW/ES/EWneMh8V3tU0syqCaubZpzpjDnTrSGXC8L2BWskk3Pd3NcP2KxRuqBVB7sn4XWrxG+H82V1S/sYysaL59+8+UjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmm0puB7oPXVRX0X6jNp82RdRjpUVuyZ5zdVdbESBRY=;
 b=k0z5WqpH/T8RlFstoD5fmcBr8fiGXlyOyYu1QILHfN7yoEUxhm9JEk+wyEuOwDu6AauxxBYupRi0AfIZjP/h5Wg9VP4KfaiG6EdyYO0M1betRh7MwQM910c50B42dS0mJheXOSlQuwPULtDPuLefsc9lto0kwCJNutNSCOPZR8A2WdbJYTqqP79eAKcKmLAlGOAMUnsPMDdWDMYss9eqJFjX/U+UaZM/lvP+TWtI6mIJdBp86sqn1aB90TwtjKWh9JYHmQHRI+n3JSUbNEpIFt2EkurbuQ8uvyl30Nei1qOHqX7294GN9L+WcvAka+so6cm6ddb11CEe6lDPxb7YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 15 Oct
 2026 08:27:42 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 08:27:42 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 5/8] curl: fix CVE-2026-8927
Thread-Topic: [OE-core][scarthgap][PATCH 5/8] curl: fix CVE-2026-8927
Thread-Index: AQHdW07kcwmugYrvAEabOGHfYFKOG7b+GvVE
Date: Thu, 15 Oct 2026 08:27:42 +0000
Message-ID: 
 <PH0PR11MB76163B9949BBA5FD283D5A76D39C2@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20261007112403.486499-1-devanshp@cisco.com>
 <20261007112403.486499-5-devanshp@cisco.com>
 <DM3ZEZORCSRZ.27QK3IA59S0GQ@smile.fr>
In-Reply-To: <DM3ZEZORCSRZ.27QK3IA59S0GQ@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|DM6PR11MB4721:EE_
x-ms-office365-filtering-correlation-id: dcfbd492-73ef-4f3f-722f-08df2a962ecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925021911599003|4143699003|38070700021|261009223027099003|56012099006|11063799006|260925021311599003|260925022911599003|6133799003|10067099003|13003099007|18002099003|8096899003|22082099003;
x-microsoft-antispam-message-info: 
 95wSs0DzAmcmYoBt+o2XKpCDBm+2/T0MyUq01g4bbsKkj72l/LWpyk1pt+HAXgGl7UIYH1rOmcQKa4INubCYnwSRUHWHvSuMpymyPINyJnf4oQ3bVyY+dqdDhIckrDCoIq2mBWKyK9K0xhvlTcsN8zZ6SmxrgeZacyGaq2+KT3t7m5eesDlRfb89Yoirx7wYoEBw9dGyHhdGbFYW2IxRMevgpszPlB1FQmaQOTRCenI7cOAyeHga7/NA6ABOZmVxWE2kLQ3kRhP3OdAaWOwu/rdl1o3gLLEOgKhGIWKoRG9IqGK2dm0aR/zlDKgEKRQ7DhrnorVfLXKCt4X+6yiD+g/CK+A9DFlivHjaOm+dF545lmpsw5FwO1WAAYQsEUIaAdOmjEzHRcRaBYV4eJUQ/SeXcYRI9HYOCwWXallQryr8Syy+R8zPn3Ta8tdl+NsNe4t9ygG0Jn4TUsAlKT1/IP8AqDzLYn1x79xvNbZlLzbMvamVvHBSth8WFGGkb0okPSSifu4XesrDII5/sdhSo4qxFuhJWJxagt9Yun3K9z14Py8tGnJDZn9hxz3IxSgepsoN1KpN1RWhAiCgw/ojrO+D7+GxT3d7B8H4lMomlbfmnI9VpdPsH+jXQdHBG7lvabdQkjekV/hZL2FxFGnXzU89LzyUMibfYcZwpL6vWiI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925021911599003)(4143699003)(38070700021)(261009223027099003)(56012099006)(11063799006)(260925021311599003)(260925022911599003)(6133799003)(10067099003)(13003099007)(18002099003)(8096899003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?6+/UwoAaIoX4iNNbkHeqMkSgJxeLPOSDq5lvYOQl4bbITnK97mW4U7qz?=
 =?Windows-1252?Q?X8Jl3f6Wda+nnrKL3az4jE24MysQcfOn6fF2LU9AgJcnvg51t0h/Blf5?=
 =?Windows-1252?Q?BnbNOgdquq0+niYfOOlsdOv2toS2odIcogXx7sWMNiSz5+u9edJmkVAj?=
 =?Windows-1252?Q?Tosvr/riWm0mcnsfRBzK8WeVJLJ6yGtbpIU9wKc/4HPSo7Vk4/Ingzsy?=
 =?Windows-1252?Q?1Nz4nLjcr4xygZkAIcXepHNIgk+N+jH8zdq3E9Ea+ozzr5VgmaBsdVK+?=
 =?Windows-1252?Q?4MVFOomnSkzniooiLhd0+nS3UjGnVT9ADBFNusuDOewrEesHObw3yeqO?=
 =?Windows-1252?Q?TV9ha3YAIs0cqPSXngNIa5gHcFGujU4ogElhyTuaRocaerHbJpWDmgI3?=
 =?Windows-1252?Q?5SAYjB76j8dhMlsDXTjjCUDJryCQf//CbvKsDTi/il7Vgff0Stdydo8d?=
 =?Windows-1252?Q?xTB6ngFX0vUjN9NZLIwuOrXJwUqRc5FJwWYoQRs2z6FTfDZ4ZUek5712?=
 =?Windows-1252?Q?l+au77zBsV9CXfx9uim3nX2y8oK1sVNh18HLra6VCazlzeMdm41dy6yS?=
 =?Windows-1252?Q?HFY0paNpNw81ESlJh90NGIpIik+LQ/Y0qldT/vcBDTTGasNVvB3rx3aa?=
 =?Windows-1252?Q?pNljxvjXigYpzu792ZjVubf7Xm4Zyh0Vb5+Yi3MPY9fQUCxAukTIxVDj?=
 =?Windows-1252?Q?PRFqR0BTNgePfc6j6IpqlkR+k2Q0FqugtqvkBlDuPO9uR+IBNbjGHr6H?=
 =?Windows-1252?Q?UtjJdkJ9kSte06ua5FoJ+jVt/MtP1+GM3rTIreOVdfKIlpc/AT9JYkj2?=
 =?Windows-1252?Q?GTETGtHIzodqYNAMFno7brPCevY2XD7dUelccFS7swO3XK7BTNxK2lVn?=
 =?Windows-1252?Q?sjjMPfqs57twOwFVXSuPRM5GBd+iiB0ooucYAHxiy7x/kT1Khr1PcD9h?=
 =?Windows-1252?Q?Wa4qus/Qz050kx+4NT4vRK/cxAB2ZFg+8g/14FoMpPf3Uq0Wh7bakOwt?=
 =?Windows-1252?Q?BPXSkIwVBa5uDKBsefdvrzmQeffQaYzzoWEEMx/FEnlVtewKFYgT67p5?=
 =?Windows-1252?Q?tCMzL7nFzYrKjwy3dbugg5qSjP7vOmy2TokZppVCSOEobdN4Z4YNOSBD?=
 =?Windows-1252?Q?OrHZduwk40NDnGAFviI/sAYE0GjMjrxb3lbq4NqvxMyXRg3tsnT3fWd+?=
 =?Windows-1252?Q?Nu37bG1U7KkSS7A2LI9fOuhGYkX1TODUa4+UqBEHs4M9UTKGJcs5o5PM?=
 =?Windows-1252?Q?GhkluA3Lg+/dfuyrUCEPtl/4IF4hcBgEpsbqhlUsN7A6ACOE2y6Bajbz?=
 =?Windows-1252?Q?3dhpkrmC3KWfApO0yZ68nYuzKHZ1OSEzz2yLiDNnkkoshx3QrcUMxoGe?=
 =?Windows-1252?Q?j6G7BsUO4wuTxn9dDkybNe1lXW0sPLitAoSXkaG8D532OGYrUbstKUYe?=
 =?Windows-1252?Q?foMNJHBXtD2YD4VdLR72uq8TUais/TsjCn2r7Q6hWVYv0c/w9GpckSbq?=
 =?Windows-1252?Q?n5CcAkI+6B8FRCUQJnMiScki7Ov703O0GdFBcmBnycA72U3hia+Ft4VE?=
 =?Windows-1252?Q?0lilZboJfsKjAWvBkz341uhd31fHgtV5SQQThwgnIjvuY3wc4lzsC2FG?=
 =?Windows-1252?Q?J5CF9tHic9ClEY3rhC8l0yK2weu/Mt6IB4va+ErUsMf4aogrKdXwUJGZ?=
 =?Windows-1252?Q?+Fr9pHlHZRJiCKrogEFV713GtsY7nep8rHARlXBL97CvaHZArlzfR9Pp?=
 =?Windows-1252?Q?zFDrWiDP3U1lZ8pr97xQ4CvYDrUQxoofSaqM+dUOynlIhymsLkqXnemv?=
 =?Windows-1252?Q?iIID3mB102h2SPqVg4cg1HUOHrCTgD1X67ySXng0JGD7s4ok?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB76163B9949BBA5FD283D5A76D39C2PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	y7azy/RaoT9+t7c6l2xn3antxhG93N+lcQMTr58paxwcddxDFwR+Zs33BIjHv6moxNPCHNQyuV9lDbfHM4dAvqC3Iewfcew/mV0GFnvOJbl1zhnuyl+E4CCQq5zPHinqbvIs8AfC/f8dpHBSKP3PX/VUAxaxXm7XXNA/AV/D0ZdNbyR4mzz5rSf0lGM8+Pi+HHdAm+lJhvgn9TN6dxWR5sHGoJx1JSWealDV9tzTLVDnsWzoP6RrD2MVRlBo9pdSZE5GcrH5PsdPeCi8ThuDwIPOUpSSYKfct+AnpM9oXf62zWNITPJ9DbuPR/cZ8n2p08gktRbjtmjd2lyyIoR1Dw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfbd492-73ef-4f3f-722f-08df2a962ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 08:27:42.7916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5SA71Cw/IfHNs3tbhgTa9fMC6NXOfqP5M3Dex0GTObWkJ/u5GG3JgASvI6TEO2WgQj73KWVeIff+obSy8WGyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 08:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247869

--_000_PH0PR11MB76163B9949BBA5FD283D5A76D39C2PH0PR11MB7616namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Hi Yoann,
I compared the submitted backport with upstream. curl 8.7.1 lacks first.h a=
nd uses the older test.h harness. Its res_easy_setopt() and res_global_init=
() macros assign to res, requiring the rename in init1647() and test(). run=
1647() retains upstream=92s result. Following your earlier feedback [1], in=
it1647() also retains the CURLcode type.
With those adjustments, the test passes; reversing the library fix reproduc=
es the Digest header leak.
[1] https://www.mail-archive.com/openembedded-core%40lists.openembedded.org=
/msg226412.html
Regards,
Devansh
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, October 14, 2026 01:40
To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <dev=
anshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-co=
re@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 5/8] curl: fix CVE-2026-8927

Hello,

On Wed Oct 7, 2026 at 1:24 PM CEST, Devansh Patel via lists.openembedded.or=
g wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix as referenced in [3], using the
> commits shown in [1] and [2].
>
> [1] https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6=
b705385
> [2] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57=
aacb567
> [3] https://curl.se/docs/CVE-2026-8927.html
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8927-dependent.patch   |  41 ++
>  .../curl/curl/CVE-2026-8927.patch             | 378 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
>  3 files changed, 421 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-dependen=
t.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8927.patch
> +diff --git a/tests/libtest/lib1647.c b/tests/libtest/lib1647.c
> +new file mode 100644
> +index 0000000000..16dc9d711c
> +--- /dev/null
> ++++ b/tests/libtest/lib1647.c
> ++/*
> ++ * argv1 =3D the first URL
> ++ * argv2 =3D URL2
> ++ * argv3 =3D credentials 1
> ++ * argv4 =3D credentials 2
> ++ */
> ++
> ++#include "test.h"
> ++#include "testutil.h"
> ++
> ++/* this is meant to pick up the proxy from the environment variable */
> ++static CURLcode init1647(CURL *curl, const char *url, const char *userp=
wd)
> ++{
> ++  CURLcode res =3D CURLE_OK;

Hello,

This patch contains changed code from the upstream patch. For exemple,
result -> res. This might seen minor but it might hide more problematic
changes.

Can you check by comparing with upstream patch that the diff is minimal?

Thanks!
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB76163B9949BBA5FD283D5A76D39C2PH0PR11MB7616namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I compared the submitted backport with upstream. curl 8.7.1 lacks <code>fir=
st.h</code> and uses the older
<code>test.h</code> harness. Its <code>res_easy_setopt()</code> and <code>r=
es_global_init()</code> macros assign to
<code>res</code>, requiring the rename in <code>init1647()</code> and <code=
>test()</code>.
<code>run1647()</code> retains upstream=92s <code>result</code>. Following =
your earlier feedback [1],
<code>init1647()</code> also retains the <code>CURLcode</code> type.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
With those adjustments, the test passes; reversing the library fix reproduc=
es the Digest header leak.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
[1] <a href=3D"https://www.mail-archive.com/openembedded-core%40lists.opene=
mbedded.org/msg226412.html" id=3D"OWA35863f88-a69a-22bb-2c39-8905b63b6255" =
class=3D"OWAAutoLink">
https://www.mail-archive.com/openembedded-core%40lists.openembedded.org/msg=
226412.html</a></div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 color: rgb(0, 0, 0);">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 11pt;">Regards,<br>
Devansh</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-s=
erif; font-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, October 14, 2026 01:40<br>
<b>To:</b> Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;devanshp@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 5/8] curl: fix CVE-2026-8927=
 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Hello,<br>
<br>
On Wed Oct 7, 2026 at 1:24 PM CEST, Devansh Patel via lists.openembedded.or=
g wrote:<br>
&gt; From: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [3], using the<br=
>
&gt; commits shown in [1] and [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/1968b32afd8e41fbb87=
f8911d15c552c6b705385" id=3D"OWA5e64c82c-33f2-a084-25e2-6551060dca8c" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6b70538=
5</a><br>
&gt; [2] <a href=3D"https://github.com/curl/curl/commit/5c225384b8d52c67ce8=
259c6e4203bc57aacb567" id=3D"OWAdd8fc26a-e29b-de3a-6831-4312ed5fb7b2" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb56=
7</a><br>
&gt; [3] <a href=3D"https://curl.se/docs/CVE-2026-8927.html" id=3D"OWA26f38=
7e7-1412-652b-1dd5-3da841c464c9" class=3D"OWAAutoLink" data-auth=3D"NotAppl=
icable">
https://curl.se/docs/CVE-2026-8927.html</a><br>
&gt;<br>
&gt; Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../curl/curl/CVE-2026-8927-dependent.patch&nbsp;&nbsp; |&nbsp; =
41 ++<br>
&gt;&nbsp; .../curl/curl/CVE-2026-8927.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 378 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.7.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 421 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-=
dependent.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta=
/recipes-support/curl/curl/CVE-2026-8927.patch<br>
&gt; +diff --git a/tests/libtest/lib1647.c b/tests/libtest/lib1647.c<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..16dc9d711c<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/libtest/lib1647.c<br>
&gt; ++/*<br>
&gt; ++ * argv1 =3D the first URL<br>
&gt; ++ * argv2 =3D URL2<br>
&gt; ++ * argv3 =3D credentials 1<br>
&gt; ++ * argv4 =3D credentials 2<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++#include &quot;test.h&quot;<br>
&gt; ++#include &quot;testutil.h&quot;<br>
&gt; ++<br>
&gt; ++/* this is meant to pick up the proxy from the environment variable =
*/<br>
&gt; ++static CURLcode init1647(CURL *curl, const char *url, const char *us=
erpwd)<br>
&gt; ++{<br>
&gt; ++&nbsp; CURLcode res =3D CURLE_OK;<br>
<br>
Hello,<br>
<br>
This patch contains changed code from the upstream patch. For exemple,<br>
result -&gt; res. This might seen minor but it might hide more problematic<=
br>
changes.<br>
<br>
Can you check by comparing with upstream patch that the diff is minimal?<br=
>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB76163B9949BBA5FD283D5A76D39C2PH0PR11MB7616namp_--

