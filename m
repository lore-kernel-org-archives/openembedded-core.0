Return-Path: <dchvs11@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D30CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 05:19:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.12391.1757999969778323294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 22:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XhJavJJa;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: dchvs11@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0415e03e25so633175566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 22:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757999968; x=1758604768; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGs++NURHpGpxGg0ICXY3ZbQ5+FGCuFTdbAPj5l0KvY=;
        b=XhJavJJaLwIQeKFPrzsYzysRUTDv7Fe6X6GLs0vGZ5Yu/3P+5Ii4LoIYOWxP7OXVi7
         B7xwyZ7e+Gr19wuDvdy7QjOHeJMfCC9hQ6wxr4217yEWnZ6sGrwKMFFoSg5apAlblHTb
         P/ojTnybnGr7m4xy99dK363h9bitasN8Rcwi5ALmtublWgj5FMcGj60pKYuzQuQs/v0B
         ebQwNe2XDFV4S6ttjHgpFREkAh1lPu16M6JXJidqmoa9VRKef+bBkIblEMpDkvbK/7Px
         55VuYeVQmALWdRsMAFHdZZna6o6ycbLCXTSwc40JEYfqbehXjLFE2SXdkla8kJlhbXLw
         Gfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757999968; x=1758604768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGs++NURHpGpxGg0ICXY3ZbQ5+FGCuFTdbAPj5l0KvY=;
        b=VnKwq63mgQPIaMm9XkJ02+Mg4dhv9JzX2Pkf5sf0PeywiaPc3P/0ebKhqxd0/hsHsK
         95+UWi+7ve9SbNh8EWHWqYpRVJYMW5NTLu0khql02m7EyE6AlULvEgzOh7IZchfWbwPA
         2YcA0niVDSbjFZE2bOz1ANyOF2mtImfUEo2RB4dznkbYFHTQWoG8fdQkU5jP1dNOLAHt
         z3HpkMq3dU/5nT0ix65O1cSXptmFF6bWIEu4rtq0ItPZWxtk6yi0ttHZ/BSl9Qp8/fNx
         zVxngb+wvbJrAPMUA7HFeWo7yPxbaN/qzIXGSJ3UvL5gEQdr3pyvF9mQIY7u/hGctvHL
         AEHg==
X-Gm-Message-State: AOJu0YxeYG9lGwyq3888ZgvYGlSHYL0OGt3gnSWQZfly5KXjFpCmO6NV
	oyqBSWBe2yBfrMClvJTNB5VI/M2AqVuh8vpFxdQXPEgqw/FG0WpCE7u1y4VTlIFiWJNMNbOPQhC
	LQDfzQ/GTzslECvnIKiQURjv2p+MR2zYI4QAH
X-Gm-Gg: ASbGnctCuNS2IWFnlRMWYv00JCDxGUncpM7GImQZZlHDfqCLBya2t4dzSaGGOxM0M5b
	qVLux0nyHOO0M4AkfaYW1pg0bah+VlRy+HJAYh1qGIOqUsYkzsrIXGyi9RaAfZRPpD75GzcYbEE
	57EHI29tv3Q6SBsEgUf7vJlydo4mrlyhqaU2fiCIIO+EWve/2PZsIeUf3L7ycWeuW2t8hCGKkZW
	dzkQ5c=
X-Google-Smtp-Source: AGHT+IFngZ2LpvViNRuYBJrFajC+dBStXnx4uVnsYP9/BYKMAee4uyqiJOB2IDMlXppp9hGSAXMUqod35ucLKw6zQMk=
X-Received: by 2002:a17:907:970d:b0:b04:39af:bee9 with SMTP id
 a640c23a62f3a-b07c33532admr1281080266b.0.1757999967521; Mon, 15 Sep 2025
 22:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <WJh8.1757808627371731758.QLNE@lists.yoctoproject.org> <FB6D5644-3468-4D15-AE3C-9E57A3630D29@arm.com>
In-Reply-To: <FB6D5644-3468-4D15-AE3C-9E57A3630D29@arm.com>
From: Daniel Chaves <dchvs11@gmail.com>
Date: Mon, 15 Sep 2025 23:19:15 -0600
X-Gm-Features: AS18NWAutz1f7p_gs9i6T1Husy69tbtB_o3Esjwuv2F3V22fZ1ggAJg0Bn1waS4
Message-ID: <CANDCFSzzCcbwGd4-AA1A2p6Sc-mN0ZpBNeLvZo3qWYBbVDrDog@mail.gmail.com>
Subject: Re: [linux-yocto] [PATCH] poky: image_partition: add class file
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, 
	"linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>
Content-Type: multipart/mixed; boundary="000000000000948067063ee443df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223527

--000000000000948067063ee443df
Content-Type: multipart/alternative; boundary="000000000000948066063ee443dd"

--000000000000948066063ee443dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 When generating an image recipe, including image or core-image BBClasses
adds unnecessary steps like check_image_features and do_rootfs, which
assume a populated rootfs and prevent creating an empty one. This class
avoids those dependencies, providing a minimal way to build a valid, empty
base file system.

Attached below is the patch with corrected indentation, and also appended
as a file.

From 9b76df54cff406174baab45d6df73a8d34460b53 Mon Sep 17 00:00:00 2001
From: Daniel Chaves <dchvs11@gmail.com>
Date: Sat, 13 Sep 2025 14:56:32 -0600
Subject: [PATCH] poky: image_partition: add class file

Use this class to create partitions in your desired format. The
partition can be found in DEPLOY_DIR_IMAGE.

Signed-off-by: Daniel Chaves <dchvs11@gmail.com>
---
 meta/classes-recipe/image_partition.bbclass | 47 +++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/classes-recipe/image_partition.bbclass

diff --git a/meta/classes-recipe/image_partition.bbclass
b/meta/classes-recipe/image_partition.bbclass
new file mode 100644
index 0000000000..86558df82c
--- /dev/null
+++ b/meta/classes-recipe/image_partition.bbclass
@@ -0,0 +1,47 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Use this class to create partitions in your desired format. To get start=
ed:
+# 1. Create a recipe for the target partition.
+# 2. Inherit this class file.
+# 3. Define the partition metadata as follows:
+#      IMAGE_FSTYPES =3D "<ext4>"
+#      IMAGE_ROOTFS_SIZE =3D "<image_rootfs_size>"
+#    IMAGE_ROOTFS_SIZE must be specified in kilobytes.
+# 4. By default this produces an empty filesystem. If you want to
include packages,
+#    add them to PACKAGE_INSTALL to fill it with what you need.
+# The partition can be found in DEPLOY_DIR_IMAGE.
+
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
+COPY_LIC_MANIFEST =3D "0"
+COPY_LIC_DIRS =3D "0"
+
+FORCE_RO_REMOVE =3D "1"
+
+PACKAGE_INSTALL =3D ""
+
+inherit image nopackages
+
+def check_image_features(d):
+    pass
+
+fakeroot python do_rootfs () {
+    pass
+}
+
+SSTATE_SKIP_CREATION:task-image-complete =3D "0"
+SSTATE_SKIP_CREATION:task-image-qa =3D "0"
+
+python sstate_report_unihash() {
+    report_unihash =3D getattr(bb.parse.siggen, 'report_unihash', None)
+
+    if report_unihash:
+        ss =3D sstate_state_fromvars(d)
+        if ss['task'] =3D=3D 'image_complete':
+            os.environ['PSEUDO_DISABLED'] =3D '1'
+        report_unihash(os.getcwd(), ss['task'], d)
+}


Regards
Daniel

On Sun, Sep 14, 2025 at 7:37=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> Hi,
>
> This should go the openembedded-core@lists.openembedded.org <mailto:
> openembedded-core@lists.openembedded.org> list, but what does this give
> over just using an image recipe, considering the output of that can be
> called a =E2=80=98partition=E2=80=99 if you set IMAGE_FSTYPES=3Dext4.
>
> Ross
>
> > On 14 Sep 2025, at 01:10, Daniel via lists.yoctoproject.org <dchvs11=3D
> gmail.com@lists.yoctoproject.org> wrote:
> >
> > From 9b76df54cff406174baab45d6df73a8d34460b53 Mon Sep 17 00:00:00 2001
> > From: Daniel Chaves <dchvs11@gmail.com>
> > Date: Sat, 13 Sep 2025 14:56:32 -0600
> > Subject: [PATCH] poky: image_partition: add class file
> >
> > Use this class to create partitions in your desired format. The
> > partition can be found in DEPLOY_DIR_IMAGE.
> >
> > Signed-off-by: Daniel Chaves <dchvs11@gmail.com>
> > ---
> > meta/classes-recipe/image_partition.bbclass | 47 +++++++++++++++++++++
> > 1 file changed, 47 insertions(+)
> > create mode 100644 meta/classes-recipe/image_partition.bbclass
> >
> > diff --git a/meta/classes-recipe/image_partition.bbclass
> b/meta/classes-recipe/image_partition.bbclass
> > new file mode 100644
> > index 0000000000..86558df82c
> > --- /dev/null
> > +++ b/meta/classes-recipe/image_partition.bbclass
> > @@ -0,0 +1,47 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +# Use this class to create partitions in your desired format. To get
> started:
> > +# 1. Create a recipe for the target partition.
> > +# 2. Inherit this class file.
> > +# 3. Define the partition metadata as follows:
> > +# IMAGE_FSTYPES =3D "<ext4>"
> > +# IMAGE_ROOTFS_SIZE =3D "<image_rootfs_size>"
> > +# IMAGE_ROOTFS_SIZE must be specified in kilobytes.
> > +# 4. By default this produces an empty filesystem. If you want to
> include packages,
> > +# add them to PACKAGE_INSTALL to fill it with what you need.
> > +# The partition can be found in DEPLOY_DIR_IMAGE.
> > +
> > +IMAGE_FEATURES =3D ""
> > +IMAGE_LINGUAS =3D ""
> > +COPY_LIC_MANIFEST =3D "0"
> > +COPY_LIC_DIRS =3D "0"
> > +
> > +FORCE_RO_REMOVE =3D "1"
> > +
> > +PACKAGE_INSTALL =3D ""
> > +
> > +inherit image nopackages
> > +
> > +def check_image_features(d):
> > + pass
> > +
> > +fakeroot python do_rootfs () {
> > + pass
> > +}
> > +
> > +SSTATE_SKIP_CREATION:task-image-complete =3D "0"
> > +SSTATE_SKIP_CREATION:task-image-qa =3D "0"
> > +
> > +python sstate_report_unihash() {
> > + report_unihash =3D getattr(bb.parse.siggen, 'report_unihash', None)
> > +
> > + if report_unihash:
> > + ss =3D sstate_state_fromvars(d)
> > + if ss['task'] =3D=3D 'image_complete':
> > + os.environ['PSEUDO_DISABLED'] =3D '1'
> > + report_unihash(os.getcwd(), ss['task'], d)
> > +}
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15646):
> https://lists.yoctoproject.org/g/linux-yocto/message/15646
> > Mute This Topic: https://lists.yoctoproject.org/mt/115231333/6875888
> > Group Owner: linux-yocto+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/linux-yocto/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000948066063ee443dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>
<div>
<div><span class=3D"gmail-gI">When generating an image recipe, including <c=
ode>image</code> or <code>core-image</code> BBClasses adds unnecessary step=
s like <code>check_image_features</code> and <code>do_rootfs</code>, which =
assume a populated rootfs and prevent creating an empty one. This class avo=
ids those dependencies, providing a minimal way to build a valid, empty bas=
e file system.</span></div><div><br></div><div>Attached below is the patch =
with corrected indentation,=C2=A0and also appended as a file.</div><div><br=
></div>
<pre>From 9b76df54cff406174baab45d6df73a8d34460b53 Mon Sep 17 00:00:00 2001
From: Daniel Chaves &lt;<a href=3D"mailto:dchvs11@gmail.com">dchvs11@gmail.=
com</a>&gt;
Date: Sat, 13 Sep 2025 14:56:32 -0600
Subject: [PATCH] poky: image_partition: add class file

Use this class to create partitions in your desired format. The
partition can be found in DEPLOY_DIR_IMAGE.

Signed-off-by: Daniel Chaves &lt;<a href=3D"mailto:dchvs11@gmail.com">dchvs=
11@gmail.com</a>&gt;
---
 meta/classes-recipe/image_partition.bbclass | 47 +++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/classes-recipe/image_partition.bbclass

diff --git a/meta/classes-recipe/image_partition.bbclass b/meta/classes-rec=
ipe/image_partition.bbclass
new file mode 100644
index 0000000000..86558df82c
--- /dev/null
+++ b/meta/classes-recipe/image_partition.bbclass
@@ -0,0 +1,47 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Use this class to create partitions in your desired format. To get start=
ed:
+# 1. Create a recipe for the target partition.
+# 2. Inherit this class file.
+# 3. Define the partition metadata as follows:
+#      IMAGE_FSTYPES =3D &quot;&lt;ext4&gt;&quot;
+#      IMAGE_ROOTFS_SIZE =3D &quot;&lt;image_rootfs_size&gt;&quot;
+#    IMAGE_ROOTFS_SIZE must be specified in kilobytes.
+# 4. By default this produces an empty filesystem. If you want to include =
packages,
+#    add them to PACKAGE_INSTALL to fill it with what you need.
+# The partition can be found in DEPLOY_DIR_IMAGE.
+
+IMAGE_FEATURES =3D &quot;&quot;
+IMAGE_LINGUAS =3D &quot;&quot;
+COPY_LIC_MANIFEST =3D &quot;0&quot;
+COPY_LIC_DIRS =3D &quot;0&quot;
+
+FORCE_RO_REMOVE =3D &quot;1&quot;
+
+PACKAGE_INSTALL =3D &quot;&quot;
+
+inherit image nopackages
+
+def check_image_features(d):
+    pass
+
+fakeroot python do_rootfs () {
+    pass
+}
+
+SSTATE_SKIP_CREATION:task-image-complete =3D &quot;0&quot;
+SSTATE_SKIP_CREATION:task-image-qa =3D &quot;0&quot;
+
+python sstate_report_unihash() {
+    report_unihash =3D getattr(bb.parse.siggen, &#39;report_unihash&#39;, =
None)
+
+    if report_unihash:
+        ss =3D sstate_state_fromvars(d)
+        if ss[&#39;task&#39;] =3D=3D &#39;image_complete&#39;:
+            os.environ[&#39;PSEUDO_DISABLED&#39;] =3D &#39;1&#39;
+        report_unihash(os.getcwd(), ss[&#39;task&#39;], d)
+}
</pre>
</div>
</div><br></div><div>Regards</div>Daniel</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 1=
4, 2025 at 7:37=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@ar=
m.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi,<br>
<br>
This should go the <a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;mail=
to:<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_b=
lank">openembedded-core@lists.openembedded.org</a>&gt; list, but what does =
this give over just using an image recipe, considering the output of that c=
an be called a =E2=80=98partition=E2=80=99 if you set IMAGE_FSTYPES=3Dext4.=
<br>
<br>
Ross<br>
<br>
&gt; On 14 Sep 2025, at 01:10, Daniel via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> &l=
t;dchvs11=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_=
blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; From 9b76df54cff406174baab45d6df73a8d34460b53 Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Daniel Chaves &lt;<a href=3D"mailto:dchvs11@gmail.com" target=3D=
"_blank">dchvs11@gmail.com</a>&gt;<br>
&gt; Date: Sat, 13 Sep 2025 14:56:32 -0600<br>
&gt; Subject: [PATCH] poky: image_partition: add class file<br>
&gt; <br>
&gt; Use this class to create partitions in your desired format. The<br>
&gt; partition can be found in DEPLOY_DIR_IMAGE.<br>
&gt; <br>
&gt; Signed-off-by: Daniel Chaves &lt;<a href=3D"mailto:dchvs11@gmail.com" =
target=3D"_blank">dchvs11@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/classes-recipe/image_partition.bbclass | 47 +++++++++++++++++++++=
<br>
&gt; 1 file changed, 47 insertions(+)<br>
&gt; create mode 100644 meta/classes-recipe/image_partition.bbclass<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/image_partition.bbclass b/meta/classe=
s-recipe/image_partition.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..86558df82c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes-recipe/image_partition.bbclass<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +#<br>
&gt; +# Copyright OpenEmbedded Contributors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +# Use this class to create partitions in your desired format. To get =
started:<br>
&gt; +# 1. Create a recipe for the target partition.<br>
&gt; +# 2. Inherit this class file.<br>
&gt; +# 3. Define the partition metadata as follows:<br>
&gt; +# IMAGE_FSTYPES =3D &quot;&lt;ext4&gt;&quot;<br>
&gt; +# IMAGE_ROOTFS_SIZE =3D &quot;&lt;image_rootfs_size&gt;&quot;<br>
&gt; +# IMAGE_ROOTFS_SIZE must be specified in kilobytes.<br>
&gt; +# 4. By default this produces an empty filesystem. If you want to inc=
lude packages,<br>
&gt; +# add them to PACKAGE_INSTALL to fill it with what you need.<br>
&gt; +# The partition can be found in DEPLOY_DIR_IMAGE.<br>
&gt; +<br>
&gt; +IMAGE_FEATURES =3D &quot;&quot;<br>
&gt; +IMAGE_LINGUAS =3D &quot;&quot;<br>
&gt; +COPY_LIC_MANIFEST =3D &quot;0&quot;<br>
&gt; +COPY_LIC_DIRS =3D &quot;0&quot;<br>
&gt; +<br>
&gt; +FORCE_RO_REMOVE =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +PACKAGE_INSTALL =3D &quot;&quot;<br>
&gt; +<br>
&gt; +inherit image nopackages<br>
&gt; +<br>
&gt; +def check_image_features(d):<br>
&gt; + pass<br>
&gt; +<br>
&gt; +fakeroot python do_rootfs () {<br>
&gt; + pass<br>
&gt; +}<br>
&gt; +<br>
&gt; +SSTATE_SKIP_CREATION:task-image-complete =3D &quot;0&quot;<br>
&gt; +SSTATE_SKIP_CREATION:task-image-qa =3D &quot;0&quot;<br>
&gt; +<br>
&gt; +python sstate_report_unihash() {<br>
&gt; + report_unihash =3D getattr(bb.parse.siggen, &#39;report_unihash&#39;=
, None)<br>
&gt; +<br>
&gt; + if report_unihash:<br>
&gt; + ss =3D sstate_state_fromvars(d)<br>
&gt; + if ss[&#39;task&#39;] =3D=3D &#39;image_complete&#39;:<br>
&gt; + os.environ[&#39;PSEUDO_DISABLED&#39;] =3D &#39;1&#39;<br>
&gt; + report_unihash(os.getcwd(), ss[&#39;task&#39;], d)<br>
&gt; +}<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#15646): <a href=3D"https://lists.yoctoproject.org/=
g/linux-yocto/message/15646" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.yoctoproject.org/g/linux-yocto/message/15646</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11523133=
3/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/115231333/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:linux-yocto%2Bowner@lists.yoctoproject.=
org" target=3D"_blank">linux-yocto+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/linux-yocto/u=
nsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g=
/linux-yocto/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" target=3D"_b=
lank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000948066063ee443dd--

--000000000000948067063ee443df
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-poky-image_partition-add-class-file.patch"
Content-Disposition: attachment; 
	filename="0001-poky-image_partition-add-class-file.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mfm3r7mc0>
X-Attachment-Id: f_mfm3r7mc0

RnJvbSA5Yjc2ZGY1NGNmZjQwNjE3NGJhYWI0NWQ2ZGY3M2E4ZDM0NDYwYjUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYW5pZWwgQ2hhdmVzIDxkY2h2czExQGdtYWlsLmNvbT4KRGF0
ZTogU2F0LCAxMyBTZXAgMjAyNSAxNDo1NjozMiAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIHBva3k6
IGltYWdlX3BhcnRpdGlvbjogYWRkIGNsYXNzIGZpbGUKClVzZSB0aGlzIGNsYXNzIHRvIGNyZWF0
ZSBwYXJ0aXRpb25zIGluIHlvdXIgZGVzaXJlZCBmb3JtYXQuIFRoZQpwYXJ0aXRpb24gY2FuIGJl
IGZvdW5kIGluIERFUExPWV9ESVJfSU1BR0UuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2hhdmVz
IDxkY2h2czExQGdtYWlsLmNvbT4KLS0tCiBtZXRhL2NsYXNzZXMtcmVjaXBlL2ltYWdlX3BhcnRp
dGlvbi5iYmNsYXNzIHwgNDcgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NDcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvY2xhc3Nlcy1yZWNpcGUv
aW1hZ2VfcGFydGl0aW9uLmJiY2xhc3MKCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBl
L2ltYWdlX3BhcnRpdGlvbi5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9pbWFnZV9wYXJ0
aXRpb24uYmJjbGFzcwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44NjU1
OGRmODJjCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9pbWFnZV9wYXJ0
aXRpb24uYmJjbGFzcwpAQCAtMCwwICsxLDQ3IEBACisjCisjIENvcHlyaWdodCBPcGVuRW1iZWRk
ZWQgQ29udHJpYnV0b3JzCisjCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQKKyMKKwor
IyBVc2UgdGhpcyBjbGFzcyB0byBjcmVhdGUgcGFydGl0aW9ucyBpbiB5b3VyIGRlc2lyZWQgZm9y
bWF0LiBUbyBnZXQgc3RhcnRlZDoKKyMgMS4gQ3JlYXRlIGEgcmVjaXBlIGZvciB0aGUgdGFyZ2V0
IHBhcnRpdGlvbi4KKyMgMi4gSW5oZXJpdCB0aGlzIGNsYXNzIGZpbGUuCisjIDMuIERlZmluZSB0
aGUgcGFydGl0aW9uIG1ldGFkYXRhIGFzIGZvbGxvd3M6CisjICAgICAgSU1BR0VfRlNUWVBFUyA9
ICI8ZXh0ND4iCisjICAgICAgSU1BR0VfUk9PVEZTX1NJWkUgPSAiPGltYWdlX3Jvb3Rmc19zaXpl
PiIKKyMgICAgSU1BR0VfUk9PVEZTX1NJWkUgbXVzdCBiZSBzcGVjaWZpZWQgaW4ga2lsb2J5dGVz
LgorIyA0LiBCeSBkZWZhdWx0IHRoaXMgcHJvZHVjZXMgYW4gZW1wdHkgZmlsZXN5c3RlbS4gSWYg
eW91IHdhbnQgdG8gaW5jbHVkZSBwYWNrYWdlcywKKyMgICAgYWRkIHRoZW0gdG8gUEFDS0FHRV9J
TlNUQUxMIHRvIGZpbGwgaXQgd2l0aCB3aGF0IHlvdSBuZWVkLgorIyBUaGUgcGFydGl0aW9uIGNh
biBiZSBmb3VuZCBpbiBERVBMT1lfRElSX0lNQUdFLgorCitJTUFHRV9GRUFUVVJFUyA9ICIiCitJ
TUFHRV9MSU5HVUFTID0gIiIKK0NPUFlfTElDX01BTklGRVNUID0gIjAiCitDT1BZX0xJQ19ESVJT
ID0gIjAiCisKK0ZPUkNFX1JPX1JFTU9WRSA9ICIxIgorCitQQUNLQUdFX0lOU1RBTEwgPSAiIgor
Citpbmhlcml0IGltYWdlIG5vcGFja2FnZXMKKworZGVmIGNoZWNrX2ltYWdlX2ZlYXR1cmVzKGQp
OgorICAgIHBhc3MKKworZmFrZXJvb3QgcHl0aG9uIGRvX3Jvb3RmcyAoKSB7CisgICAgcGFzcwor
fQorCitTU1RBVEVfU0tJUF9DUkVBVElPTjp0YXNrLWltYWdlLWNvbXBsZXRlID0gIjAiCitTU1RB
VEVfU0tJUF9DUkVBVElPTjp0YXNrLWltYWdlLXFhID0gIjAiCisKK3B5dGhvbiBzc3RhdGVfcmVw
b3J0X3VuaWhhc2goKSB7CisgICAgcmVwb3J0X3VuaWhhc2ggPSBnZXRhdHRyKGJiLnBhcnNlLnNp
Z2dlbiwgJ3JlcG9ydF91bmloYXNoJywgTm9uZSkKKworICAgIGlmIHJlcG9ydF91bmloYXNoOgor
ICAgICAgICBzcyA9IHNzdGF0ZV9zdGF0ZV9mcm9tdmFycyhkKQorICAgICAgICBpZiBzc1sndGFz
ayddID09ICdpbWFnZV9jb21wbGV0ZSc6CisgICAgICAgICAgICBvcy5lbnZpcm9uWydQU0VVRE9f
RElTQUJMRUQnXSA9ICcxJworICAgICAgICByZXBvcnRfdW5paGFzaChvcy5nZXRjd2QoKSwgc3Nb
J3Rhc2snXSwgZCkKK30K
--000000000000948067063ee443df--

