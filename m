Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlQaB-0006eT-Ns
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 21:12:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6PJ8cFJ026629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:08:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 25 Jul 2011 12:08:38 -0700
Message-ID: <4E2DBF35.2020707@windriver.com>
Date: Mon, 25 Jul 2011 14:08:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<586cbf5404ff76795c3d967266e7338b01e47c8b.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602747.30326.224.camel@phil-desktop>
In-Reply-To: <1311602747.30326.224.camel@phil-desktop>
Subject: Re: [PATCH 5/5] package.bbclass: fixup_perms - symlink bug fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 19:12:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/25/11 9:05 AM, Phil Blundell wrote:
> On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
>> From: Mark Hatle <mark.hatle@windriver.com>
>>
>> We don't want to change the owner/mode of symlinks, as this may
>> affect the target of the link.  Also broken links will fail as well.
> 
> This seems like it will cause links themselves to end up getting shipped
> under the UID/GID that was used for building, which was the whole thing
> that fixup_perms was trying to avoid in the first place.  Surely you do
> want to fix their ownership, it's just the mode that you oughtn't to be
> trying to change.

symlinks do not have an ownership/group on most filesystems.  They automatically
inherit the uid/gid of the target.  (I also believe this is the same for
permissions.)

How do you change the mode of the link itself?  As far as I understood this
can't be done on most filesystems.  I'd be happy to attempt to change the
owner/group (and mode) of symlinks if there is a way not to follow the link.

> Also, unrelated to the technical details, the subject line of this patch
> is not especially illuminating.  It would be better to say something
> like "package.bbclass: don't change mode/owner of symlinks" rather than
> like "symlink bug fix".

This was discovered when I had a package that contained broken symlinks.  The
fixup_perms broke on me.  Thus the short description... [it can certainly be
changed]

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



