Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D58FD9E10
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 20:31:33 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80040.1772137885840349279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 12:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJPggel9;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35691a231a7so775870a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772137885; cv=none;
        d=google.com; s=arc-20240605;
        b=VkyOIz4aGn/v8dJWB0lwtH1hX2fXsZcfxbvZBUU6DvjXnhsslht1FwOKZyBMUOPtfV
         cZA42CIvPetV8CCIU6ntVSj6vxe8tCMNLxYkhL8+Hftwou4yCcK0AYE95z/M3Ulu3P+r
         hWWiZIcLHaHNwdP89BE4t3AOrRkF3oaMOQdLoKmoG+gnoUNLlLfdly16/5uGeTfB4iAN
         5ceyTEIRdd65uplN476CQU27Wr0NhYzqfd8BUAqweOESs0Y/8d2DMCCdkIkLs0wOpria
         b4UahcEXItVWzbOEcEO1u/lHzRCZ0Kz90UGNVBwisYFBFXOLxcWZ8HgqLm5lf2H3TS+s
         cI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eXXQb8MiJCojvXcTKgnE0vima3hg2VgNQY4pkY/F710=;
        fh=Xw2bylNtTjmsd6x4H07y5+HN9GO8NIN29N/GWgqcqaQ=;
        b=A81IUfn6JF5KR3rR2EfpCqGu0XqBt4EymdpJ6/SCdTBrWwyEjCX0xwEcxOq/9uzwjN
         tImftr1vQqzS5AqTuMpVXBERo45dLL91U9TEp2zKDQNCD8hkkmh9W4KnOKIsvNC3COvZ
         eRqeEa0kFjllsqOYvjrWLtMlQCRfoLkHef2sOyxssLgodBYH9kuQzT63Eri9d4GU9FY3
         Mw0jL4aIXt4PX3Qld/x99vFcFzSv6sv/t5N4N6ppm60oe5JhxcC6tRFx2lpAWfV/kE6v
         nCtdJngxt6XxTqd2lkpb+Xmv/m2xVZiOSewGKUzwhR2wO5PmM1Owmc4rFloC4hBaFVdu
         e7rA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772137885; x=1772742685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXXQb8MiJCojvXcTKgnE0vima3hg2VgNQY4pkY/F710=;
        b=IJPggel9pq7hA3n6fKBQNlthSvHe8NzK8hu4tJXNETEnNk8K2/99ZhlRjvPsFoAwZg
         adR3OZ9Vfb4wS1jt9NuVIIMb5NQjBlzTR8dbqtp5xHyHHnoXrRl8Auf2g1KpEe/kF7FT
         hDIt3YlakaJhAIpc4GR9TgVU/8Dl+n/bpbc6e2M7qYqmJFPeeuyu6RQY2ldpkUf4hZY7
         S/fXPbIXPmz4W3DMxAx2cqJ76GqwH6aaaFoXcQDu+WPh0CPtsEGvhPBKtYwLuRFxDpdd
         6p2WGqVBKrao8wnqoDMU1vf0HBQRIXOjGLMeYOjJJH5L6+eXc+sohNJIDNwmX0fF4sQc
         cXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772137885; x=1772742685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eXXQb8MiJCojvXcTKgnE0vima3hg2VgNQY4pkY/F710=;
        b=O+px2XlEOwH+jabHTDEh8dvjm+b4hHWfYEjsKod5ZOaEhEyjaDGlq+p3dr4hiVZ0Ut
         3Gga7sNQvmRiOfZSIV1PDCRYn6ZnBM46RB4gMk/zQERopR4QXhQ+g479SEC0Q+031AEH
         QxKiTSMfoWRdgpFowPqOF95SaFamzOVeA4LZ52oSc+pm5/38cbJYg6Jv5XhtAUGZ2mMn
         mTD5fddmgtygWk9bunQ9YQxOAERPMEwfIo0R7ylwodDGhO/0DXBSqIn5Frug0dKWC7o0
         vitEIDrfgcbqsZ0jViyVVDH2AXvWI6kBYSK5+LMdkz+6fIkdDta0i+1M2+xajW3oc7SE
         pxDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq0hhNyTqopAO7Yu0qnq4NvJXw9rTIHTHuvXJgHyRaDMPpe4G9lBhQnb82OCkJGUsKGpQE8t/95mUl68kZQiIZGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7ai2dNKysGUJzVlCI8zQJpzdQEZ3unOKrYZasSPQR3QAk1cSy
	CswF4Xws37NmpqypVkUeqbm+DIA8AIvXpr5pncx9VkiIcHSRIqI9RRtTmmPCSd2JUki6BgBIM7H
	W7TbnvqVPX9gvA1ouyCgpPytVSWbbk7q8v1ZZqnE=
X-Gm-Gg: ATEYQzzV9wfiwZl+fVsAesd3axrF2asGbjtpYbBgvUWScQgyjDcwJzNvwmMmbwmfuN8
	YnRn7gnp/lxZjfcApQoX1SDvaYHtNxSxZSSLPP3vWHj8/+5xToR49BFZnpFvFOt4rXoSG2cyO2J
	i5fKNdnygP9K/N7/5yauDKwWaUKUmb6zlK98+svW5YHT6i32DE+8PE5f7dm8MTwQ1UWAOKkAb0i
	WVzhlxT8jkj70XnAdxyXYIcva5XTe7u7pmMReHdyqCYmTD1+wRi/mxMMWmvo6lPosutklRcBvBL
	zo6fnyecK06T5Xkc5A==
X-Received: by 2002:a17:90b:1f8f:b0:354:a57c:65db with SMTP id
 98e67ed59e1d1-35965c926a7mr302782a91.20.1772137885090; Thu, 26 Feb 2026
 12:31:25 -0800 (PST)
MIME-Version: 1.0
References: <ba0a57bc87f3563f43f46f663e1733fd552a7a03.camel@pbarker.dev>
 <089b277ea34cd0d9246e9eef717ae5d9d9ad9527.camel@linuxfoundation.org> <790134e9-2a3e-4029-91a9-98df0b05b8cd@baylibre.com>
In-Reply-To: <790134e9-2a3e-4029-91a9-98df0b05b8cd@baylibre.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 27 Feb 2026 09:31:14 +1300
X-Gm-Features: AaiRm52ajhA_JcKz29g1k4ccoQh9OphPvLHePPLCgqX807lDPF4Th20Kg8HSJJc
Message-ID: <CADySD0Hi8jDq7uZa+J__znnXNMBKoe4fsnt5BErsuRyOVydB0w@mail.gmail.com>
Subject: Re: [OE-core] [Openembedded-architecture] Improving DISTRO_FEATURES
 backfill & opt-out
To: tgamblin@baylibre.com
Cc: richard.purdie@linuxfoundation.org, paul@pbarker.dev, 
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 20:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232062

On Fri, Feb 27, 2026 at 3:07=E2=80=AFAM Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
>
> On 2026-02-26 07:03, Richard Purdie via lists.openembedded.org wrote:
> > On Thu, 2026-02-26 at 09:59 +0000, Paul Barker via lists.openembedded.o=
rg wrote:
> >> 3) Merge the current contents of `DISTRO_FEATURES_BACKFILL` into
> >>     `DISTRO_FEATURES_DEFAULT`. This variable will be filtered to disab=
le
> >>     any items listed in `DISTRO_FEATURES_OPTOUT` before use, efficient=
ly
> >>     and without the use of `:remove`. Deprecate
> >>     `DISTRO_FEATURES_BACKFILL` and `DISTRO_FEATURES_BACKFILL_CONSIDERE=
D`,
> >>     issuing warnings if either is used.
> >>
> >> What does that look like practically? Something like this I think:
> >>
> >>      DISTRO_FEATURES_BASELINE =3D " \
> >>          acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget=
 \
> >>          usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp \
> >>          pulseaudio gobject-introspection-data ldconfig \
> >>      "
> >>
> >>      DISTRO_FEATURES_DEFAULT =3D "${@filter_default_features('DISTRO_F=
EATURES', d)}"
> >>      DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
> >>
> >>      DISTRO_FEATURES_OPTOUT ?=3D "${DISTRO_FEATURES_BACKFILL_CONSIDERE=
D}"
> >>
> >>      def filter_default_features(varname, d):
> >>          baseline_features =3D (d.getVar(varname + "_BASELINE") or "")=
.split()
> >>          optout_features =3D (d.getVar(varname + "_OPTOUT") or "").spl=
it()
> >>
> >>          return [feature for feature in baseline_features \
> >>                  if feature not in optout_features]
> >>
> >> (un-tested, may also need some tweaks for performance)
> >>
> >> Applying the filtering as part of the definition of
> >> `DISTRO_FEATURES_DEFAULT` makes it easy to use. If you're already usin=
g
> >> `DISTRO_FEATURES_DEFAULT:remove` or `DISTRO_FEATURES:remove`, these wi=
ll
> >> still work, though we'd encourage you to adopt the new
> >> `DISTRO_FEATURES_OPTOUT` variable. If you're using
> >> `DISTRO_FEATURES_BACKFILL_CONSIDERED`, this would still work but our
> >> encouragement would be louder - we can issue a warning if this is set
> >> saying that it is deprecated and will be removed in a future release.
> >>
> >> There is one group adversely impacted by this change - anyone who
> >> defines `DISTRO_FEATURES` fully themselves without including
> >> `DISTRO_FEATURES_DEFAULT` will need to manually add the backfilled
> >> features (pulseaudio, gobject-introspection-data & ldconfig) or adapt
> >> how they set `DISTRO_FEATURES`. Personally I think that having to adap=
t
> >> to this will not be difficult and it can be well documented as part of
> >> the release notes and migration guide.
> >>
> >> A patch to implement the change should be straightforward, it may need=
 a
> >> little effort to address any fall out before release. There are no tes=
ts
> >> for the `DISTRO_FEATURES_BACKFILL` logic right now, tests for the
> >> filtering and opt-out variable can be added along with this change.
> >> Impact on the autobuilder should be minimal, I think this is something
> >> we can take in with little risk to the core project so it is unlike th=
e
> >> proposal to change the default init system for poky. The impact is
> >> mostly on users who define their own distro, and we can make migration
> >> as easy as possible as outlined above. I should be able to get this in
> >> before the M3 build if we want to go ahead with this change before the
> >> LTS.
> >>
> >> We can extend this to `MACHINE_FEATURES_DEFAULT` as well, deprecating
> >> `MACHINE_FEATURES_BACKFILL` and `MACHINE_FEATURES_BACKFILL_CONSIDERED`=
.
> >>
> >> Thoughts and opinions?
> > Keeping DISTRO_FEATURES_DEFAULT around but changing it's meaning does
> > make me worry about the transition a lot. I also worry a bit about
> > "default" meaning different things to different people.
> >
> > After we previously discussed it, I'd had a slightly different take on
> > what we might do. I was thinking that we might:
> >
> > Rename:
> >    DISTRO_FEATURES_BACKFILL -> DISTRO_FEATURES_OPTOUT
> >    DISTRO_FEATURES_BACKFILL_CONSIDERED -> DISTRO_FEATURES_OPTOUT_CONSID=
ERED
> >
> > and then move the contents of DISTRO_FEATURES_DEFAULT into
> > DISTRO_FEATURES_OPTOUT.
> >
> > This would make features in "optout" the default, unless you set them
> > as 'considered'.
> >
> > You could perhaps have a DISTRO_FEATURES_OPTEDOUT?
> >

IMO, OPTOUT vs OPTEDOUT is going to cause further confusion.

> > Is is probably a question of finding the right naming for them. We need
> > a core way to say "these are the defaults" and then a "remove these
> > from the defaults as we explicitly don't want them".
>
> As far as naming goes, when I read "DISTRO_FEATURES_OPTOUT" my mind
> assumes whatever is in that list will be filtered from the default. I
> think that's what Paul is suggesting, so I'm in favour of that approach.
> I also looked through the variables glossary quickly for EXCLUDE and
> found:
> https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-PACKAGE_=
EXCLUDE
> Could "DISTRO_FEATURES_EXCLUDE" be a viable name that stays somewhat
> inline with what we're doing there?
>

I am also more in favor of explicit variable naming like
DISTRO_FEATURES_INCLUDE and DISTRO_FEATURE_EXCLUDE.
It should also encourage less (or no) use of `:remove`.

cheers
Ankur

> Trevor
> >
> > So having said all that, perhaps we can cheat and use:
> >
> > DISTRO_FEATURES_DEFAULTS and DISTRO_FEATURES_OPTOUT
> >
> > which would remove the namespace clash issue?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232028): https://lists.openembedded.org/g/openembedde=
d-core/message/232028
> Mute This Topic: https://lists.openembedded.org/mt/118010724/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

