Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id C15266A4E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 09:33:16 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ef5so13345694obb.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=p5jFmnfS0mW095QviaRmnxcmkkQtuDkwOE08z5M3SKc=;
	b=PKgEnn0wQzksXyW5yR2HUBjtUq53kLgCi8iTpOhz8pRH9rxRNrBmVOukHTiB3Sxf55
	CAjPcoyBN4m2thJPv2R65w7tNDU23EQRp61zB4zkJ1SeTBHahjEZcSC3gn1O4VTFV6UW
	qVFTvT8EnzmlWb24m9bs/47v89Ry815CJ2PQsB9Nv5SfGcopp+v0EiSWlRbgIclsVuZJ
	qzmucknNteud/8XHDAYRq5UMyH9x8oQy/b7RWcWKjPikPgXi+M8US7Y6LMCP8+YcIAkK
	kUsivpw1GBtAK7H7pmA1QhcJxcF/mi9G+pD+UFIXpRL0ZTS48z0xRyFL+IRuZ3aDfwip
	Qz0g==
MIME-Version: 1.0
X-Received: by 10.182.50.200 with SMTP id e8mr1369404obo.35.1372239197331;
	Wed, 26 Jun 2013 02:33:17 -0700 (PDT)
Received: by 10.76.81.66 with HTTP; Wed, 26 Jun 2013 02:33:17 -0700 (PDT)
Date: Wed, 26 Jun 2013 11:33:17 +0200
Message-ID: <CA+AhUGwXGcp3w=j6d=tb4hn1SfGm1OnF86UGaDvMD6q005CA3w@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQlV8cyta9xfyE6yocE/1FTixr8oA3AFZmigpuKrzeihTr9UUzsxWu6JyW0NV601Qz9SoAcG
Subject: Issue with pseudo on 64-bit build host
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
X-List-Received-Date: Wed, 26 Jun 2013 09:33:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

In bitbake.conf FAKEROOTBASEENV is set to contain
"PSEUDO_LIBDIR=3D${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib" but on my
buildhost libpseudo.so is in
${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib64.

For me this causes rpm:s that use qemu_run_binary() to do stuff during
do_rootfs() (using post-install scripts) to fail, since ld.so can't
find libpseudo.so it gives an error that contains "ERR" which
package_rpm.bbclass rpm_log_check() picks up.

I git confused for a while since the command used in the post-install
script worked ok in a devshell but not during do_rootfs(), but this is
due to the fact that LD_LIBRARY_PATH in the devshell contains:
<mybuilddir>/tmp/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib64 . I
couldn't find where this was added to LD_LIBRARY_PATH for devshells
though.

Cheers,
Erik Bot=F6

