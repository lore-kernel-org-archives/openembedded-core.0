Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SR0nS-0003PL-W2
	for openembedded-core@lists.openembedded.org;
	Sun, 06 May 2012 14:42:43 +0200
Received: by wgbdr1 with SMTP id dr1so3482453wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 May 2012 05:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3rbBtDxpLEbdkr9Chx7e8DKSk+wV+vfLzqFl5dz/4x0=;
	b=TjDbTS86gHLL1ZywxjupsK4gzyuFZzqp05uHZ6CvgNMSeVRLhfUWmAGUSZm6oWnIuQ
	3w2/BHpXvYvswRKjOq8SNMAyRTTdWl8GByDlA21dn7r2pcglcCW/qMwWU6yvQwh4mWgO
	fRa32xq6goYA07/aQ+f3e9lnW/KYoPrABl9q1VE1A4jzYc0X9oxHx9myOTcw6GRd8z+z
	v0w6IE1Uk48UlcX6bQqaHFW2pbwMeufqWNEYro1liUJvE0KWzRnPa1MxNxy+Huxpu8ar
	4R5hQmWtKCm5pkXP9ireuqIKQVM6UvtY3/bu5a7rI9ze3Eh8AtRpZAWZFXpD28vl1fab
	upxQ==
Received: by 10.216.135.206 with SMTP id u56mr7770243wei.29.1336307573862;
	Sun, 06 May 2012 05:32:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fo7sm12310468wib.9.2012.05.06.05.32.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 May 2012 05:32:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336295833.23777.60.camel@ted>
Date: Sun, 6 May 2012 14:32:51 +0200
Message-Id: <7CF44BA9-7303-42A9-90AD-B9FAE7ADE00B@dominion.thruhere.net>
References: <1336118046-20901-1-git-send-email-koen@dominion.thruhere.net>
	<1336295833.23777.60.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl47ekI5+Q1GqW+6pjJMy3hEZrU3t2QVgz2nL88AUZPRGsl6PpzAEtN3sU9Chw01WkmC+5A
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: enable TI shared transport plugin when wifi or bluetooth are requested
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 May 2012 12:42:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mei 2012, om 11:17 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-05-04 at 09:54 +0200, Koen Kooi wrote:
>> This plugin manages the firmware loading for the TI wl12xx series of =
bluetooth/wifi/fm chips.
>>=20
>> The double --enable-tist when both bluetooth and wireless are enabled =
is ugly, but harmless
>>=20
>> The background on the plugin: =
https://bugs.meego.com/show_bug.cgi?id=3D8418
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>=20
>> If accepted into master I'd like to have this in the 'denzil' branch =
as well.
>>=20
>> meta/recipes-connectivity/connman/connman.inc     |    4 ++--
>> meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
>> 2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
>> index bfe6620..8b27cfb 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -28,8 +28,8 @@ EXTRA_OECONF +=3D "\
>>     --enable-threads \
>>     --enable-loopback \
>>     --enable-ethernet \
>> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', =
'--disable-wifi', d)} \
>> -    ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
>> +    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi =
--enable-tist', '--disable-wifi', d)} \
>> +    ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth --enable-tist', '--disable-bluetooth', =
d)} \
>>     --enable-dnsproxy \
>>     --enable-ofono \
>>     --enable-tools \
>> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb =
b/meta/recipes-connectivity/connman/connman_0.79.bb
>> index 4c57dab..d7f22b9 100644
>> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
>> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
>> @@ -11,4 +11,4 @@ SRC_URI  =3D =
"git://git.kernel.org/pub/scm/network/connman/connman.git \
>>             file://test-set-ipv6-method-api-fix.patch \
>>             file://connman"
>> S =3D "${WORKDIR}/git"
>> -PR =3D "r3"
>> +PR =3D "r4"
>=20
> This appears to have broken the build on qemuppc:
>=20
> =
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/369/s=
teps/shell_19/logs/stdio

That is really weird, since that's defined in ioctl.h in asm-generic/ by =
the kernel. Does qemuppc have some options for serial ports disabled in =
the kernel headers? Since the wl12xx is a regular wifi chip it should =
work on ppc, like it does on arm and x86.

regards,

Koen=


