Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0E6C25B75
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 00:48:17 +0000 (UTC)
Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com [216.71.158.65])
 by mx.groups.io with SMTP id smtpd.web11.5791.1716511695788242912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 17:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=PoxrTDyr;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.65, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1716511696; x=1748047696;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Cb+aySJOx+JkGlc1McwzJkohjtKTzXNCM0oM1xHgXKE=;
  b=PoxrTDyrGHPJFvw0oZn9G+ww7d5oB6oMzcd+GDyj6QCrXVzra4rE6nm7
   tdQlIh+TizoCpXRoKzqy8+fmL6aVlectzCsNU5C2dwIo2A+oDlHEWvmEe
   eRtaef7XRYV/HAOS8bqp8k9jH4kjUoHSr5bb16WYKjuEM44r00Ejjg1PB
   R+ThUn9RW0fp5KP5p7rONfdC0d6W1YQIptL98kl0IqkCx3ezDT4ixNftl
   1aCvK5QG6/hnbjCgAhyaIUuMrX0t8xvw3M7A2pyILJ+z42N3tRXM81xVG
   Fo6wy3FmCOulLEcz1sPtWHbp3RlPTUIXfB6txpprqjG4+PLUXwvk0X8fV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="120108700"
X-IronPort-AV: E=Sophos;i="6.08,184,1712588400"; 
   d="scan'208";a="120108700"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 09:48:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OV9acTAuSkKs0mvb7BjoOLkz29B9clY2A0zYGQ6N4QT6qGepgNF6B4dDwZV9mtI+nUWI9A3qWCYbD9wwU6wS0lxK0LngWaa6juwhqqod3iK1zP2IZxp0CYAZ/JfLUHxhy8DXHdCk5M4m7E+8ev7gDfUcllT3UKEYQfK4Hj+QF5asohhruCD8OT3eh4Ow80ilxbx+XG/Bc/S7D4+ncDppub0OMLHauo529bt+vfHHCBgb2RbxUC6/uiuZmk8KcTk55HFkv/apFIzSvBKxNfiS6kRSfv0qxN5GWO8tvOoKPJD7i026YaG19xnUWG+79+I3C+qriUdBOExL4o548AgNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb+aySJOx+JkGlc1McwzJkohjtKTzXNCM0oM1xHgXKE=;
 b=YczEc1L+giK4RERCgc7RqOS7YP8a48JMmCNqY1BTvET9hFhsnOuEvTbp9HwvuNqInkUIo3DmhmxipGLXRr8YeoRj6xVPmGWF6BI8IqtsFPQUtCNedwrkI2/s+Wu0EMAXJ5D3P120aTh8wrd54US8GU6Zit/RA68oykVVIsTc4oSEtVqaliKYUDoeqDxmEzufLmkSzJ2GaljFR30GBmK18VV/YsZ9eWYQK5Bc8IoSnoD0txzu5blnbh+suztmsd3vMBp4ID7zE7NdujFppGUuw6oISTiDY0HQYEcpaiShHjPLZtaqOfTWn7+Jd4RmZnWv5xyhwOZntVOJ0RaZNYp1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYBPR01MB5344.jpnprd01.prod.outlook.com
 (2603:1096:404:802f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 00:48:09 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 00:48:09 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Max <max.oss.09@gmail.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Max Krummenacher
	<max.krummenacher@toradex.com>, "stefan.agner@toradex.com"
	<stefan.agner@toradex.com>
Subject: RE: [OE-core] About an issue of run-postinsts.service
Thread-Topic: [OE-core] About an issue of run-postinsts.service
Thread-Index: AdqsuG1Dm358pEh5T9iqKv0mM6McXwAIVzcAABaxqwAAD80tAA==
Date: Fri, 24 May 2024 00:48:08 +0000
Message-ID: 
 <TY3PR01MB11056BCF3936385F189A397A4A0F52@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: 
 <TY3PR01MB1105631CC9A9A05E506C8D948A0F42@TY3PR01MB11056.jpnprd01.prod.outlook.com>
	 <CANNYZj9UpUdJ2G5ng2Evipz4MeqbK_SuQuuQDpamnnuAxY8-Pw@mail.gmail.com>
 <96674a6743679539da9ca805adaf66150540d92c.camel@gmail.com>
In-Reply-To: <96674a6743679539da9ca805adaf66150540d92c.camel@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NmEzMDdlYjctNzFkYS00ODNkLTkzMGYtMDQ0N2Q1YzBm?=
 =?utf-8?B?MzZkO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDUtMjRUMDA6NDY6MTBaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYBPR01MB5344:EE_
x-ms-office365-filtering-correlation-id: 64c06206-aeb3-4831-66f7-08dc7b8b2e78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009|1580799018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aEgzZ2tFY2w1MEthSHJONFQrbUJhOXZXNDNtUVc1MEJhck01enJacXlnblVn?=
 =?utf-8?B?bDY5NjhOSThMRlJRd25xeEVaOURqRGl4M1VneXF2WDZuM1h6ZjVvM0xmMUsr?=
 =?utf-8?B?eHFuaVdoU3pXRVNKU0E0enMyek5tNmRKbHF5Q1U1YVF0cVFrc3ZOcm91ZVdr?=
 =?utf-8?B?QmFYeFZ0NGRqYllsWWxlekxyUFdVRUdPM3BYK3U1R0c0cFFMVFBSMEhWYm5o?=
 =?utf-8?B?MFl6c0dyZERaUHNlaEN0cDlQbldXeVlLWTRlQjBBYUw0eHpqQ20xdFB4Zno3?=
 =?utf-8?B?bVdwTDZTUExGZkJzVFd6aVd6ZGIwUTEzQkYvaDY4cEhiTklXaWJXMDFjdlVD?=
 =?utf-8?B?T1hnZHNWN1gxVVVpNXZNNUZwRDFwQ2svOENhK2N6R0J3MkNnenNuZWV3cUtB?=
 =?utf-8?B?TzBXc1krYkFrTGVZSWkyQ3B4VHQ0em5qcHdnRlBydTI4eStjditJTVJEY09Q?=
 =?utf-8?B?YkRxOUhJNHpPV3hBNTVHNGp4OFdZaldCKysxRHRYUFVNUTd6bFBkYUt3d2xh?=
 =?utf-8?B?aDRrczlhUkRrSGwzNFc1YkM2STNyYkdDNFVKbVMrbVJoRGdUemVYdnBvOU1S?=
 =?utf-8?B?eGIzT09HY0ZhdWlpRzdDdnE2RXhTK0lsNUk5RFlrWDU5aGVFQ2ozQlFXUUdk?=
 =?utf-8?B?ZkFDY3dpUVVrYnlZZkxKWmlWejJHU2ZCdk9qMGlwbU0xUkdlaUlpOHc3MGts?=
 =?utf-8?B?ejRvYlNZQlpiUm1iQWNSZjVUQkhidnN6eE00bS84TDRubnZEWEVOTmJrZ1JV?=
 =?utf-8?B?OXpxbWFSanJXWHliSmhtWVh0SXdja29iWXJVNnNRMEtYbWRodFRIalRlL1JB?=
 =?utf-8?B?VURESzRMMWlYblFCU2FRRllFMFkrWXpDckVHRzlmQU5aM05KVWpiTmpxSU9M?=
 =?utf-8?B?SEJPanJpZE5idkg5Y1FudVIwNEZ5WjhzNThNbzJFWE5QbEc5aGpMeHpiaXFY?=
 =?utf-8?B?MXJMaXlhZGVTVkFZVURUWVZIQjlacWgyQVd2eG83OWtyelVZOGhQQkRhRVhs?=
 =?utf-8?B?N21ibmVYdzdxU2t6NVcyM2tuTVdoVjJhUTZpci9LaTUxcXJCRHN4eTVIbTdF?=
 =?utf-8?B?TXExZXh2RnZjQWlLQVlFLzArK2JwaXNuU1FFMVhHVjVMTEt1RWZQRG1ydW5I?=
 =?utf-8?B?V1hlcWNMNk94TEhlWFpHL2J0MDlvTnJtamdMUDZNQW5lVVphRWhYR0xBMS9B?=
 =?utf-8?B?Z2lmY0hpWkRMbXYxbzdkdEcxQ2FTbjQ4NTJ1ZDZ5amJYdGswTnAwdW9JclF0?=
 =?utf-8?B?dlMya1ExMjgycXBUc3RmRTlnTHBXQ05XVy9YOFc3SG9LdEtyTWdHbnU5azNl?=
 =?utf-8?B?ZHNKRTJjeENMMnoxMUVSMEN4V0g0ZFB2c212WkpyNkhMM1pEeFp1YXZVWHpD?=
 =?utf-8?B?blVaV0ZhNHhHVlFnRk1qdEM4bWM4V214R2xCYVRSN3JqSXZNRDViV0VnRHJI?=
 =?utf-8?B?TE9vRTFRMFFhTFFLaXc1MDk3c0RNMUZTb0xzS3oreGdRaGlYOHJkMGNOZmpr?=
 =?utf-8?B?QWZ4ckJFdWdrdmd3VDdmbDkvY2Q0WmlXRnczenNEd2pGWFZicVN1emh5U3dI?=
 =?utf-8?B?ZmpOTUFndDZFV09ZME1HWjRubUZsKzVEUk54eU5WeHZXY25UeWNINXUwT0tQ?=
 =?utf-8?B?N1BzWmMzSkREdlQvM3M2TWJVMDZyM2xsVXkrSWNpUmNDR1FCQWNVcEFLN3dJ?=
 =?utf-8?B?ZXFMbzFOR1NoRm01aGtHckF0eE1ad2IvZVRLUG04U1VmMDJNaDRtS3NrQUc3?=
 =?utf-8?Q?3LZX4YLytrW57ZmMXkTygbfTA9l8b7uvs1lV4T1?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0hBSWtIUVVFMnVDdEtVaEYyUDh6T1lnTURzM2crVE1PMUJ2T0EySXdEWkRU?=
 =?utf-8?B?dGZUam0zbUQ2aTlRMTZUQW1VdXVSNno1d1MzNS9NN2VUcUxkbW5HcVhVQmZl?=
 =?utf-8?B?M1R4YktpaDRRYlRNQU9IV1p6SUM4cjZ6MnRwdjNDbDlGa2FUMkRpUFpZL3dz?=
 =?utf-8?B?eTVsSzBwY2pIV3N0NGZrellTZi96ajRwVzBtUDgycGNIdmpSTmx2ci9lUzV5?=
 =?utf-8?B?UHVHYTJTSzkzNnFPM2FkUmpLbWRBTnJVQ0ozYkFiUnd5UDB6U25nWXNOUk1n?=
 =?utf-8?B?SlhVT1h3SzZHZkZHWFMxZ0hDZnJ4SC9HYkhxUlBZZTgxcVEva0FKQUxkejJ1?=
 =?utf-8?B?VWtEeTFZdXo1c0FhTWRkZTF2Ym50eGFQZXg2K29iYnY2VlYreEc4V2pZd1lQ?=
 =?utf-8?B?Ym11WW5UckpKZHF4cmRISFRpNHJvRVhzNEZybXA2dGN5WXVLNXQ5UmVKZ2JM?=
 =?utf-8?B?U29PcnhwREVRVjdRU1V5ZkRCNzlXZzV5Z0pseXI0RDVnaWVqdmdDWmxUdUFR?=
 =?utf-8?B?dk5DK1FReE03VVJtMHJ5N0hBUHM0L2xlZWFFY2UxazdHM0RnL1R5dGN3Wmdw?=
 =?utf-8?B?TlBGU09RTXQzL09XanZpQVA3MzVvcTBZNkFWNWZlbVJ3b2VDTW5meUFWa3Uy?=
 =?utf-8?B?K1V2TGtEMFpFZEhhVVA2OUtBMWs5cTN4UlFVQ0FpYW42MlVOL3FreFJTallE?=
 =?utf-8?B?dG5ZalJ5MEoySVJiY3BzSmczRGovZW5jN1cvb2pNWWNYakhQQkZndUZjUG1s?=
 =?utf-8?B?VDMwNU9TeWNlR1VTMW9EYjF1Qzd6SzVrcUE0UkpLb0M5SXRhWlBYWUt4K2Zu?=
 =?utf-8?B?Q2tTVWwxK1FJQ1QrMkU3ZjFIU3BXVGl2Q3BJU3hOcmlTazdoa2FkbkpKcmpT?=
 =?utf-8?B?dGp2N0dSMGlyS0dRUEVzUzRMdlpEQzVOZjUveFQ4VzMydlVpQjUyeVlQMk13?=
 =?utf-8?B?SDNHQW5IYWVGb2I3VEhRek9IRUZUdkFnN0xkTTFZS2pKN1hzdmpsc3dneFd4?=
 =?utf-8?B?a3EzSk91YzNIcGVyNWJwNXp1bDZmZlN1cFVVMnRBdTduYVg4MXhhMDF2Wm53?=
 =?utf-8?B?UGVqRXVCMDZBbTNVNFM4YVlpck05NmsyWTYzdkdXR0xXdUxpSHZ4azl0RTNq?=
 =?utf-8?B?b1B3ZXNZWWtHMGNTZ3RYTWJ0TnduSVI4WWZ6dTNEWmtSZzduYnJ6WC9jaVVV?=
 =?utf-8?B?Z1FwWmVwRjQ3REd5cnY5Mk1zWG5ZaURXOVVMbnNoKzRrbkM0L2tWY2VIMElq?=
 =?utf-8?B?WGtTNWN4NW5rc3I3bEZ3bjB3MkxEc2RaM0RzR3UrUmFRVWk2OW9rMUc2Q01R?=
 =?utf-8?B?SlJFdFl3S2IvVlEzeTlEendkb0psRXhoaWVEODVFeFlFOHRQSmdnME1TMmJW?=
 =?utf-8?B?blhXRDBYQ05CT1hwZVY3Vlo0RjNoenBISXpvWDJ2WHhsc010SGtUQlZHalVq?=
 =?utf-8?B?L3ZOVnlPbUw0QUR5NjhCYjBZR2J4K2NRaFdueDRCV1cwaVZ1VkNnUmpwcHlG?=
 =?utf-8?B?aWJpa0R2dXNpdk5lQW5NQUN1b1N6YUFYejhIL3hhbi9GUXpuVGprLzZIdWRo?=
 =?utf-8?B?Qk5QL0pONFlOZXB0TFBFczMzUnpKZUgxOG5Oc29FYWhFMmViQ2d2Y0xMME5p?=
 =?utf-8?B?c0s0OVkvUmhUazdyOWlVQWlmME1xUEN5TjVLWjV5UEJjTyszVFU5LzI5V3Bu?=
 =?utf-8?B?ZUVyMXZMQlFQbUVCUithWjRUS0RuTGNWNndEajZMcGZyMlBPK0czbUVVSm9K?=
 =?utf-8?B?TXRZR2hCeGdZTGZ6WXNxblpuelU1L1k2ZlJSZ0pJQVlMM3NOTEpNa1FuRHhm?=
 =?utf-8?B?VXd3ZmdyYVJHcENWaHlndHc5TlUrTFpuOEN1V1hNM2ZwUVcwWDdTcGNDUmpi?=
 =?utf-8?B?Z0pFT01iTmROK0tzT3lQb3M2TlhzclRVZUZaNHVWSENlLzRieUxDWXc1Qmp1?=
 =?utf-8?B?eGdueWY1SVgrSHlSL0RsQTRwU1RPUFZHd0IrU2MwamtMbG1CdXMra0FZQnhK?=
 =?utf-8?B?VkZFUlhLRVBDdE1VZFZxcEV6MzN4NCtsNmUzUUJUYWNNcCsyTVVBa1lxS1dz?=
 =?utf-8?B?dVJZQ2MzTjRVai90R1U5a0lvRytOUXNwNG84VjdidU1IR09vOVFXU2NIczQz?=
 =?utf-8?Q?9dmUDJhnBZ07+GykFjCng6fUE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	C+aP1hfqQ/Xhx23n/NA2AVscAYqYj6A8/JqfsDcJx8LHgw8Rz5WUvUBYhN1+sJsxf+a9+kEsYklIfLrf6ZFTapQhdX0prDBSyo/h9+dKuYPYFwIlmintVqz8qgJWY7gfQ/AoeBAydP9kLW02MgVwLivb98kwRG/JDFAlIf7kVQ/C3ylV0GGF12QC5mlwGiHQZmL+VA5lgwlN9tuuA3HN996L+VIi+E/C0Doe5vYWHcEDVj0MkuTtyll7xoHqoeQf8J2eJeXZBZWndFPzDWWP5qNLAdm38asb8H+f0LQJYNvQ1ScJ8FRBRkBDmS4hiOw2+lfY7VjT086yo6WH5LFgtIRGCsRla403uZ5p2CfRXZX7j5FtveIMGBc7nnT/GIt0hTMu55MEFiEQTgGIHe7j8naXAl/ChKQEv5VvwxYRQwgVpUHEoifvfBdoRundWdQx0TnE46o2LePbadEv7MMK+fq7qnVJKYGm+sL3cIaDE+krKBoBACNXU5P+P2j70LTJRKJmdHkFQxN3lZQEkQGovss3MeJTa0tjC/fK8adgSZ9Wmmr8wFOUKdU/SAptwTTFNzErAjGTo3UbVc10sw4nHOkZVUxTvF4E/Vmh36hcJj5uJ/jnpNYChPnYCN/mTX4S
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c06206-aeb3-4831-66f7-08dc7b8b2e78
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 00:48:08.9894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R60IthGGH5XQ4JxcKyVR0JJG3e79YIb7E/BzRNYnDsd52GSEWPD1PUtUEvU2vQpp/ByUQfte48ra8LqZtnd1bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5344
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 00:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199822

SGksIA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuIFNvLCBJJ2xsIHN1Ym1pdCBhIHBhdGNo
IHRvIHJlbW92ZSAiLS1uby1yZWxvYWQiIGZyb20gcnVuLXBvc3RpbnN0cy5zZXJ2aWNlLg0KDQoN
CkJlc3QgcmVnYXJkcw0KTGVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWF4IDxtYXgub3NzLjA5QGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMjQsIDIw
MjQgMToxNCBBTQ0KPiBUbzogYWxleC5rYW5hdmluQGdtYWlsLmNvbTsgTGVpLCBNYW9odWkv6Zu3
IOiMguaFpyA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTWF4IEtydW1tZW5hY2hlcg0KPiA8bWF4LmtydW1tZW5h
Y2hlckB0b3JhZGV4LmNvbT47IHN0ZWZhbi5hZ25lckB0b3JhZGV4LmNvbQ0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIEFib3V0IGFuIGlzc3VlIG9mIHJ1bi1wb3N0aW5zdHMuc2VydmljZQ0KPiAN
Cj4gSGkNCj4gDQo+IEFtIERvbm5lcnN0YWcsIGRlbSAyMy4wNS4yMDI0IHVtIDA4OjIzICswMjAw
IHNjaHJpZWIgQWxleGFuZGVyIEthbmF2aW4NCj4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc6
DQo+ID4gT24gVGh1LCAyMyBNYXkgMjAyNCBhdCAwNTowMCwgbGVpbWFvaHVpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+ID4gPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+ID4gQW5kIEkgdGVzdGVkIGJ5IHFlbXUgYW5kIG9u
IFBDLCB0aGVyZSBpcyBubyBpc3N1ZSB0aGF0IG1lbnRpb25lZCBpbiB0aGUNCj4gcGF0Y2goZmQy
NjZiMWI2Njg0NGQ2NjBlYmQ4ZTMzZmUyMmMwOGM4ZGRhY2NiZikgd2hpY2ggYWRkZWQNCj4gIi0t
bm8tcmVsb2FkICIgaW4gcnVuLXBvc3RpbnN0cy5zZXJ2aWNlLg0KPiA+ID4gU28sIGNhbiBJIHN1
Ym1pdCBhIHBhdGNoIHRvIGRlbGV0ZSB0aGUgIi0tbm8tcmVsb2FkICIgZnJvbQ0KPiBydW4tcG9z
dGluc3RzLnNlcnZpY2U/DQo+ID4NCj4gPiBJIHRoaW5rIHllcyB5b3Ugc2hvdWxkLiBUaGUgb3Jp
Z2luYWwgY2hhbmdlIGZlZWxzIGxpa2UgYSBoYWNrIGFyb3VuZA0KPiA+IGJ1Z3MgaW4gc3lzdGVt
ZCwgdGhvc2UgYnVncyBtYXkgaGF2ZSBiZWVuIHNvbHZlZCBsb25nIHRpbWUgYWdvLCBhbmQgaWYN
Cj4gPiB0aGV5IGhhdmUgbm90LCB3ZSBuZWVkIGEgYmV0dGVyIHdheSB0byBoYW5kbGUgdGhpcyAo
dGhhdCBkb2VzIG5vdA0KPiA+IHJlc3VsdCBpbiBzeXN0ZW1kIHdhcm5pbmdzKS4NCj4gPg0KPiAN
Cj4gV2Ugc2luY2UgcmVtb3ZlZCBhbnkgcGtnX3Bvc3RpbnN0YWxsX29udGFyZ2V0IGZyb20gb3Vy
IGltYWdlcyBidWlsdCB3aXRoDQo+IE9FIG1hc3Rlci4NCj4gDQo+IEkgbm93IGJ1aWxkIGFuIGlt
YWdlIHdpdGggYSBkdW1teSBwb3N0aW5zdGFsbCBhZGRlZCB0byBzZWUgaWYgdGhlIGJlaGF2aW9y
DQo+IGNhbiBzdGlsbCBiZSByZXByb2R1Y2VkLg0KPiBUaGF0IHNpbXBsZSB0ZXN0IG9uIGFuIGku
TVg2IGJhc2VkIFNvTSBubyBsb25nZXIgc2hvd3MgdGhlIGlzc3VlLCBzbyBsaWtlbHkNCj4gaXQg
d2FzIGZpeGVkIGluIHN5c3RlbWQgLyBPRSAvIHdoZXJldmVyLg0KPiANCj4gSSdtIGZpbmUgd2l0
aCB0aGUgY2hhbmdlIHRvIHJlbW92ZSAiLS1uby1yZWxvYWQgIiBpbiB0aGUgcnVuLXBvc3RpbnN0
cy5zZXJ2aWNlLg0KPiANCj4gVGhhbmtzIGZvciBwaW5naW5nIHVzIEFsZXguDQo+IA0KPiBSZWdh
cmRzDQo+IE1heA0KPiANCj4gPg0KPiA+IEFsZXgNCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTk5Nzc4KToNCj4gPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE5OTc3OA0KPiA+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwNjI1NjQx
Ny8zNjE3NDg0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gPiBbbWF4Lm9zcy4wOUBn
bWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0KDQo=

