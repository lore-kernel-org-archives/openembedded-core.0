Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1F3C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:22:44 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.2631.1712082154190433297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kslv2xu7;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d718efedb2so81479511fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712082152; x=1712686952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NRkqrjHQsaH6fWt6VDqEeFyaJ+LNh1SIdZLn77IEtJ4=;
        b=kslv2xu7CTZk2LNTXet+/J6AtBgVL0PLI3Ow8rZpnaK3jjjh59nakiroQfwAFjtPQt
         RbjtiBDyvbHPIRaXV528cRRuf+SU/meEhOnqN5ShNsxl68gxdNrVOwo+teoC2L97TJyT
         CEHhxZnhKuNW/Y+4sf4Whx3MpO73ZW9EsreJOPTSZ+ooJorHZVPg2guKidyKr7AEpLzi
         owBOd7IILqFeecsamQ27wr+do4JRja/j8l/l/vTUyOkOXXl4CXYyEjfag8345wsbihf5
         VohrJgFU2mIhp45U+hteMWKpBJ8QC1RjcwZf4jFN7GGf73G66CRdaIciwq4/1FNvgyhm
         uTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712082152; x=1712686952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRkqrjHQsaH6fWt6VDqEeFyaJ+LNh1SIdZLn77IEtJ4=;
        b=tAuBUWyEGr8FiGRMyDU8BCx6espEMw4Vm3HJSp0Z0fE+qZMZRgEE5/E+LjSbgMHXGP
         IntTV4fmB4/N/e7GYYDXI+ZLVLCRqGvRqfAwGDA91VObpz2dcIM+qkqNqKVDS1Dm4NRH
         hscOkP7nEnsHtO4bZSeCZPdM2AFa8idzEtdAONDuYp/Ad0u4j+EOf30LA8a1ry2xCZLl
         C0v9pSyKhWWySakJfLdE/pXISUclzUBoDus79K5aCeBjcQ3ZIWJLh68HSzrLRoXHDMCK
         gwnHFiToNXhpoZGsBse2pIS3FVb1/SFGVnlqnDzgyUy4/GNrMTLvu1r2SfGR54SUm0YI
         WvRg==
X-Gm-Message-State: AOJu0YwxpHlB+UmxYMJARtlvfd9QAu7nUreXjkJutDFNfIFmVGsZVWrz
	5vZ7n2aRdqmBUh/jhP6NgVM7o20Rr4BL7scpqEY9od6hVsDuHP0c1zda+ZDpcUSdQEZ1R/2U+H0
	IjF9MAqhKZrwKsV5INAc41WJSj7o=
X-Google-Smtp-Source: AGHT+IFtn50EX9+0wNP2AGHzfkzt4VdYMvG23PAkKciEz+AsinVTdaoh6IiAX5C130FB8/2ZWCBA7lAVFcLGvrkyX+w=
X-Received: by 2002:a2e:a168:0:b0:2d8:d91:d77a with SMTP id
 u8-20020a2ea168000000b002d80d91d77amr2296787ljl.5.1712082152088; Tue, 02 Apr
 2024 11:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240402180900.2306005-1-jdmason@kudzu.us>
In-Reply-To: <20240402180900.2306005-1-jdmason@kudzu.us>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Apr 2024 20:22:26 +0200
Message-ID: <CANNYZj8=QBs13KN1eMWhFb=p26MWRrJorVSQrdRKk7i3PkUFHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] recipeutils: use UPSTREAM_CHECK_URI in get_recipe_upstream_version
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 18:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197877

Have you confirmed that this does not break 'devtool check-upgrade-status' ?

Alex

On Tue, 2 Apr 2024 at 20:09, Jon Mason <jdmason@kudzu.us> wrote:
>
> Currently, get_recipe_upstream_version blindly takes the first entry in
> SRC_URI to see if the recipe is at the latest version.  If
> UPSTREAM_CHECK_URI is specified in a recipe, it is probably what should
> be used to check for the latest version.  Use that as the first check,
> otherwise default back to the first entry in SRC_URI.
>
> wget was doing it's own check for UPSTREAM_CHECK_URI.  Removing this in
> favor of the common one now being done in recipeutils.py.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  bitbake/lib/bb/fetch2/wget.py | 37 +++++++++++++++--------------------
>  meta/lib/oe/recipeutils.py    |  9 +++++++--
>  2 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
> index dc025800e659..0342f895646d 100644
> --- a/bitbake/lib/bb/fetch2/wget.py
> +++ b/bitbake/lib/bb/fetch2/wget.py
> @@ -629,27 +629,22 @@ class Wget(FetchMethod):
>              return ('', '')
>          bb.debug(3, "latest_versionstring, regex: %s" % (package_regex.pattern))
>
> -        uri = ""
> -        regex_uri = d.getVar("UPSTREAM_CHECK_URI")
> -        if not regex_uri:
> -            path = ud.path.split(package)[0]
> -
> -            # search for version matches on folders inside the path, like:
> -            # "5.7" in http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
> -            dirver_regex = re.compile(r"(?P<dirver>[^/]*(\d+\.)*\d+([-_]r\d+)*)/")
> -            m = dirver_regex.findall(path)
> -            if m:
> -                pn = d.getVar('PN')
> -                dirver = m[-1][0]
> -
> -                dirver_pn_regex = re.compile(r"%s\d?" % (re.escape(pn)))
> -                if not dirver_pn_regex.search(dirver):
> -                    return (self._check_latest_version_by_dir(dirver,
> -                        package, package_regex, current_version, ud, d), '')
> -
> -            uri = bb.fetch.encodeurl([ud.type, ud.host, path, ud.user, ud.pswd, {}])
> -        else:
> -            uri = regex_uri
> +        path = ud.path.split(package)[0]
> +
> +        # search for version matches on folders inside the path, like:
> +        # "5.7" in http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
> +        dirver_regex = re.compile(r"(?P<dirver>[^/]*(\d+\.)*\d+([-_]r\d+)*)/")
> +        m = dirver_regex.findall(path)
> +        if m:
> +            pn = d.getVar('PN')
> +            dirver = m[-1][0]
> +
> +            dirver_pn_regex = re.compile(r"%s\d?" % (re.escape(pn)))
> +            if not dirver_pn_regex.search(dirver):
> +                return (self._check_latest_version_by_dir(dirver,
> +                    package, package_regex, current_version, ud, d), '')
> +
> +        uri = bb.fetch.encodeurl([ud.type, ud.host, path, ud.user, ud.pswd, {}])
>
>          return (self._check_latest_version(uri, package, package_regex,
>                  current_version, ud, d), '')
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index de1fbdd3a8c8..a42609060cd9 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -1041,8 +1041,13 @@ def get_recipe_upstream_version(rd):
>          ru['datetime'] = datetime.now()
>          return ru
>
> -    # XXX: we suppose that the first entry points to the upstream sources
> -    src_uri = src_uris.split()[0]
> +    # If UPSTREAM_CHECK_URI is specified, assume it is correct and use
> +    # it.  Otherwise, use the first SRC_URI specified to determine the
> +    # latest version.
> +    if rd.getVar('UPSTREAM_CHECK_URI'):
> +        src_uri = str(rd.getVar('UPSTREAM_CHECK_URI'))
> +    else:
> +        src_uri = src_uris.split()[0]
>      uri_type, _, _, _, _, _ =  decodeurl(src_uri)
>
>      (pv, pfx, sfx) = get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri_type)
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197876): https://lists.openembedded.org/g/openembedded-core/message/197876
> Mute This Topic: https://lists.openembedded.org/mt/105293221/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

