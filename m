Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2CC065FC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:50:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s59EoPAP000802
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jun 2014 07:50:25 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 9 Jun 2014 07:50:25 -0700
Message-ID: <5395C9AF.20907@windriver.com>
Date: Mon, 9 Jun 2014 09:50:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>	<A612847CFE53224C91B23E3A5B48BAC7A7A2BE80C7@xmail3.se.axis.com>
	<20140609135202.GA2433@jama>
In-Reply-To: <20140609135202.GA2433@jama>
Subject: Re: Using users/groups from another recipe than the one creating them
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
X-List-Received-Date: Mon, 09 Jun 2014 14:50:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/14, 8:52 AM, Martin Jansa wrote:
> On Mon, Jun 09, 2014 at 03:39:46PM +0200, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>> Peter Kjellerstedt
>>> Sent: den 23 maj 2014 12:38
>>> To: OE Core (openembedded-core@lists.openembedded.org)
>>> Subject: Re: [OE-core] Using users/groups from another recipe than the
>>> one creating them
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>>> Of Peter Kjellerstedt
>>>> Sent: den 19 maj 2014 10:15
>>>> To: OE Core (openembedded-core@lists.openembedded.org)
>>>> Subject: [OE-core] Using users/groups from another recipe than the
>>>> one creating them
>>>>
>>>> Which assumption is correct: "a recipe A that depends on another
>>>> recipe B can use users/groups that B creates" or "all recipes must
>>>> create the users/groups they require themselves"?
>>>>
>>>> The problem for us is that we have a lot of recipes that create
>>>> users and groups, and subsequently a number of other related recipes
>>>> that need to use those users and groups.
>>>>
>>>> If the first assumption is correct then the useradd.bbclass needs to
>>>> be corrected so that it adds a dependency from do_install to
>>>> base-passwd:do_populate_sysroot and
>>>> base-passwd:do_populate_sysroot_setscene, because if either of those
>>>> tasks execute they will overwrite /etc/passwd and /etc/group,
>>>> effectively removing any users/groups that were created earlier...
>>>>
>>>> On the other hand, if it is the second assumption that is correct,
>>>> then there should be QA tests in place to make sure all recipes
>>>> create the users/groups they use.
>>>>
>>>> //Peter
>>>
>>> *ping*
>>>
>>> Doesn't anyone know how users and groups are supposed to work?
>>>
>>> //Peter
>>
>> *ping again*
>>
>> Well, this is somewhat discouraging. Three weeks and not a single
>> response. Are we really the only ones that care about users and
>> groups and how they are created? Doesn't anyone know which of my
>> two assumptions above are correct?
>>
>> Personally I would prefer that all recipes create the users and
>> groups they require themselves as this keeps them more self
>> contained. I have no idea how to write a QA test to verify this,
>> but I assume it should be possible...
>
> My experience from Dylan release is that only users/groups created in
> base-passwd work reliably, with useradd.bbclass we were seeing random
> files getting random user/group owners (comparing buildhistory report
> files-in-image.txt from multiple builds which weren't using sstate).
>

Which package management type?

The only issue I'm aware of is when the requires aren't in the correct order, a 
package can fall back and try to use the host-system's passwd/group entries 
instead of the sysroot version.  This can lead to cases that during the 
installation process the dynamic users/groups have not been generated due to 
missing dependencies.

For the RPM type, you get a message that says "user foo can not be found, using 
root".  I'm not sure what deb/ipk do in these cases.  (RPM always handles users 
and groups by name, never by gid/uid number.)

The whole users and groups system has been working very well in my systems based 
on 'dora'.  I haven't experienced issues with dylan, but I also haven't used it 
as extensively.

--Mark

