Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U1IgK-0000q6-32 for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 16:37:46 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r11FQZFF019001; Fri, 1 Feb 2013 15:26:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wzN2+iuAw0En; Fri,  1 Feb 2013 15:26:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r11FQU2J018992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Feb 2013 15:26:32 GMT
Message-ID: <1359732091.14071.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Fri, 01 Feb 2013 15:21:31 +0000
In-Reply-To: <510BD7AD.5090506@topic.nl>
References: <510BD7AD.5090506@topic.nl>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What's up with "fontconfig"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 15:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-02-01 at 15:56 +0100, Mike Looijmans wrote:
> When compiling fontconfig, it fails because it is using "build" flags in 
> the host compiler. I have BUILD_OPTIMIZATIONS="-march=native ..." set, 
> and fontconfig will fail to compile because it passes the -march=native 
> flag to the ARM compiler which then fails. Which is justified.
> 
> This is the part in the recipe that worries me:
> 
> do_configure_append () {
> 	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-case/Makefile
> 	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-glyphname/Makefile
> 	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-lang/Makefile
> 
> 	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-case/Makefile
> 	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-glyphname/Makefile
> 	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-lang/Makefile
> 
> 	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-case/Makefile
> 	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-glyphname/Makefile
> 	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-lang/Makefile
> 
> 	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-case/Makefile
> 	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-glyphname/Makefile
> 	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-lang/Makefile
> 
> }
> 
> This is not a "native" package. The above commands put the build systems 
> include patch and compiler flags into the makefile.
> 
> I've worked around the issue by creating a a bbappend that simply 
> removes "-march=native" from the build flags, which makes the build of 
> this package succeed.
> 
> I have no idea what fontconfig is supposed to do and where it is 
> supposed to run, but it looks to me as if that configure_append should 
> not be there at all.

This does look rather worrying and Ross mentioned this to me but wasn't
able to find the history. I was more successful and ironically this was
introduced by Ross:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c2d22f0f36980eecc7cf2ad818a5033476614bfc

We likely need to replace this with something sane. The question is
whether we need it at all and if so, what problem dies it solve?

Cheers,

Richard



