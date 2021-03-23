Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web12.6965.1616496543522455715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 03:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=cGGJfC7v;
 spf=pass (domain: google.com, ip: 209.85.166.51, mailfrom: gmouse@google.com)
Received: by mail-io1-f51.google.com with SMTP id k8so17150018iop.12
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 03:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cKhwWXhK9Nj+ZHsaE7443I/QkDA45nCMGvuXUyEH7D4=;
        b=cGGJfC7vJWAZJj8DF9SbYh6GcYgpwBfDaTVT5+++yJS7XUXat7ehCmrNYJoa2il0Mb
         r+0jpHEd8z/CNyI+ULDC+A2TJ06qo2sP/p0vSE2uF8Dlg89eUaUqeHsvtvo+t7b58EAq
         TInfQAIG1mdXV1llISGmdfTQ/PRxGCkFHHA070TzMy2a0EiEDnN3jvhFG3WJzyHGBZsB
         BdzPlbOitAT3AVOnJSGze++6JuzSBYo0ekEmYPYZMwJ2IWkbRMPoovg1VZtg/RWWykEJ
         ZaEdG1Ie0R3u/n81f49MORjNI6GOen91prFTllQhh2r+190TknrLGzMGV+z6sF2oXRHo
         9J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cKhwWXhK9Nj+ZHsaE7443I/QkDA45nCMGvuXUyEH7D4=;
        b=nRCM2XQlJKR3tNLMlo8u0V1QCDWkyhlckQsgplGuO1e121Zx0FIeGgJ9sJmJTC7rnt
         eC7szApQY8vLuPYd23fA/RqnO8zC0eyCXgdhxpcb7z8B7EE0ox778FdxW1ONL/8qi3y/
         Q86SsO+dpZs1KExVPdUXBHzVQi6HIKlecFyKJhfZ7s911cBrrUKU60lO14brgP9b7b9d
         m4swsZ8MN5TvGPj5nlGgFbbgDuFKezzv+NVVibnZjuHD+IZrzGa8sEmJnR6W9hTGIMvP
         MJsQgrz3p1/YhfNfMrYMtcxjKyIRFyqBttwC5GPBaH2f+/Nddy0Dxkqdc+NqHsfI/0sn
         0wcg==
X-Gm-Message-State: AOAM530w2FH2GpTkq5HXpj4AhzrCGLqCfkzUokXhPZYLOqUE49/mtYHO
	e2AvzG9t87tqhq76wSA+vFxBFg357FFyWW40+IF0PA==
X-Google-Smtp-Source: ABdhPJy5DY3bCdAWE5baUbk6MGacouTuiTHHKoLFzZUXTxwsT56dZZTxRfY3tt7gR47YrjB5kcCBnVGD4K5g97tQqRc=
X-Received: by 2002:a05:6638:635:: with SMTP id h21mr3635115jar.97.1616496542554;
 Tue, 23 Mar 2021 03:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f4dbd25e-5dbe-43cd-9759-142455aef0eb@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.31ab2b89-4cad-4ccb-bc6c-988623ea5223@emailsignatures365.codetwo.com>
 <20210322154557.1591593-1-gmouse@google.com> <91eb3709-1738-906c-e704-c78fc75314c8@topic.nl>
 <CADVsX89t+17uv9o9EjheXUGpYFMwZNEgciPNU5APU4FNJK9pkg@mail.gmail.com> <cbdebdbb-7386-3c99-b8aa-88e871f27727@topic.nl>
In-Reply-To: <cbdebdbb-7386-3c99-b8aa-88e871f27727@topic.nl>
From: "Anton Kachalov" <gmouse@google.com>
Date: Tue, 23 Mar 2021 11:48:51 +0100
Message-ID: <CADVsX89C90J8c5JeJUOYhtj2Z_hpE7Dwhq8jbhstdLZ=SW+uXQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] package_manager: install versioned postinst scripts
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000338b3505be31ee44"

--000000000000338b3505be31ee44
Content-Type: text/plain; charset="UTF-8"

Yes, this use case makes sense. Then the reliable way is to cleanup
upperdir of overlayfs during image upgrade and make postinsts scripts
re-entrant.

On Tue, Mar 23, 2021, 07:56 Mike Looijmans <mike.looijmans@topic.nl> wrote:

> So it's something exclusively for OpenBMC.
>
> As for running the scripts, you cannot simply conclude that a script
> doesn't need to run if its contents did not change. It may very well
> call the executable from its package to do the actual work and that may
> have changed as well.
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
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>
> Please consider the environment before printing this e-mail
> On 22-03-2021 17:54, Anton Kachalov wrote:
> > Hi, Mike.
> >
> > That is how OpenBMC is designed. Most of the targets are read-only
> > rootfs (squashfs) and overlayfs for RW.
> > It is not expected to overwrite binaries through overlayfs and there
> > are plans to scope RW areas (e.g. /etc).
> >
> > Those files with 64-chars suffix are mostly hidden from regular users:
> > the files are removed during the first startup. No one will notice them
> :)
> >
> > Anyway, alternatively within the openbmc update script it's possible
> > to force clean the deleted files on overlayfs upperdir. However, it
> > will mean that all the scripts regardless if they are updated or not,
> > will be re-executed after rootfs update.
> >
> > On Mon, 22 Mar 2021 at 17:08, Mike Looijmans <mike.looijmans@topic.nl
> > <mailto:mike.looijmans@topic.nl>> wrote:
> >
> >     Two remarks below...
> >     On 22-03-2021 16:45, Anton Kachalov via lists.openembedded.org
> >     <http://lists.openembedded.org> wrote:
> >     > From: "Anton D. Kachalov" <gmouse@google.com
> >     <mailto:gmouse@google.com>>
> >     >
> >     > When running on read-only rootfs backed with overlayfs, the
> >     processed scripts
> >     > are being marked as deleted on upperdir of overlayfs. When it
> >     comes to
> >     > upgrade the main read-only image, it might contain new postinst
> >     scripts that
> >     > are different from the already processed. Introduced suffix
> >     (sha256 of
> >     > the content) allows to distinct updated scripts of the same
> package.
> >
> >     So your usecase is that you have a read-only rootfs with an
> >     overlay on
> >     top, and then just replace the rootfs. And then expect things to
> >     still
> >     work?
> >
> >     That doesn't sound valid to me - normally I'd wipe the overlay clean
> >     when updating the underlying read-only part. I'd be very
> >     interested in
> >     what you're actually trying to accomplish here?
> >
> >     And further, I don't think appending 64 characters to filenames is
> >     going
> >     to make anyone happy.
> >
> >     In your case, I'd opt for a script that just resets the postinst
> >     scripts
> >     (and maybe more?) in the overlay. Or have 3 overlays. Whenever the
> >     package manager runs, activate the second layer. The "user" stuff
> >     in the
> >     third layer is normally active. Then when you upgrade the system,
> >     wipe
> >     the second layer, to get rid of obsolete packages. Or something like
> >     that. Again, tell us what you're really building...
> >
> >
> >     >
> >     > Signed-off-by: Anton D. Kachalov <gmouse@google.com
> >     <mailto:gmouse@google.com>>
> >     > ---
> >     >   meta/lib/oe/package_manager/deb/rootfs.py   | 11 ++++++++++-
> >     >   meta/lib/oe/package_manager/ipk/rootfs.py   | 11 ++++++++++-
> >     >   meta/lib/oe/package_manager/rpm/__init__.py |  4 +++-
> >     >   3 files changed, 23 insertions(+), 3 deletions(-)
> >     >
> >     > diff --git a/meta/lib/oe/package_manager/deb/rootfs.py
> >     b/meta/lib/oe/package_manager/deb/rootfs.py
> >     > index 8fbaca11d6..704d213626 100644
> >     > --- a/meta/lib/oe/package_manager/deb/rootfs.py
> >     > +++ b/meta/lib/oe/package_manager/deb/rootfs.py
> >     > @@ -4,6 +4,7 @@
> >     >
> >     >   import re
> >     >   import shutil
> >     > +from hashlib import sha256
> >     >   from oe.rootfs import Rootfs
> >     >   from oe.manifest import Manifest
> >     >   from oe.utils import execute_pre_post_process
> >     > @@ -115,8 +116,16 @@ class DpkgOpkgRootfs(Rootfs):
> >     >               bb.utils.mkdirhier(dst_postinst_dir)
> >     >
> >     >               if os.path.exists(os.path.join(src_postinst_dir, p
> >     + ".postinst")):
> >     > +                csum = sha256()
> >     > +                with open(src_postinst_dir, p + ".postinst",
> >     "rb") as f:
> >     > +                    while True:
> >     > +                        data = f.read(65536)
> >     > +                        if not data:
> >     > +                            break
> >     > +                        csum.update(data)
> >     > +
> >     >  shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
> >     > - os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
> >     > + os.path.join(dst_postinst_dir, "%03d-%s.%s" % (num, p,
> >     csum.hexdigest())))
> >     >
> >     >               num += 1
> >     >
> >     > diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py
> >     b/meta/lib/oe/package_manager/ipk/rootfs.py
> >     > index 26dbee6f6a..6ead6ddef3 100644
> >     > --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> >     > +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> >     > @@ -5,6 +5,7 @@
> >     >   import re
> >     >   import filecmp
> >     >   import shutil
> >     > +from hashlib import sha256
> >     >   from oe.rootfs import Rootfs
> >     >   from oe.manifest import Manifest
> >     >   from oe.utils import execute_pre_post_process
> >     > @@ -116,8 +117,16 @@ class DpkgOpkgRootfs(Rootfs):
> >     >               bb.utils.mkdirhier(dst_postinst_dir)
> >     >
> >     >               if os.path.exists(os.path.join(src_postinst_dir, p
> >     + ".postinst")):
> >     > +                csum = sha256()
> >     > +                with open(src_postinst_dir, p + ".postinst",
> >     "rb") as f:
> >     > +                    while True:
> >     > +                        data = f.read(65536)
> >     > +                        if not data:
> >     > +                            break
> >     > +                        csum.update(data)
> >     > +
> >     >  shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
> >     > - os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
> >     > + os.path.join(dst_postinst_dir, "%03d-%s.%s" % (num, p,
> >     csum.hexdigest())))
> >     >
> >     >               num += 1
> >     >
> >     > diff --git a/meta/lib/oe/package_manager/rpm/__init__.py
> >     b/meta/lib/oe/package_manager/rpm/__init__.py
> >     > index 6df0092281..4746e96ce8 100644
> >     > --- a/meta/lib/oe/package_manager/rpm/__init__.py
> >     > +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> >     > @@ -4,6 +4,7 @@
> >     >
> >     >   import shutil
> >     >   import subprocess
> >     > +from hashlib import sha256
> >     >   from oe.package_manager import *
> >     >
> >     >   class RpmIndexer(Indexer):
> >     > @@ -359,7 +360,8 @@ class RpmPM(PackageManager):
> >     >           target_path = oe.path.join(self.target_rootfs,
> >     self.d.expand('${sysconfdir}/rpm-postinsts/'))
> >     >           bb.utils.mkdirhier(target_path)
> >     >           num = self._script_num_prefix(target_path)
> >     > -        saved_script_name = oe.path.join(target_path, "%d-%s" %
> >     (num, pkg))
> >     > +        csum = sha256(output.encode("utf-8")).hexdigest()
> >     > +        saved_script_name = oe.path.join(target_path,
> >     "%d-%s.%s" % (num, pkg, csum))
> >     >           open(saved_script_name, 'w').write(output)
> >     >           os.chmod(saved_script_name, 0o755)
> >     >
> >     >
> >     > 
> >     >
> >
> >     --
> >     Mike Looijmans
> >
>
> --
> Mike Looijmans
>
>

--000000000000338b3505be31ee44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yes, this use case makes sense. Then the reliable wa=
y is to cleanup upperdir of overlayfs during image upgrade and make postins=
ts scripts re-entrant.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Mar 23, 2021, 07:56 Mike Looijmans &lt;<a href=
=3D"mailto:mike.looijmans@topic.nl">mike.looijmans@topic.nl</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">So it&#39;s something exclusively =
for OpenBMC.<br>
<br>
As for running the scripts, you cannot simply conclude that a script <br>
doesn&#39;t need to run if its contents did not change. It may very well <=
br>
call the executable from its package to do the actual work and that may <b=
r>
have changed as well.<br><br>
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
T: +31 (0) 499 33 69 69<br>
E: <a href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"_blank" r=
el=3D"noreferrer">mike.looijmans@topicproducts.com</a><br>
W: <a href=3D"http://www.topic.nl" rel=3D"noreferrer noreferrer" target=3D=
"_blank">www.topic.nl</a><br>
<br>
Please consider the environment before printing this e-mail<br>
On 22-03-2021 17:54, Anton Kachalov wrote:<br>
&gt; Hi, Mike.<br>
&gt;<br>
&gt; That is how OpenBMC is designed. Most of the targets are read-only <b=
r>
&gt; rootfs (squashfs) and overlayfs for RW.<br>
&gt; It is not expected to overwrite binaries through overlayfs and there =
<br>
&gt; are plans to scope RW areas (e.g. /etc).<br>
&gt;<br>
&gt; Those files with 64-chars suffix are mostly hidden from regular users=
: <br>
&gt; the files are removed during the first startup. No one will notice th=
em :)<br>
&gt;<br>
&gt; Anyway, alternatively within the openbmc update script it&#39;s possi=
ble <br>
&gt; to force clean the deleted files on overlayfs upperdir. However, it <=
br>
&gt; will mean that all the scripts regardless if they are updated or not,=
 <br>
&gt; will be re-executed after rootfs update.<br>
&gt;<br>
&gt; On Mon, 22 Mar 2021 at 17:08, Mike Looijmans &lt;<a href=3D"mailto:mi=
ke.looijmans@topic.nl" target=3D"_blank" rel=3D"noreferrer">mike.looijmans@=
topic.nl</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blan=
k" rel=3D"noreferrer">mike.looijmans@topic.nl</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Two remarks below...<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 22-03-2021 16:45, Anton Kachalov via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded.org=
</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; From: &quot;Anton D. Kachalov&quot; &lt;<a hr=
ef=3D"mailto:gmouse@google.com" target=3D"_blank" rel=3D"noreferrer">gmouse=
@google.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:gmouse@google.com" ta=
rget=3D"_blank" rel=3D"noreferrer">gmouse@google.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; When running on read-only rootfs backed with =
overlayfs, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0processed scripts<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; are being marked as deleted on upperdir of ov=
erlayfs. When it<br>
&gt;=C2=A0 =C2=A0 =C2=A0comes to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; upgrade the main read-only image, it might co=
ntain new postinst<br>
&gt;=C2=A0 =C2=A0 =C2=A0scripts that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; are different from the already processed. Int=
roduced suffix<br>
&gt;=C2=A0 =C2=A0 =C2=A0(sha256 of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the content) allows to distinct updated scrip=
ts of the same package.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0So your usecase is that you have a read-only rootf=
s with an<br>
&gt;=C2=A0 =C2=A0 =C2=A0overlay on<br>
&gt;=C2=A0 =C2=A0 =C2=A0top, and then just replace the rootfs. And then ex=
pect things to<br>
&gt;=C2=A0 =C2=A0 =C2=A0still<br>
&gt;=C2=A0 =C2=A0 =C2=A0work?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0That doesn&#39;t sound valid to me - normally I&#3=
9;d wipe the overlay clean<br>
&gt;=C2=A0 =C2=A0 =C2=A0when updating the underlying read-only part. I&#39=
;d be very<br>
&gt;=C2=A0 =C2=A0 =C2=A0interested in<br>
&gt;=C2=A0 =C2=A0 =C2=A0what you&#39;re actually trying to accomplish here=
?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0And further, I don&#39;t think appending 64 charac=
ters to filenames is<br>
&gt;=C2=A0 =C2=A0 =C2=A0going<br>
&gt;=C2=A0 =C2=A0 =C2=A0to make anyone happy.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0In your case, I&#39;d opt for a script that just r=
esets the postinst<br>
&gt;=C2=A0 =C2=A0 =C2=A0scripts<br>
&gt;=C2=A0 =C2=A0 =C2=A0(and maybe more?) in the overlay. Or have 3 overla=
ys. Whenever the<br>
&gt;=C2=A0 =C2=A0 =C2=A0package manager runs, activate the second layer. T=
he &quot;user&quot; stuff<br>
&gt;=C2=A0 =C2=A0 =C2=A0in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0third layer is normally active. Then when you upgr=
ade the system,<br>
&gt;=C2=A0 =C2=A0 =C2=A0wipe<br>
&gt;=C2=A0 =C2=A0 =C2=A0the second layer, to get rid of obsolete packages.=
 Or something like<br>
&gt;=C2=A0 =C2=A0 =C2=A0that. Again, tell us what you&#39;re really buildi=
ng...<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Anton D. Kachalov &lt;<a href=
=3D"mailto:gmouse@google.com" target=3D"_blank" rel=3D"noreferrer">gmouse@=
google.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:gmouse@google.com" ta=
rget=3D"_blank" rel=3D"noreferrer">gmouse@google.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0meta/lib/oe/package_manager/deb/r=
ootfs.py=C2=A0 =C2=A0| 11 ++++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0meta/lib/oe/package_manager/ipk/r=
ootfs.py=C2=A0 =C2=A0| 11 ++++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0meta/lib/oe/package_manager/rpm/_=
_init__.py |=C2=A0 4 +++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A03 files changed, 23 insertions(+)=
, 3 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/meta/lib/oe/package_manager/deb/=
rootfs.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/lib/oe/package_manager/deb/rootfs.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 8fbaca11d6..704d213626 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/meta/lib/oe/package_manager/deb/rootfs.=
py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/meta/lib/oe/package_manager/deb/rootfs.=
py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -4,6 +4,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0import shutil<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +from hashlib import sha256<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0from oe.rootfs import Rootfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0from oe.manifest import Manifest<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0from oe.utils import execute_pre_=
post_process<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -115,8 +116,16 @@ class DpkgOpkgRootfs(Roo=
tfs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bb.utils.mkdirhier(dst_postinst_dir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if os.path.exists(os.path.join(src_postinst_dir, p<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &quot;.postinst&quot;)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 csum =3D sha256()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 with open(src_postinst_dir, p + &quot;.postinst&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;rb&quot;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while True:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D f.read(65536)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not data:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum.update(data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0shutil.copy(os.path.join(src_postinst_d=
ir, p + &quot;.postinst&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - os.path.join(dst_postinst_dir, &quot;%03d-%=
s&quot; % (num, p)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + os.path.join(dst_postinst_dir, &quot;%03d-%=
s.%s&quot; % (num, p,<br>
&gt;=C2=A0 =C2=A0 =C2=A0csum.hexdigest())))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0num +=3D 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/meta/lib/oe/package_manager/ipk/=
rootfs.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/lib/oe/package_manager/ipk/rootfs.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 26dbee6f6a..6ead6ddef3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/meta/lib/oe/package_manager/ipk/rootfs.=
py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/meta/lib/oe/package_manager/ipk/rootfs.=
py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -5,6 +5,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0import filecmp<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0import shutil<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +from hashlib import sha256<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0from oe.rootfs import Rootfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0from oe.manifest import Manifest<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0from oe.utils import execute_pre_=
post_process<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -116,8 +117,16 @@ class DpkgOpkgRootfs(Roo=
tfs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bb.utils.mkdirhier(dst_postinst_dir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if os.path.exists(os.path.join(src_postinst_dir, p<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &quot;.postinst&quot;)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 csum =3D sha256()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 with open(src_postinst_dir, p + &quot;.postinst&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;rb&quot;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while True:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D f.read(65536)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not data:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum.update(data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0shutil.copy(os.path.join(src_postinst_d=
ir, p + &quot;.postinst&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - os.path.join(dst_postinst_dir, &quot;%03d-%=
s&quot; % (num, p)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + os.path.join(dst_postinst_dir, &quot;%03d-%=
s.%s&quot; % (num, p,<br>
&gt;=C2=A0 =C2=A0 =C2=A0csum.hexdigest())))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0num +=3D 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/meta/lib/oe/package_manager/rpm/=
__init__.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/lib/oe/package_manager/rpm/__init__.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 6df0092281..4746e96ce8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/meta/lib/oe/package_manager/rpm/__init_=
_.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/meta/lib/oe/package_manager/rpm/__init_=
_.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -4,6 +4,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0import shutil<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0import subprocess<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +from hashlib import sha256<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0from oe.package_manager import *<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0class RpmIndexer(Indexer):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -359,7 +360,8 @@ class RpmPM(PackageManage=
r):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targe=
t_path =3D oe.path.join(self.target_rootfs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.d.expand(&#39;${sysconfdir}/rpm-postinsts/&#3=
9;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.ut=
ils.mkdirhier(target_path)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num =
=3D self._script_num_prefix(target_path)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_script_nam=
e =3D oe.path.join(target_path, &quot;%d-%s&quot; %<br>
&gt;=C2=A0 =C2=A0 =C2=A0(num, pkg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 csum =3D sha256(=
output.encode(&quot;utf-8&quot;)).hexdigest()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_script_nam=
e =3D oe.path.join(target_path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;%d-%s.%s&quot; % (num, pkg, csum))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open(=
saved_script_name, &#39;w&#39;).write(output)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.ch=
mod(saved_script_name, 0o755)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Mike Looijmans<br>
&gt;<br>
<br>
-- <br>
Mike Looijmans<br>
<br>
</blockquote></div></div></div>

--000000000000338b3505be31ee44--
