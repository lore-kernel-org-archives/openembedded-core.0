Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 11ACD73243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:04:58 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so28840336wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LV3xTBtTc3lsgS9Q2n0RNVzNz/WKgF3o7Y3j4Z3doTo=;
	b=v+EmFSmwvJM3RXIbxqptYCOiAwUnKMwX5tJRyAyrfd3JA1+xPrJYHYCCRUYA1BCSCV
	yCxCvNv05f2l0QaYblJDVvFim6YwsSjliL+ip8qyadE8fVScqPMlFuqeztk8QUgVrUt6
	GsMmlaN6S5zzVslOFiD1e/5bAxVyJPl6RNVPu5bavyRTy7bITgh+iFG7RKK0DBdAjnNV
	2mbnUrov/g8RemqGxIaGswRVhtgTRRa61kq4Wipynj2JAVqvRCE5ta0lw8jVjdsux1c/
	MlqN7ixhHcQxvB1yFU5xO4sFhpIF5IDMDlvE2V3OWFPIatkHVXQurKdzEeXjz2+uuV7q
	byRA==
X-Received: by 10.180.10.8 with SMTP id e8mr7511553wib.22.1441901098586;
	Thu, 10 Sep 2015 09:04:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	db8sm16380126wjb.41.2015.09.10.09.04.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 09:04:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Sep 2015 18:05:57 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150910160557.GD2387@jama>
References: <20150902160035.GD2470@jama>
MIME-Version: 1.0
In-Reply-To: <20150902160035.GD2470@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 10 Sep 2015 16:04:59 -0000
X-Groupsio-MsgNum: 70973
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline

--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 06:00:35PM +0200, Martin Jansa wrote:
> I'm still seeing issues when perf is rebuilt
>=20
> The original issue was:
> OSError: [Errno 2] No such file or directory: 'BUILD/work/qemux86-webos-l=
inux/perf/1.0-r9/perf-1.0'
>=20
> as described here:
> http://patches.openembedded.org/patch/94719/
>=20
> First part of fix is now backported to dizzy:
> commit 40aeb23c427e0c56f7073fc54ea63bf0eabbe092
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Wed Mar 11 01:35:38 2015 -0700
>=20
>     license.bbclass: set dirs for do_populate_lic_setscene
>=20
> but perf is still failing in some builds with the same error when
> do_configure and do_populate_lic are executed at the same time:
>=20
> NOTE: recipe perf-1.0-r9: task do_configure: Started
> NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
> ERROR: Build of do_populate_lic failed
> ERROR: Traceback (most recent call last):
>   File "bitbake/lib/bb/build.py", line 497, in exec_task
>     return _exec_task(fn, task, d, quieterr)
>   File "bitbake/lib/bb/build.py", line 440, in _exec_task
>     exec_func(func, localdata)
>   File "bitbake/lib/bb/build.py", line 212, in exec_func
>     exec_func_python(func, d, runfile, cwd=3Dadir)
>   File "bitbake/lib/bb/build.py", line 237, in exec_func_python
>     os.chdir(cwd)
> OSError: [Errno 2] No such file or directory: '....../perf/1.0-r9/perf-1.=
0'
>=20
> NOTE: recipe perf-1.0-r9: task do_populate_lic: Failed
> ERROR: Task 3826 (../oe-core/meta/recipes-kernel/perf/perf.bb, do_populat=
e_lic) failed with exit code '1'
> NOTE: recipe perf-1.0-r9: task do_configure: Succeeded
>=20
> So is there some 2nd/3rd part of this fix or is it broken in master?
>=20
> I haven't found any other commit related to this perf configure or
> populate_lic in master and fido.

It's still broken in master.

Easy way to reproduce this is:
OE qemux86@ ~/build/oe-core $ for i in `seq -w 1 100`; do bitbake -c cleans=
state perf; bitbake -c build perf | tee log.perf.$i; done

On slow machine I got first failure on 60th iteration, on
much faster machine I got 4 failures in first 20 iterations.

NOTE: recipe perf-1.0-r9: task do_configure: Started
NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
ERROR: Function failed: do_configure (log file is located at /OE/build/oe-c=
ore/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/temp/log.do_configure.10700)
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/qemux=
86-oe-linux/perf/1.0-r9/temp/log.do_configure.10700
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| mkdir: cannot create directory '/OE/build/oe-core/tmp-glibc/work/qemux86-=
oe-linux/perf/1.0-r9/perf-1.0/': File exists
| WARNING: /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/te=
mp/run.do_configure.10700:1 exit 1 from
|   mkdir /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/per=
f-1.0/
| ERROR: Function failed: do_configure (log file is located at /OE/build/oe=
-core/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/temp/log.do_configure.107=
00)
NOTE: recipe perf-1.0-r9: task do_configure: Failed
ERROR: Task 5 (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf=
/perf.bb, do_configure) failed with exit code '1'
NOTE: recipe perf-1.0-r9: task do_populate_lic: Succeeded
NOTE: Tasks Summary: Attempted 833 tasks of which 828 didn't need to be rer=
un and 1 failed.

Can you please fix it properly instead of removing whole ${B}?

do_configure_prepend () {
    # Fix for rebuilding
    rm -rf ${B}/
    mkdir ${B}/
=2E..

I wish there is easier way to undo this commit in .bbappend, we very
rarely rebuild perf in the same build directory, but too often we see
normal clean builds failing in perf do_configure or do_populate_lic tasks :=
/.

Regards and thanks for feedback (it's broken for 8 months and no reply
after it was reported 3 months ago).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXxqmQACgkQN1Ujt2V2gBx67gCeIFoJQVRw+nWFX5BarHEsi1ni
6hwAn0ymCxqeKQJBXe+9NFuD2jEST7Qe
=PCaH
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
