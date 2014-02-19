Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1106E7FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:02:32 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id e4so4399002wiv.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 01:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=w+XP8GAgZrTLOGfkppxJNqJo7bwHDBMjH6fEoFm8oL4=;
	b=epbAXuPiB4L1vj3fP+Xcjf93VHRJpcSm99+bW9z5s4VGd6Ni17kanH1z1IH1vE6B3z
	asYyvPukG1CLY64b8R5rSGiZSvMJlYK3Dnta2zmBC678c6QzJ/UaUI8tBIY6SR+dF+uY
	1SjvyvUIGOJUPDboGRQRB8WiZLUlRiFOkua8TG2IzpWoL68gZtsvRekLTt0DtKa+Jspe
	XiNGF1BZuCoF5Gb9s1e8SoMUVuPc1H7KP34rX0eApvqm4sn8zZwPBSDgoBuOQIe9Zny3
	anEKvc6JNp0bbM4X2EZgCAIfkZ9kXNUAXmg5Y9uAzw5iI9r3Fgg2daI4i+YIEFCgQ7HR
	hf5Q==
X-Gm-Message-State: ALoCoQnUdN4iJigeDGICvl4TiZo3RuZtElLRjrmWMkaGpK2gjfT4OFhAaucfYDnavICllPeoGDjd
X-Received: by 10.194.170.133 with SMTP id am5mr22623375wjc.42.1392800552754; 
	Wed, 19 Feb 2014 01:02:32 -0800 (PST)
Received: from ?IPv6:2001:610:612::cdf4:6708:4555:49cf?
	([2001:610:612:0:cdf4:6708:4555:49cf])
	by mx.google.com with ESMTPSA id uq2sm52140997wjc.5.2014.02.19.01.02.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 01:02:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1392725581-6817-1-git-send-email-ross.burton@intel.com>
Date: Wed, 19 Feb 2014 10:05:23 +0100
Message-Id: <4267AFED-22F3-4424-98E4-7525E9690C78@dominion.thruhere.net>
References: <1392725581-6817-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: handle SO_REUSEPORT not being available
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
X-List-Received-Date: Wed, 19 Feb 2014 09:02:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 feb. 2014, om 13:13 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Linux < 3.9 doesn't have the SO_REUSEPORT option so instead of failing =
to start
> when built with >=3D3.9 kernel headers but booted on <3.9 kernels, =
continue as if
> SO_REUSEPORT wasn't available.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Great timing! I ran into this last week.

Tested-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/recipes-connectivity/avahi/avahi.inc          |    1 +
> .../avahi/files/reuseport-check.patch              |   30 =
++++++++++++++++++++
> 2 files changed, 31 insertions(+)
> create mode 100644 =
meta/recipes-connectivity/avahi/files/reuseport-check.patch
>=20
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
> index 3a95b7f..e4ff26a 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -26,6 +26,7 @@ SRC_URI =3D =
"http://avahi.org/download/avahi-${PV}.tar.gz \
>           file://fix_for_automake_1.12.x.patch \
>           file://out-of-tree.patch \
>           =
file://0001-avahi-fix-avahi-status-command-error-prompt.patch \
> +          file://reuseport-check.patch \
>           "
>=20
> USERADD_PACKAGES =3D "avahi-daemon avahi-autoipd"
> diff --git =
a/meta/recipes-connectivity/avahi/files/reuseport-check.patch =
b/meta/recipes-connectivity/avahi/files/reuseport-check.patch
> new file mode 100644
> index 0000000..bb81c2c
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/reuseport-check.patch
> @@ -0,0 +1,30 @@
> +Fix avahi-daemon when running on kernel < 3.9 (patch taken from =
Ubuntu).
> +
> +Upstream-Status: Pending (unmaintained upstream)
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +Description: SO_REUSEPORT may not exist in running kernel
> + When userspace defines SO_REUSEPORT we will attempt to enable socket
> + port number reuse.  However if the running kernel does not support
> + this call it will fail preventing daemon startup.  If this call is
> + present but fails ENOPROTOOPT then we know that actually the kernel
> + does not support it and we should continue as if we did not have the
> + call at all.  (LP: #1228204)
> + .
> + This patch could be removed from the debian package after jessie =
release.
> +Author: Andy Whitcroft <apw@canonical.com>
> +
> +Index: avahi-0.6.31/avahi-core/socket.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- avahi-0.6.31.orig/avahi-core/socket.c	2013-09-20 =
16:36:50.000000000 +0100
> ++++ avahi-0.6.31/avahi-core/socket.c	2013-09-20 16:38:23.781863644 =
+0100
> +@@ -177,7 +177,8 @@
> +     yes =3D 1;
> +     if (setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &yes, sizeof(yes)) =
< 0) {
> +         avahi_log_warn("SO_REUSEPORT failed: %s", strerror(errno));
> +-        return -1;
> ++        if (errno !=3D ENOPROTOOPT)
> ++            return -1;
> +     }
> + #endif
> +=20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


