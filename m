Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtKnA-0003GM-Vs
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:38:57 +0200
Received: by gwb11 with SMTP id 11so3764573gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=OAjdPkH6RNByOf8kyFFBzWxYHZtsK8BsXa4D2ITNz8Q=;
	b=N3quq7E5UD03oD5WtMbxfjzzYHK2kO4o+acXg+Etm+gXTckPGGNMZCJH03TjHp5RZ4
	0xkXUAsFMTk+uHrqA2bkK5u+Krvra1ogsvSGHb4AzWotD0Sk83V82141lmi780Jf/6/c
	qhdLpDZGvTPXUDsaHGiLJV74aEqKHjs52la9o=
Received: by 10.236.155.65 with SMTP id i41mr1997725yhk.145.1313505257710;
	Tue, 16 Aug 2011 07:34:17 -0700 (PDT)
Received: from [172.23.10.27] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id f4sm98183yhn.83.2011.08.16.07.34.15
	(version=SSLv3 cipher=OTHER); Tue, 16 Aug 2011 07:34:16 -0700 (PDT)
Message-ID: <4E4A7FE5.10602@gmail.com>
Date: Tue, 16 Aug 2011 07:34:13 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1313463192-1911-1-git-send-email-aalonso00@gmail.com>
In-Reply-To: <1313463192-1911-1-git-send-email-aalonso00@gmail.com>
X-Enigmail-Version: 1.2.1
Subject: Re: [PATCH] rpm: configure with staging native path for magic file
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
X-List-Received-Date: Tue, 16 Aug 2011 14:38:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/15/2011 07:53 PM, Adrian Alonso wrote:
> * Remove hardcoded system path for path-magic file in order to avoid
> potential mistmatch between host and yocto native tools as reported
> in yocto mailing list: ---- error: magic_load(ms,
> /usr/share/misc/magic) failed: File 5.4 supports only version 7 magic
> files. `/usr/share/misc/magic.mgc' is version 8 ---- * Another
> solution is to update meta/recipes-devtools/file/file_5.04.bb to a 
> newer version ie. file_5.07.bb
> 
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com> --- 
> meta/recipes-devtools/rpm/rpm_5.4.0.bb |    4 ++-- 1 files changed, 2
> insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> b/meta/recipes-devtools/rpm/rpm_5.4.0.bb index c0e3208..948ed84
> 100644 --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb +++
> b/meta/recipes-devtools/rpm/rpm_5.4.0.bb @@ -45,7 +45,7 @@
> LIC_FILES_CHKSUM =
> "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1" DEPENDS =
> "bzip2 zlib db openssl elfutils expat libpcre attr acl popt
> ${extrarpmdeps}" extrarpmdeps = "python perl" 
> extrarpmdeps_virtclass-native = "" -PR = "r19" +PR = "r20"
> 
> # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It
> is needed # in order to extract the distribution SRPM into a format
> we can extract... @@ -120,7 +120,7 @@ EXTRA_OECONF = "--verbose \ 
> ${WITH_DB} \ ${WITH_Z} \ --with-file \ -
> --with-path-magic=/usr/share/misc/magic \ +
> --with-path-magic=${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc \

this wont work for target rpm I guess

> --without-lua \ --without-tcl \ --with-syck=internal \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5Kf+UACgkQuwUzVZGdMxTmPACgiKm1rdoDPbxVdYhHvCqKEyFJ
0A4Anjx/BxnCQm6ZiLKGXOrn2nbFHzyS
=jGQc
-----END PGP SIGNATURE-----


