Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708F7CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 09:40:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.8090.1760002825236352655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 02:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H03zBgSB;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-421851bcb25so345653f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760002823; x=1760607623; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b1zKvHhjd8tefHXNqzcogujMPnUqxTnamPghKjANisM=;
        b=H03zBgSBRat0xGK9dkHusXSb1rtNaHExJqdQVTVsr5PZC1PbogyphXd439U6WBLGKe
         OS8BHoRCC6AkVCWtENLLZxsRKfc7DwidtOVweumqrnRM9jIT4H0zM+IXtEgR/iE4xDVr
         VflT/KERPSFjeUBlyJxM6HcRAByh6RydSuP6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002823; x=1760607623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1zKvHhjd8tefHXNqzcogujMPnUqxTnamPghKjANisM=;
        b=ECTrjV07J3j2K3DkO331emSxWXOVHXwRvRuRL8pnIquzT6bO4cT0l8X/F6CICV3iIT
         fFn5mSZfjiI7sVvrChnBJHpjGVsx1o9wPBSX4sCwHW6HPzcSLeycqbd4QmQqFrINz/Qd
         9OqLFfbs+hdroBdBqvBFbsBaFCBhMGALU1/3c+nehhfqGOg5/MoYn6z0fov0d461IU7f
         rbGPuCXEwj61vrOs5y3sJ8uJHbmDxuEVktJAGG6sLRuSFUDHDpAh1da8XWnN7QBnBIhJ
         qMb/jN6MlyPqgSezmRpKZWEozBunVrsIml0ERchYinV5jlEiHkQLetSGKsWfjAycmTXc
         mX0w==
X-Gm-Message-State: AOJu0YweXsTAoGOdpOVf8D9qMZFVsS6sjZTqq3SklRrW0Xn1HpuaeGBM
	OGpqNNHXTSRNvFjpe+PBp80iKUyJgM2K0s2ki6v4WjJ4TKGGUulStfcX8OQ1elrgRMyjxFGM6GO
	dsdoroDXSCfnc/pJqVcobdRgto4xhC8+8GEXQAxEYVw==
X-Gm-Gg: ASbGncuRNKiViTEun1WgOHo87rTEGeknkWwunYII2GFcpVyg7KBYMSQft8zoZfsP+yc
	XDSs/KuCQa1GpqJn0qPcbkJ5IZ+9/Upm7d0yL2PVDLJ+HJWQMLWaJhAcSFT0FLotCK6Ew7wqZT/
	i/wx94rMKp7TFuJkwHeuxEjgLeRNQiK35qgsYErCuWIUQ4g4MrDrEG+DAoyPybGWVpMX/FrkFLp
	a+eofYrL8e5+bp0cpmymYRzHDkMPXEpKSjAn84fw56aPx/r1/Gy+nGT3BK/hVAA+8b4AzLY
X-Google-Smtp-Source: AGHT+IEuUYxdDvv66nosekGHMWuud1T37N3RM8jwaLRILE9bOG9JBpysVWbzfjGUBghKMNUxPCV5zMdzDBnoYUXtdIE=
X-Received: by 2002:a5d:5f83:0:b0:3e4:f194:2872 with SMTP id
 ffacd0b85a97d-4266e8d7756mr4531701f8f.31.1760002823404; Thu, 09 Oct 2025
 02:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251002131024.48843-1-naftaly.ralamboarivony@smile.fr>
In-Reply-To: <20251002131024.48843-1-naftaly.ralamboarivony@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 9 Oct 2025 11:39:57 +0200
X-Gm-Features: AS18NWDuFEXR7tcl4N13z_jALbr_rXqpfTutkPWUMCYVnyeij6LnMuhX32Aewow
Message-ID: <CAMSfU+5DQzSLg2Y99+UEBsN1OCocZ_TWF0Gzd-wcsEKhdmCFhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patchtest: fix failure when oe-core repo is in
 detached HEAD
To: naftaly.ralamboarivony@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000017d2a50640b69708"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 09:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224610

--00000000000017d2a50640b69708
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 2 oct. 2025 =C3=A0 15:10, naftaly.ralamboarivony via
lists.openembedded.org <naftaly.ralamboarivony=3D
smile.fr@lists.openembedded.org> a =C3=A9crit :

> From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
>
> Patchtest fails when oe-core git repo is in a "detached HEAD" state:
>
> Error log:
>
> > File "/usr/lib/python3/dist-packages/git/repo/base.py", line 881, in
> active_branch return self.head.reference ^^^^^^^^^^^^^^^^^^^
>
> > File "/usr/lib/python3/dist-packages/git/refs/symbolic.py", line 311, i=
n
> _get_reference raise TypeError("%s is a detached symbolic reference as it
> points to %r" % (self, sha)) TypeError: HEAD is a detached symbolic
> reference
> as it points to '3dd31d3b29730fa1130645d76bb71914ac036335' None
>
> In this case, no current branch is available for the clean operation.
>
> To fix this, updates the checkout logic:
> - if a current branch is available, use it,
> - otherwise, fall back to the commit pointed to by HEAD.
>
> This ensures that the script works correctly even when HEAD is detached.
>
> Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
>

Hello Naftaly,

Notes from the patch review call:
The patch looks good but needs a test to be merged.
The patch creates 2 code-paths (detached/attached HEAD) but the existing
patchtest selftests only tests one.
We need to ensure both are tested.

---
>  meta/lib/patchtest/repo.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
> index 2cdd6736e4..6a7d7d2d3b 100644
> --- a/meta/lib/patchtest/repo.py
> +++ b/meta/lib/patchtest/repo.py
> @@ -21,7 +21,12 @@ class PatchTestRepo(object):
>          self.repodir =3D repodir
>          self.repo =3D git.Repo.init(repodir)
>          self.patch =3D mbox.PatchSeries(patch)
> -        self.current_branch =3D self.repo.active_branch.name
> +
> +        if self.repo.head.is_detached:
> +            self.current_commit =3D self.repo.head.commit.hexsha
> +            self.current_branch =3D None
> +        else:
> +            self.current_branch =3D self.repo.active_branch.name
>
>          # targeted branch defined on the patch may be invalid, so make
> sure there
>          # is a corresponding remote branch
> @@ -80,6 +85,6 @@ class PatchTestRepo(object):
>              self._patchmerged =3D True
>
>      def clean(self):
> -        self.repo.git.execute(['git', 'checkout', self.current_branch])
> +        self.repo.git.execute(['git', 'checkout', self.current_branch if
> self.current_branch else self.current_commit])
>          self.repo.git.execute(['git', 'branch', '-D',
> self._workingbranch])
>          self._patchmerged =3D False
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224357):
> https://lists.openembedded.org/g/openembedded-core/message/224357
> Mute This Topic: https://lists.openembedded.org/mt/115551792/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000017d2a50640b69708
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 2 =
oct. 2025 =C3=A0=C2=A015:10, naftaly.ralamboarivony via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;naftaly.ralamboarivon=
y=3D<a href=3D"mailto:smile.fr@lists.openembedded.org">smile.fr@lists.opene=
mbedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Naftaly RALAMBOARIVONY &lt;<a href=3D"mailto:=
naftaly.ralamboarivony@smile.fr" target=3D"_blank">naftaly.ralamboarivony@s=
mile.fr</a>&gt;<br>
<br>
Patchtest fails when oe-core git repo is in a &quot;detached HEAD&quot; sta=
te:<br>
<br>
Error log:<br>
<br>
&gt; File &quot;/usr/lib/python3/dist-packages/git/repo/base.py&quot;, line=
 881, in<br>
active_branch return self.head.reference ^^^^^^^^^^^^^^^^^^^<br>
<br>
&gt; File &quot;/usr/lib/python3/dist-packages/git/refs/symbolic.py&quot;, =
line 311, in<br>
_get_reference raise TypeError(&quot;%s is a detached symbolic reference as=
 it<br>
points to %r&quot; % (self, sha)) TypeError: HEAD is a detached symbolic re=
ference<br>
as it points to &#39;3dd31d3b29730fa1130645d76bb71914ac036335&#39; None<br>
<br>
In this case, no current branch is available for the clean operation.<br>
<br>
To fix this, updates the checkout logic:<br>
- if a current branch is available, use it,<br>
- otherwise, fall back to the commit pointed to by HEAD.<br>
<br>
This ensures that the script works correctly even when HEAD is detached.<br=
>
<br>
Signed-off-by: Naftaly RALAMBOARIVONY &lt;<a href=3D"mailto:naftaly.ralambo=
arivony@smile.fr" target=3D"_blank">naftaly.ralamboarivony@smile.fr</a>&gt;=
<br></blockquote><div><br></div><div>Hello Naftaly,</div><div><br></div><di=
v>Notes from the patch review call:</div><div>The patch looks good but need=
s a test to be merged.</div><div>The patch creates 2 code-paths (detached/a=
ttached HEAD) but the existing patchtest selftests=C2=A0only tests one.</di=
v><div>We need to ensure both are tested.</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/lib/patchtest/repo.py | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py<br>
index 2cdd6736e4..6a7d7d2d3b 100644<br>
--- a/meta/lib/patchtest/repo.py<br>
+++ b/meta/lib/patchtest/repo.py<br>
@@ -21,7 +21,12 @@ class PatchTestRepo(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.repodir =3D repodir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.repo =3D git.Repo.init(repodir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.patch =3D mbox.PatchSeries(patch)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.current_branch =3D <a href=3D"http://self=
.repo.active_branch.name" rel=3D"noreferrer" target=3D"_blank">self.repo.ac=
tive_branch.name</a><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.repo.head.is_detached:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.current_commit =3D self.rep=
o.head.commit.hexsha<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.current_branch =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.current_branch =3D <a href=
=3D"http://self.repo.active_branch.name" rel=3D"noreferrer" target=3D"_blan=
k">self.repo.active_branch.name</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# targeted branch defined on the patch ma=
y be invalid, so make sure there<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# is a corresponding remote branch<br>
@@ -80,6 +85,6 @@ class PatchTestRepo(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._patchmerged =3D True<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0def clean(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.repo.git.execute([&#39;git&#39;, &#39;che=
ckout&#39;, self.current_branch])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.repo.git.execute([&#39;git&#39;, &#39;che=
ckout&#39;, self.current_branch if self.current_branch else self.current_co=
mmit])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.repo.git.execute([&#39;git&#39;, &#3=
9;branch&#39;, &#39;-D&#39;, self._workingbranch])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._patchmerged =3D False<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224357): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224357" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224357</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115551792/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115551792/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000017d2a50640b69708--

