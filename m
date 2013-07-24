Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8726B0F2;
	Wed, 24 Jul 2013 16:49:59 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so363519eek.38
	for <multiple recipients>; Wed, 24 Jul 2013 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QLsASWhv35yJy5YVA4ODDyitWcT2j3AplEd33GxFf88=;
	b=DIBHJlrZ7HRtoWr+HjUqI2PGhy3KDo4faZPFHmQTf/fCWTpgG+e/Hstn+YHREImWib
	v7tjQoIRWD/XHX6dKXHWuwYshG1BAOBSwDH6KwzuRzVVgqKIB8Y2ZKEDuhykVALbDQSd
	f614yN3kG6Y6sK8INf2KlmICQBmufoHhyFgsYVQn/eggHBL1CQtzAoOLWxJPMwaODmN0
	ZwHDDDpZ4DaPaTYqNF1nkevQo69ev3HbxAMksDDHH8oo3gC/CmWU6M3JMZbZvtweNi62
	JnBHrKV1XhlXOSrIVepRSogAUQ9bhvSK9f1QQ2x6L3ck4QFpaFG5ememSYtsoTxJoxXr
	myUg==
X-Received: by 10.15.33.13 with SMTP id b13mr38697886eev.0.1374684599196;
	Wed, 24 Jul 2013 09:49:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm67392057eev.8.2013.07.24.09.49.58 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 09:49:58 -0700 (PDT)
Date: Wed, 24 Jul 2013 18:50:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130724165022.GA17913@jama>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: test-dependencies.sh results from big world build
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
X-List-Received-Date: Wed, 24 Jul 2013 16:50:00 -0000
X-Groupsio-MsgNum: 42410
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

My biggest build with 20+ layers included finally finished today (after
many days because there was hw issue on server where it was running, so
it was slower then it should be).

The results are a bit messy because:
1) It had only some fixes from my last "autodetected dependencies"
   patchsets for oe-core and meta-oe
2) It was started when oe-core/master had broken boost, so many packages
   failed because of boost
3) It was started when oe-core/master had issues with qt-mobility (not sure if
   all were fixed already)
4) It wasn't using latest version of test-dependencies script
5) It was using complete buildhistory repo which had many stalled
   packages like task-* and couple of architectures.

But at least it will allow me to restrict recipes to rebuild from 1900 to
only 256 which were failing in this build.

It was tested only for qemuarm.

Complete logs are here:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/

Interesting parts
11 recipes failed in world build:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/failed.world

101 recipes failed in minimal build (8 caused by boost):
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/failed.min

216 packages (160 recipes) doesn't have deterministic dependencies
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/test-dependencies-2013-07-24/failed.dependencies

Next results should be more interesting, because many issues are already
fixed by change I've sent today to oe-core and oe-devel ML, but not all,
because they were detected in build without x11 in DISTRO_FEATURES and
without some layers (like meta-browser meta-efl meta-gnome meta-gpe
meta-initramfs meta-webserver meta-xfce).

Cheers,


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHwBc4ACgkQN1Ujt2V2gBzmXACeMSgpwvZ1akYHF/6J+QuRH2ng
+Y8AoK2PftVnEJwwJmpDry554hbGKXNi
=vTSb
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
