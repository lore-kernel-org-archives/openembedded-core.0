Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8510E61109
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 22:34:17 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id a6so5390354ilc.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 14:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GEFXcr+xrNcdhCC2wf51StAWlfJe5XbwEwrAr8ciiBQ=;
	b=k133hD/40ey6+6IWNE0cVMKydfFyif8V66s/asSuysdtD5J2rjKxdEv4awahKa9flq
	fOBsJa9J98AtLeP0dn8TV+E9ZcWxTroQ0d/eCPK5MsSKfC8JvSln+boghPQAZr8bNOSD
	591dnDcUfuOIQapqzaR1FFmBui7PryLLnNi3EEcxRz8VXsOVTdxdcbS83x9ZhDizqniC
	rl+YHVXE+vl6HNn/zh16uNkl/3jPOCdOl5EFVzeTFvYjm+7ELqnc8WAGkm1sHbpO8uQt
	MTBR+uru9ni0Y9V2Ui82/sx8dLqw6vogvxRathojVWzSm3V2Onq/Bs7hci8Z40wLJGPR
	Yx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GEFXcr+xrNcdhCC2wf51StAWlfJe5XbwEwrAr8ciiBQ=;
	b=DdQj1cQM0BNB66u3fVNzEPx7BOuKwxltO7n+/UKa/ovJWM3g/mPhejcZEMFDDANTiM
	A35t8l1uwl7ERrTyNSeOxTlgp/Nzzot1rBTgGTUVhfyphYLPjkwkWXA8flRtWAppdyQo
	F0V0E/WxKYW2xDvdcT211KgIfaBVqNAYk3g9sqtrIenjwSCKFBl+icjPswHD0C6aaUs7
	gDiTjAkzudVGqlii5J6i4p/vvXCsem5wIqhNQ2xSlh6guIHRAY8a2ovOis7oHPgAqFKj
	jNF176Nx103sruO7EkZ2h9KJuUGGvtsGtpex96b/Cdv9Flc47NaeYc/OnaB58qtptVkc
	mCzg==
X-Gm-Message-State: ANhLgQ153qNMXndbTerEEdZz2qb8kAMdqL469Z+fc4bi8i1kdEQGHQEK
	xTyub6HD4OFqyd8Vuh/nhDo5ZV0lI6a2T4q7WZo=
X-Google-Smtp-Source: ADFU+vuzrrLXJc0X3ZB6Uip+3SWl5Ab7MANEw0SICKIbTpZUl9BXEmO3jJ652BesOUgMaQ1zY6I2U9kFwa23nKr/4Nw=
X-Received: by 2002:a92:8f44:: with SMTP id j65mr9262523ild.144.1583620458104; 
	Sat, 07 Mar 2020 14:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20200307200330.23915-1-christopher.w.clark@gmail.com>
In-Reply-To: <20200307200330.23915-1-christopher.w.clark@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 7 Mar 2020 22:34:07 +0000
Message-ID: <CAO5Uq5RJg=Drr1GfjywP_EUY7Z6W_ouwoaRTcUc_EBETWVy-Tw@mail.gmail.com>
To: christopher.w.clark@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: fix SOURCE_DATE_EPOCH for non-git kernel builds
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
X-List-Received-Date: Sat, 07 Mar 2020 22:34:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 7, 2020 at 8:04 PM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Only use git to set SOURCE_DATE_EPOCH if ${S} is the top level of a git
> repository.
>
> Fixes the following errors with the prior logic when building a kernel
> that is not obtained from a git repository:
>
> 1. With TMPDIR set to a directory outside any git repository on a
> mounted filesystem, reproducible builds fail in do_compile with this git
> error:
>
>   fatal: not a git repository (or any parent up to mount point <abspath>)
>   Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
>
> aborting before the error handling logic.
>
> 2. With TMPDIR located within a subdirectory of a git repository, the
> SOURCE_DATE_EPOCH timestamp would be that of said repository rather than
> that of the kernel.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 0eadd3efb8..2603f24709 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -296,10 +296,14 @@ kernel_do_compile() {
>                 if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
>                         olddir=`pwd`
>                         cd ${S}
> -                       SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
> -                       # git repo not guaranteed, so fall back to REPRODUCIBLE_TIMESTAMP_ROOTFS
> -                       if [ $? -ne 0 ]; then
> -                               SOURCE_DATE_EPOCH=${REPRODUCIBLE_TIMESTAMP_ROOTFS}
> +                       # This kernel dir is not necessarily a git repo and we
> +                       # must ensure that git does not incorrectly query a
> +                       # repository in a parent directory.
> +                       GIT_TOP=`git rev-parse --show-toplevel 2>/dev/null || echo ""`
> +                       if [ "${S}" = "${GIT_TOP}" ]; then

Will that work if ${S} isn't a canonical path?

> +                               SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
> +                       else
> +                               SOURCE_DATE_EPOCH="${REPRODUCIBLE_TIMESTAMP_ROOTFS}"
>                         fi
>                         cd $olddir
>                 fi

Would something like this resolve the problem (untested):

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0eadd3efb8d9..a17ca7adccca 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -294,14 +294,11 @@ kernel_do_compile() {
                # kernel sources do not use do_unpack, so
SOURCE_DATE_EPOCH may not
                # be set....
                if [ "${SOURCE_DATE_EPOCH}" = "" -o
"${SOURCE_DATE_EPOCH}" = "0" ]; then
-                       olddir=`pwd`
-                       cd ${S}
-                       SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
+                       SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git}"
log  -1 --pretty=%ct`
                        # git repo not guaranteed, so fall back to
REPRODUCIBLE_TIMESTAMP_ROOTFS
                        if [ $? -ne 0 ]; then

SOURCE_DATE_EPOCH=${REPRODUCIBLE_TIMESTAMP_ROOTFS}
                        fi
-                       cd $olddir
                fi

                ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`

--
Alex Kiernan

