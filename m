Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id B1E4373D49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 18:24:07 +0000 (UTC)
Received: by oica37 with SMTP id a37so79695232oic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 11:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MqH4i5et1PgTJtcYhAbf30DqImhyUVTtfhkxkXS4UcU=;
	b=MH9Wqn8BH9W9Ifct91GVP+lM79kFOthZvSiBlp/7/ZZRTeOZPJlhEh87HwM898CqP3
	Lx4AXm4m4u9Pe57E9sAZHHvSOQcrtIpQAM5wgRYNjLAgOafxWzMGWoBZSOpHUY05aFd3
	uKERR8Zc/dFSSpCjR6RAiUn1h0BkqOBKCylsV6Zt0m4v8qJ2shGW9ia6bHfRDeumRhqi
	KV0KjLzeXdGL+gNN4ogjXeYbdLQIPRhw4N6XNWDLopCvIVPjZe3wDLCYChgT7Fte5T0z
	ZxRAACOnU1CdacE3IVd0VN8qborUpBJhMmr3q03CKY5m9UiAcWI4nL92KhjOJ4CCcMRx
	SUAw==
MIME-Version: 1.0
X-Received: by 10.202.197.138 with SMTP id v132mr3877878oif.17.1429295048174; 
	Fri, 17 Apr 2015 11:24:08 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Fri, 17 Apr 2015 11:24:08 -0700 (PDT)
In-Reply-To: <1429260608-3505-1-git-send-email-zhengjunling@huawei.com>
References: <1429260608-3505-1-git-send-email-zhengjunling@huawei.com>
Date: Fri, 17 Apr 2015 11:24:08 -0700
Message-ID: <CAJ86T=VcRP1Fxc2+yb12K33TKqssuChAwHTAKjtAWyeMmqMrew@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Junling Zheng <zhengjunling@huawei.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: remove referencing paths from the build host
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
X-List-Received-Date: Fri, 17 Apr 2015 18:24:08 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 17, 2015 at 1:50 AM, Junling Zheng <zhengjunling@huawei.com> wrote:
> Currently ${D}${includedir}/gmp.h references the path of build host
> incorrectly, remove it.
>
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
>  meta/recipes-support/gmp/gmp.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
> index 558ee06..a80b356 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -26,4 +26,8 @@ EXTRA_OECONF += " --enable-cxx=detect"
>  PACKAGES =+ "libgmpxx"
>  FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
>
> +do_install_append_class-target() {
> +       sed -i "s+--sysroot=${STAGING_DIR_HOST}++g" ${D}${includedir}/gmp.h
> +}

It's possible that STAGING_DIR_HOST could contain '+' characters, so
'|' would be a safer sed separator to use here.

> +
>  SSTATE_SCAN_FILES += "gmp.h"
> --
> 1.9.1
>

