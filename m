Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rm9Ci-0003fe-Sg
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jan 2012 20:23:54 +0100
Received: by werf1 with SMTP id f1so147946wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jan 2012 11:16:19 -0800 (PST)
Received: by 10.216.135.208 with SMTP id u58mr2934839wei.56.1326568578918;
	Sat, 14 Jan 2012 11:16:18 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v28sm15779916wbo.18.2012.01.14.11.16.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jan 2012 11:16:18 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120114165429.37f2c5ef@eb-e6520>
Date: Sat, 14 Jan 2012 20:16:16 +0100
Message-Id: <590FE755-B28E-4F0F-B641-50D4C2B5A5CF@dominion.thruhere.net>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
	<20120114165429.37f2c5ef@eb-e6520>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] tzdata_2011n: provide pkg_postinst and timezone defaults
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
X-List-Received-Date: Sat, 14 Jan 2012 19:23:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 14 jan. 2012, om 16:54 heeft Eric B=E9nard het volgende geschreven:

> Le Sat, 14 Jan 2012 16:10:55 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>>> +        # Install defaults
>>> +        install -d ${D}${sysconfdir}
>>> +        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
>>> +        cp -pP ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE} =
${D}${sysconfdir}/localtime
>>=20
>> Shouldn't that be an 'ln -sf' instead of a 'cp'?
>>=20
> that would make a link from ${D} to ${S}

How about this one:

if [ -e ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ] ; then
	ln -sf ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} =
${D}${sysconfdir}/localtime
else
	echo "Timezone ${DEFAULT_TIMEZONE} not found, exiting"
	exit 1
fi



