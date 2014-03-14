Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id D33CD6F769
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:45:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1WOTM8-00041t-1l for openembedded-core@lists.openembedded.org;
	Fri, 14 Mar 2014 15:45:04 +0100
Received: from p4fd628fa.dip0.t-ipconnect.de ([79.214.40.250])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 15:45:04 +0100
Received: from dzu by p4fd628fa.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 15:45:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Detlev Zundel <dzu@denx.de>
Date: Fri, 14 Mar 2014 12:50:44 +0100
Organization: Church of Emacs - Missionary division
Message-ID: <m2ob19robv.fsf@lamuella.denx.de>
References: <090257310d9e463d93ee5cd5fd4d27fe@DM2PR03MB399.namprd03.prod.outlook.com>
	<1387795367.11527.1.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p4fd628fa.dip0.t-ipconnect.de
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3.50 (gnu/linux)
Cancel-Lock: sha1:TbL+m0v0R/JHgOJi63i5xn/swPU=
Subject: Re: Why to make branch info is mandatory for non-master commit with latest bitbake
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
X-List-Received-Date: Fri, 14 Mar 2014 14:45:11 -0000
Content-Type: text/plain

Hi Richard,

sorry to jump in so late, but I just realized that this "small" change
has some impact also on our ELDK recipies, so I would really like to
understand where the change comes from and why we couple a persistent
specification (commit ID) with a transient specification (branch name).
With all my previous git experience, this looks at least somewhat
strange.

> On Mon, 2013-12-23 at 06:41 +0000,
> zhenhua.luo@freescale.com wrote:
>> Previously the branch name doesn't need to be defined when a
>> non-master branch commit is referred in recipe, this has been changed
>> in latest bitbake. 
>> 
>> Is this an intentional change? May I know the reason of the change
>> if it is intentional?
>
> It was intentional and was triggered by this change:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f19546e02d3318ee69fd0c34e21aa97b74c987ec
>
> which is a sanity test added to fix certain failure cases where a given
> revision wasn't on a specified branch.
>
> The bug was nasty since the fetcher was hitting the network in cases it
> shouldn't have been when a branch wasn't specified.

I looked at the provided link but I'm not certain that I understand the
problem nor the fix for it.

As far as I can make out, the "failure mode" was likely a specified
commit ID that was not available in the local downloads.  As a
consequence, the fetcher then hit the network and tried to find this
(locally not existing) version in the upstream repository.  So very
likely, the "failure" was that a network access happened at all,
correct?  So the "failure" is much more a "we don't want network access
at all under certain circumstances".

If this is correct, then I see how the fix prevents this by effectively
limiting the selectable commit IDs to the _existing_ commits in one
branch.  But doesn't that prevent me from specifying a commit-id in
an upstream branch "later" then what I have available locally in that
old branch state?

I.e. should we rather find a way to say "no downloads are allowed at
all" rather than adding this workaround?

Of course we can fix all our recipies, but I'd really like to understand
why we are doing this.

Thanks!
  Detlev

--
DENX Software Engineering GmbH,      MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-40 Fax: (+49)-8142-66989-80 Email: dzu@denx.de


