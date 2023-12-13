Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E0FC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 21:11:12 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.771.1702501862476664000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 13:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B1cxrejp;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso71515551fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 13:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702501861; x=1703106661; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cmxHWbuw9SN91ypX4LzNMl2TYzz3kAc1uwxofXG4lvM=;
        b=B1cxrejpjNth3zsZWdkG5UkY2DiM8uNP+d3hCI9t3t+BYwzmdIH2jWv3ZqgzuAJY7S
         20qeaXlz0RKeIY6u7ikr0ko4YNHRYel8QF7kY7HZywRnS+GHXU9gQG/NXaPFqB4ZD1fL
         JVTKi+1P4f89YyrNlpJnBc1SoAorX2wNpI7HSjWCZjCWZyNSJjOKVP700PqQb4fHPLjl
         KdWqyWQHQD0EflD556lNYUER0nDjcJZJ1TflkaaWRn3NsSqqF+2jFpTnnqEihPz85Ug4
         F2p9bNIvQdvR96EiOh2Uly9kNjgs8OCJM3Qm4Rhb79HxoSkoL1s7LRuvCzPPu7dA//eP
         Bk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702501861; x=1703106661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmxHWbuw9SN91ypX4LzNMl2TYzz3kAc1uwxofXG4lvM=;
        b=fKic90ZmXJnxJR8g/8REQjLrKo1+8BNWqhOtKnTTh3afssYAScntYu+txeALnA+fLn
         XnBd9/RE7QxjUE0qvKgnrovL8WApkNB0jQHAmpt+0XrjAho/Rf/c8vcYQXa179nLOuKE
         tH5aLO6jxwzMWJQ/JWrVqNIrcTCwNkY0wQVXVwB6YKbzesz/De7wfzstwgZroV830KW+
         FIv8Ws2JsZBe2emmpN5FZoItCy+WTrTkgKxRni8hV2AYqJgDmf/MY995hzAvODbANCl4
         +RpQ7bDozUPxaW/SgugfgCI0YzxHBnh1uxTuGOWYk6WHcXncdkLPGrIkdmh+kiIqj8JE
         qjBQ==
X-Gm-Message-State: AOJu0YzNTiSn0NieGkNzmeoA1v/lOoqxMXKD9R7cmFSQzZkFEXzyp5pV
	c2+x2H/bdFdF5kFm6sNQNp5bN3Sx8CWdx99Y8Jo=
X-Google-Smtp-Source: AGHT+IHTXD0DjmCsYtB9VU3lgMsMzi4lZx0wK15hf4ycNQZv5MebAs+Y7mib7UmfhlxBAJt+KgMWpLbYWfU1fYgyNwE=
X-Received: by 2002:a2e:b8cf:0:b0:2cb:28d1:c22 with SMTP id
 s15-20020a2eb8cf000000b002cb28d10c22mr4481850ljp.26.1702501860371; Wed, 13
 Dec 2023 13:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20231213210703.667740-1-peter.marko@siemens.com>
In-Reply-To: <20231213210703.667740-1-peter.marko@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Dec 2023 22:10:49 +0100
Message-ID: <CANNYZj9K554nGuEGsD1SaE635aF9zmi+q_boQ9Tjb3d5atVWbQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] dtc: pass version as parameter instead of
 querying git
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 21:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192326

On Wed, 13 Dec 2023 at 22:07, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> +From f32056f825b926b5820d43478d11e92eee1ec91f Mon Sep 17 00:00:00 2001
> +From: Peter Marko <peter.marko@siemens.com>
> +Date: Wed, 13 Dec 2023 21:18:14 +0100
> +Subject: [PATCH] meson: get version as parameter instead of querying git
> +
> +When using shallow tarballs, git tag is not available.
> +This causes version to be git hash.
> +This prevents application from checking minimal required version.
> +
> +Example error for trusted-firmware-a from meta-arm:
> +dtc version too old (039a994), you need at least version 1.4.4
> +
> +Upstream-Status: Inappropriate [oe specific]

This is not really oe-specific, please submit upstream first.

Alex

