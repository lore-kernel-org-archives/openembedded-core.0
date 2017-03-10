Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C72A60102
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 17:12:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2AHCTd8012507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 10 Mar 2017 09:12:30 -0800
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 09:12:29 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<9a0e2c2a8322a7c27a4e99c992f8a841ff31822f.1489144807.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e3436170-fcb9-4d1e-4082-52e1d0cc6360@windriver.com>
Date: Fri, 10 Mar 2017 11:12:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9a0e2c2a8322a7c27a4e99c992f8a841ff31822f.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 39/44] package.bbclass: don't exclude package groups from runtime mapping
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
X-List-Received-Date: Fri, 10 Mar 2017 17:12:30 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/10/17 5:24 AM, Alexander Kanavin wrote:
> This ensures that remapping happens correctly, particularly
> when package groups list noarch packages, and multilib is in use. Previously
> this was masked by rpm doing *another* layer of remapping on top of this.

This change is definitely NOT rpm specific.

I'm not sure I understand either why this line was there or why it was removed.

Looking at the history, there was a lot of work being done in this section about
generic package work at the time.

See oe commits:
9c826962ec8fa45c2b035427442b90a41517144e
to
a0cd18ff5405b63b8296b8ef1fc2a488b906f576

--Mark

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package.bbclass | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index f4c2b5514c5..48fef97251b 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -479,9 +479,6 @@ def get_package_additional_metadata (pkg_type, d):
>  def runtime_mapping_rename (varname, pkg, d):
>      #bb.note("%s before: %s" % (varname, d.getVar(varname)))
>  
> -    if bb.data.inherits_class('packagegroup', d):
> -        return
> -
>      new_depends = {}
>      deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
>      for depend in deps:
> 


