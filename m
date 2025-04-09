Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF206C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 10:59:12 +0000 (UTC)
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
 by mx.groups.io with SMTP id smtpd.web10.4052.1744189714204551742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=NH7PK6ux;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.17, mailfrom: jeroen@myspectrum.nl)
Received: from submission11.mail.transip.nl (unknown [10.103.8.162])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4ZXcYq3vLDzTPXQL;
	Wed,  9 Apr 2025 11:08:31 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission11.mail.transip.nl (Postfix) with ESMTPSA id 4ZXcYp2w9Cz2pRDyC;
	Wed,  9 Apr 2025 11:08:30 +0200 (CEST)
Received: from [192.168.178.63] (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: jeroen@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 0152C20079;
	Wed,  9 Apr 2025 09:08:28 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=jeroen@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Message-ID: <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl>
Date: Wed, 9 Apr 2025 11:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug devices
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
From: Jeroen Hofstee <jeroen@myspectrum.nl>
In-Reply-To: <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
X-Scanned-By: ClueGetter at submission11.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1744189710; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=KQ00LmifM+zhFYf1nZ1qXoBhf/iU5N0a+0nWPLHX8HY=;
 b=NH7PK6uxM1DCL4xlpYzIAUoOyMtHSXhasZwEM1JqeA2j2LwJNrnIN17TzQQVI9T9iLxd5Z
 6Ogf17Vg4hLgwhZnzQwEuoT3etRsjTmJ7Km+mFK5YdrgyP6Zyb3eIT1X98kXzZMJrf0fkN
 pwzZ3lwZUrYwUHdKTSnPr/GH/nQ5bP2Q3OAx0S4lMtdaJKvKPIGTITBn9LXDA0KiHtDtos
 Y9DQY8+I15W+C6O9Z8T4b8C8u3Z736FiJB5uRdXyrpcVRkDHEXJGWI3Qwesdxwa6NYPh0t
 WzL29bsW0B3YwldkaCrCukIKsD08bEwZOtt3o/Auh+MLQq27r6z+GJTqd2pjfQ==
X-Report-Abuse-To: abuse@transip.nl
Content-Type: multipart/alternative;
 boundary="------------3MWrqKWSh2mCjAEf7nM1Dybz"
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 10:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214586

--------------3MWrqKWSh2mCjAEf7nM1Dybz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On 4/9/25 10:37, Richard Purdie wrote:
> On Mon, 2025-04-07 at 19:49 +0200, Jeroen Hofstee via lists.openembedde=
d.org wrote:
>> From: Jeroen Hofstee<jhofstee@victronenergy.com>
>>
>> Commit 160f713917 (udev-extraconf: fix network.sh script did not
>> configure hotplugged interfaces, 2024-10-18) fixed ifupdown for
>> hotplug devices, but also calls it for non hotplug devices. That
>> can cause issue, since they might not expect the ifupdown from
>> udev, since it wasn't called before mentioned patch got merged.
>>
>> For util-linux this can simply be fixed by adding --allow=3Dhotplug.
>> Unfortunately busybox doesn't have that option, so a function is
>> added to check if the device is marked as allow-hotplug.
>>
>> Since wilcards are supported adding 'allow-hotplug *' allows to
>> restore behaviour of mentioned patch, while this restores the
>> original behaviour.
>>
>> Signed-off-by: Jeroen Hofstee<jhofstee@victronenergy.com>
>> ---
>>  =C2=A0.../udev/udev-extraconf/network.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28 +++++++++++++++++++
>>  =C2=A01 file changed, 28 insertions(+)
>>
>> diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/r=
ecipes-core/udev/udev-extraconf/network.sh
>> index 500e60ae61..da79f00d5a 100644
>> --- a/meta/recipes-core/udev/udev-extraconf/network.sh
>> +++ b/meta/recipes-core/udev/udev-extraconf/network.sh
>> @@ -6,6 +6,34 @@ echo "$INTERFACE" | grep -q wifi && exit 0
>>  =C2=A0# udevd does clearenv(). Export shell PATH to children.
>>  =C2=A0export PATH
>>  =20
>> +# udev should only trigger ifupdown for interfaces marked as allow-ho=
tplug
>> +# and with util-linux that is as simple as adding --allow=3Dhotplug.
>> +# Busybox unfortunately doesn't have this option.
>> +# allow-hotplug is a pattern like eth0 /eth* /eth*/1 /eth*=3Deth.
>> +# This function checks if INTERFACE matches an allow-hotplug pattern.
>> +
>> +allow_hotplug() {
>> +=C2=A0=C2=A0=C2=A0 allow_hotplug=3D"$(sed -n -e 's/^allow-hotplug \+\=
([^=3D ]*\).*/\1/p' /etc/network/interfaces)"
>> +=C2=A0=C2=A0=C2=A0 for pattern in $allow_hotplug; do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 options=3D"$(echo $pattern=
 | sed -n -e 's,^/\?[^ /]\+/\(.*\),\1,p')"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value=3D"$(echo $pattern |=
 sed -n -e 's,^/\?\([^ /]\+\).*,\1,p')"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interfaces=3D"$(ls -d /sys=
/class/net/$value 2>/dev/null | xargs -r -n 1 basename)"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "$options" !=3D "" ];=
 then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
terfaces=3D"$(echo $interfaces | awk -v n=3D$options '{print $n }')"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "$interfaces" | grep =
-w -q "$INTERFACE"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $? -eq 0 ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn 0
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 done
>> +
>> +=C2=A0=C2=A0=C2=A0 return 1
>> +}
>> +
>> +if ! allow_hotplug; then
>> +=C2=A0=C2=A0=C2=A0 exit 0
>> +fi
>> +
>>  =C2=A0# if this interface has an entry in /etc/network/interfaces, le=
t ifupdown
>>  =C2=A0# handle it
>>  =C2=A0if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
>>
> Firstly thanks for the patch, we should try and fix issues like this. I
> feel I should mention our code comes from a backdrop of resource
> constrained devices and the above code makes me cringe a bit due to the
> execution overhead of it.

We are still supporting omap3 / 600MHz, so I understand that. Typically
there isn't an allow-hotplug entry in /etc/network/interfaces, so it is=20
just running a sed over /etc/network/interfaces which is commonly rather=20
small. The loop is only executed if you have allow-hotplug entries.
> We've purposefully kept the code called from udev and in our
> initscripts relatively minimal/simple as the overhead of executing
> multiple programs does build up over time. Taking the above, we have
> loops, then pipelines, each of which runs more commands. Each command
> has a fork/exec overhead.
>
> Is there some way we can simplify this rather than all the shell
> pipelines and loops?

The simplest solution is to patch busybox to respect --allow=3Dhotplug I=20
guess. With kind regards, Jeroen


--------------3MWrqKWSh2mCjAEf7nM1Dybz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hello Richard,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/9/25 10:37, Richard Purdie wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Mon, 2025-04-07 at 19:49 =
+0200, Jeroen Hofstee via lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Jeroen Hofstee <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:jhofstee@victronenergy.com">=
&lt;jhofstee@victronenergy.com&gt;</a>

Commit 160f713917 (udev-extraconf: fix network.sh script did not
configure hotplugged interfaces, 2024-10-18) fixed ifupdown for
hotplug devices, but also calls it for non hotplug devices. That
can cause issue, since they might not expect the ifupdown from
udev, since it wasn't called before mentioned patch got merged.

For util-linux this can simply be fixed by adding --allow=3Dhotplug.
Unfortunately busybox doesn't have that option, so a function is
added to check if the device is marked as allow-hotplug.

Since wilcards are supported adding 'allow-hotplug *' allows to
restore behaviour of mentioned patch, while this restores the
original behaviour.

Signed-off-by: Jeroen Hofstee <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:jhofstee@victronenergy.com">&lt;jhofstee@victronenergy.com&gt;</a>
---
=C2=A0.../udev/udev-extraconf/network.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28 +++++++++++++++++++
=C2=A01 file changed, 28 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/reci=
pes-core/udev/udev-extraconf/network.sh
index 500e60ae61..da79f00d5a 100644
--- a/meta/recipes-core/udev/udev-extraconf/network.sh
+++ b/meta/recipes-core/udev/udev-extraconf/network.sh
@@ -6,6 +6,34 @@ echo "$INTERFACE" | grep -q wifi &amp;&amp; exit 0
=C2=A0# udevd does clearenv(). Export shell PATH to children.
=C2=A0export PATH
=C2=A0
+# udev should only trigger ifupdown for interfaces marked as allow-hotpl=
ug
+# and with util-linux that is as simple as adding --allow=3Dhotplug.
+# Busybox unfortunately doesn't have this option.
+# allow-hotplug is a pattern like eth0 /eth* /eth*/1 /eth*=3Deth.
+# This function checks if INTERFACE matches an allow-hotplug pattern.
+
+allow_hotplug() {
+=C2=A0=C2=A0=C2=A0 allow_hotplug=3D"$(sed -n -e 's/^allow-hotplug \+\([^=
=3D ]*\).*/\1/p' /etc/network/interfaces)"
+=C2=A0=C2=A0=C2=A0 for pattern in $allow_hotplug; do
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 options=3D"$(echo $pattern | =
sed -n -e 's,^/\?[^ /]\+/\(.*\),\1,p')"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value=3D"$(echo $pattern | se=
d -n -e 's,^/\?\([^ /]\+\).*,\1,p')"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interfaces=3D"$(ls -d /sys/cl=
ass/net/$value 2&gt;/dev/null | xargs -r -n 1 basename)"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "$options" !=3D "" ]; th=
en
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inter=
faces=3D"$(echo $interfaces | awk -v n=3D$options '{print $n }')"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "$interfaces" | grep -w =
-q "$INTERFACE"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $? -eq 0 ]; then
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n 0
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
+=C2=A0=C2=A0=C2=A0 done
+
+=C2=A0=C2=A0=C2=A0 return 1
+}
+
+if ! allow_hotplug; then
+=C2=A0=C2=A0=C2=A0 exit 0
+fi
+
=C2=A0# if this interface has an entry in /etc/network/interfaces, let if=
updown
=C2=A0# handle it
=C2=A0if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Firstly thanks for the patch, we should try and fix issues like this. I
feel I should mention our code comes from a backdrop of resource
constrained devices and the above code makes me cringe a bit due to the
execution overhead of it.
</pre>
    </blockquote>
    <br>
    We are still supporting omap3 / 600MHz, so I understand that.
    Typically<br>
    there isn't an <span style=3D"white-space: pre-wrap">allow-hotplug en=
try in </span><span
    style=3D"white-space: pre-wrap">/etc/network/interfaces, so it is jus=
t
running a sed over </span><span style=3D"white-space: pre-wrap">/etc/netw=
ork/interfaces which is commonly rather
small.

The loop is only executed if you have </span><span
    style=3D"white-space: pre-wrap">allow-hotplug entries.</span><span
    style=3D"white-space: pre-wrap">


</span>
    <blockquote type=3D"cite"
cite=3D"mid:a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">
We've purposefully kept the code called from udev and in our
initscripts relatively minimal/simple as the overhead of executing
multiple programs does build up over time. Taking the above, we have
loops, then pipelines, each of which runs more commands. Each command
has a fork/exec overhead.

Is there some way we can simplify this rather than all the shell
pipelines and loops?
</pre>
    </blockquote>
    <p>The simplest solution is to patch busybox to respect=C2=A0 <span
      style=3D"white-space: pre-wrap">--allow=3Dhotplug I guess.

With kind regards,
Jeroen
</span></p>
    <br>
  </body>
</html>

--------------3MWrqKWSh2mCjAEf7nM1Dybz--

