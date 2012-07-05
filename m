Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmcE8-0008Fl-Bu
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 04:55:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 19:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164147596"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 19:44:27 -0700
Message-ID: <4FF4FF8B.3050209@linux.intel.com>
Date: Wed, 04 Jul 2012 19:44:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341392163.git.liezhi.yang@windriver.com>
	<5135163d6cfa890d496aba5866947c6e1179c91c.1341392163.git.liezhi.yang@windriver.com>
In-Reply-To: <5135163d6cfa890d496aba5866947c6e1179c91c.1341392163.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/2] apt 0.7.14: runtime error: filename too long (tmpdir length)
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
X-List-Received-Date: Thu, 05 Jul 2012 02:55:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 03:16 AM, Robert Yang wrote:
> when the tmpdir dir is longer than 220, there is no files saved in
> tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
> this is because apt-get uses the path as the file name, but the file
> name can't be longer than 255 according to /usr/include/linux/limits.h.
>
> [YOCTO #2688]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../apt/apt-0.7.14/truncate-filename.patch         |   35 ++++++++++++++++++++
>   meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
>   meta/recipes-devtools/apt/apt.inc                  |    1 +
>   meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
>   4 files changed, 38 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/truncate-filename.patch
>
> diff --git a/meta/recipes-devtools/apt/apt-0.7.14/truncate-filename.patch b/meta/recipes-devtools/apt/apt-0.7.14/truncate-filename.patch
> new file mode 100644
> index 0000000..db1c42b
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt-0.7.14/truncate-filename.patch
> @@ -0,0 +1,35 @@
> +strutl.cc: the filename can't be longer than 255
> +
> +The URItoFileName translates the path into the filename, but the
> +filename can't be longer than 255 according to
> +/usr/include/linux/limits.h.
> +
> +Truncate it when it is longer than 240 (leave some spaces for
> +".Packages" and "._Release" suffix)
> +
> +Upstream-Status: Pending
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + apt-pkg/contrib/strutl.cc |    7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
> +--- a/apt-pkg/contrib/strutl.cc
> ++++ b/apt-pkg/contrib/strutl.cc
> +@@ -399,7 +399,12 @@ string URItoFileName(const string &URI)
> +    // "\x00-\x20{}|\\\\^\\[\\]<>\"\x7F-\xFF";
> +    string NewURI = QuoteString(U,"\\|{}[]<>\"^~_=!@#$%^&*");
> +    replace(NewURI.begin(),NewURI.end(),'/','_');
> +-   return NewURI;
> ++
> ++   // Truncate from the head when it is longer than 240
> ++   if(NewURI.length() > 240)
> ++       return NewURI.substr(NewURI.length() - 240, NewURI.length() - 1);
> ++   else
> ++       return NewURI;

Robert, I am not super familiar with this part of the DPKG code, what 
uses the URItoFileName() and what effect does the truncation have?

Sau!

> + }
> + 									/*}}}*/
> + // Base64Encode - Base64 Encoding routine for short strings		/*{{{*/
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
> index ca5476b..38e1fe6 100644
> --- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
> +++ b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
> @@ -1,6 +1,6 @@
>   require apt-native.inc
>
> -PR = "r8"
> +PR = "r9"
>
>   SRC_URI += "file://nodoc.patch \
>               file://noconfigure.patch \
> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
> index 1f6343a..563eda1 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -8,6 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
>              file://localefixes.patch \
>              file://makerace.patch \
>              file://remove-redeclaration.patch \
> +           file://truncate-filename.patch \
>              "
>
>   inherit autotools gettext
> diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
> index a627728..12dd1f2 100644
> --- a/meta/recipes-devtools/apt/apt_0.7.14.bb
> +++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
> @@ -3,7 +3,7 @@ RDEPENDS_${PN} = "dpkg"
>   LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
>   require apt.inc
>
> -PR = "r13"
> +PR = "r14"
>
>   SRC_URI += "file://nodoc.patch \
>               file://includes-fix.patch "
>



