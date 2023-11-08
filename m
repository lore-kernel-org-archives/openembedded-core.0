Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34AEC4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:18:06 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.13238.1699449485277687751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ABuCR6B9;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-45dadc5bf51so1797238137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699449484; x=1700054284; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x9BgKXkXiT1W3+0HCYXCPsHXlcjlwlX2Pts/d/IMdao=;
        b=ABuCR6B9m+JhRyZCQTpiOIIkUbvi5hmZoA9LBxK7g1O2ZDwGiwsI1sgHkjdPjRy55M
         sSwSIqk7NrkwGRWI9FMFMjmj9EobWaLCWIXoGVZipyAD84WDDDLQ4bG4LUO8PcoJHOLu
         z96QBTNM2IrNmX/5xyjX5njLgNXFvRiADnOWL7hUb3myQTiPgZ0Y+KEAQEUydseZFVC2
         8FgkIybcfRKDnd78BJKjUg06lP9mcVrgcOC4ZxWNR1ZkigcpSTSiaLOZlXcdMnbufUeM
         eWv13hmev0G/rAjOf35uommzzUXHUllBkFRLnISd4F6Uk2PJWlQUAt9MPO+rPnKOQQvK
         A1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699449484; x=1700054284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9BgKXkXiT1W3+0HCYXCPsHXlcjlwlX2Pts/d/IMdao=;
        b=Hoz2CUcsSBsddYuh5QSnxc2rhsdlwM/wCou7ytJZPFg2YHwiW7oJCMZQTxXdfMExXQ
         dDDP5LWXJsUTEL9FBbzobLxXfwAtQFlGHLa08Gc6zuMWXkgCe+V7E/Tjnc1EMoH/uwVb
         drc2qnNEUTsqfxixmW4QsktHQLU5FKKiEqeDVrhvWUzbgFXPyVvyyH8tYHRPi2hsyij2
         BgUzrGHh1bOiOZesc/c2rywLl7jTSH5s9k4sfWD6foMyyRHrQC0qbsrrmxHF2MO5LGbg
         KxC7S6ft+VV2kTuMc8ngXf6BIKd5mU5aXFVQ2txb3GmmoO3bsXsTfrnoF7PGjAaAab7J
         frag==
X-Gm-Message-State: AOJu0YzpzKL+d0P5DRLiGR0eSDQ7RwQV5Kvrd4NtSYHaurUQnb/AU9A3
	6ORYgoF+5T6at4Hj0xr9BWIcQCnJ5ThGfPONPug=
X-Google-Smtp-Source: AGHT+IFKdfuyjXmDM4JMYlqZU6Pty3rxM08u42fQ6cCmEhIXNpTBzK9tTLCj9+io5PmnSasXCjMvVATNJuJgg3WK3GE=
X-Received: by 2002:a67:c20e:0:b0:457:bc52:9b04 with SMTP id
 i14-20020a67c20e000000b00457bc529b04mr1267000vsj.35.1699449484279; Wed, 08
 Nov 2023 05:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20231108105644.2884585-1-joakim.tjernlund@infinera.com>
 <CANPvuRkdZ6fUwgQjA_u=kGBVjv-EQDJ+J0=nsV+voZhaA0RxQw@mail.gmail.com> <bb563d42468303a71a47509e0892ef5b7f5ee6c9.camel@infinera.com>
In-Reply-To: <bb563d42468303a71a47509e0892ef5b7f5ee6c9.camel@infinera.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 8 Nov 2023 13:17:53 +0000
Message-ID: <CANPvuR=jp-JrttHxEnyf2w8sbJkywNUnOwc3-hJVO5a2++7Feg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [meta classes] sed -i destroys symlinks
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d304250609a3ea1d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190323

--000000000000d304250609a3ea1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> escreveu no dia quarta,
8/11/2023 =C3=A0(s) 11:50:

> On Wed, 2023-11-08 at 11:22 +0000, Jose Quaresma wrote:
>
> Hi Joakim,
>
> Joakim Tjernlund via lists.openembedded.org <Joakim.Tjernlund=3D
> infinera.com@lists.openembedded.org> escreveu no dia quarta, 8/11/2023
> =C3=A0(s) 10:56:
>
> If /etc/passwd is a symlink, sed -i on same file will replace the
> symlink with a new file. Prevent that by expanding the file with realpath
> before giving it to sed.
>
>
> The sed follow-symlinks argument looks more appropriate for this imo.
>
>
>
> But not all sed impl. support that option(not busybox for one). Is Gnu se=
d
> an requirement here?
>

On the target we can use the sed from busybox but on the build host we use
the native sed which is the gnu.


>
>
> --follow-symlinks
> This option is available only on platforms that support symbolic links an=
d
> has an effect only if option -i is specified. In this case, if the file
> that is specified on the command line is a symbolic link, sed will follow
> the link and edit the ultimate destination of the link. The default
> behavior is to break the symbolic link, so that the link destination will
> not be modified.
>
>
> https://www.gnu.org/software/sed/manual/html_node/Command_002dLine-Option=
s.html
>
> Jose
>
>
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>
>  - I have patches which moves shadow/passwd files to an subdir in order t=
o
>    have passwd mgmt on a RO RFS. Is there a interest to have that oprion
> in OE?
>
>  meta/classes/rootfs-postcommands.bbclass | 4 ++--
>  meta/classes/useradd_base.bbclass        | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index 5c0b3ec37c..55cc863dbf 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -148,10 +148,10 @@ read_only_rootfs_hook () {
>  #
>  zap_empty_root_password () {
>         if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
> -               sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
> +               sed -i 's%^root::%root:*:%' $(realpath
> ${IMAGE_ROOTFS}/etc/shadow)
>          fi
>         if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
> -               sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
> +               sed -i 's%^root::%root:*:%' $(realpath
> ${IMAGE_ROOTFS}/etc/passwd)
>         fi
>  }
>
> diff --git a/meta/classes/useradd_base.bbclass
> b/meta/classes/useradd_base.bbclass
> index 7f5b9b7219..72732a4d57 100644
> --- a/meta/classes/useradd_base.bbclass
> +++ b/meta/classes/useradd_base.bbclass
> @@ -154,7 +154,7 @@ perform_passwd_expire () {
>         local username=3D`echo "$opts" | awk '{ print $NF }'`
>         local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd ||
> true`"
>         if test "x$user_exists" !=3D "x"; then
> -               eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i
> \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || tr=
ue
> +               eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i
> \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $(realpath
> $rootdir/etc/shadow) \" || true
>                 local passwd_lastchanged=3D"`grep "^$username:"
> $rootdir/etc/shadow | cut -d: -f3`"
>                 if test "x$passwd_lastchanged" !=3D "x0"; then
>                         bbfatal "${PN}: passwd --expire operation did not
> succeed."
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d304250609a3ea1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Joakim Tjernlund &lt;<a href=3D"mailt=
o:Joakim.Tjernlund@infinera.com">Joakim.Tjernlund@infinera.com</a>&gt; escr=
eveu no dia quarta, 8/11/2023 =C3=A0(s) 11:50:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div class=3D"msg5215857189206641611">




<div>
<div>On Wed, 2023-11-08 at 11:22 +0000, Jose Quaresma wrote:</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div>Hi Joakim,</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">Joakim Tjernlund via <a href=3D"http:=
//lists.openembedded.org/" target=3D"_blank">
lists.openembedded.org</a> &lt;Joakim.Tjernlund=3D<a href=3D"mailto:infiner=
a.com@lists.openembedded.org" target=3D"_blank">infinera.com@lists.openembe=
dded.org</a>&gt; escreveu no dia quarta, 8/11/2023 =C3=A0(s) 10:56:<br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div>If /etc/passwd is a symlink, sed -i on same file will replace the<br>
symlink with a new file. Prevent that by expanding the file with realpath<b=
r>
before giving it to sed.<br>
</div>
<br>
</blockquote>
<div><br>
</div>
<div>The sed follow-symlinks argument looks more appropriate=C2=A0for this =
imo.</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div><br>
</div>
<div>But not all sed impl. support that option(not busybox for one). Is Gnu=
 sed an requirement here?</div></div></div></blockquote><div><br>On the tar=
get we can use the sed from busybox but on the build host we use the native=
 sed which is the gnu.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div class=3D"msg5215857189206641611"><div>
<div><br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div><br>
--follow-symlinks<br>
This option is available only on platforms that support symbolic links and =
has an effect only if option -i is specified. In this case, if the file tha=
t is specified on the command line is a symbolic link, sed will follow the =
link and edit the ultimate destination
 of the link. The default behavior is to break the symbolic link, so that t=
he link destination will not be modified.<br>
<br>
<a href=3D"https://www.gnu.org/software/sed/manual/html_node/Command_002dLi=
ne-Options.html" target=3D"_blank">https://www.gnu.org/software/sed/manual/=
html_node/Command_002dLine-Options.html</a><br>
<br>
Jose</div>
<div><br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div><br>
Signed-off-by: Joakim Tjernlund &lt;<a href=3D"mailto:joakim.tjernlund@infi=
nera.com" target=3D"_blank">joakim.tjernlund@infinera.com</a>&gt;<br>
---<br>
</div>
<div><br>
=C2=A0- I have patches which moves shadow/passwd files to an subdir in orde=
r to<br>
=C2=A0 =C2=A0have passwd mgmt on a RO RFS. Is there a interest to have that=
 oprion in OE?<br>
</div>
<div><br>
=C2=A0meta/classes/rootfs-postcommands.bbclass | 4 ++--<br>
=C2=A0meta/classes/useradd_base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
</div>
<div><br>
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass<br>
index 5c0b3ec37c..55cc863dbf 100644<br>
--- a/meta/classes/rootfs-postcommands.bbclass<br>
+++ b/meta/classes/rootfs-postcommands.bbclass<br>
@@ -148,10 +148,10 @@ read_only_rootfs_hook () {<br>
=C2=A0#<br>
=C2=A0zap_empty_root_password () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; ${IMAGE_ROOTFS}/etc/shadow<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; $(realpath ${IMAGE_ROOTFS}/etc/shadow)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; ${IMAGE_ROOTFS}/etc/passwd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s%^root=
::%root:*:%&#39; $(realpath ${IMAGE_ROOTFS}/etc/passwd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
</div>
<div><br>
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass<br>
index 7f5b9b7219..72732a4d57 100644<br>
--- a/meta/classes/useradd_base.bbclass<br>
+++ b/meta/classes/useradd_base.bbclass<br>
@@ -154,7 +154,7 @@ perform_passwd_expire () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local username=3D`echo &quot;$opts&quot; | awk =
&#39;{ print $NF }&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local user_exists=3D&quot;`grep &quot;^$usernam=
e:&quot; $rootdir/etc/passwd || true`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$user_exists&quot; !=3D &quot;x&=
quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval flock -x $root=
dir${sysconfdir} -c \&quot;$PSEUDO sed -i \&#39;&#39;s/^\(&#39;$username&#3=
9;:[^:]*\):[^:]*:/\1:0:/&#39;\&#39; $rootdir/etc/shadow \&quot; || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval flock -x $root=
dir${sysconfdir} -c \&quot;$PSEUDO sed -i \&#39;&#39;s/^\(&#39;$username&#3=
9;:[^:]*\):[^:]*:/\1:0:/&#39;\&#39; $(realpath $rootdir/etc/shadow) \&quot;=
 || true<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local passwd_lastch=
anged=3D&quot;`grep &quot;^$username:&quot; $rootdir/etc/shadow | cut -d: -=
f3`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$pas=
swd_lastchanged&quot; !=3D &quot;x0&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbfatal &quot;${PN}: passwd --expire operation did not succeed.&=
quot;<br>
</div>
</blockquote>
</div>
</div>
</blockquote>
<div><br>
</div>
<div><span></span></div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></=
div></div>

--000000000000d304250609a3ea1d--

