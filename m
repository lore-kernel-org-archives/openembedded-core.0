Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id D35DC6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 12:58:03 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id b15so915423eek.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 05:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kzAA0h+lItE3YRkp5CmWUh1GBGEcV4MbAohimft+Frc=;
	b=dZl4lnemfm2AVq49kvBf9kxlAKnCCfnbMort1S4j1ek3vokUdX9gVA+oUv82h2fJPB
	uKFsBu1nbitTDs7q4sW2ZvfnlVw/yOTFp0nvdjMWWhFBqnq/FLQm4FJ1ax6VB/1rZWaB
	/VP3RMJ4j/y/yem55MtUIUkF0KMWkeytuCIqZ3LrVbHgKicQg8zAExD2/R9frRdtyXqS
	kGTmWhyVUCN/Pxw30J9MqU95C7hsxQ75z2dzZ70nqjsnkx9MC4WEMyU7oUH0fcBkhStj
	QunykbuQwcfjNd2OsEbFMIGK4ubffeV53lENaK65MWlsJZ4XJKfaI9oP2hJPLms/Ggzd
	CPIA==
X-Received: by 10.14.223.199 with SMTP id v47mr42688381eep.32.1374757083452;
	Thu, 25 Jul 2013 05:58:03 -0700 (PDT)
Received: from [172.20.0.132] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	cg12sm73534866eeb.7.2013.07.25.05.58.01 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 05:58:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <lysizmmle9.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Thu, 25 Jul 2013 14:58:02 +0200
Message-Id: <F61C6B48-CF28-4331-BEBF-19673E091E96@dominion.thruhere.net>
References: <1373325035-29814-1-git-send-email-sgw@linux.intel.com>
	<lysizmmle9.fsf@ensc-virt.intern.sigma-chemnitz.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQmbNPtZMdGV24Puq0Kh6hcnpKhvCxe+wzOESl95pcdePEiClLqW7jUewagnHcN/fNP2mxEz
Cc: Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] util-linux: Use PACKAGECONFIG to control pam and system config options
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
X-List-Received-Date: Thu, 25 Jul 2013 12:58:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 jul. 2013, om 18:26 heeft Enrico Scholz =
<enrico.scholz@sigma-chemnitz.de> het volgende geschreven:

> Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>=20
>> The PACKAGECONFIG will ensure consistent enabling and disabling of =
the pam and systemd related
>> options for configure and the correct dependencies
>>=20
>> v2: fixed PACKAGECONFIG line continuation grammar
>>    added _class-target for PACKAGECONFIG to work on target only
>> ...
>> +PACKAGECONFIG_class-target ??=3D =
"${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>> +                                ${@base_contains('DISTRO_FEATURES', =
'systemd', 'systemd', '', d)} "
>=20
> This does not work here. d.getVar('PACKAGECONFIG', True) evaluates to =
'None'
> in the anonymous python function in base.bbclass so that non-systemd =
options
> are selected in systemd distributions and packaging fails in a sanity =
check.
>=20
> Using the less weak '?=3D' operator makes thing work as expected.

And a different version of this patch got merged:

	=
https://github.com/openembedded/oe-core/commit/7cde7c639c53724327d981cbc0d=
b5e123607de1c

Which has the following bug:

PACKAGECONFIG_class-target ??=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'libpam', '', d)} \
[..]
PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, pam,"

It sets 'libpam' as PACKAGECONFIG option, but the option is actually =
named 'pam'. The patches posted to this list don't seem to have this =
bug.

regards,

Koen=

