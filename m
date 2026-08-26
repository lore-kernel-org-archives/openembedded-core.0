Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39359C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:47:31 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8041.1787734042077981809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S5MKk8v5;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11925; q=dns/txt;
  s=iport01; t=1787734042; x=1788943642;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=DBpUbCMGbJQdKXCsQyljiPPRfCvtnTte4GrlcZRbrjY=;
  b=S5MKk8v58G1awHcMOIMiUsB9qSY289ijtHgHXA2K2T7etmP/nenrFOPe
   SAqO8Z+DUmwGBVJX2nDOQtcGUcSUkA1AJ4TS+PF5U4PVGLKoo9TnPdLoc
   Qf5yeTW9uhaATdejG+2DxVKXX57H0LOTVqf7DE2jxUf6S9iOzZInjVNfh
   4q31i/AlAvgd9LESMpVXeFgLxLOmbPDmeduaIAOR/0Cbv/k5ug/QRbGIv
   PdAgIhpoYQa7uME+B+iOnPBpK31TS1KCCgCuylYXveN28nRSWutlUds0Z
   uOvDzOKm3lfBXFoJ9EYTRyOPB26wYtlmadWKQB2bFdrkSOpsQ8s9RIT6t
   w==;
X-CSE-ConnectionGUID: 2SOqCJ/pTfqPDNSQde2mKA==
X-CSE-MsgGUID: nk7bdPsAQhi1oeITDkaUzw==
X-IPAS-Result: =?us-ascii?q?A0ByAwA8p45q/44QJK1QCh4BAQsSDGWBIAuBPTFTgQgCg?=
 =?us-ascii?q?SFJBIgfA4UrhliCIQOeG4F0Cg8BAQENAQEuARsHBAEBhQUCjWwCJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDAUoBPQIBC?=
 =?us-ascii?q?BEEAQEBLicKHQgCBAESCIJ7gh0WQQMBAg4GtGgCihx4gTSBAYMoAT8CAkAB3?=
 =?us-ascii?q?AwVgTiFP4MDGwEBBSVJbIJdgSMYAYR8JxsbgXKBV4IxOD6BBYFcAgEBAReBG?=
 =?us-ascii?q?QQrhBOCMASCInoSG4IxJIFUhm0DiC5SciIDJjMsAVUTFwsHBYEjEDMDKi8tI?=
 =?us-ascii?q?0sFLR1wDCcSDx0XFx5YGwYFEiAqQUQjAz6BGUECgXU/Ixk2fIEJXoErKWECE?=
 =?us-ascii?q?BdGLhWCBwKCWoEnXgIBSUMOB0c+C209NwYOGQMEgTUFjX8HWx+BVglqPSQaC?=
 =?us-ascii?q?QoBKQJPAYEzEBkGCwsvkmMfj0GBfIIhikOTZIEzCiiDdop8gSaNPogyF4QEg?=
 =?us-ascii?q?VeLPZgugSaZCCONZ5VghS4CBAIEBQIQAQEGgWg8gVlwFYJuAQEyCQoMNBkPV?=
 =?us-ascii?q?o9lgWiFE4EtxVl5AgEIMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:T2ge5RIxtTPojo6zLdmcuVQyDhhOgF28FgcR7pxijKpBbeH/uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:DG0M8KtrpVr0pvV3O5ed2oLTsufnVA5fMUV32f8akzHdYApBsoF/q
 tZmKTyOO/mDYGX9c9B1aYzjoEIBvsPcz4dgGgc9pC8yRS4SgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwoN1QGEpss
 uQkJik1Qja4vu67mreYY7w57igjBJGD0II3s3Vky3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZg1/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9KobTGZ8PzhfEz
 o7A12L6XRsWDMe28DqEq3Whp9PjnirGSp1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:nIB/YK2TpkfJF9G/IGrRMwqjBbtxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K+90cm7LU80hqQFn7X5XI3SEDUO11HYV72KgbGSpwEIXheOitK1tp
 0QPJSWaueAd2SS5PySiGLXYrRQpeVvsprY+Ns2pE0dKz2CHpsQlzuRfTzra3GeKjM2YqYRJd
 633OYCjTymfngcc8S8AVc4f8Wrnbf2vaOjSyQrQzo85iezrR7A0tPHOind8gYVUjtJz7tnym
 7Yjgz/6JyktvGw2jXc22XQ45k+oqqu9jJEPqOxo/lQDg+pphejZYxnVbHHlisyuvuT5FEjl8
 SJiws8PuxogkmhPl2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZSB3E8EAt1esMk5
 6jnljp9aa/Pymw2BgV1OK4EC2CUXDE50bKpNRjykC3l7FuMYO547ZvpH+9W61wbR4SoLpXYN
 WGSvuspcp+QBe9c23TuHVpzZiHW3Q+GQrDf2050/bliAS/WBtCvhYlLAt1pAZbyHowJqM0lN
 jsI+BmkqpDQdQRar84DOAdQdGvAmiIWh7UNnmOSG6XX53vFki94qIf2o9FrN2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoUGjqIJ94HUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10n1WoVUK3MZTMoJ0+xLEW6ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8ZUD36NKx7nzaWs7/D8W/ssl/WCzjCFMhLYdrnFsAouf0wCrE=
X-Talos-CUID: =?us-ascii?q?9a23=3A9oQt6mnUkd67LBG/FpHggw8kuBvXOSfm6277AQi?=
 =?us-ascii?q?gNWhwcJGzcmac9flhsOM7zg=3D=3D?=
X-Talos-MUID: 9a23:JLtdJgtzBa69LcZREM2ngjI9PstQ+I2XCEFUlpgnh+WHPBFiJGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:47:21 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id E68D91800017E
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:47:20 +0000 (GMT)
X-CSE-ConnectionGUID: Tz0h7/cESuWJO0P/4eH/gQ==
X-CSE-MsgGUID: tZVXxs4dQHS/fvYcXWhIbg==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208,217";a="84727058"
Received: from mail-centralusazon11011071.outbound.protection.outlook.com (HELO DM5PR21CU001.outbound.protection.outlook.com) ([52.101.62.71])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:47:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3NEL/q6QpPsBBfN/lclpTnOAo3SWrgahaHW1BU5mRqARlE/XDlChSX7QQIAopdB1wN/lTSewXcUatsScNQxtPGPLq4DBZAZAE1jn5/QBTTC1Ow8htMb0wUCFeRgHDrfOEzGmxvNeBUKwUhW74sipFqNjHKlof3PSqCcRgrdyO9ohbJgig4ujp7QFFlmW9kR80v0hW1XXlrwbc0vczUpAiU+l9RLxytqf8rd6gO9bin+oQ8dVjckZvj8Y/JFsn6B7ftMl34shA+Uav2GFTZxygIOYrrSbK3PbcG6GdFKJDg1ZXZmiJV88SkmI71UTtkg6yGgUU6LBRP1nKlSkx/70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBpUbCMGbJQdKXCsQyljiPPRfCvtnTte4GrlcZRbrjY=;
 b=vAR4eo0spJTONwmPVFJHN+jILswb9gZ1yFRmW6sU+QBlllJuc9XWedQ6BLQ98F6CFT//rOfBBw++mwulTLcRxjUQWyySiBBmYWL5sQpOtcmCQnCC+ecyLX4beD9LbPxRr5cI88yJe+mjH5GdvugMM1hNB8Ts5C4Tvi45AgF3BWzFxcTL3ZPyyHPl51by5vZkHsrbuF0W+DQY6YTR5yfUrj4prBtbB/11pXTX+JRF1wBQBoqHZQpCSIzSxXPf7qscdpCRDXACmfuDeTmzcC5mpjeyufMYOkjEQjnQGtITq2tUMOBY4S5F+64sHCzWq9iFLYSnlE51/3qJAsLNMVj38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 PH9PR11MB683264.namprd11.prod.outlook.com (2603:10b6:510:3e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 08:47:18 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 08:47:18 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
Thread-Topic: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
Thread-Index: AQHdNKMFI7aH0E9JJ0WTCvBKYHjJyLawAmRB
Date: Wed, 26 Aug 2026 08:47:18 +0000
Message-ID: 
 <DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
 <20260805083103.2633995-2-deeratho@cisco.com>
 <DKY47YY3L5UE.1DLQ2RS87JLFQ@smile.fr>
In-Reply-To: <DKY47YY3L5UE.1DLQ2RS87JLFQ@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|PH9PR11MB683264:EE_
x-ms-office365-filtering-correlation-id: 91ed8607-ea5c-4f24-8c96-08df034ea316
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|13003099007|38070700021|56012099006|10067099003|11063799006|4143699003|8096899003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 mlYlsKY943ZfRyADFkEjJcsW3PweWDAzmtwGTAD0A6jgUJBt/kjI4ij7tt/p10uS7bkDVmPOR5T/YU1/gBH1oG/h0pG87PD5t6qS3cXG7et5w5JrLygqIqD64C6jrcpE2eBMcGvh/dV/GCnrZQOi0NFy0tfzYKS2zWUdXDDUAPNE+qVCSPR7UKGbtj4AEjyymiX88Xa4h0Dhc5IiT1/dZ05atZg7zMhgckUtxcZ/jep167+Trxd19b7AAVIQ7i5r4sSXKo1mxRRFxtP/jO/9nUcUGCwJir6rJoT77/5mnP3j4iTxOiugrQnYXYjKd9tU9P6Mj0LmEBvD7ZrKqPRK7WKl0b3S4kdK/o8T1ZeceuOiTFblmkdsaPttXYPY7EfNQCDJm3+IWeN0vUjrEwsbvewEtwDXjR5SGGFESSXvAH1Bi6QjHa41qWTr69bVMRxVwBRS1fJLcE8G1J3E6t47kaD5uqJ9Ic4tcBW5Ewg+XUOSU/eC7EnIOzF3pUMXs6qhV7OakvsiTWZZJ3kngItczpOKHyujAsNT9XYtAuPMQ/B0+TplSwcx0ESYERw3DWBk9NJYjRAfSirxlYZhOtFoBZ7syLEHz2f3UTfPdaGLuEcZF3yuvKzlbPNgFqACR7a9AKYKShDlS0iLyJIFBEwbsBvvSzWrzeJQUTNFzOgbFgY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(13003099007)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(8096899003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7yAEQZvmibgINybOe0kdl8Ku833ruq/Y9HzuQLNMV3qoB+ayio3ACjIk2M?=
 =?iso-8859-1?Q?MqoQ5b7TJC50qWxX+yHA3dlxmnaabF9+YhdNvmJRhmyvKA4mdlAbvyPk1h?=
 =?iso-8859-1?Q?6INtKNV/pomSpuj05V09G3Qs2+DPO0L21nWFjrbjUgPbS44xVYFeSLYOE6?=
 =?iso-8859-1?Q?2fkxrpcUtG9Sejx4Lr2kkmpCo/D77zdT4QFVqYywWevFEuoeCXQJIx9OvP?=
 =?iso-8859-1?Q?1wAFQie8OAcLLsFfSIlxz/utHw/+II9I00op3ERcAKbNhdOhQxfc9fqcyG?=
 =?iso-8859-1?Q?b6+KTBcbiE4kp0CMdZqjYmEVzdrGcP8GIMuGSmr0PytntE+PmC8+oaBBsK?=
 =?iso-8859-1?Q?qBdrlJYPU+0MYDA5FjgImguGw/HoD1VacZ/AROnEiWmd/lLu7p9NYDTe8M?=
 =?iso-8859-1?Q?iX6RcFxa5hbBIilzAmOzv1uWQulsEr+Ceh3AQWot/50djuVRgM2a1gtKyp?=
 =?iso-8859-1?Q?U5DnWduA2rMJufOn/tu7QoBHKwGyF0RKjV1YnA1GigjH34ZYmD124bON6K?=
 =?iso-8859-1?Q?Ia9lwjCSGytLyxvXJX+pcchZROBDQ4QxLgCOKASYmqqZFLSGbaXZke79dm?=
 =?iso-8859-1?Q?ijNsZTYDsVyj0I2teuL2O7n7+mqT26rQdUA1vd6FPicZF6r9PmKz+PqiSK?=
 =?iso-8859-1?Q?emVOPZ1mW1K/xWrbdGvJxHhjieEnEr9SJilXe9FMQLbvTivepV1JmPrpBW?=
 =?iso-8859-1?Q?V6nfMAQ5xgJQVP5HuRklDzXuJrreQpBxgl2V4wfecgJjhkrpd39U+EaT5H?=
 =?iso-8859-1?Q?Alpsq4LPbFHFhkKylI6fjVSLaR5dMWjXgdU9KHSu96wmWBcOzFRPWHAf6K?=
 =?iso-8859-1?Q?pa+8hCSUpKr9aNDkM9LTBbGsN5DCKf8bBsk090nu74FikQsS1amfwGZLfL?=
 =?iso-8859-1?Q?LSEIjd3NnClE8O9lksY+RVfNp1R0AxEI6cMQCIBkhYicBEorMw8vdgvBqQ?=
 =?iso-8859-1?Q?vjbaVTGQaWkNfdDdqfh6wDbXLhjAlgBB3aY6PlsPFu1sp9l8bzlW4jKaZ1?=
 =?iso-8859-1?Q?6K/IwEf5THpWvY83vbOqP3heCosta1KCTSwDVV4PeZzpQHQTjHuA1PJesz?=
 =?iso-8859-1?Q?zZnVIWNfORq29Y5bGGKV5xqAYK/dp4+gzaSdZBAow+3ReSM0+w8aF/KB5x?=
 =?iso-8859-1?Q?mDUUuzEqfct7YD+Sq+pRspwoKMV8fEKC4KgwvQIyzK7VWx+wx8Sl69qlIx?=
 =?iso-8859-1?Q?AwKO0YCZEAZcFXre5DtjyUTwOn+PLNE0cbJmTT9UhIWZ0eBWUDHuBoLQMh?=
 =?iso-8859-1?Q?/L3J3No5uV1UHRyhOpdaKxKWOBNY+4JaMyYyYZuX6/5tFYcfZFSVBw4CW5?=
 =?iso-8859-1?Q?Ha1bv89RgXAAhVUDVWozZtEiFDatm/gSoIB13oaDCm/jbFjUKlEWqd/Ute?=
 =?iso-8859-1?Q?xjLTgxK5hBfvcxh9BRkkvjq6qIu/TbaV8M/LjmbaW+4V6PbMz8yWMG4POJ?=
 =?iso-8859-1?Q?/xK4/8l2mWb7Kjwl1FIacL+Nx4V6zIwY9qvHP5SwNk5bqo3dicgkcig53h?=
 =?iso-8859-1?Q?jyt8E9xPsA+X4AsUiTXV5aJnLiAu08z++/79gM0vQDHOwMXgfGwX/iVu+D?=
 =?iso-8859-1?Q?BTlRaBBwVo+klt+W4MiF0zYOHWvCBKcAhxo5AUCAi0hq0Uh2yYESD7egHF?=
 =?iso-8859-1?Q?kPyd/AGFgplDAdplo5yM2MCkZ0dzJc0PAAYkXZONU2xQYrbAAAVQg5j3uB?=
 =?iso-8859-1?Q?sWqjH8i5ABnqgfcP1Bgt5Yj83lFUYUFoZzidAg1euzmkmBNI0DvVRu/+9/?=
 =?iso-8859-1?Q?2Y36y2uWfLDi7hmSI1i7PKyI8So42U7rkVRb8fIraKo7o4?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	swPFNJKdbFfJQF1/EKGd6iJdysFY3FqwRVRIWYDVvpTeuETXm6t8nTbTFRPBxqHSnHf1zz1qDDu0cF4RtIcBwKO9wx6HQddZuHzayPLXLpq/sWq1rvjhCAe4Mst2sMnRpNXDQbQp99te++ElBB6K3xpXenmtdUIKv3CaFWSeFcPJPFRi0imZUrUM0LZIQO7bE2nHZ8dTWZLNoXih7I1s0nBQR4506VQEYlkI3NqteOMDhcn3J/PXynV1zXlol9mNERnHGAMnhfdNDNX7xkM769QxHKqu2k99Yvk5hJLJ22zrzWyFCYwtTYyjtpq5+JU6ZT0oB6SuAUh0QMw3dljtAA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ed8607-ea5c-4f24-8c96-08df034ea316
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 08:47:18.8346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rizoLmJIIy5zoxepj2AgvBkhL84s6FTzwnLv/0gV4Zsn/j+K2k7PuevqGRgOM1tggdC9MbW51PyeRR6l3oMHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB683264
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244380

--_000_DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2DM4SPRMB0074namprd_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
Thank you for your review and feedback.
These patches were originally prepared on top of the curl CVE fix series th=
at is currently under review and already present in the wrynose/wrynose-nut=
 review branches:

  *
curl: fix CVE-2026-4873 - openembedded-core-contrib - OpenEmbedded Core use=
r contribution trees<https://git.openembedded.org/openembedded-core-contrib=
/commit/?h=3Dstable/wrynose-nut&id=3D7e44b94a57a1b7d9ec043554fb7f1f4c3fbfbb=
af>
  *
[wrynose,v4] curl: fix CVE-2026-4873 - Patchwork<https://patchwork.yoctopro=
ject.org/project/oe-core/patch/20260731061427.14543-1-deeratho@cisco.com/>

Because the remaining curl CVE patches in this series were developed on top=
 of that patch, rebasing everything on the current wrynose review branch wo=
uld require additional rebasing work once CVE-2026-4873 is merged. If you a=
pply current curl patches on top of this CVE-2026-4873 fix, then there will=
 be no build failure. Could you please advise on the preferred approach in =
this situation?
I appreciate your guidance.
Regards,
Deepak Rathore
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Tuesday, August 25, 2026 8:34 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286

On Wed Aug 5, 2026 at 10:30 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream curl security fix backport for
> CVE-2026-8286. The upstream fix commit is referenced in [1],
> and the public curl advisory is referenced in [2]. The backported
> commit link is also recorded in the embedded patch header.
>
> [1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8=
319ad16
> [2] https://curl.se/docs/CVE-2026-8286.html
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8286.patch             | 81 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch

Hello,

This series does not apply on top of the review branch anymore:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wryn=
ose-review
|ERROR: curl-8.19.0-r0 do_patch: Applying patch '.../wrynose/bitbake-builds=
/poky-wrynose/layers/openembedded-core/meta/recipes-support/curl/curl/CVE-2=
026-8927.patch' on target directory '.../wrynose/bitbake-builds/poky-wrynos=
e/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/sources/curl-8.19.0'
|CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/tm=
p/work/x86-64-v3-poky-linux/curl/8.19.0/recipe-sysroot-native/etc/quiltrc p=
ush', 0, 'stdout: Applying patch CVE-2026-8927.patch
|patching file lib/url.c
|patching file lib/urldata.h
|patching file tests/data/Makefile.am
|Hunk #1 FAILED at 218.
|1 out of 1 hunk FAILED -- rejects in file tests/data/Makefile.am
|patching file tests/data/test1647
|patching file tests/libtest/Makefile.inc
|Hunk #1 FAILED at 100.
|1 out of 1 hunk FAILED -- rejects in file tests/libtest/Makefile.inc
|patching file tests/libtest/lib1647.c
|Patch CVE-2026-8927.patch does not apply (enforce with -f)
|
|stderr: ')
|ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wryno=
se/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/temp/log.do_patch.468848
|ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-c=
ore/meta/recipes-support/curl/curl_8.19.0.bb:do_patch) failed with exit cod=
e '1'

Can you please rebase and send a v2?

Please note that there are other pending curl CVE patches, I'd recommand
reviewing/testing patches to identify conflict at the earliest.

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2DM4SPRMB0074namprd_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thank you for your review and feedback.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
These patches were originally prepared on top of the curl CVE fix series th=
at is currently under review and already present in the wrynose/wrynose-nut=
 review branches:</div>
<ul>
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://git.=
openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/wrynose-nut&a=
mp;id=3D7e44b94a57a1b7d9ec043554fb7f1f4c3fbfbbaf" id=3D"OWA418e3567-12f6-28=
4d-160b-cf807ae410eb" class=3D"OWAAutoLink">curl:
 fix CVE-2026-4873 - openembedded-core-contrib - OpenEmbedded Core user con=
tribution trees</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://patc=
hwork.yoctoproject.org/project/oe-core/patch/20260731061427.14543-1-deerath=
o@cisco.com/" id=3D"OWA518e6468-088a-9da9-f358-a93af3101f48" class=3D"OWAAu=
toLink">[wrynose,v4] curl: fix CVE-2026-4873
 - Patchwork</a></div>
</li></ul>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Because the remaining curl CVE patches in this series were developed on top=
 of that patch, rebasing everything on the current wrynose review branch wo=
uld require additional rebasing work once CVE-2026-4873 is merged. If you a=
pply current curl patches on top
 of this CVE-2026-4873 fix, then there will be no build failure. Could you =
please advise on the preferred approach in this situation?&nbsp;</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I appreciate your guidance.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regards,<br>
Deepak Rathore</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Tuesday, August 25, 2026 8:34 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286</=
div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Wed Aug 5, 2026 at 10:30 AM CEST, Deepak=
 Rathore via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream curl security fix backport for<br>
&gt; CVE-2026-8286. The upstream fix commit is referenced in [1],<br>
&gt; and the public curl advisory is referenced in [2]. The backported<br>
&gt; commit link is also recorded in the embedded patch header.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/a86efdd7ca5433de923=
1e650f18247de8319ad16" id=3D"OWA66530e4c-196c-b275-35c0-6d9642145121" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad1=
6</a><br>
&gt; [2] <a href=3D"https://curl.se/docs/CVE-2026-8286.html" id=3D"OWA62ce1=
4df-4f5a-7da4-7ea2-46c81cb162e5" class=3D"OWAAutoLink" data-auth=3D"NotAppl=
icable">
https://curl.se/docs/CVE-2026-8286.html</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../curl/curl/CVE-2026-8286.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 81 +++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.19.0.bb&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 82 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.=
patch<br>
<br>
Hello,<br>
<br>
This series does not apply on top of the review branch anymore:<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
stable/wrynose-review" id=3D"OWAaf04f723-a1c1-9a47-d01c-04a9e518546d" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://git.openembedded.org/o=
penembedded-core-contrib/log/?h=3Dstable/wrynose-review</a><br>
|ERROR: curl-8.19.0-r0 do_patch: Applying patch '.../wrynose/bitbake-builds=
/poky-wrynose/layers/openembedded-core/meta/recipes-support/curl/curl/CVE-2=
026-8927.patch' on target directory '.../wrynose/bitbake-builds/poky-wrynos=
e/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/sources/curl-8.19.0'<br>
|CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/tm=
p/work/x86-64-v3-poky-linux/curl/8.19.0/recipe-sysroot-native/etc/quiltrc p=
ush', 0, 'stdout: Applying patch CVE-2026-8927.patch<br>
|patching file lib/url.c<br>
|patching file lib/urldata.h<br>
|patching file tests/data/Makefile.am<br>
|Hunk #1 FAILED at 218.<br>
|1 out of 1 hunk FAILED -- rejects in file tests/data/Makefile.am<br>
|patching file tests/data/test1647<br>
|patching file tests/libtest/Makefile.inc<br>
|Hunk #1 FAILED at 100.<br>
|1 out of 1 hunk FAILED -- rejects in file tests/libtest/Makefile.inc<br>
|patching file tests/libtest/lib1647.c<br>
|Patch CVE-2026-8927.patch does not apply (enforce with -f)<br>
|<br>
|stderr: ')<br>
|ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wryno=
se/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/temp/log.do_patch.468848=
<br>
|ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-c=
ore/meta/recipes-support/curl/curl_8.19.0.bb:do_patch) failed with exit cod=
e '1'<br>
<br>
Can you please rebase and send a v2?<br>
<br>
Please note that there are other pending curl CVE patches, I'd recommand<br=
>
reviewing/testing patches to identify conflict at the earliest.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2DM4SPRMB0074namprd_--

