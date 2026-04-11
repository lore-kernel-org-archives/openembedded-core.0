Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDD7F3ED62
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 20:33:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.107])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.210088.1775939594122180444
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 13:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=T1f4aDSr;
 spf=pass (domain: navimatix.de, ip: 52.101.66.107, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+EccDlL69gNK5iQr/X7ZwHw6Yi/Xz4arD6AjmwsFnk17lWOY/EODFYqE7Ncj/1RJzqP6oMIbBrJyxNBSJCPSaey+4ZEdxt3mHLXBjRMWYTRiagmcAheQ4pxfwiibMqmzgb1aufNA8EgeIBtzYo1Qnf98CVlu1Wy+FltUxRdtP5q5teXPrbOUvsp4jhPviYz7Sml8WlxRSjEL+M2XyS16JkfoN0uVZ5DeGN1aPNro7yE6blhOvNsopTGPTWcjZ/PyGDuCtqbzYZD/uWaBQ1vOOEgixs/ni+cU8fQzRRHeg2N4lzugH27ygScuhwKChd5qO68HyCZ7gOa5NKWrZbkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GK6Sh6wYEDlPjiOB52kayowzJPz0i8Kr+KLBnIFF7Bs=;
 b=FaQXXfLwvW16dT7Yp8i7rLEdS2g6Y1gfNdIqUoXJZqzgWjvjNInQCh14BQprsc25JCJKDoEOgkZP+Sqr0L4OVVrm4LoImdyS+rIBdzmg0eeqOX08ESI7pai5sYfJ0fssmGD28Ma4PMfkJtAiC2BhgMvX5jOo45MokaMdAUH3IQHnHIQino8gvaA1iemWP3Qx3y6ulNpAPn7pqw1uEjkOxVqH9VWTw6yvniyQQpaP70PAGevuHWM/hXp9ZnRXHc2srseEKwgEDXWvfmf28Bqg4V1x1uVKjB7B4qtns9Dx6wALmWw7ayUeModoJ3M0X2O4kEAdUUi8sc2nPwENZm/sdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK6Sh6wYEDlPjiOB52kayowzJPz0i8Kr+KLBnIFF7Bs=;
 b=T1f4aDSrYoDyDUuErtzPydj8Bfcc8LEJl8B28Hpe4Jw7KBbORPM4SrgEhGMMvX2cyY2bUOAJOdMQclMS9Z2sTqJZBLFrGYtJvFiYRNiPI7ARufdLl/eJaENBbG3yJ4qZuO/yFjwquAgUemyxDVeeRNjYzk39TiGBSRYfH9wJhY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAWPR01MB11504.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:4ca::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Sat, 11 Apr
 2026 20:33:10 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.046; Sat, 11 Apr 2026 20:33:09 +0000
Date: Sat, 11 Apr 2026 22:33:06 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: rs@ti.com
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	mathieu.dubois-briand@bootlin.com, openembedded-core@lists.openembedded.org, 
	peter.kjellerstedt@axis.com
Subject: Re: [oe-core][PATCHv2] systemd: fix unmerged-bin tainted message
Message-ID: <adp85lKLgESNthGT@navimatix.de>
References: <20260410182747.1646597-2-rs@ti.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="dhb633nmc6gndh5y"
Content-Disposition: inline
In-Reply-To: <20260410182747.1646597-2-rs@ti.com>
X-ClientProxiedBy: BE1P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAWPR01MB11504:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6aed2d-3c16-41a6-98ac-08de98098b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/E5xVmoCxuhCzT7NkXzQIxXRfkk+ywboxga6wnYVQrvnr0gClsRgohrITQiLvqsW0zciLfKcee7sEHsqfjzWWxFp2HSo3goGz4ouwrUJdMYTD4WOo8fJnsFfEgxGVp/XZ/Yg94TyQeV088AX9VWGOiVwqcFS621E0nIMqy9P+ouO5flw4ttgDKiZl8VUrXi+G23WHuPj+frRQQiehRepwswrBQGjEEm5FaiIfhtTRYya1RcXUxD+mIOF/zDIGYVFj5aROx630cZWh5hUhDakAlIpvW4dTvxayi08EMc3dWh1TgWZtKZKRdHgvRLcSaFkk3X4h4blrUxWKMcDcHn/cKGyddhSdomLwQTQarT4qeD3pxALZ364nigCPyaUu03zqYV3qHZCFcY6SenN5xKiZJBzxHqO6J+GbuyJNZEIlxvvbkNSyyYZ3Wp7tC+HWfXoXZgs7suhqDvlaBmwZdzky9tbQTOO88QQc4OFvApoypHd72xkyh84Bvcpk5BoDSYzUC9EP1/ju6p9QwBJjHI2J8fwwgACacFHvDZVCA/uczel0JWm/AScLcHlmqfDzihtU0956Y0dbQ8qr+GRCirFKm1LFu3UTf+WSiAi3sFtbhiQvTDIEMBQkVytamPBCVfBkrWD5/EvyWDEvT7fiIiQe8XIRuqkm7FWr/crYtzx7CTPV1kGdvJVPMcM9ZZO7ymF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aElnY1oybjBJYUU1T3ZZeEx1RXk4a0VMcHIzSm1xS2hXd3pudnRJKzlnenkw?=
 =?utf-8?B?akszWTExRFBPT0xVV29hVmo2ZWlkZGUvdGd5cXpFdlZaSjFsNlpMaFNpUmVs?=
 =?utf-8?B?ZEx2cmJSZXlRZFR5UVY3eGZCbWtNZkp6TVV4L091bGM4eFd0cXRObWhuV2lu?=
 =?utf-8?B?TGNkN1l4SGJQNlJpNm92T0tkU0JpalNlSHdaU296ZVlkR3paVENqMTlVL25C?=
 =?utf-8?B?cGhDdUZSQ21GUkpIcThxL0xLYnk3VkpxVzdyY2JQcWtMQUZPd2FjdllHekVM?=
 =?utf-8?B?S0ptQ24ybDhCSTlIL1MxOWpGQ2NpVVpBSFp6RTdhSjNsZHBNNWlRRzIzZW84?=
 =?utf-8?B?amFXQ3lCZU00eXBTRFlRUnBZQ3ZhT0J6dzB6RHdHVEREZUxJczNDTDNIRjZ3?=
 =?utf-8?B?QUVzUEg0Z0NhUUZrcFQ5WjVSM2JIeFZySSt1cExuZGtoaDh2dVR0eHFvNGMz?=
 =?utf-8?B?WTFuWHUzblh2R2lHb0RFUjRLbkcxZlFOZjZhN2RNekl3QnZVRWVMWWNTYmJ6?=
 =?utf-8?B?cmlFOFB1LzBpaDdvK0FSWEZlbkxNRFdQeGxPcXdXRkdjVkhmcHF6YmlBSFRQ?=
 =?utf-8?B?djZWSlIyQk5Vd2lsM3lKOU1aalJQbEU3Z09RUnIzRHVWZUNqMjZtVTVmdnM0?=
 =?utf-8?B?ZE5LYVE2eVFsY01ybmhzd2NiL2Z3aXYvSitCSmJCNTJ3S09MSmI5eVNyNzhP?=
 =?utf-8?B?YjVYQ1k2ek5tYS9wOUZiRUVoemN0Y2I2QlE5emErZW8rUHd1R3ZPU0RPLzYx?=
 =?utf-8?B?eTl2MkExckR5bGhyc3B1dmVBbWNkUzhjOWEwcFBTa3RLT1FRV0tEVUsySkxJ?=
 =?utf-8?B?Q3dHUHZTVTFoNXB0YTBQMndzVDI3dkxINVduNERXRmZ5NlFocTlYUy9SRURQ?=
 =?utf-8?B?K2lDalpxcE1sNFAra1VZKzgzTCt5ZVhzT2ozV2dUNUl2UmZDempiS25HdU5H?=
 =?utf-8?B?alUxSXkrK3lwNFN4M3FFSnpEVzRiOUxUbjZqaGR1RG5iTnpWMUdXTDlySVFR?=
 =?utf-8?B?KzRER3ozaDEyWTJDSjhtS3FmN0twaEtxQm9lRzNaaWlWam5YSFFwVHg1K1NI?=
 =?utf-8?B?Qndic1NmQ0FWSEZNR3d3dllERDAwSVA1L3VDb2JNbUdUSkEyYmhkRVR6d3ls?=
 =?utf-8?B?NVg4L21OaUxqanlEbkpEWWdEK2o4Mnc3S3FkaDEvcUhPMUl3ekZGOHROUktG?=
 =?utf-8?B?ay9IaEJKellGcXhpbHliU3dQY28yMFZDWkxYZklsZXM4cTBaN0ZiaVgrSjRC?=
 =?utf-8?B?UlorMTNEcmFBaThTNm42Vm50c1pYQmtmZURqT3Y1dkxkY3VLREY3bVo2aXFl?=
 =?utf-8?B?bCsxa3JKYStWSHAxeUN6TkN0UUlDeUFySXZMZ2lTdmZJL0hIQ21yZFl2VW1D?=
 =?utf-8?B?cnlYaU5Vd0d2WVVFR2tYVkZ2WGRYWmU5UkdqOTNSNS9FMGkxWmNhd0tGTzVi?=
 =?utf-8?B?dkJlZkhLRDRwYkNrNEY2eHNJcW9ZdTZRc3k4WWQrNXVBL2RuUzFVdG90YXJD?=
 =?utf-8?B?UndHenJCSml2VFV6NlJuVldPdlNtU1BZZXRuUzN1UzRybUFFb0M1UVZTV09N?=
 =?utf-8?B?UlY3UXJ4NXBKTHZVaW9TNFd2MHI5SnRwY0tMUm1DdUdIMWQ1UlB6dk96OVF0?=
 =?utf-8?B?c05adzd3WURVMUltMWowcXJPQStyWlUyZlJpUWNSZ2VyZndKRDhFQ2tya1pr?=
 =?utf-8?B?aUxsaWNBeG00VElSWk1IUnBYenBCTXZTbE9BT2p2dytHOUF4MGxwWjVzalEz?=
 =?utf-8?B?dmYrbzk0SElDaHpYQi9LTFFwMHJiTlFZeFh3RlIwdlZFbDJrVkRZUHlCSVZw?=
 =?utf-8?B?bXFXZ3U0WXJxUU1JUFNlVTZmOU1zMVk2UVhVSTRiUCtvTjFEQ3pheDdzcVEy?=
 =?utf-8?B?TnQ1b2RCb2tldVNQR2JtY29mYkJsR3ZTQlZvRi92aFFIbTkrUk1wVjYrRjB2?=
 =?utf-8?B?YWsyQ01LRjc5MGdBdk5nRnNpdHFZK25QT2EveWFMY2tJZ0hFbzA5U0RsNGw2?=
 =?utf-8?B?ejhRamxkdXRFcnFoYzFiMTZQaHlLcXB2VFlVeDRZZG1naGxwNU4xU05BeXEy?=
 =?utf-8?B?R1hwYzdObHRyVG1ZczdpWG44RnJaN3orR0tLQnlFN2h6Qm1MdGhBMk9zMmVy?=
 =?utf-8?B?Qm5VRlY2YnA1Y2FabDYxVVUvMUZvcndOMG9TbTJlQW44RzRWeHdFREhUcE5H?=
 =?utf-8?B?Q1d6VElSOTBQUWFUR29TWm5yVzlJNmNxNHE5T0s3N01WRW5nUkZPRUpBOTRv?=
 =?utf-8?B?YnYyZkRBYmplL2ZSOHRSbitGc1BZbWxHT3BTVVlNbkl2Qmxhbm13UC82enN1?=
 =?utf-8?B?UFFNek9RNk9NeWFseXB5MG9Tb1cxcDRiUDVWZFRZTFRxU0hXRFFuTHBDVjBo?=
 =?utf-8?Q?TIwro7WgwjX3pYIw=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6aed2d-3c16-41a6-98ac-08de98098b16
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 20:33:09.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6Xi++dSs6efVIARHiz1Hcga30fKGvsNT5+yihOH2+TJw+DXkk3fiMSamZ2Z8myjL9ihCNOOH4Ft7qGC6qrziZnkdU2aWpKYg5iuWJWSp6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR01MB11504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 20:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235048

--dhb633nmc6gndh5y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe-core][PATCHv2] systemd: fix unmerged-bin tainted message
MIME-Version: 1.0

rs@ti.com schrieb am Fr 10. Apr, 13:27 (-0500):
> From: Randolph Sapp <rs@ti.com>
>=20
> Systemd prefers both /bin and /sbin to link to /usr/bin. If this is not
> the case it reports that the system is tainted in systemctl status.

With this patch net-tools fail to build, but it looks like a fault of
net-tools:

```
| for l in $langs; do \
|     install -c -m 755 -d /build/tmp/work/core2-64-poky-linux/net-tools/2.=
10/image/usr/share/locale/$l; \
|     install -c -m 755 -d /build/tmp/work/core2-64-poky-linux/net-tools/2.=
10/image/usr/share/locale/$l/LC_MESSAGES; \
|     install -c -m 644 $l.mo /build/tmp/work/core2-64-poky-linux/net-tools=
/2.10/image/usr/share/locale/$l/LC_MESSAGES/net-tools.mo; \
| done
| make[1]: Leaving directory '/build/tmp/work/core2-64-poky-linux/net-tools=
/2.10/sources/net-tools-2.10/po'
| mkdir: cannot create directory =E2=80=98/build/tmp/work/core2-64-poky-lin=
ux/net-tools/2.10/image//usr/bin=E2=80=99: File exists
| WARNING: exit code 1 from a shell command.
ERROR: Task (/build/../work/layers-3rdparty/oe-core/meta/recipes-extended/n=
et-tools/net-tools_2.10.bb:do_install) failed with exit code '1'
```

do_install() {
=E2=80=A6
        if [ "${base_sbindir}" !=3D "/sbin" ]; then
                mkdir ${D}/${base_sbindir}
                mv ${D}/sbin/* ${D}/${base_sbindir}/
                rmdir ${D}/sbin
        fi
}


And atop has this code which does not work anymore:

do_install() {
=E2=80=A6
    # remove atopacct related files
    rm -rf ${D}${sbindir} ${D}${mandir}/man8
}

ERROR: atop-2.12.1-r0 do_package: QA Issue: atop: Files/directories were in=
stalled but not shipped in any package:
  /usr/sbin/atopacctd
  /usr/sbin/atopgpud
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
atop: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: atop-2.12.1-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /build/tmp/work/core2-64-poky-linux/at=
op/2.12.1/temp/log.do_package.1427030


--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--dhb633nmc6gndh5y
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNDExMjAzMzA1WjAvBgkqhkiG9w0BCQQxIgQguN1OfHwW
BO3Xtl/3kCvfx++9gNRqV381wx+0p1u0sAAwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAAsKvJ21oy3q
rkfHPh/Ab0E8HZmWNmcNZdHLflnwE4ihleZaxK9Mp7C06cw9P+dZO9uRJjz8a3Gii3b5SYmU
4wWkIRKSIVptpwRzh3JpwUMtwR7UoBnLci4scfSc9EJLpWuNTBQWiJ0uQe5uwTx0kpqyKLsg
YyCaC3i0VvMgSoEq/SSSYfmZjwNLmDHJ40iSYUPif1H2AoUrBdyUSo1ZQjzftgFmFtpOQ1W1
cpyHU7BJqQoSCo1dOSfBz1hYxbtANiLLhbUrFMBJWGk7xY+5D9ZP3ZzzKeJDcrChQBDfIo1A
xLjrohsoiHwBjkzaf0SpCnUJvkMvcjgqilr7zdnPNSM=

--dhb633nmc6gndh5y--

