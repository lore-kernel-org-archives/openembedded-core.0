Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UUxAv-00023T-7V
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 12:43:55 +0200
Received: by mail-pd0-f176.google.com with SMTP id r11so1036824pdi.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=P3o1opfDCkZLdYf9Ipti8+8NvbrA9WaRxe8YghqoOws=;
	b=ZN8bOjmX+L3nIiMNDCdXaToWgxp8lcFt7fGfBZnfqfAnivcEtnrV4bD9zpdiG0pTKi
	65UqwOHm5CQi8YAb5l5uzRGvlUBkGhwX2XMc8JW+aBpU1HWLwQvWMGWYUunu0ylBDks2
	p5L8XIZFmH/ZlYxiYV8IYkgQW4bsXkoj2Pyc4tv6JEhRTkytUON04gYjx6wLQSaaGZy4
	LcKEulK+QC2KGA+0JneqG/o0TNmDUE2ZaO072GCktSrY+a7eiG9GW/n8yyfaeBhc8C/T
	cXtbE3WDov1anPnI3RcfnlXtd2PKK3CTrBrVJVdeFwxIusYmGXCdwMfLnwKchACIv9l8
	LjCA==
X-Received: by 10.68.226.230 with SMTP id rv6mr8417820pbc.55.1366799162694;
	Wed, 24 Apr 2013 03:26:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qi1sm3056973pac.21.2013.04.24.03.25.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 03:26:01 -0700 (PDT)
Date: Wed, 24 Apr 2013 12:26:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130424102611.GH3217@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Extra space in TUNE_CCARGS
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
X-List-Received-Date: Wed, 24 Apr 2013 10:43:55 -0000
X-Groupsio-MsgNum: 38287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline

--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm building for 2 MACHINEs one is cortexa9, second is cortexa8

few months ago we added TUNE_CCARGS[vardepvalue] in bitbake.conf
http://git.openembedded.org/openembedded-core/commit/?id=03f1e34ea3ce80931e9c3cd2ab22824f28a7233b

which fixed some cases (like mentioned tune-xscale and tune-arm926ejs)
where both had unused TUNE_CCARGS when common DEFAULTTUNE was used.

with cortexa[89] it's different, because cortexa9 has one extra TUNE_CCARGS
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex-a9", "", d)}"
which adds extra *space* even when not used because of '+=' and as result:

$ bitbake-diffsigs tmp-eglibc/sstate-diff/1366797730/*/armv7*/adapterbase/*do_configure*
basehash changed from f986789fb8fb3579ed6a3492cc8a8d10 to c851b5f838d945ee13072e9ad6725dca
Variable TUNE_CCARGS value changed from ' -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon ' to ' -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  '
Hash for dependent task gcc-runtime_4.7.bb.do_populate_sysroot changed from bdeabf7a86958b9110b566344b7916de to 2be5618e6bc8c57ec9db5659bf217915
Hash for dependent task eglibc_2.17.bb.do_populate_sysroot changed from b4f40fc62dde684acd0a574532a55360 to 97fcb426603d4a1c1099c0504d2ebf7d
Hash for dependent task glib-2.0_2.34.3.bb.do_populate_sysroot changed from fd2f90b83098c34e88d649d70f6ea4f5 to ebd740bb94ea3eb0a914efda6fc82c4a

I'll try to convert all 'TUNE_CCARGS +=' to TUNE_CCARGS_append and see if it fixes
this issue. But then we should consider merging this in 1.4.1 if possible.

Cheers,

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF3s0MACgkQN1Ujt2V2gBxvawCeKuHbx95EW7HHpwMY11GcliUw
abAAn261gt0/kuYLKW4xVDGiPKzSCa+6
=TBcf
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
