Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 362 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Feb 2015 09:20:33 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D1FD072374
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:20:33 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0BDA9D4080A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 10:14:31 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D2EDED40369
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 10:14:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 10:14:29 +0100 (CET)
Date: Thu, 12 Feb 2015 10:14:23 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150212091423.GA18807@mail.itconsulting-heinold.de>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
	<c350ce001e1785f5fe8878cbcf5b5e07417d646a.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c350ce001e1785f5fe8878cbcf5b5e07417d646a.1423732000.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 2/7] libtool: don't execute automake and autoconf on every invocation
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
X-List-Received-Date: Thu, 12 Feb 2015 09:20:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 12, 2015 at 01:07:35AM -0800, Robert Yang wrote:
> From the origin commit message:
> Regression from 2.4.2 was causing noticable slow-down in builds
> that call libtool many times.
> * build-aux/ltmain.in (func_help): Override func_help() from
> gl/build-aux/options-parser to only run automake --version and
> autoconf --version when libtool --help is executed on the command
> line.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.5.inc    |    1 +
>  ...-t-execute-automake-and-autoconf-on-every.patch |   71 ++++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
> 
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.5.inc b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
> index 88e281f..0f6bdc8 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.5.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
> @@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>             file://fix-resolve-lt-sysroot.patch \
>             file://nohardcodepaths.patch \
>             file://unwind-opt-parsing.patch \
> +           file://libtool-don-t-execute-automake-and-autoconf-on-every.patch \
>            "
>  
>  SRC_URI[md5sum] = "7d30ed9fa6bb11270ebb31639a37bd54"
> diff --git a/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch b/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
> new file mode 100644
> index 0000000..f48f09c
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
> @@ -0,0 +1,71 @@
> +From 408cfb9c5fa8a666917167ffb806cb19deded429 Mon Sep 17 00:00:00 2001
> +From: "Gary V. Vaughan" <gary@gnu.org>
> +Date: Fri, 6 Feb 2015 12:58:34 +0000
> +Subject: [PATCH] libtool: don't execute automake and autoconf on every
> + invocation.
> +
> +Regression from 2.4.2 was causing noticable slow-down in builds
> +that call libtool many times.
> +* build-aux/ltmain.in (func_help): Override func_help() from
> +gl/build-aux/options-parser to only run automake --version and
> +autoconf --version when libtool --help is executed on the command
> +line.
> +* NO-THANKS: Add Robert Yang.
> +Reported by Robert Yang
> +
> +Signed-off-by: Gary V. Vaughan <gary@gnu.org>
> +

typo
> +Updated: Change NO-THANKS to THANKS to apply the patch since upsream
                                                                ^^^^^^^
> +renamed it.
> +
> +Upstream-Stauts: Backport
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
> +---
> + THANKS           |    1 +
> + build-aux/ltmain.in |    9 ++++++++-
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/THANKS b/THANKS
> +index 0ab162d..aa7aa8c 100644
> +--- a/THANKS
> ++++ b/THANKS
> +@@ -258,6 +258,7 @@ Robert Garron                       Robert.Garron@Access3000.net
> + Robert Millan                       rmh@aybabtu.com
> + Robert Ögren                        lists@roboros.com
> + Roberto Bagnara                     bagnara@cs.unipr.it
> ++Robert Yang                         liezhi.yang@windriver.com
> + Roger Cornelius                     rac@tenzing.org
> + Roland Mainz                        roland.mainz@nrubsig.org
> + Roumen Petrov                       bugtrack@roumenpetrov.info
> +diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
> +index 46a0bb5..d5cf07a 100644
> +--- a/build-aux/ltmain.in
> ++++ b/build-aux/ltmain.in
> +@@ -127,7 +127,12 @@ usage_message="Options:
> + "
> + 
> + # Additional text appended to 'usage_message' in response to '--help'.
> +-long_help_message=$long_help_message"
> ++func_help ()
> ++{
> ++    $debug_cmd
> ++
> ++    func_usage_message
> ++    $ECHO "$long_help_message
> + 
> + MODE must be one of the following:
> + 
> +@@ -158,6 +163,8 @@ include the following information:
> + Report bugs to <@PACKAGE_BUGREPORT@>.
> + GNU @PACKAGE@ home page: <@PACKAGE_URL@>.
> + General help using GNU software: <http://www.gnu.org/gethelp/>."
> ++    exit 0
> ++}
> + 
> + 
> + # func_lo2o OBJECT-NAME

Bye Henning

