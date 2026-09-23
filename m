Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAB9C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 17:06:46 +0000 (UTC)
Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.413.1790183087919570359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 10:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I/YxxfGY;
 spf=pass (domain: gmail.com, ip: 74.125.231.99, mailfrom: collin.funk1@gmail.com)
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-4881ca701a4so741396fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790183087; x=1790787887; darn=lists.openembedded.org;
        h=content-type:mime-version:user-agent:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mf76T8GqTm1fP0JlC4zyV4o7WiSZrU+lw21HfyEIpdk=;
        b=I/YxxfGYalL8VRtrMvUURuI6u2X0UB50Eu9SGabCK7c4qbwccnwagX6KLefiBK8HjU
         s/ul2AhGHAz78nh8DINxtmH5U7jcmKlxqBLMfRCB9N5W90cv0GHd2J9jWMq/L/1VABNK
         uUejO0LL9QOCWVWoqoa8104HPDv1kykkVGcmIzKdn2HSg0hM8pniYjI0r+rzf+/SMKyl
         rb7eoGeJ3ky1NQYlZbDaNVCeDKZN4vc/mkVGVhgEU76PaoJhXj7bKURws4rZnCexFTMZ
         XP24Tx2IVwgeYwGXf8jgIk5CN9NDdAO7hL/K+zphgGw21nrEA6A1BILriw0qCVXJLIEV
         Nwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183087; x=1790787887;
        h=content-type:mime-version:user-agent:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mf76T8GqTm1fP0JlC4zyV4o7WiSZrU+lw21HfyEIpdk=;
        b=V/lpTBnmB5CeZBJYJ59DSl1J/XjTFRaanN0yaqiNpFYNU2M5j3JQD7bThvacXEeV8G
         gT8Dd6PuOvw1gv4x42WqlWdFVZPU6KSARyLme45EpCv1DRAHrpFRCLkGZC37k2GuyL3z
         mhuLX/6wzXW/0LXjrACorPAAQLDroau7u8O9oRFh4ImcwbCH32jddmPGgObW0GaKW78m
         eDG4M3lNhKBhpsjca/eJJG6kfINgqk9oujBxP1Jrcfo1Hpb6UItxfZ0DC/lOh6Tju45h
         YyG7NV2jGZE+VzG89/38shtZJJ45n9huSE7fUh8pC0EzpYjB/dxKNYe48eUid5MCY11F
         fJKA==
X-Gm-Message-State: AFuF++m851rqUaTpfzyJaS7ZqPDRgLeeF33xP1gQD/6Qw9vqAg0FDH6x
	WZLbA7ycWYyM9FtnjFZcS/Uc1qerDO9Wqfgn1dVdCrRC3WnKZ0gw+iH1L82zBvYV
X-Gm-Gg: AYBFou0VTvYCHIeaoLZK3JXv8syGlKSVT1DZus9UhIv0YrbRQJSXSB4g82m9pu+o74b
	jJGxqXadYcG/k1D5i7cxu3YxM/06oex29XwFE8YePsqvDxXBkzel38STgMA31IojXY2/dSMKmFa
	GCLS5wtl8pohGsMFlFLblTSGgtLzZvfxQ51MbIQYLivdNYMF2dumMAS1vCoVpK//o5fByATDtjg
	Fzwmm2qVBaDjClfVxcxqoV5CBQPmJFP+S2htieZbz1P5ptCMaXZjUeUVKWIgV/CHIcGZPRhw1rS
	dNrpmcdF62rtEggWVXv8SqL7CGQEQllduPwP4eXQbdThy9Wv47hlHp8gT9QpnWpenXHZtGN7SGM
	mIJZ4zUOVw0Aeum9mWLHbRL/VkF/NI5ONvAmmcMg0NuUHNebDxRy1lsro4l1hehl1GNC85sZn5I
	40OdM7EaIUHFgt9PubUbYxBlAvizYRN57Nw5O5DZoUuzkuwVOIYC1bI4HV27TRglbImoOAYvlAU
	s0xORU+snSMhbKQSPKbijzvHlBecN93c0Tj24NqfMg=
X-Received: by 2002:a05:7022:38d:b0:144:f480:3541 with SMTP id a92af1059eb24-144f90f7b09mr4434069c88.21.1790182734510;
        Wed, 23 Sep 2026 09:58:54 -0700 (PDT)
Received: from XTHCYRY1WD-Collin-Funk ([2601:646:8081:3770:e1d7:3940:b36a:50d2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm9233404c88.6.2026.09.23.09.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:58:54 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: Re: PATCH] coreutils: Upgrade 9.11 -> 9.12
Date: Wed, 23 Sep 2026 09:58:53 -0700
Message-ID: <m1tsnfoqeq.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 17:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246532

Hi Leon,

Leon Anavi wrote:

> Upgrade to release 9.12. Drop backported patches that are now part
> of this release. Notable changes include:
> 
> - env supports a new --env0-from=FILE option to support
>   full persistence and restoration of the environment.
>   This also supports e.g. filtering like:
>     env -i --env0-from=<( env -0 | sed -z ... )
> 
> - Commands now have safer terminal output,
>   avoiding confusing output or corrupted terminal state.
> 
> - Commands that traverse directories no longer
>   fail merely if files are being removed in parallel.
> 
> - ptx has improved robustness, avoiding potential infinite loops.
> 
> - tee fixes robustness issues introduced in the previous release,
>   where it could go into an infinite loop or incorrectly error
>   in the presence of short writes.
> 
> - stty is more accepting of variations in requested speed.
> 
> - sort(1) will now better use available memory
>   and parallel operation when reading from pipes.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>

For context, I co-maintain GNU coreutils. In coreutils-9.12, we added
quoting to 'env' and 'printenv'. A large part of the rationale was
improved robustness, avoiding applications getting confused with
environment variables that may have newlines or other strange
characters. Here is the old behavior:

    $ env -i ENV='hello'$'\n''FAKE_ENV=goodbye' env
    ENV=hello
    FAKE_ENV=goodbye

Here is the new behavior, making it clear that FAKE_ENV is not an
environment variable:

    $ env -i ENV='hello'$'\n''FAKE_ENV=goodbye' ~/.local/bin/env
    ENV='hello'$'\n''FAKE_ENV=goodbye'

However, this caused some issues that we did not foresee from our
scanning of Debian Code Search [1] [2].

I suggest applying the patch that we committed quickly after the
release, which does not quote when standard output is not a terminal
[3].

Collin

[1] https://lists.gnu.org/archive/html/coreutils/2026-09/msg00061.html
[2] https://lists.gnu.org/archive/html/coreutils/2026-09/msg00062.html
[3] https://github.com/coreutils/coreutils/commit/782a1e5bc2090212273bb731dceee2cc2a071e54

