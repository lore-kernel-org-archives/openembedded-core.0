Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF4DC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 20:04:21 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.89154.1657051430970989565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 13:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=v6rHnwla;
 spf=temperror, err=temporary DNS error (domain: sakoman.com,
 ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id y4so3319165edc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HAccXi49dEhgTucIJvwPkMINJXyMtp17e6tb2pJEpPE=;
        b=v6rHnwlagAG5I/aPbwpsnAx/hUnAFfg/XleqNbtJJZDcmE6006Mhl41qXQLQ0RKF62
         2yngsj3xQiv0HYjMXnyqsMlQtzJdbhvycMIiMij07NF/krmwajvpm9YEWvqXFSI4JGsb
         7TheA9UjLSfovoY3OyD6RUVE6m6wUg6hVHM8zHWRp7yMu2cTnKU3ueQN4r7ZGp8A5KfB
         yySQ9/kJfZGzH7NAVTcpGIl5xW+P9USaQ2hO+vKXREF3QhxjtkEdbZ6b3Z2U+PLcKZGH
         Z6vKsmVR89qEbt1A79ow6fqkG9Zs7wvFvzW8ee3B7k7jS+SJjyoyGUliJbroZgg2IMJq
         wx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HAccXi49dEhgTucIJvwPkMINJXyMtp17e6tb2pJEpPE=;
        b=EXwj6NST+BQ/ZmTpJR7otrrgVwYW6zKq3vhQWI2gHMJIYODx/SivIscTM6XxdiWisR
         lKlUZgWETQaLkNBKSmg2NQ1Qc3jxMjkPKmlPVyxcuMrHA8GWac5CAWz49pIP44lXyGCq
         pI7HdywxM0RbvCzu/hKmNswmu9YtSRodoeQ0jI4EVVSvj3ZC9iRhi8e6EZJpXq4Gzf/V
         rDTyRtJZhUY+soOTBpU6PB8liA4aoUVuc3PQUbRmRq38nFBcyhQJa3OjMstE2XKyEKDK
         mp3zUMuf0amMacX2KQhMrzhCbiPXaQS2aJ0u+gpIdQ6RgZ26GhVB5ZqskRnVB6oaiCFV
         Ndhw==
X-Gm-Message-State: AJIora88IKjFppBvcY5Dy4V13/ItK0SS09VXRS9bp9FjMCB01SL9Mueu
	k59oz3RtlnN7FMTlE6aAj2eYVJB2FCbDCJuIV+y8OQ==
X-Google-Smtp-Source: 
 AGRyM1sEUwYPyZVkDjf/EffZfDoOug7D7U92D2QokYHMGIDtAlW7PouUCWKrP887ehkgVHE0hts7gq6MXOjht+7s/p8=
X-Received: by 2002:a05:6402:1606:b0:43a:2204:8b5e with SMTP id
 f6-20020a056402160600b0043a22048b5emr20777690edv.316.1657051425268; Tue, 05
 Jul 2022 13:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220630184804.345-1-flowergom@gmail.com>
In-Reply-To: <20220630184804.345-1-flowergom@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Jul 2022 10:03:34 -1000
Message-ID: 
 <CAOSpxdYXOFaXx4noDfruBZZArUsGZpnQp-p5E-JbfSg-LMQO0w@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] epiphany: fix CVE-2022-29536
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 20:04:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167680

I'm getting a do_patch error with this change:

ERROR: epiphany-3.34.4-r0 do_patch: Applying patch
'CVE-2022-29536.patch' on target directory
'/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/epiphany/3.34.4-r0/epiphany-3.34.4'
Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/epiphany/3.34.4-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2022-29536.patch
patching file lib/ephy-string.c
Hunk #1 FAILED at 115.
1 out of 1 hunk FAILED -- rejects in file lib/ephy-string.c
Patch CVE-2022-29536.patch does not apply (enforce with -f)

I took a quick look at failing file, and it is indeed slightly
different than what the patch assumes.

Steve

On Thu, Jun 30, 2022 at 8:48 AM Minjae Kim <flowergom@gmail.com> wrote:
>
> Fix memory corruption in ephy_string_shorten()
>
> Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106]
> CVE: CVE-2022-29536
>
> Signed-off-by:Minjae Kim <flowergom@gmail.com>
> ---
>  .../recipes-gnome/epiphany/epiphany_3.34.4.bb |  3 +-
>  .../epiphany/files/CVE-2022-29536.patch       | 45 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
> index e2afb29c12..6f04324d4e 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
> @@ -16,7 +16,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
>  SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>             file://0002-help-meson.build-disable-the-use-of-yelp.patch \
> -           "
> +           file://CVE-2022-29536.patch \
> +          "
>  SRC_URI[archive.md5sum] = "a559f164bb7d6cbeceb348648076830b"
>  SRC_URI[archive.sha256sum] = "60e190fc07ec7e33472e60c7e633e04004f7e277a0ffc5e9cd413706881e598d"
>
> diff --git a/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
> new file mode 100644
> index 0000000000..c2160b471d
> --- /dev/null
> +++ b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
> @@ -0,0 +1,45 @@
> +From 79725738500917cf5e4d829c76753cfb4c68be7f Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Fri, 15 Apr 2022 18:09:46 -0500
> +Subject: [PATCH] Fix memory corruption in ephy_string_shorten()
> +
> +This fixes a regression that I introduced in 232c613472b38ff0d0d97338f366024ddb9cd228.
> +
> +I got my browser stuck in a crash loop today while visiting a website
> +with a page title greater than ephy-embed.c's MAX_TITLE_LENGTH, the only
> +condition in which ephy_string_shorten() is ever used. Turns out this
> +commit is wrong: an ellipses is a multibyte character (three bytes in
> +UTF-8) and so we're writing past the end of the buffer when calling
> +strcat() here. Ooops.
> +
> +Shame it took nearly four years to notice and correct this.
> +
> +Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106>
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106]
> +Signed-off-by:Minjae Kim <flowergom@gmail.com>
> +---
> + lib/ephy-string.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/ephy-string.c b/lib/ephy-string.c
> +index 509490c86..d678803ad 100644
> +--- a/lib/ephy-string.c
> ++++ b/lib/ephy-string.c
> +@@ -115,11 +115,10 @@ ephy_string_shorten (char  *str,
> +   /* create string */
> +   bytes = GPOINTER_TO_UINT (g_utf8_offset_to_pointer (str, target_length - 1) - str);
> +
> +-  /* +1 for ellipsis, +1 for trailing NUL */
> +-  new_str = g_new (gchar, bytes + 1 + 1);
> ++  new_str = g_new (gchar, bytes + strlen ("?~@?") + 1);
> +
> +   strncpy (new_str, str, bytes);
> +-  strcat (new_str, "?~@?");
> ++  strncpy (new_str + bytes, "?~@?", strlen ("?~@?") + 1);
> +
> +   g_free (str);
> +
> +--
> +2.25.1
> +
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167433): https://lists.openembedded.org/g/openembedded-core/message/167433
> Mute This Topic: https://lists.openembedded.org/mt/92093509/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

