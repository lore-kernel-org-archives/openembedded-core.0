Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B00C660268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 04:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1G42RDM001904; Thu, 16 Feb 2017 04:02:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G5269JwEP_Ju; Thu, 16 Feb 2017 04:02:27 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1G42MIj001895
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Feb 2017 04:02:26 GMT
Message-ID: <1487217741.4999.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 20:02:21 -0800
In-Reply-To: <c5b75215539cdca65e5d5d90fa7b0068fb142473.1486757577.git.mariano.lopez@linux.intel.com>
References: <cover.1486757577.git.mariano.lopez@linux.intel.com>
	<c5b75215539cdca65e5d5d90fa7b0068fb142473.1486757577.git.mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv2 1/1] insane.bbclass: Add missing dependencies
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
X-List-Received-Date: Thu, 16 Feb 2017 04:02:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-10 at 14:19 -0600, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> package_qa task requires some tools installed in sysroot; with
> the introduction of recipe specific sysroot this task won't
> have such tools installed if it's forced to run.
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/insane.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass
> b/meta/classes/insane.bbclass
> index 3cf86c1..0167b14 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1223,9 +1223,12 @@ python do_package_qa () {
>      bb.note("DONE with PACKAGE QA")
>  }
>  
> +# binutils is used for most checks, so need to set as dependency
> +# POPULATESYSROOTDEPS is defined in staging class.
> +do_package_qa[depends] += "${POPULATESYSROOTDEPS}"
>  do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
>  do_package_qa[rdeptask] = "do_packagedata"
> -addtask do_package_qa after do_packagedata do_package before
> do_build
> +addtask do_package_qa after do_prepare_recipe_sysroot do_packagedata
> do_package before do_build

This is close but I don't think you need this last addtask change, I
think it should work just fine with the added [depends]?

Cheers,

Richard

