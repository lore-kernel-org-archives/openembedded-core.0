Return-Path: <raj.khem@gmail.com>
Received: from mail-qe0-f46.google.com (mail-qe0-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id AB80E610F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 15:47:32 +0000 (UTC)
Received: by mail-qe0-f46.google.com with SMTP id x7so2191124qeu.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0osCZSIkC/QF9ThM4Qn+b6Y5MM27SBMtNP8j+2b/0y4=;
	b=QQhbHW+zwp1zlyKkIB2fVW5udXHq3Ec+r9gUMtBqD7jlqusJtdJF6Uer5F4u9xITp1
	L0Z4g/stACRelVukPw6pAD19zKu5mx9laTD6Xo/xb1Kva1aqucSk3s9V/rTJwH+vm+7X
	JcIvfZ4NV8SWYq22jz2M1LyJmAujQEWilcQnLI90He0lejGegvwevKtHSMyoWJqEKjwX
	SDEWJoYpOP2gm6cHmzBFU3t7TfUd7NEegpbr25CpZF8gjgFLtRp+f/TYGUCvUHW0cdci
	fYGpYJ46g8y0J7ZN4lOQxsM5ZV74U366g6BeT2dP6XV5EwVAVHYO2QcVtj0Xsgc1isFY
	4v4A==
MIME-Version: 1.0
X-Received: by 10.229.51.69 with SMTP id c5mr2893001qcg.24.1379951253942; Mon,
	23 Sep 2013 08:47:33 -0700 (PDT)
Received: by 10.224.10.201 with HTTP; Mon, 23 Sep 2013 08:47:33 -0700 (PDT)
In-Reply-To: <524005B5.6060105@windriver.com>
References: <cover.1379488760.git.hongxu.jia@windriver.com>
	<524005B5.6060105@windriver.com>
Date: Mon, 23 Sep 2013 08:47:33 -0700
Message-ID: <CAMKF1srAP-onLUhsQ5tOXuuHZPRD_559M_2X_vD0ZBmximboww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC YOCTO #5248] core-image-lsb: Why FPU doesn't work correctly on qemux86-64
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
X-List-Received-Date: Mon, 23 Sep 2013 15:47:33 -0000
Content-Type: multipart/alternative; boundary=001a113397784d6e3d04e70ef08b

--001a113397784d6e3d04e70ef08b
Content-Type: text/plain; charset=UTF-8

does this fail same way on real machine as well?

On Monday, September 23, 2013, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 09/23/2013 04:55 PM, Hongxu Jia wrote:
>>
>> *Preparation
>> 1, vim local.conf
>> ...
>> DISTRO ?= "poky-lsb"
>> MACHINE ?= "qemux86-64"
>> ...
>>
>> *Problem
>> 1, Build core-image-lsb
>> ..
>> bitbake core-image-lsb
>> ..
>>
>> 2, Start qemux86-64, there are 21 LSB tcl test failures on
>> qemux86-64, you could reproduce it by tcl interpreter:
>>    1, On qemux86-64's terminal, start tcl interpreter
>>    root@qemux86-64:~# $ tclsh
>>    %
>>
>>    2, Run 'binary scan' to assign ieeeValues(-Subnormal)
>>    % binary scan \x00\x00\x00\x00\x00\x00\x08\x80 d
ieeeValues(-Subnormal)
>>    1
>>
>>    3, Run 'puts' to output ieeeValues(-Subnormal), the result is '0.0'
>>    % puts $ieeeValues(-Subnormal)
>>    -0.0
>>
>>    Expected:
>>    -1.1125369292536007e-308
>>
>> *Analysis
>> 1, On the previous environment, add IMAGE_INSTALL_append = " tcl" to
>> local.conf and build core-image-sato, the result is expected.
>>
>> 2, Trace tcl's source code, you could also reproduce the issue by
>> compiling and executing the following C codes on core-image-lsb-sdk.
>>
>>    1) Build core-image-lsb-sdk, and Run qemux86-64.
>>    2) On target's terminal, create a C source file:
>>       root@qemux86-64:~# cat >> test.c << EOF
>> #include <stdio.h>
>>
>> int main(int argc, char *argv[])
>> {
>>    double dd = 0;
>>    char *p = (char*)&dd;
>>    p[0] = 0x00;
>>    p[1] = 0x00;
>>    p[2] = 0x00;
>>    p[3] = 0x00;
>>    p[4] = 0x00;
>>    p[5] = 0x00;
>>    p[6] = 0x08;
>>    p[7] = 0x00;
>>
>>    if (dd == 0.0)
>>      printf("Incorrect equal 0.0\n");
>>    else
>>      printf("Expected not equal 0.0\n");
>>
>>    return 0;
>> }
>> EOF
>>
>>    2) Compile test.c
>>      root@qemux86-64:~# gcc test.c -o test
>>
>>    3, Execute test
>>    $ root@qemux86-64:~# ./test
>>      Incorrect equal 0.0
>>
>>    Expected:
>>      Expected not equal 0.0
>>
>> 3, It's about x86-64's FPU: the SSE MXCSR register.
>>    If you invoke 'feenableexcept(FE_INEXACT);' or
>>    'feclearexcept(FE_INEXACT);' in the above C test,
>>    the issue will be fixed. In these two functions,
>>    the SSE MXCSR register has been handled.
>
> vim eglibc-2.18/libc/sysdeps/x86_64/fpu/feenablxcpt.c
> ...
> #include <fenv.h>
>
> int
> feenableexcept (int excepts)
> {
>   unsigned short int new_exc, old_exc;
>   unsigned int new;
>
>   excepts &= FE_ALL_EXCEPT;
>
>   /* Get the current control word of the x87 FPU.  */
>   __asm__ ("fstcw %0" : "=m" (*&new_exc));
>
>   old_exc = (~new_exc) & FE_ALL_EXCEPT;
>
>   new_exc &= ~excepts;
>   __asm__ ("fldcw %0" : : "m" (*&new_exc));
>
>   /* And now the same for the SSE MXCSR register.  */
>   __asm__ ("stmxcsr %0" : "=m" (*&new));
>
>   /* The SSE exception masks are shifted by 7 bits.  */
>   new &= ~(excepts << 7);
>   __asm__ ("ldmxcsr %0" : : "m" (*&new));
>
>   return old_exc;
> }
> ...
>
> //Hongxu
>
>> *Solution
>> Is it necessary to invoke 'feenableexcept(FE_INEXACT);' or
>> 'feclearexcept(FE_INEXACT);' to handle SSE MXCSR register?
>>
>> Or any good idea about this issue.
>>
>> Thanks,
>> Hongxu
>>
>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113397784d6e3d04e70ef08b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

does this fail same way on real machine as well? <br><br>On Monday, Septemb=
er 23, 2013, Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hon=
gxu.jia@windriver.com</a>&gt; wrote:<br>&gt; On 09/23/2013 04:55 PM, Hongxu=
 Jia wrote:<br>
&gt;&gt;<br>&gt;&gt; *Preparation<br>&gt;&gt; 1, vim local.conf<br>&gt;&gt;=
 ...<br>&gt;&gt; DISTRO ?=3D &quot;poky-lsb&quot;<br>&gt;&gt; MACHINE ?=3D =
&quot;qemux86-64&quot;<br>&gt;&gt; ...<br>&gt;&gt;<br>&gt;&gt; *Problem<br>
&gt;&gt; 1, Build core-image-lsb<br>&gt;&gt; ..<br>&gt;&gt; bitbake core-im=
age-lsb<br>&gt;&gt; ..<br>&gt;&gt;<br>&gt;&gt; 2, Start qemux86-64, there a=
re 21 LSB tcl test failures on<br>&gt;&gt; qemux86-64, you could reproduce =
it by tcl interpreter:<br>
&gt;&gt; =C2=A0 =C2=A01, On qemux86-64&#39;s terminal, start tcl interprete=
r<br>&gt;&gt; =C2=A0 =C2=A0root@qemux86-64:~# $ tclsh<br>&gt;&gt; =C2=A0 =
=C2=A0%<br>&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A02, Run &#39;binary scan&#39; t=
o assign ieeeValues(-Subnormal)<br>&gt;&gt; =C2=A0 =C2=A0% binary scan \x00=
\x00\x00\x00\x00\x00\x08\x80 d ieeeValues(-Subnormal)<br>
&gt;&gt; =C2=A0 =C2=A01<br>&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A03, Run &#39;pu=
ts&#39; to output ieeeValues(-Subnormal), the result is &#39;0.0&#39;<br>&g=
t;&gt; =C2=A0 =C2=A0% puts $ieeeValues(-Subnormal)<br>&gt;&gt; =C2=A0 =C2=
=A0-0.0<br>&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A0Expected:<br>
&gt;&gt; =C2=A0 =C2=A0-1.1125369292536007e-308<br>&gt;&gt;<br>&gt;&gt; *Ana=
lysis<br>&gt;&gt; 1, On the previous environment, add IMAGE_INSTALL_append =
=3D &quot; tcl&quot; to<br>&gt;&gt; local.conf and build core-image-sato, t=
he result is expected.<br>
&gt;&gt;<br>&gt;&gt; 2, Trace tcl&#39;s source code, you could also reprodu=
ce the issue by<br>&gt;&gt; compiling and executing the following C codes o=
n core-image-lsb-sdk.<br>&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A01) Build core-im=
age-lsb-sdk, and Run qemux86-64.<br>
&gt;&gt; =C2=A0 =C2=A02) On target&#39;s terminal, create a C source file:<=
br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 root@qemux86-64:~# cat &gt;&gt; test.c &lt=
;&lt; EOF<br>&gt;&gt; #include &lt;stdio.h&gt;<br>&gt;&gt;<br>&gt;&gt; int =
main(int argc, char *argv[])<br>
&gt;&gt; {<br>&gt;&gt; =C2=A0 =C2=A0double dd =3D 0;<br>&gt;&gt; =C2=A0 =C2=
=A0char *p =3D (char*)&amp;dd;<br>&gt;&gt; =C2=A0 =C2=A0p[0] =3D 0x00;<br>&=
gt;&gt; =C2=A0 =C2=A0p[1] =3D 0x00;<br>&gt;&gt; =C2=A0 =C2=A0p[2] =3D 0x00;=
<br>&gt;&gt; =C2=A0 =C2=A0p[3] =3D 0x00;<br>&gt;&gt; =C2=A0 =C2=A0p[4] =3D =
0x00;<br>
&gt;&gt; =C2=A0 =C2=A0p[5] =3D 0x00;<br>&gt;&gt; =C2=A0 =C2=A0p[6] =3D 0x08=
;<br>&gt;&gt; =C2=A0 =C2=A0p[7] =3D 0x00;<br>&gt;&gt;<br>&gt;&gt; =C2=A0 =
=C2=A0if (dd =3D=3D 0.0)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0printf(&quot;Incor=
rect equal 0.0\n&quot;);<br>&gt;&gt; =C2=A0 =C2=A0else<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0printf(&quot;Expected not equal 0.0\n&quot;);<br>
&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A0return 0;<br>&gt;&gt; }<br>&gt;&gt; EOF<b=
r>&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A02) Compile test.c<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0root@qemux86-64:~# gcc test.c -o test<br>&gt;&gt;<br>&gt;&gt; =
=C2=A0 =C2=A03, Execute test<br>&gt;&gt; =C2=A0 =C2=A0$ root@qemux86-64:~# =
./test<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0Incorrect equal 0.0<br>&gt;&gt;<br>&gt;&gt; =
=C2=A0 =C2=A0Expected:<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0Expected not equal 0=
.0<br>&gt;&gt;<br>&gt;&gt; 3, It&#39;s about x86-64&#39;s FPU: the SSE MXCS=
R register.<br>&gt;&gt; =C2=A0 =C2=A0If you invoke &#39;feenableexcept(FE_I=
NEXACT);&#39; or<br>
&gt;&gt; =C2=A0 =C2=A0&#39;feclearexcept(FE_INEXACT);&#39; in the above C t=
est,<br>&gt;&gt; =C2=A0 =C2=A0the issue will be fixed. In these two functio=
ns,<br>&gt;&gt; =C2=A0 =C2=A0the SSE MXCSR register has been handled.<br>&g=
t;<br>&gt; vim eglibc-2.18/libc/sysdeps/x86_64/fpu/feenablxcpt.c<br>
&gt; ...<br>&gt; #include &lt;fenv.h&gt;<br>&gt;<br>&gt; int<br>&gt; feenab=
leexcept (int excepts)<br>&gt; {<br>&gt; =C2=A0 unsigned short int new_exc,=
 old_exc;<br>&gt; =C2=A0 unsigned int new;<br>&gt;<br>&gt; =C2=A0 excepts &=
amp;=3D FE_ALL_EXCEPT;<br>
&gt;<br>&gt; =C2=A0 /* Get the current control word of the x87 FPU. =C2=A0*=
/<br>&gt; =C2=A0 __asm__ (&quot;fstcw %0&quot; : &quot;=3Dm&quot; (*&amp;ne=
w_exc));<br>&gt;<br>&gt; =C2=A0 old_exc =3D (~new_exc) &amp; FE_ALL_EXCEPT;=
<br>&gt;<br>&gt; =C2=A0 new_exc &amp;=3D ~excepts;<br>
&gt; =C2=A0 __asm__ (&quot;fldcw %0&quot; : : &quot;m&quot; (*&amp;new_exc)=
);<br>&gt;<br>&gt; =C2=A0 /* And now the same for the SSE MXCSR register. =
=C2=A0*/<br>&gt; =C2=A0 __asm__ (&quot;stmxcsr %0&quot; : &quot;=3Dm&quot; =
(*&amp;new));<br>&gt;<br>
&gt; =C2=A0 /* The SSE exception masks are shifted by 7 bits. =C2=A0*/<br>&=
gt; =C2=A0 new &amp;=3D ~(excepts &lt;&lt; 7);<br>&gt; =C2=A0 __asm__ (&quo=
t;ldmxcsr %0&quot; : : &quot;m&quot; (*&amp;new));<br>&gt;<br>&gt; =C2=A0 r=
eturn old_exc;<br>&gt; }<br>
&gt; ...<br>&gt;<br>&gt; //Hongxu<br>&gt;<br>&gt;&gt; *Solution<br>&gt;&gt;=
 Is it necessary to invoke &#39;feenableexcept(FE_INEXACT);&#39; or<br>&gt;=
&gt; &#39;feclearexcept(FE_INEXACT);&#39; to handle SSE MXCSR register?<br>
&gt;&gt;<br>&gt;&gt; Or any good idea about this issue.<br>&gt;&gt;<br>&gt;=
&gt; Thanks,<br>&gt;&gt; Hongxu<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;=
&gt;<br>&gt;<br>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</=
a><br>
&gt;

--001a113397784d6e3d04e70ef08b--
