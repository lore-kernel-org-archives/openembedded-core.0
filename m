Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6C36E7E5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 10:23:18 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w61so9505901wes.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 02:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=/1sVJCapQ9/sI/J7Ly85bG0nzBD1vWiek9+zXog2Yhs=;
	b=LEqLsVIINkv9GKJ1S037xidDBnsTNnAr+kkSqsGkyTFr/MLlO95P15rVjPc3zrkv1h
	IJ63yRI0fAxxbvVq+YPkW/AJKoWtDpFw4Uin08NkFavTA5D1VBKXcbZS9LWRStp0abqt
	hah16UF5XrnDJUOLJDtIOwB+VT3s4Sr2MXUKjTV5C3S5Agpp1x4MJaM5jyyV4GmGO2my
	QYUE1RP1row9KgdiKVVyJkFcIWH8P3aITBoZBNnpZXrPAh8ZlgvipjXsB3TxzE+DSaoG
	LCR+W5gQACduf9wgy5cf19uclVMVy4XhgA+C3P9N4TX6tZtlJzh9+V9Y430/vVhANoQR
	Tapg==
X-Gm-Message-State: ALoCoQnmcVS/4eTMlguoeMhGSS6HFJnWSlR4MQPXBbOGzSmfMVPJB+bnDa+2rMdVTaBmnoX+MBTO
X-Received: by 10.181.13.112 with SMTP id ex16mr5610513wid.23.1392459798554;
	Sat, 15 Feb 2014 02:23:18 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id t6sm12380598wix.4.2014.02.15.02.23.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Feb 2014 02:23:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1392193887.7120.191.camel@ted>
Date: Sat, 15 Feb 2014 11:27:59 +0100
Message-Id: <8F835027-D28B-42A9-B8A7-49E85688B376@dominion.thruhere.net>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<52FB2ADF.70209@linaro.org> <1392193887.7120.191.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: Koen Kooi <koen.kooi@linaro.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 15 Feb 2014 10:23:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 feb. 2014, om 09:31 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Wed, 2014-02-12 at 09:03 +0100, Koen Kooi wrote:
>> On 01/15/2014 11:15 AM, Koen Kooi wrote:
>>> I've limited it to 64bit targets, but to be honest debug splitting =
doesn't make sense for grub since it won't run in your rootfs and =
attaching gdb is pretty much impossible.
>>>=20
>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>> ---
>>>  meta/recipes-bsp/grub/grub_git.bb | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>=20
>>> diff --git a/meta/recipes-bsp/grub/grub_git.bb =
b/meta/recipes-bsp/grub/grub_git.bb
>>> index 1796e7f..bc79cfa 100644
>>> --- a/meta/recipes-bsp/grub/grub_git.bb
>>> +++ b/meta/recipes-bsp/grub/grub_git.bb
>>> @@ -51,8 +51,13 @@ do_configure_prepend() {
>>>  do_install_append () {
>>>      install -d ${D}${sysconfdir}/grub.d
>>>      install -m 0755 ${WORKDIR}/40_custom =
${D}${sysconfdir}/grub.d/40_custom
>>> +
>>>  }
>>>=20
>>> +# debugedit chokes on 64 bit platforms
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 =3D "1"
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 =3D "1"
>>> +
>>>  RDEPENDS_${PN} =3D "diffutils freetype"
>>>  FILES_${PN}-dbg +=3D "${libdir}/${BPN}/*/.debug"
>>>=20
>>>=20
>>=20
>> Since the package.bbclass change went in yesterday: ping
>=20
> Should we just do this for 64 bit targets or should we be doing it
> unconventionally?

It is needed for every 'bare metal' binary we run through debugedit. But =
for some reason debugedit doesn't choke on 32bit binaries. I'm not sure =
what the right answer is here, I only fixed it for the archs I ran into =
problems myself.=20

I'd be happy to respin this patch if you let me know what the preferred =
solution is.

regards,

Koen=

