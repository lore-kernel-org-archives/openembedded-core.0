Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.5690.1607036284410121518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 14:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fLBrE45D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id x22so4076429wmc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 14:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ITO/xwu+vc3cCBgrzYqlq2H5qhk4v0kuTUdponhu/XE=;
        b=fLBrE45D8aRBBmnW4Uw5liKbkQuI+iwiS6JI/15MUBTKUx8bGsrf19/PFqAsZyZS77
         JzkNMThj/lpg4wSp0EEc84Wg9iBTWHx2U9vM49KdLEMlzf6yzmlwyFqHSP/ZriGoBlIL
         7a0PxLjHhhygYkbpoYoYm0MPNOcD2DU336Mp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ITO/xwu+vc3cCBgrzYqlq2H5qhk4v0kuTUdponhu/XE=;
        b=lpC88nKmnAMfDUU8ssafcRgTNw/0CP+r35eu2diiCNz3anoMXulNKBL19Feuimw4Fo
         RAMB11VrO5da97MYg7R35KbR62/wLlIZToVlUP8llwmatfxGvH+SG0nr9ZJZthcj7Lhj
         gF2Z6RJicaF+x+BEp5ZqDyeX439HzcRn1DLVcfYQTXf+TFQL7x5wVUWflyW4KLKaXx9t
         emsWXTna2VIJCsZx3n6TTjSTfcsrzaKLe+gpcmrUYSTC9t0MDPLtAUY2V8VJT6RX748Z
         4qrnUTHlrTCobxoPEmtIfXir2bQCoeoSqK1agNNCjn77PCHy/dAT49dYdCCl5cZC8CXU
         /EMA==
X-Gm-Message-State: AOAM530KN5b+qngnVYmTM3VJM+uHILLtIhm593ElFTuuQUxTeRtkb50y
	DN/rqCVwJzb3MSbPHGov3GQZ/Q==
X-Google-Smtp-Source: ABdhPJxr5J4dFJMSGkHNkqc8NzgJRjsHy8xwiOstYNcPhKm3y2IrA4mRVn5qIVM14R/e4qHgVyMXZg==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr1022471wmm.81.1607036282916;
        Thu, 03 Dec 2020 14:58:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c4a7:c281:e12e:8d29])
        by smtp.gmail.com with ESMTPSA id c4sm1216011wrw.72.2020.12.03.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 14:58:02 -0800 (PST)
Message-ID: <b287bb4773b60bb624813704fff24201fa6b1c6f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: Introduce empty plugin to create unformatted empty partitions
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <diego.sueiro@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Thu, 03 Dec 2020 22:58:00 +0000
In-Reply-To: <cbb0c77415bba971194ff9c18577646d12a66250.1607009672.git.diego.sueiro@arm.com>
References: 
	<cbb0c77415bba971194ff9c18577646d12a66250.1607009672.git.diego.sueiro@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-03 at 15:35 +0000, Diego Sueiro wrote:
> The empty wic plugin is used to create unformatted empty partitions for wic
> images.
> 
> To use it you must pass "empty" as argument for the "--source" parameter in
> the wks file. For example:
>     part foo --source empty --ondisk sda --size="1024" --align 1024
> 
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  scripts/lib/wic/plugins/source/empty.py | 32 +++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 scripts/lib/wic/plugins/source/empty.py
> 
> diff --git a/scripts/lib/wic/plugins/source/empty.py b/scripts/lib/wic/plugins/source/empty.py
> new file mode 100644
> index 0000000000..041617d648
> --- /dev/null
> +++ b/scripts/lib/wic/plugins/source/empty.py
> @@ -0,0 +1,32 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# The empty wic plugin is used to create unformatted empty partitions for wic
> +# images.
> +# To use it you must pass "empty" as argument for the "--source" parameter in
> +# the wks file. For example:
> +# part foo --source empty --ondisk sda --size="1024" --align 1024
> +
> +import logging
> +
> +from wic.pluginbase import SourcePlugin
> +
> +logger = logging.getLogger('wic')
> +
> +class EmptyPartitionPlugin(SourcePlugin):
> +    """
> +    Populate unformatted empty partition.
> +    """
> +
> +    name = 'empty'
> +
> +    @classmethod
> +    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> +                             oe_builddir, bootimg_dir, kernel_dir,
> +                             rootfs_dir, native_sysroot):
> +        """
> +        Called to do the actual content population for a partition i.e. it
> +        'prepares' the partition to be incorporated into the image.
> +        """
> +        return


Thanks, the wic test coverage is pretty comprehensive, could you add a
test for this please ("oe-selftest -r wic" is the test command).

Cheers,

Richard


