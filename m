Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.13421.1586070110508312372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 00:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RgqZwqkE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id a25so13562266wrd.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 00:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=v3yO4teKCnipD7qZjnITVjw87bs6RqFLkblGsd3+qh8=;
        b=RgqZwqkEWNOKbMtp82Lsr4dRkEM12ikErYLlwAGh5yT6DLXtSmmqrD3Icpp3GUAG3d
         Xrgv0ElPzMxLrbGSZK8RY5KN6icWYGDKiM/rEKCVcOTMn5IuhFd37SCfXxH11Atp/EQM
         GNV+Ydt6Hi2KpKfrNJHTxgYtQ17/vWmkA34KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=v3yO4teKCnipD7qZjnITVjw87bs6RqFLkblGsd3+qh8=;
        b=HcpM9t/dJp2LOqLa1YNRb4Jl1xQa85wasF6Bv8M85w0mX+cVYaYnaP95GEDncZxG79
         qu7D1c52qLexwfelI+FxVS9jZ8S8UVytFmIx+AWoV1Szmv/aI75/65GvPUpE13cn5F6c
         yV6aROrqvrdj8lzVZ0RO14encYAvNwz6sY2soNCRPKAQ6BxRUse8lFfyhTxozll+QX6D
         2iOP6hP7IKg/4yQ6eZSC3RITx5oqa2QTSZulunXznQ810eVLBkPICziipWyjbIH/k2Q7
         dsWbsAjKdud1Y5KfMmyLvbTrwieIobH8wpElOS32iYgxCAqZ6XfN0+ry1MxYk5vIIGF4
         tNMQ==
X-Gm-Message-State: AGi0PuZ3SUjjOR5c1K2Ikd+DEUqKeExw4ClHFYE90YWa21MnCM12hjeI
	c8brsC3FzaSNCmWtAx64TUylGg==
X-Google-Smtp-Source: APiQypJf7vJr61TI6PgmjGPOOa6IU9y0mDDZykw4p1DRJp9EdoCFuwA10Tsg/65cLsCWMiroUB4sRQ==
X-Received: by 2002:a5d:4844:: with SMTP id n4mr9967966wrs.314.1586070108813;
        Sun, 05 Apr 2020 00:01:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t2sm1534609wrs.7.2020.04.05.00.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 00:01:48 -0700 (PDT)
Message-ID: <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>, 
	openembedded-core@lists.openembedded.org, jpewhacker@gmail.com, 
	pbarker@konsulko.com
Date: Sun, 05 Apr 2020 08:01:47 +0100
In-Reply-To: <20200304144936.2559106-1-ricardo@ribalda.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-04 at 15:49 +0100, Ricardo Ribalda Delgado wrote:
> When parameters include_path or exclude_path are passed to the rootfs
> plugin, it will copy the partition content into a folder and make all
> the modifications there.
> 
> This is done using copyhardlinktree(), which does not take into
> consideration the content of the pseudo folder, which contains the
> information about the right permissions and ownership of the folders.
> 
> This results in a rootfs owned by the user that is running the wic
> command (usually UID 1000), which makes some rootfs unbootable.
> 
> To fix this we copy the content of the pseudo folders to the new
> folder
> and modify the pseudo database using the "pseudo -B" command.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

I added these two changes to -next but we're seeing a test failure on
Fedora, twice now:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/834
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/831

I suspect its related to these patches but haven't confirmed that as
yet...

Cheers,

Richard

