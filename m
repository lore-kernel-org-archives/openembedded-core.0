Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.995.1622568528675945324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 10:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GYTwz1SU;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id r6so6290479ilj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 10:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chnR6zqSu3R+3PfmM48S65ctFqAxNX6yecS8STxtQCM=;
        b=GYTwz1SUWEWiQ9t3nzubUz1k6E5CVy+FQvmuN36EwRIJyraD8MT2zLWR9XXMYff2XH
         /d6gWzR6NhdpTiMwM5wR4eyzttD4iPiHjly/kom3IkfHQnj/pXIgIlpTTH9qKHTcd/yU
         Be2fPUVA6wuft9BtuF6KplPZMNdmVm2vDm/k54/lQNl8G5aCwq4Cb3YeXhDk47+KZp4y
         VqRmvtcsSYBtu89LnAqgH94dijQ45XfkG1Bjux2gNzO8GVc7lNQr4ivd/JjltSDtsNM3
         dJf45230PNLeA43+ADUapFeNiYmAHGAXrwCuYeaE8KbaFmf2jMxOTAAGTfry/pfHT+fd
         xPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chnR6zqSu3R+3PfmM48S65ctFqAxNX6yecS8STxtQCM=;
        b=QFEV28Fyfmia1xsLWVMXDDpa7Kma0ONA6MhEX2SM/SHyEahKP/c9XEYhxz5NX389WL
         SZmJSTV+dUN9YIl6aSbqzoktmIE0aUo/4nw3ac6sBrFMYq2B8ZF7a1HbcRy+ZOVefqKJ
         97VzLxKQUJTMUSg7vKWeG1wUUzloy3MFBOf+0YUBJz1Ogvxd3gAkYnRW+cXiDzBNWuzX
         vXi4FGG57vMUqbKPUp+9S9mCqdyO98GIt2XxJuRFq0wih4Vni4sAlznB+lKuGyjOzSeP
         BRmfSAwdwnMhq57XcMY/GGiiLH46vjNvqiEZe+Df9aUNz3GR87TgrBGXwGP6P+C8yKEa
         bSwQ==
X-Gm-Message-State: AOAM530VZx0dr1p7KKI7W09hY9+pkkOE8EufPcmSZvsenUudaiqdNzyW
	CICqqJuiFpzTbYVNN1q4psaWGQ7Qgnzngs93MSE=
X-Google-Smtp-Source: ABdhPJxNBsjQvzewnjOQNgvKqb9RckmlF8SXI8o+fnP2rB2b4hztaTEDkxNLUSO4p8/BZM7HwVQrifuERTb20HsyYjI=
X-Received: by 2002:a92:d907:: with SMTP id s7mr2398182iln.30.1622568528029;
 Tue, 01 Jun 2021 10:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210601152114.495307-1-tomasz.dziendzielski@gmail.com> <7c7aa3f02fb44e3e4f1758b080e7482e2b12f6b9.camel@linuxfoundation.org>
In-Reply-To: <7c7aa3f02fb44e3e4f1758b080e7482e2b12f6b9.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Tue, 1 Jun 2021 19:32:01 +0200
Message-ID: <CAJkqNs0a+ZTar6ysDLJA7T3CQrgXahUFdpjUO3shvM46jEki5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix corrupted magic number in ipk on populate_sdk task
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Kamil Kwiek <kamil.kwiek@gmail.com>, Jan Brzezanski <jan.brzezanski@gmail.com>, 
	Paulo Neves <ptsneves@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bcafe705c3b7ac31"

--000000000000bcafe705c3b7ac31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Where I found the issue it was Krogoth. You're right, this
"create_packages_dir" is also fixing the issue. It was really hard to
reproduce the error so when creating this patch I just compared the code -
it was almost the same, doing the same with the same variables, but in fact
in the latest poky it's not a common deploy dir anymore. Please disregard
this patch.

Best regards,
Tomasz Dziendzielski

wt., 1 cze 2021 o 17:48 Richard Purdie <richard.purdie@linuxfoundation.org>
napisa=C5=82(a):

> On Tue, 2021-06-01 at 17:21 +0200, Tomasz Dziendzielski wrote:
> > If any do_package_write_ipk runs parallel with populate_sdk task it can
> > happen that opkg script arfile.py tries to get magic number of all
> > packages in DEPLOY_DIR_IPK while some package is being copied there at
> > the same time. This results with:
> > > AssertionError: Old ipk format (non-deb) is unsupported, file:
> > > build/tmp/deploy/ipk/foo/bar_1.0-r0_foo.ipk, magic: b'', expected
> > > !<arch>
> > which isn't really the case here.
> >
> > To fix this I added lockfile in package_write_ipk task and in
> > OpkgIndexer class. Even though package_write_ipk is writing to a
> > common deploy directory we can use shared lock, because we are sure we
> > don't write to same files. On the other hand in OpkgIndex to read magic
> > number I added not-shared lock, because unfortunately we don't have a
> > mechanism to share lockfiles only with specific group of tasks. That's
> > not a problem though, since indexer runs fast and usually there are not
> > many recipes using populate_sdk class.
> >
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
> > Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
> > Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> > ---
> >  meta/classes/package_ipk.bbclass            | 10 ++++++++++
> >  meta/lib/oe/package_manager/ipk/__init__.py |  3 +++
> >  2 files changed, 13 insertions(+)
>
> I would much prefer we didn't do this, we've had such lockfiles before an=
d
> they
> are a bottleneck when for example expanding a new build directory from
> sstate.
>
> The rpm code creates a symlink tree copy of the packages it has the right
> to access
> and then only index those. I did a quick grep and I thought this was bein=
g
> used
> for ipk and deb too:
>
> deb/__init__.py:        create_packages_dir(self.d, self.deploy_dir,
> d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
> __init__.py:def create_packages_dir(d, subrepo_dir, deploydir, taskname,
> filterbydependencies):
> ipk/__init__.py:            create_packages_dir(self.d, self.deploy_dir,
> d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
> rpm/__init__.py:            create_packages_dir(self.d,
> oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"),
> "package_write_rpm", filterbydependencies)
>
> Which release did you see the issue on and is there some codepath which
> isn't using these tree copies?
>
> One reason for the above is also to stop an image seeing packages it
> doesn't
> depend upon which is important when package globbing is used to install
> packages.
>
> Cheers,
>
> Richard
>
>
>

--000000000000bcafe705c3b7ac31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Where I found the issue it was Krogoth. You&#39;re ri=
ght, this &quot;create_packages_dir&quot; is also fixing the issue. It was =
really hard to reproduce the error so when creating this patch I just compa=
red the code - it was almost the same, doing the same with the same variabl=
es, but in fact in the latest poky it&#39;s not a common deploy dir anymore=
. Please disregard this patch.</div><div><br></div><div>Best regards,</div>=
<div>Tomasz Dziendzielski<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">wt., 1 cze 2021 o 17:48=C2=A0Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@lin=
uxfoundation.org</a>&gt; napisa=C5=82(a):<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Tue, 2021-06-01 at 17:21 +0200, Tomasz Dziendz=
ielski wrote:<br>
&gt; If any do_package_write_ipk runs parallel with populate_sdk task it ca=
n<br>
&gt; happen that opkg script arfile.py tries to get magic number of all<br>
&gt; packages in DEPLOY_DIR_IPK while some package is being copied there at=
<br>
&gt; the same time. This results with:<br>
&gt; &gt; AssertionError: Old ipk format (non-deb) is unsupported, file:<br=
>
&gt; &gt; build/tmp/deploy/ipk/foo/bar_1.0-r0_foo.ipk, magic: b&#39;&#39;, =
expected<br>
&gt; &gt; !&lt;arch&gt;<br>
&gt; which isn&#39;t really the case here.<br>
&gt; <br>
&gt; To fix this I added lockfile in package_write_ipk task and in<br>
&gt; OpkgIndexer class. Even though package_write_ipk is writing to a<br>
&gt; common deploy directory we can use shared lock, because we are sure we=
<br>
&gt; don&#39;t write to same files. On the other hand in OpkgIndex to read =
magic<br>
&gt; number I added not-shared lock, because unfortunately we don&#39;t hav=
e a<br>
&gt; mechanism to share lockfiles only with specific group of tasks. That&#=
39;s<br>
&gt; not a problem though, since indexer runs fast and usually there are no=
t<br>
&gt; many recipes using populate_sdk class.<br>
&gt; <br>
&gt; Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dzien=
dzielski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt=
;<br>
&gt; Signed-off-by: Kamil Kwiek &lt;<a href=3D"mailto:kamil.kwiek@gmail.com=
" target=3D"_blank">kamil.kwiek@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Jan Brzezanski &lt;<a href=3D"mailto:jan.brzezanski@gma=
il.com" target=3D"_blank">jan.brzezanski@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" t=
arget=3D"_blank">ptsneves@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/package_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 10 ++++++++++<br>
&gt; =C2=A0meta/lib/oe/package_manager/ipk/__init__.py |=C2=A0 3 +++<br>
&gt; =C2=A02 files changed, 13 insertions(+)<br>
<br>
I would much prefer we didn&#39;t do this, we&#39;ve had such lockfiles bef=
ore and they<br>
are a bottleneck when for example expanding a new build directory from ssta=
te.<br>
<br>
The rpm code creates a symlink tree copy of the packages it has the right t=
o access<br>
and then only index those. I did a quick grep and I thought this was being =
used<br>
for ipk and deb too:<br>
<br>
deb/__init__.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_packages_dir(self.d, sel=
f.deploy_dir, d.getVar(&quot;DEPLOY_DIR_DEB&quot;), &quot;package_write_deb=
&quot;, filterbydependencies)<br>
__init__.py:def create_packages_dir(d, subrepo_dir, deploydir, taskname, fi=
lterbydependencies):<br>
ipk/__init__.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create_packages_d=
ir(self.d, self.deploy_dir, d.getVar(&quot;DEPLOY_DIR_IPK&quot;), &quot;pac=
kage_write_ipk&quot;, filterbydependencies)<br>
rpm/__init__.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create_packages_d=
ir(self.d, oe.path.join(self.rpm_repo_dir, &quot;rpm&quot;), d.getVar(&quot=
;DEPLOY_DIR_RPM&quot;), &quot;package_write_rpm&quot;, filterbydependencies=
)<br>
<br>
Which release did you see the issue on and is there some codepath which<br>
isn&#39;t using these tree copies?<br>
<br>
One reason for the above is also to stop an image seeing packages it doesn&=
#39;t<br>
depend upon which is important when package globbing is used to install<br>
packages.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--000000000000bcafe705c3b7ac31--
