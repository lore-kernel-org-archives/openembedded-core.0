Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D81BCD6E7B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 19:56:09 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3363.1780689368273479009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 12:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ky18AiYa;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ce3876a50cso22555766d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 12:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780689367; cv=none;
        d=google.com; s=arc-20240605;
        b=SKyBrBmEOhDopcfNiABGPqdgtr137AtRCdsf+SpBPQFNGzrzTpvQGBQ2mBaWcFcFP7
         dKfJhq58pKJ58XkyiHRWWVum53nOsUg3SAwDvjEHBZrem83aajhmQXSME6eMK3tf8aqq
         sKXP/+GvwIu1WsUSgUy7bJpShgWV0F0LR7c9V6HcsKAmQbnSQRpNMx6x2t8dbbimFe72
         4JrItQU1Wc42BaTohYz6juYiIpz7u5EUfVtiAuQrDrlaafL8oCTuNf+/YwYRPp7kLBOT
         ndX65BwU1B7utTkSPikyTH7FiWVoaJV8gKfUjucKvpC6N9ZZnsre8VTMdmB59Pmt5aG+
         92Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jOBzKraj8Tac6HZpZRnuMQfIEinK+Jwxt+Ap6RBI/k=;
        fh=yaxIHG+dGsrF/NJj1JtK5acdkKBJ8RrrO5KeuoyprhE=;
        b=i+kBs/dhAoHOoLTnhQrlvX4j5ZoXQEz+86yJ+zho1HGWPCuSNn9d2VhErvjqKe/6YZ
         mDC9iW0AxmM7/TxtDrj50IJcG0CCXouNN3Cz3MoIg2Opp3dazJwG08JZyJR8QJT5SSFs
         9u7ksecKf4psOEPWbR7TEvHsKerjfCIQm35OqtQc9GlaYJNjEByN2vJuooblgoeENy1Q
         jF3/fb6Fad75/qH4RilnEVm2eczqdld/JURsT+cg4GklxvSUSuv3tDuWlKRl+i3lP91R
         RgFalEsJ+kFhfVoTpWi3mlKWPIRoFWMtSmzh/vrlV9d3Roydl30gD+0naqmbqVvtPwBJ
         hgeQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780689367; x=1781294167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jOBzKraj8Tac6HZpZRnuMQfIEinK+Jwxt+Ap6RBI/k=;
        b=ky18AiYarhiR9vSjOB6l+4ixmlw9qYCW30yZAYXrklrr3tf85wUdMCW7jzgv2QrjeK
         TAbjHfLLHXAndVKpnzaK2D1h9IvC/A/iQISewovvhrugoHm8CAi42b1qvnWyPB6wVVHT
         i6WhEFhOHokXWJLI/KqifIJWqJB9Xd9LeBLxPfz7TwcNkzP9gEHU/cybsZcaUB+DRmvg
         mlIA15g9U/tRuj/RMIrUsbaH1StZP89eEJTZszaqGgk5G75VomEV69Dkxm/kubdaUoNe
         pgQ/aHsq/MZmFN3fS9SI0oYd1zZVD4yMo/f4hI6obphGglMzYyOrZ6WncE3dP9ORYXNv
         sKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780689367; x=1781294167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jOBzKraj8Tac6HZpZRnuMQfIEinK+Jwxt+Ap6RBI/k=;
        b=RdG1Yaxxn706F7PrcySoZfQgc1O1a247bLHOPDpp1Xvt6ZmuiPpMwvWI+kwyK5UFkZ
         WGsxU9hGVnAmMuoX0ekGTiMzCvlQ46+gBRJjO+f2xttm8TmxbMYLc5jVqYQPTlaCPTcK
         QrXcdbHClROSzIFBMSBvOzMBPG4BxHTZTXPbeejBo9BezWIJ+NUVXzBFDCVNVbB3xSNS
         MGfVs2F23BqsfRQBcAcFkYX4NozWwx9hnt+zS9O+FgFuC6JplPpiOjV938mf97FsN0bV
         a7NQfz2L80OiqwIed5dFdzR1cnWfSS3kkCDJFwr+VHwwEv5FQ811ROi5o4Mqc14fFgdv
         ffgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AdUWLVw+C8iO/iQtedwPxTEY0/Pc5qJi/nLUR7Yu29WvdLQTU8WveL9fm7WiiMVRYeE2CSKmTPp4gUk5VNMgx6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyeKhWId3viGnfZ2EqA7m53nRrYMTPJ1glXy3VQQAI8dbdw9ZKm
	HaRD2OFlX+Dn478O9LS3lvVz4oZUEX7wVZzx1bH857odPESiEeQvpzJczgslutR5Ly4f+z2TBbu
	w0/deIi7Q4BfzAPZ42fRz/bOH1JcvIAc=
X-Gm-Gg: Acq92OGpzOs1nCxFHq4eHQuvide4787BiJqYtDL4M3pBhblOWzBFoT8VtQ5gpdlnKoC
	gcG+r5ywkjo/PLdovjmfRhDl4RCmuZ0L5qX/OLQde+94EB1YtIizeQIbvRFoAl9178uO+9vBlA7
	abjKqEpWVY2C/oupdk0j0oz35y+0vc+4Ec9Z0FWWTTxFqX2ccXZ7qaSkNiTOmpcJQ+agQ4DPwLO
	HjWC4SMXL0oIRXN9Hpc7l+fuZNty78+C9BnfDCxDIsrcN14l+vYDXB6pEMCrJZRBMxndD40Nhqi
	mZBZSMy/bzN5msbhI0f43rmLMVkwTaOByiG7pylYj6TxT+hQ3n1QH0gdTq4Nm2w=
X-Received: by 2002:a0c:e747:0:b0:8ce:b2e9:a4c1 with SMTP id
 6a1803df08f44-8cee5fe6a67mr73125506d6.14.1780689367093; Fri, 05 Jun 2026
 12:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com> <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com> <aiKEeH2UZgdePzjX@redhat.com>
 <CANNYZj-x8efUVB9Z5d2T9Ye4so6v3zamHVTexRCGmzOmkB6EuA@mail.gmail.com>
 <dd1729c6-f6e8-4790-b166-a635e34b3b1c@rsg.ci.i.u-tokyo.ac.jp> <c091222b-6df5-4a88-92e1-15ec986046df@windriver.com>
In-Reply-To: <c091222b-6df5-4a88-92e1-15ec986046df@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jun 2026 21:55:55 +0200
X-Gm-Features: AVVi8Ce3r9xnktEpEd89FcJNRoXCp9_stlFcnFBHAWTf8O5B4_1jGP3KwTpvr-I
Message-ID: <CANNYZj-S4ZEqttMv55rF8dcv6K+Spje1beXjgm5N-DWUGMh1oQ@mail.gmail.com>
Subject: Re: [OE-core] ui: Regression calling eglInitialize() since v11.0.0
To: Quan.Sun@windriver.com
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 19:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238182

On Fri, 5 Jun 2026 at 17:21, Quan Sun via lists.openembedded.org
<Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
> I think I mentioned also in another email that this commit 52053b7e0a
> ("ui/sdl2: Implement dpy dmabuf functions") may have caused the issue,
> which added the sdl2_set_hint_x11_force_egl() function:
>
> static void sdl2_set_hint_x11_force_egl(void)

This is correct; I've confirmed it by adding a revert and re-running the te=
st.

> The above function probes whether EGL is available on the X display. If
> eglGetDisplay() returns EGL_NO_DISPLAY (which can happen with llvmpipe on
> certain VNC configurations, for example), the hint is never set, and SDL
> falls back to GLX.
> GLX then tries DRI3, finds only the vgem driver (no real GPU), and crashe=
s.
> In QEMU 10.2.0, this function didn't exist =E2=80=94 SDL would use whatev=
er GL
> backend
> was available (GLX with software rendering via llvmpipe worked fine becau=
se
> it didn't attempt DRI3).
> Possible Fixes could be: Setting the EGL hint unconditionally when on
> X11 (remove the probe):
>
> static void sdl2_set_hint_x11_force_egl(void)
> {
> #if defined(SDL_HINT_VIDEO_X11_FORCE_EGL) && defined(CONFIG_OPENGL) &&
> defined(CONFIG_X11)
>      SDL_SetHint(SDL_HINT_VIDEO_X11_FORCE_EGL, "1");
> #endif
>
> }

All of this is yet more AI-generated nonsense, and none of it is true.

Quan, I appreciate you want to help, but please do not copy paste AI
slop without carefully checking its claims first. And if you do, make
it clear that you are providing 'AI advice'.

Otherwise it only multiplies confusion, and damages your own reputation.

Alex

