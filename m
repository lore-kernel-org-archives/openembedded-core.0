Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHa9b-0000Ix-5B for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 14:26:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ACHFYH025842
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:17:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22962-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:17:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ACH6Ut025831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:17:07 +0100
Message-ID: <1334060226.6861.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 13:17:06 +0100
In-Reply-To: <d233ff9b666db604ab0ed7fb6b447a97fe1b1a99.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
	<d233ff9b666db604ab0ed7fb6b447a97fe1b1a99.1334042473.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL [v2] 05/14] package.bbclass: needs_ldconfig from linux_so is needed in global namespace
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
X-List-Received-Date: Tue, 10 Apr 2012 12:26:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 00:26 -0700, Saul Wold wrote:
> From: Andrei Gherzan <andrei@gherzan.ro>
> 
> "The suite of statements in a function definition executes with a local namespace
> that is different from the global namespace. This means that all variables created
> within a function are local to that function. When the suite finishes, these
> working variables are discarded."
> 
> In this way the needs_ldconfig variable in linux_so never gets True in the statements
> below this function. As global statement is generally discouraged, a return value
> would be a clean and fast way to solve this issue.
> 
> [YOCTO #2205]
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/classes/package.bbclass |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index d35667a..c98e8fa 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1263,6 +1263,7 @@ python package_do_shlibs() {
>  	lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
>  
>  	def linux_so(root, path, file):
> +		needs_ldconfig = False
>  		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
>  		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
>  		fd = os.popen(cmd)
> @@ -1283,6 +1284,7 @@ python package_do_shlibs() {
>  					needs_ldconfig = True
>  				if snap_symlinks and (file != this_soname):
>  					renames.append((os.path.join(root, file), os.path.join(root, this_soname)))
> +		return needs_ldconfig
>  
>  	def darwin_so(root, path, file):
>  		fullpath = os.path.join(root, file)
> @@ -1382,7 +1384,7 @@ python package_do_shlibs() {
>  				if targetos == "darwin" or targetos == "darwin8":
>  					darwin_so(root, dirs, file)
>  				elif os.access(path, os.X_OK) or lib_re.match(file):
> -					linux_so(root, dirs, file)
> +					needs_ldconfig = linux_so(root, dirs, file)

I've replied with a question on this elsewhere.

Cheers,

Richard



