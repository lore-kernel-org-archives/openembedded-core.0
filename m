Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TCVF6-0004Yo-N0
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 14:43:32 +0200
Received: from localhost ([127.0.0.1]:38611 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TCV2w-0007AR-6v
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 12:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=afslUCW+b8bEH1pvhDoP88jqxyw=; b=s7nKJy78Jc08GVlja9VMqH4mc1eZ
	BQMrts5LTDl6neGwPRTJzF+Jps3CKSDIfl295yPSXOK9KfBdDFAx9ti3GQsvhaoL
	sTYDflZ1OgbS0WIp2KiT6thSyjM5Vuy0g5jb5HmqHrMYeDssoaJUHxIvqYmhvJyh
	KkM254+V7clcPHE=
Received: from [195.171.99.130] (port=55580 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TCV2w-0007AO-4G
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 12:30:58 +0000
Message-ID: <505323D2.7060304@communistcode.co.uk>
Date: Fri, 14 Sep 2012 13:32:18 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <50531E8A.8000307@communistcode.co.uk>
	<1347624973.13596.7.camel@ted>
In-Reply-To: <1347624973.13596.7.camel@ted>
Subject: Re: Nothing provides libxcb-*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 12:43:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/12 13:16, Richard Purdie wrote:
> On Fri, 2012-09-14 at 13:09 +0100, Jack Mitchell wrote:
>> I am trying to use the package libxcb-xfixes in a recipe however when I
>> add 'libxcb-xfixes' to DEPENDS I get the error that nothing provides
>> libxcb-xfixes however the libxcb package clearly has it in the PACKAGES
>> variable
>>
>> recipes-graphics/xcb/libxcb.inc:PACKAGES =+ "libxcb-composite
>> libxcb-damage libxcb-dpms libxcb-glx \
>> recipes-graphics/xcb/libxcb.inc: libxcb-randr libxcb-record
>> libxcb-render libxcb-res \
>> recipes-graphics/xcb/libxcb.inc: libxcb-screensaver libxcb-shape
>> libxcb-shm libxcb-sync \
>> recipes-graphics/xcb/libxcb.inc: libxcb-xevie libxcb-xf86dri
>> libxcb-xfixes libxcb-xlib \
>> recipes-graphics/xcb/libxcb.inc: libxcb-xprint libxcb-xtest libxcb-xv
>> libxcb-xvmc \
>> recipes-graphics/xcb/libxcb.inc: libxcb-dri2"
>>
>> I have also tried using others in this package list to no avail, can
>> anybody comment on how I should be using these packages?
> You're mixing up the build time and runtime namespaces. You would add
> DEPENDS = "libxcb" or RDEPENDS_${PN}-xxx = "libxcb-xfixes".
>
> DEPENDS is build time and you use PN
>
> RDEPENDS/RRECOMMENDS/R* is runtime and values from PACKAGES
>
> Cheers,
>
> Richard
>

Ok, thanks! I guess I have a bigger problem then, the error I am 
recieving is:

| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| ERROR: Xfixes not found
|
| If you think configure made a mistake, make sure you are using the latest
| version from Git.  If the latest version fails, report the problem to the
| libav-user@libav.org mailing list or IRC #libav on irc.freenode.net.
| Include the log file "config.log" produced by configure as this will help
| solving the problem.


Now, I have libxcb in DEPENDS and I have the following configure options:

EXTRA_OECONF = " \
         --cross-prefix=${TARGET_PREFIX} \
         --enable-cross-compile \
         --sysroot="${STAGING_DIR_TARGET}" \
         --sysinclude="${STAGING_DIR_TARGET}${includedir}" \
         --target-os="linux" \
         --extra-cflags="${TARGET_CFLAGS} 
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
         --extra-ldflags="${TARGET_LDFLAGS}" \
         --arch=${TARGET_ARCH} \
         --enable-hardcoded-tables \
         --enable-shared \
         --enable-pthreads \
         --enable-gpl \
         --enable-avfilter \
         --prefix=${prefix} \
         --enable-x11grab \
         --enable-libtheora  \
         --enable-libvorbis \
         ${EXTRA_FFCONF} \
"

Is there anything glaringly wrong?I am worried about these two:

         --sysroot="${STAGING_DIR_TARGET}" \
         --sysinclude="${STAGING_DIR_TARGET}${includedir}" \

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



