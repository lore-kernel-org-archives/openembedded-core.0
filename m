Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF56609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 00:57:55 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id j17so7208605oag.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 17:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PdeChvZN+qtFSf/MYOaKJWzPV/4kZnRwtOPK+XWnZJg=;
	b=OF2Yv+Oy+b7WEqTEUUD9s6wj6Y8xSSjTcz91u9gxM+Li4x6YtKSh1BTnDeM4To3mWu
	+KO3gmXchrWxVxxI7bX3/cipX0oYQWiweRi8WJV4+eTEJj3ixFFZXAYSZb//TMyQLpZb
	lWmyi6ij+9J5b4ERGg3PptG9HISYH3nTYyFGmWCcPFkntYYx1BPIDtPLKVOHwsFtAZWL
	VK78pfzKAH627Ee27d4GFv3OQ+/9c516SCPzoXPO8/ciMwWj47+XScusxnwncm7cnCyj
	0IwLEsPCh7X3wL2KOwRfVe0dmOntNRaOdRlt34miGKO/wa8eOcPiXjpIcPfPCvfWK974
	Nmdg==
MIME-Version: 1.0
X-Received: by 10.182.121.170 with SMTP id ll10mr43706579obb.58.1404867476738; 
	Tue, 08 Jul 2014 17:57:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Tue, 8 Jul 2014 17:57:56 -0700 (PDT)
In-Reply-To: <CAJTo0Lbsf6fw=rg3mQv7CqJ+Apmxd2X6W=srNf6dNer_5VZqNQ@mail.gmail.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
	<CAJTo0Lbsf6fw=rg3mQv7CqJ+Apmxd2X6W=srNf6dNer_5VZqNQ@mail.gmail.com>
Date: Tue, 8 Jul 2014 21:57:56 -0300
X-Google-Sender-Auth: aVLGTWuCs6id7Vm7TK25K7eI1ek
Message-ID: <CAP9ODKrMXK1c25F8E4ApXTKRSc2VHw1kMMZev5ZEMATeCRAGFA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 0/8] support xmlto
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
X-List-Received-Date: Wed, 09 Jul 2014 00:58:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 8, 2014 at 6:33 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 8 July 2014 10:47, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> The xmlto was shipped from meta-oe, and fixed the defects that
>> 'xmlto/xsltproc stylesheets cannot be found even when they are
>> installed in sysroot'
>>
>> The xmlto required docbook-xml-dtd and docbook-xsl-stylesheets,
>> we refered debian's docbook-xml-dtd and ubuntu config.
>>
>> We also enable xmlto for alsa-utils, xorg-proto-common.inc,
>> xorg-lib-common.inc, xserver-xorg.inc.
>
> Presumably the goal here is to enable documentation generation?  I'd
> say what we want is more complicated than a blanket "--with-xmlto" and
> comes back to the same points I raised when the doxygen patch was
> submitted.
>
> Native packages never need to build documentation, as nobody is going
> to read it.  We've made steps in this direction with the texinfo class
> that stubs makeinfo for native recipes.
>
> Target packages may want documentation, but may not.  A powerul board
> such as a Minnow or Beagle can support development on the target and
> having e.g. the X11 protocol documentation available might be
> convenient.  A board with no UI and 64MB of RAM isn't going to support
> development on the target and every built piece of documentation is
> wasted time.
>
> SDK packages do want documentation.  The ability to ship a SDK with a
> toolchain, libraries, and exactly the correct documentation for the
> libraries is valuable and currently something we can't do.
>
> I'd suggest that we need a global BUILD_DOCUMENTATION variable that
> can be overridden per-class so that e.g. native and target recipes
> don't build documentation but SDK packages do.  Then along with xmlto
> we can add gtk-doc and doxygen, adding the ability to build full API
> documentation for the SDKs.
>
> As such this is definitely a two-part series.  Adding xmlto is useful
> and I'm genuinely happy that someone who wasn't me managed to get
> docbook-xsl working ;) as that's the blocker for gtk-doc support too.
> However rnabling xmlto in some recipes globally isn't the right thing
> to do and will introduce noticeable regressions in build time for many
> classes of users for no reason.

I second all your concerns and also I add that the commit logs were too pour.

I am really not sure about a global setting is the way to go. I'd be
more included to a PACKAGECONFIG like system.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

