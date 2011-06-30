Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcIh5-00009Y-Ry for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 16:58:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UEsSde019840
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 15:54:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19403-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 15:54:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UEsJKf019834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 15:54:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309432642.2551.131.camel@phil-desktop>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
	<1309354589.2551.40.camel@phil-desktop>
	<1309355375.20015.383.camel@rex>
	<1309432642.2551.131.camel@phil-desktop>
Date: Thu, 30 Jun 2011 15:54:00 +0100
Message-ID: <1309445640.20015.444.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Thu, 30 Jun 2011 14:58:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 12:17 +0100, Phil Blundell wrote:
> On Wed, 2011-06-29 at 14:49 +0100, Richard Purdie wrote:
> > I'd love to see a patch for this! :)
> 
> Your wish, naturally, is my command.  I've built micro-base-image with
> this and verified that I didn't get any false positives; I also checked
> (via some manual fiddling) that it did indeed detect the case that we
> want it to.  
> 
> I guess it might be a good idea for someone to test it with a slightly
> larger dataset before actually checking it in, just in case.

Thanks, I'll let Saul try this against a wider build and assuming it
doesn't throw out too many issues we can get it merged.

Cheers,

Richard

> p.
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 35809b9..f7e5524 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -103,6 +103,7 @@ def package_qa_get_machine_dict():
>  # 8 - .la contains reference to the workdir
>  # 9 - LDFLAGS ignored
>  # 10 - Build paths in binaries
> +# 11 - package depends on devel package
>  
>  def package_qa_clean_path(path,d):
>      """ Remove the common prefix from the path. In this case it is the TMPDIR"""
> @@ -134,6 +135,7 @@ def package_qa_write_error(error_class, name, path, d):
>          ".la contains reference to the workdir",
>          "LDFLAGS ignored",
>          "package contains reference to tmpdir paths",
> +	"package depends on devel package",
>      ]
>  
>      log_path = os.path.join( bb.data.getVar('T', d, True), "log.qa_package" )
> @@ -493,12 +495,14 @@ def package_qa_check_rdepends(pkg, pkgdest, d):
>          # Now check the RDEPENDS
>          rdepends = bb.utils.explode_deps(bb.data.getVar('RDEPENDS', localdata, True) or "")
>  
> -
>          # Now do the sanity check!!!
>          for rdepend in rdepends:
>              if "-dbg" in rdepend:
>                  error_msg = "%s rdepends on %s" % (pkgname,rdepend)
>                  sane = package_qa_handle_error(2, error_msg, pkgname, rdepend, d)
> +	    if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev"):
> +	        error_msg = "%s rdepends on %s" % (pkgname, rdepend)
> +                sane = package_qa_handle_error(11, error_msg, pkgname, rdepend, d)
>  
>      return sane
>  
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




