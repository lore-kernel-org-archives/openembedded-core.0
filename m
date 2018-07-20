Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E60EB78A90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 15:58:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6KFwWpC009567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:58:33 +0100
Message-ID: <e8d9f535385d6520dbd775761c2057b0b66509b0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 16:58:32 +0100
In-Reply-To: <20180720154845.4449-1-richard.purdie@linuxfoundation.org>
References: <20180720154845.4449-1-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Request for help - Simple cleanup/optimisation task
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
X-List-Received-Date: Fri, 20 Jul 2018 15:58:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-07-20 at 16:48 +0100, Richard Purdie wrote:
> Replace usage of oe.utils.getstatusoutput() with direct subprocess
> calls. The call is just a wraper to the subprocess call of the same
> name and requires the caller to handle exceptions themselves. We
> usually do this badly, failing to show the output or the command or
> the return code.
> 
> Its much safer to rely on a call like subprocess.check_output()
> instead.
> 
> This also makes it easier to spot and remove cases where shell=True
> isn't needed in a later cleanup.

The change below is something I'd worked on to cleaup up code in
package.bbclass. It removes the oe.utils.getstatusoutput() calls and
replaced them with subprocess.check_output().

We could really do with replacing the other users of this function
which a quick grep shows are in the files:

classes/kernel-yocto.bbclass
classes/compress_doc
classes/sanity.bbclass
lib/oe/patch.py
lib/oe/gpg_sign.py

We'd probably need to ensure the output has the .decode("utf-8") if the
output is used in code, I did that in some of the earlier
package.bbclass patches but not here.

I'm hoping we could then drop some of the custom exception handling
which is often errorprone/buggy like the patch below.

The second step is then to go over the subprocess calls and look at the
ones specifying shell=True. For example in sanity.bbclass it has:

status, result = oe.utils.getstatusoutput("tar --version")

which could be ["tar", "--version"] as the cmd, then we don't need
shell=True and we save the process overhead of starting the subshell.

It sounds trivial but these calls all mount up. Some cases justify the
shell usage, many don't. shlex may be an option in some cases.

Does anyone fancy working on such a cleanup/optimisation? It seems like
something someone might be happy to help with and see their name in the
commit logs? :)

Cheers,

Richard

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package.bbclass | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 978a8fbeb57..86a6090f1b0 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -430,6 +430,7 @@ def copydebugsources(debugsrcdir, d):
>      # and copied to the destination here.
>  
>      import stat
> +    import subprocess
>  
>      sourcefile = d.expand("${WORKDIR}/debugsources.list")
>      if debugsrcdir and os.path.isfile(sourcefile):
> @@ -466,23 +467,20 @@ def copydebugsources(debugsrcdir, d):
>          processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
>  
>          cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
> -        (retval, output) = oe.utils.getstatusoutput(cmd)
> -        # Can "fail" if internal headers/transient sources are attempted
> -        #if retval:
> -        #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
> +        try:
> +            subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> +        except subprocess.CalledProcessError:
> +            # Can "fail" if internal headers/transient sources are attempted
> +            pass
>  
>          # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
>          # Work around this by manually finding and copying any symbolic links that made it through.
>          cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
> -        (retval, output) = oe.utils.getstatusoutput(cmd)
> -        if retval:
> -            bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
> +        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>  
>          # The copy by cpio may have resulted in some empty directories!  Remove these
>          cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
> -        (retval, output) = oe.utils.getstatusoutput(cmd)
> -        if retval:
> -            bb.fatal("empty directory removal failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> +        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>  
>          # Also remove debugsrcdir if its empty
>          for p in nosuchdir[::-1]:
> @@ -643,6 +641,8 @@ python package_do_split_locales() {
>  }
>  
>  python perform_packagecopy () {
> +    import subprocess
> +
>      dest = d.getVar('D')
>      dvar = d.getVar('PKGD')
>  
> @@ -650,9 +650,7 @@ python perform_packagecopy () {
>      # files to operate on
>      # Preserve sparse files and hard links
>      cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (dest, dvar)
> -    (retval, output) = oe.utils.getstatusoutput(cmd)
> -    if retval:
> -        bb.fatal("file copy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> +    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>  
>      # replace RPATHs for the nativesdk binaries, to make them relocatable
>      if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d):
> -- 
> 2.17.1
> 

