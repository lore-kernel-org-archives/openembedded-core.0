Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14332C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:50:02 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13204.1787564994397622053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=M4/3cIoG;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=44853; q=dns/txt;
  s=iport01; t=1787564994; x=1788774594;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=Atj7uYldztZPUfKmXAuuyyqO7VYN+gT5DVOYEZDgJ50=;
  b=M4/3cIoGnoxrkPYLsPOln/B9I3c1Nnra7g1CMqmIl7xWaMoQj20NoWuK
   BkGYtTttOuRXD0cEkFqARy8gtIEgRe6Uow22gveAqp/f58PhPI6aH78K8
   9b8fwTbpTwpZQ564XbWbKf/Eqv/dKdoFyNhAUcc43PwN6lAFLimtkeyc4
   lmaYPmoF6E+XCfTTSclO84BQST9FSrrn4LGcekx2J6DwCwDQWO98NahX8
   M11vCI53EF9E0DKSPNcr2bzA1xjqOlSxzSBu83SDzdjqIt3lY01PQmEJY
   B4GOM21gM9qL6FMoRkJ1qyN+gQSA1ToeWlFOqYdFpCsXPnWEVEztJ5HzT
   A==;
X-CSE-ConnectionGUID: V94lbK6mRZ2Xf59xpk8uBQ==
X-CSE-MsgGUID: DQLjtBzJQL+uhzc1Tfr9bQ==
X-IPAS-Result: =?us-ascii?q?A0CQBABPEoxq/4z/Ja1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UmIIwOFK4ZYgiEDgROQN4xRFIFkBg8BAQENAi4BFQ0EAQGBcQEggnMCjWwCJ?=
 =?us-ascii?q?jYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDA?=
 =?us-ascii?q?RkNJAEbIgIBCBEDAQEBARYBAQgBDScKHQgCBAEJCQiCe4IdFkEDAQIOBrgYA?=
 =?us-ascii?q?ooceIEBM4EBgygBMQUJAgJAAdwMFAGBOIUFOoMeAQEqgTWCXYEjGAGEfCcbG?=
 =?us-ascii?q?4FygRVCgjE4PoEFgVwBAQEBAYEgJRoeKAIEAoNFgjAEgiJ6EhuBPx5UJIFUj?=
 =?us-ascii?q?xZSciIDJjMsAVUTFwsHBYEjEDMDIAovLQIUDSIPGgUtHXAMJxIPHRcXHlgbB?=
 =?us-ascii?q?gUSICpBRCMDEyuBGUECgXU/Ixk2fIEJXoErKWUCEBdGLhWCBwKCWoEnXgIBS?=
 =?us-ascii?q?UMOB0ciC209NwYOGQMEgTUFjXIHWx+CRzEvASEMARMWAQEvVn0RKgseknQJA?=
 =?us-ascii?q?QePT0eBNYIhnieBMwoog3aMIo0+T4djF4VbpRGZCCONZ4QSkVUBGBmEdQIEA?=
 =?us-ascii?q?gQFAhABAQaBUhwBNYFHCwdwFYMiCQoMNBkPji0WgXiBaIF/gxSBLcVZeQIBC?=
 =?us-ascii?q?DIBAQcCBw4DC4FokAIkgVgBAQ?=
IronPort-PHdr: A9a23:nDlWYxfiniRk+GTGgN3kpjSZlGM/gIqcDmcuAtIPkblCdOGk55v9e
 ReZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:RhxaFqqwHEmwEE6KbpFzYwGx7m9eBmJDZBIvgKrLsJaIsI4StFCzt
 garIBnSbv2PYGakKYp2Pdzk9EJTuJbXztFnHAJv+Xw3QilE9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8k835ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tgmXWVE1
 qIdEgJXXh7e1vKuw+KmYNA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUPrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXH50Kzx7D/
 TquE2LRLig+NsC12xi81jGxhv3ExB/1QtMYLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZM5ottdQ9Qnoh0
 Vrhc87VOAGDeYa9EBq13ryVtji1fyMSKAc/ieUsFGPpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:uT2ip6jy/hKK/ZNYPYq1RVv0unBQX9N23DAbv31ZSRFFG/FwyP
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
X-Talos-CUID: =?us-ascii?q?9a23=3AC5zWPWljSoZOwLxWb1skhQGybHrXOUOMkHPaABG?=
 =?us-ascii?q?9M1QzeLPIGE+I+/N5ufM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A6HIXng5wvjFpjvKaZKW7wpzuxoxE2oCsFGofs6w?=
 =?us-ascii?q?i+NSEJycpBzmH3T6OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 09:49:53 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id DF5A4180001FC
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:49:52 +0000 (GMT)
X-CSE-ConnectionGUID: 9QArJFzmRoS6DcmSxd8bVg==
X-CSE-MsgGUID: IQW3+3hYQt+8ZUd0bZbKeA==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208,217";a="77837277"
Received: from mail-centralusazon11011023.outbound.protection.outlook.com (HELO DM5PR21CU001.outbound.protection.outlook.com) ([52.101.62.23])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 09:49:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYUXFrvfxYrJ0EtKAtfD2wV1t7bnfPTGUsaLlFatuy4IIkK/QzStvGbAGrihWK8XuSIzOZcuWlXQmKcuK/AXfOhueOD7UVuV+9CaV16n3YjyDIi4D/GL+SxYb+QSsJC17gyhDVBMprpQDZ4F9J48HI+b8GTJOGok3j8TYhs1ON27hequQrznU2+jUVj37Qs1cGLLheHW9xZpUAXKAS0cQn2fzjww7eUz0EpFYHFLHXbzjSbkyLZyVRdRasJiWdiSeGsgZqybVgVy2ge7morIIA/DA8xgG2graFehJujdBP90TdYcBFA0ssxznKKwGIaglWYk9HQDp8np+FJ0+ysi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atj7uYldztZPUfKmXAuuyyqO7VYN+gT5DVOYEZDgJ50=;
 b=wJaqQ7eqLbPt2hAwbqebn2xiLc/RlDAcS8X1I/i1UBNk4ZpgwzF0txBCoG/MypFqibQgN3rFrG9Zoe1dfw4wDzLmT8xMPTYYeIw6Ke+z+P/6mitIPKHL40+4ZnQwbfjJb5KxICtlG9CDPl4B17H20ngIik8N2F7fg4DJLIUlht1MbmXULl1/wkdFGfJWOhzaBDkKFk0Cg6YdLcciWSuiGy17EE7eNyZLxv9Ryv/iJQ5pA7VhQz74U1mjcgBO37egD6eQEnDDo7UrWCvfwPYsYbZaGh1RLfzYQzYdSvxR6i/0f2XZcqdViTZA192xyPmiAGpTgbeJzKSVNZ7MNY2j8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 by LVUPR11MB9833.namprd11.prod.outlook.com (2603:10b6:408:39d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:49:50 +0000
Received: from CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec]) by CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:49:50 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "fabien.thomas@smile.fr" <fabien.thomas@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 22/37] curl: fix CVE-2026-6429
Thread-Topic: [OE-core][scarthgap 22/37] curl: fix CVE-2026-6429
Thread-Index: AQHdMI3yP/24h//qXUa3FY7DMZpaw7as+n69
Date: Mon, 24 Aug 2026 09:49:50 +0000
Message-ID: 
 <CY5PR11MB61876665C18874BC2839A3F2C4A02@CY5PR11MB6187.namprd11.prod.outlook.com>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
 <18CD40121B3B9CC0.2965692@lists.openembedded.org>
 <DKTP3XEC9P8X.3NH15CYC35F07@smile.fr>
In-Reply-To: <DKTP3XEC9P8X.3NH15CYC35F07@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6187:EE_|LVUPR11MB9833:EE_
x-ms-office365-filtering-correlation-id: a9aba4a0-06d4-40ab-113b-08df01c50a43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|3023799007|20052099010|18002099003|22082099003|4143699003|11063799006|56012099006|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 0GxfePa9uqT+rR/1zBl3U6SEA25iU57+W4cfV9EivrAQJdBU1QCjDoAmsoUqQiSS+z0ZBUPWLrDiDU+RUEZid+s5kD7FqcLHPxo5/9M0nCS3XiI3fzrSnPLBTB8ilXmu61At/22YRr1P23x98+A/VYPCJxme6IdiSQZllFrGkKrAzLpTqZCfjSsEFzDnct0PGtHcURABBgryF5H9/98SIlYY6C/TOO6xau4oTX1IzO91Pc7tXBi3A8AtMspn9e+bUPM7DVwUFu7fYwX8GiWFLQ7y1gzgTOmuNgv0NdQpO8aEjsoXtmKXDX7RxOLGT8eGnVdS95QJLAZ5Fxq7RqoEEr6Irih5p5q3ugm/UEfrwuvfkDh29J+HVXBHGMuDH7eRLUjhWrx99rIy6cOV0HTv20Z7oLotsdHPIPARJfAVHQs0lztgA+7aiX+VKnEIx4illpgh4eaQ7BmW5pTwz7hM3k3NJzOsRd+aVDsbo4AtqHH8U/J8V/B5RYQT/fyRA3w7GPuuRu3GVJmV6GYXsP5feSuXeGdtNkJsUj/4w2jVGnPvZ8L6Afz0MAHYY74t9dKsAPbD1wYwQ9ItaN4WUaUWaD3eShvcZDaOIH2GVQGdqaDFepuXP1HI0VDvpnVZNvbcOJoTFamm6fRm9blNSF8etn6RbEIiNTuxcNOfrD9VYjQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(20052099010)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(8096899003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bEw9jumor1rZP0yS7WKlZbxfuWGwQva3kHh6EFY2r+appUwNJVgDpiTuER?=
 =?iso-8859-1?Q?ZEVgFrdKXFqpsDdvsfJGiuIWQY1M/Ym0Gy3/ZscZDIF++HbJ53xx5ENvXp?=
 =?iso-8859-1?Q?j9STi8+HL2hGhGt0vUaW5hn78YS7Xj7wJVJ7tSTzVq7LYj0mhr/bqL1fEh?=
 =?iso-8859-1?Q?gylrRp3SCvr6dD0Qm5pAx2i6ZADLGtRM2AQ/vWzvY+/jtzi8hnKRNN9sGg?=
 =?iso-8859-1?Q?VWMRRpG779njWVevMwu06t5/755O3oFTpb1+fR1nlgAoILx/CNzzFRe18U?=
 =?iso-8859-1?Q?DNNSvOryEDLyNrlSNra9sEBJFcde/kn3CmbhuUXaryqlTIrLtkS7A/TgY6?=
 =?iso-8859-1?Q?A+iOEKqHsuEIsGkTJ5xLdo2fbyWPJvsHR/jH2PDgqKkpIs4KNxqdE+e0wa?=
 =?iso-8859-1?Q?1POnjYtiumDhXkPJtljIHsP5JicHuer9KPsfIJA70i5/zzGCG+0GIvpVrv?=
 =?iso-8859-1?Q?7+54LBqYNIYciYuqj6vXL5g5TFxJIyiRZz7pSEwhsi6IBQ5NSCtdH2pO6d?=
 =?iso-8859-1?Q?kfnfsa4++ivNrK7Z4iSI1uYPaKWh+NcvUvvWTwh9USpkgoEpe6CBYTdxdJ?=
 =?iso-8859-1?Q?Kb3i9E2YOYce7vPe+8UwDJxEpbRhrn/eh09QQnehSPQsVjGf/daSat7MXB?=
 =?iso-8859-1?Q?IbLl7ATt5qi54hXLt4yhVSMVdhqCfYrYEN9D5rKfTS4KMswu4dm3q4iGef?=
 =?iso-8859-1?Q?wxm2nzmJQs+t2VfhOTiHmjGPuqHCKmPQPCbmO/bLuDfIYQtG7otmWzXU5/?=
 =?iso-8859-1?Q?eNz8Q4iTRjDuRin8t7Ded0SFjMeQZw1e1HIxfvS1p1pBz3RhJZNhFhtTnz?=
 =?iso-8859-1?Q?yZ9mHtjCXPpvCTFDxH0E7NLszPz/DW7KSMEWvRx562skRQUOWUj5dUA+Qb?=
 =?iso-8859-1?Q?vvxbLfymyG4CGk4c4nZXHBNH+We1JNID0o3RDUFmOGHmsR1wZRzdcuZ2ag?=
 =?iso-8859-1?Q?oH+s6ctUCRAOdItIVl+enqA7dvbOdGdRiyuv6QJW3GTlMadO+oQlj3MYnU?=
 =?iso-8859-1?Q?ZL85XDhcdAO8+dKKtAu1OGa4c7br6nGXvRx5Nd6EOwXF0Okzo0QjuwnJ9V?=
 =?iso-8859-1?Q?6N4YtKy+K6Z+pDS4ttaJrReOz/RedUzUGCqLZiFDDpTqDS6INlOFVIDhkN?=
 =?iso-8859-1?Q?fccoW7ygqdjopJbXxh6WnOOZb8mup5bw+pFlhwtj7SqYNrCe0WswYy9Cow?=
 =?iso-8859-1?Q?Uo0+wswpWA4c06TUHMl7/d806EYKs4Kjkz0XSYQH/U+6+9xAzZmHR8Fs+3?=
 =?iso-8859-1?Q?GgrbgA6yhsPjlTwqjHevqYo6kscEbGpe78RSQE6Bnjo7RHNwn7IY4h7TyZ?=
 =?iso-8859-1?Q?/EqX4CtWxIAd2KG5x5S1ircznNckhTDmflSj6lhKYFJZFXxr1HG9HJ8G+r?=
 =?iso-8859-1?Q?VIa6M05QidY1zngxFAA9WLXCpETdGAQ26lrseNq7q2McYhm6/zEJ1rxFdx?=
 =?iso-8859-1?Q?PgS3GHBHuDFoDmYpRxYKyxavlCk60goKECKS4uXmjqPiXhPnYUimwMoMgi?=
 =?iso-8859-1?Q?W44T3xs6IMk43ERirnatRkVYmuPWnlpd7XX9NQAq2FiwvXW9r3PuzVdJlu?=
 =?iso-8859-1?Q?wUNWM6Mt0GX8bjS74ra8nrNVPlqZVQ7ZVWxjuat8pZQSnIt/XHgwQjsuDn?=
 =?iso-8859-1?Q?bjHanQXyk36+MYYeQiA7YmmMH1RQLKAVQFw2vxTzCNylndgJYORfufRERu?=
 =?iso-8859-1?Q?klAG0TSisK1gjiynVhStYXRoHFicD3HYZCFqjS5MbWGnAQiVjjcyx4STOG?=
 =?iso-8859-1?Q?2py+m/do9XLIV9roG8j+9NwOeznnpgUUdV7X4SmE2us1HN?=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR11MB61876665C18874BC2839A3F2C4A02CY5PR11MB6187namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	aNHY1Ev2QNklpebj5jIAla+f9xGyzk0LwX/JzPGxeuEgmeRxQCDplrgtmeR//8pkFTP9LzBqcZOD/AIb333UE0sJq+V6rC64E2Q4MXRHsLU5Hr7IkCWjnUx2IucIuLeo8rSxEAQd3ip0443i9mzWqVPiEI/4cFJ0QnqknT8jj/gXnpfYEh6ZATMGHWG1TjAp4rOdSfyzGsUI6VmdBVGvujiQqW5zghhi95Moj58TlIXdAdm7cG2mhbDTlNfjJQ1JAV84rCIZ2RFmUCsEEK+yBLewfXCN+mvp4wIREr0fKYbnu5z+jxRW9HOty32omMTPnrcXbmH1c/tECMM2s9DNCw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9aba4a0-06d4-40ab-113b-08df01c50a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 09:49:50.2196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CZNnDTuvZDX1ZCBtNTQo553lUkKDntGVlHHMOcVObwh4sTabfC2eBEm/bI5u22rOwGb/AoLzZAH17CdwQanQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9833
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244076

--_000_CY5PR11MB61876665C18874BC2839A3F2C4A02CY5PR11MB6187namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Fabien,

Thanks for your review. I have addressed this and sent the updated patch he=
re:
openembedded-core@lists.openembedded.org | [scarthgap][PATCH v3 4/5] curl: =
fix CVE-2026-6429<https://lists.openembedded.org/g/openembedded-core/topic/=
120900343>

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Fabien Thomas via lists.openembedded.org <fabie=
n.thomas=3Dsmile.fr@lists.openembedded.org>
Sent: Thursday, August 20, 2026 3:53 PM
To: fabien.thomas@smile.fr <fabien.thomas@smile.fr>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 22/37] curl: fix CVE-2026-6429

On Wed Aug 19, 2026 at 5:56 PM CEST, Fabien Thomas via lists.openembedded.o=
rg wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream backport for CVE-2026-6429.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f19=
9ace306
> [2] https://curl.se/docs/CVE-2026-6429.html
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429
>
> (From OE-Core rev: 0cbfae83eebf9076f7b22d07b48cb5cef1536989)
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> ---
>  .../curl/curl/CVE-2026-6429.patch             | 367 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 368 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-6429.patch
> new file mode 100644
> index 00000000000..f4df441aa2b
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
> @@ -0,0 +1,367 @@
> +From 8191fd6d5677c30579c09a8d0988b47bbf33f65f Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 5 Jun 2026 01:20:50 -0700
> +Subject: [PATCH] http: clear credentials better on redirect
> +
> +Verify with test 2506: netrc with redirect using proxy
> +
> +Updated test 998 which was wrong.
> +
> +Reported-by: Muhamad Arga Reksapati
> +
> +Closes #21345
> +
> +CVE: CVE-2026-6429
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/b4024bf80=
8bd558026fdc6096e8457f199ace306]
> +
> +Backport Changes:
> +- The upstream lib/http.c hunk adds the same-origin credential clearing =
to
> +  Curl_http_follow(). curl-8.7.1 predates that protocol-specific redirec=
t
> +  handler and carries the equivalent redirect logic in lib/transfer.c vi=
a
> +  Curl_follow(), so the full upstream lib/http.c hunk was adapted there.
> +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
> +  instead of the upstream tests/data/Makefile.am and
> +  tests/libtest/Makefile.am lists.
> +- curl-8.7.1 does not contain test2504/lib2504, so the new
> +  test2506/lib2506 entries were registered after the nearest existing
> +  test2503/lib2502 entries in the target-version test lists.
> +- curl-8.7.1 uses the older libtest harness, so first.h,
> +  test_lib2506(), and CURLcode result handling were adapted to test.h,
> +  test(), and int res.
> +- Scarthgap curl-8.7.1 keeps the same incorrect redirected-request
> +  Authorization expectation in tests/data/test998, so this backport remo=
ves
> +  that expectation with an equivalent target-version hunk.
> +
> +(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/transfer.c             | 103 +++++++++++++++++++++----------------
> + tests/data/Makefile.inc    |   2 +-
> + tests/data/test2506        |  64 +++++++++++++++++++++++
> + tests/data/test998         |   1 -
> + tests/libtest/Makefile.inc |   5 +-
> + tests/libtest/lib2506.c    |  71 +++++++++++++++++++++++++
> + 6 files changed, 198 insertions(+), 48 deletions(-)
> + create mode 100644 tests/data/test2506
> + create mode 100644 tests/libtest/lib2506.c
> +
> +diff --git a/lib/transfer.c b/lib/transfer.c
> +index a73462928d..0f5bd8ce59 100644
> +--- a/lib/transfer.c
> ++++ b/lib/transfer.c
> +@@ -865,49 +865,62 @@ CURLcode Curl_follow(struct Curl_easy *data,
> +     if(uc)
> +       return Curl_uc_to_curlcode(uc);
> +
> +-    /* Clear auth if this redirects to a different port number or proto=
col,
> +-       unless permitted */
> +-    if(!data->set.allow_auth_to_other_hosts && (type !=3D FOLLOW_FAKE))=
 {
> +-      char *portnum;
> +-      int port;
> +-      bool clear =3D FALSE;
> +-
> +-      if(data->set.use_port && data->state.allow_port)
> +-        /* a custom port is used */
> +-        port =3D (int)data->set.use_port;
> +-      else {
> +-        uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
> +-                          CURLU_DEFAULT_PORT);
> +-        if(uc) {
> +-          free(newurl);
> +-          return Curl_uc_to_curlcode(uc);
> +-        }
> +-        port =3D atoi(portnum);
> +-        free(portnum);
> +-      }
> +-      if(port !=3D data->info.conn_remote_port) {
> +-        infof(data, "Clear auth, redirects to port from %u to %u",
> +-              data->info.conn_remote_port, port);
> +-        clear =3D TRUE;
> ++    {
> ++      bool same_origin;
> ++      CURLU *u;
> ++      char *oldscheme =3D NULL;
> ++      char *oldhost =3D NULL;
> ++      char *oldport =3D NULL;
> ++      char *newscheme =3D NULL;
> ++      char *newhost =3D NULL;
> ++      char *newport =3D NULL;
> ++
> ++      u =3D curl_url();
> ++      if(!u) {
> ++        free(newurl);
> ++        return CURLE_OUT_OF_MEMORY;
> +       }
> +-      else {
> +-        char *scheme;
> +-        const struct Curl_handler *p;
> +-        uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, =
0);
> +-        if(uc) {
> +-          free(newurl);
> +-          return Curl_uc_to_curlcode(uc);
> +-        }
> +
> +-        p =3D Curl_get_scheme_handler(scheme);
> +-        if(p && (p->protocol !=3D data->info.conn_protocol)) {
> +-          infof(data, "Clear auth, redirects scheme from %s to %s",
> +-                data->info.conn_scheme, scheme);
> +-          clear =3D TRUE;
> +-        }
> +-        free(scheme);
> ++      uc =3D curl_url_set(u, CURLUPART_URL, data->state.url, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(u, CURLUPART_SCHEME, &oldscheme, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(u, CURLUPART_HOST, &oldhost, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(u, CURLUPART_PORT, &oldport, CURLU_DEFAULT_=
PORT);
> ++      if(!uc)
> ++        uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &newschem=
e, 0);
> ++      if(!uc)
> ++        uc =3D curl_url_get(data->state.uh, CURLUPART_HOST, &newhost, 0=
);
> ++      if(!uc)
> ++        uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &newport,
> ++                          CURLU_DEFAULT_PORT);
> ++      if(uc) {
> ++        curl_url_cleanup(u);
> ++        free(oldscheme);
> ++        free(oldhost);
> ++        free(oldport);
> ++        free(newscheme);
> ++        free(newhost);
> ++        free(newport);
> ++        free(newurl);
> ++        return Curl_uc_to_curlcode(uc);
> +       }
> +-      if(clear) {
> ++
> ++      same_origin =3D strcasecompare(oldscheme, newscheme) &&
> ++                    strcasecompare(oldhost, newhost) &&
> ++                    !strcmp(oldport, newport);
> ++
> ++      curl_url_cleanup(u);
> ++      free(oldscheme);
> ++      free(oldhost);
> ++      free(oldport);
> ++      free(newscheme);
> ++      free(newhost);
> ++      free(newport);
> ++
> ++      if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
> ++         !data->set.str[STRING_USERNAME]) {
> +         result =3D Curl_reset_userpwd(data);
> +         if(result) {
> +           free(newurl);
> +@@ -917,12 +930,12 @@ CURLcode Curl_follow(struct Curl_easy *data,
> +         Curl_safefree(data->state.aptr.passwd);
> +       }
> +     }
> +-  }
> +
> +-  result =3D Curl_reset_proxypwd(data);
> +-  if(result) {
> +-    free(newurl);
> +-    return result;
> ++    result =3D Curl_reset_proxypwd(data);
> ++    if(result) {
> ++      free(newurl);
> ++      return result;
> ++    }
> +   }
> +
> +   if(type =3D=3D FOLLOW_FAKE) {
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index aafd309a9d..f673f86384 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -251,7 +251,7 @@ test2300 test2301 test2302 test2303 test2304 test230=
5 test2306 test2307 \
> + \
> + test2400 test2401 test2402 test2403 test2404 \
> + \
> +-test2500 test2501 test2502 test2503 \
> ++test2500 test2501 test2502 test2503 test2506 \
> + \
> + test2600 test2601 test2602 test2603 \
> + \
> +diff --git a/tests/data/test2506 b/tests/data/test2506
> +new file mode 100644
> +index 0000000000..9c65002496
> +--- /dev/null
> ++++ b/tests/data/test2506
> +@@ -0,0 +1,64 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++cookies
> ++</keywords>
> ++</info>
> ++
> ++<reply>
> ++<data crlf=3D"headers" nocheck=3D"yes">
> ++HTTP/1.1 301 redirect
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 3
> ++Location: http://numbertwo.example/%TESTNUMBER0002
> ++
> ++ok
> ++</data>
> ++<data2 crlf=3D"headers" nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 4
> ++
> ++yes
> ++</data2>
> ++</reply>
> ++
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<features>
> ++proxy
> ++</features>
> ++<tool>
> ++lib%TESTNUMBER
> ++</tool>
> ++<name>
> ++netrc with redirect using proxy
> ++</name>
> ++<file name=3D"%LOGDIR/netrc2506">
> ++machine site.example login batman password robin
> ++</file>
> ++<command>
> ++http://%HOSTIP:%HTTPPORT http://site.example/ %LOGDIR/netrc2506
> ++</command>
> ++</client>
> ++
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET http://site.example/ HTTP/1.1
> ++Host: site.example
> ++Authorization: Basic %b64[batman:robin]b64%
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://numbertwo.example/25060002 HTTP/1.1
> ++Host: numbertwo.example
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/data/test998 b/tests/data/test998
> +index 0969d4704b..17c0a0e150 100644
> +--- a/tests/data/test998
> ++++ b/tests/data/test998
> +@@ -82,7 +82,6 @@ Proxy-Connection: Keep-Alive
> +
> +  GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
> +  Host: somewhere.else.example
> +- Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D
> +  User-Agent: curl/%VERSION
> +  Accept: */*
> +  Proxy-Connection: Keep-Alive
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index 9f7cec6027..9d3356aaf5 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -75,7 +75,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntlmco=
nnect libprereq      \
> +  lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \
> +  lib2301 lib2302 lib2304 lib2305 lib2306 \
> +  lib2402 lib2404 \
> +- lib2502 \
> ++ lib2502 lib2506 \
> +  lib3010 lib3025 lib3026 lib3027 \
> +  lib3100 lib3101 lib3102 lib3103
> +
> +@@ -684,6 +684,9 @@ lib2404_LDADD =3D $(TESTUTIL_LIBS)
> + lib2502_SOURCES =3D lib2502.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib2502_LDADD =3D $(TESTUTIL_LIBS)
> +
> ++lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> ++lib2506_LDADD =3D $(TESTUTIL_LIBS)
> ++
> + lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
> + lib3010_LDADD =3D $(TESTUTIL_LIBS)
> +
> +diff --git a/tests/libtest/lib2506.c b/tests/libtest/lib2506.c
> +new file mode 100644
> +index 0000000000..e6dde18507
> +--- /dev/null
> ++++ b/tests/libtest/lib2506.c
> +@@ -0,0 +1,71 @@
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Linus Nielsen Feltzing <linus@haxx.se>
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ **********************************************************************=
*****/
> ++#include "test.h"
> ++
> ++#include "testtrace.h"
> ++
> ++static size_t sink2506(char *ptr, size_t size, size_t nmemb, void *ud)
> ++{
> ++  (void)ptr;
> ++  (void)ud;
> ++  return size * nmemb;
> ++}
> ++
> ++int test(char *URL)
> ++{
> ++  CURL *curl;
> ++  int res =3D CURLE_OUT_OF_MEMORY;
> ++
> ++  if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {
> ++    curl_mfprintf(stderr, "curl_global_init() failed\n");
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  curl =3D curl_easy_init();
> ++  if(!curl) {
> ++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
> ++    curl_global_cleanup();
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2506);
> ++  test_setopt(curl, CURLOPT_PROXY, URL);
> ++  test_setopt(curl, CURLOPT_URL, libtest_arg2);
> ++  test_setopt(curl, CURLOPT_NETRC, CURL_NETRC_OPTIONAL);
> ++  test_setopt(curl, CURLOPT_NETRC_FILE, libtest_arg3);
> ++  test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
> ++  test_setopt(curl, CURLOPT_VERBOSE, 1L);
> ++
> ++  /* CURLOPT_UNRESTRICTED_AUTH should not make a difference because the
> ++     credentials come from netrc */
> ++  test_setopt(curl, CURLOPT_UNRESTRICTED_AUTH, 1L);
> ++
> ++  res =3D curl_easy_perform(curl);
> ++
> ++test_cleanup:
> ++  curl_easy_cleanup(curl);
> ++  curl_global_cleanup();
> ++
> ++  return res;
> ++}
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 2b988654c41..8e39d821626 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D " \
>      file://CVE-2026-6276.patch \
>      file://CVE-2026-5545.patch \
>      file://CVE-2026-6253.patch \
> +    file://CVE-2026-6429.patch \
>  "
>
>  SRC_URI:append:class-nativesdk =3D " \

I'll have to drop this patch because it is triggering a warning in the
autobuilder's ptest jobs qemuarm64-ptest[1] and qemux86-64-ptest[2].

It causes curl ptests 1159 & 1543 to fail :
        `FAIL: 1159 - HTTP Location: and 'redirect_url' with non-supported =
scheme`
        `FAIL: 1543 - CURLOPT_CURLU, URL with space and CURLINFO_EFFECTIVE_=
URL`

I'll drop the next patch of the series too (curl: fix CVE-2026-7168),
because it not applied anymore without this one.

[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4320
[2] https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4336

--
Fabien Thomas
Smile ECS


--_000_CY5PR11MB61876665C18874BC2839A3F2C4A02CY5PR11MB6187namp_
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
Hi Fabien,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for your review. I have addressed this and sent the updated patch he=
re:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/1209003=
43" id=3D"OWA6f5ac992-46f9-0af4-1cbb-32a78c29ca48" class=3D"OWAAutoLink">op=
enembedded-core@lists.openembedded.org | [scarthgap][PATCH v3 4/5] curl: fi=
x CVE-2026-6429</a></div>
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
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Fabien Thomas via lists.openembedd=
ed.org &lt;fabien.thomas=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, August 20, 2026 3:53 PM<br>
<b>To:</b> fabien.thomas@smile.fr &lt;fabien.thomas@smile.fr&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap 22/37] curl: fix CVE-2026-6429</div=
>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Wed Aug 19, 2026 at 5:56 PM CEST, Fabien=
 Thomas via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream backport for CVE-2026-6429.<br>
&gt; The upstream fix commit is referenced in [1], and the public<br>
&gt; CVE advisory is referenced in [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/b4024bf808bd558026f=
dc6096e8457f199ace306" id=3D"OWAe66c210b-f70b-0fa8-e482-e1ca0fb5c6b1" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace30=
6</a><br>
&gt; [2] <a href=3D"https://curl.se/docs/CVE-2026-6429.html" id=3D"OWA698f2=
40b-2769-ed56-a06f-1e134965f71f" class=3D"OWAAutoLink" data-auth=3D"NotAppl=
icable">
https://curl.se/docs/CVE-2026-6429.html</a><br>
&gt; [3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-6429" id=3D"O=
WA041a5359-9d8e-5b96-237a-f4f6dce290e9" class=3D"OWAAutoLink" data-auth=3D"=
NotApplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-6429</a><br>
&gt;<br>
&gt; (From OE-Core rev: 0cbfae83eebf9076f7b22d07b48cb5cef1536989)<br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; Signed-off-by: Fabien Thomas &lt;fabien.thomas@smile.fr&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../curl/curl/CVE-2026-6429.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 367 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.7.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 368 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta=
/recipes-support/curl/curl/CVE-2026-6429.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..f4df441aa2b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch<br>
&gt; @@ -0,0 +1,367 @@<br>
&gt; +From 8191fd6d5677c30579c09a8d0988b47bbf33f65f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
&gt; +Date: Fri, 5 Jun 2026 01:20:50 -0700<br>
&gt; +Subject: [PATCH] http: clear credentials better on redirect<br>
&gt; +<br>
&gt; +Verify with test 2506: netrc with redirect using proxy<br>
&gt; +<br>
&gt; +Updated test 998 which was wrong.<br>
&gt; +<br>
&gt; +Reported-by: Muhamad Arga Reksapati<br>
&gt; +<br>
&gt; +Closes #21345<br>
&gt; +<br>
&gt; +CVE: CVE-2026-6429<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/b4024bf808bd558026fdc6096e8457f199ace306" id=3D"OWAb2843ecb-e3f6-bb27-=
beb9-82b369309532" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https:=
//github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306</a>]=
<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- The upstream lib/http.c hunk adds the same-origin credential cleari=
ng to<br>
&gt; +&nbsp; Curl_http_follow(). curl-8.7.1 predates that protocol-specific=
 redirect<br>
&gt; +&nbsp; handler and carries the equivalent redirect logic in lib/trans=
fer.c via<br>
&gt; +&nbsp; Curl_follow(), so the full upstream lib/http.c hunk was adapte=
d there.<br>
&gt; +- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.=
inc<br>
&gt; +&nbsp; instead of the upstream tests/data/Makefile.am and<br>
&gt; +&nbsp; tests/libtest/Makefile.am lists.<br>
&gt; +- curl-8.7.1 does not contain test2504/lib2504, so the new<br>
&gt; +&nbsp; test2506/lib2506 entries were registered after the nearest exi=
sting<br>
&gt; +&nbsp; test2503/lib2502 entries in the target-version test lists.<br>
&gt; +- curl-8.7.1 uses the older libtest harness, so first.h,<br>
&gt; +&nbsp; test_lib2506(), and CURLcode result handling were adapted to t=
est.h,<br>
&gt; +&nbsp; test(), and int res.<br>
&gt; +- Scarthgap curl-8.7.1 keeps the same incorrect redirected-request<br=
>
&gt; +&nbsp; Authorization expectation in tests/data/test998, so this backp=
ort removes<br>
&gt; +&nbsp; that expectation with an equivalent target-version hunk.<br>
&gt; +<br>
&gt; +(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + lib/transfer.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | 103 +++++++++++++++++++++----------------<br>
&gt; + tests/data/Makefile.inc&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&gt; + tests/data/test2506&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp=
; 64 +++++++++++++++++++++++<br>
&gt; + tests/data/test998&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
&nbsp;&nbsp; 1 -<br>
&gt; + tests/libtest/Makefile.inc |&nbsp;&nbsp; 5 +-<br>
&gt; + tests/libtest/lib2506.c&nbsp;&nbsp;&nbsp; |&nbsp; 71 +++++++++++++++=
++++++++++<br>
&gt; + 6 files changed, 198 insertions(+), 48 deletions(-)<br>
&gt; + create mode 100644 tests/data/test2506<br>
&gt; + create mode 100644 tests/libtest/lib2506.c<br>
&gt; +<br>
&gt; +diff --git a/lib/transfer.c b/lib/transfer.c<br>
&gt; +index a73462928d..0f5bd8ce59 100644<br>
&gt; +--- a/lib/transfer.c<br>
&gt; ++++ b/lib/transfer.c<br>
&gt; +@@ -865,49 +865,62 @@ CURLcode Curl_follow(struct Curl_easy *data,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if(uc)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Curl_uc_to_curlcode(uc);<=
br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; /* Clear auth if this redirects to a different po=
rt number or protocol,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unless permitted */<br>
&gt; +-&nbsp;&nbsp;&nbsp; if(!data-&gt;set.allow_auth_to_other_hosts &amp;&=
amp; (type !=3D FOLLOW_FAKE)) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *portnum;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int port;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool clear =3D FALSE;<br>
&gt; +-<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(data-&gt;set.use_port &amp;&amp; d=
ata-&gt;state.allow_port)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* a custom port is used =
*/<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; port =3D (int)data-&gt;se=
t.use_port;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(data-=
&gt;state.uh, CURLUPART_PORT, &amp;portnum,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; CURLU_DEFAULT_PORT);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(uc) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newurl);=
<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Curl_u=
c_to_curlcode(uc);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; port =3D atoi(portnum);<b=
r>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(portnum);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(port !=3D data-&gt;info.conn_remot=
e_port) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; infof(data, &quot;Clear a=
uth, redirects to port from %u to %u&quot;,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data-&gt;info.conn_remote_port, port);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear =3D TRUE;<br>
&gt; ++&nbsp;&nbsp;&nbsp; {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool same_origin;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CURLU *u;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oldscheme =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oldhost =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oldport =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *newscheme =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *newhost =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *newport =3D NULL;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u =3D curl_url();<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!u) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newurl);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return CURLE_OUT_OF_MEMOR=
Y;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *scheme;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct Curl_handler=
 *p;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(data-=
&gt;state.uh, CURLUPART_SCHEME, &amp;scheme, 0);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(uc) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newurl);=
<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Curl_u=
c_to_curlcode(uc);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p =3D Curl_get_scheme_han=
dler(scheme);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(p &amp;&amp; (p-&gt;pr=
otocol !=3D data-&gt;info.conn_protocol)) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; infof(data, &=
quot;Clear auth, redirects scheme from %s to %s&quot;,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; data-&gt;info.conn_scheme, scheme);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear =3D TRU=
E;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(scheme);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_set(u, CURLUPART_URL,=
 data-&gt;state.url, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!uc)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(u, CU=
RLUPART_SCHEME, &amp;oldscheme, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!uc)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(u, CU=
RLUPART_HOST, &amp;oldhost, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!uc)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(u, CU=
RLUPART_PORT, &amp;oldport, CURLU_DEFAULT_PORT);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!uc)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(data-=
&gt;state.uh, CURLUPART_SCHEME, &amp;newscheme, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!uc)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(data-=
&gt;state.uh, CURLUPART_HOST, &amp;newhost, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!uc)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc =3D curl_url_get(data-=
&gt;state.uh, CURLUPART_PORT, &amp;newport,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; CURLU_DEFAULT_PORT);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(uc) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curl_url_cleanup(u);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(oldscheme);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(oldhost);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(oldport);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newscheme);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newhost);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newport);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newurl);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Curl_uc_to_curlcod=
e(uc);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(clear) {<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; same_origin =3D strcasecompare(oldsch=
eme, newscheme) &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcasecompare(oldhost, newh=
ost) &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !strcmp(oldport, newport);<b=
r>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curl_url_cleanup(u);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(oldscheme);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(oldhost);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(oldport);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newscheme);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newhost);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newport);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if((!same_origin &amp;&amp; !data-&gt=
;set.allow_auth_to_other_hosts) ||<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !data-&gt;set.str[S=
TRING_USERNAME]) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D Curl_rese=
t_userpwd(data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(result) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(new=
url);<br>
&gt; +@@ -917,12 +930,12 @@ CURLcode Curl_follow(struct Curl_easy *data,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Curl_safefree(data-&=
gt;state.aptr.passwd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp; result =3D Curl_reset_proxypwd(data);<br>
&gt; +-&nbsp; if(result) {<br>
&gt; +-&nbsp;&nbsp;&nbsp; free(newurl);<br>
&gt; +-&nbsp;&nbsp;&nbsp; return result;<br>
&gt; ++&nbsp;&nbsp;&nbsp; result =3D Curl_reset_proxypwd(data);<br>
&gt; ++&nbsp;&nbsp;&nbsp; if(result) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(newurl);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return result;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; if(type =3D=3D FOLLOW_FAKE) {<br>
&gt; +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc<br>
&gt; +index aafd309a9d..f673f86384 100644<br>
&gt; +--- a/tests/data/Makefile.inc<br>
&gt; ++++ b/tests/data/Makefile.inc<br>
&gt; +@@ -251,7 +251,7 @@ test2300 test2301 test2302 test2303 test2304 test=
2305 test2306 test2307 \<br>
&gt; + \<br>
&gt; + test2400 test2401 test2402 test2403 test2404 \<br>
&gt; + \<br>
&gt; +-test2500 test2501 test2502 test2503 \<br>
&gt; ++test2500 test2501 test2502 test2503 test2506 \<br>
&gt; + \<br>
&gt; + test2600 test2601 test2602 test2603 \<br>
&gt; + \<br>
&gt; +diff --git a/tests/data/test2506 b/tests/data/test2506<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..9c65002496<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/data/test2506<br>
&gt; +@@ -0,0 +1,64 @@<br>
&gt; ++&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;US-ASCII&quot;?&=
gt;<br>
&gt; ++&lt;testcase&gt;<br>
&gt; ++&lt;info&gt;<br>
&gt; ++&lt;keywords&gt;<br>
&gt; ++HTTP<br>
&gt; ++cookies<br>
&gt; ++&lt;/keywords&gt;<br>
&gt; ++&lt;/info&gt;<br>
&gt; ++<br>
&gt; ++&lt;reply&gt;<br>
&gt; ++&lt;data crlf=3D&quot;headers&quot; nocheck=3D&quot;yes&quot;&gt;<br=
>
&gt; ++HTTP/1.1 301 redirect<br>
&gt; ++Date: Tue, 09 Nov 2010 14:49:00 GMT<br>
&gt; ++Content-Length: 3<br>
&gt; ++Location: <a href=3D"http://numbertwo.example/%TESTNUMBER0002" id=3D=
"OWA6e8a7aad-b16f-9809-a410-2cda245154c7" class=3D"OWAAutoLink" data-auth=
=3D"NotApplicable">
http://numbertwo.example/%TESTNUMBER0002</a><br>
&gt; ++<br>
&gt; ++ok<br>
&gt; ++&lt;/data&gt;<br>
&gt; ++&lt;data2 crlf=3D&quot;headers&quot; nocheck=3D&quot;yes&quot;&gt;<b=
r>
&gt; ++HTTP/1.1 200 OK<br>
&gt; ++Date: Tue, 09 Nov 2010 14:49:00 GMT<br>
&gt; ++Content-Length: 4<br>
&gt; ++<br>
&gt; ++yes<br>
&gt; ++&lt;/data2&gt;<br>
&gt; ++&lt;/reply&gt;<br>
&gt; ++<br>
&gt; ++&lt;client&gt;<br>
&gt; ++&lt;server&gt;<br>
&gt; ++http<br>
&gt; ++&lt;/server&gt;<br>
&gt; ++&lt;features&gt;<br>
&gt; ++proxy<br>
&gt; ++&lt;/features&gt;<br>
&gt; ++&lt;tool&gt;<br>
&gt; ++lib%TESTNUMBER<br>
&gt; ++&lt;/tool&gt;<br>
&gt; ++&lt;name&gt;<br>
&gt; ++netrc with redirect using proxy<br>
&gt; ++&lt;/name&gt;<br>
&gt; ++&lt;file name=3D&quot;%LOGDIR/netrc2506&quot;&gt;<br>
&gt; ++machine site.example login batman password robin<br>
&gt; ++&lt;/file&gt;<br>
&gt; ++&lt;command&gt;<br>
&gt; ++http://%HOSTIP:%HTTPPORT <a href=3D"http://site.example/" id=3D"OWA9=
2174a84-3c04-f248-dac0-6f99968dbd02" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
http://site.example/</a> %LOGDIR/netrc2506<br>
&gt; ++&lt;/command&gt;<br>
&gt; ++&lt;/client&gt;<br>
&gt; ++<br>
&gt; ++&lt;verify&gt;<br>
&gt; ++&lt;protocol crlf=3D&quot;headers&quot;&gt;<br>
&gt; ++GET <a href=3D"http://site.example/" id=3D"OWA3d3eaaa4-111f-c830-9f2=
3-9678a93ff369" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
http://site.example/</a> HTTP/1.1<br>
&gt; ++Host: site.example<br>
&gt; ++Authorization: Basic %b64[batman:robin]b64%<br>
&gt; ++Accept: */*<br>
&gt; ++Proxy-Connection: Keep-Alive<br>
&gt; ++<br>
&gt; ++GET <a href=3D"http://numbertwo.example/25060002" id=3D"OWA8e0f7905-=
c5d8-cc72-b245-b921514676c6" class=3D"OWAAutoLink" data-auth=3D"NotApplicab=
le">
http://numbertwo.example/25060002</a> HTTP/1.1<br>
&gt; ++Host: numbertwo.example<br>
&gt; ++Accept: */*<br>
&gt; ++Proxy-Connection: Keep-Alive<br>
&gt; ++<br>
&gt; ++&lt;/protocol&gt;<br>
&gt; ++&lt;/verify&gt;<br>
&gt; ++&lt;/testcase&gt;<br>
&gt; +diff --git a/tests/data/test998 b/tests/data/test998<br>
&gt; +index 0969d4704b..17c0a0e150 100644<br>
&gt; +--- a/tests/data/test998<br>
&gt; ++++ b/tests/data/test998<br>
&gt; +@@ -82,7 +82,6 @@ Proxy-Connection: Keep-Alive<br>
&gt; +<br>
&gt; +&nbsp; GET <a href=3D"http://somewhere.else.example/a/path/9980002" i=
d=3D"OWAddbbda77-4db0-b3ef-e195-dc7ed18aeb59" class=3D"OWAAutoLink" data-au=
th=3D"NotApplicable">
http://somewhere.else.example/a/path/9980002</a> HTTP/1.1<br>
&gt; +&nbsp; Host: somewhere.else.example<br>
&gt; +- Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D<br>
&gt; +&nbsp; User-Agent: curl/%VERSION<br>
&gt; +&nbsp; Accept: */*<br>
&gt; +&nbsp; Proxy-Connection: Keep-Alive<br>
&gt; +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc<=
br>
&gt; +index 9f7cec6027..9d3356aaf5 100644<br>
&gt; +--- a/tests/libtest/Makefile.inc<br>
&gt; ++++ b/tests/libtest/Makefile.inc<br>
&gt; +@@ -75,7 +75,7 @@ noinst_PROGRAMS =3D chkhostname libauthretry libntl=
mconnect libprereq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp; lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \<br>
&gt; +&nbsp; lib2301 lib2302 lib2304 lib2305 lib2306 \<br>
&gt; +&nbsp; lib2402 lib2404 \<br>
&gt; +- lib2502 \<br>
&gt; ++ lib2502 lib2506 \<br>
&gt; +&nbsp; lib3010 lib3025 lib3026 lib3027 \<br>
&gt; +&nbsp; lib3100 lib3101 lib3102 lib3103<br>
&gt; +<br>
&gt; +@@ -684,6 +684,9 @@ lib2404_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; + lib2502_SOURCES =3D lib2502.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS=
)<br>
&gt; + lib2502_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; +<br>
&gt; ++lib2506_SOURCES =3D lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS=
)<br>
&gt; ++lib2506_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; ++<br>
&gt; + lib3010_SOURCES =3D lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS=
)<br>
&gt; + lib3010_LDADD =3D $(TESTUTIL_LIBS)<br>
&gt; +<br>
&gt; +diff --git a/tests/libtest/lib2506.c b/tests/libtest/lib2506.c<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..e6dde18507<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/libtest/lib2506.c<br>
&gt; +@@ -0,0 +1,71 @@<br>
&gt; ++/*******************************************************************=
********<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _&nbsp;&nbsp; _ _=
___&nbsp; _<br>
&gt; ++ *&nbsp; Project&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ___| |=
 | |&nbsp; _ \| |<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; / __| | | | |_) | |<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | (__| |_| |&nbsp; _ &lt;| |___<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \___|\___/|_| \_\_____|<br>
&gt; ++ *<br>
&gt; ++ * Copyright (C) Linus Nielsen Feltzing &lt;linus@haxx.se&gt;<br>
&gt; ++ *<br>
&gt; ++ * This software is licensed as described in the file COPYING, which=
<br>
&gt; ++ * you should have received as part of this distribution. The terms<=
br>
&gt; ++ * are also available at <a href=3D"https://curl.se/docs/copyright.h=
tml" id=3D"OWA6b0700c1-53e7-f697-974a-02d7fea230c9" class=3D"OWAAutoLink" d=
ata-auth=3D"NotApplicable">
https://curl.se/docs/copyright.html</a>.<br>
&gt; ++ *<br>
&gt; ++ * You may opt to use, copy, modify, merge, publish, distribute and/=
or sell<br>
&gt; ++ * copies of the Software, and permit persons to whom the Software i=
s<br>
&gt; ++ * furnished to do so, under the terms of the COPYING file.<br>
&gt; ++ *<br>
&gt; ++ * This software is distributed on an &quot;AS IS&quot; basis, WITHO=
UT WARRANTY OF ANY<br>
&gt; ++ * KIND, either express or implied.<br>
&gt; ++ *<br>
&gt; ++ * SPDX-License-Identifier: curl<br>
&gt; ++ *<br>
&gt; ++ *******************************************************************=
********/<br>
&gt; ++#include &quot;test.h&quot;<br>
&gt; ++<br>
&gt; ++#include &quot;testtrace.h&quot;<br>
&gt; ++<br>
&gt; ++static size_t sink2506(char *ptr, size_t size, size_t nmemb, void *u=
d)<br>
&gt; ++{<br>
&gt; ++&nbsp; (void)ptr;<br>
&gt; ++&nbsp; (void)ud;<br>
&gt; ++&nbsp; return size * nmemb;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int test(char *URL)<br>
&gt; ++{<br>
&gt; ++&nbsp; CURL *curl;<br>
&gt; ++&nbsp; int res =3D CURLE_OUT_OF_MEMORY;<br>
&gt; ++<br>
&gt; ++&nbsp; if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mfprintf(stderr, &quot;curl_global_init() fa=
iled\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; return TEST_ERR_MAJOR_BAD;<br>
&gt; ++&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp; curl =3D curl_easy_init();<br>
&gt; ++&nbsp; if(!curl) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mfprintf(stderr, &quot;curl_easy_init() fail=
ed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_global_cleanup();<br>
&gt; ++&nbsp;&nbsp;&nbsp; return TEST_ERR_MAJOR_BAD;<br>
&gt; ++&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2506);<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_PROXY, URL);<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_URL, libtest_arg2);<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_NETRC, CURL_NETRC_OPTIONAL);<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_NETRC_FILE, libtest_arg3);<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_VERBOSE, 1L);<br>
&gt; ++<br>
&gt; ++&nbsp; /* CURLOPT_UNRESTRICTED_AUTH should not make a difference bec=
ause the<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; credentials come from netrc */<br>
&gt; ++&nbsp; test_setopt(curl, CURLOPT_UNRESTRICTED_AUTH, 1L);<br>
&gt; ++<br>
&gt; ++&nbsp; res =3D curl_easy_perform(curl);<br>
&gt; ++<br>
&gt; ++test_cleanup:<br>
&gt; ++&nbsp; curl_easy_cleanup(curl);<br>
&gt; ++&nbsp; curl_global_cleanup();<br>
&gt; ++<br>
&gt; ++&nbsp; return res;<br>
&gt; ++}<br>
&gt; diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-su=
pport/curl/curl_8.7.1.bb<br>
&gt; index 2b988654c41..8e39d821626 100644<br>
&gt; --- a/meta/recipes-support/curl/curl_8.7.1.bb<br>
&gt; +++ b/meta/recipes-support/curl/curl_8.7.1.bb<br>
&gt; @@ -40,6 +40,7 @@ SRC_URI =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-6276.patch" i=
d=3D"OWA95387305-9f69-42d9-57df-cfd19dfa9e20" class=3D"OWAAutoLink" data-au=
th=3D"NotApplicable">
file://CVE-2026-6276.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-5545.patch" i=
d=3D"OWA97acf776-bc2d-63e0-4987-45f963d80b09" class=3D"OWAAutoLink" data-au=
th=3D"NotApplicable">
file://CVE-2026-5545.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-6253.patch" i=
d=3D"OWA4bc64d52-3310-0ccb-44f3-a45a13db2bfd" class=3D"OWAAutoLink" data-au=
th=3D"NotApplicable">
file://CVE-2026-6253.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-6429.patch" id=3D"OWAed=
829d1c-1735-0ee4-2dac-c1ca2aa5f2e7" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">
file://CVE-2026-6429.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; SRC_URI:append:class-nativesdk =3D &quot; \<br>
<br>
I'll have to drop this patch because it is triggering a warning in the<br>
autobuilder's ptest jobs qemuarm64-ptest[1] and qemux86-64-ptest[2].<br>
<br>
It causes curl ptests 1159 &amp; 1543 to fail :<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `FAIL: 1159 - HTTP Location: and=
 'redirect_url' with non-supported scheme`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `FAIL: 1543 - CURLOPT_CURLU, URL=
 with space and CURLINFO_EFFECTIVE_URL`<br>
<br>
I'll drop the next patch of the series too (curl: fix CVE-2026-7168),<br>
because it not applied anymore without this one.<br>
<br>
[1] <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/=
builds/4320" id=3D"OWAbcbf4c2e-af82-47e6-9721-6c66a0bcd663" class=3D"OWAAut=
oLink" data-auth=3D"NotApplicable">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4320</a>=
<br>
[2] <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/=
builds/4336" id=3D"OWAd4794306-9bc0-6178-68c3-fcfd34d1761c" class=3D"OWAAut=
oLink" data-auth=3D"NotApplicable">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4336</a>=
<br>
<br>
--<br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_CY5PR11MB61876665C18874BC2839A3F2C4A02CY5PR11MB6187namp_--

