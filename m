Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AB0EB64DE
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 05:19:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web10.16141.1725945551710159303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 22:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=IydBROI+;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725945551; x=1757481551;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6hegIpASStqh9oYj/n5NH7XOoWFcQQ0uV3oATTPV1r4=;
  b=IydBROI+3idV7YYKn95NbNocCueLcXeDb/MMgKQJU+X0CJbNGZuMM/7d
   PotivWLozU2TwX0bJY7nJYt9utAxnUb9aQ5PqWcSDbBimJXnRddeSadhE
   PKR0EfPxewH5q8oH+jplWYkvE8pJRla68IevcplTeucnkC9COdf6mP3xy
   sHi0IQCDrhfhu8a1RUkmt688DBrK3LeUI8GW3TcMY+6aw500XjmbpJSka
   DemP4LGBo5wYf2xL2grNHrG7NwuFXxmGeNE5Vj/Lt18dgBXHq1n5ah+7d
   L7Atc2mOUuLOZK/vygPIsJ8um7Zd7pVmud6EacECRjDKalAEucYW0wxZp
   Q==;
X-CSE-ConnectionGUID: itKLSQHxSpuzk1DYvgreMQ==
X-CSE-MsgGUID: 96w9FcNhS9irG5gHOOq2CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50084130"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="50084130"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:19:11 -0700
X-CSE-ConnectionGUID: T/9jKkixRN2bzpuza/VXYQ==
X-CSE-MsgGUID: lOcPtRvkTx+gRl3TIIcDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66704482"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Sep 2024 22:19:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 22:19:10 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 22:19:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 22:19:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 22:19:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKRM0O4iTXD9UrG/cgto4CgN9aiLNZo/Bnd1xfyutQUkb2cnb2aE6N85p0FbfKfkLIrqt+KMJvOlCNULNT1zzihtq8n8chEuTucNA83rzeunJHtvxkRkTHCJOAtTFJ9DjHk9AoVXXJLl3lQESnUXRpFu51qxAV3kj2ZBLYt3w7vO8UTSGrHaXHOlEDPGtesTJcYG7i8o3/ykbf3HbyR++HV9eljTztnvYiOts+j1t8IDusi684bOa8KL+UZ80wvBqz5dgZansTeEmWW8cUSn/V/hQnKeHR1mDjSwdmtjYYpgttTf8qJ7p+D1Q0xxIC5Qe5l/DZtoS1lfHG5rWSjMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hegIpASStqh9oYj/n5NH7XOoWFcQQ0uV3oATTPV1r4=;
 b=fhwxpY/CZgO2CYQRNeBylYjP/ZDjuIhHZnVYUFRW67Og3sUAc/f4ZWgAxLGa+NJi2d7wYaSjhMMtDHsSilYWmVPvubR+ILd2/w0hpPagfjPv3XGv0SqXP+hngU6R3hfrG+O6YNtcaEXHzUOegTxnNKhVYemBP6Q1dV2O4tkGVqAt4ghKz7N+z3tFafePLS7MA8i+lErSMw/WgRtmpSO3tM/ZX1zJU9L/sDXgwdvgPawtAqAxRArmDMnVmFw3mzZP05F10KnBwIY0oRjBTbBluRpkDYnvYnnGkvoOK2KLcJzVbFN+dAyT4sI8esAlN8GnMCE14rgeXTSsiG7l6om0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 05:19:07 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 05:19:07 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, "Yocto
 (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>, "Pokybuild
 User" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.21.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.21.rc1)
Thread-Index: AQHbAV10Yo8u/CVS6U6tx9Qu2HOooLJQfq6w
Date: Tue, 10 Sep 2024 05:19:07 +0000
Message-ID: <DM4PR11MB7760431B31BB34625F49C0EEA19A2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdacOpY9zesTGSJTkCqxdjH4sCEpcQjphTQeGR-7nXPNAQ@mail.gmail.com>
In-Reply-To: <CAOSpxdacOpY9zesTGSJTkCqxdjH4sCEpcQjphTQeGR-7nXPNAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CH0PR11MB5268:EE_
x-ms-office365-filtering-correlation-id: 85cf11fa-0c2e-41de-934f-08dcd158186a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y29lYkNOcHIzVWtWcHc5d1ZtOVRldzJYMncva05HYnRmcnlSejZhY05XRUZK?=
 =?utf-8?B?TldzZHFwUkFQbzBxc1A2UU5nTHRiYUh3U3pJVHdBc3RZMUhMZHJjamx0a0N2?=
 =?utf-8?B?SzdGT1ZJdWRPOWs3eWRjbmkwTFkyQ2UzQnVORlBmRUZzRDBTZzJ6OG1QNTdV?=
 =?utf-8?B?NkVzaHB5d1MvYTJURVFRVkJsVjdUeEJySmZoQnVWK0NDS1Vvenp1YWtCQ3ky?=
 =?utf-8?B?bGlIOTBiOW52cmtZSUdKSkpBTldROG52TEdmalBPdkNsb01UWStIM3BRYUZl?=
 =?utf-8?B?RXMvVkpqZkgxMkdOdUNUWEU5b01jZ0FUcnZBUVJ2UVRJbEFJSngzQUJaNEdP?=
 =?utf-8?B?OG5Uay9QMDlRbDdHeDMySlF5QXN3VXAwZCtpbnhmU0J5N0dSTlN1OUZNSkFK?=
 =?utf-8?B?ZXowN1lqZXNQSW1qckVQOE9kcm1KM05kVGVKRTFQSFFJWVNBTUhQRml1TGtq?=
 =?utf-8?B?ZEQyalBaZG1lS3ArQzEvRXljMmVqbFRuM21iallzRlBYUkRYT2hlZHZlTEk2?=
 =?utf-8?B?a2FpbWlYSS9mQkNzbHlGQkttSjUxWG9uWkJoSVJHN25SU2NvRnhkR2RDaUdH?=
 =?utf-8?B?OEFXcWtvTWpuUnJLTzdmZVFyVzkySHRDNGlVcmluYWsrUXJQZ3p2V3hIUUlX?=
 =?utf-8?B?OUlyV1J5ZERHakR1WTNPTlBhdnA5a3dOSUxjSG1LVk1hSjM4SEpQYVpsVnc3?=
 =?utf-8?B?d2FuRGxLTE00eHl6dUhkZGl2WkVBYnZNUWJveW43bXZoTWZTU0RaNjBMNnVk?=
 =?utf-8?B?WTA3K3dFak1nYWNDUnJzMWo1c2h4TmZ2OWhYLzBacWxqOXd3S2hpS0NlSWZ5?=
 =?utf-8?B?SkVkNG1jSUxJdHBMeVhsU01FeXJFSVpqQVZHa1BLOGdYdTNNa2IyZVhmRUtz?=
 =?utf-8?B?Um9VSjF2OS8rQ1RiOEhPZ1BQNkhhWVdjSDRabEwxS1M0RFEvY2pINGp4Mkps?=
 =?utf-8?B?bGJybDBteVRFa2JxV0J5VjQ2ZjJjQnZLbUhMdFpLTGZrSUFKazBFMlZlRlgv?=
 =?utf-8?B?RXhtbUFMSjFNcnpZOTh5Q3RRU1BkOVBZL3JwdUk5VjhJbGh6bGl5ZkV6K1d1?=
 =?utf-8?B?eDJWdjZRbG5MZU5aRFRsUFdTdURLaWlXSFcvdGlGeDlJc1ZVVmFLeFRUbVNw?=
 =?utf-8?B?RzNUdExhSVAyR1NvVld0RW1jdXVjMnQ2OWszaFBJT3RLRk8yTlFGQmg2R1Y3?=
 =?utf-8?B?blNuUDFPTTdUdVpnUUZzbUg2Unk3dXo0bkVyU0dVNEpVVWJnRGE1dWpWNDZT?=
 =?utf-8?B?dFcyNjBBWjYySE9xQkVuUjltY2JUdklIYjBLQ0ZTenZ5UXNUQmxlWXlpZ0h1?=
 =?utf-8?B?bzBsQ3JrQlpwMSttMm8rSGlVOTBBdk5QSTJ0NUV6a2ZrTEpXSHBKbmp4TXox?=
 =?utf-8?B?Ky83MWN5Q2JQY3VhK0QvV2NoS3JOUkxFT2I1Y1FiV0RvYlRjbUlxaXZuQjBZ?=
 =?utf-8?B?V21NTUNyOHZ6N2FuaWorUWE2bjl2MHRicUpZZFNJTlF4UGJpK1pPQTNGSDNs?=
 =?utf-8?B?REpGR1dnQm9pWGtUMlBkSFBBL20xMjFEU0czc0RXckpOd0NTUmxPaWZOdmMv?=
 =?utf-8?B?NXorL0xSZVNwRkJuVDNpV3JlOXg1VWozcDJyTHpGRTZnVXFMWlpnblhRSTFD?=
 =?utf-8?B?Sks1OVB2Z1J1ZlcwWVFQdENMT0FPMWk5Vjc1aHRnTG9uSDNnbCtYVnZjQUMx?=
 =?utf-8?B?S3NDSlFPVWFzVHlVSHNlYmFEZlpHVms1ZWY3ZFU4K0QrSXYxZ1VuUWxkV1Zi?=
 =?utf-8?B?VlNrajRIbytKbmNXeEdNZm8zYmdYcTVUTm5Rczd3OTlERGRsYkM0bnFYS0Q4?=
 =?utf-8?Q?oZNZ873j8B2FX9Qk2m3G0aFh9xeIGCTvKjoAo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1lYUG8rNVczS1BTK3YvVWltUnZKYy91NGdFZkIwcnlTNGhQZVpYK0FnVjhs?=
 =?utf-8?B?U2dPTkFYc3hhUnUzVEFsanluQzh0VzBaUTgzWlRqc2w4SVo4L2thRUVXVTEr?=
 =?utf-8?B?OHlVT2NTcFN0ZE5nRi9KbHBJRjdUVE54QytORy9heXpZTDNYdUhYRmc3MW14?=
 =?utf-8?B?c2VYZW9ERVlWQ0Jteng0WUhrelduS2pYcmM3R1NIY0lxMy8wTVEzY1JvdTM5?=
 =?utf-8?B?eXZPQTBMNVZtYnd1TVlDSHF1REc3ZDFIY0J5NG12TXhPbFdXNzlyLzF1MkFP?=
 =?utf-8?B?UzJSazA3aDJpT21WdUdwK0ZHS1lXYS8zOHZ4Wk9aa0lIZEhZWFRRbzNiV2Zr?=
 =?utf-8?B?dlhBSXhHbHE4cGRoaWlZYklqdDkxMmM5VnlneWEyYklMUE85dGZrTCtmUzJs?=
 =?utf-8?B?cWlVNmNJVTNmSWhDb0FSdGM3OXRqcXIzQ05QTlVWUitlQmJ6Vkd3NEl6a3NL?=
 =?utf-8?B?WlZkNm9MZ29QNjdqT1RkRnVYRnk3cHJIT0xJMFNEM0YycEVUdHpEMUVPbFAv?=
 =?utf-8?B?WGFRbTQ3end3OXdvTkozWVdqSmh1NWdsRnVoaDNCanh5Q0R2SDR6K1BzUGNq?=
 =?utf-8?B?d1czQlpxeGVDZlZzZS83VzlhRmQyc2J3NFBQcTdrdmh4aHRVODMzeXA2VmMw?=
 =?utf-8?B?eFVOa3FLWEpNZTltOG52R0tXeVhkUU9qWGdJU2dlK2JCU21RbnZ0cWd5cnFr?=
 =?utf-8?B?eDFKeitKbjlFVHNvREZKM3JKQ01OeEdUdExUL1d2V0xqZ0pialhkc2lLdktF?=
 =?utf-8?B?aHZuNU02cHdoQytudUdseTF6QmE4SGlyM1F5S1B6bE5uSU4wcTk3cEEzRGdB?=
 =?utf-8?B?azZVMjBjSHFTVEJnMWFSMFVyMjVSVWRpNmhNQWhxVUt6VUdkWkpkQVQ0dFlk?=
 =?utf-8?B?RGlKOGQrSmkwTkFNM0ltdWdYNFBoVXdNdEdjQ0E5MGhTWWt1RXhyeUZnd2ov?=
 =?utf-8?B?eTBsTk1aYy9WY0tZVWlFaXFLSUxSa0llQStXWjZlM3FvMXJYSXJqT1BnVVVT?=
 =?utf-8?B?SHZqQTdVdldOSW83VXJweGVCalBYOHdnNFFacnBUUnkyQUwrUE1HVUlaVzZo?=
 =?utf-8?B?bmloeGNiSksyMFlPOEtaM0Y0SFFEM2t2N0N5QW9yaU1GYXlVQ0ZlbkxyMStw?=
 =?utf-8?B?K01pYm9wdjRNNExsZEFsU3F0K0MrQXUzL1FvOTVMdGdzTkg0RjdxUFJDRGtu?=
 =?utf-8?B?UklJY3RmOHFzeUREUStMOTB0T1oyT2JicTk0cmxZY0tiS2RWN01sdHl0eGJD?=
 =?utf-8?B?Y2I2YjBSNjRDZkJCMWRSUnljOFgzTFlkRkRCUFlUK1MrL1h6R1lpUmxBeDgz?=
 =?utf-8?B?cUN2MVhIMGJWb2lCWWtuMDBlU0pFSWVBS3Z1Znl2UnptdDdJQmVoTkx6VFls?=
 =?utf-8?B?M1RzNFROelh5QjlxeWV0TEphTWV6R1Z2M2UzQm9BLyt5VUpaZWN1M1RWUFJQ?=
 =?utf-8?B?dHpoY0x4VDFDRklGaVMvT3Q1RzBTdGVyMjZnS1phZFZWeWErTUR2SzcrMXJJ?=
 =?utf-8?B?VFJUZ0p5RmU0V3htSGVYc2tSQnhUWm8zMGRhaGJBTmNnVTBDS0o1T2hPRHJj?=
 =?utf-8?B?ci9NN29EUW9kdys5Y0JHcjBGUnlvTFprdDRlZ0doY21YQTFyR1dmb0gxdy9E?=
 =?utf-8?B?czc5azdXMHo2RDJReFpsTUJMRnJDMjZQN1VkRXJ2d0ZOWW9ZK1E5WkJzdHNE?=
 =?utf-8?B?SXZlb3ZRa0kyRVBubDBnY2hNdmd0a0p6eXNYZ2NBd25acUxBOVRLTDBiL2JC?=
 =?utf-8?B?NW5VVHZvM0w0Wm9pZFlGMENiMHBKTlA5SnBJWjluMDZSQkRxOGNmSURKM29r?=
 =?utf-8?B?YlluY3hYRHNuN21uRXo4YnVwV1YzMWlmZHAxeE1ZWkFNNVRsNlE5M0dzd1Ur?=
 =?utf-8?B?cUJ6RDRZdjBkNmI0Z2FBTjJZZzN4WU1HSlVZTDFjOTQ2SFlOaGRNSEVXSS9B?=
 =?utf-8?B?TVRBci9nTCtRdGx0NHF2OGtwT3hLS09oZVlSWURpRjBraTE4K1hXTGcrckd0?=
 =?utf-8?B?enhjTmlDRkpYcFUyMnFFckJJV0dLWkJ3em1CWngyRGhDYWJCQ2QybkF5eWo1?=
 =?utf-8?B?a0NJeFVFTTk5ZmpyeE9QVTFiRk1IdHlGY1g4blpVSm9RYmdsTXE1UEl0Rlkv?=
 =?utf-8?Q?9lbPahGnCz3oXEKx1+2fo4PjO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cf11fa-0c2e-41de-934f-08dcd158186a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 05:19:07.6415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leq/oXUlzVLFFGd63IASFJp7L9Atjpbg0OLMFu8pwEDquciy9N6p7QaYscekVvFaT6y1Px6pu6FhoXGcxnXjQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 05:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204329

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTQuMC4yMS5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBleGVj
dXRlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCg0KT0VRQS1tYW51YWwgdGVzdHMg
Zm9yIGZvbGxvd2luZyBtb2R1bGU6DQoxLiBPRS1Db3JlDQoyLiBCU1AtaHcNCiANClJ1bnRpbWUg
YXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KCTEuIE1pbm5vd0JvYXJkIFR1cmJv
dCAtIDMyYml0DQoJMi4gS2FieSBMYWtlICg3dGggR2VuZXJhdGlvbiBJbnRlbMKuIENvcmXihKIg
UHJvY2Vzc29ycykNCgkzLiBUaWdlciBMYWtlICgxMXRoIEdlbmVyYXRpb24gSW50ZWzCriBDb3Jl
4oSiIFByb2Nlc3NvcnMpDQoJNC4gQWxkZXIgTGFrZS1TICgxMnRoIEdlbmVyYXRpb24gSW50ZWzC
riBDb3Jl4oSiIFByb2Nlc3NvcnMpDQoJNS4gUmFwdG9yIExha2UtUCAoMTN0aCBHZW5lcmF0aW9u
IEludGVswq4gQ29yZeKEoiBQcm9jZXNzb3JzKQ0KCTYuIEVkZ2Vyb3V0ZXINCgk3LiBCZWFnbGVi
b25lDQoNCiANCkVUQSBmb3IgY29tcGxldGlvbiBGcmlkYXksIDEzIFNlcHQgMjAyNC4NCiANCkJl
c3QgcmVnYXJkcywNCkppbmcgSHVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHFhLWJ1
aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9m
IFN0ZXZlIFNha29tYW4NCj4gU2VudDogU3VuZGF5LCBTZXB0ZW1iZXIgOCwgMjAyNCAzOjM4IEFN
DQo+IFRvOiBZb2N0byAoeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZykgPHlvY3RvQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3Rp
ZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlcg0KPiBidWlsZCAoeW9jdG8tNC4wLjIx
LnJjMSkNCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTQuMC4yMS5yYzEpIHdh
cyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyDQo+IGFuZCBpcyBhdmFpbGFibGUgYXQ6DQo+
IA0KPiANCj4gICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lv
Y3RvLTQuMC4yMS5yYzENCj4gDQo+IA0KPiBCdWlsZCBVUkw6DQo+IGh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODMvYnVpbGRzLzczMTcNCj4g
DQo+IEJ1aWxkIGhhc2ggaW5mb3JtYXRpb246DQo+IA0KPiBiaXRiYWtlOiBlYzJhOTlhMDc3ZGE5
YWEwZTk5ZThiMDVlMGM2NWRjYmQ0NTg2NGIxDQo+IG1ldGEtYWdsOiA3YWYzYzRhZGEyNmRjZGI5
MzQ5Njk2MmI3MTg5YTZkNzJlMTRhODI0DQo+IG1ldGEtYXJtOiAyNjBlM2FkYzJiZjMyMmY1MmQ4
MWMwNjQyYzgyNTA4OGE4OGJiMDUxDQo+IG1ldGEtYXdzOiBjNWY1NWRmY2ZkYWNkYzg4NDI4ZTg0
ODkwMGRkYzY0ZDhiMDUxMmM4DQo+IG1ldGEtY2xhbmc6IDhiYzg5M2Q3MzVlNWY3NzlhMmRjZGMz
OTkyNjIxZDVhYjM3MTgwMGQNCj4gbWV0YS1ncGx2MjogZDJmOGI1Y2RiMjg1YjcyYTRlZDkzNDUw
ZjY3MDNjYTI3YWE0MmU4YQ0KPiBtZXRhLWludGVsOiAzY2JmZGRmODgxOWJkZjZjMTAzNDNjODFk
ZTQxOWEwZTA1YWNhMDc0DQo+IG1ldGEtbWluZ3c6IGY2YjM4Y2UzYzkwZTE2MDBkNDFjMmViYjQx
ZTE1MjkzNmEwMzU3ZDcNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDUyZWNkNjY4MzVkY2ZkOGI0ZTU1
YzljYjYzMjU5MDhjY2VhNmE0ZTcNCj4gbWV0YS12aXJ0dWFsaXphdGlvbjogZTBjZDA5ZTNiODM2
N2UyNzQ1YTI3ZGIyZTdmZjFmODQ1MmM4Y2Y0MQ0KPiBvZWNvcmU6IGM0MGEzZmVjNDk5NDJhYzZk
MjViYTMzZTU3ZTgwMWE1NTBlMjUyYzkNCj4gcG9reTogNGNkYzU1MzgxNDY0MDg1MWNjZTg1Zjg0
ZWU5YzBiNTg2NDZjZDMzYg0KPiANCj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNz
YWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4N
Cj4gVmlldy9SZXBseSBPbmxpbmUgKCM0NjEpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5v
cmcvZy9xYS1idWlsZC0NCj4gbm90aWZpY2F0aW9uL21lc3NhZ2UvNDYxDQo+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210LzEwODMyNzIwMy82NDI0MDQ0
DQo+IEdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9sZWF2ZS8xMzU4MTgwMi82NDI0MDQ0LzE3NDY4
MTM4OTcveHl6enkNCj4gW2ppbmcuaHVpLnRoYW1AaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiANCg0K

