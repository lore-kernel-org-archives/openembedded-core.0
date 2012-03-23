Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB8IT-0000r7-IL
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:29:05 +0100
Received: by wgbdr12 with SMTP id dr12so2018498wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 10:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=c42Ia5L4YkJCokn3gTuKeZYI1AUU3iY/VMys+gM9hGs=;
	b=ALIR3XsbRY2KglpwhZ4imlfjXnszDY74MV3l9TnoOMG0eo4PCWzxAgS4PKhPzWAPC2
	NXOX7xXH0BWynlJZSEKqqFZ1uB2iUYYEhiOA8Up9SIe/8AHU2JK0rr1cZyKfDxtEpm4a
	1nrUM2hx6VThs6SpLGsMQI+XtJe/G+7ZeExCxnE9qeYgfkWUdXDfp/FaGfIq1Gsxo/QP
	uQuZbpbdjfcA9Ydgw1ToRJpFk29t2dSaJEzkmZG2N5lhPo61KgXZ/a2A9ggz//EFdvTQ
	h3fK/9Rz7k8l8GDLuKMnrZn20Sa2cHgpRhf5iuGoE3B257NLn9fnPR1H9b4OVW4tz1Vm
	klzw==
Received: by 10.180.94.33 with SMTP id cz1mr8357956wib.13.1332523209191;
	Fri, 23 Mar 2012 10:20:09 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm25433020wib.0.2012.03.23.10.20.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:20:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332520659-12233-2-git-send-email-obi@opendreambox.org>
Date: Fri, 23 Mar 2012 18:20:05 +0100
Message-Id: <6382DE52-47CF-478A-A10A-26F27EF1AE06@dominion.thruhere.net>
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
	<1332520659-12233-2-git-send-email-obi@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkJNIw9Ho9697pdl4mX6WyXBjwbcCiXD6ptENoUCQBooGMSsIjOOogHsQovmUkhk69iylF5
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
X-List-Received-Date: Fri, 23 Mar 2012 17:29:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 17:37 heeft Andreas Oberritter het volgende =
geschreven:

> * Run depmod when the rootfs gets generated.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> meta/classes/module.bbclass |    9 +++++----
> 1 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 53c16b7..e370b24 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -37,15 +37,16 @@ module_do_install() {
> }
>=20
> pkg_postinst_append () {
> -	if [ -n "$D" ]; then
> -		exit 1
> -	fi
> +if [ -n "$D" ]; then
> +	${HOST_PREFIX}depmod -A -b $D -F =
${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
> +else
> 	depmod -a
> 	update-modules || true
> +fi

That encodes host system paths into the package, which is not a good =
thing for tools like narcissus and hob.

regards,

Koen=


