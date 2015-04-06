Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9FE72A49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 14:53:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t36ErAXw014072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Apr 2015 07:53:10 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Apr 2015 07:53:10 -0700
Message-ID: <55229DD5.4050002@windriver.com>
Date: Mon, 6 Apr 2015 09:53:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Mario Domenech Goulart <mario@ossystems.com.br>
References: <87d23uibxw.fsf@email.parenteses.org>	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>	<87wq1xgk2j.fsf@email.parenteses.org>
	<551AE604.6090804@windriver.com>	<87oan8hpp6.fsf@email.parenteses.org>
	<551B08E6.8040906@windriver.com>	<87k2xwhoei.fsf@email.parenteses.org>
	<551B0D16.8000608@windriver.com>	<87d23ohngp.fsf@email.parenteses.org>
	<551B15F8.5090300@windriver.com>
	<87wq1pe7kc.fsf@email.parenteses.org>
In-Reply-To: <87wq1pe7kc.fsf@email.parenteses.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Mon, 06 Apr 2015 14:53:10 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/6/15 7:59 AM, Mario Domenech Goulart wrote:
> Hi Mark and all,

...

> Thanks for all the hints and for your patience.
> 
> It looks like I was caught by a messed up TMPDIR.  After I removed
> TMPDIR and baked the foo recipe, everything works.  I could make it work
> by adding
> 
>   FILESYSTEM_PERMS_TABLES = "files/fs-perms.txt ${THISDIR}/${PN}/fs-perms-foo.txt"
> 
> to the foo.bb recipe.  In this case files/fs-perms.txt is the global
> default one and ${THISDIR}/${PN}/fs-perms-foo.txt is the foo-specific
> one that has one line only, which sets the permissions for
> ${libexecdir}.
> 
> I had to explicitly prepend files/fs-perms.txt because packages.bbclass
> would not pick files/fs-perms.txt if FILESYSTEM_PERMS_TABLES is set.

I've often thought that we probably should make FILESYSTEM_PERMS_TABLES into a
globally defined configuration (bitbake.conf) and remove the default from the
package.bbclass.  The design here was old, and based on even older code that was
specific to device node generation.

A patch to do this would likely be accepted.  (I'd make it so that an empty
value would simply run through just the default internal values.)

--Mark

> Best wishes.
> Mario
> 


