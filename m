Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E329D185FD
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:00:32 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6928.1767880828489221289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=GCcevWOm;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=l5+E7aIY;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A69D87A0139;
	Thu,  8 Jan 2026 09:00:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 08 Jan 2026 09:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767880827; x=1767967227; bh=x+881FHBXJ
	zfcHRsTbUbOrNJTAuXjG3cmuVp6gpIA0Q=; b=GCcevWOmc9lJIDl6sxMZmEX7lQ
	07zpYjN3VV4JQFKF3Tf7fHOjaj8rusDOaYPmv3PRzW/fl8cPcbjeLBRcASEAT2QH
	Xv0xCqgQqs8EbkaIWLNZKLi5+zxissabxfldXI+F1yZlcEVvvlsB/F503I114XJJ
	Cb4mkFVNsOCh3OlTu2b+YzQVrE5g52mG7yLICFp2mCxvt4AvO+LTuk8lbg46K+iI
	dm6lGc7LqIjSgh1DFN0lO73tRvPPimZSw6nKDBprI8NSFML54XYmTnoQQeG8Zyq0
	wy2CtdZqKNPIXWaAtGyjXCFSE2vzJUg3SDJaOaixTkx0ipVi/RuWDvzZBA6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767880827; x=1767967227; bh=x+881FHBXJzfcHRsTbUbOrNJTAuXjG3cmuV
	p6gpIA0Q=; b=l5+E7aIYC6CvMoHLVLcEw/PbZ67hgrzawHDD8pmGZPj+AibcTRN
	DW50KxnNJ0hV9uqbLOWOMwpDK0SbU4YR/sJ28ou4rKaCTeNR//7Ldq03+t9qYvpy
	Id8BF/T8+i3X+CrumklVh5dmi8MNiUKpV2q/QxLr+tNejLp5wpVYW+5fiHSi8Lcq
	2l0sIU83O8UYdRXiwnxqoCQev6z7jDQoc7agfjexuI7BpKnpv08nIq9KDmzRu+Yf
	xUY5PVlMlft8EMwis4hkKYFXsFg6NlhlAlmxBmLpimHW5sxJ9h9MPLj90QEUvns5
	TZxc1Q+PHWYmiIQ2yUsYt+MaJo1epGVLuKg==
X-ME-Sender: <xms:e7hfaR35pJZyFtGwBgGuXqH1JkLCz37-ljgVVbPwsxcD_PQhWchSjQ>
    <xme:e7hfaeG-XQEv_pEu9kiAK1yscbH6iLpz4BzkPudnXa927Xvei4RWzyDBZyql7XqCd
    S44vgtjCTXGeD2uk7Z7yM3JsyTu9CSZB5q3AafkQEyUcGDERCeU4Bw>
X-ME-Received: <xmr:e7hfafhhHRitiTBtbYp6rL7t2kHCB2sINu5Yx7Cp1_0Lb9w6X08x5gDG3ZX3Wni4CM4U8HCG5zC8Yt7CYc8NZum2mFjevykRTziFGyJTpkyE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeiudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepffeivefhheekgffhieeuuefhhfehhfeghfejfe
    fgfeeigfeuieetheelieejvedunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpvdhpuddrsggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghtrhhitghkrdhvohhgvghlrg
    grrhdruggvvhesmhgrihhlsghogidrohhrghdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:e7hfaZ_PATPj_NKT7F8wQ0QrrvWn_hAof1PCwcI7bn6d9iAMp77zdA>
    <xmx:e7hfaWq-qIrvUNMLWn-lxL34Yux8X8xPysgmSSf-hIdW_IYoTI3uJQ>
    <xmx:e7hfaY86PLgAUDMcxI-MuMepGwtopyfOxOGoZKJrNgn-BBCCNlsaDg>
    <xmx:e7hfaaUbqmftzMLaLTIpcIiaadRhBT12k6CcHhZwVGyLg1Ux5Pdbig>
    <xmx:e7hfaf0xf43NunV2lTfH01kA_l1zsdWAQYMUj8kFfbjUCW3l4hpGbedu>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 09:00:26 -0500 (EST)
Message-ID: <3d5fd8da2bd0fd2443733d5c373d155ad94fd82e.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] openssh: add variable for key path
From: Paul Barker <paul@pbarker.dev>
To: patrick.vogelaar.dev@mailbox.org, 
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Jan 2026 14:00:23 +0000
In-Reply-To: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
References: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=mQINBGC756sBEADXL6cawsZRrDvICz9Y1SG0/lW1me4xpq36obh7a0IGAzp3ywNRb/4MO
 DTqP4+DD0cIFuDY41/N17g0sNlp8z+/k/IIDmNPtYQOTVmAkrkdDU4BP8dD3Cp1PUw6nrbInfujAJ
 NrVM0IVDkwKTbL2Nu1P+xns4MIpF9Kj4XN5celYJ9vEJ2n0Bo0nO5T5vg46dihIaDl+24iNIHSsHq
 YyEdMBfY8kY2RulpaAyFOuaaHdIeDkejVvO5xLSiYLjB5qrRhgH134lJXsuLOsFQ64ybGECuOasnb
 auevsPBAaroQW0pqVb9FneGrWHxMCLlQHJRqQJRdVa6bsUdp6NWra8/0msPawSrFwGQdfJBTA3aXJ
 C2CG1JxEgj6QQjEQA49DSjgzdhInbiIK8Vbp/zedM4aVue7qJnwPMTFQM9lYx63b7wLN4Tu8B9YZ0
 UFdSwMCJuqmYGsYRUYdwM3ArjS0VO6WpU+HBKvzLK5GQfUTSM8KaZ5eA2Uo2ain8SSZb+WptUYKpx
 F9jbtCPbjpZKzGuX4iHFl9eT75TM9iXJNGAjB5xigkADLwVfPoJ5E53S+KdNVuOWHugyLMPNAQHOw
 pw5Rey+0zxyzPd4wphutc93UIU5g/029ngAc7DuKCq12jl7fhkjqFlFtYPIc1k7nd+RSezmH/qRes
 bMErHSX1MBSZQARAQABtB5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj6JAlcEEwEIAEECGw
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaAzHVAU
 JCTdOhgAKCRB0l1yBt+ZrrA51EACS7IYZaliCgQEhq8nnsQotchJtIZbO6nr8tk+6gicX0loJYqsY
 P2/XZ/MaF8kWYSGPIHjiCcB8tEISUFKPAvfCu0Q/X7n62AkSUZOhsQ6T/ajCaXStv/P28kQmGzoCp
 6ljK/zALMWKvWFEbLaZprIWV8AZJxzJWhfSdb+1XnLlmwhBCfjXJeR/TlGWhNTqTO6vyAtZ5OpGgq
 6N9EG60EQd4YWYwliDhCoUYRYR8qpp9JMrsDm/dzwd/A2/3rR0zzCtkha29kHqdVJtsd7bbiVLr8/
 Zpa9Wcd7EG32CC25DUdkarU7f2P+goFVXfddGQRPy7l9uwF4kmtLGeuxWCCS8+4FPadifGvL8UoE9
 62fbxdHTzhjj0Yqs8zDgEwQUxFjpbmTseVx7QdoEe783jWqH4QhCeuo2kSjC4/VIRGDAS0/7Hq3rj
 Iqqg6zGY8YQRvUyoOLn7Ip7WbHkZOUtWPjPbxe2tgeCttZkGrLQCosH0dlC0Hm7KWs+XHFp5d8OVd
 WzIgWUvYkVaDeLHe3b6tM8AXoixS1rSQrnrAs/O/62Nx+k9+XVAy1clY2jdYOstuPvDhcqkT10RPs
 o2qQnH7RGh2DCVu1D10XwDE1CWZ4Op70BO3g/I02ojT6kG4MHh6JX9+tjpjOINQQf+rGiHzj1YZYf
 z0oc2b0NQI//cy/pDbQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaAzHVg
 UJCTdOhgAKCRB0l1yBt+ZrrBr7D/oCOAaVVHKCuFHHJjnCNuN06o7BRgBUR8IzQxDSc0WIhTSNaa7
 OWPSDanFtDJwOVhe7Ongu8ZF8gsLXg8jb9iS8J2lsm9q4tID3NCQIL0PgjI2/hKKOt1dZs4RGcFXj
 v1nVEwFcvaJE4996tr9UMeZeOtipdlnGoh4Sozs2UvWydnc8SZZ3hCqxbJiorxD7wdrR4As5rqesP
 YwiNqE4KW3jUavf1Sr0U94Umv4l5UPGQQekBxjh1ujsCo05g4IByS3RlDBxCQDvXAMBVHW20PLofD
 aFqNpynQwAdpBS/cvX7tDK2pq+Rd4YK8uuDoHxH18dfCZcGYzSEUJ6y+rbYiJGh01mJFOM0oJP4DO
 9L79mJpURUdZNhI5/GVkCCxwt6HcNt24ertMlHDQkhZ6igP7zBgzODZ1sizODISaBh4M7lyxsBl76
 0dwghNbczt5ytG37mPLWjYaiJMeU7xQtoQo3yZDQvUSMnfFMxWYJO9Hi4P6H2gnMsDrPRnfr68vfP
 rbseTtQM8cpfGnV0FzdFfHSTMJfcFA4BdeCJsn73JHuNEBMjDvUfgjN1a661nEzA5Zd26HQZQ1mQM
 zRkrHto4z7Y86q05esioZ8Vd2Dhm1SMCBY9PNd5QrGpS67uP0wGOK2o3q9eQmxjenFHGAaOuTEZWT
 UpTTTw8SSeLBAHSSQ37QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJTBBMBCAA+AhsBBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEmLKqwQCsP4K7XVRndJdcgbfma6wFAmgMx1cFCQk3ToYAC
 gkQdJdcgbfma6xTZw/2PQ+vjkegBRAHxNIMcj0j9QfP45ZE4bmyGrCDb5i8BwoAJccilT8chvVFgB
 AjG40Zx4oFcRKYYe6AkC6/B5U71307/nqPtt0gEy0VmTi0V+28eQPrNiTLa+OL9B5SGki/45N3g5V
 hdqDNdvx/P2k1cg8YsndVE5ASmdPI2l96n7dqd0fW2C/rzrYNUQ+mPyvNgOGcD82YzahLRfb2u/GV
 CWzEc2iplJeeWlUGoYHPCo4ztZDqJghCfgBab0RBJexdTyJl2QFs/osCM3yp02nTEUV/EiKbXcuWu
 4fvJ3xRtopQ49DMQtsTS3xB0vaPgPeBYb6DeJsLpR6be31mvEmhHGPEuVlxXNsXig1JNS0S+U0NhH
 R1fKNc1uwHE2eTFhFKHK+BhyzJGBWU3reEGjm9BygE9G591bz3+UASdqeT7FY7MGq55NqUVHTlW9R
 +L+IYXzlKvtcF8xDaZLo5MGD/2WTjdbMm25cMc+Nj4MpElAKdvjneViv8NIfyBnXcXi4zU89mh377
 2+rcJTO/Hy87NN1G2LEOKr9zFgvm+CLeoGi2Ay8NyrB3q5+ptE3ziYIPJmq84qFw1SUy4Nq+VF4yc
 OqpPZn7Ij1ga5IAOHNRi5MbyRFROYOeaOj7sz7S7roHQwdP3Q1qTwTOv30hlOSe6uz4PTBiEIKBQH
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5XJf7XjmaJsAv28oM0y3"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229074


--=-5XJf7XjmaJsAv28oM0y3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-01-02 at 12:27 +0100, Patrick Vogelaar via
lists.openembedded.org wrote:
> This patch adds a variable for the key directory path. This is especially
> useful when working with a read-only file system where you want to
> specify the location e.g. on a r/w partition. To be consistent, the
> change was also done for the read write path.
>=20
> For changing the path simply create a bbappend and override the
> variable.
>=20
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
> ---
>  .../openssh/openssh_10.2p1.bb                    | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_10.2p1.bb
> index 866129573f..e319f4ac24 100644
> --- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> @@ -99,6 +99,10 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_PATH_PASSWD_PROG=
=3D${bindir}/passwd"
>  # We don't want to depend on libblockfile
>  CACHED_CONFIGUREVARS +=3D "ac_cv_header_maillock_h=3Dno"
> =20
> +# This allows overriding the key location in a bbappend
> +RO_SSH_KEY_DIR ?=3D "/var/run/ssh"
> +SSH_KEY_DIR ?=3D "/etc/ssh"

The naming here is very easy to confuse, but I guess it's to match with
the 'sshd_config' and 'sshd_config_readonly' filenames. I think we
should be explicit in the RO case that we're talking about the read-only
configuration though. And we'd prefer this as a suffix instead of a
prefix.

Oh, and we should make it clear that this is specific to openssh, then
these variables could be set from a config file instead of just a
bbappend. And make it clear that it's for the host keys while we're at
it.

Many 'and's there!

So, I suggest we use:

  OPENSSH_HOST_KEY_DIR
  OPENSSH_HOST_KEY_DIR_READONLY_CONFIG

> +
>  do_configure:prepend () {
>  	export LD=3D"${CC}"
>  	install -m 0600 ${UNPACKDIR}/sshd_config ${B}/
> @@ -113,24 +117,24 @@ sshd_hostkey_setup() {
>  	# Enable specific ssh host keys
>  	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config
>  	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)=
}; then
> -		echo "HostKey /etc/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd=
_config
> +		echo "HostKey ${SSH_KEY_DIR}/ssh_host_rsa_key" >> ${D}${sysconfdir}/ss=
h/sshd_config
>  	fi
>  	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',=
d)}; then
> -		echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/ss=
hd_config
> +		echo "HostKey ${SSH_KEY_DIR}/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/=
ssh/sshd_config
>  	fi
>  	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false=
',d)}; then
> -		echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/=
sshd_config
> +		echo "HostKey ${SSH_KEY_DIR}/ssh_host_ed25519_key" >> ${D}${sysconfdir=
}/ssh/sshd_config
>  	fi
> =20
>  	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
>  	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)=
}; then
> -		echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/=
sshd_config_readonly
> +		echo "HostKey ${RO_SSH_KEY_DIR}/ssh_host_rsa_key" >> ${D}${sysconfdir}=
/ssh/sshd_config_readonly
>  	fi
>  	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',=
d)}; then
> -		echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ss=
h/sshd_config_readonly
> +		echo "HostKey ${RO_SSH_KEY_DIR}/ssh_host_ecdsa_key" >> ${D}${sysconfdi=
r}/ssh/sshd_config_readonly
>  	fi
>  	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false=
',d)}; then
> -		echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/=
ssh/sshd_config_readonly
> +		echo "HostKey ${RO_SSH_KEY_DIR}/ssh_host_ed25519_key" >> ${D}${sysconf=
dir}/ssh/sshd_config_readonly
>  	fi
>  }

Best regards,

--=20
Paul Barker


--=-5XJf7XjmaJsAv28oM0y3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV+4eBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjOgAQD6ssNB1aTx62ZsW1iF7rXbhnAkuPdpkj5K
dy5oxclC6wD/T14K5enU0Sxz3ZpeR6nTvtcJuXYiLRtemKpqS5N+yAQ=
=+UyM
-----END PGP SIGNATURE-----

--=-5XJf7XjmaJsAv28oM0y3--

