Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8jT-0000I8-JD
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:48:51 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:38:16 -0700
Received: by mail-lb0-f180.google.com with SMTP id gh12so2565576lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=To1Y+BiTWqgp7zpKEHp0uT6ZB8Q+qnpUM3aABKJV7C8=;
	b=ZPWhJl4ipjcQlMax9DCFBkJsTvIvGm43uJU29g6w0wDkQ7smEdo5i3ZdwHBFwfyOte
	W/Q2pKH5GcF3YhvNvzdTG4DgTjxQ+pnjeJd/3w61+lkXQSdsA89dD5cN2HYYHlaAYhp9
	UzrWr864Xb65/6yDiaaMSL6yhMQuN0nLomL7udiYW9v5BFToGH6n9c23LS8OCrxCNozK
	MxL2GUg7aSVTX7MSedBJneB3KCy4WjPMLV9+MaRJsAY+NfhgDvgcyTtKeXfqyvRXdr30
	Ov2aYWNif58gIoCj+vHxBcivO2w2fCDTweQm4MdyeofNuCFvd0VMoEy64qjjzXWmj4jn
	lC5w==
MIME-Version: 1.0
Received: by 10.152.103.109 with SMTP id fv13mr18058884lab.33.1339436296659;
	Mon, 11 Jun 2012 10:38:16 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:38:16 -0700 (PDT)
In-Reply-To: <0cfc78b03c6a0e2c21c6a82ab9e78aa4a8b74949.1339000756.git.scott.a.garman@intel.com>
References: <cover.1339000756.git.scott.a.garman@intel.com>
	<0cfc78b03c6a0e2c21c6a82ab9e78aa4a8b74949.1339000756.git.scott.a.garman@intel.com>
Date: Mon, 11 Jun 2012 10:38:16 -0700
Message-ID: <CAPhnLPCBsqrHOYOqZLu7heU9_BiyxsG4cX4AcVeQMgMRP7M-vg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn99GBIvbxFopwxuc63SGUmUk0IVniK7E8k9c9kSSz0JxilQkI2xyZOeVok7CKnhlaXHBbd
Subject: Re: [PATCH 1/1] runqemu-ifup: enable arp proxying
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
X-List-Received-Date: Mon, 11 Jun 2012 17:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 9:41 AM, Scott Garman <scott.a.garman@intel.com> wro=
te:
> This allows core-image-sato to access the WAN.
>
> Thanks to Dexuan Cui for proposing this fix.
>
> Fixes [YOCTO #2329]
>
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
> =A0scripts/runqemu-ifup | =A0 =A01 +
> =A01 file changed, 1 insertion(+)
>
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index e4c3daf..0926faf 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -109,6 +109,7 @@ $ROUTE add -host 192.168.7.$dest $TAP
> =A0$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
> =A0$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
> =A0echo 1 > /proc/sys/net/ipv4/ip_forward
> +echo 1 > /proc/sys/net/ipv4/conf/$TAP/proxy_arp
> =A0$IPTABLES -P FORWARD ACCEPT
>
> =A0echo $TAP
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Merged into OE-Core

Thanks

-b


--=20
Elizabeth Flanagan
Yocto Project
Build and Release


