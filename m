Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 344996E700
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:14:07 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so4912632eek.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 00:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=7IFEt7z/+m0FKW+7R3FqN4J5B3fxguKaPEly+NajFbA=;
	b=ev64Zyj3PhJcAlNRZTe2Xu9LIDbd1U7PhGtYd0FL6J7cwdrdWj4v4vBJmcv6Oq2Kx9
	PcMWAtNDBGcXkzv5o80JX3tYIGA5zhly6dAfzubqnawLUIb0MeOiH3EaK9G1b5Y4MSMk
	SwLpoGI9C59Pw5h/Xp2DZXmyj3/0jmRZNJ2NsGxfNPShEM1psh3OFRw9HrzVkW8GFeEK
	THDcBmNoldLwNAQpd7z05j0n8eTZcu79YxsQuCF8X7cVKCyTgjitpKSvv0FvVfqtzR/b
	qjS/CNNpP5ab24nH/T7hgjYBCFW/Leco42qkuKr83KFy8ze025FuH0HARPc2qxhxtX63
	3rMw==
X-Gm-Message-State: ALoCoQknkwaNFdh1IkZdAPqy4mSnfkZO2mzjgScQ6B+eCPRl2IvCttkBz42cS9J6avRunB3KHoFu
X-Received: by 10.15.43.132 with SMTP id x4mr27788841eev.59.1395126848291;
	Tue, 18 Mar 2014 00:14:08 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	cb5sm45161928eeb.18.2014.03.18.00.14.07 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Mar 2014 00:14:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1395075649-10987-1-git-send-email-sgw@linux.intel.com>
Date: Tue, 18 Mar 2014 08:14:04 +0100
Message-Id: <33178621-848B-42B4-86D0-FAF76AE23BC7@dominion.thruhere.net>
References: <1395075649-10987-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: dont use DNS lookup for Qemu
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
X-List-Received-Date: Tue, 18 Mar 2014 07:14:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mrt. 2014, om 18:00 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> Since we are always using ip address to connect to the sshd server, it =
does not need
> to use reverse DNS to look up the ip address.  This will save some =
time during testing.

This is better done in your image file as IMAGE_PREPROCESS_CMD since not =
everyone uses qemu the way you are using it.

>=20
> [YOCTO #5954]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-connectivity/openssh/openssh_6.5p1.bb | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb =
b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
> index 6c413af..9ad25fa 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
> @@ -109,6 +109,10 @@ do_install_append () {
> 		${D}${systemd_unitdir}/system/sshd.socket =
${D}${systemd_unitdir}/system/*.service
> }
>=20
> +do_install_append_qemuall() {
> +	sed -i -e 's:#UseDNS yes:UseDNS no:' ${WORKDIR}/sshd_config =
${D}${sysconfdir}/ssh/sshd_config
> +}
> +
> ALLOW_EMPTY_${PN} =3D "1"
>=20
> PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp =
${PN}-misc ${PN}-sftp-server"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


