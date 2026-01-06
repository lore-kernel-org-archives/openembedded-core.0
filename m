Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB7DCEFCEC
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:39:32 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.97182.1767724762308021035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 10:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HeOafm8H;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso630570a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724762; x=1768329562; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ku0lt/IXHqK/WAmJL1BmW9IPT6Rn8iGaQBha1FMCtFI=;
        b=HeOafm8H4Wtw2fgjdJNh4PJplj6rKz8kXKx4W5M0l982y4J2E9ZDZrsh/R3LBNjRxI
         T6GFpg2R70Oimt/hvuiXAozIVmHoAzwq/c2GCk9zkax5d2LYdhZZ3r4XCZH1/BwEGpq0
         yw8h0Ykz7jCha0Re9ljqMBo62n/MIB13I6XCkGLdzqItqoPz8+s1x6vR+bSR3lM9qJy5
         1gjr6TZLPq7SgxNK7ZNPeiklCnCCK0o9LgnqhUH1t+irt++oJ4DeHMGMyIlZQ/C8bao+
         oCcz5ed+KCO3cCWux37l2Cxq5uRI2+YgHfctu4Qk8B73r7wGXycYSTusCLLHXeE19LkZ
         FMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724762; x=1768329562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku0lt/IXHqK/WAmJL1BmW9IPT6Rn8iGaQBha1FMCtFI=;
        b=ksb6OV7QMY+Zcis9OiU4Ewmt75elJsxLk2SUB3Z+906Ok8/Sq4H55zJukzdaWq84t6
         RYvoZQiVhIHDuN2dINSNm94UUcRXQ/egjZA5Gp0qAjqD9sA8MrlhpVQcGXSwFBlatUxq
         qbYlOm5xMeQF2+rfSjIbq/u93R7FQ0njdadW+5Y0jr0i7Vi7Egoq536/ceoEKSMCipFO
         k/afaaQfQW/ffi6JDMbtUeWuvLyLHpL2LMKFzXuLHb0R4Gj3yhQgg6PqXjZZ4MBIK6Qj
         zOl4doKPKZh8kV/5Wi+CvToE41QDfWJ98qzEGhvQ/LukvI8UXi7tUiA1cRgnobj1gUOW
         Cjqw==
X-Gm-Message-State: AOJu0Yyel/MVXUTuMVpciGpgfW5l6+GIp7uw44wW8Oi9v29Hb1xP6qy/
	1KKAhiW5AW2YRe3aJ3lIZdaSkX8q0d2xByuAv1gIl8K0ge5m4Px1Y7py0zRicWBUuf/xVzu4SE/
	gEMTzKcstdrW6zpr12mesetiXT45rQzM=
X-Gm-Gg: AY/fxX6vg9a74ZBzXzo7FCf4PertEPfd/xF7xXwTLGN9RiQ8haDx6RaSR0bM53sk543
	uGBR5ZodkzPKeCMYhcoyK0XzEVc+yUBSxUv8/cF7hKEZqfQcxZ7K1haGKlmp1d1FHsRr2+DShIw
	jlC6i+f7p9VaFlZYAtGdIud3DeJUSLvkzkd0OBbaYsCnWYFVHeikOu+WeP+GWvKEk67sBact+rn
	vKmKr8dwYswI1otcefeLqIC5kxu15/uuAJHBM7knmTZ/adVhFPgwwTd8Tlb2wBy2Cd18i7y
X-Google-Smtp-Source: AGHT+IHBmBBJzK0fF2+/mi0T7JljiWXOr+TNUntqY0RR4YO4k4d/WSYXZHDwUETXieMuOaWTWUH8w1BdH9w7nbCbGZ8=
X-Received: by 2002:a17:90b:2642:b0:340:d578:f2a2 with SMTP id
 98e67ed59e1d1-34f68c335e4mr95361a91.6.1767724761357; Tue, 06 Jan 2026
 10:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20260106182822.3377881-1-valentin.boudevin@gmail.com> <20260106182822.3377881-2-valentin.boudevin@gmail.com>
In-Reply-To: <20260106182822.3377881-2-valentin.boudevin@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Jan 2026 13:39:08 -0500
X-Gm-Features: AQt7F2qnCshkKLet8ZgSQQmsJTG5_VvmG0jyRnX7-vD40OgX-IAWBxrJsBiDqLQ
Message-ID: <CADkTA4NJcjKbPH4bGWCCWB0eEbpiFmUx+hCkd83ShSWA98uArA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] generate-cve-exclusions: Add a .bbclass
To: valentin.boudevin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000761fe10647bc7e41"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 18:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228913

--000000000000761fe10647bc7e41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can't tell, if this runs on every bitbake/compilation of the kernel, then
this is a hard NACK.

Make a task for it, or just add instructions on how to generate these, but
it cannot be in the standard build set of tasks.

Bruce

On Tue, Jan 6, 2026 at 1:28=E2=80=AFPM vboudevin via lists.openembedded.org
<valentin.boudevin=3Dgmail.com@lists.openembedded.org> wrote:

> Add a .bbclass to generate-cve-exclusions to use this script at every
> run.
> This class needs to be inherit by the linux kernel recipe.
>
> This class contains several methods:
>
> *do_clone_cvelistV5: Clone the cvelistV5 repo in
> ${WORKDIR}/cvelistV5/git
>
> (e.g. bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/
> linux-yocto/6.18.1+git/cvelistV5/git)
>
> *do_generate_cve_exclusions: Use the script generate-cve-exclusions.py.
> It uses the new "--output-json" argument to generate a JSON file as an
> output stored in ${WORKDIR}/cvelistV5//cve-exclusion_${LINUX_VERSION}.jso=
n
>
> *do_cve_check:prepend: Parse the previously generated JSON file to set
> the variable CVE_STATUS corretly
> ---
>  meta/classes/generate-cve-exclusions.bbclass | 67 ++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 meta/classes/generate-cve-exclusions.bbclass
>
> diff --git a/meta/classes/generate-cve-exclusions.bbclass
> b/meta/classes/generate-cve-exclusions.bbclass
> new file mode 100644
> index 0000000000..3e34ba563d
> --- /dev/null
> +++ b/meta/classes/generate-cve-exclusions.bbclass
> @@ -0,0 +1,67 @@
> +CVE_EXCLUSIONS_WORKDIR ?=3D "${WORKDIR}/cvelistV5"
> +CVELISTV5_PATH ?=3D "${CVE_EXCLUSIONS_WORKDIR}/git"
> +
> +python do_clone_cvelistV5() {
> +    import subprocess
> +    import shutil, os
> +    rootdir =3D d.getVar("CVELISTV5_PATH")
> +    d.setVar("SRC_URI", "git://
> github.com/CVEProject/cvelistV5.git;branch=3Dmain;protocol=3Dhttps")
> +    d.setVar("SRCREV", "${AUTOREV}")
> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
> +    # Fetch the kernel vulnerabilities sources
> +    fetcher =3D bb.fetch2.Fetch(src_uri, d)
> +    fetcher.download()
> +    # Unpack into the standard work directory
> +    fetcher.unpack(rootdir)
> +    # Remove the folder ${PN} set by unpack
> +    subdirs =3D [d for d in os.listdir(rootdir) if
> os.path.isdir(os.path.join(rootdir, d))]
> +    if len(subdirs) =3D=3D 1:
> +        srcdir =3D os.path.join(rootdir, subdirs[0])
> +        for f in os.listdir(srcdir):
> +            shutil.move(os.path.join(srcdir, f), rootdir)
> +        shutil.rmtree(srcdir)
> +    bb.note("Vulnerabilities repo unpacked into: %s" % rootdir)
> +}
> +do_clone_cvelistV5[network] =3D "1"
> +do_clone_cvelistV5[nostamp] =3D "1"
> +do_clone_cvelistV5[doc] =3D "Clone CVE information from the CVE Project:
> https://github.com/CVEProject/cvelistV5.git"
> +addtask clone_cvelistV5 after do_fetch before do_generate_cve_exclusions
> +
> +do_generate_cve_exclusions() {
> +    generate_cve_exclusions_script=3D$(find ${COREBASE} -name
> "generate-cve-exclusions.py")
> +    if [ -z "${generate_cve_exclusions_script}" ]; then
> +        bbfatal "generate-cve-exclusions.py not found in ${COREBASE}."
> +    fi
> +    python3 "${generate_cve_exclusions_script}" \
> +        ${CVELISTV5_PATH} \
> +        ${LINUX_VERSION} \
> +        --output-json >
> ${CVE_EXCLUSIONS_WORKDIR}/cve-exclusion_${LINUX_VERSION}.json
> +}
> +do_generate_cve_exclusions[nostamp] =3D "1"
> +do_generate_cve_exclusions[doc] =3D "Generate CVE exclusions for the ker=
nel
> build. (e.g., cve-exclusion_6.12.inc)"
> +addtask generate_cve_exclusions after do_clone_cvelistV5 before
> do_cve_check
> +
> +python do_cve_check:prepend() {
> +    import os
> +    import json
> +
> +    workdir =3D d.getVar("CVE_EXCLUSIONS_WORKDIR")
> +    kernel_version =3D d.getVar("LINUX_VERSION")
> +    json_input_file =3D os.path.join(workdir, "cve-exclusion_%s.json" %
> kernel_version)
> +
> +    # Parse JSON
> +    with open(json_input_file, 'r', encoding=3D'utf-8') as f:
> +        cve_data =3D json.load(f)
> +
> +    cve_status_dict =3D cve_data.get("cve_status", {})
> +
> +    if os.path.exists(json_input_file):
> +        count =3D 0
> +        for cve_id, info in cve_status_dict.items():
> +            if info.get("active", True):
> +                # Skip active CVEs
> +                continue
> +            d.setVarFlag("CVE_STATUS", cve_id, info.get("message", ""))
> +            count +=3D 1
> +    bb.note("Loaded %d CVE_STATUS entries from JSON output for kernel %s=
"
> % (count, kernel_version))
> +}
> \ No newline at end of file
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228910):
> https://lists.openembedded.org/g/openembedded-core/message/228910
> Mute This Topic: https://lists.openembedded.org/mt/117110144/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000761fe10647bc7e41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I c=
an&#39;t tell, if this runs on every bitbake/compilation of the kernel, the=
n</div><div class=3D"gmail_default" style=3D"font-size:small">this is a har=
d NACK.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Make a task for i=
t, or just add instructions on how to generate these, but</div><div class=
=3D"gmail_default" style=3D"font-size:small">it cannot be in the standard b=
uild set of tasks.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026 at 1:28=E2=80=AFPM vboudevin=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;valentin.boudevin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">=
gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Add a .bbclass to generate-cve-exclusions =
to use this script at every<br>
run.<br>
This class needs to be inherit by the linux kernel recipe.<br>
<br>
This class contains several methods:<br>
<br>
*do_clone_cvelistV5: Clone the cvelistV5 repo in<br>
${WORKDIR}/cvelistV5/git<br>
<br>
(e.g. bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/<br>
linux-yocto/6.18.1+git/cvelistV5/git)<br>
<br>
*do_generate_cve_exclusions: Use the script generate-cve-exclusions.py.<br>
It uses the new &quot;--output-json&quot; argument to generate a JSON file =
as an<br>
output stored in ${WORKDIR}/cvelistV5//cve-exclusion_${LINUX_VERSION}.json<=
br>
<br>
*do_cve_check:prepend: Parse the previously generated JSON file to set<br>
the variable CVE_STATUS corretly<br>
---<br>
=C2=A0meta/classes/generate-cve-exclusions.bbclass | 67 +++++++++++++++++++=
+<br>
=C2=A01 file changed, 67 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/generate-cve-exclusions.bbclass<br>
<br>
diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/ge=
nerate-cve-exclusions.bbclass<br>
new file mode 100644<br>
index 0000000000..3e34ba563d<br>
--- /dev/null<br>
+++ b/meta/classes/generate-cve-exclusions.bbclass<br>
@@ -0,0 +1,67 @@<br>
+CVE_EXCLUSIONS_WORKDIR ?=3D &quot;${WORKDIR}/cvelistV5&quot;<br>
+CVELISTV5_PATH ?=3D &quot;${CVE_EXCLUSIONS_WORKDIR}/git&quot;<br>
+<br>
+python do_clone_cvelistV5() {<br>
+=C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 import shutil, os<br>
+=C2=A0 =C2=A0 rootdir =3D d.getVar(&quot;CVELISTV5_PATH&quot;)<br>
+=C2=A0 =C2=A0 d.setVar(&quot;SRC_URI&quot;, &quot;git://<a href=3D"http://=
github.com/CVEProject/cvelistV5.git;branch=3Dmain;protocol=3Dhttps" rel=3D"=
noreferrer" target=3D"_blank">github.com/CVEProject/cvelistV5.git;branch=3D=
main;protocol=3Dhttps</a>&quot;)<br>
+=C2=A0 =C2=A0 d.setVar(&quot;SRCREV&quot;, &quot;${AUTOREV}&quot;)<br>
+=C2=A0 =C2=A0 src_uri =3D (d.getVar(&#39;SRC_URI&#39;) or &quot;&quot;).sp=
lit()<br>
+=C2=A0 =C2=A0 # Fetch the kernel vulnerabilities sources<br>
+=C2=A0 =C2=A0 fetcher =3D bb.fetch2.Fetch(src_uri, d)<br>
+=C2=A0 =C2=A0 fetcher.download()<br>
+=C2=A0 =C2=A0 # Unpack into the standard work directory<br>
+=C2=A0 =C2=A0 fetcher.unpack(rootdir)<br>
+=C2=A0 =C2=A0 # Remove the folder ${PN} set by unpack<br>
+=C2=A0 =C2=A0 subdirs =3D [d for d in os.listdir(rootdir) if os.path.isdir=
(os.path.join(rootdir, d))]<br>
+=C2=A0 =C2=A0 if len(subdirs) =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdir =3D os.path.join(rootdir, subdirs[0])<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in os.listdir(srcdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(os.path.join(srcdir,=
 f), rootdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(srcdir)<br>
+=C2=A0 =C2=A0 bb.note(&quot;Vulnerabilities repo unpacked into: %s&quot; %=
 rootdir)<br>
+}<br>
+do_clone_cvelistV5[network] =3D &quot;1&quot;<br>
+do_clone_cvelistV5[nostamp] =3D &quot;1&quot;<br>
+do_clone_cvelistV5[doc] =3D &quot;Clone CVE information from the CVE Proje=
ct: <a href=3D"https://github.com/CVEProject/cvelistV5.git" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/CVEProject/cvelistV5.git</a>&quot;=
<br>
+addtask clone_cvelistV5 after do_fetch before do_generate_cve_exclusions<b=
r>
+<br>
+do_generate_cve_exclusions() {<br>
+=C2=A0 =C2=A0 generate_cve_exclusions_script=3D$(find ${COREBASE} -name &q=
uot;generate-cve-exclusions.py&quot;)<br>
+=C2=A0 =C2=A0 if [ -z &quot;${generate_cve_exclusions_script}&quot; ]; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;generate-cve-exclusions.py not f=
ound in ${COREBASE}.&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 python3 &quot;${generate_cve_exclusions_script}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${CVELISTV5_PATH} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${LINUX_VERSION} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --output-json &gt; ${CVE_EXCLUSIONS_WORKDIR}/c=
ve-exclusion_${LINUX_VERSION}.json<br>
+}<br>
+do_generate_cve_exclusions[nostamp] =3D &quot;1&quot;<br>
+do_generate_cve_exclusions[doc] =3D &quot;Generate CVE exclusions for the =
kernel build. (e.g., cve-exclusion_6.12.inc)&quot;<br>
+addtask generate_cve_exclusions after do_clone_cvelistV5 before do_cve_che=
ck<br>
+<br>
+python do_cve_check:prepend() {<br>
+=C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 import json<br>
+<br>
+=C2=A0 =C2=A0 workdir =3D d.getVar(&quot;CVE_EXCLUSIONS_WORKDIR&quot;)<br>
+=C2=A0 =C2=A0 kernel_version =3D d.getVar(&quot;LINUX_VERSION&quot;)<br>
+=C2=A0 =C2=A0 json_input_file =3D os.path.join(workdir, &quot;cve-exclusio=
n_%s.json&quot; % kernel_version)<br>
+<br>
+=C2=A0 =C2=A0 # Parse JSON<br>
+=C2=A0 =C2=A0 with open(json_input_file, &#39;r&#39;, encoding=3D&#39;utf-=
8&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data =3D json.load(f)<br>
+<br>
+=C2=A0 =C2=A0 cve_status_dict =3D cve_data.get(&quot;cve_status&quot;, {})=
<br>
+<br>
+=C2=A0 =C2=A0 if os.path.exists(json_input_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve_id, info in cve_status_dict.items():<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if info.get(&quot;active&quot;, =
True):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Skip active CVEs=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&quot;CVE_STATUS&qu=
ot;, cve_id, info.get(&quot;message&quot;, &quot;&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count +=3D 1<br>
+=C2=A0 =C2=A0 bb.note(&quot;Loaded %d CVE_STATUS entries from JSON output =
for kernel %s&quot; % (count, kernel_version))<br>
+}<br>
\ No newline at end of file<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228910): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228910" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228910</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117110144/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117110144/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000761fe10647bc7e41--

