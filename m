Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4693E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 11:46:31 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41809.1767008783160427269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 03:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M+OZn9LK;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88fdac49a85so59949226d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 03:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767008782; x=1767613582; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRBMeuykREz9rBIYna8rDs0nFdkA+u79NyKawl0aj/s=;
        b=M+OZn9LKJM9iqbtGcjeGXt94mNfKFcfHWKGi97WYxHCcPk+t8Z2nVi2OJZdrC7jhkV
         RIiTd3UtppjCX95pYgXeR7XZ9qwuJabmKj1ylRFcEWIYrtW8bcjkMfk8Sexr1evKiDwh
         YTVJRTYm/jPv92md76Y7+tVYw+T+bPkrRIdTkaKt+nuYzThCoz9BCxR39kyjVp3sLznV
         TOVM+NjwfvYUcJEe7CdxVytX6mq0X3ncbBTo1O+5dYb2JVky/08F4O0WZP0Eb/A/NAj5
         M5iB0CNqhs1hvXLfFK2F8qlbDfgujzduPD82Y45bPOmCzz51zub3irhrmWobYgma9Hgv
         vZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008782; x=1767613582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRBMeuykREz9rBIYna8rDs0nFdkA+u79NyKawl0aj/s=;
        b=d7tr/qziM5z6CZh++cNt77uiypZSTN9ug2Jnfqjp9i+BJy1L92AJIkYTlRlOcb0XNR
         b5FHC7c4MhgVRMJdlox104/5vjziVkf/cn3pVWEDR32eV5DWG+tt5jRs29lW9BofQ4w0
         xn9rD8wU+u+hEiLNDZIDtq9EbsCxWNDM5T/QKmzaxApxVG02+sNvtJNwqoZ4+GWKDJxa
         6ZYcfMcXS/1rKTzFZCGNvTP6sSI3Q9mKZLwM+awSIG9/GiziS1F5em688AF+C4kc72uy
         ggTwcKNbhAwKNkPVBdxFgbb3Vbydy22gpqtHMnOdV+QhmMCTfYScKfVMi2lp8kUT5lvl
         oMJQ==
X-Gm-Message-State: AOJu0Ywwg3R3IIACLTBfaSzhZOReFleI+5Fc95lkCFmxwU5aPXVlJtYz
	AQTFUqT/hciZUuv2u9yjDya/0cACLexkMDvc3PjnDYgZZXfOtD2gXICeNvfSmsDg5t9BF/Z9Al3
	7uibOdGqQVGaQQNqxoPgqN5Y25+Say90=
X-Gm-Gg: AY/fxX7dbHwxcTZy//gCRHAnxEYF4TA03DKU2e5hlKObgHvtkx3IX6ujwjsHoFibkiL
	s/0IyhWYqLnjdypVKo7tW/6geuWXMugo2Yo0UVGw10v6MOO2R54iaVkzuswjI4WRAysPHz2Gc1q
	KyAL1/+H5zIUIOMKhO8EpqMb/cd+XKEqCTJfjo2iCFmiArrGn6T6dIGemT7WIAO9bwqFqnU4V5J
	eSZEFzKWinHzWoEvDgW4DvVqzDFp2T3m0iDj204ZI/iGhTku6qkJkJsa+qf/rIEBaYF+eI1xuhI
	a0PRYTVMBwucIa+wh8EUjW2KPhJVPA==
X-Google-Smtp-Source: AGHT+IFEqtbUr5YG7zoVMnlqUBtrCTNszXqJipPTNhT0/mUCDK7BkA/ooXXtHjL8oAXwBfWfvxcRmrDy6VGe1+/g0P0=
X-Received: by 2002:a05:6214:92c:b0:88a:3113:3ac3 with SMTP id
 6a1803df08f44-88d851fc394mr320905886d6.10.1767008782059; Mon, 29 Dec 2025
 03:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20251228180935.2077478-1-adrian.freihofer@siemens.com> <20251228180935.2077478-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251228180935.2077478-3-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Dec 2025 12:46:11 +0100
X-Gm-Features: AQt7F2raV0b1cE4ejvLvCQf3F7tPauXapJX8dm4DEGq6GTfUk-fe_dMKmxG6YZo
Message-ID: <CANNYZj-4KLKEMn-gAYrZG96D3h9BQ8Twp+juw7w40GrGhXOkpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] oe-selftest: case: support fragments in write_config
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 11:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228600

On Sun, 28 Dec 2025 at 19:09, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=siemens.com@lists.openembedded.org> wrote:
> -    def write_config(self, data, multiconfig=None):
> +    def write_config(self, data, multiconfig=None, fragments=None):
>          """Write to config file"""
>          if multiconfig:
>              multiconfigdir = "%s/conf/multiconfig" % self.builddir
> @@ -174,6 +175,12 @@ class OESelftestTestCase(OETestCase):
>          self.logger.debug("Writing to: %s\n%s\n" % (dest_path, data))
>          ftools.write_file(dest_path, data)
>
> +        if fragments:
> +            toolscfg_str = '# Added by oe-selftest' + os.linesep + \
> +                'OE_FRAGMENTS += "' + ' '.join(fragments) + '"' + os.linesep
> +            self.logger.debug("Over writing fragments: %s\n%s" % (self.toolcfgconf_path, toolscfg_str))
> +            ftools.write_file(self.toolcfgconf_path, toolscfg_str)

This should be using 'bitbake-config-build enable-fragment' rather
than write to the file directly. It should also not overwrite the
file: the 'main' build may enable important fragments for the overall
sefltest, or the machine they run on (e.g. the yocto ci is using
autobuilder fragments throughout) and they should be kept.

Alex

