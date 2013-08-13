Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DD4B360664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 19:02:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Aug 2013 12:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,872,1367996400"; d="scan'208";a="385774599"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2013 12:02:18 -0700
Message-ID: <520A82BA.2070706@linux.intel.com>
Date: Tue, 13 Aug 2013 12:02:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: rongqing.li@windriver.com
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
In-Reply-To: <02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Tue, 13 Aug 2013 19:02:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2013 01:20 AM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, then
> sstate_create_package will store SSTATE_BUILDDIR into a archive file by
> tar, but once other packages install the same file into sysroot, the
> creating the archive file will fail with below error:
>
>      DEBUG: Executing shell function sstate_create_package
>      tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed as we read it
>
> This kind of error is harmless, use --ignore-failed-read to ignore it.
>
I am not sure it's so harmless, what if the file is corrupted, then we 
have a bad sstate tarball.  You have identified the part of the root 
cause being the hardlink, but what if the file actually does change 
(which would be a different bug potentially), then your packaging a 
differet set of macros (in this case) with the sysroot.


Sau!

> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/classes/sstate.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index c1ca54b..3e2fedd 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -565,7 +565,7 @@ sstate_create_package () {
>   	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>   	# Need to handle empty directories
>   	if [ "$(ls -A)" ]; then
> -		tar -czf $TFILE *
> +		tar --ignore-failed-read -czf $TFILE *
>   	else
>   		tar -cz --file=$TFILE --files-from=/dev/null
>   	fi
>

