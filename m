Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Smtrm-0006gw-Kg
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 23:45:38 +0200
Received: by pbbrq2 with SMTP id rq2so12977879pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 14:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=iKpFp7LXNhP3+gzbsgsG71f+WaIUXLua/OMYckoew7k=;
	b=og3lBsoEmT9UQJtrfXGGbU8RqQmdXU4CUsiRlddSalO0YXvlnkDZLpIEwcTYus4P64
	3lf1zTfYSPlLn0Pm0keqOhyB/qqTvK6eiMjRUhhvy1Anf9+UmE3uKJB876bITqRZJE2v
	A3kgtKpRpyfUjn25sgdwY94m51VhOUcLKEDusjIP781oE7tA+b/5O23cWrk8oBpYtMaX
	cGYZTNsEhNy2nGcx+t3CiCwsayd+qM5L7dNdEBMXdfCdtkRu6YvHG47H6kRwpH9557D4
	H7OGrD5cMMD/czDeHD0T+aQzRqfRGo8OGLZTgn5qaYo4Cxvnyw4x7PsS2pNFUx4GbRq4
	wUYg==
Received: by 10.68.190.102 with SMTP id gp6mr31164206pbc.5.1341524072928;
	Thu, 05 Jul 2012 14:34:32 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id rv9sm20445017pbc.43.2012.07.05.14.34.31
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2012 14:34:32 -0700 (PDT)
Message-ID: <4FF6086A.9000500@gmail.com>
Date: Thu, 05 Jul 2012 14:34:34 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1341498745.git.raj.khem@gmail.com>
	<20120705202306.GD3708@jama.jama.net>
	<CAMKF1sr7c4c3vk3DsJCM-usUD9zvSdgrZKCM0OxKfnQWLPaeZw@mail.gmail.com>
	<20120705205709.GE3708@jama.jama.net>
In-Reply-To: <20120705205709.GE3708@jama.jama.net>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH 00/14] eglibc 2.16
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
X-List-Received-Date: Thu, 05 Jul 2012 21:45:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/5/2012 1:57 PM, Martin Jansa wrote:
> I was looking in meta/recipes-core/eglibc for switch forcing bfd
> for it, but I haven't found it neither in 2.15 or 2.16..

STAGINGCC is gcc-cross-intermediate for eglibc and gcc-cross-initial
for eglibc-initial

and if you look at gcc-cross-intermediate recipe then it uses

in EXTRA_OECONF

${@base_contains('DISTRO_FEATURES', 'ld-is-gold',
'--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"

which means it use ld.bfd when ld-is-gold is enabled.

however we need something similar for gcc-cross-initial as well
and thats why you see the problem with eglibc-initial

I have created a patch and added it to the pull branch please
try that out

especially this one
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/eglibc-2.16&id=3b68cb3e23138c72e61771c50a4a4b08bb4d0865

Thanks
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/2CGoACgkQuwUzVZGdMxSiXQCfT+LaNCf9iZAK1tr2fNsX8opW
MAIAnihWe8FauLk+y3gmLMHcg8e+MfIf
=m9f1
-----END PGP SIGNATURE-----


