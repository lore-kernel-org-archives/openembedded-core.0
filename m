Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDDAC5DF9D
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 17:52:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1192.1787421126431531265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 10:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HEIlQT1S;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCHkYqu0VYm7yv5q2bJ9dgclG/3ZoHJqIbYii3SW+WUXhUjCBZWd+KJ3KVJVGo06pUBBjDaM1WTN7xyTTL7WYhbZqXeEN1f++PWbyK6PQxc2TfbYrasfyWYOJQpWuiwGkmIE2tEN6fee7qkxCxeUUHjb9w621HX69bWndhqdCFbioyQu066g1AEqbN5LOuBgPt/+ZScHPd5/9igZkX3UweQcIHoDZ0xEEkZqV4SuQf6ofznPVjbHsG4rbLOEBv9z3Q93KSlBJteMDIk7HXeMrz+oM1ufjr+Z+hz4EaHdhMj8gJDG3YfJYRhXSuk5ua0Lt/PfAEKr0qNWD0u2yq5ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDstkSyaRAp82MD8YJlPHeWJbvLXHskZtisQzbw1Po4=;
 b=FlJKOnKNrBzjG09iYwpJDv4lv3iQ2YmoqkG60gBp8vXjT0EaSYOs1L7YD+j3OfosWe7A+kSEJDMZGs1slyy705t0QDewPjW7ayVtP8Veyf+fZ9blK/N1STcRepnafDAN2i4vbMsPkWt+HmPMmOpHTktQ+hwPD/C0HaFVcyDDWvNRtqKHvYI8NSufypi+Fpc6A2ZQPxY38Qh7Vom9UhnUCI5L9IWGyEQYEvfOY7RSs4nzb2I915wGhdvP31ibR+fgFtwFcMoI6vYarKE4vIeRHWRFEX+esQmSFSWorBQJY/aH2jLpP62zl0N5mG9VQlvCB8BvsFQHgEZQj3zNSzuflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDstkSyaRAp82MD8YJlPHeWJbvLXHskZtisQzbw1Po4=;
 b=HEIlQT1SBZW7GpkqlIBcp++3WT6F0GVQ1WuDYQJUG31TTjranETiXARV6/LbLr2XPBoKLydpU20s87UcxvOmjdAgeeA9KvYEFPL+lhjbYsGki17sOnKKYFdhAMjCHSIKlIH7xitdtujB787mEfPJWneUQiL0JXoJ13/55F8vO9OSaZNC5LMbq2H5yU8hxsQ+k57ZektyvIeKG/6rWa2CVmzZnz+AoZ+xQatpTT/yWlChek6hdXiVXG9LflQIH6xYckLkqOGO28aR0svfcS1gqvnWDwpQLRBqpLh0DBJsSrVfAEW85NSiZxWO19Q7K5f1kStq6eYPGK4SqzDMRLUGwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 17:52:01 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 17:52:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v4 0/6] openssl: upgrade 3.5.7 -> 4.0.1
Date: Sat, 22 Aug 2026 19:51:54 +0200
Message-ID: <20260822175200.57534-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: dc40a86d-d3ca-4dcc-ae33-08df007611d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	84R8Al9WsVlslsjTAkhn9q+BT1JXi6wSmijxiXknHq3aXK2KGA7fR9oMMgYnmDCsJttArHeXL5OIM73ygXbG0C5KGD6jWjOc+z890LtxHGI43IJdP7ZO7Y5nJexydNXVoWFXzrM3WhO8U9DuPTZ/WiKwl4f43SM9/U+SGZWvxSXC4Otk4RweXAfw3Rxb0knXhOyuyyC2hSNGjKlrIoFi8wlq72UU4/up1lwA1hrDBDpWdH1Ud1vr+C/2bpHUVS2jNlSiUwX8+2mh/ts+VsdtIimndqu+jl4M0mNO+eQVPRu07dA3K5BXp2R2J7qxQHleHSrQPVWPltwf97N3wokQWfkpg/1mUvN62q9TRniD0vNgRXjVRJ5aFLtgktpoT2gWbKmz4E7BSZG/hLMZWecv8xAWiAn8+7CYisOC7V24zux4gNpjoOGrBr0cH3h+6wkVPlpb/0XG9+LqFS7XILNzYkUZlldEQ+YWeqZI+EhyhWEUWUKLxAf9ProSF8oQQ0xBhKzTlBvKwcp7i42nK8qdIScja9akGYtqOL8IKSz43a8haN3g7B+YHvlHBhalNzp6oHfUiF5LJk1cABvNT6HGzsNwiDLr3uWN7aDJ/ZREELmxNydpproypzQAdWNP1oDEZevj+uWY8suXD6pO76MxPcV9K9N+tJJQ8e3Bo+llSb8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FvTbqWAXvfb6IMtKmJ5rqfDV4j8Ou0ofklIF+cQ2e7RRZD9W5Hm9t0tgpD38?=
 =?us-ascii?Q?XDrpKIGMwPqmoW6ptROmMeqgHlJsQC23zAY5a1KXOR5j0Kx5Z1kVsIQ1UGJn?=
 =?us-ascii?Q?kRHnRZi8hseYUlxNzYiDiNF6Tf6ll+XKkSq5UiTMycoLohT4ANFdfmwynv6n?=
 =?us-ascii?Q?ZnORMqEyMOnkvyGhWubpjYHDoejIvSbpDOzBG1ilympMjHDd4dI4ohfw8L+W?=
 =?us-ascii?Q?GBiAQbG9qhE1OFAq3P4FMtThXj/jLOTD1wI3QmQXndwkqAUME/hjKss6OQwY?=
 =?us-ascii?Q?z7EltRByR/nEvLAMPqmJ8TTapf8pkGoRVkvEp6D4uF5zJkFqFbN7C/9+9kTY?=
 =?us-ascii?Q?+HrZ5QnEndkeboQrl3jJoIWGXNE4OA4GGv96NZ0T0QpefDrGQjUzR9UzyzqY?=
 =?us-ascii?Q?QmrkyS6cmS1K6/fEYOJBG3wGDGgfhpfyPtR9lJs/VtR5Y492aomnkIY+X5cE?=
 =?us-ascii?Q?wpfFibcj1teUYMMGDJ7AZBHDw+o62eAeKCOD4d7yOYMhNnNGuOic8R4hQqCE?=
 =?us-ascii?Q?O2u6uqORZNm1j4ihODXrHf037d50mGxy6KUmdAjorsaWIHNohsjDpWaSQSmy?=
 =?us-ascii?Q?bkBWgbZrjpmKlwr/Wg/kAIyUQGu48yQLsEWfJGGEiZPE0RmjT/wttRw7V9US?=
 =?us-ascii?Q?+YpCK+bH0ZwGWUlHyv59lLbH3qcXLhQuqZrl9bdXies6NiJtYEoUxX+xT0Em?=
 =?us-ascii?Q?q3lB5wPUGoOL6I/w/USMOGf1sg0ami+vtxmV3ltKNseF2M/3N2k32CEV2Kre?=
 =?us-ascii?Q?oh/SAxBYWax3C8/9ZY8RaeEWeu6kbJgqR+i7UdDx+GpBu6Yt/JeP8kG1IdCK?=
 =?us-ascii?Q?MmeV6WVNhVZfTLGM8MQLbBXkINIhx46aAUjFbiM528aeg1yRu8G7d7sF1qYO?=
 =?us-ascii?Q?S9mtY6BnY/+eeaIHFJlUSluRnmyALu/0xQ05UPZSU4Q5ko1JV0oRAka4nvtL?=
 =?us-ascii?Q?e5/yu5cEd18opg1BBu8YRTeUcef0kWHAZxl0lgOcGinWA/q2A5m2HVjx92KH?=
 =?us-ascii?Q?ZwsVyHGhEd5s30d9SRRCcZWjNBRnwrZsMjxHyUTjNSXJ8lOSRBoVc/IJMEP8?=
 =?us-ascii?Q?VyrVbZX9ce1FGWvetvG0vItvpeMaivgQeHzaxm8icoL2b5Le5auIH6ygCwbZ?=
 =?us-ascii?Q?uwWSRQe1HJ6wyHIC85bTTX/JzYFdfnlnyvi1SrIRI8medR5eOpZGltDHh4hF?=
 =?us-ascii?Q?EFZhY+MyYOzeoLY3QL6JO8hBCUOhNiHA6C6suo7NRnleJEPTp5Pl5tOjbYeW?=
 =?us-ascii?Q?ekQC8Ago4YspmLUdBGE4FFC6HYm3a+r+3ZMSUCFLkfqkSAs4WRFEeZUKtvMD?=
 =?us-ascii?Q?cfVfx+qvgtgKm/lvBxgKDVq9VHq//DR0zuYCyct5zCibPtuO+Vzkko3z1FVW?=
 =?us-ascii?Q?fs7/rvzbh2EHi7j8rFQMToBKVYuzT+yR6oqv3b9vRPT2uS4g/lhWpFyQPcCp?=
 =?us-ascii?Q?vitGRsC4CK+Ug6bZ+hnk9v4mxzGiF5/BAGje+uhloBLbHaFMmzblJehq90Zi?=
 =?us-ascii?Q?JF0u3inmB4NuJ+U/f7NXB3dxczwGdVGQR384j4tdxlNDAUR6LHhPrHjD5xDy?=
 =?us-ascii?Q?SvjLcSQj4Ka3Cj1OXPSRA3GMOJmqBNRJAkxyeLtHhzo/C8s87SsP0j3kTkjC?=
 =?us-ascii?Q?4yaK4ls8+JlW8n1z7TxwUGAvzIKOdeuEuPagj9YQ0YoPat8XNXhlAZnIn2+z?=
 =?us-ascii?Q?NgKGvR+nIhSdJeobECueGj0ghgQSKliCvLoKffDSvgxFDy2koFg5u/APIImv?=
 =?us-ascii?Q?5gtr8oJ/XphBl1G9wwdbqDWMBYtHq30jc1l8LJ5J/e9vYdEh4IdHgY6XFEx2?=
X-MS-Exchange-AntiSpam-MessageData-1: +cO7pyJtwxFxaOFbHeclVvhkR9EiIwsQItA=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dc40a86d-d3ca-4dcc-ae33-08df007611d0
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 17:52:01.6424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOVGVZL+RGkH+gQ8azlsmkmj0xtFg4/ffDL7b8ZxLpvFNzvGJNm2SHTk0bU8oN/Y6bkGCXKvbSRPxbE5zSlEpghEBd4AecTtLIyl4ljdqf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 17:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243992

Upgrade OpenSSL from 3.5.7 to 4.0.1 and fix all dependent recipe
breakages in oe-core.

OpenSSL 4.0 is a major version bump that removes the ENGINE API,
removes the c_rehash script, makes ASN1_STRING fully opaque, adds
const qualifiers to X509 accessor return types, and removes
per-version TLS method functions.

This series fixes python3, socat, serf, u-boot, and kea to build
against OpenSSL 4.0.

Changes since v3:
  - u-boot: fix malformed patch (hunk line count mismatch from pkcs11
    modification). Regenerated patch properly.

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
  - python3 test_https/test_https_sni: passes locally
  - u-boot fitimage signing: passes locally
  - bitbake world -k with meta-oe/meta-networking/meta-python/meta-perl:
    oe-core recipes all build. meta-oe breakages are in their layer.

Known breakages in meta-openembedded (not addressed here):
  - freediameter: RDEPENDS on removed openssl-engines package
  - pkcs11-helper, krb5, libcoap, grpc, libnet-ssleay-perl, libesmtp,
    unbound, wvstreams: various OpenSSL 4.0 API incompatibilities

Notes on upstream status:
  - python3: CPython PR #149783 deferred until after Python 3.15.1
  - socat: submitted to socat@dest-unreach.org
  - serf: fix in trunk (r1935023), no release yet
  - u-boot: v4 on ML under review
  - kea: tracked as issue #4673

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


