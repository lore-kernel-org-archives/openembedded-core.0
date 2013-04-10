Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPqJO-0008QH-83
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 10:23:24 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so84380eaj.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 01:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=iwmQ6AT+cLhu6y7P+CB40dUWKXBRXFGx+fKY4h83eRQ=;
	b=UBsRdbDx5OSIKfEuRkglvSObs+wUgTgrOFjn6YgCUYYBEQv6zy6tJHaq2SWoPpOXMD
	xQuomPYEbPyO/Rci2gnnQHjdhfVValqp8qRZ9AdPFaxwYc2CmbBjoUZJ/w51YsNzGHQ6
	stNKVXyxveXQjsORx1/06O3lPKFbSmF6tGUnTFYtpylk1M34Cm4qxNOGzNuiywieiLE3
	Lcw6d2dliFkoGpEk6D+jAgDprfD9Cv4PDko3mxGHQ/2vIW/8crHm623ziULSxbekQ5ww
	neTkmM1kpaSMe+luoC3qVnIZYFe+FjSRddH/HuBmMSN5oHi0Yi9upFZINkQHbYQlGjjD
	4W2w==
X-Received: by 10.15.107.205 with SMTP id cb53mr3088873eeb.14.1365581161240;
	Wed, 10 Apr 2013 01:06:01 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cd3sm32404072eeb.6.2013.04.10.01.05.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 01:06:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365579840.12407.123.camel@ted>
Date: Wed, 10 Apr 2013 10:05:59 +0200
Message-Id: <544B6E02-5D93-409C-9B4B-F51980066B27@dominion.thruhere.net>
References: <1365578806-1907-1-git-send-email-koen@dominion.thruhere.net>
	<1365579840.12407.123.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnnYIVIcLTMn43gHKrU8jIu615ecxecRlaE3WlMFGm3zC8/Thd1jyAQchsBfka4Y2iwC5nU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Wed, 10 Apr 2013 08:23:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 apr. 2013, om 09:44 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Wed, 2013-04-10 at 09:26 +0200, Koen Kooi wrote:
>> This allows a clean seperation between all image outputs and making =
it
>> possible to have convinience symlinks to make it ready to deploy. And
>> while it isn't a valid reason, it must be mentioned: BSP layers which
>> do use convenience symlinks already don't step on files owned by
>> others anymore.
>>=20
>> I assumed this was the default behaviour in OE-classic, but as it
>> turns out every DISTRO set it to deploy/images/$MACHINE on its own.
>>=20
>> Code inspections shows that the all references to the image deploy =
dir
>> in classes and scripts in OE-core do the right thing and parse the
>> DEPLOY_DIR_IMAGE variable.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/conf/bitbake.conf | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> I'm pretty sure someone proposed something like this (relocating =
output)
> just before danny. Changing something like this just before release is =
a
> *really* bad idea. It breaks the docs and the assumptions the
> autobuilder and several scripts (e.g. runqemu and the qemuimage =
testing)
> make about where output ends up.

It is weird that runqemu gets some vars from bitbake -e, and others from =
hardcoding them. v2 should address that.

> So as I said last time, if we want to do something like this, lets do =
it
> at the start of development of a release, not the end.

I sent it to be in time for the start of the new release :) It sure =
wasn't meant to go into 1.4.=20

regards,

Koen=


