Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RPIJJ-0002sF-8j
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 19:28:13 +0100
Received: by bkbzs2 with SMTP id zs2so4507187bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ac0ADby3AsdRmGBS1Rw9I4gKexf7lBcM1iaPruXlEis=;
	b=ESa7EcTm+QgDWZLc/BgfTtexTDH4Lc1Zf6EmMrW3hHNh/AF4q3BOmzEDEs/aCXMJ69
	jO4HQTHhtTD3tsKOXDN0H9yD5WZ/BdSSIVfGTmLwoqfy/3Af6hNiHkYKpAwjF+OW1Hoa
	man9N6Hkl4KlEwVZw4sjGLokWHmpmZwNh4lmM=
MIME-Version: 1.0
Received: by 10.205.131.3 with SMTP id ho3mr1411502bkc.11.1321122109162; Sat,
	12 Nov 2011 10:21:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Sat, 12 Nov 2011 10:21:49 -0800 (PST)
In-Reply-To: <1321121825.26881.23.camel@ted>
References: <1321087015.26881.15.camel@ted>
	<CAP9ODKpCZDJb_Cp7uOtXMmfRsfv5dS=nDFTCTk5JA4oPqOEtFA@mail.gmail.com>
	<1321121825.26881.23.camel@ted>
Date: Sat, 12 Nov 2011 16:21:49 -0200
X-Google-Sender-Auth: EAjwwdA4FQuY2qYFA39qQBt2o7c
Message-ID: <CAP9ODKoHWQwnz=yy6H6p=mKQaqkBO8sF8sZ1icZHBMgYRHfVSg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk.bbclass: Ensure bad recommendations persist in the status file
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
X-List-Received-Date: Sat, 12 Nov 2011 18:28:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 12, 2011 at 16:17, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-11-12 at 13:57 -0200, Otavio Salvador wrote:
>> On Sat, Nov 12, 2011 at 06:36, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > Currently bad recommendations are added to the status file with status
>> > "ok". After a single opkg command, whilst it will ignore the recommend=
ation,
>> > the status changes to "installed" even if the recommended package was =
not
>> > installed. Whilst this is likely a glitch in opkg's logic, the correct
>> > way to persist the information in the status file is to set the status
>> > to "hold" as deinstall packages with that status remain. With this cha=
nge
>> > the bad recommendations persist accross multiple opkg runs and the sys=
tem
>> > behaves as expected.
>>
>> I personally dislike fixing it in rootfs_ipk instead of opkg ... opkg
>> has change its behaviour behind the scenes and this needs to be fixed
>> IMO.
>
> I'm not sure opkg has changed behaviour. We used to just do one single
> "opkg install" after which the status file was incorrect but the bad
> recommends was not installed. We started doing more than one "opkg
> install" and this has muddied the waters so to speak. I'm still unclear
> if the bad recommends actually make it onto the target system but
> certainly the status file was incorrect.

It does end onto the target.

> The summary is we were not using opkg correctly in the first place. This
> patch corrects that problem so we do what we what that code intended to
> do and persists the bad recommend into the status file. This fixes the
> bug that was reported too.
>
> There look to be remaining issues in opkg but not ones that directly
> affect the build system. Please do take this up with the opkg people but
> I'm afraid I personally don't have time to start debugging opkg and I
> think there are other more urgent priorities at the moment now this is a
> non-issue for the builds.

This does fix the problem we were having  but I am concerned about
other possible behaviour changes it might happen.

I think this patch ought to go but someone skilled on opkg might take
a look at opkg code to see if this isn't a regression of lately
changes.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


