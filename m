Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.41916.1591030276241808101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 09:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dIG52pfd;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id q8so9671902qkm.12
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mpedwQf9tPIuI/xPnOhYdfJf+AblWI9IFFkP5ecYOQ0=;
        b=dIG52pfdK4eOamqOjSwqPvFTBzvS3OdftTgHLrZiDKYBGq8FV37/YfcewrU07lY8Xx
         jbs7Tsyip7GTNkpJ5FBf+W8Q/M3Wpb6Y6AVLp7eB6CVZRUyOqDYwWbTEQAnwtaH+srJr
         sBJEBkROUA967Rc54FzTqmhg2J8+EFWIMb0lefxkBHJ6Or227DMABincO6rjwvXDN442
         NzAuKqNAEZ5G0NHlDLaUWayKRDCVDgdjZZSlz9WI9UDUQuzTWL8PM12mUlffrRX3dJLu
         Ee+ogLhF2ZcoOzeE1d4ZRvIdtWzmqInq8rCyxavSuvrQQV2fiuMTiTohwMOR6kl4aTIa
         fxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mpedwQf9tPIuI/xPnOhYdfJf+AblWI9IFFkP5ecYOQ0=;
        b=NiAevEy8XSbjT7uPh1t5rNZYr8sLSaGPH1dUdmndjFa6bIwnT8hBG8noVKifGgUKwJ
         5ISKknDC/FSEG5bf3TVa5wrZvYbmYK8i0w024pj64ywsexV5s9Hl7TqNZ7HTNOrTuCeq
         CdTieQWbWU1srwi1VqmQugZSUzpWilkCjUhSyEj2zVWVkaKVhX/f9rrib+NjitjzAGfq
         lxKB5iN+XcS86w+hE0UN7r5CIK0SFddxzufOXvT6LKdd1gmcpRgckDgpftClRVTC8gu6
         MZg6bfqTc0Y+87wMezpLt5BcDybb/R4OVd8Q7UNYJ61Zt5ZNGPj9RKfGCS1XcqngXa0/
         oOPg==
X-Gm-Message-State: AOAM532sBMt4boabhVeYNCW3SH4NdF3jPlkHABXi+yL08xOT4UNMbR5C
	mpvjvWhdUe6lLncw+ooQgu0dOi55LKqAwhvljks=
X-Google-Smtp-Source: ABdhPJytzhhIF8fHOcW+fGaf/3r/9uw0DKmJEe9dJlthprQP6uVHFtNu3TZwRnBe7jhxVRSa6uy4azmQvAtd3e0+40Y=
X-Received: by 2002:a37:4c97:: with SMTP id z145mr20914380qka.165.1591030275064;
 Mon, 01 Jun 2020 09:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com> <20200531155254.10283-45-alex.kanavin@gmail.com>
In-Reply-To: <20200531155254.10283-45-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 09:50:49 -0700
Message-ID: <CAMKF1soxBMZZ92i6fmS_KqSdrR19QqWWrJesZYoZuT2NROKcFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 45/70] libunwind: upgrade 1.3.1 -> 1.4.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Fails to build on musl

https://errors.yoctoproject.org/Errors/Details/414866/

On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../libunwind/musl-header-conflict.patch      | 27 ++++++++++++-------
>  ...{libunwind_1.3.1.bb => libunwind_1.4.0.bb} |  4 +--
>  2 files changed, 19 insertions(+), 12 deletions(-)
>  rename meta/recipes-support/libunwind/{libunwind_1.3.1.bb => libunwind_1.4.0.bb} (87%)
>
> diff --git a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> index 79f63fd84e..63b78a8a30 100644
> --- a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> +++ b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> @@ -1,4 +1,7 @@
> -If you:
> +From 49b21f0fe5fb93b30b94cc449429fd33de0652a7 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Thu, 18 Aug 2016 14:46:32 +0100
> +Subject: [PATCH] If you:
>
>  TCLIBC=musl bitbake unwind
>  TCLIBC=musl bitbake gcc-runtime -c cleansstate
> @@ -6,12 +9,12 @@ TCLIBC=musl bitbake gcc-runtime
>
>  you will see libstdc++ fail to build due to finding libunwind's header file.
>
> -Khem: "When we build any of gcc components they expect to use internal version
> -and that works with glibc based gcc since the search headers first look into gcc
> -headers, however with musl the gcc headers are searched after the standard
> +Khem: "When we build any of gcc components they expect to use internal version
> +and that works with glibc based gcc since the search headers first look into gcc
> +headers, however with musl the gcc headers are searched after the standard
>  headers ( which is by design the right thing )."
>
> -This patch hacks around the issue by looking for a define used during gcc-runtime's
> +This patch hacks around the issue by looking for a define used during gcc-runtime's
>  build and skipping to the internal header in that case.
>
>  [YOCTO #10129]
> @@ -20,11 +23,15 @@ RP 2016/8/18
>
>  Upstream-Status: Inappropriate [really need to fix gcc]
>
> -Index: git/include/unwind.h
> -===================================================================
> ---- git.orig/include/unwind.h
> -+++ git/include/unwind.h
> -@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER L
> +---
> + include/unwind.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/include/unwind.h b/include/unwind.h
> +index 7cf128d..31c2871 100644
> +--- a/include/unwind.h
> ++++ b/include/unwind.h
> +@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
>   OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
>   WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
>
> diff --git a/meta/recipes-support/libunwind/libunwind_1.3.1.bb b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
> similarity index 87%
> rename from meta/recipes-support/libunwind/libunwind_1.3.1.bb
> rename to meta/recipes-support/libunwind/libunwind_1.4.0.bb
> index 037e04c3c0..f50205f1b9 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.3.1.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
> @@ -10,8 +10,8 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
>             "
>  SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
>
> -SRC_URI[md5sum] = "a04f69d66d8e16f8bf3ab72a69112cd6"
> -SRC_URI[sha256sum] = "43997a3939b6ccdf2f669b50fdb8a4d3205374728c2923ddc2354c65260214f8"
> +SRC_URI[md5sum] = "5114504c74ac3992ac06aa551cd55678"
> +SRC_URI[sha256sum] = "df59c931bd4d7ebfd83ee481c943edf015138089b8e50abed8d9c57ba9338435"
>
>  EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests --enable-static"
>
> --
> 2.26.2
>
> 
