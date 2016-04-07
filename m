Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA756FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E182B3141D25
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 19:34:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ELQ7hsUHXas2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 19:34:34 +0200 (CEST)
Received: from [172.22.22.61] (55d40344.access.ecotel.net [85.212.3.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BE5A73141A6D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 19:34:34 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <57069A2A.4040901@opendreambox.org>
Date: Thu, 7 Apr 2016 19:34:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Thu, 07 Apr 2016 17:34:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Khem,

On 07.04.2016 09:02, Khem Raj wrote:
> echo would fail if /sys is not mounted and boot would abort

are you sure about the dependency between echo and sysfs? It seems quite
unlikely to me. I'd guess the real problem is mdev failing to start
without sysfs.

Regards,
Andreas


> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/busybox/files/mdev | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
> index 9625247..8c9c06e 100755
> --- a/meta/recipes-core/busybox/files/mdev
> +++ b/meta/recipes-core/busybox/files/mdev
> @@ -1,10 +1,12 @@
>  #!/bin/sh
> -
> +mount -t proc proc /proc
> +mount -t sysfs sysfs /sys
>  mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
>  mkdir /dev/pts /dev/shm
>  chmod 777 /dev/shm
>  mount -t devpts devpts /dev/pts
>  touch /dev/mdev.seq
> +#sysctl -w kernel.hotplug=/sbin/mdev
>  echo "/sbin/mdev" > /proc/sys/kernel/hotplug
>  mdev -s
>  
> 


