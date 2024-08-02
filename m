Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D68C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:37:03 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.56])
 by mx.groups.io with SMTP id smtpd.web11.91543.1722602221270167923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 05:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dMUdXmsf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dMUdXmsf;
 spf=pass (domain: arm.com, ip: 40.107.247.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fmHkpYOXbsgnF6Ci26r8lW+gfExugbO1S2i3bwRR0po9GVvoFDWI1k+fmXsU/34I/xI2zeEi0ETTDID4mWdVb95xgDw6eKJ764ghsxRFOhp2OwH5DYpGI+qkyUXKI8k0ZTGIRb+tk2/dP2h8YyPzW/QOa2/HIIivDBoEjuMwV57iGIik+5EziLtu9CkJAnDd1UF1q/UlCk2mOCycq6dhOQkorxriXwyAoTE6+HzQfoljdm3fD0xUij7CQeaPFwGCLtzijT+O+Kg12JOmK23GnIuJ7avY0oDuk0FliQj2zlaoPhid3M9ynZ9ew4AhR+GJxswZVYMtAiz3cEEO5OBBVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7ppcGrHKRlnqaiDJPoR2IyUDOFeeIB+feo7U29VKhg=;
 b=BJxyDzWJrjcC/POQ9RSl0Gk9dQhOhLhsirMm1le72VH65zqaFicyOemfWb/BC5BlnBgJjw7b087Vh7LYaIsM3vLNm5N7Gm5IB0xmZk43hyOsVbFkj1AykuhYD8ier5aGBkZ+9Ji5+SwS207/6H4fhhhsY6UtD+EWGeMCGJhxbuNqPzl84O+FiIiikZgnFb+kK365NbsjluF3g+gwZqZu+DD2fnj1ExNlEOv7BmlXNuc1xztTmPSD1IkFO2VorhM9v/p5AqIjLePuMJU9F2wZieL4qQF/WiUAfGv8shcQlWZjEDZk1IgQ3iIw66zwbjO+PLcXn32ZCeuLI9xI7wGhBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7ppcGrHKRlnqaiDJPoR2IyUDOFeeIB+feo7U29VKhg=;
 b=dMUdXmsf5F+snWclBAT7qcSEHcDKQU/JNK9EpjKdkzu3xdBvt/QcN1Nii1vfCOK8IhvppppLwg1FeoVvRKhutRtHsx5ld2fDOjK2leZQ6Z/iWiUXTMPKe1XYwO3zFW8iovaG2N7wnIXKJoXycllXsJ1BAVYCv7Po+YRF0CeSmao=
Received: from DB8PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:10:a0::27)
 by PAVPR08MB9747.eurprd08.prod.outlook.com (2603:10a6:102:31e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 12:36:57 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::55) by DB8PR09CA0014.outlook.office365.com
 (2603:10a6:10:a0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.37 via Frontend
 Transport; Fri, 2 Aug 2024 12:36:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19 via
 Frontend Transport; Fri, 2 Aug 2024 12:36:57 +0000
Received: ("Tessian outbound 64d41e6a4c04:v365"); Fri, 02 Aug 2024 12:36:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89f2dd97c068d2fd
X-CR-MTA-TID: 64aa7808
Received: from L572ec8e8e15f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 842E9FCD-E661-4E2E-A6A8-FF39A9F240D9.1;
	Fri, 02 Aug 2024 12:36:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L572ec8e8e15f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Aug 2024 12:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJZxSeLobOES8AExju3/lOb+09z0trl504zf23UVoeFdFonqhKCvx+zCHH3fvrAE3P6834Uz5+ixC6DdGwTnPsiq7zKTXpAdf1JRaWcQq4nRAYOGNK2WNL+zXTWmOOKQpTIkPJSCqHSBIOXXdW8ZBGZAy8FtZyC+Tiizl6or1gINz3+gkw3Ip3GQ+LGNPmeQmYPrydJeX5iwhI+DLo66ZJkpWx6rnHV0wGv3v3W+Z0SSEGdEGIEyljU0FySKJrWTTzViUiXRgEvSHqul6EsXPSmz+Uh1XjS79LaNacUB6MHWLbREyaSVQGImpw2pg2z+ZOkHvTFPztzRiuHTaDK1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7ppcGrHKRlnqaiDJPoR2IyUDOFeeIB+feo7U29VKhg=;
 b=l25EXcO1CjAXiJXS7UGNCe0R7dfKYwzefmigQNCNm0T2Dg7eHZGUC3BzX42bmFVWMX7DDZ304bsfbOCshs9ixRXvyyIkqysB3Mx7nuMpTNFNKH7nO035KJH9vZmvNI0QM8of7v3+e4FXMaPWnLs6X1kyOv0b14K+R5I4I2zABC4IesIxEm/6aO7FJCFNAtDeoPgxzIl5zbsqJ70PgMQkEayvjZYl+6LsmUwnmXvMN2pGQgbJ/kgScui2FWLVEx8g8dQugRVe0xc9AGzXAuWPWywzApdKiYq4HHimCcqUvsGu+QhpswUj4Y7D27aXKvpeHI4jJSKwiigwrbBQ4Gpc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7ppcGrHKRlnqaiDJPoR2IyUDOFeeIB+feo7U29VKhg=;
 b=dMUdXmsf5F+snWclBAT7qcSEHcDKQU/JNK9EpjKdkzu3xdBvt/QcN1Nii1vfCOK8IhvppppLwg1FeoVvRKhutRtHsx5ld2fDOjK2leZQ6Z/iWiUXTMPKe1XYwO3zFW8iovaG2N7wnIXKJoXycllXsJ1BAVYCv7Po+YRF0CeSmao=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6254.eurprd08.prod.outlook.com (2603:10a6:102:f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 12:36:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 12:36:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?TWFydGluIEh1bmRlYsO4bGw=?= <martin@geanix.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/2] ell: add ptests
Thread-Topic: [OE-core] [PATCH v3 1/2] ell: add ptests
Thread-Index: AQHa4+wdcDhQbUDUt0WLh0nG4R/Gs7IT6WQA
Date: Fri, 2 Aug 2024 12:36:48 +0000
Message-ID: <AE35C2E5-DFDE-4817-8068-95D30C567870@arm.com>
References: <20240801082253.974486-1-martin@geanix.com>
In-Reply-To: <20240801082253.974486-1-martin@geanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6254:EE_|DU6PEPF0000A7DE:EE_|PAVPR08MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: c91f0c83-309f-4ef7-a86a-08dcb2efcc7a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?KytDdXhKSjBhVklaSFBQQWViN3E3VVZtUHpnNzZkK0hBaFo3QkdnMGJLb2RC?=
 =?utf-8?B?dUcvMFN6azJkYXNaRk9VL0JBalFMdjlGNmxFVTZPSVZTU0xDN2o4QS9LbE9r?=
 =?utf-8?B?WnRXQ1RlMGxPaFVtdjg0NVBKNWVJblBrN0VRNmpzdXgzY2NKUDlrNTRRMjZQ?=
 =?utf-8?B?NkVPc0FXMStsRUtYU1g3RVh5bGhXNHRzS0RtQVQ3ZURKVDdzQzkrNUQ5cnd1?=
 =?utf-8?B?emFqSVVCNVU1WTlsWUtmeTl2OVNZT2FLQVlNWitURXdzdy9yd2Vaei84elZn?=
 =?utf-8?B?WGxwK2w2UXd5K2FkV1hMNXBPWWpkSnQrQzhoWEUyZkI2NG5CUHNZYzU2WUJ1?=
 =?utf-8?B?K1ZJeHVNc0RuaFpxMEt3UkJsZlJnd0ZxQWRJbVVCeHBkbVdOOEh4TzY2SG1P?=
 =?utf-8?B?UXFTbmx3ODhvSmZiQTgyVUpiOGV3NHI5TW9xV1VuTUlGSTdkaGYrN01MQ2JD?=
 =?utf-8?B?Tm5IZzlKM05HNWxMY3RiTllQZUVndkNjK2VtZVp6bml1R29mWTZJL0Y4Mk5t?=
 =?utf-8?B?Uk1KNzJnNyttU3dKT2lHRGt3VHIxQzRJbWdiMzMvZm1NKzkremE3S0tncVpw?=
 =?utf-8?B?SFdSOXhtVlMzTkN0Tm50Vm9iR2N2YVJsK2lXdGZGcFVkK2RtMHZYbmlCVjdJ?=
 =?utf-8?B?TTI2aXJrTlNDN28wQy83WkhtaEZmSTJ5akJiN09NMTVjT042TmtrVVlISGFr?=
 =?utf-8?B?REhBbWQ1eUdGOFBMYlBKWGtnaU0wUVI2NFV6aE9ZYUJOVDB5ckdRenlYMUhp?=
 =?utf-8?B?NkdBaWN2bWZlSkZhWUh3WkJzdis5d0ZWdmJrMkg5c2lTSThGRDNxNkx3ek1F?=
 =?utf-8?B?Y0ZwY0d4aWs2Y054Zk54N25NallJenJnT2pQNnp6QnRkM3NwVEN0M3VYdWho?=
 =?utf-8?B?Vnp5MmVmazdqc1lDZ2VQNDd4OThhUFNHWlVHRFJDcEFUd0NKVU9ITCtaZ0ky?=
 =?utf-8?B?RnRrNzdqSG4vb0ZXUUd6R095ckdub1NJaFY4S2VzZUViaVB4VHlxcE1mQ0Nh?=
 =?utf-8?B?aGs1bitlS2x6ell1L0JhNUczaHkwZTBPMjBQTXJNLzc0TnBqamZtZDVxUmJv?=
 =?utf-8?B?N2gxMUtYQ1FWS0NEZmlFS2RuWjFabC92My9Caks2TXFsVkN5QW13dncwdm5K?=
 =?utf-8?B?YUJ6RHdDV291Z25udU5PU0EvVU82bUtIQWxhNkxQQmtWWGhZM3lzVitnQkhI?=
 =?utf-8?B?Um5hb2c1R0VZRFdDY2xWT0wxN2RJcEw3Z3FOZGdienZKdWR0dU41dTU3Tkpm?=
 =?utf-8?B?Z3BBTCtaeFp5aExKZzRsU29ybWVFY3J3VW1ndDAyWGI2Ri9uRHhyUFVnSkMr?=
 =?utf-8?B?aTJFby9ZWGM3R1Fnc3BHbFM1U1ZCRjlzOElIZnhiTTdka2VDK3IyRHlYekUw?=
 =?utf-8?B?SEpHamdOdUxrakREcUlTK1ArYXVob1FUWldKNm1GbTFiaENSajl3Q1h1Nndu?=
 =?utf-8?B?aVpUOWJtL2JkMGkzck5iei9oWmQ2OGFRbjlvNmhMMFBzSG9pMWNIRUxlTXFR?=
 =?utf-8?B?U1pERzV5UXlrQjViN0hlQUxrRW5qckdPYjlCazFjaHZsdG54NXdFZURLanVv?=
 =?utf-8?B?WWluRkwySmVwd2tPZjlsU3J0dEJkVHB3M3ZwajRNSEYrWndNVjZ6SVJkOFc5?=
 =?utf-8?B?bC9ZWkJ2Sy9RbUo2Ynpvanh4VHJ1Q2MzbUdzejNYcmsvajNVeHovOXBQVnBH?=
 =?utf-8?B?c1RpeCtVd2RodTljZi9yQzMxNG9wTkYzWG5nRzdRVjN3RVdLbEtGZE16YWdu?=
 =?utf-8?B?WGY5N2xBc1lSb2ptaTdrQm44amRyNGo4VDBjRno5YWorUWpZRHprWFBVMlVr?=
 =?utf-8?B?djU3ajZNS1VPYnh0ZXpJT2I5VHZpcWJ6ZXRaaUlJNDJMRzlGNG1naEpQSmlu?=
 =?utf-8?B?b045UGFwYzVuYmpoT25yK0VQcXZaaytZOWFZQmprbVlHaHc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CA253033F85354E92C17A4D26DA1D38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6254
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a500cbf-bdc9-4f4f-fa3a-08dcb2efc74d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjBNNWpzaXFoY2pJaDQ4WEZjSXJxK1Uva2lpSHBHQktvTWVNcWNtQ3VTMFJ4?=
 =?utf-8?B?OHpzL0dGQ2hzc2JIais1Qy8rYzNzQUNiSmIrYnZjWFUyUC9MWG55Z21uSlly?=
 =?utf-8?B?aVkzV21GV1ovOS9SSlFiNTZEZVA3M1grTEE3YTNSUWhaeVByUklqdmFKRDc3?=
 =?utf-8?B?Y2Y1RmRUc0NZOHYyd3pWQWt5ekx4K1lJT0JwZ3ROenVTL0dRMGZnOVU1Nm9H?=
 =?utf-8?B?Q0tlSE1kaDZ6MGxOcXNQMzIvV012QTZGQXAxTVZ2NFZ2bFJVbk5xLzJjKzdW?=
 =?utf-8?B?dzYxUm1nRTNyK0MwSGRaY2ZUTWtZU2RVS1pBQkMyYzZ5eHYzTlRIVjR5WTQz?=
 =?utf-8?B?YTh0dm4zSGxHZG5xUzR0SU1nYnVxVlRBdzhqNWlrcVcwd0lFZWh5SElIcklv?=
 =?utf-8?B?c1c1Z21PbzI0ODhST001ci9mK2VQTlFzcHRkS3JJNlhqMS80dm9wRFNxOE9x?=
 =?utf-8?B?Ym8vT25nUE03Wk5LbTBHeDRxREw0NE5hT2pYRzB6ZnBjQzFtd1hoM0VVVjh4?=
 =?utf-8?B?TmovSTZpZ0Vkek9ISE1QendTUmpmVlA1SFlHTXlkdW1DSnRrMjFFWE43UzFW?=
 =?utf-8?B?aFFOUk1VQzZLRGZpRHB6UkdzSFZIODk4WWpUeW9rQ0grUXhBdWhBRTN3bERp?=
 =?utf-8?B?Wm8zZ1Q5bk9PUXFQaW1sUEFJVWU0bVUvU0tyNk9UL2tCWUhiWEZHWVUyN3ov?=
 =?utf-8?B?VmdEenJjMzhvUlZURlZLaDh0cjYzdlJ1aWhMbHp3R0Z2akhRVEZnL0Zic1Jw?=
 =?utf-8?B?dFdDNENieVVHbXFkWWJyNWxUOU00RHBNeGVlaDRUUTNhdnNNbTh3YmR2NzJm?=
 =?utf-8?B?c2FhTVIxaWRIZmN0QzVGV0c1TDRCaCt2aXNNdGhpNDdqSk1ITjc2bEJ2aW5D?=
 =?utf-8?B?TXVPODVWTVBaYStBWmppd3kxVWVDRWpoaXFoRnFDTFA0WGFkb3JyMmF5Kzkw?=
 =?utf-8?B?ZXZKNEVidXFvN1VXSmJLQU5jdDR1Y0RJMG1sSExqczJ5UHpYV3M0ejJlSUFH?=
 =?utf-8?B?Ni9KaVFldEd0QTJuQmg0aUxWeWRGcDNRdHQ0V3FhNm9IbnNFd2RYeE9zZWxi?=
 =?utf-8?B?ZkwxZFNsQzRqTHpWNkJjTWxOZDAvZzcyRy9DNFRoQ2V6QW9rRXp5STc0UGtQ?=
 =?utf-8?B?ZTVSYVBOTzN3U1VWNjZJWHFHSXhERzc5UU5pd0tmL2w4UDNBd2dqeHZ0MDdQ?=
 =?utf-8?B?MzdRVlB4NUNjdlBOblN5QmxDdEZ5S0VrSTV2WTlRb29sVVBKMm1jV3hzSDRw?=
 =?utf-8?B?S3g5ek5uSmVXelVQV21rUUQweHBhVlZPT3FpUTA4eXlSOS94dHNzNTBGRnhk?=
 =?utf-8?B?VkhRREkxdjlYUGZ4aSt0UERuSXc2RFNIeWszdFh2SlEreE5KVmtRb1duczVz?=
 =?utf-8?B?S0hNTmdJNTJ0WWpjNUxWcU9BTGVDUG0rNzhoMkVIUy9ZQUQycjZhTXk2VkxX?=
 =?utf-8?B?MkN4UnJRdTlRZzlYWHRhcHZyYzFSd1RURDFNbktWODZVdXYvVlVETDFYT2lq?=
 =?utf-8?B?cHB3djVHdVEyQ3g4TWM4WEczQUUwQjdCWmphZUJDQ20xWnpvaENudHFaZ2V0?=
 =?utf-8?B?QlhOSHl5V0JNZlJCbTRYYTJ6SkNBUlNBczZKWjluU3ZoRDUzRVg5NUtTSlNY?=
 =?utf-8?B?WlJFWGs0OXBEdU9maUZJV3ZnMFVBc0dMRXZSWjlhS1BvQzZTcCtUbnlZUGVM?=
 =?utf-8?B?SE5FYUQyRlFnOVA3WGV3MjVJdS9ReStYTVZrSHd5T0wyMndpLzRFbTdJbXhm?=
 =?utf-8?B?aFBaMis1S3NlV1kzT0kzcGdMbTFWYmRUN1NzNDZscTRPSVEzekk5ZGhOdHVM?=
 =?utf-8?B?S0kzMVlheWVVWlIrQkorU2pDTmZhZVlicmR2aGFXaFJCaExxUlpYbXpGUUMz?=
 =?utf-8?B?Z3lGUENOMlU5SWhhdXA2SkE4RjlkQ3lPN3NpcW54UkhWNnA0U0ZFdVppUGJJ?=
 =?utf-8?Q?LnoF+St1UMGSPhf8+bMmui1pm8ZNsBGJ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:36:57.7129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c91f0c83-309f-4ef7-a86a-08dcb2efcc7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 12:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202904

T24gMSBBdWcgMjAyNCwgYXQgMDk6MjIsIE1hcnRpbiBIdW5kZWI/bGwgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPG1hcnRpbj1nZWFuaXguY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjY3LmJiIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjY3LmJiDQo+IGluZGV4IDZiMGViYmU2MjExMy4u
ZWU5YWE3M2QyOTA4IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAu
NjcuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjY3LmJiDQo+IEBAIC0x
MCw5ICsxMCwyNyBAQCBTRUNUSU9OID0gImxpYnMiDQo+IExJQ0VOU0UgID0gIkxHUEwtMi4xLW9u
bHkiDQo+IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWZiNTA0YjY3YzUw
MzMxZmM3ODczNGZlZDkwZmIwZTA5Ig0KPiANCj4gLURFUEVORFMgPSAiZGJ1cyINCj4gK0RFUEVO
RFMgPSAiZGJ1cyBvcGVuc3NsLW5hdGl2ZSB4eGQtbmF0aXZlIg0KDQpUaGlzIHNob3VsZCBiZSBj
b25kaXRpb25hbCBvbiBwdGVzdCwgcmlnaHQ/DQoNCj4gK0VYVFJBX09FQ09ORiArPSAiLS1lbmFi
bGUtdGVzdHMgLS1lbmFibGUtbWFpbnRhaW5lci1tb2RlIg0KDQpNYWtlIHRoaXMgY29uZGl0aW9u
YWwgb24gcHRlc3QgdG9vPw0KDQo+ICtkb19jb21waWxlOnByZXBlbmQoKSB7DQo+ICsgICAgbWtk
aXIgLXAgJHtCfS91bml0DQo+ICt9DQoNClRoaXMgc291bmRzIGxpa2UgYSBicm9rZW4gTWFrZWZp
bGUuYW0gdGhhdCBoYXMgYSBiYWQgYXNzdW1wdGlvbiBpbi4NCg0KPiArZG9faW5zdGFsbF9wdGVz
dCgpIHsNCj4gKyAgICBpbnN0YWxsIC1tNzU1IC1EdCAke0R9JHtQVEVTVF9QQVRIfSAkKGZpbmQg
JHtCfS91bml0IC1leGVjdXRhYmxlIC10eXBlIGYpDQo+ICsgICAgaW5zdGFsbCAtRHQgJHtEfSR7
UFRFU1RfUEFUSH0vdW5pdCBcDQo+ICsgICAgICAgICR7U30vdW5pdC9kYnVzLmNvbmYgXA0KPiAr
ICAgICAgICAke1N9L3VuaXQvc2V0dGluZ3MudGVzdCBcDQo+ICsgICAgICAgICQoZmluZCAke0J9
L3VuaXQgLW5hbWUgXCoucGVtIC10eXBlIGYpDQo+ICt9DQoNCkFzIHRoZSB0ZXN0IHNjcmlwdHMg
YXJlIGJ1aWx0IHdpdGggbGlidG9vbCwgaXTigJlzIGJlc3QgdG8gdXNlIGxpYnRvb2wg4oCUbW9k
ZT1pbnN0YWxsIHRvIGluc3RhbGwgdGhlbS4NCg0KUm9zcw==

