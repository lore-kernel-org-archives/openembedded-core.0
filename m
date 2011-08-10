Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QrA65-0003y0-Jm
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 16:49:29 +0200
Received: by yia28 with SMTP id 28so698672yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=ErIHXs4rHDT8Hvv+7xO+3RmLN0YKM5uWPp/7WWgBAhc=;
	b=EaOmLWpbOk5PEbPWJDqS7ZyP7W1HulLV+BkX/Tf5mzg01QWOywHBzhaEYu6vD2/smu
	XsT/buKGY5mtFP2vOxoWz90TNIbaMGkt6xECTyHeicmV/JOfAbxeCfR9FLQg5xg1dNak
	bcj3h3xpvub9Z607Usg0/lgmLy/SD0nQp7ndo=
Received: by 10.42.197.3 with SMTP id ei3mr6912968icb.332.1312987496717;
	Wed, 10 Aug 2011 07:44:56 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 3sm771944ibm.27.2011.08.10.07.44.55
	(version=SSLv3 cipher=OTHER); Wed, 10 Aug 2011 07:44:55 -0700 (PDT)
Message-ID: <4E429966.3030607@gmail.com>
Date: Wed, 10 Aug 2011 07:44:54 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
	<1312898286.14274.298.camel@rex>
	<2C6C8741-1012-47BC-BDA9-2A02A08C5027@kernel.crashing.org>
	<822AACC4-810B-4113-A214-EE283679EA06@kernel.crashing.org>
In-Reply-To: <822AACC4-810B-4113-A214-EE283679EA06@kernel.crashing.org>
X-Enigmail-Version: 1.2pre
Subject: Re: python automake dirs (was meta-toolchain-sdk failure)
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
X-List-Received-Date: Wed, 10 Aug 2011 14:49:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> So the root of this seems to stem from the following in automake's
> python.m4:
> 
> am_cv_python_pythondir=$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages
>
> 
am_cv_python_pyexecdir=$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages
> 
> So the question at hand is how to fix this?
> 
> Do we patch automake to respect libdir setting for these?
> 

yes seems sane to me

> something like:
> 
> --- python.m4.orig	2011-08-09 11:46:19.511163337 -0500 +++ python.m4
> 2011-08-09 11:49:43.623022930 -0500 @@ -88,12 +88,13 @@ 
> [am_cv_python_version=`$PYTHON -c "import sys;
> sys.stdout.write(sys.version[[:3]])"`]) AC_SUBST([PYTHON_VERSION],
> [$am_cv_python_version])
> 
> -  dnl Use the values of $prefix and $exec_prefix for the
> corresponding -  dnl values of PYTHON_PREFIX and PYTHON_EXEC_PREFIX.
> These are made +  dnl Use the values of $prefix, $libdir and
> $exec_prefix for the corresponding +  dnl values of PYTHON_PREFIX
> PYTHON_LIB_PREFIX, and PYTHON_EXEC_PREFIX.  These are made dnl
> distinct variables so they can be overridden if need be.  However, 
> dnl general consensus is that you shouldn't need this ability.
> 
> AC_SUBST([PYTHON_PREFIX], ['${prefix}']) +
> AC_SUBST([PYTHON_LIB_PREFIX], ['${libdir}']) 
> AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
> 
> dnl At times (like when building shared libraries) you may want @@
> -122,7 +123,7 @@ am_py_prefix=$prefix fi 
> am_cv_python_pythondir=`$PYTHON -c "import sys; from distutils import
> sysconfig;
> sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='$am_py_prefix'))"
> 2>/dev/null || -     echo
> "$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages"` +     echo
> "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"` case
> $am_cv_python_pythondir in $am_py_prefix*) am__strip_prefix=`echo
> "$am_py_prefix" | sed 's|.|.|g'` @@ -132,7 +133,7 @@ case
> $am_py_prefix in /usr|/System*) ;; *) -
> am_cv_python_pythondir=$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages
>
> 
+	
am_cv_python_pythondir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
> ;; esac ;; @@ -160,7 +161,7 @@ am_py_exec_prefix=$exec_prefix fi 
> am_cv_python_pyexecdir=`$PYTHON -c "import sys; from distutils import
> sysconfig;
> sys.stdout.write(sysconfig.get_python_lib(1,0,prefix='$am_py_exec_prefix'))"
> 2>/dev/null || -     echo
> "$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages"` +
> echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"` case
> $am_cv_python_pyexecdir in $am_py_exec_prefix*) 
> am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'` @@
> -170,7 +171,7 @@ case $am_py_exec_prefix in /usr|/System*) ;; *) -
> am_cv_python_pyexecdir=$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages
>
> 
+	
am_cv_python_pyexecdir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
> ;; esac ;;
> 
> 
> 
> - k _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


- --
> 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5CmWUACgkQuwUzVZGdMxRKIwCeIMURyalficv+nODveSc0q1uE
ldkAnjBjNrI7Un528uulbm4sowLgiclj
=AyDt
-----END PGP SIGNATURE-----


