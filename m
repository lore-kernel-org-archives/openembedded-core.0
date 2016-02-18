Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CA33A60053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 22:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1IMvIwU011168; Thu, 18 Feb 2016 22:57:18 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DpPY2JZ_VTnQ; Thu, 18 Feb 2016 22:57:18 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1IMvEAG011164
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Feb 2016 22:57:16 GMT
Message-ID: <1455836234.28376.100.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy Witt <randy.e.witt@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 22:57:14 +0000
In-Reply-To: <941d876fe835bc1aa26039d0edec9573d482bca3.1455815778.git.randy.e.witt@linux.intel.com>
References: <cover.1455815778.git.randy.e.witt@linux.intel.com>
	<941d876fe835bc1aa26039d0edec9573d482bca3.1455815778.git.randy.e.witt@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] populate_sdk_ext.bbclass: Add SDK_RECRDEP_TASKS variable
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
X-List-Received-Date: Thu, 18 Feb 2016 22:57:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-18 at 09:17 -0800, Randy Witt wrote:
> Currently there isn't a way for the extensible sdk to know all the
> tasks
> that will need sstate for an image. This is because a layer can add
> it's
> on custom tasks that are required for an image to be generated.
> 
> The extensible sdk solved this for poky by using recrdeptask and
> specifying the tasks known to be required for the image as well as
> for
> building new recipes.
> 
> So the SDK_RECRDEP_TASKS variable allows a user to specify additional
> tasks that need to be pulled in.
> 
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass
> index 7c95301..5f90aea 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -359,7 +359,7 @@ addtask sdk_depends
>  do_sdk_depends[dirs] = "${WORKDIR}"
>  do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)}"
>  do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk',
> 'recrdeptask', False)}"
> -do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa
> do_populate_sysroot do_deploy"
> +do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa
> do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
>  do_sdk_depends[rdepends] = "${@get_sdk_ext_rdepends(d)}"
>  
>  def get_sdk_ext_rdepends(d):

Doesn't this need a default value or it will throw parse failures?

Cheers,

Richard

