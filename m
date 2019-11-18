Return-Path: <ernst.sjostrand@verisure.com>
X-Greylist: delayed 3039 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Nov 2019 10:31:18 UTC
Received: from mx08-00271601.pphosted.com (mx07-00271601.pphosted.com
	[91.207.212.217])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7527D258
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 10:31:18 +0000 (UTC)
Received: from pps.filterd (m0107397.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xAI9cZd3023442 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 10:40:40 +0100
Received: from eur03-db5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55])
	by mx08-00271601.pphosted.com with ESMTP id 2wajmm9hf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 10:40:40 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gcilZHslUFKA1w6UiP+WYgsK5SyiiWj8yvkwQ18cpDQRPquwl/y/HKdt/SULRMjEcJtH9MeatKGij4CciUEju9kysfiB97WF7/iyesyc0S0KlPhAgCOliIObUGkdAwnhCqclWu5MQjqjhBSiKhx6Q9JCLfZ920sKJsszIgzFfPxNdqE7hcDlzSOqWUI87eFQDnxdapAIlvEfbGxxvYVPrGiUnY6xu9sUCL8sST3uOHoxunoxW6MU3FQrcSJPU1WTMIavfq7Ho/C5dTOTkpsP3Abj4xLG04zQSgq+cODgvwU8sBsmu1KYssy3qYP8mDQRhYMhXQ7i9KqVMA2BHhlwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BfoZ0Pnqz8Jgwm09hP0Ps9CwehiVxTTGtE0GuYJsso8=;
	b=nRjwDr41mnH/aG/HrH2gTEyXsdIqVOP2a1+zYLpso4QDrwns/8G4jGSyi2JGEyvLoMcqATDh9x/xsbXjkc6w/f7VRMq7FhAa4cgTML6/8KE5IkwUzU6RqDv2B4/i242MazhTCwxkGndcMewfyZm//8CAStpFwfFN3ts/GK9cCZVZcFvF/hFZIlrXr9HiWZq18z2APNIkSxLV+++P+7gIX2wGVgwD6uMfex+Y4Sx9iKI4Cd6Nj06c4cy2hZ2EQoAHio/bO7+u6QB7JrfkRHQIVEjLY6ZrPhaNF+6SayuUHzlJHLlcsJcyV6we+byPGOfxC+8IIHyECqopdSN1bUZ3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=verisure.com;
	dmarc=pass action=none header.from=verisure.com; 
	dkim=pass header.d=verisure.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=verisure.onmicrosoft.com; s=selector1-verisure-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BfoZ0Pnqz8Jgwm09hP0Ps9CwehiVxTTGtE0GuYJsso8=;
	b=VKU3moHKMk0uaIJh4JgYr4AB2CVoAorWhNDbEmpD8ZzKJ01prL28v8/9u5IXw9ZWHgjKbDil5JXzabU2BcRT6/PeEE/K3hXzyOSSNCfjSGEcL66OkPaa8i+2bS74yOHwqxNcHF22Ey2NuVenrmuvuS9JcssTblLvLsK6G/BivUs=
Received: from AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM (52.134.85.19) by
	AM0PR10MB2818.EURPRD10.PROD.OUTLOOK.COM (20.178.117.82) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.23; Mon, 18 Nov 2019 09:40:39 +0000
Received: from AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM
	([fe80::bc11:d703:c672:3d62]) by
	AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM
	([fe80::bc11:d703:c672:3d62%4]) with mapi id 15.20.2451.029;
	Mon, 18 Nov 2019 09:40:39 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?= <ernst.sjostrand@verisure.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] do_image_cpio: Improve reproducibility
Thread-Index: AQHVnfQ80DT9j/UJT0iIEauew/UUoQ==
Date: Mon, 18 Nov 2019 09:40:38 +0000
Message-ID: <ea9c1aec639f2c505e8beb3faa7366ee7db4174a.camel@verisure.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.13.16.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7453f9ed-f6ba-45e4-eb01-08d76c0b5f02
x-ms-traffictypediagnostic: AM0PR10MB2818:
x-microsoft-antispam-prvs: <AM0PR10MB281888CAC60986A93E9F9FA4944D0@AM0PR10MB2818.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(189003)(199004)(2906002)(8936002)(66066001)(118296001)(26005)(2351001)(2616005)(86362001)(486006)(476003)(186003)(102836004)(478600001)(25786009)(66574012)(6116002)(85202003)(6506007)(3846002)(6436002)(305945005)(7736002)(5660300002)(76116006)(6916009)(6512007)(14454004)(5640700003)(81166006)(71200400001)(64756008)(81156014)(14444005)(36756003)(99286004)(66476007)(2501003)(71190400001)(6486002)(256004)(66446008)(66556008)(85182001)(66946007)(316002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR10MB2818;
	H:AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: verisure.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WV0jDmUh4F+MrEswpwWw9VZzYmZICbyWFWF+hDtR8WLrGm1UvXagju7KxK01qr2b79b7U+BN6zzjW/EzBYWVqqa5HW1yAjLKESB7EAsoawvySrI4Ja+SZ/f0Co032OYBdjsiQPTeTqPtJlK18QZns7nkSvNpkKCX6wdH7iojeqC3B7LiY52qqU3bQsHQSIMR9zRFvivkJ49QRRNyaSA8jFtXYRSwU2CeUqvhisHeuoGVFv4462LyUwqGI49yBgREtfPj6VkASNRa8IWbjUxmbc4TuLYZiDpcRcNSYAGv5IFquZ5Z0TXq2WbwkGnurshhqirPWtGcwhr7mpBhmwXEosFDjqbw2+N0bin1iICrfsf3L/dgTaE74kfaubo24xeYVErw6j0mZRgnyPW3nUzOeCuqY2O0KeGol7UwIUbhiV/RSCbHVSwq13CkF88SfWaB
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: verisure.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7453f9ed-f6ba-45e4-eb01-08d76c0b5f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 09:40:38.9621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UThBhnoo57jeFhR3oOvxyA9wi5tN8256clzN9hhsbzFbqKd2vmztNe1ahd4EbcJ7wg6QQQheS3oSBYF5k8nyKzVg75etIYlF8iqEqDCWmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2818
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-18_01:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxlogscore=999 adultscore=0
	spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
	impostorscore=0
	suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
	lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1911180085
Subject: [PATCH] do_image_cpio: Improve reproducibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 10:31:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3775AC5C14F2A54D8D0911302568F7A9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RmluZCBsaXN0cyBmaWxlcyBpbiB0aGUgb3JkZXIgdGhhdCB0aGUgZmlsZXN5c3RlbSBoYXMgcmVn
aXN0ZXJlZCB0aGVtLA0Kd2hpY2ggY2FuIHZhcnkuIEFkZGluZyBhIHNvcnQgc2hvdWxkIGhhdmUg
bWluaW1hbCBwZXJmb3JtYW5jZSBpbXBhY3QuDQpBbHNvIHVzZSB0aGUgLS1yZXByb2R1Y2libGUg
b3B0aW9uIHRvIGNwaW8uDQoNClNpZ25lZC1vZmYtYnk6IEVybnN0IFNqw7ZzdHJhbmQgPGVybnN0
LnNqb3N0cmFuZEB2ZXJpc3VyZS5jb20+DQotLS0NCiBtZXRhL2NsYXNzZXMvaW1hZ2VfdHlwZXMu
YmJjbGFzcyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCg0KZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzIGIv
bWV0YS9jbGFzc2VzL2ltYWdlX3R5cGVzLmJiY2xhc3MNCmluZGV4IDJlZWZmYmIzNjYuLmM3YWY4
ODkwNzUgMTAwNjQ0DQotLS0gYS9tZXRhL2NsYXNzZXMvaW1hZ2VfdHlwZXMuYmJjbGFzcw0KKysr
IGIvbWV0YS9jbGFzc2VzL2ltYWdlX3R5cGVzLmJiY2xhc3MNCkBAIC0xMjgsNyArMTI4LDcgQEAg
SU1BR0VfQ01EX3RhciA9ICIke0lNQUdFX0NNRF9UQVJ9IC0tbnVtZXJpYy1vd25lciAtY2YgJHtJ
TUdERVBMT1lESVJ9LyR7SU1BR0VfTkENCiANCiBkb19pbWFnZV9jcGlvW2NsZWFuZGlyc10gKz0g
IiR7V09SS0RJUn0vY3Bpb19hcHBlbmQiDQogSU1BR0VfQ01EX2NwaW8gKCkgew0KLQkoY2QgJHtJ
TUFHRV9ST09URlN9ICYmIGZpbmQgLiB8IGNwaW8gLW8gLUggbmV3YyA+JHtJTUdERVBMT1lESVJ9
LyR7SU1BR0VfTkFNRX0ke0lNQUdFX05BTUVfU1VGRklYfS5jcGlvKQ0KKwkoY2QgJHtJTUFHRV9S
T09URlN9ICYmIGZpbmQgLiB8IHNvcnQgfCBjcGlvIC0tcmVwcm9kdWNpYmxlIC1vIC1IIG5ld2Mg
PiR7SU1HREVQTE9ZRElSfS8ke0lNQUdFX05BTUV9JHtJTUFHRV9OQU1FX1NVRkZJWH0uY3BpbykN
CiAJIyBXZSBvbmx5IG5lZWQgdGhlIC9pbml0IHN5bWxpbmsgaWYgd2UncmUgYnVpbGRpbmcgdGhl
IHJlYWwNCiAJIyBpbWFnZS4gVGhlIC1kYmcgaW1hZ2UgZG9lc24ndCBuZWVkIGl0ISBCeSBiZWlu
ZyBjbGV2ZXINCiAJIyBhYm91dCB0aGlzIHdlIGFsc28gYXZvaWQgJ3RvdWNoJyBiZWxvdyBmYWls
aW5nLCBhcyBpdA0KLS0gDQoyLjI0LjANCg0K

