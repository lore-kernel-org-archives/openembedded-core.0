Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1379B79199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 19:47:33 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id k25-v6so2264970uao.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Q/9LHA6xOO8cA3IZS0vOBstOH/KBb+a8lZZDt53ZBJc=;
	b=Rvdz5xd0kQ2hiB9VC6M7of3eJoqC0JoirMKtkjdWhl8V1l1cg/ZWVuSryd7VhMET1E
	OYTklulwPYCxKrof7P0LAG4OmPr+dVSJH3uL9FeOqrMgIiVBHrFZyfEriHM6GhLs41RL
	iQltS/9zeOKh1CB1J62Oj5Vj/W6GUuRarnrN+5O0JL4M8G8lS7pz5nBI6ZPw93oD4Q2d
	eDaeCIW2xDYumAVbb/fFtWC3NbtRHep52bCFIycX77Otc9jFrVRhhAwunJo72/xHz7LT
	kEiI5ogndxAeJRHdG/9KrOpLQgaZhMKRXYitVGU1/Ktl/Bb+Vsv54Daj2Q15CfrJRWMi
	RN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Q/9LHA6xOO8cA3IZS0vOBstOH/KBb+a8lZZDt53ZBJc=;
	b=JZVSQgeZSEDYUZ7D0yn2fz/i2CdKDQe1kf8BNDAAQ6AlLpGxPpQPZnkvDGHLY29Wr6
	evwCJzmWml8CORzvkZxLHRB6uFxKoPgBS5sSp0x2LAnYZvAVwbDjqpYF9cIgUcHZqEHK
	Qrkj5GLXQfIskb1DWYlUwzhGDDiO2ynbTtnG/L1ZQi2RRQ28VWwOx/VdayUSoX7ny2t2
	lhPMWCb7ksV+9yF4PGsYR7CzPG+ACSMypG0GiTqOZxNaXxFtWdDoInBG5+KiE1LvPsRv
	0kJYqHWlK6Gyqv7uhAcp+1AJqbHWEsDaEOzsX6pNUGEzD2Dsa9JNHF8tY1jMiT6wfpxN
	wu2w==
X-Gm-Message-State: AOUpUlER6p4Vg1nd4r5ou/j/8SB+e8fiVNqExpC1tKUmUnmm4u1tKkVG
	tVoXYAOEEtZGxsnLHBZK2aDSAx+seL88uhpCq802ldj5
X-Google-Smtp-Source: AA+uWPynDpsk+nUEtgXg31Gr6LYAaOj1yZnYvq6tTClwn9jCkQmVAHTrpeIn5lSeNo1n5U1axaaaSBco4zYaOXHDBcY=
X-Received: by 2002:a9f:3f8c:: with SMTP id
	k12-v6mr18157307uaj.38.1534362454738; 
	Wed, 15 Aug 2018 12:47:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 15 Aug 2018 12:47:34 -0700 (PDT)
In-Reply-To: <20180815115907.14045-1-martin@geanix.com>
References: <20180815115907.14045-1-martin@geanix.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 15 Aug 2018 12:47:34 -0700
Message-ID: <CAJ86T=UJ1xqGDjeO+i9Qyy8sbA_027c2GZQtaqSwp15VAaoUHw@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: fix wrong volatile dir for sshd host keys on read-only rootfs
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
X-List-Received-Date: Wed, 15 Aug 2018 19:47:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2018 at 4:59 AM, Martin Hundeb=C3=B8ll <martin@geanix.com> =
wrote:
> When the read-only-rootfs image feature is enabled, and openssh is
> installed into an image, the ssh daemon is reconfigured to use
> /var/run/ssh when generating host keys.
>
> Fix up the creation of the volatile dir to actually match what sshd is
> configured to.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd =
b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
> index a0d2af3c65..fcbc5ae9d5 100644
> --- a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
> +++ b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
> @@ -1,2 +1,2 @@
> -d root root 0755 /var/run/sshd none
> +d root root 0755 /var/run/ssh none

This doesn't look right.

/var/run/sshd is the directory used for privilege separation (grep for
--with-privsep-path ), so it's not correct to remove it.

Note that sshd_check_keys script runs "mkdir -p $SYSCONFDIR" (ie
/var/run/ssh in the read-only rootfs case) at run time before creating
any keys.

What exactly was the problem that this patch tries to fix?

>  f root root 0644 /var/log/lastlog none
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

