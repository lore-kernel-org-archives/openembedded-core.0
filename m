Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCUSa-0002eS-9I for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 13:53:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EBelCp010965;
	Fri, 14 Sep 2012 12:40:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10777-02; Fri, 14 Sep 2012 12:40:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EBebea010959
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 12:40:38 +0100
Message-ID: <1347622840.9456.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Radu Moisan <radu.moisan@intel.com>
Date: Fri, 14 Sep 2012 12:40:40 +0100
In-Reply-To: <1347616211-3039-1-git-send-email-radu.moisan@intel.com>
References: <1347616211-3039-1-git-send-email-radu.moisan@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] insane.bbclass: add library dir sanity check
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
X-List-Received-Date: Fri, 14 Sep 2012 11:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 12:50 +0300, Radu Moisan wrote:
> Check in ${PKGD} for libraries in other locations
> then ${libdir}. Trigger a warning if so.
> 
> [Yocto #2038]
> 
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  meta/classes/insane.bbclass |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index e74eb3f..d748c26 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -212,6 +212,18 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
>          messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
>                   (name, package_qa_clean_path(path,d)))
>  
> +def package_qa_check_libdir(path,libdir):
> +    """
> +    Check in path for libraries in other locations then libdir. Trigger a warning if so.
> +    """
> +    import re
> +    lib_re = re.compile("^.*\.(so)")
> +    for root, dirs, files in os.walk(path):
> +        if libdir not in root:
> +            for file in files:
> +                if lib_re.match(file):
> +                    bb.warn("Found library in wrong location: %s" % os.path.join(root,file))

This is heading in the right direction but this needs to be something
like:

messages = []
for ...:
    ...
    messages.append("Found library in wrong location: %s" % os.path.join(root,file))
if messages:
    package_qa_handle_error("libdir", "\n".join(messages), d)

so that it checks ERROR_QA for libdir and is either a warning or is
fatal.

Pattern wise, this needs to look for \lib.*\.so or ${exec_prefix}\lib.*
\.so and then check it doesn't start with ${base_libdir}/ or ${libdir}/
respectively.

>      """
> @@ -688,6 +700,12 @@ python do_package_qa () {
>              rdepends_sane = False
>  
> 
> +    ml = d.getVar("MLPREFIX", True) or ""
> +    if ml:
> +        pkgd = d.getVar('PKGD', True)
> +        libdir = d.getVar("libdir", True)
> +        package_qa_check_libdir(pkgd,libdir)
> +

With the above changes, this doesn't need to be multilib specific. It
will likely show more warnings on multilib builds at least.

I'd also appreciate a list of failures on a world mulitlib build (you
should be able to set that away in the background and generate it) to
see how widespread any problems might be.

Cheers,

Richard




