Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UKSVW-0004Z7-T7
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 12:57:40 +0100
Received: by mail-vc0-f172.google.com with SMTP id hr11so5580922vcb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=t5QO+HMHqZ6wXcJs3XPqNq6xD2vTtnp8NtJ7LHtmOxo=;
	b=CAnwwktdzkMYNDlXcfe7wjUK2VUN8k/ql4DORGP7og01+MWB0x8pauIFTH/ExgBJOE
	eiKR7xwSD2QFvGtJH3lV3B/jX1bewG1QTNI302vpIZ7x9KTZv09jjAFeu83NpVk7GLAE
	MRRnSUHqjLjsHFXsUzDYjvgQriX4t6Ktizw55ExnrCgCUrRWnbPGiJDoAVNS8Hbo3TPB
	jNIFDSm6dvUbrS8waNPZiFgzRlbqid8mXmx5DGSBZhcT9LdeCliIxSHtmPNydSYq9vro
	OEgYfVZ6ph17z7A6dXj8MHkaHfNXUHK9tYe1/UpZsM13Sugslu6Cza55cOqZ5Y7WrF1G
	qV2g==
MIME-Version: 1.0
X-Received: by 10.52.28.101 with SMTP id a5mr16199508vdh.92.1364298038756;
	Tue, 26 Mar 2013 04:40:38 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Tue, 26 Mar 2013 04:40:38 -0700 (PDT)
In-Reply-To: <CAJTo0Lb8-CbnMtcxgximM7W_2YxbexGB49VLM+HbEqQrWHGpYg@mail.gmail.com>
References: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb8-CbnMtcxgximM7W_2YxbexGB49VLM+HbEqQrWHGpYg@mail.gmail.com>
Date: Tue, 26 Mar 2013 12:40:38 +0100
Message-ID: <CALbNGRQVd3yi7bEuCO_Yyh_RVnnfcB0k9yMG3jHg_BCF9=2Reg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: don't provide gtk-update-icon-cache-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 11:57:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2013 at 11:32 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
> On 25 March 2013 23:47, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
>> fixes:
>> | ERROR: Multiple .bb files are due to be built which each provide virtu=
al/gtk-update-icon-cache-native
>> | (/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-g=
nome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
>> | virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/=
meta/recipes-gnome/gtk+/gtk+_2.24.15.bb).
>> | This usually means one provides something the other doesn't and should=
.
>
> NACK.
>
> The only way this can happen is if something is depending on
> gtk+-native, as everything in oe-core (should) depends on
> virtual/gtk-update-icon-cache:
>
> commit f07515096ea39e267cd3ebeea08cffbba1af07e0
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Mon Mar 4 12:52:45 2013 +0000
>
>     default-providers: add default virtual provider for gtk-update-icon-c=
ache
>
>     Use a virtual provider instead of a hard dependency so that if
> gtk+-native is
>     required in some configuration, this provider can be changed and then
>     gtk+-native and gtk-update-icon-cache-native won't be both built
> and conflict in
>     the sysroot.
>
> Presumably some application you've got is explicitly depending on
> gtk+-native, probably for the icon cache handling.  It should drop
> that build dependency and use the class instead.
>
> Your fix "works" but will cause file overwrite warnings in sysroot
> when you actually do want a gtk+-native, for example if you do want to
> build a native gtk+ application or some reason.
>
> Ross
Why do we need two providers which need pinning doing exactly the same?

Andreas


