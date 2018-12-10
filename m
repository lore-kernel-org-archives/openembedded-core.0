Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id AA8806BF3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 16:58:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id l10so8523207lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 08:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EbPMjVUvJ7Nqvzhmpv2nowwgsoW6YMGxCDqnDGYta+M=;
	b=PjTSE1Qo0/tiA+AJHJx2ImFXUQ83B+nxgTNT88Zl5qJdue5lLFCls7zTPH/1I79LJn
	h4zn6WL59QbBNCXOK82IRKQnIjvUaCaF+d0d+Xy4bUetA17cRdL+Bwf7v/bwGHgv1+uE
	de1jkw2NQrRDPhWvIrr9ZG0lXbCJ7MCZFoi27VROJTCuoe1XYwD0pJTpBgBFTtAYarY0
	yF+h6WjJLp2ILx5R9tTnPl2D91SGo+7OcA1FAHgWAh9+lQmlw4hgMByiUpgUGNW56YQd
	m//1hhARJ2WTPl9xRB/YjALK0TiWLEakAVhE/WO/+TJ5xUBMcUsde9QhNexN+hTFLO9B
	KyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EbPMjVUvJ7Nqvzhmpv2nowwgsoW6YMGxCDqnDGYta+M=;
	b=gg5lNVut0mKn+R3d/DQfgVdaQ29oQXXV0aHydVbptpbGZBxOg+4j8dz3vmXsfY8RE6
	lF0otMmZauOQ2nekzbMUoRBdL5g8sd/Ki/aqkFDLT+8jVbv+1yUu5RkqnZGJLlctSiaF
	Xxw/FocK4w5bz8VxGE3SknkEGCD2n/W9HDNEOixnto+NkB3gfz4NbwmRkXdIICd6T1u7
	oNhjTdzuqpT4AfrRFNB2yoQTNjrPtKWmiNqPJt7/DoSSkfIeGAioBy/P+LL1l2VFRDKK
	CYEsCpP4ZvFReDwiWt7X+imNLPOlxR8e9ARL7pth6nR2Kirt1VsOZHYSZ33nexhbVNyn
	MJEw==
X-Gm-Message-State: AA+aEWZlEoL7LioUtcV90q/jkvc6kTIXU1iCIXaLTJkyLE45DqU9R7Kb
	Qbjy0X4Qmm3+bFX+fo9CcqJ1m3LR1lsP0pGFZfU=
X-Google-Smtp-Source: AFSGD/UNFtvcVWe8H+wj+UghTwDzWH6k6dELylEv1tWULOQPCEG9CywKmX2xp5K7cGKxfmXAZcvng6Hu2R62g/+CVV8=
X-Received: by 2002:a19:c203:: with SMTP id l3mr7035160lfc.113.1544461117882; 
	Mon, 10 Dec 2018 08:58:37 -0800 (PST)
MIME-Version: 1.0
References: <1542809165-118869-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1542809165-118869-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Dec 2018 11:58:25 -0500
Message-ID: <CADkTA4NenFJOSNuNz_YRPaGSqoaqRjFUBVwo4s=-dA4jmnUJ_A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] linux-libc-headers: Fix build failure by using fixed temporary file instead of pipe
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
X-List-Received-Date: Mon, 10 Dec 2018 16:58:38 -0000
Content-Type: multipart/alternative; boundary="0000000000004d0826057cade0dd"

--0000000000004d0826057cade0dd
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 21, 2018 at 9:06 AM <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> This is a workaround for the following possible build failure.
>
> *** Compiler lacks asm-goto support.. Stop.
>
> When building linux-libc-headers we need to use binutils on build machine.
> binutils v2.31 introduces a bug that could cause scripts/gcc-goto.sh to
> fail
> when running in an environment where /tmp is rarely used, e.g. in docker.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v2: Improve commit log
> v3: Shorten long lines as patchwork suggested
> v4: Shorten subject line...
>
>  ...-fixed-temporary-file-instead-of-pipe-for.patch | 70
> ++++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_4.18.bb  |  4 ++
>  2 files changed, 74 insertions(+)
>  create mode 100644
> meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
>
> diff --git
> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> new file mode 100644
> index 0000000..0d8fa80
> --- /dev/null
> +++
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> @@ -0,0 +1,70 @@
> +From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Wed, 21 Nov 2018 15:12:43 +0800
> +Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for
> + here-doc
> +
> +There was a bug of "as" in binutils that when it checks if the input file
> and
> +output file are the same one, it would not check if they are on the same
> block
> +device. The check is introduced by the following commit in v2.31.
> +
> +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
> +67f846b59b32f3d704c601669409c2584383fea9
> <https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=+67f846b59b32f3d704c601669409c2584383fea9>
>

Can you double check the links to the upstream changes ? They didn't work
for me.



> +
> +The here-doc usage in this script creates temporary file in /tmp. When we
> run in
> +an environment where /tmp has rarely been used, the newly created
> temporary file
> +may have a very low inode number. If the inode number was 6 which is the
> same as
> +/dev/null, the as would wrongly think the input file and the output file
> are the
> +same and report the following error.
> +
> +*** Compiler lacks asm-goto support.. Stop.
> +
> +One observed case happened in docker where the /tmp could be so rarely
> used that
> +very low number inode may be allocated and triggers the error.
> +
> +The fix below for the bug only exists on the master branch of binutils so
> far
> +and has not been released from upstream. As the convict is introduced
> since
> +v2.31, only v2.31 is affected.
> +
> +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
> +2a50366ded329bfb39d387253450c9d5302c3503
> <https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=+2a50366ded329bfb39d387253450c9d5302c3503>
> +
> +When building linux-libc-headers we need to use "as" in binutils which
> does not
> +contain the fix for the moment. To work around the error, we create a
> fixed
> +temporary file to contain the program being tested.
> +
> +This patch also removes ">/dev/null 2>&1" so we will have more direct
> error
> +information in case something else wrong happened.
> +
> +Upstream-Status: Inappropriate [A work around for binutils v2.31]
>

It would be nice to have a way to test for the host binutils version, since
without it
we have no way to know when we can stop carrying this change.

Not that the change is all that complex or should cause any problems, it is
just
very open ended without a check.

Did you look into any conditional way to test the binutils in the recipe
and only
patch if required ?

Bruce



> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + scripts/gcc-goto.sh | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
> +index 083c526..0aaf1b4 100755
> +--- a/scripts/gcc-goto.sh
> ++++ b/scripts/gcc-goto.sh
> +@@ -3,7 +3,9 @@
> + # Test for gcc 'asm goto' support
> + # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
> +
> +-cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
> ++TMPFILE=`mktemp -p .`
> ++
> ++cat << "END" > ${TMPFILE}
> + int main(void)
> + {
> + #if defined(__arm__) || defined(__aarch64__)
> +@@ -20,3 +22,6 @@ entry:
> +       return 0;
> + }
> + END
> ++
> ++$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
> ++rm ${TMPFILE}
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_4.18.bb b/meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_4.18.bb
> index eb7bee7..00420aa 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> @@ -9,5 +9,9 @@ SRC_URI_append_libc-musl = "\
>      file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
>     "
>
> +SRC_URI_append = "\
> +
> file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch \
> +"
> +
>  SRC_URI[md5sum] = "bee5fe53ee1c3142b8f0c12c0d3348f9"
>  SRC_URI[sha256sum] =
> "19d8bcf49ef530cd4e364a45b4a22fa70714b70349c8100e7308488e26f1eaf1"
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
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004d0826057cade0dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Nov 21, 2018=
 at 9:06 AM &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_blank">z=
he.he@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_blank">=
zhe.he@windriver.com</a>&gt;<br>
<br>
This is a workaround for the following possible build failure.<br>
<br>
*** Compiler lacks asm-goto support.. Stop.<br>
<br>
When building linux-libc-headers we need to use binutils on build machine.<=
br>
binutils v2.31 introduces a bug that could cause scripts/gcc-goto.sh to fai=
l<br>
when running in an environment where /tmp is rarely used, e.g. in docker.<b=
r>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br>
---<br>
v2: Improve commit log<br>
v3: Shorten long lines as patchwork suggested<br>
v4: Shorten subject line...<br>
<br>
=C2=A0...-fixed-temporary-file-instead-of-pipe-for.patch | 70 +++++++++++++=
+++++++++<br>
=C2=A0.../linux-libc-headers/<a href=3D"http://linux-libc-headers_4.18.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_4.18.bb</a>=C2=A0 |=
=C2=A0 4 ++<br>
=C2=A02 files changed, 74 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-=
headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001=
-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recipes-=
kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-tempora=
ry-file-instead-of-pipe-for.patch<br>
new file mode 100644<br>
index 0000000..0d8fa80<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-script=
s-Use-fixed-temporary-file-instead-of-pipe-for.patch<br>
@@ -0,0 +1,70 @@<br>
+From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001<br>
+From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_blank"=
>zhe.he@windriver.com</a>&gt;<br>
+Date: Wed, 21 Nov 2018 15:12:43 +0800<br>
+Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for<br>
+ here-doc<br>
+<br>
+There was a bug of &quot;as&quot; in binutils that when it checks if the i=
nput file and<br>
+output file are the same one, it would not check if they are on the same b=
lock<br>
+device. The check is introduced by the following commit in v2.31.<br>
+<br>
+<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3D=
commit;h=3D+67f846b59b32f3d704c601669409c2584383fea9" rel=3D"noreferrer" ta=
rget=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;=
a=3Dcommit;h=3D<br>
+67f846b59b32f3d704c601669409c2584383fea9</a><br>
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Can you double check the links to the upstream changes ? They =
didn&#39;t work</div><div class=3D"gmail_default" style=3D"font-size:small"=
>for me.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+<b=
r>
+The here-doc usage in this script creates temporary file in /tmp. When we =
run in<br>
+an environment where /tmp has rarely been used, the newly created temporar=
y file<br>
+may have a very low inode number. If the inode number was 6 which is the s=
ame as<br>
+/dev/null, the as would wrongly think the input file and the output file a=
re the<br>
+same and report the following error.<br>
+<br>
+*** Compiler lacks asm-goto support.. Stop.<br>
+<br>
+One observed case happened in docker where the /tmp could be so rarely use=
d that<br>
+very low number inode may be allocated and triggers the error.<br>
+<br>
+The fix below for the bug only exists on the master branch of binutils so =
far<br>
+and has not been released from upstream. As the convict is introduced sinc=
e<br>
+v2.31, only v2.31 is affected.<br>
+<br>
+<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3D=
commit;h=3D+2a50366ded329bfb39d387253450c9d5302c3503" rel=3D"noreferrer" ta=
rget=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;=
a=3Dcommit;h=3D<br>
+2a50366ded329bfb39d387253450c9d5302c3503</a><br>
+<br>
+When building linux-libc-headers we need to use &quot;as&quot; in binutils=
 which does not<br>
+contain the fix for the moment. To work around the error, we create a fixe=
d<br>
+temporary file to contain the program being tested.<br>
+<br>
+This patch also removes &quot;&gt;/dev/null 2&gt;&amp;1&quot; so we will h=
ave more direct error<br>
+information in case something else wrong happened.<br>
+<br>
+Upstream-Status: Inappropriate [A work around for binutils v2.31]<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">It would be nice to have a way to test for the host binutils versio=
n, since without it</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">we have no way to know when we can stop carrying this change.=C2=A0</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Not that the change is all =
that complex or should cause any problems, it is just</div><div class=3D"gm=
ail_default" style=3D"font-size:small">very open ended without a check.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Did you look into any condit=
ional way to test the binutils in the recipe and only</div><div class=3D"gm=
ail_default" style=3D"font-size:small">patch if required ?</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
+<br>
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=
=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
+---<br>
+ scripts/gcc-goto.sh | 7 ++++++-<br>
+ 1 file changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh<br>
+index 083c526..0aaf1b4 100755<br>
+--- a/scripts/gcc-goto.sh<br>
++++ b/scripts/gcc-goto.sh<br>
+@@ -3,7 +3,9 @@<br>
+ # Test for gcc &#39;asm goto&#39; support<br>
+ # Copyright (C) 2010, Jason Baron &lt;<a href=3D"mailto:jbaron@redhat.com=
" target=3D"_blank">jbaron@redhat.com</a>&gt;<br>
+ <br>
+-cat &lt;&lt; &quot;END&quot; | $@ -x c - -c -o /dev/null &gt;/dev/null 2&=
gt;&amp;1 &amp;&amp; echo &quot;y&quot;<br>
++TMPFILE=3D`mktemp -p .`<br>
++<br>
++cat &lt;&lt; &quot;END&quot; &gt; ${TMPFILE}<br>
+ int main(void)<br>
+ {<br>
+ #if defined(__arm__) || defined(__aarch64__)<br>
+@@ -20,3 +22,6 @@ entry:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+ END<br>
++<br>
++$@ -x c ${TMPFILE} -c -o /dev/null &amp;&amp; echo &quot;y&quot;<br>
++rm ${TMPFILE}<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux=
-libc-headers_4.18.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-head=
ers_4.18.bb</a> b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://=
linux-libc-headers_4.18.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc=
-headers_4.18.bb</a><br>
index eb7bee7..00420aa 100644<br>
--- a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_4.18.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_4.1=
8.bb</a><br>
+++ b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_4.18.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_4.1=
8.bb</a><br>
@@ -9,5 +9,9 @@ SRC_URI_append_libc-musl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0001-include-linux-stddef.h-in-swab.h-uapi-heade=
r.patch \<br>
=C2=A0 =C2=A0 &quot;<br>
<br>
+SRC_URI_append =3D &quot;\<br>
+=C2=A0 =C2=A0 file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe=
-for.patch \<br>
+&quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;bee5fe53ee1c3142b8f0c12c0d3348f9&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;19d8bcf49ef530cd4e364a45b4a22fa70714b703=
49c8100e7308488e26f1eaf1&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_7788677128731203657gmail_signature" data-smartmail=3D"gmail_sig=
nature">- Thou shalt not follow the NULL pointer, for chaos and madness awa=
it thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Tre=
k II<br><br></div></div>

--0000000000004d0826057cade0dd--
