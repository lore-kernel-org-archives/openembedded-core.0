Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E72C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:48:08 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29167.1784656079146735209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LDeIbk/N;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=44710; q=dns/txt;
  s=iport01; t=1784656079; x=1785865679;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=loYQ1ELN7OQNLwobI0xlAFCKv2nNAYPHAAtxIq8/3tY=;
  b=LDeIbk/NGxv6Wrk4hKbcRN0Z4DeJhLuBieI2hwqUdUhnc9RWT+RPvUZz
   fXplFDGf7mMzRpNqpQtNbtjKOREc9JqYlQD1hTy9dUh8uef7eN6p/zHz6
   9eHejfAXhCjJmgbJ7oNKaPm1TZveeuSCYXhZUf3EWk63404ptiS9mNHl/
   V2zmp90A7x9bJFTYTxzNR4yHhZBksf4ZqL3EguImTOdjb5XCvp/jTstFK
   yucsIapWRfwaJ//3DLXB45cAnJ5MmE6N4z1MNB6Se5J4giXGvP2BpKNqE
   vBxQfcua9GbyQTGMD5DHCDssqF8MCMWfg7uIK1xx/RortsrTJbcUVRNRr
   w==;
X-CSE-ConnectionGUID: nDTW4tnzQvC+7b3+O9AhjQ==
X-CSE-MsgGUID: t2D+2ZJFSr2sGTTvXXM3NA==
X-IPAS-Result: =?us-ascii?q?A0BVAAB4r19q/5L/Ja1aHQEBAQEJARIBBQUBZYEXCAELA?=
 =?us-ascii?q?YE8MVOBCAKBDxJJA4ggA4RMX4ZYgiEDnhsUgWQGDwEBAQ4BLgEbBwQBAYISg?=
 =?us-ascii?q?nMCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GW?=
 =?us-ascii?q?gEBAQEDAREIDVcLAgEIEQMBAQEBIAENJwodCAIEARIIGoJhgh0WQQMBAg6oa?=
 =?us-ascii?q?Yt+AYE9AolZGjd4gQEzgQGDaAJD3AoUAYE4AYU+gxwBASqBNYJdgSIYAYR8J?=
 =?us-ascii?q?xsbgXKBFUKCaT6BBYFcAgIBF4EJFAEqHoN1gjAEgiJ6EhtyTRgGgXaBCleBG?=
 =?us-ascii?q?IsgUnIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnEg8dFxYeWBsHBRIgK?=
 =?us-ascii?q?kFFIwNDPzgLQwWBVwKBf04jHwM5f4EvdUp3LWoCEBdKOCSCFIE6AlUDC209N?=
 =?us-ascii?q?wYOGQMEgTUFjGgHWyOBcUgHexMBKgEgLzQCfw8ZBhYCMJJxKo8lR4E1jGSTZ?=
 =?us-ascii?q?IEzCiiDdYwhjT6IMheEBIFXiz0Ei0iOCAuYfSONZ5YAhQ4CBAIEBQIQAQEGg?=
 =?us-ascii?q?Wg8gVlwFYMiCQpAGQ+OKhmDYIQHgQzHHnkLAy8BAQcCBw4DC4FokAABJ4FWA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23:3CCMah86vTS6av9uWBDoyV9kXcBvk6//MghQ7YIolPcXNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:mREY7ayueXF1kk1Z4S16t+dsxyrEfRIJ4+MujC+fZmUNrF6WrkVVy
 DRODTzUbKrYYDf0et8lPN+/o09SsZWAxoBrSVBs+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDtMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEcaAbJE5uBlOH9lt
 qMSc3MqPzmDhdvjldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaYGNJIzUGZ49ckCwu
 jjqvD7LID8hLoaE5ga57EKco7TptHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:Jx+RoqrkkDV+rFBI/F23STAaV5siLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H+BEDhex/hHO1OkPcs1NaZLUXbUQSTXfpfBOfZslnd8mjFh5JgPM
 RbAudD4b/LfCJHZK/BiWHSfadDsby6GeKT9JrjJhxWPGdXgtRbnn9E43GgYzRLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRhOerAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyGIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 F2NiOixthq5CH77WDADuvzJlZXf42P0DwfeNso/jliuE0lGeZsRMIkjRto+dw7bVPHAcgcYZ
 lT5YfnlbdrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomNrdLQT9TpE+CTZ9U1wrq7UR/R/lp
 f5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZeo60l/22tfKCY8OlamXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKhizi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHcZpY5ummnZ5rAQD2KwXsrKtmpwwE68vl5CrFx
X-Talos-CUID: =?us-ascii?q?9a23=3ASFOiHWgMiQu36fU5hZWckTdYRjJudFHh8yvMJV2?=
 =?us-ascii?q?BF00qF7fOCnjB0aNmqp87?=
X-Talos-MUID: 9a23:/l/KQArBZLZxx95eCBIezy04GIQy0YaAM1pXiro6h9e0BQkrHR7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:47:57 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B086918000203
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:47:57 +0000 (GMT)
X-CSE-ConnectionGUID: QMtMkziMTbq9DoROzWWemQ==
X-CSE-MsgGUID: I/2U1u4ESHq9I5TgsKLLrw==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208,217";a="65397051"
Received: from mail-southcentralusazon11011063.outbound.protection.outlook.com (HELO SN4PR0501CU005.outbound.protection.outlook.com) ([40.93.194.63])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:47:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc7iAdEJaEzT9H37Q73eY+hgoluKA9PIer2OnpXmxhtMT++9OrOV4toczenyGQNux7L6eu9HgE5zhzWFsN4lhdEom7C+qj477VAurZ7zeT6zaSrelVVKf1EoI+yxW2yNrb7DVi9Bpkv7M5E+jWSyv0HguHiy8+EQUcHNdZT26kmFg3Bk0RtyZ740kTeF3twm/FqlXzgFv9xK9eSTG+JHilWS7kM2KmDxZRV5zexz6rjnS1f2lTkbP9mLoD53++LzOs8zax3aor0EJBfSOt9HQUoOC88Eh0uOVosgMndwnsVcTBkBVZCuGQe0AG65n75SXcj3qsTCBF6tl+qNa7lwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loYQ1ELN7OQNLwobI0xlAFCKv2nNAYPHAAtxIq8/3tY=;
 b=NWwkoRVjIa7tcGueLupL94nglkSi+mxZ/l1xDdhQAEBSGYksNeGEZVFdFtWx/x5XFmY5asIG9a/vbIA3Ejj7ROEy6EJqmsrn8Bx4FrZ36PvQOxvxbaIOWHM36eiTILT3/cwVur8Pu9V+94i0q8JdCcj1DnrVU+QfCDTteucpHBXgpqY6PUkIJu94TKNuc19jD3ITKGCagpcP0Wcescj7Z/BC4HGXwtXAY0Lu51Gp4VkQS2ZgBgsTire45NwzSSKL9yArIJC/1J/+VvKzeaScft9ecIy9YVUOmWeEUViRQtXO5h7FZiV2ibtKKXczSlLEUUF0l3o2YEED9ThVk+djLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Tue, 21 Jul 2026 17:47:55 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 17:47:54 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
Thread-Topic: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
Thread-Index: AQHdAwPGmbka7w43kke3FJHrdbMoobZUjCcAgCH2FRGAABrpgIABznLJ
Date: Tue, 21 Jul 2026 17:47:54 +0000
Message-ID: 
 <DM4PR11MB61895A07822B39893EAD0F5BC4C22@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260623113037.28968-1-adongare@cisco.com>
 <20260623113037.28968-8-adongare@cisco.com>
 <DJL0OIF53N7U.2AAPEB2LOEEDT@smile.fr>
 <CY5PR11MB6187FB6F4790AEC08A95E75CC4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
 <DK3GJFTCQ7JU.3J1XZ185ILGS5@smile.fr>
In-Reply-To: <DK3GJFTCQ7JU.3J1XZ185ILGS5@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|CO1PR11MB5012:EE_
x-ms-office365-filtering-correlation-id: c825d33a-4f1c-4acd-e033-08dee750314e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|13003099007|18002099003|22082099003|38070700021|8096899003|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 /qaL1Fe24sscMgqmQPl7XM7bXwuVGqfe5fHIxjFm1umUZi42jThjP8SEMy3w7Q2aj9gWq6RlPHAHPsJhBkXwcTcw8Fi9HtY5nsc2apmVaHXcLHNMct7f6NnoeDDowk30zDwoY+tmouKVoYCiv0PGmIMxFH+XzakKvJlanwBIYkpK+zxm4YuaC1lpfOUVYFNIt8FUoPWsQPgv+EUwJItDlJFqmITb76K9OyiNpyALZASIeoJSw+slW2tDYUtd9PJzb8fsW73d6Ezxf+Hcftdfs9Bah+cirPkald3tg0Qa5HlPpEl8+uFdDO3l4eBiRJhwM9gH96ZTqaJ5o3zrtCpcsQU032LLHxExAmsOgPy2qMKysPTScmIQqCdpzkTDPcW4KLw7MtTAo1Fkyoh8lU00XHsNyGHnq7PkxZGnlqG893w2Yw5kEueoWEeSOHGdPpm3VSD9fyX/bBXVn4aVla2UaA/sRtVvJ2VGLkv3jdK/IiPw0HHpXXDzBNxctoZM4bMMuMUPMUoeza7VsvP0hFPdc4ocNsXj6UC35L9cBHXuVKL/YR+7k5EtWZhAF3vBHLk15O9QDqlXnly3qXzOL14mRj0kUyZcplE7PJqaeLFYvD+q1hoWE88LQadRly/W/8cCZgLKxsfgRi+aOQtANRu6zGID3GR+0pVEa6lYot0Pfrs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(13003099007)(18002099003)(22082099003)(38070700021)(8096899003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0kCleUd1Vo8V6usO/rLf9ftmC05YvfSGEVA3VBp26YGY5w+f7DbM8DUUME?=
 =?iso-8859-1?Q?KVK+VGyBRzfh4m6mIh2uZWCGq5gBMwX3Tw1A91OnygAc6dF/faFOwLCmWF?=
 =?iso-8859-1?Q?U6DwFGpNyleNm7NNzkQPEzsSMIqOZwvbCdc+h9mVx06bNyqGbiuxMLKwap?=
 =?iso-8859-1?Q?8TKb1yhq0GwU7yDr11ev/oMtBdX6Sw46iI8SrOd2hUopAJckAWnvEcHkrK?=
 =?iso-8859-1?Q?xbof6sr34rdnnFjI9Itsb6OjzImTrI0jdcAPrZKhAPi4ouP6uBhDHRq9DP?=
 =?iso-8859-1?Q?WlvRm+uiGx/7kS5Q4N/MuMzuWLz/Z3m1uQheO+oys6a0A/gCQfqKL0uclb?=
 =?iso-8859-1?Q?SVsWO0uS5aoKDvn5L30F6ol85evEytLIsArNcNHpai+noQzNNtAM8NHmDG?=
 =?iso-8859-1?Q?Jwo9fHvAmp3gpu8RG1VohACClOeXeeqTaHow9nxUb4QfkGKSOGKLTSUnkw?=
 =?iso-8859-1?Q?qpP1xOD6AzrdDT/lsxZiy0stS6PhOdNZYyMooeQLwrwSCAtiRCiEVYfxZ3?=
 =?iso-8859-1?Q?c5eBAnenIpKahKiBd+1wGtyx8eLa04zgf+a9i2qgKAdfyzmZO2wuGScZA2?=
 =?iso-8859-1?Q?cRV6BsEWpms/Uer2w98rKf8AhIHTwXBfgigM2AnIwePB8wFmSgOICA4eOL?=
 =?iso-8859-1?Q?cjKyvqFoHhXWpZfLMspKS4JB9FxG38BHkwJIcfNfImgDWlfupsYSfJqJu1?=
 =?iso-8859-1?Q?RqdijLkdH/MShxpvW0wxzS5L2nTRu3RNqnhZaqEubhDIgY4P/UjiJrsep2?=
 =?iso-8859-1?Q?I4/e08M8KDaXWMvxB1AqiVR8q974+ruQe+kfE3tNkS3UTMQYG8LJnBEgz3?=
 =?iso-8859-1?Q?Yzylpesgr8denrRVYZginPkfSIxPtFPTgKq7lwUaTHSgKQwyuztVaWubTk?=
 =?iso-8859-1?Q?ez/bNcFFFM0Nzhu7zeqKto97WT2mSLYUTosmHgg+xnD92vd7gRwXZw0Jiy?=
 =?iso-8859-1?Q?E1CmwQ9OsOFdkBOttGIBxkNR2Bw/CagudwqLAAJP0b/skDlE8O0cYB366Q?=
 =?iso-8859-1?Q?RWnmduo+m3KO8TOusB6leMom92WU8NJ6pjw5Cr+0p1sBNju73wEQmFDxPq?=
 =?iso-8859-1?Q?mfUk4xUe52QwfXpnKYDrPF1xe4l6pyQTbaiYCNg9C7l1EFTEstz/pRI2Ww?=
 =?iso-8859-1?Q?gU9p6vyiXvuRlCW1FOFHlaQVkCN4pAy/Dy/1dczLwpx2R5l8gWPdqNC9NA?=
 =?iso-8859-1?Q?VvKw3Oo6XUwA83yTJkTskWyuWgGVvP7W+Ns/FTsCFLNv/yazgWegHOT1QL?=
 =?iso-8859-1?Q?4206gTMJXfEVqtE4ns5zENM7I0xrA+lIaJ7ognBo9LgjDo2BVRqPTKPQxz?=
 =?iso-8859-1?Q?w1c4c5kTGeKWnlOpfDFEenbzqA+hxgFwrNy5UGiZdLA3k2Vm6K/v5ECRjT?=
 =?iso-8859-1?Q?zwSZx8Mi25UU3vVBF2Or5GoyCKZ/XlxgLqoLtev54FA4gxI+cOvpz99io+?=
 =?iso-8859-1?Q?UGWE8Xep9zl257aBo5mG5i6NZlMvYZOB+8N/Fmqj/eSxGsw/J1IqDDY5oj?=
 =?iso-8859-1?Q?r/9pD7yYBdejzb1ySsCR7Y561YOaZV7wUH6ewvepH/BIn5bv+tqNyKAdpH?=
 =?iso-8859-1?Q?FZFn/EmHeow/xPasbkOBm4fV3uxsVf41JY0MTL9tPxVwjewt8URcQvLW9S?=
 =?iso-8859-1?Q?A2qHKGHhA6rzNllxxwfB6IfdSkemJU7q/LTTDMLpPQRjld2qvJS7HtCZ3Z?=
 =?iso-8859-1?Q?BRWZBaGmeDLeEzqmGwNmmqWMsjVD7p5mfya85HXw9H+FvD6xvyWvGURL0g?=
 =?iso-8859-1?Q?nvwErqWkzOwHowtAhYA0GEHoRfpkbpbHyMuWsEuFRtVziA?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61895A07822B39893EAD0F5BC4C22DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	DaRRj6XvE2A0Bvqq71QU8CaXOJDTwcunPQRv/wd9TzaB2/ew3pwLYjAlx7CeDpaZh0HQxP3DsGdUTSbfr3AKnJqkfGjOEybuOsWPB68jC8D4iLmstJejDtanR6Sydy/i1bIGgq9DwDkgbFpjXqFqZQLkYiTqFCqTx9oSyIJjONMuJeIrE409Ef3Be64ZDdWyG4KR8rUbKh8h6Fw87+Ek4P5DhQVyHk1lG7OZyrlQR5+5BqJvbVHlc7O91MmIax7OGk+jyNS9r3qEMjsr4M8LP8Mg2i4269P/Y2PQmNywMoaBaxhfaUZTACwS0Y+9cr8MuTcTFB6kgHe8H3VJqlk20g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c825d33a-4f1c-4acd-e033-08dee750314e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 17:47:54.3608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2luaOK38ZYeM/Kc47fQSm/oH6KEHxFFXjZm2T+0KPql88lDRxJcR4Q3Zmb+V4KgvlWyHcHPJGyc05XD9ZxUQdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241567

--_000_DM4PR11MB61895A07822B39893EAD0F5BC4C22DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have submitted the refreshed v2 patches of scarthgap as below:

  1.
[scarthgap][PATCH v2 1/8] cups: fix CVE-2026-27447<https://lists.openembedd=
ed.org/g/openembedded-core/message/241559?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381173>
  2.
[scarthgap][PATCH v2 2/8] cups: fix CVE-2026-41079<https://lists.openembedd=
ed.org/g/openembedded-core/message/241560?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381174>
  3.
[scarthgap][PATCH v2 3/8] cups: fix CVE-2026-34978<https://lists.openembedd=
ed.org/g/openembedded-core/message/241561?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381175>
  4.
[scarthgap][PATCH v2 4/8] cups: fix CVE-2026-34980<https://lists.openembedd=
ed.org/g/openembedded-core/message/241562?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381176>
  5.
[scarthgap][PATCH v2 5/8] cups: fix CVE-2026-34979<https://lists.openembedd=
ed.org/g/openembedded-core/message/241563?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381181>
  6.
[scarthgap][PATCH v2 6/8] cups: fix CVE-2026-34990<https://lists.openembedd=
ed.org/g/openembedded-core/message/241564?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381182>
  7.
[scarthgap][PATCH v2 7/8] cups: fix CVE-2026-39314<https://lists.openembedd=
ed.org/g/openembedded-core/message/241565?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381184>
  8.
[scarthgap][PATCH v2 8/8] cups: fix CVE-2026-39316<https://lists.openembedd=
ed.org/g/openembedded-core/message/241566?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C0%2C120381185>

Thanks for your review.

Regards,
Deepak

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, July 20, 2026 7:40 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079

On Mon Jul 20, 2026 at 2:39 PM CEST, Deepak Rathore -X (deeratho - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
> Thank you for your review.
> Regarding your request below:
> "Can you send a v2 of the whole series with this cleaned up?
> Please split CVE-2026-41079 and CVE-2026-27447 into another series as tho=
se need a wrynose fix."
> The wrynose fixes for both CVE-2026-41079 and CVE-2026-27447 have since b=
een merged.
> Given that the required wrynose fixes are already in place, could you ple=
ase confirm whether you would still prefer the v2 submission to be split in=
to two separate series, or if we can resend the cleaned-up v2 as a single p=
atch series?
> Thanks for your guidance.
> Regards,
> Deepak Rathore

Indeed, in the meantime, those 2 merged on wrynose:
* 6aa0976fa62 - cups: fix CVE-2026-41079
* b36ab95b537 - cups: fix CVE-2026-27447

So you can send a single fixed v2 patch series.

Thanks!


> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Monday, June 29, 2026 3:27 AM
> To: Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) <ad=
ongare@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; to@=
cisco.com <to@cisco.com>
> Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
>
> On Tue Jun 23, 2026 at 1:30 PM CEST, Anil Dongare -X (adongare - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Anil Dongare <adongare@cisco.com>
>>
>> Pick the upstream patch [1] as mentioned in [2].
>>
>> [1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92=
197ca99609b3f080
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-41079
>>
>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>
> As far as I know, this fix is also needed on wrynose:
> CVE-2026-41079 impacts "up to 2.4.17 excluding" per NVD and wrynose has 2=
.4.16.
>
> Can you send a fix for wrynose so I can take this one for scarthgap?
>
>> ---
>>  meta/recipes-extended/cups/cups.inc           |  1 +
>>  .../cups/cups/CVE-2026-27447.patch            |  4 +-
>>  .../cups/cups/CVE-2026-34978.patch            | 25 +++++--
>>  .../cups/CVE-2026-34980-regression_p2.patch   |  8 +--
>>  .../cups/cups/CVE-2026-34990.patch            | 19 ++---
>>  .../cups/cups/CVE-2026-41079.patch            | 72 +++++++++++++++++++
>
> This patch touches a lot of patches added previously in the series. I
> think this is a mistake and those changes should either be dropped or
> squashed in the proper commit.
>
> Can you send a v2 of the whole series with this cleaned up?
> Please split CVE-2026-41079 and CVE-2026-27447 into another series as
> those need a wrynose fix.
>
> Thanks!
>
>
>>  6 files changed, 106 insertions(+), 23 deletions(-)
>>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch
>
>
>>
>> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended=
/cups/cups.inc
>> index c2bf572bf5..64f71c9465 100644
>> --- a/meta/recipes-extended/cups/cups.inc
>> +++ b/meta/recipes-extended/cups/cups.inc
>> @@ -31,6 +31,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-$=
{PV}-source.tar.gz \
>>             file://CVE-2026-34990.patch \
>>             file://CVE-2026-39314.patch \
>>             file://CVE-2026-39316.patch \
>> +           file://CVE-2026-41079.patch \
>>             "
>>
>>  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-27447.patch
>> index 77a26dae64..1884acfa9f 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
>> @@ -22,9 +22,9 @@ diff --git a/CHANGES.md b/CHANGES.md
>>  index 4a2e25d..0da2c55 100644
>>  --- a/CHANGES.md
>>  +++ b/CHANGES.md
>> -@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)
>> +@@ -21,6 +21,8 @@
>>   Changes in CUPS v2.4.10 (2024-06-18)
>> - -----------------------------
>> + ------------------------------------
>>
>>  +- CVE-2026-27447: The scheduler treated local user and group names as =
case-
>>  +  insensitive.
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-34978.patch
>> index d05bc85588..b4b83a41d0 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
>> @@ -22,13 +22,10 @@ diff --git a/CHANGES.md b/CHANGES.md
>>  index 7a5e8813f..429ee874f 100644
>>  --- a/CHANGES.md
>>  +++ b/CHANGES.md
>> -@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)
>> - Changes in CUPS v2.4.10 (2024-06-18)
>> - ------------------------------------
>> -
>> +@@ -24,6 +24,8 @@
>>   - CVE-2026-27447: The scheduler treated local user and group names as =
case-
>>     insensitive.
>> -- Fixed cupsd crash if user does not exist (Issue #1555)
>> + - Fixed cupsd crash if user does not exist (Issue #1555)
>>  +- CVE-2026-34978: The RSS notifier could write outside the scheduler's=
 RSS
>>  +  directory.
>>   - Fixed error handling when reading a mixed `1setOf` attribute.
>> @@ -100,3 +97,21 @@ index 2d80a960e..2dc7376c1 100644
>>  +    {
>>  +      send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notif=
y-recipient-uri URI \"%s\"."), recipient);
>>  +      ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM,=
 "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
>> ++      return;
>> ++    }
>> +       }
>> +       else if (!strcmp(attr->name, "notify-pull-method") &&
>> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
>> +@@ -6010,6 +6016,12 @@ create_subscriptions(
>> +                      "notify-status-code", IPP_ATTRIBUTES);
>> +        return;
>> +      }
>> ++    else if (!strcmp(scheme, "rss") && strstr(resource, "../") !=3D NU=
LL)
>> ++    {
>> ++      send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notif=
y-recipient-uri URI \"%s\"."), recipient);
>> ++      ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM,=
 "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
>> ++      return;
>> ++    }
>> +       }
>> +       else if (!strcmp(attr->name, "notify-pull-method") &&
>> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p=
2.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patc=
h
>> index 73846cb8a3..0cf63b10af 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
>> @@ -43,10 +43,10 @@ index 25e9d65..fe60890 100644
>>   #
>>   # Test the lp command.
>>   #
>> --# Copyright =A9 2020-2024 by OpenPrinting.
>> -+# Copyright =A9 2020-2026 by OpenPrinting.
>> - # Copyright =A9 2007-2019 by Apple Inc.
>> - # Copyright =A9 1997-2005 by Easy Software Products, all rights reserv=
ed.
>> +-# Copyright =A9 2020-2024 by OpenPrinting.
>> ++# Copyright =A9 2020-2026 by OpenPrinting.
>> + # Copyright =A9 2007-2019 by Apple Inc.
>> + # Copyright =A9 1997-2005 by Easy Software Products, all rights reserv=
ed.
>>   #
>>  @@ -72,8 +72,8 @@ echo ""
>>
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-34990.patch
>> index e3d6e10a23..916cdc09a3 100644
>> --- a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
>> @@ -147,10 +147,10 @@ index 1dd520d..56855fc 100644
>>     {
>>       OSStatus                status;         /* Status */
>>       char            authdata[HTTP_MAX_VALUE];
>> -@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)      /* I - Cli=
ent connection */
>> +@@ -399,6 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)      /* I - Cli=
ent connection */
>>   #endif /* HAVE_AUTHORIZATION_H */
>>   #if defined(SO_PEERCRED) && defined(AF_LOCAL)
>> --  else if (!strncmp(authorization, "PeerCred ", 9) &&
>> +-  else if (PeerCred !=3D CUPSD_PEERCRED_OFF && !strncmp(authorization,=
 "PeerCred ", 9) &&
>>  -           con->http->hostaddr->addr.sa_family =3D=3D AF_LOCAL && con-=
>best)
>>  +  else if (PeerCred !=3D CUPSD_PEERCRED_OFF &&
>>  +           !strncmp(authorization, "PeerCred ", 9) &&
>> @@ -202,24 +202,19 @@ index b0d1f5b..11dcd39 100644
>>     {
>>       send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local use=
rs can create a local printer."));
>>       return;
>> -@@ -5621,9 +5621,15 @@ create_local_printer(
>> -
>> -   ptr =3D ippGetString(device_uri, 0, NULL);
>> -
>> --  if (!ptr || !ptr[0])
>> -+  if (!ptr || !ptr[0])
>> -  {
>> --    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"=
%s\" has empty value."), "device-uri");
>> -+    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"=
%s\" has empty value."), "device-uri");
>> +@@ -5634,6 +5634,12 @@ create_local_printer(
>>
>>       return;
>>     }
>>  +  else if (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ipps://", 7))
>>  +  {
>>  +    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-=
uri \"%s\"."), ptr);
>> -+
>> ++
>>  +    return;
>>  +  }
>> +
>> +   printer_geo_location =3D ippFindAttribute(con->request, "printer-geo=
-location", IPP_TAG_URI);
>> +   printer_info         =3D ippFindAttribute(con->request, "printer-inf=
o", IPP_TAG_TEXT);
>>  diff --git a/scheduler/job.c b/scheduler/job.c
>>  index 880c25f..6c033de 100644
>>  --- a/scheduler/job.c
>> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta=
/recipes-extended/cups/cups/CVE-2026-41079.patch
>> new file mode 100644
>> index 0000000000..f216c84e30
>> --- /dev/null
>> +++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
>> @@ -0,0 +1,72 @@
>> +From b8730b3e18852d203f7fa86a05ed0a8aa3a791e5 Mon Sep 17 00:00:00 2001
>> +From: Michael R Sweet <msweet@msweet.org>
>> +Date: Mon, 13 Apr 2026 11:50:23 -0400
>> +Subject: [PATCH] Limit num_bytes for SNMP string values.
>> +
>> +CVE: CVE-2026-41079
>> +Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/=
b7c2525a885f528d243c3a92197ca99609b3f080]
>> +
>> +(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
>> +Signed-off-by: Anil Dongare <adongare@cisco.com>
>> +---
>> + cups/snmp-private.h | 6 +++---
>> + cups/snmp.c         | 8 ++++++--
>> + 2 files changed, 9 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/cups/snmp-private.h b/cups/snmp-private.h
>> +index 52b8740..015f53e 100644
>> +--- a/cups/snmp-private.h
>> ++++ b/cups/snmp-private.h
>> +@@ -1,7 +1,7 @@
>> + /*
>> +  * Private SNMP definitions for CUPS.
>> +  *
>> +- * Copyright =A9 2020-2024 by OpenPrinting.
>> ++ * Copyright =A9 2020-2026 by OpenPrinting.
>> +  * Copyright =A9 2007-2014 by Apple Inc.
>> +  * Copyright =A9 2006-2007 by Easy Software Products, all rights reser=
ved.
>> +  *
>> +@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;      /**** ASN1=
 request/object types ****/
>> +
>> + typedef struct cups_snmp_string_s   /**** String value ****/
>> + {
>> +-  unsigned char     bytes[CUPS_SNMP_MAX_STRING];
>> +-                                    /* Bytes in string */
>> +   unsigned  num_bytes;              /* Number of bytes */
>> ++  unsigned char     bytes[CUPS_SNMP_MAX_STRING + 1];
>> ++                                    /* Bytes in string */
>> + } cups_snmp_string_t;
>> +
>> + union cups_snmp_value_u                     /**** Object value ****/
>> +diff --git a/cups/snmp.c b/cups/snmp.c
>> +index 54e348f..3222ff3 100644
>> +--- a/cups/snmp.c
>> ++++ b/cups/snmp.c
>> +@@ -1,7 +1,7 @@
>> + /*
>> +  * SNMP functions for CUPS.
>> +  *
>> +- * Copyright =A9 2020-2024 by OpenPrinting.
>> ++ * Copyright =A9 2020-2026 by OpenPrinting.
>> +  * Copyright =A9 2007-2019 by Apple Inc.
>> +  * Copyright =A9 2006-2007 by Easy Software Products, all rights reser=
ved.
>> +  *
>> +@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,      /*=
 I - Buffer */
>> +              case CUPS_ASN1_OCTET_STRING :
>> +              case CUPS_ASN1_BIT_STRING :
>> +              case CUPS_ASN1_HEX_STRING :
>> +-                packet->object_value.string.num_bytes =3D length;
>> +                  asn1_get_string(&bufptr, bufend, length,
>> +                                  (char *)packet->object_value.string.b=
ytes,
>> +                                  sizeof(packet->object_value.string.by=
tes));
>> ++
>> ++                if (length >=3D sizeof(packet->object_value.string.byt=
es))
>> ++                  packet->object_value.string.num_bytes =3D sizeof(pac=
ket->object_value.string.bytes) - 1;
>> ++                else
>> ++                  packet->object_value.string.num_bytes =3D length;
>> +                  break;
>> +
>> +              case CUPS_ASN1_OID :
>> +--
>> +2.43.7
>> +
>
>
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_DM4PR11MB61895A07822B39893EAD0F5BC4C22DM4PR11MB6189namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have submitted the refreshed v2 patches of scarthgap as below:</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://list=
s.openembedded.org/g/openembedded-core/message/241559?p=3D%2C%2C%2C20%2C0%2=
C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C120381173" id=3D"OWAf6f24c1b-5ac9-=
b069-1302-b5c2a8688a5f" class=3D"OWAAutoLink">[scarthgap][PATCH
 v2 1/8] cups: fix CVE-2026-27447</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241560?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C=
%2C20%2C2%2C0%2C120381174" id=3D"OWAd8c23b79-bb2f-c1bb-4126-dd7faeee48fb" c=
lass=3D"OWAAutoLink">[scarthgap][PATCH v2
 2/8] cups: fix CVE-2026-41079</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241561?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C=
%2C20%2C2%2C0%2C120381175" id=3D"OWA4c7e72d1-113a-1b00-307c-56f5b57da682" c=
lass=3D"OWAAutoLink">[scarthgap][PATCH v2
 3/8] cups: fix CVE-2026-34978</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241562?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C=
%2C20%2C2%2C0%2C120381176" id=3D"OWAc5913dd7-24ea-0899-ed23-2b682d15266f" c=
lass=3D"OWAAutoLink">[scarthgap][PATCH v2
 4/8] cups: fix CVE-2026-34980</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241563?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C=
%2C20%2C2%2C0%2C120381181" id=3D"OWA0570bd4f-5a8b-a0f4-9597-f39d4bd28180" c=
lass=3D"OWAAutoLink">[scarthgap][PATCH v2
 5/8] cups: fix CVE-2026-34979</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241564?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C=
%2C20%2C2%2C0%2C120381182" id=3D"OWA6a9f5124-b5a2-c3a5-4745-4df2502fd5b7" c=
lass=3D"OWAAutoLink">[scarthgap][PATCH v2
 6/8] cups: fix CVE-2026-34990</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241565?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C=
%2C20%2C2%2C0%2C120381184" id=3D"OWAd333dc18-32c4-ff50-fe11-b86dc10187db" c=
lass=3D"OWAAutoLink">[scarthgap][PATCH v2
 7/8] cups: fix CVE-2026-39314</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241566?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C=
%2C20%2C2%2C0%2C120381185" id=3D"OWA2e8283bf-357e-b412-dbcf-a8246a64b20b" c=
lass=3D"OWAAutoLink">[scarthgap][PATCH v2
 8/8] cups: fix CVE-2026-39316</a></div>
</li></ol>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Deepak</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 7:40 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41=
079</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Mon Jul 20, 2026 at 2:39 PM CEST, Deepak=
 Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann,<br>
&gt; Thank you for your review.<br>
&gt; Regarding your request below:<br>
&gt; &quot;Can you send a v2 of the whole series with this cleaned up?<br>
&gt; Please split CVE-2026-41079 and CVE-2026-27447 into another series as =
those need a wrynose fix.&quot;<br>
&gt; The wrynose fixes for both CVE-2026-41079 and CVE-2026-27447 have sinc=
e been merged.<br>
&gt; Given that the required wrynose fixes are already in place, could you =
please confirm whether you would still prefer the v2 submission to be split=
 into two separate series, or if we can resend the cleaned-up v2 as a singl=
e patch series?<br>
&gt; Thanks for your guidance.<br>
&gt; Regards,<br>
&gt; Deepak Rathore<br>
<br>
Indeed, in the meantime, those 2 merged on wrynose:<br>
* 6aa0976fa62 - cups: fix CVE-2026-41079<br>
* b36ab95b537 - cups: fix CVE-2026-27447<br>
<br>
So you can send a single fixed v2 patch series.<br>
<br>
Thanks!<br>
<br>
<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: Monday, June 29, 2026 3:27 AM<br>
&gt; To: Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) =
&lt;adongare@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
&gt; Cc: xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.com=
&gt;; to@cisco.com &lt;to@cisco.com&gt;<br>
&gt; Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-4107=
9<br>
&gt;<br>
&gt; On Tue Jun 23, 2026 at 1:30 PM CEST, Anil Dongare -X (adongare - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt;&gt; From: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Pick the upstream patch [1] as mentioned in [2].<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://github.com/OpenPrinting/cups/commit/b7c2525=
a885f528d243c3a92197ca99609b3f080" id=3D"OWAfbd7ad0b-fe3a-3b21-8d20-575a2ef=
ae7b3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99=
609b3f080</a><br>
&gt;&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-202=
6-41079" id=3D"OWAfc18d09e-5b6a-c860-d1a3-dbdbcd6132ab" class=3D"OWAAutoLin=
k" data-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-41079</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;<br>
&gt; As far as I know, this fix is also needed on wrynose:<br>
&gt; CVE-2026-41079 impacts &quot;up to 2.4.17 excluding&quot; per NVD and =
wrynose has 2.4.16.<br>
&gt;<br>
&gt; Can you send a fix for wrynose so I can take this one for scarthgap?<b=
r>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; meta/recipes-extended/cups/cups.inc&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&gt;&nbsp; .../cups/cups/CVE-2026-27447.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-<br>
&gt;&gt;&nbsp; .../cups/cups/CVE-2026-34978.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 25 +++++--<br>
&gt;&gt;&nbsp; .../cups/CVE-2026-34980-regression_p2.patch&nbsp;&nbsp; |&nb=
sp; 8 +--<br>
&gt;&gt;&nbsp; .../cups/cups/CVE-2026-34990.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 19 ++---<br>
&gt;&gt;&nbsp; .../cups/cups/CVE-2026-41079.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 72 +++++++++++++++++++<br>
&gt;<br>
&gt; This patch touches a lot of patches added previously in the series. I<=
br>
&gt; think this is a mistake and those changes should either be dropped or<=
br>
&gt; squashed in the proper commit.<br>
&gt;<br>
&gt; Can you send a v2 of the whole series with this cleaned up?<br>
&gt; Please split CVE-2026-41079 and CVE-2026-27447 into another series as<=
br>
&gt; those need a wrynose fix.<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt;<br>
&gt;&gt;&nbsp; 6 files changed, 106 insertions(+), 23 deletions(-)<br>
&gt;&gt;&nbsp; create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-=
41079.patch<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-ex=
tended/cups/cups.inc<br>
&gt;&gt; index c2bf572bf5..64f71c9465 100644<br>
&gt;&gt; --- a/meta/recipes-extended/cups/cups.inc<br>
&gt;&gt; +++ b/meta/recipes-extended/cups/cups.inc<br>
&gt;&gt; @@ -31,6 +31,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v$=
{PV}/cups-${PV}-source.tar.gz \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file://CVE-2026-34990.patch" id=3D"OWA3cee5e41-0839-e833-4=
0c8-7af5ed49f1aa" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-34990.patch</a> \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file://CVE-2026-39314.patch" id=3D"OWAa3205ef5-e6dd-1c54-c=
898-726bc16a7cb6" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-39314.patch</a> \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file://CVE-2026-39316.patch" id=3D"OWA60e16f72-ba9a-d9fc-7=
98b-a7e4d43cee4f" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-39316.patch</a> \<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a h=
ref=3D"file://CVE-2026-41079.patch" id=3D"OWA14c447f1-0ee0-7cc9-3a98-20beda=
dbc375" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-41079.patch</a> \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/Open=
Printing/cups/releases" id=3D"OWAfe744590-d22c-f15a-47ad-e547c7761545" clas=
s=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://github.com/OpenPrinti=
ng/cups/releases</a>&quot;<br>
&gt;&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch =
b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch<br>
&gt;&gt; index 77a26dae64..1884acfa9f 100644<br>
&gt;&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch<br>
&gt;&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch<br>
&gt;&gt; @@ -22,9 +22,9 @@ diff --git a/CHANGES.md b/CHANGES.md<br>
&gt;&gt;&nbsp; index 4a2e25d..0da2c55 100644<br>
&gt;&gt;&nbsp; --- a/CHANGES.md<br>
&gt;&gt;&nbsp; +++ b/CHANGES.md<br>
&gt;&gt; -@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)=
<br>
&gt;&gt; +@@ -21,6 +21,8 @@<br>
&gt;&gt;&nbsp;&nbsp; Changes in CUPS v2.4.10 (2024-06-18)<br>
&gt;&gt; - -----------------------------<br>
&gt;&gt; + ------------------------------------<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; +- CVE-2026-27447: The scheduler treated local user and grou=
p names as case-<br>
&gt;&gt;&nbsp; +&nbsp; insensitive.<br>
&gt;&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch =
b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch<br>
&gt;&gt; index d05bc85588..b4b83a41d0 100644<br>
&gt;&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch<br>
&gt;&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch<br>
&gt;&gt; @@ -22,13 +22,10 @@ diff --git a/CHANGES.md b/CHANGES.md<br>
&gt;&gt;&nbsp; index 7a5e8813f..429ee874f 100644<br>
&gt;&gt;&nbsp; --- a/CHANGES.md<br>
&gt;&gt;&nbsp; +++ b/CHANGES.md<br>
&gt;&gt; -@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)<br>
&gt;&gt; - Changes in CUPS v2.4.10 (2024-06-18)<br>
&gt;&gt; - ------------------------------------<br>
&gt;&gt; -<br>
&gt;&gt; +@@ -24,6 +24,8 @@<br>
&gt;&gt;&nbsp;&nbsp; - CVE-2026-27447: The scheduler treated local user and=
 group names as case-<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; insensitive.<br>
&gt;&gt; -- Fixed cupsd crash if user does not exist (Issue #1555)<br>
&gt;&gt; + - Fixed cupsd crash if user does not exist (Issue #1555)<br>
&gt;&gt;&nbsp; +- CVE-2026-34978: The RSS notifier could write outside the =
scheduler's RSS<br>
&gt;&gt;&nbsp; +&nbsp; directory.<br>
&gt;&gt;&nbsp;&nbsp; - Fixed error handling when reading a mixed `1setOf` a=
ttribute.<br>
&gt;&gt; @@ -100,3 +97,21 @@ index 2d80a960e..2dc7376c1 100644<br>
&gt;&gt;&nbsp; +&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STA=
TUS_ERROR_NOT_POSSIBLE, _(&quot;Bad notify-recipient-uri URI \&quot;%s\&quo=
t;.&quot;), recipient);<br>
&gt;&gt;&nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ippAddInteger(con-&gt;respon=
se, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, &quot;notify-status-code&quot;, IPP=
_STATUS_ERROR_ATTRIBUTES_OR_VALUES);<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!strcmp(attr-&gt;na=
me, &quot;notify-pull-method&quot;) &amp;&amp;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; attr-&gt;value_tag =3D=3D IPP_TAG_KEYWORD)<br>
&gt;&gt; +@@ -6010,6 +6016,12 @@ create_subscriptions(<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;notify-=
status-code&quot;, IPP_ATTRIBUTES);<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp; else if (!strcmp(scheme, &quot;rss&quot;) &am=
p;&amp; strstr(resource, &quot;../&quot;) !=3D NULL)<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_E=
RROR_NOT_POSSIBLE, _(&quot;Bad notify-recipient-uri URI \&quot;%s\&quot;.&q=
uot;), recipient);<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ippAddInteger(con-&gt;response, I=
PP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, &quot;notify-status-code&quot;, IPP_STAT=
US_ERROR_ATTRIBUTES_OR_VALUES);<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!strcmp(attr-&gt;na=
me, &quot;notify-pull-method&quot;) &amp;&amp;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; attr-&gt;value_tag =3D=3D IPP_TAG_KEYWORD)<br>
&gt;&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regres=
sion_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p=
2.patch<br>
&gt;&gt; index 73846cb8a3..0cf63b10af 100644<br>
&gt;&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2=
.patch<br>
&gt;&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2=
.patch<br>
&gt;&gt; @@ -43,10 +43,10 @@ index 25e9d65..fe60890 100644<br>
&gt;&gt;&nbsp;&nbsp; #<br>
&gt;&gt;&nbsp;&nbsp; # Test the lp command.<br>
&gt;&gt;&nbsp;&nbsp; #<br>
&gt;&gt; --# Copyright =A9 2020-2024 by OpenPrinting.<br>
&gt;&gt; -+# Copyright =A9 2020-2026 by OpenPrinting.<br>
&gt;&gt; - # Copyright =A9 2007-2019 by Apple Inc.<br>
&gt;&gt; - # Copyright =A9 1997-2005 by Easy Software Products, all rights =
reserved.<br>
&gt;&gt; +-# Copyright =A9 2020-2024 by OpenPrinting.<br>
&gt;&gt; ++# Copyright =A9 2020-2026 by OpenPrinting.<br>
&gt;&gt; + # Copyright =A9 2007-2019 by Apple Inc.<br>
&gt;&gt; + # Copyright =A9 1997-2005 by Easy Software Products, all rights =
reserved.<br>
&gt;&gt;&nbsp;&nbsp; #<br>
&gt;&gt;&nbsp; @@ -72,8 +72,8 @@ echo &quot;&quot;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch =
b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch<br>
&gt;&gt; index e3d6e10a23..916cdc09a3 100644<br>
&gt;&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch<br>
&gt;&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch<br>
&gt;&gt; @@ -147,10 +147,10 @@ index 1dd520d..56855fc 100644<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OSStatus&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Status */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; authdata[HTTP_MAX_VALUE];<br>
&gt;&gt; -@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /* I - Client connection */<br>
&gt;&gt; +@@ -399,6 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /* I - Client connection */<br>
&gt;&gt;&nbsp;&nbsp; #endif /* HAVE_AUTHORIZATION_H */<br>
&gt;&gt;&nbsp;&nbsp; #if defined(SO_PEERCRED) &amp;&amp; defined(AF_LOCAL)<=
br>
&gt;&gt; --&nbsp; else if (!strncmp(authorization, &quot;PeerCred &quot;, 9=
) &amp;&amp;<br>
&gt;&gt; +-&nbsp; else if (PeerCred !=3D CUPSD_PEERCRED_OFF &amp;&amp; !str=
ncmp(authorization, &quot;PeerCred &quot;, 9) &amp;&amp;<br>
&gt;&gt;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; con-&gt;http-&gt;hostaddr-&gt;addr.sa_family =3D=3D AF_LOCAL &amp;&amp; c=
on-&gt;best)<br>
&gt;&gt;&nbsp; +&nbsp; else if (PeerCred !=3D CUPSD_PEERCRED_OFF &amp;&amp;=
<br>
&gt;&gt;&nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; !strncmp(authorization, &quot;PeerCred &quot;, 9) &amp;&amp;<br>
&gt;&gt; @@ -202,24 +202,19 @@ index b0d1f5b..11dcd39 100644<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATU=
S_ERROR_FORBIDDEN, _(&quot;Only local users can create a local printer.&quo=
t;));<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt; -@@ -5621,9 +5621,15 @@ create_local_printer(<br>
&gt;&gt; -<br>
&gt;&gt; -&nbsp;&nbsp; ptr =3D ippGetString(device_uri, 0, NULL);<br>
&gt;&gt; -<br>
&gt;&gt; --&nbsp; if (!ptr || !ptr[0])<br>
&gt;&gt; -+&nbsp; if (!ptr || !ptr[0])<br>
&gt;&gt; -&nbsp; {<br>
&gt;&gt; --&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQ=
UEST, _(&quot;Attribute \&quot;%s\&quot; has empty value.&quot;), &quot;dev=
ice-uri&quot;);<br>
&gt;&gt; -+&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQ=
UEST, _(&quot;Attribute \&quot;%s\&quot; has empty value.&quot;), &quot;dev=
ice-uri&quot;);<br>
&gt;&gt; +@@ -5634,6 +5634,12 @@ create_local_printer(<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp; +&nbsp; else if (strncmp(ptr, &quot;ipp://&quot;, 6) &amp;&a=
mp; strncmp(ptr, &quot;ipps://&quot;, 7))<br>
&gt;&gt;&nbsp; +&nbsp; {<br>
&gt;&gt;&nbsp; +&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ERROR_NO=
T_POSSIBLE, _(&quot;Bad device-uri \&quot;%s\&quot;.&quot;), ptr);<br>
&gt;&gt; -+<br>
&gt;&gt; ++<br>
&gt;&gt;&nbsp; +&nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt;&nbsp; +&nbsp; }<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp; printer_geo_location =3D ippFindAttribute(con-&gt;re=
quest, &quot;printer-geo-location&quot;, IPP_TAG_URI);<br>
&gt;&gt; +&nbsp;&nbsp; printer_info&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; =3D ippFindAttribute(con-&gt;request, &quot;printer-info&quot;, IP=
P_TAG_TEXT);<br>
&gt;&gt;&nbsp; diff --git a/scheduler/job.c b/scheduler/job.c<br>
&gt;&gt;&nbsp; index 880c25f..6c033de 100644<br>
&gt;&gt;&nbsp; --- a/scheduler/job.c<br>
&gt;&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch =
b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..f216c84e30<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch<br>
&gt;&gt; @@ -0,0 +1,72 @@<br>
&gt;&gt; +From b8730b3e18852d203f7fa86a05ed0a8aa3a791e5 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Michael R Sweet &lt;msweet@msweet.org&gt;<br>
&gt;&gt; +Date: Mon, 13 Apr 2026 11:50:23 -0400<br>
&gt;&gt; +Subject: [PATCH] Limit num_bytes for SNMP string values.<br>
&gt;&gt; +<br>
&gt;&gt; +CVE: CVE-2026-41079<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrin=
ting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080" id=3D"OWAb554715=
4-e0b9-0400-890a-1ab8b0756b1d" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a921=
97ca99609b3f080</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f0=
80)<br>
&gt;&gt; +Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + cups/snmp-private.h | 6 +++---<br>
&gt;&gt; + cups/snmp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8 =
++++++--<br>
&gt;&gt; + 2 files changed, 9 insertions(+), 5 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/cups/snmp-private.h b/cups/snmp-private.h<br>
&gt;&gt; +index 52b8740..015f53e 100644<br>
&gt;&gt; +--- a/cups/snmp-private.h<br>
&gt;&gt; ++++ b/cups/snmp-private.h<br>
&gt;&gt; +@@ -1,7 +1,7 @@<br>
&gt;&gt; + /*<br>
&gt;&gt; +&nbsp; * Private SNMP definitions for CUPS.<br>
&gt;&gt; +&nbsp; *<br>
&gt;&gt; +- * Copyright =A9 2020-2024 by OpenPrinting.<br>
&gt;&gt; ++ * Copyright =A9 2020-2026 by OpenPrinting.<br>
&gt;&gt; +&nbsp; * Copyright =A9 2007-2014 by Apple Inc.<br>
&gt;&gt; +&nbsp; * Copyright =A9 2006-2007 by Easy Software Products, all r=
ights reserved.<br>
&gt;&gt; +&nbsp; *<br>
&gt;&gt; +@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /**** ASN1 request/object types ****/<br>
&gt;&gt; +<br>
&gt;&gt; + typedef struct cups_snmp_string_s&nbsp;&nbsp; /**** String value=
 ****/<br>
&gt;&gt; + {<br>
&gt;&gt; +-&nbsp; unsigned char&nbsp;&nbsp;&nbsp;&nbsp; bytes[CUPS_SNMP_MAX=
_STRING];<br>
&gt;&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
Bytes in string */<br>
&gt;&gt; +&nbsp;&nbsp; unsigned&nbsp; num_bytes;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Number of bytes */<b=
r>
&gt;&gt; ++&nbsp; unsigned char&nbsp;&nbsp;&nbsp;&nbsp; bytes[CUPS_SNMP_MAX=
_STRING + 1];<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
Bytes in string */<br>
&gt;&gt; + } cups_snmp_string_t;<br>
&gt;&gt; +<br>
&gt;&gt; + union cups_snmp_value_u&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; /**** Object value ****/<br>
&gt;&gt; +diff --git a/cups/snmp.c b/cups/snmp.c<br>
&gt;&gt; +index 54e348f..3222ff3 100644<br>
&gt;&gt; +--- a/cups/snmp.c<br>
&gt;&gt; ++++ b/cups/snmp.c<br>
&gt;&gt; +@@ -1,7 +1,7 @@<br>
&gt;&gt; + /*<br>
&gt;&gt; +&nbsp; * SNMP functions for CUPS.<br>
&gt;&gt; +&nbsp; *<br>
&gt;&gt; +- * Copyright =A9 2020-2024 by OpenPrinting.<br>
&gt;&gt; ++ * Copyright =A9 2020-2026 by OpenPrinting.<br>
&gt;&gt; +&nbsp; * Copyright =A9 2007-2019 by Apple Inc.<br>
&gt;&gt; +&nbsp; * Copyright =A9 2006-2007 by Easy Software Products, all r=
ights reserved.<br>
&gt;&gt; +&nbsp; *<br>
&gt;&gt; +@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* I - Buffer */<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; case CUPS_ASN1_OCTET_STRING :<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; case CUPS_ASN1_BIT_STRING :<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; case CUPS_ASN1_HEX_STRING :<br>
&gt;&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; packet-&gt;object_value.string.num_bytes =3D len=
gth;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asn1_get_string(&amp;bufptr, bufend, =
length,<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char *)packet-&=
gt;object_value.string.bytes,<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(packet-&g=
t;object_value.string.bytes));<br>
&gt;&gt; ++<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (length &gt;=3D sizeof(packet-&gt;object_valu=
e.string.bytes))<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packet-&gt;object_value.string.num_b=
ytes =3D sizeof(packet-&gt;object_value.string.bytes) - 1;<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt;&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packet-&gt;object_value.string.num_b=
ytes =3D length;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; case CUPS_ASN1_OID :<br>
&gt;&gt; +--<br>
&gt;&gt; +2.43.7<br>
&gt;&gt; +<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB61895A07822B39893EAD0F5BC4C22DM4PR11MB6189namp_--

