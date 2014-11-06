Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAE47201C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 13:29:43 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x12so1186399wgg.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 05:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=7ZQ8OfEPOti+jbD181PjnwclT65YKukq5o/Nv2sAJBw=;
	b=MauA1LYU4B3L2Ex0e6AdEY64iOAx0a2itcugtSDiUfsD+OmJh8xpP6Q2FbkfkCLf0V
	YD0NLujqklt4tq+yM+vJMlHMXZSuLxJyZ8vVzyIQKQq7QUZTh0hhkuJQmLnI3UPUtRQ2
	3sL9+cxqtsHHIAswG+AYd+3t+5U6jpIsJOc7yKOHXLSau2cyOtj13AJ3c0XqkowlU0MS
	Kngvc+v2VIcL5EKOn7CEY5hCy0bTr6KhBGwm2EWcKeHbLduOnJWQOocE42sxTAp29sMx
	wr3F8ba91e3p8xJQMMYWBxwYSRwoMvtdFLgAsMn0KVOjM8fsTdsSNcwsHuxnzotTVoEL
	zJ9w==
X-Gm-Message-State: ALoCoQmBFqv9nQExk/oL2L3TjbLyuBw3NrqAGMTPqBlaXYaM2QiEvoKabzCRUzsRogrAsSpxGTnD
X-Received: by 10.194.209.180 with SMTP id mn20mr5644972wjc.49.1415280583561; 
	Thu, 06 Nov 2014 05:29:43 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id f7sm8308217wiz.13.2014.11.06.05.29.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Nov 2014 05:29:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <545B629B.5000900@windriver.com>
Date: Thu, 6 Nov 2014 14:29:42 +0100
Message-Id: <648271BD-0C3E-4506-86C1-F416BC23EA22@dominion.thruhere.net>
References: <cover.1415258952.git.Qi.Chen@windriver.com>
	<a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
	<51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
	<545B2A5F.5040208@windriver.com>
	<745681A3-F15C-4D06-93C6-3342E014B672@dominion.thruhere.net>
	<545B629B.5000900@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: make /etc/sysctl.conf have real effect
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
X-List-Received-Date: Thu, 06 Nov 2014 13:29:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 6 nov. 2014, om 12:59 heeft ChenQi <Qi.Chen@windriver.com> het =
volgende geschreven:

>=20
>=20
> On 11/06/2014 06:33 PM, Koen Kooi wrote:
>>> Op 6 nov. 2014, om 08:59 heeft ChenQi <Qi.Chen@windriver.com> het =
volgende geschreven:
>>>=20
>>> On 11/06/2014 03:48 PM, Koen Kooi wrote:
>>>> Op 6 nov. 2014, om 08:32 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>>>>=20
>>>>> In systemd, /etc/sysctl.conf is actually ignored by =
systemd-sysctl,
>>>>> because this command only examine *.conf files under a bunch of =
directories
>>>>> like /etc/sysctl.d or /usr/lib/sysctl.d.
>>>>>=20
>>>>> The problem is we are used to configuring kernel parameters in =
/etc/sysctl.conf,
>>>>> so it would be really strange if the configuration in that file =
doesn't have any
>>>>> effect.
>>>>>=20
>>>>> This patch reference Fedora's solution to this problem, creating a =
symlink to
>>>>> /etc/sysctl.conf under /etc/sysctl.d/.
>>>> Shouldn't this be done in procps instead?
>>>>=20
>>> Actually, the problem is not about `sysctl' command.
>>> procps provides `sysctl', but busybox also provides this command.
>>> It's very possible that on our generated image, procps is not =
installed but `sysctl' command is available.
>>> Both busybox's and procps's `sysctl' command takes /etc/sysctl.conf =
into consideration.
>> Right, but only procps installs that file.
>=20
> As busybox provides `sysctl' utility, is it reasonable that it also =
provides a corresponding configuration file (/etc/sysctl.conf)? Should =
we make a patch for busybox?
>=20
>=20
>>> Now, systemd provides a similar utility called `systemd-sysctl' =
which is executed at boot time via systemd-sysctl.service.
>>>=20
>>> So our actually problem is that systemd-sysctl ignores =
/etc/sysctl.conf, which makes it somewhat strange, especially to users =
who are used to configuring parameters in sysctl.conf.
>>> And this patch solves this problem by adding a symlink under =
/etc/sysctl.d/.
>>>=20
>>> That's why I think we should put this in systemd.
>> You're adding a symlink to a file which only exists if you install =
procps, which isn't in RDEPENDS.
>>=20
>=20
> As I said before, procps is *not* necessary for the sysctl mechanism =
to have effect.
> (Think about systemd-based core-image-minimal image.)
>=20
> Busybox provides `sysctl', systemd provides `systemd-sysctl'.
> (It's an easy program, there might exist other packages that provide =
it too.)
>=20
> /etc/sysctl.conf is a configuration file which is very likely to be =
modified or created by administrators to configure kernel parameters.
> (You can't expect administrators to all start learning systemd, trying =
to understand the gap and differences. In addition, they may have =
scripts that edit /etc/sysctl.conf to automate their work.)
>=20
> The point of the symlink is to ensure that when users edit =
/etc/sysctl.conf (or create one), configurations in that file will have =
effect at boot time.
>=20
> Just think about this problem from a standpoint of user experience.

You still haven't convinced me that shipping a broken symlink is a good =
idea. I'm pretty sure it's not even allowed in out commit guidelines.=

