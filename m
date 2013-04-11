Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UQBF7-0007HI-4e
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 08:44:23 +0200
Received: by mail-ee0-f49.google.com with SMTP id l10so565478eei.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 23:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=b5xGHaj9SNEl1TIlJa3qhnvtria4O4yobelmB2V/wUY=;
	b=Kxxt77h+TYSX2XuNQTxpyUprDYdzqjooFRnHBTjGDormFlBR4OGx1on2gxJX9khmwP
	GKtXT+94/Wwb2BA1NLXabPrA+uyuhRLhljDUT5RAUO0uo3JJOWPa+6mI5G0d3X1MFtSC
	ajrAtDf6u/yZmOzr46Q+1memYK3VPX3qoK6dAZgzMUdWL4/dQ2i3i8X0hGcbo1KT2JE2
	nBXtWSXb3RCAl8j7azY5MbN0iRBuxghYz39gWduGHIrzi6RfhBIDwnGwroKILCEdqh1Q
	i4iRYSb8MI40ARgAFy0lA7ZbRG8faNEvBFpE8j6szaGZs0Nw3Yy2KdvkZjg5OpHsjyHh
	F4QQ==
X-Received: by 10.14.5.137 with SMTP id 9mr9191432eel.30.1365661618650;
	Wed, 10 Apr 2013 23:26:58 -0700 (PDT)
Received: from [46.206.159.72] (046206159072.atmpu0021.highway.a1.net.
	[46.206.159.72])
	by mx.google.com with ESMTPS id r4sm3727345eeo.12.2013.04.10.23.26.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 23:26:58 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 08:29:49 +0200
Message-ID: <13df7c921cb.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <23e03f4a9118bbae6033f9d88925d6f8b542ee5d.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
	<23e03f4a9118bbae6033f9d88925d6f8b542ee5d.1365608262.git.paul.eggleton@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.3.4 (build:
	2100270)
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] initscripts: fix read-only-rootfs-hook.sh to start earlier
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 06:44:36 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 10 April 2013 17:42:28 Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Mount /var/volatile ourselves so that we can set up the writable area
> first. This fixes the urandom service not starting properly when
> read-only-rootfs is enabled.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh             |    1 +
>  meta/recipes-core/initscripts/initscripts_1.0.bb                     |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git 
> a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh 
> b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> index 4f3e0d9..9cf0921 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> @@ -5,6 +5,7 @@
>  [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
>
>  if [ "$1" = "start" ] ; then
> +	grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile

Or just use mountpoint(1)?


Sent with AquaMail for Android
http://www.aqua-mail.com




