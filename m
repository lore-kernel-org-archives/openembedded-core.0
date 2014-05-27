Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (unknown [209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD366FA5C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 11:38:16 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j5so13744682qga.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 04:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OLIGONWSPeBtRpgvfzYYCdbX9tf3KvZlUmSQrclTZ90=;
	b=bv8gkyLvxuPUjwwxOy/kZv36XdBGac8kDOUOwrRgQiW7uOhZnqN0mpwsGeOLBDiThC
	Poc8KyA3ZdGGF6oBU7uhQcDvIXoNTK8aa/muk0Lexo/NX1avAspWqJh6ikRO4bkje6uQ
	qoe0vckwYHlUYYelvkO0Smu50lXiF7gUeiwJE9TlrtjSlFmLlRNaWPvPncPIRN+dghx8
	PpJpqDs5pqw3vPdzGp4ewtMpou0Fiic2iziRioD+HxHsvKo8scQdOPf5ZgrHHIZbcyO1
	HkVY5u1Nda1EC3SIKLd7lX2m2vSiNvPFKF1uxYnrTVvinqgVqxCcnrYEiEFW1qkubbDb
	v8DQ==
X-Gm-Message-State: ALoCoQnbA0bACCbM8qBC5KnIhEaKwxywvqaH0T/sOLa3LQGMAsonzA3v5wbI02JMlIMkwui/K33P
X-Received: by 10.224.121.72 with SMTP id g8mr40991195qar.79.1401190697645;
	Tue, 27 May 2014 04:38:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 27 May 2014 04:37:56 -0700 (PDT)
In-Reply-To: <48d8fbe3035f151a5a98061d507414fbf75f2f23.1401155797.git.hongxu.jia@windriver.com>
References: <cover.1401155797.git.hongxu.jia@windriver.com>
	<48d8fbe3035f151a5a98061d507414fbf75f2f23.1401155797.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 May 2014 12:37:56 +0100
Message-ID: <CAJTo0LY5MeXQFm0_N5uqLGm_f_ZXTZmX9_DtJicjeYhu=4iQ+w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] socat: upgrade to 1.7.2.4
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
X-List-Received-Date: Tue, 27 May 2014 11:38:18 -0000
Content-Type: text/plain; charset=UTF-8

On 27 May 2014 02:59, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../recipes-connectivity/socat/socat/compile.patch | 163 +++++++++++----------

Oh wow this patch is ... special.

99% of it is adding the extra arguments to AC_DEFINE so that recent
autoheader actually works.  This is essential upstream and I'm
surprised they still don't have it.

Remove all of these and we'll left with these two chunks:

 [AC_TRY_COMPILE([#include <termios.h>],
-[struct termios t; t.c_ispeed=0;],
+[struct termios t; t.c_ispeed=ISPEED_OFFSET; t.c_ospeed=OSPEED_OFFSET;],

I can't see a reason why that is obviously wrong but if it's right, it
needs to be explained in the patch header and pushed upstream.

-AC_DEFINE_UNQUOTED($1_SHIFT, ${$2})
+SHIFT_NAME="$1"_SHIFT
+AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])

This introduces a change that is subsequently removed by
fix-xxx-SHIFT-autoheader.patch, which again is basically fixing the
AC_DEFINE autoheader use, should be merged with the majority of
compile.patch, and submitted upstream.

Finally there's a do_configure_prepend that does yet more alternations
to the configure script.  This needs to be a patch instead of a sed.

> --- a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
> @@ -8,16 +8,18 @@ SECTION = "console/network"
>  DEPENDS = "openssl readline"
>
>  LICENSE = "GPL-2.0+-with-OpenSSL-exception"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
> -                    file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://README;beginline=257;endline=287;md5=79246f11a1db0b6ccec54d1fb711c01e"

Please explain why the license checksum changed.

Ross

