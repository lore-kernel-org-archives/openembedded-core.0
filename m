Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1Ua94G-0006tV-28
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 20:26:20 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz10so1932921vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 11:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=uf7J/d94Fdexps9F+Vbcmpi0Zp4i8ux0exopqhn8wOM=;
	b=X+6qHV3V1Vx2/0ronLplEmZ9Fgft/2GQAqKxcAIQLniJq3HE2KYrNUF/qOpQKuieIr
	S7dMC77MOR/gqt1s54+TXzlnbEiuVb0Y1vDGSTiQ/GFp66zzev9WeENxEbW1M59XBf7h
	U5hC8LBSom/8AozRI034LdRMoOj5icqlgTL53PpMKVewJtFQpubCwxKWJoUjfqPNpld9
	TeFInCywuzlZjZM5HOdVnlzkw1i7+M5Kj/utNYG8e4dltY/B7om17tKwJsMG/A5qpHzb
	N2w9Zi6ZZhYY+NgCbfhV6/I0SjrbWABvPWjuAqs6T0i4Z+FyUsVNhB5htzI8G6a8ZAWK
	4o4g==
X-Received: by 10.220.58.8 with SMTP id e8mr5449066vch.25.1368036497122; Wed,
	08 May 2013 11:08:17 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Wed, 8 May 2013 11:07:57 -0700 (PDT)
In-Reply-To: <1367917522-29378-1-git-send-email-paul@paulbarker.me.uk>
References: <1367917522-29378-1-git-send-email-paul@paulbarker.me.uk>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 8 May 2013 19:07:57 +0100
X-Google-Sender-Auth: p-vAxhucn9sjMXScEHVP6tgEvr0
Message-ID: <CANyK_8e2uowYYky7Oq=yDsZcxWNVMmeTjaVxWEhubVspuQrLDw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] qt4: remove trailing slash from prefix
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
X-List-Received-Date: Wed, 08 May 2013 18:26:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 7 May 2013 10:05, Paul Barker <paul@paulbarker.me.uk> wrote:
> The trailing slashs on "Prefix=${prefix}/" and "-prefix ${prefix}/" are passed
> through to the generated pkgconfig files and may be joined to paths like
> "/include" yielding a final path with a double forward-slash (eg.
> "/usr//include"). This may end up in the debugging symbols in other applications
> or libraries which depend on qt4 which in turn causes the debugedit program to
> fail with the message "canonicalization unexpectedly shrank by one character"
> when it tries to replace the double forward-slash with a single forward-slash.
> Thus the function split_and_strip_files fails and ultimately do_package fails.
>
> As this slash is removed from the prefix it is added into the regular expression
> used to fix up pkgconfig files later in the recipe.
>
> This error was seen in vlc in meta-openembedded and should be solved by this
> change in openembedded-core.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>

Martin, could you check whether applying this patch to oe-core fixes
the vlc do_package failure you were seeing?

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


