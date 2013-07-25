Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C43D96B254
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 13:02:21 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hq4so1750328wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 06:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=0Xl1YekvH04qv8mIBERZVeij/yAUnrbQbe+2cr9TDac=;
	b=gFAMZnJiNfpN3yRBNe3kAsoab5lhXqCnfnmbaS3mPqmEBiPlhhFG5AunLEfPw1Ze+V
	TSEq1DAXKYZHrZ1WfqBnh2WjK0Ky76Yvai3uUlFs1vlLh6hvxXNzJ2qstpfPaQyYelzM
	pAGvBdMyy0obAE9IoBHl6rjyQZyz/g99fwhoAN/1+X5eGeu6RNySMS8+JZcCgUXDHhdd
	nQsLbaXwJrRfRfKYKFx5X9mZQxBy0F8Tcc/hiux9mHdjsDoYoV/ajjfSaEm0UPV2AiKa
	l3xeV84Ewb96SlMkm3qybjTYiKM/ME46NxsxErjdNWL8tbJdUol3hB2AX9MfyPR2+Qth
	EGCA==
X-Received: by 10.194.92.6 with SMTP id ci6mr6572889wjb.79.1374757342039;
	Thu, 25 Jul 2013 06:02:22 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4907:4245:5568:5807?
	([2001:610:612:0:4907:4245:5568:5807])
	by mx.google.com with ESMTPSA id li9sm3626723wic.2.2013.07.25.06.02.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 06:02:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <F61C6B48-CF28-4331-BEBF-19673E091E96@dominion.thruhere.net>
Date: Thu, 25 Jul 2013 15:02:20 +0200
Message-Id: <4F2BF532-D3A4-431E-8905-E4F33FBF80D5@dominion.thruhere.net>
References: <1373325035-29814-1-git-send-email-sgw@linux.intel.com>
	<lysizmmle9.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<F61C6B48-CF28-4331-BEBF-19673E091E96@dominion.thruhere.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQk3LCN8tFjBoh9MVdBaoyhg2OjHygdaZ1nOGssR03KXNkT+KqwbYF03GhVygVa/hBmk6MWS
Cc: Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] util-linux: Use PACKAGECONFIG to control pam and system config options
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
X-List-Received-Date: Thu, 25 Jul 2013 13:02:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2013, om 14:58 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 10 jul. 2013, om 18:26 heeft Enrico Scholz =
<enrico.scholz@sigma-chemnitz.de> het volgende geschreven:
>=20
>> Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>>=20
>>> The PACKAGECONFIG will ensure consistent enabling and disabling of =
the pam and systemd related
>>> options for configure and the correct dependencies
>>>=20
>>> v2: fixed PACKAGECONFIG line continuation grammar
>>>   added _class-target for PACKAGECONFIG to work on target only
>>> ...
>>> +PACKAGECONFIG_class-target ??=3D =
"${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>> +                                ${@base_contains('DISTRO_FEATURES', =
'systemd', 'systemd', '', d)} "
>>=20
>> This does not work here. d.getVar('PACKAGECONFIG', True) evaluates to =
'None'
>> in the anonymous python function in base.bbclass so that non-systemd =
options
>> are selected in systemd distributions and packaging fails in a sanity =
check.
>>=20
>> Using the less weak '?=3D' operator makes thing work as expected.
>=20
> And a different version of this patch got merged:
>=20
> 	=
https://github.com/openembedded/oe-core/commit/7cde7c639c53724327d981cbc0d=
b5e123607de1c
>=20
> Which has the following bug:
>=20
> PACKAGECONFIG_class-target ??=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'libpam', '', d)} \
> [..]
> PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, pam,"
>=20
> It sets 'libpam' as PACKAGECONFIG option, but the option is actually =
named 'pam'. The patches posted to this list don't seem to have this =
bug.

Here's what I used with dylan + backports:

commit 2f318d0f9627e1872732db1ecafaed9caeb68ebf
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jul 25 14:58:27 2013 +0200

    util-linux: fix PACKAGECONFIG options
   =20
    The ??=3D operator is too weak and it's setting a non-existent =
PACKAGECONFIG option ('libpam' instead of 'pam').
   =20
    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

diff --git a/meta/recipes-core/util-linux/util-linux.inc =
b/meta/recipes-core/util-linux/util-linux.inc
index d373cec..3d1198a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -47,9 +47,9 @@ EXTRA_OECONF =3D "--libdir=3D${base_libdir} =
--disable-use-tty-group \
                 --enable-libuuid --enable-libblkid --enable-fsck =
--without-udev \
                usrsbin_execdir=3D'${sbindir}' \
 "
-PACKAGECONFIG_class-target ??=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'libpam', '', d)} \
+PACKAGECONFIG_class-target ?=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'pam', '', d)} \
                                 ${@base_contains('DISTRO_FEATURES', =
'systemd', 'systemd', '', d)} "
-PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, pam,"
+PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, libpam,"
=20
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] =3D "--enable-socket-activation =
--with-systemdsystemunitdir=3D${systemd_unitdir}/system/, =
--disable-socket-activation --without-systemdsystemunitdir"


