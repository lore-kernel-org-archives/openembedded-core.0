Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.8700.1591713286952550713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PEeen+p6;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id e12so16562153eds.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lYRqXOXmtZZm0hZjGxeu+S70qLUxndL1aINka98lX0Y=;
        b=PEeen+p6Nwc5JfzE14eK4akG21DkXpzUoYsLVfdvf81USYYqkMLfm2Cx4ltzYfxBqI
         27SlCTE63hBDLyd3KD8uOSoE5dJeQBwlfOFbCoJ93GphruZTQ9MVQ5gERAuGfs8HcbJ0
         VAeEKHx/zY+mNjNwlElWVYAKKEqt0OGhH5xIlYT+JI4KX+QGC/PgspS56epe2f+slnvH
         /ztgjPspJzMUksRjphIpx6s9sce3ARmHpNR4gbEdNabLM9DVvKVs6iA/cmCTSsiwvsSy
         O2yJFhMK5smmVi4+ObCjKmkCUOwTIrNSiH3plACcuTBFbBL9MGbpwgxGAa89x7Ym2+06
         6CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lYRqXOXmtZZm0hZjGxeu+S70qLUxndL1aINka98lX0Y=;
        b=Q1drPszVjF7f1D/JFv7w8qTNps2UJeHgBwqUZZL0p6SbfvXdyB9VPMaLqVrcZBlTbD
         BzdjQq8mQYaOYAlvAi334RK4lzaaG2rbEty6IZEJV2wqDhZDN55AzasaYYZQgq6rlTZW
         v2bpEKyWxpESMObHpvbPzCIS+rgfo8CxP6vDT6dLj+ZrGeGutd5/SJTKzNHtxxOIm633
         uUhQw86AaqZ6WKo2qNZETW3Ogtn2k6ZWpz9W8qABywGgl3az4sfjFUBCwACI9TH3EB5b
         w26jbgl5ZnRnczViGLGk/dk9hU5244MfdNpvFvZeWQPX4MnSAG7n4MdQjdp371cLdMHB
         KnmQ==
X-Gm-Message-State: AOAM533d+X8YzgCGYWUI54oRQzi1G7jysJlZm6hbLOpCuLAISV93fzym
	0gtnMDBhdTc6hRZLyLVGuBNb3Dr5feJEmVY7MT8=
X-Google-Smtp-Source: ABdhPJw3wbrgZJisge2KsPQuijkSpLH7aiyuSfo6tyV6oWDp/HzgJXUeEmDcWbOZGuHyCIzCYVGeyc1hF5meO/+zDXE=
X-Received: by 2002:a05:6402:1217:: with SMTP id c23mr26829035edw.270.1591713285446;
 Tue, 09 Jun 2020 07:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200609141114.1751767-1-jacob.kroon@gmail.com>
In-Reply-To: <20200609141114.1751767-1-jacob.kroon@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 9 Jun 2020 16:34:34 +0200
Message-ID: <CA+chaQc9NQ_y3DprG8QQVaund2X-Mqj_==Pn+CUQ_UasKaD40w@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/2] features_check: Warn if not used
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6a01505a7a7a00c"

--000000000000f6a01505a7a7a00c
Content-Type: text/plain; charset="UTF-8"

Seeing how many cases like this exist(ed), this look very useful, but it
would be even better if we can catch the opposite case when e.g.
REQUIRED_DISTRO_FEATURES are set in recipe, but doesn't do anything because
of missing features_check inherit.

But I understand that such check might be more controversial as it would
need to be checked globally (outside this bbclass), maybe something in
insane.bbclass catching both cases as QA issue?

On Tue, Jun 9, 2020 at 4:11 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:

> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/features_check.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/meta/classes/features_check.bbclass
> b/meta/classes/features_check.bbclass
> index 4ba827d4ab..31ce600374 100644
> --- a/meta/classes/features_check.bbclass
> +++ b/meta/classes/features_check.bbclass
> @@ -12,11 +12,25 @@
>  # Copyright 2019 (C) Texas Instruments Inc.
>  # Copyright 2013 (C) O.S. Systems Software LTDA.
>
> +FEATURES_CHECK_INCLUDE_STACK := "${BBINCLUDESTACK}"
> +
>  python () {
>      if d.getVar('PARSE_ALL_RECIPES', False):
>          return
>
> +    unused = True
> +
>      for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
> +        if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and \
> +           d.overridedata.get('ANY_OF_' + kind + '_FEATURES') is None and
> \
> +           d.getVar('REQUIRED_' + kind + '_FEATURES') is None and \
> +           d.overridedata.get('REQUIRED_' + kind + '_FEATURES') is None
> and \
> +           d.getVar('CONFLICT_' + kind + '_FEATURES') is None and \
> +           d.overridedata.get('CONFLICT_' + kind + '_FEATURES') is None:
> +            continue
> +
> +        unused = False
> +
>          # Assume at least one var is set.
>          features = set((d.getVar(kind + '_FEATURES') or '').split())
>
> @@ -39,4 +53,10 @@ python () {
>              if conflicts:
>                  raise bb.parse.SkipRecipe("conflicting %s feature%s '%s'
> (in %s_FEATURES)"
>                      % (kind.lower(), 's' if len(conflicts) > 1 else '', '
> '.join(conflicts), kind))
> +
> +    # Only warn if inherited directly in a .bb-file; if the class is
> inherited
> +    # via an .inc/.bbclass it could be a false positive
> +    inherited_from_bb =
> d.getVar('FEATURES_CHECK_INCLUDE_STACK').split()[-1].endswith('.bb')
> +    if unused and inherited_from_bb:
> +        bb.warn("Recipe inherits features_check but doesn't use it")
>  }
> 
>

--000000000000f6a01505a7a7a00c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seeing how many cases like this exist(ed), this look very =
useful, but it would be even better if we can catch the opposite=C2=A0case =
when e.g. REQUIRED_DISTRO_FEATURES are set in recipe, but doesn&#39;t do an=
ything because of missing features_check inherit.<div><br></div><div>But I =
understand that such check might be more controversial as it would need to =
be checked globally (outside this bbclass), maybe something in insane.bbcla=
ss catching both cases as QA issue?</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 9, 2020 at 4:11 PM Jac=
ob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com">jacob.kroon@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com" tar=
get=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/features_check.bbclass | 20 ++++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
<br>
diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_c=
heck.bbclass<br>
index 4ba827d4ab..31ce600374 100644<br>
--- a/meta/classes/features_check.bbclass<br>
+++ b/meta/classes/features_check.bbclass<br>
@@ -12,11 +12,25 @@<br>
=C2=A0# Copyright 2019 (C) Texas Instruments Inc.<br>
=C2=A0# Copyright 2013 (C) O.S. Systems Software LTDA.<br>
<br>
+FEATURES_CHECK_INCLUDE_STACK :=3D &quot;${BBINCLUDESTACK}&quot;<br>
+<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;PARSE_ALL_RECIPES&#39;, False):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
+=C2=A0 =C2=A0 unused =3D True<br>
+<br>
=C2=A0 =C2=A0 =C2=A0for kind in [&#39;DISTRO&#39;, &#39;MACHINE&#39;, &#39=
;COMBINED&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;ANY_OF_&#39; + kind + &#39;_=
FEATURES&#39;) is None and \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.overridedata.get(&#39;ANY_OF_&=
#39; + kind + &#39;_FEATURES&#39;) is None and \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;REQUIRED_&#39; + k=
ind + &#39;_FEATURES&#39;) is None and \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.overridedata.get(&#39;REQUIRED=
_&#39; + kind + &#39;_FEATURES&#39;) is None and \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;CONFLICT_&#39; + k=
ind + &#39;_FEATURES&#39;) is None and \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.overridedata.get(&#39;CONFLICT=
_&#39; + kind + &#39;_FEATURES&#39;) is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unused =3D False<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Assume at least one var is set.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D set((d.getVar(kind + &#39;_=
FEATURES&#39;) or &#39;&#39;).split())<br>
<br>
@@ -39,4 +53,10 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if conflicts:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.par=
se.SkipRecipe(&quot;conflicting %s feature%s &#39;%s&#39; (in %s_FEATURES)&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0% (kind.lower(), &#39;s&#39; if len(conflicts) &gt; 1 else &#39;&#39;, =
&#39; &#39;.join(conflicts), kind))<br>
+<br>
+=C2=A0 =C2=A0 # Only warn if inherited directly in a .bb-file; if the cla=
ss is inherited<br>
+=C2=A0 =C2=A0 # via an .inc/.bbclass it could be a false positive<br>
+=C2=A0 =C2=A0 inherited_from_bb =3D d.getVar(&#39;FEATURES_CHECK_INCLUDE_=
STACK&#39;).split()[-1].endswith(&#39;.bb&#39;)<br>
+=C2=A0 =C2=A0 if unused and inherited_from_bb:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Recipe inherits features_check =
but doesn&#39;t use it&quot;)<br>
=C2=A0}<br>
<br>
</blockquote></div>

--000000000000f6a01505a7a7a00c--
