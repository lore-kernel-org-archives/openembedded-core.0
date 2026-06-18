Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAC9CD98E2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 09:00:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15193.1781773199536943262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 01:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tWRq+w+X;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso4160835e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 01:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781773198; cv=none;
        d=google.com; s=arc-20240605;
        b=Evm39ybw3cbDHaF4pXy/d0jpykHByzMqLcB6KjRaIqCeDle1Wir/n6QmG5CkqaxzTx
         Eq5IjUadLTXSqOpe/JOj3Y26H+BieeMMapsWmvOgbtB9AIY4WGA5uoL2DyixOPX3GKKp
         9c7jJFu3/f9l3mVKWEax6H/ky0EvM6SjZNvvszE8N7Fat2LednQlCenK9Zf/yGa5mXun
         UlSsQ268/BECogY2//yE3nwTMTAw4xHN+mGWfmM3oz3MP429nvwSr9cOsOxfI8PXbpzQ
         qx8DTgTaTAYuEfgcNu1JC2MGi2H4UVfe2XhbVDGRDuDKba5DHxhzNa+sWsiF4c3kdhbi
         8XYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gaGxS8SIxq3+U45JxgQCObwjlwapn0TJ3gnXXi5Pk2k=;
        fh=sNmvGu+/e0s9U2oilBnTb3LzY7GTFx+mL9WM42kBkkU=;
        b=Ap4m3Ao++rzeID5ftjJUIErLjSVVpXh0270VD4GaIh59etIFxQqccYzjtEyJkW54e/
         uRGe4RrZvlgEC3sqy59V31yMq5V8IOCEtXf8hgIgX1Ta35ST5GC7b2SqP9tei7izzc51
         Xq/9B7QsQhTxYkWR4YhvZaMRkPeyJ24o0Tci3qIPiDMVxhlHL067RdRz9w/KecppYleS
         EY2cnT3RWWFT+QWQasvBKfT2/8pVevFgCfQ8JvzeeRa1Q+1k3InT53YK/XlHHQrvMCsZ
         jSi+LPpq+AQZMyilNvYs+Jq6GvK7kc6GzpYSDXtDssxn7DnQYa3CDnYYIV4sAucOl2hy
         mTTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781773198; x=1782377998; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaGxS8SIxq3+U45JxgQCObwjlwapn0TJ3gnXXi5Pk2k=;
        b=tWRq+w+Xkbnh9jvmNALgs4Jbmq9fmEhIGvDkMQJyEU/OltqsqlgKl9FTda+lFiqIUf
         EPjqPa3w7zhC/7lLCtzZ3hYNOq1HDuNM43BQH8448a/kCGwZRu/TpYx6DlWuYh2D9bWm
         UXp4huvDTHBnYS6+PzR6qVYeo37jBJgwT+N4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773198; x=1782377998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaGxS8SIxq3+U45JxgQCObwjlwapn0TJ3gnXXi5Pk2k=;
        b=G4L0UdLhiHTrFwKPLrV6GUz+T4tTxBSm5lwumGRtxwKf4JeKFiRecJYXSpyfV8VU8Q
         9//WahZBwmfNll+rFRRz+/mdA0fPamAw26BKy7CtZV7St/RSzWygINX6cDdhfTOswQ3S
         9RK26jX9y5is1snQ0qkVrEJv15YCK6nvfpXXCOER7Ayc1XU0Mwr650Sr23TZo9L2lQqO
         xCRCCaHGywfnYwROPIh26jHoVhIDupqsejFBrp3IeY9VyDzbkP1S8uORauHGKtnXhwIe
         F+s6j7rml8PQ+Ary0c6Em+Ne8PnhsITAYIiziWX0HUa40hp7SiEocsLbG09+0prYBleU
         DlXA==
X-Gm-Message-State: AOJu0YxHSqVdZX+WA+X3SqGpn5wn4bSmQ47om2Eo74Biu+n4dUnT5FeE
	DG5wKAuKmSbwmA9qFybxI3fxTxdF7efz74yFRVcINF7VKTCIUQs4FwhOqprS5HqNu1uG3CC/5OZ
	V2eS3wdEG1b4nFjGSbH/b1W9b+iRAt+pTNrmGKwKksFWutLyhNNo2akQ=
X-Gm-Gg: AfdE7cncONmvLu+fN3YQQimPpHVWPvOODnT/TC62SyyLngVqAlcypFbitWPKw/97IVE
	odENj+mck6gCH2uA4zkhHy2WFfAq/7QVDLW2i0EOLCITsTXU0meSxOw9OvHKrPErJxcwTwXdecG
	0A3+QJbwP9yNtF29iTRNjyLJUzF41xiYD+60pMaEuuqGSpC9BjagC09kueBn4g2ImE0jFd27EaB
	lPVsc5dpCJMFA/nkrbK2eTaD4ITZBD6+bx2btlxJNMwYY3lryyI4GyqaAfZyLxdCUvAUpkmx5OP
	oEtV9wWQ5mCiw0mGP9eF2VSDuIpdag==
X-Received: by 2002:a05:600c:c3cc:10b0:492:3778:d452 with SMTP id
 5b1f17b1804b1-4923778d457mr47074605e9.14.1781773196500; Thu, 18 Jun 2026
 01:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260420042409.1727728-1-Harish.Sadineni@windriver.com>
 <DJACAG7CMC18.3FXGQ7XY58UM4@smile.fr> <e3fd8230-36de-4436-a8e7-8d5432cafad5@windriver.com>
In-Reply-To: <e3fd8230-36de-4436-a8e7-8d5432cafad5@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 18 Jun 2026 10:59:30 +0200
X-Gm-Features: AVVi8Cf9w0_BhtNtofCNU9CuQ6FdYRFr0jE-AxCNi0eQOmW8F-mBZKfZhIQLmwA
Message-ID: <CAMSfU+6cPHYFuAM8sQPXdE2Ot3MjVSJ90zsVOhUfebCknUzKrQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Fix CVE-2025-69646
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="00000000000072b07d065483668b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239070

--00000000000072b07d065483668b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 18 juin 2026 =C3=A0 10:49, Harish Sadineni <Harish.Sadineni@windriv=
er.com>
a =C3=A9crit :

>
> On 6/16/2026 2:13 PM, Yoann Congal wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > On Mon Apr 20, 2026 at 6:24 AM CEST, Harish via lists.openembedded.org
> Sadineni wrote:
> >> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >>
> >> CVE: CVE-2025-69646
> >>
> >> PR 33638
> >> * dwarf.c (display_debug_rnglists_list): Return bool.  Rename
> >> "inital_length" to plain "length".  Verify length is large
> >> enough to read header.  Limit length to rest of section.
> >> Similarly limit offset_entry_count.
> >> (display_debug_ranges): Check display_debug_rnglists_unit_header
> >> return status.  Stop output on error.
> >>
> >> Upstream-Status: Backport [
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3D598704a00c=
bac5e85c2bedd363357b5bf6fcee33
> ]
> >>
> >> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> >> ---
> > Hello Harish,
> >
> > This patch was lost for a time, my fault, sorry.
> >
> > Now, when I try to apply it, do_patch fails for binutils. Could you
> > rebase on the latest scarthgap and send a v2?
> Hi Yoann,
>
> CVE-2025-69648 is a duplicate of CVE-2025-69646.
>
> The fix for CVE-2025-69648 has already been merged into Scarthgap, so
> the corresponding fix for CVE-2025-69646 is already present
> and no additional patch is required.
>

That explains the do_patch failure...

In that case, CVE-2025-69646 needs to be added to the "CVE: " line in
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/b=
inutils/binutils/CVE-2025-69648.patch?h=3Dscarthgap

What do you think? If that's correct, could you please send the patch for
it?

Thanks!Could you handle it please?

Thanks,
> Harish
> >
> > Thanks!
> >
> [...]



--=20
Yoann Congal
Smile ECS

--00000000000072b07d065483668b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 18=
 juin 2026 =C3=A0=C2=A010:49, Harish Sadineni &lt;<a href=3D"mailto:Harish.=
Sadineni@windriver.com">Harish.Sadineni@windriver.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 6/16/2026 2:13 PM, Yoann Congal wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; On Mon Apr 20, 2026 at 6:24 AM CEST, Harish via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> Sadineni wrote:<br>
&gt;&gt; From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; CVE: CVE-2025-69646<br>
&gt;&gt;<br>
&gt;&gt; PR 33638<br>
&gt;&gt; * dwarf.c (display_debug_rnglists_list): Return bool.=C2=A0 Rename=
<br>
&gt;&gt; &quot;inital_length&quot; to plain &quot;length&quot;.=C2=A0 Verif=
y length is large<br>
&gt;&gt; enough to read header.=C2=A0 Limit length to rest of section.<br>
&gt;&gt; Similarly limit offset_entry_count.<br>
&gt;&gt; (display_debug_ranges): Check display_debug_rnglists_unit_header<b=
r>
&gt;&gt; return status.=C2=A0 Stop output on error.<br>
&gt;&gt;<br>
&gt;&gt; Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?=
p=3Dbinutils-gdb.git;a=3Dpatch;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33=
" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/?p=3Dbinu=
tils-gdb.git;a=3Dpatch;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33</a>]<br=
>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadine=
ni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<b=
r>
&gt;&gt; ---<br>
&gt; Hello Harish,<br>
&gt;<br>
&gt; This patch was lost for a time, my fault, sorry.<br>
&gt;<br>
&gt; Now, when I try to apply it, do_patch fails for binutils. Could you<br=
>
&gt; rebase on the latest scarthgap and send a v2?<br>
Hi Yoann,<br>
<br>
CVE-2025-69648 is a duplicate of CVE-2025-69646.<br>
<br>
The fix for CVE-2025-69648 has already been merged into Scarthgap, so <br>
the corresponding fix for CVE-2025-69646 is already present<br>
and no additional patch is required.<br></blockquote><div><br></div><div>Th=
at explains the do_patch failure...</div><div><br></div><div>In that case,=
=C2=A0CVE-2025-69646 needs to be added to the &quot;CVE: &quot; line in</di=
v><div><a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/=
recipes-devtools/binutils/binutils/CVE-2025-69648.patch?h=3Dscarthgap">http=
s://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/binut=
ils/binutils/CVE-2025-69648.patch?h=3Dscarthgap</a></div><div><br></div><di=
v>What do you think? If that&#39;s correct, could you please send the patch=
 for it?</div><div><br></div><div>Thanks!Could you handle it please?</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

Thanks,<br>
Harish<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>[...]</blockquote></div><div><br clear=3D"all"></div><br><span clas=
s=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</f=
ont><div><font face=3D"Raleway, regular">Smile ECS</font></div></div></div>=
</div>

--00000000000072b07d065483668b--

