Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBVuL-0004RT-Dp
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:14:01 +0200
Received: from mail225-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.23; Tue, 11 Sep 2012 19:01:29 +0000
Received: from mail225-tx2 (localhost [127.0.0.1])	by
	mail225-tx2-R.bigfish.com (Postfix) with ESMTP id 52E05A00189;
	Tue, 11 Sep 2012 19:01:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail225-tx2 (localhost.localdomain [127.0.0.1]) by mail225-tx2
	(MessageSwitch) id 1347390086722257_8660;
	Tue, 11 Sep 2012 19:01:26 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.245])	by
	mail225-tx2.bigfish.com (Postfix) with ESMTP id A357390004B;
	Tue, 11 Sep 2012 19:01:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 11 Sep 2012 19:01:25 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Tue, 11 Sep 2012 14:01:25 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] autotools.bbclass: Add functionality to
	force a clean of ${B} when reconfiguring (and ${S} != ${B})
Thread-Index: AQHNkE/XZFtQAqUHwE+D5hE+WSne8A==
Date: Tue, 11 Sep 2012 19:01:25 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A66FF3F@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347373349.2122.35.camel@ted>
In-Reply-To: <1347373349.2122.35.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:14:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E1CDE1232CC1F64AA61C4728A0C4E5FB@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 9:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Unfortunately whilst rerunning configure and make against a project will =
mostly
> work there are situations where it does not correctly do the right thing.
>
> In particular, eglibc and gcc will fail out with errors where settings
> do not match a previously built configuration. It could be argued they ar=
e
> broken but the situation is what it is. There is the possibility of more =
subtle
> errors too.
>
> This patch adds removal of the build directory (${B}) when configure is
> rerunning, the sstate checksum for do_configure has changed and ${S} !=3D=
 ${B}.
> We could simply use a stamp but saving out the previous configuration che=
cksum
> adds some data at no real overhead.
>
> If we find there are things where we want to disable this behaviour with
> CONFIGURESTAMPFILE =3D "" in the recipe, or users could disable it global=
ly.
>
> [YOCTO #2774]
> [YOCTO #2848]
>
> This is particularly helpful for eglibc and gcc which use split builds by=
 default and
> are a particular source of reconfigure type problems.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Is it feasible to back port this to denzil? I've encountered what I
think are similar issues reconfiguring gcc for example.

-M

> ---
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbcl=
ass
> index 4c4bf87..a5997c5 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -89,6 +89,27 @@ oe_runconf () {
>
>  AUTOTOOLS_AUXDIR ?=3D "${S}"
>
> +CONFIGURESTAMPFILE =3D "${WORKDIR}/configure.sstate"
> +
> +autotools_preconfigure() {
> +       if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; =
then
> +               if [ "`cat ${CONFIGURESTAMPFILE}`" !=3D "${BB_TASKHASH}" =
-a "${S}" !=3D "${B}" ]; then
> +                       echo "Previously configured separate build direct=
ory detected, cleaning ${B}"
> +                       rm -rf ${B}
> +                       mkdir ${B}
> +               fi
> +       fi
> +}
> +
> +autotools_postconfigure(){
> +       if [ -n "${CONFIGURESTAMPFILE}" ]; then
> +               echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
> +       fi
> +}
> +
> +do_configure[prefuncs] +=3D "autotools_preconfigure"
> +do_configure[postfuncs] +=3D "autotools_postconfigure"
> +
>  autotools_do_configure() {
>         case ${PN} in
>         autoconf*)
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



