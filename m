Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F50C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 21:50:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.5791.1703195391501127208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 13:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=X+F/bCW/;
 spf=pass (domain: snapchat.com, ip: 209.85.218.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a235eb41251so156550666b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 13:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1703195389; x=1703800189; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=af6BmGlHewibbXS4EM58Vj1c+hmSpJaaJOERsgnSSwU=;
        b=X+F/bCW/MfG98zTbVVmMQI2+28Pu/RstS73PtBwwXbOapW7mKzFf+/EfUQ5vNuzBZP
         IGhubHGQOPQXOgxhjhcV8SYlZq/FzQUAXndggqMCqYrpwC1i5LmjTWgPKWN6grE8gdpT
         jn4raJYuhhL22P7E6QagSDHKC+C2EI9U8qbNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703195389; x=1703800189;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=af6BmGlHewibbXS4EM58Vj1c+hmSpJaaJOERsgnSSwU=;
        b=V7DREreGCZSikwwSpwsb639+D/Sgv50K+nGQBdtEBETvj9zDiVRVjsfqMRI3K8xWCm
         GWY0e+m243HRBhrvHvUtqa0ja1iGeshYVp6ZCN45qU9yBneJuBlkEFv2wQeE/Mn89evf
         co3QyLoh7I2APwOt42Clx5bjUBN/Pr2f3tds1MkTjucUR2WmTnRWgHn1HzzL7HzTdzCN
         3RF04NPErqDAaO5IIQTHGsrrY8wZ7n7iSeidOc3vwcZXvtI2yeKysI5Nr4fx4v1kxN5t
         m1zVNRwrQBx03CMC4GqaAgp03ni4XOmlg2S8E3QdfiLu8pAcO5DaQdVzoYa3Padso80i
         wWjQ==
X-Gm-Message-State: AOJu0YyASqOCvAWH+tkPa3NuffmpWrwoLErYX4eftmwRr/pEJg+7BVOJ
	vHEtjMjlrFSvDiSXmYO7tC87ybutvHwop8M9/UVOpxb93f0JSZrTZacy8GppAKME4Q==
X-Google-Smtp-Source: AGHT+IH1AjP2yIocW7iBitfwKDN2H/6zqJmWpaXGMi2+QHTqtlX62ziBPn58mvXJIYSdqGTISEzR2OW16Ow2m1dd0JA=
X-Received: by 2002:a17:906:4e88:b0:a26:a35e:31f8 with SMTP id
 v8-20020a1709064e8800b00a26a35e31f8mr173804eju.65.1703195389515; Thu, 21 Dec
 2023 13:49:49 -0800 (PST)
MIME-Version: 1.0
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 21 Dec 2023 22:49:38 +0100
Message-ID: <CAHUKmYaFA8_eHrSCqknXqDfPfkwySdjqxWKvo6thuAAmD4guNw@mail.gmail.com>
Subject: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: multipart/alternative; boundary="0000000000002cfab7060d0c1409"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 21:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192850

--0000000000002cfab7060d0c1409
Content-Type: text/plain; charset="UTF-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

The function do_symlink_kernsrc is not reentrant in the case where S is
defined
to a non-default value. This causes build-failures e.g. when building
linux-yocto, then updating
poky to a commit which modifies kernel.bbclass, and then building
linux-yocto again.

Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15325

Tested with a recipe "my-custom-linux" which unpacks sources to a custom
${S} directory
and ran symlink_kernsrc several times:
$ bitbake -f -c symlink_kernsrc my-custom-linux

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/kernel.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass
b/meta/classes-recipe/kernel.bbclass
index 9ff37f5c38..45b63f1fa1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
             # drop trailing slash, so that os.symlink(kernsrc, s) doesn't
use s as
             # directory name and fail
             s = s[:-1]
-        if d.getVar("EXTERNALSRC"):
+        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
         else:
             import shutil
+            # perform idempotent/reentrant copy
+            s_copy = s + ".orig"
+            if not os.path.isdir(s_copy):
+                shutil.copytree(s, s_copy, ignore_dangling_symlinks=True)
+            bb.utils.remove(s, recurse=True)
+            shutil.copytree(s_copy, s, ignore_dangling_symlinks=True)
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-- 
2.34.1

--0000000000002cfab7060d0c1409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier=
@snap.com">ecordonnier@snap.com</a>&gt;<br><br>The function do_symlink_kern=
src is not reentrant in the case where S is defined<br>to a non-default val=
ue. This causes build-failures e.g. when building linux-yocto, then updatin=
g<br>poky to a commit which modifies kernel.bbclass, and then building linu=
x-yocto again.<br><br>Bugzilla: <a href=3D"https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D15325">https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D15325</a><br><br>Tested with a recipe &quot;my-custom-linux&quot; which=
 unpacks sources to a custom ${S} directory<br>and ran symlink_kernsrc seve=
ral times:<br>$ bitbake -f -c symlink_kernsrc my-custom-linux<br><br>Signed=
-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com">eco=
rdonnier@snap.com</a>&gt;<br>---<br>=C2=A0meta/classes-recipe/kernel.bbclas=
s | 8 +++++++-<br>=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br><=
br>diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ke=
rnel.bbclass<br>index 9ff37f5c38..45b63f1fa1 100644<br>--- a/meta/classes-r=
ecipe/kernel.bbclass<br>+++ b/meta/classes-recipe/kernel.bbclass<br>@@ -189=
,11 +189,17 @@ python do_symlink_kernsrc () {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# drop trailing slash, so that os.symlink(kernsrc, =
s) doesn&#39;t use s as<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
# directory name and fail<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s =3D s[:-1]<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;EXTERNALS=
RC&quot;):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;EXTERNALSRC&qu=
ot;) and not os.path.islink(s):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# With EXTERNALSRC S will not be wiped so we can symlink to it<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(s, kernsrc)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0import shutil<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# perform idempotent/reentrant copy<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s_copy =3D s + &quot;.orig&quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if not os.path.isdir(s_copy):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(s, s_copy, ignore_dangling_s=
ymlinks=3DTrue)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remo=
ve(s, recurse=3DTrue)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.=
copytree(s_copy, s, ignore_dangling_symlinks=3DTrue)<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(s, kernsrc)<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(kernsrc, s)<br>=C2=A0}<br>-- <br>=
2.34.1<br></div>

--0000000000002cfab7060d0c1409--

