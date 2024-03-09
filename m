Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A16C54798
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 16:39:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.15746.1710002365973308168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 08:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNprxFvW;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d220e39907so46619941fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710002364; x=1710607164; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJlLKN0wLLc1RUn2hjvc52SdbApKtjX47WHTSIprflM=;
        b=lNprxFvWvVhjUOEs4ai7XraOE8SG3NDQf+2F3w19Zo5MulghnHftiGLUa37yb7/jHX
         mPaB9HUHjR6PJxUqg4Lsd6yBlH4zFnBb4uNl5JULV1gFzkPspIadcDlIzBtiXrzU1uj3
         y3c5m62Em93gTTZWtj+pdosxd1quTMC0GB4bm+yNptMvJrgp9E/65So4rEne2GbLAnUt
         IeiL8GEMvn1BXdbDtD95CBYhhN0KEQBFcd2hDyRueoakbPN4m8Y0vCymZsX1dErYDe96
         FYxul20DL28Px8Gpg0R4CA2VSsZoxz49l6DPb0jLwd54ORetnRe2H1LqTlDnV904z4B8
         0hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710002364; x=1710607164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJlLKN0wLLc1RUn2hjvc52SdbApKtjX47WHTSIprflM=;
        b=bDqAQkR6yH8H/jHVKrNwXuNzdqaedYtpP5jhbqKDzh5SfNixvqo+abRO0VCKiCp1DZ
         ufOyl/Jbqh5tcHgtxQUsQIeJmG1dJz4X6lWbLYvc0u+gS2HKKZAbybZJi/rVFoiOmVV9
         DW6f+4CDr76ogkvV3CFX/LCothWT4Rg1IjW1LPai22BZYFJcI/DisSyGCfloKZsNFqGk
         ju4FN4jzYrubLLPbL2K+pPVc3VCGTonYJfj6MAxnm9RYTrZmaukHTMT7PX8EiO3UWMJq
         BfTCvooSrQfyeRRFKzkg+QWu2/7W0VXkHijotj7lgglQ0NnCVgR0yZHGWWQ5dF5dyCOd
         8IMw==
X-Gm-Message-State: AOJu0YyRQlATGnazOWrnULToDohlNH3vDyBpCKt9048X/GeInxSRi2Tz
	HQEU3BXGac7ux44xIOkirtiLziZaaB6zYXiG1zsPd3uUY5TcfAlhmiiY9Dnh6apjlyfywrYGzWb
	+GAXYHWIpk6O02sAOd0bodXCfFI0=
X-Google-Smtp-Source: AGHT+IGERTiW/vcqWM11umUdm9yyMGNXf/DGWR3nWpR7jT3meuyLX6lj5u/RN7ZXROFzq15xHkzKNbeF8aeYIwS4SUA=
X-Received: by 2002:a2e:9e01:0:b0:2d3:d71:98d3 with SMTP id
 e1-20020a2e9e01000000b002d30d7198d3mr1659948ljk.29.1710002363703; Sat, 09 Mar
 2024 08:39:23 -0800 (PST)
MIME-Version: 1.0
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
In-Reply-To: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Mar 2024 17:39:12 +0100
Message-ID: <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com>
Subject: Re: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
 (was: BB Equivalent for %config(noreplace))
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 16:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196869

I think (noreplace) flag only matters when the file has been manually
edited after rpm installation and its checksum diverges from what is
registered in rpm database. Which is not a common scenario in
embedded. If you manually edit the file on target, you might as well
manually resolve which version you want after the update as both are
available regardless of whether (noreplace) was used or not. Or
perhaps merge the manual edits into the new version.

Alex

On Fri, 8 Mar 2024 at 12:20, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> Hi,
>
> I just found out that if an updated package ships a modified
> configuration file, then the Yocto package upgrade does this:
>
> * rename the edited conffile to conffile.rpmsave
> * install the new, modified one from the package
>
> instead of:
>
> * keep the edited conffile intact
> * install the new, modified one from the package as conffile.rpmnew
>
> I think this is what was asked in 2017 here:
> https://docs.yoctoproject.org/pipermail/yocto/2017-May/036031.html
>
> The answer was a little uninformed about saying that using
> CONFFILES is the fix, because rpm can behave two ways, see above.
>
> Yocto, to this day, uses "%config /path/to/conffile" instead of
> "%config(noreplace) /path/to/conffile" in package_rpm.bbclass.
> The latter would behave as "keep modified conffile + install conffile.rpm=
new".
>
> What's the official stance on this behaviour?
> Is it a known issue?
> Is this what the project would expect from a package upgrade?
>
> FWIW, this one liner would change the behaviour:
>
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
> index 2e3e4e8c79..6610115849 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -256,7 +256,7 @@ python write_specfile () {
>                   attr =3D get_attr(file)
>                   p =3D path + '/' + file
>                   if conffiles.count(p):
> -                    target.append(attr + '%config "' + escape_chars(p) +=
 '"')
> +                    target.append(attr + '%config(noreplace) "' + escape=
_chars(p) + '"')
>                   else:
>                       target.append(attr + '"' + escape_chars(p) + '"')
>
>
> Maybe it's better to make it conditional on a different variable:
>
> CONFFILES_MODE =3D "keepold"
> vs
> CONFFILES_MODE =3D "installnew"
>
> and the patch would be something like this below (untested),
> keeping the current behaviour as default:
>
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
> index 2e3e4e8c79..f0651d69ba 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -191,7 +191,7 @@ python write_specfile () {
>                   if not len(depends_dict[dep]):
>                       array.append("%s: %s" % (tag, dep))
>
> -    def walk_files(walkpath, target, conffiles, dirfiles):
> +    def walk_files(d, walkpath, target, conffiles, dirfiles):
>           # We can race against the ipk/deb backends which create CONTROL=
 or DEBIAN
> directories
>           # when packaging. We just ignore these files which are created =
in
>           # packages-split/ and not package/
> @@ -250,13 +250,19 @@ python write_specfile () {
>                   if (not files and not dirs) or path in dirfiles:
>                       target.append(attr + '%dir "' + escape_chars(path) =
+ '"')
>
> +            conffiles_mode =3D d.getVar("CONFFILES_MODE") or "installnew=
"
> +            if conffiles_mode !=3D "installnew" and conffiles_mode !=3D =
"keepold":
> +                conffiles_mode =3D "installnew"
>               for file in files:
>                   if file =3D=3D "CONTROL" or file =3D=3D "DEBIAN":
>                       continue
>                   attr =3D get_attr(file)
>                   p =3D path + '/' + file
>                   if conffiles.count(p):
> -                    target.append(attr + '%config "' + escape_chars(p) +=
 '"')
> +                    if conffiles_mode =3D=3D "keepold":
> +                        target.append(attr + '%config(noreplace) "' + es=
cape_chars(p) + '"')
> +                    else:
> +                        target.append(attr + '%config "' + escape_chars(=
p) + '"')
>                   else:
>                       target.append(attr + '"' + escape_chars(p) + '"')
>
> @@ -430,7 +436,7 @@ python write_specfile () {
>               srcrpostrm     =3D splitrpostrm
>
>               file_list =3D []
> -            walk_files(root, file_list, conffiles, dirfiles)
> +            walk_files(localdata, root, file_list, conffiles, dirfiles)
>               if not file_list and localdata.getVar('ALLOW_EMPTY', False)=
 !=3D "1":
>                   bb.note("Not creating empty RPM package for %s" % split=
name)
>               else:
> @@ -522,7 +528,7 @@ python write_specfile () {
>
>           # Now process files
>           file_list =3D []
> -        walk_files(root, file_list, conffiles, dirfiles)
> +        walk_files(localdata, root, file_list, conffiles, dirfiles)
>           if not file_list and localdata.getVar('ALLOW_EMPTY', False) !=
=3D "1":
>               bb.note("Not creating empty RPM package for %s" % splitname=
)
>           else:
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196848): https://lists.openembedded.org/g/openembedde=
d-core/message/196848
> Mute This Topic: https://lists.openembedded.org/mt/104806483/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

