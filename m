Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3955EC41513
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 01:07:01 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.8544.1714598237681131318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 14:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=b7Fqr3Z/;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714598237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=T1h4okz7x6NyZPU+DqH11EatyoE7YchPtrW8OYlkWwU=;
	b=b7Fqr3Z/AyttlGEjjkn+YLBvfJcmCkIUB9RovijlUhmTXpgdh5DWwYvxka+YdVdb4Q2b38
	kcFpWFKhWCx81kwFWFrSTU8W45a2JadThqHFBFM9l+vS1KSvtFiyvP8a3iX3ifoF88tAIU
	9Y4/UUdx5Vqj+ISjVAXrlGEh0THv7L0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-7-cnPynBokNs6V-SuJkH7qWw-1; Wed, 01 May 2024 14:17:12 -0700
X-MC-Unique: cnPynBokNs6V-SuJkH7qWw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34e0d8b7636so72105f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 14:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714598231; x=1715203031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JNL8sgVWRxO9mIf9s26EXGKab7gAXcfjEvM5N3uP9Q=;
        b=CQDM1ookXuIo7N2TSw+IonG2c7hkNIF02WL2eo+bOIcgGUa2Cm1hh3/oY+hDig1Ma9
         XTPxf7soCrMQUJqDIQ9Ul9n7tklmcSq4dqdlXxsYdMTMUjc3u9SMQmTan/1eSWW75u2y
         tFFOw/tGi/guSwzYbsHw1ROO+FLG2zrIBjYf/i8W4/FRdNEC7THHOq9CPBbq+WDG2HaA
         RZOBcYp6yrasLwf+QQTbXngByTB0WT3VZesKM3oBrFvvg5atDGQ02Zl6TCHlA45JSnY6
         X3So/vI63Hyy445PJ8HxrnY6Asp/gvqtDhuyk/QNLJqm2IGbXxXP8ymAe175YC1ljFip
         i+sg==
X-Gm-Message-State: AOJu0YzzU00mh5fbn5KANx4J1O85tZ6bluZvaxUONtPeVQtBKg55Jk0z
	JM7EROS2B/rH/AVYCTaxeQzFnH6ZRYYmjUuZfLaldA7fEzahq/PJnHZGA0qajPGri5ZZ5q9/Cmt
	fATEYuPmSMxj3xiZJJS3nkyrvZow9w+XzWrHHd2URcVOjTzRGSfMXXr6iJVAWCC5+iYyC4sIYqj
	eX6S6G+tIpa10PEftYUm18yAk6kOMBxZB38yj1zowJ1XlzuE1jg5HfU1kt0GZ/TEFkodE=
X-Received: by 2002:adf:e74c:0:b0:34d:ab1a:6384 with SMTP id c12-20020adfe74c000000b0034dab1a6384mr585570wrn.13.1714598230781;
        Wed, 01 May 2024 14:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrK0Hd+ojTE7//apuaXzKScnstJOGs2cVwDVbqx1pcbdaQvAmbAH2+kLz1lN1XWER1SNcgAg==
X-Received: by 2002:adf:e74c:0:b0:34d:ab1a:6384 with SMTP id c12-20020adfe74c000000b0034dab1a6384mr585553wrn.13.1714598230186;
        Wed, 01 May 2024 14:17:10 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000195200b003462fec9f5asm35204380wry.62.2024.05.01.14.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 14:17:09 -0700 (PDT)
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [PATCH] python3-manifest: prune python3-core
Date: Wed,  1 May 2024 21:16:56 +0000
Message-Id: <20240501211656.275800-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405011417154101"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 01:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199028

--MCBoundary=_12405011417154101
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Remove file entries which no longer exist in the source.

I spotted this when I added a custom QA error locally which
raised a warning when a file in FILES list of a package isn't
found in the source.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../python/python3/python3-manifest.json      | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index 46092d4004..6e06002783 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -219,15 +219,9 @@
         "rdepends": [],
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
-            "${bindir}/python${PYTHON_MAJMIN}.real",
             "${bindir}/python3",
             "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
-            "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
-            "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
-            "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
             "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
             "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
@@ -262,7 +256,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
             "${libdir}/python${PYTHON_MAJMIN}/gettext.py",
             "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
-            "${libdir}/python${PYTHON_MAJMIN}/imp.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap.py",
@@ -274,10 +267,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/io.py",
             "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
             "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/_str=
uct.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/bina=
scii.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/time=
.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xrea=
dlines.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
@@ -286,22 +275,17 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess=
.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/readline.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/select.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata.*.so=
",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
             "${libdir}/python${PYTHON_MAJMIN}/locale.py",
             "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
-            "${libdir}/python${PYTHON_MAJMIN}/new.py",
             "${libdir}/python${PYTHON_MAJMIN}/ntpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
@@ -323,7 +307,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/shutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/signal.py",
             "${libdir}/python${PYTHON_MAJMIN}/site.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
@@ -331,7 +314,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
             "${libdir}/python${PYTHON_MAJMIN}/struct.py",
             "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
-            "${libdir}/python${PYTHON_MAJMIN}/symbol.py",
             "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
             "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
             "${libdir}/python${PYTHON_MAJMIN}/threading.py",
@@ -349,7 +331,6 @@
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.py=
c",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc=
.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.p=
yc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.py=
c",
@@ -378,7 +359,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc"=
,
@@ -395,7 +375,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.py=
c",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc",
@@ -410,13 +389,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc=
",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc"=
,
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc"=
,
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc"=
,
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
--=20
2.34.1

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast, a leader in email security and cyber resili=
ence. Mimecast integrates email defenses with brand protection, security aw=
areness training, web security, compliance and other essential capabilities=
. Mimecast helps protect large and small organizations from malicious activ=
ity, human error and technology failure; and to lead the movement toward bu=
ilding a more resilient world. To find out more, visit our website.

--MCBoundary=_12405011417154101
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Remove file entries which no longer exist in the so=
urce.<BR>
<BR>
I spotted this when I added a custom QA error locally which<BR>
raised a warning when a file in FILES list of a package isn't<BR>
found in the source.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 .../python/python3/python3-manifest.json      | 23 -------------------<BR>
 1 file changed, 23 deletions(-)<BR>
<BR>
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json<BR>
index 46092d4004..6e06002783 100644<BR>
--- a/meta/recipes-devtools/python/python3/python3-manifest.json<BR>
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json<BR>
@@ -219,15 +219,9 @@<BR>
         &quot;rdepends&quot;: [],<BR>
         &quot;files&quot;: [<BR>
             &quot;${bindir}/python${PYTHON_MAJMIN}&quot;,<BR>
-            &quot;${bindir}/python${PYTHON_MAJMIN}.real&quot;,<BR>
             &quot;${bindir}/python3&quot;,<BR>
             &quot;${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h&quot;,<=
BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/UserDict.py&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/UserList.py&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/UserString.py&quot;,<BR=
>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__future__.py&quot;,<BR=
>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/_abcoll.py&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py&quot;,<B=
R>
             &quot;${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py&quo=
t;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/_compression.py&quot;,<=
BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/_markupbase.py&quot;,<B=
R>
@@ -262,7 +256,6 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/getopt.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/gettext.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/heapq.py&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/imp.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/importlib&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/importlib/_abc.py&quot;=
,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap.py=
&quot;,<BR>
@@ -274,10 +267,6 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/io.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/ipaddress.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/keyword.py&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__=
/_struct.*.so&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__=
/binascii.*.so&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__=
/time.*.so&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__=
/xreadlines.*.so&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.s=
o&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so&q=
uot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so&q=
uot;,<BR>
@@ -286,22 +275,17 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.s=
o&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubpr=
ocess.*.so&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.s=
o&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.s=
o&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so&=
quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.=
so&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so&qu=
ot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so&q=
uot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so=
&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/readline.*.=
so&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/select.*.so=
&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so&q=
uot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata=
.*.so&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.=
*.so&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so&q=
uot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/linecache.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/locale.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/lzma.py&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/new.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/ntpath.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/opcode.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/operator.py&quot;,<BR>
@@ -323,7 +307,6 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/shutil.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/signal.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/site.py&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py&quot;,=
<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/sre_compile.py&quot;,<B=
R>
             &quot;${libdir}/python${PYTHON_MAJMIN}/sre_constants.py&quot;,=
<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/sre_parse.py&quot;,<BR>
@@ -331,7 +314,6 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/stringprep.py&quot;,<BR=
>
             &quot;${libdir}/python${PYTHON_MAJMIN}/struct.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/subprocess.py&quot;,<BR=
>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/symbol.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/sysconfig.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/textwrap.py&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/threading.py&quot;,<BR>
@@ -349,7 +331,6 @@<BR>
         ],<BR>
         &quot;cached&quot;: [<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.=
*.pyc&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale=
.*.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collection=
s_abc.*.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compressio=
n.*.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase=
.*.pyc&quot;,<BR>
@@ -378,7 +359,6 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.py=
c&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.p=
yc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc=
&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc&q=
uot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.p=
yc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc&qu=
ot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*=
.pyc&quot;,<BR>
@@ -395,7 +375,6 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.p=
yc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.=
pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*=
.pyc&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc&qu=
ot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.p=
yc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter=
.*.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc=
&quot;,<BR>
@@ -410,13 +389,11 @@<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.=
*.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.py=
c&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.=
*.pyc&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.py=
c&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*=
.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.=
pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*=
.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc=
&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.=
pyc&quot;,<BR>
-            &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*=
.pyc&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc=
&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.py=
c&quot;,<BR>
             &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.=
pyc&quot;,<BR>
-- <BR>
2.34.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
/p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666;">Warning=
:  Copyright Nox Health.  This communication is confidential and may contai=
n privileged information.  By the use of email over the Internet or other c=
ommunication systems, Nox Health is not waiving either confidentiality of, =
or legal privilege in, the content of the email and of any attachments.  If=
 the recipient of this message is not the intended addressee, please call N=
ox Health immediately by calling (+1) 888.505.0280</p></body></html>

--MCBoundary=_12405011417154101--

