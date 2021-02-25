Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.563.1614289872968642858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MyNl/h61;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id d11so6681522wrj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jl3ag7FZYt2SVGDv5mnlu1AfG944RyKPEF0YhHrcY6A=;
        b=MyNl/h61q14FGwZ54oJf7YRyrZfMZiDp3uKlHC+cDu1yU5QPhP0VO8AWkOkv8eHZLT
         ewvjBctfE85ZKKHV+vx8DvoNUN7f4Pc4XrSVRJnulENpaYmMZT2YFkILkARLt4Hj5Pi5
         Kfx6Ks0FoqPi/cdBf5CfMyIZdC9NWfzFzW28o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jl3ag7FZYt2SVGDv5mnlu1AfG944RyKPEF0YhHrcY6A=;
        b=M3oDwnskMoHkjMGVkI9mzcPW+KIbjDsSqde87iRWitpqRUYAM0f0QJPYa//LcE/z8S
         rGNC+m5Jh0N9hUF9vkYmS3HnKqjXJYLaSV7T8d3SBDoIDrU2hgh0Kz9iOc6SbVG9DHUC
         /MGF1oSYSR7rceVWRrQByyWQkWm56/E4oTzHUdYCK2jsvuig2EYIUE4Ees3Os5/kvCQd
         q6n6p7alvhLDMwepi32VhwEJssQ9tA5FMJa2IwgpqmEeJkWc6tN7SFjnwIracGJ5+7uT
         vNdfQSlCGrxKJOP/DynPBi2e7dQof2X+IMqecYbo+MDg+JUe3JX0NlsJBTu5TmmhICWX
         6lJQ==
X-Gm-Message-State: AOAM5311kjuGS+T8AWbxPi1aailhJ53eouCoK9RXbuLxWBKylLdGCyCA
	+vL/LMZ8jUUNr1QCwit7CmvSFg==
X-Google-Smtp-Source: ABdhPJzoI7k80aK7iI5GOs8hVYSps68QiNROCgjbirD+1pc+muMZl07vWsipOMfmx/3e6hQeglwK8A==
X-Received: by 2002:a05:6000:1281:: with SMTP id f1mr17270wrx.243.1614289871221;
        Thu, 25 Feb 2021 13:51:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id p9sm9196749wmg.10.2021.02.25.13.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:51:10 -0800 (PST)
Message-ID: <0d9f649d5afb3ae1a930de5ed90ca5001b2d20ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] socat: Exit when the file associated with an FD is destroyed
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Mark Asselstine <asselsm@gmail.com>
Date: Thu, 25 Feb 2021 21:51:10 +0000
In-Reply-To: <2fc3ec398db0998427e1d0cc351dfcc91d59a3f0.1614252295.git.liezhi.yang@windriver.com>
References: <cover.1614252295.git.liezhi.yang@windriver.com>
	 <2fc3ec398db0998427e1d0cc351dfcc91d59a3f0.1614252295.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-25 at 03:25 -0800, Robert Yang wrote:
> In many scenarios the receipt of an EOF will coincide with the
> teardown of the file which the FD is associated with by the
> application on the other side of the file pipe. If a timeout (-t) is
> used socat continues to poll for new data (read) and send any new data
> (write) until the timeout. This can lead to input/output errors as the
> FD exists still but the file it was openned on is gone, and no check
> is done on writes.
> 
> To get around this a check is added after the EOF is received that the
> file still exists, and if not we proceed to exit immediately. This
> will avoid i/o errors and will also cause a quicker return as we don't
> have to wait for the timeout.
> 
> The original author is Mark Asselstine <asselsm@gmail.com>.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...le-associated-with-an-FD-is-destroye.patch | 62 +++++++++++++++++++
>  .../socat/socat_1.7.4.1.bb                    |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch
> 
> diff --git a/meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch b/meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch
> new file mode 100644
> index 00000000000..b5ac62f6169
> --- /dev/null
> +++ b/meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch
> @@ -0,0 +1,62 @@
> +From 956d4b00a101f61b4cfaafa0856b646646536492 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <asselsm@gmail.com>
> +Date: Mon, 7 Dec 2015 21:27:35 -0500
> +Subject: [PATCH] Exit when the file associated with an FD is destroyed
> +
> +In many scenarios the receipt of an EOF will coincide with the
> +teardown of the file which the FD is associated with by the
> +application on the other side of the file pipe. If a timeout (-t) is
> +used socat continues to poll for new data (read) and send any new data
> +(write) until the timeout. This can lead to input/output errors as the
> +FD exists still but the file it was openned on is gone, and no check
> +is done on writes.
> +
> +To get around this a check is added after the EOF is received that the
> +file still exists, and if not we proceed to exit immediately. This
> +will avoid i/o errors and will also cause a quicker return as we don't
> +have to wait for the timeout.
> +
> +Signed-off-by: Mark Asselstine <asselsm@gmail.com>
> +
> +Upstream-Status: Submitted [socat@dest-unreach.org]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

This was written in 2015, when was it submitted? What was the response?
An idea of the current status would be good for a patch of this age.

Cheers,

Richard


