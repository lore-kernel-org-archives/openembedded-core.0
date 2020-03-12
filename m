Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B030361C28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 20:54:58 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h14so8755871qke.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 13:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mwnv+EYkSqZ+GFMzmyi9184S2LTUP/zXUNixDRvfe1E=;
	b=f5Z5YDuajlOjuhTozZDeg8MxRFAq5bVi4lgFSt1iXSDYjLIkkWoSqK5gc8Ff9PlhxP
	rs4ulXCWaM+0GF70FURMxJ8caFRcK7l9J/piQxnp4YV5cCbWLczV0Y55TUh17VI2yeAE
	/WAdf4QbA0A9VtiB5mvYXYz2vxN1yASBB0EVMtUTu1RyZZnZ20WypyEyO5Q1FWhZpBPO
	15zqH2D5M5xJO44Oarzf4QnTW8aXT7SJOZhpBL8VVqzUdXjebRIpU+5+qVoUbeuI/tQB
	PmVSA5gR5+WfhvW0all1MEexbZ+Q4SA/gzzrusSuzakGwoLu2yVIJTjdHRShNfSqZtkc
	5Y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mwnv+EYkSqZ+GFMzmyi9184S2LTUP/zXUNixDRvfe1E=;
	b=TIWJ2GM78gqfAdHCgiyw45LpikDB4RVZfOMav1p3Cryq5Wm++41dtWvzhM29LtOsHK
	0zS3l0ztmBVHB45Yw/S691fDjwZ043FvVvFyoWAM4s58pBk7bFqU+RpWjqbZGB50hK0S
	E56xVeqW6ytlMEo35eUWBO1QQPNqEv9P0Q/AUUH45VSS5mIjOd3IKqYonf6FNSJODCSC
	zfv4IC0X3HFTMGQy4tARqPw2grAZDzKj6iBRuDwuZa/tJKAgtyu7cq14ong0XYWx3V/Q
	s6HDk0CyDfeXtoTikf3+X9fHHM8tTUwN/D7GCKJoipDF3FYveVadMYdZ5QRkFT/bu5pV
	P+cQ==
X-Gm-Message-State: ANhLgQ2IiviNGb3I7vHnUSfW/DrRNFnOPUc8cykNWpgU9+CdRRaYbOYb
	dDyLWFluxP/Q9C/sGx6G4kU4GvcfqI/QAEnss18=
X-Google-Smtp-Source: ADFU+vuC7aWXpR9etZXgmfzqeV0hiDMcwiqjkDge6/VulmRv2ZFznOmDLWxjhDfvBt8+DNx22DQrthIdLiEEIh1cErs=
X-Received: by 2002:a37:e317:: with SMTP id y23mr9627725qki.431.1584046499089; 
	Thu, 12 Mar 2020 13:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-5-alex.kanavin@gmail.com>
In-Reply-To: <20200219194752.7967-5-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Mar 2020 13:54:32 -0700
Message-ID: <CAMKF1sovMyoYh1dtCX3mXfaHZ67TLrMuRrYiPwdxmh3aKi2vaA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/13] weston-init: use the drm/kms backend rather than fbdev one for qemux86 machines
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
X-List-Received-Date: Thu, 12 Mar 2020 20:54:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 11:49 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The fbdev backend is not documented, and not the default;
> as the emulated hardware in qemu now supports DRM/KMS
> (both std and virtio), we should align with upstream default
> and vast majority of users. Empty init file will cause
> weston to default to the KMS backend.
>
> Note that 3D acceleration via virgl is not required; the backend
> renders fine via the software driver in mesa. However, kvm
> is more or less required to keep the UI responsive.
>
> Also, other qemu targets (mips and arm in particular) continue
> to use the fbdev backend, as in the absence of kvm, the performance
> of software GL paths falls to unacceptable level.
>

drm backend change did not work directly with musl, I will send a
patch to enable WESTON_DISABLE_ATOMIC when launching weston

which should fix the launch errors seen

[18:58:45.628] launching '/usr/libexec/weston-desktop-shell'
[18:58:45.737] atomic: couldn't commit new state: Invalid argument
[18:58:45.737] repaint-flush failed: Invalid argument

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini | 0
>  meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini    | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
> new file mode 100644
> index 0000000000..e69de29bb2
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

