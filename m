Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbvzG-0007NR-Fa
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:43:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2011 07:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="21912640"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 07:39:30 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 22:39:29 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 22:39:29 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 29 Jun 2011 22:39:28 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 22:39:27 +0800
Thread-Topic: [OE-core] [PATCH 2/2] prelink_git.bb: Only block the postinst
	script when no image-prelink (v2)
Thread-Index: Acw1/l/2zYYMBBebQQak/Z06vJ9iBAAa0x9A
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C71E@shsmsx502.ccr.corp.intel.com>
References: <cover.1309311935.git.mark.hatle@windriver.com>
	<d0bbe06e703f6f9b7d0f38ffc372f3bb1425483a.1309311935.git.mark.hatle@windriver.com>
In-Reply-To: <d0bbe06e703f6f9b7d0f38ffc372f3bb1425483a.1309311935.git.mark.hatle@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] prelink_git.bb: Only block the postinst	script when no image-prelink (v2)
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
X-List-Received-Date: Wed, 29 Jun 2011 14:43:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark Hatle wrote:
> [V2 - fix a small typo in the comment]
>=20
> If image-prelink is being used, the system will automatically prelink
> the target image.  This avoids the need to run the postinst prelink
> script at first boot.  However, if the user has not enabled image
> prelinking -- then we do enable the script to run on first boot.
>=20
>  # The cron script attempts to re-prelink the system daily -- on
> @@ -58,11 +58,13 @@ do_install_append () {
>  	install -m 0644 ${WORKDIR}/macros.prelink
>  ${D}${sysconfdir}/rpm/macros.prelink }
>=20
> +# If we're using image-prelink, we want to skip this on the host side
> +# but still do it if the package is installed on the target...
>  pkg_postinst_prelink() {
>  #!/bin/sh
>=20
>  if [ "x$D" !=3D "x" ]; then
> -  exit 1
> +  ${@base_contains('USER_CLASSES', 'image-prelink', 'exit 0', 'exit
>  1', d)} fi
>=20
>  prelink -a

Even if without the patch, we still skip this on the host side -- previousl=
y we skipped with "exit 1", and with the patch now we skip with "exit 1" or=
 "exit 0".
So IMHO looks the patch doesn't actually help? :-)

Thanks,
-- Dexuan=


