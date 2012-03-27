Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SCL6u-0002D5-S9
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 03:22:09 +0200
Received: by obqv19 with SMTP id v19so6240757obq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 18:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=/WG1Vc8pg+xIvyW2miNTA1Dmy22hD1n3ZeXIs3i11fk=;
	b=IDNhRMx6YhdwuxQbhwPbx0ldjhU8vG3Nf4Fuu9ITbncHFWR6QeqFm4zozQ8UFmcDdX
	aPjoPPwVoLx0jkK0FzjburIoeLSPdn2zmu3N0b7JjZrgWlmhpj6H1Im1l+DkyUzmdikp
	zl974obofk3ysj1y4otHjx887cwu0h/yuBjhHaAqmF47VlG8BfmrgbGJZL7pe0rwuZKT
	TvH2YfbVQ2DIqpBsx1sDT09vvW2JbsMJ9tiiXufeMF3XFumrke9fUTOt46NLKW7SNET6
	W91ga88bS3HrpFX6EWxucisjvr7gnHDJkDH2p1YmkFOeeHC1jAly2rNLqGctEa7YDfKF
	+AQw==
Received: by 10.60.3.104 with SMTP id b8mr29551690oeb.13.1332810788010;
	Mon, 26 Mar 2012 18:13:08 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id aj16sm2447589oec.4.2012.03.26.18.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 18:13:06 -0700 (PDT)
Date: Mon, 26 Mar 2012 18:13:05 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120327011305.GK21518@bill-the-cat>
References: <1332587383-23633-1-git-send-email-heinold@inf.fu-berlin.de>
	<20120326161722.GC21518@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20120326161722.GC21518@bill-the-cat>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Tue, 27 Mar 2012 01:22:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 26, 2012 at 09:17:22AM -0700, Tom Rini wrote:
> On Sat, Mar 24, 2012 at 12:09:41PM +0100, Henning Heinold wrote:
> > Hi,
> > 
> > while building openjdk I discovered that relocatable.bbclass strips
> > all PATHS with ORIGIN, that is problematic, when binaries like an jdk
> > is installed not in the standard paths /lib or /usr/lib.
> > 
> > This patch let all exisiting ORIGIN stay in the binary. So
> > far I only saw problems with some perl-native libs, where chrpath fails
> > now, because the path is to long. But it seems they work anyway.
> > 
> > While letting the path stay in binary it occurs that whitespaces at the end
> > of the last path sneaked some how in. So I made re.sub line to clean this up.
> > 
> > Bye Henning
> > 
> > PS: I have to appologize, that I send it to oe-dev before.
> 
> I replied to the oe-dev thread, but I have some concerns I need to work
> out about this patch since perl is in a similar situation already.  And
> that some perl-native libs are complaining after this patch is also
> worrying given how much of a pain perl+$ORIGIN can be.

OK, can you describe the problem you see, exactly?  Using Angstrom, and
current sources, building icedtea6-native gives me:
trini@bill-the-cat:~/work/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib/jvm/icedtea6-native/bin$ readelf -d java | grep ORIGIN
 0x000000000000000f (RPATH)              Library rpath: [$ORIGIN/../lib/amd64/jli:$ORIGIN/../jre/lib/amd64/jli]
 0x000000006ffffffb (FLAGS_1)            Flags: ORIGIN

So rpath isn't being clobbered today, but we aren't using all of our own
libs in these cases (zlib for example).  This is what I see both before
and after your patch is applied.

-- 
Tom


