Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47438C7EE29
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 09:56:53 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.46170.1685354203115955249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 02:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=ZGTdFLJo;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2268; q=dns/txt; s=iport;
  t=1685354203; x=1686563803;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=14aq7DBJ/4m7Kf67O2CH71H+zoSn+ExiiKsTq5e9fqY=;
  b=ZGTdFLJo1WD7Z2ZK4abDMBqm2pjVpOTU+Roscioav3hqXQPASo29ELdE
   o/nGIMVoi72PXn29Fygy+pseINapqcs65dPIn2v1X5VqIdnNmvMOPRbOR
   XySvlzeEEu7d+OlsEASGBB36OQUXSEgTi6O9IkzgfTzA5CeLwEQ+xYYsI
   U=;
X-IPAS-Result: =?us-ascii?q?A0ABAADYdXRkmJldJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBXCoocwJYPUeEUYNPhE6JI4tQkheBJQNWD?=
 =?us-ascii?q?wEBAQ0BAS4LCwQBAYUGAhaFRgIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFA?=
 =?us-ascii?q?QEBAgEHBBQBAQEBAQEBAR4ZBQ4QJ4VoDYYEAQEBAQMBERERDAEBNwELBAIBC?=
 =?us-ascii?q?BEEAQEBAgImAgICHwcKFQgIAgQBDQUIGoJcAYIoAzEDARCgPgGBPwKKJHqBM?=
 =?us-ascii?q?oEBgggBAQYEBYFKAkOaQQ2CSQMGgRUtAYdTgWSDXoRIJxtAgU2BWIJoPoEFg?=
 =?us-ascii?q?RtCAQGBYgUxAoMhOYIujlmNPYEwcoEjgSiBAgIJAhFBJoEOCGeBdEACDVYLC?=
 =?us-ascii?q?2WBJoJgAgIRPhAFVX0SARMDBwQCgQgQLwcEMyAJBgkZMScGVgctJAkTFUQHh?=
 =?us-ascii?q?AQDCoEpNTcDRB1AAws7Oj01FB8FBCMBHi2BWAQvQoEZAgQBJCScfwODUmeBG?=
 =?us-ascii?q?GuTX4JoSKx3cAong2GLe40agXmGJxeDf4xqmGcLmAMggi+LC4NykSmFFAIEA?=
 =?us-ascii?q?gQFAg4BB4FjOkiBAQsHcBU7gmdSGQ+OIBmBDwEOgj2Bf416QzI7AgcBCgEBA?=
 =?us-ascii?q?wmLRgEB?=
IronPort-PHdr: A9a23:n2K3NhcZI+WGQC2ShWVuFQpxlGM/fYqcDmcuAtIPkblCdOGk55v9e
 RGZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NBsdA97wMmXbuWb69jsOAlP6PAtxKP7yH9vJhMS2y/q197XYYh5Dg3y2ZrYhZ
 BmzpB/a49EfmpAqar5k0wbAuHJOZ+VQyCtkJEnGmRH664b48Mto8j9bvLQq8MsobA==
IronPort-Data: A9a23:H9voeqiih+66Tvjw6f5VbV3VX161ZRAKZh0ujC45NGQN5FlHY01je
 htvXGqEPK2LNGSgfN4gYd+2/EIB7MPRn9FhHFQ/qns2E3tjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKkYAL/En43HVcMpBsJ00o5wLZk2N8w2LBVPivU0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pDTU2FFEYUd6EPdgKMq
 0kv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOjzAazhHe3JrXO9IdU0QQrimGh+psw
 clEraSXEDwTGYDTzbF1vxlwS0mSPIVc87PBZHO4q8HWlQvNcmDnxLNlC0Re0Y8wo7ksRzoRs
 61DbmlQNXhvhMruqF6/YvJnhsU/Ns7nFIgeoXpnizreCJ7KRLidH/yRuI8Fgl/cgOhBBN/Be
 ZYgdAF1YUnHQC1hfQwOS4oHybLAan7XKm0E9w39SbAMy2/LwQp81bLgPNbYdpmBQt9YtkKZv
 X7duWPhDxcXMdaSxTaI/jSrnOCnoM/gcJgZGLv9/flwjRjJgGcSExYRE1C8pJFVl3JSRfpeE
 U9T3zYhtZIv/VCiVuHaBiaCh1Ob60t0t8VrL8U27wSEy6zx6gmfB3QZQjMpVDDAnJJqLdDN/
 gLT9+4FFQCDo5XOFi3Arub8QSeafHlKfTVbNEfoWCNcu4G7yLzfmC4jWTqKLUJYpsf+FTe1y
 DeQoW1kwb4SlsUMka68+DgrYg5ARLCUEWbZBS2ODgpJCz+Vgqb+NuREDnCAsZ59wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3w4yRchxqW/1piTyFWy13N2YDBo5WirjUWK2C
 HI/RSsKjHOuFCLwNPQuM97Z5zoCnPm/fTgaahwkRoMePscuHON21CpvfkWXl3v8i1QhlLpXB
 HtoWZjEMJruMow+lGDeb75EidcDn3lirUuNHsqT50r8jtKjiIu9FO1t3K2mNL5ptctpYWz9r
 r5iCid9404OCrWgPXKNrdB7wJJjBSFTOK0aYvd/L4arCgFnA2omTfTWxNscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:mekPAKk15otk1TDGifuxfw8N4+rpDfOBimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7Sda9qBPnn6Kc4eEqTNOftXrdyRWVxeZZnMffKlzbamDDH4tmtJ
 uIHJIOcOEZgzJB/L3HCWWDYrQdKZy8gdyVbITlvjhQpGNRGttdBm5CY27xcjwUeOAFP+tFKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqHvhW3M7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl54242svLiyP05iv21dB7idHhwtxMCIinkc4OMAjhjQ6uecBIR6CChjYou+uigWxa0O
 Uk4i1QfPib2UmhO11dkiGdnzUIFwxerEMK/GXow0cLZ/aJAg7SRfAx3L6xOSGpmnbI9OsMoJ
 6jmVjp+aa+yXj77X/ADx+ibWAzqmOk5XUliuIdlHpZTM8Xb6JQt5UW+AdPHI4HBz+S0vFuLA
 BCNrCr2B9tSyLSU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegP28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1C8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/sukKSReoeMMIYDHRfzPWzGyfHQ0Mn3KverKc
 qOBA==
X-Talos-CUID: =?us-ascii?q?9a23=3AEWDFGGoP+g0H/hYidnsfZKnmUcEfcTr40HjIGVK?=
 =?us-ascii?q?xFW9xcJrMcmW31bwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A7g9mcQ3DcmLUOMZ+O9e48wSOIjUj7L2HF15RqIg?=
 =?us-ascii?q?9ocTZMg9AFXDGlXeve9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 May 2023 09:56:42 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 34T9ufju009304
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:56:42 GMT
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,201,1681171200"; 
   d="scan'";a="2073964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdXlvNiji20Y8ImslBiN5FSlm7Uo7Qy/BbVa/JCfK1PcMDIFWFTvkT5NkXpqXLFWybggjj3CrFgjXtF/DOrJu4dLbmKrqb4ayrfIEbBlHc1qT49LNg+FvPfY+tzruJ3pFKJ5no0IfImVAgwqNpWq+oTgrtrZW/sXUL4yuaRfxcSOrtIMKBD1qsmwqr3v+MEvJDvZykMDaGiTMn4e5AHFTkhy1sE11xa/xdEDwRMyS1FRWEu5IFhiLaRMrZxkWaSMnzG0Jpk1TdJz6NgBFh+5gnUKug8IieeiucMpJvTzHuZ+GYZA02661IiP22iM6imNodBztLi8nUd+keKza540UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14aq7DBJ/4m7Kf67O2CH71H+zoSn+ExiiKsTq5e9fqY=;
 b=DDSukZ3PGbXIf7U0b6CxjCQDhnHJF/b/5E3sFRiE+Imj/7bIEUfUEu67j1FW/splAXufcnb03aEDs4ORb6gpgv50yrXKNACD9Y7fxMgs14Cl6ylHQ69CiOfCjnbwz+o+8WeW5dOnq5zuNcP6mJpVS4lEULFqws3031Xx2J6rU4JVOJTOzKdDMJmAuET8/2LoWRRIa5reGyTwG70qSJCeF2JMKrtyvC8QzZpoi/DLFgI6dlNx/btgX0gSFhwQnu+xjlUOfRTkLqtReCxClR+IiE4ykVd/njCOtMjfB33DX725XzUeqOXFxLw3pY6emM6aJyGeH1pi2ACzxXvO2RqPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14aq7DBJ/4m7Kf67O2CH71H+zoSn+ExiiKsTq5e9fqY=;
 b=ddnG/Tlmx3IBoXZ+9l5Nhv8i+NIdKQFY9ZZSCFj1j47zUGrv9s2JlAgoU/r8j0c6U0IPeKZV7lV6OVawM1SM31QRPBBTuBqNfBvLIXYNeH910Un09DWeKiYAYO/1DKtU/hNkAJ3eGILdvsSu0Q0Gb7C9LLPVSgcqupsqEe077e4=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 09:56:39 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 09:56:39 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Martin Jansa
	<Martin.Jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Marta Rybczynska
	<rybczynska@gmail.com>
Subject: RE: [OE-core][PATCH] sqlite3: Whitelist CVE-2022-21227
Thread-Topic: [OE-core][PATCH] sqlite3: Whitelist CVE-2022-21227
Thread-Index: AQHZkSi6Z7xD9vvOZk6/O4IA1imQCa9w2hMAgAAUC3CAABLwgIAAAFoA
Date: Mon, 29 May 2023 09:56:25 +0000
Deferred-Delivery: Mon, 29 May 2023 09:55:33 +0000
Message-ID: 
 <SJ0PR11MB67174DAB3743A14E521A982FDC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230528055252.3869703-1-schitrod@cisco.com>
	 <CA+chaQeCpJ-70Je8non8KADuDk8SZzysN7KiDFNFDd3-dVY6sA@mail.gmail.com>
	 <SJ0PR11MB671709960318A78D507DF394DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
 <4f049c921da7f473f90d63205de9391b153db51c.camel@linuxfoundation.org>
In-Reply-To: 
 <4f049c921da7f473f90d63205de9391b153db51c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|PH7PR11MB6883:EE_
x-ms-office365-filtering-correlation-id: c4365848-19d5-43b7-7fcb-08db602aff1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JT3TFNVaOWHUCFHWiqDEXv36cAejogUEHd0IjObm65Wykv/ZkNwERYVskZ3QDzRAbDXVBulMMgk/Jx/mdpQlSvo/WgM50hfxMgdw0LsSFeWfHtj4UZt4GpggWHZ8ipT9tE9y+35sRBPfEvhtd5N7mT7BZUw8ZqxGVJ3nm+T+DQCvnAl32/CvMTCnE2E4fm2p5FB4/k8w74I3WmoPhUDwiGOm+6OgNI591sknVhMHHOvuEZOU+LZlWiMl9v6/xsHVJqxmuKF0OrGVWxJTQgAZaprWUXY2l4W4zuzUY4MFJMC6XF6BcifXv6zRUnlYAJaQ1twnqkWzHstM2hwHVKWcuv6qwRCXDwESel5xz8OgL1dIOMfFBpkVcOjYoetoTve4P4JNH3ktHrQbqx/iXXCLeBku1RTcySc1RQWXja5R5oe5BZTr7TMb1HnlR+6+944XnO0EUxgDbg2rGvC+XM94jtqbwt9ArCN/PHPb//3JKOrQd2WyrnTWWL5t8eYAp1yE6nmXu+ZtiVplWryMmmXZm88HSmQYGyTgtfh4FsktIzR0nirXso6i7ToNXYwA+fwDAjvKi8cOlTINDKkDpcOpprCXgTxhH/9iLqE0U/IJ4CdtzF+AL1JVjvCod14ZoVHXMuM1+q4gafesmWha9nfLCA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(83380400001)(86362001)(33656002)(71200400001)(5660300002)(6666004)(316002)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(52536014)(4326008)(122000001)(8676002)(8936002)(966005)(41300700001)(38100700002)(7696005)(55016003)(110136005)(54906003)(53546011)(2906002)(6506007)(38070700005)(9686003)(186003)(478600001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cmhOUUQwKzNqS3VTK2ZBczdkTW80aWQ3N3Jzays5K251clIrcUdKamw0Y1pL?=
 =?utf-8?B?Q0lJdjdRWGJTVmRUREZTWG5QYllHMDlZVE02YTVLVlFWTW1razdQQU91Si9D?=
 =?utf-8?B?bllucnZkNENoY1pTOWFCVk5ERGhNL3lEb3VDMEFuT0dDaWlMUUVaL1ZNRW5C?=
 =?utf-8?B?Z2hRZEsvcFRLbzEwV0MwaUlpRFV4eS9xRHBFMkcxZXRlOGNhclhLR0I0akcy?=
 =?utf-8?B?ZWc5c2YyM1U3ZjVkRFBQZm9UZTNRRElhTzZxN1FIZHlEYVpxV21nN0hYRU9D?=
 =?utf-8?B?cldodkRxQzNMaUFyaXJ4Vy9XQjIwUXBaQXlqRlF5THZ5N1BHRWhWdUt0b00z?=
 =?utf-8?B?NElKUDJDTE41MjlSeVhKYWhoa0NyWnYzbVhoQzlCSm9lcFJVTkMvMFFXbUFV?=
 =?utf-8?B?RCtOWnFnVVllZVhPcExYQXFha08yeG5Idk13VjBHNU5oU1RWTTg2bnVvY0tI?=
 =?utf-8?B?MEJkMjRZR3VrRjlVbzZPbUk3anZqRGlTRkdETEZJVDNUNThjTzZMN3dJVmdx?=
 =?utf-8?B?Q0VVRE9uQVdmSkdwZjVJNzlxSlBKNlpMU3Jjek5qK1FJWW5CUENnMDZkVTJY?=
 =?utf-8?B?dWR2SUVDQTlmTG84YlRnTEF0KzJzRlZsSkdRdExFeXRiOEdVUHd4MG44T0FR?=
 =?utf-8?B?eEZHUW54YTNtM2lVZVY2ZjlOTmcwQ0FSWHhFYi9OaUhrbUd3bDBCUEM0cVRQ?=
 =?utf-8?B?b2NkRlJFKzVRRW5TRWpiNE1vbkNkRDBQSXJ5aUhhMGtkRE42eVF5bGU4T2pP?=
 =?utf-8?B?bWNLNkM1dk9oblFKeFhUOURsZmlWUFhwbGxueEt0Uk9LMXFlaThwNVV0WmMv?=
 =?utf-8?B?dkpiRGYvRldCTjJmQkdXT0Eyank3TzFmbEdtMzZ5bnBaVC9WVFFRaVpNRUx0?=
 =?utf-8?B?RUZwUVlQelAxK2V3bXhncmY2b0tVTklyUFpnZm45bVhuNGMzN0lXQmRzWTI4?=
 =?utf-8?B?UkQ3emtXZlVWREpWc3ZkYkJhckZKeEpXUzErQk5ERDZCNDNmVVVrR3U1bTNu?=
 =?utf-8?B?S2pPM0dWWG9ySmVRMEoxWEZBUGNZMEhHdUNTbXVZOXA4U09jYjZVenp6bWtQ?=
 =?utf-8?B?OXBoc2tQQW1PeEdJQWhlSlBhSExqc0lSVzQzWU52L2NybWQ2b0UrRGJ5WE1G?=
 =?utf-8?B?NURPZWoxZEtHemFOY0RqVzhEKzJGdXZ2MGo4clRmN0JiNU5CWU1td1NwQzBP?=
 =?utf-8?B?eUJDZEsrN2JrU05hQW1URGZGTFlkUjJWeUQ4ZlpMbWFiOEcyQUhua3lDQ1FK?=
 =?utf-8?B?TUhxKzk5azZpZGRHOU5HTjIvRHFnZndJNE1nTEJOamVlb1hDS2xSOEMxSVcv?=
 =?utf-8?B?dDArcitDY0N2UWJqSGk2b29tanp6SmJGMmhFc0VtdUtIN09KMkNGQjBXaVNn?=
 =?utf-8?B?Q090WGcyWm92NXE0ZHV2Z0RnTVZkTGhxRWQ0RXJiQ1BKNkNBU1duUFdaQzZL?=
 =?utf-8?B?b083UExCUXBMUi91NHk5Y1BEVVBsaTc4cVNOcWdtRm5neGlPTUN2TWZTSGtH?=
 =?utf-8?B?d0JTSVZWdFFGZVFMUDVoY2xmcG9SMjloZmY4dmYxTTZyMEtYSnNIbGVwcXhq?=
 =?utf-8?B?aitGVHd4bmRzcEFlaTg1NU5GaHA5QVZTQ3p1ZjRndFg1ZTRUNzlKMk0zMkpl?=
 =?utf-8?B?SkxBR1VURTlBYWYwU0hXRlBpZWRIRXFDcmJwUDRjM2UyTU84L2tjUmw5N0pN?=
 =?utf-8?B?TDNCVWpFclFtc1FlbGFKSEZybVJDNzlkMVNXY3h1UGZYY3p0U0hNRHcwMzlX?=
 =?utf-8?B?SFRERUYzby9zUWpqV0diOFZ0NitHa1NQcEo3NmZPbERWcjAxbmdCNmlTeDda?=
 =?utf-8?B?UzRFNTNIblM2TUtPcWlXaGoxUHQ4V2EyM3UxUUtBU2R2NEJzWnJPRzlFOHdT?=
 =?utf-8?B?UnhBTHZkcm0ySHJJcDA4RmhhTnNjMVNrN2Nad3Y2WkRLeDYwZzE5OTQ2dThB?=
 =?utf-8?B?b3N6K0NPY2hKT1BOTVdjTXJFVGY2WDJseEt1MVlsNWU2K0RuNnQyaXhsN2h3?=
 =?utf-8?B?WS82WDgrbWNrZ05SZGgrTG5GNmN3RzFyVU15M3NNWWZuaWFEQWRjVll5NExJ?=
 =?utf-8?B?ZmxmZTF0Nk14YXlDK3pINk1CYnhGSU5vZ2k1eDNZZG9DUkRnS2ZTaFVSZFlk?=
 =?utf-8?Q?kIy5wV/zl/7cMqYXI2VkR52HZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4365848-19d5-43b7-7fcb-08db602aff1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 09:56:38.7999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9cq5BT/2h+ZJhpqg7crOt6hRMNqE2kO7IaGtwDKpIaDLHq3Pu1O1oU9nSPHsKbP+Z+DsHGwnGgNCmO1r26EeWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181860

SGkgUmljaGFyZCwNCg0KUGxlYXNlIGZpbmQgYmVsb3cgaW5mb3JtYXRpb24gb24gc3BlY2lmaWMg
U1FMaXRlMy4NCg0KTlZEIGhhcyBDVkVzIHJlcG9ydGVkIGZvciBzcWxpdGUgYWdhaW5zdCB0d28g
ZGlmZmVyZW50IHByb2R1Y3RzOg0KMS4gc3FsaXRlOnNxbGl0ZQ0KCS0gUmVmOiBodHRwczovL252
ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMC0xMzQzNQ0KCS0gVGhpcyBwcm9kdWN0IGlz
IGFwcGxpY2FibGUgdG8gb3VyIHNxbGl0ZTMgU0RLIHNvdXJjZQ0KMi4gIGdob3N0OnNxbGl0ZTMN
CgktIFJlZjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjItMjEyMjcN
CgktIFRoaXMgcHJvZHVjdCBpcyBhcHBsaWNhYmxlIHRvIE5vZGUuanMgU1FMaXRlIHdoaWNoIGRv
bid0IGFwcGxpY2FibGUgdG8gb3VyIFNESw0KDQpDb25jbHVzaW9uOg0KLSBUbyByZXBvcnQgQ1ZF
cyBvZiBTUUxpdGUzIHNvdXJjZSBhdmFpbGFibGUgaW4gU0RLLCByZXF1aXJlIENWRV9QUk9EVUNU
IGlzIHNxbGl0ZS4NCi0gd2UgZG9uJ3QgcmVxdWlyZSB0byByZXBvcnQgQ1ZFcyB3aGVyZSBDVkVf
UFJPRFVDVCBpcyBzcWxpdGUzLg0KLSBJbiBZb2N0byBTREsgc3FsaXRlMyByZWNpcGUgc2hvdWxk
IGhhdmU6IENWRV9QUk9EVUNUPSAic3FsaXRlIg0KDQpUaGFua3MsDQpTYW5qYXkNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IE1vbmRheSwgTWF5IDI5LCAyMDIzIDM6MTEg
UE0NClRvOiBTYW5qYXlrdW1hciBrYW50aWJoYWkgQ2hpdHJvZGEgLVggKHNjaGl0cm9kIC0gRS1J
TkZPIENISVBTIElOQyBhdCBDaXNjbykgPHNjaGl0cm9kQGNpc2NvLmNvbT47IE1hcnRpbiBKYW5z
YSA8TWFydGluLkphbnNhQGdtYWlsLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnOyBNYXJ0YSBSeWJjenluc2thIDxyeWJjenluc2thQGdtYWlsLmNvbT4N
ClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHNxbGl0ZTM6IFdoaXRlbGlzdCBDVkUtMjAy
Mi0yMTIyNw0KDQpPbiBNb24sIDIwMjMtMDUtMjkgYXQgMDg6MzkgKzAwMDAsIFNhbmpheWt1bWFy
IGthbnRpYmhhaSBDaGl0cm9kYSAtWCAoc2NoaXRyb2QgLSBFLUlORk8gQ0hJUFMgSU5DIGF0IENp
c2NvKSB3cm90ZToNCj4gSGksDQo+IMKgDQo+IEkgaGF2ZSBwcm9wb3NlZCBzZWNvbmQgY29tbWl0
IHRvIHJldmVydFJldmVydCAic3FsaXRlMzogdXBkYXRlIA0KPiBDVkVfUFJPRFVDVCIgLSBQYXRj
aHdvcmsgKHlvY3RvcHJvamVjdC5vcmcpLg0KPiDCoA0KPiBPbmNlIGFib3ZlIGNvbW1pdCBpcyBh
ZGRlZCBvbiBtYXN0ZXIgdGhlbiB3ZSBkb27igJl0IHJlcXVpcmUgdG8gYWRkIHRoaXMgDQo+IGNv
bW1pdC4NCj4gQXMgQ1ZFLTIwMjItMjEyMjcgaXMgZGV0ZWN0ZWQgZHVlIHRvIGFib3ZlIGNvbW1p
dCBvbmx5Lg0KDQpNeSB3b3JyeSBpcyB0aGF0IHdlIGtlZXAgZ29pbmcgYXJvdW5kIGluIGNpcmNs
ZXMgb24gdGhpcy4gQXJlIHdlIHN1cmUgdGhlIENWRSBkYXRhYmFzZSB3b24ndCBsaXN0IHRoaW5n
cyB0aGF0IGFyZSBhcHBsaWNhYmxlIHVuZGVyIHNxbGl0ZTM/DQoNCkNoZWVycywNCg0KUmljaGFy
ZA0K

