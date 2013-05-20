Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeSbS-0001uG-AQ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 18:06:32 +0200
Received: by mail-ie0-f178.google.com with SMTP id b11so13683445iee.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ST9YUtIyHoUrWPDnK5xHJ312UyRbTTVP5Q2DoOQijhg=;
	b=vVWxiFSu4g8CHlffGmEVTDtWfn30EzfOcaVkDr20J0yt4CfZNtpEVYsfTdfhVLbNVh
	Rr9xHwU6sSXFj3nbk0G09r8PaZ+DXJA0sN63sARDmH+iNa5thT9MUv9eqO2J9UdvcyYv
	Sh8bvJIQHVPdLSypxehu79q00v2+ZTgM/FN3jHZ/I99OmQlUraC08KpzdStJjpqndOzZ
	xYLjjpgWSXa/8wPxaoIl2p3OmNxAb0Got0PeaSgLwgegKL11b7tvPNNqln+uG8nwAm0v
	/hl7HvXo59L1ei1m16i7TtWXdv0FMXHQ30ibGBLpxBhdJeYN4jEz9KqSsZ1zI8MyeNiw
	0ZvQ==
X-Received: by 10.50.17.166 with SMTP id p6mr5661087igd.12.1369064885235; Mon,
	20 May 2013 08:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.109.133 with HTTP; Mon, 20 May 2013 08:47:35 -0700 (PDT)
In-Reply-To: <1369044584-6053-1-git-send-email-laurentiu.palcu@intel.com>
References: <1369044584-6053-1-git-send-email-laurentiu.palcu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2013 08:47:35 -0700
Message-ID: <CAMKF1spPt2ZKU-VnUT0KWS5sUMWrWybOdhmTn+pBxeu7TAt=Cg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: fix networking issues
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
X-List-Received-Date: Mon, 20 May 2013 16:06:57 -0000
Content-Type: text/plain; charset=UTF-8

thanks for fixing it. I wonder why I did not run into it something in
my settings probably.

On Mon, May 20, 2013 at 3:09 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
> After switching from ifconfig to ip, networking stopped working. This
> commit contains the following fixes:
>
>  * set a decent broadcast address for the tap device;
>  * bring up the device;
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
> Apparently, the autobuilder has some magic into it because all the sanity tests
> succeeded... So, I don't know why AB tests succeeded but on my machine, and several
> others, networking was broken and couldn't connect into the qemu image. If I'm
> missing something, please, do not hesitate to correct me. This patch fixes the
> issue for me though.
>
> Thanks,
> Laurentiu
>
>  scripts/runqemu-ifup |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index 8948153..108d9a4 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -100,7 +100,8 @@ if [ ! -x "$IPTABLES" ]; then
>  fi
>
>  n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
> -$IFCONFIG addr add 192.168.7.$n/32 dev $TAP
> +$IFCONFIG addr add 192.168.7.$n/32 broadcast 192.168.7.255 dev $TAP
> +$IFCONFIG link set dev $TAP up
>
>  dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
>  $ROUTE add -host 192.168.7.$dest $TAP
> --
> 1.7.9.5
>


