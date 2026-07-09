Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30438C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:10:39 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2458.1783573826755417223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g+6uF8TX;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9788; q=dns/txt;
  s=iport01; t=1783573826; x=1784783426;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=RVKZ/gKcYG0KtXGDbNkVVXlwdlhiDxgIKmGc+RtPFN8=;
  b=g+6uF8TX/z741u6K/rSdFLZIxnl1Kl3PkpMh5Xkn+GdggXSoIKs53f1B
   iDkuXgqfggHPz1fKuU0ORk98B6Jba7KeDGPzjiqb2ot02AGHLYdUR8YPc
   H/9ymMMdqnS9jfFr+cPZh9jeOl2LyTQdLY5Jbn21/JYLK/MQ7mYhLOiFW
   aPwgE3AU7sxHIgEgEKT7Styhr/p9tGnulMLLNofMezvWZ+o9KX/HBhKOY
   sq/nVLcbfPcZFXfvIFFLFqFan2cdsRay6P/OV/XyIwHy330+lya/FSnlU
   uYZhWvjx825fWGwMsug81LUILUyRo9v6TUkPm/R1Iujwd46hUpLhloVQl
   g==;
X-CSE-ConnectionGUID: PK33t4QnSvK4tt/RtRz5KA==
X-CSE-MsgGUID: 3WkDqrhVSoG+GzvgKTrEag==
X-IPAS-Result: =?us-ascii?q?A0ByAwDdLE9q/5L/Ja1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UkDiCADhSuIfJdEhleBdAoPAQEBDQEBLgEbBwQBAYUFAo1NAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwERZxACAQgRB?=
 =?us-ascii?q?AEBAS4nCh0IAgQBDQUIGoJhgh0WQAMBAg6rbQGBPQKKKniBNIEBg1oFCQJD3?=
 =?us-ascii?q?AoVgTiFP4MAGwEBKklsgl2BIRgBhHwnGxuBcoFXgmk+gQWBXAEDAReBHSs8g?=
 =?us-ascii?q?1eCMASCIoEMhAqBYYt1UnIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnE?=
 =?us-ascii?q?g8dFxYeWBsHBRIgKkFFIwMcWD84C0MFgVkCgghOIx8DOX+BL3VKeS2BAAECE?=
 =?us-ascii?q?B4KbEIkghY6AwttPTcGDhsDBIE1BYxQB1sXD4I+gQ8rT4FdBguifYF8oXsKK?=
 =?us-ascii?q?IN1jCGNPogyF4QEgVeLPZlUmQgjjWeVYIUuAgQCBAUCEAEBBoFoPIFZcBWDI?=
 =?us-ascii?q?gkKQBkPlzbJJ3kCCQMvAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:wyeYZxL1XjyW3ENI/9mcuVQyDhhOgF28FhQe5pxijKpBbeH6uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:swi5Qaykd9gkOL0dFwB6t+dsxyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 mNOCz2BPf+OMGKmfohyPYm290sGvp+DxoI3GgM5rVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYrajJMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHkVZtYEpt9xOn9tq
 eAEbwoRVALepMvjldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCxYYCLJ4XUGZo9ckCw/
 V3F033jAi8hM/Pc5iib/VGQnMLGknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:IELy8a/1EfwWXT+k7Mxuk+HYdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBfpTnhAsW9qXO1z+8S3WBjB8bSYOCGghrmEGgM1/qZ/9SNIVybygcZ79
 YeT0EcMqy/MbEZt7eG3ODQKb9Jq7f3ktHMuQ6d9QYQcegAUdAY0+4NMHfhLqQAfng/OXNWLu
 v62uN34xCbVTA8aMO9CnMZX+7FieHqufvdCyIuNloM0iXLqSmnxoLbPnGjsys2Yndi0L0i+W
 /Kn0jD4Lm/s/a08xnY12XCxZVbktnsx7J4dY2xY84uRQnEu0KNXsBMSreCtDc6rKWE81Axiu
 TBpB8mIoBa927RVnvdm2qv5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksbus1m2q
 4j5RPai3MXN2KEoM3O3amOa/hYrDvznZPkq59Ls5Vra/pbVFaWl/1GwKoaKuZaIMuw0vFWLA
 AnNrCu2B8RSyLbU1np+k9y3derQnM/Wj2CQkQEp4ip9gI+pgEi86Pdr/ZvwkvpM/kGOsR5D+
 ioCNUbqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOGl3fb2sR82AiRQu1C8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/uSUfsumDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbXMeTMoWsNAmXE/mmLOHFqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YN5N60i6M0WIySQ5m0mdDHAX0agAZ5QypdJjvbTlHrc8xjQotQ==
X-Talos-CUID: 9a23:pK2wWGCavu6tlq/6ExFErxUIRvkjSWP+kGvMZHWkM3Q0a5TAHA==
X-Talos-MUID: 9a23:crGyqQWuqNJlf1Xq/GTThx17LsdW2KOBS28fj5olh9OpPCMlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:10:24 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 0B5E418000230
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2026 05:10:24 +0000 (GMT)
X-CSE-ConnectionGUID: nOJLrbP1Sb6eeqotSzwRuA==
X-CSE-MsgGUID: uqbTB7xpROSn+7BLeR3srA==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208,217";a="63967422"
Received: from mail-northcentralusazon11010065.outbound.protection.outlook.com (HELO CH1PR05CU001.outbound.protection.outlook.com) ([52.101.193.65])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGSMjKXHXVrDXMCdpbsdgTORc36rCG46C8aSTBuUBKARzX7ndP+Vy8+T0OYMz0mgCaYRUZRXX3jeqW9yIO6HsVOpHkhmtz95klK/C0VZVHNbSYUNClMM3Ws1A1p1txfFRqzC1oSnAFLIWkChCXTGEoiTo8Y5qdpLrdQiKt2aHvioH/ebY9kUHG8LxVh2P60lguZ2xYm9QJlC4mvzrJPicNmeDMJMQqoNIBXbRhJoBjQLLfl4aJSQsNNAngoRUeoNFp8mVbnvsDUg4sFFxKuobbFxe8KCsrsAFS3TcNTFN5uR8WoIo2zLzU779L5oekKYWy2JV1u0B+ZQqhiqXJn6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVKZ/gKcYG0KtXGDbNkVVXlwdlhiDxgIKmGc+RtPFN8=;
 b=vDHt9DX7QcOPLBV2JikJf1nm/1F9rAFGVD4oorNWXp34XJYz37JScFxnpZea/iB6UhiEJYw8M7QZAGlPOZSF7Gtd6UhyizpZ7oU0hBpEwiVygjOLMbiF3fqRf1AE1sYMWIBZ+kFXNETAfKssPmQ1HwgRy9eZOHq7eLBfDfZFKLO7VKXgC++isT7QvipFtM4+IzZ9Iknzj0h/JyWrRp8DRtrJcJX3jPdLHjrouBBHbNA8M8W8vIGWmukkqzm1waij7uCbG365TFooVt+S3NVPbFIGxP5b/EThlpgLa05QnR7HYw0HPuU/4R2FyPXRc16lc3bGY8LcOuP/nul3LJKlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 05:10:21 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 05:10:15 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>, "jeremy.rosen@smile.fr"
	<jeremy.rosen@smile.fr>, "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE
 LIMITED at Cisco)" <adongare@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
Thread-Topic: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
Thread-Index: AQHc8cyWTSFqexjfWkW3t8A0nR8uKrY0xweAgCwi3YCAAnM9CoABgXww
Date: Thu, 9 Jul 2026 05:10:15 +0000
Message-ID: 
 <DM4PR11MB61891DE87D41D71FEDE29E81C4FE2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260601134257.47867-1-adongare@cisco.com>
 <DJ3QY884Q2R3.3DTBWW97HDVD8@smile.fr> <DJRN1II8LYOQ.1UZ61N9NS4OI8@smile.fr>
 <DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2@DM4PR11MB6189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: 2c89b073-e125-40ab-8bab-08dedd785ccd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|13003099007|38070700021|18002099003|22082099003|11063799006|56012099006|8096899003|4143699003;
x-microsoft-antispam-message-info: 
 L5UdhS+Jw1ryTln6HwcLnZTOf7CfxeLFHuFw4DcIEfJs74zGV/DoUFHUbXxx9LsOzukxv/Wyjh7MTrkf+m3TQCfk31LCTji3fBAyWOzmAazdnRWpmYbrXiQpRR6UJcqUTWOAg4/7NLAjFT7rDSw9kQ/q5gRq2fcgRfB9li0MHDT1grpyCqnErJn9Gz5QE24pNDuIRCTf9QMXRAcsSzRHsAm30+ApPpdxOjCGSN5R+cI9m44qpK9H4Jly4UDz6oHhOFIdh7qb/vHbmT9O/OU8UW+zFjeBSE/fqJE8nBychtTtziZ7sWaX/1aEvz8thJ69UAlFJWlwrYxnORGFwCgEUCl8bm5SW7L01AQlaHOiLZDR6kXdUhB3fyXA/RdJekorTa91E8VjbIJB+my1PW8SgFs5wM3n4BzqkX2H1cgLWYU8RU9/deABeigmsyqXvLUP2UXjd9AxQ9wfzzevJsB+nOxjdB4nXND37LfQEGl/H3hfk/3P0IDoBlPg+9MwDDkefz+kEPhjfh59Y6tCN7toNWUttuoea3ZxhrN/67Tf1OqY+lTCJVzd9aTotzJcOq+B9itNZnJudAZlgD9IvMAXyP3hZTPv7TZ0zcyJHks4daZb71UTh/2/U393ou5WpNjqyxCToxdoQcY1L2TgEadHnn00OtEp5r3BjsQ4mzJmqLY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(13003099007)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006)(8096899003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dhk2X9j1xHgvOXf6EcFiTNoRvO0oddrJQeto0z9SpFaTCDriXjzloxjckr?=
 =?iso-8859-1?Q?ddbqqkl0mMVoGpw87eFJH1XDdTXhPqm9xR7uHWngwiIl8iwKEEg//PfiBz?=
 =?iso-8859-1?Q?PteuAneKvWl0mGkz49lEW3cpb1z28TlBfkiK2e/EjxyXhysDWy3OFJ+PAv?=
 =?iso-8859-1?Q?dHXgvOCh3YNBXfnXAhA3/vu3MuYe6LvjZmzdFYziPjFql4BLVDTnDIs1vd?=
 =?iso-8859-1?Q?K5ZdWxBvAWT13p0FsHhZ6BV9OArTc27ClgLmQD7XnbmGPRThtHCD9UwvEp?=
 =?iso-8859-1?Q?GIaJmsnYa5/SA7zSmA2osxYpBHyzOg7Zi5aX7urDF4x6tRI8Ewnnvh/TVF?=
 =?iso-8859-1?Q?Vn/RnGpdsc5dKGwXSW8mBTiFLBDBk4JUZYokDRoA7sgT6yO1JFX3sjytt8?=
 =?iso-8859-1?Q?yUqRUH7A9yoZ9+StYaeYPzHmR5SYFnXb5nvlincbkTglmly3EMxMSHmGQK?=
 =?iso-8859-1?Q?aPkYiJ8vyvhdG5E1J57XmF0cwVfcS85C0qdXkrIe2vYOiuhS0kQUslqXp1?=
 =?iso-8859-1?Q?49KVUpx/TO1Tf7loOFYYBguRfcMjsYtm/ZEtDmn+mO19ZBnQQ6TpRRc3IC?=
 =?iso-8859-1?Q?9dJsL7MIqE3eoYD/yfq0csLyN93eE8LPKdWeXmb6o834A9p5WlQxA7GoNi?=
 =?iso-8859-1?Q?ogsVYUGXQ+U5ZVWbJPYfpbZfDTkZehhZGQQuJozG4KuW92auU5ELUAOG5Q?=
 =?iso-8859-1?Q?fJy0zy0RVedPfrEK607oxs/Re507yXx8tp/dpgYVuLbP9kw30RUQGgHIZX?=
 =?iso-8859-1?Q?2L2Ae9p5Aps8KLue9RSkOL0Hu2YAdD+Owp/IulM+8FcWQOo5jQQl4A7wS5?=
 =?iso-8859-1?Q?818TAtgn8MXljxDrZ6Gouhy/wDEFI1cX8JsjzLKkjr4ppG4bd5bOnQpMPi?=
 =?iso-8859-1?Q?0+AR0oeBALi9YCsoDA2pd0x0RnNcB42nrrml5ZYdJz65Igtfvz2x/XOgZ4?=
 =?iso-8859-1?Q?k+kVoCbiFEsFVR5F2we5cmHtbBlbcklmaNhNxNqVejN/W/U/mjf/cZGmxI?=
 =?iso-8859-1?Q?LtA+nfHcUySBeeIC+NQDzYCttwqCC7NVF2C/zqK7clvodnXNrlfkuhUAZf?=
 =?iso-8859-1?Q?vpsaHpxh7xUhf5LirLFQTMv2Hn6Mh644je1Rjei0lALn06UnFhOoXpqM+E?=
 =?iso-8859-1?Q?ERodJidM7lYJrZvfba9IxBUTBKsUTS4eyvt+MsXZmgKWqabo2PeS5sT1aC?=
 =?iso-8859-1?Q?7OMMMIhc4rlvLUe49i1Cq7ljJhFnWrcVCsgQQTP8C6Wso1qOhTagi5xz+Q?=
 =?iso-8859-1?Q?ssU6pfL5hASmAtLGEVvGdrDGCqgnJKKFdBoIfoBS39f7TuC51mToVjWxRG?=
 =?iso-8859-1?Q?fVk3FmRzgeahz8zQXZkMYF8YGYTXB4e7jNo1dzlzbYLoUcqfzgSRrwwP71?=
 =?iso-8859-1?Q?07WkM7vY7d9YS3zVW6ImxvR3gSSDIkdcMFfZ6y0zYYW+snwt51b6oqzmDJ?=
 =?iso-8859-1?Q?lGX51L2ZOJvEiojg7r24AIi9oD+wuWKIKMFjApDEaDpFNdaidTmj8GxsqI?=
 =?iso-8859-1?Q?tRI7mwsvhvImoqebKVAXP3D0oyw4vgldZJ4d/pBEj6SORQVBUK5IlWxlAx?=
 =?iso-8859-1?Q?9Xm/ZIvKncEayHzeVdYRGvNhIxFfks1qMoMabM3oizJUwJJKtT7buPmgZA?=
 =?iso-8859-1?Q?sbCSy9Om1r6apw2bChh5Bs2S8L3/10k0/1Zb616jvz9vVUPwBXoBXVJy2k?=
 =?iso-8859-1?Q?00IyoAn8OBmlh7ct+DFm7jfHChGjxnfbF0uuFPKSPJzBucvX8QvynwRNbe?=
 =?iso-8859-1?Q?rdq/cSSA4msSg5kasqEoFhmjRIe5/LBcKCtI1oGIVLuV+5?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61891DE87D41D71FEDE29E81C4FE2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	knUTfsZh/aVVi92It5Aw84eklL/x+SUK5kkYu1Ll1BtEjRksdQXd7SKqUtlfVdikI75P2YHBJmq2gQSxjNctdOQ5WXgfKunAE1cbyWnPwtixlQ1iE5UyqGOg2YEmCRDm5xTetwDM1aL9G9eNuCm2WXyltKW3nGbdXi5An6vuvaYQCpc0QSJmdM6frDSM1XQnkWIcrWZJbaIAUwSasK/eGJ+bIp2bB01aB1hLqf5giNSRHzFy/qyfTamS9aPzzu1NDmlD2KdencQ4KgNpzGp+Q/BqW9Pqsxj5XiWKgOCwZLiYR8DHJsOTtBr2hKb8RwaBxUKbv3ANh0XBQHRGwkhLvQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c89b073-e125-40ab-8bab-08dedd785ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 05:10:15.5473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ep/+gqL562R2uDKJ5tO8BZU0VfkaBPwQUIb7oNuN6Qu/QBVTF9H7hxKGTLFuYv26ZFuh8DqPV2OW3oQsLQFHmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240518

--_000_DM4PR11MB61891DE87D41D71FEDE29E81C4FE2DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have sent the wrynose patch for this CVE: openembedded-core@lists.openemb=
edded.org | [wrynose][PATCH] libcap: Fix CVE-2026-4878<https://lists.openem=
bedded.org/g/openembedded-core/topic/120185745>

Regards,
Deepak
________________________________
From: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
deeratho@cisco.com>
Sent: Wednesday, July 8, 2026 11:50 PM
To: Yoann Congal <yoann.congal@smile.fr>; jeremy.rosen@smile.fr <jeremy.ros=
en@smile.fr>; Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Ci=
sco) <adongare@cisco.com>; openembedded-core@lists.openembedded.org <openem=
bedded-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878

Hi Yoann,

Anil is on medical leave. I am working on this and will submit the patch fo=
r wrynose by tomorrow 9th July.

Thanks & Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, July 6, 2026 10:14 PM
To: jeremy.rosen@smile.fr <jeremy.rosen@smile.fr>; Anil Dongare -X (adongar=
e - E INFOCHIPS PRIVATE LIMITED at Cisco) <adongare@cisco.com>; openembedde=
d-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; to@ci=
sco.com <to@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878

On Mon Jun 8, 2026 at 4:44 PM CEST, J?r?my Rosen via lists.openembedded.org=
 wrote:
> Hello Anil
>
> from what I can tell, this CVE was fixed in master but not in wrynose
> please submit a patch for wrynose then ping this thread so we can apply
> to scarthgap

Hello Anil,

Gentle ping for this patch, do you plan to send the needed patch for
wrynose?

Thanks!
>
>
> thanks a lot
> Jeremy
>
>
> On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Anil Dongare <adongare@cisco.com>
>>
>> Pick the upstream patch [1] as mentioned in [2].
>>
>> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D28=
6ace1259992bd0c5d9016715833f2e148ac596
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-4878
>>
>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>> ---
>>  .../libcap/files/CVE-2026-4878.patch          | 162 ++++++++++++++++++
>>  meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
>>  2 files changed, 163 insertions(+)
>>  create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patc=
h

--
Yoann Congal

--_000_DM4PR11MB61891DE87D41D71FEDE29E81C4FE2DM4PR11MB6189namp_
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
I have sent the wrynose patch for this CVE: <a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/topic/120185745" id=3D"OWAdb1c6139-30db-76ae=
-adb5-8a2a0dcce81c" class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org | [wrynose][PATCH] libcap: Fix CVE=
-2026-4878</a></div>
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
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED=
 at Cisco) &lt;deeratho@cisco.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, July 8, 2026 11:50 PM<br>
<b>To:</b>&nbsp;Yoann Congal &lt;yoann.congal@smile.fr&gt;; jeremy.rosen@sm=
ile.fr &lt;jeremy.rosen@smile.fr&gt;; Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) &lt;adongare@cisco.com&gt;; openembedded-core@=
lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;xe-linux-external (Internal Group) &lt;xe-linux-external@ci=
sco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026=
-4878</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Hi Yoann,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Anil is on medical leave. I am working on this and will submit the patch fo=
r wrynose by tomorrow 9<sup>th</sup>&nbsp;July.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Thanks &amp; Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Deepak</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b>&nbsp;Monday, July 6, 2026 10:14 PM<br>
<b>To:</b>&nbsp;jeremy.rosen@smile.fr &lt;jeremy.rosen@smile.fr&gt;; Anil D=
ongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;adongare@ci=
sco.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;xe-linux-external (Internal Group) &lt;xe-linux-external@ci=
sco.com&gt;; to@cisco.com &lt;to@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026=
-4878</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On Mon Jun 8, 2026 at 4:44 =
PM CEST, J?r?my Rosen via lists.openembedded.org wrote:<br>
&gt; Hello Anil<br>
&gt;<br>
&gt; from what I can tell, this CVE was fixed in master but not in wrynose<=
br>
&gt; please submit a patch for wrynose then ping this thread so we can appl=
y<br>
&gt; to scarthgap<br>
<br>
Hello Anil,<br>
<br>
Gentle ping for this patch, do you plan to send the needed patch for<br>
wrynose?<br>
<br>
Thanks!<br>
&gt;<br>
&gt;<br>
&gt; thanks a lot<br>
&gt; Jeremy<br>
&gt;<br>
&gt;<br>
&gt; On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFO=
CHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt;&gt; From: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Pick the upstream patch [1] as mentioned in [2].<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://git.kernel.org/pub/scm/libs/libcap/libcap.g=
it/patch/?id=3D286ace1259992bd0c5d9016715833f2e148ac596" id=3D"OWAbc9334f8-=
c7c3-3a2c-0964-5599bf658ce1" class=3D"x_OWAAutoLink" data-auth=3D"NotApplic=
able">
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D286ace125=
9992bd0c5d9016715833f2e148ac596</a><br>
&gt;&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-202=
6-4878" id=3D"OWA456e1b58-24a8-5cd0-85c0-378f0876c465" class=3D"x_OWAAutoLi=
nk" data-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-4878</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; .../libcap/files/CVE-2026-4878.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 162 ++++++++++++++++++<br>
&gt;&gt;&nbsp; meta/recipes-support/libcap/libcap_2.69.bb&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp; 1 +<br>
&gt;&gt;&nbsp; 2 files changed, 163 insertions(+)<br>
&gt;&gt;&nbsp; create mode 100644 meta/recipes-support/libcap/files/CVE-202=
6-4878.patch<br>
<br>
--<br>
Yoann Congal</div>
</body>
</html>

--_000_DM4PR11MB61891DE87D41D71FEDE29E81C4FE2DM4PR11MB6189namp_--

