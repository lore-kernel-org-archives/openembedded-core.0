Return-Path: <rewitt@declaratino.com>
X-Greylist: delayed 439 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Jan 2017 18:39:30 UTC
Received: from p3plsmtpa06-01.prod.phx3.secureserver.net
	(p3plsmtpa06-01.prod.phx3.secureserver.net [173.201.192.102])
	by mail.openembedded.org (Postfix) with ESMTP id A11CE60125
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 18:39:30 +0000 (UTC)
Received: from mail-lf0-f52.google.com ([209.85.215.52])
	by :SMTPAUTH: with SMTP
	id PZIicH9UBWbEfPZIjc6JgD; Fri, 06 Jan 2017 11:31:41 -0700
Received: by mail-lf0-f52.google.com with SMTP id o140so4073595lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 10:31:40 -0800 (PST)
X-Gm-Message-State: AIkVDXKyzg+BkKzVrb6NS1ejJgi6ona7DHjE+SkCpR4tOLZwFvJgi3eljkRQPojSUKbmkqM/sTRXY39sVdqu6w==
X-Received: by 10.46.77.17 with SMTP id a17mr2942621ljb.2.1483727499945; Fri,
	06 Jan 2017 10:31:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.223.84 with HTTP; Fri, 6 Jan 2017 10:31:09 -0800 (PST)
In-Reply-To: <8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
From: Randy Witt <rewitt@declaratino.com>
Date: Fri, 6 Jan 2017 10:31:09 -0800
X-Gmail-Original-Message-ID: <CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
Message-ID: <CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-CMAE-Envelope: MS4wfBepeGVSWdWp6YunoTUklEGH4PBUhlVrd1cN0xUS3J7il0CT0ZfJJ0wNulnBa51AX4BXcqLjORHOiPMQ2PZbc+O0EqtpPasDpvYfb8tIRRk+rN/W1rj/
	tvZJYDhmTkI9SU4Q5FMjFU+QLxYzmrOHBVgkKtfqFvoqbKGRV34OnfVtmhYbQaD7HU6L+DX41DWHbwNj5v/DEoUL7yabKfzFiEc=
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2017 18:39:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c1abbc493ee0a0545713ae6

--94eb2c1abbc493ee0a0545713ae6
Content-Type: text/plain; charset=UTF-8

Hi Patrick,

On Fri, Jan 6, 2017 at 1:55 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:

> rm_work.bbclass never deletes downloaded files, even if they are not
> going to be needed again during the
> build. rm_work_and_downloads.bbclass is more aggressive in minimizing
> the used disk space during a build, but has other disadvantages:
> - sources required by different recipes need to be fetched once per
>   recipe, not once per build
> - incremental builds do not work reliably because sources get
>   removed without ensuring that sources gets fetched again
>
> That makes rm_work_and_downloads.bbclass useful for one-time builds in
> a constrained environment (like a CI system), but not for general use.
>
>
I'd rather see this be a new class independent from rm_work. People can
always in inherit both rm_work and rm_download.

That being said, since this doesn't operate at the fetch level, i.e. only
remove things that were fetched as part of the current invocation of
bitbake, I don't see why the user couldn't just "rm -rf downloads"
themselves as part of the ci teardown.


> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/classes/rm_work_and_downloads.bbclass | 33
> ++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta/classes/rm_work_and_downloads.bbclass
>
> diff --git a/meta/classes/rm_work_and_downloads.bbclass
> b/meta/classes/rm_work_and_downloads.bbclass
> new file mode 100644
> index 0000000..7c00bea
> --- /dev/null
> +++ b/meta/classes/rm_work_and_downloads.bbclass
> @@ -0,0 +1,33 @@
> +# Author:       Patrick Ohly <patrick.ohly@intel.com>
> +# Copyright:    Copyright (C) 2015 Intel Corporation
> +#
> +# This file is licensed under the MIT license, see COPYING.MIT in
> +# this source distribution for the terms.
> +
> +# This class is used like rm_work:
> +# INHERIT += "rm_work_and_downloads"
> +#
> +# In addition to removing local build directories of a recipe, it also
> +# removes the downloaded source. This is achieved by making the DL_DIR
> +# recipe-specific. While reducing disk usage, it increases network usage
> (for
> +# example, compiling the same source for target and host implies
> downloading
> +# the source twice).
> +#
> +# Because the "do_fetch" task does not get re-run after removing the
> downloaded
> +# sources, this class is also not suitable for incremental builds.
> +#
> +# Where it works well is in well-connected build environments with limited
> +# disk space (like TravisCI).
> +
> +inherit rm_work
> +
> +# This would ensure that the existing do_rm_work() removes the downloads,
> +# but does not work because some recipes have a circular dependency
> between
> +# WORKDIR and DL_DIR (via ${SRCPV}?).
> +# DL_DIR = "${WORKDIR}/downloads"
> +
> +# Instead go up one level and remove ourself.
> +DL_DIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/downloads"
> +do_rm_work_append () {
> +    rm -rf ${DL_DIR}
> +}
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1abbc493ee0a0545713ae6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Patrick,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Fri, Jan 6, 2017 at 1:55 AM, Patrick Ohly <span dir=3D"=
ltr">&lt;<a href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patric=
k.ohly@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">rm=
_work.bbclass never deletes downloaded files, even if they are not<br>
going to be needed again during the<br>
build. rm_work_and_downloads.bbclass is more aggressive in minimizing<br>
the used disk space during a build, but has other disadvantages:<br>
- sources required by different recipes need to be fetched once per<br>
=C2=A0 recipe, not once per build<br>
- incremental builds do not work reliably because sources get<br>
=C2=A0 removed without ensuring that sources gets fetched again<br>
<br>
That makes rm_work_and_downloads.bbclass useful for one-time builds in<br>
a constrained environment (like a CI system), but not for general use.<br>
<br></blockquote><div><br></div><div>I&#39;d rather see this be a new class=
 independent from rm_work. People can always in inherit both rm_work and rm=
_download.</div><div><br></div><div>That being said, since this doesn&#39;t=
 operate at the fetch level, i.e. only remove things that were fetched as p=
art of the current invocation of bitbake, I don&#39;t see why the user coul=
dn&#39;t just &quot;rm -rf downloads&quot; themselves as part of the ci tea=
rdown.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">p=
atrick.ohly@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/rm_work_and_<wbr>downloads.bbclass | 33 ++++++++++++++++=
++++++++++++++<br>
=C2=A01 file changed, 33 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/rm_work_and_<wbr>downloads.bbclass<br=
>
<br>
diff --git a/meta/classes/rm_work_and_<wbr>downloads.bbclass b/meta/classes=
/rm_work_and_<wbr>downloads.bbclass<br>
new file mode 100644<br>
index 0000000..7c00bea<br>
--- /dev/null<br>
+++ b/meta/classes/rm_work_and_<wbr>downloads.bbclass<br>
@@ -0,0 +1,33 @@<br>
+# Author:=C2=A0 =C2=A0 =C2=A0 =C2=A0Patrick Ohly &lt;<a href=3D"mailto:pat=
rick.ohly@intel.com">patrick.ohly@intel.com</a>&gt;<br>
+# Copyright:=C2=A0 =C2=A0 Copyright (C) 2015 Intel Corporation<br>
+#<br>
+# This file is licensed under the MIT license, see COPYING.MIT in<br>
+# this source distribution for the terms.<br>
+<br>
+# This class is used like rm_work:<br>
+# INHERIT +=3D &quot;rm_work_and_downloads&quot;<br>
+#<br>
+# In addition to removing local build directories of a recipe, it also<br>
+# removes the downloaded source. This is achieved by making the DL_DIR<br>
+# recipe-specific. While reducing disk usage, it increases network usage (=
for<br>
+# example, compiling the same source for target and host implies downloadi=
ng<br>
+# the source twice).<br>
+#<br>
+# Because the &quot;do_fetch&quot; task does not get re-run after removing=
 the downloaded<br>
+# sources, this class is also not suitable for incremental builds.<br>
+#<br>
+# Where it works well is in well-connected build environments with limited=
<br>
+# disk space (like TravisCI).<br>
+<br>
+inherit rm_work<br>
+<br>
+# This would ensure that the existing do_rm_work() removes the downloads,<=
br>
+# but does not work because some recipes have a circular dependency betwee=
n<br>
+# WORKDIR and DL_DIR (via ${SRCPV}?).<br>
+# DL_DIR =3D &quot;${WORKDIR}/downloads&quot;<br>
+<br>
+# Instead go up one level and remove ourself.<br>
+DL_DIR =3D &quot;${BASE_WORKDIR}/${MULTIMACH_<wbr>TARGET_SYS}/${PN}/downlo=
ads&quot;<br>
+do_rm_work_append () {<br>
+=C2=A0 =C2=A0 rm -rf ${DL_DIR}<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c1abbc493ee0a0545713ae6--
