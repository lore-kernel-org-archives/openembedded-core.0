Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4238EC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 14:09:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9891.1634306951026129718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g0ZIGLTE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id i12so26717738wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=zfakzPY1ohvXz9q2vdndgirHivoLE7vujxn+AfGzhLQ=;
        b=g0ZIGLTENnlactduH7r8UmbhhnNUDGjmiF+T21MJLnHJY9eW+IS7x/foZl9ar+h7aR
         EcmTT354nvA0+uabk6ioUaH/wYAhsuLVyURIgrCMGeMnQxHg3dST2/fLFLUxVfqDXlxR
         IierOOly6cTSHMxC5CJslkifvztxXl7maC7do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zfakzPY1ohvXz9q2vdndgirHivoLE7vujxn+AfGzhLQ=;
        b=WT0MMOXyWAawsMZ0+T8YsoyGyWib7jKUgNqWRHUuy6haB0u4h8mVDVsnQyhI6B8DN8
         +icClDJ4+hdfnT9rHn6C4844D8+5863ejKBAQWv/JpVFE+2u6JdQ05mYfTkew4fkexqI
         qsZhVToMjf2yoi1/2t20LUBAOJdBY7PRgd2uzu+TlcDBi79vHdNlSC/xUD3Okt3eSw/3
         23BKuHx8tRcfNsiJeFKZDmEQQAZbZI//R3I7T+1qU2stamKhhgr7PIFdG9az+d6OJDao
         G4HB7OUTEcMMXckn/TO+cFTkivz/12RbYga8ZgifMGL9khCUI4uOLt3dKFO3HRdRZQj/
         hZww==
X-Gm-Message-State: AOAM530eYDPcNvvhhNXkNECMC7knPL4N4tqku1wksoOL+T2RV7HUgVZS
	c0TbV/KhXGw0oBiXX1U0BaqGTw==
X-Google-Smtp-Source: 
 ABdhPJxfEEBL7H0hra59vY5qKYTGBPxky9ig05Z+B7bvji7QH28DyX4ubA1xxdM4zmg5PwvjleMT8g==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr15089019wrz.412.1634306949495;
        Fri, 15 Oct 2021 07:09:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id e9sm225921wrn.2.2021.10.15.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 07:09:09 -0700 (PDT)
Message-ID: 
 <a58827c0ad0f2c39ca4df700efe31fc9d18b1383.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/2] lib/oe/qa,insane: Move extra error
 handling functions to library
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mac@mcrowe.com, openembedded-core@lists.openembedded.org
Date: Fri, 15 Oct 2021 15:09:08 +0100
In-Reply-To: 
 <be8780efcbcee32cc1ef6aff886e85d1b78fe627.1634306366.git.mac@mcrowe.com>
References: 
	<be8780efcbcee32cc1ef6aff886e85d1b78fe627.1634306366.git.mac@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 14:09:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156996

On Fri, 2021-10-15 at 14:59 +0100, Mike Crowe via lists.openembedded.org wrote:
> Extract package_qa_write_error, package_qa_handle_error and
> package_qa_add_message functions from insane.bbclass to lib/oe/qa.py and
> drop the package_qa_ prefixes.
> 
> Update various bbclasses to use the new functions. No import is required
> since base.bbclass puts oe.qa in OE_IMPORTS.
> 
> Stop requiring callers to manually track whether a fatal error has been
> encountered via a "sane" flag. Instead replace the QA_SANE variable with
> QA_ERRORS_FOUND and call oe.qa.exit_if_errors or
> oe.qa.exit_with_message_if_errors at the end of each task.
> 
> Inspired by discussion resulting from
> https://lists.openembedded.org/g/openembedded-core/message/156793 and
> https://lists.openembedded.org/g/openembedded-core/message/156900
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/buildhistory.bbclass |   3 +-
>  meta/classes/insane.bbclass       | 180 ++++++++++++------------------
>  meta/classes/multilib.bbclass     |   3 +-
>  meta/classes/package.bbclass      |  26 ++---
>  meta/classes/ptest.bbclass        |   2 +-
>  meta/lib/oe/qa.py                 |  34 ++++++
>  6 files changed, 121 insertions(+), 127 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 7c44fec2d1..62d0d781a1 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -287,7 +287,7 @@ python buildhistory_emit_pkghistory() {
>              r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
>              if r < 0:
>                  msg = "Package version for package %s went backwards which would break package feeds (from %s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
> -                package_qa_handle_error("version-going-backwards", msg, d)
> +                oe.qa.handle_error("version-going-backwards", msg, d)
>  
>          pkginfo = PackageInfo(pkg)
>          # Apparently the version can be different on a per-package basis (see Python)
> @@ -321,6 +321,7 @@ python buildhistory_emit_pkghistory() {
>  
>      # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
>      bb.build.exec_func("buildhistory_list_pkg_files", d)
> +    oe.qa.exit_if_errors(d)

This is a change in behaviour since currently buildhistory doesn't do that and
I'm not sure it should.


>  }
>  
>  python buildhistory_emit_outputsigs() {
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 433e4dfa33..2df5edf138 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -18,7 +18,7 @@
>  #   files under exec_prefix
>  #  -Check if the package name is upper case
>  
> -QA_SANE = "True"
> +QA_ERRORS_FOUND = "False"
> 

Lets just delete this please, we don't need a default value and it is confusing
being isolated from the other code.

Otherwise looks good, thanks!

Cheers,

Richard


