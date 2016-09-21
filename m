Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0551B6060E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:46:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so7330595wma.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IbNY5EPBp8PZoo5Ry3lZkCbFnRAJYNdBNJcDrLNT6Dc=;
	b=eaXCn2DK0y/6nkFCSfn+pxBYTxH+euCJznDt1boqUW0XTJOFpTlgQmSj8avO0EcOtl
	vvTudRef9YAtpSvdV4ASkXamNdE/w2qNqE4eTbC/sV2T/jOvW8NpIck+sF/eQVKLbUJg
	N8XgdZ3099q4EEVU4uwPYjPj5kLnHsog16CNzWvIDSsYaCMOUASrkvsyHN4/36Cd+VAO
	xtJcOv66+ZZ0Di7OTyYeHjj1wS5mjgA67J9max8waacqHUG5OrmVgiDbxQHGsq9L4EyK
	zR2jcF20XAkKWqc51Sm3xvS80rzPMlBKbH3bmbDLpe8+2YKkjJOSItF2bwr4xVKddMzI
	6lzg==
X-Gm-Message-State: AE9vXwPa9NTK5sZ4tMfSpNAfDFip7cqMEo1B+ovw5AqmDXiXVwtNonxN1CnObFATA57uow==
X-Received: by 10.28.229.131 with SMTP id c125mr1942825wmh.97.1474447585718;
	Wed, 21 Sep 2016 01:46:25 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n131sm31452763wmd.3.2016.09.21.01.46.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Sep 2016 01:46:24 -0700 (PDT)
Message-ID: <1474447584.16320.9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Ming Liu <liu.ming50@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 09:46:24 +0100
In-Reply-To: <1474443443-10872-1-git-send-email-liu.ming50@gmail.com>
References: <1474443443-10872-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH] libnl: Fix build with musl
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
X-List-Received-Date: Wed, 21 Sep 2016 08:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mi, 2016-09-21 at 09:37 +0200, Ming Liu wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> [YOCTO #10313]
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  .../libnl/libnl/0001-Fix-build-with-musl.patch     | 43
> ++++++++++++++++++++++
>  meta/recipes-support/libnl/libnl_3.2.28.bb         |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-support/libnl/libnl/0001-Fix-build-with-
> musl.patch
> 
> diff --git a/meta/recipes-support/libnl/libnl/0001-Fix-build-with-
> musl.patch b/meta/recipes-support/libnl/libnl/0001-Fix-build-with-
> musl.patch
> new file mode 100644
> index 0000000..8a2dad5
> --- /dev/null
> +++ b/meta/recipes-support/libnl/libnl/0001-Fix-build-with-musl.patch
> @@ -0,0 +1,43 @@
> +From 963d9818d13a025b857380c84d53b11c3aceff54 Mon Sep 17 00:00:00 2001
> +From: Peter Liu <peter.x.liu@external.atlascopco.com>
> +Date: Wed, 21 Sep 2016 09:07:12 +0200
> +Subject: [PATCH] Fix build with musl
> +
> +Upstream-Status: Pending
> +
> +Due to both <netinet/in.h> and <linux/in6.h> being included, the
> +in6_addr is being redefined: once from the C library headers and once
> +from the kernel headers. This causes some build failures with for
> +example the musl C library:
> +| In file included from ../../libnl-3.2.28/include/linux-
> private/linux/if_bridge.h:18:0,
> +|                  from ../../libnl-3.2.28/lib/route/link/bridge.c:26:
> +| /mnt/ale-build/tmp/musl/sysroots/itmk2/usr/include/linux/in6.h:32:8:
> error: redefinition of 'struct in6_addr'
> +|  struct in6_addr {
> +|         ^~~~~~~~
> +| In file included from /mnt/ale-
> build/tmp/musl/sysroots/itmk2/usr/include/arpa/inet.h:9:0,
> +|                  from ../../libnl-3.2.28/include/netlink-
> private/netlink.h:33,
> +|                  from ../../libnl-3.2.28/lib/route/link/bridge.c:20:
> +| /mnt/ale-build/tmp/musl/sysroots/itmk2/usr/include/netinet/in.h:23:8:
> note: originally defined here
> +
> +In order to fix this, use just the C library header <netinet/in.h>.


This doesn't look right, as this error shouldn't happen (and I don't see it
myself).
As per linux kernel commit cfd280c91253cc28e4919e349fa7a813b63e71e8,
sysroot/usr/include/linux/in6.h guards definition of struct in6_addr
with __UAPI_DEF_IN6_ADDR wich is set appropriately as per
sysroot/usr/include/linux/libc-compat.h. Same for all the other structs. You
can double check when compiling bridge.c manually using gcc's -E option.

Are you using a very old kernel or very old kernel headers? Older than 3.12?

Cheers,
Andre'

> +
> +Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
> +---
> + include/linux-private/linux/if_bridge.h | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/include/linux-private/linux/if_bridge.h b/include/linux-
> private/linux/if_bridge.h
> +index f24050b..8f7490c 100644
> +--- a/include/linux-private/linux/if_bridge.h
> ++++ b/include/linux-private/linux/if_bridge.h
> +@@ -15,7 +15,6 @@
> + 
> + #include <linux/types.h>
> + #include <linux/if_ether.h>
> +-#include <linux/in6.h>
> + 
> + #define SYSFS_BRIDGE_ATTR	"bridge"
> + #define SYSFS_BRIDGE_FDB	"brforward"
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-
> support/libnl/libnl_3.2.28.bb
> index 26982f3..f8f3e53 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
> @@ -15,6 +15,7 @@ SRC_URI = "https://github.com/thom311/${BPN}/releases/do
> wnload/${BPN}${@d.getVar
>             file://0001-lib-add-utility-function-nl_strerror_l.patch \
>             file://0002-lib-switch-to-using-strerror_l-instead-of-
> strerror_r.patch \
>             file://0003-src-switch-to-using-strerror_l-instead-of-
> strerror_r.patch \
> +           file://0001-Fix-build-with-musl.patch \
>  "
>  UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
>  
> -- 
> 1.9.1
> 

