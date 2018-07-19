Return-Path: <anibal.limon@linaro.org>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1A8D478A91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:17:46 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id t14-v6so5274170uao.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b+BvaKAC9Ab5Zhzl3frjoFucN6xCA/gqAhT1LLsvOdM=;
	b=fJ6PT9b1oLzUHs/5HsNPxtVW8wDu/81GhEtajXpWQw9NctyBbUJkHywlBtc3mYYIyu
	nnGaQzKzoRcpnXlqF/+7rg8U4mRLxspLoFBJ+95MdsjlIs9wIIrp4qvViEhTPTy9cKhX
	8SyKkFimTEobDPhxj2tQNO/feL0ot8vrQlm/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b+BvaKAC9Ab5Zhzl3frjoFucN6xCA/gqAhT1LLsvOdM=;
	b=Iyl1k61h+xtGnSTvE77cv3AbSzBPOoeD+sYiRD5iSEfBxA1UVKx5af6lmXSJLgl5TJ
	qOQBCK2O/P2MRvQ4SLM59dJBop8+zD7JmzgEX8Go25YPM/rqHBDQSGwd/214/t71aDh2
	V8O3VUgA0b9eP1YaKEr150wRgN4Do0saWT6vMhAluGhLqeP7QLDpO0hIt5eOmgfEEIlx
	Y/N8PoYxIdajTgH1A6gNgU0MQh48D2GXNtqqlzVZF5AU6BYGKVMy8BKNs0e+Awlni2C3
	6aIo5Gol9vKKZjqAvGNH3IaJ0wUst94QXuPawT1++Ni8pRKrLAcd9eDm21g0/NPrc1qw
	5p2g==
X-Gm-Message-State: AOUpUlHefpY1uGakgz2PQT8UV4/YPj6l98bkbdE3ArPDLqPm8qQLMQzB
	a8OJ4xKBJjU+C+fejtttdxB1+x1y1POJD1VakT/BFA==
X-Google-Smtp-Source: AAOMgpe9rn4RChzTeufS+9PZs8eSnj5jjEKeVWZPWig3UB4/wmatXlIMdeHysxkaSe26j+NguTlJOvBFhcxvDTjYlT4=
X-Received: by 2002:a9f:3a46:: with SMTP id
	r6-v6mr6795821uag.145.1532009867948; 
	Thu, 19 Jul 2018 07:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <1531963618-29674-1-git-send-email-daniel.diaz@linaro.org>
In-Reply-To: <1531963618-29674-1-git-send-email-daniel.diaz@linaro.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Thu, 19 Jul 2018 09:17:36 -0500
Message-ID: <CA+_AqitG1e1=310aqEcxp0aXgeiP3oDJ8W+u=9Xy+HFS_KyMfw@mail.gmail.com>
To: =?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?= <daniel.diaz@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Thu, 19 Jul 2018 14:17:47 -0000
Content-Type: multipart/alternative; boundary="000000000000f8c57705715ad74b"

--000000000000f8c57705715ad74b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Jul 2018 at 20:27, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wro=
te:

> Once another header #includes <bits/wordsize.h>, there is a
> potential recursion going on because the
> multilib_header_wrapper.h #includes <bits/wordsize.h> again!
>
> This should not happen because an __arm__ (32-bits) or an
> __aarch64__ (64-bits) environment guarantees that we will
> be getting the correct definition, but when building against
> a different target (like BPF), recursion is what happens.
>
> This can be seen, for instance, when building eBPF programs
> from the kernel with `clang -target bpf', such as the ones
> located in linux/tools/testing/selftests/bpf/.
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
>
Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>

> ---
>  meta/recipes-core/glibc/glibc-package.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index ae3f2f6..a4f61f8 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -136,8 +136,7 @@ do_install_append_armeb () {
>  }
>
>  do_install_armmultilib () {
> -
> -       oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h
> bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
> +       oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h
> bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
>         oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h
> bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.=
h
> bits/setjmp.h
>         oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h
> bits/statfs.h bits/typesizes.h
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f8c57705715ad74b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, 18 Jul 2018 at 20:27, Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@=
linaro.org">daniel.diaz@linaro.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Once another header #includes &lt;bits/wordsize.h&gt;, there=
 is a<br>
potential recursion going on because the<br>
multilib_header_wrapper.h #includes &lt;bits/wordsize.h&gt; again!<br>
<br>
This should not happen because an __arm__ (32-bits) or an<br>
__aarch64__ (64-bits) environment guarantees that we will<br>
be getting the correct definition, but when building against<br>
a different target (like BPF), recursion is what happens.<br>
<br>
This can be seen, for instance, when building eBPF programs<br>
from the kernel with `clang -target bpf&#39;, such as the ones<br>
located in linux/tools/testing/selftests/bpf/.<br>
<br>
Signed-off-by: Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@linaro.or=
g" target=3D"_blank">daniel.diaz@linaro.org</a>&gt;<br></blockquote><div><s=
pan style=3D"font-size:small;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org">anibal.limon@linaro.org</a></span><span style=3D"font-size:small;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt;</span>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
---<br>
=C2=A0meta/recipes-core/glibc/glibc-package.inc | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc<br>
index ae3f2f6..a4f61f8 100644<br>
--- a/meta/recipes-core/glibc/glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/glibc-package.inc<br>
@@ -136,8 +136,7 @@ do_install_append_armeb () {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_armmultilib () {<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header bits/endian.h bits/fcntl.h b=
its/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize=
.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header bits/endian.h bits/fcntl.h b=
its/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header bits/local_lim.h bits/mman.h=
 bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h=C2=A0 bits/sem.h=
=C2=A0 bits/semaphore.h bits/setjmp.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header bits/shm.h bits/sigstack.h b=
its/stat.h bits/statfs.h bits/typesizes.h<br>
<br>
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
</blockquote></div></div>

--000000000000f8c57705715ad74b--
