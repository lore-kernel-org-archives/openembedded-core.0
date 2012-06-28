Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkIHv-0001eK-5U
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 19:13:51 +0200
Received: by eaal1 with SMTP id l1so930684eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0gvUyuflqAUmfHMlAwaXHvb90mLD0lCAK1WmwBMRdYQ=;
	b=QkXZtRLcQdu38pIAuJyTLVnwdTumo9KcOU2wdvdiVqIcEAGCQZm4w4q4pJvWFE3L2r
	rmq5SC9F10YzV7TJGufDiMjrOwCYKKwErIA8mVwST/R5179AIiYoZ+VZsk08Cy1pI46v
	PShZHBS8YcFxwKT49nrLojRKlKxnAIN5lGpQho+oc5yclTj9uAgECqgr8NSNlq/ARHZk
	BScq7LpXDCkC5i1ndc+tHhC50TI308Fp+IAP+HCiFT6VhTxI1g3kStxKFYK0lORMntYz
	r2IKxe7l7fNMfaRARjDUNgt8OYVZsFskYuKzC1wwattJCBXMV1JkB6cwHHc1mtR5vmck
	0zZA==
MIME-Version: 1.0
Received: by 10.14.53.4 with SMTP id f4mr690133eec.93.1340902976156; Thu, 28
	Jun 2012 10:02:56 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 10:02:56 -0700 (PDT)
In-Reply-To: <CAF1ZMEccy-nQowP8odxJGRGHBvXCuDDfGYCNDzkWdGoeHFcjog@mail.gmail.com>
References: <cover.1340845612.git.raj.khem@gmail.com>
	<ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
	<e7eb300513b285a6e90a46989ed283e1cf28bfc0.1340845612.git.raj.khem@gmail.com>
	<CAF1ZMEccy-nQowP8odxJGRGHBvXCuDDfGYCNDzkWdGoeHFcjog@mail.gmail.com>
Date: Thu, 28 Jun 2012 10:02:56 -0700
Message-ID: <CAMKF1spWGF4izt+PFwGrf-hXqJgvC535EuF0rktam5bbb-nAzA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] eglibc: support mipsel little endian, filter out -march=mips32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 17:13:51 -0000
Content-Type: multipart/alternative; boundary=90e6ba61515a92737604c38b4dab

--90e6ba61515a92737604c38b4dab
Content-Type: text/plain; charset=UTF-8

On Thursday, June 28, 2012, Dennis.Yxun <dennis.yxun@gmail.com> wrote:
> HI Raj:
>   So this will eventually goes into OE-core, right?
>   As I see Bruce has no response for the "override scheme"
> so mips -> for big endian mips o32 (could be mipseb better?, less
confusion)

Mips has always meant big endian no need to change there


> and mipsel -> for little endian mips o32, they in same level, not of
> one's subset
>
> Dennis
>
> On Thu, Jun 28, 2012 at 9:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> From: Dennis Lan <dennis.yxun@gmail.com>
>>
>> Quote for eglibc source:
>>  for mips eglibc now builds syscall tables for all abi's
>>  so we make sure that we choose right march option which is
>>  compatible with o32,n32 and n64 abi's
>>  e.g. -march=mips32 is not compatible with n32 and n64 therefore
>>  we filter it out in such case -march=from-abi which will be
>>  mips1 when using o32 and mips3 when using n32/n64
>>
>> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
>> ---
>>  meta/recipes-core/eglibc/eglibc_2.15.bb |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bbb/meta/recipes-core/eglibc/
eglibc_2.15.bb
>> index e57a112..b2922b4 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
>> @@ -101,6 +101,7 @@ do_patch_append() {
>>  # mips1 when using o32 and mips3 when using n32/n64
>>
>>  TUNE_CCARGS_mips := "${@oe_filter_out('-march=mips32',
'${TUNE_CCARGS}', d)}"
>> +TUNE_CCARGS_mipsel := "${@oe_filter_out('-march=mips32',
'${TUNE_CCARGS}', d)}"
>>
>>  # We need to ensure that all of the i386 and x86_64 headers are
identical
>>  # to support the multilib case.  We do this by copying headers from
x86_64
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--90e6ba61515a92737604c38b4dab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, June 28, 2012, Dennis.Yxun &lt;<a href=3D"mailto:denni=
s.yxun@gmail.com">dennis.yxun@gmail.com</a>&gt; wrote:<br>&gt; HI Raj:<br>&=
gt; =C2=A0 So this will eventually goes into OE-core, right?<br>&gt; =C2=A0=
 As I see Bruce has no response for the &quot;override scheme&quot;<br>
&gt; so mips -&gt; for big endian mips o32 (could be mipseb better?, less c=
onfusion)<br><br>Mips has always meant big endian no need to change there <=
br><br><br>&gt; and mipsel -&gt; for little endian mips o32, they in same l=
evel, not of<br>
&gt; one&#39;s subset<br>&gt;<br>&gt; Dennis<br>&gt;<br>&gt; On Thu, Jun 28=
, 2012 at 9:10 AM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.k=
hem@gmail.com</a>&gt; wrote:<br>&gt;&gt; From: Dennis Lan &lt;<a href=3D"ma=
ilto:dennis.yxun@gmail.com">dennis.yxun@gmail.com</a>&gt;<br>
&gt;&gt;<br>&gt;&gt; Quote for eglibc source:<br>&gt;&gt; =C2=A0for mips eg=
libc now builds syscall tables for all abi&#39;s<br>&gt;&gt; =C2=A0so we ma=
ke sure that we choose right march option which is<br>&gt;&gt; =C2=A0compat=
ible with o32,n32 and n64 abi&#39;s<br>
&gt;&gt; =C2=A0e.g. -march=3Dmips32 is not compatible with n32 and n64 ther=
efore<br>&gt;&gt; =C2=A0we filter it out in such case -march=3Dfrom-abi whi=
ch will be<br>&gt;&gt; =C2=A0mips1 when using o32 and mips3 when using n32/=
n64<br>&gt;&gt;<br>
&gt;&gt; Signed-off-by: Dennis Lan &lt;<a href=3D"mailto:dennis.yxun@gmail.=
com">dennis.yxun@gmail.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0meta/r=
ecipes-core/eglibc/<a href=3D"http://eglibc_2.15.bb">eglibc_2.15.bb</a> | =
=C2=A0 =C2=A01 +<br>
&gt;&gt; =C2=A01 file changed, 1 insertion(+)<br>&gt;&gt;<br>&gt;&gt; diff =
--git a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.15.bb">eglibc_2=
.15.bb</a> b/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.15.bb">egl=
ibc_2.15.bb</a><br>
&gt;&gt; index e57a112..b2922b4 100644<br>&gt;&gt; --- a/meta/recipes-core/=
eglibc/<a href=3D"http://eglibc_2.15.bb">eglibc_2.15.bb</a><br>&gt;&gt; +++=
 b/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.15.bb">eglibc_2.15.b=
b</a><br>
&gt;&gt; @@ -101,6 +101,7 @@ do_patch_append() {<br>&gt;&gt; =C2=A0# mips1 =
when using o32 and mips3 when using n32/n64<br>&gt;&gt;<br>&gt;&gt; =C2=A0T=
UNE_CCARGS_mips :=3D &quot;${@oe_filter_out(&#39;-march=3Dmips32&#39;, &#39=
;${TUNE_CCARGS}&#39;, d)}&quot;<br>
&gt;&gt; +TUNE_CCARGS_mipsel :=3D &quot;${@oe_filter_out(&#39;-march=3Dmips=
32&#39;, &#39;${TUNE_CCARGS}&#39;, d)}&quot;<br>&gt;&gt;<br>&gt;&gt; =C2=A0=
# We need to ensure that all of the i386 and x86_64 headers are identical<b=
r>&gt;&gt; =C2=A0# to support the multilib case. =C2=A0We do this by copyin=
g headers from x86_64<br>
&gt;&gt; --<br>&gt;&gt; 1.7.9.5<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; _______=
________________________________________<br>&gt;&gt; Openembedded-core mail=
ing list<br>&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded=
.org">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core</a><br>&gt;<br>&gt; ____________________________________________=
___<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core</a><br>
&gt;

--90e6ba61515a92737604c38b4dab--
