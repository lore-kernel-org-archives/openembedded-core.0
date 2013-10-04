Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A6AE06CC50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 11:33:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BXl73004634; Fri, 4 Oct 2013 12:33:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZJkTV80UC1md; Fri,  4 Oct 2013 12:33:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BXfgH004618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 4 Oct 2013 12:33:42 +0100
Message-ID: <1380886416.18603.598.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Richard Tollerton <rich.tollerton@ni.com>
Date: Fri, 04 Oct 2013 12:33:36 +0100
In-Reply-To: <1380755881-17842-1-git-send-email-rich.tollerton@ni.com>
References: <1380755881-17842-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, gratian.crisan@ni.com, ken.sharp@ni.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [dylan, master][PATCH] populate_sdk_base: Fix relocate_sdk.py execution on Arch
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
X-List-Received-Date: Fri, 04 Oct 2013 11:33:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-02 at 18:18 -0500, Richard Tollerton wrote:
> relocate_sdk.py is #!/usr/bin/env python, but is not python3-compatible.
> The PEP 394 alias `python2` is sadly not universally supported, so
> instead of modifying relocate_sdk.py directly, change the `exec` in
> relocate_sdk.sh to use it if it exists.
> 
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Wasn't the script fixed in master to avoid this problem?

Cheers,

Richard

> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index e5bc0b4..e67d8b6 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -256,8 +256,9 @@ if [ x$tdir = x ] ; then
>     echo "SDK relocate failed, could not create a temporary directory"
>     exit 1
>  fi
> +python_bin="$(command -v python2 2>/dev/null)" || python_bin=python
>  echo "#!/bin/bash" > $tdir/relocate_sdk.sh
> -echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
> +echo exec $python_bin ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
>  $SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
>  $SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
>  rm -rf $tdir



