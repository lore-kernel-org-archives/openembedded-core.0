Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qh5Qx-0003Lb-Du
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:49:23 +0200
Received: by vws2 with SMTP id 2so5085499vws.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=3DnqmPAT0nVzfgx8pNBDk+fhqHYncgd1dEiGplegZwg=;
	b=h7Fl+dpmjY8cTmVK2oxJCdh9K9ly5QpKVpqK/wckxXe55bYJul72Y3h7D85tWgEaYn
	JPuw2qajevBcIGDdtw34SOGEMkbZ0visgtW3wwhqTZajHepw+tHjsa2aCRbRNtxTpp63
	AeJ1gJPTL8dLZSHAqWUZQp/rfUVSq5UfzUwdE=
Received: by 10.52.174.113 with SMTP id br17mr1217754vdc.107.1310586324123;
	Wed, 13 Jul 2011 12:45:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.104 with HTTP; Wed, 13 Jul 2011 12:45:04 -0700 (PDT)
In-Reply-To: <1310585771.20015.1121.camel@rex>
References: <cover.1310581914.git.kergoth@gmail.com>
	<2a927e54abaec88f79de810e5b48293d4db4740a.1310581914.git.kergoth@gmail.com>
	<1310585771.20015.1121.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 13 Jul 2011 12:45:04 -0700
X-Google-Sender-Auth: rS3FxlLtGLDIgYp97FkzpdyhtaA
Message-ID: <CABcZAN=eEWDt7MSnk2-UdPjNd_FhGK+-SOVBnkbx2H1puBiLrA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/2] Rework how the devshell functions
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
X-List-Received-Date: Wed, 13 Jul 2011 19:49:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2011 at 12:36 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-07-13 at 11:35 -0700, Christopher Larson wrote:
>> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbcla=
ss
>> index 5f262f4..95c29f3 100644
>> --- a/meta/classes/devshell.bbclass
>> +++ b/meta/classes/devshell.bbclass
>> @@ -1,22 +1,17 @@
>> -do_devshell[dirs] =3D "${S}"
>> -do_devshell[nostamp] =3D "1"
>> +inherit terminal
>>
>> -XAUTHORITY ?=3D "${HOME}/.Xauthority"
>>
>> -devshell_do_devshell() {
>> - =C2=A0 =C2=A0 export DISPLAY=3D'${DISPLAY}'
>> - =C2=A0 =C2=A0 export DBUS_SESSION_BUS_ADDRESS=3D'${DBUS_SESSION_BUS_AD=
DRESS}'
>> - =C2=A0 =C2=A0 export XAUTHORITY=3D'${XAUTHORITY}'
>> - =C2=A0 =C2=A0 export TERMWINDOWTITLE=3D"Bitbake Developer Shell"
>> - =C2=A0 =C2=A0 export EXTRA_OEMAKE=3D'${EXTRA_OEMAKE}'
>> - =C2=A0 =C2=A0 export SHELLCMDS=3D"bash"
>> - =C2=A0 =C2=A0 ${TERMCMDRUN}
>> - =C2=A0 =C2=A0 if [ $? -ne 0 ]; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Fatal: '${TERMCMD}' not found. Check=
 TERMCMD variable."
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
>> - =C2=A0 =C2=A0 fi
>> +export XAUTHORITY ?=3D "${HOME}/.Xauthority"
>> +export SHELL ?=3D "bash"
>> +export DBUS_SESSION_BUS_ADDRESS
>> +export DISPLAY
>> +export EXTRA_OEMAKE
>
> Variables that are placed into the global environment affect the
> checksums of any shell tasks when they change so I don't think we can do
> this (and its why they are in a function as above).
>
> Perhaps we could list the variables we want to export in a variable and
> then pass that list to popen's environment?

Hmm, fair enough, I'll rework it that way (aside: we really need a
general flag-based mechanism to do per-task exports).
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


