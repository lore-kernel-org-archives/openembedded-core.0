Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web12.1308.1614886774419124364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 11:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@datenfreihafen.org header.s=2021 header.b=qPJkKtX1;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185, mailfrom: stefan@datenfreihafen.org)
Received: from [IPv6:2003:e9:d737:8f8d:1ea0:7bd1:67b7:360c] (p200300e9d7378f8d1ea07bd167b7360c.dip0.t-ipconnect.de [IPv6:2003:e9:d737:8f8d:1ea0:7bd1:67b7:360c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id A661FC05FB;
	Thu,  4 Mar 2021 20:39:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1614886771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLW9CvTLBmdcTKWeutevZldnjc4GuKmv1E8/13Pojnk=;
	b=qPJkKtX10tzV2tdjUL6w+urBWlRNKujiQd5M6m1o8kDvc2IwFZn/72b+f1de0NuxY1LfHE
	WL3tUF/ll0JKUlyFwughfNaP0BNOKzrqpmmy/IqJyrRh7Xtc6SWmb/UebT1R9V3ZD2pMn7
	mpevr6xUiybh34is2B3f0rVLr3ZsEy4J/kIX2JuEVNxfkEe8Va8LlVsjVEmcInbo89Qsdw
	JDKNHzDZYj2rUeXg/H9IDLXqlonepT7QBv6FUl9xV5htAtmeE0Cx+/Et7/RApRJyn1Mwa2
	1Tq/NIFM0czMJz9zn39Ck4XkixiK3yvDILpIToerAKNTj6OQWj8ry+fCrwqDbg==
Subject: Re: [OE-core][PATCH] systemd-conf: Allow systemd to manage QEMU wired networks
From: "Stefan Schmidt" <stefan@datenfreihafen.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Joshua Watt <JPEWhacker@gmail.com>, openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com
References: <20210115214903.11811-1-JPEWhacker@gmail.com>
 <468148270ddf4d915287e381785974d4319ab2ef.camel@linuxfoundation.org>
 <b01e36af-00d1-cffd-e5d5-37eb9b1e56e7@datenfreihafen.org>
Message-ID: <35189fa1-66f0-9fa3-4723-499a42e25b0f@datenfreihafen.org>
Date: Thu, 4 Mar 2021 20:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b01e36af-00d1-cffd-e5d5-37eb9b1e56e7@datenfreihafen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello.

On 03.03.21 16:52, Stefan Schmidt wrote:
> Hello Richard.
>=20
> On 17.01.21 10:19, Richard Purdie wrote:
>> On Fri, 2021-01-15 at 15:49 -0600, Joshua Watt wrote:
>>> Allows systemd to manage wired network interfaces just like on actual
>>> hardware. Systemd seems to be smart enough to not enable DHCP if the
>>> interface was assigned a IP address in the kernel (e.g. by runqemu), =
so
>>> the existing use cases should continue to work.
>>>
>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>> ---
>>> =C2=A0=C2=A0meta/recipes-core/systemd/systemd-conf_247.2.bb | 3 ---
>>> =C2=A0=C2=A01 file changed, 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd-conf_247.2.bb=20
>>> b/meta/recipes-core/systemd/systemd-conf_247.2.bb
>>> index 944b56ff82..ea35e83f4f 100644
>>> --- a/meta/recipes-core/systemd/systemd-conf_247.2.bb
>>> +++ b/meta/recipes-core/systemd/systemd-conf_247.2.bb
>>> @@ -29,9 +29,6 @@ do_install() {
>>> =C2=A0=C2=A0# Based on change from YP bug 8141, OE commit=20
>>> 5196d7bacaef1076c361adaa2867be31759c1b52
>>> =C2=A0=C2=A0do_install_append_qemuall() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -D -m0644 ${WORKDIR}/system.co=
nf-qemuall=20
>>> ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
>>> -
>>> -=C2=A0=C2=A0=C2=A0 # Do not install wired.network for qemu bsps
>>> -=C2=A0=C2=A0=C2=A0 rm -rf ${D}${systemd_unitdir}/network
>>> =C2=A0=C2=A0}
>>
>> We did this for a reason. In testing we're seeing:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/183=
1
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/183=
0
>>
>> which I suspect could be related to this.
>=20
> I looked into this a bit more. We started to use the network unit file=20
> for qemu as well, because we have a use case where it uses DHCP. That=20
> indeed broke the runqemu static IP configuration from the kernel=20
> commandline.
>=20
> What we do here to cover both use cases is to skip the unit if we find=20
> the IP to be configured on the kernel commandline. The following in the=
=20
> match section does the trick for us:
>=20
> KernelCommandLine=3D!ip
>=20
> Joshua, do you want to update the unit file accordingly or me to send a=
=20
> patch superseding yours with this change integrated?

I went ahead and posted a patch that has the two changes and matches=20
(sic) what we have in place in our layers.

I would expect this to pass the yocto autobuilder now, but if not I=20
would need to get access to the test files to figure out what wen wrong.

regards
Stefan Schmidt
