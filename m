Return-Path: <Daniel.Klauer@gin.de>
X-Greylist: delayed 915 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Jul 2019 12:58:30 UTC
Received: from good-out-07.clustermail.de (good-out-07.clustermail.de
	[212.223.35.26])
	by mail.openembedded.org (Postfix) with ESMTP id 9E13B7EE86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 12:58:30 +0000 (UTC)
Received: from [10.0.0.17] (helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1hqd5S-0005XV-Rv
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Jul 2019 14:43:16 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1hqd5S-0003PY-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Jul 2019 14:43:10 +0200
Received: from [10.160.138.39] (10.160.138.39) by Win2012-02.gin-domain.local
	(192.168.1.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 25 Jul 2019 14:43:10 +0200
To: <openembedded-core@lists.openembedded.org>
From: Daniel Klauer <daniel.klauer@gin.de>
Message-ID: <dad4085c-9767-f4bc-e89e-462166f09d8b@gin.de>
Date: Thu, 25 Jul 2019 14:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: package.bbclass behaviour with multiple providers of a shared library
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
X-List-Received-Date: Thu, 25 Jul 2019 12:58:30 -0000
X-Groupsio-MsgNum: 127168
Content-Type: multipart/mixed; boundary="------------CE3F1FC4790B0140A4889C6B"
Content-Language: en-US

--------------CE3F1FC4790B0140A4889C6B
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi oe-core devs,

looking at package.bbclass and in particular the read_shlib_providers()
function (although, without having fully understood it):

For scanning the SHLIBSDIRS, it uses os.listdir() but seemingly without
sorting. There is a comment saying "the last one found wins". Couldn't
this cause "undefined" behaviour in case there are multiple providers of
a shared library? (meaning sometimes one provider wins, sometimes the
others, since they are in separate files in the SHLIBSDIRS)

Specifically, I saw a build failure, which I can't seem to reproduce
anymore now, with meta-freescale's openssl-qoriq, which packages
libcrypto.so.1.1/libssl.so.1.1 in libcrypto/libssl packages but also in
a openssl-qoriq-ptest package.

=2E../tmp/pkgdata/lx2160ardb/shlibs2$ grep -r
'libssl\.so\.1\.1\|libcrypto\.so\.1\.1'
openssl-qoriq-ptest.list:libssl.so.1.1:/usr/lib/openssl-qoriq/ptest:1.1.0=
g
openssl-qoriq-ptest.list:libcrypto.so.1.1:/usr/lib/openssl-qoriq/ptest:1.=
1.0g
libcrypto.list:libcrypto.so.1.1:/usr/lib:1.1.0g
libssl.list:libssl.so.1.1:/usr/lib:1.1.0g

Kind regards,
Daniel

--------------CE3F1FC4790B0140A4889C6B
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
i0nr
=3DtIpE
-----END PGP PUBLIC KEY BLOCK-----

--------------CE3F1FC4790B0140A4889C6B--
