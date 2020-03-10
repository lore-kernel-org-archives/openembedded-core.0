Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 732F261B3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 00:00:30 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id n6so7310584vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 17:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ynoWbi23H6MGmyb5DkMRxyFTEKzLn8Kd8yqQT4VnNEo=;
	b=SVCL/ygwLstHybKBnmNPjiW/KfyaiIEUgYXnWI2M6aTrReY5AdtOtI7T/wMMPFnziL
	RnoNxLDlkYLumEL4T4whg2nCTEtsSyxJcVZpR6/z7vyo2MvD0FXQA9eB9T+o/xbs4r5F
	Cz76L6VqxcKqvQmqydhatDDYFsguE50UqmGGoRQLRtiuQX5Vk4BXpyGxq1dcpkH6muyZ
	4cmE7sUSFZhltkf3qDb7Wh+FCLXbjguCq1w+yvxbAGl0n/so3oZ4i6+YjuKKuLWj6BIt
	ah/Urz5id8L4ZXhhIce1iiBPTg1uhB+wRmjpMkDawr9retKfH+KTAy7KdICBgU6HcJ1e
	B7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ynoWbi23H6MGmyb5DkMRxyFTEKzLn8Kd8yqQT4VnNEo=;
	b=LQYlJC3QedqIGMTl2jtK5wC39eUbIkLV600VrnEEBZF40yJpichz5CCMTs0fMfbFWR
	cWs64U5Uja1xvoMwaSUrlV9g1zP/iOOi6h6OPAcb5EAWecZtGa18LG6K0kxg7sIuM1Q1
	ntgnBq6rHXxmDNBHrgom5SoYR6qISf8t7VtTBDqjbJCqEncva+uJP7pFSkOk22/Rwebz
	ArUsSpPtmExbNI0E16Ta1KSgRC3Cgq+b04D1gX84rEStTJHiRgsTGWyuhIb9VJsr/nQv
	QQQfNZ04ATuiJFPJQeKd4ehkuX6tI7CFKwqAs7PYnnfdq3xz7J35WHnZNcClXUuUJH5a
	6I4w==
X-Gm-Message-State: ANhLgQ37Ghbwx/EtqgwzLN6QpQFHbeNnxqgxIG6J5kHh0VSV5nzj6h4C
	4TA/kYBLd1IVeIZ+uSZr7P5quHoRCvR3qahcjfw=
X-Google-Smtp-Source: ADFU+vtFa/VqQHUYEXapGd//5HaPVW6XKP+ttAEyddMJGs8OF2WWU0BB2Cs68ihNj2Nd4ybWp+KF1pw2HKEhbBBnY2A=
X-Received: by 2002:a05:6102:2250:: with SMTP id
	e16mr7995555vsb.130.1583798430900; 
	Mon, 09 Mar 2020 17:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200309234709.1463471-1-raj.khem@gmail.com>
In-Reply-To: <20200309234709.1463471-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Mar 2020 17:00:19 -0700
Message-ID: <CAJ86T=VhZ69k1TxVfOUvjXsAFOx3Ztd0oK3hWcT7pdSbc-eSog@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus-test: Replace cp -a with portable options
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
X-List-Received-Date: Tue, 10 Mar 2020 00:00:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 9, 2020 at 4:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> -a option is linux specific

Is it?

> Errors like below are fixed when -a is used

Do you mean the errors are fixed when -a is _not_ used ?

Either way, the key fix here looks to be effectively removing
--preserve=ownership from the cp command, not somehow making the cp
command line arguments more portable as the subject implies. There are
many similar fixes already in oe-core and meta-oe.

> bus/connection.h is owned by uid 1000, which is the same as t
> he user running bitbake. This may be due to host contamination
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> index bea0e74ed0..91e2ba69d2 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> @@ -70,11 +70,11 @@ do_install_ptest() {
>
>         install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
>
> -       cp -r ${B}/test/data ${D}${PTEST_PATH}/test
> +       cp -R --no-dereference --preserve=mode,links ${B}/test/data ${D}${PTEST_PATH}/test
>         install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
>
>         install -d ${D}${PTEST_PATH}/test/.libs
> -       cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
> +       cp -R --no-dereference --preserve=mode,links ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
>
>         # Remove build host references...
>         find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

