Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0760A610F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 11:38:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBABbqVB023941; Tue, 10 Dec 2013 11:37:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d0xTlwK8rHuP; Tue, 10 Dec 2013 11:37:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBABbmvJ023937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 10 Dec 2013 11:37:50 GMT
Message-ID: <1386675463.4332.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>
Date: Tue, 10 Dec 2013 11:37:43 +0000
In-Reply-To: <52A128B8.9050300@windriver.com>
References: <cover.1386232830.git.Qi.Chen@windriver.com>
	<f728bc59095fc51372c8771356ca7fef2ed71bb5.1386232830.git.Qi.Chen@windriver.com>
	<52A1011A.8080809@linux.intel.com> <52A128B8.9050300@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libgcrypt: fix compile error with '-O2' in sysroot path
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
X-List-Received-Date: Tue, 10 Dec 2013 11:38:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-12-06 at 09:30 +0800, ChenQi wrote:
> On 12/06/2013 06:41 AM, Saul Wold wrote:
> > On 12/05/2013 12:55 AM, Qi.Chen@windriver.com wrote:
> >> From: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
> >> compiling cipher. If we are cross compiling libgcrypt and sysroot
> >> contains such characters, we would get compile errors because the
> >> sysroot path has been modified.
> >>
> >> Fix this by adding whitespaces before and after the original matching
> >> pattern in the sed command.
> >>
> >> [YOCTO #5628]
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   ...fix-compile-error-with-O2-in-sysroot-path.patch |   46 
> >> ++++++++++++++++++++
> >>   meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
> >>   2 files changed, 48 insertions(+), 1 deletion(-)
> >>   create mode 100644 
> >> meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch
> >>
> >> diff --git 
> >> a/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch 
> >> b/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch 
> >>
> >> new file mode 100644
> >> index 0000000..6b1f119
> >> --- /dev/null
> >> +++ 
> >> b/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch
> >> @@ -0,0 +1,46 @@
> >> +Upstream-Status: Pending
> >> +
> >> +libgcrypt: fix building error with '-O2' in sysroot path
> >> +
> >> +Characters like '-O2' or '-Ofast' will be replaced by '-O1' when 
> >> compiling cipher.
> >> +If we are cross compiling libgcrypt and sysroot contains such 
> >> characters, we would
> >> +get compile errors because the sysroot path has been modified.
> >> +
> >> +Fix this by adding blank spaces before and after the original 
> >> matching pattern in the
> >> +sed command.
> >> +
> >> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> +---
> >> + cipher/Makefile.am |    2 +-
> >> + cipher/Makefile.in |    2 +-
> >> + 2 files changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> >> +index 76cdc96..9a89792 100644
> >> +--- a/cipher/Makefile.am
> >> ++++ b/cipher/Makefile.am
> >> +@@ -69,7 +69,7 @@ rfc2268.c \
> >> + camellia.c camellia.h camellia-glue.c
> >> +
> >> + if ENABLE_O_FLAG_MUNGING
> >> +-o_flag_munging = sed -e 's/-O\([2-9s][2-9s]*\)/-O1/' -e 
> >> 's/-Ofast/-O1/g'
> >> ++o_flag_munging = sed -e 's/ -O\([2-9s][2-9s]*\) / -O1 /' -e 's/ 
> >> -Ofast / -O1 /g'
> >> + else
> >> + o_flag_munging = cat
> >> + endif
> >> +diff --git a/cipher/Makefile.in b/cipher/Makefile.in
> >> +index 1394d15..6080d59 100644
> >> +--- a/cipher/Makefile.in
> >> ++++ b/cipher/Makefile.in
> >
> > Why do we need to patch Makefile.in if we are already patching the 
> > Makefile.am which will re-generate the Makefile.in
> >
> > Sau!
> >
> 
> I thought it would do no harm. And I will send this patch to upstream, 
> so it might be a little strange that I only modify the Makefile.am file 
> even if Makefile.in has the same problem.

It can actually be harmful since the modification time of Makefile.in
can be after the time for Makefile.am and things can go "very wrong"
with autotools when that happens :(

Cheers,

Richard


