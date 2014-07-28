Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id D92DF704E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 06:31:11 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so3816001wib.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 23:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=qIYEDqp47vip34Q8knAapehEZDehB/xfIMEJ7+4nEXE=;
	b=P8Fh8Jal9DB4m/pcazNQUnJ7lWvUcH4Or65FjTempdc+LdZ4D8He5+8Qc8+XkFilfd
	enM2NQZgkTqgJk4zVX2Zjkk8ZZz/Jk8dpxv/KDFI+ZG+t6UDtWhnrwFJiavtU7QTBqN4
	wa5DkQS4MvaT54KtoluddhKC4XYqEJWRn9tIo0Upf/Sj9HvL0iu8A7uKI7jQjRuXaTrf
	GFcoOio3STopzLVkw6p/r3vUVr+e03MZaMadjH1Imz8lvMX1XL8m+wrl4DaaYizYgH+z
	aD24KHuJhPaaR74tzwmtXd5sc2lsf7xRblx4+cOGlIzMScghWe6Pz892kbUb0ovRgjUO
	bWhQ==
X-Gm-Message-State: ALoCoQnJaFmNDzE2ISkBRu2J/SkjJ33O4VY9FtPc0aUAEociWv2/a7TVlrYF6pRs/4MWVtRWdTuS
X-Received: by 10.180.20.40 with SMTP id k8mr10923427wie.54.1406529072592;
	Sun, 27 Jul 2014 23:31:12 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	wi9sm47063027wjc.23.2014.07.27.23.31.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Jul 2014 23:31:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53D5B441.4050902@windriver.com>
Date: Mon, 28 Jul 2014 08:31:10 +0200
Message-Id: <DC28F4FA-9701-404C-9192-A61B9FD968E9@dominion.thruhere.net>
References: <cover.1406279934.git.Qi.Chen@windriver.com>
	<f11514aea79be9f009030d3acb5964de15a26223.1406279934.git.Qi.Chen@windriver.com>
	<33866F61-B200-4CA4-AC52-69BD3EB109A1@dominion.thruhere.net>
	<53D5B441.4050902@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: upgrade to 215
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
X-List-Received-Date: Mon, 28 Jul 2014 06:31:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2014, om 04:24 heeft ChenQi <Qi.Chen@windriver.com> het =
volgende geschreven:

> On 07/25/2014 06:56 PM, Koen Kooi wrote:
>> Op 25 jul. 2014, om 11:20 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>>=20
>>> Upgrade systemd from 213 to 215.
>>>=20
>>> systemd-older-kernel.patch is removed as it's fixed in 215.
>> NAK! This will drop libraries and and leave files unpackages, you =
need something like this:
>>=20
>> @@ -146,7 +146,9 @@ do_install_ptest () {
>>    python populate_packages_prepend (){
>>      systemdlibdir =3D d.getVar("rootlibdir", True)
>> +    prefixlibdir =3D d.getVar("libdir", True)
>>      do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', =
'Systemd %s library', extra_depends=3D'', allow_links=3DTrue)
>> +    do_split_packages(d, prefixlibdir, '^lib(.*)\.so\.*', 'lib%s', =
'Systemd %s library', extra_depends=3D'', allow_links=3DTrue)
>>  }
>>  PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
>>  @@ -198,7 +200,10 @@ RRECOMMENDS_${PN}-vconsole-setup =3D "kbd =
kbd-consolefonts"
>>  CONFFILES_${PN} =3D "${sysconfdir}/systemd/journald.conf \
>>                  ${sysconfdir}/systemd/logind.conf \
>>                  ${sysconfdir}/systemd/system.conf \
>> -                ${sysconfdir}/systemd/user.conf"
>> +                ${sysconfdir}/systemd/user.conf \
>> +                ${libdir}/sysusers.d/systemd.conf \
>> +                ${libdir}/sysusers.d/basic.conf \
>> +                "
>>    FILES_${PN} =3D " ${base_bindir}/* \
>>                  ${datadir}/bash-completion \
>> @@ -218,7 +223,8 @@ FILES_${PN} =3D " ${base_bindir}/* \
>>                  ${rootlibexecdir}/systemd/* \
>>                  ${systemd_unitdir}/* \
>>                  ${base_libdir}/security/*.so \
>> -                ${libdir}/libnss_myhostname.so.2 \
>> +                ${libdir}/libnss_*.so.* \
>> +                ${libdir}/sysusers.d \
>>                  /cgroup \
>>                  ${bindir}/systemd* \
>>                  ${bindir}/busctl \
>>=20
>>=20
>> lib*udev have moved, 2 nss plugins were added and the sysusers files =
should be added to CONFFILES.
>>=20
>=20
> Hi Koen,
>=20
> Which files are not packaged? I don't see any 'installed-not-shipped' =
error after upgrading.
>=20
> Note the I've added ${exec_prefix}/lib/sysusers.d to FILES_${PN}.
> And I don't think files under /lib should be added to CONFFILES.

System config files need to be in CONFFILES, even if they aren't placed =
in /etc=

