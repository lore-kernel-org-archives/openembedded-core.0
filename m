Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 04C8B6BE7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:15:14 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ec20so2805918lab.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=HZWvXz1Fxv54USsruxsCNu3ZDxB4nQF9XAb4lu5hlBc=;
	b=K7PQLblCFNB+RQEPqpHL5jBHVFCFn44mYI4SI+XA33ExmCRCRy4+2mMP2a8QGTTWXk
	6TZDOuSn3Kj4r28VQpPMCeG6SjjrWMNvjetyovLOtZj8evHT157WJ+OY5x7PQsY3PRxl
	hhpHY9K3zaAPwpqD5dvwnJAm92m7tchdqkU/wNhGzqUrVphi57UY23xRv+tPjNR25hLw
	CNLYkndoXr8n4UeslSOCciHVdsp9nn1WRHqyVnciuL8EsrcVVBMuNWTr34vwdCbwAEqJ
	XFC35MYwxxI61PhZJYIQrYt+ZTLoOq3uzPVyTbkiby4Ebs7gfR5Bx4uY4OGa7+4ZnQ4l
	diyQ==
X-Received: by 10.152.22.35 with SMTP id a3mr872465laf.45.1378476916217; Fri,
	06 Sep 2013 07:15:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Fri, 6 Sep 2013 07:14:56 -0700 (PDT)
In-Reply-To: <1378456523-16123-1-git-send-email-raj.khem@gmail.com>
References: <1378456523-16123-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 6 Sep 2013 07:14:56 -0700
X-Google-Sender-Auth: nkwJ4Jhk5JPDvf5TlRhXU9n5-QM
Message-ID: <CABcZANnwvbvCxahybCFQBO=QsR5P6cV+DT36N0qwe1Dvy4H0QQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: skip already-stripped QA test if asked for
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
X-List-Received-Date: Fri, 06 Sep 2013 14:15:15 -0000
Content-Type: multipart/alternative; boundary=089e0158b878ec1b8f04e5b7aad9

--089e0158b878ec1b8f04e5b7aad9
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 6, 2013 at 1:35 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Some packages like grub have already stripped binaries e.g.
>
> ERROR: QA Issue: File '/boot/grub/kernel.img' from grub was already
> stripped, this will prevent future debugging!
> ERROR: QA run found fatal errors. Please consider fixing them.
>
> We would like to have a possibility to skip it using something like
>
> INSANE_SKIP_${PN} = "already-stripped"
>
> This adds the logic to do so
>
> it acts at PN level and not at package level. so something like
>
> INSANE_SKIP_${PN}-misc = "already-stripped" wont work.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/package.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 50490bc..96e649a 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -811,8 +811,11 @@ python split_and_strip_files () {
>                      elf_file = isELF(file)
>                      if elf_file & 1:
>                          if elf_file & 2:
> -                            msg = "File '%s' from %s was already
> stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
> -                            package_qa_handle_error("already-stripped",
> msg, d)
> +                            if 'already-stripped' in
> (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
> +                                bb.note("Package %s skipping
> already-stripped QA test" % (pn))
>

This seems like it must be inside a loop over each file, yet the message
here is about the package, not the file, so I expect the task log may show
a ton of duplicate messages, eh? :)
-- 
Christopher Larson

--089e0158b878ec1b8f04e5b7aad9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Sep 6, 2013 at 1:35 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1eu" style=3D"overflow:hidden">S=
ome packages like grub have already stripped binaries e.g.<br>
<br>
ERROR: QA Issue: File &#39;/boot/grub/kernel.img&#39; from grub was already=
<br>
stripped, this will prevent future debugging!<br>
ERROR: QA run found fatal errors. Please consider fixing them.<br>
<br>
We would like to have a possibility to skip it using something like<br>
<br>
INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
<br>
This adds the logic to do so<br>
<br>
it acts at PN level and not at package level. so something like<br>
<br>
INSANE_SKIP_${PN}-misc =3D &quot;already-stripped&quot; wont work.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/package.<span class=3D"il">bbclass</span> | 7 +++++--<br=
>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/package.<span class=3D"il">bbclass</span> b/meta/=
classes/package.<span class=3D"il">bbclass</span><br>
index 50490bc..96e649a 100644<br>
--- a/meta/classes/package.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/package.<span class=3D"il">bbclass</span><br>
@@ -811,8 +811,11 @@ python split_and_strip_files () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0elf_file =3D isELF(file)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if elf_file &amp; 1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if elf_file &amp; 2:<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &quot;File &#39;%s&#39; from %s was already=
 stripped, this will prevent future debugging!&quot; % (file[len(dvar):], p=
n)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0package_qa_handle_error(&quot;already-stripped&quot=
;, msg, d)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if &#39;already-stripped&#39; in (d.getVar(&#39;INS=
ANE_SKIP_&#39; + pn, True) or &quot;&quot;).split():<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span class=3D"il">bb</span>.note(&qu=
ot;Package %s skipping already-stripped QA test&quot; % (pn))</div></blockq=
uote></div><br>This seems like it must be inside a loop over each file, yet=
 the message here is about the package, not the file, so I expect the task =
log may show a ton of duplicate messages, eh? :)<br>

-- <br>Christopher Larson</div></div>

--089e0158b878ec1b8f04e5b7aad9--
