Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D931BC44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:36:10 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4742.1783503277622582496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FPS3Y+pq;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8478a25f268so336273b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783503277; cv=none;
        d=google.com; s=arc-20260327;
        b=lzFLDSFgX3XcVG9rp6rCu6BsEyVngoufQPm2Bv1BjlLswFVg3kpKVXkPkUqB0r4Z7i
         9vd/wDFZl36NsUnGqsTqVl32Hh8gcQ6MactUE1CayJRPOFBIlEEZkHbWbqS/XzCuYVb5
         tTIaJQbHoU+obeMzagy8eHBv7f5Cvg5kJFtqcN/yYHRvEY5XWObsP6+2Y43np2mUHKBr
         /pVIM0D0orAZ06gI9iq5fxGHLdG6AorGjgoC8cvK3YoFx3PRG+PDg5pw1iwKQBcvDg9U
         XA88eHZb5rpNDICsE4rRVvflUNgOZcnX3YGKAaIivXumI4s/peCU/X6u2AkOq4csQJmC
         FKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dp9A9eOa6RZ9JPG+pOPzBCzajT+6Wnrahw8fs3lTbGU=;
        fh=d05bKGwTIeOoMwHQ7qG1swnNH5uyLxPXQikaX14OzmQ=;
        b=cADm1rRznsGAqG0BxQItExHbrscBR5n5vyPh2volDvomXYUsX5QWW4+ql7UPJtnr1F
         9+pIGxTQhYa7CPZ4eurOyLXs0S0whKCfoAfXl7+lWE/Yj7Suh8D6dHzs5BuBbuBC3yT3
         6YZEvEueJoPK0jNlmDjvwGv/RnCgw7k5B5rNS+X2ujDa5S7csFH0/JyiX6oL01oZCQZB
         CAGH5/PJTzBQhyDBreHDfERv6e+xBuWLtazU0sMJyonKNdI+L0j/SYrVDlin91A2UJlD
         maoc3FX4+w5W0sRUlWTpTXEdkHaJOyVjBjaSefl63FA15Fjy6YLiegHGhQJwnsTQ2Szw
         P0/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783503277; x=1784108077; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp9A9eOa6RZ9JPG+pOPzBCzajT+6Wnrahw8fs3lTbGU=;
        b=FPS3Y+pqvhXGiz6764R+iYJl+VS86iPpkV/qAm7gKBs9miCPjOJ322LRi3xWnHXG8i
         q6lWnqmqFUkQtKn9lRMHWVxXtkI6MaLOVPWlwju/3TIWxXp8IOcKhTqdJd8yPs/I5IAG
         lEAFzZZfIqTEH/1wgOMb6LOi0VHZctxzmPOsehPwgmUvqJFhySrXyGpLKYTvwu8QOoda
         nE9rwGa4RTPZnaVBY8iY80lRdpZtMl/wdaQkIrhXhfI5SZ3HNcAlhQD6Hf+7QpQ2ACwV
         HY4LS0oZmPoeOINwCNAs1pXnOKES4cCmJ5M2cu9XMAbDoOev0R4PXfRL0hM3ecqhjj+9
         2CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783503277; x=1784108077;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dp9A9eOa6RZ9JPG+pOPzBCzajT+6Wnrahw8fs3lTbGU=;
        b=iLBlDik2yluEOVfvanbSVULlh5APsBGmXQRDKUf0bX60jwXgLQsV/ffVAw6zdqneHv
         PbcnT5Rq0mgQtyYP/R8gCeqM/g+O+ubNPTgd2SdFSXtgCHrJiehEXWL/TxfU+0tvAWqp
         rB/Bs7zQSPrnXqUKQqNFCkSBQ4ct/YFQL5tKVhA4dSIYY4gbiIfjBvhibpqspdVvJwxv
         bfkhkZkM2BJ42a2qtqy7ffqm6SKDMVN2bW5UoX8ZWwSRVC5TYyHh9uBKHb70cMac8eV5
         oFiHv9r8mP24iSwdNN4udA4pu/zNNSAP5Q0c4V0x8KUqg2bk0VymT0BlrBBp4VUFqwD4
         aMhA==
X-Gm-Message-State: AOJu0YwpH/zMFHdxrPMynqKLpEWFZiQG29h0YyxW2Uy/YTb+ZHnG+PYC
	QgUU6qiWEIxnEwcgszwextL38nWXUlB1bf3uz78sYewbmBRU2fa124NclLQry4arAWxsbdoF8Vy
	4nssMwu88EPckdNov9x2bziuL1nVkXLw=
X-Gm-Gg: AfdE7cmGbY3QyUY8xtJVZovnGNXlSes5SzCS3nZk04rVMY28/8YTmJeDluNOwnF6BiT
	g3Sj0x6T0HNjlIWmhRaYr0/ddzcZbxWYbkIQxtzIeXmiCoWF3kAHm1zUrJq/dZBy2jkVXg9rYXV
	UwpOa4ynhAxECfXSmB1WKslnNAux/NSZli4tS9iQQQjHemBR2Rb4Xd/GZbU2HALQRp7dIFk+qzF
	WxUFPjTVWUCayMbkm5xXtQFAx5iIgvqXdVrVtNukBuaDV3g/0+e2qBc/sb5DY9gE31uyRQJ8i9t
	ZpX4zaEXrEe1q8yyHcvKTpFdTcuWyVg=
X-Received: by 2002:a05:6a00:4191:b0:848:2e53:3f63 with SMTP id
 d2e1a72fcca58-84842edc78bmr1951215b3a.21.1783503276839; Wed, 08 Jul 2026
 02:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260707064301.32102-1-jakubszczudlo40@gmail.com> <DJT32W69PZMH.3CI3ARE9YG46W@bootlin.com>
In-Reply-To: <DJT32W69PZMH.3CI3ARE9YG46W@bootlin.com>
From: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Date: Wed, 8 Jul 2026 11:34:25 +0200
X-Gm-Features: AVVi8CfW1Q_EJN_QW2rSo0SBszJ2ohM7fx8LH1F1M95Sd0oTgXYAS6Eu079hwPo
Message-ID: <CA+gq5Jj3XPOgEQBEHLSq2sx4+-VkCrWScpUpHZLAeVFHaBH0hA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] libgcrypt: upgrade 1.10.3 -> 1.10.4
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Hongxu Jia <hongxu.jia@windriver.com>, Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000004595da06561637f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240451

--0000000000004595da06561637f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 8 lip 2026, 11:31 u=C5=BCytkownik Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> napisa=C5=82:

> On Tue Jul 7, 2026 at 8:43 AM CEST, Jakub Szczudlo via
> lists.openembedded.org wrote:
> > Release notes are here:
> > https://dev.gnupg.org/T8233.html
> > Update contains fix for CVE-2026-41989 and because of building error
> patch need to be
> > updated to fix compile flags in new version.
> >
> > Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> > ---
> > v3:
> >  - Correct patch file name to be the same as patch title
> > v2:
> >  - Added new patch to fix building error with '-O2' in sysroot path for
> libgcrypt 1.10.4, patch
> >    was taken from wrynose and backported.
>
> Hi Jakub,
>
> Thanks for your patch, but please remember to add the [scarthgap] prefix
> in the subject when targeting stable branches.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
sure, this was a mistake, I also send patch with corrected prefixes here:

https://lists.openembedded.org/g/openembedded-core/message/240364?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Clibgcrypt%2C20%2C2%2C0=
%2C120153110

Best regards,
Jakub Szczudlo

--0000000000004595da06561637f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">=C5=9Br., 8 lip 2026, 11:31 u=C5=BCytko=
wnik Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@boot=
lin.com" target=3D"_blank" rel=3D"noreferrer">mathieu.dubois-briand@bootlin=
.com</a>&gt; napisa=C5=82:</div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Tue Jul 7, 2026 at 8:43 AM CEST, Jakub Szczudlo via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Release notes are here:<br>
&gt; <a href=3D"https://dev.gnupg.org/T8233.html" rel=3D"noreferrer norefer=
rer noreferrer" target=3D"_blank">https://dev.gnupg.org/T8233.html</a><br>
&gt; Update contains fix for CVE-2026-41989 and because of building error p=
atch need to be<br>
&gt; updated to fix compile flags in new version.<br>
&gt;<br>
&gt; Signed-off-by: Jakub Szczudlo &lt;<a href=3D"mailto:jakubszczudlo40@gm=
ail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jakubszczudlo40@gm=
ail.com</a>&gt;<br>
&gt; ---<br>
&gt; v3:<br>
&gt;=C2=A0 - Correct patch file name to be the same as patch title<br>
&gt; v2:<br>
&gt;=C2=A0 - Added new patch to fix building error with &#39;-O2&#39; in sy=
sroot path for libgcrypt 1.10.4, patch<br>
&gt;=C2=A0 =C2=A0 was taken from wrynose and backported.<br>
<br>
Hi Jakub,<br>
<br>
Thanks for your patch, but please remember to add the [scarthgap] prefix<br=
>
in the subject when targeting stable branches.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://bootlin.com</a><br>
<br>
</blockquote></div>
<br>sure, this was a mistake, I also send patch with corrected prefixes her=
e:<div dir=3D"auto"><br><div dir=3D"auto"><a href=3D"https://lists.openembe=
dded.org/g/openembedded-core/message/240364?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%=
3Arecentpostdate%2Fsticky%2C%2Clibgcrypt%2C20%2C2%2C0%2C120153110">https://=
lists.openembedded.org/g/openembedded-core/message/240364?p=3D%2C%2C%2C20%2=
C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Clibgcrypt%2C20%2C2%2C0%2C12015=
3110</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</=
div><div dir=3D"auto">Jakub Szczudlo</div></div></div>

--0000000000004595da06561637f9--

