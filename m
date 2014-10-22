Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 65B8260097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:59:55 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id q107so2170507qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=nd/Y3I0d0dljUnQr8asyAiNrW29LXOwiynYsBMjzVoo=;
	b=HHtgEgJlSOZvUBstqZy7fTgsPLmoXQ/kvoZvGrJr6Bgofg5VH0k9FD7XoivNdefS7N
	kgSYxA4La6MmI2wWzSypbehQK1oabL8aPyIQHlH67dFdgtJ+R09j9a8yJwdNE3xej4Yb
	dvjkHoFj8FU4Rv8ZkIESqVM8DR+nTDF1SqlRmC8l1bqWGYaiWiCGVBhfvJJv4rFTVBkF
	rQBktnDgk3KsQ5h9r5auw7wJZaxqvs/XuUBT9oqM52ZACoDrdyVZ5M+fp04irBlM6mGT
	Wog/qAXuuBV07FauguOO4SEdHa3WzDbD9lonk+FR9TrI6X5PNRVMUkZVfpixBO6d9Xtm
	o3/w==
X-Received: by 10.224.61.7 with SMTP id r7mr54560922qah.9.1413968395978; Wed,
	22 Oct 2014 01:59:55 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Wed, 22 Oct 2014 01:59:15 -0700 (PDT)
In-Reply-To: <54476E36.1090201@windriver.com>
References: <54476E36.1090201@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 22 Oct 2014 09:59:15 +0100
X-Google-Sender-Auth: bH6VW5TdN99HScPFRBkBLgrqXrk
Message-ID: <CANyK_8c4kL8JmEfuH22qzrZrwAsm6tVEmMzwX3_jY9J=G_xajw@mail.gmail.com>
To: Liu Jian <jian.liu@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] opkg: update-alternatives fails for "[" and "[[" in busybox
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
X-List-Received-Date: Wed, 22 Oct 2014 08:59:57 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 09:43, Liu Jian <jian.liu@windriver.com> wrote:
> Building a small filesystem with busybox gives the following error lines:
> (see log.do_rootfs under bitbake_build/tmp/work/)
> sed: -e expression #1, char 41: unterminated address regex
> sed: -e expression #1, char 42: unterminated address regex
> This is caused by the script
> bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/update-alternatives.
> "[" can not be used directly in sed expression.
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
> ...andle-leftbracket-for-update-alternatives.patch | 23
> ++++++++++++++++++++++
> meta/recipes-devtools/opkg/opkg_0.2.2.bb | 1 +
> 2 files changed, 24 insertions(+)
> create mode 100644
> meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch
>
> diff --git
> a/meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch
> b/meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch
> new file mode 100644
> index 0000000..7c9eac7
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch
> @@ -0,0 +1,23 @@
> +diff -Nur trunk.orig/utils/update-alternatives.in
> trunk/utils/update-alternatives.in
> +--- trunk.orig/utils/update-alternatives.in 2013-08-16
> 04:22:29.000000000 +0800
> ++++ trunk/utils/update-alternatives.in 2014-09-19 10:55:22.238159317 +0800
> +@@ -68,6 +68,10 @@
> + sed -e 's/\//\\\//g'
> + }
> +
> ++protect_special_character() {
> ++ sed -e 's/\[/\\\[/g'
> ++}
> ++
> + remove_alt() {
> + [ $# -lt 2 ] && return 1
> + local name="$1"
> +@@ -75,7 +79,7 @@
> +
> + [ ! -f $ad/$name ] && return 0
> +
> +- path=`echo $path | protect_slashes`
> ++ path=`echo $path | protect_slashes | protect_special_character`
> + sed -ne "/^$path\>.*/!p" $ad/$name > $ad/$name.new
> + mv $ad/$name.new $ad/$name
> + }
> diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> index 867ff7a..9d09194 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> @@ -5,6 +5,7 @@ SRC_URI =
> "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
> file://add-exclude.patch \
> file://opkg-configure.service \
> file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
> + file://handle-leftbracket-for-update-alternatives.patch \
> "
>
> S = "${WORKDIR}/${BPN}-${PV}"
> --
> 1.8.5.2.233.g932f7e4
>
> --
> Jian Liu
> Email: jian.liu@windriver.com
> Office Phone: 86-10-84778539
>

update-alternatives is now provided by the opkg-utils recipe, not
opkg. opkg-utils is part of the Yocto Project so we maintain upstream
as well. Could you take a look at the contribution guidelines for
opkg-utils (http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/tree/CONTRIBUTING)
and submit the patch against that? We can then just bump the SRCREV
which is used within OpenEmbedded, rather than maintaining an isolated
patch.

This should hopefully be fairly straightforward to do, the patch you
have should apply cleanly to update-alternatives (there is no
'update-alternatives.in' anymore) and then just commit and send to the
appropriate email addresses. If there's any issues let me know.

When opkg v0.3.0 is released, it will no longer contain the
update-alternatives script so hopefully that will make things less
confusing.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

