Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BFEC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 07:00:49 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.5733.1739430040193221975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 23:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=idpS3KaI;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8668; q=dns/txt; s=iport;
  t=1739430040; x=1740639640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=6ZsBhST8mMJeWAUhgcVyc6oiElyft5S+eTwFuyPiAYk=;
  b=idpS3KaIKz3CDSdNV26jN95jg0mdcSHgCpQ0tAYHnMsRaKDGA5k0zUa7
   1jkpkb9/x55bZ8wTU2hPJLr4SxvGJ7KCp7pUIHxeVREbR5srHtOzuvspn
   piq58DLTJgtUhFxUGwXFHgsosBLlnOaxg+rdYAQGbEAwwoRafSkk9LZaQ
   E=;
X-CSE-ConnectionGUID: 9rPilUrtSXOz3WCgXCiBvw==
X-CSE-MsgGUID: RxtvpNyrT7qJDbdr0NUI7w==
X-IPAS-Result: =?us-ascii?q?A0AFAAAKmK1n/4wQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBGgUBAQEBCwGBQDFSB3SBHkiIIQOETl+IdAOLY4tchlUUg?=
 =?us-ascii?q?REDVg8BAQENAi4BFQQBAYITgnQCiwkCJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4ThgiGWgEBAQECAQERZwULAgEIDgMEAQEBLiAHC?=
 =?us-ascii?q?h0IAgQOBQgahH0NBwMOIwMBomMBgUACiit4gTSBAd07DYJagUgBiDAeASqBM?=
 =?us-ascii?q?okGJxuCDYFXgjA4PoIfggochBOCLwSCGBeBbgGCWGeLA49OiixSdSIDJjMsA?=
 =?us-ascii?q?VUTFwsHBYEpSAOBESOBIwU0QTkBgg1pSToCDQI1gh58giuCHoI5hEOES4VYg?=
 =?us-ascii?q?hKBYAMDFhGDIXgchRcxHUADC209NxQbBQSBNQWdSgcDEFw8g0SDLQoyNzcCk?=
 =?us-ascii?q?x+PRIF7jF+UIHEKKINzmVCBf4YtF6pSmHySCpZ6AgQCBAUCDwEBBoFnPIFZc?=
 =?us-ascii?q?BWDIlIZD44tFspbeDwCBwsBAQMJhk2LNAEB?=
IronPort-PHdr: A9a23:YABnsBL/ePfN7UoMztmcuVQyDhhOgF28FhQe5pxijKpBbeH+uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:/IlFP68LP3zDVqpL1mvVDrUD2H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zRLXj+DP/uKNDPxL492bdiwoR9V6pfVndRjQAdqqCtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4E/rauW5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qpyyHjEAX9gWMsaDtPs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnJ7UZ/tttHVp+0
 u5DFxsCXjuCrfyplefTpulE3qzPLeHiOIcZ/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cO3WjOX9PYH46tOCvjHjjdCFDgFmUvqEwpWPUyWSd1ZCxa4CNJ4DVFZs9ckCwn
 HLa4XzfEwsma8W95TCJ6CqKu86QgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:Imtii6xcRzTs5YAkXQqfKrPxbOgkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYY72KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eAQ2SS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfZvln6LQ1hSRMK9AXUOQujEoPP2tL+OW3Q7Li9iwjOjyRez5pDHMzXw5HojujV0rosKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMotJ9EEStti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2COpwf30QWI6kds15ai8y7bvZLQm728eNsIMbsHuWufSGqe16MUhqA47E
 uM5RPBi3MYN2KZoM233am5a/gjrDvGnZNlq59Ts5SaOrFuMoO4auckjRho+JtsJlOJ1Kk3VO
 ZpF83S//BQbBeTaG3YpHBmxJi2Um00BQrueDlJhiW56UkfoJlC9TpS+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBUukChPfHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTceOwJpI+BbQR3jVZ0Wh9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRtbWXv
 6iUagmSsML7VGeb7qh8zeOLKW6c0NuJfH9kuxLL26zng==
X-Talos-CUID: 9a23:JHbdBW00IojOyPUFcf7zebxfS9odc3ng1mvrE2iqUllCR42+SHWO5/Yx
X-Talos-MUID: 9a23:gn95PAhJUWGYNZFWWaNLqMMpDtd0/byIGVoxzowkl8OIL3RWBhbCk2Hi
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Feb 2025 07:00:39 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 646B0180001E8
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:00:39 +0000 (GMT)
X-CSE-ConnectionGUID: /eSumch0RDOItNUcquMpRA==
X-CSE-MsgGUID: APAQgZJ6RLm5SL8tu5EyNA==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.13,282,1732579200"; 
   d="scan'208,217";a="22421404"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Feb 2025 07:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4C5mqKgLwh/YmDLvfhj7cbW7lobT9/SSeuDlp6s+7bEvz+FCojdhwLkSltqFCrqfBvOta/hM0Ud8GDyu4U6t9elIaOdNYN6VP0roCsS5D1BHscSrqgdIvjskJ2qhe+JXjS8VKGstPbwaSFZgMdXLK7dPa47i7ZCtONR/ufSnN0FtWH1N/AozOtVYCthdDg3z+RE0j7to3wt1IfxbRUwnS4sg04frDM1ekyarYh7DXJ4ixim1P/ZYLpazCy1GByAulm8hxepAuGDqpxjA35KzUwgYkT3pAKX8H8jo2x1T1+0wFj3Kmo+T78SIj6kKsFv4rZOjXTSLj6D3SOsDZk7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZsBhST8mMJeWAUhgcVyc6oiElyft5S+eTwFuyPiAYk=;
 b=YTmrBpFE6NerKso4uyyGQB822/QH8ZAlmPzeNINsKp+KEiK682Qi8kuUb0tQNEVM70/EfDAP2RobTbXGUxlw2mC9lEuW3s9vGEA80s8JZHrRPKtTkaRQcrsW8UoLV7IaTuVfaD1fepzJcChoTq4VX7XNuvFGrqRCRDXgSd/lOLYEg1+nmLX+nV55Vho2mPSD6Us7B5JCNSlLL8YP+MCSBKAoMTBH3vkby1+v5gaMKMLsv1EurFrdlBs3shtn0nUhzb7F634GDFT24COk86IlanUkCPwkFmNTnLi+d6LMCvsDNJDzx4efXtE8X8kkPQ5dhyfvWCWxjV8poX2WbpWKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 07:00:37 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 07:00:36 +0000
From: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton
	<Ross.Burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: 
 AQHbeKZRchNZZrPMpUmlkztBmF+albNAcbkAgAABw6+AAALQAIAATwuggAAJYQCAAD7mAIABXkcFgAAJMACAAN47NYAAKbwAgAA/iEaAABUgAIABBPME
Date: Thu, 13 Feb 2025 07:00:36 +0000
Message-ID: 
 <PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
 <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
 <CANNYZj8khhZ0EEeJ7W=epDWNKC6tTHPfd7Xk__G1M6T=ij6oOQ@mail.gmail.com>
 <PH0PR11MB49026C46CD70272E73A7C688D7FC2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj-nec7b3k8GjrJTvuhfhZaJy3t3QZPcoT-ybfDVd+cMxA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-nec7b3k8GjrJTvuhfhZaJy3t3QZPcoT-ybfDVd+cMxA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4902:EE_|SJ0PR11MB4992:EE_
x-ms-office365-filtering-correlation-id: 90057f73-5579-45b6-fc34-08dd4bfc1de1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?H5S0HHwnBbKSk3xLVlWCza6n7yxwzkpz4iHH42hZtBmoXOfYBsTWh1L6wf?=
 =?iso-8859-1?Q?M64P/QtYL5HHDA3DG0vvvz92Ga/sWsfPaGCPRm/0Y7LVDC/mtAwoUmcnBx?=
 =?iso-8859-1?Q?wEzRTStKL9oR6QIDGMxSdIvOCOIcyzE33POKpHWoLk47lFjWMWW3J8qSaf?=
 =?iso-8859-1?Q?eNPfrB2GuqoXO9oicvqhTg46kY1KH9gOdbds/nmLKtzUqpATsd+cmehvKE?=
 =?iso-8859-1?Q?tDNWXYLJ/yuAFMAgnmmtmDEXGyDLcycKe0duRVXt2rEV0knBYS16SoLRg0?=
 =?iso-8859-1?Q?huX+1Xv7OX2fg07FILYQLIQsjIGuclDY1Hu70LyHfGQVRP8iK2ZlcvhTns?=
 =?iso-8859-1?Q?KUv1zbIbbAzVnBWxwbfUZiplMOUMm6Q3WZHg26DYcbQ+dD83f4vm+DlA0N?=
 =?iso-8859-1?Q?oIJckznJPBA2XT1RGBf5W7m8OgFXSLdQCTXhG9XfNR69Q6KisHVNa0UOS9?=
 =?iso-8859-1?Q?tWD3twqPkGsqZ8UpTRkLwgi05rKnw5/iNQY1+HrWPTaLblIjDPgSe3aS7q?=
 =?iso-8859-1?Q?4hTnM/d2mODDbLuMxPfB9U5slXHqbl6tq7ICSr4KpdzZNfBnJsrdns15q+?=
 =?iso-8859-1?Q?A2ADnEJycwUx9N6h07czz+hK0/vSFWuC2TJM7d1bblSQxpplUcOG5qR4nA?=
 =?iso-8859-1?Q?FY6zg9lfnZwfMHkzh/OIcoZ1VedtBksiDrni3aoUdR0xRbmFueXTa6fcAG?=
 =?iso-8859-1?Q?eeygbxDqDT3ol1AE6OGNSQboBAVn/m9V87Wk3BSu/GQ+/xbYIdgQvQ1bMx?=
 =?iso-8859-1?Q?pq8mufCDW6bvK9GqwzdxMumiR2CGL4ujDHUARNYeFmV585Sfq6UaxUwADl?=
 =?iso-8859-1?Q?zSFt8rqfpLz0Z0h8EFtRAOUvI4xSF1L4qlJ5tXT9Jy7gblr2EEDKHpTTvz?=
 =?iso-8859-1?Q?J+CvgonVcO+u5X1ycwUxa00rYWSHYCbNFgDVhAN8P15QmNYyCfnlxJQJ9H?=
 =?iso-8859-1?Q?m57USq/BXVBCjfDVmsHDjk0xc2rH7dLGuXPTiE//3yNmVsB6X019ZnnhXE?=
 =?iso-8859-1?Q?x01MxMg2b5UZ5KGfz8udN2x2exBT8YBiQQcDrkEP1pjk84mCIXZzXmfuM0?=
 =?iso-8859-1?Q?KVBJRVMikmwFE16NnrmuKDG8XeTBAnrSYpNBKAaGjCUid6NZYQod6bA74H?=
 =?iso-8859-1?Q?tW9LQET2cqW5EvWd+PhLSkURbQU9y4GDGktOYOuaKASVak1KdNikKxRn4K?=
 =?iso-8859-1?Q?Xa/JmEA6vQ2ngsVffIj+TKFupA3IUIsWZAXQHzYVwgTkws0tzIQvdJsl7k?=
 =?iso-8859-1?Q?FV4a9AOdAUe3ljFUs49FE6bxlxVGnXPtqq8gfPV60y32HAYxvSWhnijRVv?=
 =?iso-8859-1?Q?Xn2kNiD0cmMVZbgEbIzEbT9H2patucoD4bkAW9N3TWFiroV79M95T2uOh0?=
 =?iso-8859-1?Q?P4w3VJ4KtJ3LObkqFC75WTD/4SWwC5GVgWEBzHXBZ/1nSmu1Cisis1+JE+?=
 =?iso-8859-1?Q?SCTK9SJBVSnoQi7eS7AfcVRTgfnqkuPD3BhwxDf6bC77PfubTFNjLzJ/dj?=
 =?iso-8859-1?Q?XRmVAkfgrvkkqNi4WqIZfW?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HANbsJ2vDU+osUlluNincQHqgrOcUISogTu5zpx30QMQKTQriHAlYssXHf?=
 =?iso-8859-1?Q?0wiTOw71+wRPOXwlDD99Auv0c4SuIRQCqQT3CyBHkYowMoAyztO/acstlJ?=
 =?iso-8859-1?Q?YwT56iduI8jHQcSL+f6VEL8Yw8rVkBdktyiAikx99WrzF8iN0XeJb1giuc?=
 =?iso-8859-1?Q?PoorGCtIB+gDYxtoBE6t5/9rwsTIDMvRVcdYhLHprmDkq9f7ZmhVK3ra2d?=
 =?iso-8859-1?Q?7afz9tl9kkj48zRQsBCaMpe4SamgTrYx2avrrNatcqMSCv/d+BlLwvHmgP?=
 =?iso-8859-1?Q?WTu8FCK85mWklTtd4kzokBqlZOySr4jhKkWzsbzoaG/UTupb1sOfoHy1iQ?=
 =?iso-8859-1?Q?kavWqh2haecK9cZCveMGTo5epNK/7MRIJU+kBtAf5GsyfmAvvh7HMpC6KB?=
 =?iso-8859-1?Q?Vq12uXlemnJC/upg4H/kdtCLZPfQywp/H5cBapP9YCWqYVYtWJ2Sd1shz6?=
 =?iso-8859-1?Q?J3gyaIKZhuYPVxvmzELiqXrENudi+8cX0M10bjHM3PAxx1P4aSRL6kql/e?=
 =?iso-8859-1?Q?ffw8TarsLt/YU6hA/z3lffmUMKesV09oADB18lnfZoivL31Qf1u9BbtgYj?=
 =?iso-8859-1?Q?xKDuQMVDKhXdqlYbWmEcQ6HC8+jNI4WAswYOTWYxDFJ/qTSl8m430VRBjF?=
 =?iso-8859-1?Q?aRXfzoVwVOYjlHARG6xFv5AoZbnu90G6JqZLvGHn17jysOPkivMh9a6aCQ?=
 =?iso-8859-1?Q?/Up9NjUYXvcbGUDcojI1Bi5yT7goGNUpOuB1Tdcxm/AI/nGU6/ArwBPDKn?=
 =?iso-8859-1?Q?sBfsrAvl1ZwpXzAXy1oDXOYM+65q60vfbBF67ZmpcavREYY0Uxp2RzMKqb?=
 =?iso-8859-1?Q?3CFQASfvgNOy/VQuOGark6CH/IDq6GBuLryTv8or74/RdkrLl34V4P70BS?=
 =?iso-8859-1?Q?jMra77+p6LdA8OMv+AOG4GejREBl3Kkl04Q5d2BTsNpdQEL4bAk+QDjuxf?=
 =?iso-8859-1?Q?F8U93rQqY8fkjPb1BIbiQbK6U3duOSLcUfubMxzVlYN8NlUscL0lqljdkm?=
 =?iso-8859-1?Q?qWw4nE2QRUPvdEmEpdV+VS7kt+V9r14hyaLwXEiJuyUT3kNyFiLPF+9gCu?=
 =?iso-8859-1?Q?Y+S3jGaiZfzbSzzYxYcjUd49R4wNHvmhpheLByL5Iyw52ccE8I808QCqi+?=
 =?iso-8859-1?Q?nGyC5i2p7Gf6hsh877lJsm/eWJKjbQlmKb/PG5UZ8gcFC7iGjcg6ZuPBch?=
 =?iso-8859-1?Q?FVbqfbNfl5LNM56zHQ4PLPehwFkNcYmb44OuK7LVragCuhdtPujNnBPEx/?=
 =?iso-8859-1?Q?rblNsghzSMgYM0z7P3vskkPmskfl/otkZc4B6aexIvq2U+w08qIK5WzFJk?=
 =?iso-8859-1?Q?T/k6Q8s0YquPn4CPqfx/MZEvCuSO5aQYdnQ3LcVDEE78vnuhppE1vJnw6e?=
 =?iso-8859-1?Q?W9Kk7HoXZukmUR7GtT5RTWAt7YGb6t7o8lSwVER0yShyN4n1aHxb2Ga4PF?=
 =?iso-8859-1?Q?mVHHYVbSggeJnDzMDds7BhU+P3f+FBRd5KvRwl4fddwdUJU1EBnwbGp13J?=
 =?iso-8859-1?Q?SEshm52sgH7nsnAUkP6RdivCuYUa4FLwZhhB9j8HX0RNUI4d6WhmsfQs5D?=
 =?iso-8859-1?Q?7y/dYRRVUXNuWDdHuMhR5y10zWPlE+JZY0fCac1tWkI3RmE2J+O7pvaVPq?=
 =?iso-8859-1?Q?HddD1ZUGL2PzoxPsGAjEE3P6wWPPyqhWEy?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2PH0PR11MB4902namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90057f73-5579-45b6-fc34-08dd4bfc1de1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 07:00:36.1171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 15B9Lr1iJhcZBWf3r1620rI9kZWBjMU41wnIZDEW4JEoaXjnpmq+Ss7OpPsdkohG7HRMR3PXSyRqOa7S82w0cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211303

--_000_PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2PH0PR11MB4902namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Is it trying to save space on target device, or trying to save space
> on the build host? You really do need to describe your process in more
> detail.

It's attempt to save space on build host.



> I guess what I'm trying to object is splitting things into smaller

> packages when the full set must be installed anyway. Accepting this
> would open the door for further such tweaks, which just make things
> more complex, without actual benefit for standard, commonly accepted
> ways to handle target installation.

I agree with this.

Regards,
Oleksiy
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Wednesday, February 12, 2025 16:19
To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@c=
isco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Ross Burton <Ross.Bur=
ton@arm.com>; openembedded-core@lists.openembedded.org <openembedded-core@l=
ists.openembedded.org>; Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate =
subpackage

On Wed, 12 Feb 2025 at 15:22, Oleksiy Obitotskyy -X (oobitots -
GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> wrote:
>
 In practice getting rid of systemd and leaving only systemctl binary
gives me approx. 20Mb disk space
>
> 3.0M    libsystemd-shared
> 960K    libsystemd
> 9.4M    systemd
> 424K    libnss-systemd
>
> ~5 Mb could be extra dependency libraries removed after systemd removal.

libsystemd-shared shouldn't be there, as it is required by systemctl.
So the savings are less.

Is it trying to save space on target device, or trying to save space
on the build host? You really do need to describe your process in more
detail.

There's also a standard mechanism for adding software to targets (or
making the initial target rootfilesystems): packages and package
manager. You need to explain why that is not being used.

> Regarding runtime dependencies - components will be merged on target and =
all dependencies will be resolved. All necessary libraries will be taken fr=
om one "base" component that will deliver whatever we need, like glibc, sys=
temd, etc. We have only one "base" component (or more - it depends how many=
 different libraries/versions we need to support).
>

I guess what I'm trying to object is splitting things into smaller
packages when the full set must be installed anyway. Accepting this
would open the door for further such tweaks, which just make things
more complex, without actual benefit for standard, commonly accepted
ways to handle target installation.

Alex

--_000_PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2PH0PR11MB4902namp_
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
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px; f=
ont-family: Aptos; font-size: 11pt;">
&gt; Is it trying to save space on target device, or trying to save space<b=
r>
&gt; on the build host? You really do need to describe your process in more=
<br>
&gt; detail.</p>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
It's attempt to save space on build host.</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;">=
<span style=3D"font-family: Aptos; font-size: 11pt; color: rgb(0, 0, 0);">&=
gt; I guess what I'm trying to object is splitting things into smaller</spa=
n></p>
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;">=
<span style=3D"font-family: Aptos; font-size: 11pt;">&gt; packages when the=
 full set must be installed anyway. Accepting this<br>
&gt; would open the door for further such tweaks, which just make things<br=
>
&gt; more complex, without actual benefit for standard, commonly accepted<b=
r>
&gt; ways to handle target installation.</span></p>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I agree with this.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Oleksiy</div>
<hr style=3D"display: inline-block; width: 98%;">
<div class=3D"elementToProof" dir=3D"ltr" id=3D"divRplyFwdMsg" style=3D"col=
or: inherit;">
<span style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rg=
b(0, 0, 0);"><b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com=
&gt;<br>
</span></div>
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>Sent:</b>&nbsp;Wednesday, February 12, 2025 16:19<br>
<b>To:</b>&nbsp;Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)=
 &lt;oobitots@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;; Ros=
s Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@lists.openembedded.=
org &lt;openembedded-core@lists.openembedded.org&gt;; Ruslan Bilovol (rbilo=
vol) &lt;rbilovol@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] systemd: move systemctl utility =
to separate subpackage</div>
<div style=3D"direction: ltr;">&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">On Wed, 12 Feb 202=
5 at 15:22, Oleksiy Obitotskyy -X (oobitots -<br>
GLOBALLOGIC INC at Cisco) &lt;oobitots@cisco.com&gt; wrote:<br>
&gt;<br>
&nbsp;In practice getting rid of systemd and leaving only systemctl binary<=
br>
gives me approx. 20Mb disk space<br>
&gt;<br>
&gt; 3.0M&nbsp;&nbsp;&nbsp; libsystemd-shared<br>
&gt; 960K&nbsp;&nbsp;&nbsp; libsystemd<br>
&gt; 9.4M&nbsp;&nbsp;&nbsp; systemd<br>
&gt; 424K&nbsp;&nbsp;&nbsp; libnss-systemd<br>
&gt;<br>
&gt; ~5 Mb could be extra dependency libraries removed after systemd remova=
l.<br>
<br>
libsystemd-shared shouldn't be there, as it is required by systemctl.<br>
So the savings are less.<br>
<br>
Is it trying to save space on target device, or trying to save space<br>
on the build host? You really do need to describe your process in more<br>
detail.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
There's also a standard mechanism for adding software to targets (or<br>
making the initial target rootfilesystems): packages and package<br>
manager. You need to explain why that is not being used.<br>
<br>
&gt; Regarding runtime dependencies - components will be merged on target a=
nd all dependencies will be resolved. All necessary libraries will be taken=
 from one &quot;base&quot; component that will deliver whatever we need, li=
ke glibc, systemd, etc. We have only one &quot;base&quot;
 component (or more - it depends how many different libraries/versions we n=
eed to support).<br>
&gt;<br>
<br>
I guess what I'm trying to object is splitting things into smaller<br>
packages when the full set must be installed anyway. Accepting this<br>
would open the door for further such tweaks, which just make things<br>
more complex, without actual benefit for standard, commonly accepted<br>
ways to handle target installation.<br>
<br>
Alex</div>
</body>
</html>

--_000_PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2PH0PR11MB4902namp_--

