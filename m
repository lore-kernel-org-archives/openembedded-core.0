Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7Osx-0004xU-Og
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 12:28:24 +0100
Received: by mail-ve0-f179.google.com with SMTP id da11so4603804veb.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 03:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=MxNLQITbYel0zF42C9bwYb5eJWuYhNNG5DhswI1FabM=;
	b=hNw0t5AnamGAQIfuLYIa+WS1ScMShzxDxUlYAmlrS0KME0HDNFhgsZcDGdulyH2Ohp
	/wHex4xHqkZT77qbIgQRBWXcdxREPzFbdqNlVAxGtWkPQHkRaShxSaCA73KTI9mcfkxD
	ds5C8etb6QpofS9kIIoBq7D3Uvjvws+vpnRhlJNHtPhvSZlTqziOvD4776GoqifrI5KV
	pScV/qLKbOjT2cKiAEdhqfx7ByvsIuN9JtKOm2C9NDFIydJZEMB6b0K3Zp0RlYfAt4qH
	Pz19K29syo+xcKLc/zKn4NWoYH1ui6c0DXIglItFpJ5nNdtOBVV7dEpyeUb3U/kAWkW0
	3ZUg==
X-Received: by 10.58.106.161 with SMTP id gv1mr15336929veb.35.1361185903566;
	Mon, 18 Feb 2013 03:11:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Mon, 18 Feb 2013 03:11:23 -0800 (PST)
In-Reply-To: <51220AAC.8080201@topic.nl>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl> <5116A5DA.90500@topic.nl>
	<CA+chaQfz1S1H4240eArHGYEc8Dh=ghzyLYVm1Eu8JyBWbgWMvA@mail.gmail.com>
	<A551BDF323A45B48ACE6A404AA16A1C4127A434C@TOP-EX01.TOPIC.LOCAL>
	<20130210195919.GA3300@jama> <51220AAC.8080201@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Feb 2013 11:11:23 +0000
Message-ID: <CAJTo0LbTZWh7-S3i+GmcPHDoRaRTN6BUniBcoX5_=eE6j21AuQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQl2t8jv3he0eJdNuFqO9cLehQxmevfFGyN1aZ+8lqfzHag/fu3TTf+UdQ/WoN3sfk+ED/Tr
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-core] How do I find out why are packages being rebuilt?
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
X-List-Received-Date: Mon, 18 Feb 2013 11:28:29 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 11:04, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I'm still having trouble with packages being needlessly rebuilt over and
> over. The worst of all it qt4-embedded, it takes about an hour to build.
> This is wasting a LOT of time.
>
> The classic OE never rebuilt a package until its version changed.

oe-core uses checksums of dependencies to determine what to rebuild -
so if a class you inherit changes it's populate_packages_prepend()
then the package task will re-execute, or if a dependeny package
rebuilds then your package will rebuild too.  If you're tracking
oe-core master then this often means large rebuilds as there may have
been changes to the base.bbclass or package.bbclass which obviously
impacts everything, and the usual churn in the packages.

bitbake-diffsigs will let you follow the signature differences that
cause a rebuild up the tree to identify what has changed.

Ross


