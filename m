Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaBUL-0003Cf-IW
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 23:01:31 +0200
Received: by mail-da0-f50.google.com with SMTP id i23so1171413dad.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 13:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ckPtjl4c09rxnr3yx0WY8zAxCk/5QGcm5/0QISbMQOE=;
	b=YqVq0pTvxpbguqhx8mrl0sfaA7Bz9QRSA4nN1wpfGmPHXZD6t7oO5fYXRnsgjRzte1
	jPzq6RsBepIZotAqsYu+Xt5EPxJIBFjifTYfRwU+oIZ+3ah4hCkIbh5+vFmEq3jeBIe6
	DScfldN2RdO9Gk4ABzyPW4Ytr6qcCJx1VlJRgMcuBseGEszmMRPC14C/QWPnRt4v07S8
	dt5cyy8ueIcIoluNRvpbMZhiV8Sc/zPYrr0JbxSE7RKiB8v7iqeNI/esNt3bF/QXPEDq
	+QmXZj0/P8HhG+bgGG+Y20Mqv3lIojbm/DGfm5HNBxCHZvvwrhi2ysJN52KlypkkYzCl
	ESKA==
X-Received: by 10.68.200.162 with SMTP id jt2mr9321785pbc.138.1368045802100;
	Wed, 08 May 2013 13:43:22 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id fx2sm603645pac.4.2013.05.08.13.43.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 13:43:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapRHnd=foj1PuaJZ5gZ-p4T-udHOZq30jOpAXDwQA4H+KA@mail.gmail.com>
Date: Wed, 8 May 2013 13:43:19 -0700
Message-Id: <C59CE14C-D842-4DDA-B906-300D0A1D2A4A@gmail.com>
References: <1368042043-26561-1-git-send-email-raj.khem@gmail.com>
	<CAHUNapRHnd=foj1PuaJZ5gZ-p4T-udHOZq30jOpAXDwQA4H+KA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Replace use of ifconfig with ip
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 21:01:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On May 8, 2013, at 1:15 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Wed, May 8, 2013 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> ifconfig and its ilk (net-tools package) is deprecated in favour of =
iproute2 package
>> and is now removed by many distro's e.g. Archlinux. So we replace =
ifconfig with ip utility
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> scripts/runqemu-gen-tapdevs | 6 +++---
>> scripts/runqemu-ifup        | 6 +++---
>> scripts/runqemu-internal    | 6 +++---
>> 3 files changed, 9 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/scripts/runqemu-gen-tapdevs =
b/scripts/runqemu-gen-tapdevs
>> index f5be30a..d3b27be 100755
>> --- a/scripts/runqemu-gen-tapdevs
>> +++ b/scripts/runqemu-gen-tapdevs
>> @@ -59,10 +59,10 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
>>        exit 1
>> fi
>>=20
>> -IFCONFIG=3D`which ifconfig 2> /dev/null`
>> +IFCONFIG=3D`which ip 2> /dev/null`
>> if [ -z "$IFCONFIG" ]; then
>=20
>>        # Is it ever anywhere else?
>> -       IFCONFIG=3D/sbin/ifconfig
>> +       IFCONFIG=3D/sbin/ip
>=20
> Is the "command" command a Bourne shell builtin? If so, using
>=20
>    IFCONFIG=3D$(command -pv ip)
>=20
> might be better? (same applies to the other, following instances)

this would be for another day.=20

>>=20
>> -POSSIBLE=3D`$IFCONFIG -a | grep '^tap' | awk '{print $1}' | sed =
s/://`
>> +POSSIBLE=3D`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed =
s/://`
>> TAP=3D""
>> LOCKFILE=3D""
>> for tap in $POSSIBLE; do
>=20
> It does seem a little silly to continue to use a variable named
> IFCONFIG now that you're switching away from "ifconfig" :-)

ip would replace more commands there eventually, thats why I left the =
variable as it is
since eventually we want to replace all net-tools with iproute2 provides =
utilities.




