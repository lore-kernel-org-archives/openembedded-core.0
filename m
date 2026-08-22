Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB75C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:32:03 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7570.1787409121804302606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ARqFla7c;
 spf=pass (domain: est.tech, ip: 40.107.130.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjiSYrxZcrhUpETJjj7SBQNvkAYEvGQYgL1fsLFdQ0H1ygixC8mSMuwe0YFR6XBCl4kQopJnKGpJTS9WFRzIE8QEAowmR3CE2kwdFJ+SAhkvxVKTEUQmG88Ae+stAlqv2rV6YgCdmnbFRVG9h6A/ASISMDraa82LMgWdoDWyYBIqPCKX14j2VnsysSDQMbortEnK3VLK0tFqSAYSoci9IfWLQ/kGeIbhBvXJ/b21Smgtaw+/WI+hPIGAo/Qt5i45Gn5g47Bfagb8L5lBtL88JTE4xHIOQ/UxCEK3ZzeSFv6TRFPtN91nL126N+wnc6tNoWpOlFnE7xWuhLpHNoDQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHIzeTOqRhztx77Zvu4jkKTdLMgg2Spmx99Bjidji88=;
 b=U/wFMDmmoVWl531ts9i4vTti5s0efCGWKuGsj/iaEtFfauWbsvzhAtBKCVkuM0R5b7XV8GT8uUKufviU43e+io9y1sRYtJ9uQ5/0JsR4xzBMwKFkJt3wPaPnKmi69mOZ/iL+2MTx4zOCIOcuw+48qig+AvlST0y/XdDQHpkAhYz4wF4uKjfAduF5zzmRN5CYOIixbiipSh2D79HQQ5xnBXPr+U9fFMuiUvetwp15iKaNKWJqeSQR4AKjQd24IqJo0WJIqEJIe+26tdOY/STl5XtBVfyPNEhQGyvk5ciF91SmI37VL+FwNskh3iBxJ2Y06ojOiv399UQTREM8fIOAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHIzeTOqRhztx77Zvu4jkKTdLMgg2Spmx99Bjidji88=;
 b=ARqFla7cO4g0tCrPNwSddv56UkiRPW4A++3q8OFF8/IOSCA1mst9ZSdyL4zumWCsfZV8LnCwJnVls59RlQ3Ka2s25szteHuacTJk37kju5v3YJoMrhJ/aJjmJxYihIVwPY1ayWVvyLV9hKkZ9h2L9KNuV/ylKXY24BOzn7iuuTYfBzamUDNY+yRtzR1+NQVZE0467FhdUoaQUtxlIWRsEREkWZRJReD1K7zlXncBbX7SW7p+PRfwbk9OAbzmIigb7KLLQt3kNBAMIvxMj8eeyAA5f8xD4ZTYH+2Q/Cq0B5z3S4ex4IQxRPDbAlccnM/zRQjgSLAG++AgRDH9Qhr3OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0917.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 14:31:57 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 14:31:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC v3 0/6] openssl: upgrade 3.5.7 -> 4.0.1
Date: Sat, 22 Aug 2026 16:31:49 +0200
Message-ID: <20260822143155.39273-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0917:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8a2f3a-3648-4ceb-308b-08df005a1e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	j5q1irN+/SfCC2133vE+ifgFB/wDULgp+Jjg4ok4sWFA1/dph2vBKiJ/T2Sx8AzHO8SOcr0gNO0QKZo6JKxktn7TztiAGqaybgYgcTSwTgonBula2/q5y5+pZ4eqUA7uflNRuLztA6JFwtq4iejWWO9a3J0luriDUs2ztV56kQ1l0xVWPYCMobG2zIPYPMPEdy9o9l4Ost41MIXflu3lRk631PfIPhMGiRLvH65xo9pVl4Zgvxy8koOBbFJKD4KAInd8sJUqNhO0/dB18asbMBobbIz4U7/D2jBQvv4wUjuDVd+XCFg2YK+9PLwqOe1t6I5L3WWaTF9bgp2In9p1bbyrVp7xMwZdBkCAnSdG+bS3H3unRS5snxbcrHHFhqLGD6y7oRJ5ygPE4Wxi2s2s5t9XrUsIDpi3YqRF9PrmJ6vFKHubzL+lLL9nafemxvFLBVdaK18o1AmAJgdDF3KdFs85u/2ktMnEQ3AMMElWPCKPpV7hIviZG9HxG3IwDvnoNfQquLAO5ySJdxTe2VkDI7RjuVkIyf4rSG1A79yfLo5UTZKZ34qrLakJ+F/2h0PiLRUt+k7FggASKJPeVnbbry8kVbEnAh7frPgGDKowd2P7jh1GT0Kin1p9fzJPZVTshoAFj3BiAZubHwKzuL8NHc6uxMXYSUPPCcDqS2bfyck=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MnJNErgAa3Lm9Lxg31t1cwwmdnA/SbTVbwEqg3ab3g29qrMbqQJDyroOz6lS?=
 =?us-ascii?Q?0smeR/z7s3ZwmjB3y2lSE9vM6ozba97rkbfmDtd764XRNhkYkTl2XUs2cW/O?=
 =?us-ascii?Q?A245wbRrIQ/9BH6x7Cbmb+Ly0twpAoFVT3teeIc8Jx2PcPPme4iXBjuTnZWB?=
 =?us-ascii?Q?XoiOzZNsrKuNR45JSZz+FmenbS/hzznKvnfKVvfjQlo86odAKKk0dDL+kAEa?=
 =?us-ascii?Q?ABUa1bUUQ5usout0+t7e5GzVFY4NBcaa9njh7AGZCb6CxK32F8VubWbtBejB?=
 =?us-ascii?Q?spWwBG4tmFzWJdvSoi6MNIoYivEYo4+ySrYPJqRaxODMb4t/FQrA+oANkNk5?=
 =?us-ascii?Q?S9fR68Nf1HIeI2pBntZaAv2Xee889K0WYpxGkq5G+yFUeK5KB4OiVypCP47l?=
 =?us-ascii?Q?ohk5TtVa1PD8RIkxY5nXvWtqnUXsYrQFYZvNYreq8x5qW0Wob9cwMfV9LL9j?=
 =?us-ascii?Q?6NIzUDCulQWyp1BL3uABdU/yxPjw/1UYtd9RK2pVeVMpDQ2WZKoGMs0xFu5e?=
 =?us-ascii?Q?oCfWcJKidqdqDgPMkIYSkxoU+E++OZR6mqW2/A0fZ5heqrM/ktSlN79r9PSO?=
 =?us-ascii?Q?76FFWLy0gVe8c5o8WQWFsoKpwIqy7bqoDHq08tIJcCahxHpbhPtywv7m3JM4?=
 =?us-ascii?Q?AcnMRGUJUNuoNd8ppf7d6wo5pdyPeW31zDF6Zr6pqXApS0e5Ms5BA/SFY9e1?=
 =?us-ascii?Q?ZGHqpjriLcCXR1qAlUIwb0AVa8OxlbisZgKGaSgjHzRbT+REge0gN484df15?=
 =?us-ascii?Q?UTeTrQtwIDWV5u7glHo+NP6IP4ORbEjvWIrpvTUMgsuXCH9JpgqDPlJBVMpV?=
 =?us-ascii?Q?4NEifahplKaX81hf024Qjo0wyqQ8AHhYXW1ggc8HJzSdlm5VTOc02Kg0OCwv?=
 =?us-ascii?Q?zgfyjffqd/4TK3CRQfoZxOqpHhbQpgVwe083EiMBw/yrFAgLW6CRJ/FNUMDQ?=
 =?us-ascii?Q?7ZeLa6eGdoX5JyQr7wP7E0e2wR1duir7yHRE/4LbaOZKLpjE3icfupvKK0PH?=
 =?us-ascii?Q?0xoGq/jYRQKunXncpLEolcyYSFytKBXv3AJNP7fplBVtGz1fJ22g2ad8zhka?=
 =?us-ascii?Q?QwHoOEn/jMxaawBjYVIXJIwatJ1p59LCC/ECr4KT55Bck2ZSp9IAQWV0HcoZ?=
 =?us-ascii?Q?/w0K2te3Z9lX7V9yLh76EVjItwEXWZzuyFo8I7cuI5WnidBCbzqnDMlFXSNp?=
 =?us-ascii?Q?32hdD2CrWATeiuDy/AyHo/n/VCphOOaAwadcmMBo021WtEe6hLoOSfMQblT7?=
 =?us-ascii?Q?QMRy01nYYHAw1GkbLOv+OybXI1oFafh20qVs9or0tc9cZc0J55Q1sC2+Z1Iy?=
 =?us-ascii?Q?GV0COzV2fpflCPfwPWYXlZeDXSGjx+BlZJKAvsba+vqoxjpjricvLT5ryFo7?=
 =?us-ascii?Q?vq7o0qwjAta3i71xVyDyUkoQSIFJkTguPGuZxPd2YOsnMxjDoqYb1nKb04ot?=
 =?us-ascii?Q?X4OtFYpnKXoLUAmLAjdTTg/e9KFQNrmwXY37UOhD0b51ABfMlyPuky5gJbaY?=
 =?us-ascii?Q?0g2wz3DL2jqqcyspLOCBaZynyt5QS8+2Fcb4aDahB37/6yjzLMDwYuM+gyj9?=
 =?us-ascii?Q?OxVm9fnxROUaKVsM/zoFwZW8xdEHb9HnvpDkSxRFlETxWSDogpsmZW7XumAj?=
 =?us-ascii?Q?7ZcDcwHuElxnACn2UTsnAQUnVfHc3GfgR78QJG6eFUlfPuSLo9dWB0HQvVZc?=
 =?us-ascii?Q?227KhTztFVU/LVb+IR3VMbPwsAWU6/Bd+02ZuPRsv7qkP9j/bCtdCrIHgN+p?=
 =?us-ascii?Q?ZRNAs4WeM3sxZc+kuHPEU2nR0Y4BFhnKHfY9de9w9AZsYSFzkBJKJ0xXAH3Z?=
X-MS-Exchange-AntiSpam-MessageData-1: inssTBApM5pv3zIeCDMZTDNUWMHupNinoUo=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8a2f3a-3648-4ceb-308b-08df005a1e92
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:31:57.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWBAA8L0mcF/XaAruVO+0OuKJxYo/TGo1n/9Y1UwH1N3QnloUTx1h6fcdw99neG0MZIQ3kq4VPfZnZLvPJAuyfDlFkqUz2CKuQDgirzxUM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243976

Upgrade OpenSSL from 3.5.7 to 4.0.1 and fix all dependent recipe
breakages in oe-core.

OpenSSL 4.0 is a major version bump that removes the ENGINE API,
removes the c_rehash script, makes ASN1_STRING fully opaque, adds
const qualifiers to X509 accessor return types, and removes
per-version TLS method functions.

This series fixes python3, socat, serf, u-boot, and kea to build
against OpenSSL 4.0.

Changes since v2:
  - openssl: remove c_rehash from MULTILIB_SCRIPTS and FILES (fixes
    multilib do_package failure)
  - python3: add backports from CPython PR #149783 for the
    got_eof_error fix (fixes test_https/test_https_sni ptest failures
    caused by OpenSSL 4.0 changing EOF signaling behavior)
  - u-boot: update Upstream-Status to lore link per reviewer feedback,
    include doc/Dockerfile hunks from upstream v4, make pkcs11
    provider loading optional (fixes fitimage signing failure when
    pkcs11-provider is not installed)

Changes since v1:
  - u-boot: move patch from u-boot-tools to u-boot-common.inc (fixes
    riscv64 build failure)
  - serf/socat: fix Upstream-Status tags

Testing:
  - lib32-openssl do_package: passes (multilib fix verified)
  - python3 test_https/test_https_sni: passes locally with got_eof_error
    backport
  - u-boot fitimage signing: passes locally with pkcs11-optional fix

Notes on upstream status:
  - python3: CPython PR #149783 (3.14 backport) closed by maintainer,
    deferred until after Python 3.15.1. Pyenv carries it downstream.
  - socat: submitted to socat@dest-unreach.org
  - serf: fix in trunk (r1935023), no release yet
  - u-boot: v4 on ML under review (changes-requested), lore link:
    https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.co=
m/
  - kea: tracked as issue #4673, milestone kea3.3.2

Jaipaul Cheernam (6):
  openssl: upgrade 3.5.7 -> 4.0.1
  python3: backport OpenSSL 4.0 support from upstream
  socat: fix build with OpenSSL 4.0
  serf: fix build with OpenSSL 4.0
  u-boot: fix build with OpenSSL 4.0
  kea: fix build with OpenSSL 4.0

 ...Add-support-for-OpenSSL-Provider-API.patch | 340 ++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
 ...-qualifiers-to-OpenSSL-X509-pointers.patch |  49 +++
 meta/recipes-connectivity/kea/kea_3.2.0.bb    |   1 +
 ...ke-history-reporting-when-test-fails.patch | 366 ------------------
 ...1-Configure-do-not-tweak-mips-cflags.patch |   6 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |  11 +-
 .../0001-extend-check_cwm-test-timeout.patch  |   4 +-
 .../{openssl_3.5.7.bb =3D> openssl_4.0.1.bb}    |  28 +-
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |  31 ++
 .../socat/socat_1.8.1.3.bb                    |   1 +
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 257 ++++++++++++
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 234 +++++++++++
 ...utdown-test-in-test_ssl.test_got_eof.patch |  41 ++
 .../recipes-devtools/python/python3_3.14.7.bb |   3 +
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |  35 ++
 meta/recipes-support/serf/serf_1.3.10.bb      |   1 +
 17 files changed, 1012 insertions(+), 397 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Add-support-for-Open=
SSL-Provider-API.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qual=
ifiers-to-OpenSSL-X509-pointers.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Added-ha=
ndshake-history-reporting-when-test-fails.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb =3D> openssl_4.=
0.1.bb} (87%)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fix-build-wi=
th-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 create mode 100644 meta/recipes-devtools/python/python3/0002-gh-148292-Upd=
ate-_ssl._SSLSocket-for-OpenSSL-4.patch
 create mode 100644 meta/recipes-devtools/python/python3/0003-gh-148292-Rem=
ove-shutdown-test-in-test_ssl.test_got_eof.patch
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch


