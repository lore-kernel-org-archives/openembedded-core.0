Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5261A79640
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 12:03:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8IC3pni003308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 18 Sep 2018 13:03:56 +0100
Message-ID: <9c4d3cc718703e04e6b9890862c288f046915c61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 05:03:51 -0700
In-Reply-To: <20180917134158.4614-1-andrej.valek@siemens.com>
References: <20180917134158.4614-1-andrej.valek@siemens.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] staging: remove hard-coded values from _FIXMEs
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
X-List-Received-Date: Tue, 18 Sep 2018 12:03:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-17 at 15:41 +0200, Andrej Valek wrote:
> Let users to override these values in their layers and could match
> them
> with values in EXTRA_STAGING_FIXMES.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/classes/staging.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/staging.bbclass
> b/meta/classes/staging.bbclass
> index 84e13bab59..6db501dac1 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -127,6 +127,8 @@ python do_populate_sysroot_setscene () {
>  }
>  addtask do_populate_sysroot_setscene
>  
> +SYSROOT_STAGING_FIXMES ?= "COMPONENTS_DIR HOSTTOOLS_DIR PKGDATA_DIR
> PSEUDO_LOCALSTATEDIR LOGFIFO"
> +
>  def staging_copyfile(c, target, dest, postinsts, seendirs):
>      import errno
>  
> @@ -167,7 +169,7 @@ def staging_processfixme(fixme, target,
> recipesysroot, recipesysrootnative, d):
>      if not fixme:
>          return
>      cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e
> 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" %
> (target, " ".join(fixme), recipesysroot, recipesysrootnative)
> -    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR',
> 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
> +    for fixmevar in d.getVar("SYSROOT_STAGING_FIXMES").split():
>          fixme_path = d.getVar(fixmevar)
>          cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
>      bb.debug(2, cmd)

I think this was deliberately left this way rather than letting users
override it as the scope issues around this are not obvious and making
it a variable gives users expectations which may not be met.

I'm going from memory with jetlag but I think that this variable would
not work from recipe context, you'd have to do it in global scope and
changing this in global scope for everything is a pretty serious
change.

The reason is that it can get called when building any recipe sysroot
so the datastore isn't to context of the original creator.

Cheers,

Richard

