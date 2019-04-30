Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id A30167DC63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:33:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p21so3413564wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/VfxMUctid5AbRA9Gi8APWYP8cVc8hqMUsMkdRkljBc=;
	b=JQJtJ4H1eRFc+76aGuin0q/APWHXNg8Jb5/ddCbYRaxEks8s5NF2hAnwcLrhFTCibM
	ka1+lUbmujfcwA6q8g8DagAxOqDp4I/MSsOw615SioNy/19o6P54CxzUS/G5OnpgIlMW
	WTMPjVming7OzI9HJ0seJFIx8ydmGIbkiQqmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/VfxMUctid5AbRA9Gi8APWYP8cVc8hqMUsMkdRkljBc=;
	b=kcTxc9Dpym6daNZfmHXX0ofKcIoRSBQoo3XkNPuEr3tA+MXrw7W2d6Rxid1E55isXd
	OfEOk3TTvMQlMfXlEkIXo+rcYiH97P/eX1k4c9UWiSiMkhT7+RspVRjEN+MUd6HuoGKq
	qQ0T9dPdh2aGOQGZy3aVSxHLRezV9QxI6HKFg9GKkM0jJ0z04K1O2VDjFGFi3k6lXFBG
	HqGlcX/e8fsg8Fa1ElaCnZujxv+F+QxU7pLwvLu1v1L0pYOlJ+rPMXuubJh6dLpO+AsE
	gE6roP6rmruiAJ3vDk/c3zYRJKv+qzGlsZdNY7bXE3csBI7Rszp8i7f32Olich928nC6
	SyDQ==
X-Gm-Message-State: APjAAAUL3XgcZWI39v7VdOMN8W+w6dkapdaUBOzCTcVwtiag36UcTwBr
	7uGYR7vw4XtaYKl8+tVlzmiDLoSNaUk=
X-Google-Smtp-Source: APXvYqyotja1rR5enE1tGP+j3aiBcD1PjXWzZncVxK3BPh4cUFFbk5NDPXTy9HOBXhMD72C7fY1nNg==
X-Received: by 2002:a1c:a843:: with SMTP id r64mr369812wme.45.1556624031081;
	Tue, 30 Apr 2019 04:33:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a184sm2615853wmh.36.2019.04.30.04.33.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 04:33:49 -0700 (PDT)
Message-ID: <32a5bfed012361cbb34109082387874f182706c3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, 
	openembedded-core@lists.openembedded.org,
	bitbake-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 12:33:47 +0100
In-Reply-To: <lyftpzu4bx.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyftpzu4bx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: $PWD in terminal.bbclass
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
X-List-Received-Date: Tue, 30 Apr 2019 11:33:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 13:20 +0200, Enrico Scholz via Openembedded-core
wrote:
> Assigning PWD works like 'cd' and changes the actual path so that
> do_terminal() will be executed from the directory where bitbake has
> been started from.  But usually, the [dirs] directory (e.g. '${B}')
> is
> expected.
> 
> Is this really intented?  Here, this breaks kernel's '-c menuconfig'
> (at least).

Its not intended.

> A trivial fix would be something like
> 
> >    envdata.delVar("PS1")
> > +   envdata.delVar("PWD")
> 
> in terminal.bbclass.  But is there any reason to have PWD in
> ${BB_ORIGENV}
> at all?  imo, there is no reason to keep this variable and it should
> be removed in bitbake already.

I'm fine with the delVar. I'm nervous about "randomly" deleting bits of
the origenv, it would tell us where bitbake was executed from for
example and I think I'd prefer to leave it unaltered.


Cheers,

Richard


