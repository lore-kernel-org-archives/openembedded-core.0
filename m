Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.3212.1610725416187096312
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 07:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=SIhWkb/E;
 spf=pass (domain: google.com, ip: 209.85.166.48, mailfrom: gmouse@google.com)
Received: by mail-io1-f48.google.com with SMTP id w18so18953293iot.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 07:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=OaAco4TnwTLw6lXwukVW/y4Md0U5SsaPWHqghPhvsWM=;
        b=SIhWkb/EPY4ro7gxxBg8iu2NYYpBHIkAaZr/TvQQ9SCr0RUrH8BrQHfPDgd64Ft0Ex
         zL8NcuRKXL9rjjimz3pQDAZzObqlmW72ldQ7+1Wbxlv9dS9yhTEQkCrYos6kEtSbpJFq
         GcwFkIPzXEWke77O6X1IWyMvHXmU1g+btgYbceTtNuA/QhEbQj9/oehs9tghC8O2akWV
         o/O44gdz4qTttLVuwvPvUZG/3U3f12O4W0wWhO25YHxbVqA20RCl0QRBukdPdrsYtSko
         b65h7Gd9Q2psAzVPUGh6l/wSSCZ3Q8D0hhQFmnOIPwQ8Mo2EEZPgHE79wKRavb39vgmV
         nyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OaAco4TnwTLw6lXwukVW/y4Md0U5SsaPWHqghPhvsWM=;
        b=cRkad0K4LAvy4/vJMNw+3heXyOVcHbDDMFxzdIN/c7o9nR6jftrJBsIqwCs70ZaUIY
         EBP/zq/FzalIZV8xEfgs9OmTt4OA8Syt0xm1nMN85oaKz2PhQK5gUxIXHjx501v5VYl9
         yKIq7Nr4/bp8e45trLdKaAxugTGJq1nhkj8jXz3cRGlvhO6BhujItKNB1wlPIRYQQHeI
         zMaPbbcS2kzTBOhCjGcXY2Ij3thbimkByxojPdo41kux2AIIjCWGT4FQjkj1O2g/vwmO
         MHVB34Pk81MEPzyS7CvgdgSSiCvqadEhwFOA8nSz+joGBqNAxpYKxlECpKvw10RlDzXC
         pzSA==
X-Gm-Message-State: AOAM532QpfS9gAPPakmAcFaHActGk8n/zsy5U3Sl8wLFj9/Iz530jDq/
	Bjbxz38re1zYAQaNW8xVaLvH6h72Bo4oWmYbkSJhnSLDLFl4SJSB
X-Google-Smtp-Source: ABdhPJwyZ1GetCVyvdFQ4ugP39XWRYTBdpbdtBpCMLw5V+xUKEPueqK8Qf7InJ5wkCD9NESIcKbZMlzRIhXO57xcffo=
X-Received: by 2002:a05:6e02:12e2:: with SMTP id l2mr11615085iln.91.1610725414649;
 Fri, 15 Jan 2021 07:43:34 -0800 (PST)
MIME-Version: 1.0
From: "Anton Kachalov" <rnouse@google.com>
Date: Fri, 15 Jan 2021 16:43:23 +0100
Message-ID: <CADVsX8_aT--CwO+ppq68PF-taTiARr_Bqyx5D_UGZ3zXijG-6w@mail.gmail.com>
Subject: [poky][PATCH] rootfs: add option to allow delayed postinsts on read-only rootfs
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002c258f05b8f23c0c"

--0000000000002c258f05b8f23c0c
Content-Type: text/plain; charset="UTF-8"

Example use case in OpenBMC: rootfs is squashfs and the system has either
overlayfs for whole rootfs or for some parts (e.g. /etc).

This option will allow to create migration one-shot postinsts using
"pkg_postinst_ontarget_${PN}" routines defined in recipes to fix
files under upper workdir in overlayfs.

Signed-off-by: Anton D. Kachalov <rnouse@google.com>
---
 meta/classes/image.bbclass | 2 +-
 meta/lib/oe/rootfs.py      | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 045f4494c8..3239d5cf5e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -33,7 +33,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs
stateless-rootfs empty-root-password allow-empty-password allow-root-login
post-install-logging"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs
read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password
allow-empty-password allow-root-login post-install-logging"

 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4b747dd0f4..249c685dcf 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -217,6 +217,9 @@ class Rootfs(object, metaclass=ABCMeta):
             self.progress_reporter.next_stage()

         if bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
+                         True, False, self.d) and \
+           not bb.utils.contains("IMAGE_FEATURES",
+                         "read-only-rootfs-delayed-postinsts",
                          True, False, self.d):
             delayed_postinsts = self._get_delayed_postinsts()
             if delayed_postinsts is not None:
-- 
2.30.0.284.gd98b1dd5eaa7-goog

--0000000000002c258f05b8f23c0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Example use case in OpenBMC: rootfs is squashfs and the sy=
stem has either<br>overlayfs for whole rootfs or for some parts (e.g. /etc)=
.<br><br>This option will allow to create migration one-shot postinsts usin=
g<br>&quot;pkg_postinst_ontarget_${PN}&quot; routines defined in recipes to=
 fix<br>files under upper workdir in overlayfs.<br><br>Signed-off-by: Anton=
 D. Kachalov &lt;<a href=3D"mailto:rnouse@google.com">rnouse@google.com</a>=
&gt;<br>---<br>=C2=A0meta/classes/image.bbclass | 2 +-<br>=C2=A0meta/lib/oe=
/rootfs.py =C2=A0 =C2=A0 =C2=A0| 3 +++<br>=C2=A02 files changed, 4 insertio=
ns(+), 1 deletion(-)<br><br>diff --git a/meta/classes/image.bbclass b/meta/=
classes/image.bbclass<br>index 045f4494c8..3239d5cf5e 100644<br>--- a/meta/=
classes/image.bbclass<br>+++ b/meta/classes/image.bbclass<br>@@ -33,7 +33,7=
 @@ INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>=C2=A0# IMAGE_FEATURES may co=
ntain any available package group<br>=C2=A0IMAGE_FEATURES ?=3D &quot;&quot;=
<br>=C2=A0IMAGE_FEATURES[type] =3D &quot;list&quot;<br>-IMAGE_FEATURES[vali=
ditems] +=3D &quot;debug-tweaks read-only-rootfs stateless-rootfs empty-roo=
t-password allow-empty-password allow-root-login post-install-logging&quot;=
<br>+IMAGE_FEATURES[validitems] +=3D &quot;debug-tweaks read-only-rootfs re=
ad-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow=
-empty-password allow-root-login post-install-logging&quot;<br>=C2=A0<br>=
=C2=A0# Generate companion debugfs?<br>=C2=A0IMAGE_GEN_DEBUGFS ?=3D &quot;0=
&quot;<br>diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>ind=
ex 4b747dd0f4..249c685dcf 100644<br>--- a/meta/lib/oe/rootfs.py<br>+++ b/me=
ta/lib/oe/rootfs.py<br>@@ -217,6 +217,9 @@ class Rootfs(object, metaclass=
=3DABCMeta):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.progre=
ss_reporter.next_stage()<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
bb.utils.contains(&quot;IMAGE_FEATURES&quot;, &quot;read-only-rootfs&quot;,=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 True, False, self.d) and \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 not bb.utils.contains(&quot;IMAGE_FEATURES&quot;,<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;read-only-rootfs-delayed-postinsts&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 True, False,=
 self.d):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delayed_postin=
sts =3D self._get_delayed_postinsts()<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if delayed_postinsts is not None:<br>-- <br>2.30.0.284.gd98b1=
dd5eaa7-goog<br><br></div>

--0000000000002c258f05b8f23c0c--
