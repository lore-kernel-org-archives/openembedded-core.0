Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58348CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 09:29:49 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16949.1762162179065802457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=vL4nx/SI;
 spf=pass (domain: est.tech, ip: 52.101.83.22, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMpXJLvpUOz5c5ZLxiSCk4Px/4b/63hE862U84WSEx2m4ZQEyp7trQrMstlbX3K7qElNc5XECNxR3f60ZH2+kA6/PmHpOLtikAcXCy6JiSWbwQLK1fKbtLQcrkjTGz/mXBv2MnvxfSbC+4X/keRXz46dYLaBC1WlQn4ypy3YV51M9Bav5/HLzcJ7ykQchnYqf2CcKEnAsdtEGoKz9iLEqiEvJd9Rv29N+NIGUH+G2XDT9xpGJ1gVgRcYUnEDDAJQFQSTZerodV0uTGPbdrBoP7LgF3Z4X0DBuw6i7ZZvoLnElaXcs1Qmc6i8vW68esHFEo+TqjIP5YOJW9+HYyOPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUMfUYI5dbwmS1Q5N4Sl+dWh9tsd+TuhNQRntN3Yhd0=;
 b=zRgP1XB6SnPcdBd5rtw1Q2APSFdLV6NAPmI2i677FrnGuV96sJWB213F8SCmvi61C4FB6GrX3ni82S18e7G/X1H2CLsv+CyWpnrOZWdIR4gm7kd+iv+bfKsJqKTpM/prsrsUNWh65qz3iqagzCsT7TEbDg4frovGUQ6fZuGnDsuaedMnIj5SpNhI/VZeoEADLAhorWI71lZKhLgD5kzJ51SXRnMc+HZ63XHEjmbThFDW3YlBb1OufBmuCejs7H9lM1KDlTwU4RijWzN1j1qVKCMmKLjJ5ju4qgNE5g/G8325h+EXEQUwrqTcStoacEWxoMiMB//hwqD5WZSJqWW9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUMfUYI5dbwmS1Q5N4Sl+dWh9tsd+TuhNQRntN3Yhd0=;
 b=vL4nx/SIl5KtvKZEW2yvl6kZDKli4kqhlDN/ksKxJKAysNSOPThLRcoj1lOPSVPfT7NNHYvTLV+KW0XvFRSvgU4zhxPuuCcS3XWngFlMWO4oduqpF70dPlXDYZ6g5nrr5R2HJ4BqT0+II3Rh5cfZuJC0sqOXIUievcEtXt8y47A4IsAsYGXbCgu2iizzltZKp6zLQb7J+VGMLIlV+2khMz6vbuP19RCFTHMBsz57/CD7x6yfqPyiQ071JnEj8dqbLUyhutwsZ085hrpitWxMXH6VP8e/c/rPDkX2fs7PoQ3i82c0Aim2+lnra9SPay2dSHiKpgeDE/t5VQv5qBenzg==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DB8P189MB0795.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:129::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Mon, 3 Nov
 2025 09:29:35 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 09:29:34 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Gyorgy Sarvari <skandigraun@gmail.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Index: AQHcRbJAiV7TRXSsyEygedKG5NMpXLTVgW2AgAJ/R3OAAN9cgIAH2uQw
Date: Mon, 3 Nov 2025 09:29:34 +0000
Message-ID: 
 <GV2P189MB3005908AD9DF68078F6ABC6CFEC7A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
 <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
 <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <2daec34c-5c29-4917-a817-27f21a1f65a2@gmail.com>
In-Reply-To: <2daec34c-5c29-4917-a817-27f21a1f65a2@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DB8P189MB0795:EE_
x-ms-office365-filtering-correlation-id: be357d54-7a51-42e2-4690-08de1abb8050
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?0pbrFIbWsMY2OsEGBLJ68aCqg2fxU6qPWy7a25loebs1I6g+p6YDw4T0?=
 =?Windows-1252?Q?YlpDBTBCtoOwJtcb56dw8p/TZ7PEMrrU155X3l21+MQoloxUMZdZXN5X?=
 =?Windows-1252?Q?tiSNwXO68Bx6ZEffbYQLGBuCrFJwWyppkRY52CQ2fIOBRhjv2tsjdXjp?=
 =?Windows-1252?Q?n+JthAPT5oHKtV0Wf2+rQ20Ijzt0TcUUaHoWzZFICJeh8MhS5Ffl1CrL?=
 =?Windows-1252?Q?AHuXnOtdVzK5EHZw/AkeNA2rZlLKtF0T2kWvm/RRuS8n6tr3S7yhajg8?=
 =?Windows-1252?Q?LSTdd9TvF9O/WKH+77u9Lz0X76SgKeuX2v7PS++HwtafB5yUx+bkTlRK?=
 =?Windows-1252?Q?SInrWO80w8nkwMnmoY1L6xc4hAgUdPs/u03mDso+DRQoCLyUki00uRC5?=
 =?Windows-1252?Q?hYFu+cR05Hf2HUlbL1grhlvFw+f/bfWCsKu0BhbL3sHCAoooGBfJnOWC?=
 =?Windows-1252?Q?d37BnefK4Nl79KKLnl6Hm0RldvyjR4tIwuEV97JeC7u4hER02umK7FqY?=
 =?Windows-1252?Q?pPwpLLh0iOfxSEXiC1f6zdW1+lZYpciiDzSSD61J4CYxTF0AW2oO+cQS?=
 =?Windows-1252?Q?2UD8FIAwDImbu+ykOjxJA3wZ0apH3xJwVQtRvZ5YlHygjYKb6twA/Esi?=
 =?Windows-1252?Q?5yl6UhJ7hFsn9+kQK40rtRpx0EDvvZGsIWaQQXoGhMp3XeWWnoARP3qA?=
 =?Windows-1252?Q?buuRwLUzUi+fF0z//uJy5ttA2KifSS75VxkeOyzuMzav/D2lAwNS2ZEb?=
 =?Windows-1252?Q?RFmoeSgjbs5ddFlimDoBaJXu8PQ4pUrSuZ4t4whmuotJRELwKsxoKvqa?=
 =?Windows-1252?Q?sQRveY/8X6gjQ4P8c7pKbMOqkVwffUWXgG0TX1QWYJrk2uiQUydrwzHp?=
 =?Windows-1252?Q?2DPFZT2ubVBA7R9CYw2XpOjLhy2wtZIX9WtCLaiGFtzhjR1NutekFlvt?=
 =?Windows-1252?Q?uHWNEyx+iivJKOC/nkEG2EUmPaynpFgZsAQ/b2OHQ5iC+AUlcZLKuAXF?=
 =?Windows-1252?Q?5HA/puhjQkK3MGOdrt9sZ65e6MPpUAzpRsROBFCfyKvxFMJXRgFHPBfg?=
 =?Windows-1252?Q?BKqCy13YnwLWIUi24huOlTVkCDu58yiaCkNfDlFzc0llEqkYmUTCDiwL?=
 =?Windows-1252?Q?yuMKRzy4be80Wp1ZW+dMI0EfhcSXaOHr4v1hgplcMRe2RTWzAzPMnHXU?=
 =?Windows-1252?Q?TCkqgnUKHA1Ev+VFABE8PmvMjUl8T5/ktqu/ovYRrAyvbasiY6Iu1YJr?=
 =?Windows-1252?Q?5XPSWlOtGJV0yX4HMPBXoo09KzvDQxzwwk5j+sLD4743xcQvFRM1OIFo?=
 =?Windows-1252?Q?OiPhOugjW+hPnk53dVM7C/Z4VFQk/ywSfk0BciAStLQVRQEPQ/9eugbL?=
 =?Windows-1252?Q?W8mSF5u+if27tHo6fSRxY6lzsxrAxUT/P6KMcvVD9ojSts1Ul/zT7e1H?=
 =?Windows-1252?Q?1cnopsxr4OqGOEu7FOUcae/Eogv+JpNpzl79HINdiOEGfVdS15XYHsqi?=
 =?Windows-1252?Q?PloM+8SU3VYOvfw0qKpQxMb+D/uVWWFQe4fQI1kwnt8nj2H+7AQzQkOx?=
 =?Windows-1252?Q?Q3CNbhL1ElZ0aZjk92Che2lA7e7ubGmxR6Fjyw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?qcpvXDlVB6zI9krjMS2S1n6eRbDj7yI9ohYVGdrFy5h+4zrn4zpaRquI?=
 =?Windows-1252?Q?dEhPoJaqEnm+zot/T1DUpgLFjw3NOpfrsA7yL3S6VRPjDBwvZj6ln4GA?=
 =?Windows-1252?Q?bbN6RKyUpPQRaMXaF5xIPiN7z1uI2xVZpE2CM23tzg4+vsgskkiO7XyF?=
 =?Windows-1252?Q?n1qTdHCY7hSvHWJv0fbXPEH/eybVWhqXH2VtX6fF/Cscd7EFGi3+TvYD?=
 =?Windows-1252?Q?HOhjNBH1d1eRD1uT/P/xCExcnAB9qgGYbWM9edujOBLSPCMOpOFXrqPN?=
 =?Windows-1252?Q?wzFOBOea14fPJgBKYjJ8OffuI8AtpOcyDbCgzBdJTDukRgM+3ZBTxvp7?=
 =?Windows-1252?Q?drxqZf6XR+RH6dAxHBFiOi8WRX6oXPFJzqqraVHYeU/yrhaNvkxFvKaC?=
 =?Windows-1252?Q?GKlBPgkKSra0gGkSCU24L7qVJmHKRABMSb6XbVq9fthieaWi4/8uJ8im?=
 =?Windows-1252?Q?0VNe8ADgbIJGVeH7yem6zGywxEv2q0y5VzeuSIg6Yf/NtZYws3+AYxNn?=
 =?Windows-1252?Q?mdsN039CeFrbwdgzAr/utd9aZmwuIFqJTSYK6+MY6c2xun1gSQmAYz+v?=
 =?Windows-1252?Q?cKMoS3cLthyholLohdUWzZsaBxq65BBt32qjvfO6RYxV/aA/Jbyty4QT?=
 =?Windows-1252?Q?xpc7pf3CMKdMOZFhhiMy0GhLAWtBAjtfHJxMNkK/1roo9p6BdRufQAvq?=
 =?Windows-1252?Q?tOIRnUSGcT5nSgIV2j5boJxryOwghZKKJxVokzXmzb1+U0KGbx6ASvsX?=
 =?Windows-1252?Q?XmcrLEF3+fVk8lUYeipBabZ1DsdWM6FR6jxsR58u+4maqWhVNXWQDrIQ?=
 =?Windows-1252?Q?69aYFIZ+LgbGapMrRqUL2vMEKEhtFd0s4omlO5a0vJjZ27A/EirJTMo+?=
 =?Windows-1252?Q?dZ+XRcEIvaqEiCc1FOoTkUYhnVpulJyWPDJoIw4lXDp6+Zz5nTk9Iv7X?=
 =?Windows-1252?Q?ZJn+j1LcEvLj7Ae6fBDecbBHwq+zDvrXmf/1jpWDfmSG4yprBO4Kif7T?=
 =?Windows-1252?Q?6HY/B8yhvYu1uLOLjy5lfuu4Yz3SJM2EDhe+ITadtOX0bmgQXxZ3ORTL?=
 =?Windows-1252?Q?K4+VSRyQlzRFpw20c1bqLEC9/czGj5qZAiM4klmIIqY4mLsJcCeQE3nC?=
 =?Windows-1252?Q?6thgkOj1yJyPb1RWGrnIzIRZ5y6mH0UwosXLMczpTJ1s22xw+rO8xVCk?=
 =?Windows-1252?Q?54T49F7iJMZoC9Etw1SKhHrHPIzkjeWBqPzsi1VONvNaPCY9+6M8rMWA?=
 =?Windows-1252?Q?MXDk7lY7kmLjJZqID6JvrUpBHHY7JyZZrceca63vuhQYO15B91o1bUsc?=
 =?Windows-1252?Q?C1vHpL4llpCCwGVGDBr8KmxE01krnFJhwTgFCIt/MdHlU6eYVuWfU7ex?=
 =?Windows-1252?Q?r4XLqHdf08TlhiZO+F9LV7hHkpHYeEZo/KYpgraO0q7SOIk47z+xQ5YZ?=
 =?Windows-1252?Q?CMUVsfLXYPYgE5/V6DLsPU4NjDkMgH48lNqGxZ7qr73hw7NE/3d8PZnz?=
 =?Windows-1252?Q?4If2nxQXyyyhU2Dh2TbquilwilSCGZdXgzh8bf30z7RGRWuwQoZUhKNO?=
 =?Windows-1252?Q?4hyIYCDLCvuOEgbHR498e3aV0ouE7507jxjQcaDST2qq8/zxcqbbB4J1?=
 =?Windows-1252?Q?HFt3dw/9wVRLOWXW5LeCe4vo4OrvoGCYWO/y3DBBI0PtZ5b85DCUseAj?=
 =?Windows-1252?Q?aNPCTysxj/6Gfd+kFMdxvpBLvtP6qPb1?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be357d54-7a51-42e2-4690-08de1abb8050
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 09:29:34.6781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdiW7YIHBFKJvgRxocWpn2KNQmuCLZ7DwMhWXZvFpR42/BPv0LD9bScJ6awgPlzxn2b+a1zDMa88LmE2r5O6tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0795
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225637

Hi Gyorgy,=0A=
=0A=
The intent was to capture the exit status of the first command in the tee p=
ipeline (runtest),=0A=
but the || RT_RET=3D$? part doesn=92t achieve that =97 $? there just refers=
 to the assignment failure,=0A=
so it would indeed always result in 1. I can simply put it as RT_RET=3D${PI=
PESTATUS[0]:-0}=0A=
and remove the || RT_RET=3D$? part. =0A=
=0A=
I=92ll drop the unnecessary fallback and update the run-ptest accordingly i=
n the next revision.=0A=
=0A=
Thanks for catching that!=0A=
=0A=
Best Regards,=0A=
Pratik=0A=
=0A=
=0A=
________________________________________=0A=
From: Gyorgy Sarvari <skandigraun@gmail.com>=0A=
Sent: 29 October 2025 10:23 AM=0A=
To: Pratik Farkase; Mathieu Dubois-Briand; openembedded-core@lists.openembe=
dded.org=0A=
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support=0A=
=0A=
On 10/28/25 22:05, Pratik Farkase via lists.openembedded.org wrote:=0A=
> Hi Mathieu,=0A=
>=0A=
> I looked at both the Ptest logs you sent and seems like more tests are=0A=
> failing in the autobuilder than in my local QEMU test setup. The=0A=
> failures appear to be byte-level differences (e.g., =93230 bytes vs 275=
=0A=
> bytes=94 for bug-147) rather than functional errors.=0A=
>=0A=
> https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux8=
6-64-ptest/core-image-ptest-libxslt/=0A=
> <https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux=
86-64-ptest/core-image-ptest-libxslt/>=0A=
>=0A=
> For both qemuarm64 and qemux86-64 machines my local ptest-runner has=0A=
> the following output :=0A=
>=0A=
> For x86-64 :=0A=
> root@qemux86-64:~# ptest-runner libxslt=0A=
> START: ptest-runner=0A=
> 2025-10-28T20:44=0A=
> BEGIN: /usr/lib/libxslt/ptest=0A=
> =3D=3D=3D Running libxslt ptests =3D=3D=3D=0A=
> FAIL: ./bug-146.xsl (result mismatch)=0A=
> failed to stat ./bug-146.err=0A=
> FAIL: ./bug-146.xsl (error mismatch)=0A=
> ## Running REC2 tests=0A=
> ## Running REC tests=0A=
> ## Running REC tests (standalone)=0A=
> ## Running REC tests without dictionaries=0A=
> ## Running REC tests without dictionaries (standalone)=0A=
> ## Running general tests=0A=
> ## Running general tests without dictionaries=0A=
> ## Running encoding tests=0A=
> ## Running documents tests=0A=
> ## Running numbers tests=0A=
> ## Running keys tests=0A=
> ## Running namespaces tests=0A=
> ## Running extensions tests=0A=
> ## Running reports tests=0A=
> ## Running exslt common tests=0A=
> ## Running exslt date tests=0A=
> ## Running exslt dynamic tests=0A=
> ## Running exslt functions tests=0A=
> ## Running exslt math tests=0A=
> ## Running exslt saxon tests=0A=
> ## Running exslt sets tests=0A=
> ## Running exslt strings tests=0A=
> Total 746 tests, 1 errors=0A=
> =3D=3D=3D Finished libxslt ptests =3D=3D=3D=0A=
> DURATION: 10=0A=
> END: /usr/lib/libxslt/ptest=0A=
> 2025-10-28T20:44=0A=
> STOP: ptest-runner=0A=
> TOTAL: 1 FAIL: 0=0A=
>=0A=
> For arm64:=0A=
> root@qemuarm64:~# ptest-runner libxslt=0A=
> START: ptest-runner=0A=
> 2025-10-28T20:54=0A=
> BEGIN: /usr/lib/libxslt/ptest=0A=
> =3D=3D=3D Running libxslt ptests =3D=3D=3D=0A=
> Running .libs/runtest=0A=
> file ./bug-146.out is 217 bytes, result is 0 bytes=0A=
> Result for ./bug-146.xsl failed=0A=
> failed to stat ./bug-146.err=0A=
> Error for ./bug-146.xsl failed=0A=
> File ./bug-146.xsl generated an error=0A=
> ## Running REC2 tests=0A=
> ## Running REC tests=0A=
> ## Running REC tests (standalone)=0A=
> ## Running REC tests without dictionaries=0A=
> ## Running REC tests without dictionaries (standalone)=0A=
> ## Running general tests=0A=
> ## Running general tests without dictionaries=0A=
> ## Running encoding tests=0A=
> ## Running documents tests=0A=
> ## Running numbers tests=0A=
> ## Running keys tests=0A=
> ## Running namespaces tests=0A=
> ## Running extensions tests=0A=
> ## Running reports tests=0A=
> ## Running exslt common tests=0A=
> ## Running exslt date tests=0A=
> ## Running exslt dynamic tests=0A=
> ## Running exslt functions tests=0A=
> ## Running exslt math tests=0A=
> ## Running exslt saxon tests=0A=
> ## Running exslt sets tests=0A=
> ## Running exslt strings tests=0A=
> Total 746 tests, 1 errors=0A=
> FAIL: runtest returned 1=0A=
> FAIL: some libxslt tests failed=0A=
> Finished libxslt ptests=0A=
>=0A=
> ERROR: Exit status is 1=0A=
> DURATION: 9=0A=
> END: /usr/lib/libxslt/ptest=0A=
> 2025-10-28T20:54=0A=
> STOP: ptest-runner=0A=
> TOTAL: 1 FAIL: 1=0A=
> Any suggestions on how to proceed or debug further would be appreciated!=
=0A=
=0A=
It can be reproduced with Mathieu's staging branch (apply your patch on=0A=
https://git.openembedded.org/openembedded-core-contrib repo's=0A=
mathieu/master-next branch). Not sure if it's due to the new kernel or=0A=
something else, haven't looked further.=0A=
=0A=
As a somewhat offtopic, but still related thing:=0A=
=0A=
I noticed the following construct in the run-ptest script:=0A=
RT_RET=3D${PIPESTATUS[0]:-0} || RT_RET=3D$?=0A=
=0A=
In case the first statement fails, then RT_RET will be always 1. What's=0A=
the intention here? If the second part should be a fallback value from=0A=
the test execution, then you should store $? before this line, and=0A=
assign the stored value to RT_RET.=0A=

