Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E18577F8AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:54:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so5341939wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tQBbOhEkDWj2KSSfEexNHbYdfx3ea99s1de+C2++GBs=;
	b=OMrh1Q+n89pFa4fc7B50IGZybe4Q5MnYPr4LAcCwuCYfHtBRSBAszk1JIjlnN1r06z
	4grdMAia6pWPduEFjEMYNbCKI1Tr+bgpPun90TK+58jlS3bI9vkcvuAvFDISC8RQiWCO
	aGOa/AYPTuC7rBEXDCxV32pf+T95R3/19aJPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tQBbOhEkDWj2KSSfEexNHbYdfx3ea99s1de+C2++GBs=;
	b=rSj6Ong0JMQykNj0t3ZPUXdY9/UoIUvyDjRgFR4G3BaBEHF3YSTQgOCezkPAmR95I7
	r++iRVyWNESeWGdlQMLu1aenKAzqY348m4yiuwb3D6DrZOfIkW3MAiS8WwaX6bg5CgoW
	h8QnnFg1RsgiX9WTzc9PPHIsAutT4WobnJz2V3UBIYcDURBk2Q/b6o2NY13O4ZNhAj/3
	qFwpOYcUe0R5RWkWei5oy3LmdjMES5/Ka0cU6i2RrDTN48dkLyI/a2K4lFP+XqppzB7z
	+W++kwvCNlzRg2d2vQC2muur9SozeNWwKkJ9DR1E6ZWUSHO1oVTf2UBVsID7CzoNnEJ2
	FRLQ==
X-Gm-Message-State: APjAAAWakDMHD+M4sC0A9QYXKR+8Q5z6rMP3+x7m9h16iU+Hl0a1Bvuy
	ZeD/HfGiipZCPqTzUGQdN2aTpW9Pa6Y=
X-Google-Smtp-Source: APXvYqz9xvZWu6pf73oBOZ6B6kb/58FJvMQodNhX53P3Cz3506RR1a2z5OnN25PR2hCx3W9SHwxcHQ==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr12309320wrk.184.1574355257224;
	Thu, 21 Nov 2019 08:54:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u18sm3986480wrp.14.2019.11.21.08.54.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:54:16 -0800 (PST)
Message-ID: <ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>
Date: Thu, 21 Nov 2019 16:54:12 +0000
In-Reply-To: <20191121155018.GB28013@localhost>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<20191121150207.3657-3-richard.purdie@linuxfoundation.org>
	<20191121155018.GB28013@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 16:54:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 17:50 +0200, Adrian Bunk wrote:
> On Thu, Nov 21, 2019 at 03:02:07PM +0000, Richard Purdie wrote:
> > Older versions break opkg-build when reproducible builds are
> > enabled.
> > Rather than trying to be selective based on which features are
> > enabled,
> > lets just make this a minimum version.
> > ...
> > +    if LooseVersion(version) < LooseVersion("1.28"):
> > +        return "Your version of tar is older than 1.28 and does
> > not have the support needed to enable reproducible builds. Please
> > install a newer version of tar.\n"
> > ...
> 
> How does "Please install a newer version of tar" work in practice
> on a supported host distribution like CentOS 7 ?
> 
> As user I would expect such things to just work when using
> a distribution that is documented as supported.

We're going to have to solve this issue on our autobuilder. Centos7
already causes problems and there is documetation in the manual about
it:

https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#centos-packages

(and the need to use EPEL)

Unfortunately a newer tar isn't in EPEL.

I don't have a solution yet, I do know that silently creating empty
packages is much worst than telling a user something won't work though.

Any suggestions on how we fix it?

(We could make opkg-utils-native depend on tar-native but for most
people that isn't necessary so it seems a shame).

Cheers,

Richard


