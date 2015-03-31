Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A013E73C27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:51:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2VKppdX006681
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 31 Mar 2015 13:51:51 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Tue, 31 Mar 2015 13:51:50 -0700
Message-ID: <551B08E6.8040906@windriver.com>
Date: Tue, 31 Mar 2015 15:51:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Mario Domenech Goulart <mario@ossystems.com.br>
References: <87d23uibxw.fsf@email.parenteses.org>	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>	<87wq1xgk2j.fsf@email.parenteses.org>
	<551AE604.6090804@windriver.com>
	<87oan8hpp6.fsf@email.parenteses.org>
In-Reply-To: <87oan8hpp6.fsf@email.parenteses.org>
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
X-List-Received-Date: Tue, 31 Mar 2015 20:51:50 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 3/31/15 3:33 PM, Mario Domenech Goulart wrote:
> Hi Mark,
> 
> On Tue, 31 Mar 2015 13:23:00 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
> 
>> On 3/31/15 12:20 PM, Mario Domenech Goulart wrote:
>>>
>>> On Tue, 31 Mar 2015 14:50:06 +0100 "Burton, Ross" <ross.burton@intel.com> wrote:
>>>
>>>> On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br> wrote:
>>>>
>>>>     Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
>>>>     the recipe, ./usr/lib/foo/ in the package is owned by root.
>>>>     However, its content has the right ownership.
>>>>
>>>> Looks like a bug in pseudo to me, can you file a bug for that?
>>>
>>> Sure.  Filed #7554.
>>
>> I'd suggest you look at meta/classes/package.bbclass "fixup_perms" function.
>>
>> The ${D}${libdir} (and above) are "corrected" to be 'root:root' by this
>> function.  I don't know why 'foo' would be, but if it's a standard defined
>> variable -- or if 'directory walking' is enabled it could end up doing this as well.
>>
>> The control file for this is in meta/files/fs-perms.txt (unless otherwise
>> defined by a distribution or other configuration file.)
> 
> Thanks a lot.  You seem to have guided me exactly to what causes the
> issue.
> 
>>
>> Format of the file is:
>>
>> # The format of this file
>> #
>> #<path> <mode>  <uid>   <gid>   <walk>  <fmode> <fuid>  <fgid>
> ...
>>
>> The default is:
> ...
>> libexecdir	0755 root root false - - -
> ...
> 
> This variable seems to be the cause of problems:
> 
> $ bitbake -e foo | grep libexecdir=
> export libexecdir="/usr/lib/foo"
> 
> As far as I understand, package.bbclass may use a user-configured
> permissions table (via FILESYSTEM_PERMS_TABLES), but I'm not sure if
> this is the right "fix" for the case in question.  I'd have to hardcode
> the owner of /usr/lib/foo to be "foo", but foo may not be available when
> packaging other recipes.

Ok, good this answers the question as to "why" it's happening.  You can easily
fix this by adding a configuration specific fs-perms.txt file (can name it
anything) that overrides that setting and add it to the FILESYSTEM_PERMS_TABLES.
 You can do this globally in a layer, a distribution or even just a recipe.

In your recipe you can likely do something like:

FILESYSTEM_PERMS_TABLES ?= "files/fs-perms.txt"
FILESYSTEM_PERMS_TABLES += "${THISDIR}/files/recipe-perms.txt"

(Do the ?= first in case it's already set by someone else, then add your recipe
specific perms later)

Contents of the "${THISDIR}/files/recipe-perms.txt":

${libexecdir} 0755 myuid mygid true - myuid mygid

Then you can even skip the chown -R, as the system will do it for you.

> Should libexecdir actually be in the `target_path_vars' variable
> (package.bbclass)?

That is a good question, and something likely worthy of investigating.  Perhaps
removing it from the default set is the correct general purpose change.

I wouldn't do it on an existing release, but its worth considering at the
beginning of a new release.

--Mark

> Best wishes.
> Mario
> 


