Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ADF3775C61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 12:28:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 Feb 2016 04:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,435,1449561600"; d="scan'208";a="882814385"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.28.128])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2016 04:28:33 -0800
Message-ID: <1455280112.3546.7.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 12:28:32 +0000
In-Reply-To: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Fri, 12 Feb 2016 12:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-02-12 at 14:15 +0200, Dmitry Rozhkov wrote:
> man 5 os-release states that VERSION_ID is
> 
> "
> a lower-case string (mostly numeric, no spaces or other
> characters outside of 0-9, a-z, ".", "_" and "-")
> identifying the operating system version
> "
> 
> This becomes crucial when ClearLinux's software
> update mechanism is integrated into builds, because
> its client side ignores VERSION_ID's value if it
> doesn't conform the definition.
> 
> Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@intel.com>

I think we probably want this change, but we will also need to change
the default assignment of VERSION_ID to match the rules:

"Variable assignment values must be enclosed in double or single quotes
if they include spaces, semicolons or other special characters outside
of A-Z, a-z, 0-9."

By default VERSION_ID is assigned DISTRO_VERSION, which contains
invalid characters for this field in both OE Core (defaultsetup distro
uses "nodistro.0") and meta-yocto (poky distro uses something like
"2.0+snapshot-${DATE}" during development and something like "1.8.1" on
a release).

Thoughts on changing these?

Regards,

Joshua

> ---
>  meta/recipes-core/os-release/os-release.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/os-release/os-release.bb
> b/meta/recipes-core/os-release/os-release.bb
> index df19ca2..1f0df9e 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -29,7 +29,11 @@ python do_compile () {
>          for field in d.getVar('OS_RELEASE_FIELDS', True).split():
>              value = d.getVar(field, True)
>              if value:
> -                f.write('{0}="{1}"\n'.format(field, value))
> +                if field == "VERSION_ID":
> +                    format_str = '{0}={1}\n'
> +                else:
> +                    format_str = '{0}="{1}"\n'
> +                f.write(format_str.format(field, value))
>      if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
>          rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
>          bb.utils.mkdirhier('${B}/rpm-gpg')
> -- 
> 2.5.0
> 
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki 
> Business Identity Code: 0357606 - 4 
> Domiciled in Helsinki 
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 

