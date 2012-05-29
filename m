Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZSXT-0002B7-5B
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 21:57:07 +0200
Received: by wgbds1 with SMTP id ds1so2502316wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 12:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=6dCW9nbarSbW3mPhoJ+ECISjrFSEF5QQGa/PNilDNNE=;
	b=hGOl5mfpCaHj7ZKpNH2dp4Yc5577bB0NTgxrki0kazTbr00BlNOIT6J6D53XTUMO1h
	4fIDhbXC3s/o33qv03XBUPl4I3BZZon9e22SOhzbEXxI0NKQOlU/YPywm3a0n5Zj8sl9
	2RaBV+8i0bFVqQaljfbOvvpBJlF1JTgCaQ3CcshBve43HHXxy8+KsF881lPtBYNKCVoW
	Xz0CY0ZsD6HQWg/dNVodLr4JPQ6YFzeNno9mGiap3Iq4uxEYkc/ZBXIYQ1NLBnNAag8E
	sB6c1ORulORWJWT+k+vvbLiDtyivO3cb6prCuMJx4LoR/SYDOrrh8nubmzcpxObDflNA
	cnUw==
Received: by 10.216.144.145 with SMTP id n17mr8741320wej.101.1338320809448;
	Tue, 29 May 2012 12:46:49 -0700 (PDT)
Received: from [192.168.1.36] (247.Red-83-60-170.dynamicIP.rima-tde.net.
	[83.60.170.247])
	by mx.google.com with ESMTPS id eb8sm30195633wib.11.2012.05.29.12.46.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 12:46:48 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Tue, 29 May 2012 21:46:48 +0200
In-Reply-To: <4FC51727.6020205@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
Message-Id: <2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
X-Mailer: Apple Mail (2.1278)
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Tue, 29 May 2012 19:57:07 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_850959F7-C66C-473D-A804-377D94F64936"

--Apple-Mail=_850959F7-C66C-473D-A804-377D94F64936
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Mark,

On May 29, 2012, at 8:36 PM, Mark Hatle wrote:
>=20
> The error above is an issue w/ the tune configuration.  In stock =
oe-core there is no 405/440 configuration.
>=20
> You will need to create a new tune file, see =
meta/conf/machine/include/tune-ppc603e.inc as a reasonable example..


I modified the poky/meta/conf/machine/include/tune-ppc440.inc as =
follows:

DEFAULTTUNE ?=3D "ppc440"

require conf/machine/include/powerpc/arch-powerpc.inc

TUNEVALID[ppc440] =3D "Enable ppc440 specific processor optimizations"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440", =
"-mcpu=3D440", "", d)}"

AVAILTUNES +=3D "ppc440"
TUNE_FEATURES_tune-ppc440 =3D "m32 fpu-soft ppc440"
TUNE_PKGARCH_tune-ppc603e =3D "ppc440"
PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D "${PACKAGE_EXTRA_ARCHS_tune-powerpc} =
ppc440"

# glibc configure options to get 440 specific library (for sqrt)
GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440", =
"-with-cpu=3D440", "", d)}"

This is for the embedded PowerPC440 processor on the Virtex-5 FX70T FPGA =
chip, which doesn't have a hardware FPU. Do the options look okay: "m32 =
fpu-soft ppc440" ?

Is there a resource I can refer to see a full list of applicable =
PowerPC440 gcc-4.x compiler options?

Best regards,

Elvis Dowson


--Apple-Mail=_850959F7-C66C-473D-A804-377D94F64936
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Hi =
Mark,<div><br><div><div>On May 29, 2012, at 8:36 PM, Mark Hatle =
wrote:</div><blockquote type=3D"cite"><div><font =
class=3D"Apple-style-span" color=3D"#000000"><br></font>The error above =
is an issue w/ the tune configuration. &nbsp;In stock oe-core there is =
no 405/440 configuration.<br><br>You will need to create a new tune =
file, see meta/conf/machine/include/tune-ppc603e.inc as a reasonable =
example..<br></div></blockquote></div><div><br></div>I modified the =
poky/meta/conf/machine/include/tune-ppc440.inc as =
follows:<br><div><br></div><div><div>DEFAULTTUNE ?=3D =
"ppc440"</div><div><br></div><div>require =
conf/machine/include/powerpc/arch-powerpc.inc</div><div><br></div><div>TUN=
EVALID[ppc440] =3D "Enable ppc440 specific processor =
optimizations"</div><div>TUNE_CCARGS +=3D =
"${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcpu=3D440", "", =
d)}"</div><div><br></div><div>AVAILTUNES +=3D =
"ppc440"</div><div>TUNE_FEATURES_tune-ppc440 =3D "m32 fpu-soft =
ppc440"</div><div>TUNE_PKGARCH_tune-ppc603e =3D =
"ppc440"</div><div>PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc440"</div><div><br></div><div># =
glibc configure options to get 440 specific library (for =
sqrt)</div><div>GLIBC_EXTRA_OECONF +=3D =
"${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-with-cpu=3D440", "", =
d)}"</div></div><div><br></div><div>This is for the embedded PowerPC440 =
processor on the Virtex-5 FX70T FPGA chip, which doesn't have a hardware =
FPU. Do the options look okay: "m32 fpu-soft ppc440" =
?</div></div><div><br></div><div>Is there a resource I can refer to see =
a full list of applicable PowerPC440 gcc-4.x compiler =
options?</div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis =
Dowson</div><div><br></div></body></html>=

--Apple-Mail=_850959F7-C66C-473D-A804-377D94F64936--
