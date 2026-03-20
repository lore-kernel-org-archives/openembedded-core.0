Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3221091914
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:48:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11807.1774010928124753137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hhsGUaT6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-487012ce896so2631445e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774010926; x=1774615726; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Te07/bZjhBn07Kt99CwFpDIUzeRGSn+5ybu2tGtNfmM=;
        b=hhsGUaT68VA+BXuHuri/NiCzJa6AJB+fTqqq8t9M2tNDUMQ7GXZSkHNNuNOfqA/fUM
         qnraGrZw6SaBngS1PL+fNJTDNbhCfeiP6Oqskqkm0lSH4NSaCVdHNcIJMEV5YhYYk2O0
         YttpLvyx2HBYblWfXo5HWgQCkGuHWe29F+4f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010926; x=1774615726;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Te07/bZjhBn07Kt99CwFpDIUzeRGSn+5ybu2tGtNfmM=;
        b=DreMNoLyf4JERgwkuDgGZv8I8YJ9FaA/Eln3pkTXMIOww/2Fgr28G62h1lT6JlNstM
         zZnZcMdA33qj3+Dxodj/SUOxAOL5hNcgJ2BVDXox++tfjdSYymJEoOGSan+gvbNwSpD6
         XETcBanAAG3xdss6KzFmSZvf55NGvTpnQH22zvR0/O3v4il4twt9IWVBPRr9akOc8pI+
         69Bz7T9nOn2fP002JtuV8JBVVqq+loJCHVJ4V1AUwbLFn8NUQLBRwuh+L4cKtfQvuWbK
         NTwThfcWfFJT17Azg1g90L89DfTI/EoyJmhSuCRL6LafNwD3QfsReGNO6fy3ZgudmVDl
         fLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhP6s/DYFUbbVNvXf0TaHYIOAPQiFtPLOYGs6WI1KGnsN0Xy+ip3yIatWhgbXvTB944+aL55ArgnG/0b7KsZ4XQw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzyTEhwVolWy6qCrNOFJO7yzTM/VSt4hEp3z4i/UNu8466B33J1
	RyT3wOoWmV/hSfURyw4iJAhxKDBYTjkHzNHtgPgF+Hi+UY8nk5ttPAyo4QMIkNB56z4=
X-Gm-Gg: ATEYQzzYggXnj+yhsRNuFweLCkZjXokdIc8sNggKU4vJGlTtiwmsuLWdu2PPxgONdMX
	OtIcZQdhANGEdfzasgHqmY6pUfrsUKhfz9XjS4jlIWlHmk1gbpXc6IAfG0a6UcL987cG6ymsK9m
	FpSKg3LzcXc9X5YB4X3OSTyKqogoj4ijxqTtrwyvLGBp7o80KmEFTi0/NzOqOEZDI5sFPohpbJe
	1D6+hP2wvePa2Va2ZcZh7JYKiP+FKOjESXIc+ezq7dzyGlv4H+ZBUjvR7T5BPIQmN1thdxYl1ym
	d3+mPQIAaf5hTtf0MtlIaOrGAMT9fXgHm5DZtyzgCidIsTsmbk8AnZETPr2bcZ28WRi6zVKFCBv
	cqFoiY8yeWYIkB0Pz82GXmVl3h6OxJmUb0FBkch9IH13arsciv943GmoPDJkLppUmIZ53cTotvQ
	UkGoYXx0olrm2vw+pvnjC2ZyiPUFGJ9MjiS67SA+YAx4FV8sZ9LtzGW3hkvr6gjvmB2GeNuwoi6
	aVh2nmUBSCaI91Zkp4eISROW08=
X-Received: by 2002:a05:600c:34d5:b0:485:6e40:5584 with SMTP id 5b1f17b1804b1-486fede7225mr41352805e9.6.1774010926313;
        Fri, 20 Mar 2026 05:48:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:72df:cb96:568c:f7d8? ([2001:8b0:aba:5f3c:72df:cb96:568c:f7d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7ea44bsm58265975e9.8.2026.03.20.05.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:48:45 -0700 (PDT)
Message-ID: <b74d3f738ec8e83165d2f81c772b7936216f0fc3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] sstate/relocatable: remove manual
 relocation of .pc files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2026 12:48:45 +0000
In-Reply-To: <20260320122732.1630715-1-ross.burton@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233607

On Fri, 2026-03-20 at 12:27 +0000, Ross Burton via lists.openembedded.org w=
rote:
> There's no need to manually relocate .pc files in relocatable.bbclass
> as the path remapping in sstate.bbclass can do it, if we add .pc to
> SSTATE_SCAN_FILES.
>=20
> This removes some hardcoded behaviour, and puts absolute sysroot paths
> into the .pc files instead of paths like ${pcfiledir}/../../include,
> which makes it possible for pkgconfig to normalise and strip redundant
> paths.
>=20
> This also has the side effect of not forcibly turning .pc symlinks into
> real files, which the sed was doing.

Please don't effectively revert=C2=A0https://git.openembedded.org/openembed=
ded-core/commit/meta/classes/relocatable.bbclass?id=3Da3f4e9ff55c7d9eba175e=
83eb6c99cf349a74432

The sstate relocation code creates loads of copies of files rather than
allowing us to hardlink them and is bad for performance. By making the
files relocatable, we don't have to do all the fixup handling in that
code and it is generally lower overhead on the system. I think I did
this to stop a lot of sstate objects needing relocations at all.

If there is a symlink issue, we should just make it skip those.

Cheers,

Richard

