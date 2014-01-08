Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 72A686CEEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 12:58:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08CwIA8009741; Wed, 8 Jan 2014 12:58:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KnR_SszoX4-u; Wed,  8 Jan 2014 12:58:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08CwFmB009732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 12:58:16 GMT
Message-ID: <1389185889.6899.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Date: Wed, 08 Jan 2014 12:58:09 +0000
In-Reply-To: <d7cb4e9a-2926-44a2-b789-a31612162a44@TX2EHSMHS014.ehs.local>
References: <d7cb4e9a-2926-44a2-b789-a31612162a44@TX2EHSMHS014.ehs.local>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ptest.bblass: Fix package QA issues when disabled
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
X-List-Received-Date: Wed, 08 Jan 2014 12:58:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-08 at 17:05 +1000, Nathan Rossi wrote:
> When the ptest distro feature is disabled, a ptest directory is still
> created in the install phase, This directory is not cleaned up or
> consumed by any package and will throw a QA error, e.g.
> 
> ERROR: QA Issue: glib-2.0: Files/directories were installed but not
> shipped
>   /usr/lib/glib-2.0/ptest
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> 
> This is caused by the do_install_ptest_base[cleandirs] task flag which
> is not setup to be conditional on ptest being enabled. This patch
> changes the task flag to emit the cleandirs path only when the ptest
> distro feature is enabled.
> 
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> ---
>  meta/classes/ptest.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index ec10f80..3450085 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -49,7 +49,7 @@ do_install_ptest_base() {
>      fi
>  }
>  
> -do_install_ptest_base[cleandirs] = "${D}${PTEST_PATH}"
> +do_install_ptest_base[cleandirs] = "${@['', '${D}${PTEST_PATH}'][(d.getVar('PTEST_ENABLED', True) or '') == '1']}"
>  
>  addtask configure_ptest_base after do_configure before do_compile
>  addtask compile_ptest_base   after do_compile   before do_install

How about we use the new add/deltask api to conditionally add these
tasks only when ptest is enabled?

The number of conditionals in there is getting silly...

Cheers,

Richard



