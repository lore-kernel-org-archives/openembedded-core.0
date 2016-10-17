Return-Path: <saul.wold@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10E55719A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:25:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 17 Oct 2016 07:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="773595534"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.139.153])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2016 07:25:48 -0700
Message-ID: <1476714346.31798.249.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Date: Mon, 17 Oct 2016 07:25:46 -0700
In-Reply-To: <1476124325-6771-1-git-send-email-sgw@linux.intel.com>
References: <1476124325-6771-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH][master][krogoth] archiver: fix gcc-source handling
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
X-List-Received-Date: Mon, 17 Oct 2016 14:25:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This has been merged to master ping for Krogoth

Sau!

On Mon, 2016-10-10 at 11:32 -0700, Saul Wold wrote:
> The source archiver was not handling the gcc-source target correctly,
> since it uses the
> work-shared directory, we don't want to unpack and patch it twice,
> just as the comments
> say, but the code was not there to check for the gcc-source target.
> 
> [YOCTO #10265]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> 
>  meta/classes/archiver.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass
> b/meta/classes/archiver.bbclass
> index 1d8e863..9239983 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -303,9 +303,10 @@ python do_unpack_and_patch() {
>          return
>      ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
>      ar_workdir = d.getVar('ARCHIVER_WORKDIR', True)
> +    pn = d.getVar('PN', True)
>  
>      # The kernel class functions require it to be on work-shared, so
> we dont change WORKDIR
> -    if not bb.data.inherits_class('kernel-yocto', d):
> +    if not (bb.data.inherits_class('kernel-yocto', d) or
> pn.startswith('gcc-source')):
>          # Change the WORKDIR to make do_unpack do_patch run in
> another dir.
>          d.setVar('WORKDIR', ar_workdir)
>  
> @@ -323,7 +324,7 @@ python do_unpack_and_patch() {
>          oe.path.copytree(src, src_orig)
>  
>      # Make sure gcc and kernel sources are patched only once
> -    if not ((d.getVar('SRC_URI', True) == "" or
> bb.data.inherits_class('kernel-yocto', d))):
> +    if not (d.getVar('SRC_URI', True) == "" or
> (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-
> source'))):
>          bb.build.exec_func('do_patch', d)
>  
>      # Create the patches
> -- 
> 2.7.4
> 

