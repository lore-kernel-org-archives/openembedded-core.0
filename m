Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8921276DE1;
	Tue, 10 Nov 2015 09:33:34 +0000 (UTC)
Received: by wmww144 with SMTP id w144so109177873wmw.1;
	Tue, 10 Nov 2015 01:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ksXksh+fpFBdNQpjQl8GwiIYeOGj1v364GbMY8h13t0=;
	b=cLBa+/xITEiSLceTN4umssz82HKIfCMm/3cVBJfC2Qj6rbUHGb530tPRcATeY0ds3/
	uRo2C/f5ejXbwxM68n4LuKgONQcGXVn/8iUU6A4sENDLNKkw0UIwnIwwpeQFfcmHMMgj
	bENDaLnBnpkBFw5hjEv7inrnyB0mNw/SeiZAsIaSA5PsVOT/034nbRYnDnZa9XonUA8z
	7pTg7di1S4YvHlZ4v0uZ+DOuk1+bXTAUYomRTtlIaiG28tkVX51K+sSR4auW3S0EpwUD
	XbuwsxM2XZxTW/gMhy+JO9DYYhCicE+GA6mt1xWAysh5vPVGHNzOpW4tgxz2cFS1yr73
	kP8A==
X-Received: by 10.28.182.11 with SMTP id g11mr3700837wmf.42.1447148014745;
	Tue, 10 Nov 2015 01:33:34 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	t126sm3040129wmd.23.2015.11.10.01.33.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 01:33:34 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CADkTA4MMRESA2E2H_0iruywU6AgzSwaZ8Sj03SBB25=ckGv41Q@mail.gmail.com>
Date: Tue, 10 Nov 2015 10:33:32 +0100
Message-Id: <E48EA04B-494B-4D42-999B-A99E70ED7A0C@gmail.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<20151014193033.GD3552@dent.vctlabs.com>
	<CADkTA4MMRESA2E2H_0iruywU6AgzSwaZ8Sj03SBB25=ckGv41Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [oe] kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Tue, 10 Nov 2015 09:33:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 14.10.2015 um 21:48 schrieb Bruce Ashfield =
<bruce.ashfield@gmail.com>:
>=20
> On Wed, Oct 14, 2015 at 3:30 PM, S. Lockwood-Childs <sjl@vctlabs.com> =
wrote:
>> http://patchwork.openembedded.org/patch/99875/
>>=20
>> Apparently this patch is still not in master, and I just ran across =
the
>> problem with an externally built module (omaplfb from =
omap3-sgx-modules)
>> in meta-ti layer.
>>=20
>> What's the plan for getting a correct Module.symver into =
shared_workdir
>> for external modules to build against? Above patch, or does someone =
have
>> an even better idea?
>=20
> Richard and I sync'd on this while in Dublin @ ELCe, and the changes
> aren't missing
> from master by mistake .. but more because we are still working to =
come up with
> a comprehensive solution (tracked in bugzilla).
>=20
> The solution is pretty much what I described before, we are balancing
> applications
> and tasks that do not need kernel modules to be built, versus external =
modules
> that depend on symbols from other modules. The devil is in the
> details, and getting
> a non-racy, task locked solution that allows the recipe writer to
> explicitly decide
> whether they need modules built or not .. attempts at detecting the
> need, or forcing
> a one size fits all solution have all lead to dead ends.
>=20
> Since we are close to a release point, I'm still working on this out
> of the tree, and
> will propose some changes when the tree looks stable.
>=20
> For now, you can carry the patch locally, or you can append to the =
kernel module
> compilation task and do a second copy of the symvers file to the share
> directory.
>=20
> i.e. a variant of this:
> http://patchwork.openembedded.org/patch/94891/, done in a
> bbappend versus the class.
>=20
> Cheers,
>=20
> Bruce

This is kind of insane to try a fix duplicating a job in a probably =
wrong way
(even a tiny) because of performance issue.

Any 3rd party kernel module depends on do_shared_workdir - so =
do_shared_workdir
must wait for do_compile_kernelmodules - that's it by design (build is =
done
relying on dependencies ordered in a directed, noncyclical graph.

Since compile_kernelmodules is between compile and strip, I vote for

$ git diff
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5e8b6cf..49d7561 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -253,7 +253,7 @@ kernel_do_install() {
 }
 do_install[prefuncs] +=3D "package_get_auto_pr"

-addtask shared_workdir after do_compile before do_compile_kernelmodules
+addtask shared_workdir after do_compile_kernelmodules before do_strip
 addtask shared_workdir_setscene

 do_shared_workdir_setscene () {

But that's surely kind of smell, whether before do_strip and do_install =
is
preferred. Mandatory is, that do_shared_workdir must not be processed =
before
do_compile_kernelmodules finishes.

There is no way to avoid it, and if those 5 seconds slow down your =
build,
there is probably another thing which should be fixed.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


