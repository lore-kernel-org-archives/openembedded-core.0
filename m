Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D81DEE49B6
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 14:14:24 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.22662.1726064062120246508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 07:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kRxquGuU;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f759b87f83so51942611fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726064060; x=1726668860; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vudzb+mD8LUShX+FDGtS9VyMn8cGaz8eHielgOs7KdU=;
        b=kRxquGuUuGK3eMBQHSiRIfdDGmcwmsoicygGs+9CF41GHj1Hri/0nfonO7SCjL8hl6
         TXsaRvvx+52oC+Up6vFaOJCNiOKLt9vyHDi1/ffHrmIaG50SCUwrMNtZtn3GngRIlpcx
         8ffPG7bqEC9JubYp2V1rEcx0+6fVhoceFFh098ECTr2fhr7+ySE0ajwxDVYWFJEWWU7v
         T44gVFYqFjzrcJYCu3KwExxweX/Agb6zZ/8sWtvpNGM21Ir1GmAT+en/WKZfJ2kdwqJI
         MfuZG3gfHfbcetu0FCVrQc0Cnc/EXnzs2PCd/9z4yRv2+UIZuaHE+miA/CaC2Sg6JKuG
         OHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726064060; x=1726668860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vudzb+mD8LUShX+FDGtS9VyMn8cGaz8eHielgOs7KdU=;
        b=gCSsNlq/Y1R+9uFioUnnlO1vY4IOEVfJXMe7MavJIjgiEutA3v6CWhVyMAxGD08w9a
         lLMJDApP4AQ1BXE4iQZpBg8+9JRD4ZDchWIpI4PH5IPeUJ8aTtoRyPnffO0vr/AxI9at
         8l2otthfvZ2B8SoUFTZeeYL9yx0YLcq53IrQHHC94OKeJ8xr7QTNwmRc7KMNYOoGQzy/
         u9BiAZ5SkoO+Vss+U5myDsj91fqVvP/N4iPXmkD0i+hNX1q52Vxn3Tp1CLZMVskwXEEP
         RyP2W83lkEoT0WDhMDVLDoF5yB05BrW7hgxXosm9b2oicIfBfDWkKkUg3mXSyGw7D73N
         ANvQ==
X-Gm-Message-State: AOJu0YwrrUqBLSs1wFXA+m/8WWjPl48ajiqW7LG6QnWV5EVyo7U8ARz3
	MnTMYgXKBDA5v2bm6KYO2/qFftUsLHO0FabUwoedxKciNnKLbwXljQY/snId4EJrJHhmZQW0/XK
	nIvdTLWVt1NS6M9onPrwBbNalmDM=
X-Google-Smtp-Source: AGHT+IFBCBmv90o15VyJdHekM/1PcPxJz5tLasc3M+JMCre/mEWj+XV27cYUGsB53XZEsmRpkBvpy1vYSxfU7HT/jsE=
X-Received: by 2002:a05:651c:2204:b0:2f7:4ccd:8918 with SMTP id
 38308e7fff4ca-2f7611bffe0mr61923391fa.43.1726064059268; Wed, 11 Sep 2024
 07:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726059965.git.liezhi.yang@windriver.com> <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726059965.git.liezhi.yang@windriver.com>
In-Reply-To: <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726059965.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Sep 2024 16:14:07 +0200
Message-ID: <CANNYZj9JE_syrcCA1t=O-AYT=UhZXb=TY+v5Q1cON7oPKQEPRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] classes: Print bitbake branch and revision
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 14:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204387

Can you please also add a function that tells if bitbake is in a
separate repo, or bundled with poky? This would help various tooling
that is being developed for setting up layers and builds, or creating
configurations for those tasks out of pre-existing yocto setups.

Alex


On Wed, 11 Sept 2024 at 15:13, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> There is no bitbake revision when it is in a separate repo, then we have no way
> to know which version of bitbake is used from the log, this patch always prints
> it.
>
> * console-latest.log
> bitbake              = "master:165368bad152a14b32b5216b938aa4b915d72a70"
> meta
> meta-poky
> meta-yocto-bsp       = "master:165368bad152a14b32b5216b938aa4b915d72a70"
>
> * buildhistory/metadata-revs
> bitbake           = master:165368bad152a14b32b5216b938aa4b915d72a70 -- modified
> [snip]
>
> * buildhistory/metadata-revs
> -----------------------
> Build Configuration:  |
> -----------------------
> DISTRO = poky
> DISTRO_VERSION = 5.0+snapshot-165368bad152a14b32b5216b938aa4b915d72a70
> -----------------------
> Bitbake Revision:      |
> -----------------------
> bitbake           = master:165368bad152a14b32b5216b938aa4b915d72a70 -- modified
> -----------------------
> Layer Revisions:      |
> -----------------------
> [snip]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes-global/base.bbclass     | 10 +++++++---
>  meta/classes/buildhistory.bbclass    |  5 +++--
>  meta/classes/image-buildinfo.bbclass | 13 +++++++++++--
>  meta/lib/oe/buildcfg.py              | 13 +++++++++++++
>  4 files changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> index b6940bbb6f..85c7cb8c24 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -226,9 +226,13 @@ do_unpack[postfuncs] += "create_source_date_epoch_stamp"
>  def get_source_date_epoch_value(d):
>      return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
>
> +def get_bitbake_branch_rev(d):
> +    revisions = oe.buildcfg.get_bitbake_revision()
> +    return oe.buildcfg.get_branch_rev3(revisions)
> +
>  def get_layers_branch_rev(d):
>      revisions = oe.buildcfg.get_layer_revisions(d)
> -    layers_branch_rev = ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
> +    layers_branch_rev = oe.buildcfg.get_branch_rev3(revisions)
>      i = len(layers_branch_rev)-1
>      p1 = layers_branch_rev[i].find("=")
>      s1 = layers_branch_rev[i][p1:]
> @@ -241,11 +245,11 @@ def get_layers_branch_rev(d):
>          else:
>              i -= 1
>              p1 = layers_branch_rev[i].find("=")
> -            s1= layers_branch_rev[i][p1:]
> +            s1 = layers_branch_rev[i][p1:]
>      return layers_branch_rev
>
>
> -BUILDCFG_FUNCS ??= "buildcfg_vars get_layers_branch_rev buildcfg_neededvars"
> +BUILDCFG_FUNCS ??= "buildcfg_vars get_bitbake_branch_rev get_layers_branch_rev buildcfg_neededvars"
>  BUILDCFG_FUNCS[type] = "list"
>
>  def buildcfg_vars(d):
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index ce3abaa69d..50516e6533 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -764,8 +764,9 @@ def buildhistory_get_build_id(d):
>
>  def buildhistory_get_metadata_revs(d):
>      # We want an easily machine-readable format here
> -    revisions = oe.buildcfg.get_layer_revisions(d)
> -    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
> +    revisions = oe.buildcfg.get_bitbake_revision()
> +    revisions.extend(oe.buildcfg.get_layer_revisions(d))
> +    medadata_revs = oe.buildcfg.get_branch_rev4(revisions)
>      return '\n'.join(medadata_revs)
>
>  def outputvars(vars, listvars, d):
> diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
> index b83ce650ad..7b5f84854c 100644
> --- a/meta/classes/image-buildinfo.bbclass
> +++ b/meta/classes/image-buildinfo.bbclass
> @@ -27,11 +27,14 @@ def image_buildinfo_outputvars(vars, d):
>          ret += "%s = %s\n" % (var, value)
>      return ret.rstrip('\n')
>
> +def get_bitbake_rev(d):
> +    revision = oe.buildcfg.get_bitbake_revision()
> +    return '\n'.join(oe.buildcfg.get_branch_rev4(revision))
> +
>  # Returns layer revisions along with their respective status
>  def get_layer_revs(d):
>      revisions = oe.buildcfg.get_layer_revisions(d)
> -    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
> -    return '\n'.join(medadata_revs)
> +    return '\n'.join(oe.buildcfg.get_branch_rev4(revisions))
>
>  def buildinfo_target(d):
>          # Get context
> @@ -55,6 +58,12 @@ Build Configuration:  |
>              buildinfo_target(d),
>              '''
>  -----------------------
> +Bitbake Revision:      |
> +-----------------------
> +''',
> +            get_bitbake_rev(d),
> +            '''
> +-----------------------
>  Layer Revisions:      |
>  -----------------------
>  ''',
> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
> index 4b22f18f36..dab4aa7831 100644
> --- a/meta/lib/oe/buildcfg.py
> +++ b/meta/lib/oe/buildcfg.py
> @@ -71,6 +71,19 @@ def is_layer_modified(path):
>          # output and a 129 return code when a layer isn't a git repo at all.
>          return " -- modified"
>
> +def get_branch_rev3(revisions):
> +    # Return 3 items for each revision
> +    return ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
> +
> +def get_branch_rev4(revisions):
> +    # Return 4 items for each revision
> +    return ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
> +
> +def get_bitbake_revision():
> +    bbdir = bb.__file__.rsplit('/', 3)[0]
> +    return [(bbdir, os.path.basename(bbdir), get_metadata_git_branch(bbdir).strip(), \
> +            get_metadata_git_revision(bbdir), is_layer_modified(bbdir))]
> +
>  def get_layer_revisions(d):
>      layers = (d.getVar("BBLAYERS") or "").split()
>      revisions = []
> --
> 2.44.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204386): https://lists.openembedded.org/g/openembedded-core/message/204386
> Mute This Topic: https://lists.openembedded.org/mt/108393122/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

