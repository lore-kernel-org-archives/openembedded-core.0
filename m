Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A8FC5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:35:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16073.1787639731854349675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A6qomXhW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1999752f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 23:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787639730; x=1788244530; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iS/ANKG9q4ISb8Q5XnO179XdqrHHvGrd6it3oCKNPSs=;
        b=A6qomXhW/PLmiKSeWsEabYFATLjLWHTLJERoqmeDe5LisViLiS2bm3/qYTcLXP+7u9
         2PSUHyYUFlJ32/ZhI1cA4J5vyHslUVCBzUS7mvOssB2UHR6oCFsLzXqsdcQ/d+HW4VWA
         pQoE/9tQKTah6w9EfB5HqWDsDjfbcrK9XZvtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639730; x=1788244530;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iS/ANKG9q4ISb8Q5XnO179XdqrHHvGrd6it3oCKNPSs=;
        b=CzM5IdhETXUrqsNQuLWbJi04a/zLkTDwNyptOWmSElOkn4gvDo1RBtZXR2kCH6nRBc
         R+qu5zIMMntuQYbZFz8vem5J4a0OVaT7o3WLoYmVtCp2f+zaytEQhN3mYfEnJLYHiiBX
         vD3WRMKQ9tv0Tx/noUUPJiF3Z/P4rZ2DrfHQVEYiRGwBTuTCu70UldlPozbtMzoJ4VF2
         mc9gdfGUX1aQHSAzLtd8m5FjJSg3QcHEBNhS6RxTnV8FbDp9zhwvWMo8EE+cvFjyg7zX
         ec0uGVSH2ucgXR5EMKsg2k+WIWSNSmuQ7z5KUfRctOtux4PjJVGJGevi1ET5JCensl3x
         3rUA==
X-Forwarded-Encrypted: i=1; AHgh+Rrm0lKi2cbVh8aVqhqrawpa39/mzHQJlAcWiqqA4sgwGaXPWvsSmCEuyT/8QQNImYdR/btImD8WoX4g6JZ8aNs/XQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mEBCuiNezckvX0yrmla2w5iAH5lOr6u/xhesSXJFoWlVoMKRo7
	Eh/ZnrHKv5F7mKOvZHJJLEJkJpbyGgy5u6DwShKPV5QAgkzh+4XGuYuc1aczLrZxSZQWoqoNa7a
	4UyMtjnY=
X-Gm-Gg: AR+sD121D5nyhsnqtQU7E/DO9OXZUQPauj4aeS4bgPPXtrktRYTeHYb+Dt9Y1/SlyjW
	xMKqxjHZnl5CFbZIN4VulAOSW3WTgMgn9ZNatz1dVGscFxtWpHO6GQZnngYSdeVWVTRZzWmu5XE
	Jbo3zmK2yByoVdch3Ehqxgh/WF01EqYp2rdhKAHZkPlsSkW+Ja0oXXldcns+rDMPXExxA12UpLV
	kdoKyy6qD0WoJMwJ/McjLe9fi0v8qI+IoDd3WsFGLmV3lbcxDXzFtRGKHC76SCohsrRL6r75OYb
	0qSqRrnLDuGfbid+15Xo+Ap/+AniLPKgL1bW+4PSE5bScJJ1DUDnqaYwOiBKaanDv/txx8B//gN
	WSm5Bhn7HfRv6wtHU/iuvRpF6mSLPjEL/vfIoT56seU/POUaeCp2jbo+BY99MmR/MNzSgwa375B
	LJqBoEoAUY5Mq0neHypZQIODfVY7QuO4tVNOUAqKp4KTYUurId5V6TGt2iot7IJU+lNVvIvYZdb
	sAM7yqmRsrvH/jHkz4pjkQETG0jZgjnYvZWd/091hrtJSqPo6D1Gg==
X-Received: by 2002:a05:6000:2907:b0:482:ba10:36bc with SMTP id ffacd0b85a97d-482c0b4a574mr41962703f8f.4.1787639730014;
        Mon, 24 Aug 2026 23:35:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d9d:dbf1:7ccf:7617? ([2001:8b0:aba:5f3c:1d9d:dbf1:7ccf:7617])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0acaesm10466878f8f.29.2026.08.24.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:35:27 -0700 (PDT)
Message-ID: <4ce16bd69cc20976fb4ad6acdbff943d311ecf39.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v17 14/14] lib/oe/package_manager/rpm: handle
 RPM 6 non-zero exit on %post failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com, 
	randy.macleod@windriver.com, "adam.duskett"
 <adam.duskett@amarulasolutions.com>
Date: Tue, 25 Aug 2026 07:35:24 +0100
In-Reply-To: <20260825013312.2695028-15-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
	 <20260825013312.2695028-15-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244204

On Mon, 2026-08-24 at 18:33 -0700, Sumanth Gavini via lists.openembedded.or=
g wrote:
> RPM 6.0 intentionally changed rpmtsRun() to return -1 whenever any
> scriptlet fails, even non-critical ones like %post where warn_only=3DTrue
> (upstream RPM PR#3819, lib/transaction.cc).
>=20
> Root cause - two changes in RPM 6 lib/transaction.cc vs RPM 4:
>=20
> =C2=A0 1. New field set before warn_only resets rc (transaction.cc:1754):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ts->scriptError =3D 1;
>=20
> =C2=A0 2. Final exit now ORs in the new flag (transaction.cc:1910):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RPM 4: rc =3D nfailed ? -1 : 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RPM 6: rc =3D (nfailed || ts->script=
Error) ? -1 : 0;
>=20
> Call chain for a failing %post in RPM 4 (exits 0):
> =C2=A0 runScript()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 warn_only=3D=
1 -> rc reset to RPMRC_OK
> =C2=A0 psm.c:896=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (rc) break -> NOT taken, install continues
> =C2=A0 rpmte.c:823=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (failed) =
-> NOT taken, rpmteMarkFailed() skipped
> =C2=A0 transaction.c:1652 if (failed) -> NOT taken, nfailed stays 0
> =C2=A0 transaction.c:1896 rc =3D nfailed ? -1 : 0 -> rc=3D0
> =C2=A0 Python ts.run()=C2=A0=C2=A0=C2=A0 returns None -> DNF exits 0
>=20
> Call chain for a failing %post in RPM 6 (exits 1):
> =C2=A0 runScript()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ts->sc=
riptError=3D1, then rc reset to RPMRC_OK
> =C2=A0 psm.c:896=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (rc) break -> NOT taken (rc still 0)
> =C2=A0 rpmte.c:823=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fa=
iled) -> NOT taken (same as RPM 4)
> =C2=A0 transaction.cc:1652 if (failed) -> NOT taken, nfailed stays 0
> =C2=A0 transaction.cc:1910 rc =3D (nfailed || ts->scriptError) ? -1 : 0 -=
> rc=3D-1
> =C2=A0 Python ts.run()=C2=A0=C2=A0=C2=A0=C2=A0 returns [] -> DNF raises "=
Could not run
> transaction."
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> DNF exits 1
>=20
> In both RPM versions, RPMCALLBACK_SCRIPT_ERROR fires and DNF's
> _scriptError() (dnf/yum/rpmtrans.py:407-418) prints:
> =C2=A0 "Error in POSTIN scriptlet in rpm package <name>"
>=20
> OE's install_pkgs() already scans for this line and calls
> failed_postinsts_abort() (package_manager/rpm/__init__.py:210-219).
> With RPM 4 this path is always reached because DNF exits 0. With RPM 6
> the CalledProcessError raised by DNF's non-zero exit intercepts
> execution
> in _invoke_dnf() before the scan runs.
>=20
> DNF 4 (lib/dnf/base.py:1146-1158) was never updated for this RPM 6
> behaviour. When ts.run() returns [] with no failed elements it
> unconditionally raises "Could not run transaction." - the comment at
> base.py:1147 still describes RPM 4 semantics where this case meant a
> global error such as a transaction lock failure. There is an open DNF5
> issue (#2507) but no fix in DNF 4.
>=20
> Fix: detect "Error in POSTIN scriptlet in rpm package" in the DNF output
> inside _invoke_dnf()'s CalledProcessError handler and return the output
> instead of calling bb.fatal(), allowing install_pkgs()'s existing
> scriptlet scan to run as it did with RPM 4.
>=20
> Tested with oe-selftest runtime_test.Postinst.test_failing_postinst:
> =C2=A0 rpm 4.20.x: PASSED - DNF exits 0, scan path exercised as expected
> =C2=A0 rpm 6.0.x without fix: FAILED - CalledProcessError before scan rea=
ched
> =C2=A0 rpm 6.0.x with fix: PASSED - scan path restored, bb.fatal() fires
>=20
> References:
> https://github.com/rpm-software-management/rpm/pull/3819
>=20
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---
> =C2=A0meta/lib/oe/package_manager/rpm/__init__.py | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/pa=
ckage_manager/rpm/__init__.py
> index cd6efe3d3b..ccb4316bd0 100644
> --- a/meta/lib/oe/package_manager/rpm/__init__.py
> +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> @@ -333,6 +333,13 @@ class RpmPM(PackageManager):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.Called=
ProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if print_output:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 e_output =3D e.output.decode("utf-8")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # RPM 6 fails the entire transaction when a %post script=
let
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # fails, causing dnf to exit non-zero. Let install_pkgs =
handle
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # scriptlet failures via its existing "Error in POSTIN s=
criptlet"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # scanning rather than treating this as a fatal dnf invo=
cation error.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if "Error in POSTIN scriptlet in rpm package" in e_outpu=
t:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note(e_output)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return e_output
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 extra_info =3D ""
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if "install" in dnf_args:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "Error: Unable to find =
a match:" in e_output:

If the transaction fails, isn't that a problem? Wouldn't there be other
issues after this if we rely on this command having succeeded?

Copying Adam as I know he ran into this with dnf5 as well...

Cheers,

Richard



