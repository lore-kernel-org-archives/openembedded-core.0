Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD73C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 12:43:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.18527.1753447420290456476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 05:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fTWatspx;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31e41cfa631so2346165a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753447420; x=1754052220; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4/PWnEAxoJRnAQN+UldyD09NbI/guaCd2x/xmHKp7OI=;
        b=fTWatspxk3Ia2Gl72nLL4/ipj/mbkssm4OJdmE25EaclYxdi3LVM0+47qGWwFqO7x1
         LcPIZNLHd65x3i6+bGAZ9z7z6Oo4uRmKHIRZFWndsy6ULr+03l1mU+QTWc2Nz7fa4cnE
         is5Lj7LlHWc9J+Jb+5gY0QEdoGUB54vxkx6GvnmhY0M6YxZyKw9LQPpJiZXf00Pn5HI2
         RvRzy+RX8Az+Xnx2TvwEzswZSN4A1BipbtGlmpM0iczCc+BX3rXImg/YisuUpOvw7XeR
         dHXtgHRoNvCeGNrGcVOUXGJpTgx+Xmzw/j9/PjSqHvcd5a3kmuC2F1gF/iOrS/H0iIJl
         bTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447420; x=1754052220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/PWnEAxoJRnAQN+UldyD09NbI/guaCd2x/xmHKp7OI=;
        b=TVvjBYt39fCUXd+HSKpKFsrj2fMoJpBjJCQl9T0YXCdgoVi2DeghM1I203RF3Vj0ly
         cpXjrHxL6NMIn2O3bku1+9gFp186WjEhnpNfAPrXfdBS1o80kl1lnBXfy+CdM4ZJF4OH
         nCFB6MZy3bTRwO+dWlPxTYNNIrAOhNjQSliijFs5qxCx/fIfEGZkTyX9dIdDj/Cqbraj
         x7LArowhXhA/NN6JAoBn4Ud393lP0qmKh8Q/kogDTu6v56jqmDn0g8B3DgWUpJzfijjx
         yhnSPR1IJUleLZ2BIBPuTxjITcoFli+wyzS+/TOjNoDoSLDDlQyiI6DiynewNk4EsqNY
         RqPg==
X-Gm-Message-State: AOJu0YwtONMBDxxODn3CSg8UVWYvALJ2+7MFG5JCqnlQvNYrwihMvbui
	uTg7zjkL5NecETCh7TZGv+fhe1EZ+nXJiHItTa/cziFVK4rJnhgfbtn710sKkzqRu1XLh5qXfS6
	dkKhKSf5wuCP5JOHJ0+qGMecVY1W6EUM=
X-Gm-Gg: ASbGncs+hJ4LxXV6n8+ze1LB/+klPwysLo4WiCJwaciNsIH7H51S4+9kh3P+1Bq59xj
	+sKMtKgLqrnU9F10NawNIy36u3QA1A7H7rjt+NwxHTDqUq9z1aQDAOiZzgHChYv1krnM74Txuw4
	YxUXIML0CUUh6jJ1MKUYxnsp+4K++h+GKCIf0gi+YKTRknUNvVFiLq7+PgoznitVkTtkqTjfX6B
	BSr/8Ll
X-Google-Smtp-Source: AGHT+IHnzU+wK9zuOaI4/GQy01X3LHoCI3BHj639oh1XnofQVLfLhf9sVtCIyfhsmjMmSiB0+iyQDrnSeuEeO+Pnz3I=
X-Received: by 2002:a17:90b:5868:b0:311:fde5:e224 with SMTP id
 98e67ed59e1d1-31e77730540mr2848669a91.6.1753447419498; Fri, 25 Jul 2025
 05:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250725123811.1718097-1-lamine.rehahlia@smile.fr>
In-Reply-To: <20250725123811.1718097-1-lamine.rehahlia@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Jul 2025 08:43:29 -0400
X-Gm-Features: Ac12FXyrbG9AdUeoJzUdD7sk1SZYF2JqO8DfFvlWDygFd1h-1KI5rib3k9V4eGY
Message-ID: <CADkTA4NwXU0TCYRCPj1BgT=y5Q6z5_Vn_i1+D8SAQNH7vWV=XA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] runqemu: Enable snapshot mode by default
To: lamine.rehahlia@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000925226063ac04ae2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 12:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220910

--000000000000925226063ac04ae2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 8:38=E2=80=AFAM lamine.rehahlia via lists.openembed=
ded.org
<lamine.rehahlia=3Dsmile.fr@lists.openembedded.org> wrote:

> From: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>
> When snapshot mode is enabled, all disk images are treated as read-only.
> Any sectors that are written during the QEMU session are redirected to a
> temporary file (usually in /tmp), and these changes are discarded when
> QEMU exits.
>
> This mode is particularly useful to:
> - Avoid corruption of the original image
> - Ensure repeatable and clean test runs
>

Except that qemu isn't only used for testing in that manner.

My main use case is persistent qemu runs where data persists for days and
even
weeks at a time while I test the deep container stacks in
meta-virtualization.

So unless I'm misunderstanding the patch, I'd be strongly against this bein=
g
the default. It has much more potential to surprise users than the chances
of
disk corruption causing problems.

If the default did change (and I'm understanding this correctly that it
would
impact all runqemu invocations), then there needs to be a large and obvious=
\
banner than any changes made during the run would be lost on exit.

Cheers,

Bruce



>
> Signed-off-by: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
> ---
>  scripts/runqemu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 3d77046972..6c263d6b2a 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -196,7 +196,7 @@ class BaseConfig(object):
>          self.taplock_descriptor =3D None
>          self.portlocks =3D {}
>          self.bitbake_e =3D ''
> -        self.snapshot =3D False
> +        self.snapshot =3D True
>          self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi',
> "wic.vhd", "wic.vhdx")
>          self.fstypes =3D ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs=
',
>                          'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz',
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220908):
> https://lists.openembedded.org/g/openembedded-core/message/220908
> Mute This Topic: https://lists.openembedded.org/mt/114336727/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000925226063ac04ae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 25, 2025 at 8:38=E2=80=
=AFAM lamine.rehahlia via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;lamine.rehahlia=3D<a href=3D"mai=
lto:smile.fr@lists.openembedded.org" target=3D"_blank">smile.fr@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Lamine REHAHLIA &lt;<a href=3D"mailto:lamine.rehahlia@smil=
e.fr" target=3D"_blank">lamine.rehahlia@smile.fr</a>&gt;<br>
<br>
When snapshot mode is enabled, all disk images are treated as read-only.<br=
>
Any sectors that are written during the QEMU session are redirected to a<br=
>
temporary file (usually in /tmp), and these changes are discarded when<br>
QEMU exits.<br>
<br>
This mode is particularly useful to:<br>
- Avoid corruption of the original image<br>
- Ensure repeatable and clean test runs<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Except that qemu is=
n&#39;t only used for testing in that manner.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">My main use case is persistent qemu runs where data pe=
rsists for days and even</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">weeks at a time while I test the deep container stacks in meta-vi=
rtualization.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">So unless I=
&#39;m misunderstanding the patch, I&#39;d be strongly against this being</=
div><div class=3D"gmail_default" style=3D"font-size:small">the default. It =
has much more potential to surprise users than the chances of</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">disk corruption causing prob=
lems.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">If the default did =
change (and I&#39;m understanding this correctly that it would</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">impact all runqemu invocati=
ons), then there needs to be a large and obvious\</div><div class=3D"gmail_=
default" style=3D"font-size:small">banner than any changes made during the =
run would be lost on exit.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Cheers,</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Lamine REHAHLIA &lt;<a href=3D"mailto:lamine.rehahlia@smile.=
fr" target=3D"_blank">lamine.rehahlia@smile.fr</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 3d77046972..6c263d6b2a 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -196,7 +196,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.taplock_descriptor =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.portlocks =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bitbake_e =3D &#39;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.snapshot =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.snapshot =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wictypes =3D (&#39;wic&#39;, &#39;wi=
c.vmdk&#39;, &#39;wic.qcow2&#39;, &#39;wic.vdi&#39;, &quot;wic.vhd&quot;, &=
quot;wic.vhdx&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fstypes =3D (&#39;ext2&#39;, &#39;ex=
t3&#39;, &#39;ext4&#39;, &#39;jffs2&#39;, &#39;nfs&#39;, &#39;btrfs&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;cpio.gz&#39;, &#39;cpio&#39;, &#39;ramfs&#39;, &#39;t=
ar.bz2&#39;, &#39;tar.gz&#39;,<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220908): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220908" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220908</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114336727/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114336727/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>

--000000000000925226063ac04ae2--

