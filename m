Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F47CC83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 07:16:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.54182.1751872591335274439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 00:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G1Lyyfg/;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3138887e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 00:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751872589; x=1752477389; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZG1qY+/K8OqsgacHnTg/grJSbieX7yWcQ+CEEUNQQn4=;
        b=G1Lyyfg/p+rhceaBDcQ1IFKHvy+GpyCFm1h5kkpPNS/RRkgv5O9Fh/MPu7lGyHX215
         j//2cQmWx6zFBqxngcCX/g1F1GtzCIN0Y0gDZu4lB9hcUqhJ/hKGO0hUu+T/kQ3/ndeC
         vm/dTiLowaVo4x58DjVpVvSJXMnIYMwV11VOrcQyMMHdUaLUp6zxMltRXqgUVrshZY+c
         V82D0Amn+ivFh9oILtCAMWlKNsvR+rjVrQLWppHkwSI41f+TGA714ihpjbehHc0y6b1s
         SgtwiFfsQO04w73gunRreV/VpgFrjv0n32twi8rijN4ldiFuIbBSjWbBT2d65EQ3AFW0
         72/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872589; x=1752477389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG1qY+/K8OqsgacHnTg/grJSbieX7yWcQ+CEEUNQQn4=;
        b=i3xKuNJiMmKXwkTbcOfG7RDTaQxtT/Ck39VIh4+a3GMWB4EsqPRFvV7eqf9mhAiFtz
         bxhw6J7gMTN4QCn5YBkMfw47IsJu+4XqUjMXv/Ag34JlMmAPtA1n9DeHpcSYggzpGfOl
         EGIIp5A+oGs1d/8UOM8ZbNan3gL/FqO82wHs9inrz15jw9KaQAxZMVhaN1hJ0jDZugnu
         e+t/O/RivRiKGSP1r6h/owF3hwyFlw/6SoZG9NppmUQ/FxSkm2XqiM4JO+FEjx9vdR+j
         sEEUeVtQoEkw5u10EhE6cJ25Q33AMWjDhsTHd/0wQpH6YF/T7rpa6jD6zXIjcyuTiQr2
         Bz9A==
X-Gm-Message-State: AOJu0YwyROYTBMoYcEJfvdXUtORdm5M6Uy9gXhwLgB3lqb3XEDn8iqjz
	iH2EwuJqJYaT5J+E9sYchEyaF8B/bPeC3iuHLaC6rFsH226/91mQJzb8muB3Bxxsy2A=
X-Gm-Gg: ASbGnctp1qzvcaih5OfLRJGcmLVBmvApRNGTi2hQ0iDmBH5AlGoonAT8jV89aHa64v8
	Z5A/6ZwEXJRqj04z9Z7VX5FgfGFERk+1P3IDrItPIoeIDFLx2Ekvc/KuH15j9v19aE8b3doFyUg
	oFcB1V75RXkhzU0egrI7SsNzWYSpeo3PRF6ZzDap1KAOkP/7m7p8McLtQjYGziH6SSw9PabwNKB
	gW7so/7ypV6bwTATwcpz7tlzlXoHwnLFd2DGADRuWoRuwk6hIEtZjUB3OnLeWAkRWOUSt3fHnln
	Y+XGeh+ieg3Lz+q/K8EXOP7uYJJ6XaayJbIE6kN3bEKIDUwJBavdwTVnJuz27Tfu0oWtSDu+v+x
	1YTnKDyTWLCPBRFHIH44=
X-Google-Smtp-Source: AGHT+IHJTOkWZlPBNQ3Xcfa/IL1m/eQRpXYSQl1vPtY5PHYAGkZ1TzpbhLNJILcec/zZnEfCUEJyIQ==
X-Received: by 2002:a05:6512:23a9:b0:550:e4a2:e0e0 with SMTP id 2adb3069b0e04-557e555a597mr1684985e87.44.1751872589401;
        Mon, 07 Jul 2025 00:16:29 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d924asm1258716e87.87.2025.07.07.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:16:29 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:16:27 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 3/5] testexport.bbclass oe-test: capture all
 tests and data from all layers
Message-ID: <aGt0S67W-UkQrN7f@nuoska>
References: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
 <20250702072516.1075450-3-mikko.rapeli@linaro.org>
 <c8c8d7d7c90d6b8113ce7b292bda403053bb267c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8c8d7d7c90d6b8113ce7b292bda403053bb267c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 07:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219979

Hi,

On Sat, Jul 05, 2025 at 05:07:57PM +0100, Richard Purdie wrote:
> On Wed, 2025-07-02 at 10:25 +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > 
> > -import os
> > -import sys
> > �import argparse
> > +import glob
> > �import logging
> > +import os
> > +import sys
> > �
> > �scripts_path = os.path.dirname(os.path.realpath(__file__))
> > -lib_path = scripts_path + '/lib'
> > -sys.path = sys.path + [lib_path]
> > +lib_path = os.path.join(scripts_path, 'lib')
> > +sys.path.append(lib_path)
> > +meta_lib_paths = glob.glob(scripts_path + '/*/lib',
> > root_dir=scripts_path, recursive=True)
> > +for p in meta_lib_paths:
> > +��� sys.path.append(p)
> > �import argparse_oe
> > �import scriptutils
> > �
> > 
> 
> This assumes python 3.10 which we can't quite do yet:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1850

Ok, looks like it's safe to remove root_dir=scripts_path completely.
I'll send a v4 for this.

Cheers,

-Mikko

