Return-Path: <leobsd@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id B80086C1CA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 07:40:35 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id q11so8837490lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 23:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=1aaUEC7qcXsHr2pSaJoL77J3/rivdhR8Z376VHXjGfc=;
	b=bb4ySM186npvqwvhvt5pAboe5VkHcTkUcwRo0HY79mUBaZizY4aBX2v7XprP9gysU7
	/Yp+XbXHiqT7d/ByNEExuFbnNbCnhDwPaeciaFZz/G18U/bfg1aJtfCHRZCy7yZbOliZ
	8AELb1conOjBfeCZ9/UaRwQcpfbJJiqOaUUQ1Lm1Gzn7IteCiU8Pd3S4Eun61Js3g6N6
	vU7SNMM5hZQpeiuN4lud48oiwJxE/gnsbLAcVzSzc/+8ciRnCMn+KP0vP868dFT9Allf
	xoZveQUly6VI7xYKbODv//QNDX2Cn4ZXuZJB4f4IbZvts/shqeOt0VWyxJwz18Ar1GJZ
	xJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=1aaUEC7qcXsHr2pSaJoL77J3/rivdhR8Z376VHXjGfc=;
	b=OIO7AB9VqdIPookaA0UNSpMuNwYG1tljRfREiWte9Fe3p9NpJ2UZehhbn/lxosc4E2
	fEK6qOhnWpCMSeJMeDdey3fXUw8G2NPbZnUVvN8prQ1EgCOmA1cgYJ+IYwQTpFkilbNM
	I2lQsKZWrCDTyazYBqxX23I/5TX1b8jOhvokK4qbLqNYXZbWm6lt9rSWhZuhEC0r3ORY
	aEXhVi+89avUEH1WkjTeTLVh2ysGxvkWQkaBMYCW4c+aQ++1L1rI9UDURBrYAQ+4+0iD
	rONvx5KJcNGaLMPUocvyCgwKQ6eQU5sByev21YASWjbxGMNtQdq++gido4Sl2tu+j/gn
	wySQ==
X-Gm-Message-State: AHQUAua2NMpx8jQ00peJtpz5LcEED3se0npi++khUJ5zhRLFs9eVGc+i
	A66T0UgdGDreas8OnNA63IkX3HeLHUqKEzhHx97Cez97DNxtRQ==
X-Google-Smtp-Source: AHgI3IZxoPHM+kVxG5EbM5t5+zbrPy46dgKzD1cB9zwnNIgIJtw5cHl7W0sHXzCDX/2jyNMlKTlZd8EXK4pzs+yIT04=
X-Received: by 2002:ac2:5205:: with SMTP id a5mr7973122lfl.135.1550302835652; 
	Fri, 15 Feb 2019 23:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20190208163512.24889-1-leobsd@gmail.com>
In-Reply-To: <20190208163512.24889-1-leobsd@gmail.com>
From: Leonardo Rangel <leobsd@gmail.com>
Date: Fri, 15 Feb 2019 23:39:58 -0800
Message-ID: <CAN7MDW_Ks88Y5v4=_Qmjs7zgbiVABMpdwLS3r1hTy=Fv8o6cHw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] Fix cp's target path for ext* filesystems
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
X-List-Received-Date: Sat, 16 Feb 2019 07:40:36 -0000
Content-Type: multipart/alternative; boundary="000000000000d03eed0581fe0197"

--000000000000d03eed0581fe0197
Content-Type: text/plain; charset="UTF-8"

Does anybody have other suggestions on this one?

> Python subprocess' shell=True defaults to /bin/sh[1][2], which
> often refers to a POSIX-compliant shell. As the -e flag is
> not defined in the POSIX standard[3], some shells may
> interpret "-e" as the first argument to the echo command,
> causing the rest of the command line to fail.
>
> In this particular case, "echo -e 'cd {}'" is interpreted
> as "-e cd {}", which causes the first line of the command
> to fail, and causing cp to always place the source file
> in the filesystem's root.
>
> Replacing "echo -e" for a printf command makes this
> more portable.
>
> This issue only affects "wic cp" for ext* filesystems.
>
> [1] https://docs.python.org/2/library/subprocess.html
> [2] https://docs.python.org/3/library/subprocess.html
> [3] http://pubs.opengroup.org/onlinepubs/9699919799
>
> Signed-off-by: Leonardo Augusto <leobsd@gmail.com>
> ---
>  scripts/lib/wic/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 4662c665c0..97f5e848cc 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -331,7 +331,7 @@ class Disk:
>      def copy(self, src, pnum, path):
>          """Copy partition image into wic image."""
>          if self.partitions[pnum].fstype.startswith('ext'):
> -            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
> +            cmd = "printf 'cd {}\nwrite {} {}' | {} -w {}".\
>                        format(path, src, os.path.basename(src),
>                               self.debugfs, self._get_part_image(pnum))
>          else: # fat

--000000000000d03eed0581fe0197
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Does anybody have other suggestions on th=
is one?<br><br>&gt; Python subprocess&#39; shell=3DTrue defaults to /bin/sh=
[1][2], which<br>&gt; often refers to a POSIX-compliant shell. As the -e fl=
ag is<br>&gt; not defined in the POSIX standard[3], some shells may <br>&gt=
; interpret &quot;-e&quot; as the first argument to the echo command,<br>&g=
t; causing the rest of the command line to fail.<br>&gt; <br>&gt; In this p=
articular case, &quot;echo -e &#39;cd {}&#39;&quot; is interpreted<br>&gt; =
as &quot;-e cd {}&quot;, which causes the first line of the command<br>&gt;=
 to fail, and causing cp to always place the source file<br>&gt; in the fil=
esystem&#39;s root.<br>&gt; <br>&gt; Replacing &quot;echo -e&quot; for a pr=
intf command makes this<br>&gt; more portable.<br>&gt; <br>&gt; This issue =
only affects &quot;wic cp&quot; for ext* filesystems.<br>&gt; <br>&gt; [1] =
<a href=3D"https://docs.python.org/2/library/subprocess.html">https://docs.=
python.org/2/library/subprocess.html</a><br>&gt; [2] <a href=3D"https://doc=
s.python.org/3/library/subprocess.html">https://docs.python.org/3/library/s=
ubprocess.html</a><br>&gt; [3] <a href=3D"http://pubs.opengroup.org/onlinep=
ubs/9699919799">http://pubs.opengroup.org/onlinepubs/9699919799</a><br>&gt;=
 <br>&gt; Signed-off-by: Leonardo Augusto &lt;<a href=3D"mailto:leobsd@gmai=
l.com">leobsd@gmail.com</a>&gt;<br>&gt; --- <br>&gt;=C2=A0 scripts/lib/wic/=
engine.py | 2 +-<br>&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-=
)<br>&gt; <br>&gt; diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic=
/engine.py<br>&gt; index 4662c665c0..97f5e848cc 100644<br>&gt; --- a/script=
s/lib/wic/engine.py<br>&gt; +++ b/scripts/lib/wic/engine.py<br>&gt; @@ -331=
,7 +331,7 @@ class Disk:<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def copy(sel=
f, src, pnum, path):<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &quot;&quot;&quot;Copy partition image into wic image.&quot;&quot=
;&quot;<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if se=
lf.partitions[pnum].fstype.startswith(&#39;ext&#39;):<br>&gt; -=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D &quot;echo -=
e &#39;cd {}\nwrite {} {}&#39; | {} -w {}&quot;.\<br>&gt; +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D &quot;printf &#=
39;cd {}\nwrite {} {}&#39; | {} -w {}&quot;.\<br>&gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 format(path, src, os.path.basena=
me(src),<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.debugfs, self._get_pa=
rt_image(pnum))<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 else: # fat <br></div></div>

--000000000000d03eed0581fe0197--
