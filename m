Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2DA6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 08:33:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0L8XGe5020132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jan 2016 00:33:17 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 00:33:16 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1453134365-26107-1-git-send-email-ross.burton@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56A097CA.1070703@windriver.com>
Date: Thu, 21 Jan 2016 16:33:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453134365-26107-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] sstate: replace verbose manifest removal with a single count
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
X-List-Received-Date: Thu, 21 Jan 2016 08:33:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/19/2016 12:26 AM, Ross Burton wrote:
> If there are lots of changes between the previous build and the build about to
> start bitbake will potentially print pages of:
>
>    DEBUG: Stamp $BUILD/stamps/corei7-64-poky-linux/libdrm/2.4.66-r0 is not reachable, removing related manifests
>
> Instead of spamming the console with this list, write the list of manifests only
> to the debug log and simply write a count to the console.  This way the user
> doesn't get spammed but still knows what is happening if bitbake appears to
> stall with heavy I/O.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/sstate.bbclass | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 9bef212..918768f 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -952,8 +952,12 @@ python sstate_eventhandler2() {
>                   if stamp not in stamps:
>                       toremove.append(l)
>                       if stamp not in seen:
> -                        bb.note("Stamp %s is not reachable, removing related manifests" % stamp)
> +                        bb.debug(2, "Stamp %s is not reachable, removing related manifests" % stamp)
>                           seen.append(stamp)
> +
> +        if toremove:
> +            bb.note("There are %d recipes to be removed from the sysroot, removing..." % (len(toremove)))
> +

Currently, I get:

NOTE: There are 10 recipes to be removed from the sysroot, removing...
NOTE: There are 15 recipes to be removed from the sysroot, removing...
NOTE: There are 30 recipes to be removed from the sysroot, removing...

Can we print more info such as where it is removing, please ? Or
use SSTATE_ARCHS ? For example,:

NOTE: There are 30 recipes to be removed from manifest x86_64, removing...

// Robert

>           for r in toremove:
>               (stamp, manifest, workdir) = r.split()
>               for m in glob.glob(manifest + ".*"):
>

