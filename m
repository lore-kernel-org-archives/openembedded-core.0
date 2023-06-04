Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61126C7EE29
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 09:59:41 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web11.14491.1685872775196294493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 02:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=kzbPoyri;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4168; q=dns/txt; s=iport;
  t=1685872775; x=1687082375;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WVUAwzePmJ1eisJrPDzBBM6cfBOx/qQMlrdaaCJc6B0=;
  b=kzbPoyriOxUM+JJ8wW/CDRlqobvYBbnzlMkTByKQhSG0CLPzCMxksaDF
   RUunAeqLLAMToHbS6ukWuOV5WnhFE8fbkM3BiOYQML3LvEPnwmTK1uWKd
   6ARKsW1IcUWDwn9p1Ak6F6P1kzKgx2MOylDklkl659NnaChi/i8uYC3bv
   o=;
X-IPAS-Result: =?us-ascii?q?A0ADAACLX3xkmJldJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBXCooc1sqEkeEUYNMA4ROX4hKA4ETij2SG?=
 =?us-ascii?q?YElA1YPAQEBDQEBLhYEAQGFBgIWhUoCJTQJDgECAgIBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaA2GBAEBAQEDAREREQwBATcBC?=
 =?us-ascii?q?wQCAQgRBAEBAQICJgICAh8HChUICAIEAQ0FCAwOglyCKQMxAwGgdAGBPwKKJ?=
 =?us-ascii?q?HqBMoEBgggBAQYEBZxQDYJJCYEVLQGHVYFkgViBWysXhDEnG0CBTYEVQ4IwO?=
 =?us-ascii?q?D6CIEICgWIFM4MhOYIughiJHA6CaoJCi1+BKW+BHoEifwIJAhFBJoEMCF6Bd?=
 =?us-ascii?q?EACDVULC2OBHlI9HoEoAgIRPBVOeyADBwQCgQUQLwcEMgkWCQYJGDAnBlMHL?=
 =?us-ascii?q?SQJExVCBINiCoESRBUREYEiNwNEHUADC3A9NQYOHwUEIwEeLYFXMECBEQIiJ?=
 =?us-ascii?q?J8abAcBPAIBVigWBmUMBwNpkxwaPIJWSKx3cAong2GZFYF5hicXhAGMaphnm?=
 =?us-ascii?q?BAgkS2RQoR7AgQCBAUCDgEBBoFjOkiBE3AVO4JnUhkPjiAZHnEBCYJCj3l1O?=
 =?us-ascii?q?wIHCwEBAwmIbCyCLgEB?=
IronPort-PHdr: A9a23:p+X2Ah/Jskf/Of9uWO3oyV9kXcBvk6//MghQ7YIolPcVNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqLgF1J/jvHYL6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49ALiJFrLLowzBaBrnpTLuJRw24pbV7GlBfn7cD295lmmxk=
IronPort-Data: A9a23:u4yCWaBnPHPSiRVW/wjjw5YqxClBgxIJ4kV8jS/XYbTApDog0zcGy
 WsfCz2GbqyNN2v9KdF+YIvkoUwOu5OBmtUyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4WGdoZtJpPljk/FGqD7qnVh3r2/SLP5CerVUgh8XgYMpB0J0XqPoMZnxNYw6TSFK1nV4
 4iq/ZWEYATNNwNcawr41YrS8HuDg9yq0N8olgRWTexGulbYi04UAPo3TU1mByKlKmX8NrfSq
 9frlNlVzEuAl/seIo/NfoLAT6E/auW60T5iJZZhc/PKbhBq/kTe20ugXRYWQR8/Zz6hx7idx
 DjR3HC9YV9BA0HCpAgSex8EThtGL5BbxJD8L3n8rNSU6mvPbEK5lp2CDGluVWEZ0vx8DWcL/
 vsCJXVXKBuCnOmxhrm8T4GAhOx6c5KtZ9xZ6yomlGyCZRolacirr6Hi/tRY3SsqgcxmFvfFb
 M1fYj1qBPjFS0QWawtIVsxmw49EgFHya2AApEvFnJMq5nPB6DRq4Oi0C8rsL4niqcJ9xxbE+
 T2uE37CKhYCOdqSzDCI/n6hiqrEmjn2cIYTD6GjsPlyjVuew2YeBBEbWR28u/bRt6Klc8hUJ
 0pR8S00oO1oskeqVdL6GRa/pRZooyLwRfJWT7AA0BOw15b72AiYRXUcSRtnYcMf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kd9UEXVFRYPlTXJfJTbp8+UPs6lo0U2SFocL/Lqdy4yqSWupk
 lhmuQBn3+1L5fPnwZlX6rwuvt5BjoLCQghw7QLNUyf/qAh4f4WiIYev7DA3DMqszq7EETFtX
 1Bdy6ByCdzi67nRzERhp81WQtmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 h+O6VoOvMQIbCX0BUOSX25XI5pzpUQHPYm1Ps04kvIVCnSMXFbdpXo3NRL4M57FyRF9zMnTx
 qt3ge71XSpFVsyLPRK9RvwW1vcw1zsiyGbILa0XPDz5uYdykEW9EO9fWHPXN7hRxPrd/G39r
 Y0FX+PUkEo3bQELSnSNmWLlBQpUfSFT6FGfg5E/S9Nv1SI9STB4W6eBkOt5E2Gn9owM/tr1E
 riGchYw4HL0hGbMLkOBbXULVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:Z2SsFaPbU72mf8BcT27155DYdb4zR+YMi2TDiHoRdfUFSKKlfp
 6V88jzjSWE9gr5OEtLpTiBUJPwJk80hqQFkLX5Wo3SEzUO2VHYYL2KiLGD/9SOIVyEygbSv5
 0QCZSWZOeAaGSSyPyKnzVQcOxQjuVvkprY+Ns2pk0FJWoHGsIQjTuRSDzrbnGeLzM2Y6bRYa
 Dsnvav0ADQAEj/AP7LYkXtWdKvm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerp8bMpiA2jkAgwbzZBBOG
 Yh5RPCi3KRZimwxxjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklW6voMRiKobzPKt
 MeRP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8nBreDQQF++oXgV4r6dn8k=
X-Talos-CUID: =?us-ascii?q?9a23=3A9ezbTWio4GbrpE/EEpVRTN5DwTJudCGA9k/CHlK?=
 =?us-ascii?q?EJl1nSf6IUVi13qp7qp87?=
X-Talos-MUID: 9a23:/hXtYgt6MBnwgWTKoM2niSk/bMtxs52XFUUWg7E+oPnUbBdgAmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 04 Jun 2023 09:59:34 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 3549xYGQ031749
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Jun 2023 09:59:34 GMT
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,217,1681171200"; 
   d="scan'208";a="2415898"
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 09:59:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3ld6JQfgegyIPWVGfsHDj/5a8NFWR5ShGY46w1gzmLMZEEXKrsyZvf41YJgHABoik02YX7f3j5bSMcZNdiu741VtpuoS1ITKgKQs14OAzI7exi3FpzU9CzCBtBimzlUQHNxgliJVbuYvyc5eY8dAvxCC3Iq7WrP0cW0USEpcSoc7wWM0w+2+DLQXUdOfwCwE4hxiBk8FSxPs32YjICHVoadQJRzmegUujWN3HFlhx30K6qMWKRMGZnawAu0zv6hqJWko227ZvbEkHUqa4/oTjmes7WzWFj3uBOqAi/hqEgIkvGqQpxVZc/iCDg8uZKsy3RUISbSvwHQvng1kj6wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVUAwzePmJ1eisJrPDzBBM6cfBOx/qQMlrdaaCJc6B0=;
 b=GmdYdTdiSBRKbgGwuppWZKuzqwqEH/6FzBwjOWT/q32dwzsK+gjbYoro4DT+2akEYbh09i5qWG+pj9OAJgk5wBexCRwVvRJvG26tFj8re53uy9Tvpmp0+mYZ1Qu9aQ3vmb204lNwwzf+U3HyStOBsg+UdWWxb69icYrfPIJW3dcNiDtrr/4bYZYsPPP48guIHhDjNuwf1PaL1Q/5NL6XZF01qen2zwPyMJshVeIreRVLOSnEBZdgWtPXs1roWlvEmNXecHUY7E/u8j0PROj3B8pEQ4aPGQyP2WB+EtUsDdJyhzKUxtYkMm5wrUw9wVyxfswH1KPWRE4H+Uq+ElkTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVUAwzePmJ1eisJrPDzBBM6cfBOx/qQMlrdaaCJc6B0=;
 b=NeCYnFWsyu/iv2hAmvwVd4nv+DL7yNZq8TMp8E85XBkTuYj/gyK0fRLQmSqThov7nZWzIZY6X9BnMy5pIGt+Xow0aDEWcdFkE/yxLXgliiiKy/3KDDqK3USeYcoazVhz7tFjhHeEyk4uhQtaQVXCSHukYqCb1reOycJdC8lf3D0=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Sun, 4 Jun
 2023 09:59:31 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6455.030; Sun, 4 Jun 2023
 09:59:31 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>,
        "Valek, Andrej"
	<andrej.valek@siemens.com>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "mikko.rapeli@linaro.org"
	<mikko.rapeli@linaro.org>,
        "Marko, Peter" <Peter.Marko@siemens.com>
Subject: RE: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Topic: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Index: 
 AQHZihqm4BTY0oU+gUqi7sBvXScwk69hksSAgARfRICAAZ5xAIAJWskAgAG/IoCABW7AAIAABLYAgAJfXzA=
Date: Sun, 4 Jun 2023 09:59:17 +0000
Deferred-Delivery: Sun, 4 Jun 2023 09:59:05 +0000
Message-ID: 
 <SJ0PR11MB671721762A8D26389BDA8C61DC4CA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519062420.37015-1-andrej.valek@siemens.com>
	 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
	 <ZGsghWIXfholEAdA@nuoska>
	 <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
	 <863cf26da9230367daab70ff37b8196dbef7b8a7.camel@siemens.com>
	 <7ec035c989c9655738e01c9dca041594c5aa8678.camel@linuxfoundation.org>
	 <820f56354ef339f1b2cc10e379d6c7a3988d889e.camel@gmail.com>
 <f3be9c663e6a141695cb71215b1f91ec1a3081a4.camel@linuxfoundation.org>
In-Reply-To: 
 <f3be9c663e6a141695cb71215b1f91ec1a3081a4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|SA1PR11MB7039:EE_
x-ms-office365-filtering-correlation-id: 28dd4060-e16b-41ed-1bae-08db64e2641a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 54gEs6L2bD/Ck+IqIctT0NqEUdTChxts9RUKCjB4OkWx7b2N958jVcwL0ZdIa6IOSN47g1dBIcVG2Q/qi0FgliAJWYiC40Jjs8A045Jjf9N9ald5ZLASD+oHZUV6DhyiJLfCIJ6RlpSVvgwIY3aEZYXWv/Dd4k+AUHGBIExf9EgunLH8CFgLpIkT7gBL+GB44gxKe16gqMQB86BXjmne9HGY2rwOmiRxxMS1MFONhHobDY/ozqnK4I1XaavCfl2iqBt05BWPwK8hjmsfc4rCf3Q8Us5XCHm38Ags/lXSt1TqHjZbJTT0zI21IqFblXhV9/p7NF/FT4d108XjDkV84rpuCtjJ2aSXSESlGHIFRTzxWBH8GkxJj/qdz8a+8jFtzCwvko6VMKEUtIKZlA7Laj6MalPPMyQKtpxeIScNCrO5Vn+QSj0jz5dZfqFxUDEj6CQU9mt2ddsPmCQQ6TVbOFjBcrxSgIPDE2S/rUbZkt475+yVquJNn2dMllY0JxZL3fwr6o+Uoi0uzxCuyOohd0TofpGhzv5F2GmJgDeLzUUJyCSzty1kfEtP3lG94V3lD4m9dpRM9rcrtH1YiP0n55lR/OrUtZorin/Ypdcd1PYFqbdQ95xe9xLBnPActcLL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(41300700001)(4326008)(122000001)(38070700005)(71200400001)(6666004)(6506007)(33656002)(52536014)(8936002)(86362001)(7696005)(2906002)(8676002)(316002)(9686003)(66556008)(76116006)(66946007)(64756008)(66476007)(53546011)(66446008)(54906003)(110136005)(38100700002)(478600001)(186003)(5660300002)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Szc4QVZZeTFwSHVkRFdmWFVLaWloVEhvb0RoeDFSOCtpbm41OWF4R01CRU5m?=
 =?utf-8?B?WGVLdDFsSEJOVTlWTUxHdVF3T0ZuMkJzSEhoWTJxcjRGd01CYU51TmtjNjhP?=
 =?utf-8?B?T0NqSGkzNkwzQW5wSkxoSnFDeHoraUEwT2VMZnF4Y1Q3aFdmY1gwcktzNGpo?=
 =?utf-8?B?UHhVY3EzeTRsSVY5N05zQVlYdmxxcUFCSlYvYnQwazEzWVJrMUVFRUN5dW5k?=
 =?utf-8?B?SFJaTk5FNUk0TWxmY29FTWJGdWJEbzQ4MUx3RjdESU9TQWRSb2FKMGNRZWRQ?=
 =?utf-8?B?MFNISE1KTmtJMGxleThnMEkyZU5QMzEzVzJtcmZLdVg5dFlEVEFydEFXemhM?=
 =?utf-8?B?Tk1HcjJVOG5JWTRwUmEvazMzWDZJaW9udVlMRHlVTGcyUldZZ2N5RjRxRHMy?=
 =?utf-8?B?c2JoOUo1eXQxbmgzd0xrZExNc3lCUkswMnRjRjMyNmF4K1RDTjIxMHpWVHFT?=
 =?utf-8?B?YTMzOEZvOVorQUdDWUdteGNFenhpRFBKTGJIeFdnajMzK01tanlqdlR3OEtH?=
 =?utf-8?B?YnptMS9qaWJOb2JlcTdIRkd6VTkyTmhNaVREVHlOTzhnVDhZbzBNWVkrZnZK?=
 =?utf-8?B?RHJsTHNyczZ2S29kK3EzRUxPT0dubXhNejF4cXRCb1BKOEgvOXpMcEFGRDZn?=
 =?utf-8?B?cTlYTE5OYlhwNUE4ZklPT0w5Q2lKNlNPeGhLZ2FCbmdwK2FVdVE2MnJpd2FR?=
 =?utf-8?B?aTYyajFLbmE5SzdVTkxLbGUrUW54cG5XM3FJNGI1Y0Y2YWZnd1B2dUFSKzU4?=
 =?utf-8?B?YzUrUzFzRzQ2bDN1S3N3T3FhRDBuQ00rU1dXY1pDSFFmV0dqT0JycVBDa2lF?=
 =?utf-8?B?Uy9TdUdoNHhRSGZMOTBmcjhGUW9ZaUErRFZGNlBWdjBjdEpoNkpPemFINjh1?=
 =?utf-8?B?cFljdVlWYk1zdk5icVhTNmxrQjVYSzhjRDJhSENkMFBmVGV2bUtGMGd1dGZa?=
 =?utf-8?B?MU5Jb1RYTlhZZTR3UW9XSTVwZkwwSkg5Y0xqeUM0dUhKVFVoL3R0MzI1VXRX?=
 =?utf-8?B?T09hRnU3dWZUQWVTN3pjSHorRnNLZnhPN1N6ZE9VcExnUlNPOWZpc3hhT2Zi?=
 =?utf-8?B?U2dHbTlXbWdBL1hzRlJaclVaRldXc2lOUm5BeGdrZ1NYbFNTVTRuSEV5dzF1?=
 =?utf-8?B?ODJvU3JodmFZYmlBYlJXVFRka0toT0pNa0crVnNSSXBGb05WZnAxZy9MQ2V4?=
 =?utf-8?B?eU5NOHQ5RC9aWnJDcDczb2NxdFJyMmcwVHp3ZTg3dUhBcW5HQ2tLYVoyNHpx?=
 =?utf-8?B?cyt0MW1pZXhIZFJlOXpKVFBzbE0zdVU1RnRSeGFUQ3RRdStMWDNkQjBURTBu?=
 =?utf-8?B?QlRIOHovRFB4dnlkeUJZYlVqd2xISERsdjN1bERGT2ZUQnZZb0VlNFpWRm9j?=
 =?utf-8?B?REF3Yjh5OWdpZkdURHIrWldqVmRhWXQ1a1NoMHhGMVdzT0ZpV0w4RW1tdFA4?=
 =?utf-8?B?VGhYa0tPWHZxZ1VXVDRZMjc1S3F5VXJWN25CS2s4K0tlOXA4RkFwQnZCanZY?=
 =?utf-8?B?bWR3OThISUFmdnZsMzlBNmdpbFNzNFErNlpzTGNFL2tTdDcrL2RHNnlnaTlI?=
 =?utf-8?B?QldieFZ3UTNZSkt5eVluKzgrN2lhWU9lVHAyOVpqMXN4U3ZhVjdGNDVzWklZ?=
 =?utf-8?B?b2d4d2ZtamQyenpLZEQvN0xqY3ZUeCtPOWJiaVZJWVcrcmdBSWF4aSsvOEVW?=
 =?utf-8?B?ZXVMYjhjMXBhSlU3YVFFT3hVK0RHSmlVemp1c1NNcVVQaGRkZ3piVkZzVjdr?=
 =?utf-8?B?WjFVZFh1ZlJmcjZCNEJCV1lybjhUN2g3WnRUQlhRYWNrcElrbEhIRlp1Wmha?=
 =?utf-8?B?Z28vUFcwa0FJSUg2N3EvdUcwdGtGczhlcjl0OXVsSjFOK2lnMnZVOEdqQkFm?=
 =?utf-8?B?NEh1MmdMWHU0OGcvdm1HUDFBQWFyY2c0QXJjeTRtUEVzY0twS0I1QlY5WmN4?=
 =?utf-8?B?Njl5MFViMUo0TWlnQ0xJNlNRb3Y3UmRnd3FCamVBYkRza24rd2dBZFFZYWpo?=
 =?utf-8?B?VUtnWUVBT0haZkowU0ZPcm14K3VqQWpDZzJJNExIMjRGeXQxc0ZxNHRWQi9p?=
 =?utf-8?B?MVMrTGlxbXMwNmNaa002VkZ0MlJQQk5TdGV3K2hSNVIrc1ZMQXZKYmgrU1l4?=
 =?utf-8?B?U3oyWWQveU01NHNDL05vMWg3T3lWbElRZnhLZzMwK2tBQldSZENKVUYvbjRt?=
 =?utf-8?Q?9rJvKOFEBWfKeYA/ylxsqwiYtyxETnyoS4rBT0I5D0aE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dd4060-e16b-41ed-1bae-08db64e2641a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2023 09:59:30.7450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OKsodARV7kqvYIbiX7xXIN+vVY70eDNwAmw2+8LxngFL5lgqyvL3Sgpx6eNmexeD3SqfFxZnhPqf0mCqW5YA9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 09:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182356

SGkgUmljaGFyZCwNCg0KVGhhbmsgeW91IGZvciBhY2tub3dsZWRnZW1lbnQgb24gbXkgcHJvcG9z
YWwuDQpQbGVhc2UgY29uc2lkZXIgbXkgYWRkaXRpb25hbCBpbnB1dCBmb3IgVkVYIHN0YW5kYXJk
Lg0KDQpUaGVyZSBpcyB0b3RhbCBmb3VyIG1haW4gVkVYIHN0YW5kYXJkIHN0YXR1czoNCi0gRml4
ZWQNCi0gQWZmZWN0ZWQNCi0gTm90IEFmZmVjdGVkDQotIFVuZGVyIEludmVzdGlnYXRpb24NCg0K
T3V0IGZvciA0IHN0YW5kYXJkIHdlIGNhbiBhZG9wdCBGaXhlZCBhbmQgTm90IGFmZmVjdGVkIHN0
YXR1cyBmb3IgQ1ZFIGZpeGluZy4NCkFzIHRoZXNlIHR3byBzdGF0dXNlcyB3aWxsIG5ldmVyIGdl
dCBjaGFuZ2VkIGZvciBzcGVjaWZpYyBwYWNrYWdlIGFuZCBDVkUuDQoNClJlZ2FyZGluZyB0aGUg
Q1ZFIHN0YXR1cyBvZiBjb21tdW5pdHkgYW5kIFZFWCBzdGFuZGFyZCwgd2UgY2FuIG1hcCBsaWtl
IGZvbGxvd2luZzoNCg0KRXhpc3RpbmcgU3RhdHVzIAl8IFZFWCBhZG9wdGlvbg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KUGF0Y2hlZAkgCXwgRml4ZWQJIAkN
Cklnbm9yZQkgCXwgTm90IEFmZmVjdGVkDQpOb3QgcmVxdWlyZWQgCXwgTm90IEFmZmVjdGVkDQoN
ClJlbWFpbmluZyB0d28gc3RhdHVzZXMgQWZmZWN0ZWQgYW5kIFVuZGVyIGludmVzdGlnYXRpb24g
d291bGQgYmUgY2hhbmdlZCB3aXRoIHRpbWUgYXMgZm9sbG93aW5nOg0KKiBVbmRlciBJbnZlc3Rp
Z2F0aW9uOg0KLSBXaGVuIGFueSBuZXcgQ1ZFIGlzIHJlcG9ydGVkIGFnYWluc3QgYW55IHBhY2th
Z2UgdGhlbiBieSBkZWZhdWx0IGl0IHdvdWxkIGdvIHdpdGggInVuZGVyIGludmVzdGlnYXRpb24i
IHN0YXR1cw0KLSBVbnRpbCB3ZSBtYWtlIHRoZSBmaW5hbCBzdGF0dXMgbGlrZSBmaXhlZC9ub3Qg
YWZmZWN0ZWQvYWZmZWN0ZWQgc3RhdHVzIGFmdGVyIG91ciBmaW5hbCBpbnZlc3RpZ2F0aW9uIG9u
IHNwZWNpZmljIENWRS4NCiogQWZmZWN0ZWQ6DQotIFJlZ2FyZGluZyBhZmZlY3RlZCBzdGF0dXMg
aXQgd291bGQgYmUgdGVtcG9yYXJ5IHN0YXR1cyB1bnRpbCB3ZSBmaW5kIHRoZSBhY3R1YWwgZml4
IGZvciB0aGUgQ1ZFLg0KLSBPbmNlIHdlIGhhdmUgYSBmaXggdGhlIENWRSB0aGVuIHN0YXR1cyB3
b3VsZCBiZSBhcyBmaXhlZC9ub3QgYWZmZWN0ZWQgd2hpY2ggd2UgY2FuIGlucHV0IHRvIG91ciBy
ZWNpcGUuDQoNClRoYW5rcywNClNhbmpheQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVy
ZGllDQpTZW50OiBTYXR1cmRheSwgSnVuZSAzLCAyMDIzIDI6NTcgQU0NClRvOiBhZHJpYW4uZnJl
aWhvZmVyQGdtYWlsLmNvbTsgVmFsZWssIEFuZHJlaiA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29t
Pg0KQ2M6IHJ5YmN6eW5za2FAZ21haWwuY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnOyBtaWtrby5yYXBlbGlAbGluYXJvLm9yZzsgTWFya28sIFBldGVyIDxQZXRl
ci5NYXJrb0BzaWVtZW5zLmNvbT47IFNhbmpheWt1bWFyIGthbnRpYmhhaSBDaGl0cm9kYSAtWCAo
c2NoaXRyb2QgLSBFLUlORk8gQ0hJUFMgSU5DIGF0IENpc2NvKSA8c2NoaXRyb2RAY2lzY28uY29t
Pg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCB2MyAxLzNdIGN2ZS1jaGVjazogYWRkIG9w
dGlvbiB0byBhZGQgYWRkaXRpb25hbCBwYXRjaGVkIENWRXMNCg0KT24gRnJpLCAyMDIzLTA2LTAy
IGF0IDIzOjEwICswMjAwLCBhZHJpYW4uZnJlaWhvZmVyQGdtYWlsLmNvbSB3cm90ZToNCj4gSSBs
aWtlIHRoZSBWRVggcHJvcG9zYWwgZnJvbSBTYW5qYXkuDQo+IA0KPiAtIEl0IGlzIGEgc3RhbmRh
cmQgdGhhdCBjYW4gYmUgc3VwcG9ydGVkIGJ5IG1hbnkgdG9vbHMgYW5kIHJlcXVlc3RlZCANCj4g
YnkgY3VzdG9tZXJzLiBPbmUgdXNlIGNhc2UgSSBzZWUgaXMgd2hlcmUgYSB2ZW5kb3Igc2VsbHMg
YSBwcm9kdWN0IA0KPiB3aXRoIGFuIFNCT00uIFRoZSBjdXN0b21lciBjYW4gdGhlbiBtYXRjaCB0
aGUgb3BlbiB2dWxuZXJhYmlsaXRpZXMgdG8gDQo+IHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSBO
SVNUIGRhdGFiYXNlIHVzaW5nIGEgc3RhbmRhcmQgdG9vbCBiYXNlZCBvbiBTQk9NLg0KPiBBbGln
bmluZyB0aGUgY2F0ZWdvcmllcyB0byBhIHN0YW5kYXJkIHdvdWxkIGJlIGhlbHBmdWwgZm9yIHRo
aXMuDQo+IChZb2N0bydzIENWRSBjaGVjayBpcyBncmVhdCBmb3IgWW9jdG8sIGJ1dCBjYW5ub3Qg
YmUgdXNlZCANCj4gaW5kZXBlbmRlbnRseSBvZiBZb2N0by4pDQo+IC0gQSBtaW5pbXVtIG51bWJl
ciBvZiBjYXRlZ29yaWVzIGlzIGRlZmluZWQuIEFsbCBkZXRhaWxzIGNhbiBiZSBhZGRlZCANCj4g
dG8gdGhlIFJFQVNPTiB2YXJpYWJsZS4NCg0KSSB0aGluayB5b3UgY291bGQgbWFwIHNvbWUgb2Yg
dGhlIHN0YXR1cyBpdGVtcyBJIHByb3Bvc2VkIHRvIFZFWCBzdGF0dXNlcyBidXQgSSdtIG5vdCBj
b252aW5jZWQgaXQgbWFrZXMgc2Vuc2UgdG8gZ28gZGlyZWN0bHkgdG8gdGhhdC4NCg0KQW55dGhp
bmcgd2UgZG9uJ3QgaGF2ZSBhIHN0YXR1cyBmb3IgaXMgZWZmZWN0aXZlbHkgInVuZGVyIGludmVz
dGlnYXRpb24iLCBhbnl0aGluZyB3ZSBkb24ndCBsaXN0IGlzIGZpeGVkIG9yIG5vdCBhZmZlY3Rl
ZCBhbmQgaWYgd2Uga25vdyBzb21ldGhpbmcgaXMgYWZmZWN0ZWQsIGEgZml4IHdvdWxkIGxpa2Vs
eSBmb2xsb3cgdmVyeSBxdWlja2x5Lg0KVGhlIGRhdGEgc2V0IGRvZXNuJ3QgcmVhbGx5IGZpdCB3
aGF0IHdlJ3JlIGFibGUgdG8gZG8gb3IgdGhlIHdya2Zsb3dzIHdlIGNhbiBmb2xsb3csIGV2ZW4g
aWYgaXQgaXMgd2hhdCBzb21lIHByb2R1Y3QgY3VzdG9tZXJzIHdvdWxkIHdhbnQgdG8ga25vdy4g
UGFydCBvZiB0aGUgaXNzdWUgaXMgd2UncmUgbm90IHRoZSBhY3R1YWwgcHJvZHVjdCBoZXJlLg0K
DQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

