Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64546C46CD2
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 01:59:05 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web10.115790.1703728737528522513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 17:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=g5xti3Nq;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1703728736; x=1735264736;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l/OHxWbcoPJJNm5AoYVWejjwnEZGbNtPEOHJdgj1kyc=;
  b=g5xti3Nqd64dJY8P2/L5gh8gblFOyG21bZHf3Mt1JQBuPHV4H5VU8NKZ
   74w8acNB2WurX/kD7AA6xLpzbyApkbeFvQU98ozQ/0yxrnKsrbCisitRR
   99yX4KuKOsYpg7ThACryMs5gUYHR7o66j2RKGfXtdbc9jRmL0Uy9y0xdl
   pJT8LiWaHuiXZylf4XxuV2Rj5geonFM89/nx1N8LlLXHPp0zYjXpPU4rr
   h0WRPieAltekS8TEZJbGpYwMPiIQEWbTieeyQiZpJSXfxHAfCHIQm62iO
   nhXhDQaTm1Gkqo8kEzYzHjVCan4j9cvddaFMjOzlp1gKeSNxPJ9ggKGis
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="107255494"
X-IronPort-AV: E=Sophos;i="6.04,310,1695654000"; 
   d="scan'208";a="107255494"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 10:58:53 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIH+zlxrLDaQsElQkoG7+fR8XodYaTsQusY/allwgAOE5PaTCvO+8yWZGp+aHFNrZ24QHtARBCIyEw+Or8baEM2Bfp+YEVPtWraYS8YmFaW2yRIpQ7r820yCr1jBidCXCiKw2ujRKU1RR4BZD3hlsUnqXwqcDdWE6SMF+Q7+RrehSZpg4miow29dTS9v7DRhh0WBIkrpzx/j/fjR4ARaeBWHI8ex/K5D1d0DvCCn+ClAEMTNfVxJAJV/9VeFQas5JRbnpQx2rFOv3kIEZlsJY+Zp1ujnPulPoLYkVPonh+yfYkjRasv2kav+I4o+JmXpBHUqxWpio9X+Q4C3yYosnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bka7aBUGA1YR/E9fgyYE/uqyY/yKvMVY60f4E9xOK8=;
 b=nLZo0pnBruU7YdFtnTCvQYe0/FjmSBRJZMEbMqiqfbL1/p271zq4U/PrtS0lh7h0qdXrxqWrwOzFVRNUxfXWVYnQvInpX8d/hfuMXKRs2UalJFHGohQIjfwbhRpJczTIAVWUwFSE2bC3Y4Cq9H36sRR2Qli4hSbxAKiAo6kko+lWzzdQgVMFyHEt5CY4Grk++59fdOCJY20GNpodXbfkV8gDpN5b3T3MyrKUoU3VXH6SEtgv2HEZtt+rCqZNXabZ1L34CmvekqpV6xqM/sy6rIXiO4HOTXd92df+y/qdgecM9KlNhScSHrtGIzxOUJhKUAFL3WdmitzPmtXK+kt6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com (2603:1096:404:75::15)
 by TYYPR01MB8166.jpnprd01.prod.outlook.com (2603:1096:400:118::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.17; Thu, 28 Dec
 2023 01:58:50 +0000
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::834c:72c5:3be5:5f75]) by TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::834c:72c5:3be5:5f75%4]) with mapi id 15.20.7159.006; Thu, 28 Dec 2023
 01:58:50 +0000
From: "Shinji Matsunaga (Fujitsu)" <shin.matsunaga@fujitsu.com>
To: "'ross.burton@arm.com'" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] Revert "cve-check: Modify judgment processing using "="
 in version comparison"
Thread-Topic: [PATCH] Revert "cve-check: Modify judgment processing using "="
 in version comparison"
Thread-Index: AQHaJ58f8tlOZjRcwUSIZSE/nUGKxLC+En4g
Date: Thu, 28 Dec 2023 01:58:50 +0000
Message-ID: 
 <TY2PR01MB3289D3B71F809070F9056935929EA@TY2PR01MB3289.jpnprd01.prod.outlook.com>
References: <20231205171839.1693642-1-ross.burton@arm.com>
In-Reply-To: <20231205171839.1693642-1-ross.burton@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9M2RjYjIwNDQtZDMxMS00NzEyLWI0OTktZDgw?=
 =?iso-2022-jp?B?ZDJhMGNmOTAzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjMtMTItMjhUMDE6NTU6MDFaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB3289:EE_|TYYPR01MB8166:EE_
x-ms-office365-filtering-correlation-id: 9935c9fc-dc2f-4529-bcfc-08dc074889a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yhlzLPK7lLcuZAC8g+BzuVCaT9Oax/rWIU3wDpqK+JBRLFhSF0W/lHvUV8vNRaE2AqwxlPjomFY4XbHQoKt6Pon8w8JV+fK1cs89Tf8PAsPI8/XqpJiJ4jLYzhiLguizf1H5xZWz2MkSsqQhoJJ8VgPIYaLQH6S2oIFyHPXTxOX8oY/co3gc3zgMftwUYsgQFB6zPAb04anUg0OZ3S8K2MYPOBKVzfqTIh0ULd7RByP3GCdni/Xj/GEePw/H29aJkRU4BrFCaZKP5KivpCyfLeJmPLbWJcmYhXFA9PZm8m8ynccijxJS/eN6FDPIQpYHaQwIELg87uyw53eAqIafx904W4tTsIaBpvzqCwvfb4OdoNfZkBkDKnXsCQN40Rni4j6dpSdQwz+1Ywk1SDGuuhyp1hMlYW/UnrryA6+PMVOsaqqtI0Pc50xK/+SHu1OdixvBRoMt40Wm7drC3KCVVsb15epQ9ufnSxS+rIRtqW7jxgwICm3Ni7650kSP24jU49/JsrDljSU/kdNxu9IXy9c4lfH9t5ZylRIG9fDTYTgn2E0axkYJblzqV52XFjXwIcJgWN3kikYsr8Eo5XmjI2g4E7mM+WxkAHFAXwz47cHEp8Mbbn8ZWGl2usTyoQvPXgbUxqln4yZ9Sw/uRynIl5CFJoW69BGCIYz9BVa+ZGQkTjz7xQzBnijoxdw0OY5DVrkuoSP9SeL5clUGyyxhuw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3289.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(1590799021)(1800799012)(451199024)(64100799003)(9686003)(71200400001)(26005)(4326008)(66556008)(316002)(82960400001)(64756008)(66476007)(66446008)(76116006)(6916009)(66946007)(83380400001)(55016003)(7696005)(53546011)(6506007)(38100700002)(52536014)(8676002)(122000001)(8936002)(478600001)(86362001)(5660300002)(2906002)(33656002)(85182001)(41300700001)(38070700009)(1580799018)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?SzBlUVFkLzErd2R6cSt3a0ZFeU83OFQ0MHdaYnF2cWFjWTVUYW1wbWZZ?=
 =?iso-2022-jp?B?Y2dBRURENG5aVXo2SHZqblNkNUpyc2tYR1pyNlhhNHJDNGtQQkRJdXpt?=
 =?iso-2022-jp?B?OGtFczFRRllwSkU3K1VaeVQxRHJQQUx4VnVaMllHa2ZFdlMzVzhiTEkx?=
 =?iso-2022-jp?B?VGhWcC8xczJ1eFJoY2tFbHozQnE1eHYrZzFwN29Qa3hsN2JtTllYNVpT?=
 =?iso-2022-jp?B?b3d4NFp6d2E5ZWRjMEllTmR4QVRhNEZ4Nk8rWmtsUDNJUVA0dDhZRTV5?=
 =?iso-2022-jp?B?eDBaQ1I4TVBKdmd6VHBLUXJkSU5BUW9FOU1QcU9qQ1dXWGxjU0lLc1BN?=
 =?iso-2022-jp?B?cFdIN29EVGI2SUxWOUVHYTRleFo5Y3lEN3JFYWU2WU5sQ1dXQ2MxbXpJ?=
 =?iso-2022-jp?B?UkN2TG1rVHpmWVFrdUgxeGxQYytmY3hFbmZsaEkwQ1VLS3hvQ3prTVBH?=
 =?iso-2022-jp?B?MkFjYUUwYy9XOHFzWGc4cVF0a1NYRThhT0NWemsvdHNlMk43bms1Nnp1?=
 =?iso-2022-jp?B?NkRWa2lER0E5cDdRU0VSMUpnbG5oYk1lamMzS2xMTis2SVZmak1xZk1C?=
 =?iso-2022-jp?B?RXFUaGlNVUsyTnh4MDRjS0x5d3JiRGcxMHY0eW5uS3k4TjBCemc1YklY?=
 =?iso-2022-jp?B?QTlCVDFpOUVHaFZCS2hDU29kbjJlVjB3N0NkUjJZU2s0K0Z3SmQzbFRJ?=
 =?iso-2022-jp?B?RElrVGtMYldkR1JtSEU3L3VMNU16QWMrYm03Q0pvWEFhdjcwODhBUGNT?=
 =?iso-2022-jp?B?WmNKSVFidzNLVnBvZ1hkUnVFc1RWTE04aDMrbnlPOGhsQnFNbHZ2MlhY?=
 =?iso-2022-jp?B?eWZrQnI2K2RYZUFsOGlHR3E2Vmo4bG55dHhQUTBuWCtJdFhJWjR4em5P?=
 =?iso-2022-jp?B?QTh0SlREU0RxWTQ4WkFWaG5aVTA2OG1xakpEVUh4d1dQZzhZY0VCYmJz?=
 =?iso-2022-jp?B?WnlHU1ZMUG9Zb2h6YWkxU2k3TldTQytMN0l3VzdRS1JCWGdUdGZNV0dE?=
 =?iso-2022-jp?B?SnVvTlB3QlYvODlQa3QyaDJhaUdIQnp2YnhWSXcvY2RQT3RGMW9Eb2FW?=
 =?iso-2022-jp?B?cFRXM09WN0JkcFV6SzdlWlcra0dXazFTV1BJdDVQa3VnY0RCVTMzZHJw?=
 =?iso-2022-jp?B?emFvYWt0TkNVellhd2RBKzFCZmZIRHV4YTVVdDZXdTRISE1JN0dKYkR2?=
 =?iso-2022-jp?B?N2pkU0VBTlFKNnprTGVMVkI5Z1FOeUYzSGlabTJUZXBFMERLN0xDYU11?=
 =?iso-2022-jp?B?eWZwdEdPKzNoQUhCN0xhUS9xZy9wTUg0d1V6KzZXMnFEL2VzN3NWME9S?=
 =?iso-2022-jp?B?TWd2WjZxbjBlRFlkMGRwcHZOUzJpQ3BMVTlvbVRFbEF6QkhUVVJqNitR?=
 =?iso-2022-jp?B?WU1EMVFpQ2RVNHhDSHphMVoraVNsZmswbHc4N05hRUx3VUlNQW5VVkxp?=
 =?iso-2022-jp?B?eFd1ekxCQjhHVVZzbVcwZlViQ3JVSnoweDg0MVZuK0VaOUk2blJmeWNT?=
 =?iso-2022-jp?B?ak85TWhRYm83ZzRZdFdnOWE0djArb1FLYjBGVW9RSjlXaG9VSnJTNXNy?=
 =?iso-2022-jp?B?OG5IUlpidW5ZUEJTNGxUcnl4Rml0VDFmNW12QW8yU1FkYVF0c2JRME16?=
 =?iso-2022-jp?B?em9EdVNIMkJWak84cHBSOFZzR0lvRGxHM1NtY2ZyQkNJeWxtU0l1aHdh?=
 =?iso-2022-jp?B?aG5tbEN1bng4UHcrdm42QWIyaXNyNEdiZkNWWmU1bmRZTVNBV3pUb3d3?=
 =?iso-2022-jp?B?K3VHaE9QSHVadVNtZ00xdUdMRzlmckNHUFI3Z09SSkhTNHVaa1ZjUEQ3?=
 =?iso-2022-jp?B?TlRQalloZFZaTzNwVytGV2JHdXR1TXZjK1NIek9MRXQ1ZVlURnVTTGxF?=
 =?iso-2022-jp?B?M3loMGdyTkJaejNTWVlGNFB2TmoyUTFvQU5uS0MyUXFWcGNrNTlYNTlr?=
 =?iso-2022-jp?B?bzJDdDVFQW5QZlB5VkJVeEJKeXR0QWpTek1vWE1FSUtYNDUxTGdPYzR0?=
 =?iso-2022-jp?B?cHhKZE9ZeFdKLzV5djdLbkswci9zcjUwNG5zMHpZRXRVeG1ZKzFwZ0hy?=
 =?iso-2022-jp?B?cFVKNjVwUFlSQlgvR3FVSlMyeDgxenRPYWhOdldReG43bitNWFRoanht?=
 =?iso-2022-jp?B?Q0hwbTFTNkNVVkhlaFE0UUZvbkFKOTBLY2VlVjNGUk93V0xFa1lLT1R1?=
 =?iso-2022-jp?B?eFh3S2hoS2JGYWFMQUZqejlsSk9vald6aUNQbGFuRW5icU5QWjJJSUJQ?=
 =?iso-2022-jp?B?RjVCNEpPRG5IRWJ2L1REbHBIdmNFVUxrdGRuMlJydmExbG1KWVdjbENF?=
 =?iso-2022-jp?B?QWMrZWxCM3VRcDFXSEM2QkVkWjh0WDJCWEE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5U4VGxtXfSCpFpopnv9VyAeZemRkQLV8wfFd/WJA3UsyvaVE3Y/ZznVDcgI2Kcg2wu58NSyrEHP6DLAbV6RU/TjCgDH6BjdERZsBUcBeWSnDDAck8faxq/veJwT5/ZNCIr876Pnlcfgad57cWshQiua6XGJLeyoRrZVV6rPFCYl7+frW518CP2nIZELvQug/DXJDmsqd+GtjetaR+Oiugu6fMT2b0l8be6v4FeVehazQJu7oX9NP1FANj7tzkTXgt2fDHUcsVl68HOJkI2Pl8B+u7P90OpyVnYMreovx+/bvBu/Fep7w/oiJmnITIkLJH2L58xAIvdVAk0yHJOKfWsz4IEpVw1lbfaIsa3a4GpjjBg9o1CwXjjFtRLVD/xnyDwO/jRhEMdgaPtBEbpd20nj4T1futuqA/IajnQFOKlohyRYYZlYPTmUYFqUbdTJst6899DkIY0wv9TwhtXMM7Z4edBMA44p771YyQJvW80hk0gEV7Ko4Kmuh1WuXa65OX/3PPfNBvN1pYQ8cTVZttazXROsGDJNpNXpXsxnbBNujwxI/Nyjwf6Ft53b2a+ASY8JXk/P4iDgUKgky/vbjHM5ntZi9pwjibF+NGFWYzyWM1l3NgsiMrcVmD74xky42
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3289.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9935c9fc-dc2f-4529-bcfc-08dc074889a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2023 01:58:50.7619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwYPNiPiJYf1NmNdcC9u4asT+XBFU13XnG2DS8cjPEJBJbXnSNlS2n+u+hXqXQWCzBuLHvRcZ60MMD8FVHR3kDwhAA+Vy2l3vqb37N1EB+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 01:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192969

Hi, Ross,

What does "too common an issue" mean?
Is it okay to ignore the misjudgment by the following cases?

e.g. PV =3D "1.2.0" and Vulnerabilities Affected Versions (registered with =
NVD) =3D "1.2"

Regards,
Shinji

-----Original Message-----
From: ross.burton@arm.com <ross.burton@arm.com>=20
Sent: Wednesday, December 6, 2023 2:19 AM
To: openembedded-core@lists.openembedded.org
Cc: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B <shin.matsunaga@fujitsu=
.com>
Subject: [PATCH] Revert "cve-check: Modify judgment processing using "=3D" =
in version comparison"

From: Ross Burton <ross.burton@arm.com>

This change introduced a warning if version comparisons failed, but this is=
 far too common an issue in data that we don't control, so this shouldn't c=
ause a warning:

WARNING: automake-native-1.16.5-r0 do_cve_check: automake: Failed to compar=
e 1.16.5 =3D branch_1-9 for CVE-2009-4029
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2011-0715
WARNING: automake-1.16.5-r0 do_cve_check: automake: Failed to compare 1.16.=
5 =3D branch_1-9 for CVE-2009-4029
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2003-0577
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-0982
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-1284
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2006-3355
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2009-1301
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2009-1301

This reverts commit a1989e4197178c2431ceca499e0b4876b233b131.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s index 086d87687f4..5191d043030 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -375,7 +375,6 @@ def check_cves(d, patched_cves):
                         try:
                             vulnerable_start =3D  (operator_start =3D=3D '=
>=3D' and Version(pv,suffix) >=3D Version(version_start,suffix))
                             vulnerable_start |=3D (operator_start =3D=3D '=
>' and Version(pv,suffix) > Version(version_start,suffix))
-                            vulnerable_start |=3D (operator_start =3D=3D '=
=3D' and Version(pv,suffix) =3D=3D Version(version_start,suffix))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s=
" %
                                     (product, pv, operator_start, version_=
start, cve))
--
2.34.1


