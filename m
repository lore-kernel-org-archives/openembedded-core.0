Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SyjTI-0000E4-D6
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 15:05:16 +0200
Received: by qcad10 with SMTP id d10so2265021qca.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+H08VjYg157POEdDDcWDyBXfvGjSz5joEiPQYS+vtVQ=;
	b=MiHqhdVXM5wC9E77x+S2SLNHrssC3F8OikRDHZAx192zWS7pbth0hnx7D6giu2GYSl
	j3N0J0ymyieAkWlKaJGj0jdn8kAy6mSHc95K9VE8g/mzuVFs4gEmsG/bkmwUJ+a5IRjb
	c81MTZlhlS6i3wNwnPRlHX4J1F/6QicHJYgNFYf+YmXgGIMwlVZn5Uq5s3LsDhEH0nLd
	+m8eJYakpc8s+0IZPmxi+HrGt3uTTqTiaIvtuFV/vWAv38uhcncaHzWMThrKOcaTF6ms
	rbxJi3ZlJhK74YOktANh/NPOxnLyTGmRqxmuqL8ajGdT4jmth7vHg4VxTot3db5EPRwg
	y6Kw==
MIME-Version: 1.0
Received: by 10.224.185.70 with SMTP id cn6mr23613980qab.16.1344344010214;
	Tue, 07 Aug 2012 05:53:30 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 7 Aug 2012 05:53:30 -0700 (PDT)
In-Reply-To: <1344338236.9756.218.camel@ted>
References: <1344338236.9756.218.camel@ted>
Date: Tue, 7 Aug 2012 08:53:30 -0400
Message-ID: <CADkTA4Ob=K8MzMSVZdJiT4NQHrLAssxwee0+i=b2BFXckUMS0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-3.4: Disable extra slang header search path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 13:05:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 7, 2012 at 7:17 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Add in a workaround to avoid host infection detection build failures
> from the slang include directory in perf. I'll defer to Bruce to
> fix this properly but we need a workaround now as this is breaking
> builds.

I was out of the office yesterday, so I couldn't check to see if the real fix
for this arrived .. I'll know once I dig out of my email backlog.

Even if I don't have the patch I've been waiting for, I'll pop this
into the tree
and send it out with a pull later today.

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-kernel/linux/linux-yocto/noslang.patch b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
> new file mode 100644
> index 0000000..9cada34
> --- a/dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
> @@ -0,0 +1,20 @@
> +We (OE) install slang into /usr/include so we never need to look into
> +/usr/include/slang/. We never want to look into a hardcoded path like this
> +since it triggers host infection issues. For now, simply remove this
> +since it causes us problems.
> +
> +Upstream-Status: Pending (would need rework)
> +
> +Index: tools/perf/Makefile
> +===================================================================
> +--- linux.orig/tools/perf/Makefile     2012-08-07 10:29:43.020149620 +0000
> ++++ linux/tools/perf/Makefile  2012-08-07 10:30:08.128148098 +0000
> +@@ -504,7 +504,7 @@
> +               BASIC_CFLAGS += -DNO_NEWT_SUPPORT
> +       else
> +               # Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
> +-              BASIC_CFLAGS += -I/usr/include/slang
> ++              # BASIC_CFLAGS += -I/usr/include/slang
> +               EXTLIBS += -lnewt -lslang
> +               LIB_OBJS += $(OUTPUT)util/ui/setup.o
> +               LIB_OBJS += $(OUTPUT)util/ui/browser.o
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 48333b3..5ab46b7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -20,6 +20,8 @@ SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>
> +SRC_URI += "file://noslang.patch"
> +
>  LINUX_VERSION ?= "3.4.6"
>
>  PR = "${INC_PR}.0"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


