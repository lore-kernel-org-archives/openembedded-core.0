Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2921DFA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:39:00 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web11.6967.1667205530764637171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=dNMtBkbl;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1667205531; x=1698741531;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kHM4Zas06XTqIpuKDK2jaIHKW46csk+6Pz/f0QTCr0M=;
  b=dNMtBkblA3SK8halzEEMJB9S38RxHTd5gmHax8QZCALoqcX9hds7NRpt
   fo74CQdHGMcZ57qvl7iL5/4CMBlzdwsnYaIjmSIZb0fvrQhb/dD3c3GS9
   ckgF/HHviiB1JMvVh2ZqAYP+tR30AqqspI2cgKkHFn9HkSqPgJyM01VTS
   ziDUGWWPcFA7Yy8appg2z4iwTk01T+MzvbFadI6rzj8cR+2K/vnnQMhq0
   J25U4VJQI5iB5MPfxmZSF+XCrCWzCEeFlNiZDQY48d87CSm08QK1pU9Sa
   k3pwZPAtk+grc3ipUR1OtJrOyKvc6NRYDhd2cHIGLe+G4lDvCOgTjGBYm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="68877610"
X-IronPort-AV: E=Sophos;i="5.95,227,1661785200"; 
   d="scan'208";a="68877610"
Received: from mail-os0jpn01lp2108.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.108])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 17:38:48 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7JD5ujH4uadnQ7oxxxUmY2DZ/0n0wCMhTSmVEQKQyDV8eMAY4U8ieAXex5G9ge7obnWF3EC74h7FZzsW3mpWsPwzwSwaWzEc/DVFzpEv9nmJXk++NP8ScUsAp5onGskqKGcr4UdGz1G6rErX7cm+YSRTC6ATgs83zQl8/ki8HYMKtOKvV7etll4rOJHDlKAz2TjAvmK96VZHrq1DYQzTllNULX77XqFAG39h2/uUCugzOTvjlsauTPfPCY6Ym1BnxMMmk3POGhOoGL2Bly2+lsM7BanldyQgOrWdiY7+CQrmQQy+cRzrnaDGFHW4NpJ/qy2Sdsz52B93GRxs4bv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHM4Zas06XTqIpuKDK2jaIHKW46csk+6Pz/f0QTCr0M=;
 b=iJjn/BmvDYarAT77kCvBlhGvkBYBmmv52h7WVHsKc1ru6XMI5rHA1s8GG6BfdHAUGRfxqQKqfKJ87F00oa3kn8qaHgqDq3uEf5jEiJpEFHGZ9nF2oLuld9CjJ/UTFZlBJnEJTg7RyQ/O+4/DMTRYFhyptf7x5j1aEFN7VXQqzOz8D4yTGIkQKI8DFPoeuEmDHSzx+a4AJJATN2iBd6RURNSFL+RnM3TYtO+dA8KrAncRpNGnkg33KgMywYcPe4U1WSEJYrnKp1INE/0YwQzHRhTQlOLvbB+FdnwkqCgt2FS4jJObXh7KF/XV+Y9BBEQnVq9ziihBgXn1w+wNlx5T5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSZPR01MB8686.jpnprd01.prod.outlook.com (2603:1096:604:15b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 08:38:45 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a637:517:7aa5:83b2]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a637:517:7aa5:83b2%4]) with mapi id 15.20.5769.018; Mon, 31 Oct 2022
 08:38:45 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Thread-Topic: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Thread-Index: AQHY7QFIBQMsVp+k1UKO0El4Doc6zK4oKk8AgAAD+lA=
Date: Mon, 31 Oct 2022 08:38:44 +0000
Message-ID: 
 <OSBPR01MB1845B7BA1558188406E85D23DC379@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj873res=PuBbMB-ffy6=ek-8UFNt+QvYru1dKdU-VjuWg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj873res=PuBbMB-ffy6=ek-8UFNt+QvYru1dKdU-VjuWg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MjQ3MmMxZDQtZDgyZC00M2EzLTg3MWQtZmU4YWYwYjQ1?=
 =?utf-8?B?ZDEwO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0xMC0zMVQwODozODoyN1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|OSZPR01MB8686:EE_
x-ms-office365-filtering-correlation-id: 22b23e04-966a-417d-c458-08dabb1b528c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3V7cY2DzBmtCazs9tBwMVXaJWvFXchF0gpTLtm5s2wlqS2Wa7ypJ3y7fVlq8sF0QwHftbF7WeJaWjjguBFjL91Wr5IJu+iGTXH5r5GTXZLxXZOxQy28IQR4tGkslAh8I4mKKDGnzJASOVVntmvh201kHHwBMgpCmrFkkbgIZkgynH/pGdiyYno4vC/DoOA/Xm7fqkcaNt3GBIh+p+b/6nFBP9BrIQS7l+Rtz9qro2x5zOCcQzrFPBBWbCNJXtKDb1Y2I+pYDcm3DJWIT8qrx9xXiHlqYaJJtXDAv+LBihSLdriwhLXsy1z6fw4LhvyrxkcRZJnhJzgDhKuEk8uHkvy4Bqp5ZmnkUMjAaY7u8rv0z7yrkterUumVIj3quikgeuLz6E6cTU4riR+BRUoJ5uw57jZ1wNyqNs1PdP/QewiXtTnWcju5kyWL0U40JXFctZ5oU0GjLiG2Qk+4M6d/5yrTcJ/dIXB+4SF8+DIFDWIwiWfNAoNxc639IHsk+6oDIU/LRy5KpPnI8LT4/0Dq8XSjabclfCY89mEgNsY1bZXltur4GLl3XlrUelat4E7QDR3BcL2oS/ghE7C1JyVI/Lkd6kqZ4rBdUzE7+WxaRtQNW07hFQeHK3QWu+2fl7bDXHtCUErt9SHLOhsbL861cdCDYPKFDzW41TERpVgNMgyhLxGJKq8BpfTTwL1ng7yvlUAbWz6e1WfFmwiadcSTUFCVjdfvcy3Fuhuye9K4U2e8zGHJRXljHr9/LC6BCBtRyuwWeKos9q+JuFwR2R6b2et24AHfddGyrL4U0OLKxEK6wUmx9P32RzBAboDFJ1nmiTW1OAsymM2qPAmstoZAXKIjL5aYohXgWdBb4VwWGEFM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(1590799012)(451199015)(66899015)(1580799009)(86362001)(2906002)(55016003)(186003)(83380400001)(66446008)(66556008)(66476007)(5660300002)(41300700001)(8936002)(52536014)(85182001)(64756008)(33656002)(38070700005)(76116006)(8676002)(4326008)(6916009)(316002)(966005)(66946007)(53546011)(9686003)(71200400001)(6506007)(7696005)(82960400001)(38100700002)(122000001)(478600001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M2srYUlDZHUrVkZ1MVZJSkNYSG9qVHZqaytsSEFZVDA1WGdiOTB2Tm10c2o3?=
 =?utf-8?B?NDVMNnRnSFU2N1d0Y0ZjbHlMSmJPRHd6eUhVZXAxWHVMWE4xRUlBZ3dFOTcw?=
 =?utf-8?B?RGdUZ0c3QjV3STRYUmJjL0IwWDJFcTNCWFJJVnNsT21TcXdXbVB2RnkwNFhE?=
 =?utf-8?B?emh0YWEzWmQzQ0p0L1lzNXNWUGpzblp2clRjZGxoc2tJSWpiVkgzbm5EWko3?=
 =?utf-8?B?M2g2MDJjNVpqaWlqTkYzdVp1ak44Um5qNEF4TDVoVUFRL3lTdFlDcXplVHpM?=
 =?utf-8?B?TVJJalB3dWxqL2JleE1XRVNTcXM2YW12TGFGcUxROGQrR2V6NkJYNHVrR05i?=
 =?utf-8?B?Z09nSHdyM1B4OVlEWEFHbHJUODh1aDhEYnI3MmM5UXg4RHdGcjRVVG5nYmdh?=
 =?utf-8?B?UHNzWTRBNndGNXNHOTZLbWtjRHI1NG0zYmZPR2hkekszMkhORDNLUDFVM2Mv?=
 =?utf-8?B?dHkwMk9YUWVqV2tCajNUNEZMaEdYWjlEaXZEbW5CZlltVXNwb3Yrb1gwOU9s?=
 =?utf-8?B?czFBNmRQc3k3ZFFlYzM0SmxLKzkzeGxxMGw3SUFrdy9BNURTS05iaVphSStM?=
 =?utf-8?B?Zm9RVjBoOXJJaHdEdFlWK25BS3B3VStwQzFZRlBBT2NCWStCeEtFUjJiWHR4?=
 =?utf-8?B?c245dzNDcFNDNWh0WFlFeVhYaHhMS1U3dmlJREFUNFZkYmdPK3AyM0Y0dFgz?=
 =?utf-8?B?R3NvSjZvb3NuTjRYQXQ4d3dkT2crR1hVRDA3ZWlrSDRvcHNua3duTnFuMTAy?=
 =?utf-8?B?Rmg2bTErMzJUTVRrdTlFd1FUY0V4bjVBcXpmVnIyYnJsK2dObGNrbVdJNFRJ?=
 =?utf-8?B?K1lEQjZFMjVyY2ZoejVySmVob05BRXFNUVRoWFJxeE1KRmR0KzNvQnFHbHFr?=
 =?utf-8?B?OExlYlpLZEY2YjRUS3pRbERINVhRcGI1NUlpOGFiWW9RZDkvZmRMNmNjdmp5?=
 =?utf-8?B?cndDekExZE11QmpMRzJCWVVkQVNwNitQVTBrakNRYzFWdUwwa2FJYnIwZTNI?=
 =?utf-8?B?Y2F4dS9VK1JCUlVsUnEyT2tRcWxhMnUxNjByQWt6bXZhemg1WnVPL0VBdE1o?=
 =?utf-8?B?VzdtWHhzc2NGRW5wemlrQ0xja1NQb0ZyMVJHWENQNi9hK0NIS1k0UWtyNE9J?=
 =?utf-8?B?dVdjbFN4SHpMa05xM3lJREtVVzlGM2htbjhNSmlnMFcrUTRyYTFoanNNcnVo?=
 =?utf-8?B?MDF2cXFrWFp3U2NCaW5OWk4xNkNQZWY3aVFhSEZmNU1UTlhZVFE5VFdQMDhF?=
 =?utf-8?B?TlhaZjFmR3paeXF2dTJ3eDNtR0pKTXpPMU1HZDNkQ05sbUlWWXdMaUhCUnJu?=
 =?utf-8?B?U3dYZ1BuWWxpSFBSRzRqY1FkdVpWWERlbHltVFp0Ni9WT1pNc2xCVnVROWRL?=
 =?utf-8?B?aktXdEVBYzNSdEVpN1FwZmE5cUo4ODFzN2EzY3NPMlpBQjFnWTdzTDZ3blJV?=
 =?utf-8?B?dTNrcFB4U0VwMU9QWGNCQkJqcHg0VEp4WHBwUk00OVRxZ1JacStwZWVYMkQ2?=
 =?utf-8?B?OVVDWkd4UVZoZ3RraldhVU1lRTR2N2xrK0NxRHpPb0xlZDJGbVdwMEVKVURm?=
 =?utf-8?B?bEl3Q29vcXdwdkpidG9QMnRsNmxyejdtNWdacTAzVExEcHJ4TnRxMWVSeFF5?=
 =?utf-8?B?RkxZT1hQbzIvaVZSZDBtNkhwRXhTOXhnaXVicVZXZ2lkb3E5YVJhZHgwRUor?=
 =?utf-8?B?aUlLTXhrNWh2V2FIL3JNK2FydEd2cWROM2FWdGxTRnNkZjgyY3A3VmlmODBp?=
 =?utf-8?B?NXAybkRRdmZGd2YvZWdncDk3R2NCWXN6WnIxVWEwaTJ3b240bmRXVlRkYkJ5?=
 =?utf-8?B?Zm5STmIvOTJLWGYvT3VHSG12SzFhNGRIbnlPMVdFQzh2aEdJbkpLamxXdnFp?=
 =?utf-8?B?RUgrQ0NQZWtMMy9kTHREYWxSV0RjQ01hVU4zNzd4T3VPeGttaFluejJhdjlK?=
 =?utf-8?B?cHBUbDk5QWdPTTB3MlFKM3BZS1NDUmdPU0ZOMEw5dnowd1ZiOEdTelhnK0xl?=
 =?utf-8?B?cFh3d2oxNXRXOUZHb016WDNESExIbzFzcUVlTjBGQU1XeXdJOHBWT2NpNGV6?=
 =?utf-8?B?cEU1VDFCdW5qeXNaMGRnYVRUaFNqM205ajhrTlpGWWNXN004VGV0SjNjSGEx?=
 =?utf-8?Q?+Lrw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b23e04-966a-417d-c458-08dabb1b528c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 08:38:44.9345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8esy8dCWkuPBq8dqpPsezrAfGdKDh8eedqSYVnrPy7KaoZtlfUdhjQULGMsJiuysWpSqUsWVRRkRrbBgeSrHqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172296

SSBuZWVkIHRvIHVzZSBuYXRpdmVzZGstc3lzdGVtZC1zeXN0ZW1jdGwuIA0KSSBhZGRlZCB0aGlz
IGZpbGUgaW4gbWV0YS1vZSwgYW5kIHRoZSBtYWludGFpbmVycyByZWNlaXZlZCBpdC4gDQpIb3dl
dmVyLCB0aGV5IHN1Z2dlc3RlZCB0aGF0IGl0IHdhcyBiZXR0ZXIgdG8gY29udHJpYnV0ZSB0byBv
ZS1jb3JlLg0KDQrCoCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0
LkkNCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkg
Tm8uIDYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2
NjMwNTY2LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6
IHdhbmdteUBmdWppdHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMzEsIDIwMjIg
NDoyNCBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNv
bT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIEFkZCBuYXRpdmVzZGsgb2Ygc3lzdGVtZC1zeXN0
ZW1jdGwNCj4gDQo+IFlvdSBuZWVkIHRvIGV4cGxhaW4gdGhlIHVzZSBjYXNlLiBXaHkgaXMgdGhp
cyBiZW5lZmljaWFsIHRvIGhhdmUgb24gb2UtY29yZT8NCj4gDQo+IEFsZXgNCj4gDQo+IE9uIE1v
biwgMzEgT2N0IDIwMjIgYXQgMDk6MTcsIHdhbmdteSA8d2FuZ215QGZ1aml0c3UuY29tPiB3cm90
ZToNCj4gPg0KPiA+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+
IC0tLQ0KPiA+ICAuLi4vc3lzdGVtZC9uYXRpdmVzZGstc3lzdGVtZC1zeXN0ZW1jdGwuYmIgICAg
ICB8IDE3DQo+ICsrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IG1ldGEvcmVjaXBlcy1jb3Jl
L3N5c3RlbWQvbmF0aXZlc2RrLXN5c3RlbWQtc3lzdGVtY3RsLmJiDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9uYXRpdmVzZGstc3lzdGVtZC1zeXN0ZW1j
dGwuYmINCj4gPiBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvbmF0aXZlc2RrLXN5c3RlbWQt
c3lzdGVtY3RsLmJiDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAw
MDAwLi42NmI1ZWM1ZTZlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvbmF0aXZlc2RrLXN5c3RlbWQtc3lzdGVtY3RsLmJiDQo+ID4gQEAgLTAs
MCArMSwxNyBAQA0KPiA+ICtTVU1NQVJZID0gIldyYXBwZXIgZm9yIGVuYWJsaW5nIHN5c3RlbWQg
c2VydmljZXMiDQo+ID4gKw0KPiA+ICtMSUNFTlNFID0gIk1JVCINCj4gPiArTElDX0ZJTEVTX0NI
S1NVTSA9DQo+ICJmaWxlOi8vJHtDT1JFQkFTRX0vbWV0YS9DT1BZSU5HLk1JVDttZDU9M2RhOWNm
YmNiNzg4YzgwYTAzODQzNjFiNGRlDQo+IDIwNDIwIg0KPiA+ICsNCj4gPiArUFIgPSAicjAiDQo+
ID4gKw0KPiA+ICtpbmhlcml0IG5hdGl2ZXNkaw0KPiA+ICsNCj4gPiArU1JDX1VSSSA9ICJmaWxl
Oi8vc3lzdGVtY3RsIg0KPiA+ICsNCj4gPiArUyA9ICIke1dPUktESVJ9Ig0KPiA+ICsNCj4gPiAr
ZG9faW5zdGFsbCgpIHsNCj4gPiArICAgICAgIGluc3RhbGwgLWQgJHtEfSR7YmluZGlyfQ0KPiA+
ICsgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7V09SS0RJUn0vc3lzdGVtY3RsICR7RH0ke2JpbmRp
cn0gfQ0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxNzIyOTMpOg0KPiA+IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTcyMjkzDQo+
ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTQ2
ODA3NzcvMTY4NjQ4OQ0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViDQo+ID4gW2FsZXgua2FuYXZp
bkBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

