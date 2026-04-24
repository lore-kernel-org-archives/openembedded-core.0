Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C175BFED3CC
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 14:29:19 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24095.1777040958071967778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 07:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GsOI9uoW;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8aca2726f61so94225186d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 07:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777040957; cv=none;
        d=google.com; s=arc-20240605;
        b=k/E/g3BExWLy6YrBQibQALSKbLEgOpFrDkSzhIe8UNDvNzXLUq5l7t0Map7vkxxl1r
         fkwo/inKLziAEFp/RrErk/Pl5EzLiCFn/YxZ8zSCwkG+GW/i/XdC03LuYMbwsoZjLwOz
         MfKjkyKvOw9yV09eQAu1Syq1XvFqVjwMIIaWprrgIMc3vzmAFWjsauiuwpfHkXuf2M3x
         LHOs8hEY6CVthRYbYwDyRU56tV5zHI85esL5eG4wfIrzmzzw3bXwnD2mzJrpJeQXZbev
         9mRZeno+20BfN5YN7wzFqUA1snd5Ws7T02RR0krLa25qZn9yY3ycMHyKHzpXwjZr2Zcu
         N2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GUhku7MFHkU4n/UpAFsArccZOCtDirHFBOu3CMIjnGM=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=cCdoTO7Al74eOr+VhqP9DIjfoUXVNqEueFBllcKMRTE9RilXxRFytlzSRF7ZtgpZHE
         wV81ahWG3GZV0TrCwISWOYu6OFRNGCqLCXchCfYlZvQ5B180B5ymv4ygSFf9lNOYlDNd
         fLX+Gw9IMTt1A/X+FKhyNW0xXvGFfMJkSw0Hg/uvvLnXy9SYaoliyJVNnXVEpq6LfEVq
         FAYWE3Hgcd2dni7KagoOglN6WT3hZZKzZXSvSBEx3BTqklSMKonDkPQat8f5SpDGZiD3
         Q+cETt9kiKZk5XUPbxwDERd3pqefXRckZBtXez465csdoVEHEkNIxVXTPL0HcOwTofMN
         HIoA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777040957; x=1777645757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GUhku7MFHkU4n/UpAFsArccZOCtDirHFBOu3CMIjnGM=;
        b=GsOI9uoWgpAstI4o2ZF6t98dNkijlcRGze/cgsoLUip0tugka/I9kAhgS0/7uP6Y4b
         bx3fV4eWvxtB3sLpzPYA394o/X7NHjbcmcjHgXTw8Lcg6AeLciZyZnSp3YATQ8CZAzoo
         ukAKkXyKJLC7GGRSPIUT/6o7zOSgpr7PeZRemENBw3IlO5tdM4k7+y4TmhHIdX+FYx6s
         ehJ7hkWNqggZDKJUvZjld5Snxwf7DA2Mm6BiTMreJvT5QKEXJ8VkjJ3R+0evCh712YSC
         8buRy19DHE3Xdpms1ZBb/Ac1ru/DMQK48xgcGIh/vKqXlkU6Qizyc6T/1Lq+Ruv3VOxw
         xV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777040957; x=1777645757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUhku7MFHkU4n/UpAFsArccZOCtDirHFBOu3CMIjnGM=;
        b=MKhOhd72sJBnHOwreyHhd8biorBfjsxbPxJLKtGynroKR7waflnbr0sdf7Po3fW6DC
         7fjzip3aedRTXQznmihGNTFAByAsh2Djm2D7+JPtuV4keJZ78P5GFEHRPz8MGPogoI9G
         uSV9lefNyHw7KPBg6Mb1wVZmyBPwKPNUneWVoP9HyRwdhaMQqseyuvlmf9yfW3RcQu81
         xwbT6nXaEc7fS+eHOh/5HDCykpGf7fACyP/6d7BrN8ZuZHbp4FXAQHN637zKpFbJkfmT
         qmFmTeupnPFdXIbjNKN5ACVVrBUjCIrO/wVpjsWIGJzzlqxGXuiMYo3SYFTPjsdl7jzO
         mqKw==
X-Gm-Message-State: AOJu0YwtmFRYI5+tBk50WTBhhbeTWQTPCsq4U5gX65Jju3xavZHCamSz
	M8SQ43KpYIs1rHcpGAiQJojv+P3m8W23CDb2aoQhx4eD5pA7SxXDCKv9L1iElGWFfRtz+otjhK+
	F67sjwhH458vMcw9faQuRBGF+m8gwKlI=
X-Gm-Gg: AeBDiesJ+fPErmntnAM/dKV40zgfIxsNhK6xeEDpDIdMuQRd0rg4HX9+cnungzlXWEn
	l865IusGXPxo3aHoYXAWr4Nvc1bRgEQEDl2IHlb8pwPeHNryvcwRTLVgVMBLmm689uTgGZKySiF
	Cef+qZyDUn7g1//ayzFeU6adX9EB2z1NT/JpI5rNyVA5ISVKPO94NnGbOC7R3S3nA0WC4iyT+am
	/aA9PCHBCuHKfNfIcMzvxrXcqWtRsnCnS55lCHS4pohUT2qyZ4pYe9gI/paQfWUa5JpCXyE/lcB
	yTAT80piuyY1ksDvnIBlvMJt7Y2vJe+fZZF/4bE88SKqn4yU0Wg/
X-Received: by 2002:a05:6214:5190:b0:8ac:b677:c408 with SMTP id
 6a1803df08f44-8b02815238bmr480754596d6.44.1777040957002; Fri, 24 Apr 2026
 07:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260422151858.2598801-1-alex.kanavin@gmail.com>
 <20260422151858.2598801-2-alex.kanavin@gmail.com> <BE153695-CCE9-41F4-BEF0-C5D4CA32D288@arm.com>
In-Reply-To: <BE153695-CCE9-41F4-BEF0-C5D4CA32D288@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Apr 2026 16:29:05 +0200
X-Gm-Features: AQROBzDJwIqQU57zfdzC-hURcTTb-rHe4RLN0pGr0tjvOPVFs2TQKQ46H6qYkXE
Message-ID: <CANNYZj9H983tKYAV-FKnzrrspaJqabKVMv8O9bfdnceq8f=gYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] sbom-cve-check: exclude recipes from
 version checks and version updates
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 14:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235864

On Thu, 23 Apr 2026 at 16:23, Ross Burton <Ross.Burton@arm.com> wrote:
> > These recipes rely on AUTOREV enabled with a fragment, and upstream otherwise
> > updates them far too often to make regular version updates feasible.
>
> I actually think we want to keep this. We encourage people to use AUTOREV on these recipes, but we should update the underlying SRCREV occasionally at least, and AUH is one easy way of doing that.

I guess we can set PV to upstream tags, although both upstreams update
tags once a day, or even more frequently:

https://github.com/fkie-cad/nvd-json-data-feeds/tags
https://github.com/CVEProject/cvelistV5/tags

I'm not super keen to have recipes that are always out of date, and
are updated at random intervals, but yes it's doable.

Alex

