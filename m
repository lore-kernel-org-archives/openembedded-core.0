Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FF8CD37BD
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 01:25:24 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web10.40133.1725413121234381126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 18:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=CoEqxGLZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1725413121; x=1756949121;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=450Zo7jpZlw/KdjSbfDe1bBHypt9f39a0pH3bvKE3F8=;
  b=CoEqxGLZdjOZNd6VxxlgHDNN9vFL3Eyqh17A4C4cw8qcEfnk29yHqymD
   MmYtky6qtppG2dljb1uV9Fc2SIgr1eVoUJ4PKKRkrVAbwOvWTcrB40bdn
   HfWOSBNPs1u6adGv6mrW4nhdXCDfs4ykXjysATTzRoWEvy0SOkGZpnfZa
   Yqvd+pL7qRy3NX7xfR1wwvnxdRdBZufX13ya2t+AjeAj5UlZEVNgEwRdo
   94Et66n6CF3gs4ap35sKlQpgo/708U0wXPjtFLcLThVQLdCbfhUlYVdf+
   ewYgkizTFhblZck61QiKdbbl4t/ZdWpOdSzu1Py4xs79dnyV/0eTqmvbw
   w==;
X-CSE-ConnectionGUID: xsQsJiOGSrKSbnfl9nPpoQ==
X-CSE-MsgGUID: aqNHn0ZASsOaFpnVoNfAmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="130186422"
X-IronPort-AV: E=Sophos;i="6.10,200,1719846000"; 
   d="scan'208";a="130186422"
Received: from mail-japanwestazlp17010005.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 10:25:18 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRnTsgdnXRR/cboyPHZz8eehZFZ9UOZM7VNlFtfzsa2Q67XuEzf9kewgeAoRImKRpoqPNK+qv759e34/DfQGTwvlrdhqlHbE4mmpranyFvIADm1Ues7pIQElGJyynr6cpuXTdQbZxIqDojmUhl8ciIzLxATlbzlPh2e6YMbG3+bvhFFnoNzEZfHg/Rn5u179B1V9HH0zLMijKwlWaRX9jId8O5/38RRo3eXxD/kknyvOCE+8gmA7uksutwHMoLYEaxivYXYwoLa6z8oQ090WYHj12+jIKgXS/xZM9HCd14Zs1h0TgreXidJQKZRVkm0TMVRufVbA3/omt1qB2vcxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=450Zo7jpZlw/KdjSbfDe1bBHypt9f39a0pH3bvKE3F8=;
 b=C0ke0eYzkkyt7zPGbKGEH/eHaqxArx72BhbYlHc0p6/O1yYqdQr+Lugh6Ivyq2ezOQH+HnSOieu/rcZdoutCXm5sTw+6vu4jaQ+11d4sRWimrzYV6Lou2LpahkQmiZd/I0GOM6AoHhoOddyrZyEm4Qoh9eRMDspY9dS48XCfgfz8VtqlFG/2nvNVmLOee+0UyC5sXjC08hCROsIgl97L0qxbqpIvIUAr+5rlQyR4Yprq9OM5fhAkChUQZ1KXdkXyQ5JZ+ZIKUrWnwHG9QoDw+bKqpPcK++yMzVwWFeL/DXmJ/YtRYtpLWPOHF+Y3hLDtRBMTkSEHkJD7EAMjgT2jWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYCPR01MB11462.jpnprd01.prod.outlook.com
 (2603:1096:400:38a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 01:25:12 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 01:25:12 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
Thread-Topic: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
Thread-Index: AQHa/dvum2Yv2cjVHE2/cNm7Bqfbf7JGmw+AgAA6iRA=
Date: Wed, 4 Sep 2024 01:25:11 +0000
Message-ID: 
 <TYWPR01MB11861E7CD3D6346AD5F7A1748DC9C2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
	 <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
 <42ac587c4e691d9c2526e9088de9bc27bb92b0b9.camel@linuxfoundation.org>
In-Reply-To: 
 <42ac587c4e691d9c2526e9088de9bc27bb92b0b9.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9Y2IwYzdiMmQtMzViOC00OWJhLTgxNGEtMzA4OTgzMDEx?=
 =?utf-8?B?YjJjO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDktMDRUMDE6MjA6NDFaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYCPR01MB11462:EE_
x-ms-office365-filtering-correlation-id: 3f1b8a3f-29f9-4442-a628-08dccc806c0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TTRXQStzQVUxZVc0Ui9XK2tiTDNrUnUzQUF2alkvL1dnd0owcVBxSHhaVXRh?=
 =?utf-8?B?MUp0T1VBKzhmaTNYV3RCQjcwNDdlVXZvYUJqdmNISXFmZGVRQXFiZ3ltMjFq?=
 =?utf-8?B?MjZvYTJ1THBVaU1lUUpRWWZpUnFSMGNIT3ZRQWZNbkFFY1c1VWVDcmt1djZm?=
 =?utf-8?B?ZUduUUdKem5USXJFQ1VJaXlscXkwQ1VObUNkZElQRjkwcjNTcTFmenhaZEQ2?=
 =?utf-8?B?aEhHSzNLckx1aVl5NGJHbCtabFdGczZ2L1JDMzRXajZQQzVwMkpacUNQU05V?=
 =?utf-8?B?am9CQUZWWmtmRE5YMmZ5NDlzcUk2SWZacjdNaDliTHR0eXd0OUQvOXBDZXla?=
 =?utf-8?B?YzJ3OXNDVDUrTkp2MHhYRys3Tzd4UUExSVYwQUpnOTYrVmZsRTVRU0psa3c3?=
 =?utf-8?B?N1JZaWJOM0dYRWRPUVkyUE8xTWNVL2E1QURHbWl4cjZHVmhCSzJpRFQvaTdV?=
 =?utf-8?B?Y0trVDBreEFtUXJTVXdFSHZjd2o4UVhCclBMUjNTNXQ3ODFIbDNiQ0EwRXE0?=
 =?utf-8?B?K25WMlVESkhFbDVjYlV3WEIzdVgrSFhObnEycWhTWkJDRFhCUm1uMkM1L0VZ?=
 =?utf-8?B?SWFlTm9ZL3BMMGdPUk1qZmV5MlZzRGVHZ3NrOWM0dmt0K3cvOXhDQkRRN2R1?=
 =?utf-8?B?UjV4dk41QlBuOGdreGh1QWdRV0dMV2lVL256dXlvSkFFTTRiRmZudm1ERVJi?=
 =?utf-8?B?NnZJZ1I1dTBzdElxYnp4REtDTEwzVWpwVEJ3OFI0RXNEUHBOU3JweCs3Qms0?=
 =?utf-8?B?QnRSTDUxQmNSWHFTc2FKSHVwZ2pJZ3NEeld2YytMc2c2R1dsbGtIWU05RjJa?=
 =?utf-8?B?Vk9KRVZWdzJQSGhFQWZLc3doeVQxZGRCUkY0UTBjYjREcWVweWl1Y2p3YlU0?=
 =?utf-8?B?TlpVbVRtSlFJNTlXV3RTVWYzMEZ3T1VjN1BkeFJEMjcyd1ExNERPQ1JEcFho?=
 =?utf-8?B?VUVXWnVRQXJ1QTVab3dkSXA2dkRDZVIwOWN6Vjlvd1ozRGs3ZmFPdEZOamtX?=
 =?utf-8?B?ZlR0QXNVSGwydzVMQ2RLRWNkUjg0azB0U3Z2TTVnN2FpYnZpNkIyditKeFdR?=
 =?utf-8?B?QWsxVGtYL2txeVVsV2tabWdFSnRTS08wMEZMUi9xb291ZGQ0ZitKSTJUTm0x?=
 =?utf-8?B?eGFLZU5CU3RTdHExMUdvQ3VaSUd6cThPYUkxeVB0d05iSE1Yc21Ba2pQZjNm?=
 =?utf-8?B?d1dzSkhSeXplckRDaFcwY1lJNW5mcVI1ckE4TmhNaDdDd28rWkVhRmdjMW45?=
 =?utf-8?B?VFdHcHFzM1dwZHhWRHhzNEtRdzhONkZXeEU4VEtiRU5rTFJlZHNWQWZibktJ?=
 =?utf-8?B?ZlhOM0NqVjNjdlpINXNRNEFpQkxuZlVkS2lWVFd6bVd0WUhuNkpjbDRsNDho?=
 =?utf-8?B?dytKNVB3VXNTa2ZQL1p6SmI1T2Y3NUV3V0tEdjZiNlcyNm1qNVpxNnMxN2RF?=
 =?utf-8?B?K0dyOG1PUHZGcWZBSEJodUpVZkhqLzFQSEYyYVkzWXdrelJudjhHWW56Z1ZW?=
 =?utf-8?B?Y3BhR1lLWnpHdU5OV0Zmb1lHbTdMT3k5d3FOejFzZUg3ckh3Zmx4N0JXTjVV?=
 =?utf-8?B?RUhIamdsMlpoQzJXQmhoYTR0WklqanEyVFVOdWo1OHQwWWNpenUzQlprUWxr?=
 =?utf-8?B?SXRrS3V2N0l1UjlvOW0rQW9CditEbFR1OGwwd0t3aFZwNXdSTnNIQlB6QTBK?=
 =?utf-8?B?c3d0WnViMGQ5eHoxTVRFcGh5dUs1RytqMXBMbU91cVdkUjRCa3JDZ1hSVit4?=
 =?utf-8?B?N25FS1VwS2RWV2kvd3p5RHdiNzg2NzgvbXZxMkdMMmtGY1NmL3pucHVHZm44?=
 =?utf-8?B?VVd6NjdOOGN1aUwvN2lHb3UwQ05LN2tDMHNsUmx3NUJoNitGMlFXcFBJV2pz?=
 =?utf-8?Q?RmlPz64dScW4O?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUpmdjY3SlNuWTJVQ1VBdUJxcHoySmRnTkJGd0RIZlc5NlF2OWVJM0NrdnNt?=
 =?utf-8?B?bk5WRytmbkhDUUpQc2JydWd2WFZZN1gyQXFvZi93UGlneWN5RGNDbDFyYlVr?=
 =?utf-8?B?T2hkaDRvbGo4ZE96Ky9zQ1VhSU5xSUlSUWNSTjN1dDRvb0t2eG5IV2VoZWQ1?=
 =?utf-8?B?NXY1M3ZHM3FDK3Y4TTdXc3E1N3lDUmdkdzlnazhldmFUL2pmNVg1ZVZQWUxP?=
 =?utf-8?B?aTJmZGdsRE4xcWxzN1JxR2tiK29XNWNKVGJ3Uk9MM0xHRWJPVXltUjB2YmFz?=
 =?utf-8?B?VVRLMUlJYitqYkNHcGJVNlBMemN5TDVZaUM0TG5MeVdGc1AydUNFR29MZjhT?=
 =?utf-8?B?NGFMWkdtNGNINWNoY2RzYW1GVWFEcy9xTlNpZWV3UWh0VTNmc3cyM1JZV25j?=
 =?utf-8?B?OGRPVFBVWjVmc0pCUWl3LzUyczl1cGZxTFNxRE54MUV0eFB6OXp2cTA3c2dK?=
 =?utf-8?B?VDZWN0pVc1NCTjBiY0d4M2NRUGVlTi9OUHNlTTdGMzAyeHJBNGhIeU45djh6?=
 =?utf-8?B?Q3FtaWkrdTFtZEVvVENIVnlGUElMSUNxRDJSUnI5VTBEOVNhOXpHWmw4OFI1?=
 =?utf-8?B?czBCS2IzSnRORys4cUJXOFBORW1ZYW9nVisxTFdQN1RSV3BUZXh6eHorRzY4?=
 =?utf-8?B?MGt6ZmE0QVliZCtKTkorMWdwNWtLTElaZ0xHeDFkdmxpZm5FYjZidWc5TFV2?=
 =?utf-8?B?Z2VjelIvaGwzU3F0Rlh1dHkxell2bXVDUlVlNlNOZXk2TitQcmx0Um9hT1Bl?=
 =?utf-8?B?UEFUNFNpSWNhODlBejUzNm9ZUFJWMzZYZjQwUWIvQU55T3BPWVpiK2M3c0du?=
 =?utf-8?B?RlF0clhPNXF1blY0TENJSHJRZGVpTmdyZXZBd2krdWRueEMxbTlLd2RDMDVi?=
 =?utf-8?B?d0w2ZWlORnYyRzVMTkxKeXdpZVpWKzJrclJsem42Um1McU56ZFlONURYVFl1?=
 =?utf-8?B?YmpidjNyUHNBRW1HOVgyN09oNk9GS0cwTlQ3Y1ZEa2NvajlDSVpNcStaRHZE?=
 =?utf-8?B?amYycjZYZG9XNlBFV05vSmdYenJyQ0YrMzBGV0VwUkFVQUk0Q2VPS3dsR1NX?=
 =?utf-8?B?SzZLUTI5UGUrSmtab3M0ckVpaE1IenhFTzVnMDE4SitocE5YMzhWaTRnblZL?=
 =?utf-8?B?aWc5RUVaQnRhcmsvYzRPOVo1UE9ZM3MxNCtEbm1iZ1VxTmluMjhUNWJrT3I0?=
 =?utf-8?B?bFpjVG5JSDdOM09iVG9SRCsvTjVZc2c0cVREekgzdGl0TWJrcGxhdzYxVTJ6?=
 =?utf-8?B?b3l4NmJXaEVrbFlZY053VlhVMzkyaUdmT1ZrbDI0cnE1ei9QU2gxZWhVLzI4?=
 =?utf-8?B?T3UzSWFyTkxRZm5jU3FkbU80a0VhRlFjMzJqS3k5WjN0T3NxMkE0VG9FK1FN?=
 =?utf-8?B?SkZTbHA4Y2JpZGxOSW9hamFxcDVqR1YrSVZLOE1QK1d0TmVtSHQ4dVd5OWZQ?=
 =?utf-8?B?cGc3TSt2emJvVlRIVDJrVTJUV1VqOEZBMEZwT3BPVU91YVJyNHUzVkNxZmVj?=
 =?utf-8?B?MEVSUHFESXhiT2x0cnhCOVpBK21qT3VvUWx0aFJXbnBpa0JXREtnOTc3bm9Q?=
 =?utf-8?B?V09rU1dUeEFXM1p5NjFXZEVKRU9CeUtoNEY3ZmNTeWlJT1ViamQrb2pLTjVZ?=
 =?utf-8?B?MVRYV2JaRWlLcUVWdU1zaTN2clZDdTNlTmdZU2tyVDVKM1Fpb1RlVjlIeXJP?=
 =?utf-8?B?OFBqVWYvejMvOUJ3STg4amdIaU43bllkNVI3SzF6RlV4T2VFTWgxenZLbTZC?=
 =?utf-8?B?YmZaZCsvbDAyd1BNOEZUa0phNDhWQzJpSEV0Sm44V0VjMHRXSmtTbm53UStJ?=
 =?utf-8?B?ZTRoQVNWK2ovWFlidWh3VkJCb2NGRlZTWWd1RU9PdmdLMGVTMUtLQW5JcG8r?=
 =?utf-8?B?UUIvekk3WDJQei9LQ3o3Z3ZxVzN6RW5jMGRjS0F3cjM4bHMvMkJJbDlwVjdZ?=
 =?utf-8?B?elo1QlAxejQ4SmN6MndOeng1cnZZdHRnODU0RWp6WU5ycVlocE1FOG1VOGF4?=
 =?utf-8?B?YWtNdW1tVUZrSzRVZjlidnh6QzdZM1YrMmFublgrc0QvZkRkRGlvWEk2RlEr?=
 =?utf-8?B?RVdSeUVtNXVNcHkxeTlLZHNma1ZDNTliVWllNjFBL05qZHpBM2tEdHNDUDhD?=
 =?utf-8?Q?gFTbZprB182Xk06gSunUnFGDJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0nskqZloKoa+T5IOBbArOst6qad+x4a9usLwHIw6kRgPUBNDXxHZjcXxsPHWv9MZOGwhGZR2g9QnK0FxGsjcVC4PVUkLCorVjM0MxRZelP0svJR6qa8SsTgcB48exHe6yjNS9zf6BTxG2yij/hUhHCZhcRbxcXgRpL08a61vY+TpdLHz5ed71RWv0tykgHWdt0uoefZv8XoRUzfnhyyAep/b1h72oGKbWucTnXWHFzHcu7XfOvPDis+SgNpKQq9teLa5YiO2T3oFgC4rJszbQC3lBVWOr7UHd5x8YqAm4iAF3ZcoPMAwtBtTbIWi6Oq8RmmC3lMQ61E5760YdxOkmK83l/9eorVPtQ3uN3XRiDgEYPK6IXrxfjIbvEhppeZNpw9aUiUakQsQfMoVxJ80IQq+gLgV5gtI+tas8RZsJMjHBiw6dMha3BfIXUI/p6IJK+TUQEtHCytNT6wdMUyfNhiBoEGKzwE2AWrJsE6JsD80LLdLWuxQ6lA3pmoAVt2/t0L+RVMLpN3fB6uUPoWBQYLgPghsyu/EMGYGe/XRjAjJChgjzzKsXAGoeB5vVlVN63v2rdQE7ddkV7T7JqSVa27CCY65CWRgPebA4t7uy43cmGQgp1yMRw8gfVqbj6r1
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1b8a3f-29f9-4442-a628-08dccc806c0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 01:25:11.9779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1Lme7gHM+c70/cnuwItOMx4fWeSt0Qdz/eB5etvOI53XGaWAnM90mBIbZasnPGQBTR6s8zNzFtO1gA5AJ2M+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 01:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204181

SSBzZXQgbWFjaGluZT1xZW11eDg2XzY0LCBESVNUUk89InBva3ktYWx0Y2ZnIiwgYnV0IEkgZGlk
IG5vdCByZXByb2R1Y2UgdGhpcyBpc3N1ZS4NCklzIHRoZXJlIGFueSBvdGhlciBzZXR0aW5nIG5l
Y2Vzc2FyeT8NCg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcg
U09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBO
YW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5T
OiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNv
bQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXks
IFNlcHRlbWJlciA0LCAyMDI0IDU6NTEgQU0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55Gc
IDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDA2LzIyXSBqc29uLWds
aWI6IHVwZ3JhZGUgMS44LjAgLT4gMS4xMC4wDQo+IA0KPiBPbiBUdWUsIDIwMjQtMDktMDMgYXQg
MTY6MzIgKzA4MDAsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToN
Cj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gTGlj
ZW5zZS1VcGRhdGU6IEFkZCBjb3B5cmlnaHQgYW5kIGxpY2Vuc2luZyBtZXRhZGF0YSB0byBhbGwg
ZmlsZXMNCj4gPg0KPiA+IENoYW5nZWxvZzoNCj4gPiA9PT09PT09PT09DQo+ID4gLSBJbXByb3Zl
IGNvbmZvcm1hbmNlIG9mIHRoZSBKU09OIHBhcnNlcg0KPiA+IC0gQWRkIGNvbmZvcm1hbmNlIHRl
c3Qgc3VpdGUgZnJvbQ0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9uc3QvSlNPTlRlc3RTdWl0ZQ0K
PiA+IC0gQWRkIEpzb25QYXJzZXI6c3RyaWN0IHRvIGVuYWJsZSBzdHJpY3QgcGFyc2luZw0KPiA+
IC0gQWRkICctLXN0cmljdCcgdG8ganNvbi1nbGliLXZhbGlkYXRlIHRvIGVuYWJsZSBzdHJpY3Qg
cGFyc2luZw0KPiA+IC0gRGVwcmVjYXRlIHRoZSBzaWduYWxzIG9uIEpzb25QYXJzZXINCj4gPiAt
IFBvcnQgdG9vbHMgbWFuIHBhZ2VzIGZyb20gRG9jQm9vayB0byByZVN0cnVjdHVyZVRleHQNCj4g
PiAtIEFkZCAiZG9jdW1lbnRhdGlvbiIgY29uZmlndXJhdGlvbiBvcHRpb24sIGFuZCBkZXByZWNh
dGUgImd0a19kb2MiDQo+ID4gLSBBZGQgSnNvbkdlbmVyYXRvci50YWtlX3Jvb3QoKQ0KPiA+IC0g
RG9jdW1lbnRhdGlvbiBpbXByb3ZlbWVudHMgZm9yIEpzb25SZWFkZXINCj4gPiAtIFJhaXNlIHBh
cnNlciBlcnJvciBmb3IgbWFsZm9ybWVkIFVuaWNvZGUNCj4gPiAtIEJ1aWxkIGZpeGVzIGFuZCBw
ZXJmb3JtYW5jZSBpbXByb3ZlbWVudHMNCj4gPiAtIEFsbG93IGRpc2FibGluZyBpbnN0YWxsZWQg
dGVzdHMNCj4gPiAtIFN1cHBvcnQgcGFyc2luZyBtdWx0aXBsZSByb290IHN0YXRlbWVudHMgaW4g
bm9uLXN0cmljdCBtb2RlDQo+ID4gLSBBbGxvdyBsb2FkaW5nIGZpbGVzID40R0Igd2l0aCBqc29u
LWdsaWItdmFsaWRhdGUNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5n
bXlAZnVqaXRzdS5jb20+DQo+IA0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8xMDgvYnVpbGRzLzYzNDQvc3RlcHMvDQo+IDExL2xv
Z3Mvc3RkaW8NCj4gDQo+IFRoZSByZWNpcGUgcHJvYmFibHkgbmVlZHMgdG8gYWRhcHQgdG8gdGhl
IGNoYW5nZSBsaXN0ZWQgYWJvdmU6DQo+IA0KPiAnQWRkICJkb2N1bWVudGF0aW9uIiBjb25maWd1
cmF0aW9uIG9wdGlvbiwgYW5kIGRlcHJlY2F0ZSAiZ3RrX2RvYyInDQo+IA0KPiBidXQgSSBkaWRu
J3QgbG9vayBpbiBkZXRhaWwsIEknbSBqdXN0IG5vdGluZyBpdCB3YXMgYSBkb2NzIGJ1aWxkIHRo
YXQgZmFpbGVkLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=

