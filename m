Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYHxF-00034j-HX for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:59:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADEjDDu004742;
	Tue, 13 Nov 2012 14:45:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03956-10; Tue, 13 Nov 2012 14:45:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADEj3st004730
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 13 Nov 2012 14:45:04 GMT
Message-ID: <1352817904.24487.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Tue, 13 Nov 2012 14:45:04 +0000
In-Reply-To: <1352815729-7409-1-git-send-email-constantinx.musca@intel.com>
References: <1352815729-7409-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: add qa_package_check_name
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
X-List-Received-Date: Tue, 13 Nov 2012 14:59:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-13 at 16:08 +0200, Constantin Musca wrote:
> Check if package names match the [a-z0-9.+-]+ regular
> expression
> 
> [YOCTO #3139]
> 
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/classes/insane.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index d51d1a1..f22e620 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -235,6 +235,15 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
>          messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
>                   (name, package_qa_clean_path(path,d)))
>  
> +def package_qa_check_name(name, d):
> +    """
> +    Check if the package name matches the [a-z0-9.+-]+ regular expression
> +    """
> +    import re
> +    pattern = re.compile("^[a-z0-9.+-]+$")


Please stash this somewhere outside the function. Compiling regexps is
expensive, using them is much less so. We'll get much performance if we
just compile it once.

Cheers,

Richard

> +    if not pattern.match(name):
> +        package_qa_handle_error("pkgname", "%s doesn't match the [a-z0-9.+-]+ regex\n" % name, d)
> +
>  def package_qa_check_libdir(d):
>      """
>      Check for wrong library installation paths. For instance, catch
> @@ -780,6 +789,9 @@ python do_package_qa () {
>                  errorchecks.append(g[testmatrix[e]])
>  
>          bb.note("Checking Package: %s" % package)
> +        # Check package name
> +        package_qa_check_name(package, d)
> +
>          path = "%s/%s" % (pkgdest, package)
>          if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
>              walk_sane  = False




