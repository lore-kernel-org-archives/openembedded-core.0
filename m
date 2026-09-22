Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BBAC982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 05:12:55 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3511.1790053968743428947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 22:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q9kBvKJl;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-67109935888so3684213d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 22:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790053968; cv=none;
        d=google.com; s=arc-20260327;
        b=q5RuA46ocV0s1ZKWYsQC0NJuLCBVpG/uz28+5RlKT1Jy3EgiZLxLRBfGxYzJPbK5dh
         zLE40g2C5owsFePhukz39c3G1wowmxjZh30QfFvt/ZCUmnR7HBY/Jid3TUQUqLgXK5no
         cog+RnogFGHFWQ50Fg85wNCv9Oc4qcP0iKo+jWaDlUmx864JNEdToU3yK4XeKaQ7IchH
         rsFTj4t3H1dlGG+P4Yjon//mFyTk2ewCbjQneDPuirO1Mc7z/HqUtuUx6TcBuez2YihH
         +Xb245A3Q4ukXsWRCA4TfgCiRomw3EGc+R30I7UYrnRb/XzeNXV/7C0j+GEtNcSHJyDK
         jpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BNxLWtuvizoi1YMsSPNYSPTFs/laGk/ilOWIIjkN9Cg=;
        fh=cbrRBowqXFtaBRQuQTLUdN65nruooZ+ReinhtsinK58=;
        b=GruCecpwTNvf1crsv6SiZR4DR/wR+GBuziGT2LpVGMIMOxNdRlvClYFY4usvyYoZKP
         4Cv7gzBARGTG6vuLtb+VUn382Yf2+W6u1Es60HnCybuzAcsp4j4JKhHu1cR1bXO05TON
         8112n46VOocadD4SAv+uX5uDAV6L89mkdZqImrLMs0+ZvhqKnZqjTpWQAPQ2ONnwixfF
         Tu3KNKZNf8ZhY9Kha8NBUldfgeEYMHAZhFS/VEPnlbzqaV2RJbwYFRoNGC5USBflVB1C
         cFrablTPTMsTLthgqkTRdvo9sBWiIVdXPdvRLozZWhYIkEs4WBPta7jdJK3rDeFGolkF
         EJig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790053968; x=1790658768; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNxLWtuvizoi1YMsSPNYSPTFs/laGk/ilOWIIjkN9Cg=;
        b=Q9kBvKJlsqEAYyO9KOYa/eo+/yBP7uJdAJYtgo4+RD0VjM1+tMdpKseBl0GNdqzrl+
         wkt/rAUd9b3M9o8He4JHy9+nHRc2N2JZsNTx3B8jOD12KDZgeznVfQObWEdJmTk1bJ0z
         AP3tM2zQLPRBCzibDqirpAyvSUwgi7rvey+FT5EeeywCkK6Ofm1AsRt5XCMUffAsVpvR
         qoObs9PxrUyeL8Rcm1Pmk0JafoDjlzoZ8/+S2CxgsYV8jikwGCwgVK2WKhlyiaLrbljL
         3Y6S3+r2YEBlB1ODvvH2nLSvuFVzdJlWuqTyU2MLn4I2EkYROSFOHV5Rk4VHNCgZ06ZH
         yttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790053968; x=1790658768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BNxLWtuvizoi1YMsSPNYSPTFs/laGk/ilOWIIjkN9Cg=;
        b=JBjFwlkGe3Yo3q7ijv6bLOF43ujH6e9rEWQqS84h4I285s9QkN668ICPRt50mqtFNw
         d3StY7DhalQB/BVy+vwh86mLRcFz6aqB0PUY9LMs51WPcWxkE7Z/PmNwl3Ht5bBG+FIh
         t//0Pb3B3/ayKkY+8RinUE1oW+0iXsWVd89CDK6oglQR9lw2ZbzqMuOfx3MgZPrd4xeW
         IZKniq2VFPle2U6VPoQ69t/+8EskDv0NB/sdqJsAApE76bAtEt90vzDmM6xg+96Ik/Km
         ony2NVR578+3a8hulWwecuXWpXlR90b0VKm16RWmXGNC+sV+sCsBIy7qugw5mLHFg50t
         putw==
X-Forwarded-Encrypted: i=1; AKwUvByrVSnsONB4ddt5D5jxKMgG3+zF5flgkxzsyiabkYwRbxEXe+nSKbh9Rk2vEPUd0qNXDsnNdsW9dgIJj09lkvKqLg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nKQekk81WwkLLrgbgwiYV2RrXhT3uUaTovi/ZijTMFE+O973on
	jcaQaG1M/D7qU/ql3Q1+kIaIcqTH58djSd8IaBKGXB/OIg6uocxAT0uttTWGDL8AEvaWpTEGod0
	EnjChgEPZCZZkSpZ6seehdSqQXczEYmA=
X-Gm-Gg: AYBFou1nG1nisfK1Br7XORbtlHdgXqmznjyK3mgl4ylBWRBKLcR3h/w8ci90526AQwg
	KPupYQVAzRLVjpMK4n1H6oiyBi7vtNx2ZFIJJEbTetLlq22+ot7L0Yh5UaT2p64JU3e1+JpKCPi
	7SWbrV2xorkgWWy1VkgdBTyl0IBNeBVgTu/6Q7J6Dy1+nLDw0l6cAE/FhV5oKyjfugTEHtoC6AJ
	JCMTZxcNueUL6msnP1/8YgTIn53N8S0mMsY+sLOYvgKSW6QMQ/cxKGqDEshnt5Xois+/o2E0jQL
	oWSiagFPhecEx+UxAP1TTDcPAOM6JRvJAola3X+BXVkG8F6qbbIgCQLlhycE3AzemTsoRcAMMkE
	tLqejMSnnGDvX6axTI3C1nv+G177zn1D4QRyzCCmKLrCNJwXoBPLvZiinu27w+UHA+zS4HMBVaX
	49SLA2ojng8S4NUS9EqYOJCUVR+5NHfSynCS4DGgAq2nyaSV87HqZF5MLGdbARYj2vx0SsahnwM
	h2VK2lnlL6BnS2qAH1piu+t1jV8GNUbIvikilRP0ZMVxBdOZLuUYb9/Nq4vEkhPt0I36UZ5MyLj
	uAUKRqYZhjp1SsvEJC8VF/6iRgha3AcRSYLO4gAe
X-Received: by 2002:a05:690e:d43:b0:671:70e4:5179 with SMTP id
 956f58d0204a3-6717fdda51amr4333058d50.99.1790053967698; Mon, 21 Sep 2026
 22:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260918090731.467954-1-joaomarcos.costa@bootlin.com> <DLL9WV35J102.2UNYBH63VLF77@baylibre.com>
In-Reply-To: <DLL9WV35J102.2UNYBH63VLF77@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Sep 2026 22:12:36 -0700
X-Gm-Features: AcwNN1UFo0ZLgXC7SAopJ9JqiIMBaDO0RQEgvnvV-06BTHqlPb3aEQQ0Xy2AWFo
Message-ID: <CAMKF1spyzGBK=hOWbbSxYhna8ALds4gCNAQkofCt_=+xYv57_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-packagelists.inc: disable gnutls for RISCV64
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000df9f2c065c0b6a17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246368

--000000000000df9f2c065c0b6a17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026, 8:12=E2=80=AFPM Trevor Gamblin via lists.openembedded=
.org
<tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:

> On Fri Sep 18, 2026 at 5:07 AM EDT, Jo=C3=A3o Marcos Costa wrote:
> > Timeouts have been observed (very frequently in the past weeks)
> > in the autobuilder, and a bug [1] was filed at Bugzilla.
> >
> > For now, it's not quite clear what specific test case is causing the
> timeout.
> >
> > [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
>
> After modifying the gnutls ptest so that it outputs rough test durations
> (in ms)
> and collecting a log, these seem to be the worst offenders:
>
> |tgamblin@megalith
> ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$
> grep 'PASS:' tests.log | sort -t'(' -k2 -n -r
> |PASS: mini-record-2 (187880ms)
> |PASS: record-retvals (145390ms)
> |PASS: rng-op-key (63820ms)
> |PASS: rng-op-random (63330ms)
> |PASS: rng-op-nonce (63260ms)
> |PASS: dtls-rehandshake-cert (61360ms)
> |PASS: dtls-rehandshake-cert-2 (61230ms)
> |PASS: dtls-rehandshake-anon (61030ms)
> |PASS: mini-loss-time (60130ms)
> |PASS: mini-dtls-hello-verify-48 (30050ms)
> |PASS: tls12-ffdhe (27790ms)
> |PASS: x509sign-verify-rsa (18460ms)
> |PASS: x509sign-verify-ecdsa (16050ms)
>
> mini-record-2 is longest runtime by far, and is consistent with what the
> Bugzilla bug shows - if you build core-image-ptest-gnutls and watch the
> output,
> mini-record-2 comes after mini-record, which is the last on that runs
> before the
> AB log timeouts. Do you want to submit a narrower patch, which
> conditionally
> disables mini-record-2 and record-retvals for riscv64?
>

Or relax the timeout a bit


> >
> > Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> > ---
> >  meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> > index 79e27f617b..9b264657bb 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -163,8 +163,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools
> strace"
> >  PTESTS_SLOW:append:libc-musl =3D " libc-test"
> >
> >  # These tests don't yet pass for riscv64
> > -PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-too=
ls
> python3-numpy perl glib-2.0 zstd"
> > -PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace
> lttng-tools python3-numpy perl glib-2.0 zstd"
> > +PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-too=
ls
> python3-numpy perl glib-2.0 zstd gnutls"
> > +PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace
> lttng-tools python3-numpy perl glib-2.0 zstd gnutls"
> >
> >  # These tests don't yet pass for musl qemuarm64
> >  PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2.=
0"
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246367):
> https://lists.openembedded.org/g/openembedded-core/message/246367
> Mute This Topic: https://lists.openembedded.org/mt/121311542/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000df9f2c065c0b6a17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 2026, 8:12=E2=80=
=AFPM Trevor Gamblin via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;tgamblin=3D<a href=3D"mailto:baylibre.com@lists.open=
embedded.org">baylibre.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Fri Sep 18, 2026 at 5:0=
7 AM EDT, Jo=C3=A3o Marcos Costa wrote:<br>
&gt; Timeouts have been observed (very frequently in the past weeks)<br>
&gt; in the autobuilder, and a bug [1] was filed at Bugzilla.<br>
&gt;<br>
&gt; For now, it&#39;s not quite clear what specific test case is causing t=
he timeout.<br>
&gt;<br>
&gt; [1] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D161=
62" rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D16162</a><br>
<br>
After modifying the gnutls ptest so that it outputs rough test durations (i=
n ms)<br>
and collecting a log, these seem to be the worst offenders:<br>
<br>
|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedde=
d-core (master)$ grep &#39;PASS:&#39; tests.log | sort -t&#39;(&#39; -k2 -n=
 -r<br>
|PASS: mini-record-2 (187880ms)<br>
|PASS: record-retvals (145390ms)<br>
|PASS: rng-op-key (63820ms)<br>
|PASS: rng-op-random (63330ms)<br>
|PASS: rng-op-nonce (63260ms)<br>
|PASS: dtls-rehandshake-cert (61360ms)<br>
|PASS: dtls-rehandshake-cert-2 (61230ms)<br>
|PASS: dtls-rehandshake-anon (61030ms)<br>
|PASS: mini-loss-time (60130ms)<br>
|PASS: mini-dtls-hello-verify-48 (30050ms)<br>
|PASS: tls12-ffdhe (27790ms)<br>
|PASS: x509sign-verify-rsa (18460ms)<br>
|PASS: x509sign-verify-ecdsa (16050ms)<br>
<br>
mini-record-2 is longest runtime by far, and is consistent with what the<br=
>
Bugzilla bug shows - if you build core-image-ptest-gnutls and watch the out=
put,<br>
mini-record-2 comes after mini-record, which is the last on that runs befor=
e the<br>
AB log timeouts. Do you want to submit a narrower patch, which conditionall=
y<br>
disables mini-record-2 and record-retvals for riscv64?<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Or relax the timeout =
a bit=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt;<br>
&gt; Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos=
.costa@bootlin.com" target=3D"_blank" rel=3D"noreferrer">joaomarcos.costa@b=
ootlin.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/co=
nf/distro/include/ptest-packagelists.inc<br>
&gt; index 79e27f617b..9b264657bb 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -163,8 +163,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D &quot; lttng-to=
ols strace&quot;<br>
&gt;=C2=A0 PTESTS_SLOW:append:libc-musl =3D &quot; libc-test&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # These tests don&#39;t yet pass for riscv64<br>
&gt; -PTESTS_SLOW:remove:riscv64 =3D &quot;tcl tcl8 python3-cffi strace ltt=
ng-tools python3-numpy perl glib-2.0 zstd&quot;<br>
&gt; -PTESTS_PROBLEMS:append:riscv64 =3D &quot; tcl tcl8 python3-cffi strac=
e lttng-tools python3-numpy perl glib-2.0 zstd&quot;<br>
&gt; +PTESTS_SLOW:remove:riscv64 =3D &quot;tcl tcl8 python3-cffi strace ltt=
ng-tools python3-numpy perl glib-2.0 zstd gnutls&quot;<br>
&gt; +PTESTS_PROBLEMS:append:riscv64 =3D &quot; tcl tcl8 python3-cffi strac=
e lttng-tools python3-numpy perl glib-2.0 zstd gnutls&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # These tests don&#39;t yet pass for musl qemuarm64<br>
&gt;=C2=A0 PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D &quot;strace perl gnu=
tls glib-2.0&quot;<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246367): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246367" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/246367</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121311542/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/121311542/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000df9f2c065c0b6a17--

