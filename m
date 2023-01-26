Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BD5C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 10:49:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.70842.1674730173787265809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 02:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mWaBfA26;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a37so1517472ljq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 02:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gxlIky053J21ZtBLp3GMSRgKpLjEtr16O+3FJ+aQPA=;
        b=mWaBfA26llbd4+LPpZj1y3J7txRf1lHZBQWtekZLv2FN7ld7weyQBK3z1J7fZthWOv
         Bj9RAIYapc5cm6Uw07OI0AgQnkjkq2jXwimCcRwL7AY2IFIE2iNAryCJvrKCA9npA4os
         piTROqdC/sizt7IXrbiS1qGB6gkCNv8zpYngwBGEBUYaIh+RvtLHArOlGqOWmm+kXzMS
         MHeWERJqHOhqvurO0droWHKLiWvJpd5LjNaXmoTyI1dg2ji6HF4heFuwMfj5fVvXmYDS
         AJ357KSdFxfLi7QkbqKUbIC5ac6LWSh23A/w0Q0c8mMOj/Uah+5P4c4VHTId2fkZDGjR
         ZsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gxlIky053J21ZtBLp3GMSRgKpLjEtr16O+3FJ+aQPA=;
        b=l/KP0B9W1ig2bn3SQN6CGdn1Ks7Yt9xCIaOTQtBG+7HsOwhNbcktUAI/REmVLFOVzg
         4zXsqJfwVPO+Ty044+Th55wh9rzzapS/COQAisJ+ZRrrsxgsk6GGaiAY7XogPm6KVI1R
         FS58cCHub369EClw5i+pHwes654MeIv4MAP8m7oAq32ZQoejPV4/5YsIR5ISQVxsWo2O
         SYm9JxnnngWD7V4mBebakhJc6cct+0t5wDjd1yYDLrv7Nf05dXF3e/JOQJgW71g5HMlO
         aNSsZcszEjmre7A7E4+T1dx1yZs4xfFZpAhuG87hsshTWU2fFMxMeqEzi2/z08UJHn2/
         vLLA==
X-Gm-Message-State: AFqh2kokwy1OXH+NaAjq0mst6bI2LBNEAfKkWOPnJhb7NN5INO2HaHMo
	dq7A5SetmJWjniZRRietcNRmfQHq2bJcbfDIfws=
X-Google-Smtp-Source: AMrXdXvW5Fst9mcrTphW/vxk4B13lrjA8xohD7pj7O29ZggkxuNHbA0A+VwkoaY0whjvtV5BlNir+JeZbFG6pP0EQPs=
X-Received: by 2002:a05:651c:544:b0:280:4ef:3cde with SMTP id
 q4-20020a05651c054400b0028004ef3cdemr3210992ljp.78.1674730171881; Thu, 26 Jan
 2023 02:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20221110092433.2874130-1-alex@linutronix.de> <eaf6331bec173b7d5b7c758659223e34b71226dc.camel@linuxfoundation.org>
In-Reply-To: <eaf6331bec173b7d5b7c758659223e34b71226dc.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jan 2023 11:49:20 +0100
Message-ID: <CANNYZj9vpEPYDw1z0tNyv9D5V8T8XF03VR_PqfKmS0GxcsB65w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 10:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176391

On Mon, 16 Jan 2023 at 14:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There is also an implied challenge here of the different stages of
> "checkout the repos", "document those checkouts in bblayers.conf" and
> "here is a separate build directory". The layer config file is where
> information from the two are mixed but I suspect there is something
> different we could do.
>
> For example, if the config fragment says "I need layers X, Y" but the
> layer setup json might define Z as well. We'd need a markup for "layers
> X, Y, Z are available" from oe-setup-layers. oe-setup-build could then
> iterate the layers, show the configs, then generate a setup for configX
> which only needed layers Y and Z configured.

What I would like to try is have oe-setup-layers first clone/checkout
the layer repositories (according to what is in the supplied json),
then walk the resulting directories looking for conf/layer.conf, e.g.
determine what actual layers are in the checkout and where they are.

Then this list would be written out to a file in the top level
directory containing the layer repos for further usage by other tools.
E.g.:

/path/to/setup-layers --destdir path/to/checkout/

would write a path/to/checkout/oe-layers.txt (final filename TBD)
containing layer paths relative to the file itself, e.g. (final format also TBD)

meta-intel
meta-arm
meta-openembedded/meta-oe
meta-openembedded/meta-networking

and the location of oe-setup-build into a runnable shell script
path/to/checkout/setup-build.sh:
#!/bin/sh
poky/scripts/oe-setup-build --layers-list ./oe-layers.txt $*

This leaves bblayers.conf(.sample) unchanged and exactly as it was - a
template/build item consumed by bitbake only and used to list layers
active in a specific build.

Alex

