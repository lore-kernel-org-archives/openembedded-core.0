Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.2736.1609877631962192121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 12:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FgYN/AhN;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id m145so271863vke.7
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 12:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LN8u20jBEvDZOxBewsJfFuEAEv71AgemgAqP3oN0WUs=;
        b=FgYN/AhNCnmXXgzxs3SkB+29F5WJ0sQPqHZTNGLp5c3fGWnG82FPKxf61lHz07E5Cc
         AlnspYejhe70jmxp7h35Cct141z7iSQ10c3f73sKasqK/cL5KnMmoEFLSfvQN9D+qkqV
         NuP5c95oStUE30568k5Di35hJ5FstSrg3ntbVtp0GjU9jlOPjKX9cbffQMnX8tjcRYH4
         10I/V6/kfFE4inHmcQGop/7UxJFJZO2cOCCRAJudne8m/crpUAwHlpPBaUGJsx6Gdx2d
         32HfgPJ5i1swh6rvu1YM1UhyJdSjBYg+t2extmoIPSNG4RS6dnUilDfi3HopWYgBEa/D
         buvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LN8u20jBEvDZOxBewsJfFuEAEv71AgemgAqP3oN0WUs=;
        b=Bo4ShfU4ovbj59v5+7G8+UZ9MJ5nXoIusZrmynuyiAeIsdBI5FWT7PFvEYRPq6AQeP
         y9rk0+DLEWOdhJuDFKwX17qrUWsxW7jEPnL88TE6HJuF7WNrRHwQZF6lcqwROfOWLpTE
         xHPCNwrABnm2vOqsgYi1GDu43W1J+nekGFAuUNLiaJD6X8C2H5s/nVDi2EOX7ZsL+DVQ
         tsDvgZTMUTuBDfz30qJFhCQKuOKHJ534e2YyOmmwreRJ55mJ8iqGBV7T9n1U/mybCJVm
         jDKPJa+owMpcb29NxJeRuA8diS0GjixRxgXokobBFqK+sZRFI1kbkhMrjgClFU3Fvgnl
         BG1Q==
X-Gm-Message-State: AOAM53303NrZquNYqusfcui5fQO4nCltcEgUzABt8wh9u1sN/Bc49BA0
	ER97EFd6v6hGtuxamLCb8egPNG90jInYGTTlZLg=
X-Google-Smtp-Source: ABdhPJz1+VOt/+gxvrhdtGi4092MqeUjfyXhVKvSd8iNHbDZm3ErBwm8Ch5jlfS/IE4YWHxZv0RIXR8jDCVB6NYwURg=
X-Received: by 2002:a1f:9c42:: with SMTP id f63mr1292433vke.10.1609877631044;
 Tue, 05 Jan 2021 12:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20210105191656.10222-1-kweihmann@outlook.com> <DBBPR09MB4748F5A122F2C7C9B7AF9356A8D10@DBBPR09MB4748.eurprd09.prod.outlook.com>
In-Reply-To: <DBBPR09MB4748F5A122F2C7C9B7AF9356A8D10@DBBPR09MB4748.eurprd09.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 5 Jan 2021 21:13:40 +0100
Message-ID: <CANNYZj8h2_=sjaKP3kkUjSHpMboowpgF3O8V+HBeX4YD4+qxDw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 2/2] OETestContext: order test cases by prio & depends
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000548ea905b82cd8ef"

--000000000000548ea905b82cd8ef
Content-Type: text/plain; charset="UTF-8"

I wonder if some test cases can be written to check the ordering outcome
without actually executing the tests?

Particularly, I wonder about interaction between priority and dependency,
when one contradicts the other.

Otherwise, I do support this: we have test cases that for example check log
sanity and absence of coredumps which
are beneficial to run at the end, and test cases that check that services
started successfully and overall boot looks sane
(no sudden increase in boot time) which are best executed up front.

Alex

On Tue, 5 Jan 2021 at 20:17, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Order the overall test case list in the resulting test suite
> by priority (by default all test cases do have a priority of 50).
> In a second round move test cases with test dependencies behind
> the maximum priority of priorities.
> New method 'orderByPriority' can be explictly overridden to disable
> usage of the new 'priority' decorator.
>
> Resulting test cases list will be passed back to the calling
> test runner instance
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/lib/oeqa/core/context.py | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
> index 2abe353d27..8c5589b512 100644
> --- a/meta/lib/oeqa/core/context.py
> +++ b/meta/lib/oeqa/core/context.py
> @@ -66,6 +66,34 @@ class OETestContext(object):
>                  if (cid + '.').startswith(skip + '.'):
>                      setattr(tclass, 'setUpHooker', skipfuncgen('Skip by
> the command line argument "%s"' % skip))
>
> +    def orderByPriority(self, suites):
> +        _ordered = {}
> +        for _test in suites._tests:
> +            _prio = 50
> +            _depends = []
> +            for x in _test.decorators:
> +                if hasattr(x, "depends"):
> +                    _depends += getattr(x, "depends")
> +                if hasattr(x, "priority"):
> +                    _prio = getattr(x, "priority")
> +            _ordered[_test.id()] = {"prio": _prio, "deps": _depends,
> "ref": _test}
> +
> +        def set_suite_prio(suites, suite):
> +            for dep in suite["deps"]:
> +                if dep not in suites:
> +                    try:
> +                        dep = [x for x in suites.keys() if
> x.endswith(dep)][0]
> +                    except:
> +                        continue
> +                suite["prio"] = max(suite["prio"], set_suite_prio(suites,
> suites[dep]) + 1)
> +            return suite["prio"]
> +
> +        for k, v in _ordered.items():
> +            _ordered[k]["prio"] = set_suite_prio(_ordered, v)
> +
> +        suites._tests = [x[1]["ref"] for x in sorted(_ordered.items(),
> key=lambda tup: tup[1]["prio"])]
> +        return suites
> +
>      def loadTests(self, module_paths, modules=[], tests=[],
>              modules_manifest="", modules_required=[], **kwargs):
>          if modules_manifest:
> @@ -73,7 +101,7 @@ class OETestContext(object):
>
>          self.loader = self.loaderClass(self, module_paths, modules, tests,
>                  modules_required, **kwargs)
> -        self.suites = self.loader.discover()
> +        self.suites = self.orderByPriority(self.loader.discover())
>
>      def prepareSuite(self, suites, processes):
>          return suites
> --
> 2.25.1
>
>
> 
>
>

--000000000000548ea905b82cd8ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I wonder if some test cases can be written to check t=
he ordering outcome without actually executing the tests?</div><div><br></d=
iv><div>Particularly, I wonder about interaction between priority and depen=
dency, when one contradicts the other.</div><div><br></div><div>Otherwise, =
I do support this: we have test cases that for example check log sanity and=
 absence of coredumps which <br></div><div>are beneficial to run at the end=
, and test cases that check that services started successfully and overall =
boot looks sane</div><div>(no sudden increase in boot time) which are best =
executed up front.<br></div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 5 Jan=
 2021 at 20:17, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Order the overall test case list i=
n the resulting test suite<br>
by priority (by default all test cases do have a priority of 50).<br>
In a second round move test cases with test dependencies behind<br>
the maximum priority of priorities.<br>
New method &#39;orderByPriority&#39; can be explictly overridden to disabl=
e<br>
usage of the new &#39;priority&#39; decorator.<br>
<br>
Resulting test cases list will be passed back to the calling<br>
test runner instance<br>
<br>
Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/core/context.py | 30 +++++++++++++++++++++++++++++-<br=
>
=C2=A01 file changed, 29 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py=
<br>
index 2abe353d27..8c5589b512 100644<br>
--- a/meta/lib/oeqa/core/context.py<br>
+++ b/meta/lib/oeqa/core/context.py<br>
@@ -66,6 +66,34 @@ class OETestContext(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cid + &#=
39;.&#39;).startswith(skip + &#39;.&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0setattr(tclass, &#39;setUpHooker&#39;, skipfuncgen(&#39;Skip by the com=
mand line argument &quot;%s&quot;&#39; % skip))<br>
<br>
+=C2=A0 =C2=A0 def orderByPriority(self, suites):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _ordered =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for _test in suites._tests:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _prio =3D 50<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _depends =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in _test.decorators:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(x, &qu=
ot;depends&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _de=
pends +=3D getattr(x, &quot;depends&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(x, &qu=
ot;priority&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _pr=
io =3D getattr(x, &quot;priority&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ordered[_<a href=3D"http://tes=
t.id" rel=3D"noreferrer" target=3D"_blank">test.id</a>()] =3D {&quot;prio&q=
uot;: _prio, &quot;deps&quot;: _depends, &quot;ref&quot;: _test}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def set_suite_prio(suites, suite):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in suite[&quot;deps&quo=
t;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep not in sui=
tes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 dep =3D [x for x in suites.keys() if x.endswith(dep)][0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc=
ept:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suite[&quot;prio&=
quot;] =3D max(suite[&quot;prio&quot;], set_suite_prio(suites, suites[dep])=
 + 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return suite[&quot;prio&quot;]<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in _ordered.items():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ordered[k][&quot;prio&quot;] =
=3D set_suite_prio(_ordered, v)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 suites._tests =3D [x[1][&quot;ref&quot;] for =
x in sorted(_ordered.items(), key=3Dlambda tup: tup[1][&quot;prio&quot;])]<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return suites<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def loadTests(self, module_paths, modules=3D[], tests=
=3D[],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules_manifest=3D&quot;&=
quot;, modules_required=3D[], **kwargs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if modules_manifest:<br>
@@ -73,7 +101,7 @@ class OETestContext(object):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.loader =3D self.loaderClass(self, m=
odule_paths, modules, tests,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules_requ=
ired, **kwargs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.suites =3D self.loader.discover()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.suites =3D self.orderByPriority(self.loa=
der.discover())<br>
<br>
=C2=A0 =C2=A0 =C2=A0def prepareSuite(self, suites, processes):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return suites<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000548ea905b82cd8ef--
