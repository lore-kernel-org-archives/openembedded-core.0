Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468FEC98330
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 17:14:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12616.1768670069748103989
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jan 2026 09:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kdqL+1KT;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b7882e605so4088871e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 09:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768670067; cv=none;
        d=google.com; s=arc-20240605;
        b=OM0mHQqglNLReHP+FCGq5zPfu2ClWZfpU5eTyXo53OqcjscLXc5PBIHJ3ixNkLGXTV
         YbAHCETBks3z1QW9FUmvzuEPA81/gayW1EpX+xY+ZMCcllgkqOebiWgS5Kjm7fBHkEhl
         k1q0vyawrErikCRSsvDBBHrWqWEC/ep8CyNzOtJusbB1AelrYMMSPujOc1LYmtc26wzo
         eD8xlkmi4beq6QiiuzbaQp+G4lDlDJfRoRMlzXgqxd7LGbXdVGNDD03kus6R431JEXku
         OAdYYV8CL6Dt0VjZnRbfysktfUnTw9xvAkLfRPIy0/YtIjcPFhnc5ZFjd8/wZ4IiFwO3
         7qLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6/hlewhRTfvfofDlbzviDTMyUneVFsG7LqbLh1F8qwQ=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=NbuQPV4BXogTeCSL4G0RbdOQih8SmiP+g224qO6UFHHM1ZLriliCUI2XxK+Z53tGUY
         8YRs3HRZdhfwhvQlIMpJZqcCgiM1HxBqRu36hqlBlI/Rf5L/70qJEtL0/1xToB6Cyzey
         9IEc1OWLrtAD9QewRtvKF509HVhB6ixlnOr7+3CbTzuMKaVoKQu77IjU66Al+Lnw4lHH
         wivVzKpnqu4wxhWA9x02m+MAfjtqm4PEC1e2Md/unqMaet+s+BC9HOgAZIOiXel6A/DM
         qSIkIx0f0Lcd/GkLYS2Xr+KCieOF99Mi4e0Y4vkEqZnsLEtZzfy5Z9fbt7DDx86vk4Zu
         TFag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768670067; x=1769274867; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/hlewhRTfvfofDlbzviDTMyUneVFsG7LqbLh1F8qwQ=;
        b=kdqL+1KT/sc3e/tkJvOF/GVREFn/1WKLWW+zDEm35H9koE1t1qQ0yq6jBJ7odMxH1x
         +ZFh7qW1vibI7q9xEnCZvfgiI2BBx/fJnd1pHBbKX7Rl3timni5LOa6Kiq4Rm/+yoQBR
         KvsNEpzmtYxJmFX+V04hfY40d2RhZY+HdRwlalgEEsLB83odJDlWsTtyk+Qf55bzNhBu
         ROP9qKYmvL9MgXRonWYP9uuMqqh041VocYVFxxMdQW1allzoaNWe62+clSCtHCizjgKF
         pU3GAvSduHeEoPFhi/p5bvZF8dJyXSStFtzYv8lTwss1eofEUl1BCF4zMF1o1S2k60dJ
         n7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768670067; x=1769274867;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/hlewhRTfvfofDlbzviDTMyUneVFsG7LqbLh1F8qwQ=;
        b=EE+Ck89Uqpr2X5SWPFk3SMxxI30vaKt6slimlq0UKib0u3+cXC0Fn3/ELjmguQShz6
         D/bEgqT/VNW1X7r+z5/SU0HhhcLniSlD7w7uOT7/wAgbs3kx1Ou7gJvDZIdSfcvHMG2J
         AAhLBNeOkwzoKQiZGGrU9RwGrhuLiEsfv7+uK0vOnm72ckO1O/09yx4nfkFdHMkj3eM0
         JFpUQSsLLeK6pSm8zUk4jcDgYnpCaJOHGBnd8ask1VVLv+f6Lx0Wgnb5bg/MoMfQ5pM+
         U+uTJKy0ZfuUB+sEHq9D+5C0pOEWVciBCF/jjfi5XfLgualvRnGbLuhasw1zGDRurAxO
         R2eQ==
X-Gm-Message-State: AOJu0Yxlz2LOGaGcvym/YVhcg8PYehyJ/nOPg695CWv7uvMkwFT2FdTa
	+iQp9qE6KjFkFj506TuF5OUDuwLkN0T0+CAORmYcbkDwtGpDwWeKlhE5wVFBTp+/tU16faL+eLP
	147pXOOOAIIx0mKes1StwcIYV71Zyc3R8Iw==
X-Gm-Gg: AY/fxX5c2KadQEjEQbtrkwTE2qSaQL6XHgKkQ8SOTgN66DBsJNCBCTOValGoFKw3CF/
	E/1kLSfa2TzU8ZOiL+3vPgCKSmSIoGn8GlS6oT1tYz4RMW1tM+hVqBj23madG4b95qIAGSIxMT9
	7z5Q/dy6/3QMkIASN6Bgzm5bbCzKr44MVxZcgWLh+gmJacOnkDVzAgEu+y11WjCdyR9YaGhbq8S
	YlN4g2HKpd3iK+v010tIIePEoxF/ghnVsw4Xzc0BSfkpXo1KcRTtm2ZFLCx4l3IGYTuRQ==
X-Received: by 2002:a05:6512:b8b:b0:599:105a:67e0 with SMTP id
 2adb3069b0e04-59bafdb6c38mr1999806e87.20.1768670066984; Sat, 17 Jan 2026
 09:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20260112094737.879408-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20260112094737.879408-2-t.f.g.geelen@gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Sat, 17 Jan 2026 18:14:23 +0100
X-Gm-Features: AZwV_Qhmr2PSK3pVFI3tDdacssRmNbbkHV8B9gG-zzGh2V5q2Pw0tFqKiZGMjhE
Message-ID: <CAJo0Az4emLrmj3caiG8BDPbT-tvDDvrn3LSsUrg8F+VQbL_zhw@mail.gmail.com>
Subject: Re: [PATCH V4] qemurunner: Improve qmp module detection.
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000114b2a064898977a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 17:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229575

--000000000000114b2a064898977a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I haven't received any further feedback and I haven't seen it in
master-next yet. Is there something I am still missing?

Kind regards,

Tom

On Mon, Jan 12, 2026 at 10:49=E2=80=AFAM Tom Geelen <t.f.g.geelen@gmail.com=
> wrote:

> Instead of using logfile to detect where qmp is located we can pass
> sysroot_native directly to the qemurunner so it can find the qmp module
> itself.
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  meta/classes-recipe/testimage.bbclass |  1 +
>  meta/lib/oeqa/core/target/qemu.py     |  4 ++--
>  meta/lib/oeqa/targetcontrol.py        |  2 ++
>  meta/lib/oeqa/utils/qemurunner.py     | 14 +++++++-------
>  meta/lib/oeqa/utils/qemutinyrunner.py |  3 ++-
>  5 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes-recipe/testimage.bbclass
> b/meta/classes-recipe/testimage.bbclass
> index 844c0f19ad..a5c7c4f34b 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -305,6 +305,7 @@ def testimage_main(d):
>                        'serial_ports':
> len(d.getVar("SERIAL_CONSOLES").split()),
>                        'ovmf'        : ovmf,
>                        'tmpfsdir'    : d.getVar("RUNQEMU_TMPFS_DIR"),
> +                      'native_sysroot': d.getVar("STAGING_DIR_NATIVE"),
>                      }
>
>      if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
> diff --git a/meta/lib/oeqa/core/target/qemu.py
> b/meta/lib/oeqa/core/target/qemu.py
> index 769a6fec7e..76c1ada02e 100644
> --- a/meta/lib/oeqa/core/target/qemu.py
> +++ b/meta/lib/oeqa/core/target/qemu.py
> @@ -22,7 +22,7 @@ class OEQemuTarget(OESSHTarget):
>              port=3DNone, machine=3D'', rootfs=3D'', kernel=3D'', kvm=3DF=
alse,
> slirp=3DFalse,
>              dump_dir=3D'', display=3D'', bootlog=3D'',
>              tmpdir=3D'', dir_image=3D'', boottime=3D60, serial_ports=3D2=
,
> -            boot_patterns =3D defaultdict(str), ovmf=3DFalse, tmpfsdir=
=3DNone,
> **kwargs):
> +            boot_patterns =3D defaultdict(str), ovmf=3DFalse, tmpfsdir=
=3DNone,
> native_sysroot=3DNone, **kwargs):
>
>          super(OEQemuTarget, self).__init__(logger, None, server_ip,
> timeout,
>                  user, port)
> @@ -44,7 +44,7 @@ class OEQemuTarget(OESSHTarget):
>                                   logfile=3Dbootlog, boottime=3Dboottime,
>                                   use_kvm=3Dkvm, use_slirp=3Dslirp,
> dump_dir=3Ddump_dir, logger=3Dlogger,
>                                   serial_ports=3Dserial_ports, boot_patte=
rns
> =3D boot_patterns,
> -                                 use_ovmf=3Dovmf, tmpfsdir=3Dtmpfsdir)
> +                                 use_ovmf=3Dovmf, tmpfsdir=3Dtmpfsdir,
> native_sysroot=3Dnative_sysroot)
>
>      def start(self, params=3DNone, extra_bootparams=3DNone, runqemuparam=
s=3D''):
>          if self.use_slirp and not self.server_ip:
> diff --git a/meta/lib/oeqa/targetcontrol.py
> b/meta/lib/oeqa/targetcontrol.py
> index a9080077e2..fa6b43bb35 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -127,6 +127,7 @@ class QemuTarget(BaseTarget):
>                              logfile =3D self.qemulog,
>                              kernel =3D self.kernel,
>                              boottime =3D
> int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
> +                            native_sysroot =3D
> d.getVar("RECIPE_SYSROOT_NATIVE"),
>                              tmpfsdir =3D d.getVar("RUNQEMU_TMPFS_DIR"),
>                              logger =3D logger)
>          else:
> @@ -140,6 +141,7 @@ class QemuTarget(BaseTarget):
>                              use_kvm =3D use_kvm,
>                              dump_dir =3D dump_dir,
>                              logger =3D logger,
> +                            native_sysroot =3D
> d.getVar("RECIPE_SYSROOT_NATIVE"),
>                              tmpfsdir =3D d.getVar("RUNQEMU_TMPFS_DIR"),
>                              serial_ports =3D
> len(d.getVar("SERIAL_CONSOLES").split()),
>                              boot_patterns =3D boot_patterns)
> diff --git a/meta/lib/oeqa/utils/qemurunner.py
> b/meta/lib/oeqa/utils/qemurunner.py
> index c4db0cf038..de26395bae 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -45,7 +45,7 @@ def getOutput(o):
>  class QemuRunner:
>
>      def __init__(self, machine, rootfs, display, tmpdir,
> deploy_dir_image, logfile, boottime, dump_dir, use_kvm, logger,
> use_slirp=3DFalse,
> -     serial_ports=3D2, boot_patterns =3D defaultdict(str), use_ovmf=3DFa=
lse,
> workdir=3DNone, tmpfsdir=3DNone):
> +     serial_ports=3D2, boot_patterns =3D defaultdict(str), use_ovmf=3DFa=
lse,
> workdir=3DNone, tmpfsdir=3DNone, native_sysroot=3DNone):
>
>          # Popen object for runqemu
>          self.runqemu =3D None
> @@ -76,6 +76,7 @@ class QemuRunner:
>          self.msg =3D ''
>          self.boot_patterns =3D boot_patterns
>          self.tmpfsdir =3D tmpfsdir
> +        self.native_sysroot =3D native_sysroot
>
>          self.runqemutime =3D 300
>          if not workdir:
> @@ -186,17 +187,16 @@ class QemuRunner:
>          return self.launch(launch_cmd, qemuparams=3Dqemuparams,
> get_ip=3Dget_ip, extra_bootparams=3Dextra_bootparams, env=3Denv)
>
>      def launch(self, launch_cmd, get_ip =3D True, qemuparams =3D None,
> extra_bootparams =3D None, env =3D None):
> -        # use logfile to determine the recipe-sysroot-native path and
> -        # then add in the site-packages path components and add that
> -        # to the python sys.path so the qmp module can be found.
> -        python_path =3D os.path.dirname(os.path.dirname(self.logfile))
> -        python_path +=3D "/recipe-sysroot-native/usr/lib/qemu-python"
> +        if not self.native_sysroot:
> +            self.logger.error("qemurunner: native_sysroot not provided;
> cannot locate qmp bindings")
> +            return False
> +        python_path =3D os.path.join(self.native_sysroot,
> "usr/lib/qemu-python")
>          sys.path.append(python_path)
>          importlib.invalidate_caches()
>          try:
>              qmp =3D importlib.import_module("qmp")
>          except Exception as e:
> -            self.logger.error("qemurunner: qmp module missing, please
> ensure it's installed in %s (%s)" % (python_path, str(e)))
> +            self.logger.error("qemurunner: qmp module missing in %s (%s)=
"
> % (python_path, str(e)))
>              return False
>          # Path relative to tmpdir used as cwd for qemu below to avoid
> unix socket path length issues
>          qmp_file =3D "." + next(tempfile._get_candidate_names())
> diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py
> b/meta/lib/oeqa/utils/qemutinyrunner.py
> index 20009401ca..d1ccf65223 100644
> --- a/meta/lib/oeqa/utils/qemutinyrunner.py
> +++ b/meta/lib/oeqa/utils/qemutinyrunner.py
> @@ -19,7 +19,7 @@ from .qemurunner import QemuRunner
>
>  class QemuTinyRunner(QemuRunner):
>
> -    def __init__(self, machine, rootfs, display, tmpdir,
> deploy_dir_image, logfile, kernel, boottime, logger, tmpfsdir=3DNone):
> +    def __init__(self, machine, rootfs, display, tmpdir,
> deploy_dir_image, logfile, kernel, boottime, logger, tmpfsdir=3DNone,
> native_sysroot=3DNone):
>
>          # Popen object for runqemu
>          self.runqemu =3D None
> @@ -44,6 +44,7 @@ class QemuTinyRunner(QemuRunner):
>          self.server_socket =3D None
>          self.kernel =3D kernel
>          self.logger =3D logger
> +        self.native_sysroot =3D native_sysroot
>
>
>      def create_socket(self):
> --
> 2.43.0
>
>

--000000000000114b2a064898977a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I haven&#39;t received any further =
feedback and I haven&#39;t seen it in master-next yet. Is there something I=
 am still missing?</div><div><br></div><div>Kind regards,</div><div><br></d=
iv><div>Tom</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 12, 2026 at 10:49=E2=80=
=AFAM Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com">t.f.g.geelen=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Instead of using logfile to detect where qmp is located we can p=
ass sysroot_native directly to the qemurunner so it can find the qmp module=
 itself.<br>
<br>
Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" tar=
get=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/testimage.bbclass |=C2=A0 1 +<br>
=C2=A0meta/lib/oeqa/core/target/qemu.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<b=
r>
=C2=A0meta/lib/oeqa/targetcontrol.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +=
+<br>
=C2=A0meta/lib/oeqa/utils/qemurunner.py=C2=A0 =C2=A0 =C2=A0| 14 +++++++----=
---<br>
=C2=A0meta/lib/oeqa/utils/qemutinyrunner.py |=C2=A0 3 ++-<br>
=C2=A05 files changed, 14 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/te=
stimage.bbclass<br>
index 844c0f19ad..a5c7c4f34b 100644<br>
--- a/meta/classes-recipe/testimage.bbclass<br>
+++ b/meta/classes-recipe/testimage.bbclass<br>
@@ -305,6 +305,7 @@ def testimage_main(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;serial_ports&#39;: len(d.getVar(&quot;SERIAL_CONSOLES&quot;)=
.split()),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;ovmf&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 : ovmf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;tmpfsdir&#39;=C2=A0 =C2=A0 : d.getVar(&quot;RUNQEMU_TMPFS_DI=
R&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;native_sysroot&#39;: d.getVar(&quot;STAGING_DIR_NATIVE&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;TESTIMAGE_BOOT_PATTERNS&quot;):<br>
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/=
qemu.py<br>
index 769a6fec7e..76c1ada02e 100644<br>
--- a/meta/lib/oeqa/core/target/qemu.py<br>
+++ b/meta/lib/oeqa/core/target/qemu.py<br>
@@ -22,7 +22,7 @@ class OEQemuTarget(OESSHTarget):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port=3DNone, machine=3D&#39=
;&#39;, rootfs=3D&#39;&#39;, kernel=3D&#39;&#39;, kvm=3DFalse, slirp=3DFals=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump_dir=3D&#39;&#39;, disp=
lay=3D&#39;&#39;, bootlog=3D&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpdir=3D&#39;&#39;, dir_im=
age=3D&#39;&#39;, boottime=3D60, serial_ports=3D2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_patterns =3D defaultdict(st=
r), ovmf=3DFalse, tmpfsdir=3DNone, **kwargs):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_patterns =3D defaultdict(st=
r), ovmf=3DFalse, tmpfsdir=3DNone, native_sysroot=3DNone, **kwargs):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(OEQemuTarget, self).__init__(logger=
, None, server_ip, timeout,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user, port)<b=
r>
@@ -44,7 +44,7 @@ class OEQemuTarget(OESSHTarget):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logfile=3Dbootlog, boottime=
=3Dboottime,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_kvm=3Dkvm, use_slirp=3Dsl=
irp, dump_dir=3Ddump_dir, logger=3Dlogger,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial_ports=3Dserial_ports, =
boot_patterns =3D boot_patterns, <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_ovmf=3Dovmf, tmpfsdir=3Dtm=
pfsdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_ovmf=3Dovmf, tmpfsdir=3Dtm=
pfsdir, native_sysroot=3Dnative_sysroot)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def start(self, params=3DNone, extra_bootparams=3DNone,=
 runqemuparams=3D&#39;&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.use_slirp and not self.server_ip:=
<br>
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.p=
y<br>
index a9080077e2..fa6b43bb35 100644<br>
--- a/meta/lib/oeqa/targetcontrol.py<br>
+++ b/meta/lib/oeqa/targetcontrol.py<br>
@@ -127,6 +127,7 @@ class QemuTarget(BaseTarget):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logfile =3D self.qemulog,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel =3D self.kernel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boottime =3D int(d.getVar(&quot;TEST_QEMUBOO=
T_TIMEOUT&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot =3D d.getVar(&quot;RECIPE_SYSROOT_N=
ATIVE&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfsdir =3D d.getVar(&quot;RUNQEMU_TMPFS_DI=
R&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger =3D logger)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
@@ -140,6 +141,7 @@ class QemuTarget(BaseTarget):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_kvm =3D use_kvm,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump_dir =3D dump_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger =3D logger,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot =3D d.getVar(&quot;RECIPE_SYSROOT_N=
ATIVE&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfsdir =3D d.getVar(&quot;RUNQEMU_TMPFS_DI=
R&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial_ports =3D len(d.getVar(&quot;SERIAL_C=
ONSOLES&quot;).split()),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boot_patterns =3D boot_patterns)<br>
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py<br>
index c4db0cf038..de26395bae 100644<br>
--- a/meta/lib/oeqa/utils/qemurunner.py<br>
+++ b/meta/lib/oeqa/utils/qemurunner.py<br>
@@ -45,7 +45,7 @@ def getOutput(o):<br>
=C2=A0class QemuRunner:<br>
<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, machine, rootfs, display, tmpdir, de=
ploy_dir_image, logfile, boottime, dump_dir, use_kvm, logger, use_slirp=3DF=
alse,<br>
-=C2=A0 =C2=A0 =C2=A0serial_ports=3D2, boot_patterns =3D defaultdict(str), =
use_ovmf=3DFalse, workdir=3DNone, tmpfsdir=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0serial_ports=3D2, boot_patterns =3D defaultdict(str), =
use_ovmf=3DFalse, workdir=3DNone, tmpfsdir=3DNone, native_sysroot=3DNone):<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Popen object for runqemu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.runqemu =3D None<br>
@@ -76,6 +76,7 @@ class QemuRunner:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.msg =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.boot_patterns =3D boot_patterns<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.tmpfsdir =3D tmpfsdir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.native_sysroot =3D native_sysroot<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.runqemutime =3D 300<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not workdir:<br>
@@ -186,17 +187,16 @@ class QemuRunner:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.launch(launch_cmd, qemuparams=
=3Dqemuparams, get_ip=3Dget_ip, extra_bootparams=3Dextra_bootparams, env=3D=
env)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def launch(self, launch_cmd, get_ip =3D True, qemuparam=
s =3D None, extra_bootparams =3D None, env =3D None):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # use logfile to determine the recipe-sysroot-=
native path and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # then add in the site-packages path component=
s and add that<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to the python sys.path so the qmp module can=
 be found.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_path =3D os.path.dirname(os.path.dirnam=
e(self.logfile))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_path +=3D &quot;/recipe-sysroot-native/=
usr/lib/qemu-python&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.native_sysroot:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.error(&quot;qemurunn=
er: native_sysroot not provided; cannot locate qmp bindings&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_path =3D os.path.join(self.native_sysro=
ot, &quot;usr/lib/qemu-python&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.path.append(python_path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0importlib.invalidate_caches()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp =3D importlib.import_mo=
dule(&quot;qmp&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.error(&quot;qemurunn=
er: qmp module missing, please ensure it&#39;s installed in %s (%s)&quot; %=
 (python_path, str(e)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.error(&quot;qemurunn=
er: qmp module missing in %s (%s)&quot; % (python_path, str(e)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Path relative to tmpdir used as cwd for=
 qemu below to avoid unix socket path length issues<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_file =3D &quot;.&quot; + next(tempfil=
e._get_candidate_names())<br>
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qe=
mutinyrunner.py<br>
index 20009401ca..d1ccf65223 100644<br>
--- a/meta/lib/oeqa/utils/qemutinyrunner.py<br>
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py<br>
@@ -19,7 +19,7 @@ from .qemurunner import QemuRunner<br>
<br>
=C2=A0class QemuTinyRunner(QemuRunner):<br>
<br>
-=C2=A0 =C2=A0 def __init__(self, machine, rootfs, display, tmpdir, deploy_=
dir_image, logfile, kernel, boottime, logger, tmpfsdir=3DNone):<br>
+=C2=A0 =C2=A0 def __init__(self, machine, rootfs, display, tmpdir, deploy_=
dir_image, logfile, kernel, boottime, logger, tmpfsdir=3DNone, native_sysro=
ot=3DNone):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Popen object for runqemu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.runqemu =3D None<br>
@@ -44,6 +44,7 @@ class QemuTinyRunner(QemuRunner):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.server_socket =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel =3D kernel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.logger =3D logger<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.native_sysroot =3D native_sysroot<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0def create_socket(self):<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000114b2a064898977a--

