Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69806C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:20:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.57280.1699283997330815589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QuxWteVF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso33213485e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699283995; x=1699888795; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VK82E+kUFrsNarP6VasZrFw6q+599KoRHn69Lu1P5is=;
        b=QuxWteVF1Ts4cM6U0UvFiz4Otc0LI6UnE/fjFih7YNanOJYUBQnFlOYdEWVD8rW2bv
         ie0rBKIArFa4MrNYqLrNKwXByoBkSq0EC5Z0cDoExlxis1cVptL2YX8j7rny4S37ju4Y
         HkhiMEwUweHFR6rSDSWEDWZusLq+MTwTNhHxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283995; x=1699888795;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VK82E+kUFrsNarP6VasZrFw6q+599KoRHn69Lu1P5is=;
        b=jLOKnDZks6Xz0eNPS4mj9GrEYHjCPNvcSkhev7r5DIZVFPO1Szfp17th5hMLbDBzHE
         L2Y4qiP+r45z32LsVcXkw0//7HrHOvg72sr9dcHCcb/EYQGpGk92Ny/we2lUX30Nk2Jb
         DYYKrUkJmI8SbYcc9Kv1cRsVi/xoTQ3pbYBRu3gr2Av2sT13pvs3IrdXLjt5LnoUfXt2
         l6wO/H2iZs44sP1eXy4Aryso6IKkm3jv80p/PaM2yv/1LUuDii+IFnIl9Wb10AqN71th
         vKag/SrpstGRycGdLsj8KHEpd0QJw56bffX62vu09NAN1NxmMwhXDxUmrgCA+2RLQO5g
         ce6w==
X-Gm-Message-State: AOJu0Yzv1VTIKgnZBH6XozbRq5Bz78I8NW8UHK6OrywFWE7gA+/3hzNJ
	9bS+9vHe8AKDXhxOWM8eYBQ6iw==
X-Google-Smtp-Source: AGHT+IEixYPeMT1UhsiPWFrWH/C/i0rgmbIA8cbq4SEOPCtpaS+ArlNdhOB6HVYkWVV9Kb1Wda/B+Q==
X-Received: by 2002:a05:6000:1e98:b0:32f:64f2:815 with SMTP id dd24-20020a0560001e9800b0032f64f20815mr8402442wrb.33.1699283995365;
        Mon, 06 Nov 2023 07:19:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id k18-20020adff292000000b0032f7fab0712sm9740958wro.52.2023.11.06.07.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:19:54 -0800 (PST)
Message-ID: <141d0b5daed2a4654c8defe070ad4bcf8cc3e705.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 06 Nov 2023 15:19:54 +0000
In-Reply-To: <17950980CB694D6A.12603@lists.openembedded.org>
References: <20231026103320.2751277-1-alex@linutronix.de>
	 <17950980CB694D6A.12603@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190228

On Mon, 2023-11-06 at 12:47 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-10-26 at 12:33 +0200, Alexander Kanavin wrote:
> > > 'bitbake -S printdiff' is a useful diagnostic facility for finding ou=
t
> > > why sstate is not being reused, but until now it had no tests that wo=
uld
> > > ensure it works. This commit adds three basic scenarios:
> > >=20
> > > 1. make a change in a really basic, common recipe that is at the very=
 root
> > > of dependency trees (quilt-native), and ensure that change is correct=
ly discovered when
> > > building an image.
> > >=20
> > > 2. make a change in gcc-source recipe, which is somewhat special
> > > (operates in work-shared), and ensure that gcc-runtime builds track
> > > that down as well.
> > >=20
> > > 3. make a change in base_do_configure() definition from base.bbclass,
> > > which is not recipe-specific, but affects many basic recipes, and ens=
ure that
> > > is correctly reported as well.
> > >=20
> > > The test itself actually runs twice:
> > > - first against a fully populated build directory, where
> > > the printdiff code is guaranteed to find the correct previous
> > > stamp that can be compared with in a predictable manner.
> > >=20
> > > - then in an empty build directory where the printdiff code
> > > goes to look in the sstate cache, and so the existence of the
> > > previous signature can be tested, but not the difference with it
> > > (what the exact difference would be is unpredictable as the
> > > sstate cache is indeed shared between many builds).
> > >=20
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>=20
> There have been autobulilder failures from the do_configure base change
> and we've not been quite sure why.=C2=A0The summary below took quite a bi=
t
> of digging but seems quite simple when written up like this!
>=20
> If you dig into a failure like:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2379/s=
teps/15/logs/stdio
>=20
> you see messages like:
>=20
> The differences between the current build and any cached tasks start at t=
he following tasks:
> /home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-devto=
ols/quilt/quilt-native_0.67.bb:do_collect_spdx_deps
> virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/met=
a/recipes-devtools/gnu-config/gnu-config_git.bb:do_configure
> virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/met=
a/recipes-core/zlib/zlib_1.3.bb:do_collect_spdx_deps
> virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/met=
a/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_collect_spdx_deps
> /home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-exten=
ded/timezone/tzcode-native.bb:do_prepare_recipe_sysroot
>=20
> which seems odd. Taking the first one, if quilt-native has built, you'd
> expect those to be present.
>=20
> I went onto the arm builder and tried a "bitbake quilt-native -S printdif=
f -DDD":
>=20
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/4d/8d/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:4d8da10af56c40d61adb5febb96f583a399ceb276d0dc13e61971f1eb0b7d81d_c=
reate_runtime_spdx.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/85/79/sstate:quilt-native::0.67:r0::11:85794fd6d83b61cb273e4=
d14f6e3581d7fa4ec743b455f1d21786cff032c262c_patch.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/b8/fb/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:b8fbbfbafeb7cdf333f1766d6b3c94822a21d42145e17377bede29e44a86a14d_p=
repare_recipe_sysroot.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/fe/ae/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:feae04b2abf592e3df83d0dcac1f74399e342ba99c718975d34b8a27e07eeca5_c=
onfigure.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/f5/98/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:f598fad5807fabde02cd16e5f7f26b486d0b5f87dec6ff3c3d5378ba68780ff1_i=
nstall.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/e2/a4/sstate:quilt-native::0.67:r0::11:e2a41fd44aa7736bd318e=
c9c4a6b91e4b80563ba213035afe3df3cb96fdf7aaf_fetch.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/da/07/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:da07e6362c0b01fc2798456aa1319e2343a556e33d0857f90a129701eaa722b2_d=
eploy_source_date_epoch.tar.zst.siginfo
> DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuild=
er.yocto.io/pub/sstate/universal/72/12/sstate:quilt-native:aarch64-linux:0.=
67:r0:aarch64:11:7212eff5f191def566b82db976b37e1efcb0a8ccd964eff5b5682b651b=
7cb7fa_collect_spdx_deps.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/73/96/sstate:quilt-native::0.67:r0::11:7396e70fb1865087409e4=
54eb8bacae3bcb4add6218b3cd707d2e96880b72936_populate_lic.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/9f/8e/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:9f8e9e5303322240b173483312d885144dfdf2228698868857a281b510ec3214_r=
ecipe_qa.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/fd/c4/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:fdc40ea4bffb4485bdbb3c38a13b4e5d8d94d1c2cdb66c8659fe5f758a3530a3_p=
opulate_sysroot.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/ac/69/sstate:quilt-native::0.67:r0::11:ac69437e7d349349b5f1b=
2df79203d3ade24e59dc32f16cdf03e6dc92dd3fad6_unpack.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/94/9b/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:949b4472b14403843ae5219789e371979cbc9a53c7fa250033f55157186d902e_c=
ompile.tar.zst.siginfo
> DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto=
.io/pub/sstate/universal/1b/da/sstate:quilt-native:aarch64-linux:0.67:r0:aa=
rch64:11:1bdafcc9e6b4209bfbdf4b83f8b44e0cc3cc26cdeebe7d713a9f7fcba4b02d48_c=
reate_spdx.tar.zst.siginfo
>=20
> and the sstate for quilt-native_0.67.bb:do_collect_spdx_deps is indeed mi=
ssing, there is only x86:
>=20
> $ ls /srv/autobuilder/autobuilder.yocto.io/pub/sstate/*/72/12/sstate\:qui=
lt-native\:*collect_spdx_deps.tar.zst.siginfo=20
> /srv/autobuilder/autobuilder.yocto.io/pub/sstate/universal/72/12/sstate:q=
uilt-native:x86_64-linux:0.67:r0:x86_64:11:7212eff5f191def566b82db976b37e1e=
fcb0a8ccd964eff5b5682b651b7cb7fa_collect_spdx_deps.tar.zst.siginfo
>=20
> The normal build works since it doesn't care about the siginfo files,
> just the actual sstate it needs and as a covered task, it just skips
> over this.
>=20
> This highlights two issues:
>=20
> a) Why is the single sstate siginfo file gone? The most likely
> explanation is that it wasn't accessed recently and was deleted by the
> cleanup/ageing code. This makes sense since the code in question never
> downloads it, only checks it exists and uses that as a marker. Our
> usage "accesses" are in a different codepath to the parsing check.
>=20
> b) This means -S printdiff doesn't quite do what you'd expect since it
> doesn't skip "covered" tasks in the same way a normal build would.
>=20
> To reproduce the test failure you should be able to just delete that
> siginfo file from your local sstate.

I had a look into b), where I needed to teach the runqueue differences
code about setscene covered tasks. A really hacky way to test that
would be:

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index bb999c9dc1..3592130046 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1697,7 +1697,7 @@ class RunQueue:
=20
             tocheck.add(tid)
=20
-        valid_new =3D self.validate_hashes(tocheck, self.cooker.data, 0, T=
rue, summary=3DFalse)
+        valid_new =3D self.validate_hashes(tocheck, self.cooker.data, 0, T=
rue, summary=3DTrue)
=20
         # Tasks which are both setscene and noexec never care about depend=
encies
         # We therefore find tasks which are setscene and noexec and mark t=
heir
@@ -1720,8 +1722,21 @@ class RunQueue:
             if tid not in valid_new and tid not in noexec:
                 invalidtasks.add(tid)
=20
+        self.sqdata =3D SQData()
+        self.sqdata.cantskip =3D set()
+        self.sqdata.tasks_scenequeue_done =3D set()
+        self.sqdata.sq_buildable =3D set()
+        build_scenequeue_data(self.sqdata, self.rqdata, None, self.cooker,=
 None, self.sqdata)
+
+        for tid in self.rqdata.runq_setscene_tids:
+            if tid not in valid_new:
+                continue
+            for dep in self.sqdata.sq_covered_tasks[tid]:
+                if dep in invalidtasks:
+                    invalidtasks.remove(dep)
+
         found =3D set()
         for tid in invalidtasks:
             processed =3D set()
             toprocess =3D set([tid])
             while toprocess:
@@ -2961,6 +2978,8 @@ def build_scenequeue_data(sqdata, rqdata, rq, cooker,=
 stampcache, sqrq):
                 sqrq.sq_deferred[tid] =3D sqdata.hashes[h]
                 bb.debug(1, "Deferring %s after %s" % (tid, sqdata.hashes[=
h]))
=20
+    if not rq:
+        return
     update_scenequeue_data(sqdata.sq_revdeps, sqdata, rqdata, rq, cooker, =
stampcache, sqrq, summary=3DTrue)
=20
     # Compute a list of 'stale' sstate tasks where the current hash does n=
ot match the one


the code needing some proper refactoring to allow that for an
upstreamable patch. The trouble is that whilst it is improved, this
still showed glitches:

The differences between the current build and any cached tasks start at the=
 following tasks:
/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-extende=
d/timezone/tzcode-native.bb:do_prepare_recipe_sysroot
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-devtools/makedevs/makedevs_1.0.1.bb:do_configure
/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-extende=
d/timezone/tzcode-native.bb:do_deploy_source_date_epoch
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-extended/pigz/pigz_2.8.bb:do_configure
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-devtools/gnu-config/gnu-config_git.bb:do_configure
/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-extende=
d/texinfo-dummy-native/texinfo-dummy-native.bb:do_configure
/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-core/gl=
ibc/ldconfig-native_2.12.1.bb:do_configure
/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-core/ge=
ttext/gettext-minimal-native_0.22.bb:do_configure
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-extended/zstd/zstd_1.5.5.bb:do_configure
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-extended/unzip/unzip_6.0.bb:do_configure

e.g. why the tzcode-native.bb:do_deploy_source_date_epoch issue?

Further debugging with "bitbake tzcode-native -S printdiff -DDD":

DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/e2/a4/sstate:quilt-native::0.67:r0::11:e2a41fd44aa7736bd318ec9=
c4a6b91e4b80563ba213035afe3df3cb96fdf7aaf_fetch.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/b8/fb/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:b8fbbfbafeb7cdf333f1766d6b3c94822a21d42145e17377bede29e44a86a14d_pre=
pare_recipe_sysroot.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/94/9b/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:949b4472b14403843ae5219789e371979cbc9a53c7fa250033f55157186d902e_com=
pile.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/ee/ae/sstate:tzcode-native:aarch64-linux:202=
3c:r0:aarch64:11:eeaecb5daeb66cd24558c8ad6f75a33cbc3a108d6c6e98ebcc2e28e73c=
c4978c_compile.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/83/6e/sstate:tzcode-native:aarch64-linux:2023c:r0:aa=
rch64:11:836eeaecc95081aa94d30ec4d61b30b325f92b9913c77190d0e22eeadb5b7d0b_c=
reate_runtime_spdx.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/9f/8e/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:9f8e9e5303322240b173483312d885144dfdf2228698868857a281b510ec3214_rec=
ipe_qa.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/59/02/sstate:tzcode-native::2023c:r0::11:5902de31682091449c8d4=
0162f35f4ef0bee1a4879b3743b565504fd4fb03f27_populate_lic.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/03/07/sstate:tzcode-native:aarch64-linux:2023c:r0:aa=
rch64:11:0307b7910df3aae19e2714a290786fd46213b5664ed082eb38658ee4d0a7295b_r=
ecipe_qa.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/85/79/sstate:quilt-native::0.67:r0::11:85794fd6d83b61cb273e4d1=
4f6e3581d7fa4ec743b455f1d21786cff032c262c_patch.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/a7/fa/sstate:tzcode-native:aarch64-linux:202=
3c:r0:aarch64:11:a7fa933ded6a2c1c8a60de136a9a46cd1788fb47c53e5a00cb981349ff=
d260e5_configure.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/ac/69/sstate:quilt-native::0.67:r0::11:ac69437e7d349349b5f1b2d=
f79203d3ade24e59dc32f16cdf03e6dc92dd3fad6_unpack.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/fe/ae/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:feae04b2abf592e3df83d0dcac1f74399e342ba99c718975d34b8a27e07eeca5_con=
figure.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/03/0d/sstate:tzcode-native:aarch64-linux:202=
3c:r0:aarch64:11:030dba86bef371a20bb779cef7cdd93c0c84eaa0fadfe1d74d8784cfc9=
980b2c_deploy_source_date_epoch.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/f5/98/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:f598fad5807fabde02cd16e5f7f26b486d0b5f87dec6ff3c3d5378ba68780ff1_ins=
tall.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/2b/cf/sstate:tzcode-native::2023c:r0::11:2bcf4112bf22bd356e535=
2e9f6dde17040e9f9ebc4a60b4321112f501a6596bd_fetch.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/9f/3b/sstate:tzcode-native:aarch64-linux:202=
3c:r0:aarch64:11:9f3b9de096a3092769fc5c09a8f85de88aff486874b1c97150eb4cff25=
2f5f03_install.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/f6/97/sstate:tzcode-native:aarch64-linux:202=
3c:r0:aarch64:11:f697fc1dffb4c3e7942e0a0e952978b50535cc61a8ed1bd1b0f5c9e1bc=
91d676_prepare_recipe_sysroot.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/66/4d/sstate:tzcode-native::2023c:r0::11:664de93a4c91a94e498ce=
6039aba6bd490699f18b4295163b78495524dda17b9_patch.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/91/da/sstate:tzcode-native:aarch64-linux:202=
3c:r0:aarch64:11:91dadb158ecb0b8ac2178d8847bd8894bb8b95f84f53af47d617ef2c7e=
b2c3dd_populate_sysroot.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/b0/30/sstate:tzcode-native:aarch64-linux:202=
3c:r0:aarch64:11:b030f98a1bbe000c1b9eda75252084fd2e43239d55d0b410306ca5566e=
cf422b_collect_spdx_deps.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/da/07/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:da07e6362c0b01fc2798456aa1319e2343a556e33d0857f90a129701eaa722b2_dep=
loy_source_date_epoch.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/c2/92/sstate:tzcode-native::2023c:r0::11:c2925547a4521cb90a5e8=
b48c4e1397115800337248e1cd21ef25e5ab88e8834_unpack.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/fd/c4/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:fdc40ea4bffb4485bdbb3c38a13b4e5d8d94d1c2cdb66c8659fe5f758a3530a3_pop=
ulate_sysroot.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/37/9d/sstate:tzcode-native:aarch64-linux:2023c:r0:aa=
rch64:11:379d43911b1203a6ff7232a38b8f1eb95bdc3df5924ee06ed4f3be84a691d864_c=
reate_spdx.tar.zst.siginfo

so it seems that missing siginfo of tasks *before* do_configure would
also cause the test to show issues.

I'm going to try a patch touching sstate files to try and improve
things. I do think the runqueue patches to improve printdiff may also
be worthwhile as the above was much more readable, which is the end
goal.

Cheers,

Richard



