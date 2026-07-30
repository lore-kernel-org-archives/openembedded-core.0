Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F60DC54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 09:03:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7272.1785402187012178278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 02:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=FjE7ZyBV;
 spf=pass (domain: snapchat.com, ip: 209.85.221.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1195486f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 02:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785402185; cv=none;
        d=google.com; s=arc-20260327;
        b=eeYrmCYI2cY7pYOOW75DAX5YWDGKLDVK4348UpC0OZ6DmIe65ypkl4juOIWw4RdPCR
         t+TcrLp3fgBl9gcutbsmSf+fzP4tQRpShzns0tc+AH3nusJj4hCkU3KkMmsTD7BVqY/5
         SgCHtKLWSFOBw947v1+/p2caHSA6Od2GMQyEofhI485w0nhvNug6gAeFrmD5J5bERHrv
         SzAJonkDspx2GumFI8/IMdvIrVI1gfQ07mTq1IKxURYAtEC0eLUmxE9eWXqRDcGnr6MU
         9xTeH91Myx3JMTH+/uJOg/uvYoTsH9IIZH5vQwjGh0BXp1GTQQ/o3yHIK2SIEmKLaRjO
         WMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lJreRBmzVq4y46MA0f8UI1x9XtHcJTRDUOI7TbrMX+s=;
        fh=cQhUk7FAYywZLjh/YY/rvLfGRDiwQ5sI2rOGkKBxWGQ=;
        b=DRcYU3pIVdhtow6v4/F3ooNnQ8epT0HmCLxziqt+eCEwL7g/egtSEPhqHu3cVJ9h4W
         sBKArf/7AA83N4Gz1Z0g7YazrMLuk7hVsgfHJSIVnw2XOxDcqjW/KbQKiZ1PHoUCByJu
         NbcU+em8zRoiT2cz/AU2V2ZB9fgGUZR8r9nvIaDVzAmonmE8oJhLcq7Sn0QqWQ9/9ZXM
         8uXHWO9nSsArbxEOcV/edD8BCu1SkXsEkATjf8I3Y/t5LQILJbPgCCAxkT1vCR5DiU37
         3/7BXqhaacEg0R9kJmSxwQjL19ZU7X6wDHKkuP3TYE2ePurqSqS9LSgvtfdUNHJ6bjmA
         f7rA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1785402185; x=1786006985; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJreRBmzVq4y46MA0f8UI1x9XtHcJTRDUOI7TbrMX+s=;
        b=FjE7ZyBV2k8oL0A0PUgwKuJV31c9ujXZ2+pcx2FkyVi0I/hkKQzqj4RE3CnkEJQoqX
         aoaOnzEa3hlSq2KwQSJfPMiTTQV0UlbnjlUTcfBmF8Uf61lAmE0JzWppionHpFFGnAon
         oKoz4bVyy1N08IRL59474KwFDFupZK5TZwLVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402185; x=1786006985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lJreRBmzVq4y46MA0f8UI1x9XtHcJTRDUOI7TbrMX+s=;
        b=HYB07VNud9luuAsWM8DnP8f83zfnMrurGUxWbOW5a1oDF4QMMjAyQ6QSAMbqHeUbE+
         JbDO8D3aJHIedZhQp00C8Y3nV+p4z9BHhJOX60fJmJACvfTBuDqjhzIKigM4wJsluXJp
         8DjAGOSaWt+9smM3qHTra+Wz0kwuUq7hFCGX52h1EW6CaCqtLo4I2SadWsKf4znHGiGB
         7leRG2MnDYmXEm5qNi9XGTKkOp6Yl59efkwiebhs4buSoIDIxvq772F8sQQCxu3fXVxN
         JGaTTXvhWmrRy2iKjxtynunpZeJYQqn5kOhyUOpRzs3RrKqT7ZgUf8czMNMB4UrHwf/m
         5PoA==
X-Gm-Message-State: AOJu0YwJgsA6zyHam1/SyBPDYYVQOAXZbGFYgeYTUlS+tTM/7JvKQT8D
	1tRZdQqSH748Hp/n78vIkBxq6iBF4CtwwXTLwC+HmGyrQwF+YBc7KGUdUOqm99u1t6Ki0VcGyhQ
	6dju5Ubb/bowaWIJ3m/Kaef/q7n16jAokWVV8VQz/Dg==
X-Gm-Gg: AR+sD11pN+lcR3nmFTmieP7MQXbvkf9ITGZJERIlf/xmmCjVSI0Tcz0dqvXlHt28d/z
	c5dY2ZvINAN93lT5/ITQsoUAoj1wSaLVID7+eRauH0hDe7o9fGuEHZ2ZbSpOwaeBwsrDhquKhWS
	wboCL+hBkspKdvlQom2BrHFYix6FTld9Q/uE0kE4sZ+ErObPWQ1JcvY0rX5UTMjnYTB8x4BStX1
	Z1mQIebcHrEJbjHRBeKxqQYqcpmxxgrVtrQucY/J+5a7B9QU/3s5ukvpipcgQ0yB4ILMN/9rva4
	m2adXLsuMwx3eMNvi16Bl44J/onDysVqtO7V+HL4DyXOjmSpQ1O+MhdIh06paAKzCshsI5i0QMq
	iFw==
X-Received: by 2002:a05:6000:40cf:b0:47f:6fbd:89eb with SMTP id
 ffacd0b85a97d-47fc83339a2mr2334385f8f.57.1785402182007; Thu, 30 Jul 2026
 02:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260729152931.1347887-1-ecordonnier@snap.com> <amopCRlwZbvUiIAZ@navimatix.de>
In-Reply-To: <amopCRlwZbvUiIAZ@navimatix.de>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 30 Jul 2026 11:02:49 +0200
X-Gm-Features: AUfX_mxnJeLzTOlZ0amkuDjSBfAiMFjVYoYR-_jfz2c8XyanLXfHJlmGGjkpzrw
Message-ID: <CAHUKmYaegGjnaCWbuhAO7rD+z-eUAh8fmefx3noffBmK9pNSCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] package_manager/ipk: skip checksums for
 unsigned local feeds
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d74d710657d056cc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 09:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242328

--000000000000d74d710657d056cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rg,
- I've changed to positive logic
- I would rather not change to to_boolean. I'm just moving a line, and
introducing to_boolean would make it inconsistent with all the other lines
where this variable is used. Also BUILD_IMAGES_FROM_FEEDS is undocumented
(it is barely used upstream as far as I understand from
https://lists.yoctoproject.org/g/yocto/topic/install_externally_built_ipk/1=
12649954
), so acceptable values are not 100% clear to me (other lines using this
variable treat "False" as a positive value since they call "if
d.getVar('BUILD_IMAGES_FROM_FEEDS'):", while to_boolean would do the
opposite).
- I've swapped the evaluation order



On Wed, Jul 29, 2026 at 6:31=E2=80=AFPM J=C3=B6rg Sommer <joerg.sommer@navi=
matix.de>
wrote:

> Etienne Cordonnier via lists.openembedded.org schrieb am Mi 29. Jul,
> 17:29 (+0200):
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Computing checksums in the opkg Packages index requires reading every
> > .ipk file in full.  For a large image with 7000+ packages (including
> > multi-gigabyte debug packages), this adds 150-300s to every do_rootfs
> run.
> >
> > Checksums in the Packages index are only meaningful for signed feeds
> > (PACKAGE_FEED_SIGN=3D1): the GPG signature covers the Packages index
> > which contains the SHA256Sum of each .ipk, forming a chain of trust
> > that prevents tampered packages being swapped on a remote feed.
> >
> > For unsigned local file:// feeds the packages are installed directly
> > from the build host filesystem where there is no tampering risk.  Skip
> > all checksum generation in that case by passing no --checksum flags to
> > opkg-make-index (the tool's default behaviour when given no flags).
> > Pass --force-checksum to opkg so it does not error on the absent
> > checksum fields.
> >
> > On a test image with 7000+ packages (including a 2.3 GB debug
> > package): write_index time reduced from ~180s to ~22s (8x speedup)
> > when opkg-make-index is configured to produce no checksums by default.
> >
> > See
> https://git.openembedded.org/openembedded-core/commit/?id=3De462f47489f35=
902b6972f9837d9adfa542fc796
> > ("Enable sha256 checksums in opkg indexer", 2019) for the original
> rationale.
> >
> > AI-Generated: Claude Sonnet 4.6
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/lib/oe/package_manager/ipk/__init__.py | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/lib/oe/package_manager/ipk/__init__.py
> b/meta/lib/oe/package_manager/ipk/__init__.py
> > index 344e0852177..6c0b896a086 100644
> > --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > @@ -12,7 +12,7 @@ from oe.package_manager import *
> >  from oe.package_manager.common_deb_ipk import OpkgDpkgPM
> >
> >  class OpkgIndexer(Indexer):
> > -    def write_index(self):
> > +    def write_index(self, skip_checksums=3DFalse):
>
> Suggestion: I would use the positive case (like with_checksums or
> use_checksums or build_checksums), because reasoning about/reading code
> with
> the inverse is more difficult.
>
> >          arch_vars =3D ["ALL_MULTILIB_PACKAGE_ARCHS",
> >                       "SDK_PACKAGE_ARCHS",
> >                       ]
> > @@ -44,8 +44,9 @@ class OpkgIndexer(Indexer):
> >                  if not os.path.exists(pkgs_file):
> >                      open(pkgs_file, "w").close()
> >
> > -                index_cmds.add('%s --checksum md5 --checksum sha256 -r
> %s -p %s -m %s %s' %
> > -                                  (opkg_index_cmd, pkgs_file,
> pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
> > +                checksum_args =3D '' if skip_checksums else '--checksu=
m
> md5 --checksum sha256 '
> > +                index_cmds.add('%s %s-r %s -p %s -m %s %s' %
> > +                                  (opkg_index_cmd, checksum_args,
> pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
> >
> >                  index_sign_files.add(pkgs_file)
> >
> > @@ -103,8 +104,12 @@ class OpkgPM(OpkgDpkgPM):
> >          self.deploy_dir =3D oe.path.join(self.d.getVar('WORKDIR'),
> ipk_repo_workdir)
> >          self.deploy_lock_file =3D os.path.join(self.deploy_dir,
> "deploy.lock")
> >          self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg")
> > +        self.from_feeds =3D (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') =
or
> "") =3D=3D "1"
>
> Or: bb.utils.to_boolean(...)
>
> > +        self._skip_checksums =3D self.d.getVar('PACKAGE_FEED_SIGN') !=
=3D
> '1' and not self.from_feeds
>
> I would swap them because evaluation of the second one is cheaper.
>
> >          self.opkg_args =3D ['--volatile-cache', '-f', config_file, '-t=
',
> self.d.expand('${T}/ipktemp/'), '-o', target_rootfs]
> >          self.opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
> > +        if self._skip_checksums:
> > +            self.opkg_args.append('--force-checksum')
> >
> >          if prepare_index:
> >              create_packages_dir(self.d, self.deploy_dir,
> d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
> > @@ -116,7 +121,6 @@ class OpkgPM(OpkgDpkgPM):
> >          if not os.path.exists(self.d.expand('${T}/saved')):
> >              bb.utils.mkdirhier(self.d.expand('${T}/saved'))
> >
> > -        self.from_feeds =3D (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') =
or
> "") =3D=3D "1"
> >          if self.from_feeds:
> >              self._create_custom_config()
> >          else:
> > @@ -346,7 +350,7 @@ class OpkgPM(OpkgDpkgPM):
> >      def write_index(self):
> >          self.deploy_dir_lock()
> >
> > -        result =3D self.indexer.write_index()
> > +        result =3D
> self.indexer.write_index(skip_checksums=3Dself._skip_checksums)
> >
> >          self.deploy_dir_unlock()
>
>
> J=C3=B6rg
>
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>

--000000000000d74d710657d056cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi J=C3=B6rg,<br>- I&#39;ve changed to positive logic<br>-=
 I would rather not change to to_boolean. I&#39;m just moving a line, and i=
ntroducing to_boolean would make it inconsistent with all the other lines w=
here this variable is used. Also=C2=A0BUILD_IMAGES_FROM_FEEDS is undocument=
ed (it is barely used upstream as far as I understand from <a href=3D"https=
://lists.yoctoproject.org/g/yocto/topic/install_externally_built_ipk/112649=
954">https://lists.yoctoproject.org/g/yocto/topic/install_externally_built_=
ipk/112649954</a> ), so acceptable values=C2=A0are not 100% clear to me (ot=
her lines using this variable treat &quot;False&quot; as a positive value s=
ince they call &quot;if d.getVar(&#39;BUILD_IMAGES_FROM_FEEDS&#39;):&quot;,=
 while to_boolean would do the opposite).<br>- I&#39;ve swapped the evaluat=
ion order<br><br><br></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 29, 2026 at 6:31=E2=
=80=AFPM J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimatix.de">=
joerg.sommer@navimatix.de</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Etienne Cordonnier via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> schrieb am Mi 29. Jul, 17:29 (+0200):<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; Computing checksums in the opkg Packages index requires reading every<=
br>
&gt; .ipk file in full.=C2=A0 For a large image with 7000+ packages (includ=
ing<br>
&gt; multi-gigabyte debug packages), this adds 150-300s to every do_rootfs =
run.<br>
&gt; <br>
&gt; Checksums in the Packages index are only meaningful for signed feeds<b=
r>
&gt; (PACKAGE_FEED_SIGN=3D1): the GPG signature covers the Packages index<b=
r>
&gt; which contains the SHA256Sum of each .ipk, forming a chain of trust<br=
>
&gt; that prevents tampered packages being swapped on a remote feed.<br>
&gt; <br>
&gt; For unsigned local file:// feeds the packages are installed directly<b=
r>
&gt; from the build host filesystem where there is no tampering risk.=C2=A0=
 Skip<br>
&gt; all checksum generation in that case by passing no --checksum flags to=
<br>
&gt; opkg-make-index (the tool&#39;s default behaviour when given no flags)=
.<br>
&gt; Pass --force-checksum to opkg so it does not error on the absent<br>
&gt; checksum fields.<br>
&gt; <br>
&gt; On a test image with 7000+ packages (including a 2.3 GB debug<br>
&gt; package): write_index time reduced from ~180s to ~22s (8x speedup)<br>
&gt; when opkg-make-index is configured to produce no checksums by default.=
<br>
&gt; <br>
&gt; See <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3De462f47489f35902b6972f9837d9adfa542fc796" rel=3D"noreferrer" target=3D=
"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3De462f4=
7489f35902b6972f9837d9adfa542fc796</a><br>
&gt; (&quot;Enable sha256 checksums in opkg indexer&quot;, 2019) for the or=
iginal rationale.<br>
&gt; <br>
&gt; AI-Generated: Claude Sonnet 4.6<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oe/package_manager/ipk/__init__.py | 14 +++++++++-----<=
br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe=
/package_manager/ipk/__init__.py<br>
&gt; index 344e0852177..6c0b896a086 100644<br>
&gt; --- a/meta/lib/oe/package_manager/ipk/__init__.py<br>
&gt; +++ b/meta/lib/oe/package_manager/ipk/__init__.py<br>
&gt; @@ -12,7 +12,7 @@ from oe.package_manager import *<br>
&gt;=C2=A0 from oe.package_manager.common_deb_ipk import OpkgDpkgPM<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class OpkgIndexer(Indexer):<br>
&gt; -=C2=A0 =C2=A0 def write_index(self):<br>
&gt; +=C2=A0 =C2=A0 def write_index(self, skip_checksums=3DFalse):<br>
<br>
Suggestion: I would use the positive case (like with_checksums or<br>
use_checksums or build_checksums), because reasoning about/reading code wit=
h<br>
the inverse is more difficult.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch_vars =3D [&quot;ALL_MULTILIB_PA=
CKAGE_ARCHS&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;SDK_PACKAGE_ARCHS&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0]<br>
&gt; @@ -44,8 +44,9 @@ class OpkgIndexer(Indexer):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not o=
s.path.exists(pkgs_file):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 open(pkgs_file, &quot;w&quot;).close()<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index_cmds.ad=
d(&#39;%s --checksum md5 --checksum sha256 -r %s -p %s -m %s %s&#39; %<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (opkg_index_cmd, pkgs_fil=
e, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checksum_args=
 =3D &#39;&#39; if skip_checksums else &#39;--checksum md5 --checksum sha25=
6 &#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index_cmds.ad=
d(&#39;%s %s-r %s -p %s -m %s %s&#39; %<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (opkg_index_cmd, checksum=
_args, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index_si=
gn_files.add(pkgs_file)<br>
&gt;=C2=A0 <br>
&gt; @@ -103,8 +104,12 @@ class OpkgPM(OpkgDpkgPM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.deploy_dir =3D oe.path.join(sel=
f.d.getVar(&#39;WORKDIR&#39;), ipk_repo_workdir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.deploy_lock_file =3D os.path.jo=
in(self.deploy_dir, &quot;deploy.lock&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.opkg_cmd =3D bb.utils.which(os.=
getenv(&#39;PATH&#39;), &quot;opkg&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.from_feeds =3D (self.d.getVar(&#39;B=
UILD_IMAGES_FROM_FEEDS&#39;) or &quot;&quot;) =3D=3D &quot;1&quot;<br>
<br>
Or: bb.utils.to_boolean(...)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._skip_checksums =3D self.d.getVar(&#=
39;PACKAGE_FEED_SIGN&#39;) !=3D &#39;1&#39; and not self.from_feeds<br>
<br>
I would swap them because evaluation of the second one is cheaper.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.opkg_args =3D [&#39;--volatile-=
cache&#39;, &#39;-f&#39;, config_file, &#39;-t&#39;, self.d.expand(&#39;${T=
}/ipktemp/&#39;), &#39;-o&#39;, target_rootfs]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.opkg_args.extend(shlex.split(se=
lf.d.getVar(&quot;OPKG_ARGS&quot;)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._skip_checksums:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.opkg_args.append(&#39;=
--force-checksum&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prepare_index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create_packages_dir(se=
lf.d, self.deploy_dir, d.getVar(&quot;DEPLOY_DIR_IPK&quot;), &quot;package_=
write_ipk&quot;, filterbydependencies)<br>
&gt; @@ -116,7 +121,6 @@ class OpkgPM(OpkgDpkgPM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(self.d.expand(=
&#39;${T}/saved&#39;)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(sel=
f.d.expand(&#39;${T}/saved&#39;))<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.from_feeds =3D (self.d.getVar(&#39;B=
UILD_IMAGES_FROM_FEEDS&#39;) or &quot;&quot;) =3D=3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.from_feeds:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._create_custom_co=
nfig()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; @@ -346,7 +350,7 @@ class OpkgPM(OpkgDpkgPM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def write_index(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.deploy_dir_lock()<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D self.indexer.write_index()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D self.indexer.write_index(skip_=
checksums=3Dself._skip_checksums)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.deploy_dir_unlock()<br>
<br>
<br>
J=C3=B6rg<br>
<br>
-- <br>
Navimatix GmbH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T: 03641 - 327 99 0<=
br>
Tatzendpromenade 2=C2=A0 =C2=A0 =C2=A0 =C2=A0F: 03641 - 526 306<br>
07745 Jena=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://www.navimatix.de" rel=3D"noreferrer" target=3D"_blank">www.navimati=
x.de</a><br>
<br>
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
</blockquote></div>

--000000000000d74d710657d056cc--

