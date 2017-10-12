Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 02C0578038
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 09:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id BEEF92602BD
Message-ID: <1507800368.9509.37.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 11:26:08 +0200
In-Reply-To: <1507795747-8668-1-git-send-email-maxin.john@intel.com>
References: <1507795747-8668-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] sstate.bbclass: provide an exception for useradd scenario
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
X-List-Received-Date: Thu, 12 Oct 2017 09:26:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I test this patch fix and it fix user issue on my project.

On Thu, 2017-10-12 at 11:09 +0300, Maxin B. John wrote:
> Packages, which depend on users/groups created from other packages,
> needs "shadow-native" as a build time dependency. So, add an exception
> to the "shadow-native" from otherwise discarded native/cross tools
> dependency.
> 
> Fixes [YOCTO #11960]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>

Tested-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>

> ---
>  meta/classes/sstate.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 2a54993..e30fbe1 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -967,7 +967,8 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
>              if isNativeCross(taskdependees[dep][0]):
>                  return False
>              # Native/cross tools depended upon by target sysroot are not needed
> -            if isNativeCross(taskdependees[task][0]):
> +            # Add an exception for shadow-native as required by useradd.bbclass
> +            if isNativeCross(taskdependees[task][0]) and taskdependees[task][0] != 'shadow-
> native':
>                  continue
>              # Target populate_sysroot need their dependencies
>              return False
> -- 
> 2.4.0
> 

