Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SU7Uc-0000lm-7e
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 04:28:06 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga02.intel.com with ESMTP/TLS/RC4-MD5; 14 May 2012 19:18:05 -0700
Received: by pbbro8 with SMTP id ro8so15444459pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 19:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=8ATVsg3nsNJ3hRMtWoOGGxFLWZ7bPrSuULVnL9ODvHU=;
	b=UBWLSM+1t2mAAsyUjq8xS2b942hJbBtTYJQhgAFVECP7CiR8oL5EbJQQu7TnLW1Wry
	m7xmOoN7Z2k7no+PNFL26Rjy3JVG8GCSzQQnZxcBMpYd6mDL6SvQQxmtnvra8wfRvNPL
	QaIbe1bhiQpch8RHipbvORiMXUM+BjI20JRrj3ZlFk1zV/ukvvWU0quT08UCiKFw+d52
	GieVI0KVh6xGorrpFpB5fw543jTEiKdKLNxJlPVJPUV5KPa/JZldetfIrfv9pvWe7LiO
	v+SilEs8QRfGIGsHq/E4UsQ4PYo20+KnOVcdfAIu439Yon26etjQ2BCGK3gAsBly8YYm
	aZiw==
Received: by 10.68.233.102 with SMTP id tv6mr344061pbc.153.1337048284941;
	Mon, 14 May 2012 19:18:04 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id s7sm225064pbl.31.2012.05.14.19.18.03
	(version=SSLv3 cipher=OTHER); Mon, 14 May 2012 19:18:03 -0700 (PDT)
Message-ID: <4FB1BCDC.7010105@intel.com>
Date: Mon, 14 May 2012 19:18:04 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1337035611.git.peter.seebach@windriver.com>
	<48e888dd2f3cebd256476a7ddd90f2d1a88ad788.1337035611.git.peter.seebach@windriver.com>
In-Reply-To: <48e888dd2f3cebd256476a7ddd90f2d1a88ad788.1337035611.git.peter.seebach@windriver.com>
X-Gm-Message-State: ALoCoQmY/mAt2PsL/hfhCSiB67KJo8qxHi5I4X1c9WvKaCnlKsacAjpM6Ydf4hqPmhoNSA68JIK1
Subject: Re: [PATCH 1/1] runqemu: replace bashism with working shell idiom
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
X-List-Received-Date: Tue, 15 May 2012 02:28:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2012 03:49 PM, Peter Seebach wrote:
> The =~ operator is not one of my favorites, not just due to portability
> issues, but because it's not well known, and a lot of people might
> not expect a regex operator.
>
> The canonical shell idiom for this is to use case with alternation
> and wildcards.  As a side note, if you are matching anything containing
> core-image-sato, you don't need to also check for core-image-sato-sdk.
>
> Signed-off-by: Peter Seebach<peter.seebach@windriver.com>

Thank you, Peter.

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   scripts/runqemu |   13 +++++++------
>   1 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 305e46a..fc7363f 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -300,14 +300,15 @@ findimage() {
>       # recently created one is the one we most likely want to boot.
>       filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
>       for name in $filenames; do
> -        if [ "$name" =~ core-image-sato-sdk -o \
> -              "$name" =~ core-image-sato     -o \
> -              "$name" =~ core-image-lsb      -o \
> -              "$name" =~ core-image-basic    -o \
> -              "$name" =~ core-image-minimal ]; then
> +        case $name in
> +        *core-image-sato* | \
> +        *core-image-lsb* | \
> +        *core-image-basic* | \
> +        *core-image-minimal* )
>               ROOTFS=$name
>               return
> -        fi	
> +            ;;
> +        esac
>       done
>
>       echo "Couldn't find a $machine rootfs image in $where."


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


