Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URO4r-0002ol-KA
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 16:38:50 +0200
Received: by mail-ea0-f179.google.com with SMTP id f15so1796270eak.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 07:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WYxpHyD0aIAkxQYoQa4O4fxHVjPv58hILNn4HZX1Zgo=;
	b=CLsBzAkO+n1aUOK18w3N8laHc1If9Fh68YOCKie/upqTxcXWJgD3vjngidcnZZ5S7T
	52Yap6UksquzEhM7dnfluRndzchCKzCWVzksL2QnaMnXlJ4ulHDWNAhuMwkCfzIjEdV6
	SohM3mg1dtZyukB63wd7TlCZWqCmcEq7I9obkHx/Iv/zkYwhuOB7Nduls7BqNHW1BRSp
	XmtyvNx/GGjmc0pP+qQ50RDQMtXWqSM+Jf5tlExfIpBcZs9qBT52NwiwuCvd6MgSqN0s
	TFq25R0upJiy30qd6FFUVItch1VO5rAi4Kx4jPqfaIKRu0ibLfPehbwjB3Mhf7vikfqt
	/n9w==
X-Received: by 10.15.31.197 with SMTP id y45mr51201984eeu.18.1365949278229;
	Sun, 14 Apr 2013 07:21:18 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id f47sm21710269eep.13.2013.04.14.07.21.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 07:21:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130414140517.GA2475@jama>
Date: Sun, 14 Apr 2013 16:21:15 +0200
Message-Id: <7E440FB0-F32A-4E9F-A849-339B3102CF7C@dominion.thruhere.net>
References: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
	<20130414140517.GA2475@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlwpAi9CLJEoqQNCv1iuCXHLP6XwdHrm8qvClni2y+zNFgDFRnhi1GAcKNm5Tp8edqwTB1B
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] systemd: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Sun, 14 Apr 2013 14:38:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 apr. 2013, om 16:05 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Sun, Apr 14, 2013 at 03:55:22PM +0200, Koen Kooi wrote:
>> In the original udev and systemd updates these extra conf rules and =
scripts where removed and moved to a different recipe to avoid pulling =
them in by default, making them opt-in. The systemd merge into oe-core =
regressed this into making it impossible to opt out of it when using =
package feeds for upgrades.
>>=20
>> Change it back to opt-in for images/packagegroups.
>=20
> Maybe RSUGGESTS?

Not sure if that fixes the case where people do want it. I explicitly =
don't want this ending up in my rootfs (BAD_RRECOMMENDS might work =
here), but that doesn't work when doing 'opkg upgrade'.=20

I'm just trying to fix regressions compared to the meta-oe udev/systemd =
state in 1.3 :)

regards,

Koen

>=20
> Cheers,
>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>=20
>> Since udev-extraconf is persona non grata in angstrom I have no idea =
what depends on it, so please tell me what needs to get fixed after =
removing this.
>>=20
>> meta/recipes-core/systemd/systemd_199.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_199.bb =
b/meta/recipes-core/systemd/systemd_199.bb
>> index 0d07f85..fbf2a2f 100644
>> --- a/meta/recipes-core/systemd/systemd_199.bb
>> +++ b/meta/recipes-core/systemd/systemd_199.bb
>> @@ -202,7 +202,7 @@ FILES_udev-dbg +=3D "/lib/udev/.debug"
>>=20
>> RDEPENDS_udev +=3D "udev-utils"
>> RPROVIDES_udev =3D "hotplug"
>> -RRECOMMENDS_udev +=3D "udev-extraconf udev-hwdb"
>> +RRECOMMENDS_udev +=3D "udev-hwdb"
>>=20
>> FILES_udev +=3D "${base_sbindir}/udevd \
>>                ${base_libdir}/systemd/systemd-udevd \
>> --=20
>> 1.8.1.4
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



