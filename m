Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD917CAC5BE
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 14:57:06 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.56154.1759157817989058188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 07:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OlQi75+o;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8209dfef9c7so30351556d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759157817; x=1759762617; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq24CLezYEZMsTmYvchFE1UzVEL+LxgoutbLDNMzEZM=;
        b=OlQi75+oUFn1t6ujpEGajOdg/RSldC53o81ca33XbY2kDdVLJJNgL1i+FCDlPQ8zNZ
         /BUkNU/RtSrUbV5TITfBC5flxa13QGdLA1tH39KzVSIe5eASMlXTPKr1FoJoKZBZDN6X
         bfBkCwIYmOnwISpt6WVAbtRhF7xSay9ohqMLhfgCfqGeNJHvTaOcQeDOgIvAObwhxDiL
         N4l8++EVgoBYiPz/IV51WCSWqg6o5AlTbj+fQCc5+Kaqe5ft7FvN2xBlXahlbcDb+oOH
         Ff4lGM64pCY8+5/4JBPMH2DplQeu7rqd8mAx1Jc4poYpFRylkXLeSe7/iJpNnlCxuqBP
         M3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759157817; x=1759762617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vq24CLezYEZMsTmYvchFE1UzVEL+LxgoutbLDNMzEZM=;
        b=AIfiy9ATRsqBZzwRra7FmpQJqlOIoLc84PBGPJAZpecYR7g1MYsF456EJR6PIKgT53
         oPLw7j76s5E8Ep6hDQf5bjQsnMG1yAi7O/cF7kwCLPMboJ5sbk/cjk1OG0kkR7kpUSo4
         N3oNU59KyruWJzz2DWtph/6RZORz08dTi3Ci1GpuH0QCBEdJ/NnXuQjeeIPk19hsyXFT
         LHsE7ug02lT+X+WmX252hBvxzjyEcMWL6+oTBF5Zza9CRFup7hSyVDoLTwuYTEXTxMcz
         2w7/LN5l7XRcrri7RUySoo4SojOrFU3O8pGZkyRhjj2uPs5lCYr9XrC9xbigfdLsVZTg
         qvPg==
X-Gm-Message-State: AOJu0Yw//YOWTt8sPTxxxoEetTsXiK2y77Z3U7eWOyF0NEk/ok1PqReF
	HQ72AjOTM6rPGwWhdSyUufdTCpk6M65tv8+aDpC4Y3hZByy5dklKAkLyivaLWfdZ3omGGSQo2DE
	xBTo+SjrX+5Fboxw/Z2iYTLGY5qgh75Zm0w==
X-Gm-Gg: ASbGncv6yzey830FbDq5tXB+sAB9zWrpupggk5RuAMD3vQseciVGE6h3AxSFz1+kU5l
	EyhzjRgPP4+LWI15nKJrdtbLKoWQy10U7lgSNzlxN/+Ua11WI5i+N7A3unRhnx76aZfuvwnnSfi
	48jv0Fu7Sho6eZMxz7W269Z/lc73uEFJYJwRSRpcQbyQ0Y4dlMToiIOMCXO/cMxQK4eNdlQiOKl
	Pb5pF2dprCd1M3Ojh5LVnLt2VHn92zyytqsGID5CX/deciBrXHFv+P6k5qaFZ3N2AG+t20/+xQQ
	lJCBDt8gjjgKJNwZZT4+HuNdBXYzDCfa0kAlnq1hPnx4HJKEnTM=
X-Google-Smtp-Source: AGHT+IFNR/Xj+2mCDDf31xFijAfyLmUV0lKzMcWMrVH8ZKnMVNKmyKE4xZ43hicO+uj1iGJRcAGYfSylplgnpbGTU40=
X-Received: by 2002:a05:6214:1246:b0:7f0:e84e:b2b5 with SMTP id
 6a1803df08f44-869b1066fd7mr10594576d6.30.1759157816978; Mon, 29 Sep 2025
 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250929144721.1001156-1-kavinaya@qti.qualcomm.com> <20250929144721.1001156-2-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250929144721.1001156-2-kavinaya@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Sep 2025 16:56:46 +0200
X-Gm-Features: AS18NWClUVv00i5cL3ZJ7HcoYZzoCQ_41TGnOEW5mFA2FHBvj7pEI1NqAZyI2Ag
Message-ID: <CANNYZj9njks8b4yG6O_a24KxCjCEWTYFsfyZCUkcvSchd-6C2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1 1/1] fitimage: Add support for custom
 compatible string via optional parameter
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224147

On Mon, 29 Sept 2025 at 16:47, Kavinaya S via lists.openembedded.org
<kavinaya=qti.qualcomm.com@lists.openembedded.org> wrote:
>
> Currently, fitimage_emit_section_dtb() always derives the 'compatible'
> property from the DTB using fdtget when add_compatible=True. In some
> cases, it is desirable to override this with a custom compatible string
> defined in the build metadata.
>
> This patch introduces an optional 'custom_compatible' parameter to
> fitimage_emit_section_dtb(). When provided, this value is used instead
> of extracting from the DTB. The parameter accepts either a space-
> separated string or a list of strings, which are split into the
> compatible array for the ITS node.

This looks much better, thanks! But it still needs a bit of work.

>              # Copy the dtb or dtbo file into the FIT image assembly directory
>              shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
> +            custom_compatible_str = d.getVar(f"COMPATIBLE:{dtb_name}")

COMPATIBLE is really not an appropriate name. It should be much more
specific, e.g. DTB_CUSTOM_COMPATIBLE, or something even more detailed.

> -                                  dtbo_loadaddress=None, add_compatible=False):
> +                                  dtbo_loadaddress=None, add_compatible=False, custom_compatible=False):

custom_compatible is not a boolean parameter, it's a string. If it
isn't supplied, set the default to None.

>          if add_compatible:
> -            compatible = get_compatible_from_dtb(dtb_path)
> +            if custom_compatible:
> +            # Accept either a string (space-separated) or an iterable of strings
> +                if isinstance(custom_compatible, (list, tuple)):
> +                    compatible = list(custom_compatible)
> +                else:
> +                    compatible = str(custom_compatible).split()

I don't understand. d.getVar() returns a string. At which point
custom_compatible turns into a list or a tuple?

That's why I had asked you to also make tests for this feature.

Alex

