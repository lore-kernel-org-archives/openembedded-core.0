Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 35CF0610F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 18:07:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1I7SMR011767; Fri, 1 Nov 2013 18:07:29 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x3bBpfiQQjnE; Fri,  1 Nov 2013 18:07:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1I7M4w011749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 18:07:23 GMT
Message-ID: <1383329237.6271.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Date: Fri, 01 Nov 2013 18:07:17 +0000
In-Reply-To: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Fri, 01 Nov 2013 18:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-01 at 19:03 +0100, Corneliu Stoicescu wrote:
> - added buildstats inheritance inside buildhistory
> - reworked the buildstats directory structure not to contain the build name(read: the build start date).
> Now it only contains the target name and machine. This is usefull in order to reduce git noise.
> - because builds are no longer separated by build name(read: date) it is necessary to remake(remove and create from scratch)
> the buildstats folder for each build in order keep buildstats compatible with tools like pybootchartgui.py
> 
> Some changes to make the new functionality compatible with Yocto:
> - remove buildstats from default usage because it now needs buildhistory (remove it from USER_CLASSES in local.conf)
> - add 'buildhistory' to USER_CLASSES or add INHERIT += "buildhistory" in local.conf
> OPTIONAL: - I tested this patch with buildhistory under git enabled (BUILDHISTORY_COMMIT = "1" in local.conf). I believe this
> should be made default.
> 
> I made some tests with the buildhistory-diff tool and it is compatible with the changes. We can add further functionality
> to it in order to make it interpret buildstats data.
> 
> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---
>  meta/classes/buildhistory.bbclass |    1 +
>  meta/classes/buildstats.bbclass   |    8 ++++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 3da03c8..a78bd4b 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -19,6 +19,7 @@ BUILDHISTORY_PUSH_REPO ?= ""
>  
>  # Must inherit package first before changing PACKAGEFUNCS
>  inherit package
> +inherit buildstats
>  PACKAGEFUNCS += "buildhistory_emit_pkghistory"

We could do a 

BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"

in buildhistory.bbclass

>  # We don't want to force a rerun of do_package for everything
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index 72fff11..476ae94 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -1,4 +1,4 @@
> -BUILDSTATS_BASE = "${TMPDIR}/buildstats/"

and here do BUILDSTATS_BASE ??= "${TMPDIR}/buildstats/"

> +BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"
>  BNFILE = "${BUILDSTATS_BASE}/.buildname"
>  DEVFILE = "${BUILDSTATS_BASE}/.device"

so when buildhistory is used, buildstats automatically becomes part of
it?

> @@ -33,7 +33,7 @@ def set_bn(e):
>  
>  def get_bn(e):
>      with open(e.data.getVar('BNFILE', True)) as f:
> -        bn = f.readline()
> +        bn = str(f.readline()).split("/")[0]
>      return bn
>  
>  def set_device(e):
> @@ -175,6 +175,10 @@ python run_buildstats () {
>          # set the buildname
>          ########################################################################
>          try:
> +            bb.utils.remove(e.data.getVar('BUILDSTATS_BASE', True), recurse=True)


Do we need to remove this?

I'll let Paul comment on other elements of this.

Cheers,

Richard

> +        except:
> +            pass
> +        try:
>              bb.utils.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
>          except:
>              pass



