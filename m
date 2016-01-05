Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB106010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:32:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u05EWe29028898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 5 Jan 2016 06:32:45 -0800
Received: from Marks-MacBook-Pro.local (147.11.119.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Jan 2016 06:32:39 -0800
To: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>, Matthias Schiffer
	<mschiffer@universe-factory.net>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
	<568A9E97.2050909@windriver.com>
	<568AF189.5010801@universe-factory.net>
	<568AF894.1010405@windriver.com>
	<568B06D3.7030205@universe-factory.net>
	<568B0E13.6090108@windriver.com>
	<568B1BB5.7060303@universe-factory.net>
	<30E719D66AEA914CBB7DAB303B1C722DB4A8F9@BUDURBPA09.e2k.ad.ge.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <568BD429.9040003@windriver.com>
Date: Tue, 5 Jan 2016 08:33:13 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <30E719D66AEA914CBB7DAB303B1C722DB4A8F9@BUDURBPA09.e2k.ad.ge.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Tue, 05 Jan 2016 14:32:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 1/5/16 8:04 AM, Ray, Ian (GE Healthcare) wrote:
> On 01/05/2016 03:26 AM, Matthias Schiffer wrote:
>> On 01/05/2016 01:28 AM, Mark Hatle wrote:
>>> On 1/4/16 5:57 PM, Matthias Schiffer wrote:
>>>> On 01/04/2016 11:56 PM, Mark Hatle wrote:
>>>>> On 1/4/16 4:26 PM, Matthias Schiffer wrote:
>>>>>> On 01/04/2016 05:32 PM, Mark Hatle wrote:
>>>>>>> On 1/4/16 10:11 AM, Matthias Schiffer wrote:
>>>>>>>> On 01/04/2016 02:14 PM, Ian Ray wrote:
>>>>>>>>> The recipe uses hard-coded paths (specifically /lib) in do_install
>>>>>>>>> and in FILES, however on a merged /usr system this directory might
>>>>>>>>> not exist. Prefer base_libdir.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>>>>>>>> ---
>>>>>>>>
>>>>>>>> This should use nonarch_base_libdir, base_libdir defaults to /lib64 on
>>>>>>>> ppc64, which is not where the firmware is expected.
>>>>>>>>
>>>>>>>
>>>>>>> At a minimum, I would agree nonarch_base_libdir, however..
>>>>>>>
>>>>>>> I believe that the kernel loader/modules/tools themselves actually have '/lib'
>>>>>>> hard coded into them.  This is the reason why /lib/firmware was used and not one
>>>>>>> of the variables.
>>>>>>>
>>>>>>> This is one of the cases were /lib is actually correct, since that is what the
>>>>>>> system is expecting.  We can make some kind of accommodation for systems where
>>>>>>> /lib -> /usr/lib... but that should be done inside of the filesystem setup
>>>>>>> processing and not the package itself.  (I'm referring to the
>>>>>>> 'meta/files/fs-perms.txt' file.
>>>>>>>
>>>>>>> --Mark
> 
> Ah, that makes sense.
> 
> <snip>
> 
>>> You conditionalize it by providing different default fs-perms files -- OR since
>>> more then one file can be loaded -- additional fs-perms with the permutations
>>> you desire.
>>>
>>> I could easily see having an files/fs-perms-usr-only.txt and an
>>> files/fs-perms-no-usr.txt
>>>
>>> Where the first would be something like:
>>>
>>> # Define symlinks from base directories to their prefix versions
>>> /bin	link ${bindir}
>>> /sbin	link ${sbindir}
>>> ...
> 
> This is very interesting -- thank you.
> 
> I tried patching our additional fs-perms file as Mark suggested. This resulted in
> a build failure during packaging of a recipe. The package directory looks odd:
> 
> ls -l /home/ian/myproduct/build/tmp/work/myproduct-linux-gnueabi/
> myrecipe/4.3-r0/package
> total 4
> drwxr-xr-x. 2 ian ian 4096 Jan  5 11:30 boot
> drwxr-xr-x. 4 ian ian   56 Jan  5 11:30 etc
> lrwxrwxrwx. 1 ian ian    8 Jan  5 11:33 lib -> /usr/lib
> drwxr-xr-x. 3 ian ian   16 Jan  5 11:33 usr

We should look into this further.  Pseudo (the fakeroot wrapper) should be
changing '/usr/lib' [in the cross build filesystem] to a relative path... It
will only be '/usr/lib' in the target version if we're in the pseudo environment
or the translation is off.  (Maybe I'm remembering incorrectly, but that was my
memory.)

> This can be fixed by teaching classes/package.bbclass to _not_ use the leading
> slash when making the link. Not sure if that is unacceptably hacky? But it must
> be better than leaking to host filesystem.
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a86b680..59ef447 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -774,6 +774,7 @@ python fixup_perms () {
>          link = fs_perms_table[dir].link
>          if link[0] == "/":
>              target = dvar + link
> +            link = link[1:]
>              ptarget = link
>          else:
>              target = os.path.join(os.path.dirname(origin), link)

I'm definitely interested in understanding what may or may not be working
properly here.

> Once past that problem there is a QA problem since do_package now installs
> to /usr/lib (because of fs-perms) instead of /lib which is mentioned in FILES.

What was the QA issue?  About the absolute path name or something else?

> Joshua's patches for merged /usr touched FILES in _some_ cases (for example
> 73a6fe958f47642d18ba0098cfd45c3520d53560) but linux-firmware would require
> considerably more effort. Is that an argument in favour of nonarch_base_libdir
> instead of literal "/lib" or is there some other technique to address this?

For linux-firmware specifically.. we need to make sure the kernel and modules
(which use the firmware) use the same filesystem notion as what the
linux-firmware package is doing.  In the past when I've looked, pretty much
everything was just hardcoded as '/lib/firmware'.  So using that in the
packaging was correct for all three systems.  (I don't believe patching the
three to use bitbake variables is necessarily a good idea -- since I'm sure
there are more instances of this type of usage that I'm unaware of.)

This is where using the fs-perms mechanism to move the files and setup the
symlink is the right approach in my opinion.  The key thing is figuring out the
permutations of the libdir, nonarch libdir (since they may or may not be the
same) and dealing with any QA errors that may occur.

> Ian
> 


