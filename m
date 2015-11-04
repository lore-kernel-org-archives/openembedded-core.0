Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55F0660034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 04:12:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA40Wiq9002977
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Nov 2015 16:32:44 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 3 Nov 2015 16:32:44 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1446595453.git.pkj@axis.com>
	<d2e824d17dae9f9583a11ee2165096e7cff533b0.1446595453.git.pkj@axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5639522B.5050604@windriver.com>
Date: Tue, 3 Nov 2015 18:32:43 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <d2e824d17dae9f9583a11ee2165096e7cff533b0.1446595453.git.pkj@axis.com>
Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group files before parsing
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
X-List-Received-Date: Wed, 04 Nov 2015 04:12:15 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/3/15 6:06 PM, Peter Kjellerstedt wrote:
> Read and merge the passwd/group files before parsing the user and
> group definitions. This means they will only be read once per
> recipe. This solves a problem where if a user was definied in multiple
> files, it could generate group definitions for groups that should not
> be created. E.g., if the first passwd file read defines a user as:
> 
> foobar::1234::::
> 
> and the second passwd file defines it as:
> 
> foobar:::nogroup:The foobar user:/:/bin/sh
> 
> then a foobar group would be created even if the user will use the
> nogroup as its primary group.

One minor thing

> @@ -251,7 +269,7 @@ def update_useradd_static_config(d):
>  
>              newparams.append(newparam)
>  
> -        return " ;".join(newparams).strip()
> +        return ";".join(newparams).strip()
>  
>      # Load and process the users and groups, rewriting the adduser/addgroup params
>      useradd_packages = d.getVar('USERADD_PACKAGES', True)
> 

The space was required because you could generate a user/group add line that
ended with a string.  Without the space, you could end up merging two sets of
arguments causing a failure condition.

So I think that it should be retained unless there is a specific reason you
believe it should be removed.

