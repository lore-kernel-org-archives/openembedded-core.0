Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.277.1606936120126385163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 11:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oOMTtOpe;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: jeanmarie.lemetayer@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d5so1888450qtn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Dec 2020 11:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YLSP1Wwh85HsoPCJWhP1WzBx6kOcYb/otAmBvrPHhgI=;
        b=oOMTtOpeqCP6KtzEhRgyBPZyIVrIr3bxWIRMRfF7mtZsCji7UTT1GNtXpb3oTfZkbX
         iPRgK0L8WMY22J+WeobyqWeL2ILx+UyKTDMYITgpnsd29qVuCtPF1DSa7y+9yN0P/6p0
         XR/+CSaQTXzZRYfC7J0rz+MktHt8aerC/n+AS+z/p2P3zHeXvBH9iD9+kz2zZg5MjbC/
         +Wh9yqSoHxURfNCjiALtGaSpzwG//7REBTElz8n9p4ksneCu1kQem/X/gM24dYbg9atn
         QRAD98XvLvJbiugoF9ksLaq9tzTZW51cKKFUBNOoXoJuyB1u1jIzt1MjmECYte8i0/YY
         NmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YLSP1Wwh85HsoPCJWhP1WzBx6kOcYb/otAmBvrPHhgI=;
        b=Syv0pYnD5YGzxw+Vs969v43HtjBb865QFpTgi9RQirDsZBXAhtuyZoUKQd6Ei/zUSp
         EsRP+PPbD8rWfTxpdXm49bAp1U0HvFOtusBXxjnL4DKNVJdHxEMAKfo3ILy4pmh3cHze
         S1bZ2o4t6qCGmlStQ6FBdpry87CyEOSEiIVAH2ZBvsC4PtXWtlEsuDqUWuHrfQUYpMIu
         FGKgPMpHO9EJ+YIHnODeKZ9Xco4i7S6Mk5FXF+mLU5Wev7HrpqSOBdikjgnC+GJ8qjcg
         6THF3ogrAQOuU0Man69SMTxQf9DrAfAKUoNIiEfvXH+QkcZlHycDuHQmYGqOakUxketX
         3nUQ==
X-Gm-Message-State: AOAM532LSuDmG+ozHj2uPinQxfJyp17k8mQ+tDUIb6lbDjTL6VZ4Wk/6
	FgGXqdzvpHWZPD1K3vvKNNqcxh7/XfH/qL6g+VZJ2JqDHLU=
X-Google-Smtp-Source: ABdhPJx4pKZ5oeennY6b7TwswWzLfkK/99Te2qyN6phQzKL+ohrbnzXLSvtAjrbyLWuxXdMEmpNhAmO8jFPZy/hPaVc=
X-Received: by 2002:ac8:7316:: with SMTP id x22mr4140061qto.386.1606936119202;
 Wed, 02 Dec 2020 11:08:39 -0800 (PST)
MIME-Version: 1.0
References: <WyJB.1606926356468119429.WUQh@lists.openembedded.org>
In-Reply-To: <WyJB.1606926356468119429.WUQh@lists.openembedded.org>
From: "Jean-Marie Lemetayer" <jeanmarie.lemetayer@gmail.com>
Date: Wed, 2 Dec 2020 20:08:28 +0100
Message-ID: <CAAdc0hw93c35DChTQ2Z6s=gC8U1Dkm2KsvxVyJFFStYATvZkqA@mail.gmail.com>
Subject: Re: [OE-core] Multi-threaded npm build
To: michal.frynas@sigma.se
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008fd8a605b57ff854"

--0000000000008fd8a605b57ff854
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Thanks, this is definitely helpful.

Have you checked if your improvement is tested. I think it should be tested
by the test_devtool_add_npm under meta/lib/oeqa/selftest/cases/devtool.py

See:
 - https://wiki.yoctoproject.org/wiki/Oe-selftest
 -
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=22dd46cc34629d0750177fddff2e1c178c854340

Best Regards,
Jean-Marie


On Wed, Dec 2, 2020 at 5:26 PM <michal.frynas@sigma.se> wrote:

> Task do_configure delivered by npm.bbclass takes a lot of time, the longer
> shrinkwrap dependency list the longer time needed for do_configure to
> execute.
> Following improvement allows to execute do_configure on any available CPI
> threads.
>
> diff --git a/bitbake/lib/bb/fetch2/npmsw.py
> b/bitbake/lib/bb/fetch2/npmsw.py
> index 0c3511d8ab..0e6075859c 100644
> --- a/bitbake/lib/bb/fetch2/npmsw.py
> +++ b/bitbake/lib/bb/fetch2/npmsw.py
> @@ -29,8 +29,9 @@ from bb.fetch2.npm import npm_integrity
>  from bb.fetch2.npm import npm_localfile
>  from bb.fetch2.npm import npm_unpack
>  from bb.utils import is_semver
> +from concurrent.futures import ThreadPoolExecutor
>
> -def foreach_dependencies(shrinkwrap, callback=None, dev=False):
> +def foreach_dependencies(shrinkwrap, callback=None, dev=False,
> executor=None):
>      """
>          Run a callback for each dependencies of a shrinkwrap file.
>          The callback is using the format:
> @@ -49,7 +50,10 @@ def foreach_dependencies(shrinkwrap, callback=None,
> dev=False):
>                      continue
>                  elif deps[name].get("bundled", False):
>                      continue
> -                callback(name, deps[name], subtree)
> +                if executor:
> +                    executor.submit(callback, name=name,
> params=deps[name], deptree=subtree)
> +                else:
> +                    callback(name, deps[name], subtree)
>
>      _walk_deps(shrinkwrap.get("dependencies", {}), [])
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 068032a1e5..1869b63cdb 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -80,6 +80,7 @@ python npm_do_configure() {
>      from bb.fetch2.npm import npm_unpack
>      from bb.fetch2.npmsw import foreach_dependencies
>      from bb.progress import OutOfProgressHandler
> +    from concurrent.futures import ThreadPoolExecutor
>
>      bb.utils.remove(d.getVar("NPM_CACHE"), recurse=True)
>      bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=True)
> @@ -164,9 +165,11 @@ python npm_do_configure() {
>              progress_done += 1
>              progress.write("%d/%d" % (progress_done, progress_total))
>
> +    executor = ThreadPoolExecutor(max_workers = os.cpu_count())
>      dev = bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
>      foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
> -    foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
> +    foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev,
> executor)
> +    executor.shutdown(True)
>
>      # Configure the main package
>      with tempfile.TemporaryDirectory() as tmpdir:
>
>
>
>
> 
>
>

--0000000000008fd8a605b57ff854
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Michal,<br><br>Thanks, this is definitely helpful.<br><=
br>Have you checked if your improvement is tested. I think it should be tes=
ted by the test_devtool_add_npm under meta/lib/oeqa/selftest/cases/devtool.=
py<br><br>See:<br>=C2=A0- <a href=3D"https://wiki.yoctoproject.org/wiki/Oe-=
selftest">https://wiki.yoctoproject.org/wiki/Oe-selftest</a><div>=C2=A0-=C2=
=
=A0<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=
=3D22dd46cc34629d0750177fddff2e1c178c854340">https://git.yoctoproject.org/=
cgit/cgit.cgi/poky/commit/?id=3D22dd46cc34629d0750177fddff2e1c178c854340</a=
><br><br>Best Regards,</div><div>Jean-Marie</div></div><br><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020=
 at 5:26 PM &lt;<a href=3D"mailto:michal.frynas@sigma.se">michal.frynas@sig=
ma.se</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;fon=
t-variant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;l=
ine-height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif;vertical-=
align:baseline;color:rgb(0,0,0)">Task do_configure delivered by npm.bbclass=
 takes a lot of time, the longer shrinkwrap dependency list the longer time=
 needed for do_configure to execute.</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif;vertical-alig=
n:baseline;color:rgb(0,0,0)">Following improvement allows to execute do_con=
figure on any available CPI threads.<br>
<blockquote>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">diff --git a/bitbake/lib/bb/fetch2/=
npmsw.py b/bitbake/lib/bb/fetch2/npmsw.py</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">index 0c3511d8ab..0e6075859c 100644=
</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">--- a/bitbake/lib/bb/fetch2/npmsw.p=
y</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+++ b/bitbake/lib/bb/fetch2/npmsw.p=
y</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">@@ -29,8 +29,9 @@ from bb.fetch2.np=
m import npm_integrity</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0from bb.fetch2.npm import npm=
_localfile</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0from bb.fetch2.npm import npm=
_unpack</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0from bb.utils import is_semve=
r</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+from concurrent.futures import Thr=
eadPoolExecutor</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">-def foreach_dependencies(shrinkwra=
p, callback=3DNone, dev=3DFalse):</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+def foreach_dependencies(shrinkwra=
p, callback=3DNone, dev=3DFalse, executor=3DNone):</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0&quot;&quot;&qu=
ot;</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0R=
un a callback for each dependencies of a shrinkwrap file.</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T=
he callback is using the format:</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">@@ -49,7 +50,10 @@ def foreach_depe=
ndencies(shrinkwrap, callback=3DNone, dev=3DFalse):</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0elif deps[name].get(&quot;bundled&quot;, False)=
:</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 callback(name, deps[name], subtree)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if executor:</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 executor.submit(callback, name=3Dname, =
params=3Ddeps[name], deptree=3Dsubtree)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 else:</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback(name, deps[name], subtree)</di=
v>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0_walk_deps(shri=
nkwrap.get(&quot;dependencies&quot;, {}), [])</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">diff --git a/meta/classes/npm.bbcla=
ss b/meta/classes/npm.bbclass</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">index 068032a1e5..1869b63cdb 100644=
</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">--- a/meta/classes/npm.bbclass</div=
>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+++ b/meta/classes/npm.bbclass</div=
>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">@@ -80,6 +80,7 @@ python npm_do_con=
figure() {</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0from bb.fetch2.=
npm import npm_unpack</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0from bb.fetch2.=
npmsw import foreach_dependencies</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0from bb.progres=
s import OutOfProgressHandler</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 from concurrent.futu=
res import ThreadPoolExecutor</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0bb.utils.remove=
(d.getVar(&quot;NPM_CACHE&quot;), recurse=3DTrue)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0bb.utils.remove=
(d.getVar(&quot;NPM_PACKAGE&quot;), recurse=3DTrue)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">@@ -164,9 +165,11 @@ python npm_do_=
configure() {</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0progress_done +=3D 1</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0progress.write(&quot;%d/%d&quot; % (progress_done, progress_t=
otal))</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 executor =3D ThreadP=
oolExecutor(max_workers =3D os.cpu_count())</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0dev =3D bb.util=
s.to_boolean(d.getVar(&quot;NPM_INSTALL_DEV&quot;), False)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0foreach_depende=
ncies(orig_shrinkwrap, _count_dependency, dev)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">-=C2=A0 =C2=A0 foreach_dependencies=
(orig_shrinkwrap, _cache_dependency, dev)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 foreach_dependencies=
(orig_shrinkwrap, _cache_dependency, dev, executor)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">+=C2=A0 =C2=A0 executor.shutdown(Tr=
ue)</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0# Configure the=
 main package</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;vertical-align:baseline">=C2=A0 =C2=A0 =C2=A0with tempfile.T=
emporaryDirectory() as tmpdir:</div>
<div>=C2=A0</div>
</blockquote>
</div>
<div style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-va=
riant:inherit;font-weight:inherit;font-stretch:inherit;font-size:12pt;line-=
height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif;vertical-alig=
n:baseline;color:rgb(0,0,0)">=C2=A0</div>
<br>
<br>
<br>
</blockquote></div>

--0000000000008fd8a605b57ff854--
