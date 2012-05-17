Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SUzZg-0004bD-7A
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 14:12:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4HC2WfH021782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 May 2012 05:02:32 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 May 2012 05:02:32 -0700
Message-ID: <4FB4E8D7.2020808@windriver.com>
Date: Thu, 17 May 2012 07:02:31 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337162056.git.xiaofeng.yan@windriver.com>
	<a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
	<4FB38961.2000702@linux.intel.com> <4FB45BEF.6070204@windriver.com>
In-Reply-To: <4FB45BEF.6070204@windriver.com>
X-Enigmail-Version: 1.4.1
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q4HC2WfH021782
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] ncurses: Disable parallel make
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
X-List-Received-Date: Thu, 17 May 2012 12:12:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 05/16/2012 09:01 PM, Xiaofeng Yan wrote:
> On 2012=E5=B9=B405=E6=9C=8816=E6=97=A5 19:02, Saul Wold wrote:
>> On 05/16/2012 01:10 PM, xiaofeng.yan@windriver.com wrote:
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>
>>> Ncurses failure non-gplv3 build by race issue. So disable parallel \
>>> make when building this package.
>>>
>> This is not the best approach as you disable PARALLEL_MAKE for both=20
>> non-gplv3 and gplv3 versions. Further, we want to get rid of [M1]=20
>> setting as much as possible, so this patch is not helping that.
>>
>> Did you try running on a large many core machine? It might help if you=
=20
>> have some other builds going also to stress the machine.
>>
>> Sau!
> Thanks for your reply. The most cores I have are eight. I also set=20
> PARALLEL_MAKE=3Dj1000 and 10000. I think I need try to find new way for=
=20
> fixing bugs.
>=20

Do you have an error file from a failed build (and ideally the failed bui=
ld directory)?  Having diagnosed many problems like this in the past, it =
is easiest to look for the failure case and add some sleep statement in t=
he Makefile to get it to trigger every time in the same way.=20

The two most common problems are:
  1) autoconf re-runs due to time stamps or partially patched files
  2) a generated file is reported as missing

In the first case it, it will often be some error with a .h missing or so=
me other strange error about a header in the compilation and it is a resu=
lt of only having a partial file because it is getting regenerated at the=
 time.

In the second case you just find the file's rule in the Makefile and add =
an if statement in the Make target goal if it is a multi-object rule to l=
ook for the problem object and sleep a bit.  I have yet to see a case I c=
ouldn't reproduce the results by following the strategy of some forcing s=
ome extra delay.  You probably won't have to go to this length, but there=
 was one time I even wrote a C wrapper around a command to add some sleep=
 controlled by an environment variable to prove config.h was getting remo=
ved and regenerated.   Example:

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *const argv[]) {
   char *lookfor;
   if (argc >=3D 2) {=20
     lookfor =3D getenv("LOOKFORSLEEP");
     if (lookfor && strcmp(argv[1], lookfor) =3D=3D 0) {
         if (argc >=3D 3 && strcmp(argv[2], "config.h") =3D=3D 0) {
            unlink("config.h");
            printf("Special sleep on command %s\n", lookfor);
            sleep(2);
         }
     }
   }
   execv("/bin/sh", argv);
   return 0;
}


Best of luck,
Jason.


