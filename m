Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93CCE7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 09:06:12 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.web10.9754.1733303166807072299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 01:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=bVKvuZe/;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=0613ae4ec=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1733303167; x=1764839167;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ooEZjBnFgBuQFA/6u+2SLmvWZOMmH3YG8yaOzfqcAzM=;
  b=bVKvuZe/ndF6Ykexp6k03wZhVln08XzYtykre0kyBTL//RxpZ8N7mx+X
   BGzTAm+Yxl8vA2crYNJC12lKyk15bh7mUUT7ssASNx2VZpUq4/J0APpR9
   tFNyHUFEpzMqus4IPRak+hYMk61GqiiSctpDL0U4Vuas1X5EsHvLpXgFB
   RmSh31l4xq8HqSrEpnbfWeOsp/s7yHfBth+OtQbNHS7tLrRhwFQyTWdjB
   Nz5HVFSG3e8VlHvRnQLHpPa8F2NvMa/IJBAiaAAo63znrFTQv9JXGhQpJ
   onzRuwUf8BtDvxeMTycS8HbREkZmyvH/YFWkJuM2UDD2zO/EjN5Ku4IX5
   A==;
X-CSE-ConnectionGUID: xfnOBE1URJSgCSwR4ZvTkQ==
X-CSE-MsgGUID: naPlYDzfTPGz3r1nDSAhMQ==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:UTYnLqoFKxqzqLkyKLOVGsbWCyVeBmLoZRIvgKrLsJaIsI4StFGz/
 xJOGSnaY6zbJjuqJcY+dc3tpgkBpNWMmYgyDEcu+BmBJVpRrMvACJKBcVyY00i6JMHKQBs5s
 5lBZ9PMcJk5QnKA/UnxbOTs9ickhK2BTeDyWbGfanspHQU1RH4v1Uk4xuJnjoJj0YO3DVmG5
 IL586UzVHeswyZwM2kd96OErlR3v//p53YDv1M4bOxWplK2e1w9VfrzconqfiOoKmUtIsa6W
 /rbnvb+/W7I5FEhC96llvDwdUhNSaTWehSNz3phXe6pmBwazhDeqZ3XR8fwE28PzW3hovhx1
 MlV59v3Sgo4JevAmekdV19TFCQ5NrdCv6PEZHiIt4qY1UmeLjitm51S4DoN0f4lFpxfWScWn
 cEwKCwRdkLEwP2p3/S3S+RsgoIoK8ysJIAe/SkI8d2iNhpVfHy5a/2Mvbdl4QoNauBy8df2O
 ZZEZGI1NUuQMxFGZV5KAphkxLijiymkfTRUognO/aNrujiCxwFPi7W8a9C9lv5m5yl2thvC+
 jiWrzyR7jUyboH3Je+tqyr07gP3tXqlHtpUTPvgq6YCbGS7ngQ7EAcRWUawvc63g0u/X8M3A
 0EP80LCl4BrnKCQZoe7BkfQTEKs5EZGB4MKS7FisWlh94KPi+qnLjldJtJ+QIx+3CMGbWRC/
 kOEmdrvGQtuvNW9IVqB9q2ZpC+FIiMcK2kPf0csFWPpNPG6/enfJjqWJjpSOPbdYu/dQFkc8
 BjTxMQKvIj/uOZQv0mNEfIrtBr3znTBZlZdCgw6xQtJ5CshDGKuT9TABVQ2cZ+shWtWJ7WMl
 CFspiSQ0AwBJYGDkgunbbwwJpOS6N2+LweAs0BTHKB0olxB+1b7FWxRyD17NkxmLZ5ePzTue
 leVtQJc5JsVN3yvBUN1S9vpTZRwi/GwU42+DJg4bfIXCnR1XAOK+iB1I0mLw233lEEqnYkzO
 JqbdYCnCnNy5aFPlWLuGrZCjed1rsw47WXafZTK4wap7YKxdiWPELEpC3KOS9lsuctopy2Qq
 b6zLfCi0RJES6v0fzPL9og7JEoPa3M8APjes8FLe/TFIQhrHGUsEeTNzL89U4V1nr8TneDNl
 lmnU00ey1rygFXILAyLbjZob7aHdZFnoHQ2OCYhMVql1z0oZpyixKMebIcsO74/+epuyPR5Q
 /UId4OHGPsnYi7O5TU1dYPwsoV5Mhio7T9iJAL8OH5vJdg5F0qQoYWMkhbTyRTixxGf7aMWy
 4BMHCuCKXbfb2yO1PrrVc8=
IronPort-HdrOrdr: A9a23:YdDv0qPVhLLgr8BcTuOjsMiBIKoaSvp037BL7TEWdfUxSKbo7v
 xG885x6faZslossQgb6LK90fC7MBbhHP1OkO4s1NWZPTUO0VHARL2Ki7GM/9SKIUPDH4BmuJ
 uJ6cNFebnNJGk/gfvzpDWjH81I+qjlzImYwevixzNmRQVyY6Fv6G5CajqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AuuPfS2gELejatopLXwwSxp4+9TJuYnPb6139enK?=
 =?us-ascii?q?CK11mY4aKcwOi5p9nqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARxjzTA2H/NZJHax/x+4dE7bTVDUj5a2WDHEhg5s?=
 =?us-ascii?q?6g+aWbjYpPRumpTSSe9py?=
X-IronPort-AV: E=Sophos;i="6.12,207,1728943200"; 
   d="p7s'346?scan'346,208,346";a="100597406"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: Rasmus Villemoes <ravi@prevas.dk>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: RE: [EXT] Re: [OE-core] [PATCH v2] linux-yocto: add and use
 GPL-2.0-with-syscall-note license
Date: Wed, 4 Dec 2024 10:06:04 +0100 (CET)
Message-ID: <bf5528fee82e4383ab659c8d944943fb@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----50E2800334DA3CFE97954433E8B75BDD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208274

This is an S/MIME signed message

------50E2800334DA3CFE97954433E8B75BDD
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Currently I wonder if common-licenses is the right place for Linux-syscall-note,
because this is a Linux specific licenses.

I agree with Ross that SPDX syntax for the LICENSE field would be the best.

First step:

LICENSE = "GPL-2.0-only & Linux-syscall-note"
NO_GENERIC_LICENSE[Linux-syscall-note] = "file://LICENSES/exceptions/Linux-syscall-note"


And with SPDX syntax:

LICENSE = "GPL-2.0-only WITH Linux-syscall-note"

Maybe in the future we can even use https://github.com/spdx/license-list-data
instead of maintaining common-licenses on our own.

Regards, Denis

-----Original Message-----
From: Rasmus Villemoes <ravi@prevas.dk> 
Sent: Tuesday, December 3, 2024 2:18 PM
To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [EXT] Re: [OE-core] [PATCH v2] linux-yocto: add and use GPL-2.0-with-syscall-note license

> So since you're combining thbe GPL text and the syscall-note text, why
> not take an exact copy of the COPYING file as it existed in the kernel
> tree before the current split. That would also make word "below" actually make
> sense. I.e.,
> 
>  git show b3358a116:COPYING
> 
> Rasmus


-----Original Message-----
From: Khem Raj <raj.khem@gmail.com> 
Sent: Tuesday, December 3, 2024 6:38 PM
To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [EXT] Re: [OE-core] [PATCH v2] linux-yocto: add and use GPL-2.0-with-syscall-note license

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/exceptions/Linux-syscall-note
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred/GPL-2.0
> 
> I know we have combined the exceptions and create individual files but
> I wonder if there is a better way to
> express it with combinations of files. eg. see
> meta/files/common-licenses/GPL-3.0-with-GCC-exception
> at the top it says "insert GPL v3 text here" seems a bit iffy. Instead
> it could be expressed with two files having
> full license texts.

------50E2800334DA3CFE97954433E8B75BDD
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIPQAYJKoZIhvcNAQcCoIIPMTCCDy0CAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggxWMIIGUTCCBDmgAwIBAgICMAAwDQYJKoZIhvcNAQELBQAwgaMx
ITAfBgNVBAMMGERpZWhsIEdyb3VwIE1haWwgUm9vdCBDQTELMAkGA1UEBhMCREUx
EjAQBgNVBAcMCU51ZXJuYmVyZzEUMBIGA1UECgwLRGllaGwgR3JvdXAxFDASBgNV
BAsMC0RpZWhsIEdyb3VwMQ8wDQYDVQQIDAZCYXllcm4xIDAeBgkqhkiG9w0BCQEW
EXg1MDktY2FAZGllaGwuY29tMB4XDTE4MDUyOTEyMzIzNVoXDTI4MDUyNjEyMzIz
NVowgZQxCzAJBgNVBAYTAkRFMQ8wDQYDVQQIDAZCYXllcm4xFDASBgNVBAoMC0Rp
ZWhsIEdyb3VwMRswGQYDVQQLDBJEaWVobCBNZXRlcmluZyBUS0gxHzAdBgNVBAMM
FkRpZWhsIE1ldGVyaW5nIE1haWwgQ0ExIDAeBgkqhkiG9w0BCQEWEXg1MDktY2FA
ZGllaGwuY29tMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtISPrKPL
Zjjh//2n9b+GXgrhijJV2knQVC0+/FS3zGl4p2fboB+Vr4YHz1uilEvhsS1oG4FV
f1u0dqdmLVxDHBPMO2K1NKKOJN/6LDDfyiZGNqDOJke6FzrmDyPXXTDtgzWZfdnD
esx63XSxprre30oJ3BxDFS+/8UpuI628SPc1N4125rHeUXG4scKFSjqRPcIOAQ2X
veGXU2dYHzq7B02NA8tssmtJNwXjyvMjOw6HGZ8SB87TrFQm6drEtM7QhI/mfpGe
nTZ4nc84n0yKuMveav8IOspYbkOXzi4JapiOUpmccNLZdIiMg5WJQ0Xt9NSp5yD5
CYKideGrWgX2wNEBpalgjZoPPQDImcWEJx88/yYZ4FwtRD3VueFqpBr4z/bxwVDr
N2a/sEqnocY9Tm2EQyHFHDCJ9JyYEXB8W0LTFcUAx+uHijwPk/oIB5EeH8UygXlX
qUqII+BUZ+q5m5sIc4eXQ10UpUEjG/ptIyO1Ee/E0kPOWzHp07pPgXCZohZb3y41
Ha2pO6rXOsOmPBK2r2++fLWz3NFyfEJCmn6FcBNi003HUEVCup1D9/9yaPHPSieN
27sjQcQ96GbOitC99p3xMnSlg4N11lGeuTXCZjIGXdZL5/dThQaxneVA+hr2X+i1
KmqnesMaSBEuBEBDmbDbakEgJFVWtVeXuk8CAwEAAaOBmzCBmDASBgNVHRMBAf8E
CDAGAQH/AgEAMAsGA1UdDwQEAwIBBjAdBgNVHQ4EFgQUn8t6NGPzWsF+oZYXxmfn
p4Ok7rIwHwYDVR0jBBgwFoAUZrrYQMMD50v/OCDMgDN7y/GT2P8wNQYDVR0fBC4w
LDAqoCigJoYkaHR0cDovL2tleXMuZGllaGwuY29tL2NybC90ay1oX24uY3JsMA0G
CSqGSIb3DQEBCwUAA4ICAQAl6hO6b6+GseZi3EAU+zPVhxNZP5Y+YsBnjf13jCGw
nUVvPz6giwXiCd9KIC4eCqqrJLTHwZe8c/9hSk5CCd6A5XAd3YudrPDvmIwms5Ex
OREMQkygZO6/qxfXO6IhfUO4HvYQtQexzHOLuxG/KdycVwWapA4acFzBurxFQ3aG
jvPRgvWxe2Mt3K9wLrEhvGrDmS8yg4bYNyBZGgax6LRhfW4/ShInVUa0koG2Sj+H
hKpppvqDK4FNgR2dKeCPoo28P9a+K9N3wkLKx4zxaxHegij0DsJOBAVbhk+vDWDO
gedjtT09c9bsykaXFzykyQeQz7cwrTQ1gDacdcDgywMDQzZKim9O3JpyzvXnD7mb
CvclM3xp9w6jIJbeaQE7HDlA9YIL/bSRIQq8mJcXArUevLK2MX/Mb+5m3UMU+zXc
ZqmaneeZeR4bOWrmmhK6bMuce6H+i2YB1vG3BAcSfKQUzZ1m6aKSW1FvjI3SZXQD
FzRzBwC5ql7i2ugtfOLNYjOO/fvAxNppIZb3IyWN1KBAI7YgS4nx0us/NIlWpTMW
91WeUtNBCp2sgi3VTi/TUel3RZ9x3tggMUhrksGkFXz2NUL85AdPV6BqJXXXHggd
121rnduE9ocMt0MFLuDPkMaHqKNzBAcKTcmFM8KYMJ5Z7NBqGtTAgHNVmEnU8gu3
czCCBf0wggPloAMCAQICAgtcMA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJE
RTEPMA0GA1UECAwGQmF5ZXJuMRQwEgYDVQQKDAtEaWVobCBHcm91cDEbMBkGA1UE
CwwSRGllaGwgTWV0ZXJpbmcgVEtIMR8wHQYDVQQDDBZEaWVobCBNZXRlcmluZyBN
YWlsIENBMSAwHgYJKoZIhvcNAQkBFhF4NTA5LWNhQGRpZWhsLmNvbTAeFw0yNDAx
MDIwOTE5MzlaFw0yNjAxMDIwOTE5MzlaMIG8MSIwIAYDVQQDDBlkZW5pcy5vc3Rl
cmxhbmRAZGllaGwuY29tMSgwJgYJKoZIhvcNAQkBFhlkZW5pcy5vc3RlcmxhbmRA
ZGllaGwuY29tMQswCQYDVQQGEwJERTEPMA0GA1UECAwGQmF5ZXJuMRwwGgYDVQQK
DBNEaWVobCBNZXRlcmluZyBUSy1IMRwwGgYDVQQLDBNEaWVobCBNZXRlcmluZyBU
Sy1IMRIwEAYDVQQHDAlOdWVybmJlcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDC4CfZJns8lrNXSkis30SmXgEPwIED4unjF8EoHzBRk5cQphMwuxVY
uFrZmkB8+FJ7kNnazQ5ddAH+7uh/w7vxEbch92iEpJxYRT6z9U7Mgw0sqGjzWQjd
sVzCSrWJrOdrHXc65BnAPOpjNDNe1dR8J9Z4a7OZU5NnQqJMT314j2gfGawGDakJ
Vph7S6v4AVmty1Fi4iRbaIamu8KJFrHQb5E1UVD5drrxW6TS0z/3YkrMQ6qA1fBB
Y271mRVq/1ByvJMgPJu7LtIyuGwGJw44RxF0JPLlqRWpsIa+z2cI48dkvwb8k0T1
rNSIj9urOmUEJGF5O8LioUy0vwmxeWF7AgMBAAGjggEtMIIBKTAfBgNVHSMEGDAW
gBSfy3o0Y/NawX6hlhfGZ+eng6TusjAJBgNVHRIEAjAAMCQGA1UdEQQdMBuBGWRl
bmlzLm9zdGVybGFuZEBkaWVobC5jb20wNQYDVR0fBC4wLDAqoCigJoYkaHR0cDov
L2tleXMuZGllaGwuY29tL2NybC90ay1oX24uY3JsMDUGCCsGAQUFBwEBBCkwJzAl
BggrBgEFBQcwAoYZaHR0cDovL3d3dy5kaWVobC5jb20vcGtpLzAJBgNVHRMEAjAA
MB0GA1UdDgQWBBQK9y4jVYoCDsL7lhhJKjEP5wv1nTALBgNVHQ8EBAMCBaAwHQYD
VR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGCWCGSAGG+EIBAQQEAwIFoDAN
BgkqhkiG9w0BAQsFAAOCAgEAB27J8TZvm6g0rtQpv4kqYwzkXOkCt27WHHWzl/JZ
knFwWH4mvlRSrQtKkx8cPb5xqqx7k4qXC7TAef4W5YmnpWDtw7YHQAygAsCV1+i8
uBhdnBVRYkLi0Brsqb/KaDVCFDAYn82kr8OlDaVl5GazIF5rTTUFVT7QEUewf5e7
Ej4tkepIMP8DW0mM9VRdiSd+DFQQQsQR91nJZS+Gd0jT2tW6SVtZEGnsdgKi9VOw
+/u7TPynQA3m70zel9t0RySfc5bfZGqEBK/nqU2g5n/qaHKT9cMM8vTAJOmzMv4W
p7j6RF851h+6c4kH0UsUR9LdbXsKS0KsKTmjPbmbuMAWSEafskq5lJdhIybBnGcp
FwOkXw6yLHhvmBQ27hVolbrAgLprlLBm8qLq0G3dPHlLwgnNlD6RAcjaVLOcqH3Q
HWHbKlVg310S75cll1rM+GAudWdsHWxOUbK7R0lwJf/E+FAXciAsExWzCQarpSFI
AYJjvnsYTiSWas6b5L/rKtyeWIz5wJ3ovxFaMglCtGNGh3sqKwVgb0PeGJ/hfXkV
Z3i06A/GFOMDvvZ4kI2OL2wwUftkvi8ID5g2nbX/WQh9y6zhlXtiOlA1IplU+PU3
OHrFL4SBW0X7j1l+9Jl9kGy/ukAr+9nWZ55nUoV/L9C1GLrAO5KF/fDpO2b7lidQ
mWUxggKuMIICqgIBATCBmzCBlDELMAkGA1UEBhMCREUxDzANBgNVBAgMBkJheWVy
bjEUMBIGA1UECgwLRGllaGwgR3JvdXAxGzAZBgNVBAsMEkRpZWhsIE1ldGVyaW5n
IFRLSDEfMB0GA1UEAwwWRGllaGwgTWV0ZXJpbmcgTWFpbCBDQTEgMB4GCSqGSIb3
DQEJARYReDUwOS1jYUBkaWVobC5jb20CAgtcMA0GCWCGSAFlAwQCAQUAoIHkMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTIwNDA5
MDYwNFowLwYJKoZIhvcNAQkEMSIEIBq1pNMHhvFjplKYcybW0e7xLp3pYUpuEgAz
cHvNHQutMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBAD8UEbk3WlQ71czHuBzc8rhR7y9Rce4/oh5g/9FtQvgPaNkZWEWXSI9HAxxx
o5lT+VSzMnOS8z8o1ZWDi08VFdGKzVSegHzuXXgJoaZlecs0dawNoF6AJuB2NYnb
Hx/I+OGeX3bn0BwgMS7lIeoHZy52G8d5CRzm9yF7P44zZu76A+rpexAqN0ukPxsP
ogiASDKYO6kGBdG3MSvMJMarbfJSMHnjwE4lzcr9DluKdzNDitIv1UjRC5vZkYpQ
Bamtg4Xv6Uk0exS+p0NkRjeH0ObSg2crnzUaqYZeU1BleQeOCx9nawy6W9h9xlGR
xzYA7OcZ9Sac0X5siI5/FF3g8VQ=

------50E2800334DA3CFE97954433E8B75BDD--


