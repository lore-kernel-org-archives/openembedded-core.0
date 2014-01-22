Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id A47A16E7D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:11:20 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wp4so836448obc.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=gflpHnU6P0bgdWD0NAWs7Xak10X68O4TlkQoG42Z6p4=;
	b=ag0dQtEBYNibjUQfPmCf4ZS3Xw6CLF/Bsw+qdaY2vbNd9/Os3dPLzBjSpRt+YZd+h/
	Bn0OOvWUInkHY5ns0KzJj0R4eDN/sGv5EomH0nhRnGFlgCS17libnQDEyoN/C/8Zq4zB
	VwFzz7IaBpmfyauekL60jNOBGfcbHBWvolKOftoy1CtjMWRlSF3sVbLoxMv2aOPWtSu1
	XNeH2WA2W/D8gxOODMKoUL/oiyXDDPIFohc4pgFxFMN2yS2vVP3O/95trla0RYYqVTqZ
	Sctjdg8eoxvtvRFoccF+PLpLuWWxqKwXn59x/otdP04ZFDRoMM0KA3MjYF8xirTMkIGM
	EOkg==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr2531978obc.62.1390414281478;
	Wed, 22 Jan 2014 10:11:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 10:11:21 -0800 (PST)
In-Reply-To: <52E007CC.5070405@gmail.com>
References: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKr4WxcPVkxGMR+ZZ98b6mLbmUyr9Qs=BWe-S5HVJSn=hg@mail.gmail.com>
	<52E007CC.5070405@gmail.com>
Date: Wed, 22 Jan 2014 16:11:21 -0200
X-Google-Sender-Auth: PXR1lPXWuOeq3aS5JaM3X-pnTr4
Message-ID: <CAP9ODKpAQDTg-UV-vR4419Q+6zvt=xNL=Wo5dH+feQi4wsWiGQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 18:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 4:02 PM, David Nystr=F6m
<david.c.nystrom@gmail.com> wrote:
> On ons 22 jan 2014 16:47:06, Otavio Salvador wrote:
>>
>> On Wed, Jan 22, 2014 at 1:08 PM, David Nystr=F6m
>> <david.c.nystrom@gmail.com> wrote:
>>>
>>> Adding ability to use postinstalls intercepts in the nativesdk env, and
>>> making sure the correlate between repo + SDK.
>>>
>>> This to enable rootfs generation from a package repository using only a
>>> package repository and the toolchain tarball.
>>>
>>> See https://github.com/nysan/rootfs-sandbox for examples.
>>>
>>> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
>>
>>
>> Much better. Thanks.
>>
>> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Regarding the rootfs-sandbox, how are you intending to proper
>> integrate it with the toolchain?
>>
>
> Search the oe-core list for the previous discussions with Tom Zanussi.
> I believe the long term goals is to redo rootfs_*.bbclass in python, and =
let
> both bitbake and MIC(WIC) use
> the same code for image creation.(SDK env + bitbake env.)
>
> I'm fine with continued dev/inclusion of rootfs-sandbox, but I think that
> might not be acceptable as a long term solution since
> it may be maintenance heavy, since it uses alot of oe-core internal env.
> vars.
>
> Possible routes are:
> 1. Use common code for rootfs assembly. (WIC)
> 2. Cleanup env. var. usage in postinstall hooks, and be aggressive in
> denying new additions. (Continue dev. on rootfs-sandbox)
>
> Off-topic:
> With above patches, I'm down to 1 postinstall failures for
> packagegroup-core-lsb:
> 1. missing shlibsign, (nss), cant get the damn thing to compile for
> nativesdk yet.
>
> There are 2 other failures as well, but they fail when bitbake:ing as wel=
l.
> Only works well with ipk sofar.

So I think we ought to work on this in a layer and put things in
OE-Core when it is ready.

What do you think?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

