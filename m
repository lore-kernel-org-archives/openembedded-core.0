Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A65C531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:52:53 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15869.1784886765739570836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TT2Vu7hB;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e99ef0902so14565185a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784886765; cv=none;
        d=google.com; s=arc-20260327;
        b=H5en37GtFZUvTiKw5OWwiN6JDu9WOTcQx0iMxZfbpihvBR1NSM+v8wM8XtQxlNm6jv
         Pm5j+gk/zpVVWdffXhwE5LmUnef+IZ868uM1bRaUWc03r89au/Lj4XhOQglZ6oALe7fQ
         OngJGDcfyVBqq7NYPZSWi0sOTIFXsNeptCkKsuwpzpTgbfVlmVWAhW8rdqkQXbzms9un
         QZVVv0/rCeibSpOb5cCQEDWEibxa0MJeLPx2plFnIAn0vsRRf1a+778gzXmw3LdJsKeN
         BF5wfLdMc0r1GhOIQWA8TytrIS5hTbAO7yFnlDxNciiLrUbTe1OsAH5jwiDFOOtUgdJu
         yleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h+6GLYPSm7eiR/qkBSYELmwcJXUKRgiT3nvL5Vw4A64=;
        fh=MGoci+HlFs+rZcqdUi+OCNtBJnOd9nVPgE160dXJS+w=;
        b=Kg4rRB/tW+iyZvUVWhohqBhx9Ec6nVO9y51jH+lQ6cgBlSlRj7VuQUSFEXSznAjFgG
         pwYIyzdH7NO+wPYh72LdW3SYMKpADuzMa/6vvAMJAbg8i7frpu4fxvx2oeF0hZpzGTTq
         /G6oKGg9AOInsFVKuT+PtzdXDciBwz2LlYr555cxUwV3qPqOPTLLuyI6W/VlgkfbfYBn
         aEYLXfrCnpLuCm/f2oDQQuzy0AOHR6wZZ5vG2325hXSrzuzqnQTYw8vi5HHyi/DVvzCB
         UjpTIyts8LNuJ1yEXANjSiD0Toz57jF7nwhKVo1dI+IRAgcY4LGti7zVqWqxWpNP2J7i
         VpjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784886765; x=1785491565; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+6GLYPSm7eiR/qkBSYELmwcJXUKRgiT3nvL5Vw4A64=;
        b=TT2Vu7hBmfGrv/PNW67SBU6eTk3Bca9i194O9d5icPXQOUgOlZEvJwiC0b8oWQJ1Xm
         7WhsS6EpsDBxXGdOn18oMdVpwpxbVlNU2Pc/7Odb9an5EbavcUeeBkoXl2w71YXZGK7t
         3NG8LPKYper+o9UjsaV77czd5LK6f0RTiVRXvDK2EXwoBCQJSDjwFXIR95uM8qaIb8K7
         qqe2n42nOCJUaMxMETyC3ibfQPYcdhm/xSrDXQu1s32pjJWb1hnfIuJ4tw6A/OUtC3Ry
         LbJAhZvxc06umBsYb9/Wqbs7fh6p3Ak5WI9eSzPGk5Vj5OL8DgpGUIbY003PC5/BEpfK
         ffvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886765; x=1785491565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h+6GLYPSm7eiR/qkBSYELmwcJXUKRgiT3nvL5Vw4A64=;
        b=Ry4PYoXZYGMBwjCaZU+VRbKRDy/RzhkLes7khBV9TfmGGsbHvynoXkAtxNMmFQFhGq
         CgwnZVNt0nJLkHYtIEg/o04kdi4LPKuhrlaeZbRXMdEZTLRnv1RuUl3pUOQbUQQVBgyJ
         6pRelveto6zmeNacSbI8VfafiPVYSEoCPZBFJJAJxYmkbZ8tXXXFSYhvzdIXHEK2GnNZ
         S8CZau2fkN8nhOyRV1m6846qjwmx0bACgeXRkzJAfOCW+AbvVB6VTIZhjzfdLIS68YSt
         UNaFRNmCYTLcttEr7S2upDWqm1SguJcvczXq8vXnZSqK8LZ8AjXdTND6S5ca+3VFZxwF
         pxVA==
X-Gm-Message-State: AOJu0YwX8oxFVlICcZSdZpOn2ZZTHhqhqfTYZmfGQZgT0zy+mPGcnw05
	culxI0yXFsunIw8u7dHmOVa/cOCW3UNkRUjjBUc8INgWb3abz0Wa/Zrvuyu2Yc8mnCOwsSj4W9O
	w7xrqgX2GP1D8Jfuf3tfSddJC/354OWW9Yw==
X-Gm-Gg: AR+sD12PvMcTKRpkrukxH2rnBBhASRzZTvj0x0IlaCj8ourAcafN18hGz8cVQHo9b8j
	YXiVuqjoaTaSrtONN61uTcCWc+VVbAkOkPt+Jphx+WMkWqVHgDyHdvoIB5f1Ef0HLDvD7wDJ+Zt
	zDwUGeB3YSE/Q4svqfkP6vog3h+tLSDR/qbUw54SWuEQVHawh+WrHGVNZzlpn42rwI7ChhKv7zs
	xwAx8nb3Gxzmoismn+2i0y23ddg/1XrkX2nVcy95gw9ospN8MGOTl89/ma3pMhOHwnHvGxrUJ4j
	/AeAiFaV7x9C5KMZ+OL/
X-Received: by 2002:a05:620a:d94:b0:92e:cf8e:67b9 with SMTP id
 af79cd13be357-93103618fcemr720748285a.21.1784886764363; Fri, 24 Jul 2026
 02:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260723215210.29263-1-shrchakr@cisco.com>
In-Reply-To: <20260723215210.29263-1-shrchakr@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jul 2026 11:52:33 +0200
X-Gm-Features: AUfX_mwqqErG4OmUKGzT4oIc6ZDxJZr11YuytBppZ0xGNDpCznsDf4FUI_2R7nE
Message-ID: <CANNYZj_aK-UDShPntEvTqc9QqeRSTARwH_6HW035LrBLzMYCrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] FIXMESTAGINGDIRHOST is not getting restored
 properly for all recipes
To: shrchakr@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241925

Can you please provide a reproducible example where this is not
working properly?

Alex

On Thu, 23 Jul 2026 at 23:52, Shramana Chakraborty via
lists.openembedded.org <shrchakr=cisco.com@lists.openembedded.org>
wrote:
>
> Expectation is sstate_hardcode_path_unpack will perform the exact reverse
> operation of sstate_hardcode_path.
> But FIXMESTAGINGDIRHOST is not getting restored properly when the artifacts
> are fetched from shared state for recipes which requires both host and
> target to be restored. This was introduced by 0875107.
>
> Fix the unpack logic. There are effectively two cases, native and
> cross-canadian require only host and everything else require both host
> and target.
>
> Signed-off-by: Shramana Chakraborty <shrchakr@cisco.com>
> ---
>  meta/classes-global/sstate.bbclass | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
> index 34a59fda00..9d62855bc0 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -420,10 +420,8 @@ python sstate_hardcode_path_unpack () {
>
>          if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
>              sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
> -        elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
> -            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (staging_target, staging_host)
>          else:
> -            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g'" % (staging_target)
> +            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (staging_target, staging_host)
>
>          extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
>          for fixmevar in extra_staging_fixmes.split():
> @@ -581,7 +579,7 @@ python sstate_hardcode_path () {
>      # staging packages.
>      #
>      # Note: the logic in this function needs to match the reverse logic
> -    # in sstate_installpkg(ss, d)
> +    # in sstate_hardcode_path_unpack(d)
>
>      staging_target = d.getVar('RECIPE_SYSROOT')
>      staging_host = d.getVar('RECIPE_SYSROOT_NATIVE')
> @@ -590,9 +588,6 @@ python sstate_hardcode_path () {
>      sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % staging_host
>      if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
>          sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
> -    elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
> -        sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
> -        sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target
>      else:
>          sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
>          sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241874): https://lists.openembedded.org/g/openembedded-core/message/241874
> Mute This Topic: https://lists.openembedded.org/mt/120418060/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

