Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E585271C3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 12:38:31 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 10so6090269qkh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 05:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6nWOh8jRvQljyBJNkYWduGe83ino9ljtFiTLhTw+X70=;
	b=ELZUj4zT2S2ma1jxpOTkqgD6pyE4hJFxj2obhZEsBGGVe2WUMD6/BIt4bBY7uGhQTW
	8SI3ZclZtK4Qopc1SfkkSWffHN/GzSmJ7cC460tafgrteypcWOiQwKDf/5mUf+blTno+
	WYS9AdsE7jIk8aRH7POTAUZ9jQiUauKtLmJDC3aHlquup9dry5k4E0mFJNxcnAJ6lXIr
	nVHH7Nk/12B9sukX4rC9ia55O1fQJWUMTHnj+4ZCKUSefMG6pF4VebLO7t8AXY1EB8Q5
	DQfDP+J/NbFx5Lhzv+1kqSLjxMad+CVzKC7zKMJQdojZmhHEHDKjF7s496XF+UkFwViy
	+EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6nWOh8jRvQljyBJNkYWduGe83ino9ljtFiTLhTw+X70=;
	b=nMvA4vKv8+S9VlmfsgVVGEpt8TvPnPO2LYoIc9wndOTESJO9Z5xjY0/tfbrzH4WvfC
	oD9Ou66QlQgErzFtw7ODBn4jsFaL/oSP6lY8yGV0ocmvONS8tYgfW5WwatvhKl/WnQcb
	7UMP+PaLiHcjda/2U8QaYfWpCg7L6LlouJWvquocuxonNzAsa2nCUXqxO/Xwo56ZTWyp
	SlYw3mv8eNMiLZ4X+h5SqxackR8W6F9rzdqjqIdc0cPl+qM0Ozb4xvqEupMXvOT5hS+s
	J3U90SC56BtT2JAwiC6SGem2HA3UORYbW/uS9hhL0Z2f5ryyRuJiBndYB2DpdVJi0aGa
	IrUw==
X-Gm-Message-State: AFeK/H1IeQeW09O9u3sdrHsjeDstogzycFtAmJjtrdKME3kb5Id18aYakucSq3ZYgSwGqQRVjbjDHpnRQ2VSqA==
X-Received: by 10.55.112.66 with SMTP id l63mr5680090qkc.149.1490877512731;
	Thu, 30 Mar 2017 05:38:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Thu, 30 Mar 2017 05:38:32 -0700 (PDT)
In-Reply-To: <1490860739-27953-1-git-send-email-liu.ming50@gmail.com>
References: <1490860739-27953-1-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 30 Mar 2017 08:38:32 -0400
Message-ID: <CADkTA4PWt3jnegr3yNUKu9oSCeskDkK-bF8YD-07bq9iDN1Gxw@mail.gmail.com>
To: liu.ming50@gmail.com
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: fix some incorrect inter-task dependencies
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
X-List-Received-Date: Thu, 30 Mar 2017 12:38:32 -0000
Content-Type: multipart/alternative; boundary=001a114fef348d2236054bf1f82c

--001a114fef348d2236054bf1f82c
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 30, 2017 at 3:58 AM, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> - Move the addtask statment that kernel_link_images needs run after
>   do_compile from linux-yocto.inc to kernel.bbclass. Or else the recipes
>   that inheriting kernel.bbclass might run into implicit dependency
>   issues.
> - Fix a typo, "addtask do_strip" should be "addtask strip".
> - Remove some redundant addtask statments, when "addtask A after B" is
>   set, then "addtask B before A" is not needed.
>

These should be multiple commits. Whenever you find yourself listing
changes in
a single commit header, it should really be multiple commits. Even if the
changes
are small.


>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/kernel.bbclass               | 5 +++--
>  meta/recipes-kernel/linux/linux-yocto.inc | 1 -
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 244087a..d175f1d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -538,6 +538,7 @@ do_kernel_link_images() {
>                 ln -sf ../../../vmlinuz.bin
>         fi
>  }
> +addtask kernel_link_images after do_compile
>
>  do_strip() {
>         if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
> @@ -566,7 +567,7 @@ do_strip() {
>  }
>  do_strip[dirs] = "${B}"
>
> -addtask do_strip before do_sizecheck after do_kernel_link_images
> +addtask strip before do_sizecheck after do_kernel_link_images
>
>  # Support checking the kernel size since some kernels need to reside in
> partitions
>  # with a fixed length or there is a limit in transferring the kernel to
> memory
> @@ -586,7 +587,7 @@ do_sizecheck() {
>  }
>  do_sizecheck[dirs] = "${B}"
>
> -addtask sizecheck before do_install after do_strip
> +addtask sizecheck before do_install
>

Although possibly redundant, I don't see the problem with leaving this in
place.
When we have the before and after here, it is self documenting when this
should
run.

With this removed, the reader must track down all the task dependencies
themselves
if they are to come to the same conclusion. Also, if that other task
dependency changes,
this will change.

So I prefer that this stay completely defined and self documenting.

Bruce


>
>  KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${
> MACHINE}-${DATETIME}"
>  # Don't include the DATETIME variable in the sstate package signatures
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 556546f..637506a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -65,6 +65,5 @@ do_install_append(){
>
>  # extra tasks
>  addtask kernel_version_sanity_check after do_kernel_metadata
> do_kernel_checkout before do_compile
> -addtask kernel_link_images after do_compile before do_strip
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114fef348d2236054bf1f82c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 30, 2017 at 3:58 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"=
mailto:peter.x.liu@external.atlascopco.com">peter.x.liu@external.<wbr>atlas=
copco.com</a>&gt;<br>
<br>
- Move the addtask statment that kernel_link_images needs run after<br>
=C2=A0 do_compile from linux-yocto.inc to kernel.bbclass. Or else the recip=
es<br>
=C2=A0 that inheriting kernel.bbclass might run into implicit dependency<br=
>
=C2=A0 issues.<br>
- Fix a typo, &quot;addtask do_strip&quot; should be &quot;addtask strip&qu=
ot;.<br>
- Remove some redundant addtask statments, when &quot;addtask A after B&quo=
t; is<br>
=C2=A0 set, then &quot;addtask B before A&quot; is not needed.<br></blockqu=
ote><div><br></div><div>These should be multiple commits. Whenever you find=
 yourself listing changes in <br></div><div>a single commit header, it shou=
ld really be multiple commits. Even if the changes<br></div><div>are small.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 5 +++--<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc | 1 -<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 244087a..d175f1d 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -538,6 +538,7 @@ do_kernel_link_images() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../vml=
inuz.bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+addtask kernel_link_images after do_compile<br>
<br>
=C2=A0do_strip() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KERNEL_IMAGE_STRIP_EXTRA_<wbr>S=
ECTIONS}&quot; ]; then<br>
@@ -566,7 +567,7 @@ do_strip() {<br>
=C2=A0}<br>
=C2=A0do_strip[dirs] =3D &quot;${B}&quot;<br>
<br>
-addtask do_strip before do_sizecheck after do_kernel_link_images<br>
+addtask strip before do_sizecheck after do_kernel_link_images<br>
<br>
=C2=A0# Support checking the kernel size since some kernels need to reside =
in partitions<br>
=C2=A0# with a fixed length or there is a limit in transferring the kernel =
to memory<br>
@@ -586,7 +587,7 @@ do_sizecheck() {<br>
=C2=A0}<br>
=C2=A0do_sizecheck[dirs] =3D &quot;${B}&quot;<br>
<br>
-addtask sizecheck before do_install after do_strip<br>
+addtask sizecheck before do_install<br></blockquote><div><br></div><div>Al=
though possibly redundant, I don&#39;t see the problem with leaving this in=
 place.<br></div><div>When we have the before and after here, it is self do=
cumenting when this should<br></div><div>run.<br><br></div><div>With this r=
emoved, the reader must track down all the task dependencies themselves<br>=
</div><div>if they are to come to the same conclusion. Also, if that other =
task dependency changes,<br></div><div>this will change.<br><br></div><div>=
So I prefer that this stay completely defined and self documenting.<br><br>=
</div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0KERNEL_IMAGE_BASE_NAME ?=3D &quot;${PKGE}-${PKGV}-${PKGR}-${<wbr>MACH=
INE}-${DATETIME}&quot;<br>
=C2=A0# Don&#39;t include the DATETIME variable in the sstate package signa=
tures<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc b/meta/recipes-=
kernel/linux/<wbr>linux-yocto.inc<br>
index 556546f..637506a 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
@@ -65,6 +65,5 @@ do_install_append(){<br>
<br>
=C2=A0# extra tasks<br>
=C2=A0addtask kernel_version_sanity_check after do_kernel_metadata do_kerne=
l_checkout before do_compile<br>
-addtask kernel_link_images after do_compile before do_strip<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a114fef348d2236054bf1f82c--
