Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7D9736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:47:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t2VLlb4B016925
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 31 Mar 2015 14:47:37 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Tue, 31 Mar 2015 14:47:37 -0700
Message-ID: <551B15F8.5090300@windriver.com>
Date: Tue, 31 Mar 2015 16:47:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Mario Domenech Goulart <mario@ossystems.com.br>
References: <87d23uibxw.fsf@email.parenteses.org>	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>	<87wq1xgk2j.fsf@email.parenteses.org>
	<551AE604.6090804@windriver.com>	<87oan8hpp6.fsf@email.parenteses.org>
	<551B08E6.8040906@windriver.com>	<87k2xwhoei.fsf@email.parenteses.org>
	<551B0D16.8000608@windriver.com>
	<87d23ohngp.fsf@email.parenteses.org>
In-Reply-To: <87d23ohngp.fsf@email.parenteses.org>
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
X-List-Received-Date: Tue, 31 Mar 2015 21:47:39 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 3/31/15 4:21 PM, Mario Domenech Goulart wrote:
> On Tue, 31 Mar 2015 16:09:42 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
> 
>> On 3/31/15 4:01 PM, Mario Domenech Goulart wrote:
>>> On Tue, 31 Mar 2015 15:51:50 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
>>>
>>>> On 3/31/15 3:33 PM, Mario Domenech Goulart wrote:
>>>>>
>>>>> On Tue, 31 Mar 2015 13:23:00 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>>
>>>>>> On 3/31/15 12:20 PM, Mario Domenech Goulart wrote:
>>>>>>>
>>>>>>> On Tue, 31 Mar 2015 14:50:06 +0100 "Burton, Ross" <ross.burton@intel.com> wrote:
>>>>>>>
>>>>>>>> On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br> wrote:
>>>>>>>>
>>>>>>>>     Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
>>>>>>>>     the recipe, ./usr/lib/foo/ in the package is owned by root.
>>>>>>>>     However, its content has the right ownership.
>>>>>>>>
>>>>>>>> Looks like a bug in pseudo to me, can you file a bug for that?
>>>>>>>
>>>>>>> Sure.  Filed #7554.
>>>>>>
>>>>>> I'd suggest you look at meta/classes/package.bbclass "fixup_perms" function.
>>>>>>
>>>>>> The ${D}${libdir} (and above) are "corrected" to be 'root:root' by this
>>>>>> function.  I don't know why 'foo' would be, but if it's a standard defined
>>>>>> variable -- or if 'directory walking' is enabled it could end up doing this as well.
>>>>>>
>>>>>> The control file for this is in meta/files/fs-perms.txt (unless otherwise
>>>>>> defined by a distribution or other configuration file.)
>>>>>
>>>>> Thanks a lot.  You seem to have guided me exactly to what causes the
>>>>> issue.
>>>>>
>>>>>>
>>>>>> Format of the file is:
>>>>>>
>>>>>> # The format of this file
>>>>>> #
>>>>>> #<path> <mode>  <uid>   <gid>   <walk>  <fmode> <fuid>  <fgid>
>>>>> ...
>>>>>>
>>>>>> The default is:
>>>>> ...
>>>>>> libexecdir	0755 root root false - - -
>>>>> ...
>>>>>
>>>>> This variable seems to be the cause of problems:
>>>>>
>>>>> $ bitbake -e foo | grep libexecdir=
>>>>> export libexecdir="/usr/lib/foo"
>>>>>
>>>>> As far as I understand, package.bbclass may use a user-configured
>>>>> permissions table (via FILESYSTEM_PERMS_TABLES), but I'm not sure if
>>>>> this is the right "fix" for the case in question.  I'd have to hardcode
>>>>> the owner of /usr/lib/foo to be "foo", but foo may not be available when
>>>>> packaging other recipes.
>>>>
>>>> Ok, good this answers the question as to "why" it's happening.  You can easily
>>>> fix this by adding a configuration specific fs-perms.txt file (can name it
>>>> anything) that overrides that setting and add it to the FILESYSTEM_PERMS_TABLES.
>>>>  You can do this globally in a layer, a distribution or even just a recipe.
>>>>
>>>> In your recipe you can likely do something like:
>>>>
>>>> FILESYSTEM_PERMS_TABLES ?= "files/fs-perms.txt"
>>>> FILESYSTEM_PERMS_TABLES += "${THISDIR}/files/recipe-perms.txt"
>>>>
>>>> (Do the ?= first in case it's already set by someone else, then add your recipe
>>>> specific perms later)
>>>>
>>>> Contents of the "${THISDIR}/files/recipe-perms.txt":
>>>>
>>>> ${libexecdir} 0755 myuid mygid true - myuid mygid
>>>>
>>>> Then you can even skip the chown -R, as the system will do it for you.
>>>
>>> I actually had tried that, but I got errors -- probably because the
>>> ownership will be set for each package that installs ${libexecdir}, and
>>> which is processed before the recipe that actually creates the
>>> user/group specified for ${libexecdir} in the file pointed by
>>> FILESYSTEM_PERMS_TABLES.
>>
>> This is a bug then.  The owner/group correction is supposed to be made AFTER the
>> user/groups have been added to the system (sysroot) via the adduser.  THAT is a
>> bug that IMHO should be fixed sooner, rather then later.
>>
>> It might be as simple as the install sysroot (${D}) configuration with pseudo
>> isn't pointing to the right /etc/passwd and /etc/group.  I believe it should be
>> pointing to the one in the regular sysroot repository.
> 
> I should also have mentioned that initially I set
> FILESYSTEM_PERMS_TABLES globally.
> 
> Now I set it in the foo recipe, but still get errors:
> 
> ----------------------------8<---------------------------------
> ERROR: Error executing a python function in .../foo.bb:
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'fixup_perms', lineno: 231, function: <module>
>      0227:                    each_file = os.path.join(root, f)
>      0228:                    fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
>      0229:
>      0230:
>  *** 0231:fixup_perms(d)
>      0232:
> File: 'fixup_perms', lineno: 173, function: fixup_perms
>      0169:                if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
>      0170:                    msg = "Fixup perms: %s invalid line: %s" % (conf, line)
>      0171:                    package_qa_handle_error("perm-line", msg, d)
>      0172:                    continue
>  *** 0173:                entry = fs_perms_entry(d.expand(line))
>      0174:                if entry and entry.path:
>      0175:                    fs_perms_table[entry.path] = entry
>      0176:            f.close()
>      0177:
> File: 'fixup_perms', lineno: 32, function: __init__
>   File "fixup_perms", line 32, in __init__
> 
> File: 'fixup_perms', lineno: 43, function: _setdir
>   File "fixup_perms", line 43, in _setdir
> 
> File: 'fixup_perms', lineno: 67, function: _procuid
>   File "fixup_perms", line 67, in _procuid
> 
> Exception: KeyError: 'getpwnam(): name not found: foo'
> ---------------------------->8---------------------------------
> 
> I still have the chown line in do_install, and that seems to "work"
> (i.e., it doesn't cause errors).  The error above seems be caused by
> something in do_package (fix_perms, specifically) that is not using the
> proper authentication database.

What is odd, if it's working in do_install, then it should be working in the
package set.

You should probably look at dumping the value of PSEUDO_PASSWD in the do_install
step, and then later in the package.bbclass when it fails.  If it fails we can
compare the values and see what the mismatch might be.

It would be good if you could dump the environment at this point and see where
the password/group file are being sourced from.

Try something like:

                    package_qa_handle_error("perm-line", msg, d)
                    continue
+               try:
+                   entry = fs_perms_entry(d.expand(line))
+               except:
+                   bb.error("debug: PSEUDO_PASSWD = '%s'" %
os.getenv("PSEUDO_PASSWD"))
+                   raise
               if entry and entry.path:
                    fs_perms_table[entry.path] = entry

The code will still "crash", but should print out the value of PSEUDO_PASSWD
first.  I would expect that PSEUDO_PASSWD would be pointing into the
tmp/sysroot/<machine> directory.

--Mark

> Best wishes.
> Mario
> 


