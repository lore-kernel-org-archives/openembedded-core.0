Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAE87207F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 10:33:45 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x12so828811wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 02:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=oWw0884ZWthN40qXx6/NOl9ASxwc7PASY8YFQb/RhU8=;
	b=fPH6zOum+2LZhyZOXmtxqIH0tXMl1MAFqPQxS30abRF45CzXOo/U1gYZccuBQqFY7T
	rya/X+A5uR7I81M04k8VGHsh+PZrsNRPTL7q/AVMFI92W3h2cIm3FDigez3Z3qRemiW4
	IIAberrkCPa1RgB1zX39sHgwdqdlMW9wcViwSsYHEQUEgxWhYglZ5NfzFYwjt4vlMEfp
	e75GtDf5IoXLGfIMnAyWrF3DNy3kPg1lE2Oaqj6x6yN9BQ+PRCnK98bqfXoO80aSPBkh
	rtdGQUgjLvlNTRQjpesdSxQv7Ctg++dG+rC0Y75WeFr6xsgXU1gHEF6NytGP56ypvvlF
	DD3g==
X-Gm-Message-State: ALoCoQlHw1nxILG7nuVXqXKxKxWddw4vrTcJp79s8pQqN1XmprbG8/gsp4xVNIAMPhjBbWTfW8hE
X-Received: by 10.194.63.145 with SMTP id g17mr4296399wjs.80.1415270025692;
	Thu, 06 Nov 2014 02:33:45 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id t16sm1718010wjr.28.2014.11.06.02.33.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Nov 2014 02:33:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <545B2A5F.5040208@windriver.com>
Date: Thu, 6 Nov 2014 11:33:42 +0100
Message-Id: <745681A3-F15C-4D06-93C6-3342E014B672@dominion.thruhere.net>
References: <cover.1415258952.git.Qi.Chen@windriver.com>
	<a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
	<51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
	<545B2A5F.5040208@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
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
X-List-Received-Date: Thu, 06 Nov 2014 10:33:53 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


> Op 6 nov. 2014, om 08:59 heeft ChenQi <Qi.Chen@windriver.com> het =
volgende geschreven:
>=20
> On 11/06/2014 03:48 PM, Koen Kooi wrote:
>> Op 6 nov. 2014, om 08:32 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>>=20
>>> In systemd, /etc/sysctl.conf is actually ignored by systemd-sysctl,
>>> because this command only examine *.conf files under a bunch of =
directories
>>> like /etc/sysctl.d or /usr/lib/sysctl.d.
>>>=20
>>> The problem is we are used to configuring kernel parameters in =
/etc/sysctl.conf,
>>> so it would be really strange if the configuration in that file =
doesn't have any
>>> effect.
>>>=20
>>> This patch reference Fedora's solution to this problem, creating a =
symlink to
>>> /etc/sysctl.conf under /etc/sysctl.d/.
>> Shouldn't this be done in procps instead?
>>=20
>=20
> Actually, the problem is not about `sysctl' command.
> procps provides `sysctl', but busybox also provides this command.
> It's very possible that on our generated image, procps is not =
installed but `sysctl' command is available.
> Both busybox's and procps's `sysctl' command takes /etc/sysctl.conf =
into consideration.

Right, but only procps installs that file.

> Now, systemd provides a similar utility called `systemd-sysctl' which =
is executed at boot time via systemd-sysctl.service.
>=20
> So our actually problem is that systemd-sysctl ignores =
/etc/sysctl.conf, which makes it somewhat strange, especially to users =
who are used to configuring parameters in sysctl.conf.
> And this patch solves this problem by adding a symlink under =
/etc/sysctl.d/.
>=20
> That's why I think we should put this in systemd.

You're adding a symlink to a file which only exists if you install =
procps, which isn't in RDEPENDS.=

