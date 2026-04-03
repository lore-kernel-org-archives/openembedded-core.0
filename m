Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F15FE88D62
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 21:09:14 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5089.1775250552943992893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 14:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G/5N5dG5;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfa33a983so1405423f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775250551; x=1775855351; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Njj+2eXQpQiBzZgQ6ZSsioWV3gzOtZaudDwMXoTfDs=;
        b=G/5N5dG5MUlW3PveEw0Mw/4XqFvxDkfNdoqFVJEBiiEtw0sNToDeLh9P+Ojmx9gmFX
         HG2YwZgCOQD15vM2TqzE81bJ8mlRsOgzTgIgo8YSc3UL8fLpOl4+duWkUBMr/g0SW4dj
         FwX7lSbvb9XSCwPcplMWU2gUYCllGP/Bj2Wss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775250551; x=1775855351;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Njj+2eXQpQiBzZgQ6ZSsioWV3gzOtZaudDwMXoTfDs=;
        b=Ij8a1aHiISMX5bTyO9POuWnNWzXtVCPZoyGBbJzMUEFs00y+CvqXxV9i3XqCTCeD8g
         ZWFKXqgHm7TEJzJbsgw6+QcYssRYthOjBa76GyhSjMNiP4aHdCYXvWC4FCmKcOyId/kp
         ET8iO5I+sSw0fnocwAC+qkoS6BHZ+SscOeU6yeZ8jeJ/KH7Fk5nCQnsE3Y5oHbk8SeQ5
         bFc/W6rW4WAGk5RQKRTpVliMaYDkIUDzUPy2nGZrXqf6l4WSEsUZi8cKVclKepUlBw4D
         u0U81Q5Ysbvyp9M1F4KsTZT4gwVsz1AWOtC82MEZmDZ8hMTMdGTIF/wQx4MtqKoTyuus
         7U4g==
X-Forwarded-Encrypted: i=1; AJvYcCUSAcKO6djuZTNoSH8ew7DsOjoCmGYunCcz272lvIzHIYRdCMSOO5MwLEy06Wm2JxnMSJKBHw4bGRg+RdowiOlZcw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVbg+9YaXgjNjL3yxGPJHDQNjvkRRKAc8fzV0/YiftLRka8le8
	4GCWMZV5J3KzhPxZtN4RwBO6vTrYmJDs9AsEqO7tNNkaURZwscovONSSxWw6BjRg0/drCJgxOfy
	TxzXWvW4=
X-Gm-Gg: AeBDiesyvsihkp4/yH/cURMwIKIk1JVIulRQJKwzRwQn/jjGDUC36tOn+/EstO8t50M
	s+1z92siFnSpbpmyLJ97zBg6Hm+RhDjS6dtNd34ao6nmLrtArA6nuDIc1FogIc4jghCpKVJ7/rX
	EUnPH16nxtscAA0eO98ghi/Qor4pL66GWIS/ud2iRO+Nhpr06TY+Y5LfZuQ4cQIK5lb0bJpj8gO
	3N9TqxKzjbmTaOQ02MeciIfXKSHoqYIwc4pTZaWUqbqyj585l/C5eM/pe3LrpedmyGNrIdjnjIe
	4HDFxRgmujltN3dc7Zu1ft/1lx9/vp6Th0xpIbmOomS/ZSeoVT4g0SDCk+aSqICzeLgV/KWmwqg
	pl0wBRlZ250X3Si/X0GGc6RbtCPUNZ9jAtlXWyXkwx8uZgE4+HVsvNFkYiDOym3A4ubWE/o1eSe
	MoPEHZPaV67jzTG/14bXgCtkSGcjc29QReIKskMEpOWThUCeGMyO46PYqSzLoHZRfyZy9VDp895
	vvH/bq4/ap4cbQ=
X-Received: by 2002:a5d:5c84:0:b0:436:3707:2bf0 with SMTP id ffacd0b85a97d-43d292f4831mr6802278f8f.35.1775250551043;
        Fri, 03 Apr 2026 14:09:11 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm19996304f8f.33.2026.04.03.14.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 14:09:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 23:09:10 +0200
Message-Id: <DHJTSS7C2YUF.1JVW5DV7R55G6@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][PATCH] python3: Fix CVE-2025-15282
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260324103908.798946-1-vanusuri@mvista.com>
In-Reply-To: <20260324103908.798946-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 21:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234598

On Tue Mar 24, 2026 at 11:39 AM CET, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Pick patch from 3.10 branch
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-15282
> [2] https://security-tracker.debian.org/tracker/CVE-2025-15282
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hello,

As far as I can tell, this CVE applies to scarthgap and whinlatter.
Since this is the end I'll take it into the reviews series but can only
merge it if there is a patch sent for this CVE in those branches.

Regards,

>  .../python/python3/CVE-2025-15282.patch       | 68 +++++++++++++++++++
>  .../python/python3_3.10.19.bb                 |  1 +
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15282.p=
atch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-15282.patch b/=
meta/recipes-devtools/python/python3/CVE-2025-15282.patch
> new file mode 100644
> index 0000000000..80ef2fcde8
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2025-15282.patch
> @@ -0,0 +1,68 @@
> +From 34d76b00dabde81a793bd06dd8ecb057838c4b38 Mon Sep 17 00:00:00 2001
> +From: Seth Michael Larson <seth@python.org>
> +Date: Sun, 25 Jan 2026 11:05:15 -0600
> +Subject: [PATCH] [3.10] gh-143925: Reject control characters in data: UR=
L
> + mediatypes (#144115)
> +
> +(cherry picked from commit f25509e78e8be6ea73c811ac2b8c928c28841b9f)
> +(cherry picked from commit 2c9c746077d8119b5bcf5142316992e464594946)
> +
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/34d7=
6b00dabde81a793bd06dd8ecb057838c4b38]
> +CVE: CVE-2025-15282
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + Lib/test/test_urllib.py                                   | 8 ++++++++
> + Lib/urllib/request.py                                     | 5 +++++
> + .../2026-01-16-11-51-19.gh-issue-143925.mrtcHW.rst        | 1 +
> + 3 files changed, 14 insertions(+)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-iss=
ue-143925.mrtcHW.rst
> +
> +diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
> +index 82f1d9dc2e7bb3..b08fc8f2b19463 100644
> +--- a/Lib/test/test_urllib.py
> ++++ b/Lib/test/test_urllib.py
> +@@ -11,6 +11,7 @@
> + from test import support
> + from test.support import os_helper
> + from test.support import warnings_helper
> ++from test.support import control_characters_c0
> + import os
> + try:
> +     import ssl
> +@@ -683,6 +684,13 @@ def test_invalid_base64_data(self):
> +         # missing padding character
> +         self.assertRaises(ValueError,urllib.request.urlopen,'data:;base=
64,Cg=3D')
> +=20
> ++    def test_invalid_mediatype(self):
> ++        for c0 in control_characters_c0():
> ++            self.assertRaises(ValueError,urllib.request.urlopen,
> ++                              f'data:text/html;{c0},data')
> ++        for c0 in control_characters_c0():
> ++            self.assertRaises(ValueError,urllib.request.urlopen,
> ++                              f'data:text/html{c0};base64,ZGF0YQ=3D=3D'=
)
> +=20
> + class urlretrieve_FileTests(unittest.TestCase):
> +     """Test urllib.urlretrieve() on local files"""
> +diff --git a/Lib/urllib/request.py b/Lib/urllib/request.py
> +index 6edde1f73189b1..c378a86a70cbeb 100644
> +--- a/Lib/urllib/request.py
> ++++ b/Lib/urllib/request.py
> +@@ -1654,6 +1654,11 @@ def data_open(self, req):
> +         scheme, data =3D url.split(":",1)
> +         mediatype, data =3D data.split(",",1)
> +=20
> ++        # Disallow control characters within mediatype.
> ++        if re.search(r"[\x00-\x1F\x7F]", mediatype):
> ++            raise ValueError(
> ++                "Control characters not allowed in data: mediatype")
> ++
> +         # even base64 encoded data URLs might be quoted so unquote in a=
ny case:
> +         data =3D unquote_to_bytes(data)
> +         if mediatype.endswith(";base64"):
> +diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-1439=
25.mrtcHW.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-1439=
25.mrtcHW.rst
> +new file mode 100644
> +index 00000000000000..46109dfbef3ee7
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-143925.mrtc=
HW.rst
> +@@ -0,0 +1 @@
> ++Reject control characters in ``data:`` URL media types.
> diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recip=
es-devtools/python/python3_3.10.19.bb
> index fbb2f80886..e2a0ae9fe7 100644
> --- a/meta/recipes-devtools/python/python3_3.10.19.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.19.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://CVE-2025-13836.patch \
>             file://CVE-2025-13837.patch \
>             file://CVE-2025-12084.patch \
> +           file://CVE-2025-15282.patch \
>             "
> =20
>  SRC_URI:append:class-native =3D " \


--=20
Yoann Congal
Smile ECS


