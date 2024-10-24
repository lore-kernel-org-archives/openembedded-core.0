Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1722CCE8E81
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:29:18 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.15961.1729780154058865941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=eZcSuxQz;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tHf9TM5SnvkhlFEsI3BI0dYdZikoCQv7WDjJ1ScwzKA=; b=eZcSuxQzt2yyOQzi2C7AiRDzaV
	qQlXg/5bvaHAtJ2DsTC1k2NtF94wzJ7PAhMXLLFZZ5a0zfQk1a4iC7ycBBvtgIt1CMqase88Lrty6
	u5lMCbq3t+AZI5f/egru+p9PGZcK+de61YkxwhM0o9Qhc9OOKqaRLTWKm/D5Qn1MWcpO9ryR3OCXV
	d2fw4AKrsoDH4IRtwXw0rDtAHzC7P8xaE3Ne6I63e9ZmceUVUT/zdF4k3NOrTOXTDbGX26vPT/UAd
	hTp8fdg9o3xiCaaoofb+Q+61yr01HnrDNgDkuDbDgXPRM72TyRcWjpufZ2Cul8SvtOeo/pOQxEaLw
	9bkFvjLw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1t3ypq-000HuC-Q2; Thu, 24 Oct 2024 16:29:10 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1t3ypq-0005X8-1X;
	Thu, 24 Oct 2024 16:29:10 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: Changqing Li <changqing.li@windriver.com>,
  openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: fix journald persistency when
 VOLATILE_LOG_DIR is false
In-Reply-To: <58cf7a251cc55641f2d5da7dfedf204e367cc38b.camel@linuxfoundation.org>
	(Richard Purdie's message of "Thu, 24 Oct 2024 13:58:10 +0100")
References: <20241024-systemd-create-log-dirs-v1-1-23cba4a734ab@geanix.com>
	<58cf7a251cc55641f2d5da7dfedf204e367cc38b.camel@linuxfoundation.org>
Date: Thu, 24 Oct 2024 16:29:10 +0200
Message-ID: <87seslpoax.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27437/Thu Oct 24 10:33:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 14:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206298

"Richard Purdie" <richard.purdie@linuxfoundation.org> writes:

> On Thu, 2024-10-24 at 13:41 +0200, Esben Haabendal via lists.openembedded=
.org wrote:
>> Commit 18d46e11d85d ("systemd: fix dead link /var/log/README") broke the
>> default systemd behavior when VOLATILE_LOG_DIR is set to false.
>>=20
>> By not creating the /var/log/journal directory, the default configured
>> systemd (Storage=3Dauto) will silently revert to just doing volatile
>> logging (/run/journal).
>>=20
>> The problem fixed with the above mentioned commit was specifically relat=
ed
>> to configurations where VOLATILE_LOG_DIR is true, in which case it should
>> be perfectly fine to not create the /var/log/journal directory, so we
>> should be able to keep the fix in place, while not breaking behavior for
>> non VOLATILE_LOG_DIR configurations.
>>=20
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>> =C2=A0meta/recipes-core/systemd/systemd_256.6.bb | 2 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipes-c=
ore/systemd/systemd_256.6.bb
>> index 68f15ab065dd5985e4e5cefc2cd005dba5ac9c7f..88ee0c8a7f89726fc9be489f=
3fc419f9feb37251 100644
>> --- a/meta/recipes-core/systemd/systemd_256.6.bb
>> +++ b/meta/recipes-core/systemd/systemd_256.6.bb
>> @@ -254,7 +254,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-uid-max=3D999 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-alloc-gid-min=3D101 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-gid-max=3D999 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dcreate-log-dirs=3Dfalse \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@ '-Dcreate-log-dirs=3Dfalse' if oe.typ=
es.boolean(d.getVar('VOLATILE_LOG_DIR')) else '' } \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES'=
, 'zeroconf', '-Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0
>>=20
>
> There were recent changes in this area so that is not the correct way
> to do this in master.
>
> meta/conf/bitbake.conf:BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is obs=
olete and no longer supported"
>
> This does make me wonder about testing :(.

Guilty as charged. Testing was on scarthgap. I currently does not have a
working test setup for master.

I guess I will have to wait with this until I can do proper testing
then.

I will resend this patch against scarthgap though, as it is valid and
tested there.

For master and styhead, I need to change to check
FILESYSTEM_PERMS_TABLES instead.

/Esben

