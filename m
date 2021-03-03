Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web10.8637.1614786741192195009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 07:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@datenfreihafen.org header.s=2021 header.b=FM608O0j;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185, mailfrom: stefan@datenfreihafen.org)
Received: from [IPv6:2003:e9:d72a:21f6:829b:197c:2f2f:30bf] (p200300e9d72a21f6829b197c2f2f30bf.dip0.t-ipconnect.de [IPv6:2003:e9:d72a:21f6:829b:197c:2f2f:30bf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 955BFC05FB;
	Wed,  3 Mar 2021 16:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1614786737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oKI5xzIhWzZFtWvOvBC132iDzgEzYJMRLBU6WCq7J8M=;
	b=FM608O0jJ8pDAcutDTDay4Ujj8H3dM/GESdKeIYg3dXoeOCi6dXM9r+dIQOo48dEOPPKS+
	Xf0ewpqK5L4fPy82oea8lyeknDz3XcF7LBUYC+Tr8pan8oDSRK6ryhpnzlKXDYM4dsS5qk
	JMxAChPfqbyB5uMZdDGQ1NyDBrLt6MXzuUT8g7YmQI4Vwvh404+D6y8c4W9u8Xqw7Q6jZr
	7PPNq7uor/faHUc2d2o1JE/gMv/G+ewYvieOLSCrBX8IqSN8xM/IQW88whdYRRYhPmCIov
	faPYoa4WoqRyFy2/ObOOBHbZZrPViy0KoMgPbH5YZJ12IHw6IdKslIPbjBTwJQ==
From: "Stefan Schmidt" <stefan@datenfreihafen.org>
Subject: Re: [OE-core][PATCH] systemd-conf: Allow systemd to manage QEMU wired networks
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Joshua Watt <JPEWhacker@gmail.com>, openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com
References: <20210115214903.11811-1-JPEWhacker@gmail.com>
 <468148270ddf4d915287e381785974d4319ab2ef.camel@linuxfoundation.org>
Message-ID: <b01e36af-00d1-cffd-e5d5-37eb9b1e56e7@datenfreihafen.org>
Date: Wed, 3 Mar 2021 16:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <468148270ddf4d915287e381785974d4319ab2ef.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello Richard.

On 17.01.21 10:19, Richard Purdie wrote:
> On Fri, 2021-01-15 at 15:49 -0600, Joshua Watt wrote:
>> Allows systemd to manage wired network interfaces just like on actual
>> hardware. Systemd seems to be smart enough to not enable DHCP if the
>> interface was assigned a IP address in the kernel (e.g. by runqemu), s=
o
>> the existing use cases should continue to work.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  =C2=A0meta/recipes-core/systemd/systemd-conf_247.2.bb | 3 ---
>>  =C2=A01 file changed, 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-conf_247.2.bb b/meta/re=
cipes-core/systemd/systemd-conf_247.2.bb
>> index 944b56ff82..ea35e83f4f 100644
>> --- a/meta/recipes-core/systemd/systemd-conf_247.2.bb
>> +++ b/meta/recipes-core/systemd/systemd-conf_247.2.bb
>> @@ -29,9 +29,6 @@ do_install() {
>>  =C2=A0# Based on change from YP bug 8141, OE commit 5196d7bacaef1076c=
361adaa2867be31759c1b52
>>  =C2=A0do_install_append_qemuall() {
>>  =C2=A0	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd=
_unitdir}/system.conf.d/01-${PN}.conf
>> -
>> -	# Do not install wired.network for qemu bsps
>> -	rm -rf ${D}${systemd_unitdir}/network
>>  =C2=A0}
>=20
> We did this for a reason. In testing we're seeing:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/1831
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/1830
>=20
> which I suspect could be related to this.

I looked into this a bit more. We started to use the network unit file=20
for qemu as well, because we have a use case where it uses DHCP. That=20
indeed broke the runqemu static IP configuration from the kernel=20
commandline.

What we do here to cover both use cases is to skip the unit if we find=20
the IP to be configured on the kernel commandline. The following in the=20
match section does the trick for us:

KernelCommandLine=3D!ip

Joshua, do you want to update the unit file accordingly or me to send a=20
patch superseding yours with this change integrated?

regards
Stefan Schmidt



