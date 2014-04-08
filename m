Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 99F9765D66
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 10:08:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s38A8FuH009215; Tue, 8 Apr 2014 11:08:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n0TgsxfTBrH3; Tue,  8 Apr 2014 11:08:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s38A8AHu009211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 8 Apr 2014 11:08:11 +0100
Message-ID: <1396951684.24597.90.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Tue, 08 Apr 2014 11:08:04 +0100
In-Reply-To: <5343539B.3030808@windriver.com>
References: <cover.1396600342.git.Chong.Lu@windriver.com>
	<946d60db486d1ac1c5b3aecf64b029e8a15d42de.1396600342.git.Chong.Lu@windriver.com>
	<1396608067.2910.110.camel@ted> <5343539B.3030808@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernelshark/trace-cmd: fix syntax error of shell
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
X-List-Received-Date: Tue, 08 Apr 2014 10:08:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-08 at 09:40 +0800, Chong Lu wrote:
> On 04/04/2014 06:41 PM, Richard Purdie wrote:
> > On Fri, 2014-04-04 at 16:33 +0800, Chong Lu wrote:
> >> Delete "<<<" syntax of bash in Makefile, else we would get following error:
> >>
> >>          Syntax error: redirection unexpected
> >>
> >> [YOCTO #6112]
> >>
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >> ---
> >>   meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |  3 ++-
> >>   .../kernelshark-fix-syntax-error-of-shell.patch    | 30 ++++++++++++++++++++++
> >>   .../trace-cmd-fix-syntax-error-of-shell.patch      | 30 ++++++++++++++++++++++
> >>   meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |  1 +
> >>   4 files changed, 63 insertions(+), 1 deletion(-)
> >>   create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
> >>   create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
> >>
> >> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> >> index 9268a50..d61097d 100644
> >> --- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> >> +++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> >> @@ -15,7 +15,8 @@ inherit pkgconfig pythonnative
> >>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
> >>              file://addldflags.patch \
> >>              file://make-docs-optional.patch \
> >> -           file://blktrace-api-compatibility.patch"
> >> +           file://blktrace-api-compatibility.patch \
> >> +           file://kernelshark-fix-syntax-error-of-shell.patch"
> >>   S = "${WORKDIR}/git"
> >>   
> >>   EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
> >> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
> >> new file mode 100644
> >> index 0000000..994a9fa
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
> >> @@ -0,0 +1,30 @@
> >> +kernelshark: fix syntax error of shell
> >> +
> >> +Delete "<<<" syntax of bash in Makefile, else we would get following error:
> >> +
> >> +	Syntax error: redirection unexpected
> >> +
> >> +Upstream-Status: Inappropriate [embedded specific]
> > How is this embedded specific?
> >
> > Cheers,
> >
> > Richard
> This issue only produced in yocto.
> It is not problem for kernelshark and trace-cmd itself.
> So I think this is embedded specific.

I'm afraid I don't accept this explanation. Is Yocto's make different
somehow which causes this error?

I don't understand why yocto would see this error yet other systems
(which use the same make as far as I know) would not.

Cheers,

Richard


