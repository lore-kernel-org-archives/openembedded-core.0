Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88834CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:36:05 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3829.1778664957518861823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 02:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MQAWyrm9;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d67a483d3eso725233585a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 02:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778664956; cv=none;
        d=google.com; s=arc-20240605;
        b=fbRiYD2hartv7KtEdFpsO3sd6Xd1RoeDBE4chm/4043R22wKlus5UgCpJ8G4IOs6Rv
         aeC4C02iMpWWexJ4oJcMk9cz+ByAcNeKilMBr8afyjg6ZB2+An88cPioCS18MvVdKQdD
         mJmwgRkFLjHniav/MVSuzm0I5Jn97SL7oyeoXQWDS4+CvwPBvERt/+bthu7MdzROT1Cq
         f7csS1+rhzcEPWJ0BAzTpJ4b/XShp/Zk9HdlPhFAEfIHg6fRNmt/EqV+3OQJCd8qrzI0
         0w1arQkCIDlvNQwXinQhn5OUaOkci/GmeQTUX0Dl8zDpfPed43Tte3La7qVDxfFDXwN/
         o9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yd9I0UKXlIEhEoDeJoflrVURfsxm5Q5574IlWUafgGw=;
        fh=w8s5AAZ32cVVW/gqKg+0B/KG/oSMuHoUCicycdGLVe4=;
        b=dIOgBdy1dQMiyC84mwusCzQ2qgw4rkGhq+wyMpU2icoUa1ItK0Jo3U96r9Ie6+rrQF
         jovluomL1fACEoi+MPB9qcORg7nfRfOKKtlSGfmpdCQ66mi79+JTOUxAmje+CBh34C7H
         BajlVL5/7PtRZRszewYF/VEbjfT0e+kXZFdwW4ad8tMRqXRfwWG573mgboJiOJPlVzBu
         Ao/oq8TQopZ3KGzJUIoy+SqzloYo2mM0sPAeC8GxN3FFhJ1h7oE/L+oCk3/UT4vgEa9O
         ++oyR9TNOsUGfowAt9AW2gYBjOzuCrP1hbqEUSQA50dL5Cf2nE3aIinNolykWyHd6qF1
         gRAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778664956; x=1779269756; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yd9I0UKXlIEhEoDeJoflrVURfsxm5Q5574IlWUafgGw=;
        b=MQAWyrm9TRR3XsAYZTXWXER0G7MuQ/kzhiE3B4R3leaiMIK7957odUHx9uATO6K1J2
         XGZ+qiHBz7yiviVpiXiygajaGViz1BJwO0EPTW7XYLSXpfJv63qjmDCZXe1WkvWeti01
         poZI/MFxD/2HvvVyqZBgJjQ2UZwajg/X8gwSZHltqhfx6O5Faz96imHFriEq1xalwDwf
         ulgazqcf1NjtJSsJ1UymruXEQbFHy8VdYu/tCTOZcXeHRQiPAXqODbDZo74JzUL/5w/x
         M5HG/jWHPbGu7Vk2L4iuuQqJiUDiZ9C+JO8t9DohDhzohwGDnNnSbaBW+s5fgNFhD1hh
         BeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778664956; x=1779269756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd9I0UKXlIEhEoDeJoflrVURfsxm5Q5574IlWUafgGw=;
        b=rC63JRfmQqPFi7hRPmo/4gsMqBFyT72KlF5HtfdqoO/lvu48lyFtFR48v7PtXNq3uF
         uHvvxUhQgW2v4PH6dBuqVLUxg9RD9HLJyo+pSq9GCmOGdr3C9H2bbaCzgkL7DqKm9RvQ
         PAn4qIFbLBwUa2AV1K52EUtW/cxI4VOOu749frw49Mi75O6qVQ7N3owNiD28GJTZcwn5
         PxLfLY5o9T/eALkfJV486iTL0h4M3CBIlVXxpzcHD1FImjMvRLcro3gCIPyxRyIuy8BQ
         MIdRsmouNZy/qs+4+72gN3fbYrFYq+CR3WUvgwKbcTFV7kEZTqDH8vxmD6lt2dh4dzzX
         7Cyw==
X-Gm-Message-State: AOJu0YxmaevK/getbasc6NvtzhvaIrRiHjj3/VKayyy7p0TbhODWiOPw
	azplFNWOk2/GXwQjLzY4rWlVOy8gcRi435LG/qGEjc7Au/6Jhcrx59Nv45sjaDrNAsCEq5oaDUT
	D2xVtWahLXcT85P4s2BQKxfHQQezs1G8=
X-Gm-Gg: Acq92OH0hKVsLklejdNuwhR65/YsJej85whAM4BGkEoOb4baV2nL9363ZGIQDwsenQu
	eIuHHKpSNBeBHT9q8lmucisUiKgyQyQPqmmc54ZWmF04LKQMr7Y4mYRmNtEHP009Db9aN3ehkIj
	houvER3mTZmvFWMq0vts+hJMynr1WM52uwpLZl6vtlKlWiI2lFQH6bfawI8R2nwGRUVQwbwlgwh
	GaBJ3/bS4jx1CZ6kYuZ2bABFRq0U4rxtavmYqOmEv8aZN+az5XadJbKSHATPhZ7SGAVhdh55QfX
	2GsqHHqF2Gp0qTlaYariAHMjKjwubqDElm6k6JRdWw==
X-Received: by 2002:a05:620a:2906:b0:8da:358a:c482 with SMTP id
 af79cd13be357-90f88d99a29mr430230885a.12.1778664956459; Wed, 13 May 2026
 02:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
In-Reply-To: <20260513052334.2271800-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 May 2026 11:35:45 +0200
X-Gm-Features: AVHnY4KVTqDyS9AUv96cEBG5xndjqd9pXfu2FqMnYW9ca3roT5fRDSBaEVN4CUY
Message-ID: <CANNYZj9EA+69R7FCj4WH3MB0q9kCv1HQdCU800uomD0hCt3K2A@mail.gmail.com>
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	Daniel Turull <daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236952

Thanks, I think this is good and ready. I'll pick the auh patch when
bitbake and core patches merge.

We can add more recipes over time (e.g. openssl, webkit, glib, ...),
they don't have to be in the initial patchset. Probably a review of
scarthgap/whinlatter/walnascar/styhead commits can help identify more
recipes with stable maintenance releases as well.

Daniel's changelog extraction patches will also help a lot, take a look at them.

Alex


On Wed, 13 May 2026 at 07:23, <Qi.Chen@windriver.com> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We want the ability to do stable version upgrades for recipes.
> To this end, add an optional stable_upgrade parameter to the
> get_recipe_upgrade_status function, which defaults to False and
> when enabled will try to get the latest stable version of the recipe.
>
> The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
> it, it will be used as the filter_regex. If it's not set explicitly,
> it means that there's no stable updates or the recipe hasn't been
> checked yet.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index c6604f536d..7c1df518a8 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
>
>      return (pv, pfx, sfx)
>
> -def get_recipe_upstream_version(rd):
> +def get_recipe_upstream_version(rd, stable_upgrade):
>      """
>          Get upstream version of recipe using bb.fetch2 methods with support for
>          http, https, ftp and git.
> @@ -1080,7 +1080,15 @@ def get_recipe_upstream_version(rd):
>              except bb.fetch2.FetchError as e:
>                  bb.warn("Unable to obtain latest revision: {}".format(e))
>          else:
> -            pupver = ud.method.latest_versionstring(ud, rd)
> +            if stable_upgrade:
> +                stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")
> +                if stable_release_regex:
> +                    pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
> +                else:
> +                    # Not explicitly setting "UPSTREAM_STABLE_RELEASE_REGEX" means there's no stable upgrade
> +                    pupver = (ru['current_version'], None)
> +            else:
> +                pupver = ud.method.latest_versionstring(ud, rd)
>              (upversion, revision) = pupver
>
>          if upversion:
> @@ -1094,8 +1102,8 @@ def get_recipe_upstream_version(rd):
>
>      return ru
>
> -def _get_recipe_upgrade_status(data):
> -    uv = get_recipe_upstream_version(data)
> +def _get_recipe_upgrade_status(data, stable_upgrade):
> +    uv = get_recipe_upstream_version(data, stable_upgrade)
>
>      pn = data.getVar('PN')
>      cur_ver = uv['current_version']
> @@ -1119,9 +1127,10 @@ def _get_recipe_upgrade_status(data):
>
>      return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
>
> -def get_recipe_upgrade_status(recipes=None):
> +def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
>      pkgs_list = []
>      data_copy_list = []
> +    stable_copy_list = []
>      copy_vars = ('SRC_URI',
>                   'PV',
>                   'DL_DIR',
> @@ -1134,6 +1143,7 @@ def get_recipe_upgrade_status(recipes=None):
>                   'UPSTREAM_CHECK_REGEX',
>                   'UPSTREAM_CHECK_URI',
>                   'UPSTREAM_VERSION_UNKNOWN',
> +                 'UPSTREAM_STABLE_RELEASE_REGEX',
>                   'RECIPE_MAINTAINER',
>                   'RECIPE_NO_UPDATE_REASON',
>                   'RECIPE_UPSTREAM_VERSION',
> @@ -1180,12 +1190,13 @@ def get_recipe_upgrade_status(recipes=None):
>                      data_copy.setVar(k, data.getVar(k))
>
>              data_copy_list.append(data_copy)
> +            stable_copy_list.append(stable_upgrade)
>
>              recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
>
>      from concurrent.futures import ProcessPoolExecutor
>      with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
> -        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
> +        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, stable_copy_list)
>
>      return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
>
> --
> 2.34.1
>

