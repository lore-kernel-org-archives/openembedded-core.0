Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5568C7949C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 03:26:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w863QWjL016327
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 20:26:32 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 5 Sep 2018 20:26:31 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1535336250-197198-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <8afa8e3d-b5b0-5d5b-88a6-7594fe7ecaf6@windriver.com>
Date: Thu, 6 Sep 2018 11:26:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1535336250-197198-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] libice: patch for CVE-2017-2626
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
X-List-Received-Date: Thu, 06 Sep 2018 03:26:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping


On 08/27/2018 10:17 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../xorg-lib/libice/CVE-2017-2626.patch            | 149 +++++++++++++++++++++
>   meta/recipes-graphics/xorg-lib/libice_1.0.9.bb     |   2 +
>   2 files changed, 151 insertions(+)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch b/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
> new file mode 100644
> index 0000000..20c6dda
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
> @@ -0,0 +1,149 @@
> +From ff5e59f32255913bb1cdf51441b98c9107ae165b Mon Sep 17 00:00:00 2001
> +From: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> +Date: Tue, 4 Apr 2017 19:12:53 +0200
> +Subject: Use getentropy() if arc4random_buf() is not available
> +
> +This allows to fix CVE-2017-2626 on Linux platforms without pulling in
> +libbsd.
> +The libc getentropy() is available since glibc 2.25 but also on OpenBSD.
> +For Linux, we need at least a v3.17 kernel. If the recommended
> +arc4random_buf() function is not available, emulate it by first trying
> +to use getentropy() on a supported glibc and kernel. If the call fails,
> +fall back to the current (partly vulnerable) code.
> +
> +Signed-off-by: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> +Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
> +Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +
> +Upstream-Status: Backport[https://cgit.freedesktop.org/xorg/lib/libICE
> +                 /commit/?id=ff5e59f32255913bb1cdf51441b98c9107ae165b]
> +
> +CVE: CVE-2017-2626
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + configure.ac  |  2 +-
> + src/iceauth.c | 65 ++++++++++++++++++++++++++++++++++++++++++-----------------
> + 2 files changed, 47 insertions(+), 20 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 458882a..c971ab6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -38,7 +38,7 @@ AC_DEFINE(ICE_t, 1, [Xtrans transport type])
> +
> + # Checks for library functions.
> + AC_CHECK_LIB([bsd], [arc4random_buf])
> +-AC_CHECK_FUNCS([asprintf arc4random_buf])
> ++AC_CHECK_FUNCS([asprintf arc4random_buf getentropy])
> +
> + # Allow checking code with lint, sparse, etc.
> + XORG_WITH_LINT
> +diff --git a/src/iceauth.c b/src/iceauth.c
> +index ed31683..de4785b 100644
> +--- a/src/iceauth.c
> ++++ b/src/iceauth.c
> +@@ -44,31 +44,19 @@ Author: Ralph Mor, X Consortium
> +
> + static int was_called_state;
> +
> +-/*
> +- * MIT-MAGIC-COOKIE-1 is a sample authentication method implemented by
> +- * the SI.  It is not part of standard ICElib.
> +- */
> ++#ifndef HAVE_ARC4RANDOM_BUF
> +
> +-
> +-char *
> +-IceGenerateMagicCookie (
> ++static void
> ++emulate_getrandom_buf (
> ++	char *auth,
> + 	int len
> + )
> + {
> +-    char    *auth;
> +-#ifndef HAVE_ARC4RANDOM_BUF
> +     long    ldata[2];
> +     int	    seed;
> +     int	    value;
> +     int	    i;
> +-#endif
> +
> +-    if ((auth = malloc (len + 1)) == NULL)
> +-	return (NULL);
> +-
> +-#ifdef HAVE_ARC4RANDOM_BUF
> +-    arc4random_buf(auth, len);
> +-#else
> + #ifdef ITIMER_REAL
> +     {
> + 	struct timeval  now;
> +@@ -76,13 +64,13 @@ IceGenerateMagicCookie (
> + 	ldata[0] = now.tv_sec;
> + 	ldata[1] = now.tv_usec;
> +     }
> +-#else
> ++#else /* ITIMER_REAL */
> +     {
> + 	long    time ();
> + 	ldata[0] = time ((long *) 0);
> + 	ldata[1] = getpid ();
> +     }
> +-#endif
> ++#endif /* ITIMER_REAL */
> +     seed = (ldata[0]) + (ldata[1] << 16);
> +     srand (seed);
> +     for (i = 0; i < len; i++)
> +@@ -90,7 +78,46 @@ IceGenerateMagicCookie (
> + 	value = rand ();
> + 	auth[i] = value & 0xff;
> +     }
> +-#endif
> ++}
> ++
> ++static void
> ++arc4random_buf (
> ++	char *auth,
> ++	int len
> ++)
> ++{
> ++    int	    ret;
> ++
> ++#if HAVE_GETENTROPY
> ++    /* weak emulation of arc4random through the entropy libc */
> ++    ret = getentropy (auth, len);
> ++    if (ret == 0)
> ++	return;
> ++#endif /* HAVE_GETENTROPY */
> ++
> ++    emulate_getrandom_buf (auth, len);
> ++}
> ++
> ++#endif /* !defined(HAVE_ARC4RANDOM_BUF) */
> ++
> ++/*
> ++ * MIT-MAGIC-COOKIE-1 is a sample authentication method implemented by
> ++ * the SI.  It is not part of standard ICElib.
> ++ */
> ++
> ++
> ++char *
> ++IceGenerateMagicCookie (
> ++	int len
> ++)
> ++{
> ++    char    *auth;
> ++
> ++    if ((auth = malloc (len + 1)) == NULL)
> ++	return (NULL);
> ++
> ++    arc4random_buf (auth, len);
> ++
> +     auth[len] = '\0';
> +     return (auth);
> + }
> +--
> +cgit v1.1
> +
> diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
> index 0337d21..999434e 100644
> --- a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
> +++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
> @@ -23,6 +23,8 @@ BBCLASSEXTEND = "native"
>   SRC_URI[md5sum] = "addfb1e897ca8079531669c7c7711726"
>   SRC_URI[sha256sum] = "8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202"
>   
> +SRC_URI += "file://CVE-2017-2626.patch"
> +
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>   PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


