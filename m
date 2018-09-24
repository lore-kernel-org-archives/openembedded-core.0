Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 869DF745BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 16:41:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b11-v6so4176533wru.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GxsYhPoKfK9SFRLSw+ONFTBKDgh+pUzsa5PdbHgIlTk=;
	b=R353RcD7VeWs6LUYQDNdudmjeR7wB1vQlm6Z8oj44phPt0vgYk71Qe4cH2fjpQA9dn
	2ituQWYBkJhDcqy6sQ8zLP1s7GwSTn9rw4dUezgs69kJbmfBfd/HPgP5pbBFRE612Wzn
	QA90ImAq6XZF6I5fkwazA8lTKUzaDCfW5SoOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GxsYhPoKfK9SFRLSw+ONFTBKDgh+pUzsa5PdbHgIlTk=;
	b=XgAhRbbURU98yb9P/U8w+su97fWKbC1gng6HIUxlso4IHuUfZJx8thILvDVDt+g2hu
	TPfKaDzxREd7hXWbPeZpaW36Go3YIVU9MTbV7mbNW6Z8Vv+sZ8e+FSjHIcZubyaWmCEi
	srYdXnk7GwW97MH6+dTOck0gOCzA25ZFRSZhK06igit2YIYthOPrvWJjBUHs5syqau0x
	kyK34A6MJB5854ZumXW5y28Ac4w2nQDbeNucnwCUjuDukt1oEaD1RAJCKOSRHfS3Kn7o
	C2HHSW2xvkNzVFiZkNMAhCm1dSUC+BkMYUlK+P1RdkWoktdg8Nc/2ylzWiUWSAEMae4G
	zuOQ==
X-Gm-Message-State: ABuFfogldrpQCYWM2gbgDooNky8SnqiLYNPA3KE44QFap4vaaowCVzA3
	14zEo3oDrrapYAkHSp0vUHju5A==
X-Google-Smtp-Source: ACcGV61aX5OdkEZr5GiwPb/2NAZ5VMK2pBft8bDiYrL4ssf5U1mVLJEG8oTCHvzh3Ke0LsTV2N8X8g==
X-Received: by 2002:adf:b34e:: with SMTP id
	k14-v6mr9556563wrd.207.1537807293105; 
	Mon, 24 Sep 2018 09:41:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z14-v6sm10468495wma.18.2018.09.24.09.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Sep 2018 09:41:32 -0700 (PDT)
Message-ID: <f23622c2b3d94603c6072c80e4958d0d291b06f9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 17:41:31 +0100
In-Reply-To: <871s9jj5yr.fsf@ni.com>
References: <20180924132500.30363-1-adrian.ratiu@ni.com>
	<be7a233326b1d6709c57398e1a01ed5a371ddb3b.camel@linuxfoundation.org>
	<871s9jj5yr.fsf@ni.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] rootfs: always update the opkg index
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
X-List-Received-Date: Mon, 24 Sep 2018 16:41:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 18:00 +0300, Ioan-Adrian Ratiu wrote:
> > With master, a copy of the feed is constructed under WORKDIR which
> > is
> > then indexed since other image generation or package writes could
> > occur
> > and the index isn't static. I'm guessing it doesn't do this for
> > external feeds and assumes those feeds are static.
> 
> My description of the problem mirrors my understanding of the feed
> construction process which might be limited especially if it changed
> on master post-Sumo, but the answer is yes, external feeds are
> assumed static.

Ok.

> > I am wondering what happens if you put a remote (http://) url into
> > this
> > though? Does that still work or does it break?
> 
> It still works, we're using http paths all the time in our distro
> (public feed server is at http://download.ni.com/ni-linux-rt/)

That is good to know and worth mentioning in the commit message as that
isn't clear.

> > 
> > I'm also worried about what happens if the file:// path you point
> > at is
> > owned by another user and isn't writable.
> 
> Thanks for pointing this out. Looks like it enters an infinite loop:
> the
> do_rootfs task is stuck at 3% and a worker process pegs a core to
> 100%.
> 
> Without this change, do_rootfs gets stuck at 12%, worker pegging a
> core
> if the feed is owned by another user with no write permissions.
> 
> This was unexpected :) I'll roll up my sleeves and start digging.
> 
> Do you have any pointers about what might be happening?

I was expecting it to error, not hang. If I had to totally guess, I'd
guess at the bb.utils.lockfile() hanging.

Cheers,

Richard

