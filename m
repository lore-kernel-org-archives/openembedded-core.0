Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.421.1585868972327603574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 16:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CfVnEWXj;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id e9so5666649wme.4
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 16:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IY/nDfb25IZi7LCEebfWMugnKqukY+HEmVw5l+ysASs=;
        b=CfVnEWXjm+Zh6caStH6/TWGZ6DFQbu+5ZxPyT3OBm7jh9kj4T9j27AJOWVxFSRiT2i
         84xYFzBjSC2Q5S0m9zCdLnu7c/zdys4W9MMa4CYns3Ry2fkcRIWn15kHCg+S52D29or8
         E3lgyqfDcoIxX8GSkXiSa6/+yroCsy2/zV6kFKxL6Z5/QIIlmuBaA90Ut/rv1cOJT9uR
         kmmVguuZHuP3Oqzzofc+t/anxu9MV94dfDO94jyCOH0TuFW/kopqQPz4fRUzPBRiSRbI
         ouV45to9o/Hkxq1TPt0oO6oZ4AySkF0z8YcKhuwI+6p4gyK9RoeNZLgNoZ9ueJBmS6d8
         /83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IY/nDfb25IZi7LCEebfWMugnKqukY+HEmVw5l+ysASs=;
        b=p1wZ3NLUn9H6ErYqbmyGD/D5IbI/LdCyCfrr+2OalCOacUiiUOdwlQdcKOr1/tfJ8N
         eJBP4gQnOH00hDKO/JtoMlT32ottqykoLhwa6R2wiElqRjK6TtNtMotOFrrckst1cxMr
         rjqNe7cRLgKmZSbXNlgJv2paotOGCmxnF5PtDB2yiM7I3B5mosPAoMGZLvcf9sVlXYlK
         cwb9Cw0XLnrxbQyoeAQ4EfINQs122EnBZhk6GAad4GCMZYb3k8RRKo9dbrqdrTrRrmfy
         5wAMj/H2rs295KEdjgEU1EoyNFlx3+dcm9ovqQlrgMQgWRmXwJFokUnwAOzPhlkjAwQb
         xggw==
X-Gm-Message-State: AGi0PuavUg6/i5DVhBUpy0/upr8b7HdfC5QcTjXDCOjTfOGxwIIcKBYe
	o5UNdmqazJLDvPO/L40gamlpTTqAnEgppyuNd8g=
X-Google-Smtp-Source: APiQypI5eYROqAx9J03NNBo5GvK6h6hiIN+xjX1JlygD5LuMQIsK5W427KAR13T+Z6i0jyz96Dez6RxjnruBMLYQPko=
X-Received: by 2002:a05:600c:21cb:: with SMTP id x11mr5757515wmj.111.1585868970825;
 Thu, 02 Apr 2020 16:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200402180832.12814-1-JPEWhacker@gmail.com> <b69366f4b2632b18997691497c8799a93cb36b27.camel@linuxfoundation.org>
In-Reply-To: <b69366f4b2632b18997691497c8799a93cb36b27.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 2 Apr 2020 18:09:19 -0500
Message-ID: <CAJdd5GZh+M5wJO288Exma-gdb4bpWP6zYA5KeyzdyC3CBBtwpg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/reproducible_build: Skip SDE for non-finalizing virtual recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa9cda05a256e463"

--000000000000aa9cda05a256e463
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 2, 2020, 3:42 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-04-02 at 13:08 -0500, Joshua Watt wrote:
> > Don't capture the source date epoch for recipes that are not being
> > finalized. This prevents a virtual recipe (e.g. multilib) from
> > attempting to read the source date epoch file from the non-virtual
> > recipes workdir.
> >
> > [YOCTO #13851]
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/reproducible_build.bbclass | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
>
> What puzzles me with this is that we're telling bitbake to ignore the
> variable for hashing purposes, yet it still goes ahead and executes it.
>
> If we decide that is a bug, we can come up with the patch that follows
> below, which I think should also fix this issue and perhaps some
> others?
>

It definitely seems like a good thing to do, question is can we make this
change so close to the release? The very rare SDE race is the only thing I
know of that is fixed by this, which seems like very little pay off for a
lot of risk... We could do both changes; mine now for the release, then let
this one soak on master for a while and backport if all is well.



> data/siggen: Don't expand ignored variables
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  bitbake/lib/bb/data.py       | 4 ++--
>  bitbake/lib/bb/siggen.py     | 2 +-
>  bitbake/lib/bb/tests/data.py | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/bitbake/lib/bb/data.py b/bitbake/lib/bb/data.py
> index 6dc02172cb..b0683c5180 100644
> --- a/bitbake/lib/bb/data.py
> +++ b/bitbake/lib/bb/data.py
> @@ -365,7 +365,7 @@ def build_dependencies(key, keys, shelldeps,
> varflagsexcl, d):
>      #bb.note("Variable %s references %s and calls %s" % (key, str(deps),
> str(execs)))
>      #d.setVarFlag(key, "vardeps", deps)
>
> -def generate_dependencies(d):
> +def generate_dependencies(d, whitelist):
>
>      keys = set(key for key in d if not key.startswith("__"))
>      shelldeps = set(key for key in d.getVar("__exportlist", False) if
> d.getVarFlag(key, "export", False) and not d.getVarFlag(key, "unexport",
> False))
> @@ -380,7 +380,7 @@ def generate_dependencies(d):
>          newdeps = deps[task]
>          seen = set()
>          while newdeps:
> -            nextdeps = newdeps
> +            nextdeps = newdeps - whitelist
>              seen |= nextdeps
>              newdeps = set()
>              for dep in nextdeps:
> diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
> index 8bfc45235d..4c8d81c5da 100644
> --- a/bitbake/lib/bb/siggen.py
> +++ b/bitbake/lib/bb/siggen.py
> @@ -146,7 +146,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
>      def _build_data(self, fn, d):
>
>          ignore_mismatch = ((d.getVar("BB_HASH_IGNORE_MISMATCH") or '') ==
> '1')
> -        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
> +        tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d,
> self.basewhitelist)
>
>          taskdeps, basehash = bb.data.generate_dependency_hash(tasklist,
> gendeps, lookupcache, self.basewhitelist, fn)
>
> diff --git a/bitbake/lib/bb/tests/data.py b/bitbake/lib/bb/tests/data.py
> index 2b137706dd..5f195047de 100644
> --- a/bitbake/lib/bb/tests/data.py
> +++ b/bitbake/lib/bb/tests/data.py
> @@ -476,7 +476,7 @@ class Contains(unittest.TestCase):
>  class TaskHash(unittest.TestCase):
>      def test_taskhashes(self):
>          def gettask_bashhash(taskname, d):
> -            tasklist, gendeps, lookupcache =
> bb.data.generate_dependencies(d)
> +            tasklist, gendeps, lookupcache =
> bb.data.generate_dependencies(d, set())
>              taskdeps, basehash =
> bb.data.generate_dependency_hash(tasklist, gendeps, lookupcache, set(),
> "somefile")
>              bb.warn(str(lookupcache))
>              return basehash["somefile:" + taskname]
>
>

--000000000000aa9cda05a256e463
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 2, 2020, 3:42 PM Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2020=
-04-02 at 13:08 -0500, Joshua Watt wrote:<br>
&gt; Don&#39;t capture the source date epoch for recipes that are not being=
<br>
&gt; finalized. This prevents a virtual recipe (e.g. multilib) from<br>
&gt; attempting to read the source date epoch file from the non-virtual<br>
&gt; recipes workdir.<br>
&gt; <br>
&gt; [YOCTO #13851]<br>
&gt; <br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/reproducible_build.bbclass | 14 ++++++++++++++<br>
&gt;=C2=A0 1 file changed, 14 insertions(+)<br>
<br>
What puzzles me with this is that we&#39;re telling bitbake to ignore the<b=
r>
variable for hashing purposes, yet it still goes ahead and executes it.<br>
<br>
If we decide that is a bug, we can come up with the patch that follows<br>
below, which I think should also fix this issue and perhaps some<br>
others?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">It definitely seems like a good thing to do, question is can we make=
 this change so close to the release? The very rare SDE race is the only th=
ing I know of that is fixed by this, which seems like very little pay off f=
or a lot of risk... We could do both changes; mine now for the release, the=
n let this one soak on master for a while and backport if all is well.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
data/siggen: Don&#39;t expand ignored variables<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfound=
ation.org</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bb/data.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0bitbake/lib/bb/siggen.py=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0bitbake/lib/bb/tests/data.py | 2 +-<br>
=C2=A03 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/bitbake/lib/bb/data.py b/bitbake/lib/bb/data.py<br>
index 6dc02172cb..b0683c5180 100644<br>
--- a/bitbake/lib/bb/data.py<br>
+++ b/bitbake/lib/bb/data.py<br>
@@ -365,7 +365,7 @@ def build_dependencies(key, keys, shelldeps, varflagsex=
cl, d):<br>
=C2=A0 =C2=A0 =C2=A0#bb.note(&quot;Variable %s references %s and calls %s&q=
uot; % (key, str(deps), str(execs)))<br>
=C2=A0 =C2=A0 =C2=A0#d.setVarFlag(key, &quot;vardeps&quot;, deps)<br>
<br>
-def generate_dependencies(d):<br>
+def generate_dependencies(d, whitelist):<br>
<br>
=C2=A0 =C2=A0 =C2=A0keys =3D set(key for key in d if not key.startswith(&qu=
ot;__&quot;))<br>
=C2=A0 =C2=A0 =C2=A0shelldeps =3D set(key for key in d.getVar(&quot;__expor=
tlist&quot;, False) if d.getVarFlag(key, &quot;export&quot;, False) and not=
 d.getVarFlag(key, &quot;unexport&quot;, False))<br>
@@ -380,7 +380,7 @@ def generate_dependencies(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newdeps =3D deps[task]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seen =3D set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while newdeps:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nextdeps =3D newdeps<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nextdeps =3D newdeps - whitelist=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seen |=3D nextdeps<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newdeps =3D set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in nextdeps:<br>
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py<br>
index 8bfc45235d..4c8d81c5da 100644<br>
--- a/bitbake/lib/bb/siggen.py<br>
+++ b/bitbake/lib/bb/siggen.py<br>
@@ -146,7 +146,7 @@ class SignatureGeneratorBasic(SignatureGenerator):<br>
=C2=A0 =C2=A0 =C2=A0def _build_data(self, fn, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignore_mismatch =3D ((d.getVar(&quot;BB_H=
ASH_IGNORE_MISMATCH&quot;) or &#39;&#39;) =3D=3D &#39;1&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklist, gendeps, lookupcache =3D bb.data.gen=
erate_dependencies(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklist, gendeps, lookupcache =3D bb.data.gen=
erate_dependencies(d, self.basewhitelist)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0taskdeps, basehash =3D bb.data.generate_d=
ependency_hash(tasklist, gendeps, lookupcache, self.basewhitelist, fn)<br>
<br>
diff --git a/bitbake/lib/bb/tests/data.py b/bitbake/lib/bb/tests/data.py<br=
>
index 2b137706dd..5f195047de 100644<br>
--- a/bitbake/lib/bb/tests/data.py<br>
+++ b/bitbake/lib/bb/tests/data.py<br>
@@ -476,7 +476,7 @@ class Contains(unittest.TestCase):<br>
=C2=A0class TaskHash(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0def test_taskhashes(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def gettask_bashhash(taskname, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklist, gendeps, lookupcache =
=3D bb.data.generate_dependencies(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklist, gendeps, lookupcache =
=3D bb.data.generate_dependencies(d, set())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0taskdeps, basehash =3D bb.d=
ata.generate_dependency_hash(tasklist, gendeps, lookupcache, set(), &quot;s=
omefile&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(str(lookupcache))<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return basehash[&quot;somef=
ile:&quot; + taskname]<br>
<br>
</blockquote></div></div></div>

--000000000000aa9cda05a256e463--
