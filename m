Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web09.325.1616432093351698907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 09:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=l6AP30pL;
 spf=pass (domain: google.com, ip: 209.85.166.182, mailfrom: gmouse@google.com)
Received: by mail-il1-f182.google.com with SMTP id t14so5644547ilu.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H4s8kIYQAWM26ZVkk3d5Ejc9zIPZ8kTFuK5nnP2ns3c=;
        b=l6AP30pLSnt8Lx+5QcRusFp2i+lDT3P+uHo1eD7ZJGdU86Zx6JDHnVYNN0+xauuHTC
         tPesKdV10zIZCdSYKm6Q20h6FrLINkpmEUFJWT1SVFutiUsa1a4kV9pygL9/cQKpxPlW
         mXg5fblI49c2hHB1Qi3LZC0ZAmaffGUIXj1XL1v8moqHrcCsMW5sqnlSNjLo0D0HpByT
         FqUwkwaGMlOQDtChCtVHz9/3pS6oKaPwuN157mSb4gzxDmX3UOHOlTt9lU6KlYdVtlGS
         tvkTKl8mWu6UUryymyb6aE2DVx1oNSapsNUJme5Kv4rK5WjtLTTK8kx9YsG6L0DN6fft
         XCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H4s8kIYQAWM26ZVkk3d5Ejc9zIPZ8kTFuK5nnP2ns3c=;
        b=WhBK6YAlOOzTm5dahGCfSnqA4tCEQvK7fgtN4KMgTPZbARHOmxEG4sbScoSinHkJPF
         VROL0/7YbeCbnnssZGiGtyjJTyuYe/9Nx2s2eOVKL0ytE3bzeM39lKpuag6DJWt3zofQ
         eEPUOP6zBNvEcuJla0ODOmVk/GAiWWnYHBJGOYyGAxm7aSvpKO9vx2AX6Wlpzm2mNchM
         1fqERTfDlNGMisZZL5mtTEbwzxdQwMFlwg4L9mV/sYIw64hiycu/8HUIEmu+1r0K7r11
         JWd1K8ROIHP2BLbnAJMSrbUcUdN8SORetMsILL8/QDhQDCU/i7vpp3ci/+O3rOKR51I1
         Z08g==
X-Gm-Message-State: AOAM531BM3ydAK8bewswMOmJVoJ47PT26hoDpcQJ2rklXFO/zqxneah3
	hKsuUSWu9Liops7/p+BF+3eGkhUmsNnYqQdwXVPb8Qgrwsg=
X-Google-Smtp-Source: ABdhPJzJMpZlHQuiZAaKNK307jLbgD6Kdg2b0h72v9vwz2htE2EYHW2qPo+7qUPZOrHQMnu7DXqA1xiE+R7O3ZjtSbo=
X-Received: by 2002:a05:6e02:14c2:: with SMTP id o2mr789123ilk.91.1616432090477;
 Mon, 22 Mar 2021 09:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f4dbd25e-5dbe-43cd-9759-142455aef0eb@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.31ab2b89-4cad-4ccb-bc6c-988623ea5223@emailsignatures365.codetwo.com>
 <20210322154557.1591593-1-gmouse@google.com> <91eb3709-1738-906c-e704-c78fc75314c8@topic.nl>
In-Reply-To: <91eb3709-1738-906c-e704-c78fc75314c8@topic.nl>
From: "Anton Kachalov" <gmouse@google.com>
Date: Mon, 22 Mar 2021 17:54:39 +0100
Message-ID: <CADVsX89t+17uv9o9EjheXUGpYFMwZNEgciPNU5APU4FNJK9pkg@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] package_manager: install versioned postinst scripts
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008efffa05be22ec8e"

--0000000000008efffa05be22ec8e
Content-Type: text/plain; charset="UTF-8"

Hi, Mike.

That is how OpenBMC is designed. Most of the targets are read-only rootfs
(squashfs) and overlayfs for RW.
It is not expected to overwrite binaries through overlayfs and there are
plans to scope RW areas (e.g. /etc).

Those files with 64-chars suffix are mostly hidden from regular users: the
files are removed during the first startup. No one will notice them :)

Anyway, alternatively within the openbmc update script it's possible to
force clean the deleted files on overlayfs upperdir. However, it will mean
that all the scripts regardless if they are updated or not, will be
re-executed after rootfs update.

On Mon, 22 Mar 2021 at 17:08, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> Two remarks below...
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69 <+31%20499%20336%20969>
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>
> Please consider the environment before printing this e-mail
> On 22-03-2021 16:45, Anton Kachalov via lists.openembedded.org wrote:
> > From: "Anton D. Kachalov" <gmouse@google.com>
> >
> > When running on read-only rootfs backed with overlayfs, the processed
> scripts
> > are being marked as deleted on upperdir of overlayfs. When it comes to
> > upgrade the main read-only image, it might contain new postinst scripts
> that
> > are different from the already processed. Introduced suffix (sha256 of
> > the content) allows to distinct updated scripts of the same package.
>
> So your usecase is that you have a read-only rootfs with an overlay on
> top, and then just replace the rootfs. And then expect things to still
> work?
>
> That doesn't sound valid to me - normally I'd wipe the overlay clean
> when updating the underlying read-only part. I'd be very interested in
> what you're actually trying to accomplish here?
>
> And further, I don't think appending 64 characters to filenames is going
> to make anyone happy.
>
> In your case, I'd opt for a script that just resets the postinst scripts
> (and maybe more?) in the overlay. Or have 3 overlays. Whenever the
> package manager runs, activate the second layer. The "user" stuff in the
> third layer is normally active. Then when you upgrade the system, wipe
> the second layer, to get rid of obsolete packages. Or something like
> that. Again, tell us what you're really building...
>
>
> >
> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > ---
> >   meta/lib/oe/package_manager/deb/rootfs.py   | 11 ++++++++++-
> >   meta/lib/oe/package_manager/ipk/rootfs.py   | 11 ++++++++++-
> >   meta/lib/oe/package_manager/rpm/__init__.py |  4 +++-
> >   3 files changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/lib/oe/package_manager/deb/rootfs.py
> b/meta/lib/oe/package_manager/deb/rootfs.py
> > index 8fbaca11d6..704d213626 100644
> > --- a/meta/lib/oe/package_manager/deb/rootfs.py
> > +++ b/meta/lib/oe/package_manager/deb/rootfs.py
> > @@ -4,6 +4,7 @@
> >
> >   import re
> >   import shutil
> > +from hashlib import sha256
> >   from oe.rootfs import Rootfs
> >   from oe.manifest import Manifest
> >   from oe.utils import execute_pre_post_process
> > @@ -115,8 +116,16 @@ class DpkgOpkgRootfs(Rootfs):
> >               bb.utils.mkdirhier(dst_postinst_dir)
> >
> >               if os.path.exists(os.path.join(src_postinst_dir, p +
> ".postinst")):
> > +                csum = sha256()
> > +                with open(src_postinst_dir, p + ".postinst", "rb") as f:
> > +                    while True:
> > +                        data = f.read(65536)
> > +                        if not data:
> > +                            break
> > +                        csum.update(data)
> > +
> >                   shutil.copy(os.path.join(src_postinst_dir, p +
> ".postinst"),
> > -                            os.path.join(dst_postinst_dir, "%03d-%s" %
> (num, p)))
> > +                            os.path.join(dst_postinst_dir, "%03d-%s.%s"
> % (num, p, csum.hexdigest())))
> >
> >               num += 1
> >
> > diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py
> b/meta/lib/oe/package_manager/ipk/rootfs.py
> > index 26dbee6f6a..6ead6ddef3 100644
> > --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> > +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> > @@ -5,6 +5,7 @@
> >   import re
> >   import filecmp
> >   import shutil
> > +from hashlib import sha256
> >   from oe.rootfs import Rootfs
> >   from oe.manifest import Manifest
> >   from oe.utils import execute_pre_post_process
> > @@ -116,8 +117,16 @@ class DpkgOpkgRootfs(Rootfs):
> >               bb.utils.mkdirhier(dst_postinst_dir)
> >
> >               if os.path.exists(os.path.join(src_postinst_dir, p +
> ".postinst")):
> > +                csum = sha256()
> > +                with open(src_postinst_dir, p + ".postinst", "rb") as f:
> > +                    while True:
> > +                        data = f.read(65536)
> > +                        if not data:
> > +                            break
> > +                        csum.update(data)
> > +
> >                   shutil.copy(os.path.join(src_postinst_dir, p +
> ".postinst"),
> > -                            os.path.join(dst_postinst_dir, "%03d-%s" %
> (num, p)))
> > +                            os.path.join(dst_postinst_dir, "%03d-%s.%s"
> % (num, p, csum.hexdigest())))
> >
> >               num += 1
> >
> > diff --git a/meta/lib/oe/package_manager/rpm/__init__.py
> b/meta/lib/oe/package_manager/rpm/__init__.py
> > index 6df0092281..4746e96ce8 100644
> > --- a/meta/lib/oe/package_manager/rpm/__init__.py
> > +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> > @@ -4,6 +4,7 @@
> >
> >   import shutil
> >   import subprocess
> > +from hashlib import sha256
> >   from oe.package_manager import *
> >
> >   class RpmIndexer(Indexer):
> > @@ -359,7 +360,8 @@ class RpmPM(PackageManager):
> >           target_path = oe.path.join(self.target_rootfs,
> self.d.expand('${sysconfdir}/rpm-postinsts/'))
> >           bb.utils.mkdirhier(target_path)
> >           num = self._script_num_prefix(target_path)
> > -        saved_script_name = oe.path.join(target_path, "%d-%s" % (num,
> pkg))
> > +        csum = sha256(output.encode("utf-8")).hexdigest()
> > +        saved_script_name = oe.path.join(target_path, "%d-%s.%s" %
> (num, pkg, csum))
> >           open(saved_script_name, 'w').write(output)
> >           os.chmod(saved_script_name, 0o755)
> >
> >
> > 
> >
>
> --
> Mike Looijmans
>
>

--0000000000008efffa05be22ec8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Mike.<div><br></div><div>That is how OpenBMC is design=
ed. Most of the targets are read-only rootfs (squashfs) and overlayfs for R=
W.</div><div>It is not expected to overwrite binaries through overlayfs and=
 there are plans to scope RW areas (e.g. /etc).</div><div><br></div><div>Th=
ose files with 64-chars suffix are mostly hidden from regular users: the fi=
les are removed during the first startup. No one will notice them :)</div><=
div><br></div><div>Anyway, alternatively within the openbmc update script i=
t&#39;s possible to force clean the deleted files on overlayfs upperdir. Ho=
wever, it will mean that all the scripts regardless if they are updated or =
not, will be re-executed after rootfs update.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 22 Mar 2021 at 1=
7:08, Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.lo=
oijmans@topic.nl</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Two remarks below...<br>
<br>
<br>
Met vriendelijke groet / kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
<br>
TOPIC Embedded Products B.V.<br>
Materiaalweg 4, 5681 RJ Best<br>
The Netherlands<br>
<br>
T: <a href=3D"tel:+31%20499%20336%20969" value=3D"+31499336969" target=3D"=
_blank">+31 (0) 499 33 69 69</a><br>
E: <a href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"_blank">m=
ike.looijmans@topicproducts.com</a><br>
W: <a href=3D"http://www.topic.nl" rel=3D"noreferrer" target=3D"_blank">ww=
w.topic.nl</a><br>
<br>
Please consider the environment before printing this e-mail<br>
On 22-03-2021 16:45, Anton Kachalov via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; From: &quot;Anton D. Kachalov&quot; &lt;<a href=3D"mailto:gmouse@goog=
le.com" target=3D"_blank">gmouse@google.com</a>&gt;<br>
&gt;<br>
&gt; When running on read-only rootfs backed with overlayfs, the processed=
 scripts<br>
&gt; are being marked as deleted on upperdir of overlayfs. When it comes t=
o<br>
&gt; upgrade the main read-only image, it might contain new postinst scrip=
ts that<br>
&gt; are different from the already processed. Introduced suffix (sha256 o=
f<br>
&gt; the content) allows to distinct updated scripts of the same package.<=
br>
<br>
So your usecase is that you have a read-only rootfs with an overlay on <br=
>
top, and then just replace the rootfs. And then expect things to still <br=
>
work?<br>
<br>
That doesn&#39;t sound valid to me - normally I&#39;d wipe the overlay cle=
an <br>
when updating the underlying read-only part. I&#39;d be very interested in=
 <br>
what you&#39;re actually trying to accomplish here?<br>
<br>
And further, I don&#39;t think appending 64 characters to filenames is goi=
ng <br>
to make anyone happy.<br>
<br>
In your case, I&#39;d opt for a script that just resets the postinst scrip=
ts <br>
(and maybe more?) in the overlay. Or have 3 overlays. Whenever the <br>
package manager runs, activate the second layer. The &quot;user&quot; stuf=
f in the <br>
third layer is normally active. Then when you upgrade the system, wipe <br=
>
the second layer, to get rid of obsolete packages. Or something like <br>
that. Again, tell us what you&#39;re really building...<br>
<br>
<br>
&gt;<br>
&gt; Signed-off-by: Anton D. Kachalov &lt;<a href=3D"mailto:gmouse@google.=
com" target=3D"_blank">gmouse@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/lib/oe/package_manager/deb/rootfs.py=C2=A0 =C2=A0| 1=
1 ++++++++++-<br>
&gt;=C2=A0 =C2=A0meta/lib/oe/package_manager/ipk/rootfs.py=C2=A0 =C2=A0| 1=
1 ++++++++++-<br>
&gt;=C2=A0 =C2=A0meta/lib/oe/package_manager/rpm/__init__.py |=C2=A0 4 +++=
-<br>
&gt;=C2=A0 =C2=A03 files changed, 23 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/=
package_manager/deb/rootfs.py<br>
&gt; index 8fbaca11d6..704d213626 100644<br>
&gt; --- a/meta/lib/oe/package_manager/deb/rootfs.py<br>
&gt; +++ b/meta/lib/oe/package_manager/deb/rootfs.py<br>
&gt; @@ -4,6 +4,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0import shutil<br>
&gt; +from hashlib import sha256<br>
&gt;=C2=A0 =C2=A0from oe.rootfs import Rootfs<br>
&gt;=C2=A0 =C2=A0from oe.manifest import Manifest<br>
&gt;=C2=A0 =C2=A0from oe.utils import execute_pre_post_process<br>
&gt; @@ -115,8 +116,16 @@ class DpkgOpkgRootfs(Rootfs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirh=
ier(dst_postinst_dir)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exis=
ts(os.path.join(src_postinst_dir, p + &quot;.postinst&quot;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum =3D sha=
256()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(sr=
c_postinst_dir, p + &quot;.postinst&quot;, &quot;rb&quot;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 while True:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 data =3D f.read(65536)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if not data:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 csum.update(data)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
hutil.copy(os.path.join(src_postinst_dir, p + &quot;.postinst&quot;),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(dst_postinst_dir, &quot;%03d-=
%s&quot; % (num, p)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(dst_postinst_dir, &quot;%03d-=
%s.%s&quot; % (num, p, csum.hexdigest())))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num +=3D 1<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/=
package_manager/ipk/rootfs.py<br>
&gt; index 26dbee6f6a..6ead6ddef3 100644<br>
&gt; --- a/meta/lib/oe/package_manager/ipk/rootfs.py<br>
&gt; +++ b/meta/lib/oe/package_manager/ipk/rootfs.py<br>
&gt; @@ -5,6 +5,7 @@<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0import filecmp<br>
&gt;=C2=A0 =C2=A0import shutil<br>
&gt; +from hashlib import sha256<br>
&gt;=C2=A0 =C2=A0from oe.rootfs import Rootfs<br>
&gt;=C2=A0 =C2=A0from oe.manifest import Manifest<br>
&gt;=C2=A0 =C2=A0from oe.utils import execute_pre_post_process<br>
&gt; @@ -116,8 +117,16 @@ class DpkgOpkgRootfs(Rootfs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirh=
ier(dst_postinst_dir)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exis=
ts(os.path.join(src_postinst_dir, p + &quot;.postinst&quot;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum =3D sha=
256()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(sr=
c_postinst_dir, p + &quot;.postinst&quot;, &quot;rb&quot;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 while True:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 data =3D f.read(65536)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if not data:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 csum.update(data)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
hutil.copy(os.path.join(src_postinst_dir, p + &quot;.postinst&quot;),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(dst_postinst_dir, &quot;%03d-=
%s&quot; % (num, p)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(dst_postinst_dir, &quot;%03d-=
%s.%s&quot; % (num, p, csum.hexdigest())))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num +=3D 1<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/o=
e/package_manager/rpm/__init__.py<br>
&gt; index 6df0092281..4746e96ce8 100644<br>
&gt; --- a/meta/lib/oe/package_manager/rpm/__init__.py<br>
&gt; +++ b/meta/lib/oe/package_manager/rpm/__init__.py<br>
&gt; @@ -4,6 +4,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0import shutil<br>
&gt;=C2=A0 =C2=A0import subprocess<br>
&gt; +from hashlib import sha256<br>
&gt;=C2=A0 =C2=A0from oe.package_manager import *<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0class RpmIndexer(Indexer):<br>
&gt; @@ -359,7 +360,8 @@ class RpmPM(PackageManager):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_path =3D oe.path.join(=
self.target_rootfs, self.d.expand(&#39;${sysconfdir}/rpm-postinsts/&#39;))<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(target_pat=
h)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num =3D self._script_num_pref=
ix(target_path)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_script_name =3D oe.path.join(targe=
t_path, &quot;%d-%s&quot; % (num, pkg))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 csum =3D sha256(output.encode(&quot;utf-=
8&quot;)).hexdigest()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_script_name =3D oe.path.join(targe=
t_path, &quot;%d-%s.%s&quot; % (num, pkg, csum))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open(saved_script_name, &#39;=
w&#39;).write(output)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chmod(saved_script_name, 0=
o755)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-- <br>
Mike Looijmans<br>
<br>
</blockquote></div>

--0000000000008efffa05be22ec8e--
