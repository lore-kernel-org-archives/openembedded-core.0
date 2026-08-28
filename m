Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58ADC61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 23:32:06 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1146.1787959926227243257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 16:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AZ7Gh52r;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66ce5312ca6so1566514d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 16:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787959925; cv=none;
        d=google.com; s=arc-20260327;
        b=k34sQKTTMFEynzbUobSmTlUO99X4uB6ruN6IDPAHvFfZsxDQRLx9JNxHcLQOpWs461
         VR6W+ulUH0Dn2tREsvlzBCZvyrhwP6um/5UU97QTU1q69oZN4mW8LLrkqUO+XOnIujpq
         6qNNVV+jNifw48OfZajyul4XN7z9PAtj5hG1oxGU5Br4pMpu/S3aGW6X7Eo/MBkpgLI4
         ns4+ZbNeDfoY0I9eKMdH67TS3F97brBgWDjbb/P1dtN+D26RDUbh4CLi74+Ps2aRiE2O
         FH+V7NXjdkFbXoacJsdF51qO0FM5OsLF4/cvkHfVuq/gKG9rdMsJt72JCHIasQ6jGB1e
         wX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=we+SNDfern+YD6Kl/l7PiCQFafLIp1VUQ1bE5Wt7JkY=;
        fh=kmwY42GewyzzGKyZJ2Rvn2oYbsXmD/QRzkoqP05Kxk8=;
        b=h35bu9sOhlAYI0/Y4ueSrxoRijoRF8JuTEVH+TMz36K4vjCBnYluwAxURKaRFg0I6+
         XrA0s5P1ygxdL3avjjM71O1wPIabGTVh8iKWq8RYSfH8qseNmcXikFVVqL6WrjKhRg91
         AVuV3kQ2RjxfHcPee5YC2XNYkDINz7NABxuGbyJXAOm+7gjrD+vuPzi3fhvcDZzF9ntS
         kqPLZA3JJVrMSYt42JzOlA+mLsbAxeKkCw26QtjO51CYkRT8f1i9KqUzyim1ZzzMlxvp
         4vD+2BjVNilpQmWikYLRmQ6HbkYjXI4olz0kY4z8O8wJquvzWa01s5eyBVy2xG5Qee7U
         dUVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787959925; x=1788564725; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=we+SNDfern+YD6Kl/l7PiCQFafLIp1VUQ1bE5Wt7JkY=;
        b=AZ7Gh52rEK9jrp5ZimpoaoOmTMladW0iBQMoSfB+l0N7PYnMv3VRqcpg0qzVyN0JYK
         3YdIEWVbLJlar7M9I0xYWyYfZ70BNXQSO7nCVvfq7xRpQL/vvgvcTJLMAO1K6bDNjwos
         +yciTEuCH4a38j6O/xPdKdouz6Q9unxxjIsAHip1ATF/ZJNq+yAR6gVcBmZxG5O5XLhx
         Fo9BOq/vjCc3na7lIBwFL4xpF1jh4OWVd9w+dNLsq/RQOVN9ZJ2P0ZAZYPEatq0aFGaS
         /nbS223zgBxCm6D3Q3J9tkQMhpSmU6rhpBbvdhm001ILvZHix61+wLT/CGzSve36W2xO
         AI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787959925; x=1788564725;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=we+SNDfern+YD6Kl/l7PiCQFafLIp1VUQ1bE5Wt7JkY=;
        b=hdC+QiofODzw5umbRFR+o4tLMqqr5tbBe/zt7wCAenQpmVp4OGQ8f4MfaYYL59gr7W
         xYyG+EzAO8aHRzDNAy1r4w5CfT7haefjnM7K8G/I7tUMF/mTz1MAOr2yI++fErQNYoJN
         mEuusGtF+6YFtXttE0IstQSnK0TupoNVzNxhHCXFYurNctFzqZ0Y48RCAtEo2EFuf8BD
         dDTBvqrBoJKJrE5TffCDB7ani/DxB3xx5aN3bvY9/VpJ/utYxn/1Nk3BdjTL0f9zY894
         Qx6Yrv6zInxe2TNnpxF06G1ek0YRSB2Wyi9Vc9h5C0ahfRKkYmJLbhXPu3Wor1wpv+jB
         q/2g==
X-Gm-Message-State: AFuF++lLvmPgnSiImBir7o/Z5NPUKairGJhg2kFSE2nvbXiFQbBkPZXB
	UcKTG9Qfrn5S0DnUiJUuhciAGLpFENrVg/RVOWZIvhJYJpcnq17NmyC3R2QgsHXepQhl6mVkat3
	46zZuQ6azrZIYHJb2qeZmVpeU2djTPUI=
X-Gm-Gg: AYBFou29BetKWTLoMlIABDm3usGkOyce5+uxc/LYWYaqHrgK+OWJIR7m/Z9BeixBsK2
	hz2/538nE7TT7YA0rN1pbGL4+wAxHkyFQ2fMIlDHrqhSmr1+XrSyUySF8+LEbxteA598egOGtm5
	I0j7ylq7z5A+MLaI3N1UVyKoqOA6lYlk1S92SOhkqc5WNOn0ZcXgy7GRRo8Q+fRvw/Aq75xtsEf
	zR37FdaLrJoKyqpMp2HFGygGuAelXaaqrekUjFNzfzhoIsAVWjMugSkpwFeQjCnjNa8iaLe54Xp
	ixfkrJhLtebrexlb0tq19gO4+WSo/I+w1yzr/U7f34/gDSW1Rgy4L69/oLgKrdVrw6kemJsVgjd
	XPfRjtAXwC6jz/B+ORVIzGOUEHXk8O/EHPXqITo3F4AmJmJfQq2C/c3EiMZNyLuq2XnXw1v/3iu
	EE9Q414La/6QTvFIcsNk+qXC8LIP4jjky6mv3dF1DO/fS2PKFeW8dd3jZCdWeUgDIzjW0gm9AsR
	Oserv5++aj5DhmcQsjXCBXHmV0IeJ/3t/xjMzkYwWJj6VNQ
X-Received: by 2002:a05:690e:440c:b0:667:ba34:51e2 with SMTP id
 956f58d0204a3-66e4eb04e33mr2178358d50.13.1787959925208; Fri, 28 Aug 2026
 16:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech> <20260822175200.57534-2-jaipaul.cheernam@est.tech>
 <CAMKF1srbmfWVAsLs0VFn00e9enhEhYjZQwWj21JQ8w3qiuV9eA@mail.gmail.com>
 <CAMKF1soam_e0bWKgqVUde_nG7iMjVwC9fue+5q2h=DJ=FSVMXQ@mail.gmail.com> <f7f7ba2e-3630-4020-9b1d-4ed22169ac72@est.tech>
In-Reply-To: <f7f7ba2e-3630-4020-9b1d-4ed22169ac72@est.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Aug 2026 16:31:38 -0700
X-Gm-Features: AcwNN1WOHBqOQ6CCCHc-y53u_0dpAwVUdicZDX1M0AUbZz7yAXg59dzurZw9EEs
Message-ID: <CAMKF1squj+t_vtLenobqf_dt608SVgY0CoZgMikor8pDxPuMYg@mail.gmail.com>
Subject: Re: [OE-core] [RFC v4 1/6] openssl: upgrade 3.5.7 -> 4.0.1
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000036fa64065a23dcd8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 23:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244619

--00000000000036fa64065a23dcd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jaipaul, For dead packages I would rather like a recipe removal
patches.

On Thu, Aug 27, 2026 at 5:06=E2=80=AFAM Jaipaul Cheernam <jaipaul.cheernam@=
est.tech>
wrote:

>
> On 2026-08-23 08:57, Khem Raj wrote:
> >
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8474313/raw_inl=
ine
>   Tested bitbake world -k with OpenSSL 4.0.1 upgrade across
>    meta-oe, meta-networking, meta-python, meta-perl, meta-multimedia,
>    meta-xfce, meta-initramfs, meta-filesystems.
>
>    22 recipes fixed =E2=80=94 patches provided, all with upstream referen=
ces.
>
>    13 recipes still broken:
>
>    ENGINE API removed (needs Provider API rewrite):
>
>    - imx-cst =E2=80=94 NXP proprietary, no public upstream
>    - extract-cert =E2=80=94 needs Provider API migration
>
>    Dead/unmaintained upstream:
>
>    - wvstreams/wvdial =E2=80=94 archived 2018, dial-up modem dialer
>    - ntp (classic) =E2=80=94 EOL 2023, recommend chrony
>    - loudmouth =E2=80=94 last activity 2019
>
>    No upstream fix available:
>
>    - ldns =E2=80=94 heavy deprecated API usage (issue #243 open since 202=
4)
>    - unbound =E2=80=94 upstream PR #1437 attempted, closed
>    - softhsm =E2=80=94 upstream PR #882 in progress
>    - ipmiutil =E2=80=94 no upstream fix found
>    - synergy =E2=80=94 TLS methods removed, repo archived
>    - spdm-emu =E2=80=94 depends on libspdm abstraction
>
>
>    - mercurial =E2=80=94 Python 3.14 + OpenSSL 4.0 reports TLS 1.2 as
> unavailable (upstream CPython limitation, only Python 3.15 officially
> supports OpenSSL 4.0)
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2494735
>
> https://github.com/python/cpython/issues/152709
>
>
>    3 upstream PRs submitted by us: ntopng (merged), thrift, snort3
>

--00000000000036fa64065a23dcd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Jaipaul, For dead packages I would rather like a re=
cipe removal patches.=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 27, 2026 at 5:=
06=E2=80=AFAM Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2026-08-23 08:57, Khem Raj wrote:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8=
474313/raw_inline" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/valkyrie/api/v2/logs/8474313/raw_inline</a><br>
=C2=A0=C2=A0Tested bitbake world -k with OpenSSL 4.0.1 upgrade across<br>
=C2=A0=C2=A0 meta-oe, meta-networking, meta-python, meta-perl, meta-multime=
dia,<br>
=C2=A0=C2=A0 meta-xfce, meta-initramfs, meta-filesystems.<br>
<br>
=C2=A0=C2=A0 22 recipes fixed =E2=80=94 patches provided, all with upstream=
 references.<br>
<br>
=C2=A0=C2=A0 13 recipes still broken:<br>
<br>
=C2=A0=C2=A0 ENGINE API removed (needs Provider API rewrite):<br>
<br>
=C2=A0=C2=A0 - imx-cst =E2=80=94 NXP proprietary, no public upstream<br>
=C2=A0=C2=A0 - extract-cert =E2=80=94 needs Provider API migration<br>
<br>
=C2=A0=C2=A0 Dead/unmaintained upstream:<br>
<br>
=C2=A0=C2=A0 - wvstreams/wvdial =E2=80=94 archived 2018, dial-up modem dial=
er<br>
=C2=A0=C2=A0 - ntp (classic) =E2=80=94 EOL 2023, recommend chrony<br>
=C2=A0=C2=A0 - loudmouth =E2=80=94 last activity 2019<br>
<br>
=C2=A0=C2=A0 No upstream fix available:<br>
<br>
=C2=A0=C2=A0 - ldns =E2=80=94 heavy deprecated API usage (issue #243 open s=
ince 2024)<br>
=C2=A0=C2=A0 - unbound =E2=80=94 upstream PR #1437 attempted, closed<br>
=C2=A0=C2=A0 - softhsm =E2=80=94 upstream PR #882 in progress<br>
=C2=A0=C2=A0 - ipmiutil =E2=80=94 no upstream fix found<br>
=C2=A0=C2=A0 - synergy =E2=80=94 TLS methods removed, repo archived<br>
=C2=A0=C2=A0 - spdm-emu =E2=80=94 depends on libspdm abstraction<br>
<br>
<br>
=C2=A0=C2=A0 - mercurial =E2=80=94 Python 3.14 + OpenSSL 4.0 reports TLS 1.=
2 as <br>
unavailable (upstream CPython limitation, only Python 3.15 officially <br>
supports OpenSSL 4.0)<br>
<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2494735" rel=3D"no=
referrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D2=
494735</a><br>
<br>
<a href=3D"https://github.com/python/cpython/issues/152709" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/python/cpython/issues/152709</a><b=
r>
<br>
<br>
=C2=A0=C2=A0 3 upstream PRs submitted by us: ntopng (merged), thrift, snort=
3<br>
</blockquote></div>

--00000000000036fa64065a23dcd8--

