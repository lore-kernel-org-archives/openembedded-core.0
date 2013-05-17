Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UdH4s-00078z-Mv
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 11:35:56 +0200
Received: by mail-ee0-f50.google.com with SMTP id c41so2425918eek.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 02:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=HuJ88wZz5+9LUrwFPreIwj6nqWJ7iW2o+dFgqWVOa2Q=;
	b=NVUHyxmzRbvggf0tt/l0FM7raDI0czLgq0JW5cJreuB+ZjPI6m5XPFJ01PTwtOQwYp
	7tIHMojjWPufZWUWJt/qPPnqgSMpPsDi65NHVImwIcGURiWuvkZ+XjmAFEkgDeVDS/ac
	vNZO7FlpFUbd7+0r9bgPT68AcUr5cKTdSmeNsmUOiPo1h/33EmkT1UVfgKU19c/R32tu
	WE2+mGRYa7gkn4QxdNG6eLcRPCMkcSBp0cxSTImoPXlDroJZvPJKAorwNYSdvHLB27wa
	wLJLTm43kD8Bb8CzRtI6yMv/DsSaaP56K3fnouioZ6vD4XCpTdiHBBWYGAUJmvOjsGT1
	VJTA==
X-Received: by 10.14.99.198 with SMTP id x46mr126516222eef.38.1368782259393;
	Fri, 17 May 2013 02:17:39 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	bj12sm17298478eeb.8.2013.05.17.02.17.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 02:17:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <e2fdb0ddaf77f2801326bb896ed5470e29cd1d16.1368727195.git.sgw@linux.intel.com>
Date: Fri, 17 May 2013 11:17:36 +0200
Message-Id: <10D36FCF-E82F-43EB-9540-72D820F146B4@dominion.thruhere.net>
References: <cover.1368727195.git.sgw@linux.intel.com>
	<e2fdb0ddaf77f2801326bb896ed5470e29cd1d16.1368727195.git.sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmibg1vAOPEYeCVqr/y0E478TBBQA1zZI9F0+PfwLlvVYng3MsT2oGHViUAmAuraljpc5kP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Revert "initramfs-live-install*: fix the "install" boot option"
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
X-List-Received-Date: Fri, 17 May 2013 09:36:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2013, om 20:03 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> This was not the correct fix for this issues, it turns out that
> base-files package was getting installed un-intentionally when
> rpm-postinsts was split out. The base-files recipe lays down the
> link that caused the cat failure.
>=20
> [YOCTO #4504]
>=20
> This reverts commit 45e460d0846f0f660128dc06064b597ce40282b3.
> ---
> meta/recipes-core/initrdscripts/files/init-install-efi.sh         | 1 =
+
> meta/recipes-core/initrdscripts/files/init-install.sh             | 1 =
+
> meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb | 2 =
+-
> meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb     | 2 =
+-
> 4 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh =
b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index 9f7a9e7..23228c9 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -66,6 +66,7 @@ rm -f /etc/udev/scripts/mount*
> umount /dev/${device}* 2> /dev/null || /bin/true
>=20
> mkdir -p /tmp
> +cat /proc/mounts > /etc/mtab

Traditionally /etc/mtab is a symlink to /proc/mounts, not a copy of it.




