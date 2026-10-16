Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0887CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 11:48:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19718.1792151306581196333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 04:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HbxZeAZd;
 spf=pass (domain: mvista.com, ip: 209.85.218.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2a4e013a44so491838466b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 04:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792151305; cv=none;
        d=google.com; s=arc-20260327;
        b=B/AM5bif5bkePbzJZzY0Y76/37WNKJgwCIVgSClazHEyl7tdfKyRNQUM2OdJmuYSWv
         uUrr4khHVtFY56YldM+ZPKs2G+byCSBgwZU6WjTatk0XzLXoactnANe5ggjyshiNqhMG
         B1Az7UJ/a33QZvQJUdGckzJS07mVTMn9t2sxIcrkEHy1na8tWuPi4YNAFHO6ba69rDo8
         4q6BQ8juXMmuM+1rOuTmuYetqYZEMwV9TVfmtKCXcqHjDagggD+XlVER5zzWrpxUKC6t
         hwQMV+n704+zTZFfRClIlQj3QbwjbvkPDoRqynrpIRUL4j5I5YywW4k1llWz5IR9cMkF
         spUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PpDti92VTgsVgvnMVKSU27+7ZiwDUHHgCXUhHqvfyAc=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=l2VWBZkB3+2luSu9h5BMonNzw0eJISHrHFiCGDyWbogeM8KRzL9MOlTMK7vv5Fs96z
         3NA3JCh0kdwtW64fu44yA7Uzx+/NiA2szt6PFFxHqi5VQfs/2cAV0bKCPPrPz/43pli2
         qalE1BxVZCZCbBD/aVMXNOQbtf0t02NClcJwdaQdUVACMVBuCZSR911y8d771SYj/zZa
         UI5niPq+oJ5rFxH2RO4dAgYBDttXi/YWwMeV5wiYvfeoE1kYeT7bo6fUYy9zK4PQjQ8o
         GnhGLeNTraybFRu/Oeyt8Zw3/UHAGzsp1HcayFs+bTKazA7HuOhw8r/72uEnDLLTFhF5
         VxbA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792151305; x=1792756105; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpDti92VTgsVgvnMVKSU27+7ZiwDUHHgCXUhHqvfyAc=;
        b=HbxZeAZdyvEca/SFUGy+rG2z3K6tqACa30XvGParq/ZHdUxr52EFTY0A0FZ/i+/1UH
         PY9O8tP44b4CJ6xOaOsFYOwJM0r8vcp45GWEQZ9DFIoM0BRX3PjRZIzebdco2yitQeyY
         vLpDK2upWja440Ro4/7h5he9xYBSvsUmJXCOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151305; x=1792756105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpDti92VTgsVgvnMVKSU27+7ZiwDUHHgCXUhHqvfyAc=;
        b=dI4mg2eYmcgPNEKB1T0qDnaDPrb4gD3hT3xJUhm83TpEN/BSrJj+e4PPcO7rl3IWzK
         ic3wnTMXejWW8YSUsETgMQelqvg4DURmtXPdxIU8fkWiCFgSNvgT807ffwgiJ22+dyQn
         nruOW6RuRJNqF8sygvVdqiQVWKiveoEt6jO+KHdynKOik0LK8RAYJBCL/r+9kestD6Dp
         /6McMC2oL+qGcN3yo+J6mkfZdxXk0a0FFcZkmLi3CFxqoi8Kb8twYvRKGOGnFf4MTzDo
         unSPYBS5EN75x0NZvLv0P+4fXxANm1zwGVuXPvzAf5y7hg0FPLz33TACP53DANfXhFvv
         SXXg==
X-Gm-Message-State: AFq9FYLd/5ibaJLbK0uxoje733Z8cKkwgijOpLEd+kmkoX/+lobRtdhI
	uMqF0CGhjxKqLKG2F07Da7RT4Z5FV0yFakKqEz3tsnisq/HJIwuXSJU+VNn3pQtUVUeGlu8r7D7
	AAc6EewC86S50GKLwXtUz8FZbdDT+BS5qRoyenwuJKQ==
X-Gm-Gg: AYBFou1zcdcCCBkqmJgIgVZWP6ZRj6hT5OWXZeEYZtMIF2nbhemjZceuMZnnDKTN5jU
	ZBNVLGNlSWR4bm7jydNYHMtb9vqG2Ab/zBbZKHjKAcKAZKGdtUQUWALe1zkbg6ARvLixjt/Ryzv
	cixweqdRRgO8ZbWWah/HxpXqBqEBqFqeuKbF3QRiPHKi5msVjtAA6LsfXfnso6HVdqw7A37ARnC
	bOlupDlEZ7mhyuwa8NfN5qEBtuCJl5fAcVz0SD7NURVex9IQ6uenmeSlDzejAOgnMBxJhk0wZb4
	BSGct8MXl7wnN+JvazRKcRvo9uIb4BqUOmuhQNFS5OfqnEio3YiCEGg=
X-Received: by 2002:a17:907:3e9f:b0:c40:b477:dfa0 with SMTP id
 a640c23a62f3a-c40b48723f1mr128025066b.18.1792151304440; Fri, 16 Oct 2026
 04:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261016053344.103696-1-vanusuri@mvista.com> <DM62KASB5RK9.HMFQ0TUDPVCD@smile.fr>
In-Reply-To: <DM62KASB5RK9.HMFQ0TUDPVCD@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 16 Oct 2026 17:18:12 +0530
X-Gm-Features: AclHuK9hW6RYQeO4z675nNK-UtCiML9TNgMZsCfoffZvHcxgXozcCImSOFzJhvU
Message-ID: <CANQUz18joQXzbyvYMpGeEvuq5s04rJcnUM_k06+jC0tOJon+Bw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch] python3-git: Fix CVE-2026-67326
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e2a4e0065df3bd1d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 11:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248014

--000000000000e2a4e0065df3bd1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I reviewed the fix for CVE-2026-67326 and confirmed that it is identical to
the fix in the larger patch series.

I haven't reviewed the remaining patches in the series.

You can ignore my patch.


Thanks & Regards,
Vijay


On Fri, Oct 16, 2026 at 12:33=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Fri Oct 16, 2026 at 7:33 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > This patch applies the upstream fix as referenced in [2], using the
> > commit shown in [1].
> >
> > [1]
> https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91=
ba52cda5229856a6edf7ac06
> > [2]
> https://github.com/gitpython-developers/GitPython/security/advisories/GHS=
A-mv93-w799-cj2w
> > [3] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-67326
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../python/python3-git/CVE-2026-67326.patch   | 109 ++++++++++++++++++
> >  .../python/python3-git_3.1.43.bb              |   1 +
> >  2 files changed, 110 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
>
> Hello,
>
> This is fixing the same CVE as a patch in a larger/later series:
> https://lore.kernel.org/all/20261016054106.210444-2-yurade@cisco.com/
>
> Vijay, can you review Yogita's patch? This would make my life easier.
>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000e2a4e0065df3bd1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Yoann,<p><span>I reviewed the fix for CVE-2026-673=
26 and confirmed that it is identical to the fix in the larger patch series=
.</span></p><p><span>I haven&#39;t reviewed the remaining patches in the se=
ries.<br></span></p><p><span>You can ignore my patch.</span></p><p><span><b=
r></span></p><p><span>Thanks &amp;=C2=A0Regards,</span><br><span>Vijay</spa=
n></p><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 16, 2026 at 12:33=E2=80=AFPM Yo=
ann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.=
fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Fri Oct 16, 2026 at 7:33 AM CEST, Vijay Anusuri via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt; This patch applies the upstream fix as referenced in [2], using the<br=
>
&gt; commit shown in [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/gitpython-developers/GitPython/commi=
t/54538428f79b0c91ba52cda5229856a6edf7ac06" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/gitpython-developers/GitPython/commit/54538428f79b=
0c91ba52cda5229856a6edf7ac06</a><br>
&gt; [2] <a href=3D"https://github.com/gitpython-developers/GitPython/secur=
ity/advisories/GHSA-mv93-w799-cj2w" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/gitpython-developers/GitPython/security/advisories/GHSA-mv=
93-w799-cj2w</a><br>
&gt; [3] <a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-67=
326" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.suse.com/show_bu=
g.cgi?id=3DCVE-2026-67326</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3-git/CVE-2026-67326.patch=C2=A0 =C2=A0| 109 ++=
++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-git_3.1.43.bb" rel=3D"noref=
errer" target=3D"_blank">python3-git_3.1.43.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 110 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-=
2026-67326.patch<br>
<br>
Hello,<br>
<br>
This is fixing the same CVE as a patch in a larger/later series:<br>
<a href=3D"https://lore.kernel.org/all/20261016054106.210444-2-yurade@cisco=
.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all/202=
61016054106.210444-2-yurade@cisco.com/</a><br>
<br>
Vijay, can you review Yogita&#39;s patch? This would make my life easier.<b=
r>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000e2a4e0065df3bd1d--

