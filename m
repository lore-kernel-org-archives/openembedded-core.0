Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC84EC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 03:04:29 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web10.80435.1684119867305394423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 20:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=cEbS8h1n;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1684119868; x=1715655868;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dDBKL3rKKunmdaCAtMaCa3vtaVVkykHMXgmr/DzFjHk=;
  b=cEbS8h1nZgf4PoZl+pI7gIZTPiyt3jMTNjnZxDkJliWETI3TS/vL9E9p
   +UB1Nd+CUn/7xh5dCORdBNJEiMPapXFroOw+VRNNpoxbHT1Hm4ZPmxNv4
   Uk59sHwrDibrO4CNlu0C126wYNHO9s+/TdbmUgR527s6/9wxXTW9qbw/+
   TGISyPtUYrq9L0gtrp6wrQsejugHWZG7Y+xJ7O6URURFQXgFDJGuS0Txd
   di7XpQTLcDvJKTGWjq0OWFhc1JZkOkkc4laMOkVG04W74GFziqKmdrJU0
   ZWhqrl0g2lkyOKkzGb4S7RVk++JqMvXiggmMnp0BXjgmn/sVJYZjWqyS6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="84504884"
X-IronPort-AV: E=Sophos;i="5.99,275,1677510000"; 
   d="scan'208";a="84504884"
Received: from mail-tycjpn01lp2173.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.173])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 12:04:26 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwaNFKWu3cYIYaYHG1RZGEM8k1/UlaWwP43Sk2YIZ/LQVdAI9WRFwnNZ7yOEMPMxIhGVLmP9UJ9VwkTJ6kGNQ0u4MyUxtdtfYNTDI22n6wnDkwcLPe/OXFK0ks0dxTM3H5V1T0qS7LUiSdAla47H3xwvnw8n4jCwO/Qs0wQYjL7k9sd48CPGDl2eCXbKf60T5PRqeEHeCQXc9ov5WRKwseIf/XHnyTeazBNKWckNx0G5u5GFq9OQ3YGCfz+9B9inBYQwS1Qt/R6tlQBDcBTWWPfT7ehWFUNw9por5oRI4RpShbDyi/+fsEXA0aQ6DVtl3Sa1RplmPTS6iURvjVhU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDBKL3rKKunmdaCAtMaCa3vtaVVkykHMXgmr/DzFjHk=;
 b=Bj4kRQgNmwIsRcf4ObrdTP9erQEJ4FVhltSPjUP/6sF4tPp3Tb9zZWUNnFYolMzj4Wliyo2lbCTcRbPkC6+V4SVvCVJ/9Y2vVogPUxnBQMAURwR6oduqrh9R81ycaVf4omYYZtytikv1u1diS8BKa5FTXqChDImCyNPWOQW9k5Tnm89oX7KOCpc5K0Bo8U9l8BTBWovfgSyJef/4IISd9PTAW6SXxiJwuLn6puXTPNd1qyXxPWh6ir7feFrrsHOpWAZdK9YK2FKbIjabPZaG18UpgYAqRKQsqVHh060YJ5D5S5EYDkXiKDp4Uf47fXzbGv+uDrjduaUwN8TgJV/BsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com (2603:1096:604:1c8::7)
 by TYCPR01MB9863.jpnprd01.prod.outlook.com (2603:1096:400:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 03:04:22 +0000
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::e411:b489:d1f1:5f6e]) by OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::e411:b489:d1f1:5f6e%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 03:04:21 +0000
From: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdIFtQQVRDSCBWMl0gRml4IGVycm9yIFNSQ0RJUiB3?=
 =?gb2312?Q?hen_using_usrmerge_DISTRO=5FFEATURES?=
Thread-Topic: [OE-core] [PATCH V2] Fix error SRCDIR when using usrmerge
 DISTRO_FEATURES
Thread-Index: AQHZeOGJf60KgROgLkSdNXHNnxZ4SK9TxpsAgAb5WoU=
Date: Mon, 15 May 2023 03:04:21 +0000
Message-ID: 
 <OS3PR01MB95158C13FAADD8E563BC344BBA789@OS3PR01MB9515.jpnprd01.prod.outlook.com>
References: <Wnqs.1682583778394705301.Jj4z@lists.openembedded.org>
 <41276F5A-2CEE-467F-A36C-9497847C8217@arm.com>
In-Reply-To: <41276F5A-2CEE-467F-A36C-9497847C8217@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2023-05-15T03:04:20.994Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9515:EE_|TYCPR01MB9863:EE_
x-ms-office365-filtering-correlation-id: cd77ab49-075e-4d3b-c28d-08db54f114de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vHSJoqr+Yh4THRbPRdosMbyO0/lhCFG3H6W1wIsszwrkzOGmUa6j0jbr2ThW+e3ZvYVw728mG2Xhq7C3nFtQPe4XkWmu2fy7pp1E20mBI3794cFd/Xpzpz0Wmdck2V38j5myr/wJ009pchkW7SOpIHRrpzc77rK7yaWlYwsMyQyZcc8SyJvsu+BrG/COHGNKNQ8QACnsjaDFAFuIXuIHwLYcIFULakHFs9Ho+ezHoCEEtPkDTfVlUubDq3+Nxd9M5puzd+Rb3nkiu+9RZmxMvg/PnFmK7Zhcatud0sQT/kZBj4GJFPYXIAF6aEGBbCypz1hnJJVpkEE5W0JWi9CgClKBdDfBmIfjt3QK88Zk5O6AcAvQOzna2OE7NoGXQp3yOZWmmgR+TYQBfQ9HLqoPiRX6bN6CTV6BaG02aFY/BDtGshQVkp/49wjBSp0JOH5cI2l5KFMuqx+lhA/UptNHFBqQ6Pp7ukgOJ/mxQgjbvDw11r69fPhFPGsn6iK5zeuhOXx9oww+vfloyWgW+2m1FvZT4sHIgGX2Vrb/UOsmf1WiQcTDeCH7nrx26I3+8LiksvZXFR6oUG/uO6Iaxtn+IHbVHmzKQEPH1IFkTzqPlOfXstOHQ6NFU6w0ZfMhJDwSH6Awhn9APuOdJpXsMMDRuQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9515.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(1590799018)(451199021)(478600001)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(66946007)(91956017)(76116006)(71200400001)(7696005)(316002)(2906002)(55016003)(8936002)(41300700001)(5660300002)(26005)(52536014)(122000001)(82960400001)(33656002)(86362001)(224303003)(85182001)(38100700002)(38070700005)(83380400001)(186003)(9686003)(6506007)(1580799015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?RlpBQko0aXA4bzVZNVFMU0hmaEI5Tkc3REYvNlMwTzVLM1Q0bUVueXZQT2FE?=
 =?gb2312?B?QkZ0Q0EzSFhZS3gvUmorUTV1b2ZGK09yNXR4amNXdHJZejR3dnNsV0doTGhL?=
 =?gb2312?B?R0VMb0QwODJ5UXU2RDFKdEcxbDJwN2M5eDhlV3cwT1JPejlublM0am41RnZ4?=
 =?gb2312?B?U1JEd2dLUlRmR2NSNmRyS1IzbzNXL2wxSithMTcvYXA5VWFMSEJsTUlDSE1P?=
 =?gb2312?B?NWRDZm1iSTMyaC9BN0NCVHExUUVScmhLNVBvcTRlcVhLOEJUczczanFMSkoz?=
 =?gb2312?B?VllLdFZNMTI2RGlsam1qajJMbUV3bzNHSE5FU0VCODUvbzk0azN2ZUpOejJL?=
 =?gb2312?B?UVVqU05KakxJeWJSUzB5dnlrcEVGdE55aDBacGdjQjlDdDkyMXRwbWhGdDNF?=
 =?gb2312?B?T0pLOUx0djJOMHhYNXRuUjFRNEhwZmR3YXZVTlRLbE9UT0ZOcjdYMmIvSTRD?=
 =?gb2312?B?VXFXdTZOT0V5UkxYbE1iTTFGcGRNOUZJdkVKU1RpZmZyamR2dGh0UkdobldL?=
 =?gb2312?B?NWJpcjdIcldqVENwbzFydUNuaVJWdHo1S2dZbGdJdW8wczVrWis2NEcwQ3Rn?=
 =?gb2312?B?QVpBT3ZHMU5DTGtJLzFtNXpXdWFlTU5yZGo5YXNxaWpKejF1cnhPWXF0MGoz?=
 =?gb2312?B?c0lwK0wrNFdqcjdsOUxiNzd4NFZzUUVzNW5NdldFT1UrbUQ3dWptYWFLVlFB?=
 =?gb2312?B?Q2hBMXE2bXJpT05UVThhTldzeCtGV0ZOTlh0blZUUkM4NCtmdWJJVmw3L0dy?=
 =?gb2312?B?K3pwR3ZVNmNGbzJxdVlncUZaNFF3VzFrbmIxK2UxSnRpc0tYd0dueXU0Z0Vk?=
 =?gb2312?B?WXJvMVRUNFJ4TEdmYklRblJmanNCcHRqL09rZjlsNjM4dmRFbDkvZlJHcU4v?=
 =?gb2312?B?c1hXam9VMmsxd0tKd0VrT1VvYnJKQ3VvZDdocDJ0TXozZTUwSXBpWHRRQ0hi?=
 =?gb2312?B?K1dBMXVpZnlmd2crU0QxQ3hpRElHYWxmT1MyUFd4L3liZEZQc3hTdXJZTXRO?=
 =?gb2312?B?bTYyQ0VydnVYeFpZbnMxTXBYY1NIMmJBZS8zVlp0UXY1UlF1dkpjbmtHVHp5?=
 =?gb2312?B?R2ZUSjRBMW5pUHNGUEFkTjZTdDRkOTZWNStTaHo2bGtSYTRJb0d6M1pVWUZC?=
 =?gb2312?B?VG5hdkhCenRQRFRGRUxoZTVmZm85NitNTVBZd1BqNW5mRGptVU9YaVo5T3NT?=
 =?gb2312?B?RmhMUGcrSGJwdndQN2ovSWVIVzZhWEY0ckNEVmg0RXFDWmFIUm1wNm9tam91?=
 =?gb2312?B?R3VUa092dEF5SmYvNzZvMWR6RE1JakJMclRWZHNPZnh4UVg1UHhneXorR2I5?=
 =?gb2312?B?NE1abUxZUmJ4ZHZIeDBKSGtTMmUxS2lCU3RsRkJmcjNsT0JrQjRkdFlGcXJu?=
 =?gb2312?B?Tmx0MTdaNWRJYW9KOEJ1VDhQaVlpZnBXV25IMExxWm9GWitlS1Jjbld6YlZ5?=
 =?gb2312?B?K1ZGQXhzNXphU3J5c0x0QWZMMkNvZFk1M1hTWEZaMWl6Qk0raEJoOC84YlAr?=
 =?gb2312?B?THR0VlhWNU52WVNXeWZsTmpyRGdBbTQ0a05RUXB4d253ODRFYVVoVEpUekh3?=
 =?gb2312?B?ZXNjUXRPQS9FTW9aclVXSVNmT1NtZmhFUDhmbjZuUUJQSUlBMWcybXJjKzlI?=
 =?gb2312?B?OGoyWC9Mdlpzd0tEOFdKcUJkeEtScUgyOHIyT3JLOTJyTHMzZTFKTDBTREFs?=
 =?gb2312?B?OExnZTNrSXpoVW14TmsraEV5WWpaSWlRMUYyTTNjWm1oOWUrVUtlTURIT2d4?=
 =?gb2312?B?OTQ1d3R1TlBjRWtJdVdCcjN5SFFjdXRlQ3VjcDhmWmIzZ2FKU0RRNVFkZGww?=
 =?gb2312?B?YjhMUWpPMUpXcWZEUU9tbXdXbnc1SHpGRkczQk1jL0NkelpoM1pMZ3lTdmRS?=
 =?gb2312?B?RlZtdGhycER6NTRFS3EzRW9BbEgzV1NFL1IxT3VKSVpiNERXbU9aZGtkY3Zt?=
 =?gb2312?B?dUdpMGF2K2VxUTRMRHRBb1k2VnpoRmtVeFRFWVJxNEFjVlQ1Rk9EVVh1cGhJ?=
 =?gb2312?B?eUI5NVJML3BuaHlMMm5nOHExaG5OSnVyTGhTZXlQWVk3M2c1bDFMOCtCTGl2?=
 =?gb2312?B?S2RyNUFmK3p2aGhjQXV4T21xRnVTSStobTF2cEdjVlRRTENuTHc5NkpUN2pT?=
 =?gb2312?Q?3DXM=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QnKY2RCK/oTrRi5cm16L9SWXksqa2sj74fPBbPscYc8gMvk5SQXn+I/sJAAgO8iQSDR9T70QJdsgCN/REgVUHszs7KJ7rzrW9oSKDmdGafKCmxV9s0X7sXnUW1rddvuG7wdgpGlewVMJmxDHrf504Y08ydgGBQGRz4zvYQxDxDLG/zmemmdNThpStzny9z3IHBMclUNw6EJanGAR9vLAg3rjJVhUuiVmByDayrHP+ORORQn+UYJz0rdmBxoza9ghTWbgimvGVia4us5cdDWWniHm05l5LGaUdNwqV4FXCIv1Wi7Wc/+3hJGx+G4v2k22sjXMrjImlN5LpYLwh8Ol81EGwwK4kBGWW2PCyyJ6G1OK3WCBZBm6WH6w46leWqU+K2RJz/vaUIAdKSYkwm8p38CFi/XRwkvl4jOIsTzaGb2/izl1d2RSuhlkO5DSVEbNoxwGUoTB+wSfMjRfOeQZ6AGywNDmy3RqBr6aomtajbkzJYDL6hIjhxF9BQYOQe2JVRMtsP++ImFPyxHk8YJgDycTIAEN1uM/F8yD+W36FcLjr9wR9F7gi3yrgACIYTRcXvyGxqsZ3yymMm/PqS2FOKZ476nJqCZWzcXPD6/3/YDHrk5YAlRRUNkaTWPsgmGI4dystRyMVIMjqI0LPM7dHGHgZw0YsVYee7wrA+qrQk5ew5xtC4CFEygikqDuFJPJ712OzqPeuiL5fyqneA2cFb1Qh9Mdg5Uq8xu5zumZvtZFQ0OPcWH1Szf2I9I5XVP9arT9W3BKJMHjukHLHaQoDYJxzfxlf2F7BTRwanix/xvD/RdT+FxFFV6fWrfwEkld
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9515.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd77ab49-075e-4d3b-c28d-08db54f114de
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 03:04:21.6748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGk/2r8LdZ0/z7Hu0XdKM4K+02/RhKgcAx7nnTXASeXLKdNS00Iabat9+udW/ENJS86cofIW3iyScrXZXe/lQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 03:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181223

SGksIFJvc3MKClBsZWFzZSBzZWUgIltQQVRDSCBWM10gZTJmc3Byb2dzOiBGaXggZXJyb3IgU1JD
RElSIHdoZW4gdXNpbmcgdXNybWVyZ2UgRElTVFJPX0ZFQVRVUkVTIi4gCkZpcnN0LCAiZTJmc3By
b2dzOqGxIGlzIGFkZGVkIGludG8gY29tbWl0IG1lc3NhZ2UuClRoZW4sIGl0IGlzIGZpeGVkIHdp
dGggcHRlc3QucGF0Y2guCgpCZXN0IHJlZ2FyZHMsClFpdSBUaW5ndGluZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogUm9zcyBCdXJ0b24gPFJvc3MuQnVy
dG9uQGFybS5jb20+Creiy83KsbzkOiAyMDIzxOo11MIxMcjVIDAwOjI2CsrVvP7IyzogUWl1LCBU
aW5ndGluZy+z8CDmw+bDCrOty806IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcK1vfM4jogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggVjJdIEZpeCBlcnJvciBTUkNESVIgd2hl
biB1c2luZyB1c3JtZXJnZSBESVNUUk9fRkVBVFVSRVMKCkZpcnN0LCBwbGVhc2UgdXNlIHRoZSBj
b21taXQgbWVzc2FnZSBjb252ZW50aW9uOiB0aGUgc2hvcnRsb2cgc2hvdWxkIHN0YXJ0IHdpdGgg
ImUyZnNwcm9nczqhsS4KCgo+ICAgSW4gTWFrZWZpbGUuaW4sIFNSQ0RJUiBpcyBzZXQgYnkgcHJl
Zml4IGFuZCBsaWJkaXIuCj4gICAgIEBlY2hvICJTUkNESVI9JHtwcmVmaXh9JHtsaWJkaXJ9L2Uy
ZnNwcm9ncy9wdGVzdC90ZXN0IiA+PiB0ZXN0X29uZQo+ICAgICBAZWNobyAiU1JDRElSPSR7cHJl
Zml4fSR7bGliZGlyfS9lMmZzcHJvZ3MvcHRlc3QvdGVzdCIgPj4gdGVzdF9zY3JpcHQKPiAgIHBy
ZWZpeD0vdXNyCj4gICBsaWJkaXI9L3Vzci9saWIgKHdoZW4gdXNybWVyZ2UgaXMgc2V0KQo+ICAg
c29sdXRpb24KPiAgIEFmdGVyIHB0ZXN0IGNvbXBpbGluZywgY2hlY2sgYW5kIG1vZGlmeSBTUkNE
SVIgaW4gdGVzdF9zY3JpcHQgYW5kIHRlc3Rfb25lLgoKVGhlIHJlYXNvbiBpcyBjb3JyZWN0LCBi
dXQgdGhlIGZpeCBpcyB3cm9uZy4KCiRsaWJkaXIgKmFsd2F5cyogaW5jbHVkZXMgJHByZWZpeC4g
IFRoaXMgb25seSB3b3JrcyBpbiBub24tdXNybWVyZ2UgYnVpbGRzIGJlY2F1c2UgZm9yIGhpc3Rv
cmljYWwgcmVhc29ucyB3ZSBwYXNzIKGqbGliZGlyPSQoYmFzZV9saWJkaXIpLCB3aGljaCBzZXRz
IGxpYmRpcj0vbGliLiAgVGhpcyBoYXBwZW5zIHRvIHdvcmsgYmVjYXVzZSAvdXNyL2xpYiBpcyBh
Y3R1YWxseSB3aGVyZSB0aGUgcHRlc3QgZmlsZXMgYXJlIGluc3RhbGxlZCwgYnV0IHRoYXQgaXMg
cHVyZSBjb2luY2lkZW5jZS4KCkFsc28sIHRoaXMgYnJva2VuIHBhcnQgb2YgdGhlIE1ha2VmaWxl
IGlzIGEgcnVsZSB0aGF0ICp3ZSBwYXRjaCBpbiogKHNlZSBwdGVzdC5wYXRjaCksIHNvIHNpbXBs
eSBmaXggdGhhdCBwYXRjaCBpbnN0ZWFkIG9mIHdvcmtpbmcgYXJvdW5kIGl0IGluIHdpdGggYSBz
ZWQuCgpSb3NzCg==

