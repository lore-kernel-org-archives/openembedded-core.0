Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4FF7E543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 16:28:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x72GRuUW007556
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Aug 2019 09:28:06 -0700
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 2 Aug 2019 09:27:45 -0700
To: Seebs <seebs@seebs.net>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
Date: Fri, 2 Aug 2019 11:27:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190801185725.139cfa73@seebsdell>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Fri, 02 Aug 2019 16:28:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It took a while to narrow this down to a concise test case, and I am not exactly sure what is going on in pseudo.  The C app is created based on mimicking exactly the python code that causes the failure, so that bitbake can be entirely removed from the picture.

If you use the master branch of pseudo with the C app below, it will something like the following but with a different owner uid if yours is not 5002.

===
Test 1 good
Test 2 good
Test 3 good
Test 4 good
Test 5 failed... tlink is owned by 5002 and not 0
===


The sequence of openat() followed by an fstat() on the opened file handle, will erase the pseudo uid entry for the symlink, as shown by the following lstat() in test 5. The culprit appears to be the fstat(), but it could be something much more complex than that...  The next step is to figure out why the recent change to openat() to address test case 1, caused this new problem.


==== test case app.c ====

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>
#include <unistd.h>
#include <fcntl.h>

int main()
{
     /* Tested with: gcc -Wall -o app app.c ; pseudo ./app */
     system("rm -rf tdir tlink");
     system("mkdir tdir");
     system("ln -s tdir tlink");
     DIR *dir = opendir(".");
     int dfd = dirfd(dir);

     int target_dfd = openat (dfd, "tlink", O_RDONLY | O_NONBLOCK | O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
     if (target_dfd == -1) {
         printf("Test 1 good\n");
     } else {
         printf("Test 1 failed\n");
		close(target_dfd);
     }
	target_dfd = openat (dfd, "tlink", O_RDONLY | O_NONBLOCK | O_DIRECTORY | O_CLOEXEC);
     if (target_dfd == -1) {
         printf("Test 2 failed\n");
     } else {
         printf("Test 2 good\n");
		close(target_dfd);
     }
	/* Test 3 make sure the owner of the link is root  */
	struct stat sbuf;
	if (!lstat("tlink", &sbuf) && sbuf.st_uid == 0) {
		printf("Test 3 good\n");
	} else {
		printf("Test 3 failed\n");
	}
	/* Test 4 tests open with the "rb" flag, owner should not change */
	int ofd = openat(dfd,"./tlink", O_RDONLY|O_CLOEXEC);
	if (ofd >= 0) {
		if (fstat(ofd, &sbuf) != 0)
			printf("ERROR in fstat test 4\n");
		else if (sbuf.st_uid == 0)
			printf("Test 4 good\n");
		close(ofd);
	} else {
		printf("Test 4 failed with openat()\n");
	}
	/* In pseudo, after the fstat above, it seems the db is corrupted */
	if (!lstat("tlink", &sbuf) && sbuf.st_uid == 0)
         printf("Test 5 good\n");
	else
         printf("Test 5 failed... tlink is owned by %i and not 0\n", sbuf.st_uid);

     return 0;
}



On 8/1/19 6:57 PM, Seebs wrote:
> On Thu, 1 Aug 2019 16:37:26 -0500
> Jason Wessel <jason.wessel@windriver.com> wrote:
> 
>> It seems to have caused really odd problems with the oe link
>> management that were not there previously, such as:
>>
>>
>> WARNING: pinentry-1.1.0-r0 do_package_qa: QA Issue:
>> pinentry: /usr/bin/pinentry is owned by uid 5002, which is the same
>> as the user running bitbake. This may be due to host contamination
>> [host-user-contaminated]
>>
>> I'll continue to look into the problem.
> 
> There's a possibility that the right flag is something like
> 	(flags&O_NOFOLLOW)&&!(flags&O_PATH)
> 
> or something like that. There's a handful of references to this in
> wrapfuncs.in in ports/unix and ports/linux.
> 
> -s
> 


