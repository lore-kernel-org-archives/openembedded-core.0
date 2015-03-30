Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DFE173C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 15:14:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t2UFEb0t029367
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Mar 2015 08:14:37 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 08:14:37 -0700
Message-ID: <5519685C.6000703@windriver.com>
Date: Mon, 30 Mar 2015 10:14:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ed Bartosh
	<ed.bartosh@linux.intel.com>
References: <1427704212-1179-1-git-send-email-ed.bartosh@linux.intel.com>
	<1427705624.14020.244.camel@linuxfoundation.org>
In-Reply-To: <1427705624.14020.244.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs.py: Remove rpm database from staging area
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
X-List-Received-Date: Mon, 30 Mar 2015 15:14:43 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/30/15 3:53 AM, Richard Purdie wrote:
> On Mon, 2015-03-30 at 11:30 +0300, Ed Bartosh wrote:
>> Rpm database in staging area is used only by createrepo.
>> createrepo fails with the error
>> "rpmdb: BDB0060 PANIC: fatal region error detected"
>> if rpm database is broken from the previous run of createrepo.
>>
>> Removing the databae before running createrepo can hopefully
>> prevent this failure to happen.
>>
>> [YOCTO #6571]
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> ---
>>  meta/lib/oe/rootfs.py | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index 4e4e6eb..9f7dc65 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -306,6 +306,9 @@ class RpmRootfs(Rootfs):
>>              bb.utils.remove(self.image_rootfs, True)
>>          else:
>>              self.pm.recovery_packaging_data()
>> +        dbpath = os.path.join(self.d.getVar('STAGING_DIR_NATIVE', True),
>> +                              'var/lib/rpm/*')
>> +        bb.utils.remove(dbpath, recurse=True)
>>          bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
>>  
>>          self.pm.crea
> 
> This patch helps me see the problem a lot. I'd never realised there was
> an rpm database in the native sysroot that was getting corrupted, I'd
> always assumed it was the target rootfs one.
> 
> I'm a little worried about what happens if you have multiple images
> generating at the same time as this change as above may delete something
> being worked on by another process.
> 
> I'm wondering why is it getting into the sysroot at all? Rather than
> delete it here, could we either not generate it at all, or place it
> somewhere in WORKDIR (so that other tasks can't see it or race against
> it)?

I did some quick looking.  It appears (at least on first glance) that the call to:

rpm.TransactionSet()

is what is opening the DB.  It appears to me that we can change the call
slightly, and it should do what is being requested:

    { "TransactionSet", (PyCFunction) rpmts_Create, METH_VARARGS|METH_KEYWORDS,
"rpm.TransactionSet([rootDir, [db]]) -> ts\n\
- Create a transaction set.\n" },

So transaction set takes two arguments, the rootDir of the thing we're working
against, and a DB path.  It -should- be as simply as setting a rootDir to the
WORKDIR.  If that doesn't work, then both arguments will be needed.

I'd suggest just adding a "--root" option to genpkgmetadata.py in the
createrepo, and maybe a "--dbpath" option as well (second argument).  Then only
call the function with their values IF they were defined. I.e.

if root:
  if dbpath:
    self.ts = rpm.TransactionSet(root, dbpath)
  else:
    self.ts = rpm.TransactionSet(root)
else:
  self.ts = rpm.TransactionSet()

(If there is a better way to do that in python, fine.. but passing in "None" or
"" won't result in the desired behavior.. since RPM is actually parsing
arguments and appears like it will use the values if passed in, whatever they are.)

--Mark

> Cheers,
> 
> Richard
> 


