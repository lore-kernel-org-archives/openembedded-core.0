Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 131CC7391A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:38:34 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id y9so70636792uae.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 09:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aw3pL86NQZFgeejC4AV7n78jzG7BmzvqSXXBp31XJVo=;
	b=kcZE7uhJOaVSedDWunQzZ+5RmSnZ+tuRU8aspywvwJn8y/WxMT30U8uywEwdO9Wwb0
	mKnn/IzphSwci82ThTWBv49hNwsGssDsidgKHU8Z4Et0TdTXOswkBmHqBm30C8OEex3T
	C84YzXZAAGQjq29WZ0JJ4b426dP3RkPHq/PU7Egqs1kY53ClbGogznl5OzZ+xMNXqz45
	zfkdMGtft/UnPKMX6FGHerNPYWdbVbJa1scwkQHwz6V90/eKJuP9xgNfJdO+YxpZv7fz
	WEeY/ImJdRGmqDQDpxaH3JEoHMeOZ6dVlPcPLMQ3egZVKQyg5bvTUyPBYyPeDfKb5msL
	Lcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aw3pL86NQZFgeejC4AV7n78jzG7BmzvqSXXBp31XJVo=;
	b=FPtpmaRf4sqpIJ6flsuwe/Hn0EUCjBjrF488vrtccRhvfzMYf5HroeWfCh5QDszT0U
	JAf1nnRko4pmb2YVJQW+juJwRlIDm4Bok/DIBUkxNQ83+SURKV3rQOxkwebK3GQCRcln
	XPU5x5pyXqLreXv3C+aKW1nbsVA9366nrKthh6ohfKpeij80oFuoKrJkgY/ksaR1SpYQ
	HS9VTTugxQwQq2j3WtCmckuUIJ8l3gtcQwI1yKtsgVu5GZtPxHVrrfJZZMJnBqh9umaY
	L62otv7OQkOZblffL0TR+8Wr87FI4/63Jy5jT2Cc09Z7o0zkIvK/ffcgOVu490JMKKFB
	Sh9g==
X-Gm-Message-State: AMke39nLqOR44Ez5/tXKHJ8RjaZc7UOvVGxdoX7i3QxBFnKPe+Epokwnkrr5rzqBX1l6aVu2boCzlg8x+dYnMA==
X-Received: by 10.176.66.66 with SMTP id i60mr12901898uai.131.1487007515106;
	Mon, 13 Feb 2017 09:38:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 13 Feb 2017 09:38:04 -0800 (PST)
In-Reply-To: <20170213124142.17081-1-mac@mcrowe.com>
References: <20170213124142.17081-1-mac@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Feb 2017 09:38:04 -0800
Message-ID: <CAMKF1sqa-TunzUMu_ZsHftcj=XdZpk9q_bctT=Y2wYmTRfDKOw@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Attempt to work around do_image_complete race
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
X-List-Received-Date: Mon, 13 Feb 2017 17:38:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 4:41 AM, Mike Crowe <mac@mcrowe.com> wrote:
> If two do_image_complete tasks run in parallel they risk both trying to p=
ut
> their image into ${DEPLOY_DIR_IMAGE} at the same time. Both will contain =
a
> README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt file. In theory this
> should be safe because "cp -alf" will just cause one to overwrite the
> other. Unfortunately, coreutils cp also has a race which means that if on=
e
> copy creates the file at just the wrong point the other will fail with:
>
>  cp: cannot create hard link =E2=80=98..../tmp-glibc/deploy/images/panter=
a/README_-_DO_NOT_DELETE_FILES_IN_THIS_D.txt=E2=80=99 to =E2=80=98..../tmp-=
glibc/work/rage_against-oe-linux-gnueabi/my-own-image/1.0-r0/deploy-my-own-=
image-complete/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt=E2=80=99:=
 File exists
>
> The coreutils bug has been reported and fixed upstream as
> https://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D25680 , but it will take
> a while for host distributions to catch up.
>
> In the meantime, let's try and avoid the race altogether by causing
> sstate.bbclass:sstate_install to take a lock file in
> ${DEPLOY_DIR_IMAGE} whilst writing. This lock is probably a bit broad,
> but it's better than the build failing.
>

will this lock serialize writing other files too ? then this will slow
down parallel builds. Perhaps, writing common files can be spun into a
task of its own which is then common 1 task across all images building
in parallel.

> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/image.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index b5a4fb4a33..5c2f183446 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -298,6 +298,10 @@ SSTATE_SKIP_CREATION_task-image-complete =3D '1'
>  do_image_complete[sstate-inputdirs] =3D "${IMGDEPLOYDIR}"
>  do_image_complete[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
>  do_image_complete[stamp-extra-info] =3D "${MACHINE}"
> +# Defend against copying two different images to ${DEPLOY_DIR_IMAGE}
> +# at the same time because they risk both trying to create
> +# README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt at the same time.
> +do_image_complete[sstate-lockfile-shared] =3D "${DEPLOY_DIR_IMAGE}/image=
-complete-output.lock"
>  addtask do_image_complete after do_image before do_build
>
>  # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
> --
> 2.12.0.rc0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

