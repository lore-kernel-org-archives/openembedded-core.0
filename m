Return-Path: <mario@parenteses.org>
X-Greylist: delayed 495 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 23 Jan 2017 13:04:52 UTC
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 0455A71A8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 13:04:52 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 878E445CAD;
	Mon, 23 Jan 2017 13:56:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240]) (using TLS with cipher
	ECDHE-RSA-AES128-GCM-SHA256)
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030)
	with ESMTPS id mQCxbrxIjMp6; Mon, 23 Jan 2017 13:56:35 +0100 (CET)
From: Mario Domenech Goulart <mario@parenteses.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1485174363-32506-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1485174952.30673.15.camel@linuxfoundation.org>
Date: Mon, 23 Jan 2017 13:56:33 +0100
In-Reply-To: <1485174952.30673.15.camel@linuxfoundation.org> (Richard Purdie's
	message of "Mon, 23 Jan 2017 12:35:52 +0000")
Message-ID: <87r33u3pfi.fsf@parenteses.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Guard against interrupted compiles
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
X-List-Received-Date: Mon, 23 Jan 2017 13:04:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 23 Jan 2017 12:35:52 +0000 Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:

> On Mon, 2017-01-23 at 12:26 +0000, Richard Purdie wrote:
>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
>> core/busybox/busybox.inc
>> index 1f4a48c..f247e8d 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -141,6 +141,10 @@ do_compile() {
>> =C2=A0	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> =C2=A0	if [ "${BUSYBOX_SPLIT_SUID}" =3D "1" -a x`grep
>> "CONFIG_FEATURE_INDIVIDUAL=3Dy" .config` =3D x ]; then
>> =C2=A0	# split the .config into two parts, and make two busybox
>> binaries
>> +		if [ -e .config.org ]; then
>> +			# Need to guard again an interrupted
>> do_compile - restore any backup
>> +			cp .config.orig .config
>> +		fi
>
> I have fixed the typo...

Wouldn't it be better to have something like

   cp .config.orig .config || true

instead, to prevent race conditions?

All the best.
Mario
--=20
http://parenteses.org/mario

