Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE0167D5B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:37:32 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id f22so9874015ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x1eFGP++lsj4izAgoXSg1xzNLjFrOq9shFbmA7YXnlI=;
	b=KCzlab3i3CxgsNfrpY/ioQgkXJPNGwSNL+nn56IpxRY+NxCDdfgPvXuAul4wdydYLe
	bthsWOirWDxlg9yKSJEUBl7QVlz96Ex6OfJE8LyHj0cPI+Pp50zcGiOqKDElyipBWcUx
	KCOEX86iHtBvpw8Plz7hqNwW4+DxUGXgE4I4a+AJFZxpry23PuqnctU41UIOV4E0ug5Q
	u7h9HGu+Ko1Gv8WrFmmH9T/BaRvAdqfytttTrxa1nDVDIih+is7qFKKNYbZcEUKSYJsA
	F4GlXn2fKPrATzEGBZ5sAcbc9Vn4Co83O3Uwi1edToigUkvkzQO/FBt1BH9yNf+yTOGn
	xufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x1eFGP++lsj4izAgoXSg1xzNLjFrOq9shFbmA7YXnlI=;
	b=HB1OgyfZXCgI8fZgl4AVDY8/qWXIUVMcMJUnMRHhvM46rXfJqTkIz0UyjLcn+UrmNp
	l/BRmoEW5wcaICAx3V826P12pOEA+Y9ZoFvfZ14hCXXZxJ8bm5tYiAnxfKUP/3POldPV
	MNG7CyW2l5qDKRfCK+HUTS5dcM6XH1/y0Rq6u9hAK/sGuJWwf5p34H7/Cavcjb/r/Ecm
	u3uSYfahIqTajMvSNmyYCSs+yOTMoyu6dcQurxl/dt35F4dTE3rL5Vn6kwOlKm+P4mQD
	VbbGFL6sNk7DvaD0IZ9mMXBMQC46/GJn7tVKJsomtmrwAwSAlKf1trd57CngXGl21dBQ
	rVpQ==
X-Gm-Message-State: APjAAAVYJWnODZBvj43jEaksNS7ZyfD1KMs0fxapltlvjpCWAYjKMs8I
	jx/dWexUOHETduiLI9eTNS1JS6Kxu3Ljk4YDsYmnyA==
X-Google-Smtp-Source: APXvYqztBfHU+tO92PyyGqqQHfERTeBtyKUXxRSO3PQTYMH/XJaY9hkQl5yF9IGfPhGSAD08DnDm7wa9yA9w7d9NU80=
X-Received: by 2002:a24:1749:: with SMTP id 70mr9738348ith.50.1554475053768;
	Fri, 05 Apr 2019 07:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554391453.git.just.another.mariano@gmail.com>
In-Reply-To: <cover.1554391453.git.just.another.mariano@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Apr 2019 15:37:22 +0100
Message-ID: <CAJTo0LYVNgEkkhmv9j=hOE8bzn5KCzWZLSdrngG4UVrNBfaf+g@mail.gmail.com>
To: Mariano Lopez <just.another.mariano@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Feature to use symbolic links to binaries for ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2019 14:37:33 -0000
Content-Type: text/plain; charset="UTF-8"

Can you also port busybox to this instead of its own hand-coded logic?

Ross

On Fri, 5 Apr 2019 at 15:27, Mariano Lopez
<just.another.mariano@gmail.com> wrote:
>
> Some binaries are renamed by update-alternatives class at build time
> and some ptest run against a binary belonging to another package. Take
> for example busybox or util-linux.
>
> This series adds a directory within the ptest path with symlinks to the
> binaries produced by the package, so just adding this directory to the
> PATH will test the correct binaries.
>
> To use this feature just add PTEST_BINDIR = "1" to the recipe.
>
> This will help to solve bug 13238.
>
> [YOCTO #13238]
>
> The following changes since commit ffa5a1bda6741f5dc9f1b8db1bb37b0c6f103c99:
>
>   asciidoc: specify XML catalogue to use (2019-04-03 14:56:27 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/justanotherboy/poky bug12597
>   https://github.com/justanotherboy/poky/tree/bug12597
>
> Mariano Lopez (3):
>   update-alternatives.bbclass: Add function to get renamed binaries
>   ptest.bbclass: Add feature to populate a binary directory
>   util-linux: Use PTEST binary directory
>
>
> --
> 2.19.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

