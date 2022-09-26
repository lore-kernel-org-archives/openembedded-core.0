Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06211C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 16:53:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.144.1664211214601531888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 09:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WEPNBbIG;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so4082802wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=Uuk/IOCj/Bgbb2U7Gds8dV3W7GutjORjTw2/W+WKX+Q=;
        b=WEPNBbIGiUn51W1zuWComVwcZy8hJeoSZIpp0FslQntOGsmddoYuERKkBzSqaRRMZV
         tE3Au9V+z1pkwBxw1hFcpgI9lmV6PN+CDi/BliKglZjuJMsafKkwmDTbQPl0Fdl0Wil1
         KvHvZZ/sNO57cOpzAIZlmwsjygC8B2h0BRYKQeLcUFvYUMfmVnayKzA3rEsE1y0h3yca
         mAzbayTFogTIUciModBqJe7XZaMnXbBovQps2OdL6BLfrr599vFGR58AhNjnA805AMy0
         nplwiy1m0waF7OE+qHdJOs6dgBT6aqoVR8zxcao8v1tTF27s/ahwrpUHpAKgXzBOQbfj
         +lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=Uuk/IOCj/Bgbb2U7Gds8dV3W7GutjORjTw2/W+WKX+Q=;
        b=PKH4jA5zivIc5cGz1Tu46uqf3Tz98OzX6/8t6pPGUEZhOODeB4sULl2XZOHYuHd79b
         923axc2F6T/DHQKVJ1y2DnLHpNErxZAl6ADlxAXZYXvvXSv2Gg0TJjuLa0V2FHX1WhJQ
         YNHFyuu+NhEtP8gvS4eKqOfMUVLch19sc8wWjgoKDooC0jvZjpkxKHdD/I0YAVgqMDQz
         yPJpGEVKaISLPTA72FVKkSJ+VikiF3McjGDPVWtK2MZVGnPTBWe9ApPiIs2QpotUxGMB
         mj1MuDRG74D/hZ1kRUEgGwAgUXSrclOvKHJ1c45VL1wLCgrG1L/UBFBEc6OZg1YWK8bD
         nw4A==
X-Gm-Message-State: ACrzQf3LusjzhY8xqAVgSoZ+JdgJVnF+i9M97/i+6HHftvIgQ4AOAKjl
	3pPXPSkxqaR2GBPsW9PJSUTlAJMe2Cl78g==
X-Google-Smtp-Source: 
 AMsMyM76mrLTPe1RzOy95yNQ47+mI/W8OTvq2s2VEUsQDBqpW593ROQNPy6rUJrLrfS8W9VkJcWgRg==
X-Received: by 2002:a05:600c:1990:b0:3b4:c326:d099 with SMTP id
 t16-20020a05600c199000b003b4c326d099mr15237020wmq.19.1664209295169;
        Mon, 26 Sep 2022 09:21:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0022add371ed2sm16095474wrf.55.2022.09.26.09.21.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 09:21:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Subject: Setting up layers in Yocto, the introduction
Date: Mon, 26 Sep 2022 18:21:32 +0200
Message-Id: <20220926162132.26035-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 16:53:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171070

TL;DR version
=============

If you want to get everything needed to run a yocto build:

- clone the bootstrap repository (ask your distribution maintainer where it is):
    $ git clone bootstrap_repo_uri

- run 'setup-layers' from that repo:
    $ /path/to/bootstrap_repo/setup-layers

If you want to save the layers setup for replication elsewhere:

- save the config file and the replication script into a 'bootstrap repository')
(this can be an organization-specific yocto layer, or a standalone repository):
    $ bitbake-layers create-layers-setup /path/to/bootstrap_repo

- document where the bootstrap repository can be found for your users

What is this layer setup tooling? (the long version)
====================================================

Once you have a working build with the correct set of layers, it is beneficial
to capture the layer setup --- what they are, which repositories they come from
and which SCM revisions they're at --- into a configuration file, so that this
setup can be easily replicated later, perhaps on a different machine. Here's
how to do this::

   $ bitbake-layers create-layers-setup /srv/work/alex/meta-alex/
   NOTE: Starting bitbake server...
   NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
   NOTE: Created /srv/work/alex/meta-alex/setup-layers

The tool needs a single argument which tells where to place the output, consisting
of a json formatted layer configuration, and a ``setup-layers`` script that can use that configuration
to restore the layers in a different location, or on a different host machine. The argument
can point to a custom layer (which is then deemed a "bootstrap" layer that needs to be
checked out first), or into a completely independent location.

The replication of the layers is performed by running the ``setup-layers`` script provided
above:

1. Clone the bootstrap layer or some other repository to obtain
   the json config and the setup script that can use it.

2. Run the script directly with no options::

      alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
      Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.

      Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
      Running 'git init -q /srv/work/alex/my-build/meta-intel'
      Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
      Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
      Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel

      Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
      Running 'git init -q /srv/work/alex/my-build/poky'
      Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
      Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
      Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
      Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
      Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky

.. note::

   This will work to update an existing checkout as well.

.. note::
   The script is self-sufficient and requires only python3
   and git on the build machine.

.. note::
   Both the ``create-layers-setup`` and the ``setup-layers`` provided several additional options
   that customize their behavior - you are welcome to study them via ``--help`` command line parameter.

Questions and answers
=====================

1. Why JSON, and not YAML?

JSON is a part of the python standard library, while YAML is not. This means you can bootstrap a build on just about any
machine that has python and its core library, without first having to install any dependencies. JSON not quite as easy
on the eye, but with decent indentation it's totally ok.

Before anyone asks, XML is appallingly difficult to read by modern standards of readability. No thanks.

2. I don't want the script in the bootstrap repo, just the config. I will provide my own tools. How?

Use --json-only to generate only the config, and not the script:

    $ bitbake-layers create-layers-setup -json-only /srv/work/alex/meta-alex/

3. I want to generate the compatible json with my own tools. Is there a schema to validate it?

There is:
https://git.yoctoproject.org/poky/tree/meta/files/layers.schema.json

You can use python3-jsonschema package to check the validity.

4. I don't want the json or the script, and would want to use an entirely different format and tools. Is
'create-layers-setup' hardcoded to the OE json format?

Actually not! Other formats can be added through a plugin mechanism. OE json writer is just
the default plugin but others can be implemented and selected:

    --writer {oe-setup-layers}, -w {oe-setup-layers}
                        Choose the output format (defaults to oe-setup-layers).

5. I want to use something else than hardcoded revisions in the json (e.g. refer to branch
names or tags).

No problem! Edit the json to say 'main' or 'release-x.y'. Anything that 'git checkout' can take will
work. Just be careful that these modification are not overwritten later by 'create-layers-setup' by
e.g. renaming the json file first.

6. I already have an existing checkout and want to update it to the latest greatest. How?

First, update the bootstrap repository to the latest (or otherwise desired) revision to
obtain the latest versions of the script, and the json config. Ask the distro maintainers
for the recommended practice to do so.

Then, run the script again - it should be able to handle a layers checkout that already
exists, and update everything accoriding to the latest json, obtained in the first step.

7. Ok, I have checked out all the layers. Now what?

The next step is to actually set up a yocto build from an existing configuration template,
and start a bitbake session. This is made separate from handling the layer repositories and
will be described separately.

