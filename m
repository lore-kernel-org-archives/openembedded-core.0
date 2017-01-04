Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id D120F65D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 14:31:58 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id c47so491832313qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 06:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eSM9FkywJ3Tqe6G7wLJPX8ir8Q32ohCTFoaf7IbHuwY=;
	b=ketFJXI5ODssZLbpTuNASEmIqYo8x/P0M6dMy3LKzk7p7JOYwVN/xAaxVDCW8rJC48
	MY2SO/nbAJlBOTa0MzwbXWkOJJZEqn8sXae6IHk5wOAjn0q7o9S9w7Q52GdOp6KltEo2
	3XzC+CgUmpapyM96bcFUKjMkwh6g049eTwtEryF65k3sgY6UobUvUoxran91sUCamLb8
	4tdwnqspvY5XQqZZAbtYgbw8FLq3FSbLIYlh7HZQ5/M3TCz0SuTQ2J2b4as7lNcFz+7+
	tpKf7E5keihPgW0vsLcGhg0IRHk9XA470Z6raAEoS7K3DMT7GUSj/CX0RbTaey2IxRG6
	X/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eSM9FkywJ3Tqe6G7wLJPX8ir8Q32ohCTFoaf7IbHuwY=;
	b=tRFCnnHOKZZNdDchCa3d8XntOBFxCICy3ZMKtUoAS7S9MPMvHNmdDkoZBrFZ6yg64Z
	aKwwwmpvYZwj+pPIGOdtXWstLiesBYzOcdeP8Tu0WqF/JYlLrL35IAcyVlyYSHAcdice
	WfAfXJ+xljMpzIuGy+5DiIYmNH+jkzbvztfmDs/VPk/S8txtUKEBh7OlXq7r97XKwkio
	UpZFLOds/ctfBHM9k+z3xANsnfQszH2L576oCDMUpwrYkrocsRLFvgRFK3+D1ps4WlD8
	rtUPnoohNzJ+Sa3HPVeM2QpDx5+FKbvK30HsDVJa0yNKTz1nNzojiPYMucIsIl+VmQte
	3Qjg==
X-Gm-Message-State: AIkVDXI3+4flVoD3pjJQ4DTDq5FqvrnXss8mX/k6jbylLn2B0KwcGZnf036BFXky3eA3ba7nZ8eDf17PuTqplgIR
X-Received: by 10.237.39.133 with SMTP id a5mr66243704qtd.65.1483540318781;
	Wed, 04 Jan 2017 06:31:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 4 Jan 2017 06:31:38 -0800 (PST)
In-Reply-To: <1483434305-15926-1-git-send-email-Haiqing.Bai@windriver.com>
References: <1483434305-15926-1-git-send-email-Haiqing.Bai@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jan 2017 14:31:38 +0000
Message-ID: <CAJTo0LZs61bWkyum1imEHqYGdFrx+Hp+kAek8hZchBSbs9Ty1w@mail.gmail.com>
To: Haiqing Bai <Haiqing.Bai@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kernel.
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
X-List-Received-Date: Wed, 04 Jan 2017 14:32:00 -0000
Content-Type: multipart/alternative; boundary=f403045f3c88b659b8054545a5da

--f403045f3c88b659b8054545a5da
Content-Type: text/plain; charset=UTF-8

An upgrade to 2.0.14 was recently posted on the list (and is now in
poky-contrib:ross/mut), can you verify that this patch is still required
with that release and rebase?

Ross

On 3 January 2017 at 09:05, Haiqing Bai <Haiqing.Bai@windriver.com> wrote:

> If LPAE is enabled, 3 level page table is used and the 'SECTION_SIZE'
> is (1<<21), so add_buffer_phys_virt() should align to (1 << 21).
>
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  ...-ARM-fix-add_buffer_phys_virt-align-issue.patch | 52
> ++++++++++++++++++++++
>  meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb    |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_
> buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/
> kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch
> new file mode 100644
> index 0000000..7d1f95e
> --- /dev/null
> +++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_
> buffer_phys_virt-align-issue.patch
> @@ -0,0 +1,52 @@
> +From 380019f68e19ac863cf32dc7ff6784e8fe1d751f Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Mon, 19 Dec 2016 14:52:02 +0800
> +Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue.
> +
> +When "CONFIG_ARM_LPAE" is enabled,3 level page table
> +is used by MMU, the "SECTION_SIZE" is defined with
> +(1 << 21), but 'add_buffer_phys_virt()' hardcode this
> +to (1 << 20).
> +
> +Upstream-Status: Pending
> +
> +Suggested-By:fredrik.markstrom@gmail.com
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + kexec/arch/arm/crashdump-arm.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-
> arm.c
> +index 38a1401..e41b7fb 100644
> +--- a/kexec/arch/arm/crashdump-arm.c
> ++++ b/kexec/arch/arm/crashdump-arm.c
> +@@ -271,6 +271,7 @@ int load_crashdump_segments(struct kexec_info *info,
> char *mod_cmdline)
> +       void *buf;
> +       int err;
> +       int last_ranges;
> ++      unsigned short align_bit_shift = 20;
> +
> +       /*
> +        * First fetch all the memory (RAM) ranges that we are going to
> pass to
> +@@ -295,6 +296,7 @@ int load_crashdump_segments(struct kexec_info *info,
> char *mod_cmdline)
> +
> +               /* for support LPAE enabled kernel*/
> +               elf_info.class = ELFCLASS64;
> ++              align_bit_shift = 21;
> +
> +               err = crash_create_elf64_headers(info, &elf_info,
> +                                        usablemem_rgns.ranges,
> +@@ -315,8 +317,9 @@ int load_crashdump_segments(struct kexec_info *info,
> char *mod_cmdline)
> +        * 1MB) so that available memory passed in kernel command line
> will be
> +        * aligned to 1MB. This is because kernel create_mapping() wants
> memory
> +        * regions to be aligned to SECTION_SIZE.
> ++         * The SECTION_SIZE of LPAE kernel is '1UL << 21' defined in
> pgtable-3level.h
> +        */
> +-      elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << 20,
> ++      elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 <<
> align_bit_shift,
> +                                         crash_reserved_mem.start,
> +                                         crash_reserved_mem.end, -1, 0);
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> index 59376c8..3e38923 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> @@ -8,6 +8,7 @@ SRC_URI += " \
>              file://0002-powerpc-change-the-memory-size-limit.patch \
>              file://0001-purgatory-Pass-r-directly-to-linker.patch \
>              file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
> +            file://kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch \
>           "
>
>  SRC_URI[md5sum] = "10ddaae0e86af54407b164a1f5a39cc3"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f3c88b659b8054545a5da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">An upgrade to 2.0.14 was recently posted on the list (and =
is now in poky-contrib:ross/mut), can you verify that this patch is still r=
equired with that release and rebase?<div><br></div><div>Ross</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 3 January 2017 a=
t 09:05, Haiqing Bai <span dir=3D"ltr">&lt;<a href=3D"mailto:Haiqing.Bai@wi=
ndriver.com" target=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">If LPAE is enabled, 3 level page tabl=
e is used and the &#39;SECTION_SIZE&#39;<br>
is (1&lt;&lt;21), so add_buffer_phys_virt() should align to (1 &lt;&lt; 21)=
.<br>
<br>
Signed-off-by: Haiqing Bai &lt;<a href=3D"mailto:Haiqing.Bai@windriver.com"=
>Haiqing.Bai@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-ARM-fix-add_buffer_phys_<wbr>virt-align-issue.patch | 52 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" re=
l=3D"noreferrer" target=3D"_blank">kexe<wbr>c-tools_2.0.12.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 53 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/kexec-A=
RM-fix-add_<wbr>buffer_phys_virt-align-issue.<wbr>patch<br>
<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/kexec-ARM-fix-add_<=
wbr>buffer_phys_virt-align-issue.<wbr>patch b/meta/recipes-kernel/kexec/<wb=
r>kexec-tools/kexec-ARM-fix-add_<wbr>buffer_phys_virt-align-issue.<wbr>patc=
h<br>
new file mode 100644<br>
index 0000000..7d1f95e<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/kexec/<wbr>kexec-tools/kexec-ARM-fix-add_<wbr>buf=
fer_phys_virt-align-issue.<wbr>patch<br>
@@ -0,0 +1,52 @@<br>
+From 380019f68e19ac863cf32dc7ff6784<wbr>e8fe1d751f Mon Sep 17 00:00:00 200=
1<br>
+From: Haiqing Bai &lt;<a href=3D"mailto:Haiqing.Bai@windriver.com">Haiqing=
.Bai@windriver.com</a>&gt;<br>
+Date: Mon, 19 Dec 2016 14:52:02 +0800<br>
+Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue.<br>
+<br>
+When &quot;CONFIG_ARM_LPAE&quot; is enabled,3 level page table<br>
+is used by MMU, the &quot;SECTION_SIZE&quot; is defined with<br>
+(1 &lt;&lt; 21), but &#39;add_buffer_phys_virt()&#39; hardcode this<br>
+to (1 &lt;&lt; 20).<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+<a href=3D"mailto:Suggested-By%3Afredrik.markstrom@gmail.com">Suggested-By=
:fredrik.<wbr>markstrom@gmail.com</a><br>
+Signed-off-by: Haiqing Bai &lt;<a href=3D"mailto:Haiqing.Bai@windriver.com=
">Haiqing.Bai@windriver.com</a>&gt;<br>
+---<br>
+ kexec/arch/arm/crashdump-arm.c | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/kexec/arch/arm/crashdump-<wbr>arm.c b/kexec/arch/arm/crashdum=
p-<wbr>arm.c<br>
+index 38a1401..e41b7fb 100644<br>
+--- a/kexec/arch/arm/crashdump-<wbr>arm.c<br>
++++ b/kexec/arch/arm/crashdump-<wbr>arm.c<br>
+@@ -271,6 +271,7 @@ int load_crashdump_segments(struct kexec_info *info, c=
har *mod_cmdline)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int last_ranges;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned short align_bit_shift =3D 20;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * First fetch all the memory (RAM) ranges that=
 we are going to pass to<br>
+@@ -295,6 +296,7 @@ int load_crashdump_segments(struct kexec_info *info, c=
har *mod_cmdline)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* for support LPAE=
 enabled kernel*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_info.class =3D =
ELFCLASS64;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 align_bit_shift =3D 21;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D crash_creat=
e_elf64_headers(<wbr>info, &amp;elf_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usableme=
m_rgns.ranges,<br>
+@@ -315,8 +317,9 @@ int load_crashdump_segments(struct kexec_info *info, c=
har *mod_cmdline)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1MB) so that available memory passed in kern=
el command line will be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * aligned to 1MB. This is because kernel creat=
e_mapping() wants memory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * regions to be aligned to SECTION_SIZE.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The SECTION_SIZE of LPAE kernel is &#=
39;1UL &lt;&lt; 21&#39; defined in pgtable-3level.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 elfcorehdr =3D add_buffer_phys_virt(info, buf, bufsz=
, bufsz, 1 &lt;&lt; 20,<br>
++=C2=A0 =C2=A0 =C2=A0 elfcorehdr =3D add_buffer_phys_virt(info, buf, bufsz=
, bufsz, 1 &lt;&lt; align_bit_shift,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cr=
ash_reserved_mem.start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cr=
ash_reserved_mem.end, -1, 0);<br>
+<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12=
.bb" rel=3D"noreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.12.bb</a> b/=
meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.12.bb</a><br>
index 59376c8..3e38923 100644<br>
--- a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" re=
l=3D"noreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.12.bb</a><br>
+++ b/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" re=
l=3D"noreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.12.bb</a><br>
@@ -8,6 +8,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-powerpc-change-=
<wbr>the-memory-size-limit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-purgatory-Pass-=
r-<wbr>directly-to-linker.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-vmcore-dmesg-<w=
br>Define-_GNU_SOURCE.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://kexec-ARM-fix-add_<wbr>bu=
ffer_phys_virt-align-issue.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>10ddaae0e86af54407b164a1f5a39c<wbr>c3&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045f3c88b659b8054545a5da--
