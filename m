Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DADAA77D2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UGj8aC023667; 
	Thu, 30 Mar 2017 17:45:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aBpXOryRBWLp; Thu, 30 Mar 2017 17:45:08 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UGj3WG023662
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 17:45:04 +0100
Message-ID: <1490892303.13980.369.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Serhii Popovych <spopovyc@cisco.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 17:45:03 +0100
In-Reply-To: <e5e8a9eba45b85ef30e6fcdf6276476da0d384b6.1490728922.git.spopovyc@cisco.com>
References: <cover.1490728921.git.spopovyc@cisco.com>
	<e5e8a9eba45b85ef30e6fcdf6276476da0d384b6.1490728922.git.spopovyc@cisco.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH v2 2/2] automake: Adjust shebang lines to remove interpreter path hardcode
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
X-List-Received-Date: Thu, 30 Mar 2017 16:45:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-03-28 at 19:25 +0000, Serhii Popovych wrote:
> If build host perl (and other tools) is old and we use some kind
> of toolchain to provide recent perl/python/etc to the OE build
> we still locked to use build host perl due to hardcoded shebang
> lines in automake scripts.
> 
> Behaviour was observed with Enterprise Linux 6 and devtoolset
> toolchain from SCL (Software Collections) used to provide recent
> version of perl (not provided with default buildtools-tarball).
> 
> Pass /usr/bin/env perl in ac_cv_path_PERL configuration variables
> for class-native and class-nativesdk. Use patch to automake to
> replace
> -w option in shebang line with modern way to enable warnings on perl
> (i.e. "use warnings").
> 
> Note that ac_cv_path_PERL must be valid perl interpreter path
> since configure will check perl version and Flock implementation.
> It is not possible currently to use nativeperl from native
> sysroot because automake does not DEPENDS on perl-native (and
> doing so fails due to circular dependencies). Only possible
> solution is to overwrite shebangs with nativeperl somewhere at
> do_install() and update RDEPENDS for class-native. Or add perl
> symlinks to nativeperl in sysroot.
> 
> For now it seems good to use perl found by /usr/bin/env from
> automake-native.
> 
> Also add RDEPENDS for class-nativesdk and add nativesdk-perl to
> them.
> 
> v2: Corrected Upstream-Status tag.
> 
> Cc: XE-Linux <xe-linux-external@cisco.com>
> Signed-off-by: Serhii Popovych <spopovyc@cisco.com>

Again, the patch description and what it actually does don't match
(RDEPENDS)...

Cheers,

Richard

