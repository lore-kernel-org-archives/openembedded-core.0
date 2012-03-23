Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB9Eg-0002Sn-W4
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:29:15 +0100
Received: by wera1 with SMTP id a1so2876879wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6VbgynzToNWI+cpucH+26CoWe2SbLN/WYt3P75vFWS8=;
	b=hSAAhxcxtIOqB+0aVqEvhwsq1mfisN7fMlLqsCCsJLbrPDMPUK6jU4Ivj4LdGUBY+u
	+R/ddgnl/ANsS8VY4I8Cn02lRvKO1D904fXpClX5cG+Eu4lcCveqLCFGcSO8kzYab8n8
	xN7Q8v5TwrY6e1ym5W016D10bcv1kUdRHtgBsiNjoA9Phjb0utFogUXkxsfqqgBiBKgO
	wPPo+YGxTASb1yOrphBj5HO1tjus53lBEz1wVJHJ/mYOGeoo0iveXy0URZ4DuaY3vMwd
	z1ZEvf5w1mrlxpZqb2qqL9Abc9krpszMdjIjs01hsXSO+VUXVjpbjDSvAdJNJggqvw2R
	vprg==
Received: by 10.180.20.47 with SMTP id k15mr8636444wie.19.1332526818598;
	Fri, 23 Mar 2012 11:20:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm15733120wiy.7.2012.03.23.11.20.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 11:20:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F6CB9AF.8090809@opendreambox.org>
Date: Fri, 23 Mar 2012 19:20:16 +0100
Message-Id: <B02EB5DF-A881-4745-9434-80A817FCCF12@dominion.thruhere.net>
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
	<1332520659-12233-2-git-send-email-obi@opendreambox.org>
	<6382DE52-47CF-478A-A10A-26F27EF1AE06@dominion.thruhere.net>
	<4F6CB9AF.8090809@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnOMlVGJcc/afdSmPi14ZVabTEzE38eDDmadkA199F+7cCCR1olxrlRMV9V+/Zzmfj9ewVT
Subject: Re: [PATCH 2/4] module.bbclass: sync pkg_post{inst, rm} with kernel.bbclass
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
X-List-Received-Date: Fri, 23 Mar 2012 18:29:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 18:58 heeft Andreas Oberritter het volgende =
geschreven:

> On 23.03.2012 18:20, Koen Kooi wrote:
>>=20
>> Op 23 mrt. 2012, om 17:37 heeft Andreas Oberritter het volgende =
geschreven:
>>=20
>>> * Run depmod when the rootfs gets generated.
>>>=20
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> ---
>>> meta/classes/module.bbclass |    9 +++++----
>>> 1 files changed, 5 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/meta/classes/module.bbclass =
b/meta/classes/module.bbclass
>>> index 53c16b7..e370b24 100644
>>> --- a/meta/classes/module.bbclass
>>> +++ b/meta/classes/module.bbclass
>>> @@ -37,15 +37,16 @@ module_do_install() {
>>> }
>>>=20
>>> pkg_postinst_append () {
>>> -	if [ -n "$D" ]; then
>>> -		exit 1
>>> -	fi
>>> +if [ -n "$D" ]; then
>>> +	${HOST_PREFIX}depmod -A -b $D -F =
${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>>> +else
>>> 	depmod -a
>>> 	update-modules || true
>>> +fi
>>=20
>> That encodes host system paths into the package, which is not a good =
thing for tools like narcissus and hob.
>=20
> So should we remove the same lines from kernel.bbclass?

I think so, I don't think we want to hand out binaries with scripts that =
say things like:

foo-linux-depmod -F /storage/openembedded-is-a-poopyhead/something

regards,

Koen=


