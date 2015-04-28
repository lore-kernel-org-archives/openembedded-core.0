Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 97E5572A85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 14:34:12 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so91118153igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rI4tv6Y4JFJso6uFQcKW8aDIhy53jPGp54k/jmod22I=;
	b=rfe6QZ2ybbexiuRFzfR6P5ixI00gFIOWDQxr17o/Qc3D2tWSYEOhWD+7uEAbpGUWa+
	G8zHsPk6u2RKOAEDwBmv6Lkgoh5OZqCQQYfZkj2AzACxNyq/bNGfAQKgjVzGIwMEAz6L
	NFnnEvztukz1moiiM1Sw03jDfOHtuHbwHOIjYSNL5x79a0Z1kUrfMqHVmLj7nwn1Bbnv
	2i7bGvYi7Bb6mXtSnqkSgzinGsUwzpQGO1pKGnVEYNsGW3mXYblDWzvtjidhyeN/osOc
	R5fInXqetXMf1SGmg48DTfuQOcJUzNZT04dWHqihdtdIf/fGDGg6MYrkuowlhK4Wbqdl
	2tYg==
X-Received: by 10.50.129.99 with SMTP id nv3mr925009igb.30.1430231647448; Tue,
	28 Apr 2015 07:34:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 07:33:37 -0700 (PDT)
In-Reply-To: <1430218691-6679-1-git-send-email-ross.burton@intel.com>
References: <1430218691-6679-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Apr 2015 07:33:37 -0700
Message-ID: <CAMKF1spa7T5vg9xSsN5tBxj-VZP7=y8pF9sVKoJY8qUMibtcFA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: use GCC 5 patch from upstream
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
X-List-Received-Date: Tue, 28 Apr 2015 14:34:15 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 28, 2015 at 3:58 AM, Ross Burton <ross.burton@intel.com> wrote:
> Upstream has already fixed the GCC 5 problem, so use the patch from upstream.
>

looks good. You need to remove the CPPFLAGS change from recipe now
with this patch

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch | 76 +++++++++++-----------
>  1 file changed, 37 insertions(+), 39 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
> index 215c044..9c9f595 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
> @@ -1,50 +1,48 @@
> -Upstream-Status: Pending
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> -From 612eb45a2e7a0b35cc3790870e6d0cc42eb50c74 Mon Sep 17 00:00:00 2001
> -From: Hans de Goede <hdegoede@redhat.com>
> -Date: Wed, 11 Feb 2015 16:26:40 +0100
> -Subject: [PATCH] sdksyms.sh: Make sdksyms.sh work with gcc5.
> +From 21b896939c5bb242f3aacc37baf12379e43254b6 Mon Sep 17 00:00:00 2001
> +From: Egbert Eich <eich@freedesktop.org>
> +Date: Tue, 3 Mar 2015 16:27:05 +0100
> +Subject: symbols: Fix sdksyms.sh to cope with gcc5
>
> -gcc5's cpp inserts patterns like this:
> +Gcc5 adds additional lines stating line numbers before and
> +after __attribute__() which need to be skipped.
>
> -extern
> -      __attribute__((visibility("default")))
> -                int WaitForSomething(int *
> -    );
> +Signed-off-by: Egbert Eich <eich@freedesktop.org>
> +Tested-by: Daniel Stone <daniels@collabora.com>
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
>
> -This patch make sdksyms.sh work with this. Note my awk skills are weak, so
> -there likely is a better way to deal with this.
> -
> -Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ----
> - hw/xfree86/sdksyms.sh | 17 +++++++++++++++++
> - 1 file changed, 17 insertions(+)
> -
> -Index: xorg-server-1.16.3/hw/xfree86/sdksyms.sh
> -===================================================================
> ---- xorg-server-1.16.3.orig/hw/xfree86/sdksyms.sh
> -+++ xorg-server-1.16.3/hw/xfree86/sdksyms.sh
> -@@ -353,6 +353,23 @@ BEGIN {
> +diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
> +index 2305073..05ac410 100755
> +--- a/hw/xfree86/sdksyms.sh
> ++++ b/hw/xfree86/sdksyms.sh
> +@@ -350,13 +350,25 @@ BEGIN {
>       if (sdk) {
>         n = 3;
>
> -+      # detect the following gcc5 cpp pattern and skip it:
> -+      # extern
> -+      # # 320 "../../include/os.h" 3 4
> -+      #     __attribute__((visibility("default")))
> -+      # # 320 "../../include/os.h"
> -+      # Note in this case the "extern " or "extern void " always has
> -+      # a trailing space
> -+      if ($0 ~ "^extern.* $") {
> -+          getline;
> -+          getline;
> -+          getline;
> -+          getline;
> -+          n = 1;
> -+          while ($n == " ")
> -+              n++;
> -+      }
> ++        # skip line numbers GCC 5 adds before __attribute__
> ++        while ($n == "" || $0 ~ /^# [0-9]+ "/) {
> ++           getline;
> ++           n = 1;
> ++        }
>  +
>         # skip attribute, if any
>         while ($n ~ /^(__attribute__|__global)/ ||
>             # skip modifiers, if any
> +           $n ~ /^\*?(unsigned|const|volatile|struct|_X_EXPORT)$/ ||
> +           # skip pointer
> +-          $n ~ /^[a-zA-Z0-9_]*\*$/)
> ++          $n ~ /^[a-zA-Z0-9_]*\*$/) {
> +           n++;
> ++            # skip line numbers GCC 5 adds after __attribute__
> ++            while ($n == "" || $0 ~ /^# [0-9]+ "/) {
> ++               getline;
> ++               n = 1;
> ++            }
> ++        }
> +
> +       # type specifier may not be set, as in
> +       #   extern _X_EXPORT unsigned name(...)
> +--
> +cgit v0.10.2
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

