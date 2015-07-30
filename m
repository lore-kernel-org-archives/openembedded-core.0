Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 480377649A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:08:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6UA8dj5000593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 03:08:39 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 03:08:20 -0700
Message-ID: <55B9F7A5.3040100@windriver.com>
Date: Thu, 30 Jul 2015 18:08:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Olof Johansson <olof.johansson@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <1438249425-5423-1-git-send-email-olofjn@axis.com>
In-Reply-To: <1438249425-5423-1-git-send-email-olofjn@axis.com>
Subject: Re: [PATCH] base.bbclass: Don't warn about "invalid" PACKAGECONFIGs by default
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
X-List-Received-Date: Thu, 30 Jul 2015 10:08:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I have a new patch for this, it will be moved into insane.bbclass,
and the recipe can set INSANE_SKIP:
+
+    # Check invalid PACKAGECONFIG
+    pkgconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
+    if pkgconfig:
+        pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
+        for pconfig in pkgconfig:
+            if pconfig not in pkgconfigflags:
+                pn = d.getVar('PN', True)
+                error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
+                package_qa_handle_error("invalid-pkgconfig", error_msg, d)

I'm testing it, and will send it out sooner.

// Robert

On 07/30/2015 05:43 PM, Olof Johansson wrote:
> The recently added warnings for recipes that try to use undefined
> packageconfigs isn't compatible with the PACKAGECONFIG approach of
> exporting a common set of configs and letting the recipe look only at
> the configs they care about.
>
> This change introduces a STRICT_PACKAGECONFIG variable that one can
> enable to get the warnings.
>
> Signed-off-by: Olof Johansson <olofjn@axis.com>
> ---
>   meta/classes/base.bbclass | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e0f1053..6f652d8 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -340,9 +340,12 @@ python () {
>           pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
>           pn = d.getVar("PN", True)
>
> -        for pconfig in pkgconfig:
> -            if pconfig not in pkgconfigflags:
> -                bb.warn("%s: invalid PACKAGECONFIG: %s" % (pn, pconfig))
> +        # If STRICT_PACKAGECONFIG is set, warn about recipes that sets undefined
> +        # PACKAGECONFIGs.
> +        if bb.utils.to_boolean(d.getVar("STRICT_PACKAGECONFIG", True)):
> +            for pconfig in pkgconfig:
> +                if pconfig not in pkgconfigflags:
> +                    bb.warn("%s: invalid PACKAGECONFIG: %s" % (pn, pconfig))
>
>           mlprefix = d.getVar("MLPREFIX", True)
>
>

