Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TjQX7-0001se-Le
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 09:22:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBE5VM38012397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Dec 2012 21:31:22 -0800 (PST)
Received: from bruce-ashfields-macbook.local (128.224.22.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 13 Dec 2012 21:31:21 -0800
Message-ID: <50CAB9A8.7010101@windriver.com>
Date: Fri, 14 Dec 2012 00:31:20 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <tom.zanussi@intel.com>
References: <cover.1355462107.git.tom.zanussi@intel.com>
	<e7a95fde7267ebf9a1567d3f3aa1e459e12a5fea.1355462107.git.tom.zanussi@intel.com>
In-Reply-To: <e7a95fde7267ebf9a1567d3f3aa1e459e12a5fea.1355462107.git.tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] module.bbclass: make sure do_make_scripts() executes after do_patch()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 08:22:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-12-14 12:27 AM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi<tom.zanussi@intel.com>
>
> If do_make_scripts() executes before do_unpack()/do_patch(), the build
> fails because it can't cd into the workdir of a recipe using this
> class, so make sure do_make_scripts() doesn't run before the package
> has been unpacked and patched.

I've never seen the problem myself, but having a more tightly defined
ordering for the task is a good thing in my books.

Since you aren't breaking the working use case, I have no objection.

So I'll throw out a fancy: Reviewed-by: Bruce Ashfield 
<bruce.ashfield@windriver.com>

Cheers,

Bruce

>
> Fixes [YOCTO #3589].
>
> Signed-off-by: Tom Zanussi<tom.zanussi@intel.com>
> ---
>   meta/classes/module.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index e8d32eb..ebb0880 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -3,7 +3,7 @@ DEPENDS += "virtual/kernel"
>
>   inherit module-base
>
> -addtask make_scripts before do_compile
> +addtask make_scripts after do_patch before do_compile
>   do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>   do_make_scripts[deptask] = "do_populate_sysroot"
>



