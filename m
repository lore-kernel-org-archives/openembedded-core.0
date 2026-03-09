Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAD5F3C263
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:42:07 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14454.1773063724026816165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dAecNp65;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6569; q=dns/txt;
  s=iport01; t=1773063724; x=1774273324;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=EEWUd4eZDLHmycZ3NzzJSpZxh+fzgjxu828GcoWkLNs=;
  b=dAecNp65qz3C4CC68o0O4R3BPlYTMIYdO9cBq8/2dGIz2UcexI6j33Ep
   f9hG1EnYPy6fL6zbRUWXsfDb5NfaaSlG6s6rf3w+9aQ0O/B3BOCCs9sd6
   yKusFwlpElq77JVGNx6IN1nykelTiTYeUYxq/hZw7HNjgARfCcfEWg6Z2
   /vcdK7RgdOJeUWqC/RjCgCU22XoP9QXF3i1J6QgDHvu/xKCwoJOwFCXYl
   1OGaQxwYd4PqYpapzU5cNtfJimMjyVV299j525/LRn1ycIIbTMwGb26GK
   aECN38eTePWI4QDTi9Xg5PFDi3K+gnpVkJq2/D1Zc1UDvwPZD7uT2jVNE
   g==;
X-CSE-ConnectionGUID: bUTTw7u5R3KdS98TWn/VUw==
X-CSE-MsgGUID: NlIq9DcRTQ6rgk4gCCgMTA==
X-IPAS-Result: =?us-ascii?q?A0CSCAAEza5p/5EQJK1RCYEJJYErgT0BMFMHfgKBIUmII?=
 =?us-ascii?q?wOFLIZYgiEDl0OGV4F/DwEBAQ0CLgEVDQQBAYUHAo0gAiY1CA4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPAQyGWgEBAQEDARFgBxACA?=
 =?us-ascii?q?QgRBAEBAS4nCh0IAgQKBAUIDA6CYYIdFkADAQIOoG0BgT0Ciip4gTSBAeAuF?=
 =?us-ascii?q?YE4hQQ4gxcBASqBNYJbgSEZOIRCJxsbgXKBV4JoPoJhBAEXgRoDKzyDV4IvB?=
 =?us-ascii?q?IIiehQdhyMGgUaDCT2GSVJyIgMmMywBVRMXCwcFgSNDAyovLSNLBS0dgSMhH?=
 =?us-ascii?q?RcUH1gbBwUSISqBSniCAQ+GankDLl4aDiICKBJcSj4LWgWCJAMLbT03FBsDB?=
 =?us-ascii?q?IE1BY0EXD6CUx43RiItgW4Rk1WPFUejLwoog3SMHo0+iDIXhVulEC6YWCKNZ?=
 =?us-ascii?q?5YChQsCBAIEBQIQAQEGgWoCOIFZcBWDIglJGQ+XNMNzeAIBOQIHCwEBAwmRa?=
 =?us-ascii?q?oF9AQE?=
IronPort-PHdr: A9a23:Ua5Mchdb5pnm8XM26sIfLXPjlGM/gIqcDmcuAtIPkblCdOGk55v9e
 RWZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:Hb3/NaugxG2r2N6OcpsgE/2Ps+fnVAhfMUV32f8akzHdYApBsoF/q
 tZmKWqOaavcYDOje95+aoq0/EoGvJ6DzYRnSgFrrXpnRS1BgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/nb+Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8NtLPX4R6
 KEicxMBVUHTu92wh4yGVbw57igjBJGD0II3s3Vky3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgp/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGIaIK4HSGJgKxi50o
 Erg+0XgUz0RDuCmlyCK8S6jrcTAuB/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dbDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:FREId67Sb//UYRTB7wPXwa2CI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ8dcLC7VJVpQRvnhPhICPoqTMaftWjdySSVxe5ZnPHfKlHbaknDH6tmpN
 hdmstFeZPN5DpB/LvHCWCDer5KrqjkgcWVbKXlvgtQpGpRGthdBnJCe32m+zpNNXF77PQCZf
 2hz/sCjQCNPV4QacO2DGQEWe/sm/3n/aiNXTc2QzQcxE2rlz2H1J7WeiL04j4uFx9fy7Yr9m
 bI1zf++riitP+DzBrd3X/47phdmtfto+EzRfBkjPJ7FhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nL4ZAiO0FjQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6nAnoMp33M
 twriCkXttsfFb9dRbGlp/1viJR5wyJSL0Z4LcuZklkIM8jgXlq3NQiFQ1uYcw99WnBmfAa+a
 FVfbLhDbBtABOnh7SzhBgz/DRqNU5DRCtvTiU5y76o+ikTk3Zjw0QCwssD2n8G6ZImUpFBo/
 /JK6Jyidh1P4UrhI9Gda88qPGMeyfwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvfJAT1pM9lJ
 nITVsd7AcJCg7TINzL2IcO/gHGQW27UziowsZC54Jhsrm5QLbwKyWMRF0njsPlqfQCBc/QXe
 q1JfttcrLeBHqrHZwM0xz1WpFUJ3VbWMoJuswjU1bLuc7PIp2CjJ2TTB8SHsuaLd8JYBKJPp
 JYZkmHGCxp1DHeZkPF
X-Talos-CUID: =?us-ascii?q?9a23=3APvH2CGmEPpVUD4OtpkEdwbKKKwvXOXfg8EvPfFL?=
 =?us-ascii?q?lMz1KRIbEGWOv/uRartU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ABO0ITg4II8DMokSxQoOBt+szxoxO54W3WWwGq6k?=
 =?us-ascii?q?/5dOLNnB/EBySqQieF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 13:42:03 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 07D9018000756
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 13:42:03 +0000 (GMT)
X-CSE-ConnectionGUID: VAh6lYZdTRG2dVrIpbeqsA==
X-CSE-MsgGUID: 3nJEJaaQTAW+5e5b0JLJSw==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208,217";a="49069668"
Received: from mail-bn1pr07cu00304.outbound.protection.outlook.com (HELO BN1PR07CU003.outbound.protection.outlook.com) ([40.93.12.4])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 13:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knzf8eQvDwTbt08Af1wynBU6zvUBf9lhu5u1V/9q7MVmyYqYhmHrK6EkPMWESv5S4Qea+sC4h/3++lWgbccrpx3Il5JcnJQs3dQK0vsJ9NJmMjK//J3rcUuTKyHJcviJKLX7Y3CmwVMeuL/wFQDz4/k5Z/Im7MeIzckEI9rp/wE16yZSRuSb5Hn49uol7Ai9Wco6jcfAaNz52ZkZa5VvcU7cNZdWm8YkEXCWCntVX6fNvlszsPshTPHt8BmlUSf+PAyoIfYvgYioJstCZDpd0UWcLjexFvsoFuByIVxLD4YJDr0BQs9Zq/X0mDeQa74rdfJK5j96cb0/Amh+2qPzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEWUd4eZDLHmycZ3NzzJSpZxh+fzgjxu828GcoWkLNs=;
 b=ypTZbiTrdimPzBEFPe+1BFjcPDi7NHXE7fxpMmCQ+878ZXDxmgs8fQTMIBXY70bOHogu31O1POsiUgl7CYRUfJfwP1RMhnWnTOa7z5D7ByOsVDbsmWKiQSQgLwgY/FIp+PrC3PdwBBUfIhuYrz4s96GvWGoU1bMnK838nis8DJowmXkG+ttlpcN3U7imKPUgwCi2csT/TCHqObKKAgTpBmZ3wp4/vykwkB7lbV82ORKcyxZ7URhfznJ1vSypeetOzG3OSmqnqPtiUpqz4zBZEQ4r0JoFN//4Dk++v5U44VxEw86QoPr7UOWs/ux0sgQ+8ww4jWuAdeIUAycesh0cEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by DS0PR11MB8761.namprd11.prod.outlook.com (2603:10b6:8:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 13:41:58 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 13:41:57 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Deepak Rathore -X (deeratho - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>, "Viral Chavda
 (vchavda)" <vchavda@cisco.com>, "Krunalkumar Darji -X (kdarji - E INFOCHIPS
 PRIVATE LIMITED at Cisco)" <kdarji@cisco.com>
Subject: Re: [OE-core] [PATCH v1] python3-dbus: Add CVE_PRODUCT to support
 product name
Thread-Topic: [OE-core] [PATCH v1] python3-dbus: Add CVE_PRODUCT to support
 product name
Thread-Index: AQHcpx8LL+pygh+rBkqjEiigKJcrerWc9CCAgAlSCGo=
Date: Mon, 9 Mar 2026 13:41:57 +0000
Message-ID: 
 <DS0PR11MB74057497B4ED7FFB7053E225DC79A@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <20260226125415.53196-1-hetpat@cisco.com>
 <20260226125415.53196-3-hetpat@cisco.com>
 <2A48C2E9-A501-4B74-87F0-16A831DEB842@arm.com>
In-Reply-To: <2A48C2E9-A501-4B74-87F0-16A831DEB842@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|DS0PR11MB8761:EE_
x-ms-office365-filtering-correlation-id: dda24bd5-f04c-47f1-2826-08de7de1a232
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7053199007|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 VI5zCVZnm3zaArxSvHMEiVgmb2XyWEP2LeUfcRFxfRSAgGCKzOQOYkitdfsZXZ0og9m9sBde280Bg58Fg+Jon9wrPF3Zu2MX7CktXuHH9Djkgm7e7sNum+QNG8ZCuvpAy9WR9gYxqloifHr1rymfVPT3qE2nT2yjA+Od5PKVix4RLGiwZ2VS9gPg8zvXJzeCrc5UuxtIUE+n+iUioS28cF12PQq6KvBN2ztU5GDsLrHqrt6V3kZ5N04OajYm9Lwo7vfomRfjCkUozePXvEJVItEissKoHm0iEXYJEtGODG5fLPyTKrUvBGICnGkwaHzN8NDE1SbBhMar6fGe5t2cAxociu9IDKxd4OB9WJsxviZCXAA3J4JGyb2leaQJpXhTEb9h7Hf9jxtEZpUQNaIds7JTRnk9jpzi8YKjdRhYytD928C6aIdnfZrmHPrI+F23UejJKcblXS3CIcw5BpPcW1XaxcSAqj2AtKBa3za/bdsXCwV7JzUuN6V3aRvcFvXY9EJkIQUzsbn95HTmO9iGlAeKBoB+lOhav7OWtm57lvjH0X21O790Uu2/mu5G/WICebhmemNZQT/MDLjkq/P8WJ/C9M1Rt0nrz9xj920Y7y/rkHk7Dtk6WDgDoQhxYs973Yu2/msBCMN0mKA+zh6eubPBwp7YcYiydVdh+ZzohE195Ucwg6Wxg3j6rc62oDf0KfTjH5Lq2bNmzFWEnpCM4TtsxA9edRBJJ8OHeXDfdBgYKu9sOtUe7qUjxXMD1jbd0hjN4UAnrDKusKpV8K1OC7ScLJ/pz2z2+C2JcoNv4tE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007)(13003099007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?QF902WPEz0Q2KZC52gG7KPBgWz5BA7QFYnsankhVl3DZ7Yyy8FJQo2Ka?=
 =?Windows-1252?Q?gGUI2c5ZHLBsTDhGraPqXv6hAx3TAdsQLr7X8tgrzU6RKsCKX3giNj9N?=
 =?Windows-1252?Q?92kNCtY5YyzhRKjIAi8zgShREfI+mwizZx8b7y9VzT6JTmScW26y1a22?=
 =?Windows-1252?Q?hjrwiUeP3Q00n6toLhF34XnB/KF9vimc4pddNajY1B3spM1021oxO6IX?=
 =?Windows-1252?Q?5BZ2lK7GkswjsyBm+NI0KtsGCXCAxAqq6LPWWNxIX++b5fElBUPE8D0q?=
 =?Windows-1252?Q?SmHS1xbBICCgrryed1x+oWrwjwEG936KUyui3BMFOoHwzX2KWU50yW5C?=
 =?Windows-1252?Q?+pqLmee0VOpgjKmoLla2Fpwviu7bggfgPd4sehkljinze0YsACnWOvEQ?=
 =?Windows-1252?Q?9rhFy0UAlgNj6PpklD8jueSdkejxNiwvUj+8MZi0sjfts8GSmhQe5fJs?=
 =?Windows-1252?Q?0jH5vzzeNhmf65Hrh9NmEzbX4JAXJjMQpqeoZmENRgSJEcYRqPh6It7O?=
 =?Windows-1252?Q?4WSBtuEjLMOysb6vlJsXCLzFdED3jzJZYHKiAe67IdVfLbctXzXsqEEv?=
 =?Windows-1252?Q?wI43dU2fT6g/AUuSaRWW2nYWE7buoXCe3+ErSPJqKLCzShqesBhahpTk?=
 =?Windows-1252?Q?MglK0CvZ62RtP//y4fQNRS9NmEq4MPWcubJN8w8JF6fT9vaqverZgpqX?=
 =?Windows-1252?Q?1FpS3pupHiWqZz+kfmgffFMRpgNkN1TVu5BIFLni6cGwHkp5GP+uBeL0?=
 =?Windows-1252?Q?BjTDcohLBja0vu95tKoZJKxsrnrjA1VhH2LO8O9n9Qx+gI4orD396Usl?=
 =?Windows-1252?Q?pvZOAcoe7tt/+583hVEGh1TBuNNNgYKI4rHA1F3/3bADvNnAT7dfTcqT?=
 =?Windows-1252?Q?HT+O1N7ESOuKW0oP6NEUQriGACG5mJK7d4sDFt9+zqVyCjswE2ismdiI?=
 =?Windows-1252?Q?XrsEcXTOQSk89PrbD+HoliQTJ2tOIRaDW9jkd5xNt2M/n6TSPfyry1yi?=
 =?Windows-1252?Q?omMfu9vk6hcMwNOoPGUQPsxupuGCOVayMR8YxCHRgjV7TSEdwhMQeGoK?=
 =?Windows-1252?Q?VV7qvVSJW2p6lYIkcN8vLFRflQOWG/u5cGYcH9DQBmvW+4AJvjVCSoqU?=
 =?Windows-1252?Q?1B4kQZlPxbGzdbsfEpuzSU0zPqXGHilMB44ujXLpOgmB+az5iSfgtrLs?=
 =?Windows-1252?Q?JyI13DtrYv8b45jvRmuu9gMJP/NazsrazPKC2hwAm5B5z5Zqe0rH2l1c?=
 =?Windows-1252?Q?fILVK8p5vLb/d9/urBQ7j3bFCfm8ozPijgCguy7EozFPLIYBSFHJAdMT?=
 =?Windows-1252?Q?9PWpiuQ9qsggHu0kkTuYxvvq4USL1rAvE3tl9XBWFXyCqiUvJnorTcA3?=
 =?Windows-1252?Q?/SjLGkxWlI6IVl9NCpZejqvH4lrnDOYwSoBJt73j5VZ6LNQORsD1HZFk?=
 =?Windows-1252?Q?OT/46VpraCrREqsgqyCgTr5yNijeT9nDhi/DsQ5JRXhHxlew9TrfP0Pp?=
 =?Windows-1252?Q?Tc20gC8NU8NstkBrc/80gfOosUWA+QIQc6S+KVfQgYd24Wh4f1BR9/fc?=
 =?Windows-1252?Q?ny7Rn/DpIrQ6iw49jv8Q2yqe0MHMZHyCU95ecy2XJODCUdjC9hZK7RdW?=
 =?Windows-1252?Q?9clJLOrFQjyUon5e92uSEtvDLtWjQ1HDq1xE+8dtNICD6pOKVUIaqCMW?=
 =?Windows-1252?Q?bI3MlOZzdkd/ACHwgONDhLbhLWV2pbVHTp1AgOpKZzjTiAgjaac9ryKc?=
 =?Windows-1252?Q?Bcr6wBrHoS4i0KyvK5vrVjQVQA2bvUP3H6e6tMFSEF0ZPfm7ry6PCV80?=
 =?Windows-1252?Q?WKcgpQL4jRq28KT3Si+KgRgc9dIQCVaVVBB3U8Mh8EKuH1wNp22Vvv2C?=
 =?Windows-1252?Q?Lqs8+HjhNuYGWsbeRIRqTd02YRFsnn+Xb1cofMYwLstkBzaa9xGAGO+e?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB74057497B4ED7FFB7053E225DC79ADS0PR11MB7405namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	GKFzSTmyXcFvl3m1CFcqcXkBP4VtNua0HGqcyOdmRu5+iSDfRaXyzAezoILHEo4K0n8Z1zBbZAC/ai3PW8dDPgrz9Hz7SPKddiIMW7vGZHbZLcG8B4mBsfgVpc0Hkr3k/6GfnzGt+/47FMzVU5bykqwWvRa6E+vrjphu2YtNXWSCaaYPSoTaMrnYR5J7gcm/VxKScAc9YzJZIl+MCzyVfvIp0dRHZoc3wrgpYp0L0Uxw1knAyOHCSNnw+IoJtaDrMUuZR8WxFfpt+fap5Q7ziPxdwwRKuUa+sYlrCw5zxkmleCPWM8Cee2FxFa+3cKaUhdVR0AsqThDlR9o6jIXFzg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda24bd5-f04c-47f1-2826-08de7de1a232
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 13:41:57.5081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbtYioBtrV8Y/XgHEnLeNcKJunzjlAPljZlfQysUt3jNcQ2H+PqmqcH2PFVXbYj2GFeGssOcKyim4kZIZ7muPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8761
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232718

--_000_DS0PR11MB74057497B4ED7FFB7053E225DC79ADS0PR11MB7405namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This assessment appears to be correct, Ross. `freedesktop:dbus` in NVD CPE =
refers specifically to the core D-Bus daemon and libdbus, not to `python3-d=
bus`, which is a separate Python binding layer with its own source tree, ve=
rsioning, and maintainership. Since no confirmed CVEs are directly attribut=
ed to `python3-dbus` in current NVD data, there is no valid basis for this =
CPE mapping.

A dependency relationship alone does not transfer CVE applicability. Settin=
g `CVE_PRODUCT =3D "freedesktop:dbus"` in `python3-dbus` risks over-attribu=
ting `dbus` vulnerabilities onto `python3-dbus`, creating false positives i=
n CVE scanning and a misleading impression that a `dbus` patch resolves `py=
thon3-dbus` issues. `python3-dbus` must be treated as a separate product id=
entity for accurate CVE attribution.

Requesting the community team to drop this patch:
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D4d04761a4a69
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org>
Sent: Tuesday, March 3, 2026 8:49 PM
To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@ci=
sco.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH v1] python3-dbus: Add CVE_PRODUCT to support =
product name

On 26 Feb 2026, at 12:54, Het Patel via lists.openembedded.org <hetpat=3Dci=
sco.com@lists.openembedded.org> wrote:
>
> From: Het Patel <hetpat@cisco.com>
>
> - Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
> reporting.

Have there been any CVEs for python-dbus so that you=92re sure that you=92r=
e using the right CPE?  This is the CPE for the fdo daemon and libdbus and =
python-dbus is a separate project, so you can=92t know in advance what the =
CPE will be unless it=92s been stated in advance, or there are CVEs to refe=
rence.

Cheers,
Ross

--_000_DS0PR11MB74057497B4ED7FFB7053E225DC79ADS0PR11MB7405namp_
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
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This assessment appears to be correct, Ross. `freedesktop:dbus` in NVD CPE =
refers specifically to the core D-Bus daemon and libdbus, not to `python3-d=
bus`, which is a separate Python binding layer with its own source tree, ve=
rsioning, and maintainership. Since
 no confirmed CVEs are directly attributed to `python3-dbus` in current NVD=
 data, there is no valid basis for this CPE mapping.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
A dependency relationship alone does not transfer CVE applicability. Settin=
g `CVE_PRODUCT =3D &quot;freedesktop:dbus&quot;` in `python3-dbus` risks ov=
er-attributing `dbus` vulnerabilities onto `python3-dbus`, creating false p=
ositives in CVE scanning and a misleading impression
 that a `dbus` patch resolves `python3-dbus` issues. `python3-dbus` must be=
 treated as a separate product identity for accurate CVE attribution.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Requesting the community team to drop this patch:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dmaste=
r-next&amp;id=3D4d04761a4a69">https://git.openembedded.org/openembedded-cor=
e/commit/?h=3Dmaster-next&amp;id=3D4d04761a4a69</a></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Ross Burton via lists.openembedded.org &lt;ross.burton=3Darm.com@lis=
ts.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, March 3, 2026 8:49 PM<br>
<b>To:</b> Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt=
;hetpat@cisco.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v1] python3-dbus: Add CVE_PRODUCT to s=
upport product name</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 26 Feb 2026, at 12:54, Het Patel via lists.open=
embedded.org &lt;hetpat=3Dcisco.com@lists.openembedded.org&gt; wrote:<br>
&gt; <br>
&gt; From: Het Patel &lt;hetpat@cisco.com&gt;<br>
&gt; <br>
&gt; - Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE<br>
&gt; reporting.<br>
<br>
Have there been any CVEs for python-dbus so that you=92re sure that you=92r=
e using the right CPE?&nbsp; This is the CPE for the fdo daemon and libdbus=
 and python-dbus is a separate project, so you can=92t know in advance what=
 the CPE will be unless it=92s been stated in
 advance, or there are CVEs to reference.<br>
<br>
Cheers,<br>
Ross</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB74057497B4ED7FFB7053E225DC79ADS0PR11MB7405namp_--

