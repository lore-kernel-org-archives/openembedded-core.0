Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B464B6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 14:29:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6VETbjd011725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 07:29:37 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 31 Jul 2013 07:29:35 -0700
Message-ID: <51F91F4F.9040707@windriver.com>
Date: Wed, 31 Jul 2013 09:29:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1375177516-9199-1-git-send-email-mihai.prica@intel.com>
	<51F7D42E.2010802@linux.intel.com>
	<97BD068FB200C44AA73C2B641F162ECF15E7FD67@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF15E7FD67@IRSMSX101.ger.corp.intel.com>
Subject: Re: [PATCH] makedevs: Change numeric user/group ids to user/group names in device table
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
X-List-Received-Date: Wed, 31 Jul 2013 14:29:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/13 7:14 AM, Prica, Mihai wrote:
>> -----Original Message-----
>> From: Saul Wold [mailto:sgw@linux.intel.com]
>> Sent: Tuesday, July 30, 2013 5:57 PM
>> To: Prica, Mihai
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] makedevs: Change numeric user/group ids to
>> user/group names in device table
>>
>> On 07/30/2013 02:45 AM, Mihai Prica wrote:
>>> Full usernames and groupnames should be used instead  of numeric ids
>>> in meta/files/device_table-minimal.txt.
>>>
>>
>> I think this will uses the host's files not the target's rootfs, please verify this.
>>
>> Thanks
>> 	Sau!
>
> I used strace and it seems it tries to use the files on the rootfs but they don't exist
> when the check is done so the files on the host are used instead. The base-passwd
> package which installs the /etc/passwd and /etc/group files is installed latter in the
> rootfs generation process. I'll search for a solution to this problem or for another
> approach.

The pseudo environment is configured to look in the sysroot's /etc for those 
files.  If they don't exist it's only alternative is to fall back to the system.

If something needs access to the the name -> number resolution before 
/etc/passwd,/etc/group are installed - then I think we have a missing dependency 
(automatic or otherwise).

As far as I can tell, we should never have a situation where the (target) 
passwd/group are not available to pseudo for local resolution.

We might need to add the installation of those files as a base system dependency.

--Mark

> Thanks,
> Mihai
>>
>>
>>> [YOCTO #1159]
>>>
>>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>>> ---
>>>    meta/files/device_table-minimal.txt                |   47 ++++++++++----------
>>>    .../makedevs/makedevs-1.0.0/makedevs.c             |   23 ++++++++--
>>>    2 files changed, 43 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/meta/files/device_table-minimal.txt
>>> b/meta/files/device_table-minimal.txt
>>> index 02ed534..41c6e0b 100644
>>> --- a/meta/files/device_table-minimal.txt
>>> +++ b/meta/files/device_table-minimal.txt
>>> @@ -1,5 +1,5 @@
>>> -#<path>	<type> <mode>	<uid>	<gid>	<major>	<minor>
>> 	<start>	<inc>	<count>
>>> -#/dev/mem    c      640      0       0       1       1       0        0        -
>>> +#<path>	<type> <mode>	<username>	<groupname>	<major>
>> 	<minor>	<start>	<inc>	<count>
>>> +#/dev/mem    c      640      root       root       1       1       0        0        -
>>>    #
>>>    #type can be one of:
>>>    #    f	A regular file
>>> @@ -8,24 +8,25 @@
>>>    #    b	Block special device file
>>>    #    p	Fifo (named pipe)
>>>
>>> -/dev		d	755	0	0	-	-	-	-	-
>>> -/dev/initctl	p	600	0	0	-	-	-	-	-
>>> -/dev/apm_bios	c	660	0	46	10	134	-	-
>> 	-
>>> -/dev/fb0	c	600	0	0	29	0	-	-	-
>>> -/dev/hda	b	660	0	6	3	0	-	-	-
>>> -/dev/hda	b	660	0	6	3	1	1	1	19
>>> -/dev/kmem	c	640	0	15	1	2	-	-	-
>>> -/dev/kmsg	c	600	0	0	1	11	-	-	-
>>> -/dev/mem	c	640	0	15	1	1	-	-	-
>>> -/dev/null	c	666	0	0	1	3	-	-	-
>>> -/dev/ram	b	640	0	0	1	0	0	1	4
>>> -/dev/tty	c	662	0	5	5	0	-	-	-
>>> -/dev/tty	c	666	0	5	4	0	0	1	9
>>> -/dev/ttyS	c	640	0	5	4	64	0	1	1
>>> -/dev/ttySA	c	640	0	5	204	5	0	1	1
>>> -/dev/zero	c	644	0	0	1	5	-	-	-
>>> -/dev/mtd	c	660	0	6	90	0	0	2	8
>>> -/dev/mtdblock	b	640	0	0	31	0	0	1
>> 	8
>>> -/dev/console	c	662	0	5	5	1	-	-
>> 	-
>>> -/dev/random	c	644	0	0	1	8	-	-
>> 	-
>>> -/dev/urandom	c	644	0	0	1	9	-	-
>> 	-
>>> +/dev		d	755	root	root	-	-	-	-
>> 	-
>>> +/dev/initctl	p	600	root	root	-	-	-	-	-
>>> +/dev/apm_bios	c	660	root	plugdev	10	134	-
>> 	-	-
>>> +/dev/fb0	c	600	root	root	29	0	-	-	-
>>> +/dev/hda	b	660	root	disk	3	0	-	-	-
>>> +/dev/hda	b	660	root	disk	3	1	1	1	20
>>> +/dev/kmem	c	640	root	kmem	1	2	-	-	-
>>> +/dev/kmsg	c	600	root	root	1	11	-	-	-
>>> +/dev/mem	c	640	root	kmem	1	1	-	-	-
>>> +/dev/null	c	666	root	root	1	3	-	-	-
>>> +/dev/ram	b	640	root	root	1	0	0	1	4
>>> +/dev/tty	c	662	root    tty	5	0	-	-	-
>>> +/dev/tty	c	666	root	tty	4	0	0	1	9
>>> +/dev/ttyS	c	640	root	tty	4	64	0	1	1
>>> +/dev/ttySA	c	640	root	tty	204	5	0	1	1
>>> +/dev/zero	c	644	root	root	1	5	-	-	-
>>> +/dev/mtd	c	660	root	disk	90	0	0	2	8
>>> +/dev/mtdblock	b	640	root	root	0	31	0	0
>> 	1	8
>>> +/dev/console	c	662	root	root	5	1	-	-
>> 	-
>>> +/dev/random	c	644	root	root	1	8	-	-
>> 	-
>>> +/dev/urandom	c	644	root	root	1	9	-	-
>> 	-
>>> +
>>> diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
>>> b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
>>> index 6c1f2fb..26bbe33 100644
>>> --- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
>>> +++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
>>> @@ -13,6 +13,8 @@
>>>    #include <libgen.h>
>>>    #include <sys/types.h>
>>>    #include <sys/stat.h>
>>> +#include <pwd.h>
>>> +#include <grp.h>
>>>
>>>    #define MINORBITS	8
>>>    #define MKDEV(ma,mi)	(((ma) << MINORBITS) | (mi))
>>> @@ -180,13 +182,15 @@ static void add_new_fifo(char *name, char *path,
>> unsigned long uid,
>>>    */
>>>    static int interpret_table_entry(char *line)
>>>    {
>>> -	char *name;
>>> -	char path[4096], type;
>>> +	char *name;
>>> +	char path[4096], username[32], groupname[32], type;
>>>    	unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
>>>    	unsigned long start = 0, increment = 1, count = 0;
>>> +	struct passwd *pw;
>>> +	struct group *gr;
>>>
>>> -	if (0 > sscanf(line, "%40s %c %lo %lu %lu %lu %lu %lu %lu %lu", path,
>>> -		    &type, &mode, &uid, &gid, &major, &minor, &start,
>>> +	if (0 > sscanf(line, "%40s %c %lo %s %s %lu %lu %lu %lu %lu", path,
>>> +		    &type, &mode, &username, &groupname, &major, &minor,
>> &start,
>>>    		    &increment, &count))
>>>    	{
>>>    		return 1;
>>> @@ -198,6 +202,17 @@ static int interpret_table_entry(char *line)
>>>    	name = xstrdup(path + 1);
>>>    	sprintf(path, "%s/%s", rootdir, name);
>>>
>>> +	pw = getpwnam(username);
>>> +	if (pw == NULL) {
>>> +		error_msg_and_die("Username does not exist in the user
>> database");
>>> +	}
>>> +	uid = pw->pw_uid;
>>> +	gr = getgrnam(groupname);
>>> +	if (gr == NULL) {
>>> +		error_msg_and_die("Groupname does not exist in the group
>> database ");
>>> +	}
>>> +	gid = gr->gr_gid;
>>> +
>>>    	switch (type) {
>>>    	case 'd':
>>>    		mode |= S_IFDIR;
>>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


