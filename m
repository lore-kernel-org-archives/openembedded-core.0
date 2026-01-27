Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD570CA6CBB
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:09:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6488.1769504948012351035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YdHgcUA6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54875edec4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R0pUcn1448238
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=px4yGOSbiuvURysIEkqhCeHKF1W5SExf87uCoq2B+cA=; b=
	YdHgcUA6G57eve6oDj9miOO5Am0/3et1Icc3SIpq6KfQqZG6DeGZvCy7YgCo0wDt
	au/eHiSKS/qt0B6IyKMgeKjmFX7jqrNuFmHAVSRhMgXxyCOoZpV1LjrlHcQLdEpJ
	npaHAfTEDw7MrumFrYpTOvr17o/ompJfzybrhUdrjCsQndmHo74h37teIa+DIC0t
	Lek5PVK7TwU0k/5yn0BJKiO3D2ZoDLzerdHjFDJ7NUS4XTG3LTNALIHTM/ceYrfu
	AmQYBwUSFIsOHVsW3xtu8izSctckX5646Qvnq7Qs6bXjqKOUYFpvk/v2ZPAhbKG9
	ocJad9idTKOuxX52xqBkUQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvn28awmn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 09:09:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9xUY0o56lcm4sTYM7vD7PgEoZ6nlaXq2fk3lFurB9IbmfxKFgukpsJUD4tB66Wc1ehdD492bfzKXR5jK9400rkelGh4IJKHvUtHqE/iuFn+xpK+W5MDCQNzhTInRuOSxYCljuUQ97wBgrlJuigXVLDMd/TSzYthlSgIeJEHKcn9o7Q7javfW5y81sGmyH+qj/kR2zmuZMGuy6Qmvxog9pQ95Emso39IGPVLxxl57gGfb6zQuiwvSJwoDUQoOtORjO21hPN9sTCeFf205pV6mqc8LdP/LdE8uABitKGqajuAOvHeG3se7Bq8dRJ3v4+VUmlijB/pWSxEAEZC2ZuG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=px4yGOSbiuvURysIEkqhCeHKF1W5SExf87uCoq2B+cA=;
 b=CCJrI+mBUN8SuSfwDIPbsbn0D8PHuKDavPN3IWG0eZLb/qpIUmf5eHIOzgnHId5HJz9qBbMy0xbJBHZEW/6b5AFHDXFO8vFc2HwXXPKoPMHHVwwfp4oPu3aiVr/Xw+EU+wNWEyRdtAGb/PIc7RLiNhi5zBCoW40FoOMGSTPt4mQwrYP8rTeeEwNECwYkvq3AG6hz3kzPc0U26o4X5a6cmfcX1SUCTRW8KIhraJOGU4EpEsC9ELu3J8Ws34QR8QhMvEzr3F8DZfj3NjlljWmSbaPIAKoQtrynK0lCp1f6PVKUDgjD/6sZOjIk/dgFlU+UwlCDBjW+BBEz0CcVu7el8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 09:09:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 09:09:00 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Paul Barker <paul@pbarker.dev>
Subject: RE: [OE-core][PATCH 2/2] systemd: add shell-profile-dropins
 PACKAGECONFIG
Thread-Topic: [OE-core][PATCH 2/2] systemd: add shell-profile-dropins
 PACKAGECONFIG
Thread-Index: AQHchcVln41F9dzv1k+IzkYWtlQZVLVkejqAgAFTAkA=
Date: Tue, 27 Jan 2026 09:09:00 +0000
Message-ID: 
 <CO6PR11MB5602495519156A54175F992EED90A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20260115021918.1926514-1-Qi.Chen@windriver.com>
 <20260115021918.1926514-2-Qi.Chen@windriver.com>
 <8D1D3F71-DC47-43B3-B513-5ECE95A34D28@arm.com>
In-Reply-To: <8D1D3F71-DC47-43B3-B513-5ECE95A34D28@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=45975396-1391-4ac7-8ba7-e2aa8ca36a9b;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-01-27T09:07:40Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|LV8PR11MB8485:EE_
x-ms-office365-filtering-correlation-id: 956fec5e-368d-4629-cf57-08de5d83b5fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UFVNUWcrc1JpSWdQYklHdWJ4Ylh3TFNqdlJkNXJPbFdiOWprRTcxaDJNQnEy?=
 =?utf-8?B?d0h5QzJwMndCbWxudHVuc1p4OG9NWTl3Z21KNGNsV1RiYVhiRG0wbElEZ1Zo?=
 =?utf-8?B?bGI4QmNwQzVGeXJHK1YwZE5IeEEwaWJpamhnbTFzQzVTZEx1Q25XeXJVZStO?=
 =?utf-8?B?VUxFcU1obDdqdU9MNnp0dHdBVmdwcTAzcGVCbFJyZVJyRFl4ci93UDFtTW52?=
 =?utf-8?B?NVlMWFg4RGJPc2ZLbzBXQjNNa2QwdXJpWGZ6WmpNbXZGbS9MSUpFNFgrYTZ3?=
 =?utf-8?B?ZUN5TXRYNTM0WTdsWjR2KzZkSUhDb1NxbVhQVWttTW4wcUNNZDN2ZVFGd1VD?=
 =?utf-8?B?RmhtcGFsdU4vOWRqTXlUcERqa2pyVTN0WFcvcmhpN0ZhWW1GWnhtV21laTRL?=
 =?utf-8?B?aHkyYlU3bGgwN0Zob3VTMzg3NndiK0cvT3FSOFljNExUb1lhbDZwR2Z6eWJk?=
 =?utf-8?B?WUNLeXdza1ZVNVhFd2hMRDQwS3hpMzhpTFFPNkJicXY3UUc1RDBmVG1tSGw2?=
 =?utf-8?B?OHVjUWFBQnZSaC9iZlNGNFpaQjlLdjVEMC90eVlXSjZzWndRMUQ5N3B2OHVu?=
 =?utf-8?B?ZHVOVkIyTFpOVHY0WCt0a1RDQVU5aTFGdzRwMnV2Tk5HRW1EbzJsOG9EZG1l?=
 =?utf-8?B?RTNudGdsdkZXdk9CTFkwalpEZGlVYngrYUZtblBzNWJhR0hJVjlmK1FQeWFC?=
 =?utf-8?B?K3ZhNllzc0pkTk90S1JGY0VFOThacCttR2ZsZS9PZm1JZ0lWUEl2MXdVYWJP?=
 =?utf-8?B?M04rQTV6blpidXdIQzY5M1hWRUNLazU0ZTE5bExmVmFWQnNBNTdkZEIwN1gv?=
 =?utf-8?B?RFVWOEJjeWNONklCVUlXNVhUVzNyaEZRSSswOGNLT0VYaXgwK2xmNzJXWlpC?=
 =?utf-8?B?NDlCNUNTLzB2UG9IWHptMnlidk83NUxFS1JCc0RJdDRDYVp3YjZVdlBtUmJO?=
 =?utf-8?B?RVljNk9mMTBHVG0yYVVMdkJkeklRWFhOLy9ETWpXTjVtRmhCTy80d1lHS1Qy?=
 =?utf-8?B?aGVlaGNsTkptWG5yVHQwWURvb3RZakdYN1poVUc2NVJ0OUR5R1BhL2hPMzJP?=
 =?utf-8?B?MjdkSE9JVGllR2JEZXliZkZqaEVxUCtQc09OR0dEcjFsZ2lzNXROaEo3N1RH?=
 =?utf-8?B?YXl0TDVaT3lxR3hPZy9NTS9JRm1KR2luYmlaZnF3cjRqaG12MU80MWtlR05Z?=
 =?utf-8?B?dWg4WDZURWxTeE52Y0JpTHVBMmp3aHZiajNnaWFXTm9Qc25FZGFFMUxYWEps?=
 =?utf-8?B?S3M4QkRSZStVekNBNStMVFRRM211VkhNK0xSby9oMEpxRlU5RDZJZ1p4eXJU?=
 =?utf-8?B?V2M2bFd5ZUs2bW92MStPZWNqckVqS1E5b0NZeXVCMmR4RVN6bE11UFRXVUNt?=
 =?utf-8?B?MksxZUMrdWhSUHg2Q0htTC9HZjJkZW1WVTZJYjVHME5VTmRXTHMwV2EzaVc0?=
 =?utf-8?B?WmRvMlV2TkhEa1d2dElTZ0RqNjZOTTNEMXpKOXNOOXVIdS9RbGttc01jNzFr?=
 =?utf-8?B?MjF4V3ZsU0dCdlRudTZ3RkFPMGJlVFNqRFgvY1ZRcm92aUZnc2hRTDE5amt0?=
 =?utf-8?B?MUNCbTBETzAwTWNiekpZSk5UN0UwRWw4QW1MVEtReURSWW9LWnZnVTZIbjN0?=
 =?utf-8?B?cUY0azhGQVg0Sjd5SnFGakxmUTFhejNQc2dsRTZFVXdRTzljQjI4NnhiQXFo?=
 =?utf-8?B?dTl2WUVQanFtMGR4ZEdkTGZxcElXNk9aR2hTOGFPQk5UMHBoTno1WE8vclR6?=
 =?utf-8?B?cEQxTStjRE81aUtZYmIwMm9sSVgxREpaSWtLbGcrY01hSzZ4VkMxRFVqUHh4?=
 =?utf-8?B?OGVWWnFnTnlZK0R2YWQxTXM0eTVYUEs2UjBrbzJDelVnWnN4QTZhdDBKNUN0?=
 =?utf-8?B?R3FHaWI3MjZaUDhYT2g0eVRtRm52R0t3Mnh5cXJHdldCRk11RVkyeElGNmhS?=
 =?utf-8?B?U0FYZmxwY2RuZHFTWGRNMWxkTnFZcWhIOFFjSVRoNFhDWlZvYjUxd2VPSUpD?=
 =?utf-8?B?NnlOd3BVNGZHdzdWOE5BNHRDN1FZczNFMlgwVUZBbkdGL0VzM1BPQmE4Mkpj?=
 =?utf-8?B?QkhpdzhRaU5OT2JJL0JZSEJqQjkzSG9ha2I4cGorakpZY3dKRVp3OEExNGlF?=
 =?utf-8?B?a1VwV09JMmhDSE9wVERrb05VK0w2UW9zcjl6NmtuOGw3UnhWTTE5b1pYN1Zo?=
 =?utf-8?Q?27x4hZ6kAQwZPU+oewrFQfk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MmpPb3JrUm9QM3BPa1dWa2poVURJeXFyTStuQy94blNYSjdPb3BodVMrOXNl?=
 =?utf-8?B?LzhQcG1iNWw2RG9TZGdZUXBVYUJGbko2WFY4b1dpcHdydDRCdG9WL1RReXRw?=
 =?utf-8?B?cFJTNCtpcXlKVGlNa0E5UzIxK01KcHNNTjRNRUgwVG1xMHVJOUROT1JwL2ZB?=
 =?utf-8?B?ZDJ2c3ZZYUdYbS9PUnpYUUlqVWtiR1VYd3NJYkFvRlFWaXlUWngyVkxSOU5l?=
 =?utf-8?B?b0MwVG5lSHY1QU96RWhSSVdxZDU0VzZTcFhhblZVNmhHRjkxOGlWaCtERGxo?=
 =?utf-8?B?TG41REtNT1J6L3R0ZFBlalN5MzYzK0pkaWRDcHlNTGhpenhaa0lCbHlRUnpa?=
 =?utf-8?B?K1VSVktCQjk0b1VPdXFReHJrK01oUXFGdkN1Z0s4Vmw0KzhNUURzZDNEaUJh?=
 =?utf-8?B?ZzJKU2xSaEVleDJuOGFUTGNSSjY0OUlnOTd0VzAyM1pmcmlBUEhxd09vZDBn?=
 =?utf-8?B?VnNBWDhaZTlpLzNQSDZUcjJQeHlyMGttYTRtYUxhbDJhNmMxeGNOc1pCT3Y3?=
 =?utf-8?B?bnVlMFg2VEtqSis5V3NMVldsc3R6RFJwMGlaL2FJb0svZ1Vaelc3eFdSTkVV?=
 =?utf-8?B?L2FSRkp5M1RrbWxRZ2ZkSHJOOEpiaHQwT0ZJcGhpSzVoeW5qM2hGU1BVVVI3?=
 =?utf-8?B?M0U5TmNGWkhrVVhrY0YxbGNaZ0htM3o5ZUI3RG9JK09BVjJ3WHBJZEV4V2NB?=
 =?utf-8?B?YVB6Q0dzYXpjYlBFWi9MY1hteXhyS3E2Y09NeCs5YnZGWjdlYk1lMlRkRHlI?=
 =?utf-8?B?WGZHRXhwaUVHdnBUUDNRVldiaENOdWlVMHBoVWpvVE1UdkU2ZC9WbWEvN3ZK?=
 =?utf-8?B?UUR2OHB6WkxiZVpQQm9KMzlMczB0cHd6VVRnSXUveTlkYkhqOGhuWk1vVFp3?=
 =?utf-8?B?MFRwS3BlNm5pV0Ruck55R3djNTR2a2hqckNUTFI0RUtLMk9lQ2Qybkg5cW5z?=
 =?utf-8?B?Qk5zZ3VBcjUwc25QQ1JGQnFRbU9UOFVVdnhVMnNhd21ZdldyQjZWeHZCSVNz?=
 =?utf-8?B?SXNHNGQxb0VPbDVsUlNwbHdMUnJRU05IdE1MUGgvOUoweTdORHlJN2dKOG5H?=
 =?utf-8?B?S29xYVV1TTBXZTB6cTlYRmJ5bXhHMDlHNG5ydmdtd0QzU0xaaExCTkx0Wjlh?=
 =?utf-8?B?Smo5eUJESlRNNVlSc0l6cmhINTNFQW1oTStyL1BQMGtTanc1U1ZRejhNQzhy?=
 =?utf-8?B?Ukp3OWlLK1h3RzFlaWJzNUY2T1AzY1R1ek5rRzc3SzhnblhVZk5nVm5QbVJ1?=
 =?utf-8?B?NFZUdk10YWY0d3U5YVBTMEJLNTEyMmZpOUQ3OHFtV0ZWeXhwSUttb212SEZX?=
 =?utf-8?B?bkNCSzgybWlJbXVob0RyazRta0hXNUVSUitSeDRHMlovZ3FDNVlaZXNXUnAr?=
 =?utf-8?B?VmV5V09QeGFOdW55MUF3dGpKNkJnUGJMQ2tpK1l6TXNVaGRxSVJLUkdDMDM2?=
 =?utf-8?B?cUljaTYwYVJDUVVOVWNrYjRBUDdySGdQUGFyejljQVBpVVJINEF1NVFGZnhK?=
 =?utf-8?B?aG9LN2VTbHNBcVVXMERRa0tSSmJlVWc0VFlnUkhyUDV2blNFYWNDNnlyL1VT?=
 =?utf-8?B?cmpQaXdMU0ZVUk55c2M4OUZJTDJOR0Z0dDVMSEo4enpPU0NUMDZ6MWNoNmV5?=
 =?utf-8?B?WTFyYlA3cHlXWWRJNUtMTkFNdkIyenJiclUvMFIxNkg0YXBtc0M2SUdWNS9z?=
 =?utf-8?B?QWFYTEgyZDdrOEVWbUF3Wmd0M3E1RzZsTk9uZDdqeW8xQ1BQYWxrVTU0ZVJV?=
 =?utf-8?B?c2F5U1lucmsvOEYxWFJWTVpTRHNvRGljRFVHcGx4LzZLeTVtaWQxY0w2RnNn?=
 =?utf-8?B?N0FHeXR0Qm9aYkR5ZmJJNkl5YVpqZC9NcGJNMjF1Y20rQUUwUlVIa1V4NnE2?=
 =?utf-8?B?c0JpSERidnU0Mkx0MDZjalBnbVY0MmNPaU1jMjVlQkVPVm5SYzUwUUZKUDhR?=
 =?utf-8?B?bjkvNGY0MXZxOXluVHdxeXQxdWE1L2Fqd1JJbkpnYzRsb3Q1NVlHQS9XOHJa?=
 =?utf-8?B?SitEczErYzF6cUxKSys4cU84bGs2cW5EUGRWVGEvQ3FNWUhwYXhZaFVUd1Bj?=
 =?utf-8?B?MTMxOGh4MldrcDlydkxQbW1NSGVLMlBnOU9hcVUxYTlnbm0xK1VCZGQrdm5Z?=
 =?utf-8?B?dVBqbjE1STYzNEJNemhZcVRPSnIxVCtUNHdPWTRkVTZjRTQrZk9rdi8wK3d5?=
 =?utf-8?B?T0RLZC9BOGQ2Q0dYZFJqUFR6L3FOLzRzblBsUm9nM093SlBoM2FsV1JBTHBX?=
 =?utf-8?B?Q0xqYm1sa0lPMUdWc1Q1YUhOaWErbUg3VFU1OTFqM3J1UElUQ2R6WTRSa3A5?=
 =?utf-8?B?MEp6eTFoWDc3MFp1b1VBcGc1OThZc3JjSUV1Qk9lQVFzN09nYU1QaWVLSi9F?=
 =?utf-8?Q?O98qYTZkTbNPo7nalxsH6GLMovsM4EBaC3LXhhYQsalT1?=
x-ms-exchange-antispam-messagedata-1: Cf4z+jABPBHG0w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956fec5e-368d-4629-cf57-08de5d83b5fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 09:09:00.8207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTql3t/Ap4V2r+EQv8OCBc/7N1CRuLZ3HBPUwnq12J0A9KrSle1nq8lW+AX9Q4ejx3kPU7swRm5DGWxCVGGOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NCBTYWx0ZWRfX5+GHkxj9byjt
 GmbL/KzbV1iLiswfGOBT6bZnUrZHwAmSEnCVXFU4mWh3DEHLE3dtLlzGmTO8gs0yj/gkDTJFqAd
 7kC9Jsm2NPxMyxCXE19Y3Sm7Hph+HQ+9VGWz3+4b6DVrOM3DVEigBpDTk/NSd8mg8bu3BAR00tK
 JxyIY8A96HhT8L0xd3tWdXzyNViZsd7D7EC0SIOkH3nDsZyn35Cg1oVeX5EqrZ9Q7jxaD2wTO+/
 IBw6OtvEH8v3JESMfY8FUDdnJAt91P8z2RHfZj2fVEF4ECnJIp1hfNwjHQmiPNbprYypwDjJtz0
 DqOhOKUw44X+Pe4lV7Sj9hhHMl6SNelnnlpPVsItbsePx45N4dtpaLxZhBypI94OMETgdDPsTSt
 BPuRjCoOwPyh9yU87NZO6PvF4WXsGQ8k648pk1q80aKQ6FVpXdSCDtjDtI6DDlqsDyt3GoZ7KIo
 auprHjupGL+/udsYT7w==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=697880b2 cx=c_pps
 a=MmwiYf2CWIeG5bfvH5NISQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=2Io4RIj7DghyKQ6a8uYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kU43F-hkKs87WYNDSDkr4H7fHvUtB3z2
X-Proofpoint-GUID: cg79aA61TweMHgj1jNx1V4ku_sDFilio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230034

SGkgUm9zcywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJJ2xsIGZpeCB0aGlzIGFuZCBzZW5k
IG91dCBWMi4NCkJ5IHRoZSB3YXksIEkgZGlkbid0IHJlY2VpdmUgUGF1bCdzIHJlcGx5LiBJZiB0
aGVyZSdzIHNvbWUgb3RoZXIgY29uY2VybiwgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQpSZWdhcmRz
LA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDI2LCAyMDI2IDg6NTQgUE0NClRvOiBDaGVu
LCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggMi8yXSBzeXN0
ZW1kOiBhZGQgc2hlbGwtcHJvZmlsZS1kcm9waW5zIFBBQ0tBR0VDT05GSUcNCg0KT24gMTUgSmFu
IDIwMjYsIGF0IDAyOjE5LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxRaS5D
aGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiAr
UEFDS0FHRUNPTkZJR1tzaGVsbC1wcm9maWxlLWRyb3BpbnNdID0gIiwtRHNoZWxscHJvZmlsZWRp
cj1ub+KAnQ0KDQpPbiB0b3Agb2Ygd2hhdCBQYXVsIHNhaWQsIHdlIGFsd2F5cyB3YW50IHRvIGJl
IHNwZWNpZmljIGFuZCBub3QgbWFrZSBhc3N1bXB0aW9ucyB3aGVuIGVuYWJsaW5nL2Rpc2FibGlu
ZyBQQUNLQUdFQ09ORklHUywgc28gdGhlIOKAnGVuYWJsZWTigJ0gY2FzZSBzaG91bGQgaGF2ZSBi
ZWVuIC1Ec2hlbGxwcm9maWxlZGlyPSR7c3lzY29uZmlnZGlyfS9wcm9maWxlLmQuDQoNClJvc3MN
Cg0K

