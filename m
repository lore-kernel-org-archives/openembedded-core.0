Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40745C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 17:18:00 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.100664.1701105472293741071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 09:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=tq6iOHmp;
 spf=pass (domain: baylibre.com, ip: 209.85.208.179, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c88750e7d1so54435831fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701105469; x=1701710269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cR8fgXzAYG8r3dlL8iM8sIffn/d+SofYKH3MSNdWR0k=;
        b=tq6iOHmp5HKRmyZ8pJOXPvttfpsavZ/gx3mvummOEs6QzQG2YVQGuNWb2kDLtDca7l
         HNEbCGIcAV6mqn9EyNJGUVoPYkYoBhSbQsIbCG3IE/qWu5QIZ03UabXMUkyLRRlD3HVq
         zJRRIaS/BEYinc5ISDRWaJ/s6UX8tHSrzB95mJAwt0DJGip0oChi5k2aSXiLdUEaBy5r
         gQUIFnkw+5pkU/wSUu6NZX+FtY1FW4sBHNM5j3sg9+xcuDO2A0cR8CU6IQ6vIBPO8Xx/
         wFRWy/71fYEOPOYfKY+nZQJgd5esEL4hL4wzsXGuQlW2uFff7HwQzQdHE09lVrlTDSd0
         eQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701105469; x=1701710269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR8fgXzAYG8r3dlL8iM8sIffn/d+SofYKH3MSNdWR0k=;
        b=U243xGDwQaU3HNPJVt4UFih+z0rRK+X88iuWU7eA7z9teUIIC/r1bQK4KEgo/Uvc1n
         iGMYmV8oXv21EgNIyu9hAWaZqdJfSwu5mPemfVzpEW03K/CedzzqQ/EY8AYABtYRijj+
         mql2u03wGvXZ3zZ771l4iPj848y9xAzcDT8UtWLayBCPxICYIJWG4MEkNCfHge3m3aVx
         jmg/4mEwSgBMNl+n2qo/HiH3eDj786n7jhZ3mnxSGXfbYv5FmHnYW0tQN8azm5pRwakN
         BIuM4XWLrb5d0/wvhUfk7D7Nuf6UgZHB7Msn2RdAx85O4ESeL78cIlChnEJKpxTW7g/R
         ITSg==
X-Gm-Message-State: AOJu0Yz3U1BX1qqPFwmCjQvs/3a6sU7XjaEI3S4THwGyrZEliTPZID/g
	MtZc6XqugrOmZkm0MQGdXNE6Co0x5Wgt5NrV8zUMcQ==
X-Google-Smtp-Source: AGHT+IE6wapjC/xjhjSvbQEf7P+87on3F9VLMSGAHwb1DjAzMPfAUQ1g8HrQEl4TaVfumUE6fAbBBg==
X-Received: by 2002:a2e:989a:0:b0:2c5:1e3f:7379 with SMTP id b26-20020a2e989a000000b002c51e3f7379mr8120751ljj.48.1701105469427;
        Mon, 27 Nov 2023 09:17:49 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c35cc00b0040b3e7569fcsm9156684wmq.11.2023.11.27.09.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:17:49 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RFC][PATCH 0/1] recipetool: add plugin to create recipe for rust based application
Date: Mon, 27 Nov 2023 18:17:41 +0100
Message-ID: <20231127171742.416913-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 17:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191313

Hi all,

This is an RFC to add support of rust recipes in recipetool.

This first version is able to create a minimal working recipe for crates
HAVING a Cargo.lock file (needed for reproducibility issues, see [1])
and using the following commands (using simple_genetic as example):

  - devtool add https://github.com/ValpsZ/simple_genetic
  - bitbake -c update_crates  simple-genetic
  - devtool finish simple-genetic <layer>

Limitations:
  - maybe we should factorise the code inside update_crates to avoid
    calling it after devtool add
  - for now the created recipe contains "include ${BPN}-crate.inc"
    instead of "require ${BPN}-crate.inc" because when the recipe is
    created, devtool tries to build the recipe itself and with "require"
    the parsing fails and the recipe is discarded. Maybe first point can
    help here. Another solution may be to write an empty ${BPN}-crate.inc
    next to the created recipe BUT right now I don't think it is possible
    because the process callback does not know neither the output dir nor
    ${BPN}. Maybe adding an optionnal post_process callback can help here? 

Unfortunately, most of the crates I tried, do NOT version the Cargo.lock
file, so we need a solution for that. Maybe the "update_crates" function
should do that? If no Cargo.lock file is found, just create one, and
create a patch for it. When a recipe is updated, the user upgrading SRCREV
(or the version) must be resposible to also run bitbake -c update_crates
to update the Cargo.lock and the ${BP}-crate.inc files. I think that
should be ok for reproducible builds? What do you think?

What's next:
  - add support for "devtool add https://crates.io/crates/simple_genetic/0.1.1" 
  - add oeqa selftest
  - handle the no Cargo.lock case... 

NOTE: created recipes are built tested but not tested at runtime for
now.

Dev branch on poky-contrib: [2] 

[1]: https://git.yoctoproject.org/poky/tree/meta/classes-recipe/cargo.bbclass#n45
[2]: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/devtool-add-rust-support

Julien Stephan (1):
  recipetool: create: add support for crates

 scripts/lib/recipetool/create_cargo.py | 122 +++++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_cargo.py

-- 
2.42.0


