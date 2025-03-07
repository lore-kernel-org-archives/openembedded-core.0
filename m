Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6879EC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 15:21:10 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.13642.1741360867422427755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 07:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ge9NPt8A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3913958ebf2so208631f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741360866; x=1741965666; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+Lawls+MxOXwTCHJitM2slmXmsnhjn+izJz7VtG9ZM=;
        b=ge9NPt8AKT6aFcIbKSho0FzAqrHd036vG9HA60Va1Hy+g5hCNXe5B7l9V54C5JFixj
         u+z4vaEdzIJ4WKGpdMrfmj97BE5OUoliYhd0Ps2eccASmlbDnvJzSvNJqCMgUsnsTLbl
         F6lChwepG/l2EUNZhEELUr59EanAkhWG76dLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741360866; x=1741965666;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P+Lawls+MxOXwTCHJitM2slmXmsnhjn+izJz7VtG9ZM=;
        b=gHRtzZhjKGPrrVABwPH2iysaw4g0cZcKtEmwQUjNneGfU35KGmbMS9XPdJnfnMXYFK
         3FQyox0iCqcK2wuDN4QZ46LqJtK9d90Fx0HfCyGBgQWs6cCfjeP6RlDhjzO+QSQMFKqQ
         FvaQvmtgq/dwNIKEVgBiq12S3odfC2Fzvnm+P31P3Zui04JTezxaxlBefw6rm4x6rR8P
         3edMFntnrVnh/t97huDKIQOIdMDmPqoZZ3rpSXqTogJgaGmp3xhZ6Txcxpno2dAwOcyq
         QUOl2HC8mR8jtM+cwfSf6ZthuOH2SVVXWn2DEoY1MgFFc/W/QPPPEcGhZg/PpHSBIHFx
         gsVw==
X-Forwarded-Encrypted: i=1; AJvYcCWpjtM+CQMz5Gg8t8ZgMEVDe9jhAvQf56A8PKt9iyGJ6NZ5IPACrGSXMAon/NaB4XfsZXIkwiPs6iiYGcwATmv2Og==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCQKmxU1Qoxzj+blswuShZS0MdNSTKxKyvJfJlgJr9M0CnX/Pc
	9kBx6SdJscnBR8RngxdRBf7Tg8VQ7CtaW2B74kkTwQviLJaT6Dq8Sb3YtW8mdio=
X-Gm-Gg: ASbGnctj2NpV9HMuG5MS2oYqUaEnvd5dzSSzTJZjtJBYLgFVkTTRK2z0wG6VDDsS5of
	6SNVy11N8FAvUFXxLFom6paKmzvLmr8VdAUe7lbm30bygd8ogo6hWtDyVpSSHldlyonrCbQ2jHU
	aCA7TsR52lgBrmGN1TvzlMNpl044HcgebC81T/zNRnciSXIkkY4+czDUWDQkPVpbcGadFjSvE3y
	xX26NMTJCXManzN2T7khpW1Nx90q2e3BrcI0Uph5y3Z6c9d+FdQjoEhG92r6jLLY4DoeyM/yJE3
	bKIR6Fwc20Fn7SQ+5zwkvR50hxL2jM4W/1udTCkiyCy8P5F5SDD8vhOQouzVtbW6HPoACSBaV+S
	frW+y/9jqlBOgUlnhkSDLIJOHyStXbhlbuQ==
X-Google-Smtp-Source: AGHT+IEG19RuI/induf+p09DZgbJjxgBiIECfBNByAzKbdnOIdzKsm7glDtcM+lQJ5JMB5illSSrRA==
X-Received: by 2002:adf:8bd7:0:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-39139bda886mr436842f8f.30.1741360865474;
        Fri, 07 Mar 2025 07:21:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4ef:561a:51ad:c651? ([2001:8b0:aba:5f3c:f4ef:561a:51ad:c651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd831719sm57029555e9.0.2025.03.07.07.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:21:04 -0800 (PST)
Message-ID: <456666695e3f77fee482a0ebcbb84afb2fd1c2c3.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Date: Fri, 07 Mar 2025 15:21:04 +0000
In-Reply-To: <20250307132900.456962-1-f_l_k@t-online.de>
References: <20250307132900.456962-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 15:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212450

On Fri, 2025-03-07 at 14:29 +0100, Markus Volk via lists.openembedded.org w=
rote:
> Overview of changes in GLib 2.84.0, 2025-03-06
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Bugs fixed:
> =C2=A0 - #3590 Update Slovenian (sl) translation in glib
> =C2=A0 - !4539 Update Korean translation
> =C2=A0 - !4540 tests: Minor fixes to reference and stream-rw_all tests
> =C2=A0 - !4542 gdebugcontrollerdbus: Fix a minor typo in a code example i=
n the docs
> =C2=A0 - !4543 Update Hungarian translation
>=20
> * Translation updates:
> =C2=A0 - Hungarian (Bal=C3=A1zs =C3=9Ar)
> =C2=A0 - Korean (Changwoo Ryu)
> =C2=A0 - Slovenian (Martin)
>=20
> Overview of changes in GLib 2.83.5, 2025-02-28
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * A few improvements for when GLib is used as a subproject (#3625, #3626,=
 work
> =C2=A0 by Simon McVittie)
>=20
> * Fix out-of-order parameters in a marshaller generated by `gdbus-codegen=
`
> =C2=A0 (!4524, work by Ryan Gonzalez)
>=20
> * Bugs fixed:
> =C2=A0 - #3272 gutils-user-database test crashes in CI with G_DISABLE_ASS=
ERT and -m
> =C2=A0=C2=A0=C2=A0 thorough (Philip Withnall)
> =C2=A0 - #3424 Update the release instructions (Philip Withnall)
> =C2=A0 - #3615 Use of timeout in GApplication example code (Reuben Thomas=
)
> =C2=A0 - #3625 when GLib is a subproject, check-missing-install-tag.py as=
serts that
> =C2=A0=C2=A0=C2=A0 the parent project has install tags (Simon McVittie)
> =C2=A0 - #3626 when GLib is a subproject and pcre2 is a subproject, pcre2=
's tests are
> =C2=A0=C2=A0=C2=A0 run (Simon McVittie)
> =C2=A0 - !4507 [th/gdataset-misc] minor improvements in gdataset.c (aroun=
d
> =C2=A0=C2=A0=C2=A0 g_datalist_id_remove_multiple())
> =C2=A0 - !4508 [th/datalist-update-atomic-no-keyid] gdataset: drop "key_i=
d" argument
> =C2=A0=C2=A0=C2=A0 from GDataListUpdateAtomicFunc
> =C2=A0 - !4509 tests: Search the appropriate directories for our GIR XML =
inputs
> =C2=A0 - !4510 doc: Simplify instructions for testing with Automake
> =C2=A0 - !4511 Update Georgian translation
> =C2=A0 - !4512 Update Czech translation
> =C2=A0 - !4513 [th/gobject-inline-private-call] gobject: avoid GLIB_PRIVA=
TE_CALL()
> =C2=A0=C2=A0=C2=A0 for g_datalist_id_update_atomic
> =C2=A0 - !4514 Update Ukrainian translation
> =C2=A0 - !4515 doc: point to iconv(3) and iconv(3posix) for more details =
about iconv
> =C2=A0 - !4516 Update Bulgarian translation
> =C2=A0 - !4517 Update file fa.po
> =C2=A0 - !4518 Update Chinese translation
> =C2=A0 - !4521 docs: Fix man page link for xattrs
> =C2=A0 - !4522 Meson: Disable lint+no-valgrind tests when tests option is=
 set to
> =C2=A0=C2=A0=C2=A0 false
> =C2=A0 - !4523 [th/gobj-performance-fixes] improvements and fixes for gob=
ject's
> =C2=A0=C2=A0=C2=A0 `performance.c` benchmark
> =C2=A0 - !4524 gdbus-codegen: Fix callback GUnixFDList parameter order
> =C2=A0 - !4526 [th/gobj-performance-2] more improvements to GObject's `pe=
rformance.c`
> =C2=A0=C2=A0=C2=A0 and add test "property-set-signaled"
> =C2=A0 - !4527 Updated Lithuanian translation
> =C2=A0 - !4529 Update Portuguese translation
> =C2=A0 - !4531 Update Swedish translation
> =C2=A0 - !4535 Update Galician translations
>=20
> * Translation updates:
> =C2=A0 - Bulgarian (Alexander Shopov)
> =C2=A0 - Chinese (China) (lumingzh)
> =C2=A0 - Czech (AsciiWolf)
> =C2=A0 - Galician (Fran Di=C3=A9guez)
> =C2=A0 - Georgian (NorwayFun)
> =C2=A0 - Lithuanian (Aurimas =C4=8Cernius)
> =C2=A0 - Persian (Danial Behzadi)
> =C2=A0 - Portuguese (Hugo Carvalho)
> =C2=A0 - Swedish (Anders Jonsson)
> =C2=A0 - Ukrainian (Yuri Chornoivan)
>=20
> Overview of changes in GLib 2.83.4, 2025-02-20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Fix Python shebang paths so they work on Windows again (#3331, work by
> =C2=A0 Dan Yeaw and others)
>=20
> * Fix refcounting semantics of `g_dbus_connection_register_object_with_cl=
osures()`
> =C2=A0 by adding a replacement API (#3560, work by Philip Withnall)
>=20
> * Support static vfuncs in GIRepository (!4457, work by Philip Chimento)
>=20
> * Add support for QNX8.0 (!4466, work by Felix Xing)
>=20
> * Add a soft dependency on C11 =E2=80=94 if your toolchain doesn=E2=80=99=
t support C11, you have
> =C2=A0 six months to tell us before this becomes a hard dependency (!4473=
)
>=20
> * Port from `net.hadess.PowerProfiles` to `org.freedesktop.UPower.PowerPr=
ofiles`
> =C2=A0 for `GPowerProfileMonitorDBus` (!4478, work by Marco Trevisan)
>=20
> * Bugs fixed:
> =C2=A0 - #3331 Windows build broken because of Python paths (Dan Yeaw)
> =C2=A0 - #3448 Use after free in GCancellableSource test (Marco Trevisan =
(Trevi=C3=B1o))
> =C2=A0 - #3560 Fix refcounting semantics of
> =C2=A0=C2=A0=C2=A0 g_dbus_connection_register_object_with_closures() (Phi=
lip Withnall)
> =C2=A0 - #3578 gkeyfile: Honor C in $LANGUAGE as gettext does (Ga=C3=ABl =
Bonithon)
> =C2=A0 - #3587 g_app_info_launch crashes on macos (Andre Miranda)
> =C2=A0 - #3592 GDBusConnection does not handle serial number overflow (Ph=
ilip
> =C2=A0=C2=A0=C2=A0 Withnall)
> =C2=A0 - #3595 Toolchain documentation should mention that GLib assumes f=
unctions can
> =C2=A0=C2=A0=C2=A0 be called through wrongly-typed function pointers (Dem=
i Obenour)
> =C2=A0 - #3612 cancellable unit test crashes in /cancellable-source/threa=
ded-dispose
> =C2=A0=C2=A0=C2=A0 (Marco Trevisan (Trevi=C3=B1o))
> =C2=A0 - #3613 Potentially revert g_win32_com_clear() due to pulling in w=
indows.h
> =C2=A0 - !3255 Drop TypeNode reference counting
> =C2=A0 - !4046 Add G_OPTION_FLAG_DEPRECATED
> =C2=A0 - !4457 Support static vfuncs in GIRepository
> =C2=A0 - !4461 docs: Update the release documentation for the new release=
 workflow
> =C2=A0 - !4464 gosxappinfo: Fix leak
> =C2=A0 - !4466 Add support for QNX8.0
> =C2=A0 - !4468 Registry backend fixes
> =C2=A0 - !4471 glib.supp: Ignore once-per-thread leak from SysprofCollect=
or
> =C2=A0 - !4472 gkeyfile: Convert docs to gi-docgen linking syntax
> =C2=A0 - !4473 build: Add a soft dependency on C11
> =C2=A0 - !4475 docs: Fix invalid references and broken links
> =C2=A0 - !4476 tests: Cleanup python tests and add tests for gi-compile-r=
epository
> =C2=A0=C2=A0=C2=A0 and gi-inspect-typelib
> =C2=A0 - !4477 gcancellable: remove sketchy source ref/unref
> =C2=A0 - !4478 gio/powerprofilemonitordbus: Use newer D-Bus API
> =C2=A0 - !4479 docs: Make docs more markdown-ish
> =C2=A0 - !4483 tests: Fix a memory leak if a callable-info test is skippe=
d
> =C2=A0 - !4486 meson: Fix typo in comment about python shebang
> =C2=A0 - !4487 gio/gfilemonitor: Use atomic API to get / store cancelled =
state
> =C2=A0 - !4488 gmain: Use atomic logic to handle internal GSource flags
> =C2=A0 - !4490 gio/subprocess: Lock while writing on shared pid and statu=
s values
> =C2=A0 - !4491 Update Brazilian Portuguese translation
> =C2=A0 - !4492 gfilemonitor: Various cleanups and minor fixes to property=
 handling
> =C2=A0 - !4493 gdbus: Add g_clear_dbus_signal_subscription() inline conve=
nience
> =C2=A0=C2=A0=C2=A0 function
> =C2=A0 - !4494 gio/subprocess: Initialize pid variable to 0
> =C2=A0 - !4495 gio/gvolumemonitor: Suggest disconnecting signals
> =C2=A0 - !4496 Update Polish translation for GNOME 48
> =C2=A0 - !4497 tests: Fix a minor leak in a new GSubprocess test
> =C2=A0 - !4498 gdatetime: Fix integer overflow when parsing very long ISO=
8601 inputs
>=20
> * Translation updates:
> =C2=A0 - Polish (Piotr Dr=C4=85g)
> =C2=A0 - Portuguese (Brazil) (Rafael Fontenelle)
>=20
> Overview of changes in GLib 2.83.3, 2025-01-23
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Fix build-time paths appearing in generated `Gio-2.0.gir` and
> =C2=A0 `GioUnix-2.0.gir` files (#3564, work by Simon McVittie)
>=20
> * Fix crash on macOS when opening links (#3568, work by John Ralls)
>=20
> * Bugs fixed:
> =C2=A0 - #3558 Recent `(inout)` changes caused unintended side-effects wi=
th
> =C2=A0=C2=A0=C2=A0 `GWeakRef` (Michael Catanzaro)
> =C2=A0 - #3561 Missing nullable annotation on parameter user_data and on =
the return
> =C2=A0=C2=A0=C2=A0 value of GVfsFileLookupFunc callback (fbrouille)
> =C2=A0 - #3562 GBytes semantics of handling empty strings are inconsisten=
t and
> =C2=A0=C2=A0=C2=A0 confusing (Philip Withnall)
> =C2=A0 - #3563 Bad anchor link in g_signal_connect() documentation
> =C2=A0 - #3564 build-time paths to gio/gunixmounts.h, etc. end up in Gio-=
2.0.gir,
> =C2=A0=C2=A0=C2=A0 GioUnix-2.0.gir (Simon McVittie)
> =C2=A0 - #3568 Links crash application on MacOS due to lack of machine-id=
 file (John
> =C2=A0=C2=A0=C2=A0 Ralls)
> =C2=A0 - #3569 Requirement of GUnixMountMonitor for a Valid Timestamp fro=
m
> =C2=A0=C2=A0=C2=A0 unix_mount_at is not Suffeciently Documented (Philip W=
ithnall)
> =C2=A0 - #3582 gmacros:=C2=A0 _G_BOOLEAN_EXPR_IMPL is incompatible with c=
++ functions
> =C2=A0=C2=A0=C2=A0 marked constexpr
> =C2=A0 - !3885 [th/gdataset-index] add a lookup index (GHashTable) to `GD=
ata`
> =C2=A0 - !4392 GWin32: Add g_win32_com_clear()
> =C2=A0 - !4436 docs: Add --generate-md to the gdbus-codegen documentation
> =C2=A0 - !4437 docs: Fix some backslash escaping issues in doc comments
> =C2=A0 - !4440 gio, gobject: Improve reproducibility of enumtypes headers
> =C2=A0 - !4441 gstrfuncs: Drop a redundant paragraph
> =C2=A0 - !4442 Don't define test setups unless we're testing
> =C2=A0 - !4443 build: Make the introspection feature yield
> =C2=A0 - !4444 Fix pointer-to-paramref syntax in docs
> =C2=A0 - !4446 gio: Fix a link to a specifications document
> =C2=A0 - !4449 Add several assertions to help static analysis and fix som=
e GIR
> =C2=A0=C2=A0=C2=A0 annotations
> =C2=A0 - !4450 Fix GCC version detection for GUINT*_SWAP_LE_BE
> =C2=A0 - !4454 gioenums: Add deprecation for FLAGS_NONE
> =C2=A0 - !4455 docs: Use gi-docgen syntax in main-loop.md
> =C2=A0 - !4458 docs: Document more extension points
> =C2=A0 - !4460 docs: Clarify that g_array_unref() works like g_ptr_array_=
unref().
>=20
> Overview of changes in GLib 2.83.2, 2024-12-11
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * This release has the same code as 2.83.1, but contains a fix for releas=
e
> =C2=A0 archive generation which means that 2.83.1 does not have a release=
 archive
>=20
> * Bugs fixed:
> =C2=A0 - !4433 ci: Enable -Dintrospection for dist builds
>=20
> Overview of changes in GLib 2.83.1, 2024-12-11
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Bugs fixed:
> =C2=A0 - #1251 gio/tests/contenttype fails on OS X: "public.directory" !=
=3D
> =C2=A0=C2=A0=C2=A0 "public.folder"
> =C2=A0 - #3441 Bump minimum supported version of macOS (John Ralls)
> =C2=A0 - #3493 Heap buffer overflow read in utf8_verify_ascii() (Philip W=
ithnall)
> =C2=A0 - #3511 Build failure =E2=80=9C'ifunc' is not supported on this ta=
rget=E2=80=9D with muslc
> =C2=A0=C2=A0=C2=A0 (Philip Withnall)
> =C2=A0 - #3517 Silent linked-list corruption in g_static_resource_init() =
on redundant
> =C2=A0=C2=A0=C2=A0 calls
> =C2=A0 - #3524 Wrong parameter type for g_enum_register_static in GObject=
-2.0.gir
> =C2=A0=C2=A0=C2=A0 (Jan-Willem Harmannij)
> =C2=A0 - #3526 Segfault in statically linked binary during initialization=
 of ifuncs
> =C2=A0=C2=A0=C2=A0 since 2.83.0 (Philip Withnall)
> =C2=A0 - #3532 g_converter_output_stream_write() can return 0 (Benjamin O=
tte)
> =C2=A0 - #3540 g_signal_connect on "notify::non-existant-property" doesn'=
t warn for
> =C2=A0=C2=A0=C2=A0 invalid property (Sid)
> =C2=A0 - #3545 Modernize the default value for g_thread_pool_set_max_unus=
ed_threads
> =C2=A0=C2=A0=C2=A0 (Matthias Clasen)
> =C2=A0 - #3546 Make the thread name available (Matthias Clasen)
> =C2=A0 - #3548 Fix g_settings_schema_has_key() to work with extended sche=
mas
> =C2=A0 - #3552 Missing nullable annotation for `log_domain` in `GLogFunc`=
 callback
> =C2=A0=C2=A0=C2=A0 (Roberto Leinardi)
> =C2=A0 - #3559 2.82.3 regression: lollypop crashes on startup (Philip Wit=
hnall)
> =C2=A0 - !4232 refstring: Fix race between releasing and re-acquiring an =
interned
> =C2=A0=C2=A0=C2=A0 GRefString
> =C2=A0 - !4382 girepository: gi_object_info_find_signal(): Avoid repeated=
 allocations
> =C2=A0 - !4384 test utils: Make nonfatal assertions an option
> =C2=A0 - !4385 gutf8: Skip ASan instrumentation for load_word
> =C2=A0 - !4389 macos: Add extra content type tests
> =C2=A0 - !4393 Replace procfs linuxism with kinfo freebsdism
> =C2=A0 - !4395 appmonitor: Fix warning building test
> =C2=A0 - !4396 tests: Factor out a function to convert FD to path
> =C2=A0 - !4398 grefstring: Mark a variable as potentially unused
> =C2=A0 - !4399 meson: Add variables to -uninstalled.pc files
> =C2=A0 - !4401 testutils: Documentation improvements
> =C2=A0 - !4403 Revert "CI: Rebuild a slightly newer version of ninja for =
debian-
> =C2=A0=C2=A0=C2=A0 stable-i386"
> =C2=A0 - !4406 glib/gbytes: Be more careful when saving a GBytes of NULL
> =C2=A0 - !4407 guri: Fix paths starting with =E2=80=98//=E2=80=99 when pa=
rsing
> =C2=A0 - !4410 threadpool: Simplify pool thread naming
> =C2=A0 - !4411 gdbusconnection: Allow creating connection with cross-name=
space
> =C2=A0 - !4412 gmessages: Treat DEBUG_INVOCATION=3D1 same as G_MESSAGES_D=
EBUG=3Dall
> =C2=A0 - !4413 gunicode: Update some comments in gunicode.h for Unicode 1=
6.0.0
> =C2=A0 - !4414 gdbus: Add a few missing `(nullable)` annotations to GDBus=
 method
> =C2=A0=C2=A0=C2=A0 invocation related functions
> =C2=A0 - !4415 gdbus: Fix leak of method invocation when registering an o=
bject with
> =C2=A0=C2=A0=C2=A0 closures
> =C2=A0 - !4421 gparam: Add link to constructed vfunc to CONSTRUCT
> =C2=A0 - !4422 docs: Fix dead link in CONTRIBUTING
> =C2=A0 - !4423 gio-tool: Clarify that `gio mount -l` only lists user-inte=
resting
> =C2=A0=C2=A0=C2=A0 things
> =C2=A0 - !4424 ci: Ensure all variables are quoted in .gitlab-ci.yml
> =C2=A0 - !4425 tests: Skip unsupported dbus-appinfo test on GNU/Hurd for =
the moment
> =C2=A0 - !4428 girepository: Expose gi-compile-repository and gi-* tools =
in pkg-
> =C2=A0=C2=A0=C2=A0 config
> =C2=A0 - !4429 gdbus: Add nullable annotations for fd list outs
> =C2=A0 - !4432 ci: Add release component to automate tarball publishing
>=20
> Overview of changes in GLib 2.83.0, 2024-11-06
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Update to Unicode 16.0.0; there may be bugs in linebreaking support, se=
e #3518
> =C2=A0 (#3460, work by Philip Withnall)
>=20
> * Optimise UTF-8 validation of strings, including use of ifuncs to preven=
t
> =C2=A0 spurious warnings from sanitizers and valgrind (#3481, work by Chr=
istian
> =C2=A0 Hergert)
>=20
> * Fix a potential buffer overflow in `GSocks4aProxy` (#3461, work by
> =C2=A0 Michael Catanzaro)
>=20
> * Change the default value of -Dglib_debug from `auto` to `enabled` for
> =C2=A0 developers =E2=80=94 distributions will almost certainly want to o=
verride it to
> =C2=A0 `-Dglib_debug=3Ddisabled` for package release builds though; see #=
3421
>=20
> * Revert per-instance locking changes in `GCancellable` as they introduce=
d new
> =C2=A0 races (#3448)
>=20
> * Bump Meson dependency to 1.4.0 (!4244, work by Benjamin Gilbert)
>=20
> * Rename multiple `g_unix_mount_*()` APIs to `g_unix_mount_entry_*()` (#3=
492,
> =C2=A0 work by Jialu Zhou)
>=20
> * Add a new `GFileMonitor` backend for macOS and BSD: libinotify-kqueue (=
!3657,
> =C2=A0 work by Gleb Popov)
>=20
> * Add APIs for sync, async and finish function annotations to libgireposi=
tory
> =C2=A0 (!3746, work by Evan Welsh)
>=20
> * Bugs fixed:
> =C2=A0 - #3289 readlink -f fails in CI on macOS
> =C2=A0 - #3415 module-test-library and module-test-plugin tests fail on F=
reeBSD and
> =C2=A0=C2=A0=C2=A0 muslc (Philip Withnall)
> =C2=A0 - #3417 Investigate trampoline performance implications in g_mutex=
_lock_impl()
> =C2=A0=C2=A0=C2=A0 changes (Philip Withnall)
> =C2=A0 - #3421 Default value for glib_debug meson option (Philip Withnall=
)
> =C2=A0 - #3444 deprecation warnings when using gobjectnotifyqueue.c
> =C2=A0 - #3450 Should check for epoll_create1 rather than epoll_create (P=
hilip
> =C2=A0=C2=A0=C2=A0 Withnall)
> =C2=A0 - #3451 Gio.MenuModel docs have an outdated UI example (Philip Wit=
hnall)
> =C2=A0 - #3456 Test /unix-mounts/get-mount-entries fails unless libmount =
is enabled
> =C2=A0=C2=A0=C2=A0 (Philip Withnall)
> =C2=A0 - #3458 scan-build CI job fails due to gvdb subproject not having =
meson.build
> =C2=A0=C2=A0=C2=A0 (Philip Withnall)
> =C2=A0 - #3460 "404: Page not found" Error on "submitted as merge request=
s" Link
> =C2=A0=C2=A0=C2=A0 (Philip Withnall)
> =C2=A0 - #3461 Buffer overflow in set_connect_msg() (Michael Catanzaro)
> =C2=A0 - #3464 g-ir-scanner fails silently on msys2 CI jobs (Philip Withn=
all)
> =C2=A0 - #3465 Avoid GError for control flow in GResources
> =C2=A0 - #3469 Unclear correctness of g_malloc() in pattern_coalesce() (M=
ichael
> =C2=A0=C2=A0=C2=A0 Catanzaro)
> =C2=A0 - #3470 Update to Unicode 16.0.0 (Philip Withnall)
> =C2=A0 - #3472 Overactive GVariantTypeInfo collection causes considerable=
 overhead
> =C2=A0=C2=A0=C2=A0 (Christian Hergert)
> =C2=A0 - #3477 Determine policy on 32-bit support (Philip Withnall)
> =C2=A0 - #3478 Incorrect Examples in GVariant Specification (Christian He=
rgert)
> =C2=A0 - #3480 glib/gvariant: incorrect use of G_ANALYZER_ANALYZING (Chri=
stian
> =C2=A0=C2=A0=C2=A0 Hergert)
> =C2=A0 - #3481 Discussion: utf8 validation optimization (Christian Herger=
t)
> =C2=A0 - #3483 mainloop Unix FD test intermittently fails on Hurd (Philip=
 Withnall)
> =C2=A0 - #3484 g_app_info_launch_default_for_uri no longer works on macOS
> =C2=A0 - #3486 GVariant inline allocation support broke i686/32-bit build=
s (Christian
> =C2=A0=C2=A0=C2=A0 Hergert)
> =C2=A0 - #3488 `glib` does not properly detect `gobject-introspection` (P=
hilip
> =C2=A0=C2=A0=C2=A0 Withnall)
> =C2=A0 - #3489 Multicast cannot be joined on Mac OS on non-default interf=
ace
> =C2=A0=C2=A0=C2=A0 (Nirbheek Chauhan)
> =C2=A0 - #3490 Meson: fix support for aarch64-w64-mingw32 (Windows on ARM=
64) (Carlo
> =C2=A0=C2=A0=C2=A0 Bramini)
> =C2=A0 - #3492 Incorrect Documentation for g_unix_mount_get_mount_path Re=
turn Value
> =C2=A0=C2=A0=C2=A0 Ownership (Jialu Zhou)
> =C2=A0 - #3500 AIX: build failure due to pollfd structure change (Parth P=
atel)
> =C2=A0 - #3502 Test regressions with tzdata 2024b (Rebecca N. Palmer)
> =C2=A0 - #3508 g_array_free and free_seg
> =C2=A0 - #3512 AIX: Undefined symbol related to ASAN Sanitizer
> =C2=A0 - !3657 Introduce a new GFileMonitor backend: libinotify-kqueue
> =C2=A0 - !3746 girepository: Add APIs for sync, async, and finish functio=
n
> =C2=A0=C2=A0=C2=A0 annotations
> =C2=A0 - !3816 Update the wrap file for gi-docgen
> =C2=A0 - !4126 build: Enable -Wfloat-conversion and fix warnings
> =C2=A0 - !4176 tests: Expand tests for app launching via D-Bus
> =C2=A0 - !4196 refstring: add GEqualFunc for ref-counted strings
> =C2=A0 - !4202 simpleproxyresolver: Ignore host with scope id
> =C2=A0 - !4204 Fix minor issues found by static analysis, and add some ad=
ditional
> =C2=A0=C2=A0=C2=A0 code comments
> =C2=A0 - !4216 build: Post-release version bump
> =C2=A0 - !4218 Persian l10n
> =C2=A0 - !4219 tests: Run lint tests with detected bash
> =C2=A0 - !4223 Update Korean translation
> =C2=A0 - !4224 Update Catalan translation
> =C2=A0 - !4225 Update Czech translation
> =C2=A0 - !4226 Update Portuguese translation
> =C2=A0 - !4227 gspawn: close child_err_report_fd before exiting on error
> =C2=A0 - !4235 Update Ukrainian translation
> =C2=A0 - !4236 Cherry pick Polish and Brazilian Portuguese translations f=
rom
> =C2=A0=C2=A0=C2=A0 glib-2-82 to main
> =C2=A0 - !4237 Update French translation
> =C2=A0 - !4239 Update Galician translations for main
> =C2=A0 - !4243 gresource: Convert docs to gi-docgen linking syntax
> =C2=A0 - !4244 build: Bump Meson dependency to 1.4.0
> =C2=A0 - !4245 resource: Add g_resource[s]_has_children and avoid a point=
less
> =C2=A0=C2=A0=C2=A0 allocation
> =C2=A0 - !4248 dir: Avoid some allocations
> =C2=A0 - !4252 gio: Fix overindented docstring of buffer argument
> =C2=A0 - !4253 Update Bulgarian translation
> =C2=A0 - !4254 Update British English translation (main)
> =C2=A0 - !4256 Updated Lithuanian translation
> =C2=A0 - !4257 Update Hungarian translation
> =C2=A0 - !4260 Collation keys are not encoded in UTF-8
> =C2=A0 - !4261 gsocket windows: check event before calling WSAEnumNetwork=
Events
> =C2=A0 - !4262 Update Russian translation
> =C2=A0 - !4264 Update Danish translation
> =C2=A0 - !4267 Update Georgian translation
> =C2=A0 - !4268 subprojects: Update pcre2 to 10.44
> =C2=A0 - !4269 docs(glib): Fix link in string-utils ref
> =C2=A0 - !4272 gio: Add a query_exists vfunc to GFile
> =C2=A0 - !4277 tests: Add some explicit float =E2=86=92 int casts
> =C2=A0 - !4278 GDBus: Don't log a message for G_DBUS_CONNECTION_FLAGS_CRO=
SS_NAMESPACE
> =C2=A0 - !4286 glib/gvariant: avoid GVariantType copy for stack builders
> =C2=A0 - !4288 girepository: Make _blob_is_registered_type static inline
> =C2=A0 - !4290 glib/gbytes: save small byte buffers inline
> =C2=A0 - !4292 Fix incorrect use of assert/debug/check macros
> =C2=A0 - !4293 gvarianttypeinfo: reduce caching overhead
> =C2=A0 - !4294 gvarianttype: mark const functions as such
> =C2=A0 - !4295 gvariant: Avoid malloc/free in valid_format_string()
> =C2=A0 - !4296 glib/gvariant: use g_utf8_validate() for strlen
> =C2=A0 - !4297 glib/gvarianttype: g_variant_type_is_subtype_of() fastpath
> =C2=A0 - !4298 glib/gvariant: avoid g_renew() for definite tuples
> =C2=A0 - !4299 glib/gvariant: Avoid extraneous GBytes ref counting
> =C2=A0 - !4300 gpoll windows: use a threadpool when polling large number =
of fds
> =C2=A0 - !4301 glib/gvariant: Inline small gvariant data using C99 flexib=
le arrays
> =C2=A0 - !4302 glib/gvariant: skip bitlock for g_variant_ref_sink()
> =C2=A0 - !4303 gbytes: Convert docs to gi-docgen linking syntax
> =C2=A0 - !4304 gutf8: Convert docs to gi-docgen linking syntax
> =C2=A0 - !4305 build: switch back to c_std=3Dgnu99 pending ObjC fix
> =C2=A0 - !4307 ci: Re-enable fatal warnings for FreeBSD CI
> =C2=A0 - !4308 utils: Add g_steal_handle_id() to complement g_clear_handl=
e_id()
> =C2=A0 - !4310 tests: FreeBSD doesn't use glibc
> =C2=A0 - !4311 tests: Move fake-document-portal subprocess inside dbus-ap=
pinfo test
> =C2=A0 - !4313 remove quadratic behavior in g_string_replace
> =C2=A0 - !4315 fuzzing: Add simple fuzz test for g_string_replace()
> =C2=A0 - !4318 CI: Use Visual Studio 2019 for the MSVC CI
> =C2=A0 - !4321 gvariant-core.c: Fix suffix alignment on 32-bit MSVC build=
s
> =C2=A0 - !4322 gvariant: Fix unused variables when G_DISABLE_ASSERT is de=
fined
> =C2=A0 - !4323 gbytes: Add an assertion to placate static analysis
> =C2=A0 - !4326 gvarianttype: Add two missing (nullable) annotations and p=
ort docs to
> =C2=A0=C2=A0=C2=A0 gi-docgen format
> =C2=A0 - !4327 gio/gdatainputstream: use memchr() when possible
> =C2=A0 - !4331 gir: Ignore function-inline and method-inline elements
> =C2=A0 - !4332 gstring: Fix a heap buffer overflow in the new g_string_re=
place() code
> =C2=A0 - !4334 fuzzing: Add input length limits on g_string_replace() tes=
t
> =C2=A0 - !4335 docs: Update CI platforms list and Visual Studio recommend=
ation
> =C2=A0 - !4338 CI/MSYS2: Fix prefix for gobject-introspection
> =C2=A0 - !4339 Win32 cleanup: do not define STRICT
> =C2=A0 - !4340 gsocket: Fix #ifdef for defining g_socket_get_adapter_ipv4=
_addr()
> =C2=A0 - !4341 gio: Use g_steal_handle_id() with signal unsubscriptions
> =C2=A0 - !4342 CI: Add manual CI job for VS2019 ARM64 builds
> =C2=A0 - !4343 CI: Skip PCRE2 tests for now for 32-bit Visual Studio buil=
ds
> =C2=A0 - !4344 glib/gutf8: use ifunc to check for valgrind
> =C2=A0 - !4345 fuzzing: Add fuzz tests for GDataInputStream=E2=80=99s com=
plex read methods
> =C2=A0 - !4346 gdate: Fix minor typo in documentation comment
> =C2=A0 - !4347 docs: Add Meson to the GSettings build integration
> =C2=A0 - !4348 gdatainputstream: Fix length return value on UTF-8 validat=
ion failure
> =C2=A0 - !4350 glib: Don't require GLIB_DOMAIN to be a NUL-terminated str=
ing
> =C2=A0 - !4351 Build fixes for building on Solaris & illumos
> =C2=A0 - !4352 gdatainputstream: Use memchr() for the multi-stop-char cas=
e too
> =C2=A0 - !4353 docs: Add CI runner maintainers to CODEOWNERS
> =C2=A0 - !4354 glib.supp: Suppress more _g_io_module_get_default_type lea=
ks
> =C2=A0 - !4358 Add a CI job for Debian stable i386 (32-bit)
> =C2=A0 - !4359 tests: Use g_assert_*() rather than g_assert() in GDateTim=
e tests
> =C2=A0 - !4365 fuzzing: Fix buffer overread error in the fuzz test itself
> =C2=A0 - !4366 glocalfile: Disable faccessat()-based query_exists on Free=
BSD
> =C2=A0 - !4367 tests: Fix calls to deprecated API in unix-mounts tests
> =C2=A0 - !4373 macos: Remove extraneous space from type identifier
> =C2=A0 - !4374 thread: Force-limit thread name length
> =C2=A0 - !4375 Small improvements to g_on_error_stack_trace and g_on_erro=
r_query
> =C2=A0 - !4376 Enable GNetworkMonitorNetlink on FreeBSD
> =C2=A0 - !4377 gvariant: Introduce G_VARIANT_BUILDER_INIT_UNSET
> =C2=A0 - !4378 gio: Fix GFileEnumerator leaks in gio tools
> =C2=A0 - !4383 gtask: Fix comment for auto task naming via 'g_task_set_so=
urce_tag()'
>=20
> * Translation updates:
> =C2=A0 - Bulgarian (twlvnn kraftwerk)
> =C2=A0 - Catalan (Jordi Mas)
> =C2=A0 - Czech (AsciiWolf)
> =C2=A0 - Danish (Ask Hjorth Larsen)
> =C2=A0 - English (United Kingdom) (Bruce Cowan)
> =C2=A0 - French (Vincent Chatelain)
> =C2=A0 - Galician (Fran Di=C3=A9guez)
> =C2=A0 - Georgian (NorwayFun)
> =C2=A0 - Hungarian (Bal=C3=A1zs =C3=9Ar)
> =C2=A0 - Korean (Changwoo Ryu)
> =C2=A0 - Lithuanian (Aurimas =C4=8Cernius)
> =C2=A0 - Persian (Danial Behzadi)
> =C2=A0 - Polish (Piotr Dr=C4=85g)
> =C2=A0 - Portuguese (Hugo Carvalho)
> =C2=A0 - Portuguese (Brazil) (Rafael Fontenelle)
> =C2=A0 - Russian (jtux270)
> =C2=A0 - Ukrainian (Yuri Chornoivan)
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
> =C2=A0...Do-not-write-bindir-into-pkg-config-files.patch | 14 +++++++----=
---
> =C2=A0.../0001-Fix-DATADIRNAME-on-uclibc-Linux.patch=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0...stall-gio-querymodules-as-libexec_PROGRAM.patch |=C2=A0 6 +++---
> =C2=A0...warning-about-deprecated-paths-in-schemas.patch |=C2=A0 4 ++--
> =C2=A0...esources.c-comment-out-a-build-host-only-.patch |=C2=A0 6 +++---
> =C2=A0...1-meson-Run-atomics-test-on-clang-as-well.patch |=C2=A0 6 +++---
> =C2=A0...-do-not-enable-pidfd-features-on-native-g.patch |=C2=A0 6 +++---
> =C2=A0...t-hardcode-python-path-into-various-tools.patch |=C2=A0 2 +-
> =C2=A0.../glib-2.0/files/relocate-modules.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++----
> =C2=A0.../recipes-core/glib-2.0/files/skip-timeout.patch |=C2=A0 2 +-
> =C2=A0...nitial_2.82.4.bb =3D> glib-2.0-initial_2.84.0.bb} |=C2=A0 0
> =C2=A0.../{glib-2.0_2.82.4.bb =3D> glib-2.0_2.84.0.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 0
> =C2=A0meta/recipes-core/glib-2.0/glib.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A013 files changed, 30 insertions(+), 29 deletions(-)
> =C2=A0rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.82.4.bb =3D> =
glib-2.0-initial_2.84.0.bb} (100%)
> =C2=A0rename meta/recipes-core/glib-2.0/{glib-2.0_2.82.4.bb =3D> glib-2.0=
_2.84.0.bb} (100%)

This showed ptest failures on the autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1070/ste=
ps/12/logs/stdio

Cheers,

Richard

