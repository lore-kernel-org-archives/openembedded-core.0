Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12EDD116F7
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 06:05:25 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.5834.1729836323092596669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 23:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=DLCufGGV;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8XxOWPdG15tdM6K4y1mu9m/MlmavbQRawPKRXXsRk4o=; b=DLCufGGVrDYK2SuYKPzH+ZU75I
	kHjoR34kaQDLbj43nb4JN0dSIjUKZ5htClRWWrNMwGEo6mRY3e3IqAnxT25S1l9+tKJG8+Pd71vME
	+LUkEbIgBER8dFmDV7zx5A5bQZwmHYsogjsSc3t6O7jVdwjULqjMeSWA3koi5il0wGtvgWqvWb1E9
	Ssh1pt2CUYp6/e+xaI4onMm63l7k+zXH0WSvOL9lECPUOttfSfVbZCthWaukX+rzhZ/gFBUzhZZev
	HkRs1aaeoypj6yUNxzr/io3LnCk2MOuPfTbBqxD9yV8mvgsvCgwh8ve/5/1bDHeITdM9wd66+Jpdn
	6KB9Cskw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1t4DRn-000A0c-5X; Fri, 25 Oct 2024 08:05:19 +0200
Received: from [87.49.42.110] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1t4DRn-000EGq-07;
	Fri, 25 Oct 2024 08:05:18 +0200
From: Esben Haabendal <esben@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Changqing Li <changqing.li@windriver.com>,
  openembedded-core@lists.openembedded.org,  Steve Sakoman
 <sakoman@gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: fix journald persistency when
 VOLATILE_LOG_DIR is false
In-Reply-To: <b6f77a5f6712bc37c0517a45af1e45a3ee8a1931.camel@linuxfoundation.org>
	(Richard Purdie's message of "Thu, 24 Oct 2024 23:02:34 +0100")
References: <20241024-systemd-create-log-dirs-v1-1-23cba4a734ab@geanix.com>
	<58cf7a251cc55641f2d5da7dfedf204e367cc38b.camel@linuxfoundation.org>
	<87seslpoax.fsf@geanix.com>
	<b6f77a5f6712bc37c0517a45af1e45a3ee8a1931.camel@linuxfoundation.org>
Date: Fri, 25 Oct 2024 08:05:18 +0200
Message-ID: <87ed44iuox.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27437/Thu Oct 24 10:33:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206335

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Thu, 2024-10-24 at 16:29 +0200, Esben Haabendal wrote:
>> "Richard Purdie" <richard.purdie@linuxfoundation.org> writes:
>>=20
>> > On Thu, 2024-10-24 at 13:41 +0200, Esben Haabendal via lists.openembed=
ded.org wrote:
>> > > Commit 18d46e11d85d ("systemd: fix dead link /var/log/README") broke=
 the
>> > > default systemd behavior when VOLATILE_LOG_DIR is set to false.
>> > >=20
>> > > By not creating the /var/log/journal directory, the default configur=
ed
>> > > systemd (Storage=3Dauto) will silently revert to just doing volatile
>> > > logging (/run/journal).
>> > >=20
>> > > The problem fixed with the above mentioned commit was specifically r=
elated
>> > > to configurations where VOLATILE_LOG_DIR is true, in which case it s=
hould
>> > > be perfectly fine to not create the /var/log/journal directory, so we
>> > > should be able to keep the fix in place, while not breaking behavior=
 for
>> > > non VOLATILE_LOG_DIR configurations.
>> > >=20
>> > > Signed-off-by: Esben Haabendal <esben@geanix.com>
>> > > ---
>> > > =C2=A0meta/recipes-core/systemd/systemd_256.6.bb | 2 +-
>> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>> > >=20
>> > > diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recip=
es-core/systemd/systemd_256.6.bb
>> > > index 68f15ab065dd5985e4e5cefc2cd005dba5ac9c7f..88ee0c8a7f89726fc9be=
489f3fc419f9feb37251 100644
>> > > --- a/meta/recipes-core/systemd/systemd_256.6.bb
>> > > +++ b/meta/recipes-core/systemd/systemd_256.6.bb
>> > > @@ -254,7 +254,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-uid-max=3D999 \
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-alloc-gid-min=3D101 \
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-gid-max=3D999 \
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dcreate-log-dirs=3Dfalse \
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@ '-Dcreate-log-dirs=3Dfalse' if oe.=
types.boolean(d.getVar('VOLATILE_LOG_DIR')) else '' } \
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEA=
TURES', 'zeroconf', '-Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> > > =C2=A0
>> > >=20
>> >=20
>> > There were recent changes in this area so that is not the correct way
>> > to do this in master.
>> >=20
>> > meta/conf/bitbake.conf:BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is =
obsolete and no longer supported"
>> >=20
>> > This does make me wonder about testing :(.
>>=20
>> Guilty as charged. Testing was on scarthgap. I currently does not have a
>> working test setup for master.
>>=20
>> I guess I will have to wait with this until I can do proper testing
>> then.
>>=20
>> I will resend this patch against scarthgap though, as it is valid and
>> tested there.
>
> Our backport policy is such that it needs to be fixed in master first.

Ok. Then it will have to wait a bit then.

>> For master and styhead, I need to change to check
>> FILESYSTEM_PERMS_TABLES instead.
>
> Correct, yes.

/Esben

