Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6075F619DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 21:08:41 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5ELEGkm011866; Fri, 14 Jun 2013 22:14:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 88TqqPTnVwyX; Fri, 14 Jun 2013 22:14:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5ELEDpo011861
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 14 Jun 2013 22:14:14 +0100
Message-ID: <1371244100.20823.92.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 14 Jun 2013 22:08:20 +0100
In-Reply-To: <1371242900-7066-1-git-send-email-sgw@linux.intel.com>
References: <1371242900-7066-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-buildenv-internal: Preserve/Unset and Restore TERM
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
X-List-Received-Date: Fri, 14 Jun 2013 21:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-14 at 13:48 -0700, Saul Wold wrote:
> Having a value in TERM that is not recognized by the nativesdk can cause
> potential escape sequences appearing in the output stream, the can be seen
> on Ubuntu with TERM=xterm-256color. Unsetting TERM allows for consistent
> results in the python output.
> 
> Also, don't exit, use return, otherwise the shell exits and get no error information.
> 
> [YOCTO #4732]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  scripts/oe-buildenv-internal | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 40d95b7..9be034b 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -29,6 +29,8 @@ if [ ! -z "$OECORE_SDK_VERSION" ]; then
>      return 1
>  fi
>  
> +TERM_save=$TERM
> +unset TERM
>  # Make sure we're not using python v3.x. This check can't go into
>  # sanity.bbclass because bitbake's source code doesn't even pass
>  # parsing stage when used with python v3, so we catch it here so we
> @@ -37,7 +39,7 @@ py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
>  if [ "$py_v3_check" != "" ]; then
>  	echo "Bitbake is not compatible with python v3"
>  	echo "Please set up python v2 as your default python interpreter"
> -	exit 1
> +	return 1
>  fi
>  
>  # Similarly, we now have code that doesn't parse correctly with older
> @@ -46,7 +48,7 @@ fi
>  py_v26_check=`python -c 'import sys; print sys.version_info >= (2,7,3)'`
>  if [ "$py_v26_check" != "True" ]; then
>  	echo "BitBake requires Python 2.7.3 or later"
> -	exit 1
> +	return 1
>  fi
>  
>  if [ "x$BDIR" = "x" ]; then
> @@ -107,3 +109,5 @@ HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
>  all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
>  SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
>  SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
> +
> +export TERM=$TERM_save

No. This is just wrong in so many ways. I commented on the bug.

This also means any command you run after sourcing the script gets a
broken TERM value.

Cheers,

Richard


