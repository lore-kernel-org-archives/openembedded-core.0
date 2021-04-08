Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.7823.1617886765690442156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 05:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20150623.gappssmtp.com header.s=20150623 header.b=NXa7pZLh;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.47, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f47.google.com with SMTP id x7so2033284wrw.10
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9mGui4qkg8qE3jipDx/Xn5Et0gbGzxHTCj3ygK0o8sk=;
        b=NXa7pZLhTNrm8hKKBPtZdIYvfFnes3qVQEpQ9yZe0xi5x2QDifv/IeXbzeNjUyhYqY
         7sg+0yhjYO1lgnzJ2d8HPQExC8oGTop5B6qDFOYfYHh6KP+Vhnaq8AH+MKppY41GzIv3
         OAn8JNkVkkOoOg2YiQFWxEQoHWCmNU+fQz2FZEUzPrS+Uu+E2U+0PFRHQea4vo6vwe5x
         He74A0OzRo8cvn6OFDCMRpIoBFk4SgOb2YmvywrHkscL/aOWFlxTviqsO50BYarWrXoQ
         E69pD1yQ/kKwBC7B3oSf09gOda05SpRHXweCIKjXBA+tyvcFF+QSNJ7dg9lkQXE98aUd
         AS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9mGui4qkg8qE3jipDx/Xn5Et0gbGzxHTCj3ygK0o8sk=;
        b=XNlYnGQwz7tkyIBteZlTMBtQ0sd+ZVbm9RGMaZ1oMbsCZLSSy+n4qnks/FJp5CJts0
         Vy7WUI7ZQeuB/6FR7YcUlsH9L1aBbFumZAZfmIvF0JvzVqtSEyB37t/SNTK4mPdRDZq7
         POhzCVKQeCFoP7LyBYE9c3euAKRKxEep2dJm9dRwySbLqXznBJfxq4MgblnQfoXdVZOh
         pOu9r6WxnmLbpzYh4pXbCEILflBzEOcCtHLJNQJZYSHFXo+ouyXojTNMi7IGcMtQMcbs
         59f6b4hVavgug529G4C0AvoqSFYu3w6xtRnioS6Wb77wRMK8slZ2pOXdTcq92cQ5o9d7
         8Zrw==
X-Gm-Message-State: AOAM533jlggMiMGf1WpB3qUQCjh+oPFzwpxsPnaBatw0MzWEos61AZ2h
	818xOIxG6fnjuvIY4QnzlxRo3eod+NWNH9+b
X-Google-Smtp-Source: ABdhPJy0JKeNphpYFEyBkhcPEZp5SmIGKJbWaX6rIygefzeM8vd33y4syi8fCf/x9C+tZPLgCSbr6w==
X-Received: by 2002:a05:6000:2a7:: with SMTP id l7mr10430345wry.413.1617886763853;
        Thu, 08 Apr 2021 05:59:23 -0700 (PDT)
Return-Path: <mathieu.dubois-briand@hyprua.org>
Received: from WIPC17090108 ([2a01:e0a:4b9:9060:e944:e560:9cfe:1967])
        by smtp.gmail.com with ESMTPSA id m3sm16088433wme.40.2021.04.08.05.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 05:59:23 -0700 (PDT)
Date: Thu, 8 Apr 2021 14:59:21 +0200
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@hyprua.org>
To: openembedded-core@lists.openembedded.org,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: Re: [OE-core] [PATCH] e2fsprogs: use default inode size for small fs
Message-ID: <20210408125921.GB3161682@WIPC17090108>
References: <1673E3579AD24F09.16683@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1673E3579AD24F09.16683@lists.openembedded.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm not fully confident about some choices I made here, so I'm open to suggestions:
- I only apply the changes on the native build, so mkfs behavior on target
  will be unchanged. This may either be expected or unwanted.
- An alternative solution might be to change mkfs call in
  classes/image_types.bbclass to explicitly add '-I 256' if '$COUNT' is less
  than 524288 (512MB).

Also, bigger inodes means less usable space on partitions but this is mandatory
to build images that may last after 2038.

Best regards,
Mathieu

