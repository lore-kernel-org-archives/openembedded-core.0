Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 891F877F6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 10:57:06 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id y77so1066860ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dWgmhxCUP0hqsoBY4FhQ9wmH0Yi0u7MracOGnglTxbY=;
	b=fNusMmnHIA+HJeA3q7XVBKqEYemvh08PeDoM/n56hlSiUtNdOtIetkjF1HtovAYowE
	oGjGsNFBfiOXJO7FUFuhHKYXzakJAdA8qvxc0VjvmgfXYVe1/IeuoPFG1ZQ25DW+2E01
	cCxnE51DFXwt3vlzOiY1i9szKQtKFeXN4ssYrWHgF1/SO3pmjsW35jMQzby3jmv27p6f
	cvMmIv9JlKOCRuBtfxaCeO6fOEJI43tWNhRnJDv3HtHq2XofLKv3AzmLRh1oK++Oo4mz
	aIaxdwhXiz0mfHZP9+WgKUL+mqKO6Tx955IHAp59WpY6ln2r+A9zC2Ruekxw7h6Zw0AW
	FVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dWgmhxCUP0hqsoBY4FhQ9wmH0Yi0u7MracOGnglTxbY=;
	b=NraweXX5le4HyRC0BBi69vK3TgOqxKEgvseNwDTczyRQxJXYoaIxUfTcxvC2yosLcg
	7VvJVHQmE0jStKlQWCLWTaPdbD1R6cP9V8QF4G/jci2ekvSmcH1uqKO349SkjtWpDjVz
	Xpc1ZkbrGcwTX3oLJBd553Dj3iH4z4CG23UvqrIq1+mS8WNW+sGdpkotaNMQ8b5wdU71
	ZxN8qQrJe82XXHYbcJfZlrAOBsJl/V+kNxDr67TMnnZxTgL5JQ3IGrPHPW+1ZAwp/DVS
	RKMZLSU754k6f9GvjhEUOexuuLeJh3TAZQnqVdPS98hHtaFRIJZwNEnkXgr+UeQ9mJZg
	nGLw==
X-Gm-Message-State: AKS2vOwQFrXovKh3YgU+Vvr3cAytbP2GOUXRp4OSwhLfzVbZvay95l42
	j5Th6eDnuSpTcdDPz0ckyR5GLXBeOQIY
X-Received: by 10.107.26.14 with SMTP id a14mr4901361ioa.8.1498042627407; Wed,
	21 Jun 2017 03:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Wed, 21 Jun 2017 03:56:37 -0700 (PDT)
In-Reply-To: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 21 Jun 2017 13:56:37 +0300
Message-ID: <CAHiDW_F6Q9aNgRz5=HntGAMJQNLiMURUDW=ym=FojmTErA30zw@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Wed, 21 Jun 2017 10:57:06 -0000
Content-Type: multipart/alternative; boundary="001a113fe604aa58610552763ae3"

--001a113fe604aa58610552763ae3
Content-Type: text/plain; charset="UTF-8"

On 19 June 2017 at 17:39, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:
>
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Do not mix the stderr into stdout, allowing test cases to query
> the specific output.

I wonder if this patch could be related to the strange selftest failures
where command output seems to be missing completely, e.g.
    AssertionError: '' != 'ERROR: Unable to find any package producing path
/not/exist'

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/349/steps/Running%20oe-selftest/logs/stdio


Jussi

>
> [YOCTO #9693]
>
> Signed-off-by: Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/utils/commands.py
b/meta/lib/oeqa/utils/commands.py
> index 57286fcb10..4ef0e874ff 100644
> --- a/meta/lib/oeqa/utils/commands.py
> +++ b/meta/lib/oeqa/utils/commands.py
> @@ -29,7 +29,7 @@ class Command(object):
>
>          self.defaultopts = {
>              "stdout": subprocess.PIPE,
> -            "stderr": subprocess.STDOUT,
> +            "stderr": subprocess.PIPE,
>              "stdin": None,
>              "shell": False,
>              "bufsize": -1,
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113fe604aa58610552763ae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 June 2017 at 17:39, &lt;<a href=3D"mailto:leonardo.s=
andoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@linux.intel.co=
m</a>&gt; wrote:<br>&gt;<br>&gt; From: Leonardo Sandoval &lt;<a href=3D"mai=
lto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@=
linux.intel.com</a>&gt;<br>&gt;<br>&gt; Do not mix the stderr into stdout, =
allowing test cases to query<br>&gt; the specific output.<br><br>I wonder i=
f this patch could be related to the strange selftest failures where comman=
d output seems to be missing completely, e.g.<br><div>=C2=A0 =C2=A0 Asserti=
onError: &#39;&#39; !=3D &#39;ERROR: Unable to find any package producing p=
ath /not/exist&#39;<br><br><a href=3D"https://autobuilder.yocto.io/builders=
/nightly-oe-selftest/builds/349/steps/Running%20oe-selftest/logs/stdio">htt=
ps://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/349/steps/Run=
ning%20oe-selftest/logs/stdio</a><br><br><br>Jussi<br><br>&gt;<br>&gt; [YOC=
TO #9693]<br>&gt;<br>&gt; Signed-off-by: Leonardo Sandoval &lt;<a href=3D"m=
ailto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzale=
z@linux.intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/lib/oeqa/utils/com=
mands.py | 2 +-<br>&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)=
<br>&gt;<br>&gt; diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oe=
qa/utils/commands.py<br>&gt; index 57286fcb10..4ef0e874ff 100644<br>&gt; --=
- a/meta/lib/oeqa/utils/commands.py<br>&gt; +++ b/meta/lib/oeqa/utils/comma=
nds.py<br>&gt; @@ -29,7 +29,7 @@ class Command(object):<br>&gt;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.defaultopts =3D {<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;stdout&quot;: subprocess.PIPE,<br>=
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;stderr&quot;: subproc=
ess.STDOUT,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;stderr=
&quot;: subprocess.PIPE,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;stdin&quot;: None,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;shell&quot;: False,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;bufsize&quot;: -1,<br>&gt; --<br>&gt; 2.12.0<br>&=
gt;<br>&gt; --<br>&gt; _______________________________________________<br>&=
gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-c=
ore@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br=
>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedde=
d-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a=
><br></div></div>

--001a113fe604aa58610552763ae3--
