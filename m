Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id B947A6BAAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 17:31:46 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id p10so3706518pdj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=VmUNeKjOJbNmtgx6zu/fDT70J/Hx+TjAU72J/zvWAOw=;
	b=l8mE/gBfExbLu6KVkKzwMfd3kXMAm4s4azlMOgoo177HaZFR6cV08gShCanzK4EJ8z
	D5cbd5ITDW/dRzE+5Bhsd79gBrrgBHaFUap6amnYuWx95ULF5zFiqDqRWIAwWa2P8wTf
	uOMF3Tt7yldGdSScXNVyPMsEx9pVSi+IY6sbCuepFxiwpj4NvGKJ+NQOkvPrrF/8VEAo
	63HOd8gqbCmsIZRwMudYeo3WWsA1J6Y/MZsbPEZvZPFSduxt/MI4Utj/YVN2tLF2GCIq
	5ut0XRAPslreyau95Tfy3nrHfSnT1XghcBOL5MwEUIGKrKMYB6nkFm4L1wngDLAKfrgH
	R9vQ==
X-Received: by 10.67.15.70 with SMTP id fm6mr15723660pad.109.1377538307526;
	Mon, 26 Aug 2013 10:31:47 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ib9sm19211151pbc.43.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 10:31:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130826094552.GP3544@jama>
Date: Mon, 26 Aug 2013 10:31:59 -0700
Message-Id: <0A248202-214D-4563-B465-BE7DC18C4D52@gmail.com>
References: <1377063923-23922-1-git-send-email-raj.khem@gmail.com>
	<CAAqcGHmnX+7CCZ9BS0s2Xut5DbuzSgu1h-a-bFsDo588iyi6dA@mail.gmail.com>
	<20130826094552.GP3544@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Update SRC_URI and fix unpackaged empty dir
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
X-List-Received-Date: Mon, 26 Aug 2013 17:31:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 2:45 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Mon, Aug 26, 2013 at 12:37:18PM +0300, Riku Voipio wrote:
>> Hi,
>>=20
>> On 21 August 2013 08:45, Khem Raj <raj.khem@gmail.com> wrote:
>>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc =
b/meta/recipes-core/eglibc/eglibc-package.inc
>>> index a590cce..1a23805 100644
>>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>>> @@ -76,6 +76,10 @@ do_install_append () {
>>>        rm -f ${D}${sysconfdir}/localtime
>>>        rm -rf ${D}${localstatedir}
>>>=20
>>> +       # remove empty eglibc dir
>>> +       if [ -d ${D}${libdir}/eglibc ]; then
>>> +               rmdir ${D}${libdir}/eglibc
>>> +       fi
>>>        oe_multilib_header bits/syscall.h
>>>=20
>>>        if [ -f ${D}${bindir}/mtrace ]; then
>>=20
>> This breaks in the case the directory exists and is not empty - which
>> is the case when you build with eglibc-2.17. In that case there is a
>> pt_chown binary. pt_chown is deprecated since devpts was invented, =
and
>> now removed in 2.18.
>=20
> Can we use just
> rmdir --ignore-fail-on-non-empty ${D}${libdir}/eglibc
> ?

yes however the reason to not use it in first place was to catch these =
kind of issues.

>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


