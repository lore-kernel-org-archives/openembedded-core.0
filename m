Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949A7C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 08:26:57 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.8028.1747297605626263671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 01:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CmPfw7wK;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fefbbc7dd4so644569b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747297605; x=1747902405; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkz/WtbDVThsJ9qii7zpcj6vSgyYKKoaDmZ8U372Sv8=;
        b=CmPfw7wKEtbmptzJ1UYUvuNaFBwm73uWaYbJEr8OYZ4N/TyljbPhijB2K/NKs2CcbO
         Xf4Bv02QiBoIMhiXCHwSS4OH27z3LwDlAHc8rt4aZ95WKFNVrA4/+HcNTEv4AXF++Awv
         UvsR6smVnHJnJQH8gV72vfQHVmzUn+qdRkp+59nd78OrsoK68nRDWlDaooA/jRWH4eGi
         WEPl9s91yb/XWDL+9N6dTJPpXeGpTacYjui7BSHEdF4oPDbbksI3cswRRx7wkBfDT2za
         85jZPHINszk6SWQaEsOMRZRcP48Wzp65ZwzvICiKDmzw3LocYnn4vpDwaLv3cL+I+P4I
         yZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297605; x=1747902405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkz/WtbDVThsJ9qii7zpcj6vSgyYKKoaDmZ8U372Sv8=;
        b=bTBKbpb8KAoum1CFbdrTevVm65AdICLbvus+jdlP0idZE+SDoT9tZ952x0+7NYQ9up
         l76j1GBwA5nRCOYOS85STjg+3STAqLpnLdQ6IfAhXOXp2eBQc3fiWpZ1ftagwDFzwhhM
         aR9Pg0yuQ3N90JWL53v2yCXvtEYM29xuZfhlKs0Hd/Vk5CXstUh7vT9pzosMuyjUnlRM
         7j3aLsswsOo6DO5G5N9K6I1TTV+D9LFcMu7W2DaDwncc2TEweUexPD85QaECmBTlj5/w
         3J7nEeCrGwzN+PFtN8mKW+xn7/6qWSs3fVuA7YwwIDidUDamrCXxExZpMrFOs3d7ORg2
         1uSg==
X-Gm-Message-State: AOJu0YzR3mSdIvKpSiSWEjGXqyZJDmk9GmiG7qoM/d2Dfh/lV1dqt4Az
	/WtMFSgcvkjZRoiYQyzupxcr22pacpaSdtUPVWeh8y33Z0Iv3M7EDCKBc1xNaYlZCBhILnJnq8a
	Le4OGLeZzYlKtT6URTORkfaiITAw=
X-Gm-Gg: ASbGncvRFUdE05NnFRgmxghpt6wJ4Y+Wz1ipl/8HcjZYVKICZtPl3010DbuxhnCRwzq
	NkvcGeNojS8bRweEzru8143uBJcwz5gpf+hbNCEO15mCaNE8nkc5ZhLORxNGhQfpMjdX5uCQcSG
	PU1XyzFq9TB+gaF6JN1Cl+nNKwt1LkkBM=
X-Google-Smtp-Source: AGHT+IFgZ+qZfQp9BrtalBnTd8OVhfU3B5OzfuOIVS9OQ5ZGZCtqzG4nrHr7zgdYb6Ob3gKmvOrkCz/kLQYWedJ04lk=
X-Received: by 2002:a05:6808:2e4f:b0:3fa:7909:2716 with SMTP id
 5614622812f47-404d0d2ef1amr733499b6e.39.1747297604647; Thu, 15 May 2025
 01:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250512144351.1143277-1-tgamblin@baylibre.com>
In-Reply-To: <20250512144351.1143277-1-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 May 2025 01:26:18 -0700
X-Gm-Features: AX0GCFt-tqABDwGtZzdU1CoK8nH_RenDpubjn1ZyOlPKG0Fm38biitULP9hTVBw
Message-ID: <CAMKF1srjsBBNPoGwM5AqB0MPc6ExSq7o==9GTY31vfNB6vRKLA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-cython: upgrade 3.0.12 -> 3.1.0
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 08:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216571

here are meta-python failures from this upgrade -
https://errors.yoctoproject.org/Errors/Build/205866/

On Mon, May 12, 2025 at 7:43=E2=80=AFAM Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
> Many changes are included with this release, including support for
> freethreading builds of CPython 3.13, cleanup of legacy code, and many
> other features and bug fixes.
>
> Changelog: https://github.com/cython/cython/blob/master/CHANGES.rst
>
> Patch '0001-Output-import-relative-paths-in-generated-C-code.-GH.patch'
> is included in 3.1.0, so we no longer need the backport:
>
> |tgamblin@megalith ~/workspace/git/pythonsrc/cython (master)$ git tag --c=
ontains 20bceea6b19ffc2f65b9fba2e4f737f09e5a2b20
> |3.1.0
> |3.1.0-1
> |3.1.0a1
> |3.1.0b1
> |3.1.0rc1
> |3.1.0rc2
>
> Reproducibility looks OK.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...lative-paths-in-generated-C-code.-GH.patch | 73 -------------------
>  ...thon_3.0.12.bb =3D> python3-cython_3.1.0.bb} |  3 +-
>  2 files changed, 1 insertion(+), 75 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-cython/0001-Outp=
ut-import-relative-paths-in-generated-C-code.-GH.patch
>  rename meta/recipes-devtools/python/{python3-cython_3.0.12.bb =3D> pytho=
n3-cython_3.1.0.bb} (88%)
>
> diff --git a/meta/recipes-devtools/python/python3-cython/0001-Output-impo=
rt-relative-paths-in-generated-C-code.-GH.patch b/meta/recipes-devtools/pyt=
hon/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-G=
H.patch
> deleted file mode 100644
> index bbafc294163..00000000000
> --- a/meta/recipes-devtools/python/python3-cython/0001-Output-import-rela=
tive-paths-in-generated-C-code.-GH.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 9b5f3b09f76899eba510c2d8f3ed2b0f752a4d1b Mon Sep 17 00:00:00 2001
> -From: Oscar Benjamin <oscar.j.benjamin@gmail.com>
> -Date: Sat, 24 Aug 2024 08:30:31 +0100
> -Subject: [PATCH] Output import-relative paths in generated C code. (GH-6=
341)
> -
> -When cython is run on a file that is not in the current working director=
y,
> -it outputs filepaths that are either absolute or are basenames.
> -It is not good to output absolute paths in the generated C code and
> -basenames mess up coverage measurement.
> -
> -Upstream-Status: Backport [20bceea6b19ffc2f65b9fba2e4f737f09e5a2b20]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - Cython/Compiler/ExprNodes.py  | 8 +++++++-
> - Cython/Compiler/ModuleNode.py | 9 ++++++---
> - 2 files changed, 13 insertions(+), 4 deletions(-)
> -
> -diff --git a/Cython/Compiler/ExprNodes.py b/Cython/Compiler/ExprNodes.py
> -index a6bb1688e..0fbb15368 100644
> ---- a/Cython/Compiler/ExprNodes.py
> -+++ b/Cython/Compiler/ExprNodes.py
> -@@ -21,6 +21,7 @@ import re
> - import sys
> - import copy
> - import os.path
> -+import pathlib
> - import operator
> -
> - from .Errors import (
> -@@ -10072,7 +10073,12 @@ class CodeObjectNode(ExprNode):
> -         func_name =3D code.get_py_string_const(
> -             func.name, identifier=3DTrue, is_str=3DFalse, unicode_value=
=3Dfunc.name)
> -         # FIXME: better way to get the module file path at module init =
time? Encoding to use?
> --        file_path =3D StringEncoding.bytes_literal(func.pos[0].get_file=
nametable_entry().encode('utf8'), 'utf8')
> -+        file_path =3D func.pos[0].get_filenametable_entry()
> -+        if os.path.isabs(file_path):
> -+            file_path =3D func.pos[0].get_description()
> -+        # Always use / as separator
> -+        file_path =3D pathlib.Path(file_path).as_posix()
> -+        file_path =3D StringEncoding.bytes_literal(file_path.encode('ut=
f-8'), 'utf8')
> -         file_path_const =3D code.get_py_string_const(file_path, identif=
ier=3DFalse, is_str=3DTrue)
> -
> -         # This combination makes CPython create a new dict for "frame.f=
_locals" (see GH #1836).
> -diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.=
py
> -index 43c6b5f07..8c29d6db7 100644
> ---- a/Cython/Compiler/ModuleNode.py
> -+++ b/Cython/Compiler/ModuleNode.py
> -@@ -13,6 +13,7 @@ from collections import defaultdict
> - import json
> - import operator
> - import os
> -+import pathlib
> - import re
> - import sys
> -
> -@@ -944,9 +945,11 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
> -             for source_desc in code.globalstate.filename_list:
> -                 file_path =3D source_desc.get_filenametable_entry()
> -                 if isabs(file_path):
> --                    file_path =3D basename(file_path)  # never include =
absolute paths
> --                escaped_filename =3D file_path.replace("\\", "\\\\").re=
place('"', r'\"')
> --                escaped_filename =3D as_encoded_filename(escaped_filena=
me)
> -+                    # never include absolute paths
> -+                    file_path =3D source_desc.get_description()
> -+                # Always use / as separator
> -+                file_path =3D pathlib.Path(file_path).as_posix()
> -+                escaped_filename =3D as_encoded_filename(file_path)
> -                 code.putln('%s,' % escaped_filename.as_c_string_literal=
())
> -         else:
> -             # Some C compilers don't like an empty array
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-devtools/python/python3-cython_3.0.12.bb b/meta=
/recipes-devtools/python/python3-cython_3.1.0.bb
> similarity index 88%
> rename from meta/recipes-devtools/python/python3-cython_3.0.12.bb
> rename to meta/recipes-devtools/python/python3-cython_3.1.0.bb
> index f1951e3ae67..f93135b94bc 100644
> --- a/meta/recipes-devtools/python/python3-cython_3.0.12.bb
> +++ b/meta/recipes-devtools/python/python3-cython_3.1.0.bb
> @@ -7,8 +7,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62=
bc9f69c"
>
> -SRC_URI +=3D "file://0001-Output-import-relative-paths-in-generated-C-co=
de.-GH.patch"
> -SRC_URI[sha256sum] =3D "b988bb297ce76c671e28c97d017b95411010f7c77fa6623d=
d0bb47eed1aee1bc"
> +SRC_URI[sha256sum] =3D "1097dd60d43ad0fff614a57524bfd531b35c13a907d13bee=
2cc2ec152e6bf4a1"
>
>  inherit pypi setuptools3 cython
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216371): https://lists.openembedded.org/g/openembedde=
d-core/message/216371
> Mute This Topic: https://lists.openembedded.org/mt/113071516/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

