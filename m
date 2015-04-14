Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id C919473912
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 19:37:32 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so48168307igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 12:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=r4lzWQhsXJBfOGdIpd5i1NCqGaqS6KMqiK1sdesKJUo=;
	b=WfAAtO84sIb731bdPGuXdNkWJvutamkV2rnTVh4mWUdlzYVvmqvyM5UMsfXqLzwbwq
	hu5rUZh+rISlxa4aR4+YVJdfvuLPxW+eTDfxZArIbfW+r233lwqw8fOG2VBw+5J9k17F
	YCd99tZUWcZotIb1TQBxZTEN1DQVuBUq4RWBnotFGe6hnPbblh3roWOUxRYwe1IiBc7e
	JzzIKCfeY2wp+wX4wICop5Ow8rHVgELie9E/pVI1kbznS3tTc2CO3+kfqP0UjVKX8AFd
	UKJSzDWaGaFKUFzgXO6FIiUC/MBF9ud2wnYJmN6K5uzrSk7tbGc/M+Z3nkHqs0rVA6Ps
	V8Zw==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr31570342ioi.1.1429040254034;
	Tue, 14 Apr 2015 12:37:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Tue, 14 Apr 2015 12:37:33 -0700 (PDT)
In-Reply-To: <20150414192049.GA22629@windriver.com>
References: <20150414192049.GA22629@windriver.com>
Date: Tue, 14 Apr 2015 16:37:33 -0300
X-Google-Sender-Auth: gGS0rj-xpERx3QUWLTPNJlhGiYY
Message-ID: <CAP9ODKp5n9PG-z-6Z1SPUErzew_fOQQhBioHFYs+YJXQPhXvGw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Amy Fong <amy.fong@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-java] [PATCH] icedtea7-native fails on hosts without /usr/include/X11/extensions
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
X-List-Received-Date: Tue, 14 Apr 2015 19:37:36 -0000
Content-Type: text/plain; charset=UTF-8

Hello Amy,

On Tue, Apr 14, 2015 at 4:20 PM, Amy Fong <amy.fong@windriver.com> wrote:
> From 4789a5dc622cc8537df28596a4beb66db4ba4774 Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Tue, 14 Apr 2015 13:10:22 -0400
> Subject: [PATCH] icedtea7-native compile failure undefined reference to `main'
>
> On hosts without /usr/include/X11/extensions, icedtea7-native compile
> results in a build failure while trying to create an object file:
>
> +/data/home/.../git/csu/../sysdeps/x86_64/start.S:118: undefined reference to `main'
> [2015-03-31 15:22:53.115930161+00:00] | collect2: error: ld returned 1 exit status
>
> The compile line shows: (-c gets eaten)
> ... -I -c -o
>
> The makefile tries to do the following which results in a faulty build
> line if /usr/include/X11/extensions doesn't exist:
>
>    CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
>                          $(wildcard /usr/include/X11/extensions))
>
> This looks like a missed line from the following patch which removes the need for X11/extensions:
>   icedtea-ecj-disable-compilation.patch
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>

The right mailing list for this is openembedded-devel, as described in
the README.

> ---
>  recipes-core/icedtea/icedtea7-native.inc           |  2 ++
>  .../openjdk-7-03b147/headless_x11_cleanup.patch    | 35 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 recipes-core/icedtea/openjdk-7-03b147/headless_x11_cleanup.patch
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index 81e9b66..f555d70 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -30,6 +30,7 @@ SRC_URI = " \
>
>  SRC_URI += "file://icedtea-unzip.patch"
>  SRC_URI += "file://icedtea-unzip-phase2.patch;apply=no"
> +SRC_URI += "file://headless_x11_cleanup.patch;apply=no"
>
>  S = "${WORKDIR}/${ICEDTEA}"
>  B = "${S}/build"
> @@ -149,6 +150,7 @@ do_configure_append() {
>         oe_runmake patch-boot
>
>         cd ${S} && cat ${WORKDIR}/icedtea-unzip-phase2.patch | patch -p1
> +       cd ${S} && cat ${WORKDIR}/headless_x11_cleanup.patch | patch -p1
>  }

This should be done if X11 is not available.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

