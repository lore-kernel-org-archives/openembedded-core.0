Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53DB360E49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 22:13:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7TMD2d8007807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 15:13:03 -0700 (PDT)
Received: from msp-dhcp13.wrs.com (172.25.34.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 15:13:02 -0700
Message-ID: <5400FAED.8030903@windriver.com>
Date: Fri, 29 Aug 2014 17:13:01 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1409333952.29296.195.camel@ted>	 <5400C83C.3020306@windriver.com>
	<1409349774.29296.208.camel@ted>
In-Reply-To: <1409349774.29296.208.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm: Add optional improved directory handling
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
X-List-Received-Date: Fri, 29 Aug 2014 22:13:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/14, 5:02 PM, Richard Purdie wrote:
> On Fri, 2014-08-29 at 13:36 -0500, Mark Hatle wrote:
>> On 8/29/14, 12:39 PM, Richard Purdie wrote:
>>> From: Ronan Le Martret <ronan@fridu.net>
>>>
>>> During spec generation, ideally directories should not be auto
>>> packaged under the %file section of rpm packages but take ownership of
>>> specific directories.
>>>
>>> * packages only empty directories or explict directory.
>>>      See:
>>>          - http://www.rpm.org/max-rpm/s1-rpm-inside-files-list-directives.html
>>>          - "The %dir Directive"
>>>
>>> * This will prevent the overlapping of security permission.
>>>      For example, in Tizen the directory /etc have smack label 'System::Shared'
>>>      So Only one package should own and set the label of /etc to prevent
>>>      the overwriting of the smack label.
>>>
>>> Existing behaviour is maintained if DIRFILES is not set. If it is set,
>>> the modified behaviour is used.
>>>
>>> [RP: Modified to allow optional usage of DIRFILES]
>>
>> I'm not sure I understand what is trying to be accomplished here.
>>
>> Within RPM (4 and 5) it's completely legal for two packages to contain the same
>> directory and permissions entries.  This is preferable for our environment as it
>> allows the necessary directories to be generated as packages are installed that
>> use these directories.  (Otherwise we have to have "directory" packages that
>> install common directories -- or base packages that own directories for a group
>> of packages.)
>>
>> I think it's a bug in the SMACK labeling that it doesn't support packages having
>> multiple directory support.
>
> Whether we agree with it or not, this is something we're being asked
> about...
>
>> With that said see below..
>>
>>> Signed-off-by: Ronan Le Martret <ronan@fridu.net>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>>> index 0a32b3e..eecfcb2 100644
>>> --- a/meta/classes/package_rpm.bbclass
>>> +++ b/meta/classes/package_rpm.bbclass
>>> @@ -185,7 +185,7 @@ python write_specfile () {
>>>                    if not len(depends_dict[dep]):
>>>                        array.append("%s: %s" % (tag, dep))
>>>
>>> -    def walk_files(walkpath, target, conffiles):
>>> +    def walk_files(walkpath, target, conffiles, dirfiles):
>>>            # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
>>>            # when packaging. We just ignore these files which are created in
>>>            # packages-split/ and not package/
>>> @@ -196,11 +196,24 @@ python write_specfile () {
>>>                path = rootpath.replace(walkpath, "")
>>>                if path.endswith("DEBIAN") or path.endswith("CONTROL"):
>>>                    continue
>>> -            for dir in dirs:
>>> -                if dir == "CONTROL" or dir == "DEBIAN":
>>> -                    continue
>>> -                # All packages own the directories their files are in...
>>> -                target.append('%dir "' + path + '/' + dir + '"')
>>> +
>>> +            # Directory handling can happen in two ways, either DIRFILES is not set at all
>>> +            # in which case we fall back to the older behaviour of packages owning all their
>>> +            # directories
>>> +            if dirfiles is None:
>>
>> So if dirfiles is none (the normal case) it -will- package directories, correct?
>>    So what happens when you have a recipe that you don't want to package any
>> directories?
>
> If DIRFILES is not set, you get the current behaviour, importantly, this
> means existing code continues to work as is. My biggest concern with
> some other proposals out there is that they need a flag day complete
> with breakage :/.
>
>> Having to define dirfiles seems to be backwards to me.  A blacklist behavior
>> seems more sane, as a way to say "I use this, but I don't own it."
>
> This is the explicit verses implicit argument. With implicit the risk is
> things change and you don't notice so there is an argument for this
> working the other way for that reason. I have to admit I don't have a
> strong preference, I do know we have people already using it as defined
> by the code above though.
>
>> Along those lines (blacklist vs include list), the system directories should
>> already be defined in the meta/files/fs-perms.txt (or related perms files
>> configured by "FILESYSTEM_PERMS_TABLES".
>>
>> The purpose is to capture system directories that are shared between different
>> recipes to ensure they have the same permissions.
>>
>> It should be possible to (safely) extend this to include additional common
>> permissions [might violate SMACK security] or directories that should not be
>> packaged because they are 'system' directories.
>>
>> (Note in the later case, we definitely need at least one 'directory owner'
>> package to handle those -- or they will be generated on demand with default
>> system permissions of 0755 root,root  -- which is not always what is desired!)
>
> Going back in time, I remember us specifically talking about directory
> ownership and how we likely should try and reach a point where the
> common system directories do become owned by specific packages. With
> this kind of DIRFILES support we could move in the direction. The perms
> tables obviously help to a point ensuring consistent permissions but
> they don't help the ownership problem. Or is this less of an issue since
> we last discussed it (which admittedly was a while ago)?

No there is currently nothing that says I exclusively own a directory (or link). 
  The fs-perms.txt could be extended to do this (in a transparent way).

My concern with the DIRFILES as it appears to be implemented can be shown in the 
existing example:

I create a new recipe that writes:

/etc/foo.conf
/usr/bin/foo

(that's it)


In the SMACK case, the /etc and /usr/bin directories shouldn't be included.. so 
how do we define DIRFILES?  If it's blank, they'll be included.. but we don't 
have any directories to set it to... so do we need to do:
    DIRFILES = "something_random_so_it_works"

That seems very counter intuitive to me.

This is why I'm suggesting an inverse relationship..  We include everything 
other then explicitly listed directories.  That way the user can globally define 
/etc, /usr/bin, ... and individual recipes can augment this with their own 
custom values if appropriate.

and in the default (oe-core) case no change means the directories will continue 
to be included -- no flag days required.

--Mark

>>> +                for dir in dirs:
>>> +                    if dir == "CONTROL" or dir == "DEBIAN":
>>> +                        continue
>>> +                    # All packages own the directories their files are in...
>>> +                    target.append('%dir "' + path + '/' + dir + '"')
>>> +            else:
>>> +                # packages own only empty directories or explict directory.
>>> +                # This will prevent the overlapping of security permission.
>>> +                if path and not files and not dirs:
>>> +                    target.append('%dir "' + path + '"')
>>> +                elif path and path in dirfiles:
>>> +                    target.append('%dir "' + path + '"')
>>> +
>>>                for file in files:
>>>                    if file == "CONTROL" or file == "DEBIAN":
>>>                        continue
>>> @@ -311,6 +324,9 @@ python write_specfile () {
>>>            bb.data.update_data(localdata)
>>>
>>>            conffiles = (localdata.getVar('CONFFILES', True) or "").split()
>>> +        dirfiles = localdata.getVar('DIRFILES', True)
>>> +        if dirfiles is not None:
>>> +            dirfiles = dirfiles.split()
>>
>> (tabs and spaces mismatch? or just a mailer issue mangling spacing?)
>
> I probably mangled the patch somehow, will check...
>
> Cheers,
>
> Richard
>


