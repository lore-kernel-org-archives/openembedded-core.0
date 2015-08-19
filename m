Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4A659608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 05:58:39 +0000 (UTC)
Received: by igui7 with SMTP id i7so96976255igu.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 22:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HWHfjv6cd1oT/7oxVV1jteY+tWB/fULKg6cUwt2idF0=;
	b=uQZTFUGL6N7034z03n+X1oE5JpSi/kGH1s6+hz3KpTOjFhnzCOadPfD+jTIq9QYh+K
	nLNlJdhLwu55X4/hg+y5JNkGYIpa/C9tX0dUQpsmy3L/2hLQXtplszXxEUDhaP2Z8GVF
	vz7Cs7Bp/StZSVZ61umdL/oxf7gyyvbnnZ7RsQpGQaukMGY11ELSV4LknhlHn6/yNw1T
	lD5SZh1AkDVM7qTbMaNk9tYVd4Ub3SfnNEX7wJf6b6JQdMbhTFfsfW6rlowhUfgSkuyF
	qltZJZ+bXkBplsVgqJKu1WvbzXnUm7zhnv8GsGxId3CrftgO8ocU8fm78AE54vCWi3lS
	2JpA==
X-Received: by 10.50.93.102 with SMTP id ct6mr10355084igb.75.1439963919953;
	Tue, 18 Aug 2015 22:58:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Tue, 18 Aug 2015 22:58:10 -0700 (PDT)
In-Reply-To: <1439963643-30697-1-git-send-email-coldnew.tw@gmail.com>
References: <1439963643-30697-1-git-send-email-coldnew.tw@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Aug 2015 22:58:10 -0700
Message-ID: <CAMKF1sqLmC1+8d-N3R7T-Ynwsf7VRv10RJHRCe+MXcYvMBFjtA@mail.gmail.com>
To: Yen-Chin Lee <coldnew.tw@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl: Undefine finitel for uclibc
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
X-List-Received-Date: Wed, 19 Aug 2015 05:58:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 18, 2015 at 10:54 PM, Yen-Chin Lee <coldnew.tw@gmail.com> wrote:
> finitel is not implemented in uclibc and since its not posix, it wont be
> implemented in future too.
>
> Fixes perl 5.22 build error
>
> perl/5.22.0-r0/perl-5.22.0/sv.c:12135: undefined reference to `finitel'
>  | collect2: error: ld returned 1 exit status

OK

>
> Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl_5.22.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
> index e3a7f41..3ce7849 100644
> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
> @@ -134,6 +134,7 @@ do_configure() {
>          if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibceabi" ]; then
>                  sed -i -e "s,\(d_crypt_r=\)'define',\1'undef',g" \
>                         -e "s,\(d_futimes=\)'define',\1'undef',g" \
> +                       -e "s,\(d_finitel=\)'define',\1'undef',g" \
>                         -e "s,\(crypt_r_proto=\)'\w+',\1'0',g" \
>                         -e "s,\(d_getnetbyname_r=\)'define',\1'undef',g" \
>                         -e "s,\(getnetbyname_r_proto=\)'\w+',\1'0',g" \
> --
> 2.3.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

