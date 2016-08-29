Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 101BF6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:10:59 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id l2so135172750qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 05:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ls281y2nDsucNRHqP+ZNRn7Tjc7QFg9ir+NnCjGDUAI=;
	b=LS9CG9VwW/T5bxW42oFYPh4wGSM2ecCIhyEKSA0jhlU4IkAv2mOSNbcAVN42jZz0G5
	+vLC1Xh3wUNr8s1eOUaFAgVb79xyX5KSXKZ7iYNRhWLxTlHpOxRd4x/UAVfDsiSwvXOJ
	oH3CfwlIKahy7dzWfwWKbHQmhzGFHldP8nv9jUguW+SzhDn18hEnTUTxGZLZ9ml0J+ZF
	YGA/asX1+aqZH0VXplr3XJah3mE3q+aABHjMGUrykIxTNGW2tEB6qqZw+ql9wFY1CMvd
	OLxiKUcpSIMQvoDMHTx8pbv3yOpvlPNoMpAHDOiAlBuNZQqjEQcOnLGZWn5Npyk1HKRl
	Vk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ls281y2nDsucNRHqP+ZNRn7Tjc7QFg9ir+NnCjGDUAI=;
	b=ZAoau6ihCBVXy8P5cX9JHm2/ImoT+rPNuKGzoDcZYGSI4yMjuCtcK5gvG9dNQKLWI7
	A+ptjik0fLxFiPaftsRbXmIHFq9s7AMmAu7vSxumz0u6P+jKKw/EyE9RfNk7kvxTVerM
	Ikmr2Wr3SYRpKRbDG37u7TgrnO8V0L0+qiB5Q7rLhxwNAzeQf/NOCHIAXR2Gtz2bzd09
	euO4hfF9cJNV3hf9ddAlKqbtUM1mEJRnV8JYaIAMtD1di1ZnnXOVydQAypPqoFOwE/su
	7l7vdi63YRRMwZ1LeDAVReBDVj+i/3UENAHbRhTPjXMJxCun4yEJh61uxjMjfVVi15sl
	O05w==
X-Gm-Message-State: AE9vXwP0ofKNFg+pukxFosFL8FOr+dAo8b5Q+07ZY6Jq0dG0j1MSCL3oOMr5jbCSjzjJuqKBV+Ss7GB6j+BBhw==
X-Received: by 10.55.143.134 with SMTP id r128mr18602508qkd.161.1472472660380; 
	Mon, 29 Aug 2016 05:11:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 29 Aug 2016 05:10:59 -0700 (PDT)
In-Reply-To: <20160829091958.1125-1-adrian.ratiu@ni.com>
References: <20160829091958.1125-1-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2016 08:10:59 -0400
Message-ID: <CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_kernel_configme: Fix silent sysroot poisoning error
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
X-List-Received-Date: Mon, 29 Aug 2016 12:11:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c083454dd1c9c053b34c1dc

--94eb2c083454dd1c9c053b34c1dc
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> do_kernel_configme calls merge_config.sh (installed in the sysroot by
> the kern-tools-native recipe) which calls make to fill in any missing
> symbols from the resulting merged config.


That's not what it does ... but that isn't important.


>
> This errors out on my system because of sysroot poisoning [1]. Here is
> a partial output from my .kernel-meta/cfg/merge_config_build.log (this
> file is created in do_kernel_configme() while callig merge_config.sh):
>
> make[1]: Entering directory '/media/adi/ssd/nilrt-master/
> build/tmp-glibc/work/x64-nilrt-linux/linux-nilrt/4.1+
> gitAUTOINC+a7e53ecc27-r0/linux-x64-standard-build'
>   HOSTCC  scripts/basic/fixdep
> /media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
> x64/kernel-source/scripts/basic/fixdep.c:106:23: fatal error:
> sys/types.h: No such file or directory
> compilation terminated.
> make[2]: *** [/media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
> x64/kernel-source/scripts/basic/Makefile:22: scripts/basic/x86_64-nilrt-linux-fixdep]
> Error 1
>

This just means that we are missing a dependency. Everything that
merge_config
needs should be already in place before it runs, i.e. do_kernel_metadata
should
have already run and built any host tools that it needs.

How are you managing to trigger this error ? I've done plenty of builds,
and haven't
seen this one before.

Bruce


>
> This issue is hard to debug because merge_config.sh does NOT check the
> error output of its make call (this is added in the second patch) and
> even though make errors out, the build continues as if nothing happened
> and compiles a kernel with garbage configs (the .config generated by
> do_kernel_configme is empty and gets filled later) which doesn't boot.
>
> Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.sh
> fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and make
> uses it to correctly compile & fill all missing kernel config options.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/
> 2014-October/098253.html
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 8650e55..4397a9d 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -249,7 +249,7 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue
> (${meta_dir}/config.queue)"
>         fi
>
> -       ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" ARCH=${ARCH}
> merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
>         if [ $? -ne 0 ]; then
>                 bbfatal_log "Could not configure
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
>         fi
> --
> 2.9.3
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c083454dd1c9c053b34c1dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&l=
t;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">do_kernel_confi=
gme calls merge_config.sh (installed in the sysroot by<br>
the kern-tools-native recipe) which calls make to fill in any missing<br>
symbols from the resulting merged config.</blockquote><div><br></div><div>T=
hat&#39;s not what it does ... but that isn&#39;t important.=C2=A0<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
This errors out on my system because of sysroot poisoning [1]. Here is<br>
a partial output from my .kernel-meta/cfg/merge_config_<wbr>build.log (this=
<br>
file is created in do_kernel_configme() while callig merge_config.sh):<br>
<br>
make[1]: Entering directory &#39;/media/adi/ssd/nilrt-master/<wbr>build/tmp=
-glibc/work/x64-<wbr>nilrt-linux/linux-nilrt/4.1+<wbr>gitAUTOINC+a7e53ecc27=
-r0/<wbr>linux-x64-standard-build&#39;<br>
=C2=A0 HOSTCC=C2=A0 scripts/basic/fixdep<br>
/media/adi/ssd/nilrt-master/<wbr>build/tmp-glibc/work-shared/<wbr>x64/kerne=
l-source/scripts/<wbr>basic/fixdep.c:106:23: fatal error: sys/types.h: No s=
uch file or directory<br>
compilation terminated.<br>
make[2]: *** [/media/adi/ssd/nilrt-master/<wbr>build/tmp-glibc/work-shared/=
<wbr>x64/kernel-source/scripts/<wbr>basic/Makefile:22: scripts/basic/x86_64=
-nilrt-<wbr>linux-fixdep] Error 1<br></blockquote><div><br></div><div>This =
just means that we are missing a dependency. Everything that merge_config</=
div><div>needs should be already in place before it runs, i.e. do_kernel_me=
tadata should</div><div>have already run and built any host tools that it n=
eeds.</div><div><br></div><div>How are you managing to trigger this error ?=
 I&#39;ve done plenty of builds, and haven&#39;t</div><div>seen this one be=
fore.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
This issue is hard to debug because merge_config.sh does NOT check the<br>
error output of its make call (this is added in the second patch) and<br>
even though make errors out, the build continues as if nothing happened<br>
and compiles a kernel with garbage configs (the .config generated by<br>
do_kernel_configme is empty and gets filled later) which doesn&#39;t boot.<=
br>
<br>
Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.sh<br>
fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and make<br>
uses it to correctly compile &amp; fill all missing kernel config options.<=
br>
<br>
[1] <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
14-October/098253.html" rel=3D"noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/<wbr>pipermail/openembedded-core/<wbr>2014-October/098253.h=
tml</a><br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.<wbr>bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.<wbr>bbclass b/meta/classes/kernel-y=
octo.<wbr>bbclass<br>
index 8650e55..4397a9d 100644<br>
--- a/meta/classes/kernel-yocto.<wbr>bbclass<br>
+++ b/meta/classes/kernel-yocto.<wbr>bbclass<br>
@@ -249,7 +249,7 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not find configuration queue (${meta_dir}/config.queue)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D${ARCH} merge_config.sh -O ${B} ${config=
_flags} ${configs} &gt; ${meta_dir}/cfg/merge_config_<wbr>build.log 2&gt;&a=
mp;1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} &gt;=
 ${meta_dir}/cfg/merge_config_<wbr>build.log 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not configure ${KMACHINE}-${LINUX_KERNEL_<wbr>TYPE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c083454dd1c9c053b34c1dc--
