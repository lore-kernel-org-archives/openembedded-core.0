Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8C560685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 20:15:28 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 59so9902723otp.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=+N1oPkUeu8o8sJGoLuHyfiwkRteKXDDJLFk/uW9lfAE=;
	b=L+LlZ1S/I8iogcomMbDS23/voSTLdgtEOTD2S75oqOunlGaReavDogFdeZwlBrShpC
	DkBdOqNyW4uh2FfA2WgEzwmFWF/wzoUQFOWxxXHNSKDBc/zPI6YcDooq98vofC+2oH0c
	bIKi80Pk8gCahB5i4tfuCLjJvrk7prmslsgII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=+N1oPkUeu8o8sJGoLuHyfiwkRteKXDDJLFk/uW9lfAE=;
	b=Fy9VRlO3PYx8GsSQuk8iymf9jl5tjLIs60gBIVqqMhD2wWiZ2JWcAGAsp+oM7PgvYL
	1y+vjx5ULZs1xAeGNtQ1PAuYe4IOnZOaq0U6OKZOa4NVH2WvdyXe7jFncrHa2+KTNOn+
	C5MuOJZYOjEAjfLTXrBL4jv6HVVImbGl3s5M2ndjLYfhIUusIgWY9lRppRiQqTd2j1Mp
	Y5RpRegZnUKM/ij3L15Na3o2tJZPNsEtV8NI6/b66geZhOwNKzkpzTrUsRtRFRt6xLyd
	LkFVhPS1x24km2U8tCgfu4/gDTUqTMMbOE4K8abKOc2b8jC9olRV9VbeyqtnMIxXY+ii
	ZWLg==
X-Gm-Message-State: APjAAAX26kIvZgdGd7ww/6NwVnQTrZ+bydRUzVAG5H/V/+6Ur9N1Ury6
	wUXDAE9aZpsum4Qo5uNR4BuN2gBxzUezBtwTPA/Bd9U/OrU=
X-Google-Smtp-Source: APXvYqyt8NoJ8iOerSu3kSSLz82sSXl4WKb9xvw4G/oeeDZ/oE0UrUpBZPFCy52lF77DgWLNBNN8WcKivQ+WH/3sQLo=
X-Received: by 2002:a9d:470a:: with SMTP id a10mr42514483otf.370.1582575328783;
	Mon, 24 Feb 2020 12:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20200224201401.13720-1-pbarker@konsulko.com>
In-Reply-To: <20200224201401.13720-1-pbarker@konsulko.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 24 Feb 2020 20:15:17 +0000
Message-ID: <CAM9ZRVs6Ma7K_L579Zy6VR2AmY_O-Nu7h7vHMcupCHz7ogznOQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fetch2/gitsm: Unpack shallow mirror tarballs
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
X-List-Received-Date: Mon, 24 Feb 2020 20:15:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2020 at 20:14, Paul Barker <pbarker@konsulko.com> wrote:
>
> When a shallow mirror tarball is used to satisfy a gitsm URI it needs to
> be unpacked so that the .gitmodules file can be examined.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  lib/bb/fetch2/gitsm.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/bb/fetch2/gitsm.py b/lib/bb/fetch2/gitsm.py
> index aa121cbe..98f5dae5 100644
> --- a/lib/bb/fetch2/gitsm.py
> +++ b/lib/bb/fetch2/gitsm.py
> @@ -169,6 +169,12 @@ class GitSM(Git):
>                  raise
>
>          Git.download(self, ud, d)
> +
> +        # If we're using a shallow mirror tarball it needs to be unpacked so
> +        # that we can examine the .gitmodules file
> +        if ud.shallow and os.path.exists(ud.fullshallow) and Git.need_update(self, ud, d):
> +            bb.utils.mkdirhier(ud.clonedir)
> +            runfetchcmd("tar -xzf %s" % ud.fullshallow, d, workdir=ud.clonedir)
>          self.process_submodules(ud, ud.clonedir, download_submodule, d)
>
>      def unpack(self, ud, destdir, d):
> --
> 2.20.1
>

 I realised the moment I hit send that I got the wrong mailing list...

