Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59479C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:28:52 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.5438.1702290522602814351
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=ZgQG40MH;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4070; q=dns/txt; s=iport;
  t=1702290522; x=1703500122;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Dv7VVq+Dj8eKb3oqZviZAKvPk/oAPClDZFNbVKLNMck=;
  b=ZgQG40MHFgy21jDVq3xE9OQPljU7ppElSJ0z7uo0a5QFo1x8M4Afvzak
   tBIihCr78/+/C+QBIChEiTzjHieicpGC44wAnbHtzv9ky3kvf3dixQrEH
   eTdwbZmDM3aWQRzSimQEHmU6LWyULmKEli8Us0mNSYbsFhTwDI4vW8y+8
   E=;
X-CSE-ConnectionGUID: Cl6Zg3gQS+CNfp+GyJL4vA==
X-CSE-MsgGUID: YX3Ny7t1RJes9zWbtGl49A==
X-IPAS-Result: =?us-ascii?q?A0ADAAD/4nZlmJFdJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBZlJ5Alo8SAOET4NMA4ROX4hnA5E7jEMUg?=
 =?us-ascii?q?REDVg8BAQENAQEuCwsEAQGFBgIWhxYCJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QYBAQUBAQECAQcEFAEBAQEBAQEBHhkFEA4nhWgNhkUBAQEBAwERERE3DhACA?=
 =?us-ascii?q?QgYAgIfBwICAiYKFRACBAENBQgagl4Bgl4DARChQgGBQAKKKHqBMoEBghUFg?=
 =?us-ascii?q?U5BsGoYgQIuAYd3GgEFY2iDWjkBhDsnG0CBTYEVQoJoPmsaAYFbBAEXgQ0QA?=
 =?us-ascii?q?Q8BGhWDRDmCLwSDYoFig1YHMoIhgygpgSuPOglBCipGcBsDBwN/DysHBDAbB?=
 =?us-ascii?q?wYJFC0jBlEEKCEJExJAgWCBUgp/Pw8OEYI+HwIHNjYZSIJaFQw1BEZ1ECoEF?=
 =?us-ascii?q?BeBEgRqBRYSHjcREhcNAwh0HQIyPAMFAwQzChINCyEFFEIDQgZJCwMCGgUDA?=
 =?us-ascii?q?wSBMwUNHgIQGgYMJwMDEkkCEBQDOwMDBgMLMQMwVUQMTwMRXR82CTwPDB0CG?=
 =?us-ascii?q?x4NJyMCLEIDAg8FEgIWAyQWBDYRCQsoAy8GOAITDAYGCV4mFgkEJwMIBANWA?=
 =?us-ascii?q?yQsA0QdQAMLbT0UIQYOGwUEOylZBaBzgTYBgXJDYRMHEQIrAQkXLQIsDyVPO?=
 =?us-ascii?q?T6SQ4NxjV2BQ58aCieDaIwCjRyIJBeEAYFWix2ZE5hCIIIwixiVBCQgAheEZ?=
 =?us-ascii?q?gIEAgQFAg4BAQaBYzotG4ETcBWDIglJGQ+OOR+CG4MkgxWKZXYCAQ8pAgcBC?=
 =?us-ascii?q?gEBAwmIbgEngUsBAQ?=
IronPort-PHdr: A9a23:FXta1BwtdtpHV1PXCzMRngc9DxPP853uNQITr50/hK0LLuKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHBxd+53/uCUFOA47lYkHK5Hi77DocABL6YAZzL+vyFpTbp8+2zOu1vZbUZlYAiD+0e7gnN
 Byttk2RrpwPnIJ4I6Atyx3E6ndJYLFQwmVlZBqfyh39/cy3upVk9kxt
IronPort-Data: A9a23:kQFgbKvSY+1XeLKayDO0szfOAufnVEZeMUV32f8akzHdYApBsoF/q
 tZmKW/Xb6zfZmL8f9lzO4mwoEgPuZ/QnNQxSFdurypjQn8bgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0rrav656yAkiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuHZDdJ5xYuajhPsvja8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDS4pZiYJVOtzAZzsAEPgnXA9JHAatfo23hc9mcU
 7yhv7ToIesiFvWkdOjwz3C0HgkmVZCq9oMrLlCUtZKhwBbJSkCv6NNgFAIZLK88pvheVDQmG
 fwwcFjhbziZjO6whbm8UOQp14IoLdLgO8UUvXQIITPxVKl9B8ucBfSRo4YEgV/chegWdRraT
 8YfYDVoYA7JSxZOIVwQTpk5mY9Eg1GmLm0D9QjI+/ZfD277/Twq9qmyLIPvWNGRFNdqlFq3o
 j6X1jGsav0dHIfCkWXeqC3EavX0tSTjVYQfEbe1+vJnjBiYwXYeIBkXTkeg5/6hh0izXthSJ
 0AZ9mwpt6dayaCwZsP2Uxv9q3mes1tNHdFRCOY9rgqKz8I4/jp1GEAvSmBzZ4cpjfR1bhokz
 hymjvHNWSJG5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3zUFiNxi5v4oZog7eJNZnuHI9SfML
 ydmRRXSap0JhsINkq68512C0nSnp4PCSUg+4QC/soOZAuFROt7Ni2+AsASzARN8wGCxFQbpU
 J8sx5L20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN8Iumslfx82bptUIVcFh
 XM/XysMtfe/21P0NMdKj36ZUp1CIVXITI26Ca6MNrKinLAqLFfZlM2RWaJg9zuwyBd3y/5X1
 Wazese3BnFSErV80DezXK8c17Rtrh3SNkuNLa0XOy+PiOLEDFbMEO9tGALXPogRsvjeyC2Lq
 Ik3Cid/40gFOAEISnOJodd7wJFjBSVTOK0aXOQOLbHZf1A7Rz59YxITqJt4E7FYc21uvr6g1
 lm2W1RTzxz0gnivFOlAQikLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:/89uraHADq4sNHT2pLqFrZLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJk3I+ertBEGBKUmsk6KdkrNhTItKOzOW9ldATbsSorcKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKzPoSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAZIUE5nHfiTNz0uZcSGjdvNk57tfB4BADAayCTmt1mVwY+/OSK1mjMFXR1y4ZpKyw
 X4egrCiZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoTJ4JYczAgBkF5MWUrHo6mt
 jFpBkte+5p7WnKQ22zqRzxnyH9zTcV7WP4w1PwuwqgnSW5fkN+NyNyv/MfTvLr0TtngDi66t
 MT44utjesSMfoHplWk2zGHbWAwqqP+mwtTrQdatQ0sbWJZUs4QkWTal3klTavp20nBmdoaOf
 grA8fG6PlMd1SGK3jfo2l02dSpGm8+BxGcXyE5y4aoOhVt7ThEJnEjtYcit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJaQupUBjaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CEVF9Dr2Y9d0/nFMXL1pxW9RLGRnm7QF3Wu4xjzok8vqe5SKvgMCWFRlxrm8y8o+8HCsmeQP
 q3MII+OY6rEYIvI/c+4+TTYegkFZBFarxhhj8SYSP7nv72
X-Talos-CUID: =?us-ascii?q?9a23=3AN/jin2pMPVCQMFydni3g/F/mUeshLE/Sl3jpGAy?=
 =?us-ascii?q?TL2hxC5KEa3vM5ooxxg=3D=3D?=
X-Talos-MUID: 9a23:5xJUawsMafQkelrPrc2ntQE5EtY3//2UKk0WwIc5sdWrMXAhEmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 10:28:41 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 3BBASf0Q028459
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:28:41 GMT
X-CSE-ConnectionGUID: dGnxemqDSa+5L6YrSxLBVw==
X-CSE-MsgGUID: u0yGTKjPSN60BaewKRe8tg==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=dnagodra@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.04,267,1695686400"; 
   d="scan'208";a="18659151"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 10:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feTvyaquBFy5fs3unInfGF42aHK2U/+7RbNgPiNBTN9azDWdAH7xGkZVtf22ymd48u/lkPayzO7agcSiHQ7QnFLaUJ3eD7wCU/yaZigPZbRwQ3L7WPYQQ6HzSoL4GaKLDfvXE8GOfGBnz/dsHvkkoyJ31HiiHy8ABVmWz8k/0WWrZj66O+SxGbww8aXVFn0gXi83RjQAUm+F5sI4DJZZzS2XME1HRFY+0uw5ARNp6dCJuJx9OdbJ2UIWFOFyl3IlMP7vU4JLbVAq+1s79cR1HMuGALjnz/qtH3PYh5iJ4PgSMkiR00tydwxo0Op5Y6/1+nbP1w2cKxvWbOVT+fKMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv7VVq+Dj8eKb3oqZviZAKvPk/oAPClDZFNbVKLNMck=;
 b=fyRQGkayFoqLAYs1WjS98l+RpcteX/LVvCAbwGTp5nVtSy6hLPdQikelHwGILY+siNgk5uPwkpUaenVLJUQXs8Ht9EXgQquCxi+lI1qHoGEr5EowuOijGYLELEx94a4SZhK0DMaPI53deuZemlrL49/vdYiP/IIYWLznLuEDSbymgOUmA++VqG8a44jQIHziZRdXp/woxQube04TPAQfou5sL2Ogz9uf13rsvomhxj1JFfSIQrNHhWJpX3rkLwii7NDm+jd1vHGzmVnlhqo7ozavFlvDOhiPidxmv/88RBKWlOxiJx7QZaxwayfAs5T7J1yvpGCPYyotGrP5qE6Oig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 10:28:38 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::3af6:ccd1:145b:83bb]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::3af6:ccd1:145b:83bb%6]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 10:28:38 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>, Yuta Hayama <hayama@lineo.co.jp>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [master] [PATCH] cve-update-nvd2-native: increase the
 delay between subsequent request failures
Thread-Topic: [OE-core] [master] [PATCH] cve-update-nvd2-native: increase the
 delay between subsequent request failures
Thread-Index: AQHaKZQaEqipV94GmE+eR+r9SB9O9LCjupSAgAADBQCAACRfgA==
Date: Mon, 11 Dec 2023 10:28:37 +0000
Message-ID: 
 <SN7PR11MB6971B5B0381A29B57317419FD48FA@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20231208050439.461257-1-dnagodra@cisco.com>
 <581f915c-39e0-41fe-8258-84739b5ace41@lineo.co.jp>
 <a11d36d5-5151-404d-8065-f68cb2eadd19@smile.fr>
In-Reply-To: <a11d36d5-5151-404d-8065-f68cb2eadd19@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|PH0PR11MB4821:EE_
x-ms-office365-filtering-correlation-id: b6c463da-ccf5-4007-69ed-08dbfa33effa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8fR1q7R72EWHDd4DjJKgfmC79V7gckM/CBdvw3AM3nNrVUyhRmrr5JVRPjXxQ50dFxkdJKj5SdIx7j0fu3iW3ha8/rbi8JLg4JGvgL/mIpxkxCxbCsyWTYZmpq4XHJIcUpC2BP8jFXRN6IPewnuUD2zuSyUznGQ+zokAOB3MvKnHB45Br8NJnKMDgM7OF2TSBOYQsW51ZeEE8YQoIdqzc64gHHB46J33EjLiIcJfuNY42PMkiTLNpNKZTD2opVQrlwyTYLAdZ15bqUZez7ADdyR/kiANmGIDfaSp/zOTTEFTkA+tsHcxznYykMxYLEcPv63rlkdJz7/SRtgPWHqmH/qVcQOrAGkhS2chJ35ZC0bF845xTQSkx21/gAzYKnDs8W5zxW7z+cZ8SRcS9CLffFcWVJTL8RSaaeutXTJCzAiKuXW+W49RJ3JRpmJqHNm2DLF79kFJMwytR/pjXcnQj3Q9cH1MVWF0mu0phVYUT5NeSzQ0IGasVURVZK1PLPZHJ9EdbbOeilzvkhfFLC6RzNu3fEUJBy7artu4RFO1zijeSQEeYH0KOHJQclx9iaSO8AZwfDj2BuoQlRo4tXCH85HYftrYvJtntWvAjoDI/vkz4jNud/FbAO2n1PUkMh4E9Rq2TNhsSGFLdIbru+hZAw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6506007)(7696005)(2906002)(55236004)(64756008)(66446008)(66476007)(66556008)(66946007)(52536014)(53546011)(9686003)(71200400001)(122000001)(38100700002)(86362001)(33656002)(316002)(15650500001)(8936002)(4326008)(8676002)(5660300002)(55016003)(76116006)(110136005)(966005)(478600001)(41300700001)(66574015)(107886003)(38070700009)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cXZ0bjVlcEhWWU5UL0g1V3JwN1NvRUFvZWdLLzc3Tm5xRzVTV0hkMzhZTExk?=
 =?utf-8?B?cElTRTZlWTduVU9wdFVhOFNnTHFrZ0dacndCa3pGWXZSYS9XK0ZIMnRnZlZa?=
 =?utf-8?B?ODBsUWRsNFRMdU00dUlndS8zZHdBenY5MmZyUmxnWWtmS1l6K0tNN0FYd0Ry?=
 =?utf-8?B?Zmd5OUY0ZGtrYWR5TGFlOXkwN2h6Q1Jycy9TVWY0ZHdqL01zSEJOYlpFZVVh?=
 =?utf-8?B?UkZtenBtVnB4bTNTK0RRRnhuRW9BWGpZQWhTdzBnRGJSVnBWN0lpQ1A1NG5O?=
 =?utf-8?B?TStldDBXSGtmcjQvNUNuZG4xOEt2WDZXTXI1RzVvbmdzUnhKNjFqcVkwd1VG?=
 =?utf-8?B?V254dlRFd2xMSm9ReEI2ZGFtL011UldBUkpoNExQMnp1QWE0TWFaV0VBTEww?=
 =?utf-8?B?REVoNWlyM05tTUFZRkM4RExMeU1BMzFBRzRNS3RzUUt0RTdRRUJiYW90K283?=
 =?utf-8?B?LzNSRzNodDkzYjR4OHdkN2JSVW9WdzlRMlhKaEd0aUowSFk2ditQYzVDNVFF?=
 =?utf-8?B?eHlwMzdJTkFpYjB0bk9QMG5LaFd5UUtEU0tDcmtxVCtqQk5saG4wekZldi9D?=
 =?utf-8?B?ZGJyRDdCMHI3UGU3VnVBS0l6TnUwc1R4NXM4cFd5NHoyb2NjOGpIYUZzTW1h?=
 =?utf-8?B?NzU4R2lqdExhQXNSLzhsM2pOWkdWNVBkTlJNYlNGQ3h2M2FBM2gxUlRGVGk5?=
 =?utf-8?B?S1JHbmFhR2ZVWENNaWpkblZDTkhqTnhneHhFTE0vSU1NQUxRWkhhemQrY1Fq?=
 =?utf-8?B?ejdzakNmQS90NE9RdThjRGhHSmRNKzF6UGd0TWdZSEplSHZIeHM3Y3dwcTRj?=
 =?utf-8?B?dXFBN1l3Uit4bjFzUlJWbDBlZUVPbkwyRFE4OWlnS2lzVFpsNW1TSXBuTUxy?=
 =?utf-8?B?cGpMV1A4WWw2OFpQL1FWbzU1SG9zZC9oRnNIY0VnNHk5RjhzdktDZ2VaeW40?=
 =?utf-8?B?QTlDejIwM0RGd1kwTi9SeGk1Ky9RZDNGbGpFT0pwZWFkYVhrZDdWdmJxQUNn?=
 =?utf-8?B?TEZJZ0swSzJ3WjFIZ21MQjhxd0UyVGVKeFYxTU1uM2NZaFl6QytnR0I1ZUxU?=
 =?utf-8?B?Ymd3dWhpV0h1WHhNejlSb0JmVVMyMXFESjhuWk9XcGNWUTJUSXloSm1JbjV6?=
 =?utf-8?B?aUVtYXNOMmpiODZzTW4rcCtMWSthR04wSERpdzBNUXNLeGpOZkdHRVlXTUlk?=
 =?utf-8?B?ZzRuTWVMU25XV3YrQ3FUOWNid1RIMVNTbXdMTXh2YmhVUGM1anVod3dndW0w?=
 =?utf-8?B?OXJ1VXVIS2FvTjYySThEdmQ0WG1oOWQ4RURwRHZmUjBnZG03R0lreEtkNldR?=
 =?utf-8?B?VXR1a1Y5T0taWWVxWGx5TDcyNjVsZDhFOGpmSmhwdEcwa1gwejdOUE11V05J?=
 =?utf-8?B?RE1MTnc0cVl4ZUN0YUxhNzRVWDM1cjJQMTFDMU9VSkR1SkpTZEo1VUdHaGJG?=
 =?utf-8?B?UVUwMFhlZUNhVFdpcmVyMzcwZ1RuTGVNb0pVZWh4Y0pIN3BhZFF3L3ZwU2xy?=
 =?utf-8?B?ZW8rQzg2andNdkNuSVVOTm9CVWxQaE1sUnczNTFsc0ljR0M3NTFPUkl6YW9Y?=
 =?utf-8?B?L2xUVlY5R2R0YWs5dzR4TGxTOXp3RG1OMFYwMHYzVFNXQkk4bzhvdkg0bjl6?=
 =?utf-8?B?bzNuZmFaaUxqWUhnbGUzMjBqdTNXeUIzYnV6amkvYzdjejdmdUNNY1pkR25j?=
 =?utf-8?B?RlhxZVRJaWIwTEJuTExISnBaamdhTWY3N1QxU3ZrU2J0Nzl2ejBObDAvcDJO?=
 =?utf-8?B?ejJva29acEplckREeE1JSG1XRStMRUJrSHRXMDNXcWpSTDZva05NVFV2NHI1?=
 =?utf-8?B?M3BGaDhDNzJxUGRPYXQzeVdVYktIUGdKa0RlaW1YQ21ZdzkyYXN1NU5BTjVK?=
 =?utf-8?B?aHJxaHJVQ25qUE9vbzdDcHRsQkRBSXVXWGh0YmtOeS9PRDJ0bGNYMndILzFP?=
 =?utf-8?B?Skc5eTJhK2ZiTlJ5ajVyd0d4VjdCNW53U2hTS0J6Yk53elRUN2lvR1NKM3NN?=
 =?utf-8?B?MUNERE1pTjk1V3lVTHJEbTFLWWFsR3BQZFNuVStsNko1RzdMREdIWVBEQVQx?=
 =?utf-8?B?WHFPd2dOWll0WXU0R3E3R1JqclNYT2hwM1Q3NFU3dWdNcGZ6Q2Z5ZWZGYXFY?=
 =?utf-8?Q?Z1vcYoyewGB/LhrazBsn++w9t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c463da-ccf5-4007-69ed-08dbfa33effa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 10:28:37.9139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JOOWl6rthG81zK8zXcbT2qEOXZpeoUcMYO9WIWKDA8Wtaih16e4dhscUx1q4+I4q8xcDBLVbdJAts/exuIBigw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192157

SGksDQoNCk9uIDIwMjMvMTIvMTEgMTA6MDIsIFlvYW5uIENvbmdhbCB3cm90ZToNCj5IZWxsbywN
Cj4NCj5MZSAxMS8xMi8yMDIzIMOgIDA4OjUxLCBZdXRhIEhheWFtYSBhIMOpY3JpdMKgOg0KPj4g
SGksDQo+Pg0KPj4gT24gMjAyMy8xMi8wOCAxNDowNCwgRGhhaXJ5YSBOYWdvZHJhIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPj4+IFNvbWV0aW1lcyBOVkQgc2VydmVycyBhcmUg
dW5zdGFibGUgYW5kIHJldHVybiB0b28gbWFueSBlcnJvcnMuDQo+Pj4gVGhlcmUgaXMgYW4gb3B0
aW9uIHRvIGhhdmUgaGlnaGVyIGZldGNoIGF0dGVtcHRzIHRvIGluY3JlYXNlIHRoZQ0KPj4+IGNo
YW5jZXMgb2Ygc3VjY2Vzc2Z1bGx5IGZldGNoaW5nIHRoZSBDVkUgZGF0YS4NCj4+Pg0KPj4+IEFk
ZGl0aW9uYWxseSwgaXQgYWxzbyBtYWtlcyBzZW5zZSB0byBwcm9ncmVzc2l2ZWx5IGluY3JlYXNl
IHRoZSBkZWxheQ0KPj4+IGFmdGVyIGEgZmFpbGVkIHJlcXVlc3QgdG8gYW4gYWxyZWFkeSB1bnN0
YWJsZSBvciBidXN5IHNlcnZlci4NCj4+PiBUaGUgaW5jcmVhc2UgaW4gZGVsYXkgaXMgcmVzZXQg
YWZ0ZXIgZXZlcnkgc3VjY2Vzc2Z1bCByZXF1ZXN0IGFuZCB0aGUNCj4+PiBtYXhpbXVtIGRlbGF5
IGlzIGxpbWl0ZWQgdG8gMzAgc2Vjb25kcy4NCj4+Pg0KPj4+IEFsc28sIHRoZSBsb2dzIGFyZSBp
bXByb3ZlZCB0byBnaXZlIG1vcmUgY2xhcml0eS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERo
YWlyeWEgTmFnb2RyYSA8ZG5hZ29kcmFAY2lzY28uY29tPg0KPj4NCj4+IEkgd2FzIGp1c3Qgd29y
a2luZyBvbiBhIHNpbWlsYXIgaXNzdWUuDQo+PiBBcyBhIHNwZWNpZmljIGV4YW1wbGUsIG11bHRp
cGxlIGN2ZS11cGRhdGUtbnZkMi1uYXRpdmU6ZG9fZmV0Y2ggcnVucw0KPj4gaW4gcGFyYWxsZWwg
Y2FuIGVhc2lseSByZWFjaCB0aGUgcmF0ZSBsaW1pdC4gSXQgY2FuIGJlIGFzc3VtZWQgdGhhdA0K
Pj4gdGhpcyBzaXR1YXRpb24gd2lsbCBvY2N1ciBpZiBzZXZlcmFsIHBlb3BsZSBydW4gYml0YmFr
ZSBpbiBvbmUgb2ZmaWNlLg0KPj4gKG9mdGVuIHVuYXdhcmUgb2YgZWFjaA0KPj4gb3RoZXIuLi4p
DQo+Pg0KPj4gSSBoYXZlIG9ic2VydmVkIHRoZSBkb19mZXRjaCBsb2dzIGFuZCBmb3VuZCB0aGF0
IEhUVFAgNDAzIGVycm9ycyBhcmUNCj4+IHJldHVybmVkIGlmIHRoZSByZXF1ZXN0IGlzIGJsb2Nr
ZWQsIHByb2JhYmx5IGR1ZSB0byByYXRlIGxpbWl0YXRpb24uDQoNCkFzIHBlciBteSBrbm93bGVk
Z2UsIEhUVFAgNDAzIGlzIHJlbGF0ZWQgdG8gYSBwZXJtaXNzaW9uIGlzc3VlIHJhdGhlciB0aGFu
IGEgcmF0ZSBsaW1pdGF0aW9uLg0KSSBoYXZlIG5vdCBzZWVuIGFuIEhUVFAgNDAzIGVycm9yLCBh
bnl0aW1lLiBDYW4geW91IHBsZWFzZSBoZWxwIGNsYXJpZnkgaG93IHdhcyBpdCBnZW5lcmF0ZWQ/
IElzIGl0IHJlcHJvZHVjaWJsZT8NCkkgdHJpZWQgcmVtb3ZpbmcgYm90aCBzbGVlcCBkZWxheXMg
YWx0b2dldGhlciAoYW5kIHdpdGhvdXQgQVBJIGtleXMpIHRvIHRyeSBhbmQgZ2VuZXJhdGUgYW4g
ZXJyb3IuIEluIHRoYXQsIEkgY291bGRuJ3QgZ2VuZXJhdGUgYW55IGVycm9ycyBpbnN0ZWFkLCBn
b3QgdGhlIHJlc3BvbnNlIHdpdGggYSAxNS0yMCBzZWMgZGVsYXkuIFNvLCBJIGd1ZXNzIGl0IHN0
YXllZCB3aXRoaW4gdGhlIHJhdGUgbGltaXQuDQoNCj4NCj5TaG91bGRuJ3Qgd2UgYXNrIHRoZSBO
VkQgdG8gcmV0dXJuICI0MjkgVG9vIE1hbnkgUmVxdWVzdHMiIGluc3RlYWQ/DQo+aHR0cHM6Ly9k
ZXZlbG9wZXIubW96aWxsYS5vcmcvZW4tVVMvZG9jcy9XZWIvSFRUUC9TdGF0dXMvNDI5DQo+DQo+
PiBOT1RFOiBSZXF1ZXN0aW5nDQo+PiBodHRwczovL3NlcnZpY2VzLm52ZC5uaXN0Lmdvdi9yZXN0
L2pzb24vY3Zlcy8yLjA/c3RhcnRJbmRleD02MDAwDQo+PiBOT1RFOiBDVkUgZGF0YWJhc2U6IHJl
Y2VpdmVkIGVycm9yIChIVFRQIEVycm9yIDQwMzogRm9yYmlkZGVuKSwNCj4+IHJldHJ5aW5nDQo+
PiBOT1RFOiBDVkUgZGF0YWJhc2U6IHJlY2VpdmVkIGVycm9yIChIVFRQIEVycm9yIDQwMzogRm9y
YmlkZGVuKSwNCj4+IHJldHJ5aW5nDQo+PiBOT1RFOiBDVkUgZGF0YWJhc2U6IHJlY2VpdmVkIGVy
cm9yIChIVFRQIEVycm9yIDQwMzogRm9yYmlkZGVuKSwNCj4+IHJldHJ5aW5nDQo+PiBOT1RFOiBD
VkUgZGF0YWJhc2U6IHJlY2VpdmVkIGVycm9yIChIVFRQIEVycm9yIDQwMzogRm9yYmlkZGVuKSwN
Cj4+IHJldHJ5aW5nDQo+PiBOT1RFOiBDVkUgZGF0YWJhc2U6IHJlY2VpdmVkIGVycm9yIChIVFRQ
IEVycm9yIDQwMzogRm9yYmlkZGVuKSwNCj4+IHJldHJ5aW5nDQo+PiBXQVJOSU5HOiBDVkUgZGF0
YWJhc2UgdXBkYXRlIGZhaWxlZA0KPj4gREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19mZXRjaCBm
aW5pc2hlZA0KPj4NCj4+IE90aGVyIHRpbWVzIGEgcmVxdWVzdCBtYXkgZmFpbCB3aXRoIEluY29t
cGxldGVSZWFkLCBidXQgdGhpcyBpcw0KPj4gY2xlYXJseSBkaXN0aW5ndWlzaGFibGUgZnJvbSBh
biBIVFRQIGVycm9yLg0KPj4NCj4+IEhlcmUsIHdlIGNhbiB0aGluayBvZiB0aGUgZm9sbG93aW5n
IGlkZWFzLg0KPj4gSWYgYW4gSFRUUCBlcnJvciBvY2N1cnMsIGFzc3VtZSB0aGF0IHRoZSByYXRl
IGxpbWl0IGhhcyBhbHJlYWR5IGJlZW4NCj4+IHJlYWNoZWQgYW5kIHdhaXQgMzAgc2Vjb25kcyB0
byBlbnN1cmUgdGhhdCB0aGUgbmV4dCB3aW5kb3cgc3RhcnRzLiBUaGUNCj4+IHBhdGNoIHdpbGwg
YmUgc29tZXRoaW5nIGxpa2UgdGhpcy4NCj4+DQo+PiAtLS0NCj4+ICBtZXRhL3JlY2lwZXMtY29y
ZS9tZXRhL2N2ZS11cGRhdGUtbnZkMi1uYXRpdmUuYmIgfCA1ICsrKystDQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPlJlZ2FyZHMsDQo+DQo+
LS0NCj5Zb2FubiBDb25nYWwNCj5TbWlsZSBFQ1MgLSBUZWNoIEV4cGVydA0KDQpSZWdhcmRzLA0K
RGhhaXJ5YQ0K

