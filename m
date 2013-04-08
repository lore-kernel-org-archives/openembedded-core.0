Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UP6lb-0006AC-FX
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 09:45:31 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so1369283eek.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 00:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vxtwA/V0uu35WnLVTB93hjhMvGBRCfFLkgvqT4rKFuE=;
	b=eEbzW0SMnTlaHwopRxjZoeWzS73T9/G+EOLNEzusq+CnPr+lPwi3r6EhJSE70UGq3c
	YOLDQUjZA2QF6B20UlxdYwqHfuNcHT+tELojjjTuwWG+A4R7/yk3zbrfIxbnQ1BwPvfD
	tIBtczlpPRcg+2fGm2FEpsC2nJ4sxo66j2R5mLzKfvpVydgKO2MxBXoi411ibIvIoIo0
	szxwVhLcp5XsA1nFUKwMW7KfI2GcDjDNDY6kLgPOuEPxSz+hg4WVKHGmXxGZGtIjRCX5
	M6hI5GaNGtvssTUE5SYBebxuBMgk4vsuUrZ8r26XGgfdRE3JQJu7eLDGRx/cXwLUjvFz
	+F9A==
X-Received: by 10.15.101.200 with SMTP id bp48mr45539306eeb.38.1365406089144; 
	Mon, 08 Apr 2013 00:28:09 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id i53sm988703eeu.5.2013.04.08.00.28.06
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 00:28:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365326417-5465-1-git-send-email-holger@moiji-mobile.com>
Date: Mon, 8 Apr 2013 09:28:06 +0200
Message-Id: <32F909C0-00C8-4E10-9A11-11003C80FE1B@dominion.thruhere.net>
References: <1365326417-5465-1-git-send-email-holger@moiji-mobile.com>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnCnXJ5A5Ll2ZoQr44VYST6+4SkRQRGTsl+R3jRJbaJ/rR4RY7qd5czi6eH25hOmW5eLPRa
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Set the default firmware path to enable firmware loading in udev
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
X-List-Received-Date: Mon, 08 Apr 2013 07:45:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 apr. 2013, om 11:20 heeft Holger Hans Peter Freyther =
<holger@moiji-mobile.com> het volgende geschreven:

> From: Holger Hans Peter Freyther <zecke@selfish.org>
>=20
> After some breakage in udev the kernel gained direct firmware loading.
> For older kernels (e.g. 3.2 in my case) udev still needs to load the
> firmware. Firmware loading is enabled once a default firmware path is
> set. Apply a compile fix from the upstream project.
> ---
> .../systemd/systemd/199-firmware.patch             |   97 =
++++++++++++++++++++
> meta/recipes-core/systemd/systemd_199.bb           |    3 +
> 2 files changed, 100 insertions(+)
> create mode 100644 =
meta/recipes-core/systemd/systemd/199-firmware.patch
>=20
> diff --git a/meta/recipes-core/systemd/systemd/199-firmware.patch =
b/meta/recipes-core/systemd/systemd/199-firmware.patch
> new file mode 100644
> index 0000000..1f4540f
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/199-firmware.patch
> @@ -0,0 +1,97 @@
> =
+http://cgit.freedesktop.org/systemd/systemd/patch/?id=3Dd8d4bee76cf3b40ea=
923bc57d44aa0815ca9b5ff
> +
> +=46rom d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff Mon Sep 17 00:00:00 =
2001
> +From: Kay Sievers <kay@vrfy.org>
> +Date: Thu, 28 Mar 2013 14:28:10 +0000
> +Subject: build-sys: fix HAVE/ENABLE_FIRMWARE

The above makes it clear that it's a backport, but I'd still like to see =
a Upstream-status: Backport in there :)

regards,

Koen=


