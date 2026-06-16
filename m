Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08129CD8CA8
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 06:16:51 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147894.1781590600776321049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HCw70PGf;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22266; q=dns/txt;
  s=iport01; t=1781590600; x=1782800200;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=vspEJzUIFPhKBHOLl1euckRwXVP93BopbOBAOojiX3w=;
  b=HCw70PGfH4vVIincJKkge+yQMR1R3GlZiahdA6I82uClD88W0JpfrElp
   qWaOmrFlWxqWZAkpNJAXWOMvJqI5HCQ6HIa4XMhGpE8keQEEPnGZy4+ff
   wjHiUWIS1TlEy5+NFGr7yBm0adZC5H63sTTFVdgNA008L1ZwhZU8gz646
   Sam10aR3FkPsMvQ8kgK6LIEkCj4EUs03R49hcGpvoofqf1hxm5Bz3HF2I
   lx1xphwYTgJAWxCDHmTP4K98ky5J8xjLIRbvo+LNxGsGhWuAdU4dp4qkr
   Cs9ImEo+rnOcnB5fD04V2+4sGS5ppzQN9QYI/6cZpe6JNpKYgC3neCoZf
   g==;
X-CSE-ConnectionGUID: xiBusQ7SQfegtgkmLuWYJA==
X-CSE-MsgGUID: XvsWnMr5Tcy9wVq6SnteQw==
X-IPAS-Result: =?us-ascii?q?A0B3AwA46TBq/5QQJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UkDAYgfA4UsiHkDgROdCBSBag8BAQENAi4BFQ0EAQGEQEYCjT8CJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDAREVJAEtE?=
 =?us-ascii?q?AIBCBEDAQEBAScHJwoUCQgCBAENBQgagmGCHRZAAwECDqZCAYE9AolZGjd4g?=
 =?us-ascii?q?QEzgQGDKAExAwsCQ9wIFAEFgTOFP4MbAQEqgTWCXYEhGAFEhDgnGxuBcoEVQ?=
 =?us-ascii?q?nmBODg+gQWBXAIDgTQQGx4WCINXgjAEgiJ6EhuBPx6CJCaBY4puUnIiAyYzL?=
 =?us-ascii?q?AFVExcLBwWBIxAzAyovLSNLBS0dcAwnEg8dFxYeWBsHBRIgKkJFIwMCFjNZQ?=
 =?us-ascii?q?jgLQwWBXQKCGk4jHwM5f4FvgSVnZhUwNYEBAREfCjoDC209NwYOGwMEgTUFi?=
 =?us-ascii?q?34HVhcPgXgzEgFjKgEKISItCysTCIEADBGTaQKPEoF8oXsKKIN1jCGNPogyF?=
 =?us-ascii?q?4QEgVeSQJJRC5h9I41nlWiFJQIEAgQFAhABAQaBaDyBWXAVO4JnCQpAGQ+OK?=
 =?us-ascii?q?hkcg0SFE8MLeQIBAQcDMAEHAgcPAoFzkACBfQEB?=
IronPort-PHdr: A9a23:NKGuBRAWdLk985GPWOKgUyQVXRdPi9zP1kY9454jjfdJaqu8us6kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:0S5mnq77pBETI4KqsUfSogxRtGDGchMFZxGqfqrLsTDasY5as4F+v
 mMbCmuCb6yJNGv3edElPIu2o0kO75PdxoI1HlRq+CE1Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNtvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eLYwy5/1OXlp3+
 /EXND8OazSeuNOU6efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP00n1lQ/UPrSmM+hin75fDRCpXqepLE85C7YywkZPL3Fb4SPI4PaGpoJ9qqej
 lLY5Fv/JwtHCNeOmCW76yyXgPPCpDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWUHmJWeSGmW8fGfqjbaBMTfBTZqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:ot8GPaunij2iIF4L0irvTwMs7skCQIAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tKLzOWyVdATbsSrLcKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKzfoSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAZIUE5nHPiTNz0uZcSGjdvNk57tfB4BADAayCTmt1mVwY+/OSK1mjMFXR1y4ZpKyw
 X4uj28yrSosvm9xBOZ7GnO8pRQluLmz9tIFOaMhsIWJjiEsHfqWG1mYdK/lQFwhNvqxEchkd
 HKrRtlFd908Wntcma8pgao8xX80R41gkWSjGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+ZjZxKFhnN9R6No+QgFisa0XZck0BSyNL7vEYvCbf2r4Uh9rD3yXklVqvo2hiKsrzPXt
 MeUf00r8wmAm9yJ0qpy1VH8ZiJUnMvHhGAWCE5y7yoOn5t7TJE5npd4tADlXEd8594YZxF6+
 PYdplMrth1P5MrhWYXPpZefSNxYVa9Hi4lPA+pUCDaPbBCNHTXp5Ht5rIpoOmsZZwT1ZM33I
 /MSVVCqAcJCg7T4OC1rdd2Gyr2MSiAdCWoztsb64lyu7X6SrauOSqfSEo2m8/lp/kEGMXUV/
 u6JZoTWpbYXCXTMJcM2xe7V4hZKHEYXsFQstEnW0iWqsaOLoHxrOTUfPvaObKoGzc5XWH0BG
 cFQVHIVYp9x1HuXmW9jAnaWnvrdEC69ZVsELLC9+xW04QJPp0kiHlftb143LDCFdRviN1+QK
 IlGsKRrkqSnxjBwVr1
X-Talos-CUID: 9a23:drLLfW0R3eLiRX9zvY4+WbxfCsEPb2bkk0zpLUK3FWlqTZmIdm6y0fYx
X-Talos-MUID: 9a23:y9hRkwp+FGKDRavvS8IezwF8L/huxr7zNEscwIo4ope/MzB9AijI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jun 2026 06:16:39 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 77C4B180001F6
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:16:39 +0000 (GMT)
X-CSE-ConnectionGUID: 1QqwdvYPTe+cU8VLXjXk0g==
X-CSE-MsgGUID: +HmgO8OmQa6JRs77xv1Sgw==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.24,207,1774310400"; 
   d="scan'208,217";a="53164662"
Received: from mail-eastusazon11011044.outbound.protection.outlook.com (HELO BL2PR02CU003.outbound.protection.outlook.com) ([52.101.52.44])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jun 2026 06:16:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A95gqNULJrg/jd1bhWahLfMaP9yntoksr1Rf9zpHxCDMb0TBSsmhPXCq9Oott6unVW/rqCqDSMtTek+b+It9nnJwjgzcIIfdc9CMZkv+cejQyluEJrN6+He7aJKM3g3nQyMAJPtJD8D0Zrt0fYTCOYz3q3ksP3ylLSjsFTAdbtdOxQFbCxTFi8D6J08MyTVbhNmgo3QozYBRHRV8e3nH/+upCsAHbjrfdcaKGepBAfnSxMNk4sa9HGSLXNF/yd6569PtKvT8meBktFrDstLLcXWeNESah7ZXCbsOWQssqwcmhowjB1Bbo8PcRmD3dfImH3CTYQkUqE9N7Alnk3uSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vspEJzUIFPhKBHOLl1euckRwXVP93BopbOBAOojiX3w=;
 b=XjxlRO0aqz+SrUC9KD0PGvB43WS6K/KPD7rlrN9r61ng8F2mxoaJ2QInqW0zAPgh3ySV5UQTfZVNADyOnCILh0h0xoCbQz1jNSJMI4c8i6zoB334GMmxtvQngQ+CSDMzkpytuvXfXr4YHP0gAvQIkBGlPT5HXK0dyLt1LfPH3Sr7Jt2KHMxFWXgseuLojLMoCw1W0NS9NoXKJBlOEBOoY5HpmL5NTyHCKBg3G0FtffBPg4Rzg5Bc5W/aVFiV0CyR5JO5Be4CQcWqiI5wAOy3vl7ArR+wL4xvu+SsUffOy03cXFc59okls7bRBD80wAtjFMc0GE8hqmEzC+V3MbpVHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:16:36 +0000
Received: from LV3PR11MB8507.namprd11.prod.outlook.com
 ([fe80::947a:2130:8660:e048]) by LV3PR11MB8507.namprd11.prod.outlook.com
 ([fe80::947a:2130:8660:e048%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 06:16:36 +0000
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<adongare@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [master] [PATCH v2] libusb1: fix CVE-2026-23679 and
 CVE-2026-47104
Thread-Topic: [OE-core] [master] [PATCH v2] libusb1: fix CVE-2026-23679 and
 CVE-2026-47104
Thread-Index: AQHc/LdPMET2EsEkokSpCf/tqaL7YbY/gx0AgAEyU6E=
Date: Tue, 16 Jun 2026 06:16:36 +0000
Message-ID: 
 <LV3PR11MB8507C38DEB7FF4F5793B431DD5E52@LV3PR11MB8507.namprd11.prod.outlook.com>
References: <20260612123823.1236106-1-adongare@cisco.com>
 <20260615110825.230591-1-adongare@cisco.com>
 <DJ9LSVX9666D.1V4UR5LDDBT8O@smile.fr>
In-Reply-To: <DJ9LSVX9666D.1V4UR5LDDBT8O@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: yoann.congal@smile.fr
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8507:EE_|SA2PR11MB5066:EE_
x-ms-office365-filtering-correlation-id: 7957d4f4-f52f-40df-5138-08decb6ed1e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|8096899003|13003099007|38070700021|5133699003|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info: 
 zgdKDR14E8/TklMTYUirAdr8y3boD/qf0p+BO+MaNXo2tWYSuK4VvBzE2+K4iVOfEn5Gg3jUvBcB+Gt3L87UXQiTIBpOx8tRyUagdWssiyaB+fl9z0LYcbv+MZWmoHPB+xsHCuY6SDelvvHPLC3KIsndBulhiIOjtyRWgH99/luI9vO9RO5/Pzdp8ry5n6gKxJcR0+istHD3AIVtJ06qAz5xwgcIJf3WXn77pJZXX/L0Up/nz0L9THGN3R+xT8rAKfoxCU6POVNa4MeRGb7YmiNMVzN+ZLv3Q5+OKEufihIKfxFe/heeuBvrtqNqIiL60sb3spZWrvu5A1snZ9d/qnJGOZXS613R7zns/jXi0nBx4lTjcnkSsuHK6gNvixx8+xp4qowxARSNMnjg7wRHxoIAuQu0Hr1DtyKQVXQ2yTEqe0JiWEbRRoj1K+NgVq7W0HFlfJmDgqVaIKUJ05r+zJBqhFLNIcI/uOjGY8y05PTE7Da34f0wq+mLJi296VdnwstJrSKWK44DuNUcn6Y5CBvpuah2TFN/zg3qVwWrawYugyXSV+HRi+6OwiIGr6tpWWRssJNOvI7p1G7HXbrcU9YgxIaNo9ZejHOkSOx4jJFnYhjYZ7J9JtD3PQm7+Rnv/eMhTOnJ4Kg7y7pfQeH6D8lfulyuqZDRJh7IHZpbCDlnsFy5Vm1jIre4uSqLLSzA54TlKCzgLZovmYSGsVpg4CORb4hUwIxWYXE/CT6Nd2vlMZzPVgUKA3i712md4GST
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8507.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(8096899003)(13003099007)(38070700021)(5133699003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Hb0xJtQ5gwu3xeZUKzA8Gx/zCj3NBpdPhKf3WGTlpMxjUThZlQlugwsmUW?=
 =?iso-8859-1?Q?JeZcYlr6RhCejtr8hVKeQ4BlQbe2+wKtR5M/D81CCQxP+7U2yAZQ8sLaII?=
 =?iso-8859-1?Q?qt7DIwgLEsMESBMmBLA0GdsUl6KJMkXs/hDRO8w+e78tihusTvTrwD4uMN?=
 =?iso-8859-1?Q?1w+ggp7j31kQAL5Z2TQ6vJ4JFHudvfMDg2zr02VBnMZiPS+GZ7JPY/sk+U?=
 =?iso-8859-1?Q?+tVhAsrVkFCeie1d8gKTSJnx36nL6Qb4VnT8bwkieQ34xkXmrlkIsO6VkB?=
 =?iso-8859-1?Q?be7olUd3ItO5aTZMxRK/nzBunJjte60HMi5uZWzZennIwZSBJXVDnxWdUH?=
 =?iso-8859-1?Q?v8psW4qZXvAgz+w8V7spMw457yGfM8WY7OOwJwfoLbCqxn2Luac00kDGCk?=
 =?iso-8859-1?Q?NfcF3OPUcpJhuuPXuc9o+wumaPVqi/RoFecYfArKatpJqUqGwbz0jqc3BF?=
 =?iso-8859-1?Q?8wI/wYRleqgl3pRABbC11y2yPg/UNykGZ7AuF69um4CAzT1mnH+asgKcg9?=
 =?iso-8859-1?Q?ztOTR1njCfNhus7hpgy42bNvAUZv4p/eReEjY9jM6yVeu1qnKB/t70uVHK?=
 =?iso-8859-1?Q?zTLUzHhB3l1bPl5Zsdj3tC6xg4YSBg1fL+61LDQGPHbyYUKCi3R3m7+T/U?=
 =?iso-8859-1?Q?0LYdNRUE9BbMI7bZgVsFTTFhCnEYUPT4g9m8bXcQctHfqD8AUcmLyMPhui?=
 =?iso-8859-1?Q?lHzJg3687BLCZLEMQxn0KeNvgKRQHexoiVYLzUPOvYfy0ffph2AlsedExw?=
 =?iso-8859-1?Q?8nJI16OGbOBcBnTElPcJgVp2QL+Xa4G5NYlun2LEstiRa2XunOi6Sk0otb?=
 =?iso-8859-1?Q?4IYJEeOQmQ7MpfK18uyykXkgV1Q4GlXX1W2qEE0G4qoVIDH7hKPXBv4fDN?=
 =?iso-8859-1?Q?WNSbrSAGTYA1aMY3HPxtEkDTOcRLZ5zUOC5m2oqlDjCjkvBUMWgBIEAsaX?=
 =?iso-8859-1?Q?LV8kDO9oixSjlyZoqvOCDlSpQpc6klGRRi1sDxzd3bYf8CfSMP/IL/KPQ/?=
 =?iso-8859-1?Q?luBxWQmd4MLKAN3geTlNKWxxO0PwvEHMxvqMKjFTsJ5ULAxAm95W94yb9x?=
 =?iso-8859-1?Q?CaoTQnTFwoyBzMkzIBTVhPJGVnv50J0NsQdY1LpeAFvwcsQf2F7oVWqLby?=
 =?iso-8859-1?Q?P1dt83RqWv3vMI35ftYTkwS90IpU5TcSekhRn1JKY7e3eQE9albnQN63q9?=
 =?iso-8859-1?Q?8uhOACMA0/k37kayqFYCjqtMKOZGaF4+sIV3xxizz9q2p9JPHA+l6yoz3F?=
 =?iso-8859-1?Q?+5Qij4zgGrEpATNQJaotCMy77WTyRWMf0+a2PGXdtqkO03CJqmpGwEzhlF?=
 =?iso-8859-1?Q?7CvMmEzeSJWrNNb18o9qFbUlVgFYwS2Zx7pEhbpAUlfITU81UnCPEtmo9V?=
 =?iso-8859-1?Q?x5JillfgF5nHXgv81xEZpxgE1Jlupk2LUFv3Qni6yx0zby2Ns3azbfAhwE?=
 =?iso-8859-1?Q?MYAsbqIVpNu9lbhfAWZgYN50Hre29voaTtHzR/dRrZ10hhj5RzOLVeB4RX?=
 =?iso-8859-1?Q?fM6y2BLhZ5mT2dOhAf/BD41OJXX2XFASXD819PaxUYnNLFISrCnCcW9nPW?=
 =?iso-8859-1?Q?vVv01PP1KtCvU41DTuo6DpfpBrsHbzEbp6AWBtgV9Y7ASfSRfI3djBcmC6?=
 =?iso-8859-1?Q?C/noxJKu1Di84ydZFLFw6QepgDh8l3ti06XRJkXTKAswOvNjy0cp+BwWfv?=
 =?iso-8859-1?Q?FEodSYxwGM9SmudNIa7xa0XfNY6fP/+UBju8833JtDc74EgmxFls9IOTaR?=
 =?iso-8859-1?Q?IpnSWmciTx9figUdLQr1I8DZRfGEIOzitN4qvwt6WX6sVn?=
Content-Type: multipart/alternative;
	boundary="_000_LV3PR11MB8507C38DEB7FF4F5793B431DD5E52LV3PR11MB8507namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	bZpuy1GVyDT15W/MqhCq8akKICwYu8pNnoyzmv315TPnixUJwjxXzInMDPwa0mwA3LfUybfP1KoiFHNMTx1LFzex5BPJx8w8lqJ4X0QXpWDrP0qR1JjCDJV3XdzwLnMUo5eC7ERq2pL/yw/pxu3NefmTi2BkePvt1RuEP+6SepfFEuhicREDp/gJZWvJNZ9SKE1x6VznCOKjGXrfnXs4M7haCN1nYruWUb19anbVccwYgKGWmsG8NVk5HTqwZ1AJaySh+5xzqNmUJz1i/YNMxkQtNO7s6F04xcm6HXqUtxkBYtMfJjC/m9ShqcJvaemM7Z+jeKtmbIhT6Pulwt23Hg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8507.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7957d4f4-f52f-40df-5138-08decb6ed1e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 06:16:36.1606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hTtIxuf/aSXknJs3F787y3ZjvqfkuhaHMkuv7Sq+sbC0PLKZZkTot6DSo2lby2LHYr66BZ1nO1sWFSqCNmSnKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238867

--_000_LV3PR11MB8507C38DEB7FF4F5793B431DD5E52LV3PR11MB8507namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi @Yoann Congal<mailto:yoann.congal@smile.fr>,
Thanks for the clarification. I understand that the fix is available in v1.=
0.30 and will be covered by the planned upgrade, so this backport is not ne=
eded for OE-Core master.
Thanks for reviewing it and for checking the stable branch backports.
Regards,
Anil Dongare
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, June 15, 2026 4:58 AM
To: Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) <adon=
gare@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-cor=
e@lists.openembedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; to@cisco.=
com <to@cisco.com>
Subject: Re: [OE-core] [master] [PATCH v2] libusb1: fix CVE-2026-23679 and =
CVE-2026-47104

On Mon Jun 15, 2026 at 1:08 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> - Pick the upstream patch [1] as mentioned in [2] and [3].
>   included in v1.0.28.

That patch in included in v1.0.30, not 1.0.28 (OE-core master is
currently at v1.0.29).

Also, this backport will be superseded by the v1.0.30 upgrade in:
https://lore.kernel.org/all/20260614080307.4017177-21-richard.purdie@linuxf=
oundation.org/

(I'll take a look at the backport for stable branches though)

Regards,


> [1] https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a=
97a7f185231
> [2] https://security-tracker.debian.org/tracker/CVE-2026-23679.
> [3] https://security-tracker.debian.org/tracker/CVE-2026-47104.
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../CVE-2026-23679_CVE-2026-47104.patch       | 89 +++++++++++++++++++
>  meta/recipes-support/libusb/libusb1_1.0.29.bb |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CV=
E-2026-47104.patch
>
> diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-=
47104.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-4=
7104.patch
> new file mode 100644
> index 0000000000..f15f089f9f
> --- /dev/null
> +++ b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.p=
atch
> @@ -0,0 +1,89 @@
> +From 04a9508e07582f553e9ea767f9e4a9b93839914b Mon Sep 17 00:00:00 2001
> +From: MarkLee131 <kaixuan.li@ntu.edu.sg>
> +Date: Sat, 25 Apr 2026 18:33:17 +0800
> +Subject: [PATCH] descriptor: Fix two memory-safety bugs in malformed con=
fig
> + descriptor handling
> +
> +Two issues reachable from a malformed config descriptor returned by an
> +attached USB device, both surfaced by the same libFuzzer + ASan run.
> +
> +1) parse_interface() reads bNumEndpoints from the interface descriptor a=
nd
> +   increments usb_interface->num_altsetting before entering the inner lo=
op
> +   that skips class/vendor specific descriptors ahead of the endpoint
> +   array. If that loop's bLength > size short-read branch fires, the
> +   function returns before the endpoint array is allocated, leaving the
> +   caller with bNumEndpoints > 0 and endpoint =3D=3D NULL. libusb.h docu=
ments
> +   endpoint as an array sized by bNumEndpoints, and the testlibusb and
> +   xusb examples both iterate it accordingly, so a NULL deref follows.
> +   Reset bNumEndpoints to 0 before returning so the invariant holds.
> +
> +2) The first-pass loop in parse_iad_array() compares header.bLength
> +   against the original size argument instead of the remaining bytes,
> +   so a single descriptor with bLength =3D=3D size - 1 lets consumed rea=
ch
> +   size - 1 and the next iteration enters with only one byte of buffer
> +   left. The buf[1] read on the second line of the loop body lands one
> +   byte past the malloc allocation that backs the descriptor data. The
> +   sibling parsers parse_configuration() and parse_interface() in the
> +   same file already use the remaining-bytes form. Switch the IAD parser
> +   loop guard and bound check to match.
> +
> +Both code paths are reachable from public APIs (libusb_get_*_config_desc=
riptor
> +and libusb_get_*_interface_association_descriptors), with the malformed
> +input supplied by the attached device. Minimal reproducers are 20 and
> +9 bytes respectively.
> +
> +Fixes #1813
> +
> +CVE: CVE-2026-23679 CVE-2026-47104
> +Upstream-Status: Backport [https://github.com/libusb/libusb/commit/bc088=
6173ea15b8cc9bba2918f58a97a7f185231]
> +
> +Backport Changes:
> +- The upstream version_nano.h bump is omitted because this is a security
> +  backport to libusb 1.0.29, not a version upgrade.
> +
> +Signed-off-by: MarkLee131 <kaixuan.li@ntu.edu.sg>
> +(cherry picked from commit bc0886173ea15b8cc9bba2918f58a97a7f185231)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + libusb/descriptor.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/libusb/descriptor.c b/libusb/descriptor.c
> +index 870883a..7d4f118 100644
> +--- a/libusb/descriptor.c
> ++++ b/libusb/descriptor.c
> +@@ -241,6 +241,10 @@ static int parse_interface(libusb_context *ctx,
> +                              usbi_warn(ctx,
> +                                        "short extra intf desc read %d/%=
u",
> +                                        size, header->bLength);
> ++                            /* Keep the invariant: bNumEndpoints > 0 im=
plies
> ++                             * endpoint !=3D NULL. The endpoint array i=
sn't
> ++                             * allocated yet on this early return. */
> ++                            ifp->bNumEndpoints =3D 0;
> +                              return parsed;
> +                      }
> +
> +@@ -1365,7 +1369,7 @@ static int parse_iad_array(struct libusb_context *=
ctx,
> +
> +      /* First pass: Iterate through desc list, count number of IADs */
> +      iad_array->length =3D 0;
> +-    while (consumed < size) {
> ++    while (size - consumed >=3D DESC_HEADER_LENGTH) {
> +              header.bLength =3D buf[0];
> +              header.bDescriptorType =3D buf[1];
> +              if (header.bLength < DESC_HEADER_LENGTH) {
> +@@ -1373,9 +1377,9 @@ static int parse_iad_array(struct libusb_context *=
ctx,
> +                               header.bLength);
> +                      return LIBUSB_ERROR_IO;
> +              }
> +-            else if (header.bLength > size) {
> ++            else if (header.bLength > size - consumed) {
> +                      usbi_warn(ctx, "short config descriptor read %d/%u=
",
> +-                                      size, header.bLength);
> ++                                      size - consumed, header.bLength);
> +                      return LIBUSB_ERROR_IO;
> +              }
> +              if (header.bDescriptorType =3D=3D LIBUSB_DT_INTERFACE_ASSO=
CIATION)
> +--
> +2.51.0
> +
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes=
-support/libusb/libusb1_1.0.29.bb
> index 856e32d1c6..d287ec171f 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
> @@ -14,6 +14,7 @@ BBCLASSEXTEND =3D "native nativesdk"
>
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
>             file://run-ptest \
> +           file://CVE-2026-23679_CVE-2026-47104.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/libusb/libusb/releases"


--
Yoann Congal
Smile ECS


--_000_LV3PR11MB8507C38DEB7FF4F5793B431DD5E52LV3PR11MB8507namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi <a href=3D"mailto:yoann.congal@smile.fr" id=3D"OWAAM513132" class=3D"tWK=
Ou mention ms-bgc-nlr ms-fcl-b">
@Yoann Congal</a>,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for the clarification. I understand that the fix is available in <b>=
v1.0.30</b>&nbsp;and will be covered by the planned upgrade, so this backpo=
rt is not needed for OE-Core master.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for reviewing it and for checking the stable branch backports.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,<br>
Anil Dongare<span style=3D"font-family: Calibri, Arial, Helvetica, sans-ser=
if;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b>&nbsp;Monday, June 15, 2026 4:58 AM<br>
<b>To:</b>&nbsp;Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at =
Cisco) &lt;adongare@cisco.com&gt;; openembedded-core@lists.openembedded.org=
 &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;xe-linux-external(mailer list) &lt;xe-linux-external@cisco.=
com&gt;; to@cisco.com &lt;to@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [master] [PATCH v2] libusb1: fix CVE-202=
6-23679 and CVE-2026-47104
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Mon Jun 15, 2026 at 1:08 PM CEST, Anil D=
ongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.opene=
mbedded.org wrote:<br>
&gt; From: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;<br>
&gt; - Pick the upstream patch [1] as mentioned in [2] and [3].<br>
&gt;&nbsp;&nbsp; included in v1.0.28.<br>
<br>
That patch in included in v1.0.30, not 1.0.28 (OE-core master is<br>
currently at v1.0.29).<br>
<br>
Also, this backport will be superseded by the v1.0.30 upgrade in:<br>
<a href=3D"https://lore.kernel.org/all/20260614080307.4017177-21-richard.pu=
rdie@linuxfoundation.org/" id=3D"OWA59e357d2-1dd0-5441-44b9-c8491a88eb72" c=
lass=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://lore.kernel.org/al=
l/20260614080307.4017177-21-richard.purdie@linuxfoundation.org/</a><br>
<br>
(I'll take a look at the backport for stable branches though)<br>
<br>
Regards,<br>
<br>
<br>
&gt; [1] <a href=3D"https://github.com/libusb/libusb/commit/bc0886173ea15b8=
cc9bba2918f58a97a7f185231" id=3D"OWA77c80b8e-6eee-7002-b3ad-90930b0105f0" c=
lass=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f1=
85231</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-23=
679" id=3D"OWAc94cc63a-f755-6ceb-cfef-7d48a862cd9a" class=3D"OWAAutoLink" d=
ata-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-23679</a>.<br>
&gt; [3] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-47=
104" id=3D"OWAe034419d-4532-2e28-cb0b-79ef29592710" class=3D"OWAAutoLink" d=
ata-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-47104</a>.<br>
&gt;<br>
&gt; Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../CVE-2026-23679_CVE-2026-47104.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 89 +++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/libusb/libusb1_1.0.29.bb |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 90 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-=
23679_CVE-2026-47104.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-20=
26-47104.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-202=
6-47104.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f15f089f9f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-4710=
4.patch<br>
&gt; @@ -0,0 +1,89 @@<br>
&gt; +From 04a9508e07582f553e9ea767f9e4a9b93839914b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: MarkLee131 &lt;kaixuan.li@ntu.edu.sg&gt;<br>
&gt; +Date: Sat, 25 Apr 2026 18:33:17 +0800<br>
&gt; +Subject: [PATCH] descriptor: Fix two memory-safety bugs in malformed =
config<br>
&gt; + descriptor handling<br>
&gt; +<br>
&gt; +Two issues reachable from a malformed config descriptor returned by a=
n<br>
&gt; +attached USB device, both surfaced by the same libFuzzer + ASan run.<=
br>
&gt; +<br>
&gt; +1) parse_interface() reads bNumEndpoints from the interface descripto=
r and<br>
&gt; +&nbsp;&nbsp; increments usb_interface-&gt;num_altsetting before enter=
ing the inner loop<br>
&gt; +&nbsp;&nbsp; that skips class/vendor specific descriptors ahead of th=
e endpoint<br>
&gt; +&nbsp;&nbsp; array. If that loop's bLength &gt; size short-read branc=
h fires, the<br>
&gt; +&nbsp;&nbsp; function returns before the endpoint array is allocated,=
 leaving the<br>
&gt; +&nbsp;&nbsp; caller with bNumEndpoints &gt; 0 and endpoint =3D=3D NUL=
L. libusb.h documents<br>
&gt; +&nbsp;&nbsp; endpoint as an array sized by bNumEndpoints, and the tes=
tlibusb and<br>
&gt; +&nbsp;&nbsp; xusb examples both iterate it accordingly, so a NULL der=
ef follows.<br>
&gt; +&nbsp;&nbsp; Reset bNumEndpoints to 0 before returning so the invaria=
nt holds.<br>
&gt; +<br>
&gt; +2) The first-pass loop in parse_iad_array() compares header.bLength<b=
r>
&gt; +&nbsp;&nbsp; against the original size argument instead of the remain=
ing bytes,<br>
&gt; +&nbsp;&nbsp; so a single descriptor with bLength =3D=3D size - 1 lets=
 consumed reach<br>
&gt; +&nbsp;&nbsp; size - 1 and the next iteration enters with only one byt=
e of buffer<br>
&gt; +&nbsp;&nbsp; left. The buf[1] read on the second line of the loop bod=
y lands one<br>
&gt; +&nbsp;&nbsp; byte past the malloc allocation that backs the descripto=
r data. The<br>
&gt; +&nbsp;&nbsp; sibling parsers parse_configuration() and parse_interfac=
e() in the<br>
&gt; +&nbsp;&nbsp; same file already use the remaining-bytes form. Switch t=
he IAD parser<br>
&gt; +&nbsp;&nbsp; loop guard and bound check to match.<br>
&gt; +<br>
&gt; +Both code paths are reachable from public APIs (libusb_get_*_config_d=
escriptor<br>
&gt; +and libusb_get_*_interface_association_descriptors), with the malform=
ed<br>
&gt; +input supplied by the attached device. Minimal reproducers are 20 and=
<br>
&gt; +9 bytes respectively.<br>
&gt; +<br>
&gt; +Fixes #1813<br>
&gt; +<br>
&gt; +CVE: CVE-2026-23679 CVE-2026-47104<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libusb/libus=
b/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231" id=3D"OWAbf9ca498-4697-c=
b0c-9d8a-ae3600f284df" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">ht=
tps://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185=
231</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- The upstream version_nano.h bump is omitted because this is a secur=
ity<br>
&gt; +&nbsp; backport to libusb 1.0.29, not a version upgrade.<br>
&gt; +<br>
&gt; +Signed-off-by: MarkLee131 &lt;kaixuan.li@ntu.edu.sg&gt;<br>
&gt; +(cherry picked from commit bc0886173ea15b8cc9bba2918f58a97a7f185231)<=
br>
&gt; +Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt; +---<br>
&gt; + libusb/descriptor.c | 10 +++++++---<br>
&gt; + 1 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libusb/descriptor.c b/libusb/descriptor.c<br>
&gt; +index 870883a..7d4f118 100644<br>
&gt; +--- a/libusb/descriptor.c<br>
&gt; ++++ b/libusb/descriptor.c<br>
&gt; +@@ -241,6 +241,10 @@ static int parse_interface(libusb_context *ctx,<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usbi_warn(ctx,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;short extra intf desc read %d/%u&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; size, header-&gt;bLength);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* Keep the invariant: bNumEndpoints &gt; 0 implies<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * endpoint !=3D NULL. The endpoint array isn't<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * allocated yet on this early return. */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ifp-&gt;bNumEndpoints =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return parsed;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +@@ -1365,7 +1369,7 @@ static int parse_iad_array(struct libusb_contex=
t *ctx,<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* First pass: Iterate through desc li=
st, count number of IADs */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iad_array-&gt;length =3D 0;<br>
&gt; +-&nbsp;&nbsp;&nbsp; while (consumed &lt; size) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; while (size - consumed &gt;=3D DESC_HEADER_LENGTH=
) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; header.bLength =3D buf[0];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; header.bDescriptorType =3D buf[1];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (header.bLength &lt; DESC_HEADER_LENGTH) {<br>
&gt; +@@ -1373,9 +1377,9 @@ static int parse_iad_array(struct libusb_contex=
t *ctx,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header.bLength);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBUSB_ERR=
OR_IO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
lse if (header.bLength &gt; size) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
lse if (header.bLength &gt; size - consumed) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usbi_warn(ctx, &q=
uot;short config descriptor read %d/%u&quot;,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; size, header.bLength);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; size - consumed, header.bLength);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBUSB_ERR=
OR_IO;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (header.bDescriptorType =3D=3D LIBUSB_DT_INTERFACE_ASSOCIATION=
)<br>
&gt; +--<br>
&gt; +2.51.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/reci=
pes-support/libusb/libusb1_1.0.29.bb<br>
&gt; index 856e32d1c6..d287ec171f 100644<br>
&gt; --- a/meta/recipes-support/libusb/libusb1_1.0.29.bb<br>
&gt; +++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb<br>
&gt; @@ -14,6 +14,7 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV=
}.tar.bz2 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://run-ptest&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://C=
VE-2026-23679_CVE-2026-47104.patch&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/libusb/l=
ibusb/releases" id=3D"OWA736878c5-bffb-d2b5-f3ff-06fabe0d6efc" class=3D"OWA=
AutoLink" data-auth=3D"NotApplicable">https://github.com/libusb/libusb/rele=
ases</a>&quot;<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_LV3PR11MB8507C38DEB7FF4F5793B431DD5E52LV3PR11MB8507namp_--

