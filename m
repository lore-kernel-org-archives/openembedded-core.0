Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0DB7DC65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:31:32 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id v141so879270vsc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DwgXvjdQSpqYVonBBrrLTF6gIISah268qXaDR+a4JY0=;
	b=rooKDTzukjp9AMrIdF+9Tnni3uDq1DhEdkxjtf/eurn8U4cqhDqYcMUfkqnzcIjR+6
	1Jto+Si27yKHjuY0kxWwS0Rjb9dou4uhjb8oe58DMbDII+XhDkI0RRKkVKua3Z9SBoCX
	uy8FaPY9BC6bNXypWL9U6qlejXZUre87JsSi4Nu2SIDiJlhCErRBwCN3vOHeYljmnf+w
	zKu1X2ZZCUBKstt4EF7zicLbO0TJc7bp++dO+89CS7QhlRfjMtg2MX6EbNkL+fdjkZSO
	iMg4VJDMy3jJsNqrceXRHsDT1QdpClrI3NTuuRJIXs042Jr0KApk262ib/+XHg7rPmpz
	dgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DwgXvjdQSpqYVonBBrrLTF6gIISah268qXaDR+a4JY0=;
	b=Nxe4IJuIk5DNl2qCtZOQt8m6S0fIFuflhOpXSMARyLb900dkfHRcnJZ5UXuQURE+N2
	q/OKuGLIqeHopIw4mJtmjKO0uGKv0IhFOtPhwry1dSGKC7uicYWA3Sdn5bK95AXycecW
	dRQ6pmDKbYGyVEWRha8Ybua1l7xA98lcRpzCZ3K2QAqpAF+sKy3hn3GTOx/P4Xcy39bv
	lxZK867xJVPLiWcqVw2TnzSIsKduqufXe7ALVdg5ZEGiIIk/IbLmNpUfZZYbfElEkPHN
	l6y0ObnKVnO5er7nGMj4P8D3ZtEcTCFjd6B8sKH7YSAeBsKqrp+jxjtS4EhN16XD4t5x
	EU3g==
X-Gm-Message-State: APjAAAU0TRpAO2FJmaiReNzgImbGZhspyK9zYbzbSlpnNqwoBvkgrLVz
	88WECaoGuyYXuifObdbMhRLKMkDvI7chP5I8eWAX7wue
X-Google-Smtp-Source: APXvYqxjRgiZH43bPQBsjI84W+E9q1hm+uZQP9a/+dMgUE36QSic/QwwaGI3OIyhiBgIyqxCqla8koYdF+TGMve/2Xg=
X-Received: by 2002:a67:ea0a:: with SMTP id g10mr34437948vso.77.1556620293113; 
	Tue, 30 Apr 2019 03:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
	<20190429144325.63744-6-alex.kiernan@gmail.com>
In-Reply-To: <20190429144325.63744-6-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 30 Apr 2019 11:31:21 +0100
Message-ID: <CAO5Uq5Rr66_Hho-rdt28EVgDwS28Wx-nTQs6UC5awrLmsuK7jA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 5/6] systemd-systemctl-native: simplify and support preset-all
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
X-List-Received-Date: Tue, 30 Apr 2019 10:31:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 29, 2019 at 3:43 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> From: Jonas Bonn <jonas@norrbonn.se>
>
> Now that the systemd class sets up service presets instead of actively
> enabling services, the 'enable' and 'disable' subcommands for systemctl
> are not actually used anywhere.  As such, we can remove these to make
> sure that nobody inadvertently introduces new uses of them.
>
> We do, however, one case where the enable/disable machinery is still
> required; that is for the read-only-rootfs case where the 'preset-all'
> command can not be called at runtime but needs to be called when creatng
> the image.  For this case, we implement 'preset-all' here.
>
> There was also a previous implement of 'preset'... not sure that this
> ever worked as the implementation looks bogus and there aren't any users
> anyway.  This patch removes the 'preset' subcommand, as well.
>
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

So it turns out we need something more sophisticated for the read-only
rootfs case... assuming this series passes CI (and if it got applied),
it's still better than where we were, or I can split it in two, one
which addresses the machine-id changes and another for the read-only
root case.

I'm just rewriting systemctl-native in python and adding in handling
of preset files... the shell's gotten way too knarly!

-- 
Alex Kiernan

