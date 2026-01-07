Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13785CD585A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 11:32:05 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3811.1767785524285153436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 03:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ionimzaZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-598f59996aaso2209164e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 03:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767785522; x=1768390322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo8VIPfz8ooGxU7GEBOOBG3GMOBqdiKgz5eXT8SGOk8=;
        b=ionimzaZQ4ouzXpAm9P3KTFrqvdAUOo4I/B+r6l7vsbqgBB7QE8dWPGSod33O9/+Sy
         xMwIo0H5R4rSPUBVMn4ZM3VNsB1/jhOi8rZ/bFbaDgiGuL2i7Fug+/a6We64yD1dR/Dt
         5lLSC/edx6IHXXS9wYy8E1S/ixDPXtMlz8deSX932bNc/DEj8fNvUgObl15vsIzt2Vi2
         ynzmou6OexPRibRBfIB1siG8w7fC+QUWY6X8+UgIlGM0f/zRqyKNZf41QWNLgvHBE1Zx
         f94b3XtVu/MdnsdI+eR5KAzStoQyNQqbOUJZzxFCL/lVsUA6DWZq5b+oNOlG/W58wRfF
         GDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785522; x=1768390322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo8VIPfz8ooGxU7GEBOOBG3GMOBqdiKgz5eXT8SGOk8=;
        b=F+ImXJWUOZOla8BuzF6xiOItaBBNb3q8h/G2dCkVXbzTrXkgZ4aMYSIM/YLEpYqCTq
         KvVm8mKU4zvQuLwVHvtG0dKTBTohKIu91M7UaNQPpXtKHdtZVKFXKVvg9yH4+s+3dbaX
         z5HjFxZtrpOUJ2jMrq6wMUccoDMA0jL0h2bAaCrW5BPsfw5BprUvleOIV0fKZqwMwqBb
         sKMhvoXW/f4flR7H18SmGQVGn2IX6S8eSjrnVPo3IC1SfRA2EfcrMT0pN1JzXPHT2kAz
         iqHmiuGhizVblesnYSUKnrcEwWIxDEiIAGxvbR2j/bJ8SHi/0dV1ovUzvaMrsO4u5y3q
         yhfQ==
X-Gm-Message-State: AOJu0Ywe4UgosWv36ig1qbYG9rkJIC5XpeLIUTe2+d+IoKun/RTcMMxw
	XLygLxPmFYaMBdJy1Qt3i6RuTm2DHqrsLfFFkYomLeq5wd/XFmLUbqXeZv3Csxbsh6J5+8gFUHY
	MiIVNiKgLzttggDIM+oh7DZOLwI02t4Y=
X-Gm-Gg: AY/fxX6mD2eUycfIWHIofLkXbk9y8L8/fXmT1L3Ge3XxYzQqlGTo6P8aNZjsuAfu/ZA
	VF2MUYNtmPic75uQnU/IcIW1QIDkBHVE5DlHQUoaP+sJ6rjC+FKJx/plXzBnNN2EBAu2BmSvpT9
	NdNZnWiNr/hl+B2EWFxXdDotrVr+5GoAPxF5XvVoEA9PzDbbAEFgka5/iFcyxFcG36MMNZGhu6f
	9iAMnxJtiicfJA/Lom2cqFV4A/uCw0pb+6rpW1dZ0YZZ1nwMDWeg+qxKRJLduZvEl+ZWX+fbHbD
	R5YHoJDl+OiBSDU7a5bAdn9xgNA=
X-Google-Smtp-Source: AGHT+IFsIA2anpbGtT7HNctiWVcLjCXed6pld7b7l9m4XgHSuu0rd+ZJ0yxTfDxmfVphkjNPHj3Yt+7RaSX1JcyYj4o=
X-Received: by 2002:a05:6512:138c:b0:59b:1d24:7dcd with SMTP id
 2adb3069b0e04-59b6f01fdb2mr772260e87.12.1767785522029; Wed, 07 Jan 2026
 03:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20260106233539.1886869-2-t.f.g.geelen@gmail.com> <CANNYZj86TB69QaoCsZqdZw578wy0zr7DCoH+71KRXSR_Co5uEw@mail.gmail.com>
In-Reply-To: <CANNYZj86TB69QaoCsZqdZw578wy0zr7DCoH+71KRXSR_Co5uEw@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Wed, 7 Jan 2026 12:31:50 +0100
X-Gm-Features: AQt7F2pLNfTdHe5WhspP4khQvVoOKVBtO05U1oWJMjj3DDcDbeW3Z79J7RmGBDw
Message-ID: <CAJo0Az6ty6tdR=32t=Uy6KWpcWDCCHJsQ0vd632q0s9MEysqKA@mail.gmail.com>
Subject: Re: [PATCH] Devtool: Make qmp detection for qemurunner more robust.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001465790647caa4b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 11:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228991

--0000000000001465790647caa4b1
Content-Type: text/plain; charset="UTF-8"

Okay, no problem. I'll think of an alternative. I was under the impression
that the directory structure onder work was fixed enough for this solution
as the only 'guesing' it does is the folder directly under work (arch).


The launch method does not have anything useful to tackle this, so I'll
start to see if I can inject something from the calling function.

I'll send an update soon

Tom

Op wo 7 jan 2026, 12:05 schreef Alexander Kanavin <alex.kanavin@gmail.com>:

> On Wed, 7 Jan 2026 at 00:36, Tom Geelen <t.f.g.geelen@gmail.com> wrote:
> >      def launch(self, launch_cmd, get_ip = True, qemuparams = None,
> extra_bootparams = None, env = None):
> > -        # use logfile to determine the recipe-sysroot-native path and
> > -        # then add in the site-packages path components and add that
> > -        # to the python sys.path so the qmp module can be found.
> > -        python_path = os.path.dirname(os.path.dirname(self.logfile))
> > -        python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
> > -        sys.path.append(python_path)
> > +        # Discover qmp module location robustly.
> > +        # 1) Try path derived from logfile (historical behavior)
> > +        # 2) Fallback: search
> TMPDIR/work/*/<rootfs>/recipe-sysroot-4native for qemu-python or
> site-packages
> > +        candidates = []
> > +        base_from_log = os.path.dirname(os.path.dirname(self.logfile))
> > +        candidates.append(os.path.join(base_from_log,
> "recipe-sysroot-native", "usr", "lib", "qemu-python"))
> > +
> > +        # We can deduce the location for qmp also from the image which
> is being called as we know:
> > +        # - this will have qmp in recipe-sysroot-native
> > +        # - this will need to be called as this will derive TESTIMAGE
> > +        for p in glob.glob(os.path.join(self.tmpdir, "work", "*",
> os.path.basename(self.rootfs).split('.')[0], "*", "recipe-sysroot-native",
> "usr", "lib", "qemu-python")):
> > +            candidates.append(p)
> > +        # Print all candidates to the debugger
> > +        for candidate in candidates:
> > +            self.logger.debug("qmp candidates : %s", candidate)
>
> Apologies, but I can't agree to this. It's a lot of guessing against
> hardcoded path elements, which can go wrong in various ways. The
> correct fix is to pass in the correct native sysroot path explicitly
> from further up, how to start with doing that was previously
> discussed:
>
> https://lists.yoctoproject.org/g/yocto-patches/message/2762
>
> This bit:
>
> "I'd say in this situation AUH is right, and the code in point 1 is
> wrong. It needs to figure out the path to qmp module directly from
> WORKDIR, but I don't know yet which of the many parameters to
> QemuRunner's constructor and launch() method can be used. Can you look
> into it? You can tweak the code to print them all, and see if
> something suitable is in there."
>
> Alex
>

--0000000000001465790647caa4b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Okay, no problem. I&#39;ll think of an alternative. =
I was under the impression that the directory structure onder work was fixe=
d enough for this solution as the only &#39;guesing&#39; it does is the fol=
der directly under work (arch).<div dir=3D"auto"><br></div><div dir=3D"auto=
"><br><div dir=3D"auto">The launch method does not have anything useful to =
tackle this, so I&#39;ll start to see if I can inject something from the ca=
lling function.</div></div><div dir=3D"auto"><br></div>I&#39;ll send an upd=
ate soon</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tom<br><br><div=
 class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr">Op wo 7 jan 2026, 12:05 schreef Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Wed, 7 Jan 2026 at 00:36, Tom Gee=
len &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" target=3D"_blank" rel=3D"=
noreferrer">t.f.g.geelen@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def launch(self, launch_cmd, get_ip =3D True, qemu=
params =3D None, extra_bootparams =3D None, env =3D None):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # use logfile to determine the recipe-sys=
root-native path and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # then add in the site-packages path comp=
onents and add that<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to the python sys.path so the qmp modul=
e can be found.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_path =3D os.path.dirname(os.path.d=
irname(self.logfile))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_path +=3D &quot;/recipe-sysroot-na=
tive/usr/lib/qemu-python&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.path.append(python_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Discover qmp module location robustly.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 1) Try path derived from logfile (histo=
rical behavior)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 2) Fallback: search TMPDIR/work/*/&lt;r=
ootfs&gt;/recipe-sysroot-4native for qemu-python or site-packages<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 candidates =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base_from_log =3D os.path.dirname(os.path=
.dirname(self.logfile))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 candidates.append(os.path.join(base_from_=
log, &quot;recipe-sysroot-native&quot;, &quot;usr&quot;, &quot;lib&quot;, &=
quot;qemu-python&quot;))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can deduce the location for qmp also=
 from the image which is being called as we know:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # - this will have qmp in recipe-sysroot-=
native<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # - this will need to be called as this w=
ill derive TESTIMAGE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in glob.glob(os.path.join(self.tmpd=
ir, &quot;work&quot;, &quot;*&quot;, os.path.basename(self.rootfs).split(&#=
39;.&#39;)[0], &quot;*&quot;, &quot;recipe-sysroot-native&quot;, &quot;usr&=
quot;, &quot;lib&quot;, &quot;qemu-python&quot;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 candidates.append(p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Print all candidates to the debugger<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for candidate in candidates:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.debug(&quot;qmp=
 candidates : %s&quot;, candidate)<br>
<br>
Apologies, but I can&#39;t agree to this. It&#39;s a lot of guessing agains=
t<br>
hardcoded path elements, which can go wrong in various ways. The<br>
correct fix is to pass in the correct native sysroot path explicitly<br>
from further up, how to start with doing that was previously<br>
discussed:<br>
<br>
<a href=3D"https://lists.yoctoproject.org/g/yocto-patches/message/2762" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/g/yocto-patches/message/2762</a><br>
<br>
This bit:<br>
<br>
&quot;I&#39;d say in this situation AUH is right, and the code in point 1 i=
s<br>
wrong. It needs to figure out the path to qmp module directly from<br>
WORKDIR, but I don&#39;t know yet which of the many parameters to<br>
QemuRunner&#39;s constructor and launch() method can be used. Can you look<=
br>
into it? You can tweak the code to print them all, and see if<br>
something suitable is in there.&quot;<br>
<br>
Alex<br>
</blockquote></div></div></div>

--0000000000001465790647caa4b1--

