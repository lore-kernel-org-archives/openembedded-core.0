Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5B565D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 10:01:57 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id g76so4130270itg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 02:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wlf2nx2iuzjX2kLK53mUFw3dtv1BY3n+1IWS0jWAzZc=;
	b=tKjlpDuVCTnCva0vwc6o8DaP8Of0ZopGGGbN1uPGO39AsBwYMzoLR8w+IyqyVRBhk4
	IBzAeDm/BnkLDpQVYyxkIllwEWAEo/9i8T7uHomcB0WxWVB9Lf6isYwDgDiyTCveR5vQ
	p/xh+lch4EtCJQ1PFP/iUezz783PgRD1qv0WGCGpbarIXw8VFylbHb52CJ61izT4aN/3
	5Xx4/eIEtGw79D2CyRG/8hJTmbT4j5PObc7a7oI0EzP0ZKqKfyI/Iec9ZrBW3vNpMRcD
	pdpoikaZLl+f+KS4UyiAqD55kAhMosb0UYAFWVcBwZtkpYS4DrShwBZQCYd+T4t9NKYK
	edhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wlf2nx2iuzjX2kLK53mUFw3dtv1BY3n+1IWS0jWAzZc=;
	b=PV1+4k31Q1KZAkQ8u2lHpj/IfXktFWzWexJ8gwmtXj7grIk6zVOBfCy61l3RUp8xy9
	JmZCyTOhYEeC2syPQrBpvrUm9JSZVZZi/VraYl6v4i4BA9zpbzNsLoodGjhnRLvVOffh
	AFztcOxPVGcZPloofX3x/DWgGpntZ5I74zVsgLFKsDKsoiK24V7cZCqxng8lawOfRiy2
	d90dSYJ9Ddzl30sugjq7rq6shurPawxk2HcCnYowSDFawF+MVncmE96/KQZXPzOGPnK9
	0hI4Vp5oMSc7Ouxy+synfRSHYhw54jA42bpPHwfDZ3fAAlxffxElGGDgJPe49ZeG05GS
	A2Gg==
X-Gm-Message-State: AJcUukeegVwGVRbQ1ukxttVj9CmtPetwXa9Y7AwJDdqWNPsJkxpDrmDv
	Y+S4yLdPPd5OPs2/LiwkyS07lC/PhzVOhAG61fyRdZd0/rA=
X-Google-Smtp-Source: ALg8bN4MdNKRCLgZfAAsSXJS8BTFlZMGnCxIlsTTPMNpiol6cgxYs9L/Mvj6RThkb+AsFYrF/uu3w4mOXTtUsq025co=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr1645592jal.31.1547546518158; 
	Tue, 15 Jan 2019 02:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20190115064546.121351-1-kai.kang@windriver.com>
In-Reply-To: <20190115064546.121351-1-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jan 2019 10:01:47 +0000
Message-ID: <CAJTo0LYwDmCkcjJFLNTj5DP9zs3=W1s2tGYgo3mnMe+HaJrMpg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps & librepo: fix buildpaths qa warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2019 10:01:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jan 2019 at 06:46, <kai.kang@windriver.com> wrote:
> Add preprocess option '-fmacro-prefix-map' to TARGET_CPPFLAGS to fix
> buildpaths qa warnings of libcomps and librepo.

This is something we should be doing globally, not in a specific recipe.

We pass -fdebug-prefix-map already in bitbake.conf (remap debug
paths), and macro-prefix-map is the same but for __FILE__.  This is
good, because we've a few patches to remove __FILE__ already and this
means we can drop it.

Digging further reveals that there's also -ffile-prefix-map, which
sets debug-prefix-map and macro-prefix-map at once.  We should just
change bitbake.conf to use that instead of debug-prefix-map.

Ross

