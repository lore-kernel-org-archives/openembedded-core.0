Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1942C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 14:08:52 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11255.1661350128931667349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 07:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nSL/zlbb;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id d23so19806283lfl.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FnlrY+LeNpsxKBRlxz+uSDa+/KA4u2yIRzg+KekbccQ=;
        b=nSL/zlbb/7aQSHG6+I32nrZ/14VE4fLyNEfpRX5yg6tqkYU8G/+pckxVN8dPJJJcaY
         z+L4VPRBg/APAYtS9vLnSGWqTfKCpkWcFK+VOSRaychKb5W73UosLwhxu0oaKgXJaJP/
         2uLM0kReOuhwuOXvF+7h+q0lea8kSAl1vl90bQhr/KDvPGEECfql5JCrgvYjsREmidsp
         B9dlAPVBfL0TknGnh0FF9oX3c3u7R5P8WVC8NxWds9BSREMUamb5vDNrGC289AcaoPUd
         6+OjoGKH+vLGqTHY1HCEvI8xrqnly9AWDty2NIX1oefwoAUErSZ6ws+q0Gb4XwUZQHlQ
         SWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FnlrY+LeNpsxKBRlxz+uSDa+/KA4u2yIRzg+KekbccQ=;
        b=X43xVLlo7bXTfRF/GJOsBjGK7Wn6/AnR+aM5PzSSEywkN+uzfmE7lc0Fsq7gEAAZtU
         8V/NB9nh3us5LWtcKUqD8Pdx6SLf+zUR1Q3nBJDp4RC/g4xZSUwaOxaIVemZvGadwEp4
         SuJLlWTX0lsAbiPhjSC8InD6FOQI5FAokocjMs11iPdw+SZ97tQVQlnuN9B4eziv4vLZ
         ZpoOetpvdS0imhwhUBaWkx6q3EtesPLSd9gjtAUiL+epk1NOABj3aRz80lfFQhrDq7h6
         U3XVB/bLCjtweDXKDm+DIlPzJ7oK5EEUK7QaJT0JsXvOUbB6+CH5lvy38mR2MLnltTxi
         FJwQ==
X-Gm-Message-State: ACgBeo0l4P5OuahoAIV10XppJB2KGfRL9yq71JlJm26OLE6LTPd0sH5g
	wlf6JXhcO8ksP3t5Du3hwrNpk1k4qrbFs7VpM4w=
X-Google-Smtp-Source: 
 AA6agR64gfNyuPRZnfBaJCPfpSkpA7aY9O7PPX4dgh1qxcNp9h/uuVvYbng22NmffVBIF8vAjS+TfRjhnnrjUE5oz4I=
X-Received: by 2002:a05:6512:687:b0:492:ee7c:5953 with SMTP id
 t7-20020a056512068700b00492ee7c5953mr4220097lfe.673.1661350126920; Wed, 24
 Aug 2022 07:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
In-Reply-To: <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 16:08:34 +0200
Message-ID: 
 <CANNYZj9KH13zkN2Lu7ToaqRGcXdPBxbUT+v3U0HezM5sYa0bTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 14:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169819

On Wed, 24 Aug 2022 at 15:58, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Please no. This happens to match your expectations, but doesn't at
> all match our use of TEMPLATECONF. In our .templateconf we set
> TEMPLATECONF=${TEMPLATECONF:-templateconf} and create the templateconf
> directory in runtime where we generate the sample files that match the
> layers that repo has fetched for this particular build. It obviously
> has no layer.conf file as it is in no layer, and the path doesn't
> contain "templates/<something>". I can of course change our tools to
> create a couple of extra directories to match your expectations, but
> at the same time it seems very unnecessary.

If you create the template files on the fly, then you might as well
create the actual configs directly into build/conf and skip the
template step. No?

We do need to standardize the location for the templates for reasons
of discoverability and consistency with machine and distro
definitions, this has been discussed.

Alex

