Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B60D743E9
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 22:04:42 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.203.1732140278834282429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 14:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kaMW2YtN;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb518014b9so2175841fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 14:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732140277; x=1732745077; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/c5QP40y+V5lbkASqXQ5lYvzIjlU2W+BNb900buF0PY=;
        b=kaMW2YtNnw1cVuvZLVNtqEUoHSlQfeCIZ51kOu0BKzKlRTDWJiPgudTwJtKKNRVPxe
         RCJQeNWi0j9QvmKTOQzMUa6bV9MhIqQJe9gZ8uoKf36iEwcEsIN8vPwP+aYOTKkIbmbX
         VrdxUDiizUzf910hHXZCPqBtdqv9lBiBE5h1NwlaORpeBOoKzkh0aM9ZMQYStAXZjc3+
         GgBVuxxvrVdLJh7beGaVUwW+KvmwxFB64W7DQWxnKX2CdbQBTygAqtQZp9AqqanBSObh
         xxaF+WhIhQrv5sx7ILjyLjDWwHVrvPAPlNAkniX0n9ceT6yi9MrThNcLLDG5/WWRJte1
         Zxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732140277; x=1732745077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c5QP40y+V5lbkASqXQ5lYvzIjlU2W+BNb900buF0PY=;
        b=tkF6Ad1A7BIbStuaeG2hskVfU3+bCVMANiZ9o1432I4r2yKkZDSW4MLbGQDqExejko
         XSlQxdJ/P892cxnsind2XKeE0r3QF6kCfKrR5ZLFERn6erJdzPx97LDhUtA3mcqmA0MY
         fOvz45GhldUYE2TLEqNLs/7OUtLIc0JLf9KOh4DL0dgoIOKEa7RxL2LhqiSi47i0DdYe
         StpcZWTpEg06NWHx/mxZV8qVOrI8E+8iddHMskgUJVBenCyubAt+YRlBmKwF+rlQAYWR
         Qn/YOJlMeuyLgvgQgSk+hFNeBB3xtzOrP4lChHFbYtqpRVWp8UCopHB8dHGqbGucp29w
         faQA==
X-Forwarded-Encrypted: i=1; AJvYcCVPFLLyY5bKK3YnT4yTvJDJWdIDVxL20sl6YIzmwlHw79JBHho4RAerwOUDmHg2GV1IweHYmK71ca8HKziQ+3aL4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHCnCfmNPzOu9EpGxvgOFPdB8+CNUcaCgCS5g66Z1ej3s5DhOp
	pUi6pMq8YfVaqH4m/oyZrjpkXVbsqGlnDGPOrFZJ/wq92aI0XmMjC/2WVF+htCedWgUe2FiNmNZ
	F3O2bcsqMscgjA1JPzUjBw0tghxI=
X-Gm-Gg: ASbGncvVlfl1TqUb2kIbHd4iHY0PmnFdLIRjc6Td6ie+Vbp59ZEO1/vro4BGFLKZdcX
	fj43q2OtCAfdOGzdottRYVRsGtrN4yw==
X-Google-Smtp-Source: AGHT+IEPmOxKPZXWTMC0N5tagW1xHYBPMsv0jOlNLRHQpqHGEc07wjHqfYKKowb+a15U8PmCR2w9N7mU9YgDEpFQ0ak=
X-Received: by 2002:a05:651c:2121:b0:2ef:21b3:cdef with SMTP id
 38308e7fff4ca-2ff8dc74a23mr23037721fa.25.1732140276485; Wed, 20 Nov 2024
 14:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20241120195124.1041875-1-ross.burton@arm.com> <9422e448-bb98-4989-a24a-3c203aa26908@baylibre.com>
In-Reply-To: <9422e448-bb98-4989-a24a-3c203aa26908@baylibre.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 20 Nov 2024 14:04:25 -0800
Message-ID: <CANx9H-AO-8C6R1dQuK2E=yxHZv-1jfBSaRXZsQryOvdKQJqAqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] classes-recipe/python_pep517: remove all
 RECORDS files
To: tgamblin@baylibre.com
Cc: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e1987506275f5544"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207489

--000000000000e1987506275f5544
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 1:51=E2=80=AFPM Trevor Gamblin via lists.openembedd=
ed.org
<tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:

>
> On 2024-11-20 14:51, Ross Burton via lists.openembedded.org wrote:
> > Python modules install metadata into a .dist-info directory, one of whi=
ch
> > is RECORD, which contains the files that were installed and their
> > checksum[1].  This is typically used by pip to validate the install, or
> > to know what files to remove when the module is uninstalled.
> >
> > This is slightly problematic when we need to do patching of installed
> > .py files in do_install(), as the RECORD file has already been written
> > at that point.
> >
> > However, the RECORD files only really have a use outside of a system-
> > managed environment, which our python packages are.  We already have
> > commands to verify and remove modules (opkg, dpkg, rpm) and the RECORD
> > file existing simply allows people to 'sudo pip' and alter the package-
> > managed directories outside of the package manager.
> >
> > This is not a good idea, and some other distros remove the RECORD file
> > to stop this possibility:
> > - Debian[2]
> > - Fedora[3]
> > - Gentoo[4]
> >
> > We can follow for all packages which inherit python_pep517, which is th=
e
> > majority of the Python packages now.
> >
> > [1] https://peps.python.org/pep-0491/#the-dist-info-directory
> > [2]
> https://salsa.debian.org/python-team/tools/dh-python/-/blob/master/dhpyth=
on/fs.py?ref_type=3Dheads#L185
> > [3]
> https://src.fedoraproject.org/rpms/pyproject-rpm-macros/blob/rawhide/f/ma=
cros.pyproject#_105
> > [4]
> https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D73c49f3c00415dee99=
407dabba8d3b22895c9d25
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> As discussed in IRC, LGTM.

Reviewed-by: Tim Orling <tim.orling@konsulko.com>
Let us keep sane by following the upstream distributions lead. Thank you
Ross!

>
> > ---
> >   meta/classes-recipe/python_pep517.bbclass | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes-recipe/python_pep517.bbclass
> b/meta/classes-recipe/python_pep517.bbclass
> > index c30674c8ec8..e8cd1923ef2 100644
> > --- a/meta/classes-recipe/python_pep517.bbclass
> > +++ b/meta/classes-recipe/python_pep517.bbclass
> > @@ -50,6 +50,8 @@ python_pep517_do_install () {
> >       fi
> >
> >       nativepython3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE}
> --interpreter "${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --destdir=3D${=
D}
> ${PEP517_WHEEL_PATH}/*.whl
> > +
> > +    find ${D} -path *.dist-info/RECORD -delete
> >   }
> >
> >   # A manual do_install that just uses unzip for bootstrapping purposes=
.
> Callers should DEPEND on unzip-native.
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207488):
> https://lists.openembedded.org/g/openembedded-core/message/207488
> Mute This Topic: https://lists.openembedded.org/mt/109691086/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e1987506275f5544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 20, 2024 at 1:51=E2=80=AFPM Trevor Gamblin via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;tg=
amblin=3D<a href=3D"mailto:baylibre.com@lists.openembedded.org">baylibre.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
On 2024-11-20 14:51, Ross Burton via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<=
br>
&gt; Python modules install metadata into a .dist-info directory, one of wh=
ich<br>
&gt; is RECORD, which contains the files that were installed and their<br>
&gt; checksum[1].=C2=A0 This is typically used by pip to validate the insta=
ll, or<br>
&gt; to know what files to remove when the module is uninstalled.<br>
&gt;<br>
&gt; This is slightly problematic when we need to do patching of installed<=
br>
&gt; .py files in do_install(), as the RECORD file has already been written=
<br>
&gt; at that point.<br>
&gt;<br>
&gt; However, the RECORD files only really have a use outside of a system-<=
br>
&gt; managed environment, which our python packages are.=C2=A0 We already h=
ave<br>
&gt; commands to verify and remove modules (opkg, dpkg, rpm) and the RECORD=
<br>
&gt; file existing simply allows people to &#39;sudo pip&#39; and alter the=
 package-<br>
&gt; managed directories outside of the package manager.<br>
&gt;<br>
&gt; This is not a good idea, and some other distros remove the RECORD file=
<br>
&gt; to stop this possibility:<br>
&gt; - Debian[2]<br>
&gt; - Fedora[3]<br>
&gt; - Gentoo[4]<br>
&gt;<br>
&gt; We can follow for all packages which inherit python_pep517, which is t=
he<br>
&gt; majority of the Python packages now.<br>
&gt;<br>
&gt; [1] <a href=3D"https://peps.python.org/pep-0491/#the-dist-info-directo=
ry" rel=3D"noreferrer" target=3D"_blank">https://peps.python.org/pep-0491/#=
the-dist-info-directory</a><br>
&gt; [2] <a href=3D"https://salsa.debian.org/python-team/tools/dh-python/-/=
blob/master/dhpython/fs.py?ref_type=3Dheads#L185" rel=3D"noreferrer" target=
=3D"_blank">https://salsa.debian.org/python-team/tools/dh-python/-/blob/mas=
ter/dhpython/fs.py?ref_type=3Dheads#L185</a><br>
&gt; [3] <a href=3D"https://src.fedoraproject.org/rpms/pyproject-rpm-macros=
/blob/rawhide/f/macros.pyproject#_105" rel=3D"noreferrer" target=3D"_blank"=
>https://src.fedoraproject.org/rpms/pyproject-rpm-macros/blob/rawhide/f/mac=
ros.pyproject#_105</a><br>
&gt; [4] <a href=3D"https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D=
73c49f3c00415dee99407dabba8d3b22895c9d25" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D73c49f3c00415dee=
99407dabba8d3b22895c9d25</a><br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
As discussed in IRC, LGTM.</blockquote><div dir=3D"auto">Reviewed-by: Tim O=
rling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@konsulko.co=
m</a>&gt;</div><div dir=3D"auto">Let us keep sane by following the upstream=
 distributions lead. Thank you Ross!</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes-recipe/python_pep517.bbclass | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-=
recipe/python_pep517.bbclass<br>
&gt; index c30674c8ec8..e8cd1923ef2 100644<br>
&gt; --- a/meta/classes-recipe/python_pep517.bbclass<br>
&gt; +++ b/meta/classes-recipe/python_pep517.bbclass<br>
&gt; @@ -50,6 +50,8 @@ python_pep517_do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nativepython3 -m installer ${INSTALL_WHEEL_C=
OMPILE_BYTECODE} --interpreter &quot;${USRBINPATH}/env ${PEP517_INSTALL_PYT=
HON}&quot; --destdir=3D${D} ${PEP517_WHEEL_PATH}/*.whl<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 find ${D} -path *.dist-info/RECORD -delete<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# A manual do_install that just uses unzip for bootstrappi=
ng purposes. Callers should DEPEND on unzip-native.<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207488): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207488" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207488</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109691086/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/109691086/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e1987506275f5544--

