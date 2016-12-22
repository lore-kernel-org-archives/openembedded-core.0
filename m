Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5D867776B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 17:20:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 22 Dec 2016 09:20:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,389,1477983600"; d="scan'208";a="801356308"
Received: from stseng1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.43])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2016 09:20:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Date: Fri, 23 Dec 2016 06:20:41 +1300
Message-ID: <2932563.snhXiro51n@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1482413283-25405-1-git-send-email-ola.x.nilsson@axis.com>
References: <1482413283-25405-1-git-send-email-ola.x.nilsson@axis.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] externalsrc.bbclass: Add task buildclean
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
X-List-Received-Date: Thu, 22 Dec 2016 17:20:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ola,

I like this, thanks. Just one thing commented below.

On Thu, 22 Dec 2016 14:28:03 Ola x Nilsson wrote:
> The buildclean task should call the package build system clean
> command, just implemented for Make for now.
> 
> This is meant for recipes where S == B, but can be useful as a
> standalone task for other recipes too.
> 
> Setting it to run before do_clean will do what most developers expect
> when calling bitbake -c clean.
> 
> Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
> ---
>  meta/classes/externalsrc.bbclass | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass index e115a47..bc82f1f 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -4,7 +4,7 @@
>  # Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  #
> -# externalsrc.bbclass enables use of an existing source tree, usually
> external to 
> +# externalsrc.bbclass enables use of an existing source tree,
> usually external to 
> # the build system to build a piece of software rather
> than the usual fetch/unpack/patch # process.
>  #
> @@ -108,6 +108,8 @@ python () {
>          # We don't want the workdir to go away
>          d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
> 
> +        bb.build.addtask('do_makeclean', 'do_clean', None, d)
> +

Shouldn't this be do_buildclean here?

>          # If B=S the same builddir is used even for different
> architectures. # Thus, use a shared CONFIGURESTAMPFILE and STAMP directory
> so that # change of do_configure task hash is correctly detected and stamps
> are @@ -142,6 +144,17 @@ python externalsrc_compile_prefunc() {
>      bb.plain('NOTE: %s: compiling from external source tree %s' %
> (d.getVar('PN'), d.getVar('EXTERNALSRC'))) }
> 
> +do_buildclean[dirs] = "${S} ${B}"
> +do_buildclean[nostamp] = "1"
> +do_buildclean[doc] = "Call 'make clean' or equivalent in ${B}"
> +externalsrc_do_buildclean() {
> +	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
> +		oe_runmake clean || die "make failed"
> +	else
> +		bbnote "nothing to compile - no makefile found"
> +	fi
> +}
> +
>  def srctree_hash_files(d):
>      import shutil
>      import subprocess
> @@ -188,3 +201,5 @@ def srctree_configure_hash_files(d):
>                  if f in search_files:
>                      out_items.append('%s:True' % os.path.join(root, f))
>      return ' '.join(out_items)
> +
> +EXPORT_FUNCTIONS do_buildclean

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

