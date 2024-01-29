Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C224C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 09:05:25 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.10453.1706519117036713695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 01:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uc+E39Xd;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-46b35fad293so475585137.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 01:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706519116; x=1707123916; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oUFbuBBENQCdwMLQctvippT9aWTQWnBuGOnGLg0EQ/w=;
        b=Uc+E39XdA9d9m5z3YhI+WIEsIA97nfYHF2W4iblYqhvMBsCz4L3eQXuaSqFXzqaet7
         D/KXCIvZerA8AQvilsZDf2wQaTzZ+1ipM+0XoVcHqmMd223jMHmnUpKL52SKftZFkwcL
         M4MqkPhcCvQV3H48YOQByg7cqor8gFGwndGAL12lhbkUCt4X2thBnSyy/KQbtA8BuN05
         U2SFl78veIyJwCrfVyYrI/zP5qyK88+hP1qO1tnw5UjhYjThbgNkSphs/pE4hyQ9zpEL
         /wdfcKs9trs2FmeKs6eHsS0Bl7omH7Vhr8/VWbWL9fS9cLhY2mkg71dB72GGXcauQj6w
         M/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706519116; x=1707123916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUFbuBBENQCdwMLQctvippT9aWTQWnBuGOnGLg0EQ/w=;
        b=IyR8w1xAn+Mp+dgeRmJxPiJFpFDoJQzmyQpCgaKiOokbuwZRjbFhWL/gurd+0UJeNQ
         lXBZuIcVSY0/vvzFVp3sfvfK2uIm4Q4ipf5qNjhwlrFjrSaOdrNojJYNz0ShH9y4wpQk
         F7BMqr6Bb1AE48AACsNSJ5sC0jS6zpKkzWMfWv5TzC2ckl/EhT24gWo/Rkk+PhWjX5CS
         XIi2cPM3gOWIvS4Twai8m/LypU60wUaIrEll7RcKCMsEADsrdrz9zZn+0A1WL9wuoYKt
         PqqUv5ww/IqtIn82hfPDtomTb/1p55Yi6YbndmeyQWKeI9GYbJ5K7k0FoDdpRkCa4aty
         gjhg==
X-Gm-Message-State: AOJu0Yw91JEYmCMPT2LiU6cflEwOqI5I5kaLDTmAOlOFJz89KjorO1pQ
	QrZYj/Mgk89wunacaWEObtOzKzgUR8r+4b8DFOMiDJh+e2oMXrwla9SFFYnpZAx8DRFzeJzG/oH
	zeRc3vaTFY1Z1t7OlsjKs5Ay/uPY=
X-Google-Smtp-Source: AGHT+IFURT28MUZ8F5ViQkFIMhP4+RUQhSqhU3qCX2CcpJcoABZ+JjDS4JCQAvWr4vv+5scavna5jb6VRnJOWpks5fA=
X-Received: by 2002:a67:e903:0:b0:46b:2b6d:32d1 with SMTP id
 c3-20020a67e903000000b0046b2b6d32d1mr1578559vso.5.1706519116004; Mon, 29 Jan
 2024 01:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20240128000405.3074503-1-sgw@bigsur.com> <20240128000405.3074503-2-sgw@bigsur.com>
In-Reply-To: <20240128000405.3074503-2-sgw@bigsur.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 29 Jan 2024 09:05:05 +0000
Message-ID: <CANPvuRnfszi6ArktLvJ5i4h+M6XyOEfDsu3BBSR=VK1eJ46WHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] check-bbclasses: add new script to check bbclasses
To: Saul Wold <sgw@bigsur.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000b6449b061011f1da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 09:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194453

--000000000000b6449b061011f1da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Saul Wold <sgw@bigsur.com> escreveu (domingo, 28/01/2024 =C3=A0(s) 00:04):

> FIXES [YOCTO #14235]
>
> This script is a starting point for a "linter" for bbclass files.
> Currently it will check for '_' in the bbclass filename and '-' in
> addtask or EXPORT_FUNCTION. It will print warnings only no errors.
>
> Signed-off-by: Saul Wold <sgw@bigsur.com>
> ---
>  scripts/check-bbclasses | 109 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100755 scripts/check-bbclasses
>
> diff --git a/scripts/check-bbclasses b/scripts/check-bbclasses
> new file mode 100755
> index 00000000000..ea525b2d118
> --- /dev/null
> +++ b/scripts/check-bbclasses
> @@ -0,0 +1,109 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# This script checks for bbclass like a linter can gives a
> +# warning if any of the following issues:
> +# * bbclass filename contains a '_' unless in the know list
> +# * either an 'addtask' or 'EXPORT_FUNCTION' name contains a '-'
> +#
> +
> +import sys, os, subprocess, re, shutil
> +
> +# List of known classes with '_' in OE-Core
> +oecore_known_classes =3D (
> +       "test_events.bbclass",
> +       "migrate_localcount.bbclass",
> +       "copyleft_compliance.bbclass",
> +       "sign_ipk.bbclass",
> +       "multilib_global.bbclass",
> +       "useradd_base.bbclass",
> +       "rm_work_and_downloads.bbclass",
> +       "sign_rpm.bbclass",
> +       "rm_work.bbclass",
> +       "sign_package_feed.bbclass",
> +       "copyleft_filter.bbclass",
> +       "relative_symlinks.bbclass",
> +       "recipe_sanity.bbclass",
> +       "metadata_scm.bbclass",
> +       "python_pyo3.bbclass",
> +       "multilib_script.bbclass",
> +       "multilib_header.bbclass",
> +       "compress_doc.bbclass",
> +       "populate_sdk.bbclass",
> +       "license_image.bbclass",
> +       "python_maturin.bbclass",
> +       "python_setuptools3_rust.bbclass",
> +       "image_types.bbclass",
> +       "cargo_c.bbclass",
> +       "bin_package.bbclass",
> +       "python_poetry_core.bbclass",
> +       "distro_features_check.bbclass",
> +       "lib_package.bbclass",
> +       "python_setuptools_build_meta.bbclass",
> +       "populate_sdk_base.bbclass",
> +       "features_check.bbclass",
> +       "python_pep517.bbclass",
> +       "cargo_common.bbclass",
> +       "populate_sdk_ext.bbclass",
> +       "rootfs_ipk.bbclass",
> +       "rootfs_deb.bbclass",
> +       "cpan_build.bbclass",
> +       "rootfs_rpm.bbclass",
> +       "python_flit_core.bbclass",
> +       "python_hatchling.bbclass",
> +       "image_types_wic.bbclass",
> +       "setuptools3_legacy.bbclass",
> +       "package_rpm.bbclass",
> +       "package_deb.bbclass",
> +       "package_ipk.bbclass",
> +       "package_pkgdata.bbclass"
> +)
>

Hi Saul,

Having this list ordered would make reading easier.

Jose


> +
> +def get_tinfoil():
> +    scripts_path =3D os.path.dirname(os.path.realpath(__file__))
> +    lib_path =3D scripts_path + '/lib'
> +    sys.path =3D sys.path + [lib_path]
> +    import scriptpath
> +    scriptpath.add_bitbake_lib_path()
> +    import bb.tinfoil
> +    tinfoil =3D bb.tinfoil.Tinfoil()
> +    tinfoil.prepare()
> +    # tinfoil.logger.setLevel(logging.WARNING)
> +    return tinfoil
> +
> +if __name__=3D=3D'__main__':
> +    import argparse, shutil
> +
> +    parser =3D argparse.ArgumentParser(description=3D'Sanity checker for
> bbclasses')
> +    parser.add_argument("--verbose", default=3DFalse, action=3D"store_tr=
ue")
> +    args =3D parser.parse_args()
> +
> +    tinfoil =3D get_tinfoil()
> +
> +    bbpath =3D tinfoil.config_data.getVar('BBPATH').split(':')
> +    for path in bbpath:
> +        with os.scandir(path) as it:
> +            for entry in it:
> +                if "classes" in entry.name and entry.is_dir():
> +                    with os.scandir(path + "/" + entry.name) as classes:
> +                        for c in classes:
> +                            #
> +                            # Check for underscore in bbclass filename
> +                            #
> +                            if c.name.endswith(".bbclass") and "_" in
> c.name and not c.name in oecore_known_classes:
> +
> +                                print("Warning: BBClass file name
> contains '_': " + path + "/" + entry.name + "/" + c.name)
> +                            #
> +                            # Check for '-' in exported functions and
> tasks
> +                            #
> +                            with open(path + "/" + entry.name + "/" +
> c.name) as f:
> +                                for line in f.readlines():
> +                                    if line.startswith("addtask ") and
> "-" in line:
> +                                        print("Warning: addtask contains
> '-': " + path + "/" + entry.name + "/" + c.name + ": " + line)
> +                                    if line.startswith("EXPORT_FUNCTIONS
> ") and "-" in line:
> +                                        print("Warning: EXPORT_FUNCTIONS
> contains '-': " + path + "/" + entry.name + "/" + c.name + ": " + line)
> +
> +    tinfoil.shutdown()
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194436):
> https://lists.openembedded.org/g/openembedded-core/message/194436
> Mute This Topic: https://lists.openembedded.org/mt/104005172/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b6449b061011f1da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Saul Wold &lt;<a href=3D"mailto:sgw@b=
igsur.com">sgw@bigsur.com</a>&gt; escreveu (domingo, 28/01/2024 =C3=A0(s) 0=
0:04):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">FIXES [YO=
CTO #14235]<br>
<br>
This script is a starting point for a &quot;linter&quot; for bbclass files.=
<br>
Currently it will check for &#39;_&#39; in the bbclass filename and &#39;-&=
#39; in<br>
addtask or EXPORT_FUNCTION. It will print warnings only no errors.<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@bigsur.com" target=3D"_b=
lank">sgw@bigsur.com</a>&gt;<br>
---<br>
=C2=A0scripts/check-bbclasses | 109 +++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 109 insertions(+)<br>
=C2=A0create mode 100755 scripts/check-bbclasses<br>
<br>
diff --git a/scripts/check-bbclasses b/scripts/check-bbclasses<br>
new file mode 100755<br>
index 00000000000..ea525b2d118<br>
--- /dev/null<br>
+++ b/scripts/check-bbclasses<br>
@@ -0,0 +1,109 @@<br>
+#!/usr/bin/env python3<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: GPL-2.0-only<br>
+#<br>
+# This script checks for bbclass like a linter can gives a<br>
+# warning if any of the following issues:<br>
+# * bbclass filename contains a &#39;_&#39; unless in the know list<br>
+# * either an &#39;addtask&#39; or &#39;EXPORT_FUNCTION&#39; name contains=
 a &#39;-&#39;<br>
+#<br>
+<br>
+import sys, os, subprocess, re, shutil<br>
+<br>
+# List of known classes with &#39;_&#39; in OE-Core<br>
+oecore_known_classes =3D (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;test_events.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;migrate_localcount.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;copyleft_compliance.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sign_ipk.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;multilib_global.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;useradd_base.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rm_work_and_downloads.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sign_rpm.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rm_work.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sign_package_feed.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;copyleft_filter.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;relative_symlinks.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;recipe_sanity.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;metadata_scm.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_pyo3.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;multilib_script.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;multilib_header.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;compress_doc.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;populate_sdk.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;license_image.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_maturin.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_setuptools3_rust.bbclass&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;image_types.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cargo_c.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bin_package.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_poetry_core.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;distro_features_check.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;lib_package.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_setuptools_build_meta.bbclass&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;populate_sdk_base.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;features_check.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_pep517.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cargo_common.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;populate_sdk_ext.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rootfs_ipk.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rootfs_deb.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cpan_build.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rootfs_rpm.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_flit_core.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python_hatchling.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;image_types_wic.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;setuptools3_legacy.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;package_rpm.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;package_deb.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;package_ipk.bbclass&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;package_pkgdata.bbclass&quot;<br>
+)<br></blockquote><div><br>Hi Saul,<br><br></div><div>Having this list ord=
ered would make reading easier.<br><br>Jose<br>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+<br>
+def get_tinfoil():<br>
+=C2=A0 =C2=A0 scripts_path =3D os.path.dirname(os.path.realpath(__file__))=
<br>
+=C2=A0 =C2=A0 lib_path =3D scripts_path + &#39;/lib&#39;<br>
+=C2=A0 =C2=A0 sys.path =3D sys.path + [lib_path]<br>
+=C2=A0 =C2=A0 import scriptpath<br>
+=C2=A0 =C2=A0 scriptpath.add_bitbake_lib_path()<br>
+=C2=A0 =C2=A0 import bb.tinfoil<br>
+=C2=A0 =C2=A0 tinfoil =3D bb.tinfoil.Tinfoil()<br>
+=C2=A0 =C2=A0 tinfoil.prepare()<br>
+=C2=A0 =C2=A0 # tinfoil.logger.setLevel(logging.WARNING)<br>
+=C2=A0 =C2=A0 return tinfoil<br>
+<br>
+if __name__=3D=3D&#39;__main__&#39;:<br>
+=C2=A0 =C2=A0 import argparse, shutil<br>
+<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(description=3D&#39;Sanity=
 checker for bbclasses&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--verbose&quot;, default=3DFalse, =
action=3D&quot;store_true&quot;)<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 tinfoil =3D get_tinfoil()<br>
+<br>
+=C2=A0 =C2=A0 bbpath =3D tinfoil.config_data.getVar(&#39;BBPATH&#39;).spli=
t(&#39;:&#39;)<br>
+=C2=A0 =C2=A0 for path in bbpath:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with os.scandir(path) as it:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for entry in it:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;classes&q=
uot; in <a href=3D"http://entry.name" rel=3D"noreferrer" target=3D"_blank">=
entry.name</a> and entry.is_dir():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with=
 os.scandir(path + &quot;/&quot; + <a href=3D"http://entry.name" rel=3D"nor=
eferrer" target=3D"_blank">entry.name</a>) as classes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for c in classes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # Check for underscore in bbclass filename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if c.name.endswith(&quot;.bbclass&quot;) and &quot=
;_&quot; in <a href=3D"http://c.name" rel=3D"noreferrer" target=3D"_blank">=
c.name</a> and not <a href=3D"http://c.name" rel=3D"noreferrer" target=3D"_=
blank">c.name</a> in oecore_known_classes:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Warning: BBClass file na=
me contains &#39;_&#39;: &quot; + path + &quot;/&quot; + <a href=3D"http://=
entry.name" rel=3D"noreferrer" target=3D"_blank">entry.name</a> + &quot;/&q=
uot; + <a href=3D"http://c.name" rel=3D"noreferrer" target=3D"_blank">c.nam=
e</a>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # Check for &#39;-&#39; in exported functions and =
tasks<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 with open(path + &quot;/&quot; + <a href=3D"http:/=
/entry.name" rel=3D"noreferrer" target=3D"_blank">entry.name</a> + &quot;/&=
quot; + <a href=3D"http://c.name" rel=3D"noreferrer" target=3D"_blank">c.na=
me</a>) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f.readlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith(&qu=
ot;addtask &quot;) and &quot;-&quot; in line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&q=
uot;Warning: addtask contains &#39;-&#39;: &quot; + path + &quot;/&quot; + =
<a href=3D"http://entry.name" rel=3D"noreferrer" target=3D"_blank">entry.na=
me</a> + &quot;/&quot; + <a href=3D"http://c.name" rel=3D"noreferrer" targe=
t=3D"_blank">c.name</a> + &quot;: &quot; + line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith(&qu=
ot;EXPORT_FUNCTIONS &quot;) and &quot;-&quot; in line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&q=
uot;Warning: EXPORT_FUNCTIONS contains &#39;-&#39;: &quot; + path + &quot;/=
&quot; + <a href=3D"http://entry.name" rel=3D"noreferrer" target=3D"_blank"=
>entry.name</a> + &quot;/&quot; + <a href=3D"http://c.name" rel=3D"noreferr=
er" target=3D"_blank">c.name</a> + &quot;: &quot; + line)<br>
+<br>
+=C2=A0 =C2=A0 tinfoil.shutdown()<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194436): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194436" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194436</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104005172/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104005172/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000b6449b061011f1da--

