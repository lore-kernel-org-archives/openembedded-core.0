Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44999CA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 15:42:43 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.909.1757346157098008646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 08:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RO7cXAgg;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ea376eb0efeso11087276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757346156; x=1757950956; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0PVxHJm0MkOLBPX/k4Nk/vgFzaWtQb0bLNPG3DSIhw=;
        b=RO7cXAgg6rVb9k0a2ZSoqYhRNAQRDEe+JMmaNiVy+/0+iCyr+RwNpp3fFee9YY3U8N
         0eeSRggYT/OSRNCexmWeH3gGbk9XxrRGxX29FZ8QWhw6KZJMeVYiiCKz9QUrLV72c14R
         3AQH+WMmvOlFSOgnk56sf9wRz8vC/ZeZTwxDhA88jAQg0iPwlP3M1dsVuyVA6QC9W8Qx
         8zZcgZMmQIKUTjKvuRiim7hPwi/dDyWOxCDrWqe5gJUnEXliETmAhik+EG/Ir2gbGIaW
         O/4AieIGl5a+wQpBIORCEtKCmbymE+os5otADzkWt4dnlFwuqrhFdJ/ex7A+lIeR2Jkb
         ksqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346156; x=1757950956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0PVxHJm0MkOLBPX/k4Nk/vgFzaWtQb0bLNPG3DSIhw=;
        b=El6dVkUVfeKtci01u23qCZI8n2ERlOXKzrH1MjTK7ype0Bl9aQzbruldXn1b1WQ252
         7YAvndSSeDc+0S5NQvcYUvOO0ZZVHmN8Evd1+rBQggvp/yhd6UEHcYyKmJzv2vyVhDPO
         DC73mivWAYvUGtlFCv/Dc+o0cPFAZ9eq6NHYpWLxK8CK2RpNVfx2Bqe9Gv1ArX5Ogtcd
         SkDDl5v5NjDRMiegFOhZao8OdhDJUMG1SBnUnVdDfcgG11deYoDHGWsFEK9+/OZsk1SS
         CB+mCPyptHb0TJxWB+Hun32KGyReZnm4iUBC4QBvNatv6d/D1/iqNiuoPjnJzktdx8El
         iYfw==
X-Gm-Message-State: AOJu0YzYOazbqa0v2XUeSUgb+v86j+DyUSFA8CnyYd0HXKluob4pPBBS
	U8bXBOfXDf3aM6+/fMAPlXpeV5X9+TRw9iNUoCchjqWKQF/I1raFVGGAjqTVDX2X5wwSw+8zZBO
	lfcWl4lQ/J20Jk5TjGSw3kXbUXovrt+SGqt/g5+ctFQ==
X-Gm-Gg: ASbGnctxebagjM3LuzbD35CGxdhDC4mPRnZ6TUzc+6CL/iV1qhLFwKukzinGKfS8yPm
	MASePKM0i6s9nyD66+Gt3SF5l/RffOZaYmKX18IL1h+FsaGqTRpSp8rdp5xTpGElR2bz1o8dVLO
	XDRUzPsLyrKUZwILnEQuAQ35RgtS6omxJ8tQrrywXDLE/HKs/uhhBodKa7LhCpMB6/jdZex27cz
	CNi/rCV0s564kae0ow/2WxuNMUhvYVQ/zhWzEeK4TSEBOy22A==
X-Google-Smtp-Source: AGHT+IE8WfDkL5Jq48mnm4pbSWNYg9Lzp++mhi05dIUUCuRiD5iqyCwUQNEZ0zDsLICyjuRszrBOM9B+LFOx1LVFYZg=
X-Received: by 2002:a25:aa31:0:b0:e9d:776a:2259 with SMTP id
 3f1490d57ef6-e9f65d18b2fmr5530046276.18.1757346155674; Mon, 08 Sep 2025
 08:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250905180149.2497823-1-rmmuniz@gmail.com>
In-Reply-To: <20250905180149.2497823-1-rmmuniz@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 8 Sep 2025 08:42:24 -0700
X-Gm-Features: Ac12FXwq1pO2676GXNA3iQKQIli6vUby_QpSE7rtaGmCiI-tgVCPUqgIy3g5EmY
Message-ID: <CAOSpxdai3-8kRFDgZxpZk=i3iJ0hE+eu20fzeU=TWqZejRVhXA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][walnascar][PATCH 1/3] python3-evdev: upgrade
 1.9.1 -> 1.9.2
To: rmmuniz@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 15:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223072

Sent to the wrong mailing list~  This list is for patches to oe-core,
you want the meta-openembeded mailing list:
openembedded-devel@lists.openembedded.org

Steve

On Sat, Sep 6, 2025 at 6:03=E2=80=AFAM Rene Muniz via lists.openembedded.or=
g
<rmmuniz=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> * Remove a merged reproducibility patch
> * Adapt the --reproducible option
>
> Changelog (from [0]):
>
> 1.9.2 (May 01, 2025)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Add the "--reproducible" build option which removes the build date and =
used headers from the
>   generated ``ecodes.c``. Example usage::
>
>     python -m build --config-setting=3D--build-option=3D'build_ecodes --r=
eproducible' -n
>
> - Use ``Generic`` to set precise type for ``InputDevice.path``.
>
> [0]: https://github.com/gvalkov/python-evdev/blob/v1.9.2/docs/changelog.r=
st
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ibility-option-for-building-ecodes.c.patch | 116 ------------------
>  ...-evdev_1.9.1.bb =3D> python3-evdev_1.9.2.bb} |   5 +-
>  2 files changed, 2 insertions(+), 119 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-evdev/000=
1-Add-a-reproducibility-option-for-building-ecodes.c.patch
>  rename meta-python/recipes-devtools/python/{python3-evdev_1.9.1.bb =3D> =
python3-evdev_1.9.2.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a=
-reproducibility-option-for-building-ecodes.c.patch b/meta-python/recipes-d=
evtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building=
-ecodes.c.patch
> deleted file mode 100644
> index e730519884..0000000000
> --- a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reprod=
ucibility-option-for-building-ecodes.c.patch
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -From d05c1c9dd298cb95d7feccbddb5caa043a319a01 Mon Sep 17 00:00:00 2001
> -From: Yoann Congal <yoann.congal@smile.fr>
> -Date: Sun, 13 Apr 2025 00:52:13 +0200
> -Subject: [PATCH] Add a reproducibility option for building ecodes.c
> -
> -ecodes.c currently contains the kernel info of the build machine and the
> -full path of the input*.h headers: This is not reproducible as output
> -can change even is headers content do not. Downstream distributions
> -might package ecodes.c and get non-reproducible output.
> -
> -To fix this: introduce a --reproducible option in the build:
> -- in setup.py build_ecodes command
> -- in underlying genecodes_c.py
> -
> -Note: These options are disabled by default so no change is expected in
> -current builds.
> -
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> -Upstream-Status: Submitted [https://github.com/gvalkov/python-evdev/pull=
/242]
> ----
> - setup.py                 | 13 ++++++++++---
> - src/evdev/genecodes_c.py | 17 +++++++++++------
> - 2 files changed, 21 insertions(+), 9 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 6b721d7..3371199 100755
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -14,7 +14,7 @@ curdir =3D Path(__file__).resolve().parent
> - ecodes_c_path =3D curdir / "src/evdev/ecodes.c"
> -
> -
> --def create_ecodes(headers=3DNone):
> -+def create_ecodes(headers=3DNone, reproducibility=3DFalse):
> -     if not headers:
> -         include_paths =3D set()
> -         cpath =3D os.environ.get("CPATH", "").strip()
> -@@ -65,7 +65,10 @@ def create_ecodes(headers=3DNone):
> -
> -     print("writing %s (using %s)" % (ecodes_c_path, " ".join(headers)))
> -     with ecodes_c_path.open("w") as fh:
> --        cmd =3D [sys.executable, "src/evdev/genecodes_c.py", "--ecodes"=
, *headers]
> -+        cmd =3D [sys.executable, "src/evdev/genecodes_c.py"]
> -+        if reproducibility:
> -+            cmd.append("--reproducibility")
> -+        cmd.extend(["--ecodes", *headers])
> -         run(cmd, check=3DTrue, stdout=3Dfh)
> -
> -
> -@@ -74,17 +77,21 @@ class build_ecodes(Command):
> -
> -     user_options =3D [
> -         ("evdev-headers=3D", None, "colon-separated paths to input subs=
ystem headers"),
> -+        ("reproducibility", None, "hide host details (host/paths) to cr=
eate a reproducible output"),
> -     ]
> -
> -     def initialize_options(self):
> -         self.evdev_headers =3D None
> -+        self.reproducibility =3D False
> -
> -     def finalize_options(self):
> -         if self.evdev_headers:
> -             self.evdev_headers =3D self.evdev_headers.split(":")
> -+        if self.reproducibility is None:
> -+            self.reproducibility =3D False
> -
> -     def run(self):
> --        create_ecodes(self.evdev_headers)
> -+        create_ecodes(self.evdev_headers, reproducibility=3Dself.reprod=
ucibility)
> -
> -
> - class build_ext(_build_ext.build_ext):
> -diff --git a/src/evdev/genecodes_c.py b/src/evdev/genecodes_c.py
> -index 5c2d946..24cad27 100644
> ---- a/src/evdev/genecodes_c.py
> -+++ b/src/evdev/genecodes_c.py
> -@@ -15,22 +15,27 @@ headers =3D [
> -     "/usr/include/linux/uinput.h",
> - ]
> -
> --opts, args =3D getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs"])
> -+opts, args =3D getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs", "rep=
roducibility"])
> - if not opts:
> --    print("usage: genecodes.py [--ecodes|--stubs] <headers>")
> -+    print("usage: genecodes.py [--ecodes|--stubs] [--reproducibility] <=
headers>")
> -     exit(2)
> -
> - if args:
> -     headers =3D args
> -
> -+reproducibility =3D ("--reproducibility", "") in opts
> -+
> -
> - # ---------------------------------------------------------------------=
--------
> - macro_regex =3D r"#define\s+((?:KEY|ABS|REL|SW|MSC|LED|BTN|REP|SND|ID|E=
V|BUS|SYN|FF|UI_FF|INPUT_PROP)_\w+)"
> - macro_regex =3D re.compile(macro_regex)
> -
> --# Uname without hostname.
> --uname =3D list(os.uname())
> --uname =3D " ".join((uname[0], *uname[2:]))
> -+if reproducibility:
> -+    uname =3D "hidden for reproducibility"
> -+else:
> -+    # Uname without hostname.
> -+    uname =3D list(os.uname())
> -+    uname =3D " ".join((uname[0], *uname[2:]))
> -
> -
> - # ---------------------------------------------------------------------=
--------
> -@@ -138,5 +143,5 @@ elif ("--stubs", "") in opts:
> -     template =3D template_stubs
> -
> - body =3D os.linesep.join(body)
> --text =3D template % (uname, headers, body)
> -+text =3D template % (uname, headers if not reproducibility else ["hidde=
n for reproducibility"], body)
> - print(text.strip())
> diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb b=
/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> rename to meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
> index af88770c59..28c8ea4bc1 100644
> --- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
> @@ -3,8 +3,7 @@ HOMEPAGE =3D "https://github.com/gvalkov/python-evdev"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd7bd1cc4c71b706c7e2d4053aef50=
f2a"
>
> -SRC_URI +=3D "file://0001-Add-a-reproducibility-option-for-building-ecod=
es.c.patch"
> -SRC_URI[sha256sum] =3D "dc640a064cb1c9fe1f8b970dc2039945a2a275d7b7ee6228=
4bf427238abe45ee"
> +SRC_URI[sha256sum] =3D "5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c9=
5d1c87fb8f423069"
>
>  inherit pypi python_setuptools_build_meta
>
> @@ -14,7 +13,7 @@ do_compile:prepend() {
>
>  PEP517_BUILD_OPTS =3D "--config-setting=3D--build-option=3D'build_ecodes=
 \
>      --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${ST=
AGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \
> -    --reproducibility'"
> +    --reproducible'"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-ctypes \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223043): https://lists.openembedded.org/g/openembedde=
d-core/message/223043
> Mute This Topic: https://lists.openembedded.org/mt/115098119/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

