Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3588F60670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 09:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB49lrOp009470; Thu, 4 Dec 2014 09:47:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8EztS8VMbMRP; Thu,  4 Dec 2014 09:47:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB49lck7009451
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Dec 2014 09:47:50 GMT
Message-ID: <1417686494.15614.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Thu, 04 Dec 2014 09:48:14 +0000
In-Reply-To: <8d53e3e985f526e6c845328dc6bfa9c27cc63413.1417623235.git.alejandro.hernandez@linux.intel.com>
References: <cover.1417623235.git.alejandro.hernandez@linux.intel.com>
	<8d53e3e985f526e6c845328dc6bfa9c27cc63413.1417623235.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA test for unexpanded ${D}
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
X-List-Received-Date: Thu, 04 Dec 2014 09:48:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-12-03 at 11:00 -0600, Alejandro Hernandez wrote:
> Checks in FILES and pkg_* variables ,solves common mistake
> of using ${D} instead of $D and warns the user accordingly.
> 
> [YOCTO #6642]
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/classes/insane.bbclass | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 0b45374..419c89b 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -906,6 +906,39 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
>  
>      return sane
>  
> +def package_qa_check_unexpanded_d(d):
> +    """
> +    Check for unexpanded D variable in pkg_* and FILES
> +    variables, warn the user to use it correctly.
> +    """
> +
> +    sane = True
> +
> +    # Get variables for current package
> +    pkg = d.getVar('PN', True)

Rather than just PN here (which may or may not be a package), you need
to iterate over the list of packages in PACKAGES.


> +    localdata = bb.data.createCopy(d)
> +    localdata.setVar('OVERRIDES', pkg)
> +    bb.data.update_data(localdata)
> +
> +    # Go through all variables and check if unexpanded D is found, warn the user accordingly
> +    for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
> +        bbvar = localdata.getVar(var, False)
> +        if bbvar:
> +            if "${D}" in bbvar:
> +                if var == 'FILES':
> +                    bb.error("FILES should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference")
> +                    sane = False
> +                else:
> +                    bb.error("%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pkg))
> +                    sane = False
> +    return sane
> +
> +# Actual task to check for ${D
> +python do_qa_check_unexpanded_d(){
> +    package_qa_check_unexpanded_d(d)
> +}
> +addtask qa_check_unexpanded_d before do_compile
> +

Why are we doing this before compile, rather than using the existing
package variable handling infrastructure in the class?

The other benefit of using that is we can benefit from the QA_WARN and
QA_ERR variables to determine if this issue is a warning or a fatal
error.

Cheers,

Richard



