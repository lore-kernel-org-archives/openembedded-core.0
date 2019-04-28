Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6AF7D6CE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 10:55:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so11270546wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kzXADJG9X3xt5nfszOrH8mbMp3kJtQROpkdVygZQECs=;
	b=BMEtLY4p35UxQOQfHGYr6DTMPDOQb+H/MQ+OSiMGdubEIagbnmznnkYy7WDYmzQnGd
	AazZmpLWxIZB2VPjjMynlB53d3cuRSIwKNqUllrQULEMft9fnQzlxQcLEBnnmdAeKI7Q
	G9HfQL7cxKITgTDWtW+BCOwUReRKa/8w7pAIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kzXADJG9X3xt5nfszOrH8mbMp3kJtQROpkdVygZQECs=;
	b=snhMlV1ujrELfb7zqbxR+VGX1SdhWiTbspO3jSR9n6MXzmK8WeZT3W297XbX4wcy0T
	hjUHGtzD87bMtGVDfTq78g/dfydKD2st34rJQqNW1DMcptQ32egTe1cLoSO3tPvmd4xX
	Z/BqXXqcIx8KlgKh9jnqCrDe9GchO2/cRM/8JZtgDdmpxpIiqU096m1eEM3/NQsD8ZHU
	MMn8lNFp3mmTQRcGOwdijSSgm5vZ54Z679YnAtJJ3AYcBNMwQvzgg430ndwfQp2A49dZ
	Kaqzqj6EgM0Gi5h3QAfSmFcUAaEsw1cru1kGk0CY5vW8zVqmE02Xqr7bG8iOW0jwvB2Y
	auZg==
X-Gm-Message-State: APjAAAV4GOZikezwIorClPIRmKdvJHDS5/Lr/wJko7n7FmkKDBrjneRC
	FoLvo5l3E9jFxwCUYN0NA5pj/w==
X-Google-Smtp-Source: APXvYqzT2vL0LcYjjbdpzjJ300CilrzKdpiiFhPA//cJdqaQu5u0qZdZB7dLrRkMICjsoi7Yhxxodg==
X-Received: by 2002:a05:6000:1242:: with SMTP id
	j2mr16531533wrx.274.1556448925652; 
	Sun, 28 Apr 2019 03:55:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d3sm58706969wmf.46.2019.04.28.03.55.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 28 Apr 2019 03:55:24 -0700 (PDT)
Message-ID: <6f32834d1eee3495ce11c15195fb30d75892df79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, mingli.yu@windriver.com
Date: Sun, 28 Apr 2019 11:55:23 +0100
In-Reply-To: <E278AA1B-9805-4539-9572-1D55212BC2D3@gmail.com>
References: <1556434683-140874-1-git-send-email-mingli.yu@windriver.com>
	<1556434971-251075-1-git-send-email-mingli.yu@windriver.com>
	<E278AA1B-9805-4539-9572-1D55212BC2D3@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bjam-native: do not search all PATHs variable
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
X-List-Received-Date: Sun, 28 Apr 2019 10:55:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2019-04-28 at 11:38 +0200, Alexander Kanavin wrote:
> Wait, why is this a problem for specifically bjam, but not the other
> tools that also look into PATH? Shouldn’t you fix the nfs instead?

I have to agree that you really don't want invalids NFS paths in PATH.
We're not carrying a patch for that.

Cheers,

Richard

> Alex
> 
> > On 28 Apr 2019, at 9.02, <mingli.yu@windriver.com> <
> > mingli.yu@windriver.com> wrote:
> > 
> > From: Li Wang <li.wang@windriver.com>
> > 
> > By default, it searches all paths specified by $PATH.
> > 
> > But if the directory of the $PATH variable on
> > build host includes nfs(build host as nfs client),
> > it causes the build hung when the nfs server is
> > unavailable.
> > 
> > Signed-off-by: Li Wang <li.wang@windriver.com>
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> > meta/recipes-support/boost/bjam-native_1.69.0.bb   |  1 +
> > .../bjam-do-not-search-all-PATHs-varibale.patch    | 53
> > ++++++++++++++++++++++
> > 2 files changed, 54 insertions(+)
> > create mode 100644 meta/recipes-support/boost/files/bjam-do-not-
> > search-all-PATHs-varibale.patch
> > 
> > diff --git a/meta/recipes-support/boost/bjam-native_1.69.0.bb
> > b/meta/recipes-support/boost/bjam-native_1.69.0.bb
> > index 94f96e6..395ad34 100644
> > --- a/meta/recipes-support/boost/bjam-native_1.69.0.bb
> > +++ b/meta/recipes-support/boost/bjam-native_1.69.0.bb
> > @@ -6,6 +6,7 @@ SECTION = "devel"
> > inherit native
> > 
> > SRC_URI += "file://bjam-native-build-bjam.debug.patch \
> > +            file://bjam-do-not-search-all-PATHs-varibale.patch \
> > "
> > 
> > do_compile() {
> > diff --git a/meta/recipes-support/boost/files/bjam-do-not-search-
> > all-PATHs-varibale.patch b/meta/recipes-support/boost/files/bjam-
> > do-not-search-all-PATHs-varibale.patch
> > new file mode 100644
> > index 0000000..742603a
> > --- /dev/null
> > +++ b/meta/recipes-support/boost/files/bjam-do-not-search-all-
> > PATHs-varibale.patch
> > @@ -0,0 +1,53 @@
> > +bjam: do not search all PATHs varibale
> > +
> > +By default, it searches all paths specified by $PATH.
> > +But if the directory of the $PATH variable on
> > +build host includes nfs, it causes system hung
> > +when nfs server is unavailable.
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Li Wang <li.wang@windriver.com>
> > +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > +---
> > + tools/build/src/engine/build.jam | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/tools/build/src/engine/build.jam
> > b/tools/build/src/engine/build.jam
> > +index a92b70f..f866619 100644
> > +--- a/tools/build/src/engine/build.jam
> > ++++ b/tools/build/src/engine/build.jam
> > +@@ -781,8 +781,8 @@ if $(OS) = NT
> > + }
> > + SUFEXE ?= "" ;
> > + 
> > +-yacc ?= [ GLOB $(PATH) : yacc$(SUFEXE) ] ;
> > +-yacc ?= [ GLOB $(PATH) : bison$(SUFEXE) ] ;
> > ++yacc ?= [ GLOB "" : yacc$(SUFEXE) ] ;
> > ++yacc ?= [ GLOB "" : bison$(SUFEXE) ] ;
> > + yacc ?= [ GLOB "$(ProgramFiles:J= )\\GnuWin32\\bin"
> > +     "C:\\Program Files\\GnuWin32\\bin" : bison$(SUFEXE) ] ;
> > + yacc = $(yacc[1]) ;
> > +@@ -966,7 +966,7 @@ if $(OS) = NT
> > + }
> > + if $(UNIX) = true
> > + {
> > +-    tar ?= [ GLOB $(PATH) : star bsdtar tar ] ;
> > ++    tar ?= [ GLOB "" : star bsdtar tar ] ;
> > +     tar = $(tar[1]) ;
> > +     switch $(tar:D=:S=)
> > +     {
> > +@@ -1047,8 +1047,8 @@ rule .package ( dst-dir : src-files + )
> > + }
> > + 
> > + # RPM distro file.
> > +-rpm-tool = [ GLOB $(PATH) : "rpmbuild" ] ;
> > +-rpm-tool ?= [ GLOB $(PATH) : "rpm" ] ;
> > ++rpm-tool = [ GLOB "" : "rpmbuild" ] ;
> > ++rpm-tool ?= [ GLOB "" : "rpm" ] ;
> > + rpm-tool = $(rpm-tool[1]) ;
> > + rule .rpm ( name : source )
> > + {
> > +-- 
> > +2.18.1
> > +
> > -- 
> > 2.7.4
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


