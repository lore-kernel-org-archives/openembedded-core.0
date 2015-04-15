Return-Path: <janne.karhunen@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1430F6AC24
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 17:38:41 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so58168882pab.3
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KgKfJpxMkG1180TaMtu/Z6W1BB588H85y6Bg96WuzJU=;
	b=lNZ7fOcTB6Q4KI8CjpF7aiCEbhXAvFECZ/gH86yZleAtoukw3UCoKF9IGzYgmhdOza
	xM6AESFJpVSe104BsZtuMogNQGf/3KbjC7G44JStFqzU0ACC572bQNxackgPhfysS0OS
	Cv/5sI09+i/Oclk9fxiYBJiXFL14Qd2/Kv/IOEWnHSSaRzaHKftHI2J6pVGBcbJ1QVPx
	Oe18Ws+eXZDK+p7tJE8xK7LDKs+6eVzAhizFaUQsGlLHzr6lyyRwUTTMTTbVvzVeuyFL
	JRFQgZHrA7rjcBKegVaBqtICHt533QQFnOq52USNXtBdK5054wmNJBHrvH/a6eYzlq0d
	NDFQ==
MIME-Version: 1.0
X-Received: by 10.66.167.106 with SMTP id zn10mr48550314pab.126.1429119523130; 
	Wed, 15 Apr 2015 10:38:43 -0700 (PDT)
Received: by 10.70.132.162 with HTTP; Wed, 15 Apr 2015 10:38:43 -0700 (PDT)
In-Reply-To: <20150414062101.GA11904@ad.chargestorm.se>
References: <CAE=NcrY2Y3dmF5qmfS1=QXcE0k1OOX8GdWMo7PDZ+W348ZSxaA@mail.gmail.com>
	<20150414062101.GA11904@ad.chargestorm.se>
Date: Wed, 15 Apr 2015 10:38:43 -0700
Message-ID: <CAE=NcrZW+gZDDLA_bn+AUb81PTkSwmKNbZ3+4zfBtBA9DeAfPA@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: Re: compiling the host tools natively for the host Linux?
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
X-List-Received-Date: Wed, 15 Apr 2015 17:38:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 13, 2015 at 11:21 PM, Anders Darander <anders@chargestorm.se> wrote:

>> Is there a way to compile the host tools (primarily interested in the
>> compiler) for the host Linux rather than for the own distro?
>
> Could you explain what you're trying to achieve a little bit more?
>
> Which computer do you call host Linux and which one is "own distro"?

Host is the thing build runs on, 'own distro' is the minimal runtime
generated to run the sdk toolset, including the compiler. I really
don't need the latter, for me host runtime would be all I need.

I'm generating bitbake toolchains and images in OBS cluster, they
compile as nice set of RPMs people can install into their environments
via host distro native means. They can also be kept up to date like
that without anyone having to reinstall SDK and/or core images, it
just magically happens.

Now within OBS, bitbake build & sdk install happens within rpm build
root directory. Problem is that relocating the built SDK in
$RPM_BUILD_DIR/$RPM_BUILD_ROOT to its final resting place during
package install (say, to /opt) does not work straight due to the
clever trickery being done with the linker (.interp section) and the
tool/lib RPATHs pointing to the sysroot under $RPM_BUILD_ROOT where
the SDK was installed. I solved this by manually relocating the entire
SDK toolset in RPM '%post' to the new location specified during
package install (rpm --prefix=). This is all fine, but hairy. Would be
far better just to drop the 'own runtime' needed to run the tools and
just compile the toolset for the host.. tools would work straight
without any relocation.


--
Janne

