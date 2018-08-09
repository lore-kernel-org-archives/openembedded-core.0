Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id A1CD6607E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 17:10:58 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id w16-v6so5029969ljh.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=riStLWzDuhJwdTebVr8yj26Lx/GGKiddj+sr1RNjHrg=;
	b=YWE5MvzTShS51kqqoPphdlTraetVlTiItVJeHbPO+otU/bXQYig2rzJa53oep56+Ow
	rpoA7uDnx/+2LgIxS/DRbrPUThUEfAus+mTJM2s3QAGEzef9LK14I2cd804qkv/Rn8Sz
	F2po70iTK5eQAj237eaaRc0qi+EGcDpwew0dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=riStLWzDuhJwdTebVr8yj26Lx/GGKiddj+sr1RNjHrg=;
	b=cvMhDekJhN29kF2LiIRJ76sRf/HiSNk/rqPcb23WSJlN5bYqh2RjLhr4N+OSaM7akq
	cf+9btihJNTzxEv5naYN7vuHv0FlZnClrjiUw1717sf1p2y4E/qH9BjCtJesPvKN8EBG
	xlaTTZewcCC60sGJc6UkN4mwfefBPWM0F5geU1HbHoi96/O9teN2RlMQWqz8SPnM5G0C
	1CvqW60NJMOLg4fSq7n0YfNSsr6pnR4OWv/vMoNyHjP1sEGs6GC9qZ2yScBmlcSUqF8s
	qYQNhBEJT6KogvQDr9PqixqlHhpDbTLa33edltIfn6ayzi6ktwOSWTOVQkWBAKSXYwPf
	Ynqw==
X-Gm-Message-State: AOUpUlHhd8mFjcXNkDMShM4y/l90meknQ922tbFmj2E06+DhmbcUY1AR
	faGC7Qq71NK5DH39zfgCr+CBGOGIaWAKM1ZCygwfGmEBvN4=
X-Google-Smtp-Source: AA+uWPwziaHRJnOR3l1FDofEWK1OeZO3pGb0WeJ6F8ikQFHrUkKUyKrJWkh88EdyzovpB+8qh/ZtvBdo8+n1voFuRjE=
X-Received: by 2002:a2e:4401:: with SMTP id r1-v6mr2432564lja.21.1533834659010;
	Thu, 09 Aug 2018 10:10:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:140c:0:0:0:0:0 with HTTP;
	Thu, 9 Aug 2018 10:10:58 -0700 (PDT)
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Thu, 9 Aug 2018 12:10:58 -0500
Message-ID: <CAEUSe799Ubpgn9mVfxcKHKfoyV1VnDNk+ByF8V5eKE6ueHcU0Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Thu, 09 Aug 2018 17:10:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!


On 26 July 2018 at 09:38, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrote:
> Once another header #includes <bits/wordsize.h>, there is a
> potential recursion going on because the
> multilib_header_wrapper.h #includes <bits/wordsize.h> again!
>
> This should not happen because an __arm__ (32-bits) or an
> __aarch64__ (64-bits) environment guarantees that we will
> be getting the correct definition, but when building against
> a different target (like BPF), recursion is what happens.
>
> This can be seen, for instance, when building eBPF programs
> from the kernel with `clang -target bpf', such as the ones
> located in linux/tools/testing/selftests/bpf/.
>
> (From OE-Core rev: a74c77d6168101e88c3a3bce7130f4f52cfab95d)
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index b6d8074..c360dd9 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -136,8 +136,7 @@ do_install_append_armeb () {
>  }
>
>  do_install_armmultilib () {
> -
> -       oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp=
-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
> +       oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp=
-fast.h bits/hwcap.h bits/ipc.h bits/link.h
>         oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/p=
threadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/s=
etjmp.h
>         oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/st=
atfs.h bits/typesizes.h
>
> --
> 2.7.4


Please disregard this patch. An alternative will be posted shortly.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

