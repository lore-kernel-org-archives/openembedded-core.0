Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B50D76FC4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 00:33:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA40XYoY003041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Nov 2015 16:33:34 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 3 Nov 2015 16:33:34 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1446595453.git.pkj@axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5639525D.6010609@windriver.com>
Date: Tue, 3 Nov 2015 18:33:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1446595453.git.pkj@axis.com>
Subject: Re: [PATCH 0/5] Improvements for useradd-staticids.bbclass
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
X-List-Received-Date: Wed, 04 Nov 2015 00:33:39 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

I looked over this series (I have not tried it, but) everything looks ok to me.
 I did make one comment on a minor hunk -- but otherwise I don't see any issues.

The python style police might have some further comments.

Acked-by: Mark Hatle <mark.hatle@windriver.com>


On 11/3/15 6:06 PM, Peter Kjellerstedt wrote:
> This series of patches aims to improve useradd-staticids.bbclass.
> 
> We are currently using useradd-staticids.bbclass to make sure all
> users and groups have well defined IDs. So far we have had the
> definitions of the users both in the recipes and in the passwd file
> used by useradd-staticids.bbclass. Since we have a huge number of
> recipes that create users, having to duplicate the definitions all
> over the place has turned out to be a burden we should be able to
> avoid.
> 
> So the current plan for us is to have one passwd file per layer with
> the definitions of all users that layer needs. These definitions do
> not include the static IDs for the users. Instead the static IDs for
> the users are specified in a distro specific passwd-static file. There
> is also a distro specific group-static file for the group IDs. With
> that in place it should be enough to define a user as:
> 
> USERADD_PARAM_${PN} = "--system foobar"
> 
> in a recipe and let useradd-staticids.bbclass handle the specifics for
> how that user should be defined.
> 
> The above worked fine for all users that had a primary group with the
> same name as the user. However, it turned out that for users that
> wanted some other primary group, specifying it in the passwd file was
> not enough. We still had to add --gid <some group> in the recipe where
> <some group> had to match what was specified in the passwd file. This
> was less than optimal, and somewhat defeated the setup.
> 
> It also turned out that for users with a primary group that does not
> match the user name, useradd-staticids.bbclass would still add the
> creation of a group with the same name as the user (when it parsed the
> passwd-static file) and the add another creation of the correct group
> (when it parsed the passwd file).
> 
> So after spending quite a lot of time on trying to decode how
> rewrite_useradd() calculated the --gid option, I came up with this
> series of changes that should correct the problems described above and
> make the code easier to understand while (hopefully) maintaining
> compatibility with the old code.
> 
> I fully understand that this is very late for Jethro and do not really
> expect it to make it into 2.0.0, but if at all possible I hope it can
> make it since that would make my life much easier. :)
> 
> //Peter
> 
> The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:
> 
>   build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib pkj/useradd_improvements
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/useradd_improvements
> 
> Peter Kjellerstedt (5):
>   useradd-staticids.bbclass: Treat mutually exclusive options as such
>   useradd-staticids.bbclass: Make --no-user-group have effect
>   useradd-staticids.bbclass: Simplify some logic
>   useradd-staticids.bbclass: Simplify the logic for when to add groups
>   useradd-staticids.bbclass: Read passwd/group files before parsing
> 
>  meta/classes/useradd-staticids.bbclass | 192 ++++++++++++++++++---------------
>  1 file changed, 103 insertions(+), 89 deletions(-)
> 


