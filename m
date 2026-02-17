Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC64E6817E
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:49:06 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11079.1771332537346331919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jezYwBQj;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=34727; q=dns/txt;
  s=iport01; t=1771332537; x=1772542137;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=6fX1GGGaguPZH/ndruL8hJmDAVP6EC1O7iyIYOB1tlQ=;
  b=jezYwBQjwcN/TdBOMP6QzU9Ajy4g89lLnCE8WDPVDNcPmP/oDBgjM26a
   NocckDIxZU0U/aGWXGJiT1A1gdXCiOVB9EqE4mVt9Dxhsb/M4N6d9Ploh
   orkSTLdiDQ5Wufm4UTPJ2mFF2H+kiglLDsLYWgcsl/hmhq3W7yKpDdt8d
   +AwPOPsvq/Qko6N8J71eruRQcDlfaCJIyQ13f502dpdskqkRpD00f9KHx
   acRXowMDBYZAFdstVIP86meL+W12r69bnaMJ9gMQBbPBlp0qYkOfUAZnW
   FqXtIoRBSZZACV/SW4Ze60dqXyaaVhcmRNTs82ciw8+rc/gB8O80E2qom
   A==;
X-CSE-ConnectionGUID: hXgqyiu4SsialOQHNpIbrg==
X-CSE-MsgGUID: iOKjXmOtTvCnjqnaScq0tg==
X-IPAS-Result: =?us-ascii?q?A0CHCQD7YpRp/5H/Ja1agS6BK4E9MSopB4EAgSFJhFeDT?=
 =?us-ascii?q?AOFLIh5A4tkkjaBeQYPAQEBDQEBLgEOFAQBAYUHAhaNCQImNgcOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDARE8KxACA?=
 =?us-ascii?q?QgRBAEBIQEGBQICHgcJARQJCAIEAQ0FCAwHAgQBgmGCHRYHAzYDAQIOjm6PY?=
 =?us-ascii?q?AGBQAKKK3MJgTCBAYNaBQMBBQJD2RYNgl6BTYU8gnkEGgEBKklsgghTgSFUg?=
 =?us-ascii?q?gyCMycbG4FygVeCNzE+gh9CBAEXgR0aEQUQHwQEgxk+gi8EgQ57GVIoCgoSC?=
 =?us-ascii?q?w8/BQYvAkEBAROBLQQDEQIrhC2BWHVkJ0WBGAEBARKFdlJyIgMmMywBVRMXC?=
 =?us-ascii?q?wcFgSNDAyovLSNLBS0dgSMhHRcUH1gbBwUSISoHCYF1AgIEghB4ggEPhmx5A?=
 =?us-ascii?q?y5vGg4iAiwSXFEFPgtfJQMLbT03FBsDBIE1BY1RW0GBQQhpPjdFAQkZLTEMB?=
 =?us-ascii?q?AEIAioIEQoDCQ4BQAEkkz6CaIwqjl+UJnEKKIN0jB6IBAeFM4IAhjIXhASBV?=
 =?us-ascii?q?4s8mVSZBiKNZ4QJkVeCC4MiAgQCBAUCEAEBBoFvCC2BRwsHcBWDIgkKPxkPj?=
 =?us-ascii?q?i0WHHYBDIMAgT6DFLoweAI6AgcBCgEBAwmGSIsiAiaBVQEB?=
IronPort-PHdr: A9a23:cgyfsxK0SINchMhcLtmcuVQyDhhOgF28FgcR7pxijKpBbeH+uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:Wlg7MaDN+q3DpBVW/3Liw5YqxClBgxIJ4kV8jS/XYbTApGklgzYAz
 GMeXWuGPfaKMGbzc99yO47lo05TsJ6Bm4c2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAX8hGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEw8VhFVA3INEj4ed+BUZ31
 doACToXYUXW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FIvj+S3aYCLILRmQ+1UuWWal
 mfh41jnKRcYLdqW8jGcqm6j07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:nSCAsKmQCKBVHFfdBiiawtEq7PTpDfNsiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj/fZq9z/JICYl4B8bFYOCUghrYEGgC1/qs/9SOIVyFygcw79
 YFT0E6MqyOMbEYt7e13ODbKadc/DDvysnB7omurQYJcegpUdAd0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvGRV0nKu6AKj0uWe/Fq9fXlJTgTyInKnccgjWmvHeD0pK/NwKX8Cs/flp0rIvK91
 KrryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTFkG+TFcRccozHmApwjPCk6V4snt
 WJiQwnJd5P53TYeXzwiQfx2jPnzC0l5xbZuBylaDrY0I7ErQABeo58bLFiA1zkAo0bzZdBOZ
 dwriekXlxsfEr9dWrGloD1vlpR5zqJSDIZ4J0uZjpkIMojgHs7l/1EwKuTe61wRx4T5O0cYZ
 tTJdCZ6/BMfVyAaXfF+mFp3dy3R3w2WgyLW04Yp6WuonJrdV1CvgMlLfYk7zw93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXeD3cZe06EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdsWIpYUrhBcCHwZUO+BHQR2e2Wyjr16hlltVEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2I55SC++LFxqmJW+I5XyJZ3B/EwhobCROgKdPZ7unmLO+FrHX
X-Talos-CUID: 9a23:IN/wDW30/6I6qEWik8alp7xfGvAqa2zc0SvrOE6xDUFQaJuNaFWK9/Yx
X-Talos-MUID: 9a23:qnCTMAqUDoIuiTBRvnQezzBFF8VY5oOyNF4ml5cfvcC/PjUoJzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Feb 2026 12:48:56 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 17E601800047A
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 12:48:56 +0000 (GMT)
X-CSE-ConnectionGUID: 8a7qKjXJTS20PyLE5xp6LQ==
X-CSE-MsgGUID: 1Olqe9JLQK2F7SLCM6dsag==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,296,1763424000"; 
   d="scan'208,217";a="45424255"
Received: from mail-cy3pr08cu00104.outbound.protection.outlook.com (HELO CY3PR08CU001.outbound.protection.outlook.com) ([40.93.6.108])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Feb 2026 12:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnDkMP+ahsMDQEEogLhfsAbluE/oGcrOgwkBZZXP8Na8bcWNYwPa1fp2uCRNMChY2iuV2JsZgCKsoQQ8Es6Mwu+HylBtutWIqG075dtUau6WpZ9S+tpzelE1sXFFZq4m4nR8kBbRrhBefCD/P0IcLnpD3zg/1aj5LdAdyYKZsjql76yGdIjLqSaY+YpPHzSqPg6mXL6poAF2+jHWt8clOJHr92H3Y5tYlvKpe4mKQYqObx81/oPxQR/9v1D/iIPK3654p3avfE3VdSbaamPibPZYQTriuOfHhW0kceKW6Ig3zo8QR3rmS8C4LQ8gd6M6iS+pJL2srSEIgD5/Dylbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fX1GGGaguPZH/ndruL8hJmDAVP6EC1O7iyIYOB1tlQ=;
 b=Mq5VBl46RFi9xNx1F5I0MRC0Sxeg1D4UuhJwEJCB5SR7c+mP0ko+94DUczLZQj5aBiteErdgQzOTuDa1yRdE6CN9sPXemDjXPifh3rF8zfvnmcNw1xSKjVsIXt2mVROKjoQgD+HQtzYmb653kEkijiHHBAA7OZdaGJRBjsZKzi7JFaumrzn1+ozcFrMLmf0Iru1lXzO7jmK2OEq5ElYH3z5jD9QJIfX24mkuFhd/UuJ/ltGuBqdYq41B1Cg0BRF5XBdi0z/fOkwxzffzjthEGxEVWMZ5/YqzDMPNk2kUx0l3jYVMBAlr8FEq99iTeFIXrCx1AFks168MVaKNtTFSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 12:48:54 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 12:48:53 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, Jose Quaresma
	<quaresma.jose@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, "Viral Chavda (vchavda)"
	<vchavda@cisco.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: Re: [OE-core] Clarification on handling recent CVEs for
 go-binary-native package
Thread-Topic: [OE-core] Clarification on handling recent CVEs for
 go-binary-native package
Thread-Index: AQHcmz3Uc2l4M2cpEkS/QXc4ClL57rV/XfaAgAAZLhCAB0SNxQ==
Date: Tue, 17 Feb 2026 12:48:53 +0000
Message-ID: 
 <DM4PR11MB61899172543CF4E54D8FE945C46DA@DM4PR11MB6189.namprd11.prod.outlook.com>
References: 
 <DM4PR11MB6189CC7075F52DA63D8CF527C463A@DM4PR11MB6189.namprd11.prod.outlook.com>
 <CANPvuR=7aa2kJM1VJLc-tx-VUfcss1DQ2zdDqXifFSeK-_mnVg@mail.gmail.com>
 <AS1PR10MB56979F2FE1C4D254E6754282FD60A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56979F2FE1C4D254E6754282FD60A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=12d4cb1b-cef5-4b94-8672-5a058678f7a1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-12T19:35:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|DM3PPF453C3BEC4:EE_
x-ms-office365-filtering-correlation-id: ca17117d-ed8c-4990-02ab-08de6e22e852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|13003099007|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?SjlxYzRybFJLSS9TVVdqUEVPNnhBbEVmeGtTMTFlNUN6Y2M4L0wwSU1SWWlu?=
 =?gb2312?B?dXJaVGNqa2hOaGp6RFVTN082cjhmbnJPQTkreklYWmtVZjVNUCt2aEQ0UDFC?=
 =?gb2312?B?OE5hQXhQcUFwRFRpSFFmRDFIaDBlUnZSUUVoUkR4Yml6bTQwZG9aRGwxSlMx?=
 =?gb2312?B?aUVlWHFXREZyaXFTem5CN0xoMGp1QkpvZUhRM3cyNk5FNU5udHc0R1hRQXdY?=
 =?gb2312?B?ZFF4QUJYZ0U0d05vTEhhV0JjVVBXeWRTMFR1NXRzWlN5RGZSeG5KQzQwdG1O?=
 =?gb2312?B?bGNwTG9KcEVhUVVKREJhUHFITlNXNVFGZEpvYlNMM0xpdlE4dldNb0NjVTls?=
 =?gb2312?B?TlgxTVAvNGkwZFF4WXc4YVl2anJ4UkVJOUViUDZpazgxenhLMVpkU0RtRUNN?=
 =?gb2312?B?REs1Nnlidyt2b0R0Z2h1Um1mVEpXMURlWDZwQnRhY2czNnVoMHB4RmI3bzla?=
 =?gb2312?B?aFBTdDhlUzZKUXBGM3llcmxrYzAvbkx4WWRtSUpPY0dmRHNEbU1tYlZ2UmVi?=
 =?gb2312?B?OTNrbU5GUnZOTDBKbDVFRnl4YmNOVzZnM2tock1KVUx3M0c0SVA1b2R2WGJX?=
 =?gb2312?B?TFpuY1pJZlFzTS91TkNmNUhiN042WW5ZYTZoSU9TeDlWQWhUNXllWUU0SFFI?=
 =?gb2312?B?aG1kRXpBblNkZDdnK3BMdGE2Z3c1Z3dQdDJvOFk4TDZqV0xWQWhhZ1RZT2dK?=
 =?gb2312?B?MUJ6aGU0cXZCSnM2c3pMTlQ0OW1XUDJiNWxQTzM5ekZkZUcxS3B4MG9YODdo?=
 =?gb2312?B?VUVDaWxZalhiSGJXS1JPQ21LRnFBZHo5WktTRlNUaysvNkJLbFJQV3dCK1BB?=
 =?gb2312?B?TC83a2tDUmU2WHVvcTZuU2tmRFJ6RkJKaVloTFF6bTc2ZDd1T3R6cHhmQzBo?=
 =?gb2312?B?cWp3cis3RHUzWjFXaU5qQjEwMjhnYXdFcGxQbytyUGhEYS9Cdk1hNzlJQ3dz?=
 =?gb2312?B?L29Ld3dNNE81VGNQY0JJbzZWeEsvM3NqQmxEVDUxTThnN0VlYVFjQzcvU1hp?=
 =?gb2312?B?WHFsdWF1WUFJUkVmVHVLMDNoLzRXeHZsclNOblF2NTNGZktXeWUrQ3RISVN3?=
 =?gb2312?B?bm83Mm5rMXpYaXB1ZDNvRTVRSUVFbEp1Y0JZV3dWdVVyeU0rckc4Um5qNXNs?=
 =?gb2312?B?c3dKK1o5RUN4Sm1PQzZlSGIxZlZ4UUxVT0doNGJhR3pPZWw5M2hxMzNaazRO?=
 =?gb2312?B?N2tsU2tHS3hMck1XcGlWRXRCUXNzbzhxTHBzaVIydjkrQzlQdkZWZGdoU2E4?=
 =?gb2312?B?ZFppQVhIN0psQkpSd042dkR0U3kyeFEwUWQ2aEFQMDN0T3h2UmhBR0xqbHIy?=
 =?gb2312?B?c3dCZlRJd21uc2djZVphY0d2VUpqR1Rud1NTbS9HZFllZ2k5UnlONS9kdUlv?=
 =?gb2312?B?ZTRseUU0bXJ3TXR5d3dJYjIvOGtOd2laOEEzOWdpOEhtV2s0TXpBcmxlelFG?=
 =?gb2312?B?MzRsOWlTbk5Sd1NLdXIyK3VoY1JpVm8xQXNQZ2ZMMUZ1Y1RTcGdxYm1TUERP?=
 =?gb2312?B?Y1ZqRmVoRllkNW0zRzBhcG5MWWJSTHZQWnBXRFVPdlVFSzJ3blJOVTFrWllu?=
 =?gb2312?B?ODNFSGJQUnFCTjhhdlRPeVRvcXQ2N09UbTZnN1FKUXlBWXdpOGFocmJXRXhk?=
 =?gb2312?B?Q3hkQm0rMk4xRTZ6c01oaDRTVVVFK1F5YkpPM2FQRFc5UXVVMkRjKzducVJJ?=
 =?gb2312?B?UHpLdGJSUXZlakRFRm1Wc3ZxcXN2REFlWENxTmgrTVM4eGp2M29EN0g5Qkxp?=
 =?gb2312?B?cHdpTUNhQlpDaFQxdk9WVVFyZlA4NFNHZ05RRytabUFlODJjSGxHWU80QVBn?=
 =?gb2312?B?NmR4aHdkbmFVcTVrN083KzR1Z004MHh4RGY1RWk4amdmSzRRL0JlemZHOXFn?=
 =?gb2312?B?ZHgxVlN1THpWTjIyL09LYWxpcmdVdUs4UHdKVW82SFo3K0h2L2MwaysyelRv?=
 =?gb2312?B?aCtSblBLUXRVWlBaL0QzOHNzamZabnBQQ2R4WW5sUGZlaGFPaFJsRjErZlY5?=
 =?gb2312?B?cmF2YlNqSUlobDE2czNkaUVYMTZPZzlUYzFKUFE4cEs1Mzk4a2JJbFR6UWdk?=
 =?gb2312?B?cDcveFY1ZWdXM1c5Rm9NSXBCOGhDclZGdWVaZEtUQ3NadjkrTW1QM2JuSmJv?=
 =?gb2312?Q?qTB02qxoTGoF0hFBsVGl9D+1+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(13003099007)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?QjNMbXZoMkR5bys2eUNJQWxSSmxFNWEzRzJJS2RTTmJyU28xR2pvOTB2MVBU?=
 =?gb2312?B?eFNRdGtDSmdQUmI2T2ZIWGVibHdzN0k5aTRhZWhFdkhQRWwxckthUFNpZTNX?=
 =?gb2312?B?eGltMWNaMjRrQVNVUk85NjJqUkRaVDFhVG9WYlNyMjVFSDJjQlJqR3ZZV0M1?=
 =?gb2312?B?WVFLTkVKYWoyWjM5dE53ZDk5SFF0Y2MwSjZvaFN6WWJ3cXJPaVoxVlluM2hk?=
 =?gb2312?B?NDVTa2RBTXFLUUNEdnBTUEZjbjJ2NmNrQ0thK2dGcTh3eG5qaG5zbi9reUYy?=
 =?gb2312?B?eW8xYmxSSk5DM3dTNUI5VlgvSmU0cGduNmdsRkhoZHV4b0VCZmROV1BTamla?=
 =?gb2312?B?eWpXVlBoeU53ZCtLZDNuY0ZjYjF4dDdpWVBER3FMcWdBMlFrSVlOL1U5djNr?=
 =?gb2312?B?U2JxdTk4aFBvVndtRGdJbW5lelk0ZUt2aG1RbWJJVEJVczFQeFErU1ZyaGZM?=
 =?gb2312?B?d0UwRnFwZU9WV05ZMnAwRHAxSHNDU3BZeXNaRGtCM2JhVW5JUU9QTjRHVTBl?=
 =?gb2312?B?c3V5V2grUzRyWTgxRERWQXRuV0luS1BvcjJkeFR5Rk9YM2w0cXdzbHJmSlVq?=
 =?gb2312?B?emlJQVFGZjJLRU04NHFZSkdVcXhSNS9QQkRRczFOSXZDYnI5WmE3NGVVSVkx?=
 =?gb2312?B?QUMwNlhVcWZBNVJHOVdNcVlNeGFucWVDVVh5ZExRTnJwNGVqeXlyczV0cFQ3?=
 =?gb2312?B?eUhuMkRwendtVE1NakkzT3hUMCsrQ2hyMU9uaTFhdmNGWHh6YVY3WFlhcWFz?=
 =?gb2312?B?bmhiQ053Nm1TcDRJRDA4WXdRdGxoVjNJeXR3NW9rcnVaMXpmSDZpUmVnTGtG?=
 =?gb2312?B?eHdvT3A3OHVlczBUWEtDL3BnUjNLQ09NMUZCb1JrUm8yaDJSaVo1U0wyOU11?=
 =?gb2312?B?VTJUWHFsazBZQzN3VGd1eVBCUG53dUR0M0w1QTl0MnV3STRZVUpEUGF5Z3dH?=
 =?gb2312?B?eW5aVHdibk1lNkZFK0ZYNUY2NTljMU5XUGdZMnFkUE5ZV1kwK080bkJLMFc5?=
 =?gb2312?B?Mkg0RFVjb21ZRnFaY0NPRjNEY2JQSStVREtJOWRySEZSQ202Qm1nZHZDcU1C?=
 =?gb2312?B?MXUrcW0rZmI5RWQzZjRid1hqaHczN01RUzdTSmtKamdCekZvSnhLcFBJc2Ex?=
 =?gb2312?B?Q2c3UkJ2bnV4M3JzckY5cTZuOEF0N01yYlVaeXBTV0RQVzdTTnlPNGgraFBS?=
 =?gb2312?B?ZjBZZ3lTMnN2NCtBdERUdkIxT2NBVC82UGN4eFJ1K3ZQekFQSmgvUGd4eFVX?=
 =?gb2312?B?L2VIY05iQm9XOWdXaW5sSXV2Mmw5UHNLTTIwc3B2MzRXTytaU1F3NktqQ1dv?=
 =?gb2312?B?YTBUTHdmenhlblFrRXQ5VmEreS9OV1ZSN0tSQ1Q2T2JSQUZnSXRpaUVDVE1r?=
 =?gb2312?B?bktpRG5GSUI3ZUNrU291cFF4MjM1cXhQZmNpV1h2ODZST0M4VDRJVXhKYUZl?=
 =?gb2312?B?U0VFTEwvQzh4ZndPVGt1eERGQ0w4TDdmQnExWXk1cmFBdjJpYVhTRnY1S3J4?=
 =?gb2312?B?bDc2NU1MaGdjZEhiems2S0d0VS9wQTViRXpGR0xxQTQ2VlpUcG96TElYVWly?=
 =?gb2312?B?Vys3YWNJMkNaZENIRnZGVk9ReWJrZFBIUVpDNEc2UHFwNGpLendtdzZpZHpn?=
 =?gb2312?B?M2lIMkVoMy9DVnJOdGlwc3l5Ukp4N2lTbnAzek5vdEFSQ0RTTjFEVHlwYlZs?=
 =?gb2312?B?NllOVDc5SDhuRHhBWGZ4bjJvZklRV3NXOEp4ZVNiTElnczF6WmdIVXYzT2tE?=
 =?gb2312?B?Q1FKb0ZUR1dOVkJKZkEwTEtVYjI3ZTIrS1hNalJTZXRJbDN4RjZpYlpKRDMr?=
 =?gb2312?B?RHM3UUNTY3JrY3BBaHFtUzU4djhPRHJWemVONVljL0NCN1diUEJPaEdCVGtM?=
 =?gb2312?B?WUxDbm52UmFCbjlvMDZnaGdYMDZURnJ5VkF5VnlWVHNkS3FQWEFBN0pjZmNi?=
 =?gb2312?B?MzY0NkdEMUNoRTh4ZDJjL3l6TXBMT2NmaW1IVk1mVzZELzc4Uk1VanV4Mm1T?=
 =?gb2312?B?aHdEdkpkL0crbnpXUXJsWitsN1VHMXlzTzdlSHA2Q2RWZmVmTjgxTHpPUzVE?=
 =?gb2312?B?QnZPMjdGSDBaY0N0WXNrNnlmL3M1dEErQTNGRW9uZXR1d1ZsZ2RITTVjbEJU?=
 =?gb2312?B?c2R5VUFtVXF5NGhZdml5VXVrWnhIU2hnemNRRU1VS2cwbkpKOVgwT3JxWUw0?=
 =?gb2312?B?L3Q4WkxJbUFjaC9UbDN5RHdkWU9hbENhcFFNczkveGhCWUtEbnpQelBvby9M?=
 =?gb2312?B?RUJLUlljMmJtb0Z2azdhaE1xNEFVamoraEQ5Y0RpV0J3akJETzkraUNEQU1R?=
 =?gb2312?Q?o5iOPzPUg7Sxl1Gz4u?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61899172543CF4E54D8FE945C46DADM4PR11MB6189namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca17117d-ed8c-4990-02ab-08de6e22e852
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 12:48:53.8556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDMPKKsSfUZaZ/4pHOeH/ZHTwpp0KuKm4c5guZvqP0zQYPzGpya8FfGGTWOMD16i1LipFKpSZ+Ye5IWyktYkvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 12:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231246

--_000_DM4PR11MB61899172543CF4E54D8FE945C46DADM4PR11MB6189namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gUGV0ZXIgYW5kIEpvc2UsDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVzcG9uc2VzIHJlZ2Fy
ZGluZyB0aGUgcmVwb3J0ZWQgaXNzdWVzLg0KSSB3b3VsZCBsaWtlIHRvIGNvbmZpcm0gdGhhdCBh
bGwgdGhlIENWRXMgbWVudGlvbmVkIGFyZSBpbmRlZWQgYXBwbGljYWJsZSB0byBvdXIgcHJvamVj
dCwgYXMgd2VsbCBhcyB0byBhbnkgc2V0dXAgdGhhdCBlbmFibGVzIHRoZXNlIHZ1bG5lcmFibGUg
cGFja2FnZXMuIE91ciBZb2N0byBzb3VyY2UgaXMgY2xvc2VseSBhbGlnbmVkIHdpdGggdGhlIHVw
c3RyZWFtIFlvY3RvIHJlcG9zaXRvcnksIGFuZCB3ZSByZWd1bGFybHkgc3luYyB3aXRoIHRoZSBj
b21tdW5pdHkuIFdlIGhhdmUgYmVlbiBhZGRyZXNzaW5nIENWRXMgZm9yIHRoZSBwYWNrYWdlcyBm
cm9tIGNvbW11bml0eSBhbmQgdXBzdHJlYW1pbmcgZml4ZXMgd2hlbmV2ZXIgcG9zc2libGUuDQpI
b3dldmVyLCB3ZSBoYXZlIG9ic2VydmVkIHRoYXQgdGhlIGdvLWJpbmFyeS1uYXRpdmUgcmVjaXBl
IGRlcGVuZHMgb24gYSBwcmVidWlsdCBiaW5hcnkgaW5zdGVhZCBvZiBidWlsZGluZyBHbyBmcm9t
IHNvdXJjZSwgd2hpY2ggcHJldmVudHMgdXMgZnJvbSBhcHBseWluZyBDVkUgcGF0Y2hlcyBkaXJl
Y3RseS4NCldlIGFyZSBmYWNpbmcgc2ltaWxhciBjaGFsbGVuZ2VzIHdpdGggcnVuYyBwYWNrYWdl
IGluIHRoZSBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyIHdoZXJlIGJhY2twb3J0aW5nIENWRSBm
aXhlcyB0byB0aGUgU2NhcnRoZ2FwIExUUyB2ZXJzaW9uIGlzIG5vdCBmZWFzaWJsZSBkdWUgdG8g
c2lnbmlmaWNhbnQgdXBzdHJlYW0gY29kZSBjaGFuZ2VzLiBJbiBzdWNoIGNhc2VzLCB3ZSBiZWxp
ZXZlIHRoYXQgdXBncmFkaW5nIHRoZSBwYWNrYWdlIHZlcnNpb24gaXMgdGhlIG1vc3QgcHJhY3Rp
Y2FsIGFuZCBtYWludGFpbmFibGUgc29sdXRpb24uIFdlIGFsc28gd2FudCB0byBlbnN1cmUgdGhh
dCB0aGUgdXBzdHJlYW0gTFRTIGJyYW5jaGVzIGFyZSBub3QgbGVmdCB2dWxuZXJhYmxlLCBzbyB3
ZSBhcmUgcHJlcGFyaW5nIHRvIHVwc3RyZWFtIG91ciBmaXhlcyB0byB0aGUgY29tbXVuaXR5Lg0K
V2UgaGF2ZSBub3RpY2VkIHNldmVyYWwgb3RoZXIgcmVjZW50IHVwZ3JhZGUgcmVxdWVzdHMgaW4g
dGhlIGNvbW11bml0eSAoZS5nLiwgZ2xpYmMsIGdudXBnLCBsaWJzc2gyLCB2aW0pLCBzbyBpbiB0
aGUgc2FtZSBzcGlyaXQsIHdlIGhhdmUgcHJlcGFyZWQgdXBncmFkZSBwYXRjaGVzIHRvIGFkZHJl
c3MgdGhlIENWRXMgZm9yIGJvdGggcnVuYy1vcGVuY29udGFpbmVycyBhbmQgZ28tYmluYXJ5LW5h
dGl2ZToNCg0KICAqICAgR286IHYxLjIyLjEyIKH6IHYxLjI0LjANCiAgKiAgIHJ1bmM6IHYxLjEu
MTQgofogdjEuMy4wDQoNCldlIHdvdWxkIGxpa2UgdG8gY29udHJpYnV0ZSB0aGVzZSB1cGdyYWRl
IHBhdGNoZXMgdG8gdGhlIGFwcHJvcHJpYXRlIGxheWVycy4gQ291bGQgeW91IHBsZWFzZSBhZHZp
c2Ugd2hldGhlciBzdWJtaXR0aW5nIHRoZXNlIHVwZ3JhZGVzIGlzIGFwcHJvcHJpYXRlIGluIHRo
aXMgc2NlbmFyaW8sIGFuZCBpZiBzbywgd2hhdCB0aGUgcmVjb21tZW5kZWQgcHJvY2VzcyB3b3Vs
ZCBiZT8NCkxvb2tpbmcgZm9yd2FyZCB0byB5b3VyIGd1aWRhbmNlLg0KVGhhbmsgeW91LA0KRGVl
cGFrDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogTWFya28sIFBldGVy
IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NClNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTMsIDIw
MjYgMzoyNiBBTQ0KVG86IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPjsg
RGVlcGFrIFJhdGhvcmUgLVggKGRlZXJhdGhvIC0gRSBJTkZPQ0hJUFMgUFJJVkFURSBMSU1JVEVE
IGF0IENpc2NvKSA8ZGVlcmF0aG9AY2lzY28uY29tPg0KQ2M6IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+OyBWaXJhbCBDaGF2ZGEgKHZjaGF2ZGEpIDx2Y2hhdmRhQGNpc2NvLmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSRTogW09FLWNvcmVdIENsYXJpZmlj
YXRpb24gb24gaGFuZGxpbmcgcmVjZW50IENWRXMgZm9yIGdvLWJpbmFyeS1uYXRpdmUgcGFja2Fn
ZQ0KDQoNClVwc3RyZWFtIChnby5kZXYpIHdpbGwgbm90IGhlbHAgdXMsIHRoZXkgaGF2ZSA2IG1v
bnRocyBMVFMgcG9saWN5IGNvbXBhcmVkIHRvIFlvY3RvIHdpdGggNCB5ZWFycy4NCg0KDQoNClRo
aXMgaXMgYSB1c3VhbCBwcm9ibGVtIGZvciBMVFMgZGlzdHJpYnV0aW9ucywgdGhlcmUgYXJlIGFs
d2F5cyBzb21lIG9wZW4gQ1ZFcyB3aGVyZSBiYWNrcG9ydGluZyBmaXhlcyBpcyB0b28gZGlmZmlj
dWx0IG9yIGV2ZW4gaW1wb3NzaWJsZS4NCg0KZ28tYmluYXJ5LW5hdGl2ZSBpcyB1bmZvcnR1bmF0
ZWx5IG9uZSBvZiB0aGVzZSBjYXNlcyB3aGVyZSBmaXhpbmcgQ1ZFcyBpcyBpbXByYWN0aWNhbC4N
Cg0KSXQgd291bGQgcmVxdWlyZSB1cyB0byBjaGFuZ2UgZ28gdG9vbGNoYWluIGJvb3RzdHJhcHBp
bmcgKHdpdGhvdXQgYW55IGNsZWFyIHZpc2lvbiBob3cpIG9yIHRvIGdlbmVyYXRlIHByZWNvbXBp
bGVkIGJpbmFyaWVzIG91cnNlbHZlcy4NCg0KDQoNClF1ZXN0aW9uIGlzIGlmIHRoZXJlIGlzIGFu
eSBwcmFjdGljYWwgYXR0YWNrIHBvc3NpYmxlIG9uIFlvY3RvIGdvIHRvb2xjaGFpbiBib290c3Ry
YXBwaW5nIHByb2Nlc3Mgb3IgaWYgc29tZW9uZSBoYXMgbmF0aXZlIGdvIHJlY2lwZXMgd2hlcmUg
aXQgd291bGQgYWxzbyBiZSB1c2VkLg0KDQpJZiB5b3UgYXJlIHdvcnJpZWQgYWJvdXQgdGhpcyBm
b3IgeW91ciBwcm9qZWN0LCBtZXRhLWx0cy1taXhpbnMgaXMgcHJvYmFibHkgdGhlIGVhc2llc3Qg
d2F5IGhvdyB0byBnZXQgcmlkIG9mIHRoZXNlIENWRXMgZnJvbSB5b3VyIHZ1bG5lcmFiaWxpdHkg
cmVwb3J0cy4NCg0KT3IgdG8gdXNlIGN1cnJlbnQgWW9jdG8gcmVsZWFzZSBpbnN0ZWFkIG9mIExU
UyB3aGljaCB3aXRoIGluY3JlYXNlIGFnZSBhbHdheXMgZ2F0aGVyIHVuZml4ZWQgQ1ZFcy4NCg0K
DQoNClBldGVyDQoNCg0KDQpGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWls
LmNvbT4NClNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxMiwgMjAyNiAxOTowNg0KVG86IGRlZXJh
dGhvQGNpc2NvLmNvbQ0KQ2M6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+OyBWaXJhbCBD
aGF2ZGEgKHZjaGF2ZGEpIDx2Y2hhdmRhQGNpc2NvLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc7IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIENsYXJpZmljYXRp
b24gb24gaGFuZGxpbmcgcmVjZW50IENWRXMgZm9yIGdvLWJpbmFyeS1uYXRpdmUgcGFja2FnZQ0K
DQoNCg0KSGkgRGVlcGFrLA0KDQoNCg0KVGhlIGdvLWJpbmFyeS1uYXRpdmUgd2FzIHVzZWQgdG8g
Ym9vdHN0cmFwIHRoZSBnbyB0b29sY2hhaW4sIHdlIHRha2UgaXQgZnJvbSB0aGUgb2ZmaWNpYWwg
Z28gdXBzdHJlYW0gaHR0cHM6Ly9nby5kZXYvZGwuDQpQZXJoYXBzIHRoaXMgaXMgdGhlIGlkZWFs
IHBsYWNlIHRvIHJlcG9ydCBzdWNoIHByb2JsZW1zLCBzbyB0aGF0IHRoZXkgY2FuIGNyZWF0ZSBu
ZXcgYmluYXJ5IHBhY2thZ2VzIHdpdGggdGhlIHJlZmVycmVkIENWRSBmaXhlZC4NCg0KDQoNCkpv
c2UNCg0KRGVlcGFrIFJhdGhvcmUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8aHR0cDovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IDxkZWVyYXRobz1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZzxtYWlsdG86Y2lzY28uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+PiBlc2NyZXZl
dSAocXVpbnRhLCAxMi8wMi8yMDI2IKikKHMpIDExOjE1KToNCg0KSGVsbG8gS2hlbSBSYWosDQoN
Cg0KDQpTZXZlcmFsIG5ldyBDVkVzIGhhdmUgYmVlbiBhc3NpZ25lZCB0byBnby1iaW5hcnktbmF0
aXZlIHBhY2thZ2UgKGFzIGxpc3RlZCBiZWxvdykuIEJhc2VkIG9uIHRoZSByZWNpcGUsIGl0oa9z
IGJlZW4gb2JzZXJ2ZWQgdGhhdCBpdCB1c2VzIHByZWJ1aWx0IGluc3RlYWQgb2YgYmVpbmcgYnVp
bHQgZnJvbSBzb3VyY2UgY29kZS4gQ2FuIHlvdSBwbGVhc2UgaGVscCB0byB1bmRlcnN0YW5kIHRo
ZSBwcm9jZWR1cmVzIGFuZCBob3cgd2UgY2FuIGFkZHJlc3MgYXBwbGljYWJsZSBDVkVzIGZvciB0
aGVzZSBwYWNrYWdlcz8gRG8gd2UgaGF2ZSBhbnkgaWRlbnRpZmllZCBwbGFuIHRvIGFkZHJlc3Mg
aXQ/DQoNCkNWRXMgYWZmZWN0aW5nIGdvLWJpbmFyeS1uYXRpdmU6DQoNCjEuICAgICAgICAgQ1ZF
LTIwMjUtNDY3NCAoQ1ZTUyA4LjYpIKhDIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1
bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyNS00Njc0DQoNCiAgMS4gIENWRS0yMDI1LTQ3OTA2IChD
VlNTIDYuNSkgqEMgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVs
bklkPUNWRS0yMDI1LTQ3OTA2DQogIDIuICBDVkUtMjAyNS00NzkwNyAoQ1ZTUyA3LjApIKhDICBo
dHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjUt
NDc5MDcNCiAgMy4gIENWRS0yMDI1LTQ3OTEyIChDVlNTIDUuMykgqEMgaHR0cHM6Ly93ZWIubnZk
Lm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1LTQ3OTEyDQogIDQuICBD
VkUtMjAyNS01ODE4NSAoQ1ZTUyA1LjMpIKhDIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3
L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyNS01ODE4NQ0KICA1LiAgQ1ZFLTIwMjUtNTgxODcg
KENWU1MgNy41KSCoQyBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92
dWxuSWQ9Q1ZFLTIwMjUtNTgxODcNCiAgNi4gIENWRS0yMDI1LTU4MTg4IChDVlNTIDcuNSkgqEMg
aHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1
LTU4MTg4DQogIDcuICBDVkUtMjAyNS01ODE4OSAoQ1ZTUyA1LjMpIKhDIGh0dHBzOi8vd2ViLm52
ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyNS01ODE4OQ0KICA4LiAg
Q1ZFLTIwMjUtNjE3MjMgKENWU1MgNy41KSCoQyBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmll
dy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjUtNjE3MjMNCiAgOS4gIENWRS0yMDI1LTYxNzI0
IChDVlNTIDUuMykgqEMgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDI1LTYxNzI0DQogIDEwLiBDVkUtMjAyNS02MTcyNiAoQ1ZTUyA3LjUpIKhD
IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAy
NS02MTcyNg0KICAxMS4gQ1ZFLTIwMjUtNjE3MjcgKENWU1MgNi41KSCoQyBodHRwczovL3dlYi5u
dmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjUtNjE3MjcNCiAgMTIu
IENWRS0yMDI1LTYxNzI4IChDVlNTIDYuNSkgqEMgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3Zp
ZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1LTYxNzI4DQogIDEzLiBDVkUtMjAyNS02MTcy
OSAoQ1ZTUyA3LjUpIKhDIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAyNS02MTcyOQ0KICAxNC4gQ1ZFLTIwMjUtNjE3MzAgKENWU1MgNS4zKSCo
QyBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIw
MjUtNjE3MzANCiAgMTUuIENWRS0yMDI1LTYxNzMxIChDVlNTIDcuOCkgqEMgaHR0cHM6Ly93ZWIu
bnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1LTYxNzMxDQogIDE2
LiBDVkUtMjAyNS02ODExOSAoQ1ZTUyA3LjApIKhDIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92
aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyNS02ODExOQ0KICAxNy4gQ1ZFLTIwMjUtMjI4
NzMgKENWU1MzOiAzLjgpIC0gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRh
aWw/dnVsbklkPUNWRS0yMDI1LTIyODczDQogIDE4LiBDVkUtMjAyNS02MTczMiAoQ1ZTUzM6IDgu
NikgLSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZF
LTIwMjUtNjE3MzINCiAgMTkuIENWRS0yMDI1LTY4MTIxIChDVlNTMzogMTAuMCkgLSBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjUtNjgxMjEN
Cg0KVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UuDQoNClJlZ2FyZHMsDQpEZWVwYWsgUmF0aG9yZQ0K
DQoNCg0KLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVz
c2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KVmlldy9SZXBseSBPbmxpbmUgKCMyMzEwMjIpOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdl
LzIzMTAyMg0KTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bXQvMTE3NzcyNDI0LzUwNTI2MTINCkdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25l
ckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZSUyQm93bmVy
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3F1YXJlc21hLmpvc2VAZ21h
aWwuY29tPG1haWx0bzpxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT5dDQotPS09LT0tPS09LT0tPS09
LT0tPS09LQ0KDQoNCg0KDQotLQ0KDQpCZXN0IHJlZ2FyZHMsDQoNCkpvc6imIFF1YXJlc21hDQo=

--_000_DM4PR11MB61899172543CF4E54D8FE945C46DADM4PR11MB6189namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">Hello Peter and Jose,</span></div>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">Thank you for your responses regarding the r=
eported issues.</span></div>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">I would like to confirm that all the CVEs me=
ntioned are indeed applicable to our project, as well as to any setup that =
enables these vulnerable packages. Our Yocto source is closely aligned with=
 the upstream Yocto repository, and
 we regularly sync with the community. We have been addressing CVEs for the=
 packages from community and upstreaming fixes whenever possible.</span></d=
iv>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">However, we have observed that the <code>go-=
binary-native</code>&nbsp;recipe depends on a prebuilt binary instead of bu=
ilding Go from source, which prevents us from applying CVE patches directly=
.</span></div>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">We are facing similar challenges with <code>=
runc</code>&nbsp;package in the meta-virtualization layer where backporting=
 CVE fixes to the Scarthgap LTS version is not feasible due to significant =
upstream code changes. In such cases, we
 believe that upgrading the package version is the most practical and maint=
ainable solution. We also want to ensure that the upstream LTS branches are=
 not left vulnerable, so we are preparing to upstream our fixes to the comm=
unity.</span></div>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">We have noticed several other recent upgrade=
 requests in the community (e.g., glibc, gnupg, libssh2, vim), so in the sa=
me spirit, we have prepared upgrade patches to address the CVEs for both
<code>runc-opencontainers</code>&nbsp;and <code>go-binary-native</code>:</s=
pan></div>
<ul>
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); line-h=
eight: 20px;" class=3D"elementToProof">
<span role=3D"presentation" class=3D"elementToProof"><b>Go:</b>&nbsp;v1.22.=
12 =A1=FA v1.24.0</span></li><li style=3D"font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); line-height: 20px;" class=3D"elementToProof">
<span role=3D"presentation" class=3D"elementToProof"><b>runc:</b>&nbsp;v1.1=
.14 =A1=FA v1.3.0</span></li></ul>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">We would like to contribute these upgrade pa=
tches to the appropriate layers. Could you please advise whether submitting=
 these upgrades is appropriate in this scenario, and if so, what the recomm=
ended process would be?</span></div>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">Looking forward to your guidance.</span></di=
v>
<div style=3D"line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof=
">
<span class=3D"elementToProof">Thank you,</span><br>
<span class=3D"elementToProof">Deepak</span><span style=3D"font-family: Cal=
ibri, Arial, Helvetica, sans-serif; font-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Marko, Peter &lt;Peter.Marko@siemens.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, February 13, 2026 3:26 AM<br>
<b>To:</b>&nbsp;Jose Quaresma &lt;quaresma.jose@gmail.com&gt;; Deepak Ratho=
re -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;deeratho@cisco.=
com&gt;<br>
<b>Cc:</b>&nbsp;Khem Raj &lt;raj.khem@gmail.com&gt;; Viral Chavda (vchavda)=
 &lt;vchavda@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;RE: [OE-core] Clarification on handling recent CVEs fo=
r go-binary-native package
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">Upstream (=
go.dev) will not help us, they have 6 months LTS policy compared to Yocto w=
ith 4 years.</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">&nbsp;</sp=
an></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">This is a =
usual problem for LTS distributions, there are always some open CVEs where =
backporting fixes is too difficult or
 even impossible.</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">go-binary-=
native is unfortunately one of these cases where fixing CVEs is impractical=
.</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">It would r=
equire us to change go toolchain bootstrapping (without any clear vision ho=
w) or to generate precompiled binaries
 ourselves.</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">&nbsp;</sp=
an></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">Question i=
s if there is any practical attack possible on Yocto go toolchain bootstrap=
ping process or if someone has native
 go recipes where it would also be used.</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">If you are=
 worried about this for your project, meta-lts-mixins is probably the easie=
st way how to get rid of these CVEs
 from your vulnerability reports.</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">Or to use =
current Yocto release instead of LTS which with increase age always gather =
unfixed CVEs.</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">&nbsp;</sp=
an></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">Peter</spa=
n></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt;">&nbsp;</sp=
an></p>
<div style=3D"padding-left: 4pt; border-left: 1.5pt solid blue;">
<div style=3D"padding-top: 3pt; border-top: 1pt solid rgb(225, 225, 225);">
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-family: Calibri, sans-serif; font-size: 11pt;"><b>From:=
</b>&nbsp;Jose Quaresma &lt;quaresma.jose@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, February 12, 2026 19:06<br>
<b>To:</b>&nbsp;deeratho@cisco.com<br>
<b>Cc:</b>&nbsp;Khem Raj &lt;raj.khem@gmail.com&gt;; Viral Chavda (vchavda)=
 &lt;vchavda@cisco.com&gt;; openembedded-core@lists.openembedded.org; Marko=
, Peter (FT D EU SK BFS1) &lt;Peter.Marko@siemens.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] Clarification on handling recent CVEs fo=
r go-binary-native package</span></p>
</div>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
&nbsp;</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
Hi Deepak,</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
&nbsp;</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
The go-binary-native was used to bootstrap the go toolchain, we take it fro=
m the official go upstream
<a style=3D"margin-top: 0px; margin-bottom: 0px;" data-auth=3D"NotApplicabl=
e" class=3D"OWAAutoLink" id=3D"OWAfb62742a-561b-9a85-dc40-677ea41cd70e" hre=
f=3D"https://go.dev/dl">
https://go.dev/dl</a>.<br>
Perhaps this is the ideal place to report such problems, so that they can c=
reate new binary packages with the referred CVE fixed.</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
&nbsp;</p>
<p style=3D"margin: 0px 0px 12pt; font-family: Aptos, sans-serif; font-size=
: 12pt;">
Jose</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
Deepak Rathore via
<a style=3D"margin-top: 0px; margin-bottom: 0px;" data-auth=3D"NotApplicabl=
e" class=3D"OWAAutoLink" id=3D"OWA814b9c1e-0ab3-0f78-4a7a-0c3c217e8dc7" hre=
f=3D"http://lists.openembedded.org">
lists.openembedded.org</a>&nbsp;&lt;deeratho=3D<a style=3D"margin-top: 0px;=
 margin-bottom: 0px;" class=3D"OWAAutoLink" id=3D"OWAf83fcae2-0901-7020-2ba=
3-b3d43d217c0e" href=3D"mailto:cisco.com@lists.openembedded.org">cisco.com@=
lists.openembedded.org</a>&gt; escreveu (quinta, 12/02/2026
 =A8=A4(s) 11:15):</p>
<blockquote style=3D"margin: 5pt 0px 5pt 4.8pt; padding-left: 6pt; border-l=
eft: 1pt solid rgb(204, 204, 204);">
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-size: 11pt; color: black;">Hello Khem Raj,</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-size: 11pt; color: black;">&nbsp;</span></p>
<div style=3D"margin-bottom: 12pt;">
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-size: 11pt; color: black;">Several new CVEs have been a=
ssigned to go-binary-native package (as listed below). Based on the recipe,=
 it=A1=AFs been observed that it uses prebuilt
 instead of being built from source code.&nbsp;Can you please help to under=
stand the procedures and how we can address applicable CVEs for these packa=
ges? Do we have any identified plan to address it?</span></p>
</div>
<div style=3D"margin-bottom: 12pt;">
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-size: 11pt; color: black;">CVEs affecting go-binary-nat=
ive:</span></p>
</div>
<p style=3D"text-indent: 0px; line-height: 18pt; margin: 0px 0px 0px 36pt; =
font-family: Aptos, sans-serif; font-size: 12pt;">
<span style=3D"font-size: 11pt; color: black;">1.</span><span style=3D"font=
-family: &quot;Times New Roman&quot;; font-size: 7pt; color: black;">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size: 11pt; color: black;">CVE-2025-4674 (CVSS 8=
.6) =A8C </span>
<span style=3D"font-size: 11pt;"><a style=3D"margin-top: 0px; margin-bottom=
: 0px;" data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA124ea4f0=
-e416-2327-d8ed-71e2fe779523" href=3D"https://web.nvd.nist.gov/view/vuln/de=
tail?vulnId=3DCVE-2025-4674">https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-2025-4674</a></span></p>
<ol style=3D"margin-bottom: 0px;" start=3D"2">
<li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: black;=
 line-height: 18pt; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-47906 (CVSS=
 6.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA38=
603d97-0ab2-e488-266b-d1cdb7f767af" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-47906">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47906</a>&nbsp;=
</span></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; c=
olor: black; line-height: 18pt; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-47907 (CVSS=
 7.0) =A8C&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D=
"OWAb601bcac-5b9a-55ba-2595-2edf4de0cb11" href=3D"https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2025-47907">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47907</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; line-height: 18pt; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-47912 (CVSS=
 5.3) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA3f=
5cf45a-6c02-be43-c848-97b095417c05" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-47912">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47912</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-58185 (CVSS=
 5.3) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAf7=
7c4151-1b11-f316-ba40-90ad237c174b" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-58185">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58185</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-58187 (CVSS=
 7.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA4d=
041358-1fbf-f974-da26-9ef6edf5f7d3" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-58187">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58187</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-58188 (CVSS=
 7.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA43=
cc544a-7fc2-b5ec-699b-779cb475b244" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-58188">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58188</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-58189 (CVSS=
 5.3) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA07=
e97b9e-aef7-027f-77bd-1e837aeedb89" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-58189">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58189</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61723 (CVSS=
 7.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAa1=
3915eb-429e-23c6-be25-3ba5170f5ae2" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61723">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61723</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61724 (CVSS=
 5.3) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAa3=
fcda29-e8eb-cc3e-3f06-46d1be58d0a2" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61724">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61724</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61726 (CVSS=
 7.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAc2=
f7015c-9aa3-d686-2519-5bdebbfac71d" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61726">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61726</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61727 (CVSS=
 6.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAae=
cd2829-c607-0fbd-af1b-8cd7c876e319" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61727">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61727</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61728 (CVSS=
 6.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA41=
4c650b-fcd8-ead2-f76f-1591b323e4a3" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61728">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61728</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61729 (CVSS=
 7.5) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA4c=
aef1d1-3c35-7498-833b-0d5d6d74a165" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61729">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61729</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61730 (CVSS=
 5.3) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA10=
6841a7-b956-8d02-15dd-c0e9062db47a" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61730">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61730</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61731 (CVSS=
 7.8) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA8f=
1b3ca7-f307-e0eb-977f-ca78e1fba3d6" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-61731">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61731</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-68119 (CVSS=
 7.0) =A8C <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA09=
ec4203-a735-7acd-7cce-e6b436e8cc59" href=3D"https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2025-68119">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68119</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-22873 (CVSS=
3: 3.8) - <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA7c0=
460ec-b8b9-b629-2d44-6da2bd09b8f9" href=3D"https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2025-22873">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22873</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-61732 (CVSS=
3: 8.6) - <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAdef=
2b6e0-30cd-9086-5e13-7e83523d31a0" href=3D"https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2025-61732">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61732</a></span=
></li><li style=3D"font-family: Aptos, sans-serif; font-size: 12pt; color: =
black; margin: 0px;">
<span role=3D"presentation" style=3D"font-size: 11pt;">CVE-2025-68121 (CVSS=
3: 10.0) -
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA29981521-4cb6=
-fad3-dc5f-52a225f00762" href=3D"https://web.nvd.nist.gov/view/vuln/detail?=
vulnId=3DCVE-2025-68121">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68121</a></span=
></li></ol>
<div style=3D"margin-bottom: 12pt;">
<p style=3D"line-height: 18pt; margin: 0px; font-family: Aptos, sans-serif;=
 font-size: 12pt;">
<span style=3D"font-size: 11pt; color: black;">Thanks for the guidance.</sp=
an></p>
</div>
<p style=3D"line-height: 18pt; margin: 0px; font-family: Aptos, sans-serif;=
 font-size: 12pt;">
<span style=3D"font-size: 11pt; color: black;">Regards,<br>
Deepak Rathore</span></p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<span style=3D"font-size: 11pt; color: black;">&nbsp;</span></p>
<p style=3D"margin: 0px 0px 12pt; font-family: Aptos, sans-serif; font-size=
: 12pt;">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#231022): <a style=3D"margin-top: 0px; margin-bottom: 0p=
x;" data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAeec7e031-424=
2-c093-7774-7189181e48e9" href=3D"https://lists.openembedded.org/g/openembe=
dded-core/message/231022">
https://lists.openembedded.org/g/openembedded-core/message/231022</a><br>
Mute This Topic: <a style=3D"margin-top: 0px; margin-bottom: 0px;" data-aut=
h=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAb886045d-fa24-86c8-f5b3-=
8a22cbcc89a9" href=3D"https://lists.openembedded.org/mt/117772424/5052612">
https://lists.openembedded.org/mt/117772424/5052612</a><br>
Group Owner: <a style=3D"margin-top: 0px; margin-bottom: 0px;" class=3D"OWA=
AutoLink" id=3D"OWA1bd90b24-c29d-89b3-cd45-d058f80bd0d8" href=3D"mailto:ope=
nembedded-core%2Bowner@lists.openembedded.org">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a style=3D"margin-top: 0px; margin-bottom: 0px;" data-auth=3D=
"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAc02c9873-8116-36ed-9164-0f29=
8b37c508" href=3D"https://lists.openembedded.org/g/openembedded-core/unsub"=
>
https://lists.openembedded.org/g/openembedded-core/unsub</a>&nbsp;[<a style=
=3D"margin-top: 0px; margin-bottom: 0px;" class=3D"OWAAutoLink" id=3D"OWAd9=
23d55b-b0c6-ddd3-9cb0-0ee47a1160ab" href=3D"mailto:quaresma.jose@gmail.com"=
>quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</p>
</blockquote>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<br>
</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
&nbsp;</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
--</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
Best regards,</p>
<p style=3D"margin: 0px; font-family: Aptos, sans-serif; font-size: 12pt;">=
<br>
Jos=A8=A6 Quaresma</p>
</div>
</body>
</html>

--_000_DM4PR11MB61899172543CF4E54D8FE945C46DADM4PR11MB6189namp_--

