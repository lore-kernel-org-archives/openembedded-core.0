Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06B6C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 21:02:57 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.5583.1749762177146798692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 14:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HT2WQWma;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so153891285a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749762176; x=1750366976; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV8kwE4JGADSKgMhl1G1MJxaETExAv9rr8V0LNnjdLo=;
        b=HT2WQWmap0MEhzq0SoLriD5UlEwvA3jDTU3Db7kedxwW6sRjIOHYB0JSlaUdECeQD4
         zS8DrdgcZahE1ws/jXeIpZ+fBR7NylxVkku3C7wRM4fK0/kphOKAFF3tZx/d31ePhjgp
         3k8uGcRRxVgUVS98al0q+fH0IDIsvi4liq4HrZLKv4RrMrC2jjZef4N0fnzD6sFuiEdG
         n/LlsjpGb1QywNzQH8/vkkeVKBYxs9y0N4lG7nDs1Q5EC0OhrSzlQFAK4OSKjdwxwNvR
         Gnz6kqGo14s3bls3HgmPNjCUn567e9r+e8bXrvxbVteNGx4HP5ARx6LjSZZ5bu2UaFCd
         i4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749762176; x=1750366976;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV8kwE4JGADSKgMhl1G1MJxaETExAv9rr8V0LNnjdLo=;
        b=UO2XvAounygsnmDmXNrjOnn9HesuszHlopF7hfiZRqb4PkMHgQ8GCQ/LPi9gEcL2Rk
         9TiajGiyqxOyzAySUtkp+g68GrqwqQ4bWzsIAPiuXKrvSssPDKzJ7oy5t96BlQvLHSrw
         8JjBmn8dzRiDrRymE/+0hmucuB+wFW7QeG87jNpPuzTM3RN+ASbD5ua9kk4ot3QzagR/
         piYJVBHT9xXia454iKMvu3y3XXnDM2TZIIwsjbGN298abEKA3uV5G5hEpOxJUqU+MP9d
         WgQl/ElyzjqWT5zR3Fvsdz0MYBxoj+DaHiH0E24OZjIYvwYEkFjVFXoU1MkGkWq9I1Kz
         Zkvg==
X-Gm-Message-State: AOJu0Yyx+ecN9o3EpCrsfBStI/LE6LyPVsxzQZnwWuty1UHb6AKLgby1
	sIolLiVmn1IJpU2gOW7dpxcXmXjiQPnQbZYNNZmFU8k0za6JD0fo5/fS
X-Gm-Gg: ASbGnct4m4AxVDWZc+46wJjUp4PpcmCemKlLr6qKGtQEpJEkcRssNUD98Wtg6fMT66n
	wRxEpqC+6x9yvd6yr5+/WbKvKOSSqB9eMXHqDAG+sPgvOmYmXOPusPz5dSd/DU7oFL8IktSARzi
	dxGicFfIvxIBhcU29fhNQ53EK5NRcc+1x7V4yhn/LD2yL3kxi6i3NDAdJVCFdO9uxBZDj5zWiW0
	sA9cnMnxxHjQ42/0a2r1cxswt6H6nSXyU3KFZ5nizfPOAhdBXelZRO1FOZLE5Z+a5WD1Umd8+Nd
	eSwOUvXC/SsgX9ZxjmLa5vmiArwsI3tK+RE2S33TSaBbmL+Coe3yAH36JgCFq7/1wmOwZJok9T0
	RoZ9n0qvZc86QGRr8bTal1P6v
X-Google-Smtp-Source: AGHT+IHcb7TC5ffM3+isw7WieMVz5JLj9gJQ0inYeTWftXQ5hrehkzcKN2HJg/uyenRyj6eIDjUysQ==
X-Received: by 2002:a05:620a:a918:b0:7c4:bca3:6372 with SMTP id af79cd13be357-7d3be708366mr12744685a.0.1749762175968;
        Thu, 12 Jun 2025 14:02:55 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dca057sm84465485a.21.2025.06.12.14.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 14:02:54 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:02:52 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: anibal@limonsoftware.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, Ross.Burton@arm.com,
	bruce.ashfield@gmail.com
Subject: Re: [OE-core] [PATCH 1/3] wic: pluginbase workaround on invalid
 module filenames
Message-ID: <20250612210252.GA4509@localhost>
References: <20250611153319.54778-1-anibal@limonsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611153319.54778-1-anibal@limonsoftware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 21:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218537

On Wed 2025-06-11 @ 03:33:17 PM, Anibal Limon via lists.openembedded.org wrote:
> Apply a workaround on invalid identifiers replace '-' to '_' to load
> the module with valid identifier.
> 
> Let the user know (warning) about plugin doesn't has a valid module
> identifier to encourage fix, it gives time before rename oe-core wic
> plugins and drop workaround.

As far as I'm aware, everything in wic currently works, despite these bad
names. I'm curious to find out what your use-case is that prompted this patch.
Are you hoping to use these plugins with another tool?

> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
>  scripts/lib/wic/pluginbase.py | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
> index b64568339b..ec515229e7 100644
> --- a/scripts/lib/wic/pluginbase.py
> +++ b/scripts/lib/wic/pluginbase.py
> @@ -8,6 +8,7 @@
>  __all__ = ['ImagerPlugin', 'SourcePlugin']
>  
>  import os
> +import sys
>  import logging
>  import types
>  
> @@ -20,7 +21,8 @@ from wic.misc import get_bitbake_var
>  
>  PLUGIN_TYPES = ["imager", "source"]
>  
> -SCRIPTS_PLUGIN_DIR = ["scripts/lib/wic/plugins", "lib/wic/plugins"]
> +SCRIPTS_PLUGIN_WIC_DIR = "wic/plugins"
> +SCRIPTS_PLUGIN_BASE_DIR = ["scripts/lib", "lib"]
>  
>  logger = logging.getLogger('wic')
>  
> @@ -40,7 +42,9 @@ class PluginMgr:
>              cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
>              layers = get_bitbake_var("BBLAYERS") or ''
>              for layer_path in layers.split():
> -                for script_plugin_dir in SCRIPTS_PLUGIN_DIR:
> +                for script_plugin_base_dir in SCRIPTS_PLUGIN_BASE_DIR:
> +                    script_plugin_dir = os.path.join(script_plugin_base_dir,
> +                                                     SCRIPTS_PLUGIN_WIC_DIR);
>                      path = os.path.join(layer_path, script_plugin_dir)
>                      path = os.path.abspath(os.path.expanduser(path))
>                      if path not in cls._plugin_dirs and os.path.isdir(path):
> @@ -53,13 +57,26 @@ class PluginMgr:
>                  if os.path.isdir(ppath):
>                      for fname in os.listdir(ppath):
>                          if fname.endswith('.py'):
> -                            mname = fname[:-3]
>                              mpath = os.path.join(ppath, fname)
> +                            # If module doesn't have a valid identifier let the
> +                            # user know and apply a workaround replacing '-' 
> +                            # with '_' to load module with valid identifier.
> +                            mname = fname[:-3]
> +                            if not mname.isidentifier():
> +                                logger.warn("invalid identifier at plugin module"\
> +                                            " %s, please fix it.", mpath)
> +                                mname = mname.replace("-", "_")

There are several ways that a module name could be incorrect in addition to
using dashes (upper vs lower case, periods, etc), and I believe runs of
dashes/dots/underscores are to be replaced with a single underscore:
https://packaging.python.org/en/latest/specifications/name-normalization/#name-normalization

So if we do move forward with this, maybe it should be expanded to include all
the cases.

> +
>                              logger.debug("loading plugin module %s", mpath)
> -                            spec = importlib.util.spec_from_file_location(mname, mpath)
> +                            spec = importlib.util.spec_from_file_location(
> +                                     mname, mpath)
>                              module = importlib.util.module_from_spec(spec)
>                              spec.loader.exec_module(module)
>  
> +                            cname = os.path.join(SCRIPTS_PLUGIN_WIC_DIR,
> +                                                 ptype, mname).replace('/', '.')
> +                            sys.modules[cname] = module
> +
>          return PLUGINS.get(ptype)
>  
>  class PluginMeta(type):
> -- 
> 2.39.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218458): https://lists.openembedded.org/g/openembedded-core/message/218458
> Mute This Topic: https://lists.openembedded.org/mt/113590717/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


