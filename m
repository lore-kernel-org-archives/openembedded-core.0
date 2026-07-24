Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A62C531FC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 08:00:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14572.1784880054150331502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 01:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dBYgVTly;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784880054; x=1816416054;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ZdMDzF5JBA9O+eZFF/8cYBSJ8+nwF0+QLJWtsBhHbIk=;
  b=dBYgVTlyQTLFckV+/3XMVgE3uez1fAE3lNWcRj5x/x+5c7BWghZuEDuf
   krwNUK7H2iKABEZL425pS0IsVUpztggvyu0seQwwZGE6l/egnknmEF91l
   aKiuYOsw3gK5XjyH06wVob51Ap/gGLimP7n0agYmI/a9fQ0UyVGtPwyb6
   c/LvO/Z4WaUMnVL/G9Z2wDy3TcUkEYmzv6E3o4da1KhNGYI5m8uNLhSM6
   yA5STktfdR3/41d11ZIt2gfMKtoDF9FgMqtte1LL/Pm8SXrk1nH7tAW5B
   jz+VxCgo55O1vERy1BabawH7mjJwcqAi1tsdIrF2J9QNjWIGEPGBY8y6W
   Q==;
X-CSE-ConnectionGUID: DoKZ/3UIS2WibfIl+uq+DA==
X-CSE-MsgGUID: YCkAA8AzTlu+vrokgWBm+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85590565"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="85590565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:00:53 -0700
X-CSE-ConnectionGUID: pW/TdHY2T4KgfN892hcPug==
X-CSE-MsgGUID: LTXRFpj1Su+2cpiLsMn/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="258713771"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:00:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 01:00:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 01:00:52 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 01:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8WsdDy0nF6Hr6v0Z3tdKKhDAMi4WsQkzs0CIFGYFrxPCy+NFny0O+kWJ8BMw7/i6C85kg7GENT63Ojj/VlOjSXcRmvQsuN9QRm5apHVXBnhU/vm485FJqIv6fmSnG0jE1HsiEs8LouiEWisusPZ4iaPIroDoGDpXFpIZzDy54+BcXs4zNeZwJ3N4/nd04u4jJ8wjYKWn2sP0lNAu31kXLlAT5i2CmV4N7lnTazDC1D+u9VIBGVoM6JEsbyCku3HTYcuiBoBWjhxCDWZWx9Jj9zgQGgZFz18CNHtzgdEros2zc3boqA3sJppcA10IebMvhY1mgknGdmDxYHToBAgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdMDzF5JBA9O+eZFF/8cYBSJ8+nwF0+QLJWtsBhHbIk=;
 b=NeTzQETSKtVnp/RVqP1v+Dus8QSggq6onCgfj5HWcbkGTu0obMvIrxG4t3uVOSuHWed19kvlQJROAFa0XEwM+3+VyJ4wvhsNdlJLXcGqh3ur1ZH0DvRWDcvYz7oKAK6O5YWuPeJyfYJTxdeAh5sbLWZrwXOFKMP6M9/6zkD9bFp/dUzgiLgaN9YSen7cobgsCktyMitgEwhnBcDozBIF+FETauG+oeWY55cIrNtpvjdwEmbG+lCzZcHXeVXWilWSQLIVPj9vwM/I99xKF8zdvsQ69K0k0EH+nwEhrv2j4h+Sj6XIVSJNy0p9Js0wd6lybtlpd2KvRXDM5pPqg5yigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:00:48 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:00:48 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.1_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.1_M2.rc1)
Thread-Index: AQHdGzFWAwJlWoojOE6xskoOWFVxZrZ8TckA
Date: Fri, 24 Jul 2026 08:00:48 +0000
Message-ID: <MW4PR11MB7029785B7944C4757787616DF4CF2@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019f915a92a8-79648cca-c930-4256-9147-708fad3e7515-000000@us-west-2.amazonses.com>
 <bcb8e9d6ef10a03f17b67baa7aacf7bdba848f0c.camel@linuxfoundation.org>
In-Reply-To: <bcb8e9d6ef10a03f17b67baa7aacf7bdba848f0c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|IA1PR11MB7366:EE_
x-ms-office365-filtering-correlation-id: a5dbf28c-c627-4688-747e-08dee959ac29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|38070700021|4143699003|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: rFcC8oH6DyprZscSZHBkGzaSPNpPzuEgJdBmPyvGdhRd5rj2qh5dC/gza0uIttpCTrLoKz56d9zYVXThhZWNNhrtSOzS9wINQmP7ozC17yq22Vd8qX+e6JU0EHcqty3/RhiQeQkH91ik2C/v9wwYWSz7L+GHRpP7vDpxoNRhPH9NtAQnoCZ8Pg+NEbZJpPSbQsNN4sL/FauP6agfoKOmU+JU7cC0RvpOXR25fbqr1NNFYvN+IXIDSbvs+Ow2jca+Wq9ycGHk/bux/lsh8YVbALzAChsDtmGEYqg7hu4RRqHqtjY/tWDW5UVpvJLg6iI+V2VsEN2DKWGmosEPQwY+OMnt1UjQjRTdeONNAuu9hzG22i+OdJs/tC9s3b1VQz9FepX7I5uT4fMzTrPeTwXV4uaDHXr3Z3PzKB/o53bl00Lpz2NUM6MMdNZUCkG0gaDPVpYEeFduRzy5BFWqvtQrhAifL0gQ0uLFzF9f0RGy99FQgOnmoJgMGO2zGijvBUPpmeQVs/ZSHeKxjitKRzPkJA+Oa7K1AFP5t1v5GC9ZIvmIlPR9SA5OUvhUaB18UPV61/VUdDdQ/zmE56T04hFBPvwMO0/j1TWMCAUgQyCTpEGRcLFYqaDACr4IWuf/QbPOifUCer6a8+Ry13adx05EfJtPXkbgIWDT0Mh6TuyQu9w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmhJbmR6aXFNWDlCdDkvUStzMVA5RlhEQVdaT0ZUdG5oa3VFTzlwSWZzV1ZI?=
 =?utf-8?B?SEJlcXphL1d6M0FhZ1oydHNvRStSaThpb2cwaWllZm1rUU5Ec2lzSUdsV3Ry?=
 =?utf-8?B?amc0c3pQSElvdUhKVmdKV2dtN1M5Y0tFRWpvMW04dGVWS3lFMFNQaXlQdlc4?=
 =?utf-8?B?ZkZQQ282alhucEl2WWNMeGcvQndSZm5lMmpjVFYxMEtIdG5ObG1SRFBZUFl0?=
 =?utf-8?B?NGRSOGt0THcwSjY4NVlGS0wweU03RlpteFdQRjk3ZGdORkZ2Q1I2NU1FdnR0?=
 =?utf-8?B?WU1qbzZTQU0vb0FhOWd2ejV6bTRWZXRIeVpIN1BQRVZ4YXo5cVMxZndwOVU4?=
 =?utf-8?B?eXNnUlVQNDlqNERScFZ4VzFzOFNDT09ueDQ0VWVwUkNIbEZkbG1HNHVUKy9w?=
 =?utf-8?B?b25kakY5aUNqbFE5aW1LYVJKcW9WQzNhWUFQampIRzN1dXB6S2N0dk1JTmRr?=
 =?utf-8?B?Z0l2Qnd5citicVNHbHdtSDhYVmxHck5FWTFsVllQTkJJb3gzaUQ5T1ZBODR0?=
 =?utf-8?B?dlZrZzJHM1lHOVFyaTZqdGJzVkdVOEdOSHRWSjNEdXU4UnY3VHRZdC9ORGFp?=
 =?utf-8?B?SDVKYkhTYlRFQXB5TGNudThPTzhvYUxDTDJLK1pIZmZnQ2t5WUtmcGxyVEJw?=
 =?utf-8?B?d2pxZGkvZ1o1Qi9vbmI5ZmhRNjVodVo0TXZkbEtCQVFtNXh5RHVJNllEVEVE?=
 =?utf-8?B?MkFab1lORG8vS2tjL0tjd1grQnlDR3graVM1cVltSW40aVQ3RnY0Um12UkRP?=
 =?utf-8?B?N0NONjMzZFNWM3NvWHVySy9haXlYdXdNblJJMnh3VHVKU3VXWTNoREZDVEg0?=
 =?utf-8?B?M1ZUeC9PT1FNOXNhazJxMVJRZXBYSnJvOTlMQ3p1SEJUV244NWdDZzZXdDUw?=
 =?utf-8?B?ZmVMbCtNOEVFSFd2c3U4ckxNa0lHM1F3QUlMY3NVdnIvRlBlbExmUExVRGtv?=
 =?utf-8?B?VjVwcFdrSVZYTzlUYXEvbk44cHZRb3FvV3ppa2IyNGtFUzRHK2thNWRqU09S?=
 =?utf-8?B?UGRkTC92R3doQmV1a0JKRDZ0dkxrQjd1OWhJbmhXejY5WTZxWG5KQWQ5U2tm?=
 =?utf-8?B?TFRoeGVYbFpnMkU3UVBLQUVoclIyaDVzUXMwTUZqYTdwZEZpZ2ZXb3ZjeTkz?=
 =?utf-8?B?ZUtpNm1VdmhaQzZJdmxZbEFwVjIxeVh6MUo2Ym9LUFRmV3k0QzFTaEQ5L0No?=
 =?utf-8?B?MXNScHRvTUZreitOR2l5MGtpbW1CalNwdm4vdUNZeUR5cWNzZDliVEVRV3Jv?=
 =?utf-8?B?Y2JjRWY5K0lyVk50NFVIT0JSM2xGd0RYZU93eHlLZWxtOWs3V09OMThTcVRo?=
 =?utf-8?B?WFFicTVpWUtEaCt6UnZnVnRjYXlkNFUvWE9RK0FGUVhmY1A0czUydmVGWHpC?=
 =?utf-8?B?dzJqTW5kS2R6V3IwR0MrbS8rbHlqQm1EYmhSdDVqQk1DSTBTSlR6cDlxSjIr?=
 =?utf-8?B?NUN4Qmpydm1zcjBIc2FCaTdPQnkzbFpFaU5TTzhnRFZWTmR6bmNSbkZUSjZW?=
 =?utf-8?B?Z2F2K3RjRDFFNFducFlVUUxVYWdwejhrdlFOeHYwSFNxVngwNXU5OFNqTXh6?=
 =?utf-8?B?bkIvYXd5dHQ4U1RZL0xwZ0hPUXl4cFN1Q3E5UlhLK0N2dzNNSDNZQWltcSto?=
 =?utf-8?B?WEZYMnBLYy9tZHd4VWFNTjBXU05NNWt6T0JmclFzM0ZxSEZTcHhlL3BxQXdt?=
 =?utf-8?B?RVZyVjlrMTFBWlJtYm43Q2pxUVNSdHh0NmlweWlocGlHU0xaV2RhYlViTko5?=
 =?utf-8?B?NXM3bUs2NkMveGM1aXlqK1RlMGx2NjNlMnRBeTF3cG5VamxzWVYxMm5MRFJT?=
 =?utf-8?B?akFnUlRkYXVJSGliSGRzNVJ1ME1jSkJNbzlOeTdSSlFhd25MZXBET256M3dP?=
 =?utf-8?B?ODdJZXVudnQyZmlqRFQvNnA4dis1RW9ZSTFCbHBKd0dPK2xRQmZTcTIvaXZv?=
 =?utf-8?B?SG1KcFB5RmRZaHhZYUpOM3A4YTBzUE9vUWZhZkFqek1qUWlQSklBNGFSSXll?=
 =?utf-8?B?Tk9TMm9Icy82bU1hblRoQ2k5NytiQ2xndU94eDNHOHZITnNnZGVjNnAzWVQx?=
 =?utf-8?B?YTN0YXNWbEY1VkZpakxFNzFud0IzVitSWEs2NE54MDhtcnFCclRwZDdHaThY?=
 =?utf-8?B?SzdKS1BpTGVNQUx2OUdnS0JtWkxwemw1MzZvdDNBczNubG1nQmFSRWREZXpK?=
 =?utf-8?B?K1JXWUh5OUdmcitHNElNQU9jUjhxYkJ6Z0EyT0xLamhzUE5NY2l5ay9NdUlL?=
 =?utf-8?B?TXJXKzFwZk05S2pZbzcweWl5WEdxSkZ4Nm9ZUTRra0xUei9rd0trV1NyY1J6?=
 =?utf-8?Q?bgAuaBTE8rRBjXKp2C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mBZ50nI0q/6TcITEHjnyJKeLAoPpsaKQavS7hQOgOTf/m68+2vigOYktkiDrMbzEMvgLaZcCyqEwuhjr+QHZ+a4lNX87+mwF5o3C8fXCskyowJz01NjWN6/XnqatFwY73DAnlBCqpN6tM3g+Ooxci1xtlcYS0W41kGxS629PuzXP5S/FApmnN4oZiES5VcAM5vkobhFRRzM3TMLn0Ts/KPZzNqufw++Nfkb4MwuIXR23IdYI1iQ5R1NEZEvJhrkbEqx9bsACefJKK6OweUNFzpn3CFQOMZJClC6GFjdGg33G+Asaq/iwW3p8EX7cdK6pe/eSX8Rst/B5DE20tvEbkw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dbf28c-c627-4688-747e-08dee959ac29
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 08:00:48.2510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgAPLEjXx+Z3ZakeUBe0EoUTxfEKefdK31xhcmD1ZzY4Fu1T3x071PxNDUr6UbeH9fT+MJ0kBXtMCNu8/PC0Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241906

SGkgYWxsLA0KDQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0aW9uIGZvciBZ
UCBidWlsZCB5b2N0by02LjFfTTIucmMxLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhlY3V0ZSB0aGUg
Zm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBmb3Ig
Zm9sbG93aW5nIG1vZHVsZToNCg0KT0UtQ29yZQ0KQlNQLWh3DQoNClJ1bnRpbWUgYXV0byB0ZXN0
IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQpBbGRlciBMYWtlDQpQYW50aGVyIExha2UNCkFy
cm93IExha2UNCkJhcnRsZXR0IExha2UtUw0KQW1zdG9uIGxha2UNClJhcHRvciBMYWtlDQoNCkVU
QSBmb3IgY29tcGxldGlvbjogMjcvMDcvMjAyNi4NCg0KQmVzdCByZWdhcmRzLA0KRGViYWwgR2hv
c2gNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFhLWJ1aWxkLW5vdGlmaWNh
dGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy55
b2N0b3Byb2plY3Qub3JnDQpTZW50OiAyNCBKdWx5IDIwMjYgMTE6MjcNClRvOiBxYS1idWlsZC1u
b3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsgeW9jdG9AbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KQ2M6IFlvY3RvIFRTQyA8dHNjQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQpTdWJq
ZWN0OiBSZTogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21w
bGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTYuMV9NMi5yYzEpDQoNCk9uIFRodSwgMjAy
Ni0wNy0yMyBhdCAyMzo0MCArMDAwMCwgUG9reWJ1aWxkIFVzZXIgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgd3JvdGU6DQo+IA0KPiDCoMKgwqAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9j
dG8tNi4xX00yLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIgYW5kIGlzIGF2
YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBodHRwczovL3ZhbGt5cmllLnlv
Y3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by02LjFfTTIucmMxDQo+IA0KPiANCj4gwqDCoMKgIEJ1
aWxkIFVSTDogDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJp
ZS8jL2J1aWxkZXJzLzI5L2J1aWxkcy80MjcNCj4gNA0KPiANCj4gwqDCoMKgIEJ1aWxkIGhhc2gg
aW5mb3JtYXRpb246IA0KPiANCj4gwqDCoMKgIGJpdGJha2U6IGMyNTE4MzNkMjA2MmVmOTJmYzdl
NzdhYjY0NTZhZjkyOGFkMWQzMWENCj4gbWV0YS1hZ2w6IDNjNTViNDViZjkyMGJlYzkzOTM4YWYw
MmYyNDUyY2Q2OThkM2JhY2MNCj4gbWV0YS1hcm06IDE2NzY2MTc2MmI3ZDM5ODU3NTFmZmYwNjZi
NWU3MzU1MzI1ZjNlY2MNCj4gbWV0YS1hd3M6IDY0YWFmNWM5MDViNDdiZmY0OTA2MGUyMTdlZTk2
YmRkODQyMzcwN2YNCj4gbWV0YS1jbGFuZzogMGJhZWRkMDZlNzhkMjZkM2I5Mjc0NzFjZmQ5MTk2
MGI3MjI5YTE3OA0KPiBtZXRhLWludGVsOiA4ODc3Y2FjYTZiMWZlNmVmZTMzYzc1NjY5OGNlNmVj
ZGNhZWEyMjM4DQo+IG1ldGEtbWluZ3c6IGUyYWFjMDZlYzc0ZTQ2ZDA4YjdlNjhmNjEwNDMwNDdj
NzYxYWU5ZjkNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDJkYzUxZTcxNzFjYzk0YjU1YWU4Y2Q3MmNh
YzE4M2JjNzI5M2VhMzUNCj4gbWV0YS1xY29tOiAyZWI2Y2VmM2IzYzI1Y2Y4MGM1N2U4Yjc2YjFi
NTczNzcwNDY1YTJiDQo+IG1ldGEtdmlydHVhbGl6YXRpb246IGE0OTg3ZjBhZjZmMzA4ODNlMWRj
ZDUyY2VjNjYzMTEzNDMyNDFkNmYNCj4gbWV0YS15b2N0bzogZTQ2OTA1NTdmYjBmZmZjYjVlOWE4
NmQxYzFlYmM1NTBiYjBkYTA5MA0KPiBvZWNvcmU6IGMwNTA4ZmJlYThkMjYyNDJlMGM3NjFkNDEy
ZDcyNzk0M2Y5ZDYzNTUNCj4geW9jdG8tZG9jczogMzU4NTE5Y2E2NDA2YTg5ZmVlNDJjNDVkY2Fm
NjNhMzdhMzc0ZjMzYw0KDQpUaGlzIGJ1aWxkIGRpZCBoYXZlIHNvbWUgaXNzdWVzOg0KICAqIG1l
dGEtcWNvbSBmYWlsdXJlIC0gZnJvbSByZWNlbnQgdXBkYXRlcyBuZWVkaW5nIHVwZGF0ZXMgaW4g
dGhlIGxheWVyDQogICogbWV0YS1hd3MgYW5kIG1ldGEtdmlydCBzaG93aW5nIGxpY2Vuc2Ugd2Fy
bmluZ3MgZnJvbSByZWNlbnQgY2hhbmdlcw0KICAqIHdlaXJkIHNlbGZ0ZXN0IGNvbW1pdCBoYXNo
IGlzc3VlDQogICAgaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmll
LyMvYnVpbGRlcnMvMjMvYnVpbGRzLzQ0MTINCiAgKiB3YXJuaW5nIGZyb20gYWxtYTggd29ya2Vy
cyBiZWluZyBvZmZsaW5lDQoNCmhvd2V2ZXIgSSBiZWxpZXZlIHdlIHNob3VsZCBwcm9jZWVkIHdp
dGggUUEgYW5kIG5vbmUgc2hvdWxkIGJsb2NrIHJlbGVhc2UuIENhbiB0aGUgcmVzdCBvZiB0aGUg
VFNDIHBsZWFzZSBsZXQgdXMga25vdyBBU0FQIGlmIGFueW9uZSBkaXNhZ3JlZXM/DQoNClRoZSBy
ZWdyZXNzaW9uIHJlcG9ydCBkb2VzIGFsc28gbG9vayBsYXJnZSBmcm9tIGxvdHMgb2YgcHRlc3Qg
bWlzbWF0Y2hlcy4gVGhpcyB3YXMgZnJvbSB0aGUgbXVzbC9nbGliYyBzcGxpdCB3aGljaCBpcyBj
b25mdXNpbmcgdGhlIGNvZGUuIFRoaXMgd2lsbCBuZWVkIHNvbWUgZnVydGhlciB0aG91Z2h0LCB0
aGV5J3JlIG5vdCByZWFsIHJlZ3Jlc3Npb25zLg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg0KDQot
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzczMCk6IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9tZXNzYWdlLzczMA0K
TXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTIwNDE5
MTkzLzk5NzYxMjcNCkdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9sZWF2ZS8xNDQyNjk5OS85OTc2MTI3LzQ0
MDMzNDU1L3h5enp5IFtkZWJhbC5naG9zaEBpbnRlbC5jb21dDQotPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KDQoNCg==

