Return-Path: <ptsneves@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D76478DB9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 12:23:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f21-v6so2514527wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ua4DnnAHxKe7r3jgcDP0z5IIlHyV7xDd7iA63yVBL0c=;
	b=RYJq48x/vq9sEtkXiNmMGk1alBRAkByNiW4ZHvvSJ+Vj7ihV3NDmfFoEnDtq7JwLe2
	Ms7kqF5pBj4Evfj9zeuW4WAjoP5Ad2TtmHzaJvqvBIwpQIBXh84ofZ9ZeS0GdeNhuMEf
	8B6YY2w4fOSeQqmZVqswwis3k0IR9W1kbl9hDqIkE2P/9Or/pa6Wf3xNb+LQoXBzD5pn
	SpCEmL0ZwE4nxOxZ9s4g/SOS1M9JO5uz5lB4i9vdHnYdMpZ+FXVsF/PnjApw/liPQ3Lx
	YrZ6PcBMRwbf1Y87voyZsOYLK5hF2DxVQmyfDeno5d0vpfxQhhsx86H1HM/oPfDeIHMA
	T5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ua4DnnAHxKe7r3jgcDP0z5IIlHyV7xDd7iA63yVBL0c=;
	b=ffm0mF62SHsaoRjwbpahOo43FtLiD2d1oy64wITiqet/bfpMQHYdfT7QzNAfjEnRLj
	OPyjXVE4i9w7OnwLimOc4CEopuv1I6dpA/UdzGfvjSpOUUgZXxsq3FF2POCPR/1vBESG
	l/OKlZjthUGvS+/8LVMQEDh9VfANPBNbefkRkxozwsK2RH8yPwyQ158eomKGMb2z4Dti
	JZCV9bnDN4yulvlyLZVE2i9lM3opXabYUi1Xm1MNsrYnGfx/HKgYuHoMDxD85mNMmfWL
	exKe5sQPF/IVSSoPh14256Gl/doZofUZGtKo25OcUWx+ZdDJBdeO8pKWE4wIMi/oG/pz
	wzcw==
X-Gm-Message-State: AOUpUlHGUh76cEl1qzWNHMKA9Ez851jJWFkVOYrOYEyxbXJhAUjOlQIe
	NOhRDiUxoOebUZBY8WEm9NWqz5JvTJH8Hsbbgw==
X-Google-Smtp-Source: AA+uWPyI02pID19c5V8cGFA/hhgjHKXBuqut9N79gAYWw6DB3ZUDxfrieqcZbWBI5WHWBEzGIcH7dVNlUhzCMnj5TnU=
X-Received: by 2002:a1c:3351:: with SMTP id
	z78-v6mr1705471wmz.23.1533731013849; 
	Wed, 08 Aug 2018 05:23:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:e719:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 05:23:33 -0700 (PDT)
In-Reply-To: <20180806152509.7951-1-JPEWhacker@gmail.com>
References: <20180806152509.7951-1-JPEWhacker@gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Wed, 8 Aug 2018 14:23:33 +0200
Message-ID: <CAJO0J4jUXMeUY+bb+aUVySyVi2vOWpNbRfx=efXNjDuJ-tWhSw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/reproducible_build: Avoid dereferencing symlinks
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
X-List-Received-Date: Wed, 08 Aug 2018 12:23:33 -0000
Content-Type: text/plain; charset="UTF-8"

minor nitpick. Your patch changed the whitespace indentation ;)

On Mon, Aug 6, 2018 at 5:25 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
> Using os.path.getmtime() will dereference symbolic links in an attempt
> to get the last modified time. This can cause errors if the target
> doesn't exist, or worse map to some absolute build host path which would
> make a build not reproducible.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/reproducible_build.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index 2df805330aa..268b5fb8f19 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -56,7 +56,7 @@ def get_source_date_epoch_known_files(d, path):
>      for file in known_files:
>          filepath = os.path.join(path,file)
>          if os.path.isfile(filepath):
> -            mtime = int(os.path.getmtime(filepath))
> +            mtime = int(os.lstat(filepath).st_mtime)
>              # There may be more than one "known_file" present, if so, use the youngest one
>              if mtime > source_date_epoch:
>                  source_date_epoch = mtime
> @@ -114,7 +114,7 @@ python do_create_source_date_epoch_stamp() {
>              for fname in files:
>                  filename = os.path.join(root, fname)
>                  try:
> -                    mtime = int(os.path.getmtime(filename))
> +                    mtime = int(os.lstat(filename).st_mtime)
>                  except ValueError:
>                      mtime = 0
>                  if mtime > source_date_epoch:
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

