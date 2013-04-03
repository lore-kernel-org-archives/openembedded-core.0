Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNPsP-0003a4-1k
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 17:45:31 +0200
Received: by mail-vb0-f41.google.com with SMTP id f13so553415vbg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 08:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=7tpQhjwEtuqw8y9uol5Yt07r7pTRDQzDzBzj08UozL0=;
	b=lOQ0NaYDoxI7BZLmTdzCzgkNq+oldWbiSvUwUOq7aTvbTpsM/cZTB2hY/IkUk2CW2u
	wqDaHuJPLpofduIOk2I4T5V976YpGdLeVeW5VTjvpI9PQZbKs1vW2WS104jnSw5bZVMy
	wqsVhasFQKEst2nUNwP31bqE7NT/5VRLrH5Kzf6QRza2uucMOFamRphEcIl3u7tcKQti
	58hOB9WgBx/W/QHmaLhHarzJkzU7pTTdC68u8GMiwtaAgpL70jrkFFH+N8T0gUnUz8LE
	qoZSdnaHjLc88pKcjOw0YZGc75Hf7GNJ+SeRiBnGDig2Ew/DmPAJzMXFoIMt+YlMQvf0
	hH/w==
X-Received: by 10.220.156.75 with SMTP id v11mr1642385vcw.1.1365002897025;
	Wed, 03 Apr 2013 08:28:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 3 Apr 2013 08:27:56 -0700 (PDT)
In-Reply-To: <CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2013 16:27:56 +0100
Message-ID: <CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQm1gk+piXWsy6uL+V3LX8/Fq02KUAcX/OhBDxF/1Qf1IjTnQcPqqIUj7Nqy7QYHTsp+RK70
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 15:45:35 -0000
Content-Type: text/plain; charset=UTF-8

On 3 April 2013 15:51, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> When we decide that we handle standard behavior different than the
> rest of the world, then this patch is basically a fork of systemd.
> Also we tell every affected software developer:
> "No your software won't work with OE-core / Yocto Project without
> adaption, we are incompatible with the systemd standard to make life
> more comfortable for (some of) us"

Changing the default target depending on the use of the image isn't
really the same as forking systemd, and we're not making anything
incompatible.

>> How would you implement this?  Register the alternative in systemd.bb
>> defaulting to graphical, and then switch it in every image recipe in
>> oe-core/meta-oe/etc that doesn't use an X or Wayland (patches coming
>> shortly) session?
>
> If this works why not?
> It sounds like a good idea, because this way would not break anything,
> and we would be compatible with the standard systemd.

Obviously the nuances of my sentiment were lost as it was transcribed to ASCII.

I'm advocating changing the default target to multi-user and then
patching the two recipes where X session scripts are packaged to also
set the target to graphical.  People switching to systemd who don't
use the standard X sessions (they roll their own, or don't use X, or
whatever) will notice quickly that the default target needs to be
changed, and can do it in their graphical startup recipes.

You're suggesting leaving the default target as graphical and changing
uncountable numbers of *image recipes* to override the default target,
the alternative being errors in the log.

So far "the community" disagrees on the approach here - we've had
vocal objections to errors in the log for any image, changing the
default target, and the other proposals.

We *do* need a way of changing the default target.  Do we at least all
agree that update-alternatives is a logical way of changing it on a
per-image basis?

Ross


