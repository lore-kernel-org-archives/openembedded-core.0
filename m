Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 2753E6B819
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 08:34:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,538,1389740400"; d="scan'208";a="41712198"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 25 Feb 2014 09:34:59 +0100
Received: from COSNADEXC11.usr.ingenico.loc (10.31.4.211) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 25 Feb 2014 09:34:59 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC11.usr.ingenico.loc ([10.31.4.211]) with mapi id
	14.02.0328.009; Tue, 25 Feb 2014 09:34:59 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: Gary Thomas <gary@mlbassoc.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: Keep track of
	TEMPLATECONF setting
Thread-Index: AQHPMXOq/i5BwsHb50+s2Sl4c5uhO5rFpVyw
Date: Tue, 25 Feb 2014 08:34:58 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B57543F61@COSNADEXC13.usr.ingenico.loc>
References: <1393255080-12382-1-git-send-email-gary@mlbassoc.com>
	<1393255080-12382-3-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1393255080-12382-3-git-send-email-gary@mlbassoc.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] scripts/oe-setup-builddir: Keep track of	TEMPLATECONF setting
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
X-List-Received-Date: Tue, 25 Feb 2014 08:35:03 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

You can drop parenthesis in your test (it will create a useless subshell).

Regards,
Matthieu


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] De la part de Gary Thomas
Envoy=E9=A0: lundi 24 f=E9vrier 2014 16:18
=C0=A0: openembedded-core@lists.openembedded.org
Cc=A0: Gary Thomas
Objet=A0: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: Keep track of TE=
MPLATECONF setting

Keeping track of the TEMPLATECONF variable in the build tree will let this =
script produce the same output when listing 'conf-notes.txt' every time the=
 script is run, regardless of whether or not TEMPLATECONF has been provided=
 by the user.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 scripts/oe-setup-builddir |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir index a8=
69fdc..4322158 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -37,8 +37,16 @@ fi
=20
 cd "$BUILDDIR"
=20
+if (test -f "$BUILDDIR/conf/template.conf") then
+    TEMPLATECONF=3D$(cat $BUILDDIR/conf/template.conf) fi
+
 TEMPLATECONF=3D${TEMPLATECONF:-meta/conf}
=20
+if ! (test -f "$BUILDDIR/conf/template.conf") then
+    echo "$TEMPLATECONF" >$BUILDDIR/conf/template.conf fi
+
 #
 # $TEMPLATECONF can point to a directory for the template local.conf & bbl=
ayers.conf  #
--
1.7.9.5

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

