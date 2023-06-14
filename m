Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C87EB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 08:59:33 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web10.6825.1686733169672800635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 01:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=XVAuUz/J;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1914; q=dns/txt; s=iport;
  t=1686733169; x=1687942769;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yHqIr2xcbpBi9a0d4yoAQ/dYCq6s4c46ZGjxMXhH/go=;
  b=XVAuUz/J88ZUgiSXlNEb+POlKdBcVswjvuXTAF5bF5fsthNYkeTi5ldV
   qVmejaW4myWEijPIUmKSCx+i+pCyTyMROX/nZ+IXGqKJuqYpkxjpdgBsV
   NARvNi9uLV7SCelstj+Nu74WioxAvpF0LqcoXnhAfP/kscl4z2ESgD9ml
   o=;
X-IPAS-Result: =?us-ascii?q?A0A4AgDRgIlkmJtdJa1aHgEBCxIMQCWBHwuBXVJzAlkqE?=
 =?us-ascii?q?kcDhE6DTAOFLYYugiQDnW6BJQNWDwEBAQ0BAS4LCwQBAYUGAhaFXgIlNAkOA?=
 =?us-ascii?q?QICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBAQEBAR4ZBQ4QJ4VoD?=
 =?us-ascii?q?YYEAQEBAQMBERERDAEBOAsEAgEIDgMEAQEDAiYCAgImChUICAIEARIIDA6CX?=
 =?us-ascii?q?AGCXAMBEKEKAYE/AookeoEygQGCCAEBBgQFgUoCQ50XAwaBFS2JOoNeghWCM?=
 =?us-ascii?q?ycbQIFNgRVDgmg+gQWBXQEBgWIVg0Q5gi6JVYRIkEKBKG+BHoEifwIJAhFBJ?=
 =?us-ascii?q?oEICF6BckACDVQLC2WBHFI8gUYCAhE8EAVPex0DBwQCgQUQLwcEMgkWCQYJG?=
 =?us-ascii?q?C8nBlEHLSQJExVCBINZCoENPxUOEYJcJAIHNkEbWmA3A0QdQAMLcD01Bg4fB?=
 =?us-ascii?q?QQkHiuBVzBAgQwCRp9GA4MTgQ0sgREHgRSTGYNQrWwKJ4Nhi3yNGoggF4QBj?=
 =?us-ascii?q?GyVPYMtC5gMII06mjQCBAIEBQIOAQEGgWM6gUkLB3AVO4IzATNSGQ+OIBmDW?=
 =?us-ascii?q?4F/gxWKZXUNLgIHCwEBAwmLSAEB?=
IronPort-PHdr: A9a23:WPO8gh9B/hG68v9uWO3oyV9kXcBvk6//MghQ7YIolPcSNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqLgF1J/jvHYL6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49ALiJFrLLowzBaBrnpTLuJRw24pbV7GlBfn7cD295lmmxk=
IronPort-Data: A9a23:7ovuMKwgcM9ZFch1sOZ6t+cyxirEfRIJ4+MujC+fZmUNrF6WrkVSx
 jdMXz2ObvjZN2D8L9wibN6xphsFvZGAnIM2TQFl+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJloCCea/H9BC5C5xZVG/fngqoHUVqicYkideSc+EH160Uw6x7Zg6mJVqYHR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyV94KYkGE2EByCQrr+4sQKNb
 72rILmRpgs19vq2Yz+vuu6TnkYiGtY+MeUS45Zbc/DKv/RMmsA9+p83bv8QTFdXsWqqmM5b0
 tZU6IXpVRh8a8UgmMxFO/VZOzt1MasD87jdLD3j98eS1EbBNXDrxp2CDmlvYtZeobkxUDoIr
 KFFQNwORkjra+ae27m7S/V2gcgLJ8jwN4RZsXZlpd3cJal8HsCaEviTjTNe9CoNlsVxFrXEX
 pQyV3k2NQ7SaRhUIFhCXfrSm8/x1iWgLFW0smm9orI65WXWxgF93LXhddHSYNGiQcROgl3eo
 XrL+Wn8CBwWONGTjz2f/RqRavTnhyj3XscZE6e1s6Isi1yIzWtVAxoTPbemnRWnoneyAddTD
 lwUwHUNqrYY7k+yE8CkQwLt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4othpNYNOWCgeGGFC6
 7OZoz/6LWcw7+DNGBpx4p/R/GziY3FERYMXTXZcFVNt3jX1nG0kYvvyojtLCqW5iJj+Hiv9h
 mzMpykljLJVhskOv0lawbwlq2z0znQqZldljukyYo5Dxl8jDGJCT9f4gWU3Fd4acO6koqCp5
 RDoYfS24uEUFo2qnyeQWugLF7zBz6/bYGOC0Qc3Q8J6p27FF5ufkWZ4vmgWyKBBb5dsRNMVS
 BS7Vf55vcUKZyL6McebnaroUZh0pUQfKTgVfqmEMoURCnSAXASG5yppLVWBxHzglVNErE3ME
 cnzTCpYNl5DUf4P5GPvH481iOZ3rghgnjm7bc6gkHyaPU+2OST9pUEtagXeN4jULcqs/W3oz
 jqoH5XTkE0FAbWvMkE6M+c7dDg3EJTyPrivw+R/fe+YKQ0gE2YkY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:29VaE6k5uxty+HKYN5G+O4YBN4bpDfOEimdD5ihNYBxZY6Wkfp
 +V/cjzhCWbtN9OYh4dcIi7Sda9qBPnn6KdkrNhQ4tKOzOW9FdATbsSoLcKpgeBJ8SQzJ8k6U
 /vGZIOc+EYYWIK6PoSpTPIb+rIo+P3v5xA592utUuFJDsCA8oNnmQJaDpzUHcGOTWubqBJc6
 Z0k/A33gZIDk5nCPhTaEN1O9QroeenqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+SemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aGSARcR4Z
 rxSiUbToFOAkDqDyWISNzWqk7dOQMVmj3fIJmj8D3eSILCNWsH4oF69PNkm1PimjodVZdHoe
 x2N6bzjesNMfsG9x6Nv+TgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVB4SxbpXZt
 WGNvusrcp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wvq4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fr92CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLEPQIwFlluxEU5HHNc/W2He4OSMTeuOb0ociPvE=
X-Talos-CUID: =?us-ascii?q?9a23=3AGpiPz2kbx5sh30NIEKsBj70KtdfXOUTRlnLcBl+?=
 =?us-ascii?q?4MzlKT6O/U1yJpbo9j9U7zg=3D=3D?=
X-Talos-MUID: 9a23:petyYgVQfM6k1ALq/CLRlDRdP4Ry2vqFNgNUyI8UscyfLyMlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 14 Jun 2023 08:59:28 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 35E8xSBS009842
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 08:59:28 GMT
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,242,1681171200"; 
   d="scan'208";a="2955892"
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 08:59:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQm6t5z/nywLKRsTFVaJQqt6Tr7T+FCr0I8DbPSV7/qx6aKEYmskNZ3KilBf1aZV2kj+p3Es4s8pziXlZGuHzL3h28pnUZQRSGtZEMgGX9A7Y4EFc2wjnB6VLle5v6pQLs4Spoymc+UsG1/CDsRwO8FIxNfl9qwSestSGVvUDP2loZ+XCatlVhRfOvYugQGJLtx42+34jgkBIhZhAS/sahknehDn63FnwgRVSnMEg6BPESoKzcBRngI+xn+up5Gh/9tJAQ0/tYM5TGCct8R09vEG33IPuZyv7FespTaCSRmwNqbXu4QJX9/ialFK+VAicxCUyO5O8gZEYH9pQXESpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHqIr2xcbpBi9a0d4yoAQ/dYCq6s4c46ZGjxMXhH/go=;
 b=Zq0DHC9jLajutFVVVnTKb23eO7VuNoUGWiZNVbpWajyfwhNBHjxEl1hnt/yNc4h6z9GMLzIlF3eKTDAxoHpdVeCOhOwubsbojD+tGuURd257ZVd7SjTGIHI+am11M9N6vn3V7ZnV+RU6HroMoBfRa5e/XTyTP8FhIAQ0emla3P3tKzl7nfiMKS6pYg87fQthE7XH0+euTgk77V9aaIbpDc6Ox7FrUpBzKEkf2E5cVJNylEGkxLFFDMaT6wsyombvXkYmHVk+LV6DGLf/3+cMzOvPVGJrhgELSwVvCqE65xY7gOnh0YCnmk39FXQGnPl5Pbu+I47+K8Z3w8yf089UEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHqIr2xcbpBi9a0d4yoAQ/dYCq6s4c46ZGjxMXhH/go=;
 b=Ep4YTPhDhXA+OtdBX+jp335r5dE2SdzZTOkpJz9PusRR+TbB4qtGlGrlcbkE2RZ3YZJ79nrEMTqS09yI86yNBZFJIJV5w9pxuTB7gEy9Tyxx024m6gWJjcXzP1oPbUlqskWmbc5mMi7WMBk9I0+M+OV3Zlp15oCgn22ICR1x/Hk=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 14 Jun
 2023 08:59:26 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6455.030; Wed, 14 Jun 2023
 08:59:26 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Vijay Anusuri <vanusuri@mvista.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][dunfell][PATCH] cups: Fix CVE-2023-32324
Thread-Topic: [OE-core][dunfell][PATCH] cups: Fix CVE-2023-32324
Thread-Index: AQHZno0yW6qLekbrt0mmpsTtwf/3Pa+J/hvA
Date: Wed, 14 Jun 2023 08:58:59 +0000
Deferred-Delivery: Wed, 14 Jun 2023 08:58:38 +0000
Message-ID: 
 <SJ0PR11MB67172993F0D5A98344AC4F60DC5AA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230614065426.432009-1-vanusuri@mvista.com>
In-Reply-To: <20230614065426.432009-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|SA1PR11MB5923:EE_
x-ms-office365-filtering-correlation-id: 81508379-3b55-4363-81fa-08db6cb5a7c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bY7/N/KXRvyll9D3cmznQtL5dqSHaa+9/GNUOZtv2j3lHGUTk/gO1pQepLx5wIb/LM0RFpsIjUaKUY7tg++Rym7uBa5M0LBWsgMwBD5fJEM1t/w3nrQ7dO5DsmovHjsMTgUycFrUUT9hOnGIGzRcijbb4Gv14JjCch4vsFTfvQCUzDwA6V9lbvSXaHb4a1PuAT1nLRNHIDJ3Asnj313qAPRL+IXOZ1Zj80mj+DO4mAHzX3RKdMyPhXYzAtslFd8RZ2rB8NDaPd81c7bUN72WpN5OHOt1UgFdEZ4cR1HKuqT2N28G7TwWjFOigFt6YiHufnuzMyhGRvJRG7hsjLdMDZdEl3qpgyUD89zWnX4Kuy1NEb/0GnnWV7wPfnwgRjUO9xDeie6LezIHVt6PmJo09FYJV1J4YaIEHR4BJWpKgp8zOenSFSmtFL5qM7MM9b0dVLw0La2Ca4YWvCgcnnH6pDHBgckzcv43FiPlOVxvTviiRDdpvkP4tPAbG/uqq+D/07JF5sRObcdA93z0kyno4X9MaI1DrJJUz/lhc2EZXUYR1O01mxI3c+7Xjhh037WkE8IpkmyTGMKFv86SQaQ/b8txKTWT5k3xwvUmUEdOzwj/XhfWwABCOTaJkKRHUnLzd0PWV8S/WEwtSX+TDwNivg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(8936002)(8676002)(52536014)(5660300002)(66446008)(66556008)(64756008)(76116006)(66476007)(66946007)(316002)(41300700001)(110136005)(2906002)(966005)(71200400001)(6666004)(478600001)(7696005)(6506007)(55016003)(122000001)(26005)(9686003)(55236004)(186003)(83380400001)(33656002)(53546011)(38100700002)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RUNtaHl2RU5FanFjKzkvUlJzOU9nL0liL0ZuWjJZSXJKNmpLRG50TmlUVkNL?=
 =?utf-8?B?TDlGeGsxL1lMdUFQam9Wc25HV1dIN3NZbmRyZURJNjlCNXAzekl6eTFYbWNI?=
 =?utf-8?B?VTByQjdjYUZnUFBGQWRpbWZ1OHBuQm81WkRqNmg4aG1jbHc4dkNRTWpPVVl4?=
 =?utf-8?B?a2xPaFBVYUZ0eFhkQkxjWm41bFQvUGI1U2xpRUwvdk92NGdyMVlhQTV0UkhH?=
 =?utf-8?B?dWVYS2VzNllJN0pEN3Q4T0pITzU5NS9tVXI4YTduQnB5V3QvZEoxNFJjdnRM?=
 =?utf-8?B?L1Zra3YzUlJGb2RuTE5hdVlPM3gxd3VKSW53SnR5T2E2VUg1UC9DQnprYm9H?=
 =?utf-8?B?ZDZhNFFrZ25MR2syRTUyVU5GcFQzUFBxMEtzZmJkV052Rks2OWlGK1I0RlNy?=
 =?utf-8?B?bTBFRmNLYmJCaXF0MlFVc045YmN4dEUrdnUvMHV2YVo0eDZSeHhjSFhWb2Y5?=
 =?utf-8?B?YXlNdVB6SEVEU2src2w0ZkFZaXE2RC82YVFKNERiRkJxeUh1aVBJYURkT0Q3?=
 =?utf-8?B?SUwrd1A1SkhSUDljUFdIMnJOczN6aDBMa1YyRGJDdCt4TExSMUp1VXF1aHJz?=
 =?utf-8?B?Y3JVWVV4azltamZZQ0trazRjYnd3UGtUVUpFd1lrd2Y3UUFCWnhMK3dlZk9t?=
 =?utf-8?B?NVNyWmdWSW9UejdWUC9ZTjQwSm4vTjRVM1ovMXd6UE9JTzl5MzgzTXE2bnU3?=
 =?utf-8?B?QzA1d0plVzk1K0M3cUJiNHY1cE1IL1ltRkd1RU1kdXBtMzUrSFhwaGhlUzNq?=
 =?utf-8?B?b1p5bkJXdERnWXpYbHVmbi9wZEloalNxblZYN1lNdEF6NzJDSFR1QXV4L0gv?=
 =?utf-8?B?aTQ5YnMrS0x0ZGVDcEpZUTU2S0ZXdGtKWjZoa3dIT3JRZFJIVXB4eXNoT1E4?=
 =?utf-8?B?M2ZmNlpPK3NvUVNXeEc0d3dHSndIaXBzRHU0YnhXMWdqaTZnSTdwenNnQ1kv?=
 =?utf-8?B?MVhSL2dVSTVlTGZMUWNRYXlFSVhJb0psc2E5ZktyajBxKzBRbGpYZVBSRk9I?=
 =?utf-8?B?S0tzenUzVXhTaGFYSVR3cEI5cUhNNTIvdHNQL212eFZzWHFtYlJ6OWVnWThJ?=
 =?utf-8?B?TVlDNXMrZU5kR3E4ME8wZXJKZFlPQjRhT0ZXMUFxOHBEMjZMdlRqU0JVV2pu?=
 =?utf-8?B?c2JKQnhza255VXFjcSswTmNvVUoxVnRWRCtzS2NXeTBaeVZ2WVdCZmZWc3Ez?=
 =?utf-8?B?VktRZFRQbHRTVUFLRDIxcGViQnoxM1pvaTM0ZHJrZG1aeDNEWlZPTkJUVDg4?=
 =?utf-8?B?azBHTGFHQ1JwUytFNm5NbUVoUTBqZkhwcEpIT0JHdmhIeTVNVm5aeEE1Y0M4?=
 =?utf-8?B?c21CNlFhVjJtWU56OFpKelZpY3BsTnEvN1J1UFZ5M2w1a2VrSmhwWHJPM1pX?=
 =?utf-8?B?YlhxUlN1a01DaU5peHlXZVpvSE9xL1BWN0hxOEg3SWlETTZIdWtzTXp4SEg0?=
 =?utf-8?B?akdFZUpNcHVKK0hTK2tLNUhRSURhYU1IS2lHWnNGeVh0M0pSWThCSVp0ZVpB?=
 =?utf-8?B?MGdieENLbnlhTU9ob3A2enIyZi9jNFNBWU84cUlGVDZSNDhxd3NaVWhmN0ZY?=
 =?utf-8?B?ZjdpY2Y5NTFWK2xBUm9FTFJ2NndqTTJvRjBIbmFHL3VoK0NvbExYODJYaVB6?=
 =?utf-8?B?bjVqbXhqVmtWYVZlajBleVJEYUxPbDRvWXNKTHl0TXNQb0VrQzdMaVdyTDZ0?=
 =?utf-8?B?Q2p3YWZqN1ZtUkRjYks5OVc1R3FRQ2ZYK0R6Z2hyRnRuT0RwTlFwb2o2SHZ1?=
 =?utf-8?B?NVJEb1I2UU9RYzY2dXRCbzU3azRVMThoTDUxOGRSdWUrTVhtczFnUkZyeGFx?=
 =?utf-8?B?cmpSVjN3V1M3SWRjclNnMFlPZ1lWR1FCbCtjNXBmRVlFaTZqZmJqaGkzQm8v?=
 =?utf-8?B?MUxJUEszbllNKzRXejJ6TE1hbFAzTko5cENUZGxBeGlJZ2VpVEpOVHhIY0ZV?=
 =?utf-8?B?ZE8wWWZrckljZTE5YnVSM2xiU0VPZkVUdkpvcEYyM2dZNytuY0ErUkh4Zjk5?=
 =?utf-8?B?ZjR6eXRhTUFQUVltYXZxZlNEakdCdFVGUk53WXJscjFDQ2ZCVG5FMVREbkpp?=
 =?utf-8?B?ejM3bVBPSmovUlhQTE04UXRIYk5GZVlUVEN1RFo5WVEvUzlVYlB4OVI1R281?=
 =?utf-8?Q?A+jQA75LjAuEseWHlJkOzHRv2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81508379-3b55-4363-81fa-08db6cb5a7c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 08:59:26.2404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfJMRvmqKDR1Nl5+ojCMmWiRyCKWMVgt46uCQFxQYySjjixIqgREy2PLrV8/cCqRFqPMWNGir6hvaVDhAiWhhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 08:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182740

SGkgVmlqYXksDQoNClRoaXMgZml4IGlzIGFscmVhZHkgc3VibWl0dGVkIHRvIE9FLWNvcmUgY29t
bXVuaXR5IGFuZCBhZGRlZCBpbiBxdWV1ZSBmb3IgZHVuZmVsbCBicmFuY2guDQpQbGVhc2UgY2hl
Y2sgdGhlIHN0YXR1cyBvZiBjb21tdW5pdHkgcGF0Y2hlcyBoZXJlOiBodHRwczovL3BhdGNod29y
ay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UtY29yZS9saXN0Lw0KDQpUaGFua3MsDQpTYW5q
YXkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBWaWpheSBBbnVzdXJpDQpTZW50OiBXZWRuZXNkYXksIEp1
bmUgMTQsIDIwMjMgMTI6MjQgUE0NClRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQpDYzogVmlqYXkgQW51c3VyaSA8dmFudXN1cmlAbXZpc3RhLmNvbT4NClN1Ympl
Y3Q6IFtPRS1jb3JlXVtkdW5mZWxsXVtQQVRDSF0gY3VwczogRml4IENWRS0yMDIzLTMyMzI0DQoN
CkZyb206IFZpamF5IEFudXN1cmkgPHZhbnVzdXJpQG12aXN0YS5jb20+DQoNCk9wZW5QcmludGlu
ZyBDVVBTIGlzIGFuIG9wZW4gc291cmNlIHByaW50aW5nIHN5c3RlbS4gSW4gdmVyc2lvbnMgMi40
LjIgYW5kIHByaW9yLCBhIGhlYXAgYnVmZmVyIG92ZXJmbG93IHZ1bG5lcmFiaWxpdHkgd291bGQg
YWxsb3cgYSByZW1vdGUgYXR0YWNrZXIgdG8gbGF1bmNoIGEgZGVuaWFsIG9mIHNlcnZpY2UgKERv
UykgYXR0YWNrLiBBIGJ1ZmZlciBvdmVyZmxvdyB2dWxuZXJhYmlsaXR5IGluIHRoZSBmdW5jdGlv
biBgZm9ybWF0X2xvZ19saW5lYCBjb3VsZCBhbGxvdyByZW1vdGUgYXR0YWNrZXJzIHRvIGNhdXNl
IGEgRG9TIG9uIHRoZSBhZmZlY3RlZCBzeXN0ZW0uIEV4cGxvaXRhdGlvbiBvZiB0aGUgdnVsbmVy
YWJpbGl0eSBjYW4gYmUgdHJpZ2dlcmVkIHdoZW4gdGhlIGNvbmZpZ3VyYXRpb24gZmlsZSBgY3Vw
c2QuY29uZmAgc2V0cyB0aGUgdmFsdWUgb2YgYGxvZ2xldmVsIGB0byBgREVCVUdgLiBObyBrbm93
biBwYXRjaGVzIG9yIHdvcmthcm91bmRzIGV4aXN0IGF0IHRpbWUgb2YgcHVibGljYXRpb24uDQoN
ClJlZmVyZW5jZXM6DQpodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMy0z
MjMyNA0KaHR0cHM6Ly9zZWN1cml0eS10cmFja2VyLmRlYmlhbi5vcmcvdHJhY2tlci9DVkUtMjAy
My0zMjMyNA0KDQpVcHN0cmVhbSBQYXRjaDoNCmh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuUHJpbnRp
bmcvY3Vwcy9jb21taXQvZmQ4YmMyZDMyNTg5DQoNClNpZ25lZC1vZmYtYnk6IFZpamF5IEFudXN1
cmkgPHZhbnVzdXJpQG12aXN0YS5jb20+DQoNCg==

