Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RNYK9-0000Cz-7e
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 00:09:53 +0100
Received: from mail54-db3-R.bigfish.com (10.3.81.247) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.22; Mon, 7 Nov 2011 23:03:14 +0000
Received: from mail54-db3 (localhost.localdomain [127.0.0.1])	by
	mail54-db3-R.bigfish.com (Postfix) with ESMTP id E208CA8034D	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 23:03:27 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail54-db3 (localhost.localdomain [127.0.0.1]) by mail54-db3
	(MessageSwitch) id 1320707007762401_17297;
	Mon,  7 Nov 2011 23:03:27 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.253])	by
	mail54-db3.bigfish.com (Postfix) with ESMTP id B38C31B88055	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 23:03:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 7 Nov 2011 23:03:11 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Mon, 7 Nov 2011 17:03:31 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] Introduce new SERIAL_CONSOLES to add
	multiple consoles for your MACHINE
Thread-Index: AQHMnaF36K23AM1ubkmAuCM3o0WGmg==
Date: Mon, 7 Nov 2011 23:03:30 +0000
Message-ID: <CAEsOVNdRnM_TachXg=WD4g6iYFGxSgGfx2bWx+PdArfhvuFseA@mail.gmail.com>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
	<1320442499.3296.4.camel@lenovo.internal.reciva.com>
In-Reply-To: <1320442499.3296.4.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 07 Nov 2011 23:09:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <34B89700F594D4449B9341CD937898AB@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 4, 2011 at 4:34 PM, Phil Blundell <philb@gnu.org> wrote:
>> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>> @@ -25,6 +25,18 @@ do_install() {
>> =A0 =A0 =A0if [ ! -z "${SERIAL_CONSOLE}" ]; then
>> =A0 =A0 =A0 =A0 =A0echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_C=
ONSOLE}" >> ${D}${sysconfdir}/inittab
>> =A0 =A0 =A0fi
>> +
>> + =A0 =A0idx=3D0
>> + =A0 =A0tmp=3D"${SERIAL_CONSOLES}"
>> + =A0 =A0if [ "x" !=3D "x$tmp" ]; then
>> + =A0 =A0 for i in $tmp
>> + =A0 =A0 do
>> + =A0 =A0 =A0 =A0 j=3D`echo ${i} | sed s/\;/\ /g`
>> + =A0 =A0 =A0 =A0 echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" =
>> ${D}${sysconfdir}/inittab
>> + =A0 =A0 =A0 =A0 idx=3D`expr $idx + 1`
>> + =A0 =A0 done
>> + =A0 =A0fi
>> +
>
> Did you test that this actually solves the problem? =A0It looks to me as
> though it will still do the wrong thing if the variable is not defined
> at all (as opposed to being defined to the empty string). =A0The added
> "if" statement doesn't actually achieve much since, if $tmp is the empty
> string, the for-loop wouldn't have executed anyway and there is no need
> for an extra guard.
>
> Also, for what it's worth, the "x$tmp" idiom is unnecessary if you're
> going to quote the strings.

I don't get it. I think the first version was still OK. The first
version is pasted below.

> +    idx=3D0
> +    tmp=3D"${SERIAL_CONSOLES}" <- If it's not defined this will catch it=
.
> +    for i in $tmp
> +    do
> +     j=3D`echo ${i} | sed s/\;/\ /g`
> +        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${s=
ysconfdir}/inittab
> +     idx=3D`expr $idx + 1`
> +    done

See my inline comment above, but if SERIAL_CONSOLES is not defined
tmp=3D"" and the for loop won't execute. Not sure if there is a more
standard way to do this though.

-M=



