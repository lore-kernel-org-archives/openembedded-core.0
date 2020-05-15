Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web11.10279.1589536840738897919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 03:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YaQM4Qfg;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id o7so1728983oif.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HOk8RaaPqAbgANne2CKCPCyMRhMgRjRog3kd+Soiqy4=;
        b=YaQM4QfgV2CeFPilC4Qcl/Q8zoL4CrHDTmyZu5z68H99sHGMZklBheSlP8pDqbxIXQ
         iSCYa3bK5AYhlBt9+q9F/6QA6l7Hzycc/sXIDIW2onVPyvKOdABelpU5jrHJrkX1uyCv
         Aftwx8H8mEW0Z/wlnubjN1ST2ghT628vRGOyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HOk8RaaPqAbgANne2CKCPCyMRhMgRjRog3kd+Soiqy4=;
        b=FsyEVeU4pCHTXa14Vh32Z01FrinZ4rllNJcO+cYY65+LsCitleJWIAOT0NyFbwCZ9a
         i2rW4ZyBFk82Geeix9rRKrSmYtPmkDg9ShhVGP0xUsC1iu91kcYHXHCF8IrcgD+H+bNS
         KDbEVQDDbqsvnWW/yd8ZeCoux6vDEMrhz9M+PQQz6QSU1y4NR6n6sGpuTL9vjWmpMe/I
         zw378JBBinXzuoq/2TWqXojqM3g8k3mRyIOPap4+QVIF/a8cob7517oWfFlPJ1WSbOFH
         7wVVLnhJInNDpPxC0tx8ASbzi5gSFyyptxfjKrqqIpbIIO/YSI+TZaHBRoiKGD69Bg8P
         TgYA==
X-Gm-Message-State: AOAM530MLgoOSy/cMfwSK8L5aCAbdKACWg3Ez6kOTSJchj9YQu95eEEE
	seTTQS7Mn1oIX2ouJdqppODQMh1t6slPeWjhG4KVHA==
X-Google-Smtp-Source: ABdhPJwx5MWul70UuDTKgzO1CM27S4iUHBZCayC61Np7UmyzfqVE92rkDNT3QjcUm5kgrON52cDkKZ4cybS4ttSy2BQ=
X-Received: by 2002:aca:538f:: with SMTP id h137mr1413978oib.6.1589536840151;
 Fri, 15 May 2020 03:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589535009.git.liezhi.yang@windriver.com> <ab5e6c612d362589fa88a49fd36c4a0b1ecc1a37.1589535009.git.liezhi.yang@windriver.com>
In-Reply-To: <ab5e6c612d362589fa88a49fd36c4a0b1ecc1a37.1589535009.git.liezhi.yang@windriver.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 15 May 2020 11:00:28 +0100
Message-ID: <CAM9ZRVtq0OLUR0GUjVPpTYqJ49PcxqoFjRcX2TpHrtsgk8CMVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Fix for do_populate_sdk
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b7076605a5ace22e"

--000000000000b7076605a5ace22e
Content-Type: text/plain; charset="UTF-8"

Robert,

I recommend we use the following patch instead as it's simpler:
https://lists.openembedded.org/g/openembedded-core/message/136168

Thanks,
Paul

On Fri, 15 May 2020 at 10:31, Robert Yang <liezhi.yang@windriver.com> wrote:

> Fixed:
> $ bitbake core-image-minimal -cpopulate_sdk
>
> Check tmp-glibc/deploy/sources, no source is archived, this patch fixes the
> problem.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/archiver.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 48b4913a9f..49f96bdce6 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -592,4 +592,8 @@ python () {
>      # gets added or removed (by adding or removing archiver.bbclass).
>      if bb.data.inherits_class('kernel-yocto', d):
>          bb.build.addtask('do_kernel_configme', 'do_configure',
> 'do_unpack_and_patch', d)
> +
> +    # For populate_sdk
> +    if bb.data.inherits_class('image', d):
> +        d.appendVarFlag('do_populate_sdk', 'recrdeptask', '
> do_deploy_archives')
>  }
> --
> 2.21.0
>
> 
>

--000000000000b7076605a5ace22e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Robert,<div><br></div><div>I recommend we use the followin=
g patch instead as it&#39;s simpler:=C2=A0<a href=3D"https://lists.openembe=
dded.org/g/openembedded-core/message/136168">https://lists.openembedded.org=
/g/openembedded-core/message/136168</a></div><div><br></div><div>Thanks,</d=
iv><div>Paul</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, 15 May 2020 at 10:31, Robert Yang &lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Fixed:<br>
$ bitbake core-image-minimal -cpopulate_sdk<br>
<br>
Check tmp-glibc/deploy/sources, no source is archived, this patch fixes th=
e<br>
problem.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com=
" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/archiver.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass=
<br>
index 48b4913a9f..49f96bdce6 100644<br>
--- a/meta/classes/archiver.bbclass<br>
+++ b/meta/classes/archiver.bbclass<br>
@@ -592,4 +592,8 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0# gets added or removed (by adding or removing archive=
r.bbclass).<br>
=C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#39;kernel-yocto&#39;, d):<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.addtask(&#39;do_kernel_configme=
&#39;, &#39;do_configure&#39;, &#39;do_unpack_and_patch&#39;, d)<br>
+<br>
+=C2=A0 =C2=A0 # For populate_sdk<br>
+=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;image&#39;, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_populate_sdk&#39;, &#=
39;recrdeptask&#39;, &#39; do_deploy_archives&#39;)<br>
=C2=A0}<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div>

--000000000000b7076605a5ace22e--
