Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TF0X6-0001w2-3F for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 12:32:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LAJex5018039;
	Fri, 21 Sep 2012 11:19:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11894-08; Fri, 21 Sep 2012 11:19:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LAJWRf018033
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 11:19:33 +0100
Message-ID: <1348222772.10108.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Radu Moisan <radu.moisan@intel.com>
Date: Fri, 21 Sep 2012 11:19:32 +0100
In-Reply-To: <f8aa3721ae0bbbb972063cf38be6339e11964a37.1348046845.git.radu.moisan@intel.com>
References: <cover.1348046845.git.radu.moisan@intel.com>
	<f8aa3721ae0bbbb972063cf38be6339e11964a37.1348046845.git.radu.moisan@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: add library dir sanity check
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
X-List-Received-Date: Fri, 21 Sep 2012 10:32:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-19 at 12:32 +0300, Radu Moisan wrote:
> Check in ${PKGD} for libraries in wrong locations.
> Trigger a warning if so.
> Eg. Catch recipe installing /lib/bar.so when ${base_libdir}="lib32"
> or installing in /usr/lib64 when ${libdir}="/usr/lib"
> 
> [Yocto #2038]
> 
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  meta/classes/insane.bbclass |   39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index e74eb3f..425e93a 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -113,7 +113,7 @@ def package_qa_get_machine_dict():
>  
> 
>  # Currently not being used by default "desktop"
> -WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev"
> +WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
>  
>  def package_qa_clean_path(path,d):
> @@ -212,6 +212,40 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
>          messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
>                   (name, package_qa_clean_path(path,d)))
>  
> +def package_qa_check_libdir(d):
> +    """
> +    Check for wrong library installation paths. For instance, catch
> +    recipes installing /lib/bar.so when ${base_libdir}="lib32" or
> +    installing in /usr/lib64 when ${libdir}="/usr/lib"
> +    """
> +    import re
> +
> +    pkgd = d.getVar('PKGD', True)
> +    base_libdir = d.getVar("base_libdir",True) + os.sep
> +    libdir = d.getVar("libdir", True) + os.sep
> +    exec_prefix = d.getVar("exec_prefix", True) + os.sep
> +
> +    messages = []
> +    my_files = []
> +
> +    for root, dirs, files in os.walk(pkgd):
> +        for file in files:
> +            full_path = os.path.join(root,file)
> +            my_files.append(full_path[len(pkgd):])
> +
> +    lib_re = re.compile("^/lib.*\.so")
> +    exec_re = re.compile("^%s.*/lib*.\.so" % exec_prefix)
> +
> +    for file in my_files:
> +        if lib_re.match(file):
> +            if base_libdir not in file:
> +                messages.append("Found library in wrong location: %s" % file)
> +        if exec_re.match(file):
> +            if libdir not in file:
> +                messages.append("Found library in wrong location: %s" % file)
> +    if messages:
> +        package_qa_handle_error("libdir", "\n".join(messages), d)
> +
>  QAPATHTEST[debug-files] = "package_qa_check_dbg"
>  def package_qa_check_dbg(path, name, d, elf, messages):
>      """
> @@ -688,6 +722,9 @@ python do_package_qa () {
>              rdepends_sane = False
>  
> 
> +    if 'libdir' in (d.getVar("WARN_QA", True) or "").split():
> +        package_qa_check_libdir(d)


I merged this but added a follow up with one other tweak since this
wouldn't work in the case libdir was in ERROR_QA:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=30b7781650e3ff092d04889beab2e87eaff29cdb

I had some other cleanup in mind so I wrote the patch as that was the
easiest way to explain it :)

Cheers,

Richard



