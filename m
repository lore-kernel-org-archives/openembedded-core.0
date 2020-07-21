Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.8377.1595375407780150317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 16:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FPIbH0Os;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id d16so278629edz.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 16:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HNV/EX2NHfwBmk0433+vRuyNgpeltJxmC7thoeitzXs=;
        b=FPIbH0Osppes0DTeedPwL4uoakhujrV9JxuDcTBJ1IAVQEp7HeYuszWoYPfTChezLq
         GuN7aLrc7BY34ObXnVjUOyUMp0/YFsQZ15avQtgRtng7AtvIJRiI3YWqnIiYZiBQQUY8
         7v/g9DQaHAsBSUrTZat8j5QMZ5cbFV/cPui6I9247iYAIqg6Eyv1OZu2LZn0g3q0MN/g
         RUaHCjFr8WYKqTiXF1Gtyfl1DzzgGHktfT/xBq6cXONvI4MW2/JuwfXTBhQ5GfP9B1kR
         0BbZGwJEMAHy03/DZjVHX0gRaznLn589dp3ZzBl+JGgGgAwKm8fvHGqk+S5bc9d4WySX
         11tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HNV/EX2NHfwBmk0433+vRuyNgpeltJxmC7thoeitzXs=;
        b=cNOxjcypfut6g91B5PXcHtN3/zdC9NNHtjcdUfLpWWoELfDDPFOFNUbvXv0N1Wq84l
         xo0pkrNulQ4mmv7W+RWxzm3FtLQTEFVByuTz/IxuM/MYiAw+IbiF9RXkCRn/fAlmyuFg
         XrQoWLrfhD4y61gmKRt8/rdBDwTVSeWbuH6cqY2Ho/2zRa5j+lQ+Sr1Vv3DHrdFIFa9e
         6SpwPQ1yqSjiTkHH3TuU8zkJ1SUpdlTws6+Hwjqa4dzCH5iQnyy3pwf69+lyj5kOwK9W
         hDZm1Kkrg3Q3K9v37cVUJAKGwwSX/S7VlYOKXD/4nUyGDGwwAWfTlriO2YOZ74Blwduq
         rfiw==
X-Gm-Message-State: AOAM531hA9o2Yav9nuCA3nMZ03jMPc6xh0Dwb3i1ykPN8AFzRDfWpHi7
	cI58J7qkFnG+kOheWRpsbI/W71l1pWrFa2wUALQ=
X-Google-Smtp-Source: ABdhPJw9zGRqmc3BnaEG2iZHM43JG9432Th7Us44nAB9pvUxqf3co9PGuHqVu98Etj8u14pZPxJZyM+BPloXIJ2nGg8=
X-Received: by 2002:a05:6402:1a3c:: with SMTP id be28mr29060324edb.140.1595375406344;
 Tue, 21 Jul 2020 16:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200721215640.136052-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200721215640.136052-1-richard.purdie@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Tue, 21 Jul 2020 18:49:31 -0500
Message-ID: <CAJdd5GY5jBuoE5zAHqYMnkX7ZAz5mU41p2dpxWqhEQNymyr0Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemurunner: Use tempfile.mkstemp to create pidfile name
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000060ecae05aafc4827"

--00000000000060ecae05aafc4827
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 21, 2020, 4:56 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We continue to see qemu races where qemu fails to write out a pidfile. The
> pidfile name being used was based on the parent process starting the qemus
> so in theory, a qemu shutting down could have deleted the file into which
> the new qemu's pid was about to be written. This shouldn't happen as qemu
> processes should be exitting completely before the code returns.
>
> In the absence of better theory for the failure, use a random pid filename
> rather than the parent pid so there is no overlap in the pid filename,
> thereby removing any theoretical race.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oeqa/utils/qemurunner.py
> b/meta/lib/oeqa/utils/qemurunner.py
> index 519aa9aa1e5..73a3efdc964 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -20,6 +20,7 @@ import string
>  import threading
>  import codecs
>  import logging
> +import tempfile
>  from oeqa.utils.dump import HostDumper
>  from collections import defaultdict
>
> @@ -65,7 +66,11 @@ class QemuRunner:
>          self.runqemutime = 120
>          if not workdir:
>              workdir = os.getcwd()
> -        self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
> +        # Use tempfile to obtain a unique name. We own the directory
> +        # so closing the file isn't an issue as long as we don't delete it
> +        self.qemu_pidfile = tempfile.mkstemp(dir=workdir,
> prefix="qemupid_")
> +        os.close(self.qemu_pidfile[0])
> +        self.qemu_pidfile = self.qemu_pidfile[1]
>

Minor, but more idiomatic python:

 (fd, self.qemu_pidfile) = tempfile.mkstemp(...)
 os.close(fd)


         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
>          self.monitorpipe = None
>
> @@ -182,8 +187,6 @@ class QemuRunner:
>
>          # Ask QEMU to store the QEMU process PID in file, this way we
> don't have to parse running processes
>          # and analyze descendents in order to determine it.
> -        if os.path.exists(self.qemu_pidfile):
> -            os.remove(self.qemu_pidfile)
>          self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile
> {1}"'.format(bootparams, self.qemu_pidfile)
>          if qemuparams:
>              self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + "
> " + '\"'
> --
> 2.25.1
>
> 
>

--00000000000060ecae05aafc4827
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 21, 2020, 4:56 PM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We continue=
 to see qemu races where qemu fails to write out a pidfile. The<br>
pidfile name being used was based on the parent process starting the qemus=
<br>
so in theory, a qemu shutting down could have deleted the file into which<=
br>
the new qemu&#39;s pid was about to be written. This shouldn&#39;t happen =
as qemu<br>
processes should be exitting completely before the code returns.<br>
<br>
In the absence of better theory for the failure, use a random pid filename=
<br>
rather than the parent pid so there is no overlap in the pid filename,<br>
thereby removing any theoretical race.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoun=
dation.org</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/utils/qemurunner.py | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemur=
unner.py<br>
index 519aa9aa1e5..73a3efdc964 100644<br>
--- a/meta/lib/oeqa/utils/qemurunner.py<br>
+++ b/meta/lib/oeqa/utils/qemurunner.py<br>
@@ -20,6 +20,7 @@ import string<br>
=C2=A0import threading<br>
=C2=A0import codecs<br>
=C2=A0import logging<br>
+import tempfile<br>
=C2=A0from oeqa.utils.dump import HostDumper<br>
=C2=A0from collections import defaultdict<br>
<br>
@@ -65,7 +66,11 @@ class QemuRunner:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.runqemutime =3D 120<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not workdir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D os.getcwd()<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_pidfile =3D workdir + &#39;/pidfile=
_&#39; + str(os.getpid())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use tempfile to obtain a unique name. We ow=
n the directory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so closing the file isn&#39;t an issue as l=
ong as we don&#39;t delete it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_pidfile =3D tempfile.mkstemp(dir=3D=
workdir, prefix=3D&quot;qemupid_&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.close(self.qemu_pidfile[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_pidfile =3D self.qemu_pidfile[1]<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Min=
or, but more idiomatic python:</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">=C2=A0(fd, self.qemu_pidfile) =3D tempfile.mkstemp(...)</div><div di=
r=3D"auto">=C2=A0os.close(fd)</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.host_dumper =3D HostDumper(dump_hos=
t_cmds, dump_dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.monitorpipe =3D None<br>
<br>
@@ -182,8 +187,6 @@ class QemuRunner:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Ask QEMU to store the QEMU process PID=
 in file, this way we don&#39;t have to parse running processes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# and analyze descendents in order to de=
termine it.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(self.qemu_pidfile):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(self.qemu_pidfile)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemuparams =3D &#39;bootparams=3D&q=
uot;{0}&quot; qemuparams=3D&quot;-pidfile {1}&quot;&#39;.format(bootparams,=
 self.qemu_pidfile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if qemuparams:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemuparams =3D self.q=
emuparams[:-1] + &quot; &quot; + qemuparams + &quot; &quot; + &#39;\&quot;&=
#39;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000060ecae05aafc4827--
