Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBC5CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:15:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.11874.1759418135953650807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BI5g+FNm;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so1018267f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759418134; x=1760022934; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2TICwb+yJPcN3xeT685UjOxxMlE2YvUvteOk9VuhaJY=;
        b=BI5g+FNmQbA6JRdMivZcjNJjbp0xCtOKzjp13eNDG8vl4ZWQGHRquY8m7h4UvT22RM
         YyBfDOheDyJpPhdoDUIslYEA/rg5NBjkC/1uqcve1aN64cJCo+Gt5NxtlAWWvAvPwT4d
         AXZd0fNtLN9kHk+WVhjX08MQCEUL+5UCnsxjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759418134; x=1760022934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TICwb+yJPcN3xeT685UjOxxMlE2YvUvteOk9VuhaJY=;
        b=ThDYkhQ2e8oFYqjGwuGeDa2Y6yGQVlmWNHsmffZvOuBMLE8DwTvIo+FIUwHI091tPx
         mrcspOgo9D81bh6HQuGfAgYwx7KtyPrWSeimHPzPLi1NBGkEQ20xCMweqkJo91d1aCVV
         HnAJ83sAjv8PC5zVtkXb7LSUBx6okdkAbbaOADk+2UmRZXTxPQh6dv19CNPHsD3PdOWu
         MRpg3s80MxRy505s6T2qzglqyVd2UuyOqQtupY2oA+62RjGVbHo2GUP8M1utscqK38jA
         Cm/Axe0KqnS43svt2xcklvOCUbePPlAUvftgFHOPE7ENYUazxGcpr6KeIL4gk1kqaoae
         bsFA==
X-Gm-Message-State: AOJu0YwTa530J3Mlf8luDfYBc9E6jDN3zEE5366styfY0iYFRL+3lnif
	UC/ytjFMc6oA9SU8RQT1Bww4lq/kZnqssAhkF5ZcJeAb9moQYHnNWXnVwHZtlimzWQJb3St4qM4
	ixSiEG6z/EfU7124ZO2EBZExMFXfvqkn6bKQJ1Y+moIwxnC/7/fdtL8c=
X-Gm-Gg: ASbGncvtyXUxTs7ZzwiSnVz1nZbyFe66s0Jx7bHOIMkCyeALduq2SizwdtcW2P8U+mC
	cCQ3fov/xqu3DtdJRJl/uXzZFI4TzmI38cvpPLfbdSfxAzjy5MrKmBh9O5+JDtthED4YiZKxVQ/
	Ban4fZrnJaRzONyu5a+9rld9/bMyDmnygVrMDn4pfV+piroP4rqE4VZORJGpoGtt2WwUAq7ylOG
	IcpczCG5AQLaIGuoXH/RNb6Lu8N8NuZhH1n8PBCLgAAzlDUJL+OZkQG5OLrNeXthnJAW7dupIAp
	Fz3gteUhFLk=
X-Google-Smtp-Source: AGHT+IFNHDU8Yg5EuMru4mTciu/IjJ2loW5oC1QZ+xMRJzXMeM+aEJgwwc8ynA9/Zu/lKvYaDXr7A7BVSmxlNOx6Xq4=
X-Received: by 2002:a05:6000:240e:b0:3fb:bb69:d91b with SMTP id
 ffacd0b85a97d-425577e4a6cmr5745656f8f.2.1759418134288; Thu, 02 Oct 2025
 08:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251002131024.48843-1-naftaly.ralamboarivony@smile.fr>
In-Reply-To: <20251002131024.48843-1-naftaly.ralamboarivony@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 2 Oct 2025 17:15:07 +0200
X-Gm-Features: AS18NWCJegcqBty98HQI_WEkc2byVjEYpT7dP0YSrND3NdH1IlV7f3FKbNYm4F4
Message-ID: <CAMSfU+6p1M=9ixen3Ym2EKMDAr7k=Nu9vVn5eNG22QHf9jakmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patchtest: fix failure when oe-core repo is in
 detached HEAD
To: naftaly.ralamboarivony@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e7ebc406402e7466"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224368

--000000000000e7ebc406402e7466
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

 Reviewed-by: Yoann Congal <yoann.congal@smile.fr>


> ---
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

--000000000000e7ebc406402e7466
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
<br></blockquote><div><br></div><div>=C2=A0Reviewed-by: Yoann Congal &lt;<a=
 href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--000000000000e7ebc406402e7466--

