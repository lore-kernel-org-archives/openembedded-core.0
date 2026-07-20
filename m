Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94BCC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:44:10 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2705.1784526249006389633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XFYGYVDQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10741; q=dns/txt;
  s=iport01; t=1784526249; x=1785735849;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=lxB5/guiouiyMwrzhl6DTT+Azyj+gOt4Hvbij6kHL9o=;
  b=XFYGYVDQRTJt0XoXcccVb5nRXT6mNdmKDj8hl/Uo9BHYnw1l0y6Lo4jD
   pfWcWpu2wQZRrFVGh0oId2N7cbl4u3heei3Eevipt9hRYkecGtCObWUoE
   iQvIgC0TIiPo0+wGAa28EKEbZVDKs+iFp5NtDHwKPFkw8nqh2JcTJs9gn
   G7UHsWeeNVYGfUqylWpI77pQAwewcsvHthjR7pTzbv3aTIXqTy9Fz91DH
   7/8vPFlrUWiIjJ/hcD5RVpTzTD6QiXGelYWjLLJ8qXV4sqI2rCQpsTdYF
   /uYjOz9ZVvsdmRAmC2pc9+rF1NSpHOul+n+y9mTDfYufnSjnr3zmPTnbr
   w==;
X-CSE-ConnectionGUID: 0I77XbnlQzW6OzFCUSFwqw==
X-CSE-MsgGUID: tMJ2sK2fQie1SqgtDklHGw==
X-IPAS-Result: =?us-ascii?q?A0B0AwAQtV1q/5X/Ja1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJAwGIHwOFK4h5A5dEhleBdAoPAQEBDgEuARsHBAEBhQUCjVMCJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQECAQERZxACA?=
 =?us-ascii?q?QgRBAEBAS4nCh0IAgQBDQUIGoJhgh0WGicDAQIOsDQBgT0Ciip4gTSBAYNaB?=
 =?us-ascii?q?QkCQ9wKFYE4hT+DARsBASpJbIJdgSIYARuEYScbG4FygVeCaT6BBYFcAQMBF?=
 =?us-ascii?q?4EdKzyDV4IwBIIiehIbg1qBYYwWUnIiAyYzLAFVExcLBwWBIxAzAyovLSNLB?=
 =?us-ascii?q?S0dcAwnEg8dFxYeWBsHBRIgKkFFIwNPPzgLQwWBVwKCCE4jHwM5f4EwdUp3L?=
 =?us-ascii?q?WkBAhAXSjgkg0sCBwMLbT03Bg4ZAwSBNQWMUAdbI4I/gQ8rTzGBLAYLon2OY?=
 =?us-ascii?q?JUXCiiDdYwhjT6IMheEBIFXiz2ZVJkII4I2izGVYIUuAgQCBAUCEAEBBoFoP?=
 =?us-ascii?q?IFZcBWDIgkKQBkPlzbJIXkCAQEHAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:EIqDHBI5bbG6o6KAUtmcuVQyDhhOgF28FhQe5pxijKpBbeH4uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:Ryjot6ApuDuHmxVW/3Liw5YqxClBgxIJ4kV8jS/XYbTApGtxgmRSy
 mYZDW7VbKmKYGWjctt1Poyy/BsEup/VzN82OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/g2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEm9QxU3E8O4kh6NkpJnNg3
 sEjBi8UcUXW7w626OrTpuhEnM8vKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY+BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEoiuO1boWNJLRmQ+1Ju2TCv
 UGc8V34D0ghLdOD5TmB0l2z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:kbWem6M+l/drusBcT8H255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHO1OkPgs1NaZLUbbUQSTXftfBOfZslnd8mjFh5FgPM
 RbAuZD4b/LfCVHZK/BiWHSfadDsby6GeKT9JvjJhxWPHhXgtRbnnxE43GgYzVLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRi+erAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 B2NiOixt9q5CH77WPADuvzJldXf42P0CMfeNso/jhiuE0lGedsRMIkjRho+dw7bVLHAcgcYZ
 pT5YfnlbZrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomJrdLQT9TpF+CTZ9U1wqa7UR/R/lp
 b5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZes60l/22tbKCY8OlaqXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/HBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKh+zi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHjZpY5ummmZ5rAQD2JwXsrKtmuwwE68vl4CrFx
X-Talos-CUID: 9a23:ywzt4G5lQ9sxuMzDbtssrG9LRfAvdHnk3kiOBF2WIltSZqKMVgrF
X-Talos-MUID: 9a23:LF6kAwQgov7fbpUXRXTwoRM4L+Qy7Z2vBRk2iJoal8qAFQNvbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 05:44:08 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id E73AA180001C1
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:44:07 +0000 (GMT)
X-CSE-ConnectionGUID: GQgeN54GRzatuuxUjjL+tA==
X-CSE-MsgGUID: vhdRoataQZi8uUJENZqtdw==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="74196256"
Received: from mail-westus3azon11011069.outbound.protection.outlook.com (HELO PH0PR06CU001.outbound.protection.outlook.com) ([40.107.208.69])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 05:44:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQjCjMLIg00MjJddFp5rNOTsa4BkNTDxVd37ic9FBNkjXbnhSPuib346TgDFpbBU4Rt9h1R0oVqXWDr0NovNcAB+SASrZS0z/KnteybYmJIMXBh/pV5FhmfguREUvCB2HQrN8nLFbQF6YGmkUswXgVIGn7cPVkD0Vi4xtQinTlinjnJT9qAaKUl7U24x4WPTaXedNhUgbMmtZ4OsysP1+/dq+XZuEX1btHW8i6iJTvnzO8pXf3X5DvytunPzU7n3726xjtgMBq9JtgoGGhGxHy0nfzH62On4hXoacShtSOILma9MPZaJGx3Y6WKl+C7BjHSEd0LeAJWt4svH0sTNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxB5/guiouiyMwrzhl6DTT+Azyj+gOt4Hvbij6kHL9o=;
 b=HRq3zrPQYCDCU/cHFuzScWYImAFiNUr76dgHpLE+SpyYi6Mg4xyBeTjpvL2RuzXxyCuFNI13OTzXPj3hl9otsH1OWFqYwrK6q/fvmMS9HUkWvqqazW5Q/Mqk+tQBsNRJlCnhGsL2z87WIdnNjrl+dTQEfSpVoOqbP1BOdij3lh+P7g7xsaxlIhJEmgV0SnKUDo1YLGJZ75paskusGFGPRVAOwBWyNTER5YdwhQnNLV846bVyNKJ9el7osDtsotbauK0Bn/xiof4/+u+x2wGb8R3ALVwCnj7kgR2gnx3WFht7Nd1MuO4KDb/sRdUeqx/nqM3oOAhALW+n1t0bOkTlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SN4PR11MB9943.namprd11.prod.outlook.com (2603:10b6:806:4ff::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.16; Mon, 20 Jul 2026 05:44:03 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 05:44:03 +0000
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
Thread-Index: 
 AQHc8cyWTSFqexjfWkW3t8A0nR8uKrY0xweAgCwi3YCAAnM9CoABgXwwgBBNrICAAQWEag==
Date: Mon, 20 Jul 2026 05:44:03 +0000
Message-ID: 
 <DM4PR11MB618916B350294519E31B1D82C4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260601134257.47867-1-adongare@cisco.com>
 <DJ3QY884Q2R3.3DTBWW97HDVD8@smile.fr> <DJRN1II8LYOQ.1UZ61N9NS4OI8@smile.fr>
 <DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2@DM4PR11MB6189.namprd11.prod.outlook.com>
 <DM4PR11MB61891DE87D41D71FEDE29E81C4FE2@DM4PR11MB6189.namprd11.prod.outlook.com>
 <DK2LU9CNKQC5.2LCBVE0IV9971@smile.fr>
In-Reply-To: <DK2LU9CNKQC5.2LCBVE0IV9971@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SN4PR11MB9943:EE_
x-ms-office365-filtering-correlation-id: b0fac8cb-0118-425e-50a9-08dee621e803
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|8096899003|13003099007|38070700021|10067099003;
x-microsoft-antispam-message-info: 
 u0XHv+Y42124HGXSX+UDMBiW5ydX2qDE2fRY9LTF2cCAV0EoKfU8OyrxCDq2ZpOMOyWwyKjfv+4K4dfQ09hOjJyDsNRJfqPJdSfq2YqsC36yktj29M22hQdSFtlcWgF4dyw8EclZt+JXv43NsNmXMBUQC/imgwaZbj5ePHYmP+qZtrlvsyXQQPitEVyGK8mUStHkBxJARB6VM/9QIxJzc3MdnbxkIBKepzA8v9y5AcBBnN4KkaGzuTQvHmGoJI79bQROhno/XPosKEjcdV77zG9Qt3g4VJ0bXPA29LC4tF6lai4JHt5X9K/e9gabGCSLRFy2mLGU3dFCm6UByARiwWDhvb8H4OP1Kxtsio8fnyGqZaIksH3JFgHmkpQw6NLmYNvzxDCvl1ZxZJ7Ql8Ew/fRZtqYJOe/Anehk80V0KetZxzWGQxb81HzaKHdVfKPLsvKHGPquMbP+obZNTqgzH/jE7m4WVfIMJB9+LMuZjApbVQr3uDKYy5fBBtidBocpANoYU5cdUuVKNJ0uIhHeLVn79lHKxyVmGiqkZ8IlxecJBz4ZStM4oESEQDAhNbFlZHKLsoOL011/3QRk1I2WyH1fmz/suG2bVacXBFHjtStcJm5FzqtHr0Q5l+d2B0KY9v9kGNAxZsiV1rowC38kdBmEOd1AGsw7OYBR5sMgwR0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(8096899003)(13003099007)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sjcGqJoQ/7NeaKPMAUvO3fhg5VzdtrnWgOjP8svEwLK8lTuGpRS0AfyDzRl5?=
 =?us-ascii?Q?BuGrpihH6Pjl1rZIsGYJ+MK0IbqDzQRehv4MBv67loABC06O/Hr3N3cmOQwV?=
 =?us-ascii?Q?rpbnLruEvDa4VCCCwF0mrshjq2Dhs/MjRX9NppCzmEE7zVs9PhCF008IrQp0?=
 =?us-ascii?Q?OE31VGo4z6aINenWWkUxYuRSrISHxPt+ZZi9S6xSR5lZIOHt3E0CyhSit+xA?=
 =?us-ascii?Q?EzUgZpey984IBOgyUsfaguKAvLOQGXLO+KUJkEnV8J+UmOpR6hWdKPWQ4GGO?=
 =?us-ascii?Q?FyvhFcwOXUGeJ3kF9E9IwUaf24p2aqNDaRAS03QgR3LxrC6/3UusvaQCOEg6?=
 =?us-ascii?Q?D+qtqrUd6Pp18Bw0BKbdWgwSC4TgWEPOdt//jE+HtCubWxYB47st/8HoxO5q?=
 =?us-ascii?Q?LLxw2UHBb+E64faslIbAbBDb8x4jhVpLiTq6BEOuXTR5cLLU0wL3tSWXpRWm?=
 =?us-ascii?Q?ErgBp55a5DC6lsndhnIzH8T+bCPCgnpKBtNONKBxKFJM+fQNcnXRDVXXw5SK?=
 =?us-ascii?Q?IBTLItk1RVBkT9UWao/nCbfSrGobUsiI/KQunD3zb0NDmQwvSO7flsSdX9IP?=
 =?us-ascii?Q?Fro+90P2COkq0SVmOsMG6cIeYE6MV1CVoC6jhRNYcCe1tErm0A0SwkYTDX39?=
 =?us-ascii?Q?woWJuz/vPoNehA9DgmOcqu5a/62Pg3B86FF3RzNNfjz6YXkNTI5Da0t3Fk4g?=
 =?us-ascii?Q?+L4mXV0XXbArxsxC6JmWzXxVPqn3pPe2PUgULzv/uhOp1hhS/VcQX1fRkGfP?=
 =?us-ascii?Q?dnoaEXjwgPR5PzSSoQRCS2/R9oHfUTRTQVXf98DxUAtJcsX6aMXbCX41V5Ar?=
 =?us-ascii?Q?xJmqyjMBRyCp8gEtwRAHBwUIOt3I6l9Mf4q+Pyrm96NR1UdT1qo+WaOEcs43?=
 =?us-ascii?Q?qY1tS/3KJm1yN02bWhiRtOTG0x1M4WJKZrkNtPfzV8E396K4+Rdp/ap0rPva?=
 =?us-ascii?Q?aSIaGfkaV6Oaow56sl1wqmDUrFtrl+teqJR510HVm0rqrhYzhZtC2hMkIDGL?=
 =?us-ascii?Q?YQf3e0zLr1QmVolmAMQ3VRvqFCv8NpINW6R8wMAK4lOXV3RZRh/NQc5p5mbo?=
 =?us-ascii?Q?CyYQpzh3Jdqc9vNmnY7mbySxqS2GpRxoRtz8/yIBmA/dEDNjJR4961nzjhKN?=
 =?us-ascii?Q?pe50dOEsYihf1S/LBTZKzwaXeCq796edTqI18Hag3ZlwONhZoWOV5Anr2s4G?=
 =?us-ascii?Q?/Gdvt2EEG2WOn6/rpVjTfheDQxrlAy8zwnGaslnhUAcZtdqb0vdW6DmOQQGN?=
 =?us-ascii?Q?6Sm6uYj+vcs9jZM0kuAeW5STv26FPJGxviPP7KKps4yuW2gbjhvzhMERJuck?=
 =?us-ascii?Q?E+Pn0BndVowfRI0ccJQxsOCK8LAejd1c4Tb6O2mJTDC8OJqq46UV/+LBuEg/?=
 =?us-ascii?Q?awTYYWdhiOvSJ2zTScc9cBZKVigDJ9MSaV9PuudSu8/h2c/EM55i9a3Z2KrT?=
 =?us-ascii?Q?SAeJBVhSGTQYomAAh/7OQwnXfFDyBVERTt+cWdnNGbbnVi7mESAvGKTJ2A81?=
 =?us-ascii?Q?JCqtCeKQFTESjnLwdgZxR1J6TCfDgwFaxwINrCaqLEC1Lf0A4Ryaq13rJo10?=
 =?us-ascii?Q?i5NuiTdn8oKKAw78IdgCmfKD1JK1ZuCi1zsUwHWeBrz0h2iAN5mtcaRRqpx6?=
 =?us-ascii?Q?h+0o3813ssQimh/tQHaICRD2SHkgVl/+xNax0lvkqjHDE6/hrVqWBeHHwLho?=
 =?us-ascii?Q?Rle+ettVc+5BJGvqejnYjBQf3K6kQhCYaK5RKTAptsVOzM8o?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB618916B350294519E31B1D82C4C32DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	glkGNkRZvcpBot7QEfWbmsq3DBvfis15MaE3SH6fkX7SKm8Y1rfj8sHDCHZpi42Fj/aSLMdwkbb673wIDeECc00TgLudTwxVGpMChu/8gUarCi8MQvptZc9OxM9aQBIuM9uYF80xEELu/GryPCLUok6NKLUuZDTXOEHRO/0VukdOIr/AdrKrxwUC0HvQcKW+OEDsEcC/rK+5e6hMFCVQL1FOnk6WuHzeKCaJ0tTcy+iiZNJaMA2OOJiezNOL5K4YyQ/7wMWUpGZFCDfvCNunr6YnVwjEnG8+RmglEom8DaNUuf0yVChYPzeQ/EpJjB+SR6bFisy8uIW4maxvvW/yfw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fac8cb-0118-425e-50a9-08dee621e803
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 05:44:03.3986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ro0jxG8dfFdlhNkBnQdubHcw4rQBJNSrAA0FZBpsRq4KJqTmou+78D/jPCiNPyye+7no5xxA589G61z8/inceQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9943
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241322

--_000_DM4PR11MB618916B350294519E31B1D82C4C32DM4PR11MB6189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, Yoann, for the update.

Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Sunday, July 19, 2026 7:37 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; jeremy.rosen@smile.fr <jeremy.rosen@smile.fr>; Anil Dong=
are -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) <adongare@cisco.co=
m>; openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878

On Thu Jul 9, 2026 at 7:10 AM CEST, Deepak Rathore -X (deeratho - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> I have sent the wrynose patch for this CVE: openembedded-core@lists.opene=
mbedded.org | [wrynose][PATCH] libcap: Fix CVE-2026-4878<https://lists.open=
embedded.org/g/openembedded-core/topic/120185745>

Thanks for the wrynose pathc. Now that I can look at CVE-2026-4878 for
scarthgap, I noticed that we received an earlier fix here:
https://lore.kernel.org/all/20260520091430.3075624-1-hsimeliere.opensource@=
witekio.com/
The patches are identical, I'll use Hugo's since it came first.

Thanks!

>
> Regards,
> Deepak
> ________________________________
> From: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <deeratho@cisco.com>
> Sent: Wednesday, July 8, 2026 11:50 PM
> To: Yoann Congal <yoann.congal@smile.fr>; jeremy.rosen@smile.fr <jeremy.r=
osen@smile.fr>; Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at =
Cisco) <adongare@cisco.com>; openembedded-core@lists.openembedded.org <open=
embedded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
>
> Hi Yoann,
>
> Anil is on medical leave. I am working on this and will submit the patch =
for wrynose by tomorrow 9th July.
>
> Thanks & Regards,
> Deepak
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Monday, July 6, 2026 10:14 PM
> To: jeremy.rosen@smile.fr <jeremy.rosen@smile.fr>; Anil Dongare -X (adong=
are - E INFOCHIPS PRIVATE LIMITED at Cisco) <adongare@cisco.com>; openembed=
ded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; to@=
cisco.com <to@cisco.com>
> Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
>
> On Mon Jun 8, 2026 at 4:44 PM CEST, J?r?my Rosen via lists.openembedded.o=
rg wrote:
>> Hello Anil
>>
>> from what I can tell, this CVE was fixed in master but not in wrynose
>> please submit a patch for wrynose then ping this thread so we can apply
>> to scarthgap
>
> Hello Anil,
>
> Gentle ping for this patch, do you plan to send the needed patch for
> wrynose?
>
> Thanks!
>>
>>
>> thanks a lot
>> Jeremy
>>
>>
>> On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>> From: Anil Dongare <adongare@cisco.com>
>>>
>>> Pick the upstream patch [1] as mentioned in [2].
>>>
>>> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D2=
86ace1259992bd0c5d9016715833f2e148ac596
>>> [2] https://security-tracker.debian.org/tracker/CVE-2026-4878
>>>
>>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>>> ---
>>>  .../libcap/files/CVE-2026-4878.patch          | 162 ++++++++++++++++++
>>>  meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
>>>  2 files changed, 163 insertions(+)
>>>  create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.pat=
ch
>
> --
> Yoann Congal


--
Yoann Congal
Smile ECS


--_000_DM4PR11MB618916B350294519E31B1D82C4C32DM4PR11MB6189namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks, Yoann, for the update.</div>
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
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Sunday, July 19, 2026 7:37 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; jeremy.rosen@smile.fr &lt;jeremy.rosen@smil=
e.fr&gt;; Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;adongare@cisco.com&gt;; openembedded-core@lists.openembedded.org
 &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Jul 9, 2026 at 7:10 AM CEST, Deepak Rathore=
 -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; I have sent the wrynose patch for this CVE: openembedded-core@lists.op=
enembedded.org | [wrynose][PATCH] libcap: Fix CVE-2026-4878&lt;<a href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/topic/120185745">https://=
lists.openembedded.org/g/openembedded-core/topic/120185745</a>&gt;<br>
<br>
Thanks for the wrynose pathc. Now that I can look at CVE-2026-4878 for<br>
scarthgap, I noticed that we received an earlier fix here:<br>
<a href=3D"https://lore.kernel.org/all/20260520091430.3075624-1-hsimeliere.=
opensource@witekio.com/">https://lore.kernel.org/all/20260520091430.3075624=
-1-hsimeliere.opensource@witekio.com/</a><br>
The patches are identical, I'll use Hugo's since it came first.<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Deepak<br>
&gt; ________________________________<br>
&gt; From: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;<br>
&gt; Sent: Wednesday, July 8, 2026 11:50 PM<br>
&gt; To: Yoann Congal &lt;yoann.congal@smile.fr&gt;; jeremy.rosen@smile.fr =
&lt;jeremy.rosen@smile.fr&gt;; Anil Dongare -X (adongare - E INFOCHIPS PRIV=
ATE LIMITED at Cisco) &lt;adongare@cisco.com&gt;; openembedded-core@lists.o=
penembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
&gt; Cc: xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.com=
&gt;<br>
&gt; Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878<b=
r>
&gt;<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; Anil is on medical leave. I am working on this and will submit the pat=
ch for wrynose by tomorrow 9th July.<br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt; Deepak<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: Monday, July 6, 2026 10:14 PM<br>
&gt; To: jeremy.rosen@smile.fr &lt;jeremy.rosen@smile.fr&gt;; Anil Dongare =
-X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;adongare@cisco.com=
&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.=
openembedded.org&gt;<br>
&gt; Cc: xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.com=
&gt;; to@cisco.com &lt;to@cisco.com&gt;<br>
&gt; Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878<b=
r>
&gt;<br>
&gt; On Mon Jun 8, 2026 at 4:44 PM CEST, J?r?my Rosen via lists.openembedde=
d.org wrote:<br>
&gt;&gt; Hello Anil<br>
&gt;&gt;<br>
&gt;&gt; from what I can tell, this CVE was fixed in master but not in wryn=
ose<br>
&gt;&gt; please submit a patch for wrynose then ping this thread so we can =
apply<br>
&gt;&gt; to scarthgap<br>
&gt;<br>
&gt; Hello Anil,<br>
&gt;<br>
&gt; Gentle ping for this patch, do you plan to send the needed patch for<b=
r>
&gt; wrynose?<br>
&gt;<br>
&gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; thanks a lot<br>
&gt;&gt; Jeremy<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E =
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt;&gt;&gt; From: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Pick the upstream patch [1] as mentioned in [2].<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1] <a href=3D"https://git.kernel.org/pub/scm/libs/libcap/libc=
ap.git/patch/?id=3D286ace1259992bd0c5d9016715833f2e148ac596">
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D286ace125=
9992bd0c5d9016715833f2e148ac596</a><br>
&gt;&gt;&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE=
-2026-4878">https://security-tracker.debian.org/tracker/CVE-2026-4878</a><b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp; .../libcap/files/CVE-2026-4878.patch&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 162 ++++++++++++++++++<br>
&gt;&gt;&gt;&nbsp; meta/recipes-support/libcap/libcap_2.69.bb&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 1 +<br>
&gt;&gt;&gt;&nbsp; 2 files changed, 163 insertions(+)<br>
&gt;&gt;&gt;&nbsp; create mode 100644 meta/recipes-support/libcap/files/CVE=
-2026-4878.patch<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB618916B350294519E31B1D82C4C32DM4PR11MB6189namp_--

