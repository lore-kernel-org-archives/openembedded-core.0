Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrsBw-0004pj-Te
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 15:54:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7CDntsN029290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 06:49:55 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 12 Aug 2011 06:49:54 -0700
Message-ID: <4E452F82.7060208@windriver.com>
Date: Fri, 12 Aug 2011 08:49:54 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1313153364.14274.486.camel@rex>
In-Reply-To: <1313153364.14274.486.camel@rex>
Subject: Re: [PATCH] local.conf.sample: Cleanup and improve
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
X-List-Received-Date: Fri, 12 Aug 2011 13:54:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/12/11 7:49 AM, Richard Purdie wrote:
> local.conf is the first thing anyone new to the project sees. Over time it
> has built up a ton cruft and isn't even accurate in places.
>     
> This patch:
>   
> * Moves things to local.conf.sample.extended if a new user is unlikely
>   to need to immediately care about the options
> * Reorders the file to be more intuitive to a new user
> * Moves certain default values to default-distrovars.inc in cases where
>   most users wouldn't want to change the value
> * Adds large blocks of text to explain what an option does. There have
>   been too many cases of a user not realising what some of these
>   settings do and how they can use them to their advantage (like DL_DIR
>   for example).
>     
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 2ef25e4..c2fd77e 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
...

> +#
> +# Package Management configuration
> +#
> +# This variable lists which packaging formats to enable. Multiple package backends 
> +# can be enabled at once and the first item listed in the variable will be used 
> +# to generate the root filesystems.
> +# Options are:
> +#  - 'package_deb' for debian style deb files
> +#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
> +#  - 'package_rpm' for rpm style packages
> +# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
> +# We default to rpm:
> +PACKAGE_CLASSES ?= "package_rpm"

While I certainly advocate package_rpm usage, should we be changing from the
default of ipk to rpm here?  I'm tempted to say we need to stick w/ ipk for the
time being...

...

> +#
> +# Interactive shell configuration
> +#
> +# Under certain circumstances the system may need input from you and to do this it 
> +# can launch an interactive shell. It needs to do this since the build is 
> +# multithreaded and needs to be able to handle the case where more than one parallel
> +# process may require the user's attention. The default is to use xterm.
> +#
> +# Examples of the occasions this may happen are when resolving patches which cannot
> +# be applied, to use the devshell or the kernel menuconfig
> +#
>  # If you do not use (or have installed) xterm you will need to
>  # uncomment these variables and set them to the terminal you wish to use
> -# when resolving patches which cannot be applied
> -# Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:
> +# 
> +# Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN are:
>  # GNOME, SCREEN, XTERM and KONSOLE
>  # Note: currently, Konsole support only works for KDE 3.x due to the way
>  # newer Konsole versions behave
>  #TERMCMD = "${XTERM_TERMCMD}"
>  #TERMCMDRUN = "${XTERM_TERMCMDRUN}"
> -# Alternatively, if you prefer you can disable patch resolution:
> +# You can disable interactive patch resolution (tasks will just fail instead) with:
>  #PATCHRESOLVE = "noop"

Should patch resolution be noop by default?  (I suspect due to my above concern
w/ ipkg, changing the behavior now is likely a bad idea.)

...

> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> new file mode 100644
> index 0000000..a42774c
> --- /dev/null
> +++ b/meta/conf/local.conf.sample.extended
> @@ -0,0 +1,116 @@

...

> +# The following are used to control options related to debugging.
> +#
> +# Uncomment this to change the optimization to make debugging easer, at the 
> +# possible cost of performance.
> +# DEBUG_BUILD = "1"
> +#
> +# Uncomment this to disable the stripping of the installed binaries
> +# INHIBIT_PACKAGE_STRIP = "1"
> +#
> +# Uncomment this to disable the split of the debug information into -dbg files
> +# INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +#
> +# When splitting debug information, the following controls the results of the
> +# file splitting.
> +#
> +#  .debug (default):
> +#    When splitting the debug information will be placed into
> +#    a .debug directory in the same dirname of the binary produced:
> +#      /bin/foo -> /bin/.debug/foo
> +#
> +#  debug-file-directory:
> +#    When splitting the debug information will be placed into
> +#    a central debug-file-directory, /usr/lib/debug:
> +#      /bin/foo -> /usr/lib/debug/bin/foo.debug
> +#
> +#    Any source code referenced in the debug symbols will be copied
> +#    and made available within the /usr/src/debug directory

May have been a bug in the original.  The "Any source code ..." comment refers
to both of the above.  It should likely lose two spaces in the indent...

> +#
> +#PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
> +# PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
> +

--Mark


