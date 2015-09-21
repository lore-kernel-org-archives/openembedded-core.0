Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 108DD60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 19:04:29 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so125926082wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4VUPIkojaiRhUhV2/TG1pbl4l+9IWu8XH/Bub9bzKbM=;
	b=kMpDo13lonCaPSF7YMhBquAzhzJXQFcQcJBO7fVcUdwJBFy9tHDIx+O1II0SPMJeop
	r7hCFIv4yberCjjHUCoL6lWkpGQbj/GZLgOKLm7avDuRU8cSylTfcYihJFpbmvPgBGx8
	yz7hkFkhWf+Q9kQ4bAoY5LrtpN1/1xpYvWgzxTevHis0rEAAQM6kGavf8drKGhiz5KYn
	wWbyZRaGxD2mInadRPRqgriLf+AMN4eXsdIcjFRu457SvWLcKU91e0zMSKGRe6bQ7Kbo
	rgmM62evxq42kdtbNkzSKNaO4nKllL6xur5um6zbmuMR0UWUfMhhvOtEo2rx5IKG7LqU
	xyCQ==
X-Received: by 10.194.84.129 with SMTP id z1mr28006409wjy.17.1442862269097;
	Mon, 21 Sep 2015 12:04:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hk5sm25552415wjb.6.2015.09.21.12.04.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 12:04:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Sep 2015 21:04:22 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150921190422.GA28765@jama>
References: <20150910160557.GD2387@jama>
	<1442294991-12427-1-git-send-email-Martin.Jansa@gmail.com>
	<55F7B25B.6030801@windriver.com> <55F91EEA.8040005@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55F91EEA.8040005@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master][fido][dizzy] Revert "perf: fix for rebuilding"
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
X-List-Received-Date: Mon, 21 Sep 2015 19:04:32 -0000
X-Groupsio-MsgNum: 71391
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2015 at 03:48:58PM +0800, Robert Yang wrote:
>=20
> Hi Martin,
>=20
> I've figured out the reason, this is because the task's default cwd
> is ${B}, the easier way to fix the problem is use mkdir -p rather than
> mkdir, autotools.bbclass also has this problem, but I'd like to fix
> exec_func, I will send a patch to bitbake-devel after more testing.

Unfortunately "mkdir -p" fixes only part of this problem, it still fails
quite often when bitbake tries to "os.chdir(cwd)" in populate_lic
after do_configure removed ${B} and before do_configure re-created it
with "mkdir -p".

So 3 from 50 iterations (if I use the same for cycle to test this) fail
with:

NOTE: recipe perf-1.0-r9: task do_configure: Started
NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
ERROR: Build of do_populate_lic failed
ERROR: Traceback (most recent call last):
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 553, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 493, in _exec_task
    exec_func(func, localdata)
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 227, in exec_func
    exec_func_python(func, d, runfile, cwd=3Dadir)
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 252, in exec_func_=
python
    os.chdir(cwd)
OSError: [Errno 2] No such file or directory: '/OE/build/oe-core/tmp-glibc/=
work/qemux86-oe-linux/perf/1.0-r9/perf-1.0'

NOTE: recipe perf-1.0-r9: task do_populate_lic: Failed
ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf=
/perf.bb, do_populate_lic) failed with exit code '1'
NOTE: recipe perf-1.0-r9: task do_configure: Succeeded


or even longer exception:

NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
NOTE: recipe perf-1.0-r9: task do_configure: Started
ERROR: Error executing a python function in /OE/build/oe-core/openembedded-=
core/meta/recipes-kernel/perf/perf.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'sstate_task_postfunc', lineno: 14, function: <module>
     0010:    sstate_package(shared_state, d)
     0011:    os.umask(omask)
     0012:
     0013:
 *** 0014:sstate_task_postfunc(d)
     0015:
File: 'sstate_task_postfunc', lineno: 4, function: sstate_task_postfunc
     0001:
     0002:def sstate_task_postfunc(d):
     0003:    shared_state =3D sstate_state_fromvars(d)
 *** 0004:    sstate_install(shared_state, d)
     0005:    for intercept in shared_state['interceptfuncs']:
     0006:        bb.build.exec_func(intercept, d)
     0007:    omask =3D os.umask(002)
     0008:    if omask !=3D 002:
File: 'sstate.bbclass', lineno: 113, function: sstate_install
     0109:        if os.path.exists(state[1]):
     0110:            oe.path.copyhardlinktree(state[1], state[2])
     0111:
     0112:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '')=
=2Esplit():
 *** 0113:        bb.build.exec_func(postinst, d)
     0114:
     0115:    for lock in locks:
     0116:        bb.utils.unlockfile(lock)
     0117:
File: '/OE/build/oe-core/bitbake/lib/bb/build.py', lineno: 227, function: e=
xec_func
     0223:                pass
     0224:
     0225:    with bb.utils.fileslocked(lockfiles):
     0226:        if ispython:
 *** 0227:            exec_func_python(func, d, runfile, cwd=3Dadir)
    0228:        else:
     0229:            exec_func_shell(func, d, runfile, cwd=3Dadir)
     0230:
     0231:_functionfmt =3D """
File: '/OE/build/oe-core/bitbake/lib/bb/build.py', lineno: 252, function: e=
xec_func_python
     0248:        try:
     0249:            olddir =3D os.getcwd()
     0250:        except OSError:
     0251:            olddir =3D None
 *** 0252:        os.chdir(cwd)
     0253:
     0254:    bb.debug(2, "Executing python function %s" % func)
     0255:
     0256:    try:
Exception: OSError: [Errno 2] No such file or directory: '/OE/build/oe-core=
/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/perf-1.0'

ERROR: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/qemux=
86-oe-linux/perf/1.0-r9/temp/log.do_populate_lic.16588
NOTE: recipe perf-1.0-r9: task do_populate_lic: Failed
ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf=
/perf.bb, do_populate_lic) failed with exit code '1'
NOTE: recipe perf-1.0-r9: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 840 tasks of which 835 didn't need to be rer=
un and 1 failed.

So this revert (or more complete fix) is still needed in master, fido and d=
izzy.

Regards,

>=20
> // Robert
>=20
> On 09/15/2015 01:53 PM, Robert Yang wrote:
> >
> > Hi Martin,
> >
> > Sorry, I'm blocked by mutitlib SDK issues recently, I will fix it soone=
r.
> > Revert the patch is fine to me if it is urgent.
> >
> > // Robert
> >
> > On 09/15/2015 01:29 PM, Martin Jansa wrote:
> >> * This reverts commit 9dafa571ed0a40d21a886dec7704c31150b21942.
> >>
> >> * The "fix" is causing more issues then it's fixing and there was no
> >>    feedback in many months.
> >> * More info:
> >>
> >> http://lists.openembedded.org/pipermail/openembedded-core/2015-June/10=
5684.html
> >>
> >> http://lists.openembedded.org/pipermail/openembedded-core/2015-Septemb=
er/109870.html
> >>
> >>
> >> http://lists.openembedded.org/pipermail/openembedded-core/2015-Septemb=
er/110338.html
> >>
> >>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >>   meta/recipes-kernel/perf/perf.bb | 4 ----
> >>   1 file changed, 4 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/pe=
rf/perf.bb
> >> index adb3a2c..f1d7894 100644
> >> --- a/meta/recipes-kernel/perf/perf.bb
> >> +++ b/meta/recipes-kernel/perf/perf.bb
> >> @@ -118,10 +118,6 @@ do_install() {
> >>   }
> >>
> >>   do_configure_prepend () {
> >> -    # Fix for rebuilding
> >> -    rm -rf ${B}/
> >> -    mkdir ${B}/
> >> -
> >>       # If building a multlib based perf, the incorrect library path w=
ill be
> >>       # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64)=
=2E In a
> >> 32 bit
> >>       # build, with a 64 bit multilib, the arch won't match and the de=
tection
> >> of a
> >>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYAVLUACgkQN1Ujt2V2gBxW+QCfYJDK7dgYcHE9svhW9tqEkDF+
bwwAoKxqSfxfbPgaemDE35TuIFx3qw96
=z2o5
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
