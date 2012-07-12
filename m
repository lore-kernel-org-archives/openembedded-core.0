Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sp9wY-0002io-Cw
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 05:19:54 +0200
Received: by pbbrq2 with SMTP id rq2so2810068pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 20:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yKbkm6Wf/4B1rj6qmHH+SB6invyd4KWVy/0xNuwAV7I=;
	b=WTka8RsYRZNJJsJuZoI8owVCedZffUyQeNTg44TA7LKi3fQIGMcV4JsuI8res68FBf
	UzIWn4BcBqLmxX4kTIzTw5EAK7XrxfaYoWc6VAA1HUrSOU/k4ZAbqXFgflYPaNkyU5TZ
	KJNwqg7aqqetYVZ9r4v5wNd38K8h8z0Od3vHnB6fTtSbRL7rqjXRzxKw1nPmLS+pS81w
	l8p4zFa+3l7V1xByVuTPxwwuEFAqobB2Nef4uaDjnKnFjDx086K5ZF2KyIVfT6ezE4T1
	Ia0G6TspcZExmt22WPDtgIbaX84ZoYo9d2EFiPUjQ1CCDijnWseVVrjbHQDl/P2hNQbB
	U36A==
MIME-Version: 1.0
Received: by 10.68.190.97 with SMTP id gp1mr1503392pbc.76.1342062520857; Wed,
	11 Jul 2012 20:08:40 -0700 (PDT)
Received: by 10.68.230.69 with HTTP; Wed, 11 Jul 2012 20:08:40 -0700 (PDT)
In-Reply-To: <1341990302-30459-1-git-send-email-dennis.yxun@gmail.com>
References: <1341990302-30459-1-git-send-email-dennis.yxun@gmail.com>
Date: Thu, 12 Jul 2012 11:08:40 +0800
Message-ID: <CAF1ZMEfMmkx9q8H1-TY9h3-Bc=Ljxq=5SfHHjokEaKs-FC25Pw@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu/mips: adjust runqemu script to support mipsel machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 03:19:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 11, 2012 at 3:05 PM, Dennis Lan <dennis.yxun@gmail.com> wrote:
> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> ---
>  scripts/runqemu          |    5 ++++-
>  scripts/runqemu-internal |    9 +++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 8d149a2..650d1df 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -94,7 +94,7 @@ KVM_ENABLED="no"
>  while true; do
>      arg=${1}
>      case "$arg" in
> -        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumips64" | "qemush4"  | "qemuppc")
> +        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | "qemumips64" | "qemush4"  | "qemuppc")
>              [ -z "$MACHINE" ] && MACHINE=$arg || \
>                  error "conflicting MACHINE types [$MACHINE] and [$arg]"
>              ;;
> @@ -245,6 +245,9 @@ QEMUARM_DEFAULT_FSTYPE=ext3
>  QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
>  QEMUMIPS_DEFAULT_FSTYPE=ext3
>
> +QEMUMIPSEL_DEFAULT_KERNEL=vmlinux-qemumipsel.bin
> +QEMUMIPSEL_DEFAULT_FSTYPE=ext3
> +
>  QEMUMIPS64_DEFAULT_KERNEL=vmlinux-qemumips64.bin
>  QEMUMIPS64_DEFAULT_FSTYPE=ext3
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 041464d..bdf1a37 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -236,6 +236,7 @@ fi
>  case "$MACHINE" in
>      "qemuarm") ;;
>      "qemumips") ;;
> +    "qemumipsel") ;;
>      "qemumips64") ;;
>      "qemush4") ;;
>      "qemuppc") ;;
> @@ -375,12 +376,8 @@ if [ "$MACHINE" = "spitz" ]; then
>      fi
>  fi
>
> -if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumips64" ]; then
> -    if [ "$MACHINE" = "qemumips64" ]; then
> -       QEMU=qemu-system-mips64
> -    else
> -       QEMU=qemu-system-mips
> -    fi
> +if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemumips64" ]; then
> +    QEMU=${MACHINE/qemu/qemu-system-}
>      MACHINE_SUBTYPE=malta
>      QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
>      if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
> --
> 1.7.9.rc2
>

hi all:
  any comment? suggestion or rejection?

Dennis


