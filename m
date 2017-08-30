Return-Path: <tobias.hagelborn@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 833FE77E5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 09:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 03F872E224
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 11:03:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id waleYD8ko7oE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 11:03:39 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 334AB2E0F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 11:03:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E8E51E078
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 11:03:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 133161E074
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 11:03:39 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 11:03:39 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 06DCD1992
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 11:03:39 +0200 (CEST)
Received: from [10.94.62.1] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 30 Aug 2017 11:03:39 +0200
To: Tobias Hagelborn <tobiasha@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
Message-ID: <2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
Date: Wed, 30 Aug 2017 11:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Wed, 30 Aug 2017 09:03:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/07/2017 07:32 AM, Tobias Hagelborn wrote:
> UPDATE v2:
> - Rebased on latest Poky
> - Fixed issue with bad paths
> - Dirname based on $PN
> 
> In our organization, there is a demand to be able download source code for searching.
> With the use of sstate-cache this has been challenge. Also, the source is not gathered
> but rather spread in a larger directory structure together with build output.
> There are probably others that also want to be able to do the same.
> 
> This addition does:
> * Force download of all source via the srctree_all task
> * Symlink the source together in a separate directory structure for easier search without
>    the risk of matching with build output.
> 
> This is achived with a new class srctree.bbclass that implements the needed tasks and
> a devtool command srctree which offers a convenience command to set up source for
> a recipe and it's dependencies.
> 
> There is also a way of organising the package source code in your own way.
> This is done by implementing a custom dir generation function and assign to SRCTREE_PN_PATH
> in a custom class and set SRCTREE_EXTENSION in a configuration file.
> 
> 
> Tobias Hagelborn (2):
>    srctree.bbclass: Download sourcecode and make it searchable
>    devtool: srctree: New command for setting up browsable source-code
> 
>   meta/classes/srctree.bbclass   | 90 ++++++++++++++++++++++++++++++++++++++++++
>   scripts/lib/devtool/srctree.py | 87 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 177 insertions(+)
>   create mode 100644 meta/classes/srctree.bbclass
>   create mode 100644 scripts/lib/devtool/srctree.py
> 

Hi

I did not receive any feedback on this one.

We do make good use of this feature and we can't be the only ones who 
want to browse the source of the distro at times?

Cheers
Tobias

