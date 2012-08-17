Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2PTX-0001qF-Ae for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:32:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGKiWD010839;
	Fri, 17 Aug 2012 17:20:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10094-06; Fri, 17 Aug 2012 17:20:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HGKYgL010832
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 17 Aug 2012 17:20:35 +0100
Message-ID: <1345220434.27428.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 17:20:34 +0100
In-Reply-To: <1345218791-28891-2-git-send-email-andy.ross@windriver.com>
References: <1345218791-28891-1-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-2-git-send-email-andy.ross@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 1/2] insane.bbclass: Fix RPATH warning in the face of funny path strings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 16:32:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 08:53 -0700, Andy Ross wrote:
> In toolchain edge cases it's possible for the RPATH of a library to be
> set to something like "/usr/lib/../lib".  This should be detected as
> "/usr/lib" and generate a warning.
> 
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>  meta/classes/insane.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 556a176..b84a89f 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -161,6 +161,10 @@ def package_qa_check_rpath(file,name, d, elf, messages):
>              if dir in line:
>                  messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
>  
> +def rpath_eq(a, b):
> +    import os.path

You don't need that import, os is always assumed to be present for our
code since it gets used so often. I'd suggest defining this within the 
package_qa_check_useless_rpaths() function too since its slightly less
effort for the parser.

Cheers,

Richard

> +    return os.path.normpath(a) == os.path.normpath(b)
> +
>  QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
>  def package_qa_check_useless_rpaths(file, name, d, elf, messages):
>      """
> @@ -181,7 +185,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
>      	m = rpath_re.match(line)
>  	if m:
>  	   rpath = m.group(1)
> -	   if rpath == libdir or rpath == base_libdir:
> +	   if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
>  	      # The dynamic linker searches both these places anyway.  There is no point in
>  	      # looking there again.
>  	      messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))




