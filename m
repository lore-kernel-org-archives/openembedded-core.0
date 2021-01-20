Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.31765.1611166702190994889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 10:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HCNEg6LK;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id r12so23475999ejb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 10:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jo3PHsUMZ6rpSHzFfYgxFIj9nbgtgwAjTxphV4rWyDA=;
        b=HCNEg6LKuIyfvOrwZCYB/n5piciuC1JnxhMBw+UubN+yQCLesg1+4pST1R9fn3m6cs
         BQ5xjb2JH0byDoM0Sg6SVxxzzToEyQmzFyd3UohCZ6WLEYbWNL3G4MWA0MKNL4jdp+U4
         c4Ahobpd4p/rkI6sQgqjBlLEWnQ7nynvRQIWyf08CZ61bcMmfqWbl7l82/IiLeG/YoN6
         U7UniYafF5siWN/gqDen0w3t4f6NOzjUvORldFk76vlPQQoGytZPAn9weL1UnvoVAkCV
         F8komyv6EBSiRHHslr5H2/AZ18t8PlkuRDjsqFazGvqxGcJ4yZafIKt28r1nY2aZulSV
         F2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jo3PHsUMZ6rpSHzFfYgxFIj9nbgtgwAjTxphV4rWyDA=;
        b=r+Kc92IHkY4Clr3PzwhTJc1dPxUVYOXrdDiBJ2JCWMu9luHExiNgM7wLbQtBaAGmQw
         lCtXNFhGUiA6tUuGg07wJOp7HaUxx0RwwpyiknHpbHcsRrIAi+thKlRdWWlDQDMTgdM+
         OZ+ONs1RTl+F1vwcBfYFlknLjOuuSMVyXf83mx6fkuACVPbBWUnwZzHgIFe/NjGc/eNW
         jzajqg7e32imBSQJFz+mAvTncxo4L9F9BixXVvJk9CY0YjSMLOgRXDpqlzxOdWv0c4aw
         1j8IgWSwDXHDAqZ0oBdWIFfueJZugqsiSzNgHdS+iE49kzYecLPgyDrFvJdNp4lgf1Ha
         39Og==
X-Gm-Message-State: AOAM531P3fnxOrawfh49U5t14URd+SirFFODgiIaZFR0St5z/2rJP/Nx
	eGcgb8n5tNFHqeOoQb4voCKDHLLMku2GhLiAf2qSaQ==
X-Google-Smtp-Source: ABdhPJyTSqdgqNGYrosGCInNd1+/SXmnd8GnatT7qkUrvdNO5YBUKpx62FSAmU8j29bm6L+zOgTBPsTyoOYLl7GGgqo=
X-Received: by 2002:a17:906:4e0c:: with SMTP id z12mr6798270eju.370.1611166700479;
 Wed, 20 Jan 2021 10:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20210117211445.2341303-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20210117211445.2341303-1-robert.joslyn@redrectangle.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 20 Jan 2021 08:18:08 -1000
Message-ID: <CAOSpxdYiKrtF0t0wMJxp0rKqGz0bNHfbQ9XayjdgTtVNhQaoGg@mail.gmail.com>
Subject: Re: [OE-core] [master][gatesgarth][dunfell][PATCH] bluez: Whitelist CVE-2020-12351 and CVE-2020-12352
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 17, 2021 at 11:16 AM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> According to the Intel security advisory [1], these CVEs are mitigated by
> the following kernel commits:
>
> eddb7732119d53400f48a02536a84c509692faa8 Bluetooth: A2MP: Fix not initializing all members
> f19425641cb2572a33cb074d5e30283720bd4d22 Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
> b560a208cda0297fef6ff85bbfd58a8f0a52a543 Bluetooth: MGMT: Fix not checking if BT_HS is enabled
> a2ec905d1e160a33b2e210e45ad30445ef26ce0e Bluetooth: fix kernel oops in store_pending_adv_report
>
> The latest of these commits were backported from 5.10 to the stable kernel
> tree in the 5.8.16 and 5.4.72 releases. Since the kernels provied by OE-core
> contain these fixes, mark them as whitelisted.

This seems to be a good candidate for having the cpe database updated.
Currently it is flagging all versions of bluez and Linux.

I sent a request to have the entry updated.  If they accept the
request then we won't need this patch.  If they deny it we can merge
the patch.

Thanks for doing the research on this one!

Steve

> [1]: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00435.html?wapkw=CVE-2020-12351
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> index 8190924562..051fdef8ce 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> @@ -3,6 +3,8 @@ require bluez5.inc
>  SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
>  SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
>
> +CVE_CHECK_WHITELIST += "CVE-2020-12351 CVE-2020-12352"
> +
>  # noinst programs in Makefile.tools that are conditional on READLINE
>  # support
>  NOINST_TOOLS_READLINE ?= " \
> --
> 2.26.2
>
>
> 
>
