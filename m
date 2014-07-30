Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3265A60DD7;
	Wed, 30 Jul 2014 07:17:43 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so715311wgg.31
	for <multiple recipients>; Wed, 30 Jul 2014 00:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VS/3BzCQpuSfe3qOHoH2XkEjVXieWRSBO3ttZ5yV/ZA=;
	b=JD4eJyulQNv8kK/y91JezFVs07Tkt0ZdqUe/os3PphyXXloeKGyOro2jfNFLS94ANO
	DDFZlICkQhqJgyIs/JVU5E8Km0/mtLkpj3kVkTbke5hUWjo9raunpNaGo2hQM9qjS4JJ
	CTQBq+AIAzXBytswXhyavY3Habxtf2k/DgYI26/weuN/ANsnvEqhRDaLgKSswnV0bfan
	Or3ZII33Jyf4wFwg5vCQLmr4Gn29snud1GcTb8E98cOBdFc/D8mxSj9sxYxcCkB+E3ex
	i6HXJ0TTEB1dqssStCsiRD4Aaw3e0PfMnu1ywQYpC4VxTWzcDUlDC7Lp3ballGLO203z
	I5dg==
X-Received: by 10.194.60.240 with SMTP id k16mr3120529wjr.109.1406704664515;
	Wed, 30 Jul 2014 00:17:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v17sm3375903wjr.33.2014.07.30.00.17.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 00:17:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 09:18:05 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140730071805.GE16445@jama>
References: <20140724105336.GE2492@jama>
MIME-Version: 1.0
In-Reply-To: <20140724105336.GE2492@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, test-dependencies 2014-07-24
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
X-List-Received-Date: Wed, 30 Jul 2014 07:17:49 -0000
X-Groupsio-MsgNum: 55739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yQbNiKLmgenwUfTN"
Content-Disposition: inline

--yQbNiKLmgenwUfTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 24, 2014 at 12:53:36PM +0200, Martin Jansa wrote:
> So it looks like we're again in better shape, but something is strange
> with this new insane_qa check for build dependencies, since it was
> introduced in master-next it finds more issues than test-dependencies.sh
> did and vice-versa test-dependencies.sh now doesn't report some issues
> which IIRC weren't properly fixed yet. So we need to double check why.

I've found an issue in test-dependencies.sh script, it wasn't properly
reporting all recipes with found issues in last "failed-recipes.log" list.

With that fixed there is only couple of recipes where insane-qa and
test-dependencies results differ.

We can ignore gst-ffmpeg and openal-soft which are in list because they
don't build at all (because of libav-9).

So it leaves 10 recipes where insane_qa is stricter than test-dependencies.sh.

I'll include them all in next test-dependencies build to confirm that there was
no difference in metadata.

diff -uN failed-recipes/failed-recipes-2014-07-28 failed-recipes/failed-recipes-2014-07-28.insane_qa
--- failed-recipes/failed-recipes-2014-07-28    2014-07-30 07:11:46.956282771 +0000
+++ failed-recipes/failed-recipes-2014-07-28.insane_qa  2014-07-30 07:08:10.735494787 +0000
@@ -1,24 +1,30 @@
+dconf
 directfb
 engrave
 epiphany
+evopedia
 expedite
 gd
+gimp
 gmtk
 gnome-disk-utility
-gst-ffmpeg
+gtksourceview2
 guile
+kernelshark
 leptonica
 libarchive
+libextutils-helpers-perl
 libmicrohttpd
 libmikmod
+libmodule-build-tiny-perl
 libungif
 libwebp
+libxklavier
 ltrace
 midori
 mpd
 mpeg2dec
 mpg123
-openal-soft
 oscam
 perf
 piglit
@@ -31,4 +37,6 @@
 synergy
 tesseract
 tracker
+ttf-mplus
+webmin
 wireshark

--yQbNiKLmgenwUfTN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPYnC0ACgkQN1Ujt2V2gBzaDgCePAd4LnTrc/39oEoYzWrreJ10
7wgAnR51lDKoPMbpi8f6zDbOBWe+jN8W
=+3DH
-----END PGP SIGNATURE-----

--yQbNiKLmgenwUfTN--
