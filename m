Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RDHQN-00028h-LP
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 17:05:51 +0200
Received: by wyh5 with SMTP id 5so6403718wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LsbhDBkjddYgpaiy8X5UVskGkpL7anQvUiWtlnrVc+g=;
	b=BuNuQJJPmYG6Gd+SW5oLP5rHcWhVUPZL23IwF8fDLf0haxeXE2UkG7b1M1Sugc0iD3
	6ry7g5hxgXsRkj8ssHJIs5BweqXC3VcBALDoR/fbxt10Wr503zGheEG1lvuu2qWP5EHl
	gAmHp/yXaDgHR79r832yJWTqnYRDmH2izx38Q=
Received: by 10.216.230.83 with SMTP id i61mr7025323weq.54.1318258750113; Mon,
	10 Oct 2011 07:59:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Mon, 10 Oct 2011 07:58:50 -0700 (PDT)
In-Reply-To: <7F3A6782-444C-4722-8791-6D75B70FEB57@dominion.thruhere.net>
References: <cover.1318021323.git.kergoth@gmail.com>
	<bc7e830e85f9f5242e0178dee517d24cbdfc9fa3.1318021323.git.kergoth@gmail.com>
	<7F3A6782-444C-4722-8791-6D75B70FEB57@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 10 Oct 2011 07:58:50 -0700
X-Google-Sender-Auth: 9JT3d1dA1MCJlDMqfCwdldj9rwY
Message-ID: <CABcZAN=Kv1=Nq-2mmAASVpnPic3W+DZpHgXZimx1AJCY5YLkqQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] autotools: fix multi-word arguments for EXTRA_OECONF
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
X-List-Received-Date: Mon, 10 Oct 2011 15:05:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 7, 2011 at 3:34 PM, Koen Kooi <koen@beagleboard.org> wrote:
>>
>> oe_runconf () {
>> - =C2=A0 =C2=A0 =C2=A0 if [ -x ${S}/configure ] ; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgcmd=3D"${S}/config=
ure \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${CONFIGUREOPTS} ${EX=
TRA_OECONF} $@"
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote "Running $cfgc=
md..."
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $cfgcmd || bbfatal "o=
e_runconf failed"
>> - =C2=A0 =C2=A0 =C2=A0 else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal "no configure=
 script found"
>> - =C2=A0 =C2=A0 =C2=A0 fi
>> + =C2=A0 =C2=A0 =C2=A0 if [ -x ${S}/configure ] ; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote "Running ${S}/c=
onfigure ${CONFIGUREOPTS}
>> ${EXTRA_OECONF} $@"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/configure ${CONFI=
GUREOPTS} ${EXTRA_OECONF} "$@" ||
>> bbfatal "oe_runconf failed"
>> + =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal "no configure =
script found"
>> + =C2=A0 =C2=A0 =C2=A0 f
>
> Was the tab->spaces conversion intentional?

Erm, nope, well spotted, thanks.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


