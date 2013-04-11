Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UQOSg-0007bZ-Je
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 22:51:34 +0200
Received: by mail-pb0-f41.google.com with SMTP id mc17so1054175pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 13:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=N/qGM33fKw8rtAP95HlJVT5WKmt7eae9UAnotULSwbg=;
	b=tars66xd74Uu5od4H8B/XANFgfJ80cb3uWG4FDMmbvPGYvbGkdjA/Dk+aA3NxVd0IB
	4TVqmGdQYAGwEjEJldAA38ixWZwdZWTnzwcneYAsIsaY27io/Fhg6Qf7hUC0+w83uLVV
	/pj1N/EcYpDWV8g2mXq0TNhpbpLJkwPLMnkcvf58/Cvugtltr+FhsSz75aaRKOj2BA6F
	+HuryMIjLTUJtUk2+Ibd3EiAnrgXcvI2oFu7hgZUQRDqaEyRL9w06mq4J5/yzU+Rtbut
	MAHGxDLW+Gd+MPIMpacfPAhZJlyPJz0kFEZlh1l7T5fly/BzF1xomYrHC1fxV5uDT2er
	mP2A==
X-Received: by 10.66.121.202 with SMTP id lm10mr11543904pab.138.1365712430473; 
	Thu, 11 Apr 2013 13:33:50 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id im2sm5440186pbb.26.2013.04.11.13.33.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 13:33:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A014CB5E0@039-SN2MPN1-021.039d.mgd.msft.net>
Date: Thu, 11 Apr 2013 13:33:49 -0700
Message-Id: <0D51FA37-DDC9-45EC-A3CF-543FAA905ECE@gmail.com>
References: <CA452391058F6D4E9715FB2C29D9312A014CB5E0@039-SN2MPN1-021.039d.mgd.msft.net>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
X-Mailer: Apple Mail (2.1503)
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The build issue of wayland-native on Linux distros with old glibc
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
X-List-Received-Date: Thu, 11 Apr 2013 20:51:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 11, 2013, at 2:22 AM, Luo Zhenhua-B19537 <B19537@freescale.com> =
wrote:

> I tried to build wayland-native which requires sys/signalfd.h and =
sys/timerfd.h, the two headers are not provided by Yocto build env, so =
host version is searched.=20
>=20


those are coming from libc, I don't think we use own libc for native =
packages. So they have to come from host libc, for nativesdk different =
story

> When the build is conducted in Linux distros with old glibc(not sure =
about the accurate version), above two headers are not available, so =
build will failed as following:
> | =
/home/yocto/workspace/sdk-devel/build_p4080ds_release/tmp/work/x86_64-linu=
x/wayland-native/1.0.6-r0/wayland-1.0.6/src/event-loop.c:33:26: error: =
sys/signalfd.h: No such file or directory
> | =
/home/yocto/workspace/sdk-devel/build_p4080ds_release/tmp/work/x86_64-linu=
x/wayland-native/1.0.6-r0/wayland-1.0.6/src/event-loop.c:34:25: error: =
sys/timerfd.h: No such file or directory
>=20
> Can anybody shed some light on how to solve the issue in Yocto to =
ensure the build doesn't depend on host env?
>=20
>=20
> Best Regards,
>=20
> Zhenhua
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



