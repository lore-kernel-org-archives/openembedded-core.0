Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7E4C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 17:27:45 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.620.1706549257911504161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 09:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaHLqLNj;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cf3a0b2355so36549241fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 09:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706549256; x=1707154056; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5XgGtROPA427WWzilkaTcd4VD/pogF+OobXXOUIe+Y=;
        b=JaHLqLNj5GlFXmkSyR/6wSDVsOFAfKwd8pLoOVL14JB5wyU2MK+WnwTCMmbaKirQbq
         rYgUQ7witEYax55nDv6ItOu2aW8Zvw4qrgU3EiWib6vewWwo1j0cgNovM6me+v5Mj2D+
         yw+/C92w7+URcHYjtzlP0MG1oTup79UqyCjEwbp/SIbUx/HlqQiQ0TvWZMRIXPQYuOsQ
         k79JbQSNLQaskeczAIPl5ny7AEoDGXcy6L7ubjZ3s1hhUtGZrnieKx0SYy5Q4LGIKb09
         pHR0G3hhpeW75+1yLhY4URMDOjwrp8y6xQUnACPittds/OU4fE2QZGHiNTk3gk8EbjTX
         NNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549256; x=1707154056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5XgGtROPA427WWzilkaTcd4VD/pogF+OobXXOUIe+Y=;
        b=tWPvsMFzZLoBViLsUF9ox5oxScQiC4b8wJxPwxZbT3zPY5arWC37h9+OafWVH9/0xX
         0LsR7v8TxH0VFTDqQTNazbx47utBH2BHDdJtIiu6WfI0nbOCgLMLtS3NGDSX1WN+QJ4f
         IkK96LHE3UdaJPz77wLFyQIVg/xqiBDN1eOwHAVDjK+SsD+jBRsK5WfxSXHJLC6hpPmX
         VQWpXZ6liE4NYJ6xzYxuPLsa9VojftXibh9R2swJNvK6zm7gEJetwGPeFnnhgIv0PI2t
         asal4oO8dgsxOxSepe80zWSwxZr7R9iMqILKClcMKLm4RQMYaTVCnsnCBqPGTnm9WDis
         OTYw==
X-Gm-Message-State: AOJu0Yw2Ed2kEvblDu2eh/RLLL4JJ+ru9MvnyZOvNeIeuJOs5+9g3ghU
	41d4xl41zdCKt6/BiE2yv+Zcb+Swoi90GgceSD0xKU/mwZEBMg2MSdIMpuj3OghY/+gUKkyOLwk
	eShaMskUMBAXDcSPGY/XR9wgTGe8=
X-Google-Smtp-Source: AGHT+IEAesmA7g0eugQDIEfKAKX9LI13ZxkyoCZ8/BdrKVme3awjchBPzuicU9LESIZJJbovVUN/9JlKY5UxgYAz0h4=
X-Received: by 2002:a05:651c:201d:b0:2d0:50c0:41e5 with SMTP id
 s29-20020a05651c201d00b002d050c041e5mr1525274ljo.9.1706549255369; Mon, 29 Jan
 2024 09:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20240129115709.3517246-1-alex@linutronix.de> <08217121-3007-4a2c-b8b9-3795ac983a95@kernel.crashing.org>
In-Reply-To: <08217121-3007-4a2c-b8b9-3795ac983a95@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Jan 2024 18:27:24 +0100
Message-ID: <CANNYZj_TvZr6y18vr+4j-+-gY29u4Yfz_=c6rgq7ztdZnF_HAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/package_rpm: do not mangle filenames
 with % in them
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 17:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194470

The documentation says:

The usual rules for shell globbing apply (see `glob(7)`), including brace
expansion.  Metacharacters can be escaped by prefixing them with a backslash
(`\`).  Spaces are used to separate file names and must also be escaped.
Enclosing a file name in double quotes (`"`) preserves the literal value of all
characters within the quotes, with the exception of `\` and the percent sign
(`%`).  A `\` or `%` can be escaped with an extra `\` or `%`, respectively.  A
double quote can be escaped with a `\`.

https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/spec.md#shell-globbing

So I think we simply need to replace % with %%, and only just before
it's written into the spec file - current code does it far too early,
rendering the paths unusable in regular file operations.


Alex



On Mon, 29 Jan 2024 at 17:43, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
> Due to the RPM macro language, you can end up with something like this:
>
> %define foo bar
>
> (files section):
>
> /path/dir/%foo
>
> Then when the %files is parsed you end up with:
>
> /path/dir/bar
>
> The processing of the files says "well that doesn't exist, so I won't package it."
>
>
> For RPM 5.... it was determined the only save way to prevent the expansion was
> that horrible set of components.  (And I mean HORRIBLE!)
>
>
> So before this is removed, we really need someone to test the RPM 4.19 behavior
> and verify that it does NOT expand the '%" in ways that we don't want.
>
> (the above was all from memory.  So there may have been other nuances involved.
>
> If I remember correctly the preferred format for regular replacement macros
> should be "%{macro}".  But there are/were internals in place like sections
> heads, functional macros (like %configure) and similar that were used.
>
>
> I wish I could remember the exact place this failed in the past, but that
> appears to be lost in time.  For all I know it was "/path/dir/foo %bar".  (Yes
> I've seen some horrible filenames in my time.
>
> --Mark
>
> On 1/29/24 5:57 AM, Alexander Kanavin wrote:
> > This causes problems in rpm 4.19 packaging of recipes such as nodejs,
> > and isn't actually necessary anymore (was added many years ago
> > against rpm 5.x fork).
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/classes-global/package_rpm.bbclass | 3 ---
> >   1 file changed, 3 deletions(-)
> >
> > diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> > index e0f4de42a15..767f1e21b6e 100644
> > --- a/meta/classes-global/package_rpm.bbclass
> > +++ b/meta/classes-global/package_rpm.bbclass
> > @@ -219,7 +219,6 @@ python write_specfile () {
> >               path = rootpath.replace(walkpath, "")
> >               if path.endswith("DEBIAN") or path.endswith("CONTROL"):
> >                   continue
> > -            path = path.replace("%", "%%%%%%%%")
> >
> >               # Treat all symlinks to directories as normal files.
> >               # os.walk() lists them as directories.
> > @@ -238,7 +237,6 @@ python write_specfile () {
> >                   for dir in dirs:
> >                       if dir == "CONTROL" or dir == "DEBIAN":
> >                           continue
> > -                    dir = dir.replace("%", "%%%%%%%%")
> >                       p = path + '/' + dir
> >                       # All packages own the directories their files are in...
> >                       target.append(get_attr(dir) + '%dir "' + p + '"')
> > @@ -254,7 +252,6 @@ python write_specfile () {
> >               for file in files:
> >                   if file == "CONTROL" or file == "DEBIAN":
> >                       continue
> > -                file = file.replace("%", "%%%%%%%%")
> >                   attr = get_attr(file)
> >                   p = path + '/' + file
> >                   if conffiles.count(p):
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194456): https://lists.openembedded.org/g/openembedded-core/message/194456
> > Mute This Topic: https://lists.openembedded.org/mt/104029566/3616948
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

