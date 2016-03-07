Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp23.services.sfr.fr (smtp23.services.sfr.fr [93.17.128.19])
	by mail.openembedded.org (Postfix) with ESMTP id 42D6A731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 15:53:44 +0000 (UTC)
Received: from filter.sfr.fr (localhost [111.250.196.5])
	by msfrf2304.sfr.fr (SMTP Server) with ESMTP id 7B8DB70000EA;
	Mon,  7 Mar 2016 16:53:44 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=herve.jourdain@neuf.fr
Received: from nb-hjo (111-250-196-5.dynamic.hinet.net [111.250.196.5])	(using
	TLSv1 with cipher AES128-SHA (128/128 bits))	(No client certificate
	requested)
	by msfrf2304.sfr.fr (SMTP Server) with ESMTP id 358207000077;
	Mon,  7 Mar 2016 16:53:42 +0100 (CET)
X-SFR-UUID: 20160307155343219.358207000077@msfrf2304.sfr.fr
Received: from nbhjo
	by nb-hjo (PGP Universal service);  Mon, 07 Mar 2016 16:53:42 +0100
X-PGP-Universal: processed;	by nb-hjo on Mon, 07 Mar 2016 16:53:42 +0100
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <00ab01d1787c$106f4320$314dc960$@neuf.fr>
	<CAJTo0LadXojbpycCUR4R2KA3rRO-VL5c604Tq4A+MHoDEhJY8g@mail.gmail.com>
In-Reply-To: <CAJTo0LadXojbpycCUR4R2KA3rRO-VL5c604Tq4A+MHoDEhJY8g@mail.gmail.com>
Date: Mon, 7 Mar 2016 16:53:37 +0100
Message-ID: <00cd01d17889$8623c980$926b5c80$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHi/3KI1klVJIMvDbYu8NzNB6oiMQJnmm5pnxfWLyA=
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] systemd: binfmt should be added to SYSTEMD_PACKAGES
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
X-List-Received-Date: Mon, 07 Mar 2016 15:53:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hmmm=E2=80=A6 It seems the subject line was cut=E2=80=A6 It was supposed =
to say "system: binfmt should be added to SYSTEMD_PACKAGES only if =
binfmt is enabled".
Yep, the second condition was overkill, I agree.
I'll send a new version of the patch.

Thanks,

Herve

From: Burton, Ross [mailto:ross.burton@intel.com]=20
Sent: lundi 7 mars 2016 15:39
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] systemd: binfmt should be added =
to SYSTEMD_PACKAGES

First, the commit message isn't accurate (binfmt was already in =
SYSTEMD_PACKAGES).

On 7 March 2016 at 14:17, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
-SYSTEMD_PACKAGES =3D "${PN}-binfmt"
-SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"
+SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
'${PN}-binfmt', '', d)}"
+SYSTEMD_SERVICE_${PN}-binfmt =3D "${@bb.utils.contains('PACKAGECONFIG',
'binfmt', 'systemd-binfmt.service', '', d)}"

You don't need to conditionalise SYSTEDM_SERVICE_${PN}-binfmt, just =
SYSTEMD_PACKAGES.

Ross

