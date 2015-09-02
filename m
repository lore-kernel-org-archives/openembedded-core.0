Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7DED57704A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:00:16 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so22637039wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=3rhEzLaBty4/OUNHap8eVJ79Dl3vpFX+9NVN2b5+brk=;
	b=XUZbSsnlxTjEGlLEWmbDJXRsZPvYHuhthk9w8xSNWxylSVEKRvrcej2Ev3yExD0Q46
	w96MtUlq2NH3c5reoBXNRYJ928zAuJE6QCnll3GKf4KOSjKxXqDcR6GmLwePWjU0hBje
	zeIRjQjZgMOiMp/X8GH8dDGBUOMOVt8qHBnLkE5zkHnJIFCnsF6O68dVMmJrg8wrPHAW
	b+1+zyPJ7LEqnNa4w2KulDEHC/KfXZaA5x1/K1Rq8/4mo8z1lEzDfgwdC1C8IpWAUx9F
	2VD5hpJRlziZX8dogQFDXTOC/vMJlNUTlortaTEhT0hMgg2GljNbfxt+APgX+2+8F16P
	DA7Q==
X-Received: by 10.194.112.104 with SMTP id ip8mr40490377wjb.131.1441209615239; 
	Wed, 02 Sep 2015 09:00:15 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ja8sm33061864wjb.13.2015.09.02.09.00.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 09:00:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 18:00:35 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150902160035.GD2470@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Robert Yang : perf: fix for rebuilding
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
X-List-Received-Date: Wed, 02 Sep 2015 16:00:16 -0000
X-Groupsio-MsgNum: 70505
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline

--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm still seeing issues when perf is rebuilt

The original issue was:
OSError: [Errno 2] No such file or directory: 'BUILD/work/qemux86-webos-lin=
ux/perf/1.0-r9/perf-1.0'

as described here:
http://patches.openembedded.org/patch/94719/

First part of fix is now backported to dizzy:
commit 40aeb23c427e0c56f7073fc54ea63bf0eabbe092
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Mar 11 01:35:38 2015 -0700

    license.bbclass: set dirs for do_populate_lic_setscene

but perf is still failing in some builds with the same error when
do_configure and do_populate_lic are executed at the same time:

NOTE: recipe perf-1.0-r9: task do_configure: Started
NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
ERROR: Build of do_populate_lic failed
ERROR: Traceback (most recent call last):
  File "bitbake/lib/bb/build.py", line 497, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "bitbake/lib/bb/build.py", line 440, in _exec_task
    exec_func(func, localdata)
  File "bitbake/lib/bb/build.py", line 212, in exec_func
    exec_func_python(func, d, runfile, cwd=3Dadir)
  File "bitbake/lib/bb/build.py", line 237, in exec_func_python
    os.chdir(cwd)
OSError: [Errno 2] No such file or directory: '....../perf/1.0-r9/perf-1.0'

NOTE: recipe perf-1.0-r9: task do_populate_lic: Failed
ERROR: Task 3826 (../oe-core/meta/recipes-kernel/perf/perf.bb, do_populate_=
lic) failed with exit code '1'
NOTE: recipe perf-1.0-r9: task do_configure: Succeeded

So is there some 2nd/3rd part of this fix or is it broken in master?

I haven't found any other commit related to this perf configure or
populate_lic in master and fido.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXnHPMACgkQN1Ujt2V2gBzGXgCggWTa1gnIONiL5yuR6sen3lNu
euIAoK+gZCAWfC/xthmSSR79Rf3gHMAK
=+EOU
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
