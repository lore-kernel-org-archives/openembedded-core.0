Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 32FF66D52E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 21:21:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l5so3389487wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 13:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yEVG/PsechFf4dnlg45au+Wl2Ucv3KYekk6KmOGLIjI=;
	b=PBuNe2spe2Eqmd0d1LDmk8Y3+t3jcvdUSKeIC8oGUQIGwznEZCqbzdPg0ILQHmdrxi
	Mf3J5p1b/1Eyk2dlVAQ1RRt/PxPUQnrK6NUyGpULs8YMOCIje1MQBhxvJNnVXOFUoEJ/
	2g94ZX0yJ/5tnUE/WCSILd1liCT5PHnQTnfZH++zB1qOGI32HBnpt4LBm9dFAcRhoXtq
	5vHhH9PsWMLIh6VE+mTyi+czvg+YIL9zMTuNaomWQU6qKkG0FFp1sBDUnMt0dEfM2vnJ
	2CYOLiU60h2ACpS83nOMaLQTBQPWhpIsAw2w+6wUGW5pTent1ZCchPywvDwT9GI1SRS/
	4tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yEVG/PsechFf4dnlg45au+Wl2Ucv3KYekk6KmOGLIjI=;
	b=Uw5+oq5aEcx9EME7L9/KDwRrPvoJd+WsnA4/F0SFIdfU5Y5uwyG8LMPvxa+w2qTEbh
	bgwz78FiNFY/HgvID06EAX96UJnX1UiG9warRXgbrF6rhLSt42kCq8uTKfGa/lb/qlPQ
	9j3cwuKmag/pvBqaqoUS22lof+mSKVjB38rqhup9qUGSvz4tUpN2VHKl4GXAgNp4hJGQ
	bbnG0K0SrDQArZzgzqds8Mi4okmoYotOxNblf6iW9C/sTN4cnw+DwHQt+A+R6CdW0iIL
	tOicMRUezoaiIKIrk38W735ZTWEXMbiUXnegXkYorwPUcoPskST4nx96Km+IVP62HYIP
	xErA==
X-Gm-Message-State: APjAAAXODfw9uPnFeOj+vZgT9dgqDuctwiTWX5MSbff/MIgu+QAl780r
	s24kkOhs3ketAMkRictUvkHMF32jldioSrK9KyA=
X-Google-Smtp-Source: APXvYqy4WYGLf+m9y9WVCv+vuuVlpzVXDtLWPAoi1HMnOpdp5t000KrbYxWKLSv7ay498/sNysr0yBMqdA/S1dFBFXc=
X-Received: by 2002:a5d:620f:: with SMTP id y15mr9897908wru.101.1551648084802; 
	Sun, 03 Mar 2019 13:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
In-Reply-To: <20190303204731.GK5026@bill-the-cat>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 3 Mar 2019 15:21:12 -0600
Message-ID: <CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Sun, 03 Mar 2019 21:21:24 -0000
Content-Type: multipart/alternative; boundary="000000000000e942d505833738df"

--000000000000e942d505833738df
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 3, 2019, 2:47 PM Tom Rini <trini@konsulko.com> wrote:

> Hey all,
>
> As part of the packagegroup-core-base-utils series I noticed that
> with rm_work enabled like I usually have, every build was starting over
> with rebuilding linux-libc-headers and going down from there.  I
> finished bisecting this now and it comes down to:


Just for reference, are you trying to use hash equivalence? It sounds like
not, but I would like to make sure.

Also, it there an AB build that uses rm_work that would have seen this?


> commit d889acb4f8f06f09cece80fa12661725e6e5f037
> Author: Joshua Watt <jpewhacker@gmail.com>
> Date:   Fri Jan 4 10:20:15 2019 -0600
>
>     sstate: Implement hash equivalence sstate
>
> This can be reproduced easily with qemux86, core-image-minimal, oe-core
> and this in site.conf:
> # Save more space
> INHERIT += "rm_work"
> # But keep this around for debugging
> RM_WORK_EXCLUDE += ""
> INHERIT += "buildstats"
> INHERIT += "buildstats-summary"
>
> (I doubt the last two matter, but I only noticed that was in my bisect
> just now).
>
> --
> Tom
>

--000000000000e942d505833738df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Mar 3, 2019, 2:47 PM Tom Rini &lt;<a href=3D"m=
ailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Hey all,<br>
<br>
As part of the packagegroup-core-base-utils series I noticed that<br>
with rm_work enabled like I usually have, every build was starting over<br>
with rebuilding linux-libc-headers and going down from there.=C2=A0 I<br>
finished bisecting this now and it comes down to:</blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Just for reference, are you tr=
ying to use hash equivalence? It sounds like not, but I would like to make =
sure.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Also, it there an =
AB build that uses rm_work that would have seen this?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
commit d889acb4f8f06f09cece80fa12661725e6e5f037<br>
Author: Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">jpewhacker@gmail.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Jan 4 10:20:15 2019 -0600<br>
<br>
=C2=A0 =C2=A0 sstate: Implement hash equivalence sstate<br>
<br>
This can be reproduced easily with qemux86, core-image-minimal, oe-core<br>
and this in site.conf:<br>
# Save more space<br>
INHERIT +=3D &quot;rm_work&quot;<br>
# But keep this around for debugging<br>
RM_WORK_EXCLUDE +=3D &quot;&quot;<br>
INHERIT +=3D &quot;buildstats&quot;<br>
INHERIT +=3D &quot;buildstats-summary&quot;<br>
<br>
(I doubt the last two matter, but I only noticed that was in my bisect<br>
just now).<br>
<br>
-- <br>
Tom<br>
</blockquote></div></div></div>

--000000000000e942d505833738df--
