Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD817542A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 08:43:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w558hjbo019722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 5 Jun 2018 09:43:46 +0100
Message-ID: <61a0d69463b0b86d2de917653f0c7a989c699971.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <rehsack@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 05 Jun 2018 09:43:45 +0100
In-Reply-To: <98DF6614-20AE-41EB-BC2C-D20A477F63C3@gmail.com>
References: <98DF6614-20AE-41EB-BC2C-D20A477F63C3@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] cpan_build.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Tue, 05 Jun 2018 08:43:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-05-28 at 20:55 +0200, Jens Rehsack wrote:
> The modern the time, the improvements in ExtUtils::MakeMaker.
> 
> Nowadays, .packlist and perllocal.pod aren't touched anymore when appropriate
> flags set during configure stage. Controlling the flags globally avoids
> dual-life recipes need share patching.
> 
> Further: remove prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong (search
> order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} contains core
> libpath only ...
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/cpan.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
I put this in for testing but I see:

$ SDKMACHINE="i686" bitbake nativesdk-libxml-parser-perl
[...]
ERROR: nativesdk-libxml-parser-perl-2.44-r0 do_package: nativesdk-libxml-parser-perl: chrpath command failed with exit code 7:
b'/media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux/nativesdk-libxml-parser-perl/2.44-r0/package/opt/poky/2.5+snapshot/sysroots/i686-pokysdk-linux/usr/lib/perl/vendor_perl/5.24.1/auto/XML/Parser/Expat/Expat.so: RPATH=/media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux/nativesdk-libxml-parser-perl/2.44-r0/recipe-sysroot/opt/poky/2.5+snapshot/sysroots/i686-pokysdk-linux/usr/lib\n'b"new rpath '$ORIGIN/../../../../../../../../../../../../../../media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux/nativesdk-libxml-parser-perl/2.44-r0/recipe-sysroot/opt/poky/2.5+snapshot/sysroots/i686-pokysdk-linux/usr/lib' too large; maximum length 176\n"
ERROR: nativesdk-libxml-parser-perl-2.44-r0 do_package: Function failed: perform_packagecopy
ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux/nativesdk-libxml-parser-perl/2.44-r0/temp/log.do_package.23783
ERROR: Task (virtual:nativesdk:/media/build1/poky/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb:do_package) failed with exit code '1'

which seems to reproduce fairly readily both locally and on the
autobuilders. Reverting this patch resolves it.

Cheers,

Richard

