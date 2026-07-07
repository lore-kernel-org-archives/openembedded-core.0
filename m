Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21CFC43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 10:52:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.171703.1783421527975192157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 03:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A6cgD4Wt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b779003fso20183085e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783421526; x=1784026326; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1cGncPZ49bHaI9E9ny5GrmYS/cYfEqr3Sra1KC94E+c=;
        b=A6cgD4WtQHt07sAE/oCL9Kt5l9LlV+aOOHWfj9ikqJ8314Vu6MTitd6nUlsEdArurn
         ebrv/gYB9C/5lDDno3WQm2rRLKphKieHnoncy/w08LNPPxWxMDxgJopPnGpNbVmpsZkl
         FH7FyiNDFw1p61w9/ryVMdUpRt6KjBFi3blnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421526; x=1784026326;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cGncPZ49bHaI9E9ny5GrmYS/cYfEqr3Sra1KC94E+c=;
        b=o9SWp7kKxJ6vhe2svLTuOLGa2f1RGyiGrXSAtknIkJVNhiieuzOVDCc081EpqwN+sC
         oQ3WWic9FcIvj04iQIV4rk6Nu0HKYRmkiaEKYHKdA5sqClpnR6O4MtuiVOZz/OknFTHy
         Bep8aLAi2tl/GItrEY3cNvdlh2b0QJqb++lIfGeqg1rJIABUc1HdBCPdEsbazRKv0xzK
         7dQDyvzML1uWc+i7jDgDUVCJUoqtpD1H3ISYS4fL7UlbdKp81mnv6Uh31Dbegj44yHAk
         q1ZtdA7YKukhWZxesBPu/cQvsMycFmzMpzc+t87I1wW3U1Ssig9yKP84kLwyoZzzCBRy
         J9KQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro48+bJA7hnLLkFFSiHPOg4xM5tni7mwH93c6rznEhiAKs9kbeACVeOC6McGcY3ANnOa+CjpAGTuWd36DluFwW+iQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywjj8xmrRaGCZo80c15pcnVgOHhe1hN1vgQETW9ghCP9ROvA2nY
	A8l58iesSAio7CG9/DSyIfMuBGMTaf8Cw3pnn9jDxi8g3pC7714p+2PIMJTYc6GX+LA=
X-Gm-Gg: AfdE7cmjbNxefVUa+G1qlQr+L2XqIWrsL2ra2m0QU1/rpCmTvPusjFCXQPdA2/r6q/u
	QEGTOZWOwILzWd1hHFztFU3vY6syDDDBT7u0mnezDRl1z6bdKlUTFL+OZQkvQC6uXrE66pNSFJL
	RELxBiyqKvpI5d8d5E/acVO+Rh4vLTrDVsZ+hsJy3cGOImKh/phgKK5h2eeSCHOJ9Fy1kLoKNIc
	8AVhwoKiIB1O+B9c7khJ33e+SOBh2rdA1bqg+LTu7oBgVOkg3TYfu92Cox2yOUBhQiIaOd7NQZo
	lEDTzvK0DlXpgywTLff6U6kN2mZ3RpQe7p17wPJGlm0lwHn2R2bUh0IdhDVY56RulnOyzaNpnEg
	oFP5XTFGlmx6fIfrRN/ING0hJVNeJ31V2RNfValTNJQPGrxfsQXUAZ0ttwT+nTtq6ruh8k/4nTY
	04Y7ZPQlLEdvZ+Zcc6+hwWQsndGX55uJ+w1ZvcpCAwWFsrGqrnyo0aHY3zUcHKdYoyKNhDMJ1VN
	uif8rx3ayddog==
X-Received: by 2002:a05:600c:83c7:b0:493:c453:600f with SMTP id 5b1f17b1804b1-493df037c78mr48457645e9.6.1783421526049;
        Tue, 07 Jul 2026 03:52:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:811b:f9c7:ebf9:3cb? ([2001:8b0:aba:5f3c:811b:f9c7:ebf9:3cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm32542085f8f.36.2026.07.07.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:52:04 -0700 (PDT)
Message-ID: <801aa151527e456bc8ced89d11bc2e4fd6f8fcce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from
 'BB_HASHEXCLUDE_COMMON'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.blank.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jul 2026 11:52:03 +0100
In-Reply-To: <18BFB944C29B5CD2.114350@lists.openembedded.org>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
	 <18BFB944C29B5CD2.114350@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="=-eKIVZNXFFEjntA2dv4Ci"
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 10:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240379

--=-eKIVZNXFFEjntA2dv4Ci
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-06 at 15:21 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Sat, 2026-04-18 at 20:34 +0200, Adam Blank via lists.openembedded.org =
wrote:
> > It has lain there for a while, obscuring certain aspects of
> > how task signatures are calculated.
> >=20
> > This changeset does not change the current status quo, but
> > rather changes the way in which it is implemented. It can be
> > followed by changes which further refine what is excluded and
> > how, from those tasks which refer to 'extend_recipe_sysroot'.
> >=20
> > Related discussion:
> > https://lore.kernel.org/openembedded-core/aa893eb861bf4dd18e3e84e6bbebd=
ee3b0367d1b.camel@linuxfoundation.org/
> >=20
> > Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> > ---
> > Adam Blank (7):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_pkgdata: fix typo to stop callin=
g undefined function
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add 'vardepsexclude' to 'stagin=
g_populate_sysroot_dir'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add 'extend_recipe_sysroot' to =
'vardepsexclude'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cross: add 'extend_recipe_sysroot' to 'v=
ardepsexclude'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 native: add 'extend_recipe_sysroot' to '=
vardepsexclude'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wic-tool: add 'extend_recipe_sysroot' to=
 'vardepsexclude'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake.conf: remove 'extend_recipe_sysr=
oot' from BB_HASHEXCLUDE_COMMON
> >=20
> > =C2=A0meta/classes-global/package_pkgdata.bbclass | 4 +++-
> > =C2=A0meta/classes-global/staging.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 5 ++++-
> > =C2=A0meta/classes-recipe/cross.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0meta/classes-recipe/native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> > =C2=A0meta/recipes-core/meta/wic-tools.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A06 files changed, 11 insertions(+), 3 deletions(-)
>=20
> I finally found a bit of time to look at this. I took some of it, I
> ended up reworking some of the patches as they needed rewording to
> justify them and explain the changes being made.
>=20
> I didn't take the extend_recipe_sysroot removal from bitbake.conf as
> I'm still not convinced we have all the issues that might cause
> identified. The function name typo and the incorrect vardepsexclude are
> fixed though (or will be once a couple of patches pass testing/review
> and merge).

I still wasn't 100% happy with this so I did go a little further and
hacked up the attached script. It does have one hardcoded path but you
can get the idea of what I'm trying to do.

You can start with a clean TMPDIR and run "bitbake world -S none". You
can then edit bitbake.conf and remove extend_recipe_sysroot from
BB_HASHEXCLUDE_COMMON and run that command a second time.

If you them run the attached script in tmp/stamps, after a bit of
processing, you will see:

Added {'staging_processfixme[func]', 'staging_copydir', 'BB_RUNTASK', 'oe.u=
tils.get_multilib_datastore', 'sstate_clean_manifest', 'extend_recipe_sysro=
ot', 'DEFAULTTUNE', 'RECIPE_SYSROOT', 'oe.sstatesig.find_sstate_manifest', =
'TUNE_PKGARCH:tune-x86-64-v3', 'STAGING_DIR', 'extend_recipe_sysroot[func]'=
, 'RECIPE_SYSROOT_NATIVE', 'COMPONENTS_DIR', 'staging_copydir[func]', 'stag=
ing_copyfile[func]', 'sstate_clean_manifest[func]', 'staging_populate_sysro=
ot_dir', 'setscene_depvalid', 'PN', 'oe.path.remove', 'TUNE_PKGARCH', 'RECI=
PE_SYSROOT_MANIFEST_SUBDIR', 'TARGET_ARCH', 'staging_populate_sysroot_dir[f=
unc]', 'staging_processfixme', 'setscene_depvalid[func]', 'staging_copyfile=
'}
Removed set()

That means those variables were added as dependencies somewhere in the
build for at least one task. This was basically my worry with the
patch. We need to work out where/why those are being added and triage
them in order to be able to remove extend_recipe_sysroot from the hash
exclusion. Some of them may be acceptable, some of them may not, a lot
depends on context.

I'm still not sure it is worth the work in changing that, but we do now
at least have a way of checking the effect of such a change.

Cheers,

Richard

--=-eKIVZNXFFEjntA2dv4Ci
Content-Disposition: attachment; filename="compsig.py"
Content-Type: text/x-python3; name="compsig.py"; charset="UTF-8"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwppbXBvcnQgc3lzCmltcG9ydCBvcwppbXBvcnQgcmUKCnN5
cy5wYXRoLmluc2VydCgwLCBvcy5wYXRoLmpvaW4ob3MucGF0aC5kaXJuYW1lKG9zLnBhdGguZGly
bmFtZShzeXMuYXJndlswXSkpLCAnbGliJykpCnN5cy5wYXRoLmluc2VydCgwLCAnL21lZGlhL2J1
aWxkL3Bva3kvYml0YmFrZS9saWInKQoKZnJvbSBiYiBpbXBvcnQgX192ZXJzaW9uX18gYXMgbGli
YmJfdmVyc2lvbgoKX192ZXJzaW9uX18gPSAiMi4xOS4wIgoKaWYgX192ZXJzaW9uX18gIT0gbGli
YmJfdmVyc2lvbjoKICAgIHN5cy5leGl0KCJCaXRiYWtlIGNvcmUgbGlicmFyeSB2ZXJzaW9uIGFu
ZCBwcm9ncmFtIHZlcnNpb24gbWlzbWF0Y2ghIikKCmltcG9ydCBiYgppbXBvcnQgYmIuY29tcHJl
c3MuenN0ZAppbXBvcnQganNvbgoKY2xhc3MgU2V0RW5jb2Rlcihqc29uLkpTT05FbmNvZGVyKToK
ICAgIGRlZiBkZWZhdWx0KHNlbGYsIG9iaik6CiAgICAgICAgaWYgaXNpbnN0YW5jZShvYmosIHNl
dCkgb3IgaXNpbnN0YW5jZShvYmosIGZyb3plbnNldCk6CiAgICAgICAgICAgIHJldHVybiBkaWN0
KF9zZXRfb2JqZWN0PWxpc3Qoc29ydGVkKG9iaikpKQogICAgICAgIHJldHVybiBqc29uLkpTT05F
bmNvZGVyLmRlZmF1bHQoc2VsZiwgb2JqKQoKZGVmIFNldERlY29kZXIoZGN0KToKICAgIGlmICdf
c2V0X29iamVjdCcgaW4gZGN0OgogICAgICAgIHJldHVybiBmcm96ZW5zZXQoZGN0Wydfc2V0X29i
amVjdCddKQogICAgcmV0dXJuIGRjdAoKZGVmIGRpY3RfZGlmZihhLCBiLCBpZ25vcmVkX3ZhcnM9
c2V0KCkpOgogICAgc2EgPSBzZXQoYS5rZXlzKCkpCiAgICBzYiA9IHNldChiLmtleXMoKSkKICAg
IGNvbW1vbiA9IHNhICYgc2IKICAgIGNoYW5nZWQgPSBzZXQoKQogICAgZm9yIGkgaW4gY29tbW9u
OgogICAgICAgIGlmIGFbaV0gIT0gYltpXSBhbmQgaSBub3QgaW4gaWdub3JlZF92YXJzOgogICAg
ICAgICAgICBjaGFuZ2VkLmFkZChpKQogICAgYWRkZWQgPSBzYiAtIHNhCiAgICByZW1vdmVkID0g
c2EgLSBzYgogICAgcmV0dXJuIGNoYW5nZWQsIGFkZGVkLCByZW1vdmVkCgpkZWYgZ2V0X2RhdGEo
Zm4pOgogICAgdHJ5OgogICAgICAgIHdpdGggYmIuY29tcHJlc3MuenN0ZC5vcGVuKGZuLCAicnQi
LCBlbmNvZGluZz0idXRmLTgiLCBudW1fdGhyZWFkcz0xKSBhcyBmOgogICAgICAgICAgICBhX2Rh
dGEgPSBqc29uLmxvYWQoZiwgb2JqZWN0X2hvb2s9U2V0RGVjb2RlcikKICAgIGV4Y2VwdCAoVHlw
ZUVycm9yLCBPU0Vycm9yKSBhcyBlcnI6CiAgICAgICAgYmIuZXJyb3IoIkZhaWxlZCB0byBvcGVu
IHNpZ2RhdGEgZmlsZSAnJXMnOiAlcyIgJSAoZm4sIHN0cihlcnIpKSkKICAgICAgICByYWlzZSBl
cnIKICAgIHJldHVybiBhX2RhdGEKCnBhdHRlcm4gPSByZS5jb21waWxlKHInXltcZC5dK1wuKGRv
X1thLXpfXSspXC5zaWdkYXRhXC4uKicpCgp0YXNrc3BsaXQgPSB7fQpmb3Igcm9vdCwgZGlycywg
ZmlsZXMgaW4gb3Mud2FsaygiLiIpOgogICAgZm9yIGYgaW4gZmlsZXM6CiAgICAgICAgaWYgIi5z
aWdkYXRhLiIgbm90IGluIGY6CiAgICAgICAgICAgICBjb250aW51ZQogICAgICAgIG0gPSBwYXR0
ZXJuLm1hdGNoKGYpCiAgICAgICAgaWYgbm90IG06CiAgICAgICAgICAgICBjb250aW51ZQogICAg
ICAgIHRhc2sgPSBtLmdyb3VwKDEpICsgIi0iICsgcm9vdAogICAgICAgIGlmIHRhc2sgbm90IGlu
IHRhc2tzcGxpdDoKICAgICAgICAgICAgdGFza3NwbGl0W3Rhc2tdID0gW10KICAgICAgICB0YXNr
c3BsaXRbdGFza10uYXBwZW5kKHJvb3QgKyAiLyIgKyBmKQoKYWRkcyA9IHNldCgpCnJlbW92ZXMg
PSBzZXQoKQoKZm9yIHRhc2sgaW4gdGFza3NwbGl0OgogICAgZmlsZXMgPSB0YXNrc3BsaXRbdGFz
a10KICAgIGlmIGxlbihmaWxlcykgPT0gMToKICAgICAgICBjb250aW51ZQogICAgaWYgbGVuKGZp
bGVzKSAhPSAyOgogICAgICAgIHByaW50KCJJbnZhbGlkIG51bWJlciBvZiBzaWdkYXRhIGZpbGVz
ICVzIiAlIGZpbGVzKQogICAgICAgIGNvbnRpbnVlCgogICAgZmlsZXMgPSBzb3J0ZWQoZmlsZXMs
IGtleT1sYW1iZGEgZjogb3MucGF0aC5nZXRtdGltZShmKSkKICAgIGFfZGF0YSA9IGdldF9kYXRh
KGZpbGVzWzBdKQogICAgYl9kYXRhID0gZ2V0X2RhdGEoZmlsZXNbMV0pCiAgICBjaGFuZ2VkLCBh
ZGRlZCwgcmVtb3ZlZCA9IGRpY3RfZGlmZihhX2RhdGFbJ2dlbmRlcHMnXSwgYl9kYXRhWydnZW5k
ZXBzJ10sIGFfZGF0YVsnYmFzZWhhc2hfaWdub3JlX3ZhcnMnXSAmIGJfZGF0YVsnYmFzZWhhc2hf
aWdub3JlX3ZhcnMnXSkKICAgIGFkZHMudXBkYXRlKGFkZGVkKQogICAgcmVtb3Zlcy51cGRhdGUo
cmVtb3ZlZCkKCnByaW50KCJBZGRlZCAlcyIgJSBhZGRzKQpwcmludCgiUmVtb3ZlZCAlcyIgJSBy
ZW1vdmVzKQo=


--=-eKIVZNXFFEjntA2dv4Ci--

