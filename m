Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D01047025A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:33:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s679XqBm021692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 02:33:53 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 02:33:52 -0700
Message-ID: <53BA697F.8060604@windriver.com>
Date: Mon, 7 Jul 2014 17:33:51 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1403922753-33481-1-git-send-email-liezhi.yang@windriver.com>
In-Reply-To: <1403922753-33481-1-git-send-email-liezhi.yang@windriver.com>
Subject: Re: [RFC PATCH V2] base.bbclass: show git summary in BUILDCFG_HEADER
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
X-List-Received-Date: Mon, 07 Jul 2014 09:33:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/28/2014 10:32 AM, Robert Yang wrote:
> It was:
> meta
> meta-yocto
> meta-yocto-bsp    = "master:3a054dc27067efaae9150b465298d9c45d728f85"
>
> Now:
> meta
> meta-yocto
> meta-yocto-bsp    = "master:3a054dc base.bbclass: show git summary in BUILDCFG_HEADER"

Any objections on this patch, please ? Or I will send a regular patch.

// Robert

>
> The benefit is that we can easily know the top commit info rather than
> query it again in the git repo.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/base.bbclass         |    2 +-
>   meta/classes/metadata_scm.bbclass |    6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index c0d2c8ec8..f5abb88 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -244,7 +244,7 @@ def get_layers_branch_rev(d):
>       layers = (d.getVar("BBLAYERS", True) or "").split()
>       layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
>           base_get_metadata_git_branch(i, None).strip(), \
> -        base_get_metadata_git_revision(i, None)) \
> +        base_get_metadata_git_revision_and_summary(i, None)) \
>               for i in layers]
>       i = len(layers_branch_rev)-1
>       p1 = layers_branch_rev[i].find("=")
> diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
> index ba0edf9..dace653 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -80,3 +80,9 @@ def base_get_metadata_git_revision(path, d):
>               return rev
>       return "<unknown>"
>
> +def base_get_metadata_git_revision_and_summary(path, d):
> +    f = os.popen("cd %s; git log -n 1 --abbrev-commit --pretty=oneline -- 2>&1" % path)
> +    data = f.readline()
> +    if f.close() is None:
> +            return data.rstrip()
> +    return "<unknown>"
>

