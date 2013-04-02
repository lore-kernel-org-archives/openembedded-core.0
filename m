Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UN29v-0000NY-99
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 16:26:06 +0200
Received: by mail-da0-f52.google.com with SMTP id f10so207298dak.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=krFtrcHWTQRG8lqlhIK2g21/HrbpdpBudhH6n8dcFZc=;
	b=Hm7O+hu5nvbtwTstWHWp1yW7nD+imuex1FXgyM4D+RokVvvJIv/J9t9cKmjoAGSk+H
	DuaywwNCfHErW0PdSiv8kMn31CLIs9DT6B2VO734K+dq1Iq/P4sF1BV39Q7QXnRa2xge
	cXp7xXSS/k7HeRXTRWQ4rXLO8Q7A37hciBUwSwJPf7wfyJDaQwNZRlV6Ou0JuC5Io8A1
	2S1jiCz/7Uw3ESNkhPo9tlgEr8Y65Oj2zPEc4ekrweBqE/d8saMeDHq5KPw8THLeDIE/
	uTaDSzEJYveJyheMATHgB62/ipUI+ci8+X5a4nuFb1NvkuEwhCG01cPqoNLEjYuXA+A4
	O2gA==
X-Received: by 10.66.13.35 with SMTP id e3mr25592933pac.186.1364911728622;
	Tue, 02 Apr 2013 07:08:48 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id lb8sm2539946pab.13.2013.04.02.07.08.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 07:08:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CA+AhUGyzFN2PTZUg5BESHKYdMi7gsj0V2bdJAGCd0rg9147NTQ@mail.gmail.com>
Date: Tue, 2 Apr 2013 07:08:51 -0700
Message-Id: <6D83984A-F7D2-4127-9853-131030908330@gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<CA+AhUGyzFN2PTZUg5BESHKYdMi7gsj0V2bdJAGCd0rg9147NTQ@mail.gmail.com>
To: =?iso-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Tue, 02 Apr 2013 14:26:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Erik

Thanks, Yes this should fix it.


On Apr 2, 2013, at 3:58 AM, Erik Bot=F6 <erik.boto@pelagicore.com> =
wrote:

> Hi,
>=20
> On Thu, Mar 28, 2013 at 8:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> udevadm is now moved from /usr/bin to /bin so account for that
>> bash completions for udevadm should be packages with udev-utils
>> since thats where udevadm itself is, they were in systemd package
>> which is not correct location for it
>=20
> It looks like systemd-analyze installs into /usr/bin and therefore
> isn't picked up in PACKAGE systemd-analyze. This should fix it:
>=20
> diff --git a/meta/recipes-core/systemd/systemd_199.bb
> b/meta/recipes-core/systemd/systemd_199.bb
> index ba1d133..f896187 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -119,7 +119,7 @@ PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup
> ${PN}-initramfs ${PN}-analyze ${PN}-
> USERADD_PACKAGES =3D "${PN}"
> GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
>=20
> -FILES_${PN}-analyze =3D "${base_bindir}/systemd-analyze"
> +FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
>=20
> FILES_${PN}-initramfs =3D "/init"
> RDEPENDS_${PN}-initramfs =3D "${PN}"
>=20
> Cheers,
> Erik



