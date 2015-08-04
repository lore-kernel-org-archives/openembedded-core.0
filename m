Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5C7759C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 14:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t74Ev17x020879; Tue, 4 Aug 2015 15:57:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GRKmlnxUhVtC; Tue,  4 Aug 2015 15:57:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t74EuiCP020868
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 4 Aug 2015 15:56:58 +0100
Message-ID: <1438700203.30526.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Tue, 04 Aug 2015 09:56:43 -0500
In-Reply-To: <1438699939-9055-1-git-send-email-gary@mlbassoc.com>
References: <1438699939-9055-1-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3: Fix nativesdk build
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
X-List-Received-Date: Tue, 04 Aug 2015 14:57:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-04 at 08:52 -0600, Gary Thomas wrote:
> The nativesdk package is built without Py_DEBUG which causes some
> compile errors.  This patch fixes those errors allowing the nativesdk
> package to build.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  .../python/python3/fix-nativesdk-build.patch       | 28 ++++++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.4.3.bb      |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/fix-nativesdk-build.patch
> 
> diff --git a/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch b/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch

No description of the patch or Upstream-Status. I'm surprised python
would have this issue. Do they not recommend building in this
configuration or not support/test it?

I'm just worried what other issues we might run into as a result of
this.

Cheers,

Richard

> new file mode 100644
> index 0000000..d0cba39
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch
> @@ -0,0 +1,28 @@
> +Index: Python-3.4.3/Objects/unicodeobject.c
> +===================================================================
> +--- Python-3.4.3.orig/Objects/unicodeobject.c
> ++++ Python-3.4.3/Objects/unicodeobject.c
> +@@ -418,6 +418,9 @@ _PyUnicode_CheckConsistency(PyObject *op
> +     }
> +     return 1;
> + }
> ++#else
> ++int
> ++_PyUnicode_CheckConsistency(PyObject *op, int check_content) { return 1; }
> + #endif
> + 
> + static PyObject*
> +Index: Python-3.4.3/Objects/obmalloc.c
> +===================================================================
> +--- Python-3.4.3.orig/Objects/obmalloc.c
> ++++ Python-3.4.3/Objects/obmalloc.c
> +@@ -2141,7 +2141,9 @@ _PyObject_DebugMallocStats(FILE *out)
> + 
> +             if (p->ref.count == 0) {
> +                 /* currently unused */
> ++#ifdef Py_DEBUG
> +                 assert(pool_is_in_list(p, arenas[i].freepools));
> ++#endif
> +                 continue;
> +             }
> +             ++numpools[sz];
> diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
> index 6c2e21d..582f6b0 100644
> --- a/meta/recipes-devtools/python/python3_3.4.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.4.3.bb
> @@ -38,6 +38,7 @@ SRC_URI += "\
>              file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
>              file://setup.py-find-libraries-in-staging-dirs.patch \
>             "
> +SRC_URI_append_class-nativesdk = "file://fix-nativesdk-build.patch"
>  SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
>  SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
>  
> -- 
> 1.9.1
> 



