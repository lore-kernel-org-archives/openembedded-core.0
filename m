Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 05144613FD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 17:00:27 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c20so14052543qkm.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 09:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aitlfOMUYn6a0hbn7yXy1VrjjTkTO6ZAbHtV514NQZI=;
	b=TQ8XnL/BlxOrPF9xl1ivtVSLHLGsScYc8p0R8UlhhH+oW1oJtYqaumuTWRJPj6Sc2B
	hiKPR45DxLI6474Stp9VQpw3wibP/pjqeCgiy0ZNLsgr3mZN3DQF7Boh2q7NrFng1BmZ
	MQMN34DQH+ll5ZS1Dko7tSZSh2b4cDtY8CJnwEA6EmPWFl17L2pjtqkcNAaLcgdT6l0J
	MtvFDSaFl2XeLexa4qwpOVDLE0EWJVseMpyRqnug0fMM9/wh1UDaWe24Uhg3I7nr5Z5+
	ZMmH16hIzcLAWLIXjS42fW6TbSEHoHusqjjIa+oJLGjj8C2hbdo9+hmMZSFMrW+OciGq
	l2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aitlfOMUYn6a0hbn7yXy1VrjjTkTO6ZAbHtV514NQZI=;
	b=RdchUVGKjxY9ICCB7GrVOo4LztqtdFamswRsqkMe7UON9rYnUcDMhOJQeNaOX14yAu
	olFLP/amqXJp140+n9ROhxec6ih1pDm6/2CJLhd5hfxsZ+C3fznOTg2nqeU5nZL2V6Os
	ri/oiNc2Hw5TvEBAeUnQcPV40iHjtQp18QNGjIfwhBjyvDpDgn/lrWRP7vXvBSDpet6N
	Is4U346e1ALJaozMvVKPXTDABDD3QlbwMHglfZ2ZW2Q7EtzcIsC+O6MU6YWyU89GyyiV
	OeHYdiqmbHJs0xoDNp722CUIV1EohH/RZSmjzMVYxnrRCUDuT904zGqxB+a3A0Px9joz
	cD+g==
X-Gm-Message-State: APjAAAVKmivKyopO+iUxW6wxBKzRGXLnCM0s6NBRnltuazitALm0Wkpf
	CvlYEkPr4vKk/bg7NAXFLrrweFtzgQNUeWpjWnQ=
X-Google-Smtp-Source: APXvYqw6v+5t0FrxzdVKbc7+BOwOI4Nu6g2GzWGA6ekyZ2N8guedkR+3Tyob9E3/uspChFX2mhKCW5PCoWqC6wwfQVw=
X-Received: by 2002:a37:de05:: with SMTP id h5mr11397382qkj.474.1581872428599; 
	Sun, 16 Feb 2020 09:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
In-Reply-To: <20200216155015.21738-5-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Feb 2020 09:00:02 -0800
Message-ID: <CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Sun, 16 Feb 2020 17:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The fbdev backend is not documented, and not the default;
> as the emulated hardware in qemu now supports DRM/KMS
> (both std and virtio), we should align with upstream default
> and vast majority of users.
>
> Note that 3D acceleration is not required; the backend
> renders fine via the software driver in mesa.
>

Please specify what all qemu machines have been tested, since we do
not test weston images
runtime, this will silently break untested qemu machines.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini | 2 --
>  1 file changed, 2 deletions(-)
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
> deleted file mode 100644
> index 17ebd7fdab..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -[core]
> -backend=fbdev-backend.so
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

