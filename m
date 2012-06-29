Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkRPc-000539-N3
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 04:58:24 +0200
Received: by dalh21 with SMTP id h21so3613362dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 19:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=PQiNXfDbv4C9Z88+9GRXhwFcHawFmsP/SNf1pNVXgCM=;
	b=wH4Zl6R0xG8fVE8C8B6vKfk/aBGePvDdhr9QbxEl3DoNng32EfZ9879hE8vQu1aU/d
	6+RVZ80TWOKxNYPtTdjRCHcC0aTcI09uGj31gelREmLYCKRNmw/WPkUuIzIgTgLGmDGD
	K+ckSW427Z1g0Og2SFJz2miz/rr89/HctFQpVB7iSvTT1K/axhSsHKnLfsMChSL8MX87
	MGIkb+ETF+HkMZIOWA/3JERCv+PyYG/29xJh9NKETKus4Ml/bSYNO3f+Fc8W7GiDQmw9
	pqcWUOPMpDAf0iVXOzkzdJ/hBJMfxYitqMpFNf+zMScTpcUSx94WrhEp9kcXThZVfJWh
	aptA==
Received: by 10.68.223.129 with SMTP id qu1mr587092pbc.165.1340938048147;
	Thu, 28 Jun 2012 19:47:28 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id jv6sm3943419pbc.40.2012.06.28.19.47.25
	(version=SSLv3 cipher=OTHER); Thu, 28 Jun 2012 19:47:26 -0700 (PDT)
Message-ID: <4FED1743.4050203@gmail.com>
Date: Thu, 28 Jun 2012 19:47:31 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
	<1fb664d76463830cf80997e2e13891adfff7a6eb.1340908084.git.paul.eggleton@linux.intel.com>
In-Reply-To: <1fb664d76463830cf80997e2e13891adfff7a6eb.1340908084.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 3/3] apr: fix incorrect size of pid_t
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
X-List-Received-Date: Fri, 29 Jun 2012 02:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/28/2012 11:29 AM, Paul Eggleton wrote:
> If cross-compiling, apr's configure script assumes that pid_t is 
> 64-bit which is wrong - it appears that 32-bit is a safe
> assumption for Linux, so use that instead.
> 
> This fixes Apache writing garbage to its pid file when built using
> apr produced from this recipe.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> --- 
> meta/recipes-support/apr/apr_1.4.6.bb |    4 +++- 1 file changed, 3
> insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/apr/apr_1.4.6.bb
> b/meta/recipes-support/apr/apr_1.4.6.bb index 54c47fe..8af5411
> 100644 --- a/meta/recipes-support/apr/apr_1.4.6.bb +++
> b/meta/recipes-support/apr/apr_1.4.6.bb @@ -9,7 +9,7 @@
> LIC_FILES_CHKSUM =
> "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
> 
> BBCLASSEXTEND = "native"
> 
> -PR = "r0" +PR = "r1"
> 
> SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \ 
> file://configure_fixes.patch \ @@ -23,6 +23,8 @@ inherit autotools
> lib_package binconfig multilib_header
> 
> OE_BINCONFIG_EXTRA_MANGLE = " -e
> 's:location=source:location=installed:'"
> 
> +EXTRA_OECONF_append_class-target = " ac_cv_sizeof_pid_t=4" +

I think this may not be correct thing for 64bit targets. You are
better of adding this to appropriate site files.


> do_configure_prepend() { cd ${S} ./buildconf
> 


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/tF0MACgkQuwUzVZGdMxSXNACfUhw2qkbBYBL/mBIvJ5zwIla7
ojoAoICsjsBSRzJlS7s6Qg3i8Ze+NBQo
=yxut
-----END PGP SIGNATURE-----


