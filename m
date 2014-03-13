Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 349F76EE45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:07:30 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so567895wes.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 02:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=taAj8v7KcFNNyjnuyofeqM2MLKX90pFcN8ZrBircxg0=;
	b=h75T10XrDM3dZhtrk0gXg7NjBcBCRTzPNlFyteZjW8v8K5PGfKG8vdveGYBe7CqGtc
	LXsxhXR4lRMCq7rovIv+in2nKmaDGu7szqBUAHEQl+OwGVh/kQFKvRv7puxFNCbU1UIv
	VjZqR/0K1YWdmfRqsWbmIfEFECud+u8UKsaRxI2UPgM0hTwqlLE6aXQzlY44H36WZ9cC
	/rlYD0t9GMaibNxWaU25CieDLuM1J3J+SmlEBbndqstwJShZkTeFGmsr2RTvWNz4Dh49
	2ic0Edeic8M8+r5+LRR+hY7R0fiFj4gQKY4NdRCT1ADx7WPCPgy2GtME/WgwiMxNFY34
	DW7A==
X-Gm-Message-State: ALoCoQmwLqWRM8RgBY6M4D8z4pkGRMPPSnnX4UvLo3CpFfjVACy2o40ZfSJ7IHjJcH1xh34k7vbC
X-Received: by 10.194.9.99 with SMTP id y3mr693135wja.60.1394701651335;
	Thu, 13 Mar 2014 02:07:31 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id di9sm5593132wid.6.2014.03.13.02.07.29
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Mar 2014 02:07:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8F835027-D28B-42A9-B8A7-49E85688B376@dominion.thruhere.net>
Date: Thu, 13 Mar 2014 10:08:12 +0100
Message-Id: <BA1EAF4A-F798-48CC-A7D1-6E582BB8A001@dominion.thruhere.net>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<52FB2ADF.70209@linaro.org> <1392193887.7120.191.camel@ted>
	<8F835027-D28B-42A9-B8A7-49E85688B376@dominion.thruhere.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Thu, 13 Mar 2014 09:07:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 feb. 2014, om 11:27 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 12 feb. 2014, om 09:31 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
>> On Wed, 2014-02-12 at 09:03 +0100, Koen Kooi wrote:
>>> On 01/15/2014 11:15 AM, Koen Kooi wrote:
>>>> I've limited it to 64bit targets, but to be honest debug splitting =
doesn't make sense for grub since it won't run in your rootfs and =
attaching gdb is pretty much impossible.
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>> ---
>>>> meta/recipes-bsp/grub/grub_git.bb | 5 +++++
>>>> 1 file changed, 5 insertions(+)
>>>>=20
>>>> diff --git a/meta/recipes-bsp/grub/grub_git.bb =
b/meta/recipes-bsp/grub/grub_git.bb
>>>> index 1796e7f..bc79cfa 100644
>>>> --- a/meta/recipes-bsp/grub/grub_git.bb
>>>> +++ b/meta/recipes-bsp/grub/grub_git.bb
>>>> @@ -51,8 +51,13 @@ do_configure_prepend() {
>>>> do_install_append () {
>>>>     install -d ${D}${sysconfdir}/grub.d
>>>>     install -m 0755 ${WORKDIR}/40_custom =
${D}${sysconfdir}/grub.d/40_custom
>>>> +
>>>> }
>>>>=20
>>>> +# debugedit chokes on 64 bit platforms
>>>> +INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 =3D "1"
>>>> +INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 =3D "1"
>>>> +
>>>> RDEPENDS_${PN} =3D "diffutils freetype"
>>>> FILES_${PN}-dbg +=3D "${libdir}/${BPN}/*/.debug"
>>>>=20
>>>>=20
>>>=20
>>> Since the package.bbclass change went in yesterday: ping
>>=20
>> Should we just do this for 64 bit targets or should we be doing it
>> unconventionally?
>=20
> It is needed for every 'bare metal' binary we run through debugedit. =
But for some reason debugedit doesn't choke on 32bit binaries. I'm not =
sure what the right answer is here, I only fixed it for the archs I ran =
into problems myself.=20
>=20
> I'd be happy to respin this patch if you let me know what the =
preferred solution is.

Ping=

