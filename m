Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4AE965C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:48:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 08 Sep 2015 03:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="640597035"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by orsmga003.jf.intel.com with ESMTP; 08 Sep 2015 03:48:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 08 Sep 2015 11:48:02 +0100
Message-ID: <2450586.XQWa6WlBOl@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1441708600-31394-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1441708600-31394-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] externalsrc.bbclass: better filtering of cleandirs
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
X-List-Received-Date: Tue, 08 Sep 2015 10:48:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 08 September 2015 13:36:40 Markus Lehtonen wrote:
> We really do not want our (external) source tree to be removed. There
> might be multiple values in the 'cleandirs' varflag pointing to our
> source tree - causing it to be wiped out. This patch improves the
> filtering of 'cleandirs' by examining the expanded values inside it. Any
> (expanded) values pointing to our source tree get removed.
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/classes/externalsrc.bbclass | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass index 8f7f479..499688b 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -58,18 +58,14 @@ python () {
>                  d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
> 
>              # We do not want our source to be wiped out, ever
> (kernel.bbclass does this for do_clean) -            cleandirs =
> d.getVarFlag(task, 'cleandirs', False)
> -            if cleandirs:
> -                cleandirs = cleandirs.split()
> -                setvalue = False
> -                if '${S}' in cleandirs:
> -                    cleandirs.remove('${S}')
> +            cleandirs = (d.getVarFlag(task, 'cleandirs', False) or
> '').split() +            setvalue = False
> +            for cleandir in cleandirs[:]:
> +                if d.expand(cleandir) == externalsrc:
> +                    cleandirs.remove(cleandir)
>                      setvalue = True
> -                if externalsrcbuild == externalsrc and '${B}' in cleandirs:
> -                    cleandirs.remove('${B}')
> -                    setvalue = True
> -                if setvalue:
> -                    d.setVarFlag(task, 'cleandirs', ' '.join(cleandirs))
> +            if setvalue:
> +                d.setVarFlag(task, 'cleandirs', ' '.join(cleandirs))
> 
>          fetch_tasks = ['do_fetch', 'do_unpack']
>          # If we deltask do_patch, there's no dependency to ensure do_unpack
> gets run, so add one

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

