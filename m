Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2E7C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 12:05:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.12332.1706702710202200736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 04:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Imf9RNPn;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cf4d2175b2so49813981fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 04:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706702708; x=1707307508; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1QONP5cE+87lpehE/44BCUa5bKZOaij1PdKQUtxI/H4=;
        b=Imf9RNPnN55eqOyYBS7euHeNRns0USg0R1z4hMLcincLwcmp1I5M2xkXkL00YW9iPs
         KCQfZMC1z47Rd7Q4t/4Nh5yfAGuw7J/tkhkgMbYn4qttavcarC0RCpFCwUJWK6utox2l
         nO8RouAJ2sK/ORsKX0CEXuX2jOcjwPt/jrcKHNZuJ/74TFgB6y4Y8yE406+Yuy3rL92M
         IHKMQHHfnMi2Q1zbwURexEvsZa8MKzq5NeNL5SHxOap2dXYVxLHT8D9um+c7y2t+DR6c
         LmBizpAXxpO8mXV5xB0TuTQB9gTxwEJxpbfKk5owJvHU1Q2MW0m4eFOoyvdQfIcjdRRo
         D9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702708; x=1707307508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QONP5cE+87lpehE/44BCUa5bKZOaij1PdKQUtxI/H4=;
        b=PBHcwnBdP60GuVDjIT21bWOfWcsSKZHlhNONQkl2wU6NRioEb14pn0llWjojqJFZGs
         zSkeDmzrMkNTwdNhwl5n3ShBaUnNJhhRxbbu5ktWggNQnR2AKD0ZEAYeylKsiqY8PDPX
         26J7/Pe/arqphRyUNSsyJdyj/sYiO2SNav7sj5U7XqCobc2mI5oqcB2nAUfKJ+HrEXbo
         BCrR9Bz6qMRruFTQiY4hIJzE8ob2gGxxYpptB0Pu84ZPzQ1CqOBIOLcFM0/QH9RbBAb/
         ip5A95NGaPxO/OCSA55BZTj1/Rz2X4DZjOlM5X+SjlTrhQ7BF7mZEJUMQgRywnMZj68U
         KX/A==
X-Gm-Message-State: AOJu0Yy1AdUfxOOvWxjoLIg0RiBCFTV19oR/tNqe76wwKzSQeFktBnCA
	IkeYJt1HupNHqdzLppMDqQWYCeBJJQhPl+SElUJk1yl0Q7y8TWM8aBn+uRTraIB5jKUekTVacFC
	HptMtE5ONWoSfM0MMW8t2KDBPrSItRFoF
X-Google-Smtp-Source: AGHT+IHaph6kZnzReydwPn7QrzuoCak4mM2x46gpwsSFeauUy/DBGGst9JqvSgj1t15MdYQ0SHVIZfWkuPCZISfApz4=
X-Received: by 2002:a2e:b058:0:b0:2d0:5f2e:5b3d with SMTP id
 d24-20020a2eb058000000b002d05f2e5b3dmr1005721ljl.11.1706702708001; Wed, 31
 Jan 2024 04:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20240129180629.1631473-1-alex@linutronix.de> <DB5PR02MB102136F693D00ED0CC4681D6CEF7C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102136F693D00ED0CC4681D6CEF7C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Jan 2024 13:04:56 +0100
Message-ID: <CANNYZj_4-Wv9ki3+Pb6wWi4npt5993Veme3=QGT54wX19_naZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/package_rpm: correctly escape percent characters
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 12:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194517

Thanks, I sent patches for both.

Alex

On Wed, 31 Jan 2024 at 02:07, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 29 januari 2024 19:06
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex@linutronix.de>
> > Subject: [OE-core] [PATCH] classes/package_rpm: correctly escape percent characters
> >
> > This many characters doesn't work with rpm 4.19 packaging
> > (as shown by nodejs recipes), and per documentation a single escape
> > is enough:
> >
> > https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/spec.md#shell-globbing
> >
> > It also should be done in a function, and just before writing out the
> > corrected filename to .spec, not earlier where the path may still
> > be needed for file operations (such as gettings file attributes).
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes-global/package_rpm.bbclass | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> > index e0f4de42a15..819ee502783 100644
> > --- a/meta/classes-global/package_rpm.bbclass
> > +++ b/meta/classes-global/package_rpm.bbclass
> > @@ -216,10 +216,12 @@ python write_specfile () {
> >                      raise e
> >                  return "%attr({:o},{},{}) ".format(mode, owner, group)
> >
> > +            def escape_chars(p):
> > +                return p.replace("%", "%%")
>
>
> Based on the documentation linked to above, wouldn't it be a good idea to
> handle \ and " as well? E.g.:
>
>                 return p.replace("%", "%%").replace("\\", "\\\\").replace('"', '\\"'))
>
> > +
> >              path = rootpath.replace(walkpath, "")
> >              if path.endswith("DEBIAN") or path.endswith("CONTROL"):
> >                  continue
> > -            path = path.replace("%", "%%%%%%%%")
> >
> >              # Treat all symlinks to directories as normal files.
> >              # os.walk() lists them as directories.
> > @@ -238,29 +240,27 @@ python write_specfile () {
> >                  for dir in dirs:
> >                      if dir == "CONTROL" or dir == "DEBIAN":
> >                          continue
> > -                    dir = dir.replace("%", "%%%%%%%%")
> >                      p = path + '/' + dir
> >                      # All packages own the directories their files are in...
> > -                    target.append(get_attr(dir) + '%dir "' + p + '"')
> > +                    target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
> >              else:
> >                  # packages own only empty directories or explict directory.
> >                  # This will prevent the overlapping of security permission.
> >                  attr = get_attr(path)
> >                  if path and not files and not dirs:
> > -                    target.append(attr + '%dir "' + path + '"')
> > +                    target.append(attr + '%dir "' + escape_chars(path) + '"')
> >                  elif path and path in dirfiles:
> > -                    target.append(attr + '%dir "' + path + '"')
> > +                    target.append(attr + '%dir "' + escape_chars(path) + '"')
>
> The above can be simplified to:
>
>             elif path:
>                 # packages own only empty directories or explict directory.
>                 # This will prevent the overlapping of security permission.
>                 attr = get_attr(path)
>                 if (not files and not dirs) or path in dirfiles:
>                     target.append(attr + '%dir "' + escape_chars(path) + '"')
>
> >
> >              for file in files:
> >                  if file == "CONTROL" or file == "DEBIAN":
> >                      continue
> > -                file = file.replace("%", "%%%%%%%%")
> >                  attr = get_attr(file)
> >                  p = path + '/' + file
> >                  if conffiles.count(p):
> > -                    target.append(attr + '%config "' + p + '"')
> > +                    target.append(attr + '%config "' + escape_chars(p) + '"')
> >                  else:
> > -                    target.append(attr + '"' + p + '"')
> > +                    target.append(attr + '"' + escape_chars(p) + '"')
> >
> >      # Prevent the prerm/postrm scripts from being run during an upgrade
> >      def wrap_uninstall(scriptvar):
> > --
> > 2.39.2
>
> //Peter
>

