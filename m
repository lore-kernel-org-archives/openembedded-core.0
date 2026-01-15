Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B44D44C67
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 15:21:04 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38282.1768490461917518857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 07:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=CKoWp5IA;
 spf=pass (domain: est.tech, ip: 52.101.69.54, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozk0P3keINp7WApyT0VMx/VthW4QpgOBESo/iz+vDUbh1crkk1419XADzdYQFyBYWw3mZlXQoeMGXMboRVJ4RA2PYwPU1blMXljovhAm5QuXN/U2VP3ShiVydbkFcSY5vjMeelk/bAr/5jKJOnaXFJBno2HmpgwDBKGib5fBd/qmqVHvvAy+V2PHCBXozz1bTKvvcC1AuCIonhD7GRu248CftnHEVr3cAXoPnMLnktmehWqReaZyzqVkrM/7LqD9eawcrbhXclokIooqZ/4gTkEdWvCaFeM2tRWWqLG7wRRrBzMlGwOo2bY9DQqys4Zm+01BNs0f1xrMhYbF5ULgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft0WjQIpK12yhuluUXuyMJYtEqlrSY0GVu8puJjOWBc=;
 b=qKaZFX5VECTmiPIDT1Cz+v7grqZn7mE1TAukZlrwmosW9OE5foSVBiXDW1ncWbWy14qSLFnVhJGO1UoS9UL9pmNlLSEDHeLNB0vX9zhJsYj3NWfJ6rBjXobEgCPs1+GKxWvUaHROir5N5PYmt8sXn1kMpxnSTW6hiYxV+2aww8cvXxTDWD0hfW1m/98XJp4pT3Kro+kg6NzbQzQ0YF9rUWysyKaT75EPn7RPkZK8ihJEgEVg8cVQWjkeFjSta5xC7lxbBSO8tFAWss2Y1dU8ekze4nbA/5sjouaZrs4U4M/v8MthXqxJyThb4734DQcCCyXfvPclDT1D+skLNi+XEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft0WjQIpK12yhuluUXuyMJYtEqlrSY0GVu8puJjOWBc=;
 b=CKoWp5IAlvqOctHZFZvFWsJqOfUd6WCL2trKQY4KdccxQDRrG/7ZYoRXrQCqOk27pdXyJFwwMUjM00Ojio7CuDyuTufMai8PD1OE05hRjkl1GOqLbGOVVHV4AAn90mldV55XZ4DvUWdEtWaOdXgSLD16ed62TJYYfprUt1EK88MczMfypIbsw+WyzEr9rCMJRCSxhFL5jHxpOpHrcJNg68zlT+13jyhKlT9JVnI6Rh1csXlLB3xzkW8KSIquZ87z+Gpd34aiC9k2LwEQ+EdIUh1+jqkRzwdu394/TMFXpF1SrKuvb0UbYut+EhEcr8tLm4AWDm7/oqGcJi1GtcKRXQ==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DU0P189MB2498.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:424::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:20:57 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 15:20:57 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] grub: fix CVE-2025-54771
Thread-Topic: [OE-core] [PATCH] grub: fix CVE-2025-54771
Thread-Index: AQHcgIO69c4Hscy0Wk6qMlaRWiTlDbVS78eAgABzIUk=
Date: Thu, 15 Jan 2026 15:20:57 +0000
Message-ID: 
 <AMBP189MB3196B414593E6411CDD53C1FF88CA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260108094644.12175-1-amaury.couderc@est.tech>
 <IA4PR11MB9420116AE74A162A6B7475FFB88CA@IA4PR11MB9420.namprd11.prod.outlook.com>
In-Reply-To: 
 <IA4PR11MB9420116AE74A162A6B7475FFB88CA@IA4PR11MB9420.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|DU0P189MB2498:EE_
x-ms-office365-filtering-correlation-id: 1886cafb-1aa3-4611-01f5-08de5449aeb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hETAZwTJG3f8bW2H81ebo73xqyyeL7WoVi1ylBDoYVNDsHZYdIxzGDWx2DKi?=
 =?us-ascii?Q?Ksxe1mdtrSKOyHXhHxjQYPhPo0lZJ/a+AI+WPQ49uwzlY/PL4NcjyM1nRimp?=
 =?us-ascii?Q?Hsp5cmptXLrF6YTIEOi+fxZSaQQUDPzqFKUk/XmH+jVtg8yGEgPI1fN2ETDJ?=
 =?us-ascii?Q?4aSDUFJrVxHrXUjdXHivJwck2NuD86VYyAeLAJUgMMTm6bmEXLyLlXVL7PUX?=
 =?us-ascii?Q?j4EiZggGrzt3zxgTvdZmhQ28WeJRc/ubZgIuLIuTqnf6u8Q2b5acskXXxSIE?=
 =?us-ascii?Q?6+0oD5zecrpK8LjXfeQMngwGH1lxIvdQwS3sqj1kh3EWBsOTarl+xYjfoRRT?=
 =?us-ascii?Q?pkZYEBTFZvviCHPh05SkBpFWz8Pc8S5vOPKnGETpsJNy3SH3mozqBr03Sm9t?=
 =?us-ascii?Q?jFzM7/TOFPUQzvw3H3MH4Z53aS81aYuprw7vutMjYgQX4eaNkRLwzVCe5G3J?=
 =?us-ascii?Q?67O5cUOamivqAoH/uqT/1ZhIAcdce4dAG6s8VD4tjox6JjG0joII5jL5isLV?=
 =?us-ascii?Q?HxDpEL0dC+kUS8/RYWwUq0DTFisKG45/497n1itA2DdM9HFY5wlzUhb6wlAM?=
 =?us-ascii?Q?YrdfKS2haIEIAcG8NrZUV7+g6UhUwrwd+pYdcQGNsH6Ls8F8aHZo6sM+0R0Z?=
 =?us-ascii?Q?ZaOhULWAGMIozgPwbrUZT0ckdhk+gDbHqoUM1jyY3gXsmmB6yE+Qd14GHkLS?=
 =?us-ascii?Q?zx6RVZhoS58dSrMaP8hFhtqowfM6aTF7oU1J/6BWNXNUzbGj5ct4qyYR6z8B?=
 =?us-ascii?Q?t5UuJ5kCD1knpAnNxtkSsjlfFdf6KZTF9oatMXt85VE9uTQng6pzuRtqQE1o?=
 =?us-ascii?Q?o1qRD8TZmpsApQE/FwLHuDB1g+cA9bqpf/SxDaMTQmzPJ1udLIdx7qP6nZOr?=
 =?us-ascii?Q?6C1CybXN6kLCUueXT2lcQeyWEYhs8im0L/ptOlCaEbKZHlVVHNuSuH3hoZKz?=
 =?us-ascii?Q?oFmcin57wagcjDBs+o9l7OZmolT/iX02E9XnSC5HVvvBrhjrZbaJJ3/IWrlB?=
 =?us-ascii?Q?abmmHVkqEx187XM0HJFU4VrDBv1BMTBD2KHA9ElpaEl7YhcQ4BmnFpyV84TF?=
 =?us-ascii?Q?uaC+P+SgqTYEyy1rlSp6T0Qc6lyZrgK6ga+Qrtzy117X5KP9lTazJSPBnRbJ?=
 =?us-ascii?Q?2IKIN5yUSk9grkafVMLB+G0Xy9q4ClCpiwo7DlAto577gA8eappa9hvsNlDn?=
 =?us-ascii?Q?2tXhMTpJ7f78E7PqYyaeaEGxY3P2wlV/kOKiZaXAyC7xcRiwRATufIOPIop8?=
 =?us-ascii?Q?hfltPkOU3ohHR7hLSB9cConLMshiHHkve0/eH6m4+72u7k2ieUmgHErrzqSf?=
 =?us-ascii?Q?BhYpP/gPR5Eayj7Vaw3j/4UJJ7Q39Roxt982GA4+FH5V9LWxrFY2nHK0MSMj?=
 =?us-ascii?Q?G8kCHJs50Xrrj+lsHSzw59MhDpcPc0kQ7r6WP8CqlfWXfAFEyszo+95xhxnH?=
 =?us-ascii?Q?uY+k0Vpd406281f7jeLGFi8l4tqfpuBtBrh76LUVipyPOkrZeyUNs2ZbUrbV?=
 =?us-ascii?Q?bIJB09QlJNtue4vHMaNqkdjUDyrYaD/IvPcJhqhgoYaoqueIYbjThPQT6zr0?=
 =?us-ascii?Q?l2zKZL0eQn8pfAGZs1vDwORfIFwkvuKjo8+hFSgg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fZjtBM/x4tCBIW+jRWW64j/lpsQtmnYCzABOHqZpW6dgjgyJHluW/whLEpPm?=
 =?us-ascii?Q?2gqfjR4UwuGW4rSgwwnRDQi32b97CTWE750SeBVNZFZoxtHdrOV1Y8oyDgU5?=
 =?us-ascii?Q?tsQTHepyBR/fvvIvfc9HlQx8OX/oisTGs9ABYyRxRMGviiTGuoDzngZDRiIV?=
 =?us-ascii?Q?z0QADqsPPGWPYEvYKWaymp14cagYyfROjPx7ogNodjlU0YAgbkj3ZbIG5LeO?=
 =?us-ascii?Q?CR1WlKrmTPKn8aZBKIADAbFy1OWiYOrET0cmwIpdSbwc7lt0Wq3kH7mItpuC?=
 =?us-ascii?Q?rzut1XDyQsmIQFS08MyFVKoX/5mmm4XXEUwxfcC5X2pCRaiOR1TVCookMQoE?=
 =?us-ascii?Q?nuUQZhFdLA5X4mZAt8whbKlCRnOsWzHmZNzgQ3KPZh2AI4iL6vwgLFrj30jE?=
 =?us-ascii?Q?RQDR0LvbkGmSk5es4G2LK8Tlr4QBOlWMrUSpoGVH6utYzlYN9Z+LQW/Ne26d?=
 =?us-ascii?Q?o3klkGHHMfGKE0Aofk2F0ln5yCC0u3wC0YfSjI9l0ssM+zsUR2wZ74Y5rpVD?=
 =?us-ascii?Q?zuzkQUWRaqNu2N0ZOJOIh9+96pnPtGLidy03sqzZvtVc3NtknwLkxvqTpO8c?=
 =?us-ascii?Q?5JiuvKziKBwzWDW2vKjJczMs7QoA9I8uaIlQAe9ezeO97mpOoNebI8HPEqo9?=
 =?us-ascii?Q?8zEEMs+wKFkOGZNDYT6G8lWDiw//V9RsJqYFuPq3WHblkxM5Hj4BPH+AE9IN?=
 =?us-ascii?Q?rdr5NLnp64GnhMKjlJDzJUOGDiWaquEczqIOq0zZdQn879Z+S0j6CpU0r49T?=
 =?us-ascii?Q?6vqhEdEG03rNhDCBoAddA4CZWpd+jCGnMN8Ho7fGKCCQLh+SZhzeU28oottU?=
 =?us-ascii?Q?vN3dYdRESvzf7+JY4L+cuZvEuCN1IacBGePTZ2JWd9ak/kwUxayIpQdYnFEA?=
 =?us-ascii?Q?Pcfq9Ujb85yz287SPaDfjNskOcBon0sPovcwlpC5Q+/Do+nz4s2KtOhdqLcE?=
 =?us-ascii?Q?IdzREMQNaeVquM74KQeNjFPq+ExDkCutuuFBXyU9fw351y0CWn6q4/CR09QC?=
 =?us-ascii?Q?rtkoMKBMrXuncCzEoIOELTq0DJC83mTZJx8vzgR/aYwHcG30jktldpe+RPrf?=
 =?us-ascii?Q?UFP7H27E+Vpe8bglw2kbUi8cEELQcnkw//9BLeBgxAb1M6+T4qYLbrFkPweW?=
 =?us-ascii?Q?Nap44mDLo7yjwER3qmJMxMi4tqlGOMyuyGg6uFIBACg6DYjZl2o5V581FBG6?=
 =?us-ascii?Q?NJWLUSxUbivQip/gG6kbsvD3ChA41U2jg5BfMjbx7istdpX0YSpEFhHQe0Gs?=
 =?us-ascii?Q?GeKCTVzA02yGDrPoS1CXilp9zTHNgGzfFDBd7n93P30Rj0gORX1au/PI96WQ?=
 =?us-ascii?Q?PMRxr2IldmP0zPqwVVBjljh9k1+hFm7TOEFMC2o59sHRhS4kV/zmIsoG95uK?=
 =?us-ascii?Q?3Gjrn+EcMQI8VAb3j66deL6lLooP02hbaB4MFoldiahHiAGjcrGH5+2rqrIN?=
 =?us-ascii?Q?gkx/mPJ0E6dTHl+ga0Rr8DGZB+nKqBrIGirNBXx8Wvg2KJQlDpJ4dmT8ChBC?=
 =?us-ascii?Q?KRymTUfRF/W8J79gcZJyYrc6uAFJgV8CWttQjampsAxvW0XY7kmQWMFS0+Ux?=
 =?us-ascii?Q?ZYX11VYv9dSFFi009+G2gWjckNOFUJFgJPVg1oUi+CvcrBkkppujiXe4XJfm?=
 =?us-ascii?Q?woUT4Wsr6JObt7CezMVGFXkKiGGchngwh3dvg//KxEn4glhHSCT2qXIu0Tu5?=
 =?us-ascii?Q?J/6RyQNFqMzdA6Hqq98T1FTnUabAL6P+4TzVUYsL3lgnoYgP?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB3196B414593E6411CDD53C1FF88CAAMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1886cafb-1aa3-4611-01f5-08de5449aeb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 15:20:57.3518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3TOCkaF43bH2txn/MBpUXKXOzT3y7VPvQthOxRTBwH0z9d1f1PraTRsxnO8PY8VfqJBbh9mTCrP8K9lciG99XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 15:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229417

--_000_AMBP189MB3196B414593E6411CDD53C1FF88CAAMBP189MB3196EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

According to the metadata of CVE-2025-54771, the known affected versions in=
cluded grub-2.12 (link<https://github.com/CVEProject/cvelistV5/blob/main/cv=
es/2025/54xxx/CVE-2025-54771.json>) , but we did not check for the actual f=
irst implementation of the feature that generated the CVE. Thanks for your =
input.

Kind Regards,

Amaury
________________________________
From: Song, Jiaying (CN) <Jiaying.Song.CN@windriver.com>
Sent: Thursday, January 15, 2026 9:24 AM
To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] grub: fix CVE-2025-54771

Hi,

Based on the upstream analysis and the fix commit:
https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dgrub.git;a=3Dcommitdiff;h=
=3Dc4fb4cbc941981894a00ba8e75d634a41967a27f;hp=3Dcc9d621dd06bfa12eac511b37b=
4ceda5bd2f8246

This issue was introduced by commit 16f196874
("kern/file: Implement filesystem reference counting"), as clearly stated
in the Fixes tag of the upstream patch.

According to the upstream history, commit 16f196874 is only present startin=
g
from grub-2.14-rc1. The currently used grub-2.12 version does not include
this change.

Therefore, grub-2.12 is not affected by CVE-2025-54771, and the proposed
patch is not applicable to this version.

Best regards,
Jiaying
-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of amaury.couderc via lists.openembedded.org
Sent: Thursday, January 8, 2026 5:43 PM
To: openembedded-core@lists.openembedded.org
Cc: Amaury Couderc <amaury.couderc@est.tech>
Subject: [OE-core] [PATCH] grub: fix CVE-2025-54771

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../grub/files/CVE-2025-54771.patch           | 65 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54771.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54771.patch b/meta/recipe=
s-bsp/grub/files/CVE-2025-54771.patch
new file mode 100644
index 0000000000..02beca45ad
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-54771.patch
@@ -0,0 +1,65 @@
+From d1553f532f6796578dc10809e3abc751c4e2d90f Mon Sep 17 00:00:00 2001
+From: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Date: Wed, 7 Jan 2026 11:04:38 +0100
+Subject: [PATCH] kern/file: Call grub_dl_unref() after fs->fs_close()
+
+With commit 16f196874 (kern/file: Implement filesystem reference
+counting) files hold a reference to their file systems.
+
+When closing a file in grub_file_close() we should not expect
+file->fs to stay valid after calling grub_dl_unref() on file->fs->mod.
+So, grub_dl_unref() should be called after file->fs->fs_close().
+
+Fixes: CVE-2025-54771
+Fixes: 16f196874 (kern/file: Implement filesystem reference counting)
+
+CVE-2025-54771
+
+Upstream-Status: Backport
+[https://www.openwall.com/lists/oss-security/2025/11/18/]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ grub-core/kern/file.c | 3 +++
+ include/grub/fs.h     | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/grub-core/kern/file.c b/grub-core/kern/file.c index
+750177248..81600527d 100644
+--- a/grub-core/kern/file.c
++++ b/grub-core/kern/file.c
+@@ -197,6 +197,9 @@ grub_file_close (grub_file_t file)
+   if (file->fs->fs_close)
+     (file->fs->fs_close) (file);
+
++  if (file->fs->mod)
++    grub_dl_unref (file->fs->mod);
++
+   if (file->device)
+     grub_device_close (file->device);
+   grub_free (file->name);
+diff --git a/include/grub/fs.h b/include/grub/fs.h index
+026bc3bb8..d37f38e91 100644
+--- a/include/grub/fs.h
++++ b/include/grub/fs.h
+@@ -23,6 +23,7 @@
+ #include <grub/device.h>
+ #include <grub/symbol.h>
+ #include <grub/types.h>
++#include <grub/dl.h>
+
+ #include <grub/list.h>
+ /* For embedding types.  */
+@@ -54,6 +55,9 @@ struct grub_fs
+   struct grub_fs *next;
+   struct grub_fs **prev;
+
++  /* My module */
++  grub_dl_t mod;
++
+   /* My name.  */
+   const char *name;
+
+--
+2.43.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc index 3160708113..876536e42b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-61661.patch \
            file://CVE-2025-61662.patch \
            file://CVE-2025-61663_61664.patch \
+           file://CVE-2025-54771.patch \
 "

 SRC_URI[sha256sum] =3D "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2=
b6f56154cb9c91"
--
2.52.0


--_000_AMBP189MB3196B414593E6411CDD53C1FF88CAAMBP189MB3196EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
According to the metadata of CVE-2025-54771, the known affected versions in=
cluded grub-2.12 (<a title=3D"https://github.com/CVEProject/cvelistV5/blob/=
main/cves/2025/54xxx/CVE-2025-54771.json" href=3D"https://github.com/CVEPro=
ject/cvelistV5/blob/main/cves/2025/54xxx/CVE-2025-54771.json">link</a>)
 , but we did not check for the actual first implementation of the feature =
that generated the CVE. Thanks for your input.</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Kind Regards,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Amaury</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Song, Jiaying (CN) &l=
t;Jiaying.Song.CN@windriver.com&gt;<br>
<b>Sent:</b> Thursday, January 15, 2026 9:24 AM<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> RE: [OE-core] [PATCH] grub: fix CVE-2025-54771</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
Based on the upstream analysis and the fix commit:<br>
<a href=3D"https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dgrub.git;a=3Dcom=
mitdiff;h=3Dc4fb4cbc941981894a00ba8e75d634a41967a27f;hp=3Dcc9d621dd06bfa12e=
ac511b37b4ceda5bd2f8246">https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dgr=
ub.git;a=3Dcommitdiff;h=3Dc4fb4cbc941981894a00ba8e75d634a41967a27f;hp=3Dcc9=
d621dd06bfa12eac511b37b4ceda5bd2f8246</a><br>
<br>
This issue was introduced by commit 16f196874<br>
(&quot;kern/file: Implement filesystem reference counting&quot;), as clearl=
y stated<br>
in the Fixes tag of the upstream patch.<br>
<br>
According to the upstream history, commit 16f196874 is only present startin=
g<br>
from grub-2.14-rc1. The currently used grub-2.12 version does not include<b=
r>
this change.<br>
<br>
Therefore, grub-2.12 is not affected by CVE-2025-54771, and the proposed<br=
>
patch is not applicable to this version.<br>
<br>
Best regards,<br>
Jiaying<br>
-----Original Message-----<br>
From: openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.=
openembedded.org&gt; On Behalf Of amaury.couderc via lists.openembedded.org=
<br>
Sent: Thursday, January 8, 2026 5:43 PM<br>
To: openembedded-core@lists.openembedded.org<br>
Cc: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
Subject: [OE-core] [PATCH] grub: fix CVE-2025-54771<br>
<br>
CAUTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
<br>
Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
---<br>
&nbsp;.../grub/files/CVE-2025-54771.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 65 +++++++++++++++++++<br>
&nbsp;meta/recipes-bsp/grub/grub2.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 66 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54771.patch<b=
r>
<br>
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54771.patch b/meta/recipe=
s-bsp/grub/files/CVE-2025-54771.patch<br>
new file mode 100644<br>
index 0000000000..02beca45ad<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/grub/files/CVE-2025-54771.patch<br>
@@ -0,0 +1,65 @@<br>
+From d1553f532f6796578dc10809e3abc751c4e2d90f Mon Sep 17 00:00:00 2001<br>
+From: Thomas Frauendorfer | Miray Software &lt;tf@miray.de&gt;<br>
+Date: Wed, 7 Jan 2026 11:04:38 +0100<br>
+Subject: [PATCH] kern/file: Call grub_dl_unref() after fs-&gt;fs_close()<b=
r>
+<br>
+With commit 16f196874 (kern/file: Implement filesystem reference<br>
+counting) files hold a reference to their file systems.<br>
+<br>
+When closing a file in grub_file_close() we should not expect<br>
+file-&gt;fs to stay valid after calling grub_dl_unref() on file-&gt;fs-&gt=
;mod.<br>
+So, grub_dl_unref() should be called after file-&gt;fs-&gt;fs_close().<br>
+<br>
+Fixes: CVE-2025-54771<br>
+Fixes: 16f196874 (kern/file: Implement filesystem reference counting)<br>
+<br>
+CVE-2025-54771<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://www.openwall.com/lists/oss-security/2025/11/18/">https=
://www.openwall.com/lists/oss-security/2025/11/18/</a>]<br>
+<br>
+Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
+---<br>
+ grub-core/kern/file.c | 3 +++<br>
+ include/grub/fs.h&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++++<br>
+ 2 files changed, 7 insertions(+)<br>
+<br>
+diff --git a/grub-core/kern/file.c b/grub-core/kern/file.c index <br>
+750177248..81600527d 100644<br>
+--- a/grub-core/kern/file.c<br>
++++ b/grub-core/kern/file.c<br>
+@@ -197,6 +197,9 @@ grub_file_close (grub_file_t file)<br>
+&nbsp;&nbsp; if (file-&gt;fs-&gt;fs_close)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; (file-&gt;fs-&gt;fs_close) (file);<br>
+<br>
++&nbsp; if (file-&gt;fs-&gt;mod)<br>
++&nbsp;&nbsp;&nbsp; grub_dl_unref (file-&gt;fs-&gt;mod);<br>
++<br>
+&nbsp;&nbsp; if (file-&gt;device)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; grub_device_close (file-&gt;device);<br>
+&nbsp;&nbsp; grub_free (file-&gt;name);<br>
+diff --git a/include/grub/fs.h b/include/grub/fs.h index <br>
+026bc3bb8..d37f38e91 100644<br>
+--- a/include/grub/fs.h<br>
++++ b/include/grub/fs.h<br>
+@@ -23,6 +23,7 @@<br>
+ #include &lt;grub/device.h&gt;<br>
+ #include &lt;grub/symbol.h&gt;<br>
+ #include &lt;grub/types.h&gt;<br>
++#include &lt;grub/dl.h&gt;<br>
+<br>
+ #include &lt;grub/list.h&gt;<br>
+ /* For embedding types.&nbsp; */<br>
+@@ -54,6 +55,9 @@ struct grub_fs<br>
+&nbsp;&nbsp; struct grub_fs *next;<br>
+&nbsp;&nbsp; struct grub_fs **prev;<br>
+<br>
++&nbsp; /* My module */<br>
++&nbsp; grub_dl_t mod;<br>
++<br>
+&nbsp;&nbsp; /* My name.&nbsp; */<br>
+&nbsp;&nbsp; const char *name;<br>
+<br>
+--<br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc index 3160708113..876536e42b 100644<br>
--- a/meta/recipes-bsp/grub/grub2.inc<br>
+++ b/meta/recipes-bsp/grub/grub2.inc<br>
@@ -42,6 +42,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/grub/grub-${PV}.tar.gz \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-61661.patch">file://CVE-2025-61661.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-61662.patch">file://CVE-2025-61662.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-61663_61664.patch">file://CVE-2025-61663_61664.patch</a=
> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2025-54771.patch">file://CVE-2025-54771.patch</a> \<br>
&nbsp;&quot;<br>
<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;b30919fa5be280417c17ac561bb1650f60cfb80c=
c6237fa1e2b6f56154cb9c91&quot;<br>
--<br>
2.52.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AMBP189MB3196B414593E6411CDD53C1FF88CAAMBP189MB3196EURP_--

