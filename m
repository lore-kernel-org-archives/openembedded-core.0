Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9C56FF01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 16:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3SGMJLu030277; Thu, 28 Apr 2016 17:22:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VibbzoAnOdxf; Thu, 28 Apr 2016 17:22:19 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3SGMGWS030272
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Apr 2016 17:22:17 +0100
Message-ID: <1461860536.5465.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Joshua Lock <joshua.g.lock@intel.com>
Date: Thu, 28 Apr 2016 17:22:16 +0100
In-Reply-To: <996BAFC5-CEC6-4296-A8BD-E7EA383A754F@gmail.com>
References: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
	<996BAFC5-CEC6-4296-A8BD-E7EA383A754F@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] security_flags: turn potential string format security issues into an error
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
X-List-Received-Date: Thu, 28 Apr 2016 16:22:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-28 at 08:58 -0700, Khem Raj wrote:
> > On Apr 28, 2016, at 6:27 AM, Joshua Lock <joshua.g.lock@intel.com>
> > wrote:
> > 
> > -SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie
> > ${lcl_maybe_fortify}"
> > -SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong
> > ${lcl_maybe_fortify}"
> > +# Error on use of format strings that represent possible security
> > problems
> > +SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security 
> > -Werror=format-security"
> > +
> > +SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie
> > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > +SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong
> > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > 
> > SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
> > SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
> > @@ -92,6 +95,23 @@ SECURITY_CFLAGS_pn-zlib =
> > "${SECURITY_NO_PIE_CFLAGS}"
> > SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
> > SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
> > 
> > +# Recipes which fail to compile when elevating -Wformat-security
> > to an error
> > +SECURITY_STRINGFORMAT_pn-busybox = ""
> > +SECURITY_STRINGFORMAT_pn-console-tools = ""
> > +SECURITY_STRINGFORMAT_pn-cmake = ""
> > +SECURITY_STRINGFORMAT_pn-expect = ""
> > +SECURITY_STRINGFORMAT_pn-gcc = ""
> > +SECURITY_STRINGFORMAT_pn-gettext = ""
> > +SECURITY_STRINGFORMAT_pn-kexec-tools = ""
> > +SECURITY_STRINGFORMAT_pn-leafpad = ""
> > +SECURITY_STRINGFORMAT_pn-libuser = ""
> > +SECURITY_STRINGFORMAT_pn-ltp = ""
> > +SECURITY_STRINGFORMAT_pn-makedevs = ""
> > +SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
> > +SECURITY_STRINGFORMAT_pn-stat = ""
> > +SECURITY_STRINGFORMAT_pn-unzip = ""
> > +SECURITY_STRINGFORMAT_pn-zip = ""
> 
> Can we use _remove operation instead of introducing a new variable
> and emptying it out here.

I actually suggested we do the above. The reason is that this way, the
user can configure which flags they actually want to use. "remove" also
has the problem that its near impossible for the user to override
further.

I'm starting to believe that remove usage in OE-Core itself is actually
symptomatic of a problem and that if we end up using it, it probably
should be done differently.

Cheers,

Richard



