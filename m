Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SUO3Z-0001mx-Q0
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 22:09:17 +0200
Received: by wibhn14 with SMTP id hn14so4572362wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nZmx6FHYC2UHXdnhqIwLtayTTzrGxmXigKb+C37XfnI=;
	b=FsbTVDKvQk2aflmVFsVEX+abmuQdZNhzNiF01G2Rega8Vv6ej5adcl5FHfe/91k906
	rRaelztAZ3Mfb9pR4VRVKUgHcLVN0X4GRAcAqdp48mLlEAH2yfdPXuMuX0i/k77YIYrV
	ExVgb9Oc3C6EnHIbgAEmp8Kyks9De8U5psJmxzTNOKi9vv0eXXzLU/XA3+UO2NNfFkjc
	/IwhIGKiirmwur9vT2l4CXG05tdkVB0RZvmOkkS5Z4TU11mKFsM8Kfzvg17F3os/dEAJ
	H1GdZw/lQ2z+CJwtYNj4PsGelwrbIChOLS2yeRwhsmWRfNWR5tQrNVcUkezM4GhvlkcL
	vZ4w==
Received: by 10.216.135.223 with SMTP id u73mr102157wei.117.1337111957448;
	Tue, 15 May 2012 12:59:17 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id j3sm624570wiw.1.2012.05.15.12.59.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 12:59:16 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SUNtr-0006en-3h; Tue, 15 May 2012 21:59:15 +0200
Date: Tue, 15 May 2012 21:59:15 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120515195914.GO29324@mx.loc>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<1336065154-8513-2-git-send-email-rep.dot.nop@gmail.com>
	<4FA859E5.4080609@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FA859E5.4080609@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/6] runqemu: use modern, single-char name of test(1)
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
X-List-Received-Date: Tue, 15 May 2012 20:09:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 07, 2012 at 04:25:25PM -0700, Joshua Lock wrote:
>On 03/05/12 10:12, Bernhard Reutner-Fischer wrote:
>>@@ -313,11 +313,11 @@ findimage() {
>>      # recently created one is the one we most likely want to boot.
>>      filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
>>      for name in $filenames; do
>>-        if [[ "$name" =~ core-image-sato-sdk ||
>>-              "$name" =~ core-image-sato     ||
>>-              "$name" =~ core-image-lsb      ||
>>-              "$name" =~ core-image-basic    ||
>>-              "$name" =~ core-image-minimal ]]; then
>>+        if [ "$name" =~ core-image-sato-sdk -o \
>>+              "$name" =~ core-image-sato     -o \
>>+              "$name" =~ core-image-lsb      -o \
>>+              "$name" =~ core-image-basic    -o \
>>+              "$name" =~ core-image-minimal ]; then
>>              ROOTFS=$name
>>              return
>>          fi	
>
>This change broke findimage() for me on both bash and dash.
>Reproducer is 'runqemu qemux86'.
>
>Under bash I get:
>
>/srv/yocto/poky/scripts/runqemu: line 303: [: too many arguments
>
>Undoing this change fixes things for me. Note: this change doesn't
>revert cleanly.
>
>I've filed this as Yocto #2433:
>https://bugzilla.yoctoproject.org/show_bug.cgi?id=2433
>
>As an aside, when trying (unsuccessfully) to figure out a fix for
>this I ran across Ubuntu's page on dash[1] which indicates changing
>|| for -o isn't right. Anyone have a strong opinion on that?

just a weak. That whole style is utterly broken.
case "$name" in
core-image-sato-sdk*|blah)
esac

Really that whole name hardcoding is plain stupid and over-engineered.
If the darn image exists then, heck, just use it.

But that's politics i fear -- not even sure if that intel-guy ment to
imply that, though. Somehow doubt it |-/

Any sane way out of that mess?
>
>Cheers,
>Joshua
>
>1. https://wiki.ubuntu.com/DashAsBinSh


